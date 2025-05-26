/*
 * FILE: EC_ElementDataUtility.h
 *
 * DESCRIPTION: get item info from elementdata
 *
 * CREATED BY: hanwei, 2010/11/22
 *
 * HISTORY: 
 *
 * Copyright (c) 2010 Hummingbird Studio, All Rights Reserved.
 */

#pragma once


namespace ElementDataUtil
{
	//获取物品数据
	const CECIvtrItem* GetIvrtInfo(const int tid);

	//获取物品的掉落音效
	const char* GetDropSound(const int tid);

	//获取物品的拾取音效
	const char* GetPickSound(const int tid);

	//获取物品掉落模型
	const char* GetDropModel(const int tid);

	//获取物品图标
	const char* GetFileIcon(const int tid);

	//获取物品的品质
	int GetItemQuality(const int tid);

	//获取物品使用时间
	int GetUseTime(const int tid);

	//获取物品使用时间
	int GetCoolTime(const int tid);

	//获取物品的处理方式
	unsigned int GetProcType(const int tid);

	//获取物品名称
	const wchar_t* GetItemName(const int tid);

	//获取物品、NPC、矿物、怪物的名称
	const wchar_t* GetName(const int tid);	

	//获取物品简介
	const wchar_t* GetSimpleDesc(const int tid);

	//获取附加属性包描述文字
	//@param bShowFightPower 生成战力
	const wchar_t* GetAddonPackageDesc(AWString& strOut, const int tid,bool bShowFightPower = false);
	//获取附加属性包集合文字描述
	void GetAddonPackageSetDesc(AWString& strOut,abase::vector<int> addonIds,bool bShowFightPower = false);

	void GetAddonPackageDescList(abase::vector<AWString>& descList,int tid,bool bShowFightPower = false);

	//获取多个附加属性包描述文字,只是简单拼接
	const wchar_t* GetAddonPackageDesc(AWString& strOut, const int* pTid, const size_t size);

	//获取附加属性包战斗力
	const int GetAddonPackageFightPower(const int tid);

	//获取套装标识激活的附加属性包id
	const int GetSuitTagActivePackageID(const int iLevel, const int iGroup, const int iTag, const int iCount);

	// 获取指定级别的生产精力上限值
	const int GetProduceEnergyMaxValue(const int iLevel);

	// 获取指定VIP等级指定状态(是否激活)的随身服务的NPCID
	const int GetSelfServiceNPCID(const int iVipLevel, const bool bActivated = false);

	// 获取VIP配置信息
	const VIP_CONFIG* GetVIPConfig();

	// 获取聚能套装属性表
	const EQUIPMENT_ENHANCE_COMBO_CONFIG* GetEquipEnhanceComboConfig(bool bLow = true);
	
	//物品是一个聚能有价值的装备么
	bool IsItemARefineValuableEquip(CECIvtrItem* pItem);
}