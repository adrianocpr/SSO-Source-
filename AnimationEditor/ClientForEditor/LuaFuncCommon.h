/********************************************************************
	created:	2008/11/24
	author:		liudong
	
	purpose:   common functions about lua.
	Copyright (C) 2008 - All Rights Reserved
*********************************************************************/
#pragma once

#include <vector>
#include <vector.h>
#include <ABaseDef.h>
#include <AWString.h>
#include <APoint.h>
#include <ARect.h>
#include <A3DVector.h>

#include "EC_ID64.h"
#include "LuaAPI.h"
#include "LuaUtil.h"
//#include "rpcdefs.h"

//////////////////////////////////////////////////////////////////////////
// common functions
#define SetKVPaires(key_array, val_array, key, value)	\
	do {\
		CScriptValue sv1;\
		(sv1).SetVal(key);\
		(key_array).push_back(sv1);\
		CScriptValue sv2;\
		(sv2).SetVal(value);\
		(val_array).push_back(sv2);\
	} while(0);

// value is table
#define SetKVPaires_Table(key_array, val_array, key, value)	\
do {\
	CScriptValue sv1;\
	(sv1).SetVal(key);\
	(key_array).push_back(sv1);\
	CScriptValue sv2;\
	(sv2).SetArray(value);\
	(val_array).push_back(sv2);\
} while(0);

namespace luaf
{

	//辅助函数，将数字列表放到 CScriptValue 数组中
	bool SetKVPaires_Vector(abase::vector<CScriptValue>& keys,abase::vector<CScriptValue>& vals,const char* pKey,const std::vector<int>& list);

	//辅助函数，将数字列表放到 CScriptValue 数组中
	//bool SetKVPaires_Vector(abase::vector<CScriptValue>& keys,abase::vector<CScriptValue>& vals,const char* pKey,const RpcDataVector<int>& list);

	//从table中获取变量。
	const CScriptValue* GetValue(const CScriptValue& varTable, const wchar_t* pKey);

	//简单变量。
	bool GetValue(double& value,		const CScriptValue& varTable, const wchar_t* pKey, const double		defaultVal=0.0);
	bool GetValue(float& value,			const CScriptValue& varTable, const wchar_t* pKey, const float		defaultVal=0.0f);
	bool GetValue(int& value,			const CScriptValue& varTable, const wchar_t* pKey, const int		defaultVal=0);
	bool GetValue(unsigned int& value,	const CScriptValue& varTable, const wchar_t* pKey, const unsigned int defaultVal=0);
	bool GetValue(unsigned long& value,	const CScriptValue& varTable, const wchar_t* pKey, const unsigned long defaultVal=0);
	bool GetValue(__int64& value,		const CScriptValue& varTable, const wchar_t* pKey, const __int64 defaultVal=0);
	bool GetValue(CECID64& value,		const CScriptValue& varTable, const wchar_t* pKey, const __int64 defaultVal=0);
	bool GetValue(bool& value,			const CScriptValue& varTable, const wchar_t* pKey, const bool		defaultVal=false);
	bool GetValue(AWString& value,		const CScriptValue& varTable, const wchar_t* pKey, const wchar_t*	defaultVal=NULL);
	bool GetValue(AString& value,		const CScriptValue& varTable, const wchar_t* pKey, const char*		defaultVal=NULL);

	//数组，table中的key必须全是数字、从1开始连续没有空洞，否则取不出来。
	bool GetValue(abase::vector<double>& value,				const CScriptValue& var);
	bool GetValue(abase::vector<float>& value,				const CScriptValue& var);
	bool GetValue(abase::vector<int>& value,				const CScriptValue& var);
	bool GetValue(abase::vector<unsigned int>& value,		const CScriptValue& var);
	bool GetValue(abase::vector<unsigned long>& value,		const CScriptValue& var);
	bool GetValue(abase::vector<__int64>& value,			const CScriptValue& var);
	bool GetValue(abase::vector<CECID64>& value,			const CScriptValue& var);
	bool GetValue(abase::vector<AWString>& value,			const CScriptValue& var);
	bool GetValue(abase::vector<const CScriptValue*>& value,const CScriptValue& var);

	//从var中查找key为pKey的子table，从子table中取出一个数组，table中的key必须全是数字、从1开始连续没有空洞，否则取不出来。
	bool GetValue(abase::vector<double>& value,				const CScriptValue& var, const wchar_t* pKey);
	bool GetValue(abase::vector<float>& value,				const CScriptValue& var, const wchar_t* pKey);
	bool GetValue(abase::vector<int>& value,				const CScriptValue& var, const wchar_t* pKey);
	bool GetValue(abase::vector<unsigned int>& value,		const CScriptValue& var, const wchar_t* pKey);
	bool GetValue(abase::vector<unsigned long>& value,		const CScriptValue& var, const wchar_t* pKey);
	bool GetValue(abase::vector<__int64>& value,			const CScriptValue& var, const wchar_t* pKey);
	bool GetValue(abase::vector<CECID64>& value,			const CScriptValue& var, const wchar_t* pKey);
	bool GetValue(abase::vector<AWString>& value,			const CScriptValue& var, const wchar_t* pKey);
	bool GetValue(abase::vector<const CScriptValue*>& value,const CScriptValue& var, const wchar_t* pKey);
	
	//A3DVECTOR3
	bool GetValue(A3DVECTOR3& value ,const CScriptValue& var, const A3DVECTOR3& defaultVal=A3DVECTOR3(0,0,0));
	bool GetValue(A3DVECTOR3& value ,const CScriptValue& var, const wchar_t* pKey, const A3DVECTOR3& defaultVal=A3DVECTOR3(0,0,0));

	//APoint
	template <class T>
	bool GetValue(APoint<T>& value ,const CScriptValue& var, const APoint<T>& defaultVal=APoint<T>(0,0))
	{
		abase::vector<T> vecTemp;
		if (!GetValue(vecTemp, var) || vecTemp.size()<2)
		{
			ASSERT(0);
			value = defaultVal;
			return false;
		}
		value.x = vecTemp[0];
		value.y = vecTemp[1];
		return true;
	}
	template <class T>
	bool GetValue(APoint<T>& value ,const CScriptValue& var, const wchar_t* pKey, const APoint<T>& defaultVal=APoint<T>(0,0))
	{
		const CScriptValue* pVar = GetValue(var,pKey);
		if (!pVar)
		{
			value = defaultVal;
			return false;
		}
		return GetValue(value, *pVar, defaultVal);
	}

	//ARect
	template <class T>
	bool GetValue(ARect<T>& value ,const CScriptValue& var, const ARect<T>& defaultVal=ARect<T>(0,0,0,0))
	{
		abase::vector<T> vecTemp;
		if (!GetValue(vecTemp, var) || vecTemp.size()<4)
		{
			ASSERT(0);
			value = defaultVal;
			return false;
		}
		value.left	= vecTemp[0];
		value.top	= vecTemp[1];
		value.right	= vecTemp[2];
		value.bottom= vecTemp[3];
		return true;
	}
	template <class T>
	bool GetValue(ARect<T>& value ,const CScriptValue& var, const wchar_t* pKey, const ARect<T>& defaultVal=ARect<T>(0,0,0,0))
	{
		const CScriptValue* pVar = GetValue(var,pKey);
		if (!pVar)
		{	
			value = defaultVal;
			return false;
		}
		return GetValue(value, *pVar,defaultVal);
	}


	//从一个table中获取所有以数字为key的变量
	bool GetValue_NumberKey(abase::vector<const CScriptValue*>& value,const CScriptValue& var, const bool bSort = true);
	bool GetValue_NumberKey(abase::vector<const CScriptValue*>& value,const CScriptValue& var, const wchar_t* pKey, const bool bSort = true);


	//加载脚本，返回脚本中某个函数的调用结果，然后释放脚本资源、释放新加载进来的table。
	bool GetScriptConfigTable(CScriptValue& valueOut, const char* pTable, const char* pFile = NULL, bool bUnRegister = true);
	bool glb_GetDetachScriptConfigTable(abase::vector<CScriptValue>& results, const char* pFile, const char* pTable);
	bool CallFunc(abase::vector<CScriptValue>& args, abase::vector<CScriptValue>& results, const char* pTable, const char* pFunc);
	bool CallFuncInFile(abase::vector<CScriptValue>& results, const char* pFile, const char* pTable, const char* pFunc = "GetSelf");
	bool CallFuncInFile(abase::vector<CScriptValue>& results, const abase::vector<AString>& vecFile, const char* pTable, const char* pFunc = "GetSelf");
};


