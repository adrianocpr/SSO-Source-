local print = print
local type = type
local pcall = pcall
local ipairs = ipairs
local pairs = pairs
local coroutine = coroutine
local table = table
local string = string
local tostring = tostring
local setmetatable = setmetatable
local getmetatable = getmetatable
local set_timeout = set_timeout
local console = console
local GameApi = GameApi
local GlobalApi = GlobalApi

module "chain"

_M._prototype = {}
_M._mt = {__index = _M._prototype}
_M.TYPE_KEY = {}

function _M.is_chain(t)
	return type(t) == "table" and t[_M.TYPE_KEY] == true
end

function _M:new(tasks, context)
	local o = {}
	o.context = context or {}
	setmetatable(o, self._mt)
	o[self.TYPE_KEY] = true

	for _,task in ipairs(tasks) do
		o:add(task)
	end
	
	o.finally = tasks.finally
	o:_init()
	return o
end

function _M._prototype:add(task)
	if not task then return end
	table.insert(self, self:_prepare_task(task))
end

function _M._prototype:_prepare_task(task)
	if _M.is_chain(task) then
		task = task:clone()
		for k,v in ipairs(task) do
    		task[k] = task:_prepare_task(v)
		end
		local f = type(task.finally) == "function" and task.finally or function() end
		local _self = self
		task.finally = function(self)
			local success, msg = pcall(f, self)
			if not success then
				console.error(msg)
			end
			_self:next()
		end
	end
	
	return task
end

function _M._prototype:_init()
	local _self = self
	self._co_func = function ()
		for _,v in ipairs(_self) do
			if _self.canceled then break end

			if _M.is_chain(v) then
				v.context = v.context or {}
				setmetatable(v.context, {__index = _self.context})
				v:start()
				if coroutine.status(v._co) ~= "dead" then
					if not coroutine.yield() then break end
				end
			elseif type(v) == "table" and type(v.run) == "function" then
				local success, msg = pcall(v.run, v, _self)
				if not success then
					console.error(msg)
					GlobalApi.Log(tostring(msg))
					if type(_self.onerror) == "function" then
						_self:onerror()
					end
					break
				end
				if not coroutine.yield() then break end
			elseif type(v) == "function" then
				local success, msg = pcall(v, _self)
				if not success then
					console.error(msg)
					GlobalApi.Log(tostring(msg))
					if type(_self.onerror) == "function" then
						_self:onerror()
					end
					break
				end
			end
		end
		
		if type(_self.finally) == "function" then
			_self:finally()
		end
	end
end

function _M._prototype:start()
	if not self._co or coroutine.status(self._co) == "dead" then
		self._co = coroutine.create(self._co_func)
	end
	self:next()
end

function _M._prototype:cancel()
	self.canceled = true
	if self._co then
		coroutine.resume(self._co, false)
	end
end

function _M._prototype:add(...)
	for _, task in ipairs(arg) do
		table.insert(self, self:_prepare_task(task))
	end
end

function _M._prototype:next()
	if self._co then
		coroutine.resume(self._co, true)
	end
end

function _M._prototype:clone()
	local o = {}
	for k,v in pairs(self) do
        o[k] = v
	end
	setmetatable(o, _M._mt)
	o:_init()
	return o
end