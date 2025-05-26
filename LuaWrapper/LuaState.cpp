/********************************************************************
	created:	2006/08/07
	author:		kuiwu
	
	purpose:	an independent lua state.
	Copyright (C) 2006 - All Rights Reserved
*********************************************************************/

#include "LuaState.h"
#include <lua.hpp>
#include <assert.h>
#include "LuaUtil.h"
//#include "LuaThread.h"
#include "ScriptValue.h"
#include "LuaScript.h"
#include "LuaDebug.h"
#include "LuaDebugMsg.h"
#include "LuaAPI.h"
#include <ACriticalSectionUtility.h>

//////////////////////////////////////////////////////////////////////////
//local

static void * LuaWrapperRealloc (void *ud, void *ptr, size_t osize, size_t nsize)
{
	(void)ud; (void)osize;	// not used
	if(nsize == 0)
	{
		a_free(ptr);
		return NULL;
	}
	else
	{
		return a_realloc(ptr, nsize);
	}
}

static int LuaWrapperPanic (lua_State *L) 
{
	(void)L;  /* to avoid warnings */
	AString errMsg;
	const int tp = lua_type(L, -1);
	if (LUA_TNUMBER==tp)
	{
		errMsg.Format("%d",lua_tonumber(L, -1));
	}else if (LUA_TSTRING==tp)
	{
		errMsg = lua_tostring(L, -1);
	}else
	{
		errMsg = "unknown panic error";
	}
	fprintf(stderr, "PANIC: unprotected error in call to Lua API (%s)\n",errMsg);
	return 0;
}

static int LogPrint(lua_State * L)
{
	const char * msg = luaL_checkstring(L, 1);
	CScriptString str;
	str.SetUtf8(msg, strlen(msg));
	AString out;
	str.RetrieveAString(out);
	LuaBind::OutputDbgInfo(out);
	return 0;
}

static int LuaInclude(lua_State * L)
{
	const char * name = luaL_checkstring(L, 1);
	CScriptString str;
	str.SetUtf8(name, strlen(name));
	AString out;
	str.RetrieveAString(out);
	CLuaState * pState = CLuaStateMan::GetInstance().GetState(L);
	if (pState)
	{
		if (!pState->RegisterFile(out))
		{
			a_LogOutput(1, "LuaInclude: fail to register file %s", name);
		}
	}
	return 0;
}


///////////////////////////////////////////////////////////////////////////
//	
//	Implementation of CLuaState
//	
///////////////////////////////////////////////////////////////////////////

CLuaState::CLuaState()
{
	m_pState = NULL;
	m_pLuaDebug = NULL;
	::InitializeCriticalSection(&m_csVisit);
}

CLuaState::~CLuaState()
{
	Release();
	::DeleteCriticalSection(&m_csVisit);
}

bool CLuaState::Init(int debugType)
{
	AutoLock _auto_lock(this);
	Release();
	m_pState = lua_newstate(LuaWrapperRealloc, NULL);
	if (m_pState)
	{
		lua_atpanic(m_pState, &LuaWrapperPanic);
		//open default libs
		luaL_openlibs(m_pState);
		lua_register(m_pState, "LogPrint", LogPrint);
		lua_register(m_pState, "LuaInclude", LuaInclude);
		lua_register(m_pState, "_ERRORMESSAGE", LuaBind::ErrorCallback);

	}
	else
	{
		return false;
	}

	if (debugType != D_NONE) 
	{
		m_pLuaDebug = new CLuaDebug(debugType);
		m_pLuaDebug->SetState(this);
		if (!m_pLuaDebug->Init())
		{
			delete m_pLuaDebug;
			m_pLuaDebug = NULL;
			//let it work without debug
			//return false;
		}
	}
	else
	{
		m_pLuaDebug = NULL;
	}

	return true;
}

void CLuaState::Release()
{
	AutoLock _auto_lock(this);

	ScriptMap::iterator it;
	for (it = m_LuaScripts.begin(); it != m_LuaScripts.end(); ++it)
	{
		if (it->second)
		{
			delete it->second;
		}
	}

	m_LuaScripts.clear();

	if (m_pState)
	{
		lua_close(m_pState);
		m_pState = NULL;
	}

	if (m_pLuaDebug)
	{
		delete m_pLuaDebug;
		m_pLuaDebug = NULL;
	}
}


void CLuaState::Tick()
{
	if (!IsDebugEnabled())
	{
		return;
	}
	{
		AutoLock _auto_lock(this);
		m_pLuaDebug->Tick();
	}
}

CLuaScript * CLuaState::Register(const char * szName)
{
	AutoLock _auto_lock(this);
	CLuaScript * script = m_LuaScripts[szName];
	if (!script)
	{
		script = new CLuaScript(this);
		m_LuaScripts[szName]  = script;
	}
	script->IncRefCount();
	return script;
}

CLuaScript * CLuaState::RegisterFile(const char * szFileName)
{
	AutoLock _auto_lock(this);
 	CLuaScript * script = GetScript(szFileName);

	if (!script)
	{
		script = new CLuaScript(this);
		m_LuaScripts[szFileName]  = script;
		if (!script->FromFile(szFileName) || script->Execute() == CLuaScript::EXECUTE_FAIL)
		{
			delete script;
			AString msg;
			msg.Format("CLuaState::RegisterFile, register %s fail\n", szFileName);
			LUA_DEBUG_INFO(msg);
			m_LuaScripts[szFileName]  = NULL;
			return NULL;
		}
	}
	script->IncRefCount();
	return script;
}

CLuaScript * CLuaState::RegisterBuffer(const char * szBufName, const char * buf, int len)
{
	AutoLock _auto_lock(this);
 	CLuaScript * script = GetScript(szBufName);

	if (!script)
	{
		script = new CLuaScript(this);
		if (!script->FromBuffer(szBufName, buf, len) || script->Execute() == CLuaScript::EXECUTE_FAIL)
		{
			delete script;
			AString msg;
			msg.Format("CLuaState::RegisterBuffer, register %s fail\n", szBufName);
			LUA_DEBUG_INFO(msg);
			return NULL;
		}
		m_LuaScripts[szBufName]  = script;
	}
	script->IncRefCount();
	return script;
}

void CLuaState::UnRegister(const char * szName, abase::vector<AString>* rmTbls /* = NULL */)
{
	AutoLock _auto_lock(this);
	CLuaScript * script = GetScript(szName);

	if (script)
	{
		script->DecRefCount();
		if (script->GetRefCount() > 0)
		{
			return;
		}
	}

	m_LuaScripts.erase(szName);
	if (script)
	{
		if (rmTbls)
		{
			unsigned int i;
			for (i = 0; i < rmTbls->size(); i++)
			{
				LuaBind::ReleaseTbl(GetVM(), rmTbls->at(i));
			}
		}
		delete script;
	}


}


void CLuaState::RegisterLibApi(const char * libName)
{
	AutoLock _auto_lock(this);
	LuaBind::Reg2Script(m_pState, libName);
}

bool CLuaState::IsDebugEnabled() const
{
	AutoLock _auto_lock(this);
	return (m_pLuaDebug && m_pLuaDebug->IsInDebug());
}

void CLuaState::EnableDebug(bool enable)
{
	AutoLock _auto_lock(this);
	if (m_pLuaDebug)
	{
		m_pLuaDebug->SetInDebug(enable);
	}
}

CLuaScript * CLuaState::GetScript(const char * szName)
{
	ScriptMap::iterator it = m_LuaScripts.find(szName);
	return it != m_LuaScripts.end() ? it->second : NULL;
}

void CLuaState::Lock() const
{
	::EnterCriticalSection(&m_csVisit);
}

void CLuaState::Unlock() const
{
	::LeaveCriticalSection(&m_csVisit);
}

bool CLuaState::LockCall(const char * szTbl, const char * szMethod, const abase::vector<CScriptValue>& args, abase::vector<CScriptValue>& results)
{
	return LockCall(szTbl, szMethod, &args, &results);
}

bool CLuaState::LockCall( const char * szTbl, const char * szMethod, const abase::vector<CScriptValue>* args /*= NULL*/, abase::vector<CScriptValue>* results /*= NULL*/ )
{
	if (!m_pState)
	{
		return false;
	}
	{
		AutoLock _auto_lock(this);
		return LuaBind::Call(m_pState, szTbl, szMethod, args, results);
	}
}

bool CLuaState::LockCall( const char * szTbl, const char * szMethod, CScriptCallContext& context )
{
	return LockCall(szTbl, szMethod, context.args(), context.results());
}

bool CLuaState::Call(const char * szTbl, const char * szMethod, const abase::vector<CScriptValue>& args, abase::vector<CScriptValue>& results)
{
	return Call(szTbl, szMethod, &args, &results);
}

bool CLuaState::Call( const char * szTbl, const char * szMethod, const abase::vector<CScriptValue>* args /*= NULL*/, abase::vector<CScriptValue>* results /*= NULL*/ )
{
	if (!m_pState)
	{
		return false;
	}

	return LuaBind::Call(m_pState, szTbl, szMethod, args, results);
}

bool CLuaState::Call( const char * szTbl, const char * szMethod, CScriptCallContext& context )
{
	return Call(szTbl, szMethod, context.args(), context.results());
}

void CLuaState::ReleaseTbl(const char * tblName)
{
	LuaBind::ReleaseTbl(m_pState, tblName);
}

///////////////////////////////////////////////////////////////////////////
//	
//	Implementation of CLuaStateMan
//	
///////////////////////////////////////////////////////////////////////////

CLuaStateMan CLuaStateMan::s_instance;

CLuaStateMan::CLuaStateMan()
{	
	m_ConfigState = NULL;
	m_AIState = NULL;
	m_CodePage = CP_ACP; 
} 

CLuaStateMan::~CLuaStateMan()
{
}

bool CLuaStateMan::Init(bool bEnableDebug)
{
	m_ConfigState = new CLuaState;
	m_AIState   = new CLuaState;
	if (bEnableDebug) {
		if (!m_ConfigState->Init(D_CFG) || !m_AIState->Init(D_AI))
		{
			return false;
		}
	}
	else {
		if (!m_ConfigState->Init(D_NONE) || !m_AIState->Init(D_NONE))
		{
			return false;
		}
	}

	return true;
}

CLuaState * CLuaStateMan::GetState(lua_State * L)
{
	if (m_ConfigState->GetVM() == L)
	{
		return m_ConfigState;
	}
	if (m_AIState->GetVM() == L)
	{
		return m_AIState;
	}

	return NULL;
}

void CLuaStateMan::Release()
{
	if (m_ConfigState)
	{
		delete m_ConfigState;
		m_ConfigState = NULL;
	}
	if (m_AIState)
	{
		delete m_AIState;
		m_AIState = NULL;
	}
}

void CLuaStateMan::Tick(DWORD dwTick)
{
	static DWORD period = 0;
	period += dwTick;
	if (period > 200)
	{
		m_AIState->Tick();
		m_ConfigState->Tick();
		period = 0;
	}
}