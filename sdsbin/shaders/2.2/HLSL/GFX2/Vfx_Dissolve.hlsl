/*-----------------------------------------------------------------
	�ܽ�/���Ե/��Ե��ɫ
	���ӻ���Ƭ���� All in One
	Instruction: 21
	RTX :wei wang (Engine Center)
	Perfect World
-----------------------------------------------------------------*/

string entrynames = "ps_2_0 ps_main";

struct psIutput
{
	float4		Diffuse 	: COLOR0;
	float4		Tex0        : TEXCOORD0;
	float4      fogParam    : TEXCOORD6;	
};

texture texBase
<
	string UIName = "��ͼ";
	string UIObject = "";
>;

sampler sBase
<
	string Texture = "texBase";
>;

texture texDissolve
<
	string UIName = "�ܽ���ͼ";
	string UIObject = "";
>;

sampler sDissolve
<
	string Texture = "texDissolve";
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

float gEdgeRange
<
   string UIName = "���Ե��Χ";
   string UIDesc = "��Ե����Ӳ�̶�,0��ʾû�����Ե��û�б�Ե��ɫӰ��";
   string UIWidget = "Slider";
   float  UIMin = 0.0;
   float  UIMax = 1.0;
   float  UIStep = 0.01;
> = 0.0f;


float4 gEdgeColor
<
   string UIName = "��Ե��ɫ";
   string UIDesc = "���Ե��Ե��ɫ";
   string UIWidget = "Color";
> ={1.0f,1.0f,1.0f,1.0f};

float gEdgePower
<
   string UIName = "��Ե��ɫ�Ա�";
   string UIDesc = "��Ե����ɫ�Աȷ�Χ����";
   string UIWidget = "Slider";
   float  UIMin = 0.0;
   float  UIMax = 15.0;
   float  UIStep = 0.01;
> = 1.0f;

float4 ps_main(psIutput input) : COLOR0
{
	float4 TexColor = tex2D(sBase, input.Tex0.xy);
	float4 DissolveColor = tex2D(sDissolve, input.Tex0.xy);
	
	//soft edge
	float delta = gThreshold - DissolveColor.r;
	float temp =saturate(-delta / gEdgeRange) * TexColor.a;
	//Gray value form diffuse for Cut off Edge color
	float GrayValue =dot(TexColor.rgb, float3(0.299, 0.587, 0.114));
	GrayValue =GrayValue>0.01f? 1.0:0.0;
	//comp
	TexColor.rgb = gEdgeRange<0.01f? TexColor.rgb : TexColor.rgb+gEdgeColor.rgb*(1-pow(temp,gEdgePower))*GrayValue;
	TexColor.a  = delta > 0.0f? 0.0f:temp;
	TexColor.rgb*=temp;//Fit for Every Blend Mode
	TexColor *= input.Diffuse;

    TexColor.rgb = lerp(input.fogParam.rgb, TexColor.rgb, input.fogParam.a);

	return TexColor;
}
