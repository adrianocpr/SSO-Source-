--[[ @i18n social ]]
local _t = require("i18n").context("social")

-- 系统命令快捷符
-- author : Ma Yuanzheng
-- Date: 2012.11.12

CommandWords = 
{
	["/n"] =
	{
	command = 1,
	-- desc = "切换普通频道", 也可以不加这一行
    },
	[_t"/当前"] =
	{
	command = 1,
	-- desc = "切换普通频道",
    },
    ["/t"] =
	{
	command = 2,
	-- desc = "切换队伍频道",
    },
    [_t"/队伍"] =
	{
	command = 2,
	-- desc = "切换队伍频道",
    },
    ["/i"] =
	{
	command = 3,
	-- desc = "切换好友频道",
    },
    [_t"/好友"] =
	{
	command = 3,
	-- desc = "切换好友频道",
    },
    ["/u"] =
	{
	command = 4,
	-- desc = "切换圈子频道",
    },
    [_t"/圈子"] =
	{
	command = 4,
	-- desc = "切换圈子频道",
    },
    ["/w"] =
	{
	command = 5,
	-- desc = "切换密语频道",
    },
    [_t"/密语"] =
	{
	command = 5,
	-- desc = "切换密语频道",
    },
    ["/p"] =
	{
	command = 6,
	-- desc = "切换军团频道",
    },
    [_t"/军团"] =
	{
	command = 6,
	-- desc = "切换军团频道",
    },
    ["/s"] =
	{
	command = 7,
	-- desc = "切换世界频道",
    },
    [_t"/世界"] =
	{
	command = 7,
	-- desc = "切换世界频道",
    },
    ["/b"] =
	{
	command = 8,
	-- desc = "切换广播频道",
    },
    [_t"/广播"] =
	{
	command = 8,
	-- desc = "切换广播频道",
    },  


--以下是表情动作用
    [_t"/笑"] =
	{
	command = 1000,
	-- desc = "笑",
    },

--以下是交互动作用
    [_t"/相依相偎"] =
	{
	command = 2000,
	-- desc = "相依相偎",
    },
    
    
-- 其他有用功能
    [_t"/打印聊天"] =
	{
	command = 3000,
	-- desc = "打印聊天",
    },
  
}

