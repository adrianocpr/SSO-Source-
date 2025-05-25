local sandbox = require("sandbox")

module("features", package.seeall)

local cfg = sandbox.create_basic()

local feature_map = {}

local function load_config()
	local success, err = cfg("script/config/features.lua")
	if not success then 
		console.error(err)
		return
	end

	for _, v in ipairs(cfg.features) do
		feature_map[v] = true
	end
end
load_config()

function _M:is_enabled(name)
	return feature_map[name] and true or false
end

function _M:get_list()
	return cfg.features or {}
end