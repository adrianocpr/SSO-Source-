Panel_NoArmyTech = ui.dialog.get("Panel_NoArmyTech")

local dlg = Panel_NoArmyTech

local expand_env =
{
	npc = function(id)
		return DlgApiEx.GetRouteLinkText(id)
	end
}

local function expand_text(name)
	local obj = dlg:get_obj(name)
    local text = obj:get_text()
    text = string.expand(text, expand_env)
    obj:set_text(text)
end

function dlg:Init()
	expand_text("Text_ArmyLvUp")
	expand_text("Text_ArmyBase")
	expand_text("Text_ArmyGrowUp")
end