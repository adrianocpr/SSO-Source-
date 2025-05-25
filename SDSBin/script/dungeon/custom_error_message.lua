--[[--------------------------------------------
-- 副本自定义错误提示
-- Created by Fengbo
-- @i18n dungeon 
--]]
local _t = require("i18n").context("dungeon")

--[[
-- 副本错误编号定义。
--]]
WORLD_LIMIT = 1 					-- 服务器中副本达到上限
SINGLE_ONLY = 2						-- 副本只能单人进入
TEAM_ONLY = 3						-- 该副本只能组队进入
TEMPL_NOT_FOUND = 4					-- 错误的副本模板
PERSON_STATUS_LIMIT = 5				-- 玩家状态不能进入副本
PERSON_LEVEL_LIMIT = 6				-- 玩家级别不满足副本要求
PERSON_ENTER_TIME_LIMIT_DAY = 7		-- 玩家每天进入次数达上限
PERSON_ENTER_TIME_LIMIT_WEEK = 8	-- 玩家每周进入次数达上限
PERSON_ITEM_LIMIT = 9				-- 缺少物品
PERSON_REPU_LIMIT = 10				-- 声望条件不符
PERSON_BUFF_LIMIT = 11				-- buff状态条件不符
ORIGINAL_MEMBER_ONLY = 12			-- 该副本无法中途加入
SAME_LEAGUE_ONLY = 13				-- 要求同一军团
PLAYER_NOT_IN_LINE = 14				-- 玩家不在本线
CREATE_FAILED = 15					-- 副本创建失败
OPEN_IN_TEAM = 16					-- 组队开启
OPEN_BY_LEADER = 17					-- 队长开启
OPEN_PLAYER_LIMIT = 18				-- 开启副本需要的组队人数不符合条件
OPEN_PLAYER_TOGETHER = 19			-- 开启副本时需要所有人在一起
OPEN_AROUND_PLAYER_LIMIT = 20		-- 周围组队人数小于副本开启要求周围组队人数
OPEN_INSTANCE_WITH = 21				-- 该队伍当前有激活的副本，请等待一段时间
INSTANCE_EXIST = 22					-- 目前已有一个激活的副本
INSTANCE_NOT_FOUND = 23				-- 副本不存在
TIME_INVALID = 24					-- 副本开启时间段不对
NO_LINE = 25 						-- 副本尚未开放，找不到开放的服务器
IN_NORMAL_WORLD = 26				-- 必须在大地图
CREATE_TIMEOUT = 27					-- 副本创建超时
NEED_ACTIVE_TASK = 28				-- 需要玩家身上接取某个任务
NEED_RAID = 29 						-- 只能团队进入
NEED_RAID_LEADER = 30 				-- 只能团长开启
RAID_FORBID = 31 					-- 不允许团队开启
RAID_INFO_INVALID = 32 				-- 团队信息失效
TEAM_REPU_LIMIT = 33 				-- 队伍或团队声望不符合

--[[
副本错误提示信息自定义配置
--------------------------------------------------------
配置中可以使用的通配符如下：
${name}				错误信息针对的玩家名称。仅适用于创建副本的提示信息

配置格式如下：
[10763] = {			-- 副本模板ID
	create = {												-- 配置创建副本时的提示信息
		[PERSON_REPU_LIMIT] = "玩家${name}的声望不足",		-- 配置创建副本时，玩家声望不足时的提示信息
		[PERSON_LEVEL_LIMIT] = "玩家${name}的等级不够",		-- 配置创建副本时，玩家等级不够时的提示信息
	},
	enter = {												-- 配置进入副本时的提示信息
		[PERSON_REPU_LIMIT] = "您的声望不足，无法进入",		-- 配置进入副本时，玩家声望不足时的提示信息
	}
},
--]]
custom_message =
{
	[130] = {-- 传承！狮子试炼
		create = {
			[OPEN_IN_TEAM] = _t"需要3人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于30级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}参加黄金试练的次数已耗尽或神战点不足",
			[TEAM_REPU_LIMIT] = _t"队伍未接取黄金试练！勇猛的狮子任务",
		},
		enter = {
			[PERSON_REPU_LIMIT] = _t"您参加黄金试练的次数已耗尽或神战点不足",
		}
	},
	[27] = {-- 传承！双鱼试炼
		create = {
			[OPEN_IN_TEAM] = _t"需要3人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于30级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}参加黄金试练的次数已耗尽或神战点不足",
			[TEAM_REPU_LIMIT] = _t"队伍未接取黄金试练！爱美的双鱼任务",
		},
		enter = {
			[PERSON_REPU_LIMIT] = _t"您参加黄金试练的次数已耗尽或神战点不足",
		}
	},
	[1309] = {-- 传承！天秤试炼
		create = {
			[OPEN_IN_TEAM] = _t"需要3人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于30级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}参加黄金试练的次数已耗尽或神战点不足",
			[TEAM_REPU_LIMIT] = _t"队伍未接取黄金试练！公正的天秤任务",
		},
		enter = {
			[PERSON_REPU_LIMIT] = _t"您参加黄金试练的次数已耗尽或神战点不足",
		}
	},
	[138] = {-- 危急！纱织守护者
		create = {
			[OPEN_IN_TEAM] = _t"需要3人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于25级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}参加危急！纱织守护者的次数已耗尽",
			[PERSON_BUFF_LIMIT] = _t"玩家${name}已参加过危急！纱织守护者，本时间段内不可重复参加",
		},
		enter = {
		    [PERSON_LEVEL_LIMIT] = _t"等级低于25级",
			[PERSON_REPU_LIMIT] = _t"危急！纱织守护者的进入次数已耗尽",
			[PERSON_BUFF_LIMIT] = _t"已参加过危急！纱织守护者，本时间段内不可重复参加",
		}
	},
	[24237] = {-- 危急！女神近卫军
		create = {
			[OPEN_IN_TEAM] = _t"需要3人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于60级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}参加危急！女神近卫军的次数已耗尽",
			[PERSON_BUFF_LIMIT] = _t"玩家${name}已参加过危急！女神近卫军，本时间段内不可重复参加",
		},
		enter = {
		    [PERSON_LEVEL_LIMIT] = _t"等级低于60级",
			[PERSON_REPU_LIMIT] = _t"危急！女神近卫军的进入次数已耗尽",
			[PERSON_BUFF_LIMIT] = _t"已参加过危急！女神近卫军，本时间段内不可重复参加",
		}
	},
	[18321] = {-- 大反攻（一）！冰火深渊
		create = {
			[OPEN_IN_TEAM] = _t"需要3人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于60级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}参加大反攻的次数已耗尽或神战点不足",
			[TEAM_REPU_LIMIT] = _t"队伍未接取大反攻（一）！冰火深渊任务",
		},
		enter = {
			[PERSON_REPU_LIMIT] = _t"您参加大反攻的次数已耗尽或神战点不足",
		}
	},
	[23793] = {-- 大反攻（二）！巨狼雪山
		create = {
			[OPEN_IN_TEAM] = _t"需要3人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于60级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}参加大反攻的次数已耗尽或神战点不足",
			[TEAM_REPU_LIMIT] = _t"队伍未接取大反攻（二）！巨狼雪山任务",
		},
		enter = {
			[PERSON_REPU_LIMIT] = _t"您参加大反攻的次数已耗尽或神战点不足",
		}
	},
	[23456] = {-- 大反攻（三）！冰国邪神
		create = {
			[OPEN_IN_TEAM] = _t"需要3人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于60级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}参加大反攻的次数已耗尽或神战点不足",
			[TEAM_REPU_LIMIT] = _t"队伍未接取大反攻（三）！冰国邪神任务",
		},
		enter = {
			[PERSON_REPU_LIMIT] = _t"您参加大反攻的次数已耗尽或神战点不足",
		}
	},
	[14689] = {-- 风暴！亚特兰蒂斯
		create = {
			[OPEN_IN_TEAM] = _t"需要3人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于25级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}已参加过风暴！亚特兰蒂斯",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于25级",
			[PERSON_REPU_LIMIT] = _t"已参加过风暴！亚特兰蒂斯",
		}
	},
	[23436] = {-- 深渊！魔星的末日
		create = {
			[OPEN_IN_TEAM] = _t"需要3人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于60级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}已参加过深渊！魔星的末日",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于60级",
			[PERSON_REPU_LIMIT] = _t"已参加过深渊！魔星的末日",
		}
	},
	[10324] = {-- 集结！十二宫危机
		create = {
			[OPEN_IN_TEAM] = _t"需要3人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于20级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}已参加过集结！十二宫危机",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于20级",
			[PERSON_REPU_LIMIT] = _t"已参加过集结！十二宫危机",
		}
	},
	[18219] = {-- 重生！圣域镇魂歌
		create = {
			[OPEN_IN_TEAM] = _t"需要3人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于60级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}已参加过重生！圣域镇魂歌",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于60级",
			[PERSON_REPU_LIMIT] = _t"已参加过重生！圣域镇魂歌",
		}
	},
	[6154] = {-- 圣战回忆
		create = {
			[OPEN_IN_TEAM] = _t"需要2人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于15级",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于15级",
		}
	},
	[14138] = {-- 十风穴
		create = {
			[OPEN_IN_TEAM] = _t"需要2人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于35级",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于35级",
		}
	},
	[15535] = {-- 射手之心
		create = {
			[OPEN_IN_TEAM] = _t"需要2人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于45级",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于45级",
		}
	},
	[15222] = {-- 黄金十二宫(始)
		create = {
			[OPEN_IN_TEAM] = _t"需要2人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于55级",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于55级",
		}
	},
	[25108] = {-- 黄金十二宫(续)
		create = {
			[OPEN_IN_TEAM] = _t"需要2人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于60级",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于60级",
		}
	},
	[25845] = {-- 黄金十二宫(终)
		create = {
			[OPEN_IN_TEAM] = _t"需要2人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于68级",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于68级",
		}
	},
	[25847] = {-- 黄金十二宫(余)
		create = {
			[OPEN_IN_TEAM] = _t"需要2人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于68级",
			[PERSON_ITEM_LIMIT] = _t"玩家${name}缺少物品：^0065fe星之轨迹^N，通关^fffd44[副本]黄金十二宫(终)^N可获得^0065fe星之轨迹^N",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于68级",
			[PERSON_ITEM_LIMIT] = _t"缺少物品：^0065fe星之轨迹^N，通关^fffd44[副本]黄金十二宫(终)^N可获得^0065fe星之轨迹^N",
		}
	},
	[23379] = {-- 冰海神殿
		create = {
			[OPEN_IN_TEAM] = _t"需要2人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于70级",
			[PERSON_ITEM_LIMIT] = _t"玩家${name}缺少物品：^0065fe冰之羽翼^N，通关^fffd44[副本]黄金十二宫(余)^N可获得^0065fe冰之羽翼^N",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于70级",
			[PERSON_ITEM_LIMIT] = _t"缺少物品：^0065fe冰之羽翼^N，通关^fffd44[副本]黄金十二宫(余)^N可获得^0065fe冰之羽翼^N",
		}
	},
	[23432] = {-- 七大洋巨柱(前)
		create = {
			[OPEN_IN_TEAM] = _t"需要2人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于80级",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于80级",
		}
	},
	[23433] = {-- 七大洋巨柱(后)
		create = {
			[OPEN_IN_TEAM] = _t"需要2人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于80级",
			[PERSON_ITEM_LIMIT] = _t"玩家${name}缺少物品：^0065fe海之共鸣石^N，通关^fffd44[副本]七大洋巨柱(前)^N可获得^0065fe海之共鸣石^N",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于80级",
			[PERSON_ITEM_LIMIT] = _t"缺少物品：^0065fe海之共鸣石^N，通关^fffd44[副本]七大洋巨柱(前)^N可获得^0065fe海之共鸣石^N",
		}
	},
	[25970] = {-- 女神的挽歌(前)
		create = {
			[OPEN_IN_TEAM] = _t"需要2人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于90级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}参加[英雄]副本的次数已耗尽或英雄点不满45点",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于90级",
			[PERSON_REPU_LIMIT] = _t"参加[英雄]副本的次数已耗尽或英雄点不满45点",
		}
	},
	[25971] = {-- 女神的挽歌(后)
		create = {
			[OPEN_IN_TEAM] = _t"需要2人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于90级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}参加[英雄]副本的次数已耗尽或英雄点不满45点",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于90级",
			[PERSON_REPU_LIMIT] = _t"参加[英雄]副本的次数已耗尽或英雄点不满45点",
		}
	},
	[25074] = {-- 危急！女神近卫军
		create = {
			[OPEN_IN_TEAM] = _t"需要3人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于60级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}参加危急！女神近卫军的次数已耗尽",
			[PERSON_BUFF_LIMIT] = _t"玩家${name}已参加过危急！女神近卫军，本时间段内不可重复参加",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于60级",
			[PERSON_REPU_LIMIT] = _t"危急！女神近卫军的进入次数已耗尽",
			[PERSON_BUFF_LIMIT] = _t"已参加过危急！女神近卫军，本时间段内不可重复参加",
		}
	},
	[25073] = {-- 大反攻！冰国邪神
		create = {
			[OPEN_IN_TEAM] = _t"需要3人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于60级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}参加大反攻的次数已耗尽或神战点不足",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于60级",
			[PERSON_REPU_LIMIT] = _t"参加大反攻的次数已耗尽或神战点不足",
		}
	},
	[27799] = {-- [英雄]十风穴
		create = {
			[OPEN_IN_TEAM] = _t"需要3人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于80级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}参加[英雄]副本的次数已耗尽或英雄点不满30点",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于80级",
			[PERSON_REPU_LIMIT] = _t"参加[英雄]副本的次数已耗尽或英雄点不满30点",
		}
	},
	[26984] = {-- [英雄]射手之心
		create = {
			[OPEN_IN_TEAM] = _t"需要3人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于80级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}参加[英雄]副本的次数已耗尽或英雄点不满30点",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于80级",
			[PERSON_REPU_LIMIT] = _t"参加[英雄]副本的次数已耗尽或英雄点不满30点",
		}
	},
	[27731] = {-- 攻破！复仇者联盟
		create = {
			[OPEN_IN_TEAM] = _t"需要3人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于60级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}剩余大反攻的参加次数不足或神战点不足",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于60级",
			[PERSON_REPU_LIMIT] = _t"剩余大反攻的参加次数不足或神战点不足",
		}
	},
    [25074] = {-- [英雄]蓝冰堡
		create = {
			[OPEN_IN_TEAM] = _t"需要3人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于100级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}参加[英雄]蓝冰堡的次数已耗尽",
			[PERSON_BUFF_LIMIT] = _t"玩家${name}已参加过[英雄]蓝冰堡，本时间段内不可重复参加",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于100级",
			[PERSON_REPU_LIMIT] = _t"的[英雄]蓝冰堡的进入次数已耗尽",
			[PERSON_BUFF_LIMIT] = _t"已参加过[英雄]蓝冰堡，本时间段内不可重复参加",
		}
	},
	[31448] = {-- 天秤！童虎的回忆
		create = {
			[OPEN_IN_TEAM] = _t"需要4人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级不满足要求",
			[PERSON_REPU_LIMIT] = _t"玩家${name}已参加过<天秤！童虎的回忆>",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级不满足要求",
			[PERSON_REPU_LIMIT] = _t"已参加过<天秤！童虎的回忆>",
		}
	},
	[31590] = {-- 天秤！童虎的回忆
		create = {
			[OPEN_IN_TEAM] = _t"需要4人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级不满足要求",
			[PERSON_REPU_LIMIT] = _t"玩家${name}已参加过<天秤！童虎的回忆>",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级不满足要求",
			[PERSON_REPU_LIMIT] = _t"已参加过<天秤！童虎的回忆>",
		}
	},	
	[32248] = {-- 突破！天蝎的试炼
		create = {
			[OPEN_IN_TEAM] = _t"需要4人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级不满足要求",
			[PERSON_REPU_LIMIT] = _t"玩家${name}已参加过<突破！天蝎的试炼>",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级不满足要求",
			[PERSON_REPU_LIMIT] = _t"已参加过<突破！天蝎的试炼>",
		}
	},
	[32249] = {-- 突破！天蝎的试炼
		create = {
			[OPEN_IN_TEAM] = _t"需要4人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级不满足要求",
			[PERSON_REPU_LIMIT] = _t"玩家${name}已参加过<突破！天蝎的试炼>",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级不满足要求",
			[PERSON_REPU_LIMIT] = _t"已参加过<突破！天蝎的试炼>",
		}
	},
	[32542] = {-- 逼近！射手的危机
		create = {
			[OPEN_IN_TEAM] = _t"需要4人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级不满足要求",
			[PERSON_REPU_LIMIT] = _t"玩家${name}已参加过<突破！天蝎的试炼>",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级不满足要求",
			[PERSON_REPU_LIMIT] = _t"已参加过<突破！天蝎的试炼>",
		}
	},
	[32543] = {-- 逼近！射手的危机
		create = {
			[OPEN_IN_TEAM] = _t"需要4人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级不满足要求",
			[PERSON_REPU_LIMIT] = _t"玩家${name}已参加过<逼近！射手的危机>",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级不满足要求",
			[PERSON_REPU_LIMIT] = _t"已参加过<逼近！射手的危机>",
		}
	},
	[32471] = {-- 哀嚎！地狱奏鸣曲
		create = {
			[OPEN_IN_TEAM] = _t"需要3人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于90级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}已参加过哀嚎！地狱奏鸣曲",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于90级",
			[PERSON_REPU_LIMIT] = _t"已参加过哀嚎！地狱奏鸣曲",
		}
	},
	[32048] = {-- 孵化！冥界巢穴
		create = {
			[OPEN_IN_TEAM] = _t"需要3人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于90级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}已参加过孵化！冥界巢穴",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于90级",
			[PERSON_REPU_LIMIT] = _t"已参加过孵化！冥界巢穴",
		}
	},
	[34565] = {-- 摩羯！修罗的剑道
		create = {
			[OPEN_IN_TEAM] = _t"需要4人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级不满足要求",
			[PERSON_REPU_LIMIT] = _t"玩家${name}已参加过<摩羯！修罗的剑道>",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级不满足要求",
			[PERSON_REPU_LIMIT] = _t"已参加过<摩羯！修罗的剑道>",
		}
	},
	[34566] = {-- 摩羯！修罗的剑道
		create = {
			[OPEN_IN_TEAM] = _t"需要4人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级不满足要求",
			[PERSON_REPU_LIMIT] = _t"玩家${name}已参加过<摩羯！修罗的剑道>",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级不满足要求",
			[PERSON_REPU_LIMIT] = _t"已参加过<摩羯！修罗的剑道>",
		}
	},
	[34606] = {-- 危急！女神的心意
		create = {
			[OPEN_IN_TEAM] = _t"需要6人满队方可开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于60级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}已参加过危急！女神的心意",
			[TEAM_REPU_LIMIT] = _t"队伍未接取任务：城户纱织的委托",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于60级",
			[PERSON_REPU_LIMIT] = _t"已参加过危急！女神的心意",
			[TEAM_REPU_LIMIT] = _t"队伍未接取任务：城户纱织的委托",
		}
	},
	[35677] = {-- 水瓶！最强的绝招
		create = {
			[OPEN_IN_TEAM] = _t"需要4人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级不满足要求",
			[PERSON_REPU_LIMIT] = _t"玩家${name}已参加过<水瓶！最强的绝招>",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级不满足要求",
			[PERSON_REPU_LIMIT] = _t"已参加过<水瓶！最强的绝招>",
		}
	},
	[35678] = {-- 水瓶！最强的绝招
		create = {
			[OPEN_IN_TEAM] = _t"需要4人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级不满足要求",
			[PERSON_REPU_LIMIT] = _t"玩家${name}已参加过<水瓶！最强的绝招>",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级不满足要求",
			[PERSON_REPU_LIMIT] = _t"已参加过<水瓶！最强的绝招>",
		}
	},
	[33165] = {-- 复生！死去的斗士
		create = {
			[OPEN_IN_TEAM] = _t"需要3人以上组队开启",
			[PERSON_LEVEL_LIMIT] = _t"玩家${name}的等级低于90级",
			[PERSON_REPU_LIMIT] = _t"玩家${name}剩余大反攻的参加次数不足或神战点不足",
		},
		enter = {
			[PERSON_LEVEL_LIMIT] = _t"等级低于90级",
			[PERSON_REPU_LIMIT] = _t"剩余大反攻的参加次数不足或神战点不足",
		}
	},
}
