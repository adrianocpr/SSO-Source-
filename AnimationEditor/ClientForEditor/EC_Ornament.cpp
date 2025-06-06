/*
 * FILE: EC_Ornament.cpp
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Duyuxin, 2004/10/18
 *
 * HISTORY: 
 *
 * Copyright (c) 2004 Archosaur Studio, All Rights Reserved.
 */

#include "StdAfx.h"
#include "EC_Global.h"
#include "EC_Ornament.h"
#include "EC_Game.h"
#include "EC_WorldFile.h"
#include "EC_Scene.h"
#include "EL_BrushBuilding.h"
#include "EC_SceneLoader.h"
#include "EC_GameRun.h"
#include "EC_World.h"
#include "EC_ManOrnament.h"
#include "EC_BrushMan.h"
#include "EC_TriangleMan.h"
#include "EC_Utility.h"
#include "EC_Configs.h"

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


///////////////////////////////////////////////////////////////////////////
//	
//	Local functions
//	
///////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////
//	
//	Implement CECOrnament
//	
///////////////////////////////////////////////////////////////////////////

CECOrnament::CECOrnament(CECOrnamentMan* pOrnamentMan) : CECSceneObject(TYPE_ORNAMENT)
{
	m_pOnmtMan	= pOrnamentMan;
	m_dwOnmtID	= 0;
	m_pBrushBuilding = NULL;
	m_bReflect	= false;
	m_bRefract	= false;
	m_bOptimize	= false;

	m_bAboveWater = false;
	m_bUnderWater = false;

	m_bAddedToBrushMan = false;
	m_bAddedToTriMan = false;
}

CECOrnament::~CECOrnament()
{
}

//	Load ornament data from file
bool CECOrnament::Load(CECScene* pScene, const char* szMapPath, float fOffX, float fOffZ)
{
	ASSERT(!m_pBrushBuilding);

	if (pScene->GetSceneFileVersion() < 4)
	{
		DWORD dwRead;
		ECWDFILEORNAMENT Data;
		AFileImage* pFile = pScene->GetSceneFile();

		if (!pFile->Read(&Data, sizeof (Data), &dwRead))
			return false;

		AString strModelFile;
		if (!pFile->ReadString(strModelFile))
			return false;

		//	Load model from file
		const char* pTemp = strrchr(strModelFile, '\\');
		pTemp = pTemp ? pTemp+1 : strModelFile;
		AString strFile;
		strFile.Format(_EA("%s\\%s"), szMapPath, pTemp);

		SetPos(A3DVECTOR3(Data.vPos[0]+fOffX, Data.vPos[1], Data.vPos[2]+fOffZ));
		SetDirAndUp(A3DVECTOR3(Data.vDir[0], Data.vDir[1], Data.vDir[2]), 
					A3DVECTOR3(Data.vUp[0], Data.vUp[1], Data.vUp[2]));

		return true;
	}

	//	pScene->GetSceneFileVersion() >= 4
	ECBSDFILEORNAMENT16 Data;
	DWORD dwRead;
	AFileImage* pFile = pScene->GetBSDFile();
	AString strModelFile;

	if (pScene->GetBSDFileVersion() < 13)
	{
		ECBSDFILEORNAMENT TempData;
		if (!pFile->Read(&TempData, sizeof (TempData), &dwRead))
			return false;

		if (!pFile->ReadString(strModelFile))
			return false;

		memcpy(&Data, &TempData, sizeof (TempData));

		Data.bOptimize = false;
		Data.iFeetSound = 0;
	}
	else if (pScene->GetBSDFileVersion() < 16)
	{
		ECBSDFILEORNAMENT13 TempData;
		if (!pFile->Read(&TempData, sizeof (TempData), &dwRead))
			return false;
		
		if (!pFile->ReadString(strModelFile))
			return false;
		
		memcpy(&Data, &TempData, sizeof (TempData));
		
		Data.iFeetSound = 0;
	}
	else	//	if (pScene->GetBSDFileVersion() >= 16)
	{
		if (!pFile->Read(&Data, sizeof (Data), &dwRead))
			return false;

		if (!pFile->ReadString(strModelFile))
			return false;
	}

	m_bReflect	= Data.bReflect;
	m_bRefract	= Data.bRefract;
	m_bOptimize	= Data.bOptimize;

	//	Build building file name
	if (pScene->GetSceneFileFlags() == ECWFFLAG_EDITOREXP)
	{
		//	Scene file created by ElementEditor
		if (pScene->GetBSDFileVersion() < 12)
		{
			//	Discard the first 'LitModels\' characters in strModelFile
			const char* pTemp = strrchr(strModelFile, '\\');
			pTemp = pTemp ? pTemp+1 : strModelFile;
			m_strFileToLoad.Format(_EA("%s\\%s"), szMapPath, pTemp);
		}
		else
			m_strFileToLoad.Format(_EA("%s\\%s"), szMapPath, strModelFile);
	}
	else	//	Scene file created by in-game home editor
	{
		m_strFileToLoad.Format(_EA("%s\\%s"), szMapPath, strModelFile);
	}

	m_vReservedPos.Set(Data.vPos[0]+fOffX, Data.vPos[1], Data.vPos[2]+fOffZ);
	m_vReservedDir.Set(Data.vDir[0], Data.vDir[1], Data.vDir[2]);
	m_vReservedUp.Set(Data.vUp[0], Data.vUp[1], Data.vUp[2]);

	QueueLoadInThread(static_cast<CECSceneThreadObj*>(this));

	return true;
}

void CECOrnament::LoadInThread(bool bInLoaderThread)
{
	// the map file take the model as .lmd, but we in fact export a .bmd file, so change it here.
	char * pBuffer = m_strFileToLoad.GetBuffer(0);
	pBuffer[strlen(pBuffer) - 3] = 'b';

	m_pBrushBuilding = new CELBrushBuilding();

	if (!m_pBrushBuilding->Load(g_pGame->GetA3DDevice(), pBuffer))
	{
		m_pBrushBuilding->Release();
		delete m_pBrushBuilding;
		m_pBrushBuilding = NULL;

		a_LogOutput(1, "CECOrnament::LoadInThread, Load %s failed!", pBuffer);
		g_dwFatalErrorFlag = FATAL_ERROR_LOAD_BUILDING;
		return;		
	}

	if( !bInLoaderThread )
		m_pBrushBuilding->Tick(BUILDING_FADE_IN_TIME + 1);

	SetPos(m_vReservedPos);
	SetDirAndUp(m_vReservedDir, m_vReservedUp);
	
	// now determine whether or not this build need reflect or refract
	A3DAABB aabb = m_pBrushBuilding->GetModelAABB();
	float vWaterHeight = g_pGame->GetGameRun()->GetCurWorld()->GetTerrainWater()->GetWaterHeight(aabb.Center);
	if( vWaterHeight < aabb.Maxs.y )
		m_bAboveWater = true;
	if( vWaterHeight > aabb.Mins.y )
		m_bUnderWater = true;

	if (!bInLoaderThread)
	{
#ifdef USING_BRUSH_MAN
		m_pOnmtMan->GetBrushMan()->AddProvider(m_pBrushBuilding);
		m_bAddedToBrushMan = true;
#endif

#ifdef USING_TRIANGLE_MAN
		if (m_pOnmtMan->UsingTriangleMan())
		{
			m_pOnmtMan->GetTriangleMan()->AddProvider(m_pBrushBuilding);
			m_bAddedToTriMan = true;
		}
#endif
	}
}

//	Release object
void CECOrnament::Release()
{
	if( m_pBrushBuilding )
	{
		m_pBrushBuilding->Release();
		delete m_pBrushBuilding;
		m_pBrushBuilding = NULL;
	}
}

void CECOrnament::ReleaseInThread()
{
	Release();
}

//	Set absolute position
void CECOrnament::SetPos(const A3DVECTOR3& vPos)
{
	m_vPos = vPos;

	/*
	if (m_pBuilding)
		m_pBuilding->SetPos(vPos);
	*/
}

//	Set absolute forward and up direction
void CECOrnament::SetDirAndUp(const A3DVECTOR3& vDir, const A3DVECTOR3& vUp)
{
	m_vDir	= vDir;
	m_vUp	= vUp;

	/*
	if (m_pBuilding)
		m_pBuilding->SetDirAndUp(vDir, vUp);
	*/
}

//	Tick routine
bool CECOrnament::Tick(DWORD dwDeltaTime)
{
	if (IsLoaded() && m_pBrushBuilding)
	{
		m_pBrushBuilding->Tick(dwDeltaTime);

		if (!m_bAddedToBrushMan)
		{
#ifdef USING_BRUSH_MAN
			m_pOnmtMan->GetBrushMan()->AddProvider(m_pBrushBuilding);
			m_bAddedToBrushMan = true;
#endif
		}

		if (!m_bAddedToTriMan && m_pOnmtMan->UsingTriangleMan())
		{
#ifdef USING_TRIANGLE_MAN
			m_pOnmtMan->GetTriangleMan()->AddProvider(m_pBrushBuilding);
			m_bAddedToTriMan = true;
#endif
		}
	}

	return true;
}

//	Render routine
bool CECOrnament::Render(CECViewport* pViewport)
{
    if (IsLoaded() && m_pBrushBuilding)
    {
        //if( g_pGame->GetConfigs()->GetSystemSettings().nSceneDetail == 1 || m_pBrushBuilding->GetBrushCount() > 0 )
        m_pBrushBuilding->Render(pViewport->GetA3DViewport());
    }
    
    return true;
}

