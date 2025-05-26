/********************************************************************
	created:	2008/11/24
	author:		liudong
	
	purpose:   common functions about lua.
	Copyright (C) 2008 - All Rights Reserved
*********************************************************************/
#pragma once

//  VC的STL库使用, 会保证STL不会越界修改容器
//  _SECURE_SCL为1, 标志Checked Iterators开启
// _SECURE_SCL_THROWS为1, 标志如果出现这样的错误, 就抛出一个异常
#define _SECURE_SCL  1
#define _SECURE_SCL_THROWS  1
#include <vector>
#include <vector.h>
#include <ABaseDef.h>
#include <AWString.h>
#include <APoint.h>
#include <ARect.h>

#include "LuaAPI.h"
#include "LuaUtil.h"





namespace GNET
{

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


	// 向 varList 尾部增加一个成员，填充数据。
	void AddString (abase::vector<CScriptValue>& varList, const AString& str);
	void AddString (abase::vector<CScriptValue>& varList, const AWString& str);
	void AddNumber (abase::vector<CScriptValue>& varList, double number);
	void AddBoolean(abase::vector<CScriptValue>& varList, bool b);
	void AddArray  (abase::vector<CScriptValue>& varList, const abase::vector<CScriptValue>& vals );
	void AddVar    (abase::vector<CScriptValue>& varList, const CScriptValue& var );
	void AddEmptyTable(abase::vector<CScriptValue>& varList);

	// 对table添加成员。三个版本:
	//   const char* key 表示成员键为字符串
	//   index 表示键为序号
	void AddString (CScriptValue& table, const AString& str, const char* key);
	void AddString (CScriptValue& table, const AString& str, int index );
	
	void AddString (CScriptValue& table, const AWString& str, const char* key);
	void AddString (CScriptValue& table, const AWString& str, int index);

	void AddNumber (CScriptValue& table, double number, const char* key);
	void AddNumber (CScriptValue& table, double number, int index);

	void AddBoolean(CScriptValue& table, bool b, const char* key);
	void AddBoolean(CScriptValue& table, bool b, int index);

	void AddArray  (CScriptValue& table, const abase::vector<CScriptValue>& vals, const char* key);
	void AddArray  (CScriptValue& table, const abase::vector<CScriptValue>& vals, int index);

	void AddVar    (CScriptValue& table, const CScriptValue& var, int index);


	//辅助函数，将数字列表放到 CScriptValue 数组中
	bool SetKVPaires_Vector(abase::vector<CScriptValue>& keys,abase::vector<CScriptValue>& vals,const char* pKey,const std::vector<int>& list);


	//数组，table中的key必须全是数字、从1开始连续没有空洞，否则取不出来。
	bool GetValue(abase::vector<int>& value, const CScriptValue& var);


	//加载脚本，返回脚本中某个函数的调用结果，然后释放脚本资源、释放新加载进来的table。
	bool CallFunc(abase::vector<CScriptValue>& args, abase::vector<CScriptValue>& results, const char* pTable, const char* pFunc);
	
};