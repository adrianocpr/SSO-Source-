/********************************************************************
created:	2008/11/24
author:		liudong

  purpose:   common functions about lua.
  Copyright (C) 2008 - All Rights Reserved
*********************************************************************/
#include "LuaFuncs.h"
#include "LuaState.h"




//////////////////////////////////////////////////////////////////////////
// macros

#ifndef ARRAY_SIZE
#	define ARRAY_SIZE(x) (sizeof(x) / sizeof(*x))
#endif


#define _IMPLEMENT_GET_VAR_DOUBLE_LIKE(DOUBLE_LIKE_TYPE) \
	bool GetValue(abase::vector<DOUBLE_LIKE_TYPE>& value, const CScriptValue& var)\
	{\
		value.clear();\
		if (var.m_Type!=CScriptValue::SVT_ARRAY)\
		{\
			ASSERT(0);\
			return false;\
		}\
		const unsigned int ARRAY_SIZE = var.m_ArrVal.size();\
		unsigned int i;\
		for (i=0; i<ARRAY_SIZE; ++i)\
		{\
			value.push_back((DOUBLE_LIKE_TYPE)0);\
		}\
		for (i=0; i<ARRAY_SIZE; ++i)\
		{\
			if (var.m_ArrKey[i].m_Type!=CScriptValue::SVT_NUMBER ||\
				var.m_ArrVal[i].m_Type!=CScriptValue::SVT_NUMBER)\
			{\
				ASSERT(0);\
				value.clear();\
				return false;\
			}\
			unsigned int iKey = (unsigned int)var.m_ArrKey[i].GetDouble()-1;\
			if (iKey>=ARRAY_SIZE)\
			{\
				ASSERT(0);\
				value.clear();\
				return false;\
			}\
			value[iKey] = (DOUBLE_LIKE_TYPE)var.m_ArrVal[i].GetDouble();\
		}\
		return true;\
	}\




//////////////////////////////////////////////////////////////////////////
//implementation

namespace GNET
{	
	void AddString(abase::vector<CScriptValue>& varList, const AString& str)
	{
		CScriptString sv;
		sv.SetAString(str);
		varList.push_back(sv);
	}
	void AddString(abase::vector<CScriptValue>& varList, const AWString& str)
	{
		CScriptString sv;
		sv.SetAWString(str);
		varList.push_back(sv);
	}
	void AddNumber(abase::vector<CScriptValue>& varList, double number)
	{
		varList.push_back(number);
	}
	void AddBoolean(abase::vector<CScriptValue>& varList, bool b)
	{
		varList.push_back(b);
	}
	void AddArray(abase::vector<CScriptValue>& varList, const abase::vector<CScriptValue>& vals )
	{
		varList.push_back( CScriptValue() );
		varList.back().SetArray( const_cast<abase::vector<CScriptValue>&>(vals) );
	}
	void AddVar(abase::vector<CScriptValue>& varList, const CScriptValue& var )
	{
		varList.push_back(var);
	}
	void AddEmptyTable(abase::vector<CScriptValue>& varList)
	{
		CScriptValue v;
		v.m_Type = CScriptValue::SVT_ARRAY;
		varList.push_back(v);
	}


	typedef abase::vector<CScriptValue> ScriptValueVector;
	_IMPLEMENT_GET_VAR_DOUBLE_LIKE(int);
	

	//辅助函数，将std中的数字列表放到 CScriptValue 数组中
	bool SetKVPaires_Vector(abase::vector<CScriptValue>& keys,abase::vector<CScriptValue>& vals,const char* pKey, const std::vector<int>& list)
	{
		if (list.size()<=0 || !pKey)
		{
			return false;
		}
		
		abase::vector<CScriptValue> keysTemp, valsTemp;
		std::vector<int>::const_iterator it=list.begin();
		int i=0;
		for (;it!=list.end();++it)
		{
			SetKVPaires(keysTemp,valsTemp,(double)(i+1), (double)(*it));
			i++;
		}
		
		CScriptValue varValue;
		varValue.SetArray(valsTemp, keysTemp);
		vals.push_back(varValue);
		
		CScriptValue varKey;
		varKey.SetVal(pKey);
		keys.push_back(varKey);
		return true;
	}


	bool CallFunc(abase::vector<CScriptValue>& args, abase::vector<CScriptValue>& results, const char* pTable, const char* pFunc)
	{
		results.clear();
		if (!pFunc)
		{
			ASSERT(0);
			return false;
		}
		CLuaState *pState = g_LuaStateMan.GetAIState();
		if (!pState)
		{
			ASSERT(0);
			return false;
		}
		return pState->LockCall(pTable, pFunc, args, results);
	}
}
