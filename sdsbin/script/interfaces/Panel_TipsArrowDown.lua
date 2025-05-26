local DlgApi		= DlgApi
local GameApi		= GameApi
local DlgTemplate 	= DlgTemplate
local Format 	  	= string.format
Panel_TipsArrowDown = DlgTemplate:new({this = "Panel_TipsArrowDown"})


-------------------------------------
--		overrides
-------------------------------------
function Panel_TipsArrowDown:Init() 
end


function Panel_TipsArrowDown:Tick(delay)
	self.delayTime = self.delayTime or 0
	self.delayTime = self.delayTime + delay
	if self.delayTime >= 5000 then
	    DlgApi.ShowDialog(self.this,false)
	 	self.delayTime = nil
	end
end
	


-------------------------------------
--		function called by others
-------------------------------------
--根据技能id所在位置显示箭头
function Panel_TipsArrowDown:ShowOnSkills(quickImage)
     if type(quickImage) == "table" and quickImage[1] and quickImage[1].dialog and quickImage[1].control then
         local dlg = quickImage[1].dialog
         local item = quickImage[1].control
         local itemProp = DlgApi.GetItemRect(dlg,item,false)
         --获得控件在dlg内部（true）或在整个界面（false）内的坐标和宽高。此处为了示例把参数写全。
         --DlgApi.SetDialogPosition(self.this, itemProp.x, itemProp.y-50)
         --DlgApi.FlashItem(self.this,"Image_Arrow",true)
         --DlgApi.ShowDialog(self.this,true)
         
         --闪烁特效
         ani:new{
        			start_state = itemProp.y/2,
        			end_state = itemProp.y-2,
        			duration = 3000,
        		 }         
     end
end