local DlgApi		= DlgApi
local GameApi		= GameApi
local DlgTemplate 	= DlgTemplate
local Format 	  	= string.format
Panel_SubVip1_1 = DlgTemplate:new({this = "Panel_SubVip1_1"})
local dlg 			= Panel_SubVip1_1
local GIFT_TASK_ID	= 10578


-------------------------------------
--		overrides
-------------------------------------
function dlg:Init()  --界面事件
	self:RegisterEvent("Button_Gift",	self.Gift) 
end


function dlg:ShowDialog(delay)
	self:update_gift_state()
end


local counter = 0
function dlg:Tick(delay)
	counter = counter + delay
    if counter > 1000 then
    	counter = 0 
    	self:update_gift_state()
    end
end


-------------------------------------
--		panel message
-------------------------------------
function dlg:Gift() 
	GameApi.MaunallyTrigTask(GIFT_TASK_ID)
end


-------------------------------------
--		function called by self
-------------------------------------
function dlg:update_gift_state()
	local can_deliver = GameApi.CanDeliverTask(GIFT_TASK_ID) and true or false
    DlgApi.EnableItem(self.this, "Button_Gift", can_deliver)
end
