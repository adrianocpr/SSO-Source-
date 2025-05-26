/*
 * FILE: EC_Utility.h
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Duyuxin, 2004/9/2
 *
 * HISTORY: 
 *
 * Copyright (c) 2004 Archosaur Studio, All Rights Reserved.
 */

#pragma once

#include <A3DVector.h>
#include <Aassist.h>
#include <vector.h>
#include <time.h>
#include <hashmap.h>
#include <hashtab.h>
#include <A3DTypes.h>
#include <windows.h>
#include "EC_ID64.h"

//#include "gnoctets.h"

///////////////////////////////////////////////////////////////////////////
//	
//	Define and Macro
//	
///////////////////////////////////////////////////////////////////////////

//	Macros used to implement 16.16 fix point calculation
#define	INTTOFIX16(x)		(((int)(x)) << 16)
#define FIX16TOINT(x)		(((x) + 0x00008000) >> 16)
#define FIX16TOINTCEIL(x)	(((x) + 0x0000ffff) >> 16)
#define FIX16TOINTFLOOR(x)	((x) >> 16)
#define FLOATTOFIX16(x)		((int)((x) * 65536.0f + 0.5f))
#define FIX16TOFLOAT(x)		((x) / 65536.0f)

#define FLOATTOFIX8(x)		((short)((x) * 256.0f + 0.5f))
#define FIX8TOFLOAT(x)		((x) / 256.0f)

#define FIX16MUL(M1, M2)	(int)(((__int64)(M1) * (M2) + 0x00008000) >> 16)
#define FIX16DIV(D1, D2)	(int)(((__int64)(D1) << 16) / (D2))

//	Check whether a position value is valid
#define INVALIDPOS			9000000.0f
#define POSISVALID(x)		((x) < INVALIDPOS-1.0f && (x) > -INVALIDPOS+1.0f)

#define MIN_DOUBLE 1E-5
#define IS_ZERO(x) ((x)>-MIN_DOUBLE && (x)<MIN_DOUBLE)

//safe delete and release
#define EC_DELETE(p) \
if(p) \
{\
	delete (p); \
	(p) = NULL;\
}

#define EC_DELETE_ARRAY(p) \
if (p)\
{\
	delete [] (p);\
	(p) = NULL;\
}

#define EC_RELEASE(p) \
if (p) \
{ \
	(p)->Release(); \
	(p) = NULL; \
}

#define EC_RELEASE_DELETE(p) \
if (p) \
{ \
	(p)->Release(); \
	delete (p); \
	(p) = NULL; \
}

///////////////////////////////////////////////////////////////////////////
//	
//	Types and Global variables
//	
///////////////////////////////////////////////////////////////////////////


class A3DSkin;

///////////////////////////////////////////////////////////////////////////
//	
//	Declare of Global functions
//	
///////////////////////////////////////////////////////////////////////////

//	File operations
bool glb_CreateDirectory(const char* szDir);
bool glb_FileExist(const char* szFile);
void glb_ChangeExtension(char* szFile, const char* szNewExt);
void glb_ClearExtension(char* szFile);
bool glb_WriteString(FILE* fp, const char* str);

bool glb_PercentProbability(int iPercent);
bool glb_PercentProbability(float fPercent);
A3DVECTOR3 glb_RandomVectorH(int* piDegree=NULL);
A3DVECTOR3 glb_RandomVector();

BYTE glb_CompressDirH(float x, float z);
A3DVECTOR3 glb_DecompressDirH(BYTE byDir);

int glb_IntCompare(const void* arg1, const void* arg2);
int glb_WordCompare(const void* arg1, const void* arg2);

extern bool g_bExceptionOccured;
//unsigned long glb_HandleException(LPEXCEPTION_POINTERS pExceptionPointers);

//	Get command line parameters
bool glb_IsConsoleEnable();

tm* glb_GetFormatLocalTime();

ACString glb_FilterEditboxText(const ACHAR* szText);

#define FATAL_ERROR_LOAD_BUILDING 1
#define FATAL_ERROR_WRONG_CONFIGDATA 2
extern DWORD g_dwFatalErrorFlag;

bool glb_ConvertBmpToJpeg(const char* szBmp, const char* szJpeg, int nQuality);

enum TIME_STR_TYPE
{
	TIME_STR_NONE = 0,		// none
	TIME_STR_DAY_HOUR,		// *天*小时
	TIME_STR_HOUR_MINUTE,	// *小时*分钟
	TIME_STR_MINUTE_SECOND,// *分钟*秒
	TIME_STR_SECOND,		// *秒
};

struct TextWithColor
{
	AWString str;
	DWORD    color;
	bool     bUseColor;
	int      userData;//自定义数据类型，存储一些额外数据。
	TextWithColor();
	TextWithColor(const TextWithColor& src);
};
//split text by colors.
void g_SplitTextByColor(abase::vector<TextWithColor>& vecStr, const wchar_t* pSrc);
//传入一系列概率，根据概率随机出一项，返回该项下标(下标从0开始),如果失败返回-1.（概率相加的和不必为1，概率中允许有0项）
int  g_RandByRates(const abase::vector<double>& vecRate);
//将数字格式颜色 0X00112233 转换为aui库可识别的字符串格式 ^112233。
void g_ColorToString(AWString& strColor, const A3DCOLOR color);
//在两个颜色之间按比例取过渡颜色.
A3DCOLOR g_GetColor(const A3DCOLOR& color1, const A3DCOLOR& color2, const float ratio);
//convert seconds to text. return TIME_STR_TYPE.
int g_TimeToString(AWString& strOut, const unsigned int seconds);

//void g_OctetsToString(AWString& str, const GNET::Octets& octets);
//void g_StringToOctets(GNET::Octets& octets, const wchar_t* pStr);
void g_Int64ToString(AWString& str, const __int64 value);
void g_StringToInt64(__int64& value, const wchar_t* pStr);


//获取MessageBoxA使用提示字符串
//bool glb_GetClientTxt(const char * key, AString& val);


void glb_SetExtState(DWORD* p, int n);
void glb_RemExtState(DWORD* p, int n);
bool glb_GetExtState(const DWORD* p, int n);


///////////////////////////////////////////////////////////////////////////
//	
//	Inline functions
//	
///////////////////////////////////////////////////////////////////////////

//	Get bit in a bytes string
inline BYTE glb_GetBit(const BYTE* b, int i) { return b[i >> 3] & (1 << (i & 7)); }
//	Set bit in a bytes string
inline void glb_SetBit(BYTE* b, int i) { b[i >> 3] |= (1 << (i & 7)); }

//位操作
template <class U, class V>
void g_AddMask(U& target, const V bits)
{
	target |= bits;
}
template <class U, class V>
void g_RemoveMask(U& target, const V bits)
{
	target &= (~bits);
}
template <class U, class V>
void g_ChangeMask(U& target, const V bits, const bool bAdd)
{
	if (bAdd)
	{
		g_AddMask(target, bits);
	}else
	{
		g_RemoveMask(target, bits);
	}
}
template <class U, class V>
bool g_CheckMask(U& target, const V bits)
{
	if (target & bits)
	{
		return true;
	}else
	{
		return false;
	}
}

template <class _Key, class _Value, class _HashFunc, class _Allocator>
void CopyHashMap(abase::hash_map<_Key,_Value,_HashFunc,_Allocator>& target, const abase::hash_map<_Key,_Value,_HashFunc,_Allocator>& src)
{
	if (&target == &src)
	{
		return;
	}
	target.clear();
	abase::hash_map<_Key,_Value,_HashFunc,_Allocator>::const_iterator it;
	for (it=src.begin(); it!=src.end(); ++it)
	{
		target[it->first] = it->second;
	}
}

template <class _Value, class _Key, class _HashFunc,class _Allocator>
void CopyHashTab(abase::hashtab<_Value,_Key,_HashFunc,_Allocator>& target, const abase::hashtab<_Value,_Key,_HashFunc,_Allocator>& src)
{
	if (&target == &src)
	{
		return;
	}
	target.clear();
	abase::hashtab<_Value,_Key,_HashFunc,_Allocator>::const_iterator it;
	for (it=src.begin(); it!=src.end(); ++it)
	{
		target.put(*it.key(),*it.value());
	}
}


template <class T>
bool IsVectorEqual(const abase::vector<T>& vec1, const abase::vector<T>& vec2)
{
	if (vec1.size()!=vec2.size())
	{
		return false;
	}
	for (unsigned int i=0; i<vec1.size(); ++i)
	{
		if (vec1[i] != vec2[i])
		{
			return false;
		}
	}
	return true;
}
