local sandbox = require("sandbox")
module("reputation", package.seeall)

local cfg = sandbox.create_full()

local function merge_config(table1, table2)
	if table1 == nil then
	    table1 = {}
	end
	for k,v in pairs(table2) do
	    if table1[k] == nil then
	        table1[k] = table2[k]
	    elseif type(table1[k]) == "table" and type(v) == "table" then
	        merge_config(table1[k], table2[k])
	    end
	end
	return table1
end
local function append_config(table1, table2)
	if table1 == nil then
	    table1 = {}
	end
	for _,v in pairs(table2) do
	    table.insert(table1, v)
	end
	return table1
end

local function add_repu_config(fn)
	local repu_cfg = sandbox.create_full()
	local success, err = repu_cfg("script/config/" .. fn)
	if not success then
		console.error(err)
	end
		
	cfg.type_config 			= merge_config(cfg.type_config, repu_cfg.type_config or {})
	cfg.repu_data 				= merge_config(cfg.repu_data, repu_cfg.repu_data or {})
	cfg.repu_dir 				= append_config(cfg.repu_dir, repu_cfg.repu_dir or {})
	cfg.formatters				= merge_config(cfg.formatters, repu_cfg.formatters or {})
	cfg.inc_formatters 			= merge_config(cfg.inc_formatters, repu_cfg.inc_formatters or {})
	cfg.league_formatters 		= merge_config(cfg.league_formatters, repu_cfg.league_formatters or {})
	cfg.league_inc_formatters	= merge_config(cfg.league_inc_formatters, repu_cfg.league_inc_formatters or {})
end
	

local function load_config()
	add_repu_config("reputation.lua")
	add_repu_config("battlefield_reputation.lua")
end
load_config()

function get_type_config()
	return cfg.type_config or {}
end

function get_repu_dir()
    return cfg.repu_dir or {}
end

function get_repu_info(repu_id, repu_id_bak)
    if type(repu_id) == "table" then
        repu_id = repu_id_bak
    end
    return  cfg.repu_data[repu_id] or {}
end


local repu_unit_cfg = 
{
	{unit = 10000, name = STRING_TABLE.WAN, },	
}
function repu_unit_transfer(self, number)    
--    for i = #repu_unit_cfg, 1, -1 do
--        local info = repu_unit_cfg[i]
--        if number >= info.unit then
--            return string.format(info.name, number / info.unit)
--        end
--    end
    return string.format("%d", number)
end

local function _get_formatter(repu_id, type, candidates)
	--if not candidates then return end
	local formatters = candidates[repu_id] or candidates.default
	return formatters[type] or candidates.default[type] or ""
end

function get_formatter(repu_id, type)
	return _get_formatter(repu_id, type, cfg.formatters)
end

function get_inc_formatter(repu_id, type)
	return _get_formatter(repu_id, type, cfg.inc_formatters)
end

function get_league_formatter(repu_id, type)
	return _get_formatter(repu_id, type, cfg.league_formatters)
end

function get_league_inc_formatter(repu_id, type)
	return _get_formatter(repu_id, type, cfg.league_inc_formatters)
end

local function get_format_type(value)
	if value > 0 then return "get"
	elseif value < 0 then return "lose"
	else return nil end
end

local inc_type_suffix_map =
{
	[0] = "full_",
	[1] = "day_",
	[2] = "week_",
	[3] = "month_",
}
local function get_inc_repu_id(inc_type, id)
	local suffix = inc_type_suffix_map[inc_type] or ""
	if #suffix <= 0 then
		return ""
	end

	return suffix .. id
end

function _M:Format(repu_id, name, value)
	value = tonumber(value) or 0
	local format_type = get_format_type(value)
	if not format_type then return "" end

	local total = GameApi.GetHostRepuValue(repu_id) or 0

	local formatter = get_formatter(repu_id, format_type)
	local env =
	{
		name = name,
		point = math.abs(value),
		total = total,
	}

	return string.expand(formatter, env)
end

function _M:FormatInc(inc_type, id, value)
	value = tonumber(value) or 0
	local format_type = get_format_type(value)
	if not format_type then return "" end

	local repu_id = get_inc_repu_id(inc_type, id)
	local formatter = get_inc_formatter(repu_id, format_type)
	local env =
	{
		point = math.abs(value),
	}

	return string.expand(formatter, env)
end

function _M:FormatLeague(repu_id, name, value)
	value = tonumber(value) or 0
	local format_type = get_format_type(value)
	if not format_type then return "" end

	local total = GameApi.GetLeagueReputation(repu_id) or 0
	local league = GameApi.GetLeagueInfo().name;

	local formatter = get_league_formatter(repu_id, format_type)
	local env =
	{
		name = name,
		league = league,
		point = math.abs(value),
		total = total,
	}

	return string.expand(formatter, env)
end

function _M:FormatLeagueInc(inc_type, id, value)
	value = tonumber(value) or 0
	local format_type = get_format_type(value)
	if not format_type then return "" end

	local repu_id = get_inc_repu_id(inc_type, id)
	local formatter = get_league_inc_formatter(repu_id, format_type)
	local env =
	{
		point = math.abs(value),
	}

	return string.expand(formatter, env)
end
