---------------------------------------------------------------
--  created:   2009.10.16
--  author:    liudong
--
--  任务npc相关的图片、gfx资源。


---------------------------------------------------------------

--key about server npc's icon and gfx
local QBT_CAN_NOT_GET = 1
local QBT_CAN_NOT_FINISH = 2
local QBT_CAN_GET = 3
local QBT_CAN_FINISH = 4

local TP_TALK = 1
local TP_REPEAT = 2
local TP_DUNGEON = 3
local TP_BRANCH = 4
local TP_MAIN = 5
local TP_RING = 6
local TP_LIBRARY = 7
local TP_GLOBAL_LIBRARY = 8

NPCTaskInfo = {}

NPCTaskInfo[TP_MAIN] =
{
	[QBT_CAN_GET] = "金叹号.tga",
	[QBT_CAN_FINISH] = "金问号.tga",
	[QBT_CAN_NOT_GET] = "灰叹号.tga",
	[QBT_CAN_NOT_FINISH] = "灰问号.tga",
}

NPCTaskInfo[TP_BRANCH] =
{
	[QBT_CAN_GET] = "金叹号.tga",
	[QBT_CAN_FINISH] = "金问号.tga",
	[QBT_CAN_NOT_GET] = "灰叹号.tga",
	[QBT_CAN_NOT_FINISH] = "灰问号.tga",
}

NPCTaskInfo[TP_DUNGEON] =
{
	[QBT_CAN_GET] = "时空漩涡.tga",
	[QBT_CAN_FINISH] = "时空漩涡.tga",
	[QBT_CAN_NOT_GET] = "时空漩涡.tga",
	[QBT_CAN_NOT_FINISH] = "时空漩涡.tga",
}

NPCTaskInfo[TP_REPEAT] =
{
	[QBT_CAN_GET] = "蓝叹号.tga",
	[QBT_CAN_FINISH] = "蓝问号.tga",
	[QBT_CAN_NOT_GET] = "灰叹号.tga",
	[QBT_CAN_NOT_FINISH] = "灰问号.tga",
}

NPCTaskInfo[TP_TALK] =
{
	[QBT_CAN_GET] = "对话.tga",
	[QBT_CAN_FINISH] = "对话.tga",
	[QBT_CAN_NOT_GET] = "对话.tga",
	[QBT_CAN_NOT_FINISH] = "对话.tga",
}

NPCTaskInfo[TP_RING] =
{
	[QBT_CAN_GET] = "黄卷轴叹号.tga",
	[QBT_CAN_FINISH] = "金问号.tga",
	[QBT_CAN_NOT_GET] = "灰叹号.tga",
	[QBT_CAN_NOT_FINISH] = "灰问号.tga",
}

NPCTaskInfo[TP_LIBRARY] =
{
	[QBT_CAN_GET] = "绿卷轴叹号.tga",
	[QBT_CAN_FINISH] = "绿卷轴问号.tga",
	[QBT_CAN_NOT_GET] = "灰卷轴叹号.tga",
	[QBT_CAN_NOT_FINISH] = "灰卷轴问号.tga",
}

NPCTaskInfo[TP_GLOBAL_LIBRARY] =
{
	[QBT_CAN_GET] = "蓝卷轴叹号.tga",
	[QBT_CAN_FINISH] = "蓝卷轴问号.tga",
	[QBT_CAN_NOT_GET] = "灰卷轴叹号.tga",
	[QBT_CAN_NOT_FINISH] = "灰卷轴问号.tga",
}













