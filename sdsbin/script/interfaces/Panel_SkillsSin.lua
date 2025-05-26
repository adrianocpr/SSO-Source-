Panel_SkillsSin = ui.dialog.get("Panel_SkillsSin")

local Format = string.format
local dlg = Panel_SkillsSin
dlg.tick = true
local BUFF_RANGE = 4
local BUFF_PROGRESS_TAB = 
{
    [1] = 0,
    [2] = 0.2,
    [3] = 0.3,
    [4] = 0.4,
    [5] = 0.5,
    [6] = 0.6,
    [7] = 0.7,
    [8] = 0.8,
    [9] = 1,
}
local pos = dlg:get_obj("Progress_Pos")


function dlg:ShowDialog()
    local progress = BUFF_PROGRESS_TAB[BUFF_RANGE + 1] or 0.5
    pos:SetProgress(progress)
end


local counter = 0
function dlg:Tick(tick_time)
    counter = counter + tick_time
    if counter <= 30 then
        return
    end	
    counter = 0 

    -- 将两个buff的信息映射到buff_lev上
    local virtue  = GameApi.GetHostBuffLevel(2695) or 0 
    local buff_lev= BUFF_RANGE
    if virtue > 0 then
        buff_lev = BUFF_RANGE - virtue + 1
    else
        local sin = GameApi.GetHostBuffLevel(2694) or 0        
        buff_lev  = buff_lev + sin + 1
    end
    
    local progress = BUFF_PROGRESS_TAB[buff_lev] or 0.5
    pos:SetActionProgress(500, progress)
end
