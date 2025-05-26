/*
 * FILE: GL_Game.h
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Duyuxin, 2003/12/16
 *
 * HISTORY: 
 *
 * Copyright (c) 2003 Archosaur Studio, All Rights Reserved.
 */

#pragma once

#include <A3D.h>
#include <AF.h>
#include <AM.h>
#include <windows.h>
#include "A3DTypes.h"
#include "AArray.h"
#include "hashtab.h"
#include "hashmap.h"

#include "AList2.h"
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

class A3DEngine;
class A3DDevice;
class A3DLight;
class A3DSkinModel;
class A3DSkin;
class A3DMuscleData;
class AMSoundBufferMan;

class CELBuilding;
class CECViewport;
class CECGameRun;
class A3DGFXEx;
class A3DGFXExMan;
class CECModelMan;
class A3DCursor;
class A3DFont;
class A3DSkinRender;
class CECGFXCaster;
class CECConfigs;
class CECAudioSystem;
class CECModel;
class A3DLitModelRender;

///////////////////////////////////////////////////////////////////////////
//	
//	Declare of Global functions
//	
///////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////
//	
//	Class CECGame
//	
///////////////////////////////////////////////////////////////////////////

class CECGame
{
public:	//	Types

	enum
	{
		MAXNUM_LIGHT = 8,	//	Maximum number of A3D Light
	};

	struct GAMEINIT
	{
		HINSTANCE	hInstance;
		HWND		hWnd;
		bool		bFullscreen;
		int			iRenderWid;
		int			iRenderHei;
		char		szIP[256];
		int			iPort;
		_INT_64		iServerID;
	};

public:	//	Constructor and Destructor

	CECGame();
	virtual ~CECGame();

public:		//	Attributes

public:		//	Operations

	//	Initialize game
	bool Init(const GAMEINIT& GameInit);
	//	Release game
	void Release();
	//	Reset game, release all resources
	bool Reset();

	//	Run game
	int RunInRenderThread();
	bool RunInMainThread();
	bool OnceRun();

	//	Window message handler
	bool WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam);

	//	Dispatch windows message
	bool DispatchWindowsMessage();
	//	Add windows message
	void AddWindowsMessage(MSG& msg);

	//	Create a A3D Light object
	A3DLight* CreateA3DLight(const A3DLIGHTPARAM* pParams);
	//	Release Light object
	void ReleaseA3DLight(A3DLight* pLight);
	//	Load A3D skin model
	A3DSkinModel* LoadA3DSkinModel(const char* szFile, int iSkinFlag=0);
	//	Release A3D skin model
	void ReleaseA3DSkinModel(A3DSkinModel* pModel);
	//	Load A3D skin
	A3DSkin* LoadA3DSkin(const char* szFile, bool bUnique=true);
	//	Release A3D skin
	void ReleaseA3DSkin(A3DSkin* pSkin, bool bUnique=true);
	//	Load a building model from file
	CELBuilding* LoadBuilding(const char* szFile);
	//	Release a building model
	void ReleaseBuilding(CELBuilding* pBuilding);
	//	Show or hide cursor
	void ShowCursor(bool bShow);
	//	Change current cursor
	int ChangeCursor(int iCursor);
	//	Get current cursor
	int GetCurCursor() { return m_iCurCursor; }
	//	Get font object
	A3DFont* GetFont(int iIndex);

	//	Render high-light model
	bool RenderHighLightModel(CECViewport* pView, CECModel* pModel);
	bool RenderHighLightModel(CECViewport* pView, A3DSkinModel* pModel);
	//	Get element data path through path id
	const char* GetDataPath(DWORD id);
	//	Get element text through text id
	const wchar_t* GetDataText(DWORD id);
	//	Get dynamic object path
	const char* GetDynObjectPath(DWORD dwDynObjID);

	//	Get interfaces
	A3DEngine* GetA3DEngine() { return m_pA3DEngine; }
	A3DDevice* GetA3DDevice() { return m_pA3DDevice; }
	A3DLight* GetDirLight() { return m_pDirLight; }
	A3DLight* GetDynamicLight() { return m_pDynamicLight; }
	CECViewport* GetViewport() { return m_pViewport; }
	CECConfigs* GetConfigs() { return m_pConfigs; }
	CECGameRun* GetGameRun() { return m_pGameRun; }

	A3DGFXExMan* GetA3DGFXExMan() { return m_pA3DGFXExMan; }
	CECModelMan* GetECModelMan() { return m_pECModelMan; }

	CECGFXCaster* GetGFXCaster() { return m_pGFXCaster; }

	A3DSkinRenderBase* GetSkinRender1() { return m_pSkinRender1; }
	A3DSkinRenderBase* GetSkinRender2() { return m_pSkinRender2; }
    A3DSkinRenderBase* GetSkinRenderShadow() { return m_pSkinRenderShadow; }
    A3DSkinRenderBase* GetSkinRenderSilhouette() { return m_pSkinRenderSilhouette; }

    bool RebuildAudioSystem();
    CECAudioSystem* GetAudioSystem() { return m_pAudioSystem; }

	const char * GetVersionString() { return m_strAllVersion; }
	//	Get game version
	DWORD GetGameVersion();
	//	Get game build info
	DWORD GetGameBuild();
	//	Get active state
	bool IsActive() { return m_bActive; }
	//	Get initial data
	GAMEINIT& GetGameInit() { return m_GameInit; }
	//	Get logic tick time of current frame
	DWORD GetTickTime() { return m_dwTickTime; }
	//	Get real tick time of current frame
	DWORD GetRealTickTime() { return m_dwRealTickTime; }
	//	Set real tick time of current frame
	void SetRealTickTime(DWORD dwTime) { m_dwRealTickTime = dwTime; }
	//	Get average frame rate
	float GetAverageFrameRate() { return m_fAverFRate; }
	//	Time error with server
	int GetTimeError() { return m_iTimeError; }
	//  Time zone bias between UTC and local time in minutes
	int GetTimeZoneBias() { return m_iTimeZoneBias; }

    bool GetBrushDebug() { return false; }

	//	Discard current frame
	void DiscardFrame() { m_bDiscardFrame = true; }

	DWORD	GetMask()				{return m_crMask;}
	void	SetMask(DWORD crMask)	{m_crMask = crMask;}
	void	SetMaskAlpha(BYTE alpha){ m_crMask = (m_crMask&0X00FFFFFF) | (alpha<<24); }

// Animation Editor Function
public:
    void OnWindowPosChanged(WINDOWPOS FAR* lpwndpos);
private:
    int m_iWndWidth;
    int m_iWndHeight;
    bool m_bEngineOk;
    
protected:	//	Attributes

	A3DEngine*			m_pA3DEngine;
	A3DDevice*			m_pA3DDevice;
	A3DLight*			m_pDirLight;		//	Directional light
	A3DLight*			m_pDynamicLight;	//	Dynamic point light
	CECViewport*		m_pViewport;		//	Main viewport
	CECConfigs*			m_pConfigs;			//	Configs
	CECGameRun*			m_pGameRun;			//	Game run object
	A3DGFXExMan*		m_pA3DGFXExMan;		//	GFX object manager
	CECModelMan*		m_pECModelMan;		//	ECModel manager
	CECGFXCaster*		m_pGFXCaster;		//	GFX caster

	A3DSkinRenderBase*	m_pSkinRender1;		//	Skin render 1
	A3DSkinRenderBase*	m_pSkinRender2;		//	Skin render 2
    A3DSkinRenderBase*	m_pSkinRenderShadow;//	Skin render Shadow
    A3DSkinRenderBase*	m_pSkinRenderSilhouette;

    CECAudioSystem*     m_pAudioSystem;     //  Audio system

	CRITICAL_SECTION	m_csMsg;
	AList2<MSG, MSG&>	m_MsgList;

	GAMEINIT		m_GameInit;			//	Game init parameters
	bool			m_bActive;			//	true, Run game
	DWORD			m_dwTickTime;		//	Logic time of current tick
	DWORD			m_dwRealTickTime;	//	Real tick time
	bool			m_bDiscardFrame;	//	true, discard this frame
	float			m_fAverFRate;		//	Average frame rate
	int				m_iCurCursor;		//	Current cursor
	int				m_iTimeError;		//	Time error with server
	int				m_iTimeZoneBias;	//	Server time zone bias, in minutes

	A3DLight*		m_aLights[MAXNUM_LIGHT];
	DWORD			m_crMask;

	APtrArray<A3DCursor*>	m_aCursors;		//	Cursor objects
	APtrArray<A3DFont*>		m_aFonts;		//	Fonts array
	AString					m_strAllVersion;//  All version's string

protected:	//	Operations

	//	Initialize A3D engine
	bool InitA3DEngine();
	//	Release A3D engine
	void ReleaseA3DEngine();
	//	Load cursors
	bool LoadCursors();
	//	Release cursors
	void ReleaseCursors();
	//	Create fonts
	bool CreateFonts();
	//	Release fonts
	void ReleaseFonts();
};

///////////////////////////////////////////////////////////////////////////
//	
//	Inline functions
//	
///////////////////////////////////////////////////////////////////////////

extern CECGame* g_pGame;

