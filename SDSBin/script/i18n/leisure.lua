--[[ @i18n combat ]]
local _t = require("i18n").context("combat")

module("STRING_TABLE")
------------------------
--慢节奏pvp
LEISURE_ARENA_BUTTON_HINT 		= 	_t"英雄竞技场擂台赛"
LEISURE_TOP_BUTTON_HINT			=	_t"英雄竞技场挑战赛"

PLAYER_NOT_IN_TOP				=	_t"您还没有上榜，请继续努力"
LEISURE_TOP_EMPTY				= 	"---\t--------"
LEISURE_TOP_FORMAT				= 	"^N%d\t%s"
LEISURE_TOP_SELF_FORMAT			= 	"^00FF00%d\t^00FF00%s"
LEISURE_CHALLENGE_TIME_HINT		=	_t"挑战次数已经用完"

LEISURE_CHALLENGE_WIN_HINT		=	_t"恭喜你，挑战获得胜利，可以试着挑战下一个"
LEISURE_CHALLENGE_LOSE_HINT		=	_t"很遗憾，挑战失败，提升战力会让你更加强力"

LEISURE_CHALLENGE_REMAIN_COUNT_HINT = _t"您剩余的次数为%d次，右键点击其他玩家名字即可与之对战！"
LEISURE_CHALLENGE_NOT_FIT_HINT = _t"您的等级不适合该榜，可以去%s试试身手"

LEISURE_CHALLENGE_RESULT0		=	_t"挑战成功"
LEISURE_CHALLENGE_RESULT1		=	_t"挑战失败"
LEISURE_CHALLENGE_ERROR1		=	_t"客户端请求错误"
LEISURE_CHALLENGE_ERROR2		=	_t"挑战了错误的榜"
LEISURE_CHALLENGE_ERROR3		=	_t"挑战超过当天的次数"
LEISURE_CHALLENGE_ERROR4		=	_t"只能挑战比自己排名高的"
LEISURE_CHALLENGE_ERROR5		=	_t"18:30-20:00、23:55-次日0点之间不可以进行挑战"
LEISURE_CHALLENGE_ERROR6		=	_t"无法找到玩家信息"
LEISURE_CHALLENGE_ERROR7		=	_t"等级不够40级, 无法挑战"

LISEURE_ARENA_SET_SKILL_ERROR	=	_t"设置技能失败!"
LEISURE_ARENA_NEWS_0			=	_t"您在第%d轮的战斗中失败!"
LEISURE_ARENA_NEWS_1			=	_t"恭喜您在第%d轮获得胜利!"



LEISURE_ARENA_ROUND_1	=	_t"擂台赛进行中！！32进16准备角逐中！"
LEISURE_ARENA_ROUND_2	=	_t"擂台赛进行中！！16进8准备角逐中！"
LEISURE_ARENA_ROUND_3	=	_t"擂台赛进行中！！8进4准备角逐中！"
LEISURE_ARENA_ROUND_4	=	_t"擂台赛进行中！！半决赛准备角逐中！"
LEISURE_ARENA_ROUND_5	=	_t"擂台赛进行中！！决赛准备角逐中！"
LEISURE_ARENA_ROUND_6	=	_t"擂台赛已经结束！"

LEISURE_ARENA_SKILL_NAME_PACK = _t"布"
LEISURE_ARENA_SKILL_NAME_SHEAR = _t"剪刀"
LEISURE_ARENA_SKILL_NAME_STONE = _t"石头"

LEISURE_ARENA_SKILL_HINT_PACK = _t"^FF0000战斗技能:布"
LEISURE_ARENA_SKILL_HINT_SHEAR = _t"^00FF00战斗技能:剪刀"
LEISURE_ARENA_SKILL_HINT_STONE = _t"^00FF00战斗技能:石头"

LEISURE_ARENA_NOT_JOIN_IN_ROUND = _t"您无法参与赛事，16强角逐之后，请您时刻关注赛况，欢迎下次参与！"
LEISURE_ARENA_NOT_JOIN_IN_AWARD = _t"(您未能参与擂台赛，请继续努力)"
LEISURE_ARENA_WIN_ROUND_0 = _t"很抱歉，您未能进入16强，请继续努力，欢迎关注后续赛事。"
LEISURE_ARENA_WIN_ROUND_1 = _t"很抱歉，您未能进入8强，请继续努力，欢迎关注后续赛事。"
LEISURE_ARENA_WIN_ROUND_2 = _t"很抱歉，您未能进入半决赛，请继续努力，欢迎关注后续赛事。"
LEISURE_ARENA_WIN_ROUND_3 = _t"很抱歉，您未能进入决赛，请继续努力，欢迎关注后续赛事。"
LEISURE_ARENA_AWARD_TITLE_TODAY = _t"^00FF00今日战报查询"
LEISURE_ARENA_AWARD_TITLE_YESTODAY = _t"^00FF00昨日战报查询"
LEISURE_ARENA_AWARD = _t"您在小组的赛事中取得了%d胜%d负，获得金券%d，以及英雄点数%d。"
LEISURE_ARENA_AWARD_BUTTON_HINT = _t"奖励金券%d，英雄点数%d。"
LEISURE_ARENA_AWARD_NOTIFY = _t"您在擂台赛中获得金券%d，英雄点数%d。\r请在明天擂台赛前领奖!"
LEISURE_ARENA_AWARD_ACCEPT = _t"您在擂台赛中排名%d位！共领取了金券%d，英雄点数%d"
LEISURE_ARENA_AWARD_ACCEPT_ERR_1 = _t"您没有奖励可以领取"
LEISURE_ARENA_AWARD_ACCEPT_ERR_2 = _t"您已经领取过奖励了"
LEISURE_ARENA_AWARD_ACCEPT_ERR_3 = _t"您当前正处于交易状态，无法领取奖励，请在交易后再领取奖励"
LEISURE_ARENA_START_PRE_NOTIFY_0 = _t"距离英雄擂台赛还有半小时，排行榜已经锁定"
LEISURE_ARENA_START_PRE_NOTIFY_1 = _t"半小时后根据当前排名进行分组对战，优胜者将会获得大量金券"
LEISURE_ARENA_START_PRE_NOTIFY_2 = _t"可以打开右上角的[vs]按钮查看"
LEISURE_ARENA_START_NOTIFY_0 = _t"英雄擂台赛正式开始!"
LEISURE_ARENA_START_NOTIFY_1 = _t"优胜者将会获得大量金券"
LEISURE_ARENA_START_NOTIFY_2 = _t"可以打开右上角的功能按钮进入查看"
LEISURE_ARENA_IS_IN_SKILL = _t"^FF0000战斗准备中，技能不可修改"

LEISURE_ARENA_WINNERS_0 = _t"英雄竞技场战报（详细点右上按钮进入)\r金榜第一组冠军：%s，第二组冠军：%s，第三组冠军：%s"
LEISURE_ARENA_WINNERS_1 = _t"银榜第一组冠军：%s，第二组冠军：%s，第三组冠军：%s"
LEISURE_ARENA_WINNERS_2 = _t"铜榜第一组冠军：%s，第二组冠军：%s，第三组冠军：%s"

LEISURE_ARENA_NO_PLAYER	= _t"(无)"
LEISURE_ARENA_EMPTY_PLAYER = _t"(轮空)"

LEISURE_LEFT_TIME = _t"剩余时间：%02d:%02d"

LEISURE_AROUSE_HIT_SELF = _t"你鼓励了%s"
LEISURE_AROUSE_HIT_COMPONENT = _t"%s表示要和你一起努力，成为强大的圣斗士"
LEISURE_JEER_HIT_SELF = _t"你嘲笑了%s"
LEISURE_JEER_HIT_COMPONENT = _t"%s嘲笑了你，战胜你简直是小菜一碟"

LEISURE_ARENA_WAIT_START = _t"等待"
LEISURE_ARENA_WAIT_COMPONENT = _t"对手!"
LEISURE_ARENA_WAIT_VSRESULT = _t"战报!"
LEISURE_ARENA_WAIT_AWARD = _t"奖励信息!"
LEISURE_ARENA_WAIT_STAGE_0 = _t"青铜至尊小组信息!"
LEISURE_ARENA_WAIT_STAGE_1 = _t"白银至尊小组信息!"
LEISURE_ARENA_WAIT_STAGE_2 = _t"黄金至尊小组信息!"
LEISURE_ARENA_WAIT_STAGE_3 = _t"自己小组信息!"

LEISURE_VS_EMPTY_COMPONENT_NAME = _t"(空)"
LEISURE_VS_EMPTY_COMPONENT_DATA = "--"

LEISURE_VS_UNKONW_NAME = _t"？？？"

LEISURE_CHALLENGE_MSG_HEAD = _t"英雄竞技场："
LEISURE_CHALLENGE_WIN = _t"%s妄图挑战你，结果被你妥妥的收拾掉"
LEISURE_CHALLENGE_LOSE = _t"%s大发神威，将你斩落马下，你的排名：%d"
LEISURE_CHALLENGE_TIME = _t"%d月%d日%d:%d"
LEISURE_CHALLENGE_TAG_0 = " "
LEISURE_CHALLENGE_TAG_1 = _t"新"
LEISURE_CHALLENGE_NEW_HINT = _t"英雄竞技场：你有新的挑战报告!"

Leisure_Arena_Vs_Desc = 
{
	start = _t"^FFFFFF战报:\r",
	offLine = _t"^FFFF00%s^FF0000不在线，攻击减弱\r",
	dmg = _t"^FFFFFF造成^FF0000%d^FFFFFF点伤害\r",
	result = _t"-----------------\r^FFFF00%s^A800FF获胜！",
}

Leisure_Arena_Vs_Skill_Desc = 
{
	pack = 
	{
		_t"^FFFF00%s^FFFFFF对^00FF00%s^FFFFFF使用布",
	},
	shear = 
	{
		_t"^FFFF00%s^FFFFFF对^00FF00%s^FFFFFF使用剪刀",
	},
	stone = 
	{
		_t"^FFFF00%s^FFFFFF对^00FF00%s^FFFFFF使用石头",
	},
	common = 
	{
		_t"^FFFF00%s^FFFFFF对^00FF00%s^FFFFFF拳打脚踢",
		_t"^FFFF00%s^FFFFFF给^00FF00%s^FFFFFF一个膝撞",
		_t"^FFFF00%s^FFFFFF给^00FF00%s^FFFFFF一记老拳",
	},
}