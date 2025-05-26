string entrynames = "ps_2_0 ps_main";

sampler g_sampBackBuffer				: register(s0);
sampler g_sampGodRay					: register(s1);
sampler g_DepthSampler 					: register(s2);

// #ifdef _ANGELICA_2_2
// sampler g_sampScreenIlum				: register(s3);
// #endif

float 				m_fOcclusionDepthRange_0_1;	//���ڴ���ȵ�������ɫ�ᱻ��������Bloom,С�ڴ���ȵ�������ɫ���Ϊ��
float				m_fBloomScale;				//Bloom����ǿ��. 0Ϊ������Bloom, �޹���
float				m_fScreenBlendThreshold;	//��Ļ���ȱ���С�����ֵ�Ż����Bloom�ĵ���, ԽС����Խ��
float3				m_vBloomTint;				//������ɫ��������ֵ֮���ٽ���bloom
float				m_fOcclusionDarkness;		//����ģ�����OcclusionMask����Ļ��ɫ���кڻ�, 0�����̶Ⱥڻ�,1�򲻺ڻ�
float				m_fAngleScale;
float4 ps_main(in float2 texcoord : TEXCOORD0) : COLOR0
{
/*
	float3 crBackBuffer 	= tex2D(g_sampBackBuffer, texcoord).xyz;
	float3 blurColor = tex2D(g_sampGodRay, texcoord).xyz;
	float3 crGodrayColor = saturate( sqrt(blurColor * 0.5) )* g_fScale * 0.5;
	float3 color = crBackBuffer.xyz + crGodrayColor.xyz;
	return float4(color, 1);
*/
	float3 backColor = tex2D(g_sampBackBuffer, texcoord).rgb;
	const float3 weights = float3(0.2126, 0.7152, 0.0722);
	float backIlum = dot(weights, backColor.rgb);
	
	float4 bloomColor = tex2D(g_sampGodRay, texcoord);

	float fOcclusionDarkness = m_fOcclusionDarkness;
	float3 darkenColor = lerp(backColor * bloomColor.w, backColor,  1 - (1 - fOcclusionDarkness) * m_fAngleScale);      //m_fOcclusionDarkness);
	
	float3 bloomAdd;
	float depth = tex2D(g_DepthSampler, texcoord).r;
	//depth = 0.f;
	if(backIlum > m_fScreenBlendThreshold && depth < m_fOcclusionDepthRange_0_1)
		bloomAdd = 0;
	else
	{
	
// #ifdef _ANGELICA_2_2
// 		bloomAdd = lerp(bloomColor.rgb, float3(0,0,0), backIlum / m_fScreenBlendThreshold);
// 		float fBloomScale = m_fBloomScale;
// 		float fScreenIlum = tex2D(g_sampScreenIlum, float2(0.5, 0.5)).a;
// 		fBloomScale = lerp(m_fBloomScale * 0.2, m_fBloomScale * 2, saturate(0.8f - fScreenIlum));
// 		bloomAdd *= (m_vBloomTint * fBloomScale * m_fAngleScale);	
// #else			
		if(depth < m_fOcclusionDepthRange_0_1)
		{
			float disFactor = saturate(m_fOcclusionDepthRange_0_1 - depth) / (m_fOcclusionDepthRange_0_1); 
			float backIlumFactor = saturate(backIlum / m_fScreenBlendThreshold);
			bloomAdd = lerp(bloomColor.rgb, float3(0,0,0), min(disFactor, backIlumFactor));
		}
		else
			bloomAdd = bloomColor.rgb;
		bloomAdd *= (m_vBloomTint * m_fBloomScale * m_fAngleScale);	
//#endif
	}
	return float4(darkenColor + bloomAdd, 1);
	
}
