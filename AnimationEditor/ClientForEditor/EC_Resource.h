/*
 * FILE: EC_Resource.h
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Duyuxin, 2004/12/18
 *
 * HISTORY: 
 *
 * Copyright (c) 2004 Archosaur Studio, All Rights Reserved.
 */

#pragma once

#include <A3DTypes.h>

///////////////////////////////////////////////////////////////////////////
//	
//	Define and Macro
//	
///////////////////////////////////////////////////////////////////////////

//	Cursor resource
enum
{
	RES_CUR_NORMAL = 0,
	RES_CUR_ATTACK,
	RES_CUR_TRADE,
	RES_CUR_STORE,
	RES_CUR_TALK,
	RES_CUR_PICKUP,
	RES_CUR_HAND,
	RES_CUR_HOOK,
	RES_CUR_KEY,
	RES_CUR_STOVE,
	RES_CUR_SHOVEL,
	RES_CUR_TRANSLATE,
	RES_CUR_LEARN,
	RES_CUR_MAIL,
	RES_CUR_DESTROY,
	RES_CUR_DRAG,
	RES_CUR_SPLIT,
	RES_CUR_REPAIR,
	RES_CUR_BUY,
	RES_CUR_SELL,
	RES_CUR_MAGNIFIER,
	RES_CUR_IDENTIFY,
	NUM_RES_CURSOR,
};

//	Shader resource
enum
{
	RES_SHD_ARMOR = 0,
	RES_SHD_STONE,
	RES_SHD_WEAK,
	NUM_RES_SHD,
};

//	Some unicode string resources
enum
{
	RES_FONT_TITLE = 0,
	RES_FONT_DAMAGE,
	NUM_RES_FONT,
};

///////////////////////////////////////////////////////////////////////////
//	
//	Types and Global variables
//	
///////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////
//	
//	Declare of Global functions
//	
///////////////////////////////////////////////////////////////////////////

const char* res_CursorFile(int n);
const char* res_ShaderFile(int n);

///////////////////////////////////////////////////////////////////////////
//	
//	Inline functions
//	
///////////////////////////////////////////////////////////////////////////

