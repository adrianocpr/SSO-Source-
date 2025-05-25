/*
 * FILE: A3DPostSunMoon.h
 *
 * DESCRIPTION: ��Ⱦ̫��������
 *
 * CREATED BY: Yaochunhui, 2012/4/6
 *
 * HISTORY: 
 *
 * Copyright (c) 2012 Archosaur Studio, All Rights Reserved.
 */
#ifndef _A3D_POST_SUN_MOON_H_
#define _A3D_POST_SUN_MOON_H_

#include "A3DPost.h"

class A3DPostSystem;
class A3DSunMoon;

class A3DPostSunMoon : public A3DPost
{
public:
	virtual ~A3DPostSunMoon();
	// �ͷ�
	virtual void Release();
	// ��Ⱦ���
	virtual bool Render(A3DViewport* pViewport);
	// ��Ч����
	virtual A3DPOST_EFFECT GetEffectType() const;
	//Ӳ��
	static bool IsHardwareSupport(A3DDevice* pA3DDev);
    // ��Ⱦ���
    virtual A3DRenderTarget* ApplyEffect(A3DViewport* pViewport, A3DRenderTarget* pSrcRT);

public:
	// ��ʼ��
	bool Init(A3DPostSystem* pSystem);

	A3DPostSunMoon()
	{
        m_pSunMoon = NULL;
	}

    void SetSunMoon(A3DSunMoon* pSunMoon) { m_pSunMoon = pSunMoon; }
private:
	A3DSunMoon*		m_pSunMoon;

};



#endif