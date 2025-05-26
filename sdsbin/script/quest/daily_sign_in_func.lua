local sandbox = require("sandbox")

module("daily_sign_in", package.seeall)

local cfg = sandbox.create_basic()

local function init_award_config(config)
	for k, v in pairs(config) do
		if type(k) == "number" then
			stairs_table:setup(v, "floor")
		end
	end
end

local function load_config()
	local success, err = cfg("script/quest/daily_sign_in.lua")
	if not success then
		console.error(err)
	end
end
load_config()
init_award_config(cfg.newbee_award)
init_award_config(cfg.weekday_award)

-----------
-- 获得某天的奖励配置
-- @param day 0为今天，1为明天，2为后天，以此类推，不填默认为0
-- @param level 玩家等级，不填则自动取玩家自身等级
function _M:get_award(day, level)
	day = day or 0
	level = level or GameApi.GetHostProp().level

	local id = cfg.daily_sign_in_task_id
	local can_deliver = GameApi.CanDeliverTask(id)
	local finish_count = GameApi.GetTaskFinishedCount(id) + day
	local wday = GlobalApi.GetServerLocalTime().week - 1 + day
	wday = wday % 7

	if can_deliver then
		finish_count = finish_count + 1
	end

	local award = cfg.newbee_award[finish_count] or cfg.weekday_award[wday] or {}
	return award[level] or {}
end