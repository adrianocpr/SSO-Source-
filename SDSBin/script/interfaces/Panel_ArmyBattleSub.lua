Panel_ArmyBattleSub = ui.dialog.get("Panel_ArmyBattleSub")

local dlg = Panel_ArmyBattleSub

function dlg:Init()
	local obj = dlg:get_obj("Text_Hint")
    local text = STRING_TABLE.LEAGUE_GAME_AWARD_DESC
    text = format_string:parse(text)
    obj:set_text(text)
end