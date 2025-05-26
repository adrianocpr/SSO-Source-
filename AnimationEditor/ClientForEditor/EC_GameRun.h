/*
 * FILE: EC_GameRun.h
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Duyuxin, 2004/8/27
 *
 * HISTORY: 
 *
 * Copyright (c) 2004 Archosaur Studio, All Rights Reserved.
 */

#pragma once

#include <A3D.h>
#include <AF.h>
#include <AM.h>
#include <windows.h>
#include <hashtab.h>
#include <AAssist.h>
#include "EC_ID64.h"

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

class A3DVECTOR3;
class CECWorld;
class A3DGFXExMan;
class CECSkillGfxMan;
class CECFullGlowRender;
class CECViewport;

struct ECMSG;

class ElementRender;
struct ELEMENT_RENDER_PARAM;

namespace _SGC
{
	class A3DSkillGfxComposerMan;
}

///////////////////////////////////////////////////////////////////////////
//	
//	Declare of Global functions
//	
///////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////
//	
//	Class CECGameRun
//	
///////////////////////////////////////////////////////////////////////////

class CECGameRun
{
public:		//	Types

	//	Game state
	enum
	{
		GS_NONE = 0,	//	None
		GS_LOGIN,		//	Login in state
		GS_GAME,		//	In game
        GS_ANIMATION
	};

	//	Double experence mode
	enum
	{
		DBEXP_NONE		= 0x00,
		DBEXP_OWN		= 0x01,
		DBEXP_GLOBAL	= 0x02,
	};

public:		//	Constructor and Destructor

	CECGameRun();
	virtual ~CECGameRun();

public:		//	Attributes

public:		//	Operations

	//	Initialize object
	bool Init();
	//	Release object
	void Release();

	//	Start game
	bool StartGame(int idInst, const A3DVECTOR3& vHostPos);
    bool StartAnimation(int idInst, const A3DVECTOR3& vHostPos);

	//	Game tick routine
	bool Tick(DWORD dwDeltaTime);
	//	Game render routine
	bool Render(bool bPresent=true);

    void ClearPlayedTime() { m_fPlayedTime = 0.0f; }

	//  Get game state.
	int GetGameState() { return m_iGameState; }
	//	Get game world
	CECWorld* GetWorld() { return m_pWorld; }
    CECWorld* GetAnmWorld() { return m_pAnmWorld; }
    CECWorld* GetCurWorld();

	//	Jump to specified position in a instance
	bool JumpToInstance(int idInst, const A3DVECTOR3& vPos);
    bool JumpToAnmInstance(int idInst, const A3DVECTOR3& vPos);

	//	Post game message
	bool PostMessage(DWORD dwMsg, int iManager, int iSubID, int p1=0, int p2=0, int p3=0, int p4=0);
	//	Post game message
	bool PostMessage(const ECMSG& Msg);
	//	Process game message
	bool ProcessMessage(const ECMSG& Msg);

	//	Get gfx composer man
	_SGC::A3DSkillGfxComposerMan* GetSkillGfxComposerMan() { return m_pSkillGfxComposerMan; }
	//	Init gfx composer man
	void InitGfxComposerMan();

    void InitAudioSystem();

protected:	//	Attributes
	CECWorld*			m_pWorld;			//	Game world
    CECWorld*			m_pAnmWorld;	    //	Animation world

    ElementRender*			m_pElementRender;
    ELEMENT_RENDER_PARAM*	m_pRenderParam;

	_SGC::A3DSkillGfxComposerMan* m_pSkillGfxComposerMan;		// skill gfx composer mananger
    CECSkillGfxMan* m_pSkillGfxMan;

    float       m_fPlayedTime;

	int			m_iGameState;		//	Game state
	DWORD		m_dwRenderTime;		//	Render time of this tick

public:
    ElementRender*			GetElementRender() { return m_pElementRender; }
    ELEMENT_RENDER_PARAM*	GetElementRenderParam() { return m_pRenderParam; }

protected:	//	Operations

	//	Create world
	bool CreateWorld(int id, const A3DVECTOR3& vHostPos);
    bool CreateAnmWorld(int id, const A3DVECTOR3& vHostPos);
	//	Release world
	void ReleaseWorld();
    void ReleaseAnmWorld();

	//	Release Gfx composer man
	void ReleaseGfxComposerMan();

	//	End current game state
	void EndGameState(bool bReset=true);
	//	End game state
	void OnEndGameState();
    void OnEndAnmState();

	//	Tick game world
	bool TickGameWorld(DWORD dwDeltaTime, CECViewport* pViewport);
    bool TickAnmWorld(DWORD dwDeltaTime, CECViewport* pViewport);
	//	Begin render
	bool BeginRender();
	//	End render
	bool EndRender(bool bPresent=true);
};

///////////////////////////////////////////////////////////////////////////
//	
//	Inline functions
//	
///////////////////////////////////////////////////////////////////////////
