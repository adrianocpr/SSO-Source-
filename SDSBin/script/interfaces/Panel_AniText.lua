Panel_AniText = ui.dialog.get("Panel_AniText")

local dlg = Panel_AniText

local LINE_HEIGHT = 50
local ESC_RIGHT_MARGIN = 17
local ESC_BLINK_INTERVAL = 2000

local labels = ui.obj_group:new()
local bg = dlg:get_obj("Edit_Image")
local esc = dlg:get_obj("Label_Esc")

local function iter()
	local i = 0
	return function()
		i = i + 1
		return dlg:get_obj("Label_" .. i)
	end
end

for obj in iter() do
	table.insert(labels.objs, obj)
end

function dlg:Init()
	self:resize()
	self:register_event(WM_KEYDOWN, self.on_key_down)
end

function dlg:on_key_down(item, key, ...)
	console.info(key)
	if key == VK_ESCAPE then
		self:stop()
	end
end

function dlg:ShowDialog()
	self:resize()	
end

local function obj_fade_in(obj, duration)
	return {
		run = function(self, chain)
			ani.object.fade_in(obj.dialog_name, obj.name, {
				duration = duration,
				oncomplete = function()
					chain:next()
				end
			})
		end
	}
end
	
function dlg:show_text(texts, oncomplete)
	self.data =	{
		texts = texts or {},
		oncomplete = oncomplete
	}
	local can_esc = true
	if type(texts.can_esc) == "boolean" then
		can_esc = texts.can_esc
	end

	if #texts <= 0 then 
		self:stop()
		return 
	end
	
	local line_duration = nil
	if type(texts.duration) == "number" and texts.duration > 0 then
	    line_duration = texts.duration / #texts
	end
	
	self:show(true, false, false)
	for i, obj in ipairs(labels.objs) do
		obj:hide()
		obj:set_text(i <= #texts and texts[i] or "")
	end
	self:layout()

	ani.object.fade_in(bg.dialog_name, bg.name, {
		duration = 300,
	})
	esc:show(can_esc)
	if can_esc then
		self:start_esc_blink()
	end
	
	local chain_tasks = {
		finally = function()
			self:stop()
		end
	}
	
	for i, obj in ipairs(labels.objs) do
		if i <= #texts then
			table.insert(chain_tasks, obj_fade_in(obj, line_duration))
		end
	end
	
	chain:new(chain_tasks):start()
	self.data.chain_tasks = chain_tasks
end

function dlg:stop(instantly)
	if self.data and chain.is_chain(self.data.chain_tasks) then
		self.data.chain_tasks:cancel()
	end

	if instantly then
		self:stop_esc_blink()
		self:hide()
		if self.data and type(self.data.oncomplete) == "function" then
			self.data.oncomplete()
		end
		self.data = nil
		self.stopping = nil
	else
		if not self.stopping then
			self:texts_fade_out(function()
				dlg:stop(true)
			end)
		end
		self.stopping = true
	end
end

function dlg:texts_fade_out(oncomplete)
	return ani:new{
		start_state = 255,
		end_state = 0,
		duration = 500,
		onpopulate = function(self, state)
			bg:set_alpha(state)
			labels:set_alpha(state)
		end,
		oncomplete = oncomplete
	}
end

function dlg:start_esc_blink()
	local id = self.esc_blink_interval_id
	if type(id) == "number" then
		self:stop_esc_blink()
	end

	local timer = 0
	self.esc_blink_interval_id = set_interval(function(tick_time)
		local timer_ratio = timer / ESC_BLINK_INTERVAL;
		local alpha = math.sin(timer_ratio * math.pi) * 255;
		esc:show()
		esc:set_alpha(alpha)

		timer = timer + tick_time
		if timer >= ESC_BLINK_INTERVAL then
			timer = 0
		end
	end)
end

function dlg:stop_esc_blink()
	local id = self.esc_blink_interval_id
	if id > 0 then
		clear_interval(id)
	end
end

function dlg:layout()
	local dlg_width = self:get_prop().width
	local dlg_height = self:get_prop().height
	local text_lines = self.data and #(self.data.texts) or 0
	
	local scale = DlgApi.GetWindowScale()
	local y = (dlg_height - LINE_HEIGHT * text_lines * scale) / 2
	for i, obj in ipairs(labels.objs) do
		if i <= text_lines then
			obj:set_pos(dlg_width / 2, y)
		end
		y = y + LINE_HEIGHT * scale
	end

	local esc_pos = esc:get_pos()
	esc:set_pos(dlg_width - ESC_RIGHT_MARGIN, esc_pos.y)
end

function dlg:resize()
    local _,_,w,h = DlgApi.GetWindowRect()
    self:set_size(w, h)
    self:set_pos(0, 0)
    self:layout()

    local bg_rect = bg:get_rect()
    bg:set_pos((w - bg_rect.width)/2, (h - bg_rect.height)/2)
end
