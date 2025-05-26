--[[ @i18n skill ]]
local _t = require("i18n").context("skill")

skill_type = --技能类型
{
    TYPE_ATTACK             = 1, -- 主动攻击
    TYPE_BLESS              = 2, -- 主动祝福
    TYPE_CURSE              = 3, -- 主动诅咒
    TYPE_PASSIVE            = 4, -- 被动技能
    TYPE_ASSIST             = 5, -- 辅助技能
    TYPE_SYNTHESIS          = 6, -- 合成技能
}

skill_attack_range = --技能攻击范围类型
{
    RANGE_TARGET_POINT          = 0, -- 选中对象 点
    RANGE_TARGET_LINE           = 1, -- 选中对象 线
    RANGE_TARGET_SELFBALL       = 2, -- 选中对象 自身为中心的球
    RANGE_TARGET_BALL           = 3, -- 选中对象 目标为中心的球
    RANGE_TARGET_SECTOR         = 4, -- 选中对象 自身为中心的扇形

    RANGE_POINT                 = 5, -- 不选中对象 点
    RANGE_LINE                  = 6, -- 不选中对象 线
    RANGE_SECTOR                = 7, -- 不选中对象 自身为中心的扇形
    RANGE_SELFBALL              = 8, -- 不选中对象 自身为中心的球
    RANGE_AREA                  = 9, -- 选中区域，圆形圆心
    RANGE_MASTER                = 10,-- 宠物主人
    RANGE_TARGET_CUR_LINE       = 11,-- 选中对象 线 （取目标当前点 怪用）
    RANGE_TARGET_CUR_BALL       = 12,-- 选中对象 目标为中心的球 （取目标当前点 怪用）
    RANGE_TARGET_CUR_SECTOR     = 13,-- 选中对象 自身为中心的扇形 （取目标当前点 怪用）
}

skill_desc = --在这里定义了
{
    --上下文枚举
    CONTEXT =
    {
        SKILL_NORMAL        = 0,    --技能面板的悬浮描述，同时作为默认
        QUICK_BAR           = 1,    --快捷栏悬浮描述
        SKILL_LEVEL_UP      = 2,    --技能面板(打开升级子面板后的)悬浮提示
    },

    --一些特定掩码
    MASK =
    {
        HINT_SKILL_ACTIVE = 0x0800, --技能描述中使用未激活来代替未学习
    },

    Font =
    {
    skillName = "^O013",
    skillLevel = "^O013",
    skillCooltime = "^O001",
    skillExecutetime = "^O001",
    skillAttackrange = "^O001",
    skillAttacktype = "^O001",
    skillMana = "^O001",
    skillFuncdesc = "^O001",
    skillUsedesc = "^O001",
    soulTag = "^O001",
    soulActivNameFont = "^O001",
    soulUnActivNameFont = "^O001",
    soulActivDescFont = "^O001",
    soulUnActivDescFont = "^O001",
    },

    Color =
    {
        skillName = "^FFFFFF",
        skillLevel = "^FFFFFF",
        skillCooltime = "^FFFFFF",
        skillExecutetime = "^FFFFFF",
        skillAttackrange = "^FFFFFF",
        skillAttacktype = "^FFFFFF",
        skillMana ="^E4FF97",
        skillFuncdesc= "^A2FFFF",
        skillUsedesc = "^FFFF00",
        soulActiveName = "^00FFFF",
        soulUnActiveName = "^336666",
        soulActiveDesc = "^FCFEC7",
        soulUnActiveDesc = "^616b76",
        soulTag = "^00FFFF",
    },
}

skill_desc.strName = skill_desc.Font.skillName..skill_desc.Color.skillName.."%s"
skill_desc.strLevel = skill_desc.Font.skillLevel..skill_desc.Color.skillLevel.._t"等级 %d"
skill_desc.strUnlearnLevel = skill_desc.Font.skillLevel..skill_desc.Color.skillLevel.._t"未学会"
skill_desc.strUnActiveLevel = skill_desc.Font.skillLevel..skill_desc.Color.skillLevel.._t"未激活"
skill_desc.strNextName = skill_desc.Font.skillLevel..skill_desc.Color.skillLevel.._t"下一等级"
skill_desc.strNextLevel = skill_desc.Font.skillLevel..skill_desc.Color.skillLevel.._t"下一等级 %d"
skill_desc.strLevelInComp = skill_desc.Font.skillLevel..skill_desc.Color.skillLevel.._t"当前等级 %d"

skill_desc.strCoolTime =
    skill_desc.Font.skillCooltime..skill_desc.Color.skillCooltime.._t"冷却时间 %d秒"

skill_desc.strUnCoolTime = skill_desc.Font.skillCooltime
    ..skill_desc.Color.skillCooltime.._t"无冷却"

skill_desc.strExecuteTime  = skill_desc.Font.skillExecutetime
    ..skill_desc.Color.skillExecutetime.._t"技能时间 %g秒"
skill_desc.strInstantExecute = skill_desc.Font.skillExecutetime
    ..skill_desc.Color.skillExecutetime.._t"瞬发"
skill_desc.strHoldExecute = skill_desc.Font.skillExecutetime
    ..skill_desc.Color.skillExecutetime.._t"持续施法"
skill_desc.strAttackrange = skill_desc.Font.skillAttackrange
    ..skill_desc.Color.skillAttackrange.._t"释放距离 %d米"
skill_desc.strAttackrangeSelf = skill_desc.Font.skillAttackrange
    ..skill_desc.Color.skillAttackrange.._t"释放目标:自身"

skill_desc.soulTag = skill_desc.Font.soulTag..skill_desc.Color.soulTag.._t"斗魂影响"

skill_desc.specStr={}
skill_desc.specStr[922]=_t"，此技能伤害提升20%"
skill_desc.specStr[931]=_t"\r使得^c0c0ff[流星爆裂拳]^FFFF00在目标血量少于50%时，伤害提高50%并附带星光惩戒效果"
skill_desc.specStr[1831]=_t"\r释放^c0c0ff[白鸟之舞]^FFFF00时回复自己攻击力1.7倍的生命"
skill_desc.specStr[1838]=_t",释放时消耗的冻气减少30点"
skill_desc.specStr[1839]=_t",暴击率增加5%"
skill_desc.specStr[939]=_t"\r^c0c0ff[龙魂裂破]^FFFF00的持续时间增加2秒，伤害提升30%"
skill_desc.specStr[943]=_t"持续时间减少2秒，"
skill_desc.specStr[949]=_t"\r在自己可恢复的血量少于30%时，溢出的回复血量将全部转给目标"
skill_desc.specStr[1923]=_t"\r同时在有神威领域值时，每次释放技能的第3段攻击都可使目标沉默3秒"
skill_desc.specStr[1920]=_t"当目标的血量低于50%时，"
skill_desc.specStr[1939]=_t"目标的烈焰焚烧效果达到3层时，"

