Panel_SkillsEnergy = ui.dialog.get("Panel_SkillsEnergy")

local Format = string.format
local dlg = Panel_SkillsEnergy
dlg.tick = true

local HEAL_BUFF   = 292
local DAMAGE_BUFF = 293
local SWITCH_SKILL= 515


local heal 	= dlg:get_obj("Progress_heal")
local damage= dlg:get_obj("Progress_dam")
local switch= dlg:get_obj("Check_Status")
local status= dlg:get_obj("Label_Status")


function dlg:Init()
    switch:command(self.switch_field)
end


local current_show_heal = 0
local dest_heal = 0
local current_show_damage = 0
local dest_damage = 0
local counter = 0
function dlg:Tick(tick_time)
    counter = counter + tick_time
    if counter <= 30 then
        return
    end	
    counter = 0
    
	local Change_lev = GameApi.GetHostSkillLevel(515)
    local heal_lev = GameApi.GetHostBuffLevel(HEAL_BUFF) or 0
    local skllev_heal = GameApi.GetHostSkillLevel(516) or GameApi.GetHostSkillLevel(520)
    local dmg_lev = GameApi.GetHostBuffLevel(DAMAGE_BUFF) or 0
	local skllev_damage = GameApi.GetHostSkillLevel(526) or GameApi.GetHostSkillLevel(528)
    local ep1, max1, ep2, max2 = GameApi.GetHostEPInfo()

    do
        --local show_status = skllev_heal and skllev_damage
		local show_status = Change_lev
        if show_status  then
            status:show()
            local enable_heal = heal_lev and heal_lev > 0
            status:set_text(enable_heal and STRING_TABLE.PROF_ENERGY_HEAL or STRING_TABLE.PROF_ENERGY_DAMAGE)
            switch:show()
            switch:CheckItem(enable_heal and true or false)
        else
            switch:show(false)
            status:show(false)
        end
    end

    do
    	if heal_lev and heal_lev > 0 and skllev_heal then
    	    dest_heal = ep1 / max1
        	if math.abs(dest_heal - current_show_heal) < 0.001 then
        		current_show_heal = dest_heal
        	else
        		local delta = dest_heal - current_show_heal
        		current_show_heal = current_show_heal + delta * 0.5
        	end
        	heal:show()
        	heal:SetItemText(Format("%d/%d", ep1, max1))
        	heal:SetProgress(current_show_heal)
    	else
    	    heal:show(false)
    	end
    end

	do
    	if dmg_lev and dmg_lev > 0 and skllev_damage then
    	    dest_damage = ep2 / max2
        	if math.abs(dest_damage - current_show_damage) < 0.001 then
        		current_show_damage = dest_damage
        	else
        		local delta = dest_damage - current_show_damage
        		current_show_damage = current_show_damage + delta * 0.5
        	end
        	damage:show()
        	damage:SetItemText(Format("%d/%d", ep2, max2))
        	damage:SetProgress(current_show_damage)
    	else
    	    damage:show(false)
    	end
	end
end


local counter = 0
function dlg:switch_field()
    local cur_time = GlobalApi.LuaGetTickCount()
    if (cur_time - counter) < 1000 then
        return
    else
        counter = cur_time
    end

    GameApi.CastSkill(SWITCH_SKILL)
end
