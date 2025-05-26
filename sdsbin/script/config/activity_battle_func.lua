local sandbox = require("sandbox")
module("activity_battle", package.seeall)

local cfg = sandbox.create_full()
local function load_config()
	local success, err = cfg("script/config/activity_battle_cfg.lua")
	if not success then
		console.error(err)
	end
end
load_config()

function get_all_cfgs()
	return cfg.activity_battle_cfg or {}
end

function get_guide()
	return cfg.activity_battle_ins or {}
end

