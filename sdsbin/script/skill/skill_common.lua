ShortCutType = --快捷键类型，在职业快捷键默认配置中使用
{
    SKILL = 0,
    ITEM = 1,
    PSEUDO = 2,
}
PseudoSkillType =  --伪技能类型
{
    CMD = 1, --命令
    POSE = 2, --动作
    BASIC = 3, --基本，回程
    PRODUCE = 10, --生产技能
}

CmdSkillIds = 
{
    CMD_WALKRUN = 0,
    CMD_FINDTARGET = 1,
    CMD_ASSISTATTACK = 2,
    CMD_INVITETOTEAM = 3,
    CMD_LEAVETEAM = 4,  
    CMD_KICKTEAMMEM = 5,
    CMD_FINDTEAM = 6,
    CMD_STARTTRADE = 7,
    CMD_SELLBOOTH = 8,
    CMD_BUYBOOTH = 9,
    CMD_INVITETOFACTION = 10,
    CMD_FLY = 11,
    CMD_PICKUP = 12,
    CMD_GATHER = 13,
    CMD_RUSHFLY = 14,
    CMD_BINDBUDDY = 15,
    CMD_PET_NORMAL_ATTACK =16,
    CMD_MOUNT = 17,
    CMD_TALK_TO_NPC = 18,
    CMD_TELEPORT_TO_LEAGUEBASE = 19,
    CMD_REST = 20,
    CMD_HIDE_PLAYER = 21,
    CMD_HIDE_PET = 22,
    CMD_AFK = 23,
    CMD_AIRCRAFT = 24,
}

PoseSkillIds = 
{
    ROLEEXP_WAVE = 0,       --  招手
    ROLEEXP_NOD,            --  点头
    ROLEEXP_SHAKEHEAD,      --  摇头
    ROLEEXP_SHRUG,          --  耸肩膀
    ROLEEXP_LAUGH,          --  大笑

    ROLEEXP_ANGRY,          --  生气
    ROLEEXP_DEFIANCE,       --  挑衅
    ROLEEXP_VICTORY,        --  胜利
    ROLEEXP_FIGHT,          --  战斗
    ROLEEXP_SITDOWN,        --  坐下

    ROLEEXP_STUN,           --  晕倒
    ROLEEXP_DEPRESSED,      --  沮丧
    ROLEEXP_KISSHAND,       --  飞吻
    ROLEEXP_SHY,            --  害羞
    ROLEEXP_SALUTE,         --  抱拳

    ROLEEXP_DANCE,
    NUM_ROLEEXP,
    ROLEEXP_ASSAULT,        --  冲锋
    ROLEEXP_THINK,          --  思考
    ROLEEXP_GAPE,           --  伸懒腰
    ROLEEXP_ATTACK1,        --  攻击1
    ROLEEXP_ATTACK2,        --  攻击2
    ROLEEXP_ATTACK3,        --  攻击3
    ROLEEXP_ATTACK4,        --  攻击4
    ROLEEXP_DEFENCE,        --  防御
    ROLEEXP_FALL,           --  摔倒
    ROLEEXP_FALLONGROUND,   --  倒地
    ROLEEXP_LOOKAROUND,     --  张望
    ROLEEXP_DANCE2,         --  舞蹈
    ROLEEXP_KISS,           -- 亲吻
    ROLEEXP_TWO_KISS,       -- 双人亲吻
    ROLEEXP_FIREWORK,       -- 放烟花
}