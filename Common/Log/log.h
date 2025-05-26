#ifndef LOG_H_WANGLIANG
#define LOG_H_WANGLIANG

#if _MSC_VER > 1000
#pragma once
#endif

#include <stdarg.h>
#include <string>
#include <windows.h>
#include <locale.h>

namespace share
{
	class Log
	{
	public:
		//往指定文件中写内容，加上时间标记
		template<class LogFile>
		static void fprint(const wchar_t* fmt,...);
		//检测文件大小，>1M删除
		static void checkFileSize(const wchar_t* file);
		//将信息输出到调试输出窗口
		static void OutPutDebug(const wchar_t* fmt,...);
		static void Alarm(const wchar_t* fmt,...);
		//获取程序所在路径
		static std::wstring GetAppPath();
		//记录当前工作路径
		static void LogCurrentWorkDir(const wchar_t* callInfo);
	private:
		static DWORD pid;
	};

	template<class LogFile>
	void Log::fprint(const wchar_t* fmt,...)
	{
		if(pid == 0) pid = GetCurrentProcessId();
		std::wstring strPath = GetAppPath();
		const wchar_t* file = strPath.append(L"\\..\\").append(LogFile::file).c_str();
		checkFileSize(file);
		//setlocale(LC_CTYPE,NULL);
		FILE *f = NULL;
		if(_wfopen_s(&f,file,L"a+")) return;
		SYSTEMTIME time;
		GetLocalTime(&time);
		fwprintf(f,L"[PID=%d %4d-%02d-%02d %02d:%02d:%02d:%03d]\t",pid,
			time.wYear,time.wMonth,time.wDay,
			time.wHour,time.wMinute,time.wSecond,time.wMilliseconds);
		va_list args;
		va_start(args,fmt);
		vfwprintf_s(f,fmt,args);
		va_end(args);
		fclose(f);
	}

	struct TimeFile
	{
		static const wchar_t* file;
	};
	struct SkillFile
	{
		static const wchar_t* file;
	};
	struct SequenceSkillFile
	{
		static const wchar_t* file;
	};
	struct ThreadFile
	{
		static const wchar_t* file;
	};
	struct CommonFile
	{
		static const wchar_t* file;
	};
}

#define LOG_SEQUENCE_SKILL share::Log::fprint<share::SequenceSkillFile>
#define LOG_TIME share::Log::fprint<share::TimeFile>
//#define LOG_COMMON share::Log::fprint<share::CommonFile>

#ifdef SPECIAL_LOG
	//#define LOG_TIME share::Log::fprint<share::TimeFile>
	#define LOG_SKILL share::Log::fprint<share::SkillFile>
	#define LOG_THREAD share::Log::fprint<share::ThreadFile>
	#define LOG_COMMON share::Log::fprint<share::CommonFile>
#else
	//#define LOG_TIME(...) {}
	#define LOG_SKILL(...) {}
	#define LOG_THREAD(...) {}
	#define LOG_COMMON(...) {}
#endif

//直接弹对话框
#define LOG_ASSERT(x) do {\
	if(!(x)) {\
	if(IDYES == MessageBoxA(NULL,"Assertion Failed in "__FILE__ "\nExpr is \"" #x "\",Terminate ? ","Assertion Failed",MB_YESNO))\
		exit(0);\
	}\
}while(0)


#endif