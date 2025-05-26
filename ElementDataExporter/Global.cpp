   /*
 * FILE: Global.cpp
 *
 * DESCRIPTION: Global variables and definitions
 *
 * CREATED BY: Duyuxin, 2002/9/1
 *
 * HISTORY:
 *
 * Copyright (c) 2001 Archosaur Studio, All Rights Reserved.
 */

#include "StdAfx.h"
#include "Global.h"
#include "BaseDataOrg.h"
#include "BaseDataTemplate.h"
#include "WinBase.h"
#include <hashtab.h>
#include "EnumTypes.h"
#include "MemCacheClient.h"
#include <io.h>
#include <fcntl.h>
#include <share.h>
#include <sys/types.h>
#include <sys/stat.h>
#include "EC_MD5Hash.h"

#define new A_DEBUG_NEW

///////////////////////////////////////////////////////////////////////////
//
//	Define and Macro
//
///////////////////////////////////////////////////////////////////////////

ALog		  g_Log;
char		  g_szWorkDir[MAX_PATH];

char          g_szUserName[MAX_PATH];
char          g_szPassword[MAX_PATH];
char          g_szServerPath[MAX_PATH];
char		  g_szIniFile[MAX_PATH];		//	.ini file name
char          g_szProject[256];

CEnumTypes    g_EnumTypes;

bool          g_bConfigInit = false;
bool          g_bAutoUpdate = true;
bool          g_bPolicyModifyed = false;
HCURSOR       g_hNoDrag;
bool          g_bNotLinkVss = false;

const char* _settings	= "Settings";
const char* _database	= "VSS_DATABASE";
const char* _user_name	= "VSS_USERNAME";
const char* _password	= "VSS_PASSWORD_BIN";
const char* _update		= "VSS_AUTO_UPDATE";
const char* _notlinkvss	= "VSS_NOT_LINK";
const char* _notfirstget	= "VSS_NOT_FIRST_GET";


const char*	g_szVersion = "1.0.0.5";

void Encrypt(char *strPass)
{
	int len = strlen(strPass);
	int pass = 2004;
	for(int i = 0; i< len; i++)
	{
		strPass[i] ^= pass;
	}
}

bool FileIsReadOnly(const char* szFilePathName)
{
	DWORD flag = GetFileAttributes(szFilePathName);
	if(flag==-1)
	{
		return true;
	}
	if (!(flag & FILE_ATTRIBUTE_READONLY)) 
	{
		return false;
	}
	return true;
}

bool FileIsExist(const char* szFilePathName)
{
	FILE *file;
	file = fopen(szFilePathName,"r");
	if(file) 
	{
		fclose(file);
		return true;
	}
	else return false;
}

bool GetFileModifiedTime( const char* path, time_t& t )
{
	struct _stat st;
	int fd = _sopen(path,
		_O_BINARY | _O_RDONLY,
		_SH_DENYNO,
		_S_IREAD);

	if(fd == -1) return false;
	if(_fstat(fd, &st) != 0) 
	{
		_close(fd);
		return false;
	}

	t = st.st_mtime;
	_close(fd);
	return true;
}

CString RemoveSlashBehindPath( const TCHAR* szPath )
{
	CString strPath(szPath);
	
	if( strPath.IsEmpty() || strPath.GetAt(strPath.GetLength()-1) != _T('\\') )
		return strPath;
	else 
		return strPath.Left(strPath.GetLength()-1);
}

CString GetParentPath( const TCHAR* szPath )
{
	CString str(RemoveSlashBehindPath(szPath));
	
	int pos = str.ReverseFind( _T('\\') );
	if( pos == -1 ) return _T("");
	else return str.Left( pos );
}

void ShowMessage( int verbosity, const char* msg, ... )
{
	if(verbosity > _opts.verbosity) return;

	va_list vaList;
	va_start(vaList, msg);
	vprintf(msg, vaList);
	va_end(vaList);

	puts("\n");
}

MemCacheClient* GetMemCacheClient()
{
	static MemCacheClient client;

	return _opts.bNoCache ? NULL : &client;
}

const char* GetMemCacheKeyPrefix()
{
	return _opts.strKeyPrefix.c_str();
}

bool GetFileHash( const std::vector<std::string>& pathList, std::vector<char>& hash )
{
	PATCH::MD5Hash md;
	const unsigned int SALT = 0xda7aeb07;

	md.Update((const char*)&SALT, sizeof(SALT));

	for(size_t i = 0; i < pathList.size(); ++i)
	{
		const std::string& path = pathList[i];

		struct _stat st;
		int fd = _sopen(path.c_str(),
			_O_BINARY | _O_RDONLY,
			_SH_DENYNO,
			_S_IREAD);

		if(fd == -1) continue;
		if(_fstat(fd, &st) != 0) 
		{
			_close(fd);
			continue;
		}

		md.Update((const char*)&st.st_size, sizeof(st.st_size));
		md.Update((const char*)&st.st_mtime, sizeof(st.st_mtime));
		_close(fd);
	}

	md.Final();
	hash.resize(md.Length());
	memcpy(&hash[0], md.GetDigest(), hash.size());
	return hash.size() > 0;
}

bool GetFileHash( const char* path, std::vector<char>& hash )
{
	std::vector<std::string> vec;
	vec.push_back(path);
	return GetFileHash(vec, hash);
}