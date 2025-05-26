/*
 * FILE: EC_GameRun.cpp
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Duyuxin, 2004/8/27
 *
 * HISTORY: 
 *
 * Copyright (c) 2004 Archosaur Studio, All Rights Reserved.
 */

//	For WM_MOUSEWHEEL message
#pragma warning (disable: 4284)

#include "StdAfx.h"
#include "Animator/Animator.h"
#include "Animator/AnmWorld.h"
#include "EC_Global.h"
#include "EC_Game.h"
#include "EC_GameRun.h"
#include "EC_AudioSystem.h"

#include "A3DGFXEx.h"
#include "A3DGFXExMan.h"
#include "A3DSkillGfxComposer.h"
#include "EC_GFXCaster.h"
#include "EC_Counter.h"
#include "EC_World.h"
#include "EC_Scene.h"
#include "EC_Resource.h"
#include "EC_Utility.h"
#include "EC_Configs.h"
#include "EC_ManOrnament.h"
#include "EC_ManSkillGfx.h"
#include "EC_SceneLoader.h"
#include "EC_SceneBlock.h"
#include "EL_CloudManager.h"
#include "EC_Instance.h"

///////////////////////////////////////////////////////////////////////////
//	
//	Define and Macro
//	
///////////////////////////////////////////////////////////////////////////

#define TIME_TICKANIMATION	30
#define TIME_UPDATEEAR		100

//	User configs data version
#define USERCFG_VERSION		5
#define CHECK_RECORD_DELAY	10000
#define RECORD_FADE_TIME	1000

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

///////////////////////////////////////////////////////////////////////////
//	
//	Local functions
//	
///////////////////////////////////////////////////////////////////////////

enum
{
	enumFadeBlack,
	enumFadeWhite,
};

///////////////////////////////////////////////////////////////////////////
//	
//	Implement CECGameRun
//	
///////////////////////////////////////////////////////////////////////////

CECGameRun::CECGameRun() 
{
	m_pWorld		= NULL;
    m_pAnmWorld     = NULL;
	m_iGameState	= GS_NONE;
	m_dwRenderTime	= 0;
    m_fPlayedTime = 0.0f;
	m_pSkillGfxComposerMan = NULL;

    m_pRenderParam = new ELEMENT_RENDER_PARAM;
    m_pRenderParam->fShadowDistance = 30.0f;
    m_pRenderParam->eShadowMapSize = A3D_SHADOW_MAP_SIZE_LARGE;
    m_pRenderParam->eShadowSampleNum = A3D_SHADOW_MAP_SAMPLE_NUM_HIGH;
}

CECGameRun::~CECGameRun()
{
    delete m_pRenderParam;
    m_pRenderParam = 0;
}

//	Initialize object
bool CECGameRun::Init()
{
    m_pElementRender = AfxGetElementRender();
    if(m_pElementRender->Init(g_pGame->GetA3DDevice()) == false)
    {
        ASSERT(0);
        return false;
    }
	
    CECInstance::GetInstance().Load();

	g_pGame->ChangeCursor(RES_CUR_NORMAL);
	g_pGame->ShowCursor(true);

    ElementRender::GameObjects gameObjs = {0};
    gameObjs.pA3DGFXExMan = g_pGame->GetA3DGFXExMan();
    gameObjs.pGFXCaster = g_pGame->GetGFXCaster();
    gameObjs.pSkinRender = g_pGame->GetSkinRender1();
    gameObjs.pSkinRender2 = g_pGame->GetSkinRender2();
    gameObjs.pSkinRenderShadow = g_pGame->GetSkinRenderShadow();
    gameObjs.pSkinRenderSilhouette = g_pGame->GetSkinRenderSilhouette();
    m_pElementRender->RegisterGameObjects(gameObjs);

    InitAudioSystem();

	return true;
}

//	Release object
void CECGameRun::Release()
{
    g_pGame->GetConfigs()->SetSimplifiedSettings(false);
	g_pGame->GetConfigs()->SaveSystemSettings();

	//	Release resources
	EndGameState(false);

    if(m_pElementRender != NULL)
    {
        m_pElementRender->Release();
    }

	CECInstance::GetInstance().Release();

	// Release composer man
	ReleaseGfxComposerMan();
}

void CECGameRun::InitAudioSystem()
{
    CECAudioSystem *pAudioSystem = g_pGame->GetAudioSystem();
    if (pAudioSystem)
    {
        pAudioSystem->SetClassVolume(CECAudioSystem::GROUP_NONE, 0.0f);
        pAudioSystem->SetClassVolume(CECAudioSystem::GROUP_MUSIC, 0.0f);
        pAudioSystem->SetClassVolume(CECAudioSystem::GROUP_SOUND, 0.0f);
        pAudioSystem->SetClassVolume(CECAudioSystem::GROUP_ENVIRONMENT, 0.0f);
        pAudioSystem->SetClassVolume(CECAudioSystem::GROUP_ANIMATION, 1.0f);
    }
}

//	Init gfx composer man
void CECGameRun::InitGfxComposerMan()
{
	m_pSkillGfxComposerMan = new _SGC::A3DSkillGfxComposerMan();
}

//	Release Gfx composer man
void CECGameRun::ReleaseGfxComposerMan()
{
	if( m_pSkillGfxComposerMan )
	{
		m_pSkillGfxComposerMan->Release();
		delete m_pSkillGfxComposerMan;
		m_pSkillGfxComposerMan = NULL;
	}
}

//	Start game
bool CECGameRun::StartGame(int idInst, const A3DVECTOR3& vHostPos)
{
	//	End current game state
	EndGameState(false);

    m_iGameState = GS_GAME;

	//	Create default game world
	if (!JumpToInstance(idInst, vHostPos))
	{
		a_LogOutput(1, _EA("CECGameRun::StartGame, Failed to create game world."));
		return false;
	}

	//	Change cursor to default icon
	g_pGame->ChangeCursor(RES_CUR_NORMAL);
	//	Discard current frame
	g_pGame->DiscardFrame();

	return true;
}

bool CECGameRun::StartAnimation(int idInst, const A3DVECTOR3& vHostPos)
{
	//	End current game state
	EndGameState(false);

    m_iGameState = GS_ANIMATION;

	//	Create default game world
	if (!JumpToAnmInstance(idInst, vHostPos))
	{
		a_LogOutput(1, _EA("CECGameRun::StartGame, Failed to create game world."));
		return false;
	}

	//	Change cursor to default icon
	g_pGame->ChangeCursor(RES_CUR_NORMAL);
	//	Discard current frame
	g_pGame->DiscardFrame();

	return true;
}

//	End game state
void CECGameRun::OnEndGameState()
{
	//	Release world
	ReleaseWorld();
}

void CECGameRun::OnEndAnmState()
{
	//	Release world
	ReleaseAnmWorld();
}

//	End current game state
void CECGameRun::EndGameState(bool bReset/* true */)
{
	if (m_iGameState == GS_NONE)
		return;
	int iCurState = m_iGameState;
	m_iGameState = GS_NONE;

	if (iCurState == GS_LOGIN)
	{
		//OnEndLoginState();
	}
	else if (iCurState == GS_GAME)
	{
		OnEndGameState();
	}
    else if (iCurState == GS_ANIMATION)
    {
        OnEndAnmState();
    }

	if (bReset)
	{
		g_pGame->Reset();
	}
}

//	Create world
bool CECGameRun::CreateWorld(int id, const A3DVECTOR3& vHostPos)
{
	const CECInstance::sInstanceInfo* pInst = CECInstance::GetInstance().GetInstanceInfo(id);
	if (!pInst)
	{
		a_LogOutput(1, _EA("CECGameRun::CreateWorld, wrong instance id: %d"), id);
		return false;
	}

	if (!(m_pWorld = new CECWorld(this)))
	{
		glb_ErrorOutput(ECERR_NOTENOUGHMEMORY, _EA("CECGameRun::CreateWorld"), __LINE__);
		return false;
	}

	if (!m_pWorld->Init(id))
	{
		a_LogOutput(1, _EA("CECGameRun::CreateWorld, Failed to initialize world."));
		return false;
	}

	//	Set scene resource loading distance
	CECSceneBlock::SetResLoadDists(g_pGame->GetConfigs()->GetSystemSettings().nSight + 1);

	//	Load scene from file
	char szFile[MAX_PATH];
	sprintf(szFile, _EA("maps\\%s\\%s.ecwld"), pInst->strPath, pInst->strPath);
	if (!m_pWorld->LoadWorld(szFile, vHostPos))
	{
		a_LogOutput(1, _EA("CECGameRun::CreateWorld, Failed to load world."));
		return false;
	}

	return true;
}

//	Create world
bool CECGameRun::CreateAnmWorld(int id, const A3DVECTOR3& vHostPos)
{
	const CECInstance::sInstanceInfo* pInst = CECInstance::GetInstance().GetInstanceInfo(id);
	if (!pInst)
	{
		a_LogOutput(1, _EA("CECGameRun::CreateAnmWorld, wrong instance id: %d"), id);
		return false;
	}

	if (!(m_pAnmWorld = new CAnmWorld(this)))
	{
		glb_ErrorOutput(ECERR_NOTENOUGHMEMORY, _EA("CECGameRun::CreateAnmWorld"), __LINE__);
		return false;
	}

	if (!m_pAnmWorld->Init(id))
	{
		a_LogOutput(1, _EA("CECGameRun::CreateAnmWorld, Failed to initialize world."));
		return false;
	}

	//	Set scene resource loading distance
	CECSceneBlock::SetResLoadDists(g_pGame->GetConfigs()->GetSystemSettings().nSight + 1);

	//	Load scene from file
	char szFile[MAX_PATH];
	sprintf(szFile, _EA("maps\\%s\\%s.ecwld"), pInst->strPath, pInst->strPath);
	if (!m_pAnmWorld->LoadWorld(szFile, vHostPos))
	{
		a_LogOutput(1, _EA("CECGameRun::CreateAnmWorld, Failed to load world."));
		return false;
	}

	return true;
}

//	Release world
void CECGameRun::ReleaseWorld()
{
	g_pGame->GetViewport()->SwitchCamera(false);

	if (m_pWorld)
	{
		m_pWorld->Release();
		delete m_pWorld;
		m_pWorld = NULL;
	}
}

void CECGameRun::ReleaseAnmWorld()
{
    g_pGame->GetViewport()->SwitchCamera(false);

    if (m_pAnmWorld)
    {
        m_pAnmWorld->Release();
        delete m_pAnmWorld;
        m_pAnmWorld = NULL;
	}
}

//	Game tick routine
bool CECGameRun::Tick(DWORD dwDeltaTime)
{
	//	Tick world
	if (!TickGameWorld(dwDeltaTime, g_pGame->GetViewport()))
		return false;

    TickAnmWorld(dwDeltaTime, g_pGame->GetViewport());

	//	Tick GFX caster
	g_pGame->GetGFXCaster()->Tick(dwDeltaTime);

	//	Tick GFX Manager
	g_pGame->GetA3DGFXExMan()->Tick(dwDeltaTime);

	//	A3DEngine::TickAnimation trigger animation of many objects.
	//	For example: A3DSky objects, GFX objects etc.
	static DWORD dwAnimTime = 0;
	dwAnimTime += dwDeltaTime;
	while (dwAnimTime >= TIME_TICKANIMATION)
	{
		dwAnimTime -= TIME_TICKANIMATION;
		g_pGame->GetA3DEngine()->TickAnimation();
	}

	//	Update ear position so that all 3D sounds' positions are correct
    CECAudioSystem *pAudioSystem = g_pGame->GetAudioSystem();
    if (pAudioSystem)
    {
        A3DVECTOR3 vPos(0.0f);
        A3DVECTOR3 vDir(0.0f, 0.0f, 1.0f);
        A3DVECTOR3 vUp(0.0f, 1.0f, 0.0f);
        A3DVECTOR3 vVel(0.0f);
        A3DVECTOR3 vZonePos(0.0f);

        if (g_pGame->GetViewport())
        {
            A3DCameraBase *pCamera = g_pGame->GetViewport()->GetA3DCameraBase();
            if (pCamera)
            {
                vZonePos = pCamera->GetPos();
                vPos = pCamera->GetPos();
                vDir = pCamera->GetDir();
                vUp = pCamera->GetUp();
            }
        }

        pAudioSystem->SetListenerPos(vPos);
        pAudioSystem->SetListenerDirAndUp(vDir, vUp);
        pAudioSystem->SetListenerVel(vVel);
        pAudioSystem->SetZoneListenerPos(vZonePos);
        pAudioSystem->Tick(dwDeltaTime);
    }

	return true;
}

//	Tick game world
bool CECGameRun::TickGameWorld(DWORD dwDeltaTime, CECViewport* pViewport)
{
	if (!m_pWorld)
		return true;

	//	Offset world center for skin model manager, this will fix skin model
	//	flash rendering problem caused by float calculation precision error !
	g_pGame->GetA3DEngine()->GetA3DSkinMan()->SetWorldCenter(pViewport->GetA3DCameraBase()->GetPos());

	m_pWorld->Tick(dwDeltaTime, g_pGame->GetViewport());

	return true;
}

bool CECGameRun::TickAnmWorld(DWORD dwDeltaTime, CECViewport* pViewport)
{
	if (!m_pAnmWorld)
		return true;

	//	Offset world center for skin model manager, this will fix skin model
	//	flash rendering problem caused by float calculation precision error !
	g_pGame->GetA3DEngine()->GetA3DSkinMan()->SetWorldCenter(pViewport->GetA3DCameraBase()->GetPos());

    if (g_Animator.GetState() == CAnimator::STATE_PLAYING)
    {
        m_fPlayedTime += 0.001f * dwDeltaTime;
    }

	m_pAnmWorld->Tick(dwDeltaTime, g_pGame->GetViewport());

	return true;
}

bool CECGameRun::Render(bool bPresent)
{
	if (!m_pWorld && !m_pAnmWorld)
		return true;

	A3DEngine* pA3DEngine = g_pGame->GetA3DEngine();
	A3DDevice* pA3DDevice = g_pGame->GetA3DDevice();
	CECViewport* pViewport = g_pGame->GetViewport();

    if (!BeginRender())
    {
        a_LogOutput(1, _EA("CECGameRun::Render(), Failed to begin render!"));
        return false;
    }

    m_pRenderParam->paramPostEffect = g_Animator.GetPostEffectParam();

	A3DVECTOR3 vHostPos = pViewport->GetA3DCamera()->GetPos();
	m_pRenderParam->vHostPos = vHostPos;

	if (GetGameState() != CECGameRun::GS_ANIMATION)
	{
		A3DDEVFMT devFmt = pA3DDevice->GetDevFormat();
		A3DVIEWPORTPARAM viewParam;
		viewParam.X = 0;
		viewParam.Y = 0;
		viewParam.Width  = devFmt.nWidth;
		viewParam.Height = devFmt.nHeight;
		viewParam.MinZ = 0.0f;
		viewParam.MaxZ = 1.0f;
		pA3DDevice->SetViewport(&viewParam);

		A3DCOLOR bgColor = 0x00000000;
		pA3DDevice->Clear(D3DCLEAR_TARGET, bgColor, 1.0f, 0);
	}
	else
	{
		m_pElementRender->Render(pViewport, m_pRenderParam);
	}

	EndRender(bPresent);

	return true;
}

CECWorld* CECGameRun::GetCurWorld()
{
    if (m_iGameState == GS_GAME)
    {
        return m_pWorld;
    }
    else if (m_iGameState == GS_ANIMATION)
    {
        return m_pAnmWorld;
    }
    return m_pAnmWorld;
}

//	Begin render
bool CECGameRun::BeginRender()
{
	A3DEngine* pA3DEngine = g_pGame->GetA3DEngine();

	if (!pA3DEngine->BeginRender())
		return false;

	m_dwRenderTime = a_GetTime();

	return true;
}

//	End render
bool CECGameRun::EndRender(bool bPresent)
{
	A3DEngine* pA3DEngine = g_pGame->GetA3DEngine();

	A3DSkinRenderBase* psr = g_pGame->GetSkinRender1();
	if (psr)
	{
		psr->ResetRenderInfo(false);
		psr->ResetRenderInfo(true);
	}

	if ((psr = g_pGame->GetSkinRender2()))
	{
		psr->ResetRenderInfo(false);
		psr->ResetRenderInfo(true);
	}

    if ((psr = g_pGame->GetSkinRenderShadow()))
    {
        psr->ResetRenderInfo(false);
        psr->ResetRenderInfo(true);
    }

    if ((psr = g_pGame->GetSkinRenderSilhouette()))
    {
        psr->ResetRenderInfo(false);
        psr->ResetRenderInfo(true);
    }

	if (!pA3DEngine->EndRender())
		return false;

	if( bPresent )
		pA3DEngine->Present();

	m_dwRenderTime = a_GetTime() - m_dwRenderTime;

	return true;
}

//	Jump to specified position in a instance
bool CECGameRun::JumpToInstance(int idInst, const A3DVECTOR3& vPos)
{
	const CECInstance::sInstanceInfo* pInst = CECInstance::GetInstance().GetInstanceInfo(idInst);
	if (!pInst)
	{
		a_LogOutput(1, _EA("CECGameRun::JumpToInstance, wrong instance id: %d"), idInst);
		return false;
	}

	if (m_pWorld)
	{
		if (m_pWorld->GetInstanceID() == pInst->id)
		{
			m_pWorld->SetLoadCenter(vPos);
			return true;
		}
		else
		{
			//	Release current world
			ReleaseWorld();
		}
	}

	//	Create new world
	if (!CreateWorld(idInst, vPos))
	{
		a_LogOutput(1, _EA("CECGameRun::JumpToInstance, failed to create world %d"), idInst);
		return false;
	}

	return true;
}

bool CECGameRun::JumpToAnmInstance(int idInst, const A3DVECTOR3& vPos)
{
    const CECInstance::sInstanceInfo* pInst = CECInstance::GetInstance().GetInstanceInfo(idInst);
    if (!pInst)
    {
        a_LogOutput(1, _EA("CECGameRun::JumpToAnmInstance, wrong instance id: %d"), idInst);
        return false;
    }
    
    if (m_pAnmWorld)
    {
        if (m_pAnmWorld->GetInstanceID() == pInst->id)
        {
            m_pAnmWorld->SetLoadCenter(vPos);
            return true;
        }
        else
        {
            //	Release current world
            ReleaseAnmWorld();
        }
    }
    
    //	Create new world
    if (!CreateAnmWorld(idInst, vPos))
    {
        a_LogOutput(1, _EA("CECGameRun::JumpToAnmInstance, failed to create world %d"), idInst);
        return false;
    }
    
    return true;
}
