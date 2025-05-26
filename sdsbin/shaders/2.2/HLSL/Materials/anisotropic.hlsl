#include "../common/common.h"
#include "../SkinModel/mesh_comm.h"
string entrynames = "ps_2_0 ps_main";

string macro0
<
	string name = "POINT_LIGHT_ENABLE";
	string desc = "���Դ֧��";
	string type = "PRG";
	string GroupID = "1";
>;
string macro1
<
	string name = "ANISO_COLORMAP_ENABLE";
	string desc = "ʹ�÷�����ɫ����ͼ";
	string type = "ART";
	string GroupID = "2";
>;
string macro4
<
	string Name = "DIFFUSE_DESATURATE";
	string Type = "PRG";
	string Desc = "ģ�ͻ�������ȥɫ";
	string GroupID = "3";
>;
string macro5
<
	string Name = "ANISO_REFLECT_ENABLE";
	string Type = "ART";
	string Desc = "ʹ�÷��������������";
	string GroupID = "4";
>;
string macro6
<
	string Name = "DISCARD_NORMALMAP";
	string Type = "ART";
	string Desc = "��ʹ�÷�����ͼ";
	string GroupID = "5";
>;

string macro7
<
	string Name = "USE_DARK_REFLECT";
	string Type = "ART";
	string Desc = "ʹ�ö���İ���������ͼ";
	string GroupID = "6";
>;



//Use detail Normal Map
/*
string macro_Detail_Normal
<
	string Name = "DETAIL_NORMAL_ENABLE";
	string Type = "ART";
	string Desc = "ʹ��ϸ�ڷ�����ͼ";
	string GroupID = "7";
>;

//Use CubeMap Reflect
string macro_Cubemap_Reflect
<
	string Name = "CUBEMAP_REFLECT_ENABLE";
	string Type = "ART";
	string Desc = "ʹ��CubeMap������ͼ";
	string GroupID = "8";
>;
*/

//#define POINT_LIGHT_ENABLE
//#define DIFFUSE_DESATURATE
//#define ANISO_COLORMAP_ENABLE
//#define ANISO_REFLECT_ENABLE
//#define DISCARD_NORMALMAP
//#define CUBEMAP_REFLECT_ENABLE

//float4 g_vEyePos : CameraPosition;
//float4 g_MainLightPos : LightPosition0;		//	main light's position
float4 g_colDiffuse : Diffuse = {1.0f, 1.0f,1.0f,1.0f};
//float4 g_colSpecular : LightColor1 = {1.0f, 1.0f,1.0f,1.0f};
float g_fDiffusePower : DirPower;
float4 g_colAmbient : Ambient0 = {0.0f, 0.0f, 0.0f, 0.0f};
float4 g_Ambient2 : Ambient1;
float4 g_colPtDiffuse : PointDiffuse;
float4 g_colDiffuseFactor : DiffuseFactor = float4(1,1,1,1);
float4 g_colEmissiveFactor : EmissiveFactor = float4(0,0,0,0);

float g_smoothNess
<
	string UIName =  "����⻬��";
	string UIWidget = "slider";
	float UIMin = 1.0;
	float UIMax = 8.0;
	float UIStep = 0.01;
> = 1.0;

float g_DetailSmoothNess
<
	string UIName =  "ϸ�ڱ���⻬��";
	string UIWidget = "slider";
	float UIMin = 1.0;
	float UIMax = 20.0;
	float UIStep = 0.01;
> = 1.0;


float g_DiffuseBrightness
<
	string UIName =  "Diffuse����";
	string UIWidget = "slider";
	float UIMin = 1.0;
	float UIMax = 5.0;
	float UIStep = 0.01;
> = 1.0f;


float4 g_colDiffuseMod
<
	string UIName =  "Diffuseɫ��";
	string UIWidget = "Color";
> = {1.0f, 1.0f, 1.0f, 1.0f};

float4 g_colAniso
<
	string UIName =  "�������Ը߹���ɫ";
	string UIWidget = "Color";
> = {1.0f, 1.0f, 1.0f, 1.0f};

float4 g_colDarkness
<
	string UIName =  "�������԰�����ɫ";
	string UIWidget = "Color";
> = {0.0f, 0.0f, 0.0f, 1.0f};

float4 g_colLineDarkness
<
	string UIName =  "����ϸ����ɫ";
	string UIWidget = "Color";
> = {0.0f, 0.0f, 0.0f, 1.0f};

float g_darkLineContrast
<
	string UIName =  "����ϸ�߶Աȶ�";
	string UIWidget = "slider";
	float UIMin = 1.0;
	float UIMax = 20.0;
	float UIStep = 0.01;
> = 1.0;

float4 g_colLineBright1
<
	string UIName =  "����ϸ����ɫ1";
	string UIWidget = "Color";
> = {1.0f, 1.0f, 1.0f, 1.0f};

float4 g_colLineBright2
<
	string UIName =  "����ϸ����ɫ2";
	string UIWidget = "Color";
> = {1.0f, 1.0f, 1.0f, 1.0f};


float g_AnisoMultiple
<
	string UIName =  "�������Ը߹���ǿ����";
	string UIWidget = "slider";
	float UIMin = 0.0;
	float UIMax = 20.0;
	float UIStep = 0.01;
> = 2.0f;

float g_reflectContrast
<
	string UIName =  "�������Է���Աȶ�";
	string UIWidget = "slider";
	float UIMin = 1.0;
	float UIMax = 4.0;
	float UIStep = 0.01;
> = 1.0;

float g_DarkStrength
<
	string UIName =  "�������Ը߹ⰵ������";
	string UIWidget = "slider";
	float UIMin = 0.0;
	float UIMax = 5.0;
	float UIStep = 0.01;
> = 1.0f;

float g_uDetail
<
	string UIName =  "ϸ��U�ظ�����";
	string UIWidget = "slider";
	float UIMin = 1.0;
	float UIMax = 100.0;
	float UIStep = 0.1;
> = 10.0f;

float g_vDetail
<
	string UIName =  "ϸ��V�ظ�����";
	string UIWidget = "slider";
	float UIMin = 1.0;
	float UIMax = 100.0;
	float UIStep = 0.1;
> = 10.0f;

float4x4 g_matWorldInv : WorldInverse;
float4x4 g_matWorldView : WorldView;
float4x4 g_matWorldViewProj : WorldViewProjection;

texture g_DiffuseTexture
<
	string UIWidget = "Texture";
    string UIObject = "Shaders\\Textures\\Common\\white.dds";
    string UIName =  "������ͼ";
>;

texture g_NormalTexture
<
	string UIWidget = "Texture";
    string UIObject = "Shaders\\Textures\\Common\\FlatNormal.dds";
    string UIName =  "������ͼ";
>;

texture g_DetailNormalTexture
<
		string UIWidget = "Texture";
    string UIObject = "Shaders\\textures\\Common\\noise.dds";
    string UIName =  "ϸ�ڷ�����ͼ";
>;

texture g_AnisoTexture
<
	string UIWidget = "Texture";
    string UIObject = "Shaders\\Textures\\AnisoReflect\\Aniso_hard.tga";
    string UIName =  "����������ͼ";
>;

texture g_AnisoColorMapTexture
<
	string UIWidget = "Texture";
    string UIObject = "Shaders\\Textures\\Common\\white.dds";
    string UIName =  "�������Ը߹���ɫ��ͼ";
>;

texture g_MaskTexture
<
	string UIWidget = "Texture";
    string UIObject = "Shaders\\Textures\\Common\\white.dds";
    string UIName =  "Mask��ͼ";
>;

texture g_ReflectTexture
<
	string UIWidget = "Texture";
    string UIObject = "Shaders\\Textures\\AnisoReflect\\armorreflect.dds";
    string UIName =  "������ͼ";
>;

texture g_DarkReflectTexture
<
	string UIWidget = "Texture";
    string UIObject = "Shaders\\Textures\\Common\\white.dds";
    string UIName =  "����������ͼ";
>;


texture g_CubeReflectTexture
<
	string UIWidget = "Texture";
    string UIObject = "Shaders\\Textures\\AnisoReflect\\cubeenv.dds";
    string UIName =  "Cube������ͼ";
>;

sampler2D g_DiffuseSampler : DiffuseMap
<
    string Texture = "g_DiffuseTexture";
    string MipFilter = "LINEAR";
    string MinFilter = "LINEAR";
    string MagFilter = "LINEAR";
    string AddressU = "WRAP";
    string AddressV = "WRAP";
>;

sampler2D g_NormalSampler : NormalMap
<
    string Texture = "g_NormalTexture";
    string MipFilter = "LINEAR";
    string MinFilter = "LINEAR";
    string MagFilter = "LINEAR";
    string AddressU = "WRAP";
    string AddressV = "WRAP";
>;

sampler2D g_DetailNormalSampler
<
    string Texture = "g_DetailNormalTexture";
    string MipFilter = "LINEAR";
    string MinFilter = "LINEAR";
    string MagFilter = "LINEAR";
    string AddressU = "WRAP";
    string AddressV = "WRAP";
>;

sampler2D g_AnisoSampler
<
    string Texture = "g_AnisoTexture";
    string MipFilter = "LINEAR";
    string MinFilter = "LINEAR";
    string MagFilter = "LINEAR";
    string AddressU = "WRAP";
    string AddressV = "WRAP";
>;

sampler2D g_AnisoColorMapSampler
<
    string Texture = "g_AnisoColorMapTexture";
    string MipFilter = "LINEAR";
    string MinFilter = "LINEAR";
    string MagFilter = "LINEAR";
    string AddressU = "WRAP";
    string AddressV = "WRAP";
>;

sampler2D g_MaskSampler
<
    string Texture = "g_MaskTexture";
    string MipFilter = "LINEAR";
    string MinFilter = "LINEAR";
    string MagFilter = "LINEAR";
    string AddressU = "WRAP";
    string AddressV = "WRAP";
>;

sampler2D g_ReflectSampler
<
    string Texture = "g_ReflectTexture";
    string MipFilter = "LINEAR";
    string MinFilter = "LINEAR";
    string MagFilter = "LINEAR";
    string AddressU = "CLAMP";
    string AddressV = "CLAMP";
>;

sampler2D g_DarkReflectSampler
<
    string Texture = "g_DarkReflectTexture";
    string MipFilter = "LINEAR";
    string MinFilter = "LINEAR";
    string MagFilter = "LINEAR";
    string AddressU = "CLAMP";
    string AddressV = "CLAMP";
>;

samplerCUBE g_CubeReflectSampler
<
    string Texture = "g_CubeReflectTexture";
    string MipFilter = "LINEAR";
    string MinFilter = "LINEAR";
    string MagFilter = "LINEAR";
    string AddressU = "CLAMP";
    string AddressV = "CLAMP";
    string AddressW = "CLAMP";
>;

float4 ps_main(PS_INPUT Input) : COLOR0
{    
	float3 Normal = float3(0,0,1);
#if (defined(_SDR_3_0) || !defined(USE_DARK_REFLECT) )
	Normal = glb_SamplerNormalMap(g_NormalSampler, Input.uvBase, g_smoothNess);
	Normal = normalize(Normal);
#endif

#if (defined(_SDR_3_0) && defined(DETAIL_NORMAL_ENABLE))
	float3 NormalDetail = 0.0;
	NormalDetail = tex2D(g_DetailNormalSampler, Input.uvBase * float2(g_uDetail, g_vDetail)).agg * 2 - 1;
	Normal = normalize(Normal + float3(NormalDetail.x, NormalDetail.y, 0) / g_DetailSmoothNess);
#endif

#ifdef DISCARD_NORMALMAP
	Normal = float3(0, 0, 1);
#endif	

	float3 LightDir	= normalize(Input.LightDir);
	float3 ViewDir = normalize(Input.ViewDir);
	float3 ViewReflection = glb_CalcReflection(Normal, ViewDir);
	float3 LightReflection = glb_CalcReflection(Normal, LightDir);
	float3x3 matT2C;
	matT2C[0] = Input.tangent.xyz;
	matT2C[1] = Input.binormal.xyz;
	matT2C[2] = cross(Input.tangent.xyz, Input.binormal.xyz) * Input.tangent.w;
	float3 camReflect = 0;
	float4 colReflectTex = 0;
	
#ifdef CUBEMAP_REFLECT_ENABLE
	camReflect = mul(ViewReflection, matT2C);
	colReflectTex = texCUBE(g_CubeReflectSampler, camReflect);
#else
	camReflect = mul(Normal, matT2C);
	

	camReflect.x = (camReflect.x + 1) * 0.5;
	camReflect.y = (1 - camReflect.y) * 0.5;
	colReflectTex = tex2D(g_ReflectSampler, camReflect.xy);
#endif
		
	float4 colBaseTex = tex2D(g_DiffuseSampler, Input.uvBase);
#ifdef DIFFUSE_DESATURATE
//#if ( defined(DIFFUSE_DESATURATE) && (defined(_SDR_3_0)) )
	colBaseTex.rgb = glb_desaturate(colBaseTex.rgb) * g_DiffuseBrightness * g_colDiffuseMod.rgb;
#endif
	float4 colMaskTex = tex2D(g_MaskSampler, Input.uvBase);
	float4 colAnisoColorMap = tex2D(g_AnisoColorMapSampler, Input.uvBase);
	
	float fNDotL = dot(Normal, LightDir);
	float fA1 = saturate(-fNDotL);
	float fA2 = 1 - abs(fNDotL);
	float fVDotN = saturate(dot(Normal, ViewDir));
	fNDotL = saturate(fNDotL);
	float fVRDotV = saturate(dot(ViewReflection, ViewDir));

	float3 colDiffusePoint = 0.0f;
	
//#ifdef POINT_LIGHT_ENABLE
#if ( defined(POINT_LIGHT_ENABLE) && (defined(_SDR_3_0)) )
	float3 PtLightDir        = normalize(Input.PtLightDir.rgb);
	float3 PtLightReflection = glb_CalcReflection(Normal, PtLightDir);
	float  fPtNDotL          = dot(Normal, PtLightDir);
	fPtNDotL = saturate(fPtNDotL);
  #ifndef ANISO_REFLECT_ENABLE
  	colDiffusePoint = g_colPtDiffuse.rgb * lerp(0.5, 1, dot(PtLightDir, LightDir) * 0.5 + 0.5) * fPtNDotL * Input.PtLightDir.w;
  #else
  	colDiffusePoint = g_colPtDiffuse.rgb * fPtNDotL * Input.PtLightDir.w;
  #endif
  
#endif
	float3 colDiffuse = (g_fDiffusePower * g_colDiffuse.rgb * fNDotL + colDiffusePoint);
	float3 colAmbient = (g_colAmbient.rgb * fA1 + g_Ambient2.rgb * fA2);

float3 colAniso = 0;
#ifdef ANISO_COLORMAP_ENABLE
	colAniso.rgb = g_AnisoMultiple * colAnisoColorMap.rgb;
#else
	colAniso.rgb = g_AnisoMultiple * g_colAniso.rgb;
#endif

#ifndef ANISO_REFLECT_ENABLE // this is default
  // now try anisotropic effect.
  float3 vAnisoUV3 = float3(fNDotL, fVRDotV, 1.0f);
	float4 colAnisoTex = tex2D(g_AnisoSampler, vAnisoUV3.xy);
	//#ifdef POINT_LIGHT_ENABLE
	#if ( defined(POINT_LIGHT_ENABLE) && (defined(_SDR_3_0)) )
		vAnisoUV3.x = fPtNDotL;
		float4 colPtAniso = tex2D(g_AnisoSampler, vAnisoUV3.xy);
		colAnisoTex += colPtAniso*colPtAniso*fPtNDotL;
	#endif
	colAniso.rgb = colAniso.rgb * colAnisoTex.a * colMaskTex.r;
	float3 col1 = colDiffuse.rgb + colAmbient.rgb;
	colAniso.rgb *= col1.rgb; // make the anisotropic color to have a environment color tone.
	colDiffuse.rgb = col1.rgb * colBaseTex.rgb * lerp(1.0f, colAnisoTex.rgb, saturate(colMaskTex.r * g_DarkStrength));
#else
	float3 col1 = colDiffuse.rgb + colAmbient.rgb;
	float f = pow(colReflectTex.r, g_reflectContrast);
	
	colAniso.rgb = colAniso.rgb * f * colMaskTex.r;
	colAniso.rgb = colAniso.rgb * col1.rgb; // make the anisotropic color to have a environment color tone.
	colDiffuse.rgb = col1.rgb * colBaseTex.rgb * lerp(1.0, lerp(g_colDarkness.rgb, 1.0, f), saturate(colMaskTex.r * g_DarkStrength));
#endif

	float3 ResultColor = colDiffuse.rgb + colAniso.rgb;
	
#ifdef USE_DARK_REFLECT
	float dark = colReflectTex.g;
	float bright1 = colReflectTex.b;
	float bright2 = colReflectTex.a;

	float3 darkColor = lerp(g_colLineDarkness.rgb, 1, dark);
	ResultColor *= pow(darkColor, g_darkLineContrast);
	ResultColor += g_colLineBright1 * bright1;
	ResultColor += g_colLineBright2 * bright2;
#endif
	// do fog here
	ResultColor.rgb = lerp(Input.fogParam.rgb, ResultColor.rgb, Input.fogParam.a);
	
	return float4(ResultColor, colBaseTex.a) * g_colDiffuseFactor + g_colEmissiveFactor;
}

