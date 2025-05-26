--------------------------------------------
-- Created by Fengbo
local sandbox = require("sandbox")
local setmetatable = setmetatable
local rawget = rawget
local _G = _G
local console = console

module("animation")

-- config load env of animation.lua
local cfg = sandbox.create_basic()

-- config load env of animation_env and animation_config.lua
local env = sandbox.create_full()

local animation = _M
setmetatable(_M, {__index = function(table, key)
	return rawget(_M, key) or rawget(env, key) or _G[key]
end})

----------------------------
-- 载入动画配置
local function load_config()
	local success, err = cfg("script/animation/animation.lua")
	if not success then 
		console.error(err)
		return
	end
	success, err = env("script/animation/animation_env.lua")
	if not success then 
		console.error(err)
		return
	end
	success, err = env("script/animation/animation_config.lua")
	if not success then 
		console.error(err)
		return
	end
	success, err = cfg("script/animation/animation_name_cfg.lua")
	if not success then 
		console.error(err)
		return
	end
end
load_config()

----------------------------
-- 获取动画配置
local ani_prof = 
{
	PROF_0	= "未知守护星座",
	PROF_1	= "候补生",
	PROF_2	= "天马",
	PROF_3	= "白鸟",
	PROF_4	= "天龙",
	PROF_5	= "仙女",
	PROF_6	= "凤凰",
	PROF_7	= "双子",
	PROF_8	= "守护星座7",
	PROF_9	= "守护星座8",
}
local function format_animation_path(config, series_index)
	if type(config) ~= "table" then return "" end
	if type(config.path) ~= "string" then return "" end

	local host = GameApi.GetHostPropEx()
	local prof = host.profession
	local gender = host.gender
	local body = GameApi.GetHostCustomizeInfo().body
	local series = series_index or 1

	local params =
	{
		prof = ani_prof["PROF_" .. prof],
		gender = gender == GENDER_MALE and "m" or "f",
		body = body,
		series = series,
	}

	return string.expand(config.path, params)
end

function animation:get_config(id)
	if type(self) ~= "table" then
		id = self
		self = animation
	end
	
	local config = CopyTable(cfg.animation[id] or {})
	config.path = format_animation_path(config)
	return config
end

function animation:get_series_path_list(id)
	if type(self) ~= "table" then
		id = self
		self = animation
	end
	
	local list = {}
	local raw_config = cfg.animation[id]
	if type(raw_config) ~= "table" then return list end
	if type(raw_config.series) ~= "table" then
		local path = format_animation_path(raw_config)
		table.insert(list, path or "")
		return list
	end

	local from = raw_config.series.from or 1
	local to = raw_config.series.to or 1
	for i = from, to do
		local path = format_animation_path(raw_config, i)
		table.insert(list, path or "")
	end

	return list
end

function animation:get_name_config(id)
	if type(self) ~= "table" then
		id = self
		self = animation
	end
	
	return CopyTable(cfg.animation_name_cfg[id] or {})
end

----------------------------
-- 一般情况下播放动画调用

function animation:play(id)
	if type(self) ~= "table" then
		id = self
		self = animation
	end
	
	local c = self:get_play_chain(id)
	self:commit_play_chain(c)
end

function animation:play_swf(path)
	if type(self) ~= "table" then
		path = self
		self = animation
	end

	local c = chain:new{
		prepare,
    	screen_fade_out(),
		load_swf(path),
		screen_fade_in(),
		finally = finally_clean
    }
    c:start()
end

local function get_chain_from(t, key, context)
	local conf = t[key] or {}
	if type(conf) == "function" then
		conf = conf()
	end
	if type(conf) ~= "table" then conf = {} end

	if #conf > 0 then
		if not conf.use_normal_stage then
			table.insert(conf, 1, prepare)
		end
		conf.finally = finally_clean
	end

	return chain:new(conf, context)
end

local task_queue = nil
function animation:commit_play_chain(play_chain)
	if task_queue then
		task_queue:add(play_chain)
	else
		task_queue = chain:new{
			play_chain,
			finally = function (chain)
				task_queue = nil
			end
		}
		task_queue:start()
	end
end

function animation:clear_queue()
	task_queue = nil
end

function animation:new_task(name, ...)
	if type(env[name]) ~= "function" then return end

	return env[name](unpack(arg))
end

---------------------------
-- 获得动画播放的play chain

function animation:get_play_chain(id)
	if type(self) ~= "table" then
		id = self
		self = animation
	end	
	if not cfg.animation[id] then return nil end
	
	local conf = env.play(id)
	table.insert(conf, 1, prepare)
	conf.finally = finally_clean
	return conf
end

function animation:get_play_chain_on_change_instance(instance_id, is_first_time)
	if type(self) ~= "table" then
		instance_id = self
		self = animation
	end
	
	if is_first_time and on_change_instance_first_time[instance_id] then
		return get_chain_from(on_change_instance_first_time, instance_id)
	end
	return get_chain_from(on_change_instance, instance_id)
end

function animation:get_play_chain_on_quest_deliver(task_id)
	if type(self) ~= "table" then
		task_id = self
		self = animation
	end
	
	return get_chain_from(on_quest_deliver, task_id, {
		task_id = task_id,
	})
end

function animation:get_play_chain_on_quest_award(task_id)
	if type(self) ~= "table" then
		task_id = self
		self = animation
	end
	
	local c = get_chain_from(on_quest_award, task_id, {
		task_id = task_id,
	})

	-- guarantee awrad() is called
	local _finally = c.finally
	c.finally = function(chain)
		env.award():run(chain)
		if type(_finally) == "function" then
			_finally(chain)
		end
	end

	return c
end

function animation:get_play_chain_on_quest_failed(task_id)
	if type(self) ~= "table" then
		task_id = self
		self = animation
	end
	
	return get_chain_from(on_quest_failed, task_id, {
		task_id = task_id,
	})
end

function animation:get_play_chain_on_use_item(item_id)
	if type(self) ~= "table" then
		item_id = self
		self = animation
	end
	
	return get_chain_from(on_use_item, item_id, {
		item_id = item_id,
	})
end

function animation:get_play_chain_on_gather_start(mine_id)
	if type(self) ~= "table" then
		mine_id = self
		self = animation
	end

	return get_chain_from(on_gather_start, mine_id, {
		mine_id = mine_id,
	})
end

function animation:get_play_chain_on_gather_success(mine_id)
	if type(self) ~= "table" then
		mine_id = self
		self = animation
	end

	return get_chain_from(on_gather_success, mine_id, {
		mine_id = mine_id,
	})
end