/*
 * FILE: TaskDataExport.cpp
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Feng Bo, 2012-1-5
 *
 * HISTORY: 
 *
 * Copyright (c) 2010 Hummingbird Studio, All Rights Reserved.
 */

#include "Stdafx.h"
#include "TaskDataExport.h"
#include "BaseDataIDMan.h"
#include "TaskTemplMan.h"
#include "EC_MD5Hash.h"
#include <string>
#include "MemCacheClient.h"

static const char* TASK_TEMPL_BASE_PATH = "BaseData\\TaskTemplate\\";

static bool Init()
{
	ATaskTemplMan* pMan = ATaskTemplMan::GetInstance();
	if(g_TaskIDMan.Load("BaseData\\TaskID.dat") != 0)
	{
		ShowMessage(0, "TaskID.dat load failed.");
		return false;
	}

	if (!pMan->LoadTaskIDBitOrderFromText("BaseData\\TaskBitOrder.dat"))
	{
		ShowMessage(0, "TaskBitOrder.dat load failed.");
		return false;
	}

	if (!pMan->LoadTaskGfxInfoFromText(L"BaseData\\TaskGfxInfo.txt"))
	{
		ShowMessage(0, "TaskGfxInfo.txt load failed.");
		return false;
	}

	if (!pMan->LoadTaskSoundInfoFromText(L"BaseData\\TaskSoundInfo.txt"))
	{
		ShowMessage(0, "TaskSoundInfo.txt load failed.");
		return false;
	}

	return true;
}

struct TaskBinCache
{
#pragma pack(1)
	struct Header
	{
		enum { HEADER_END_MAGIC = 0xffffffff };
		unsigned int id;
		unsigned int data_size;
		unsigned int data_version;
		unsigned int timestamp;
		unsigned char hash[16];
		unsigned int end_magic;
	} header;
#pragma pack()

	std::vector<unsigned char> data;	
};

static bool load_binary_cache( unsigned int id, const char* tmplFilePath, TaskBinCache& bin )
{
	using namespace std;
	MemCacheClient* pClient = GetMemCacheClient();
	if(!pClient) return false;

	stringstream ss;
	ss << GetMemCacheKeyPrefix() << ".task." << id;

	MemCacheClient::MemRequest req;

	try
	{
		req.mKey = ss.str();
		if(pClient->Get(req) != 1) return false;
		if(req.mResult != MCERR_OK) return false;

		req.mData.ReadBytes(&bin.header, sizeof(bin.header));
		if(bin.header.end_magic != TaskBinCache::Header::HEADER_END_MAGIC) return false;
		if(bin.header.id != id) return false;
		if(bin.header.data_size <= 0) return false;
		if(bin.header.data_version != ATaskTempl::VERSION_MAGIC) return false;

		std::vector<char> hash;
		if(!GetFileHash(tmplFilePath, hash)) return false;
		if(memcmp(bin.header.hash, &hash[0], sizeof(bin.header.hash)) != 0) return false;

		bin.data.resize(bin.header.data_size);
		req.mData.ReadBytes(&bin.data[0], bin.header.data_size);
		return true;
	}
	catch (const std::exception & e) {
		return false;
	}

	return true;
}

static bool load_binary_data( unsigned int id, const char* tmplFilePath, ATaskTempl* pTempl)
{
	using namespace std;

	if(!pTempl) return false;

	TaskBinCache bin;
	if(!load_binary_cache(id, tmplFilePath, bin)) return false;

	stringstream io(stringstream::binary | stringstream::in | stringstream::out);
	io.write((const char*)&bin.data[0], bin.data.size());
	io.flush();
	io.seekg(0);
	return pTempl->SLBinary(io, SL_LOAD);
}

static bool save_binary_cache( const char* path, ATaskTempl* pTempl )
{
	using namespace std;

	MemCacheClient* pClient = GetMemCacheClient();
	if(!pClient) return true;

	if(!pTempl || !pTempl->GetID()) return false;

	stringstream ss;
	ss << GetMemCacheKeyPrefix() << ".task." << pTempl->GetID();

	stringstream io(stringstream::binary | stringstream::in | stringstream::out);
	if(!pTempl->SLBinary(io, SL_SAVE) || io.fail())
	{
		return false;
	}

	io.flush();
	size_t sz = io.tellp();
	io.seekg(0);
	std::vector<char> buf(sz);
	if(sz > 0)
	{
		io.read(&buf[0], sz);
	}
	
	TaskBinCache::Header header;
	header.id = pTempl->GetID();
	header.data_size = sz;
	header.data_version = ATaskTempl::VERSION_MAGIC;
	header.timestamp = time(0);
	header.end_magic = TaskBinCache::Header::HEADER_END_MAGIC;

	std::vector<char> hash;
	if(!GetFileHash(path, hash)) return false;
	memcpy(header.hash, &hash[0], sizeof(header.hash));

	MemCacheClient::MemRequest req;

	try
	{
		req.mKey = ss.str();

		req.mData.WriteBytes(&header, sizeof(header));
		if(sz > 0)
		{
			req.mData.WriteBytes(&buf[0], sz);
		}
		if(pClient->Set(req) != 1) return false;
		if(req.mResult != MCERR_OK) return false;

		return true;
	}
	catch (const std::exception & e) {
		return false;
	}

	return true;
}

inline bool _IsTopTask(const std::string& path)
{
	return path.substr(path.length() - 4, path.length()) == ".tkt";
}

bool ExportTaskData( const char* szPath )
{
#ifdef _CONSOLE
	printf("Exporting tasks.data to %s...\r\n", szPath);
#endif
	std::string outPath = szPath;

	if(!Init())
	{
		ShowMessage(0, "Init failed when exporting task data.");
		return false;
	}

	ATaskTemplMan* pMan = ATaskTemplMan::GetInstance();

	const BaseDataIDPathMap& map = g_TaskIDMan.GetIDPathMap();
	int i = 0;
	int cached = 0;
	int skipped = 0;
	int sub = 0;
	int error = 0;
	printf("\t(C=cached, S=sub, K=skipped, E=error)\n");
	for (BaseDataIDPathMap::const_iterator it = map.begin(); it != map.end(); ++it, ++i)
	{
#ifdef _CONSOLE
		printf("\tLoading Task:\t%d / %d (C=%d, S=%d, K=%d, E=%d)\r", i + 1, map.size(), cached, sub, skipped, error);
#endif
		std::string path = TASK_TEMPL_BASE_PATH;
		path += it->second;
		unsigned long tid = it->first;

		bool bIsTopTask = _IsTopTask(path);

		if(!bIsTopTask)
		{
			sub++;
			continue;
		}
		if(!FileIsExist(path.c_str()))
		{
			skipped++;
			continue;
		}
		
		ATaskTempl* pTempl = new ATaskTempl;
		if(load_binary_data(tid, path.c_str(), pTempl))
		{
			cached++;
		}
		else
		{
			try
			{
				pTempl->SLText(path.c_str(), SL_LOAD);
			}
			catch ( std::exception& e )
			{
				if ( pTempl->m_sVersionNow > ATaskTempl::VERSION_MAGIC )
				{
					std::ostringstream os;
					os << "Task templ " << tid << " version " << pTempl->m_sVersionNow <<
						" is too new. Try load by lua mode.";
					ShowMessage(0, os.str().c_str());

					pTempl->SLLua(path.c_str(), SL_LOAD);
				}
				else
				{
					std::ostringstream os;
					os << "Error parsing text file, ";
					if( pTempl->m_ID )	os << "task id = " << pTempl->m_ID << " [From .tmpl]";
					else				os << "task id = " << tid << "[From taskid.dat]";
					os << "\n" << e.what();

					ShowMessage(0, os.str().c_str());
					delete pTempl;
					error++;
					continue;
				}
			}
		}

		if (tid != pTempl->GetID())
		{
			ShowMessage(0, "Invalid task id of %s: self id = %d, man id = %d", path.c_str(), pTempl->GetID(), tid);
			delete pTempl;
			error++;
			continue;
		}

		if(!pMan->AddTopTaskTempl(pTempl))
		{
			ShowMessage(0, "Warning: duplicated task id %d, path = %s", pTempl->GetID(), path.c_str());
			delete pTempl;
			continue;
		}

		if(!save_binary_cache(path.c_str(), pTempl))
		{
			ShowMessage(0, "Warning: failed to cache %d, path = %s", pTempl->GetID(), path.c_str());
		}
	}
#ifdef _CONSOLE
	printf("\tLoading Task:\t%d / %d (C=%d, S=%d, K=%d, E=%d)\n", map.size(), map.size(), cached, sub, skipped, error);
	printf("\tSaving...\t\t\r");
#endif

	if (!pMan->CheckBitOrder())
	{
		ShowMessage(0, "ID bit order map check failed.");
		return false;
	}

	if (!pMan->SaveTasksToPack((outPath + "\\tasks.data").c_str()))
	{
		ShowMessage(0, "Failed to save tasks.data");
		return false;
	}

#ifdef _CONSOLE
	printf("\tSaving...\t\tOK\n");
#endif

	return true;
}

/////////////////////////////////////////////////////////////////////////////////
// Some implementation of TaskInterface

unsigned int TaskInterface::GetCurTime() { return 1; }
void TaskInterface::WriteLog(int64_task i64PlayerId,	int nTaskId, int nType, const char* szLog) {}
bool TaskInterface::CalcFileMD5(const char* szFile, unsigned char md5[16])
{
	FILE* fp = fopen(szFile, "rb");

	if (!fp)
		return false;

	fseek(fp, 0, SEEK_END);
	size_t sz = ftell(fp);

	if (sz == 0)
	{
		fclose(fp);
		return false;
	}

	fseek(fp, 0, SEEK_SET);
	char* buf = new char[sz];
	fread(buf, sz, 1, fp);
	fclose(fp);

	PATCH::MD5Hash md5calc;
	md5calc.Update(buf, sz);
	md5calc.Final();

	memcpy(md5, md5calc.GetDigest(), 16);
	delete[] buf;
	return true;
}
