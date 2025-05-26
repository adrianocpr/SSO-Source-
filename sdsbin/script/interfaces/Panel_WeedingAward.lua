Panel_WeedingAward = ui.dialog.get("Panel_WeedingAward")
local Panel_Pray = ui.dialog.get("Panel_Pray")

local Format = string.format
local dlg = Panel_WeedingAward
dlg.tick = true
local WEEDING_COUNT_MAX = 72

local item_exp 			= dlg:get_obj("Label_Exp")
local item_exp_tag 		= dlg:get_obj("Label_ExpTags")
local item_exp_left 	= dlg:get_obj("Label_ExpLeft")
local item_exp_left_tag = dlg:get_obj("Label_ExpLeftTags")
local item_money 		= dlg:get_obj("Label_Money")
local item_money_left 	= dlg:get_obj("Label_MoneyLeft")
local item_counter 		= dlg:get_obj("Label_Counter")
local item_prg 			= dlg:get_obj("Progress_Time")

local weeding_list = {9326,9327,9328,9329,9330,9331,12019} --锄花计数任务列表


function dlg:Init()
end


function dlg:ShowDialog()
	self:Update()
    --if not Panel_Pray:is_show() then
    --    Panel_Pray:show(true)
    --end
end


local timer = 0
function dlg:Tick(tick_time)
    timer = timer + tick_time
    if timer <= 30 then
        return
    end	
    timer = 0
    self:Update()
end


-------------------------------------
--		function called by others
-------------------------------------
function dlg:Toggle()
	set_timeout(function()
        local _, _, _, scene_id = GameApi.GetHostPos()
        local inst = Instance[scene_id]
        if inst and inst.weeding_award then
	    	local task_list = GameApi.GetActiveTaskList()
	    	local items = self:Set(task_list)
	    	for _,v in ipairs(weeding_list) do
	    		if items[v] then
	    			dlg:show(true)
	    			return
	    		end
	    	end
        end
		dlg:show(false)
		end,3000)
end


-------------------------------------
--		function called by self
-------------------------------------
function dlg:Set(list)
	local set = {}
	for _,l in ipairs(list) do set[l] = true end
	return set
end


function dlg:Update()
	local prop = GameApi.GetHostProp()
	local lev = prop.level
	local reward = idle_data[lev]
	local count = GameApi.GetHostRepuValue(83)
	local count_left = WEEDING_COUNT_MAX - GameApi.GetHostRepuValue(83)	

	local exp = reward.exp and (reward.exp * count) or (reward.exp2 * count)
	local exp_left = reward.exp and (reward.exp * count_left) or (reward.exp2 * count_left)
	item_exp:set_text(exp)	
	item_exp_tag:set_text(reward.exp and STRING_TABLE.EXP_OBTAIN_TAG_NAME or STRING_TABLE.EXP2_OBTAIN_TAG_NAME)
	item_exp_left:set_text(exp_left)
	item_exp_left_tag:set_text(reward.exp and STRING_TABLE.EXP_LEFT_TAG_NAME or STRING_TABLE.EXP2_LEFT_TAG_NAME)

	local money = reward.bindmoney * count	
	local money_left = reward.bindmoney * count_left
	item_money:set_text(money)	
	item_money_left:set_text(money_left)

	local counter = count .. "/" .. WEEDING_COUNT_MAX
	item_counter:set_text(counter)

	local prg = count / WEEDING_COUNT_MAX
	item_prg:SetProgress(prg)
end
