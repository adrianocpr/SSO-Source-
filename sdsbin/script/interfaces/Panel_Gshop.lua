Panel_Gshop = ui.dialog.get("Panel_Gshop")

local dlg = Panel_Gshop

--[[商城界面礼品配置
配置格式如下：
------------------------------------
	[1] = {
		name = _t"测试1",			-- 显示的名称
		description = _t"test1!!!",	-- 描述文字
		fake_item_id = 1234,		-- 物品ID，仅用于显示物品图标和悬浮提示
		fake_item_count = 0,		-- 用于在物品图标上显示物品数量的文字，仅当数字大于1时才显示。
		task_id = 123,				-- 领取奖励任务，需要勾选“允许客户端手动触发”。为0的话将不显示“领取”按钮
	},
]]

local gift_config = {
	[1] = {
		name = _t"每周免费奖励领取",
		description = _t"每周可免费领取一次奖励！",
		fake_item_id = 36450,
		fake_item_count = 0,
		task_id = 10048,
	},
	[2] = {
		name = _t"每月充值1元即可领取！",
		description = _t"每月充值1元，即可领取超值月度大礼包！",
		fake_item_id = 36451,
		fake_item_count = 0,
		task_id = 10578,
	},
}

--------------------------------------
function dlg:GetGiftConfig()
	return gift_config
end