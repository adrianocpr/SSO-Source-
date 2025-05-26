module("league", package.seeall)

local cfg = {}
setmetatable(cfg, {__index = _G})

local function load_config()
	local chunk, err = LuaLoadFile("script/social/league_construction.lua")
	if chunk then
		setfenv(chunk, cfg)
    	local success, ret = pcall(chunk)
    	if not success then
    		console.error(ret)
    		return
    	end
	else
		console.error(ret)
	end
end
load_config()

local function get_repu(repu_id)
	local value = GameApi.GetLeagueReputation(repu_id) or 0
	if value < 0 then value = 0 end
	return value
end

function expand_string(str)
	if type(str) ~= "string" then return "" end
	
	local env =
	{
		npc = function(id)
			local pos = TemplPos:GetPos(id)
    	    if pos then
    			local link = DlgApiEx.GetRouteLinkText(id)
    			if link then
    			    return link
    			end
    		end
    		return GameApi.GetSenceObjName(id) or ""
		end
	}
	
	return string.expand(str, env)
end

function get_res_count()
	return #cfg.resources
end

function get_res_info(index)
	return cfg.resources[index]
end

function get_res_value(index)
	local info = get_res_info(index)
	local id = info and info.repu_id or -1
	return get_repu(id)
end

function get_level()
	return GameApi.GetLeagueInfo().level
end

function get_maintenance_level()
	return get_repu(cfg.maintenance_level_repu_id)
end

function get_res_max(index)
	local max_table = cfg.resource_max_cfg[index] or {}
	return max_table[get_maintenance_level()] or 0
end

function get_res_weekly_cost(index)
    local info = get_res_info(index)
    if (not info) or (not info.has_weekly_cost) then return 0 end
    
    local maintenance_level = get_maintenance_level()
	local cost_table = cfg.resource_weekly_cost_cfg[maintenance_level] or {}
	local cost_index = get_repu(cfg.cost_index_repu_id)
	return cost_table[cost_index] or 0
end

function get_building_cfg()
	return cfg.buildings
end

function get_building_count()
	return #cfg.buildings
end

function get_building_info(index)
	return cfg.buildings[index]
end

function get_building_level(index)
	local value = get_repu(cfg.buildings[index].repu_id)
	local maintenance_level = get_maintenance_level()
	if value > maintenance_level - 1 then
	    value = maintenance_level - 1
	end
	if value < 0 then return 0 end
		
	return value
end

function get_tech_level(building_index, tech_index)
	local info = get_building_info(building_index)
	if not info then return 0 end
	local tech = info.tech[tech_index]
	if not tech then return 0 end
	
	local building_level = get_building_level(building_index)
	local level = 0
	if type(tech.level) == "function" then
		return tech.level(building_level)
	elseif type(tech.level) == "table" then
		return tech.level[building_level] or 0
	else
		level = tonumber(tech.level) or 0
	end
	
	if level < 0 then level = 0 end
	return level
end

function get_tech_level_up_condition(building_index, tech_index)
	local info = get_building_info(building_index)
	if not info then return 0 end
	local tech = info.tech[tech_index]
	if not tech then return 0 end
	
	local next_level = get_tech_level(building_index, tech_index) + 1
	
	if type(tech.level_condition) == "function" then
		return tech.level_condition(next_level)
	elseif type(tech.level_condition) == "table" then
		return tech.level_condition[next_level] or 0
	else
		return ""
	end
end

function get_league_level_up_cfg(self,level)
    local cfg = league_level_up[level]
    if league_level_up[level] ~= nil then 
        return cfg.repu_0_cur_week,cfg.task_id
    end
end