--[[ @i18n quest ]]
local _t = require("i18n").context("quest")

---------------------------------
-- 我的历程配置
--[[
QuestJourney 的每一项为一个table，格式如下：
{
	name = "名称",					-- 名称
	active_name = "激活后名称",		-- 激活后名称（可选），若不填则和name相同
	detail = "描述"					-- 描述
	active_detail = "激活后描述",	-- 激活后描述（可选），若不填则和detail相同
	show_on = 1054,					-- 当完成该任务后显示该历程项
	active_on = 1056,				-- 当完成该任务后激活该历程项
	active_image = "quest\\image\\image_demo1.tga",		-- 激活后使用的背景图片
}
]]--

QuestJourney =
{
	{
		name = _t"第一步 把冰箱门打开",
		active_name = _t"第一步 把冰箱门打开(已激活)",
		detail = _t[[这个是一段很长的文字，
		哈哈哈。]],
		active_detail = _t[[激活了]],
		show_on = 1054,
		active_on = 1056,
		active_image = "quest\\image\\image_demo1.tga",
	},
	
	{
		name = _t"第二步 把大象放进去",
		detail = _t[[这个是一段很长的文字，
		哈哈哈。]],
		show_on = 1056,
		active_on = 1058,
		active_image = "quest\\image\\image_demo2.tga",
	},
	
	{
		name = _t"第三步 把冰箱门关上",
		detail = _t[[这个是一段很长的文字，
		哈哈哈。]],
		show_on = 1059,
		active_on = 1062,
		active_image = "quest\\image\\image_demo3.tga",
	},
}