#include "Stdafx.h"
#include "log.h"

namespace share
{
	DWORD Log::pid = 0;
	const wchar_t* TimeFile::file = L"Logs\\TimeLog.txt";
	const wchar_t* SkillFile::file = L"Logs\\SkillLog.txt";
	const wchar_t* SequenceSkillFile::file = L"Logs\\SequenceSkillLog.txt";
	const wchar_t* ThreadFile::file = L"Logs\\ThreadLog.txt";
	const wchar_t* CommonFile::file = L"Logs\\CommonLog.txt";
	//检测文件大小，>1M删除
	void Log::checkFileSize(const wchar_t* file)
	{
		struct _stat info;
		int ret = _wstat(file,&info);
		if(ret == 0 && info.st_size > 1*1024*1024)//1M
			_wremove(file);
	}
	//将信息输出到调试输出窗口
	void Log::OutPutDebug(const wchar_t* fmt,...)
	{
		va_list args;
		va_start(args,fmt);
		wchar_t tmp[1024];
		_vsnwprintf_s(tmp,1024,1024,fmt,args);
		OutputDebugStringW(tmp);
		va_end(args);
	}
	void Log::Alarm(const wchar_t* fmt,...)
	{
		va_list args;
		va_start(args,fmt);
		wchar_t tmp[1024];
		_vsnwprintf_s(tmp,1024,1024,fmt,args);
		::MessageBox(NULL,tmp,NULL,MB_OK);
		va_end(args);
	}

	std::wstring Log::GetAppPath()
	{
		wchar_t szFileName[1024];
		GetModuleFileNameW(NULL,szFileName,1024);
		std::wstring strPath(szFileName);
		std::wstring::size_type pos = strPath.find_last_of(L"\\",strPath.length());
		return strPath.substr(0,pos);
	}

	void Log::LogCurrentWorkDir(const wchar_t* callInfo)
	{
		wchar_t dir[1024];
		GetCurrentDirectoryW(1024,dir);
		LOG_COMMON(L"current work dir = %s : [%s]\n",dir,callInfo);
	}
}
