#include "../common/common.h"
#include "../SkinModel/mesh_comm.h"

//-----------------------------------------------------------------
// macro
//-----------------------------------------------------------------
//                PRG Macro (1-2)
//Point Light
string macro0
<
	string name = "POINT_LIGHT_ENABLE";
	string desc = "���Դ֧��";
	string type = "PRG;SDR_3_0";
	string GroupID = "1";
>;

//Self-Illuminated
string macro1
<
	string Name = "SELF_ILLUMINATED_ENABLE";
	string Type = "PRG";
	string Desc = "ʹ���Է�����ɫ";
	string GroupID = "2";
>;
//---------------------------------------------
//                ART Macro (3-7)
//BRDF
//Half Lambert
string macro2
<
	string Name = "HALF_LAMBERT_ENABLE";
	string Type = "ART";
	string Desc = "ʹ��Half Lambert";
	string GroupID = "3";
>;
string macro_oren_nayar
<
	string Name = "OREN_NAYAR_ENABLE";
	string Type = "ART";
	string Desc = "ʹ�ôֲڱ������ģ��";
	string GroupID = "3";
>;

//Specular

string macro3
<
	string Name = "SPECULAR_ENABLE";
	string Type = "ART";
	string Desc = "ʹ�ø߹�";
	string GroupID = "4";
>;

string macro4
<
	string Name = "SPECULAR_MAP_ENABLE";
	string Type = "ART";
	string Desc = "ʹ�ø߹���ͼ";
	string GroupID = "4";
>;

//RIM Light
string macro5
<
	string Name = "RIMLIGHT_MAP_ENABLE";
	string Type = "ART";
	string Desc = "ʹ��RIM LIGHT �ⲿ��ͼ";
	string GroupID = "5";
>;

string macro6
<
	string Name = "RIMLIGHT_MAP_INNER_ENABLE";
	string Type = "ART";
	string Desc = "ʹ��RIM LIGHT �ڲ���ͼ";
	string GroupID = "6";
>;

//Simple No Normal Map
string macro_No_Normal
<
	string Name = "NO_NORMAL_ENABLE";
	string Type = "ART";
	string Desc = "��ʹ�÷�����ͼ";
	string GroupID = "7";
>;

string macro_colorTone
<
	string Name = "COLOR_TONE_ENABLE";
	string Type = "ART";
	string Desc = "ʹ�ó���ɫ����ɫ";
	string GroupID = "8";
>;

/*
//Use detail Normal Map
string macro_Detail_Normal
<
	string Name = "DETAIL_NORMAL_ENABLE";
	string Type = "ART";
	string Desc = "ʹ��ϸ�ڷ�����ͼ";
	string GroupID = "7";
>;
*/

string entrynames = "ps_2_0 ps_main";


float4 g_colDiffuse : Diffuse = {1.0f, 1.0f,1.0f,1.0f};
float  g_fDiffusePower : DirPower;
float4 g_colAmbient : Ambient0 = {0.0f, 0.0f, 0.0f, 0.0f};
float4 g_Ambient2 : Ambient1;
float4 g_colPtDiffuse:PointDiffuse = {0.88,0.88,0.88,1};
float4 g_colDiffuseFactor : DiffuseFactor = float4(1,1,1,1);
float4 g_colEmissiveFactor : EmissiveFactor = float4(0,0,0,0);

float4x4 g_matColorTone : ColorToneMatrix = {1.0f, 0.0f, 0.0f, 0.0f,
																						 0.0f, 1.0f, 0.0f, 0.0f,		
																						 0.0f, 0.0f, 1.0f, 0.0f,
																						 0.0f, 0.0f, 0.0f, 1.0f};
																						 
//-----------------------------------------------------------------
// Parameter
//-----------------------------------------------------------------
//Bump
float g_smoothNess
<
	string UIName =  "����⻬��";
	string UIWidget = "slider";
	float UIMin  = 1.0;
	float UIMax  = 8.0;
	float UIStep = 0.01;
> = 1.0;

//Rim Light
float4 g_RimColorInner
<
	string UIName =  "Rim Light�ڲ���ɫ";
	string UIWidget = "color";
> = {0.0f, 0.5f, 0.5f, 1.0f};

float4 g_RimColor
<
	string UIName =  "Rim Light�ⲿ��ɫ";
	string UIWidget = "color";
> = {0.0f, 0.5f, 0.5f, 1.0f};

//Specular 
float4 g_colMtlSpecular 
<
	string UIName =  "�߹���ɫ";
	string UIWidget = "Color";
> = {1.0f, 1.0f, 1.0f, 1.0f};

float g_Power
<
	string UIName =  "�߹�power";
	string UIWidget = "slider";
	float UIMin = 0.0;
	float UIMax = 100.0;
	float UIStep = 0.1;
> = 50.0f;

float g_SpecularMultiple
<
	string UIName =  "�߹���ǿ����";
	string UIWidget = "slider";
	float UIMin = 0.0;
	float UIMax = 5.0;
	float UIStep = 0.01;
> = 1.0f;

//SelfIlluminate
float g_SelfIlluminated
<
	string UIName =  "�Է��ⱶ��";
	string UIWidget = "slider";
	float UIMin  = 0.0;
	float UIMax  = 10.0;
	float UIStep = 0.01;
> = 1.0f;

float4 g_SelfIlluminateColor
<
	string UIName =  "�Է�����ɫ";
	string UIWidget = "Color";
> = {0.0, 0.0, 0.0, 0.0};

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

/*
//Color Tone Tuning
float4 g_SrcColorTone
<
	string UIName =  "ԭʼɫ��";
	string UIWidget = "color";
> = {1.0f, 0.0f, 0.0f, 1.0f};

float4 g_DestColorTone
<
	string UIName =  "Ŀ��ɫ��";
	string UIWidget = "color";
> = {1.0f, 0.0f, 0.0f, 1.0f};
*/

//-----------------------------------------------------------------
// Matrix
//-----------------------------------------------------------------
float4x4 g_matWorldInv      : WorldInverse;
float4x4 g_matWorldView     : WorldView;
float4x4 g_matWorldViewProj : WorldViewProjection;

//-----------------------------------------------------------------
// Texture and Sampler
//-----------------------------------------------------------------
texture g_DiffuseTexture
<
		string UIWidget = "Texture";
    string UIObject = "Shaders\\Textures\\Common\\Fieldstone.dds";
    string UIName =  "������ͼ";
>;

texture g_NormalTexture
<
		string UIWidget = "Texture";
    string UIObject = "Shaders\\textures\\Common\\FieldstoneBumpDOT3_DXT5n.dds";
    string UIName =  "������ͼ";
>;

texture g_DetailNormalTexture
<
		string UIWidget = "Texture";
    string UIObject = "Shaders\\textures\\Common\\noise.dds";
    string UIName =  "ϸ�ڷ�����ͼ";
>;

texture g_SpecularTexture
<
		string UIWidget = "Texture";
    string UIObject = "Shaders\\Textures\\Common\\Fieldstone_Specular.dds";
    string UIName =  "�߹���ͼ";
>;

texture g_RimLightInnerTexture
<
	  string UIWidget = "Texture";
    string UIObject = "Shaders\\Textures\\RimLookUpTable\\rim_in_0.dds";
    string UIName =  "RimLight�ڲ���ͼ";
>;

texture g_RimLightTexture
<
	  string UIWidget = "Texture";
    string UIObject = "Shaders\\Textures\\RimLookUpTable\\rim_out_0.dds";
    string UIName =  "RimLight�ⲿ��ͼ";
>;

texture g_MaskTexture
<
		string UIWidget = "Texture";
    string UIObject = "Shaders\\Textures\\Common\\white.dds";
    string UIName =  "�����ɫMask��ͼ";
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

sampler2D g_SpecularSampler
<
    string Texture = "g_SpecularTexture";
    string MipFilter = "LINEAR";
    string MinFilter = "LINEAR";
    string MagFilter = "LINEAR";
    string AddressU = "WRAP";
    string AddressV = "WRAP";
>;

//RIM
sampler2D g_RimLightInnerTextureSampler 
<
    string Texture = "g_RimLightInnerTexture";
    string MipFilter = "LINEAR";
    string MinFilter = "LINEAR";
    string MagFilter = "LINEAR";
    string AddressU = "CLAMP";
    string AddressV = "CLAMP";
>;

sampler2D g_RimLightTextureSampler 
<
    string Texture = "g_RimLightTexture";
    string MipFilter = "LINEAR";
    string MinFilter = "LINEAR";
    string MagFilter = "LINEAR";
    string AddressU = "CLAMP";
    string AddressV = "CLAMP";
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

//-----------------------------------------------------------------
// PS Entry
//-----------------------------------------------------------------
float4 ps_main(PS_INPUT Input) : COLOR0
{
  float3 Normal      = 0.0;
  float3 NormalDetail = 0.0;
	float3 colDiffuse  = 0.0;
	float3 colAmbient  = 0.0;
	float3 colSpecular = 0.0;
	
	float3 colDiffusePoint = 0.0f;
	float3 colSpecularPoint = 0.0f;
	
	float4 RimLight   = 0.0;
	float4 InnerLight = 0.0f;

	float3 colSunDiffuse = g_colDiffuse.rgb * g_fDiffusePower;

#ifdef NO_NORMAL_ENABLE
	Normal.z=1.0;
#else
	Normal   = glb_SamplerNormalMap(g_NormalSampler, Input.uvBase, g_smoothNess);
	#ifdef DETAIL_NORMAL_ENABLE
		NormalDetail = tex2D(g_DetailNormalSampler, Input.uvBase * float2(g_uDetail, g_vDetail)).agg * 2 - 1;
		Normal = normalize(Normal + float3(NormalDetail.x, NormalDetail.y, 0));
	#endif
#endif

	float3 LightDir	= normalize(Input.LightDir);
	float3 ViewDir  = normalize(Input.ViewDir);
	float3 LightReflection = glb_CalcReflection(Normal, LightDir);
	
	//Sample Tex
	float4 colBaseTex     = tex2D(g_DiffuseSampler, Input.uvBase);
	float4 colSpecularTex = tex2D(g_SpecularSampler, Input.uvBase);

#ifdef COLOR_TONE_ENABLE
	float4 colMaskTex= tex2D(g_MaskSampler, Input.uvBase);
	//float4 colorDiff = g_DestColorTone - g_SrcColorTone;
	float4 colorToTune;
	colorToTune.rgb = colBaseTex.rgb;
	colorToTune.a = 1.0f;
	colorToTune = mul(colorToTune ,g_matColorTone);
	colBaseTex.rgb = lerp(colBaseTex.rgb, colorToTune.rgb, colMaskTex.b);
#endif

	float fNDotL = dot(Normal, LightDir);
	float fA1 = saturate(-fNDotL);
	float fA2 = 1 - abs(fNDotL);
	float fRDotV = fNDotL > 0.0f ? saturate(dot(LightReflection, ViewDir)) : 0.0f;
	float fNdotV = saturate(dot(Normal,ViewDir));
	
//DirLight BRDF	
#ifdef	HALF_LAMBERT_ENABLE
	fNDotL = fNDotL*0.5f+0.5f;
#else
	#if defined(OREN_NAYAR_ENABLE)
		fNDotL = pow(saturate(fNDotL), 0.5);
	#else
		fNDotL = saturate(fNDotL);
	#endif
#endif

//Point Light
#ifdef POINT_LIGHT_ENABLE
	float3 PtLightDir        = normalize(Input.PtLightDir.rgb);
	float3 PtLightReflection = glb_CalcReflection(Normal, PtLightDir);
	float  fPtNDotL          = dot(Normal, PtLightDir);
	float  fPtRDotV          = fPtNDotL > 0.0f ? saturate(dot(PtLightReflection, ViewDir)) : 0.0f;
	#ifdef	HALF_LAMBERT_ENABLE
		fPtNDotL = fPtNDotL*0.5f+0.5f;
	#else
		fPtNDotL = saturate(fPtNDotL);
	#endif
  colDiffusePoint = g_colPtDiffuse.rgb * lerp(0.5, 1, dot(PtLightDir, LightDir) * 0.5 + 0.5) * fPtNDotL * Input.PtLightDir.w;
  #if defined(SPECULAR_MAP_ENABLE) || defined(SPECULAR_ENABLE)
  	colSpecularPoint = g_colPtDiffuse.rgb * pow(fPtRDotV, g_Power) * Input.PtLightDir.w;
	#endif
#endif

//Diffuse
colDiffuse = colSunDiffuse * fNDotL + colDiffusePoint;

//Ambient
colAmbient = (g_colAmbient.rgb * fA1 + g_Ambient2.rgb * fA2);

//Specular
#ifdef SPECULAR_MAP_ENABLE
	colSpecular = g_SpecularMultiple * colSpecularTex.rgb * (colSunDiffuse*pow(fRDotV, g_Power) + colSpecularPoint);
#endif

#ifdef SPECULAR_ENABLE
	colSpecular = g_SpecularMultiple * g_colMtlSpecular.rgb *(colSunDiffuse*pow(fRDotV, g_Power) + colSpecularPoint);
#endif

//Rim Light
#ifdef RIMLIGHT_MAP_ENABLE
	RimLight.rgb = tex2D(g_RimLightTextureSampler, float2(fNdotV,0.0)).rgb*g_RimColor;
	//colDiffuse += RimLight.rgb;
#endif

//Inner
#ifdef RIMLIGHT_MAP_INNER_ENABLE
	InnerLight.rgb = tex2D(g_RimLightInnerTextureSampler, float2(fNdotV,0.0)).rgb*g_RimColorInner;
	//colDiffuse += InnerLight.rgb;
#endif

//Combine Shader
float3 ResultColor = (colDiffuse.rgb +colAmbient.rgb)* colBaseTex.rgb +RimLight.rgb + InnerLight.rgb;

#if defined(SPECULAR_MAP_ENABLE)|| defined(SPECULAR_ENABLE)
  ResultColor += colSpecular.rgb;
#endif

#ifdef SELF_ILLUMINATED_ENABLE
	ResultColor += g_SelfIlluminateColor.rgb*g_SelfIlluminated;
#endif

	ResultColor.rgb = lerp(Input.fogParam.rgb, ResultColor.rgb, Input.fogParam.a);

	return float4(ResultColor, colBaseTex.a) * g_colDiffuseFactor + g_colEmissiveFactor;
}