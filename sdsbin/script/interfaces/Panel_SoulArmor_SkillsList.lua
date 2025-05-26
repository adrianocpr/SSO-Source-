Panel_SoulArmor_SkillsList = ui.dialog.get("Panel_SoulArmor_SkillsList")

local Format = string.format
local dlg = Panel_SoulArmor_SkillsList
local skills = dlg:get_obj("Label_Suggest")
local profs  = dlg:get_obj("Combo_Prof")


local prof_id_list = 
{
    PROF_PEGASI,
    PROF_CYGNI,
    PROF_DRACONIS,
    PROF_ANDROMEDAE,
    PROF_PHOENIX,
    PROF_GEMINORUM,
}


function dlg:ShowDialog()
    local prof_info = GameApi.GetHostProfInfo()
    local prof_text_list = {}
    for i, _prof in ipairs(prof_id_list) do
        table.insert(prof_text_list, format_string:player_prof(_prof, prof_info[_prof]))
    end
    profs:SetListText(prof_text_list)
    profs:command(self.on_sel_prof)
    
    local prop = GameApi.GetHostPropEx()
    local idx = 1
    for i, _prof in ipairs(prof_id_list) do
        if _prof == prop.profession then
            idx = i
            break
        end
    end
    profs:SetListCurLine(idx - 1)
    self:on_sel_prof()
end


function dlg:on_sel_prof()
    local idx  = profs:GetListCurLine() + 1
    local prof = prof_id_list[idx]
    local text = prof and soul_armor_skills[prof] or ""
    skills:set_text(text)
end


