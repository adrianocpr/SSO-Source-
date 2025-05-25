--[[ @i18n config ]]
local _t = require("i18n").context("config")
---------------------------------------------------------------
--  created:   2012.11.1
--  author:    chenfudun
--
--  属性包配置模板
---------------------------------------------------------------

-- 需特殊处理的属性包大类
ADDON_SPECIAL_SKILL = 1

-- 需特殊处理的属性包模板id
Addon_Special_Templ_Id = 
{
	[ADDON_SPECIAL_SKILL] = {102, 103, 104, 143},
}

-- 属性包所有类型
Addon_Templ = 
{
	[0] = 
	{
		name = _t"调整战力固定值",
		format = _t"^ffff00★战力 %d^f2f3f2",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[1] = 
	{
		name = _t"调整生命力固定值",
		format = _t"生命力+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[2] = 
	{
		name = _t"调整体力值固定值",
		format = _t"体力+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[3] = 
	{
		name = _t"调整斗气上限固定值",
		format = _t"斗气+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[4] = 
	{
		name = _t"调整怒气上限固定值",
		format = _t"怒气+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[5] = 
	{
		name = _t"调整生命恢复速度固定值",
		format = _t"生命恢复+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[6] = 
	{
		name = _t"调整战斗状态生命恢复速度固定值",
		format = _t"战斗生命恢复+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[7] = 
	{
		name = _t"调整MP恢复速度固定值",
		format = _t"MP恢复+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[8] = 
	{
		name = _t"调整战斗状态MP恢复速度固定值",
		format = _t"战斗MP恢复+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[9] = 
	{
		name = _t"调整斗气恢复速度固定值",
		format = _t"斗气恢复+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[10] = 
	{
		name = _t"调整战斗状态斗气恢复速度固定值",
		format = _t"战斗斗气恢复+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[11] = 
	{
		name = _t"调整怒气恢复速度固定值",
		format = _t"怒气恢复+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[12] = 
	{
		name = _t"调整战斗状态怒气恢复速度固定值",
		format = _t"战斗怒气恢复+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[13] = 
	{
		name = _t"调整地属性攻击力固定值",
		format = _t"地攻击+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[14] = 
	{
		name = _t"调整水属性攻击力固定值",
		format = _t"水攻击+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[15] = 
	{
		name = _t"调整火属性攻击力固定值",
		format = _t"火攻击+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[16] = 
	{
		name = _t"调整风属性攻击力固定值",
		format = _t"风攻击+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[17] = 
	{
		name = _t"调整地属性抗性固定值",
		format = _t"地抗性+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[18] = 
	{
		name = _t"调整水属性抗性固定值",
		format = _t"水抗性+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[19] = 
	{
		name = _t"调整火属性抗性固定值",
		format = _t"火抗性+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[20] = 
	{
		name = _t"调整风属性抗性固定值",
		format = _t"风抗性+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[21] = 
	{
		name = _t"调整地属性抗性减免固定值",
		format = _t"地抗性减免+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[22] = 
	{
		name = _t"调整水属性抗性减免固定值",
		format = _t"水抗性减免+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[23] = 
	{
		name = _t"调整火属性抗性减免固定值",
		format = _t"火抗性减免+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[24] = 
	{
		name = _t"调整风属性抗性减免固定值",
		format = _t"风抗性减免+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[25] = 
	{
		name = _t"调整地属性伤害倍率",
		format = _t"地攻击伤害+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},
	[26] = 
	{
		name = _t"调整水属性伤害倍率",
		format = _t"水攻击伤害+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},
	[27] = 
	{
		name = _t"调整火属性伤害倍率",
		format = _t"火攻击伤害+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},
	[28] = 
	{
		name = _t"调整风属性伤害倍率",
		format = _t"风攻击伤害+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},
	[29] = 
	{
		name = _t"调整行走速度固定值",
		format = _t"行走速度+%0.1f米/秒",
		unit = _t"米/秒",
		mul_power = 100,
		func = ""
	},
	[30] = 
	{
		name = _t"调整奔跑速度固定值",
		format = _t"奔跑速度+%0.1f米/秒",
		unit = _t"米/秒",
		mul_power = 100,
		func = ""
	},
	[31] = 
	{
		name = _t"调整骑乘速度固定值",
		format = _t"骑乘速度+%0.1f米/秒",
		unit = _t"米/秒",
		mul_power = 100,
		func = ""
	},
	[32] = 
	{
		name = _t"调整飞行速度固定值",
		format = _t"飞行速度+%0.1f米/秒",
		unit = _t"米/秒",
		mul_power = 100,
		func = ""
	},
	[33] = 
	{
		name = _t"调整游泳速度固定值",
		format = _t"游泳速度+%0.1f米/秒",
		unit = _t"米/秒",
		mul_power = 100,
		func = ""
	},
	[34] = 
	{
		name = _t"调整跳跃高度固定值",
		format = _t"跳跃高度+%0.1f米/秒",
		unit = _t"米/秒",
		mul_power = 100,
		func = ""
	},
	[35] = 
	{
		name = _t"调整命中固定值",
		format = _t"命中+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[36] = 
	{
		name = _t"调整闪躲固定值",
		format = _t"闪避+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[37] = 
	{
		name = _t"调整小攻击力固定值",
		format = _t"攻击力下限+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[38] = 
	{
		name = _t"调整大攻击力固定值",
		format = _t"攻击力上限+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[39] = 
	{
		name = _t"调整防御力固定值",
		format = _t"防御力+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[40] = 
	{
		name = _t"调整附加伤害固定值",
		format = _t"附加伤害+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},
	[41] = 
	{
		name = _t"调整伤害倍率固定值",
		format = _t"伤害+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},
	[42] = 
	{
		name = _t"调整暴击率固定值",
		format = _t"暴击率+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},
	[43] = 
	{
		name = _t"调整暴击附加伤害固定值",
		format = _t"暴击伤害+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[44] = 
	{
		name = _t"调整暴击率减免固定值",
		format = _t"暴击率减免+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},
	[45] = 
	{
		name = _t"调整暴击附加伤害减免固定值",
		format = _t"暴伤减免+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[46] = 
	{
		name = _t"调整幸运一击率固定值",
		format = _t"幸运一击率+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},
	[47] = 
	{
		name = _t"调整直击率固定值",
		format = _t"直击率+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},
	[48] = 
	{
		name = _t"调整物理伤害抗性固定值",
		format = _t"物伤抗性+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},
	[49] = 
	{
		name = _t"调整法术伤害抗性固定值",
		format = _t"法伤抗性+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},
	[50] = 
	{
		name = _t"调整中毒抗性固定值",
		format = _t"中毒抗性+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[51] = 
	{
		name = _t"调整混乱抗性固定值",
		format = _t"眩晕抗性+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[52] = 
	{
		name = _t"调整虚弱抗性固定值",
		format = _t"睡眠抗性+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[53] = 
	{
		name = _t"调整沉默抗性固定值",
		format = _t"沉默抗性+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[54] = 
	{
		name = _t"调整减速抗性固定值",
		format = _t"减速抗性+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[55] = 
	{
		name = _t"调整忽视中毒抗性固定值",
		format = _t"忽视中毒抗性+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[56] = 
	{
		name = _t"调整忽视混乱抗性固定值",
		format = _t"忽视眩晕抗性+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[57] = 
	{
		name = _t"调整忽视虚弱抗性固定值",
		format = _t"忽视睡眠抗性+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[58] = 
	{
		name = _t"调整忽视沉默抗性固定值",
		format = _t"忽视沉默抗性+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[59] = 
	{
		name = _t"调整忽视减速抗性固定值",
		format = _t"忽视减速抗性+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[60] = 
	{
		name = _t"调整被治疗效果固定值",
		format = _t"被治疗效果+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[61] = 
	{
		name = _t"调整生命力百分比",
		format = _t"生命力+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[62] = 
	{
		name = _t"调整体力值百分比",
		format = _t"体力+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[63] = 
	{
		name = _t"调整斗气上限百分比",
		format = _t"斗气+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[64] = 
	{
		name = _t"调整怒气上限百分比",
		format = _t"怒气+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[65] = 
	{
		name = _t"调整生命值恢复速度百分比",
		format = _t"生命恢复+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[66] = 
	{
		name = _t"调整战斗状态生命值恢复速度百分比",
		format = _t"战斗生命恢复+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},
	[67] = 
	{
		name = _t"调整体力值恢复速度百分比",
		format = _t"体力恢复+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[68] = 
	{
		name = _t"调整战斗状态体力值恢复速度百分比",
		format = _t"战斗体力恢复+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[69] = 
	{
		name = _t"调整斗气恢复速度百分比",
		format = _t"斗气恢复+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[70] = 
	{
		name = _t"调整战斗状态斗气恢复速度百分比",
		format = _t"战斗斗气恢复+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[71] = 
	{
		name = _t"调整怒气恢复速度百分比",
		format = _t"怒气恢复+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[72] = 
	{
		name = _t"调整战斗状态怒气恢复速度百分比",
		format = _t"战斗怒气恢复+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},
	[73] = 
	{
		name = _t"调整地属性攻击力百分比",
		format = _t"地攻击+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[74] = 
	{
		name = _t"调整水属性攻击力百分比",
		format = _t"水攻击+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[75] = 
	{
		name = _t"调整火属性攻击力百分比",
		format = _t"火攻击+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[76] = 
	{
		name = _t"调整风属性攻击力百分比",
		format = _t"风攻击+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[77] = 
	{
		name = _t"调整行走速度百分比",
		format = _t"行走速度+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[78] = 
	{
		name = _t"调整奔跑速度百分比",
		format = _t"奔跑速度+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},
	[79] = 
	{
		name = _t"调整骑乘速度百分比",
		format = _t"骑乘速度+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[80] = 
	{
		name = _t"调整飞行速度百分比",
		format = _t"飞行速度+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[81] = 
	{
		name = _t"调整游泳速度百分比",
		format = _t"游泳速度+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[82] = 
	{
		name = _t"调整跳跃高度百分比",
		format = _t"跳跃高度+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[83] = 
	{
		name = _t"调整命中百分比",
		format = _t"命中+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[84] = 
	{
		name = _t"调整闪躲百分比",
		format = _t"闪避+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[85] = 
	{
		name = _t"调整小攻击力百分比",
		format = _t"攻击力下限+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[86] = 
	{
		name = _t"调整大攻击力百分比",
		format = _t"攻击力上限+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[87] = 
	{
		name = _t"调整防御力百分比",
		format = _t"防御力+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[88] = 
	{
		name = _t"调整暴击附加伤害百分比",
		format = _t"暴击伤害+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[89] = 
	{
		name = _t"调整暴击附加伤害减免百分比",
		format = _t"暴伤减免+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[90] = 
	{
		name = _t"调整中毒抗性百分比",
		format = _t"中毒抗性+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},
	[91] = 
	{
		name = _t"调整混乱抗性百分比",
		format = _t"眩晕抗性+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[92] = 
	{
		name = _t"调整虚弱抗性百分比",
		format = _t"睡眠抗性+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[93] = 
	{
		name = _t"调整沉默抗性百分比",
		format = _t"沉默抗性+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[94] = 
	{
		name = _t"调整减速抗性百分比",
		format = _t"减速抗性+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[95] = 
	{
		name = _t"调整忽视中毒抗性百分比",
		format = _t"忽视中毒抗性+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[96] = 
	{
		name = _t"调整忽视混乱抗性百分比",
		format = _t"忽视眩晕抗性+%.0f%%",
		unit = "%%",
		mul_power = 1,
		func = ""
	},
	[97] = 
	{
		name = _t"调整忽视虚弱抗性百分比",
		format = _t"忽视睡眠抗性+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[98] = 
	{
		name = _t"调整忽视沉默抗性百分比",
		format = _t"忽视沉默抗性+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[99] = 
	{
		name = _t"调整忽视减速抗性百分比",
		format = _t"忽视减速抗性+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[100] = 
	{
		name = _t"调整被治疗效果百分比",
		format = _t"被治疗效果+%.0f%%",
		unit = "%%%%",
		mul_power = 100,
		func = ""
	},	
	[101] = 
	{
		name = _t"调整攻击力百分比",
		format = _t"攻击力+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[102] = 
	{
		name = _t"附加新技能",
		format = "%s+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[103] = 
	{
		name = _t"减少指定技能冷却时间",
		format = _t"%s减少冷却%d毫秒",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[104] = 
	{
		name = _t"增加已有技能等级",
		format = _t"额外技能：%s+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[105] = 
	{
		name = _t"金钱获得增加百分比",
		format = _t"金钱获得+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[106] = 
	{
		name = _t"经验获得增加百分比",
		format = _t"杀怪经验获得+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[107] = 
	{
		name = _t"调整攻击力固定值",
		format = _t"攻击力+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[108] = 
	{
		name = _t"调整伤害抗性固定值",
		format = _t"伤害抗性+%.0f%%",
		unit = "",
		mul_power = 100,
		func = ""
	},
	[109] = 
	{
		name = _t"调整重击固定值",
		format = _t"重击+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[110] = 
	{
		name = _t"调整招架固定值",
		format = _t"招架+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[111] = 
	{
		name = _t"调整护甲固定值",
		format = _t"护甲+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},
	[112] = 
	{
		name = _t"调整破甲固定值",
		format = _t"破甲+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[113] = 
	{
		name = _t"调整雷属性攻击力固定值",
		format = _t"雷攻击+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[114] = 
	{
		name = _t"调整雷属性抗性固定值",
		format = _t"雷抗性+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[115] = 
	{
		name = _t"调整雷属性抗性减免固定值",
		format = _t"雷抗性减免+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[116] = 
	{
		name = _t"调整雷属性伤害倍率",
		format = _t"雷攻击伤害+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[117] = 
	{
		name = _t"调整流血抗性固定值",
		format = _t"流血抗性+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[118] = 
	{
		name = _t"调整灼烧抗性固定值",
		format = _t"灼烧抗性+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[119] = 
	{
		name = _t"调整倒地抗性固定值",
		format = _t"倒地抗性+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[120] = 
	{
		name = _t"调整冰冻抗性固定值",
		format = _t"冰冻抗性+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[121] = 
	{
		name = _t"调整石化抗性固定值",
		format = _t"石化抗性+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[122] = 
	{
		name = _t"调整流血抗性减免固定值",
		format = _t"流血抗性减免+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[123] = 
	{
		name = _t"调整灼烧抗性减免固定值",
		format = _t"灼烧抗性减免+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[124] = 
	{
		name = _t"调整倒地抗性减免固定值",
		format = _t"倒地抗性减免+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[125] = 
	{
		name = _t"调整冰冻抗性减免固定值",
		format = _t"冰冻抗性减免+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[126] = 
	{
		name = _t"调整石化抗性减免固定值",
		format = _t"石化抗性减免+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[127] = 
	{
		name = _t"调整雷属性攻击力百分比",
		format = _t"雷攻击+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[128] = 
	{
		name = _t"调整流血抗性百分比",
		format = _t"流血抗性+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[129] = 
	{
		name = _t"调整灼烧抗性百分比",
		format = _t"灼烧抗性+%.0f%%",
		unit = "%%",
		mul_power = 1,
		func = ""
	},
	[130] = 
	{
		name = _t"调整倒地抗性百分比",
		format = _t"倒地抗性+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[131] = 
	{
		name = _t"调整冰冻抗性百分比",
		format = _t"冰冻抗性+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[132] = 
	{
		name = _t"调整石化抗性百分比",
		format = _t"石化抗性+%.0f%%",
		unit = "%%",
		mul_power = 1,
		func = ""
	},
	[133] = 
	{
		name = _t"调整流血抗性减免百分比",
		format = _t"流血抗性减免+%.0f%%",
		unit = "%%",
		mul_power = 1,
		func = ""
	},	
	[134] = 
	{
		name = _t"调整灼烧抗性减免百分比",
		format = _t"灼烧抗性减免+%.0f%%",
		unit = "%%",
		mul_power = 1,
		func = ""
	},	
	[135] = 
	{
		name = _t"调整倒地抗性减免百分比",
		format = _t"倒地抗性减免+%.0f%%",
		unit = "%%",
		mul_power = 1,
		func = ""
	},	
	[136] = 
	{
		name = _t"调整冰冻抗性减免百分比",
		format = _t"冰冻抗性减免+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[137] = 
	{
		name = _t"调整石化抗性减免百分比",
		format = _t"石化抗性减免+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[138] = 
	{
		name = _t"调整全属性攻击力固定值",
		format = _t"所有属性攻击+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[139] = 
	{
		name = _t"调整全属性抗性固定值",
		format = _t"所有属性抗性+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[140] = 
	{
		name = _t"调整全属性抗性减免固定值",
		format = _t"所有属性抗性减免+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[141] = 
	{
		name = _t"调整全属性伤害倍率固定值",
		format = _t"所有属性伤害+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[142] = 
	{
		name = _t"调整全属性攻击力百分比",
		format = _t"所有属性攻击+%.0f%%",
		unit = "%%",
		mul_power = 100,
		func = ""
	},	
	[143] = 
	{
		name = _t"提升对应职业所学技能等级",
		format = "%s+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[144] = 
	{
		name = _t"调整全异常状态抗性固定值",
		format = _t"全异常状态抗性+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},	
	[145] = 
	{
		name = _t"调整全异常状态抗性减免固定值",
		format = _t"全异常状态抗性减免+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
	[146] = 
	{
		name = _t"调整冥化等级固定值",
		format = _t"冥化等级+%d",
		unit = "",
		mul_power = 1,
		func = ""
	},
																																																														
}