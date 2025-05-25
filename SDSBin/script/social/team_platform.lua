--[[ @i18n social ]]
local _t = require("i18n").context("social")
--------------------------------------------
-- 组队平台相关配置
-- Created by Fengbo
--[[
配置项完整格式如下：
[5637] = 	-- 模板ID，如果是副本，即副本配置的模板ID，如果是活动，则是活动的限次任务ID
{
	name = "测试副本1",					-- 显示名称
	prof_cfg = 							-- 守护星座配置
	{
		{4; min = 1, max = 3},		    -- 天龙配置
		{5; min = 1, max = 3},			-- 仙女配置
		{2,3,6; min = 1, max = 3},		-- 天马白鸟凤凰
	},
	max_count = 6,						-- 队伍最大人数上限（默认为6）
	max_level_range = 20,				-- 队伍最大等级差
	level_info = "20～30级",			-- 界面上显示的等级信息
	image = "background\\loading02.jpg",-- 界面使用的图片

	desc = "副本简介，blahblahblah",	-- 界面显示的简介

	difficulty = 3,						-- 界面显示使用的难度星级，取值0～10
	exclusive_task = {2091,},   		-- 这些任务进行中时，不显示这个排队项，仅客户端显示屏蔽，容易绕过
},
]]--

------------------------------------------
-- 副本自动组队配置
dungeons =
{
	------
    [6154] =
	{
		name = _t"圣战回忆",
		prof_cfg =
		{
			{4,2; min = 0, max = 6},
			{5,7; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"15级以上",
		image = "background\\loading02.jpg",
		desc = _t"回到前次圣战中的圣域，亲历上次圣战的艰苦战斗！",
		difficulty = 3,
	},

    ------
    [14138] =
	{
		name = _t"十风穴",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"35级以上",
		image = "background\\loading02.jpg",
		desc = _t"十风穴的战斗！",
		difficulty = 6,
	},
     -----
	[10324] =
	{
		name = _t"集结！十二宫危机",
		prof_cfg =
		{
			{4,2; min = 0, max = 6},
			{5,7; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"20级以上",
		image = "background\\loading02.jpg",
        desc = _t"圣域入口附近出现了大量冥王势力的卫兵。他们企图冲入圣域、企图摧毁雅典娜神像。需要圣斗士们去守卫圣域大门，守卫雅典娜神像！",
        difficulty = 3,
	},
	    --------
	[14689] =
	{
		name = _t"风暴！亚特兰蒂斯",
		prof_cfg =
		{
			{4,2; min = 0, max = 6},
			{5,7; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"25级以上",
		image = "background\\loading02.jpg",
        desc = _t"海啸频发，世界需要你们拯救！",
        difficulty = 3,
	},
    ------
    [15222] =
	{
		name = _t"黄金十二宫(始)",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"55级以上",
		image = "background\\loading02.jpg",
		desc = _t"十二宫的战斗！",
		difficulty = 6,
	},
	    ------
    [15535] =
	{
		name = _t"射手之心",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"45级以上",
		image = "background\\loading02.jpg",
		desc = _t"射手之心的战斗！",
		difficulty = 6,
	},
		------
	[23436] =
	{
		name = _t"深渊！魔星的末日",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"60级以上",
		image = "background\\loading02.jpg",
        desc = _t"冥王复苏，108魔星醒来，需要你们去将他们重新封印！",
        difficulty = 3,
	},
	     -----
	[18219] =
	{
		name = _t"重生！圣域镇魂歌",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"60级以上",
		image = "background\\loading02.jpg",
        desc = _t"圣斗士的灵魂正在被冥王的力量侵扰，无拯救他们！",
        difficulty = 3,
	},
		    ------
    [23379] =
	{
		name = _t"冰海神殿",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"70级以上",
		image = "background\\loading02.jpg",
		desc = _t"与女武神瓦尔基里战斗！",
		difficulty = 6,
	},
		    ------
    [23432] =
	{
		name = _t"七大洋巨柱(前)",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"80级以上",
		image = "background\\loading02.jpg",
		desc = _t"海洋大战开始了！",
		difficulty = 6,
	},
		    ------
    [23433] =
	{
		name = _t"七大洋巨柱(后)",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"80级以上",
		image = "background\\loading02.jpg",
		desc = _t"海洋大战开始了！",
		difficulty = 6,
	},
	     -----
	[25074] =
	{
		name = _t"危急！女神近卫军",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"60级以上",
		image = "background\\loading02.jpg",
        desc = _t"女神正处于危险之中，快去保卫她！",
        difficulty = 3,
	},
	     -----
	[25073] =
	{
		name = _t"大反攻！冰国邪神",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"60级以上",
		image = "background\\loading02.jpg",
        desc = _t"冰国的邪神洛基苏醒了，正在试图将世界变成冰之王国，拯救世界吧，勇士们！",
        difficulty = 3,
		exclusive_task = {7140,7141,}, 
	},
	------
    [25108] =
	{
		name = _t"黄金十二宫(续)",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"60级以上",
		image = "background\\loading02.jpg",
		desc = _t"十二宫的战斗！",
		difficulty = 6,
	},
	------
    [25845] =
	{
		name = _t"黄金十二宫(终)",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"68级以上",
		image = "background\\loading02.jpg",
		desc = _t"十二宫的战斗！",
		difficulty = 6,
	},
	------
    [25847] =
	{
		name = _t"黄金十二宫(余)",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"68级以上",
		image = "background\\loading02.jpg",
		desc = _t"十二宫的战斗！",
		difficulty = 6,
	},
	------
    [25970] =
	{
		name = _t"女神的挽歌(前)",
		prof_cfg =
		{
			{4; min = 1, max = 6},
			{5; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"90级以上",
		image = "background\\loading02.jpg",
		desc = _t"十二宫的战斗！",
		difficulty = 6,
	},
	------
    [25971] =
	{
		name = _t"女神的挽歌(后)",
		prof_cfg =
		{
			{4; min = 1, max = 6},
			{5; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"90级以上",
		image = "background\\loading02.jpg",
		desc = _t"十二宫的战斗！",
		difficulty = 6,
	},
	-----
	[138] =
	{
		name = _t"危急！纱织守护者",
		prof_cfg =
		{
			{4,2; min = 0, max = 6},
			{5,7; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"25级以上",
		image = "background\\loading02.jpg",
        desc = _t"女神正处于危险之中，快去保卫她！",
        difficulty = 3,
	},
	-----
	[24237] =
	{
		name = _t"危急！女神近卫军",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"60级以上",
		image = "background\\loading02.jpg",
        desc = _t"女神正处于危险之中，快去保卫她！",
        difficulty = 3,
	},
	-----
	[26733] =
	{
		name = _t"集结！十二宫危机",
		prof_cfg =
		{
			{4,2; min = 0, max = 6},
			{5,7; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"20级以上",
		image = "background\\loading02.jpg",
        desc = _t"圣域入口附近出现了大量冥王势力的卫兵。他们企图冲入圣域、企图摧毁雅典娜神像。需要圣斗士们去守卫圣域大门，守卫雅典娜神像！",
        difficulty = 3,
	},
	--------
	[26734] =
	{
		name = _t"风暴！亚特兰蒂斯",
		prof_cfg =
		{
			{4,2; min = 0, max = 6},
			{5,7; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"25级以上",
		image = "background\\loading02.jpg",
        desc = _t"海啸频发，世界需要你们拯救！",
        difficulty = 3,
	},
		-----
	[26732] =
	{
		name = _t"危急！纱织守护者",
		prof_cfg =
		{
			{4,2; min = 0, max = 6},
			{5,7; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"25级以上",
		image = "background\\loading02.jpg",
        desc = _t"女神正处于危险之中，快去保卫她！",
        difficulty = 3,
	},
	------
    [27799] =
	{
		name = _t"[英雄]十风穴",
		prof_cfg =
		{
			{4; min = 1, max = 6},
			{5; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"80级以上",
		image = "background\\loading02.jpg",
		desc = _t"[英雄]十风穴的战斗！",
		difficulty = 6,
	},
	    ------
    [26984] =
	{
		name = _t"[英雄]射手之心",
		prof_cfg =
		{
			{4; min = 1, max = 6},
			{5; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"80级以上",
		image = "background\\loading02.jpg",
		desc = _t"[英雄]射手之心的战斗！",
		difficulty = 6,
	},
	     -----
	[27731] =
	{
		name = _t"攻破！复仇者联盟",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"60级以上",
		image = "background\\loading02.jpg",
        desc = _t"冰国的邪神洛基苏醒了，正在与冥王，海皇还有堕落的白银密谋着什么，勇士们，就靠你们了！",
        difficulty = 3,
	},
	    ------
    [27607] =
	{
		name = _t"女神！仲夏的神祈",
		prof_cfg =
		{
			{4; min = 1, max = 6},
			{5; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"40级以上",
		image = "background\\loading02.jpg",
		desc = _t"[英雄]射手之心的战斗！",
		difficulty = 6,
	},
		    ------	
	[29325] =
	{
		name = _t"七夕！紫龙和春丽",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"40级以上",
		image = "background\\loading02.jpg",
		desc = _t"七夕之夜，黄泉之井发生了可怕的异动。就连奉命调查的紫龙也被困黄泉之井。春丽感应到紫龙的危机，不顾一切冲进了黄泉之井，并请求你帮助她救出紫龙。",
		difficulty = 3,
	},
		
		    ------	
    [29495] =
	{
		name = _t"[英雄]蓝冰堡",
		prof_cfg =
		{
			{4; min = 1, max = 6},
			{5; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 20,
		level_info = _t"100级以上",
		image = "background\\loading02.jpg",
		desc = _t"[英雄]蓝冰堡的战斗！",
		difficulty = 6,
	},
	     -----
	[29520] =
	{
		name = _t"觉醒！沙加的六道",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"30级以上",
		image = "background\\loading02.jpg",
		desc = _t"处女座的黄金圣斗士预感到不久的将来将有一场左右整个圣战的战斗发生在沙罗双树园，为了让更多的圣斗士可以尽早领悟第八感，他决定将这些圣斗士通过六道轮回送入到沙罗双树园的幻境，借此体验来领悟小宇宙的第八感。年轻的圣斗士！为了即将而来的圣战，勇敢的接受沙加的试炼吧！",
		difficulty = 3,
	},	
	
			    ------	
	[29903] =
	{
		name = _t"觉醒！沙加的六道",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"30级以上",
		image = "background\\loading02.jpg",
		desc = _t"处女座的黄金圣斗士预感到不久的将来将有一场左右整个圣战的战斗发生在沙罗双树园，为了让更多的圣斗士可以尽早领悟第八感，他决定将这些圣斗士通过六道轮回送入到沙罗双树园的幻境，借此体验来领悟小宇宙的第八感。年轻的圣斗士！为了即将而来的圣战，勇敢的接受沙加的试炼吧！",
		difficulty = 3,
	},
		
			    ------	
	[31448] =
	{
		name = _t"天枰！童虎的回忆",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"30级以上",
		image = "background\\loading02.jpg",
		desc = _t"二百多年前的某天，圣战前夕，原本寂静的天空被黑色的闪电划破，狂风中出现了一个让世人为之恐怖的身影——他就是冥王哈迪斯。分散在圣域附近巡逻的黄金圣斗士们立即前往他们的女神雅典娜所在地，圣战开始了……",
		difficulty = 3,
	},
		
			    ------	
	[31590] =
	{
		name = _t"天枰！童虎的回忆",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"60级以上",
		image = "background\\loading02.jpg",
		desc = _t"二百多年前的某天，圣战前夕，原本寂静的天空被黑色的闪电划破，狂风中出现了一个让世人为之恐怖的身影——他就是冥王哈迪斯。分散在圣域附近巡逻的黄金圣斗士们立即前往他们的女神雅典娜所在地，圣战开始了……",
		difficulty = 3,
	},


			    ------	
	[32248] =
	{
		name = _t"突破！天蝎的挑战",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"30级以上",
		image = "background\\loading02.jpg",
		desc = _t"冥界的力量逐渐复苏，在圣域被称为“希腊的阳光”的天蝎座米罗决定对新一代的圣斗士予以试炼。这位以猩红毒针闻名的黄金圣斗士会以怎样的方式来进行他的试炼？圣域新生一代的圣斗士都满怀期待……",
		difficulty = 3,
	},

	
				    ------	
	[32249] =
	{
		name = _t"突破！天蝎的挑战",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"60级以上",
		image = "background\\loading02.jpg",
		desc = _t"冥界的力量逐渐复苏，在圣域被称为“希腊的阳光”的天蝎座米罗决定对新一代的圣斗士予以试炼。这位以猩红毒针闻名的黄金圣斗士会以怎样的方式来进行他的试炼？圣域新生一代的圣斗士都满怀期待……",
		difficulty = 3,
	},
	
				    ------	
	[32542] =
	{
		name = _t"逼近！射手的危机",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"30级以上",
		image = "background\\loading02.jpg",
		desc = _t"死神达拿都斯察觉到一直徘徊在射手宫中的艾欧罗斯的灵魂，于是悄悄潜入射手宫之中，并利用强大的力量束缚了艾欧罗斯的小宇宙，准备将其拉入冥界深渊。危急时刻，女神雅典娜察觉到来自射手宫中的异变，为了阻止死神的阴谋，她立刻派遣勇敢的圣斗士们前往射手宫。",
		difficulty = 3,
	},
				    ------	
	[32543] =
	{
		name = _t"逼近！射手的危机",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"60级以上",
		image = "background\\loading02.jpg",
		desc = _t"死神达拿都斯察觉到一直徘徊在射手宫中的艾欧罗斯的灵魂，于是悄悄潜入射手宫之中，并利用强大的力量束缚了艾欧罗斯的小宇宙，准备将其拉入冥界深渊。危急时刻，女神雅典娜察觉到来自射手宫中的异变，为了阻止死神的阴谋，她立刻派遣勇敢的圣斗士们前往射手宫。",
		difficulty = 3,
	},
				    ------	
	[33166] =
	{
		name = _t"大雪！保卫圣诞树",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"30级以上",
		image = "background\\loading02.jpg",
		desc = _t"圣诞老人为人们准备了很多节日礼物，这本该是个欢乐的节日，但邪恶无处不在，一伙由海界和冥界组成的强盗正准备抢夺圣诞礼物，勇敢正义的少年们啊，快去帮助圣诞老人战胜邪恶，保卫我们的圣诞礼物吧！",
		difficulty = 3,
	},
				  ------
	[34565] =
	{
		name = _t"摩羯！修罗的剑道",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"30级以上",
		image = "background\\loading02.jpg",
		desc = _t"冥界势力趁着夜色准备入侵圣域，得知消息的圣斗士们立刻前往迎击冥界士兵。等到圣斗士们赶到，却惊讶地发现一个熟悉的身影已经守卫在那里。摩羯座黄金圣斗士修罗的灵魂仍然为保卫圣域骁勇的战斗着……",
		difficulty = 3,
	},
				    ------
	[34566] =
	{
		name = _t"摩羯！修罗的剑道",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"60级以上",
		image = "background\\loading02.jpg",
		desc = _t"冥界势力趁着夜色准备入侵圣域，得知消息的圣斗士们立刻前往迎击冥界士兵。等到圣斗士们赶到，却惊讶地发现一个熟悉的身影已经守卫在那里。摩羯座黄金圣斗士修罗的灵魂仍然为保卫圣域骁勇的战斗着……",
		difficulty = 3,
	},
			------
	[32471] =
	{
		name = _t"哀嚎！地狱奏鸣曲",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 120,
		level_info = _t"90级以上",
		image = "background\\loading02.jpg",
        desc = _t"经过不懈的努力，终于攻入冥界地狱，前方仍有残酷的战斗等着你！奋斗吧！勇士们。",
        difficulty = 3,
	},
			------
	[32048] =
	{
		name = _t"孵化！冥蝶巢穴",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 120,
		level_info = _t"90级以上",
		image = "background\\loading02.jpg",
        desc = _t"神秘的冥界食人花，妖艳的红色玫瑰，五个石人正在进行着神秘的仪式，冥界的通道即将打开，雅典娜的圣斗士们必须破坏仪式！",
        difficulty = 3,
	},
					  ------
	[35677] =
	{
		name = _t"水瓶！最强的绝招",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"30级以上",
		image = "background\\loading02.jpg",
		desc = _t"圣战来临前夕，沉寂许久的水瓶宫突然爆发出骇然的小宇宙。当年轻的圣斗士迅速赶到水瓶宫后却发现已经逝去的黄金圣斗士卡妙出现在这里，而这一次，水瓶座的黄金圣斗士是为了传授给年轻一代的圣斗士最强的绝招……",
		difficulty = 3,
	},
				    ------
	[35678] =
	{
		name = _t"水瓶！最强的绝招",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"60级以上",
		image = "background\\loading02.jpg",
		desc = _t"圣战来临前夕，沉寂许久的水瓶宫突然爆发出骇然的小宇宙。当年轻的圣斗士迅速赶到水瓶宫后却发现已经逝去的黄金圣斗士卡妙出现在这里，而这一次，水瓶座的黄金圣斗士是为了传授给年轻一代的圣斗士最强的绝招……",
		difficulty = 3,
	},

					  ------
	[35989] =
	{
		name = _t"双鱼！玫瑰对魔花",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 110,
		level_info = _t"30级以上",
		image = "background\\208.jpg",
		desc = _t"遍布双鱼宫前后的玫瑰是黄金十二宫一道重要的防御屏障，就像双鱼座阿布罗狄一样，不仅美丽，而且致命。但冥界势力永远不会放弃入侵大地，这一次，冥王将天魔星奎因和它的魔鬼花送入了双鱼宫。魔鬼花正在不断侵蚀玫瑰，试图打破双鱼宫的玫瑰屏障……",
		difficulty = 3,
	},
				    ------
	[35991] =
	{
		name = _t"双鱼！玫瑰对魔花",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 110,
		level_info = _t"60级以上",
		image = "background\\208.jpg",
		desc = _t"遍布双鱼宫前后的玫瑰是黄金十二宫一道重要的防御屏障，就像双鱼座阿布罗狄一样，不仅美丽，而且致命。但冥界势力永远不会放弃入侵大地，这一次，冥王将天魔星奎因和它的魔鬼花送入了双鱼宫。魔鬼花正在不断侵蚀玫瑰，试图打破双鱼宫的玫瑰屏障……",
		difficulty = 3,
	},	
	------
	[33165] =
	{
		name = _t"复生！死去的斗士",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 120,
		level_info = _t"90级以上",
		image = "background\\loading02.jpg",
        desc = _t"战死的海斗士和白银圣斗士堕入了由天猛星拉达曼提斯看守在冥界地狱，英勇的圣斗士们闯入冥界，战斗吧！",
        difficulty = 3,
	},
	    ------
	[36724] =
	{
		name = _t"白羊！师徒大作战",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 110,
		level_info = _t"30级以上",
		image = "background\\208.jpg",
		desc = _t"白羊座穆和他的弟子贵鬼正在为圣斗士准备一场试炼，坚固的水晶墙和调皮捣蛋的贵鬼，真实令人头疼啊。",
		difficulty = 3,
	},
				    ------
	[36734] =
	{
		name = _t"白羊！师徒大作战",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 110,
		level_info = _t"60级以上",
		image = "background\\208.jpg",
		desc = _t"白羊座穆和他的弟子贵鬼正在为圣斗士准备一场试炼，坚固的水晶墙和调皮捣蛋的贵鬼，真实令人头疼啊。",
		difficulty = 3,
	},	
	------
	[37702] =
	{
		name = _t"逆流！亚特兰蒂斯",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"25级以上",
		image = "background\\loading02.jpg",
        desc = _t"海啸频发，世界需要你们拯救！",
        difficulty = 3,
	},	
	-------
	
	------
		[37703] =
	{
		name = _t"逆流！十二宫危机",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"20级以上",
		image = "background\\loading02.jpg",
        desc = _t"圣域入口附近出现了大量冥王势力的卫兵。他们企图冲入圣域、企图摧毁雅典娜神像。需要圣斗士们去守卫圣域大门，守卫雅典娜神像！",
        difficulty = 3,
	},
	---------
		[39453] =
	{
		name = _t"逆流！黄金试炼",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"60级以上",
		image = "background\\loading02.jpg",
        desc = _t"向着通往黄金圣斗士的道路，前进！连环的3个试炼在等待着你和你的伙伴，准备好了吗？",
        difficulty = 3,
		exclusive_task = {12590,12593,}, 
	},
	----------
		[39465] =
	{
		name = _t"逆流！十二宫危机",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"20级以上",
		image = "background\\loading02.jpg",
        desc = _t"圣域入口附近出现了大量冥王势力的卫兵。他们企图冲入圣域、企图摧毁雅典娜神像。需要圣斗士们去守卫圣域大门，守卫雅典娜神像！",
        difficulty = 3,
	},
	---------
		[39466] =
	{
		name = _t"逆流！亚特兰蒂斯",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"25级以上",
		image = "background\\loading02.jpg",
        desc = _t"海啸频发，世界需要你们拯救！",
        difficulty = 3,
	},
	---------
		[41240] =
	{
		name = _t"双子！善恶对决",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 110,
		level_info = _t"30级以上",
		image = "background\\208.jpg",
		desc = _t"双子座的苦恼迟迟没有结束，在他的内心，善与恶始终在不停纠缠。勇敢正义的少年啊，帮助双子座消除内心的邪恶，引导他永远站在正义的一方吧！",
		difficulty = 3,
	},
	---------
		[41241] =
	{
		name = _t"双子！善恶对决",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 110,
		level_info = _t"60级以上",
		image = "background\\208.jpg",
		desc = _t"双子座的苦恼迟迟没有结束，在他的内心，善与恶始终在不停纠缠。勇敢正义的少年啊，帮助双子座消除内心的邪恶，引导他永远站在正义的一方吧！",
		difficulty = 3,
	},	
	------
}

------------------------------------------
-- 活动自动组队配置

activities =
{
    ------
    [1575] =
	{
		name = _t"危急！纱织守护者",
		prof_cfg =
		{
			{4,2; min = 0, max = 6},
			{5,7; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"25级以上",
		image = "background\\loading02.jpg",
        desc = _t"女神正处于危险之中，快去保卫她！",
        difficulty = 3,
	},
	    ------
    [1055] =
	{
		name = _t"黄金试炼",
		prof_cfg =
		{
			{4,2; min = 0, max = 6},
			{5,7; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"30级以上",
		image = "background\\loading02.jpg",
        desc = _t"向着通往黄金圣斗士的道路，前进！连环的3个试炼在等待着你和你的伙伴，准备好了吗？",
        difficulty = 4,
	},
	
	    ------	
	[4387] =
	{
		name = _t"命运的试练",
		prof_cfg =
		{
			{4,2; min = 0, max = 6},
			{5,7; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"20级以上",
		image = "background\\loading02.jpg",
		desc = _t"聆听女神的教诲，接受命运的试练！",
		difficulty = 3,
	},
	
		    ------	
	[4388] =
	{
		name = _t"传承！黄金试炼",
		prof_cfg =
		{
			{4,2; min = 0, max = 6},
			{5,7; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"30级以上",
		image = "background\\loading02.jpg",
        desc = _t"向着通往黄金圣斗士的道路，前进！连环的3个试炼在等待着你和你的伙伴，准备好了吗？",
        difficulty = 4,
	},
	
	        ------
    [5342] =
	{
		name = _t"危急！女神近卫军",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"60级以上",
		image = "background\\loading02.jpg",
        desc = _t"女神正处于危险之中，快去保卫她！",
        difficulty = 3,
	},
		
		    ------	
	[5597] =
	{
		name = _t"大反攻！冰国邪神",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"60级以上",
		image = "background\\loading02.jpg",
        desc = _t"冰国的邪神洛基苏醒了，正在试图将世界变成冰之王国，拯救世界吧，勇士们！",
        difficulty = 4,
	},
	
		    ------	
	[5819] =
	{
		name = _t"命运的试练",
		prof_cfg =
		{
			{4,2; min = 0, max = 6},
			{5,7; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"20级以上",
		image = "background\\loading02.jpg",
		desc = _t"聆听女神的教诲，接受命运的试练！",
		difficulty = 3,
	},
		    ------	
	[7278] =
	{
		name = _t"梦神的诡计",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"30级以上",
		image = "background\\loading02.jpg",
		desc = _t"梦神的诡计，需要你去破解！",
		difficulty = 3,
	},
		    ------	
	[7279] =
	{
		name = _t"梦神的诡计",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"30级以上",
		image = "background\\loading02.jpg",
		desc = _t"梦神的诡计，需要你去破解！",
		difficulty = 3,
	},
	
			    ------	
	[7687] =
	{
		name = _t"传承！黄金试炼",
		prof_cfg =
		{
			{4,2; min = 0, max = 6},
			{5,7; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"30级以上",
		image = "background\\loading02.jpg",
        desc = _t"向着通往黄金圣斗士的道路，前进！连环的3个试炼在等待着你和你的伙伴，准备好了吗？",
        difficulty = 4,
	},
	
		    ------	
	[8180] =
	{
		name = _t"战火！巨蟹的前线",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"30级以上",
		image = "background\\loading02.jpg",
		desc = _t"在黄道十二宫运行到巨蟹宫时，大批冥军来到群星之地，企图占据这里，勇士们，前去战斗吧！",
		difficulty = 3,
	},
	
		    ------	
	[8181] =
	{
		name = _t"战火！巨蟹的前线",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"30级以上",
		image = "background\\loading02.jpg",
		desc = _t"在黄道十二宫运行到巨蟹宫时，大批冥军来到群星之地，企图占据这里，勇士们，前去战斗吧！",
		difficulty = 3,
	},
	
		    ------	
	[8388] =
	{
		name = _t"激斗！狮子的獠牙",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"30级以上",
		image = "background\\loading02.jpg",
		desc = _t"那些被流放于遗忘之路的恶徒背弃了对女神的信仰，作为守护遗忘之路的黄金圣斗士艾欧里亚奉命前去剿灭这次叛乱！",
		difficulty = 3,
	},
	
		    ------	
	[8389] =
	{
		name = _t"激斗！狮子的獠牙",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"30级以上",
		image = "background\\loading02.jpg",
		desc = _t"那些被流放于遗忘之路的恶徒背弃了对女神的信仰，作为守护遗忘之路的黄金圣斗士艾欧里亚奉命前去剿灭这次叛乱！",
		difficulty = 3,
	},
	
		    ------	
	[9094] =
	{
		name = _t"万圣夜！疯狂的南瓜",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 100,
		level_info = _t"30级以上",
		image = "background\\loading02.jpg",
		desc = _t"哈迪斯城鬼怪横行，难道又是冥王的什么阴谋？还好圣域已经准备好了专门对付这些鬼怪的南瓜炸弹！让我们一起尽情轰炸吧！",
		difficulty = 3,
	},
	
	------------
		[12589] =
	{
		name = _t"逆流！黄金试炼",
		prof_cfg =
		{
			{4,2; min = 1, max = 6},
			{5,7; min = 1, max = 6},
			{2,3,6,7; min = 1, max = 6},
		},
        max_count = 6,
		max_level_range = 150,
		level_info = _t"90级以上",
		image = "background\\loading02.jpg",
        desc = _t"向着通往黄金圣斗士的道路，前进！连环的3个试炼在等待着你和你的伙伴，准备好了吗？",
        difficulty = 4,
	},
	------------	
	[12982] =
	{
		name = _t"巨蟹！僵尸来了",
		prof_cfg =
		{
			{4; min = 0, max = 6},
			{5; min = 0, max = 6},
			{2,3,6,7; min = 0, max = 6},
		},
        max_count = 6,
		max_level_range = 150,
		level_info = _t"30级以上",
		image = "background\\1.jpg",
		desc = _t"哈迪斯城堡中长久飘荡的灵魂附身在尸体身上，变成了可怕的僵尸。巨蟹座迪斯马斯克是对付僵尸的专家，他会让圣斗士使用他的力量去击败僵尸，不过迪斯马斯克也做了些恶作剧，偶尔会把某个圣斗士变成僵尸。",
		difficulty = 3,
	},
	
}
