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
		int     nID;					//Buf区域的全局ID
		int		nType;
		float	fLen;
		float	fWidth;
		float	fRadius;
		float	fHeightLowerLimit;		//高度下限。是作用区域的底面高度
		float	fHeightUpperLimit;		//高度上限。是作用区域的顶面高度
		bool	bPlayerValid;			//该区域是否对玩家生效。
		bool	bPetValid;				//该区域是否对宠物生效。
		bool	bDiedRegion;			//该区域是否考虑死亡
		int		nSkill_Enter;			//进入区域时，对进入者释放的技能ID
		int		nSkillLevel_Enter;		//进入区域时，对进入者释放的技能等级
		
		int		nSkill_Leave;			//离开区域时，对离开者释放的技能ID
		int		nSkillLevel_Leave;		//离开区域时，对离开者释放的技能等级
		
		int		nMaxCharacterNum;		//该区域的最大允许装载个数
		
		VECTOR2 vPos;					//只对四边形和圆有用
	};


	struct BUFREGIONDATA_VERSION2
	{
		int     nID;					//Buf区域的全局ID
		int		nType;
		float	fLen;
		float	fWidth;
		float	fRadius;
		float	fHeightLowerLimit;		//高度下限。是作用区域的底面高度
		float	fHeightUpperLimit;		//高度上限。是作用区域的顶面高度
		bool	bPlayerValid;			//该区域是否对玩家生效。
		bool	bPetValid;				//该区域是否对宠物生效。
		bool	bDiedRegion;			//该区域是否考虑死亡
		int		nSkill_Enter;			//进入区域时，对进入者释放的技能ID
		int		nSkillLevel_Enter;		//进入区域时，对进入者释放的技能等级
		
		int		nSkill_Leave;			//离开区域时，对离开者释放的技能ID
		int		nSkillLevel_Leave;		//离开区域时，对离开者释放的技能等级
		
		int		nMaxCharacterNum;		//该区域的最大允许装载个数
		
		VECTOR2 vPos;					//只对四边形和圆有用
		
		bool bNoRepeat;					//重复进入者不触发进入事件
		int  nTask_Enter;				//进入区域时，直接附加到角色身上的任务ID
		int  nTask_Leave;				//离开区域时，直接附加到角色身上的任务ID	
	};

    struct BUFREGIONDATA_VERSION3
    {
        int     nID;					//Buf区域的全局ID
        int		nType;
        float	fLen;
        float	fWidth;
        float	fRadius;
        float	fHeightLowerLimit;		//高度下限。是作用区域的底面高度
        float	fHeightUpperLimit;		//高度上限。是作用区域的顶面高度
        bool	bPlayerValid;			//该区域是否对玩家生效。
        bool	bPetValid;				//该区域是否对宠物生效。
        
        bool	bDiedRegion;			//该区域是否考虑死亡
        int		nSkill_Enter;			//进入区域时，对进入者释放的技能ID
        int		nSkillLevel_Enter;		//进入区域时，对进入者释放的技能等级
        
        int		nSkill_Leave;			//离开区域时，对离开者释放的技能ID
        int		nSkillLevel_Leave;		//离开区域时，对离开者释放的技能等级
        int		nMaxCharacterNum;		//该区域的最大允许装载个数
        
        VECTOR2 vPos;					//只对四边形和圆有用
        
        bool bNoRepeat;					//重复进入者不触发进入事件
        int  nTask_Enter;				//进入区域时，直接附加到角色身上的任务ID
        int  nTask_Leave;				//离开区域时，直接附加到角色身上的任务ID
        bool bMonsterBornValid;		    //该区域是否对怪物NPC的出生生效。
	};

	struct BUFREGIONDATA
	{
		int     nID;					//Buf区域的全局ID
		int		nType;
		float	fLen;
		float	fWidth;
		float	fRadius;
		float	fHeightLowerLimit;		//高度下限。是作用区域的底面高度
		float	fHeightUpperLimit;		//高度上限。是作用区域的顶面高度
		bool	bPlayerValid;			//该区域是否对玩家生效。
		bool	bPetValid;				//该区域是否对宠物生效。
		
		bool	bDiedRegion;			//该区域是否考虑死亡
		int		nSkill_Enter;			//进入区域时，对进入者释放的技能ID
		int		nSkillLevel_Enter;		//进入区域时，对进入者释放的技能等级
		
		int		nSkill_Leave;			//离开区域时，对离开者释放的技能ID
		int		nSkillLevel_Leave;		//离开区域时，对离开者释放的技能等级
		int		nMaxCharacterNum;		//该区域的最大允许装载个数
		
		VECTOR2 vPos;					//只对四边形和圆有用
		
		bool bNoRepeat;					//重复进入者不触发进入事件
		int  nTask_Enter;				//进入区域时，直接附加到角色身上的任务ID
		int  nTask_Leave;				//离开区域时，直接附加到角色身上的任务ID
		bool bMonsterBornValid;		    //该区域是否对怪物NPC的出生生效。
        bool bInitValid;		        //该区域是否初始生效。
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
