/*
 * FILE: glb_Game.cpp
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Duyuxin, 2003/12/16
 *
 * HISTORY: 
 *
 * Copyright (c) 2003 Archosaur Studio, All Rights Reserved.
 */

#pragma warning (disable: 4284)

#include "StdAfx.h"
#include "EC_Global.h"
#include "EC_Game.h"
#include "EC_GameRun.h"
#include "EC_Configs.h"
#include "EC_World.h"

#include "EL_Building.h"
#include "EC_Model.h"
#include "EC_ModelMan.h"
#include "EC_GFXCaster.h"
#include "EC_SceneLoader.h"
#include "EC_Resource.h"
#include "EC_ManSkillGfx.h"
#include "EC_AudioSystem.h"
#include "Animator/Animator.h"

///////////////////////////////////////////////////////////////////////////
//	
//	Define and Macro
//	
///////////////////////////////////////////////////////////////////////////

//extern D3DCAPS8		g_d3dcaps;

// Gameversion
DWORD GAME_VERSION = ((0 << 24) | (0 << 16) | (0 << 8) | 1);
DWORD GAME_BUILD = 2;

#define ELEMENTSKILL_VERSION	8

///////////////////////////////////////////////////////////////////////////
//	
//	Reference to External variables and functions
//	
///////////////////////////////////////////////////////////////////////////

static bool g_bFocused = false;
static DWORD l_idMainThread = 0;

///////////////////////////////////////////////////////////////////////////
//	
//	Local Types and Variables and Global variables
//	
///////////////////////////////////////////////////////////////////////////

CECGame* g_pGame = NULL;

extern CECConfigs g_GameCfgs;

///////////////////////////////////////////////////////////////////////////
//	
//	Local functions
//	
///////////////////////////////////////////////////////////////////////////

CECGame::CECGame()
{
	g_pGame = this;
    m_iWndWidth = 0;
    m_iWndHeight = 0;
    m_bEngineOk = false;

	m_pA3DEngine		= NULL;
	m_pA3DDevice		= NULL;
	m_pViewport			= NULL;
	m_bActive			= false;
	m_pDirLight			= NULL;
	m_pDynamicLight		= NULL;
	m_pConfigs			= NULL;
	m_dwTickTime		= 0;
	m_dwRealTickTime	= 0;
	m_bDiscardFrame		= false;
	m_pGameRun			= NULL;
	m_fAverFRate		= 30.0f;
	m_pA3DGFXExMan		= NULL;
	m_pECModelMan		= NULL;
	m_pGFXCaster		= NULL;
	m_iCurCursor		= -1;
	m_iTimeError		= 0;
	m_iTimeZoneBias		= -480;	// time zone of Beijing
	m_pSkinRender1		= NULL;
	m_pSkinRender2		= NULL;
    m_pSkinRenderShadow = NULL;
    m_pSkinRenderSilhouette = NULL;

	memset(&m_GameInit, 0, sizeof (m_GameInit));
	memset(m_aLights, 0, sizeof (m_aLights));

	m_crMask			= 0x00000000;


	::InitializeCriticalSection(&m_csMsg);
}

CECGame::~CECGame()
{
	::LeaveCriticalSection(&m_csMsg);
}

//	Initialize game
bool CECGame::Init(const GAMEINIT& GameInit)
{
	l_idMainThread = GetCurrentThreadId();

	m_GameInit = GameInit;

	//	Initalize random number generator
	a_InitRandom();

	//	Load configs
	m_pConfigs = &g_GameCfgs;

	//	Initalize A3D engine
	if (!InitA3DEngine())
	{
		glb_ErrorOutput(ECERR_FAILEDTOCALL, _EA("CECGame::Init"), __LINE__);
		return false;
	}

    RebuildAudioSystem();

    //	now create gfx manager
    m_pA3DGFXExMan = new A3DGFXExMan();
    if (!m_pA3DGFXExMan->Init(m_pA3DDevice))
    {
        glb_ErrorOutput(ECERR_FAILEDTOCALL, _EA("CECGame::Init"), __LINE__);
        return false;
    }
    m_pA3DGFXExMan->SetGfxInterface(new _SGC::CECGFXInterfaceImpl(NULL));
    m_pA3DGFXExMan->SetSfxVolumeEnable(true);
    m_pA3DGFXExMan->SetPriority(4);

	//	Create ECModel manager
	m_pECModelMan = new CECModelMan();

	//	Create A3D skin renders
	m_pSkinRender1 = m_pA3DEngine->GetA3DSkinMan()->GetDefSkinRender();
	m_pSkinRender2 = m_pA3DEngine->CreateSkinRender(true);
    m_pSkinRenderShadow = m_pA3DEngine->CreateSkinRender(true);
    m_pSkinRenderSilhouette = m_pA3DEngine->CreateSkinRender(true);

	//	Load cursors
	if (!LoadCursors())
	{
		glb_ErrorOutput(ECERR_FAILEDTOCALL, _EA("CECGame::Init"), __LINE__);
		return false;
	}

	//	Create GFX caster
	if (!(m_pGFXCaster = new CECGFXCaster(m_pA3DGFXExMan)))
	{
		glb_ErrorOutput(ECERR_NOTENOUGHMEMORY, _EA("CECGame::Init"), __LINE__);
		return false;
	}

	//	Create game run object
	if (!(m_pGameRun = new CECGameRun))
	{
		glb_ErrorOutput(ECERR_NOTENOUGHMEMORY, _EA("CECGame::Init"), __LINE__);
		return false;
	}

	if (!m_pGameRun->Init())
	{
		glb_ErrorOutput(ECERR_FAILEDTOCALL, _EA("CECGame::Init"), __LINE__);
		return false;
	}

	m_pGameRun->InitGfxComposerMan();

	m_pA3DDevice->GetA3DEngine()->GetAMSoundEngine()->SetVolume(m_pConfigs->GetSystemSettings().nSoundVol);

    g_Animator.Init();

	return true;
}

//	Release game
void CECGame::Release()
{
    g_Animator.Release();

	A3DRELEASE(m_pGameRun);

    delete m_pGFXCaster;
    m_pGFXCaster = 0;

    A3DRELEASE(m_pA3DGFXExMan);

	A3DRELEASE(m_pECModelMan);

    A3DRELEASE(m_pSkinRenderSilhouette);
    A3DRELEASE(m_pSkinRenderShadow);
	A3DRELEASE(m_pSkinRender2);
	m_pSkinRender1 = NULL;

    A3DRELEASE(m_pAudioSystem);

	ReleaseCursors();
	ReleaseFonts();

	//	Release A3D engine
	CECGame::ReleaseA3DEngine();

    m_pConfigs = NULL;

	g_pGame = NULL;
}

bool CECGame::RebuildAudioSystem()
{
    if (m_pAudioSystem)
    {
        A3DRELEASE(m_pAudioSystem);
    }

    m_pAudioSystem = new CECAudioSystem();
    if (!m_pAudioSystem->Init(_EA("audio"), true))
    {
        delete m_pAudioSystem;
        m_pAudioSystem = NULL;

        glb_ErrorOutput(ECERR_FAILEDTOCALL, _EA("CECGame::Init"), __LINE__);
        return false;
    }
    return true;
}

//	Load cursors
bool CECGame::LoadCursors()
{
	for (int i=0; i < NUM_RES_CURSOR; i++)
	{
		A3DSysCursor* pCursor = new A3DSysCursor;
		
		if (!pCursor->Load(m_pA3DDevice, res_CursorFile(i)))
		{
			a_LogOutput(1, _EA("CECGame::LoadCursors, failed to cursor %s!"), res_CursorFile(i));
			delete pCursor;
			pCursor = NULL;
		}

		m_aCursors.Add(pCursor);
	}

	return true;
}

//	Release cursors
void CECGame::ReleaseCursors()
{
	for (int i=0; i < m_aCursors.GetSize(); i++)
	{
		A3DCursor* pCursor = m_aCursors[i];
		if (pCursor)
			delete pCursor;
	}

	m_aCursors.RemoveAll();

	if (m_pA3DDevice)
		m_pA3DDevice->SetCursor(NULL);
}

//	Release fonts
void CECGame::ReleaseFonts()
{
	if (!m_pA3DEngine)
		return;

	A3DFontMan* pFontMan = m_pA3DEngine->GetA3DFontMan();

	for (int i=0; i < m_aFonts.GetSize(); i++)
	{
		if (m_aFonts[i])
			pFontMan->ReleaseA3DFont(m_aFonts[i]);
	}

	m_aFonts.RemoveAll();
}

//	Get font object
A3DFont* CECGame::GetFont(int iIndex)
{
	if (m_aFonts[iIndex])
		return m_aFonts[iIndex];

	return m_pA3DEngine->GetSystemFont();
}

/*	Window message handler
	Return true if message was processed, otherwise return false.
*/
bool CECGame::WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch (message)
	{
	case WM_KILLFOCUS:
		if( m_bActive )
		{
			if (m_pA3DDevice && !m_pA3DDevice->GetDevFormat().bWindowed)
			{
				
				if(IsWindow((HWND)wParam))
				{
					DWORD pid;
					GetWindowThreadProcessId((HWND)wParam,&pid);
					if(pid==GetCurrentProcessId())
					{
						break;
					}
				}

				ChangeDisplaySettings(NULL, CDS_RESET);
				ShowWindow(hWnd, SW_MINIMIZE);
				InvalidateRect(NULL, NULL, TRUE);
				m_pA3DDevice->SetNeedResetFlag(true);
			}
		}
		g_bFocused = false;
		break;

	case WM_SETFOCUS:

		
		g_bFocused = true;
		break;

	case WM_ACTIVATE:
	
		if( wParam == WA_INACTIVE && m_bActive )
		{
			if (m_pA3DDevice && !m_pA3DDevice->GetDevFormat().bWindowed)
			{
				if(IsWindow((HWND)lParam))
				{
					DWORD pid;
					GetWindowThreadProcessId((HWND)lParam,&pid);
					if(pid==GetCurrentProcessId())
					{
						break;
					}
				}

				ChangeDisplaySettings(NULL, CDS_RESET);
				ShowWindow(hWnd, SW_MINIMIZE);
				InvalidateRect(NULL, NULL, TRUE);
				m_pA3DDevice->SetNeedResetFlag(true);
			}
		}
		break;
	case WM_ACTIVATEAPP:
		m_bActive = wParam ? true : false;
		
		if(!m_bActive)
		{
			GUITHREADINFO guithreadinfo;
			guithreadinfo.cbSize = sizeof(GUITHREADINFO);
			if(GetGUIThreadInfo((DWORD)lParam,&guithreadinfo))
			{
				if(IsWindow(guithreadinfo.hwndActive))
				{
					DWORD pid;
					GetWindowThreadProcessId(guithreadinfo.hwndActive,&pid);
					if(pid==GetCurrentProcessId())
					{
						m_bActive = true;
					}
				}
			}
		}
		
		if( m_bActive )
		{
			if( m_pA3DEngine )
			{
				if( m_pA3DEngine->GetAMSoundEngine() )
				{	
					m_pA3DEngine->GetAMSoundEngine()->SetVolume(m_pConfigs->GetSystemSettings().nSoundVol);
				}
			}
		}
		else
		{
			if (m_pA3DDevice && !m_pA3DDevice->GetDevFormat().bWindowed)
			{
				ChangeDisplaySettings(NULL, CDS_RESET);
				ShowWindow(hWnd, SW_MINIMIZE);
				InvalidateRect(NULL, NULL, TRUE);
				m_pA3DDevice->SetNeedResetFlag(true);
			}
		}
		break;

	case WM_PAINT:
		PAINTSTRUCT	ps;
		HDC hdc;
		hdc = BeginPaint(hWnd, &ps);
		if( m_pConfigs )
			BitBlt(hdc, 0, 0, m_pConfigs->GetSystemSettings().iRndWidth, m_pConfigs->GetSystemSettings().iRndHeight, NULL, 0, 0, BLACKNESS);
		EndPaint(hWnd, &ps);
		break;

	case WM_SETCURSOR:

		if (m_pA3DDevice && m_pA3DDevice->GetShowCursor())
		{
			if( LOWORD(lParam) != HTCLIENT )
			{
				return false;
			}
			else
			{
				A3DCursor* pCursor = m_pA3DDevice->GetCursor();
				if (pCursor)
					pCursor->OnSysSetCursor();
			}
		}
		else
			SetCursor(NULL);
		
		break;

	case WM_QUIT:
	case WM_CLOSE:
	case WM_DESTROY:

		//	Do nothing to mask ALT-F4
		break;

	case WM_GETMINMAXINFO:
		{
			MINMAXINFO * pInfo = (MINMAXINFO *) lParam;

			if( (GetConfigs() && GetConfigs()->GetSystemSettings().bFullScreen) || GetWindowLong(hWnd, GWL_STYLE) == WS_POPUP )
			{
				// fullscreen mode, we don't limit the window size
				pInfo->ptMaxSize.x = 4000;
				pInfo->ptMaxSize.y = 3000;
				pInfo->ptMinTrackSize.x = 320;
				pInfo->ptMinTrackSize.y = 240;
				pInfo->ptMaxTrackSize.x = 4000;
				pInfo->ptMaxTrackSize.y = 3000;
			}
			else
			{
				// window mode, we must limit the window to fit on current screen.
				RECT rectWnd, rectClient;
				GetWindowRect(hWnd, &rectWnd);
				GetClientRect(hWnd, &rectClient);
				int dx = rectWnd.right - rectWnd.left - rectClient.right + rectClient.left;
				int dy = rectWnd.bottom - rectWnd.top - rectClient.bottom + rectClient.top;
				pInfo->ptMaxSize.x = ::GetSystemMetrics(SM_CXSCREEN) + dx;
				pInfo->ptMaxSize.y = ::GetSystemMetrics(SM_CYSCREEN) + dy;
				pInfo->ptMinTrackSize.x = 320 + dx;
				pInfo->ptMinTrackSize.y = 240 + dy;
				pInfo->ptMaxTrackSize.x = ::GetSystemMetrics(SM_CXSCREEN) + dx;
				pInfo->ptMaxTrackSize.y = ::GetSystemMetrics(SM_CYSCREEN) + dy;
			}
		}
		break;

	case WM_SIZING:
		{
			static const float r1 = 16.0f / 9.0f;
			static const float r2 = 9.0f / 16.0f;

			RECT * pDrag = (RECT *) lParam;
			int nWidth = pDrag->right - pDrag->left;
			int nHeight = pDrag->bottom - pDrag->top;

			switch(wParam)
			{
			case WMSZ_TOP:
				if( nWidth > nHeight * r1 )
					pDrag->top = (int)(pDrag->bottom - nWidth * r2);
				break;

			case WMSZ_BOTTOM:
				if( nWidth > nHeight * r1 )
					pDrag->bottom = (int)(pDrag->top + nWidth * r2);
				break;

			case WMSZ_BOTTOMLEFT:
			case WMSZ_BOTTOMRIGHT:
				if( nWidth > nHeight * r1 )
					pDrag->bottom = (int)(pDrag->top + nWidth * r2);
				break;

			case WMSZ_TOPLEFT:
			case WMSZ_TOPRIGHT:
				if( nWidth > nHeight * r1 )
					pDrag->top = (int)(pDrag->bottom - nWidth * r2);
				break;

			case WMSZ_LEFT:
				if( nWidth > nHeight * r1 )
					pDrag->left = (int)(pDrag->right - nHeight * r1);
				break;

			case WMSZ_RIGHT:
				if( nWidth > nHeight * r1 )
					pDrag->right = (int)(pDrag->left + nHeight * r1);
				break;
			}
		}
		break;

	case WM_EXITSIZEMOVE:
		if( GetConfigs() && !GetConfigs()->IsAdjusting() && m_pA3DDevice )
		{
			RECT rect;
			int w, h;
			GetClientRect(hWnd, &rect);
			w = rect.right;
			h = rect.bottom;

			if( w == 0 || h == 0 )
				break;

			EC_SYSTEM_SETTING ss = GetConfigs()->GetSystemSettings();
			ss.iRndWidth = w;
			ss.iRndHeight = h;

			A3DViewport * pViewport = g_pGame->GetViewport()->GetA3DViewport();
			A3DVIEWPORTPARAM param1 = *pViewport->GetParam();
			
			GetConfigs()->SetSystemSettings(ss, true);

			A3DVIEWPORTPARAM param2 = *pViewport->GetParam();

			if (m_pGameRun)
			{
				A3DRECT rect1, rect2;
				rect1.SetRect(0, 0, param1.Width, param1.Height);
				rect2.SetRect(0, 0, param2.Width, param2.Height);
				AfxGetGFXExMan()->Resize2DViewport();
			}
		}
		else
		{
			return false;
		}

		break;

	case WM_KEYDOWN:
		if( wParam != VK_PROCESSKEY && !GetAsyncKeyState(wParam) )
			return true;

	default:
		return false;
	}

	return true;
}

extern HANDLE g_hExitGame;
extern HANDLE g_hMainThread;
extern HANDLE g_hRenderEvent;
extern volatile bool g_bMainSuspened;
extern volatile bool g_bMultiThreadRenderMode;
extern CRITICAL_SECTION g_csRenderThread;

int CECGame::RunInRenderThread()
{
	int iRet = -1;

	while (1)
	{
		if (::WaitForSingleObject(g_hExitGame, 0) == WAIT_OBJECT_0)
		{
			iRet = 0;
			break;
		}

		if (g_bMainSuspened)
			::ResumeThread(g_hMainThread);

		WaitForSingleObject(g_hRenderEvent, 20);

		if (!OnceRun())
			break;
	}

	return iRet;
}

bool CECGame::RunInMainThread()
{
	if (!DispatchWindowsMessage())
	{
		a_LogOutput(1, _EA("CECGame::Run(), break because DispatchWindowsMessage return false!"));
		return false;
	}

	if (g_bMultiThreadRenderMode)
		return true;

	
    /*
    if (!GetA3DDevice()->GetAutoResetFlag() && GetA3DDevice()->GetNeedResetFlag() && GetA3DDevice()->GetCanResetFlag())
	{
		SuspendLoadThread();

		if (!g_pGame->GetA3DDevice()->Reset())
			a_LogOutput(1, _EA("CECGame::Run(), need reset the device, but we fail to call it!"));

		// now restore some once set render states.
		if( m_pConfigs->GetSystemSettings().bMipMapBias )
		{
			float v = -1.0f;
			for(int i=0; i<m_pA3DDevice->GetMaxSimultaneousTextures(); i++)
			{
				m_pA3DDevice->SetSamplerState(i, D3DSAMP_MIPMAPLODBIAS, *(DWORD *)&v);
			}
		}

		StartLoaderThread();
	}
    */

	return OnceRun();
}

bool CECGame::OnceRun()
{
	static DWORD dwLastFrame = 0;
	static int iTickCnt = 0;
	static DWORD dwAccuTime = 0;
	static DWORD dwMGCTime = 0;	//	Memory garbage collect time

	if (dwLastFrame == 0)
	{
		dwLastFrame = a_GetTime();
		return true;
	}
	else
	{
		// TODO: Only use clock in AnimationEditor
        DWORD dwCurTime = a_GetTime();
		m_dwRealTickTime = dwCurTime - dwLastFrame;
		dwLastFrame = dwCurTime;
	}

	if (m_bDiscardFrame || !m_dwRealTickTime)
	{
		//	Discard this frame
		m_bDiscardFrame = false;
		return true;
	}

	//	Calculate average frame rate
	dwAccuTime += m_dwRealTickTime;
	if (++iTickCnt >= 15)
	{
		m_fAverFRate = 1000.0f / (dwAccuTime / 15.0f);

		iTickCnt	= 0;
		dwAccuTime	= 0;
	}

	//	Clamp logic tick time
	m_dwTickTime = m_dwRealTickTime;
	if (m_dwTickTime > 250)
		m_dwTickTime = 250;

	//	Game tick routine
    if (!m_pGameRun->Tick(m_dwTickTime))
	{
		a_LogOutput(1, _EA("CECGame::Run(), break because CECGameRun::Tick return false"));
		return false;
	}

	if( m_bActive || (m_pA3DDevice && m_pA3DDevice->GetDevFormat().bWindowed && IsWindowVisible(m_GameInit.hWnd) && !IsMinimized(m_GameInit.hWnd)) )
	{
		if (!m_pGameRun->Render())
		{
			a_LogOutput(1, _EA("CECGame::Run(), break because CECGameRun::Render() return false!"));
			return false;
		}
	}
	else
		Sleep(20);
	
	//	Do memory garbage collect
	if ((dwMGCTime += m_dwRealTickTime) >= 4000)
	{
		dwMGCTime = 0;
	}

	return true;
}

//	Add windows message
void CECGame::AddWindowsMessage(MSG& msg)
{
	::EnterCriticalSection(&m_csMsg);
	m_MsgList.AddTail(msg);
	::LeaveCriticalSection(&m_csMsg);
}

//	Dispatch windows message
bool CECGame::DispatchWindowsMessage()
{
	MSG msg;
	while (::PeekMessage(&msg, NULL, 0, 0, PM_REMOVE))
	{
		if (msg.message == WM_QUIT)
			return false;

		::TranslateMessage(&msg);
		::DispatchMessage(&msg);
	}

	return true;
}

//	Initialize A3D engine
bool CECGame::InitA3DEngine()
{
	//	Init Engine
	m_pA3DEngine = new A3DEngine();
    if (!m_pA3DEngine)
	{
		glb_ErrorOutput(ECERR_NOTENOUGHMEMORY, _EA("CECGame::InitA3DEngine"), __LINE__);
		return false;
	}
    m_bEngineOk = true;

    RECT Rect;
    GetClientRect(m_GameInit.hWnd, &Rect);
    m_iWndWidth = Rect.right;
    m_iWndHeight = Rect.bottom;
	
	A3DDEVFMT devFmt;
	devFmt.bWindowed	= !m_GameInit.bFullscreen;
	devFmt.nWidth		= m_iWndWidth;
	devFmt.nHeight		= m_iWndHeight;
	devFmt.fmtTarget	= A3DFMT_UNKNOWN;
	devFmt.fmtDepth		= A3DFMT_UNKNOWN;
	devFmt.bVSync		= m_pConfigs->GetSystemSettings().bVSync;
	devFmt.bSndGlobal	= true;
						
	// A3DDEV_ALPHATARGETFIRST: if we use alpha target first and the desktop display mode is just what we use 
	// as the full-screen mode for the game, the game may not minimized when switched off. To solve this, we should
	// add a manual call to ChangeDisplaySetting when we receive WM_ACTIVATEAPP
	DWORD devFlags = A3DDEV_ALLOWMULTITHREAD;
	devFlags |= A3DDEV_ALPHATARGETFIRST;

	if (!m_pA3DEngine->Init(m_GameInit.hInstance, m_GameInit.hWnd, &devFmt, devFlags))
	{
		glb_ErrorOutput(ECERR_FAILEDTOCALL, _EA("CECGame::InitA3DEngine"), __LINE__);
		return false;
	}

	g_pA3DConfig->RT_SetShowFPSFlag(true);
	g_pA3DConfig->SetFlagLinearSprite(true);

	g_pA3DConfig->SetTextureQuality((A3DTEXTURE_QUALITY)m_pConfigs->GetSystemSettings().iTexDetail);
	m_pA3DEngine->GetAMEngine()->GetAMConfig()->SetSoundQuality((AMSOUND_QUALITY)m_pConfigs->GetSystemSettings().iSoundQuality);

	m_pA3DDevice = m_pA3DEngine->GetA3DDevice();

	// In element client we use multithread to load terrain meshes etc.
	// so the reset operation can not be done by the device automatically, or we may not release all unmanaged
	// device objects before we reset, so reset will fail.
	m_pA3DDevice->SetAutoResetFlag(false);

	// show a black screen without loading text
	m_pA3DDevice->BeginRender();
	m_pA3DDevice->Clear(D3DCLEAR_TARGET, 0x00000000, 1.0f, 0);
	m_pA3DDevice->EndRender();
	m_pA3DDevice->Present();

	//	Create viewport
	if (!(m_pViewport = new CECViewport))
	{
		glb_ErrorOutput(ECERR_NOTENOUGHMEMORY, _EA("CECGame::InitA3DEngine"), __LINE__);
		return false;
	}

	CECViewport::INITPARAMS ViewParams;
	memset(&ViewParams, 0, sizeof (ViewParams));

	ViewParams.rcView.left		= 0;
	ViewParams.rcView.top		= 0;
	ViewParams.rcView.right		= m_GameInit.iRenderWid;
	ViewParams.rcView.bottom	= m_GameInit.iRenderHei;
	ViewParams.fMinZ			= 0.0f;
	ViewParams.fMaxZ			= 1.0f;
	ViewParams.bClearColor		= false;
	ViewParams.bClearZ			= true;
	ViewParams.colClear			= 0x00000000;
	ViewParams.fFOV				= DEG2RAD(DEFCAMERA_FOV);
	ViewParams.fNearPlane		= 0.2f;
	ViewParams.fFarPlane		= 2000.0f;

	float w = (float)m_GameInit.iRenderWid;
	float h = (float)m_GameInit.iRenderHei;
	ViewParams.bOrthoCamera	= true;
	ViewParams.fOCLeft		= -w;
	ViewParams.fOCRight		= w;
	ViewParams.fOCBottom	= -h;
	ViewParams.fOCTop		= h;
	ViewParams.fOCZNear		= -1500.0f;
	ViewParams.fOCZFar		= 1500.0f;

    if (!m_pViewport->Init(m_pA3DDevice, ViewParams))
	{
		glb_ErrorOutput(ECERR_FAILEDTOCALL, _EA("CECGame::InitA3DEngine"), __LINE__);
		return false;
	}
	m_pViewport->Activate(false);

	//	Create directional light
	A3DLIGHTPARAM LightParams;
	memset(&LightParams, 0, sizeof (LightParams));

	//	Set default light parameters
	LightParams.Type = A3DLIGHT_DIRECTIONAL;
	LightParams.Direction = m_pConfigs->m_vDefLightDir;
	LightParams.Diffuse = m_pConfigs->m_dwDefLightDiff;
	LightParams.Specular = m_pConfigs->m_dwDefLightSpec;
	LightParams.Attenuation0 = 1.0f;
	if (!(m_pDirLight = CreateA3DLight(&LightParams)))
	{
		glb_ErrorOutput(ECERR_FAILEDTOCALL, _EA("CECGame::InitA3DEngine"), __LINE__);
		return false;
	}
	m_pDirLight->TurnOn();

	//	Create dynamic point light
	LightParams.Type = A3DLIGHT_POINT;
	LightParams.Specular = A3DCOLORVALUE(0.0f, 0.0f, 0.0f, 1.0f);
	if (!(m_pDynamicLight = CreateA3DLight(&LightParams)))
	{
		glb_ErrorOutput(ECERR_FAILEDTOCALL, _EA("CECGame::InitA3DEngine"), __LINE__);
		return false;
	}

	m_pDynamicLight->TurnOff();

	//	Set default ambient value and fog parameters
	m_pA3DDevice->SetAmbient(m_pConfigs->m_dwDefAmbient);
	m_pA3DDevice->SetFogEnable(true);
	m_pA3DDevice->SetFogStart(m_pConfigs->m_fDefFogStart);
	m_pA3DDevice->SetFogEnd(m_pConfigs->m_fDefFogEnd);
	m_pA3DDevice->SetFogDensity(m_pConfigs->m_fDefFogDensity);
	m_pA3DDevice->SetFogColor(m_pConfigs->m_dwDefFogColor);

	m_pA3DDevice->SetGammaLevel(m_pConfigs->GetSystemSettings().iGamma);

	//	Load skin model shaders
	A3DSkinMan* pSkinMan = m_pA3DEngine->GetA3DSkinMan();
	if (!pSkinMan->LoadSkinModelVertexShaders(_EA("Configs\\2.2\\skinmodelvs.cfg")))
	{
		a_LogOutput(1, _EA("CECGame::InitA3DEngine, Failed to load skinmodelvs.cfg"));
		return false;
	}

	pSkinMan->SetDirLight(m_pDirLight);
	pSkinMan->SetDPointLight(m_pDynamicLight);
	
	if (m_pConfigs->GetSystemSettings().bMipMapBias)
	{
		float v = 0.0f;
		for (int i=0; i<m_pA3DDevice->GetMaxSimultaneousTextures(); i++)
		{
			m_pA3DDevice->SetSamplerState(i, D3DSAMP_MIPMAPLODBIAS, *(DWORD *)&v);
		}
	}
	
	return true;
}

//	Release A3D engine
void CECGame::ReleaseA3DEngine()
{
	//	Release lights
	ReleaseA3DLight(m_pDirLight);
	ReleaseA3DLight(m_pDynamicLight);

	//	Release viewport
	if (m_pViewport)
	{
		delete m_pViewport;
		m_pViewport = NULL;
	}

	A3DRELEASE(m_pA3DEngine);
	m_pA3DDevice = NULL;
}

/*	Create a A3D Light object

	pParams: light's parameters, if this parameter is NULL, light's parameter must
			 be set through A3DLight::SetLightParam later.
*/
A3DLight* CECGame::CreateA3DLight(const A3DLIGHTPARAM* pParams)
{
	ASSERT(m_pA3DEngine);

	int i;

	for (i=0; i < MAXNUM_LIGHT; i++)
	{
		if (!m_aLights[i])
			break;
	}

	if (i >= MAXNUM_LIGHT)
		return NULL;

	A3DLight* pLight = NULL;

	//	Create a light
	m_pA3DEngine->GetA3DLightMan()->CreateLight(i, &pLight);

	if (!pLight)
	{
		a_LogOutput(1, _EA("Failed to create A3D light"));
		return NULL;
	}

	if (pParams)
		pLight->SetLightParam(*pParams);

	m_aLights[i] = pLight;

	return pLight;
}

//	Release A3D Light object
void CECGame::ReleaseA3DLight(A3DLight* pLight)
{
	if (!pLight)
		return;

	for (int i=0; i < MAXNUM_LIGHT; i++)
	{
		if (m_aLights[i] == pLight)
		{
			m_aLights[i] = NULL;
			break;
		}
	}

	m_pA3DEngine->GetA3DLightMan()->ReleaseLight(pLight);
}

//	Reset game, release all resources
bool CECGame::Reset()
{
	if (m_pSkinRender1)
	{
		m_pSkinRender1->ResetRenderInfo(true);
		m_pSkinRender1->ResetRenderInfo(false);
	}

	if (m_pSkinRender2)
	{
		m_pSkinRender2->ResetRenderInfo(true);
		m_pSkinRender2->ResetRenderInfo(false);
	}

    if (m_pSkinRenderShadow)
    {
        m_pSkinRenderShadow->ResetRenderInfo(true);
        m_pSkinRenderShadow->ResetRenderInfo(false);
    }

    if (m_pSkinRenderSilhouette)
    {
        m_pSkinRenderSilhouette->ResetRenderInfo(true);
        m_pSkinRenderSilhouette->ResetRenderInfo(false);
    }

	if (m_pGFXCaster)
		m_pGFXCaster->Reset();

	if (m_pA3DGFXExMan)
	{
		m_pA3DGFXExMan->Release();
		m_pA3DGFXExMan->Init(m_pA3DDevice);
	}

	if (m_pA3DEngine)
	{
		if (!m_pA3DEngine->ResetResource())
		{
			a_LogOutput(1, _EA("Failed to reset A3DEngine resources."));
			return false;
		}
	}

	//	Discard current frame
	m_bDiscardFrame = true;

	return true;
}

//	Load A3D skin model
A3DSkinModel* CECGame::LoadA3DSkinModel(const char* szFile, int iSkinFlag/* 0 */)
{
	A3DSkinModel* pModel = new A3DSkinModel;
	if (!pModel)
	{
		glb_ErrorOutput(ECERR_NOTENOUGHMEMORY, _EA("CECGame::LoadA3DSkinModel"), __LINE__);
		return NULL;
	}

	if (!pModel->Init(m_pA3DEngine))
	{
		delete pModel;
		glb_ErrorOutput(ECERR_FAILEDTOCALL, _EA("CECGame::LoadA3DSkinModel"), __LINE__);
		return NULL;
	}

	if (!pModel->Load(szFile, iSkinFlag))
	{
		delete pModel;
		a_LogOutput(1, _EA("CECGame::LoadA3DSkinModel, Failed to load %s"), szFile);
		return NULL;
	}

	return pModel;
}

//	Release A3D skin model
void CECGame::ReleaseA3DSkinModel(A3DSkinModel* pModel)
{
	if (!pModel)
		return;

	pModel->Release();
	delete pModel;
}

//	Load A3D skin
A3DSkin* CECGame::LoadA3DSkin(const char* szFile, bool bUnique/* true */)
{
	A3DSkinMan* pSkinMan = m_pA3DEngine->GetA3DSkinMan();
	return pSkinMan->LoadSkinFile(szFile);
}

//	Release A3D skin
void CECGame::ReleaseA3DSkin(A3DSkin* pSkin, bool bUnique/* true */)
{
	if (!pSkin)
	{
		return;
	}
	A3DSkinMan* pSkinMan = m_pA3DEngine->GetA3DSkinMan();
	pSkinMan->ReleaseSkin(&pSkin);
}

//	Load a building model from file
CELBuilding* CECGame::LoadBuilding(const char* szFile)
{
	CELBuilding* pBuilding = new CELBuilding;
	if (!pBuilding)
	{
		glb_ErrorOutput(ECERR_NOTENOUGHMEMORY, _EA("CECGame::LoadBuilding"), __LINE__);
		return NULL;
	}

	AFileImage File;
	if (!File.Open(_EA(""), szFile, AFILE_OPENEXIST | AFILE_BINARY))
	{
		delete pBuilding;
		a_LogOutput(1, _EA("CECGame::LoadBuilding, failed to open file %s"), szFile);
		return NULL;
	}

	if (!pBuilding->Load(m_pA3DDevice, &File))
	{
		delete pBuilding;
		a_LogOutput(1, _EA("CECGame::LoadBuilding, failed to load lit model %s"), szFile);
		return NULL;
	}

	File.Close();

	return pBuilding;
}

//	Release building model
void CECGame::ReleaseBuilding(CELBuilding* pBuilding)
{
	A3DRELEASE(pBuilding);
}

//	Show or hide cursor
void CECGame::ShowCursor(bool bShow)
{
	m_pA3DDevice->ShowCursor(bShow);
}

//	Change current cursor
int CECGame::ChangeCursor(int iCursor)
{
	if (iCursor == m_iCurCursor)
		return iCursor;

	if (m_aCursors[iCursor])
		m_pA3DDevice->SetCursor(m_aCursors[iCursor]);

	// force show this cursor
	ShowCursor(g_pGame->GetA3DDevice()->GetShowCursor());

	if( l_idMainThread != GetCurrentThreadId() )
	{
		// ::SetCursor must be called from main thread to take effects, so here we should post a WM_SETCURSOR message
		// to ensure the main thread receive WM_SETCURSOR and update the cursor again
		PostMessage(m_GameInit.hWnd, WM_SETCURSOR, (WPARAM)m_GameInit.hWnd, MAKELPARAM(HTCLIENT, WM_MOUSEMOVE));
	}

	int iOldCursor = m_iCurCursor;
	m_iCurCursor = iCursor;
	return iOldCursor;
}

//	Get game version
DWORD CECGame::GetGameVersion()
{
	return GAME_VERSION;
}

//	Get game build
DWORD CECGame::GetGameBuild()
{
	return GAME_BUILD;
}

//	Render high-light model
bool CECGame::RenderHighLightModel(CECViewport* pView, CECModel* pModel)
{
	if (!pModel || !pModel->GetA3DSkinModel())
		return false;

	A3DSkinModel* pSkinModel = pModel->GetA3DSkinModel();

	A3DCOLORVALUE col = pSkinModel->GetExtraEmissive();
	int iChildModelNum = pSkinModel->GetChildModelNum();
	A3DCOLORVALUE *colChildModel = NULL;
	if( iChildModelNum > 0 )
	{
		colChildModel = new A3DCOLORVALUE[iChildModelNum];
		for(int i = 0; i < iChildModelNum; i++)
		{
			CECModel *pChildModel = pModel->GetChildModel(i);
			colChildModel[i] = pChildModel->GetA3DSkinModel()->GetExtraEmissive();
			if( pChildModel )
				pChildModel->GetA3DSkinModel()->SetExtraEmissive(A3DCOLORVALUE(1.0f));
		}
	}
	pSkinModel->SetExtraEmissive(A3DCOLORVALUE(1.0f));
	pModel->Render(pView->GetA3DViewport(), true);
	if( iChildModelNum > 0 )
	{
		for(int i = 0; i < iChildModelNum; i++)
		{
			CECModel *pChildModel = pModel->GetChildModel(i);
			if( pChildModel )
				pChildModel->GetA3DSkinModel()->SetExtraEmissive(colChildModel[i]);
		}
		delete []colChildModel;
	}
	pSkinModel->SetExtraEmissive(col);
	return true;
}

bool CECGame::RenderHighLightModel(CECViewport* pView, A3DSkinModel* pModel)
{
	if (!pModel)
		return false;

	A3DCOLORVALUE col = pModel->GetExtraEmissive();
	int iChildModelNum = pModel->GetChildModelNum();
	A3DCOLORVALUE *colChildModel = NULL;
	if( iChildModelNum > 0 )
	{
		colChildModel = new A3DCOLORVALUE[iChildModelNum];
		for(int i = 0; i < iChildModelNum; i++)
		{
			A3DSkinModel *pChildModel = pModel->GetChildModel(i);
			colChildModel[i] = pChildModel->GetExtraEmissive();
			if( pChildModel )
				pChildModel->SetExtraEmissive(A3DCOLORVALUE(1.0f));
		}
	}
	pModel->SetExtraEmissive(A3DCOLORVALUE(1.0f));
	pModel->RenderAtOnce(pView->GetA3DViewport(), 0);
	if( iChildModelNum > 0 )
	{
		for(int i = 0; i < iChildModelNum; i++)
		{
			A3DSkinModel *pChildModel = pModel->GetChildModel(i);
			if( pChildModel )
				pChildModel->SetExtraEmissive(colChildModel[i]);
		}
		delete []colChildModel;
	}
	pModel->SetExtraEmissive(col);
	return true;
}

void CECGame::OnWindowPosChanged(WINDOWPOS FAR* lpwndpos)
{
    if (!m_bEngineOk || lpwndpos->cx < 16 || lpwndpos->cy < 9)
    {
        return;
    }

    m_pA3DEngine->SetDisplayMode(lpwndpos->cx, lpwndpos->cy, A3DFMT_UNKNOWN, true, true, SDM_WIDTH | SDM_HEIGHT);
    m_pA3DDevice->Clear(D3DCLEAR_TARGET, 0x00000000, 1.0f, 0);

    m_pViewport->Move(0, 0, lpwndpos->cx, lpwndpos->cy, false);

    AfxGetGFXExMan()->Resize2DViewport();
}
