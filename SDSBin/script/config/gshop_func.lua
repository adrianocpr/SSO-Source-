---------------------------------------------------------------
--  created:   2013.2.22
--  author:    chenfudun
--
--  商城相关接口
---------------------------------------------------------------	


---------------------------------------------------------------
-- 商城物品图标
---------------------------------------------------------------
GShop_Dir_Icons_Func = {}

function GShop_Dir_Icons_Func:Get_Dir_Icon_Name(dirName)
    if not GShop_Dir_Icons_Root_Path or not GShop_Dir_Icons or type(GShop_Dir_Icons) ~= "table"  or not GShop_Dir_Icons[dirName] then
        return ""
    end
    
    local root_path = GShop_Dir_Icons_Root_Path
	return root_path .. GShop_Dir_Icons[dirName]
end


---------------------------------------------------------------
-- 快速购买
---------------------------------------------------------------
GShop_QuickBuy_Func = {}

function GShop_QuickBuy_Func:Get_QuickBuy_Goods(quickbuy_type)
	local quickbuy_type = quickbuy_type or 0
	local goods_list = GShop_QuickBuy_Goods[quickbuy_type]

	return goods_list
end