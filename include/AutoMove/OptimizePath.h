/********************************************************************
	created:	2007/03/12
	author:		kuiwu
	
	purpose:	A simple, efficient, and high quality path  optimizer
	Copyright (C) 2007 - All Rights Reserved
*********************************************************************/
#ifndef _OPTIMIZE_PATH_H_
#define  _OPTIMIZE_PATH_H_


#include <vector.h>
using namespace abase;
#include <A3DTypes.h>

//#include "MoveMap.h"
#include "PfConstant.h"

namespace AutoMove
{

class CLine
{
public:
	CLine(){};
	~CLine(){};
	void Init(APointF& from, int dirX, int dirY);
	void Init(APointF& from, APointF& dir);
	APointF  Next();
	int      GetCount() { return count;};
	APointF  GetFrom() {return from;};
	void  Reset() {count = 0;};
	APointF GetDir(){return dir;};
private:
	APointF  from;
	APointF  dir;  
	int      count;
	
};	

class COptimizePath  
{
public:
	COptimizePath(int mapW, int mapH);
	virtual ~COptimizePath();
	void SetupOptimize(const vector<PathNode>& initpath, int catchCount = 10);
	void StepOptimize();
	bool NeedOptimize(int moveindex);
	vector<PathNode>* GetPath()
	{
		return &m_Path;
	}
	
	inline int GetFootprint(int x, int y)
	{
		return m_LookUp[y*m_MapWidth + x];
	}
	inline int GetFootprint(const APointF& pt)
	{
		return GetFootprint((int)pt.x, (int)pt.y);
	}
	
	inline void SetFootprint(int x, int y, int val)
	{
		m_LookUp[y*m_MapWidth + x] = val;
	}
	
	inline void SetFootprint(const APointF& pt, int val)
	{
		SetFootprint((int)pt.x, (int)pt.y, val);
	}

	inline	int        GetCatchCount() const
	{
		return m_CatchCount;
	}
private:
	void _AddPathPortion(CLine& line, const int oldCount, const int newCount);

	void _LocalOptimize();
	bool _LineTo(CLine& line, APointF& to);
	void _CheckLayer();
	void _PathIntersect(const int to_index);
private:
	int                        m_MapWidth;
	int                        m_MapHeight;
	short                     *  m_LookUp;   //used for accelerate optimizing
	vector<PathNode>          m_Path;
	int                        m_CurIndex; // next node to optimize
	int                        m_CatchCount;    //the node count that movement catches optimization
	int                        m_CurLayer;

};


}

#endif