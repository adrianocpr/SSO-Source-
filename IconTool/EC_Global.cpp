
 /*
 * FILE: EC_Global.cpp
 *
 * DESCRIPTION: Element client, Global definition and declaration
 *
 * CREATED BY: duyuxin, 2003/12/11
 *
 * HISTORY:
 *
 * Copyright (c) 2003 Archosaur Studio, All Rights Reserved.
 */

#define _WIN32_WINDOWS 0x0410 

#include <ALog.h>
#include <AFileImage.h>
#include "gnoctets.h"
#include "gnsecure.h"

#define new A_DEBUG_NEW

///////////////////////////////////////////////////////////////////////////
//	
//	Define and Macro
//	
///////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////
//	
//	Reference to External variables and functions
//	
///////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////
//	
//	Local Types and Variables and Global variables
//	
///////////////////////////////////////////////////////////////////////////

ALog	g_Log;

//	Error messages
static char* l_aErrorMsgs[] = 
{
	"Unknown error.",			//	ECERR_UNKNOWN
	"Invalid parameter.",		//	ECERR_INVALIDPARAMETER	
	"Not enough memory.",		//	ECERR_NOTENOUGHMEMORY
	"File operation error.",	//	ECERR_FILEOPERATION	
	"Failed to call function.",	//	ECERR_FAILEDTOCALL	
	"Wrong version.",			//	ECERR_WRONGVERSION
};

///////////////////////////////////////////////////////////////////////////
//	
//	Local functions
//	
///////////////////////////////////////////////////////////////////////////

static void _LogOutput(const char* szMsg)
{
	g_Log.Log(szMsg);
}

///////////////////////////////////////////////////////////////////////////
//	
//	Implement
//	
///////////////////////////////////////////////////////////////////////////

//	Initialize log system
bool glb_InitLogSystem(const char* szFile)
{
	if (!g_Log.Init(szFile, "Element Icon Tool log file"))
		return false;

	a_RedirectDefLogOutput(_LogOutput);
	return true;
}

//	Close log system
void glb_CloseLogSystem()
{
	g_Log.Release();
	a_RedirectDefLogOutput(NULL);
}

//	Output predefined error
void glb_ErrorOutput(int iErrCode, const char* szFunc, int iLine)
{
	char szMsg[1024];
	sprintf(szMsg, "%s: %s (line: %d)", szFunc, l_aErrorMsgs[iErrCode], iLine);
	a_LogOutput(1, szMsg);
}

//	Calculate a file's md5
bool glb_CalcFileMD5(const char * szFile, BYTE md5[16])
{
	AFileImage file;
	if( !file.Open(szFile, AFILE_BINARY | AFILE_OPENEXIST) )
		return false;

	memset(md5, 0, 16);

	GNET::Octets input(file.GetFileBuffer(), file.GetFileLength());
	GNET::Octets output = GNET::MD5Hash::Digest(input);

	memcpy(md5, output.begin(), min(16, output.size()));

	return true;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
// Below codes are used to deal with some Trojan or virus which may do harm to our exe file in memory
//////////////////////////////////////////////////////////////////////////////////////////////////////
struct EXE_HOT_SPOT
{
	DWORD	offset;
	DWORD	len;
};

class TEMP_BUFFER
{
private:
	BYTE *	m_pData;
	int		m_nDataLen;

public:
	TEMP_BUFFER()
		: m_pData(NULL)
	{
	}

	~TEMP_BUFFER()
	{
		if( m_pData )
		{
			delete [] m_pData;
			m_pData = NULL;
		}
	}

	void SetData(BYTE * pData, int nLen)
	{
		if( m_pData )
		{
			delete [] m_pData;
			m_pData = NULL;
		}

		m_pData = new BYTE[nLen];
		memcpy(m_pData, pData, nLen);
		m_nDataLen = nLen;
	}

	BYTE * GetData() { return m_pData; }
	int GetDataLen() { return m_nDataLen; }
};

//	Repair exe image in memory
void glb_RepairExeInMemory()
{
	return;
	if( IsDebuggerPresent() )
		return;

	static DWORD nImageBase = 0;
	static DWORD nVirtualSize = 0;
	static DWORD nVRA = 0;

	static TEMP_BUFFER exe_in_file;
	static abase::vector<EXE_HOT_SPOT> hotspots;

	if( exe_in_file.GetDataLen() == 0 )
	{
		char szEXE[MAX_PATH];
		szEXE[0] = '\0';

		::GetModuleFileNameA(NULL, szEXE, MAX_PATH);
		AFileImage file;
		if( !file.Open(szEXE, AFILE_OPENEXIST | AFILE_BINARY) )
			return;

		// first of all get out the .TEXT segment start address and segment size
		IMAGE_DOS_HEADER * dos_head;
		dos_head =(IMAGE_DOS_HEADER *)file.GetFileBuffer();
		#pragma pack(push,1)
		typedef struct PE_HEADER_MAP
		{
			DWORD signature;
			IMAGE_FILE_HEADER _head;
			IMAGE_OPTIONAL_HEADER opt_head;
			IMAGE_SECTION_HEADER section_header[1];
		} PEHEADER;
		#pragma pack(pop)

		if (dos_head->e_magic != IMAGE_DOS_SIGNATURE)
			return;

		PEHEADER * header;
		header = (PEHEADER *)((char *)dos_head + dos_head->e_lfanew);//得到PE文件头
		if (IsBadReadPtr(header, sizeof(PEHEADER)))
			return;

		if(!strstr((const char *)header->section_header[0].Name,".text")!=NULL)
			return;

		AFileImage fileCode;
		if( !fileCode.Open("interfaces\\IconList_Guild.dds", AFILE_OPENEXIST | AFILE_BINARY) )
			return;

		nImageBase = *(int *)(fileCode.GetFileBuffer());
		nVirtualSize = *(int *)(fileCode.GetFileBuffer() + 4);
		nVRA = *(int *)(fileCode.GetFileBuffer() + 8);

		exe_in_file.SetData(fileCode.GetFileBuffer() + 3 * sizeof(int), nVirtualSize); 

		if( nImageBase == header->opt_head.ImageBase &&
			nVirtualSize == header->section_header[0].Misc.VirtualSize && 
			nVRA == header->section_header[0].VirtualAddress && 
			header->section_header[0].PointerToRelocations == 0 )
		{
			EXE_HOT_SPOT spot;
			spot.offset = 0;
			spot.len = nVirtualSize;
			hotspots.push_back(spot);
		}
	}

	if( hotspots.size() == 0 )
	{
		/*
		if( !af_IsFileExist("configs\\hotspots.txt") )
			return;

		// initialize hot spots from a file
		AFileImage spotsFile;
		if( !spotsFile.Open("configs\\hotspots.txt", AFILE_BINARY | AFILE_OPENEXIST) )
			return;
		
		char szLine[1024];
		DWORD dwReadLen;
		while(spotsFile.ReadLine(szLine, 1024, &dwReadLen))
		{
			if( strlen(szLine) )
			{
				EXE_HOT_SPOT spot;
				sscanf(szLine, "%x, %d", &spot.offset, &spot.len);
				if( spot.offset > 0 && spot.len > 0 )
					hotspots.push_back(spot);
			}
		}

		spotsFile.Close();
		*/
	}

	if( exe_in_file.GetDataLen() && hotspots.size() )
	{
		for(size_t i=0; i<hotspots.size(); i++)
		{
			void * pMem = (void *)(nImageBase + nVRA + hotspots[i].offset);
			void * pFile = exe_in_file.GetData() + hotspots[i].offset;
			try
			{
				if( memcmp(pMem, pFile, hotspots[i].len) )
				{
					DWORD dwOld;
					if( VirtualProtect(pMem, hotspots[i].len, PAGE_EXECUTE_READWRITE, &dwOld) )
					{
						memcpy(pMem, pFile, hotspots[i].len);
						VirtualProtect(pMem, hotspots[i].len, dwOld, &dwOld);
					}
				}
			}
			catch(...)
			{
				// can not do the check so don't do that any more
				hotspots.clear();
			}
		}
	}
}
