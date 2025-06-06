string entrynames = "ps_2_0 ps_main";

struct psIutput
{
	float4		Diffuse 	: COLOR0;
	float4		Tex0        : TEXCOORD0;	
};

texture t0
<
	string UIName = "底图";
	string UIObject = "相当于原来的贴图文件路径";
>;

sampler s0
<
	string Texture = "t0";
>;

texture t1
<
	string UIName = "mask图";
	string UIObject = "相当于原来的shader所用贴图";
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
   string UIName = "移动偏移";
   string UIDesc = "const0";
   string UIWidget = "Slider";
   float  UIMin = 0;
   float  UIMax = 1.0;
   float  UIStep = 0.01;
> = 0.0f;

float gBlendFactor
<
   string UIName = "混合因子";
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
	
	col.rgb = col.rgb * input.Diffuse.rgb;
	col.a = tex0.a * input.Diffuse.a;
	
	return col;
}