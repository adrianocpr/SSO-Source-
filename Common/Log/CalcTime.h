/*
 *	��ʱ����stringΪ�ؼ��֣���¼��Ӧ��ʱ�䣬ʱ��Ϊ�ۻ�ֵ
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
		//��ָ���Ĺؼ��ʼ�¼��ʼʱ�䵽Logs\TimeLog.txt�У�Ϊ�ۼƼ�ʱ
		//rec:�ؼ���,info ������Ϣ
		static void Start(const wchar_t* rec,const wchar_t* info=L"",bool bReCalc = false);
		//��ָ���Ĺؼ��ʼ�¼��ʼʱ�䵽Logs\TimeLog.txt�У�Ϊ�ۼƼ�ʱ
		//rec:�ؼ���,info ������Ϣ
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