local xml = require("slaxdom")
module("server_config", package.seeall)

-- 依次读取以下配置，version越高的优先使用。
-- 若version相等，使用排在config_paths中靠前的配置
local config_paths =
{
	"bin/server.xml",
	"roleSettings/server.xml",
}

local num_attrs =
{
	version = true,
	zoneid = true,
}

local function is_bool_str(str)
	if type(str) ~= "string" then return false end
	local lower = str:lower()
	return lower == "true" or lower == "false"
end

local function str2bool(str)
	return type(str) == "string" and str:lower() == "true"
end

local function load_server_xml_config(file)
	local stack = {}
	local server_list = nil
	local parser = xml:parser{
		startElement = function(name, nsURI)
			local parent = stack[#stack]

			local node = {}
			table.insert(stack, node)

			if parent then
				if name == "announcement" then
					server_list.announcement = node
				elseif name == "server" then
					local servers = parent.servers or {}
					parent.servers = servers
					table.insert(servers, node)
				else
					table.insert(parent, node)
				end
			else
				server_list = node
			end
		end,
		attribute = function(name, value, nsURI)
			local top = stack[#stack]
			if num_attrs[name] then
				top[name] = tonumber(value) or 0
			elseif is_bool_str(value) then
				top[name] = str2bool(value)
			elseif name == "port" then
				local port = {}
				for p in value:gmatch("%d+") do
					table.insert(port, tonumber(p))
				end
				top[name] = port
			else
				top[name] = value
			end
		end,
		closeElement = function(name, nsURI)
			local pop = table.remove(stack)
		end,
	}

	local f = io.open(file)
	if f then
		parser:parse(f:read("*a"))
		f:close()
	end

	if server_list and type(server_list.announcement) == "table" then
		server_list.announcement_url = server_list.announcement.url
	end

	return server_list
end

function _M:get_config()
	local configs = {}
	for priority, path in ipairs(config_paths) do
		local success, conf = pcall(load_server_xml_config, path)
		if success and conf then
			conf.priority = priority
			conf.version = conf.version or 0
			table.insert(configs, conf)
		elseif conf then
			local err = conf
			GlobalApi.Log(err)
		end
	end
	table.sort(configs, function(a, b)
		if a.version == b.version then
			return a.priority < b.priority
		else
			return a.version > b.version
		end
	end)
	return configs[1]
end

function _M:get_server_names(server_id)
	local name_list = {}
	for k,v in pairs(server_config_ext) do
		if v.id == server_id then
			table.insert(name_list,v.name)
		end
	end
	return name_list
end

function _M:is_server_open_xunbao_sell_role(server_id)
	for k,v in pairs(server_config_ext) do
		if v.id == server_id then
			return v.xunbao_sell_role == true
		end
	end
	return false
end
