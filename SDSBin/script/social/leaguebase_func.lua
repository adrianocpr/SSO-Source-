--require "lbase_collection"
local sandbox = require("sandbox")
module("League", package.seeall)

local cfg = sandbox.create_basic()

local function load_config()
	local success, err = cfg("script/social/lbase_collection.lua")
	if not success then
		console.error(err)
	end
	
	success, err = cfg("script/social/league_game_award.lua")
	if not success then
		console.error(err)
	end
	
end

load_config()

function League:GetLeagueBaseCollection(base_level)
    return cfg.lbase_collection[base_level]
end

function League:GetLeagueBaseMantainance(base_level)
    return cfg.lbase_collection[base_level].matainance_fee
end
function League:GetLeagueBaseWelfare(base_level)
    return cfg.lbase_collection[base_level].desc2,cfg.lbase_collection[base_level].desc3
end
function League:GetLeagueBaseDesc(base_level)
    return cfg.lbase_collection[base_level].desc
end
function League:GetLeagueGameAward()
    return cfg.league_game_award
end
