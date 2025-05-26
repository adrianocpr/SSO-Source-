/********************************************************************
  created:	   19/4/2006  
  filename:	   LuaBind.cpp
  author:      Wangkuiwu  
  description: 
  Copyright (c) , All Rights Reserved.
*********************************************************************/

#include "StdAfx.h"
#include "LuaBind.h"

#include "EC_Global.h"
#include "EC_Model.h"
#include "LuaState.h"
#include "LuaScript.h"
#include "LuaUtil.h"

int LuaLoadFile(lua_State * L);

extern "C" {
	int luaopen_lpeg (lua_State *L);
	int luaopen_pack(lua_State *L);
}

const luaL_Reg ai_preload_clibs[] =
{
	{"lpeg", luaopen_lpeg},
	{"pack", luaopen_pack},
	{NULL, NULL},
};

const	AString  ai_preload_scripts[] = 
{
    _EA("script\\bootstrap.lua"),
	_EA("script\\Constant.lua"),
	_EA("script\\utility.lua"),
	_EA("script\\map\\route_func.lua"),
	_EA(""),
};

const	AString  cfg_preload_scripts[] = 
{
	_EA(""),
};

static void OpenCLibs(lua_State* L)
{
	lua_getglobal(L, "package");
	lua_getfield(L, 1, "preload");

	const luaL_Reg* lib = ai_preload_clibs;
	for (; lib->func; lib++)
	{
		lua_pushstring(L, lib->name);
		lua_pushcfunction(L, lib->func);
		lua_settable(L, 2);
	}
	lua_pop(L, 2);
}

int LuaLoadFile(lua_State * L)
{
    const char * name = luaL_checkstring(L, 1);
    CLuaState * pState = g_LuaStateMan.GetAIState();
    CLuaScript * pScript = pState->Register(name);
    if (!pScript->FromFile(name))
    {
        pState->UnRegister(name);

        AString msg;
        msg.Format("LuaLoadFile: can not open script %s\n", name);
        //LUA_DEBUG_INFO(msg);
        lua_pushnil(L);
        lua_pushstring(L, msg);
        return 2;  // return nil plus error message
    }

    int status = LuaBind::LoadFileImage(L, name);
    if (status == 0)  /* OK? */
        return 1;

    lua_pushnil(L);
    lua_insert(L, -2);  /* put before error message */
    return 2;  /* return nil plus error message */
}

bool LuaPreLoad(const AString* preload_scripts, CLuaState * pState)
{

	pState->Lock(); //??? need lock?
	int i = 0;
	bool ret = true;
	while (preload_scripts[i].GetLength())
	{
		CLuaScript * pScript = pState->RegisterFile(preload_scripts[i]);
		if (!pScript)
		{
			ret = false;
			glb_ErrorOutput(ECERR_FAILEDTOCALL, preload_scripts[i], __LINE__);

			break;
		}
		++i;
	}		
	
	pState->Unlock();
	return  ret;
}

static int _DummyFunction(lua_State* L)
{
	return 0;
}

static void _InitContext(lua_State* L)
{
	// provide TemplPos.GetPos() a dummy function
	// _G.TemplPos = {GetPos = function() end}
	lua_newtable(L);
	lua_pushcfunction(L, _DummyFunction);
	lua_setfield(L, -2, "GetPos");
	lua_setglobal(L, "TemplPos");

	// provide console.error() a dummy function
	lua_newtable(L);
	lua_pushcfunction(L, _DummyFunction);
	lua_setfield(L, -2, "error");
	lua_setglobal(L, "console");
}

bool LuaInit(bool bEnableDebug)
{

	if (!g_LuaStateMan.Init(bEnableDebug))
	{
		ASSERT(0);
		return false;
	}

	lua_State* L = g_LuaStateMan.GetAIState()->GetVM();

	OpenCLibs(L);
	_InitContext(L);
    lua_register(L, "LuaLoadFile", LuaLoadFile);
	
	InitECMApi(g_LuaStateMan.GetConfigState());

	if (!LuaPreLoad(ai_preload_scripts, g_LuaStateMan.GetAIState()) 
		||!LuaPreLoad(cfg_preload_scripts, g_LuaStateMan.GetConfigState())  )
	{
	  return false;
	}

	return true;
}

void LuaRelease()
{
	g_LuaStateMan.Release();
}


