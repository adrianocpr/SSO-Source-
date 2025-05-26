---------------------------------------------------------------
--  @description NPC显隐
--  @author feng bo
---------------------------------------------------------------
local sandbox = require("sandbox")

module("npc_hide", package.seeall)

local api = GameApi

local cfg = sandbox.create_basic()

local function load_config()
	local success, err = cfg("script/npclogic/npc_hide_list.lua")
	if not success then
		console.error(err)
	end
end
load_config()


--- 每次Tick判断NPC是否隐藏
local check_condition = error
local HideJudge = error
function _M:IsNpcHide( tid )
    local hideInfo = cfg.hidePreSet[tid]
    if not hideInfo then
        return false
    end
      
    if hideInfo.conditionPrior == 0 then
        if check_condition(hideInfo.showConditions) then
            return false
        end
        if check_condition(hideInfo.hideConditions) then
            return true
        end
    else
        if check_condition(hideInfo.hideConditions) then
            return true
        end
        if check_condition(hideInfo.showConditions) then
            return false
        end
    end
  	if hideInfo.defaultStatus == 0 then ---默认为0,则不显示
        return true
  	end
   	return false  ---无处理,则显示
end


-- 每次NPC创建前判断这个。如果测试为true,那么下次enter world 之前都不会再显示
-- 待实现
function _M:IsNpcHidePhase( templId )
	return false
end




---判断是否满足条件
check_condition = function(conditions) 
    for i,v in ipairs(conditions.receptTasks or {}) do
        if api.IsTaskActive(v) and not api.IsTaskFailed(v) then
            return true
        end
    end
    for i,v in ipairs(conditions.satisfyTasks or {}) do
        if api.IsTaskActiveComplete(v) then
            return true
        end
    end
    for i,v in ipairs(conditions.finishTasks or {}) do
        if api.IsTaskFinishSuccess(v)  then
            return true
        end
    end
    for id, expect in pairs(conditions.taskCounters or {}) do
        local counter = api.GetTaskFinishedCount(id) or 0
        if counter >= expect then
            return true
        end
    end
    return false
end

--- 得到显隐配置
function _M:GetNpcHideCfg( tid )
    local hideInfo = cfg.hidePreSet[tid]
    if not hideInfo then
        return 0,0,"","",0
    end   
    local showD 	= 0
    local hideD 	= 0
    local showA 	= ""
    local hideA		= ""
    local repNPC	= 0
    if hideInfo.showDelaySec~=nil then showD = hideInfo.showDelaySec end
   	if hideInfo.hideDelaySec~=nil then hideD = hideInfo.hideDelaySec end
   	if hideInfo.showAction~=nil then showA = hideInfo.showAction end
   	if hideInfo.hideAction~=nil then hideA = hideInfo.hideAction end
   	if hideInfo.replaceNPC~=nil then repNPC = hideInfo.replaceNPC end
   	return showD, 	hideD, 	showA, 	hideA, repNPC
end


