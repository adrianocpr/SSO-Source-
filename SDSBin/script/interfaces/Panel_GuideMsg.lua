Panel_GuideMsg = ui.dialog.get("Panel_GuideMsg")
local Format = string.format
local dlg = Panel_GuideMsg
local content	= dlg:get_obj("Text_Content")
local know 		= dlg:get_obj("Button_Know")
local jump 		= dlg:get_obj("Button_Jump")

-------------------------------------
--		overrides
-------------------------------------
function dlg:Init()
    self.info	= nil    
    self.id		= nil    
    know:command(dlg.know)
    jump:command(dlg.jump)
end


function dlg:HideDialog()
    self.info	= nil
    self.id		= nil    
end


-------------------------------------
--		panel message
-------------------------------------
function dlg:know()
    help_man:remove_help_data(TYPE_GUIDE, self.id)
    self:show(false)
end


function dlg:jump()
    if not self.info then return end
    -- 跳转
    if self.info.jump then
        GameUI:OnJumpInterface(self.info.jump)
    elseif self.info.help then
        GameUI:OnOpenHelp(self.info.help)
    end
    self:know()
end


-------------------------------------
--		function called by other
-------------------------------------
function dlg:SetHintInfo(show_data)
    if not help_data[show_data.id] then
        return false
    end
    self.id = show_data.id
    local show_list = help_data[show_data.id].show_list
    if not show_list then
        return false
    end
    self.info = CopyTable(show_list[show_data.show_idx] or {}) 
    self.info.text = help_man:get_help_text(show_data.typ, show_data.id, show_data.show_idx)

    -- 了解更多按钮
    if self.info.learn then
        jump:set_text(self.info.learn)
    else
        jump:set_text(STRING_TABLE.GUIDE_JUMP_TEXT)
    end
    
    -- 内容
    if self.info.npc then
        local npc_link = DlgApiEx.GetRouteLinkText(self.info.npc)
        self.info.text = Format(self.info.text, npc_link)
        self.info.npc = nil
    end
    local str = format_string:parse(self.info.text or "")
    content:set_text(str)   
    return true
end


-------------------------------------
--		function called by self
-------------------------------------

