--------------------------------------------
-- 声望相关配置
-- Created by Fengbo

local REPU_ZONE		= 1
local REPU_PERSON 	= 2
local REPU_BATTLE 	= 3


-------------------
-- 声望分类名称
type_config =
{
	[REPU_ZONE] 	= _t"世界",
	[REPU_PERSON] 	= _t"角色",
	[REPU_BATTLE] 	= _t"战场",
}


-------------------
-- 声望数据
-- [repu_intro]		声望介绍
-- [place_title]	所在地标题
-- [skill_title]	技能/相关NPC标题
-- [method_title]	提高声望方法标题
-- [place_content]	所在地内容
-- [skill_content]	技能/相关NPC内容
-- [method_content]	提高声望方法内容
-- [item_info] 		可购买物品的信息配置
--		[intro]		购买物品介绍
--		[list]		各个级别物品信息列表, grade为区间声望区间索引, id_list可以购买的物品id列表
--[[
	[2] =
	{
		repu_intro	= "声望介绍",
		place_title = "所在地",
		skill_title = "技能",
		method_title = "提高声望方法标题",
		place_content = "所在地:${npc(id,name)}",
		skill_content = "${pos(x,y,z,mapId,name)}",
		method_content= "${npc(id)}",
		item_info =
		{
			intro = "介绍:${pos(x,y,z,mapId,name)}",
			list=
			{
				{grade = 3, id_list = {12136,12137,}, },
				{grade = 4, id_list = {4896,4901,}, },
				{grade = 5, id_list = {20151,}, },
			}
		}
	},
]]--


repu_data =
{
	[2] =
	{
		repu_intro	= _t"圣域外围圣斗士的主要聚集区，庄严而大气。其中分布着一些与圣域相关的组织。",
		place_title = _t"所在地",
		method_title = _t"声望获取",
		place_content = _t"圣域",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(-234,351,311,2,'维布拉努斯')}处购买物品",
			list=
			{
				{grade = 3, id_list = {12136,12137,29142}, },
				{grade = 4, id_list = {4896,4901,35509}, },
				{grade = 5, id_list = {20151,}, },
			}
		}
	},

	[3] =
	{
		repu_intro	= _t"古拉杜财团所在城市。因为全球最大财团在这里，所以很繁华。",
		place_title = _t"所在地",
		method_title = _t"声望获取",
		place_content = _t"银河竞技场",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(203,317,292,4,'今井宗久')}处购买物品",
			list=
			{
				{grade = 3, id_list = {11674,12138,12139,}, },
				{grade = 4, id_list = {4906,}, },
				{grade = 5, id_list = {12205,}, },
			}
		}
	},

	[4] =
	{
		repu_intro	= _t"紫龙、春丽和庐山的圣斗士候补生一起生活的地方，依然保留了中国古代民居的特点。",
		place_title = _t"所在地",
		method_title = _t"声望获取",
		place_content = _t"庐山",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(-228,319,-116,3,'卓王孙')}处购买物品",
			list=
			{
				{grade = 3, id_list = {12140,12141}, },
				{grade = 4, id_list = {12194,4911,11928,35504}, },
				{grade = 5, id_list = {12195,}, },
			}
		}
	},

	[5] =
	{
		repu_intro	= _t"这里曾经是艾欧罗斯陨落的地方，也是通往朱利安宅邸的必经之路。",
		place_title = _t"所在地",
		method_title = _t"声望获取",
		place_content = _t"遗忘之路",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(0,308,-165,5,'凯乌斯')}处购买物品",
			list=
			{
				{grade = 3, id_list = {12142,12143,}, },
				{grade = 4, id_list = {12154,11964,}, },
				{grade = 5, id_list = {20153,}, },
			}
		}
	},

	[6] =
	{
		repu_intro	= _t"就好像它的名字一样，这是个残酷的世界，活下去的人心中只有憎恨……",
		place_title = _t"所在地",
		method_title = _t"声望获取",
		place_content = _t"死亡皇后岛",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(-133,365,-143,6,'宗巴努赞')}处购买物品",
			list=
			{
				{grade = 3, id_list = {12144,12145}, },
				{grade = 4, id_list = {11925,11929,12216}, },
				{grade = 5, id_list = {20152,}, },
			}
		}
	},

	[7] =
	{
		repu_intro	= _t"冰河的修行地，终日被白雪覆盖的广袤大陆，传说其上的冰层已经积蓄了千年。白鸟圣衣就深埋在横贯这片大陆的永久冰壁中。卡妙曾在这里训练冰河和艾尔扎克运用冰冻的力量战斗。",
		place_title = _t"所在地",
		method_title = _t"声望获取",
		place_content = _t"东西伯利亚",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(-235,297,336,7,'阿辽莎')}处购买物品",
			list=
			{
				{grade = 3, id_list = {12146,12147}, },
				{grade = 4, id_list = {12155,11933,11937,35503}, },
				{grade = 5, id_list = {}, },
			}
		}
	},

	[8] =
	{
		repu_intro	= _t"海皇波塞冬的海皇要塞，相传是第一次圣战时被雅典娜和她的圣斗士击沉。虽然位处深海，但是由于七海支柱的支撑，而保持着一些陆地上的风貌。",
		place_title = _t"所在地",
		method_title = _t"声望获取",
		place_content = _t"亚特兰蒂斯",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(-316,357,-100,8,'吉贝尔')}处购买物品",
			list=
			{
				{grade = 3, id_list = {12148,12149}, },
				{grade = 4, id_list = {12156,11941,11945,44123}, },
				{grade = 5, id_list = {12197}, },
			}
		}
	},

	[9] =
	{
		repu_intro	= _t"瞬的修行地，在这里通过牺牲仪式获得了仙女座圣衣。仙女岛植被稀少，风化严重，环境恶劣，昼夜温差非常大，岛屿的正中有一座正在活动的塔尔塔罗斯火山，据说是通向地狱的门户。",
		place_title = _t"所在地",
		method_title = _t"声望获取",
		place_content = _t"仙女岛",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(-319,316,-144,9,'堂洛甫斯')}处购买物品",
			list=
			{
				{grade = 3, id_list = {12150,12151}, },
				{grade = 4, id_list = {12157,11932,12206}, },
				{grade = 5, id_list = {11719}, },
			}
		}
	},

	[10] =
	{
		repu_intro	= _t"潘多拉的家乡。原本是个安静祥和的城堡。十三年前因为哈迪斯灵魂的出生，城堡附近的生物都死绝，成为一座死城。如今这里被哈迪斯的结界笼罩着，一般人无法靠近。",
		place_title = _t"所在地",
		method_title = _t"声望获取",
		place_content = _t"海因斯坦堡",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(144,299,329,10,'克莱因丁斯特')}处购买物品",
			list=
			{
				{grade = 3, id_list = {12152,12153}, },
				{grade = 4, id_list = {12158,11936}, },
				{grade = 5, id_list = {}, },
			}
		}
	},

	[13] =
	{
		repu_intro	= _t"天鹰座白银圣斗士，天马座星矢的师傅。其洞察力十分出色，是一位相当优秀的女战士，性格冷静沉着。",
		place_title = _t"所在地",
		skill_title = _t"绝技",
		method_title = _t"声望获取",
		place_content = _t"圣域",
		skill_content = _t"鹰爪闪光",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(-235,350,349,2,'狄特里芙')}处购买物品",
			list=
			{
				{grade = 3, id_list = {}, },
				{grade = 4, id_list = {14031,12214,}, },
				{grade = 5, id_list = { }, },
			}
		}
	},

	[14] =
	{
		repu_intro	= _t"与星矢争夺天马座圣衣的卡西欧士的师傅，在丑陋的面具下隐藏的是天使般美丽的容颜。",
		place_title = _t"所在地",
		skill_title = _t"绝技",
		method_title = _t"声望获取",
		place_content = _t"圣域",
		skill_content = _t"雷鸣钩爪",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(-235,350,349,2,'狄特里芙')}处购买物品",
			list=
			{
				{grade = 3, id_list = {}, },
				{grade = 4, id_list = {14032,12215,}, },
				{grade = 5, id_list = {}, },
			}
		}
	},

	[15] =
	{
		repu_intro	= _t"拥有强大的念力，亦是世上唯一拥有修补圣衣能力的人。是极富正义与智慧的黄金圣斗士。",
		place_title = _t"所在地",
		skill_title = _t"绝技",
		method_title = _t"声望获取",
		place_content = _t"圣域",
		skill_content = _t"星光灭绝",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(-236,350,352,2,'荷拉斯')}处购买物品",
			list=
			{
				{grade = 3, id_list = {}, },
				{grade = 4, id_list = {11665,4941,11940,}, },
				{grade = 5, id_list = {22865, }, },
			}
		}
	},

	[16] =
	{
		repu_intro	= _t"守护金牛宫的黄金圣斗士，号称「黄金野牛」。防御力很强，而且善于躲闪。",
		place_title = _t"所在地",
		skill_title = _t"绝技",
		method_title = _t"声望获取",
		place_content = _t"圣域",
		skill_content = _t"巨型号角",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(-236,350,356,2,'古利亚斯')}处购买物品",
			list=
			{
				{grade = 3, id_list = {}, },
				{grade = 4, id_list = {11688,11944,14033,}, },
				{grade = 5, id_list = {22866, }, },
			}
		}
	},

	[17] =

	{
		repu_intro	= _t"守护双子宫的黄金圣斗士。谜一样的男人。",
		place_title = _t"所在地",
		skill_title = _t"绝技",
		method_title = _t"声望获取",
		place_content = _t"圣域",
		skill_content = _t"魔皇幻胧拳",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(-236,350,360,2,'克西弗斯')}处购买物品",
			list=
			{
				{grade = 3, id_list = { }, },
				{grade = 4, id_list = {11728,11948,44124}, },
				{grade = 5, id_list = {22867, }, },
			}
		}
	},


	[18] =
	{
		repu_intro	= _t"守卫巨蟹宫的黄金圣斗士。嗜好杀戮，为了所谓的惩罚邪恶而不计正义，不惜伤害无辜。",
		place_title = _t"所在地",
		skill_title = _t"绝技",
		method_title = _t"声望获取",
		place_content = _t"圣域",
		skill_content = _t"积尸气冥界波",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(-236,350,364,2,'阿高迪约')}处购买物品",
			list=
			{
				{grade = 3, id_list = { }, },
				{grade = 4, id_list = {11727,11952,}, },
				{grade = 5, id_list = {22868, }, },
			}
		}
	},

	[19] =
	{
		repu_intro	= _t"守护狮子宫黄金圣斗士，懂得多种光速拳，被称为“黄金狮子”。",
		place_title = _t"所在地",
		skill_title = _t"绝技",
		method_title = _t"声望获取",
		place_content = _t"圣域",
		skill_content = _t"闪电光速拳",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(-236,350,352,2,'荷拉斯')}处购买物品",
			list=
			{
				{grade = 3, id_list = { }, },
				{grade = 4, id_list = {11670,11956,}, },
				{grade = 5, id_list = {22869, }, },
			}
		}
	},


	[20] =

	{
		repu_intro	= _t"守护处女宫的黄金圣斗士，是佛祖释迦牟尼的转生，被称为“最接近神的人”。",
		place_title = _t"所在地",
		skill_title = _t"绝技",
		method_title = _t"声望获取",
		place_content = _t"圣域",
		skill_content = _t"天舞宝轮",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(-236,350,356,2,'古利亚斯')}处购买物品",
			list=
			{
				{grade = 3, id_list = {12208,}, },
				{grade = 4, id_list = {14037,35506,}, },
				{grade = 5, id_list = {22870, }, },
			}
		}
	},

	[21] =
	{
		repu_intro	= _t"守护天秤座的黄金圣斗士，紫龙的师傅。受雅典娜之命来监视冥界一百零八魔星而常年端坐于庐山五老峰，是雅典娜最信任的圣斗士。",
		place_title = _t"所在地",
		skill_title = _t"绝技",
		method_title = _t"声望获取",
		place_content = _t"圣域",
		skill_content = _t"庐山百龙霸",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(-236,350,360,2,'克西弗斯')}处购买物品",
			list=
			{
				{grade = 3, id_list = {12210,}, },
				{grade = 4, id_list = {11658,12212}, },
				{grade = 5, id_list = {22871, }, },
			}
		}
	},

	[22] =
	{
		repu_intro	= _t"守护圣域十二宫第八宫天蝎宫的圣斗士，十二黄金圣斗士中第二小的一位，性格最接近普通人，在圣域有“希腊的阳光”之称。",
		place_title = _t"所在地",
		skill_title = _t"绝技",
		method_title = _t"声望获取",
		place_content = _t"圣域",
		skill_content = _t"猩红毒针",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(-236,350,364,2,'阿高迪约')}处购买物品",
			list=
			{
				{grade = 3, id_list = {}, },
				{grade = 4, id_list = {11698,11960,14035,}, },
				{grade = 5, id_list = {22872, }, },
			}
		}
	},

	[23] =
	{
		repu_intro	= _t"狮子座黄金圣斗士艾欧里亚的哥哥，教皇史昂钦定的教皇继任者。其英勇仁厚的身姿为圣斗士们所尊敬。",
		place_title = _t"所在地",
		skill_title = _t"绝技",
		method_title = _t"声望获取",
		place_content = _t"圣域",
		skill_content = _t"黄金之箭",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(-236,350,352,2,'荷拉斯')}处购买物品",
			list=
			{
				{grade = 3, id_list = {12207,}, },
				{grade = 4, id_list = {4916,12217}, },
				{grade = 5, id_list = {22873, }, },
			}
		}
	},

	[24] =
	{
		repu_intro	= _t"守护摩羯宫的黄金圣斗士，是让十三年前逃亡的艾俄罗斯濒临死亡的人。",
		place_title = _t"所在地",
		skill_title = _t"绝技",
		method_title = _t"声望获取",
		place_content = _t"圣域",
		skill_content = _t"圣剑",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(-236,350,356,2,'古利亚斯')}处购买物品",
			list=
			{
				{grade = 3, id_list = {}, },
				{grade = 4, id_list = {11704,4921,14034,}, },
				{grade = 5, id_list = {22874, }, },
			}
		}
	},

	[25] =
	{
		repu_intro	= _t"守护水瓶宫的黄金圣斗士，是冷傲决绝的冰之圣斗士，有「水与冰的魔法师」之称。",
		place_title = _t"所在地",
		skill_title = _t"绝技",
		method_title = _t"声望获取",
		place_content = _t"圣域",
		skill_content = _t"曙光女神之宽恕",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(-236,350,360,2,'克西弗斯')}处购买物品",
			list=
			{
				{grade = 3, id_list = {12209,}, },
				{grade = 4, id_list = {11709,12213}, },
				{grade = 5, id_list = {22875, }, },
			}
		}
	},

	[26] =
	{
		repu_intro	= _t"守护十二宫最后一宫的黄金圣斗士，其美貌也是在88名圣斗士中首屈一指，有「与日月争辉的美之战士」之称。",
		place_title = _t"所在地",
		skill_title = _t"绝技",
		method_title = _t"声望获取",
		place_content = _t"圣域",
		skill_content = _t"魔宫玫瑰",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(-236,350,364,2,'阿高迪约')}处购买物品",
			list=
			{
				{grade = 3, id_list = {12211,}, },
				{grade = 4, id_list = {11733,14036,35505,}, },
				{grade = 5, id_list = {22876,}, },
			}
		}
	},

	[51] =
	{
		repu_intro	= _t"信仰之光",
		place_title = _t"声望作用",
		method_title = _t"相关NPC",
		place_content = _t"购买珠链",
		method_content= "${npc(20313)}",
		item_info =
		{
		intro = _t"声望达到一定级别可在${pos(-239,358,306,2,'西弗勒斯')}处购买珠链",
			list=
			{
				{grade = 2, id_list = {20885,}, },
				{grade = 3, id_list = {20155,}, },
				{grade = 4, id_list = {20156,}, },
			}
		}
	},

[52] =
	{
		repu_intro	= _t"守护星座的光芒值,达到一定光度后可以召唤守护星子或守护星娘助战",
		place_title = _t"所在地",
		place_content = _t"圣域",
		method_title= _t"日常任务",
		method_content= "${npc(22955)}",
		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(-278,343,220,2,'守护星军需官')}处购买物品",
			list=
			{
				{grade = 2, id_list = {18124,18129,18075,18076,18167,18237}, },
				{grade = 3, id_list = {18168,18238}, },
				{grade = 4, id_list = {18125,18130,18169,18239}, },
				{grade = 5, id_list = {18126,18131,18170,18240}, },
			}
		}
	},
	[53] =
	{
	    repu_intro	= _t"传承值",
		place_title = _t"声望作用",
		method_title = _t"相关NPC",
		place_content = _t"购买传承礼包",
		method_content= "${npc(25893)}",
		item_info =
		{
		    intro = _t"可在${pos(-264,356,309,2,'传承商店')}处购买礼包",
			list=
			{
			}
		}
	},
	[71] =
	{
	    repu_intro	= _t"女神赐予圣斗士每周105点神战点，神战点可用来参加部分活动和接取战场任务",
		place_title = _t"刷新时间",
		method_title = _t"相关NPC",
		place_content = _t"每周六六点",
		method_content= "${npc(29960)}",
		item_info =
		{
		    intro = _t"可在${pos(-204,337,16,2,'神战使者安迪娜')}处使用神战点",
			list=
			{
			}
		}
	},
	[75] =
	{
	    repu_intro	= _t"通关[副本]七大洋巨柱(前)、[副本]七大洋巨柱(后)和[英雄]难度的副本可获得英雄点",
		place_title = _t"开放等级",
		method_title = _t"",
		place_content = _t"80级",
		method_content= "",
		item_info =
		{
		    intro = _t"达到一定值时可参加对应[英雄]副本",
			list=
			{
			    {grade = 1, id_list = {31284,31285}, },
				{grade = 2, id_list = {31235,31236}, },
				{grade = 3, id_list = {34199,34200}, },
                {grade = 4, id_list = {41948}, },
			}
		}
	},
	[77] =
	{
	    repu_intro	= _t"使用女神的恩赐，可以获得女神的恩赐声望",
		place_title = _t"",
		method_title = _t"相关NPC",
		place_content = _t"",
		method_content= "${npc(31619)}",
		item_info =
		{
		    intro = _t"可在${pos(-227,337,66,2, '女神恩赐使者柯蒂丝')}处兑换",
			list=
			{

			}
		}
	},
	[86] =
	{
	    repu_intro	= _t"师徒奖励，培养徒弟出师就可以在NPC处领取奖励",
		place_title = _t"",
		method_title = _t"相关NPC",
		place_content = _t"",
		method_content= "${npc(34576)}",
		item_info =
		{
		    intro = _t"可在${npc(34576)}处兑换",
			list=
			{

			}
		}
	},
	[95] =
	{
	    repu_intro	= _t"情缘点，结为夫妻的玩家特有的声望奖励，通过每日夫妻任务提升；玩家离婚后情缘点被清空；但已经换得的称号不会被清空",
		place_title = _t"",
		method_title = _t"相关NPC",
		place_content = _t"",
		method_content= "${npc(38333)}",
		item_info =
		{
		    intro = _t"可在${npc(38333)}处兑换夫妻特有称号",
			list=
			{
			  {grade = 1, id_list = {38346,38347,38348,38349,38350}, },
				{grade = 2, id_list = {38351,38352,39670}, },
			}
		}
	},

	[96] =
	{
		repu_intro	= _t"亡者才能进入的国度，生者必须要突破到第八感才能来到这个世界。",
		place_title = _t"所在地",
		method_title = _t"声望获取",
		place_content = _t"冥界地狱",
		method_content= _t"主支线任务",

		item_info =
		{
			intro = _t"声望达到一定级别可在${pos(-93.74,271.53,-785.2,11,'古利德')}处购买物品",
			list=
			{
				{grade = 3, id_list = {3147,41126}, },
				{grade = 4, id_list = {2212,41127}, },
				{grade = 5, id_list = {}, },
			}
		}
	},
}


-------------------
-- 声望路径
-- [type]声望类型
-- [name]声望目录名称, 如果没有目录此项不用填写
-- [list]声望id列表
repu_dir =
{
	{
		type = REPU_PERSON,
		name = _t"黄金圣斗士",
		list = {15,16,17,18,19,20,21,22,23,24,25,26},
	},
	{
		type = REPU_PERSON,
		name = _t"白银圣斗士",
		list = {13,14},
	},
	{
		type = REPU_ZONE,
		name = _t"区域",
		list = {2,3,4,5,6,7,8,9,10,96},
	},
	{
		type = REPU_ZONE,
		name = _t"个人",
		list = {51,52,53,71,75,77,86,95},
	},
}





--[[
个人声望格式化配置，用于配置获得声望和失去声望时的系统提示信息。
--------------------------------------------------------
配置查找的顺序为，优先查找对应声望id的配置，若没有，则使用default的配置。
配置项格式如下：
[29] = -- 声望ID
{
	get = "获得${name}${point}点",			-- 获得声望时显示的信息
	lose = "失去了${name}${point}点",		-- 失去声望时显示的信息
},

在配置的字符串中可以使用以下通配符：
${name}		elementdata模板中配置的声望名称
${point}	获得/失去的数量，该数值一定是一个正数。
			注：可以对其进行一些表达式计算，例如 ${point*2} ${point/2} ${point+2} 等
${total}	在计算过本次声望获得/失去后，声望的总值

若希望在获得/失去某项声望时不显示提示，可将对应项设置为空字符串：""
]]--
formatters =
{
	default =
	{
		get = _t"获得 ${name}声望 ${point}点",
		lose = _t"失去 ${name}声望 ${point}点",
	},

	[1] =
	{
		get = _t"获得${name}${point}点",
		lose = "",
	},


	[29] =
	{
		get = _t"获得${name}${point/100}点",
		lose = _t"生产消耗了${name}${point/100}点",
	},

	[33] =
	{
		get = "",
		lose = _t"刷新<女神的圣斗士>故事消耗了${point}点日常刷新次数",
	},

	[34] =
	{
		get = _t"今日您还可接取<命运的试炼>任务${total}次",
		lose = _t"今日您还可接取<命运的试炼>任务${total}次",
	},
	[35] =
	{
		get = "",
		lose = "",
	},
	[36] =
	{
		get = "",
		lose = "",
	},
	[37] =
	{
		get = "",
		lose = "",
	},
	[38] =
	{
		get = _t"获得${name}${point}点",
		lose = _t"失去${name}${point}点",
	},
	[47] =
	{
		get = _t"获得${name}${point}点",
		lose = _t"失去了${name}${point}点",
	},
	[49] =
	{
		get = _t"获得${name}${point}点",
		lose = _t"失去${name}${point}点",
	},
	[11] =
	{
		get = "",
		lose = "",
	},
	[12] =
	{
		get = "",
		lose = "",
	},
	[40] =
	{
		get = "",
		lose = "",
	},
	[62] =
	{
		get = "",
		lose = "",
	},
	[63] =
	{
		get = "",
		lose = "",
	},
	[54] =
	{
		get = "",
		lose = "",
	},
	[64] =
	{
		get = "",
		lose = "",
	},
	[65] =
	{
		get = "",
		lose = "",
	},
	[66] =
	{
		get = _t"今日您还可接取<圣斗士之路>任务${50-total}次",
		lose = "",
	},
	[68] =
	{
		get = "",
		lose = "",
	},
	[69] =
	{
		get = "",
		lose = "",
	},
	[70] =
	{
		get = "",
		lose = "",
	},
	[71] =
	{
		get = _t"获得${name}${point}点",
		lose = _t"失去${name}${point}点",
	},
	[74] =
	{
		get = "",
		lose = "",
	},
	[75] =
	{
		get = _t"获得${name}${point}点",
		lose = _t"失去${name}${point}点",
	},
	[77] =
	{
		get = _t"获得${name}${point}点",
		lose = _t"失去${name}${point}点",
	},
	[78] =
	{
		get = "",
		lose = "",
	},
	[79] =
	{
		get = "",
		lose = "",
	},
	[80] =
	{
		get = "",
		lose = "",
	},
	[81] =
	{
		get = "",
		lose = "",
	},
	[82] =
	{
		get = "",
		lose = _t"刷新<女神的圣斗士>故事消耗了${point}点命运刷新次数",
	},
	[84] =
	{
		get = _t"获得充值积分${point}点",
		lose = _t"消费充值积分${point}点",
	},
	[85] =
	{
		get = "",
		lose = "",
	},
	[88] =
	{
		get = "",
		lose = "",
	},
	[90] =
	{
		get = "",
		lose = "",
	},

}

--[[
个人增量声望格式化配置，用于配置获得个人增量声望和失去个人增量声望时的系统提示信息。
--------------------------------------------------------
配置查找的顺序为，优先查找对应声望id的配置，若没有，则使用default的配置。
配置项格式如下：
full_0 = -- 增量声望ID
{
	get = "测试个人增量声望(总)提示增加${point}点",			-- 获得声望时显示的信息
	lose = "测试个人增量声望(总)提示减少${point}点",		-- 失去声望时显示的信息
},

其中增量声望ID由前缀和数字组成，前缀可以为下面这些：
full_ 		增量声望(总)
day_ 		增量声望(日)
week_ 		增量声望(周)
month_ 		增量声望(月)

在配置的字符串中可以使用以下通配符：
${point}	获得/失去的数量，该数值一定是一个正数。
			注：可以对其进行一些表达式计算，例如 ${point*2} ${point/2} ${point+2} 等

若希望在获得/失去某项声望时不显示提示，可将对应项设置为空字符串：""
]]--
inc_formatters =
{
	default =
	{
		get = "",
		lose = "",
	},

	full_0 =
	{
		get = "",
		lose = "",
	},

	day_0 =
	{
		get = "",
		lose = "",
	},

	week_0 =
	{
		get = "",
		lose = "",
	},

	month_0 =
	{
		get = "",
		lose = "",
	},
}

--[[
军团声望格式化配置，用于配置获得声望和失去声望时的系统提示信息。
--------------------------------------------------------
配置方式和上面的个人声望类似，
在配置的字符串中可以使用以下通配符：
${name}		elementdata模板中配置的军团声望名称
${league}	军团名称
${point}	获得/失去的数量，该数值一定是一个正数。
			注：可以对其进行一些表达式计算，例如 ${point*2} ${point/2} ${point+2} 等
${total}	在计算过本次声望获得/失去后，声望的总值

若希望在获得/失去某项声望时不显示提示，可将对应项设置为空字符串：""
]]--
league_formatters =
{
	default =
	{
		get = "",
		lose = "",
	},

	[1] =
	{
		get = _t"军团获得${name}${point}点",
		lose = _t"军团失去 ${name} ${point}点",
	},

	[2] =
	{
		get = _t"军团获得${name}${point}点",
		lose = _t"军团失去 ${name} ${point}点",
	},

	[3] =
	{
		get = _t"军团获得${name}${point}点",
		lose = _t"军团失去 ${name} ${point}点",
	},
	[4] =
	{
		get = _t"军团获得${name}${point}点",
		lose = _t"军团失去 ${name} ${point}点",
	},
	[11] =
	{
		get = _t"军团获得${name}${point}点",
		lose = _t"军团失去 ${name} ${point}点",
	},
	[12] =
	{
		get = "",
		lose = "",
	},
	[15] =
	{
		get = "",
		lose = "",
	},
}

--[[
军团增量声望格式化配置，用于配置获得军团增量声望和失去军团增量声望时的系统提示信息。
--------------------------------------------------------
配置查找的顺序为，优先查找对应声望id的配置，若没有，则使用default的配置。
配置项格式如下：
full_0 = -- 增量声望ID
{
	get = "测试军团增量声望(总)提示增加${point}点",			-- 获得声望时显示的信息
	lose = "测试军团增量声望(总)提示减少${point}点",		-- 失去声望时显示的信息
},

其中增量声望ID由前缀和数字组成，前缀可以为下面这些：
full_ 		增量声望(总)
day_ 		增量声望(日)
week_ 		增量声望(周)
month_ 		增量声望(月)

在配置的字符串中可以使用以下通配符：
${point}	获得/失去的数量，该数值一定是一个正数。
			注：可以对其进行一些表达式计算，例如 ${point*2} ${point/2} ${point+2} 等

若希望在获得/失去某项声望时不显示提示，可将对应项设置为空字符串：""
]]--
league_inc_formatters =
{
	default =
	{
		get = "",
		lose = "",
	},

	full_0 =
	{
		get = "",
		lose = "",
	},

	day_0 =
	{
		get = "",
		lose = "",
	},

	week_0 =
	{
		get = "",
		lose = "",
	},

	month_0 =
	{
		get = "",
		lose = "",
	},
}
