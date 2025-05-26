/*
 *	计时，以string为关键字，记录对应的时间，时间为累积值
 */

#ifndef _CALCTIME_H_WANGLIANG
#define _CALCTIME_H_WANGLIANG

#include <time.h>
#include <map>
#include <string>
#include "CharWCharConvert.h"

namespace share
{
	class CalcTimer
	{
	public:
		//以指定的关键词记录开始时间到Logs\TimeLog.txt中，为累计计时
		//rec:关键词,info 辅助信息
		static void Start(const wchar_t* rec,const wchar_t* info=L"",bool bReCalc = false);
		//以指定的关键词记录开始时间到Logs\TimeLog.txt中，为累计计时
		//rec:关键词,info 辅助信息
		static void Start(const char* rec,const char* info="",bool bReCalc = false);
		static clock_t End(const wchar_t* rec);
		static clock_t End(const char* rec);
	private:
		struct timer_tag
		{
			clock_t start;
			clock_t cost;
		};
		static std::map<std::wstring,timer_tag> timeRecords;
	};
}

#define CALC_TIME
#ifdef CALC_TIME
	#define CALC_TIME_START share::CalcTimer::Start
	#define CALC_TIME_END share::CalcTimer::End
#else
	#define CALC_TIME_START(...) {}
	#define CALC_TIME_END(...) {}
#endif

#endif //_CALCTIME_H