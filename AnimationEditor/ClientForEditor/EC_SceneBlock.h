/*
 * FILE: EC_SceneBlock.h
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

#include "ARect.h"
#include "AArray.h"
#include "EC_WorldFile.h"
#include "ElementRender.h"

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

class CECScene;
class AFileImage;

///////////////////////////////////////////////////////////////////////////
//	
//	Declare of Global functions
//	
///////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////
//	
//	Class CECSceneBlock
//	
///////////////////////////////////////////////////////////////////////////

class CECSceneBlock
{
public:		//	Types

	//	Scene resource type
	enum
	{
		SCNRES_TREE = 0,
		SCNRES_WATER,
		SCNRES_BUILDING,
		SCNRES_BOXAREA,
		SCNRES_GRASS,
		SCNRES_EFFECT,
		SCNRES_ECMODEL,
		SCNRES_CRITTER,
		SCNRES_BEZIER,
		SCNRES_SOUND,
		SCNRES_MIRROR,
		NUM_SCNRESTYPE,
	};

	//	Tree information
	struct TREEINFO
	{
		DWORD	dwType;
		DWORD	dwID;
	};

public:		//	Constructor and Destructor

	CECSceneBlock(CECScene* pScene);
	virtual ~CECSceneBlock();

public:		//	Attributes

public:		//	Operations

	//	Initialize block
	bool Init();
	//	Release block
	void Release();
	
	//	Load block data from file
	bool Load(AFileImage* pWorldFile, AFileImage* pBSDFile, float sx, float sz, float fDist);
	//	Update block resources
	bool UpdateRes(float fDist);

	//	Get block area in world
	const ARectF& GetBlockArea() { return m_rcBlock; }

    const A3DPOST_EFFECT_DOF_PARAM& GetPostEffectDOFParam() const { return m_EffectDOFParam; }
    const A3DPOST_EFFECT_BLOOM_PARAM& GetPostEffectBloomParamDay() const { return m_EffectBloomParamDay; }
    const A3DPOST_EFFECT_BLOOM_PARAM& GetPostEffectBloomParamNight() const { return m_EffectBloomParamNight; }
    const A3DPOST_EFFECT_FULLGLOW_PARAM& GetPostEffectFullGlowParamDay() const { return m_EffectFullGlowParamDay; }
    const A3DPOST_EFFECT_FULLGLOW_PARAM& GetPostEffectFullGlowParamNight() const { return m_EffectFullGlowParamNight; }
    const A3DPOST_EFFECT_WARP_PARAM& GetPostEffectWarpParam() const { return m_EffectWarpParam; }
    const A3DPOST_EFFECT_CC_PARAM& GetPostEffectCCParam() const { return m_EffectCCParam; }

	//	Set resource loading distance
	static void SetResLoadDists(int iScheme);
	static float GetResLoadDists(int iResource)	{ return m_aResLoadDist[iResource]; }
	static float GetFogTimes() { return m_fFogTimes; }

protected:	//	Attributes

	static float	m_fFogTimes;						//	number to be multiplied with fog start and end
	static float	m_aResLoadDist[NUM_SCNRESTYPE];		//	Resource loading distance

	CECScene*	m_pScene;		//	Scene object
	AFileImage*		m_pWorldFile;	//	World data file
	AFileImage*		m_pBSDFile;		//	Scene block shared data file

	float		m_fBlockSize;	//	Block size (on x and z axis) in logic unit (metres)
	ARectF		m_rcBlock;		//	Block area in world
	
	ECWDFILEBLOCK18				m_Info;				//	Block information
	AArray<DWORD, DWORD>		m_aDataOffs;		//	Resource offset in world data file
	DWORD						m_dwResFlags;		//	Resource ready flags

	AArray<TREEINFO, TREEINFO&>	m_aTreeInfos;		//	Information of trees
	AArray<DWORD, DWORD>		m_aWaterIDs;		//	Export ID of water
	AArray<DWORD, DWORD>		m_aOrnamentIDs;		//	Export ID of ornaments
	AArray<DWORD, DWORD>		m_aBoxAreaIDs;		//	Export ID of box areas
	AArray<DWORD, DWORD>		m_aGrassIDs;		//	Export ID of grass areas
	AArray<DWORD, DWORD>		m_aEffectIDs;		//	Export ID of effects
	AArray<DWORD, DWORD>		m_aECModelIDs;		//	Export ID of ECModels
	AArray<DWORD, DWORD>		m_aCritterIDs;		//	Export ID of critter groups
	AArray<DWORD, DWORD>		m_aBezierIDs;		//	Export ID of beziers
	AArray<DWORD, DWORD>		m_aSoundIDs;		//	Export ID of sounds
	AArray<DWORD, DWORD>		m_aMirrorIDs;		//	Export ID of mirrors

    // Post Effect
    A3DPOST_EFFECT_DOF_PARAM      m_EffectDOFParam;
    A3DPOST_EFFECT_BLOOM_PARAM    m_EffectBloomParamDay;
    A3DPOST_EFFECT_BLOOM_PARAM    m_EffectBloomParamNight;
    A3DPOST_EFFECT_FULLGLOW_PARAM m_EffectFullGlowParamDay;
    A3DPOST_EFFECT_FULLGLOW_PARAM m_EffectFullGlowParamNight;
    A3DPOST_EFFECT_WARP_PARAM     m_EffectWarpParam;
    A3DPOST_EFFECT_CC_PARAM		  m_EffectCCParam;

protected:	//	Operations

	//	Load grass data from file
	bool LoadGrasses(int iNumGrass, bool bSkipData);
	void UnloadGrasses();
	//	Load water data from file
	bool LoadWater(int iNumWater, bool bSkipData);
	void UnloadWater();
	//	Load ornaments from file
	bool LoadOrnaments(int iNumOnmt, bool bSkipData);
	void UnloadOrnaments();
	//	Load box areas from file
	bool LoadBoxAreas(int iNumArea, bool bSkipData);
	void UnloadBoxAreas();
	//	Load effects from file
	bool LoadEffects(int iNumEffect, bool bSkipData);
	void UnloadEffects();
	//	Load EC models from file
	bool LoadECModels(int iNumModel, bool bSkipData);
	void UnloadECModels();
	//	Load critter groups from file
	bool LoadCritterGroups(int iNumGroup, bool bSkipData);
	void UnloadCritterGroups();
	//	Load bezier routes from file
	bool LoadBeziers(int iNumBezier, bool bSkipData);
	void UnloadBeziers();
	//	Load sound objects from file
	bool LoadSounds(int iNumSound, bool bSkipData);
	void UnloadSounds();
	//	Load mirror objects from file
	bool LoadMirrors(int iNumMirror, bool bSkipData);
	void UnloadMirrors();

    //  Load Post Effect
    bool LoadPostEffect(int iOffset);
};

///////////////////////////////////////////////////////////////////////////
//	
//	Inline functions
//	
///////////////////////////////////////////////////////////////////////////
