/*
 * FILE: EC_SceneBlock.cpp
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Duyuxin, 2004/10/15
 *
 * HISTORY: 
 *
 * Copyright (c) 2004 Archosaur Studio, All Rights Reserved.
 */

#include "StdAfx.h"
#include "EC_Global.h"
#include "EC_SceneBlock.h"
#include "EC_Scene.h"
#include "EC_World.h"
#include "EC_ManOrnament.h"
#include "EC_Ornament.h"
#include "EC_Game.h"
#include "EC_GameRun.h"

///////////////////////////////////////////////////////////////////////////
//	
//	Define and Macro
//	
///////////////////////////////////////////////////////////////////////////


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

float CECSceneBlock::m_aResLoadDist[NUM_SCNRESTYPE] = 
{
	2000.0f,	//	SCNRES_TREE
	2000.0f,	//	SCNRES_WATER
	2000.0f,	//	SCNRES_BUILDING
	2000.0f,	//	SCNRES_BOXAREA
	2000.0f,	//	SCNRES_GRASS
	2000.0f,	//	SCNRES_EFFECT
	2000.0f,	//	SCNRES_ECMODEL
	2000.0f,	//	SCNRES_CRITTER
	2000.0f,	//	SCNRES_BEZIER
	2000.0f,	//	SCNRES_SOUND
};

float CECSceneBlock::m_fFogTimes = 1.0f;

///////////////////////////////////////////////////////////////////////////
//	
//	Local functions
//	
///////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////
//	
//	Implement CECSceneBlock
//	
///////////////////////////////////////////////////////////////////////////

CECSceneBlock::CECSceneBlock(CECScene* pScene)
{
	m_pScene		= pScene;
	m_fBlockSize	= pScene->GetBlockSize();
	m_pWorldFile	= NULL;
	m_pBSDFile		= NULL;
	m_dwResFlags	= 0;

	m_rcBlock.Clear();

	//	Clear block info.
	memset(&m_Info, 0, sizeof (m_Info));
}

CECSceneBlock::~CECSceneBlock()
{
}

//	Initialize block
bool CECSceneBlock::Init()
{
	return true;
}

//	Release block
void CECSceneBlock::Release()
{
	if (m_pScene)
	{
		//	Unload resources
		UnloadGrasses();
		UnloadWater();
		UnloadOrnaments();
		UnloadBoxAreas();
		UnloadEffects();
		UnloadECModels();
		UnloadCritterGroups();
		UnloadBeziers();
		UnloadSounds();
	}
	
	m_pWorldFile = NULL;
	m_pBSDFile	 = NULL;
}

/*	Load block data from file

	pWorldFile: world data file object.
	pBSDFile: water data file object
	sx, sz: block's left corner position in world
	fDist: distance between block center and world's loading center
*/
bool CECSceneBlock::Load(AFileImage* pWorldFile, AFileImage* pBSDFile, float sx, float sz, float fDist)
{
    DWORD dwRead;

    m_pWorldFile	= pWorldFile;
    m_pBSDFile		= pBSDFile;

    //	Read block information
    if (m_pScene->GetSceneFileVersion() < 4)
    {
        ECWDFILEBLOCK Info;
        if (!pWorldFile->Read(&Info, sizeof (Info), &dwRead))
            return false;

        m_Info.iNumTree		= Info.iNumTree;
        m_Info.iNumWater	= Info.iNumWater;
        m_Info.iNumOrnament	= Info.iNumOrnament;
        m_Info.iNumBoxArea	= Info.iNumBoxArea;
        m_Info.iNumGrass	= Info.iNumGrass;
        m_Info.iRowInWorld	= Info.iRowInWorld;
        m_Info.iColInWorld	= Info.iColInWorld;
        m_Info.fMaxLoadRadius = 0.0f;
        m_Info.iNumMirror = 0;
        m_Info.iPostEftOffset = 0;
    }
    else if (m_pScene->GetSceneFileVersion() < 7)
    {
        ECWDFILEBLOCK4 Info;
        if (!pWorldFile->Read(&Info, sizeof (Info), &dwRead))
            return false;

        m_Info.iNumTree		= Info.iNumTree;
        m_Info.iNumWater	= Info.iNumWater;
        m_Info.iNumOrnament	= Info.iNumOrnament;
        m_Info.iNumBoxArea	= Info.iNumBoxArea;
        m_Info.iNumGrass	= Info.iNumGrass;
        m_Info.iNumEffect	= Info.iNumEffect;
        m_Info.iNumECModel	= Info.iNumECModel;
        m_Info.iNumCritter	= Info.iNumCritter;
        m_Info.iNumMirror = 0;
        m_Info.iRowInWorld	= Info.iRowInWorld;
        m_Info.iColInWorld	= Info.iColInWorld;
        m_Info.fMaxLoadRadius = 0.0f;
        m_Info.iPostEftOffset = 0;
    }
    else if (m_pScene->GetSceneFileVersion() < 9)
    {
        ECWDFILEBLOCK7 Info;
        if (!pWorldFile->Read(&Info, sizeof (Info), &dwRead))
            return false;

        m_Info.iNumTree		= Info.iNumTree;
        m_Info.iNumWater	= Info.iNumWater;
        m_Info.iNumOrnament	= Info.iNumOrnament;
        m_Info.iNumBoxArea	= Info.iNumBoxArea;
        m_Info.iNumGrass	= Info.iNumGrass;
        m_Info.iNumEffect	= Info.iNumEffect;
        m_Info.iNumECModel	= Info.iNumECModel;
        m_Info.iNumCritter	= Info.iNumCritter;
        m_Info.iNumBezier	= Info.iNumBezier;
        m_Info.iNumMirror = 0;
        m_Info.iRowInWorld	= Info.iRowInWorld;
        m_Info.iColInWorld	= Info.iColInWorld;
        m_Info.fMaxLoadRadius = 0.0f;
        m_Info.iPostEftOffset = 0;
    }
    else if (m_pScene->GetSceneFileVersion() < 16)
    {
        ECWDFILEBLOCK9 Info;
        if (!pWorldFile->Read(&Info, sizeof (Info), &dwRead))
            return false;

        m_Info.iNumTree		= Info.iNumTree;
        m_Info.iNumWater	= Info.iNumWater;
        m_Info.iNumOrnament	= Info.iNumOrnament;
        m_Info.iNumBoxArea	= Info.iNumBoxArea;
        m_Info.iNumGrass	= Info.iNumGrass;
        m_Info.iNumEffect	= Info.iNumEffect;
        m_Info.iNumECModel	= Info.iNumECModel;
        m_Info.iNumCritter	= Info.iNumCritter;
        m_Info.iNumBezier	= Info.iNumBezier;
        m_Info.iNumSound	= Info.iNumSound;
        m_Info.iNumMirror = 0;
        m_Info.iRowInWorld	= Info.iRowInWorld;
        m_Info.iColInWorld	= Info.iColInWorld;
        m_Info.fMaxLoadRadius = 0.0f;
        m_Info.iPostEftOffset = 0;
    }
    else if (m_pScene->GetSceneFileVersion() < 17)
    {
        ECWDFILEBLOCK16 Info;
        if (!pWorldFile->Read(&Info, sizeof (Info), &dwRead))
            return false;

        m_Info.iNumTree		= Info.iNumTree;
        m_Info.iNumWater	= Info.iNumWater;
        m_Info.iNumOrnament	= Info.iNumOrnament;
        m_Info.iNumBoxArea	= Info.iNumBoxArea;
        m_Info.iNumGrass	= Info.iNumGrass;
        m_Info.iNumEffect	= Info.iNumEffect;
        m_Info.iNumECModel	= Info.iNumECModel;
        m_Info.iNumCritter	= Info.iNumCritter;
        m_Info.iNumBezier	= Info.iNumBezier;
        m_Info.iNumSound	= Info.iNumSound;
        m_Info.iNumMirror = 0;
        m_Info.iRowInWorld	= Info.iRowInWorld;
        m_Info.iColInWorld	= Info.iColInWorld;
        m_Info.fMaxLoadRadius = Info.fMaxLoadRadius;
        m_Info.iPostEftOffset = 0;
    }
    else if (m_pScene->GetSceneFileVersion() < 18)
    {
        ECWDFILEBLOCK17 Info;
        if (!pWorldFile->Read(&Info, sizeof (Info), &dwRead))
            return false;

        m_Info.iNumTree		= Info.iNumTree;
        m_Info.iNumWater	= Info.iNumWater;
        m_Info.iNumOrnament	= Info.iNumOrnament;
        m_Info.iNumBoxArea	= Info.iNumBoxArea;
        m_Info.iNumGrass	= Info.iNumGrass;
        m_Info.iNumEffect	= Info.iNumEffect;
        m_Info.iNumECModel	= Info.iNumECModel;
        m_Info.iNumCritter	= Info.iNumCritter;
        m_Info.iNumBezier	= Info.iNumBezier;
        m_Info.iNumSound	= Info.iNumSound;
        m_Info.iNumMirror   = Info.iNumMirror;
        m_Info.iRowInWorld	= Info.iRowInWorld;
        m_Info.iColInWorld	= Info.iColInWorld;
        m_Info.fMaxLoadRadius = Info.fMaxLoadRadius;
        m_Info.iPostEftOffset = 0;
    }
    else	//	m_pScene->GetSceneFileVersion() >= 18
    {
        ECWDFILEBLOCK18 Info;
        if (!pWorldFile->Read(&Info, sizeof (Info), &dwRead))
            return false;

        m_Info.iNumTree		= Info.iNumTree;
        m_Info.iNumWater	= Info.iNumWater;
        m_Info.iNumOrnament	= Info.iNumOrnament;
        m_Info.iNumBoxArea	= Info.iNumBoxArea;
        m_Info.iNumGrass	= Info.iNumGrass;
        m_Info.iNumEffect	= Info.iNumEffect;
        m_Info.iNumECModel	= Info.iNumECModel;
        m_Info.iNumCritter	= Info.iNumCritter;
        m_Info.iNumBezier	= Info.iNumBezier;
        m_Info.iNumSound	= Info.iNumSound;
        m_Info.iNumMirror   = Info.iNumMirror;
        m_Info.iRowInWorld	= Info.iRowInWorld;
        m_Info.iColInWorld	= Info.iColInWorld;
        m_Info.fMaxLoadRadius = Info.fMaxLoadRadius;
        m_Info.iPostEftOffset = Info.iPostEftOffset;
    }

	m_rcBlock.SetRect(sx, sz, sx + m_fBlockSize, sz - m_fBlockSize);
	m_aDataOffs.SetSize(NUM_SCNRESTYPE, 10);

	//	Load trees 
	//	No use now 2011.08.18 by Jiang Dalong
//	m_aDataOffs[SCNRES_TREE] = m_pWorldFile->GetPos();

	//	Load water
	m_aDataOffs[SCNRES_WATER] = m_pWorldFile->GetPos();
	bool bSkipData = fDist > m_aResLoadDist[SCNRES_WATER] ? true : false;
	if (!LoadWater(m_Info.iNumWater, bSkipData))
	{
		a_LogOutput(1, _EA("CECSceneBlock::Load, failed to load water data in block"));
	//	return false;
	}

	//	Load ornaments
	m_aDataOffs[SCNRES_BUILDING] = m_pWorldFile->GetPos();
    bSkipData = fDist > max(m_aResLoadDist[SCNRES_BUILDING], m_Info.fMaxLoadRadius) ? true : false;
	if (!LoadOrnaments(m_Info.iNumOrnament, bSkipData))
	{
		a_LogOutput(1, _EA("CECSceneBlock::Load, failed to load ornament data in block"));
	//	return false;
	}

	//	Load box areas
	m_aDataOffs[SCNRES_BOXAREA] = m_pWorldFile->GetPos();
	bSkipData = fDist > m_aResLoadDist[SCNRES_BOXAREA] ? true : false;
	if (!LoadBoxAreas(m_Info.iNumBoxArea, bSkipData))
	{
		a_LogOutput(1, _EA("CECSceneBlock::Load, failed to load box area data in block"));
	//	return false;
	}

	//	Load grass areas
	m_aDataOffs[SCNRES_GRASS] = m_pWorldFile->GetPos();
	bSkipData = fDist > m_aResLoadDist[SCNRES_GRASS] ? true : false;
	if (!LoadGrasses(m_Info.iNumGrass, bSkipData))
	{
		a_LogOutput(1, _EA("CECSceneBlock::Load, failed to load grass area data in block"));
	//	return false;
	}

	//	Load GFX effects
	m_aDataOffs[SCNRES_EFFECT] = m_pWorldFile->GetPos();
	bSkipData = fDist > m_aResLoadDist[SCNRES_EFFECT] ? true : false;
	if (!LoadEffects(m_Info.iNumEffect, bSkipData))
	{
		a_LogOutput(1, _EA("CECSceneBlock::Load, failed to load effect data in block"));
	//	return false;
	}

	//	Load ECModels
	m_aDataOffs[SCNRES_ECMODEL] = m_pWorldFile->GetPos();
	bSkipData = fDist > m_aResLoadDist[SCNRES_ECMODEL] ? true : false;
	if (!LoadECModels(m_Info.iNumECModel, bSkipData))
	{
		a_LogOutput(1, _EA("CECSceneBlock::Load, failed to load ECModel data in block"));
	//	return false;
	}

	//	Load critter groups
	m_aDataOffs[SCNRES_CRITTER] = m_pWorldFile->GetPos();
	bSkipData = fDist > m_aResLoadDist[SCNRES_CRITTER] ? true : false;
	if (!LoadCritterGroups(m_Info.iNumCritter, bSkipData))
	{
		a_LogOutput(1, _EA("CECSceneBlock::Load, failed to load critter group data in block"));
	//	return false;
	}

	//	Load beziers
	m_aDataOffs[SCNRES_BEZIER] = m_pWorldFile->GetPos();
	bSkipData = fDist > m_aResLoadDist[SCNRES_BEZIER] ? true : false;
	if (!LoadBeziers(m_Info.iNumBezier, bSkipData))
	{
		a_LogOutput(1, _EA("CECSceneBlock::Load, failed to load bezier routes in block"));
	//	return false;
	}

	//	Load sounds
	m_aDataOffs[SCNRES_SOUND] = m_pWorldFile->GetPos();
	bSkipData = fDist > m_aResLoadDist[SCNRES_SOUND] ? true : false;
	if (!LoadSounds(m_Info.iNumSound, bSkipData))
	{
		a_LogOutput(1, _EA("CECSceneBlock::Load, failed to load sound objects in block"));
	//	return false;
	}

    //	Load mirrors
    m_aDataOffs[SCNRES_MIRROR] = m_pWorldFile->GetPos();
    bSkipData = fDist > m_aResLoadDist[SCNRES_MIRROR] ? true : false;
    if (!LoadMirrors(m_Info.iNumMirror, bSkipData))
    {
        a_LogOutput(1, _EA("CECSceneBlock::Load, failed to load mirror objects in block"));
        //	return false;
    }

    //  Load post effect
    if (!LoadPostEffect(m_Info.iPostEftOffset))
    {
        a_LogOutput(1, _EA("CECSceneBlock::Load, failed to load post effect in block"));
        //	return false;
    }

	return true;
}

//	Load grass data from file
bool CECSceneBlock::LoadGrasses(int iNumGrass, bool bSkipData)
{
	if (!iNumGrass)
	{
		m_dwResFlags |= (1 << SCNRES_GRASS);
		return true;
	}

	if (bSkipData)
	{
		DWORD dwSize = sizeof (ECWDFILEDATAREF) * iNumGrass;
		m_pWorldFile->Seek(dwSize, AFILE_SEEK_CUR);
		return true;
	}

	DWORD dwRead;
	AArray<ECWDFILEDATAREF, ECWDFILEDATAREF&> aSrcInfo;
	aSrcInfo.SetSize(iNumGrass, 10);

	if (!m_pWorldFile->Read(aSrcInfo.GetData(), iNumGrass * sizeof (ECWDFILEDATAREF), &dwRead))
		return false;

	m_aGrassIDs.SetSize(0, iNumGrass);

	for (int i=0; i < iNumGrass; i++)
	{
		ECWDFILEDATAREF& SrcInfo = aSrcInfo[i];
		if (m_pScene->LoadGrassArea(SrcInfo.dwExportID, SrcInfo.dwOffset))
			m_aGrassIDs.Add(SrcInfo.dwExportID);
	}

	m_dwResFlags |= (1 << SCNRES_GRASS);

	return true;
}

//	Load water data from file
bool CECSceneBlock::LoadWater(int iNumWater, bool bSkipData)
{
	if (!iNumWater)
	{
		m_dwResFlags |= (1 << SCNRES_WATER);
		return true;
	}

	if (bSkipData)
	{
		DWORD dwSize = sizeof (ECWDFILEDATAREF) * iNumWater;
		m_pWorldFile->Seek(dwSize, AFILE_SEEK_CUR);
		return true;
	}

	DWORD dwRead;
	AArray<ECWDFILEDATAREF, ECWDFILEDATAREF&> aSrcInfo;
	aSrcInfo.SetSize(iNumWater, 10);

	if (!m_pWorldFile->Read(aSrcInfo.GetData(), iNumWater * sizeof (ECWDFILEDATAREF), &dwRead))
		return false;

	m_aWaterIDs.SetSize(0, iNumWater);

	for (int i=0; i < iNumWater; i++)
	{
		ECWDFILEDATAREF& SrcInfo = aSrcInfo[i];
		if (m_pScene->LoadWaterArea(SrcInfo.dwExportID, SrcInfo.dwOffset))
			m_aWaterIDs.Add(SrcInfo.dwExportID);
	}

	m_dwResFlags |= (1 << SCNRES_WATER);

	return true;
}

//	Load ornaments from file
bool CECSceneBlock::LoadOrnaments(int iNumOnmt, bool bSkipData)
{
	if (!iNumOnmt)
	{
		m_dwResFlags |= (1 << SCNRES_BUILDING);
		return true;
	}

	ASSERT(m_pWorldFile);

	if (m_pScene->GetSceneFileVersion() >= 4)
	{
		if (bSkipData)
		{
			DWORD dwSize = sizeof (ECWDFILEDATAREF) * iNumOnmt;
			m_pWorldFile->Seek(dwSize, AFILE_SEEK_CUR);
			return true;
		}

		DWORD dwRead;
		AArray<ECWDFILEDATAREF, ECWDFILEDATAREF&> aSrcInfo;
		aSrcInfo.SetSize(iNumOnmt, 10);

		if (!m_pWorldFile->Read(aSrcInfo.GetData(), iNumOnmt * sizeof (ECWDFILEDATAREF), &dwRead))
			return false;

		m_aOrnamentIDs.SetSize(0, iNumOnmt);

		for (int i=0; i < iNumOnmt; i++)
		{
			ECWDFILEDATAREF& SrcInfo = aSrcInfo[i];
			if (m_pScene->LoadOrnament(SrcInfo.dwExportID, SrcInfo.dwOffset, NULL))
				m_aOrnamentIDs.Add(SrcInfo.dwExportID);
		}
	}
	else	//	Version <= 3
	{
		if (bSkipData)
		{
			for (int i=0; i < iNumOnmt; i++)
			{
				m_pWorldFile->Seek(sizeof (ECWDFILEORNAMENT), AFILE_SEEK_CUR);
				AString str;
				m_pWorldFile->ReadString(str);
			}
			
			return true;
		}

		m_aOrnamentIDs.SetSize(0, iNumOnmt);

		DWORD dwID;
		for (int i=0; i < iNumOnmt; i++)
		{
			if (m_pScene->LoadOrnament(0, 0, &dwID))
				m_aOrnamentIDs.Add(dwID);
		}
	}

	m_dwResFlags |= (1 << SCNRES_BUILDING);

	return true;
}

//	Load box areas from file
bool CECSceneBlock::LoadBoxAreas(int iNumArea, bool bSkipData)
{
	if (!iNumArea)
	{
		m_dwResFlags |= (1 << SCNRES_BOXAREA);
		return true;
	}

	ASSERT(m_pWorldFile);

	if (bSkipData)
	{
		DWORD dwSize = sizeof (ECWDFILEDATAREF) * iNumArea;
		m_pWorldFile->Seek(dwSize, AFILE_SEEK_CUR);
		return true;
	}

	DWORD dwRead;
	AArray<ECWDFILEDATAREF, ECWDFILEDATAREF&> aSrcInfo;
	aSrcInfo.SetSize(iNumArea, 10);

	if (!m_pWorldFile->Read(aSrcInfo.GetData(), iNumArea * sizeof (ECWDFILEDATAREF), &dwRead))
		return false;

	m_aBoxAreaIDs.SetSize(0, iNumArea);

	for (int i=0; i < iNumArea; i++)
	{
		ECWDFILEDATAREF& SrcInfo = aSrcInfo[i];
		if (m_pScene->LoadBoxArea(SrcInfo.dwExportID, SrcInfo.dwOffset))
			m_aBoxAreaIDs.Add(SrcInfo.dwExportID);
	}

	m_dwResFlags |= (1 << SCNRES_BOXAREA);

	return true;
}

//	Load effects from file
bool CECSceneBlock::LoadEffects(int iNumEffect, bool bSkipData)
{
	if (!iNumEffect)
	{
		m_dwResFlags |= (1 << SCNRES_EFFECT);
		return true;
	}

	if (bSkipData)
	{
		AString str;
		if (m_pScene->GetSceneFileVersion() < 6)
		{
			for (int i=0; i < iNumEffect; i++)
			{
				m_pWorldFile->Seek(sizeof (ECWDFILEEFFECT), AFILE_SEEK_CUR);
				m_pWorldFile->ReadString(str);
			}
		}
		else if (m_pScene->GetSceneFileVersion() < 8)
		{
			for (int i=0; i < iNumEffect; i++)
			{
				m_pWorldFile->Seek(sizeof (ECWDFILEEFFECT6), AFILE_SEEK_CUR);
				m_pWorldFile->ReadString(str);
			}
		}
		else if (m_pScene->GetSceneFileVersion() < 12)
		{
			for (int i=0; i < iNumEffect; i++)
			{
				m_pWorldFile->Seek(sizeof (ECWDFILEEFFECT8), AFILE_SEEK_CUR);
				m_pWorldFile->ReadString(str);
			}
		}
		else	//	m_pScene->GetSceneFileVersion() >= 12
		{
			for (int i=0; i < iNumEffect; i++)
			{
				m_pWorldFile->Seek(sizeof (ECWDFILEEFFECT12), AFILE_SEEK_CUR);
				m_pWorldFile->ReadString(str);
			}
		}

		return true;
	}

	CECOrnamentMan* pOnmtMan = m_pScene->GetWorld()->GetOrnamentMan();
	ASSERT(pOnmtMan);

	m_aEffectIDs.SetSize(0, iNumEffect);

	for (int i=0; i < iNumEffect; i++)
	{
		DWORD dwID = pOnmtMan->LoadEffect(m_pScene, m_pWorldFile, m_pScene->GetCenterX(), m_pScene->GetCenterZ());
		if (!dwID)
			continue;

		m_aEffectIDs.Add(dwID);
	}

	m_dwResFlags |= (1 << SCNRES_EFFECT);

	return true;
}

//	Load EC models from file
bool CECSceneBlock::LoadECModels(int iNumModel, bool bSkipData)
{
	if (!iNumModel)
	{
		m_dwResFlags |= (1 << SCNRES_ECMODEL);
		return true;
	}

	if (bSkipData)
	{
		AString str;
		
		int iEcmBlkSize = (m_pScene->GetSceneFileVersion() < 13)? sizeof(ECWDFILEECMODEL13) : sizeof(ECWDFILEECMODEL);

		for (int i=0; i < iNumModel; i++)
		{
			m_pWorldFile->Seek(iEcmBlkSize, AFILE_SEEK_CUR);
			m_pWorldFile->ReadString(str);
			m_pWorldFile->ReadString(str);
		}

		return true;
	}

	CECOrnamentMan* pOnmtMan = m_pScene->GetWorld()->GetOrnamentMan();
	ASSERT(pOnmtMan);

	m_aECModelIDs.SetSize(0, iNumModel);

	for (int i=0; i < iNumModel; i++)
	{
		DWORD dwID = pOnmtMan->LoadECModel(m_pScene, m_pWorldFile, m_pScene->GetCenterX(), m_pScene->GetCenterZ());
		if (!dwID)
			continue;

		m_aECModelIDs.Add(dwID);
	}

	m_dwResFlags |= (1 << SCNRES_ECMODEL);

	return true;
}

//	Load critter groups from file
bool CECSceneBlock::LoadCritterGroups(int iNumGroup, bool bSkipData)
{
	if (!iNumGroup)
	{
		m_dwResFlags |= (1 << SCNRES_CRITTER);
		return true;
	}

	ASSERT(m_pWorldFile);

	if (bSkipData)
	{
		DWORD dwSize = sizeof (ECWDFILEDATAREF) * iNumGroup;
		m_pWorldFile->Seek(dwSize, AFILE_SEEK_CUR);
		return true;
	}

	DWORD dwRead;
	AArray<ECWDFILEDATAREF, ECWDFILEDATAREF&> aSrcInfo;
	aSrcInfo.SetSize(iNumGroup, 10);

	if (!m_pWorldFile->Read(aSrcInfo.GetData(), iNumGroup * sizeof (ECWDFILEDATAREF), &dwRead))
		return false;

	m_aCritterIDs.SetSize(0, iNumGroup);

	for (int i=0; i < iNumGroup; i++)
	{
		ECWDFILEDATAREF& SrcInfo = aSrcInfo[i];
		if (m_pScene->LoadCritterGroup(SrcInfo.dwExportID, SrcInfo.dwOffset))
			m_aCritterIDs.Add(SrcInfo.dwExportID);
	}

	m_dwResFlags |= (1 << SCNRES_CRITTER);

	return true;
}

//	Load bezier routes from file
bool CECSceneBlock::LoadBeziers(int iNumBezier, bool bSkipData)
{
	if (!iNumBezier)
	{
		m_dwResFlags |= (1 << SCNRES_BEZIER);
		return true;
	}

	ASSERT(m_pWorldFile);

	if (bSkipData)
	{
		DWORD dwSize = sizeof (ECWDFILEDATAREF) * iNumBezier;
		m_pWorldFile->Seek(dwSize, AFILE_SEEK_CUR);
		return true;
	}

	DWORD dwRead;
	AArray<ECWDFILEDATAREF, ECWDFILEDATAREF&> aSrcInfo;
	aSrcInfo.SetSize(iNumBezier, 10);

	if (!m_pWorldFile->Read(aSrcInfo.GetData(), iNumBezier * sizeof (ECWDFILEDATAREF), &dwRead))
		return false;

	m_aBezierIDs.SetSize(0, iNumBezier);

	for (int i=0; i < iNumBezier; i++)
	{
		ECWDFILEDATAREF& SrcInfo = aSrcInfo[i];
		if (m_pScene->LoadBezier(SrcInfo.dwExportID, SrcInfo.dwOffset))
			m_aBezierIDs.Add(SrcInfo.dwExportID);
	}

	m_dwResFlags |= (1 << SCNRES_BEZIER);

	return true;
}

//	Load sound objects from file
bool CECSceneBlock::LoadSounds(int iNumSound, bool bSkipData)
{
	if (!iNumSound)
	{
		m_dwResFlags |= (1 << SCNRES_SOUND);
		return true;
	}

	ASSERT(m_pWorldFile);

	if (bSkipData)
	{
		AString str;
		if (m_pScene->GetSceneFileVersion() < 10)
		{
			for (int i=0; i < iNumSound; i++)
			{
				m_pWorldFile->Seek(sizeof (ECWDFILESOUND), AFILE_SEEK_CUR);
				m_pWorldFile->ReadString(str);
			}
		}
		else if (m_pScene->GetSceneFileVersion() < 11)
		{
			for (int i=0; i < iNumSound; i++)
			{
				m_pWorldFile->Seek(sizeof (ECWDFILESOUND10), AFILE_SEEK_CUR);
				m_pWorldFile->ReadString(str);
			}
		}
        else if (m_pScene->GetSceneFileVersion() < 15)
        {
            for (int i=0; i < iNumSound; i++)
            {
                m_pWorldFile->Seek(sizeof (ECWDFILESOUND11), AFILE_SEEK_CUR);
                m_pWorldFile->ReadString(str);
            }
        }
        else
        {
            for (int i=0; i < iNumSound; i++)
            {
                m_pWorldFile->Seek(sizeof (ECWDFILESOUND15), AFILE_SEEK_CUR);
                m_pWorldFile->ReadString(str);
            }
		}

		return true;
	}

	CECOrnamentMan* pOnmtMan = m_pScene->GetWorld()->GetOrnamentMan();
	ASSERT(pOnmtMan);

	m_aSoundIDs.SetSize(0, iNumSound);

	for (int i=0; i < iNumSound; i++)
	{
		DWORD dwID = pOnmtMan->LoadSoundObject(m_pScene, m_pWorldFile, m_pScene->GetCenterX(), m_pScene->GetCenterZ());
		if (!dwID)
			continue;

		m_aSoundIDs.Add(dwID);
	}

	m_dwResFlags |= (1 << SCNRES_SOUND);

	return true;
}

bool CECSceneBlock::LoadMirrors(int iNumMirror, bool bSkipData)
{
    if (!iNumMirror)
    {
        m_dwResFlags |= (1 << SCNRES_MIRROR);
        return true;
    }

    ASSERT(m_pWorldFile);

    if (bSkipData)
    {
        DWORD dwSize = sizeof (ECWDFILEDATAREF) * iNumMirror;
        m_pWorldFile->Seek(dwSize, AFILE_SEEK_CUR);
        return true;
    }

    DWORD dwRead;
    AArray<ECWDFILEDATAREF, ECWDFILEDATAREF&> aSrcInfo;
    aSrcInfo.SetSize(iNumMirror, 10);

    if (!m_pWorldFile->Read(aSrcInfo.GetData(), iNumMirror * sizeof (ECWDFILEDATAREF), &dwRead))
        return false;

    m_aMirrorIDs.SetSize(0, iNumMirror);

    for (int i=0; i < iNumMirror; i++)
    {
        ECWDFILEDATAREF& SrcInfo = aSrcInfo[i];
        if (m_pScene->LoadMirror(SrcInfo.dwExportID, SrcInfo.dwOffset))
            m_aMirrorIDs.Add(SrcInfo.dwExportID);
    }

    m_dwResFlags |= (1 << SCNRES_MIRROR);

    return true;
}

bool CECSceneBlock::LoadPostEffect(int iOffset)
{
    if (iOffset == 0) return true;

    ASSERT(m_pBSDFile);

    m_pBSDFile->Seek(iOffset, AFILE_SEEK_SET);

    DWORD dwRead;
    if (m_pScene->GetBSDFileVersion() >= 21)
    {
        DWORD dwEnableFlags;
        m_pBSDFile->Read(&dwEnableFlags, sizeof(DWORD), &dwRead);
    }
    m_pBSDFile->Read(&m_EffectDOFParam, sizeof(A3DPOST_EFFECT_DOF_PARAM), &dwRead);
    m_pBSDFile->Read(&m_EffectBloomParamDay, sizeof(A3DPOST_EFFECT_BLOOM_PARAM), &dwRead);
    m_pBSDFile->Read(&m_EffectFullGlowParamDay, sizeof(A3DPOST_EFFECT_FULLGLOW_PARAM), &dwRead);
    m_pBSDFile->Read(&m_EffectBloomParamNight, sizeof(A3DPOST_EFFECT_BLOOM_PARAM), &dwRead);
    m_pBSDFile->Read(&m_EffectFullGlowParamNight, sizeof(A3DPOST_EFFECT_FULLGLOW_PARAM), &dwRead);
    if (m_pScene->GetBSDFileVersion() >= 21)
    {
        struct A3DPOST_EFFECT_UNITED_WARP_PARAM
        {
            float	fScale;			//	扭曲大小
            float	fSpeed;			//	扭曲速度
        }paramWarp;

        m_pBSDFile->Read(&paramWarp, sizeof(A3DPOST_EFFECT_UNITED_WARP_PARAM), &dwRead);
        m_EffectWarpParam.fScale = paramWarp.fScale;
        m_EffectWarpParam.fSpeed = paramWarp.fSpeed;
        if (m_pScene->GetBSDFileVersion() >= 22)
        {
            m_pBSDFile->Read(&m_EffectWarpParam.bEnableMask, sizeof(bool), &dwRead);
            m_pBSDFile->ReadString(m_EffectWarpParam.strMaskTextureName);
        }
    }

    if (m_pScene->GetBSDFileVersion() >= 23)
    {
        /*
        struct _EDITOR_DATA_POST_EFFECT_CC_PARAM
        {
            float			fFactor;				//在两张映射贴图间过渡的值, 0~1
            bool			bUseManualParam1;		//是否使用人工设置的参数生成映射贴图
            bool			bUseManualParam2;		//是否使用人工设置的参数生成映射贴图
            bool			bAfterUI;
        } paramCC;


        m_pBSDFile->Read(&paramCC, sizeof(_EDITOR_DATA_POST_EFFECT_CC_PARAM), &dwRead);
        m_EffectCCParam.fFactor				= paramCC.fFactor;
        m_EffectCCParam.bUseManualParam1	= paramCC.bUseManualParam1;
        m_EffectCCParam.bUseManualParam2	= paramCC.bUseManualParam2;
        m_EffectCCParam.bAfterUI			= paramCC.bAfterUI;


        struct _EDITOR_DATA_POST_EFFECT_CC_MANUAL_PARAM
        {
            int nBright;						//亮度,		范围是[-100~100]
            int nContrast;						//对比度,	范围是[-100~100]
            int nHue;							//色相,		范围是[-180~180]
            int nSaturation;					//饱和度,		范围是[-100~100]
            bool bGrey;							//是否转换为灰度图
            bool bOpposition;					//是否反色
        };

        _EDITOR_DATA_POST_EFFECT_CC_MANUAL_PARAM paramCCM1,paramCCM2;

        m_pBSDFile->Read(&paramCCM1, sizeof(_EDITOR_DATA_POST_EFFECT_CC_MANUAL_PARAM), &dwRead);
        m_pBSDFile->Read(&paramCCM2, sizeof(_EDITOR_DATA_POST_EFFECT_CC_MANUAL_PARAM), &dwRead);

        m_EffectCCParam.manualParam1.nBright		= paramCCM1.nBright;
        m_EffectCCParam.manualParam1.nContrast		= paramCCM1.nContrast;
        m_EffectCCParam.manualParam1.nHue			= paramCCM1.nHue;
        m_EffectCCParam.manualParam1.nSaturation	= paramCCM1.nSaturation;
        m_EffectCCParam.manualParam1.bGrey			= paramCCM1.bGrey;
        m_EffectCCParam.manualParam1.bOpposition	= paramCCM1.bOpposition;

        m_EffectCCParam.manualParam2.nBright		= paramCCM2.nBright;
        m_EffectCCParam.manualParam2.nContrast		= paramCCM2.nContrast;
        m_EffectCCParam.manualParam2.nHue			= paramCCM2.nHue;
        m_EffectCCParam.manualParam2.nSaturation	= paramCCM2.nSaturation;
        m_EffectCCParam.manualParam2.bGrey			= paramCCM2.bGrey;
        m_EffectCCParam.manualParam2.bOpposition	= paramCCM2.bOpposition;

        AString			szTex1;
        AString			szTex2;
        m_pBSDFile->ReadString(szTex1);
        m_pBSDFile->ReadString(szTex2);

        if (paramCC.bUseManualParam1) m_EffectCCParam.szTex1 = szTex1;
        if (paramCC.bUseManualParam2) m_EffectCCParam.szTex2 = szTex2;
        */
    }

    return true;
}

void CECSceneBlock::UnloadGrasses()
{
	m_dwResFlags &= ~(1 << SCNRES_GRASS);

	if (!m_aGrassIDs.GetSize())
		return;

	//	Release all grass areas in this block area
	for (int i=0; i < m_aGrassIDs.GetSize(); i++)
		m_pScene->ReleaseSceneObject(m_aGrassIDs[i]);

	m_aGrassIDs.RemoveAll(false);
}

void CECSceneBlock::UnloadWater()
{
	m_dwResFlags &= ~(1 << SCNRES_WATER);

	if (!m_aWaterIDs.GetSize())
		return;

	//	Remove all water in this block area
	for (int i=0; i < m_aWaterIDs.GetSize(); i++)
		m_pScene->ReleaseSceneObject(m_aWaterIDs[i]);

	m_aWaterIDs.RemoveAll(false);
}

void CECSceneBlock::UnloadOrnaments()
{
	m_dwResFlags &= ~(1 << SCNRES_BUILDING);

	if (!m_aOrnamentIDs.GetSize())
		return;

	CECOrnamentMan* pOnmtMan = m_pScene->GetWorld()->GetOrnamentMan();

	//	Release all ornaments in this block area
	for (int i=0; i < m_aOrnamentIDs.GetSize(); i++)
		m_pScene->ReleaseSceneObject(m_aOrnamentIDs[i]);

	m_aOrnamentIDs.RemoveAll(false);
}

void CECSceneBlock::UnloadBoxAreas()
{
	m_dwResFlags &= ~(1 << SCNRES_BOXAREA);

	if (!m_aBoxAreaIDs.GetSize())
		return;

	//	Release all box area in this block area
	for (int i=0; i < m_aBoxAreaIDs.GetSize(); i++)
		m_pScene->ReleaseSceneObject(m_aBoxAreaIDs[i]);

	m_aBoxAreaIDs.RemoveAll(false);
}

void CECSceneBlock::UnloadEffects()
{
	m_dwResFlags &= ~(1 << SCNRES_EFFECT);

	if (!m_aEffectIDs.GetSize())
		return;

	CECOrnamentMan* pOnmtMan = m_pScene->GetWorld()->GetOrnamentMan();

	//	Release all effects in this block area
	for (int i=0; i < m_aEffectIDs.GetSize(); i++)
		pOnmtMan->ReleaseEffect(m_aEffectIDs[i]);

	m_aEffectIDs.RemoveAll(false);
}

void CECSceneBlock::UnloadECModels()
{
	m_dwResFlags &= ~(1 << SCNRES_ECMODEL);

	if (!m_aECModelIDs.GetSize())
		return;

	CECOrnamentMan* pOnmtMan = m_pScene->GetWorld()->GetOrnamentMan();

	//	Release all ECModels in this block area
	for (int i=0; i < m_aECModelIDs.GetSize(); i++)
		pOnmtMan->ReleaseECModel(m_aECModelIDs[i]);

	m_aECModelIDs.RemoveAll(false);
}

void CECSceneBlock::UnloadCritterGroups()
{
	m_dwResFlags &= ~(1 << SCNRES_CRITTER);

	if (!m_aCritterIDs.GetSize())
		return;

	//	Release all critters in this block area
	for (int i=0; i < m_aCritterIDs.GetSize(); i++)
		m_pScene->ReleaseSceneObject(m_aCritterIDs[i]);

	m_aCritterIDs.RemoveAll();
}

void CECSceneBlock::UnloadBeziers()
{
	m_dwResFlags &= ~(1 << SCNRES_BEZIER);

	if (!m_aBezierIDs.GetSize())
		return;

	//	Release all bezier in this block area
	for (int i=0; i < m_aBezierIDs.GetSize(); i++)
		m_pScene->ReleaseSceneObject(m_aBezierIDs[i]);

	m_aBezierIDs.RemoveAll();
}

void CECSceneBlock::UnloadSounds()
{
	m_dwResFlags &= ~(1 << SCNRES_SOUND);

	if (!m_aSoundIDs.GetSize())
		return;

	CECOrnamentMan* pOnmtMan = m_pScene->GetWorld()->GetOrnamentMan();

	//	Release all sound objects in this block area
	for (int i=0; i < m_aSoundIDs.GetSize(); i++)
		pOnmtMan->ReleaseSoundObject(m_aSoundIDs[i]);

	m_aSoundIDs.RemoveAll();
}

void CECSceneBlock::UnloadMirrors()
{
    m_dwResFlags &= ~(1 << SCNRES_MIRROR);

    if (!m_aMirrorIDs.GetSize())
        return;

    //	Remove all water in this block area
    for (int i=0; i < m_aMirrorIDs.GetSize(); i++)
        m_pScene->ReleaseSceneObject(m_aMirrorIDs[i]);

    m_aMirrorIDs.RemoveAll(false);
}

//	Update block resources
//	fDist: distance between block center and world's loading center
bool CECSceneBlock::UpdateRes(float fDist)
{
	float fHalfBlkSize = m_fBlockSize * 0.5f;

	for (int i=0; i < NUM_SCNRESTYPE; i++)
	{
		bool bDel=false, bAdd=false;

        if (i == SCNRES_BUILDING)
        {
            if (fDist > max(m_aResLoadDist[i], m_Info.fMaxLoadRadius) + fHalfBlkSize)
    			bDel = true;
    		else if (fDist <= max(m_aResLoadDist[i], m_Info.fMaxLoadRadius))
    			bAdd = true;
        }
        else
        {
    		if (fDist > m_aResLoadDist[i] + fHalfBlkSize)
    			bDel = true;
    		else if (fDist <= m_aResLoadDist[i])
    			bAdd = true;
        }

		if (bDel && (m_dwResFlags & (1 << i)))
		{
			switch (i)
			{
			case SCNRES_WATER:		UnloadWater();			break;
			case SCNRES_BUILDING:	UnloadOrnaments();		break;
			case SCNRES_BOXAREA:	UnloadBoxAreas();		break;
			case SCNRES_GRASS:		UnloadGrasses();		break;
			case SCNRES_EFFECT:		UnloadEffects();		break;
			case SCNRES_ECMODEL:	UnloadECModels();		break;
			case SCNRES_CRITTER:	UnloadCritterGroups();	break;
			case SCNRES_BEZIER:		UnloadBeziers();		break;
			case SCNRES_SOUND:		UnloadSounds();			break;
			case SCNRES_MIRROR:		UnloadMirrors();		break;
			}
		}

		if (bAdd && !(m_dwResFlags & (1 << i)) && m_pWorldFile)
		{
			m_pWorldFile->Seek(m_aDataOffs[i], AFILE_SEEK_SET);

			switch (i)
			{
			case SCNRES_WATER:		LoadWater(m_Info.iNumWater, false);				break;
			case SCNRES_BUILDING:	LoadOrnaments(m_Info.iNumOrnament, false);		break;
			case SCNRES_BOXAREA:	LoadBoxAreas(m_Info.iNumBoxArea, false);		break;
			case SCNRES_GRASS:		LoadGrasses(m_Info.iNumGrass, false);			break;
			case SCNRES_EFFECT:		LoadEffects(m_Info.iNumEffect, false);			break;
			case SCNRES_ECMODEL:	LoadECModels(m_Info.iNumECModel, false);		break;
			case SCNRES_CRITTER:	LoadCritterGroups(m_Info.iNumCritter, false);	break;
			case SCNRES_BEZIER:		LoadBeziers(m_Info.iNumBezier, false);			break;
			case SCNRES_SOUND:		LoadSounds(m_Info.iNumSound, false);			break;
			case SCNRES_MIRROR:		LoadMirrors(m_Info.iNumMirror, false);			break;
			}
		}
	}

	return true;
}

//	Set resource loading distance
void CECSceneBlock::SetResLoadDists(int iScheme)
{
    CECWorld *pWorld = g_pGame->GetGameRun()->GetCurWorld();
    if (pWorld)
    {
	    switch (iScheme)
	    {
	    case 0:	//	Login scheme
	    {
		    //	Set all distance to a very far value, so that all resource can be
		    //	loaded immediately
		    for (int i=0; i < NUM_SCNRESTYPE; i++)
			    m_aResLoadDist[i] = 1500.0f;

		    g_pGame->GetViewport()->GetA3DCamera()->SetProjectionParam(-1.0f, -1.0f, 2000.0f, -1.0f);
		    m_fFogTimes = 1.0f;
		    break;
	    }

	    case 1:	//	In game scheme - near mode
		    m_aResLoadDist[SCNRES_TREE]		= 100.0f;
		    m_aResLoadDist[SCNRES_WATER]	= 600.0f;
		    m_aResLoadDist[SCNRES_BUILDING] = 60.0f;
		    m_aResLoadDist[SCNRES_BOXAREA]	= 300.0f;
		    m_aResLoadDist[SCNRES_GRASS]	= 40.0f;
		    m_aResLoadDist[SCNRES_EFFECT]	= 60.0f;
		    m_aResLoadDist[SCNRES_ECMODEL]	= 60.0f;
		    m_aResLoadDist[SCNRES_CRITTER]	= 60.0f;
		    m_aResLoadDist[SCNRES_BEZIER]	= 300.0f;
		    m_aResLoadDist[SCNRES_SOUND]	= 30.0f;
		    m_aResLoadDist[SCNRES_MIRROR]	= 60.0f;

		    g_pGame->GetViewport()->GetA3DCamera()->SetProjectionParam(-1.0f, -1.0f, 1000.0f, -1.0f);

		    m_fFogTimes = 0.5f;
		    break;

	    case 2:
		    m_aResLoadDist[SCNRES_TREE]		= 125.0f;
		    m_aResLoadDist[SCNRES_WATER]	= 600.0f;
		    m_aResLoadDist[SCNRES_BUILDING] = 80.0f;
		    m_aResLoadDist[SCNRES_BOXAREA]	= 300.0f;
		    m_aResLoadDist[SCNRES_GRASS]	= 80.0f;
		    m_aResLoadDist[SCNRES_EFFECT]	= 80.0f;
		    m_aResLoadDist[SCNRES_ECMODEL]	= 80.0f;
		    m_aResLoadDist[SCNRES_CRITTER]	= 80.0f;
		    m_aResLoadDist[SCNRES_BEZIER]	= 300.0f;
		    m_aResLoadDist[SCNRES_SOUND]	= 30.0f;
		    m_aResLoadDist[SCNRES_MIRROR]	= 80.0f;

		    g_pGame->GetViewport()->GetA3DCamera()->SetProjectionParam(-1.0f, -1.0f, 1000.0f, -1.0f);

		    m_fFogTimes = 0.6f;
		    break;

	    case 3:	
		    m_aResLoadDist[SCNRES_TREE]		= 150.0f;
		    m_aResLoadDist[SCNRES_WATER]	= 600.0f;
		    m_aResLoadDist[SCNRES_BUILDING] = 100.0f;
		    m_aResLoadDist[SCNRES_BOXAREA]	= 300.0f;
		    m_aResLoadDist[SCNRES_GRASS]	= 40.0f;
		    m_aResLoadDist[SCNRES_EFFECT]	= 100.0f;
		    m_aResLoadDist[SCNRES_ECMODEL]	= 100.0f;
		    m_aResLoadDist[SCNRES_CRITTER]	= 100.0f;
		    m_aResLoadDist[SCNRES_BEZIER]	= 300.0f;
		    m_aResLoadDist[SCNRES_SOUND]	= 60.0f;
		    m_aResLoadDist[SCNRES_MIRROR]	= 100.0f;

		    g_pGame->GetViewport()->GetA3DCamera()->SetProjectionParam(-1.0f, -1.0f, 1000.0f, -1.0f);

		    m_fFogTimes = 0.7f;
		    break;

	    case 4:	
		    m_aResLoadDist[SCNRES_TREE]		= 150.0f;
		    m_aResLoadDist[SCNRES_WATER]	= 600.0f;
		    m_aResLoadDist[SCNRES_BUILDING] = 120.0f;
		    m_aResLoadDist[SCNRES_BOXAREA]	= 300.0f;
		    m_aResLoadDist[SCNRES_GRASS]	= 40.0f;
		    m_aResLoadDist[SCNRES_EFFECT]	= 120.0f;
		    m_aResLoadDist[SCNRES_ECMODEL]	= 120.0f;
		    m_aResLoadDist[SCNRES_CRITTER]	= 120.0f;
		    m_aResLoadDist[SCNRES_BEZIER]	= 300.0f;
		    m_aResLoadDist[SCNRES_SOUND]	= 60.0f;
		    m_aResLoadDist[SCNRES_MIRROR]	= 120.0f;

		    g_pGame->GetViewport()->GetA3DCamera()->SetProjectionParam(-1.0f, -1.0f, 1000.0f, -1.0f);

		    m_fFogTimes = 0.8f;
		    break;

	    case 5:	//	In game scheme - middle mode

		    m_aResLoadDist[SCNRES_TREE]		= 300.0f;
		    m_aResLoadDist[SCNRES_WATER]	= 1000.0f;
		    m_aResLoadDist[SCNRES_BUILDING] = 160.0f;
		    m_aResLoadDist[SCNRES_BOXAREA]	= 500.0f;
		    m_aResLoadDist[SCNRES_GRASS]	= 55.0f;
		    m_aResLoadDist[SCNRES_EFFECT]	= 160.0f;
		    m_aResLoadDist[SCNRES_ECMODEL]	= 160.0f;
		    m_aResLoadDist[SCNRES_CRITTER]	= 160.0f;
		    m_aResLoadDist[SCNRES_BEZIER]	= 600.0f;
		    m_aResLoadDist[SCNRES_SOUND]	= 80.0f;
		    m_aResLoadDist[SCNRES_MIRROR]	= 160.0f;

		    g_pGame->GetViewport()->GetA3DCamera()->SetProjectionParam(-1.0f, -1.0f, 1000.0f, -1.0f);

		    m_fFogTimes = 1.0f;
		    break;
	    }
    }
}
