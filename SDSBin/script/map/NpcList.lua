--[[ @i18n map ]]
local _t = require("i18n").context("map")
 --管辖区域NPC列表
NpcList = {}


local MAP_NPCMARK_ALL 			=  1
local MAP_NPCMARK_NORMAL_TASK   =  2
local MAP_NPCMARK_IMPORT_TASK   =  3
local MAP_NPCMARK_TELEPORT      =  4
local MAP_NPCMARK_IMPORT_PLACE  =  5
local MAP_NPCMARK_FUNCTION      =  6
local MAP_NPCMARK_MASTER     	=  7

NpcList[100] =
{
	instance = 1,  --地图编号
 	list =         --整个大地图共用的列表
	{
		{id = 341, name = _t"测试1", category = MAP_NPCMARK_ALL},
		{id = 341, name = _t"测试2", category = MAP_NPCMARK_NORMAL_TASK},
		{id = 341, name = _t"测试3", category = MAP_NPCMARK_IMPORT_TASK},
	},
 	[0] =         --管辖区域单用的列表
	{
	   	{id = 341, name = _t"测试4", category = MAP_NPCMARK_FUNCTION},
		{id = 341, name = _t"测试5", category = MAP_NPCMARK_MASTER},
		{id = 341, name = _t"测试6", category = MAP_NPCMARK_TELEPORT},
	},
}

NpcList[1] =
{
	instance = 1,  --新手村
 	list =         --整个大地图共用的列表
	{
		{id = 11564, name = _t"仓库", category = MAP_NPCMARK_FUNCTION },
		{id = 11568, name = _t"邮箱", category = MAP_NPCMARK_FUNCTION },
		{id = 20814, name = _t"药剂师", category = MAP_NPCMARK_FUNCTION},
		{id = 20815, name = _t"面包商人", category = MAP_NPCMARK_FUNCTION},
		{id = 11320, name = _t"锻造师", category = MAP_NPCMARK_FUNCTION},
		{id = 15808, name = _t"传送师", category = MAP_NPCMARK_TELEPORT },
		{id = 13903, name = _t"回城师", category = MAP_NPCMARK_FUNCTION },
	},
}

NpcList[2] =
{
	instance = 2,  --圣域
 	list =         --整个大地图共用的列表
	{
		{id = 11569, name = _t"邮箱", category = MAP_NPCMARK_FUNCTION },
		{id = 20816, name = _t"仓库", category = MAP_NPCMARK_FUNCTION },
		{id = 20817, name = _t"药剂师", category = MAP_NPCMARK_FUNCTION},		
		{id = 20818, name = _t"面包商人", category = MAP_NPCMARK_FUNCTION},
		{id = 20819, name = _t"锻造师", category = MAP_NPCMARK_FUNCTION},
		{id = 20812, name = _t"装备聚能师", category = MAP_NPCMARK_FUNCTION},
		{id = 15593, name = _t"传送师", category = MAP_NPCMARK_TELEPORT },
		{id = 20820, name = _t"回城师", category = MAP_NPCMARK_TELEPORT },
		{id = 34575, name = _t"师徒系统介绍人", category = MAP_NPCMARK_FUNCTION },
		{id = 34694, name = _t"银河激斗篇积分兑换NPC", category = MAP_NPCMARK_FUNCTION },
		
	},
	[201] =         --管辖区域单用的列表
	{

        {id = 20821, name = _t"拍卖师", category = MAP_NPCMARK_FUNCTION},
		{id = 20822, name = _t"工艺师", category = MAP_NPCMARK_FUNCTION},
		{id = 12838, name = _t"传承！黄金试炼领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 13950, name = _t"圣战回忆领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 13949, name = _t"集结！十二宫危机领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 14799, name = _t"军团管理员泽拉", category = MAP_NPCMARK_FUNCTION  },
		{id = 14838, name = _t"免费双倍发放", category = MAP_NPCMARK_FUNCTION  },
		{id = 14895, name = _t"幻境使者", category = MAP_NPCMARK_TELEPORT  },
		{id = 17439, name = _t"青铜匠师", category = MAP_NPCMARK_FUNCTION  },
		{id = 17440, name = _t"白银匠师", category = MAP_NPCMARK_FUNCTION  },
		{id = 31003, name = _t"黑暗匠师", category = MAP_NPCMARK_FUNCTION  },
		{id = 28252, name = _t"黄金匠师", category = MAP_NPCMARK_FUNCTION  },
		{id = 38333, name = _t"情缘点兑换", category = MAP_NPCMARK_FUNCTION  },
		{id = 38428, name = _t"结为密友", category = MAP_NPCMARK_FUNCTION  },
		{id = 38334, name = _t"离婚登记处", category = MAP_NPCMARK_FUNCTION  },
		{id = 34898, name = _t"黄金圣光使者", category = MAP_NPCMARK_FUNCTION  },		
		{id = 18405, name = _t"守护星座切换", category = MAP_NPCMARK_MASTER  },
		{id = 18165, name = _t"宝物商人", category = MAP_NPCMARK_FUNCTION  },
		{id = 18406, name = _t"祭祀学徒", category = MAP_NPCMARK_FUNCTION  },
		{id = 16355, name = _t"战场指引", category = MAP_NPCMARK_IMPORT_TASK  },
		{id = 20220, name = _t"副本周常", category = MAP_NPCMARK_IMPORT_TASK  },
		{id = 19317, name = _t"战场军需官", category = MAP_NPCMARK_FUNCTION  },
		{id = 17850, name = _t"符文镶嵌师", category = MAP_NPCMARK_FUNCTION  },
		{id = 21628, name = _t"深渊！魔星的末日领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 23580, name = _t"重生！圣域镇魂歌领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 23212, name = _t"大反攻！冰国邪神领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 22955, name = _t"守护星大使", category = MAP_NPCMARK_FUNCTION  },
		{id = 22956, name = _t"守护星军需官", category = MAP_NPCMARK_FUNCTION  },
		{id = 17341, name = _t"小伙伴训练师", category = MAP_NPCMARK_FUNCTION  },
		{id = 26471, name = _t"基加美修", category = MAP_NPCMARK_FUNCTION  },
		{id = 29960, name = _t"神战使者", category = MAP_NPCMARK_FUNCTION  },
		{id = 30079, name = _t"扫荡使者", category = MAP_NPCMARK_FUNCTION  },
		{id = 33262, name = _t"绶带出售 摩尔", category = MAP_NPCMARK_FUNCTION  },
		{id = 33799, name = _t"试炼幻境传送", category = MAP_NPCMARK_TELEPORT },
		{id = 14841, name = _t"潘多拉", category = MAP_NPCMARK_TELEPORT },

	},
	[211] =         --管辖区域单用的列表
	{
        {id = 20821, name = _t"拍卖师", category = MAP_NPCMARK_FUNCTION},
		{id = 20822, name = _t"工艺师", category = MAP_NPCMARK_FUNCTION},
		{id = 12838, name = _t"传承！黄金试炼领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 13950, name = _t"圣战回忆领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 13949, name = _t"集结！十二宫危机领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 14799, name = _t"军团管理员泽拉", category = MAP_NPCMARK_FUNCTION  },
		{id = 14838, name = _t"免费双倍发放", category = MAP_NPCMARK_FUNCTION  },
		{id = 14895, name = _t"幻境使者", category = MAP_NPCMARK_TELEPORT  },
		{id = 17439, name = _t"青铜匠师", category = MAP_NPCMARK_FUNCTION  },
		{id = 17440, name = _t"白银匠师", category = MAP_NPCMARK_FUNCTION  },
		{id = 31003, name = _t"黑暗匠师", category = MAP_NPCMARK_FUNCTION  },
		{id = 28252, name = _t"黄金匠师", category = MAP_NPCMARK_FUNCTION  },
		{id = 38333, name = _t"情缘点兑换", category = MAP_NPCMARK_FUNCTION  },
		{id = 38428, name = _t"结为密友", category = MAP_NPCMARK_FUNCTION  },
		{id = 38334, name = _t"离婚登记处", category = MAP_NPCMARK_FUNCTION  },
		{id = 34898, name = _t"黄金圣光使者", category = MAP_NPCMARK_FUNCTION  },	
		{id = 18405, name = _t"守护星座切换", category = MAP_NPCMARK_MASTER  },
		{id = 18165, name = _t"宝物商人", category = MAP_NPCMARK_FUNCTION  },
		{id = 16355, name = _t"战场指引", category = MAP_NPCMARK_IMPORT_TASK  },
		{id = 20220, name = _t"副本周常", category = MAP_NPCMARK_IMPORT_TASK  },
		{id = 19317, name = _t"战场军需官", category = MAP_NPCMARK_FUNCTION  },
        {id = 17850, name = _t"符文镶嵌师", category = MAP_NPCMARK_FUNCTION  },
		{id = 21628, name = _t"深渊！魔星的末日领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 23580, name = _t"重生！圣域镇魂歌领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 23212, name = _t"大反攻！冰国邪神领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 22955, name = _t"守护星大使", category = MAP_NPCMARK_FUNCTION  },
		{id = 22956, name = _t"守护星军需官", category = MAP_NPCMARK_FUNCTION  },
		{id = 17341, name = _t"小伙伴训练师", category = MAP_NPCMARK_FUNCTION  },
		{id = 26471, name = _t"基加美修", category = MAP_NPCMARK_FUNCTION  },
		{id = 29960, name = _t"神战使者", category = MAP_NPCMARK_FUNCTION  },
		{id = 30079, name = _t"扫荡使者", category = MAP_NPCMARK_FUNCTION  },
		{id = 33262, name = _t"绶带出售 摩尔", category = MAP_NPCMARK_FUNCTION  },
		{id = 33799, name = _t"试炼幻境传送", category = MAP_NPCMARK_TELEPORT },
		{id = 14841, name = _t"潘多拉", category = MAP_NPCMARK_TELEPORT },

	},
	[212] =         --管辖区域单用的列表
	{
        {id = 20821, name = _t"拍卖师", category = MAP_NPCMARK_FUNCTION},
		{id = 20822, name = _t"工艺师", category = MAP_NPCMARK_FUNCTION},
		{id = 12838, name = _t"传承！黄金试炼领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 13950, name = _t"圣战回忆领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 13949, name = _t"集结！十二宫危机领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 14799, name = _t"军团管理员泽拉", category = MAP_NPCMARK_FUNCTION  },
		{id = 14838, name = _t"免费双倍发放", category = MAP_NPCMARK_FUNCTION  },
		{id = 14895, name = _t"幻境使者", category = MAP_NPCMARK_TELEPORT  },
		{id = 17439, name = _t"青铜匠师", category = MAP_NPCMARK_FUNCTION  },
		{id = 17440, name = _t"白银匠师", category = MAP_NPCMARK_FUNCTION  },
		{id = 31003, name = _t"黑暗匠师", category = MAP_NPCMARK_FUNCTION  },
		{id = 28252, name = _t"黄金匠师", category = MAP_NPCMARK_FUNCTION  },
		{id = 38333, name = _t"情缘点兑换", category = MAP_NPCMARK_FUNCTION  },
		{id = 38428, name = _t"结为密友", category = MAP_NPCMARK_FUNCTION  },
		{id = 38334, name = _t"离婚登记处", category = MAP_NPCMARK_FUNCTION  },
		{id = 34898, name = _t"黄金圣光使者", category = MAP_NPCMARK_FUNCTION  },	
		{id = 18405, name = _t"守护星座切换", category = MAP_NPCMARK_MASTER  },
		{id = 18165, name = _t"宝物商人", category = MAP_NPCMARK_FUNCTION  },
		{id = 16355, name = _t"战场指引", category = MAP_NPCMARK_IMPORT_TASK  },
		{id = 20220, name = _t"副本周常", category = MAP_NPCMARK_IMPORT_TASK  },
		{id = 19317, name = _t"战场军需官", category = MAP_NPCMARK_FUNCTION  },
        {id = 17850, name = _t"符文镶嵌师", category = MAP_NPCMARK_FUNCTION  },
		{id = 21628, name = _t"深渊！魔星的末日领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 23580, name = _t"重生！圣域镇魂歌领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 23212, name = _t"大反攻！冰国邪神领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 22955, name = _t"守护星大使", category = MAP_NPCMARK_FUNCTION  },
		{id = 22956, name = _t"守护星军需官", category = MAP_NPCMARK_FUNCTION  },
		{id = 17341, name = _t"小伙伴训练师", category = MAP_NPCMARK_FUNCTION  },		
		{id = 26471, name = _t"基加美修", category = MAP_NPCMARK_FUNCTION  },
		{id = 29960, name = _t"神战使者", category = MAP_NPCMARK_FUNCTION  },
        {id = 30079, name = _t"扫荡使者", category = MAP_NPCMARK_FUNCTION  },
		{id = 33262, name = _t"绶带出售 摩尔", category = MAP_NPCMARK_FUNCTION  },
		{id = 33799, name = _t"试炼幻境传送", category = MAP_NPCMARK_TELEPORT },
		{id = 14841, name = _t"潘多拉", category = MAP_NPCMARK_TELEPORT },
	},
	[213] =         --管辖区域单用的列表
	{
        {id = 20821, name = _t"拍卖师", category = MAP_NPCMARK_FUNCTION},
		{id = 20822, name = _t"工艺师", category = MAP_NPCMARK_FUNCTION},
		{id = 12838, name = _t"传承！黄金试炼领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 13950, name = _t"圣战回忆领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 13949, name = _t"集结！十二宫危机领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 14799, name = _t"军团管理员泽拉", category = MAP_NPCMARK_FUNCTION  },
		{id = 14838, name = _t"免费双倍发放", category = MAP_NPCMARK_FUNCTION  },
		{id = 14895, name = _t"幻境使者", category = MAP_NPCMARK_TELEPORT  },
		{id = 17439, name = _t"青铜匠师", category = MAP_NPCMARK_FUNCTION  },
		{id = 17440, name = _t"白银匠师", category = MAP_NPCMARK_FUNCTION  },
		{id = 31003, name = _t"黑暗匠师", category = MAP_NPCMARK_FUNCTION  },
		{id = 28252, name = _t"黄金匠师", category = MAP_NPCMARK_FUNCTION  },
		{id = 38333, name = _t"情缘点兑换", category = MAP_NPCMARK_FUNCTION  },
		{id = 38428, name = _t"结为密友", category = MAP_NPCMARK_FUNCTION  },
		{id = 38334, name = _t"离婚登记处", category = MAP_NPCMARK_FUNCTION  },
		{id = 34898, name = _t"黄金圣光使者", category = MAP_NPCMARK_FUNCTION  },	
		{id = 18405, name = _t"守护星座切换", category = MAP_NPCMARK_MASTER  },
		{id = 18165, name = _t"宝物商人", category = MAP_NPCMARK_FUNCTION  },
		{id = 16355, name = _t"战场指引", category = MAP_NPCMARK_IMPORT_TASK  },
		{id = 20220, name = _t"副本周常", category = MAP_NPCMARK_IMPORT_TASK  },
		{id = 19317, name = _t"战场军需官", category = MAP_NPCMARK_FUNCTION  },
        {id = 17850, name = _t"符文镶嵌师", category = MAP_NPCMARK_FUNCTION  },
 		{id = 21628, name = _t"深渊！魔星的末日领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 23580, name = _t"重生！圣域镇魂歌领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 23212, name = _t"大反攻！冰国邪神领取人", category = MAP_NPCMARK_IMPORT_TASK },
		{id = 22955, name = _t"守护星大使", category = MAP_NPCMARK_FUNCTION  },
		{id = 22956, name = _t"守护星军需官", category = MAP_NPCMARK_FUNCTION  },
		{id = 17341, name = _t"小伙伴训练师", category = MAP_NPCMARK_FUNCTION  },
		{id = 26471, name = _t"基加美修", category = MAP_NPCMARK_FUNCTION  },
		{id = 29960, name = _t"神战使者", category = MAP_NPCMARK_FUNCTION  },
        {id = 30079, name = _t"扫荡使者", category = MAP_NPCMARK_FUNCTION  },		
		{id = 33262, name = _t"绶带出售 摩尔", category = MAP_NPCMARK_FUNCTION  },
		{id = 33799, name = _t"试炼幻境传送", category = MAP_NPCMARK_TELEPORT },
		{id = 14841, name = _t"潘多拉", category = MAP_NPCMARK_TELEPORT },
	},
}

NpcList[3] =
{
	instance = 3,  --庐山
 	list =         --整个大地图共用的列表
	{
		{id = 11567, name = _t"仓库", category = MAP_NPCMARK_FUNCTION },
		{id = 11571, name = _t"邮箱", category = MAP_NPCMARK_FUNCTION },
		{id = 20823, name = _t"药剂师", category = MAP_NPCMARK_FUNCTION},
		{id = 11323, name = _t"锻造师", category = MAP_NPCMARK_FUNCTION},
		{id = 20824, name = _t"面包商人", category = MAP_NPCMARK_FUNCTION},
		{id = 15594, name = _t"传送师", category = MAP_NPCMARK_TELEPORT },
		{id = 20825, name = _t"回城师", category = MAP_NPCMARK_FUNCTION },
		{id = 11578, name = _t"装备聚能师", category = MAP_NPCMARK_FUNCTION},
	},
        [401] =         --管辖区域单用的列表
	{
		{id = 11581, name = _t"工艺师", category = MAP_NPCMARK_FUNCTION},
	},
}

NpcList[4] =
{
	instance = 4,  --银河竞技场
 	list =         --整个大地图共用的列表
	{

		{id = 20826, name = _t"仓库", category = MAP_NPCMARK_FUNCTION },
		{id = 11570, name = _t"邮箱", category = MAP_NPCMARK_FUNCTION },
		{id = 20827, name = _t"面包商人", category = MAP_NPCMARK_FUNCTION},
		{id = 20828, name = _t"锻造师", category = MAP_NPCMARK_FUNCTION},
		{id = 20829, name = _t"药剂师", category = MAP_NPCMARK_FUNCTION},
		{id = 15595, name = _t"传送师", category = MAP_NPCMARK_TELEPORT },
		{id = 20830, name = _t"回城师", category = MAP_NPCMARK_FUNCTION },
		{id = 11577, name = _t"装备聚能师", category = MAP_NPCMARK_FUNCTION},
	},
        [301] =         --管辖区域单用的列表
	{
		{id = 11580, name = _t"工艺师", category = MAP_NPCMARK_FUNCTION},

	},
	[307] =         --管辖区域单用的列表
	{
		{id = 13599, name = _t"工艺师", category = MAP_NPCMARK_FUNCTION},

	},
}

NpcList[5] =
{
	instance = 5,  --遗忘之路
 	list =         --整个大地图共用的列表
	{

		{id = 20242, name = _t"邮箱", category = MAP_NPCMARK_FUNCTION },
		{id = 20831, name = _t"仓库", category = MAP_NPCMARK_FUNCTION },
		{id = 20832, name = _t"面包商人", category = MAP_NPCMARK_FUNCTION},
		{id = 20833, name = _t"锻造师", category = MAP_NPCMARK_FUNCTION},
		{id = 20834, name = _t"药剂师", category = MAP_NPCMARK_FUNCTION},
		{id = 20642, name = _t"传送师", category = MAP_NPCMARK_TELEPORT },
		{id = 20643, name = _t"回城师", category = MAP_NPCMARK_FUNCTION },
		{id = 20243, name = _t"装备聚能师", category = MAP_NPCMARK_FUNCTION},

	},
}

NpcList[6] =
{
	instance = 6,  --死亡皇后岛
 	list =         --整个大地图共用的列表
	{
		{id = 20292, name = _t"邮箱", category = MAP_NPCMARK_FUNCTION },
		{id = 20641, name = _t"仓库", category = MAP_NPCMARK_FUNCTION },
		{id = 20835, name = _t"面包商人", category = MAP_NPCMARK_FUNCTION},
		{id = 20640, name = _t"锻造师", category = MAP_NPCMARK_FUNCTION},
		{id = 20836, name = _t"药剂师", category = MAP_NPCMARK_FUNCTION},
		{id = 20644, name = _t"传送师", category = MAP_NPCMARK_TELEPORT },
		{id = 20645, name = _t"回城师", category = MAP_NPCMARK_FUNCTION },
		{id = 20293, name = _t"装备聚能师", category = MAP_NPCMARK_FUNCTION},
	},

}

NpcList[7] =
{
	instance = 47,  --地宫
 	list =         --整个大地图共用的列表
	{
		{id = 14918, name = _t"幻境使者", category = MAP_NPCMARK_FUNCTION },
	},
}

NpcList[8] =
{
	instance = 48,  --地宫
 	list =         --整个大地图共用的列表
	{
		{id = 14919, name = _t"幻境使者", category = MAP_NPCMARK_FUNCTION },
	},
}

NpcList[9] =
{
	instance = 49,  --地宫
 	list =         --整个大地图共用的列表
	{
		{id = 14920, name = _t"幻境使者", category = MAP_NPCMARK_FUNCTION },
	},
}

NpcList[10] =
{
	instance = 7,  --东西伯利亚
 	list =         --整个大地图共用的列表
	{
		{id = 23680, name = _t"传送师", category = MAP_NPCMARK_TELEPORT },
		{id = 23681, name = _t"回城师", category = MAP_NPCMARK_FUNCTION },
		{id = 23685, name = _t"邮箱", category = MAP_NPCMARK_FUNCTION },
		{id = 23679, name = _t"仓库", category = MAP_NPCMARK_FUNCTION },
		{id = 23682, name = _t"面包商人", category = MAP_NPCMARK_FUNCTION},
		{id = 23686, name = _t"锻造师", category = MAP_NPCMARK_FUNCTION},
		{id = 23684, name = _t"药剂师", category = MAP_NPCMARK_FUNCTION},
		{id = 23689, name = _t"装备聚能师", category = MAP_NPCMARK_FUNCTION},

	},
}

NpcList[11] =
{
	instance = 8,  --亚特兰蒂斯
 	list =         --整个大地图共用的列表
	{
		{id = 25220, name = _t"传送师", category = MAP_NPCMARK_TELEPORT },
		{id = 25221, name = _t"回城师", category = MAP_NPCMARK_FUNCTION },
		{id = 25224, name = _t"邮箱", category = MAP_NPCMARK_FUNCTION },
		{id = 25219, name = _t"仓库", category = MAP_NPCMARK_FUNCTION },
		{id = 25222, name = _t"面包商人", category = MAP_NPCMARK_FUNCTION},
		{id = 25065, name = _t"锻造师", category = MAP_NPCMARK_FUNCTION},
		{id = 25223, name = _t"药剂师", category = MAP_NPCMARK_FUNCTION},
		{id = 25064, name = _t"装备聚能师", category = MAP_NPCMARK_FUNCTION},

	},
}

NpcList[12] =
{
	instance = 101,  --军团基地
 	list =         --整个大地图共用的列表
	{
		{id = 8519, name = _t"基地主建筑管理员", category = MAP_NPCMARK_FUNCTION },
		{id = 8545, name = _t"基地商店管理员", category = MAP_NPCMARK_FUNCTION },
		{id = 8533, name = _t"基地仓库管理员", category = MAP_NPCMARK_FUNCTION },
		{id = 8554, name = _t"基地训练场管理员", category = MAP_NPCMARK_FUNCTION },
		{id = 8579, name = _t"基地奇迹", category = MAP_NPCMARK_FUNCTION},
		{id = 8568, name = _t"基地祭坛管理员", category = MAP_NPCMARK_FUNCTION},
		{id = 8563, name = _t"基地车间管理员", category = MAP_NPCMARK_FUNCTION},
		{id = 17857, name = _t"军团修炼师", category = MAP_NPCMARK_FUNCTION},
		{id = 20016, name = _t"军团贡献牌兑换", category = MAP_NPCMARK_FUNCTION},
		{id = 13534, name = _t"加度", category = MAP_NPCMARK_IMPORT_TASK},
		{id = 20614, name = _t"赫尔墨斯", category = MAP_NPCMARK_IMPORT_TASK},

	},
}

NpcList[13] =
{
	instance = 9,  --仙女岛
 	list =         --整个大地图共用的列表
	{
		{id = 28351, name = _t"传送师", category = MAP_NPCMARK_TELEPORT },
		{id = 28352, name = _t"回城师", category = MAP_NPCMARK_FUNCTION },	
		{id = 28347, name = _t"仓库", category = MAP_NPCMARK_FUNCTION },
		{id = 28350, name = _t"邮箱", category = MAP_NPCMARK_FUNCTION },
		{id = 28349, name = _t"药剂师", category = MAP_NPCMARK_FUNCTION},
		{id = 28348, name = _t"面包商人", category = MAP_NPCMARK_FUNCTION},
		{id = 28346, name = _t"锻造师", category = MAP_NPCMARK_FUNCTION},
		{id = 28341, name = _t"装备聚能师", category = MAP_NPCMARK_FUNCTION},
	},
}

NpcList[14] =
{
	instance = 10,  --哈迪斯城
 	list =         --整个大地图共用的列表
	{
		{id = 28390, name = _t"传送师", category = MAP_NPCMARK_TELEPORT },
		{id = 28391, name = _t"回城师", category = MAP_NPCMARK_FUNCTION },		
		{id = 28380, name = _t"邮箱", category = MAP_NPCMARK_FUNCTION },
		{id = 28416, name = _t"仓库", category = MAP_NPCMARK_FUNCTION },
		{id = 28392, name = _t"面包商人", category = MAP_NPCMARK_FUNCTION},
		{id = 28394, name = _t"锻造师", category = MAP_NPCMARK_FUNCTION},
		{id = 28393, name = _t"药剂师", category = MAP_NPCMARK_FUNCTION},
		{id = 28382, name = _t"装备聚能师", category = MAP_NPCMARK_FUNCTION},

	},
}

NpcList[15] =
{
	instance = 26,  --试炼幻境二
 	list =         --整个大地图共用的列表
	{
		{id = 33773, name = _t"中间传送", category = MAP_NPCMARK_TELEPORT },
		{id = 33778, name = _t"东南使者", category = MAP_NPCMARK_TELEPORT },
		{id = 33779, name = _t"西南使者", category = MAP_NPCMARK_TELEPORT },
		{id = 33780, name = _t"东北使者", category = MAP_NPCMARK_TELEPORT },
		{id = 33781, name = _t"西北使者", category = MAP_NPCMARK_TELEPORT },
	},
}

NpcList[16] =
{
	instance = 27,  --试炼幻境三
 	list =         --整个大地图共用的列表
	{
		{id = 33774, name = _t"中间传送", category = MAP_NPCMARK_TELEPORT },
		{id = 33782, name = _t"东南使者", category = MAP_NPCMARK_TELEPORT },
		{id = 33783, name = _t"西南使者", category = MAP_NPCMARK_TELEPORT },
		{id = 33784, name = _t"东北使者", category = MAP_NPCMARK_TELEPORT },
		{id = 33785, name = _t"西北使者", category = MAP_NPCMARK_TELEPORT },
	},
}

NpcList[17] =
{
	instance = 28,  --试炼幻境四
 	list =         --整个大地图共用的列表
	{
		{id = 33775, name = _t"中间传送", category = MAP_NPCMARK_TELEPORT },
		{id = 33786, name = _t"东南使者", category = MAP_NPCMARK_TELEPORT },
		{id = 33787, name = _t"西南使者", category = MAP_NPCMARK_TELEPORT },
		{id = 33788, name = _t"东北使者", category = MAP_NPCMARK_TELEPORT },
		{id = 33789, name = _t"西北使者", category = MAP_NPCMARK_TELEPORT },
	},
}

NpcList[18] =
{
	instance = 29,  --试炼幻境五
 	list =         --整个大地图共用的列表
	{
		{id = 33776, name = _t"中间传送", category = MAP_NPCMARK_TELEPORT },
		{id = 33790, name = _t"东南使者", category = MAP_NPCMARK_TELEPORT },
		{id = 33791, name = _t"西南使者", category = MAP_NPCMARK_TELEPORT },
		{id = 33792, name = _t"东北使者", category = MAP_NPCMARK_TELEPORT },
		{id = 33793, name = _t"西北使者", category = MAP_NPCMARK_TELEPORT },
	},
}

NpcList[19] =
{
	instance = 30,  --试炼幻境六
 	list =         --整个大地图共用的列表
	{
		{id = 33777, name = _t"中间传送", category = MAP_NPCMARK_TELEPORT },
		{id = 33794, name = _t"东南使者", category = MAP_NPCMARK_TELEPORT },
		{id = 33795, name = _t"西南使者", category = MAP_NPCMARK_TELEPORT },
		{id = 33796, name = _t"东北使者", category = MAP_NPCMARK_TELEPORT },
		{id = 33797, name = _t"西北使者", category = MAP_NPCMARK_TELEPORT },
	},
}

NpcList[20] =
{
	instance = 31,  --试炼幻境一
 	list =         --整个大地图共用的列表
	{
		{id = 34033, name = _t"中间传送", category = MAP_NPCMARK_TELEPORT },
		{id = 34034, name = _t"东南使者", category = MAP_NPCMARK_TELEPORT },
		{id = 34035, name = _t"西南使者", category = MAP_NPCMARK_TELEPORT },
		{id = 34036, name = _t"东北使者", category = MAP_NPCMARK_TELEPORT },
		{id = 34037, name = _t"西北使者", category = MAP_NPCMARK_TELEPORT },
	},
}

NpcList[21] =
{
	instance = 25,  --爱琴湾
 	list =         --整个大地图共用的列表
	{
		{id = 38000, name = _t"爱琴湾传送师", category = MAP_NPCMARK_TELEPORT },
		{id = 38001, name = _t"爱神小天使丘比特", category = MAP_NPCMARK_FUNCTION },	
		{id = 38005, name = _t"婚礼筹备人心欣", category = MAP_NPCMARK_FUNCTION },
		{id = 38006, name = _t"亲友签到人", category = MAP_NPCMARK_FUNCTION },
		{id = 38007, name = _t"婚礼牧师主持人约翰", category = MAP_NPCMARK_FUNCTION},
	},
}
NpcList[22] =
{
	instance = 11,  --冥界地狱
 	list =         --整个大地图共用的列表
	{
		{id = 41995, name = _t"传送师", category = MAP_NPCMARK_TELEPORT },
		{id = 41996, name = _t"回城师", category = MAP_NPCMARK_FUNCTION },		
		{id = 41998, name = _t"补给商人", category = MAP_NPCMARK_FUNCTION},

	},
}