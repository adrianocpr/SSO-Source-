---------------------------------------------------------------
--  created:   2012.10.17
--  author:    chenfudun
--
--  任务管理相关接口
---------------------------------------------------------------
local sandbox = require("sandbox")
local pe = require("config.post_effect")
local DlgApi	  = DlgApi
local GameApi	  = GameApi
local DlgTemplate = DlgTemplate
local Format 	  = string.format
local MAX_AVAILABLE_QUEST_COUNT = 50

local config = sandbox.create_full()

function load_config()
	local success, err = config("script/quest/quest_trace_filter.lua")
	if not success then
		console.error(err)
	end
	success, err = config("script/quest/additional_trace.lua")
	if not success then
		console.error(err)
	end
	success, err = config("script/quest/quest_post_effect.lua")
	if not success then
		console.error(err)
	end
end
load_config()

QuestMan = {}

function QuestMan:GetAvailableQuests()
	local list = GameApi.GetSearchableTaskList()
	local host_level = GameApi.GetHostProp().level
	local available = {}
	local info_map = {}
	for _,id in ipairs(list) do
		if GameApi.CanDeliverTask(id) then
			table.insert(available, id)
			
			local _,_,suitable_level = GameApi.GetTaskLevelReq(id)
			local is_main_task = GameApi.GetTaskType(id) == 1
			suitable_level = suitable_level or 0
			info_map[id] = info_map[id] or {}
			info_map[id].delta_level = math.abs(host_level - suitable_level)
			info_map[id].star = GameApi.GetTaskStar(id)
			info_map[id].priority = is_main_task and 1 or 0
		end
	end
	
	table.sort(available, function(a, b)
		local info1 = info_map[a]
		local info2 = info_map[b]
	
		if info1.priority ~= info2.priority then
			return info1.priority > info2.priority
		else
			if info1.delta_level ~= info2.delta_level then
				return info1.delta_level < info2.delta_level
			else
				return info1.star > info2.star
			end
		end
	end)

	if #available > MAX_AVAILABLE_QUEST_COUNT then
		for i = #available, MAX_AVAILABLE_QUEST_COUNT + 1, -1 do
			table.remove(available, i)
		end
	end
	return available
end

local quality_color_map = {}
function QuestMan:GetQualityColor(quality)
	if type(quality) ~= "number" then return end

	local color = quality_color_map[quality]
	if not color then
		local key = "QUALITY_COLOR_" .. quality
		color = _G[key]
		if type(color) == "number" then
			quality_color_map[quality] = color
		else
			color = nil
		end
	end

	return color
end

function QuestMan:FilterByMap(map_id, task_id)
	local filter_by_map_cfg = config.filter_by_map or {}
	local cfg = filter_by_map_cfg[map_id]
	if not cfg then return true end

	if type(cfg.cache) ~= "table" then
		cfg.cache = {}
		for _, v in ipairs(cfg) do
			cfg.cache[v] = true
		end
	end

	return cfg.cache[task_id] and true or false
end

local function evaluate_additional_trace(id, trace_item)
	if type(trace_item) ~= "table" then return end
	local variable = nil
	if type(trace_item.variable) == "function" then
		local success, ret = pcall(trace_item.variable, trace_item)
		if not success then
			console.error(ret)
			return
		end
		variable = ret
	else
		variable = trace_item.variable
	end

	if variable == nil then return end

	local trace = trace_item.trace or {}
	local entries = trace[variable] or trace.default
	if type(entries) ~= "table" then return end
	
	local result = {}
	for _, v in ipairs(entries) do
		table.insert(result, format_string:parse(v))
	end
	result.id = id
	result.name = format_string:parse(trace_item.name) or ""
	result.quality = trace_item.quality or 0
	result.category = trace_item.category or ""

	local color = QuestMan:GetQualityColor(result.quality)
	if color then
		result.name = string.format("^%6x", color) .. result.name
	end

	return result
end

function QuestMan:GetAdditionalTrace()
	local additional_trace = config.additional_trace or {}
	local result = {}
	for i, v in ipairs(additional_trace) do
		local id = v.id or i
		local trace = evaluate_additional_trace(id, v)
		if trace and #trace > 0 then
			table.insert(result, trace)
		end
	end

	return result
end

local function check_post_effect(entry)
	local any_condition = false 

	if type(entry.buff) == "number" then
		any_condition = true
		local buff_level = GameApi.GetHostBuffLevel(entry.buff) or -1
		if buff_level <= 0 then
			return false
		end
	end
	if type(entry.repu_id) == "number" then
		any_condition = true
		local repu = GameApi.GetHostRepuValue(entry.repu_id)
		if repu ~= entry.repu_value then
			return false
		end
	end
	if type(entry.func) == "function" then
		any_condition = true
		local success, ret = pcall(entry.func)
		if not success or not ret then
			return false
		end
	end

	return any_condition
end

function QuestMan:UpdatePostEffect()
	local found = false
	for _, v in ipairs(config.post_effect or {}) do
		if check_post_effect(v) then
			found = true
			local effect_name = v[1]
			local effect = pe.get(effect_name)
			if effect then
				GameApi.SetAdditionalPostEffect(effect)
			end
			break
		end
	end

	if not found then
		GameApi.ClearAdditionalPostEffect()
	end
end