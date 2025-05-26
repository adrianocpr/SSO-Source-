/*-----------------------------------------------------------------
	Stone VFX Shader(2.2)
	Devleoped by wei wang (Engine Center)
	Perfect World
-----------------------------------------------------------------*/

//-----------------------------------------------------------------
// Include
//-----------------------------------------------------------------
#include "gfx_common.h"
#include "../SkinModel/Mesh_Comm.h"

//-----------------------------------------------------------------
// psInput
//-----------------------------------------------------------------

struct psInput 
{
	float4 pos	            : POSITION0;
	float2 uvBase           : TEXCOORD0;
	float3 ViewDir          : TEXCOORD1;
	float3 LightDir         : TEXCOORD2;
	float4 PtLightDir       : TEXCOORD3;
	float4 tangent					: TEXCOORD4;
	float3 binormal					: TEXCOORD5;
	float4 fogParam					: TEXCOORD6;
	float4 vScreenPos				: VPOS;
};

float4 g_colDiffuse    : Diffuse = {1.0f, 1.0f,1.0f,1.0f};
float  g_fDiffusePower : DirPower;
float4 g_colAmbient    : Ambient0 = {0.0f, 0.0f, 0.0f, 0.0f};
float4 g_Ambient2      : Ambient1;
//-----------------------------------------------------------------
// Parameter
//-----------------------------------------------------------------


float g_MaskSpan
<
	string UIName =  "消隐跨度";
	string UIWidget = "slider";
	float UIMin  = 0.0;
	float UIMax  = 1.0;
	float UIStep = 0.01;
> = 0.4;

float g_edgeContrast
<
	string UIName =  "边缘对比度";
	string UIWidget = "slider";
	float UIMin = 1.0;
	float UIMax = 5.0;
	float UIStep = 0.01;
> = 1.0f;

float4 g_edgeColor
<
	string UIName =  "边缘颜色";
	string UIWidget = "Color";
> = {1.0, 1.0, 1.0, 0.0};

float g_SpecPower
<
	string UIName =  "高光面积";
	string UIWidget = "slider";
	float UIMin = 0.0;
	float UIMax = 100;
	float UIStep = 0.01;
> = 50.0f;

float g_SpecValue
<
	string UIName =  "高光倍增";
	string UIWidget = "slider";
	float UIMin = 0.0;
	float UIMax = 2;
	float UIStep = 0.01;
> = 1.0f;

float g_TimerValue
<
	string UIName =  "时间滑块";
	string UIWidget = "slider";
	float UIMin = 0.0;
	float UIMax = 1.5;
	float UIStep = 0.01;
> = 1.5f;

//-----------------------------------------------------------------
// Texture and Sampler
//-----------------------------------------------------------------
// for PRG
sampler g_NormalMap : NormalMap_GFX_Replace
<
    string MipFilter = "LINEAR";
    string MinFilter = "LINEAR";
    string MagFilter = "LINEAR";
    string AddressU = "WRAP";
    string AddressV = "WRAP";
>;

sampler g_AlphaMap : DiffuseMap_GFX_Replace
<
    string MipFilter = "LINEAR";
    string MinFilter = "LINEAR";
    string MagFilter = "LINEAR";
    string AddressU = "WRAP";
    string AddressV = "WRAP";
>;


//For Artist
texture g_GradientDissolveTexture
<
		string UIWidget = "Texture";
    string UIObject = "Shaders\\Textures\\Vfx\\GradientDissolve.dds";
    string UIName =  "溶解贴图";
>;

texture g_edgeTexture
<
		string UIWidget = "Texture";
    string UIObject = "Shaders\\Textures\\Vfx\\edge.dds";
    string UIName =  "边缘控制贴图";
>;


sampler g_GradientDissolveSampler
<
    string Texture = "g_GradientDissolveTexture";
    string MipFilter = "LINEAR";
    string MinFilter = "LINEAR";
    string MagFilter = "LINEAR";
    string AddressU = "WRAP";
    string AddressV = "WRAP";
>;

sampler g_edgeSampler
<
    string Texture = "g_edgeTexture";
    string MipFilter = "LINEAR";
    string MinFilter = "LINEAR";
    string MagFilter = "LINEAR";
    string AddressU = "CLAMP";
    string AddressV = "CLAMP";
>;

//-----------------------------------------------------------------
// PS
//-----------------------------------------------------------------
float4 ps_main(psInput Input) : COLOR0
{
	float4 edgeColor= 0.0f;
	float4 ResultColor =0.0f;
	float3 colAmbient  = 0.0;
	
	float3 colSunDiffuse = g_colDiffuse.rgb * g_fDiffusePower;

	//Tangent space L N V
	float3 vLightDir = normalize(Input.LightDir.xyz);
	float3 ViewDir   = normalize(Input.ViewDir.xyz);
	float3 vNormal;
	vNormal.rg = tex2D(g_NormalMap, Input.uvBase.xy).ag*2-1;
	vNormal.b  = sqrt(1 - dot(vNormal.rg, vNormal.rg));
	vNormal = normalize(vNormal);
	
	//Using Vertex Light
	float fNDotL = dot(vNormal.xyz, vLightDir.xyz);
	float fA1 = saturate(-fNDotL);
	float fA2 = 1 - abs(fNDotL);
	float HalfLambert = fNDotL*0.5+0.5;
	// Specular
	float3 vLightReflection = -reflect(vLightDir, vNormal.xyz);
	float fRDotV = fNDotL > 0.0f ? saturate(dot(vLightReflection, ViewDir)) : 0.0f;
	float Specular = pow(fRDotV, g_SpecPower) * g_SpecValue;
	
	//Ambient
	colAmbient = (g_colAmbient.rgb * fA1 + g_Ambient2.rgb * fA2);
	
	//Calculate Edge Color
	edgeColor =glb_GetEdgeColorCustom(g_GradientDissolveSampler,g_edgeSampler,Input.uvBase.xy,g_edgeContrast,g_MaskSpan,g_edgeColor,g_TimerValue);
	//Calculate Inner Color
  float4 InnerDiffuseTex = tex2D(g_AlphaMap, Input.uvBase.xy);
  InnerDiffuseTex.xyz =(InnerDiffuseTex.xyz*HalfLambert +Specular)*colSunDiffuse.xyz;
  
	//Comp
	ResultColor.rgb = edgeColor.xyz+InnerDiffuseTex.xyz + colAmbient.xyz;
	float alpha = InnerDiffuseTex.a;
 	alpha= alpha > 0.329411764 ? edgeColor.a:0.0; //0.329411764 =84/255 AlphaCompare
	ResultColor.a=alpha;
	
	//Fog
	ResultColor.rgb = lerp(Input.fogParam.rgb, ResultColor.rgb, Input.fogParam.a);
	
	return ResultColor;
}