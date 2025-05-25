local DlgApi		= DlgApi
local GameApi		= GameApi
local DlgTemplate 	= DlgTemplate
local Format 	  	= string.format
Panel_SkillsGfx = DlgTemplate:new({this = "Panel_SkillsGfx"})

-------------------------------------
--		overrides
-------------------------------------
function Panel_SkillsGfx:Tick(delay)
	self.delayTime = self.delayTime or 0
	self.delayTime = self.delayTime + delay
	if self.delayTime >= 10000 then
	    DlgApi.ShowDialog(self.this,false)
	 	self.delayTime = nil
	end
end


-------------------------------------
--		function called by others
-------------------------------------
function Panel_SkillsGfx:ShowIconGFX(dlgName, itemName, bShowGFX)
    local rect =  DlgApi.GetItemRect(dlgName, itemName, false)
    if not rect then
        return
    end
    
    DlgApi.SetDialogPosition(self.this, rect.x, rect.y)        
    DlgApi.ShowItem(self.this, "Image_Gfx", bShowGFX)
    DlgApi.ShowItem(self.this, "Image_HighLight", not bShowGFX)
    if not bShowGFX then
        DlgApi.SetItemSize(self.this, "Image_HighLight", rect.width, rect.height)
    end
    if not DlgApi.IsDialogShow(self.this) then
        DlgApi.ShowDialog(self.this, true)
    end
end

