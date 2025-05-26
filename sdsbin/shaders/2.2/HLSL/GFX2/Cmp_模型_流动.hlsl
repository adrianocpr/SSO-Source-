#include "gfx_common.h"
#include "../SkinModel/Mesh_Comm.h"

string entrynames = "ps_2_0 ps_main";

struct psIutput
{
	float4		Diffuse 	: COLOR0;
	float4		Tex0        : TEXCOORD0;	
};

float4 g_GfxDiffuse = {1.0f, 1.0f,1.0f,1.0f};

sampler s0 : DiffuseMap_GFX_Replace
<
    string MipFilter = "LINEAR";
    string MinFilter = "LINEAR";
    string MagFilter = "LINEAR";
    string AddressU = "WRAP";
    string AddressV = "WRAP";
>;

texture t1
<
	string UIName = "maskͼ";
	string UIObject = "�൱��ԭ����shader������ͼ";
>;

sampler s1
<
	string Texture = "t1";
	
	string MinFilter = "LINEAR";
	string MagFilter = "LINEAR";
	string MipFilter = "LINEAR";
	string AddressU = "WRAP";
	string AddressV = "WRAP";
>;

float gMoveOffset
<
   string UIName = "�ƶ�ƫ��";
   string UIDesc = "const0";
   string UIWidget = "Slider";
   float  UIMin = 0;
   float  UIMax = 1.0;
   float  UIStep = 0.01;
> = 0.0f;

float gBlendFactor
<
   string UIName = "�������";
   string UIDesc = "const1";
   string UIWidget = "Slider";
   float  UIMin = 0;
   float  UIMax = 1.0;
   float  UIStep = 0.01;
> = 0.0f;

float4 ps_main(psIutput input) : COLOR0
{
	float4 col;
	float4 tex0 = tex2D(s0, input.Tex0.xy);
	
	float4 r2 = tex0 + gMoveOffset; 
	float4 tex1 = tex2D(s1, r2.xy);
	
	col = tex0 * (1.0f - gBlendFactor) + tex1 * gBlendFactor;
	
	col.rgb = col.rgb * g_GfxDiffuse.rgb;
	col.a = tex0.a * g_GfxDiffuse.a;
	
	return col;
}