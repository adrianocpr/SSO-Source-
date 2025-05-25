/*
 * FILE: A3DSSAO.h
 *
 * DESCRIPTION: ��ȾSSAO
 *
 * CREATED BY: Panyupin, 2012/5/21
 *
 * HISTORY: 
 *
 * Copyright (c) 2012 Archosaur Studio, All Rights Reserved.
 */
#ifndef _A3DSSAO_H_
#define _A3DSSAO_H_
#include "A3DVertexShader.h"
#include "A3DMatrix.h"

class A3DDevice;
class A3DPixelShader;
class A3DVertexShader;
class A3DViewport;
class A3DRenderTarget;
class A3DTexture;
class A3DHLSL;

class A3DSSAO
{
public:
	A3DSSAO();
	bool Init(A3DDevice * pDevice);
	void Release();

	bool Render(A3DViewport * pViewPort, A3DRenderTarget* pInputRT);
	
	float	GetRadius() const;					//AO�뾶 0~2
	void	SetRaidus(float fRadius);
	float	GetContrast() const;				//AO�Աȶ� 0~6
	void	SetContrast(float fContrast);
	float	GetDarkest() const;					//AO������� 0~1
	void	SetDarkest(float fDarkest);

	~A3DSSAO(){}
private:
	void ReloadAo2Shader();

	A3DDevice * m_pDevice;

	A3DHLSL* m_pAo2CommonVS;		//ͨ�õĺ���VertexShader
	A3DHLSL* m_pAo2SSAOVS;			//SSAO pass�õ�VertexShader
	A3DHLSL* m_pAo2DownSampPS;		//��������ȵ�PixelShader
	A3DHLSL* m_pAo2Cry3PS;			//CryEngine3��SSAO�㷨
	A3DHLSL* m_pAo2LinearDepthPS;	//�����������ת��Ϊ���Ե�(ͬʱҲ������˷���).
	
	A3DHLSL* m_pAo2BlurSmallXPS;		//��һ���С��SSAO�������Blur;
	A3DHLSL* m_pAo2BlurSmallYPS;		//��һ���С��SSAO�������Blur;
	A3DHLSL* m_pAo2BlurNew;

	A3DRenderTarget* m_pLinearDepthRT;				//�洢������ȵ�RT
	A3DRenderTarget* m_pSmallGBufferRT;				//��Сһ������RT
	A3DRenderTarget* m_pSmallGBufferRTLast;			//��һ֡�����RT
	A3DRenderTarget* m_pSSAORT;						//�洢SSAO����ĵ�RT(һ���С)
	A3DRenderTarget* m_pSSAORTLast;					//��һ֡��SSAO���
	A3DRenderTarget* m_pInputFrameBuffer;			//�洢����ssaoʱ��֡����

	A3DMATRIX4		m_matViewProjLastTM;
	A3DVertexDeclCommon* m_pVertDecl;
	A3DTexture* m_pD3DRandom4x4Texture;//�������

	float m_fRadius;
	float m_fContrast;
	float m_fDarkest;
};

#endif