--[[--------------------------------------------
--  created:   2011.3.24
--  author:    liuyuan, fengbo
--
--  动画配置脚本
--  @i18n animation 
--]]
local _t = require("i18n").context("animation")
---------------------------------------------------------------
--  created:   2011.3.24
--  author:    liuyuan, fengbo
--
--  动画配置脚本
---------------------------------------------------------------
--[[
配置参数示例：
animation =
{
	[1] = {								-- 动画ID
		name = "测试动画",				-- 动画名称
		playtype = "cutin",  			-- 动画类型，可取值为"cutin" 或 "world" ，仅对anm动画有效
										--   "cutin" 插播的另一个世界动画
										--   "world" 世界内直接播出动画

		path = "videos/animations/camera_animation_test.anm",	-- 动画文件路径。支持anm文件和swf文件

		-- 以下选项对anm文件和swf文件都有效
		stopAutoMove = true,			-- 是否使自动寻径停止（不写默认为true）
		canEscStop = true,				-- 是否可按ESC停止（不写默认为true）
		muteGameMusic = true,			-- 是否静音游戏音乐（不写默认为true）

		-- 以下选项仅anm文件需要配置，swf文件不需要这些选项
		showNpc = true,    				-- 是否显示NPC（不写默认为true）。注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = true,				-- 是否显示Monster（不写默认为true）
		showHostPlayer = true,			-- 是否显示HostPlayer（不写默认为true）
		showElsePlayer = true,			-- 是否显示ElsePlayer（不写默认为true）
		showMine = true,				-- 是否显示矿（不写默认为true）
		showLoot = true,				-- 是否显示掉落包（不写默认为true）
		showDyn = true,					-- 是否显示动态物品（不写默认为true）
		showPet = true,					-- 是否显示宠物（不写默认为true）
	},
}

其中，动画路径中可以使用的通配符包括：
${prof}		玩家当前职业名称。（天马，白鸟，天龙，仙女，凤凰）
${gender}	玩家性别。男为m, 女为f
${body}		玩家体型编号，编号从0开始。

例如，设置path = "videos/animations/测试动画_${prof}_${gender}_${body}.anm"
那么在播放动画时，若玩家职业为白鸟，性别为女，体型编号为0，
则会播放动画文件：videos/animations/测试动画_白鸟_f_0.anm
]]
animation =
{
	[1] = {
		name = _t"测试动画",
		playtype = "cutin",  -- 插播的另一个世界动画

		path = "flash/loading2.swf",
	},

	[2] = {
		name = _t"测试摄像机动画",
		playtype = "world",   -- 世界内直接播出动画

		path = "videos/animations/camera_animation_test.anm",

		-- 下面选项是世界动画选项
		showNpc = true,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = true,
		showHostPlayer = false,
		showElsePlayer = true,
		showPet = true,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = true,
		canEscStop = true,
	},

	[3] = {
		name = _t"天马演示temp",
		playtype = "world",   -- 世界内直接播出动画

		path = "videos/animations/天马演示temp.anm",

		-- 下面选项是世界动画选项
		showNpc = true,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = true,
		showHostPlayer = false,
		showElsePlayer = true,
		showPet = true,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = true,
		canEscStop = true,
	},

	[4] = {
		name = _t"职业演示_天马temp",
		playtype = "world",   -- 世界内直接播出动画

		path = "videos/animations/职业演示_天马temp.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
	},



	[1001] = {
		name = _t"新手村--竞技场玩家夺圣衣",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/新手村--竞技场玩家夺圣衣_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1002] = {
		name = _t"新手修行地",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/新手修行地_${prof}_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1003] = {
		name = _t"新手村--呼唤老鹰",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/新手村--呼唤老鹰_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1004] = {
		name = _t"新手村--黄金幻象战斗",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/新手村--黄金幻象战斗_${prof}_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1005] = {
		name = _t"新手村--穆救玩家",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/新手村--穆救玩家_${prof}_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1006] = {
		name = _t"新手村--讲解圣衣",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/新手村--讲解圣衣_${prof}_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1007] = {
		name = _t"新手村--小黑屋入场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/新手村--小黑屋入场_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = false,
		showMine = false,
	},

	[1008] = {
		name = _t"新手村--穿圣衣短篇",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/新手村--穿圣衣短篇_${prof}_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = false,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1009] = {
		name = _t"新手村--大战之前",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/新手村--大战之前.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1101] = {
		name = _t"圣域--觐见教皇",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--觐见教皇_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1102] = {
		name = _t"圣域--初代天马对死神",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--初代天马对死神_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1103] = {
		name = _t"圣域--三黄金战双子神",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--三黄金战双子神_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1104] = {
		name = _t"圣域--沙加出场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--沙加出场.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1105] = {
		name = _t"圣域--金牛出场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--金牛出场_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1106] = {
		name = _t"圣域--屋顶陶罐指引",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--屋顶陶罐指引.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = false,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1107] = {
		name = _t"圣域--硬闯12宫",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--硬闯12宫_${prof}_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1108] = {
		name = _t"圣域--屋顶珍珠指引",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--屋顶珍珠指引.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = false,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1109] = {
		name = _t"圣域--圣衣升阶介绍",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--圣衣升阶介绍_${prof}_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1110] = {
		name = _t"圣域--获得普罗米修斯之锤",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--获得普罗米修斯之锤_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1111] = {
		name = _t"圣域--十二宫点燃火时钟",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--十二宫点燃火时钟.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1112] = {
		name = _t"圣域--十二宫时钟熄灭",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--十二宫时钟熄灭.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1113] = {
		name = _t"圣域--钟楼火熄灭_白羊",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--钟楼火熄灭_白羊.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1114] = {
		name = _t"圣域--钟楼火熄灭_金牛",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--钟楼火熄灭_金牛.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1115] = {
		name = _t"圣域--钟楼火熄灭_双子",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--钟楼火熄灭_双子.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1116] = {
		name = _t"圣域--钟楼火熄灭_巨蟹",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--钟楼火熄灭_巨蟹.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1117] = {
		name = _t"圣域--钟楼火熄灭_狮子",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--钟楼火熄灭_狮子.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1118] = {
		name = _t"圣域--钟楼火熄灭_处女",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--钟楼火熄灭_处女.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1119] = {
		name = _t"圣域--钟楼火熄灭_天秤",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--钟楼火熄灭_天秤.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1120] = {
		name = _t"圣域--钟楼火熄灭_天蝎",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--钟楼火熄灭_天蝎.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1121] = {
		name = _t"圣域--钟楼火熄灭_射手",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--钟楼火熄灭_射手.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1122] = {
		name = _t"圣域--钟楼火熄灭_摩羯",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--钟楼火熄灭_摩羯.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1123] = {
		name = _t"圣域--钟楼火熄灭_水瓶",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--钟楼火熄灭_水瓶.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1124] = {
		name = _t"圣域--钟楼火熄灭_双鱼",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--钟楼火熄灭_双鱼.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1125] = {
		name = _t"圣域--罗德里奥村大火",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--罗德里奥村大火_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = false,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
		
	[1126] = {
		name = _t"圣域--发现大火.anm",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--发现大火_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = false,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1127] = {
		name = _t"圣域--冥王神血之谜",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--冥王神血之谜.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1128] = {
		name = _t"圣域--十三年前的谣言",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--十三年前的谣言.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1129] = {
		name = _t"圣域--升阶黄金圣衣",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--升阶黄金圣衣_${prof}_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1130] = {
		name = _t"圣域--冥王阴谋",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣域--冥王阴谋.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	
	[1201] = {
		name = _t"银河竞技场--黄金狮子来袭",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/银河竞技场--黄金狮子来袭.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1202] = {
		name = _t"银河竞技场--沙织被掳",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/银河竞技场--沙织被掳_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1203] = {
		name = _t"银河竞技场--穆救众人",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/银河竞技场--穆救众人.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},


	[1204] = {
		name = _t"银河竞技场--纱织出场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/银河竞技场--纱织出场.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1205] = {
		name = _t"区域展示--银河竞技场--青木原树海_进",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/区域展示--银河竞技场--青木原树海_进.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1206] = {
		name = _t"区域展示--银河竞技场--青木原树海_出",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/区域展示--银河竞技场--青木原树海_出.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1207] = {
		name = _t"银河竞技场--纱织爆发小宇宙",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/银河竞技场--纱织爆发小宇宙.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1208] = {
		name = _t"银河竞技场--冥王回忆",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/银河竞技场--冥王回忆_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1209] = {
		name = _t"银河竞技场--星矢穿圣衣",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/银河竞技场--星矢穿圣衣.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1280] = {
		name = _t"银河竞技场--仰望十风穴",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/银河竞技场--仰望十风穴_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1281] = {
		name = _t"银河竞技场--冰河登场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/银河竞技场--冰河登场.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1282] = {
		name = _t"银河竞技场--紫龙登场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/银河竞技场--紫龙登场.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1283] = {
		name = _t"银河竞技场--瞬登场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/银河竞技场--瞬登场.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1284] = {
		name = _t"银河竞技场--星矢登场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/银河竞技场--星矢登场.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1285] = {
		name = _t"银河竞技场--纱织登场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/银河竞技场--纱织登场.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1286] = {
		name = _t"银河竞技场--沙织身世之迷",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/银河竞技场--沙织身世之迷.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	
	[1301] = {
		name = _t"庐山--紫龙救春丽",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/庐山--紫龙救春丽.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1302] = {
		name = _t"庐山--雷虎救紫龙",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/庐山--雷虎救紫龙_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1303] = {
		name = _t"庐山--雷虎VS紫龙",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/庐山--雷虎VS紫龙.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1304] = {
		name = _t"庐山--黄泉比良之战",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/庐山--黄泉比良之战_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1305] = {
		name = _t"庐山--龙珠之神龙出现",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/庐山--龙珠之神龙出现_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1401] = {
		name = _t"遗忘之地--教皇内战",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/遗忘之路--教皇内战_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

    [1402] = {
		name = _t"遗忘之路--召唤命运女神",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/遗忘之路--召唤命运女神.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1403] = {
		name = _t"遗忘之路--放逐者之王出场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/遗忘之路--放逐者之王出场_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1404] = {
		name = _t"遗忘之路--牢狱注水",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/遗忘之路--牢狱注水_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1311] = {
		name = _t"死亡皇后岛--沉眠火山之战",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/死亡皇后岛--沉眠火山之战_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1312] = {
		name = _t"死亡皇后岛--黑暗凤凰之战",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/死亡皇后岛--黑暗凤凰之战_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1313] = {
		name = _t"死亡皇后岛--一辉与沙加之战",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/死亡皇后岛--一辉与沙加之战_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1314] = {
		name = _t"死亡皇后岛--封印皇后岛",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/死亡皇后岛--封印皇后岛_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[1210] = {
		name = _t"东西伯利亚--冰河VS亚雷库萨",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/东西伯利亚--冰河VS亚雷库萨_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1211] = {
		name = _t"东西伯利亚--玩家冰河vs加隆",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/东西伯利亚--玩家冰河vs加隆_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1212] = {
		name = _t"东西伯利亚--艾尔扎克出现",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/东西伯利亚--艾尔扎克出现.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1213] = {
		name = _t"东西伯利亚--雪山崩塌",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/东西伯利亚--雪山崩塌.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1214] = {
		name = _t"东西伯利亚--亚雷库萨弑父",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/东西伯利亚--亚雷库萨弑父.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1215] = {
		name = _t"东西伯利亚--瓦尔基里演讲",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/东西伯利亚--瓦尔基里演讲.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1216] = {
		name = _t"东西伯利亚--中加隆幻胧拳",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/东西伯利亚--中加隆幻胧拳_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1217] = {
		name = _t"东西伯利亚--冰河被俘",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/东西伯利亚--冰河被俘_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	
	
	[1230] = {
		name = _t"亚特兰蒂斯--修亚VS海龙",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/亚特兰蒂斯--修亚VS海龙_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1231] = {
		name = _t"亚特兰蒂斯--沙织的踪迹",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/亚特兰蒂斯--沙织的踪迹_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1232] = {
		name = _t"亚特兰蒂斯--玩家VS海马",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/亚特兰蒂斯--玩家VS海马_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1250] = {
		name = _t"哈迪斯城--玩家VS拉达曼迪斯",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/哈迪斯城--玩家VS拉达曼迪斯_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1320] = {
		name = _t"冥界--渡过阿格龙河",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/冥界--渡过阿格龙河.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1321] = {
		name = _t"冥界--尤利缇斯",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/冥界--尤利缇斯.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1322] = {
		name = _t"冥界--泰坦神力的灌注",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/冥界--泰坦神力的灌注.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1323] = {
		name = _t"冥界--沙加出场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/冥界--沙加出场.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	
	[1324] = {
		name = _t"冥界--秒杀六天星",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/冥界--秒杀六天星.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1325] = {
		name = _t"冥界--潘多拉抓走一辉",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/冥界--潘多拉抓走一辉.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1326] = {
		name = _t"冥界--玩家冲入犹大环",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/冥界--玩家冲入犹大环.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1327] = {
		name = _t"冥界--瞬的回忆",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/冥界--瞬的回忆.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	
	[1328] = {
		name = _t"冥界--音之战.anm",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/冥界--音之战.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1329] = {
		name = _t"冥界--潜修开启.anm",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/冥界--潜修开启.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	
	[1010] = {
		name = _t"场景展示--群星之地",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/场景展示--群星之地.anm",

		-- 下面选项是世界动画选项
		
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
		
	[1011] = {
		name = _t"场景展示--圣域",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/场景展示--圣域.anm",

		-- 下面选项是世界动画选项
		
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1012] = {
		name = _t"场景展示--银河竞技场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/场景展示--银河竞技场.anm",

		-- 下面选项是世界动画选项
		
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	
	[1013] = {
		name = _t"场景展示--庐山",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/场景展示--庐山.anm",

		-- 下面选项是世界动画选项
		
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1014] = {
		name = _t"场景展示--遗忘之路",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/场景展示--遗忘之路.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1015] = {
		name = _t"场景展示--死亡皇后岛",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/场景展示--死亡皇后岛.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	
	[1016] = {
		name = _t"场景展示--东西伯利亚",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/场景展示--东西伯利亚.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1017] = {
		name = _t"场景展示--亚特兰蒂斯",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/场景展示--亚特兰蒂斯.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1018] = {
		name = _t"场景展示--仙女岛",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/场景展示--仙女岛.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1019] = {
		name = _t"场景展示--哈迪斯城",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/场景展示--哈迪斯城.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = false,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
		
	[1020] = {
		name = _t"场景展示--黄金十二宫",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/场景展示--黄金十二宫.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = false,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
		
	[1021] = {
		name = _t"场景展示--冥界",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/场景展示--冥界.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	
	
	[1501] = {
		name = _t"区域展示--庐山_天池",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/区域展示--庐山_天池.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1502] = {
		name = _t"区域展示--圣域_黄泉之井",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/区域展示--圣域_黄泉之井.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1503] = {
		name = _t"区域展示--遗忘之路_命运圣殿",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/区域展示--遗忘之路_命运圣殿.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1504] = {
		name = _t"区域展示--东西伯利亚_蓝冰堡",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/区域展示--东西伯利亚_蓝冰堡.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1505] = {
		name = _t"区域展示--东西伯利亚_世界之树",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/区域展示--东西伯利亚_世界之树.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[1506] = {
		name = _t"区域展示--亚特兰蒂斯_波赛多尼亚",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/区域展示--亚特兰蒂斯_波赛多尼亚.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	
	[2001] = {
		name = _t"三环狮子--火堆玩法",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/三环狮子--火堆玩法.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2002] = {
		name = _t"三环狮子--艾欧里亚登场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/三环狮子--艾欧里亚登场_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2003] = {
		name = _t"活动--沙织别墅1",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/活动--沙织别墅1.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2004] = {
		name = _t"活动--沙织别墅2",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/活动--沙织别墅2.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2005] = {
		name = _t"活动--沙织别墅3",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/活动--沙织别墅3.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2006] = {
		name = _t"三环双鱼--阿布罗狄出场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/三环双鱼--阿布罗狄出场_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2007] = {
		name = _t"三环天枰--传送门提示",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/三环天枰--传送门提示.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2008] = {
		name = _t"三环天枰--童虎分身出场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/三环天枰--童虎分身出场.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2009] = {
		name = _t"两环--沉没的亚特兰蒂斯1",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/两环--沉没的亚特兰蒂斯1_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
		showDyn = false,
	},
	

	[2010] = {
		name = _t"两环--沉没的亚特兰蒂斯2",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/两环--沉没的亚特兰蒂斯2.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2011] = {
		name = _t"两环--沉没的亚特兰蒂斯3",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/两环--沉没的亚特兰蒂斯3.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2012] = {
		name = _t"活动--钟楼1",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/活动--钟楼1.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2013] = {
		name = _t"活动--钟楼2",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/活动--钟楼2.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

    [2014] = {
		name = _t"活动--钟楼3",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/活动--钟楼3.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	
	[2015] = {
		name = _t"活动--十风穴_一辉登场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/活动--十风穴_一辉登场.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

    [2016] = {
		name = _t"圣战回忆--天败星",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣战回忆--天败星.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2017] = {
		name = _t"两环--沉没的亚特兰蒂斯4",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/两环--沉没的亚特兰蒂斯4_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2018] = {
		name = _t"活动--十风穴_瞬救星矢",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/活动--十风穴_瞬救星矢_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2019] = {
		name = _t"活动--十风穴_黑暗仙女出场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/活动--十风穴_黑暗仙女出场.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2020] = {
		name = _t"活动--射手逃亡1",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/活动--射手逃亡1_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2021] = {
		name = _t"活动--射手逃亡2",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/活动--射手逃亡2_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2022] = {
		name = _t"活动--射手逃亡3",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/活动--射手逃亡3_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2023] = {
		name = _t"活动--射手逃亡4",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/活动--射手逃亡4_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2024] = {
		name = _t"新两环--塔耳塔洛斯_机关场景传送1",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/新两环--塔耳塔洛斯_机关场景传送1_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = false,
		showMine = false,
	},

	[2025] = {
		name = _t"新两环--塔耳塔洛斯_机关场景传送2",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/新两环--塔耳塔洛斯_机关场景传送2_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = false,
		showMine = false,
	},

	[2026] = {
		name = _t"新两环--塔耳塔洛斯_房间组合",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/新两环--塔耳塔洛斯_房间组合.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2027] = {
		name = _t"新两环--塔耳塔洛斯_死神阴影出场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/新两环--塔耳塔洛斯_死神阴影出场.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2028] = {
		name = _t"墓地--玩家变身",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/墓地--玩家变身_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2029] = {
		name = _t"圣战回忆--雅典娜的庇护",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/圣战回忆--雅典娜的庇护.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = false,
		showMine = false,
	},

	[2030] = {
		name = _t"新三环--大蛇_传送",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/新三环--大蛇_传送_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = false,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2031] = {
		name = _t"新三环--大蛇_洛基出场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/新三环--大蛇_洛基出场_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},


	[2032] = {
		name = _t"新两环--冰火深渊_哈根出场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/新两环--冰火深渊_哈根出场.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2033] = {
		name = _t"新两环--塔耳塔洛斯_冥后出场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/新两环--塔耳塔洛斯_冥后出场.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2034] = {
		name = _t"新两环--塔耳塔洛斯_冥后变身",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/新两环--塔耳塔洛斯_冥后变身.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = false,
		showMine = false,
	},

	[2035] = {
		name = _t"墓地--boss出场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/墓地--boss出场_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = false,
		showMine = false,
	},

	[2036] = {
		name = _t"新三环--北欧小镇_城镇广场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/新三环--北欧小镇_城镇广场_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[2037] = {
		name = _t"新三环--北欧小镇_Boss出场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/新三环--北欧小镇_Boss出场_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = false,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2038] = {
		name = _t"冰海神殿--海魔女和大乌贼",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/冰海神殿--海魔女和大乌贼_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[2039] = {
		name = _t"冰海神殿--女武神瓦尔基里",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/冰海神殿--女武神瓦尔基里_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[2040] = {
		name = _t"新两环--塔耳塔洛斯_机关场景传送3",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/新两环--塔耳塔洛斯_机关场景传送3.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = false,
		showLoot = false,
		canEscStop = false,
		showMine = false,
	},
	
	[2041] = {
		name = _t"新两环--塔耳塔洛斯_睡神阴影出场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/新两环--塔耳塔洛斯_睡神阴影出场.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = false,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[2042] = {
		name = _t"七大洋柱--海皇子出场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/七大洋柱--海皇子出场_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = false,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[2043] = {
		name = _t"活动--Q版纱织别墅1",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/活动--Q版纱织别墅1.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[2044] = {
		name = _t"活动--Q版纱织别墅2",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/活动--Q版纱织别墅2.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[2045] = {
		name = _t"七大洋柱--生命支柱破碎",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/七大洋柱--生命支柱破碎.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = false,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[2046] = {
		name = _t"冥界十二宫--冥界入侵",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/冥界十二宫--冥界入侵.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = false,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[2047] = {
		name = _t"冥界十二宫--宿命的对决",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/冥界十二宫--宿命的对决.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = false,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[2048] = {
		name = _t"冥界十二宫--沙加坐化",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/冥界十二宫--沙加坐化.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = false,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[2049] = {
		name = _t"冥界十二宫--女神之死",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/冥界十二宫--女神之死.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = false,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[2050] = {
		name = _t"新两环--塔耳塔洛斯_冥后变身2",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/新两环--塔耳塔洛斯_冥后变身2.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = false,
		showLoot = false,
		canEscStop = false,
		showMine = false,
	},
	
	[2051] = {
		name = _t"逆流--天阴星出场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/逆流--天阴星出场.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[2052] = {
		name = _t"逆流--天异星出场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/逆流--天异星出场.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[2053] = {
		name = _t"逆流--天暗星出场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/逆流--天暗星出场.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	
	[2100] = {
		name = _t"黄金十二宫--白羊宫_穆修圣衣",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/黄金十二宫--白羊宫_穆修圣衣_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2101] = {
		name = _t"黄金十二宫--纱织中箭_",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/黄金十二宫--纱织中箭_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2102] = {
		name = _t"黄金十二宫--金牛宫_战斗开场",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/黄金十二宫--金牛宫_战斗开场_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[2103] = {
		name = _t"黄金十二宫--金牛宫之泰坦新星发动",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/黄金十二宫--金牛宫之泰坦新星发动.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = false,
		showMine = false,
	},
	
	[2104] = {
		name = _t"黄金十二宫--射手宫_黄金箭飞出",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/黄金十二宫--射手宫_黄金箭飞出.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = false,
		showMine = false,
	},

	[2105] = {
		name = _t"黄金十二宫--处女宫_领悟第七感",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/黄金十二宫--处女宫_领悟第七感_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = false,
		showMine = false,
	},
	
	[2106] = {
		name = _t"黄金十二宫--狮子宫_卡西欧士救玩家",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/黄金十二宫--狮子宫_卡西欧士救玩家_${gender}.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = false,
		showMine = false,
	},	
		
	[2201] = {
		name = _t"剧情本--黄金十二宫_纱织中箭",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/剧情本--黄金十二宫_纱织中箭.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = false,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[2202] = {
		name = _t"剧情本--黄金十二宫_女神复活",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/animations/剧情本--黄金十二宫_女神复活.anm",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = false,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	

	[4000] = {
		name = _t"前代圣战",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/mp4/Last_Saint_War.mp4",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4001] = {
		name = _t"新手村-星矢VS卡西欧士",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/mp4/星矢VS卡西欧士.mp4",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4002] = {
		name = _t"新手村-星矢VS莎尔娜",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/mp4/星矢VS莎尔娜.mp4",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4003] = {
		name = _t"圣域-奥路菲VS地狱三头犬",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/mp4/奥路菲vs三头犬.mp4",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4004] = {
		name = _t"银河竞技场_一辉夺圣衣",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/mp4/一辉夺圣衣.mp4",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4005] = {
		name = _t"银河竞技场_紫龙VS英仙座",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/mp4/紫龙VS英仙座.mp4",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4006] = {
		name = _t"庐山_紫龙VS迪斯马斯克",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/mp4/紫龙VS迪斯马斯克.mp4",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4007] = {
		name = _t"艾欧罗斯VS修罗",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/mp4/艾欧罗斯VS修罗.mp4",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},


  	[4008] = {
		name = _t"一辉VS基鲁提",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/mp4/一辉VS基鲁提.mp4",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4009] = {
		name = _t"众小强PK海皇",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/mp4/众小强PK海皇.mp4",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[4010] = {
		name = _t"史昂对童虎",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/mp4/史昂对童虎.mp4",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[4011] = {
		name = _t"海印斯坦堡",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/mp4/海印斯坦堡.mp4",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[4012] = {
		name = _t"雅典娜神殿",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/mp4/雅典娜神殿.mp4",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[4013] = {
		name = _t"假教皇杀婴",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/mp4/假教皇杀婴.mp4",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	[4014] = {
		name = _t"冰河回忆_母亲船沉没",
		playtype = "world",   -- 世界内直接出动画

		path = "videos/mp4/冰河回忆_母亲船沉没.mp4",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},
	
	
	[4101] = {
		name = _t"章节封面",
		playtype = "world",   -- 世界内直接出动画

		path = "flash/comic/第1卷01.swf",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4102] = {
		name = _t"章节封面",
		playtype = "world",   -- 世界内直接出动画

		path = "flash/comic/第1卷02.swf",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4103] = {
		name = _t"章节封面",
		playtype = "world",   -- 世界内直接出动画

		path = "flash/comic/第2卷01.swf",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4104] = {
		name = _t"章节封面",
		playtype = "world",   -- 世界内直接出动画

		path = "flash/comic/第2卷02.swf",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4105] = {
		name = _t"章节封面",
		playtype = "world",   -- 世界内直接出动画

		path = "flash/comic/第2卷03.swf",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4106] = {
		name = _t"章节封面",
		playtype = "world",   -- 世界内直接出动画

		path = "flash/comic/第3卷01.swf",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4107] = {
		name = _t"章节封面",
		playtype = "world",   -- 世界内直接出动画

		path = "flash/comic/第3卷02.swf",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4108] = {
		name = _t"章节封面",
		playtype = "world",   -- 世界内直接出动画

		path = "flash/comic/第3卷03.swf",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4109] = {
		name = _t"章节封面",
		playtype = "world",   -- 世界内直接出动画

		path = "flash/comic/第4卷01.swf",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4110] = {
		name = _t"章节封面",
		playtype = "world",   -- 世界内直接出动画

		path = "flash/comic/第4卷02.swf",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4111] = {
		name = _t"章节封面",
		playtype = "world",   -- 世界内直接出动画

		path = "flash/comic/第4卷03.swf",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4112] = {
		name = _t"章节封面",
		playtype = "world",   -- 世界内直接出动画

		path = "flash/comic/第5卷01.swf",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4113] = {
		name = _t"章节封面",
		playtype = "world",   -- 世界内直接出动画

		path = "flash/comic/第5卷02.swf",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4114] = {
		name = _t"章节封面",
		playtype = "world",   -- 世界内直接出动画

		path = "flash/comic/第5卷03.swf",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4115] = {
		name = _t"章节封面",
		playtype = "world",   -- 世界内直接出动画

		path = "flash/comic/第6卷01.swf",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4116] = {
		name = _t"章节封面",
		playtype = "world",   -- 世界内直接出动画

		path = "flash/comic/第6卷02.swf",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},

	[4117] = {
		name = _t"章节封面",
		playtype = "world",   -- 世界内直接出动画

		path = "flash/comic/第6卷03.swf",

		-- 下面选项是世界动画选项
		showNpc = false,    		-- 注意有些monster是NPC，这种情况下该monster继续显示
		showMonster = false,
		showHostPlayer = false,
		showElsePlayer = false,
		showPet = false,
		stopAutoMove = true,
		muteGameMusic = true,
		showLoot = false,
		canEscStop = true,
		showMine = false,
	},


}
