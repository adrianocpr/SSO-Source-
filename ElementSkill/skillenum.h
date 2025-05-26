#ifndef _SKILL_ENUM_H_
#define _SKILL_ENUM_H_

namespace GNET
{

enum 
{ 
	TYPE_ATTACK				= 1, // 主动攻击
	TYPE_BLESS				= 2, // 主动祝福
	TYPE_CURSE				= 3, // 主动诅咒
	TYPE_PASSIVE			= 4, // 被动技能 
	TYPE_ASSIST				= 5, // 辅助技能
	TYPE_SYNTHESIS			= 6, // 合成技能 
};

enum 
{ 
	MODE_AUTO				= 1, //自动攻击
	MODE_HAND				= 2, //手动施放
	MODE_TOOL				= 3, //道具使用
	MODE_AURA				= 4, //光环激活 
	MODE_PASSIVE			= 5, //被动生效 
	MODE_SWITCH				= 6, //开关技能 
	MODE_SPECIAL_SWITCH		= 7, //特殊开关
	MODE_CONDITION			= 8, //条件触发
};

enum 
{ 
	ORIGIN_LEARN			= 1, //学习技能 
	ORIGIN_TALENT			= 2, //天赋技能
	ORIGIN_INNATE			= 3, //天生技能
	ORIGIN_SUBJOIN			= 4, //装备附加技能
};

enum ATTACK_RANGE
{
	RANGE_INVALID				= -1,
	RANGE_TARGET_POINT			= 0, // 选中对象 点 
	RANGE_TARGET_LINE			= 1, // 选中对象 线
//	RANGE_TARGET_SELFBALL		= 2, // 选中对象 自身为中心的球
	RANGE_TARGET_BALL			= 3, // 选中对象 目标为中心的球
	RANGE_TARGET_SECTOR			= 4, // 选中对象 自身为中心的扇形

	RANGE_POINT					= 5, // 不选中对象 点
	RANGE_LINE					= 6, // 不选中对象 线
//	RANGE_SECTOR				= 7, // 不选中对象 自身为中心的扇形
	RANGE_SELFBALL				= 8, // 不选中对象 自身为中心的球
	RANGE_AREA					= 9, // 选中区域，圆形圆心
	RANGE_MASTER				= 10,// 宠物主人
	RANGE_TARGET_CUR_LINE		= 11,// 选中对象 线 （取目标当前点 怪用）
	RANGE_TARGET_CUR_BALL		= 12,// 选中对象 目标为中心的球 （取目标当前点 怪用）
	RANGE_TARGET_CUR_SECTOR		= 13,// 选中对象 自身为中心的扇形 （取目标当前点 怪用）

	RANGE_NUM
};

enum PERFORM_MODE
{
	PERFORM_EMPTY			= 0,
	PERFORM_NORMAL			= 1,
	PERFORM_NOSTATE			= 2,
	PERFORM_NODAMAGE		= 3,
};

enum 
{ 
	FEEDBACK_HIT			= 0x01, //反馈击中消息
	FEEDBACK_DAMAGE			= 0x02, //反馈伤血消息
	FEEDBACK_KILL			= 0x04, //反馈杀人消息 
	FEEDBACK_MISS			= 0x08, //反馈未击中消息
	FEEDBACK_NODAMAGE		= 0x70, //本次无伤害
	FEEDBACK_NOSTATE		= 0x80, //本次不加状态包
};

enum SKILL_MASK 
{
	MASK_COMMON_SKILL		= 0x00,	//普通技能
	MASK_DEFAULT_SKILL		= 0x01,	//默认技能
	MASK_ADDON_SKILL		= 0x02,	//附加技能
	MASK_SHAPE_SKILL		= 0x04,	//变身附加技能
	MASK_FAMILY_SKILL		= 0x08,	//家族技能
};

enum 
{
	FLAG_IMMUNE				= 0x100, //免疫攻击
	FLAG_MISS				= 0x200, //未命中
	FLAG_CRIT				= 0x400, //此次攻击是爆击 	
	FLAG_DIRECT				= 0x2000,//直击
};

enum 
{
	SNOTIFY_IMMUNEMASK		= 0, // 免疫掩码改变
	SNOTIFY_UPDATEMASK		= 1, // 状态MASK改变
	SNOTIFY_SWITCHON		= 2, // 技能开关状态开启
	SNOTIFY_SWITCHOFF		= 3, // 技能开关状态关闭
};

enum 
{
	CONTEXT_IDLE			= 0, //空闲
	CONTEXT_ATTACK			= 1, //普攻
	CONTEXT_PRAY			= 2, //吟唱
	CONTEXT_PERFORM			= 3, //执行
	CONTEXT_INSTANT			= 4, //瞬发 
	CONTEXT_VICTIM			= 5, //目标
	CONTEXT_PASSIVE			= 6, //被动生效
};

enum 
{
	PASSIVE_SKILL_EFFECT		= 0, //被动技能生效
	PASSIVE_SKILL_UNDOEFFECT	= 1, //被动技能失效
	PASSIVE_SKILL_RESET			= 2, //被动技能重置 
};

enum ADD_BUFF_RET
{
	INSERT_NEW_SKILL			= 0, //新插入技能
	NOT_INSERT_NEW_SKILL		= 1, //未新插入技能
};

enum DEL_BUFF_RET
{
	ERASE_SKILL				= 0, //删除已存在的技能
	NOT_ERASE_SKILL			= 1, //未删技能
	SKILL_NOT_FOUND			= 2, //在map中未找到该技能
};

enum PROCESS_SKILL_RET
{
	PSR_INVALID				= -1, //无效值
	PSR_CONTINUE			= 0,  //继续处理
	PSR_OVER				= 1,  //结束返回
};

enum
{
	COMBO_CAST_SUCCESS		= 0, //key序列正确，施放成功
	COMBO_CAST_FAILURE		= 1, //key序列错误，施放失败 
	COMBO_CAST_TIMEOUT		= 2, //超时,失败
};

enum COMPARE_PRIORITY_RET
{
	CPR_FAIL				= -1,//失败
	CPR_GT					= 0, //前者优先级大于后者
	CPR_EQ					= 1, //前者优先级等于后者
	CPR_LT					= 2, //前者优先级小于后者
};

enum
{
	SKILL_EXTRA_FLAG_NONE		= 0, //无标示
	SKILL_EXTRA_FLAG_MICROCOSM	= 1, //小宇宙技能
	SKILL_EXTRA_FLAG_PETAUTO	= 2, //宠物自动攻击
	SKILL_EXTRA_FLAG_NPC_PRAY	= 3, //怪物吟唱条显示
	SKILL_EXTRA_FLAG_HUG		= 4, //抱摔
	SKILL_EXTRA_FLAG_CAST		= 5, //投掷
};

enum MOVE_STYLE
{
	MOVE_STYLE_INVALID		= -1,	
	MOVE_STYLE_COMMON		= 0, //普通
	MOVE_STYLE_FLASH		= 1, //闪现
};

enum
{
	SC_BOTH					= 0, //骑乘，地面都可使用
	SC_EARTH				= 1, //地面，骑乘状态先下马 
	SC_MOUNT				= 2, //骑乘状态下使用
	SC_ABS_EARTH			= 3, //绝对地面，骑乘状态下不能使用
	SC_AIR					= 4, //飞行, 包括翅膀飞行和骑乘飞行
};

enum MOVE_MODE
{
	MOVE_NONE				= 0,	//无
	MOVE_2_TARGET			= 1,	//移动至目标
	MOVE_2_BACK				= 2,	//移动至目标背后
	MOVE_NOTARGET_AHEAD		= 3,	//无目标前冲
	MOVE_NOTARGET_BACK		= 4,	//无目标后冲
	MOVE_NOTARGET_LEFT		= 5,	//无目标左冲
	MOVE_NOTARGET_RIGHT		= 6,	//无目标右冲
	MOVE_DIRECTION			= 7,	//指定方向冲
	MOVE_NO_TARGET			= 8,	//特殊前冲技能
};

enum SHOW_TYPE
{
	ST_HIDE					= 0,	//隐藏
	ST_PROFESSION			= 1,	//职业技能栏
	ST_TALENT				= 2,	//天赋技能栏
	ST_BASIC				= 3,	//基础栏
	ST_BURST				= 4,	//爆发栏
	ST_PET					= 5,	//宠物栏
	ST_ORIGINAL				= 6,	//原著技能栏
	ST_SOUL					= 7,	//斗魂技能
	ST_ARMY					= 8,	//军团技能
	ST_SAINT_GUARD			= 9,	//圣衣守护技
};

enum 
{ 
	SHOW_NORMAL				= 0, //正常显示
	SHOW_HIDE				= 1, //隐藏
};

enum 
{ 
	TIME_NORMAL				= 1, //普通 
	TIME_INSTANT			= 2, //瞬发 
};

enum 
{
	BAR_SHOW_NO				= 1, //不显示
	BAR_SHOW_PRAY			= 2, //吟唱
	BAR_SHOW_CHANNEL		= 3, //通道
	BAR_SHOW_CHARGE			= 4, //聚气
	BAR_SHOW_BTN_CHANNEL	= 5, //按键式通道
};

enum 
{
	AUTOATTACK_ACTIVATE		= 0, //激活自动攻击
	AUTOATTACK_STOP			= 1, //停止自动攻击
	AUTOATTACK_NO_BEAFFECT	= 2, //不影响自动攻击
	
};

enum 
{
	CONDITION_NORMAL		= 0, //没有条件限制
	CONDITION_GROUND		= 1, //仅地面状态下使用 
	CONDITION_MOUNT			= 2, //仅骑乘状态下使用 
	CONDITION_ABS_GROUND	= 3, //绝对地面
};

enum 
{
	TARGET_NORMAL			= 0, //普通
	TARGET_BODY				= 1, //尸体
};

enum 
{
	DELAY_NORMAL			= 1, //普通延时 
	DELAY_FLY				= 2, //飞行延时
};

enum EVENT
{
	EVENT_RESET				= 0x01, //进入世界
	EVENT_CHANGE			= 0x02, //更换职业 
};

enum 
{
	EXTRA_NONE				= 0, //无
	EXTRA_XP				= 1, //XP技能
	EXTRA_PETAUTO			= 2, //宠物自动释放
	EXTRA_MONSTER_BAR		= 3, //显示怪物吟唱条
	EXTRA_HUG				= 4, //抱摔
	EXTRA_CAST				= 5, //投掷
	EXTRA_BEAT_FLY			= 6, //击飞
};

enum 
{
	SWITCHON_COOL			= 0, //打开后冷却
	SWITCHOFF_COOL			= 1, //关闭后冷却
};

enum 
{
	HP_BLOW					= 1, 
	HP_ABOVE				= 2, 
	MP_BLOW					= 3, 
	MP_ABOVE				= 4, 
};

//	Mask of some special extend states which will influence player game logic.
//	Logic Influence Extned states
enum
{
	LIES_ROOT			= 0x0001,	// 禁止移动
	LIES_DISABLE_SKILL	= 0x0002,	// 禁止释放技能（不包括普攻）
	LIES_DISABLE_MELEE	= 0x0004,	// 禁止普攻
	LIES_STUN			= 0x0008,	// 击晕
	LIES_DRIFT			= 0x0010,	// 浮空
	LIES_DOWN			= 0x0020,	// 倒地
	LIES_DIET			= 0x0040,	// 禁食
};

enum AFFECT_TYPE
{       
	AT_SELF                 = 0x00000001,
	AT_TEAM                 = 0x00000002,
	AT_FRIEND_PLAYER        = 0x00000004,
	AT_ENEMY_PLAYER         = 0x00000008,
	AT_FRIEND_NPC           = 0x00000010,
	AT_ENEMY_NPC            = 0x00000020,
	AT_SPECIFIC_NPC         = 0x00000040,
	AT_FRIEND_PET			= 0x00000080,
	AT_ENEMY_PET			= 0x00000100,
	AT_MASTER				= 0x00000200,
};

//filter
enum 
{
	BUFF_TIME_INSTANT		= 0, //瞬间 时间类型
	BUFF_TIME_FINITE		= 1, //有限 时间类型
	BUFF_TIME_INFINITE		= 2, //无限 时间类型
};

enum 
{
	EFFECT_BEGIN 			= 0x00000001, //最初生效
	EFFECT_DELAY			= 0x00000002, //延时生效
	EFFECT_HIT				= 0x00000004, //击中生效
	EFFECT_DODGE			= 0x00000008, //闪避生效  
	EFFECT_BEHIT			= 0x00000010, //被击中生效 
	EFFECT_BEINJURE			= 0x00000020, //被伤血生效  
	EFFECT_KILL				= 0x00000040, //杀人生效 
	EFFECT_VALID_KILL		= 0x00000080, //有效杀人生效
	EFFECT_INVALID_KILL		= 0x00000100, //无效杀人生效 
	EFFECT_BELOW_HP			= 0x00000200, //自身血量低于百分比时 生效 
	EFFECT_ABOVE_HP			= 0x00000400, //自身血量高于百分比时 生效 
	EFFECT_BELOW_MP			= 0x00000800, //自身魔力低于百分比时 生效 
	EFFECT_ABOVE_MP			= 0x00001000, //自身魔力高于百分比时 生效 
	EFFECT_BELOW_VP			= 0x00002000, //自身元气低于百分比时 生效 
	EFFECT_ABOVE_VP			= 0x00004000, //自身元气高于百分比时 生效 
	EFFECT_BEFORE_DEATH		= 0x00008000, //遭受 致死攻击时 生效 
	EFFECT_STATE			= 0x00010000, //玩家身上有某状态 生效 
	EFFECT_INJURE			= 0x00020000, //对方伤血生效  
};

enum 
{
	OVER_HIT					= 0x00100000, //点击图标结束
	OVER_COMBAT					= 0x00200000, //进入战斗时 状态结束
	OVER_CHANGE					= 0x00400000, //切换场景 状态结束
	OVER_DEATH					= 0x00800000, //人物死亡 状态结束
	OVER_OFFLINE				= 0x01000000, //人物下线 状态结束 
	OVER_STOPCHANNEL			= 0x02000000, //终止时结束通道 
	OVER_SWITCH_PROFESSION		= 0x04000000, //切换职业 状态结束
};

enum 
{
	ADD_NORMAL						= 0, //直接加上;
	ADD_PRAY						= 1, //吟唱过程中加上 
	ADD_COMBAT						= 2, //处于战斗状态 则加上
	ADD_CRIT						= 3, //被暴击 则加上
	ADD_NOT_COMBAT					= 4, //没有处于战斗状态则加上 
	ADD_HAVE_STATEBAG				= 5, //有某状态包则加上
	ADD_HAVE_CHAR_PROP_STATE_BIT	= 6, //有某角色属性状态位则加上
};

enum 
{ 
	RULE_WEAK				= 1, //无论如何都失败，已有相同ID状态包，则不加本包
	RULE_UNIQUE				= 2, //无论如何都成功覆盖，已有相同ID状态包，则覆盖原有相同ID的状态包，并加本包   
	RULE_TIMEPRIOR			= 3, //状态持续时间更长，则成功覆盖 
	RULE_DATAPRIOR			= 4, //第一效果数值绝对值更大，则成功覆盖 
	RULE_ISOLATE			= 5, //独立
	RULE_ATTACH				= 6, //叠加 
	RULE_TIMERESET			= 7, //重置时间
	RULE_SUM_TIMEPRIOR		= 8, //如果状态总持续时间更长，则成功覆盖 
};

enum 
{
	CTRL_MODIFY				= 0, //叠加filter 
	CTRL_GETBUFFLEVEL		= 1, //获取叠加次数
};

}

#endif
