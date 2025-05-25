local lpeg = require("lpeg")
local sandbox = require("sandbox")

module("line_info", package.seeall)

local cfg = sandbox.create_basic()

local function load_config()
	local success, err = cfg("script/config/line_info.lua")
	if not success then
		console.error(err)
	end
end
load_config()

function _M:get_line_info(map_id, line_id)
	local map_info = cfg.line_info[map_id]
	if type(map_info) == "string" then
		return string.expand(map_info, {line = line_id})
	elseif type(map_info) == "table" then
		return map_info[line_id]
	end
	return
end

local string_with_numbers_pattern = lpeg.P{
	"string_with_numbers",
	number = (lpeg.R'09' ^ 1) / tonumber,
	word = lpeg.C((1 - lpeg.R'09') ^ 1),
	string_with_numbers = lpeg.Ct((lpeg.V"number" + lpeg.V"word")^0),
}

local function compare_string_with_numbers(str1, str2)
	str1 = str1 or ""
	str2 = str2 or ""
	local s1 = string_with_numbers_pattern:match(str1)
	local s2 = string_with_numbers_pattern:match(str2)

	for i, v1 in ipairs(s1) do
		local v2 = s2[i]
		if not v2 then
			-- nil v2 is less than v1.
			return false 
		elseif v1 ~= v2 then
			return v1 < v2
		end
	end
	return false
end

function _M:get_line_list(map_id, original_list)
	local list = {}
	for _, line_id in ipairs(original_list) do
		local name = self:get_line_info(map_id, line_id)
		if name then
			local line_info = {}
			line_info.id = line_id
			line_info.name = name
			table.insert(list, line_info)
		end
	end

	table.sort(list, function(info1, info2)
		return compare_string_with_numbers(info1.name, info2.name)
	end)
	return list
end