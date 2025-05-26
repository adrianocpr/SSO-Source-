#pragma once

#include "vector.h"
#include "A3DGeometry.h"
#include "hashtab.h"

#define ELMOTIONPATH_VERSION		1

#pragma pack(1)

struct MOTIONPATHHEADER
{
	int			iVersion;	
	int			iNumMotionPath;
};

#pragma pack()

class AFile;
class CECBezier;

class CELMotionPath
{
public:
	CELMotionPath(void);
	~CELMotionPath(void);
public:
	bool			Load(AFile* pFile);
	unsigned int	GetObjectID() const { return m_uiObjectID; }
	unsigned int	GetBezierID() const { return m_uiBezierID; }
	float			GetCheckRadius() const { return m_fCheckRadius; }
	int				GetSamplePointNum() const { return (int)m_arrSamplePoint.size(); }
	A3DVECTOR3		GetSamplePoint(int idx) const { return m_arrSamplePoint[idx]; }
	int				GetSampleTimeNum() const { return (int)m_arrSampleTime.size(); }
	float			GetSampleTime(int idx) const { return m_arrSampleTime[idx]; }
	int				GetSampleAABBNum() const { return (int)m_arrSampleAABB.size(); }
	A3DAABB			GetSampleAABB(int idx) const { return m_arrSampleAABB[idx]; }
	CECBezier*		GetBezier() const { return m_pECBezier; }
protected:
	unsigned int	m_uiObjectID;
	unsigned int	m_uiBezierID;
	float			m_fCheckRadius;
	typedef abase::vector<A3DVECTOR3> VectorArray;
	typedef abase::vector<float> FloatArray;
	typedef abase::vector<A3DAABB> AABBArray;
	VectorArray		m_arrSamplePoint;
	FloatArray		m_arrSampleTime;
	AABBArray		m_arrSampleAABB;
	CECBezier*		m_pECBezier;
};

class CELMotionPathMan
{
public:
	typedef abase::hashtab<CELMotionPath*, unsigned int, abase::_hash_function>	MotionPathTab;
public:
	CELMotionPathMan(void);
	~CELMotionPathMan(void);
public:
	bool			Load(const char* szFile);
	CELMotionPath*	GetMotionPath(unsigned int uiBezierID);
	const MotionPathTab& GetTable() const { return m_tabMotionPath; }
protected:
	MotionPathTab	m_tabMotionPath;
};