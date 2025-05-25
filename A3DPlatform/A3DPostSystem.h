/*
 * FILE: A3DPostSystem.h
 *
 * DESCRIPTION: ����ϵͳ
 *
 * CREATED BY: Panyupin, 2012/2/1
 *
 * HISTORY: 
 *
 * Copyright (c) 2012 Archosaur Studio, All Rights Reserved.
 */
#ifndef _A3D_POSTSYSTEM_H_
#define _A3D_POSTSYSTEM_H_

#include "A3d.h"
#include "ElementRenderParam.h"
#include "A3DPlatformMacro.h"

class ElementRender;
class A3DPost;
class A3DPostCC;
class A3DPostGodRay;
class A3DPostAA;
class A3DPostBloom;
class A3DPostDof;
class A3DPostRadialBlur;
class A3DPostMotionBlur;
class A3DPostWarp;
class A3DPostFullGlow;
class A3DPostSunMoon;
class A3DPostFlare;
class A3DPostRadialBlurFast;
class A3DPostSilhouette;

class A3DPostSystem : public A3DDevObject
{
public:
	// ��ʼ��
	bool Init(A3DDevice* pDev, ElementRender* pElementRender);
	// �ͷ�
	void Release();
	// �����豸��ʧ�ͷֱ��ʸı�
	virtual bool BeforeDeviceReset();
	virtual bool AfterDeviceReset();
		

	// ���������Ӧ����. ����2������Ӧ�ð���˳�����.
	bool ApplyParam(const A3DPOST_EFFECT_PARAM* pParam);

	bool BeforeRender();
	
	//��������Zת��Ϊ���Ե�
	bool RenderLinearZ(A3DViewport* pViewport, A3DRenderTarget* pLinearZRT, A3DRenderTarget* pUnLinearZRT, bool bUseIntZ);
	
	// ��Ⱦ����Ч��
	bool Render(A3DRenderTarget* pInputRT, A3DViewport* pViewport, bool bUseIntZ, bool bApplyPostEffect = true);
	bool RenderAfterUI(A3DRenderTarget* pInputRT, A3DViewport* pViewport, bool bUseIntZ, bool bApplyPostEffect = true);

	// ȡ�غ������
	bool RetriveParam(A3DPOST_EFFECT_PARAM* pParam);
	// ���IntZ����,������
	void OutputIntZ(A3DViewport* pViewport);//��Device�ڲ���IntZֵ��Ⱦ����.

	//	��һ��RenderTarget����ɫ���
	bool ClearRenderTarget(A3DRenderTarget* pRenderTarget, int iWidth, int iHeight, const A3DVECTOR4& vColor);

	int GetWidth(){ return m_nScreenWidth; }
	int GetHeight(){ return m_nScreenHeight; }

	A3DRenderTarget* GetPlayerSilhousetteRT() const;
	A3DRenderTarget* GetBloomRT() const;
private:
	//���º���������A3DPost����.
    friend class ElementRender;
	friend class A3DPostCC;
	friend class A3DPostGodRay;
	friend class A3DPostBloom;
	friend class A3DPostAA;
	friend class A3DPostDof;
	friend class A3DPostRadialBlur;
	friend class A3DPostRadialBlurFast;
	friend class A3DPostMotionBlur;
	friend class A3DPostWarp;
	friend class A3DPostFullGlow;
    friend class A3DPostSunMoon;
    friend class A3DPostFlare;
	friend class A3DPostSilhouette;

	// ��ȡ�豸
	A3DDevice* GetA3DDevice() const { return m_pA3DDevice; }
	A3DEngine* GetA3DEngine() const { return m_pA3DEngine; }
	void SetupCommonVS(int nTargetWidth, int nTargetHeight);
	A3DHLSL* GetCommonVS() const { return m_pCommonVertexShader; }
	A3DHLSL* GetCommonPS() const { return m_pCommonPixelShader; }
	void RenderQuad();

    A3DRenderTarget* GetSrcRT() const 
    {     
        //��Ӧ�õ���
        ASSERT(0); 
        return m_pColorTarget[0]; 
    }
	A3DRenderTarget* GetDstRT() const 
    { 
        ASSERT(0); 
        return m_pColorTarget[1]; 
    }
	void SwapSrcDstRT();

	bool IsLinearZReady();

	// ֱ������PostEffect���,ԭ����Ͻ����µ�ֵ���
	bool SetEffectMask(DWORD dwFlags);
	
	A3DFORMAT	GetBackBufferFmt();
	A3DFORMAT	GetSmallestFloatRGBAFmt(){ return m_fmtSmallestFloatRGBA; }
	A3DFORMAT	GetSmallestFloatRFmt() { return m_fmtSmallestFloatR; }

	A3DRenderTarget* GetLinearDepthRT();
	A3DFORMAT GetLinearDepthFmt();

	A3DRenderTarget* GetScreenIlumRT();

	const D3DVERTEXELEMENT9* GetD3D9VertElement() const;
    bool IsActive(A3DPost* pPost) const;

public:	
	A3DPostSystem()
	{
		m_pA3DDevice = NULL;
		m_pA3DEngine = NULL;
		m_bNeedReset = false;
		m_fmtBackBuffer = A3DFMT_UNKNOWN;
		m_fmtSmallestFloatRGBA = A3DFMT_UNKNOWN;
		m_fmtSmallestFloatR = A3DFMT_UNKNOWN;
		m_pCommonVertexShader = NULL;
		m_pCommonPixelShader = NULL;
		m_pIntZ2FloatPixelShader = NULL;
		m_pScreenIlumPS1 = NULL;
		m_pScreenIlumPS2 = NULL;
		m_pScreenIlumPS3 = NULL;
		m_pScreenIlumAccum = NULL;
		m_pScreenIlumRT64 = NULL;
		m_pScreenIlumRT16 = NULL;
		m_pScreenIlumRT4 = NULL;
		m_pScreenIlumRT1 = NULL;
		m_pScreenIlumRT1_accum1 = NULL;
		m_pScreenIlumRT1_accum2 = NULL;
		m_pBloomMeshRT = NULL;


		m_pClearPixelShader = NULL;
		m_pStream = NULL;
		m_pStreamDecl = NULL;
		m_dwFlags = 0;
		m_pColorTarget[0] = NULL;
		m_pColorTarget[1] = NULL;
		m_nScreenWidth = 0;
		m_nScreenHeight = 0;

		m_bAAAfterUI = false;
		m_bCCAfterUI = false;

		m_pPostCC = NULL;
		m_pPostGodRay = NULL;
		m_pPostBloom = NULL;
		m_pPostBloomLocal = NULL;
		m_pPostAA = NULL;
		m_pPostDof = NULL;
		m_pPostRadialBlur = NULL;
		m_pPostMotionBlur = NULL;
		m_pPostWarp = NULL;
		m_pPostFullGlow = NULL;
        m_pPostSunMoon = NULL;
        m_pPostFlare = NULL;
		m_pPostRadialBlurFast = NULL;
		m_pPostSilhouette = NULL;

	}
private:
	void ReleaseResource();
	bool CreateResource();
	void ComputeScreenIlum();

	A3DDevice*			m_pA3DDevice;				//�豸
	A3DEngine*			m_pA3DEngine;				//����
	ElementRender*		m_pElementRender;
	bool				m_bNeedReset;

	A3DFORMAT			m_fmtBackBuffer;
	A3DFORMAT			m_fmtSmallestFloatRGBA;
	A3DFORMAT			m_fmtSmallestFloatR;

	A3DHLSL*			m_pCommonVertexShader;		//������vertexShader
	A3DHLSL*			m_pCommonPixelShader;
	A3DHLSL*			m_pIntZ2FloatPixelShader;
	A3DHLSL*			m_pClearPixelShader;

	A3DHLSL*			m_pScreenIlumPS1;
	A3DHLSL*			m_pScreenIlumPS2;
	A3DHLSL*			m_pScreenIlumPS3;
	A3DHLSL*			m_pScreenIlumAccum;

	A3DRenderTarget*	m_pScreenIlumRT64;
	A3DRenderTarget*	m_pScreenIlumRT16;
	A3DRenderTarget*	m_pScreenIlumRT4;
	A3DRenderTarget*	m_pScreenIlumRT1;
	A3DRenderTarget*	m_pScreenIlumRT1_accum1;
	A3DRenderTarget*	m_pScreenIlumRT1_accum2;
	A3DRenderTarget*	m_pBloomMeshRT;

	bool				m_bDeviceSupportRGBA8RT;
	bool				m_bDeviceSupportRGBA16RT;
	bool				m_bDeviceSupportRGBA32RT;

	A3DStream*			m_pStream;
	A3DVertexDecl*		m_pStreamDecl;

	A3DIBLVERTEX		m_aVertices[8];

	DWORD				m_dwFlags;					//�����ЩEffect�ǿ�����.
	DWORD				m_dwCanInit;				//�����ЩEffect���Գɹ���ʼ��.
	A3DRenderTarget*	m_pColorTarget[2];

	int					m_nScreenWidth;
	int					m_nScreenHeight;
	
	bool				m_bAAAfterUI;
	bool				m_bCCAfterUI;

	abase::vector<A3DPost*>		m_aPostList;
	A3DPostCC*					m_pPostCC;
	A3DPostGodRay*				m_pPostGodRay;
	A3DPostBloom*				m_pPostBloom;
	A3DPostBloom*				m_pPostBloomLocal;
	A3DPostAA*					m_pPostAA;
	A3DPostDof*					m_pPostDof;
	A3DPostRadialBlur*			m_pPostRadialBlur;
	A3DPostMotionBlur*			m_pPostMotionBlur;
	A3DPostWarp*				m_pPostWarp;
	A3DPostFullGlow*			m_pPostFullGlow;
    A3DPostSunMoon*			    m_pPostSunMoon;
    A3DPostFlare*			    m_pPostFlare;
	A3DPostRadialBlurFast*		m_pPostRadialBlurFast;
	A3DPostSilhouette*			m_pPostSilhouette;
};


#endif
