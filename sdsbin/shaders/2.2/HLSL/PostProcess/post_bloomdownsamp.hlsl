string entrynames = "ps_2_0 ps_main";

sampler g_Sampler 	: register(s0);
float2 g_vPixelSize;


float4 ps_main(in float2 texcoord : TEXCOORD0) : COLOR0
{
	float2 hs = g_vPixelSize * 0.5;
	float4 c0 = tex2D(g_Sampler, texcoord + float2(hs.x, hs.y));
	float4 c1 = tex2D(g_Sampler, texcoord + float2(-hs.x, hs.y));
	float4 c2 = tex2D(g_Sampler, texcoord + float2(hs.x, -hs.y));
	float4 c3 = tex2D(g_Sampler, texcoord + float2(-hs.x, -hs.y));
	float4 c = (c0 + c1 + c2 + c3) * 0.25;
	return c;
}