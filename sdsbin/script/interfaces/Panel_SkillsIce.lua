Panel_SkillsIce = ui.dialog.get("Panel_SkillsIce")

local Format = string.format
local dlg = Panel_SkillsIce
dlg.tick = true

local damage = dlg:get_obj("Progress_dam")
local ep = dlg:get_obj("Label_Ice")

local counter = 0
function dlg:Tick(tick_time)
    counter = counter + tick_time
    if counter <= 30 then
        return
    end	
    counter = 0 
    
    local ep1, max1 = GameApi.GetHostEPInfo()        
    local show_ep = damage:GetProgress() 
    local cur_ep  = ep1 / max1
    local msecs = ((1.0 - cur_ep) / 0.1) * 1000
    
     ep:set_text(tostring(math.ceil(show_ep * 100)))
    if not damage:IsAutoProgress() then
        if ep1 < max1 then
            damage:SetAutoProgress(msecs, cur_ep, 1.0)
        else
            damage:SetProgress(1.0)
            return
        end
    else
        if math.abs(show_ep - cur_ep) > 0.11 then            
           	damage:SetAutoProgress(msecs, cur_ep, 1.0)
	    end        
    end   
end
