---------------------------------------------------------------
--  created:   2012.5.15
--  author:    chenfudun
--
--  背包整理 ID 顺序表
---------------------------------------------------------------
local item_classify = auction_data
local item_intro	= ItemIntro

-- 策划配置
-- 顺序表的序列编号建议顺序编号
bag_arrange_data = {}
bag_arrange_data[1] = 
{ 
	main = 20, 
	sub  = 20, 
	leaf = 0, 
	ids  = 
	{ 359, 360, 362, 467, 468, 469, 470, 471, 472, 473 } 
}

bag_arrange_data[2] = 
{ 
	main = 5, 
	sub  = 1, 
	leaf = 0, 
	ids  = 
	{ 512, 513, 514, 515, 516, 517, 518 } 
}

bag_arrange_data[3] = 
{ 
	main = 0, 
	sub  = 0, 
	leaf = 0, 
	ids  = 
	{ 30, 65, 66, 70 } 
}

-- 程序逻辑
function bag_arrange_data:GetClassify(main, sub, leaf, id)
    local int class = -1
    local int sub_class = -1    
    for k1,arrange in ipairs(bag_arrange_data) do
        if arrange.main == main and arrange.sub == sub and arrange.leaf == leaf then
            class = k1
        	for k2,_id in ipairs(arrange.ids) do
        		if _id == id then
        	    	sub_class = k2
        	    	return class, sub_class
        		end
        	end
        end
    end
    return class, sub_class
end

-- 获取物品分类名称
function bag_arrange_data:GetName(main, sub, leaf)
    for _, classify in ipairs(item_classify) do
        if classify.main == main and classify.sub == sub and classify.leaf == leaf then
            return classify.name
        end
    end     
    return _t"其他"
end

-- 获取物品简介
function bag_arrange_data:GetIntro(id)
    local itemIntro = ItemIntro[id]
    if not itemIntro then
		itemIntro = _t"暂无"
    end     
    return itemIntro    
end