--[[ @i18n help ]]
local _t = require("i18n").context("help")
---界面指引的数据处理脚本
--提示数据
module("help_data", package.seeall)
--[[
-- 频率
[freq] FREQUENCY_FIRST:第一次; FREQUENCY_LEVUP:升级; FREQUENCY_LOGIN:登录或者换角色; FREQUENCY_TIME:时间频率interval 
[interval] 只在freq为FREQUENCY_TIME时生效, 单位为秒

-- 触发条件
[event] 接收到事件, 事件列表见constant.lua中以LEVT_开口变量 PS.freq为FREQUENCY_FIRST时,条件都是通过事件限制
[event_param] 事件参数, 见constant.lua中以LEVT_开口变量介绍
[levs] 等级, {开始等级, 结束等级}, 为闭区间
[hint_limit] 当前提示列表数量限制,超过这个限制不显示, 建议freq == FREQUENCY_TIME, 其它频率的可能会丢失提示
[achi_id] 完成成就id
[no_achi_id] 未完成成就id
[finish_task_id] 完成任务id
[no_finish_task_id] 未完成任务id
[active_task_id] 接取任务id
[no_active_task_id] 没接取任务id
[can_deliver_task_id] 是否可以接取任务id
[team_platform_type] 组队平台类型, team_platform.CATEGORY_DUNGEON 或 team_platform.CATEGORY_ACTIVITY
[team_platform_id] 组队平台配置id，和上面的类型一起用
[activity_bonus_on] 活动补偿是否开启, true/false
[daily_id] 日程表活动id,
[daily_type] 日程表类型:{HELP_ACTIVITY_WEEKS, HELP_ACTIVITY_BOSS},值为{4,5}
[can_manual_lev_up] 判断是否可以升级, true/false
[can_skill_lev_up] 判断技能是否升级, ture/false
[exp_reach_lev_up_rate] 判断经验是否达到可升级状态
[cosmos_star_can_active] 当前是否有星命点可以激活, true/false
[time_range]
     [date] 日期{开始日期, 结束日期}, 为闭区间, 例如{20121007, 20121018} (year[>=1900], month[1,12], day[1,31])
     [time] 时间{开始时间, 结束时间}, 为闭区间, 例如{1201, 1302} (hour[0,23],min[0,59])
     [week] 星期列表{星期日, 星期二, 星期四, 星期六}, 例如{1, 3, 5, 7}, sunday为1

-- 显示
[hint] 按钮悬浮提示
[trig_task] 触发任务id, 必须为手动触发任务
[image] 按钮图片
     [up] 普通状态
     [down] 按下状态
     [onhover] 悬浮状态
     [gfx] 按钮上特效
[show_list] 提示界面显示内容
     [text] 描述
     [npc] 寻径npc的id, 位置在TemplPos.lua中配置
     [jump] jump为数字时是快捷键的定义, 见constant.lua下边LKEY_开头变量,jump为字符串时时界面名称,jump为函数时,会执行指定函数
     [help] 百科帮助信息id, 没有jump的时候, 显示百科指引信息
     [learn] 提示按钮文字, 默认为"了解更多"
]]--
_M[265] = 
{
    freq = FREQUENCY_LEVUP,
    interval = 600,
    levs = { 20,20 },
    can_deliver_task_id = 1437,
    hint = _t"您的等级达到20级，可以参加每日签到活动啦！",
    image =
     {
    up = "common\\ButtonImage\\Daily_U.tga",down = "common\\ButtonImage\\Daily_D.tga",onhover = "common\\ButtonImage\\Daily_H.tga",
    },
    show_list =
     {
    {jump = 18,learn = _t"日程表",text = _t"等级达到20级后，每日可以参加签到活动，签到后可以获得丰厚的奖励！每日只能进行一次签到。",},
    },
}
_M[266] = 
{
    freq = FREQUENCY_LEVUP,
    interval = 600,
    level_value = { 35, 38, 42, 45, 48, 52, 55, 58, 62, 65, 68, 72, 75, 78, 82, 85, 88, 92, 95, 98,},
    hint = _t"恭喜你升级了，升级后建议你达到的战力值也会提高。",
    image =
     {
    up = "common\\ButtonImage\\Daily_U.tga",down = "common\\ButtonImage\\Daily_D.tga",onhover = "common\\ButtonImage\\Daily_H.tga",
    },
    show_list =
     {
    {jump = 57,learn = _t"战力体检",text = _t"想知道怎么最有效率的提升战力么？",},
    },
}
_M[275] = 
{
    freq = FREQUENCY_LOGIN,
    levs = { 20,100 },
    can_deliver_task_id = 5429,
    hint = _t"今天还没有签到？",
    image =
     {
    up = "common\\ButtonImage\\Daily_U.tga",down = "common\\ButtonImage\\Daily_D.tga",onhover = "common\\ButtonImage\\Daily_H.tga",
    },
    show_list =
     {
    {jump = 18,learn = _t"日程表",text = _t"您今天还没有签到？现在要去签到吗？",},
    },
}
_M[10] = 
{
    freq = FREQUENCY_TIME,
    interval = 300,
    levs = { 11,58 },
    can_manual_lev_up = true,
    hint = _t"您现在可以手动操作进行升级啦！",
    image =
     {
    up = "common\\ButtonImage\\LevelUp_U.tga",down = "common\\ButtonImage\\LevelUp_D.tga",onhover = "common\\ButtonImage\\LevelUp_H.tga",
    },
    show_list =
     {
    {jump = 1,learn = _t"现在升级",text = _t"玩家从11级开始，需要手动提升角色等级，现在升级吗？",},
    },
}
_M[11] = 
{
    freq = FREQUENCY_TIME,
    interval = 600,
    levs = { 5,10 },
    can_skill_lev_up = true,
    hint = _t"您现在可以手动操作提升技能等级啦！",
    image =
     {
    up = "common\\ButtonImage\\Skill_U.tga",down = "common\\ButtonImage\\Skill_D.tga",onhover = "common\\ButtonImage\\Skill_H.tga",
    },
    show_list =
     {
    {jump = 6,learn = _t"现在升级",text = _t"您现在有技能可以升级！",},
    },
}
_M[44] = 
{
    freq = FREQUENCY_LOGIN,
    levs = { 59,59 },
    can_manual_lev_up = true,
    hint = _t"您现在可以手动操作进行升级啦！",
    image =
     {
    up = "common\\ButtonImage\\LevelUp_U.tga",down = "common\\ButtonImage\\LevelUp_D.tga",onhover = "common\\ButtonImage\\LevelUp_H.tga",
    },
    show_list =
     {
    {jump = 1,learn = _t"现在升级",text = _t"玩家从11级开始，需要手动提升角色等级，现在升级吗？",},
    },
}
_M[45] = 
{
    freq = FREQUENCY_TIME,
    interval = 3600,
    levs = { 60,78 },
    can_manual_lev_up = true,
    hint = _t"您现在可以手动操作进行升级啦！",
    image =
     {
    up = "common\\ButtonImage\\LevelUp_U.tga",down = "common\\ButtonImage\\LevelUp_D.tga",onhover = "common\\ButtonImage\\LevelUp_H.tga",
    },
    show_list =
     {
    {jump = 1,learn = _t"现在升级",text = _t"玩家从11级开始，需要手动提升角色等级，现在升级吗？",},
    },
}
_M[46] = 
{
    freq = FREQUENCY_LOGIN,
    levs = { 79,79 },
    can_manual_lev_up = true,
    hint = _t"您现在可以手动操作进行升级啦！",
    image =
     {
    up = "common\\ButtonImage\\LevelUp_U.tga",down = "common\\ButtonImage\\LevelUp_D.tga",onhover = "common\\ButtonImage\\LevelUp_H.tga",
    },
    show_list =
     {
    {jump = 1,learn = _t"现在升级",text = _t"玩家从11级开始，需要手动提升角色等级，现在升级吗？",},
    },
}
_M[47] = 
{
    freq = FREQUENCY_TIME,
    interval = 3600,
    levs = { 80,100 },
    can_manual_lev_up = true,
    hint = _t"您现在可以手动操作进行升级啦！",
    image =
     {
    up = "common\\ButtonImage\\LevelUp_U.tga",down = "common\\ButtonImage\\LevelUp_D.tga",onhover = "common\\ButtonImage\\LevelUp_H.tga",
    },
    show_list =
     {
    {jump = 1,learn = _t"现在升级",text = _t"玩家从11级开始，需要手动提升角色等级，现在升级吗？",},
    },
}
_M[68] = 
{
    freq = FREQUENCY_TIME,
    interval = 1200,
    levs = { 11,20 },
    can_skill_lev_up = true,
    hint = _t"您现在可以手动操作提升技能等级啦！",
    image =
     {
    up = "common\\ButtonImage\\Skill_U.tga",down = "common\\ButtonImage\\Skill_D.tga",onhover = "common\\ButtonImage\\Skill_H.tga",
    },
    show_list =
     {
    {jump = 6,learn = _t"现在升级",text = _t"您现在有技能可以升级！",},
    },
}
_M[69] = 
{
    freq = FREQUENCY_TIME,
    interval = 3600,
    levs = { 21,50 },
    can_skill_lev_up = true,
    hint = _t"您现在可以手动操作提升技能等级啦！",
    image =
     {
    up = "common\\ButtonImage\\Skill_U.tga",down = "common\\ButtonImage\\Skill_D.tga",onhover = "common\\ButtonImage\\Skill_H.tga",
    },
    show_list =
     {
    {jump = 6,learn = _t"现在升级",text = _t"您现在有技能可以升级！",},
    },
}
_M[87] = 
{
    freq = FREQUENCY_LOGIN,
    levs = { 19,100 },
    exp_reach_lev_up_rate = true,
    hint = _t"请提升觉悟值！",
    image =
     {
    up = "common\\ButtonImage\\Skill_U.tga",down = "common\\ButtonImage\\Skill_D.tga",onhover = "common\\ButtonImage\\Skill_H.tga",
    },
    show_list =
     {
    {jump = 6,learn = _t"升级技能",text = _t"您的经验已经达到升级要求，但由于觉悟值不足，无法进行升级操作！请先升级技能达到觉悟值要求。",},
    },
}
_M[88] = 
{
    freq = FREQUENCY_LOGIN,
    levs = { 25,59 },
    team_platform_type = team_platform.CATEGORY_DUNGEON,
    team_platform_id = 14689,
    activity_bonus_on = true,
    daily_id = 8,
    hint = _t"今天您参加 %s活动 可以获得%d%%的奖励哦！",
    image =
     {
    up = "common\\ButtonImage\\Skill_U.tga",down = "common\\ButtonImage\\Skill_D.tga",onhover = "common\\ButtonImage\\Skill_H.tga",
    },
    show_list =
     {
    {jump = 18,learn = _t"日程表",text = _t"今天您参加 %s 活动可以额外获得%d%%的奖励哦！",},
    },
}
_M[89] = 
{
    freq = FREQUENCY_TIME,
    interval = 3600,
    levs = { 25,59 },
    team_platform_type = team_platform.CATEGORY_DUNGEON,
    team_platform_id = 14689,
    activity_bonus_on = true,
    daily_id = 8,
    hint = _t"今天你参加%s活动可以获得%d%%的奖励哦！",
    image =
     {
    up = "common\\ButtonImage\\Skill_U.tga",down = "common\\ButtonImage\\Skill_D.tga",onhover = "common\\ButtonImage\\Skill_H.tga",
    },
    show_list =
     {
    {jump = 18,learn = _t"日程表",text = _t"今天你参加%s活动可以获得%d%%的奖励哦！",},
    },
}
_M[90] = 
{
    freq = FREQUENCY_LOGIN,
    levs = { 20,59 },
    team_platform_type = team_platform.CATEGORY_DUNGEON,
    team_platform_id = 10324,
    activity_bonus_on = true,
    daily_id = 2,
    hint = _t"今天您参加 %s活动 可以获得%d%%的奖励哦！",
    image =
     {
    up = "common\\ButtonImage\\Skill_U.tga",down = "common\\ButtonImage\\Skill_D.tga",onhover = "common\\ButtonImage\\Skill_H.tga",
    },
    show_list =
     {
    {jump = 18,learn = _t"日程表",text = _t"今天您参加 %s 活动可以额外获得%d%%的奖励哦！",},
    },
}
_M[91] = 
{
    freq = FREQUENCY_TIME,
    interval = 3600,
    levs = { 20,59 },
    team_platform_type = team_platform.CATEGORY_DUNGEON,
    team_platform_id = 10324,
    activity_bonus_on = true,
    daily_id = 2,
    hint = _t"今天你参加%s活动可以获得%d%%的奖励哦！",
    image =
     {
    up = "common\\ButtonImage\\Skill_U.tga",down = "common\\ButtonImage\\Skill_D.tga",onhover = "common\\ButtonImage\\Skill_H.tga",
    },
    show_list =
     {
    {jump = 18,learn = _t"日程表",text = _t"今天你参加%s活动可以获得%d%%的奖励哦！",},
    },
}
_M[92] = 
{
    freq = FREQUENCY_LOGIN,
    levs = { 60,89 },
    team_platform_type = team_platform.CATEGORY_DUNGEON,
    team_platform_id = 23436,
    activity_bonus_on = true,
    daily_id = 9,
    hint = _t"今天您参加 %s活动 可以获得%d%%的奖励哦！",
    image =
     {
    up = "common\\ButtonImage\\Skill_U.tga",down = "common\\ButtonImage\\Skill_D.tga",onhover = "common\\ButtonImage\\Skill_H.tga",
    },
    show_list =
     {
    {jump = 18,learn = _t"日程表",text = _t"今天您参加 %s 活动可以额外获得%d%%的奖励哦！",},
    },
}
_M[93] = 
{
    freq = FREQUENCY_TIME,
    interval = 3600,
    levs = { 60,89 },
    team_platform_type = team_platform.CATEGORY_DUNGEON,
    team_platform_id = 23436,
    activity_bonus_on = true,
    daily_id = 9,
    hint = _t"今天你参加%s活动可以获得%d%%的奖励哦！",
    image =
     {
    up = "common\\ButtonImage\\Skill_U.tga",down = "common\\ButtonImage\\Skill_D.tga",onhover = "common\\ButtonImage\\Skill_H.tga",
    },
    show_list =
     {
    {jump = 18,learn = _t"日程表",text = _t"今天你参加%s活动可以获得%d%%的奖励哦！",},
    },
}
_M[94] = 
{
    freq = FREQUENCY_LOGIN,
    levs = { 60,89 },
    team_platform_type = team_platform.CATEGORY_DUNGEON,
    team_platform_id = 18219,
    activity_bonus_on = true,
    daily_id = 3,
    hint = _t"今天您参加 %s活动 可以获得%d%%的奖励哦！",
    image =
     {
    up = "common\\ButtonImage\\Skill_U.tga",down = "common\\ButtonImage\\Skill_D.tga",onhover = "common\\ButtonImage\\Skill_H.tga",
    },
    show_list =
     {
    {jump = 18,learn = _t"日程表",text = _t"今天您参加 %s 活动可以额外获得%d%%的奖励哦！",},
    },
}
_M[95] = 
{
    freq = FREQUENCY_TIME,
    interval = 3600,
    levs = { 60,89 },
    team_platform_type = team_platform.CATEGORY_DUNGEON,
    team_platform_id = 18219,
    activity_bonus_on = true,
    daily_id = 3,
    hint = _t"今天你参加%s活动可以获得%d%%的奖励哦！",
    image =
     {
    up = "common\\ButtonImage\\Skill_U.tga",down = "common\\ButtonImage\\Skill_D.tga",onhover = "common\\ButtonImage\\Skill_H.tga",
    },
    show_list =
     {
    {jump = 18,learn = _t"日程表",text = _t"今天你参加%s活动可以获得%d%%的奖励哦！",},
    },
}
_M[96] = 
{
    freq = FREQUENCY_LOGIN,
    levs = { 90,120 },
    team_platform_type = team_platform.CATEGORY_DUNGEON,
    team_platform_id = 32471,
    activity_bonus_on = true,
    daily_id = 152,
    hint = _t"今天您参加 %s活动 可以获得%d%%的奖励哦！",
    image =
     {
    up = "common\\ButtonImage\\Skill_U.tga",down = "common\\ButtonImage\\Skill_D.tga",onhover = "common\\ButtonImage\\Skill_H.tga",
    },
    show_list =
     {
    {jump = 18,learn = _t"日程表",text = _t"今天您参加 %s 活动可以额外获得%d%%的奖励哦！",},
    },
}
_M[97] = 
{
    freq = FREQUENCY_TIME,
    interval = 3600,
    levs = { 90,120 },
    team_platform_type = team_platform.CATEGORY_DUNGEON,
    team_platform_id = 32471,
    activity_bonus_on = true,
    daily_id = 152,
    hint = _t"今天你参加%s活动可以获得%d%%的奖励哦！",
    image =
     {
    up = "common\\ButtonImage\\Skill_U.tga",down = "common\\ButtonImage\\Skill_D.tga",onhover = "common\\ButtonImage\\Skill_H.tga",
    },
    show_list =
     {
    {jump = 18,learn = _t"日程表",text = _t"今天你参加%s活动可以获得%d%%的奖励哦！",},
    },
}
_M[98] = 
{
    freq = FREQUENCY_LOGIN,
    levs = { 90,120 },
    team_platform_type = team_platform.CATEGORY_DUNGEON,
    team_platform_id = 32048,
    activity_bonus_on = true,
    daily_id = 176,
    hint = _t"今天您参加 %s活动 可以获得%d%%的奖励哦！",
    image =
     {
    up = "common\\ButtonImage\\Skill_U.tga",down = "common\\ButtonImage\\Skill_D.tga",onhover = "common\\ButtonImage\\Skill_H.tga",
    },
    show_list =
     {
    {jump = 18,learn = _t"日程表",text = _t"今天您参加 %s 活动可以额外获得%d%%的奖励哦！",},
    },
}
_M[99] = 
{
    freq = FREQUENCY_TIME,
    interval = 3600,
    levs = { 90,120 },
    team_platform_type = team_platform.CATEGORY_DUNGEON,
    team_platform_id = 32048,
    activity_bonus_on = true,
    daily_id = 176,
    hint = _t"今天你参加%s活动可以获得%d%%的奖励哦！",
    image =
     {
    up = "common\\ButtonImage\\Skill_U.tga",down = "common\\ButtonImage\\Skill_D.tga",onhover = "common\\ButtonImage\\Skill_H.tga",
    },
    show_list =
     {
    {jump = 18,learn = _t"日程表",text = _t"今天你参加%s活动可以获得%d%%的奖励哦！",},
    },
}
_M[100] = 
{
    freq = FREQUENCY_LOGIN,
    levs = { 11,30 },
    can_manual_lev_up = true,
    finish_task_id = 12823,
    hint = _t"您可以在星币商城中购买10级前程狂送礼包，祝您快速升级！",
    image =
     {
    up = "common\\ButtonImage\\Gshop_U.tga",down = "common\\ButtonImage\\Gshop_D.tga",onhover = "common\\ButtonImage\\Gshop_H.tga",gfx = "gfx\\界面\\激活原著技能.gfx",
    },
    show_list =
     {
    {jump = 88,learn = _t"进入商城",text = _t"在星币商城的热卖标签中购买10级前程狂送礼包，仅需1元！可以大大提高您的升级速度。去购买吗？",},
    },
}
_M[101] = 
{
    freq = FREQUENCY_LOGIN,
    levs = { 59,59 },
    can_manual_lev_up = true,
    finish_task_id = 12824,
    hint = _t"您可以在星币商城中购买59级前程狂送礼包，祝您快速升级！",
    image =
     {
    up = "common\\ButtonImage\\Gshop_U.tga",down = "common\\ButtonImage\\Gshop_D.tga",onhover = "common\\ButtonImage\\Gshop_H.tga",gfx = "gfx\\界面\\激活原著技能.gfx",
    },
    show_list =
     {
    {jump = 89,learn = _t"进入商城",text = _t"在在星币商城的热卖标签中购买59级前程狂送礼包，可以大大提高您的升级速度。去购买吗？",},
    },
}
_M[102] = 
{
    freq = FREQUENCY_LOGIN,
    levs = { 79,79 },
    can_manual_lev_up = true,
    finish_task_id = 12825,
    hint = _t"您可以在星币商城中购买79级前程狂送礼包，祝您快速升级！",
    image =
     {
    up = "common\\ButtonImage\\Gshop_U.tga",down = "common\\ButtonImage\\Gshop_D.tga",onhover = "common\\ButtonImage\\Gshop_H.tga",gfx = "gfx\\界面\\激活原著技能.gfx",
    },
    show_list =
     {
    {jump = 89,learn = _t"进入商城",text = _t"在星币商城的热卖标签中购买79级前程狂送礼包，可以大大提高您的升级速度。去购买吗？",},
    },
}
---------------- 活动指引 -----------------------
_M[500] = 
{
    freq = FREQUENCY_LEVUP,
    interval = 5,
    levs = { 12,12 },
    daily_id = 10,--女神圣斗士
}

_M[501] = 
{
    freq = FREQUENCY_LEVUP,
    interval = 5,
    levs = { 12,12 },
    daily_id = 46,--超级跑跑
}

_M[502] = 
{
    freq = FREQUENCY_LEVUP,
    interval = 5,
    levs = { 15,15 },
    daily_id = 25,--圣战回忆
}

_M[503] = 
{
    freq = FREQUENCY_TIME,
    interval = 5,
    levs = { 20,20 },
    daily_id = 2,--十二宫危机
}
_M[504] = 
{
    freq = FREQUENCY_LEVUP,
    interval = 5,
    levs = { 20,20 },
    daily_id = 12,--命运试炼
}

_M[505] = 
{
    freq = FREQUENCY_LEVUP,
    interval = 5,
    levs = { 25,25 },
    daily_id = 4,--女神近卫军
}
_M[506] = 
{
    freq = FREQUENCY_LEVUP,
    interval = 5,
    levs = { 25,25 },
    daily_id = 8,--风暴！亚特兰蒂斯
}

_M[507] = 
{
    freq = FREQUENCY_LEVUP,
    interval = 5,
    levs = { 30,30 },
    daily_id = 6,--黄金试炼
}
_M[508] = 
{
    freq = FREQUENCY_LEVUP,
    interval = 5,
    levs = { 31,31 },
    daily_id = 17,--星辰史诗
    daily_type = 4, 
}

_M[509] = 
{
    freq = FREQUENCY_LEVUP,
    interval = 5,
    levs = { 36,36 },
    daily_id = 44,--诛杀邪恶
    daily_type = 4,--问题
}
_M[510] = 
{
    freq = FREQUENCY_LEVUP,
    interval = 5,
    levs = { 40,40 },
    daily_id = 14,--圣斗士之路
}

_M[511] = 
{
    freq = FREQUENCY_LEVUP,
    interval = 5,
    levs = { 40,40 },
    daily_id = 43,--阿提卡战场
}
_M[512] = 
{
    freq = FREQUENCY_LEVUP,
    interval = 5,
    levs = { 45,45 },
    daily_id = 31,--射手逃亡
}

_M[513] = 
{
    freq = FREQUENCY_LEVUP,
    interval = 5,
    levs = { 55,55 },
    daily_id = 34,--黄金十二宫
}

_M[514] = 
{
    freq = FREQUENCY_LEVUP,
    interval = 5,
    levs = { 35,35 },
    daily_id = 28, --十风穴
    --daily_type = 4,    
}

_M[515] = 
{
    freq = FREQUENCY_LEVUP,
    interval = 5,
    levs = { 41,41 },
    daily_id = 43,--阿提卡之战
    --daily_type = 4,    
}

_M[516] = 
{
    freq = FREQUENCY_LEVUP,
    interval = 5,
    levs = { 32,32 },
    daily_id = 49,--那智
    daily_type = 5,--问题
}

_M[517] = 
{
    freq = FREQUENCY_LEVUP,
    interval = 5,
    levs = { 50,50 },
    daily_id = 23,--幻境宝箱
}

_M[518] = 
{
    freq = FREQUENCY_LEVUP,
    interval = 5,
    levs = { 12,12 },
    daily_id = 89,--雪人抢亲
}
---------------- 调查问卷 -----------------------
--[[_M[600] = 
{
    freq = FREQUENCY_TIME,
    interval = 60,
    levs = { 1,100 },
    questionaire = 1, --标记为调查问卷
    can_deliver_task_id = 12126,
    hint = _t"您激活了一个问卷，回答可获得奖励。",
    questionaireid = 36943,
    image =
     {
    up = "common\\ButtonImage\\Question_U.tga",down = "common\\ButtonImage\\Question_D.tga",onhover = "common\\ButtonImage\\Question_H.tga",
    },
}
_M[601] = 
{
    freq = FREQUENCY_TIME,
    interval = 60,
    levs = { 1,100 },
    questionaire = 1, --标记为调查问卷
    can_deliver_task_id = 12127,
    hint = _t"您激活了一个问卷，回答可获得奖励。",
    questionaireid = 36950,
    image =
     {
    up = "common\\ButtonImage\\Question_U.tga",down = "common\\ButtonImage\\Question_D.tga",onhover = "common\\ButtonImage\\Question_H.tga",
    },
    show_list =
     {
    },
}
]]--
_M[602] = 
{
    freq = FREQUENCY_TIME,
    interval = 60,
    levs = { 30,200 },
    questionaire = 1, --标记为调查问卷
    can_deliver_task_id = 12133,
    hint = _t"您激活了一个问卷，回答可获得奖励。",
    questionaireid = 36951,
    image =
     {
    up = "common\\ButtonImage\\Question_U.tga",down = "common\\ButtonImage\\Question_D.tga",onhover = "common\\ButtonImage\\Question_H.tga",
    },
    show_list =
     {
    {jump = 57,learn = _t"战力体检",text = _t"想知道怎么最有效率的提升战力么？",},
    },
}

_M[603] = 
{
    freq = FREQUENCY_TIME,
    interval = 60,
    levs = { 30,200 },
    questionaire = 1, --标记为调查问卷
    can_deliver_task_id = 12134,
    hint = _t"您激活了一个问卷，回答可获得奖励。",
    questionaireid = 36952,
    image =
     {
    up = "common\\ButtonImage\\Question_U.tga",down = "common\\ButtonImage\\Question_D.tga",onhover = "common\\ButtonImage\\Question_H.tga",
    },
    show_list =
     {
    {jump = 57,learn = _t"战力体检",text = _t"想知道怎么最有效率的提升战力么？",},
    },
}

_M[604] = 
{
    freq = FREQUENCY_TIME,
    interval = 60,
    levs = { 30,200 },
    questionaire = 1, --标记为调查问卷
    can_deliver_task_id = 12135,
    hint = _t"您激活了一个问卷，回答可获得奖励。",
    questionaireid = 36953,
    image =
     {
    up = "common\\ButtonImage\\Question_U.tga",down = "common\\ButtonImage\\Question_D.tga",onhover = "common\\ButtonImage\\Question_H.tga",
    },
    show_list =
     {
    {jump = 57,learn = _t"战力体检",text = _t"想知道怎么最有效率的提升战力么？",},
    },
}

_M[605] = 
{
    freq = FREQUENCY_TIME,
    interval = 60,
    levs = { 30,200 },
    questionaire = 1, --标记为调查问卷
    can_deliver_task_id = 12136,
    hint = _t"您激活了一个问卷，回答可获得奖励。",
    questionaireid = 36954,
    image =
     {
    up = "common\\ButtonImage\\Question_U.tga",down = "common\\ButtonImage\\Question_D.tga",onhover = "common\\ButtonImage\\Question_H.tga",
    },
    show_list =
     {
    {jump = 57,learn = _t"战力体检",text = _t"想知道怎么最有效率的提升战力么？",},
    },
}

_M[606] = 
{
    freq = FREQUENCY_TIME,
    interval = 60,
    levs = { 30,200 },
    questionaire = 1, --标记为调查问卷
    can_deliver_task_id = 13113,
    hint = _t"您激活了一个问卷，回答可获得奖励。",
    questionaireid = 42863,
    image =
     {
    up = "common\\ButtonImage\\Question_U.tga",down = "common\\ButtonImage\\Question_D.tga",onhover = "common\\ButtonImage\\Question_H.tga",
    },
    show_list =
     {
    {jump = 57,learn = _t"战力体检",text = _t"想知道怎么最有效率的提升战力么？",},
    },
}