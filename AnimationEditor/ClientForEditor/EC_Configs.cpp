/*
 * FILE: EC_Configs.cpp
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Duyuxin, 2004/8/27
 *
 * HISTORY: 
 *
 * Copyright (c) 2004 Archosaur Studio, All Rights Reserved.
 */

#include "StdAfx.h"
#include "EC_Global.h"
#include "EC_Configs.h"
#include "EC_World.h"
#include "EC_Game.h"
#include "EC_GameRun.h"
#include "EC_SceneLoader.h"
#include "EC_SceneBlock.h"
#include "EL_CloudManager.h"
#include "EC_ManOrnament.h"
#include "EC_RTDebug.h"

#include "Animator/Animator.h"

///////////////////////////////////////////////////////////////////////////
//	
//	Define and Macro
//	
///////////////////////////////////////////////////////////////////////////

//	Configs data version
#define EC_CONFIG_VERSION	27

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
//	Implement CECConfigs
//	
///////////////////////////////////////////////////////////////////////////

CECConfigs::CECConfigs()
{
	//	Configs user cannot change ...
	m_strLoginDcf		= _EA("LoginUI.dcf");
	m_strInGameDcf		= _EA("GameUI.dcf");
	m_strLoadingDcf		= _EA("LoadingUI.dcf");

	m_iCodePage			= 936;
	m_fSceLoadRadius	= 500.0f;
	m_dwDefFogColor		= A3DCOLORRGB(70, 77, 91);
	m_fSevActiveRad		= 170.0f;
	m_fForestDetail		= 1.0f;
	m_fGrassLandDetail	= 1.0f;
	m_fTrnLODDist1		= 180.0f;
	m_fTrnLODDist2		= 320.0f;
	m_fMinPVRadius		= 5.0f;
	m_fCurPVRadius		= m_fSevActiveRad;

	//	DEBUG only settings ...
	m_bConsole			= false;
	m_iRTDebug			= 1;
	m_bShowNPCID		= false;
	m_fRunSpeed			= 0.0f;
	m_fWalkSpeed		= 0.0f;
	m_bTestDist			= false;
	m_bShowPos			= false;
	m_bShowForest		= true;
	m_bGameStat			= false;
	m_bShowID			= false;
	m_bSkipFrame		= false;
	m_bModelUpt			= true;
	m_bModelLightMap	= true;

	m_bAdjusting		= false;

	//	User settings ...
    {
		m_ss.nSight = 4;
		m_ss.nWaterEffect = 3;
		m_ss.nSceneDetail = 4;
		m_ss.bShadow = true;
		m_ss.bMipMapBias = false;
		m_ss.nSoundVol = 100;
        m_ss.iAutoSaveMinutes = 10;
		m_ss.iRndWidth = 800;
		m_ss.iRndHeight = 600;
		m_ss.iTexDetail = 0;
		m_ss.iSoundQuality = 2;
		m_ss.bFullScreen = false;
		m_ss.bWideScreen = false;
        m_ss.bShowWire = false;
		m_ss.bVSync = false;
		m_ss.iGamma = 100;
	}

	{
		m_vs.bShowHeadInfo		    = true;
		m_vs.nShowHeadInfoDist	    = 25;
		m_vs.cElsePlayerName		= HEAD_INFO_SHOW;
		m_vs.cPlayerTitle			= HEAD_INFO_SHOW;
		m_vs.cKingdom				= HEAD_INFO_SHOW;
		m_vs.cElsePlayerHP		    = HEAD_INFO_SHOW_HINT;
		m_vs.cElsePlayerMP		    = HEAD_INFO_HIDE;
		m_vs.cMatterName			= HEAD_INFO_SHOW;
		m_vs.cSelfName			    = HEAD_INFO_SHOW;
		m_vs.cTalkBubble			= HEAD_INFO_SHOW;
		m_vs.cNPCName				= HEAD_INFO_SHOW;
		m_vs.cPlayerShopName		= HEAD_INFO_SHOW;
		m_vs.cMonsterName			= HEAD_INFO_SHOW_HINT;
		m_vs.cMonsterHP			    = HEAD_INFO_SHOW_HINT;
		m_vs.cAggressiveMonster	    = HEAD_INFO_SHOW;
		m_vs.cPetName				= HEAD_INFO_SHOW_HINT;
		m_vs.cSelfHP				= HEAD_INFO_HIDE;
		m_vs.cSelfMP				= HEAD_INFO_HIDE;
		m_vs.cTalk				    = HEAD_INFO_SHOW;
		m_vs.bPlayerShowLimit		= false;
		m_vs.bMapNPC				= true;
		m_vs.bMapPlayer			    = true;
		m_vs.bMapMonster			= true;
		m_vs.nPlayerShowDistance	= 50;
		m_vs.nGFXLevel			    = 4;
		m_vs.fCameraMaxDist		    = 50;
		m_vs.bShowEquipCompare	    = true;

		m_vs.bPlayerStun			= false;
		m_vs.bPlayerEXP			    = false;
		memset(m_vs.comboSkill,0,sizeof(m_vs.comboSkill));
	}
    memset(&(m_ns.bCameraMask),0,sizeof(m_ns.bCameraMask));

	//DefaultUserSettings(&m_ss, &m_vs, &m_gs, &m_ns);

	memset(&m_bs, 0, sizeof (m_bs));
	for(int i = 0; i < EC_COMBOSKILL_NUM; i++ )
		m_vs.comboSkill[i].nIcon = 0;

	//	Test code ... 
	m_bShowForest		= true;
	m_bShowGrassLand	= true;
	memset(&m_ls,0,sizeof(m_ls));

	m_bNCfgReady= false;

	m_bEnableSkinLight	= false;
	m_cvSkinLightDiff	= A3DCOLORVALUE(0.0f, 0.0f, 0.0f, 1.0f);
	m_cvSkinLightSpec	= A3DCOLORVALUE(0.0f, 0.0f, 0.0f, 1.0f);

}

CECConfigs::~CECConfigs()
{
}

//	Initialize object
bool CECConfigs::Init(const char* szCfgFile, const char* szSSFile)
{
	//	Load configs ...
	if (!LoadConfigs(szCfgFile))
	{
		glb_ErrorOutput(ECERR_FAILEDTOCALL, _EA("CECConfigs::Init"), __LINE__);
		return false;
	}

	//	Load user settings ...
	if (!LoadSystemSettings(szSSFile))
	{
		glb_ErrorOutput(ECERR_FAILEDTOCALL, _EA("CECConfigs::Init"), __LINE__);
		return false;
	}

	// ensure the fullscreen resolution can be supported on this device
	if( m_ss.bFullScreen )
	{
		IDirect3D9 *	pD3D;
		pD3D = Direct3DCreate9(D3D_SDK_VERSION);
		if( pD3D == NULL )
		{
			glb_ErrorOutput(ECERR_FAILEDTOCALL, _EA("CECConfigs::Init"), __LINE__);
			return false;
		}

		A3DDevice::DISPLAYMODEARRAY displayModes;
		A3DDevice::EnumDisplayModes(pD3D, A3DFMT_X8R8G8B8, displayModes);
		pD3D->Release(); 

		int idMode;
		for(idMode=0; idMode<displayModes.GetSize(); idMode++)
		{
			if( (int)displayModes[idMode].Width == m_ss.iRndWidth && (int)displayModes[idMode].Height == m_ss.iRndHeight )
				break;
		}

		if( idMode == displayModes.GetSize() )
		{
			// now current device width and height are invalid on this device, engine will start chose best proper display mode
			a_LogOutput(1, _EA("Fullscreen resolution[%dx%d] is not supported. Engine will chose one proper resolution"),
				m_ss.iRndWidth, m_ss.iRndHeight);

			int nBestWidth = 0;
			int nBestHeight = 0;
			int nBestDiff = 0x7fffffff;
			for(idMode=0; idMode<displayModes.GetSize(); idMode++)
			{
				int nDiff = abs(int(displayModes[idMode].Width) - m_ss.iRndWidth) + 
					abs(int(displayModes[idMode].Height) - m_ss.iRndHeight);
				if( nDiff < nBestDiff  )
				{
					nBestWidth = displayModes[idMode].Width;
					nBestHeight = displayModes[idMode].Height;
					nBestDiff = nDiff;
				}
			}

			if( nBestWidth == 0 || nBestHeight == 0 )
			{
				a_LogOutput(1, _EA("Can't find proper display mode for this device."));
				return false;
			}
			else
			{
				a_LogOutput(1, _EA("Chose displaymode [%dx%d]"), nBestWidth, nBestHeight);
				m_ss.iRndWidth = nBestWidth;
				m_ss.iRndHeight = nBestHeight;
			}
		}
	}
	return true;
}

/*	Restore user settings to default value
void CECConfigs::DefaultUserSettings(EC_SYSTEM_SETTING *pss,
		EC_VIDEO_SETTING *pvs, EC_GAME_SETTING *pgs,EC_NO_DEF_USER_SETTING *pns)
{
	if( pss )
	{
		EC_SYSTEM_SETTING ss;
		ss = *pss;
		ss.nLevel = 0;
		ss.nSight = 0;
		ss.nWaterEffect = 0;
		ss.bAdvancedWater = false;
		ss.bShakeCam = true;
		ss.bSimpleTerrain = true;
		ss.nTreeDetail = 0;
		ss.nGrassDetail = 0;
		ss.nCloudDetail = 0;
		ss.nSceneDetail = 0;
		ss.bShadow = false;
		ss.bSimpleShadow = true;
		ss.bMipMapBias = false;
		ss.bFullGlow = false;
		ss.bSpaceWarp = false;
		ss.bSunFlare = false;
		ss.nUISkin = 1;
		ss.nMusicVol = 80;
		ss.nSoundVol = 100;
		ss.nEnvSoundVol = 100;
		ss.nBackAnimLevel = 0;
		ss.iRndWidth = 800;
		ss.iRndHeight = 600;
		ss.iTexDetail = 2;
		ss.iSoundQuality = 2;
		ss.bFullScreen = true;
		ss.bWideScreen = false;
		ss.bVSync = true;
		ss.iGamma = 100;
		ss.nPreviousTheme = 1;	// 默认皮肤, 需要修改两处
		ss.nRadarDetectActive = 0;
		ss.iShowDamageType = SDT_SHOW_ALL;
		*pss = ss;
	}

	if( pvs )
	{
		EC_VIDEO_SETTING vs;
		vs = *pvs;

		vs.bShowHeadInfo		= true;
		vs.nShowHeadInfoDist	= 25;
		vs.cElsePlayerName		= HEAD_INFO_SHOW;
		vs.cPlayerTitle			= HEAD_INFO_SHOW;
		vs.cKingdom				= HEAD_INFO_SHOW;
		vs.cElsePlayerHP		= HEAD_INFO_SHOW_HINT;
		vs.cElsePlayerMP		= HEAD_INFO_HIDE;
		vs.cMatterName			= HEAD_INFO_SHOW;
		vs.cSelfName			= HEAD_INFO_SHOW;
		vs.cTalkBubble			= HEAD_INFO_SHOW;
		vs.cNPCName				= HEAD_INFO_SHOW;
		vs.cPlayerShopName		= HEAD_INFO_SHOW;
		vs.cMonsterName			= HEAD_INFO_SHOW_HINT;
		vs.cMonsterHP			= HEAD_INFO_SHOW_HINT;
		vs.cAggressiveMonster	= HEAD_INFO_SHOW;
		vs.cPetName				= HEAD_INFO_SHOW_HINT;
		vs.cSelfHP				= HEAD_INFO_HIDE;
		vs.cSelfMP				= HEAD_INFO_HIDE;
		vs.cTalk				= HEAD_INFO_SHOW;
		vs.bPlayerShowLimit		= false;
		vs.bMapNPC				= true;
		vs.bMapPlayer			= true;
		vs.bMapMonster			= true;
		vs.nPlayerShowDistance	= 50;
		vs.nGFXLevel			= 4;
		vs.fCameraMaxDist		= 50;
		vs.bShowEquipCompare	= true;

		vs.bPlayerStun			= false;
		vs.bPlayerEXP			= false;
		memset(vs.comboSkill,0,sizeof(vs.comboSkill));
		
		*pvs = vs;
	}

	if( pgs ) 
	{
		EC_GAME_SETTING gs;
		gs = *pgs;
		gs.bCloseNewBeeHelp = false;
		gs.bNoTeamRequest = false;
		gs.bNoTradeRequest = false;
		gs.bTurnaround = false;
		gs.bReverseWheel = false;
		gs.bAutoReply = false;
		gs.szAutoReply[0] = '\0';
		gs.fCamTurnSpeed = 10.0f;
		gs.fCamZoomSpeed = 1.0f;
		gs.nFontSize = 1;
		gs.pkRules[0].cPVPMask		= GP_PVPMASK_RED;
		gs.pkRules[0].cTabSelRule	= TAB_SEL_NPC_FIRST;
		gs.pkRules[1].cPVPMask		= ~(GP_PVPMASK_ARMY|GP_PVPMASK_KINGDOM);
		gs.pkRules[1].cTabSelRule	= TAB_SEL_PLAYER_FIRST;
		gs.cCurPKRule				= 0;
		gs.nPrintScreenType = 0;
		
		gs.bAlwaysShowChat = false; //始终显示聊天界面
		gs.bRepChatLink = true;	//相应聊天链接
		gs.nChatAlpha = 0;		//聊天透明度
		gs.bWorldChatInform = true;	//世界喊话道具提示

		bool a_bChannel[EC_USERCHANNEL_NUM][GP_CHAT_MAX] =
		{	// 本地  呐喊   组队   帮派   密语   伤害   战斗   交易   系统   广播   其它   家族
			{ true,  false, true,  true,  true,  false, false, false, false, false, false, true  }, // 普通频道
			{ false, false, true,  false, false, false, false, false, false, false, false, false }, // 队伍频道
			{ false, false, false, true,  false, false, false, false, false, false, false, true  }, // 公会频道
			{ false, false, false, false, true,  false, false, false, false, false, false, false }, // 密语频道
			{ true,  false, true,  false, false, true,  false, false, true,  false, false, false }, // 战斗频道
			{ false, true,  false, false, false, false, false, false, false, false, false, false }, // 世界频道
			{ false, true,  false, false, false, false, false, false, true,  true,  true,  false }, // 自定义 频道
		};
		memcpy(gs.bChannel, a_bChannel, sizeof(bool) * GP_CHAT_MAX * EC_USERCHANNEL_NUM);
		*pgs = gs;
	}

	if (pns)
	{
		EC_NO_DEF_USER_SETTING ns;
		memset(&(ns.bCameraMask),0,sizeof(ns.bCameraMask));
		*pns = ns;
	}
}*/

//	Load configs from file
bool CECConfigs::LoadConfigs(const char* szFile)
{
	AIniFile IniFile;

	if (!IniFile.Open(szFile))
	{
		a_LogOutput(1, _EA("CECConfigs::LoadConfigs, Failed to open file %s"), szFile);
		return false;
	}

	//	PathFile section
	AString strSect = _EA("PathFile");

	m_strLoginDcf	= IniFile.GetValueAsString(strSect, _EA("login_ui_dcf"), m_strLoginDcf);
	m_strInGameDcf	= IniFile.GetValueAsString(strSect, _EA("ingame_ui_dcf"), m_strInGameDcf);
	m_strLoadingDcf = IniFile.GetValueAsString(strSect, _EA("loading_ui_dcf"), m_strLoadingDcf);

	//	Settings section
	strSect = _EA("Settings");

	m_iCodePage	= IniFile.GetValueAsInt(strSect, _EA("code_page"), m_iCodePage);
	m_bConsole	= IniFile.GetValueAsInt(strSect, _EA("console"), m_bConsole ? 1 : 0) ? true : false;
	m_iRTDebug	= IniFile.GetValueAsInt(strSect, _EA("runtime_debug"), m_iRTDebug);
	
	//	Default environment value
	strSect = _EA("DefEnv");

	m_fDefFogStart		= IniFile.GetValueAsFloat(strSect, _EA("fog_start"), 250.0f);
	m_fDefFogEnd		= IniFile.GetValueAsFloat(strSect, _EA("fog_end"), 600.0f);
	m_fDefFogDensity	= IniFile.GetValueAsFloat(strSect, _EA("fog_density"), 1.0f);
	m_strDefSkyFile0	= IniFile.GetValueAsString(strSect, _EA("sky_image01"), _EA("5\\Roof.bmp"));
	m_strDefSkyFile1	= IniFile.GetValueAsString(strSect, _EA("sky_image02"), _EA("5\\01.bmp"));
	m_strDefSkyFile2	= IniFile.GetValueAsString(strSect, _EA("sky_image03"), _EA("5\\02.bmp"));

	int col[3];
	IniFile.GetValueAsIntArray(strSect, _EA("fog_color"), 3, col);
	m_dwDefFogColor = A3DCOLORRGB(col[0], col[1], col[2]);

	IniFile.GetValueAsIntArray(strSect, _EA("ambient"), 3, col);
	m_dwDefAmbient = A3DCOLORRGB(col[0], col[1], col[2]);

	IniFile.GetValueAsIntArray(strSect, _EA("light_diffuse"), 3, col);
	m_dwDefLightDiff = A3DCOLORRGB(col[0], col[1], col[2]);

	IniFile.GetValueAsIntArray(strSect, _EA("light_specular"), 3, col);
	m_dwDefLightSpec = A3DCOLORRGB(col[0], col[1], col[2]);

	IniFile.GetValueAsFloatArray(strSect, _EA("light_dir"), 3, m_vDefLightDir.m);
	m_vDefLightDir.Normalize();

	IniFile.Close();

	return true;
}

//	Load system settings from local disk file
bool CECConfigs::LoadSystemSettings(const char* szFile)
{
	AIniFile IniFile;

	if (!IniFile.Open(szFile))
	{
		a_LogOutput(1, _EA("CECConfigs::LoadSystemSettings, Failed to open file %s"), szFile);
		a_LogOutput(1, _EA("we use default settings to let users go in..."));
		return true;
	}

	//	Video section
	AString strSect = _EA("Video");

	m_ss.nSight			= IniFile.GetValueAsInt(strSect, _EA("Sight"), 4);
	m_ss.nWaterEffect	= IniFile.GetValueAsInt(strSect, _EA("WaterEffect"), 3);
	m_ss.nSceneDetail	= IniFile.GetValueAsInt(strSect, _EA("SceneDetail"), 4);
	m_ss.bShadow		= IniFile.GetValueAsInt(strSect, _EA("Shadow"), 0) ? true : false;
	m_ss.bMipMapBias	= IniFile.GetValueAsInt(strSect, _EA("MipMapBias"), 0) ? true : false;

	m_ss.iRndWidth		= IniFile.GetValueAsInt(strSect, _EA("RenderWid"), 800);
	m_ss.iRndHeight		= IniFile.GetValueAsInt(strSect, _EA("RenderHei"), 600);
	m_ss.iTexDetail		= IniFile.GetValueAsInt(strSect, _EA("TexDetail"), 0);
	m_ss.iSoundQuality  = IniFile.GetValueAsInt(strSect, _EA("SoundQuality"), 0);
	m_ss.bFullScreen	= false;//IniFile.GetValueAsInt(strSect, _EA("FullScreen"), 1) ? true : false;
	m_ss.bWideScreen	= false;//IniFile.GetValueAsInt(strSect, _EA("WideScreen"), 0) ? true : false;
    m_ss.bShowWire      = false;
	m_ss.bVSync			= IniFile.GetValueAsInt(strSect, _EA("VerticalSync"), 1) ? true : false;
	m_ss.iGamma			= IniFile.GetValueAsInt(strSect, _EA("GammaNew"), 100);

	//	Audio section
	strSect = _EA("Audio");
	m_ss.nSoundVol = IniFile.GetValueAsInt(strSect, _EA("Sound"), 100);

    strSect = _EA("RecentFiles");
    m_lRecentFiles.clear();
    int iFileNum = IniFile.GetValueAsInt(strSect, _EA("FileNum"), 0);
    if (iFileNum > ANM_RECENT_FILES_MAXNUM)
    {
        iFileNum = ANM_RECENT_FILES_MAXNUM;
    }
    if (iFileNum > 0)
    {
        AString strName; 
        for (int i=iFileNum-1; i>=0; --i)
        {
            strName.Format("RecentFile%d", i);
            std::string sFileName = IniFile.GetValueAsString(strSect, strName);
            PushRecentFileName(sFileName);
        }
    }
    m_ss.iAutoSaveMinutes = IniFile.GetValueAsInt(strSect, _EA("AutoSaveMinutes"), 10);
		
	IniFile.Close();

	if( !m_ss.bFullScreen )
	{
		// adjust window to fit current screen
		int nMaxX = ::GetSystemMetrics(SM_CXSCREEN);
		int nMaxY = ::GetSystemMetrics(SM_CYSCREEN);
		if( m_ss.iRndWidth > nMaxX )
			m_ss.iRndWidth = nMaxX;
		if( m_ss.iRndHeight > nMaxY )
			m_ss.iRndHeight = nMaxY;
	}

	ConvertSightSetting(m_ss.nSight);

	m_fForestDetail = m_ss.nSceneDetail * 0.25f;
	m_fGrassLandDetail = m_ss.nSceneDetail * 0.25f;

	return true;
}

float CECConfigs::GetSceneLoadRadius()
{ 
	if (g_pGame->GetGameRun()->GetGameState() == CECGameRun::GS_GAME)
		return m_fSceLoadRadius; 
	else
		return 500.0f;
}

void CECConfigs::SetPlayerVisRadius(float fRadius)
{ 
	m_fCurPVRadius = fRadius; 
	a_Clamp(m_fCurPVRadius, m_fMinPVRadius, m_fSevActiveRad);
}

//	Save system settings to local disk
bool CECConfigs::SaveSystemSettings()
{
	AIniFile IniFile;

	//	Info section
	AString strSect = _EA("Info");

	//	now write the video card information here
	char szInfo[1024];
	D3DADAPTER_IDENTIFIER9 idAdapter;
	g_pGame->GetA3DEngine()->GetD3D()->GetAdapterIdentifier(D3DADAPTER_DEFAULT, 0, &idAdapter);

	IniFile.WriteStringValue(strSect, _EA("card"), idAdapter.Description);
	IniFile.WriteStringValue(strSect, _EA("driver"), idAdapter.Driver);

	WORD Product = HIWORD(idAdapter.DriverVersion.HighPart);
	WORD Version = LOWORD(idAdapter.DriverVersion.HighPart);
	WORD SubVersion = HIWORD(idAdapter.DriverVersion.LowPart);
	WORD Build = LOWORD(idAdapter.DriverVersion.LowPart);
	sprintf(szInfo, _EA("%d.%d.%04d.%04d"), Product, Version, SubVersion, Build);
	IniFile.WriteStringValue(strSect, _EA("version"), szInfo);

	sprintf(szInfo, _EA("%08x"), idAdapter.VendorId);
	IniFile.WriteStringValue(strSect, _EA("vendor"), szInfo);
	sprintf(szInfo, _EA("%08x"), idAdapter.DeviceId);
	IniFile.WriteStringValue(strSect, _EA("deviceid"), szInfo);
	sprintf(szInfo, _EA("%08x"), idAdapter.SubSysId);
	IniFile.WriteStringValue(strSect, _EA("subsysid"), szInfo);
	sprintf(szInfo, _EA("{%08X-%04X-%04X-%02X%02X-%02X%02X%02X%02X%02X%02X}"), idAdapter.DeviceIdentifier.Data1, idAdapter.DeviceIdentifier.Data2, idAdapter.DeviceIdentifier.Data3, 
		idAdapter.DeviceIdentifier.Data4[0], idAdapter.DeviceIdentifier.Data4[1], idAdapter.DeviceIdentifier.Data4[2], idAdapter.DeviceIdentifier.Data4[3],
		idAdapter.DeviceIdentifier.Data4[4], idAdapter.DeviceIdentifier.Data4[5], idAdapter.DeviceIdentifier.Data4[6], idAdapter.DeviceIdentifier.Data4[7]);
	IniFile.WriteStringValue(strSect, _EA("guid"), szInfo);
	
	EC_SYSTEM_SETTING ss;
	ss = m_bSimplified ? m_ssOrigin:m_ss;

	//	Video section
	strSect = _EA("Video");

	IniFile.WriteIntValue(strSect, _EA("Sight"), ss.nSight);
	IniFile.WriteIntValue(strSect, _EA("WaterEffect"), ss.nWaterEffect);
	IniFile.WriteIntValue(strSect, _EA("SceneDetail"), ss.nSceneDetail);
	IniFile.WriteIntValue(strSect, _EA("Shadow"), ss.bShadow);
	IniFile.WriteIntValue(strSect, _EA("MipMapBias"), ss.bMipMapBias);

	IniFile.WriteIntValue(strSect, _EA("RenderWid"), ss.iRndWidth);
	IniFile.WriteIntValue(strSect, _EA("RenderHei"), ss.iRndHeight);
	IniFile.WriteIntValue(strSect, _EA("TexDetail"), ss.iTexDetail);
	IniFile.WriteIntValue(strSect, _EA("SoundQuality"), ss.iSoundQuality);
	//IniFile.WriteIntValue(strSect, _EA("FullScreen"), ss.bFullScreen);
	//IniFile.WriteIntValue(strSect, _EA("WideScreen"), true);
	IniFile.WriteIntValue(strSect, _EA("VerticalSync"), ss.bVSync);
	IniFile.WriteIntValue(strSect, _EA("GammaNew"), ss.iGamma);

	//	Audio section
	strSect = _EA("Audio");
	IniFile.WriteIntValue(strSect, _EA("Sound"), ss.nSoundVol);

    strSect = _EA("RecentFiles");
    int iFileNum = m_lRecentFiles.size();
    IniFile.WriteIntValue(strSect, _EA("FileNum"), iFileNum);
    AString strName;
    std::list<std::string>::iterator it = m_lRecentFiles.begin();
    for (int i=0; i<iFileNum,it!=m_lRecentFiles.end(); ++i,++it)
    {
        strName.Format("RecentFile%d", i);
        IniFile.WriteStringValue(strSect, strName, it->c_str());
    }
    IniFile.WriteIntValue(strSect, _EA("AutoSaveMinutes"), ss.iAutoSaveMinutes);

	IniFile.Save(_EA("RoleSettings\\AnimatorSettings.ini"));
	IniFile.Close();

	return true;
}

//	Save user configs (except system settings) to specified buffer
bool CECConfigs::SaveUserConfigData(void* pDataBuf, int* piSize)
{
	int iTotalSize=0;
	BYTE* pData = (BYTE*)pDataBuf;

	//	Version
	iTotalSize += sizeof (DWORD);
	if (pDataBuf)
	{
		*((DWORD*)pData) = EC_CONFIG_VERSION;
		pData += sizeof (DWORD);
	}

	iTotalSize += sizeof (EC_VIDEO_SETTING);
	if (pDataBuf)
	{
		*((EC_VIDEO_SETTING*)pData) = m_bSimplified ? m_vsOrigin : m_vs;
		pData += sizeof (EC_VIDEO_SETTING);
	}

	/*iTotalSize += sizeof (EC_GAME_SETTING);
	if (pDataBuf)
	{
		*((EC_GAME_SETTING*)pData) = m_gs;
		pData += sizeof (EC_GAME_SETTING);
	}*/

	iTotalSize += sizeof (EC_BLACKLIST_SETTING);
	if (pDataBuf)
	{
		*((EC_BLACKLIST_SETTING*)pData) = m_bs;
		pData += sizeof (EC_BLACKLIST_SETTING);
	}

	if (piSize)
	{
		*piSize = iTotalSize;
	}

	return true;
}

/*	Set default user config data
void CECConfigs::DefaultUserConfigData()
{
	DefaultUserSettings(NULL, &m_vs, &m_gs,NULL);
	memset(&m_bs, 0, sizeof (m_bs));

	//	This fix a bug in some version
	m_gs.fCamTurnSpeed = 10.0f;
	m_gs.fCamZoomSpeed = 1.0f;
}*/

//	Load shortcut configs (except system settings) from specified buffer
bool CECConfigs::LoadUserConfigData(const void* pDataBuf, int iDataSize)
{
	try
	{
		CECDataReader dr((void*)pDataBuf, iDataSize);

		//	Version number
		DWORD dwVer = dr.Read_DWORD();

		//	Note: Return directly means reset all settings to default value !!!
		//		A better method should be used when version updated.
		if (dwVer < EC_CONFIG_VERSION)
		{
			//DefaultUserConfigData();
			goto End;
		}

		if (dwVer > EC_CONFIG_VERSION)
		{
			ASSERT(0);
			throw CECException(CECException::TYPE_DATAERR);
		}

		m_vs = *(EC_VIDEO_SETTING*)dr.Read_Data(sizeof (EC_VIDEO_SETTING));

		for(int i = 0; i < EC_COMBOSKILL_NUM; i++ )
			if( m_vs.comboSkill[i].nIcon > EC_COMBOSKILL_ICONNUM )
			{
				for(int j = 0; j < EC_COMBOSKILL_NUM; j++ )
					m_vs.comboSkill[j].nIcon = 0;
				break;
			}

		//m_gs = *(EC_GAME_SETTING*)dr.Read_Data(sizeof (EC_GAME_SETTING));

	//	if (dwVer < 2)
		{
			//	This fix a bug in some version
			//m_gs.fCamTurnSpeed = 10.0f;
			//m_gs.fCamZoomSpeed = 1.0f;
		}

		m_bs = *(EC_BLACKLIST_SETTING*)dr.Read_Data(sizeof (EC_BLACKLIST_SETTING));
	}
	catch (CECException& e)
	{
		ASSERT(0);
		a_LogOutput(1, _EA("CECConfigs::LoadUserConfigData, data read error (%d)"), e.GetType());
		//DefaultUserConfigData();
	}

End:
	m_fCurPVRadius = CalcPlayerVisRadius(m_vs.nPlayerShowDistance);
	g_pGame->GetA3DGFXExMan()->SetPriority(m_vs.nGFXLevel);
	
	//	Verify combo-skill ids
	VerifyComboSkills();

	return true;
}

//	Save user settings( without default user) to specified buffer.
bool CECConfigs::SaveNoDefUserData(void* pDataBuf, int* piSize)
{
	int iTotalSize=0;
	BYTE* pData = (BYTE*)pDataBuf;

	//	Version
	iTotalSize += sizeof (DWORD);
	if (pDataBuf)
	{
		*((DWORD*)pData) = EC_CONFIG_VERSION;
		pData += sizeof (DWORD);
	}

	iTotalSize += sizeof (EC_NO_DEF_USER_SETTING);
	if (pDataBuf)
	{
		*((EC_NO_DEF_USER_SETTING*)pData) = m_ns;
		pData += sizeof (EC_NO_DEF_USER_SETTING);
	}

	if (piSize)
		*piSize = iTotalSize;

	return true;
}

void CECConfigs::DefaultNoDefUserConfigData()
{
	//DefaultUserSettings(NULL, NULL, NULL, &m_ns);
}


//	Load user settings( without default user) from specified buffer.
bool CECConfigs::LoadNoDefUserData(const void* pDataBuf, int iDataSize)
{
	SetNCfgReady(true);
	if (!pDataBuf || !iDataSize)
	{
		goto Def;
	}
	try
	{
		CECDataReader dr((void*)pDataBuf, iDataSize);

		//	Version number
		DWORD dwVer = dr.Read_DWORD();

		//	Note: Return directly means reset all settings to default value !!!
		//		A better method should be used when version updated.
		if (dwVer < EC_CONFIG_VERSION)
		{
			goto Def;
		}

		if (dwVer > EC_CONFIG_VERSION)
		{
			ASSERT(0);
			throw CECException(CECException::TYPE_DATAERR);
		}
        
		m_ns = *(EC_NO_DEF_USER_SETTING*)dr.Read_Data(sizeof(EC_NO_DEF_USER_SETTING));
	}
	catch (CECException& e)
	{
		ASSERT(0);
		a_LogOutput(1, _EA("CECConfigs::LoadNoDefUserData, data read error (%d)"), e.GetType());
		DefaultNoDefUserConfigData();
	}
	return true;
	
Def:
	DefaultNoDefUserConfigData();
	return true;
}

void CECConfigs::SetSceneLoadRadius(float fRadius)
{
	m_fSceLoadRadius = fRadius;
	a_ClampFloor(m_fSceLoadRadius, m_fSevActiveRad);
	g_pGame->GetGameRun()->GetCurWorld()->SetViewRadius(fRadius);
}

void CECConfigs::SetForestDetail(float fDetail)
{
	m_fForestDetail = fDetail;
	a_Clamp(m_fForestDetail, 0.0f, 1.0f);
	//g_pGame->GetGameRun()->GetCurWorld()->GetForest()->SetLODLevel(m_fForestDetail);
}

void CECConfigs::SetGrassLandDetail(float fDetail)
{
	m_fGrassLandDetail = fDetail;
	a_Clamp(m_fGrassLandDetail, 0.0f, 1.0f);
	g_pGame->GetGameRun()->GetCurWorld()->GetGrassLand()->SetLODLevel(1.0f/*m_fGrassLandDetail*/);
}

extern volatile bool g_bMultiThreadRenderMode;
extern void SwitchRenderThreadMode(bool bMultiThread);

void CECConfigs::SetSystemSettings(const EC_SYSTEM_SETTING& ss, bool bCallFromWndProc, bool bModifySimplifiedFlag)
{
	if (bModifySimplifiedFlag && !bCallFromWndProc)
	{
		m_bSimplified = false;
	}

	CECWorld* pWorld = g_pGame->GetGameRun()->GetCurWorld();

	bool bDisplayModeChanged = 	
		m_ss.iRndHeight		!= ss.iRndHeight || 
		m_ss.iRndWidth		!= ss.iRndWidth || 
		m_ss.bFullScreen	!= ss.bFullScreen || 
		//m_ss.bWideScreen    != ss.bWideScreen ||
		m_ss.bVSync			!= ss.bVSync;

	m_bAdjusting = true;

	if (bDisplayModeChanged)
	{
		DWORD dwExStyle = 0;
		DWORD dwStyles = 0;
		int x, y, w, h;
		A3DFORMAT fmtTarget = A3DFMT_UNKNOWN;

		HWND hDevWnd = g_pGame->GetA3DDevice()->GetDeviceWnd();
		const A3DDevice::DISPLAY_MODE& desktopMode = g_pGame->GetA3DDevice()->GetDesktopDisplayMode();

		if( ss.bFullScreen )
		{
			dwStyles = WS_POPUP;
			dwExStyle = WS_EX_TOPMOST;

			x = 0;
			y = 0;
			w = ss.iRndWidth;
			h = ss.iRndHeight;

			if( g_pGame->GetA3DDevice()->GetTarget32() != A3DFMT_UNKNOWN )
				fmtTarget = g_pGame->GetA3DDevice()->GetTarget32();
			else
				fmtTarget = g_pGame->GetA3DDevice()->GetTarget16();
		}
		else
		{
			dwStyles |= WS_POPUP | WS_CAPTION | WS_MINIMIZEBOX | WS_SYSMENU | WS_THICKFRAME;
			
			RECT rcWnd = {0, 0, ss.iRndWidth, ss.iRndHeight};
			AdjustWindowRectEx(&rcWnd, dwStyles, FALSE, dwExStyle);

			w = rcWnd.right - rcWnd.left;
			h = rcWnd.bottom - rcWnd.top;
			x = (desktopMode.nWidth - w) / 2;
			y = (desktopMode.nHeight - h) / 2;

			if( desktopMode.nBitsPerPixel == 32 && g_pGame->GetA3DDevice()->GetTarget32() != A3DFMT_UNKNOWN )
				fmtTarget = g_pGame->GetA3DDevice()->GetTarget32();
			else
				fmtTarget = g_pGame->GetA3DDevice()->GetTarget16();
		}

		SetWindowLong(hDevWnd, GWL_STYLE, dwStyles);
		SetWindowLong(hDevWnd, GWL_EXSTYLE, dwExStyle);

		if( !ss.bFullScreen )
		{
			if( m_ss.bFullScreen )
			{
				// switch from fullscreen to window mode, we need center the window; and redraw all windows
				SetWindowPos(hDevWnd, HWND_NOTOPMOST, x, y, w, h, SWP_SHOWWINDOW);
			}
			else
			{
				SetWindowPos(hDevWnd, HWND_NOTOPMOST, x, y, w, h, SWP_SHOWWINDOW | SWP_NOMOVE);

				if( !bCallFromWndProc )
					InvalidateRect(NULL, NULL, TRUE);
			}
		}
		else
		{
			SetWindowPos(hDevWnd, HWND_TOPMOST, x, y, w, h, SWP_SHOWWINDOW);
		}

		// we must suspend the loader thread before we can do reset of the device, otherwise we may fail when reset the devcie
		// because unmanaged object are still being added into the world.
		SuspendLoadThread();
		g_bMultiThreadRenderMode = false;
		g_pGame->GetA3DEngine()->SetDisplayMode(ss.iRndWidth, ss.iRndHeight, fmtTarget, !ss.bFullScreen, ss.bVSync, SDM_WIDTH | SDM_HEIGHT | SDM_FORMAT | SDM_WINDOW | SDM_VSYNC);
		StartLoaderThread();

		CECViewport* pViewport = g_pGame->GetViewport();
		pViewport->Move(0, 0, ss.iRndWidth, ss.iRndHeight, false);
	}

	//	Apply view radius
	if (m_ss.nSight != ss.nSight)
	{
		//	Apply sight radius
		ConvertSightSetting(ss.nSight);
		SetSceneLoadRadius(m_fSceLoadRadius);

		A3DTerrain2* pTerrain = pWorld->GetTerrain();
		pTerrain->SetLODDist(m_fTrnLODDist1, m_fTrnLODDist2);

		CECSceneBlock::SetResLoadDists(ss.nSight + 1);
	}

	if( m_ss.nSceneDetail != ss.nSceneDetail )
	{
		//	Apply forest detail
		SetForestDetail(ss.nSceneDetail * 0.25f);
	}

	if( m_ss.nSceneDetail != ss.nSceneDetail )
	{
		//	Apply grass land detail
		SetGrassLandDetail(ss.nSceneDetail * 0.25f);
	}

	if( m_ss.nSceneDetail != ss.nSceneDetail )
	{
		if( g_pGame->GetGameRun()->GetCurWorld()->GetCloudManager() )
			g_pGame->GetGameRun()->GetCurWorld()->GetCloudManager()->SetCloudLevel(ss.nSceneDetail * 25 / 10);
	}

	if( m_ss.bMipMapBias != ss.bMipMapBias || bDisplayModeChanged) 
	{
		float v = 0.0f;
		for(int i=0; i<g_pGame->GetA3DDevice()->GetMaxSimultaneousTextures(); i++)
		{
			//g_pGame->GetA3DDevice()->SetDeviceTextureStageState(i, D3DTSS_MIPMAPLODBIAS, *(DWORD *)&v);
			g_pGame->GetA3DDevice()->SetSamplerState(i, D3DSAMP_MIPMAPLODBIAS, *(DWORD *)&v);
		}
	}

	if( m_ss.bVSync != ss.bVSync )
	{
		// after changing the present intervals for fullscreen mode, the gamma level will be restored to defaults (on ATI cards)
		// and the same gamme level will not be accepted by system. so here we first change it to a different values and then
		// set it back.
		g_pGame->GetA3DDevice()->SetGammaLevel(100);
	}
	
	g_pGame->GetA3DDevice()->SetGammaLevel(ss.iGamma);

	// now we can change the texture quality at runtime.
	if( m_ss.iTexDetail != ss.iTexDetail )
	{
		g_pA3DConfig->SetTextureQuality((A3DTEXTURE_QUALITY)ss.iTexDetail);
		g_pGame->GetA3DEngine()->GetA3DTextureMan()->ReloadAllTextures(true);
	}

	// now we can change the sound quality at runtime.
	if( m_ss.iSoundQuality != ss.iSoundQuality )
	{
		g_pGame->GetA3DEngine()->GetAMEngine()->GetAMConfig()->SetSoundQuality((AMSOUND_QUALITY) ss.iSoundQuality);
		g_pGame->GetA3DEngine()->GetAMEngine()->GetAMSoundEngine()->GetAMSoundBufferMan()->ReloadAll();
	}
	
	if (m_ss.nSoundVol != ss.nSoundVol)
	{
		g_pGame->GetA3DEngine()->GetAMSoundEngine()->SetVolume(ss.nSoundVol);
	}
	
	m_ss = ss;

	m_bAdjusting = false;
}

void CECConfigs::SetVideoSettings(const EC_VIDEO_SETTING& vs)
{
	m_bSimplified = false;

	m_vs = vs;
	m_fCurPVRadius = CalcPlayerVisRadius(m_vs.nPlayerShowDistance);
	g_pGame->GetA3DGFXExMan()->SetPriority(m_vs.nGFXLevel);
	//g_pGame->GetGameRun()->GetHostPlayer()->GetCameraCtrl()->SetCurMaxDist(m_vs.fCameraMaxDist);
}

/*void CECConfigs::SetGameSettings(const EC_GAME_SETTING& gs)
{
	m_gs = gs;
}*/

void CECConfigs::SetBlackListSettings(const EC_BLACKLIST_SETTING& bs)
{
	m_bs = bs;
}

void CECConfigs::SetSimplifiedSettings(bool bSimplified)
{
	if( bSimplified == m_bSimplified )
		return;
	
	if( !bSimplified )
	{
		SetSystemSettings(m_ssOrigin);
		SetVideoSettings(m_vsOrigin);
	}
	else
	{
		m_ssOrigin = m_ss;
		EC_SYSTEM_SETTING ss;
		ss = m_ss;
		ss.nSight = 4;
		ss.nWaterEffect = 3;
		ss.nSceneDetail = 4;
		ss.bShadow = true;
		ss.bMipMapBias = false;
		SetSystemSettings(ss);
		m_vsOrigin = m_vs;
		EC_VIDEO_SETTING vs;
		vs = m_vs;
		vs.cKingdom		= HEAD_INFO_HIDE;
		vs.cPlayerTitle = HEAD_INFO_HIDE;
		SetVideoSettings(vs);
	}

	m_bSimplified = bSimplified;
}

void CECConfigs::SetNoDefUserSettings(const EC_NO_DEF_USER_SETTING& ns)
{
	m_ns = ns;
}

//	Convert sight radius setting
void CECConfigs::ConvertSightSetting(int iSight)
{
	//	Apply sight radius
	switch (iSight)
	{
	case 0:	
	case 1:	
	case 2:	
	case 3:	

		m_fSceLoadRadius = m_fSevActiveRad;
		m_fTrnLODDist1 = 40.0f;
		m_fTrnLODDist2 = 80.0f;
		break;

	case 4:	
		
		m_fSceLoadRadius = 250.0f;
		m_fTrnLODDist1 = 120.0f;
		m_fTrnLODDist2 = 240.0f;
		break;

		/*
	case 2:
	case 3:
	case 4:
		
		m_fSceLoadRadius = 420.0f;
		m_fTrnLODDist1 = 180.0f;
		m_fTrnLODDist2 = 320.0f;
		break;
		*/

	default:		
		ASSERT(0);
		return;
	}
}

//	Verify combo-skill ids, this function will replace junior skills with
//	senior skills if condition met.
void CECConfigs::VerifyComboSkills()
{
    /*
	CECHostPlayer* pHost = g_pGame->GetGameRun()->GetHostPlayer();

	for (int j=0; j < EC_COMBOSKILL_NUM; j++)
	{
		if (!m_vs.comboSkill[j].nIcon)
			continue;

		for (int n=0; n < EC_COMBOSKILL_LEN; n++)
		{
			int idSkill = m_vs.comboSkill[j].idSkill[n];
			if (idSkill > 0)
			{
				CECSkill* pSkill = pHost->GetSkill(idSkill, true);
				m_vs.comboSkill[j].idSkill[n] = pSkill ? pSkill->GetSkillID() : 0;
			}
			else if( idSkill != -1 && idSkill != -2 )
				m_vs.comboSkill[j].idSkill[n] = 0;
		}
	}*/
}

void CECConfigs::SetLocalSettings(const EC_LOCAL_SETTING& ls)
{
	m_ls = ls;
}

bool CECConfigs::IsRenderShadow()
{
	if (m_ss.bShadow)
	{
		return true;
	}
	return false;
}

void CECConfigs::SetModelLightMap(bool bTrue)
{
	if (bTrue == m_bModelLightMap)
		return;

	m_bModelLightMap = bTrue;

	CECOrnamentMan* pOrnamentMan = g_pGame->GetGameRun()->GetCurWorld()->GetOrnamentMan();
	if (NULL != pOrnamentMan)
	{
		if (bTrue)
			pOrnamentMan->ReloadLightMap();
		else
			pOrnamentMan->ReleaseLightMap();
	}
}

void CECConfigs::PushRecentFileName(std::string strFileName)
{
    m_lRecentFiles.remove(strFileName);
    m_lRecentFiles.push_front(strFileName);
    while (m_lRecentFiles.size() > ANM_RECENT_FILES_MAXNUM)
    {
        m_lRecentFiles.pop_back();
    }
}