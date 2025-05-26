--[[ @i18n combat ]]
local _t = require("i18n").context("combat")

local Format = string.format
module("STRING_TABLE")


----------------------
--伤害信息
DODAMAGE					=	_t"^00FF00你^N对^00FF00%s^N造成了^FFA545%d^N点伤害"
BEDAMAGED					=	_t"^00FF00%s^N对^00FF00你^N造成了^FF0000%d^N点伤害" 
PETDODAMAGE					=	_t"^00FF00你^N的守护星^00FF00%s^N对^00FF00%s^N造成了^FFA545%d^N点伤害"
BEDAMAGEDBYPET				=	_t"^00FF00%s^N的守护星^00FF00%s^N对你造成了^FF0000%d^N点伤害"

-----------------------
--治疗信息
DOHEAL						=	_t"^00FF00你^N给^00FF00%s^N恢复了^00FFFF%d^N点生命"
BEHEALED					=	_t"^00FF00%s^N给^00FF00你^N恢复了^00FFFF%d^N点生命"
SELFHEALED					=	_t"^00FF00你^N恢复了^00FFFF%d^N点生命"


----------------------
--PK
PK_DISABLE_ME_HINT			=	_t"您目前不被允许进行决斗，10级以后将获得决斗权。"
PK_DISABLE_TARGET_HINT		=	_t"对方能力尚不足以进行决斗。"
PK_DISABLE_BOOTHING			=	_t"对方正在进行摆摊操作，不能进行决斗。"
PK_DISABLE_PVP_MAP			=	_t"玩家在竞技场里不能进行决斗。"
TAB_SEL_SWITCH_PK_RULE		=	_t"切换至PK方案%d/%d" 
SAVE_PK_RULE				=	_t"保存PK方案成功" 



STF_QTE_BUTTON1				= _t"空 格"
STF_QTE_BUTTON2				= _t"鼠标左键"
STF_QTE_BUTTON3				= _t"鼠标右键"
STF_QTE_TYPE_0				= _t"单键"
STF_QTE_TYPE_1				= _t"单键连击"
STF_QTE_TYPE_2				= _t"双键交替连击"
STF_QTE_TYPE_3				= _t"晃动鼠标"
STF_QTE_TYPE_4				= _t"按住"




----------------------
--战场
LEAVE_BATTLE_ACCOUNT	= 	_t"战斗已经结束，即将离开战场： %d"
ENTER_PUBLIC_BATTLE_CONFIRM = _t"%s战场开启，是否进入?"
PUBLIC_BATTLE_FIRST_KILL	= _t"%s 玩家获得了第一滴血！"
PUBLIC_BATTLE_KILL_NUM 		= _t"%s玩家%d人斩！"
PUBLIC_BATTLE_ATTACK_WIN	= _t"红方获胜"
PUBLIC_BATTLE_DEFEND_WIN 	= _t"蓝方获胜"
PUBLIC_BATTLE_BATTLE_DRAW 	= _t"平局"
PUBLIC_BATTLE_TIME_COUNTER	= _t"战场剩余时间：%s"
PUBLIC_BATTLE_END_NORMAL	= _t"战斗结束，您将在^ff0000%s^N后离开战场"
PUBLIC_BATTLE_PUNISH_TIPS   = _t"您因为逃跑，将在 ^ff0000%s^N 内无法再次使用排队服务"
PUBLIC_BATTLE_PUNISH_TIPS_LABEL = _t"逃跑惩罚倒计时:"
PUBLIC_BATTLE_JOINED_TIPS 	= _t"您已经处于战场队列中，请耐心等待"
PUBLIC_BATTLE_JOINED_SUCCESS= _t"恭喜，您已成功排队"
PUBLIC_BATTLE_CLOSED_TIPS	= _t"%s 战场已经关闭，无法进入"
PUBLIC_BATTLE_LEVEL_LOW 	= _t"抱歉，您需要达到 ^ff0000%s^N 级才能排队 %s"
PUBLIC_BATTLE_ROLES_QUEUE_CROS = _t"您的账号下已有其他角色正在跨服中，当前角色无法进行跨服操作"
--占地可持续时间,与策略中写死的一致,勿轻易改
PUBLIC_BATTLE_OCCUPY_DURATION_TIME   = "15"
PUBLIC_BATTLE_OCCUPY_SCORE_INC_SPEED = "2"
PUBLIC_BATTLE_HAS_PK_VALUE	=	_t"当前PK值不为0，战场属于PK无惩罚区域，被其他玩家击杀不会掉落金币和损失装备耐久"
--
PUBLIC_BATTLE_OCCUPY_SCORE_ATTACKER	= _t"红方占地: %d"
PUBLIC_BATTLE_OCCUPY_SCORE_DEFENDER	= _t"蓝方占地: %d"
PUBLIC_BATTLE_RED_PLAYER_NUM		= _t"^ff0000%d红方玩家"
PUBLIC_BATTLE_BLUE_PLAYER_NUM		= _t"^0000ff%d蓝方玩家"
PUBLIC_BATTLE_FINAL_CREDIT	  		= _t"^ff0000红方积分%d ^ffffffVS ^0000ff%d蓝方积分"
PUBLIC_BATTLE_FLAG_HINT				=	_t"一个小旗子"
PUBLIC_BATTLE_OCCUPY_SCORE				=	_t"占领积分"
PUBLIC_BATTLE_FLAG_SCORE				=	_t"抢旗积分"
CHAOS_BATTLE_FINAL_CREDIT	  		= _t"^ff0000红方资源%d ^ffffffVS ^0000ff%d蓝方资源"

SERVER_BATTLE_BROADCAST1		=	_t"宇宙争霸赛将在10分钟后开启，请参赛成员做好准备"
SERVER_BATTLE_BROADCAST2		=	_t"宇宙争霸赛将在5分钟后开启，请参赛成员尽快入场"
SERVER_BATTLE_BROADCAST3		=	_t"本服务器在本周宇宙争霸赛中获得了一场辉煌的胜利，请勇士们尽快提交神意奖牌，开启全服犒赏"
SERVER_BATTLE_BROADCAST4		=	_t"本服务器在本周宇宙争霸赛中力战不敌，请再接再厉"
SERVER_BATTLE_BROADCAST5		=	_t"本周宇宙争霸赛赛程已经决定，请参赛人员到服务NPC处查询"
SERVER_BATTLE_BROADCAST6		=	_t"宇宙争霸赛的战斗已经开始，请为参赛勇士们祈祷"
SERVER_BATTLE_BROADCAST7		=	_t"第二轮比赛赛前10分钟喊话"
SERVER_BATTLE_BROADCAST8		=	_t"第二轮比赛赛前5分钟喊话"
SERVER_BATTLE_BROADCAST9		=	_t"第二轮比赛开始喊话"
SERVER_BATTLE_MATCH_INFO		=	_t"本次宇宙争霸赛的对手是：\r第一场：%s\r第二场：%s"
SERVER_BATTLE_NO_MATCH_INFO		=	_t"本服轮空或宇宙争霸赛尚未开启"
SERVER_BATTLE_MATCH_NO_INFO		=	_t"（无对手）"	
SERVER_MERGE_SERVER_NAME	=	_t"联合（%s）"

BATTLE_ENTER			=	_t"进入"
BATTLE_LACK_OF_TICKET	=	_t"缺少入场券"

----------------------
--个人竞技场
ARENA_CONTEST_COMMING = _t"斗技将于%d秒后开始，请准备好！"
ARENA_AWARD_WIN       = _t"恭喜您成功击败了对手！"
ARENA_AWARD_WIN_COMBO = _t"恭喜您成功击败了%d连胜的对手！"
ARENA_AWARD_WIN_LUCK  = _t"恭喜您中了幸运奖，直接获得胜利！"
ARENA_AWARD_WIN_OFFLINE = _t"对手下线了，恭喜您直接获得胜利！"
ARENA_AWARD_LOST	  = _t"很遗憾您输掉了本场斗技！再来！"
ARENA_AWARD_LOST_COMBO = _t"很遗憾您输给了%d连胜的对手！再来！"
ARENA_AWARD_LOST_GIVE = _t"您放弃了本场比赛，没有获得任何奖励，周可参与上限扣除1次"
ARENA_AWARD_CONFIRM_COUNT_DOWN = _t"对方放弃了本场比赛，您直接获得胜利！"
ARENA_AWARD_DRAW	  = _t"平局！太遗憾了！"
ARENA_RESULT_ERROR	  = _t"结果发生错误"
ARENA_AWARD_COMBO_KILL= _t"连杀了%d"
ARENA_SEASON_BEGIN 	  = _t"银河斗技场将在半小时内开启，持续两个小时，请大家安排好时间，抓紧冲分！"
ARENA_SEASON_END      = _t"请注意！本周的银河斗技场即将结束！周结算榜单将在晚12点进行刷新，请耐心等待结果和奖励！"
ARENA_REGISTER_BROAD  = _t"银河斗技场于每周的周三22-23:55\r周六日13-14:55、17-18:55、22-23:55开启场地"
ARENA_LACK_FIELD	  = _t"申请失败，场地已用完"
ARENA_CONTEST_CANCEL  = _t"斗技场被迫取消,斗技场创建失败"
ARENA_ENQUEUE_FAIL	  = _t"银河斗技场报名失败"
ARENA_GET_COMBO_KILL_5   = _t"银河斗技场：%s 达成 %d 场连胜！已经无人能挡了！"
ARENA_GET_COMBO_KILL_10  = _t"银河斗技场：%s 达成 %d 场连胜！已经杀人如麻了！大家快来围观！已经如同神一般了！谁快来阻止他吧！"
ARENA_GET_COMBO_KILL_15  = _t"银河斗技场：%s 达成 %d 场连胜！已经如同神一般了！谁快来阻止他吧！"
ARENA_GET_COMBO_KILL_20  = _t"银河斗技场：%s 达成 %d 场连胜！已经超神了！谁快来阻止他吧！"
ARENA_AWARD_GET_COMBO_KILL_5   = _t"您达成 %d 场连胜！已经无人能挡了！"
ARENA_AWARD_GET_COMBO_KILL_10  = _t"您达成 %d 场连胜！已经杀人如麻了！"
ARENA_AWARD_GET_COMBO_KILL_15  = _t"您达成 %d 场连胜！已经如同神一般了！"
ARENA_AWARD_GET_COMBO_KILL_20  = _t"您达成 %d 场连胜！已经超神了！"
ARENA_STOP_COMBO_SKILL_5_10  = _t"银河斗技场：%s 终结了 %s 的大杀特杀！"
ARENA_STOP_COMBO_SKILL_10_15 = _t"银河斗技场：%s 终结了 %s 的疯狂杀戮！"
ARENA_STOP_COMBO_SKILL_15_15 = _t"银河斗技场：%s 终结了 %s 的超神般的 %d 连杀！大家快去膜拜！"
ARENA_ENQUEUE_SUCCESS		 = _t"报名成功，正在为您准备场地和对手！"
ARENA_ENQUEUE_SEV_NOT_READY	 = _t"服务器未准备好"
ARENA_ENQUEUE_ROLE_NOT_ONLINE= _t"玩家不在线"
ARENA_ENQUEUE_WRONG_TIME	 = _t"斗技场还没有开启，请注意开启时间"
ARENA_ENQUEUE_REGISTER_ALREADY = _t"您已经报名过了！"
ARENA_ENQUEUE_IN_CONTEST	 = _t"您已经在斗技场中了！"
ARENA_ENQUEUE_NO_FIELD		 = _t"没有竞技场"
ARENA_ENQUEUE_EXCEED_WEEKLY_JOIN_COUNT = _t"很遗憾您本周已经没有报名次数了，下次再努力吧~"
ARENA_ENQUEUE_LOW_LEVEL 	 = _t"很抱歉，您的等级没有到达报名的要求"
ARENA_MAIL_SYSTEM		 	= _t"银河斗技场排行奖励"
ARENA_CRU_AWARD_SECT		= _t"(%d名-%d名) "
ARENA_CRU_WEEK_SECT			= _t"(%d名-%d名) "
ARENA_NEXT_AWARD_SECT		= _t"(%d名-%d名) "
ARENA_SINGLE_AWARD_SECT		= _t"%d名 "
ARENA_PLAYER_MAX_RANK_DESC	= _t"%d名以后"
ARENA_MAIL_CONTEXT			= _t"因为您在银河斗技场%s星座排行榜中(排名%d)的杰出表现，特此于%s发放此份奖励。"
ARENA_CONFIG_OPEN			= _t"0"
ARENA_FORBIDDEN 			= _t"在战场、副本和军团中无法使用个人斗技场"
ARENA_RANK_UP				= _t"^ff0000↑%d"
ARENA_RANK_DOWN				= _t"^00ff00↓%d"
ARENA_WAIT_PREPARE_HINT		= _t"准备倒计时后开始战斗"
ARENA_WAIT_PREPARE_TIME_HINT= _t"准备时间:"
ARENA_WAIT_QUIT_HINT		= _t"离开倒计时"
ARENA_WAIT_QUIT_TIME_HINT	= _t"离开时间:"
ARENA_FORBID_USE_ITEM       = _t"该物品不能在竞技场使用"
ARENA_FORBID_USE_ITEM       = _t"该物品不能在竞技场使用"
ARENA_AWARD_NPC_LINK		= _t"寻径至${npc(28614,\"荣耀之旗\")}兑换处"
ARENA_WAIT_PREPARE_X_OFFSET = _t"0"
ARENA_WAIT_PREPARE_Y_OFFSET = _t"122"
ARENA_WAIT_FIGHT_X_OFFSET 	= _t"16"
ARENA_WAIT_FIGHT_Y_OFFSET 	= _t"354"
ARENA_RECEIVE_FLOWERS 	= _t"%s向您赠送了%d朵鲜花！"

----------------------
--反外挂奖励
ANTI_CHEAR_BONUS0		=	_t"恭喜您答题成功，获得经验奖励"
ANTI_CHEAR_BONUS1		=	_t"恭喜您答题成功，获得奖励：生命力全满"
ANTI_CHEAR_BONUS2		=	_t"恭喜您答题成功，获得金券奖励"
ANTI_CHEAR_BONUS3		=	_t"恭喜您答题成功，获得潘多拉魔盒能量奖励"



----------------------
--PK区域
FIRST_TO_PKFREE				=	_t"你已进入PK无惩罚区"
FIRST_TO_SANCTUARY			=	_t"你已进入安全区"
SANCTUARY_TO_PK				=	_t"你已离开安全区"
SANCTUARY_TO_PKFREE			=	_t"你已进入PK无惩罚区"
PKFREE_TO_PK				=	_t"你已离开入PK无惩罚区"
PKFREE_TO_SANCTUARY			=	_t"你已离开入PK无惩罚区进入安全区"
PK_TO_PKFREE				=	_t"你已进入PK无惩罚区"
PK_TO_SANCTUARY				=	_t"你已进入安全区"



----------------------
--提示
CHANGELINE_FIGHTING			=  	_t"战斗状态下, 无法换线"
RESELECTROLE_FIGHTING		=	_t"战斗状态下, 无法返回选人"