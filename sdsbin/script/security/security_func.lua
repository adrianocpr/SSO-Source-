local sandbox = require("sandbox")

module("Security", package.seeall)

local cfg = sandbox.create_basic()

local function load_config()
	local success, err = cfg("script/security/security_cfg.lua")
	if not success then
		console.error(err)
	end
end

load_config()

function Security:get_dangerous_module()
	return cfg.dangurous_module
end