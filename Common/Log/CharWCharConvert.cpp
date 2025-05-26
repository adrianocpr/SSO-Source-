#include "Stdafx.h"
#include "CharWCharConvert.h"
#include <Windows.h>
#include <malloc.h>

namespace share
{
	void CharWCharConvert::w2c(const wchar_t* pwstr,char* pcstr,size_t len)
	{
		if(!pwstr || !pcstr)
			return;
		size_t wlen = wcslen(pwstr);
		size_t nbytes = (size_t)WideCharToMultiByte(0,0,pwstr,wlen,NULL,0,NULL,NULL);
		if(nbytes > len)
			nbytes = len;
		WideCharToMultiByte(0,0,pwstr,wlen,pcstr,nbytes,NULL,NULL);
	}
	void CharWCharConvert::c2w(const char* pcstr,wchar_t* pwstr,size_t len)
	{
		if(!pcstr || !pwstr)
			return;
		size_t nlength = strlen(pcstr);
		size_t wlen = (size_t)MultiByteToWideChar(0,0,pcstr,nlength,NULL,0);
		if (wlen>=len)
			wlen = len -1;
		MultiByteToWideChar(0,0,pcstr,nlength,pwstr,wlen);
		pwstr[wlen] = L'\0';
	}

	std::string CharWCharConvert::wstr2str(const std::wstring& wstr)
	{
		std::string str = "";
		size_t nlen = sizeof(wchar_t)/sizeof(char)*wstr.length()+1;
		char* pcstr = static_cast<char*>(malloc(nlen));
		if(pcstr)
		{
			memset(pcstr,0,nlen);
			w2c(wstr.c_str(),pcstr,nlen);
			str = pcstr;
			free(pcstr);
		}
		return str;
	}

	std::wstring CharWCharConvert::str2wstr(const std::string& str)
	{
		std::wstring wstr = L"";
		size_t wlen = sizeof(wchar_t)*(str.length()+1);
		wchar_t* pwstr = static_cast<wchar_t*>(malloc(wlen));
		if(pwstr)
		{
			memset(pwstr,0,wlen);
			c2w(str.c_str(),pwstr,wlen);
			wstr =pwstr;
			free(pwstr);
		}
		return wstr;
	}
}
