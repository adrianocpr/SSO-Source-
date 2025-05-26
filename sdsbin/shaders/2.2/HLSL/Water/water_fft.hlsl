
#ifdef _ANGELICA_2_1
#include "common_fog.hlslvh"
float4 ComputeFog(float3 eyetopos, float y, float4x4 params)
{
	return ComputeCompositeFog(eyetopos, y, params._m00, params._m10, params._m20, params._m30, 
	params._m02_m12_m22_m32, params._m03_m13_m23_m33, params._m01, params._m11, params._m21, params._m31);
}
#else
#include "..\fog\fog_common.h"
float4 ComputeFog(float3 eyetopos, float y, float4x4 params)
{
	return ComputeCompositeFogSimple(eyetopos, y);
}
string entrynames = "ps_3_0 ps; vs_3_0 vs";	

string macro1
<
	string name = "ENABLE_RAIN";
	string desc = "�Ƿ����겨";
	string type = "PRG";
	string GroupID = "2";
>;

string macro2
<
	string name = "ENABLE_CAUSTIC";
	string desc = "�Ƿ񿪽�ɢ";
	string type = "PRG";
	string GroupID = "3";
>;

// string macro3
// <
// 	string name = "ENABLE_HIGH_REFRA";
// 	string desc = "�Ƿ�ɫ��";
// 	string type = "PRG";
// 	string GroupID = "4";
// >;

// string macro4
// <
// 	string name = "ENABLE_FFT";
// 	string desc = "�Ƿ�FFT����";
// 	string type = "PRG";
// 	string GroupID = "5";
// >;
#define ENABLE_FFT 1

string macro5
<
	string name = "ENABLE_WAVE";
	string desc = "�Ƿ񿪲���";
	string type = "PRG";
	string GroupID = "6";
>;

string macro6
<
	string name = "ENABLE_FOG";
	string desc = "�Ƿ���";
	string type = "PRG";
	string GroupID = "7";
>;

// string macro7
// <
// 	string name = "ENABLE_BLOOM";
// 	string desc = "�Ƿ�BLOOM";
// 	string type = "PRG";
// 	string GroupID = "8";
// >;

#endif

#include "water_fft_common.h"

float4x4 g_mViewProj; 		//ViewProj����    view projection matrix
float4x4 g_mReflProj;    
//Ӧ�þ��ǵ�ǰ�������view * proj * 0-1ƫ��. Crysis������ÿ֡�������������, �����ReflProj���ܲ����ǵ�ǰ֡��ViewProj����
//����eRTUpdate_WaterReflect, �ۺϿ���������������λ��,�Լ���һ֡�ĸ���ʱ��
//����FRT_CAMERA_REFLECTED_WATERPLANE�鿴��ȾReflection�Ĺ���

float g_fWaterLevelAtCamera;	//���������ˮ��߶�
float g_fWaterLevel;			//ȫ��ˮ��߶�
								//float4 g_fWaterLevel;		//ˮ��߶� //m_fWaterLevel, m_fWaterLevel, fWaterHeightAtCameraPos
//float g_bUseFFT;				//�Ƿ�ʹ��FFT����ƫ�ƶ���

float3 g_PS_SunLightDir; 	//̫���ⷽ�� = float4(1,1,1);
float3 g_PS_SkyColor; 		//�����ɫ = float3(0.2, 0.3, 0.8);
float3 g_PS_SunColor; 		//̫����ɫ = float3(1, 1, 1);

// water waves parameters    
float g_fWindSpeed;
float g_fWaveSpeed;
float g_fWaveAmount;

float g_fWaveSize;
float g_fDirCos;
float g_fDirSin;

float4 g_vNearFarDis;					//vs ps ����
float3 g_vCameraPos;					//vs ps ����

float2 g_vOceanMeshRot;
float g_fTime;

float4 g_vScreenSize;

//�û����õĲ���:
float g_fSoftIntersectionFactor = 1.0;	//"Controls softness of water surface intersection with other opaque scene geometry";       0~10
float g_fReflectionAmount = 0.5;		//"Set reflection scale";     0~10
float g_fWhiteCapsAmount = 0.75;		//"Set white caps";      0~2   
float g_fSunMultiplier = 12.0;			//"g_fSunMultiplier" 0~32
float g_fFresnelScale = 1.0;			// 0~32
float g_fEdgeFoamAmount = 1.0;

//float g_bEnableNew = 0;				//vs ps ����
float g_bEdgeFoam = 1;
float g_bWaveFoam= 1;
float g_bWaveGloss = 1;
float g_bCubeRefl = 0;
//float g_bRain = 1;
//float g_bCaustic = 1;



float4x4 fogParamsP			:	register(c28);

float3 g_waterFogColor;
float g_fFogDensity = 0.8f;
float g_fWaterFogScaleExp = 5;

float g_fRainLerp = 0.f;

float g_bEnableArea;
float4 g_waterArea;   //xy: minXZ; zw: maxXZ

float2 g_vCurrentSmallWaterStart : register(c32);
float4 g_vSmallWaterWidth; //x: smallWaterWidth  y: ˥������ z����Զ����

sampler2D	fftTexSampler 			: register(s0);		//POINT Wrap
sampler2D	oceanBumpMapSampler 	: register(s4);		//LINEAR Wrap
sampler2D	foamSampler 			: register(s1);		//LINEAR Wrap MipFilter = POINT;
sampler2D	waterGlossMapSampler 	: register(s2);		//LINEAR Wrap
sampler2D	_causticSampler			: register(s3);		//LINEAR Wrap MipFilter = POINT;
sampler2D	envMapSamplerRefl		: register(s5);		//LINEAR Clamp
sampler2D	envMapSamplerRefr		: register(s6);		//POINT Clamp
sampler2D	sceneDepthSampler		: register(s7);		//POINT Clamp
sampler2D	_causticRTSampler		: register(s8);		//LINEAR Wrap MipFilter = POINT;
sampler2D	rainSampler1				: register(s9);
sampler2D   rainSampler2 				: register(s10);
samplerCUBE g_CubeReflectSampler : register(s11);
struct a2vWater
{
	float4 Position : POSITION;
	float2 TexCoord : TEXCOORD0;
};

struct v2fWater
{
  float4 Position  : POSITION;   // in projection space
  float4 foamTC    : TEXCOORD0;  // foam coordinates
  float4 bumpTC     : TEXCOORD1;  // wz if next frequency wave x2
  float4 screenProj : TEXCOORD2; // refraction projection
  float4 envTC      : TEXCOORD3; // reflection projection

  float4 viewVec   : TEXCOORD4;
  float4 normalVec   : TEXCOORD5; // w unused
  
  float4 cFoamColor : COLOR0;

  float4 worldPos : TEXCOORD6;

  float4 fogColor : TEXCOORD7;
  
  //float2 testUV : TEXCOORD8;
};

struct v2fWater2
{
  float4 Position  : POSITION;   // in projection space
  float4 foamTC    : TEXCOORD0;  // foam coordinates
  float4 bumpTC     : TEXCOORD1;  // wz if next frequency wave x2
  float4 screenProj : TEXCOORD2; // refraction projection
  float4 envTC      : TEXCOORD3; // reflection projection

  float4 viewVec   : TEXCOORD4;
  float4 normalVec   : TEXCOORD5; // w unused
  
  float4 cFoamColor : COLOR0;

  float4 worldPos : TEXCOORD6;

  float4 fogColor : TEXCOORD7;
  //float2 testUV : TEXCOORD8;
#if ((PROFILE == 3) || defined(_SDR_3_0))
  float4 screenSpace : VPOS;
#endif 
};

float ComputeWaterMeshSpreadDistance()
{
	float fCameraHeight = g_vCameraPos.y;
	float height = abs(fCameraHeight - g_fWaterLevel);
	if(height < 10.f)
		return 90.f;
	else if(height < 20.f)
		return 200.f;
	else
		return 400.f;
}


// Get vertex from screen space into world spasace
float GetGridVertexPos( inout float4 vPos, float2 uv)
{

//ԭ���Ĵ���
/*		
	float atten = ( vPos.z );								//
															// simple lod - keep nearby detail until 200 meters after that project all vertices to horizon
    vPos.xy -= float2(0.2, 0.2);	//��΢���½�ƫ��һ��, ������ת���ܳ��׸�����Ұ��Χ��.
	
	vPos.z = vPos.y;				//����Y��Z
	
	//���ö���߶�
	vPos.y = g_fWaterLevel;
		
	float fLod0 = ComputeWaterMeshSpreadDistance();//90; 	//���˳�����120������				// *( 1 / min(g_fWaveAmount, 2.0 ));
	if(atten > 99 && g_bEnableArea < 0.5)
	{
		//vPos.y += 3;			//��Ե�Ķ����������?
		fLod0 = g_vNearFarDis.y * 4;	//���Ե��һ���������쵽��Զ�ĵط�
	}
	//����
	vPos.xz = vPos.xz * fLod0;
	
	//��ת
	float2 rotedPos;
	rotedPos.x = g_vOceanMeshRot.x * vPos.x + (-g_vOceanMeshRot.y) * vPos.z;
	rotedPos.y = g_vOceanMeshRot.y * vPos.x +  (g_vOceanMeshRot.x) * vPos.z;
	vPos.x = rotedPos.x;
	vPos.z = rotedPos.y;
	//vPos.xz = rotedPos.xy;
	
	//���������λ��ƫ��
	float2 cpos = g_vCameraPos.xz;
	cpos.xy -= frac(cpos.xy * 0.4) * 2.5;
	vPos.xz += cpos.xy; //g_vCameraPos.xz;
*/
	vPos.x *= g_vSmallWaterWidth.x;
	vPos.z = vPos.y;
	vPos.z *= g_vSmallWaterWidth.x;
	vPos.x += g_vCurrentSmallWaterStart.x;
	vPos.z += g_vCurrentSmallWaterStart.y;
	vPos.y = g_fWaterLevel;
	
	float fDisToCamera = length(vPos.xz - g_vCameraPos.xz);
	
	if(fDisToCamera > 0.95 * g_vSmallWaterWidth.z)
		vPos.xz = normalize(vPos.xz - g_vCameraPos.xz) * g_vNearFarDis.y + g_vCameraPos.xz;

/*
		(g_vSideNoNeighber.x > 0.5 && uv.y > 1.001) || 
		(g_vSideNoNeighber.y > 0.5 && uv.x > 1.001) ||
		(g_vSideNoNeighber.z > 0.5 && uv.y < -0.001) ||
		(g_vSideNoNeighber.w > 0.5 && uv.x < -0.001))
	{
		vPos.xz = normalize(vPos.xz - g_vCameraPos.xz) * g_vNearFarDis.y + g_vCameraPos.xz;
	}
*/
	
	//����Area�����任
	//float4 g_waterArea;   //xy: minXZ; zw: maxXZ
	vPos.x = max(vPos.x, g_waterArea.x);
	vPos.z = max(vPos.z, g_waterArea.y);
	vPos.x = min(vPos.x, g_waterArea.z);
	vPos.z = min(vPos.z, g_waterArea.w);
  
	return fDisToCamera;
}

float4 tex2Dlod_bilinear( in sampler2D s, in float2 t, in float2 textureSize, in float2 texelSize )
{
	float2 f = frac( t * textureSize );
	// TODO: take advantage of arbitrary swizzles for 2.x & 3.0
	float4 t00 = tex2Dlod( s,  float4(t, 0, 0) );
	
	float4 t10 = tex2Dlod( s, float4( t + float2( texelSize.x, 0 ), 0, 0) );
	float4 tA = lerp( t00, t10, f.x );

	float4 t01 = tex2Dlod( s, float4( t + float2( 0, texelSize.y ), 0, 0) );
	float4 t11 = tex2Dlod( s, float4( t + float2( texelSize.x, texelSize.y ), 0, 0) );
	float4 tB = lerp( t01, t11, f.x );

	return lerp( tA, tB, f.y );
}

// Get waves
void GetWave(inout float3 vPos, in float2 FlowDir, float2 uv, float fDisToCamera)
{  
	float3 vFakePos = vPos;
	float fDisScale = 1.f;
	/*
	if( (g_vSideNoNeighber.x > 0.01 && uv.y > 0.99) || 
		(g_vSideNoNeighber.y > 0.01 && uv.x > 0.99) ||
		(g_vSideNoNeighber.z > 0.01 && uv.y < 0.01) ||
		(g_vSideNoNeighber.w > 0.01 && uv.x < 0.01))
		*/
	fDisScale = lerp(1, 0, saturate((fDisToCamera - 0.7 * g_vSmallWaterWidth.z) / (0.25 * g_vSmallWaterWidth.z)));
	//if(fDisToCamera > 0.8 * g_vSmallWaterWidth.z)
	//{
	//	return;
	//}
	
#ifndef ENABLE_WAVE
	return;
#else	
#ifndef ENABLE_FFT
	
	{
		float fPhaseTest = length(vFakePos.xz);

		const float4 vFrequencies = 5* g_fWaveSpeed * float4(0.233, 0.455, 0.6135, -0.1467);
		const float4 vPhases = g_fWaveAmount * float4(0.1, 0.159, 0.557, 0.2199);
		const float4 vAmplitudes = g_fWaveSize * float4(1, 0.5, 0.25, 0.5); 
		
		float4 vWaveFreq = g_fTime * vFrequencies;                                   // 1 inst
		
		float4 vCosPhase = (fPhaseTest + vFakePos.x)* vPhases;                                    // 1 inst
		float4 vCosWave = cos( vWaveFreq * FlowDir.x + vCosPhase );                               // 8 inst
		
		float4 vSinPhase = (fPhaseTest + vFakePos.y)* vPhases;                                    // 1 inst
		float4 vSinWave = sin( vWaveFreq * FlowDir.y + vSinPhase );                               // 8 inst

		float fAnimSum = dot(vCosWave, vAmplitudes) + dot(vSinWave, vAmplitudes);                 // 3 inst

		const float fAnimAmplitudeScale = 1.0 / 5.0;
		vPos.y += fAnimSum * fAnimAmplitudeScale * fDisScale; 
		return;
	}

#else	
	{
		float4 v0 = tex2Dlod_bilinear( fftTexSampler, (vFakePos.xz) * 0.0125 * g_fWaveAmount * 1.25, 64, 1.0 / 64); //��ΪVS�в�����˫���Բ���
		float3 offset = v0.xyz * 0.06 * g_fWaveSize * float3(1.5,1.5,1); 
		vPos.xyz += offset.xzy * fDisScale;  //ת��YZ
	}
#endif
#endif

}

float3 ComputeSurfaceNormal( in float2 vFlowDir, in float3 vPosOrig, in float3 vPos, float fDisp, float2 uv, float fDisToCamera)
{
	float3 vNormal = float3(0,1,0);
#ifndef ENABLE_WAVE
	return vNormal;
#else	
	float3 vPos1 = vPosOrig.xyz + float3(1,0,0);
	float3 vPos1Orig = vPos1;
	GetWave( vPos1.xyz, vFlowDir, uv, fDisToCamera);  
	vPos1.xyz = lerp(vPosOrig.xyz, vPos1.xyz, fDisp);                                        // 2 alu
	vNormal.x = vPos.y - vPos1.y;

	vPos1 = vPosOrig.xyz + float3(0,0,1);
	vPos1Orig = vPos1;
	GetWave( vPos1.xyz, vFlowDir, uv, fDisToCamera);
	vPos1.xyz = lerp(vPosOrig.xyz, vPos1.xyz, fDisp);                                        // 2 alu
	vNormal.z = vPos.y - vPos1.y;

	return vNormal;
#endif	
}

float4 HPosToScreenTC(float4 HPos)
{
	float4 ScrTC = HPos;
	ScrTC.xy = (HPos.xy * float2(1,-1) + HPos.ww  ) * 0.5;
	ScrTC.xy += g_vScreenSize.zw * HPos.w;
	return ScrTC;
}

v2fWater vs(a2vWater IN)
{
	v2fWater OUT = (v2fWater)0;
	//OUT.testUV = IN.TexCoord;
	
	
	float4 vPos = IN.Position;   
	
	//��Ե���Ķ���λ�úͷ���ƫ����Ҫ˥��
	//z����˱�Ե˥��ֵ, Խ������Ե��ֵԽ��
	float bEdgeDispl = 0;//1 - saturate(saturate(vPos.z + 0.05) * 2 - 1.0); //��Եλ����
	
	float bDebug = vPos.z;
	
	//����
	float2 FlowDir = float2(g_fDirCos, g_fDirSin); //OceanParams1.yz;
	
	//����Ļ�ռ�ͶӰ������ռ�
	float fDisToCamera = GetGridVertexPos(vPos, IN.TexCoord); // 30 alu
	
	vPos.w = 1;
	float4 vPosOrig = vPos;

	//����FFT, �õ�����ռ��λ��
	GetWave( vPos.xyz, FlowDir, IN.TexCoord, fDisToCamera);
	
#ifdef ENABLE_FOG

	#if ((PROFILE == 3) || defined(_SDR_3_0))
		OUT.fogColor = float4(0,0,0,0);
	#else	
		OUT.fogColor = ComputeFog(vPos.xyz - g_vCameraPos.xyz, vPos.y, fogParamsP);
	#endif
#endif
	
	//���������ҲҪ˥��
	float fDistToCam = length(g_vCameraPos.xyz - vPos.xyz);
	float fNearbyCameraAtten = (saturate( fDistToCam * fDistToCam));
	vPos.xyz = lerp(vPosOrig.xyz, vPos.xyz, saturate(fNearbyCameraAtten * (1 - bEdgeDispl)));
	
	
	//���������������, ���������ǰ�߶��滻����߶�
	float4 vProjTex = mul(float4(vPos.x, g_fWaterLevelAtCamera, vPos.z, 1), g_mReflProj);			//g_fWaterLevelAtCamera:��������ĺ�ˮ�߶�
	OUT.envTC = vProjTex;
	
	//���㷨�߷���, ͨ������FFT����õ�
	OUT.normalVec.xyz = ComputeSurfaceNormal( FlowDir, vPosOrig.xyz, vPos.xyz, bEdgeDispl, IN.TexCoord, fDisToCamera); //�����Y��1
	OUT.normalVec.y += 0.1;
	
	//��ĭ��ɫ. Crysis��, ˮ��Խ��, ˮ��Խƽ,���ֵԽ��, PS������ĭҲԽ��
	OUT.cFoamColor.x = saturate(2 * (vPos.y - g_fWaterLevel)); //���޸ĺ�, ֻ���Ǹ߶�.�����˼�Ҳ����	
	
	float3 viewVec = g_vCameraPos.xyz - vPos.xyz;                                                // 1 alu
	OUT.viewVec.xyz =  viewVec.xyz;                                                       // 3 alu

	OUT.normalVec.w = 1;
	
	//ͶӰPos
	OUT.Position = mul(vPos, g_mViewProj);    
	
	// ����ԽԶ, ����Խ����, �����Ŷ�ԽС      Attenuate normal strength to make tesselation artefacts less visible     
	OUT.normalVec.xz *=  saturate(1- OUT.Position.w * /*0.0075 * 0.5*/ 0.01 +  0.15); // + saturate(0.25 / g_fWaveAmount));
	// �������   Scale texture coordinates to get mix of low/high frequency details    
	OUT.viewVec.w = OUT.Position.w * g_vNearFarDis.w; //g_vNearFarDis.w : 1 / zFar
	
	//ͶӰ����Ļ����, ������������
	OUT.screenProj.xyw = HPosToScreenTC( OUT.Position ).xyw;                                                  // 2 alu
	
	// ��������ռ�λ�ü�����������      dont touch this scales !
	float2 vTex = vPos.xz * 0.005;                                             // 1 alu
	
	//��͹��ͼ������ƫ��. ��ʱ������.  Output bump layers texture coordinates
	float2 vTranslation= FlowDir * ( g_fTime * g_fWindSpeed  *  0.0025);
	//���ֵ��� Output texture coordinates for water - don't touch texture scales! hand tweaked stuff
	OUT.bumpTC.xywz = vTex.xyxy * float4(4, 4, 2, 2) + vTranslation.xyxy * float4(1, 1, 2, 2);
	
	//�����ĭ����������.   Output texture coordinates for foam - don't touch texture scales! hand tweaked stuff
	float2 fAnimFoam = frac( g_fTime * g_fWaveSpeed * 0.01 * float2(0.2, 1) * 2);  //OceanParams0.z m_oceanWavesSpeed
	OUT.foamTC.xywz = vTex.xyxy * float4(58*0.2, 52*0.2, 38, 42)*3 + fAnimFoam.xxyy * float4(-1, -1, 1, 1);
	
	//���㾭�����˼����ƫ����, ����ĭ�����й�
	float fWaveDispAmount = abs(vPosOrig.y - vPos.y);
	OUT.cFoamColor.x += fWaveDispAmount; // float4(bDebug.xx, , 0);
	float t = saturate((fDistToCam - g_vSmallWaterWidth.y) / (g_vSmallWaterWidth.z - g_vSmallWaterWidth.y));
	OUT.cFoamColor.x = lerp(OUT.cFoamColor.x, 0, t);
	
	
	//PYP������
	//OUT.testTC = IN.TexCoord;
	OUT.worldPos = vPos;
	
	return OUT;
}


float3 FetchNormalMap(sampler2D bumpMap, float2 bumpTC)
{
  float3 bumpNormal = tex2D( bumpMap, bumpTC.xy ).xyz;
  bumpNormal.z = 1;
  return bumpNormal;
}

float3 BumpGen( in v2fWater2 IN  )	//����������z��bump
{
  float3 bumpNormal;
  float3 vVertexNormal = IN.normalVec.xyz;  
         
  float2 bumpColorC = FetchNormalMap(oceanBumpMapSampler, IN.bumpTC.xy*2).rg * 2 - float2(1,1);             
  float2 bumpColorD = FetchNormalMap(oceanBumpMapSampler, IN.bumpTC.wz*2).rg * 2 - float2(1,1);           
  
  float2 bumpHighFreq = (bumpColorC + bumpColorD);   

  bumpNormal = float3( /*bumpLowFreq.xy + */ bumpHighFreq.xy,1);

  bumpNormal.xy *= 0.2;	//����ƫ�Ƽ���
  bumpNormal.z = 1; 							//sqrt(1 - dot(bumpNormal.xy, bumpNormal.xy));
  
  bumpNormal.xyz += vVertexNormal.xzy; //����ԭ�з���
  
  //bumpNormal.xyz = vVertexNormal.xzy;
  
#ifdef ENABLE_RAIN
	if(true)
	{
		float2 rainNormal1 = tex2D(rainSampler1, IN.bumpTC.xy * 10).wy;		//�õ�dxt5��ʽѹ���ķ���ͼ
		float2 rainNormal2 = tex2D(rainSampler2, IN.bumpTC.xy * 10).wy;
		float2 rainNormal = lerp(rainNormal1, rainNormal2, g_fRainLerp);
		bumpNormal.xy += ( rainNormal * 2 - float2(1,1) ) * 4;
	}
	else
	{
		float2 rainNormal1 = FetchNormalMap(rainSampler1, IN.bumpTC.xy * 20).rg;
		float2 rainNormal2 = FetchNormalMap(rainSampler2, IN.bumpTC.xy * 20).rg;
		float2 rainNormal = lerp(rainNormal1, rainNormal2, g_fRainLerp);
		bumpNormal.xy += ( rainNormal * 2 - float2(1,1) ) * 1;
	}
	
#endif
  
  bumpNormal.xyz =  normalize( bumpNormal );	//��һ��
  return bumpNormal;
}

float GetFresnel(float NdotI, float power)
{
  float facing = (1.0 - NdotI);
  return saturate(pow(facing, power));
}

float3 CalcReflection(float3 N, float3 L)
{
	return 2.0f * dot(N, L) * N  - L;
}

struct psOutput
{
	float4		OutColor	: COLOR0;
#ifdef ENABLE_BLOOM	
	float4		BloomColor	: COLOR1;
#endif	
};

psOutput ps(v2fWater2 IN) : COLOR0
{	
	psOutput output;
	output.OutColor = float4(0,0,0,0);
#ifdef ENABLE_BLOOM		
	output.BloomColor = float4(0,0,0,0);
#endif	
	
	
	float fShadowOccl = 1; //1.0f - tex2Dproj(shadowOccludeMapSampler, IN.screenProj.xyzw).x;               
#if ((PROFILE == 3) || defined(_SDR_3_0))
	float2 screenUV = ( IN.screenSpace.xy) / g_vScreenSize.xy + g_vScreenSize.zw;
#else	
	float2 screenUV = ( IN.screenProj.xy / IN.screenProj.w );
#endif	

#if ((PROFILE == 3) || defined(_SDR_3_0))
	//��4�㷨��ͼ����NormalMap. Ҳ����ֻ������
	float3 vVertexNormal = IN.normalVec.xyz;  
	float3 bumpNormal = BumpGen( IN ); //���صķ���������z, ��Ҫ��y����

	float3 vFinalNormal = ( vVertexNormal.xyz + float3(bumpNormal.x, 0, bumpNormal.y) );
#else
	float2 bumpV = (tex2D(oceanBumpMapSampler, IN.bumpTC.xy).rg * 4 - float2(1,1)) * 0.1;
	float3 bumpNormal = normalize(float3(bumpV.x, bumpV.y, 1));
	float3 vFinalNormal = ( IN.normalVec.xyz + float3(bumpNormal.x, 0, bumpNormal.y) );
#endif
 
	//��ȡˮ�������
    float3 viewVec = normalize(IN.viewVec.xyz);  	
 	float sceneDepth = tex2D(sceneDepthSampler, screenUV).r * g_vNearFarDis.y; //DecodeSceneDepth( sceneDepthSampler, IN.screenProj );
 	float waterDepth = IN.screenProj.w;
	
 	float depth = (sceneDepth - waterDepth ); //ˮ�������; 	
	
	//���ཻ. Խ��������ֵԽ��
#if ((PROFILE == 3) || defined(_SDR_3_0))
 	float softIntersect = saturate( g_fSoftIntersectionFactor * depth);
	softIntersect *= softIntersect;
#else
	float softIntersect = 1.f;
#endif	
	
    //����NdotI, �Լ�Fresnel��     
	float NdotI = (dot( viewVec.xyz, vFinalNormal.xyz ) );    // need detail textures rendering for underwater reflection
	NdotI = abs( NdotI ) ;
	float fFresnel= GetFresnel( NdotI /*, 0 */, 5) * g_fFresnelScale;
  	
	//�����ڲ�������. �ӵ���ˮ������Ϊ1; ��ˮ������Ϊ0
	float fInsideReflection = saturate(-viewVec.y * 1000);	//y>0�����0, yС��0�����1
	
	//���㷴����ɫ
	//return tex2D(envMapSamplerRefl, screenUV);
	//return float4(1,0,0,1);
	
	float2 reflNewst = screenUV + bumpNormal.xy * 0.16;	//���ݷ���ƫ��һ��
	
	float4 reflectColor = tex2D(envMapSamplerRefl, reflNewst);

/*	
	output.OutColor = reflectColor;
#ifdef ENABLE_BLOOM		
	output.BloomColor = float4(0,0,0,0);
#endif 
	return output;
*/
	
	if(g_bCubeRefl > 0.5)
		reflectColor = texCUBE(g_CubeReflectSampler, CalcReflection(vFinalNormal, viewVec));
		
	float2 refrNewst =  screenUV;//������������,δƫ��
		
	//���������������
	float2 refrTC = bumpNormal.xy * (0.1 + 0.1 * fInsideReflection) * saturate(softIntersect * 4); //���ݷ�����ƫ��, ˮ��ʱ������ƫ��, Խ��������ƫ��Խ��
  
	//ȡ������ɫ, ����rgb����, ����ͬ��ƫ��
	const float fRefrMaskBias = 0.0001;
	IN.viewVec.w += fRefrMaskBias;	//��ˮ��������ȼ���һ��Bias
		
#ifdef ENABLE_HIGH_REFRA		
		const float rScale = 1.15;	//1.15;
		const float gScale = 1.0;
		const float bScale = 0.85;   //0.85;
		
   	    float3 depthRefr = tex2D( sceneDepthSampler, refrNewst + refrTC.xy * rScale ).xyz;
 	    depthRefr.y =      tex2D( sceneDepthSampler, refrNewst + refrTC.xy * gScale ).x;
 	    depthRefr.z =      tex2D( sceneDepthSampler, refrNewst + refrTC.xy * bScale ).x;
   	   	  
 	    float3 fRefractionMask =  (IN.viewVec.www < depthRefr.xyz );	//���ˮ��������ȴ��ڳ������, ����������ĵ���ˮ����,�����Թ�.
 	    refrTC *= fRefractionMask.x * fRefractionMask.y * fRefractionMask.z; 	
  
		float3 refractColor = 0; 
 
		refractColor.x = tex2D(envMapSamplerRefr, refrNewst + refrTC * rScale ).x;
		refractColor.y = tex2D(envMapSamplerRefr, refrNewst + refrTC * gScale ).y;
		refractColor.z = tex2D(envMapSamplerRefr, refrNewst + refrTC * bScale ).z;
#else
  	    float3 depthRefr = tex2D( sceneDepthSampler, refrNewst + refrTC.xy).rrr;
 	    float fRefractionMask =  (IN.viewVec.w < depthRefr.y );	//���ˮ��������ȴ��ڳ������, ����������ĵ���ˮ����,�����Թ�.
 	    refrTC *= fRefractionMask; 	
  
		float3 refractColor = 0; 
 
		refractColor.xyz = tex2D(envMapSamplerRefr, refrNewst + refrTC ).xyz;
#endif 
	//return float4(refractColor.xyz, 1);

	
	float sceneDepthAfterRefr = depthRefr.y * g_vNearFarDis.y; 
	float depthAfterRefr = (sceneDepthAfterRefr - waterDepth ); //�����ˮ�������; 	

  //ȡ��ɢ��ɫ
#ifdef ENABLE_CAUSTIC
  {
  		//return float4( tex2D(_causticRTSampler, refrNewst).rgb /*+ refractColor.xyz*/, 1);
		float4 cCaustic = tex2D(_causticRTSampler, refrNewst + refrTC);
		float fCausticIllum = 0;
		float vertDepth = depthAfterRefr * abs(dot(float3(0,1,0), viewVec));
		float4 g_fCausticLerpDis = float4(0.5, 2, 3, 6);
		fCausticIllum = GetCausticIllum(g_fCausticLerpDis, vertDepth); // ������ȵ��뵭����ɢ��ɫ
		cCaustic.xyz *= fCausticIllum;
		
		refractColor.xyz += cCaustic.xyz;	//���Ͻ�ɢ��ɫ ��ʱ����ӽ���
		//return float4(cCaustic.xyz, 1);
  }
#endif 
		
	float wl = depth;
	
	if(depthAfterRefr < 0)
		;
	else
		wl = depthAfterRefr;
		
	float4 cWaterFog = GetWaterVolumetricFogColor(wl, g_fFogDensity, g_fWaterFogScaleExp, g_waterFogColor);

	refractColor.xyz = lerp( cWaterFog.xyz, refractColor.xyz, cWaterFog.w );
  
	float3 cFoamFinal = float3(0,0,0);
	
	//��������
	float fGloss = tex2D(waterGlossMapSampler, IN.bumpTC.wz + vFinalNormal.xz * 0.1).x; //����Gloss����, ���ݷ�����ƫ��
	fGloss = fGloss * fGloss * 2;
	
#if ((PROFILE == 3) || defined(_SDR_3_0))
	//���ݹ�������������ϵ��
	float fFresnelGloss = (fGloss * 0.5 + 0.5);
	fFresnel = saturate( fFresnel * g_fReflectionAmount * fFresnelGloss);   //GlossԽ��, ������Խ��,  ������ɫԽ������ɫƫ��
#endif

	//����Fresnel�ϲ�����ͷ�����ɫ
	float3 final= lerp(refractColor, reflectColor.xyz, saturate(fFresnel + saturate(1 - NdotI * 2) * fInsideReflection)); //����ӵ���ˮ��,����Ҫ����ƫ���ڷ���

	float4 bloomColor = float4(0,0,0,1);

#if ((PROFILE == 3) || defined(_SDR_3_0))
	{
		//������ĭ��ɫ, ������ĭ
		float fFoam = saturate(tex2D(foamSampler, IN.foamTC.xy - vFinalNormal.xz * 0.1).y); //������ĭ��������,���ݷ�����ƫ��. ����Foam����, ƫ�ƽ���
		fFoam += tex2D(foamSampler, IN.foamTC.wz  + vFinalNormal.xz * 0.4).y * 1.2;  		//����Foam����, ƫ�ƽ϶�   //�ҵ��㷨,������
	
		float fFoamLuminance = saturate( fFoam - 0.85 ); //��ĭ����
  
		//���ߵ���ĭ
		float3 cFoamEdge = float3(0,0,0);
		if(g_bEdgeFoam > 0.5f)
		{
			float foamSoftIntersect = saturate( depth * 0.1 / saturate(fFoamLuminance) );  //Խ��������ԽС
			float foam = smoothstep(0.4, 0.8, 1 - foamSoftIntersect ) * 0.5 * g_fEdgeFoamAmount; // * softIntersect;  //��SoftIntersect�밶����ĭ�޹�
			cFoamEdge = foam * 0.6;
		}
		//return float4(cFoamEdge, 1);
		
		//�����е���ĭ
		float fCrestFoam = 0;
		if(g_bWaveFoam > 0.5f)
		{
			fCrestFoam = 0.5 * (fFoamLuminance * fGloss * IN.cFoamColor.x);   //��ĭ����Gloss������Ӷ�����.
		}
		
		//���˵�Gloss
		float3 cWavesGloss = float3(0,0,0);
		if(g_bWaveGloss > 0.5)
		{		
			cWavesGloss = fGloss * 0.1;
			cWavesGloss *= g_fWhiteCapsAmount;     
		}
		
		cFoamFinal = saturate( (cFoamEdge * fFoamLuminance + fCrestFoam)  + cWavesGloss);

		// Add foam
		cFoamFinal =  (g_PS_SkyColor.xyz + g_PS_SunColor.xyz )  * cFoamFinal; // 2 alu
		
		final += cFoamFinal;	
	}	

    //SunShine
	{
		float3 vSunLightDirReverse = g_PS_SunLightDir;
		//vSunLightDirReverse.z = -vSunLightDirReverse.z;
		float3 bumpNormalY = normalize(float3(bumpNormal.x, bumpNormal.z, bumpNormal.y));
		
		float fNDotUp = saturate(vSunLightDirReverse.y);
		bumpNormalY.y *= lerp(1, 0.15, fNDotUp);					//��̫���ܸߵ�ʱ����normal�Ŷ�������
		bumpNormalY = normalize(bumpNormalY);
	
		float3 mirrorEye = ( 2 * dot( viewVec, bumpNormalY) * bumpNormalY - viewVec );
		float dotSpec =  saturate(dot( mirrorEye.xyz, vSunLightDirReverse ) * 0.5 + 0.5);

		float3 vSunGlow = float3(0,0,0);
	
		float powDot = pow(dotSpec, 400);
		vSunGlow = fFresnel * powDot * fGloss * g_PS_SunColor.xyz * pow(10, fNDotUp * 1 + 1);			//��̫���ܸߵ�ʱ���ø߹�ǿ�ȱ�úܴ�

		vSunGlow += fGloss * vSunGlow;
		
		bloomColor.xyz = vSunGlow.xyz * fShadowOccl * g_fSunMultiplier;
		
		final.xyz += bloomColor.xyz;
	}
#endif	

	final.xyz = lerp( refractColor, final.xyz, softIntersect * saturate(IN.screenProj.w));	


#ifdef ENABLE_FOG
	#if ((PROFILE == 3) || defined(_SDR_3_0))
		float4 fogColor = ComputeFog(IN.worldPos.xyz - g_vCameraPos.xyz, IN.worldPos.y, fogParamsP);
	#else
		float4 fogColor = IN.fogColor;
	#endif	
	//���������ʱ���Ѿ�������ˣ���������Ļ�����������Ĳ��������ˡ�
	float fDistance = length(IN.worldPos.xyz - g_vCameraPos.xyz);
	float fFogScale = smoothstep(100, 200, fDistance);
	final.xyz = lerp( fogColor.xyz, final.xyz, max(fogColor.w, 1.f - fFogScale));
#endif

  float fA =  1;
  float4 Color = max( float4(final.xyz, fA), 0);
  
  	output.OutColor = Color;
	
#ifdef ENABLE_BLOOM		
	output.BloomColor = bloomColor;//float4(0,0,0,0);//
#endif 
  
  return output;
  
 
}


