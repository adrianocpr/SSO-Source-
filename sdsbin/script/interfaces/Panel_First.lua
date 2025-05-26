local DlgApi		= DlgApi
local GameApi		= GameApi
local DlgTemplate 	= DlgTemplate
local Format 	  	= string.format
Panel_First = DlgTemplate:new({this = "Panel_First"})



-------------------------------------
--		overrides
-------------------------------------
function Panel_First:Init()  --界面事件
	self:RegisterEvent("Button_10",		                self.Push10)
	self:RegisterEvent("Button_30",		                self.Push30) 
	self:RegisterEvent("Button_60",		                self.Push60) 
end


-------------------------------------
--		panel message
-------------------------------------
function Panel_First:Push10() 
	DlgApiEx.MsgBox(self.this, MB_OKCANCEL, STRING_TABLE.MSGBOX_INTEGRATION, "", self.TrigTask10)
end

function Panel_First:Push30() 
	DlgApiEx.MsgBox(self.this, MB_OKCANCEL, STRING_TABLE.MSGBOX_INTEGRATION, "", self.TrigTask30)
end

function Panel_First:Push60() 
	DlgApiEx.MsgBox(self.this, MB_OKCANCEL, STRING_TABLE.MSGBOX_INTEGRATION, "", self.TrigTask60)  
end


-------------------------------------
--		call back
-------------------------------------
function Panel_First.TrigTask10(ret) 
	if ret == IDYES then
		GameApi.MaunallyTrigTask(11010)
	end
end

function Panel_First.TrigTask30(ret) 
	if ret == IDYES then
		GameApi.MaunallyTrigTask(9910)
	end
end

function Panel_First.TrigTask60(ret) 
	if ret == IDYES then
		GameApi.MaunallyTrigTask(9911)
	end
end

function Panel_First.GetDoubleExpRepuAndMax()
	return 91,90
end