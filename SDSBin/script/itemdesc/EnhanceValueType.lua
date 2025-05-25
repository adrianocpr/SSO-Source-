--[[ @i18n item ]]
local _t = require("i18n").context("item")
---------------------------------------------------------------
--  created:   2012.7.12
--  author:    chenfudun
--
--  强化数据类型
---------------------------------------------------------------
local string, table = string, table
local Format = string.format
local Concat = table.concat
local Len	 = string.len
local Insert = table.insert
local SetString   = format_string.SetString
local formatString= format_string.formatString




------------------------------------------------------------------------------------
-- 强化数据类型

-- 策划配置
Equip_Enhance_Value_Type = {}
Equip_Enhance_Value_Type = 
{
	[1]		= _t"生命力",
	[13]	= _t"地攻击力",
	[14]	= _t"水攻击力",
	[15]	= _t"火攻击力",
	[16]	= _t"风攻击力",
	[35]	= _t"命中",
	[36]	= _t"闪避",
	[39]	= _t"防御力",
	[43]	= _t"暴击伤害",
	[107] = _t"攻击力",
	[113] = _t"雷攻击力",
}

-- 程序逻辑
function Equip_Enhance_Value_Type:GetEquipEnhanceValueType(id)
    local valueType = Equip_Enhance_Value_Type[id]
    if not valueType then
    valueType = ""
    end     
    return valueType  
end




------------------------------------------------------------------------------------
-- 强化数值属性与图表对应关系

-- 策划配置
Equip_Enhance_Type_Info = 
{
  progress_segment = 12,  -- 进度分段
  root_path = "res\\enhance\\",  -- 图表所在根目录
  [1]   = { name = _t"生命力",    icon = "life.tga"},
  [13]  = { name = _t"地攻击力",  icon = "groundattack.tga"},
  [14]  = { name = _t"水攻击力",  icon = "waterattack.tga"},
  [15]  = { name = _t"火攻击力",  icon = "fireattack.tga"},
  [16]  = { name = _t"风攻击力",  icon = "airattack.tga"},
  [35]  = { name = _t"命中",      icon = "hit.tga"},
  [36]  = { name = _t"闪避",      icon = "evade.tga"},
  [39]  = { name = _t"防御力",    icon = "defend.tga"},
  [43]  = { name = _t"暴击伤害",  icon = "criticaldamage.tga"},
  [107] = { name = _t"攻击力",    icon = "attack.tga"},
  [113] = { name = _t"雷攻击力",  icon = "thunderattack.tga"},
}


-- 程序逻辑
function Equip_Enhance_Type_Info:GetEnhanceTypeName(id)
  local name = ""
  local valueSet = Equip_Enhance_Type_Info[id] or nil
  if valueSet ~= nil then
      name = valueSet.name or ""
  end     
  return name  
end


function Equip_Enhance_Type_Info:GetEnhanceTypeIcon(id)
  local valueSet = self[id]
  if not valueSet then 
      return "" 
  end
  local root_path = self.root_path
  if root_path and valueSet.icon then
      return root_path .. valueSet.icon
  end
  return ""
end


function Equip_Enhance_Type_Info:GetEnhanceTypeNameAndIcon(id)
    local name = ""
    local icon = ""
    local valueSet = Equip_Enhance_Type_Info[id] or nil
    if valueSet then
      name = valueSet.name or ""
      local root_path = Equip_Enhance_Type_Info.root_path or nil
      if root_path ~= nil and valueSet.icon ~= nil then
        icon = root_path .. valueSet.icon
      end
    end
    return name, icon
end


function Equip_Enhance_Type_Info:GetPerfectPointFixFrame(curPerfectPoint, maxPerfectPoint)
  local retProgress = 0.0
  if curPerfectPoint and maxPerfectPoint then
    if maxPerfectPoint == 0 then
      retProgress = 0.0
    else
      local progress_segment = Equip_Enhance_Type_Info.progress_segment or nil
      if progress_segment ~= nil and progress_segment ~= 0 then
        local progress_segment_multiplier = 1 / progress_segment
        local realPerfectPoint = curPerfectPoint / maxPerfectPoint          
        for i=0,12 do
          local progress_floor = i * progress_segment_multiplier
          local progress_upper = (i+1) * progress_segment_multiplier
          if realPerfectPoint >= progress_floor and realPerfectPoint < progress_upper then
            retProgress = i
          end
        end
      end
    end
  end

  return retProgress
end




------------------------------------------------------------------------------------
----套装
Equip_Suite_Desc = {}

-- 策划配置
local Equip_Suit_Tag = 
{
    [1]  ={ str = _t"I·格里芬之爪", img = "魔法伤害抗性.tga"},
    [2]  ={ str = _t"II·金苹果", img = "魔法伤害抗性.tga"},
    [3]  ={ str = _t"III·丰饶之角", img = "魔法伤害抗性.tga"},
    [4]  ={ str = _t"IV·弥诺陶斯", img = "魔法伤害抗性.tga"},
    [5]  ={ str = _t"V·塞壬之羽", img = "魔法伤害抗性.tga"},
    [6]  ={ str = _t"VI·地狱之石", img = "魔法伤害抗性.tga"},
    [7]  ={ str = _t"VII·梅杜莎", img = "魔法伤害抗性.tga"},
    [8]  ={ str = _t"VIII·许德拉", img = "魔法伤害抗性.tga"},
    [9]	 ={ str = _t"IX·力量之杯", img = "魔法伤害抗性.tga"},
    [10] ={ str = _t"X·涅柔斯之环", img = "魔法伤害抗性.tga"},
    [11] ={ str = _t"XI·桂冠", img = "魔法伤害抗性.tga"},
    [12] ={ str = _t"XII·胜利之矛", img = "魔法伤害抗性.tga"},
    [13] ={ str = _t"XIII·英雄", img = "魔法伤害抗性.tga"},
    [14] ={ str = _t"XIV·复仇", img = "魔法伤害抗性.tga"},
    [15] ={ str = _t"XV·泰坦之力", img = "魔法伤害抗性.tga"},
    [16] ={ str = _t"XVIII·命运", img = "魔法伤害抗性.tga"},	
}

local Equip_Suit_Group = 
{
  [1] ={ 
      [1] = _t"地",
      [2] = _t"地★",
      [3] = _t"地★★",
      [4] = _t"地★★★",
      [5] = _t"地★★★★",
      [6] = _t"地★x5",
      [7] = _t"地★x6",
      [8] = _t"地★x7",
      [9] = _t"地★x8",
      [10] = _t"地★x9",
      },
  [2] ={ 
      [1] = _t"水",
      [2] = _t"水★",
      [3] = _t"水★★",
      [4] = _t"水★★★",
      [5] = _t"水★★★★",
      [6] = _t"水★x5",
      [7] = _t"水★x6",
      [8] = _t"水★x7",
      [9] = _t"水★x8",
      [10] = _t"水★x9",
      },
  [3] ={ 
      [1] = _t"火",
      [2] = _t"火★",
      [3] = _t"火★★",
      [4] = _t"火★★★",
      [5] = _t"火★★★★",
      [6] = _t"火★x5",
      [7] = _t"火★x6",
      [8] = _t"火★x7",
      [9] = _t"火★x8",
      [10] = _t"火★x9",
      },
  [4] ={ 
      [1] = _t"风",
      [2] = _t"风★",
      [3] = _t"风★★",
      [4] = _t"风★★★",
      [5] = _t"风★★★★",
      [6] = _t"风★x5",
      [7] = _t"风★x6",
      [8] = _t"风★x7",
      [9] = _t"风★x8",
      [10] = _t"风★x9",
      },
  [5] ={ 
      [1] = _t"雷",
      [2] = _t"雷★",
      [3] = _t"雷★★",
      [4] = _t"雷★★★",
      [5] = _t"雷★★★★",
      [6] = _t"雷★x5",
      [7] = _t"雷★x6",
      [8] = _t"雷★x7",
      [9] = _t"雷★x8",
      [10] = _t"雷★x9",
      },
}

local Euip_Suit_AddOn_Desc = 
{
    [1] = {
        [1]=_t"[4]增加防御\r[4]增加地攻击\r[5]增加生命\r[6]增加地攻击",
        [2]=_t"[4]增加防御\r[4]增加地攻击\r[5]增加生命\r[5]增加命中\r[6]增加地攻击\r[6]增加闪避",
        [3]=_t"[4]增加防御\r[4]增加地攻击\r[5]增加生命\r[5]增加命中\r[6]增加地攻击\r[6]增加闪避",
        [4]=_t"[4]增加防御\r[4]增加地攻击\r[5]增加生命\r[5]增加命中\r[6]增加地攻击\r[6]增加闪避\r[6]增加暴击率",
        [5]=_t"[4]增加防御\r[4]增加地攻击\r[5]增加生命\r[5]增加命中\r[6]增加地攻击\r[6]增加闪避\r[6]增加暴击率",
        [6]=_t"[4]增加防御\r[4]增加地攻击\r[5]增加生命\r[5]增加命中\r[6]增加地攻击\r[6]增加闪避\r[6]增加暴击率",
        [7]=_t"[4]增加防御\r[4]增加地攻击\r[5]增加生命\r[5]增加命中\r[6]增加地攻击\r[6]增加闪避\r[6]增加暴击率",
        [8]=_t"[4]增加防御\r[4]增加地攻击\r[5]增加生命\r[5]增加命中\r[6]增加地攻击\r[6]增加闪避\r[6]增加暴击率",
        [9]=_t"[4]增加防御\r[4]增加地攻击\r[5]增加生命\r[5]增加命中\r[6]增加地攻击\r[6]增加闪避\r[6]增加暴击率",
    },
    [2] = {
        [1]=_t"[4]增加防御\r[4]增加水攻击\r[5]增加生命\r[6]增加水攻击",
        [2]=_t"[4]增加防御\r[4]增加水攻击\r[5]增加生命\r[5]增加命中\r[6]增加水攻击\r[6]增加闪避",
        [3]=_t"[4]增加防御\r[4]增加水攻击\r[5]增加生命\r[5]增加命中\r[6]增加水攻击\r[6]增加闪避",
        [4]=_t"[4]增加防御\r[4]增加水攻击\r[5]增加生命\r[5]增加命中\r[6]增加水攻击\r[6]增加闪避\r[6]增加暴击率",
        [5]=_t"[4]增加防御\r[4]增加水攻击\r[5]增加生命\r[5]增加命中\r[6]增加水攻击\r[6]增加闪避\r[6]增加暴击率",
        [6]=_t"[4]增加防御\r[4]增加水攻击\r[5]增加生命\r[5]增加命中\r[6]增加水攻击\r[6]增加闪避\r[6]增加暴击率",
        [7]=_t"[4]增加防御\r[4]增加水攻击\r[5]增加生命\r[5]增加命中\r[6]增加水攻击\r[6]增加闪避\r[6]增加暴击率",
        [8]=_t"[4]增加防御\r[4]增加水攻击\r[5]增加生命\r[5]增加命中\r[6]增加水攻击\r[6]增加闪避\r[6]增加暴击率",
        [9]=_t"[4]增加防御\r[4]增加水攻击\r[5]增加生命\r[5]增加命中\r[6]增加水攻击\r[6]增加闪避\r[6]增加暴击率",
    },
    [3] = {
        [1]=_t"[4]增加防御\r[4]增加火攻击\r[5]增加生命\r[6]增加火攻击",
        [2]=_t"[4]增加防御\r[4]增加火攻击\r[5]增加生命\r[5]增加命中\r[6]增加火攻击\r[6]增加闪避",
        [3]=_t"[4]增加防御\r[4]增加火攻击\r[5]增加生命\r[5]增加命中\r[6]增加火攻击\r[6]增加闪避",
        [4]=_t"[4]增加防御\r[4]增加火攻击\r[5]增加生命\r[5]增加命中\r[6]增加火攻击\r[6]增加闪避\r[6]增加暴击率",
        [5]=_t"[4]增加防御\r[4]增加火攻击\r[5]增加生命\r[5]增加命中\r[6]增加火攻击\r[6]增加闪避\r[6]增加暴击率",
        [6]=_t"[4]增加防御\r[4]增加火攻击\r[5]增加生命\r[5]增加命中\r[6]增加火攻击\r[6]增加闪避\r[6]增加暴击率",
        [7]=_t"[4]增加防御\r[4]增加火攻击\r[5]增加生命\r[5]增加命中\r[6]增加火攻击\r[6]增加闪避\r[6]增加暴击率",
        [8]=_t"[4]增加防御\r[4]增加火攻击\r[5]增加生命\r[5]增加命中\r[6]增加火攻击\r[6]增加闪避\r[6]增加暴击率",
        [9]=_t"[4]增加防御\r[4]增加火攻击\r[5]增加生命\r[5]增加命中\r[6]增加火攻击\r[6]增加闪避\r[6]增加暴击率",
    },
    [4] = {
        [1]=_t"[4]增加防御\r[4]增加风攻击\r[5]增加生命\r[6]增加风攻击",
        [2]=_t"[4]增加防御\r[4]增加风攻击\r[5]增加生命\r[5]增加命中\r[6]增加风攻击\r[6]增加闪避",
        [3]=_t"[4]增加防御\r[4]增加风攻击\r[5]增加生命\r[5]增加命中\r[6]增加风攻击\r[6]增加闪避",
        [4]=_t"[4]增加防御\r[4]增加风攻击\r[5]增加生命\r[5]增加命中\r[6]增加风攻击\r[6]增加闪避\r[6]增加暴击率",
        [5]=_t"[4]增加防御\r[4]增加风攻击\r[5]增加生命\r[5]增加命中\r[6]增加风攻击\r[6]增加闪避\r[6]增加暴击率",
        [6]=_t"[4]增加防御\r[4]增加风攻击\r[5]增加生命\r[5]增加命中\r[6]增加风攻击\r[6]增加闪避\r[6]增加暴击率",
        [7]=_t"[4]增加防御\r[4]增加风攻击\r[5]增加生命\r[5]增加命中\r[6]增加风攻击\r[6]增加闪避\r[6]增加暴击率",
        [8]=_t"[4]增加防御\r[4]增加风攻击\r[5]增加生命\r[5]增加命中\r[6]增加风攻击\r[6]增加闪避\r[6]增加暴击率",
        [9]=_t"[4]增加防御\r[4]增加风攻击\r[5]增加生命\r[5]增加命中\r[6]增加风攻击\r[6]增加闪避\r[6]增加暴击率",
    },
    [5] = {
        [1]=_t"[4]增加防御\r[4]增加雷攻击\r[5]增加生命\r[6]增加雷攻击",
        [2]=_t"[4]增加防御\r[4]增加雷攻击\r[5]增加生命\r[5]增加命中\r[6]增加雷攻击\r[6]增加闪避",
        [3]=_t"[4]增加防御\r[4]增加雷攻击\r[5]增加生命\r[5]增加命中\r[6]增加雷攻击\r[6]增加闪避",
        [4]=_t"[4]增加防御\r[4]增加雷攻击\r[5]增加生命\r[5]增加命中\r[6]增加雷攻击\r[6]增加闪避\r[6]增加暴击率",
        [5]=_t"[4]增加防御\r[4]增加雷攻击\r[5]增加生命\r[5]增加命中\r[6]增加雷攻击\r[6]增加闪避\r[6]增加暴击率",
        [6]=_t"[4]增加防御\r[4]增加雷攻击\r[5]增加生命\r[5]增加命中\r[6]增加雷攻击\r[6]增加闪避\r[6]增加暴击率",
        [7]=_t"[4]增加防御\r[4]增加雷攻击\r[5]增加生命\r[5]增加命中\r[6]增加雷攻击\r[6]增加闪避\r[6]增加暴击率",
        [8]=_t"[4]增加防御\r[4]增加雷攻击\r[5]增加生命\r[5]增加命中\r[6]增加雷攻击\r[6]增加闪避\r[6]增加暴击率",
        [9]=_t"[4]增加防御\r[4]增加雷攻击\r[5]增加生命\r[5]增加命中\r[6]增加雷攻击\r[6]增加闪避\r[6]增加暴击率",
    },
}

local Equip_Suit_Group_Combo =
{
    {_t"任意", 0},
    {_t"地",   1},
    {_t"水",   2},
    {_t"火",   3},
    {_t"风",   4},
    {_t"雷",   5},
}

local Equip_Suit_Tag_Combo = 
{
    {_t"更高",  0},
    {_t"★",     2},
    {_t"★★",    3},
    {_t"★★★",   4},
    {_t"★★★★",  5},
    {_t"★x5",   6}, 
    {_t"★x6",   7}, 
    {_t"★x7",   8},
    {_t"★x8",   9},
}




-- 程序逻辑
-- 套装类型
function Equip_Suite_Desc:GetEquipSuitTagDesc(suit_tag)
    local tagType = Equip_Suit_Tag[suit_tag] or nil
    if not tagType then
		  tagType = ""
    end     
    return tagType.str  
end


function Equip_Suite_Desc:GetEquipSuitGroupDesc(suit_group, suit_tag)
    if Equip_Suit_Group[suit_group] then
        return Equip_Suit_Group[suit_group][suit_tag] or ""
    end
    return ""
end


-- 套装属性包描述
function Equip_Suite_Desc:GetEquipSuitAddOnDesc(isActive, suit_group, suit_tag, ...)
  if isActive then
    num, level, str1, str2, str3 = ...
    return self:GetEquipSuitAddOnDescActive(suit_group, suit_tag, num, level, str1, str2, str3)
  else
    return self:GetEquipSuitAddOnDescInactive(suit_group, suit_tag)
  end
end


-- 套装未激活属性包描述
function Equip_Suite_Desc:GetEquipSuitAddOnDescInactive(suit_group, suit_tag)
    local suit_addon_desc = {}
    Insert(suit_addon_desc, Format(ITEM_COLOR_DESC.Green .. EQUIP_SUIT_TAG_DESC_TITLE1, self:GetEquipSuitGroupDesc(suit_group, suit_tag)))
    if Euip_Suit_AddOn_Desc[suit_group] then
       Insert(suit_addon_desc,ITEM_COLOR_DESC.Gray .. Euip_Suit_AddOn_Desc[suit_group][suit_tag])
    end
    return Concat(suit_addon_desc)
end


--套装激活属性包描述
--param: 
--  suit_group:套装分组id
--  suit_tag:套装标识id
--  num:套装标示数量
--  level:套装等阶
--  str1:4条激活属性包
--  str2:5条激活属性包
--  str3:6条激活属性包
function Equip_Suite_Desc:GetEquipSuitAddOnDescActive(suit_group, suit_tag, num, level, str1, str2, str3)
   local suit_addon_desc = {}
   Insert(suit_addon_desc, ITEM_COLOR_DESC.Yellow)
   local suit_title = Equip_Suite_Desc:GetEquipSuitGroupDesc(suit_group, suit_tag) or ""
   if suit_title == "" then
       return ""
   end
   if num < 4 then
       return ""
   elseif num == 4 then  --formatString
       Insert(suit_addon_desc, Format(EQUIP_SUIT_TAG_DESC_TITLE,Equip_Suite_Desc:GetEquipSuitGroupDesc(suit_group, suit_tag)))
       Insert(suit_addon_desc, Format(ITEM_COLOR_DESC.Green .. EQUIP_SUIT_TAG_DESC_STR1,formatString(str1,"[4]",1)))
       Insert(suit_addon_desc, Format(ITEM_COLOR_DESC.Gray ..  EQUIP_SUIT_TAG_DESC_STR2,formatString(str2,"[5]",1)))
       Insert(suit_addon_desc, Format(ITEM_COLOR_DESC.Gray ..  EQUIP_SUIT_TAG_DESC_STR3,formatString(str3,"[6]",1)))
   elseif num == 5 then
       Insert(suit_addon_desc, Format(EQUIP_SUIT_TAG_DESC_TITLE,Equip_Suite_Desc:GetEquipSuitGroupDesc(suit_group, suit_tag)))
       Insert(suit_addon_desc, Format(ITEM_COLOR_DESC.Green .. EQUIP_SUIT_TAG_DESC_STR1,formatString(str1,"[4]",1)))
       Insert(suit_addon_desc, Format(ITEM_COLOR_DESC.Green .. EQUIP_SUIT_TAG_DESC_STR2,formatString(str2,"[5]",1)))
       Insert(suit_addon_desc, Format(ITEM_COLOR_DESC.Gray ..  EQUIP_SUIT_TAG_DESC_STR3,formatString(str3,"[6]",1)))
   elseif num == 6 then
       Insert(suit_addon_desc, Format(EQUIP_SUIT_TAG_DESC_TITLE,Equip_Suite_Desc:GetEquipSuitGroupDesc(suit_group, suit_tag)))
       Insert(suit_addon_desc, Format(ITEM_COLOR_DESC.Green .. EQUIP_SUIT_TAG_DESC_STR1,formatString(str1,"[4]",1)))
       Insert(suit_addon_desc, Format(ITEM_COLOR_DESC.Green .. EQUIP_SUIT_TAG_DESC_STR2,formatString(str2,"[5]",1)))
       Insert(suit_addon_desc, Format(ITEM_COLOR_DESC.Green .. EQUIP_SUIT_TAG_DESC_STR3,formatString(str3,"[6]",1)))
   else
       return ""
   end
   return Concat(suit_addon_desc)
end


function Equip_Suite_Desc:GetEquipEnhanceSuitAddon(cur_addon, cur_perfect, next_addon, next_perfect, bSenior)
  local addon_desc  = bSenior and STRING_EQUIP_ENHANCE_SUIT_ADDON_DESC_ADVANCE or STRING_EQUIP_ENHANCE_SUIT_ADDON_DESC
  local perfect_desc= bSenior and STRING_EQUIP_ENHANCE_SUIT_DESC_ADVANCE or STRING_EQUIP_ENHANCE_SUIT_DESC

  -- 当前
  local cur_addon_desc = _t""
  do
    local desc = Addon_Func:GetAddonPackageDesc(cur_addon, false)
    if desc and desc ~="" then        
        cur_addon_desc = ITEM_COLOR_DESC.Enhance .. Format(addon_desc, SetString(desc, " ", 3))        
    end
  end
  local cur_perfect_desc  = Format(perfect_desc, cur_perfect * 100)

  -- 下一级
  local next_addon_desc = _t""
  do
    local desc = Addon_Func:GetAddonPackageDesc(next_addon, false)
    if desc and desc ~="" then
        next_addon_desc = ITEM_COLOR_DESC.Enhance .. Format(addon_desc, SetString(desc, " ", 3))
    end
  end
  local next_perfect_desc = Format(perfect_desc, next_perfect * 100)

  return cur_perfect_desc .. cur_addon_desc, next_perfect_desc .. next_addon_desc
end


-- 套装图标
function Equip_Suite_Desc:GetEquipSuitTagIcon(id)
  local tagType = Equip_Suit_Tag[id]
  if not tagType then
		  return ""
  else
    local strUnit = DlgApiEx.GetImageString(ResourceConfig:GetAttributeIcon(tagType.img), ICONS_HINT)    
    return strUnit and Format("%s", strUnit) or ""		
  end
end	    


function Equip_Suite_Desc:GetEquipSuitCombo()
    return Equip_Suit_Group_Combo, Equip_Suit_Tag_Combo 
end




------------------------------------------------------------------------------------
----分解装备概率描述
Equip_Compose_Prob_Desc = {}

-- 策划配置
Equip_MagicBox_Prob_Desc = 
{
  [1]   = "",       -- 0
  [2]  = _t"极小",    -- (0-0.1]
  [3]  = _t"较小",    -- (0.1，0.4]
  [4]  = _t"较大",    -- (0.4，0.7]
  [5]  = _t"很大",    -- (0.7，1)
  [6]  = _t"极大",    -- 1
}

-- 程序逻辑
function Equip_MagicBox_Prob_Desc:GetEquipMagicBoxProbDesc(prob)
   if not prob or prob == 0.0 then
      return Equip_MagicBox_Prob_Desc[1]
   elseif prob > 0.0 and prob <= 0.1 then
      return Equip_MagicBox_Prob_Desc[2]
   elseif prob > 0.1 and prob <= 0.4 then
      return Equip_MagicBox_Prob_Desc[3]
   elseif prob > 0.4 and prob <= 0.7 then
      return Equip_MagicBox_Prob_Desc[4]
   elseif prob > 0.7 and prob < 1.0 then
      return Equip_MagicBox_Prob_Desc[5] 
   elseif prob >= 1.0 then
      return Equip_MagicBox_Prob_Desc[6] 
   end    
end



------------------------------------------------------------------------------------
----连续聚能完美度配置
Enhance_Continue_Perfects = {}

-- 策划配置
Enhance_Continue_Perfects = 
{
  _t"更高", _t"70", _t"80", _t"85", _t"90", _t"95", _t"100", 
}