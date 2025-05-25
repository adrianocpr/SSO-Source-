--[[ @i18n help ]]
local _t = require("i18n").context("help")

---------------------------------------------------------------
--  created:   2011.3.17
--  author:    xxp
--
--  字符串资源。 ---------------------------------------------------------------

local Format = string.format
module("STRING_TABLE")

GUIDE_NEW_TYPE0 = _t"指引"
GUIDE_NEW_TYPE1 = _t"称号"
GUIDE_NEW_TYPE2 = _t"图鉴"
GUIDE_NEW_TYPE3 = _t"成就"
GUIDE_NEW_TYPE4 = _t"成就"
GUIDE_NEW_TYPE5 = _t"帮助"

GUIDE_JUMP_TEXT = _t"了解更多"


--无帮助内容时的返回值。
HELP_NO_SKILL = _t"当前没有可学习的技能。"
HELP_NO_QUEST = _t"当前没有可接受的任务。"
HELP_NO_EQUIP = _t"暂无可用新装备。"
HELP_NO_AREA = _t"还没有新的可活动区域。"
HELP_NO_APP = _t"暂无新系统开放。"

--帮助内容format字串。
HELP_NEW_SKILL = _t"^ffffff%s^00ff00等级%d\r"
HELP_NEW_QUEST = "^ffffff%s(%s)\r"
HELP_NEW_EQUIP = "^ffffff%s(%s)\r"
HELP_NEW_EQUIP_CANGET = _t"^ffffff%s(%d级)\r"
HELP_NEW_AREA = "^ffffff%s(%s)\r"
HELP_NEW_APP = "^ffffff%s(%s)\r"


HELP_CUR_DAILY_COLOR = "^ffff00" 
HELP_TIMEUP_DAILY_COLOR = "^646464"
HELP_FINISH_DAILY_COLOR = "^646464"
HELP_REQ_DAILY_COLOR = "^ff1616"


--区域名
HELP_STR_AREA1 = _t"死亡皇后岛"

--系统简介
HELP_STR_APP1 = _t"商店买卖"
HELP_STR_APP_PET = _t"捕捉宠物"

--训练师位置
HELP_STR_MASTER = _t"%s技能训练师:%s\r=============\r"


--装备类型
HELP_EQUIP_TYPE_WEAPON = _t"武器"
HELP_EQUIP_TYPE_OFFHAND = _t"副手"
HELP_EQUIP_TYPE_GLOVES = _t"护手"
HELP_EQUIP_TYPE_ARMOUR = _t"胸甲"
HELP_EQUIP_TYPE_HEAD = _t"头盔"
HELP_EQUIP_TYPE_LEG = _t"腿甲"
HELP_EQUIP_TYPE_NECKLACE = _t"项链"
HELP_EQUIP_TYPE_RING = _t"戒指"

--装备指引
HELP_CHAR_POINT = _t"鼠标左键或者使用快捷键C打开人物界面"
HELP_ENHANCE_EQUIP_IN = _t"放入你的圣衣吧,在背包里拖进去或者直接右键放上去"
HELP_ENHANCE_ITEM_IN1 = _t"放入背包中的"
HELP_ENHANCE_ITEM_IN2 = _t"放入聚能结晶"

--宝石升级指引
HELP_STONELVUP_IN1 = _t"放入星魂，以进行升级"
HELP_STONELVUP_IN2 = _t"放入形星辰碎片、星落，以进行升级"
HELP_STONELVUP_CONFIRMBUTTON = _t"现在点击升级按钮吧"



--宠物指引
HELP_SELECT_PET_MONSTER=_t"可捕捉的怪物，对其使用捕捉道具可以捕获宠物"
HELP_EQUIP_PET=_t"点击出战召出宠物"
HELP_CALL_PET=_t"在这选择宠物的战斗策略"
HELP_PET_LVL_UP=_t"宠物升级啦"
HELP_PET_DIE=_t"宠物阵亡了，耐心等待一下，宠物会自动复活并召出哦"
HELP_PET_CAN_UPGRADE=_t"你的宠物已经可以进化了，快去找宠物大师进行进化吧"

--坐骑指引
HELP_GAIN_HORSE_1 = _t"点击技能按钮，可以看到骑乘技能。"
HELP_GAIN_HORSE_2 = _t"点击骑乘技能，可以骑乘已装备的坐骑。"
HELP_GAIN_GIFT = _t"你获得了新手礼包，点击察看。"



-----------------------
-- 指引界面, old
GUIDE_MAP				=	_t"%s(%d - %d级)"
GUIDE_MAX				= _t"已经达到了最大可查询的引导"
GUIDE_LEVEL_SHORT		= _t"还没有达到下个指引的等级段"
GUIDE_EVENT_ACHIEVE		= _t"阶段事件（%d/%d）"
GUIDE_GOAL_ACHIEVE 		= _t"需完成之前全部阶段目标才能查看此隐藏目标"
GUIDE_LEVEL				= _t"(%d - %d级)"
GUIDE_TASK_LEV			= _t"%d级以上"
GUIDE_TASK_FINISH		= _t"已完成"
GUIDE_TASK_UN_FINISH	= _t"未完成"
GUIDE_ALL_TASK_FINISH	=	_t"所有目标已完成"
GUIDE_ALL_AWARD_GOT	=	_t"奖励已领取"

GUIDE_CUR_LEV			= _t"当前%d级"
GUIDE_SEE_DETAIL		=	_t"查看详情"
GUIDE_CLICK_AWARD		=	_t"点击领奖"

GUIDE_ACHI_FINISH		= _t"已完成"
GUIDE_POWER_VALUE		= "%.0f"
GUIDE_POWER_BTN			= ""
GUIDE_POWER_STAGE		= "%d/%d"
GUIDE_POWER_LEV0		= Format(_t"^%06x极低", QUALITY_COLOR_0)
GUIDE_POWER_LEV1		= Format(_t"^%06x较低", QUALITY_COLOR_1)
GUIDE_POWER_LEV2		= Format(_t"^%06x标准", QUALITY_COLOR_2)
GUIDE_POWER_LEV3		= Format(_t"^%06x较高", QUALITY_COLOR_3)
GUIDE_POWER_LEV4		= Format(_t"^%06x很高", QUALITY_COLOR_4)
GUIDE_POWER_LEV5		= Format(_t"^%06x爆表", QUALITY_COLOR_5)
GUIDE_POWER_INTRO		= _t"%s战力说明"


STF_HELP_SEARCH_0			= _t"共%d项:"
STF_HELP_SEARCH_1			= _t"没有找到..."
STF_HELP_NPC_0				= _t"服务列表："
STF_HELP_NPC_1				= _t"任务列表："
STF_HELP_NPC_2				= _t"位置："
STF_HELP_NPC_3				= _t"[已接]"
STF_HELP_NPC_4				= _t"[完成]"
STF_HELP_NPC_5				= _t"介绍："
STF_HELP_NPC_6				= _t"发放任务："
STF_HELP_NPC_7				= _t"验证完成任务："
STF_HELP_TASK_0				= _t"任务介绍："
STF_HELP_TASK_1				= _t"发放："
STF_HELP_TASK_2				= _t"验证："
STF_HELP_TASK_3				= _t"子任务："
STF_HELP_SKILL_0			= _t"技能介绍："
STF_HELP_MINE_0				= _t"介绍："
STF_HELP_MINE_1				= _t"等级需求： %s"
STF_HELP_MINE_2				= _t"所需工具："
STF_HELP_MINE_3				= _t"需要的生活技能："
STF_HELP_MINE_4				= _t"需要的任务："
STF_HELP_MINE_5				= _t"掉落："
STF_HELP_ITEM_0				= _t"介绍："
STF_HELP_MONSTER_0		= _t"称号："
STF_HELP_MONSTER_1		= _t"属性："
STF_HELP_MONSTER_2		= _t"说明："
STF_HELP_MONSTER_3		= _t"生命值："
STF_HELP_MONSTER_4		= _t"掉落："
STF_HELP_MAP_0				= _t"位置："

