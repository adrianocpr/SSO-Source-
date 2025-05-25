local sandbox = require("sandbox")
local random = math.random
local GetImageString = DlgApiEx.GetImageString
local rep = string.rep
--------------------------------
-- 一些客户端的配置资源
ResourceConfig = {}



-- Loading相关
local loading_cfg = sandbox.create_basic()
local function load_loading_config()
	local success, err = loading_cfg("script/config/loading.lua")
	if not success then
		console.error(err)
		return
	end

	for k, v in pairs(loading_cfg.tips) do
		if type(v) == "table" and type(v.level_specific) == "table" then
			v.level_specific = stairs_table:setup(v.level_specific, "floor")
		end
	end
	for k, v in pairs(loading_cfg.loading_background) do
		if type(v) == "table" and type(v.level_specific) == "table" then
			v.level_specific = stairs_table:setup(v.level_specific, "floor")
		end
	end
end
load_loading_config()

function ResourceConfig:GetLoadingPic(is_swf)
	return self:GetLoadingBackground(0)
end

function random_in_cfg(cfg, player_level)
	if type(cfg) ~= "table" then return end

	local candidates = {}
	for _, v in ipairs(cfg) do
		table.insert(candidates, v)
	end

	if player_level > 0 and type(cfg.level_specific) == "table" then
		local level_cfg = cfg.level_specific[player_level] or {}
		for _, v in ipairs(level_cfg) do
			table.insert(candidates, v)
		end
	end

	if not candidates or #candidates <= 0 then
		return
	end

	local index = random(1, #candidates)
	return candidates[index]
end

function ResourceConfig:GetLoadingBackground(map_id, player_level)
	player_level = player_level or 0

	local cfg = loading_cfg.loading_background[map_id]
	local path = random_in_cfg(cfg, player_level) or
		random_in_cfg(loading_cfg.loading_background.default, player_level)

	return path or ""
end

function ResourceConfig:GetLoadingTip(map_id, player_level)
	player_level = player_level or 0

	local cfg = loading_cfg.tips[map_id]
	local tip = random_in_cfg(cfg, player_level) or
		random_in_cfg(loading_cfg.tips.default, player_level)

	if type(tip) == "table" then
		return unpack(tip)
	end

	return tip
end

-- 守护星座图标
ResourceConfig.ProfIcons =
{
	[PROF_RESERVE]		= "\\ingame\\prof1.tga",
	[PROF_DEFAULT]		= "\\ingame\\prof1.tga",
	[PROF_PEGASI]		= "\\ingame\\prof2.tga",
	[PROF_CYGNI]		= "\\ingame\\prof3.tga",
	[PROF_DRACONIS]		= "\\ingame\\prof4.tga",
	[PROF_ANDROMEDAE]	= "\\ingame\\prof5.tga",
	[PROF_PHOENIX]		= "\\ingame\\prof6.tga",
	[PROF_GEMINORUM]	= "\\ingame\\prof7.tga",

	[PROF_SAGITTARIUS]	= "\\ingame\\prof102.tga",
	[PROF_AQUARIUS]		= "\\ingame\\prof103.tga",
	[PROF_LIBRA]		= "\\ingame\\prof104.tga",
	[PROF_VIRGO]		= "\\ingame\\prof105.tga",
	[PROF_LEO]			= "\\ingame\\prof106.tga",
	[PROF_GEMINI]		= "\\ingame\\prof107.tga",
}
function ResourceConfig:GetProfIconPath(prof, is_prof2)
	if is_prof2 then
		return ResourceConfig.ProfIcons[prof + PROF_UP_MASK] or ""
	end
	return ResourceConfig.ProfIcons[prof] or ""
end

-- 钱币图标
ResourceConfig.MoneyPicList =
{
	[1] = {bind = "绑定铜币.tga", unbind = "铜币.tga"},
	[2] = {bind = "绑定银币.tga", unbind = "银币.tga"},
	[3] = {bind = "绑定金币.tga", unbind = "金币.tga"},
	[4] = {bind = "绑定人民币.tga", unbind = "人民币.tga"},
}
function ResourceConfig:GetMoneyPic(lev, bBind)
	if not self.MoneyPicList[lev] then
		return
	end
	if bBind then
		return self.MoneyPicList[lev].bind
	else
		return self.MoneyPicList[lev].unbind
	end
end

function ResourceConfig:FormatMoney(money, is_bind)
	local result = {}
	for i, v in ipairs(ResourceConfig.MoneyPicList) do
		local value = i < #ResourceConfig.MoneyPicList and money % 100 or money

		local icon = GetImageString(v[is_bind and "bind" or "unbind"], ICONS_HINT)
		table.insert(result, 1, icon .. tostring(value))

		money = math.floor(money / 100)
		if money <= 0 then break end
	end
	return table.concat(result)
end


-- 装备品质图标
ResourceConfig.EquipStarList =
{
	[1]  = {img = "绿色星钻.tga", num = 1,},
	[2]  = {img = "绿色星钻.tga", num = 2,},
	[3]  = {img = "绿色星钻.tga", num = 3,},
	[4]  = {img = "蓝色星钻.tga", num = 1,},
	[5]  = {img = "蓝色星钻.tga", num = 2,},
	[6]  = {img = "蓝色星钻.tga", num = 3,},
	[7]  = {img = "紫色星钻.tga", num = 1,},
	[8]  = {img = "紫色星钻.tga", num = 2,},
	[9]  = {img = "紫色星钻.tga", num = 3,},
	[10] = {img = "橙色星钻.tga", num = 1,},
	[11] = {img = "橙色星钻.tga", num = 2,},
	[12] = {img = "橙色星钻.tga", num = 3,},
	[13] = {img = "金色星钻.tga", num = 1,},
	[14] = {img = "金色星钻.tga", num = 2,},
	[15] = {img = "金色星钻.tga", num = 3,},
}
function ResourceConfig:GetStarQulityImg(star)
	local info = self.EquipStarList[star]
	if not info then
		return ""
	end
	local str = GetImageString(info.img, ICONS_HINT)
	return rep(str, info.num or 1)
end

-- 宠物成长度星级
ResourceConfig.PetGrowthGradeStars =
{
	one = "绿色星钻.tga",
	half = "空心绿星钻.tga",
}
function ResourceConfig:GetPetGrowthGradeStarImg(grade_star)
	local value = grade_star - 1
	if value <= 0 then return "" end

	local star = math.floor(value / 2)
	local half = value % 2
	local star_img = GetImageString(self.PetGrowthGradeStars.one, ICONS_HINT)
	star_img = rep(star_img, star)
	if half > 0 then
		star_img = star_img .. GetImageString(self.PetGrowthGradeStars.half, ICONS_HINT)
	end
		return star_img
end

-- 难度星级
ResourceConfig.DifficultyStars =
{
	one = "绿色星钻.tga",
	half = "空心绿星钻.tga",
}
function ResourceConfig:GetDifficultyStarImg(value)
	if value <= 0 then return "" end
	if value > 10 then value = 10 end

	local star = math.floor(value / 2)
	local half = value % 2
	local star_img = GetImageString(self.PetGrowthGradeStars.one, ICONS_HINT)
	star_img = rep(star_img, star)
	if half > 0 then
		star_img = star_img .. GetImageString(self.PetGrowthGradeStars.half, ICONS_HINT)
	end
		return star_img
end


-- 连续技能
-- 资源必须在surfaces\iconset\iconlist_skillgrp.txt中
ResourceConfig.SequenceList =
{
	"连续技1.dds",
	"连续技2.dds",
	"连续技3.dds",
	"连续技4.dds",
	"连续技5.dds",
	"连续技6.dds",
	"连续技7.dds",
}
ResourceConfig.NoSkill				= "连续技8.dds"
ResourceConfig.LoopSkill			= "连续技9.dds"
ResourceConfig.NoEditSequence		= "连续技10.dds"
ResourceConfig.NoEditSequenceIdx	= 255

function ResourceConfig:GetSequenceImage(idx)
	if idx == self.NoEditSequenceIdx then
	    return self.NoEditSequence
	elseif idx <= 0 then
	    return self.SequenceList[1]
	elseif idx > #self.SequenceList then
	    return self.SequenceList[#self.SequenceList]
	end
	return self.SequenceList[idx]
end

function ResourceConfig:GetSequenceImageList()
    return self.SequenceList
end

function ResourceConfig:GetSequenceImageMaxIndex()
	return #self.SequenceList
end

function ResourceConfig:GetLoopSkillImage()
    return self.LoopSkill
end

function ResourceConfig:GetNoSkillImage()
    return self.NoSkill
end




-- 属性图标
-- 属性名见 i18n/interface.lua
-- 图标见 iconset/iconlist_hint.dds
ResourceConfig.AttributeList =
{
    ATTRIBUTE_HP                = "生命力.tga",
    ATTRIBUTE_DMG               = "最大攻击.tga",
    ATTRIBUTE_DEF               = "防御力.tga",
    ATTRIBUTE_ATTACK            = "命中.tga",
	ATTRIBUTE_ARMOR				= "闪躲.tga",
	ATTRIBUTE_CRIT_RATE			= "暴击率.tga",
	ATTRIBUTE_EARTH_DMG			= "地属性攻击力.tga",
	ATTRIBUTE_WATER_DMG			= "水属性攻击里.tga",
	ATTRIBUTE_FIRE_DMG			= "火属性攻击力.tga",
	ATTRIBUTE_WIND_DMG			= "风属性攻击力.tga",

	ATTRIBUTE_EARTH_ANTI_REDUCE	= "地属性攻击抗性减免.tga",
	ATTRIBUTE_WATER_ANTI_REDUCE	= "水属性攻击抗性减免.tga",
    ATTRIBUTE_FIRE_ANTI_REDUCE  = "火属性攻击抗性减免.tga",
    ATTRIBUTE_WIND_ANTI_REDUCE  = "风属性攻击抗性减免.tga",


    ATTRIBUTE_EARTH_ANTI        = "地属性攻击抗性.tga",
    ATTRIBUTE_WATER_ANTI        = "水属性攻击抗性.tga",
    ATTRIBUTE_FIRE_ANTI         = "火属性攻击抗性.tga",
	ATTRIBUTE_WIND_ANTI			= "风属性攻击抗性.tga",

	ATTRIBUTE_LUCKY_ATTACK		= "幸运一击.tga",
	ATTRIBUTE_IMPAIR_CRIT_RATE	= "暴击率减免.tga",
	ATTRIBUTE_CRIT_DMG			= "暴击附加伤害.tga",
    ATTRIBUTE_IMPAIR_CRIT_DMG   = "暴击附加伤害减免.tga",
    ATTRIBUTE_PARRY             = "招架.tga",
    ATTRIBUTE_PENETRATION       = "体力值.tga",
    ATTRIBUTE_DAMAGE_RATE       = "伤害倍率.tga",
    ATTRIBUTE_RESIST_DMG        = "伤害抗性.tga",
    ATTRIBUTE_PHY_DMG_ANTI      = "物理伤害抗性.tga",
    ATTRIBUTE_MAGIC_DMG_ANTI    = "魔法伤害抗性.tga",

	ATTRIBUTE_THUNDER_DMG			= "雷属性攻击力.tga",
	ATTRIBUTE_THUNDER_ANTI_REDUCE	= "雷属性抗性减免.tga",
	ATTRIBUTE_THUNDER_ANTI			= "雷属性抗性.tga",
	ATTRIBUTE_MAGIC_SILENT_ANTI		= "沉默抗性.tga",
	ATTRIBUTE_MAGIC_DISORDER_ANTI	= "混乱抗性.tga",
	ATTRIBUTE_MAGIC_POISON_ANTI		= "中毒抗性.tga",
	ATTRIBUTE_MAGIC_BLOOD_ANTI		= "流血抗性.tga",
	ATTRIBUTE_MAGIC_BURN_ANTI		= "灼烧抗性.tga",
	ATTRIBUTE_MAGIC_FALL_ANTI		= "倒地抗性.tga",
	ATTRIBUTE_MAGIC_FREEZE_ANTI		= "冰冻抗性.tga",
	ATTRIBUTE_MAGIC_STONE_ANTI		= "石化抗性.tga",
	ATTRIBUTE_MAGIC_SLOW_ANTI		= "移动控制抗性.tga",
	ATTRIBUTE_MAGIC_WEAK_ANTI		= "虚弱抗性.tga",

	ATTRIBUTE_MAGIC_SILENT_IGNORE	= "沉默抗性忽视.tga",
	ATTRIBUTE_MAGIC_DISORDER_IGNORE	= "混乱抗性忽视.tga",
	ATTRIBUTE_MAGIC_POISON_IGNORE	= "中毒抗性忽视.tga",
	ATTRIBUTE_MAGIC_BLOOD_IGNORE	= "流血抗性忽视.tga",
	ATTRIBUTE_MAGIC_BURN_IGNORE		= "灼烧抗性忽视.tga",
	ATTRIBUTE_MAGIC_FALL_IGNORE		= "倒地抗性忽视.tga",
	ATTRIBUTE_MAGIC_FREEZE_IGNORE	= "冰冻抗性忽视.tga",
	ATTRIBUTE_MAGIC_STONE_IGNORE	= "石化抗性忽视.tga",
	ATTRIBUTE_MAGIC_SLOW_IGNORE		= "移动控制抗性忽视.tga",
	ATTRIBUTE_MAGIC_WEAK_IGNORE		= "虚弱抗性忽视.tga",

	ATTRIBUTE_BATTLE_POWER			= "悬浮战斗力.tga",
	ATTRIBUTE_SURPLICE_LEV			= "冥衣.tga",
	ATTRIBUTE_EXP					= "经验.tga",
	ATTRIBUTE_SECOND_EXP			= "历练.tga",
	ATTRIBUTE_STORE_EXP				= "经验.tga",
	ATTRIBUTE_STORE_EXP2			= "历练.tga",
}
function ResourceConfig:GetAttributeIcon(key)
	return self.AttributeList[key]
end

ResourceConfig.EnhanceLevel =
{
	SELF_LEVEL_1 = "白色聚能.tga",
 	SELF_LEVEL_2 = "绿色聚能.tga",
 	SELF_LEVEL_3 = "蓝色聚能.tga",
 	SELF_LEVEL_4 = "紫色聚能.tga",
 	SELF_LEVEL_5 = "橙色聚能.tga",
 }
 function ResourceConfig:GetEnhanceLevel(key)
	return self.EnhanceLevel[key]
 end

ResourceConfig.SkillSlot =
{
	SLOT_EMPTY = "宠物空白.tga",
	SLOT_FULL  = "宠物填充.tga",
}

function ResourceConfig:GetSkillSlot(key)
    return self.SkillSlot[key]
end
-- 战斗力图标
-- 战斗力名见 i18n/interface.lua
-- 图标见 iconset/iconlist_hint.dds
ResourceConfig.PowerList =
{
-- 暂时不需要图标
	--SELF_LEVEL_GROWTH = "绑定金币.tga",
	--SELF_XINFA_SKILL = "人民币.tga",
	--SELF_TEXUN_SKILL = "空心橙星钻.tga",
	--SELF_CHUILIAN_SKILL = "紫色星钻.tga",
}
function ResourceConfig:GetPowerIcon(key)
	return self.PowerList[key]
end



ResourceConfig.GuideTipImage =
{
	default =
	{
		up 		= "common\\button\\normal_U.tga",
		down 	= "common\\button\\normal_D.tga",
		onhover	= "common\\button\\normal_H.tga",
	},
	other =
	{
		up 		= "common\\ButtonImage\\Tips_U.tga",
		down 	= "common\\ButtonImage\\Tips_D.tga",
		onhover	= "common\\ButtonImage\\Tips_H.tga",
	},
	bless =
	{
		up 		= "common\\ButtonImage\\Athna_U.tga",
		down 	= "common\\ButtonImage\\Athna_D.tga",
		onhover	= "common\\ButtonImage\\Athna_H.tga",
	},
}

function ResourceConfig:GetTipImage(typ)
    if typ == TYPE_GUIDE then
    	return self.GuideTipImage.default
    elseif typ == TYPE_ATHENA then
        return self.GuideTipImage.bless
    end
    return self.GuideTipImage.other
end


ResourceConfig.NumImage =
{
	[0] = "common\\edit\\0.tga",
	[1] = "common\\edit\\1.tga",
	[2] = "common\\edit\\2.tga",
	[3] = "common\\edit\\3.tga",
	[4] = "common\\edit\\4.tga",
	[5] = "common\\edit\\5.tga",
	[6] = "common\\edit\\6.tga",
	[7] = "common\\edit\\7.tga",
	[8] = "common\\edit\\8.tga",
	[9] = "common\\edit\\9.tga",
}
function ResourceConfig:GetNumImage(num)
    return self.NumImage[num] or ""
end
ResourceConfig.AttriImg =
{
	wind = {icon = "风属性攻击力.tga",hint = _t"风属性伤害提升 %d%%",},
	fire = {icon = "火属性攻击力.tga",hint = _t"火属性伤害提升 %d%%",},
	water = {icon = "水属性攻击力.tga",hint = _t"水属性伤害提升 %d%%",},
	earth = {icon = "地属性攻击力.tga",hint = _t"地属性伤害提升 %d%%",},
	thunder = {icon = "雷属性攻击力.tga",hint = _t"雷属性伤害提升 %d%%",},
}
ResourceConfig.ProfAttriImg =
{
	[PROF_PEGASI] 		= {ResourceConfig.AttriImg.wind,ResourceConfig.AttriImg.thunder},
	[PROF_CYGNI] 		= {ResourceConfig.AttriImg.water,ResourceConfig.AttriImg.wind},
	[PROF_DRACONIS] 	= {ResourceConfig.AttriImg.earth,ResourceConfig.AttriImg.water},
	[PROF_ANDROMEDAE] 	= {ResourceConfig.AttriImg.thunder,ResourceConfig.AttriImg.fire},
	[PROF_PHOENIX] 		= {ResourceConfig.AttriImg.fire,ResourceConfig.AttriImg.earth},
	[PROF_GEMINORUM]	= {ResourceConfig.AttriImg.water,ResourceConfig.AttriImg.thunder},

	[PROF_SAGITTARIUS]	= {ResourceConfig.AttriImg.wind,ResourceConfig.AttriImg.thunder},
	[PROF_AQUARIUS]		= {ResourceConfig.AttriImg.water,ResourceConfig.AttriImg.wind},
	[PROF_LIBRA]		= {ResourceConfig.AttriImg.earth,ResourceConfig.AttriImg.water},
	[PROF_VIRGO]		= {ResourceConfig.AttriImg.thunder,ResourceConfig.AttriImg.fire},
	[PROF_LEO]			= {ResourceConfig.AttriImg.fire,ResourceConfig.AttriImg.earth},
	[PROF_GEMINI]		= {ResourceConfig.AttriImg.water,ResourceConfig.AttriImg.thunder},
}

function ResourceConfig:GetProfAttriImg(prof, isProf2)
	local result = {}
	local dmg = {50,25}
	local index = prof
	if isProf2 == true then
		index = index + PROF_UP_MASK
	end
	if self.ProfAttriImg[index] then
		for i,v in ipairs(self.ProfAttriImg[index]) do
			local _dmg = dmg[i] or 0
			result[i] = {}
			result[i].icon = v.icon
			result[i].hint = string.format(v.hint,_dmg)
		end
	end
	return result
end


ResourceConfig.ProfBgImg =
{
	[PROF_DEFAULT] 		= "special\\roleinfo\\RoleBG1.png",
	[PROF_PEGASI] 		= "special\\roleinfo\\RoleBG2.png",
	[PROF_CYGNI]	 	= "special\\roleinfo\\RoleBG3.png",
	[PROF_DRACONIS] 	= "special\\roleinfo\\RoleBG4.png",
	[PROF_ANDROMEDAE]	= "special\\roleinfo\\RoleBG5.png",
	[PROF_PHOENIX] 		= "special\\roleinfo\\RoleBG6.png",
	[PROF_GEMINORUM] 	= "special\\roleinfo\\RoleBG7.png",

	[PROF_SAGITTARIUS]	= "special\\roleinfo\\RoleBG102.png",
	[PROF_AQUARIUS]		= "special\\roleinfo\\RoleBG103.png",
	[PROF_LIBRA]		= "special\\roleinfo\\RoleBG104.png",
	[PROF_VIRGO]		= "special\\roleinfo\\RoleBG105.png",
	[PROF_LEO]			= "special\\roleinfo\\RoleBG106.png",
	[PROF_GEMINI]		= "special\\roleinfo\\RoleBG107.png",
}

function ResourceConfig:GetProfBgImg(prof,is_prof2)
	if is_prof2 then
		if self.ProfBgImg[prof + PROF_UP_MASK] then
			return self.ProfBgImg[prof + PROF_UP_MASK]
		end
	end

	if self.ProfBgImg[prof] then
		return self.ProfBgImg[prof]
	end
end

ResourceConfig.MonsterLevelIcon =
{
	[2] = "res/target/monster_lv1.tga",
	[3] = "res/target/monster_lv2.tga",
	[4] = "res/target/monster_lv3.tga",
}

function ResourceConfig:GetMonsterLevelIcon(dungeon_difficulty)
	return ResourceConfig.MonsterLevelIcon[dungeon_difficulty]
end

-- 情谊技能配置
ResourceConfig.TeamSkillIcon =
{
	[4822]="res\\teamskills\\bg1.png",
	[4823]="res\\teamskills\\bg1.png",
	[4824]="res\\teamskills\\bg2.png",
	[4825]="res\\teamskills\\bg2.png",

}

-- 情谊技能默认图
ResourceConfig.TeamSkillIconDefault ="res/target/monster_lv3.tga"

function ResourceConfig:GetTeamSkillIcon(skillid)
	if ResourceConfig.TeamSkillIcon[skillid] then
		return ResourceConfig.TeamSkillIcon[skillid]
	else
		return ResourceConfig.TeamSkillIconDefault
	end
end
