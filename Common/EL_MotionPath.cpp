#include "StdAfx.h"
#include "EL_MotionPath.h"
#include <AFileImage.h>
#include "EC_Bezier.h"


CELMotionPath::CELMotionPath(void)
{
	m_pECBezier = 0;
}

CELMotionPath::~CELMotionPath(void)
{
	if (NULL != m_pECBezier)
	{
		m_pECBezier->Release();
		delete m_pECBezier;
	}	
}

bool CELMotionPath::Load(AFile* pFile)
{
	m_arrSamplePoint.clear();
	m_arrSampleTime.clear();
	m_arrSampleAABB.clear();
	int iVersion;
	DWORD dwRead;
	unsigned int uiMN;
	pFile->Read(&uiMN, sizeof(uiMN), &dwRead);
	if(uiMN != 0x12345)
		return false;
	pFile->Read(&iVersion, sizeof(iVersion), &dwRead);
	pFile->Read(&m_uiObjectID, sizeof(m_uiObjectID), &dwRead);
	pFile->Read(&m_fCheckRadius, sizeof(m_fCheckRadius), &dwRead);
	pFile->Read(&m_uiBezierID, sizeof(m_uiBezierID), &dwRead);
	int iPointNum;
	pFile->Read(&iPointNum, sizeof(iPointNum), &dwRead);
	for (int i=0; i<iPointNum; ++i)
	{
		A3DVECTOR3 vPoint;
		pFile->Read(&vPoint, sizeof(vPoint), &dwRead);
		m_arrSamplePoint.push_back(vPoint);
	}

	int iTimeNum;
	pFile->Read(&iTimeNum, sizeof(iTimeNum), &dwRead);
	for (int i=0; i<iTimeNum; ++i)
	{
		float fTime;
		pFile->Read(&fTime, sizeof(fTime), &dwRead);
		m_arrSampleTime.push_back(fTime);
	}

	int iAABBNum;
	pFile->Read(&iAABBNum, sizeof(iAABBNum), &dwRead);
	for (int i=0; i<iAABBNum; ++i)
	{
		A3DAABB aabb;
		pFile->Read(&aabb.Mins, sizeof(aabb.Mins), &dwRead);
		pFile->Read(&aabb.Maxs, sizeof(aabb.Maxs), &dwRead);
		m_arrSampleAABB.push_back(aabb);
	}
	m_pECBezier = new CECBezier;
	if(!m_pECBezier->Load(pFile))
	{
		delete m_pECBezier;
		m_pECBezier = 0;
		return false;
	}

	return true;
}

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

CELMotionPathMan::CELMotionPathMan(void) : m_tabMotionPath(128)
{
}

CELMotionPathMan::~CELMotionPathMan(void)
{
	MotionPathTab::iterator it = m_tabMotionPath.begin();
	for (; it != m_tabMotionPath.end(); ++it)
	{
		CELMotionPath* pMotionPath = *it.value();
		delete pMotionPath;
	}
}

bool CELMotionPathMan::Load(const char* szFile)
{
	AFileImage file;
	if (!file.Open(szFile, AFILE_OPENEXIST | AFILE_BINARY))
		return false;

	DWORD dwRead;
	//	Read file header
	MOTIONPATHHEADER Header;
	file.Read(&Header, sizeof (Header), &dwRead);

	if (Header.iVersion > ELMOTIONPATH_VERSION)
		return false;

	int i;
	for (i=0; i < Header.iNumMotionPath; i++)
	{
		CELMotionPath* pMotionPath = new CELMotionPath;
		if (!pMotionPath->Load(&file))
		{
			delete pMotionPath;
			return false;
		}

		m_tabMotionPath.put(pMotionPath->GetBezierID(), pMotionPath);
	}

	file.Close();
	return true;
}

CELMotionPath* CELMotionPathMan::GetMotionPath(unsigned int uiBezierID)
{
	MotionPathTab::pair_type Pair = m_tabMotionPath.get(uiBezierID);
	if (!Pair.second)
		return NULL;

	return *Pair.first;
}