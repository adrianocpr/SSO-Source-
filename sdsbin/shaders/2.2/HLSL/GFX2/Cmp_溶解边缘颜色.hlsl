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

float gThreshold
<
   string UIName = "溶解阈值";
   string UIDesc = "溶解贴图r值小于此值的点显示为透明";
   string UIWidget = "Slider";
   float UIMin = 0.0;
   float UIMax = 1.0;
   float UIStep = 0.01;
> = 0.0f;

float gEdgeWeight
<
   string UIName = "边缘权重";
   string UIDesc = "";
   string UIWidget = "Slider";
   float UIMin = 0.0;
   float UIMax = 1.0;
   float UIStep = 0.01;
> = 0.0f;

float4 gEdgeColor
<
   string UIName = "边缘颜色";
   string UIDesc = "软边缘边缘颜色";
   string UIWidget = "Color";
> ={1.0f,1.0f,1.0f,1.0f};

float4 ps_main(psIutput input) : COLOR0
{
	float4 col;
	float4 tex0 = tex2D(s0, input.Tex0.xy);
	float4 tex1 = tex2D(s1, input.Tex0.xy);
	col = tex0 * input.Diffuse;
	
	float r = gThreshold - tex1.r;
	float g = r + gEdgeWeight;
	float b = saturate(gEdgeWeight - g);
	
	float4 col3;
	col3.a = b;
	col3.rgb = col3.a * gEdgeColor + gEdgeColor;
	
	if (g > 0)
		col = col3;
	
	if (r > 0)
		col.a = 0.0f;
	
	return col;
}

