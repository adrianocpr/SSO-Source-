/*
 * FILE: Global.h
 *
 * DESCRIPTION: Global variables and definitions
 *
 * CREATED BY: Duyuxin, 2003/9/1
 *
 * HISTORY:
 *
 * Copyright (c) 2001 Archosaur Studio, All Rights Reserved.	
 */
#ifndef GLOBAL_H_
#define GLOBAL_H_

#include "ALog.h"
#include "AString.h"
#include "hashmap.h"
#include <map>
#include <string>
#include "LuaState.h"
#include "LuaFuncCommon.h"
#include "ScriptValue.h"

class BaseDataOrg;
class BaseDataTempl;
class CEnumTypes;
class MemCacheClient;

struct ExportOptions
{
	std::string strSrcPath;
	std::string strDestPath;
	std::string strLanguage;
	std::string strMemcachedServer;
	std::string strKeyPrefix;
	bool bExportElementData;
	bool bExportPolicy;
	bool bExportGShop;
	bool bExportTask;
	int verbosity;
	bool bClean;
	bool bNoCache;
	
	ExportOptions()
	:	bExportElementData(false),
		bExportPolicy(false),
		bExportGShop(false),
		bExportTask(false),
		verbosity(0),
		bClean(false),
		bNoCache(false)
	{
		strMemcachedServer = "127.0.0.1:11211";
		strKeyPrefix = "seiya_dev";
	}
};
extern ExportOptions _opts;

extern ALog			g_Log;
extern CEnumTypes g_EnumTypes;

#define MAX_LINE_LEN	1024
extern const char* _org_config_path;

inline bool ReadLine(FILE* fp, char* szLine)
{
	if (fgets(szLine, MAX_LINE_LEN, fp) == NULL) return false;
	szLine[strcspn(szLine, "\r\n")] = '\0';
	return true;
}

bool FileIsReadOnly(const char* szFilePathName);
bool FileIsExist(const char* szFilePathName);
bool GetFileModifiedTime(const char* path, time_t& t);

CString RemoveSlashBehindPath( const TCHAR* szPath );
CString GetParentPath( const TCHAR* szPath );

void CALLBACK SVNLog(const char* szLog);

void ShowMessage(int verbosity, const char* msg, ...);

MemCacheClient* GetMemCacheClient();
const char* GetMemCacheKeyPrefix();
bool GetFileHash(const std::vector<std::string>& pathList, std::vector<char>& hash);
bool GetFileHash(const char* path, std::vector<char>& hash);
#endif