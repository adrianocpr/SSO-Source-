--------------------
--这是一个同时处理多个任务的脚本示例
--此类同时处理多个任务的脚本需要在preload.lua中注册才能载入
--

local t = task:new{
	22,
	1073,   ----------皇后岛-死亡矿坑的秘密-传送+动画
	1117,   ----------圣域-激战的号角-传送
	1688,   ----------圣域-战神圣蛇-传送+动画
	2169,   ----------圣域-再次觐见教皇-传送+动画
}

function t.on_award(tid, success)
	if success then
		ani.screen.fade_out(function()
			set_timeout(function()
				ani.screen.fade_in()
			end, 5000)
		end)
	end
end