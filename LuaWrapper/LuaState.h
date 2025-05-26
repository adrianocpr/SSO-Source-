/********************************************************************
	created:	2006/08/07
	author:		kuiwu
	
	purpose:	an independent lua state.
	history:    add the script lists to the class state  [9/10/2007 kuiwu]
				move CLuaDebug object from CLuaStateMan to CLuaState
	
	Copyright (C) 2006 - All Rights Reserved
*********************************************************************/
#pragma once

#include <windows.h>
#include <vector.h>
#include <hashmap.h>
#include <AString.h>
#include <vector.h>
#include <AMiscUtility.h>

struct lua_State;
class CScriptValue;
class CLuaScript;
class CLuaDebug;
class CScriptCallContext;

class CLuaState  
{
public:
	typedef abase::hash_map<AString, CLuaScript*> ScriptMap;
	class AutoLock
	{
	public:
		AutoLock(const CLuaState* pState) : m_pState(pState) { if(m_pState) m_pState->Lock(); }
		~AutoLock() { if(m_pState) m_pState->Unlock(); }
	private:
		const CLuaState* m_pState;
	};

public:
	CLuaState();
	virtual ~CLuaState();

	void Release();
	bool Init(int debugType);
	// lock and call
	//note: it will be efficient that cache calls in the same os thread using the 
	//      LuaBind::call directly.
	bool LockCall(const char * szTbl, const char * szMethod, const abase::vector<CScriptValue>& args, abase::vector<CScriptValue>& results);
	bool LockCall(const char * szTbl, const char * szMethod, const abase::vector<CScriptValue>* args = NULL, abase::vector<CScriptValue>* results = NULL);
	bool LockCall(const char * szTbl, const char * szMethod, CScriptCallContext& context);
	//call, the caller should handle lock/unlock the state if running in the multi-thread env. 
	bool Call(const char * szTbl, const char * szMethod, const abase::vector<CScriptValue>& args, abase::vector<CScriptValue>& results);
	bool Call(const char * szTbl, const char * szMethod, const abase::vector<CScriptValue>* args = NULL, abase::vector<CScriptValue>* results = NULL);
	bool Call(const char * szTbl, const char * szMethod, CScriptCallContext& context);
	//it will be efficient that
	//the caller caches server ops during one lock/unlock pair in the multi-thread environment
	void Lock() const;
	void Unlock() const;

	//just register a script, not fill the script content and execute
	CLuaScript * Register(const char * szName);
	//register, fill the script content and execute
	CLuaScript * RegisterFile(const char * szFileName);
	CLuaScript * RegisterBuffer(const char * szBufName, const char * buf, int len);
	
	void         RegisterLibApi(const char * libName);
	void         ReleaseTbl(const char * tblName);
	/**
	 * \brief unregister a buffer(file)
	 * \param[in]  szName, buffer(file) name
	 * \param[in]  rmTbls, the tables need to be removed when the buffer is unregistered.
	 *					   it will be helpful to notify lua it the table is never used.
	 */
	void         UnRegister(const char * szName, abase::vector<AString>* rmTbls = NULL);
	CLuaScript * GetScript(const char * szName);

	void Tick();

	lua_State * GetVM() { return m_pState; }
	CLuaDebug * GetDebug() { return m_pLuaDebug;	}
	ScriptMap * GetAllScripts() { return &m_LuaScripts; }
	bool IsDebugEnabled() const;
	void EnableDebug(const bool enable);

protected:
	lua_State * m_pState;
	mutable CRITICAL_SECTION m_csVisit;
	ScriptMap m_LuaScripts;
	CLuaDebug * m_pLuaDebug;

	DECLARE_UNCOPYABLE(CLuaState);
};

class CLuaStateMan
{
public:
	~CLuaStateMan();

	bool Init(bool bEnableDebug = false);
	void Release();
	//the state  treats lua script as a config file, run once.
	CLuaState* GetConfigState(){ return m_ConfigState; }
	//the state commonly used, treats lua script as a logic file.
	CLuaState* GetAIState(){ return m_AIState; }
	CLuaState* GetState(lua_State * L);
	unsigned int GetCodePage() const{ return m_CodePage; }
	void SetCodePage(unsigned int cp){ m_CodePage = cp; }
	void Tick(DWORD dwTick);

	static CLuaStateMan& GetInstance(){ return s_instance; }

private:
	CLuaState *							m_ConfigState;
	CLuaState *							m_AIState;
	unsigned int						m_CodePage;
	static CLuaStateMan					s_instance;

	DECLARE_SINGLETON(CLuaStateMan);
};
#define g_LuaStateMan CLuaStateMan::GetInstance()
