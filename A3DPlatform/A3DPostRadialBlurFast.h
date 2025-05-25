/*
 * FILE: A3DPostRadialBlurFast.h
 *
 * DESCRIPTION: �򻯵ľ���ģ������
 *
 * CREATED BY: Panyupin, 2012/10/31
 *
 * HISTORY: 
 *
 * Copyright (c) 2012 Archosaur Studio, All Rights Reserved.
 */

#ifndef _A3D_POST_RADIALBLUR_FAST_H_
#define _A3D_POST_RADIALBLUR_FAST_H_

#include "A3DPost.h"

class A3DPostSystem;

class A3DPostRadialBlurFast : public A3DPost
{
public:
	virtual ~A3DPostRadialBlurFast();
	// �ͷ�
	virtual void Release();
	// ��Ⱦ���
	virtual bool Render(A3DViewport* pViewport);
	// ��Ч����
	virtual A3DPOST_EFFECT GetEffectType() const;
	// Ӳ��
	static bool IsHardwareSupport(A3DDevice* pA3DDev);
    // ��Ⱦ���
    virtual A3DRenderTarget* ApplyEffect(A3DViewport* pViewport, A3DRenderTarget* pSrcRT);

public:
	// ��ʼ��
	bool	Init(A3DPostSystem* pSystem);

	void	SetBlurCenterWorldSpace(const A3DVECTOR3& vWorldPos, A3DViewport* pViewPort);
	void	SetBlurCenterScreenSpace(float x, float y); // (0.5, 0.5)����Ļ�м�, (0,0)�����Ͻ�, (1,1)�����½�;
	void	GetBlurCenterScreenSpace(float* pX, float* pY);
	void	SetBlurLength(float fBlurLength);
	float	GetBlurLength();
	void	SetFocusRadius(float fInFocusRadius, float fOutFocusRadius);
	void	GetFocusRadius(float* pfInFocusRadius, float* pfOutFocusRadius);

	A3DPostRadialBlurFast()
	{
		m_pHLSLRB = NULL;
		m_pHLSLDownSamp = NULL;
		m_pHLSLMerge = NULL;
		m_vBlurCenter = A3DVECTOR3(0.5f, 0.5f, 0);		//��Ļ�м�
		m_fBlurLength = 0.2f;							
		m_fInFocusRadius = 0.2f;
		m_fOutFocusRadius = 0.7f;
	}
private:
	A3DHLSL*					m_pHLSLRB;	
	A3DHLSL*					m_pHLSLDownSamp;
	A3DHLSL*					m_pHLSLMerge;

	A3DVECTOR3					m_vBlurCenter;
	float						m_fBlurLength;
	float						m_fInFocusRadius;
	float						m_fOutFocusRadius;
};


#endif