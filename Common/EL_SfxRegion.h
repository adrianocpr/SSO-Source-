/*
 * FILE: EL_BufRegion.h
 *
 * DESCRIPTION: 
 *
 * CREATED BY: QingFeng Xin, 2009/3/12
 *
 * HISTORY: 
 *
 * Copyright (c) 2005 Archosaur Studio, All Rights Reserved.
 */

#ifndef _EL_SFX_REGION_H_
#define _EL_SFX_REGION_H_

#include "vector.h"
#include <AString.h>
#include <stdio.h>
#include <A3DVector.h>
#include <AFileImage.h>

///////////////////////////////////////////////////////////////////////////
//	
//	Define and Macro
//	
///////////////////////////////////////////////////////////////////////////

#define ELSFXREGION_VERSION		3

///////////////////////////////////////////////////////////////////////////
//	
//	Types and Global variables
//	
///////////////////////////////////////////////////////////////////////////

enum SFXRGN_TYPE
{
	SFXRGNTYPE_AE	= 0,		//	音效盒子
	SFXRGNTYPE_SM,				//	音效且音乐区域
	SFXRGNTYPE_REVERB,			//	混响区域

	SFXRGNTYPE_COUNT,

	SFXRGNTYPE_FORCEINT	= 0xffffffff,
};

#pragma pack(1)

struct SFXREGIONHEADER
{
	unsigned int	dwVersion;	
	int				iNumRegion;
	unsigned int	dwTimeStamp;
};

#pragma pack()

///////////////////////////////////////////////////////////////////////////
//	
//	Declare of Global functions
//	
///////////////////////////////////////////////////////////////////////////

class CELSfxRegion
{
public:		//	Types

#pragma pack(1)
	
	struct VECTOR2
	{
		float x, z;
	};
#pragma pack()

public:		//	Constructor and Destructor

	CELSfxRegion();
	virtual ~CELSfxRegion();

public:		//	Attributes

public:		//	Operations
	//	Load data from file
	virtual bool Load(AFileImage& fileImage, int iVersion) { return true; }
	
	// Get boundary box
	inline void GetRect(float &left, float &top, float &right, float &bottom) const
	{
		left = m_fLeft;
		top = m_fTop;
		right = m_fRight;
		bottom = m_fBottom;
	}

	const abase::vector<VECTOR2>* GetPoints() const { return &m_aPoints; }

	// State control
	bool  IsNight() const { return m_bCurIsNight; }
	void  SetNight(bool bNight){ m_bCurIsNight = bNight; }
	int   GetType() const { return m_iType; }

protected:
	void BuildBoundBox();

protected:  //  Status
	bool m_bCurIsNight;
	
protected:	//	Attributes
	abase::vector<VECTOR2>	m_aPoints;	//	Precinct points

	float m_fLeft;
	float m_fRight;
	float m_fTop;
	float m_fBottom;
	int m_iType;
};

class CELSfxSMRegion : public CELSfxRegion
{
public:
	CELSfxSMRegion();
#pragma pack(1)
	struct SMREGIONDATA
	{
		int nID;

		int iPriority; //优先等级，数字越大等级越高

		char szName[128];

		float fHeightPos;

		float fRangeTop;
		float fRangeBottom;
	};
#pragma pack()
public:
	virtual bool Load(AFileImage& fileImage, int iVersion);
	int GetID() const { return m_Data.nID; }
	AString GetName() const { return m_Data.szName; };
	const char* GetSound() const { return m_strSound; }
	const char* GetSound_N() const{ return m_strSound_n; }
	const char* GetMusic() const { return m_strMusic; }
	const char* GetMusic_N() const { return m_strMusic_n; }
	inline const SMREGIONDATA& GetProperty() const { return m_Data; }
protected:
	SMREGIONDATA m_Data;
	AString	m_strSound;
	AString	m_strSound_n;
	AString	m_strMusic;
	AString	m_strMusic_n;
};

class CELSfxAERegion : public CELSfxRegion
{
public:
	CELSfxAERegion();
#pragma pack(1)
	struct AEREGIONDATA
	{
		int nID;

		char szName[128];

		float fHeightPos;

		float fDisFade_Hor;
		float fDisFade_Ver;

		float fRangeTop;
		float fRangeBottom;
	};
#pragma pack()
public:
	virtual bool Load(AFileImage& fileImage, int iVersion);
	int GetID() const { return m_Data.nID; }
	AString GetName() const { return m_Data.szName; };
	const char* GetAEDay() const { return m_strAEDay; }
	const char* GetAENight() const{ return m_strAENight; }
	inline const AEREGIONDATA& GetProperty() const { return m_Data; }
protected:
	AEREGIONDATA m_Data;
	AString	m_strAEDay;
	AString	m_strAENight;
};

class CELSfxReverbRegion : public CELSfxRegion
{
public:
	CELSfxReverbRegion();
#pragma pack(1)
	struct REVERBREGIONDATA
	{
		int nID;

		char szName[128];
		char szReverb[128];

		A3DVECTOR3 vPos;

		float fMinDistance;
		float fMaxDistance;

		float fRangeTop;
		float fRangeBottom;
	};
#pragma pack()
public:
	virtual bool Load(AFileImage& fileImage, int iVersion);
	int GetID() const { return m_Data.nID; }
	AString GetName() const { return m_Data.szName; };
	inline const REVERBREGIONDATA& GetProperty() const { return m_Data; }
protected:
	REVERBREGIONDATA m_Data;
};

class CELSfxRegionSet
{
public:		//	Types

public:		//	Constructor and Destructor

	CELSfxRegionSet();
	virtual ~CELSfxRegionSet();

public:		//	Attributes

public:		//	Operations

	//	Load data from file
	bool Load(const char* szFileName);

	//	Get time stamp
	unsigned int GetTimeStamp() const { return m_dwTimeStamp; }
	//	Get precinct number
	size_t GetSfxRegionNum(SFXRGN_TYPE iType) const;
	//	Get precinct
	CELSfxRegion* GetSfxRegion(size_t n, SFXRGN_TYPE iType);

protected:	//	Attributes

	unsigned int	m_dwTimeStamp;		//	Time stamp of precinct data

	abase::vector<CELSfxRegion*>	m_aSfxRegions[SFXRGNTYPE_COUNT];	//	Precinct array

protected:	//	Operations

};


///////////////////////////////////////////////////////////////////////////
//	
//	Inline functions
//	
///////////////////////////////////////////////////////////////////////////

#endif
