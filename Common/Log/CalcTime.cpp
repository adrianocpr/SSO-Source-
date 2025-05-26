#include "Stdafx.h"
#include "CalcTime.h"
#include "log.h"

namespace share
{
	std::map<std::wstring,CalcTimer::timer_tag> CalcTimer::timeRecords;

	void CalcTimer::Start(const wchar_t* rec,const wchar_t* info /*=L""*/,bool bReCalc /*= false*/)
	{
		if(bReCalc||timeRecords.find(rec) == timeRecords.end())
			timeRecords[rec].cost = 0;
		timeRecords[rec].start = clock();
		LOG_TIME(L"%s start %s\n",rec,info);
	}
	void CalcTimer::Start(const char* rec,const char* info /*=""*/,bool bReCalc /*= false*/)
	{
		std::wstring wrec = CharWCharConvert::str2wstr(rec);
		std::wstring winfo = CharWCharConvert::str2wstr(info);
		Start(wrec.c_str(),winfo.c_str(),bReCalc);
	}
	clock_t CalcTimer::End(const wchar_t* rec)
	{
		if(timeRecords.find(rec) == timeRecords.end())
		{
			LOG_TIME(L"%s try end while not start\n",rec);
			return 0;
		}
		clock_t costTime = clock() - timeRecords[rec].start + timeRecords[rec].cost;
		timeRecords[rec].cost = costTime;
		LOG_TIME(L"%s end,cos time = %d\n",rec,costTime);
		return costTime;
	}
	clock_t CalcTimer::End(const char* rec)
	{
		std::wstring wrec =	CharWCharConvert::str2wstr(rec);
		return End(wrec.c_str());
	}
}

