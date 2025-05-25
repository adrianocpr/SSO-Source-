#pragma once

struct PG_POINT;

class Zone
{
public:
	Zone(void);
	~Zone(void);
public:
	bool				Init(PG_POINT* pPoints, int iPointNum);
	bool				IsPtIn(const PG_POINT& pt);
	bool				IsPtIn(float x, float z);
	float				PtDistance(const PG_POINT& pt);
	float				PtDistance(float x, float z);
protected:
	void				release();
protected:
	PG_POINT*		m_pPoints;
	int					m_iPointNum;
};
