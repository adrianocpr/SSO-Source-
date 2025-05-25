#ifndef _ELEMENT_RENDER_PARAM_H_
#define _ELEMENT_RENDER_PARAM_H_
#include "A3DMacros.h"

class A3DViewport;
class A3DDevice;
class A3DGFXExMan;
class A3DSunMoon;
class A3DPostSystem;
class A3DTerrainOutline2;

class CELTerrainOutline2;
class CECScene;
class ECManager;
class ElementRender;

class CECGFXCaster;
class ECRObjBase;
class ECViewport;

class A3DGrassLand;
class A3DRain;
class A3DSnow;
class A3DLitModelRender;
class A3DGFXExMan;
class ECRObjBase;
class A3DRenderTarget;
class A3DOrthoCamera;

class A3DShadowMap;
class A3DSkinRenderBase;
class A3DTerrainWater2;

#include "ECManager.h"

//struct PLATFORM_RENDERINFO;

enum A3DPOST_EFFECT
{
    A3DPOST_EFFECT_None				= 0,			//Ч��ȫ��
    A3DPOST_EFFECT_CC				= (1 << 0),		//ɫ��У��
    A3DPOST_EFFECT_GodRay			= (1 << 1),		//���
    A3DPOST_EFFECT_Bloom			= (1 << 2),		//Bloom
    A3DPOST_EFFECT_AA				= (1 << 3),		//������
    A3DPOST_EFFECT_Dof				= (1 << 4),		//����
    A3DPOST_EFFECT_RadialBlur		= (1 << 5),		//����ģ��
    A3DPOST_EFFECT_MotionBlur		= (1 << 6),		//�˶�ģ��
    A3DPOST_EFFECT_Warp				= (1 << 7),		//�ռ�Ť��
    A3DPOST_EFFECT_FullGlow			= (1 << 8),		//ȫ������
    A3DPOST_EFFECT_SunMoon			= (1 << 9),		//̫������
    A3DPOST_EFFECT_Flare			= (1 << 10),	//��Ȧ
	A3DPOST_EFFECT_RadialBlurFast   = (1 << 11),	//���پ���ģ��
	A3DPOST_EFFECT_Silhouette		= (1 << 12),	//����
	A3DPOST_EFFECT_BloomLocal		= (1 << 13),	// Bloom for specified skinmodel
    A3DPOST_EFFECT_All				= 0xffffffff,	//Ч��ȫ��
};

struct A3DPOST_EFFECT_BLOOM_PARAM			//ȫ���������
{	
    float			fBlurSize;				//ģ����С, ռ��Ļ��С�İٷֱȣ�0~0.1
    float			fBrightThreshold;		//�߹���ֵ	0~1
    float			fBrightScale;			//����	0~5
    A3DPOST_EFFECT_BLOOM_PARAM()					
    {
        fBlurSize = 0.05f;
        fBrightThreshold = 0.8f;
        fBrightScale = 0.5f;
    }
};
struct A3DPOST_EFFECT_CC_PARAM				//ɫ��У������
{
	struct ManualParam
	{
		int nBright;						//����,		��Χ��[-100~100]
		int nContrast;						//�Աȶ�,	��Χ��[-100~100]
		int nHue;							//ɫ��,		��Χ��[-180~180]
		int nSaturation;					//���Ͷ�,		��Χ��[-100~100]
		bool bGrey;							//�Ƿ�ת��Ϊ�Ҷ�ͼ
		bool bOpposition;					//�Ƿ�ɫ
		ManualParam()
		{
			nBright = 0;
			nContrast = 0;
			nHue = 0;
			nSaturation = 0;
			bGrey = false;
			bOpposition = false;
		}
		bool EqualTo(const ManualParam& other)
		{
			return nBright == other.nBright && nContrast == other.nContrast && nHue == other.nHue
					&& nSaturation == other.nSaturation && bGrey == other.bGrey && bOpposition == other.bOpposition;
		}
		ManualParam& operator = (const ManualParam &rhs)
		{
			nBright		= rhs.nBright;
			nContrast	= rhs.nContrast;
			nHue		= rhs.nHue;
			nSaturation	= rhs.nSaturation;
			bGrey		= rhs.bGrey;
			bOpposition	= rhs.bOpposition;
			return *this;
		}
	};
    float			fFactor;				//������ӳ����ͼ����ɵ�ֵ, 0~1
    bool			bUseManualParam1;		//�Ƿ�ʹ���˹����õĲ�������ӳ����ͼ
	bool			bUseManualParam2;		//�Ƿ�ʹ���˹����õĲ�������ӳ����ͼ
	ManualParam		manualParam1;			//��һ����ͼ���˹����ò���ֵ	(����bUseManualParam1Ϊtrue��ʱ�����Ч��)
	ManualParam		manualParam2;			//�ڶ�����ͼ���˹����ò���ֵ	(����bUseManualParam2Ϊtrue��ʱ�����Ч��)
	AString			szTex1;					//��һ��ӳ����ͼ���ļ���		(����bUseManualParam1Ϊfalse��ʱ�����Ч��)
    AString			szTex2;					//�ڶ���ӳ����ͼ���ļ���		(����bUseManualParam2Ϊfalse��ʱ�����Ч��)
	bool			bAfterUI;
    A3DPOST_EFFECT_CC_PARAM()
    {
        fFactor = 0;
		bUseManualParam1 = false;
		bUseManualParam2 = false;
        szTex1 = "Shaders\\Textures\\ccdefault.dds";
        szTex2 = "Shaders\\Textures\\ccdefault.dds";
		bAfterUI = true;
    }
	void CopyExceptFactor(const A3DPOST_EFFECT_CC_PARAM &rhs)
	{
		fFactor				= rhs.fFactor;
		bUseManualParam1	= rhs.bUseManualParam1;
		bUseManualParam2	= rhs.bUseManualParam2;
		szTex1				= rhs.szTex1;
		szTex2				= rhs.szTex2;
		manualParam1		= rhs.manualParam1;
		manualParam2		= rhs.manualParam2;
		bAfterUI			= rhs.bAfterUI;
	}
	bool EqualExceptFactor(const A3DPOST_EFFECT_CC_PARAM &rhs)
	{
		return szTex1 == rhs.szTex1 && szTex2 == rhs.szTex2 && bUseManualParam1 != rhs.bUseManualParam1 && bUseManualParam2 == rhs.bUseManualParam2 && 
				manualParam1.EqualTo(rhs.manualParam1) && manualParam2.EqualTo(rhs.manualParam2) && bAfterUI == rhs.bAfterUI;
	}
};
struct A3DPOST_EFFECT_DOF_PARAM				//�������
{
    float			fNearBlur;				//������ģ��λ��
    float			fNearFocus;				//��������λ��
    float			fFarFocus;				//Զ������λ��
    float			fFarBlur;				//Զ����ģ��λ��
    float			fClampBlurFar;			//��Զ��ģ��������
    A3DPOST_EFFECT_DOF_PARAM()
    {
        fNearBlur = 1.0f;
        fNearFocus = 20.f;
        fFarFocus = 50.f;
        fFarBlur = 100.f;
        fClampBlurFar = 1.f;
    }
};
struct A3DPOST_EFFECT_GODRAY_PARAM			//������
{
	float			fOcclusionDepthRange;	//���ڴ���ȵ�������ɫ�ᱻ��������Bloom,С�ڴ���ȵ�������ɫ���Ϊ��. [0 ~ 1]
	float			fBloomScale;			//Bloom����ǿ��. 0Ϊ������Bloom, �޹���. [0 ~ 5]
	float			fBloomThreshold;		//���ȴ��ڴ˲��ֲŻᱻ��������Bloom. [0 ~ 1]
	float			fScreenBlendThreshold;	//��Ļ���ȱ���С�����ֵ�Ż����Bloom�ĵ���, ԽС����Խ�� [0 ~ 1]
	A3DVECTOR3		vBloomTintColor;		//������ɫ��������ֵ֮���ٽ���bloom. [����0 ~ 1,�ֱ��ʾRGB]
	float			fOcclusionDarkness;		//����ģ�����OcclusionMask����Ļ��ɫ���кڻ�, 0�����̶Ⱥڻ�,1�򲻺ڻ� [0 ~ 1]
	float			fVisibleAngle;			//�ɼ��Ƕ� [0 ~ 3.14]

    A3DPOST_EFFECT_GODRAY_PARAM()
    {
		fOcclusionDepthRange = 500.f;
		fBloomScale = 1.2f;
		fBloomThreshold = 0.37f;
		fScreenBlendThreshold = 1.0;
		vBloomTintColor = A3DVECTOR3(1,1,1);
		fOcclusionDarkness = 0.62f;
	    fVisibleAngle = 1.75f; //A3D_PI / 3.f;	
    }
};
struct A3DPOST_EFFECT_RADIUSBLUR_PARAM		//����ģ������
{
    float			fBlurCenterX;			//����, (0.5, 0.5)����Ļ�м�, (0,0)�����Ͻ�, (1,1)�����½�
    float			fBlurCenterY;			
    float			fBlurLength;			//ģ������ 0~1
    float			fInFocusRadius;			//����뾶,�ڸð뾶�ڵĻ��治�ᱻģ�� 0~2
    float			fOutFocusRadius;		//ģ���뾶,�ڸ÷�Χ��ģ�������. 0~3
    A3DPOST_EFFECT_RADIUSBLUR_PARAM()
    {		
        fBlurCenterX = 0.5f;
        fBlurCenterY = 0.5f;
        fBlurLength = 0.2f;
        fInFocusRadius = 0.2f;
        fOutFocusRadius = 0.7f;
    }
};

struct A3DPOST_EFFECT_RADIUSBLUR_FAST_PARAM		//���پ���ģ������
{
	float			fBlurCenterX;			//����, (0.5, 0.5)����Ļ�м�, (0,0)�����Ͻ�, (1,1)�����½�
	float			fBlurCenterY;			
	float			fBlurLength;			//ģ������ 0~1
	float			fInFocusRadius;			//����뾶,�ڸð뾶�ڵĻ��治�ᱻģ�� 0~2
	float			fOutFocusRadius;		//ģ���뾶,�ڸ÷�Χ��ģ�������. 0~3
	A3DPOST_EFFECT_RADIUSBLUR_FAST_PARAM()
	{		
		fBlurCenterX = 0.5f;
		fBlurCenterY = 0.5f;
		fBlurLength = 0.2f;
		fInFocusRadius = 0.2f;
		fOutFocusRadius = 0.7f;
	}
};


struct A3DPOST_EFFECT_MOTIONBLUR_PARAM
{
    float fBlurMax;	       				//ģ���������ֵ,0~1֮��,һ��0.03����
    float fBlurScale;        				//ģ�������ƣ���ģ������������˶��ٶ�֮��Ĺ�ϵ,0
    float fBlurScalePosition;				//�����λ���ƶ���ɵ�ģ������Ȩ�� 1~10
    float fBlurScaleRotation;				//�������ת��ɵ�ģ����Ȩ�� 1~10
    float fInFocusDistance;  				//�ڸ���ȷ�Χ�ڵ����ز��ᱻģ��
    float fOutFocusDistance; 				//�ڸ���ȷ�Χ֮������ػᱻ����޶�ģ��

    A3DPOST_EFFECT_MOTIONBLUR_PARAM()
    {
        fBlurMax = 0.03f;
        fBlurScale = 0.05f;
        fBlurScalePosition = 3.0f;
        fBlurScaleRotation = 10.0f;
        fInFocusDistance = 15.f;
        fOutFocusDistance = 80.f;
    }
};

struct A3DPOST_EFFECT_FULLGLOW_PARAM
{
    float			fBlurSize;				//ģ�����룬ռ��Ļ��С�İٷֱȣ�0~0.1
    float			fGlowLevel;
    float			fGlowPower;
    A3DVECTOR4		vGlowColor;
    A3DPOST_EFFECT_FULLGLOW_PARAM()
    {
        fBlurSize = 0.05f;
        fGlowLevel = 0.25f;
        fGlowPower = 0.2f;
        vGlowColor = A3DVECTOR4(0.8f, 0.7f, 0.5f, 0.5f);
    }
};

struct A3DPOST_EFFECT_WARP_PARAM
{
    float	fScale;			//	Ť����С
    float	fSpeed;			//	Ť���ٶ�
	bool	bEnableMask;	//	�Ƿ���Mask
	AString strMaskTextureName;
    A3DPOST_EFFECT_WARP_PARAM()
    {
        fScale = 0.01f;
        fSpeed = 0.5f;
		bEnableMask = false;
		strMaskTextureName = "";
    }
	A3DPOST_EFFECT_WARP_PARAM& operator = (const A3DPOST_EFFECT_WARP_PARAM &rhs)
	{
		fScale				= rhs.fScale;
		fSpeed				= rhs.fSpeed;
		bEnableMask			= rhs.bEnableMask;
		strMaskTextureName	= rhs.strMaskTextureName;
		return *this;
	}
};

struct A3DPOST_EFFECT_AA_PARAM
{
	bool bAfterUI;

	A3DPOST_EFFECT_AA_PARAM()
	{
		bAfterUI = false;
	}

};

struct A3DPOST_EFFECT_SILHOUETTE_PARAM
{
	float fHardness;
	float fBlurDist;
	A3DVECTOR3 vLineColor;

	A3DPOST_EFFECT_SILHOUETTE_PARAM()
	{
		fHardness = 0.8f;
		fBlurDist = 0.3f;
		vLineColor = A3DVECTOR3(0,0,0);
	}
};

struct A3DPOST_EFFECT_PARAM								//����ϵͳ����
{
    DWORD							dwPostEffectMask;	//��ǿ�����Ч��
    A3DPOST_EFFECT_BLOOM_PARAM		bloomParam;			//Bloom
    A3DPOST_EFFECT_CC_PARAM			ccParam;			//ɫ��У��
    A3DPOST_EFFECT_DOF_PARAM		dofParam;			//����
    A3DPOST_EFFECT_GODRAY_PARAM		godRayParam;		//GodRay
    A3DPOST_EFFECT_RADIUSBLUR_PARAM radiusBlurParam;	//����ģ��
    A3DPOST_EFFECT_MOTIONBLUR_PARAM motionBlurParam;	//�˶�ģ��
    A3DPOST_EFFECT_WARP_PARAM		warpParam;			//ˮ��Ť��
    A3DPOST_EFFECT_FULLGLOW_PARAM   fullGlowParam;		//FullGlow
	A3DPOST_EFFECT_AA_PARAM			aaParam;
	A3DPOST_EFFECT_RADIUSBLUR_FAST_PARAM radiusBlurFastParam;
	A3DPOST_EFFECT_SILHOUETTE_PARAM silhouetteParam;
    A3DPOST_EFFECT_PARAM()
    {
        dwPostEffectMask = 0;
    }
};

enum A3D_SHADOW_MAP_SIZE
{
	A3D_SHADOW_MAP_SIZE_SMALL = 0,
	A3D_SHADOW_MAP_SIZE_MEDIUM,
	A3D_SHADOW_MAP_SIZE_LARGE
};

enum A3D_SHADOW_MAP_SAMPLE_NUM
{
	A3D_SHADOW_MAP_SAMPLE_NUM_LOW = 0,
	A3D_SHADOW_MAP_SAMPLE_NUM_NORMAL,
	A3D_SHADOW_MAP_SAMPLE_NUM_HIGH
};

struct ELEMENT_RENDER_PARAM
{
    DWORD                   crClear;
    A3DLIGHTPARAM			paramLight;
    float					fDNFactor;
    A3DVECTOR3				vHostPos;
    ElementRender*			pSelf;				// ElementRender�Լ���ָ��

    unsigned int nWaterEffect; // 0 - �������� 1 - cube map���䣬 2 - �淴�䲻��NPC�Ͳݣ�3 - ���Ч��

	bool bUnderWater;
    bool bModelLightMap;
    bool bRenderScene;
    bool bRenderSky;
    bool bRenderTerrain;
    bool bRenderSceneObject;
    bool bAnimationWorld;
    bool bRenderLitModel;
    bool bRenderSkinModel;
    bool bRenderGrass;
    bool bRenderShadow;
    bool bRenderWater;
	bool bRenderMirrorPlane;
    bool bRenderGFX;
    bool bRenderPostProcess;
	bool bRenderSSAO;
    bool bRenderZPressPass;
    bool bRenderZToRenderTarget;
    bool bRenderSunMoon;
    bool bRenderUI;
	bool bWireframeMode;

	float fShadowDistance;							//������Ӱ���Ǿ��룬����5~30
	A3D_SHADOW_MAP_SIZE	eShadowMapSize; 
	A3D_SHADOW_MAP_SAMPLE_NUM eShadowSampleNum;
	bool bUseCustomShadowCenter;
	A3DVECTOR3 vCustomShadowCenter;

    A3DPOST_EFFECT_PARAM paramPostEffect;			//�������

    ELEMENT_RENDER_PARAM()
    {
        pSelf = NULL;
		crClear = 0xFFFFFFFF;
		fDNFactor = 0.0f;
        nWaterEffect = 0;
        bUnderWater = true;
        bModelLightMap = true;
        bRenderScene = true;
        bRenderSky = true;
        bRenderTerrain= true;
        bRenderSceneObject = true;
        bAnimationWorld = true;
        bRenderLitModel = true;
        bRenderSkinModel = true;
        bRenderGrass = true;
        bRenderShadow = true;
        bRenderWater = true;
		bRenderMirrorPlane = true;
        bRenderGFX = true;
        bRenderPostProcess = true;
		bRenderSSAO = true;
        bRenderZPressPass = true;
        bRenderZToRenderTarget = true;
        bRenderUI= true;
        bRenderSunMoon = true;
		bWireframeMode = false;
		fShadowDistance = 10.f;
		eShadowMapSize = A3D_SHADOW_MAP_SIZE_MEDIUM;
		eShadowSampleNum = A3D_SHADOW_MAP_SAMPLE_NUM_NORMAL;
		bUseCustomShadowCenter = false;
    }
};

struct ZPREPASS_PARAM
{
    ECViewport*	pViewport;
    A3DSkinRenderBase*	pSkinRender;

    unsigned int bRenderScene: 1;
    unsigned int bRenderSkin : 1;
    unsigned int bRenderLitmodel : 1;
    unsigned int bRenderTerrain : 1;
};

struct SHADOWPASS_PARAM
{
    ECViewport*	pViewport;
    A3DSkinRenderBase*	pSkinRender;
    unsigned int bRenderSkin : 1;
    unsigned int bRenderLitmodel : 1;
    unsigned int bRenderTerrain : 1;
};

#endif