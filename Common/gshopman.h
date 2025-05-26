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
		PROP_NEW			= 0x1, // 新品
		PROP_RECOMMEND		= 0x2, // 推荐
		PROP_DISCOUNT		= 0x4, // 促销
		PROP_SHOW_ON_BANNER	= 0x8, // 在横幅显示 
	};

	enum CURRENCY_TYPE
	{
		CURRENCY_CASH,				// 元宝
		CURRENCY_BIND_CASH,			// 绑定元宝
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

	int id;								// 宝物id
	int category_id;					// 所属分类
	int seq;							// 顺序，同一分类下越小显示越靠前 (客户端显示时使用)
	unsigned int props;					// 属性Mask，参见PROPERTIES (客户端显示时使用)

	int item_id;						// 物品id
	int item_count;						// 物品数量
	int item_time;						// 物品时限（秒）
	int currency;						// 货币类型 参见CURRENCY_TYPE
	int price;							// 价格
	int max_count_per_transaction;		// 单次最大购买数量 (客户端显示时使用)
										// 0=以物品堆叠上限为准
										// 若为其它值，则取单次最大购买数量和物品堆叠上限的最小值
	int discount;						// 折扣 0~100，100为不打折，数字越大价格越贵，为防止填错，0也为不打折
	int sale_time_type;					// 上架时间类型 0=任何时间都生效 
										//				1=时间段(使用sale_time_start和sale_time_end) 
										//				2=每周(使用sale_per_week)
										//				3=每月(使用sale_per_month)
	int sale_time_start;				// 上架开始时间点
	int sale_time_end;					// 上架结束时间点
	unsigned int sale_per_week;			// 每周上架时间MASK，参见WEEK_DAYS
	unsigned int sale_per_month;		// 每月上架时间，每一bit代表一天。
										// 若每月1日上架，则 (sale_per_month & 0x1) != 0
										// 若每月31日上架，则 (sale_per_month & (0x1 << 30)) != 0
	int level_req;						// 等级限制
	int vip_level_req;					// VIP等级限制
	int mvip_level_req;					// 月度VIP等级限制 

	struct
	{
		int item;						// 物品id
		int item_count;					// 物品数量
		int item_time;					// 物品时限
	}
	give_away[2];						// 购买时赠送

	char __DATA_END;

	std::wstring name;					// 名称
	std::wstring icon;					// 图标
	std::wstring description;			// 描述

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
