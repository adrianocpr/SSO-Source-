local Insert = table.insert
local Concat = table.concat
local Format = string.format
local Len	 = string.len
local Addon_Func = Addon_Func
local SetStringText  = format_string.SetStringText



---------------------------------------
-------------圣衣相关函数--------------
---------------------------------------

--圣衣耐久度
local function GetSaintClothEndure(tab)
	if tab.max_dur and tab.max_dur ~= 0 then
	    if tab.dur == 0 then
--	        return Format(ITEM_ENDURE_DESC["Endure"],ITEM_COLOR_DESC.Red, tab.dur, tab.max_dur)
			local desc = Format(ITEM_ENDURE_DESC["Endure"],ITEM_COLOR_DESC.Red, math.ceil(tab.dur/10), math.ceil(tab.max_dur/10))
			desc = desc .. ITEM_ENDURE_DESC["Zero"]
			return desc
	    else
--	       	return Format(ITEM_ENDURE_DESC["Endure"],ITEM_COLOR_DESC.White, tab.dur, tab.max_dur)
	        return Format(ITEM_ENDURE_DESC["Endure"],ITEM_COLOR_DESC.White,math.ceil(tab.dur/10), math.ceil(tab.max_dur/10))
	    end
	else
	    return ""
	end        
end

--圣衣战斗力
local function GetSaintClothFightPower(tab)
	local fight_power_list = {}
	if tab.fight_power_when_equipped and tab.fight_power_when_equipped ~= 0 then
	    Insert(fight_power_list, Format(SAINT_CLOTH_FIGHT_POWER_DESC["fight_power_when_equipped"], tab.fight_power_when_equipped))
	end
	if tab.fight_power and tab.fight_power ~= 0 then
	    Insert(fight_power_list, Format(SAINT_CLOTH_FIGHT_POWER_DESC["fight_power"], tab.fight_power))
	end
	return Concat(fight_power_list)
end

--圣衣属性
local function GetSaintClothAddOn(tab)
	local saint_cloth_addon = {}
    local addon_pack_desc = Addon_Func:GetAddonPackageDesc(tab.addon_pack)	
	if addon_pack_desc and addon_pack_desc ~= "" then
	    Insert(saint_cloth_addon, Format(SAINT_CLOTH_ADDON["addon_pack"], tab.fight_power, SetStringText(addon_pack_desc,1)..ITEM_COLOR_DESC.White))
	end
	local desc = Addon_Func:GetAddonPackageDesc(tab.addon_pack_when_equipped)	
	if desc and desc ~= "" then
	    Insert(saint_cloth_addon, Format(SAINT_CLOTH_ADDON["addon_pack_when_equipped"], tab.fight_power_when_equipped, SetStringText(desc,1)..ITEM_COLOR_DESC.White))
	end
	return Concat(saint_cloth_addon)
end

--圣衣星铸等级
local function GetSaintClothEnhanceLevel(tab)
	if tab.enhance_lev then
	    return Format(SAINT_CLOTH_ADDON["enhance_lev"], tab.enhance_lev)
	else
	    return ""
	end
end

--圣衣要求等级
local function GetSaintClothRequiredLevel(tab)
	--要求等级
	if tab.req_level and tab.req_level ~=0 then
		local str_lev = format_string:player_lev(tab.req_level, true)
	    return Format(SAINT_CLOTH_REQ_DESC["req_level"], str_lev)
	else
	    return ""
	end
	--要求小宇宙等级
	if tab.req_cosmos_level and tab.req_cosmos_level ~=0 then
	    return Format(SAINT_CLOTH_REQ_DESC["req_cosmos_level"],tab.req_cosmos_level)
	else
	    return ""
	end
end


---------------------------------------
-------------星命点相关函数------------
---------------------------------------

--星命点战斗力
local function GetCosmosStarFightPower(tab)
	local cosmos_star_fight_power = {}
	if tab.fight_power and tab.fight_power ~= 0 then
	    Insert(cosmos_star_fight_power, Format(COSMOS_STAR_FIGHT_POWER, tab.fight_power))
	end
	return Concat(cosmos_star_fight_power)
end


--星命点属性
local function GetCosmosStarAddOn(tab)
	local cosmos_star_addon = {}
    local addon_pack_desc = Addon_Func:GetAddonPackageDesc(tab.addon_pack)		
	if addon_pack_desc and addon_pack_desc ~= "" then
	    Insert(cosmos_star_addon, Format(COSMOS_STAR_ADDON, ITEM_COLOR_DESC.Yellow..SetStringText(addon_pack_desc,1)..ITEM_COLOR_DESC.White))
	end
	return Concat(cosmos_star_addon)
end

--星命点激活要求等级
local function GetCosmosStarNeedPlayerLevel(tab)
	if tab.need_player_level and tab.need_player_level ~=0 then
	    return Format(COSMOS_STAR_NEED_PLAY_LEVEL, format_string:player_lev(tab.need_player_level))
	else
	    return ""
	end
end

--星命点激活要求感悟
local function GetCosmosStarNeedRealizePoint(tab)
	if tab.need_realize_point and tab.need_realize_point ~=0 then
		return Format(COSMOS_STAR_NEED_REALIZE_POINT,tab.need_realize_point)
	else
		return ""
	end
end

local function GetCosmosStarNeedWillLevel(tab)
	if tab.will_need_level and tab.will_need_level ~=0 then
	    return Format(COSMOS_RANK_STAR_NEED_RANK_LEVEL,tab.will_need_level)
	else
	    return ""
	end
end

local function GetCosmosStarNeedWillSkillPoint(tab)
	if tab.will_need_skill_point and tab.will_need_skill_point ~=0 then
		return Format(COSMOS_RANK_STAR_NEED_SKILL_POINT,tab.will_need_skill_point)
	else
		return ""
	end
end


local function GetCosmosStarAcceptColor(tab)
	if tab.accept_color and tab.accept_color ~= "" then
	    return COSMOS_STAR_ACCEPT_COLOR[tab.accept_color]
	else
	    return ""
	end
end

---------------------------------------
-------------境界相关函数--------------
---------------------------------------

--境界战斗力
local function GetCosmosStageFightPower(tab)
	local cosmos_stage_fight_power = {}
	if tab.fight_power and tab.fight_power ~= 0 then
	    Insert(cosmos_stage_fight_power, Format(COSMOS_STAGE_FIGHT_POWER, tab.fight_power))
	end
	return Concat(cosmos_stage_fight_power)
end


--境界属性
local function GetCosmosStageAddOn(tab)
	local cosmos_stage_addon = {}
    local addon_pack_desc = Addon_Func:GetAddonPackageDesc(tab.addon_pack)		
	if addon_pack_desc and addon_pack_desc ~= "" then
	    Insert(cosmos_stage_addon, Format(COSMOS_STAGE_ADDON, ITEM_COLOR_DESC.Yellow..SetStringText(addon_pack_desc,1)..ITEM_COLOR_DESC.White))
	end
	return Concat(cosmos_stage_addon)
end


---------------------------------------
-------------灵魂之甲相关函数----------
---------------------------------------
local function GetArmorCurAddonOn(tab)
	if not tab.cur_addon_pack then
		return ""
	end
	local addon_pack_desc = Addon_Func:GetAddonPackageDesc(tab.cur_addon_pack)		
	if addon_pack_desc and addon_pack_desc ~= "" then
	    return Format(SOULARMOR_DESC.ADDON_PACK, ITEM_COLOR_DESC.Yellow..SetStringText(addon_pack_desc, 1)..ITEM_COLOR_DESC.White)
	end
	return ""
end

local function GetArmorInsertGemType(tab)
	if tab.mask then
		if tab.mask == 1023 then
			return ITEM_COLOR_DESC.Blue .. SOULARMOR_GEM_DESC_EXTRA_ALL .. "\r"
		elseif tab.mask == 511 then
			return ITEM_COLOR_DESC.Blue .. SOULARMOR_GEM_DESC_EXTRA_OTHER .. "\r"
		else
			return ""
		end
	else
		return ""
	end
end

local function GetArmorGemEmbed(tab, list)
	Insert(list, Format(SOULARMOR_DESC.GEM_EMBED, tab.cur_max_gem_level))
	for i = 1, tab.cur_max_gem_count do		
		local gem_name  = tab[Format("gem%d_name", i)]
		if gem_name then			
			local gem_color = ITEM_COLORSTR[tab[Format("gem%d_qulity", i)]] or ITEM_COLORSTR[0]
			local gem_lev	= tab[Format("gem%d_lev", i)]
			Insert(list, Format(SOULARMOR_DESC.GEM_INFO, gem_color, gem_name, gem_lev))
		else
			Insert(list, SOULARMOR_DESC.GEM_EMPTY)
		end
	end
end


local function GetNextPlayerLev(tab)
	if tab.next_lev and tab.next_player_lev then
		return Format(SOULARMOR_DESC.NEXT_PLAYER_LEV, tab.next_lev, format_string:player_lev(tab.next_player_lev, false))
	end
	return ""
end


local function GetArmorNextAddonOn(tab)
	if not tab.next_addon_pack then
		return ""
	end
	local addon_pack_desc = Addon_Func:GetAddonPackageDesc(tab.next_addon_pack)		
	if addon_pack_desc and addon_pack_desc ~= "" then
	    return Format(SOULARMOR_DESC.ADDON_PACK, ITEM_COLOR_DESC.Yellow..SetStringText(addon_pack_desc, 1)..ITEM_COLOR_DESC.White)
	end
	return ""
end


local function GetArmorNextGemNumber(tab)
	if tab.next_max_gem_count then
		return Format(SOULARMOR_DESC.NEXT_GEM_NUM, tab.next_max_gem_count, tab.next_max_gem_level)
	end
	return ""
end



------------------------------------------------------------------
-- 特殊物品悬浮提示
spec_desc = {}


--圣衣悬浮
function spec_desc:saint_cloth_desc(tab)
	local strTitleList, strDescList = {}, {}
	--圣衣名字
	Insert(strTitleList, tab.name.."\r")
	
	if tab.obtain == true or tab.view == true then
	    --圣衣显示类型
    	Insert(strTitleList,SAINT_CLOTH_CLASS[tab.class_id])
	    --圣衣星铸等级   
    	Insert(strTitleList,GetSaintClothEnhanceLevel(tab))
    	--分隔符   
    	Insert(strDescList,{}) 
    	--圣衣附加属性&战斗力   
    	Insert(strDescList,GetSaintClothAddOn(tab))  
    else
        Insert(strDescList,Format(SAINT_CLOTH_OBTAIN["not_obtained"]))
	end

	if tab.obtain == true then
		--分隔符   
    	Insert(strDescList,{})  
	end
	
    --圣衣需要等级
    Insert(strDescList,GetSaintClothRequiredLevel(tab))
    
    --耐久度
    if tab.obtain==true then    	
    	Insert(strDescList,GetSaintClothEndure(tab))
    end
   
	return Concat(strTitleList), strDescList
end


--圣衣星铸悬浮
function spec_desc:saint_cloth_enhance_desc(tab)
	local strTitleList, strDescList = {}, {}
	--圣衣星铸等级   
    Insert(strTitleList,GetSaintClothEnhanceLevel(tab))
--    --圣衣战斗力
--    Insert(strDescList,GetSaintClothFightPower(tab))
    --分隔符   
    Insert(strDescList,{}) 
    --圣衣附加属性   
    Insert(strDescList,GetSaintClothAddOn(tab))   
	--分隔符   
    Insert(strDescList,{}) 
	return Concat(strTitleList), strDescList
end


--星命点悬浮
function spec_desc:cosmos_desc(tab)
    local head_list = {}
    
	-- 星命点名称&类型
    Insert(head_list, ITEM_SIZE_DESC.Size12..tab.name..GetCosmosStarAcceptColor(tab))
    -- 星命点战斗力
    Insert(head_list, GetCosmosStarFightPower(tab))
    --分隔符   
    Insert(head_list,{}) 
    -- 星命点附加属性   
    Insert(head_list, GetCosmosStarAddOn(tab))
	--分隔符   
    Insert(head_list,{}) 
    if tab.active == 0 then  
 		-- 星命未激活提示
        Insert(head_list, COSMOS_STAR_UNACTIVED) 
		-- 星命点激活需要等级  	
    	Insert(head_list, GetCosmosStarNeedPlayerLevel(tab)) 
    	-- 星命点需要觉悟
    	Insert(head_list, GetCosmosStarNeedRealizePoint(tab))
    	--星命点需要意志等级
    	Insert(head_list, GetCosmosStarNeedWillLevel(tab)) 
    else
        -- 星命点已激活描述
        Insert(head_list, COSMOS_STAR_ACTIVED)
        if	tab.stone_tid == 0 then
            -- 星命点未注入
            Insert(head_list, COSMOS_STAR_NO_STONE)
    	else
    	    --分隔符
            Insert(head_list,{})
        	-- 星命点已注入
            Insert(head_list, COSMOS_STAR_HAVE_STONE)
    	end
	end

	return head_list	
end


--星命点界面提示
function spec_desc:cosmos_ui_desc(tab, star)
    local strDescList = {}
    local embed = next(star) and true or false
    
    -- 星命点名称&类型
    Insert(strDescList, ITEM_SIZE_DESC.Size12..tab.name..GetCosmosStarAcceptColor(tab))
    -- 星命点战斗力
    Insert(strDescList, GetCosmosStarFightPower(tab))
    -- 星命点附加属性   
    Insert(strDescList, GetCosmosStarAddOn(tab))
    
    if embed then
    	local addon_pack_desc = Addon_Func:GetAddonPackageDesc(star.addon_pack)		
		Insert(strDescList,Format(STRING_TABLE.COSMOS_STAR_ATTRIBUTE_FULL_FORMAT, star.fight_power, addon_pack_desc))
    else
		Insert(strDescList,Format(STRING_TABLE.COSMOS_STAR_ATTRIBUTE_FORMAT))
    end
    
    return Concat(strDescList)
end


--境界界面提示
function spec_desc:cosmos_stage_desc(stage)
    local strDescList = {}
    -- 境界名称
    Insert(strDescList, ITEM_SIZE_DESC.Size12..stage.name)
    -- 境界战斗力
    Insert(strDescList, GetCosmosStageFightPower(stage))
    -- 境界附加属性   
    Insert(strDescList, GetCosmosStageAddOn(stage))
    
--    for k, v in pairs(stage) do
--        table.insert(strDescList, tostring(k)..":"..tostring(v))
--    end
    return strDescList
end


function spec_desc:saint_cloth_desc(tab)
	local strTitleList, strDescList = {}, {}
	--圣衣名字
	Insert(strTitleList, tab.name.."\r")
	
	if tab.obtain == true or tab.view == true then
	    --圣衣显示类型
    	Insert(strTitleList,SAINT_CLOTH_CLASS[tab.class_id])
	    --圣衣星铸等级   
    	Insert(strTitleList,GetSaintClothEnhanceLevel(tab))
    	--分隔符   
    	Insert(strDescList,{}) 
    	--圣衣附加属性&战斗力   
    	Insert(strDescList,GetSaintClothAddOn(tab))  
    else
        Insert(strDescList,Format(SAINT_CLOTH_OBTAIN["not_obtained"]))
	end

	if tab.obtain == true then
		--分隔符   
    	Insert(strDescList,{})  
	end
	
    --圣衣需要等级
    Insert(strDescList,GetSaintClothRequiredLevel(tab))
    
    --耐久度
    if tab.obtain==true then    	
    	Insert(strDescList,GetSaintClothEndure(tab))
    end
   
	return Concat(strTitleList), strDescList
end


--圣衣星铸悬浮
function spec_desc:saint_cloth_enhance_desc(tab)
	local strTitleList, strDescList = {}, {}
	--圣衣星铸等级   
    Insert(strTitleList,GetSaintClothEnhanceLevel(tab))
--    --圣衣战斗力
--    Insert(strDescList,GetSaintClothFightPower(tab))
    --分隔符   
    Insert(strDescList,{}) 
    --圣衣附加属性   
    Insert(strDescList,GetSaintClothAddOn(tab))   
	--分隔符   
    Insert(strDescList,{}) 
	return Concat(strTitleList), strDescList
end


--灵魂之甲悬浮

function spec_desc:armor_desc(tab)
	-- 标题
	local title
	if tab.active then
	 	title = Format(SOULARMOR_DESC.NAME_LEV_ACTIVE, tab.armor_name or "", tab.cur_lev or 0)
	else
		title = Format(SOULARMOR_DESC.NAME_LEV, tab.armor_name or "")
	end

	-- 内容
    local list = {}
    -- 战力
    Insert(list, Format(FIGHT_POWER, tab.fight_power))
    -- 可镶嵌宝石类型
    Insert(list, GetArmorInsertGemType(tab))
    -- 当前属性
    Insert(list, GetArmorCurAddonOn(tab))
    -- 宝石镶嵌
    GetArmorGemEmbed(tab, list)
	Insert(list, {})
    -- 下一级别
    if tab.next_lev and tab.next_player_lev then
    	-- 等级    	
    	Insert(list, GetNextPlayerLev(tab))
    	-- 属性
    	Insert(list, GetArmorNextAddonOn(tab))
    	-- 宝石镶嵌
    	Insert(list, GetArmorNextGemNumber(tab))
    	
    	Insert(list, {})
    end

	return title, list
end