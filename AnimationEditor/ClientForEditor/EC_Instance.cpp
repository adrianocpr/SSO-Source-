/********************************************************************
	created:	2009/9/14
	author:		liudong
	
	purpose:   instance,precinct信息.
	Copyright (C) All Rights Reserved
*********************************************************************/

#include "StdAfx.h"
#include "EC_Game.h"
#include "EC_GameRun.h"
#include "EC_World.h"
#include "EC_Algorithm.h"
#include "EC_Instance.h"
#include "EL_Precinct.h"
#include "EC_Utility.h"
#include "LuaFuncCommon.h"

#define new A_DEBUG_NEW

#define  INSTANCE_TABLE     _EA("Instance")
#define  INSTANCE_FILE_PATH _EA("script\\map\\Instance.lua")
#define  BUTTON_TABLE       _EA("PrecinctButton")
#define  BUTTON_FILE_PATH   _EA("script\\map\\PrecinctButton.lua")



///////////////////////////////////////////////////////////////////////////
//	
//	Local functions
//	
///////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////
//	
//	Local Types and Variables and Global variables
//	
///////////////////////////////////////////////////////////////////////////
CECInstance	CECInstance::s_instance;


//--------------------
// 场景信息
CECInstance::sInstanceInfo::sInstanceInfo(const CECInstance::sInstanceInfo& rhs)
{
	*this = rhs;
}

CECInstance::sInstanceInfo& CECInstance::sInstanceInfo::operator=(const CECInstance::sInstanceInfo& rhs)
{
	if (this==&rhs)
	{
		return *this;
	}

	id					= rhs.id;			
	idZone				= rhs.idZone;		
	strName				= rhs.strName;		
	strPath				= rhs.strPath;	
	strDetailTex		= rhs.strDetailTex; 
	iRowNum				= rhs.iRowNum;		
	iColNum				= rhs.iColNum;		
	colorWater			= rhs.colorWater;		
	bUnderWater         = rhs.bUnderWater;
	fOriginX			= rhs.fOriginX;
	fOriginZ			= rhs.fOriginZ;
	iInstType			= rhs.iInstType;
	strWorldMap         = rhs.strWorldMap;
	strWorldMapCloud    = rhs.strWorldMapCloud;
	strDomainFile       = rhs.strDomainFile;
    strCubeMap			= rhs.strCubeMap;
	rectMap             = rhs.rectMap;
	CopyHashMap(hashPrecinctExtraInfo, rhs.hashPrecinctExtraInfo);
	return *this;
}

void CECInstance::sInstanceInfo::Clear()
{
	hashPrecinctExtraInfo.clear();
}



//--------------------
// 管辖区域
const CECInstance::sPrecinctExtraInfo* CECInstance::sInstanceInfo::GetPrecinctExtraInfo(const int idPrecinct) const
{
	abase::hash_map<int,sPrecinctExtraInfo>::const_iterator it = hashPrecinctExtraInfo.find(idPrecinct);
	if (it == hashPrecinctExtraInfo.end())
	{
		return NULL;
	}
	return &(it->second);
}


///////////////////////////////////////////////////////////////////////////
//	
//	Implementation of CECInstance
//	
///////////////////////////////////////////////////////////////////////////

bool CECInstance::Load()
{
	// 加载场景配置信息
	CScriptValue varInstance;
	if (!luaf::GetScriptConfigTable(varInstance, INSTANCE_TABLE, INSTANCE_FILE_PATH, false))
	{
		return false;
	}	
	for (unsigned i = 0; i < varInstance.m_ArrKey.size(); ++i)
	{
		const CScriptValue& varKey = varInstance.m_ArrKey[i];
		int idInstance		= (int)varKey.GetDouble();
		sInstanceInfo& inst = m_hashInstanceInfo[idInstance];
		inst.id				= idInstance;
		if (!_LoadInstanceInfo(inst, &(varInstance.m_ArrVal[i])))
		{
			ASSERT(0);
			return false;
		}
	}

	return true;
}


void CECInstance::Release()
{
	m_hashInstanceInfo.clear();
}




//-------------------------
// 场景配置信息
const CECInstance::sInstanceInfo* CECInstance::GetInstanceInfo(const int idInstance)
{
	abase::hash_map<int,sInstanceInfo>::iterator it = m_hashInstanceInfo.find(idInstance);
	if (it == m_hashInstanceInfo.end())
	{
		return NULL;
	}
	return &(it->second);
}

bool CECInstance::_LoadInstanceInfo(sInstanceInfo& inst, const CScriptValue* pVar)
{
	inst.Clear();
	if (NULL == pVar)
	{
		ASSERT(0);
		return false;
	}
	
	//base information
	luaf::GetValue(inst.idZone,		 *pVar, _EW("idZone"));
	luaf::GetValue(inst.strName,	 *pVar, _EW("name"));
	luaf::GetValue(inst.strPath,	 *pVar, _EW("path"));
	luaf::GetValue(inst.strDetailTex,*pVar, _EW("detailTexture"), _EA(""));
	luaf::GetValue(inst.iRowNum,	 *pVar, _EW("row"));
	luaf::GetValue(inst.iColNum,	 *pVar, _EW("column"));
	A3DVECTOR3 vColor;
	luaf::GetValue(vColor,			 *pVar, _EW("waterColor"));
	inst.colorWater = 0xff000000 | (int(vColor.x) << 16) | (int(vColor.y) << 8) | int(vColor.z);
	luaf::GetValue(inst.bUnderWater,  *pVar, _EW("bUnderWater"));	
	APointF ptOrigin;
	luaf::GetValue(ptOrigin,		 *pVar, _EW("origin"));
	inst.fOriginX = ptOrigin.x;
	inst.fOriginZ = ptOrigin.y;
	luaf::GetValue(inst.iInstType,   *pVar, _EW("iInstType"));

	luaf::GetValue(inst.strWorldMap,  *pVar, _EW("worldMap"));
	luaf::GetValue(inst.bHasMapCloud, *pVar, _EW("bHasMapCloud"), false);
	luaf::GetValue(inst.rectMap,      *pVar, _EW("rectMap"));	
	luaf::GetValue(inst.validRegion,  *pVar, _EW("validRegion"), ARectF(0, 0, MAP_IMAGE_WIDTH, MAP_IMAGE_HEIGHT));
	luaf::GetValue(inst.strDomainFile,*pVar, _EW("domainFile"));
    luaf::GetValue(inst.strCubeMap,		*pVar, _EW("cubeMap"));
	luaf::GetValue(inst.strMiniMap,		*pVar, _EW("MiniMap"));
	luaf::GetValue(inst.strLoadingImage,*pVar, _EW("loadingImage"));
	luaf::GetValue(inst.strSelRoleGFX,	*pVar, _EW("selRoleGFX"));
	if (inst.bHasMapCloud)
	{
		luaf::GetValue(inst.strWorldMapCloud,*pVar, _EW("worldMapCloud"));
	}
	abase::vector<const CScriptValue*> vecTemp;
	if (luaf::GetValue(vecTemp,*pVar,_EW("marks")))
	{
		for (unsigned int i=0; i<vecTemp.size(); ++i)
		{
			inst.vecMarks.push_back(sMarkInfo()) ;
			sMarkInfo& mark = inst.vecMarks.back();
			luaf::GetValue(mark.pos,	*(vecTemp[i]),_EW("pos"));
			luaf::GetValue(mark.desc,	*(vecTemp[i]),_EW("desc"));
			luaf::GetValue(mark.strImage,*(vecTemp[i]),_EW("image"));
		}
	}

	// default precinct
	inst.defalutPreinctExtraInfo.id				= -1;
	inst.defalutPreinctExtraInfo.bPrecinctMap	= false;
	inst.defalutPreinctExtraInfo.upPrecinctId	= PRECINCT_INVALID;
	inst.defalutPreinctExtraInfo.rectMap		= inst.rectMap;
	inst.defalutPreinctExtraInfo.strLoadingImage= inst.strLoadingImage;
	inst.defalutPreinctExtraInfo.strMidMap		= inst.strWorldMap;
	inst.defalutPreinctExtraInfo.strMiniMap		= inst.strMiniMap;
	inst.defalutPreinctExtraInfo.strSelRoleGFX  = inst.strSelRoleGFX;
	inst.defalutPreinctExtraInfo.vecMarks		= inst.vecMarks;
	inst.defalutPreinctExtraInfo.validRegion	= inst.validRegion;
	
	// precinct
	for (unsigned int i=0; i<pVar->m_ArrKey.size(); ++i)
	{
		const CScriptValue& varKey = pVar->m_ArrKey[i];
		if (CScriptValue::SVT_NUMBER != varKey.m_Type)
		{
			continue;
		}
		int idPrecinct = (int)varKey.GetDouble();
		inst.hashPrecinctExtraInfo[idPrecinct]    = sPrecinctExtraInfo();
		inst.hashPrecinctExtraInfo[idPrecinct].id = idPrecinct;
		if (!_LoadPrecinctInfo(inst, inst.hashPrecinctExtraInfo[idPrecinct], &(pVar->m_ArrVal[i])))
		{
			ASSERT(0);
			return false;
		}
	}
	return true;
}


bool CECInstance::_LoadPrecinctInfo(sInstanceInfo& inst, sPrecinctExtraInfo& precinctInfo , const CScriptValue* pVar)
{
	precinctInfo.Clear();
	if (!pVar)
	{
		ASSERT(0);
		return false;
	}

	luaf::GetValue(precinctInfo.bPrecinctMap,	*pVar, _EW("bPrecinctMap"));
	luaf::GetValue(precinctInfo.upPrecinctId,	*pVar, _EW("upPrecinctId"), PRECINCT_INVALID);
	if (precinctInfo.bPrecinctMap)
	{
		luaf::GetValue(precinctInfo.rectMap,	*pVar, _EW("rectMap"), inst.rectMap);
		luaf::GetValue(precinctInfo.validRegion,*pVar, _EW("validRegion"), inst.validRegion);
		luaf::GetValue(precinctInfo.strMidMap,	*pVar, _EW("MidMap"), inst.strWorldMap);
	}
	else
	{
		precinctInfo.rectMap		= inst.rectMap;
		precinctInfo.validRegion	= inst.validRegion;	
		precinctInfo.strMidMap		= _EA("");		
	}
	luaf::GetValue(precinctInfo.strMiniMap,	*pVar, _EW("MiniMap"), inst.strMiniMap);
	luaf::GetValue(precinctInfo.strLoadingImage,*pVar, _EW("loadingImage"), inst.strLoadingImage);
	luaf::GetValue(precinctInfo.strSelRoleGFX,	*pVar, _EW("selRoleGFX"), inst.strSelRoleGFX);
	abase::vector<const CScriptValue*> vecTemp;
	if (luaf::GetValue(vecTemp,*pVar,_EW("marks")))
	{
		for (unsigned int i=0; i<vecTemp.size(); ++i)
		{
			precinctInfo.vecMarks.push_back(sMarkInfo()) ;
			sMarkInfo& mark = precinctInfo.vecMarks.back();
			luaf::GetValue(mark.pos,	*(vecTemp[i]),_EW("pos"));
			luaf::GetValue(mark.desc,	*(vecTemp[i]),_EW("desc"));
			luaf::GetValue(mark.strImage,*(vecTemp[i]),_EW("image"));
		}
	}
	else
	{
		precinctInfo.vecMarks = inst.vecMarks;
	}
	
	return true;
}
