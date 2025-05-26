string entrynames = "ps_2_0 ps_main";

sampler 		sampIntZ 				: register(s0);
float zn;
float zf;


float4 ps_main(in float2 texcoord : TEXCOORD0) : COLOR0
{
	float zr = tex2D(sampIntZ, texcoord).r;      //Z buffer��ȡ�Ľ��. ������.
	float dis = zf - zn;
	//float z = (zn * zf) / ( dis * (zf / dis - zr)) / zf;	//ת��Ϊ����
	float z = zn / (zf -  dis * zr);	//ת��Ϊ����
	return float4(z,z,z,z);
}

