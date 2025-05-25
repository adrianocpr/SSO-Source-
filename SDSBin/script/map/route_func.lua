local sandbox = require("sandbox")

module("route", package.seeall)

local LEAGUE_BASE = -1

local pos_cfg = sandbox.create_basic({
	LEAGUE_BASE = LEAGUE_BASE
})

local route_island_cfg = {}

local ROUTE_IN_SAME_MAP_USE_TELEPORTER_FACTOR = 1.1

---------------------------
-- 配置文件准备工作
local function load_config()
	local success, err = pos_cfg("script/map/TemplPos.lua")
	if not success then
		console.error(err)
	end

	local box = sandbox.create_basic()
	local success, err = box("script/map/route_island.lua")
	if not success then
		console.error(err)
	else
		route_island_cfg = box.route_island
	end
end
load_config()

local function square_dist(pos1, pos2)
	local dx = pos1.x - pos2.x
	local dy = pos1.y - pos2.y
	local dz = pos1.z - pos2.z
	return dx*dx + dy*dy + dz*dz
end

local function square_dist_h(pos1, pos2)
	local dx = pos1.x - pos2.x
	local dz = pos1.z - pos2.z
	return dx*dx + dz*dz
end

local function dist(pos1, pos2)
	return math.sqrt(square_dist(pos1, pos2))
end

local function dist_h(pos1, pos2)
	return math.sqrt(square_dist_h(pos1, pos2))
end

local function calc_path_length(start_pos, end_pos)
	local _, _, _, host_map_id = GameApi.GetHostPos()
	if start_pos.mapId ~= end_pos.mapId or start_pos.mapId ~= host_map_id then
		return math.huge
	end

	return GameApi.CalcPathLength(start_pos, end_pos)
end

local function safe_calc_path_length(start_pos, end_pos)
	local len = calc_path_length(start_pos, end_pos)
	if type(len) ~= "number" then
		return math.huge
	end
	return len 
end

local function clone_table(t)
	if type(t) ~= "table" then
		return t
	end
	
	local o = {}
	for k, v in pairs(t) do
		if type(v) == "table" then
			o[k] = clone_table(v)
		else
			o[k] = v
		end
	end
	return o
end

local function table_insert_all(dest, src)
	for _, v in ipairs(src) do
		table.insert(dest, v)
	end
end

local function init_area(area)
	if type(area) ~= "table" then return end
	
	if not area.x and #area >= 1 then
		-- 计算区域中心点
		area.x = 0
		area.y = 0
		area.z = 0
		for i, pos in ipairs(area) do
			area.x = area.x + pos.x
			area.y = area.y + pos.y
			area.z = area.z + pos.z
		end
		area.x = area.x / #area
		area.y = area.y / #area
		area.z = area.z / #area
		
		area.mapId = area.mapId or area[1].mapId
	end
	
	if not area.r then
		-- 计算区域半径
		area.r = 0
		for i, pos in ipairs(area) do
			local dist = dist(area, pos)
			if area.r < dist then
				area.r = dist
			end
		end
	end
	
end

local function init_pos_pos_cfg()
	for id, areas in pairs(pos_cfg.TemplPos) do
		for _, area in ipairs(areas) do
			init_area(area)
		end
	end
end
init_pos_pos_cfg()

--[[ 数据在初始化后将呈现为以下结构：
common_telepoters=
{
	[mapId] = {
		{x=1, y=1, z=1, mapId=1, npcId=100, teleportCfgId=10994}, -- pos1
		{x=1, y=1, z=1, mapId=1, npcId=200, teleportCfgId=10995}, -- pos2
		...
	},
	...
}

limited_telepoters =
{
	src_map = {
		[mapId] = { -- 该地图有哪些传送NPC
			{
				x=1, y=1, z=1, mapId=1, npcId=100, 
				destPos = 
				{
					{mapId=1, x=1, y=1, z=1},
					{mapId=2, x=1, y=1, z=1},
				}
			}, -- pos1, 该NPC可传送玩家至地图1,2
			{
				x=1, y=1, z=1, mapId=1, npcId=200, 
				destPos =
				{
					{mapId=3, x=1, y=1, z=1},
					{mapId=4, x=1, y=1, z=1},
				}
			}, -- pos2, 该NPC可传送玩家至地图3,4
			...
		},
		...
	},
	
	dest_map = {
		[mapId] = { -- 可以传送到该地图的NPC有哪些
			{x=1, y=1, z=1, mapId=1, npcId=100}, -- pos1
			{x=1, y=1, z=1, mapId=1, npcId=200}, -- pos2
			...
		},
		...
	},

	npc_map = {
		[npcId] = { -- NPC可以传送到哪些位置
			{x=1, y=1, z=1, mapId=1, npcId=100}, -- pos1
			{x=1, y=1, z=1, mapId=1, npcId=200}, -- pos2
			...
		},
	}
}

--]]
common_telepoters = {}
limited_telepoters = {
	src_map = {},
	dest_map = {},
	npc_map = {},
}

local function init_teleporters()
	for npc_id, teleport_id in pairs(pos_cfg.CommonTeleporterCfg) do
		for _, pos in ipairs(pos_cfg.TemplPos[npc_id] or {}) do
			common_telepoters[pos.mapId] = common_telepoters[pos.mapId] or {}
			local t = common_telepoters[pos.mapId]
			local clone = clone_table(pos)
			clone.npcId = npc_id
			clone.teleportCfgId = teleport_id
			table.insert(t, clone)
		end
	end
	
	for id, dest_pos in pairs(pos_cfg.LimitedTeleporterCfg) do
		local dest_pos_list = {}
		for _, pos in ipairs(dest_pos) do
			if type(pos) == "number" then
				table.insert(dest_pos_list, {mapId = pos, x = 0, y = 0, z = 0, npcId = id})
			elseif type(pos) == "table" then
				local clone = clone_table(pos)
				clone.npcId = id
				table.insert(dest_pos_list, clone)
			end
		end

		for _, pos in ipairs(pos_cfg.TemplPos[id] or {}) do
			limited_telepoters.src_map[pos.mapId] = limited_telepoters.src_map[pos.mapId] or {}
			local t = limited_telepoters.src_map[pos.mapId]
			local clone = clone_table(pos)
			clone.npcId = id
			clone.destPos = dest_pos_list
			table.insert(t, clone)
		end
		
		for _, dest_pos in ipairs(dest_pos_list) do
			local dest_map_id = dest_pos.mapId
			limited_telepoters.dest_map[dest_map_id] = limited_telepoters.dest_map[dest_map_id] or {}
			local t = limited_telepoters.dest_map[dest_map_id]
			for _, pos in ipairs(pos_cfg.TemplPos[id] or {}) do
				local clone = clone_table(pos)
				clone.npcId = id
				table.insert(t, clone)
			end
		end

		limited_telepoters.npc_map[id] = dest_pos_list
	end
end
init_teleporters()

---------------------------
-- 功能接口

local function get_player_pos()
	local pos = {}
	pos.x, pos.y, pos.z, pos.mapId = GameApi.GetHostPos()
	return pos
end

function _M:is_available(id)
	return pos_cfg.TemplPos[id] and true or false
end

function _M:get_first_pos(id)
	local areas = pos_cfg.TemplPos[id] or {}
	return areas[1]
end

function _M:get_templ_pos(iTempId, iInstanceId)
	firstRoutePos = self:get_first_pos(iTempId)
	if firstRoutePos then
		if firstRoutePos.mapId == iInstanceId then
			return firstRoutePos
		end
	end

	return nil
end

function _M:get_nearest_area(src_pos, dest_area_list)
	local result = nil
	local min_dist = math.huge
	local dest_area_list = dest_area_list or {}
	local mode_2d = src_pos.y == 0
	local dist_func = mode_2d and square_dist_h or square_dist
	
	for _, area in ipairs(dest_area_list) do
		if src_pos.mapId == area.mapId then
			local dist = dist_func(src_pos, area)
			if dist < min_dist then
				min_dist = dist
				result = area
			end
		end
	end
	return clone_table(result)
end

function _M:get_island_cfg(pos)
	local precinct_info = GameApi.GetPrecinctInfo(pos)
	if not precinct_info then return end

	local map_id = pos.mapId
	local map_table = route_island_cfg[map_id] or {}
	local cfg = map_table[precinct_info.id]
	if type(cfg) ~= "table" then return end

	return cfg
end

function _M:is_telepoter_actived(teleport_id)
	return GameApi.IsTeleportPointActivated(teleport_id)
end

function _M:get_nearest_teleporter(src_pos, teleporter_list)
	local result = nil
	local min_dist = math.huge
	local teleporter_list = teleporter_list or {}
	local mode_2d = src_pos.y == 0
	local dist_func = mode_2d and square_dist_h or square_dist
	
	for _, area in ipairs(teleporter_list) do
		if src_pos.mapId == area.mapId and 
			self:is_telepoter_actived(area.teleportCfgId) then
			local dist = dist_func(src_pos, area)
			if dist < min_dist then
				min_dist = dist
				result = area
			end
		end
	end
	return clone_table(result)
end

function _M:get_area(id, src_pos)
	src_pos = src_pos or get_player_pos()
	
	return self:get_nearest_area(src_pos, pos_cfg.TemplPos[id] or {})
end

local function route_across_map(src, dest)
	if not common_telepoters[src.mapId] then
		if not limited_telepoters.src_map[src.mapId] then return nil end
		local area = _M:get_nearest_area(src, limited_telepoters.src_map[src.mapId])
		if area ~= nil then
			local teleport_dest = clone_table(area.destPos[1])
			teleport_dest.action = "teleport_manually"
			return area, teleport_dest
		end
	else
		if common_telepoters[dest.mapId] then 
			local area = _M:get_nearest_teleporter(src, common_telepoters[src.mapId])
			if not area then return end
			local teleport_dest = _M:get_nearest_teleporter(dest, common_telepoters[dest.mapId])
			if not teleport_dest then return end

			teleport_dest.action = "teleport"
			return area, teleport_dest
		else
			if not limited_telepoters.dest_map[dest.mapId] then return nil end
			local area = limited_telepoters.dest_map[dest.mapId][1]
			if area ~= nil then
				if src.mapId == area.mapId then
					local npcId = area.npcId
					local teleport_dest = clone_table(limited_telepoters.npc_map[npcId][1])
					teleport_dest.action = "teleport_manually"
					return area, teleport_dest
				end
				return next_route_node(src, area)
			end
		end
	end
	return nil
end

local function check_island_in_same_map(src, dest)
	local direct_check = calc_path_length(src, dest)
	local direct_dist = math.huge
	if type(direct_check) == "number" then
		direct_dist = direct_check
		direct_check = "success"
	end

	if direct_check == "unreachable" then
		local dest_island = _M:get_island_cfg(dest)
		local src_island = _M:get_island_cfg(src)

		if dest_island ~= src_island then
			local dest_island_enter = dest_island and dest_island.enter
			local src_island_exit = src_island and src_island.exit
			
			if dest_island_enter and src_island_exit then
				local pos = clone_table(src_island.exit)
				pos.mapId = dest.mapId
				return src, pos
			elseif dest_island_enter then
				local pos = clone_table(dest_island.enter)
				pos.mapId = dest.mapId
				return src, pos
			elseif src_island_exit then
				local pos = clone_table(src_island.exit)
				pos.mapId = dest.mapId
				return src, pos
			end
		end
	end

	return src, dest
end

local function route_in_same_map(src, dest)
	src, dest = check_island_in_same_map(src, dest)
	local mapId = src.mapId
	local teleporter_near_src = _M:get_nearest_teleporter(src, common_telepoters[mapId])
	local teleporter_near_dest = _M:get_nearest_teleporter(dest, common_telepoters[mapId])
	
	if not teleporter_near_src or not teleporter_near_dest then
		return dest
	end

	if teleporter_near_src.teleportCfgId == teleporter_near_dest.teleportCfgId then
		-- same teleporter, go to dest directly
		return dest
	end

	local direct_dist = safe_calc_path_length(src, dest)
	local teleport_dist = safe_calc_path_length(src, teleporter_near_src) + safe_calc_path_length(dest, teleporter_near_dest)

	if teleport_dist * ROUTE_IN_SAME_MAP_USE_TELEPORTER_FACTOR < direct_dist then
		teleporter_near_dest.action = "teleport"
		return teleporter_near_src, teleporter_near_dest, dest
	end
	return dest
end

local function next_route_node(src, dest)
	if src.mapId == dest.mapId then
		return route_in_same_map(src, dest)
	else
		return route_across_map(src, dest)
	end
end

function _M:search(src, dest)
	local result = {}
	
	if type(dest) == "table" then
		-- assume dest is a pos: {x=?, y=?, z=?, mapId=?, npcId=?}
		src = clone_table(src)
		local nodes = {}
		repeat
			nodes = {next_route_node(src, dest)}
			if #nodes > 0 then
				table_insert_all(result, nodes)
				src = clone_table(result[#result])
			end
		until #nodes <= 0 or nodes[1].mapId == dest.mapId
		-- if dest is not reachable, return an empty table
		if #nodes <= 0 then result = {} end
	elseif type(dest) == "number" then
		-- dest is a templ id
		local id = dest
		for _, area in ipairs(pos_cfg.TemplPos[id] or {}) do
			area = clone_table(area)
			area.npcId = id
			local ret = self:search(src, area) or {}
			if #ret > 0 and (#result <= 0 or #ret < #result) then
				result = ret
			end
		end
	end
	
	return result
end

---------------------------
-- Aliases

_G.TemplPos = {}

function _G.TemplPos:GetPos(templ_id)
	return _M:get_first_pos(templ_id)
end