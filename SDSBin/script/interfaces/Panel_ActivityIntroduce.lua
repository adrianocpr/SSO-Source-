Panel_ActivityIntroduce = ui.dialog.get("Panel_ActivityIntroduce")
local dlg = Panel_ActivityIntroduce

local activity_list =
{
    [1] = {13066, 34345, 32557, 32558, 13523, 17368, 17370, 34284, 22856, },
    [2] = {44132, },
    [3] = {29344, },
    [4] = { },
}


function dlg:Init()
	local obj1 = dlg:get_obj("Text_Npc1")
    local text1 = STRING_TABLE.ACTIVITY_INTRODUCE_NPC_1
    text1 = format_string:parse(text1)
    if obj1 then obj1:set_text(text1) end
    
    local obj2 = dlg:get_obj("Text_Npc2")
    local text2 = STRING_TABLE.ACTIVITY_INTRODUCE_NPC_2
    text2 = format_string:parse(text2)
    if obj2 then obj2:set_text(text2) end
    
    local obj3 = dlg:get_obj("Text_Npc3")
    local text3 = STRING_TABLE.ACTIVITY_INTRODUCE_NPC_3
    text3 = format_string:parse(text3)
    if obj3 then obj3:set_text(text3) end
    
    local obj4 = dlg:get_obj("Text_Npc4")
    local text4 = STRING_TABLE.ACTIVITY_INTRODUCE_NPC_4
    text4 = format_string:parse(text4)
    if obj4 then obj4:set_text(text4) end

    local item_name 
    for m = 1, 4 do    
        for n = 1, 10 do
            item_name = string.format("Image_Award%d_%d", m, n)
            if activity_list[m] and activity_list[m][n] then
                DlgApi.ShowItem(dlg.this, item_name, true)
                DlgApiEx.ItemShowIvtrIcon(dlg.this, item_name, activity_list[m][n])
            else
                DlgApi.ShowItem(dlg.this, item_name, false)
            end
        end
    end
end
