Panel_TeamArenaSub1 = ui.dialog.get("Panel_TeamArenaSub1")

local dlg = Panel_TeamArenaSub1

function dlg:Init()
	local obj = dlg:get_obj("Text_Routing")
    local text = obj:get_text()
    text = format_string:parse(text)
    obj:set_text(text)
end