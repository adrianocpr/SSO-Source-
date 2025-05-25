--require "league_territory_cfg"
local sandbox = require("sandbox")
module("League", package.seeall)

local cfg = sandbox.create_basic()

local function load_config()
	local success, err = cfg("script/social/league_territory_cfg.lua")
	if not success then
		console.error(err)
	end
	
end

load_config()

function League:GetTerritoryCfg(id)
	return cfg.league_territory_cfg[id] 
end

function League:GetTerritoryList()
	local list = {}
	for k,v in pairs(cfg.league_territory_cfg) do
		table.insert(list,v)
	end
	return list
end