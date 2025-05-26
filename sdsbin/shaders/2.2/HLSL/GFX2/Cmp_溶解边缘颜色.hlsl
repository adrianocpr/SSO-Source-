string entrynames = "ps_2_0 ps_main";

struct psIutput
{
	float4		Diffuse 	: COLOR0;
	float4		Tex0        : TEXCOORD0;	
};

texture t0
<
	string UIName = "��ͼ";
	string UIObject = "�൱��ԭ������ͼ�ļ�·��";
>;

sampler s0
<
	string Texture = "t0";
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

float gThreshold
<
   string UIName = "�ܽ���ֵ";
   string UIDesc = "�ܽ���ͼrֵС�ڴ�ֵ�ĵ���ʾΪ͸��";
   string UIWidget = "Slider";
   float UIMin = 0.0;
   float UIMax = 1.0;
   float UIStep = 0.01;
> = 0.0f;

float gEdgeWeight
<
   string UIName = "��ԵȨ��";
   string UIDesc = "";
   string UIWidget = "Slider";
   float UIMin = 0.0;
   float UIMax = 1.0;
   float UIStep = 0.01;
> = 0.0f;

float4 gEdgeColor
<
   string UIName = "��Ե��ɫ";
   string UIDesc = "���Ե��Ե��ɫ";
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

