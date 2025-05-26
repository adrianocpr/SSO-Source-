#include "el_bufregion.h"
#include <memory.h>

CELBufRegion::CELBufRegion()
{

}

CELBufRegion::CELBufRegion(abase::vector<VECTOR2>& apoints)
{
	m_fLeft		= 999999.0f;
	m_fTop		= 999999.0f;
	m_fRight	= -999999.0f;
	m_fBottom	= -999999.0f;

	m_BufRGNData.nType = BUF_REGION_POLYGON;
	
	for( size_t i = 0; i < apoints.size(); ++i )
	{
		
		if(m_fLeft > apoints[i].x) m_fLeft = apoints[i].x;
		if(m_fRight < apoints[i].x) m_fRight = apoints[i].x;

		if(m_fTop > apoints[i].z) m_fTop = apoints[i].z;
		if(m_fBottom < apoints[i].z) m_fBottom = apoints[i].z;

		m_aPoints.push_back(apoints[i]);
	}
}


CELBufRegion::~CELBufRegion()
{

}

//	Load data from file
bool CELBufRegion::Load(FILE* fp, int iVersion)
{
	int i, iNumPoint;
	float v[2];

	if(iVersion < 2)
	{
		BUFREGIONDATA_VERSION1 v1;
		fread(&v1,1,sizeof(v1),fp);
		memcpy(&m_BufRGNData,&v1,sizeof(v1));
		m_BufRGNData.bNoRepeat = false;
		m_BufRGNData.nTask_Enter = 0;
		m_BufRGNData.nTask_Leave = 0;
        m_BufRGNData.bInitValid = false;

	}
    else if(iVersion < 3)
	{
		BUFREGIONDATA_VERSION2 v2;
		fread(&v2,1,sizeof(v2),fp);
		memcpy(&m_BufRGNData,&v2,sizeof(v2));
		m_BufRGNData.bMonsterBornValid = true;
        m_BufRGNData.bInitValid = false;
	}
    else if (iVersion < 4)
    {
        BUFREGIONDATA_VERSION3 v3;
        fread(&v3,1,sizeof(v3),fp);
        memcpy(&m_BufRGNData,&v3,sizeof(v3));
		m_BufRGNData.bInitValid = false;
    }
	else fread(&m_BufRGNData, sizeof (m_BufRGNData), 1, fp);
	
	if(m_BufRGNData.nType == BUF_REGION_POLYGON)
	{
		//	Read number of point
		fread(&iNumPoint, sizeof (int), 1, fp);
		for (i=0; i < iNumPoint; i++)
		{
			fread(v, sizeof (v), 1, fp);
			
			VECTOR2 v1 = {v[0], v[1]};
			m_aPoints.push_back(v1);
		}
	}

	//	Build bound box
	BuildBoundBox();

	return true;
}



//	Build precinct bound box
void CELBufRegion::BuildBoundBox()
{
	m_fLeft		= 999999.0f;
	m_fTop		= 999999.0f;
	m_fRight	= -999999.0f;
	m_fBottom	= -999999.0f;

	
	if(m_BufRGNData.nType == BUF_REGION_POLYGON)
	{
		for (int i=0; i < (int)m_aPoints.size(); i++)
		{
			const VECTOR2& v = m_aPoints[i];
			
			if (v.x < m_fLeft)		m_fLeft = v.x;
			if (v.x > m_fRight)		m_fRight = v.x;
			if (v.z < m_fTop)		m_fTop = v.z;
			if (v.z > m_fBottom)	m_fBottom = v.z;
		}
	}else if( m_BufRGNData.nType == BUF_REGION_CIRCLE)
	{
		m_fLeft =  m_BufRGNData.vPos.x - m_BufRGNData.fRadius;
		m_fRight =  m_BufRGNData.vPos.x + m_BufRGNData.fRadius;
		m_fTop = m_BufRGNData.vPos.z - m_BufRGNData.fRadius;
		m_fBottom = m_BufRGNData.vPos.z + m_BufRGNData.fRadius;
	}else
	{
		float half_len = m_BufRGNData.fLen/2.0f;
		float half_wth = m_BufRGNData.fWidth/2.0f;
		m_fLeft =  m_BufRGNData.vPos.x - half_len;
		m_fRight =  m_BufRGNData.vPos.x + half_len;
		m_fTop = m_BufRGNData.vPos.z - half_wth;
		m_fBottom = m_BufRGNData.vPos.z + half_wth;
	}
}

//	Is specified position in this precinct ?
bool CELBufRegion::IsPointIn(float x, float z)
{
	//	Check bound box at first
	if (x < m_fLeft || x > m_fRight || z < m_fTop || z > m_fBottom)
		return false;
	if(m_BufRGNData.nType == BUF_REGION_POLYGON)
	{
		
		int iNumCross = 0;// �������ν������
		
		for (int i=0; i < (int)m_aPoints.size(); i++)
		{
			//	�Ӽ������Ҳ������������Ƿ���ñ��ཻ
			if (IsCrossLine(x, z, i))
				iNumCross++;
		}
		
		//	����ż�������㣬���ڶ������; �������������㣬�ڶ������
		return (iNumCross & 1) ? true : false;
	}else if(m_BufRGNData.nType == BUF_REGION_CIRCLE)
	{
		float dis = (m_BufRGNData.vPos.x - x)*(m_BufRGNData.vPos.x - x) + (m_BufRGNData.vPos.z - z)*(m_BufRGNData.vPos.z - z);
		float radius2 = m_BufRGNData.fRadius * m_BufRGNData.fRadius;

		if( dis <= radius2) return true;
		else return false;
	}

	return true;
}

//	�ж������Ƿ�����ཻ
bool CELBufRegion::IsCrossLine(float x, float z, int iIndex)
{
	int iNumLine = m_aPoints.size();
	const VECTOR2& v1 = m_aPoints[iIndex];
	const VECTOR2& v2 = m_aPoints[(iIndex+1) % iNumLine];

	if (v1.x < x && v2.x < x)	//	����߶����������
		return false;

	if (v1.z < z && v2.z < z)	//	����߶��������ϱ�
		return false;

	if (v1.z > z && v2.z > z)	//	����߶��������±�
		return false;

	if (v1.z == v2.z)	//	����߶���������ͬһˮƽ����
		return false;

	if (z == v1.z)	//	������ߴ����߶ζ���1
	{
		//	�ҵ����� 1 ֮ǰ����������߲���ͬһˮƽ���ϵĵ�
		VECTOR2* pvPre = NULL;
		bool bFind = false;

		for (int i=1; i < iNumLine; i++)
		{
			pvPre = &m_aPoints[(iIndex + iNumLine - i) % iNumLine];
			if (pvPre->z != z)	// ����ɨ������
			{
				bFind = true;
				break;
			}
		}

		if (!bFind)	//	û�ҵ����������ĵ㣨��������е���ͬһˮƽ���ϣ�
			return false;

		//	�������1֮ǰ���붥��2����������
		if ((pvPre->z < z && v2.z > z) || (pvPre->z > z && v2.z < z))
			return false;
	}

	//	����������ߵĽ���
	float fSlope = (v2.x - v1.x) / (v2.z - v1.z);
	float fCrossX = (z - v1.z) * fSlope + v1.x;
	
	//	�����ڲ��Ե���� return false
	return fCrossX <= x ? false : true;
}

///////////////////////////////////////////////////////////////////////////
//	
//	Implement CELPrecinctSet
//	
///////////////////////////////////////////////////////////////////////////

CELBufRegionSet::CELBufRegionSet()
{
	m_dwTimeStamp	= 0;
}

CELBufRegionSet::~CELBufRegionSet()
{
	//	Release all precincts
	for (int i=0; i < (int)m_aBufRegions.size(); i++)
		delete m_aBufRegions[i];
}


CELBufRegion* CELBufRegionSet::IsPointIn(float x, float z, int idSrcInst)
{
	CELBufRegion* pPrecinct = NULL;

	for (int i=0; i < (int)m_aBufRegions.size(); i++)
	{
		CELBufRegion* p = m_aBufRegions[i];
		if (!p->IsPointIn(x, z))
			continue;
		pPrecinct = p;
	}

	return pPrecinct;
}


bool CELBufRegionSet::Load(const char* szFileName)
{
	FILE* fp = fopen(szFileName, "rb");
	if (!fp) return false;
	
	//	Read version at first
	unsigned int dwVersion;
	fread(&dwVersion, 1, sizeof (unsigned int), fp);

	if (dwVersion > ELBUFREGION_VERSION)
	{
		fclose(fp);
		return false;
	}

	//	Reset file pointer
	fseek(fp, 0, SEEK_SET);

	//	Read file header
	BUFREGIONHEADER Header;
	fread(&Header, 1, sizeof (Header), fp);
	m_dwTimeStamp = Header.dwTimeStamp;

	for (int i=0; i < Header.iNumRegion; i++)
	{
		CELBufRegion* pRegion = new CELBufRegion;
		if (!pRegion->Load(fp, (int)dwVersion))
			return false;

		m_aBufRegions.push_back(pRegion);
	}

	fclose(fp);
	return true;
}



