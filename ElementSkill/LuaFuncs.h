/********************************************************************
	created:	2008/11/24
	author:		liudong
	
	purpose:   common functions about lua.
	Copyright (C) 2008 - All Rights Reserved
*********************************************************************/
#pragma once

//  VC��STL��ʹ��, �ᱣ֤STL����Խ���޸�����
//  _SECURE_SCLΪ1, ��־Checked Iterators����
// _SECURE_SCL_THROWSΪ1, ��־������������Ĵ���, ���׳�һ���쳣
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


	// �� varList β������һ����Ա��������ݡ�
	void AddString (abase::vector<CScriptValue>& varList, const AString& str);
	void AddString (abase::vector<CScriptValue>& varList, const AWString& str);
	void AddNumber (abase::vector<CScriptValue>& varList, double number);
	void AddBoolean(abase::vector<CScriptValue>& varList, bool b);
	void AddArray  (abase::vector<CScriptValue>& varList, const abase::vector<CScriptValue>& vals );
	void AddVar    (abase::vector<CScriptValue>& varList, const CScriptValue& var );
	void AddEmptyTable(abase::vector<CScriptValue>& varList);

	// ��table��ӳ�Ա�������汾:
	//   const char* key ��ʾ��Ա��Ϊ�ַ���
	//   index ��ʾ��Ϊ���
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


	//�����������������б�ŵ� CScriptValue ������
	bool SetKVPaires_Vector(abase::vector<CScriptValue>& keys,abase::vector<CScriptValue>& vals,const char* pKey,const std::vector<int>& list);


	//���飬table�е�key����ȫ�����֡���1��ʼ����û�пն�������ȡ��������
	bool GetValue(abase::vector<int>& value, const CScriptValue& var);


	//���ؽű������ؽű���ĳ�������ĵ��ý����Ȼ���ͷŽű���Դ���ͷ��¼��ؽ�����table��
	bool CallFunc(abase::vector<CScriptValue>& args, abase::vector<CScriptValue>& results, const char* pTable, const char* pFunc);
	
};