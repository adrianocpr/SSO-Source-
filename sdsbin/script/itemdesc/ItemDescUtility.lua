----------------------------------------------
-- 将所有工具函数封装到模块mod_utility

module("ModUtility", package.seeall)
local string, table = string, table
local Format = string.format
local Insert = table.insert
local Concat = table.concat
local Len	 = string.len
local Addon_Func = Addon_Func
local SetStringText  = format_string.SetStringText
local formatString   = format_string.formatString


local CONTEXT_DEFAULT			= 0 	--	普通
local CONTEXT_EQUIP_ATTRIBUTE	= 1		--	需要显示装备属性
local CONTEXT_BOOTH_BUY		= 2			--	摊主购买，简单描述+设定价
local CONTEXT_BOOTH_SELL	= 3			--	摊主出售，详细描述+设定价

local CONTEXT_NPC_BUY 		= 1		--	Buy from NPC
local CONTEXT_NPC_SELL 		= 2		--	Sell to NPC


local CONTEXT_REWARD		= 5		--	Task reward 任务奖励
local CONTEXT_PRODUCE		= 6		--	Produced 制造
local CONTEXT_REPAIR		= 7		--	Repair  修复
local CONTEXT_TRADE			= 8		--	Player trade  玩家间交易
local CONTEXT_VENDUE		= 9		--	Vendue
local CONTEXT_RECYCLE		= 10	--	Recycle pack
local CONTEXT_VIEW			= 11	--	View other people  查看其他人
local CONTEXT_SHOP			= 12	--	Buy from shop    在商城中察看
local CONTEXT_DEAL			= 13	--	Goods trade Goods 在物物交易
local CONTEXT_LOOT	        = 14 	--  Loot table 掉落表
local CONTEXT_DECOMPOSE		= 15	--	装备拆分界面


-------------------------------------
--		local function
-------------------------------------
-- 获取某单位价格的描述字符串
local function GetPriceNumStr(num,level,bind)
	if num >= 1 then
    	local img = ResourceConfig:GetMoneyPic(level, bind == 1)
    	if img then
    	    local strUnit = DlgApiEx.GetImageString(img, ICONS_HINT)
    	    if  strUnit then
    	        return Format("%s%d", strUnit, num)
    	    end
    	end
	end
	return ""
end


-- 获带单位的价格描述
local function GetPriceText(nPrice,ItemDescTab,bind,level)
	if nPrice > 0 then
	    level = level or 3
	    local list = {}
		Insert(list, GetPriceNumStr(nPrice, level, bind))
		--Insert(list, GetPriceNumStr(nPrice / 10000, 3, bind))
		--Insert(list, GetPriceNumStr((nPrice / 100) % 100, 2, bind))
		--Insert(list, GetPriceNumStr(nPrice % 100, 1, bind))
	 	return Concat(list)
	end
	return ITEM_PRICE_DESC.Empty
end

local function addStringSub(str,substr)
	if (not string.find(str,"\r")) then
	    return substr .. str
	end
	local temp = ""
	local ss
	local i,j = 0,0
	while true do
	    j = i
	    i = string.find(str,"\r",i+1)
	    if i == nil then
	        break
	    end
	    ss = string.sub(str,j+1,i-1)
	    temp = temp .. substr.. ss .. "\r"
	end
	ss = string.sub(str,j+1,Len(str))
	return temp .. substr .. ss
end



-------------------------------------
--		通用属性
-------------------------------------
-- 获取名称数目颜色的描述文本
function GetNameCountText(ItemDescTab)
    if Len(ItemDescTab.name) == 0 then
    	return ""
    end
    local nColor = LuaItemDesc:GetItemColor(ItemDescTab.id, ItemDescTab.quality)
    local strNameCnt = Format("^%06x%s%s%s", nColor, ITEM_SIZE_DESC.Size12A, Format(ITEM_NAME_DESC.Name, ItemDescTab.name), STRING_TABLE.ITEMDESC_COL_WHITE)
	return strNameCnt .. Format(ITEM_SIZE_DESC.Size10)..Format("\r")
end


function GetErrorText(ItemDescTab)
    local errorMsg = ItemDescTab.error or ""

    if Len(errorMsg) > 0 then
        return Format("^%06x%s^N", COLOR_RED, errorMsg);
    end
    return ""
end

function GetEndureText(ItemDescTab)
    --ItemDescTab.context==CONTEXT_LOOT  CONTEXT_NPC_BUY CONTEXT_REWARD
	if not ItemDescTab.endure_max or ItemDescTab.endure_max == 0 then
    	return ""
    end
    if ItemDescTab.equip_type ==6 then
    	return ""
    end
    if ItemDescTab.context == CONTEXT_LOOT  or ItemDescTab.context == CONTEXT_NPC_BUY or ItemDescTab.context == CONTEXT_REWARD then
        return Format(ITEM_ENDURE_DESC.Endure,ITEM_COLOR_DESC.White,math.ceil(ItemDescTab.endure_max/10),math.ceil(ItemDescTab.endure_max/10))
    elseif ItemDescTab.endure == 0 then
        return Format(ITEM_ENDURE_DESC.Endure,ITEM_COLOR_DESC.Red,math.ceil(ItemDescTab.endure/10),math.ceil(ItemDescTab.endure_max/10))
    else
        return Format(ITEM_ENDURE_DESC.Endure,ITEM_COLOR_DESC.White,math.ceil(ItemDescTab.endure/10),math.ceil(ItemDescTab.endure_max/10))
    end
end


function GetTaskExpText(tab)
	local desc = {}
	if tab.is_show_award_hint then 
		if tab.is_show_award_hint == 1 and tab.award then
			if tab.award.exp > 0 then
				Insert(desc, string.format(ITEM_TASK_TRIG_DESC.EXP,tab.award.exp))	
			end
			if tab.award.stored_exp > 0 then
				Insert(desc, string.format(ITEM_TASK_TRIG_DESC.STORE_EXP, tab.award.stored_exp))
			end
			if tab.award.exp2 > 0 then
				Insert(desc, string.format(ITEM_TASK_TRIG_DESC.EXP2,tab.award.exp2))	
			end
			if tab.award.stored_exp2 > 0 then
				Insert(desc, string.format(ITEM_TASK_TRIG_DESC.STORE_EXP2, tab.award.stored_exp2))
			end
			if tab.award.bind_money > 0 then
				Insert(desc, string.format(ITEM_TASK_TRIG_DESC.BIND_MONEY, tab.award.bind_money))
			end
			if table.maxn(desc) == 0 then
				return ""
			else
				return Concat(desc)
			end
		else
			return ""
		end
	else
		return ""
	end
end

function GetTaskFinishCount(tab)
	if tab.is_show_task_count_hint == 1 then
		--tab.tash_counter
		return ITEM_COLOR_DESC.LightBlue .. string.format(ITEM_TASK_TRIG_DESC.TASK_FINISH_COUNT, tab.task_counter_max-tab.task_counter)
	else
		return ""
	end
end


local t =  --礼包id和声望id对应列表
{
    [44148] = 32,
    [44149] = 48,
    [44150] = 50,
}
function GetTaskFinishDate(tab)    
    if t[tab.id] == nil then
        return ""
    else
        local repuid = t[tab.id]
        local repu_value = GameApi.GetHostRepuValue(repuid)        
        if not repu_value then
        	return ""
        end
        local table_server_time = GlobalApi.GetServerLocalTime()
        local str_server_time = math.floor((os.time(table_server_time) + 60 * 60 * 8)/(60 * 60 * 24))
        if repu_value >= str_server_time then
            return ITEM_TASK_TRIG_DESC.TASK_TIME_LIMIT
        end        
        return ""
    end
end



-- 获取绑定状态描述文本
local NotShowBoundContent =
{
   [CONTEXT_NPC_BUY] = true,
   [CONTEXT_BOOTH_BUY] = true,
   [CONTEXT_PRODUCE] = true,CONTEXT_LOOT,
   [CONTEXT_SHOP] = true,
   [CONTEXT_RECYCLE] = true,
   [CONTEXT_LOOT] = true,
}
function GetBoundStateText(ItemDescTab)
	if not NotShowBoundContent[ItemDescTab.context] and ItemDescTab.bound then
		return ITEM_COLOR_DESC.Gray ..Format(ITEM_BOUND_DESC.Bound)
	end
	return ""
end



local ITEM_PROC_TYPE_NOSELL			= 1		--无法卖给NPC   down
local ITEM_PROC_TYPE_NOTRADE  		= 2		--玩家间不能交易
local ITEM_PROC_TYPE_CASHITEM 		= 3		--是人民币物品
local ITEM_PROC_TYPE_TASKITEM 		= 4		--是任务物品
local ITEM_PROC_TYPE_BIND2			= 5		--装备即绑定的物品
local ITEM_PROC_TYPE_BIND			= 6		--是已经绑定的物品
local ITEM_PROC_TYPE_NO_DEPOSIT		= 7		--不可存放仓库
local ITEM_PROC_TYPE_NODESTROY		= 8		--不允许销毁
local ITEM_PROC_TYPE_AUTO_DEL		= 9		--离开特定区域删除
local ITEM_PROC_TYPE_DROP 			= 10	--红名死亡时掉落
local ITEM_PROC_TYPE_PICKBIND		= 11    --拾取绑定
local ITEM_PROC_NUM = ITEM_PROC_TYPE_PICKBIND -- 处理方式数量

--物品状态描述
function GetProcMask(ItemDescTab)
    -- 限制携带上限的物品, 默认为不可存放仓库的
    if ItemDescTab.max_hold and ItemDescTab.max_hold > 0 then
        ItemDescTab[Format("proc_mask_%d", ITEM_PROC_TYPE_NO_DEPOSIT)] = true
    end

	local list = {}
    for i= 1, ITEM_PROC_NUM do
        if (ItemDescTab[Format("proc_mask_%d", i)]) then
            if(ItemDescTab.bound == true) then
                if ITEM_PROC_MASK_DESC[Format("Mask_Bound%d", i)] then
                	Insert(list, ITEM_COLOR_DESC.Gray)
           			Insert(list, ITEM_PROC_MASK_DESC[Format("Mask_Bound%d", i)] )
                end
        	else 
                -- 服务器认定非绑定且模板中没有勾选“直接绑定”才进行如下处理
        	    if i ~= 6 and ITEM_PROC_MASK_DESC[Format("Mask%d", i)] then
        	    	Insert(list, ITEM_COLOR_DESC.Gray)
        	    	Insert(list, ITEM_PROC_MASK_DESC[Format("Mask%d", i)] )
            	end
    		end
	   	end
    end
	return Concat(list)
end


-- 转换时间的描述文本
function GetTimeText(nTime)
	local nDay = nTime / (24*3600)
    local nHour = (nTime % (24*3600)) / 3600
	local nMinute = (nTime % 3600) / 60
	local nSecond = nTime % 60

	local strColor = "White"
	local strExpireTime = ""
	if (nDay >= 1) then
	    strExpireTime = Format(ITEM_TIME_DESC.Day, nDay) .. Format(ITEM_TIME_DESC.Hour, nHour)
		color = "Blue"
	elseif (nHour >= 1) then
	    strExpireTime = Format(ITEM_TIME_DESC.Hour, nHour) .. Format(ITEM_TIME_DESC.Minute, nMinute)
		color = "Yellow"
	elseif (nMinute >= 1) then
   	    strExpireTime = Format(ITEM_TIME_DESC.Minute, nMinute) .. Format(ITEM_TIME_DESC.Second, nSecond)
		color = "LightPurple"
	else
		strExpireTime = Format(ITEM_TIME_DESC.Second, nSecond)
		color = "Red"
	end
	return Format(ITEM_COLOR_DESC[strColor]) .. strExpireTime .. Format(ITEM_COLOR_DESC.White) .. Format("\r")
end


-- 获取剩余时间的描述文本
function GetExpireTimeText(ItemDescTab)
    local nTime = ItemDescTab.expire_time
	if nTime and nTime > 0 then
	    return Format(ITEM_TIME_DESC.ExpireTime)..GetTimeText(ItemDescTab.expire_time)
	end
	return ""
end


-- 价格描述
local UnShowPriceMap =
{
--    [CONTEXT_REWARD] = true,
--    [CONTEXT_PRODUCE] = true,
--    [CONTEXT_VIEW] = true,
--    [CONTEXT_SHOP] = true,
--    [CONTEXT_NPC_BUY] = true,
--    [CONTEXT_DEAL] = true,
	[CONTEXT_DEFAULT] = false,
    [CONTEXT_BOOTH_SELL] =false,
    [CONTEXT_BOOTH_BUY] =false,
}
--local CONTEXT_DEFAULT			= 0 	--	普通
--local CONTEXT_EQUIP_ATTRIBUTE	= 1		--	需要显示装备属性
--local CONTEXT_BOOTH_BUY		= 2		--	摆摊购买


function GetContextPriceText(ItemDescTab)
    local context = ItemDescTab.context
    --	if UnShowPriceMap[context] or ItemDescTab.proc_mask_3 then
    --		return Format("")
    --	end
	--buy_bind_money 商店售价，金券
	--price 玩家摆摊的出售价（金币）
	--sell_bind_money 卖掉获得金券（绑定币）
	--shop_price 商店售价，金币
	local strConPrice = ""
	local total_sell_price = ItemDescTab.shop_price * ItemDescTab.count  --店卖价
	local total_buy_price = ItemDescTab.price * ItemDescTab.count  --卖店价（价格）
	local total_buy_cash = ItemDescTab.cash * ItemDescTab.count  --卖店价（元宝价格）
	local total_sell_bind_price = ItemDescTab.buy_bind_money * ItemDescTab.count  --店卖绑定价
	local total_buy_bind_price = ItemDescTab.sell_bind_money * ItemDescTab.count  --卖店绑定价（价格）
	if (context == CONTEXT_BOOTH_SELL or context == CONTEXT_BOOTH_BUY) then --摆摊
		if ( ItemDescTab.price > 0 ) then
			if (ItemDescTab.count == 0 or ItemDescTab.count == 1) then
				if(ItemDescTab.cash > 0) then
					strConPrice = Format(ITEM_PRICE_DESC.PriceTotalPrice2,GetPriceText(ItemDescTab.price,ItemDescTab,0),GetPriceText(ItemDescTab.cash,ItemDescTab,0,4))
				else
				    strConPrice = Format(ITEM_PRICE_DESC.PriceTotalPrice,GetPriceText(ItemDescTab.price,ItemDescTab,0))
				end
    		else
				if(ItemDescTab.cash > 0) then
					strConPrice = Format(ITEM_PRICE_DESC.PriceTotalPrice3, GetPriceText(ItemDescTab.price,ItemDescTab,0), GetPriceText(total_buy_price,ItemDescTab,0),GetPriceText(ItemDescTab.cash,ItemDescTab,0,4),GetPriceText(total_buy_cash,ItemDescTab,0,4))
				else
					strConPrice = Format(ITEM_PRICE_DESC.PriceTotalPrice1, GetPriceText(ItemDescTab.price,ItemDescTab,0), GetPriceText(total_buy_price,ItemDescTab,0))
				end
			end
		end
	else
	    if ( ItemDescTab.price > 0 ) then
			if (ItemDescTab.count == 0 or ItemDescTab.count == 1) then
				if(ItemDescTab.cash > 0) then
					strConPrice = Format(ITEM_PRICE_DESC.PriceTotalPrice2,GetPriceText(ItemDescTab.price,ItemDescTab,0),GetPriceText(ItemDescTab.cash,ItemDescTab,0,4))
				else
				    strConPrice = Format(ITEM_PRICE_DESC.PriceTotalPrice,GetPriceText(ItemDescTab.price,ItemDescTab,0))
				end
    		else
				if(ItemDescTab.cash > 0) then
					strConPrice = Format(ITEM_PRICE_DESC.PriceTotalPrice3, GetPriceText(ItemDescTab.price,ItemDescTab,0), GetPriceText(total_buy_price,ItemDescTab,0),GetPriceText(ItemDescTab.cash,ItemDescTab,0,4),GetPriceText(total_buy_cash,ItemDescTab,0,4))
				else
					strConPrice = Format(ITEM_PRICE_DESC.PriceTotalPrice1, GetPriceText(ItemDescTab.price,ItemDescTab,0), GetPriceText(total_buy_price,ItemDescTab,0))
				end
			end
		end
		if ( ItemDescTab.sell_bind_money > 0 ) then
			if (ItemDescTab.count == 0 or ItemDescTab.count == 1) then
    			strConPrice = strConPrice .. Format(ITEM_PRICE_DESC.PriceTotalPrice,GetPriceText(ItemDescTab.sell_bind_money,ItemDescTab,1))
    		else
    		    strConPrice = strConPrice .. Format(ITEM_PRICE_DESC.PriceTotalPrice1, GetPriceText(ItemDescTab.sell_bind_money,ItemDescTab,1), GetPriceText(total_buy_bind_price,ItemDescTab,1))
			end
		end
		
	end     
--	if (context == CONTEXT_REPAIR) then
--		if (ItemDescTab.price > 0 and ItemDescTab.price == ItemDescTab.shop_price) then
--		    strConPrice = Format(ITEM_PRICE_DESC.Repair, GetPriceText(ItemDescTab.price,ItemDescTab, 0))
--		end
--		if(ItemDescTab.sell_bind_money > 0 and ItemDescTab.sell_bind_money == ItemDescTab.buy_bind_money) then
--		    strConPrice = strConPrice .. Format(ITEM_PRICE_DESC.Repair, GetPriceText(ItemDescTab.sell_bind_money,ItemDescTab,1))
--		end
--	else
--		if(ItemDescTab.price > 0 or ItemDescTab.sell_bind_money > 0) then
--    		if (ItemDescTab.price > 0  ) then
--    		    if (ItemDescTab.count == 0 or ItemDescTab.count == 1) then
--    		    	strConPrice = Format(ITEM_PRICE_DESC.PriceTotalPrice,GetPriceText(ItemDescTab.price,ItemDescTab,0))
--    		 	else
--    		    	strConPrice = Format(ITEM_PRICE_DESC.PriceTotalPrice1, GetPriceText(ItemDescTab.price,ItemDescTab,0), GetPriceText(total_buy_price,ItemDescTab,0))
--    		    end
--    		end
--    		if(ItemDescTab.sell_bind_money > 0 and context~=CONTEXT_BOOTH_BUY and context~=CONTEXT_BOOTH_SELL ) then
--    		    if (ItemDescTab.count == 0 or ItemDescTab.count == 1) then
--    		    	strConPrice = strConPrice .. Format(ITEM_PRICE_DESC.PriceTotalPrice,GetPriceText(ItemDescTab.sell_bind_money,ItemDescTab,1))
--    		 	else
--    		   		strConPrice = strConPrice .. Format(ITEM_PRICE_DESC.PriceTotalPrice1, GetPriceText(ItemDescTab.sell_bind_money,ItemDescTab,1), GetPriceText(total_buy_bind_price,ItemDescTab,1))
--    		    end
--    		end
--		end
--	end
	return strConPrice
end


-- 获取等级要求描述
function GetReqLevel(ItemDescTab, only_senior)
    if ItemDescTab.req_level and ItemDescTab.req_level > 0 then
    	local HostPropEx = GameApi.GetHostPropEx()
        local base_lev   = math.min(ItemDescTab.req_level, USE_EXP2_LEV)
        local base_color = (base_lev > HostPropEx.level) and ITEM_COLOR_DESC.Red or ITEM_COLOR_DESC.White
        local base_str   = base_color .. Format(ITEM_REQ_LEVEL_DESC.ReqLevel, base_lev) .. Format(ITEM_COLOR_DESC.White)
        if ItemDescTab.req_level > USE_EXP2_LEV then
            local senior_color = (ItemDescTab.req_level > HostPropEx.level) and ITEM_COLOR_DESC.Red or ITEM_COLOR_DESC.White
            local senior_str   = senior_color .. Format(ITEM_REQ_LEVEL_DESC.ReqLevel2, ItemDescTab.req_level - USE_EXP2_LEV) .. Format(ITEM_COLOR_DESC.White)
            if only_senior then
                return senior_str
            else
    	       return base_str .. senior_str
           end
        else
            return base_str
        end
    end
    return ""
end


function GetReqCosmosLevel(ItemDescTab)
     if ItemDescTab.req_cosmos_level and ItemDescTab.req_cosmos_level>0 then
        local HostPropEx=GameApi.GetHostPropEx()
		if (ItemDescTab.req_cosmos_level > HostPropEx.cosmos_level) then
    		return Format(ITEM_COLOR_DESC.Red)..Format(ITEM_REQ_COSMOS_LEVEL_DESC.ReqCosmosLevel,ItemDescTab.req_cosmos_level)..Format(ITEM_COLOR_DESC.White)
    	else
    	    return Format(ITEM_REQ_COSMOS_LEVEL_DESC.ReqCosmosLevel,ItemDescTab.req_cosmos_level)
		end
     end
     return ""
end






-- 获取剩余冷却时间的描述文本
function GetExpireColddownTime(ItemDescTab)
    local nTime = ItemDescTab.colddown_time
	if (nTime and nTime > 0) then
	    return Format(ITEM_TIME_DESC.ExpireColddownTime)..GetTimeText(ItemDescTab.colddown_time / 1000)
	end
	return ""
end


-- 获取冷却时间的描述文本
function GetColddownTime(ItemDescTab)
    if(ItemDescTab.current_area == 1) then
        local nTime = ItemDescTab.colddown_time_world
    	if (nTime and nTime > 0) then
    	    return Format(ITEM_TIME_DESC.ColddownTime)..GetTimeText(ItemDescTab.colddown_time_world /1000)
    	end
	else
		local nTime = ItemDescTab.colddown_time_copy
    	if (nTime and nTime > 0) then
    	    return Format(ITEM_TIME_DESC.ColddownTime)..GetTimeText(ItemDescTab.colddown_time_copy /1000)
    	end
	end
	return ""
end


-- 最大携带上限
function GetMaxHoldText(ItemDescTab)
    if ItemDescTab.max_hold and ItemDescTab.max_hold > 0 then
        return Format(ITEM_COUNT_DESC.MaxHold, ITEM_SIZE_DESC.Size12A, ItemDescTab.max_hold)
    end
    return nil
end





-------------------------------------
--		专有属性
-------------------------------------
function GetComposeText(ItemDescTab)
	if(ItemDescTab.can_decompose == false) then
		return ITEM_COLOR_DESC.Gray .. ITEM_COMPOSE_DESC["CANNOT"]
	end
	return ""
end




--获取星魂石的名字数量
local SoulStoneColor =
{
    [1]=ITEM_COLOR_DESC.Green,
    [2]=ITEM_COLOR_DESC.Green,
    [3]=ITEM_COLOR_DESC.Green,
    [4]=ITEM_COLOR_DESC.Blue,
    [5]=ITEM_COLOR_DESC.Blue,
    [6]=ITEM_COLOR_DESC.Blue,
    [7]=ITEM_COLOR_DESC.Purple,
    [8]=ITEM_COLOR_DESC.Purple,
    [9]=ITEM_COLOR_DESC.Orange,
}
function GetSoulStoneNameCountText(ItemDescTab)
    if Len(ItemDescTab.name) == 0 then
    	return ""
    end

    local nColor = SoulStoneColor[ItemDescTab.stone_quality] or ITEM_COLOR_DESC.Orange
    local strNameCnt = Format("%s%s%s", nColor, ITEM_SIZE_DESC.Size12, Format(ITEM_NAME_DESC.Name, ItemDescTab.name))
	if (ItemDescTab.count > 1) then
		strNameCnt = strNameCnt .. Format(ITEM_COUNT_DESC.Count, ItemDescTab.count)
	end
	strNameCnt = strNameCnt .. Format(ITEM_SIZE_DESC.Size10)..Format("\r")
	return strNameCnt
end


--获取星魂石的附加属性
function GetSoulStoneAddon(ItemDescTab)
    local addon_desc = Addon_Func:GetAddonPackageDesc(ItemDescTab.addon_desc)     
    return Format(ITEM_SOUL_STONE.StrAddon,ItemDescTab.addon_desc)
end

--获取星魂石品质
function GetSoulStoneQuality(ItemDescTab)
    return Format(ITEM_SOUL_STONE.Quality,ItemDescTab.stone_quality)
end

--获取星魂石光泽度
function GetSoulStoneLight(ItemDescTab)
    local strCurBright=Format(ITEM_SOUL_STONE.CurBright,ItemDescTab.bright)
    local strInitBright=Format(ITEM_SOUL_STONE.InitBright,ItemDescTab.init_bright)
    return strCurBright..strInitBright
end

--星魂石提升道具
function GetStarSoulStoneDesc(ItemDescTab)
	local lvlmax=ItemDescTab.max_bright_limit
	local num1=ItemDescTab.bright_add1
	local num2=ItemDescTab.bright_add2
	local nColor = ITEM_COLOR_DESC.White
	return Format(ITEM_SOUL_STAR_STONE_LEVEL_UP.Desc,nColor,num1,num2,lvlmax)
end



--是否学会配方描述文本
function GetLearnedText(ItemDescTab)
	if ItemDescTab.have_learned == true then
		return Format(ITEM_COLOR_DESC.Red)..Format(ITEM_LEARNED_DESC.Learned).. Format(ITEM_COLOR_DESC.White)
	end
	return ""
end

--获取配方归属生活技能及配方等级
function GetRecipeText(ItemDescTab)
    if (ItemDescTab.life_skill_type and string.len(ItemDescTab.life_skill_type) > 0) then
        return Format(ITEM_NAME_DESC.NameLevel, ItemDescTab.life_skill_type,ItemDescTab.learn_need_live_skill_lvl).."\r"
    end
    return ""
end

--学习要求玩家等级
function GetRecipePlayerLev(ItemDescTab)
    if ItemDescTab.learn_need_player_lvl and ItemDescTab.learn_need_player_lvl > 0 then
        local str = format_string:player_lev(ItemDescTab.learn_need_player_lvl, true)
        return Format(ITEM_RECIPE_DESC.PlayerLev, str)
    end
    return ""
end

--学习消耗经验
function GetRecipeExp(ItemDescTab)
    if ItemDescTab.learn_need_money and ItemDescTab.learn_need_money>0 then
        return Format(ITEM_RECIPE_DESC.Exp, ItemDescTab.learn_need_money).."\r"
    end
    return ""
end

--学习消耗金钱
function GetRecipePlayerCoin(ItemDescTab)
    if ItemDescTab.learn_need_exp and ItemDescTab.learn_need_exp>0 then
        return Format(ITEM_RECIPE_DESC.Coin, ItemDescTab.learn_need_exp).."\r"
    end
    return ""
end



--显示有效期
function GetValidTimeText(ItemDescTab)
	if (ItemDescTab.valid_time > 0) then
	    return Format(ITEM_TIME_DESC.ValidTime)..GetTimeText(ItemDescTab.valid_time)
	end
	return ""
end



-- 是否多人骑乘
function GetMoreSeaterRides(ItemDescTab)
	if ItemDescTab.more_seater_rides  then
		return Format(ITEM_MORE_SEATER_RIDES_DESC.MoreSeaterRides)
	else
	    return Format(ITEM_MORE_SEATER_RIDES_DESC.SingleSeaterRide)
	end
end

-- 是否可进行攻击
function GetRidesAttack(ItemDescTab)
	if ItemDescTab.rides_attack  then
		return "???" --Format(ITEM_RIDES_ATTACK_DESC.rides_attack)
	end
	return ""
end

-- 移动速度
function GetMoveSpeed(ItemDescTab)
    local nColor = LuaItemDesc:GetItemColor(ItemDescTab.id, ItemDescTab.quality)
    if Len(ItemDescTab.move_speed) > 0 then
    	return Format(ITEM_MOVE_SPEED_DESC.MoveSpeed, nColor, ItemDescTab.move_speed)
	end
	return ""
end

-- 飞行速度
function GetFlyMoveSpeed(ItemDescTab)
	local nColor = LuaItemDesc:GetItemColor(ItemDescTab.id, ItemDescTab.quality)
	if Len(ItemDescTab.fly_speed) > 0 then
		return Format(ITEM_MOVE_SPEED_DESC.FlyMoveSpeed, nColor, ItemDescTab.fly_speed)
	end
	return ""
end

--分解信息
function GetDeCompseText(ItemDescTab)
	if ItemDescTab.decompse==nil then
	    return ""
	end
	local name=GameApi.GetItemName(ItemDescTab.decompse,true)
	if name==nil or name=="" then
	    return ""
	end
	return Format(ITEM_DECOMPSE.Item,ITEM_COLOR_DESC.White,name,ITEM_COLOR_DESC.White)

end



--[[
-- 应用区域
function GetValidArea(ItemDescTab)
    local strValidArea = ""
	if (ItemDescTab.valid_area == 0 ) then
    	return Format("")
    	end
	if (ItemDescTab.valid_area == 1 ) then
		if (ItemDescTab.current_area == 1) then
    		strValidArea=strValidArea..Format(ITEM_COLOR_DESC.Red)..Format(ITEM_VALID_AREA_DESC.ValidArea,ItemDescTab.valid_area)..Format(ITEM_COLOR_DESC.White)
    	else
    	    strValidArea=strValidArea..Format(ITEM_VALID_AREA_DESC.ValidArea,ItemDescTab.valid_area)
		end
	else
		if (ItemDescTab.current_area == 2) then
    		strValidArea=strValidArea..Format(ITEM_COLOR_DESC.Red)..Format(ITEM_VALID_AREA_DESC.ValidArea,ItemDescTab.valid_area)..Format(ITEM_COLOR_DESC.White)
    	else
    	    strValidArea=strValidArea..Format(ITEM_VALID_AREA_DESC.ValidArea,ItemDescTab.valid_area)
		end
	end
	return strValidArea
end
--]]

-- 药品类型
function GetMedicineType(ItemDescTab)

    local nTypeId = ItemDescTab.medicine_type
 	local total_medicine_add_hp = ItemDescTab.medicine_add_hp2 + ItemDescTab.medicine_add_hp3 + ItemDescTab.medicine_add_hp4
  	local total_medicine_add_mp = ItemDescTab.medicine_add_mp2 + ItemDescTab.medicine_add_mp3 + ItemDescTab.medicine_add_mp4

   	--瞬回HP 大药
	if (nTypeId == 0 ) then
		return Format(ITEM_MEDICINE_TYPE_DESC.MedicineType0,ItemDescTab.medicine_add_hp1,ItemDescTab.medicine_hp_max,ItemDescTab.medicine_hp_left)
	--瞬回MP 大药
    elseif (nTypeId == 1) then
		return Format(ITEM_MEDICINE_TYPE_DESC.MedicineType1,ItemDescTab.medicine_add_mp1,ItemDescTab.medicine_mp_max,ItemDescTab.medicine_mp_left)
	--瞬回HP及MP 大药
    elseif (nTypeId == 2) then
		return Format(ITEM_MEDICINE_TYPE_DESC.MedicineType2,ItemDescTab.medicine_add_hp1,ItemDescTab.medicine_add_mp1,ItemDescTab.medicine_hp_max,ItemDescTab.medicine_mp_max,ItemDescTab.medicine_hp_left,ItemDescTab.medicine_mp_left)
	--持续回HP 小药
    elseif (nTypeId == 3 ) then
        if ItemDescTab.medicine_add_hp2 == 0 and  ItemDescTab.medicine_add_hp3 == 0 and ItemDescTab.medicine_add_hp4 == 0 then
		   return Format(ITEM_MEDICINE_TYPE_DESC.MedicineType3A,ItemDescTab.medicine_add_hp1)
	    else
		   return Format(ITEM_MEDICINE_TYPE_DESC.MedicineType3,ItemDescTab.medicine_add_hp1,total_medicine_add_hp)
		end
	--持续回MP 小药
    elseif (nTypeId == 4 ) then
        if ItemDescTab.medicine_add_mp2 == 0 and  ItemDescTab.medicine_add_mp3 == 0 and ItemDescTab.medicine_add_mp4 == 0 then
		   	return Format(ITEM_MEDICINE_TYPE_DESC.MedicineType4A,ItemDescTab.medicine_add_mp1)
		else
		  	return Format(ITEM_MEDICINE_TYPE_DESC.MedicineType4,ItemDescTab.medicine_add_mp1,total_medicine_add_mp)
        end
    --持续回HP及MP 小药
    elseif (nTypeId == 5) then
        if ItemDescTab.medicine_add_hp2 == 0 and  ItemDescTab.medicine_add_hp3 == 0 and ItemDescTab.medicine_add_hp4 == 0 and
           ItemDescTab.medicine_add_mp2 == 0 and  ItemDescTab.medicine_add_mp3 == 0 and ItemDescTab.medicine_add_mp4 == 0 then
		   	return Format(ITEM_MEDICINE_TYPE_DESC.MedicineType5A,ItemDescTab.medicine_add_hp1,ItemDescTab.medicine_add_mp1)
		else
		  	return Format(ITEM_MEDICINE_TYPE_DESC.MedicineType5,ItemDescTab.medicine_add_hp1,ItemDescTab.medicine_add_mp1,total_medicine_add_hp,total_medicine_add_mp)
        end
    elseif (nTypeId == 6) then
		if ItemDescTab.context == 1 then
			return Format(ITEM_MEDICINE_TYPE_DESC.MedicineType6A,ItemDescTab.medicine_add_hp1,ItemDescTab.medicine_hp_max_percent*100)
		else
			return Format(ITEM_MEDICINE_TYPE_DESC.MedicineType6,ItemDescTab.medicine_add_hp1,ItemDescTab.medicine_hp_max_percent*100,ItemDescTab.medicine_hp_left)
		end
    elseif (nTypeId == 7) then
		return Format(ITEM_MEDICINE_TYPE_DESC.MedicineType7,ItemDescTab.medicine_type)
	end
	return ""
end

function GetGuardPoint(ItemDescTab)
	if ItemDescTab.guard_point then
	    return Format(ITEM_GUARD_STAR.GuardPoint,ItemDescTab.guard_point)
	else
	   	return ""
	end
end

function GetUsableGuardLevel(ItemDescTab)
   local str
   str=""
   if ItemDescTab.star_level_min~=0 then
       str= Format(ITEM_GUARD_STAR.GuardLevel1,ItemDescTab.star_level_min)
   end
       str=str..Format(ITEM_GUARD_STAR.GuardLevel2,ItemDescTab.star_level_max)
   return str
end



--获取星魂的名字数量
local StarSoulColor =
{
    [1]=ITEM_COLOR_DESC.White,
    [2]=ITEM_COLOR_DESC.Green,
    [3]=ITEM_COLOR_DESC.Blue,
    [4]=ITEM_COLOR_DESC.Purple,
    [5]=ITEM_COLOR_DESC.Orange,
    [6]=ITEM_COLOR_DESC.Yellow,
    [7]=ITEM_COLOR_DESC.Yellow,
    [8]=ITEM_COLOR_DESC.Yellow,
    [9]=ITEM_COLOR_DESC.Yellow,
}
function GetStarSoulNameCountText(ItemDescTab)
    if Len(ItemDescTab.name) == 0 then
    	return ""
    end

    local nColor = StarSoulColor[ItemDescTab.quality] or ITEM_COLOR_DESC.Orange
    local strNameCnt = Format("%s%s%s", nColor, ITEM_SIZE_DESC.Size12, Format(ITEM_NAME_DESC.Name, ItemDescTab.name))
	if (ItemDescTab.count > 1) then
		strNameCnt = strNameCnt .. Format(ITEM_COUNT_DESC.Count, ItemDescTab.count)
	end
	return strNameCnt
end

function GetStarSoulFightPower(ItemDescTab)
	if ItemDescTab.fight_power > 0 then
		return Format( ITEM_SIZE_DESC.Size12 .. ITEM_COLOR_DESC.Yellow .. FIGHT_POWER, ItemDescTab.fight_power)
	else
		return STAR_SOUL_FIGHT_POWER_NULL
	end
end

function GetStarSoulColor(ItemDescTab)
	local color=""
	for i= 1 ,3 do
        if	MaskIn(i,ItemDescTab.color) then
    		color=color..STAR_SOUL_COLOR[i]
        end
	end
	if color ~= "" then
		return Format(_t"·") .. color .. Format(_t"\r")
    else
		return "" .. Format(_t"\r")
	end
end

function toBytes(num)
	local result = {}
	while num > 0 do
		table.insert(result,num%2)
		num = (num - num % 2) / 2
	end
	return table.concat(result)
end


---n:勾选第几位
---m:要确定的数字
function MaskIn(n, m)
	local str = toBytes(m)
	if string.sub(str,n,n+1) == "1" then
		return true
	else
		return false
	end
end

function GetStarSoulLevelExp(ItemDescTab)
	local strlist = {} --tab.cur_exp, tab.lev_up_exp  star_soul_lev
	if ItemDescTab.star_soul_lev then
	    Insert(strlist, ITEM_COLOR_DESC.Yellow .. Format(STAR_SOUL_LEV_EXP1, ITEM_COLOR_DESC.Green, ItemDescTab.star_soul_lev))
	end
	if ItemDescTab.cur_exp and ItemDescTab.lev_up_exp then
	    Insert(strlist, ITEM_COLOR_DESC.Yellow .. Format(STAR_SOUL_LEV_EXP2, ITEM_COLOR_DESC.Green, ItemDescTab.cur_exp, ITEM_COLOR_DESC.Yellow, ItemDescTab.lev_up_exp))
	end
	return Concat(strlist)
end

function GetConflictHint(ItemDescTab)
--STAR_SOUL_CLASS[tab.conflict_id]
--STAR_SOUL_CLASS_HINT
	if ItemDescTab.conflict_id then
	    if STAR_SOUL_CLASS[ItemDescTab.conflict_id] ~= "" then
	        return ITEM_SIZE_DESC.Size10 .. ITEM_COLOR_DESC.White .. Format(STAR_SOUL_CLASS_HINT, ITEM_COLOR_DESC.Yellow .. STAR_SOUL_CLASS[ItemDescTab.conflict_id] .. ITEM_COLOR_DESC.White)
	    end
	end
	return ""
end

function GetStarSoulAddon(ItemDescTab, isNext)
    local nColor = StarSoulColor[ItemDescTab.quality] or ITEM_COLOR_DESC.Orange        
    local addonPack
    if isNext then
        addonPack = Addon_Func:GetAddonPackageDesc(ItemDescTab.next_addon_pack)
    else
        addonPack = Addon_Func:GetAddonPackageDesc(ItemDescTab.addon_pack)
    end
    if addonPack and Len(addonPack) > 0 then
        return Format(ITEM_COLOR_DESC.Yellow .. STAR_SOUL_ADDON_PACK, nColor .. SetStringText(addonPack,1))
    end
    return ""
end


function GetStarSoulBurstAddon(ItemDescTab,isNext)
    local burst_pack_desc = Addon_Func:GetAddonPackageDesc(ItemDescTab.burst_addon_pack) 
    local next_burst_pack_desc = Addon_Func:GetAddonPackageDesc(ItemDescTab.next_burst_addon_pack) 
    local burstAddonPack = isNext and next_burst_pack_desc or burst_pack_desc
    if burstAddonPack and Len(burstAddonPack) > 0 then
--    local nColor = StarSoulColor[ItemDescTab.quality] or ITEM_COLOR_DESC.Orange
        return Format(ITEM_COLOR_DESC.Red .. STAR_SOUL_BURST_ADDON_PACK, ITEM_COLOR_DESC.Red .. SetStringText(burstAddonPack,1))
    else
        return Format(_t"（空）")
    end
end

function GetStarSoulBurstBuff(ItemDescTab, isNext)
    local burstBuffPack = isNext and ItemDescTab.next_burst_buff_pack or ItemDescTab.burst_buff_pack
    local burstBuffLevel = isNext and ItemDescTab.next_burst_level or ItemDescTab.burst_level
	if not burstBuffPack or burstAddonPack == 0 or not burstBuffLevel then
		return ""
	end

	local desc = skill_man:GetBuffDesc(burstBuffPack)
	if tostring(desc) == "" then return "" end
	return Format(ITEM_COLOR_DESC.Red..STAR_SOUL_BURST_BUFF_PACK, desc, burstBuffLevel)
end

function GetTaskDiceLeagueDesc(ItemDescTab)
    return ItemDescTab.task_dice_league_desc or ""
end

--宠物装备说明
function GetCombatpetEquipDesc(ItemDescTab)
    return ITEM_COMBATPET_EQUIP_DESC.DESC
end

--宠物装备部位
function GetCombatpetEquipPartType(ItemDescTab)
   if ItemDescTab.part_type and ItemDescTab.part_type == 0 then	
   		return Format(ITEM_COMBATPET_EQUIP_DESC.Part_Type_Head,ItemDescTab.part_type)
   elseif ItemDescTab.part_type and ItemDescTab.part_type ==1 then
   		return Format(ITEM_COMBATPET_EQUIP_DESC.Part_Type_Hair,ItemDescTab.part_type)
   elseif ItemDescTab.part_type and ItemDescTab.part_type ==2 then
   		return Format(ITEM_COMBATPET_EQUIP_DESC.Part_Type_Body,ItemDescTab.part_type)
   else
   		return ""
   end
end

--宠物装备性别
function GetCombatpetEquipGender(ItemDescTab)
	if ItemDescTab.gender and ItemDescTab.gender == 0 then
		return Format(ITEM_COMBATPET_EQUIP_DESC.Gender_Male,ItemDescTab.gender)
	elseif ItemDescTab.gender and ItemDescTab.gender == 1 then
		return Format(ITEM_COMBATPET_EQUIP_DESC.Gender_Female,ItemDescTab.gender)
	else
		return ""
	end
end

--宠物装备要求等级
function GetCombatpetEquipLevelReq(ItemDescTab)
	if ItemDescTab.level_req and ItemDescTab.level_req > 0 then
		return Format(ITEM_COMBATPET_EQUIP_DESC.LevelReq,ItemDescTab.level_req)
	else
		return ""
	end
end

--宠物装备附带攻击力
function GetCombatpetEquipAttack(ItemDescTab)
	if ItemDescTab.attack and ItemDescTab.attack > 0 then
	    local nColor = LuaItemDesc:GetItemColor(ItemDescTab.id, ItemDescTab.quality)
		return Format("^%06x", nColor) .. Format(ITEM_COMBATPET_EQUIP_DESC.Attack,ItemDescTab.attack)
	else
		return ""
	end
end

--宠物装备属性附带攻击力
function GetCombatpetEquipElementAttack(ItemDescTab)
	if ItemDescTab.element_attack and ItemDescTab.element_attack > 0 then
	    local nColor = LuaItemDesc:GetItemColor(ItemDescTab.id, ItemDescTab.quality)
		return Format("^%06x", nColor) .. Format(ITEM_COMBATPET_EQUIP_DESC.ElementAttack,ItemDescTab.element_attack)
	else
		return ""
	end
end

--宠物装备附带命中
function GetCombatpetEquipHit(ItemDescTab)
	if ItemDescTab.hit and ItemDescTab.hit > 0 then
	    local nColor = LuaItemDesc:GetItemColor(ItemDescTab.id, ItemDescTab.quality)
		return Format("^%06x", nColor) .. Format(ITEM_COMBATPET_EQUIP_DESC.Hit,ItemDescTab.hit)
	else
		return ""
	end
end

--宠物装备附带暴击
function GetCombatpetEquipCritical(ItemDescTab)
	if ItemDescTab.critical and ItemDescTab.critical > 0 then
	    local nColor = LuaItemDesc:GetItemColor(ItemDescTab.id, ItemDescTab.quality)
		return Format("^%06x", nColor) .. Format(ITEM_COMBATPET_EQUIP_DESC.Critical,ItemDescTab.critical)
	else
		return ""
	end
end
--宠物装备战力
function GetCombatpetEquipPowerValue(ItemDescTab)
	if ItemDescTab.power and ItemDescTab.power > 0 then
		return Format(ITEM_COLOR_DESC.Yellow .. ITEM_COMBATPET_EQUIP_DESC.Power,ItemDescTab.power)
	else
		return ""
	end
end
--增加宠物资质
function GetCombatpetEquipAptitude(ItemDescTab)
	if ItemDescTab.aptitude and ItemDescTab.aptitude > 0 then
	    local nColor = LuaItemDesc:GetItemColor(ItemDescTab.id, ItemDescTab.quality)
		return Format("^%06x", nColor) .. Format(ITEM_COMBATPET_EQUIP_DESC.Aptitude,ItemDescTab.aptitude)
	else
		return ""
	end
end

--增加人物属性
function GetCombatpetEquipAddon(ItemDescTab)
    local addon = {}
    for i = 1, 4 do
        temp = "addon" .. i
        local addon_desc = Addon_Func:GetAddonPackageDesc(ItemDescTab[temp])          
        if ItemDescTab[temp] and ItemDescTab[temp] ~= "" then --formatString(str,char,k)
            Insert(addon,Format( ITEM_COMBATPET_EQUIP_DESC["Addon"..i], formatString(addon_desc," ", 2 )))
        end
    end
    strAddon = Concat(addon)
    if Len(strAddon) > 0 then
        local nColor = LuaItemDesc:GetItemColor(ItemDescTab.id, ItemDescTab.quality)
        return ITEM_COMBATPET_EQUIP_DESC.AddonDesc .. Format("^%06x", nColor) .. strAddon
    else
		return ""
    end
end


--宠物技能书技能描述
function GetPetSkillBookSkillDesc(ItemDescTab)
	return ItemDescTab.skill_desc:match("\r(.*)")
end

--宠物技能格悬浮图标
local function GetPetSlotIcon(IconName)
 	local img = ResourceConfig:GetSkillSlot(IconName)
    if not img then return "" end
   	local strUnit = DlgApiEx.GetImageString(img, ICONS_HINT)
    if strUnit then
    	return Format("%s", strUnit)
    end	    
	return ""
end
--宠物技能书对技能格要求
function GetPetSkillBookSlot(ItemDescTab)
    local imgEmpty  = GetPetSlotIcon("SLOT_EMPTY")
    local imgFull	= GetPetSlotIcon("SLOT_FULL")
    local img = ""
	if ItemDescTab.skill_slot then
	    for i = 1, 4 do
	        if i == ItemDescTab.skill_slot+1 then
	            img = img .. imgFull
	        else
	            img = img .. imgEmpty
	        end
	    end
	    if img ~= "" then
	        img = img .. "\r"
	    end
	    return Format(ITEM_PET_SKILL_BOOK_DESC.Slot, img)
	else
		return ""
	end
end

--宠物技能书技能名字等级
function GetPetSkillBookSkillName(ItemDescTab)
	if ItemDescTab.skill_name and ItemDescTab.skill_level then
			return Format(ITEM_PET_SKILL_BOOK_DESC.Skill_Name,ItemDescTab.skill_name)..Format(ITEM_PET_SKILL_BOOK_DESC.Skill_Level,ItemDescTab.skill_level)
	else
			return ""
	end
end


--宠物等级上限
function GetCombatpetMaxLevel(ItemDescTab)
	if ItemDescTab.max_level then
		local str_lev = format_string:player_lev(ItemDescTab.max_level, true)
  		return Format(ITEM_COMBATPET_DESC.Max_Level,str_lev)
  else
  		return ""
  end
end

--当前资质
function GetCombatpetAptitude(ItemDescTab)
  if ItemDescTab.aptitude then
  		return Format(ITEM_COMBATPET_DESC.Aptitude,ItemDescTab.aptitude)
  else
  		return ""
  end
end

--最大资质
function GetCombatpetMaxAptitude(ItemDescTab)
  if ItemDescTab.max_aptitude then
  		return Format(ITEM_COMBATPET_DESC.Max_Aptitude,ItemDescTab.max_aptitude)
  else
  		return ""
  end
end

--宠物性别
function GetCombatpetGender(ItemDescTab)
	if ItemDescTab.gender and ItemDescTab.gender == 0 then
			return Format(ITEM_COMBATPET_DESC.Gender_Male,ItemDescTab.gender)
	elseif ItemDescTab.gender and ItemDescTab.gender == 1 then
					return Format(ITEM_COMBATPET_DESC.Gender_Female,ItemDescTab.gender)
	else
			return ""
	end
end

--技能格数量
function GetCombatpetMaxSkillSlots(ItemDescTab)
  if ItemDescTab.max_skill_slots then
  		return Format(ITEM_COMBATPET_DESC.Max_Skill_Slots,ItemDescTab.max_skill_slots)
  else
  		return ""
  end
end

--宠物属性颜色
function GetQualityColor(ItemDescTab)
    local nColor = LuaItemDesc:GetItemColor(ItemDescTab.id, ItemDescTab.quality)
    local strColor = Format("^%06x", nColor)
    if strColor then
        return strColor
    else
        return ""
    end
end

--宠物攻击力
function GetCombatpetDamage(ItemDescTab)
	if ItemDescTab.damage and ItemDescTab.damage > 0 then
			return GetQualityColor(ItemDescTab) .. Format(ITEM_COMBATPET_DESC.Damage,ItemDescTab.damage)
	else
			return ""
	end
end

--宠物属性攻击力
function GetCombatpetElementDamage(ItemDescTab)
	if ItemDescTab.element_damage and ItemDescTab.element_damage > 0 then
			return GetQualityColor(ItemDescTab) .. Format(ITEM_COMBATPET_DESC.ElementDamage,ItemDescTab.element_damage)
	else
			return ""
	end
end

--宠物命中
function GetCombatpetHit(ItemDescTab)
	if ItemDescTab.hit and ItemDescTab.hit > 0 then
			return GetQualityColor(ItemDescTab) .. Format(ITEM_COMBATPET_DESC.Hit,ItemDescTab.hit)
	else
			return ""
	end
end

--宠物暴击
function GetCombatpetCritical(ItemDescTab)
	if ItemDescTab.critical and ItemDescTab.critical > 0 then
			return GetQualityColor(ItemDescTab) .. Format(ITEM_COMBATPET_DESC.Critical,ItemDescTab.critical)
	else
			return ""
	end
end

--宠物装备1
function GetCombatpetEquip1(ItemDescTab)
  if ItemDescTab.equip1 and ItemDescTab.equip1 ~= "" then
  		return Format(ITEM_COMBATPET_DESC.Equip1,ItemDescTab.equip1)
  else
  		return ""
  end
end

--宠物装备2
function GetCombatpetEquip2(ItemDescTab)
  if ItemDescTab.equip2 and ItemDescTab.equip2 ~= "" then
  		return Format(ITEM_COMBATPET_DESC.Equip2,ItemDescTab.equip2)
  else
  		return ""
  end
end

--宠物装备3
function GetCombatpetEquip3(ItemDescTab)
  if ItemDescTab.equip3 and ItemDescTab.equip3 ~= "" then
  		return Format(ITEM_COMBATPET_DESC.Equip3,ItemDescTab.equip3)
  else
  		return ""
  end
end

--宠物技能
function GetCombatpetSkill1(ItemDescTab)
	if ItemDescTab.skill_id_1 and ItemDescTab.skill_id_1 > 0 then
			if ItemDescTab.skill_name_1 then
					return Format(ITEM_COMBATPET_DESC.Skill_Name,ItemDescTab.skill_name_1)..Format(ITEM_COMBATPET_DESC.Skill_Level,ItemDescTab.skill_level_1)
			else
					return ""
			end
	else
			return ""
	end
end		

function GetCombatpetSkill2(ItemDescTab)
	if ItemDescTab.skill_id_2 and ItemDescTab.skill_id_2 > 0 then
			if ItemDescTab.skill_name_2 then
					return Format(ITEM_COMBATPET_DESC.Skill_Name,ItemDescTab.skill_name_2)..Format(ITEM_COMBATPET_DESC.Skill_Level,ItemDescTab.skill_level_2)
			else
					return ""
			end
	else
			return ""
	end
end		

function GetCombatpetSkill3(ItemDescTab)
	if ItemDescTab.skill_id_3 and ItemDescTab.skill_id_3 > 0 then
			if ItemDescTab.skill_name_3 then
					return Format(ITEM_COMBATPET_DESC.Skill_Name,ItemDescTab.skill_name_3)..Format(ITEM_COMBATPET_DESC.Skill_Level,ItemDescTab.skill_level_3)
			else
					return ""
			end
	else
			return ""
	end
end		

function GetCombatpetSkill4(ItemDescTab)
	if ItemDescTab.skill_id_4 and ItemDescTab.skill_id_4 > 0 then
			if ItemDescTab.skill_name_4 then
					return Format(ITEM_COMBATPET_DESC.Skill_Name,ItemDescTab.skill_name_4)..Format(ITEM_COMBATPET_DESC.Skill_Level,ItemDescTab.skill_level_4)
			else
					return ""
			end
	else
			return ""
	end
end		

--宠物对人等级要求
function GetCombatpetReqLevel(ItemDescTab)
    if ItemDescTab.player_level_req and ItemDescTab.player_level_req > 0 then
    	local HostPropEx=GameApi.GetHostPropEx()
        local str_lev = format_string:player_lev(ItemDescTab.player_level_req, true)
		if (ItemDescTab.player_level_req > HostPropEx.level) then
    		return ITEM_COLOR_DESC.Red..Format(ITEM_COMBATPET_DESC.Player_Level_Req, str_lev)
    	else
    	    return Format(ITEM_COMBATPET_DESC.Player_Level_Req, str_lev)
		end
    end
    return ""
end

-- 神器的神力
function GetArtifactPower(artifactTab)
    if artifactTab and artifactTab.power and artifactTab.power > 0 then
        return ITEM_SIZE_DESC.Size12..Format(ITEM_ARTIFACT_DESC.POWER,artifactTab.power)
    end
    return ""
end
--获取神器的境界描述
function GetArtifactState(artifactTab,strList)
    if type(strList) ~= "table" then
        return
    end
    if artifactTab then
        Insert(strList, {}) --加个分隔线
        --唯一属性
        Insert(strList,ITEM_SIZE_DESC.Size12..ITEM_ARTIFACT_DESC.UNIQUE)
        local tmp = Addon_Func:GetAddonPackageDescList(artifactTab.uniq_addon)
        if tmp then
            for _,addon in ipairs(tmp) do
                Insert(strList, ITEM_SIZE_DESC.Size12.."  "..addon)
            end
        end
        Insert(strList, {}) --加个分隔线
        --境界属性
        Insert(strList,ITEM_SIZE_DESC.Size12..ITEM_ARTIFACT_DESC.STATE)
        for i,stateInfo in ipairs(artifactTab.states) do
            --头
            local stateStr = Format("STATE_%d",i)
            local fmt = ITEM_ARTIFACT_DESC[stateStr]
            local head = Format(fmt,stateInfo.enhance_lev+1,stateInfo.enhance_max_lev+1)
            if not stateInfo.active then
                head = head .. Format(ITEM_ARTIFACT_DESC.UNACTIVE,stateInfo.needpower)
                head = glb_DisableText(head)
            end
            Insert(strList, ITEM_SIZE_DESC.Size12..head)
            --属性
            local addons = {}
            Insert(addons,stateInfo.base_addon)
            Insert(addons,stateInfo.addon)
            local tmp = Addon_Func:GetAddonPackageSetDescList(addons)
            if tmp then
                for _,addon in ipairs(tmp) do
                    if not stateInfo.active then
                        addon = glb_DisableText(addon)
                    end
                    Insert(strList, ITEM_SIZE_DESC.Size12.."  "..addon)
                end
            end
            if i ~= #artifactTab.states then
                Insert(strList, ITEM_SIZE_DESC.Size12.."   ")--加个行间距
            end
        end
    end
end


--宝石属性
function GetSoulArmorGemAddon(ItemDescTab)
	local equip_quality = ItemDescTab.quality
	local strColor = ITEM_COLORSTR[equip_quality] or ITEM_COLORSTR[0]    
    local addon_desc = Addon_Func:GetAddonPackageDesc(ItemDescTab.addon_pack)     
    return Format(ITEM_SOULARMOR_GEM.StrAddon, strColor .. addStringSub(addon_desc,"  ") or "")
end

--宝石下一级属性
function GetSoulArmorGemNextAddon(ItemDescTab)
	if ItemDescTab.next_addon_pack and ItemDescTab.next_fight_power then
		local equip_quality = ItemDescTab.quality
		local strColor = ITEM_COLORSTR[equip_quality] or ITEM_COLORSTR[0]    
    	local addon_desc = Addon_Func:GetAddonPackageDesc(ItemDescTab.next_addon_pack)     
    	local power_desc = Format(FIGHT_POWER, ItemDescTab.next_fight_power)
    	return Format(ITEM_SOULARMOR_GEM.StrNextAddon, power_desc, strColor .. addStringSub(addon_desc,"  ") or "")
    else
    	return ""
    end
end

--附带经验
function GetSoulArmorGemExp(ItemDescTab)    
    if ItemDescTab.gem_exp and ItemDescTab.next_exp then
        return Format(ITEM_SOULARMOR_GEM.StrExp, ItemDescTab.gem_exp, ItemDescTab.next_exp)
    end
    return ITEM_SOULARMOR_GEM.FullLev
end

function GetSoulArmorGemText(ItemDescTab)
    local equip_quality = ItemDescTab.quality
    local strColor = ITEM_COLORSTR[equip_quality] or ITEM_COLORSTR[0]
    if ItemDescTab.gem_lev and ItemDescTab.gem_lev ~= 0 then
        return strColor .. ITEM_SIZE_DESC.Size12A .. ItemDescTab.name .. "+" .. ItemDescTab.gem_lev .. ITEM_COLOR_DESC.White .."\r"
    else
        return strColor .. ITEM_SIZE_DESC.Size12A .. ItemDescTab.name .. ITEM_COLOR_DESC.White .."\r"
    end
end
