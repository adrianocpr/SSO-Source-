--[[ @i18n help ]]
local _t = require("i18n").context("help")
---玩法指引
module("guide_cfg", package.seeall)

--[[
_M[1] = 
{
	achi_id  = 5020,--完成一次圣战回忆，18
	quest_id = 7635,
	award	 = "经验：120000  星券：100",
	show_level = 40,
	show_fin_taskid = 1141,
}
]]--

_M[1] = 
{
	achi_id  = 5096,--获得五小强圣衣
	quest_id = 10588,
	award	 = _t"经验：20000  星券：25",
	show_fin_taskid = 2974,
	show_level_max = 30,
}

_M[2] = 
{
	achi_id  = 5097,--商城购买，10
	quest_id = 12847,
	award	 = _t"经验：120000  星券：200",
	show_level = 10,
	show_level_max = 50,
}

_M[3] = 
{
	achi_id  = 5020,--完成一次圣战回忆，18
	quest_id = 7635,
	award	 = _t"经验：120000  星券：100",
	show_level = 10,
}

_M[4] = 
{
	achi_id  = 5016,--完成一次亚特兰蒂斯，25
	quest_id = 7636,
	award	 = _t"经验：150000  星券：100",
	show_level = 25,
}

_M[5] = 
{
	achi_id  = 5043,--完成一次命运试炼，22
	quest_id = 7637,
	award	 = _t"经验：100000  星券：100",
	show_level = 22,
}

_M[6] = 
{
	achi_id  = 5042, --完成一次女神的圣斗士，15
	quest_id = 7638,
	award	 = _t"经验：100000  星券：200",
	show_level = 15,
}


_M[7] = 
{
	achi_id  = 5014,--完成一次贵鬼答题，15
	quest_id = 7639,
	award	 = _t"经验：50000  星券：50",
	show_level = 15,
}

_M[8] = 
{
	achi_id  = 5057,--获得一件黄金圣衣，90
	quest_id = 8249,
	award	 = _t"经验：50000000  星券：600",
	show_level = 90,
}

_M[9] = 
{
	achi_id  = 5056,--获得两件白银圣衣，75
	quest_id = 8248,
	award	 = _t"经验：8000000  星券：200",
	show_level = 75,
}

_M[10] = 
{
	achi_id  = 5041,--购买50个丹麦面包463和50强力生命药水515，45
	quest_id = 7640,
	award	 = _t"经验：200000  星券：50",
	show_level = 45,
}

_M[11] = 
{
	achi_id  = 5040,--聚能完美度达到2000，45
	quest_id = 7641,
	award	 = _t"经验：600000  星券：200",
	show_level = 45,
}

_M[12] = 
{
	achi_id  = 5026,--小宇宙占星，并达到500星力值，完成任务4269
	quest_id = 7642,
	award	 = _t"经验：500000  星券：200",
	show_fin_taskid = 4269,
}

_M[13] = 
{
	achi_id  = 5039,--打开一次仓库，22
	quest_id = 7643,
	award	 = _t"经验：30000  星券：50",
	show_level = 22,
}

_M[14] = 
{
	achi_id  = 5025,--商城消费一次星券，20
	quest_id = 7644,
	award	 = _t"经验：50000  星券：50",
	show_level = 20,
}

_M[15] = 
{
	achi_id  = 5030,--聚能一次，20
	quest_id =  7645,
	award	 = _t"经验：100000  星券：100",
	show_level = 20,
}

_M[16] = 
{
	achi_id  = 5021,--圣衣星铸到2级，完成任务3182
	quest_id = 7646,
	award	 = _t"经验：100000  星券：100",
	show_fin_taskid = 3182,
}

_M[17] = 
{
	achi_id  = 5031,--魔盒合成，完成任务167
	quest_id = 7647,
	award	 = _t"经验：200000  星券：50",
	show_fin_taskid = 167,
}

_M[18] = 
{
	achi_id  = 5029,--魔盒拆分，15
	quest_id = 7648,
	award	 = _t"经验：30000  星券：50",
	show_level = 15,
}

_M[19] = 
{
	achi_id  = 5054,--圣衣5件，59
	quest_id = 7689,
	award	 = _t"经验：600000  星券：100",
	show_level = 59,
}

_M[20] = 
{
	achi_id  = 5024,--职业切换，59
	quest_id = 7649,
	award	 = _t"经验：150000  星券：50",
	show_level = 59,
}

_M[21] = 
{
	achi_id  = 5055,--星力值3000，50
	quest_id = 7691,
	award	 = _t"经验：300000  星券：100",
	show_level = 50,
}

_M[22] = 
{
	achi_id  = 5033,--首次竞拍成功，50
	quest_id = 7650,
	award	 = _t"经验：400000  星券：50",
	show_level = 50,
}

_M[23] = 
{
	achi_id  = 5018,--夺旗！阿提卡，40
	quest_id = 7651,
	award	 = _t"经验：400000  星券：200",
	show_level = 40,
}

_M[24] = 
{
	achi_id  = 5023,--英雄竞技场，40
	quest_id = 7652,
	award	 = _t"经验：400000  星券：50",
	show_level = 40,
}

_M[25] = 
{
	achi_id  = 5061,--试炼幻境，40
	quest_id = 9333,
	award	 = _t"经验：400000  星券：50",
	show_level = 40,
}

_M[26] = 
{
	achi_id  = 5019,--诛杀邪恶，35
	quest_id = 7653,
	award	 = _t"经验：300000  星券：200",
	show_level = 35,
}

_M[27] = 
{
	achi_id  = 5053,--星铸到5级
	quest_id = 7690,
	award	 = _t"经验：200000  星券：100",
	show_level = 35,
}

_M[28] = 
{
	achi_id  = 5034,--符文镶嵌，35
	quest_id = 7654,
	award	 = _t"经验：300000  星券：50",
	show_level = 35,
}

_M[29] = 
{
	achi_id  = 5032,--生产学习，30
	quest_id = 7655,
	award	 = _t"经验：150000  星券：50",
	show_level = 30,
}

_M[30] = 
{
	achi_id  = 5028,--第二套圣衣，30
	quest_id = 7656,
	award	 = _t"经验：300000  星券：200",
	show_level = 30,
}

_M[31] = 
{
	achi_id  = 5015,--十二宫危机，20
	quest_id = 7657,
	award	 = _t"经验：100000  星券：100",
	show_level = 20,
}

_M[32] = 
{
	achi_id  = 5036,--开启双倍经验，20
	quest_id = 7658,
	award	 = _t"经验：50000  星券：50",
	show_level = 20,
}

_M[33] = 
{
	achi_id  = 5062,--收集10件青铜圣衣，70级
	quest_id = 9350,
	award	 = _t"经验：7000000  星券：150",
	show_level = 70,
}

_M[34] = 
{
	achi_id  = 5063,--十件普通青铜圣衣星铸到满级，80
	quest_id = 9351,
	award	 = _t"经验：30000000  星券：500",
	show_level = 80,
}

_M[35] = 
{
	achi_id  = 5064,--一件五小强圣衣星铸到17级，75
	quest_id = 9352,
	award	 = _t"经验：20000000  星券：400",
	show_level = 75,
}

_M[36] = 
{
	achi_id  = 5083,--一件黑暗圣衣星铸到16级，75
	quest_id = 9405,
	award	 = _t"经验：20000000  星券：400",
	show_level = 75,
}

_M[37] = 
{
	achi_id  = 5065,--10件白银圣衣收集，75
	quest_id = 9353,
	award	 = _t"经验：30000000  星券：400",
	show_level = 75,
}

_M[38] = 
{
	achi_id  = 5085,--20件白银圣衣收集，95
	quest_id = 9525,
	award	 = _t"经验：80000000  星券：800",
	show_level = 95,
}

_M[39] = 
{
	achi_id  = 5066,--初中阶任一白银圣衣星铸到达满级，75
	quest_id = 9354,
	award	 = _t"经验：10000000  星券：300",
	show_level = 75,
}

_M[40] = 
{
	achi_id  = 5067,--高阶任一白银圣衣星铸到达满级，85
	quest_id = 9355,
	award	 = _t"经验：40000000  星券：500",
	show_level = 85,
}

_M[41] = 
{
	achi_id  = 5069,--任意黄金圣衣星铸等级达到20，80
	quest_id = 9357,
	award	 = _t"经验：20000000  星券：800",
	show_level = 80,
}

_M[42] = 
{
	achi_id  = 5072,--小宇宙星力值达到5000，60
	quest_id = 9360,
	award	 = _t"经验：2000000  星券：100",
	show_level = 60,
}

_M[43] = 
{
	achi_id  = 5073,--小宇宙星力值达到8000，70
	quest_id = 9361,
	award	 = _t"经验：7000000  星券：150",
	show_level = 70,
}

_M[44] = 
{
	achi_id  = 5074,--小宇宙星力值达到13500，80
	quest_id = 9362,
	award	 = _t"经验：20000000  星券：200",
	show_level = 80,
}

_M[45] = 
{
	achi_id  = 5075,--小宇宙星力值达到19000，90
	quest_id = 9363,
	award	 = _t"经验：60000000  星券：300",
	show_level = 90,
}

_M[46] = 
{
	achi_id  = 5076,--守护星修行战力达到1500，75
	quest_id = 9364,
	award	 = _t"经验：10000000  星券：100",
	show_level = 75,
}

_M[47] = 
{
	achi_id  = 5077,--守护星修行战力达到4000，85
	quest_id = 9365,
	award	 = _t"经验：40000000  星券：150",
	show_level = 85,
}

_M[48] = 
{
	achi_id  = 5078,--守护星修行战力达到6000，90
	quest_id = 9366,
	award	 = _t"经验：60000000  星券：200",
	show_level = 90,
}

_M[49] = 
{
	achi_id  = 5079,--装备聚能战力达到6000，60
	quest_id = 9399,
	award	 = _t"经验：2500000  星券：100",
	show_level = 60,
}

_M[50] = 
{
	achi_id  = 5080,--装备聚能战力达到8000，70
	quest_id = 9400,
	award	 = _t"经验：8000000  星券：150",
	show_level = 70,
}

_M[51] = 
{
	achi_id  = 5081,--装备聚能战力达到12000，80
	quest_id = 9401,
	award	 = _t"经验：20000000  星券：200",
	show_level = 80,
}

_M[52] = 
{
	achi_id  = 5082,--装备聚能战力达到15000，90
	quest_id = 9402,
	award	 = _t"经验：60000000  星券：300",
	show_level = 90,
}

_M[53] = 
{
	achi_id  = 5068,--黄金圣衣6件，90
	quest_id = 9526,
	award	 = _t"经验：60000000  星券：800",
	show_level = 90,
}

_M[54] = 
{
	achi_id  = 5086,--黄金圣衣全收集，95
	quest_id = 9356,
	award	 = _t"经验：90000000  星券：1800",
	show_level = 95,
}

_M[55] = 
{
	achi_id  = 5022,--加入或创建军团，12
	quest_id = 7659,
	award	 = _t"经验：30000  星券：50",
	show_level = 12,
}

_M[56] = 
{
	achi_id  = 5059,--获得宠物，38
	quest_id = 8783,
	award	 = _t"经验：300000  星券：200",
	show_level = 38,
}

_M[57] = 
{
	achi_id  = 5060,--宠物化生，38
	quest_id = 8786,
	award	 = _t"经验：300000  星券：200",
	show_level = 38,
}

_M[58] = 
{
	achi_id  = 5084,--师徒说明，12
	quest_id = 9486,
	award	 = _t"经验：30000  星券：25",
	show_level = 12,
}

_M[59] = 
{
	achi_id  = 5058,--推广人
	quest_id = 8344,
	award	 = _t"经验：300000  星券：100",
	show_level = 30,
}

_M[60] = 
{
	achi_id  = 5095,--黄金激活码
	quest_id = 10511,
	award	 = _t"经验：300000  星券：100",
	show_level = 30,
}

_M[61] = 
{
	achi_id  = 5035,--装备一次称号，获得第一个称号
	quest_id = 7660,
	award	 = _t"经验：30000  星券：50",
	show_level = 12,
}

_M[62] = 
{
	achi_id  = 5052,--绑定密保卡
	quest_id = 7675,
	award	 = _t"经验：30000  星券：500",
	show_level = 12,
}



