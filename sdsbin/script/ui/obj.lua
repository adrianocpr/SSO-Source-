local error = error
local type = type
local string = string
local tostring = tostring
local table = table
local pairs = pairs
local ipairs = ipairs
local unpack = unpack
local setmetatable = setmetatable
local pcall = pcall
local math = math
local console = console
local DlgApi = DlgApi
local DlgApiEx = DlgApiEx
local _G = _G

module "ui"

local p = obj._prototype

------------------------------------------
-- obj api mapping
------------------------------------------

obj._api_map =
{
	is_show = "IsItemShow",
	enable = "EnableItem",
	is_enabled = "IsItemEnabled",
	set_pos = "SetItemPos",
	set_size = "SetItemSize",
	get_rect = "GetItemRect",
	get_text = "GetItemText",
	set_alpha = "SetItemAlpha",
	set_hint = "SetItemHint",
	flash = "FlashItem",

	show_ivtr_icon = "ItemShowIvtrIcon",
	clear_icon = "ItemClearIcon",
	deal_message = "ItemDealMessage",
}

------------------------------------------
-- obj prototype
------------------------------------------

function p:call_api(api_name, ...)
	local func = DlgApi[api_name] or DlgApiEx[api_name]
	if type(func) == "function" then
		return func(self.dialog_name, self.name, unpack(arg))
	end
end

function p:get_dialog()
	return dialog.get(self.dialog_name)
end

function p:command(handler)
	local dlg = self:get_dialog()
	if dlg then
		local name = self.name
		dlg:register_event(name, function()
			return handler(dlg, name)
		end)
	end
end

function p:un_command()
	local dlg = self:get_dialog()
	if dlg then
		dlg:unregister_event(self.name)
	end
end

function p:show(is_show, ...)
	if is_show == nil then
		is_show = true
	end
	return self:call_api("ShowItem", is_show, unpack(arg))
end

function p:hide()
	return self:call_api("ShowItem", false)
end

function p:set_text(text)
	text = text or ""
	return self:call_api("SetItemText", tostring(text))
end

function p:append_text(text)
	text = text or ""
	return self:call_api("AppendItemText", tostring(text))
end

function p:set_color(...)
	local arg = {...}
	if #arg == 1 then
		local c = arg[1]
		local a = math.floor(c / (2^24)) % 256
		local r = math.floor(c / (2^16)) % 256
		local g = math.floor(c / (2^8)) % 256
		local b = math.floor(c) % 256
		self:call_api("SetItemColor", r, g, b, a)
	else
		self:call_api("SetItemColor", ...)
	end
end

function p:get_pos()
    local rect = self:get_rect(true)
    return {x = rect.x, y = rect.y}
end

function p:move(delta_x, delta_y)
	delta_x = delta_x or 0
	delta_y = delta_y or 0
	local rect = self:get_rect(true)
	self:set_pos(rect.x + delta_x, rect.y + delta_y)
end

function p:move_x(delta_x)
	self:move(delta_x, 0)
end

function p:move_y(delta_y)
	self:move(0, delta_y)
end

function p:save_pos()
	local rect = self:get_rect(true)
	self._saved_pos = { x = rect.x, y = rect.y }
end

function p:restore_pos()
	if self._saved_pos then
		self:set_pos(self._saved_pos.x, self._saved_pos.y)
	end
end

function p:clone(new_name)
	if new_name == self.name then
		error("obj:clone() must specific a different name.")
	end
	DlgApi.CreateControl(self.dialog_name, self.name, new_name)
	return self:get_dialog():get_obj(new_name)
end