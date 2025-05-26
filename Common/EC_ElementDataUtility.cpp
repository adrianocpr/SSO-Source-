/*
 * FILE: EC_ElementDataUtility.cpp
 *
 * DESCRIPTION: get item info from elementdata
 *
 * CREATED BY: hanwei, 2010/11/22
 *
 * HISTORY: 
 *
 * Copyright (c) 2010 Hummingbird Studio, All Rights Reserved.
 */

#include "StdAfx.h"
#include <wchar.h>
#include "EC_ElementDataUtility.h"
#include "ExpTypes.h"
#include "elementdataman.h"
#include "EC_IvtrEquip.h"
///////////////////////////////////////////////////////////////////////////
//
//	Local Types and Variables and Global variables
//
///////////////////////////////////////////////////////////////////////////
static const AWString EMPTY_STR  = _EW("");
static const AString  EMPTY_PATH = _EA("");
static const int SUIT_TAG_ACTIVE_CONFIG_LEVEL_MAX = 15;
static const int SUIT_TAG_ACTIVE_CONFIG_GROUP_MAX = 5;
static const int SUIT_TAG_ACTIVE_CONFIG_TAG_MAX	  = 9;
static const int SUIT_TAG_ACTIVE_CONFIG_EQUIP_COUNT_MAX = 3;

namespace ElementDataUtil
{
	class IvtrCache
	{
	public:
		typedef abase::hash_map<int, CECIvtrItem*> IvtrInfoTable;
		IvtrCache() 
		{
			table.resize(10000);
		}
		~IvtrCache()
		{
			IvtrInfoTable::iterator iter = table.begin();
			for (; iter != table.end(); ++iter)
			{
				delete iter->second;
			}
			table.clear();
		}

		CECIvtrItem* GetItemInfo(int tid)
		{
			if (tid <= 0) return NULL;
			IvtrInfoTable::iterator iter = table.find(tid);
			if (iter != table.end())
			{
				return iter->second;
			}			

			CECIvtrItem* pItem = CECIvtrItem::CreateItem(tid, 0, 1);
			if (pItem)
			{
				table[tid] = pItem;
				pItem->GetDetailDataFromLocal();
			}
			return pItem;
		}

	private:
		IvtrInfoTable table;
	};


	const CECIvtrItem* GetIvrtInfo(const int tid)
	{
		static IvtrCache cache;
		return cache.GetItemInfo(tid);
	}

	const char* GetDropSound(const int tid)
	{
		const CECIvtrItem* pIvtrItem = GetIvrtInfo(tid);
		int path_id = NULL != pIvtrItem ? pIvtrItem->GetItemDropSound() : 0;
		return 0 != path_id ? g_pGame->GetDataPath(path_id) : EMPTY_PATH;
	}

	const char* GetPickSound(const int tid)
	{
		const CECIvtrItem* pIvtrItem = GetIvrtInfo(tid);
		int path_id = NULL != pIvtrItem ? pIvtrItem->GetItemPickSound() : 0;
		return 0 != path_id ? g_pGame->GetDataPath(path_id) : EMPTY_PATH;
	}

	const char* GetDropModel(const int tid)
	{
		CECIvtrItem* pIvtrItem = const_cast<CECIvtrItem*>(GetIvrtInfo(tid));
		return NULL != pIvtrItem ? pIvtrItem->GetDropModel() : EMPTY_PATH;
	}

	const char* GetFileIcon(const int tid)
	{
		CECIvtrItem* pIvtrItem = const_cast<CECIvtrItem*>(GetIvrtInfo(tid));
		return NULL != pIvtrItem ? pIvtrItem->GetIconFile() : EMPTY_PATH;
	}

	int GetItemQuality(const int tid)
	{
		const CECIvtrItem* pIvtrItem = GetIvrtInfo(tid);
		return NULL != pIvtrItem ? pIvtrItem->GetItemQuality() : 0;
	}

	int GetUseTime(const int tid)
	{
		const CECIvtrItem* pIvtrItem = GetIvrtInfo(tid);
		return NULL != pIvtrItem ? pIvtrItem->GetItemUseTime() : 0;
	}

	int GetCoolTime(const int tid)
	{
		const CECIvtrItem* pIvtrItem = GetIvrtInfo(tid);
		return NULL != pIvtrItem ? pIvtrItem->GetItemCoolTime() : 0;
	}

	unsigned int GetProcType(const int tid)
	{
		const CECIvtrItem* pIvtrItem = GetIvrtInfo(tid);
		return NULL != pIvtrItem ? pIvtrItem->GetItemProcType() : 0;
	}

	const wchar_t* GetItemName(const int tid)
	{
		const CECIvtrItem* pIvtrItem = GetIvrtInfo(tid);
		return NULL != pIvtrItem ? pIvtrItem->GetName() : EMPTY_STR;
	}

	const wchar_t* GetName(const int tid)
	{
		DATA_TYPE dt;
		const void* pData = glb_GetElementDataMan()->get_data_ptr(tid, ID_SPACE_ESSENCE, dt);
		if(!pData) 
			return EMPTY_STR;

		switch (dt)
		{
		case DT_NPC_ESSENCE:
			return static_cast<const NPC_ESSENCE*>(pData)->name;
		case DT_MINE_ESSENCE:
			return static_cast<const MINE_ESSENCE*>(pData)->name;
		case DT_MONSTER_ESSENCE:
			return static_cast<const MONSTER_ESSENCE*>(pData)->name;
		default:
			{
				return GetItemName(tid);
			}
		}
		return EMPTY_STR;
	}

	const wchar_t* GetAddonPackageDesc(AWString& strOut, const int tid,bool bShowFightPower/* = false*/)
	{
		strOut.Empty();
		if(tid <= 0 ) 
			return strOut;

		DEFINE_SCRIPT_CALL_CONTEXT(context, args, results);
		luaf::AddNumber(args, tid);
		if(bShowFightPower)
			luaf::AddBoolean(args,false);//bNotFightPower=false
		if (luaf::CallFunc(context, "Addon_Func", "GetAddonPackageDesc") && 
			results.size() == 1 && results[0].m_Type == CScriptValue::SVT_STRING)
		{
			results[0].RetrieveAWString(strOut);
		}
		return strOut;
	}

	void GetAddonPackageSetDesc(AWString& strOut,abase::vector<int> addonIds,bool bShowFightPower /* = false */)
	{
		strOut.Empty();
		DEFINE_SCRIPT_CALL_CONTEXT(context, args, results);
		abase::vector<CScriptValue> ids;
		for(abase::vector<int>::iterator it=addonIds.begin();it!=addonIds.end();++it)
			luaf::AddNumber(ids,*it);
		luaf::AddArray(args,ids);
		if(bShowFightPower)
			luaf::AddBoolean(args,false);//bNotFightPower=false
		if (luaf::CallFunc(context, "Addon_Func", "GetAddonPackageSetDesc") && 
			results.size() == 1 && results[0].m_Type == CScriptValue::SVT_STRING)
		{
			results[0].RetrieveAWString(strOut);
		}
	}

	void GetAddonPackageDescList(abase::vector<AWString>& descList,int tid,bool bShowFightPower /* = false */)
	{
		descList.clear();
		if(tid<=0)
			return;
		DEFINE_SCRIPT_CALL_CONTEXT(context, args, results);
		luaf::AddNumber(args, tid);
		if(bShowFightPower)
			luaf::AddBoolean(args,false);
		if(luaf::CallFunc(context, "Addon_Func", "GetAddonPackageDescList"))
		{
			if(results.size()==1&&results[0].m_Type == CScriptValue::SVT_ARRAY)
			{
				luaf::GetValue(descList,results[0]);
			}
		}
	}

	const wchar_t* GetAddonPackageDesc( AWString& strOut, const int* pTid, const size_t size )
	{
		strOut.Empty();

		for(size_t i = 0; i < size; ++i)
		{
			int id = pTid[i];
			if(id <= 0) continue;

			AWString strDesc;
			GetAddonPackageDesc(strDesc, id);
			if(!strDesc.IsEmpty())
			{
				if(!strOut.IsEmpty())
					strOut += glb_GetString(_EW("NEW_LINE"));
				strOut += strDesc;
			}
		}
		return strOut;
	}

	//获取附加属性包战斗力
	const int GetAddonPackageFightPower(const int tid)
	{
		if(tid <= 0 ) return 0;
		const ADDON_PACKAGE_CONFIG* pPackage = PlayerUtil::GetAddonPackageCfg(tid);
		if( pPackage)
		{
			return pPackage->fight_power;
		}
		return 0;
	}

	//获取套装标识激活的附加属性包id
	const int GetSuitTagActivePackageID(const int iLevel, const int iGroup, const int iTag, const int iCount)
	{
		if ((iLevel < 0 || iLevel >= SUIT_TAG_ACTIVE_CONFIG_LEVEL_MAX) ||
			(iGroup < 0 || iGroup >= SUIT_TAG_ACTIVE_CONFIG_GROUP_MAX) ||
			(iTag   < 0 || iTag   >= SUIT_TAG_ACTIVE_CONFIG_TAG_MAX) ||
			(iCount < 0 || iCount >= SUIT_TAG_ACTIVE_CONFIG_EQUIP_COUNT_MAX))
			return 0;

		const SUIT_TAG_ACTIVE_CONFIG* pPackage = PlayerUtil::GetSuitTagActiveConfig();
		if( pPackage)
		{
			return pPackage->addon_pack[iLevel][iGroup][iTag][iCount];
		}

		return 0;
	}

	// 获取指定级别的生产精力上限值
	const int GetProduceEnergyMaxValue(const int iLevel)
	{
		const PRODUCE_ENERGY_CONFIG *pCfg = PlayerUtil::GetProduceEnergyConfig();
		if (NULL != pCfg)
		{
			int iSize = sizeof(pCfg->max_produce_energy) / sizeof(pCfg->max_produce_energy[0]);
			if (iLevel < 0 || iLevel >= iSize)
				return 0;

			return pCfg->max_produce_energy[iLevel];
		}

		return 0;
	}

	// 获取指定VIP等级指定状态(是否激活)的随身服务的NPCID
	const int GetSelfServiceNPCID(const int iVipLevel, const bool bActivated/*=false*/)
	{
		const SELF_SERVICE_CONFIG *pCfg = PlayerUtil::GetSelfServiceConfig();
		if (NULL == pCfg) return 0;

		if (bActivated)
		{
			int iSize = sizeof(pCfg->npc_id_for_mvip) / sizeof(pCfg->npc_id_for_mvip[0]);
			if (iVipLevel < 0 || iVipLevel >= iSize)
				return 0;
			return pCfg->npc_id_for_mvip[iVipLevel];
		}
		else
		{
			int iSize = sizeof(pCfg->configs) / sizeof(pCfg->configs[0]);
			if (iVipLevel < 0 || iVipLevel >= iSize)
				return 0;
			return pCfg->configs[iVipLevel].npc_id;
		}
		return 0;
	}

	// 获取VIP配置信息
	const VIP_CONFIG* GetVIPConfig()
	{
		return PlayerUtil::GetVIPConfig();
	}

	// 获取聚能套装属性表
	const EQUIPMENT_ENHANCE_COMBO_CONFIG* GetEquipEnhanceComboConfig(bool bLow /* = true*/)
	{
		return PlayerUtil::GetEquipEnhanceComboConfig(bLow);
	}

	bool IsItemARefineValuableEquip(CECIvtrItem* pItem)
	{
		if(NULL==pItem) return false;
		if (pItem->GetClassID() == CECIvtrItem::ICID_EQUIP )
		{
			CECIvtrEquip* pEquipItem = dynamic_cast<CECIvtrEquip*>(pItem);
			if(NULL != pEquipItem && pEquipItem->GetEquipMaxRefineLevel() > 0)
			{
				int perfect_point = (int)(pEquipItem->GetPerfectPoint() * 100.0f);
				return perfect_point > 400;
			}
		}
		return false;
	}
}
