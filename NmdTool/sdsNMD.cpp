/********************************************************************
	created:	2008/05/19
	author:		kuiwu
	
	purpose:	
	Copyright (C) 2008 - All Rights Reserved
*********************************************************************/

#include "StdAfx.h"
#include "sdsNMD.h"
#include <AString.h>
#include <vector.h>
#include <hashtab.h>
#include <A3DMatrix.h>
#include <A3DFuncs.h>
#include <ConvexHullArchive.h>
#include <aabbcd.h>
#include <AF.h>
#include "elementdataman.h"
#include "DataPathMan.h"
#include "AFilePackMan.h"


NmdConfig g_Config;

using namespace CHBasedCD;
//define
typedef abase::vector<CConvexHullData*>    ChdVec;
typedef abase::hashtab<ChdVec, int, abase::_hash_function>	EcmTable;

#define ECMODEL_PROJ_MAGIC (unsigned int) (('e'<<24) | ('c' << 16) | ('b' << 8) | ('p'))
#define ECMODEL_PROJ_VERSION (unsigned int) (0x00000001)


const DWORD NMD_FILE_MAGIC = (DWORD)(('n'<<24)| ('m'<<16)|('d'<<8)|('f'));
const DWORD NMD_FILE_VERSION = 1;

const DWORD ELEMENTDATA_PRG_VERSION = 0;
const DWORD ELEMENTDATA_DAT_VERSION = ELEMENTDATA_VERSION;

//data
elementdataman   g_ElementDataMan;
DataPathMan		 g_DataPathMan;
DataPathMan		 g_DynDataPathMan;
EcmTable		 g_NpcMine(128);
EcmTable		 g_DynObj(128);
const char  *    g_EcpPath = "Models\\ECModelHull";
bool			 g_Verbose	= false;
int				 g_iPackAlgId = 161;
LogFunc			 g_pLogFunc = NULL;

//func
void PrintHelp();
bool Init();
bool OpenPck();
void Release();
void ReleaseChdVec(ChdVec& chdVec);
void ReleaseEcmTab(EcmTable& ecmTab);
bool AddNpc(const NPC_ESSENCE * ess);
bool AddMine(const MINE_ESSENCE * ess);
bool RetrieveEcpPath(const char * ecmPath, AString& ecpPath);
bool AddEcm(const char * path, const char * name, int id, EcmTable& ecmTab);
bool AddEcp(const char * path, const char * name, int id, EcmTable& ecmTab);
bool ImportData();
bool ExportData(const char * path);
void ExportEcmTab(AFile& file, EcmTable& ecmTab);
bool RetrieveConfigInfo(const char * szFilePath);

//////////////////////////////////////////////////////////////////////////



static void Log(LOGTYPE logType, const char* szFmt, ...)
{
	if (!g_pLogFunc)
		return;

	va_list argList;
	va_start(argList, szFmt);

	char szBuffer[512] = {0};
	vsprintf_s(szBuffer, 512, szFmt, argList);	

	g_pLogFunc(logType, szBuffer);
}


bool OpenPck()
{
	const char * pcks[] = 
	{
		"package\\models.pck", "models", 
		NULL
	};
	
	char szFullPath[MAX_PATH] = {0};
	g_AFilePackMan.SetAlgorithmID(g_iPackAlgId);
	int i = 0;
	while (pcks[i])
	{
		sprintf_s(szFullPath, "%s\\%s", g_Config.szGamePath, pcks[i]);
		if (!g_AFilePackMan.OpenFilePackage(szFullPath, pcks[i+1]))
		{
			Log(LOG_ERROR, ("open pck %s failed"), szFullPath);
			return false;
		}
		i+=2;
	}

	return true;
}

bool Init(LogFunc pLogFunc)
{
	g_pLogFunc = pLogFunc;

	af_Initialize();

	af_SetBaseDir(g_Config.szGamePath);

	if (g_Config.bFromPck)
	{
		if (!OpenPck())
			return false;
	}

	return true;
}

void ReleaseChdVec(ChdVec& chdVec)
{
	ChdVec::iterator  it;
	for (it = chdVec.begin(); it != chdVec.end(); ++it)
	{
		delete *it;
	}

	chdVec.clear();
}

void ReleaseEcmTab(EcmTable& ecmTab)
{
	EcmTable::iterator it;
	for (it = ecmTab.begin(); it != ecmTab.end(); ++it)
	{
		ReleaseChdVec(*it.value());
	}
	ecmTab.clear();
}


void Release()
{
	ReleaseEcmTab(g_NpcMine);
	ReleaseEcmTab(g_DynObj);
	af_Finalize();
}

bool RetrieveEcpPath(const char * ecmPath, AString& ecpPath)
{
	const char* szPath = strstr(ecmPath, "\\");
	if (!szPath)
	{
		return false;
	}
	char szProjFile[MAX_PATH];
	strcpy_s(szProjFile, MAX_PATH, g_EcpPath);
	strcat_s(szProjFile, MAX_PATH, szPath);

	char* ext = strrchr(szProjFile, '.');
	if (!ext)
	{
		return false;
	}
	strcpy(ext, ".ecp");

	ecpPath = szProjFile;
	return true;
}


bool AddEcp(const char * path, const char * name, int id, EcmTable& ecmTab)
{
	
	AFileImage file;
	if (!af_IsFileExist(path) || !file.Open(path, AFILE_OPENEXIST | AFILE_BINARY))
	{
		Log(LOG_WARNING, "open %s fail", path);
		return false;
	}
	

	ConvexHullArchive ar;
	if (!ar.LoadHeader(file))
	{
		Log(LOG_WARNING, "%s wrong version", path);
		return false;
	}

	ChdVec   chd_vec;
	for (int i = 0; i < ar.GetNumHull(); i++)
	{		
		CConvexHullData* pHull = new CConvexHullData();
		if (!ar.LoadHull(file, pHull))
		{
			delete pHull;
			Log(LOG_WARNING, "%s hull_%d load failed", path, i);
		}

		if ( (pHull->GetFlags() & CHDATA_SKIP_COLLISION) == CHDATA_SKIP_COLLISION)
		{
			delete pHull;
			Log(LOG_INFO, "skip %s hull_%d, no collision flag", path, i);
			continue;
		}

		if ( pHull->GetFaceNum() == 0)
		{
			delete pHull;
			Log(LOG_INFO, "skip %s hull_%d, zero face", path, i);
			continue;
		}

		// currently, the ECModelHullEditor has turned the model 180 degree which is a mistake,
		// so we have to turn it back before we use it.
		// pHull->Transform(TransformMatrix(A3DVECTOR3(0, 0, -1.0f), A3DVECTOR3(0, 1.0f, 0), A3DVECTOR3(0)));
		chd_vec.push_back(pHull);
	}

	if(!ecmTab.put(id, chd_vec))
	{
		ReleaseChdVec(chd_vec);
		Log(LOG_WARNING, "add %d %s to table, fail", id, name);
		return false;
	}

	return true;
}

bool AddEcm(const char * path, const char * name, int id, EcmTable& ecmTab)
{
	AString ecp_path;
	if (!RetrieveEcpPath(path, ecp_path))
	{
		Log(LOG_WARNING, "retrieve %d %s ecp path from %s, fail", id, name, path);
		return false;
	}

	if (!g_Config.bFromPck)
	{
		ecp_path.Format("%s\\%s", g_Config.szGamePath, AString(ecp_path));
	}
	
	if (!af_IsFileExist(ecp_path))
	{
		Log(LOG_WARNING, "open %s fail", ecp_path);
		return false;
	}

	return AddEcp(ecp_path, name, id, ecmTab);
}

bool AddNpc(const NPC_ESSENCE * ess)
{
	const char * szPath = g_DataPathMan.GetPathByID(ess->file_model);
	
	if (!szPath)
	{
		Log(LOG_WARNING, "npc %d null path", ess->id);
		return false;
	}

	AString name;
	name = WC2AS(ess->name);
	
	if (!AddEcm(szPath, name, ess->id, g_NpcMine))
		return false;

	return true;
}

bool AddMine(const MINE_ESSENCE * ess)
{
	const char * szPath = g_DataPathMan.GetPathByID(ess->file_matter);
	
	if (!szPath)
	{
		Log(LOG_WARNING, "mine %d null path", ess->id);
		return false;
	}

	AString name;
	name = WC2AS(ess->name);
	
	if (!AddEcm(szPath, name, ess->id, g_NpcMine))
		return false;

	return true;
}


bool ImportData()
{
	AString data_path;
	data_path.Format("%s\\data\\elements.data",g_Config.szGamePath);
	

	if (g_ElementDataMan.load_data(data_path) < 0)
	{
		Log(LOG_ERROR, "load %s fail", data_path);
		return false;
	}
	Log(LOG_INFO, "load elementdata from %s", data_path);

	data_path.Format("%s\\data\\path.data", g_Config.szGamePath);
	if (g_DataPathMan.Load(data_path) == 0)
	{
		Log(LOG_ERROR, "load %s fail", data_path);
		return false;
	}
	Log(LOG_INFO, "load pathdata from %s", data_path);

	data_path.Format("%s\\data\\dynamicobjects.data", g_Config.szGamePath);
	if (g_DynDataPathMan.Load(data_path) == 0)
	{
		Log(LOG_ERROR, "load %s fail", data_path);
		return false;
	}
	Log(LOG_INFO, "load dyn from %s", data_path);
	


	DATA_TYPE DataType = DT_INVALID;
	int tid = g_ElementDataMan.get_first_data_id(ID_SPACE_ESSENCE, DataType);

	int nTotalNpc = 0;
	int nTotalMine = 0;
	int nNpcImport = 0;
	int nMineImport = 0;
	while (tid)
	{
		const void* pData = g_ElementDataMan.get_data_ptr(tid, ID_SPACE_ESSENCE, DataType);

		if (DataType == DT_NPC_ESSENCE)
		{
			nTotalNpc++;
			const NPC_ESSENCE* pNpcEss = (const NPC_ESSENCE*)pData;
			if (AddNpc(pNpcEss))
				nNpcImport++;
		}
		else if (DataType == DT_MINE_ESSENCE)
		{
			nTotalMine++;
			const MINE_ESSENCE * pMineEss = (const MINE_ESSENCE*)pData;
			if (AddMine(pMineEss))
				nMineImport++;
		}
		//	Get next item
		tid = g_ElementDataMan.get_next_data_id(ID_SPACE_ESSENCE, DataType);
	}

	DataPathMan::DataMap& pathMap = g_DynDataPathMan.GetDataMap();
	DataPathMan::DataMap::const_iterator it;
	for (it = pathMap.begin(); it != pathMap.end(); ++it)
	{
		const	AString& path = it->second;
		unsigned int id = it->first;
		AddEcm(path, "dyn", id, g_DynObj);
	}


	Log(LOG_SUCCESS, "Found:  %d npc, %d mine, %d dynobj", nTotalNpc, nTotalMine, pathMap.size());
	Log(LOG_SUCCESS, "Import: %d npc, %d mine, %d dynobj", nNpcImport, nMineImport, g_DynObj.size());

	char szErrorInfo[MAX_PATH] = {0};
	if (nTotalNpc > nNpcImport)
		sprintf(szErrorInfo, "%d npc, ", nTotalNpc-nNpcImport);
	if (nTotalMine > nMineImport)
		sprintf(szErrorInfo+strlen(szErrorInfo), "%d mine, ", nTotalMine-nMineImport);
	if (pathMap.size() > g_DynObj.size())
		sprintf(szErrorInfo+strlen(szErrorInfo), "%d dynobj", pathMap.size() - g_DynObj.size());
	if (szErrorInfo[0])
		Log(LOG_ERROR,   "Failed: %s", szErrorInfo);
	return true;
}

void ExportEcmTab(AFile& file, EcmTable& ecmTab)
{
	int count;
	EcmTable::iterator e_it;
	ChdVec::iterator   c_it;
	DWORD dwLen;

	count = ecmTab.size();
	file.Write(&count, sizeof(int), &dwLen);

	for (e_it = ecmTab.begin(); e_it != ecmTab.end(); ++e_it)
	{
		int id =  *e_it.key();
		file.Write(&id, sizeof(int), &dwLen);
		ChdVec& chdVec = *e_it.value();
		count = chdVec.size();
		file.Write(&count, sizeof(int), &dwLen);
		for (c_it = chdVec.begin(); c_it != chdVec.end(); ++c_it)
		{
			(*c_it)->SaveBinaryData(&file);			
		}
	}
}

bool ExportData(const char * path)
{
	AFile  file;
	if (!file.Open(path, AFILE_BINARY|AFILE_CREATENEW|AFILE_NOHEAD))
	{
		Log(LOG_ERROR, ("export data: open %s fail"), path);
		return false;
	}

	Log(LOG_SUCCESS, ("export npc,mine and dyn to %s"), path);
	
	DWORD flag;
	DWORD dwLen;

	//header
	flag = NMD_FILE_MAGIC;
	file.Write(&flag, sizeof(DWORD), &dwLen);
	flag = NMD_FILE_VERSION;
	file.Write(&flag, sizeof(DWORD), &dwLen);
	flag = ELEMENTDATA_PRG_VERSION;
	file.Write(&flag, sizeof(DWORD), &dwLen);
	flag = ELEMENTDATA_DAT_VERSION;
	file.Write(&flag, sizeof(DWORD), &dwLen);
	
	ExportEcmTab(file, g_NpcMine);
	ExportEcmTab(file, g_DynObj);
	
	return true;
}

bool ExportNMD(LogFunc pFunc)
{
	bool bFinish = false;

	if (!Init(pFunc))
	{
		goto _end;
	}

	if (!ImportData())
	{
		goto _end;
	}

	if (!ExportData(g_Config.szOutputFile))
	{
		goto _end;
	}

	Log(LOG_SUCCESS, "Done!");
	bFinish = true;

_end:
	Release();
	return bFinish;
}