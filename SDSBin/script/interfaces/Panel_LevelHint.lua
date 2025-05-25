Panel_LevelHint = DlgTemplate:new({this = "Panel_LevelHint"})

local dlg = Panel_LevelHint

local guide_stage = 0
local align_panel = nil




function dlg:Init()
end


function dlg:Tick(tick_time)
	local x = {}
	local y = {}
	if DlgApi.IsDialogShow("Panel_RoleInfoAttribute") then
		align_panel = "Panel_RoleInfoAttribute"
		guide_stage = 2
		x = -225
		y = -25
	else
		align_panel = "Panel_SystemBar"
		guide_stage = 1
		x = -30
		y = 0
	end

	local scale = DlgApi.GetWindowScale()
	x = x * scale
	y = y * scale
	DlgApi.SetDialogPosition(self.this, x, y, align_panel,
        	                     AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_RIGHT, 
            	                 AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_TOP )
end


