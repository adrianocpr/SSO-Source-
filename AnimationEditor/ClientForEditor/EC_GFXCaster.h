/*
 * FILE: EC_GFXCaster.h
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Duyuxin, 2004/11/27
 *
 * HISTORY: 
 *
 * Copyright (c) 2004 Archosaur Studio, All Rights Reserved.
 */

#pragma once

#include "AArray.h"
#include "hashtab.h"
#include "A3DTypes.h"

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

class A3DGFXEx;
class A3DGFXExMan;
class CECViewport;
class CECModel;

///////////////////////////////////////////////////////////////////////////
//	
//	Declare of Global functions
//	
///////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////
//	
//	Class CECGFXCaster
//	
///////////////////////////////////////////////////////////////////////////

class CECGFXCaster : public ECRObjBase
{
public:		//	Types

	//	Normal GFX node
	struct NORMALGFX
	{
		A3DGFXEx*	pGFX;			//	GFX object
		DWORD		dwVisTimeCnt;	//	Visible time counter
		bool		bVisible;		//	Visible flag
	};

	//	Auto GFX node
	struct AUTOGFX
	{
		A3DGFXEx*	pGFX;			//	GFX object
		DWORD		dwWaitTime;		//	Wait time
		DWORD		dwTimeCnt;		//	Life time counter
		DWORD		dwVisTimeCnt;	//	Stop time counter
		bool		bVisible;		//	Visible flag
	};

	struct AUTOGFXSLOT
	{
		DWORD		dwID;			//	GFX ID
		APtrArray<AUTOGFX*>	aGFXs;	//	GFX array
	};

	typedef abase::hashtab<AUTOGFXSLOT*, int, abase::_hash_function>	AutoGFXTable;
	typedef abase::hashtab<NORMALGFX*, int, abase::_hash_function>		GFXTable;

public:		//	Constructor and Destructor

	CECGFXCaster(A3DGFXExMan* pGFXMan);
	virtual ~CECGFXCaster();

public:		//	Attributes

public:		//	Operations

	//	Reset
	bool Reset();

	//	Tick routine
	bool Tick(DWORD dwDeltaTime);
	//	Render routine
	bool Render(CECViewport* pViewport);
    virtual bool Render(const ECRENDERPARAM* pRenderParam);

	//	Play a automatical GFX
	bool PlayAutoGFXEx(const char* szFile, DWORD dwWaitTime, const A3DVECTOR3& vPos,
				 const A3DVECTOR3& vDir, const A3DVECTOR3& vUp, float fScale=0.0f);

	//	Load normal gfx
	A3DGFXEx* LoadGFXEx(const char* szFile);
	//	Release normal gfx
	void ReleaseGFXEx(A3DGFXEx* pGFX, bool bCacheRelease=true);
	//	Play a normal gfx
	bool PlayGFXEx(A3DGFXEx* pGFX, const A3DVECTOR3& vPos, const A3DVECTOR3& vDir, const A3DVECTOR3& vUp, float fScale);
	bool PlayGFXEx(A3DGFXEx* pGFX, const A3DVECTOR3& vPos, const A3DVECTOR3& vDir, float fScale);

	//	Get GFXEx Mananger
	inline A3DGFXExMan * GetGFXExMan()		{ return m_pGFXMan; }

protected:	//	Attributes

	A3DGFXExMan*		m_pGFXMan;		//	GFX manager
	AutoGFXTable		m_AutoGFXTab;	//	Auto gfx table
	GFXTable			m_GFXTab;		//	Normal gfx table
	CECModel *			m_pCachedFWBody;//	An ECModel that will be used to cache the model

protected:	//	Operations

	//	Release all gfx
	void ReleaseAllGFX();

	//	Get auto GFX slot
	inline AUTOGFXSLOT* GetAutoGFXSlot(DWORD dwID);
};

///////////////////////////////////////////////////////////////////////////
//	
//	Inline functions
//	
///////////////////////////////////////////////////////////////////////////

//	Get auto GFX slot
CECGFXCaster::AUTOGFXSLOT* CECGFXCaster::GetAutoGFXSlot(DWORD dwID)
{
	//	GFX slot with this ID exists ?
	AutoGFXTable::pair_type Pair = m_AutoGFXTab.get((int)dwID);
	if (!Pair.second)
		return NULL;	//	Counldn't find this slot

	return *Pair.first;
}

