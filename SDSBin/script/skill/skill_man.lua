---------------------------------------------------------------
--  created:   2012.5.17
--  author:    hanwei
--
--  技能管理 --------------------------------------------------
local Insert, Len, Sub, Gsub, Find, Format = table.insert, string.len, string.sub, string.gsub, string.find, string.format
local type, tonumber, pcall = type, tonumber, pcall
local Min = math.min
local Match = string.match

skill_man = {}


-------------------------------------
--		界面相关
-------------------------------------
-- 检查某些和玩家职业、技能等状态相关的界面元素的可见性
local skill_dlgs =
{
	["Panel_SkillsBean"] = function()
								local prop = GameApi.GetHostPropEx()
								if prop.profession ~= PROF_PEGASI then return false end
		    					local lev = GameApi.GetHostSkillLevel(62)
		    					if lev and lev > 0 then return true end
		    					return false
		    				end,
	["Panel_SkillsEnergy"] = function()
								local prop = GameApi.GetHostPropEx()
								local skllev = GameApi.GetHostSkillLevel(516) or GameApi.GetHostSkillLevel(520) or GameApi.GetHostSkillLevel(526) or GameApi.GetHostSkillLevel(528)
								if prop.profession == PROF_ANDROMEDAE  and skllev then
								    return true
								end
		    					return false
		    				end,
	["Panel_SkillsIce"] = function()
								local prop = GameApi.GetHostPropEx()
								if prop.profession == PROF_CYGNI then
								    return true
								end
		    					return false
		    				end,
	["Panel_SkillsFire"] = function()
								local prop = GameApi.GetHostPropEx()
								if prop.profession == PROF_PHOENIX then
								    return true
								end
		    					return false
		    				end,
    ["Panel_SkillsSin"] = function()
                                local prop = GameApi.GetHostPropEx()
                                if prop.profession == PROF_GEMINORUM then
                                    return true
                                end
                                return false
                            end,

}
function skill_man:check_ui_visibility()
    local visibility
    for panel_name, check_func in pairs(skill_dlgs) do
        visibility = check_func() or false
        if visibility then
            if not DlgApiEx.IsDialogLoad(panel_name) then
        		DlgApiEx.LoadGameDialog(panel_name)
    		end
    		DlgApi.ShowDialog(panel_name, true)
        else
            if DlgApiEx.IsDialogLoad(panel_name) then
        		DlgApi.ShowDialog(panel_name, false)
    		end
        end
    end
    Panel_QuickBar:CheckCosmosVisibility()
end



-------------------------------------
--		buff相关
-------------------------------------
local buff_desc     = 1
local buff_icon     = 2
local buff_gfx_else = 3
local buff_gfx_host = 4
local buff_mask     = 5
local buff_type     = 6

--获取Buff描述
function skill_man:GetBuffDesc(buff_id, param)
    local buff = buff_data[buff_id]
    if not buff then return "" end
    if buff[buff_type] == SKILL_BUFF_TYPE_PSEUDO_BUFF_EXP then
        return Format(buff[buff_desc] or "", param / 10 - 100)
    end
    return buff[buff_desc] or ""
end

function skill_man:GetBuffInfo(buff_id)
    local buff = buff_data[buff_id]
    if not buff then return end
    return buff[buff_gfx_else] or -1, buff[buff_gfx_host] or -1, buff[buff_mask] or 0, buff[buff_type] or -1
end

function skill_man:GetBuffIcon(buff_id)
    local buff = buff_data[buff_id]
    return buff and buff[buff_icon] or ""
end

function skill_man:GetShowBuff(prof)
    local show_buff = skill_prof[prof] and skill_prof[prof].show_buff
    return show_buff or {}
end


-------------------------------------
--		skill_data数据处理
--      包括技能过程、公式和范围数据
-------------------------------------

--导入过程数据
function skill_man:init_procedure_info(skill)
    if not skill.procg then
        skill.procedure_num	= 0
        skill.procedure_time	= {}
        skill.procedure_combo	= {}
    end

    skill.procedure_num	= #skill.procg
    skill.procedure_time	= {}
    skill.procedure_combo	= {}
    for _, procedure in ipairs(skill.procg) do
        Insert(skill.procedure_time,  procedure[1])
        if skill.type ~= TYPE_ATTACK and skill.type ~= TYPE_CURSE then
            Insert(skill.procedure_combo, 0)
        else
            local _, _, combo = Find(procedure[2], "combo%s*=%s*(%d+)")
            combo = tonumber(combo) or 1 --combo不填默认为1
            local _, _, perform = Find(procedure[2], "player.perform%s*=%s*(%d+)")
            perform = tonumber(perform) or 0
            Insert(skill.procedure_combo, perform > 0 and combo or 0)
        end
    end
end

--技能skill_data的公式域
local fields =
{
	"mp_cost",
	"vp_cost",
	"ap_cost",
	"ep_cost",
	"energy1_cost",
	"energy2_cost",
	"execute_time",
	"cooldown_time",
	"groupcd_id",
	"groupcd_time",
	"radius",
	"pursue_distance",
	"cminpray_distance",
}
--技能范围域，直接转数值
local rangeParams =
{
    "cylinderradius",
    "cylinderlength",
    "sectorradius",
    "sectorangle",
}
--初始化公式域
local INVALID_FORMULAS = 0
function skill_man:init_formula_data(skill)
    local mask_formulas = {}
    for i, field in ipairs(fields) do
        if not skill[field] then
        	mask_formulas[i] = INVALID_FORMULAS
        else
            local num = tonumber(skill[field])
            if num then
               	skill[field] = num
               	mask_formulas[i] = INVALID_FORMULAS
            else
               	Insert(self.formula_list, skill[field])
                mask_formulas[i] = #self.formula_list
            end
        end
    end
    skill.mask_formulas = mask_formulas
end
--将技能范围数据转为整数，失败的为0
function skill_man:init_range_data(skill)
    for i, field in ipairs(rangeParams) do
        if skill[field] then
            local num = tonumber(skill[field])
            skill[field] = num or 0
        end
    end
end
--获取公式的值
function skill_man:get_formula_value(skill_id, formula_idx)
    -- 转换格式
    local formula = self:ConvertStrToLuaFormat(self.formula_list[formula_idx])
    if Len(formula) <= 0 then return end

    -- 替换数值
    local data = self:GetCalcData(skill_id)
    if not data then return end
    local skill_lev = GameApi.GetHostSkillLevel(skill_id)
    skill_lev = (skill_lev and skill_lev >= 0) and skill_lev or 0
    formula = self:ReplaceParam(formula, skill_lev, data.talents)

    -- 计算公式
    formula = Format("function val() return %s end return val()", formula)
    local chunk = loadstring(formula)
    if chunk then
        local env = {floor = math.floor}
        setfenv(chunk, env)
        local ret, value = pcall(chunk)
    	if ret and value then
    	    return value
    	end
    end
    return 0
end
--技能数据文件
local skill_data_list =
{
	"skill_data1.lua",
	"skill_data2.lua",
	"skill_data3.lua",
}
--加载技能数据
function skill_man:load_data()
    for _, fileName in ipairs(skill_data_list) do
        dofile_show_err("script\\skill\\"..fileName)
   	end
    self.formula_list = {}
end
skill_man:load_data()

--获取技能数据
function skill_man:GetSkillData(skill_id)
    local skill = skill_data[skill_id]
    if not skill then
        return nil
    end
    if not skill.isDataReady then
        -- 技能分段信息
        self:init_procedure_info(skill)
        -- 技能公式处理
        self:init_formula_data(skill)
        self:init_range_data(skill)
        skill.isDataReady = true
    end
    return skill
end

local SKILL_SHOWTYPE_PROF = 1
local SKILL_SHOWTYPE_ARMY = 8
--获取职业学习技能
function skill_man:GetProfAndArmySkillIds(prof)
    local profIds,armyIds = {},{}
    for id,data in pairs(skill_data) do
        if data.showtype == SKILL_SHOWTYPE_PROF then
            if self:IsProfSatisfied(data.prof_2bit,prof) and skill_learn[id] then
                local learn = skill_learn[id]
                if not learn.prof_2bit or self:IsProfSatisfied(learn.prof_2bit,prof) then
                    Insert(profIds,id)
                end
            end
        elseif data.showtype == SKILL_SHOWTYPE_ARMY then
            if not data.prof_2bit or self:IsProfSatisfied(data.prof_2bit,prof) then
                Insert(armyIds,id)
            end
        end
    end
    return profIds,armyIds
end

--根据prof_2bit(字符串职业mask字符串)
function skill_man:IsProfSatisfied(prof_2bit,prof)
    return Sub(prof_2bit or "", prof, prof) == "1"
end

--已废弃？
function skill_man:GetSkillCampGFX(skill_id, gfx_type)
    local data = skill_data[skill_id]
    local key = Format("camp_gfx%d", gfx_type)
    return data[key]
end



-------------------------------------
--		skill动作
-------------------------------------
NON_ACTION 			= ""
READY_ACTION 		= 1
MONSTER_ACTION		= 2
MOUNT_ACTION		= 3
BEGIN_CAST_ACTION	= 4
END_CAST_ACTION		= 5
WING_FLY_ACTION     = 6
MOUNT_FLY_ACTION    = 7
FLY_MOUNT_ACTION    = 8

MOUNT_TYPE_OFFSET   = 10    --att_type可能有的类型, 现在应该都为空手: 0-空手, 1-剑盾, 2-双手剑, 3-魔琴, 4-圣琴, 5-双手杖, 6-三叉戟, 7-爪, 8-匕首, 9-保留
ACTION_LIST_BEGIN 	= 9     --列表从9开始就是不同职业的空手动作(共8个职业),前边为特殊动作
MONSTER_LIST_BEGIN  = 17    --列表从17开始是不同职业的骑乘动作(共8个职业)

local FLY_NULL      = 0
local FLY_WING      = 1
local FLY_AIRCRAFT  = 2


function skill_man:GetAction(skill_id, skill_lev, profession, fly_type, att_type, bHostplayer, uiExtState)
    local skill = skill_data[skill_id]
    if not skill then
        return NON_ACTION
    end

    -- 自定义
    local func = skill_act[skill_id]
    local act = func and func(skill_id, skill_lev, profession, fly_type, att_type, bHostplayer, uiExtState) or nil
    if act then return act end

    if fly_type == FLY_NULL then
        if att_type > 20 or att_type < 0 then
            return NON_ACTION
        end
        -- 空手
        if att_type == 0 then
            return skill.action[ACTION_LIST_BEGIN + profession];
        -- 骑乘
        elseif att_type == MOUNT_TYPE_OFFSET then
            return skill.action[MONSTER_LIST_BEGIN + profession];
        end
    elseif fly_type == FLY_WING then
        return skill.action[WING_FLY_ACTION]
    elseif fly_type == FLY_AIRCRAFT then
        return skill.action[MOUNT_FLY_ACTION]
    end
    return NON_ACTION
end


function skill_man:GetChargeAction(skill_id, skill_lev, charge_time, profession, fly_type, att_type, bHostplayer, uiExtState)
    local skill = skill_data[skill_id]
    if not skill then
        return NON_ACTION
    end

    -- 自定义
    local func = skill_act[skill_id]
    local act = func and func(skill_id, skill_lev, charge_time, profession, fly_type, att_type, bHostplayer, uiExtState) or nil
    if act then return act end

    if fly_type == FLY_NULL then
        if att_type > 20 or att_type < 0 then
            return NON_ACTION
        end
        -- 空手
        if att_type == 0 then
            return skill.action[ACTION_LIST_BEGIN + profession];
        -- 骑乘
        elseif att_type == MOUNT_TYPE_OFFSET then
            return skill.action[MONSTER_LIST_BEGIN + profession];
        end
    elseif fly_type == FLY_WING then
        return skill.action[WING_FLY_ACTION]
    elseif fly_type == FLY_AIRCRAFT then
        return skill.action[MOUNT_FLY_ACTION]
    end
    return NON_ACTION
end


function skill_man:GetMountAction(skill_id, fly_type)
    local skill = skill_data[skill_id]
    if not skill then
        return NON_ACTION
    end
    local idx = (fly_type == FLY_AIRCRAFT) and FLY_MOUNT_ACTION or MOUNT_ACTION
    return skill.action[idx]
end


function skill_man:GetSpecialAction(skill_id, action_idx)
    local skill = skill_data[skill_id]
    if not skill then
        return NON_ACTION
    end
    return skill.action[action_idx]
end


function skill_man:GetSkillActHook(skill_id, bPlayerModel)
    local skill = skill_data[skill_id]
    if not skill then
        return "", ""
    end
    return skill.player_hook, skill.target_hook
end




-------------------------------------
--		skill公式解析
-------------------------------------
--获取技能的过程和临时参数公式，存入SkillCaclData表
local SkillCalcData = {}
function skill_man:GetCalcData(skill_id)
    if not SkillCalcData[skill_id] then
        local data = self:GetSkillData(skill_id)
        local _formulas = {}
        for idx, formula in ipairs(data.procg or {}) do
            Insert(_formulas, {step = idx, calc = formula[2]})
        end
        local _talents = {}
        for idx, para in ipairs(data.temppara or {}) do
            if Len(para) > 0 then
            	_talents["t"..idx] = para
            end
        end
        SkillCalcData[skill_id] = { formulas = _formulas, talents = _talents }
    end
    return SkillCalcData[skill_id]
end

--获取技能的伤害
function skill_man:GetHostSkillDamageAdd(id, lev, para)
    local data = self:GetCalcData(id)
    if not data then
        return nil
    end
    for _, info in ipairs(data.formulas) do
        if info.step == para then
            if not Find(info.calc, "damagetype") then
                return nil
            end
            local ret, num = pcall(self.CalculateFormula, self, info.calc, "damage", lev, data.talents)
            if ret and num then
                return num
            end
        end
    end
    return nil
end

local attri_list =
{
	"ratiofire",
	"ratiowater",
	"ratiowind",
	"ratioearth",
}
--获取技能倍率ratio的值
function skill_man:GetHostSkillRatio(id, lev)
    local data = self:GetCalcData(id)
    if not data then
        return "0%"
    end

    local ratio1 = 0
    for _, info in ipairs(data.formulas) do
        -- 物理伤害倍率或魔法伤害倍率
        local ret, num = pcall(self.CalculateFormula, self, info.calc, "ratio", lev, data.talents)
        if ret and num then
            ratio1 = ratio1 + num * 100
        end
    end
    return Format("%d%%", ratio1 + 0.5)
end

--获取属性伤害的倍率
function skill_man:GetHostSkillAttrRatio(id, lev)
    local data = self:GetCalcData(id)
    if not data then
        return "0%"
    end

    -- 属性伤害倍率
    local ratio2 = 0
    for _, info in ipairs(data.formulas) do
        for _, attri in ipairs(attri_list) do
            ret, num = pcall(self.CalculateFormula, self, info.calc, attri, lev, data.talents)
        	if ret and num then
            	ratio2 = ratio2 + num * 100
        	end
        end
    end
    return Format("%d%%", ratio2 + 0.5)
end

--将字符串转为lua公式
function skill_man:ConvertStrToLuaFormat(str)
    if str then
    	str = Gsub(str, "int", "floor")
        str = Gsub(str, "&&", " and ")
    	str = Gsub(str, "?", " and ")
    	str = Gsub(str, ":", " or ")
    else
        str = ""
    end
    return str
end
--替换公式中的参数为数值字符串
--将公式中的t1..t8,level,player.skilllevel,player.bufflevel,player.damagehigh,player.damagelow,player.attack
--五行攻击player.attackearth,player.attackwater,player.attackfire,player.attackwind,player.attackthunder
--神器灵力值artifact.power
--替换为数值字符串，并返回
function skill_man:ReplaceParam(formula,skillLevel,talents)
    if talents then
        for k, v in pairs(talents) do
            formula = Gsub(formula,k,v)
        end
    end
    --技能等级
    local tmpSkillLevelStr,tmpSkillIdStr = Match(formula,"(player.skilllevel%[(%d+)%])")
    while tmpSkillLevelStr and tmpSkillIdStr do
        local tmpSkillId = tonumber(tmpSkillIdStr)
        if tmpSkillId then
            local tmpSkillLevel = GameApi.GetHostSkillLevel(tmpSkillId);
            tmpSkillLevel = (tmpSkillLevel and tmpSkillLevel>=0) and tmpSkillLevel or 0
            tmpSkillLevelStr = Format("player.skilllevel%%[%d%%]",tmpSkillIdStr)
            formula = Gsub(formula,tmpSkillLevelStr,tostring(tmpSkillLevel))
        end
        tmpSkillLevelStr,tmpSkillIdStr = Match(formula,"(player.skilllevel%[(%d+)%])")
    end
    --Buff等级
    local tmpBuffLevelStr,tmpBuffIdStr = Match(formula,"(player.bufflevel%[(%d+)%])")
    while tmpBuffLevelStr and tmpBuffIdStr do
        local tmpBuffId = tonumber(tmpBuffIdStr)
        if tmpBuffId then
            local tmpBuffLevel = GameApi.GetHostBuffLevel(tmpBuffId)
            tmpBuffLevel = (tmpBuffLevel and tmpBuffLevel>=0) and tmpBuffLevel or 0
            tmpBuffLevelStr = Format("player.bufflevel%%[%d%%]",tmpBuffIdStr)
            formula = Gsub(formula,tmpBuffLevelStr,tostring(tmpBuffLevel))
        end
        tmpBuffLevelStr,tmpBuffIdStr = Match(formula,"(player.bufflevel%[(%d+)%])")
    end
    --圣衣星铸等级
    local tmpSaintEnhanceLevelStr,tmpSaintClothIdStr = Match(formula,"(player.saintclothesenhancelevel%[(%d+)%])")
    while tmpSaintEnhanceLevelStr and tmpSaintClothIdStr do
        local tmpSaintClothId = tonumber(tmpSaintClothIdStr)
        if tmpSaintClothId then
            local tmpSaintEnhanceLevel = GameApi.GetHostSaintClothEnhanceLevel(tmpSaintClothId)
            tmpSaintEnhanceLevel = (tmpSaintEnhanceLevel and tmpSaintEnhanceLevel>=0) and tmpSaintEnhanceLevel or 0
            tmpSaintEnhanceLevelStr = Format("player.saintclothesenhancelevel%%[%d%%]",tmpSaintClothIdStr)
            formula = Gsub(formula,tmpSaintEnhanceLevelStr,tostring(tmpSaintEnhanceLevel))
        end
        tmpSaintEnhanceLevelStr,tmpSaintClothIdStr = Match(formula,"(player.saintclothesenhancelevel%[(%d+)%])")
    end
    --替换玩家属性player.level,player.damagehigh和player.damagelow,player.prof
    local playerProp = GameApi.GetHostAllProp()
    if playerProp then
        formula = Gsub(formula,"player.level",tostring(playerProp.level))
        formula = Gsub(formula,"player.damagehigh",tostring(playerProp.damagehigh))
        formula = Gsub(formula,"player.damagelow",tostring(playerProp.damagelow))
        formula = Gsub(formula,"player.attackearth",tostring(playerProp.attackearth))
        formula = Gsub(formula,"player.attackwater",tostring(playerProp.attackwater))
        formula = Gsub(formula,"player.attackfire",tostring(playerProp.attackfire))
        formula = Gsub(formula,"player.attackwind",tostring(playerProp.attackwind))
        formula = Gsub(formula,"player.attackthunder",tostring(playerProp.attackThunder))
        formula = Gsub(formula,"player.attack",tostring(playerProp.attack))
        formula = Gsub(formula,"player.prof",tostring(playerProp.profession))
    end
    --替换level
    formula = Gsub(formula, "level", tostring(skillLevel))
    --替换神器神力值
    local tmpArtifactPowerStr,tmpArtifactIdStr = Match(formula,"(artfiact.power%[(%d+)%])")
    while tmpArtifactPowerStr and tmpArtifactIdStr do
        local tmpArtifactId = tonumber(tmpArtifactIdStr)
        if tmpArtifactId then
            local tmpArtifactPower = GameApi.GetArtifactPower(tmpArtifactId);
            tmpArtifactPower = (tmpArtifactPower and tmpArtifactPower>=0) and tmpArtifactPower or 0
            tmpArtifactPowerStr = Format("artfiact.power%%[%d%%]",tmpArtifactId)
            formula = Gsub(formula,tmpArtifactPowerStr,tostring(tmpArtifactPower))
        end
        tmpArtifactPowerStr,tmpArtifactIdStr = Match(formula,"(artfiact.power%[(%d+)%])")
    end
    -- 转为lua公式字符串
    formula = skill_man:ConvertStrToLuaFormat(formula)
    return formula
end

--根据技能id,level转换公式字符串
function skill_man:GetFormulaValueStr(skillId,skillLevel,formula)
    local data = self:GetCalcData(skillId) --获取t1-t8公式字符串
    return self:ReplaceParam(formula,skillLevel,data.talents)
end

--计算str中某段公式(field指定)的值
function skill_man:CalculateFormula(str, field, lev, talents)
    -- 获取公式
    local expression = Format("(%s%%s*=%%s*.+%%s*;)", field)
    local start_exp, _, sentence = Find(str, expression)
    if type(sentence) ~= "string" or Len(sentence) <= 0 then
        return 0
    end
    local end_exp = Find(sentence, ";")
    if (not end_exp) or end_exp <= 0 then
        return 0
    end
    sentence = Sub(sentence, 0, end_exp)

	-- 转换格式
	sentence = self:ConvertStrToLuaFormat(sentence)
    -- 替换数值
    sentence = self:ReplaceParam(sentence, lev, talents)
    -- 计算公式
    local chunk = loadstring(sentence)
    if chunk then
        local result = {floor = math.floor}
        setfenv(chunk, result)
        local ret = pcall(chunk)
    	if ret then
    	    return result[field]
    	end
    end
    return 0
end

--计算技能升到指定等级需要消耗的经验
function skill_man:CalcSkillLearnExp(skillId,skillLevel)
    local skillLearnConf = skill_learn[skillId]
    local learnExp = 0
    if skillLearnConf then
        local learnedLevel = Min(skillLearnConf.max_level or 0,skillLevel)
        for i=1, learnedLevel, 1 do
            learnExp = learnExp + skillLearnConf.skill_data[i].exp_reduce or 0
        end
    end
    return learnExp
end

--获取一个技能的基本数据：最大等级，职业限制，第一级玩家等级
function skill_man:GetSkillLearnBasicData(skillId)
    local skillLearnConf = skill_learn[skillId]
    if skillLearnConf then
        local result = {}
        result.maxLevel = skillLearnConf.max_level
        result.profLimited = skillLearnConf.prof_limited
        result.preExpenditureProfMask  = skillLearnConf.pre_prof_expenditure_req
        result.prof2 = skillLearnConf.profadvance
        result.firstPlayerLevel = 0
        if skillLearnConf.skill_data[1] then
            result.firstPlayerLevel = skillLearnConf.skill_data[1].player_level;
        end
        return result
    end
    return nil
end

--获取一个技能某一级的具体学习条件
function skill_man:GetSkillSpecLevelCondition(skillId,skillLevel)
    if skill_learn[skillId] then
        return skill_learn[skillId].skill_data[skillLevel];
    end
    return nil
end
