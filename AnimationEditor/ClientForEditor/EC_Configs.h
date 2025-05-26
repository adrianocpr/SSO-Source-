/*
 * FILE: EC_Configs.h
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

#include "AString.h"
#include "A3DVector.h"
//#include "EC_NetDef.h"
#include <A3DTypes.h>
#include <list>
#include <string>

///////////////////////////////////////////////////////////////////////////
//	
//	Define and Macro
//	
///////////////////////////////////////////////////////////////////////////

#define EC_AUTOREPLY_LEN		64
#define EC_BLACKLIST_LEN		20
#define EC_COMBOSKILL_NUM		7
#define EC_COMBOSKILL_LEN		12
#define EC_COMBOSKILL_ICONNUM	18
#define ANM_RECENT_FILES_MAXNUM 8

//#define EC_USERCHANNEL_NUM		7
enum USERCHANNEL_TYPE {
	USERCHANNEL_NORMAL = 0,
	USERCHANNEL_TEAM,
	USERCHANNEL_KINGDOM,
	USERCHANNEL_WISPER,
	USERCHANNEL_BATTLE,
	USERCHANNEL_WORLD,
	USERCHANNEL_CUSTOMIZE,
	EC_USERCHANNEL_NUM
};

enum
{
	TAB_SEL_NPC_FIRST = 0,
	TAB_SEL_PLAYER_FIRST,
	TAB_SEL_NPC_ONLY,
	TAB_SEL_PLAYER_ONLY,
	TAB_SEL_NPC_NUM,
};

enum
{
	HEAD_INFO_SHOW= 0,
	HEAD_INFO_SHOW_HINT,
	HEAD_INFO_HIDE,
	HEAD_INFO_NUM,
};

enum
{
	SDT_SHOW_ALL = 0,
	SDT_SHOW_SELF,
	SDT_SHOW_NONE,
	SDT_SHOW_NUM,
};

///////////////////////////////////////////////////////////////////////////
//	
//	Types and Global variables
//	
///////////////////////////////////////////////////////////////////////////

#pragma pack(1)

struct EC_SYSTEM_SETTING
{
	BYTE	nSight;
	BYTE	nWaterEffect;
	BYTE	nSceneDetail;
	bool	bShadow;
	bool	bMipMapBias;
	BYTE	nSoundVol;		//音效音量 (人物打斗,以及其他杂七杂八的声音)
	int		iGamma;
    int     iAutoSaveMinutes;

	int		iRndWidth;
	int		iRndHeight;
	int		iTexDetail;
	int		iSoundQuality;
	bool	bFullScreen;
	bool	bWideScreen;
    bool    bShowWire;

	bool	bVSync;
};

struct EC_COMBOSKILL
{
	BYTE	nIcon;
	short	idSkill[EC_COMBOSKILL_LEN];
};

struct EC_VIDEO_SETTING
{
	bool bShowHeadInfo;
	char nShowHeadInfoDist;
	
	char cElsePlayerName;
	char cPlayerTitle;
	char cKingdom;
	char cElsePlayerHP;
	char cElsePlayerMP;
	char cMatterName;
	char cSelfName;
	char cTalkBubble;
	char cNPCName;
	char cPlayerShopName;
	char cMonsterName;
	char cMonsterHP;
	char cAggressiveMonster;
	char cPetName;
	char cSelfHP;
	char cSelfMP;
	char cTalk;

	bool bPlayerShowLimit;
	bool bMapNPC;
	bool bMapPlayer;
	bool bMapMonster;
	char nPlayerShowDistance;
	char nGFXLevel;
	float fCameraMaxDist; 

	bool bPlayerStun;
	bool bPlayerEXP;
	
	bool bShowEquipCompare;

	EC_COMBOSKILL comboSkill[EC_COMBOSKILL_NUM];
};

struct sPKRule
{
	char cPVPMask;     //可以攻击的对象
	char cTabSelRule;	//tab键切换目标规则。
};
/*
struct EC_GAME_SETTING
{
	bool bNoTeamRequest;
	bool bNoTradeRequest;
	bool bTurnaround;
	bool bReverseWheel;
	bool bCloseNewBeeHelp;
	bool bChannel[EC_USERCHANNEL_NUM][GP_CHAT_MAX];
	bool bAutoReply;
	ACHAR szAutoReply[EC_AUTOREPLY_LEN+1];
	float fCamTurnSpeed;
	float fCamZoomSpeed;
	BYTE nFontSize;
	sPKRule pkRules[2];	//pk设置方案
	char cCurPKRule;    //当前pk设置方案
	BYTE nPrintScreenType;
	bool bAlwaysShowChat; //始终显示聊天界面
	bool bRepChatLink;	//相应聊天链接
	int	nChatAlpha;		//聊天透明度
	bool bWorldChatInform;	//世界喊话道具提示
};*/

//存储在服务器的玩家配置信息，创建新角色时，这些数据不是从默认角色身上拷贝出来的(默认角色是由策划维护的)。
struct EC_NO_DEF_USER_SETTING
{
	BYTE bCameraMask[16];//128 bits
};

struct EC_BLACKLIST_SETTING
{
	_INT_64 idPlayer[EC_BLACKLIST_LEN];
};

//存储在本地的玩家配置信息，不存服务器，也不存硬盘，仅仅这一次游戏运行期间有效。
struct EC_LOCAL_SETTING
{
	bool bHidePlayer;
	bool bHidePet;
	bool bHideMonster;
};

#pragma pack()

///////////////////////////////////////////////////////////////////////////
//	
//	Declare of Global functions
//	
///////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////
//	
//	Class CECConfigs
//	
///////////////////////////////////////////////////////////////////////////

class CECConfigs
{
public:		//	Types

public:		//	Constructor and Destructor

	CECConfigs();
	virtual ~CECConfigs();

public:		//	Attributes

	//	Default environments
	float		m_fDefFogStart;
	float		m_fDefFogEnd;
	float		m_fDefFogDensity;
	DWORD		m_dwDefFogColor;
	AString		m_strDefSkyFile0;
	AString		m_strDefSkyFile1;
	AString		m_strDefSkyFile2;
	DWORD		m_dwDefLightDiff;
	DWORD		m_dwDefLightSpec;
	A3DVECTOR3	m_vDefLightDir;
	DWORD		m_dwDefAmbient;

	//	Test code, temporary parameters
	bool		m_bShowForest;		//	true, render forest, false, no render
	bool		m_bShowGrassLand;	//	true, render grass land, false, no render

    std::list<std::string> m_lRecentFiles;

public:		//	Operations

	//	Initialize object
	bool Init(const char* szCfgFile, const char* szSSFile);
	
	//	Save system settings to local disk
	bool SaveSystemSettings();
	//	Save user configs (except system settings) to specified buffer
	bool SaveUserConfigData(void* pDataBuf, int* piSize);
	//	Load shortcut configs (except system settings) from specified buffer
	bool LoadUserConfigData(const void* pDataBuf, int iDataSize);
	//	Save user settings( without default user when created) to specified buffer.
	bool SaveNoDefUserData(void* pDataBuf, int* piSize);
	//	Load user settings( without default user when created) from specified buffer.
	bool LoadNoDefUserData(const void* pDataBuf, int iDataSize);

	//	Restore user settings to default value
	//void DefaultUserSettings(EC_SYSTEM_SETTING *pss,
		//EC_VIDEO_SETTING *pvs, EC_GAME_SETTING *pgs,EC_NO_DEF_USER_SETTING *pns);

	//	Configs user cannot change ...
	const char* GetLoginUIDcf() { return m_strLoginDcf; }
	const char* GetInGameUIDcf() { return m_strInGameDcf; }
	const char* GetLoadingUIDcf() { return m_strLoadingDcf; }	
	int GetLanCodePage() { return m_iCodePage; }
	float GetDefFogStart() { return m_fDefFogStart; }
	float GetDefFogEnd() { return m_fDefFogEnd; }
	float GetDefFogDensity() { return m_fDefFogDensity; }
	DWORD GetDefFogColor() { return m_dwDefFogColor; }
	DWORD GetDefAmbient() { return m_dwDefAmbient; }
	DWORD GetDefLightDiff() { return m_dwDefLightDiff; }
	A3DVECTOR3 GetDefLightDir() { return m_vDefLightDir; }
	DWORD GetDefLightSpec() { return m_dwDefLightSpec; }
	float GetSevActiveRadius() { return m_fSevActiveRad; }
	void SetSceneLoadRadius(float fRadius);
	float GetSceneLoadRadius();
	void SetPlayerVisRadius(float fRadius);
	float GetPlayerVisRadius() { return m_fCurPVRadius; } 
	float CalcPlayerVisRadius(int iPercent) { return m_fMinPVRadius + (m_fSevActiveRad - m_fMinPVRadius) * iPercent / 100.0f; }
	void SetForestDetail(float fDetail);
	void SetGrassLandDetail(float fDetail);
	float GetForestDetail() { return m_fForestDetail; }
	float GetGrassLandDetail() { return m_fGrassLandDetail; }
	float GetTerrainLODDist1() { return m_fTrnLODDist1; } 
	float GetTerrainLODDist2() { return m_fTrnLODDist2; } 

	//	DEBUG only settings ...
	bool HasConsole() { return m_bConsole; }
	void SetRTDebugLevel(int iLevel) { m_iRTDebug = iLevel; }
	int GetRTDebugLevel() { return m_iRTDebug; }
	//void ShowNPCID(bool bShow) { m_bShowNPCID = bShow; }
	//bool IsNPCIDShown() { return m_bShowNPCID; }
	void SetHostRunSpeed(float fSpeed) { m_fRunSpeed = fSpeed; }
	float GetHostRunSpeed() { return m_fRunSpeed; }
	float GetHostWalkSpeed() { return m_fWalkSpeed; }
	bool GetTestDistFlag() { return m_bTestDist; }
	void SetTestDistFlag(bool bFlag) { m_bTestDist = bFlag; }
	bool GetShowPosFlag() { return m_bShowPos; }
	void SetShowPosFlag(bool bFlag) { m_bShowPos = bFlag; }
	bool GetShowForestFlag() { return m_bShowForest; }
	void SetShowForestFlag(bool bFlag) { m_bShowForest = bFlag; }
	bool GetShowGameStatFlag() { return m_bGameStat; }
	void SetShowGameStatFlag(bool bFlag) { m_bGameStat = bFlag; }
	bool GetShowIDFlag() { return m_bShowID; }
	void SetShowIDFlag(bool bFlag) { m_bShowID = bFlag; }
	bool GetSkipFrameFlag() { return m_bSkipFrame; }
	void SetSkipFrameFlag(bool bTrue) { m_bSkipFrame = bTrue; }
	bool GetModelUpdateFlag() { return m_bModelUpt; }
	void SetModelUpdateFlag(bool bTrue) { m_bModelUpt = bTrue; }
	bool IsModelLightMap()					{ return m_bModelLightMap; }
	bool IsRenderShadow();

	void SetModelLightMap(bool bTrue);
	bool IsAdjusting() { return m_bAdjusting; }

	//	User settings ...
	const EC_SYSTEM_SETTING& GetSystemSettings() { return m_ss; }
	const EC_VIDEO_SETTING& GetVideoSettings() { return m_vs; }
	//const EC_GAME_SETTING& GetGameSettings() { return m_gs; }
	const EC_BLACKLIST_SETTING& GetBlackListSettings() { return m_bs; }
	EC_SYSTEM_SETTING * GetSystemSettingsPtr() { return &m_ss; }
	const EC_NO_DEF_USER_SETTING GetNoDefUserSettings() { return m_ns; }
	const EC_LOCAL_SETTING GetLocalSettings() { return m_ls; }
	void SetSystemSettings(const EC_SYSTEM_SETTING& ss, bool bCallFromWndProc=false, bool bModifySimplifiedFlag = true);//todo:	delete bModifySimplifiedFlag. [LiuDong 2009/12/18  11:13]
	void SetVideoSettings(const EC_VIDEO_SETTING& vs);
	//void SetGameSettings(const EC_GAME_SETTING& gs);
	void SetBlackListSettings(const EC_BLACKLIST_SETTING& bs);
	void SetNoDefUserSettings(const EC_NO_DEF_USER_SETTING& ns);
	void SetLocalSettings(const EC_LOCAL_SETTING& ls);
	
	bool IsSimplifiedSettings(){ return m_bSimplified;}
	void SetSimplifiedSettings(bool bSimplified);
    bool IsNCfgReady(){ return m_bNCfgReady; }
	void SetNCfgReady(const bool bNCfgReady){m_bNCfgReady = bNCfgReady;}

    bool GetShowWireFlag() const { return m_ss.bShowWire; }
    void SetShowWireFlag(bool bEnable) { m_ss.bShowWire = bEnable; }

	bool IsEnableSkinLight()						{ return m_bEnableSkinLight; }
	void EnableSkinLight(bool bEnable)				{ m_bEnableSkinLight = bEnable; }
	const A3DCOLORVALUE& GetSkinLightDiff()			{ return m_cvSkinLightDiff; }
	void SetSkinLightDiff(const A3DCOLORVALUE& cv)	{ m_cvSkinLightDiff = cv; }
	const A3DCOLORVALUE& GetSkinLightSpec()			{ return m_cvSkinLightSpec; }
	void SetSkinLightSpec(const A3DCOLORVALUE& cv)	{ m_cvSkinLightSpec = cv; }

    void PushRecentFileName(std::string strFileName);

protected:	//	Attributes

	//	Configs user cannot change ...
	AString		m_strLoginDcf;		//	Login UI dcf file
	AString		m_strInGameDcf;		//	In game UI dcf file
	AString		m_strLoadingDcf;	//	Loading UI dcf file

	int			m_iCodePage;		//	Language code page
	float		m_fSevActiveRad;	//	Server active radius
	float		m_fSceLoadRadius;	//	Current scene loading radius
	float		m_fMinPVRadius;		//	Minimum player visible radius
	float		m_fCurPVRadius;		//	Current player visible radius
	float		m_fForestDetail;	//	Forest detail (0-1)
	float		m_fGrassLandDetail;	//	Grass land detail (0-1)
	float		m_fTrnLODDist1;		//	Terrain LOD distance 1
	float		m_fTrnLODDist2;		//	Terrain LOD distance 2
	int			m_iRTDebug;			//	Run-time debug message level

	//	DEBUG only settings ...
	bool		m_bConsole;			//	true, using console
	bool		m_bShowNPCID;		//	Show NPC's ID on it's head	
	float		m_fRunSpeed;		//	Host run speed.
	float		m_fWalkSpeed;		//	Host walk speed
	bool		m_bTestDist;		//	Test distance
	bool		m_bShowPos;			//	Show position
	bool		m_bGameStat;		//	Show game statistic
	bool		m_bShowID;			//	Show player ID
	bool		m_bSkipFrame;		//	Skip frame flag
	bool		m_bModelUpt;		//	Model update optimization flag
	bool		m_bModelLightMap;	//	Enable model light map

	bool		m_bAdjusting;		//	flag indicates the system setting is being adjusted

	//	User settings ...
	EC_SYSTEM_SETTING		m_ss;		//	System settings
	EC_VIDEO_SETTING		m_vs;		//	Video settings
	//EC_GAME_SETTING			m_gs;		//	Game settings
	EC_BLACKLIST_SETTING	m_bs;		//	Blacklist settings
	EC_NO_DEF_USER_SETTING  m_ns;       
	EC_LOCAL_SETTING		m_ls;		

	//	Simplifie settings ...
	bool					m_bSimplified;
	EC_SYSTEM_SETTING		m_ssOrigin;		//	System settings
	EC_VIDEO_SETTING		m_vsOrigin;		//	Video settings

	bool                    m_bNCfgReady;//whether have get EC_NO_DEF_USER_SETTING now. 
	
	//	Test skin light, only for direct light
	bool					m_bEnableSkinLight;
	A3DCOLORVALUE			m_cvSkinLightDiff;
	A3DCOLORVALUE			m_cvSkinLightSpec;

protected:	//	Operations

	//	Load configs from file
	bool LoadConfigs(const char* szFile);
	//	Load system settings from local disk file
	bool LoadSystemSettings(const char* szFile);
	//	Set default user config data
	void DefaultUserConfigData();
	//	Set default user config data(no default user).
	void DefaultNoDefUserConfigData();
	
	//	Convert sight radius setting
	void ConvertSightSetting(int iSight);
	//	Verify combo-skill ids
	void VerifyComboSkills();
};

///////////////////////////////////////////////////////////////////////////
//	
//	Inline functions
//	
///////////////////////////////////////////////////////////////////////////

