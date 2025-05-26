----------------------------------------------
-- 将所有工具函数封装到模块mod_utility
module("ModUtility", package.seeall)
local string, table = string, table
local Format = string.format
local Concat = table.concat
local Len	 = string.len
local Insert = table.insert
local Addon_Func = Addon_Func
local SetString     = format_string.SetString
local SetStringText = format_string.SetStringText


-------------------------------------
--		local function
-------------------------------------
function GetAddOnIcon(iconName)
    local img = ResourceConfig:GetAttributeIcon(iconName)
    if not img then return "" end
   	local strUnit = DlgApiEx.GetImageString(img, ICONS_HINT)
    if strUnit then
    	return tostring(strUnit)
    end	    
	return ""
end

function GetEnhanceIcon(iconStr)
    local img = ResourceConfig:GetEnhanceLevel(iconStr)
    if not img then return "" end
   	local strUnit = DlgApiEx.GetImageString(img, ICONS_HINT)
    if strUnit then
    	return Format("%s", strUnit)
    end	    
	return ""
end

local function addStringIcon(str,iconName)
	if (not string.find(str,"\r")) then
	    return GetAddOnIcon(iconName) .. str
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
	    temp = temp .. GetAddOnIcon(iconName) .. ss .. "\r"
	end
	ss = string.sub(str,j+1,Len(str))
	return temp .. GetAddOnIcon(iconName) .. ss
end

-------------------------------------
--		装备属性
-------------------------------------

--装备基础属性
function GetEquipBaseProp(ItemDescTab)
	local list = {}
	local equip_quality = ItemDescTab.quality
	local strColor = ITEM_COLORSTR[equip_quality] or ITEM_COLORSTR[0]
	if(ItemDescTab.equip_strength and ItemDescTab.equip_strength~=0) then
		Insert(list, Format(ITEM_EQUIP_BASEPROP_DESC.Strength,strColor,ItemDescTab.equip_strength))
	end
	if(ItemDescTab.equip_stamina and ItemDescTab.equip_stamina~=0) then
	    Insert(list, Format(ITEM_EQUIP_BASEPROP_DESC.Stamina,strColor,ItemDescTab.equip_stamina))
	end
	if(ItemDescTab.equip_mana and ItemDescTab.equip_mana~=0) then
	    Insert(list, Format(ITEM_EQUIP_BASEPROP_DESC.Mana,strColor,ItemDescTab.equip_mana))
	end
	if(ItemDescTab.equip_durability and ItemDescTab.equip_durability~=0) then
	    Insert(list, Format(ITEM_EQUIP_BASEPROP_DESC.Durability,strColor,ItemDescTab.equip_durability))
	end
	return Concat(list)
end


--套装属性
function GetSuitString(ItemDescTab)
    if ItemDescTab.equip_suite_group and ItemDescTab.equip_suite_group~=0 and ItemDescTab.equip_suite_tag and ItemDescTab.equip_suite_tag~=0 then
    	if ItemDescTab.equip_suite_addon_desc and ItemDescTab.equip_suite_addon_desc ~= "" then
    	    return ItemDescTab.equip_suite_addon_desc
    	else
    	    return ""
    	end
    else
        return ""
    end
end


local fight_power_rate = 
{
	[1] = 0.16,
	[13] = 0.53,
	[14] = 0.53,
	[15] = 0.53,
	[16] = 0.53,
	[35] =2.24,
	[36] = 2.24,
	[39] = 0.37,
	[107] = 1.07,
	[113] = 0.53,
}


--装备基本战斗力
function GetEquipFightPower(ItemDescTab)
	local fight_power = ItemDescTab.fight_power_base or 0
    if ItemDescTab.context == 1 and ItemDescTab.id_prop_storage then
        fight_power = ItemDescTab.fight_power + ItemDescTab.id_prop_fight_power
    end
    local desc = ItemDescTab.compare_equip and STRING_TABLE.STRING_EQUIP_COMAPRE_INTER ..string.rep(" ",4) or ""
    return desc .. ITEM_COLOR_DESC.Yellow .. Format(ITEM_EQUIP_FIGHT_POWER_BASE, fight_power )
end

--装备属性攻击力
function GetEquipElementDmg(ItemDescTab)
	local list = {}
	local equip_quality = ItemDescTab.quality
	local strColor = ITEM_COLORSTR[equip_quality] or ITEM_COLORSTR[0]
	if(ItemDescTab.equip_element_dmg_earth and ItemDescTab.equip_element_dmg_earth~=0) then
	    Insert(list, Format(ITEM_EQUIP_ELEMENTDMG_DESC.Earth,strColor,ItemDescTab.equip_element_dmg_earth))
	end
	if(ItemDescTab.equip_element_dmg_water and ItemDescTab.equip_element_dmg_water~=0) then
	    Insert(list, Format(ITEM_EQUIP_ELEMENTDMG_DESC.Water,strColor,ItemDescTab.equip_element_dmg_water))
	end
	if(ItemDescTab.equip_element_dmg_fire and ItemDescTab.equip_element_dmg_fire~=0) then
	    Insert(list, Format(ITEM_EQUIP_ELEMENTDMG_DESC.Fire,strColor,ItemDescTab.equip_element_dmg_fire))
	end
	if(ItemDescTab.equip_element_dmg_wind and ItemDescTab.equip_element_dmg_wind~=0) then
	    Insert(list, Format(ITEM_EQUIP_ELEMENTDMG_DESC.Wind,strColor,ItemDescTab.equip_element_dmg_wind))
	end
	if(ItemDescTab.equip_element_dmg_thunder and ItemDescTab.equip_element_dmg_thunder~=0) then
	    Insert(list, Format(ITEM_EQUIP_ELEMENTDMG_DESC.Thunder,strColor,ItemDescTab.equip_element_dmg_thunder))
	end
	return Concat(list)
end


-- 鉴定属性
function GetEquipAppraiseText(ItemDescTab)
    local strEquipAppraiseList = {}
    local equip_quality = ItemDescTab.quality
    local strColor = ITEM_COLORSTR[equip_quality] or ITEM_COLORSTR[0]
    if ItemDescTab.context == 1 and ItemDescTab.has_prop_storage == true then
        if ItemDescTab.id_prop_storage then
            return strColor .. Addon_Func:GetAddonPackageDesc(ItemDescTab.id_prop_storage)
        else
            return strColor .. ITEM_EQUIP_APPRAISE_TEXT_DESC.NotAppraise
        end
    else        
    	Insert(strEquipAppraiseList, strColor)
    
    	local i = 1
        local addon_id = ItemDescTab[Format("addon_group%d", i)]
        local desc = Addon_Func:GetAddonPackageDesc(addon_id)
    	while addon_id>0 and desc do
    	    if desc and Len(desc) > 0 then
    	        Insert(strEquipAppraiseList, Format(ITEM_EQUIP_APPRAISE_TEXT_DESC.AppraiseDesc,SetString(desc," ",2)))
    	    end
    	    i = i + 1
            addon_id = ItemDescTab[Format("addon_group%d", i)]
            desc = Addon_Func:GetAddonPackageDesc(addon_id)
    	end
    	table.insert(strEquipAppraiseList, Format(ITEM_COLOR_DESC.White))
    	return Concat(strEquipAppraiseList)
    end
end


-- 装备增强融合属性
function GetEquipEnhanceMergeText(ItemDescTab)
    local strEquipMergeEnhanceList = {}

    if ItemDescTab.merge_enhance_type and ItemDescTab.merge_enhance_type>0 and ItemDescTab.merge_enhance_value and ItemDescTab.merge_enhance_value>0 then
        Insert(strEquipMergeEnhanceList, ITEM_COLOR_DESC.TestColor..ITEM_EQUIP_MERGE_TEXT_DESC_TAG)
        Insert(strEquipMergeEnhanceList, "   " .. ITEM_COLOR_DESC.Enhance.. Format(ITEM_ENHANCE_ATTR_DESC[ItemDescTab.merge_enhance_type],ItemDescTab.merge_enhance_value))
        for i = 1,4 do
            local desc = Addon_Func:GetAddonPackageDesc(ItemDescTab[Format("merge_addon_group%d",i)])
            if desc and desc ~= "" then
            	Insert(strEquipMergeEnhanceList, "   " .. desc .. "\r")
            end
        end
        return Concat(strEquipMergeEnhanceList)
    else
        return ""
    end     
end


-- 装备额外属性
function GetEquipExtraText(ItemDescTab)
    local strEquipExtraList = {}
    Insert(strEquipExtraList, ITEM_COLOR_DESC.TestColor..ITEM_EQUIP_EXTRA_TEXT_DESC)
    
    local i = 1
    local desc = Addon_Func:GetAddonPackageDesc(ItemDescTab[Format("merge_addon_group%d", i)])
	while desc do
	    if desc and Len(desc) > 0 then
	        Insert(strEquipExtraList, Format(ITEM_EQUIP_MERGE_TEXT_DESC_TAG, desc))
	    end
	    i = i + 1
	    desc = Addon_Func:GetAddonPackageDesc(ItemDescTab[Format("merge_addon_group%d", i)])
	end
	table.insert(strEquipExtraList, Format(ITEM_COLOR_DESC.White))
	return table.concat(strEquipExtraList)
end


-- 装备加工属性
function GetEquipProcessText(ItemDescTab)
    local desc = Addon_Func:GetAddonPackageDesc(ItemDescTab.process_addon_group) or ""   
    local time_left = ItemDescTab.process_addon_left_expire_time or nil
    local process_desc = {}
    if desc and Len(desc) > 0 then
        Insert(process_desc, ITEM_COLOR_DESC.TestColor)
        if ItemDescTab.fight_power_process > 0 then
        	Insert(process_desc, Format(ITEM_EQUIP_PROCESS_TEXT_DESC,ItemDescTab.fight_power_process))
        else
            Insert(process_desc, ITEM_EQUIP_PROCESS_TEXT_DESC1)
        end
        Insert(process_desc, ITEM_COLOR_DESC.Blue .. SetString(desc," ",4).."\r")
        if time_left then
            if time_left == -2 then  --过期了
            	Insert(process_desc, ITEM_COLOR_DESC.Red .. ITEM_EQUIP_PROCESS_TIMELEFT_DESC6)
            elseif time_left == -1 then --永不过期
            	Insert(process_desc, ITEM_COLOR_DESC.Orange .. ITEM_EQUIP_PROCESS_TIMELEFT_DESC5)
            elseif time_left <= 60 then
                Insert(process_desc, ITEM_COLOR_DESC.Red .. Format(ITEM_EQUIP_PROCESS_TIMELEFT_DESC1,time_left))
            elseif time_left <= 3600 then
                Insert(process_desc, ITEM_COLOR_DESC.Green .. Format(ITEM_EQUIP_PROCESS_TIMELEFT_DESC2,math.floor(time_left/60)))
            elseif time_left <= (3600*24) then  --3600*24
            	local hour_left = math.floor(time_left/3600)
            	local minu_left = math.floor((time_left-hour_left*3600)/60)
                Insert(process_desc, ITEM_COLOR_DESC.Green .. Format(ITEM_EQUIP_PROCESS_TIMELEFT_DESC3,hour_left,minu_left))
            else
                local day_left = math.floor(time_left/(3600*24))
                local hour_left = math.floor((time_left - day_left*(3600*24))/3600)
                Insert(process_desc, ITEM_COLOR_DESC.Green .. Format(ITEM_EQUIP_PROCESS_TIMELEFT_DESC4,day_left, hour_left))
            end
            return Concat(process_desc).."\r"
        else
        	return ""
        end 
        return Format(ITEM_COLOR_DESC.TestColor..ITEM_EQUIP_PROCESS_TEXT_DESC , ItemDescTab.fight_power_process) .. ITEM_COLOR_DESC.Green .. SetString(desc," ",4)
    else
        return ""
    end
end


-- 人物装备名字显示相关
function GetEquipNameText(ItemDescTab)
    local equip_quality = ItemDescTab.quality
    local strColor = ITEM_COLORSTR[equip_quality] or ITEM_COLORSTR[0]
    if ItemDescTab.refine_level and ItemDescTab.refine_level ~= 0 then
      	return strColor .. ITEM_SIZE_DESC.Size12A .. ItemDescTab.name .. "+" .. ItemDescTab.refine_level .. ITEM_COLOR_DESC.White .."\r"
    else
        return strColor .. ITEM_SIZE_DESC.Size12A .. ItemDescTab.name .. ITEM_COLOR_DESC.White .."\r"
    end
end


-- 装备类别
function GetEquipPos(ItemDescTab)
    --等级
    local equipList = {}
    local str = Format(ITEM_EQUIP_LEV_TEXT, ITEM_COLOR_DESC.White, ItemDescTab.level)
    Insert(equipList, str)
    --Insert(equipList, ITEM_SIZE_DESC.Size10)

    local strEquipPos = ""
    local strEpIdx = ""
    -- 戒指特殊处理
    local mask_10 = ItemDescTab.equip_pos_mask_10
    local mask_11 = ItemDescTab.equip_pos_mask_11
    if ItemDescTab.equip_pos_mask_10 or ItemDescTab.equip_pos_mask_11 then
        strEpIdx = Format("EquipPos%d", 10)
        Insert(equipList, Format(ITEM_EQUIP_POS_DESC[strEpIdx], STRING_TABLE.EQUIP_RING))
        ItemDescTab.equip_pos_mask_10  = nil
        ItemDescTab.equip_pos_mask_11 = nil
    end
    -- 其它装备
    for i = 1, 32 do
        if (ItemDescTab[Format("equip_pos_mask_%d", i)]) then
            strEquipPos = Format("EQUIP_%02d", i - 1)
            strEpIdx = Format("EquipPos%d", i)
            Insert(equipList, Format(ITEM_EQUIP_POS_DESC[strEpIdx], STRING_TABLE[strEquipPos]))
        end
    end
    -- 品质图标
    Insert(equipList, ResourceConfig:GetStarQulityImg(ItemDescTab.star_level or 0))

    ItemDescTab.equip_pos_mask_10 = mask_10
    ItemDescTab.equip_pos_mask_11 = mask_11
	return Concat(equipList).."\r"
end

function GetEquipEnhanceSuitAddon(ItemDescTab)
	--equip_suite_enh_cur_addon
	--equip_suite_enh_cur_perfect
	--equip_suite_enh_next_addon
	--equip_suite_enh_next_perfect
	--* 9件聚能激活（单件大于20完美度）
	--	属性
	local strlist = {}
    local desc  = Addon_Func:GetAddonPackageDesc(ItemDescTab.equip_suite_enh_cur_addon)
	if desc and desc ~="" and ItemDescTab.equip_suite_enh_cur_perfect>0 then
	    Insert(strlist, ITEM_COLOR_DESC.Yellow .. Format(STRING_EQUIP_ENHANCE_SUIT_DESC, ItemDescTab.equip_suite_enh_cur_perfect*100))
	    Insert(strlist, ITEM_COLOR_DESC.Enhance .. Format(STRING_EQUIP_ENHANCE_SUIT_ADDON_DESC,SetString(desc, " ", 3)))
	end
    local desc1  = Addon_Func:GetAddonPackageDesc(ItemDescTab.equip_suite_enh_cur_addon_advance)
    if desc1 and desc1 ~="" and ItemDescTab.equip_suite_enh_cur_perfect_advance>0 then
        Insert(strlist, ITEM_COLOR_DESC.Yellow .. Format(STRING_EQUIP_ENHANCE_SUIT_DESC_ADVANCE, ItemDescTab.equip_suite_enh_cur_perfect_advance*100))
        Insert(strlist, ITEM_COLOR_DESC.Enhance .. Format(STRING_EQUIP_ENHANCE_SUIT_ADDON_DESC_ADVANCE,SetString(desc1, " ", 3)))
    end
	return Concat(strlist)	
end


-- 装备限制
function GetEquipReqNameText(ItemDescTab)
    local strProfessionReq = ""
    local strPrIdx = ""
    local color

	local reqList = {}
    local HostPropEx=GameApi.GetHostPropEx()
    local sign=0
	local allSign=1
    for i = 1,6 do
        if (ItemDescTab[Format("prof_req_mask_%d", i)]) then
            if (i == HostPropEx.profession ) then
            	color=ITEM_COLOR_DESC.White
            	sign=1
            end
        else
			allSign = 0
		end
    end
	if (allSign == 1) then
		return ""
	else
		for i = 1,6 do
			if (ItemDescTab[Format("prof_req_mask_%d", i)]) then
				if (i == HostPropEx.profession ) then
					color=ITEM_COLOR_DESC.White
				else
					if sign==0 then
						color=ITEM_COLOR_DESC.Red
					else
						color=ITEM_COLOR_DESC.Gray
					end
				end
				strProfessionReq = Format("PROF_%d", i)
				strPrIdx = Format("ProfessionReq%d", i)
				Insert(reqList, color..Format(ITEM_EQUIP_REQ_TEXT_DESC[strPrIdx], STRING_TABLE[strProfessionReq]))
			 end
		 end
		 if #reqList > 0 and #reqList < 7 then
			 return Concat(reqList).."\r"
		 end
		 return ""
	end
end

-- 小宇宙等级（实质为意志等级限制）
function GetReqWillPowerLevel(ItemDescTab)
    local HostPropEx=GameApi.GetHostPropEx()
    local color = ITEM_COLOR_DESC.White
    if ItemDescTab and ItemDescTab.require_willpower_level>0 then
    	if ItemDescTab.require_willpower_level > HostPropEx.will_power then
    		color = ITEM_COLOR_DESC.Red
    	end
        return color .. Format(ITEM_EQUIP_WILLLEV_TEXT, ItemDescTab.require_willpower_level+6)
    else
        return ""
    end
end

-- 性别限制
function GetReqGender(ItemDescTab)
    local nGenderId = ItemDescTab.req_gender
    if not nGenderId or nGenderId == GENDER_BOTH then
    	return ""
    end

    local color
    local HostPropEx=GameApi.GetHostPropEx()
    if (ItemDescTab.req_gender == HostPropEx.gender ) then
    	color=ITEM_COLOR_DESC.White
    else
        color=ITEM_COLOR_DESC.Red
    end
	if 	(ItemDescTab.req_gender == 0 ) then
		return color..Format(ITEM_REQ_GENDER_DESC.ReqGender,STRING_TABLE.MALE)..ITEM_COLOR_DESC.White
	end
	if 	(ItemDescTab.req_gender == 1 ) then
		return color..Format(ITEM_REQ_GENDER_DESC.ReqGender,STRING_TABLE.FEMALE)..ITEM_COLOR_DESC.White
	end
	return ""
end


-- 装备攻击距离
function GetEquipAtkDistance(ItemDescTab)
    local dis = ItemDescTab.equip_atk_distance
    if not dis or dis <= 0 then
    	return ""
    end
    return Format(ITEM_EQUIP_ATK_DISTANCE_DESC.EquipAtkDistance,dis)
end



function GetRefineInfo(text, ItemDescTab) 
    local rate1		 = 	fight_power_rate[ItemDescTab.merge_enhance_type] or 0
    local power_add1 =	ItemDescTab.merge_enhance_value * rate1
    local rate2		 = 	fight_power_rate[ItemDescTab.enhance_type] or 0
    local power_add2 =	ItemDescTab.enhance_value*(1 + ItemDescTab.enhance_value_senior/100) * rate2
    local rate3      =	fight_power_rate[ItemDescTab.per_perfect_addon_type] or 0
    local power_add3 =  ItemDescTab.per_perfect_addon_value * rate3
    
    local n_perfect = 0
    if power_add3 > 0 then
    	for n = 1,20 do
        	if ItemDescTab[Format("perfect_point_%d",n)] and ItemDescTab[Format("perfect_point_%d",n)] == 1 then
            	n_perfect = n_perfect + 1
        	end
    	end
    end
    local power_all = power_add1 + power_add2 + power_add3 * n_perfect + ItemDescTab.fight_power_enhance
	local list = {}
	Insert(list, Format(ITEM_COLOR_DESC.TestColor))
	if ItemDescTab.refine_max_level>12 then --接口添加后修改
		Insert(list, Format(text,ItemDescTab.total_perfect_point*100,1200,ItemDescTab.total_perfect_point_advance*100,(ItemDescTab.refine_max_level-12)*100, power_all))
	else
		Insert(list, Format(text,ItemDescTab.total_perfect_point*100,ItemDescTab.refine_max_level*100,power_all))
	end
	local k = 1
	--perfect_point_%d
	while ItemDescTab[Format("perfect_point_%d",k)] and ItemDescTab[Format("perfect_point_%d",k)]>0 do
	    if k == 1 then
	        Insert(list, "   ")
	    end
	    local perfect_point = ItemDescTab[Format("perfect_point_%d",k)]
	    if perfect_point<0.4 then
	    	Insert(list, GetEnhanceIcon("SELF_LEVEL_1"))
	    elseif perfect_point>=0.4 and perfect_point<0.6 then
	        Insert(list, GetEnhanceIcon("SELF_LEVEL_2"))
	    elseif perfect_point>=0.6 and perfect_point<0.8 then
	        Insert(list, GetEnhanceIcon("SELF_LEVEL_3"))
	    elseif perfect_point>=0.8 and perfect_point<=0.999999 then
	        Insert(list, GetEnhanceIcon("SELF_LEVEL_4"))
	    else
	        Insert(list, GetEnhanceIcon("SELF_LEVEL_5"))
	    end
	    k = k + 1
	end
	Insert(list,"\r")
	if ItemDescTab.refine_level < 13 then
		Insert(list, "   " .. ITEM_COLOR_DESC.Enhance.. Format(ITEM_ENHANCE_ATTR_DESC[ItemDescTab.enhance_type],ItemDescTab.enhance_value))
	else
		Insert(list, "   " .. ITEM_COLOR_DESC.Enhance.. Format(ITEM_ENHANCE_ATTR_DESC_ADVANCE[ItemDescTab.enhance_type],ItemDescTab.enhance_value*(1+ItemDescTab.enhance_value_senior/100),ItemDescTab.enhance_value,ItemDescTab.enhance_value_senior+100))
	end
	local temp_total_perfect
	if ItemDescTab.total_perfect_point_advance then
		temp_total_perfect = ItemDescTab.total_perfect_point + ItemDescTab.total_perfect_point_advance
	else
		temp_total_perfect = ItemDescTab.total_perfect_point
	end
	for i = 0,2 do
        local desc  = Addon_Func:GetAddonPackageDesc(ItemDescTab[Format("extra_addon_packages_desc_%d",i)]) or ""
	    local level = ItemDescTab[Format("extra_addon_packages_enhance_level_%d",i)] or 0
	    local point = ItemDescTab[Format("extra_addon_packages_perfect_point_%d",i)] or 0
	    if desc~="" and level ~= 0 and point ~= 0 then
	        if ItemDescTab.refine_level >= level and temp_total_perfect >= point then
	        	Insert(list, "   " .. ITEM_COLOR_DESC.Enhance .. Format(ITEM_ENHANCE_EXTRA_DESC["ACTIVATE"] ,desc,point*100))
	        else
	            Insert(list, "   " .. ITEM_COLOR_DESC.Gray .. Format(ITEM_ENHANCE_EXTRA_DESC["NOT_ACTIVATE"],desc,point*100))
	        end
	    end
	end
	if n_perfect > 0 then
	    if ItemDescTab.per_perfect_addon_type and ItemDescTab.per_perfect_addon_type>0 and ItemDescTab.per_perfect_addon_value and ItemDescTab.per_perfect_addon_value>0 then
			Insert(list,ITEM_COLOR_DESC.Yellow .. Format(ITEM_ENHANCE_EXTRA_DESC["PERFECT"] ..ITEM_COLOR_DESC.Enhance .. ITEM_ENHANCE_ATTR_DESC[ItemDescTab.per_perfect_addon_type] , n_perfect, n_perfect * ItemDescTab.per_perfect_addon_value))
	    end
	end
	Insert(list, Format(ITEM_COLOR_DESC.White))	
	return Concat(list)
end


--判断显示聚能等级还是星能等级或者可强化可升星或者不显示
function GetRefineLevel(ItemDescTab)
    if ItemDescTab.refine_max_level == 0 then return "" end
    
    if ItemDescTab.refine_level == 0 then
		return ""
		--return ITEM_COLOR_DESC.TestColor .. EMPTY_E_ENHANCE_LEVEL
	end
    if ItemDescTab.refine_max_level > 12 then
    	return GetRefineInfo(ITEM_REFINE_LEVEL_DESC.RefineLevel_A, ItemDescTab)
    else
    	return GetRefineInfo(ITEM_REFINE_LEVEL_DESC.RefineLevel, ItemDescTab)
    end
end


-- 当前强化等级包说明文字
function GetEnhanceStr(ItemDescTab)
    local group = ItemDescTab.enhance_addon_group
    if not group or Len(ItemDescTab.enhance_addon_group) == 0 then
    	return ""
    end
	local strEnhanceTemp = SetStringText(ItemDescTab.enhance_addon_group, 1)
    return Format(ITEM_ENHANCE_DESC.enhance_addon_group,ITEM_COLOR_DESC.DarkYellow,strEnhanceTemp)
end


function GetIsSuitTagMigratable(ItemDescTab)
    if ItemDescTab.equip_suite_group and ItemDescTab.equip_suite_group~=0 and ItemDescTab.equip_suite_tag and ItemDescTab.equip_suite_tag~=0 then
        if ItemDescTab.is_suit_tag_migratable and ItemDescTab.is_suit_tag_migratable == 1 or ItemDescTab.is_suit_tag_migratable == true then
            return ITEM_COLOR_DESC.Green .. SUIT_TAG_EXTRA_DESC
        else
            return ""
        end
    else
        return ""
    end
end


--  装备攻击力
function GetEquipMaxattack(ItemDescTab)
    if not ItemDescTab.equip_minattack and ItemDescTab.equip_minattack_add then
    	return ""
    end
    if ItemDescTab.equip_minattack == 0 and ItemDescTab.equip_minattack_add == 0 then
    	return ""
	end

	local equip_quality = ItemDescTab.quality
	local strColor = ITEM_COLORSTR[equip_quality] or ITEM_COLORSTR[0]
  	if (ItemDescTab.equip_maxattack > 0) then
  		if (ItemDescTab.equip_maxattack_add == nil) or (ItemDescTab.equip_maxattack_add == 0)  then --没有强化的附加
  			if ItemDescTab.equip_maxattack == ItemDescTab.equip_minattack then
  			    return Format(Format(strColor)..ITEM_EQUIP_MAXATTACK_DESC.EquipMaxattack1,ItemDescTab.equip_minattack).."\r"
     	  	else
     	    	return Format(Format(strColor)..ITEM_EQUIP_MAXATTACK_DESC.EquipMaxattack,ItemDescTab.equip_minattack,ItemDescTab.equip_maxattack).."\r"
          	end
 	 	else
    	 	if ItemDescTab.equip_maxattack == ItemDescTab.equip_minattack then
      			if ItemDescTab.equip_minattack_add == ItemDescTab.equip_maxattack_add then
         			return Format(Format(strColor)..ITEM_EQUIP_MAXATTACK_DESC.EquipMaxattack1,ItemDescTab.equip_minattack)..Format(ITEM_COLOR_DESC.Green)..Format(ITEM_EQUIP_MAXATTACK_DESC.EquipMaxattackAdd1,ItemDescTab.equip_maxattack_add)..Format(ITEM_COLOR_DESC.White)
     		 	elseif ItemDescTab.equip_minattack_add ~= ItemDescTab.equip_maxattack_add then
         			return Format(Format(strColor)..ITEM_EQUIP_MAXATTACK_DESC.EquipMaxattack1,ItemDescTab.equip_minattack)..Format(ITEM_COLOR_DESC.Green)..Format(ITEM_EQUIP_MAXATTACK_DESC.EquipMaxattackAdd,ItemDescTab.equip_maxattack_add,ItemDescTab.equip_minattack_add)..Format(ITEM_COLOR_DESC.White)
     		 	end
   			else
          		if ItemDescTab.equip_minattack_add == ItemDescTab.equip_maxattack_add then
      	     		return Format(Format(strColor)..ITEM_EQUIP_MAXATTACK_DESC.EquipMaxattack,ItemDescTab.equip_minattack,ItemDescTab.equip_maxattack)..Format(ITEM_COLOR_DESC.Green)..Format(ITEM_EQUIP_MAXATTACK_DESC.EquipMaxattackAdd1,ItemDescTab.equip_maxattack_add)..Format(ITEM_COLOR_DESC.White)
          		else
             		return Format(Format(strColor)..ITEM_EQUIP_MAXATTACK_DESC.EquipMaxattack,ItemDescTab.equip_minattack,ItemDescTab.equip_maxattack)..Format(ITEM_COLOR_DESC.Green)..Format(ITEM_EQUIP_MAXATTACK_DESC.EquipMaxattackAdd,ItemDescTab.equip_maxattack_add,ItemDescTab.equip_minattack_add)..Format(ITEM_COLOR_DESC.White)
          		end
			end
		end
	end
	return ""
end


--  装备防御力
function GetEquipDefence(ItemDescTab)
    if not ItemDescTab.equip_defence and ItemDescTab.equip_defence_add then
    	return ""
    end
    if ItemDescTab.equip_defence == 0 and ItemDescTab.equip_defence_add == 0 then
    	return ""
	end

	local equip_quality = ItemDescTab.quality
	local strColor = ITEM_COLORSTR[equip_quality] or ITEM_COLORSTR[0]
    if (ItemDescTab.equip_defence > 0) then
        if (ItemDescTab.equip_defence_add == nil) or (ItemDescTab.equip_defence_add == 0)  then
        	return strColor..Format(ITEM_EQUIP_DEFENCE_DESC.EquipDefence,ItemDescTab.equip_defence).."\r"
    	else
        	return strColor..Format(ITEM_EQUIP_DEFENCE_DESC.EquipDefence,ItemDescTab.equip_defence)..ITEM_COLOR_DESC.Green..Format(ITEM_EQUIP_DEFENCE_DESC.EquipDefenceAdd,ItemDescTab.equip_defence_add)..ITEM_COLOR_DESC.White
	    end
    end
	return ""
end


--  装备生命值
function GetEquipMaxhp(ItemDescTab)
    if not ItemDescTab.equip_max_hp and ItemDescTab.equip_max_hp_add then
    	return ""
    end
    if  ItemDescTab.equip_max_hp == 0 and ItemDescTab.equip_max_hp_add == 0 then
    	return ""
	end

    local equip_quality = ItemDescTab.quality
    local strColor = ITEM_COLORSTR[equip_quality] or ITEM_COLORSTR[0]
    if (ItemDescTab.equip_max_hp > 0) then
        if (ItemDescTab.equip_max_hp_add == nil) or (ItemDescTab.equip_max_hp_add == 0)  then
        	return strColor..Format(ITEM_EQUIP_MAX_HP_DESC.EquipMaxhp,ItemDescTab.equip_max_hp).."\r"
    	else
    	    return strColor..Format(ITEM_EQUIP_MAX_HP_DESC.EquipMaxhp,ItemDescTab.equip_max_hp)..ITEM_COLOR_DESC.Green..Format(ITEM_EQUIP_MAX_HP_DESC.EquipMaxhpAdd,ItemDescTab.equip_max_hp_add)..ITEM_COLOR_DESC.White
       	end
    end
	return ""
end


--  装备魔法值
function GetEquipMaxmp(ItemDescTab)
    if not (ItemDescTab.equip_max_mp) and (ItemDescTab.equip_max_mp_add) then
    	return ""
    end
    if (ItemDescTab.equip_max_mp == 0) and (ItemDescTab.equip_max_mp_add == 0) then
    	return ""
	end

	local equip_quality = ItemDescTab.quality
	local strColor = ITEM_COLORSTR[equip_quality] or ITEM_COLORSTR[0]
    if (ItemDescTab.equip_max_mp > 0) then
        if (ItemDescTab.equip_max_mp_add == nil) or (ItemDescTab.equip_max_mp_add == 0)  then
        	return strColor..Format(ITEM_EQUIP_MAX_MP_DESC.EquipMaxmp,ItemDescTab.equip_max_mp).."\r"
    	else
       		return strColor..Format(strColor..ITEM_EQUIP_MAX_MP_DESC.EquipMaxmp,ItemDescTab.equip_max_mp)..ITEM_COLOR_DESC.Green..Format(ITEM_EQUIP_MAX_MP_DESC.EquipMaxmpAdd,ItemDescTab.equip_max_mp_add)..ITEM_COLOR_DESC.White
	   	end
    end
	return ""
end


-- 判断是否显示分割线
-- 如果有强化属性、融合属性、改造属性则显示分割线
function GetSplitLine(ItemDescTab)
	if GetRefineLevel(ItemDescTab) ~= "" or GetEquipEnhanceMergeText(ItemDescTab) ~= "" then
	   return ITEM_COLOR_DESC.White.._t"─────────────────────────" .. "\r"
	else
	    return ""
	end
end


function GetAddOnSplitLine(ItemDescTab)
    if ItemDescTab.quality > 1 then
    	return ITEM_COLOR_DESC.White.._t"─────────────────────────" .. "\r"
    else
        return ""
    end
end    


function addLine()
    return ITEM_COLOR_DESC.White.._t"─────────────────────────" .. "\r"
end

