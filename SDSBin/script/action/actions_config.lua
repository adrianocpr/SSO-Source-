enumAttachNone 			= 0
enumAttachRideOnPet 	= 1
enumAttachRideOnPlayer 	= 2
enumAttachHugPlayer 	= 3

ADSORPTION_NONE			= 0
ADSORPTION_STAND		= 1
ADSORPTION_RUN			= 2



suffix_attack =
{
	[WEAPON_NONE]  = "空手",
	[WEAPON_TYPE1] = "剑盾",
	[WEAPON_TYPE2] = "双手剑",
	[WEAPON_TYPE3] = "魔琴",
	[WEAPON_TYPE4] = "圣琴",
	[WEAPON_TYPE5] = "双手杖",
	[WEAPON_TYPE6] = "三叉戟",
	[WEAPON_TYPE7] = "爪",
	[WEAPON_TYPE8] = "匕首",
}

suffix_profession =
{
	[PROF_RESERVE]		= "无",
	[PROF_DEFAULT]		= "星矢",
	[PROF_PEGASI]		= "星矢",
	[PROF_CYGNI] 		= "冰河",
	[PROF_DRACONIS] 	= "紫龙",
	[PROF_ANDROMEDAE] 	= "瞬",
	[PROF_PHOENIX] 		= "一辉",
	[PROF_GEMINORUM]	= "加隆",
}


fly_action =
{
	[0] = {hang = PLAYER_ACTION_TYPE.ACT_HANGINAIR1, move = PLAYER_ACTION_TYPE.ACT_FLY1, },
	[1] = {hang = PLAYER_ACTION_TYPE.ACT_HANGINAIR2, move = PLAYER_ACTION_TYPE.ACT_FLY2, },
	[2] = {hang = PLAYER_ACTION_TYPE.ACT_HANGINAIR3, move = PLAYER_ACTION_TYPE.ACT_FLY3, },
	[3] = {hang = PLAYER_ACTION_TYPE.ACT_HANGINAIR4, move = PLAYER_ACTION_TYPE.ACT_FLY4, },
}


----------------------------------------
-- 人物动作

actions_player = {}

--[[
{
	normal,			普通状态下动作
	fight,  		战斗状态下动作
	f_normal,		加速中,普通状态下动作
	f_fight,		加速中,战斗状态下动作
	fight_id,		战斗状态下动作id, 替换当前动作
	f_normal_id,	加速中,普通状态下动作id, 替换当前动作
	f_fight_id,		加速中,战斗状态下动作,  替换当前动作
	common_act,		是否为各个守护星座的通用动作
	npc_normal_id,	普通状态下,对应NPC动作id
	npc_fight_id,	战斗状态下,对应NPC动作id
	mount_normal_id,普通状态下,对应坐骑动作id
	mount_fight_id, 战斗状态下,对应坐骑动作id
	saint_cloth_child_normal_id,普通状态下,对应圣衣子模型动作id
	saint_cloth_child_fight_id, 战斗状态下,对应圣衣子模型动作id
	saint_wing_normal_id,普通状态下,对应圣衣翅膀动作id
	saint_wing_fight_id, 战斗状态下,对应圣衣翅膀动作id
	adsortion_state,挂接状态
}
]]--

-- 站立
actions_player[PLAYER_ACTION_TYPE.ACT_STAND] =
{
	normal 			= "站立",
	fight			= "战斗站立",
	f_normal		= "特殊站立",
	f_fight			= "特殊战斗站立",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_STAND,
	npc_fight_id	= NPC_ACTION_TYPE.ACT_NPC_FIGHT_STAND,
	mount_normal_id	= NPC_ACTION_TYPE.ACT_NPC_STAND,
	adsortion_state = ADSORPTION_STAND,
	saint_wing_normal_id = NPC_ACTION_TYPE.ACT_NPC_WING_STAND,
}
actions_player[PLAYER_ACTION_TYPE.ACT_FIGHT_STAND] = "战斗站立"
actions_player[PLAYER_ACTION_TYPE.ACT_WALK] =
{
	normal 			= "行走",
    f_normal_id 	= PLAYER_ACTION_TYPE.ACT_SPECIAL_RUN,
	f_fight_id		= PLAYER_ACTION_TYPE.ACT_SPECIAL_FIGHT_RUN,
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_WALK,
	mount_normal_id	= NPC_ACTION_TYPE.ACT_NPC_WALK,
	adsortion_state = ADSORPTION_RUN,
	saint_wing_normal_id = NPC_ACTION_TYPE.ACT_NPC_WING_WALK,
}
-- 奔跑
actions_player[PLAYER_ACTION_TYPE.ACT_RUN] =
{
	normal 			= "奔跑",
	fight_id 		= PLAYER_ACTION_TYPE.ACT_FIGHT_RUN,
	f_normal_id 	= PLAYER_ACTION_TYPE.ACT_SPECIAL_RUN,
	f_fight_id		= PLAYER_ACTION_TYPE.ACT_SPECIAL_FIGHT_RUN,
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_RUN,
	mount_normal_id	= NPC_ACTION_TYPE.ACT_NPC_RUN,
	saint_wing_normal_id = NPC_ACTION_TYPE.ACT_NPC_WING_RUN,
	adsortion_state = ADSORPTION_RUN,
}
actions_player[PLAYER_ACTION_TYPE.ACT_FIGHT_RUN] =
{
	normal 			= "战斗奔跑",
	mount_normal_id	= NPC_ACTION_TYPE.ACT_NPC_RUN,
	saint_wing_normal_id = NPC_ACTION_TYPE.ACT_NPC_WING_RUN,
	adsortion_state = ADSORPTION_RUN,
}
actions_player[PLAYER_ACTION_TYPE.ACT_SPECIAL_RUN] =
{
	normal 			= "特殊奔跑",
	mount_normal_id	= NPC_ACTION_TYPE.ACT_NPC_RUN,
	adsortion_state = ADSORPTION_RUN,
}
actions_player[PLAYER_ACTION_TYPE.ACT_SPECIAL_FIGHT_RUN] =
{
	normal 			= "特殊战斗奔跑" ,
	mount_normal_id	= NPC_ACTION_TYPE.ACT_NPC_RUN,
	adsortion_state = ADSORPTION_RUN,
}
actions_player[PLAYER_ACTION_TYPE.ACT_FIGHT_RUN_BACK] = "战斗后跑"
actions_player[PLAYER_ACTION_TYPE.ACT_FIGHT_RUN_LEFT] = "战斗左跑"
actions_player[PLAYER_ACTION_TYPE.ACT_FIGHT_RUN_RIGHT] = "战斗右跑"
-- 奔跑结束
actions_player[PLAYER_ACTION_TYPE.ACT_RUN_STOP] =
{
	normal 			= "奔跑结束",
	fight_id 		= PLAYER_ACTION_TYPE.ACT_FIGHT_RUN_STOP,
	f_normal_id 	= PLAYER_ACTION_TYPE.ACT_SPECIAL_RUN_STOP,
	f_fight_id		= PLAYER_ACTION_TYPE.ACT_SPECIAL_FIGHT_RUN_STOP,
	mount_normal_id = NPC_ACTION_TYPE.ACT_NPC_RUN_STOP,
	adsortion_state = ADSORPTION_STAND,
}
actions_player[PLAYER_ACTION_TYPE.ACT_FIGHT_RUN_STOP] =
{
	normal 			= "战斗奔跑结束",
	mount_normal_id = NPC_ACTION_TYPE.ACT_NPC_RUN_STOP,
	saint_wing_normal_id = NPC_ACTION_TYPE.ACT_NPC_WING_FIGHT_RUN_STOP,
	adsortion_state = ADSORPTION_STAND,
}
actions_player[PLAYER_ACTION_TYPE.ACT_SPECIAL_RUN_STOP] =
{
	normal 			= "特殊奔跑结束",
	fight_id 		= PLAYER_ACTION_TYPE.ACT_SPECIAL_FIGHT_RUN_STOP,
	adsortion_state = ADSORPTION_STAND,
	mount_normal_id = NPC_ACTION_TYPE.ACT_NPC_RUN_STOP,
	saint_wing_normal_id = NPC_ACTION_TYPE.ACT_NPC_WING_SPECIAL_RUN_STOP,
}
actions_player[PLAYER_ACTION_TYPE.ACT_SPECIAL_FIGHT_RUN_STOP] =
{
	normal 			= "特殊战斗奔跑结束",
	adsortion_state = ADSORPTION_STAND,
	mount_normal_id = NPC_ACTION_TYPE.ACT_NPC_RUN_STOP,
	saint_wing_normal_id = NPC_ACTION_TYPE.ACT_NPC_WING_SPECIAL_FIGHT_RUN_STOP,
}
actions_player[PLAYER_ACTION_TYPE.ACT_CLIMB_WALL] =
{
    common_act 		= true,
    normal          = "攀爬贴墙",
    saint_wing_normal_id = NPC_ACTION_TYPE.ACT_NPC_WING_CLIMB_WALL,
}
actions_player[PLAYER_ACTION_TYPE.ACT_CLIMB_EDGE] =
{
    common_act 		= true,
    normal          = "攀爬悬挂",
    saint_wing_normal_id = NPC_ACTION_TYPE.ACT_NPC_WING_CLIMB_EDGE,
}
actions_player[PLAYER_ACTION_TYPE.ACT_CLIMB_MOVE] =
{
    common_act 		= true,
    normal          = "攀爬贴墙",
}


-- 跳跃开始
actions_player[PLAYER_ACTION_TYPE.ACT_JUMP_START] =
{
	normal 			= "跳跃开始",
	fight			= "战斗跳跃开始",
	f_normal		= "特殊跳跃开始",
	f_fight			= "特殊战斗跳跃开始",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_JUMP_START,
	mount_normal_id = NPC_ACTION_TYPE.ACT_NPC_JUMP_START,
}
-- 跳跃循环
actions_player[PLAYER_ACTION_TYPE.ACT_JUMP_LOOP] =
{
	normal 			= "跳跃循环",
	fight			= "战斗跳跃循环",
	f_normal		= "特殊跳跃循环",
	f_fight			= "特殊战斗跳跃循环",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_JUMP_LOOP,
	mount_normal_id = NPC_ACTION_TYPE.ACT_NPC_JUMP_LOOP,
}
-- 跳跃结束
actions_player[PLAYER_ACTION_TYPE.ACT_JUMP_LAND] =
{
	normal 			= "跳跃结束",
	fight			= "战斗跳跃结束",
	f_normal		= "特殊跳跃结束",
	f_fight			= "特殊战斗跳跃结束",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_JUMP_END,
	mount_normal_id = NPC_ACTION_TYPE.ACT_NPC_JUMP_END,
}
-- 二段跳跃开始
actions_player[PLAYER_ACTION_TYPE.ACT_JUMP_SECOND_START] =
{
	normal 			= "二段跳跃开始",
	fight			= "战斗二段跳跃开始",
	f_normal		= "特殊二段跳跃开始",
	f_fight			= "特殊战斗二段跳跃开始",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_JUMP_START,
	mount_normal_id = NPC_ACTION_TYPE.ACT_NPC_JUMP_START,
	saint_wing_normal_id = NPC_ACTION_TYPE.ACT_NPC_WING_SPECIAL_JUMP,
}
-- 二段跳跃循环
actions_player[PLAYER_ACTION_TYPE.ACT_JUMP_SECOND_LOOP] =
{
	normal 			= "二段跳跃循环",
	fight			= "战斗二段跳跃循环",
	f_normal		= "特殊二段跳跃循环",
	f_fight			= "特殊战斗二段跳跃循环",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_JUMP_LOOP,
	mount_normal_id = NPC_ACTION_TYPE.ACT_NPC_JUMP_LOOP,
	saint_wing_normal_id = NPC_ACTION_TYPE.ACT_NPC_WING_SPECIAL_JUMP_LOOP,
}
-- 二段跳跃结束
actions_player[PLAYER_ACTION_TYPE.ACT_JUMP_SECOND_LAND] =
{
	normal 			= "二段跳跃结束",
	fight			= "战斗二段跳跃结束",
	f_normal		= "特殊二段跳跃结束",
	f_fight			= "特殊战斗二段跳跃结束",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_JUMP_END,
	mount_normal_id = NPC_ACTION_TYPE.ACT_NPC_JUMP_END,
}
actions_player[PLAYER_ACTION_TYPE.ACT_HEAVY_JUMP_LAND] = "高空落地"

actions_player[PLAYER_ACTION_TYPE.ACT_JUMP_WALL] =
{
    common_act 		= true,
    normal          = "攀爬直跳",
}
actions_player[PLAYER_ACTION_TYPE.ACT_JUMP_EDGE] =
{
    common_act 		= true,
    normal          = "攀爬翻跳",
}



actions_player[PLAYER_ACTION_TYPE.ACT_SWIM] =
{
	common_act 		= true,
	normal 			= "游泳前进",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_RUN,
	mount_normal_id = NPC_ACTION_TYPE.ACT_NPC_WALK,
}
actions_player[PLAYER_ACTION_TYPE.ACT_HANGINWATER] =
{
	common_act 		= true,
	normal 			= "游泳站立",
	mount_normal_id = NPC_ACTION_TYPE.ACT_NPC_WALK,
}

actions_player[PLAYER_ACTION_TYPE.ACT_PRAY] = 
{
	common_act 		= true,
	normal 			= "祈祷开始",
}
actions_player[PLAYER_ACTION_TYPE.ACT_PRAY_LOOP] =  
{
	common_act 		= true,
	normal 			= "祈祷循环",
} 
actions_player[PLAYER_ACTION_TYPE.ACT_PRAY_END] =  
{
	common_act 		= true,
	normal 			= "祈祷结束",
}

actions_player[PLAYER_ACTION_TYPE.ACT_HOLY] = 
{
	common_act 		= true,
	normal 			= "挂机开始",
}
actions_player[PLAYER_ACTION_TYPE.ACT_HOLY_LOOP] =  
{
	common_act 		= true,
	normal 			= "挂机循环",
} 
actions_player[PLAYER_ACTION_TYPE.ACT_HOLY_END] =  
{
	common_act 		= true,
	normal 			= "挂机结束",
}

actions_player[PLAYER_ACTION_TYPE.ACT_SITDOWN] = "打坐开始"
actions_player[PLAYER_ACTION_TYPE.ACT_SITDOWN_LOOP] =  "打坐循环"
actions_player[PLAYER_ACTION_TYPE.ACT_STANDUP] =  "打坐结束"

actions_player[PLAYER_ACTION_TYPE.ACT_EAT] =
{
	common_act 		= true,
	normal 			= "进食开始",
}
actions_player[PLAYER_ACTION_TYPE.ACT_EAT_LOOP] =
{
	common_act 		= true,
	normal 			= "进食循环",
}
actions_player[PLAYER_ACTION_TYPE.ACT_EAT_END] =
{
	common_act 		= true,
	normal 			=  "进食结束",
}



actions_player[PLAYER_ACTION_TYPE.ACT_WOUNDED] =
{
    common_act 		= true,
	normal 			= "受伤",
    npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_WOUNDED,
}
actions_player[PLAYER_ACTION_TYPE.ACT_DOWN_WOUNDED] =
{
	common_act 		= true,
	normal 			= "被击倒受伤",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_FELL_WOUNDED,
}
actions_player[PLAYER_ACTION_TYPE.ACT_GROUNDDIE] =
{
	common_act 		= true,
	normal 			= "地面死亡开始",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_DIE,
}
actions_player[PLAYER_ACTION_TYPE.ACT_GROUNDDIE_LOOP] =
{
	common_act 		= true,
	normal 			= "地面死亡循环",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_DIE,
}
actions_player[PLAYER_ACTION_TYPE.ACT_WATERDIE] =
{
	common_act 		= true,
	normal 			= "游泳死亡开始",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_DIE,
}
actions_player[PLAYER_ACTION_TYPE.ACT_WATERDIE_LOOP] =
{
	common_act 		= true,
	normal 			= "游泳死亡循环",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_DIE,
}
actions_player[PLAYER_ACTION_TYPE.ACT_AIRDIE_ST] = "空中死亡"
actions_player[PLAYER_ACTION_TYPE.ACT_AIRDIE] = "空中死亡下落循环"
actions_player[PLAYER_ACTION_TYPE.ACT_AIRDIE_ED] = "空中死亡落地"
actions_player[PLAYER_ACTION_TYPE.ACT_AIRDIE_LAND_LOOP] = "死亡落地循环"
actions_player[PLAYER_ACTION_TYPE.ACT_REVIVE] =
{
	common_act 		= true,
	normal 			= "复活",
}



actions_player[PLAYER_ACTION_TYPE.ACT_KNOCK_BACK] =
{
	common_act 		= true,
	normal 			= "被击退",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_KNOCK_BACK,
}
actions_player[PLAYER_ACTION_TYPE.ACT_DOWN_START] =
{
	common_act 		= true,
	normal 			= "被击倒开始",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_FELL_START,
}
actions_player[PLAYER_ACTION_TYPE.ACT_DOWN_LOOP] =
{
	common_act 		= true,
	normal 			= "被击倒循环",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_FELL_LOOP,
}
actions_player[PLAYER_ACTION_TYPE.ACT_DOWN_END] =
{
	common_act 		= true,
	normal 			= "被击倒结束",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_FELL_END,
}
actions_player[PLAYER_ACTION_TYPE.ACT_STUN] =
{
	common_act 		= true,
	normal 			= "被击晕",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_STUN,
}
actions_player[PLAYER_ACTION_TYPE.ACT_DRIFTING] =
{
	common_act 		= true,
	normal 			= "被击浮空",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_FLOATING1,
}

actions_player[PLAYER_ACTION_TYPE.ACT_KNOCKED] =
{
	common_act 		= true,
	normal 			= "被击飞",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_KNOCKED,
}
actions_player[PLAYER_ACTION_TYPE.ACT_KNOCKED_LOOP] =
{
	common_act 		= true,
	normal 			= "被击飞循环",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_KNOCKED_LOOP,
}
actions_player[PLAYER_ACTION_TYPE.ACT_PULL_FRIENDLY] =
{
	common_act 		= true,
	normal 			= "被友好拉拽",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_PULL_FRIENDLY,
}
actions_player[PLAYER_ACTION_TYPE.ACT_BE_HOOKED] =
{
	common_act 		= true,
	normal 			= "被抱摔",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_BE_HOOKED,
}

actions_player[PLAYER_ACTION_TYPE.ACT_ATTACK_1] =
{
	normal			= "普攻1",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_NORMAL_ATTACK,
}
actions_player[PLAYER_ACTION_TYPE.ACT_ATTACK_2] =
{
	normal			= "普攻2",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_NORMAL_ATTACK,
}
actions_player[PLAYER_ACTION_TYPE.ACT_ATTACK_3] =
{
	normal			= "普攻3",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_NORMAL_ATTACK,
}
actions_player[PLAYER_ACTION_TYPE.ACT_ATTACK_4] =
{
	normal			= "普攻4",
	npc_normal_id	= NPC_ACTION_TYPE.ACT_NPC_NORMAL_ATTACK,
}



actions_player[PLAYER_ACTION_TYPE.ACT_PICKUP] = "采摘"
actions_player[PLAYER_ACTION_TYPE.ACT_PICKUP_LOOP] = "采摘植物循环"
actions_player[PLAYER_ACTION_TYPE.ACT_PICKUP_STANDUP] = "采摘站起"
actions_player[PLAYER_ACTION_TYPE.ACT_PICKUP_MATTER] = "捡东西"

actions_player[PLAYER_ACTION_TYPE.ACT_DIG] = "采摘"
actions_player[PLAYER_ACTION_TYPE.ACT_DIGLOOP] = "采摘植物循环"

actions_player[PLAYER_ACTION_TYPE.ACT_USEITEM] = "使用物品"
actions_player[PLAYER_ACTION_TYPE.ACT_USEITMELOOP] = "使用物品循环"

actions_player[PLAYER_ACTION_TYPE.ACT_GENERAL_OPRT] = "胜利"



actions_player[PLAYER_ACTION_TYPE.ACT_PET_SUMMON] =
{
	common_act 		= true,
	normal 			= "站立_宠物召唤",
}
actions_player[PLAYER_ACTION_TYPE.ACT_PET_RECALL] =
{
	common_act 		= true,
	normal 			= "站立_宠物收回",
}
actions_player[PLAYER_ACTION_TYPE.ACT_PET_COMBINE] =
{
	common_act 		= true,
	normal 			= "站立_宠物合体",
}



actions_player[PLAYER_ACTION_TYPE.ACT_EXP_WAVE] =
{
	common_act 		= true,
	normal 			= "大笑",
}
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_NOD] =
{
	common_act 		= true,
	normal 			= "愤怒",
}
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_SHAKEHEAD] =
{
	common_act 		= true,
	normal 			= "亲亲",
}
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_SHRUG] =
{
	common_act 		= true,
	normal 			= "吓到",
}
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_LAUGH] =
{
	common_act 		= true,
	normal 			= "休息",
}
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_ANGRY] =
{
	common_act 		= true,
	normal 			= "高兴",
}
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_STUN] =
{
	common_act 		= true,
	normal 			= "调皮",
}
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_DEPRESSED] =
{
	common_act 		= true,
	normal 			= "飞吻",
}
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_KISSHAND] =
{
	common_act 		= true,
	normal 			= "再见",
}
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_SHY] =
{
	common_act 		= true,
	normal 			= "可爱",
}
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_SALUTE] =
{
	common_act 		= true,
	normal 			= "敬礼",
}
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_SITDOWN] =
{
	common_act 		= true,
	normal 			= "请求",
}
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_SITDOWN_LOOP] = "坐下循环"
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_SITDOWN_STANDUP] = "坐下站起"
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_ASSAULT] = "冲锋"
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_THINK] = "思考"
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_DEFIANCE] =
{
	common_act 		= true,
	normal 			= "哭泣",
}
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_VICTORY] =
{
	common_act 		= true,
	normal 			= "鄙视",
}
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_KISS] = "亲吻"
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_KISS_LOOP] = "亲吻循环"
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_KISS_END] = "亲吻结束"
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_FIGHT] = "害羞"
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_ATTACK1] = "攻击1"
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_ATTACK2] = "攻击2"
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_ATTACK3] = "攻击3"
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_ATTACK4] = "攻击4"
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_DEFENCE] = "防御"
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_FALL] = "摔倒"
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_FALLONGROUND] = "倒地"
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_LOOKAROUND] = "张望"
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_DANCE] =
{
	common_act 		= true,
	normal 			= "舞蹈",
}
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_TOSS] = "放暗器"
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_GAPE] = "伸懒腰"
actions_player[PLAYER_ACTION_TYPE.ACT_EXP_TWO_KISS] = "双人亲吻"



actions_player[PLAYER_ACTION_TYPE.ACT_TRICK_RUN] = "花招跑"
actions_player[PLAYER_ACTION_TYPE.ACT_TRICK_JUMP] = "花招跳"
actions_player[PLAYER_ACTION_TYPE.ACT_BLINK] = "眨眼"
actions_player[PLAYER_ACTION_TYPE.ACT_CUSTOMIZE] = "入场"
actions_player[PLAYER_ACTION_TYPE.ACT_QINGGONG_START] = "轻功起"
actions_player[PLAYER_ACTION_TYPE.ACT_QINGGONG_LOOP] = "轻功循环"
actions_player[PLAYER_ACTION_TYPE.ACT_FIGHT_QINGGONG_LOOP] = "战斗轻功循环"
actions_player[PLAYER_ACTION_TYPE.ACT_STAND_PLAYER_DEMO] = 
{
	normal 			= "站立",
	saint_wing_normal_id = NPC_ACTION_TYPE.ACT_NPC_WING_STAND,
}
actions_player[PLAYER_ACTION_TYPE.ACT_STAND_FOR_PORTRAIT] = 
{
	no_suffix		= true,
	normal 			= "站立_星矢",
	saint_wing_normal_id = NPC_ACTION_TYPE.ACT_NPC_WING_STAND,
}

actions_player[PLAYER_ACTION_TYPE.ACT_LOGIN_SELECT_POSE] = "选人展示"
actions_player[PLAYER_ACTION_TYPE.ACT_LOGIN_SIT] = "坐"
actions_player[PLAYER_ACTION_TYPE.ACT_LOGIN_RELY] = "靠"
actions_player[PLAYER_ACTION_TYPE.ACT_LOGIN_RUN] = 
{
	normal 			= "选人奔跑"
}


actions_player[PLAYER_ACTION_TYPE.ACT_FLY_GLIDE1] = 
{
	common_act 		= true,
	normal 			= "翅膀_飞行_滑翔",
	saint_wing_normal_id = NPC_ACTION_TYPE.ACT_NPC_FLY_GLIDE1,
	saint_wing_fight_id  = NPC_ACTION_TYPE.ACT_NPC_FLY_GLIDE1,
	replace_wing_action  = NPC_ACTION_TYPE.ACT_NPC_WING_STAND,
}
actions_player[PLAYER_ACTION_TYPE.ACT_TAKEOFF1] = 
{
	common_act 		= true,
	normal 			= "翅膀_飞行_起飞",
	saint_wing_normal_id = NPC_ACTION_TYPE.ACT_NPC_TAKEOFF1,
	saint_wing_fight_id  = NPC_ACTION_TYPE.ACT_NPC_TAKEOFF1,
	replace_wing_action  = NPC_ACTION_TYPE.ACT_NPC_WING_STAND,
}
actions_player[PLAYER_ACTION_TYPE.ACT_HANGINAIR1] = 
{
	common_act 		= true,
	normal 			= "翅膀_飞行_悬停",
	saint_wing_normal_id = NPC_ACTION_TYPE.ACT_NPC_HANGINAIR1,
	saint_wing_fight_id = NPC_ACTION_TYPE.ACT_NPC_HANGINAIR1,
	replace_wing_action  = NPC_ACTION_TYPE.ACT_NPC_WING_STAND,
}
actions_player[PLAYER_ACTION_TYPE.ACT_FLY1] =
{
	common_act 		= true,
	normal 			= "翅膀_飞行_移动",
	saint_wing_normal_id = NPC_ACTION_TYPE.ACT_NPC_FLY1,
	saint_wing_fight_id  = NPC_ACTION_TYPE.ACT_NPC_FLY1,
	replace_wing_action  = NPC_ACTION_TYPE.ACT_NPC_WING_STAND,
}
actions_player[PLAYER_ACTION_TYPE.ACT_FLY_ABS_UP1] =
{
	common_act 		= true,
	normal 			= "翅膀_飞行_上升",
	saint_wing_normal_id = NPC_ACTION_TYPE.ACT_NPC_FLY_ABS_UP1,
	saint_wing_fight_id  = NPC_ACTION_TYPE.ACT_NPC_FLY_ABS_UP1,
	replace_wing_action  = NPC_ACTION_TYPE.ACT_NPC_WING_STAND,
}

actions_player[PLAYER_ACTION_TYPE.ACT_FLY_ABS_DOWN1] =
{
	common_act 		= true,
	normal 			= "翅膀_飞行_下落",
	saint_wing_normal_id = NPC_ACTION_TYPE.ACT_NPC_FLY_ABS_DOWN1,
	saint_wing_fight_id  = NPC_ACTION_TYPE.ACT_NPC_FLY_ABS_DOWN1,
	replace_wing_action  = NPC_ACTION_TYPE.ACT_NPC_WING_STAND,
} 

actions_player[PLAYER_ACTION_TYPE.ACT_FLYDOWN] = 
{
	common_act 		= true,
	normal 			= "翅膀_飞行_下落",
	saint_wing_normal_id = NPC_ACTION_TYPE.ACT_NPC_FLYDOWN1,
	saint_wing_fight_id	 = NPC_ACTION_TYPE.ACT_NPC_FLYDOWN1,
	replace_wing_action  = NPC_ACTION_TYPE.ACT_NPC_WING_STAND,
}
actions_player[PLAYER_ACTION_TYPE.ACT_FLYDOWN_WING_LOW] = "跳跃循环"
actions_player[PLAYER_ACTION_TYPE.ACT_LANDON] =
{
	normal 			= "跳跃结束",
}
actions_player[PLAYER_ACTION_TYPE.ACT_FLY_GLIDE2] = 
{
	common_act 		= true,
	normal 			= "飞行坐骑_滑翔",
	mount_normal_id = NPC_ACTION_TYPE.ACT_NPC_FLY_GLIDE2,
	mount_fight_id = NPC_ACTION_TYPE.ACT_NPC_FLY_GLIDE2,
}
actions_player[PLAYER_ACTION_TYPE.ACT_TAKEOFF2] = 
{
	common_act 		= true,
	normal 			= "飞行坐骑_起飞",
	mount_normal_id = NPC_ACTION_TYPE.ACT_NPC_TAKEOFF2,
	mount_fight_id = NPC_ACTION_TYPE.ACT_NPC_TAKEOFF2,
}
actions_player[PLAYER_ACTION_TYPE.ACT_HANGINAIR2] =
{
	common_act 		= true,
	normal 			= "飞行坐骑_悬停",
	mount_normal_id = NPC_ACTION_TYPE.ACT_NPC_HANGINAIR2,
	mount_fight_id = NPC_ACTION_TYPE.ACT_NPC_HANGINAIR2,
}
actions_player[PLAYER_ACTION_TYPE.ACT_FLY2] =
{
	common_act 		= true,
	normal 			= "飞行坐骑_移动",
	mount_normal_id = NPC_ACTION_TYPE.ACT_NPC_FLY2,
	mount_fight_id = NPC_ACTION_TYPE.ACT_NPC_FLY2,
}
actions_player[PLAYER_ACTION_TYPE.ACT_FLYDOWN_SWORD_HIGH] = "飞剑高空下降"
actions_player[PLAYER_ACTION_TYPE.ACT_FLYDOWN_SWORD_LOW] = "飞剑低空下降"
actions_player[PLAYER_ACTION_TYPE.ACT_LANDON_SWORD] = "飞剑落地"
actions_player[PLAYER_ACTION_TYPE.ACT_HANGINAIR3] =
{
	common_act 		= true,
	normal 			= "站立_悬停",
}
actions_player[PLAYER_ACTION_TYPE.ACT_FLY3] =
{
	common_act 		= true,
	normal 			= "站立_飞行",
}
actions_player[PLAYER_ACTION_TYPE.ACT_HANGINAIR4] =
{
	common_act 		= true,
	normal 			= "骑乘_悬停",
}
actions_player[PLAYER_ACTION_TYPE.ACT_FLY4] =
{
	common_act 		= true,
	normal 			= "骑乘_飞行",
}




--------------------------------
-- 生产技能动作,共11种
act_vocation = {}
act_vocation[ACTION_VOCATION_TYPE.ACT_VOCATION_TYPE_1]  = "采矿"
act_vocation[ACTION_VOCATION_TYPE.ACT_VOCATION_TYPE_2]  = "采摘"
act_vocation[ACTION_VOCATION_TYPE.ACT_VOCATION_TYPE_3]  = "钓鱼"
act_vocation[ACTION_VOCATION_TYPE.ACT_VOCATION_TYPE_4]  = "祈福"
act_vocation[ACTION_VOCATION_TYPE.ACT_VOCATION_TYPE_5]  = "开锁"
act_vocation[ACTION_VOCATION_TYPE.ACT_VOCATION_TYPE_6]  = "占星"
act_vocation[ACTION_VOCATION_TYPE.ACT_VOCATION_TYPE_7]  = "打坐"
act_vocation[ACTION_VOCATION_TYPE.ACT_VOCATION_TYPE_8]  = "跳跃开始"
act_vocation[ACTION_VOCATION_TYPE.ACT_VOCATION_TYPE_9]  = "战斗跳跃开始"
act_vocation[ACTION_VOCATION_TYPE.ACT_VOCATION_TYPE_10] = "死亡"
act_vocation[ACTION_VOCATION_TYPE.ACT_VOCATION_TYPE_11] = "回城"





----------------------------------------
-- NPC通用动作

--[[
{
	normal,			普通状态下动作
	player_act,		对应Player动作id
	wound_act,		是否为受伤动作
	stand_act,		是否接站立动作
}
]]--

actions_npc = {}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_STAND]=
{
	normal		= "站立",
	player_act 	= PLAYER_ACTION_TYPE.ACT_STAND,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_STAND1]=
{
	normal		= "站立1" ,
	player_act 	= PLAYER_ACTION_TYPE.ACT_STAND,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_STAND2]=
{
	normal		= "站立2",
	player_act 	= PLAYER_ACTION_TYPE.ACT_STAND,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_STAND3]=
{
	normal		= "站立3",
	player_act 	= PLAYER_ACTION_TYPE.ACT_STAND,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_STAND4]=
{
	normal		= "站立4",
	player_act 	= PLAYER_ACTION_TYPE.ACT_STAND,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_WALK]=
{
	normal		= "行走",
	player_act 	= PLAYER_ACTION_TYPE.ACT_WALK,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_RUN]=
{
	normal		= "奔跑",
	player_act 	= PLAYER_ACTION_TYPE.ACT_RUN,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_RUN_STOP]=
{
	normal		= "奔跑结束",
	stand_act 	= true,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_JUMP_START]=
{
	normal		= "跳跃开始",
	player_act 	= PLAYER_ACTION_TYPE.ACT_JUMP_START,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_JUMP_LOOP]=
{
	normal		= "跳跃循环",
	player_act 	= PLAYER_ACTION_TYPE.ACT_JUMP_LOOP,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_JUMP_END]=
{
	normal		= "跳跃结束" ,
	player_act 	= PLAYER_ACTION_TYPE.ACT_JUMP_LAND,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_FIGHT_STAND]=
{
	normal		= "战斗站立",
	player_act 	= PLAYER_ACTION_TYPE.ACT_FIGHT_STAND,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_FIGHT_MOVE_L]=
{
	normal		= "战斗左移",
	player_act 	= PLAYER_ACTION_TYPE.ACT_FIGHT_RUN_LEFT,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_FIGHT_MOVE_R]=
{
	normal		= "战斗右移",
	player_act 	= PLAYER_ACTION_TYPE.ACT_FIGHT_RUN_RIGHT,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_IDLE1]=
{
	normal		= "休闲1",
	player_act 	= PLAYER_ACTION_TYPE.ACT_CUSTOMIZE,
    stand_act   = true;
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_IDLE2]=
{
	normal		= "休闲2",
	player_act 	= PLAYER_ACTION_TYPE.ACT_CUSTOMIZE,
    stand_act   = true;
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_GREETING1]=
{
	normal		= "交谈1",
	stand_act 	= true,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_GREETING2]=
{
	normal		= "交谈2",
	stand_act 	= true,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_WOUNDED]=
{
	normal		= "受伤",
	player_act 	= PLAYER_ACTION_TYPE.ACT_WOUNDED,
	wound_act	= true,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_WOUNDED_U]=
{
	normal		= "受伤上",
	player_act 	= PLAYER_ACTION_TYPE.ACT_WOUNDED,
	wound_act	= true,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_WOUNDED_D]=
{
	normal		= "受伤下",
	player_act 	= PLAYER_ACTION_TYPE.ACT_WOUNDED,
	wound_act	= true,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_WOUNDED_L]=
{
	normal		= "受伤左",
	player_act 	= PLAYER_ACTION_TYPE.ACT_WOUNDED,
	wound_act	= true,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_WOUNDED_R]=
{
	normal		= "受伤右",
	player_act 	= PLAYER_ACTION_TYPE.ACT_WOUNDED,
	wound_act	= true,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_MOVE_WOUNDED_U]=
{
	normal		= "移动受伤上",
	player_act 	= PLAYER_ACTION_TYPE.ACT_WOUNDED,
	wound_act	= true,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_MOVE_WOUNDED_D]=
{
	normal		= "移动受伤下",
	player_act 	= PLAYER_ACTION_TYPE.ACT_WOUNDED,
	wound_act	= true,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_MOVE_WOUNDED_L]=
{
	normal		= "移动受伤左",
	player_act 	= PLAYER_ACTION_TYPE.ACT_WOUNDED,
	wound_act	= true,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_MOVE_WOUNDED_R]=
{
	normal		= "移动受伤右",
	player_act 	= PLAYER_ACTION_TYPE.ACT_WOUNDED,
	wound_act	= true,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_BORN]=
{
	normal		=  "出现",
	player_act 	= PLAYER_ACTION_TYPE.ACT_REVIVE,
    stand_act   = true;
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_DIE]=
{
	normal		= "死亡",
	player_act 	= PLAYER_ACTION_TYPE.ACT_GROUNDDIE,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_STATE_DIE]=
{
	normal		= "状态死亡",
	player_act 	= PLAYER_ACTION_TYPE.ACT_GROUNDDIE,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_DISAPPEAR]=
{
	normal		= "消失",
	player_act 	= PLAYER_ACTION_TYPE.ACT_GROUNDDIE_LOOP,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_FELL_START]=
{
	normal		= "被击倒开始",
	player_act 	= PLAYER_ACTION_TYPE.ACT_DOWN_START,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_FELL_LOOP]=
{
	normal		= "被击倒循环",
	player_act 	= PLAYER_ACTION_TYPE.ACT_DOWN_LOOP,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_FELL_END]=
{
	normal		= "被击倒结束",
	player_act 	= PLAYER_ACTION_TYPE.ACT_DOWN_END,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_FELL_WOUNDED]=
{
	normal		= "被击倒受伤",
	player_act 	= PLAYER_ACTION_TYPE.ACT_DOWN_WOUNDED,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_KNOCK_BACK]=
{
	normal		= "被击退",
	player_act 	= PLAYER_ACTION_TYPE.ACT_KNOCK_BACK,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_KNOCKED]=
{
	normal		= "被击飞",
	player_act 	= PLAYER_ACTION_TYPE.ACT_KNOCKED,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_KNOCKED_LOOP]=
{
	normal		= "被击飞循环",
	player_act 	= PLAYER_ACTION_TYPE.ACT_KNOCKED_LOOP,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_PULL_FRIENDLY]=
{
	normal		= "被友好拉拽",
	player_act 	= PLAYER_ACTION_TYPE.ACT_PULL_FRIENDLY,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_BE_HOOKED]=
{
	normal		= "被抱摔",
	player_act 	= PLAYER_ACTION_TYPE.ACT_BE_HOOKED,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_STUN]=
{
	normal		= "被击晕循环",
	player_act 	= PLAYER_ACTION_TYPE.ACT_STUN,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_FLOATING1]=
{
	normal		= "被击浮空1",
	player_act 	= PLAYER_ACTION_TYPE.ACT_DRIFTING,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_FLOATING2]=
{
	normal		= "被击浮空2",
	player_act 	= PLAYER_ACTION_TYPE.ACT_DRIFTING,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_FLOATING3]=
{
	normal		= "被击浮空3",
	player_act 	= PLAYER_ACTION_TYPE.ACT_DRIFTING,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_NORMAL_ATTACK]=
{
	normal		= "普通攻击",
	player_act 	= PLAYER_ACTION_TYPE.ACT_ATTACK_1,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_SKILL_ATTACK]=
{
	normal		= "技能攻击",
}

actions_npc[NPC_ACTION_TYPE.ACT_NPC_FLY_GLIDE1]=
{
	normal		= "翅膀_飞行_滑翔",
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_TAKEOFF1]=
{
	normal		= "翅膀_飞行_起飞",
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_HANGINAIR1]=
{
	normal		= "翅膀_飞行_悬停",
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_FLY1]=
{
	normal		= "翅膀_飞行_移动",
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_FLY_ABS_UP1]=
{
	normal		= "翅膀_飞行_上升",
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_FLY_ABS_DOWN1]=
{
	normal		= "翅膀_飞行_下落",
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_FLYDOWN1]=
{
	normal		= "翅膀_飞行_下落",
} 

actions_npc[NPC_ACTION_TYPE.ACT_NPC_FLY_GLIDE2]=
{
	normal		= "飞行坐骑_飞行_滑翔",
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_TAKEOFF2]=
{
	normal		= "飞行坐骑_飞行_起飞",
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_HANGINAIR2]=
{
	normal		= "飞行坐骑_飞行_悬停",
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_FLY2]=
{
	normal		= "飞行坐骑_飞行_移动",
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_FLYDOWN2]=
{
	normal		= "飞行坐骑_飞行_下落",
} 

actions_npc[NPC_ACTION_TYPE.ACT_NPC_EMOTE1]=
{
	normal		= "表情1",
	stand_act 	= true,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_EMOTE2]=
{
	normal		= "表情2",
	stand_act 	= true,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_EMOTE3]=
{
	normal		= "表情3",
	stand_act 	= true,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_EMOTE4]=
{
	normal		= "表情4",
	stand_act 	= true,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_EMOTE5]=
{
	normal		= "表情5",
	stand_act 	= true,
}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_EMOTE6]=
{
	normal		= "表情6",
	stand_act 	= true,
}

actions_npc[NPC_ACTION_TYPE.ACT_NPC_WING_STAND] = { normal = "翅膀_通用",}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_WING_FIGHT_STAND] = { normal = "翅膀_通用",}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_WING_WALK] = { normal = "翅膀_通用",}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_WING_RUN] = { normal = "翅膀_通用",}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_WING_JUMP] = { normal = "翅膀_二段跳跃开始",}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_WING_SPECIAL_JUMP] = { normal = "翅膀_特殊二段跳跃开始",}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_WING_RUN_LOOP] = { normal = "翅膀_通用",}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_WING_JUMP_LOOP] = { normal = "翅膀_二段跳跃循环",}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_WING_SPECIAL_JUMP_LOOP] = { normal = "翅膀_特殊二段跳跃循环",}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_WING_CLIMB_WALL] = { normal = "翅膀_通用",}
actions_npc[NPC_ACTION_TYPE.ACT_NPC_WING_CLIMB_EDGE] = { normal = "翅膀_通用",}

