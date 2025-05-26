Panel_GuideStage = ui.dialog.get("Panel_GuideStage")
local Format = string.format
local dlg = Panel_GuideStage
dlg.tick = true


local MAX_STAGE     = 8
local HOST_LEVEL_TO_SHOW_CHECK_POWER = 35
-- 原12宫指引部分的界面逻辑
--[[
local STAGE_GROUP	= 1
local stage_complete = ui.obj_group:new()
local stage_unfinish = ui.obj_group:new()
local stage_gfx 	 = ui.obj_group:new()
for i = 1, MAX_STAGE do
	table.insert(stage_complete.objs, dlg:get_obj("Radio_Get" .. i) )
	table.insert(stage_unfinish.objs, dlg:get_obj("Radio_Not" .. i) )
	table.insert(stage_gfx.objs, 	  dlg:get_obj("Image_" .. i) )
end
]]--
local award = dlg:get_obj("Button_Get1")
local power_check = dlg:get_obj("Button_Exam")
local title = dlg:get_obj("Label_AimValues")
local state = dlg:get_obj("Label_NowValues")
local desc  = dlg:get_obj("Text_AwardValues")


-------------------------------------
--		overrides
-------------------------------------
function dlg:Init()
    --[[
    for i, gfx in ipairs(stage_gfx.objs) do 
        gfx:SetTransparent(true)
        gfx:show(false)
    end
    
    for i, unfinish in ipairs(stage_unfinish.objs) do
        unfinish:command(self.stage_tab)
    end  
    for i, complete in ipairs(stage_complete.objs) do
        complete:command(self.stage_tab)
    end 
    ]]-- 
    award:command(dlg.quest_award)
    power_check:command(dlg.check_power)
    
    --self:auto_select()
end


function dlg:ShowDialog()
    self:update_select_info() 
    self:update_check_power_button()
    --self:update_stage_list()       
end


local cool_time = 0
local cool_max  = 2 * 1000
function dlg:Tick(tick_time)
    cool_time = cool_time + tick_time
    if cool_time < cool_max then
        return
    end
    cool_time = cool_time - cool_max
    
    --self:update_stage_list()   
    self:update_select_info()
    self:update_check_power_button()
end

function dlg:reset_cooltime()
    if cool_time then
        cool_time = 0
    end
end


-------------------------------------
--		panel message
-------------------------------------
function dlg:quest_award()
    local idx, stage = self:get_first_stage_un_reward()
    if not stage then
        return
    end
    
    GameApi.MaunallyTrigTask(stage.quest_id)
    award:enable(false)
    self:reset_cooltime()
end


function dlg:check_power()
    local bShow = DlgApi.IsDialogShow('Panel_GuideExam')
    DlgApi.ShowDialog('Panel_GuideExam', not bShow)
    help_man:TryToWalkCurrDirection(self.this,"Button_Exam")
end

function dlg:stage_tab()
    self:update_select_info()
end



-------------------------------------
--		function called by self
-------------------------------------
function dlg:update_stage_list()
    local cur_stage
    for i, stage in ipairs(guide_stage) do
        if not cur_stage then
            if not GameApi.IsAchiFinish(stage.achi_id) then
                cur_stage = i
                self:update_stage(i, false, stage.quest_id, true)
            else
                self:update_stage(i, true, stage.quest_id, true)
            end            
        else
            self:update_stage(i, false, stage.quest_id, false)
        end
    end
end


function dlg:update_stage(idx, achi_finish, quest_id, enable)
    if idx <= 0 or idx > MAX_STAGE then
        return
    end    
    stage_unfinish.objs[idx]:show(not achi_finish)
    stage_unfinish.objs[idx]:enable(enable)
    stage_complete.objs[idx]:show(achi_finish and true or false)
    stage_complete.objs[idx]:enable(enable)
    if achi_finish then
        local count = GameApi.GetTaskFinishedCount(quest_id) or 0
    	stage_gfx.objs[idx]:show(count > 0)
    else
        stage_gfx.objs[idx]:show(false)
    end
end


function dlg:auto_select()
    for i, stage in ipairs(guide_stage) do
        if not GameApi.IsAchiFinish(stage.achi_id) then
            self:CheckRadioButton(STAGE_GROUP, i)
            return
        end
    end
    self:CheckRadioButton(STAGE_GROUP, MAX_STAGE)
end


function dlg:get_select_stage()
    local idx = self:GetCheckedRadioButton(STAGE_GROUP)
    if idx <= 0 or idx > MAX_STAGE then
        return
    end
    return idx, guide_stage[idx]
end


function dlg:get_first_stage_un_reward()
    for i, stage in ipairs(guide_stage) do
        local count  = GameApi.GetTaskFinishedCount(stage.quest_id) or 0
        if count <= 0 then
            return i,guide_stage[i]
        end
    end
end



local status_func = 
{
[guide_stage.PARAM_SERVER]		= function(stage) 
										local status = GameApi.GetAchiStatus(stage.achi_id) 
										if status and next(status) then
										    return status[1]
										end
										return 0
								  end,
[guide_stage.PARAM_POWER]		= function(stage) 
										local prop = GameApi.GetHostProp()
										return prop.power
								  end,
[guide_stage.PARAM_LEVEL]		= function(stage) 
										local prop = GameApi.GetHostProp()
										return prop.level
								  end,
[guide_stage.PARAM_CLOTH_NUM]	= function(stage) 
										return GameApi.GetSaintClothesCount() 
								  end,
[guide_stage.PARAM_CLOTH_LEV]	= function(stage) 
										return GameApi.GetSaintClothMaxLev() 
								  end,
[guide_stage.PARAM_FRIEND_NUM]	= function(stage) 
										return GameApi.GetFriendNum() 
								  end,
[guide_stage.PARAM_STARFORCE]	= function(stage) 
										return GameApi.GetStarForce(false) 
								  end,
}


function dlg:update_select_info()
    local idx, stage = self:get_first_stage_un_reward()
    if not stage then
    	title:set_text(STRING_TABLE.GUIDE_ALL_TASK_FINISH)
    	desc:set_text(STRING_TABLE.GUIDE_ALL_AWARD_GOT)
        return
    end    
    local cur_stage = MAX_STAGE + 1
    for i, stage in ipairs(guide_stage) do
        if not GameApi.IsAchiFinish(stage.achi_id) then
            cur_stage = i
            break
        end
    end
    local finish = GameApi.IsAchiFinish(stage.achi_id)
    
    -- 阶段目标
    title:set_text(stage.title)
    -- 当前状态
    if finish and idx < cur_stage then
    	state:set_text(STRING_TABLE.GUIDE_ACHI_FINISH)
    else
        local status = status_func[stage.param_typ] and status_func[stage.param_typ](stage)
    	if status then
  			state:set_text(Format(stage.status, status))
    	end
    end
    -- 奖励描述
    desc:set_text( format_string:parse(stage.desc) )
    -- 奖励按钮
    local count  = GameApi.GetTaskFinishedCount(stage.quest_id) or 0        
    award:enable(count <= 0 and finish and idx < cur_stage)
end


function dlg:update_check_power_button()
    local propEx = GameApi.GetHostPropEx()
    power_check:show(propEx.level >= HOST_LEVEL_TO_SHOW_CHECK_POWER)
end
