--[[ @i18n help ]]
local _t = require("i18n").context("help")
-- 界面操作指导项
-- 这里的每一项都以泡泡或更复杂的形式作为操作指导
-- 每项都代表一条原子指导，从而可以被组合到任何一个操作序列或者系统中
-- 这些项只负责表达如何展示，以及提示如何结束，不关心触发他们的条件
-- 这些项不关心它的前后文
-- 请把停靠在同一界面上的指导整理在一起
-- 马远征

module("ui_dynamic_dir_item", package.seeall)

--[[
[txt]填写泡泡中的指示文字
[max_time]	选填，本条指引显示的最长时间（毫秒ms），须大于 Panel_HelpDynDirection里的PANEL_DEF_MIN_SHOW_TIME = 2000
[take_a_step_when_time_out] 选填，这一项大于0，表示到达显示时间后开始下一步指引项，不管有没有准备好
[ShowFunc] 废除，这个函数负责显示停靠界面，
			咨询负责它所停靠界面的程序员，问打开这个界面是否经过特殊方法
			将特殊方法封装后写在这里，没有就不用写这一项
[panel]给出停靠的界面名
[objs]  这些控件名可以作为线索来结束这条提示,比如点击它 泡泡依赖这些控件的显隐
[objs_pre]  这些控件名前缀可以作为线索来结束这条提示,比如点击它
[user_msg]	DYNAMIC_DIR_MSG_CLICK 一般的双击/单击（默认不写） ；DYNAMIC_DIR_MSG_ONHOVER 鼠标悬浮
[OffY]给出停靠在界面上的坐标y
[OffY]给出停靠在界面上的坐标y
[aligntype] 停靠方式, 	LEFT_TOP_CORNER 指向左上；RIGHT_TOP_CORNER指向右上；
						LEFT_BOTTOM_CORNER指向左下；RIGHT_BOTTOM_CORNER指向右下
[sound]		音频名字，在AUTO_2D_SOUND里定义和配置，然后用到这里来
]]--

-- Panel_SystemBar
_M[1] =
{
	txt = _t"圣衣可以进行星铸了，点击物品菜单",
	panel = "Panel_SystemBar",
	objs   = {"Radio_Item",},
	user_msg  =  DYNAMIC_DIR_MSG_ONHOVER,
	OffX = -36,
	OffY = 96,
	aligntype = RIGHT_TOP_CORNER,
	sound = 4, --“您的圣衣现在可以进行星铸了，请根据指引进入圣衣界面”
}

_M[2] =
{
	txt = _t"点击按钮进入圣衣界面",
	panel = "Panel_SystemBar",
	objs   = {"Button_SaintCloth",},
	OffX = -72,
	OffY = 96,
	aligntype = RIGHT_TOP_CORNER,
}

_M[3] =
{
	txt = _t"点击选择圣衣后,点该按钮进入星铸界面",
	panel = "Panel_SaintCloth",
	objs   = {"Button_syEnhance",},
	OffX = -171,
	OffY = -34,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[4] =
{
	txt = _t"点击按钮进行星铸",
	panel = "Panel_SaintClothEnhance",
	objs   = {"Button_Bless",},
	OffX = 353,
	OffY = 520,
	aligntype = LEFT_TOP_CORNER,
	sound = 6, --"星铸需要获得对应的星玉，现在点击按钮进行星铸"
}

_M[5] =
{
	txt = _t"背包中多余的装备可以通过魔盒进行分解，点击物品菜单",
	panel = "Panel_SystemBar",
	objs   = {"Radio_Item",},
	user_msg  =  DYNAMIC_DIR_MSG_ONHOVER,
	OffX = -36,
	OffY = 96,
	aligntype = RIGHT_TOP_CORNER,
	sound = 7, --"您背包中多余的装备可以通过魔盒进行分解，请根据指引进入魔盒界面"
}

_M[6] =
{
	txt = _t"点击按钮进入魔盒界面",
	panel = "Panel_SystemBar",
	objs   = {"Button_Magicbox",},
	OffX = -107,
	OffY = 96,
	aligntype = RIGHT_TOP_CORNER,
}

_M[7] =
{
	txt = _t"拖入装备后点击按钮进行分解",
	panel = "Panel_MagicBoxSplitSub",
	objs   = {"Button_split",},
	OffX = 160,
	OffY = 340,
	aligntype = LEFT_TOP_CORNER,
}

_M[8] =
{
	txt = _t"魔盒可以对灵石、手环、徽章和珠链进行升阶，点击物品菜单",
	panel = "Panel_SystemBar",
	objs   = {"Radio_Item",},
	user_msg  =  DYNAMIC_DIR_MSG_ONHOVER,
	OffX = -36,
	OffY = 96,
	aligntype = RIGHT_TOP_CORNER,
	sound = 9, --"魔盒可以对灵石、手环、徽章和珠链进行装备升阶，请根据指引进入魔盒界面"
}

_M[9] =
{
	txt = _t"点击按钮进入魔盒界面",
	panel = "Panel_SystemBar",
	objs   = {"Button_Magicbox",},
	OffX = -107,
	OffY = 96,
	aligntype = RIGHT_TOP_CORNER,
}

_M[10] =
{
	txt = _t"选择升阶标签页进入饰品升阶界面",
	panel = "Panel_MagicBox",
	objs   = {"Radio_combine",},
	ShowFunc = function()
					DlgApiEx.SendDlgCommand(UIMAN_INGAME, "Panel_Bag", "Button_magicbox")
					end,
	OffX = 130,
	OffY = 50,
	aligntype = LEFT_TOP_CORNER,

}

_M[11] =
{
	txt = _t"集齐升阶所需要的道具后，点击进行升阶",
	panel = "Panel_MagicBoxCombineSub",
	objs   = {"Button_combine",},
	OffX = 180,
	OffY = 360,
	aligntype = LEFT_TOP_CORNER,
}

_M[12] =
{
	txt = _t"可以对小宇宙进行强化了，点击人物菜单",
	panel = "Panel_SystemBar",
	objs   = {"Radio_Roleinfo",},
	user_msg  =  DYNAMIC_DIR_MSG_ONHOVER,
	OffX = -36,
	OffY = -427,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[13] =
{
	txt = _t"点击按钮进入小宇宙界面",
	panel = "Panel_SystemBar",
	objs   = {"Button_Cosmos",},
	OffX = -107,
	OffY = -427,
	aligntype = RIGHT_BOTTOM_CORNER,
	sound = 12, --"恭喜您领悟了小宇宙的基础，请根据指引进入小宇宙界面"
}

_M[14] =
{
	txt = _t"星命点已开启，需要对应星魂，点击进入占星界面",
	panel = "Panel_Cosmos",
	parent_panel = "Panel_CosmosMain",
	objs   = {"Button_astr",},
	OffX = -92,
	OffY = -84,
	aligntype = RIGHT_BOTTOM_CORNER,
	sound = 13,  --"您的星命点已经开启，需要对应星魂，请进入占星界面获得"
}

_M[15] =
{
	txt = _t"点击进行一阶占星，成功后一定几率开启二阶占星，依此类推",
	panel = "Panel_CosmosAstrology",
	parent_panel = "Panel_CosmosMain",
	objs   = {"Button_Star1",},
	OffX = 330,
	OffY = 500,
	aligntype = LEFT_TOP_CORNER,
	sound = 14, --“成功后一定几率开启更高阶的占星，运气好的话甚至可以获得极品星玉~"
}

_M[16] =
{
	txt = _t"占星出来的星魂存放在此处，星魂之间可以互相吸收来增强",
	panel = "Panel_CosmosAstrology",
	parent_panel = "Panel_CosmosMain",
	objs   = {"Image_1",},
	user_msg  =  DYNAMIC_DIR_MSG_ONHOVER,
	OffX = 199,
	OffY = 229,
	aligntype = LEFT_TOP_CORNER,
	sound = 16, --"占星得到的星魂存放在星魂库中”
}

_M[17] =
{
	txt = _t"有了星魂之后可以放到对应的星命点中，点击返回小宇宙界面",
	panel = "Panel_CosmosAstrology",
	parent_panel = "Panel_CosmosMain",
	objs   = {"Button_Return",},
	OffX = -183,
	OffY = 157,
	aligntype = RIGHT_TOP_CORNER,
	sound = 17, --“星魂之间可以通过互相吸收来进行增强，用高级的星魂将属性较低的星魂统统吸收吧"
}

_M[18] =
{
	txt = _t"不同类型的星命点只能放入对应种类的星魂，点击星命点开启星魂列表选择星魂装入",
	panel = "Panel_Cosmos",
	parent_panel = "Panel_CosmosMain",
	objs   = {"Image_Select101",},
	objs_pre   = {"Image_Select",},
	OffX = -568,
	OffY = 284,
	aligntype = RIGHT_TOP_CORNER,
	sound = 18, --"不同类型的星命点只能放入对应种类的星魂，从星魂列表中选择对应的星魂装入"
}

_M[19] =
{
	txt = _t"建议选择20级新手礼包赠送的兽骨项链进行聚能，可以滑动滚动条寻找",
	panel = "Panel_Enhance",
	objs   = {"Radio_EquipList1",},
	objs_pre   = {"Radio_EquipList",},
	OffX = 170,
	OffY = 100,
	aligntype = LEFT_TOP_CORNER,
	sound = 19, --"您现在可以对装备进行聚能了，请选择需要聚能的装备"
}

_M[20] =
{
	txt = _t"聚能需要消耗对应数量的道具，点击进行聚能，中途可以取消",
	panel = "Panel_EnhanceSecond",
	objs   = {"Button_confirm1",},
	OffX = 165,
	OffY = 260,
	aligntype = LEFT_TOP_CORNER,
	sound = 20, --"聚能需要消耗对应数量的道具，点击进行聚能，中途可以取消"
}

_M[21] =
{
	txt = _t"此处显示本次聚能的结果，聚能满级后可以重新聚能各个槽位",
	panel = "Panel_Enhance",
	--objs   = {"Image_Stone1","Image_Progress1","Image_Enhance1",},
	--objs_pre   = {"Image_Stone","Image_Progress","Image_Enhance",},
	max_time   = 10000,
	OffX = 270,
	OffY = 223,
	aligntype = LEFT_TOP_CORNER,
	sound = 21, --"本次聚能的结果显示在此处”
}

_M[22] =
{
	txt = _t"点击选择需要星铸的圣衣",
	ShowFunc = function() GameUI:OnJumpInterfaceByLogicKeyDown(LKEY_UI_SHOWDLG_SAINTCLOTH) end,
	panel = "Panel_SaintClothSub",
	objs   = {"Radio_sy1","Image_sy1","Radio_Equip1"},
	objs_pre   = {"Radio_sy","Image_sy","Radio_Equip"},
	OffX = 147,
	OffY = 180,
	aligntype = LEFT_TOP_CORNER,
	sound = 5, --"选择对应的圣衣后进入星铸界面"
}

_M[23] =
{
	txt = _t"将可分解的装备拖入此处",
	ShowFunc = function()
					DlgApiEx.SendDlgCommand(UIMAN_INGAME, "Panel_Bag", "Button_magicbox")
					end,
	panel = "Panel_MagicBoxSplitSub",
	objs   = {"Image_Item",},
	OffX = -138,
	OffY = 215,
	aligntype = RIGHT_TOP_CORNER,
	sound = 8, --"将发光的装备拖入拆分栏后点击按钮进行分解"
}

_M[24] =
{
	txt = _t"将需要升阶的装备拖入此处，需要对应的升阶道具",
	panel = "Panel_MagicBoxCombineSub",
	objs   = {"Image_split_raw_equip",},
	OffX = -152,
	OffY = 170,
	aligntype = RIGHT_TOP_CORNER,
	sound = 10, --"放入需要升阶的装备，集齐对应的升阶道具后，点击进行升阶”
}

_M[25] =
{
	txt = _t"获得了双倍经验时间，此按钮可以打开/关闭双倍经验界面",
	panel = "Panel_Radar",
	objs   = {"Button_DoubleExp",},
	OffX = -212,
	OffY = -37,
	aligntype = RIGHT_BOTTOM_CORNER,
	sound = 23, --"点击此处开启双倍，杀死怪物获得的经验将翻倍"
}

_M[26] =
{
	txt = _t"此按钮可以开启/关闭双倍经验",
	panel = "Panel_DoubleExp",
	objs   = {"Check_begin",},
	OffX = 205,
	OffY = 50,
	aligntype = LEFT_TOP_CORNER,
}

_M[27] =
{
	txt = _t"点击复活按钮在复活点复活",
	panel = "Panel_Revive",
	objs   = {"Btn_Decide",},
	OffX = 129,
	OffY = 142,
	aligntype = LEFT_TOP_CORNER,
	sound = 33, --"很不幸您被敌人击倒了，点击复活重新投入战斗吧！"
}

_M[28] =
{
	txt = _t"想要继续升级的话需要手动进行提升，每当能进行手动升级时，该按钮会闪动",
	panel = "Panel_SystemBar",
	objs   = {"Radio_Roleinfo",},
	OffX = -36,
	OffY = -427,
	aligntype = RIGHT_BOTTOM_CORNER,
	sound = 46, --“从11级开始，每次升级需要打开人物属性界面点击手动升级”
}

_M[29] =
{
	txt = _t"点击按钮进入人物属性界面",
	panel = "Panel_SystemBar",
	objs   = {"Button_Char",},
	OffX = -77,
	OffY = -427,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[30] =
{
	txt = _t"点击按钮手动升级",
	panel = "Panel_RoleInfoAttribute",
	objs   = {"Button_levelUp",},
	--max_time   = 10000,
	OffX = -227,
	OffY = 30,
	aligntype = RIGHT_TOP_CORNER,
}

_M[31] =
{
	txt = _t"恭喜您穿上了第一套圣衣，进入圣衣界面查看",
	panel = "Panel_SystemBar",
	objs   = {"Radio_Item",},
	user_msg  =  DYNAMIC_DIR_MSG_ONHOVER,
	OffX = -36,
	OffY = 96,
	aligntype = RIGHT_TOP_CORNER,
	sound = 3, --“恭喜您获得了第一件圣衣，点开圣衣界面查看新圣衣所带来的强大属性吧~”
}

_M[32] =
{
	txt = _t"点击按钮进入圣衣界面",
	panel = "Panel_SystemBar",
	objs   = {"Button_SaintCloth",},
	OffX = -72,
	OffY = 96,
	aligntype = RIGHT_TOP_CORNER,
}

_M[33] =
{
	txt = _t"您所有获得的圣衣显示在此处，将鼠标悬浮到圣衣查看强大属性吧~",
	panel = "Panel_SaintCloth",
	max_time   = 10000,
	take_a_step_when_time_out  = 1,
	OffX = 0,
	OffY = 300,
	aligntype = 0,
}

_M[34] =
{
	txt = _t"点击按钮装备或卸下圣衣",
	panel = "Panel_SaintCloth",
	objs   = {"Button_remove",},
	OffX = -90,
	OffY = -34,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[35] =
{
	txt = _t"选择一系生产技能",
	panel = "Panel_ProduceLearn",
	objs   = {"Radio_1",},
	objs_pre   = {"Radio_",},
	OffX = 326,
	OffY = -525,
	aligntype = LEFT_BOTTOM_CORNER,
	sound = 47, --“选择一项生产技能并点击学习按钮，每类技能都能给您的战斗带来一定的帮助！”
}

_M[36] =
{
	txt = _t"点击按钮进行学习",
	panel = "Panel_ProduceLearn",
	objs   = {"Button_Confirm",},
	OffX = 294,
	OffY = 589,
	aligntype = LEFT_TOP_CORNER,
}

_M[37] =
{
	txt = _t"您现在已经可以使用连招编辑器了，系统已将默认连招替换到了该位置",
	panel = "Panel_QuickBar",
	max_time   = 10000,
	take_a_step_when_time_out  = 1,
	OffX = -528,
	OffY = -44,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[38] =
{
	txt = _t"打开界面查看连招编辑器",
	panel = "Panel_SystemBar",
	objs   = {"Radio_Skills",},
	user_msg  =  DYNAMIC_DIR_MSG_ONHOVER,
	OffX = -36,
	OffY = 142,
	aligntype = RIGHT_TOP_CORNER,
	--sound = 48, --“连招编辑器可以大大简化您的战斗，请将编辑器的默认输出连招拖动到快捷技能栏上”
}

_M[39] =
{
	txt = _t"点击按钮进入连招编辑器界面",
	panel = "Panel_SystemBar",
	objs   = {"Button_Sequence",},
	OffX = -105,
	OffY = 142,
	aligntype = RIGHT_TOP_CORNER,
}

_M[40] =
{
	txt = _t"选择系统默认配置好的连招配置",
	panel = "Panel_SequenceEditor",
	max_time   = 10000,
	OffX = -550,
	OffY = 92,
	aligntype = RIGHT_TOP_CORNER,
}

_M[42] =
{
	txt = _t"点击对应的装备放入镶嵌槽中",
	panel = "Panel_EquipProcess",
	max_time   = 5000,
	take_a_step_when_time_out  = 1,
	OffX = -213,
	OffY = -123,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[41] =
{
	txt = _t"从背包中拖入需要嵌入的符文,会给玩家自动筛选出该符文适合的装备",
	panel = "Panel_EquipProcess",
	max_time   = 10000,
	take_a_step_when_time_out  = 1,
	OffX = 265,
	OffY = 230,
	aligntype = LEFT_TOP_CORNER,
	sound = 50, --“在装备上镶嵌符纹可以进一步的提升自身的属性哦~但请留意大部分符文都是有时间限制的”
}

_M[43] =
{
	txt = _t"点击按钮进行镶嵌",
	panel = "Panel_EquipProcess",
	objs   = {"Button_Confirm",},
	OffX = 218,
	OffY = 449,
	aligntype = LEFT_TOP_CORNER,
}

_M[44] =
{
	txt = _t"请点击地面上闪光的物体进行采集操作",
	max_time   = 10000,
	OffX = 100,
	OffY = 0,
	aligntype = 0,
	sound = 60, --“请点击地面上闪光的物体进行采集操作”
}

_M[45] =
{
	txt = _t"点击查看十二宫火种阶段指引",
	panel = "Panel_Radar",
	objs   = {"Button_GuideStage",},
	OffX = -215,
	OffY = -64,
	aligntype = RIGHT_BOTTOM_CORNER,
	sound = 53, --“通过十二宫火种，您可以不断达成阶段目标来获得大量的奖励哦~”

}

_M[46] =
{
	txt = _t"达成阶段目标后可获得丰厚奖励",
	panel = "Panel_GuideStage",
	max_time   = 10000,
	OffX = 282,
	OffY = -381,
	aligntype = LEFT_BOTTOM_CORNER,
}

_M[47] =
{
	txt = _t"可以使用生产技能了，点击进入生产界面查看",
	panel = "Panel_SystemBar",
	objs   = {"Radio_Skills",},
	user_msg  =  DYNAMIC_DIR_MSG_ONHOVER,
	OffX = -36,
	OffY = 142,
	aligntype = RIGHT_TOP_CORNER,
}

_M[48] =
{
	txt = _t"点击按钮进入生产界面",
	panel = "Panel_SystemBar",
	objs   = {"Button_Produce",},
	OffX = -147,
	OffY = 142,
	aligntype = RIGHT_TOP_CORNER,
}

_M[49] =
{
	txt = _t"选择想要生产的道具，注意需要集齐对应的原材料才能够生产",
	panel = "Panel_Produce",
	objs_pre   = {"Edit_ProBG1",},
	--max_time   = 10000,
	take_a_step_when_time_out  = 1,
	OffX = 450,
	OffY = 239,
	aligntype = LEFT_TOP_CORNER,
}

_M[50] =
{
	txt = _t"当材料收集齐时，点击按钮进行制造",
	panel = "Panel_Produce",
	objs   = {"Button_Produce",},
	--max_time   = 10000,
	take_a_step_when_time_out  = 1,
	OffX = 394,
	OffY = 518,
	aligntype = LEFT_TOP_CORNER,
}

_M[51] =
{
	txt = _t"组队后有一定比率的buff加成，悬浮查看",
	panel = "Panel_BuffDebuff",
	max_time   = 10000,
	take_a_step_when_time_out  = 1,
	OffX = -30,
	OffY = 40,
	aligntype = RIGHT_TOP_CORNER,
	sound = 55, --“与其他玩家组队后将给予所有队伍成员一定的属性增益，请悬浮查看具体的属性提升”
}

_M[52] =
{
	txt = _t"使用星象守护可以提高队伍的整体战斗效率",
	panel = "Panel_StarGuard",
	max_time   = 10000,
	take_a_step_when_time_out  = 1,
	OffX = -40,
	OffY = 40,
	aligntype = RIGHT_TOP_CORNER,
	sound = 43, --“点击此处可召唤出您星座对应的星象守护，每个角色同时只能享受到一种星象守护的效果”
}

_M[53] =
{
	txt = _t"当您暂离电脑时，使用沐浴荣光可以获得可观的储存经验哦",
	panel = "Panel_MessageQuit",
	objs   = {"Button_Pray",},
	OffX = 192,
	OffY = 259,
	aligntype = LEFT_TOP_CORNER,
	sound = 44, --“当您不在屏幕前的时候，可以使用沐浴荣光来获取可观的储存经验”
}

_M[54] =
{
	txt = _t"点击后进行抽奖，不满意的话可以重新抽取，每天有次数限制",
	panel = "Panel_Raffle",
	--objs   = {"Button_Restart",},
	max_time   = 10000,
	OffX = 305,
	OffY = 453,
	aligntype = LEFT_TOP_CORNER,
	sound = 57, --“如果对抽奖结果不满意，可以重新进行抽取，每天有次数限制哦~”
}

_M[55] =
{
	txt = _t"您可以通过战力体检系统来查看如何提升战斗力",
	panel = "Panel_Radar",
	objs   = {"Button_exam",},
	--max_time   = 10000,
	OffX = -212,
	OffY = -90,
	aligntype = RIGHT_BOTTOM_CORNER,
	--sound = 54, --“注意！您的战斗力低于应有的水平，请打开战力体检见面查看相关信息”
}

_M[56] =
{
	txt = _t"您现在可以参加英雄竞技场了，请打开界面查看相关信息",
	panel = "Panel_Radar",
	objs   = {"Button_Leisure",},
	OffX = -212,
	OffY = -116,
	aligntype = RIGHT_BOTTOM_CORNER,
	sound = 36, --“您现在可以去参加英雄竞技场了，丰厚的奖励等着您哦”
}

_M[57] =
{
	txt = _t"此类副本中的怪物强度依队伍平均等级调整！而个人等级决定怪物掉落和击杀经验！",
	max_time   = 30000,
	--take_a_step_when_time_out  = 1,
	OffX = 100,
	OffY = 0,
	aligntype = 0,
	--sound = 41, --“该类副本会根据队伍平均等级自动调整难度哦~”
}

_M[58] =
{
	txt = _t"恭喜您获得了第一个称号，请点击进入称号界面查看详细",
	panel = "Panel_GuideNew",
	max_time   = 5000,
	OffX = 326,
	OffY = 50,
	aligntype = LEFT_TOP_CORNER,
	sound = 37,  --“恭喜您获得了第一个称号，请进入界面查看相关称号带来的属性加成”
}

_M[59] =
{
	txt = _t"恭喜您获得了第一个图鉴，请点击进入图鉴界面查看详细",
	panel = "Panel_GuideNew",
	max_time   = 5000,
	OffX = 326,
	OffY = 50,
	aligntype = LEFT_TOP_CORNER,
	sound = 39, --“恭喜您获得了第一个图鉴，请进入界面查看相关信息”
}

_M[60] =
{
	txt = _t"恭喜您获得了第一个成就，请点击进入成就界面查看详细",
	panel = "Panel_GuideNew",
	max_time   = 5000,
	OffX = 326,
	OffY = 50,
	aligntype = LEFT_TOP_CORNER,
	sound = 38, --“恭喜您获得了第一个成就，请进入界面查看相关信息”
}

_M[61] =
{
	txt = _t"注意点击按钮转换仙女领域，切换到副本治疗模式，领域变换时会自动切换技能快捷栏！",
	panel = "Panel_SkillsEnergy",
	max_time   = 10000,
	OffX = 88,
	OffY = -40,
	aligntype = LEFT_BOTTOM_CORNER,
	sound = 35, --“仙女座需要在战斗前切换到对应的治疗、输出领域，请注意哦~”
}

_M[62] =
{
	txt = _t"通过NPC列表可以快速寻找到你想要找到的NPC",
	panel = "Panel_WorldMapNpcList",
	parent_panel = "Panel_WorldMap",
	max_time   = 10000,
	take_a_step_when_time_out  = 1,
	OffX = -200,
	OffY = 200,
	aligntype = RIGHT_TOP_CORNER,
	sound = 58, --“善用NPC列表可以快速寻找散落于城镇各处的功能NPC”
}

_M[63] =
{
	txt = _t"点击此处可展开第3层快捷技能栏",
	panel = "Panel_QuickBar",
	max_time   = 10000,
	OffX = 40,
	OffY = -36,
	aligntype = LEFT_BOTTOM_CORNER,
}

_M[64] =
{
	txt = _t"进入GT语音与其他玩家交流可以增进队伍的合作效率",
	panel = "Panel_MainTeammatePortrait",
	max_time   = 10000,
	OffX = 16,
	OffY = -238,
	aligntype = LEFT_BOTTOM_CORNER,
	sound = 56, --“当队伍与强敌战斗的时候，开启语音GT将大大增加队伍的配合效率哦~”
}

_M[65] =
{
	txt = _t"系统为您筛选了附近同时在进行游戏的玩家，点击加为好友",
	panel = "Panel_Push",
	--max_time   = 10000,
	--take_a_step_when_time_out  = 1,
	objs   = {"Button_Add1",},
	OffX = 170,
	OffY = 138,
	aligntype = LEFT_TOP_CORNER,
}

_M[66] =
{
	txt = _t"恭喜您成功与一名玩家成为好友，请进入好友列表查看",
	panel = "Panel_SystemBar",
	objs   = {"Radio_Society",},
	OffX = -36,
	OffY = -243,
	aligntype = RIGHT_BOTTOM_CORNER,
	sound = 59, --“恭喜您成功与一名玩家成为好友，请进入好友列表查看”
}

_M[67] =
{
	txt = _t"点击进入好友列表",
	panel = "Panel_SystemBar",
	objs   = {"Button_Friend",},
	OffX = -66,
	OffY = -243,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[68] =
{
	txt = _t"右键选择角色并点击挑战",
	panel = "Panel_LeisureTop",
	max_time   = 10000,
	OffX = 135,
	OffY = 300,
	aligntype = LEFT_TOP_CORNER,
}

_M[69] =
{
	txt = _t"按住W、A、S、D进行移动，按住右键拖动鼠标来移动视角，指引可点击ESC关闭",
	max_time   = 10000,
	OffX = 100,
	OffY = 0,
	aligntype = 0,
	--sound = 24, --“欢迎来到圣斗士的世界~请按住键盘上W、A、S、D进行移动~”
}

_M[70] =
{
	txt = _t"点击链接与黄金幻像对话，进入副本",
	panel = "Panel_QuestTrace",
	objs_pre   = {"Text_Name",},
	OffX = -245,
	OffY = 66,
	aligntype = RIGHT_TOP_CORNER,
	--sound = 25, --"请点击任务追踪栏上的NPC链接，将可以自动到达NPC身边"
}

_M[71] =
{
	txt = _t"请按住右键拖动鼠标来移动视角",
	max_time   = 10000,
	OffX = 100,
	OffY = 0,
	aligntype = 0,
	sound = 26, --"按住鼠标右键来移动视角吧～"
}

_M[72] =
{
	txt = _t"双击并按住W键，开启加速跑！（寻径过程中按住shift可以自动加速跑哦~）",
	max_time   = 10000,
	OffX = 100,
	OffY = 0,
	aligntype = 0,
	sound = 27, --“双击W键并按住可以开启加速跑”
}

_M[73] =
{
	txt = _t"快速奔跑会消耗能量槽，请节约使用",
	panel = "Panel_Portrait",
	max_time   = 10000,
	OffX = 200,
	OffY = 80,
	aligntype = 0,
	aligntype = LEFT_TOP_CORNER,
}

_M[74] =
{
	txt = _t"右键点击训练石块并使用技能进行攻击",
	panel = "Panel_QuickBar",
	max_time   = 10000,
	OffX = -515,
	OffY = -38,
	aligntype = RIGHT_BOTTOM_CORNER,
	sound = 29, --"右键点击目标进行攻击"
}

_M[75] =
{
	txt = _t"您获得了加速状态,可以快速到达目的地",
	max_time   = 10000,
	OffX = 100,
	OffY = 0,
	aligntype = 0,
	sound = 28, --“您获得了加速状态，可以快速的达到目的地”
}

_M[76] =
{
	txt = _t"您学会了新的斗魂，点击按钮进入斗魂界面查看",
	panel = "Panel_SaintClothEnhance",
	objs   = {"Button_Soul",},
	OffX = 296,
	OffY = 388,
	aligntype = LEFT_TOP_CORNER,
}

_M[77] =
{
	txt = _t"请点击新学会的斗魂装备或者替换已装的斗魂",
	panel = "Panel_RoleInfoGift",
	max_time   = 10000,
	OffX = 73,
	OffY = 129,
	aligntype = LEFT_TOP_CORNER,
}

_M[78] =
{
	txt = _t"测试技能",
	--panel = "Panel_RoleInfoGift",
	--objs   = {"Radio_Gift1_1",},
	OffX = 0,
	OffY = 0,
	aligntype = 0,
}

_M[79] =
{
	txt = _t"出副本后，注意及时转换仙女领域到输出模式，注意领域变换时会自动切换技能快捷栏！",
	panel = "Panel_SkillsEnergy",
	max_time   = 10000,
	OffX = 88,
	OffY = -40,
	aligntype = LEFT_BOTTOM_CORNER,
	sound = 35, --“仙女座需要在战斗前切换到对应的治疗、输出领域，请注意哦~”
}

_M[80] =
{
	txt = _t"您现在可以进行贵鬼答题了，请打开界面查看相关信息",
	panel = "Panel_Radar",
	--objs   = {"Button_Question",},
	max_time   = 10000,
	OffX = -212,
	OffY = -142,
	aligntype = RIGHT_BOTTOM_CORNER,
	--sound = 36, --“您现在可以去参加英雄竞技场了，丰厚的奖励等着您哦”
}

_M[81] =
{
	txt = _t"天马星座的斗志槽会增加部分技能释放时的威力，每达成5连击积蓄1点，释放消耗所有的斗志",
	panel = "Panel_SkillsBean",
	max_time   = 10000,
	OffX = 50,
	OffY = -25,
	aligntype = LEFT_BOTTOM_CORNER,
}

_M[82] =
{
	txt = _t"白鸟星座的冻气槽会增加部分技能的威力，释放相关技能时消耗，每秒自动积蓄10点",
	panel = "Panel_SkillsIce",
	max_time   = 10000,
	OffX = 50,
	OffY = -25,
	aligntype = LEFT_BOTTOM_CORNER,
}

_M[83] =
{
	txt = _t"凤凰星座的焰力槽显示的是目标敌人当前受到烈焰焚烧的层数及剩余时间",
	panel = "Panel_SkillsFire",
	max_time   = 10000,
	OffX = 50,
	OffY = -25,
	aligntype = LEFT_BOTTOM_CORNER,
}

_M[84] =
{
	txt = _t"请打开星券商城界面查看丰富商品吧",
	panel = "Panel_SystemBar",
	objs   = {"Radio_Star",},
	OffX = -36,
	OffY = -151,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[85] =
{
	txt = _t"点击按钮进入商城界面",
	panel = "Panel_SystemBar",
	objs   = {"Button_Gshop",},
	OffX = -77,
	OffY = -151,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[86] =
{
	txt = _t"选择回复道具中大药分类",
	panel = "Panel_Gshop",
	objs   = {"Check_Menu2_#11",},
	OffX = 140,
	OffY = 378,
	aligntype = LEFT_TOP_CORNER,
}

_M[87] =
{
	txt = _t"请点击新学会的斗魂装备或者替换已装的斗魂",
	panel = "Panel_RoleInfoGift",
	max_time   = 10000,
	OffX = 73,
	OffY = 209,
	aligntype = LEFT_TOP_CORNER,
}

_M[88] =
{
	txt = _t"请点击新学会的斗魂装备或者替换已装的斗魂",
	panel = "Panel_RoleInfoGift",
	max_time   = 10000,
	OffX = 73,
	OffY = 289,
	aligntype = LEFT_TOP_CORNER,
}

_M[89] =
{
	txt = _t"请点击新学会的斗魂装备或者替换已装的斗魂",
	panel = "Panel_RoleInfoGift",
	max_time   = 10000,
	OffX = 73,
	OffY = 369,
	aligntype = LEFT_TOP_CORNER,
}

_M[90] =
{
	txt = _t"请点击新学会的斗魂装备或者替换已装的斗魂",
	panel = "Panel_RoleInfoGift",
	max_time   = 10000,
	OffX = 73,
	OffY = 449,
	aligntype = LEFT_TOP_CORNER,
}

_M[91] =
{
	txt = _t"仙女星座的神威增加“裂空风暴角锁”的威力，使用部分技能会积蓄，脱战或释放技能时都会减少",
	panel = "Panel_SkillsEnergy",
	max_time   = 10000,
	OffX = 50,
	OffY = -20,
	aligntype = LEFT_BOTTOM_CORNER,
}

_M[92] =
{
	txt = _t"现在可以在仙女星座的两个领域之间自由切换来转换输出或治疗模式，请记得在战斗之前及时切换",
	panel = "Panel_SkillsEnergy",
	max_time   = 10000,
	OffX = 88,
	OffY = -40,
	aligntype = LEFT_BOTTOM_CORNER,
}

_M[93] =
{
	txt = _t"点击购买一个轻量回复药剂",
	panel = "Panel_Gshop",
	objs   = {"Button_ItemBuy3",},
	OffX = -80,
	OffY = 192,
	aligntype = RIGHT_TOP_CORNER,
}

_M[94] =
{
	txt = _t"您的背包已经满了，获得的物品将放入临时背包中，请尽快清理背包",
	panel = "Panel_SystemBar",
	objs   = {"Radio_Item",},
	OffX = -32,
	OffY = 96,
	aligntype = RIGHT_TOP_CORNER,
}

_M[95] =
{
	txt = _t"您可以通过查看战力体检界面来查询如何提升战斗力，让您在今后的战斗中更给力哦",
	panel = "Panel_Radar",
	objs   = {"Button_exam",},
	--max_time   = 10000,
	OffX = -212,
	OffY = -90,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[96] =
{
	txt = _t"您可以在系统设置中切换游戏的3d风格和漫画风格",
	panel = "Panel_SystemBar",
	objs   = {"Radio_System",},
	OffX = -32,
	OffY = -59,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[97] =
{
	txt = _t"点击进入系统设置界面",
	panel = "Panel_Esc",
	objs   = {"Button_Setting",},
	OffX = -694,
	OffY = 388,
	aligntype = RIGHT_TOP_CORNER,
}

_M[98] =
{
	txt = _t"勾选此处可开启和关闭漫画风格",
	panel = "Panel_SetSystem",
	parent_panel = "Panel_Settings",
	objs   = {"Check_Edge",},
	OffX = 212,
	OffY = 234,
	aligntype = LEFT_TOP_CORNER,
}

_M[99] =
{
	txt = _t"请先解锁技能栏再拖动图标",
	panel = "Panel_QuickBar",
	max_time   = 10000,
	OffX = 40,
	OffY = -21,
	aligntype = LEFT_BOTTOM_CORNER,
}

_M[100] =
{
	txt = _t"请点击进入日程表寻找相关的活动",
	panel = "Panel_Radar",
	objs   = {"Button_Daily",},
	OffX = -184,
	OffY = -39,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[101] =
{
	txt = _t"您可以称号界面中装备或替换称号",
	panel = "Panel_SystemBar",
	objs   = {"Radio_Collect",},
	OffX = -32,
	OffY = -197,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[102] =
{
	txt = _t"点击使用技能",
	panel = "Panel_QuickBarShape",
	max_time   = 10000,
	OffX = -292,
	OffY = -42,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[103] =
{
	txt = _t"点击使用技能",
	panel = "Panel_QuickBarShape",
	max_time   = 10000,
	OffX = -250,
	OffY = -42,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[104] =
{
	txt = _t"点击超链接可开始指引操作步骤",
	panel = "Panel_GuideStage",
	max_time   = 10000,
	OffX = -493,
	OffY = -456,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[105] =
{
	txt = _t"点击链接与雅典娜对话",
	panel = "Panel_QuestTrace",
	objs_pre   = {"Text_Name",},
	OffX = -245,
	OffY = 66,
	aligntype = RIGHT_TOP_CORNER,
	--sound = 25, --"请点击任务追踪栏上的NPC链接，将可以自动到达NPC身边"
}

_M[106] =
{
	txt = _t"点击链接自动寻径到任务完成地点",
	panel = "Panel_QuestTrace",
	objs_pre   = {"Text_Name",},
	OffX = -245,
	OffY = 66,
	aligntype = RIGHT_TOP_CORNER,
	--sound = 25, --"请点击任务追踪栏上的NPC链接，将可以自动到达NPC身边"
}

_M[107] =
{
	txt = _t"点击链接追上黄金幻像",
	panel = "Panel_QuestTrace",
	objs_pre   = {"Text_Name",},
	OffX = -245,
	OffY = 66,
	aligntype = RIGHT_TOP_CORNER,
	--sound = 25, --"请点击任务追踪栏上的NPC链接，将可以自动到达NPC身边"
}

_M[108] =
{
	txt = _t"点击此处使用技能“天马流星拳”",
	panel = "Panel_QuickBarShape",
	max_time   = 10000,
	OffX = -292,
	OffY = -42,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[109] =
{
	txt = _t"点击此处使用技能“钻石星辰拳”",
	panel = "Panel_QuickBarShape",
	max_time   = 10000,
	OffX = -292,
	OffY = -42,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[110] =
{
	txt = _t"点击此处使用技能“庐山升龙霸”",
	panel = "Panel_QuickBarShape",
	max_time   = 10000,
	OffX = -292,
	OffY = -42,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[111] =
{
	txt = _t"点击此处使用技能“星云风暴”",
	panel = "Panel_QuickBarShape",
	max_time   = 10000,
	OffX = -292,
	OffY = -42,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[112] =
{
	txt = _t"点击此处使用技能“凤翼天翔”",
	panel = "Panel_QuickBarShape",
	max_time   = 10000,
	OffX = -292,
	OffY = -42,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[113] =
{
	txt = _t"点击此处使用技能“弦乐之花”",
	panel = "Panel_QuickBarShape",
	max_time   = 10000,
	OffX = -250,
	OffY = -42,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[114] =
{
	txt = _t"点击按钮立即进行传送”",
	panel = "Panel_Route",
	objs   = {"Button_ImmediatelyTeleport",},
	OffX = -284,
	OffY = -30,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[115] =
{
	txt = _t"现在可以进行观星操作了，点击这里打开",
	panel = "Panel_SystemBar",
	objs   = {"Radio_Roleinfo",},
	user_msg  =  DYNAMIC_DIR_MSG_ONHOVER,
	OffX = -36,
	OffY = 30,
	aligntype = RIGHT_TOP_CORNER,
	sound = 7, --"观星主界面指引"
}

_M[116] =
{
	txt = _t"点击按钮进入观星界面",
	panel = "Panel_SystemBar",
	objs   = {"Button_StarSky",},
	user_msg  =  DYNAMIC_DIR_MSG_ONHOVER,
	OffX = -170,
	OffY = 30,
	aligntype = RIGHT_TOP_CORNER,
}

_M[117] =
{
	txt = _t"请逐个点击界面中的星球",
	panel = "Panel_SubExplore1",
	objs   = {"Image_Area1",},
	user_msg  =  DYNAMIC_DIR_MSG_CLICK,
	OffX = 150,
	OffY = -350,
	aligntype = LEFT_BOTTOM_CORNER,
}

_M[118] =
{
	txt = _t"下面请点击第二个星球",
	panel = "Panel_SubExplore1",
	objs   = {"Image_Area2",},
	user_msg  =  DYNAMIC_DIR_MSG_CLICK,
	OffX = 80,
	OffY = -250,
	aligntype = LEFT_BOTTOM_CORNER,
}

_M[119] =
{
	txt = _t"依次根据提示点击，就能不断获得微粒",
	panel = "Panel_SubExplore1",
	objs   = {"Image_Area3",},
	user_msg  =  DYNAMIC_DIR_MSG_CLICK,
	OffX = 100,
	OffY = -120,
	aligntype = LEFT_BOTTOM_CORNER,
}

_M[120] =
{
	txt = _t"请点击这个星球",
	panel = "Panel_SubExplore1",
	objs   = {"Image_Area4",},
	user_msg  =  DYNAMIC_DIR_MSG_CLICK,
	OffX = 230,
	OffY = -200,
	aligntype = LEFT_BOTTOM_CORNER,
}

_M[121] =
{
	txt = _t"请点击这个星球",
	panel = "Panel_SubExplore1",
	objs   = {"Image_Area5",},
	user_msg  =  DYNAMIC_DIR_MSG_CLICK,
	OffX = 350,
	OffY = -100,
	aligntype = LEFT_BOTTOM_CORNER,
}

_M[122] =
{
	txt = _t"获得微粒后可以使用这些微粒进行星座连接",
	panel = "Panel_Explore",
	objs   = {"Button_StarLine",},
	user_msg  =  DYNAMIC_DIR_MSG_CLICK,
	OffX = -50,
	OffY = 460,
	aligntype = RIGHT_TOP_CORNER,
}

_M[123] =
{
	txt = _t"请点击界面中的星点\r星座连接完成后，即可获得相应属性哦",
	panel = "Panel_SubExplore2",
	objs_pre = {"Image_Star",},
	user_msg  =  DYNAMIC_DIR_MSG_CLICK,
	OffX = -450,
	OffY = -110,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[124] =
{
	txt = _t"您获得了第一个星之祭礼\r请点击星之祭礼按钮进行操作",
	panel = "Panel_Explore",
	objs   = {"Button_ExploreBorn",},
	user_msg  =  DYNAMIC_DIR_MSG_CLICK,
	OffX = -170,
	OffY = -20,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[125] =
{
	txt = _t"请选中要进行的星之祭礼(金苹果)界面右侧会显示该祭礼的相关信息",
	panel = "Panel_ExploreBorn",
	objs   = {"Radio_1",},
	user_msg  =  DYNAMIC_DIR_MSG_ONHOVER,
	OffX = 90,
	OffY = -200,
	aligntype = LEFT_BOTTOM_CORNER,
}

_M[126] =
{
	txt = _t"点击祭礼即可，明天就可以获得物品了哦",
	panel = "Panel_ExploreBorn",
	objs_pre = {"Button_Born",},
	user_msg  =  DYNAMIC_DIR_MSG_CLICK,
	OffX = -160,
	OffY = 215,
	aligntype = RIGHT_TOP_CORNER,
}

_M[127] =
{
	txt = _t"现在可以进行神器操作了，点击这里打开",
	panel = "Panel_SystemBar",
	objs   = {"Radio_Roleinfo",},
	user_msg  =  DYNAMIC_DIR_MSG_ONHOVER,
	OffX = -36,
	OffY = 30,
	aligntype = RIGHT_TOP_CORNER,
	sound = 7, --"观星主界面指引"
}

_M[128] =
{
	txt = _t"点击按钮进入神器界面",
	panel = "Panel_SystemBar",
	objs   = {"Button_Artifact",},
	user_msg  =  DYNAMIC_DIR_MSG_CLICK,
	OffX = -210,
	OffY = 30,
	aligntype = RIGHT_TOP_CORNER,
}

_M[129] =
{
	txt = _t"请将背包中的神器【天琴座：奥路菲竖琴】放到已拥有神器栏位中\r在背包中右键使用即可",
	panel = "Panel_ArtifactSub1",
	objs_pre = {"Image_IconHave",},
	OffX = 30,
	OffY = -200,
	aligntype = LEFT_BOTTOM_CORNER,
}

_M[130] =
{
	txt = _t"现在将下面已拥有的神器【天琴座：奥路菲竖琴】拖入激活神器栏位中",
	panel = "Panel_ArtifactSub1",
	objs_pre = {"Image_IconActive",},
	OffX = 30,
	OffY = -420,
	aligntype = LEFT_BOTTOM_CORNER,
}

_M[131] =
{
	txt = _t"请使用背包中的【灵力之源】增加你的灵气值",
	panel = "Panel_ArtifactSub1",
	objs = {"Edit_bgAura",},
	OffX = 140,
	OffY = -15,
	aligntype = LEFT_BOTTOM_CORNER,
}

_M[132] =
{
	txt = _t"点击灌注按钮，将灵气灌注到选中的神器中去",
	panel = "Panel_ArtifactSub1",
	objs = {"Button_UpdateRealm",},
	user_msg  =  DYNAMIC_DIR_MSG_CLICK,
	OffX = -60,
	OffY = -15,
	aligntype = RIGHT_BOTTOM_CORNER,
}

_M[133] =
{
	txt = _t"现在小宇宙可以升级了，点击这里打开",
	panel = "Panel_SystemBar",
	objs   = {"Radio_Roleinfo",},
	user_msg  =  DYNAMIC_DIR_MSG_ONHOVER,
	OffX = -36,
	OffY = 30,
	aligntype = RIGHT_TOP_CORNER,
	sound = 7, --"观星主界面指引"
}

_M[134] =
{
	txt = _t"点击按钮进入小宇宙界面",
	panel = "Panel_SystemBar",
	objs   = {"Button_Cosmos",},
	user_msg  =  DYNAMIC_DIR_MSG_CLICK,
	OffX = -50,
	OffY = 30,
	aligntype = RIGHT_TOP_CORNER,
}

_M[135] =
{
	txt = _t"点击小宇宙等级按钮，进行小宇宙升级",
	panel = "Panel_Cosmos",
	objs = {"Button_Cosmo",},
	user_msg  =  DYNAMIC_DIR_MSG_CLICK,
	OffX = -120,
	OffY = -520,
	aligntype = RIGHT_BOTTOM_CORNER,
}


--灵魂铠甲
_M[136] =
{
	txt = _t"现在可以进行灵魂铠甲的操作了，点击这里打开",
	panel = "Panel_SystemBar",
	objs   = {"Radio_Roleinfo",},
	user_msg  =  DYNAMIC_DIR_MSG_ONHOVER,
	OffX = -36,
	OffY = 30,
	aligntype = RIGHT_TOP_CORNER,
	sound = 7, --"观星主界面指引"
}

_M[137] =
{
	txt = _t"点击按钮进入灵魂铠甲界面",
	panel = "Panel_SystemBar",
	objs   = {"Button_SoulArmor",},
	user_msg  =  DYNAMIC_DIR_MSG_CLICK,
	OffX = -290,
	OffY = 30,
	aligntype = RIGHT_TOP_CORNER,
}

_M[138] =
{
	txt = _t"请点击灵魂胸甲的第一个宝石孔",
	panel = "Panel_SoulArmor_StoneList",
	objs = {"Image_Stone01",},
	OffX = -230,
	OffY = 115,
	aligntype = RIGHT_TOP_CORNER,
}

_M[139] =
{
	txt = _t"点击需要装备的灵魂宝石",
	panel = "Panel_ItemList",
	objs_pre = {"Image_Mask",},
	OffX = -175,
	OffY = 45,
	aligntype = RIGHT_TOP_CORNER,
}

_M[140] =
{
	txt = _t"请再次点击灵魂胸甲的第一个宝石孔进行升级",
	panel = "Panel_SoulArmor_StoneList",
	objs = {"Image_Stone01",},
	OffX = -230,
	OffY = 115,
	aligntype = RIGHT_TOP_CORNER,
}

_M[141] =
{
	txt = _t"在这里，宝石可以直接点击进入析出或升级操作",
	panel = "Panel_ItemList",
	objs_pre = {"Image_Mask",},
	OffX = -175,
	OffY = 90,
	max_time = 3000,
	take_a_step_when_time_out = 1,
	aligntype = RIGHT_TOP_CORNER,
}

_M[142] =
{
	txt = _t"灵魂铠甲可以升级哦！点击这里",
	panel = "Panel_SoulArmor",
	objs = {"Button_ArmorUp",},
	OffX = -530,
	OffY = -20,
	max_time = 5000,
	take_a_step_when_time_out = 1,
	aligntype = RIGHT_BOTTOM_CORNER,
}








