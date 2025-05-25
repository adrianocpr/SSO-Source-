local DlgApi	= DlgApi
local GameApi	= GameApi
local DlgTemplate = DlgTemplate
local Format 	= string.format
Panel_Reputation = DlgTemplate:new({this = "Panel_Reputation"})


-------------------------------------
--		overrides
------------------------------------
function Panel_Reputation:Init()
    local type_config = reputation.get_type_config()
    for i, type_name in ipairs(type_config) do
        DlgApi.SetItemText(self.this, "Radio_Reputation"..i, type_name)
    end 
end



-------------------------------------
--		function called by other
-------------------------------------
local REPU_ZONE		= 1
local REPU_PERSON 	= 2
function Panel_Reputation:UpdateRepuInfo(repu_id, repu_type)
    local bShow  = repu_id >= 0
    self:ShowRepuInfo(bShow)
    if not bShow then return end
    
    -- 无法找到声望信息    
    local repu = reputation.get_repu_info(repu_id)
    if not repu then
        self:ShowRepuInfo(false)
        return
    end
    
    -- 简介
    DlgApi.SetItemText(self.this, "TextArea_Introduce", repu.repu_intro or "")
    
    -- 所在地
    DlgApi.SetItemText(self.this, "Label_MapName", format_string:parse(repu.place_content or ""))
    DlgApi.SetItemText(self.this, "Label_MapTitle", repu.place_title or "")
    
    -- 绝技/相关NPC
    DlgApi.SetItemText(self.this, "Label_SkillName", format_string:parse(repu.skill_content or ""))
    DlgApi.SetItemText(self.this, "Label_SkillTitle", repu.skill_title or "")
    
    -- 提高声望方法
    DlgApi.SetItemText(self.this, "Label_GetwayName", format_string:parse(repu.method_content or ""))
    DlgApi.SetItemText(self.this, "Label_GetwayTitle", repu.method_title or "")
    
    -- 可购买物品的NPC
    DlgApi.SetItemText(self.this, "Label_LevelTitle", format_string:parse(repu.item_info.intro or ""))
    
    -- 物品列表
    return repu.item_info.list
end


function Panel_Reputation:ShowRepuInfo(bShow)
    DlgApi.ShowItem(self.this, "TextArea_Introduce", bShow)
    DlgApi.ShowItem(self.this, "Label_MapName", bShow)
    DlgApi.ShowItem(self.this, "Label_MapTitle", bShow)
    DlgApi.ShowItem(self.this, "Label_SkillName", bShow)
    DlgApi.ShowItem(self.this, "Label_SkillTitle", bShow)
    DlgApi.ShowItem(self.this, "Label_GetwayName", bShow)
    DlgApi.ShowItem(self.this, "Label_GetwayTitle", bShow)
    for i = 1, 4 do
    	DlgApi.ShowItem(self.this, "Image_Base"..i, bShow)
    end
    DlgApi.ShowItem(self.this, "Label_LevelTitle", bShow)
end
