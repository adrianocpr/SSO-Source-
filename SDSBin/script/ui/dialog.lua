local error = error
local type = type
local string = string
local table = table
local pairs = pairs
local ipairs = ipairs
local unpack = unpack
local setmetatable = setmetatable
local pcall = pcall
local console = console
local DlgApi = DlgApi
local DlgApiEx = DlgApiEx
local assert = assert
local _G = _G

module "ui"

local p = dialog._prototype

------------------------------------------
-- dialog api mapping
------------------------------------------

dialog._api_map =
{
	is_show = "IsDialogShow",
	is_active = "IsDialogActive",
	is_exist = "IsDialogExists",
	enable = "EnableDialog",
	set_pos = "SetDialogPosition",
	set_size = "SetDialogSize",
	set_scale = "SetDialogScale",
	set_alpha = "SetDialogAlpha",
	get_alpha = "GetDialogAlpha",
	set_whole_alpha = "SetDialogWholeAlpha",
	get_whole_alpha = "GetDialogWholeAlpha",
	set_frame = "SetDialogFrame",
	set_timer = "SetDialogTimer",
	set_prop = "SetDialogProp",
	get_prop = "GetDialogProp",
}

------------------------------------------
-- dialog prototype
------------------------------------------
function p:call_api(api_name, ...)
	local func = DlgApi[api_name] or DlgApiEx[api_name]
	if type(func) == "function" then
		return func(self.name, unpack(arg))
	end
end

function p:get_obj(obj_name)
	if self._objs[obj_name] == nil then
		local i = obj:_new(self.name, obj_name)
		self._objs[obj_name] = i
	end
	
	return self._objs[obj_name]
end

function p:get_obj_group(obj_names)
	local objs = {}
	for _, name in ipairs(obj_names) do
		local obj = self:get_obj(name)
		if obj then
		    table.insert(objs, obj)
		end
	end
	for k, name in pairs(obj_names) do
	    if type(k) ~= "number" then
	        local obj = self:get_obj(name)
    		if obj then
    			objs[k] = obj
    		end
	    end
	end
	return obj_group:new(objs)
end

function p:iter_objs_like(obj_name_pattern)
	assert(type(obj_name_pattern) == "string", "obj_name_pattern need a string value")
	assert(obj_name_pattern:match("%%d"), "obj_name_pattern must contains '%d'")
	local i = 0
	local _self = self
	return function()
		i = i + 1
		return _self:get_obj(obj_name_pattern:format(i))
	end
end

function p:register_event(event, handler)
	if event and type(handler) == "function" then
		self.eventMap[event] = handler
	end
end

function p:unregister_event(event)
    self.eventMap[event] = nil    
end 

function p:show(is_show, ...)
	if is_show == nil then
		is_show = true
	end
	return self:call_api("ShowDialog", is_show, unpack(arg))
end

function p:hide()
	return self:call_api("ShowDialog", false)
end

function p:change_focus(obj)
	if type(obj) == "string" then
		self:call_api("ChangeFocus", obj)
	elseif type(obj) == "table" and type(obj.name) == "string" then
		self:call_api("ChangeFocus", obj.name)
	end
end
------------------------------------------
-- make compatible with dlgtemplate.lua
------------------------------------------

function p:OnEventMap( event, ...)
	local handler = self.eventMap[event]
	if not handler then
		return false
	end
	local success, ret = pcall(handler, self, unpack(arg))
	if success then
		if ret ~= nil then return not not ret end
	else
		console.error(ret)
	end
	
	return true --handler default return true
end

function p:OnMessageBox(name, bRet)
end

function p:Init()
end

function p:ShowDialog()
end

function p:HideDialog()
end

function p:Release()
end

function p:OnAttach()
end

function p:OnDetach()
end

--called after tick()
function p:OnTimer()
	self:call_api("SetDialogTimer", false)
end

function p:IsTick()
   return self.tick or self.Tick
end

function p:IsRender()
 	 return self.render or self.Render
end

-- create aliases for being compatible with dlgtemplate.lua
p.UnRegisterEvent = p.unregister_event
p.RegisterEvent = p.register_event