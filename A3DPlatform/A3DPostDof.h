/*
 * FILE: A3DPostDof.h
 *
 * DESCRIPTION: �������
 *
 * CREATED BY: Panyupin, 2012/2/7
 *
 * HISTORY: 
 *
 * Copyright (c) 2012 Archosaur Studio, All Rights Reserved.
 */
#ifndef _A3D_POST_DOF_H_
#define _A3D_POST_DOF_H_

#include "A3DPost.h"

class A3DPostSystem;

class A3DPostDof : public A3DPost
{

public:
	virtual ~A3DPostDof();
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

	void		SetClampBlurFar(float fBlurFar);
	float		GetClampBlurFar(){ return m_fClampBlurFar;}
	void		SetFocus(float fNearBlur, float fNearFocus, float fFarFocus, float fFarBlur);
	void		GetFocus(float* pfNearBlur, float* pfNearFocus, float* pfFarFocus, float* pfFarBlur);

	A3DPostDof()
	{
		m_fNearFocus = 1.f;
		m_fFarFocus = 10.f;
		m_fNearBlur = 0.1f;
		m_fFarBlur = 30.f;
		m_fClampBlurFar = 1.f;
	}
private:

	A3DHLSL*			m_pHLSL_FillAlphaWithCoC;
	A3DHLSL*			m_pHLSL_DownScaleRGBCoC;
	A3DHLSL*			m_pHLSL_BlurMaxRGBCoCX;
	A3DHLSL*			m_pHLSL_BlurMaxRGBCoCY;
	A3DHLSL*			m_pHLSL_DownScaleDepth;
	A3DHLSL*			m_pHLSL_BlurDepthX;
	A3DHLSL*			m_pHLSL_BlurDepthY;
	A3DHLSL*			m_pHLSL_SC2_Dof;

	float m_fNearFocus;	//���㷶Χ������һ��
	float m_fFarFocus;	//���㷶Χ��������һ��,�ڽ��㷶Χ����֮�ڵ�����û��ģ��
	float m_fNearBlur;   //����,������߽��ڴ˾���Ϊģ�����
	float m_fFarBlur;     //Զ��,������߳����˾���Ϊģ�����
	float m_fClampBlurFar;//Զ��ģ�������ֵ,0��1֮��.һ����Ϊ1�Ϳ���
};



#endif