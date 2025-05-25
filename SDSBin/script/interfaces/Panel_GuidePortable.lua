Panel_GuidePortable = ui.dialog.get("Panel_GuidePortable")

local dlg = Panel_GuidePortable

local ITEM_NUM_TO_SHOW  = 1


local obj_detail = dlg:get_obj("Button_Detail")
local obj_name	=	dlg:get_obj("Label_GuideName")
local obj_desc	=	dlg:get_obj("Label_GuideContent")
local obj_award = 	dlg:get_obj("Text_Award")
local obj_hint	=	dlg:get_obj("Label_Hint")
local obj_gfx	=	dlg:get_obj("Gfx_Hint")




function dlg:Init()
	obj_detail:command(dlg.open_detail)
end


function dlg:update_view()

	local to_show =  DlgApi.IsDialogShow('Panel_QuestTrace')
	DlgApi.ShowDialog(self.this,to_show,false,false)
	if to_show == false then return end

	local list,has_award = self:get_guide_can_show()
	obj_gfx:show(has_award)
	if #list < ITEM_NUM_TO_SHOW then
		obj_name:set_text(STRING_TABLE.GUIDE_SEE_DETAIL)
		obj_hint:show(false)
		obj_desc:set_text("")
		obj_award:set_text("")
		return
	end

	local item  = {}
	for i,v in pairs(list) do
		item = v
		break
	end

	if item.achieve_id == nil then
		obj_name:set_text(STRING_TABLE.GUIDE_SEE_DETAIL)
		obj_hint:show(false)
		obj_desc:set_text("")
		obj_award:set_text("")
		return	
	end

	local achievement = GameApi.GetAchievement(item.achieve_id)
	if type(achievement) ~= "table" then
		obj_name:set_text(STRING_TABLE.GUIDE_SEE_DETAIL)
		obj_hint:show(false)
		obj_desc:set_text("")
		obj_award:set_text("")
		return
	end

	local name = achievement["name"]
	local desc = achievement["desc"]

	obj_name:set_text(name and name or "")
	obj_hint:show(true)
	--obj_hint:set_text(has_award and STRING_TABLE.GUIDE_CLICK_AWARD or STRING_TABLE.GUIDE_SEE_DETAIL)
	--obj_desc:set_text(desc and desc or "")
	obj_desc:set_text(format_string:parse(item.award))
	obj_award:set_text(format_string:parse(item.award) )

end



function dlg:open_detail()
	DlgApi.ShowDialog("Panel_GuideStage",DlgApi.IsDialogShow("Panel_GuideStage") == false)
end


function  dlg:get_guide_can_show(num)
    local list = {}
    local total = 0
    local has_award = false
    local host_prop = GameApi.GetHostProp()
    for i,cfg in ipairs(guide_cfg) do
        local active = GameApi.IsAchiActive(cfg.achi_id) and not GameApi.IsAchiFinish(cfg.achi_id)
        local count  = GameApi.GetTaskFinishedCount(cfg.quest_id) or 0
        local task_finished =  GameApi.IsTaskFinishSuccess(cfg.quest_id) or count > 0
        local can_take_award = GameApi.IsAchiFinish(cfg.achi_id) and not task_finished
        local can_show = cfg.show_level == nil and  true or cfg.show_level <= host_prop.level
        local can_show_3 = cfg.show_level_max == nil and  true or cfg.show_level_max >= host_prop.level
        local can_show_2 = cfg.show_fin_taskid == nil and true or GameApi.IsTaskFinishSuccess(cfg.show_fin_taskid)
        can_show = can_show and can_show_2 and can_show_3
        if can_show then
            if can_take_award == true then has_award = true end
            if active or can_take_award then
                local item = {}
                item.index = i
                item.achieve_id = cfg.achi_id
                item.quest_id   = cfg.quest_id
                item.award      = cfg.award
                table.insert(list,item)
                total = total + 1
                if num and total >= num then return list end
            end
        end
    end
    return list,has_award
end