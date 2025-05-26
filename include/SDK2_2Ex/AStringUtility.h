/********************************************************************
  created:	   2013.1.28
  author:      liudong  
  description: 
  Copyright (c) , All Rights Reserved.
*********************************************************************/
#pragma once
#include <wchar.h>
#include <stdio.h>
#include <AString.h>
#include <AWString.h>

inline AWString Int64ToAWString(const __int64 value)
{
	wchar_t temp[32];
	swprintf(temp,_L("%I64d"),value);
	return temp;
}

inline __int64 AWStringToInt64(const wchar_t* pStr)
{
	__int64 value = 0;
	if (pStr)
	{
		swscanf(pStr,_L("%I64d"),&value);
	}
	return value;
}

inline AWString Int64ToAWStringHex(const __int64 value)
{
	wchar_t temp[32];
	swprintf(temp,_L("0X%016I64X"),value);
	return temp;
}

inline __int64 AWStringHexToInt64(const wchar_t* pStr)
{
	__int64 value = 0;
	if (pStr)
	{
		swscanf(pStr,_L("0X%016I64X"),&value);
	}
	return value;
}