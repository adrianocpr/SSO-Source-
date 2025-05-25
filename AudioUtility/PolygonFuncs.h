/*
 * FILE: PolygonFunc.h
 *
 * DESCRIPTION: Functions for polygon
 *
 * CREATED BY: Jiang Dalong, 2005/03/14
 *
 * HISTORY: 
 *
 * Copyright (c) 2001-2008 Archosaur Studio, All Rights Reserved.
 */

#ifndef _AUDIO_POLYGONFUNC_H_
#define _AUDIO_POLYGONFUNC_H_

struct PG_POINT
{
	float x;
	float y;
};

// 判断一点是否在多边形内
// pt:点坐标；ptLines:多边形，用点集表示；nNumLine:多边形顶点（边）的个数
bool IsInPolyGon(PG_POINT pt, PG_POINT* ptLines, int nNumLine);
// 判断射线是否与边相交
// pt:测试点；ptLines:多边形顶点集；nIndex:边（第一个顶点）的序号；nNumLine:总边（顶点）数
bool IsCrossLine(PG_POINT pt, PG_POINT* ptLines, int nIndex, int nNumLine);

float Distance2Polygon(const PG_POINT& pt, PG_POINT* ptLines, int nNumLine);

#endif // #ifndef _POLYGONFUNC_H_