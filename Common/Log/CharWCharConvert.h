#ifndef _CHARWCHARCONVERT_H
#define _CHARWCHARCONVERT_H

#if _MSC_VER > 1000
#pragma once
#endif

#include <string>
namespace share
{
	class CharWCharConvert
	{
	public:
		//将pwstr所指的wchar_t转到pcstr所指的char数组中，数组长度为len
		static void w2c(const wchar_t* pwstr,char* pcstr,size_t len);
		static void c2w(const char* pcstr,wchar_t* pwstr,size_t len);
		static std::string wstr2str(const std::wstring& wstr);	
		static std::wstring str2wstr(const std::string& str);
	};
}

#define W2C(s) share::CharWCharConvert::wstr2str(s).c_str()
#define C2W(s) share::CharWCharConvert::str2wstr(s).c_str()

#endif	//_CHARWCHARCONVERT_H