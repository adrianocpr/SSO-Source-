string entrynames = "ps_2_0 ps_main";

sampler BaseSampler : register(s0);
float4 g_crMask;
	
struct VS_OUTPUT
{
	float4 position : POSITION;   // vertex position
	float4 color    : COLOR0;
	float2 texcoord : TEXCOORD0;  // vertex texture coords
};

float4 ps(VS_OUTPUT Input) : COLOR0
{
	float4 color = tex2D(BaseSampler, Input.texcoord) * Input.color;
	return color;
}
