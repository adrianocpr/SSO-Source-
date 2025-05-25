Panel_GuideCosmos = ui.dialog.get("Panel_GuideCosmos")
local dlg = Panel_GuideCosmos
dlg.tick = true

local count = 0
function dlg:Tick(delay)
	count = count + delay
	if count < 1000 then
	    return
	end
	count = 0
	self:SetPos()	
end

function dlg:ShowDialog()
	self:SetPos()
end

function dlg:SetPos()
	local scale = DlgApi.GetWindowScale()
	local bar_prop = DlgApi.GetDialogProp('Panel_QuickBar')
	local guide_prop = DlgApi.GetDialogProp(self.this)
	if DlgApi.IsDialogShow('Panel_QuickBar') then
		DlgApi.SetDialogPosition(self.this, bar_prop.width - 80 * scale - guide_prop.width/2, 80 * scale, 'Panel_QuickBar', AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_LEFT, AUIDIALOG_ALIGN_OUTSIDE, AUIDIALOG_ALIGN_TOP)
	end
end



