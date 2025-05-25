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

// �ж�һ���Ƿ��ڶ������
// pt:�����ꣻptLines:����Σ��õ㼯��ʾ��nNumLine:����ζ��㣨�ߣ��ĸ���
bool IsInPolyGon(PG_POINT pt, PG_POINT* ptLines, int nNumLine);
// �ж������Ƿ�����ཻ
// pt:���Ե㣻ptLines:����ζ��㼯��nIndex:�ߣ���һ�����㣩����ţ�nNumLine:�ܱߣ����㣩��
bool IsCrossLine(PG_POINT pt, PG_POINT* ptLines, int nIndex, int nNumLine);

float Distance2Polygon(const PG_POINT& pt, PG_POINT* ptLines, int nNumLine);

#endif // #ifndef _POLYGONFUNC_H_