--[[ @i18n help ]]
local _t = require("i18n").context("help")
------------------
-- 帮助信息提示

--颜色常量
HELP_COLOR_WHITE = "^FFFFFF"
HELP_COLOR_GREEN = "^00ff00"

--首次活动、定时活动、周常活动、世界BOSS争抢
HELP_ACTIVITY = 0xFFFFF0
HELP_ACTIVITY_QUEUE = 0xFFFFF1
HELP_ACTIVITY_NPC   = 0xFFFFF2
HELP_ACTIVITY_AWARD = 0xFFFFF3
HELP_ACTIVITY_WEEKS = 0xFFFFF4
HELP_ACTIVITY_BOSS  = 0xFFFFF5
HELP_RADIO  = 0xFFFFF6

HELP_ACTIVITTIES = {}
HELP_ACTIVITTIES = {
    HELP_ACTIVITY_QUEUE,
    HELP_ACTIVITY_NPC,
    HELP_ACTIVITY_AWARD,
    HELP_ACTIVITY_WEEKS,
    HELP_ACTIVITY_BOSS,
}

HelpData = {}

--第一次进入游戏
--HelpData[LEVT_FIRST_ENTER_GAME] =
--{
--}

HelpData[LEVT_FIRST_LOW_HP_IN_FIGHT] =
{
	txt = _t"你的生命值过低！请点击快捷栏上的药品进行回复",
	--panel = "Panel_QuickBar",
	OffX = 0,
	OffY = 200,
	aligntype = 0,
}

--HelpData[LEVT_FIRST_FIGHT] =
--{
--}



--HelpData[LEVT_FIRST_DIE] =
--{
  --txt = "你已经死亡，请点击复活，返回复活点",
	--panel = "Panel_Revive",
	--OffX = 100,
	--OffY = 140,
--}



--HelpData[LEVT_FIRST_GAIN_EQUIPMENT] =
--{
	--txt = "有新的装备，点击右键快速装备",
	--panel = "Panel_QuickBarTemp",
	--OffX = 140,
	--OffY = 140,
--}

--HelpData[LEVT_FIRST_LEARN_SKILL] =
--{
	--txt = "学会了新的，可拖拽到任意快捷栏",
	--panel = "Panel_QuickBar",
	--OffX = 30,
	--OffY = -40,
	--aligntype = 3,
--}

-- 首次活动
HelpData[HELP_ACTIVITY] =
{
   txt = "",
   panel = "Panel_Radar",
   item  = "Button_Daily",
   OffX = -194,
   OffY = -40,
   format = _t"您开启了新的活动:\r%s",
   aligntype = 4,
   sound = 1,   --“您开启了新的活动，请点击日程表查看”
}

HelpData[HELP_RADIO] =
{
   txt = _t"星座电台热播中！快来收听吧！",
   panel = "Panel_Radar",
   item  = "Button_Radio",
   OffX = -14,
   OffY = -14,
   aligntype = 4,
}

--首次活动报名排队系统
HelpData[HELP_ACTIVITY_QUEUE] =
{
   txt = "",
   panel = "Panel_DailySub",
   item  = "Check_team",
   OffX = 282,
   OffY = 46,
   format = _t"点击这里报名，加入副本自动排队系统",
   aligntype = 1,
}

--首次活动NPC
HelpData[HELP_ACTIVITY_NPC] =
{
   txt = "",
   panel = "Panel_Daily",
   item  = "Text_Pos",
   OffX = 485,
   OffY = 223,
   format = _t"首次活动NPC",
   aligntype = 1,
}

--首次活动奖励
HelpData[HELP_ACTIVITY_AWARD] =
{
   txt = "",
   panel = "Panel_Daily",
   item  = "Text_Award",
   OffX = 485,
   OffY = 267,
   format = _t"首次活动奖励",
   aligntype = 1,
}

--周常活动
HelpData[HELP_ACTIVITY_WEEKS] =
{
   txt = "",
   panel = "Panel_Daily",
   item  = "Radio_dailyWeek",
   OffX = 170,
   OffY = -358,    
   format = _t"请点击查看周常活动:\r%s",
   aligntype = 3,    
}

--世界BOSS争抢
HelpData[HELP_ACTIVITY_BOSS] =
{
   txt = "",
   panel = "Panel_Daily",
   item  = "Radio_Boss",
   OffX = 250,
   OffY = -358,    
   format = _t"请点击查看BOSS活动:\r%s",
   aligntype = 3,    
}

--HelpData[LEVT_FIRST_NPC_TALK] =
--{   
--}


HelpData[LEVT_FIRST_MONSTER_POWER_EXHAUST] =
{
	txt = _t"根据提示按下按键。",
	panel = "Panel_ComboHitQTE",
	OffX = 140,
	OffY = 140,
}
HelpData[LEVT_FIRST_MONSTER_DRIFT] =
{
--	txt = "使用浮空终结技能！",
--	skillId = {166,},
--	panel = "Panel_MainTarget",
--	OffX = 150,
--	OffY = 100,
}

--HelpData[LEVT_FIRST_LOW_HP_OUT_FIGHT] =
--{
	--txt = "使用冥想技能。",
	--skillId = {189,},
	--func = "ShowGfxSkill",
	--panel = "Panel_QuickBar",
	--OffX = 350,
	--OffY = -40,
	--aligntype = 3,
--}
HelpData[LEVT_FIRST_TASK_ACCEPT] =
{
}


HelpData[LEVT_FIRST_GAIN_SPEC_ITEM]=
{
	['horse'] =
	{
		itemId = 'horse',
		panel = 'Panel_QuickBarTemp',
		OffX = 30,
        OffY = 60,
	}
}
HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][11725]=
{

         panel = "Panel_QuickBarTemp",
         RunTimePanel = "Panel_Kosumo",
         RunTimeFunc = "ShowStarSoulHelp",
         OffX = 30,
         OffY = 30,
         itemId = {11725,},
            txt = _t"可以将星魂装备到小宇宙上哦",

}
HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][11726]=
{

         panel = "Panel_QuickBarTemp",
         RunTimePanel = "Panel_Kosumo",
         RunTimeFunc = "ShowStarSoulHelp",
         OffX = 30,
         OffY = 30,
         itemId = {11726,},
            txt = _t"可以将星魂装备到小宇宙上哦",

}
HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][11727]=
{

         panel = "Panel_QuickBarTemp",
         RunTimePanel = "Panel_Kosumo",
         RunTimeFunc = "ShowStarSoulHelp",
         OffX = 30,
         OffY = 30,
         itemId = {11727,},
            txt = _t"可以将星魂装备到小宇宙上哦",

}
HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][11728]=
{

         panel = "Panel_QuickBarTemp",
         RunTimePanel = "Panel_Kosumo",
         RunTimeFunc = "ShowStarSoulHelp",
         OffX = 30,
         OffY = 30,
         itemId = {11728,},
            txt = _t"可以将星魂装备到小宇宙上哦",

}
HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][11729]=
{

         panel = "Panel_QuickBarTemp",
         RunTimePanel = "Panel_Kosumo",
         RunTimeFunc = "ShowStarSoulHelp",
         OffX = 30,
         OffY = 30,
         itemId = {11729,},
            txt = _t"可以将星魂装备到小宇宙上哦",

}
HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][11730]=
{

         panel = "Panel_QuickBarTemp",
         RunTimePanel = "Panel_Kosumo",
         RunTimeFunc = "ShowStarSoulHelp",
         OffX = 30,
         OffY = 30,
         itemId = {11730,},
            txt = _t"可以将星魂装备到小宇宙上哦",

}
HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][11731]=
{

         panel = "Panel_QuickBarTemp",
         RunTimePanel = "Panel_Kosumo",
         RunTimeFunc = "ShowStarSoulHelp",
         OffX = 30,
         OffY = 30,
         itemId = {11731,},
            txt = _t"可以将星魂装备到小宇宙上哦",

}
HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][11732]=
{

         panel = "Panel_QuickBarTemp",
         RunTimePanel = "Panel_Kosumo",
         RunTimeFunc = "ShowStarSoulHelp",
         OffX = 30,
         OffY = 30,
         itemId = {11732,},
            txt = _t"可以将星魂装备到小宇宙上哦",

}
HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][11733]=
{

         panel = "Panel_QuickBarTemp",
         RunTimePanel = "Panel_Kosumo",
         RunTimeFunc = "ShowStarSoulHelp",
         OffX = 30,
         OffY = 30,
         itemId = {11733,},
            txt = _t"可以将星魂装备到小宇宙上哦",

}
HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][11734]=
{

         panel = "Panel_QuickBarTemp",
         RunTimePanel = "Panel_Kosumo",
         RunTimeFunc = "ShowStarSoulHelp",
         OffX = 30,
         OffY = 30,
         itemId = {11734,},
            txt = _t"可以将星魂装备到小宇宙上哦",

}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][11727]=
{

        	panel = "Panel_QuickBarTemp",
        	RunTimePanel = "Panel_Kosumo",
        	RunTimeFunc = "ShowStarSoulHelp",
        	OffX = 30,
        	OffY = 30,
        	itemId = {11727,},
            txt = _t"可以将星魂装备到小宇宙上哦",

}
HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][16909]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {16909,},
        	OffX = 30,
        	OffY = 30,
            txt = _t"获得了一个符文公式，快点击学习它吧。",

}
HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][16910]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {16910,},
        	OffX = 30,
        	OffY = 30,
            txt = _t"获得了一个符文公式，快点击学习它吧。",

}
HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][16911]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {16911,},
        	OffX = 30,
        	OffY = 30,
            txt = _t"获得了一个符文公式，快点击学习它吧。",

}


HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][16911]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {16911,},
        	OffX = 30,
        	OffY = 30,
            txt = _t"获得了一个符文公式，快点击学习它吧。",

}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][22970]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {22970,},
        	OffX = 30,
        	OffY = 30,
            txt = _t"获得了一个配方，快点击学习它吧。",

}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][22971]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {22971,},
        	OffX = 31,
        	OffY = 31,
            txt = _t"获得了一个配方，快点击学习它吧。",

}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][22972]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {22972,},
        	OffX = 32,
        	OffY = 32,
            txt = _t"获得了一个配方，快点击学习它吧。",

}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][22973]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {22973,},
        	OffX = 33,
        	OffY = 33,
            txt = _t"获得了一个配方，快点击学习它吧。",

}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][22974]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {22974,},
        	OffX = 34,
        	OffY = 34,
            txt = _t"获得了一个配方，快点击学习它吧。",

}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][22975]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {22975,},
        	OffX = 35,
        	OffY = 35,
            txt = _t"获得了一个配方，快点击学习它吧。",

}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][22976]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {22976,},
        	OffX = 36,
        	OffY = 36,
            txt = _t"获得了一个配方，快点击学习它吧。",

}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][22977]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {22977,},
        	OffX = 37,
        	OffY = 37,
            txt = _t"获得了一个配方，快点击学习它吧。",

}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][22978]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {22978,},
        	OffX = 38,
        	OffY = 38,
            txt = _t"获得了一个配方，快点击学习它吧。",

}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][22979]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {22979,},
        	OffX = 39,
        	OffY = 39,
            txt = _t"获得了一个配方，快点击学习它吧。",

}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][22981]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {22981,},
        	OffX = 40,
        	OffY = 40,
            txt = _t"获得了一个配方，快点击学习它吧。",

}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][22982]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {22982,},
        	OffX = 41,
        	OffY = 41,
            txt = _t"获得了一个配方，快点击学习它吧。",

}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][22983]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {22983,},
        	OffX = 42,
        	OffY = 42,
            txt = _t"获得了一个配方，快点击学习它吧。",

}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][22984]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {22984,},
        	OffX = 43,
        	OffY = 43,
            txt = _t"获得了一个配方，快点击学习它吧。",

}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][22985]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {22985,},
        	OffX = 44,
        	OffY = 44,
            txt = _t"获得了一个配方，快点击学习它吧。",

}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][22986]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {22986,},
        	OffX = 45,
        	OffY = 45,
            txt = _t"获得了一个配方，快点击学习它吧。",

}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][22987]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {22987,},
        	OffX = 46,
        	OffY = 46,
            txt = _t"获得了一个配方，快点击学习它吧。",

}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][27509]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {22987,},
        	OffX = 46,
        	OffY = 46,
            txt = _t"获得了一个符文公式，快点击学习它吧。",

}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][27510]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {22987,},
        	OffX = 46,
        	OffY = 46,
            txt = _t"获得了一个符文公式，快点击学习它吧。",

}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][27511]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {22987,},
        	OffX = 46,
        	OffY = 46,
            txt = _t"获得了一个符文公式，快点击学习它吧。",

}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][27512]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {22987,},
        	OffX = 46,
        	OffY = 46,
            txt = _t"获得了一个符文公式，快点击学习它吧。",

}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][27513]=
{

        	panel = "Panel_QuickBarTemp",
        	itemId = {22987,},
        	OffX = 46,
        	OffY = 46,
            txt = _t"获得了一个符文公式，快点击学习它吧。",

}



HelpData[LEVT_FIRST_SELECT_PET_MONSTER] =
{
    txt = STRING_TABLE.HELP_SELECT_PET_MONSTER,
	panel = "Panel_MainTarget",
	OffX = 250,
	OffY = 50,
	aligntype = 1,
}

HelpData[LEVT_FIRST_EQUIP_PET] =
{
    txt = STRING_TABLE.HELP_EQUIP_PET,
	panel = "Panel_Pet",
	OffX = 310,
	OffY = 190,
	aligntype = 1,
}

HelpData[LEVT_FIRST_CALL_PET] =
{
    txt = STRING_TABLE.HELP_CALL_PET,
	panel = "Panel_PetPortrait",
	OffX = 60,
	OffY = 80,
	aligntype = 1,
}

HelpData[LEVT_FIRST_PET_LVL_UP] =
{
    txt =STRING_TABLE.HELP_PET_LVL_UP ,
	panel = "Panel_PetPortrait",
	OffX = 150,
	OffY = 40,
	aligntype = 1,
}

HelpData[LEVT_FIRST_PET_DIE] =
{
    txt = STRING_TABLE.HELP_PET_DIE,
	panel = "Panel_PetPortrait",
	OffX = 110,
	OffY = 40,
	aligntype = 1,
}


HelpData[LEVT_FIRST_PET_CAN_UPGRADE] =
{
    txt = STRING_TABLE.HELP_PET_CAN_UPGRADE,
	panel = "Panel_PetPortrait",
	OffX = 180,
	OffY = 50,
	aligntype = 1,
	AcceptTaskId=4598,
}

HelpData[LEVT_FIRST_GAIN_SPEC_ITEM][103]=
{

         panel = "Panel_QuickBarTemp",
         func = "FirstGainHorse",
         OffX = 30,
         OffY = 60,
         --itemId = {103,},
         txt = _t"你获得了一匹坐骑，点击装备到时装界面中。",
}

HelpData[LEVT_LEARN_SKILL] = {}
--HelpData[LEVT_LEARN_SKILL][166]=  --战士大伤害技能
--{
--         txt = "你知道吗？连击中，逢5连击一定会暴击的哦",
--         RunTimePanel = "Panel_ComboIntro",
--         RunTimeFunc = "ShowHelp",
--
--}
--
--HelpData[LEVT_LEARN_SKILL][327]=  --圣琴大伤害技能
--{
--         txt = "你知道吗？连击中，逢5连击一定会暴击的哦",
--         RunTimePanel = "Panel_ComboIntro",
--         RunTimeFunc = "ShowHelp",
--
--}
--
--HelpData[LEVT_LEARN_SKILL][539]= --火法大伤害技能
--{
--         txt = "你知道吗？连击中，逢5连击一定会暴击的哦",
--         RunTimePanel = "Panel_ComboIntro",
--         RunTimeFunc = "ShowHelp",
--
--}
--
--HelpData[LEVT_LEARN_SKILL][818]= --剑盾大伤害技能
--{
--         txt = "你知道吗？连击中，逢5连击一定会暴击的哦",
--         RunTimePanel = "Panel_ComboIntro",
--         RunTimeFunc = "ShowHelp",
--
--}
--
--HelpData[LEVT_LEARN_SKILL][972]=  --冰法大伤害技能
--{
--         txt = "你知道吗？连击中，逢5连击一定会暴击的哦",
--         RunTimePanel = "Panel_ComboIntro",
--         RunTimeFunc = "ShowHelp",
--
--}

-----------------------------------------------------------------------------------------
-- 任务相关配置
HelpData[LEVT_TASK_FINISH] = {}
--[[
HelpData[LEVT_TASK_FINISH][3524] =
{
   txt = "小宇宙",             -- 提示名称
   panel = "Panel_QuickBar",   -- 依附界面
   item  = "Button_cosmos",    -- 依附控件
   OffX = 590,                 -- 较控件位置
   OffY = -55,                 -- 较控件位置
   format = "小宇宙",          -- 格式
   duration = 5000,            -- 提示留存时间
   aligntype = 3,              -- 布局方式
}
--]]
