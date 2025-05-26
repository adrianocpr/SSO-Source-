local sandbox = require("sandbox")
module("team_arena", package.seeall)

local cfg = sandbox.create_basic()

local function load_config()
	local success, err = cfg("script/social/team_arena_cfg.lua")
	if not success then
		console.error(err)
	end
end
load_config()


function team_arena:GetTeamArenaCfg(id)
	return cfg.team_arena_cfg[id]
end