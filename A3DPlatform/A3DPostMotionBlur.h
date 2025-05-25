/*
 * FILE: A3DPostMotionBlur.h
 *
 * DESCRIPTION: �˶�ģ������
 *
 * CREATED BY: Panyupin, 2012/3/6
 *
 * HISTORY: 
 *
 * Copyright (c) 2012 Archosaur Studio, All Rights Reserved.
 */

#ifndef _A3D_POST_MOTIONBLUR_H_
#define _A3D_POST_MOTIONBLUR_H_

#include "A3DPost.h"

class A3DPostSystem;

class A3DPostMotionBlur : public A3DPost
{
public:
	virtual ~A3DPostMotionBlur();
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

	void SetBlurMax(float fBlurMax){ m_fBlurMax = fBlurMax; }
	float GetBlurMax(){ return m_fBlurMax; }
	void SetBlurScale(float fBlurScale){ m_fBlurScale = fBlurScale; }
	float GetBlurScale(){ return m_fBlurScale; }

	void SetBlurScalePosition(float fBlurScalePosition){ m_fBlurScalePosition = fBlurScalePosition; }
	float GetBlurScalePosition(){ return m_fBlurScalePosition; }
	void SetBlurScaleRotation(float fBlurScaleRotation){ m_fBlurScaleRotation = fBlurScaleRotation; }
	float GetBlurScaleRotation(){ return m_fBlurScaleRotation; }

	void SetInFocusDistance(float fInFocusDistance){ m_fInFocusDistance = fInFocusDistance; }
	float GetInFocusDistance(){ return m_fInFocusDistance; }
	void SetOutFocusDistance(float fOutFocusDistance){ m_fOutFocusDistance = fOutFocusDistance; }
	float GetOutFocusDistance(){ return m_fOutFocusDistance; }

	A3DPostMotionBlur()
	{
		m_pHLSL = NULL;
		m_pDownSampHLSL = NULL;
		m_pMergeHLSL = NULL;
		m_pA3DStreamSphere = NULL;
		m_pA3DStreamSphereDecl = NULL;
		m_bFirstRun = true;

		m_fBlurMax = 0.03f;
		m_fBlurScale = 0.05f;
		m_fBlurScalePosition = 3.0f;
		m_fBlurScaleRotation = 10.0f;
		m_fInFocusDistance = 15.f;
		m_fOutFocusDistance = 80.f;
	}
private:
	A3DHLSL*					m_pHLSL;
	A3DHLSL*					m_pDownSampHLSL;
	A3DHLSL*					m_pMergeHLSL;

	bool						m_bFirstRun;
	A3DStream* m_pA3DStreamSphere;
	A3DVertexDeclCommon* m_pA3DStreamSphereDecl;
	A3DVECTOR3 m_vCameraPosLast;
	A3DVECTOR3 m_vCameraDirLast;
	A3DVECTOR3 m_vCameraUpLast;

	A3DVECTOR3 m_vRealCameraPosLast;
	A3DVECTOR3 m_vRealCameraDirLast;
	A3DVECTOR3 m_vRealCameraUpLast;

	float m_fBlurMax;	       //ģ���������ֵ,0~1֮��,һ��0.03����
	float m_fBlurScale;        //ģ�������ƣ���ģ������������˶��ٶ�֮��Ĺ�ϵ
 	float m_fBlurScalePosition;//�����λ���ƶ���ɵ�ģ������Ȩ�� 1~10
 	float m_fBlurScaleRotation;//�������ת��ɵ�ģ����Ȩ�� 1~10
	float m_fInFocusDistance;  //�ڸ���ȷ�Χ�ڵ����ز��ᱻģ��
	float m_fOutFocusDistance; //�ڸ���ȷ�Χ֮������ػᱻ����޶�ģ��
};


#endif