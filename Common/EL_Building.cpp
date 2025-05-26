/*
 * FILE: EL_Building.cpp
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Hedi, 2005/1/29
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

#include "EL_Building.h"
#include "ConvexHullData.h"
#include "CDWithCH.h"
#include "aabbcd.h"
#include "BrushArchive.h"

#ifdef ELB_CHECK_HULL 
extern ALog g_Log;
#endif


CELBuilding::CELBuilding()
{
	m_pA3DDevice		= NULL;
	m_pA3DLitModel		= NULL;

	m_bCollideOnly		= false;
	m_nNumHull			= 0;
	m_dwTimeLived		= 0;
}

CELBuilding::~CELBuilding()
{
}

bool CELBuilding::Init(A3DDevice * pA3DDevice)
{
	m_pA3DDevice = pA3DDevice;
	m_dwTimeLived = 0;
	return true;
}

bool CELBuilding::Release()
{
	ReleaseConvexHullData();

	if( m_pA3DLitModel )
	{
		m_pA3DLitModel->Release();
		delete m_pA3DLitModel;
		m_pA3DLitModel = NULL;
	}

	m_nNumHull = 0;
	m_dwTimeLived = 0;
	m_bCollideOnly = false;
	m_strChfPath.Empty();
	return true;
}

bool CELBuilding::ReleaseConvexHullData()
{
	for(int i=0; i<m_nNumHull; i++)
	{
		if( m_ConvexHullData[i] )
		{
			delete m_ConvexHullData[i];
			m_ConvexHullData[i] = NULL;
		}
		
		if (m_QBrushes[i])
		{
			delete m_QBrushes[i];
			m_QBrushes[i] = NULL;
		}

	}

	m_ConvexHullData.clear();
	m_QBrushes.clear();
	m_nNumHull = 0;
	return true;
}

bool CELBuilding::Tick(DWORD dwDeltaTime)
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

bool CELBuilding::Render(A3DViewport * pViewport, bool bRenderAlpha)
{
	if( m_pA3DLitModel )
		m_pA3DLitModel->Render(pViewport);

	return true;
}

bool CELBuilding::RenderConvexHull(A3DViewport * pViewport)
{
	for(int i=0; i<m_nNumHull; i++)
	{
		if(m_ConvexHullData[i]->GetFlags() & CHDATA_NPC_CANNOT_PASS)
			m_ConvexHullData[i]->Render(m_pA3DDevice->GetA3DEngine()->GetA3DFlatCollector(),FALSE, NULL,0x00000000, 0xa0ff0000);
		else
			m_ConvexHullData[i]->Render(m_pA3DDevice->GetA3DEngine()->GetA3DFlatCollector());
	}

	return true;
}

int CELBuilding::GetConvexHullFaceNum() const
{
	int num = 0;
	for(int i=0; i<m_nNumHull; i++)
	{
		num += m_ConvexHullData[i]->GetFaceNum();
	}
	return num;
}

// Load convex hull data
bool CELBuilding::LoadConvexHullData(AFile * pFileToLoad)
{
	int i;
	for(i=0; i<m_nNumHull; i++)
	{
		CConvexHullData * pHullData = new CConvexHullData();
		if( !m_arHull.LoadHull(*pFileToLoad, pHullData))
			return false;
		m_ConvexHullData.push_back(pHullData);
		CQBrush  * pQBrush = new CQBrush;
		pQBrush->AddBrushBevels(pHullData);
		m_QBrushes.push_back(pQBrush);

	}

	return true;
}

// Save convex hull data
bool CELBuilding::SaveConvexHullData(AFile * pFileToSave)
{
	int i;
	for(i=0; i<m_nNumHull; i++)
	{
		if( !m_arHull.SaveHull(*pFileToSave, m_ConvexHullData[i]))
			return false;
	}

	return true;
}

// Load and Save
bool CELBuilding::Save(const char * szFileName)
{
	AFile fileToSave;

	if( !fileToSave.Open(szFileName, AFILE_CREATENEW | AFILE_BINARY) )
		return false;

	if( !Save(&fileToSave) )
		return false;

	fileToSave.Close();
	return true;
}

bool CELBuilding::Save(AFile * pFileToSave)
{
	DWORD dwWrittenLen;

	DWORD version = ELBUILDING_VERSION;
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

bool CELBuilding::LoadChf()
{
	
	ReleaseConvexHullData();
	
	if (m_strChfPath.IsEmpty())
		return true;

	//if (bLoad)
	{
		if (m_nNumHull != 0)
			return true;// already load

		AFile af;
		if (!af.Open(m_strChfPath, AFILE_OPENEXIST|AFILE_BINARY))
		{
			//can not load chf
			return false;
		}

		if (!m_arHull.LoadHeader(af))
		{
			af.Close();
			return true;
		}
		m_nNumHull = m_arHull.GetNumHull();	

		if( !LoadConvexHullData(&af) )
		{
			af.Close();
			return false;
		}
		/*
		for (int i = 0; i < m_nNumHull; i++)
		{
		m_ConvexHullData[i]->Transform(m_pA3DLitModel->GetAbsoluteTM());
		}*/
		TransformHull(m_pA3DLitModel->GetAbsoluteTM());
		af.Close();
	}
	return true;
}

bool CELBuilding::Load(A3DDevice * pA3DDevice, const char * szFileName, bool bLoadChf)
{
	AFileImage fileToLoad;

	if( !fileToLoad.Open(szFileName, AFILE_OPENEXIST | AFILE_BINARY) )
		return false;

	if( !Load(pA3DDevice, &fileToLoad,bLoadChf) )
		return false;

	fileToLoad.Close();
	return true;
}

bool CELBuilding::Load(A3DDevice * pA3DDevice, AFile * pFileToLoad, bool bLoadChf)
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
		return false;

	if (version < 0x80000002)
	{
		if (!m_arHull.LoadHeader(*pFileToLoad))
			return true;	//	For compatability with old version
		m_nNumHull = m_arHull.GetNumHull();	

		if( !LoadConvexHullData(pFileToLoad) )
			return false;
	}
	else
	{
		pFileToLoad->ReadString(m_strChfPath);
		
		if(bLoadChf)
		{
			if (!LoadChf())
				return false;
		}

	}

#ifdef ELB_CHECK_HULL
	 CheckHull();
#endif
	// now clear the empty hulls.
	int i;
	for(i=0; i<(int)m_ConvexHullData.size(); )
	{
		if( m_ConvexHullData[i]->IsEmpty() )
		{
			m_ConvexHullData.erase(m_ConvexHullData.begin() + i, m_ConvexHullData.begin() + i + 1);
			m_QBrushes.erase(m_QBrushes.begin()+i, m_QBrushes.begin()+i +1);
		}
		else
			i ++;
	}
	m_nNumHull = m_ConvexHullData.size();

	SetCollideOnly(bCollideOnly);

	

	// now call once tick to make alpha value of all meshes correct.
#ifndef _MODEDITOREX
	Tick(0);
#endif
	return true;
}

//   separate mox file and chf file
bool CELBuilding::ExportBrushBuildingAndChf(const char * szFileName, const char* szChfFile)
{
	if (m_nNumHull > 0)
		SetChfPath(szChfFile);

	if (ExportBrushBuilding(szFileName)) 
	{
		if (m_nNumHull == 0)
			return true;

		AFile af;
		bool bRet = af.Open(szChfFile, AFILE_BINARY|AFILE_CREATENEW);
		if (!bRet)
			return false;
		

		m_arHull.SetNumHull(m_nNumHull);
		if (!m_arHull.SaveHeader(af))
		{
			af.Close();
			return false;	
		}

		bRet = SaveConvexHullData(&af);
		af.Close();

		return bRet;
	}
	return false;
}

// Load from seperate file
bool CELBuilding::LoadFromMOXAndCHF(A3DDevice * pA3DDevice, const char * szFileMox, const char * szFileCHF)
{
	m_pA3DDevice = pA3DDevice;

	// try to release old ones.
	Release();
 
	// then load lit model and convex hull data
	m_pA3DLitModel = new A3DLitModel();
	if( !m_pA3DLitModel->LoadFromMox(pA3DDevice, szFileMox) )
		return false;

	AFileImage fileToLoad;
	if( !fileToLoad.Open(szFileCHF, AFILE_OPENEXIST | AFILE_BINARY) )
	{
		// current we allow .chf missing
		fileToLoad.Close();
		return true;
	}

	if(!m_arHull.LoadHeader(fileToLoad))
		return false;
	m_nNumHull = m_arHull.GetNumHull();	

	if( !LoadConvexHullData(&fileToLoad) )
		return false;

	// now clear the empty hulls.
	int i;
	for(i=0; i<(int)m_ConvexHullData.size(); )
	{
		if( m_ConvexHullData[i]->IsEmpty() )
		{
			m_ConvexHullData.erase(m_ConvexHullData.begin() + i, m_ConvexHullData.begin() + i + 1);
			m_QBrushes.erase(m_QBrushes.begin()+i, m_QBrushes.begin()+i+1);
		}
		else
			i ++;
	}
	m_nNumHull = m_ConvexHullData.size();

	fileToLoad.Close();
	return true;
}

// Adjust scale factor
bool CELBuilding::SetScale(float vScale)
{
	if( !m_pA3DLitModel )
		return false;

	A3DMATRIX4 tmOld = m_pA3DLitModel->GetAbsoluteTM();

	m_pA3DLitModel->SetScale(vScale, vScale, vScale);

	A3DMATRIX4 tmNew = m_pA3DLitModel->GetAbsoluteTM();
	A3DMATRIX4 tm = InverseTM(tmOld) * tmNew;

	return TransformHull(tm);
}

// Direct Set the position and orientation methods
bool CELBuilding::SetPos(const A3DVECTOR3& vecPos)
{
	if( !m_pA3DLitModel )
		return false;

	A3DMATRIX4 tmOld = m_pA3DLitModel->GetAbsoluteTM();

	m_pA3DLitModel->SetPos(vecPos);

	A3DMATRIX4 tmNew = m_pA3DLitModel->GetAbsoluteTM();
	A3DMATRIX4 tm = InverseTM(tmOld) * tmNew;
	
	return TransformHull(tm);
}

bool CELBuilding::SetDirAndUp(const A3DVECTOR3& vecDir, const A3DVECTOR3& vecUp)
{
	if( !m_pA3DLitModel )
		return false;

	A3DMATRIX4 tmOld = m_pA3DLitModel->GetAbsoluteTM();

	m_pA3DLitModel->SetDirAndUp(vecDir, vecUp);

	A3DMATRIX4 tmNew = m_pA3DLitModel->GetAbsoluteTM();
	A3DMATRIX4 tm = InverseTM(tmOld) * tmNew;
	
	return TransformHull(tm);
}

// Relatively adjust orientation and position methods
bool CELBuilding::Move(const A3DVECTOR3& vecDeltaPos)
{
	if( !m_pA3DLitModel )
		return false;

	A3DMATRIX4 tmOld = m_pA3DLitModel->GetAbsoluteTM();

	m_pA3DLitModel->Move(vecDeltaPos);

	A3DMATRIX4 tmNew = m_pA3DLitModel->GetAbsoluteTM();
	A3DMATRIX4 tm = InverseTM(tmOld) * tmNew;

	return TransformHull(tm);
}

bool CELBuilding::RotateX(float vDeltaRad)
{
	if( !m_pA3DLitModel )
		return false;

	A3DMATRIX4 tmOld = m_pA3DLitModel->GetAbsoluteTM();

	m_pA3DLitModel->RotateX(vDeltaRad);

	A3DMATRIX4 tmNew = m_pA3DLitModel->GetAbsoluteTM();
	A3DMATRIX4 tm = InverseTM(tmOld) * tmNew;

	return TransformHull(tm);
}

bool CELBuilding::RotateY(float vDeltaRad)
{
	if( !m_pA3DLitModel )
		return false;

	A3DMATRIX4 tmOld = m_pA3DLitModel->GetAbsoluteTM();

	m_pA3DLitModel->RotateY(vDeltaRad);

	A3DMATRIX4 tmNew = m_pA3DLitModel->GetAbsoluteTM();
	A3DMATRIX4 tm = InverseTM(tmOld) * tmNew;

	return TransformHull(tm);
}

bool CELBuilding::RotateZ(float vDeltaRad)
{
	if( !m_pA3DLitModel )
		return false;

	A3DMATRIX4 tmOld = m_pA3DLitModel->GetAbsoluteTM();

	m_pA3DLitModel->RotateZ(vDeltaRad);

	A3DMATRIX4 tmNew = m_pA3DLitModel->GetAbsoluteTM();
	A3DMATRIX4 tm = InverseTM(tmOld) * tmNew;

	return TransformHull(tm);
}

A3DVECTOR3 CELBuilding::GetPos()
{
	if( m_pA3DLitModel )
		return m_pA3DLitModel->GetPos();
	
	return A3DVECTOR3(0.0f);
}

A3DVECTOR3 CELBuilding::GetDir()
{
	if( m_pA3DLitModel )
		return m_pA3DLitModel->GetDir();
	
	return A3DVECTOR3(0.0f, 0.0f, 1.0f);
}

A3DVECTOR3 CELBuilding::GetUp()
{
	if( m_pA3DLitModel )
		return m_pA3DLitModel->GetUp();
	
	return A3DVECTOR3(0.0f, 1.0f, 0.0f);
}

A3DVECTOR3 CELBuilding::GetScale()
{
	if( m_pA3DLitModel )
		return m_pA3DLitModel->GetScale();
	
	return A3DVECTOR3(1.0f, 1.0f, 1.0f);
}

A3DMATRIX4 CELBuilding::GetAbsoluteTM()
{
	if( m_pA3DLitModel )
		return m_pA3DLitModel->GetAbsoluteTM();
	
	return IdentityMatrix();
}

A3DAABB CELBuilding::GetModelAABB()
{
	if( m_pA3DLitModel )
		return m_pA3DLitModel->GetModelAABB();
	
	return A3DAABB(A3DVECTOR3(0.0f), A3DVECTOR3(0.0f));
}

bool CELBuilding::TransformHull(const A3DMATRIX4& tm)
{
	int i;
	for(i=0; i<m_nNumHull; i++)
	{
		CConvexHullData * pHullData = m_ConvexHullData[i];

		pHullData->Transform(tm);
		m_QBrushes[i]->Transform(tm);
	}

	return true;
}

bool CELBuilding::RayTraceAABB(const A3DVECTOR3& vecStart, const A3DVECTOR3& vecDelta, A3DVECTOR3& vecHitPos, float * pvFraction, A3DVECTOR3& vecNormal)
{
	if( m_pA3DLitModel )
		return m_pA3DLitModel->RayTraceAABB(vecStart, vecDelta, vecHitPos, pvFraction, vecNormal);

	return false;
}

bool CELBuilding::RayTraceMesh(const A3DVECTOR3& vecStart, const A3DVECTOR3& vecDelta, A3DVECTOR3& vecHitPos, float * pvFraction, A3DVECTOR3& vecNormal)
{
	if( RayTraceAABB(vecStart,vecDelta,vecHitPos,pvFraction,vecNormal))
		return m_pA3DLitModel->RayTraceMesh(vecStart, vecDelta, vecHitPos, pvFraction, vecNormal);

	return false;
}

bool CELBuilding::RayTraceConvexHull(const A3DVECTOR3& vecStart, const A3DVECTOR3& vecDelta, A3DVECTOR3& vecHitPos, float * pvFraction, A3DVECTOR3& vecNormal, CConvexHullData* & pTraceCHData, const CFace* & pTraceFace)
{

	//*
	// �Ⱥ�AABB��ײ
	const A3DAABB& aabb=m_pA3DLitModel->GetModelAABB();
	if(!CLS_RayToAABB3(vecStart,vecDelta,aabb.Mins,aabb.Maxs,vecHitPos,pvFraction,vecNormal))
		return false;
	//*/
	
	const CFace* pCDFace=NULL, *pRealCDFace=NULL;
	float fraction, fMinFraction=1.0f;
	A3DVECTOR3 vCollidePos;

	for(int i=0;i<m_nNumHull;i++)
	{
		CConvexHullData* pCHData = m_ConvexHullData[i];
		if(RayIntersectWithCH(vecStart,vecDelta,*pCHData,&pCDFace,vCollidePos,fraction))
		{
			if(fraction<fMinFraction)
			{
				fMinFraction=fraction;
				pRealCDFace=pCDFace;
				vecHitPos=vCollidePos;
				pTraceCHData=pCHData;
			}
		}
	}

	// Collision occurs!
	if(pRealCDFace)
	{
		*pvFraction=fMinFraction;
		vecNormal=pRealCDFace->GetNormal();
		pTraceFace = pRealCDFace;
		return true;
	}
	return false;
}

bool CELBuilding::RayTraceConvexHull(const A3DVECTOR3& vecStart, const A3DVECTOR3& vecDelta, A3DVECTOR3& vecHitPos, float * pvFraction, A3DVECTOR3& vecNormal, CConvexHullData* & pTraceCHData)
{
	const CFace* pTraceFace = NULL;
	return RayTraceConvexHull(vecStart, vecDelta, vecHitPos, pvFraction, vecNormal, pTraceCHData, pTraceFace);
}

bool CELBuilding::RayTraceConvexHull(const A3DVECTOR3& vecStart, const A3DVECTOR3& vecDelta, A3DVECTOR3& vecHitPos, float * pvFraction, A3DVECTOR3& vecNormal)
{
	CConvexHullData* pTraceCHData=NULL;
	return RayTraceConvexHull(vecStart, vecDelta, vecHitPos, pvFraction, vecNormal, pTraceCHData);
}

bool CELBuilding::AABBCollideWithMe(BrushTraceInfo * pInfo)
{
	assert(!pInfo->bIsPoint);
	A3DAABB aabb = GetModelAABB();
	aabb.Extents+=A3DVECTOR3(8.0f, 8.0f, 8.0f);
	aabb.CompleteMinsMaxs();

	A3DVECTOR3 vPoint, vNormal;
	float		fFraction;		//	Fraction
	
	
	if (!CLS_AABBAABBOverlap(aabb.Center, aabb.Extents, pInfo->BoundAABB.Center, pInfo->BoundAABB.Extents) ) 
	{
		return false;
	}
	//save original result
	bool		bStartSolid = pInfo->bStartSolid;	//	Collide something at start point
	bool		bAllSolid = pInfo->bAllSolid;		//	All in something
	int			iClipPlane = pInfo->iClipPlane;		//	Clip plane's index
	
	fFraction = 100.0f;
	vNormal = pInfo->ClipPlane.GetNormal(); //clip plane normal
	float       fDist = pInfo->ClipPlane.GetDist();	//clip plane dist

	// Detect the collision with Convex Hull
	bool bCollide = false;
	for(int i=0;i<(int)m_QBrushes.size();i++)
	{
		CCDBrush cdBrush;
		m_QBrushes[i]->Export(&cdBrush);
		if (cdBrush.Trace(pInfo) && (pInfo->fFraction < fFraction)) 
		{
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
	if (bCollide) 
	{
		pInfo->bStartSolid = bStartSolid;
		pInfo->bAllSolid = bAllSolid;
		pInfo->iClipPlane = iClipPlane;
		pInfo->fFraction = fFraction;
		pInfo->ClipPlane.SetNormal(vNormal);
		pInfo->ClipPlane.SetD(fDist);
	}
	return bCollide;
}

bool CELBuilding::SphereCollideWithMe(const A3DVECTOR3& vecStart, float fRadius, const A3DVECTOR3& vecDelta, A3DVECTOR3& vecHitPos, float * pvFraction, A3DVECTOR3& vecNormal, CConvexHullData* & pCDCHData, const CFace* & pTraceFace /*, bool bExactCD=false */)
{
	// Do the pretest!
	// Construct the sweeping sphere
	A3DVECTOR3 vSSCenter=vecStart+(vecDelta/2.0f);
	float fSSRadius=fRadius+vecDelta.Magnitude()/2.0f;

	//*
	// Expand the AABB of the model to handle the case that
	// convex hulls of the model protrude the AABB!
	A3DAABB aabb = GetModelAABB();
	aabb.Extents+=A3DVECTOR3(8.0f, 8.0f, 8.0f);
	aabb.CompleteMinsMaxs();
	if(!CLS_AABBSphereOverlap(aabb,vSSCenter,fSSRadius))
		return false;
	//*/
	
	// Detect the collision with Convex Hull
	const CFace *pCDFace=NULL, *pRealCDFace=NULL;
	float fraction, fMinFraction=1.0f;
	A3DVECTOR3 vCollidePos;
	
	for(int i=0;i<m_nNumHull;i++)
	{
		CConvexHullData* pCHData = m_ConvexHullData[i];
		if(SphereCollideWithCH(vecStart,vecDelta,fRadius,*pCHData,&pCDFace,vCollidePos,fraction))
		{
			if(fraction<fMinFraction)
			{
				fMinFraction=fraction;
				pRealCDFace=pCDFace;
				vecHitPos=vCollidePos;
				pCDCHData=pCHData;
			}
		}
	}	

	if(pRealCDFace)
	{
		/*
		if(bExactCD)
		{
			// To get the exact collision detection, we should go further 
			// to detect the sphere-mesh collision.now it is just skipped!

		}
		*/

		*pvFraction=fMinFraction;
		pTraceFace = pRealCDFace;
		vecNormal=pRealCDFace->GetNormal();
		vecHitPos-=fRadius*vecNormal;					//Adjust the hit pos!
		return true;
	}

	return false;

}

bool CELBuilding::SphereCollideWithMe(const A3DVECTOR3& vecStart, float fRadius, const A3DVECTOR3& vecDelta, A3DVECTOR3& vecHitPos, float * pvFraction, A3DVECTOR3& vecNormal, CConvexHullData* & pCDCHData /*, bool bExactCD=false */)
{
	const CFace* pTraceFace = NULL;
	return SphereCollideWithMe(vecStart, fRadius,  vecDelta,  vecHitPos,  pvFraction,  vecNormal, pCDCHData, pTraceFace);

}

bool CELBuilding::SphereCollideWithMe(const A3DVECTOR3& vecStart, float fRadius, const A3DVECTOR3& vecDelta, A3DVECTOR3& vecHitPos, float * pvFraction, A3DVECTOR3& vecNormal /*, bool bExactCD */)
{
	CConvexHullData* pCDCHData=NULL;
	return SphereCollideWithMe(vecStart, fRadius,  vecDelta,  vecHitPos,  pvFraction,  vecNormal, pCDCHData);
}

bool CELBuilding::ExportBrushBuilding(const char * szFileName, const char * szSharedDataFileName)
{
	AFile fileToSave;

	if( !fileToSave.Open(szFileName, AFILE_CREATENEW | AFILE_BINARY) )
		return false;

	if( !ExportBrushBuilding(&fileToSave, szSharedDataFileName) )
		return false;

	fileToSave.Close();
	return true;
}

bool CELBuilding::ExportBrushBuilding(AFile * pFileToSave, const char * szSharedDataFileName)
{
	// then save the building.
	/*
	if( m_pA3DLitModel )
		m_pA3DLitModel->NormalizeTransforms();
	*/

	DWORD dwWrittenLen;

	DWORD version = ELBUILDING_VERSION;
	if( !pFileToSave->Write(&version, sizeof(DWORD), &dwWrittenLen) )
		return false;

	if( !pFileToSave->Write(&m_bCollideOnly, sizeof(bool), &dwWrittenLen) )
		return false;

    if (szSharedDataFileName && szSharedDataFileName[0])
    {
        if( !m_pA3DLitModel->SaveWithSharedFormat(pFileToSave, szSharedDataFileName) )
		    return false;
    }
    else
    {
        if( !m_pA3DLitModel->Save(pFileToSave) )
            return false;
    }
	if (!pFileToSave->WriteString(m_strChfPath))
		return false;

	return true;
}

bool CELBuilding::SetCollideOnly(bool bFlag)
{
	if( m_bCollideOnly == bFlag )
		return true;

	m_bCollideOnly = bFlag;

	if( m_bCollideOnly )
	{
		for(int i=0; i<m_nNumHull; i++)
		{
			m_ConvexHullData[i]->SetFlags(m_ConvexHullData[i]->GetFlags() | CHDATA_SKIP_RAYTRACE);
		}	
		if( m_pA3DLitModel )
			m_pA3DLitModel->SetVisibility(false);
	}
	else
	{
		for(int i=0; i<m_nNumHull; i++)
		{
			m_ConvexHullData[i]->SetFlags(m_ConvexHullData[i]->GetFlags() & (~CHDATA_SKIP_RAYTRACE));
		}	
		if( m_pA3DLitModel )
			m_pA3DLitModel->SetVisibility(true);
	}

	return true;
}

#ifdef ELB_CHECK_HULL

void CELBuilding::CheckHull()
{
	int nFace, i, j;
	static int count = 1;
	bool bExcept;
	for(i=0; i<m_nNumHull; i++)
	{
		nFace = m_ConvexHullData[i]->GetFaceNum();
		for (j = 0; j < nFace; j++)
		{
			A3DVECTOR3 vNormal(m_ConvexHullData[i]->GetFacePtr(j)->GetNormal());
			bExcept = false;

			float fMag = vNormal.Magnitude();
			if  (fabs(fMag - 1.0f) > 1E-5f)
			{
				bExcept = true;
			}

			if (fabs(vNormal.x  - 1.0f) < 1E-5f 
				&& fabs(vNormal.y  - 0.0f) > 1E-5f 
				&& fabs(vNormal.z  - 0.0f) > 1E-5f )
			{
				bExcept = true;
			}
			
			if (fabs(vNormal.y  - 1.0f) < 1E-5f 
				&& fabs(vNormal.x  - 0.0f) > 1E-5f 
				&& fabs(vNormal.z  - 0.0f) > 1E-5f )
			{
				bExcept = true;
			}

			if (fabs(vNormal.z  - 1.0f) < 1E-5f 
				&& fabs(vNormal.y  - 0.0f) > 1E-5f 
				&& fabs(vNormal.x  - 0.0f) > 1E-5f )
			{
				bExcept = true;
			}

			if (bExcept)
			{
				char msg[200];
				sprintf(msg, _EA("%d hull %d face %d n %f %f %f\n"), 
					count, i, j, vNormal.x,  vNormal.y, vNormal.z);
				OutputDebugStringA(msg);
				g_Log.Log(msg);
				count++;
			}
			
		}
	}	

}

#endif