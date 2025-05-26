/*
 * FILE: EC_Resource.cpp
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Duyuxin, 2004/12/18
 *
 * HISTORY: 
 *
 * Copyright (c) 2004 Archosaur Studio, All Rights Reserved.
 */

#include "StdAfx.h"
#include "EC_Global.h"
#include "EC_Resource.h"

#define new A_DEBUG_NEW

///////////////////////////////////////////////////////////////////////////
//	
//	Define and Macro
//	
///////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////
//	
//	Reference to External variables and functions
//	
///////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////
//	
//	Local Types and Variables and Global variables
//	
///////////////////////////////////////////////////////////////////////////

//	Cursor resource
static const AString l_aCurFiles[NUM_RES_CURSOR] = 
{
	_EA("Cursors\\normal.ani"),
	_EA("Cursors\\attack.ani"),
	_EA("Cursors\\trans.ani"),
	_EA("Cursors\\storage.ani"),
	_EA("Cursors\\talk.ani"),
	_EA("Cursors\\pick.ani"),
	_EA("Cursors\\hand.ani"),
	_EA("Cursors\\hook.ani"),
	_EA("Cursors\\key.ani"),
	_EA("Cursors\\stove.ani"),
	_EA("Cursors\\shovel.ani"),
	_EA("Cursors\\teleport.cur"),
	_EA("Cursors\\learn.cur"),
	_EA("Cursors\\mail.cur"),
	_EA("Cursors\\destroy.ani"),
	_EA("Cursors\\drag.ani"),
	_EA("Cursors\\split.ani"),
	_EA("Cursors\\repair.ani"),
	_EA("Cursors\\buy.ani"),
	_EA("Cursors\\sell.ani"),
	_EA("Cursors\\magnifier.ani"),
	_EA("Cursors\\identify.ani"),
};

//	Shader files
static const AString l_aShaderFiles[NUM_RES_SHD] = 
{
	_EA("shaders\\2.2\\ps\\SDS\\armor"),
	_EA("shaders\\2.2\\ps\\SDS\\stone"),
	_EA("shaders\\2.2\\ps\\SDS\\weak"),
};

///////////////////////////////////////////////////////////////////////////
//	
//	Local functions
//	
///////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////
//	
//	Implement
//	
///////////////////////////////////////////////////////////////////////////

const char* res_CursorFile(int n)
{
	ASSERT(n >= 0 && n < NUM_RES_CURSOR);
	return l_aCurFiles[n];
}

const char* res_ShaderFile(int n)
{
	ASSERT(n >= 0 && n < NUM_RES_SHD);
	return l_aShaderFiles[n];
}
