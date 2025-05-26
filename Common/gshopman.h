/*
 * FILE: gshopman.h
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Feng Bo, 2013-2-18
 *
 * HISTORY: 
 *
 * Copyright (c) 2010 Hummingbird Studio, All Rights Reserved.
 */

#ifndef GSHOPMAN_H_
#define GSHOPMAN_H_

#include <string>
#include <map>
#include <vector>

#pragma pack(1)
struct GSHOP_CATEGORY
{
	char __DATA_BEGIN;

	int id;
	int parent_id;
	int seq;

	char __DATA_END;

	std::wstring name;

	GSHOP_CATEGORY();
	GSHOP_CATEGORY* GetParent() { return pParent; }
private:
	friend class gshopman;
	GSHOP_CATEGORY* pParent;
};

struct GSHOP_ITEM
{
	enum PROPERTIES
	{
		PROP_NEW			= 0x1, // ��Ʒ
		PROP_RECOMMEND		= 0x2, // �Ƽ�
		PROP_DISCOUNT		= 0x4, // ����
		PROP_SHOW_ON_BANNER	= 0x8, // �ں����ʾ 
	};

	enum CURRENCY_TYPE
	{
		CURRENCY_CASH,				// Ԫ��
		CURRENCY_BIND_CASH,			// ��Ԫ��
	};

	enum WEEK_DAYS
	{
		MONDAY			= 0x1,
		TUESDAY			= 0x2,
		THURSDAY		= 0x4,
		WENDSDAY		= 0x8,
		FRIDAY			= 0x10,
		SATURDAY		= 0x20,
		SUNDAY			= 0x40,
	};

	char __DATA_BEGIN;

	int id;								// ����id
	int category_id;					// ��������
	int seq;							// ˳��ͬһ������ԽС��ʾԽ��ǰ (�ͻ�����ʾʱʹ��)
	unsigned int props;					// ����Mask���μ�PROPERTIES (�ͻ�����ʾʱʹ��)

	int item_id;						// ��Ʒid
	int item_count;						// ��Ʒ����
	int item_time;						// ��Ʒʱ�ޣ��룩
	int currency;						// �������� �μ�CURRENCY_TYPE
	int price;							// �۸�
	int max_count_per_transaction;		// ������������� (�ͻ�����ʾʱʹ��)
										// 0=����Ʒ�ѵ�����Ϊ׼
										// ��Ϊ����ֵ����ȡ�����������������Ʒ�ѵ����޵���Сֵ
	int discount;						// �ۿ� 0~100��100Ϊ�����ۣ�����Խ��۸�Խ��Ϊ��ֹ���0ҲΪ������
	int sale_time_type;					// �ϼ�ʱ������ 0=�κ�ʱ�䶼��Ч 
										//				1=ʱ���(ʹ��sale_time_start��sale_time_end) 
										//				2=ÿ��(ʹ��sale_per_week)
										//				3=ÿ��(ʹ��sale_per_month)
	int sale_time_start;				// �ϼܿ�ʼʱ���
	int sale_time_end;					// �ϼܽ���ʱ���
	unsigned int sale_per_week;			// ÿ���ϼ�ʱ��MASK���μ�WEEK_DAYS
	unsigned int sale_per_month;		// ÿ���ϼ�ʱ�䣬ÿһbit����һ�졣
										// ��ÿ��1���ϼܣ��� (sale_per_month & 0x1) != 0
										// ��ÿ��31���ϼܣ��� (sale_per_month & (0x1 << 30)) != 0
	int level_req;						// �ȼ�����
	int vip_level_req;					// VIP�ȼ�����
	int mvip_level_req;					// �¶�VIP�ȼ����� 

	struct
	{
		int item;						// ��Ʒid
		int item_count;					// ��Ʒ����
		int item_time;					// ��Ʒʱ��
	}
	give_away[2];						// ����ʱ����

	char __DATA_END;

	std::wstring name;					// ����
	std::wstring icon;					// ͼ��
	std::wstring description;			// ����

	GSHOP_ITEM();
	bool operator==(GSHOP_ITEM& rhs) const;

	GSHOP_CATEGORY* GetCategory() { return pCategory; }
private:
	friend class gshopman;
	GSHOP_CATEGORY* pCategory;
};
#pragma pack()

class gshopman
{
public:
	typedef bool (*L10NTextFunc)(std::wstring& result, const wchar_t* id);
public:
	enum
	{
		GSHOP_DATA_VERSION = 2,
	};

	typedef std::map<int, GSHOP_CATEGORY> CategoryMap;
	typedef std::map<int, GSHOP_ITEM> ItemMap;
	typedef std::vector<GSHOP_ITEM*> ItemList;
	typedef std::map<int, ItemList> CategoryItemMap;
public:
	gshopman();
	virtual ~gshopman();

	void reset();
	bool load_bin(const char* szPath);
	bool save_bin(const char* szPath);

	void init_categories();
	void init_items();
	void load_category(const GSHOP_CATEGORY& cat) { m_mapCategories[cat.id] = cat; }
	void load_item(const GSHOP_ITEM& item) { m_mapItems[item.id] = item; }

	unsigned int get_timestamp() { return m_timestamp; }
	GSHOP_CATEGORY* get_category(int id) { CategoryMap::iterator it = m_mapCategories.find(id); return it == m_mapCategories.end() ? NULL : &(it->second); }
	GSHOP_ITEM* get_item(int id) { ItemMap::iterator it = m_mapItems.find(id); return it == m_mapItems.end() ? NULL : &(it->second); }
	CategoryMap& get_category_map() { return m_mapCategories; }
	GSHOP_CATEGORY& get_category_root() { return m_mapCategories[0]; }
	ItemMap& get_item_map() { return m_mapItems; }

	const ItemList& get_items_of(int category_id);

	L10NTextFunc get_l10n_text_func() { return m_l10n_func; }
	void set_l10n_text_func(L10NTextFunc func) { m_l10n_func = func; }
private:
	void load_text(GSHOP_CATEGORY& category);
	void load_text(GSHOP_ITEM& item);
	void load_l10n_text();

	unsigned int m_timestamp;
	CategoryMap m_mapCategories;
	ItemMap m_mapItems;
	CategoryItemMap m_mapCategory2Item;

	L10NTextFunc m_l10n_func;
};

#endif /* GSHOPMAN_H_ */
