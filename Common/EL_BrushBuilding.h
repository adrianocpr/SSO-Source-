/*
 * FILE: EL_BrushBuilding.h
 *
 * DESCRIPTION: building using brush for cd, only used in element client
 *
 * CREATED BY: Hedi, 2005/8/23
 *
 * HISTORY: 
 *
 * Copyright (c) 2005 Archosaur Studio, All Rights Reserved.
 */

#ifndef _EL_BRUSHBUILDING_H_
#define _EL_BRUSHBUILDING_H_

#include <vector.h>
#include "aabbcd.h"
#include "A3DGeometry.h"
#include "EC_BrushMan.h"
#include "BrushArchive.h"

using namespace CHBasedCD;
using namespace abase;

#define BUILDING_FADE_IN_TIME		2000
#define ELBRUSHBUILDING_VERSION		0x80000002



class CELBrushBuilding : public CBrushProvider
{
protected:
	A3DDevice *					m_pA3DDevice;
	A3DLitModel *				m_pA3DLitModel;

	int							m_nNumHull;
	vector<CCDBrush *>			m_CDBrushes;
	vector<CConvexHullData*>	m_ConvexHullData;

	A3DAABB						m_aabb;						// bounding box of the model
	DWORD						m_dwTimeLived;				// time passed since this building appear
	bool						m_bCollideOnly;				// flag indicates this building is used for collision detection only

	BrushArchive                m_arBrush;                 // Brush archive for CCDBrush (Load & Save)

	AString                     m_strChfPath;

protected:

	bool LoadCDBrushes(AFile * pFileToLoad);
	bool SaveCDBrushes(AFile * pFileToSave);

	bool ReleaseCDBrushes();

	bool TransformHull(const A3DMATRIX4& tm);

	bool LoadChf(const char* szChf);

public:
	A3DLitModel * GetA3DLitModel()		{ return m_pA3DLitModel; }
	A3DAABB GetModelAABB();

	// Set Collide Only Flag
	bool SetCollideOnly(bool bFlag);
	bool GetCollideOnly() { return m_bCollideOnly; }

	int GetBrushNum() { return (int)m_ConvexHullData.size(); }
	int GetVertexNum(int idx_brush) { return m_ConvexHullData[idx_brush]->GetVertexNum(); }
	int GetFaceNum(int idx_brush) { return m_ConvexHullData[idx_brush]->GetFaceNum(); }

public:
	CELBrushBuilding();
	~CELBrushBuilding();

	// Initialize and finalize
	bool Init(A3DDevice * pA3DDevice);
	bool Release();

	// Render method
	bool Render(A3DViewport * pViewport, bool bRenderAlpha=true);
	bool RenderPost(A3DViewport * pViewport);
	bool RenderConvexHull(A3DViewport * pViewport);
	// Tick method
	bool Tick(DWORD dwDeltaTime);
	
	// Load and Save
	bool Save(const char * szFileName);
	bool Load(A3DDevice * pA3DDevice, const char * szFileName);

	bool Save(AFile * pFileToSave);
	bool Load(A3DDevice * pA3DDevice, AFile * pFileToLoad);

	// Revised by wenfeng, 05-09-06
	// bCheckCHFlags: whether we need to check the flags in Brush data 
	//		when we handle the trace.
	bool TraceWithBrush(BrushTraceInfo * pInfo, bool bCheckCHFlags = true);

	virtual int GetBrushCount() { return m_CDBrushes.size(); }
	virtual CCDBrush * GetBrush(int index) { return m_CDBrushes[index]; }
};

#endif//_EL_BRUSHBUILDING_H_