Panel_OnlineGift = ui.dialog.get("Panel_OnlineGift")

local dlg = Panel_OnlineGift

-- 需要作为在线奖励显示的任务，请在此配置任务ID
-- 任务需要勾选“允许客户端手动触发”，并配置开启时间段
-- 倒计时将根据任务模板中配置的间段长度进行显示
local online_gift_quests =
{
	8114,8175,8179,9343,9406,10472,11298,11861,
}

---------------------------------------------------------
local button = dlg:get_obj("Button_Online")
local count_down_label = dlg:get_obj("Label_Time")

local function get_available_quest()
	for _, id in ipairs(online_gift_quests) do
		if GameApi.CanDeliverTask(id) then
			return id
		end
	end	

	return 0
end

function dlg:check_quests()
	local id = get_available_quest()
	if id > 0 then
		if not self:is_show() then
			self:show(true, false, false)
			self:random_pos()
			button:enable(true)
		end
		return id
	else
		self:hide()
	end
	return 0
end

function dlg:clear_count_down()
	count_down_label:set_text("")
end

function dlg:update_count_down(id)
	if id <= 0 then
		self:clear_count_down()
		return
	end

	local start_time, end_time = GameApi.GetTaskOpenTimeSection(id)
	if not start_time or not end_time or start_time == 0 or end_time == 0 then
		self:clear_count_down()
		return
	end

	local current_time = GlobalApi.GetServerGMTTime()
	local remain = end_time - current_time

	if remain > 0 then
		local text = STRING_TABLE.ONLINE_GIFT_COUNT_DOWN or ""
		count_down_label:set_text(text:format(remain))
	else
		self:clear_count_down()
	end
end

function dlg:random_pos()
	local left, top, right, bottom = DlgApi.GetWindowRect()
	local width = right - left
	local height = bottom - top

	local x_min = 0.2
	local x_max = 0.8
	local y_min = 0.2
	local y_max = 0.6

	local x = (math.random() * (x_max - x_min) + x_min) * width
	local y = (math.random() * (y_max - y_min) + y_min) * height

	self:set_pos(x, y)
end

function dlg:Init()
	button:command(self.on_open)

	self.interval_id = set_interval(function()
		local id = self:check_quests()
		self:update_count_down(id)
	end, 500)
end

function dlg:Release()
	if self.interval_id then
		clear_interval(self.interval_id)
	end
end

function dlg:on_open()
	button:enable(false)
	local id = get_available_quest()
	if id > 0 then
		GameApi.MaunallyTrigTask(id)
	end
end


