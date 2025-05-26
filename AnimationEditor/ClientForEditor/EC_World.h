/*
 * FILE: EC_World.h
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Duyuxin, 2004/8/25
 *
 * HISTORY: 
 *
 * Copyright (c) 2004 Archosaur Studio, All Rights Reserved.
 */

#pragma once

#include <A3D.h>
#include <AF.h>
#include "A3DGFXEx.h"
#include "A3DGFXExMan.h"
#include <ECManager.h>
#include <ECManagerID.h>
#include "EC_MsgDef.h"
#include "AString.h"
#include <hashtab.h>
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

class A3DTerrain2;
class A3DTerrainWater2;
class A3DTerrainWaterFFT;
class A3DSkySphere;
class A3DViewport;
class CECViewport;
class CECGameRun;
class CECSkillGfxMan;
class CECOrnamentMan;
class CELForest;
class CELTree;
class CELGRASSLAND;
class CELGrassType;
class CELTERRAINOUTLINE2;
class CELCloudManager;
class CECSUNMOON;
class A3DRain;
class A3DSnow;
class CECSceneLights;

///////////////////////////////////////////////////////////////////////////
//	
//	Declare of Global functions
//	
///////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////
//	
//	Class CECWorld
//	
///////////////////////////////////////////////////////////////////////////

class CECWorld
{
public:		//	Types

	friend class CECScene;
    friend class CAnimator;

	struct sLastCameraInfo 
	{
		sLastCameraInfo();
		void Clear();
		A3DVECTOR3	vPos;
		DWORD		idCameraPath;
	};

public:		//	Constructor and Destructor

	CECWorld(CECGameRun* pGameRun);
	virtual ~CECWorld();

public:		//	Attributes

public:		//	Operations

	//	Initialize object
	bool Init(int idInst);
	//	Release object
	void Release();

	//	Tick routine
	bool Tick(DWORD dwDeltaTime, CECViewport* pViewport);
    bool __PreRender(CECViewport* pViewport);

	//	Tick animation
	bool TickAnimation();

	//	Load world from file
	bool LoadWorld(const char* szFile, const A3DVECTOR3& vInitLoadPos);
	//	Set load center
	void SetLoadCenter(const A3DVECTOR3& vCenter);
	//	Set view radius
	void SetViewRadius(float fRadius);
	//	Set time of the day and adjust several state to make the change take effects
	void SetTimeOfDay(float t);
	//	Checkout instance data
	bool CheckOutInst(int idInst, DWORD dwRegionTimeStamp, DWORD dwPrecinctTimeStamp);

	//	Get terrain height of specified position
	float GetTerrainHeight(const A3DVECTOR3& vPos, A3DVECTOR3* pvNormal=NULL);
	//	Get water height of specified position
	float GetWaterHeight(const A3DVECTOR3& vPos);
	//	Get ground height of specified poistion
	float GetGroundHeight(const A3DVECTOR3& vPos, A3DVECTOR3* pvNormal=NULL);
	//	Get terrain object
	A3DTerrain2* GetTerrain() { return m_pA3DTerrain; }
	//	Get terrain water object
	A3DTerrainWater2 * GetTerrainWater() { return m_pA3DTerrainWater; }
    A3DTerrainWaterFFT* GetTerrainWaterFFT() { return m_pA3DTerrainWaterFFT; }
	//	Get A3DSky object
	A3DSkySphere * GetSkySphere();
	//	Get cloud manager
	CELCloudManager * GetCloudManager() { return m_pCloudManager; }
	//	Get scene object
	CECScene* GetScene() { return m_pScene; }
	//	Get sunmoon object
	CECSUNMOON* GetSunMoon() { return m_pSunMoon; }

	CECOrnamentMan* GetOrnamentMan()			{ return (CECOrnamentMan*)m_aManagers[MAN_ORNAMENT]; }
    CECSkillGfxMan* GetSkillGfxMan()			{ return (CECSkillGfxMan*)m_aManagers[MAN_SKILLGFX]; }

	//	Get manager by index
	CECManager* GetManager(int n) { return m_aManagers[n]; }
	//	Get Grassland interface
	CELGRASSLAND * GetGrassLand() { return m_pGrassLand; }
	//	Get world loaded flag
	bool IsWorldLoaded() { return m_bWorldLoaded; }
    //	Get map path
	const char* GetFileName() { return m_strFileName; }
	//	Get map path
	const char* GetMapPath() { return m_strMapPath; }
	//	Get born stamp
	DWORD GetBornStamp() { return m_dwBornStamp++; }
	//	Get initial load position
	const A3DVECTOR3& GetInitLoadPos() { return m_vInitLoadPos; }
	//	Get scene light object
	CECSceneLights* GetSceneLights() { return m_pSceneLights; }	  

	//	Get id of instance
	int GetInstanceID() { return m_idInst; }

	double GetWorldSizeX(); // world size in x axis.
	double GetWorldSizeZ();// world size in z axis.
	
protected:	//	Attributes

	CECGameRun*			m_pGameRun;					//	Game run object
	A3DTerrain2*		m_pA3DTerrain;				//	Terrain object
	A3DTerrainWater2*	m_pA3DTerrainWater;			//	Terrain water object
    A3DTerrainWaterFFT* m_pA3DTerrainWaterFFT;
	A3DSkySphere*		m_pA3DSky;					//	Sky object
	CECManager*			m_aManagers[NUM_MANAGER];	//	Manager array
	CELGRASSLAND *		m_pGrassLand;				//	Grass Land Object for the world
	CELCloudManager *	m_pCloudManager;			//	Clouds object
	CECScene*			m_pScene;					//	Scene object
	CECSUNMOON*			m_pSunMoon;					//	Sun and moon in the world
	A3DRain*			m_pRain;					//	rain in the world
	A3DSnow*			m_pSnow;					//	snow in the world
	CECSceneLights*		m_pSceneLights;				//	all lights in the scene

	AString     m_strFileName;
    AString		m_strMapPath;		//	Map path
	bool		m_bResetEnv;		//	true, reset environment
	bool		m_bWorldLoaded;		//	true, world has been loaded
	A3DVECTOR3	m_vInitLoadPos;		//	Initial load position
	bool		m_bCenterReset;		//	true, this tick center is reset
	DWORD		m_dwBornStamp;		//	Born stamp
	int			m_idInst;			//	id of instance

	float		m_fTrnLoadDelta;	//	Terrain loading speed control
	float		m_fTrnLoadCnt;
	float		m_fScnLoadDelta;	//	Scene loading speed control
	float		m_fScnLoadCnt;

protected:	//	Operations
	//	Initialize terrain water
	bool InitTerrainWater();
	//	Initialize plants objects
	bool InitPlantsObjects();

	// Initialize nature effects
	bool InitNatureObjects();
	// Release nature effects
	void ReleaseNatureObjects();
	// Tick nature objects
	bool TickNatureObjects(DWORD dwDeltaTime);
	//	Update current region which the host player is in
	void UpdateCurRegion();

	//	Load terrain
	bool LoadTerrain(const char* szFile);
	//	Load clouds
	bool LoadClouds(const char * szFile, const char * szTexPath);
	//	Load scene objects
	bool LoadSceneObjects(const char* szFile);
	//	Load sky
	bool LoadSky();
	//	Load plants
	bool LoadPlants(const char * szFile);

	//	Release current scene
	void ReleaseScene();
    //	Calculate terrain and scene loading speed
	void CalcSceneLoadSpeed();

	//	Create managers
	bool CreateManagers();
	//	Release managers
	void ReleaseManagers();
};

///////////////////////////////////////////////////////////////////////////
//	
//	Inline functions
//	
///////////////////////////////////////////////////////////////////////////
