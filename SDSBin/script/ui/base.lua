------------------------------------------
-- 对DlgApi的封装，可替代dlgtemplate.lua
-- Author: Feng Bo
------------------------------------------

local error = error
local type = type
local string = string
local table = table
local pairs = pairs
local ipairs = ipairs
local unpack = unpack
local setmetatable = setmetatable
local pcall = pcall
local dofile = dofile
local console = console
local DlgApi = DlgApi
local DlgApiEx = DlgApiEx
local _G = _G
local tostring = tostring
local Log = Log

module "ui"

local api = {}
setmetatable(api, {
	__index = function(table, key)
		return DlgApi[key] or DlgApiEx[key]	
	end
})

local function deal_api_name(name, keyword, map_out)
	if not string.find(name, keyword) then return end
	
	local key1 = {}
	local key2 = {}
	for t in string.gmatch(name, "[A-Z][a-z]+") do
		if not string.match(t, keyword) then
			table.insert(key1, t)
			table.insert(key2, string.lower(t))
		end
	end
	
	map_out[table.concat(key1)] = name
	map_out[table.concat(key2, "_")] = name
end

local function deal_api(api, keyword, map_out)
	for k in pairs(api) do
		deal_api_name(k, keyword, map_out)
	end
end
------------------------------------------
-- dialog and obj
------------------------------------------

dialog = {
	_dialogs = {},
	_prototype = {},
	_api_map = {},
	_mt = {
		__index = function(table, key)
			if dialog._prototype[key] then
				return dialog._prototype[key]
			else
				local name = dialog._api_map[key] or key
				if name and type(api[name]) == "function" then
					return function(...)
						local arg_start = arg[1] == table and 2 or 1 -- skip the "self" arg
						return api[name](table.name, unpack(arg, arg_start))
					end
				end
			end
		end
	},
}

-- init dialog api map
--deal_api(DlgApi, "Dialog", dialog._api_map)
--deal_api(DlgApiEx, "Dialog", dialog._api_map)

obj = {
	_prototype = {},
	_api_map = {},
	_mt = {
		__index = function(table, key)
			if obj._prototype[key] then
				return obj._prototype[key]
			else
				local name = obj._api_map[key] or key
				if name and type(api[name]) == "function" then
					return function(...)
						local arg_start = arg[1] == table and 2 or 1 -- skip the "self" arg
						return api[name](table.dialog_name, table.name, unpack(arg, arg_start))
					end
				end
			end
		end
	},
}

-- init obj api map
--deal_api(DlgApi, "Item", obj._api_map)
--deal_api(DlgApiEx, "Item", obj._api_map)

function obj:_new(dialog_name, name)
	if not DlgApiEx.IsItemExists(dialog_name, name) then return end
	
	local type = DlgApiEx.GetItemType(dialog_name, name)
	local o = {
		dialog_name = dialog_name,
		name = name,
		type = type,
	}
	setmetatable(o, self._mt)
	return o
end

function obj.get(dialog_name, name)
	return obj:_new(dialog_name, name)
end

function dialog:_new(name)
	if not DlgApiEx.IsDialogExists(name) then return end

	local o = {
		name = name,
		_objs = {},
		
		-- in order to be compatible with dlgtemplate.lua
		this = name,
		eventMap = {
			["Button_Close"] = function(self) self:show(false) end,
		},
	}
	setmetatable(o, self._mt)
	return o
end

function dialog.clear_all()
	dialog._dialogs = {}
end

function dialog.get(name)
	if dialog._dialogs[name] == nil then
		local dlg = dialog:_new(name)
		dialog._dialogs[name] = dlg

		local success, msg = pcall(dofile, string.format("script/interfaces/%s.lua", name))
		if not success then
			console.info(msg)
		end
	end
	
	return dialog._dialogs[name]
end

------------------------------------------
-- obj prototype
------------------------------------------
function obj._prototype:get_dialog()
	return dialog.get(self.dialog_name)
end

function obj._prototype:command(handler)
	local dlg = self:get_dialog()
	if dlg then
		dlg:register_event(self.name, handler)
	end
end

------------------------------------------
-- obj group
------------------------------------------
obj_group =
{
	_prototype = {},
	_mt = {
		__index = function(table, key)
			return function(self, ...)
				for _, v in pairs(table.objs) do
					if type(v[key]) == "function" then
						v[key](v, unpack(arg))
					end
				end
			end
		end
	},
}

function obj_group:new(obj_table)
	local o =	{
		objs = obj_table or {}
	}
	setmetatable(o, self._mt)
	return o
end