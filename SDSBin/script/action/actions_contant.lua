----------------------------------------
-- 人物动作

local _PLAYER_ACTION_TYPE =
{
   	-- 移动站立
    "ACT_STAND",					-- 站立
    "ACT_FIGHT_STAND",				-- 战斗站立
    "ACT_WALK",						-- 行走
    "ACT_RUN",						-- 奔跑
    "ACT_FIGHT_RUN",				-- 战斗奔跑
    "ACT_SPECIAL_RUN",          	-- 特殊奔跑
    "ACT_SPECIAL_FIGHT_RUN",    	-- 特殊战斗奔跑
    "ACT_FIGHT_RUN_BACK",			-- 战斗后跑, for npc only
    "ACT_FIGHT_RUN_LEFT",			-- 战斗左跑, for npc only
    "ACT_FIGHT_RUN_RIGHT",			-- 战斗右跑, for npc only
    "ACT_RUN_STOP",
    "ACT_FIGHT_RUN_STOP",
    "ACT_SPECIAL_RUN_STOP",
    "ACT_SPECIAL_FIGHT_RUN_STOP",
    "ACT_CLIMB_WALL",
    "ACT_CLIMB_EDGE",
    "ACT_CLIMB_MOVE",

    -- 跳跃
    "ACT_JUMP_START",				-- 起跳
    "ACT_JUMP_LOOP",				-- 起跳空中循环
    "ACT_JUMP_LAND",				-- 跳跃落地
    "ACT_JUMP_SECOND_START",		-- 二段跳跃起
    "ACT_JUMP_SECOND_LOOP",		    -- 二段跳跃循环
    "ACT_JUMP_SECOND_LAND",		    -- 二段跳跃落地
    "ACT_HEAVY_JUMP_LAND",			-- 重重落在地面
    "ACT_JUMP_WALL",
    "ACT_JUMP_EDGE",

    -- 游泳
    "ACT_SWIM",						-- 游动
    "ACT_HANGINWATER",				-- 水中漂浮

   -- 祈祷
    "ACT_PRAY",							-- 祈祷
    "ACT_PRAY_LOOP",				-- 祈祷循环
    "ACT_PRAY_END",					-- 祈祷结束

    -- 挂机
    "ACT_HOLY",							-- 挂机
    "ACT_HOLY_LOOP",				-- 挂机循环
    "ACT_HOLY_END",					-- 挂机结束

    -- 打坐
    "ACT_SITDOWN",					-- 打坐
    "ACT_SITDOWN_LOOP",			-- 打坐循环
    "ACT_STANDUP",					-- 打坐站起
    
    -- 进食
    "ACT_EAT",							-- 进食
    "ACT_EAT_LOOP",					-- 进食循环
    "ACT_EAT_END",					-- 进食结束

    -- 受伤和死亡
    "ACT_WOUNDED",					-- 受伤
    "ACT_DOWN_WOUNDED",          	-- 被击倒受伤
    "ACT_GROUNDDIE",				-- 陆地死亡
    "ACT_GROUNDDIE_LOOP",			-- 死亡地面循环
    "ACT_WATERDIE",					-- 水中死亡
    "ACT_WATERDIE_LOOP",			-- 死亡水中循环
    "ACT_AIRDIE_ST",				-- 空中死亡
    "ACT_AIRDIE",					-- 空中死亡下落循环
    "ACT_AIRDIE_ED",				-- 空中死亡落地
    "ACT_AIRDIE_LAND_LOOP",			-- 死亡落地循环
    "ACT_REVIVE",					-- 复活

    -- 战斗效果
    "ACT_KNOCK_BACK",				-- 被击退
    "ACT_DOWN_START",				-- 被击倒起
    "ACT_DOWN_LOOP",				-- 被击倒循环
    "ACT_DOWN_END",					-- 被击倒结束
    "ACT_STUN",						-- 击晕
    "ACT_DRIFTING",			    	-- 被击浮空
    "ACT_KNOCKED",                	-- 被击飞
    "ACT_KNOCKED_LOOP",           	-- 被击飞循环
    "ACT_PULL_FRIENDLY",           	-- 被友好拉拽
    "ACT_BE_HOOKED",              	-- 被抱摔
    -- 普攻
    "ACT_ATTACK_1",					-- 普攻1
    "ACT_ATTACK_2",					-- 普攻2
    "ACT_ATTACK_3",					-- 普攻3
    "ACT_ATTACK_4",					-- 普攻4

    -- 采摘
    "ACT_PICKUP",					-- 采摘
    "ACT_PICKUP_LOOP",				-- 采摘植物循环
    "ACT_PICKUP_STANDUP",			-- 采摘站起
    "ACT_PICKUP_MATTER",			-- 捡东西
    "ACT_DIG",
    "ACT_DIGLOOP",
    -- 使用物品
    "ACT_USEITEM",					-- 通用的使用物品动作
    "ACT_USEITMELOOP",				-- 通用的使用物品循环动作
    -- 通用操作
    "ACT_GENERAL_OPRT",

    -- 宠物
    "ACT_PET_SUMMON",
    "ACT_PET_RECALL",
    "ACT_PET_COMBINE",

    -- 表情动作
    "ACT_EXP_WAVE",					-- 招手
    "ACT_EXP_NOD",					-- 点头
    "ACT_EXP_SHAKEHEAD",			-- 摇头
    "ACT_EXP_SHRUG",				-- 耸肩膀
    "ACT_EXP_LAUGH",				-- 大笑
    "ACT_EXP_ANGRY",				-- 生气
    "ACT_EXP_STUN",					-- 晕倒
    "ACT_EXP_DEPRESSED",			-- 沮丧
    "ACT_EXP_KISSHAND",				-- 飞吻
    "ACT_EXP_SHY",					-- 害羞
    "ACT_EXP_SALUTE",				-- 抱拳
    "ACT_EXP_SITDOWN",				-- 坐下
    "ACT_EXP_SITDOWN_LOOP",			-- 坐下循环
    "ACT_EXP_SITDOWN_STANDUP",		-- 坐下站起
    "ACT_EXP_ASSAULT",				-- 冲锋
    "ACT_EXP_THINK",				-- 思考
    "ACT_EXP_DEFIANCE",				-- 挑衅
    "ACT_EXP_VICTORY",				-- 胜利
    "ACT_EXP_KISS",					-- 亲吻
    "ACT_EXP_KISS_LOOP",			-- 亲吻循环
    "ACT_EXP_KISS_END",				-- 亲吻结束
    "ACT_EXP_FIGHT",				-- 战斗
    "ACT_EXP_ATTACK1",				-- 攻击1
    "ACT_EXP_ATTACK2",				-- 攻击2
    "ACT_EXP_ATTACK3",				-- 攻击3
    "ACT_EXP_ATTACK4",				-- 攻击4
    "ACT_EXP_DEFENCE",				-- 防御
    "ACT_EXP_FALL",					-- 摔倒
    "ACT_EXP_FALLONGROUND",			-- 倒地
    "ACT_EXP_LOOKAROUND",			-- 张望
    "ACT_EXP_DANCE",				-- 舞蹈
    "ACT_EXP_TOSS",					-- 放暗器
    "ACT_EXP_GAPE",					-- 伸懒腰
    "ACT_EXP_TWO_KISS",				-- 双人亲吻

	-- 其它
    "ACT_TRICK_RUN",				-- 跑动中的花招
    "ACT_TRICK_JUMP",				-- 跳跃中的花招
    "ACT_BLINK",					-- 眨眼
    "ACT_CUSTOMIZE",				-- 长休闲动作
    "ACT_QINGGONG_START",			-- 轻功起
    "ACT_QINGGONG_LOOP",			-- 轻功循环
    "ACT_FIGHT_QINGGONG_LOOP",		-- 战斗轻功循环
    "ACT_STAND_PLAYER_DEMO",
    "ACT_STAND_FOR_PORTRAIT",       -- 用于头像显示的站立动作

    -- 登录界面使用动作
    "ACT_LOGIN_SELECT_POSE",        -- 登录界面选中人物Pose
    "ACT_LOGIN_SIT",                -- 登陆界面动作 坐
    "ACT_LOGIN_RELY",               -- 登陆界面动作 靠
    "ACT_LOGIN_RUN",                -- 登陆界面动作 奔跑

    -- 飞行, to delete
    "ACT_FLY_GLIDE1",				-- 翅膀滑翔
    "ACT_TAKEOFF1",					-- 翅膀起飞 should be "ACT_TAKEOFF_WING
    "ACT_HANGINAIR1",				-- 翅膀悬停 should be "ACT_HANGINAIR_WING
    "ACT_FLY1",						-- 翅膀前进 should be "ACT_FLY_WING
    "ACT_FLY_ABS_UP1",						-- 翅膀垂直上下
    "ACT_FLY_ABS_DOWN1",						-- 翅膀垂直上下
    "ACT_FLYDOWN",					-- 翅膀高空下降 should be "ACT_FLYDOWN_WING_HIGH
    "ACT_FLYDOWN_WING_LOW",			-- 翅膀低空下降 should be "ACT_FLYDOWN_WING_LOW
    "ACT_LANDON",					-- 翅膀落地 should be "ACT_LAND_WING
    "ACT_FLY_GLIDE2",				-- 滑翔
    "ACT_TAKEOFF2",			-- 飞剑起飞
    "ACT_HANGINAIR2",				-- 飞剑悬停
    "ACT_FLY2",						-- 飞剑前进
    "ACT_FLYDOWN_SWORD_HIGH",		-- 飞剑高空下降
    "ACT_FLYDOWN_SWORD_LOW",		-- 飞剑低空下降
    "ACT_LANDON_SWORD", 			-- 飞剑落地
    "ACT_HANGINAIR3",
    "ACT_FLY3",
    "ACT_HANGINAIR4",
    "ACT_FLY4",
    
    -- 翅膀动作
    "ACT_WING_STAND",
    "ACT_WING_FIGHT_STAND",
    "ACT_WING_WALK",
    "ACT_WING_RUN",
    "ACT_WING_JUMP",
    "ACT_WING_SPECIAL_JUMP",
    "ACT_WING_RUN_LOOP",
    "ACT_WING_JUMP_LOOP",
    "ACT_WING_SPECIAL_JUMP_LOOP",
    "ACT_WING_CLIMB_WALL",
    "ACT_WING_CLIMB_EDGE",
    
}


PLAYER_ACTION_TYPE = {}
for k, v in ipairs(_PLAYER_ACTION_TYPE) do
    PLAYER_ACTION_TYPE[v] = k - 1
end




----------------------------------------
-- 生产技能动作
local _ACTION_VOCATION_TYPE =
{
    "ACT_VOCATION_TYPE_1",
    "ACT_VOCATION_TYPE_2",
    "ACT_VOCATION_TYPE_3",
    "ACT_VOCATION_TYPE_4",
    "ACT_VOCATION_TYPE_5",
    "ACT_VOCATION_TYPE_6",
    "ACT_VOCATION_TYPE_7",
    "ACT_VOCATION_TYPE_8",
    "ACT_VOCATION_TYPE_9",
    "ACT_VOCATION_TYPE_10",
    "ACT_VOCATION_TYPE_11",
}

ACTION_VOCATION_TYPE = {}
for k, v in ipairs(_ACTION_VOCATION_TYPE) do
    ACTION_VOCATION_TYPE[v] = k
end











----------------------------------------
-- NPC通用动作

local _NPC_ACTION_TYPE =
{
    "ACT_NPC_STAND",
    "ACT_NPC_STAND1",
    "ACT_NPC_STAND2",
    "ACT_NPC_STAND3",
    "ACT_NPC_STAND4",
    "ACT_NPC_WALK",
    "ACT_NPC_RUN",
    "ACT_NPC_RUN_STOP",
    "ACT_NPC_JUMP_START",
    "ACT_NPC_JUMP_LOOP",
    "ACT_NPC_JUMP_END",
    "ACT_NPC_FIGHT_STAND",
    "ACT_NPC_FIGHT_MOVE_L",
    "ACT_NPC_FIGHT_MOVE_R",
    "ACT_NPC_IDLE1",
    "ACT_NPC_IDLE2",
    "ACT_NPC_GREETING1",
    "ACT_NPC_GREETING2",
    "ACT_NPC_WOUNDED",
    "ACT_NPC_WOUNDED_U",
    "ACT_NPC_WOUNDED_D",
    "ACT_NPC_WOUNDED_L",
    "ACT_NPC_WOUNDED_R",
    "ACT_NPC_MOVE_WOUNDED_U",
    "ACT_NPC_MOVE_WOUNDED_D",
    "ACT_NPC_MOVE_WOUNDED_L",
    "ACT_NPC_MOVE_WOUNDED_R",
    "ACT_NPC_BORN",
    "ACT_NPC_DIE",
    "ACT_NPC_STATE_DIE",
    "ACT_NPC_DISAPPEAR",
    "ACT_NPC_FELL_START",
    "ACT_NPC_FELL_LOOP",
    "ACT_NPC_FELL_END",
    "ACT_NPC_FELL_WOUNDED",
    "ACT_NPC_KNOCK_BACK",
    "ACT_NPC_KNOCKED",
    "ACT_NPC_KNOCKED_LOOP",
    "ACT_NPC_PULL_FRIENDLY",
    "ACT_NPC_BE_HOOKED",
    "ACT_NPC_STUN",
    "ACT_NPC_FLOATING1",
    "ACT_NPC_FLOATING2",
    "ACT_NPC_FLOATING3",
    "ACT_NPC_NORMAL_ATTACK",
    "ACT_NPC_SKILL_ATTACK",
    "ACT_NPC_FLY_GLIDE1",
    "ACT_NPC_TAKEOFF1",
    "ACT_NPC_HANGINAIR1",
    "ACT_NPC_FLY1",
    "ACT_NPC_FLY_ABS_UP1",
    "ACT_NPC_FLY_ABS_DOWN1",
    "ACT_NPC_FLYDOWN1",
    "ACT_NPC_FLY_GLIDE2",
    "ACT_NPC_TAKEOFF2",
    "ACT_NPC_HANGINAIR2",
    "ACT_NPC_FLY2",
    "ACT_NPC_FLYDOWN2",
    "ACT_NPC_EMOTE1",
    "ACT_NPC_EMOTE2",
    "ACT_NPC_EMOTE3",
    "ACT_NPC_EMOTE4",
    "ACT_NPC_EMOTE5",
    "ACT_NPC_EMOTE6",
    --npc翅膀动作
    "ACT_NPC_WING_STAND",
    "ACT_NPC_WING_FIGHT_STAND",
    "ACT_NPC_WING_WALK",
    "ACT_NPC_WING_RUN",
    "ACT_NPC_WING_JUMP",
    "ACT_NPC_WING_SPECIAL_JUMP",
    "ACT_NPC_WING_RUN_LOOP",
    "ACT_NPC_WING_JUMP_LOOP",
    "ACT_NPC_WING_SPECIAL_JUMP_LOOP",
    "ACT_NPC_WING_CLIMB_WALL",
    "ACT_NPC_WING_CLIMB_EDGE",
}

NPC_ACTION_TYPE = {}
for k, v in ipairs(_NPC_ACTION_TYPE) do
    NPC_ACTION_TYPE[v] = k - 1
end


