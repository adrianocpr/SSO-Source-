Panel_SkillsFire = ui.dialog.get("Panel_SkillsFire")

local dlg = Panel_SkillsFire
dlg.tick = true


local MAX_STACK = 5
local fires = ui.obj_group:new()
local gfxs  = ui.obj_group:new()
for i = 1, MAX_STACK do
	table.insert(fires.objs, dlg:get_obj("Image_" .. i))
	table.insert(gfxs.objs, dlg:get_obj("Image_Fire" .. i))
end
local progress_fire = dlg:get_obj("Progress_Fire")
local buff_max_time = 15
local buff_gfx1 = dlg:get_obj("Image_Buff1")
local buff_gfx2 = dlg:get_obj("Image_Buff2")


-------------------------------------
--		overrides
-------------------------------------

function dlg:Init()
	for i, gfx in ipairs(gfxs.objs) do
		gfx:show(false)
	end
	buff_gfx1:show(false)
	buff_gfx2:show(false)
end


local counter = 0
function dlg:Tick(tick_time)
    counter = counter + tick_time
    if counter <= 30 then
        return
    end	
    counter = 0 
    
    do
        local buff_lev, buff_time = GameApi.GetTargetBuffInfo(822)
        -- 层数
        buff_lev = buff_lev or 0
        for i, fire in ipairs(fires.objs) do
    		fire:show(i <= buff_lev)
    	end
		for i, gfx in ipairs(gfxs.objs) do
			if gfx:is_show() ~= (i <= buff_lev) then
				gfx:show(i <= buff_lev)
			end
		end
    	-- 进度
    	buff_time = buff_time or 0
    	local rate = (buff_time - GlobalApi.GetServerGMTTime()) / buff_max_time
    	if rate < 0 then rate = 0 end
    	if rate > 1 then rate = 1 end
    	progress_fire:SetProgress(rate)
    end

	do
	    local buff_lev, buff_time = GameApi.GetTargetBuffInfo(825)
	    local exist = buff_lev and true or false
	    if buff_gfx1:is_show() ~= exist then buff_gfx1:show(exist) end
	    if buff_gfx2:is_show() ~= exist then buff_gfx2:show(exist) end
	end
end
