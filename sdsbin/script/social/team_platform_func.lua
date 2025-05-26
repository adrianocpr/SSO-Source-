---------------------------------------------------------------
--	@description 组队平台API
--  @author feng bo
---------------------------------------------------------------
local sandbox = require("sandbox")
module("team_platform", package.seeall)



CATEGORY_DUNGEON = 0
CATEGORY_ACTIVITY = 1

local api = GameApi

local CATEGORY_MAP =
{
	[CATEGORY_DUNGEON] = "dungeons",
	[CATEGORY_ACTIVITY] = "activities",
}

local cfg = sandbox.create_basic()

local function _init_defaults()
	for _, cat in pairs(CATEGORY_MAP) do
		for _, conf in pairs(cfg[cat]) do
			conf.max_count = conf.max_count or 6
		end
	end
end

local function load_config()
	local success, err = cfg("script/social/team_platform.lua")
	if not success then
		console.error(err)
	else
		_init_defaults()
	end
end
load_config()

function get_all_configs()
	return cfg
end


--- 获取组队平台配置
-- @usage 组队平台配置参见social/team_platform.lua
-- @param category 组队平台配置类型，需要是 team_platform.CATEGORY_DUNGEON 或 team_platform.CATEGORY_ACTIVITY
-- @param tid 组队平台配置的tid
-- @return 组队平台配置的table
function get_config(category, tid)
	local cat = CATEGORY_MAP[category]
	if not cat then return end

	return cfg[cat][tid]
end


--- 玩家是否组队
-- @return true/false, 是否组队
function has_team()
	return api.HasTeam()
end


--- 玩家是否是队长
-- @return true/false, 是否是队长
function is_team_leader()
	return api.IsTeamLeader()
end


--- 玩家是否组团
-- @return true/false, 是否组团
function has_raid()
	return api.HasRaid()
end


--- 玩家是否是团长
-- @return true/false, 是否是团长
function is_raid_leader()
	return api.IsRaidLeader()
end


--- 在组队平台排入队列
-- @param category 组队平台配置类型，需要是 team_platform.CATEGORY_DUNGEON 或 team_platform.CATEGORY_ACTIVITY
-- @param tid 组队平台配置的tid
-- @param is_team 是否队伍排队
function register(category, tid, is_team)
	if is_team == nil then is_team = true end

	local conf = get_config(category, tid)
	if not conf then return end

	return api.TeamPlatformRegister(category, tid, is_team)
end


--- 在组队平台退出队列
-- @param category 组队平台配置类型，需要是 team_platform.CATEGORY_DUNGEON 或 team_platform.CATEGORY_ACTIVITY
-- @param tid 组队平台配置的tid
function quit(category, tid)
	local conf = get_config(category, tid)
	if not conf then return end
	
	return api.TeamPlatformQuit(category, tid)
end


--- 获得某个队列的状态
-- @param category 组队平台配置类型，需要是 team_platform.CATEGORY_DUNGEON 或 team_platform.CATEGORY_ACTIVITY
-- @param tid 组队平台配置的tid
-- @return 返回值是下列字符串中的一个
-- <pre>
--		"disabled"		目前状态下排队禁用（例如，已经在副本中）
--		"not_found"		未找到相应的配置
--		"available"		可以排队
--		"registered"		已排队（个人）
--		"team_registered"	已排队（队伍）
--		"unavailable"		因为某种原因不能排队（等级、时间、次数等因素）
-- </pre>
function get_state(category, tid)
	local conf = get_config(category, tid)
	if not conf then return "not_found" end
	
	return api.TeamPlatformGetQueueState(category, tid) or "not_found"
end

--- 获得某个队列的计数信息
-- @param category 组队平台配置类型，需要是 team_platform.CATEGORY_DUNGEON 或 team_platform.CATEGORY_ACTIVITY
-- @param tid 组队平台配置的tid
-- @return 返回值有两个: current, max
function get_counter(category, tid)
	local conf = get_config(category, tid)
	if not conf then return end

	return api.TeamPlatformGetQueueCounter(category, tid)
end

--- 获得活动或者任务的每日限次时间
-- @param category 组队平台配置类型，需要是 team_platform.CATEGORY_DUNGEON 或 team_platform.CATEGORY_ACTIVITY
-- @param tid 组队平台配置的tid
-- @return 返回值: 以秒表示的重置时间点
function get_daily_counter_max_reset_time(category, tid)
	local conf = get_config(category, tid)
	if not conf then return end

	return api.TeamPlatformGetDailyCounterMaxResetTime(category, tid)
end