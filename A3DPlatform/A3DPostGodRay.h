/*
 * FILE: A3DPostGodRay.h
 *
 * DESCRIPTION: ������
 *
 * CREATED BY: Panyupin, 2012/2/2
 *
 * HISTORY: 
 *
 * Copyright (c) 2012 Archosaur Studio, All Rights Reserved.
 */

#ifndef _A3D_POST_GODRAY_H_
#define _A3D_POST_GODRAY_H_

#include "A3DPost.h"
#include "A3DVertex.h"
#include "A3DMacros.h"

class A3DPostSystem;

class A3DPostGodRay : public A3DPost
{
public:
	virtual ~A3DPostGodRay();
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
	bool Init(A3DPostSystem* pSystem);

	//ÿ֡���õ���
	void SetLightDir(const A3DVECTOR3& vLightDir){ m_vLightDir = vLightDir; }

	void		SetVisibleAngle(float fAngle);
	float		GetVisibleAngle(){ return m_fVisibleAngle; }
	void		SetOcclusionDepthRange(float fRange);
	float		GetOcclusionDepthRange();
	void		SetBloomScale(float fBloomScale);
	float		GetBloomScale();
	void		SetBloomThreshold(float fBloomThreshold);
	float		GetBloomThreshold();
	void		SetScreenBlendThreshold(float fScreenBlendThreshold);
	float		GetScreenBlendThreshold();
	void		SetBloomTintColor(const A3DVECTOR3& vColor);
	A3DVECTOR3	GetBloomTintColor();
	void		SetOcclusionDarkness(float fOcclusionDarkness);
	float		GetOcclusionDarkness();

	A3DPostGodRay()
	{
		m_pSunPS = NULL;
		m_pBlurPS = NULL;
		m_pMergePS = NULL;

		m_fVisibleAngle = A3D_PI / 3.f;

		m_fOcclusionDepthRange = 1000.f;
		m_fBloomScale = 1.f;
		m_fBloomThreshold = 0.f;
		m_fScreenBlendThreshold = 1.0;
		m_vBloomTint = A3DVECTOR3(1,1,1);
		m_fOcclusionDarkness = 0.3f;
	}
private:
	bool CreateSunRT(int nQuality);
	bool LoadShader();

	A3DIBLVERTEX		m_aSunQuadVertex[4];
	A3DHLSL*			m_pSunPS;
	A3DHLSL*			m_pBlurPS;
	A3DHLSL*			m_pMergePS;
	A3DHLSL*			m_pDownSampPS;
	float				m_fVisibleAngle;//�ɼ��Ƕ�,0 ~ 2*A3D_PI֮��

	float				m_fOcclusionDepthRange;		//���ڴ���ȵ�������ɫ�ᱻ��������Bloom,С�ڴ���ȵ�������ɫ���Ϊ��
	float				m_fBloomScale;				//Bloom����ǿ��. 0Ϊ������Bloom, �޹���
	float				m_fBloomThreshold;			//���ȴ��ڴ˲��ֲŻᱻ��������Bloom
	float				m_fScreenBlendThreshold;	//��Ļ���ȱ���С�����ֵ�Ż����Bloom�ĵ���, ԽС����Խ��
	A3DVECTOR3			m_vBloomTint;				//������ɫ��������ֵ֮���ٽ���bloom
	float				m_fOcclusionDarkness;		//����ģ�����OcclusionMask����Ļ��ɫ���кڻ�, 0�����̶Ⱥڻ�,1�򲻺ڻ�


	A3DVECTOR4			m_vBlurCenter;				//ģ������. ��RenderSun��ʱ�����, ��blur��ʱ���õ�
	float				m_fAngleScale;

	A3DVECTOR3			m_vLightDir;
};

#endif