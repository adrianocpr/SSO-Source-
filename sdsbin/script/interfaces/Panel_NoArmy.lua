Panel_NoArmy = ui.dialog.get("Panel_NoArmy")

local dlg = Panel_NoArmy

function dlg:Init()
	local obj = dlg:get_obj("Text_ArmyAdd")
    local text = STRING_TABLE.LEAGUE_NO_LEAGUE_TEXT
    text = format_string:parse(text)
    obj:set_text(text)
end