#include "stdafx.h"
#include "Zone.h"
#include "PolygonFuncs.h"
#include <memory>

Zone::Zone(void)
{
	m_pPoints = 0;
	m_iPointNum = 0;
}

Zone::~Zone(void)
{
	release();
}

void Zone::release()
{
	delete []m_pPoints;
	m_pPoints = 0;
	m_iPointNum = 0;
}

bool Zone::Init(PG_POINT* pPoints, int iPointNum)
{
	release();
	if(!pPoints || iPointNum < 3)
		return false;
	m_iPointNum = iPointNum;
	m_pPoints = new PG_POINT[m_iPointNum];
	memcpy(m_pPoints, pPoints, sizeof(PG_POINT) * m_iPointNum);
	
	return true;
}

bool Zone::IsPtIn(const PG_POINT& pt)
{
	if(!IsInPolyGon(pt, m_pPoints, m_iPointNum))
		return false;
	return true;
}

bool Zone::IsPtIn(float x, float z)
{
	PG_POINT pt;
	pt.x = x;
	pt.y = z;
	if(!IsPtIn(pt))
		return false;
	return true;
}

float Zone::PtDistance(const PG_POINT& pt)
{
	return Distance2Polygon(pt, m_pPoints, m_iPointNum);
}

float Zone::PtDistance(float x, float z)
{
	PG_POINT pt;
	pt.x = x;
	pt.y = z;
	float f = PtDistance(pt);
	return f;
}