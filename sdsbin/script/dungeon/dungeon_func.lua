local sandbox = require("sandbox")

module("dungeon", package.seeall)

local cfg = sandbox.create_basic()

local function load_config()
	local success, err = cfg("script/dungeon/custom_error_message.lua")
	if not success then
		console.error(err)
	end
end
load_config()

local function find_custom_message_config(code, tid, type)
	if not cfg.custom_message[tid] then return end
	if not cfg.custom_message[tid][type] then return end

	return cfg.custom_message[tid][type][code]
end

function _M:format_create_error(code, tid, data)
	local msg = find_custom_message_config(code, tid, "create")
	if not msg then
		return string.format(STRING_TABLE["INSTANCE_CREATE_RESULT" .. code] or "", data.name or "")
	end

	return string.expand(msg, data)
end

function _M:format_enter_error(code, tid, data)
	local msg = find_custom_message_config(code, tid, "enter")
	if not msg then
		return STRING_TABLE["INSTANCE_ENTER_RESULT" .. code] or ""
	end

	return string.expand(msg, data)
end