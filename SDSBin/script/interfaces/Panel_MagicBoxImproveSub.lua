Panel_MagicBoxImproveSub = ui.dialog.get("Panel_MagicBoxImproveSub")

local dlg = Panel_MagicBoxImproveSub

local combo_attribute   = dlg:get_obj("Combo_Cond1")
local combo_level       = dlg:get_obj("Combo_Cond2")


function dlg:Init()
    local group_list, tag_list = Equip_Suite_Desc:GetEquipSuitCombo()
    if not group_list then return end
    if not tag_list then return end

    local groups = {}
    for _, group in ipairs(group_list) do
        table.insert(groups, group[1])
    end
    combo_attribute:SetListText(groups)
    combo_attribute:SetListCurLine(0)
    for idx, group in ipairs(group_list) do
        combo_attribute:SetComboItemData(idx - 1, group[2])        
    end

    local tags = {}
    for _, tag in ipairs(tag_list) do
        table.insert(tags, tag[1])
    end
    combo_level:SetListText(tags)
    combo_level:SetListCurLine(0)
    for idx, tag in ipairs(tag_list) do
        combo_level:SetComboItemData(idx - 1, tag[2])        
    end
end