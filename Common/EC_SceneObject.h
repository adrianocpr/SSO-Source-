/*
 * FILE: EC_SceneObject.h
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Duyuxin, 2004/10/15
 *
 * HISTORY: 
 *
 * Copyright (c) 2004 Archosaur Studio, All Rights Reserved.
 */

#pragma once

#include "EC_SceneThreadObj.h"

///////////////////////////////////////////////////////////////////////////
//	
//	Define and Macro
//	
///////////////////////////////////////////////////////////////////////////


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


///////////////////////////////////////////////////////////////////////////
//	
//	Class CECSceneObject
//	
///////////////////////////////////////////////////////////////////////////

class CECSceneObject : public CECSceneThreadObj
{
public:		//	Types
	
	//	Object type
	enum
	{
		TYPE_WATER = 0,		//	Water area
		TYPE_GRASS,			//	Grass area
		TYPE_BOXAREA,		//	Box area
		TYPE_CRITTER,		//	Critter group
		TYPE_ORNAMENT,		//	Ornament
		TYPE_BEZIER,		//	Bezier curve
		TYPE_MIRROR,		//	Mirror
	};

public:		//	Constructor and Destructor

	CECSceneObject(int iType) { m_iType = iType; m_iRefCnt = 1; }
	virtual ~CECSceneObject() {}

public:		//	Attributes

public:		//	Operations

	//	Add reference counter
	inline void AddReference() { m_iRefCnt++; }
	//	Decrease reference counter
	inline void DecreaseReference() { m_iRefCnt--; }
	//	Get reference counter
	inline int GetReference() { return m_iRefCnt; }
	//	Get type
	inline int GetType() { return m_iType; }

protected:	//	Attributes

	int		m_iType;		//	Object type
	int		m_iRefCnt;		//	Reference counter

protected:	//	Operations

};

///////////////////////////////////////////////////////////////////////////
//	
//	Inline functions
//	
///////////////////////////////////////////////////////////////////////////


