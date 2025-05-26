/*
 * FILE: EL_BrushBuilding.cpp
 *
 * DESCRIPTION: building using brush for cd, only used in element client
 *
 * CREATED BY: Hedi, 2005/8/23
 *
 * HISTORY: 
 *
 * Copyright (c) 2005 Archosaur Studio, All Rights Reserved.
 */

#include "StdAfx.h"
#include "A3DTypes.h"
#include "A3DFuncs.h"
#include "A3DFrame.h"
#include "A3DMesh.h"
#include "A3DLitModel.h"
#include "AFile.h"
#include "AFileImage.h"
#include "A3DDevice.h"
#include "A3DEngine.h"
#include "A3DCollision.h"
#include "A3DTexture.h"
#include "A3DStream.h"
#include "A3DTextureMan.h"

#include "EL_BrushBuilding.h"
#include "CDWithCH.h"
#include "aabbcd.h"

#include "EC_Global.h"
#include "EC_Game.h"
#include "A3DLight.h"
#include "ConvexHullArchive.h"

CELBrushBuilding::CELBrushBuilding()
{
	m_pA3DDevice		= NULL;
	m_pA3DLitModel		= NULL;

	m_nNumHull			= 0;
	m_dwTimeLived		= 0;

	m_bCollideOnly		= false;
}

CELBrushBuilding::~CELBrushBuilding()
{
}

bool CELBrushBuilding::Init(A3DDevice * pA3DDevice)
{
	m_pA3DDevice = pA3DDevice;
	m_dwTimeLived = 0;
	return true;
}

bool CELBrushBuilding::Release()
{
	ReleaseCDBrushes();

	if( m_pA3DLitModel )
	{
		m_pA3DLitModel->Release();
		delete m_pA3DLitModel;
		m_pA3DLitModel = NULL;
	}

	m_bCollideOnly = false;
	m_nNumHull = 0;
	m_dwTimeLived = 0;
	return true;
}

bool CELBrushBuilding::ReleaseCDBrushes()
{
	int i;
	for( i=0; i<m_nNumHull; i++)
	{
		if( m_CDBrushes[i] )
		{
			delete m_CDBrushes[i];
			m_CDBrushes[i] = NULL;
		}
	}

	m_CDBrushes.clear();
	m_nNumHull = 0;

	for( i=0; i<(int)m_ConvexHullData.size(); i++)
	{
		delete m_ConvexHullData[i];
		m_ConvexHullData[i] = NULL;
	}
	m_ConvexHullData.clear();
	
	return true;
}

bool CELBrushBuilding::Tick(DWORD dwDeltaTime)
{
	// no alpha now, for on GF2 alpha mesh cost a lot.
	if( m_pA3DDevice && !m_pA3DDevice->TestPixelShaderVersion(1, 1) )
		return true;
	
	if( m_dwTimeLived > BUILDING_FADE_IN_TIME )
	{
		m_dwTimeLived += dwDeltaTime;
		return true;
	}

	m_dwTimeLived += dwDeltaTime;
	int nAlpha = m_dwTimeLived * 255 / BUILDING_FADE_IN_TIME;
	if( nAlpha > 255 )
		nAlpha = 255;

	// now set alpha to all building meshes.
	if( m_pA3DLitModel )
	{
		int nNumMeshes = m_pA3DLitModel->GetNumMeshes();
		for(int i=0; i<nNumMeshes; i++)
		{
			A3DLitMesh * pMesh = m_pA3DLitModel->GetMesh(i);
			if( pMesh )
				pMesh->SetAlphaValue(nAlpha);
		}
	}
	return true;
}

bool CELBrushBuilding::Render(A3DViewport * pViewport, bool bRenderAlpha)
{
	if( m_pA3DLitModel )
		m_pA3DLitModel->Render(pViewport);
	return true;
}

bool CELBrushBuilding::RenderPost(A3DViewport * pViewport)
{
	RenderConvexHull(NULL);
	return true;
}

bool CELBrushBuilding::RenderConvexHull(A3DViewport * pViewport)
{
	for(int i=0; i<(int)m_ConvexHullData.size(); i++)
	{
		if(m_ConvexHullData[i]->GetFlags() & CHDATA_NPC_CANNOT_PASS)
			m_ConvexHullData[i]->Render(m_pA3DDevice->GetA3DEngine()->GetA3DFlatCollector(), FALSE, NULL, 0x00000000, 0xa0ff0000);
		else
			m_ConvexHullData[i]->Render(m_pA3DDevice->GetA3DEngine()->GetA3DFlatCollector(), FALSE, NULL, 0x00000000, 0xffffff00);
	}

	return true;
}

// Load cd brushes
bool CELBrushBuilding::LoadCDBrushes(AFile * pFileToLoad)
{
	int i;
	for(i=0; i<m_nNumHull; i++)
	{
		CCDBrush * pCDBrush = new CCDBrush();
		if( !m_arBrush.LoadBrush(*pFileToLoad, pCDBrush))
			return false;
		m_CDBrushes.push_back(pCDBrush);
	}

	return true;
}

// Save convex hull data
bool CELBrushBuilding::SaveCDBrushes(AFile * pFileToSave)
{
	int i;
	for(i=0; i<m_nNumHull; i++)
	{
		if( !m_arBrush.SaveBrush(*pFileToSave, m_CDBrushes[i]))
			return false;
	}

	return true;
}

// Load and Save
bool CELBrushBuilding::Save(const char * szFileName)
{
	AFile fileToSave;

	if( !fileToSave.Open(szFileName, AFILE_CREATENEW | AFILE_BINARY) )
		return false;

	if( !Save(&fileToSave) )
		return false;

	fileToSave.Close();
	return true;
}

bool CELBrushBuilding::Save(AFile * pFileToSave)
{
	DWORD dwWrittenLen;

	DWORD version = ELBRUSHBUILDING_VERSION;
	if( !pFileToSave->Write(&version, sizeof(DWORD), &dwWrittenLen) )
		return false;

	if( !pFileToSave->Write(&m_bCollideOnly, sizeof(bool), &dwWrittenLen) )
		return false;

	if( !m_pA3DLitModel->Save(pFileToSave) )
		return false;

	if (!pFileToSave->WriteString(m_strChfPath))
		return false;

	return true;
}

bool CELBrushBuilding::Load(A3DDevice * pA3DDevice, const char * szFileName)
{
	AFileImage fileToLoad;

	if( !fileToLoad.Open(szFileName, AFILE_OPENEXIST | AFILE_BINARY) )
		return false;

	if( !Load(pA3DDevice, &fileToLoad) )
		return false;

	fileToLoad.Close();
	return true;
}

bool CELBrushBuilding::Load(A3DDevice * pA3DDevice, AFile * pFileToLoad)
{
	m_pA3DDevice = pA3DDevice;

	// try to release old ones.
	Release();

	DWORD dwReadLen;
	// first test if the file version is correct.
	DWORD	version;

	if( !pFileToLoad->Read(&version, sizeof(DWORD), &dwReadLen) )
		return false;

	bool bCollideOnly = false;
	if( version >= 0x80000001 )
	{
		if( !pFileToLoad->Read(&bCollideOnly, sizeof(bool), &dwReadLen) )
			return false;
	}
	else
	{
		pFileToLoad->Seek(-int(sizeof(DWORD)), AFILE_SEEK_CUR);
	}

	// then load lit model and convex hull data
	m_pA3DLitModel = new A3DLitModel();
	if( !m_pA3DLitModel->Load(pA3DDevice, pFileToLoad) )
	{
		Release();
		a_LogOutput(1, _EA("CELBrushBuilding::Load, Failed to load litmodel file : %s."), pFileToLoad->GetFileName());
		return false;
	}
	m_pA3DLitModel->NormalizeTransforms();

#ifdef LM_BUMP_ENABLE
	// test only, 
	m_pA3DLitModel->SetLightInfo(g_pGame->GetDirLight()->GetLightparam(), g_pGame->GetDirLight()->GetLightparam());
#endif

	if (version < 0x80000002)
	{
		if (!m_arBrush.LoadHeader(*pFileToLoad))  
			return true;

		m_nNumHull = m_arBrush.GetNumHull(); 

		if( !LoadCDBrushes(pFileToLoad) )
		{
			Release();
			a_LogOutput(1, _EA("CELBrushBuilding::Load, Failed to call LoadCDBrushes : %s."), pFileToLoad->GetFileName());
			return false;
		}
	}
	else
	{
		pFileToLoad->ReadString(m_strChfPath);
		if (m_strChfPath.IsEmpty() || !af_IsFileExist(m_strChfPath))
			goto RET;
		//load convex hull data
		if (!LoadChf(m_strChfPath))
			goto RET;
	}

	SetCollideOnly(bCollideOnly);
	// now call once tick to make alpha value of all meshes correct.

RET:
#ifndef _MODEDITOREX
	Tick(0);
#endif
	return true;
}

bool CELBrushBuilding::LoadChf(const char* szChf)
{
	AFileImage af;
	bool bRet = af.Open(szChf, AFILE_BINARY|AFILE_OPENEXIST);
	if (!bRet)
		return false;

	ReleaseCDBrushes();
	CHBasedCD::ConvexHullArchive ar;
	bRet = ar.LoadHeader(af);
	if (!bRet)
		return false;

	A3DMATRIX4 mat = ::a3d_TransformMatrix(m_pA3DLitModel->GetDir(), m_pA3DLitModel->GetUp(), m_pA3DLitModel->GetPos());
	A3DVECTOR3 vScale = m_pA3DLitModel->GetScale();
	mat = ::a3d_Scaling(vScale.x, vScale.y, vScale.z) * mat;
	for (int i = 0; i < ar.GetNumHull(); i++)
	{
		CConvexHullData * pHullData = new CConvexHullData();
		if( !ar.LoadHull(af, pHullData))
		{
			delete pHullData;
			pHullData = NULL;
			return false;
		}

		if (pHullData->GetFaceNum() == 0)
		{
			delete pHullData;
			pHullData = NULL;
			continue;
		}
		
		pHullData->Transform(mat);
		CQBrush qbrush;
		if (!qbrush.AddBrushBevels(pHullData))
		{
			delete pHullData;
			pHullData = NULL;
			return false;
		}
		CCDBrush * pCDBrush = new CCDBrush();
		qbrush.Export(pCDBrush);
		m_CDBrushes.push_back(pCDBrush);

		if (g_pGame->GetBrushDebug())
		{
			m_ConvexHullData.push_back(pHullData);
		}
		else
		{
			delete pHullData;
			pHullData = NULL;
		}
		
		
	}
	m_nNumHull = (int)m_CDBrushes.size();
	return true;
}

A3DAABB CELBrushBuilding::GetModelAABB()
{
	if( m_pA3DLitModel )
		return m_pA3DLitModel->GetModelAABB();
	
	return A3DAABB(A3DVECTOR3(0.0f), A3DVECTOR3(0.0f));
}

bool CELBrushBuilding::TraceWithBrush(BrushTraceInfo * pInfo, bool bCheckCHFlags)
{

	// Expand the AABB of the model to handle the case that
	// convex hulls of the model protrude the AABB!
	A3DAABB aabb = GetModelAABB();
	aabb.Extents+=A3DVECTOR3(8.0f, 8.0f, 8.0f);
	aabb.CompleteMinsMaxs();

	A3DVECTOR3 vPoint, vNormal;
	float		fFraction;		//	Fraction
	
	if (pInfo->bIsPoint && !CLS_RayToAABB3(pInfo->vStart, pInfo->vDelta, aabb.Mins, aabb.Maxs, vPoint, &fFraction, vNormal ) ) {
		return false;
	}
	
	if (!pInfo->bIsPoint && !CLS_AABBAABBOverlap(aabb.Center, aabb.Extents, pInfo->BoundAABB.Center, pInfo->BoundAABB.Extents) ) {
		return false;
	}
	
	//save original result
	bool		bStartSolid = pInfo->bStartSolid;	//	Collide something at start point
	bool		bAllSolid = pInfo->bAllSolid;		//	All in something
	int			iClipPlane = pInfo->iClipPlane;		//	Clip plane's index
	
	fFraction = 100.0f;
	vNormal = pInfo->ClipPlane.GetNormal(); //clip plane normal
	float       fDist = pInfo->ClipPlane.GetDist();	//clip plane dist
//#define LOCAL_DEBUG
	
#ifdef LOCAL_DEBUG
	char msg[200];
	sprintf_s(msg, sizeof(msg) / sizeof(char), _EA(" %d") , m_CDBrushes.size());
	OutputDebugStringA(msg);
#endif

	// Detect the collision with Convex Hull
	bool bCollide = false;
	for(int i=0;i<(int)m_CDBrushes.size();i++)
	{
		if(bCheckCHFlags)
		{
			// Check the flags to test whether we skip current CDBrush!
			DWORD dwFlags = m_CDBrushes[i]->GetReservedDWORD();
            if ((pInfo->bIsPoint && (dwFlags & CHDATA_SKIP_RAYTRACE)) ||
                (!pInfo->bIsPoint && (dwFlags & CHDATA_SKIP_COLLISION)) ||
                (!pInfo->bIsPoint && pInfo->bSkipRayTrace && (dwFlags & CHDATA_SKIP_RAYTRACE)))
			{
				continue;
			}
		}

		if (m_CDBrushes[i]->Trace(pInfo) && (pInfo->fFraction < fFraction)) {
				//update the saving info
				bStartSolid = pInfo->bStartSolid;
				bAllSolid = pInfo->bAllSolid;
				iClipPlane = pInfo->iClipPlane;
				fFraction = pInfo->fFraction;
				vNormal = pInfo->ClipPlane.GetNormal();
				fDist = pInfo->ClipPlane.GetDist();

				bCollide = true;
		}
	}	
	if (bCollide) {
		pInfo->bStartSolid = bStartSolid;
		pInfo->bAllSolid = bAllSolid;
		pInfo->iClipPlane = iClipPlane;
		pInfo->fFraction = fFraction;
		pInfo->ClipPlane.SetNormal(vNormal);
		pInfo->ClipPlane.SetD(fDist);
	}
	return bCollide;
}

bool CELBrushBuilding::SetCollideOnly(bool bFlag)
{
	if( m_bCollideOnly == bFlag )
		return true;

	m_bCollideOnly = bFlag;

	if( m_bCollideOnly )
	{
		for(int i=0; i<m_nNumHull; i++)
		{
			m_CDBrushes[i]->SetReservedDWORD(m_CDBrushes[i]->GetReservedDWORD() | CHDATA_SKIP_RAYTRACE);
		}	
		if( m_pA3DLitModel )
			m_pA3DLitModel->SetVisibility(false);
	}
	else
	{
		for(int i=0; i<m_nNumHull; i++)
		{
			m_CDBrushes[i]->SetReservedDWORD(m_CDBrushes[i]->GetReservedDWORD() & (~CHDATA_SKIP_RAYTRACE));
		}	
		if( m_pA3DLitModel )
			m_pA3DLitModel->SetVisibility(true);
	}

	return true;
}