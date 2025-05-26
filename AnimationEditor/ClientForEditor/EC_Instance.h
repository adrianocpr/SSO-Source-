/********************************************************************
	created:	2009/9/14
	author:		liudong
	
	purpose:   instance,precinct信息.
	Copyright (C) All Rights Reserved
*********************************************************************/

#pragma once

#include <AString.h>
#include <AAssist.h>
#include <A3DTypes.h>
#include <vector.h>
#include <ARect.h>
#include <hashmap.h>

class CScriptValue;
struct WORLD_TELEPORT_POINT_CONFIG;


#define MAP_IMAGE_WIDTH   1024
#define MAP_IMAGE_HEIGHT  1024
#define MAX_ZONE_VERT     2000
#define MAX_ZONE_INDEX	  5000
#define INSTANCE_INVALID  -1
#define PRECINCT_INVALID  -1
#define UP_TO_WORLDMAP	  -2
#define AREA_INVALID	  -1
#define AUTOMOVE_POINTDEC 8
#define MAPBUTTON_ID(InstId, PrecinctId)  ( ((InstId) << 16) | ((PrecinctId) & 0xFFFF) )



// 地图等级
typedef	enum				
{
	MAP_INVALID,            // 无效
	MAP_WORLD,				// 世界地图
	MAP_MIDDLE,		        // 省级地图
	MAP_PRECINCT,			// 管辖区域地图
}MapLevel;

typedef struct _MAPMARK
{
	ACString   strHint;
	A3DVECTOR3 vecPos;
	A3DRECT    rect;
} MAPMARK, * P_MAPMARK;	

struct MAPTLVERTEX
{
	FLOAT x, y, z, rhw;
	DWORD diffuse;
	DWORD specular;
	FLOAT tu, tv, tu2, tv2;
};

struct RadarPoint
{
	int		type;
	APointF pos;
	AString strImage;
};


enum
{
	MAPMARK_PLAYER = 0,
	MAPMARK_MONSTER,
	MAPMARK_MONSTERBOSS,
	MAPMARK_MONSTERTASK,
	MAPMARK_GUILD,
	MAPMARK_FAMILY,
	MAPMARK_FRIEND,
	MAPMARK_NPC,
	MAPMARK_NPCACCEPTTASK,
	MAPMARK_NPCFINISHTASK,
	MAPMARK_TEAMMATE0,
	MAPMARK_TEAMMATE1,
	MAPMARK_TEAMMATE2,
	MAPMARK_TEAMMATE3,
	MAPMARK_TEAMMATE4,
	MAPMARK_TEAMMATE5,
	MAPMARK_TEAMMATE6,
	MAPMARK_TEAMMATE7,
	MAPMARK_CAPTAIN,
	MAPMARK_ENEMY,
	MAPMARK_HOST,
	MAPMARK_ENEMYGUILD,
	MAPMARK_TAG0,
	MAPMARK_TAG1,
	MAPMARK_TAG2,
	MAPMARK_TAG3,
	MAPMARK_TAG4,
	MAPMARK_AUTOMOVE,
	MAPMARK_TAGCLICK,
	MAPMARK_TARGET,
	MAPMARK_BUILDINGA,
	MAPMARK_BUILDINGB,
	MAPMARK_TRANSPORT,	// 传送点
	MAPMARK_MINE,  // 矿点
	MAPMARK_DRUG,
	MAPMARK_LOCK,
	MAPMARK_FISHING,
	MAPMARK_NUM
};

enum
{
	TIME_DAY = 0,
	TIME_MORNING,
	TIME_DUSK,
	TIME_NIGHT
};




class CECInstance
{
// types
public:
	// 地图上的标记点
	struct sMarkInfo
	{
		APointF  pos;
		AWString desc;
		AString  strImage;
	};
	typedef abase::vector<sMarkInfo> MARKINFO_LIST;

	// 地图传送点列表
	typedef abase::vector<const struct WORLD_TELEPORT_POINT_CONFIG*> TELEPORT_LIST;

	enum
	{
		INST_TYPE_WORLD = 0,	//大世界		
		INST_TYPE_BATTLE,		//战场
		INST_TYPE_DYNAMIC,		//副本
		INST_TYPE_UNDER,		//地宫
		INST_TYPE_ACTIVE,		//活动
		INST_TYPE_NUM,
	};

	// 管辖区域信息
	struct sPrecinctExtraInfo
	{
		int				id;						// 管辖区域Id
		int				upPrecinctId;			// 上一级管辖区域
		bool			bPrecinctMap;			// 管辖是否要使用专属地图(一般使用场景地图)		
		ARectF			rectMap;				// map在instance中覆盖的区域,当鼠标点击map时，用来计算对应世界中的位置。
		ARectF			validRegion;			// 场景地图有效的区域,无效部分可能用于装饰背景
		AString			strMidMap;				// 管辖区域地图
		AWString		strMiniMap;				// 雷达图
		AString			strLoadingImage;		// 切换场景Loading图
		AWString		strSelRoleGFX;			// 选择人物特效(很奇怪的一个需求)
		MARKINFO_LIST	vecMarks;				// 标签列表
		TELEPORT_LIST   vecTeleport;			// 传送点列表

		void Clear(){ vecMarks.clear(); }
		bool IsValid() const {return (strMidMap.GetLength()>0); } 
	};
	typedef class abase::vector<int> VEC_PRECINCT;


	// 场景信息
	struct sInstanceInfo
	{
		int			id;			    // 场景Id
		int			idZone;		    // 未知功能,好像和公会基地功能有关
		AWString	strName;	    // 场景名称
		AString		strPath;	    // 场景文件路径
		AString		strDetailTex;   // 场景贴图		
		int			iRowNum;		// Number of map row
		int			iColNum;		// Number of map column
		A3DCOLOR	colorWater;	    // color of water surface in this map
		bool		bUnderWater;	// current scene is under water
		bool		bHasMapCloud;	// If this instance have map cloud
		float		fOriginX;       // 场景原点在世界坐标系未知, x轴
		float		fOriginZ;       // 场景原点在世界坐标系未知, z轴
		int			iInstType;      // 场景类型

		AWString		strMiniMap;			// 雷达图
		AWString		strSelRoleGFX;		// 选择人物特效(很奇怪的一个需求)
		AString			strLoadingImage;	// 切换场景Loading图
		AString			strWorldMap;		// 场景地图
		AString			strWorldMapCloud;	// 场景地图-迷雾
		AString			strDomainFile;		// 场景分区文件
        AString			strCubeMap;			// 水面渲染cube map
		ARectF			rectMap;			// map在instance中覆盖的区域,当鼠标点击map时，用来计算对应世界中的位置。
		ARectF			validRegion;		// 场景地图有效的区域,无效部分可能用于装饰背景
		MARKINFO_LIST	vecMarks;			// 标签列表
		TELEPORT_LIST   vecTeleport;		// 传送点列表
		sPrecinctExtraInfo defalutPreinctExtraInfo;						  // 场景默认管辖区域信息
		abase::hash_map<int,sPrecinctExtraInfo>	hashPrecinctExtraInfo;    // 场景中管辖区域信息列表[id -> ExtraInfo]		

		sInstanceInfo(){}
		sInstanceInfo(const sInstanceInfo& rhs);
		sInstanceInfo& operator=(const sInstanceInfo& rhs);
		void Clear();
		
		const sPrecinctExtraInfo* GetDefaultPrecinctExtraInfo() const { return &defalutPreinctExtraInfo; };
		const sPrecinctExtraInfo* GetPrecinctExtraInfo(const int idPrecinct) const;
		int GetPrecinctWorldIndex(const int idPrecinct) const;
	};


// functions
public:	
	CECInstance(){}
	bool Load();
	void Release();
	static CECInstance& GetInstance(){ return s_instance;}

	// 场景信息
	const sInstanceInfo* GetInstanceInfo(const int idInstance);

protected:
	bool _LoadPrecinctInfo(sInstanceInfo& inst, sPrecinctExtraInfo& precinctInfo , const CScriptValue* pVar);
	bool _LoadInstanceInfo(sInstanceInfo& inst, const CScriptValue* pVar);


// Attributes
protected:
	abase::hash_map<int, sInstanceInfo>	     m_hashInstanceInfo;	

	static CECInstance	s_instance;
};
