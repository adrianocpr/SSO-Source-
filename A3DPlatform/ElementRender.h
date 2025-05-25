#ifndef _A3D_PLATFORM_H_
#define _A3D_PLATFORM_H_

#include "A3D.h"
#include "ElementRenderParam.h"
#include "ECRObjBase.h"


class A3DHLSL;
class A3DGFXWarp;
class A3DSSAO;
class A3DTerrainWaterFFT;
class A3DMirrorPlaneRender;

class ElementRender : public A3DDevObject
{
public:
    // ������Ϸ�����в����Ķ���
    struct GameObjects
    {
        A3DGFXExMan*		pA3DGFXExMan;
        ECRObjBase*			pGFXCaster;
        ECRObjBase*			pImgRes;
        ECRObjBase*			pUIManager;				//	UI manager
        A3DSkinRenderBase*	pSkinRender;
        A3DSkinRenderBase*	pSkinRender2;			// ���䷴���õ�
		A3DSkinRenderBase*	pSkinRenderShadow;		//��Ⱦ��Ӱ�õ�
		A3DSkinRenderBase*	pSkinRenderSilhouette;	//��Ⱦ�����õ�
    };

    // ÿ��������ԵĶ���
    struct WorldObjects
    {
        A3DSkySphere*		pA3DSky;
        A3DSunMoon*			pSunMoon;
        A3DTerrainOutline2* pTerrainOutline;
        A3DTerrain2*		pA3DTerrain;
        //A3DTerrainWater*	pA3DTerrainWater; //FIXME!!
		A3DTerrainWater2*	pA3DTerrainWater2;
		A3DTerrainWaterFFT* pA3DTerrainWaterFFT;
        ECRObjBase*			pScene;
        A3DGrassLand*		pGrassLand;
        A3DRain*			pRain;
        A3DSnow*			pSnow;
        ECRObjBase*         pMaskModifier;
        ECRObjBase*         pCloudRender;
    };

	// Reflected rendering parameters for mirror.
	struct MirrorReflectedRenderParam 
	{
		ECRENDERPARAM*				pECRenderParam;
		const ELEMENT_RENDER_PARAM*	pElementRenderParam;
	};

protected:
    // ��ֹ���� ElementRender ����ʹ��AfxGetElementRender()
    ElementRender();
    virtual ~ElementRender();

public:

	bool Init(A3DDevice* pA3DDevice);
	void Release();

	A3DDevice* GetA3DDevice() { return m_pA3DDevice; }

	bool Render(ECViewport*	pViewport, const ELEMENT_RENDER_PARAM* pParam, A3DRenderTarget* pFrameBuffer = NULL);

	bool Tick(DWORD dwDeltaTime);
    
    void RegisterManager(ECManager* pManager);
    void UnRegisterManager(ECManager* pManager);
    
    void RegisterGameObjects(const GameObjects& objs);
    void RegisterWorldObjects(const WorldObjects& objs);
    
    const GameObjects& GetGameObjs() const { return m_GameObjs; }
    const WorldObjects& GetWorldObjs() const { return m_WorldObjs; }
    const ELEMENT_RENDER_PARAM* GetParams() const { return m_pParams; }

	A3DMirrorPlaneRender* GetMirrorPlaneRender() { return m_pMirrorPlaneRender; }

    //	��ȡ���RT
	A3DRenderTarget* GetLinearZRT(){ return m_pZRt; }
	A3DRenderTarget* GetUnLinearZRT() { return m_pUnLinearZRt; }

	//	�������RT�Ƿ�׼�����
	bool IsLinearZReady(){ return m_bIsLinearZReady; }

    void SetWaterReflectMap(const char* szFileName);
    const char* GetWaterReflectMap() const { return m_strWaterCubeMap; }
	
	//����һ����������������.
	// szOutputTextureFileName: �������������ļ�·����
	// nBright:		����,		��Χ��[-100~100]
	// nConstrast:	�Աȶ�,		��Χ��[-100~100]
	// nHue:		ɫ��,		��Χ��[-180~180]
	// nSaturation:	���Ͷ�,		��Χ��[-100~100]
	// bGrey:		�Ƿ�ת��Ϊ�Ҷ�ͼ
	// bOpposition:	�Ƿ�ɫ
	bool CreateCCVolumeTexture(const char* szOutputTextureFileName,
		const A3DPOST_EFFECT_CC_PARAM::ManualParam& manualParam);

	bool IsAlphaModelWriteZ();
	void SetAlphaModelWriteZ(bool bAlphaModelWriteZ);

    bool RenderSilhouetteByAlpha(A3DViewport* pViewport, A3DRenderTarget* pTargetRT);

    void SetPostEffectParam(const A3DPOST_EFFECT_PARAM& paramPost);
private:
	//	Before device reset
	virtual bool BeforeDeviceReset();
	//	After device reset
	virtual bool AfterDeviceReset();
	
    void RenderManagers(ECViewport* pViewport, bool bPost);
	bool RenderUI(const ELEMENT_RENDER_PARAM* pParam);

	bool ZPrePass(const ZPREPASS_PARAM* pParam);
	bool ShadowPass(SHADOWPASS_PARAM* pParam);

	bool RenderLinearZ(A3DViewport* pViewport, bool bUseIntZ);

	bool RenderOnSky(const ELEMENT_RENDER_PARAM* pParam);
	bool RenderGrasses(const ELEMENT_RENDER_PARAM* pParam, bool bRenderAlpha);
	bool RenderNatureObjects(const ELEMENT_RENDER_PARAM* pParam);

	bool RenderForRefracted(const ELEMENT_RENDER_PARAM* pParam, A3DViewport* pRefractedViewport);
	bool RenderForReflected(const ELEMENT_RENDER_PARAM* pParam, A3DViewport* pReflectedViewport);

	bool RenderForMirrorReflected(const MirrorReflectedRenderParam* pMirrorReflectedParam, A3DViewport* pReflectedViewport);

	bool InitFrameBuffer();

	friend void WorldRenderOnSky(A3DViewport * pViewport, void * pArg);
	friend void WorldRenderForReflected(A3DViewport * pViewport, void * pArg);
	friend void WorldRenderForRefracted(A3DViewport * pViewport, void * pArg);
	friend void WorldRenderForMirrorReflected(A3DViewport * pViewport, void * pArg);

    void ReloadWaterCubeMap(const AString& strFileName);

    bool RenderAlphaObjects(A3DViewport* pViewport, const ELEMENT_RENDER_PARAM* pParam, bool bUnderWater,
		float fWaterHeight, bool bEnableClipPlane);

	void RenderWireFlat();

    bool RenderToRenderTarget(ECViewport* pViewport, const ELEMENT_RENDER_PARAM* pParam, A3DRenderTarget* pFrameBuffer, bool bIsScreen);

	bool RenderPlayerDepthForSilhouette(A3DSkinRenderBase* pSkinRender, ECViewport* pECViewport, A3DRenderTarget* pTargetRT);

	bool RenderBloomSkinModel(ECViewport* pViewport);
private:
	A3DDevice*					m_pA3DDevice;
	A3DPostSystem*				m_pPostSystem;
	A3DRenderTarget*			m_pFrameBuffer;
	A3DRenderTarget*			m_pZRt;						//�������,�ڴ�0-1��Χ���������
	A3DRenderTarget*			m_pUnLinearZRt;				//���������RT
	bool						m_bIsLinearZReady;
	bool						m_bNeedReset;
	A3DGFXWarp*         		m_pGfxWarp;

	A3DHLSL*					m_pHLSLGBuffer;				//�����������AlphaTest, ���ڵ���.
	A3DHLSL*					m_pHLSLGBufferAlpha;		//���������AlphaTest
	A3DHLSL*					m_pHLSLGBufferSkinMesh;		//��ȾSKinMesh
	A3DHLSL*					m_pHLSLGBufferRigidMesh;	//��ȾSKinRigidMesh
	A3DHLSL*					m_pHLSLGBufferSkinMesh_LinearDepth;		//��ȾSKinMesh, ��ɫ����������
	A3DHLSL*					m_pHLSLGBufferRigidMesh_LinearDepth;	//��ȾSKinRigidMesh, ��ɫ����������
	AArray<ECManager*>			m_aManagers;
	A3DRenderTarget*			m_pTerrainRT;
	GameObjects         		m_GameObjs;
	WorldObjects        		m_WorldObjs;

	A3DLitModelRender*			m_pLitModelRenderExtra;
	A3DMirrorPlaneRender*		m_pMirrorPlaneRender;		// The renderer used to draw mirror plane objects.

	ECViewport*         		m_pViewport;
	A3DTexture*         		m_pWaterCubeMap;
	bool						m_bSupportSM20;
	AString             		m_strWaterCubeMap;

	A3DSSAO*					m_pSSAO;
	const ELEMENT_RENDER_PARAM*	m_pParams;
    bool                        m_bInitialized;

	bool						m_bAlphaModelWriteZ;

	bool						m_bUnLinearOnRT;
};

ElementRender* AfxGetElementRender();

#endif // _A3D_PLATFORM_H_