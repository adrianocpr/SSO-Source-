--[[ @i18n item ]]
local _t = require("i18n").context("item")
---------------------------------------------------------------
--  created:   2013.2.22
--  author:    chenfudun
--
--  商城相关配置
---------------------------------------------------------------	

---------------------------------------------------------------
-- 商城物品图标
---------------------------------------------------------------
-- 图标路径：surfaces\special\Gshop\
GShop_Dir_Icons_Root_Path = "special\\Gshop\\"

GShop_Dir_Icons = 
{
	[_t"外形时装"] = "Fashion.png",
	[_t"辅助道具"] = "Attr.png",
	[_t"守护星"] = "Pet.png",
	[_t"实用道具"] = "Utility.png",
	[_t"升级道具"] = "LevelUp.png",
	[_t"回复道具"] = "Drug.png",
	[_t"坐骑"] = "zuoqi.tga",	
	[_t"装备相关"] = "zhuangbei.tga",	
	[_t"小伙伴"] = "huoban.tga",	
	[_t"圣衣相关"] = "shengyi.tga",
	[_t"热卖"] = "remai.tga",
	[_t"化妆"] = "huazhuang.tga",
	[_t"观星相关"] = "guanxing.tga",
	[_t"功能道具"] = "gongneng.tga",
	[_t"超值促销"] = "cuxiao.tga",
	[_t"虚拟币道具"] = "Money.png",
	[_t"神器相关"] = "shenqi.png",
	[_t"结婚系统"] = "Love.png",							
}

---------------------------------------------------------------
-- 快速购买
---------------------------------------------------------------
local QUICKBUY_FLOWER 				= 1   -- 鲜花购买
local QUICKBUY_SAINTCLOTH_ENHANCE	= 2   -- 星铸界面
local QUICKBUY_EQUIP_ENHANCE   		= 3   -- 聚能界面
local QUICKBUY_COSMOS_ASTROLOGY 	= 4	  -- 小宇宙占星界面
local QUICKBUY_SUIT_TAG_REFRESH		= 5	  -- 套装标识重随机界面

-- 鲜花购买
GShop_QuickBuy_Goods = {}
GShop_QuickBuy_Goods[QUICKBUY_FLOWER] =
{
	89,
}

-- 星铸界面
GShop_QuickBuy_Goods[QUICKBUY_SAINTCLOTH_ENHANCE] =
{
	356,93,358,455,91,477,
}

-- 聚能界面
GShop_QuickBuy_Goods[QUICKBUY_EQUIP_ENHANCE] =
{
	89,90,
}

-- 小宇宙占星界面
GShop_QuickBuy_Goods[QUICKBUY_COSMOS_ASTROLOGY] =
{
	95,
}

-- 套装标识重随机界面
GShop_QuickBuy_Goods[QUICKBUY_SUIT_TAG_REFRESH] =
{
	456, 457, 458, 
}
