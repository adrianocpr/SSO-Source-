--[[ @i18n help ]]
local _t = require("i18n").context("help")
------------------------
-- 特殊任务帮助提示

-- 接受某任务

HelpAcceptIdTask = {}
HelpFinishIdTask = {}
HelpFirstAcceptIdTask = {}




--新手村
--HelpAcceptIdTask[937] = --移动指引
--{
	--txt = "按住W、A、S、D进行移动，该指引ESC可关闭",
	--panel = "Panel_QuestTrace",
	--OffX = 0,
	--OffY = 0,
	--aligntype = 0,
--}

--HelpAcceptIdTask[951] = --任务追踪栏指引
--{
	--txt = "点击对应npc进行自动寻径，该指引ESC可关闭",
	--panel = "Panel_QuestTrace",
	--OffX = -245,
	--OffY = 66,
	--aligntype = 2,
--}

--HelpAcceptIdTask[2975] = --视角挪动指引
--{
	--txt = "请按住右键拖动鼠标来移动视角",
	--aligntype = 0,
--}

--HelpAcceptIdTask[2978] = --视角挪动指引
--{
	--txt = "双击并按住W键，开启加速跑！",
	--aligntype = 0,
--}

--HelpAcceptIdTask[2983] = --视角挪动指引
--{
	--txt = "请点击地面上闪光的物体进行采集操作",
	--aligntype = 0,
--}

--HelpFinishIdTask[3005] = --加速跑消耗指引
--{
	--txt = "快速奔跑会消耗能量槽，请节约使用",
	--panel = "Panel_Portrait",
	--OffX = 200,
	--OffY = 93,
	--aligntype = 1,
--}

--HelpAcceptIdTask[2977] = --使用技能指引
--{
	--txt = "右键点击训练石块并使用技能进行攻击",
	--panel = "Panel_QuickBar",
	--OffX = -515,
	--OffY = -38,
	--aligntype = 4,
--}

--HelpAcceptIdTask[2981] = --翻滚指引
--{
	--txt = "移动中按shift可以做出前滚翻等紧急回避动作",
	--aligntype = 0,
--}

--HelpAcceptIdTask[2979] = --加速状态指引
--{
	--txt = "您获得了加速状态,可以快速到达目的地",
	--OffX = 0,
	--OffY = 0,
	--aligntype = 0,
--}

--HelpAcceptIdTask[2090] = --跳跃任务&支线任务
--{
	--txt = "接到了第一个支线任务，使用二段跳跳上屋顶",
	--panel = "Panel_QuestTrace",
	--OffX = 145,
	--OffY = 62,
--}

--HelpFinishIdTask[1920] = --获得圣衣 
--{
	--txt = "获得了新的圣衣，打开圣衣标签页查看",
	--panel = "Panel_SystemBar",
	--OffX = -30,
	--OffY = 70,
	--aligntype = 2,
--}

--HelpAcceptIdTask[1067] = --小宇宙爆发提示
--{
	--txt = "点击能量槽爆发小宇宙",
	--panel = "Panel_QuickBar",
	--OffX = 590,
	--OffY = -50,
	--aligntype = 3,
--}
	
--HelpFinishIdTask[1981] = --小宇宙、占星
--{
	--txt = "可以进入小宇宙界面进行占星和镶嵌了",
	--panel = "Panel_SystemBar",
	--OffX = -23,
	--OffY = 30,
	--aligntype = 2,
--}

--[[
--死亡皇后岛
----finish
HelpFinishIdTask[1054] = --死亡皇后岛 叹号指引
{
	txt = "^ffff00可以在头顶有^00ffff叹号^ffff00的人处接受任务。",
}


----accept
HelpFirstAcceptIdTask[1055] = --死亡皇后岛 问号指引
{
	txt = "按住^00ffff鼠标右键^ffff00转视角，头上有^00ffff问号^ffff00的人在一旁等你。",
}
HelpFirstAcceptIdTask[1056] =  --死亡皇后岛
{
	txt = "按下^00fffftab键^ffff00或^00ffff鼠标左键^ffff00点击可以选中敌人。",
	func = 'MainTargetHint',
}

HelpFirstAcceptIdTask[1077] = --死亡皇后岛
{
	txt = "获得了移动速度加快的状态。",
	panel = "Panel_Radar",
	OffX = -189,
	OffY = 79,
	aligntype = 2,
}

HelpFirstAcceptIdTask[1054] =
{
func = 'NpcCloseShowHint',
}

HelpFirstAcceptIdTask[1058] =
{
	txt = "点击任务名可查看任务详情。",
	panel = "Panel_QuestTrace",
	OffX = 100,
	OffY = 40,
}
HelpFirstAcceptIdTask[1067] = --死亡皇后岛
{
	txt = "地面的闪光物体可以点击拾取。"
}

HelpFirstAcceptIdTask[1110] =
{
	txt = "可以使用念力技能快速转移。",
	skillId = {190,},
	panel = "Panel_QuickBar",
	OffX = 390,
	OffY = -40,
	func = "ShowGfxSkill",
	aligntype = 3,
}

--庐山
----finish
HelpFirstAcceptIdTask[8866]=
{
	func = 'NpcCloseShowHint_LuShan',
}

HelpFirstAcceptIdTask[1698] = HelpFirstAcceptIdTask[1056]   --庐山选怪战斗提示
HelpFirstAcceptIdTask[1699] =
{

}

HelpFinishIdTask[1697] = HelpFinishIdTask[1056] --庐山

HelpFinishIdTask[1774] = HelpFinishIdTask[1055] --庐山

HelpFinishIdTask[4474] =	---小宇宙爆发指引（庐山）
HelpFinishIdTask[4395]

HelpFinishIdTask[4107] =
{
	panel = "Panel_QuickBarTemp",
	txt = "背包中有神秘礼物哦，快打开看看吧。",
	itemId = {16946},
	OffX = 30,
	OffY = 30,
}

HelpFinishIdTask[2723] =
{
	txt = "点击带上宠物",
	itemId = {16289},
	panel = "Panel_QuickBarTemp",
	OffX = 30,
	OffY = 50,
	func = "ShowGfxItem",
}


--HelpFinishIdTask[1070] = --死亡皇后岛
--{
--	txt = "点击更换武器",
--	--itemId = {1411,2325,2625,},
--	panel = "Panel_QuickBarTemp",
--	OffX = 30,
--	OffY = 60,
--	func = "ShowGfxEquip",
--}

HelpFirstAcceptIdTask[1701] = HelpFirstAcceptIdTask[1067]  --庐山

--HelpFirstAcceptIdTask[1070] = --死亡皇后岛
--{
--	txt = "按键盘上“Tab”键可快速选中怪物。",
--}

HelpFirstAcceptIdTask[1699] = HelpFirstAcceptIdTask[1070]--庐山

--HelpFirstAcceptIdTask[1057] =
--{
--	txt = "点击新获得的装备。",
--	itemId = {5025,5325,5175,},
--	panel = "Panel_QuickBarTemp",
--	func = "ShowGfxEquip",
--}

HelpFirstAcceptIdTask[2445] =
{
	txt = "放入想要聚能的圣衣",
	panel = "Panel_EquipEnhance",
	OffX = 50,
	OffY = 50,
	func = "OnShow",
}

HelpFirstAcceptIdTask[280] =
{
	txt = "点击这里可以使用任务道具。",
	panel = "Panel_QuestTrace",
	OffX = 15,
	OffY = 60,
}

HelpFirstAcceptIdTask[2324] =
{
	txt = "双倍剩余时间，旁边的按钮可以开启或关闭双倍的效果",
    OffX = 220,
    OffY = 30,
	aligntype = 1,
}

HelpFirstAcceptIdTask[2984]=  --主城传送任务指引
{
	func = 'FirstAcceptTeleportTask',
}
]]

-- 第一次完成某任务
HelpFirstFinishIdTask = {}
