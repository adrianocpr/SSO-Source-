/********************************************************************
	created:	2007/06/11
	author:		kuiwu
	
	purpose:	
	Copyright (C) 2007 - All Rights Reserved
*********************************************************************/
#pragma once
#include "ScriptValue.h"

namespace LuaBind
{
	typedef void (*_LuaWrapperAPIFunc)(abase::vector<CScriptValue>& /* args */, abase::vector<CScriptValue>& /* results */);

	inline int _imp_api(lua_State* L, _LuaWrapperAPIFunc func)
	{
		CScriptCallContext context;
		GetStack(L, context.args(), 1);
		func(context.args(), context.results());
		SetStack(L, context.results());
		return context.results().size();
	}

#define IMPLEMENT_SCRIPT_API(api)  \
	int Imp##api(lua_State * L)\
	{\
		return _imp_api(L, api);\
	}

#define REGISTER_SCRIPT_API(lib, api) \
	{\
		__add_Script_Api(#lib, #api, Imp##api);\
	}
	void __add_Script_Api(const char * libname, const char * apiname, lua_CFunction  api);
	
	/**
	 * \brief register all apis to script
	 * \param[in]
	 * \param[out]
	 * \return
	 * \note should be called only once after implementing apis. 
	 * \warning
	 * \todo   
	 * \author kuiwu 
	 * \date 11/9/2006
	 * \see 
	 */
	void Reg2Script(lua_State * L);
	void Reg2Script(lua_State * L, const char * libName);
}