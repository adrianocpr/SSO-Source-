/*
 * FILE: EC_World.cpp
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Duyuxin, 2004/8/25
 *
 * HISTORY: 
 *
 * Copyright (c) 2004 Archosaur Studio, All Rights Reserved.
 */

#include "StdAfx.h"
#include "Animator/Animator.h"
#include "EC_Global.h"
#include "EC_World.h"
#include "EC_Scene.h"
#include "EC_ManOrnament.h"
#include "EC_ManSkillGfx.h"
#include "EC_Game.h"
#include "EC_GameRun.h"
#include "EC_Configs.h"
#include "EC_Utility.h"
#include "EC_SceneLoader.h"
#include "EL_Precinct.h"
#include "EL_Region.h"
#include "EL_CloudManager.h"
#include "EL_Precinct.h"
#include "EC_Instance.h"
#include "EC_TriangleMan.h"
#include "EC_BrushMan.h"
#include "EC_SceneLights.h"

#include "ELTerrainOutline2.h"

#include <A3DSunMoon.h>
#include <A3DViewport.h>
#include <elementRender.h>
#include "A3DGrassInteractor.h"

///////////////////////////////////////////////////////////////////////////
//	
//	Define and Macro
//	
///////////////////////////////////////////////////////////////////////////

// #define _WATER_FFT_   //打开该宏可以看到FFT的水面

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


///////////////////////////////////////////////////////////////////////////
//	
//	Implement CECWorld
//	
///////////////////////////////////////////////////////////////////////////


CECWorld::sLastCameraInfo::sLastCameraInfo() 
{
	Clear();
}

void CECWorld::sLastCameraInfo::Clear()
{
	vPos		= A3DVECTOR3(100*1024.0f,100*1024.0f,100*1024.0f);

	idCameraPath= 0;
};


CECWorld::CECWorld(CECGameRun* pGameRun)
{
	m_pGameRun			= pGameRun;
	m_pA3DTerrain		= NULL;
	m_pA3DTerrainWater	= NULL;
    m_pA3DTerrainWaterFFT = NULL;
	m_pA3DSky			= NULL;
	m_bWorldLoaded		= false;
	m_pGrassLand		= NULL;
	m_pCloudManager		= NULL;
	m_pScene			= NULL;
	m_pSunMoon			= NULL;
	m_pRain				= NULL;
	m_pSnow				= NULL;
	m_bResetEnv			= true;
	m_pSceneLights		= NULL;
	m_bCenterReset		= false;
	m_dwBornStamp		= 1;
	m_idInst			= 0;

	m_fTrnLoadDelta		= 0.0f;
	m_fTrnLoadCnt		= 0.0f;
	m_fScnLoadDelta		= 0.0f;
	m_fScnLoadCnt		= 0.0f;

	memset(m_aManagers, 0, sizeof (m_aManagers));
}

CECWorld::~CECWorld()
{
}

//	Initialize object
bool CECWorld::Init(int idInst)
{
	m_idInst = idInst;

	//	Create managers
	if (!CreateManagers())
	{
		a_LogOutput(1, _EA("CECWorld::Init, Failed to create managers"));
		return false;
	}

	// Init nature objects
	if( !InitNatureObjects() )
	{
		a_LogOutput(1, _EA("CECWorld::Init, Failed to init nature objects"));
		return false;
	}

	//	Create scene light object
	if (!(m_pSceneLights = new CECSceneLights) || !m_pSceneLights->Init(g_pGame->GetA3DDevice()))
	{
		glb_ErrorOutput(ECERR_NOTENOUGHMEMORY, _EA("CECWorld::Init"), __LINE__);
		return false;
	}

	return true;
}

//	Initialize terrain water
bool CECWorld::InitTerrainWater()
{
	//	Load terrain
	if (!(m_pA3DTerrainWater = new A3DTerrainWater2))
	{
		glb_ErrorOutput(ECERR_NOTENOUGHMEMORY, _EA("CECWorld::InitTerrainWater"), __LINE__);
		return false;
	}

	if (!m_pA3DTerrainWater->InitStatically(g_pGame->GetA3DDevice()))
    {
		glb_ErrorOutput(ECERR_FAILEDTOCALL, _EA("CECWorld::InitTerrainWater"), __LINE__);
		return false;
	}

#ifdef _WATER_FFT_
    if(!(m_pA3DTerrainWaterFFT = new A3DTerrainWaterFFT))
    {
        glb_ErrorOutput(ECERR_NOTENOUGHMEMORY, _EA("CECWorld::InitTerrainWater"), __LINE__);
        return false;
    }

    if(!(m_pA3DTerrainWaterFFT->Init(g_pGame->GetA3DDevice(), g_pGame->GetViewport()->GetA3DViewport(),
        g_pGame->GetViewport()->GetA3DCamera())))
    {
        glb_ErrorOutput(ECERR_NOTENOUGHMEMORY, _EA("CECWorld::InitTerrainWater"), __LINE__);
        return false;
    }
#endif

	return true;
}

//	Initialize plants objects
bool CECWorld::InitPlantsObjects()
{
	m_pGrassLand = new CELGRASSLAND();
	if (!m_pGrassLand->Init(g_pGame->GetA3DDevice(), m_pA3DTerrain, &g_Log))
	{
		glb_ErrorOutput(ECERR_FAILEDTOCALL, _EA("CECWorld::InitPlantsObjects"), __LINE__);
		return false;
	}
	
	return true;
}

//	Initialize nature effects
bool CECWorld::InitNatureObjects()
{
	//	now create some nature effects here
    m_pSunMoon = new CECSUNMOON(g_pGame->GetA3DDevice());
	if( !m_pSunMoon->Init() )
	{
		glb_ErrorOutput(ECERR_NOTENOUGHMEMORY, _EA("CECWorld::InitNatureObjects"), __LINE__);
		return false;
	}

	SYSTEMTIME sysTime;
	GetLocalTime(&sysTime);
	m_pSunMoon->SetTimeOfTheDay((sysTime.wHour * 3600 + sysTime.wMinute * 60 + sysTime.wSecond) / (24.0f * 3600.0f));
    //m_pSunMoon->SetTimeOfTheDay((2 * 3600 + 0 * 60 + sysTime.wSecond) / (24.0f * 3600.0f));
	
	m_pRain = new A3DRain();
	if( !m_pRain->Init(g_pGame->GetA3DDevice(), 1.0f) )
	{
		glb_ErrorOutput(ECERR_NOTENOUGHMEMORY, _EA("CECWorld::InitNatureObjects"), __LINE__);
		return false;
	}
	m_pRain->SetHostCamera(g_pGame->GetViewport()->GetA3DCamera());
	m_pRain->SetEmitterWidth(20.0f);
	m_pRain->SetEmitterLength(20.0f);
	m_pRain->SetEmitterHeight(8.0f);
	m_pRain->SetUseRateMode(20, true);
	m_pRain->SetSize(0.04f);
	m_pRain->SetSizeVariation(30.0f);
	m_pRain->SetSpeed(0.5f);
	m_pRain->SetSpeedVariation(50.0f);
	m_pRain->SetInheritInfluence(0.0f);
	m_pRain->SetLife(20);
	m_pRain->SetTextureMap((char*)_EA("rain.tga"));
	m_pRain->SetSrcBlend(A3DBLEND_SRCALPHA);
	m_pRain->SetDestBlend(A3DBLEND_INVSRCALPHA);
	m_pRain->CreateRain();
	m_pRain->SetColorNum(1);
	m_pRain->SetColor(0, A3DCOLORRGBA(255, 255, 255, 160));
	//m_pRain->StartRain();

	m_pSnow = new A3DSnow();
	if( !m_pSnow->Init(g_pGame->GetA3DDevice(), 1.8f) )
	{
		glb_ErrorOutput(ECERR_NOTENOUGHMEMORY, _EA("CECWorld::InitNatureObjects"), __LINE__);
		return false;
	}

	m_pSnow->SetHostCamera(g_pGame->GetViewport()->GetA3DCamera());
	m_pSnow->SetEmitterWidth(80.0f);
	m_pSnow->SetEmitterLength(80.0f);
	m_pSnow->SetEmitterHeight(40.0f);
	m_pSnow->SetUseRateMode(20, true);
	m_pSnow->SetSize(0.3f);
	m_pSnow->SetSizeVariation(20.0f);
	m_pSnow->SetSpeed(0.5f);
	m_pSnow->SetSpeedVariation(20.0f);
	m_pSnow->SetLife(100);
	m_pSnow->SetTextureMap((char*)_EA("snow.bmp"));
	m_pSnow->SetSrcBlend(A3DBLEND_ONE);
	m_pSnow->SetDestBlend(A3DBLEND_INVSRCCOLOR);
	m_pSnow->SetSpinTime(100);
	m_pSnow->SetSpinTimeVariation(50);
	m_pSnow->CreateSnow();
	m_pSnow->SetColor(0, A3DCOLORRGBA(160, 160, 160, 160));
	//m_pSnow->StartSnow();

	return true;
}

void CECWorld::ReleaseNatureObjects()
{
	if( m_pSunMoon )
	{
		m_pSunMoon->Release();
		delete m_pSunMoon;
		m_pSunMoon = NULL;
	}

	if( m_pRain )
	{
		m_pRain->Release();
		delete m_pRain;
		m_pRain = NULL;
	}

	if( m_pSnow )
	{
		m_pSnow->Release();
		delete m_pSnow;
		m_pSnow = NULL;
	}
}

// Tick nature objects
bool CECWorld::TickNatureObjects(DWORD dwDeltaTime)
{
	if( m_pSunMoon )
	{
		if( m_idInst == 0 )
		{
			// login world, must always be at midnoon
			m_pSunMoon->Tick(0);
		}
		else
			m_pSunMoon->Tick(dwDeltaTime);
	}

	static DWORD dwOldTicks = 0;
	dwOldTicks += dwDeltaTime;
	while(dwOldTicks > 33)
	{
		if( m_pRain )
			m_pRain->TickEmitting();

		if( m_pSnow )
			m_pSnow->TickEmitting();

		dwOldTicks -= 33;
	}

	return true;
}

//	Release object
void CECWorld::Release()
{
	// Release nature objects
	ReleaseNatureObjects();

	//	Release scene before managers
	ReleaseScene();

	//	Release managers
	ReleaseManagers();

	// force to release all loaded resource
	ThreadRemoveAllLoaded();

	if (m_pSceneLights)
	{
		delete m_pSceneLights;
		m_pSceneLights = NULL;
	}

	m_dwBornStamp = 1;
}

//	Load scene
bool CECWorld::LoadWorld(const char* szFile, const A3DVECTOR3& vInitLoadPos)
{
	if (m_bWorldLoaded)
	{
		//	Scene couldn't be loaded twice
		a_LogOutput(1, _EA("CECWorld::LoadWorld, scene couldn't be loaded twice"));
		return false;
	}

	m_vInitLoadPos = vInitLoadPos;

    m_strFileName = szFile;
	af_GetFilePath(szFile, m_strMapPath);

	//	Load terrain data
	char* pExt = (char *)strrchr(szFile, '.');
	AString strResFile(szFile, pExt - szFile);
	strResFile += _EA(".trn2");
	if (!LoadTerrain(strResFile))
	{
		glb_ErrorOutput(ECERR_FILEOPERATION, _EA("CECWorld::LoadWorld Terrain"), __LINE__);
		return false;
	}

	char szMapName[MAX_PATH];
	af_GetRelativePathNoBase(m_strMapPath, _EA("maps\\"), szMapName);

	//	Initialize terrain water
	if (!InitTerrainWater())
	{
		a_LogOutput(1, _EA("CECWorld::LoadWorld, failed to initalize terrain water!"));
		return false;
	}

	//	Initialize plants objects
	if (!InitPlantsObjects())
	{
		a_LogOutput(1, _EA("CECWorld::LoadWorld, failed to initalize plants objects!"));
		return false;
	}

	//	Load scene objects
	if (!LoadSceneObjects(szFile))
	{
		glb_ErrorOutput(ECERR_FILEOPERATION, _EA("CECWorld::LoadWorld Scene Objects"), __LINE__);
		return false;
	}

	//	Load sky
	if (!LoadSky())
	{
		glb_ErrorOutput(ECERR_FILEOPERATION, _EA("CECWorld::LoadWorld Sky"), __LINE__);
		return false;
	}

	//	Load terrain's outline data
	char szTilePath[MAX_PATH];
	sprintf(szTilePath, _EA("loddata\\%s\\olm\\"), szMapName);

	// we will always use 1024 size birdviews to avoid seams if DXT1 is supported
	// or else, we use 256 size texture and the outline texture will smooth texture by copy adjacent edges together
	char szTexPath[MAX_PATH];
	HRESULT hval;
	hval = g_pGame->GetA3DDevice()->GetA3DEngine()->GetD3D()->CheckDeviceFormat(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, (D3DFORMAT)g_pGame->GetA3DDevice()->GetDevFormat().fmtAdapter, 0, D3DRTYPE_TEXTURE, (D3DFORMAT) A3DFMT_DXT1);
	if( D3D_OK == hval )
		sprintf(szTexPath, _EA("loddata\\%s\\birdviews\\1024\\"), szMapName);
	else
		sprintf(szTexPath, _EA("loddata\\%s\\birdviews\\256\\"), szMapName);

	//	Load clouds here
	strResFile = AString(szFile, pExt - szFile);
	strResFile += _EA(".cld");
	strcat(szTexPath, _EA("textures\\cumulus01.tga"));
	if (!LoadClouds(strResFile, szTexPath) )
		glb_ErrorOutput(ECERR_FILEOPERATION, _EA("CECWorld::LoadWorld Clouds"), __LINE__);

	/*	Load regions
	strResFile = m_strMapPath;
	strResFile += _EA("\\region.clt");
	if (glb_FileExist(strResFile) && !m_pRegionSet->Load(strResFile))
		glb_ErrorOutput(ECERR_FILEOPERATION, _EA("CECWorld::LoadWorld RegionSet"), __LINE__);
    */

	strResFile = m_strMapPath;
	strResFile += _EA("\\scenelights.dat");
	if (glb_FileExist(strResFile) && !m_pSceneLights->Load(strResFile))
		glb_ErrorOutput(ECERR_FILEOPERATION, _EA("CECWorld::LoadWorld SceneLights"), __LINE__);

	//	Set load center
	SetLoadCenter(vInitLoadPos);

	//	Notify managers
	/*for (int i=0; i < NUM_MANAGER; i++)
	{
		if (m_aManagers[i])
			m_aManagers[i]->OnEnterGameWorld();
	}*/
    m_aManagers[MAN_ORNAMENT]->OnEnterGameWorld();
    m_aManagers[MAN_SKILLGFX]->OnEnterGameWorld();

	//	If IsLoadThreadReady() == true, all resources have been loaded in
	//	SetLoadCenter();
	if (!IsLoadThreadReady())
		LoadInMainThread(true);

#ifdef USING_BRUSH_MAN
	GetOrnamentMan()->GetBrushMan()->Build(vInitLoadPos, true);
#endif

	m_bWorldLoaded = true;

	// now according to shadow render flag, we decide whether use triangle manager
    GetOrnamentMan()->LoadTriangleMan(vInitLoadPos);
	
    A3DVECTOR3 vPos = vInitLoadPos;
    vPos.y = GetTerrainHeight(vInitLoadPos);
    g_pGame->GetViewport()->GetA3DCameraBase()->SetPos(vPos + A3DVECTOR3(0.0f, 1.6f, 0.0f));

    InitLoaderThread();
    StartLoaderThread();

    ElementRender* pElementRender = g_pGame->GetGameRun()->GetElementRender();
    ElementRender::WorldObjects worldObjs = {0};
    worldObjs.pSunMoon         = m_pSunMoon;
    worldObjs.pTerrainOutline  = NULL;
    worldObjs.pA3DTerrain      = m_pA3DTerrain;
    worldObjs.pA3DTerrainWater2 = m_pA3DTerrainWater;
#ifdef _WATER_FFT_
    worldObjs.pA3DTerrainWaterFFT = m_pA3DTerrainWaterFFT;
#endif
    worldObjs.pScene           = m_pScene;
    worldObjs.pGrassLand       = m_pGrassLand;
    worldObjs.pRain            = m_pRain;
    worldObjs.pSnow            = m_pSnow;
    worldObjs.pA3DSky          = m_pA3DSky;
//    worldObjs.pAnimationWorld  = &g_Animator;
    pElementRender->RegisterWorldObjects(worldObjs);

    pElementRender->SetWaterReflectMap(_EA(""));
    const CECInstance::sInstanceInfo* pInstance = CECInstance::GetInstance().GetInstanceInfo(m_idInst);
    if (NULL != pInstance && pInstance->strCubeMap.GetLength() > 0)
    {
        pElementRender->SetWaterReflectMap(pInstance->strCubeMap);
    }

	return true;
}

//	Release current scene
void CECWorld::ReleaseScene()
{
	g_pGame->GetA3DEngine()->SetSky(NULL);

	A3DRELEASE(m_pScene);
	A3DRELEASE(m_pGrassLand);
	A3DRELEASE(m_pA3DSky);

	// 1. force to exit loader thread
	ExitLoaderThread();

	// 2. release manager
	/*for (int i=0; i < NUM_MANAGER; i++)
	{
		if (m_aManagers[i])
			m_aManagers[i]->OnLeaveGameWorld();
	}*/
    m_aManagers[MAN_ORNAMENT]->OnLeaveGameWorld();
    m_aManagers[MAN_SKILLGFX]->OnLeaveGameWorld();

	// 3. force to release all loaded resource
	ThreadRemoveAllLoaded();

	//	Release terrain after loading thread has been ended
	A3DRELEASE(m_pA3DTerrainWater);
#ifdef _WATER_FFT_
    A3DRELEASE(m_pA3DTerrainWaterFFT);
#endif
	A3DRELEASE(m_pA3DTerrain);
	A3DRELEASE(m_pCloudManager);
	
	m_bWorldLoaded = false;
}

//	Load terrain
bool CECWorld::LoadTerrain(const char* szFile)
{
	//	Load terrain
	if (!(m_pA3DTerrain = new A3DTerrain2))
	{
		glb_ErrorOutput(ECERR_NOTENOUGHMEMORY, _EA("CECWorld::LoadTerrain"), __LINE__);
		return false;
	}

	float fRadius = g_pGame->GetConfigs()->GetSceneLoadRadius();
	if (!m_pA3DTerrain->Init(g_pGame->GetA3DEngine(), fRadius, fRadius))
	{
		glb_ErrorOutput(ECERR_FAILEDTOCALL, _EA("CECWorld::LoadTerrain"), __LINE__);
		return false;
	}

//	bool bMultiThread = g_pGame->GetGameRun()->GetGameState() == CECGameRun::GS_GAME ? true : false;
	bool bMultiThread = true;
	if (!m_pA3DTerrain->Load(szFile, 0.0f, 0.0f, bMultiThread))
	{
		a_LogOutput(1, _EA("CECWorld::LoadTerrain, Failed to load A3DTerrain2."));
		return false;
	}

	CECConfigs* pConfigs = g_pGame->GetConfigs();

	m_pA3DTerrain->SetBlockLoadSpeed(4);
	//m_pA3DTerrain->SetMaxLayerWeight(pConfigs->GetSystemSettings().nGroundDetail);
	m_pA3DTerrain->SetLODType(A3DTerrain2::LOD_NOHEIGHT);
	m_pA3DTerrain->SetLODDist(pConfigs->GetTerrainLODDist1(), pConfigs->GetTerrainLODDist2());

	return true;
}

//	Load clouds
bool CECWorld::LoadClouds(const char * szCloudFile, const char * szTexPath)
{
	m_pCloudManager = new CELCloudManager();

	if( !m_pCloudManager->Init(g_pGame->GetA3DDevice(), szCloudFile) )
	{
		m_pCloudManager->Release();
		delete m_pCloudManager;
		m_pCloudManager = NULL;
		return false;
	}

	return true;	
}

//	Load sky
bool CECWorld::LoadSky()
{
	//	Sphere type sky
	A3DSkySphere* pSky = new A3DSkySphere;
	if (!pSky)
		return false;

	//	Sky texture file name shouldn't be set here
	CECConfigs* pConfig = g_pGame->GetConfigs();
	if (!pSky->Init(g_pGame->GetA3DDevice(), NULL, pConfig->m_strDefSkyFile0, 
					pConfig->m_strDefSkyFile1, pConfig->m_strDefSkyFile2))
	{
		a_LogOutput(1, _EA("CECWorld::LoadSky, Failed to create sphere sky !"));
		return false;
	}

	pSky->SetFlySpeedU(0.003f);
	pSky->SetFlySpeedV(0.003f);

	m_pA3DSky = pSky;
	
	//	This enable sky can do animation when A3DEngine::TickAnimation is called
	if (m_pA3DSky)
		g_pGame->GetA3DEngine()->SetSky(m_pA3DSky);

	return true;
}

bool CECWorld::LoadPlants(const char * szFile)
{
	m_pGrassLand = new CELGRASSLAND();
	if( !m_pGrassLand->Init(g_pGame->GetA3DDevice(), m_pA3DTerrain, &g_Log) )
	{
		glb_ErrorOutput(ECERR_FILEOPERATION, _EA("CECWorld::LoadPlants"), __LINE__);
		return false;
	}
	return true;
}

//	Load scene objects
bool CECWorld::LoadSceneObjects(const char* szFile)
{
	if (!(m_pScene = new CECScene(this)))
	{
		glb_ErrorOutput(ECERR_NOTENOUGHMEMORY, _EA("CECWorld::LoadSceneObjects"), __LINE__);
		return false;
	}

	if (!m_pScene->Load(szFile, 0.0f, 0.0f))
	{
		a_LogOutput(1, _EA("CECWorld::LoadSceneObjects, Failed to load scene file %s"), szFile);
		return false;
	}

	float fRadius = g_pGame->GetConfigs()->GetSceneLoadRadius();
	m_pScene->SetActRadius(2000.0f);//fRadius);
	m_pScene->SetBlockLoadSpeed(2);

	return true;
}

//	Set load center
void CECWorld::SetLoadCenter(const A3DVECTOR3& vCenter)
{
	if (IsLoadThreadReady())
	{
		SuspendLoadThread();
		ThreadRemoveAllLoaded();
	}

	if (m_pA3DTerrain)
		m_pA3DTerrain->SetLoadCenter(vCenter);

	if (m_pScene)
		m_pScene->SetLoadCenter(vCenter);

	if (IsLoadThreadReady())
	{
		LoadInMainThread(true);

#ifdef USING_BRUSH_MAN
		GetOrnamentMan()->GetBrushMan()->Build(vCenter, true);
#endif

#ifdef USING_TRIANGLE_MAN
		GetOrnamentMan()->GetTriangleMan()->Build(vCenter, true);
#endif

		StartLoaderThread();
	}

	if( m_pGrassLand )
	{
		// we want grassland to build all active grasses when we enter the game 
		m_pGrassLand->SetProgressLoad(false);
		m_pGrassLand->Update(vCenter, 0);
		m_pGrassLand->SetProgressLoad(true);
	}

	g_pGame->GetViewport()->GetA3DCameraBase()->SetPos(vCenter + A3DVECTOR3(0.0f, 2.0f, 0.0f));

	m_bResetEnv = true;
	m_bCenterReset = true;

	//	Force to update objects in mini-map
	//GetMatterMan()->OnLoadCenterChanged();

	// wait until sky's texture has been loaded
	while( m_pA3DSky->IsTextureLoading() )
		Sleep(10);
	// stop transition state of sky
	m_pA3DSky->SetTimePassed(0x7fffffff);

	//	Discard current frame
	g_pGame->DiscardFrame();
}

//	Set view radius
void CECWorld::SetViewRadius(float fRadius)
{
	CECConfigs* pConfigs = g_pGame->GetConfigs();

	a_ClampFloor(fRadius, pConfigs->GetSevActiveRadius());

	A3DCamera* pCamera = g_pGame->GetViewport()->GetA3DCamera();
	if (pCamera && m_pA3DTerrain && m_pScene)
	{
		//	View radius should be equal to active radius, otherwise there
		//	will be block missing at the border between terrain and outline
		m_pA3DTerrain->SetActRadius(fRadius/* + 64.0f */);
		m_pA3DTerrain->SetViewRadius(fRadius);
		m_pScene->SetActRadius(2000.0f);//fRadius);

		SetLoadCenter(pCamera->GetPos());
	}
}

//	Create managers
bool CECWorld::CreateManagers()
{
	CECOrnamentMan* pOnmtMan = new CECOrnamentMan(m_pGameRun);
	m_aManagers[MAN_ORNAMENT] = pOnmtMan;

    CECSkillGfxMan* pSkillGfxMan = new CECSkillGfxMan(m_pGameRun);
	m_aManagers[MAN_SKILLGFX] = pSkillGfxMan;

    ElementRender* pElementRender = g_pGame->GetGameRun()->GetElementRender();
    pElementRender->RegisterManager(pOnmtMan);
    pElementRender->RegisterManager(pSkillGfxMan);
    pElementRender->RegisterManager(&g_ManagerWrapperForAnimator);

	return true;
}

//	Release managers
void CECWorld::ReleaseManagers()
{
    ElementRender* pElementRender = g_pGame->GetGameRun()->GetElementRender();
    pElementRender->UnRegisterManager(m_aManagers[MAN_ORNAMENT]);
    pElementRender->UnRegisterManager(m_aManagers[MAN_SKILLGFX]);
    pElementRender->UnRegisterManager(&g_ManagerWrapperForAnimator);

	for (int i=0; i < NUM_MANAGER; i++)
	{
		CECManager* pManager = m_aManagers[i];
		if (pManager)
		{
			pManager->Release();
			delete pManager;
		}

		m_aManagers[i] = NULL;
	}
}

//	Calculate terrain and scene loading speed
void CECWorld::CalcSceneLoadSpeed()
{
	float fSpeedH = 10.0f;

	if (m_pScene)
	{
		int iWaitBlock = m_pScene->GetCandidateBlockNum();
		if (iWaitBlock)
		{
			//	time to pass a block in second
			float fPassTime = 100.0f;
			if (fSpeedH)
			{
				fPassTime = m_pScene->GetBlockSize() * 0.8f / fSpeedH;
				a_ClampRoof(fPassTime, 100.0f);
			}

			//	Frame number to pass a block
			float fPassFrame = fPassTime * 30.0f;
			m_fScnLoadDelta = iWaitBlock / fPassFrame;
		}

		m_fScnLoadCnt += m_fScnLoadDelta;
		m_pScene->SetBlockLoadSpeed((int)m_fScnLoadCnt);
		m_fScnLoadCnt -= (int)m_fScnLoadCnt;
	}
}

//	Tick routine
bool CECWorld::Tick(DWORD dwDeltaTime, CECViewport* pViewport)
{
    g_Animator.Tick(dwDeltaTime);

    m_bResetEnv = !m_pScene->AdjustEnvironment(g_pGame->GetTickTime(), pViewport->GetA3DCameraBase(), m_bResetEnv);
    __PreRender(pViewport);

    m_aManagers[MAN_ORNAMENT]->Tick(dwDeltaTime);
    m_aManagers[MAN_SKILLGFX]->Tick(dwDeltaTime);

    //	Calculate terrain and block loading speed
	CalcSceneLoadSpeed();

	A3DCamera* pCamera = pViewport->GetA3DCamera();
    A3DVECTOR3 vHostPos = pCamera->GetPos();

	if (m_pA3DTerrain)
	{
		m_pA3DTerrain->Update(dwDeltaTime, pCamera, vHostPos);

		if (m_pA3DTerrain->IsMultiThreadLoad())
		{
			int r, c, iBlock;
			while (m_pA3DTerrain->GetNextCandidateBlock(r, c, iBlock))
			{
				QueueTerrainBlock(r, c, iBlock);
			}
		}
	}
	
	if (m_pCloudManager)
	{
		A3DVECTOR3 vecLightDir = Normalize(A3DVECTOR3(-1.0f, -1.0f, -1.0f));
		if( m_pSunMoon )
			vecLightDir = m_pSunMoon->GetLightDir();

		m_pCloudManager->Tick(dwDeltaTime, pCamera->GetPos() - vecLightDir * 10000.0f);
	}

	if (m_pScene)
		m_pScene->Update(dwDeltaTime, pCamera, vHostPos);

	if (m_pSceneLights)
		m_pSceneLights->Update(dwDeltaTime, m_pSunMoon->GetDNFactor(), vHostPos);

	if (m_pA3DTerrainWater)
		m_pA3DTerrainWater->Update(dwDeltaTime);

	if (m_pGrassLand && g_pGame->GetConfigs()->m_bShowGrassLand)
	{
		m_pGrassLand->SetProgressLoad(true);
		m_pGrassLand->Update(vHostPos, dwDeltaTime);
	}

	TickNatureObjects(dwDeltaTime);

    //	Update current region
    UpdateCurRegion();

	m_bCenterReset = false;
	LoadInMainThread(false);

	return true;
}

//	Tick animation
bool CECWorld::TickAnimation()
{
    m_aManagers[MAN_ORNAMENT]->TickAnimation();
    m_aManagers[MAN_SKILLGFX]->TickAnimation();

	return true;
}

bool CECWorld::__PreRender(CECViewport* pViewport)
{
    ELEMENT_RENDER_PARAM* pRenderParam = g_pGame->GetGameRun()->GetElementRenderParam();

    const CECScene::ENVIRONMENT& env = m_pScene->GetEnvironment();
    pRenderParam->bUnderWater = env.bUnderWater;

    float nf = m_pSunMoon->GetDNFactor();
    float df = 1.0f - nf;

    A3DCOLOR fogColor = 0xff000000;
    if( env.bUnderWater )
        fogColor = (env.UWFogCol.cur * df + env.UWFogCol_n.cur * nf).ToRGBAColor();
    else
        fogColor = (env.FogCol.cur * df + env.FogCol_n.cur * nf).ToRGBAColor();

    switch (g_Animator.GetHideWorldType())
    {
        case 2:
        {
            pRenderParam->crClear = g_Animator.GetBackgroundColor() & 0x00ffffff;
            pRenderParam->bRenderScene = true;
            pRenderParam->bRenderSky = false;
            pRenderParam->bRenderTerrain = false;
            pRenderParam->bRenderLitModel = false;
            pRenderParam->bRenderGrass = false;
            pRenderParam->bRenderWater = false;
            pRenderParam->bRenderShadow = false;
            pRenderParam->bRenderSunMoon = false;
            break;
        }

        default:
        {
            pRenderParam->crClear = fogColor & 0x00ffffff;
            pRenderParam->bRenderScene = true;
            pRenderParam->bRenderSky = true;
            pRenderParam->bRenderTerrain = true;
            pRenderParam->bRenderLitModel = true;
            pRenderParam->bRenderGrass = true;
            pRenderParam->bRenderWater = true;
            pRenderParam->bRenderShadow = true;
            pRenderParam->bRenderSunMoon = true;
            break;
        }
    }

    ElementRender* pElementRender = g_pGame->GetGameRun()->GetElementRender();

    pRenderParam->paramLight       = g_pGame->GetDirLight()->GetLightparam();
    pRenderParam->fDNFactor        = m_pSunMoon->GetDNFactor();
    pRenderParam->nWaterEffect     = 3;
    pRenderParam->pSelf            = pElementRender;

    pRenderParam->bModelLightMap = true;
    pRenderParam->bAnimationWorld = true;
    pRenderParam->bRenderSkinModel = true;
    pRenderParam->bRenderSceneObject = true;
    pRenderParam->bRenderGFX = true;
    pRenderParam->bRenderZPressPass = false;
    pRenderParam->bRenderZToRenderTarget = false;
    pRenderParam->bRenderPostProcess = true;
    pRenderParam->bRenderUI = false;
    pRenderParam->bWireframeMode = g_pGame->GetConfigs()->GetShowWireFlag();

    return true;
}

//	Get terrain height of specified position
float CECWorld::GetTerrainHeight(const A3DVECTOR3& vPos, A3DVECTOR3* pvNormal/* NULL */)
{
	A3DTerrain2* pTerrain = GetTerrain();
	ASSERT(pTerrain);
	return pTerrain->GetPosHeight(vPos, pvNormal);
}

//	Get ground height of specified poistion
float CECWorld::GetGroundHeight(const A3DVECTOR3& vPos, A3DVECTOR3* pvNormal/* NULL */)
{
    return GetTerrainHeight(vPos, pvNormal);
}

//	Get water height of specified position
float CECWorld::GetWaterHeight(const A3DVECTOR3& vPos)
{
	A3DTerrainWater2* pWater = GetTerrainWater();
	ASSERT(pWater);
	return pWater->GetWaterHeight(vPos);
}

//	Get A3DSky object
A3DSkySphere * CECWorld::GetSkySphere()
{
	return m_pA3DSky;
}

//	Update current region which the host player is in
void CECWorld::UpdateCurRegion()
{
}

void CECWorld::SetTimeOfDay(float t)
{
	while( m_pA3DSky->IsTextureLoading() )
		Sleep(10);

	m_pA3DSky->SetTimePassed(0x7fffffff);
	m_bResetEnv = true;
	m_pSunMoon->SetTimeOfTheDay(t);
}

//	Checkout instance data
bool CECWorld::CheckOutInst(int idInst, DWORD dwRegionTimeStamp, DWORD dwPrecinctTimeStamp)
{
	if (m_idInst != idInst)
		return false;

	return true;
}


double  CECWorld::GetWorldSizeX()
{
	const CECInstance::sInstanceInfo* pInstance = CECInstance::GetInstance().GetInstanceInfo(m_idInst);
	if (!pInstance || !m_pA3DTerrain)
	{
		ASSERT(0);
		return -1.0;
	}
	int nColumn = pInstance->iColNum;
	int nGridsInSubArea = m_pA3DTerrain->GetSubTerrainGrid();
	float fGridSize = m_pA3DTerrain->GetGridSize();
	double width = nColumn*nGridsInSubArea*fGridSize;
	return width;
}

double  CECWorld::GetWorldSizeZ()
{
	const CECInstance::sInstanceInfo* pInstance = CECInstance::GetInstance().GetInstanceInfo(m_idInst);
	if (!pInstance || !m_pA3DTerrain)
	{
		ASSERT(0);
		return -1.0;
	}
	int nRow = pInstance->iRowNum ;
	int nGridsInSubArea = m_pA3DTerrain->GetSubTerrainGrid();
	float fGridSize = m_pA3DTerrain->GetGridSize();
	double height = nRow*nGridsInSubArea*fGridSize;
	return height;
}
