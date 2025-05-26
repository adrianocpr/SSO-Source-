#include "StdAfx.h"
#include "el_Sfxregion.h"
#include <memory.h>

CELSfxRegion::CELSfxRegion()
{
	m_iType = -1;
}

CELSfxRegion::~CELSfxRegion()
{

}

static inline bool _LoadStr( AFileImage& fileImage, char* buf )
{
	DWORD dwRead = 0;
	int len;

	if( !fileImage.Read(&len, sizeof (len), &dwRead) ) goto fail;
	if( !fileImage.Read(buf, len, &dwRead) ) goto fail; 
	buf[dwRead] = 0;
	return true;

fail:
	buf[0] = 0;
	return false;
}

//	Build precinct bound box
void CELSfxRegion::BuildBoundBox()
{
	m_fLeft		= 999999.0f;
	m_fTop		= 999999.0f;
	m_fRight	= -999999.0f;
	m_fBottom	= -999999.0f;

	for (int i=0; i < (int)m_aPoints.size(); i++)
	{
		const VECTOR2& v = m_aPoints[i];
		
		if (v.x < m_fLeft)		m_fLeft = v.x;
		if (v.x > m_fRight)		m_fRight = v.x;
		if (v.z < m_fTop)		m_fTop = v.z;
		if (v.z > m_fBottom)	m_fBottom = v.z;
	}
	
}

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
CELSfxSMRegion::CELSfxSMRegion()
{
	m_iType = SFXRGNTYPE_SM;
}

bool CELSfxSMRegion::Load(AFileImage& fileImage, int iVersion)
{
	int i, iNumPoint;
	DWORD dwRead;
	float v[2];
	char szTemp[256];

	memset(m_Data.szName,0,128);
	if( !fileImage.Read(&m_Data, sizeof(m_Data), &dwRead) ) return false;

	if( !_LoadStr( fileImage, szTemp ) ) return false;
	m_strMusic = szTemp;

	if( !_LoadStr( fileImage, szTemp ) ) return false;
	m_strMusic_n = szTemp;

	if( !_LoadStr( fileImage, szTemp ) ) return false;
	m_strSound = szTemp;

	if( !_LoadStr( fileImage, szTemp ) ) return false;
	m_strSound_n = szTemp;


	//	Read number of point
	if( !fileImage.Read(&iNumPoint, sizeof (iNumPoint), &dwRead) ) return false;
	for (i=0; i < iNumPoint; i++)
	{
		if( !fileImage.Read(&v, sizeof (v), &dwRead) ) return false;

		VECTOR2 v1 = {v[0], v[1]};
		m_aPoints.push_back(v1);
	}

	//	Build bound box
	BuildBoundBox();

	return true;
}
////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

CELSfxAERegion::CELSfxAERegion()
{
	m_iType = SFXRGNTYPE_AE;
}

bool CELSfxAERegion::Load(AFileImage& fileImage, int iVersion)
{
	int i, iNumPoint;
	DWORD dwRead;
	float v[2];
	char szTemp[256];

	memset(m_Data.szName,0,128);
	if( !fileImage.Read(&m_Data, sizeof(m_Data), &dwRead) ) return false;

	if( !_LoadStr( fileImage, szTemp ) ) return false;
	m_strAEDay = szTemp;

	if( !_LoadStr( fileImage, szTemp ) ) return false;
	m_strAENight = szTemp;

	//	Read number of point
	if( !fileImage.Read(&iNumPoint, sizeof (iNumPoint), &dwRead) ) return false;
	for (i=0; i < iNumPoint; i++)
	{
		if( !fileImage.Read(&v, sizeof (v), &dwRead) ) return false;

		VECTOR2 v1 = {v[0], v[1]};
		m_aPoints.push_back(v1);
	}

	//	Build bound box
	BuildBoundBox();

	return true;
}

////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

CELSfxReverbRegion::CELSfxReverbRegion()
{
	m_iType = SFXRGNTYPE_REVERB;
}

bool CELSfxReverbRegion::Load(AFileImage& fileImage, int iVersion)
{
	int i, iNumPoint;
	DWORD dwRead;
	float v[2];

	memset(m_Data.szName,0,128);
	if( !fileImage.Read(&m_Data, sizeof(m_Data), &dwRead) ) return false;

	//	Read number of point
	if( !fileImage.Read(&iNumPoint, sizeof (iNumPoint), &dwRead) ) return false;
	for (i=0; i < iNumPoint; i++)
	{
		if( !fileImage.Read(&v, sizeof (v), &dwRead) ) return false;

		VECTOR2 v1 = {v[0], v[1]};
		m_aPoints.push_back(v1);
	}

	//	Build bound box
	BuildBoundBox();

	return true;
}

///////////////////////////////////////////////////////////////////////////
//	
//	Implement CELPrecinctSet
//	
///////////////////////////////////////////////////////////////////////////

CELSfxRegionSet::CELSfxRegionSet()
{
	m_dwTimeStamp	= 0;
}

CELSfxRegionSet::~CELSfxRegionSet()
{
	//	Release all precincts
	for (int i = 0; i < SFXRGNTYPE_COUNT; ++i)
	{
		for (size_t j = 0; j < m_aSfxRegions[i].size(); ++j)
			delete m_aSfxRegions[i][j];

		m_aSfxRegions[i].clear();
	}
}

bool CELSfxRegionSet::Load(const char* szFileName)
{
	AFileImage fileImage;
	DWORD dwRead;
	if (!fileImage.Open( szFileName, AFILE_OPENEXIST | AFILE_BINARY ) )
		return false;
	
	//	Read version at first
	unsigned int dwVersion = 0;
	if (!fileImage.Read( &dwVersion, sizeof(dwVersion), &dwRead) )
		return false;

	if (dwVersion > ELSFXREGION_VERSION)
		return false;

	if(dwVersion < 2) return true;

	//	Reset file pointer
	if (!fileImage.ResetPointer()) return false;

	//	Read file header
	SFXREGIONHEADER Header;
	if (!fileImage.Read(&Header, sizeof (Header), &dwRead)) return false;
	m_dwTimeStamp = Header.dwTimeStamp;

	for (int i=0; i < Header.iNumRegion; i++)
	{
		int iType = -1;
		if (!fileImage.Read(&iType, sizeof (iType), &dwRead))
			return false;
		CELSfxRegion* pRegion = 0;
		switch (iType)
		{
		case SFXRGNTYPE_SM:
			{
				CELSfxSMRegion* pSM = new CELSfxSMRegion;
				if (!pSM->Load( fileImage, (int)dwVersion))
				{
					delete pSM;
					return false;
				}
				pRegion = pSM;
			}
			break;
		case SFXRGNTYPE_AE:
			{
				CELSfxAERegion* pAE = new CELSfxAERegion;
				if (!pAE->Load( fileImage, (int)dwVersion))
				{
					delete pAE;
					return false;
				}
				pRegion = pAE;
			}
			break;
		}

		if (iType >= 0 && iType < SFXRGNTYPE_COUNT)
		{
			m_aSfxRegions[iType].push_back(pRegion);
		}
		else
		{
			assert(0 && "Region Type Error.");
		}
	}

	// fileImage.Close();	//应当不需要手动Close,否则之前所有return 都应该改为goto
	return true;
}

//	Get precinct number
size_t CELSfxRegionSet::GetSfxRegionNum(SFXRGN_TYPE iType) const
{
	if (iType >= 0 && iType < SFXRGNTYPE_COUNT)
		return m_aSfxRegions[iType].size();

	return 0;
}

//	Get precinct
CELSfxRegion* CELSfxRegionSet::GetSfxRegion(size_t n, SFXRGN_TYPE iType)
{
	if (iType >= 0 && iType < SFXRGNTYPE_COUNT)
	{
		if (n < m_aSfxRegions[iType].size())
			return m_aSfxRegions[iType][n];
	}

	return NULL;
}



