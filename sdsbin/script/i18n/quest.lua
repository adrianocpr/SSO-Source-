--[[ @i18n quest ]]
local _t = require("i18n").context("quest")

module("STRING_TABLE")
-------------
---任务相关
TASK_ANY_MONSTER				= _t"任意怪物"

TASK_TEXT_GENDER_MALE_0			= _t"小伙子"
TASK_TEXT_GENDER_MALE_1			= _t"哥哥"
TASK_TEXT_GENDER_MALE_2			= _t"少年"
TASK_TEXT_GENDER_FEMALE_0		= _t"小姑娘"
TASK_TEXT_GENDER_FEMALE_1		= _t"姐姐"
TASK_TEXT_GENDER_FEMALE_2		= _t"少女"

TASK_TEXT_OR 					= _t"或"
TASK_TEXT_WANT_AND_HOW			= _t"需要%s(从 %s 获得)"

TASK_REWARD_EXP                 = _t"^123d45经验^123d45%d"
TASK_REWARD_MONEY               = _t"^123d45金钱^123d45%s"
TASK_REWARD_BINDMONEY           = _t"^123d45绑定金钱^123d45%s"
TASK_REWARD_UNKNOWN             = _t"^123d45物品：^123d45？？？"
TASK_REWARD_ITEM                = "^123d45%s*%d^123d45"

TASK_DEFAULT_NAME               = _t"任务"
TASK_AWARD 		                = _t"任务奖励："
TASK_AWARD_BY_LUCKY_DRAW        = _t"基础奖励（抽奖）"
TASK_AWARD_LUCKY_DRAW_TIP       = _t"^00ff00任务奖励通过抽奖形式发放，\r右侧显示的是抽奖基础奖励"
TASK_AWARD_ITEM                 = _t"你可以获得以下奖励物品："
TASK_AWARD_CHOOSE_ITEM          = _t"选择下面的一项作为奖励："
TASK_AWARD_RANDOM_ITEM          = _t"随机奖励"
TASK_AWARD_MESSAGE_CHOOSE_ITEM  = _t"请先选择一项物品奖励"

TASK_PLAYER_LEVEL_NOT_ENOUGH_HINT = _t"建议您查看${jump(18)}或${jump(56)}以便快速提升等级"

TASK_ACCEPT_BUTTON_TEXT         = _t"接受"
TASK_DENY_BUTTON_TEXT           = _t"拒绝"
TASK_COMPLTE_BUTTON_TEXT        = _t"完成"
TASK_OK_BUTTON_TEXT             = _t"确定"
TASK_BACK_BUTTON_TEXT           = _t"返回"

TASK_ADDITIONAL_TEXT_DELIVER_FAIL_GIVEN_ITEM = _t"^ff0000包裹空间不足，请清除包裹中多余物品后再接取任务^N"
TASK_ADDITIONAL_TEXT_ERROR_WRAPPER = "^ff0000%s^N"

TASK_TRACE_TIME_NEED			= _t"等待时间"
TASK_TRACE_TIME_LIMIT			= _t"剩余时间"
TASK_TRACE_ZONE_NEED			= _t"到达地点"
TASK_TRACE_COMPLETED            = _t"(完成)"
TASK_TRACE_FAILED               = _t"(失败)"
TASK_TRACE_DISTANCE 	        = _t"(%d米)"
TASK_TRACE_DISTANCE_KM          = _t"(%.1f千米)"
TASK_TRACE_DISTANCE_INFINITE    = _t"^cccccc(遥远)^N"
TASK_TRACE_ARRIVED              = _t"到达"
TASK_TRACE_NEAREST_TASK         = _t"离你最近的任务"
TASK_TRACE_UPDATED_TASK         = _t"最近更新的任务"
TASK_AVAILABLE_TRACE_NPC		= _t"%s有事找你"

TASK_MAIN                       = _t"主线任务"
TASK_BRANCH                     = _t"支线任务"
TASK_AVAILABLE                  = _t"可接任务"
TASK_ARCHIVED                   = _t"你的历程"

TASK_CATEGORY_UNKNOWN           = _t"^ff0000!!!未分类!!!"
TASK_COUNT_INFO                 = _t"任务：%d/%d"

TASK_DETAIL_DESC                = _t"任务描述："
TASK_DETAIL_SOURCE              = _t"^347658领取任务：^N"
TASK_DETAIL_OBJECT              = _t"^347658任务目标：^N"
TASK_DETAIL_COMPLETE            = _t"^347658任务完成：^N"
TASK_DETAIL_ENTRY_FINISHED_WRAP = _t"%s ^197612(完成)^N"
TASK_DETAIL_ENTRY_SEPERATOR     = _t"　"
TASK_DETAIL_ENTRY_AWARD_NPC     = _t"交付人：%s"

TASK_ABANDON_HINT_NORMAL		= _t"放弃该任务"
TASK_ABANDON_HINT_DISABLED		= _t"该任务无法被放弃"
TASK_ABANDON_CONFIRM            = _t"是否确认要放弃任务“%s”？"

TASK_LIB_REFRESH_COUNT          = _t"你已经刷新过任务库%d次，"
TASK_LIB_REFRESH_COST_MONEY     = _t"刷新需要花费金币%d，"
TASK_LIB_REFRESH_COST_BINDMONEY = _t"刷新需要花费金券%d，"
TASK_LIB_REFRESH_COST_ITEM      = _t"刷新需要物品“%s”%d个，"
TASK_LIB_REFRESH_CONFIRM        = _t"是否确认要刷新任务库？"
TASK_LIB_REFRESH_FAILED         = _t"刷新失败"
TASK_LIB_AWARD_EXP				= _t"经验：%d"
TASK_LIB_FINISHED_COUNT			= _t"今日已完成任务：%d/%d"

TASK_RING_REFRESH				= _t"日常刷新 (%d次)"
TASK_RING_REFRESH_COUNT_ZERO	= _t"日常刷新 (%d次)"
TASK_RING_REFRESH_HINT			= _t"刷新一次人物故事"
TASK_RING_REFRESH_COUNT_ZERO_HINT = _t"你今天日常刷新故事的次数已用尽"
TASK_RING_DICE_REFRESH			= _t"命运刷新 (%d次)"
TASK_RING_DICE_REFRESH_COUNT_ZERO = _t"命运刷新 (%d次)"
TASK_RING_DICE_REFRESH_HINT		= _t"使用命运骰子刷新一次人物故事。\r你现在有%d个命运骰子，每天最多使用10次"
TASK_RING_NO_DICE_HINT			= _t"使用命运骰子刷新一次人物故事。\r^ff0000命运骰子数量不足"
TASK_RING_DICE_REFRESH_COUNT_ZERO_HINT = _t"你今天使用命运骰子刷新故事的次数已用尽"

TASK_BENEFIT_LIB_BUTTON_ACCEPT  = _t"接受"
TASK_BENEFIT_LIB_BUTTON_ACCEPTED= _t"进行中"

TASK_HINT_NEW                   = _t"任务^fed3ff%s^N接受"
TASK_HINT_SUCCESS               = _t"任务^96c8ff%s^N完成"
TASK_HINT_FAIL                  = _t"任务^ff4a4a%s^N失败"
TASK_HINT_UPDATE                = _t"任务^fed3ff%s^N更新"
TASK_HINT_UPDATE_COUNT          = _t"任务^fed3ff%s^N更新%d/%d"
TASK_HINT_SUB_SUCCESS           = _t"任务^fed3ff%s子任务%s^N完成"
TASK_HINT_SUB_TASK_UPDATE_COUNT = _t"任务^fed3ff%s子任务%s^N更新%d/%d"

TASK_MONSTERS_HINT_PREFIX       = _t"以下任务需要杀死该目标："

TASK_FAILED_INFO                = _t"^ff0000任务失败，请放弃该任务并重新接取^N"
TASK_FAILED_TRACE_ENTRY			= _t"请前往 %s 处重新接取任务"
TASK_REACCEPT					= _t"(重新接取)"

TASK_PROTECT_TARGET_DIST_WARNING= _t"请靠近护送目标"
TASK_PROTECT_TARGET_DIST_FAILED = _t"您距离护送目标过远，目标失去保护"

TASK_PROTECT_TARGET_NAME_SUFFIX = "(%s)"
TASK_PROTECT_TARGET_DIST_WARNING= _t"请靠近护送目标"
TASK_PROTECT_TARGET_DIST_FAILED = _t"您距离护送目标过远，目标失去保护"

TASK_SHARE_HINT_NORMAL			= _t"分享该任务"

TASK_SHARE_REQUEST_SENT         = _t"正在向全队分享任务：%s"
TASK_SHARE_NOTIFICATION         = _t"%s 向您分享任务：%s，是否接受？"
TASK_SHARE_FAIL_NOTIFICATION    = _t"%s 向您分享任务：%s，但您不满足任务接受条件"

TASK_SHARE_ACCEPTED             = _t"%s 接受了您分享的任务：%s"
TASK_SHARE_REFUSED              = _t"%s 拒绝了您分享的任务：%s"
TASK_SHARE_REQ_UNFIT            = _t"%s 由于不满足任务条件无法接受您分享的任务：%s"
TASK_SHARE_FAILED               = _t"向玩家 %s 分享任务 %s 失败"

QUEST_TEAM_RALLY_CONFIRM = _t"您的队伍有队员不在附近，因此无法接取该任务，是否向他们发送集合通知？"
QUEST_TEAM_RALLY_MESSAGE = _t"%s 希望接取任务 【%s】，但因为您距离过远接取失败，是否立即前往集合地点：【%s】？"

QUEST_LEAVE_TEAM_WARNING = _t"此时离开队伍会造成任务【%s】失败，是否真的要离开队伍？"
QUEST_DISMISS_TEAM_WARNING = _t"此时解散队伍会造成全体队员的任务【%s】失败，是否真的要解散队伍？"
QUEST_DISMISS_RAID_WARNING = _t"此时解散团队会造成全体队员的任务【%s】失败，是否真的要解散团队？"
QUEST_DISMISS_DUNGEON_WARNING	=	_t"此时解散团队会造成副本失败，是否真的要解散团队？"

QUEST_COLLABORATION_CODE_A_INFO = _t"请在下方输入任务码以接取任务\r任务码可在合作方网站领取"
QUEST_COLLABORATION_CODE_B_INFO = _t"您的^ff0000完成码为：%s\r^N请前往合作方网站获取奖励码并在下方输入以完成任务"
QUEST_COLLABORATION_CODE_B_COPIED = _t"您的完成码已经复制到剪贴板中了"

-- 传送
TASK_TELEPORT_CONFIRM           = _t"你将前往【%s】，准备好了吗？"
TASK_SET_HOME_CONFIRM			= _t"你确定要将回城点设置在【%s】吗？"

-- 抽奖
TASK_LOTTERY_NO_CHANCE				=	_t"没有抽奖机会了"
TASK_LOTTERY_ANOTHER_CHANCE				=	_t"您有重新抽奖的机会，要重新抽奖吗？"
TASK_LOTTERY_RESULT				=	_t"%d个%s"
TASK_LOTTERY_ING				=	_t"正在抽奖中，不能关闭界面"
TASK_LOTTERY_LESS_MONEY				=	_t"金币没有达到%d，无法进行抽奖"
TASK_LOTTERY_LESS_BINDMONEY				=	_t"金券没有达到%d，无法进行抽奖"
TASK_LOTTERY_LESS_ITEM				=	_t"身上没有%s，无法进行抽奖"
TASK_LOTTERY_CONFIG				=	_t"没有抽奖相关的配置项，无法进行抽奖"
TASK_LOTTERY_RESTART				=	_t"不满意？刷！（%d次）"
TASK_LOTTERY_ITEM					=	_t"你拥有%s%d个\r"
TASK_LOTTERY_MAX_TIME				=	_t"本次刷新上限为%d次\r现在你还可以刷新%d次"

-- 在线奖励
ONLINE_GIFT_COUNT_DOWN = _t"点击领取 %d秒"
