local api = ConsoleApi
local GameApi = GameApi
local string = string
local type = type
local tostring = tostring
local tonumber = tonumber
local table = table
local insert = table.insert
local unpack = unpack
local setmetatable = setmetatable
local print = print
local pcall = pcall
local _error = error

dofile_show_err "script/console/commands.lua"
dofile_show_err "script/console/helper.lua"
dofile_show_err "script/console/suggestion.lua"

module "console"

local function parse_token(str)
	if type(str) ~= "string" then return str end
	local values = {on = 1, off = 0, ["true"] = 1, ["false"] = 0}
	return values[string.lower(str)] or tonumber(str) or str
end

---------------------------
-- run a string console command
-- run(cmd) is also supported
function run(self, cmd)
	if type(self) ~= "table" then
		cmd = tostring(self)
		self = _M
	else
		cmd = tostring(cmd)
	end
	
	cmd = string.gsub(cmd, "^d[ _](%D+)", "%1")
	
	local tokens = {}
	for t in string.gmatch(cmd, "[^%s]+") do
		insert(tokens, parse_token(t) or t)
	end
	
	if table.maxn(tokens) < 1 then return false end
	
	local name = table.remove(tokens, 1)
	if name == "run" then return false end
	
	if type(self[name]) == "function" then
		local v, msg = pcall(self[name], unpack(tokens))
		if not v then
			error(msg)
		end
		return true
	end
	
	return false
end

local function simple_cmd(handler, cfg, ...)
	local arg_count = table.maxn(arg)
	if type(cfg.args) == "number" and arg_count < cfg.args then
		_error(string.format("Need %d parameter(s)", cfg.args), 0)
	elseif type(cfg.args) == "table" then
		local min_args = min(unpack(cfg.args))
		local max_args = max(unpack(cfg.args))
		if arg_count < min_args or arg_count > max_args then
			_error(string.format("Need %d to %d parameter(s)", min_args, max_args), 0)
		end
	end
	
	return handler(cfg.id, unpack(arg)) 
end

custom = custom or {}
suggestions = suggestions or {}
c2s_simple = c2s_simple or {}
c2d_simple = c2d_simple or {}

setmetatable(_M, {
	__index = function(table, key)
		if _M.c2s_simple[key] then
			local c2s = _M.c2s_simple[key]
			if type(c2s) == "number" then
				c2s = {id = c2s}
			end
			return 
				function (...)
					return simple_cmd(c2scmd, c2s, unpack(arg))
				end
		elseif _M.c2d_simple[key] then
			local c2d = _M.c2d_simple[key]
			if type(c2d) == "number" then
				c2d = {id = c2d}
			end
			return 
				function (...)
					return simple_cmd(c2dcmd, c2d, unpack(arg))
				end
		elseif type(api[key]) == "function" then
			return api[key]
		elseif type(custom[key]) == "function" then
			return custom[key]
		end
	end
})