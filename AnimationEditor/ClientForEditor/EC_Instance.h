/********************************************************************
	created:	2009/9/14
	author:		liudong
	
	purpose:   instance,precinct��Ϣ.
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



// ��ͼ�ȼ�
typedef	enum				
{
	MAP_INVALID,            // ��Ч
	MAP_WORLD,				// �����ͼ
	MAP_MIDDLE,		        // ʡ����ͼ
	MAP_PRECINCT,			// ��Ͻ�����ͼ
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
	MAPMARK_TRANSPORT,	// ���͵�
	MAPMARK_MINE,  // ���
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
	// ��ͼ�ϵı�ǵ�
	struct sMarkInfo
	{
		APointF  pos;
		AWString desc;
		AString  strImage;
	};
	typedef abase::vector<sMarkInfo> MARKINFO_LIST;

	// ��ͼ���͵��б�
	typedef abase::vector<const struct WORLD_TELEPORT_POINT_CONFIG*> TELEPORT_LIST;

	enum
	{
		INST_TYPE_WORLD = 0,	//������		
		INST_TYPE_BATTLE,		//ս��
		INST_TYPE_DYNAMIC,		//����
		INST_TYPE_UNDER,		//�ع�
		INST_TYPE_ACTIVE,		//�
		INST_TYPE_NUM,
	};

	// ��Ͻ������Ϣ
	struct sPrecinctExtraInfo
	{
		int				id;						// ��Ͻ����Id
		int				upPrecinctId;			// ��һ����Ͻ����
		bool			bPrecinctMap;			// ��Ͻ�Ƿ�Ҫʹ��ר����ͼ(һ��ʹ�ó�����ͼ)		
		ARectF			rectMap;				// map��instance�и��ǵ�����,�������mapʱ�����������Ӧ�����е�λ�á�
		ARectF			validRegion;			// ������ͼ��Ч������,��Ч���ֿ�������װ�α���
		AString			strMidMap;				// ��Ͻ�����ͼ
		AWString		strMiniMap;				// �״�ͼ
		AString			strLoadingImage;		// �л�����Loadingͼ
		AWString		strSelRoleGFX;			// ѡ��������Ч(����ֵ�һ������)
		MARKINFO_LIST	vecMarks;				// ��ǩ�б�
		TELEPORT_LIST   vecTeleport;			// ���͵��б�

		void Clear(){ vecMarks.clear(); }
		bool IsValid() const {return (strMidMap.GetLength()>0); } 
	};
	typedef class abase::vector<int> VEC_PRECINCT;


	// ������Ϣ
	struct sInstanceInfo
	{
		int			id;			    // ����Id
		int			idZone;		    // δ֪����,����͹�����ع����й�
		AWString	strName;	    // ��������
		AString		strPath;	    // �����ļ�·��
		AString		strDetailTex;   // ������ͼ		
		int			iRowNum;		// Number of map row
		int			iColNum;		// Number of map column
		A3DCOLOR	colorWater;	    // color of water surface in this map
		bool		bUnderWater;	// current scene is under water
		bool		bHasMapCloud;	// If this instance have map cloud
		float		fOriginX;       // ����ԭ������������ϵδ֪, x��
		float		fOriginZ;       // ����ԭ������������ϵδ֪, z��
		int			iInstType;      // ��������

		AWString		strMiniMap;			// �״�ͼ
		AWString		strSelRoleGFX;		// ѡ��������Ч(����ֵ�һ������)
		AString			strLoadingImage;	// �л�����Loadingͼ
		AString			strWorldMap;		// ������ͼ
		AString			strWorldMapCloud;	// ������ͼ-����
		AString			strDomainFile;		// ���������ļ�
        AString			strCubeMap;			// ˮ����Ⱦcube map
		ARectF			rectMap;			// map��instance�и��ǵ�����,�������mapʱ�����������Ӧ�����е�λ�á�
		ARectF			validRegion;		// ������ͼ��Ч������,��Ч���ֿ�������װ�α���
		MARKINFO_LIST	vecMarks;			// ��ǩ�б�
		TELEPORT_LIST   vecTeleport;		// ���͵��б�
		sPrecinctExtraInfo defalutPreinctExtraInfo;						  // ����Ĭ�Ϲ�Ͻ������Ϣ
		abase::hash_map<int,sPrecinctExtraInfo>	hashPrecinctExtraInfo;    // �����й�Ͻ������Ϣ�б�[id -> ExtraInfo]		

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

	// ������Ϣ
	const sInstanceInfo* GetInstanceInfo(const int idInstance);

protected:
	bool _LoadPrecinctInfo(sInstanceInfo& inst, sPrecinctExtraInfo& precinctInfo , const CScriptValue* pVar);
	bool _LoadInstanceInfo(sInstanceInfo& inst, const CScriptValue* pVar);


// Attributes
protected:
	abase::hash_map<int, sInstanceInfo>	     m_hashInstanceInfo;	

	static CECInstance	s_instance;
};
