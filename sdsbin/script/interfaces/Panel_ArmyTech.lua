Panel_ArmyTech = ui.dialog.get("Panel_ArmyTech")

local dlg = Panel_ArmyTech
local league = league

local MAX_UI_RESOURCES = 6
local MAX_UI_BUILDINGS = 6
local REFRESH_INTERVAL = 1000

local function update_res(self)
	self:show()
	local value = league.get_res_value(self.res_index)
	local max = league.get_res_max(self.res_index)
	local cost = league.get_res_weekly_cost(self.res_index)
	
	local progress = 1.0
	if max > 0 then
	    progress = value / max
	end
	local cost_progress = 0
	if max > 0 then
	    cost_progress = cost / max
	end
			
	self.objs.low:show(value < cost)
	self.objs.low:SetProgress(progress)
	self.objs.high:show(value >= cost)
	self.objs.high:SetProgress(progress)
	if self.objs.cursor then
	    self.objs.cursor:show(cost_progress >= 0)
	    self.objs.cursor:SetProgress(cost_progress)
	end
	
	local info = league.get_res_info(self.res_index)
	local hint = ""
	if info then
	    hint = string.format(STRING_TABLE.LEAGUE_RESOURCE_INFO,
	    	info.name, value, max, cost, info.desc)
	    self:set_hint(hint)
	end
	
	local icon_path = info.icon or ""
	if string.len(icon_path) > 0 then
		self.objs.icon:SetImageFile(icon_path, 1)
	end
end

local resources = {}
for i = 1, MAX_UI_RESOURCES do
	local grp = dlg:get_obj_group {
		low = string.format("Progress_Resource%dR", i),
		high = string.format("Progress_Resource%dG", i),
		cursor = string.format("Progress_Resource%dNonius", i),
		icon = string.format("Image_Resource%d", i),
	}
	table.insert(resources, grp)
	grp.res_index = i
	grp.update = update_res
end

local tabs = ui.obj_group:new()
for i = 1, MAX_UI_BUILDINGS do
	table.insert(tabs.objs, dlg:get_obj("Radio_"..i))
end

function dlg:Init()
    self:update_tabs()
end

function dlg:OnRepuUpdate()
    self:update_resources()
end

function dlg:ShowDialog()
    self:OnRepuUpdate()
end

function dlg:update_tabs()
    for i = 1, MAX_UI_BUILDINGS do
        local obj = tabs.objs[i]
        if i <= league.get_building_count() then
            local info = league.get_building_info()
            if info then
				obj:show()
				obj:set_text(info.name)
            end
        else
            obj:hide()
        end
    end
end

function dlg:update_resources()
    for i = 1, MAX_UI_RESOURCES do
        if i <= league.get_res_count() then
            resources[i]:update()
        else
            resources[i]:hide()
        end
    end
end

function dlg:UpdateBuildingInfo(index)
    local info = league.get_building_info(index)
    if not info then return end
    
    local level = string.format(STRING_TABLE.LEAGUE_BUILDING_LEVEL, 
    	league.get_building_level(index))
    self:SetItemText("Label_SetName", info.name .. level)
    self:SetItemText("Text_Set", league.expand_string(info.desc))
end

function dlg:UpdateTechInfo(building_index, tech_index, tree_item_id)
	local sub_dlg = ui.dialog.get("Panel_ArmyTechSub")
	local tech_grp = sub_dlg:get_obj_group{
		name = string.format("Label_Tech_#%s", tree_item_id),
		icon = string.format("Image_Tech_#%s", tree_item_id),
		desc = string.format("Text_Tech_#%s", tree_item_id),
	}
	local info = league.get_building_info(building_index)
	if not info then return end
	local tech = info.tech[tech_index]
	if not tech then return end
	
	local level = league.get_tech_level(building_index, tech_index)
	local level_str = string.format(
		STRING_TABLE[level > 0 and "LEAGUE_TECH_LEVEL" or "LEAGUE_TECH_UNAVAILABLE"], 
    	level)
	
	local next_level_cond = league.get_tech_level_up_condition(building_index, tech_index)
	local icon_path = tech.icon or ""
	
	tech_grp.objs.name:set_text((tech.name or "") .. level_str)
	if string.len(icon_path) > 0 then
		tech_grp.objs.icon:SetImageFile(icon_path, 1)
	end
	tech_grp.objs.desc:set_text(league.expand_string(tech.desc) .. "\r" .. next_level_cond)
end