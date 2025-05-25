--------------------
--这是处理单个任务的脚本示例
--此类脚本需无需在preload.lua中注册，但命名规则必须是taskXXX.lua，XXX为任务ID，若想在脚本中使用该id，可使用_TASK_ID变量
--
--请尽量避免同一个任务在多个脚本文件中处理的情况，若出现这种情况，则以taskXXX.lua中的定义为高优先级
--
--custom_name, custom_award, on_deliver, can_deliver, on_finish, on_award 等函数可根据实际需要实现，不需要的函数可以不写
--

local t = task:new(_TASK_ID)

--自定义任务名，参数orignal_name为模板中填写的原始名
function t.custom_name(orignal_name)
	return orignal_name .. _t"(自定义)"
end

--也可以直接赋一个固定字符串
--t.custom_name = "测试自定义"


--自定义任务奖励，参数orignal_award为根据模板计算出的任务奖励
--函数需要返回一个table，结构如下：
--{
--	gold = 0,
--	bind_money = 0,
--  exp = 0,
--  sp = 0,
--	reputation = 0,
--	items = {},                --items 中的每一项可以是一个id，此时认为物品数量为1；或者是{id=100, num=5}的方式指定物品数量
--}
--所有项都可选，若忽略某项，则会采用orignal_award中该项的值
--
function t.custom_award(orignal_award)
	print(orignal_award)
	return {
		gold = 2345,
		exp = 5432,
		items = {7886, {id = 7886, num = 2}},
	}
end

--也可以直接赋一个固定table
--t.custom_award = {gold = 1000}

function t.on_deliver(tid)
	console.info("cool!")
	GameUI.ShowAnimationMask(function()
		DlgApi.SetItemText("Panel_ChapterTips", "Label_ColorTitle", _t"第一章")
		DlgApi.SetItemText("Panel_ChapterTips", "Label_Content", _t"血与火的试炼")
		DlgApi.SetItemText("Panel_ChapterTips", "Text_Content", "test")
		
		ani.dialog.fade_in("Panel_ChapterTips", function()
			set_timeout(function()
				ani.dialog.fade_out("Panel_ChapterTips", function()
					GameUI.HideAnimationMask()
				end)
			end, 1000)
		end)
	end)
end

----------------------
--其他可以使用的函数
function t.can_deliver(tid)
	return 0
end

function t.on_award(tid)
end

function t.on_finish(tid)
end

function t.on_failed(tid)
end