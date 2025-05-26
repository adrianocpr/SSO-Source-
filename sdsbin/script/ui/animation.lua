local math = math
local setmetatable = setmetatable
local type = type
local pcall = pcall
local _G = _G
local DlgApi = DlgApi
local DlgApiEx = DlgApiEx
local GlobalApi = GlobalApi
local set_interval = set_interval
local clear_interval = clear_interval
local console = console
local ipairs = ipairs
local pairs = pairs

module "ani"
local ani = _M

ani.easing =
{
	linear = function( p, n, firstNum, diff )
		return firstNum + diff * p;
	end,
	
	swing = function( p, n, firstNum, diff )
		return ((-math.cos(p*math.pi)/2) + 0.5) * diff + firstNum;
	end,
}

local prototype = {}
ani.mt = {__index = prototype}

function ani:new(o)
	o = o or {}
	setmetatable(o, self.mt)
	o.interval_id = set_interval(function(time)
		o:tick(time)
	end)
	
	o.start_state = o.start_state or {}
	o.end_state = o.end_state or {}
	o.now_state = o.start_state
	
	o.duration = o.duration or 300
	o.delay = o.delay or 0
	o.now = 0
	
	if type(o.easing) == "string" then
		o.easing = ani.easing[o.easing] or ani.easing.swing
	elseif type(o.easing) ~= "function" then
		o.easing = ani.easing.swing
	end
	
	if type(o.oninit) == "function" then
		o:oninit()
	end
	
	if o.delay <= 0 then
		o:tick(0)
	end
	return o
end

function prototype:tick(time)
	self.now = self.now + time
	local is_end = false
	if self.now > self.duration + self.delay then
		is_end = true
		self.now = self.duration + self.delay
	end
	
	if type(self.now_state) == "number" then
		self:update()
	elseif type(self.now_state) == "table" then
		for k in pairs(self.now_state) do
			self:update(k)
		end
	end
	
	if type(self.onpopulate) == "function" then
		local success, msg = pcall(self.onpopulate, self, self.now_state)
		if not success then
		    console.error(msg)
			GlobalApi.Log(msg)
			self:stop()
		end
	end
	
	if is_end then
		self:stop()
	end
end

function prototype:update(prop)
	if self.now < self.delay then return end

	local now = self.now - self.delay
	local state = now / self.duration
	local pos = self.easing(state, now, 0, 1, self.duration)
	if prop ~= nil then
		self.now_state[prop] = self.start_state[prop] + ((self.end_state[prop]) - self.start_state[prop]) * pos
	else
		self.now_state = self.start_state + (self.end_state - self.start_state) * pos
	end
end

function prototype:stop()
	if not self.interval_id then return end
	
	clear_interval(self.interval_id)
	self.interval_id = nil
	
	if type(self.oncomplete) == "function" then
		self:oncomplete()
	end
	if type(self._oncomplete) == "function" then
		self:_oncomplete()
	end
end

function prototype:queue(o)
	self._oncomplete = function()
		ani:new(o)
	end
end

local function _trans_opt(opt)
	opt = opt or {}
	if type(opt) == "function" then
		opt = {oncomplete = opt}
	end
	return opt
end

ani.screen =
{
	fade_in = function(opt)
		opt = _trans_opt(opt)
		
		return ani:new{
			start_state = DlgApiEx.GetUIMaskAlpha(),
			end_state = 0,
			duration = opt.duration,
			delay = opt.delay,
			onpopulate = function(self, state)
				DlgApiEx.SetUIMaskAlpha(state)
			end,
			oncomplete = opt.oncomplete or function() end,
		}
	end,
	
	fade_out = function(opt)
		opt = _trans_opt(opt)
		
		return ani:new{
			start_state = DlgApiEx.GetUIMaskAlpha(),
			end_state = 255,
			duration = opt.duration,
			delay = opt.delay,
			onpopulate = function(self, state)
				DlgApiEx.SetUIMaskAlpha(state)
			end,
			oncomplete = opt.oncomplete or function() end,
		}
	end,
}

ani.dialog =
{
	fade_in = function(dlg_name, opt)
		opt = _trans_opt(opt)
		
		return ani:new{
			start_state = 0,
			end_state = 255,
			duration = opt.duration,
			delay = opt.delay,
			oninit = function()
				if opt.active_dlg then
					DlgApi.ShowDialog(dlg_name, true)
				else
					DlgApi.ShowDialog(dlg_name, true, false, false)
				end
			end,
			onpopulate = function(self, state)
				DlgApi.SetDialogAlpha(dlg_name, state)
				DlgApi.SetDialogWholeAlpha(dlg_name, state)
				if state >= self.end_state and opt.active_dlg then
					DlgApi.ShowDialog(dlg_name, true)
				end
			end,
			oncomplete = opt.oncomplete
		}
	end,
	
	fade_out = function(dlg_name, opt)
		opt = _trans_opt(opt)
		
		return ani:new{
			start_state = 255,
			end_state = 0,
			duration = opt.duration,
			delay = opt.delay,
			onpopulate = function(self, state)
				DlgApi.SetDialogAlpha(dlg_name, state)
				DlgApi.SetDialogWholeAlpha(dlg_name, state)
				if state <= self.end_state then
					DlgApi.ShowDialog(dlg_name, false)
					DlgApi.SetDialogAlpha(dlg_name, 255)
					DlgApi.SetDialogWholeAlpha(dlg_name, 255)
				end
			end,
			oncomplete = opt.oncomplete
		}
	end,
}

ani.object =
{
	fade_in = function(dlg_name, obj_name, opt)
		opt = _trans_opt(opt)
		
		return ani:new{
			start_state = 0,
			end_state = 255,
			duration = opt.duration,
			delay = opt.delay,
			oninit = function()
				DlgApi.ShowItem(dlg_name, obj_name, true)
			end,
			onpopulate = function(self, state)
				DlgApi.SetItemAlpha(dlg_name, obj_name, state)
			end,
			oncomplete = opt.oncomplete
		}
	end,
	
	fade_out = function(dlg_name, obj_name, opt)
		opt = _trans_opt(opt)
		
		return ani:new{
			start_state = 255,
			end_state = 0,
			duration = opt.duration,
			delay = opt.delay,
			onpopulate = function(self, state)
				DlgApi.SetItemAlpha(dlg_name, obj_name, state)
				if state <= self.end_state then
					DlgApi.ShowItem(dlg_name, obj_name, false)
					DlgApi.SetItemAlpha(dlg_name, obj_name, 255)
				end
			end,
			oncomplete = opt.oncomplete
		}
	end,
}
