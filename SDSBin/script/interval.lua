----------------------------------
-- 实现set_interval和set_timeout
----------------------------------
_interval = {}

local intervals = {}
local max_id = 0
local _need_remove_intervals = {}
local _need_add_intervals = {}

function _interval:DoTick(delta_time)
	for _,id in ipairs(_need_remove_intervals) do
		intervals[id] = nil
	end
	while #_need_add_intervals > 0 do
		local v = table.remove(_need_add_intervals)
		intervals[v.id] = v
	end
	while #_need_remove_intervals > 0 do
		table.remove(_need_remove_intervals)
	end	
	
	for id,v in pairs(intervals) do
		if type(id) == "number" then
			v.now = v.now + delta_time
			if v.now > v.interval then
				local success, msg = pcall(v.func, v.now)
				if not success then
					GlobalApi.Log(msg)
					clear_interval(id)
				end
				v.now = 0
			end
		end
	end
end

function _interval:ClearAll()
	intervals = {}
end

function set_interval(func, interval)
	if type(func) ~= "function" then return nil end
	interval = tonumber(interval) or 0
	
	local id = max_id + 1
	assert(not intervals[id])
	table.insert(_need_add_intervals, {id = id, func = func, interval = interval, now = 0})
	max_id = id
	return id
end

function clear_interval(id)
	id = tonumber(id) or 0
	if id > 0 and intervals[id] then
		table.insert(_need_remove_intervals, id)
	end
end

function set_timeout(func, delay)
	local id = 0
	id = set_interval(function()
		clear_interval(id)
		func()
	end, delay)
end
