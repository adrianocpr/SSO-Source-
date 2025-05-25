/*
 * FILE: A3DPost.h
 *
 * DESCRIPTION: ����Ļ���
 *
 * CREATED BY: Panyupin, 2012/2/1
 *
 * HISTORY: 
 *
 * Copyright (c) 2012 Archosaur Studio, All Rights Reserved.
 */

#ifndef _A3D_POST_H_
#define _A3D_POST_H_

#include "A3DDevice.h"
#include "A3DViewport.h"
#include "A3DTexture.h"
#include "A3DRenderTarget.h"
#include "a3drendertargetman.h"
#include "A3DVertexShader.h"

class A3DPostSystem;
class A3DHLSL;
enum A3DPOST_EFFECT;

class A3DPost
{
public:
	virtual ~A3DPost(){}
	// �ͷ�
	virtual void Release() = 0;
	// ��Ⱦ���
	virtual bool Render(A3DViewport* pViewport) = 0;
	// ��Ч����
	virtual A3DPOST_EFFECT GetEffectType() const = 0;

    // ��Ⱦ���
    virtual A3DRenderTarget* ApplyEffect(A3DViewport* pViewport, A3DRenderTarget* pSrcRT) = 0;

	A3DPost()
	{
		m_pSystem = NULL;
	}
protected:
	A3DPostSystem* m_pSystem;
};
#endif