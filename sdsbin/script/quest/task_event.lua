task = task or {}

task.deliver_handlers =  --接受任务时触发
{}

task.finish_handlers =  --任务达成完成条件时触发
{}

task.award_handlers =  --成功完成任务时触发
{}

local TASK_SCRIPTS_PATH = "script/quest/tasks/"

task._router = {
	_set = function(tid, o)
		if type(tid) ~= "number" then return end
		local old = task._router[tid]
		if type(old) == "table" then
			local msg = string.format("ScriptTask Warnning: task %d has duplicated script handlers!!", tid)
      console.error(msg)
      if type(old.priority) == "number" and old.priority >= o.priority then
      	return
      end
    end
    task._router[tid] = o
	end
}

local prototype = {
	custom_name = function(tid, orignal_name) end,
	custom_award = function(tid, orignal_award) end,
	can_deliver = function(tid) return 0 end, 
	on_deliver = function(tid) end, 
	on_award = function(tid) end,
	on_failed = function(tid) end,
}

task._mt = {__index = protptype}

function task:new(tid, ...)
  local o = {}
  setmetatable(o, self._mt)
  
	if type(tid) == "table" then
		local from = tid.from or 0
    local to = tid.to or 0
    if from > 0 and to > 0 then
    	tid = {tid}
    end
	else
		tid = {tid}
	end
	
	o.priority = type(tid) == "number" and 1 or 0

	for _, v in ipairs(arg) do
		table.insert(tid, v)
	end
  for _, v in ipairs(tid) do
    if type(v) == "number" then
      self._router._set(v, o)
    elseif type(v) == "table" then
      local from = v.from or 0
      local to = v.to or 0
      if from > 0 and to > 0 then
        for i = from,to do
          self._router._set(i, o)
        end
      end
    end
  end
  return o
end

local dynamic_loaded = {}
local function dynamic_load(tid)
	if dynamic_loaded[tid] ~= nil then return end
    
  local path = string.format(TASK_SCRIPTS_PATH .. "task%d.lua", tid)
  local chunk, err = LuaLoadFile(path)
  if chunk then
    local env = {_TASK_ID = tid}
    setmetatable(env, {__index = _G})
    setfenv(chunk, env)
    local success, err = pcall(chunk)
    dynamic_loaded[tid] = success ~= false
    if not success then
      console.info("Dynamic load failed: " .. err)
    end
  else
  	--console.info(err, "cccccc")
  	--local msg = string.format("Task %s load failed, ignored", path)
    --console.info(msg, "cccccc")
    dynamic_loaded[tid] = false
  end
end

local function preload()
	local path = TASK_SCRIPTS_PATH .. "preload.lua"
	local chunk, err = LuaLoadFile(path)
	if chunk then
		local env = {}
		setfenv(chunk, env)
		local success, list = pcall(chunk)
		if success and type(list) == "table" then
			for _, v in ipairs(list) do
				path = TASK_SCRIPTS_PATH .. v
				local success, err = pcall(dofile, path)
				if not success then
					console.error(err)
				end
			end
		end
	end
end
preload()

--------------------------
--- Called by c++
function task:GetCustomName( tid, orignal_name )
	dynamic_load(tid)
	local t = self._router[tid]
	if type(t) == "table" then
		local name = nil
		if type(t.custom_name) == "function" then
			name = t.custom_name(orignal_name)
		elseif type(t.custom_name) == "string" then
			name = t.custom_name
		end
		return name
	end
end

function task:GetCustomAwardInfo( tid, orignal_award )
	dynamic_load(tid)
	local t = self._router[tid]
	if type(t) == "table" then
		local award = nil
		if type(t.custom_award) == "function" then
			award = t.custom_award(orignal_award)
		elseif type(t.custom_award) == "table" then
			award = t.custom_award
		end
		return award
	end
end

function task:CanDeliver( tid )
	dynamic_load(tid)
	local t = self._router[tid]
	if type(t) == "table" and type(t.CanDeliver) == "function" then
		return t.CanDeliver(tid)
	end
	return 0
end

function task:OnDeliver( tid )
	dynamic_load(tid)
	local t = self._router[tid]
	if type(t) == "table" and type(t.on_deliver) == "function" then
		t.on_deliver(tid)
	end
	if type(self.deliver_handlers[tid]) == "function" then
		self.deliver_handlers[tid](tid)
	end
	
	-- 播放动画
	local play_chain = animation:get_play_chain_on_quest_deliver(tid) 
	if #play_chain > 0 then
		animation:commit_play_chain(play_chain)
	end
end

function task:OnFinish( tid )
	dynamic_load(tid)
	local t = self._router[tid]
	if type(t) == "table" and type(t.on_finish) == "function" then
		t.on_finish(tid)
	end
	if type(self.finish_handlers[tid]) == "function" then
		self.finish_handlers[tid](tid)
	end
end

function task:OnAward( tid, success )
	dynamic_load(tid)
	local t = self._router[tid]
	if type(t) == "table" then
		if success and type(t.on_award) == "function" then
			t.on_award(tid, success)
		elseif not success and type(t.on_failed) == "function" then
			t.on_failed(tid)
		end
	end
	if type(self.award_handlers[tid]) == "function" then
		self.award_handlers[tid](tid, success)
	end
	
	-- 播放动画
	local play_chain = success and animation:get_play_chain_on_quest_award(tid) 
		or animation:get_play_chain_on_quest_failed(tid)
	
	if #play_chain > 0 then
		animation:commit_play_chain(play_chain)
	elseif success then
		-- guarantee quest award.
		GameApi.TaskNotifyServerAward(tid)
	end
end

