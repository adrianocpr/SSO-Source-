/********************************************************************
created:	2008/11/24
author:		liudong

  purpose:   common functions about lua.
  Copyright (C) 2008 - All Rights Reserved
*********************************************************************/
#include "StdAfx.h"
#include "LuaFuncCommon.h"
#include "LuaState.h"
#include "EC_Global.h"
#include "EC_Configs.h"
#include "EC_Utility.h"
#include "EC_Algorithm.h"

//////////////////////////////////////////////////////////////////////////
// macros

#define _IMPLEMENT_GET_VAR_DOUBLE_LIKE(DOUBLE_LIKE_TYPE) \
	bool GetValue(DOUBLE_LIKE_TYPE& value, const CScriptValue& varTable, const wchar_t* pKey, const DOUBLE_LIKE_TYPE defaultVal)\
	{\
		const CScriptValue* pVar = GetValue(varTable,pKey);\
		if (!pVar || CScriptValue::SVT_NUMBER!=pVar->m_Type)\
		{\
			value = defaultVal;\
			return false;\
		}\
		value = (DOUBLE_LIKE_TYPE)pVar->GetDouble();\
		return true;\
	}\
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
	bool GetValue(abase::vector<DOUBLE_LIKE_TYPE>& value, const CScriptValue& var, const wchar_t* pKey)\
	{\
		value.clear();\
		const CScriptValue* pVar = GetValue(var,pKey);\
		if (!pVar)\
		{\
			return false;\
		}\
		return GetValue(value, *pVar);\
	}

//////////////////////////////////////////////////////////////////////////
//implementation

namespace luaf
{
	// local types and  functions
	struct sScriptWrapper
	{
		sScriptWrapper(const int _iKey, const CScriptValue* _pVal)
		{
			iKey	= _iKey;
			pVal	= const_cast<CScriptValue*>(_pVal);
		}
		int			iKey;
		CScriptValue* pVal;
	};

	struct sCompareScriptWrapper
	{
		bool operator ()(const sScriptWrapper& seg1, const sScriptWrapper& seg2)
		{
			return seg1.iKey < seg2.iKey;
		}
	};



	_IMPLEMENT_GET_VAR_DOUBLE_LIKE(double);
	_IMPLEMENT_GET_VAR_DOUBLE_LIKE(float);
	_IMPLEMENT_GET_VAR_DOUBLE_LIKE(int);
	_IMPLEMENT_GET_VAR_DOUBLE_LIKE(unsigned int);
	_IMPLEMENT_GET_VAR_DOUBLE_LIKE(unsigned long);



	//__int64
	bool GetValue(__int64& value, const CScriptValue& varTable, const wchar_t* pKey, const __int64 defaultVal)
	{
		AWString valTemp;
		bool bResult = GetValue(valTemp, varTable, pKey);
		value = defaultVal;
		if (bResult)
		{
			g_StringToInt64(value,valTemp);
		}
		return bResult;
	}
	bool GetValue(abase::vector<__int64>& value,const CScriptValue& var)
	{
		value.clear();
		abase::vector<AWString> valTemp;
		bool bResult = GetValue(valTemp, var);
		for (unsigned int i=0; i<valTemp.size(); ++i)
		{
			__int64 temp = 0;
			g_StringToInt64(temp,valTemp[i]);
			value.push_back(temp);
		}
		return bResult;
	}
	bool GetValue(abase::vector<__int64>& value,const CScriptValue& var, const wchar_t* pKey)
	{
		value.clear();
		const CScriptValue* pVar = GetValue(var,pKey);
		if (!pVar)
		{
			return false;
		}
		return GetValue(value, *pVar);
	}

	//CECID64
	bool GetValue(CECID64& value, const CScriptValue& varTable, const wchar_t* pKey, const __int64 defaultVal)
	{
		__int64 valTemp;
		bool bResult = GetValue(valTemp, varTable, pKey, defaultVal);
		value = valTemp;
		return bResult;
	}
	bool GetValue(abase::vector<CECID64>& value,const CScriptValue& var)
	{
		value.clear();
		abase::vector<__int64> valTemp;
		bool bResult = GetValue(valTemp, var);
		for (unsigned int i=0; i<valTemp.size(); ++i)
		{
			value.push_back(valTemp[i]);
		}
		return bResult;
	}
	bool GetValue(abase::vector<CECID64>& value,const CScriptValue& var, const wchar_t* pKey)
	{
		value.clear();
		const CScriptValue* pVar = GetValue(var,pKey);
		if (!pVar)
		{
			return false;
		}
		return GetValue(value, *pVar);
	}

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

	/*辅助函数，将数字列表放到 CScriptValue 数组中
	bool SetKVPaires_Vector(abase::vector<CScriptValue>& keys, abase::vector<CScriptValue>& vals, const char* pKey,  const RpcDataVector<int>& list)
	{
		std::vector<int> stdList;
		RpcDataVector<int>::iterator it;
		for (it = const_cast<std::vector<int>::iterator>(list.begin());it!=const_cast<std::vector<int>::iterator>(list.end());it++)
		{
			stdList.push_back((int)(*it));
		}
		return SetKVPaires_Vector(keys,vals,pKey,stdList);
	}*/

	const CScriptValue* GetValue(const CScriptValue& varTable, const wchar_t* pKey)
	{
		if (!pKey || CScriptValue::SVT_ARRAY != varTable.m_Type)
		{
			return NULL;
		}

		for (int i=0; i<(int)varTable.m_ArrKey.size(); ++i)
		{
			CScriptValue* pVar = const_cast<CScriptValue*>(&(varTable.m_ArrKey[i]));
			if (CScriptValue::SVT_STRING==pVar->m_Type)
			{
				AWString str;
 				pVar->RetrieveAWString(str);
				if (str==pKey)
				{
					return &(varTable.m_ArrVal[i]);
				}
			}
 		}
		return NULL;
	}

	bool GetValue(bool& value, const CScriptValue& varTable, const wchar_t* pKey, const bool defaultVal)
	{
		const CScriptValue* pVar = GetValue(varTable,pKey);
		if (!pVar || CScriptValue::SVT_BOOL!=pVar->m_Type)
		{
			value = defaultVal;
			return false;
		}
		value = pVar->GetBool();
		return true;
	}

	bool GetValue(AWString& value, const CScriptValue& varTable, const wchar_t* pKey, const wchar_t* defaultVal)
	{
		const CScriptValue* pVar = GetValue(varTable,pKey);
		if (!pVar || CScriptValue::SVT_STRING!=pVar->m_Type)
		{
			value = defaultVal;
			return false;
		}
		const_cast<CScriptValue*>(pVar)->RetrieveAWString(value);
		return true;
	}
	
	bool GetValue(AString& value,		const CScriptValue& varTable, const wchar_t* pKey, const char* defaultVal)
	{
		const CScriptValue* pVar = GetValue(varTable,pKey);
		if (!pVar || CScriptValue::SVT_STRING!=pVar->m_Type)
		{
			value = defaultVal;
			return false;
		}
		const_cast<CScriptValue*>(pVar)->RetrieveAString(value);
		return true;
	}

	bool GetValue(abase::vector<const CScriptValue*>& value, const CScriptValue& var)
	{
		value.clear();
		if (var.m_Type!=CScriptValue::SVT_ARRAY)
		{
			ASSERT(0);
			return false;
		}
		const unsigned int ARRAY_SIZE = var.m_ArrVal.size();
		unsigned int i;
		for (i=0; i<ARRAY_SIZE; ++i)
		{
			value.push_back(NULL);
		}
		for (i=0; i<ARRAY_SIZE; ++i)
		{
			if (var.m_ArrKey[i].m_Type!=CScriptValue::SVT_NUMBER)
			{
				ASSERT(0);
				value.clear();
				return false;
			}
			unsigned int iKey = (unsigned int)var.m_ArrKey[i].GetDouble()-1;
			if (iKey>=ARRAY_SIZE)
			{
				ASSERT(0);
				value.clear();
				return false;
			}
			value[iKey] = &(var.m_ArrVal[i]);
		}

		return true;
	}

	bool GetValue(abase::vector<const CScriptValue*>& value, const CScriptValue& var, const wchar_t* pKey)
	{
		const CScriptValue* pVar = GetValue(var,pKey);
		if (!pVar)
		{
			return false;
		}
		return GetValue(value, *pVar);
	}

	bool GetValue(abase::vector<AWString>& value, const CScriptValue& var)
	{
		value.clear();
		abase::vector<const CScriptValue*> vecValue;
		if (!GetValue(vecValue,var))
		{
			return false;
		}
		unsigned int i;
		for ( i=0; i<vecValue.size(); ++i)
		{
			CScriptValue* pValue = const_cast<CScriptValue*>(vecValue[i]);
			if (pValue && CScriptValue::SVT_STRING==pValue->m_Type)
			{
				value.push_back(AWString());
				pValue->RetrieveAWString(value[value.size()-1]);
				
			}else
			{
				break;
			}
		}
		if (i!=vecValue.size())
		{
			value.clear();
			return false;
		}
		return true;
	}
	
	bool GetValue(abase::vector<AWString>& value, const CScriptValue& var, const wchar_t* pKey)
	{
		const CScriptValue* pVar = GetValue(var,pKey);
		if (!pVar)
		{
			return false;
		}
		return GetValue(value, *pVar);
	}


	bool GetValue(A3DVECTOR3& value ,const CScriptValue& var, const A3DVECTOR3& defaultVal)
	{
		abase::vector<float> vecTemp;
		if (!GetValue(vecTemp, var) || vecTemp.size()<3)
		{
			ASSERT(0);
			value = defaultVal;
			return false;
		}

		value.x = vecTemp[0];
		value.y = vecTemp[1];
		value.z = vecTemp[2];
		return true;
	}

	bool GetValue(A3DVECTOR3& value ,const CScriptValue& var, const wchar_t* pKey, const A3DVECTOR3& defaultVal)
	{
		const CScriptValue* pVar = GetValue(var,pKey);
		if (!pVar)
		{
			value = defaultVal;
			return false;
		}
		return GetValue(value, *pVar);
	}
	
	bool GetValue_NumberKey(abase::vector<const CScriptValue*>& value,const CScriptValue& var, const bool bSort)
	{
		value.clear();
		abase::vector<sScriptWrapper> vecTemp;
		unsigned int i;
		for ( i=0; i<var.m_ArrKey.size(); ++i)
		{
			const CScriptValue& key = var.m_ArrKey[i];
			const CScriptValue& val = var.m_ArrVal[i];
			if (CScriptValue::SVT_NUMBER != key.m_Type)
			{
				continue;
			}
			vecTemp.push_back(sScriptWrapper((int)key.GetDouble(),&val));
		}
		if (bSort)
		{
			BubbleSort(vecTemp.begin(), vecTemp.end(), sCompareScriptWrapper());
		}
		for (i=0; i<vecTemp.size(); ++i)
		{
			value.push_back(vecTemp[i].pVal);
		}
		return true;
	}

	bool GetValue_NumberKey(abase::vector<const CScriptValue*>& value,const CScriptValue& var, const wchar_t* pKey, const bool bSort)
	{
		value.clear();
		const CScriptValue* pVar = GetValue(var,pKey);
		if (!pVar)
		{
			return false;
		}
		return GetValue_NumberKey(value, *pVar, bSort);
	}

	bool CallFunc(abase::vector<CScriptValue>& args, abase::vector<CScriptValue>& results, const char* pTable, const char* pFunc)
	{
		results.clear();
		if (!pTable || !pFunc)
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
		pState->Call(pTable, pFunc, args, results);
		return true;
	}


	bool CallFuncInFile(abase::vector<CScriptValue>& results, const char* pFile, const char* pTable, const char* pFunc)
	{
		results.clear();
		if (!pFile || !pTable || !pFunc)
		{
			ASSERT(0);
			return false;
		}
		abase::vector<CScriptValue> args;
		CLuaState *pState = g_LuaStateMan.GetAIState();
		if (!pState)
		{
			ASSERT(0);
			return false;
		}
		CLuaScript* pLuaScript = pState->RegisterFile(pFile);
		if (!pLuaScript)
		{
			ASSERT(0);
			glb_ErrorOutput(ECERR_FAILEDTOCALL, pFile, __LINE__);
			return false;
		}
		pState->Call(pTable, pFunc, args, results);
		abase::vector<AString> vecTables;
		vecTables.push_back(pTable);
		pState->UnRegister(pFile,&vecTables);
		return true;
	}
	
	bool CallFuncInFile(abase::vector<CScriptValue>& results, const abase::vector<AString>& vecFile, const char* pTable, const char* pFunc)
	{
		results.clear();
		if (!vecFile.size() || !pTable || !pFunc)
		{
			ASSERT(0);
			return false;
		}
		abase::vector<CScriptValue> args;
		CLuaState *pState = g_LuaStateMan.GetAIState();
		if (!pState)
		{
			ASSERT(0);
			return false;
		}
		unsigned int i;
		for ( i=0; i<vecFile.size(); ++i)
		{
			if (!vecFile[i].GetLength())
			{
				ASSERT(0);
				continue;
			}
			CLuaScript* pLuaScript = pState->RegisterFile(vecFile[i]);
			if (!pLuaScript)
			{
				ASSERT(0);
				glb_ErrorOutput(ECERR_FAILEDTOCALL, vecFile[i], __LINE__);
			}
		}
		pState->Call(pTable, pFunc, args, results);
		for (i=1; i<vecFile.size(); ++i)
		{
			if (vecFile[i].GetLength())
			{
				pState->UnRegister(vecFile[i]);
			}
		}
		if (vecFile[0].GetLength())
		{
			abase::vector<AString> vecTables;
			vecTables.push_back(pTable);
			pState->UnRegister(vecFile[0],&vecTables);
		}
		return true;
	}

    bool GetScriptConfigTable(CScriptValue& valueOut, const char* pTable, const char* pFile, bool bUnRegister)
    {
        if (NULL == pTable)
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

        CLuaScript* pLuaScript = NULL;
        if (NULL != pFile)
        {
            pLuaScript = pState->RegisterFile(pFile);
            if (NULL == pLuaScript)
            {
                ASSERT(0);
                //a_LogOutput( ECERR_FAILEDTOCALL, pFile, __LINE__ );
                glb_ErrorOutput(ECERR_FAILEDTOCALL, pFile, __LINE__);
                return false;
            }
        }

        DEFINE_SCRIPT_CALL_CONTEXT(context, args, results);
        AString tableName = pTable;
        CScriptString str;
        str.SetAString(tableName);
        args.push_back(str);

        bool bRet = pState->Call(NULL, "glb_GetScriptConfigTable", args, results);
        ASSERT( bRet );  // make sure (utility.lua) glb_GetScriptConfigTable loaded 
        if (NULL != pLuaScript && bUnRegister)
        {
            abase::vector<AString> vecTables;
            vecTables.push_back(pTable);
            pState->UnRegister(pFile, &vecTables);
        }		
        if( bRet && results.size() )
        {
            valueOut = results[0];
        }
        else 
        {
            bRet = false;
        }

        return bRet;
    }


	bool glb_GetDetachScriptConfigTable(abase::vector<CScriptValue>& results, const char* pFile, const char* pTable)
	{
		results.clear();
		if (!pFile || !pTable)
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
		
		abase::vector<CScriptValue> args;
		AString fileName = pFile;
		CScriptString str;
		str.SetAString(fileName);
		args.push_back(str);
		AString tableName = pTable;
		str.SetAString(tableName);
		args.push_back(str);		
		
		bool bRet = pState->Call(NULL, "glb_GetDetachScriptConfigTable", args, results);
		abase::vector<AString> vecTables;
		vecTables.push_back(pTable);
		return bRet;
	}
}