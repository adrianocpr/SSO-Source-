--[[ @i18n quest ]]
local _t = require("i18n").context("quest")
--------------------------------------------
-- 附加任务追踪配置
-- Created by Fengbo
--[[
用于在任务追踪界面中显示与任务无关的附加信息。
并可以根据某一特定变量数值的变化改变追踪内容。
使用此种方式配置的追踪将始终显示在最上边。

配置格式如下：

{
	id = 1,												-- 附加追踪ID，请保证其唯一性
	name = "传承！黄金试炼",							-- 追踪标题
	quality = 4,										-- 品质。可影响追踪标题的颜色
	category = "huodong",								-- 分类。可影响追踪标题前显示的分类图标。参见quest_category.lua中的任务分类配置
	variable = function()								-- 指定一个函数，该函数需要返回本条追踪关心变化的数值，通常可以是声望。本例中使用0号队伍声望
		return GameApi.GetTeamReputation(0)
	end,

	trace = {
		[1] = {											-- 当0号队伍声望值为1时，显示以下内容
			"^00d9ff黄金试炼！爱美是双鱼 ${npc(12839)}",
			"黄金试炼！公正的天枰",
			"黄金试炼！勇猛的狮子",
		},
		[2] = {											-- 当0号队伍声望值为2时，显示以下内容
			"^00d9ff黄金试炼！爱美是双鱼 ${npc(12839)}",
			"黄金试炼！公正的天枰",
			"黄金试炼！勇猛的狮子",
		},
	},
}
--]]
--------------------------------------------

additional_trace =
{
	{
		id = 1,
		name = _t"传承！黄金试炼",
		quality = 4,
		category = "huodong",
		variable = function()
			return GameApi.GetTeamReputation(2)
		end,

		trace = {
			[1] = {
				_t"^ffd700双鱼幻境通关 ${npc(12839)}",
				_t"天秤幻境通关",
				_t"狮子幻境通关",
			},
			[2] = {
				_t"^ffd700双鱼幻境通关 ${npc(12839)}",
				_t"天秤幻境通关",
				_t"狮子幻境通关",
			},
			[3] = {
				_t"^00ff00双鱼幻境通关 (完成)",
				_t"^ffd700天秤幻境通关 ${npc(12840)}",
				_t"狮子幻境通关",
			},
			[4] = {
				_t"^00ff00双鱼幻境通关 (完成)",
				_t"^ffd700天秤幻境通关 ${npc(12840)}",
				_t"狮子幻境通关",
			},
			[5] = {
				_t"^00ff00双鱼幻境通关 (完成)",
				_t"^00ff00天秤幻境通关 (完成)",
				_t"^ffd700狮子幻境通关 ${npc(14165)}",
			},
			[6] = {
				_t"^00ff00双鱼幻境通关 (完成)",
				_t"^00ff00天秤幻境通关 (完成)",
				_t"^ffd700狮子幻境通关 ${npc(14165)}",
			},
		},
	},
	{
		id = 2,
		name = _t"大反攻！冰国邪神",
		quality = 4,
		category = "huodong",
		variable = function()
			return GameApi.GetTeamReputation(1)
		end,

		trace = {
			[1] = {
				_t"^ffd700冰火深渊通关 ${npc(23212)}",
				_t"巨狼雪山通关",
				_t"冰国邪神通关",
			},
			[2] = {
				_t"^ffd700冰火深渊通关 ${npc(23212)}",
				_t"巨狼雪山通关",
				_t"冰国邪神通关",
			},
			[3] = {
				_t"^00ff00冰火深渊通关 (完成)",
				_t"^ffd700巨狼雪山通关 ${npc(25234)}",
				_t"冰国邪神通关",
			},
			[4] = {
				_t"^00ff00冰火深渊通关 (完成)",
				_t"^ffd700巨狼雪山通关 ${npc(25234)}",
				_t"冰国邪神通关",
			},
			[5] = {
				_t"^00ff00冰火深渊通关 (完成)",
				_t"^00ff00巨狼雪山通关 (完成)",
				_t"^ffd700冰国邪神通关 ${npc(21087)}",
			},
			[6] = {
				_t"^00ff00冰火深渊通关 (完成)",
				_t"^00ff00巨狼雪山通关 (完成)",
				_t"^ffd700冰国邪神通关 ${npc(21087)}",
			},
		},
	},
	{
		id = 3,
		name = _t"星辰的史诗（第${solo_challenge.level}层）",
		quality = 4,
		category = "tiaozhan",
		variable = function()
			local solo = GameApi.GetSoloChallengeInfo() or {}
			local state = solo.state

			if state == "none" then
				return
			elseif state == "win" or state == "lost" then
				return state
			end
			
			return solo.level
		end,

		trace = {
			default = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败守卫 ${solo_challenge.score}/${solo_challenge.score_need}",
			},
			win = {	
				_t"挑战成功",
			},
			lost = {	
				_t"挑战失败",
			},

			[5] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败托勒密",
			},	
			[10] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败穆",
			},	
			[15] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败卡西欧士",
			},	
			[20] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败阿鲁迪巴",
			},	
			[24] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败所有守卫 ${solo_challenge.score}/${solo_challenge.score_need}",
			},
			[25] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败莎尔娜",
			},	
						[28] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败精英守卫 ${solo_challenge.score}/${solo_challenge.score_need}",
			},	
			[30] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败天马星魂",
			},	
			[34] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败精英守卫 ${solo_challenge.score}/${solo_challenge.score_need}",
			},
			[35] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败美狄斯",
			},	
			[40] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败双子幻影",
			},	
						[44] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败精英守卫 ${solo_challenge.score}/${solo_challenge.score_need}",
			},	
			[45] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败狄奥",
			},	
			[49] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败所有守卫 ${solo_challenge.score}/${solo_challenge.score_need}",
			},
			[50] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败地狱三头犬",
			},	
						[54] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败精英守卫 ${solo_challenge.score}/${solo_challenge.score_need}",
			},	
			[55] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败加米安",
			},	
			[59] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败精英守卫 ${solo_challenge.score}/${solo_challenge.score_need}",
			},
			[60] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败迪斯马斯克",
			},	
			[64] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败所有守卫 ${solo_challenge.score}/${solo_challenge.score_need}",
			},
			[65] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败魔铃",
			},	
						[69] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败精英守卫 ${solo_challenge.score}/${solo_challenge.score_need}",
			},	
			[70] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败艾欧里亚",
			},	
			[74] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击毁石柱",
			},
			[75] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败巴比伦",
			},	
						[79] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败精英守卫 ${solo_challenge.score}/${solo_challenge.score_need}",
			},	
			[80] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败奥路费",
			},	
						[84] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击毁石柱",
			},	
			[85] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败摩西斯",
			},	
			[89] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败所有守卫 ${solo_challenge.score}/${solo_challenge.score_need}",
			},
			[90] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败沙加",
			},	
						[94] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击毁石柱",
			},	
			[95] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败亚鲁格路",
			},	
			[98] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败精英守卫 ${solo_challenge.score}/${solo_challenge.score_need}",
			},	
			[100] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败童虎幻影",
			},	
			[104] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败所有守卫 ${solo_challenge.score}/${solo_challenge.score_need}",
			},
			[105] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败一辉",
			},	
						[109] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败精英守卫 ${solo_challenge.score}/${solo_challenge.score_need}",
			},	
			[110] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败米罗",
			},	
			[114] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击毁石柱",
			},
			[115] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败星矢",
			},	
									[119] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败精英守卫 ${solo_challenge.score}/${solo_challenge.score_need}",
							},	
			[120] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败艾欧罗斯",
			},	
			[124] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败所有守卫 ${solo_challenge.score}/${solo_challenge.score_need}",
			},
			[125] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败紫龙",
			},	
									[129] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败精英守卫 ${solo_challenge.score}/${solo_challenge.score_need}",
							},	
			[130] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败修罗",
			},	
									[134] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击毁石柱 ",
							},	
			[135] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败冰河",
			},	
			[139] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败精英守卫 ${solo_challenge.score}/${solo_challenge.score_need}",
			},
			[140] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败卡妙",
			},	
									[144] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击毁石柱 ",
							},	
			[145] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败瞬",
			},	
			[149] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败所有守卫 ${solo_challenge.score}/${solo_challenge.score_need}",
			},
			[150] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败阿布罗狄",
			},	
									[154] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败精英守卫 ${solo_challenge.score}/${solo_challenge.score_need}",
							},	
			[155] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败戴达罗斯",
			},	
			[159] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击毁石柱",
			},
			[160] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败加隆",
			},	
			[164] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击毁石柱",
			},
			[165] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败史昂",
			},	
			[170] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败撒加",
			},	
			[175] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败前代白羊座",
			},	
			[180] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败前代金牛座",
			},	
			[185] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败前代双子座",
			},	
			[190] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败前代巨蟹座",
			},	
			[195] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败前代狮子座",
			},	
			[200] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败前代处女座",
			},	
			[205] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败前代天秤座",
			},	
			[210] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败前代天蝎座",
			},	
			[215] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败前代射手座",
			},	
			[220] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败前代摩羯座",
			},	
			[225] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败前代水瓶座",
			},	
			[230] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败前代双鱼座",
			},	
			[235] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败撒加",
			},	
			[240] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败撒加",
			},	
			[245] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败撒加",
			},	
			[249] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"击败撒加",
			},
			[250] = {	
				_t"剩余时间：${solo_challenge.time_text}",
				_t"你已经通关了！",
			},
		},
	},
	{
		id = 4,
		name = _t"阶段目标",
		quality = 4,
		category = "huodong",
		variable = function()
			local _, _, _, world_id = GameApi.GetHostPos()
			if world_id ~= 416 then return end
			return GameApi.GetInstanceVar(101)
		end,

		trace = {
			[0] = {
				_t"地妖星 0/5",
			},
			[1] = {
				_t"地妖星 1/5",
			},
			[2] = {
				_t"地妖星 2/5",
			},
			[3] = {
				_t"地妖星 3/5",
			},
			[4] = {
				_t"地妖星 4/5",
			},
			[5] = {
				_t"斯芬克斯 0/1",
			},
			[6] = {
				_t"副本通关",
			},
		},
	},
	
	{
		id = 5,
		name = _t"竞技模式达成目标",
		quality = 4,
		category = "huodong",
		variable = function()
			local _, _, _, world_id = GameApi.GetHostPos()
			if world_id ~= 602 then return end
			return GameApi.GetInstanceVar(10000)
		end,

		trace = {
			[0] = {
				_t"等待战斗开始\r请耐心等待90s\r以便玩家全部进入场地",
			},
			[1] = {
				_t"杀戮模式：\r首先击杀敌方玩家32次的队伍即可获得获胜\r该模式所有玩家可无限次复活",
			},
			[2] = {
				_t"守卫精英模式：\r击杀对方带标记的玩家即可获胜\r该模式其余玩家可无限次复活",
			},
			[3] = {
				_t"旗帜夺取模式：\r旗帜在开场后一定时间内出现在中央桥梁上\r夺得旗帜并运送到本方出生点区域即可获胜\r旗帜死亡时掉落\r该模式所有玩家可无限次复活",
			},
		},
	},
	{
		id = 6,
		name = _t"逆流！黄金试炼",
		quality = 4,
		category = "huodong",
		variable = function()
			return GameApi.GetTeamReputation(3)
		end,

		trace = {
			[1] = {
				_t"^ffd700逆流！双鱼幻境通关 ${npc(42573)}",
				_t"逆流！天秤幻境通关",
				_t"逆流！狮子幻境通关",
			},
			[2] = {
				_t"^ffd700逆流！双鱼幻境通关 ${npc(42573)}",
				_t"逆流！天秤幻境通关",
				_t"逆流！狮子幻境通关",
			},
			[3] = {
				_t"^00ff00逆流！双鱼幻境通关 (完成)",
				_t"^ffd700逆流！天秤幻境通关 ${npc(42573)}",
				_t"逆流！狮子幻境通关",
			},
			[4] = {
				_t"^00ff00逆流！双鱼幻境通关 (完成)",
				_t"^ffd700逆流！天秤幻境通关 ${npc(42573)}",
				_t"逆流！狮子幻境通关",
			},
			[5] = {
				_t"^00ff00逆流！双鱼幻境通关 (完成)",
				_t"^00ff00逆流！天秤幻境通关 (完成)",
				_t"^ffd700逆流！狮子幻境通关 ${npc(42573)}",
			},
			[6] = {
				_t"^00ff00逆流！双鱼幻境通关 (完成)",
				_t"^00ff00逆流！天秤幻境通关 (完成)",
				_t"^ffd700逆流！狮子幻境通关 ${npc(42573)}",
			},
		},
	},
}