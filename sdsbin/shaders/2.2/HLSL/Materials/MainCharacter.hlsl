#include "../common/common.h"
#include "../SkinModel/mesh_comm.h"

string macro1
<
	string Name = "USE_SKIN";
	string Type = "ART";
	string Desc = "�Ƿ�Ƥ��";
	string GroupID = "0";
>;

string macro2
<
	string Name = "USE_REFLECT";
	string Type = "ART";
	string Desc = "ʹ�÷���(����CUBE������ANISO����)";
	string GroupID = "1";
>;

string macro3
<
	string Name = "USE_ANISO";
	string Type = "ART";
	string Desc = "ʹ��ANISO����/����ѡ������ʹ��CUBE����";
	string GroupID = "2";
>;

string macro4
<
	string Name = "USE_NORMALMAP";
	string Type = "ART";
	string Desc = "ʹ�÷�����ͼ";
	string GroupID = "3";
>;

string macro5
<
	string Name = "USE_DETAILNORMALMAP";
	string Type = "ART";
	string Desc = "ʹ��ϸ�ڷ�����ͼ";
	string GroupID = "4";
>;

string macro6
<
	string Name = "USE_FLOW";
	string Type = "ART";
	string Desc = "�Ƿ�Ҫ����";
	string GroupID = "5";
>;

string macro7
<
	string Name = "USE_ONLY_NORMALMAP";
	string Type = "ART";
	string Desc = "ֻ��ʾ������ͼЧ��";
	string GroupID = "6";
>;


float4 g_vTime : TimePack;

float4 customizecolor
<
	string UIName = "Ƥ����ɫ";
> = {1,1,1,1};

texture diffusemap
<
	string UIWidget = "Texture";
	string UIObject = "shaders\\textures\\common\\FlatNormal.dds";
	string UIName = "����ɫ��ͼ";
>;
sampler2D diffusemapsampler : DiffuseMap
<
	string Texture = "diffusemap";
	string MipFilter = "LINEAR";
	string MinFilter = "LINEAR";
	string MagFilter = "LINEAR";
	string AddressU = "WRAP";
	string AddressV = "WRAP";
	string AddressW = "WRAP";
>;

texture maskmap
<
	string UIWidget = "Texture";
	string UIObject = "shaders\\textures\\common\\white.dds";
	string UIName = "Mask��ͼ";
>;
sampler2D maskmapsampler
<
	string Texture = "maskmap";
	string MipFilter = "LINEAR";
	string MinFilter = "LINEAR";
	string MagFilter = "LINEAR";
	string AddressU = "WRAP";
	string AddressV = "WRAP";
	string AddressW = "WRAP";
>;

/*
float g_SSSTranslucency
<
	string UIName = "Ƥ��͸���";
	float UIMin = 0.0;
	float UIMax = 1.0;
	float UIStep = 0.001;
> = 0.0;
*/

texture SSSmap
<
	string UIWidget = "Texture";
	string UIObject = "shaders\\textures\\common\\white.dds";
	string UIName = "SSS���ұ���ͼ";
>;

sampler2D g_SkinWarpSampler
<
	string Texture = "SSSmap";
	string MipFilter = "LINEAR";
	string MinFilter = "LINEAR";
	string MagFilter = "LINEAR";
	string AddressU = "CLAMP";
	string AddressV = "CLAMP";
	string AddressW = "CLAMP";
>;

texture normalmap
<
	string UIWidget = "Texture";
	string UIObject = "shaders\\textures\\common\\white.dds";
	string UIName = "������ͼ";
>;

sampler2D normalmapsampler : NormalMap
<
	string Texture = "normalmap";
	string MipFilter = "LINEAR";
	string MinFilter = "LINEAR";
	string MagFilter = "LINEAR";
	string AddressU = "WRAP";
	string AddressV = "WRAP";
	string AddressW = "WRAP";
>;

texture detailnormalmap
<
	string UIWidget = "Texture";
	string UIObject = "shaders\\textures\\common\\white.dds";
	string UIName = "ϸ�ڷ�����ͼ";
>;

sampler2D detailnormalmapsampler
<
	string Texture = "detailnormalmap";
	string MipFilter = "LINEAR";
	string MinFilter = "LINEAR";
	string MagFilter = "LINEAR";
	string AddressU = "WRAP";
	string AddressV = "WRAP";
	string AddressW = "WRAP";
>;

float detailscaleu
<
	string UIName = "U���ظ���";
	float UIMin = 0.0;
	float UIMax = 100.0;
	float UIStep = 0.1;
> = 1.0;

float detailscalev
<
	string UIName = "V���ظ���";
	float UIMin = 0.0;
	float UIMax = 100.0;
	float UIStep = 0.1;
> = 1.0;

float4 lightpos : POSITION
<
	string UIName = "�ƹ�:";
	string Object = "PointLight";
	int refID = 0;
>;


float4 lightcolor
<
	string UIName = "�ƹ���ɫ��ֻ���ڲο����������þ�����ֵ��";
	//int LightRef = 0;
> = {0.9804,0.8398,0.7460,1};

float4 skycolor
<
	string UIName = "�����ɫ";
> = {0.5703,0.7539,0.8359,1};

/*
float skyambco
<
	string UIName = "���Ӱ����";
	float UIMin = 0.0;
	float UIMax = 1.0;
> = 1.0;
*/

float4 groundcolor
<
	string UIName = "���������ɫ";
> = {0.6093,0.8320,0.5742,1};


float4 emissivecolor
<
	string UIName = "�Է���";
> = {0,0,0,1};

float4 specularcolor
<
	string UIName = "�߹���ɫ";
> = {1,1,1,1};

float specularlevel
<
	string UIName = "�߹�ǿ��";
	float UIMin = 0.0;
	float UIMax = 10.0;
	float UIStep = 0.001;
> = 1.0;

float glossiness
<
	string UIName = "�߹������ֵԽ��߹����ԽС��";
	string UIWidget = "slider";
	float UIMin = 0.0;
	float UIMax = 100.0;
	float UIStep = 0.1;	
> = 10;

bool glossfromalpha
<
	string UIName = "ʹ��Alphaͨ�����Ƹ߹��С";
> = false;

texture rimmap
<
	string UIWidget = "Texture";
	string UIObject = "shaders\\textures\\common\\white.dds";
	string UIName = "�߹���ͼ";
>;
sampler2D rimmapsampler
<
	string Texture = "rimmap";
	string MipFilter = "LINEAR";
	string MinFilter = "LINEAR";
	string MagFilter = "LINEAR";
	string AddressU = "Clamp";
	string AddressV = "Clamp";
	string AddressW = "Clamp";
>;

float4 rimcolor
<
	string UIName = "�߹���ɫ";
> = {1,1,1,1};


texture rimmapin
<
	string UIWidget = "Texture";
	string UIObject = "shaders\\textures\\RimLookUpTable\\rim_in_0.dds";
	string UIName = "������ͼ";
>;
sampler2D rimmapinsampler
<
	string Texture = "rimmapin";
	string MipFilter = "LINEAR";
	string MinFilter = "LINEAR";
	string MagFilter = "LINEAR";
	string AddressU = "Clamp";
	string AddressV = "Clamp";
	string AddressW = "Clamp";
>;

float4 rimcolorin
<
	string UIName = "������ɫ";
> = {1,1,1,1};

texture eyereflectmap
<
	string UIWidget = "Texture";
	string UIObject = "shaders\\textures\\eye_reflect.dds";
	string UIName = "���򷴹���ͼ";
>;
sampler2D eyereflectmapsampler
<
	string Texture = "eyereflectmap";
	string MipFilter = "LINEAR";
	string MinFilter = "LINEAR";
	string MagFilter = "LINEAR";
	string AddressU = "Clamp";
	string AddressV = "Clamp";
	string AddressW = "Clamp";
>;

texture anisotex 
<
	string UIWidget = "Texture";
	string UIName = "����������ͼ";
	string ResourceName = "";
>;
sampler2D anisotexsampler
<
	string Texture = "anisotex";
	string MipFilter = "LINEAR";
	string MinFilter = "LINEAR";
	string MagFilter = "LINEAR";
	string AddressU = "Clamp";
	string AddressV = "Clamp";
	string AddressW = "Clamp";
>;

float reflectdark
<
	string UIName = "���䱾��䰵ϵ�����������Է���Ĳ�����";
	float UIMin = 0;
	float UIMax = 4.0;
> = 1.0;

texture reflectmap
<
	string UIWidget = "Texture";
	string UIObject = "shaders\\textures\\armorreflect.dds";
	string UIName = "������ͼ";
>;

samplerCUBE reflectmapsampler
<
	string Texture = "reflectmap";
	string MipFilter = "LINEAR";
	string MinFilter = "LINEAR";
	string MagFilter = "LINEAR";
	string AddressU = "WRAP";
	string AddressV = "WRAP";
	string AddressW = "WRAP";
>;

float reflectlevel
<
	string UIName = "����ǿ�ȣ�����ͼ�������Է��乲�������";
	string UIWidget = "slider";
	float UIMin = 0.0;
	float UIMax = 10.0;
	float UIStep = 0.1;	
> = 1.0;

float reflectcontrast
<
	string UIName = "������ͼ�Աȶȣ�����ͼ����Ĳ�����";
> = 1.0;

float4 reflectcolor
<
	string UIName = "������ɫ���˲��������ַ������Ч��";
> = {1,1,1,1};

texture mask_2_map
<
	string UIWidget = "Texture";
	string UIObject = "shaders\\textures\\common\\white.dds";
	string UIName = "_G ��ͼ";
>;

sampler2D mask_2_mapsampler
<
	string Texture = "mask_2_map";
	string MipFilter = "LINEAR";
	string MinFilter = "LINEAR";
	string MagFilter = "LINEAR";
	string AddressU = "WRAP";
	string AddressV = "WRAP";
	string AddressW = "WRAP";
>;

float Glowness
<
	string UIName = "�Թ�ǿ��";
	float UIMin = 0.0;
	float UIMax = 100.0;
	float UIStep = 0.01;
> = 1.0;

texture flowmap
<
	string UIWidget = "Texture";
	string UIObject = "shaders\\textures\\common\\bloomflow.tga";
	string UIName = "������ͼ";
>;

sampler2D flowmapsampler
<
	string Texture = "flowmap";
	string MipFilter = "LINEAR";
	string MinFilter = "LINEAR";
	string MagFilter = "LINEAR";
	string AddressU = "WRAP";
	string AddressV = "WRAP";
	string AddressW = "WRAP";
>;

float emissivepower
<
	string UIName = "�������ȣ��������Ҫ��Bͨ��Ϳ�ڣ�";
	string UIWidget = "slider";
	float UIMin = 0.0;
	float UIMax = 10.0;
	float UIStep = 0.01;
> = 3;

float flowspeed
<
	string UIName = "�����ٶȣ������������ʹ��Ĭ��ֵ��";
	string UIWidget = "slider";
	float UIMin = 0.0;
	float UIMax = 1.0;
	float UIStep = 0.001;	
> = 0.05;



float flowUVtile
<
	string UIName = "����ͼ�ظ��ȣ������������ʹ��Ĭ��ֵ��";
	string UIWidget = "slider";
	float UIMin = 0.0;
	float UIMax = 100.0;
	float UIStep = 0.1;	
> = 20;


float4 ps_main(VS_OUTPUT In) : COLOR 
{
	float3 N = 0.0f;

	//ready for vectors
#ifdef USE_NORMALMAP
	N = glb_SamplerNormalMap(normalmapsampler, In.uvBase, 1.0f);
#else
	N.z = 1.0f;
#endif

#ifdef USE_DETAILNORMALMAP
	float4 detailnormalmapcolor = tex2D(detailnormalmapsampler,In.uvBase*float2 (detailscaleu,detailscalev)) * 2.0 - 1.0;
	N += float3(detailnormalmapcolor.ag,0);
#endif

	N = normalize(N);
	float3 L = normalize(In.LightDir.xyz);
	float3 V = normalize(In.ViewDir);
	float3 H = normalize(L + V);	
	float3 reflectvector = reflect(V,N).xzy;

	//sampler textures
	float4 diffusemapcolor = tex2D(diffusemapsampler,In.uvBase);
	float4 maskmapcolor = tex2D(maskmapsampler,In.uvBase);
	float4 mask_2_mapcolor = tex2D(mask_2_mapsampler,In.uvBase);
	float4 cubemapcolor = texCUBE(reflectmapsampler,reflectvector);
	float4 flowmapcolor = tex2D(flowmapsampler,In.uvBase * flowUVtile + flowspeed * g_vTime.x);

	//calculate diffuse light
	float4 diffuselight;
	//float4 skylight;
	
	float4 WarpSkinColor = 1.0f;

#ifndef USE_SKIN
	{
		diffuselight = saturate(dot(N,L));
	}
#else
	{
		diffuselight = dot(N,L) * 0.5 + 0.5;
		//skylight = lerp(groundcolor,skycolor,N.z * 0.5 + 0.5);
		WarpSkinColor= tex2D(g_SkinWarpSampler, float2(diffuselight.r,0.0));
		//WarpSkinColor= WarpSkinColor*customizecolor;
	}
#endif
	
	float fNDotL = dot(N,L);
	float fA1 = saturate(-fNDotL);
	float fA2 = 1 - abs(fNDotL);
	float4 vAmbient = groundcolor * fA1 + skycolor * fA2;
	
	//SSS
#ifndef USE_SKIN
	{
		diffuselight.rgb = vAmbient+lightcolor*diffuselight;
	}
#else
	{
		diffuselight.rgb = vAmbient + lightcolor *WarpSkinColor.rgb;
	}
#endif
	
	//calculate ediglight
	float2 edigcoord = float2(abs(dot(V,N)),0);
	float edigsampler = tex2D(rimmapsampler,edigcoord);
	float ediginsampler = tex2D(rimmapinsampler,edigcoord);
	float4 ediglight = (edigsampler * rimcolor + ediginsampler * rimcolorin) * diffuselight;
	//float4 ediglight = pow(saturate(0.95 - abs(dot(V,N))),ediglightrange) * diffuselight * lightcolor * ediglightpower;
	
	//float4 diffuse = diffuselight * lightcolor + skylight + emissivecolor + ediglight;
	float4 diffuse = diffuselight + emissivecolor + ediglight;

	//caculate customize color
	float4 customcolor;

#ifdef USE_SKIN
	customcolor = (diffusemapcolor * maskmapcolor.r) + (diffusemapcolor * customizecolor * (1 - maskmapcolor.r)) ;	
#else
	customcolor = diffusemapcolor;
#endif
	
	//calculate diffuse + ambient
	float4 finalcolor = diffuse * customcolor;
	
	//calculate reflect
#ifndef USE_SKIN
#ifdef USE_REFLECT
	{
#ifdef USE_ANISO
		{
			float  fNDotL = saturate(dot(N,L));
			float3 vViewReflection = reflect(-V, N);
			float  fVRDotV = saturate(dot(vViewReflection, V));
			float2 vAnisoUV = float2(fNDotL, fVRDotV);
			float4 colAnisoTex = tex2D(anisotexsampler, vAnisoUV);
			float4 colAniso = maskmapcolor.b * reflectcolor * colAnisoTex.a * finalcolor;
			finalcolor *= lerp(1.0, colAnisoTex, saturate(maskmapcolor.b * reflectdark));
			finalcolor += colAniso;
		}
#else
		{
			cubemapcolor = pow(cubemapcolor, reflectcontrast);
			float gray = dot(cubemapcolor, float3(0.3, 0.59, 0.11));
			finalcolor *= lerp(1.0, gray, saturate(maskmapcolor.b * reflectdark));
			finalcolor += cubemapcolor * reflectcolor * maskmapcolor.b * reflectlevel;
		}
#endif
	}
#endif
#endif
	
	//calculate specular
	/*
	float NdotH = max(dot(N,H),0);
	float specularpow = pow(NdotH,glossiness);
	float4 specular = specularpow * specularlevel * specularcolor;
	*/
	float3 vLightReflection = -reflect(L, N);
	float fRDotV = dot(N,L) > 0.0f ? saturate(dot(vLightReflection, V)) : 0.0f;
	float4 specular = pow(fRDotV, glossiness) * specularcolor * specularlevel;
	if(glossfromalpha)
	{specular = pow(fRDotV, (1.0-maskmapcolor.a)*100) * specularcolor * specularlevel;}
	finalcolor += specular * maskmapcolor.g;

	
	//calculate flow
#ifdef USE_FLOW
	{
		finalcolor *= 1.0 - mask_2_mapcolor.b;
		finalcolor += flowmapcolor * emissivepower * mask_2_mapcolor.b * diffusemapcolor;
	}
#endif
	
#ifdef USE_ONLY_NORMALMAP
	{
		finalcolor = diffuse;
	}
#endif
	
	//calculate eyelight
	float2 camReflect;
	camReflect.x = (reflectvector.x + 1) * 0.5;
	camReflect.y = (1 - reflectvector.y) * 0.5;
	float4 colReflectTex = tex2D(eyereflectmapsampler, camReflect.xy);
	float eye_power = pow(colReflectTex.r, 3.0) * .8;

	finalcolor+= eye_power;

	//calculate final alpha
#ifdef USE_SKIN
	finalcolor.a = 1;
#else
	finalcolor.a = maskmapcolor.r;
#endif

	return finalcolor;
}
