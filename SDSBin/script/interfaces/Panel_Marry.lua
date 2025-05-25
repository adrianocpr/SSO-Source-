Panel_Marry = ui.dialog.get("Panel_Marry")

local dlg = Panel_Marry

local label_name1 = dlg:get_obj("Label_Name1")
local label_name2 = dlg:get_obj("Label_Name2")

function dlg:Init()
end

function dlg:Update(name1, name2)
	label_name1:set_text(name1 or "")
	label_name2:set_text(name2 or "")
	self:show()
end
