--[[ @i18n achievement ]]
local _t = require("i18n").context("achievement")

Achievement = {}

local ACHIEVE_PHASE_MAX	= 100
local ACHIEVE_COND_PERIOD = {_t"天",_t"周",_t"月"}


-- 成就目录：1 个人成就目录 2 军团成就目录
function Achievement:Get_Category(itype)
    if itype == 0 then
        return Achievement_Ctgr
    end
    if itype == 1 then
        return Achievement_Ctgr_League
    end
    return Achievement_Ctgr
end

-- 三级目录（筛选类别） 名称 
function Achievement:Get_Ctgr3_Name()
    return Achievement_Ctgr3_Name
end

function Achievement:Get_Ctgr3_OfGuideAchieve()
    return 10
end

-- 得到一条成就的完整数据
function Achievement:GetAchievement(ntype, id)
    if ntype == 0 then
        return achievement[id]
    end
    if ntype == 1 then
        return achievement_league[id]
    end
    return nil
end

-- 得到所有成就的id
function Achievement:GetAllAchievementIDs(ntype)
    local achi = {}
     if ntype == 0 then
        achi = achievement
    end
    if ntype == 1 then
        achi = achievement_league
    end 
    
    local list = {}
    for id in pairs(achi) do
        table.insert(list, id)
    end
    table.sort(list)

    return list
end

-- 返回成就点数对应的阶段
function Achievement:GetAchievementPhase(ntype,points)
    local phase = {}
     if ntype == 0 then
        phase = achiev_phase
    end
    if ntype == 1 then
        phase = achiev_phase_league
    end 
    
    for index = 1,ACHIEVE_PHASE_MAX do
        if phase[index] ~= nil then
            if points < phase[index].point_min and phase[index - 1] ~=nil then
                return index - 1,phase[index - 1]
            end
        elseif phase[index - 1] ~=nil then
            return index - 1,phase[index - 1]
        end
    end
    return nil
end

-- 返回游戏事件可以触发的成就条件类型
function Achievement:GetConditionByEvent(luaEvent)
    local id = luaEvent - LEVT_ACHIEVE_CONDITION_BEGIN
    return (achiev_cond_def[id] ~= nil) and id or nil
end


function Achievement:GetCond(ntype, achiev_id, index)
    local cond  = {}
     if ntype == 0 then -- 个人成就条件
        cond = achiev_conditions[achiev_id * 10 + index]
    end
    if ntype == 1 then -- 军团成就条件
        cond = achiev_conditions_league[achiev_id * 10 + index]
    end
    return cond
end

--	得到条件的描述
function Achievement:GetCondDesc(ntype, achiev_id, index, data, isfinished)
    local cond  = {}
     if ntype == 0 then -- 个人成就条件
        cond = achiev_conditions[achiev_id * 10 + index]
    end
    if ntype == 1 then -- 军团成就条件
        cond = achiev_conditions_league[achiev_id * 10 + index]
    end
    if cond == nil then
        return nil
    end
    
    -- 例
    -- 如果条件的类型是1003，并且条件的这三个参数都有值，返回一个描述
    if cond.type == 1003 and cond.p_value * cond.p_period * cond.p_times ~= 0 then
        return _t"需要在"
        ..cond.continuous > 0 and _t"连续" or ""..cond.p_times..ACHIEVE_COND_PERIOD[cond.p_period] -- "（连续）x 天/周/月"
        .._t"每"..ACHIEVE_COND_PERIOD[cond.p_period]	-- "每天/周/月"
        .._t"打倒"..cond.p_value.._t"个怪，"	--"打倒x个怪，"
        .._t"你已经打倒了"..data.._t"个怪。"    --"你已经打倒了x个怪。"  
    end
    
    return (isfinished == true) and ("^ffffff" ..cond.desc) or ("^909090" ..cond.desc)
    end