Panel_AnimationMask2 = ui.dialog.get("Panel_AnimationMask2")

local dlg = Panel_AnimationMask2
local sub = dlg:get_obj("Label_Content")
local string = string
local panel = "Panel_AnimationName"


local replace_words =
{
	{key = "&name&", func = function() return GameApi.GetHostName() end, },
}


function dlg:Init()
    DlgApiEx.InitHintTextItem(panel, "Label_Name")
end
 

function dlg:set_sub_title(sub_title)
    local _, _, cfg_str = string.find(sub_title, "&sub_title_(%d)&")
    local cfg_id = tonumber(cfg_str)
    if cfg_id then        
        local cfg = animation:get_name_config(cfg_id)
        if self:show_animation_name(cfg) then
            sub:SetItemText("")
            return
        end
    end          
    
    self:hide_animation_name()
    sub:SetItemText(self:replace_word(sub_title))
end


function dlg:replace_word(text)
    if not text then return "" end
    for _, replace_word in ipairs(replace_words) do
        if string.match(text, replace_word.key) then
            text = string.gsub(text, replace_word.key, replace_word.func())
        end
    end
    return text
end


local item_name = "Label_Name"
function dlg:show_animation_name(cfg)
    if not cfg then return false end   
    DlgApi.ShowDialog(panel, true)    
    
    local x, y = GameApi.GetAnimationObjScreenPos(cfg.id)
    if (not x) or (not y) then
    	local left, top, right, bottom = DlgApi.GetWindowRect()
    	x = (right - left) / 2
    	y = (bottom - top) / 2
    end
    DlgApi.SetDialogPosition(panel, x, y)
    
    DlgApi.SetObjProperty(panel, item_name, "Vertical Text", cfg.virtical and true or false)        
    local str = self:replace_word(cfg.text)
    DlgApi.SetItemText(panel, item_name, str)
    DlgApi.SetDialogPosition(panel, x, y)
    return true
end


function dlg:hide_animation_name()
    if not DlgApiEx.IsDialogLoad(panel) then
        return
    end
    DlgApi.ShowDialog(panel, false)
end

