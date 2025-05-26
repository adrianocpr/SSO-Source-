--[[
UIMan模板，修改前请与我联系

author: wang kuiwu
说明 1. 对于windows message的响应函数，必须有返回值

		true表示响应了该message，false表示没有。

]]--

local DlgApi  = DlgApi      --from c
local GameApi = DanceApi
local Insert  = table.insert
local type    = type


glb_curUIMan = nil
UIManTemplate = 
{   	
	index = UIMAN_NONE,
	this  = 0,
	eventMap = {},
	messageboxCB = {},
}


-------------------------------------
--		base function for overrides
-------------------------------------
function  UIManTemplate:new(datamember)
	self:RegisterEvent(LEVT_ERROR_MSG,  self.OnErrorMsg)
	self:RegisterEvent(LEVT_NOTIFY_MSG, self.OnNotifyMsg)
		
	return CreateObj(self, datamember)
end


function UIManTemplate:Init()    
end


function UIManTemplate:Tick(deltaTime)    
end


function UIManTemplate:Release()    
end


function UIManTemplate:ResizeWindows()   
end

function UIManTemplate:CanDialogShow(mode, dlg_name)
	return true
end

function UIManTemplate:RegisterEvent(event, handler)
	if event and handler then
		self:AddEventCB(event, handler)
	end
end


function UIManTemplate:MessageBox(mtype, name, text, CB)
	if CB then
		self:AddMessageboxCB(name, CB)
	end
	return DlgApi.PopupMessageBox (mtype, name, text)
end


-------------------------------------
--		base function for message map
-------------------------------------
function UIManTemplate:OnEventMap(event, ...)
	local map = self.eventMap[event]  
	if not map then
		return false
	end   	
	  
	for _, handler in ipairs(map) do
		if type(handler) == "function" then
			handler(self, event, unpack(arg))
		elseif type(handler) == "table" then
			for  _, v in ipairs(handler) do
				if v:OnEventMap(event, unpack(arg)) then
					return true
				end               
			end
		end
	end	    
	return false
end


function UIManTemplate:OnMessageBox(name, bRet)
	local handler = self.messageboxCB[name]
	if not handler then
		return
	end	   
	 
	if type(handler) == "function" then
		handler(self, name, bRet)
	elseif type(handler) == "table" then
		for _, v in ipairs(handler) do
			v:OnMessageBox(name, bRet)
		end	    
	end
end


function UIManTemplate:OnErrorMsg(event, errCode)
	--日志
	if not ERROR_MSG_TABLE[errCode] then
		Log("template error code:"..tostring(errCode))
	end
	
	--提示
	local msg = ERROR_MSG_TABLE[errCode] or STRING_ERROR_UNKNOWN
	self:MessageBox(MB_OK, "", msg)
end


function UIManTemplate:OnNotifyMsg(event, msgCode)
	local msg = ERROR_MSG_TABLE[msgCode]
	if msg == nil then
		msg = "unknown msg code"
	end
	GameApi.OutputNotifyMessage(0xff00ffff, msg)
end



-------------------------------------
--		others function 
-------------------------------------
function UIManTemplate:SendEvent(eventid)
	DlgApiEx.SendUIManEvent(self.index, eventid)
end


function UIManTemplate:IsTick()
	return self.Tick ~= nil
end


function UIManTemplate:AddMessageboxCB(name, CB)
	if type(CB) == "function" then
		--self function
		self.messageboxCB[name] = CB
	elseif type(CB) == "table" then
		--dialog messagebox handler
		if self.messageboxCB[name] then
			Insert(self.messageboxCB[name], CB)
		else
			self.messageboxCB[name] = {CB}
		end	
	end	 
end


function UIManTemplate:AddEventCB(name, CB)
	--dialog event maper
	if self.eventMap[name] then
		Insert(self.eventMap[name], CB)
	else
		self.eventMap[name] = {CB}
	end
end

