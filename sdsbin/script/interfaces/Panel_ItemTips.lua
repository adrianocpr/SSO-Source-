Panel_ItemTips = ui.dialog.get("Panel_ItemTips")

local dlg = Panel_ItemTips

local ani_list = {}

local function stop_all_ani()
	for _, v in ipairs(ani_list) do
		v:stop()
	end
	ani_list = {}
end

function dlg:Init()
	self:set_alpha(0)
	self:set_whole_alpha(0)
end

function dlg:FadeIn()
	local alpha = self:get_alpha()
	if self:is_show() and alpha >= 255 then return end
	
	stop_all_ani()
	local dlg = self
	table.insert(ani_list, ani:new{
		start_state = alpha,
		end_state = 255,
		duration = 500,
		oninit = function()
			dlg:show(true, false, false)
		end,
		onpopulate = function(self, state)
			dlg:set_alpha(state)
			dlg:set_whole_alpha(state)
		end,
	})
end

function dlg:FadeOut()
	local alpha = self:get_alpha()
	if not self:is_show() and alpha <= 0 then return end
	
	stop_all_ani()
	local dlg = self
	table.insert(ani_list, ani:new{
		start_state = alpha,
		end_state = 0,
		duration = 500,
		onpopulate = function(self, state)
			dlg:set_alpha(state)
			dlg:set_whole_alpha(state)
		end,
		oncomplete = function()
			dlg:hide()
		end
	})
end