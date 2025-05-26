/*
 * FILE: EL_BufRegion.h
 *
 * DESCRIPTION: 
 *
 * CREATED BY: QingFeng Xin, 2008/11/18
 *
 * HISTORY: 
 *
 * Copyright (c) 2005 Archosaur Studio, All Rights Reserved.
 */

#ifndef _EL_BUF_REGION_H_
#define _EL_BUF_REGION_H_

#include "vector.h"
#include <stdio.h>

///////////////////////////////////////////////////////////////////////////
//	
//	Define and Macro
//	
///////////////////////////////////////////////////////////////////////////

#define ELBUFREGION_VERSION		4

///////////////////////////////////////////////////////////////////////////
//	
//	Types and Global variables
//	
///////////////////////////////////////////////////////////////////////////

#pragma pack(1)


struct BUFREGIONHEADER
{
	unsigned int	dwVersion;	
	int				iNumRegion;
	unsigned int	dwTimeStamp;
};

#pragma pack()


///////////////////////////////////////////////////////////////////////////
//	
//	Declare of Global functions
//	
///////////////////////////////////////////////////////////////////////////


class CELBufRegion
{
public:		//	Types

#pragma pack(1)
	
	struct VECTOR2
	{
		float x, z;
	};


	struct BUFREGIONDATA_VERSION1
	{
		int     nID;					//Buf�����ȫ��ID
		int		nType;
		float	fLen;
		float	fWidth;
		float	fRadius;
		float	fHeightLowerLimit;		//�߶����ޡ�����������ĵ���߶�
		float	fHeightUpperLimit;		//�߶����ޡ�����������Ķ���߶�
		bool	bPlayerValid;			//�������Ƿ�������Ч��
		bool	bPetValid;				//�������Ƿ�Գ�����Ч��
		bool	bDiedRegion;			//�������Ƿ�������
		int		nSkill_Enter;			//��������ʱ���Խ������ͷŵļ���ID
		int		nSkillLevel_Enter;		//��������ʱ���Խ������ͷŵļ��ܵȼ�
		
		int		nSkill_Leave;			//�뿪����ʱ�����뿪���ͷŵļ���ID
		int		nSkillLevel_Leave;		//�뿪����ʱ�����뿪���ͷŵļ��ܵȼ�
		
		int		nMaxCharacterNum;		//��������������װ�ظ���
		
		VECTOR2 vPos;					//ֻ���ı��κ�Բ����
	};


	struct BUFREGIONDATA_VERSION2
	{
		int     nID;					//Buf�����ȫ��ID
		int		nType;
		float	fLen;
		float	fWidth;
		float	fRadius;
		float	fHeightLowerLimit;		//�߶����ޡ�����������ĵ���߶�
		float	fHeightUpperLimit;		//�߶����ޡ�����������Ķ���߶�
		bool	bPlayerValid;			//�������Ƿ�������Ч��
		bool	bPetValid;				//�������Ƿ�Գ�����Ч��
		bool	bDiedRegion;			//�������Ƿ�������
		int		nSkill_Enter;			//��������ʱ���Խ������ͷŵļ���ID
		int		nSkillLevel_Enter;		//��������ʱ���Խ������ͷŵļ��ܵȼ�
		
		int		nSkill_Leave;			//�뿪����ʱ�����뿪���ͷŵļ���ID
		int		nSkillLevel_Leave;		//�뿪����ʱ�����뿪���ͷŵļ��ܵȼ�
		
		int		nMaxCharacterNum;		//��������������װ�ظ���
		
		VECTOR2 vPos;					//ֻ���ı��κ�Բ����
		
		bool bNoRepeat;					//�ظ������߲����������¼�
		int  nTask_Enter;				//��������ʱ��ֱ�Ӹ��ӵ���ɫ���ϵ�����ID
		int  nTask_Leave;				//�뿪����ʱ��ֱ�Ӹ��ӵ���ɫ���ϵ�����ID	
	};

    struct BUFREGIONDATA_VERSION3
    {
        int     nID;					//Buf�����ȫ��ID
        int		nType;
        float	fLen;
        float	fWidth;
        float	fRadius;
        float	fHeightLowerLimit;		//�߶����ޡ�����������ĵ���߶�
        float	fHeightUpperLimit;		//�߶����ޡ�����������Ķ���߶�
        bool	bPlayerValid;			//�������Ƿ�������Ч��
        bool	bPetValid;				//�������Ƿ�Գ�����Ч��
        
        bool	bDiedRegion;			//�������Ƿ�������
        int		nSkill_Enter;			//��������ʱ���Խ������ͷŵļ���ID
        int		nSkillLevel_Enter;		//��������ʱ���Խ������ͷŵļ��ܵȼ�
        
        int		nSkill_Leave;			//�뿪����ʱ�����뿪���ͷŵļ���ID
        int		nSkillLevel_Leave;		//�뿪����ʱ�����뿪���ͷŵļ��ܵȼ�
        int		nMaxCharacterNum;		//��������������װ�ظ���
        
        VECTOR2 vPos;					//ֻ���ı��κ�Բ����
        
        bool bNoRepeat;					//�ظ������߲����������¼�
        int  nTask_Enter;				//��������ʱ��ֱ�Ӹ��ӵ���ɫ���ϵ�����ID
        int  nTask_Leave;				//�뿪����ʱ��ֱ�Ӹ��ӵ���ɫ���ϵ�����ID
        bool bMonsterBornValid;		    //�������Ƿ�Թ���NPC�ĳ�����Ч��
	};

	struct BUFREGIONDATA
	{
		int     nID;					//Buf�����ȫ��ID
		int		nType;
		float	fLen;
		float	fWidth;
		float	fRadius;
		float	fHeightLowerLimit;		//�߶����ޡ�����������ĵ���߶�
		float	fHeightUpperLimit;		//�߶����ޡ�����������Ķ���߶�
		bool	bPlayerValid;			//�������Ƿ�������Ч��
		bool	bPetValid;				//�������Ƿ�Գ�����Ч��
		
		bool	bDiedRegion;			//�������Ƿ�������
		int		nSkill_Enter;			//��������ʱ���Խ������ͷŵļ���ID
		int		nSkillLevel_Enter;		//��������ʱ���Խ������ͷŵļ��ܵȼ�
		
		int		nSkill_Leave;			//�뿪����ʱ�����뿪���ͷŵļ���ID
		int		nSkillLevel_Leave;		//�뿪����ʱ�����뿪���ͷŵļ��ܵȼ�
		int		nMaxCharacterNum;		//��������������װ�ظ���
		
		VECTOR2 vPos;					//ֻ���ı��κ�Բ����
		
		bool bNoRepeat;					//�ظ������߲����������¼�
		int  nTask_Enter;				//��������ʱ��ֱ�Ӹ��ӵ���ɫ���ϵ�����ID
		int  nTask_Leave;				//�뿪����ʱ��ֱ�Ӹ��ӵ���ɫ���ϵ�����ID
		bool bMonsterBornValid;		    //�������Ƿ�Թ���NPC�ĳ�����Ч��
        bool bInitValid;		        //�������Ƿ��ʼ��Ч��
	};
#pragma pack()

	enum
	{
		BUF_REGION_RECT = 0,
		BUF_REGION_CIRCLE,
		BUF_REGION_POLYGON,
	};



public:		//	Constructor and Destructor

	CELBufRegion();
	CELBufRegion(abase::vector<VECTOR2>& apoints);
	virtual ~CELBufRegion();

public:		//	Attributes

public:		//	Operations
	bool IsPointIn(float x, float z);
	//	Load data from file
	bool Load(FILE* fp, int iVersion);
	//  Get buffer region property
	inline BUFREGIONDATA& GetProperty(){ return m_BufRGNData; }
	// Get boundary box
	inline void GetRect(float &left, float &top, float &right, float &bottom)
	{
		left = m_fLeft;
		top = m_fTop;
		right = m_fRight;
		bottom = m_fBottom;
	};
	int GetID() const { return m_BufRGNData.nID; }
	abase::vector<VECTOR2>* GetPoints(){ return &m_aPoints; }


protected:
	void BuildBoundBox();
	bool IsCrossLine(float x, float z, int iIndex);

protected:	//	Attributes
	abase::vector<VECTOR2>	m_aPoints;	//	Precinct points

	float m_fLeft;
	float m_fRight;
	float m_fTop;
	float m_fBottom;

	BUFREGIONDATA m_BufRGNData;
};


class CELBufRegionSet
{
public:		//	Types

public:		//	Constructor and Destructor

	CELBufRegionSet();
	virtual ~CELBufRegionSet();

public:		//	Attributes

public:		//	Operations

	//	Load data from file
	bool Load(const char* szFileName);

	//	Get the precinct specified position is in
	CELBufRegion* IsPointIn(float x, float z, int idSrcInst);

	//	Get time stamp
	unsigned int GetTimeStamp() { return m_dwTimeStamp; }
	//	Get precinct number
	int GetBufRegionNum() { return m_aBufRegions.size(); }
	//	Get precinct
	CELBufRegion* GetBufRegion(int n) { return m_aBufRegions[n]; } 

protected:	//	Attributes

	unsigned int	m_dwTimeStamp;		//	Time stamp of precinct data

	abase::vector<CELBufRegion*>	m_aBufRegions;	//	Precinct array

protected:	//	Operations

};

///////////////////////////////////////////////////////////////////////////
//	
//	Inline functions
//	
///////////////////////////////////////////////////////////////////////////

#endif
