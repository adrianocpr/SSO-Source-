-- 界面操作指导序列
-- 这里的每一项都是一个序列
-- 该序列由事件LEVT_UI_DYNAMIC_DIRECTION触发，因此仍然不关心触发条件
-- 定义每个序列的名字
-- 序列中的每一步都去索引一条“界面操作指导”，即ui_dynamic_dir_item
-- 马远征
module("ui_dynamic_dir", package.seeall)


--[[ operation
-- 定义新的操作序列
-- 与 C++ 中的 UI_Dynamic_Direction::EnumOperation 一一对应
-- 通知相关程序员在触发条件满足时用
        -- c++：  LuaGlbEvent::StartUIDynDirection 或
        -- lua：  help_man:OnUIDynamicDirection 开始指引
-- 序列中的每一步操作，需在每种可能的成功结束时插入
        -- c++： LuaGlbEvent::TryToWalkUIDynDirection 或
        -- lua： help_man:TryToWalkCurrDirection 来尝试下一步指引
--]]
ASTROLOGY 			=	1	--		占星
EQUIP_ENHANCE		=	2	--		装备强化
MAGIC_BOX_BREAK		=	3	--		魔盒拆分
MAGIC_BOX_COMBINE	=	4	--		魔盒合成
CLOTH_STAR			=	5	--		圣衣星铸
DOUBLE_EXP			=	6	--		双倍经验
DIE_REVIVE			=	7	--		死亡复活
MANUALLY_LEVEL_UP	=	8	--		手动升级
USE_CLOTH			=	9	--		使用圣衣
PRODUCE_LEARN		=	10	--		生产学习
PRODUCE				=	11	--		生产
SKILL_SEQ			=	12 	--		连招编辑
EQUIP_PROCESS		=	13	--		符文镶嵌
XIAN_NV_CHANGE_AREA	=	14	--		仙女座领域切换
PICK_UP				=	15	--		采集
VIEW_TITLE			=	16	--		查看称号
VIEW_PHOTOBOOK		=	17	--		查看图鉴
VIEW_ACHIEVEMENT	=	18	--		查看成就
AUTO_ADJUST_ACITVITY=	19	--		自适应副本
GOLDEN_PALACE_GUIDE	=	20	--		12宫指引查看
TEAM_BUFF			=	21	--		组队加成
ASTRO_WATCH			=	22	--		星象守护
QUIT_PRAY			=	23	--		沐浴荣光
QUEST_LOTTERY		=	24	--		抽奖
CHECK_POWER			=	25	--		战力体检
FREE_PVP			=	26	--		自由竞技场，慢节奏PVP
SHORTCUT_EXPAND		=	27	--		快捷栏展开
MAP_GUIDE		=	28	--		地图指引
FRIEND_GUIDE   = 29  --		好友指引
FRIEND_ADD  = 30 --    加好友
MOVE_GUIDE  = 31 --移动指引
TASK_TRACE  = 32 --与制定NPC对话
VIEW_GUIDE  = 33 --视角指引
FAST_MOVE   = 34 --快速奔跑
FAST_MOVE_CONSUME = 35 --快速跑消耗
ATTACK_GUIDE = 36 --攻击目标
FAST_BUFF   = 37 --加速状态
BATTLE_SOUL_1 = 38 --斗魂1
XIAN_NV_CHANGE_AREA_M = 39 --仙女领域
GUI_ANSWER = 40 --贵鬼答题
TIANMA_SKILL = 41 --天马
BAINIAO_SKILL = 42 --白鸟
FENGHUANG_SKILL = 43 --凤凰
GSHOP  = 44 --商城
BATTLE_SOUL_2 = 45 --斗魂2
BATTLE_SOUL_3 = 46 --斗魂3
BATTLE_SOUL_4 = 47 --斗魂4
BATTLE_SOUL_5 = 48 --斗魂5
XIANNV_SKILL   = 49  --仙女输入条
XIANNV_SKILL_CHANGE = 50 --仙女切换
BAG_FULL = 51 --背包满
FORCE_GUIDE = 52 --战力指引
CHOOSE_STYLE_FINISHED	=	53 -- 完成风格选择
UNLOCK_SC	=	54	--	解除快捷栏锁定
DAILY_GUIDE	=	55	--	日程表指引
TITLE_GUIDE	=	56	--	日程表指引
SKILL_TRACE = 57  --  变身快捷栏指引
SKILL_TRACE_TWO = 58 --圣域变身快捷栏指引
GUIDE_OPEN  = 59 --指引界面指引
YADIANNA_TRACE = 60 --与雅典娜对话
POINT_TRACE = 61 --到达指定地点
ILLUSION_TRACE = 62 --追上幻像的指引
TIANMA_TRACE = 63 --天马流星拳
BAINIAO_TRACE = 64 --钻石星辰
TIANLONG_TRACE = 65 --庐山升龙
XIANNV_TRACE = 66 --星云锁链
FENGHUANG_TRACE = 67 --凤翼天翔
TIANQIN_TRACE = 68 --炫月之花
AUTO_ROUTE_TELEPORT	=	69 -- 自动寻径传送启动
STARSKY_SYSTEMBAR	=	70 -- 观星主界面指引
STARSKY	=	71 -- 观星界面指引
STARSKYCOMB	=	73 -- 星座连接界面指引
STARSKYBORN	=	74 -- 星之祭礼界面指引
ARTIFACT_TRACE = 75 --神器界面指引
COSMOS_LEVELUP = 76 --小宇宙升级指引
SOUL_ARMOR = 77 --灵魂之甲指引
TEST				=	100



--[[
[n] = k 步骤n 索引 ui_dynamic_dir_item[k] 项，步骤n从1开始，需要连续排列
run_time_once  = true 表示当前运行客户端只发生一次
]]--
_M[SOUL_ARMOR] =
{
	[1] = 136,
	[2] = 137,
	[3] = 138,
	[4] = 139,
	[5] = 140,
	[6] = 141,
	[7] = 142,
}


_M[COSMOS_LEVELUP] =
{
	[1] = 133,
	[2] = 134,
	[3] = 135,
}



_M[ARTIFACT_TRACE] =
{
	[1] = 127,
	[2] = 128,
	[3] = 129,
	[4] = 130,
	[5] = 131,
	[6] = 132,
}


_M[STARSKY_SYSTEMBAR] =
{
	[1] = 115,
	[2] = 116,
}

_M[STARSKY] =
{
	[1] = 117,
	[2] = 118,
	[3] = 119,
	[4] = 120,
	[5] = 121,
	[6] = 122,
}

_M[STARSKYCOMB] =
{
	[1] = 123,
}

_M[STARSKYBORN] =
{
	[1] = 124,
	[2] = 125,
	[3] = 126,
}


_M[ASTROLOGY] =
{
	[1] = 12,
	[2] = 13,
	[3] = 14,
	[4] = 15,
	[5] = 16,
	[6] = 17,
	[7] = 18,
}

_M[EQUIP_ENHANCE] =
{
	[1] = 19,  -- 第一步弹出 ui_dynamic_dir_item[17]项
	[2] = 20,
	[3] = 21,
}

_M[MAGIC_BOX_BREAK] =
{
	[1] = 5,  -- 第一步弹出 ui_dynamic_dir_item[18]项
	[2] = 6,
	[3] = 23,
	[4] = 7,
}

_M[MAGIC_BOX_COMBINE] =
{
	[1] = 8,  -- 第一步弹出 ui_dynamic_dir_item[17]项
	[2] = 9,
	[3] = 10,
	[4] = 24,
	[5] = 11,
}

_M[CLOTH_STAR] =
{
	[1] = 1,  -- 第一步弹出 ui_dynamic_dir_item[20]项
	[2] = 2,
	--[3] = 22,
	[3] = 3,
	[4] = 4,
}

_M[DOUBLE_EXP] =
{
	[1] = 25,  -- 第一步弹出 ui_dynamic_dir_item[25]项
	[2] = 26,
}

_M[DIE_REVIVE] =
{
	[1] = 27,  -- 第一步弹出 ui_dynamic_dir_item[27]项
	--[2] = 2,
}

_M[MANUALLY_LEVEL_UP] =
{
	[1] = 28,  -- 第一步弹出 ui_dynamic_dir_item[27]项
	--[2] = 29,
	[2] = 30,
}

_M[USE_CLOTH] =
{
	[1] = 31,  -- 第一步弹出 ui_dynamic_dir_item[27]项
	[2] = 32,
	[3] = 33,
	--[4] = 34,
}

_M[PRODUCE_LEARN] =
{
	[1] = 35,  -- 第一步弹出 ui_dynamic_dir_item[27]项
	[2] = 36,
}

_M[SKILL_SEQ] =
{
	[1] = 37,  -- 第一步弹出 ui_dynamic_dir_item[27]项
	[2] = 38,
	[3] = 39,
	--[4] = 40,
}

_M[EQUIP_PROCESS] =
{
	[1] = 41,  -- 第一步弹出 ui_dynamic_dir_item[27]项
	[2] = 42,
	[3] = 43,
}

_M[PICK_UP] =
{
	[1] = 44,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[GOLDEN_PALACE_GUIDE] =
{
	[1] = 45,  -- 第一步弹出 ui_dynamic_dir_item[27]项
	[2] = 46,
}

_M[PRODUCE] =
{
	[1] = 47,  -- 第一步弹出 ui_dynamic_dir_item[27]项
	[2] = 48,
	[3] = 49,
	[4] = 50,
}

_M[TEAM_BUFF] =
{
	[1] = 51,  -- 第一步弹出 ui_dynamic_dir_item[27]项
	[2] = 64,
}

--_M[ASTRO_WATCH] =
--{
	--[1] = 52,  -- 第一步弹出 ui_dynamic_dir_item[27]项
--}

_M[QUIT_PRAY] =
{
	[1] = 53,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[QUEST_LOTTERY] =
{
	[1] = 54,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[CHECK_POWER] =
{
	[1] = 55,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[FREE_PVP] =
{
	[1] = 56,  -- 第一步弹出 ui_dynamic_dir_item[27]项
	[2] = 68,
}

_M[AUTO_ADJUST_ACITVITY] =
{
	[1] = 57,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[ASTRO_WATCH] =
{
	[1] = 52,
}

_M[VIEW_TITLE] =
{
	[1] = 58,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[VIEW_PHOTOBOOK] =
{
	[1] = 59,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[VIEW_ACHIEVEMENT] =
{
	[1] = 60,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[XIAN_NV_CHANGE_AREA] =
{
	[1] = 61,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[MAP_GUIDE] =
{
	[1] = 62,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[SHORTCUT_EXPAND] =
{
	[1] = 63,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

--_M[FRIEND_GUIDE] =
--{
	--[1] = 65,  -- 第一步弹出 ui_dynamic_dir_item[27]项
--}

_M[FRIEND_ADD] =
{
	[1] = 66,
	--[2] = 67,
}

_M[MOVE_GUIDE] =
{
	[1] = 69,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[TASK_TRACE] =
{
	[1] = 70,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[VIEW_GUIDE] =
{
	[1] = 71,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[FAST_MOVE] =
{
	[1] = 72,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[FAST_MOVE_CONSUME] =
{
	[1] = 73,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[ATTACK_GUIDE] =
{
	[1] = 74,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[FAST_BUFF] =
{
	[1] = 75,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[BATTLE_SOUL_1] =
{
	[1] = 76,  -- 第一步弹出 ui_dynamic_dir_item[27]项
	[2] = 77,
	--[1] = 78,
}

_M[XIAN_NV_CHANGE_AREA_M] =
{
	[1] = 79,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[GUI_ANSWER] =
{
	[1] = 80,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[TIANMA_SKILL] =
{
	[1] = 81,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[BAINIAO_SKILL] =
{
	[1] = 82,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[FENGHUANG_SKILL] =
{
	[1] = 83,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[GSHOP] =
{
	[1] = 84,
	--[2] = 85,
	[2] = 86,
	[3] = 93,
}


_M[BATTLE_SOUL_2] =
{
	[1] = 76,  -- 第一步弹出 ui_dynamic_dir_item[27]项
	[2] = 87,
}


_M[BATTLE_SOUL_3] =
{
	[1] = 76,  -- 第一步弹出 ui_dynamic_dir_item[27]项
	[2] = 88,
}


_M[BATTLE_SOUL_4] =
{
	[1] = 76,  -- 第一步弹出 ui_dynamic_dir_item[27]项
	[2] = 89,
}


_M[BATTLE_SOUL_5] =
{
	[1] = 76,  -- 第一步弹出 ui_dynamic_dir_item[27]项
	[2] = 90,
}

_M[XIANNV_SKILL] =
{
	[1] = 91,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[XIANNV_SKILL_CHANGE] =
{
	[1] = 92,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[BAG_FULL] =
{
	[1] = 94,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[FORCE_GUIDE] =
{
	[1] = 95,  -- 第一步弹出 ui_dynamic_dir_item[27]项
	run_time_once = true,
}

_M[CHOOSE_STYLE_FINISHED] =
{
	[1] = 96,  -- 第一步弹出 ui_dynamic_dir_item[27]项
	[2] = 97,
	[3] = 98,
}

_M[UNLOCK_SC] =
{
	[1] = 99,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[DAILY_GUIDE] =
{
	[1] = 100,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[TITLE_GUIDE] =
{
	[1] = 101,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[SKILL_TRACE] =
{
	[1] = 102,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[SKILL_TRACE_TWO] =
{
	[1] = 103,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[GUIDE_OPEN] =
{
	[1] = 104,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[YADIANNA_TRACE] =
{
	[1] = 105,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[POINT_TRACE] =
{
	[1] = 106,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[ILLUSION_TRACE] =
{
	[1] = 107,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[TIANMA_TRACE] =
{
	[1] = 108,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[BAINIAO_TRACE] =
{
	[1] = 109,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[TIANLONG_TRACE] =
{
	[1] = 110,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[XIANNV_TRACE] =
{
	[1] = 111,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[FENGHUANG_TRACE] =
{
	[1] = 112,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[TIANQIN_TRACE] =
{
	[1] = 113,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}

_M[AUTO_ROUTE_TELEPORT] =
{
	[1] = 114,  -- 第一步弹出 ui_dynamic_dir_item[27]项
}
