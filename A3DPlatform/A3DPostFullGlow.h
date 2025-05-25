/*
 * FILE: A3DPostFullGlow.h
 *
 * DESCRIPTION: FullGlow����
 *
 * CREATED BY: Panyupin, 2012/3/8
 *
 * HISTORY: 
 *
 * Copyright (c) 2012 Archosaur Studio, All Rights Reserved.
 */
#ifndef _A3D_POST_FULLGLOW_H_
#define _A3D_POST_FULLGLOW_H_

#include "A3DPost.h"

class A3DPostSystem;

class A3DPostFullGlow : public A3DPost
{
public:
	virtual ~A3DPostFullGlow();
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

	void	SetBlurSize(float fBlurSize);
	float	GetBlurSize(){ return m_fBlurSize; }
	void	SetGlowLevel(float fGlowLevel){ m_fGlowLevel = fGlowLevel; }
	float	GetGlowLevel(){ return m_fGlowLevel; }
	void	SetGlowPower(float fGlowPower){ m_fGlowPower = fGlowPower; }
	float	GetGlowPower(){ return m_fGlowPower; }
	void	SetGlowColor(const A3DVECTOR4& color){ m_vGlowColor = color; }
	const A3DVECTOR4& GetGlowColor(){ return m_vGlowColor; }

	A3DPostFullGlow()
	{
		m_pThresholdPS = NULL;
		m_pBlurXPS = NULL;
		m_pBlurYPS = NULL;
		m_pMergePS = NULL;

		//Ĭ��ֵ
		m_fBlurSize = 1.f;
		m_fGlowLevel = 0.5f;
		m_fGlowPower = 0.5f;
		m_vGlowColor = A3DVECTOR4(0.0f, 0.0f, 1.f, 1.0);

	}
private:
	A3DHLSL*			m_pThresholdPS;
	A3DHLSL*			m_pBlurXPS;
	A3DHLSL*			m_pBlurYPS;
	A3DHLSL*			m_pMergePS;

	float			m_fBlurSize;				//ģ�����룬ռ��Ļ��С�İٷֱȣ�0~0.1
	float			m_fGlowLevel;
	float			m_fGlowPower;
	A3DVECTOR4	m_vGlowColor;
};


#endif