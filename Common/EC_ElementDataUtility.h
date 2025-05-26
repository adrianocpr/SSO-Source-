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
	//��ȡ��Ʒ����
	const CECIvtrItem* GetIvrtInfo(const int tid);

	//��ȡ��Ʒ�ĵ�����Ч
	const char* GetDropSound(const int tid);

	//��ȡ��Ʒ��ʰȡ��Ч
	const char* GetPickSound(const int tid);

	//��ȡ��Ʒ����ģ��
	const char* GetDropModel(const int tid);

	//��ȡ��Ʒͼ��
	const char* GetFileIcon(const int tid);

	//��ȡ��Ʒ��Ʒ��
	int GetItemQuality(const int tid);

	//��ȡ��Ʒʹ��ʱ��
	int GetUseTime(const int tid);

	//��ȡ��Ʒʹ��ʱ��
	int GetCoolTime(const int tid);

	//��ȡ��Ʒ�Ĵ���ʽ
	unsigned int GetProcType(const int tid);

	//��ȡ��Ʒ����
	const wchar_t* GetItemName(const int tid);

	//��ȡ��Ʒ��NPC��������������
	const wchar_t* GetName(const int tid);	

	//��ȡ��Ʒ���
	const wchar_t* GetSimpleDesc(const int tid);

	//��ȡ�������԰���������
	//@param bShowFightPower ����ս��
	const wchar_t* GetAddonPackageDesc(AWString& strOut, const int tid,bool bShowFightPower = false);
	//��ȡ�������԰�������������
	void GetAddonPackageSetDesc(AWString& strOut,abase::vector<int> addonIds,bool bShowFightPower = false);

	void GetAddonPackageDescList(abase::vector<AWString>& descList,int tid,bool bShowFightPower = false);

	//��ȡ����������԰���������,ֻ�Ǽ�ƴ��
	const wchar_t* GetAddonPackageDesc(AWString& strOut, const int* pTid, const size_t size);

	//��ȡ�������԰�ս����
	const int GetAddonPackageFightPower(const int tid);

	//��ȡ��װ��ʶ����ĸ������԰�id
	const int GetSuitTagActivePackageID(const int iLevel, const int iGroup, const int iTag, const int iCount);

	// ��ȡָ�������������������ֵ
	const int GetProduceEnergyMaxValue(const int iLevel);

	// ��ȡָ��VIP�ȼ�ָ��״̬(�Ƿ񼤻�)����������NPCID
	const int GetSelfServiceNPCID(const int iVipLevel, const bool bActivated = false);

	// ��ȡVIP������Ϣ
	const VIP_CONFIG* GetVIPConfig();

	// ��ȡ������װ���Ա�
	const EQUIPMENT_ENHANCE_COMBO_CONFIG* GetEquipEnhanceComboConfig(bool bLow = true);
	
	//��Ʒ��һ�������м�ֵ��װ��ô
	bool IsItemARefineValuableEquip(CECIvtrItem* pItem);
}