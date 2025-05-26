#ifndef _EXP_TYPES_H_
#define _EXP_TYPES_H_

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <memory.h>
#include <iostream>

#define ELEMENTDATA_VERSION			0x10000096

enum SERVICE_TYPE
{
	// 交谈服务
	NPC_TALK = 0x80000000,
	// 出售商品的服务
	NPC_SELL,
	// 分发任务服务
	NPC_GIVE_TASK,
	// 完成任务服务
	NPC_COMPLETE_TASK,
	// 传送服务
	NPC_TRANSMIT,
	// 学习生产技能服务
	NPC_LEARN_PRODUCE,
	// 物物交易
	NPC_ITEM_TRADE,
	// 学习技能
	NPC_LEARN_SKILL,
	// TALK返回
	TALK_RETURN,
	// 结束对话
	TALK_EXIT,
	// 放弃任务
	TALK_GIVEUP_TASK,
	// 职业选择
	NPC_PROF_SELECT,
	// 副本服务
	NPC_DUNGEON,
	// 限量出售服务
	NPC_LIMITED_SALE,
};

/// NPC 简单服务定义
enum NPC_SIMPLE_SERVICE
{
	SIMPLE_SERVICE_MAIL                     = 0,         ///< 邮寄服务
	SIMPLE_SERVICE_STORAGE                  = 1,         ///< 仓库服务
	SIMPLE_SERVICE_LEAGUE_STORAGE           = 2,         ///< 军团仓库
	SIMPLE_SERVICE_LEAGUE                   = 3,         ///< 军团服务
	SIMPLE_SERVICE_LEAGUE_BASE              = 4,         ///< 基地服务
	SIMPLE_SERVICE_LEAGUE_BASE_LEAVE        = 5,         ///< 离开基地服务
	SIMPLE_SERVICE_DECLARE_LEAGUE_WAR       = 6,         ///< 军团宣战
	SIMPLE_SERVICE_AUCTION                  = 7,         ///< 拍卖服务
	SIMPLE_SERVICE_PROF_SWITCH              = 8,         ///< 职业切换
	SIMPLE_SERVICE_ITEM_DECOMPOSE           = 9,         ///< 分解服务
	SIMPLE_SERVICE_EQUIP_REFINE             = 10,        ///< 装备强化
	SIMPLE_SERVICE_REFINE_TRANSFER          = 11,        ///< 装备强化转移
	SIMPLE_SERVICE_EQUIP_PROCESSING         = 12,        ///< 装备加工
	SIMPLE_SERVICE_EQUIP_MERGE_ENHANCE      = 13,        ///< 装备融合强化
	SIMPLE_SERVICE_MAP_TELEPORT             = 14,        ///< 大地图传送
	SIMPLE_SERVICE_DOUBLE_EXP               = 15,        ///< 双倍经验时间
	SIMPLE_SERVICE_LEAVE_DUNGEON            = 16,        ///< 离开副本
	SIMPLE_SERVICE_LEAGUE_BONUS             = 17,        ///< 军团推荐贡献领取
	SIMPLE_SERVICE_SOLO_CHALLENGE_DUNGEON   = 18,        ///< 个人挑战副本
	SIMPLE_SERVICE_AFK_EXP					= 19,        ///< 挂机
	SIMPLE_SERVICE_PET_MATING				= 20,        ///< 宠物化生
	SIMPLE_SERVICE_GIFT_CARD				= 21,        ///< 礼品卡
	SIMPLE_SERVICE_REFERER_INFO				= 22,        ///< 推广人信息
	SIMPLE_SERVICE_ATHENA_CERTIFICATION		= 23,        ///< 认证雅典娜
	SIMPLE_SERVICE_XUNBAO					= 24,        ///< 寻宝网
	SIMPLE_SERVICE_EQUIPMENT_DYEING			= 25,        ///< 装备染色
	SIMPLE_SERVICE_LEAGUE_UNION				= 26,        ///< 军团联盟
	SIMPLE_SERVICE_SUIT_TAG_MIGRATION		= 27,        ///< 灵纹转移
	SIMPLE_SERVICE_EXP_EXCHANGE				= 28,        ///< 经验转换为第二经验 
	SIMPLE_SERVICE_SERVER_BATTLE			= 29,        ///< 服务器大战 
	SIMPLE_SERVICE_ACTIVITY_BATTLE			= 30,		 ///< 活动战场
};

/// ITEM_COMMON_PROP::proc_type 组合
enum PROC_TYPE
{
	ITEM_PROC_TYPE_NOSELL				= 0x0001,	//无法卖给NPC
	ITEM_PROC_TYPE_NOTRADE  			= 0x0002,	//玩家间不能交易
	ITEM_PROC_TYPE_CASHITEM 			= 0x0004,	//是人民币物品
	ITEM_PROC_TYPE_TASKITEM 			= 0x0008,	//是任务物品
	ITEM_PROC_TYPE_BIND2				= 0x0010,	//装备即绑定的物品
	ITEM_PROC_TYPE_BIND					= 0x0020,	//是已经绑定的物品
	ITEM_PROC_TYPE_NO_DEPOSIT			= 0x0040,	//不可存放仓库
	ITEM_PROC_TYPE_NODESTROY			= 0x0080,	//不允许销毁
	ITEM_PROC_TYPE_AUTO_DEL				= 0x0100,	//离开特定区域删除  
	ITEM_PROC_TYPE_DROP 				= 0x0200,	//红名死亡时掉落
	ITEM_PROC_TYPE_PICKBIND				= 0x0400,   //拾取绑定
	ITEM_PROC_TYPE_SOULBIND_ON_EQUIP	= 0x0800,   //装备后灵魂绑定
	ITEM_PROC_TYPE_DROP_ON_DEAD			= 0x1000,   //死亡或下线时掉落
};

/// 阵营Mask
enum FACTION_MASK
{
	FACTION_NORMAL					 = 0x0001,		///< 普通玩家
	FACTION_WHITE_NAME				 = 0x0002,		///< 白名状态
	FACTION_RED_NAME				 = 0x0004,		///< 红名状态
	FACTION_BLUE_NAME				 = 0x0008,		///< 蓝名状态
	FACTION_ATTACKER				 = 0x0010,		///< 对战攻方
	FACTION_DEFENDER				 = 0x0020,		///< 对战守方
	FACTION_ATTACKER_ALLIES			 = 0x0040,		///< 对战攻方友军
	FACTION_DEFENDER_ALLIES			 = 0x0080,		///< 对战守方友军
	FACTION_MONSTER_NORMAL			 = 0x0100,		///< 普通怪物
	FACTION_NPC_NORMAL				 = 0x0200,		///< 普通NPC(功能、任务、守卫)
	FACTION_MONSTER_1				 = 0x0400,		///< 怪物派系1
	FACTION_MONSTER_2				 = 0x0800,		///< 怪物派系2
	FACTION_MONSTER_SELF_OPPOSITE	 = 0x1000,		///< 自敌对怪物
	FACTION_NPC_NEUTRAL				 = 0x2000,		///< 中立NPC
	FACTION_MONSTER_EVIL			 = 0x4000,		///< 邪恶怪物
	FACTION_NPC_ENEMY				 = 0x8000,		///< 敌对NPC
	FACTION_MONSTER_BATTLE			 = 0x10000,		///< 对战怪物
	FACTION_MONSTER_ENEMY			 = 0x20000,		///< 敌对怪物
	FACTION_FORCE_ATHENA			 = 0x40000,		///< 圣域势力
	FACTION_FORCE_POSEIDON			 = 0x80000,		///< 海皇势力
	FACTION_FORCE_HADES				 = 0x100000,	///< 冥王势力
};

#pragma pack(push, EXP_TYPES_INC, 4)

#ifdef LINUX
typedef unsigned short namechar;
#else
typedef wchar_t			namechar;
#endif


// 装备和物品的通用属性
struct ITEM_COMMON_PROP
{
	int				item_quality;				// 物品品质
	int				drop_model;					// 简化掉落模型
	int				icon_path;					// 图标路径
	
	int				sell_bind_money;			// 出售获得绑定币
	int				price;						// 出售获得金币
	int				buy_bind_money;				// 购买所需绑定币
	int				shop_price;					// 购买所需金币
	unsigned int	id_buy_pre_repu;			// 购买所需声望前提ID
	int				buy_pre_repy;				// 购买所需声望前提值
	unsigned int	id_buy_repu;				// 购买所需声望ID
	int				buy_repy;					// 购买所需声望值
	unsigned int	id_buy_item;				// 购买所需物品ID
	int				buy_item;					// 购买所需物品数量
	
	int				pile_num_max;				// 物品堆叠上限
	int				max_hold;					// 限制拾取的最大持有数量
	unsigned int	proc_type;					// 处理方式
	int				auction_type[3];			// 拍卖的1~3级分类
};

// 物品分解通用属性
struct ITEM_DECOMPOSE
{
	int					cost_cube_energy;	// 分解需要的cube能量

	struct  
	{
		unsigned int	item_id;		// 分解获得物品id
		int				num;			// 数量
		float			prob;			// 概率
		float			bind_prob;			// 绑定概率
	}result[4];							// 分解获得物品
	unsigned int		show_item[4];	// 结果显示物品
};

struct WEEKDAY_TIME
{
	unsigned char second;
	unsigned char minute;	
	unsigned char hour;
	char weekday;		// 星期，若为0认为是无效时间。-1表示任意星期。1-7分别为星期一到星期日。

	WEEKDAY_TIME() { FromInt(0); }
	WEEKDAY_TIME(unsigned int value) { FromInt(value); }
	bool IsValid() const { return weekday != 0; }
	unsigned int GetInt() const { return ((int)weekday << 24) | ((int)hour << 16) | ((int)minute << 8) | (int)second; }
	void FromInt(unsigned int value)
	{
		weekday = (value & 0xff000000) >> 24;
		hour = (value & 0xff0000) >> 16;
		minute = (value & 0xff00) >> 8;
		second = value & 0xff;
	}
};

///////////////////////////////////////////////////////////////////////////////////////
//
// 装备的模板中要使用的附加属性的数据结构定义
//
//
//
///////////////////////////////////////////////////////////////////////////////////////
struct EQUIPMENT_ADDON
{
	enum _param_type
	{
		TYPE_INT,
		TYPE_FLOAT,
	};

	struct _param
	{
		union
		{
			int	int_value;
			float float_value;
		} value;
		int type;
	};
	unsigned int	id;							// 附加属性的ID
	namechar		name[32];					// 附加属性的名字

	int				type;						// 附加属性的类型

	int				num_params;					// 本附加属性的参数个数
	_param			param1;						// 第1个参数，可以是浮点数
	_param			param2;						// 第2个参数，可以是浮点数
	_param			param3;						// 第3个参数，可以是浮点数
};


///////////////////////////////////////////////////////////////////////////////////////
//
// 装备模板数据结构定义
//
//
///////////////////////////////////////////////////////////////////////////////////////

// 装备本体数据
struct EQUIPMENT_ESSENCE
{
	// 基本信息
	unsigned int	id;							// 装备(类型)ID
	namechar		name[32];					// 装备名称

	int				category;					// 圣衣类别	
	int				star_level;					// 装备星级

	unsigned int	equip_type;					// 装备类别，可能的有 0-武器，1-防具，2-时装，3-饰品，4-副手, 5-星图。
	unsigned int	equip_mask;					// 逻辑上可以装备的部位，由不同部位Mask组成，使用的部位代码为：
												// 	EQUIP_MASK_WEAPON			= 0x00000001,
												// 	EQUIP_MASK_ASSIST			= 0x00000002,
												// 	EQUIP_MASK_HELM				= 0x00000004,
												// 	EQUIP_MASK_BREAST			= 0x00000008,
												// 	EQUIP_MASK_LEG				= 0x00000010,
												// 	EQUIP_MASK_HAND				= 0x00000020,
												// 	EQUIP_MASK_NECKLACE			= 0x00000040,
												// 	EQUIP_MASK_EIKON			= 0x00000080,
												// 	EQUIP_MASK_SACRED_RELIC		= 0x00000100,
												// 	EQUIP_MASK_LEFT_RING		= 0x00000200,
												// 	EQUIP_MASK_RIGHT_RING		= 0x00000400,
												// 	EQUIP_MASK_MASK				= 0x00000800,
												// 	EQUIP_MASK_FASHION_HAIR		= 0x00001000,
												// 	EQUIP_MASK_FASHION_BODY		= 0x00002000,
												// 	EQUIP_MASK_FASHION_LEG		= 0x00004000,
												// 	EQUIP_MASK_FASHION_FOOT		= 0x00008000,
												// 	EQUIP_MASK_FASHION_HAND		= 0x00010000,
												// 	EQUIP_MASK_WING				= 0x00020000,
												// 	EQUIP_MASK_SPEAKER			= 0x00040000,
												//  EQUIP_MASK_SOUL_CRAFT		= 0x00080000,
												//  EQUIP_MASK_MOUNT			= 0x00100000, // 注：坐骑虽然不是装备，但会占用此装备位
												//  EQUIP_MASK_STAR_ATLAS		= 0x00200000,
												//  EQUIP_MASK_FACE				= 0x00400000,
												//  EQUIP_MASK_EYE				= 0x00800000,
												//  EQUIP_MASK_FACE_DECORATION	= 0x01000000,
												//	EQUIP_MASK_SASH				= 0x02000000,	// 绶带
												//	EQUIP_MASK_CLOAK			= 0x04000000,	// 披风
												//	EQUIP_MASK_BELT				= 0x08000000,	// 腰带
												// 	EQUIP_MASK_ALL				= 0x07ffffff,
	int				file_model_male;			// 男模型路径
	int				file_model_female;			// 女模型路径
	int				file_model_male_l;			// 男模型左手路径
	int				file_model_female_l;		// 女模型左手路径
	int				file_model_arm_l;			// 模型左小臂路径名
	int				file_model_arm_r;			// 模型右小臂路径名
	int				active_cloak_level;			// 激活披风等级

	int				model_candidate_config;		// 可选模型配置表
	int				change_model_cost_item_count;// 更改模型消耗道具数
	unsigned int	is_can_change_color;		// 是否可变色
	int				change_color_cost_item_count;// 变色消耗道具数
	unsigned int	default_color;				// 变色通道默认颜色

	unsigned int	equip_location;				// 模型覆盖部位，可能的有：
												// 0 - 不显示 1 - 头发/头盔 2 - 头环 3 - 胸甲 4 - 腿甲 
												// 5 - 护手 6 - 面具 7 - 副手 8 - 时装头发 9 - 时装头饰 
												// 10 - 时装上衣 11 - 时装下衣 12 - 时装上下衣 13 - 时装鞋 14 - 时装手套 
												// 15 - 脸 16 - 饰品1（预留） 17 - 饰品2（预留） 18 - 饰品3（预留） 19 - 饰品4（预留） 
												// 20 - 眼睛 21 - 面纹 

	unsigned int	action_type;				// 武器的动作播放类型，可能的有: 0-空手, 1-剑盾, 2-双手剑, 3-魔琴, 4-圣琴, 5-双手杖, 6-三叉戟, 7-爪, 8-匕首, 9-保留
	unsigned int	show_type;					// 武器的表现类型，可能的有：0-正常, 1-法宝类

	int				normal_attack_sfx;			// 普通攻击时的音效路径
	int				armor_type;					// 被打击音效材质ID
	int				level;						// 装备等级

	unsigned int	character_combo_id;			// 职业限制
	unsigned int	require_gender;				// 性别限制，0-男，1-女，2-男女都可
	int				require_level;				// 等级限制
	int				require_cosmos_level;		// 小宇宙等级限制
	int				require_willpower_level;	// 意志等级限制

	// 本体属性
	int				dur;						// 耐久值
	int				money_per_dur;				// 修理1耐久需要的钱数
	int				hp;							// 生命值
	int				mp;							// 体力值
	int				min_dmg;					// 小攻击
	int				max_dmg;					// 大攻击
	int				defence;					// 防御值
	int				hit;						// 命中
	int				dodge;						// 闪避
	int				element_dmg[5];				// 属性攻击力，地、水、火、风、雷
	int				fight_power;				// 本体提供战斗力

	// 附加属性
	unsigned int	id_random_all;				// 重新随机所有附加属性库所需物品ID
	unsigned int	id_random[8];				// 重新随机附加属性库n所需物品ID
	unsigned int	id_random_spe;				// 重新随机特殊附加属性所需物品ID
	unsigned int	id_prop_storage[8];			// 附加属性库nID
	float			spe_prop_ratio;				// 特殊属性库概率
	unsigned int	id_spe_prop_storate;		// 特殊属性库ID

	int				suit_tag_conf;				// 套装标识表ID
	struct
	{
		int			cost_item;					// 需要的物品
		int			cost_item_count;			// 需要的物品数量
		int			cost_money;					// 需要的金钱
		int			refresh_suit_tag_conf;		// 重随机套装标识表ID
	}
	refresh_suit_tag;							// 重随机套装标识

	unsigned int	is_suit_tag_migratable;		// 标识是否可转移

	struct
	{
		int			item_id;					// 保存标识需要的物品
		int			item_count;					// 保存标识需要的物品数量
	}
	suit_tag_lock_item[10];						// 保存标识1-10所需道具

	int				max_enhanch_level;			// 最高可到达强化等级
	int				enhance_type;				// 强化属性类型
	struct
	{
		int			min;						// 属性最小值
		int			max;						// 属性最大值
		int			cost_item_candidates[4];	// 强化所需道具
		int			cost_item_count;			// 强化所需道具数量
		float		success_prob;				// 强化成功率
		int			cost_money;					// 强化所需金钱
	}
	enhance_configs[20];						// 强化1-20配置

	struct
	{
		int			id;							// 额外属性包id	
		int			need_enhance_level;			// 额外属性包生效需要强化等级
		float		need_perfect_point;			// 额外属性包生效需要完美度
	}
	extra_addon_packages[16];					// 额外属性包配置

	int				per_perfect_point_addon_type;	// 每个完美度增加的附加属性属性类型
	int				per_perfect_point_addon_value;	// 每个完美度增加的附加属性数值

	int				fusion_product;				// 合成获得的装备
	float			fusion_success_prob;		// 合成的成功率
	struct
	{
		int			id;							// 向上合成消耗的物品
		int			count;						// 向上合成消耗的物品数量
	}
	fusion_item_cost[3];						// 向上合成消耗的物品1-3
	int				fusion_cost_money;			// 向上合成消耗的金钱
	int				fusion_cost_cube_energy;	// 向上合成消耗的cube能量

	ITEM_DECOMPOSE	decompose;					// 拆分获得物品

	unsigned int	id_enhanse_show_conf;		// 强化光效配置表

	int				convert_to_equip_id;		// 对应兑换装备id
	
	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};


/////////////////////////////////////////////////////////////////////////////////////////////////
// 法宝主件本体
/////////////////////////////////////////////////////////////////////////////////////////////////
struct TALISMAN_MAINPART_ESSENCE
{
	unsigned int	id;							// 法宝主件ID
	namechar		name[32];					// 法宝主件名称

	int				file_model[4];				// 法宝主件模型路径1 - 4
	int				file_matter;				// 掉在地上的模型路径
	int				file_icon;					// 图标路径

	// 法宝主件只能装备在法宝主件位置上，无需指定

	namechar		show_level[16];				// 法宝主件品级描述
	int				level;						// 法宝主件等级

	int				init_level;					// 初始等级

	unsigned int	character_combo_id;			// 职业限制
	unsigned int	require_gender;				// 性别限制，0-男，1-女，2-男女都可
	int				require_level;				// 等级限制
	unsigned int	sect_mask;					// 门派要求
	int				require_level2;				// 修真等级限制

	int				max_level;					// 最大成长等级
	int				max_level2;					// 最大成长等级2

	float			energy_recover_speed;		// 法宝精力增长速度
	float			energy_recover_factor;		// 非战斗状态法宝精力增长速度衰减系数
	float			energy_drop_speed;			// 法宝精力下降速度

	int				fee_levelup;				// 升级手续费
	int				fee_expfood;				// 血炼手续费
	int				fee_reset;					// 重置手续费
	
	// 价钱
	int				price;						// 卖店价
	int				shop_price;					// 店卖价

	// 堆叠信息
	int				pile_num_max;				// 堆叠上限

	// 处理方式
	unsigned int	proc_type;
};

/////////////////////////////////////////////////////////////////////////////////////////////////
// 法宝血炼材料
/////////////////////////////////////////////////////////////////////////////////////////////////
struct TALISMAN_EXPFOOD_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				file_matter;				// 掉在地上的模型路径
	int				file_icon;					// 图标路径

	int				exp_added;					// 增加的经验值

	unsigned int    sell_for_bind_money;			// 是否卖为绑定币
	int				price;						// 卖店价
	int				shop_price;					// 店卖价
	
	unsigned int	music_pick;					// 物品拾取音效
	unsigned int	music_drop;					// 物品掉落音效

	// 堆叠信息
	int				pile_num_max;				// 堆叠上限

	// 处理方式
	unsigned int	proc_type;
};

// 法宝精力增长道具
struct TALISMAN_ENERGYFOOD_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				file_matter;				// 掉在地上的模型路径
	int				file_icon;					// 图标路径名

	int				energy_total;				// 总的精力值
	int				energy_used_minimum;		// 精力使用最小值
	
	unsigned int    sell_for_bind_money;			// 是否卖为绑定币
	int				price;						// 卖店价
	int				shop_price;					// 店卖价

	unsigned int	music_pick;					// 物品拾取音效
	unsigned int	music_drop;					// 物品掉落音效

	// 堆叠信息
	int				pile_num_max;				// 该药品的堆叠上限

	// 处理方式
	unsigned int	proc_type;
};

/////////////////////////////////////////////////////////////////////////////////////////////////
// 法宝熔炼剂
/////////////////////////////////////////////////////////////////////////////////////////////////
struct TALISMAN_MERGEKATALYST_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				file_matter;				// 掉在地上的模型路径
	int				file_icon;					// 图标路径

	unsigned int    sell_for_bind_money;			// 是否卖为绑定币
	int				price;						// 卖店价
	int				shop_price;					// 店卖价

	unsigned int	music_pick;					// 物品拾取音效
	unsigned int	music_drop;					// 物品掉落音效

	// 堆叠信息
	int				pile_num_max;				// 堆叠上限

	// 处理方式
	unsigned int	proc_type;
};

// 套装
struct SUITE_ESSENCE
{
	// 基本信息
	unsigned int	id;							// 套装(类型)ID
	namechar		name[32];					// 套装名称

	int				max_equips;					// 套装件数

	struct 
	{
		unsigned int	id;						// 套装组件1~6
	} equipments[6];

	struct 
	{
		unsigned int	id[5];					// 2件至6件能激活的附加属性
	} addons[16];								// 强化等级0-15时的激活属性包

	char			file_gfx[128];				// 满套后的效果
	int				hh_type;					// 挂点
};

///////////////////////////////////////////////////////////////////////////////////////
// 精炼概率调整道具
///////////////////////////////////////////////////////////////////////////////////////
struct REFINE_TICKET_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				file_matter;				// 掉在地上的模型路径
	int				file_icon;					// 图标路径名

	int				type;						// 道具类型
	float			ext_succeed_prob;			// 吉星提高成功率固定值
	int				success_level;				// 必成对应等级
	int             min_level;					// 保底对应等级

	unsigned int    sell_for_bind_money;			// 是否卖为绑定币
	int				price;						// 卖店价
	int				shop_price;					// 店卖价

	unsigned int	music_pick;					// 物品拾取音效
	unsigned int	music_drop;					// 物品掉落音效

	// 堆叠信息
	int				pile_num_max;				// 堆叠上限

	// 处理方式
	unsigned int	proc_type;
};

///////////////////////////////////////////////////////////////////////////////////////
// 彩票道具
///////////////////////////////////////////////////////////////////////////////////////
struct LOTTERY_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				ui_type;					// 界面类型
	int				is_auto_open;				// 是否自动开启	
	int				is_enable_counter;			// 是否记录使用次数	

	struct
	{
		namechar		desc[16];				// 代表文字, 最多16个汉字
		int				icon;					// 图标路径名

	} candidates[32];							// 备选图案
	
	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

///////////////////////////////////////////////////////////////////////////////////////
// 录像道具
///////////////////////////////////////////////////////////////////////////////////////
struct CAMRECORDER_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				file_matter;				// 掉在地上的模型路径
	int				file_icon;					// 图标路径名

	unsigned int    sell_for_bind_money;			// 是否卖为绑定币
	int				price;						// 卖店价
	int				shop_price;					// 店卖价

	unsigned int	music_pick;					// 物品拾取音效
	unsigned int	music_drop;					// 物品掉落音效

	// 堆叠信息
	int				pile_num_max;				// 堆叠上限

	// 处理方式
	unsigned int	proc_type;
};


///////////////////////////////////////////////////////////////////////////////////////
//
// 药品模板数据结构定义
//
//
///////////////////////////////////////////////////////////////////////////////////////
// 药品本体属性
struct MEDICINE_ESSENCE
{
	unsigned int	id;							// 药品(类型)ID
	namechar		name[32];					// 药品名称

	int				require_level;				// 玩家的级别要求
	unsigned int	cool_type_mask;				// 冷却类型
	int				cool_time_world;			// 冷却时间_大世界（毫秒）
	int				cool_time_instance;			// 冷却时间_剧本（毫秒）

	int	            use_type_mask;				// 是否城战专用（0通用，1大世界专用，2剧本专用）

	int				type;						// 药物类别，六种：0-瞬回HP，1-瞬回MP，2-瞬回HP及MP，
												// 3-持续回HP，4-持续回MP，5-持续回HP及MP
	int				hp_max;						// HP_Max
	int				mp_max;						// MP_Max
	float			hp_max_percent;				// HP_MAX百分比
	int				hp[4];						// HP，瞬回的表示上限，非瞬回的表示连续四次的分别补给量
	int				mp[4];						// MP，瞬回的表示上限，非瞬回的表示连续四次的分别补给量

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

///////////////////////////////////////////////////////////////////////////////////////
//
// 生产原料模板数据结构定义
//
//
///////////////////////////////////////////////////////////////////////////////////////

// 生产原料本体属性
struct MATERIAL_ESSENCE
{
	unsigned int	id;							// 生产原料(类型)ID
	namechar		name[32];					// 生产原料名称

	// 拆分信息
	int				decompose_price;			// 拆分价格
	int				decompose_time;				// 拆分时间
	unsigned int	element_id;					// 拆分成的元石的类型ID
	int				element_num;				// 拆分产生的元石数

	// 物品拆分通用属性
	ITEM_DECOMPOSE decompose;
	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};
		   
// 技能书本体属性
struct SKILLTOME_ESSENCE
{
	unsigned int	id;							// (类型)ID
	namechar		name[32];					// 名称

	unsigned int	prof_mask;					// 职业mask
	int				skill_id;					// 技能ID
	int				cosmos_level_req;			// 学习需要玩家小宇宙等级

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 技能物品本体属性
struct SKILLMATTER_ESSENCE
{
	unsigned int	id;							// (类型)ID
	namechar		name[32];					// 名称

	int				level_required;				// 等级限制

	int				id_skill;					// 技能ID
	int				level_skill;				// 技能等级

	struct 
	{
		int			mapid;						// 所在地图id
		int			center_pos[3];				// 中心点坐标x,y,z
		int			radius[3];					// 区域x,y,z轴的半边长
	} use_in_area;								// 需要在某个区域中使用

	unsigned int    sitdown;					// 是否进入打坐状态
	unsigned int	only_in_war;				// 是否城战专用

	unsigned int	cool_type_mask;				// 冷却时间的类别
	int				cool_time;

	unsigned int	permenent;					// 使用后不消失，false-消失，true-不消失
	unsigned int	cast_skill;					// 是否伪装成道具调用技能
	int				id_target[5];				// 针对目标id1-5

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 坐骑
struct VEHICLE_ESSENCE
{
	unsigned int	id;							// (类型)ID
	namechar		name[32];					// 名称

	int				file_model;					// 模型文件
	unsigned int	is_flying_vehicle;			// 是否飞行坐骑

	int				level_required;				// 等级限制

	float			speed;						// 地面移动速度
	float			swim_speed;					// 水体速度
	float			fly_speed;					// 飞行速度

	char			action[32];					// 使用时播放角色动作名
	namechar		progress_desc[16];			// 进度条显示文字
	int				cast_time;					// 吟唱时间(毫秒)
	int				vocation_action_type;		// 坐骑时动作类型
	namechar		riding_action[16];			// 骑乘时角色播放的动作名
	namechar		flying_action[16];			// 骑乘飞行时角色播放的动作名

	unsigned int	ride_addon_storage[3];		// 骑乘附加属性库ID
	unsigned int	equip_addon_storage[3];		// 装备附加属性库ID
	unsigned int	fly_addon_storage[5];		// 飞行附加属性库ID

	unsigned int	ride_replace_skill_bar;			// 骑乘时替换技能栏
	unsigned int	ride_show_addtional_skill_bar;	// 骑乘时显示额外技能栏
	unsigned int	fly_replace_skill_bar;			// 飞行时替换技能栏
	unsigned int	fly_show_addtional_skill_bar;	// 飞行时显示额外技能栏

	struct  
	{
		int			id;							// 附加技能ID
		int			level;						// 附加技能等级
	}
	ride_addon_skill[2],						// 骑乘附加技能
	equip_addon_skill[2],						// 装备附加技能
	fly_addon_skill[4];							// 飞行附带技能

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 飞行器
struct AIRCRAFT_ESSENCE
{
	unsigned int	id;							// (类型)ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				file_model;					// 模型文件

	int				file_matter;				// 掉在地上的模型路径名
	int				file_icon;					// 图标路径名

	unsigned int    sell_for_bind_money;			// 是否卖为绑定币
	int				price;						// 卖店价
	int				shop_price;					// 店卖价

	namechar		descript[16];				// 飞行器品级
	int				level_required;				// 等级限制
	unsigned int	character_combo_id;
	unsigned int	only_in_war;				// 是否特殊地图专用
	int				fly_mode;					// 飞行模式

	float			speed;						// 移动速度
	int				mp_used;					// 常规飞行消耗魔力
	float			sprint_speed;				// 冲刺飞行速度
	int				vp_used;					// 冲刺飞行消耗元气

	unsigned int	music_pick;					// 物品拾取音效
	unsigned int	music_drop;					// 物品掉落音效

	// 堆叠信息
	int				pile_num_max;				// 堆叠上限

	// 处理方式
	unsigned int	proc_type;
};

///////////////////////////////////////////////////////////////////////////////////////
// 替身娃娃
///////////////////////////////////////////////////////////////////////////////////////
struct LUCKYROLL_ESSENCE
{
	unsigned int	id;							// (类型)ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				file_matter;				// 掉在地上的模型路径
	int				file_icon;					// 图标路径

	int				type;						// 类型：0-物品卷，1-经验卷

	unsigned int    sell_for_bind_money;			// 是否卖为绑定币
	int				price;						// 卖店价
	int				shop_price;					// 店卖价

	unsigned int	music_pick;					// 物品拾取音效
	unsigned int	music_drop;					// 物品掉落音效

	// 堆叠信息
	int				pile_num_max;				// 堆叠上限

	// 处理方式
	unsigned int	proc_type;
};

///////////////////////////////////////////////////////////////////////////////////////
// 双倍经验道具
///////////////////////////////////////////////////////////////////////////////////////
struct DOUBLE_EXP_ESSENCE
{
	unsigned int	id;							// (类型)ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				file_matter;				// 掉在地上的模型路径
	int				file_icon;					// 图标路径

	unsigned int	type_mask;					// 效果种类， 多选项（经验、金钱、任务经验、任务金钱、任务声望、生活经验）
	float			coefficient;				// 奖励的倍数
	int				double_exp_time;			// 双倍经验时间(秒)

	unsigned int    sell_for_bind_money;			// 是否卖为绑定币
	int				price;						// 卖店价
	int				shop_price;					// 店卖价

	unsigned int	music_pick;					// 物品拾取音效
	unsigned int	music_drop;					// 物品掉落音效

	// 堆叠信息
	int				pile_num_max;				// 堆叠上限

	// 处理方式
	unsigned int	proc_type;
};

// 回城卷轴
struct TOWNSCROLL_ESSENCE
{
	unsigned int	id;							// (类型)ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				file_matter;				// 掉在地上的模型路径
	int				file_icon;					// 图标路径

	float			use_time;					// 使用时间（秒）

	unsigned int    sell_for_bind_money;			// 是否卖为绑定币
	int				price;						// 卖店价
	int				shop_price;					// 店卖价

	int				blank;						// 是否为空白

	unsigned int	music_pick;					// 物品拾取音效
	unsigned int	music_drop;					// 物品掉落音效

	// 堆叠信息
	int				pile_num_max;				// 堆叠上限

	// 处理方式
	unsigned int	proc_type;
};

// 复活卷轴
struct REVIVESCROLL_ESSENCE
{
	unsigned int	id;							// (类型)ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				file_matter;				// 掉在地上的模型路径
	int				file_icon;					// 图标路径

	float			use_time;					// 使用时间（秒）
	int				cool_time;					// 冷却时间（毫秒）

	unsigned int    sell_for_bind_money;			// 是否卖为绑定币
	int				price;						// 卖店价
	int				shop_price;					// 店卖价

	unsigned int	music_pick;					// 物品拾取音效
	unsigned int	music_drop;					// 物品掉落音效

	// 堆叠信息
	int				pile_num_max;				// 堆叠上限

	// 处理方式
	unsigned int	proc_type;
};

// 任务物品
struct TASKMATTER_ESSENCE
{
	unsigned int	id;							// (类型)ID
	namechar		name[32];					// 名称

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

//	用于任务的普通物品(废弃)
struct TASKNORMALMATTER_ESSENCE
{
	unsigned int	id;							// (类型)ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				file_icon;					// 图标路径
	
	int				props_use_type;				// 物品用途

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 任务随机发生器
struct TASKDICE_ESSENCE
{
	unsigned int	id;							// (类型)ID
	namechar		name[32];					// 名称

	int				id_instance;				// 任务点所在地图id
	int				center_x;					// 任务点区域中心点坐标x
	int				center_y;					// 任务点区域中心点坐标y
	int				center_z;					// 任务点区域中心点坐标z
	int				half_len_x;					// 任务点区域x半边长度
	int				half_len_y;					// 任务点区域y半边长度
	int				half_len_z;					// 任务点区域z半边长度
	int				file_hint_model;			// 提示点模型
	int				common_cool_type;			// 使用后公共冷却类型
	int				common_cool_time;			// 使用后公共冷却时间
	int				consume_after_use;			// 是否使用后即消失
	int				vocation_action_type;		// 使用时动作类型
	char			action[32];					// 使用时播放角色动作名
	char			riding_action[32];			// 骑乘使用时播放动作名

	namechar		progress_desc[16];			// 进度条显示文字, 最多16个汉字
	int				time_intonate;				// 吟唱时间
	unsigned int	is_notify_when_available;	// 是否有可使用提示
	unsigned int	is_exclusive_for_league;	// 是否军团标记
	unsigned int	help_info;					// 提示方向和距离的通配符，玩家不在指定地图时调用此文本信息
	unsigned int	help_info2;					// 提示方向和距离的通配符，玩家在指定地图不在指定区域时调用此文本信息
	int				voice_help;					// 是否有音效提示"，0、否；1、是
	unsigned int	voice_file;					// 音效文件
	unsigned int	is_show_award_hint;			// 是否在悬浮提示中显示任务奖励信息
	unsigned int	is_show_task_count_hint;	// 是否在悬浮提示中显示任务计数信息

	struct
	{
		unsigned int	id;						// 任务id
		float			probability;			// 产生该任务的概率
		
	} task_lists[32];

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// 烟花本体
////////////////////////////////////////////////////////////////////////////////////////
struct FIREWORKS_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				file_fw;					// 关联效果路径

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// 文字烟花本体
////////////////////////////////////////////////////////////////////////////////////////
struct TEXT_FIREWORKS_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				file_matter;				// 掉在地上的模型路径
	int				file_icon;					// 图标路径

	int				file_fw;					// 组合效果文件
	int				level;						// 等级

	namechar		char_can_use[256];			// 可以使用的字符有哪些
	int				max_char;					// 可以输出的最大字符数

	unsigned int    sell_for_bind_money;			// 是否卖为绑定币
	int				price;						// 卖店价
	int				shop_price;					// 店卖价

	unsigned int	music_pick;					// 物品拾取音效
	unsigned int	music_drop;					// 物品掉落音效

	// 堆叠信息
	int				pile_num_max;				// 该烟花的堆叠上限

	// 处理方式
	unsigned int	proc_type;
};

////////////////////////////////////////////////////////////////////////////////////////
// 强化石本体
////////////////////////////////////////////////////////////////////////////////////////
struct ESTONE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				estone_type;				//强化石类型

	int				file_matter;				// 掉在地上的模型路径
	int				file_icon;					// 图标路径

	struct  
	{
		unsigned int	equip_mask;				// 可镶嵌的装备类别
		unsigned int	effect_addon_type;		// 效果附加属性类型

	} effects[4];

	unsigned int    sell_for_bind_money;		// 是否卖为绑定币
	int				price;						// 卖店价
	int				shop_price;					// 店卖价

	float			rank;						// 宝石品级

	unsigned int	music_pick;					// 物品拾取音效
	unsigned int	music_drop;					// 物品掉落音效

	// 堆叠信息
	int				pile_num_max;				// 堆叠上限

	// 处理方式
	unsigned int	proc_type;
};


////////////////////////////////////////////////////////////////////////////////////////
// 强化相关道具
////////////////////////////////////////////////////////////////////////////////////////
struct ENHANCE_ITEM_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称
	
	unsigned int	equip_mask;					// 装备部位
	int				equip_lv_min;				// 适用装备等级下限
	int				equip_lv_max;				// 适用装备等级上限
	int				enhanse_lv_min;				// 适用强化等级下限
	int				enhanse_lv_max;				// 适用强化等级上限
	struct
	{
		float			prob;					// 成功率
		int				gold;					// 消耗金币
		unsigned int	fail_lv_drop;			// 失败后强化等级掉落
	} upgrade[15];								// 强化到1~15级的要求

	// 物品拆分通用属性
	ITEM_DECOMPOSE decompose;
	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// 强化表现效果配置表
////////////////////////////////////////////////////////////////////////////////////////
struct ENHANCE_SHOW_CONFIG
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				glow_gfx[15];				// 强化等级为1~15级时显示的Gfx
};

////////////////////////////////////////////////////////////////////////////////////////
// 属性石本体
////////////////////////////////////////////////////////////////////////////////////////
struct PSTONE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				pstone_type;				//属性石的类别 0:符文  1:宝石
	
	int				file_matter;				// 掉在地上的模型路径
	int				file_icon;					// 图标路径

	unsigned int	equip_mask;					// 可镶嵌的装备类别
	unsigned int	type_mask;					// 符文的类型
	unsigned int	rune_prop;					// 符文特质属性
	float			rune_prop_prob;				// 特质属性镶嵌后触发概率
	unsigned int	id_addon_package;			// 符文附加属性包的ID
	unsigned int	equip_lv_max;				// 适应装备等级上限
	unsigned int	equip_lv_min;				// 适应装备等级下限

	unsigned int	id_uninstall;				// 宝石取下所需物品ID
	unsigned int    gem_type;					// 宝石的类型
	int				fee_install;				// 属性石镶嵌费用
	int				fee_uninstall;				// 属性石拆卸费用

	unsigned int    sell_for_bind_money;			// 是否卖为绑定币
	int				price;						// 卖店价
	int				shop_price;					// 店卖价

	unsigned int	music_pick;					// 物品拾取音效
	unsigned int	music_drop;					// 物品掉落音效

	// 堆叠信息
	int				pile_num_max;				// 堆叠上限

	// 处理方式
	unsigned int	proc_type;
};

////////////////////////////////////////////////////////////////////////////////////////
// 技能石本体
////////////////////////////////////////////////////////////////////////////////////////
struct SSTONE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				file_matter;				// 掉在地上的模型路径
	int				file_icon;					// 图标路径

	unsigned int	equip_mask;					// 可镶嵌的装备类别
	unsigned int	skill_id;					// 技能id
	int				skill_level;				// 技能等级

	unsigned int    sell_for_bind_money;			// 是否卖为绑定币
	int				price;						// 卖店价
	int				shop_price;					// 店卖价

	unsigned int	music_pick;					// 物品拾取音效
	unsigned int	music_drop;					// 物品掉落音效

	// 堆叠信息
	int				pile_num_max;				// 堆叠上限

	// 处理方式
	unsigned int	proc_type;
};

////////////////////////////////////////////////////////////////////////////////////////
// 装备加工物品
////////////////////////////////////////////////////////////////////////////////////////
struct EQUIPMENT_PROCESSING_ITEM_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称
	
	unsigned int	equipment_level_req;		// 最低装备等级要求
	unsigned int	equip_mask;					// 可加工部位
	unsigned int	id_prop_storage;			// 附加属性库ID
	unsigned int	prop_storage_time_limit;	// 附加属性库时效
	
	// 物品拆分通用属性
	ITEM_DECOMPOSE decompose;
	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// 潜能书本体
////////////////////////////////////////////////////////////////////////////////////////
struct POTENTIAL_TOME_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				file_matter;				// 掉在地上的模型路径
	int				file_icon;					// 图标路径

	unsigned int	sect_mask;					// 门派要求
	int				require_level;				// 等级限制
	int				potential_id;				// 潜能id

	unsigned int    sell_for_bind_money;			// 是否卖为绑定币
	int				price;						// 卖店价
	int				shop_price;					// 店卖价

	unsigned int	music_pick;					// 物品拾取音效
	unsigned int	music_drop;					// 物品掉落音效

	// 堆叠信息
	int				pile_num_max;				// 堆叠上限

	// 处理方式
	unsigned int	proc_type;
};

////////////////////////////////////////////////////////////////////////////////////////
// 夫妻同心结
////////////////////////////////////////////////////////////////////////////////////////
struct COUPLE_JUMPTO_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				file_matter;				// 掉在地上的模型路径
	int				file_icon;					// 图标路径

	unsigned int    sell_for_bind_money;			// 是否卖为绑定币
	int				price;						// 卖店价
	int				shop_price;					// 店卖价

	unsigned int	music_pick;					// 物品拾取音效
	unsigned int	music_drop;					// 物品掉落音效

	// 堆叠信息
	int				pile_num_max;				// 堆叠上限

	// 处理方式
	unsigned int	proc_type;
};

// 喇叭
struct SPEAKER_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				id_icon_set;				// 表情符号套号

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 变身道具
struct CHANGE_SHAPE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	namechar		collection[16];
	int				file_model;
	namechar		descript_text[256];
	int				valid_time;
	int				level_required;
	int				stand_mode;
	int				monster_race;
	int				used_vp;
	int				used_time;					// 附加到图鉴后可使用的次数
	float			height_var;					// 变形后高度增加值
	float			speed;
	int				can_attack;					// 是否可以攻击
	int				id_camera;					// 对应摄像机方案id
	int				hide_name;

	char			buff_action1[32];
	char			buff_action2[32];
	char			buff_action3[32];

	char			debuff_action1[32];
	char			debuff_action2[32];
	char			debuff_action3[32];

	char			attack_action1[32];
	char			attack_action2[32];
	char			attack_action3[32];

	int				shape_required[3];

	struct
	{
		int			id;
		int			level;
	} addon_skills[3];							// 附加技能

	int				addons[6];					// 附加属性

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

///////////////////////////////////////////////////////////////////////////////////////
// 配方卷轴
///////////////////////////////////////////////////////////////////////////////////////
struct RECIPEROLL_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	unsigned int	id_recipe;					// 对应的配方ID

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 怪物召唤模板
struct SUMMON_MONSTER_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介
	
	int				file_matter;				// 掉在地上的模型路径
	int				file_icon;					// 图标路径

	int				required_level;

	struct 
	{
		unsigned int	id;
		int				lifespan;
		int				num;
	} monsters[2];

	unsigned int    sell_for_bind_money;			// 是否卖为绑定币
	int				price;						// 卖店价
	int				shop_price;					// 店卖价

	unsigned int	music_pick;					// 物品拾取音效
	unsigned int	music_drop;					// 物品掉落音效

	// 堆叠信息
	int				pile_num_max;				// 堆叠上限

	// 处理方式
	unsigned int	proc_type;
};

////////////////////////////////////////////////////////////////////////////////////////
// 请神符 挂机道具
////////////////////////////////////////////////////////////////////////////////////////
struct AI_HELPER_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				file_matter;				// 掉在地上的模型路径
	int				file_icon;					// 图标路径

	int				duration;					// 使用有效期（秒）
	int				autohook_type;				// 挂机物品类型
	int				addon_skill;				// 附加的技能ID

	unsigned int    sell_for_bind_money;			// 是否卖为绑定币
	int				price;						// 卖店价
	int				shop_price;					// 店卖价

	unsigned int	music_pick;					// 物品拾取音效
	unsigned int	music_drop;					// 物品掉落音效

	// 堆叠信息
	int				pile_num_max;				// 堆叠上限

	// 处理方式
	unsigned int	proc_type;
};

//////////////////////////////////////////////////////////////////////////////////////
// 书籍
//////////////////////////////////////////////////////////////////////////////////////
struct BOOK_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	unsigned int	is_exhibit;					// 是否为侦探证物
	struct
	{
		unsigned int	is_pic;					// 该页是否图片
		int				content;				// 文字内容
		int				pic_path;				// 文字图片路径
		int				pic_desc;				// 图片描述
	}
	pages[20];									// 1-20页配置

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

//////////////////////////////////////////////////////////////////////////////////////
// 守护灵
////////////////////////////////////////////////////////////////////////////////////////
struct GUARDIAN_SOUL_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				file_icon;					// 图标路径

	struct
	{
		int		star;								// 评分要求
		int		file_head_icon;						// 头像
		int		file_model;							// 模型
	}grade_star[4];								// 无、初、中、高级品

	int				level;						// 守护灵初始等级
	int				summon_level_req;			// 守护灵携带等级(出战要求人物级别)

	unsigned int	constellation;				// 星座
	int				class_grade;				// 守护灵阶级

	float			growth_str_factor;			// 力成长率对应力系数
	float			growth_dur_factor;			// 耐成长率对应耐系数
	float			growth_sta_factor;			// 体成长率对应体系数

	struct 
	{
		float		limit;						// 上限
		float		prob;						// 落到区间概率
	}
	str_growth_table[10],						// 力成长率区间
	dur_growth_table[10],						// 耐成长率区间
	sta_growth_table[10];						// 体成长率区间

	struct 
	{
		float		limit;						// 上限
		float		prob;						// 落到区间概率
	}
	str_aptitude_table[10],						// 力资质区间
	dur_aptitude_table[10],						// 耐资质区间
	sta_aptitude_table[10];						// 体资质区间

	struct  
	{
		float		add_value[10];				// 1~10阶提升值
		int			need_point[10];				// 1~10阶需要积累度
	}
	str_aptitude_level_table,					// 力资质n阶以及所需积累度
	dur_aptitude_level_table,					// 耐资质n阶以及所需积累度
	sta_aptitude_level_table;					// 体资质n阶以及所需积累度

	int				enhance_exp[15];			// 修炼1~15级需要修炼经验
	struct
	{
		int			level;						// 修炼1~15级需要守护灵等级
		int			player_cosmos_level;		// 修炼1~15级需要主人小宇宙等级
	}
	enhance_req[15];							// 修炼1~15级的需求

	int				strength;					// 初始力
	int				durability;					// 初始耐
	int				stamina;					// 初始体
	int				init_enhance_limit;			// 初始修炼等级上限

	float			sight_range;				// 视野
	float			str_range;					// 力距离

	float			aggro_range;				// 仇恨距离
	float			aggro_time;					// 仇恨时间

	unsigned int	stand_mode;					// 站立方式，可能的有：四足站立、双足站立、悬空飞行等

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// 守护灵技能卷轴
////////////////////////////////////////////////////////////////////////////////////////
struct GUARDIAN_SOUL_SKILL_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				file_icon;					// 图标路径

	int				id_skill;					// 技能id
	int				skill_level;				// 技能等级
	int				use_prob[3];				// 技能各等级使用概率，[0]为等级1使用概率

	int				learn_req_level;			// 学习要求守护灵级别
	int				learn_req_summon_level;		// 学习要求守护灵携带等级
	int				learn_bind_money;			// 学习花费绑定币
	int				learn_gold;					// 学习花费金币
	float			learn_prob;					// 学习成功率

	// 物品拆分通用属性
	ITEM_DECOMPOSE decompose;
	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// 守护灵技能提升石
////////////////////////////////////////////////////////////////////////////////////////
struct GUARDIAN_SOUL_SKILL_UP_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				file_icon;					// 图标路径

	int				skill_id;					// 技能ID
	int				skill_level_require;		// 需要技能等级
	int				req_level;					// 守护灵等级要求
	int				req_summon_level;			// 守护灵携带等级要求
	float			success_prob;				// 提升成功率
	int				cost_bind_money;			// 提升需要绑定币
	int				cost_gold;					// 提升需要金币

	// 物品拆分通用属性
	ITEM_DECOMPOSE decompose;
	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// 守护灵资质强化石
////////////////////////////////////////////////////////////////////////////////////////
struct GUARDIAN_SOUL_APTITUDE_STONE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				file_icon;					// 图标路径

	int				type;						// 类别，0=力资质，1=耐资质，2=体资质
	int				point_add;					// 累积度提升值
	int				summon_level_limit;			// 适用最高携带等级
	int				cost_bind_money;			// 提升需要绑定币
	int				cost_gold;					// 提升需要金币

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};




//////////////////////////////////////////////////////////////////////////////////////
// 宠物牌  To Be Delete
////////////////////////////////////////////////////////////////////////////////////////
struct PET_BEDGE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				drop_model;					// 简化掉落模型
	int				file_icon;					// 图标路径
	float			size;						// 宠物大小

	struct
	{
		int		star;								// 评分要求
		int		file_head_icon;						// 头像
		int		file_model;							// 模型
	}grade_star[4];								// 无、初、中、高级品

	int				level;						// 宠物初始等级
	int				summon_level_req;			// 宠物携带等级(出战要求人物级别)

	unsigned int	monster_race;				// 种族
	int				pet_category;				// 宠物类型 0=近程 1=远程
	int				pet_class_grade;			// 宠物阶级
	int				normal_atk_skill;			// 普通攻击技能id
	int				special_skill;				// 特殊技能id
	int				target_dist_threshold;		// 特殊技能临界距离

	float			growth_max_dmg_factor;		// 攻击成长率对应攻击上限系数
	float			growth_min_dmg_factor;		// 攻击成长率对应攻击下限系数
	float			growth_def_factor;			// 防御成长率对应防御系数
	float			growth_hp_factor;			// 生命成长率对应生命系数

	struct 
	{
		float		limit;							// 上限
		float		prob;							// 落到区间概率
	}
	atk_growth_table[10],							// 攻击成长率区间
	def_growth_table[10],							// 防御成长率区间
	hp_growth_table[10];							// 生命成长率区间

	struct  
	{
		float		add_value[10];					// 1~10阶成长率提升值
		int			need_point[10];					// 1~10阶成长率需要成长度
	}
	atk_growth_level_table,							// 攻击成长率n阶提升值以及所需成长度
	def_growth_level_table,							// 防御成长率n阶提升值以及所需成长度
	hp_growth_level_table;							// 生命成长率n阶提升值以及所需成长度

	struct 
	{
		float		limit;							// 上限					
		float		prob;							// 落到区间概率
	}
	atk_itg_table[10],							// 攻击资质区间
	def_itg_table[10],							// 防御资质区间
	hp_itg_table[10];							// 生命资质区间

	int				hp;							// 初始生命力
	int				min_dmg;					// 初始最小攻击力
	int				max_dmg;					// 初始最大攻击力
	int				defense;					// 初始防御力
	float			lucky_att_rate;				// 初始幸运一击率(%)
	float			direct_att_rate;			// 初始直击率(%)

	float			damage_rate;				// 初始伤害倍率
	float			phy_anti_rate;				// 初始物理伤害抗性
	float			magic_anti_rate;			// 初始法术伤害抗性
	float			crit_rate;					// 初始暴击率(%)
	float			anti_crit_rate;				// 初始减免暴击率(%)
	int				extra_crit_damage;			// 初始暴击附加伤害
	int				extra_crit_defance;			// 初始暴击附加伤害减免

	int				extra_heal;					// 初始被治疗效果固定值

	int				hp_gen[2];					// 非战斗状态中HP恢复速度
												// 战斗状态中HP恢复速度


	float			sight_range;				// 视野
	float			attack_range;				// 攻击距离
	
	float			aggro_range;				// 仇恨距离
	float			aggro_time;					// 仇恨时间
	
	unsigned int	stand_mode;					// 站立方式，可能的有：四足站立、双足站立、悬空飞行等
	
	float			atk_itg_max;				// 攻击资质上限
	float			def_itg_max;				// 防御资质上限
	float			hp_itg_max;					// 生命资质上限

	struct
	{
		int			level_req;						// 等级要求
		int			item_need;						// 需要材料ID
		int			item_num;						// 需要材料数量
		int			bind_money_need;				// 需要绑定币
		int			gold_need;						// 需要金币
		float		prob;							// 成功率
	}evolution[5];									// 进化


	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// 宠物食品
////////////////////////////////////////////////////////////////////////////////////////
struct PET_FOOD_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				food_usage;					// 食品用途	0-体力当前值 1-亲密度 2-成长值
	int				food_value;					// 食品增加的值
	int				cool_time;					// 宠物食品冷却时间

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// 宠物技能卷轴
////////////////////////////////////////////////////////////////////////////////////////
struct PET_SKILL_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				drop_model;					// 简化掉落模型
	int				file_icon;					// 图标路径

	int				id_skill;					// 技能id
	int				skill_level;				// 技能等级
	int				use_prob[3];				// 技能各等级使用概率，[0]为等级1使用概率

	int				learn_pet_level;			// 宠物级别要求
	int				learn_pet_summon_level;		// 学习要求宠物携带等级
	int				available_for_pet_category; // 技能适用的宠物类型，按位存储
	int				learn_bind_money;			// 学习花费绑定币
	int				learn_gold;					// 学习花费金币
	float			learn_prob;					// 学习成功率
	
	// 物品拆分通用属性
	ITEM_DECOMPOSE decompose;
	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// 宠物装备
////////////////////////////////////////////////////////////////////////////////////////
struct PET_ARMOR_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	unsigned int	equip_mask;					// 逻辑上可以装备的部位，由不同部位Mask组成，使用的部位代码为：
	int				file_model;					// 模型路径名
	int				file_model_l;				// 模型路径名左手
	int				file_matter;				// 掉在地上的模型路径
	int				file_icon;					// 图标路径

	int				normal_attack_sfx;			// 普通攻击时的音效路径
	int				put_in_sfx;					// 物品放入音效路径
	
	int				require_level;				// 等级限制
	unsigned int	require_race;				// 种族限制
	unsigned int	require_title;				// 头衔限制
	float			attack_range;				// 攻击距离

	int				hp;							// 生命基础值
	int				mp;							// 魔法基础值
	int				min_dmg;					// 最小攻击力基础值
	int				dmg_val;					// 攻击力浮动基础值
	int				defence;					// 防御力基础值
	int				attack;						// 命中基础值
	int				armor;						// 闪躲基础值
	
	int				random_quality_affix;		// 是否随机品质与前后缀
	int				id_quality;					// 固定品质
	int				id_prefix_addon_package;	// 固定前缀附加属性包
	int				id_postfix_addon_package;	// 固定后缀附加属性包

	int				id_equip_prop;				// 属性随机包ID模板

	unsigned int    sell_for_bind_money;			// 是否卖为绑定币
	int				price;						// 卖店价
	int				shop_price;					// 店卖价

	unsigned int	music_pick;					// 物品拾取音效
	unsigned int	music_drop;					// 物品掉落音效

	// 堆叠信息
	int				pile_num_max;				// 堆叠上限

	// 处理方式
	unsigned int	proc_type;
};

////////////////////////////////////////////////////////////////////////////////////////
// 宠物资质强化石
////////////////////////////////////////////////////////////////////////////////////////
struct PET_APTITUDE_STONE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称
	
	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介
	
	int				drop_model;					// 简化掉落模型
	int				file_icon;					// 图标路径
	
	int				pet_level_require;			// 宠物等级要求
	int				pet_summon_level_limit;		// 适用最高携带等级
	float			aptitude_add;				// 强化资质提升数值
	float			success_prob;				// 强化成功率
	int				cost_bind_money;			// 强化需要绑定币
	int				cost_gold;					// 强化需要金币
	
	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// 宠物技能提升石
////////////////////////////////////////////////////////////////////////////////////////
struct PET_SKILL_LEVEL_UP_STONE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称
	
	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介
	
	int				drop_model;					// 简化掉落模型
	int				file_icon;					// 图标路径
	
	int				skill_id;					// 技能ID
	int				skill_level_require;		// 需要技能等级
	int				pet_level_require;			// 宠物等级要求
	int				pet_summon_level_require;	// 宠物携带等级要求
	float			success_prob;				// 提升成功率
	int				cost_bind_money;			// 提升需要绑定币
	int				cost_gold;					// 提升需要金币
	
	// 物品拆分通用属性
	ITEM_DECOMPOSE decompose;
	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 宠物成长度提升石
////////////////////////////////////////////////////////////////////////////////////////
struct PET_GROWTH_STONE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称
	
	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介
	
	int				drop_model;					// 简化掉落模型
	int				file_icon;					// 图标路径
	
	int				type;						// 类别，0=攻击成长率，1=防御成长率，2=生命成长率
	int				point_add;					// 成长度提升值
	int				pet_summon_level_limit;		// 适用最高携带等级
	int				cost_bind_money;			// 提升需要绑定币
	int				cost_gold;					// 提升需要金币
	
	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// 宠物捕捉道具
////////////////////////////////////////////////////////////////////////////////////////
struct PET_CATCHER_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称
	
	int				item_level;					// 物品等级
	int				max_catch_level;			// 可捕捉目标的最大等级
	int				player_level_require;		// 使用需要人物等级
	float			target_hp_lower_than;		// 目标血量百分比限制

	float			success_prob;				// 成功率

	int				vocation_action_type;		// 使用时动作类型
	char			action[32];					// 使用配方时播放的动作

	// 物品拆分通用属性
	ITEM_DECOMPOSE decompose;
	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// 宠物饰品
////////////////////////////////////////////////////////////////////////////////////////
struct PET_ACCESSORY_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				model_path;					// 模型路径

	int				equip_position;				// 装备部位
	int				increase_max_action_point;	// 增加宠物体力上限
	int				enable_functionality;		// 开启宠物特殊功能

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// 跑商交易品
////////////////////////////////////////////////////////////////////////////////////////
struct TRADE_ITEM_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				file_matter;				// 掉在地上的模型路径
	int				file_icon;					// 图标路径

	int				category;					// 交易品分类
	int             id_producing_area;			// 原产地编号
	int				x;							// 原产地坐标x
	int				y;							// 原产地坐标y
	int				moneybag_type;				// 对应钱袋种类

	int				price;						// 基础价格（玩家卖出）
	int				shop_price;					// 基础店卖价（玩家买入）

	int				high_price_time;			// 价格指数>=100%时价格维持原始时间（秒）
	int				low_price_time;				// 价格指数<100%时价格维持原始时间（秒）
	int				profit_limit;				// 价格变动前允许利润量
	float			price_change_factor;		// 每次价格变动幅度
	float			max_price_factor;			// 价格指数上限
	float			min_price_factor;			// 价格指数下限
	int				required_repu_id;			// 购买此类交易品所需声望ID
	int				required_repu_value;		// 购买此类交易品所需声望值
	int				required_level;				// 购买此类交易品要求人物等级

	struct
	{
		int			distance;					// 距离
		float		price_factor_inc;			// 此区间内价值增值
	}dist_price[8];								// 商品距离1-8时价值增值

	float			max_price_inc_factor;		// 商品距离超过8时的价值增值

	unsigned int	music_pick;					// 物品拾取音效
	unsigned int	music_drop;					// 物品掉落音效

	// 堆叠信息
	int				pile_num_max;				// 堆叠上限

	// 处理方式
	unsigned int	proc_type;
};

///////////////////////////////////////////////////////////////////////////////////////
//	跑商钱袋
///////////////////////////////////////////////////////////////////////////////////////
struct MONEYBAG_ESSENCE
{
	unsigned int	id;							// (类型)ID
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				file_matter;				// 掉在地上的模型路径
	int				file_icon;					// 图标路径

	int				id_repu_exchange;			// 兑换的声望ID
	int				moneybag_type;				// 对应钱袋种类
	int				id_repu_inc1;				// 结束跑商时按照利润增加的声望1的ID
	int				id_repu_inc2;				// 结束跑商时按照利润增加的声望2的ID
	int				par_value_init;				// 钱袋面值初始值
	int				par_value_max;				// 钱袋面值上限
	int				undercut_bidup_limit;		// 允许砍价、抬价总次数
	int				splurge_limit;				// 允许一掷千金次数
	int				dur_time;					// 钱袋持续时间(秒)

	unsigned int    sell_for_bind_money;			// 是否卖为绑定币
	int				price;						// 卖店价
	int				shop_price;					// 店卖价

	unsigned int	music_pick;					// 物品拾取音效
	unsigned int	music_drop;					// 物品掉落音效

	// 堆叠信息
	int				pile_num_max;				// 堆叠上限

	// 处理方式
	unsigned int	proc_type;	
};

// 合成配方
struct MERGE_RECIPE_ESSENCE
{
	unsigned int		id;						// 合成配方本体ID
	namechar			name[32];				// 合成配方本体名称

	int					keep_time_prop;			// 是否保留第一物品时间属性
	int					keep_bind_prop;			// 是否保留第一物品绑定属性
	int					keep_refine_prop;		// 是否保留第一物品精炼属性
	int					keep_pstone_prop;		// 是否保留第一物品追加属性

	struct {
		float			probability;			// 生成概率
		int				id1;					// 生成的物品id
		int				num1;					// 生成的数量
		int				id2;					// 生成的物品id
		int				num2;					// 生成的数量
	} makes[4];

	struct
	{
		int					id_main;			// 主物品id
		int					num;
		int					rank;
	} mains[6];

	float				basic_prob;				// 基础成功概率
	int					fee;					// 手续费

	struct {
		int				id;						// 辅物品id
		float			probability;			// 辅物品增加的成功率

	} helpers[4];

	int				id_recipe;					// 采集需求和获得
};

///////////////////////////////////////////////////////////////////////////////////////
//
// 配方模板数据结构定义
//
//
///////////////////////////////////////////////////////////////////////////////////////

// 配方本体
struct RECIPE_ESSENCE
{
	unsigned int	id;							// 配方本体ID
	namechar		name[32];					// 配方本体名称


	namechar		type[16];					// 配方类别
	unsigned int	id_name_item;				// 使用了此物品，则生产的物品会属上生产者的名字。如果填0，则默认不使用此物品也属名。
	int				live_skill;					// 需要生活技能
	int				add_skillpoint;				// 增加的熟练度
	int				learn_need_money;			// 学习消耗金钱
	int				learn_need_exp;				// 学习消耗经验
	int				learn_need_live_skill_lvl;	// 学习需要技能等级
	int				learn_need_player_lvl;		// 学习需要玩家等级
	int				use_cost_money;				// 使用消耗金钱
	int				use_cost_repu_id;			// 使用消耗声望ID
	int				use_cost_repu_value;		// 使用消耗声望数值
	int				use_cost_produce_energy;	// 使用消耗精力值
	
	struct  
	{
		int			skillpoint_limit;			// 熟练度衰减上限
		float		attenuate_rate;				// 超过此上限衰减比率
	} point_attenuate[3];

	float			produce_time;				// 生产时间（秒）
	unsigned int	near_npc[3];				// 需在此NPC周围3米范围内，且的关系

	// 材料
	struct  
	{
		int			is_must_use;				// 材料是否必须，0否1是
		struct  
		{
			unsigned int	id_item;			// 材料ID
			int				weight;				// 材料权重
		}optional_material[6];
		int			need_num;					// 材料需要数量
		int			can_choose_num;				// 是否可选数量
		int			max_num;					// 可选数量上限
	}materails[6];

	// 结果
	struct  
	{
		int				weight;					// 结果权重
		struct
		{
			unsigned int	id_item;				// 产品ID
			int				num;					// 产品数量
			float			prob;					// 产品概率
		}
		drop_table[4],							// 结果掉落表
		extra_drop;								// 结果额外产品

		unsigned int	show_item;				// 显示产品
		unsigned int	show_item_num;			// 显示产品数量
	}results[8];

	int				vocation_action_type;		// 使用时动作类型
	char			action[32];					// 使用配方时播放的动作

	unsigned int	is_production_bind;			// 是否绑定产出
	int				extra_drop_table_id;		// 特殊额外产出掉落表ID
};

struct DROPTABLE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	unsigned int	is_fix_by_level;			// 是否受等级修正,0:false,1:true
	int				instance_difficulty;		// 对应副本难度等级

	struct  
	{
		unsigned int	special_item_id;		// 单独掉落物品ID
		int				special_item_num;		// 单独掉落物品数量
		float			special_item_ratio;		// 单独掉落物品概率
	}special_items[8];

	struct										// 掉落0~5个物品的概率
	{
		float		probability;

	} num_to_drop[5];

	struct										// 掉落物品列表
	{
		unsigned int	id_obj;					// 掉落物品id
		int				number;					// 掉落物品数量
		float			probability;			// 掉落概率

	} drops[64];

};

///////////////////////////////////////////////////////////////////////////////////////
//
// 怪物模板数据结构定义
//
//		注: 怪物只进行依据形象的小分类, 怪物的攻击策略则作为一个属性在个体中进行选择
//
//
///////////////////////////////////////////////////////////////////////////////////////

// 怪物本体属性
struct MONSTER_ESSENCE
{
	unsigned int	id;							// 怪物(类型)ID
	namechar		name[32];					// 名称

	namechar		title[16];					// 怪物称号前缀
	namechar		prop[16];					// 怪物属性, 最多16个汉字
	unsigned int	description;				// 怪物悬浮说明

	unsigned int	faction;					// 自己所属阵营组合代码，参见FACTION_MASK
	unsigned int	monster_faction;			// 怪物的详细派系划分
	unsigned int	monster_race;				// 怪物种族
	int				file_model;					// 模型路径名
	float			name_pos;					// 名字高度
	float			size;						// 大小
	unsigned int	name_color;					// 名字颜色
	int				file_icon;					// 目标头像资源文件
	int				armor_type;					// 被打击音效材质ID
	float			strong_min;					// 强壮系数最小值
	float			strong_max;					// 强壮系数最大值
	
	unsigned int	id_strategy;				// 怪物攻击策略ID
												// 0 表示物理肉搏类怪物
												// 1 表示物理弓箭类怪物
												// 2 表示魔法类怪物
												// 3 表示肉搏＋远程类怪物
												// 4 堡垒类
												// 5 场景活物类
												// 6 树桩类
												// 7 堡垒魔法类
												// 8 小偷怪
											
	unsigned int	is_player_shadow;			// 是否为玩家影子怪
	unsigned int	is_freeze_at_action;		// 是否动作静止于某帧
	namechar		freeze_at_action[16];		// 静止动作名
	int				freeze_at_frame;			// 静止动作帧数

	int				quest_kill_as;				// 附加任务计数怪物ID（任务杀怪时，将该怪物作为另一个怪物ID进行计数）
	unsigned int	is_public_task_counter;		// 是否判断任务公共计数（任务杀怪时，只要玩家攻击过怪物，在怪物死亡时就会给该玩家增加计数）

	int				level;						// 怪物等级
	int				is_level_selfadaptive;		// 是否自适应等级
	int				level_selfadaptive_range;	// 自适应等级浮动
	int				level_selfadaptive_max_level;	// 自适应最高等级
	int				exp_by_level_max_level;		// 匹配个人等级经验计算最高经验计算等级
	int				drop_by_level_max_level;	// 单独掉落最高掉落计算等级
	int				level_punish;				// 怪物惩罚等级
	int				hp_bar_count;				// 血条层数
	unsigned int	show_extra_hp_bar;			// 显示额外血条
	unsigned int    rank;						// 怪物阶级
												// 0 普通，头像边框无翅膀
												// 1 精英，头像边框银翅膀
												// 2 Boss，头像边框金翅膀
	unsigned int	log_type;					// log 类别
												// 0 普通怪物
												// 1 大地图头目怪
												// 2 大地图精英怪
												// 3 副本精英怪
												// 4 副本BOSS
												// 5 活动BOSS
	unsigned int	boss_type;					// BOSS类型 0 不是BOSS 1 普通BOSS 2 争夺BOSS
	unsigned int	is_rendering_stroke;		// 是否渲染描边
	unsigned int	is_show_special_ring;		// 是否显示稀有光圈
	unsigned int	is_play_attacked_effect;	// 是否受击变红
	unsigned int	is_play_attacked_action;	// 是否播放受击动作
	unsigned int	is_blown_on_dead;			// 是否死亡击飞
	unsigned int	id_adjust_config;			// 选择数据修正表ID
	unsigned int	name_panel;					// 姓名板类型：
												// 0: 无姓名板
												// 1: 大地图精英
												// 2: 大地图强力精英
												// 3: 副本精英
												// 4: 副本强力精英
												// 5: 组队BOSS（大地图副本通用）
	unsigned int	killed_exp;					// 被其杀死是否损失经验
	unsigned int	killed_drop;				// 被其杀死是否掉落物品
	int				exp_mode;					// 经验分配模式 0 队友分摊， 1 同时获得

	// 免疫类型，为Mask组合方式
	//  0暂缺	     1暂缺		  2暂缺          3暂缺	        4暂缺
	//  5暂缺        6暂缺        7免疫buff      8免疫debuff    9免疫浮空
	// 10免疫控制   11免疫任务   12免疫加血     13暂缺         14暂缺
	// 15暂缺       16免疫吸魂   17免疫特殊骑乘 18暂缺         19暂缺
	// 20暂缺       21暂缺       22暂缺         23暂缺         24免疫昏迷
	// 25免疫减速   26免疫定身   27免疫沉默     28免疫打断     29免疫持续伤害
	// 30免疫禁普攻 31免疫缴械
	unsigned int	immune_type;


	unsigned int	hide_aggressive_tag;		// 是否隐藏主动标识
	unsigned int	is_notify_hp;				// 是否通告血量
	unsigned int	show_name;					// 是否显示名字
	unsigned int	is_limited_show_name;		// 是否有显示名字范围和大小限制
	unsigned int	show_on_minimap;			// 是否显示在小地图上
	unsigned int	show_injured_info;			// 是否显示被伤害的信息
	unsigned int	show_damage_info;			// 是否显示伤害的信息
	unsigned int	can_selected;				// 是否能被选中
	unsigned int    can_select_by_tab;			// 是否能被tab选中
	unsigned int    auto_lock;					// 是否自动锁定
	unsigned int	show_hint;					// 是否显示悬浮
	unsigned int	show_target_of_target;		// 是否显示目标的目标
	int				id_circle;					// 作为目标时脚下的光圈id
	float			scale_circle;				// 作为目标时脚下的光圈放大倍数
	float			sight_range;				// 视野
	unsigned int    can_be_attack;				// 是否能被攻击
	unsigned int    is_guard;					// 是否卫兵
	
	unsigned int	aggressive_mode;			// 主被动选择：0 - 被动；1 - 主动
	unsigned int	help_request_mode;			// 求助模式：0-不求助，1-进入战斗时呼救，2-仅为被攻击对象时呼救
	float			help_request_range;			// 求助半径
	unsigned int	monster_faction_ask_help;	// 向哪些派系求助，从怪物详细派系中选择
	unsigned int	monster_faction_can_help;	// 接受哪些派系求助，从怪物详细派系中选择

	float			aggro_range;				// 仇恨距离
	float			attack_follow_range;		// 追击距离
	float			aggro_time;					// 仇恨时间
	float			aggro_half_decay;			// 仇恨减半间隔(秒)
	float			dead_aggro_time;			// 死亡仇恨清空时间

	unsigned int	patroll_mode;				// 巡逻方式，可能的有：随机走动，...
	float			patroll_range;				// 自动巡逻半径
	unsigned int	stand_mode;					// 站立方式，可能的有：四足站立、双足站立、悬空飞行等

	float			walk_speed;					// 慢速移动速度(M/S)
	float			run_speed;					// 快速移动速度(M/S)

	unsigned int	common_strategy;			// 怪物策略
	int				random_affix_pack;			// 怪物词缀随机包
	int				skills_for_affix[32];		// 词缀0-31对应技能id

	unsigned int	notify_task_failed_when_disapper; // 怪物消失通知失败的任务ID
	unsigned int	fight_shout;				// 进入战斗喊话文字描述包
	unsigned int	die_shout;					// 死亡喊话文字描述包
	unsigned int	is_fast;					// 是否高速
    unsigned int	time_refresh_default;		// 缺省刷新时间
	int				dead_body_exist_time;		// 死亡尸体存留时间
	unsigned int	after_death;				// 死亡后续：无-0、自爆-0x1、重生-0x2
	struct
	{
		int id;									// 场景参数ID
		int delta;								// 修正场景参数值
	}
	modify_scene_param_when_dead[4];			// 死亡时改变场景参数
	int				summon_monster_when_dead[4];// 死亡召唤怪物包
	
	float			money_drop_prob;			// 金钱掉落概率
	struct
	{
		int 			min;					// 随机下限
		int				max;					// 随机上限
		int				packs;					// 分堆数
	}
	common_bind_money_config,					// 公共掉落：绑定钱配置
	common_money_config;						// 公共掉落：非绑定钱配置
	struct
	{
		float 			min;					// 个人等级初始金钱系数：随机下限
		float			max;					// 个人等级初始金钱系数：随机上限
		int				packs;					// 分堆数
	}
	player_spec_bind_money_config,				// 个人等级掉落：绑定钱配置
	player_spec_money_config;					// 个人等级掉落：非绑定钱配置

	float			exp_factor;					// 经验值倍率
	unsigned int	is_release_stored_exp;		// 是否释放储存经验
	unsigned int	is_inc_team_shared_exp;		// 是否增加队伍分享经验
	int				hp;							// 生命力
	float			hp_factor;					// 生命值倍率
	int				hp_min;						// 最低生命值
	int				mp;							// 魔力
	struct  
	{
		int				fight_power;			// 斗气
		float			fight_power_rate;		// 斗气概率
	}fp[2];
	int				angry;						// 怒气
	int				exp;						// 经验
	int				exp2;						// 第二经验
	int				attack;						// 命中
	int				armor;						// 闪躲
	float			lucky_att_rate;				// 幸运一击率
	float			direct_att_rate;			// 直击率
	int				min_dmg;					// 最小攻击力
	int				max_dmg;					// 最大攻击力
	int				defense;					// 防御力
	float			damage_rate;				// 伤害倍率(%)
	float			phy_anti_rate;				// 物理伤害抗性(%)
	float			magic_anti_rate;			// 法术伤害抗性(%)
	float			crit_rate;					// 暴击率(%)
	float			anti_crit_rate;				// 减免暴击率(%)
	int				extra_crit_damage;			// 暴击附加伤害
	int				extra_crit_defance;			// 暴击附加伤害减免
	int				element_attack[5];			// 属性攻击力，地、水、火、风、雷
	float			element_anti[5];			// 属性抗性，地、水、火、风、雷
	float			element_damage_rate[5];		// 属性伤害倍率，地、水、火、风、雷
	float			resistance[10];				// 抗性，受控、妨害、失血、气绝、待定1、待定2、待定3、待定4、待定5、弱化
	float			ignor_resist[10];			// 抗性减免，受控、妨害、失血、气绝、待定1、待定2、待定3、待定4、待定5、弱化

	struct  
	{
		unsigned int	id_normal_attack;		// 普攻技能ID
		int				normal_attack_lvl;		// 普攻技能等级
		float			normal_attack_ratio;	// 普攻技能概率
	}normal_attack[2];

	float			normal_attack_follow_range;	// 普攻追击距离
	float			normal_attack_prob;			// 发起普攻概率
	float			normal_attack_factor;		// 普通攻击系数
	float			walk_around_prob;			// 发起绕行概率
	float			stand_by_prob;				// 发起原地等待概率
	int				walk_around_range;			// 绕行半径
	int				walk_around_range_fix;		// 绕行半径浮动
	int				walk_around_max_dist;		// 绕行最大距离
	int				walk_around_time;			// 绕行时间
	int				stand_by_time;				// 原地等待时间
	int				stand_by_dist;				// 原地等待距离

	unsigned int	soul_skill_id;				// 魂魄技能ID
	int				soul_skill_lvl;				// 魂魄技能等级
	
	unsigned int   combo_pack_id[8];			// 职业 1~8 满连技能包

	int				hp_gen1;					// 慢速回血速度
	int				hp_gen2;					// 快速回血速度
	int				mp_gen1;					// 慢速回魔速度
	int				mp_gen2;					// 快速回魔速度
	int				fp_gen1;					// 慢速回斗气速度
	int				fp_gen2;					// 快速回斗气速度
	float			smash;						// 重击
	float			parry;						// 招架
	float			penetration;				// 破甲
	float			shell;						// 护甲
	float			dmg_anti;					// 伤害抗性

	unsigned int	role_in_war;				// 城战中所扮演的角色
												// 0 无；1 中心建筑；2 炮塔；3 箭塔；4 投石车；5 传送点；6 复活点；7 服务NPC；8 占领标志物

	struct										// 影响玩家声望
	{
		int			id;							// 声望编号
		float		value;						// 声望数值
	} reputation[2];

	unsigned int	is_player_specific_drop;	// 掉落是否有玩家归属
	unsigned int	is_enable_drop_script;		// 是否通过脚本掉落
	int				id_drop_table[8];			// 掉落表 id
	int				drop_by_level_config_id[8];	// 按等级单独掉落配置模版id
	int				loot_bag_life_time;			// loot包持续时间（秒）
	unsigned int	is_loot_shared_in_raid;		// 掉落是否团队共享

	unsigned int	passive_skill;				// 怪物被动技能ID
	unsigned int	passive_skill_lvl;			// 怪物被动技能等级
	unsigned int	resource_value;				// 杀死后增加资源分
	unsigned int	score_value;				// 杀死后增加表现分
	unsigned int	monster_pet_type;			// 宠物相关选项

	unsigned int	catch_pet_reward_item[5];	// 使用1-5级捕捉道具后获得物品

	unsigned int	can_tame;					// 是否能被驯服
	unsigned int	tame_summon_pack;			// 驯兽成功时召唤包ID

	unsigned int	attack_player;				// 是否攻击玩家
	unsigned int	attack_list;				// 只攻击目标列表中的目标
	unsigned int	attack_targets[32];			// 特定攻击目标

	unsigned int	disappear_type;				// 消失表现 0=渐隐 1=瞬间 2=播放死亡动作
	unsigned int	death_type;					// 死亡表现 0=渐隐 1=瞬间 2=播放死亡动作

	int				auto_select_priority;		// 自动选怪优先级
};

// 系统邮件
struct SYSTEM_MAIL_CONFIG
{
	unsigned int	id;							// id 
	namechar		name[32];					// 名称

	namechar		sender[16];					// 发件人
	namechar		title[16];					// 主题
	unsigned int	content;					// 邮件内容
	unsigned int	item_id;					// 附带物品ID
	int				item_count;					// 附带物品数量
	int				money;						// 附带金币数
};

//特殊物品包
struct SPECIAL_ITEMS_PACK_ESSENCE
{	
	unsigned int	id;							// id
	namechar		name[32];					// 名称
	
	int  id_human_warrior_male;		// 人类战士男获得物品id
	int  id_human_warrior_female;	// 人类战士女获得物品id
	int  id_human_thief_male;		// 人类刺客男获得物品id
	int  id_human_thief_female;		// 人类刺客女获得物品id
	int  id_human_enchanter_male;	// 人类法师男获得物品id
	int  id_human_enchanter_female;	// 人类法师女获得物品id
	int  id_human_priest_male;		// 人类牧师男获得物品id
	int  id_human_priest_female;	// 人类牧师女获得物品id
	int  id_elf_warrior_male;		// 精灵战士男获得物品id
	int  id_elf_warrior_female;		// 精灵战士女获得物品id
	int  id_elf_priest_male;		// 精灵牧师男获得物品id
	int  id_elf_priest_female;		// 精灵牧师女获得物品id
	int  id_elf_poet_male;			// 精灵诗人男获得物品id
	int  id_elf_poet_female;		// 精灵诗人女获得物品id
	int  id_dwarf_gunman_male;		// 矮人火枪男获得物品id
	int  id_dwarf_gunman_female;	// 矮人火枪女获得物品id			
	int  id_giant_warrior_male;		// 巨人守护者男获得物品id
	int  id_vampire_thief_male;		// 血族刺客男获得物品id
	int  id_vampire_thief_female;	// 血族刺客女获得物品id
	int  id_vampire_enchanter_male;	// 血族法师男获得物品id
	int  id_vampire_enchanter_female;// 血族法师女获得物品id
	int  id_vampire_blood_male;		// 血族血魔男获得物品id
	int  id_vampire_blood_female;	// 血族血魔女获得物品id
};

// ESSENCE add here

///////////////////////////////////////////////////////////////////////////////////////
//
// NPC模板数据结构定义
//
//		注: NPC本体具有相同的数据结构，而NPC能够提供的服务则作为一个属性加入到NPC本体中，
//			具体服务相关的数据，如：卖东西时的物品列表等，则作为服务的属性存在服务模板中
//			
//		根据目前的了解，服务一共分以下几类：
//
///////////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////////
//
// NPC服务模板数据结构定义
//
///////////////////////////////////////////////////////////////////////////////////////

// 交谈服务
struct NPC_TALK_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称	

	unsigned int	id_dialog;					// 对话ID
};

// 出售商品的服务
struct NPC_SELL_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称

	int				ui_show_item_id;			// 显示拥有物品ID
	unsigned int	is_ui_show_repu;			// 是否显示声望
	int				ui_show_repu_id;			// 显示声望ID

	struct
	{
		namechar		page_title[8];			// 页的名字，最多7个汉字
		unsigned int	id_goods[48];			// 可出售的商品列表

	} pages[8];									// 按页方式存储的商品列表
};

// 收购商品的服务
struct NPC_BUY_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称	

	unsigned int	id_dialog;					// 对话ID
};

// 发放任务服务
struct NPC_TASK_OUT_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称	

	unsigned int	id_task_set;				// 任务库号

	// 任务刷新条件
	unsigned int	auto_refresh_type;			// 自动刷新时间点  (0每日，1每周)
	unsigned int	hand_refresh_type;			// 手动刷新方式  (0无，1金钱，2绑定金钱，3物品)
	unsigned int	id_pre_task;				// 库前提任务
	int				accept_max;					// 库任务接取数量上限
	int				need_league_auth;			// 任务库需要军团长开启
	int				ui_type;					// 库任务界面类型 (0环任务，1库任务)
	int				refresh_scope;				// 库任务刷新类型 (0个人刷新，1公共刷新)
	int				refresh_count;				// 刷新任务库任务数量
	int				need_money;					// 刷新任务库所需金钱数
	int				need_bind_money;			// 刷新任务库所需绑定金钱数
	unsigned int	need_item_id;				// 刷新任务库所需物品ID
	int				need_item_num;				// 刷新任务库所需物品数量

	unsigned int	id_tasks[256];				// 可以处理的任务列表
};

// 验证完成任务服务
struct NPC_TASK_IN_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称	

	unsigned int	id_tasks[256];				// 可以处理的任务列表
};

// 发放任务物品服务
struct NPC_TASK_MATTER_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称	

	struct
	{
		unsigned int	id_task;				// 可以处理的任务列表
		struct
		{
		unsigned int	id_matter;				// 任务相关物品id
		int				num_matter;				// 任务相关物品数目
		} taks_matters[4];

	} tasks[16];
};

// 治疗服务
struct NPC_HEAL_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称

	unsigned int	id_dialog;					// 对话ID
};

// 传送服务
struct NPC_TRANSMIT_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称

	unsigned int	bind_return_town;			// 是否可绑定为回程点
	int				id_target[16];				// 目标传送点id

	struct {
		int			id_line;					// 目标点分线ID
		int			id_world;					// 目标点世界ID
		namechar	name[256];					// 目标点名称1
		float		x;							// 目标点x坐标
		float		y;							// 目标点y坐标
		float		z;							// 目标点z坐标
		int			fee;						// 费用
		int			required_level;				// 等级要求
	} targets[16];

	unsigned int	id_dialog;					// 对话ID
};

// 代售服务
struct NPC_PROXY_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称

	unsigned int	id_dialog;					// 对话ID
};

// 存储物品、金钱
struct NPC_STORAGE_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称
};

// 城战炮塔建造服务
struct NPC_WAR_TOWERBUILD_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称

	struct 
	{
		int				id_in_build;				// 建造中的对象id
		int				id_buildup;					// 建造完成后的对象id
		int				id_object_need;				// 所需要的物品
		int				time_use;					// 建造所需的时间
		int				fee;						// 建造所需的费用

	} build_info[4];
};

// 洗点服务
struct NPC_RESETPROP_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称

	struct 
	{
		int				id_object_need;			// 所需要的物品
		int				resetprop_type;			// 洗点方式
	} prop_entry[6];
};

// 装备绑定服务
struct NPC_EQUIPBIND_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称

	int				id_object_need;				// 所需要的物品
	int				price;						// 所需要的钱
};

// 装备销毁服务
struct NPC_EQUIPDESTROY_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称

	int				id_object_need;				// 所需要的物品
	int				price;						// 所需要的钱
};

// 装备解除销毁服务
struct NPC_EQUIPUNDESTROY_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称

	int				id_object_need;				// 所需要的物品
	int				price;						// 所需要的钱
};

// 旅店服务
struct NPC_HOTEL_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称

	int				id_world;					// 目标点世界ID
	float			x;							// 目标点x坐标
	float			z;							// 目标点z坐标
	float			y;							// 目标点y坐标
};

// 生产学习服务
struct NPC_LEARN_PRODUCE_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称

	struct
	{
		int				produce_skill;			// 生活技能ID
		int				learn_cost_money;		// 学习花费金钱
	} info[32];
};

// 学习技能服务
struct NPC_LEARN_SKILL_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称

	int				ui_index;					// 学习技能界面编号
	int				level_required;				// 要求玩家等级
	int				repu_required_id;			// 要求声望值编号
	int				repu_required_val;			// 要求声望值数值
	int				id_skill[32];				// 教授技能的模板ID
};

// 职业选择服务
struct PROF_SELECT_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称

	unsigned int	prof_mask;					// 可选职业mask
	unsigned int	task_id;					// 关联任务id
};

// 跑商港口服务
struct NPC_TRADE_PORT_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称

	int				id_port;					// 港口编号
	int				x;							// 港口位置坐标x
	int				y;							// 港口位置坐标y
	int				moneybag_type;				// 对应钱袋种类
	float			high_price_time_factor;		// 价格指数>=100%时价格维持时间系数
	float			low_price_time_factor;		// 价格指数<100%时价格维持时间系数
	float			profit_limit_factor[16];	// 1-16类交易品价格变动前允许利润量系数

	struct
	{
		int			id;							// 交易品模板ID
		float		max_price_factor_inc;		// 价格指数上限提高
	}popular[10];								// 最受欢迎货物1-10

	int				id_news;					// 对应的八卦排行榜ID
	int				event_type;					// 事件类型

	struct
	{
		int			id;							// 交易品模板ID
		int			number;						// 出货量
	}goods[20];									// 本港口出售跑商交易品1-20
};

// 切换主副职业服务
struct NPC_SWITCH_PROF_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称
	
	unsigned int    id_items;                   // 需要道具id
	int             items_num;					// 需要道具数量
	int				money;						// 需要金币数量
	int             bind_money;					// 需要绑定币数量
	unsigned int    id_repu;					// 需要声望id
	int				repu_num;					// 需要声望数量
};

// 副本服务
struct NPC_DUNGEON_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称

	unsigned int	dungeon_list[16];			// 副本模板ID
};

// 战场服务
struct NPC_BATTLE_FIELD_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称

	unsigned int	battle_field_list[8];		// 战场模板ID
};

// 限量出售服务
struct NPC_LIMITED_SALE_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称

	int				refresh_interval;			// 商品刷新间隔（秒）
	struct
	{
		float		empty_prob;					// 组内不出现物品权重
		struct  
		{
			int		id;							// 物品ID
			float	prob;						// 物品出现权重
			int		count_min;					// 物品刷新数量下限
			int		count_max;					// 物品刷新数量上限
		}
		items[8];								// 组内1-8个物品
	}
	groups[8];									// 共1-8个物品组
};

// 铭刻服务
struct NPC_IMPRINT_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称

	int				server_index;				// 服务器序号
	int				max_text_length;			// 字数限制
	struct
	{
		int			cost_item;					// 消耗物品ID
		int			cost_item_count;			// 消耗物品数量
	}
	prioriy[3];									// 铭刻优先级1-3，数字越大优先级越高
};

// 物品兑换服务
struct NPC_ITEM_EXCHANGE_SERVICE
{
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称

	struct
	{
		namechar		page_title[16];			// 分页名称
		unsigned int	item_exchange_conf_list[32]; // 物品兑换配置1-32
	}
	pages[8];									// 分页1-8 
};

// 势力选择服务
struct NPC_FORCE_SELECT_SERVICE
{
	enum ForceMask
	{
		FORCE_NONE		= 0x1,					// 无势力
		FORCE_ATHENA	= 0x2,					// 圣域
		FORCE_POSEIDON	= 0x4,					// 海皇
		FORCE_HADES		= 0x8,					// 冥王
	};
	unsigned int	id;							// 服务(类型)ID
	namechar		name[32];					// 名称

	unsigned int	force_mask;					// 参见ForceMask	
};

// SERVICE add here

// NPC类型定义
struct NPC_TYPE
{
	unsigned int	id;							// (类型)ID
	namechar		name[32];					// 名称	
};

struct NPC_SUB_TYPE
{
	unsigned int	id;							// (类型)ID
	namechar		name[32];					// 名称	
};

///////////////////////////////////////////////////////////////////////////////////////
//
// NPC本体模板数据结构定义
//
///////////////////////////////////////////////////////////////////////////////////////
struct NPC_ESSENCE
{
	unsigned int	id;							// NPC(类型)ID
	namechar		name[32];					// 名称

	unsigned int	monster_race;				// NPC种族
	unsigned int	description;                // NPC悬浮说明
	namechar        name_prof_prefix[16];       // NPC职业前缀
	namechar        name_prof_postfix[16];	    // NPC职业后缀
	float			name_pos;					// 名字高度

	float			refresh_time;				// 刷新时间

	int				head_icon;					// 头顶功能图标
	int				map_ui_icon;				// M图显示图标
	unsigned int	is_rendering_stroke;		// 是否渲染描边
	unsigned int	show_on_minimap;			// 是否显示在小地图上
	unsigned int	is_visiable_on_whole_map;	// 全地图可见
	unsigned int	show_injured_info;			// 是否显示被伤害的信息
	unsigned int	show_damage_info;			// 是否显示伤害的信息
	unsigned int	can_selected;				// 是否能被选中
	unsigned int	show_hint;					// 是否显示悬浮
	unsigned int    can_talk;					// 是否可以对话
	unsigned int    is_close_up_when_talk;		// 对话时是否拉近镜头
	unsigned int	can_turn_round;				// 是否可以转身
	unsigned int	check_visible_by_lua;		// 是否由脚本控制客户端隐身
	unsigned int	character_combo_id;			// 可用学习主副技能服务的职业

	int				file_model;					// 模型路径名
	int				file_icon;					// 图标路径

	unsigned int	id_src_monster;				// 基本属性来自的怪物ID，非零时表示使用该怪物属性替换本NPC的属性
	unsigned int    rank;						// NPC阶级

	int				id_circle;					// 作为目标时脚下的光圈id
	float			scale_circle;				// 作为目标时脚下的光圈放大倍数

	unsigned int	hello_text;					// 开场白，是一个多行文本

	int				service_using_type;			// 服务使用权限

	// 服务列表
	unsigned int	id_talk_service;			// 交谈的服务ID
	unsigned int	id_sell_service;			// 出售商品的服务ID
	unsigned int	id_limited_sale_service;	// 限量出售的服务ID
	unsigned int	id_learn_produce;			// 学习生产的服务
	unsigned int	id_task_out_service;		// 任务相关的服务ID: 发放任务服务
	unsigned int	id_task_in_service;			// 任务相关的服务ID: 验证完成任务服务
	unsigned int	id_transmit_service;		// 传送的服务ID
	unsigned int	id_prof_service;			// 职业选择服务
	unsigned int	id_skill_learn_service;		// 技能学习服务
	unsigned int	id_recipe_service;			// 配方合成服务
	unsigned int	instance_service;			// 剧本报名服务
	unsigned int	dungeon_service;			// 副本服务
	unsigned int	battle_field_service;		// 战场服务
	unsigned int	imprint_service;			// 铭刻服务
	unsigned int	item_exchange_service;		// 物品兑换服务
	unsigned int	force_select_service;		// 势力选择服务

	// 简单服务组合：其中的每一位代表一个不需要参数的服务
	// [0] 参见NPC_SIMPLE_SERVICE
	// [1] 目前无用
	unsigned int	combined_services[2];

	int				id_ai_script;               // AI脚本id
	unsigned int	collision_in_server;		// 是否参与碰撞

	unsigned int	mouse_type;					// 鼠标光标类型
	unsigned int	dialog_type;				// 对话框类型

};

///////////////////////////////////////////////////////////////////////////////////////
//
// 矿本体模板数据结构定义
//
///////////////////////////////////////////////////////////////////////////////////////
struct MINE_ESSENCE
{
	unsigned int	id;							// 矿(类型)ID
	namechar		name[32];					// 名称
						  
	unsigned int	item_quality;				// 物品品质
	unsigned int	level_min;					// 等级下限
	unsigned int	level_max;					// 等级上限
	int				refresh_time;				// 刷新时间（秒）
	unsigned int	is_show_tip;				// 是否悬浮显示矿物名
	unsigned int    mine_find_type;				// 寻矿类型
	unsigned int	id_equipment_required;		// 所需要的工具类型
	unsigned int	eliminate_tool;				// 消耗采掘用具(true or false)
	unsigned int	time_min;					// 采矿时间下限（秒）
	unsigned int	time_max;					// 采矿时间上限（秒）

	unsigned int	need_live_skill_id;			// 需要生活技能ID
	int				need_live_skill_lvl;		// 需要生活技能等级

	int				smart_camera_on_start;		// 采集时调用镜头控制ID
	int				smart_camera_on_success;	// 采集成功调用镜头控制ID

	unsigned int	need_buff;					// 采集需要的前提BUFF
	unsigned int	exclusive_buff;				// 采集的互斥BUFF
	unsigned int	cast_on_gather_begin;		// 采集开始时触发技能
	unsigned int	cast_on_gather_success;		// 采集成功后触发技能
	unsigned int	cast_on_success_level;		// 采集成功后触发技能等级

	int				skillpoint;					// 每次采集所获的熟练度基础值

	struct  
	{
		int			skillpoint_limit;			// 熟练度衰减上限
		float		attenuate_rate;				// 超过此上限衰减比率
	} point_attenuate[3];

	int				file_matter;				// 模型路径名
	int				cursor_type;				// 鼠标悬浮类型
	unsigned int	is_need_roll;				// 拾取时是否ROLL点

	unsigned int	drop_table[4];				// 掉落表
	unsigned int	is_drop_to_bag;				// 掉落是否直接进包

	unsigned int	task_in;					// 需要的任务id
	unsigned int	task_out;					// 采集后相关任务id

	unsigned int	uninterruptable;			// 采集过程不可中断, false-可以中断, true-不可中断
	unsigned int	is_unmount_on_gather;		// 采集时取消骑乘和飞行
	unsigned int	id_summon_pack;				// 怪物NPC召唤包ID

	struct 
	{
		unsigned int	monster_faction;		// 仇恨的怪物详细派系
		float			radius;					// 仇恨半径（米）
		int				num;					// 仇恨数值
	} aggros[1];

	unsigned int	role_in_war;				// 城战中所扮演的角色
												// 0 无；1 中心建筑；2 炮塔；3 箭塔；4 投石车；5 传送点；6 复活点；7 服务NPC；8 占领标志物

	int				map_ui_icon;				// M图显示图标

	unsigned int	permenent;					// 采集后矿物不消失，false-消失，true-不消失

	unsigned int	activate_controller_mode;	// 开启怪物控制器方式
	unsigned int	activate_controller_id[4];	// 开启怪物控制器id

	unsigned int	deactivate_controller_mode;	// 关闭怪物控制器方式
	unsigned int	deactivate_controller_id[4];// 关闭怪物控制器id

	int				vocation_action_type;		// 采集时动作类型
	char			action[32];					// 采集时播放的动作名

	unsigned int	sound;						// 采集时音效
	char			mine_action[32];			// 矿物动作
	float			colddown;					// 冷却时间(秒)
	float			protect_time_on_born;		// 出生保护时间（秒）

	unsigned int	is_show_progress;			// 是否显示进度条
	namechar		progress_desc[16];			// 进度条显示文字
	int				is_show_collectable_effect;	// 是否显示可采集光效

	unsigned int	desc;						// 矿物描述
	int				hide_when_uncollectable;	// 不可采集时隐藏
	int				is_multiple;				// 是否可以多人采集
	int				times_min;					// 矿物可采集次数下限
	int				times_max;					// 矿物可采集次数上限
	float			prop_eliminate;				// 消耗采掘用具概率
	int				idRegisterName;				// 采矿成功时发送事件给注册名称id
	int				idParam1;					// 事件参数1
	int				idParam2;					// 事件参数2

	unsigned int	is_faction_limited;			// 采集是否有阵营限制
	struct
	{
		int			faction;					// 允许采集的阵营Mask, 参见FACTION_MASK
		int			activate_controller;		// 该阵营采集时开启的怪物控制器
	} faction_cfg[3];
};

// 传送盒子
struct TRANSMITBOX_ESSENCE
{
	unsigned int	id;					// 传送盒子(类型)ID
	namechar		name[32];			// 名称, 最多15个汉字
	
	int				shape;				// 类型（0、球体；1、圆柱；2、待补充）
	float			radius;				// 有效区域半径
	float			height;				// 有效高度
	int				line_id;			// 目标点分线ID
	int				target_world;		// 目标世界ID
	float			target_pos_x;		// 目标世界坐标x
	float			target_pos_y;		// 目标世界坐标y
	float			target_pos_z;		// 目标世界坐标z
	unsigned int	faction;			// 自己所属阵营组合代码，参见FACTION_MASK
	int				level_req;			// 角色等级需求
	unsigned int	task_req;			// 已领取任务前提
	int				dungeon_config_id;	// 触发副本模板ID
};

// 对话过程对象
struct talk_proc
{
	namechar			text[64];					// 对话的第一个窗口的提示文字，最多63个汉字

	struct option
	{
		unsigned int	id;							// 选项链接的子窗口或功能ID, 如果最高位为1表示是一个预定义的功能, 为0表示一个子窗口
		namechar		text[64];					// 选项链接的提示文字，最多19个汉字
		unsigned int	param;						// 选项相关的参数
		int				param_addon;                // 额外的参数
	};

	struct window
	{
		unsigned int	id;							// 窗口ID, 最高位不能为1
		unsigned int	id_parent;					// 父窗口ID, 为-1表示根窗口

		int				talk_text_len;				// 对话文字的长度
		namechar * 		talk_text;					// 对话文字

		int				num_option;					// 选项数目
		option *		options;					// 选项列表

		window() 
		{
			options = 0;
			
			talk_text_len = 0;
			talk_text = NULL;
		}

		~window()
		{
			delete [] options;
			options = 0;
			delete [] talk_text;
			talk_text = 0; 
		}

		int save(FILE * fp)
		{
			fwrite(&id, sizeof(id), 1, fp);
			fwrite(&id_parent, sizeof(id_parent), 1, fp);

			fwrite(&talk_text_len, sizeof(talk_text_len), 1, fp);
			fwrite(talk_text, sizeof(namechar), talk_text_len, fp);

			fwrite(&num_option, sizeof(num_option), 1, fp);
			fwrite(options, sizeof(option), num_option, fp);
			return 0;
		}

		int save(std::iostream& io)
		{
			io.write((char*)&id, sizeof(id));
			io.write((char*)&id_parent, sizeof(id_parent));

			io.write((char*)&talk_text_len, sizeof(talk_text_len));
			io.write((char*)talk_text, sizeof(namechar) * talk_text_len);

			io.write((char*)&num_option, sizeof(num_option));
			io.write((char*)options, sizeof(option) * num_option);

			return 0;
		}

		int load(FILE * fp, int ver)
		{
			fread(&id, sizeof(id), 1, fp);
			fread(&id_parent, sizeof(id_parent), 1, fp);

			fread(&talk_text_len, sizeof(talk_text_len), 1, fp);
			talk_text = new namechar[talk_text_len];
			fread(talk_text, sizeof(namechar), talk_text_len, fp);

			fread(&num_option, sizeof(num_option), 1, fp);
			if (ver != -1 && ver < 128)
			{
				struct option_old
				{
					unsigned int	id;				
					namechar		text[64];		
					unsigned int	param;			
				};

				option_old* p = new option_old[num_option];
				fread(p, sizeof(option_old), num_option, fp);

				options = new option[num_option];
				memset(options,0, sizeof(option)*num_option);

				for (int i=0; i<num_option; i++)
				{
					options[i].id = p[i].id;
					memcpy(options[i].text, p[i].text, sizeof(namechar)*64);
					options[i].param = p[i].param;
				}

				delete[] p;
			}
			else 
			{
				options = new option[num_option];
				fread(options, sizeof(option), num_option, fp);
			}
			
			return 0;
		}

		int load(std::iostream& io, int ver)
		{
			io.read((char*)&id, sizeof(id));
			io.read((char*)&id_parent, sizeof(id_parent));

			io.read((char*)&talk_text_len, sizeof(talk_text_len));
			talk_text = new namechar[talk_text_len];
			io.read((char*)talk_text, sizeof(namechar) * talk_text_len);

			io.read((char*)&num_option, sizeof(num_option));
			if (ver != -1 && ver < 128)
			{
				struct option_old
				{
					unsigned int	id;				
					namechar		text[64];		
					unsigned int	param;			
				};

				option_old* p = new option_old[num_option];
				io.read((char*)p, sizeof(option_old) * num_option);

				options = new option[num_option];
				memset(options, 0, sizeof(option)*num_option);

				for (int i=0; i<num_option; i++)
				{
					options[i].id = p[i].id;
					memcpy(options[i].text, p[i].text, sizeof(namechar)*64);
					options[i].param = p[i].param;
				}

				delete[] p;
			}
			else 
			{
				options = new option[num_option];
				io.read((char*)options, sizeof(option) * num_option);
			}

			return 0;
		}
	};

	unsigned int		id_talk;				// 对话对象的ID

	int					num_window;				// 带对话文字的窗口个数
	window *			windows;				// 带对话文字的窗口
	
	talk_proc()
	{
		id_talk		= 0;
		num_window	= 0;
		windows		= 0;
	}

	~talk_proc()
	{
		delete [] windows;
		windows = 0;
		num_window = 0;
	}

	// 存盘读盘
	int save(FILE * fp)
	{
		fwrite(&id_talk, sizeof(id_talk), 1, fp);
		fwrite(text, sizeof(text), 1, fp);

		fwrite(&num_window, sizeof(num_window), 1, fp);
		for(int i=0; i<num_window; i++)
			windows[i].save(fp);
		
		return 0;
	}

	int save(std::iostream& io)
	{
		io.write((char*)&id_talk, sizeof(id_talk));
		io.write((char*)text, sizeof(text));
		io.write((char*)&num_window, sizeof(num_window));

		for(int i=0; i<num_window; i++)
			windows[i].save(io);

		return 0;
	}

	int load(FILE * fp, int ver = -1)
	{
		fread(&id_talk, sizeof(id_talk), 1, fp);
		fread(text, sizeof(text), 1, fp);

		fread(&num_window, sizeof(num_window), 1, fp);
		windows = new window[num_window]; 
		for(int i=0; i<num_window; i++)
			windows[i].load(fp, ver);

		return 0;
	}

	int load(std::iostream& io, int ver = -1)
	{
		io.read((char*)&id_talk, sizeof(id_talk));
		io.read((char*)text, sizeof(text));

		io.read((char*)&num_window, sizeof(num_window));
		windows = new window[num_window]; 
		for(int i=0; i<num_window; i++)
			windows[i].load(io, ver);

		return 0;
	}
};

///////////////////////////////////////////////////////////////////////////////////////
// 系统配置文件类模板
///////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
// 阵营敌对列表
///////////////////////////////////////////////////////////////////////////////////////
struct ENEMY_FACTION_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字

	unsigned int	enemy_factions[32];		// 参见FACTION_MASK
											// 0 - 普通玩家的敌对阵营列表
											// 1 - 白名状态的敌对阵营列表
											// 2 - 红名状态的敌对阵营列表
											// 3 - 蓝名状态的敌对阵营列表
											// 4 - 城战攻方的敌对阵营列表
											// 5 - 城战守方的敌对阵营列表
											// 6 - 城战攻方友军的敌对阵营列表
											// 7 - 城战守方友军的敌对阵营列表
											// 8 - 普通怪物的敌对阵营列表
											// 9 - 普通NPC(功能、任务、守卫)的敌对阵营列表
											// 10 - 怪物派系1的敌对阵营列表
											// 11 - 怪物派系2的敌对阵营列表
											// 12 - 自敌对怪物
											// 13 - 中立NPC
											// 14 - 邪恶怪物
};

///////////////////////////////////////////////////////////////////////////////////////
// 职业属性列表
///////////////////////////////////////////////////////////////////////////////////////
struct CHARRACTER_CLASS_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字

	unsigned int	character_class_id;		// 职业id

	int				attack_skill_id;		// 普攻技能
	float			attack_range;			// 普攻距离
	unsigned int	unarmed_normal_attack_skill_id;		// 空手普攻技能ID

	int				permit_second_prof;		// 对应第二职业

	struct  
	{
		int				level_required;			// 所需角色等级
		float			hp;						// 初始生命力
		float			mp;						// 初始体力值
		float			fight_power;			// 初始斗气
		float			angry;					// 初始怒气
		float			min_att;				// 初始最小攻击力
		float			max_att;				// 初始最大攻击力
		float			defence;				// 初始防御力
		float			attack;					// 初始命中
		float			armor;					// 初始闪躲
		float			crit_rate;				// 初始致命一击率(%)
		float			anti_crit_rate;			// 初始减免致命一击率(%)
		int				extra_crit_damage;		// 初始暴击附加伤害
		int				extra_crit_defance;		// 初始暴击附加伤害减免
		float			element_dmg[5];			// 初始属性攻击力，地、水、火、风、雷
		float			element_anti[5];		// 初始属性抗性
		float			element_anti_reduce[5];	// 初始属性抗性减免
		float			condition_rate[10];		// 初始状态抗性，受控、妨害、失血、气绝、待定1、待定2、待定3、待定4、待定5、弱化
		float			condition_anti[10];		// 初始状态忽视抗性，受控、妨害、失血、气绝、待定1、待定2、待定3、待定4、待定5、弱化

		float			lvlup_hp;					// 每升一级所增长的生命力
		float			lvlup_mp;					// 每升一级所增长的体力值
		float			lvlup_fight_power;			// 每升一级增长的斗气
		float			lvlup_angry;				// 每升一级所增长的怒气
		float			lvlup_min_att;				// 每升一级所增长的最小攻击力
		float			lvlup_max_att;				// 每升一级所增长的最大攻击力
		float			lvlup_defence;				// 每升一级所增长的防御力
		float			lvlup_attack;				// 每升一级所增长的命中
		float			lvlup_armor;				// 每升一级所增长的闪躲
		float			lvlup_crit_rate;			// 每升一级所增长的致命一击率(%)
		float			lvlup_anti_crit_rate;		// 每升一级所增长的减免致命一击率(%)
		int				lvlup_extra_crit_damage;	// 每升一级所增长的暴击附加伤害
		int				lvlup_extra_crit_defance;	// 每升一级所增长的暴击附加伤害减免
		float			lvlup_element_dmg[5];		// 每升一级所增长的属性攻击力，地、水、火、风
		float			lvlup_element_anti[5];		// 每升一级所增长的属性抗性
		float			lvlup_element_anti_reduce[5];	// 每升一级所增长的属性抗性减免
		float			lvlup_condition_rate[10];	// 每升一级所增长的状态抗性，沉默、混乱、中毒、流血、灼烧、倒地、冰冻、石化、减速、虚弱
		float			lvlup_condition_anti[10];	// 每升一级所增长的状态忽视抗性，沉默、混乱、中毒、流血、灼烧、倒地、冰冻、石化、减速、虚弱
	}data[10];

	float			lucky_att;				// 幸运一击率
	float			direct_att;				// 直击率
	float			damage_rate;			// 伤害倍率
	float			phy_dmg_anti;			// 物理伤害抗性
	float			magic_dmg_anti;			// 法术伤害抗性
	int				fixed_cure;				// 被治疗效果固定值
	float			cure_rate;				// 被治疗效果百分比
	float			element_att_ratio[5];	// 属性攻击力系数，地、水、火、风、雷

	float			walk_speed;				// 行走速度(M/S)
	float			run_speed;				// 奔跑速度(M/S)
	int				hp_gen[2];				// 非战斗状态中HP恢复速度
											// 战斗状态中HP恢复速度
	int				mp_gen[2];				// 非战斗状态中MP恢复速度
											// 战斗状态中MP恢复速度
	int				fight_power_gen[2];		// 非战斗状态中斗气恢复速度
											// 战斗状态中斗气恢复速度
	int				angry_gen[2];			// 非战斗状态中怒气恢复速度
											// 战斗状态中怒气恢复速度

	int				max_combo;				// 连击最高点数
	unsigned int	is_clear_combo_when_target_changed; // 切换目标是否清连击数
	int				combo_clear_time;		// 清连击数的间隔时间（秒）
	int				energy_point_generation;// 连击生成豆周期数
	int				max_energy_points;		// 豆数量上限
	int				energy_points_duration;	// 豆持续时间
	int				energy_points_clear_time;// 脱战后清豆时间

	struct  
	{
		int			value;					// 职业能量
		int			gen[2];					// 职业能量战斗外/战斗内恢复速度
	}
	prof_spec_energy[2];					// 职业能量1-2

	float			smash;					// 重击
	float			parry;					// 招架
	float			penetration;			// 破甲
	float			shell;					// 护甲
	int				exhaust_qte_skill_id[4];// 力竭QTE技能ID
	int				dash_skill_id[4];		// 双击移动按键施放技能id ([0]前 [1]后 [2]左 [3]右)
	int				cosmos_burst_skill_id;	// 小宇宙爆发技能id
	struct
	{
		int player_lv;						// 小宇宙升级所需人物等级
		int exp;							// 小宇宙升级所需经验
		int talent_sum;						// 小宇宙升级所需心法加点总和
		unsigned int item_id;				// 小宇宙升级所需物品ID
		int item_num;						// 小宇宙升级所需物品数量
	}cosmos[20];							// 小宇宙升级1~20级

	int				init_skill_id[32];		// 职业天生技能

	struct
	{
		int level_req;						// 区间需求玩家等级
		struct
		{
			int fight_power_req;			// 翅膀需求战斗力
			int saint_cloth_wing[4];		// 战斗力翅膀id，0-青铜 1-白银 2-黄金 3-神圣衣，请参考CLOTH_CONFIG::category
			int fasion_wing;				// 时装翅膀id
		}
		wings[6];							// 翅膀1-3
	}
	wing_sections[6];						// 翅膀区间1-3

	struct
	{
		int skill_id;						// 普攻技能
		int skill_level;					// 普攻技能等级
		float prob;							// 普攻技能概率
	}
	shadow_monster_attack_skill[2];			// 混乱用影子怪普攻技能
};

///////////////////////////////////////////////////////////////////////////////////////
// 数据修正表，对游戏中计算公式中某些参数的修正
///////////////////////////////////////////////////////////////////////////////////////
struct PARAM_ADJUST_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字

	struct
	{
		int			level_diff;				// Player和怪物的级别差(Player-怪物)(当级别差为0时，表示此条失效)
		float		adjust_exp;				// 对杀怪获得经验的修正系数(0.0~1.0)
		float		adjust_matter;			// 对杀怪掉落物品的概率的修正(0.0~1.0)
	} level_diff_adjust[16];				// 级别差对杀怪计算修正

	struct
	{
		float		adjust_exp;				// 对杀怪获得经验的修正系数(0.0~1.0)
	} team_adjust[11];						// 组队杀怪时的计算修正

	struct 
	{
		int			level_diff;				// 宠物和怪物的级别差
		float		adjust_exp;				// 对杀怪宠物获得的宠物经验修正系数
	} pet_level_diff_adjust[16];			// 级别差对宠物杀怪计算修正

	struct 
	{
		int			level_diff;				// 守护灵和怪物的级别差
		float		adjust_exp;				// 对杀怪守护灵获得的守护灵经验修正系数
	} guardian_soul_level_diff_adjust[16];	// 级别差对守护灵杀怪计算修正

	float adjust_friend_exp_share[10];		// 好友经验分享友好度1~10级系数
};

///////////////////////////////////////////////////////////////////////////////////////
// 玩家升级曲线表
///////////////////////////////////////////////////////////////////////////////////////
struct PLAYER_LEVELEXP_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字

	struct
	{
		double		need_exp;				// 升到该等级需求经验值
		double		need_skill_exp;			// 升到该等级需求修炼值
		double		store_exp_max;			// 该等级可以积累最高经验
		double		store_exp2_max;			// 该等级可以积累最高第二经验
	}
	player_level[200];						// 玩家等级1~200级的配置
	double			pet_exp[200];			// 宠物升级至1~200级每级所需要的经验值
	double			guardian_soul_exp[200];	// 守护灵升级至1~200级每级所需要的经验值
};

///////////////////////////////////////////////////////////////////////////////////////
// 储存经验上限配置表
///////////////////////////////////////////////////////////////////////////////////////
struct STORED_EXP_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字
	
	int64_t			max_stored_exp[200];	// 1~200级储存经验上限
	int64_t			max_stored_exp2[200];	// 1~200级第二储存经验上限
};

struct PLAYER_SECONDLEVEL_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字

	float			exp_lost[256];			// 经验损失表
};

///////////////////////////////////////////////////////////////////////////////////////
// 加点对应属性表
///////////////////////////////////////////////////////////////////////////////////////
struct STATUS_POINT_PROP_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字

	int				status_point_type;		// 属性类别

	float			hp;						// 初始生命力
	float			mp;						// 初始魔力
	float			angry;					// 初始怒气
	float			lucky_att;				// 初始幸运一击
	float			direct_att;				// 初始直击率
	float			phy_dmg;				// 初始物理攻击力
	float			phy_def;				// 初始物理防御力
	float			magic_dmg;				// 初始法术攻击力
	float			magic_def;				// 初始法术防御力
	float			spec_dmg;				// 初始特殊攻击力
	float			spec_def;				// 初始特殊防御力
	float			attack;					// 初始命中
	float			armor;					// 初始闪躲
	float			crit_rate;				// 初始致命一击率(%)
	float			crit_damage;			// 初始致命一击伤害(%)
	float			anti_crit_rate;			// 初始减免致命一击率(%)
	float			anti_crit_damage;		// 初始减免致命一击伤害(%)

	float			attri_dmgs[5];			// 初始属性攻击力，地、水、火、风、保留
	float			attri_anti[5];			// 初始属性抗性
	float			attri_reduce_anti[5];	// 初始属性抗性减免

	float			pet_adapt[2];			// 初始宠物适应性
	float			pet_affect[2];			// 初始宠物影响值

	float			walk_speed;				// 行走速度(M/S)
	float			run_speed;				// 奔跑速度(M/S)
	float			riding_speed;			// 基础骑乘变身速度(M/S)

	float			hp_gen1;				// 非战斗状态中HP恢复速度
	float			hp_gen2;				// 非战斗状态中打坐HP恢复速度
	float			hp_gen3;				// 战斗状态中HP恢复速度
	float			hp_gen4;				// 战斗状态中打坐HP恢复速度
	float			mp_gen1;				// 非战斗状态中MP恢复速度
	float			mp_gen2;				// 非战斗状态中打坐MP恢复速度
	float			mp_gen3;				// 战斗状态中MP恢复速度
	float			mp_gen4;				// 战斗状态中打坐MP恢复速度
};

///////////////////////////////////////////////////////////////////////////////////////
// 级别加点数量表
///////////////////////////////////////////////////////////////////////////////////////
struct PLAYER_STATUS_POINT_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字

	int				status_point[200];
};

//天赋点数表
struct PLAYER_TALENT_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字

	int				talent_point[200];		// 人物1-200级时获得点数
	int				subprof_soul_limit[201];// 副职业0-200级时魂槽上限
};

// 称谓属性表
struct TITLE_PROP_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字

	unsigned int	id_title;				// 称谓id

	int				prop_active_when_get;	// 是否即时生效
	unsigned int	id_prop;				// 附加属性包ID
};

///////////////////////////////////////////////////////////////////////////////////////
// 生活技能分类模板
///////////////////////////////////////////////////////////////////////////////////////
struct PRODUCE_TYPE_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字

	unsigned int	id_sub_prof;			// 副职业种类
	namechar		sub_type_name[8][16];	// 子分类1-8名称
};

///////////////////////////////////////////////////////////////////////////////////////
// 升级差异定义表
///////////////////////////////////////////////////////////////////////////////////////
struct LEVELUP_MODIFY_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字

	int				hp_mp_modify[200];		// 1-200级HPMP累计修正值
	int				dmg_def_modify[200];	// 1-200级攻击防御累计修正值
	int				hit_jouk_modify[200];	// 1-200级命中躲闪累计修正值
	int				mas_res_modify[200];	// 1-200级精通抗性累计修正值
};

///////////////////////////////////////////////////////////////////////////////////////
// 学习技能单元
///////////////////////////////////////////////////////////////////////////////////////
struct SKILL_LEARN_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字

	int				skill_id;				// 技能id
	int				max_level;				// 技能学习等级上限
	int				prof_limited;			// 需求玩家职业

	struct sSkillData
	{
		int				player_level;			// 要求玩家等级
		int				player_cosmos_level;	// 要求玩家小宇宙等级
		int				skill_required_id;		// 要求前提技能的ID
		int				skill_required_level;	// 要求前提技能的等级
		int				repu_required_id;		// 要求声望值编号
		int				repu_required_val;		// 要求声望值数值
		int				exp_cost;				// 扣除经验
		int				gold_reduce;			// 扣除金钱
		int				bind_money_reduce;		// 扣除绑定币
		int				repu_reduced_id;		// 扣除声望值编号
		int				repu_reduced_val;		// 扣除声望值数值
		int				item_reduced_id;		// 扣除包裹里有某一种物品ID
		int				item_reduced_number;	// 扣除包裹里有某一种物品数量
	}skill_data[100];							// 1-20级技能
};

/////////////////////////////////////////////////////////////////////////////////////////////////
// 附加属性包
/////////////////////////////////////////////////////////////////////////////////////////////////
struct ADDON_PACKAGE_CONFIG
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				affix;						// 前后缀选项
	namechar		words[16];					// 词缀文字
	unsigned int	desc_text;					// 说明文字
	int				id_addon_prop[16];			// 附加属性的ID
	int				fight_power;				// 提供的战斗力
};

/////////////////////////////////////////////////////////////////////////////////////////////////
// 附加属性库
/////////////////////////////////////////////////////////////////////////////////////////////////
struct ADDON_STORAGE_CONFIG
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				num;						// 附加属性包个数
	struct  
	{
		unsigned int	id_package;				// 附加属性包ID
		float			package_rate;			// 附加属性包概率
	}packages[48];
};

/////////////////////////////////////////////////////////////////////////////////////////////////
// 装备本体属性随机表
/////////////////////////////////////////////////////////////////////////////////////////////////
struct EQUIPMENT_PROPERTY_RANDOM_CONFIG
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	float			quality_prob[10];			// 0-9级品质的概率
	int				id_quality_config[10];		// 0-9级品质时的品质随机表
	float			hole_number_prob[5];		// 出现0-4个孔的概率
	float			hole_type_prob[8];			// 出现0-7号孔的概率
	int				hp_point[6];				// 生命随机点0-5
	float			hp_range_prob[5];			// 生命第1-5段概率
	int				mp_point[6];				// 魔法随机点0-5
	float			mp_range_prob[5];			// 魔法第1-5段概率
	int				dmg_min_point[6];			// 最小攻击力随机点0-5
	float			dmg_min_range_prob[5];		// 最小攻击力第1-5段概率
	int				dmg_var_point[6];			// 攻击力浮动随机点0-5
	float			dmg_var_range_prob[5];		// 攻击力浮动第1-5段概率
	int				def_point[6];				// 防御力随机点0-5
	float			def_range_prob[5];			// 防御力第1-5段概率
	int				hit_point[4];				// 命中随机点0-4
	float			hit_range_prob[3];			// 命中第1-4段概率
	int				jouk_point[4];				// 躲闪随机点0-4
	float			jouk_range_prob[3];			// 躲闪第1-4段概率
	int				dur_upper_limit_min;		// 装备耐久度上限初始值随机下限
	int				dur_upper_limit_max;		// 装备耐久度上限初始值随机上限
};

///////////////////////////////////////////////////////////////////////////////////////
// 装备品质随机表
///////////////////////////////////////////////////////////////////////////////////////
struct EQUIPMENT_QUALITY_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字

	int				identify_num_pack;		// 鉴定后随机包数量
	int				identify_range_up;		// 鉴定随机段上浮
	int				identify_range_down;	// 鉴定随机段下浮
	int				main_range_up;			// 主随机段范围上浮
	int				main_range_down;		// 主随机段范围下浮
	float			main_range_prob;		// 主随机段概率
	int				high_range_up_max;		// 高层段随机段上浮上限
	int				high_range_up_min;		// 高层段随机段上浮下限
	float			high_range_prob;		// 高层段概率
	int				low_range_down_max;		// 低层段随机段下浮上限
	int				low_range_down_min;		// 低层段随机段下浮下限
	float			low_range_prob;			// 低层段概率
	float			affix_prob[2][2];		// affix_prob[i][j]--i前缀j后缀的概率
};

///////////////////////////////////////////////////////////////////////////////////////
// 装备强化转移花费定义表
///////////////////////////////////////////////////////////////////////////////////////
struct EQUIPMENT_ENHANCE_TRANSFORM_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字

	int				enhanced_level;			// 原装备强化等级

	struct
	{
		int			id_item;				// 花费物品ID
		int			number;					// 花费物品数量
	}consume[12][12];						// consume[i][j]--原装备与目标装备等级从i到j
};

///////////////////////////////////////////////////////////////////////////////////////
// 跑商交易品距离增值定义表
///////////////////////////////////////////////////////////////////////////////////////
struct TRADE_DISTANCE_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字

	int				empty;					// 暂无
};

///////////////////////////////////////////////////////////////////////////////////////
// 跑商随机事件定义表
///////////////////////////////////////////////////////////////////////////////////////
struct TRADE_RANDOM_EVENT_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字

	namechar		positive_desc[256];		// 正面事件描述
	namechar		negative_desc[256];		// 负面事件描述
	int				appear_weight;			// 事件出现概率权重
	int				positive_prob;			// 正面概率
	int				id_port_service[6];		// 受本事件影响的港口模板ID1-6
	
	struct
	{
		int			category;				// 受本事件影响的交易品类别
		int			price_change_num;		// 重置价格偏移个数
		int			affect_depth;			// 影响深度
	}affect[5];

	float			max_price_adjust;		// 价格指数上限修正（正值）
	float			min_price_adjust;		// 价格指数下限修正（负值）
	float			profit_limit_factor;	// 价格变动前允许的利润量影响系数
};

/////////////////////////////////////////////////////////////////////////////////////////
// 剧本定义模板
/////////////////////////////////////////////////////////////////////////////////////////
struct INSTANCE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称，最多15个汉字

	int				show_type;					// 剧本显示类型：0：单方对战 1：双方对战 2：单方资源 3：双方资源 4：预留 5：预留
	int				win_type;					// 剧本胜利类型：0：对战 1：资源
	int				signup_type;				// 剧本报名类型：0：个人 1：队伍 2：家族
	int				rand_side;					// 剧本是否随机分拨
	int				hide_name;					// 剧本是否匿名
	int				inst_time;					// 剧本持续时间上限（秒）
	int				inst_revive_time;			// 剧本复活等待时间（秒）
	int				midway_join;				// 剧本人数不足能否中途加入
	int				min_player_num;				// 剧本至少人数
	int				zero_player_time;			// 剧本内人数不足延时结束时间（秒）
	int				prep_time;					// 战场开始预备时间（秒）
	unsigned int	id_ctrl_open;				// 战场开启时自动开启控制器ID
	unsigned int	id_ctrl_begin;				// 战场开始战斗时自动开启控制器ID
	unsigned int	id_ctrl_end;				// 战场结束时自动开启控制器ID
	int				end_delay_time;				// 战场结束延迟（秒）

	struct
	{
		int				max_player;				// 剧本一方人数限制
		int				start_player_num;		// 剧本一方开启人数底线
		int				req_money;				// 剧本一方加入需要的金钱数
		unsigned int	req_item;				// 战场第一方加入需要的道具
		int				min_level_req;			// 剧本一方人物最低等级限制
		int				max_level_req;			// 剧本一方人物最高等级限制
		int				start_area_min[3];		// 剧本一方开始前合理位置最小值
		int				start_area_max[3];		// 剧本一方开始前合理位置最大值
		unsigned int	id_monster_enter;		// 剧本一方出生点怪物ID
		unsigned int	id_monster_revive;		// 剧本一方复活点怪物ID
		unsigned int	id_key_npc;				// 对战类型关键NPC的id
		int				win_res_point;			// 资源类剧本胜利点数

		struct
		{
			unsigned int	id_res;				// 资源类剧本资源：矿物ID
			int				res_inc_speed;		// 资源积攒速度：（?点/10秒）
		} res_holds[16];

		int				dead_res_point_inc;		// 资源类战场人员被杀给对方增加资源点
		int				dead_score_inc;			// 人员被杀给对方增加表现分
		int				id_dead_droptable;		// 人员死亡掉落包ID
		int				id_task_enter[3];		// 进入战场自动接到任务id

		struct
		{
			int			score;
			int			id_task;
		} task_win[4];							// 胜利表现分激活任务

		int				id_task_deuce;			// 第一方平局激活任务ID
		int				id_task_lose;			// 第一方失败激活任务ID
	} sides[2];		// 0: 进攻方；1: 防守方

	int				max_spectator_num;			// 第三方最大观战人数：int。（为0代表不可观战）
	int				id_spectator_item;			// 第三方观战需要道具：all_type。
	int				no_spectator_min[3];		// 第三方观战非法位置最小值
	int				no_spectator_max[3];		// 第三方观战非法位置最大值
	unsigned int	id_monster_enter;			// 第三出生点怪物ID
	unsigned int	id_monster_revive;			// 第三复活点怪物ID

	struct
	{
		int			res;
		int			id_task;
	}task_res[5];								// 资源激活任务


};

/////////////////////////////////////////////////////////////////////////////////////////
// 特殊ID定义表
/////////////////////////////////////////////////////////////////////////////////////////
struct SPECIAL_ID_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字
	
	int				world_chat_cost_money;		// 世界频道消耗金币
	int				world_chat_cool_down;		// 世界频道绑定币发言冷却（s）
	int				world_chat_cost_item;		// 世界频道消耗物品ID
	int				broadcast_cost_item;		// 广播频道消耗物品ID
	int				bind_cash_record_item_id;	// 兑换绑定元宝记录物品ID
	unsigned int	second_prof_learn_level;	// 学习第二职业需要等级
	int				max_pack_size;				// 背包最大可扩充值
	int				max_storage_size;			// 仓库最大可扩充值	
	unsigned int	no_power_skill_id;			// 力竭技能ID
	int				no_power_skill_lvl;			// 力竭技能等级

	struct  
	{
		int state_id;							// 力竭状态ID
		int key;								// 力竭QTE按键
	}exhausted_qte[4];

	unsigned int	league_create_item_id;		// 创建军团拥有物品ID
	int				league_create_item_num;		// 创建军团拥有物品数量

	unsigned int   npc_monster_id_default;		// NPC默认本体怪物ID
	int				pet_pack_expand_item_id;	// 宠物栏扩充道具ID

	unsigned int	repu_conf_id;				// 声望配置表ID
	unsigned int	player_levelexp_conf_id;	// 玩家升级曲线表ID
	unsigned int	enemy_faction_conf_id;		// 敌对阵营表ID
	unsigned int	character_class_conf_id[9];	// 职业属性表ID, 项0应当被忽略

	int				default_task_fix_conf_id;	// 任务标准等级修正表ID
	int				pk_point_decrease;			// 每15分钟减少PK值
	int				cost_per_pk_point;			// 每点PK值消耗金币

	int				friend_push_exp_award_factor;	// 固定等级推送好友经验奖励系数
	int				equip_convert_cost_item_id;		// 装备兑换消耗物品id
	int				prof_switch_cost_bind_money;	// 切换职业消耗绑定币数量

	float			dash_speed;						// 加速跑速度
	float			jump_dash_speed;				// 加速跑前冲速度
	float			dash_stamina_cost_per_sec;		// 加速跑每秒体力消耗
	float			jump_dash_stamina_cost_per_sec; // 加速跑前冲每秒体力消耗

	struct _money_model_config
	{
		int		amont;								// 钱数
		int		drop_model;							// 小于amont的钱数使用的掉落模型
	};
	int				bind_money_icon_path;			// 绑定钱图标
	_money_model_config	bind_money_model_config[6];	// 绑定钱掉落模型配置
	int				money_icon_path;				// 非绑定钱图标
	_money_model_config	money_model_config[6];		// 非绑定钱掉落模型配置

	int				new_bee_protection_buff_pack[20];	// 自适应等级副本，玩家与怪物等级相差5*(i+1)级状态包 (i = 0...19)

	float			relic_slot_factor[6];			// 神器生效栏1-6属性比例 //不用
	float			exp_exchange_to_exp2_rate;		// 经验转换为第二经验比例
};

/////////////////////////////////////////////////////////////////////////////////////////
// 军团战配置表
//////////////////////////////////////////////////////////
struct LEAGUE_WAR_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字
	
	int				base_create_league_repu_id;	// 申请基地消耗军团声望ID
	int				base_create_league_repu;	// 申请基地消耗军团声望数值
	int				base_create_ctrl_id;		// 申请军团基地成功开启控制器
	int				base_dismiss_ctrl_id;		// 解散军团基地成功开启控制器

	int				declare_war_cost_league_repu_id;	// 基地战宣战消耗军团声望ID
	int				declare_war_cost_league_repu;		// 基地战宣战消耗军团声望值
	int				enter_war_req_player_repu_id;		// 军团基地战进入要求个人声望ID
	int				enter_war_req_player_repu;			// 军团基地战进入要求个人声望数值

	int				match_start_ctrl_id;		// 排位赛开始时开启控制器
	int				match_end_ctrl_id;			// 排位赛结束时开启控制器
	int				match_require_repu_type;	// 排位赛进入要求个人声望类型
												// 0-声望 1-增量声望 2-日增量声望 3-周增量声望 4-月增量声望
	int				match_require_repu_id;		// 排位赛进入要求个人声望ID
	int				match_require_repu;			// 排位赛进入要求个人声望数值

	int				normal_enter_monster_id;	// 军团基地攻方非战争进入点怪物ID
	int				normal_revive_monster_id;	// 军团基地攻方非战争复活点怪物ID

	int				def_enter_monster_id;		// 军团基地守方进入点怪物ID
	int				def_revive_monster_id[12];	// 守方普通复活点怪物id

	int				atk_enter_monster_id;		// 军团基地攻方战争进入点怪物ID
	int				atk_revive_monster_id[12];	// 攻方普通复活点怪物id

	int				revive_time;				// 战斗复活等待时间

	int				base_war_start_ctrl_id;		// 军团基地战开始时开启控制器
	int				base_war_finish_ctrl_id;	// 军团基地战结束时开启控制器

	int				finish_war_monster_id;		// 战场结束怪物id
	int				war_result_stage_param_id;	// 判定胜负的场景参数id
	int				atk_score_stage_param_id;	// 攻方奖励积分场景参数id
	int				def_score_stage_param_id;	// 守方奖励积分场景参数id

	struct
	{
		int			min_score;					// 该段最低所需积分
		int			deliver_task;				// 对应发放奖励任务
	} award_cfg[4];								// 奖励分段配置
};

/////////////////////////////////////////////////////////////////////////////////////////
// 修炼经验配置
/////////////////////////////////////////////////////////////////////////////////////////
struct REST_EXP_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字

	int				player_level;			// 玩家等级
	struct
	{
		float		max_combat_power;		// 该档最高战斗力
		float		min_exp_factor;			// 最低储存经验倍率
		float		max_exp_factor;			// 档最高储存经验倍率
	}
	grade_config[32];						// 战斗力分档配置，1-32档
};

/*
	物物交易
*/

struct ITEM_TRADE_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字

	struct
	{
		namechar		page_title[8];			// 页的名字，最多7个汉字
		unsigned int	money_type;				// 第i页商品交易货币类型 , 0是只收非绑定金币；1是允许用绑定金币，并且优先用绑定金币。
		unsigned int	bBind;					// 第i页商品是否换到即绑定

		struct
		{
			unsigned int	id_goods;
			
			struct
			{
				unsigned int	id;
				int				count;
			} item_required[2];

			struct
			{
				unsigned int	id;
				int				count;
			} repu_required[2];

			struct
			{
				unsigned int	id;
				int				count;
			} repu_min[2];//声望门槛
			
			int money_required;//消耗虚拟币
		} goods[48];
	} pages[4];

	unsigned int	id_dialog;					// 对话ID
};

//剧本报名表
struct INSTANCE_TABLE_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字

	unsigned int instance[16];//剧本id
};

//佣兵复活卷轴
struct PET_REVIVE_ESSENCE
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字

	int				item_quality;			// 物品品质
	namechar		simple_desc[16];		// 物品简介

	int				file_matter;			// 掉落简化模型
	int				file_icon;				// 图标名称

	int				level_pet;				// 适用佣兵等级
	float			rate_hp;				// 复活后hp百分比
	float			rate_mp;				// 复活后mp百分比
	int				decrease_loyalty;		// 复活扣除忠诚度
	int				increase_service_time;	// 复活增加服役时间

	unsigned int    sell_for_bind_money;		// 是否卖为绑定币
    int				price;					// 卖店价
	int				shop_price;				// 店卖价
	unsigned int	music_pick;				// 物品拾取音效
	unsigned int	music_drop;				// 物品掉落音效

	// 堆叠信息
	int				pile_num_max;			// 堆叠上限
	// 处理方式
	unsigned int	proc_type;
};

//篝火
struct FIRE_ESSENCE
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称，最多15个汉字

	unsigned int	level;					// 等级
	unsigned int	level_required;			// 等级限制

	int				file_matter;			// 模型路径id
	int             file_gfx_not_active;	// 未激活gfx路径
	int             file_gfx_activing;		// 正在激活gfx路径
	int             file_gfx_active;		// 已激活gfx路径
	int             file_gfx_die;			// 正在熄灭gfx路径

	int				cursor_type;			// 鼠标悬浮类型
	int             need_active;			// 是否需要激活     
	int             active_time;			// 激活所需时间（秒）
	int				skill_id;				// 施放技能id
	int				skill_level;			// 施放技能等级
	int				skill_target;			// 技能目标选择
	int				dur_time;				// 施放持续时间（秒）
	int				music_id;				// 施放绑定音效id
	int				vocation_action_type;	// 采集时动作类型
	char			action[32];				// 采集时播放的动作名
	namechar		progress_desc[16];		// 进度条显示文字
	namechar		type_showed[256];		// 矿物显示类型
};

//杀怪数据修正表
struct KM_PARAM_ADJUST_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称

	struct
	{
		int			level_diff;				// Player和怪物的级别差(Player-怪物)(当级别差为0时，表示此条失效)
		float		adjust_exp;				// 对杀怪获得经验的修正系数(0.0~1.0)
		float		adjust_exp_subprof;		// 对杀怪获得副职业经验的修正系数(0.0~1.0)
		float		adjust_money;			// 对杀怪获得金钱掉落数目的修正系数(0.0~1.0)
		float		adjust_matter;			// 对杀怪掉落物品的概率的修正(0.0~1.0)
		float		adjust_attack;			// 对攻击力的等级惩罚系数(0.0~1.0)
		float		adjust_soul;			// 对掉魂的概率的修正(0.0~1.0)
	} level_diff_adjust[16];				// 级别差对杀怪计算修正
};

//倒计时礼包
struct TIME_GIFT_BAG_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称

	unsigned int	require_gender;			// 性别限制，0-男，1-女，2-男女都可
	unsigned int	require_race;			// 种族限制
	unsigned int	character_combo_id;		// 职业限制
	struct 
	{
		namechar  title[16];				//第i次送礼标题
		namechar  desc[256];				//第i次送礼题词
		unsigned int time;					//第i次送礼时长,单位秒，填0时为不赠送
		unsigned int count;					//第i次物品总数	1-6
		struct  
		{
			unsigned int id;				//第i次赠送物品j ID
			unsigned int bBind;				//第i次赠送物品j是否绑定
			unsigned int time;				//第i次赠送物品j时间限制,单位秒
		} item[6];							
	}gift[10] ;

};

//强化变换外形 (装备强化的时候变换外形数据)
struct EQUIPMENT_ENHANCE_MODEL_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称

	struct		// 变化外形
	{
		int  level; // 变化外形对应的强化等级
		int  file_image;//变化外形C对应图标
		struct		//种族
		{
			int id_race;  				// 种族 id
			int file_model_male;		// 男模型路径
			int file_model_female;		// 女模型路径
			int file_model_male_l;  	// 男模型左手路径
			int file_model_female_l;  	// 女模型左手路径
		}race_data[3];
	}data[3];
};

//鉴定卷轴
struct IDENTIFY_SCROLL_ESSENCE
{
	unsigned int	id;				// id
	namechar		name[32];		// 名称

	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	unsigned int	file_matter;	// 掉落简化模型
	unsigned int	file_icon;		// 图标名称
	unsigned int	quality;		// 允许鉴定的装备品质
	unsigned int	pos;			// 允许鉴定的装备部位
	int				max_level;      // 可鉴定级别上限
	int				min_level;      // 可鉴定级别下限
	unsigned int    sell_for_bind_money;// 是否卖为绑定币
	int				price;			// 卖店价
	int				shop_price;		// 店卖价

	unsigned int	music_pick;		// 物品拾取音效
	unsigned int	music_drop;		// 物品掉落音效
	int				pile_num_max;	// 堆叠上限
	unsigned int	proc_type;		// 处理方式
};

//角色摄像机方案
struct CHAR_CAMERA_CONFIG
{
    unsigned int	id;				// id
	namechar		name[32];		// 名称

	unsigned int	race;			// 对应种族
	unsigned int	gender;			// 对应性别，0-男，1-女，2-男女都可
	float			height_offset;	// 摄像机中心点偏移高度, 摄像机的中心点与角色模型中心点的高度偏移量
	float			dist_default;   // 摄像机默认距离, 初始摄像头距离中心点的距离
	float			angle_default;  // 摄像机默认角度, 初始摄像头与中心点的角度
	float			dist_switch_camera; // 摄像机切换主视角范围, 在该范围内将隐藏角色模型
	float			dist_min_front;  //摄像机正面拉近最近距离, 从正面能拉近镜头的最小距离
};

//副本
struct DYNAMIC_INSTANCE_CONFIG
{ 
	unsigned int	id;						// id
	namechar		name[32];				// 名称

	int				type;					// 副本类型  0:单人副本  1:组队副本 2:家族副本 3:首领副本
	int				difficulty;				// 难度      0:默认      1:普通     2:英雄     3:史诗      4:传奇
	int				level_mode;				// 自适应等级类型 0:普通 1:队伍平均等级
	int				id_instance;			// 副本对应的地图编号

	unsigned int	level;					// 副本的标准等级
	unsigned int	auto_modify_level;		// 副本是否自动调整等级
	unsigned int	monster_max_auto_level;	// 副本怪物自适应等级上限
	unsigned int	can_ride;				// 副本内是否可以骑乘
	unsigned int	can_fly;				// 副本内是否可以飞行
	unsigned int	is_only_show_when_conditions_met;	// 仅当条件满足时显示
	int				resurrect_wait_seconds; // 副本复活等待时间（秒）
	int				start_battle_wait_seconds; //副本开启到战斗开始的等待时间（秒）
	unsigned int	force_dead_leave_inst;  // 副本内死亡是否强制离开副本
	int				last_seconds;			// 副本关闭条件_持续时间到时（秒）
	unsigned int	win_kill_monster_id;    // 副本胜利条件_进攻方胜利需要击杀的关键怪物ID
	unsigned int	lose_kill_monster_id;   // 副本失败条件_进攻方失败被击杀的关键怪物ID
	int				create_set_team_repu_id;// 副本创建成功设置团队声望ID
	int				create_set_team_repu_value;// 副本创建成功设置团队声望数值
	int				create_control_id;		// 副本创建成功时自动开启控制器ID
	int				start_battle_control_id;// 副本战斗开始时自动开启控制器ID
	int				close_control_id;		// 副本关闭时自动开启控制器ID
	unsigned int    born_place_monster_id;	// 副本出生点怪物ID
	unsigned int    resurrent_place_monster_id;// 副本复活点怪物ID
	unsigned int	commander_monster_id;   // 副本commander策略怪物ID
	unsigned int	auto_task[4];			// 进入副本自动接到的任务
	unsigned int	task_on_first_enter;	// 首次进入副本触发任务ID
	float			monster_exp_offset_rate;	// 怪物经验倍率浮动 >=-1 exp * (1 + rate)

	unsigned int	delever_task_on_win;	// 进攻方胜利激活的发奖任务
	unsigned int	delever_task_on_defeat; // 进攻方失败激活的发奖任务
	unsigned int	count_down_on_finish;	// 副本胜利或失败后倒计时关闭

	unsigned int	dungeon_type;			// 副本进入模式：0 严格模式 1 自由模式
	int				min_team_nums;			// 队伍数量下限
	int				max_team_nums;			// 队伍数量上限
	int				min_team_members;		// 队伍人数下限
	int				max_team_members;		// 队伍人数上限
	unsigned int	is_all_team_members_same_league; // 队伍是否来自同一军团

	unsigned int	daily_limit;			// 每日限次
	WEEKDAY_TIME	daily_limit_reset_time;	// 每日限次重置时间
	unsigned int	weekly_limit;			// 每周限次
	WEEKDAY_TIME	weekly_limit_reset_time;// 每周限次重置时间

	struct
	{
		WEEKDAY_TIME	start;				// 开启时间
		WEEKDAY_TIME	end;				// 结束时间
	}
	open_time[4];							// 副本每日开启时间段

	int				min_player_level;		// 个人等级下限
	int				max_player_level;		// 个人等级上限

	int				premise_active_task;	// 前提关联任务

	struct
	{
		int			id;						// 前提物品id
		int			count;					// 前提物品数量
		int			cost;					// 前提物品消耗
	}
	premise_item[2];						// 前提物品

	struct
	{
		int			id;						// 前提声望id
		int			min;					// 前提声望下限
		int			max;					// 前提声望上限
		int			cost;					// 前提声望消耗
	}
	premise_repu[2],						// 前提声望
	premise_raid_repu[2];					// 前提团队声望

	int				premise_buff[2];		// 前提buff
	int				mutex_buff[2];			// 互斥buff	

	unsigned int	is_raid_dungeon;		// 是否支持团队模式
	int				min_level_in_raid;		// 大队的等级区间下限
	int				max_level_in_raid;		// 大队的等级区间上限
	int				min_players_in_raid;	// 大队的人数下限
	int				max_players_in_raid;	// 大队的人数上限
	int				min_level_in_raid_team;	// 小队的等级区间下限
	int				max_level_in_raid_team;	// 小队的等级区间上限
	int				min_players_in_raid_team;	// 小队的人数下限
	int				max_players_in_raid_team;	// 小队的人数上限
};

// 被动技能配置
struct PASSIVE_SKILL_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称
	
	int				skill_id;				// 被动技能ID
	int				addon_package[32];		// 技能等级1~32时的附加属性包
};

// 按等级单独掉落配置
struct DROP_BY_LEVEL_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称
	
	int				drop_table_id[200];		//1-200级对应掉落表id
};

// 自适应等级权重配置表
struct LEVEL_ADAPT_WEIGHT_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称

	int				weight[200];			//1-200级对应权重
};

// 库任务接取数量配置
struct STORAGE_TASK_MAX_COUNT_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称
	
	int				max_storage_task[200];	//1-200级库任务领取数量
};

// 守护星配置
struct GUARDIAN_STAR_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称

	int				enable_player_level;	// 开启守护星所需等级
	int				star_max_level;			// 守护星等级上限

	struct
	{
		int			level_up;				// 升下一级所需守护值
		int			addon_package[4];		// 附加属性包ID
	}star_conf[100];						// 守护星配置（索引0表示守护星等级1）

	int				max_guard_point_per_absorb[150];	// 玩家等级1~150级每个守护石最多吸收守护值
};

//动态怪物包
struct DYNAMIC_MONSTER_PACK_ESSENCE
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称

	unsigned int	monster_group_type;		//怪物包内元素类别
	unsigned int	strict_monster_level;	//怪物等级是否严格匹配
	struct 
	{
		unsigned int	monster_id;		// 怪物ID
		int				instance_level; // 怪物对应副本等级
	}monster[16];
};

// 生活技能配置表
struct PLAYER_SUB_PROF_LEVEL_EXP_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	unsigned int	id_sub_prof;				// 生活技能ID
	namechar		simple_desc[16];			// 技能描述
 	unsigned int	file_icon;					// 图标路径
	int				max_level;					// 当前开放等级上限

	unsigned int	vocation_type;				// 副职业所属类型
	int				level_req;					// 可学习该技能的人物等级

	double			level_up_exp_need[30];		// 升级至N级所需经验

	int				learn_recipe[30][6];		// 升级到1-30级自动学会的配方
};

//宠物蛋
struct PET_EGG_ESSENCE
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct
	{
		int			pet_config_id;				// 随机获得宠物模板ID
		float		prob;						// 概率
	}
	random_config[6];							// 随机获得宠物配置1-6

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

//特殊状态包
struct SPECIAL_STATUS_PACKAGE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	namechar		desc[16];					// 类型说明
	int				max;						// 上限
	int				id_package[10];				// 状态包id
};

//状态包公式
struct STATUS_PACKAGE_EXPRESSIONS_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int  id_skill_require;						// 公式生效需求技能ID
	int  id_skill_result;						// 公式结果产生技能ID
	int  id_package[10];						// 公式计算过程状态包idN
};

//死亡复活等待
struct RESURRECT_TIME_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int  resurrect_wait_time[15];				// 第N次死亡等待时间(秒)
	int  dead_count_reduce_time;				// 死亡次数衰减间隔时间(秒)
};

//礼包
struct GIFT_BAG_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	namechar		desc[256];					// 礼包描述
	int				gift_num;					// 赠送物品总数
	struct										// 赠送物品N
	{
		unsigned int	id;						// 赠送物品N
		int				num;					// 赠送物品N数量
		unsigned int	bind;					// 赠送物品N是否绑定
		int				time_limit;				// 赠送物品N时间限制
	}gift[6];
};


// 配方合成服务
struct NPC_RECIPE_ESSENCE
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	unsigned int	recipes[64];				// 配方
};

// 声望模板
struct REPUTATION_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct  
	{
		struct  
		{
			namechar		sec_name[16];		// 区间名称
			int				sec_min;			// 区间下限
			int				sec_max;			// 区间上限
		}secs[5];								// 每段5个区间
	}classes[10];								// 10个分段

	struct  
	{
		namechar			repu_name[16];		// 声望名称
		unsigned int		repu_info;			// 声望描述文字
		int					repu_init;			// 声望初始值
		int					repu_min;			// 声望数值下限
		int					repu_max;			// 声望数值上限
		int					repu_show_num;		// 声望激活（显示）数值
		unsigned int		repu_pic;			// 声望图片
		unsigned int		repu_icon;			// 声望图标
		int					repu_class;			// 声望对应分段1-5，0表示没有分段
	}reputations[110];
};

// 任务等级修正表
struct TASK_FIX_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	float			task_factor[200];			// 任务经验1-200级时修正系数
	float			task_exp2_factor[200];		// 任务第二经验1-200级时修正系数
	float			task_money_factor[200];		// 任务金币1-200级时修正系数
	float			task_bind_money_factor[200];// 任务绑定金币1-200级时修正系数
};

// 变身表
struct BODY_TRANSFORM_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称
	
	int				transform_type;				// 变身类型,0:为简单变身，1:为完全变身。
	namechar		transform_name[16];			// 变身后名称

	unsigned int	whole_trans_model;			// 完全变身模型

	// 简单变身
	int				shape_id;					// 体型ID
	int				face_id;					// 脸型ID
	int				hair_id;					// 发型ID
	unsigned int	hair_color;					// 发色
	int				skin_color_id;				// 肤色ID
	int				saint_cloth_id;				// 替换圣衣ID
	unsigned int	helm_id;					// 头盔ID
	unsigned int	breast_id;					// 胸甲ID
	unsigned int	leg_id;						// 腿甲ID
	unsigned int	hand_id;					// 护手ID
	unsigned int	weapon_id;					// 武器ID
	unsigned int	assist_id;					// 副手ID
	unsigned int	mask_id;					// 面具ID
	unsigned int	wing_id;					// 翅膀ID

	int				forbid_prof_skill;			// 是否禁用职业技能
	int				is_unsummon_pet;			// 变身是否回收宠物
	unsigned int	is_hide_fight_power_wing;	// 是否隐藏战斗力翅膀

	struct
	{
		int			id;
		int			level;
	} addon_skills[6];							// 附加技能.0-3：主动技能；4,5：被动技能

	unsigned int	is_replace_shortcut_bar;	// 是否替换第一快捷栏
	unsigned int	is_disable_jump;			// 是否禁止跳跃
	unsigned int	is_disable_dash;			// 是否禁止加速跑
	unsigned int	is_disable_cosmos_burst;	// 是否禁止小宇宙爆发
	unsigned int	is_disable_mounting;		// 是否禁止骑乘
	unsigned int	is_disable_fly;				// 是否禁止飞行
	unsigned int	is_disable_booth;			// 是否禁止摆摊
	unsigned int	is_disable_name_info;		// 是否隐藏头顶信息
};

//标准怪物配置表
struct COMMON_MONSTER_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// 名称
	
	int				monster_id[200];		// 等级1~200对应的怪物ID;
};

// 怪物包
struct MONSTER_NPC_PACK_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称
	
	float			active_rate;				// 触发概率
	
	struct  
	{
		unsigned int	id;						// 怪物或者NPCID
		float			rate;					// 出现概率
	}monster_npcs[8];
};

///////////////////////////////////////////////////////////////////////////////////////
//
// 文字描述包
//
///////////////////////////////////////////////////////////////////////////////////////

struct TEXT_PACK_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				radius;						// 喊话半径
	float			active_rate;				// 触发概率

	struct  
	{
		unsigned int	text_id;				// 文字ID
		float			rate;					// 出现概率
	}texts[16];
};


// 星魂链配置表
struct STAR_SOUL_CHAIN_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称
	struct 
	{
		int player_lv[10];							// 1~10 级需要的人物等级
		int cosmos_lv[10];							// 1~10 级需要的小宇宙等级
	}star_chain[5];								// 星魂链1~5
};

// 星魂石
struct STAR_SOUL_STONE_ESSENCE
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int item_quality;							// 物品品质
	int	drop_model;								// 简化掉落模型
	int type;									// 类别
	int init_bright;							// 光泽度初始值
	int max_bright;								// 光泽度上限
	int lv;										// 星魂石等级
	unsigned int equip_slot_mask;				// 可镶嵌孔位置
	int install_bind_gold;						// 镶嵌消耗绑定币
	int install_gold;							// 镶嵌消耗金币
	int file_icon[51];							// 品质0~50对应的图标
	int upgrade_bright[50];						// 品质1~50需要的光泽度
	int addon_package[51];						// 品质0~50对应附加属性包id

	// 物品拆分通用属性
	ITEM_DECOMPOSE decompose;
	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 星魂链组合属性
struct STAR_SOUL_CHAIN_COMBO_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int stone_type[4];							// 星魂石类型1~4
	int	min_lv;									// 链内星魂石最低等级
	struct 
	{
		int bright_req;								// 组合所需光泽度
		unsigned int chain_ext_pack_id[5];			// 组合对星魂链1~5产生的附加属性包ID
	}combo[100];									// 组合1~100
};

// 星魂石升级道具
struct STAR_SOUL_STONE_UPGRADE_ITEM_ESSENCE
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称
	
	int				item_quality;				// 物品品质
	namechar		simple_desc[16];			// 物品简介

	int				drop_model;					// 简化掉落模型
	int				file_icon;					// 图标名称
	int				max_bright_limit;			// 可强化最大光泽度
	struct  
	{
		int value;								// 提升光泽度结果
		float probability;						// 概率
	}bright_add[2];								// 提升光泽度A、B
	
	// 物品拆分通用属性
	ITEM_DECOMPOSE decompose;
	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 占星道具
struct ASTROLOGY_ITEM_ESSENCE
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				enable_astrology_button;	// 激活占星按钮

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 星魂
struct STAR_SOUL_ESSENCE
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				gfx_path;					// 特效名称

	int				color;						// 星魂颜色
	unsigned int	conflict_id;				// 冲突ID
	unsigned int	is_mergeable;				// 可否吞噬

	float			exp_factor;					// 经验品质系数
	int				exp_base;					// 1级本体经验
	int				level_up_exp[19];			// 1-19级升级所需经验
	unsigned int	addon_pack[20];				// 等级1-20附加属性包id
	unsigned int	burst_addon_pack[20];		// 等级1-20爆发附加属性包id
	int				burst_level;				// 爆发等级
	unsigned int	burst_buff_pack[20];		// 等级1-20爆发状态包id
	unsigned int	fight_power[20];			// 等级1-20战斗力

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 强化增加下限道具
struct EXTEND_ENHANCE_LIMIT_ITEM_ESSENCE
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	unsigned int	equip_mask;					// 装备部位
	int				priority;					// 道具优先级
	int				accept_equip_level_min;		// 适用装备等级下限
	int				accept_equip_level_max;		// 适用装备等级上限
	int				accept_enhance_level_min;	// 适用强化等级下限
	int				accept_enhance_level_max;	// 适用强化等级上限
	int				use_count_max;				// 每次使用最多个数

	struct
	{
		float		min;						// 下限
		float		max;						// 上限
	}
	increasement[10][5];						// 放1-10个增加1-5段强化上限百分比

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 星铸辅助道具
struct CLOTH_UPGRADE_ITEM_ESSENCE
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	unsigned int	cloth_upgrade_category_mask;// 圣衣强化类型 mask 参见CLOTH_CONFIG::UpgradeCategory

	int				need_grade_min;				// 适用星铸等级下限
	int				need_grade_max;				// 适用星铸等级上限

	int				increase_blesssing;			// 提升祝福值
	float			increase_success_prob;		// 提升成功率

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 守护石
struct GUARDIAN_STONE_ESSENCE
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				item_quality;				// 物品品质
	int				drop_model;					// 简化掉落模型
	int				file_icon;					// 图标名称
	
	int				star_level_max;				// 可以吸收的守护星等级上限
	int				star_level_min;				// 可以吸收的守护星等级下限
	int				guard_point;				// 守护值

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 数值提升道具
struct VALUE_INCREASE_ESSENCE
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				player_level_min;			// 使用级别下限
	int				player_level_max;			// 使用级别上限

	int				type;						// 数值提升类型
												// 0=声望 [参数1为声望ID]
												// 1=生产技能经验 [参数1为生产技能ID]
												// 2=生产精力值
												// 3=cube能量
												// 4=获得沐浴荣光单位时间储存经验次数
												// 5=灵力（神器精炼用）
	int				params[2];					// 参数1-2

	int				value_min;					// 增加的数值下限
	int				value_max;					// 增加的数值上限

	int				max_increase_to;			// 最大可以增加到的数值

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 战斗宠物
struct COMBAT_PET_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				model_path[4];				// 模型路径		0: 整体, 1: 头, 2:头发, 3:身体
	int				gender;						// 性别			0: 男, 1:女
	unsigned int	skin_default_color;			// 皮肤默认颜色
	unsigned int	hair_default_color;			// 头发默认颜色

	int				init_aptitude;				// 初始资质
	int				max_aptitude;				// 最大资质

	int				player_level_req;			// 人物等级要求
	int				max_level;					// 宠物等级上限

	struct
	{
		float		prob;						// 落在此区间的概率
		float		min_factor;					// 区间最小百分比
		float		max_factor;					// 区间最大百分比
	}
	aptitude_sections[10];						// 资质区间1-10

	int				refresh_aptitude_cost_item;	// 刷新资质需要道具id
	int				refresh_aptitude_cost_money;// 刷新资质需要金币

	int				default_attack_skill;		// 默认攻击技能id
	int				init_skill_slots;			// 初始技能格数量
	int				max_skill_slots;			// 最大技能格数量
	int				skill_slot_active_item[4];	// 扩充技能格1-4道具

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 战斗宠物技能书
struct COMBAT_PET_SKILL_BOOK_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				skill_id;					// 技能id
	int				skill_level;				// 技能等级
	int				skill_slot;					// 技能格位置要求

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 战斗宠物装备
struct COMBAT_PET_EQUIPMENT_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				model_path[2];				// 男/女模型路径
	int				type;						// 装备部位		0: 头, 1:头发, 2:身体
	int				gender;						// 性别			0: 男, 1:女, 2:男女皆可
	unsigned int	color;						// 颜色
	int				level_req;					// 等级需求
	int				attack;						// 攻击
	int				element_attack;				// 属性攻击
	int				hit;						// 命中
	int				critical;					// 暴击
	int				aptitude;					// 资质
	int				fight_power;				// 战力
	int				addon_pack_for_player[4];	// 增加人物属性包1-4

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 星魂盒
struct STAR_SOUL_BOX_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				star_soul_id;				// 获得星魂ID
	int				star_soul_exp;				// 获得星魂初始经验

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 装备外观变更道具
struct EQUIPMENT_APPEARANCE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 美容道具
struct PLAYER_APPEARANCE_ESSENCE
{
	enum
	{
		BODY		= 0x1,		// 体型
		SKIN_COLOR	= 0x2,		// 肤色
		EYE			= 0x4,		// 瞳孔
		EYE_COLOR	= 0x8,		// 瞳色	
		HAIR_COLOR	= 0x10,		// 发色
		FACE		= 0x20,		// 脸型
		HAIR		= 0x40,		// 发型
	};

	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	unsigned int	type_mask;					// 美容类型。参见上面的enum

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 心事瓶 
struct DRIFT_BOTTLE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 运势道具 
struct DIVINING_ITEM_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				type;						// 占星类型：1爱情 2财运 3友情 4战斗

	ITEM_DECOMPOSE	decompose;					// 拆分通用属性
	ITEM_COMMON_PROP item_common;				// 物品通用属性
};

// 传送卷轴
struct TRANSMITROLL_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				type;						// 类型：0召集队员 1传送到队友位置 2指定座标
	int				level_req;					// 使用等级
	int				cool_time;					// 冷却时间（秒）
	int				map_id;						// 目标地图号
	float			pos[3];						// 目标地座标

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 聊天表情包
struct EMOTION_ICON_PACK_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				emotion_id;					// 表情ID
	int				active_time;				// 激活时间(秒)

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 仇敌追踪道具
struct REVENGE_ITEM_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 装备染色剂
struct EQUIPMENT_DYE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	unsigned int	color;						// 颜色

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 神器
struct RELIC_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				relic_config;				// 神器配置表ID
	int				level_req;					// 可装备等级
	int				skill_id;					// 神器技能ID

	int				unique_props[5];			// 唯一属性条目1-5
	struct  
	{
		int			props[5];					// 属性条目1-5
	}
	states[5];									// 境界1-5

	int				remove_buff_on_unequip[5];	// 取下时驱散buff

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 结婚证书
struct MARRIAGE_CERTIFICATE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};

// 灵魂宝石 
struct SOUL_ARMOR_GEM_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				type;						// 灵魂宝石类型
	int				init_gem_exp;				// 初始经验
	unsigned int	can_level_up;				// 是否可升级
	
	unsigned int	addon_pack[65];				// 等级0-64附加属性包
	int				level_need_gem_exp[64];		// 等级1-64需要经验值

	struct  
	{
		int			cost_item;					// 增加经验必须消耗道具ID
		int			cost_item_count;			// 增加经验必须消耗道具数量
		int			add_gem_exp;				// 增加经验
		int			cost_extra_item;			// 增加经验可选消耗道具ID
		int			cost_extra_item_count;		// 增加经验可选消耗道具数量
		int			extra_gem_exp;				// 使用可选消耗道具额外增加经验
	}
	add_gem_exp_config[64];						// 等级0-63时增加经验配置

	struct
	{
		int			gfx_path;					// 光效路径
		int			need_total_gem_level;		// 光效需要宝石总等级
	}
	gfx_config[20];								// 光效1-20配置

	int				decompose_item;				// 拆分出的物品ID
	float			min_decompose_item_count_gem_exp_factor;	// 累积经验拆出的物品数量下限系数
	float			max_decompose_item_count_gem_exp_factor;	// 累积经验拆出的物品数量上限系数

	// 物品标准后缀：价钱和堆叠
	ITEM_COMMON_PROP item_common;
};


//洗技能道具
struct SKILL_CLEANER_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// 名称

	int				level_req;					// 使用等级

	ITEM_COMMON_PROP item_common;
};

// 满连技能包
struct COMBO_PACK_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct
	{
		int id[2];								// 技能ID
		float prob;								// 技能概率
		int keys[4];							// 技能按键1~4
	}skill[8];									// 满连技能 1~8
};


// 矿物包
struct MINE_PACK_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	float			active_rate;				// 触发概率
	struct  
	{
		unsigned int	id;						// 矿物ID
		float			rate;					// 出现概率
	}mines[8];
};

// 召唤怪物NPC包
struct SUMMON_MONSTER_NPC_PACK_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	unsigned int    monster_npc_pack_id;		// 怪物NPC包ID
	int				num;						// 召唤数量
	int				level_mode;					// 自适应等级类型 0:普通 1:队伍平均等级			
	int				replace_nearby_npc_at_client;	// 衔接的附近NPC
	int				exist_time;					// 生存时间（秒）
	float			summon_range;				// 召唤范围（米）
	int				summon_range_type;			// 召唤范围类型 0:范围内随机 1:范围内带角度均匀分布
	int				summon_range_angle;			// 召唤范围角度
	int				follow_on_summon;			// 召唤后是否自动开启跟随策略
	int				unsummon_on_logout;			// 是否随本体消失
	int				follow_attack;				// 是否跟随本体攻击
	int				exclusive_mode;				// 专属模式：0 不专属, 1 队伍专属, 2玩家专属, 3家族专属
	unsigned int	is_exclusively_visible;		// 是否仅专属者可见
	unsigned int	is_show_master_name;		// 是否显示专属者名称
	unsigned int	link_aggro_to_master;		// 仇恨是否转移给主人
	unsigned int	link_kill_to_master;		// 击杀归属是否算给主人
	unsigned int	link_pk_mode_to_master;		// PK模式是否从属玩家
	unsigned int	link_combo_to_master;		// 攻击是否算主人连击

	struct  
	{
		int id;									// 技能ID
		int level;								// 技能等级
	} master_cast_skill_on_summon;				// 召唤使主人对其使用技能
	unsigned int	is_summon_to_specific_pos;	// 是否指定坐标召唤
	unsigned int	is_summon_at_specific_y;	// 是否指定高度召唤(仅当is_summon_to_specific_pos时有效)

	int				summon_category;			// 存在类型，参见SUMMON_CATEGORY_CONFIG
	int				summon_direction_type;		// 被召唤怪出生角度类型 0: 随机, 1: 与主人的连线成固定角度, 2: 与主人的面向成固定角度
	int				summon_angle;				// 被召唤怪出生朝向角度

	unsigned int	is_show_extra_ui;			// 是否显示召唤附加界面
	int				extra_ui_skill_id;			// 特殊界面附带技能id
	int				extra_ui_icon;				// 召唤附加界面头像图标
	unsigned int	is_icon_affects_policy;		// 头像是否可以影响怪物策略

	unsigned int	summon_prop_inherit_mask;	// 继承主人属性 MASK
												// 0-命中
												// 1-闪躲
												// 2-幸运一击率
												// 3-直击率
												// 4-最小攻击力
												// 5-最大攻击力
												// 6-防御力
												// 7-生命最大值
												// 8-伤害倍率(%)
												// 9-伤害抗性(%)
												// 10-物理伤害抗性(%)
												// 11-法术伤害抗性(%)
												// 12-暴击率(%)
												// 13-暴击率减免(%)
												// 14-暴击附加伤害
												// 15-暴击附加伤害减免
												// 16-被治疗效果
												// 17-地属性攻击力
												// 18-水属性攻击力
												// 19-火属性攻击力
												// 20-风属性攻击力
												// 21-地属性抗
												// 22-水属性抗
												// 23-火属性抗
												// 24-风属性抗
												// 25-地属性抗性减免
												// 26-水属性抗性减免
												// 27-火属性抗性减免
												// 28-风属性抗性减免
												// 29-治疗能力
};

// 召唤矿物包
struct SUMMON_MINE_PACK_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称
	
	unsigned int    mine_pack_id;				// 矿物包ID
	int				num;						// 矿物数量
	int				exist_time;					// 生存时间（秒）
	float			summon_range;				// 召唤范围（米）
	int				unsummon_on_logout;			// 是否随本体消失
};

// 召唤类型数量配置表
struct SUMMON_CATEGORY_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称
	
	int				max_count[32];				// 存在类型i的最大召唤数量
};

// 大地图传送配置
struct WORLD_TELEPORT_POINT_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				mapid;						// 目的地地图号
	float			pos[3];						// 目的地坐标
	int				gold;						// 传送所需费用
	int				prem_task_show;				// 显示所需完成的前提任务
	int				prem_task;					// 激活所需完成的前提任务
};

// 强化转移配置表
struct ENHANCE_TRANSFER_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct 
	{
		int		gold;				// 金钱花费
		struct 
		{
			int id;					// 物品id
			int num;				// 物品所需数量
		}
		item_opt,					// 可选物品
		item_need;					// 必选物品
		float   no_item_opt_prob;	// 无可选物品时的成功率
		int     fail_lv_lose;		// 失败时掉落强化等级
	}diff_equiplv_lv[15];			// 跨阶强化转移
};

// 强制移动配置
struct ENFORCED_MOVE_CONFIG
{
	enum Action
	{
		ACTION_START,			// 地面移动动作起始
		ACTION_LOOP,			// 地面移动动作循环
		ACTION_END,				// 地面移动动作结束
		ACTION_ACCELERATE,		// 空中移动动作加速
		ACTION_FLY,				// 空中移动动作飞行
		ACTION_GLIDE,			// 空中移动动作滑翔

		ACTION_NUM,
	};

	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct check_point
	{
		int			path_id;					// 目标点路径ID
		int			camera_contorl_id;			// 镜头控制ID
		int			type;						// 移动类型: 0=地面，1=空中
		unsigned int stay_time_on_end;			// 终点停留时间
		int			get_buff_on_start;			// 向目标点移动自身获得BUFF ID
		int			remove_buff_on_end;			// 目标点移动结束驱散BUFF ID
		namechar	actions[ACTION_NUM][16];	// 目标点相关动作，参见ENFORCED_MOVE_CONFIG::Action
		int			mapid;						// 目标点所在地图ID
		int			qte_id;						// 目标点QTE模板ID
		namechar	action_failed[16];			// 目标点QTE失败播放动作
	}
	check_points[5];

	int				back_to_mapid_on_failed;	// QTE失败返回地点地图ID
	float			back_to_pos_on_failed[3];	// QTE失败返回地点坐标x y z

	int				get_buff_on_finished;		// 强制移动结束后获得buff
	int				to_mapid_on_offline;		// 下线后到达地点地图ID
	float			to_pos_on_offline[3];		// 下线后到达地点坐标x y z
};

// 星盘配置
struct STAR_BOARD_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct  
	{
		int			enable_star_id[32];			// 开启星辰id
		int			cosmos_grade_icon;			// 小宇宙境界图标
		namechar	cosmos_grade_name[16];		// 小宇宙境界名称
		int			cosmos_grade_desc;			// 小宇宙境界描述
		unsigned int addon_pack;				// 小宇宙境界附加属性包
		int			fight_power;				// 战斗力
	}
	configs[10];								// 星盘等级1-10配置
};

// 星辰配置
struct STAR_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	namechar		desc[16];					// 星辰描述
	int				icon_path;					// 特效名称
	int				accept_color;				// 可插入的星辰颜色

	int				need_player_level;			// 激活所需等级
	int				need_realize_point;			// 激活所需感悟
	int				need_item;					// 激活所需道具id

	unsigned int	addon_pack;					// 附加属性包id
	int				fight_power;				// 附加战斗力
};

// 占星配置
struct ASTROLOGY_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct
	{
		int			cost_realize_point;			// 消耗感悟
		float		prob;
		int			drop_table;					// 掉落表
		float		prob_enable_next_button;	// 激活下一个按钮概率
	}
	buttons[5];
};

// 个人挑战副本
struct SOLO_CHALLENGE_DUNGEON_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				map;						// 挑战副本所在场景ID
	struct  
	{
		int			need_fight_power;				// 战斗力限制
		float		pos[3];							// 开启时传送位置x,y,z
		int			enable_controller_on_start;		// 开启时激活的控制器
		int			time_limit;						// 限制时间
		int			success_condition;				// 胜利条件 0获得积分；1击杀怪物
		int			success_need_score;				// 胜利所需的挑战积分
		int			success_need_kill_monster;		// 胜利所需击杀怪物ID
		int			enable_controller_on_success;	// 胜利时激活的控制器
		int			disable_controller_on_success;	// 胜利时关闭的控制器
		int			enable_controller_on_failed;	// 失败时激活的控制器
		int			disable_controller_on_failed;	// 失败时关闭的控制器
	}
	level_configs[250];								// 1-250层的配置

	float			pause_zone_pos[3];				// 暂停计时区域坐标x,y,z
	int				success_count_down;				// 层胜利后的倒计时
	int				failed_count_down;				// 层失败后的倒计时
	int				level_award_task;				// 层奖励任务ID
	int				week_award_task;				// 周奖励任务ID
};

// 圣衣配置
struct CLOTH_CONFIG
{
	enum Category
	{
		BRONZE_CLOTH,		// 青铜
		SILVER_CLOTH,		// 白银
		GOLD_CLOTH,			// 黄金
		GOD_CLOTH,			// 神圣衣
		SURPLICE,			// 冥衣
		SCALE,				// 鳞衣
	};

	enum UpgradeCategory
	{
		UPGRADE_BRONZE_CLOTH,		// 青铜
		UPGRADE_SILVER_CLOTH,		// 白银
		UPGRADE_ARIES,				// 白羊
		UPGRADE_TAURUS,				// 金牛座
		UPGRADE_GEMINI,				// 双子座
		UPGRADE_CANCER,				// 巨蟹座
		UPGRADE_LEO,				// 狮子座
		UPGRADE_VIRGO,				// 处女座
		UPGRADE_LIBRA,				// 天秤座
		UPGRADE_SCORPIO,			// 天蝎座
		UPGRADE_SAGITTARIUS,		// 射手座
		UPGRADE_CAPRICORN,			// 摩羯座
		UPGRADE_AQUARIUS,			// 水瓶座
		UPGRADE_PISCES,				// 双鱼座
		UPGRADE_PEGASUS,			// 天马座
		UPGRADE_DRACO,				// 天龙座
		UPGRADE_CYGNUS,				// 白鸟座
		UPGRADE_ANDROMEDA,			// 仙女座
		UPGRADE_PHOENIX,			// 凤凰座
		UPGRAGE_SURPLICE,			// 冥衣
		UPGRAGE_NEW_SILVER_CLOTH,	// 新白银
		UPGRADE_SCALE,				// 鳞衣
		UPGRADE_NORMAL_SURPLICE,	// 普通冥衣
	};

	unsigned int	id;							// id
	namechar		name[32];					// 名称

	namechar		simple_desc[16];			// 圣衣简介
	unsigned int	is_auto_equip;				// 获得后是否自动装备

	struct
	{
		int			need_grade;					// 升格需要星铸等级
		int			icon_path;					// 图标
		int			category;					// 圣衣类别 参见Category
		int			model_path[2];				// 模型路径名(0男/1女，下同)
		int			helm_model_path_male[10];	// 男模型职业2-11头盔路径名
		int			helm_model_path_female[10];	// 女模型职业2-11头盔路径名
		int			wing_id;					// 翅膀id
		unsigned int wing_color[2];				// 圣衣翅膀颜色	
		int			sub_model;					// 圣衣附属子模型路径
		namechar	sub_model_hook_on_body[16];	// 圣衣附属子模型挂点（自身）
		namechar	sub_model_hook[16];			// 圣衣附属子模型挂点（模型）
	}
	form_configs[5],							// 0-4次升格的配置 (0即圣衣未升格)
	surplice_form_configs[5];					// 冥化0-4次升格的配置 (0即未升格)

	unsigned int	upgrade_category;			// 圣衣强化类型 参见UpgradeCategory

	unsigned int	prof_mask;					// 职业限制
	unsigned int	gender_mask;				// 性别限制
	int				need_level;					// 等级限制
	int				need_cosmos_level;			// 小宇宙等级限制

	int				dur;						// 耐久值
	int				money_per_dur;				// 修理1耐久需要的钱数
	int				surplice_skill;				// 冥化后附带技能id(死亡后触发)

	int				basic_addon_pack_when_equipped;// 装备生效_基本属性包ID
	int				basic_addon_pack;			// 拥有生效_基本属性包ID
	int				basic_fight_power_when_equipped; // 装备生效_基本战斗力
	int				basic_fight_power; 			// 拥有生效_基本战斗力

	int				grade_max;					// 星铸等级上限
	int				cloth_upgrade_conf;			// 星铸配置表ID

	struct  
	{
		int			icon;						// 星铸到该等级时的图标
		int			addon_pack_when_equipped;	// 星铸到该等级时的装备生效的属性包ID
		int			addon_pack;					// 星铸到该等级时的拥有生效的属性包ID
		int			fight_power_when_equipped;	// 星铸到该等级时装备生效的战斗力
		int			fight_power;				// 星铸到该等级时拥有生效的战斗力
	}
	grade_configs[48];							// 星铸1-48级的配置

	struct
	{
		int			skill_id;					// 天赋（技能ID）
		int			grade_req;					// 天赋所需星铸等级
	}
	skill_configs_when_equipped[9],				// 装备圣衣的天赋配置
	skill_configs[9];							// 拥有圣衣的天赋配置

	int				cloak_configs[32];			// 披风（等级1-32）配置
};

// 星铸配置表
struct CLOTH_UPGRADE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct
	{
		int			blesssing_max;				// 祝福值上限
		float		base_succ_prob;				// 基本成功率
		int			advanced_blessing;			// 高级祝福值
		float		advanced_succ_prob;			// 高级祝福成功率
		int			cost_money;					// 消耗金钱
		int			cost_item;					// 消耗道具id
		int			cost_item_count;			// 消耗道具数量
	}
	levels[48];									// 星铸1-48级配置
};

// QTE配置
struct QTE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				operation_type;				// 按键方式		0-单键(按键A)；1-单键连击(按键A)；2-双键交替连击(按键A，按键B)；3-晃动鼠标；4-单键HOLD(按键A);
												//				5-单键持续(按键A)；6-双键持续交替 (按键A，按键B)
	int				key[2];						// 按键A/B		0-空；1-“A”；2-“D”；3-“←”；4-“→”；5-“LMB”；6-“RMB”；7-“空格”；8-“Q”；9-“E”
	int				life_time;					// 输入核对时间n毫秒 (QTE的提示在屏幕上悬停的时间)
	int				break_time;					// 持续输入中断间隔k毫秒
	int				need_repeat_count;			// 生效次数阈值m次 (模式0, 1, 2, 3所要求的有效输入次数)
	int				hold_time;					// 按住持续时间 毫秒 (模式4)

	namechar		action[16];					// 输入时播放动作 (玩家在进行有效输入时播放的动作)
	int				special_ui;					// 特殊UI表现
	int				smart_camera_id;			// 镜头控制ID
	int				is_hide_key_hint;			// 是否隐藏按键显示
	int				show_gfx_on_process;		// 执行时播放平面特效
	int				show_gfx_on_success;		// 成功后播放平面特效
	int				show_gfx_on_failed;			// 失败后播放平面特效
	float			gfx_percent_pos[2];			// 平面特效显示位置 x,y座标百分比
	int				category;					// QTE类型标识	0-空；1-强制移动; 2-释放技能; 3-触发任务; 4-完成任务; 5-挂点技能挣脱; 6-女神的祝福复活; 7-冥化复活; 8-动画中触发;

	int				cast_skill;					// 玩家释放技能id (QTE成功后角色释放的技能id)
	int				deliver_task;				// 触发任务ID
	int				finish_task;				// 完成任务ID
	float			revive_hp_percent;			// 复活生命百分比

	int				image;						// 附带图片
	float			image_percent_pos[2];		// 附带图片显示位置 x,y座标百分比
	namechar		text[16];					// 附带文字
	float			text_percent_pos[2];		// 附带文字显示位置 x,y座标百分比
};

// 雅典娜祝福配置
struct ATHENA_BLESSING_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				blessing_category;			// 触发类型		0-死亡复活；1-队友死亡；2-队友小宇宙爆发；3-战斗中使用技能
	float			trigger_prob;				// 触发概率
	int				cool_down;					// 冷却时间

	struct
	{
		int			qte_id;						// QTE模板ID
		float		prob;						// 概率
	}
	qte_configs[32];							// 1-32个QTE模板配置
};

// 雅典娜祝福抽奖配置
struct ATHENA_AWARD_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct
	{
		int			min;						// 活跃度区间下限
		struct
		{
			int		drop_table_id;				// 掉落表ID
			float	prob;						// 概率
		}
		drops[4];								// 掉落表1-4配置
	}
	activity_configs[10];						// 活跃度区间1-10配置
};

// 随身服务配置
struct SELF_SERVICE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct
	{
		int			npc_id;						// VIP所使用的NPC
	}
	configs[12];								// VIP等级1-12所使用的NPC配置

	int				npc_id_for_mvip[18];		// MVIP等级1-18所使用的NPC配置
	int				npc_id_for_web_client;		// 微端用服务NPC
};

// 每日数值限制表
struct DAILY_LIMITATION_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct
	{
		int64_t		money_gain_limit;			// 获得金币上限
		int64_t		bind_money_gain_limit;		// 获得绑定币上限
		int64_t		exp_gain_limit;				// 获得经验上限
		int64_t		exp2_gain_limit;			// 获得第二经验上限
		int64_t		bind_money_consume_limit;	// 绑定币消耗上限
	}
	player_level[200];							// 玩家1-200级每日限制
};

// 挂件
struct HOOK_MODEL_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	unsigned int	is_player_passive;			// 是否玩家被动
	struct
	{
		namechar		hook_name[16];			// 主角挂点位置
		int				model;					// 挂点上的模型文件
		namechar		model_hook_name[16];	// 模型挂点位置
	}
	hooks[2];									// 挂点1，2的配置

	struct
	{
		int				id;						// ID
		int				level;					// 等级
	}
	extra_skills[4];							// 附加技能1-4

	unsigned int	is_disable_prof_skills;		// 是否禁止职业技能
	unsigned int	is_replace_skill_bar;		// 是否替换第1快捷栏
	unsigned int	is_disable_mining;			// 是否禁止采矿
	unsigned int	is_disable_jump;			// 是否禁止跳跃
	unsigned int	is_disable_dash;			// 是否禁止加速跑
	unsigned int	is_disable_cosmos_burst;	// 是否禁止小宇宙爆发
	unsigned int	is_disable_mounting;		// 是否禁止骑乘
	unsigned int	is_disable_fly;				// 是否禁止飞行
	unsigned int	is_disable_booth;			// 是否禁止摆摊
	unsigned int	is_disable_name_info;		// 是否隐藏头顶信息

	namechar		stand_action[16];					// 站立时的主角动作
	namechar		stand_action_of_hook_model[2][16];	// 站立时的模型1-2动作
	namechar		run_action[16];						// 奔跑时的主角动作
	namechar		run_action_of_hook_model[2][16];	// 奔跑时的模型1-2动作
};

// 生产精力上限
struct PRODUCE_ENERGY_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				max_produce_energy[200];	// 人物级别1-200时的精力上限
};

// 套装标识
struct SUIT_TAG_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	float			no_tag_prob;				// 没有标识的概率
	float			tag_prob[5][10];			// 分组1-5，标识1-10的概率
};

// 套装标识激活属性
struct SUIT_TAG_ACTIVE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				addon_pack[15][5][10][3];	// 等阶1-15, 分组1-5, 标识1-10, 装备有4-6件时激活附加属性包
};

// 套装标识转移
struct SUIT_TAG_MIGRATION_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct
	{
		int			item_id;					// 转移需要物品
		int			item_count;					// 转移需要物品数量
	}
	configs[10];								// 标识1-10转移需要物品
};

// 休闲宠物配置模板
struct PET_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				pet_quality;				// 宠物品质 0-平凡 1-混血 2-纯血 3-超贵族 
	int				icon_path[2];				// 图标路径（男/女）
	int				model_path[2];				// 模型路径（男/女）
	
	float			male_prob;					// 性别男概率
	int				parentage[2];				// 宠物血统1,2
	int				init_level;					// 宠物初始等级
	int				require_player_level;		// 宠物携带等级
	int				race;						// 宠物种族	0-猫, 1-狗, 2-鹦鹉, 3-老鹰, 4-企鹅

	int				init_action_point;			// 宠物体力初始上限
	int				max_action_point;			// 宠物体力最终上限
	unsigned int	can_propagate;				// 是否可以化生
	unsigned int	can_auto_pick_up_items;		// 是否开启自动拾取
};

// 祈祷经验配置
struct PRAY_EXP_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				exp[200];					// 等级1-200单位时间获得经验
	int				exp2[200];					// 等级1-200单位时间获得第二经验
};

// 星座守护配置
struct CONSTELLATION_GUARD_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	float			base_trigger_prob;			// 基础触发概率（以该概率触发后，再在以下12个星座中随机）
	struct
	{
		int			skill_id;					// 技能ID
		int			wait_time;					// 出场准备时间（毫秒）
		float		prob;						// 触发概率
	}
	constellation[12];
};

// 军团声望配置
struct LEAGUE_REPU_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct
	{
		namechar		name[16];				// 声望名称
		int				icon_path;				// 声望图标路径

		int				repu_max[9];			// 0-8级军团声望上限
	}
	reputation[32];								// 声望0-31的配置
};

// 图鉴配置
struct ALBUM_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				photo_id;					// 图鉴ID
	int				point;						// 图鉴点数
	struct
	{
		int			item_id;					// 物品ID
		int			item_count;					// 物品数量
	}
	item_req[3];								// 激活图鉴需要的物品

	int				addon_pack;					// 图鉴激活的属性包ID
};

// 可选模型配置
struct MODEL_CANDIDATE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				model[100];					// 可选模型1-100
};

// 战斗宠物配置
struct COMBAT_PET_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				queue_slot_item_req[5];		// 战斗队列2-6开启所需物品
	float			queue_slot_factor[5];		// 战斗队列2-6加成系数

	struct  
	{
		int			attack;						// 攻击
		int			element_attack;				// 属性攻击
		int			hit;						// 命中
		int			critical;					// 暴击
	}
	level_config[200];							// 等级1-200的属性配置
};

// VIP 配置
struct VIP_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct  
	{
		int			cash;						// VIP对应元宝数
		int			gift;						// VIP领取一次性礼包
		int			daily_gift;					// VIP领取每日礼包
	}
	vip[12];									// VIP级别1-12

	struct  
	{
		int			cash_last_month;			// 月度VIP对应上月元宝数
		int			weekly_gift[4];				// 月度VIP每周第1-4周领取礼包
		int			monthly_gift;				// 月度VIP每月领取礼包
	}
	monthly_vip[18];							// 月度VIP级别1-18
};

// 怪物词缀组合
struct MONSTER_AFFIX_COMBINATION_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	unsigned int	affix_combination;			// 词缀组合MASK
												// 0x1         = 召唤
												// 0x2         = 拟态
												// 0x4         = 妖术
												// 0x8         = 束缚
												// 0x10        = 石化
												// 0x20        = 冰冻
												// 0x40        = 麻痹
												// 0x80        = 灼烧
												// 0x100       = 强石化
												// 0x200       = 强冰冻
												// 0x400       = 强麻痹
												// 0x800       = 强灼烧
												// 0x1000      = 恢复
												// 0x2000      = 狂暴
												// 0x4000      = 佣兵
												// 0x8000      = 自爆
												// 0x10000     = 分裂

	int				policy_id;					// 策略ID
};

// 怪物词缀随机包
struct MONSTER_AFFIX_RANDOM_PACK_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct
	{
		int				affix_combination_conf;	// 词缀组合模板ID
		int				weight;					// 随机权重
	}
	random_config[64];
};

// QTE人怪交互
struct QTE_PLAYER_MONSTER_INTERACTION_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				qte_conf;					// QTE模板ID
	namechar		monster_hook_name[16];		// 怪物挂点
	namechar		player_hook_name[16];		// 玩家挂点
	unsigned int	is_player_initiative;		// 是否玩家主动挂怪物

	struct  
	{
		namechar		monster_action[16];		// 怪物动作
		namechar		player_action[16];		// 玩家动作
		unsigned int	is_hook_connect;		// 挂点是否连接
	}
	during_qte,									// QTE中
	qte_success,								// QTE成功
	qte_failed;									// QTE失败

	int				player_cast_skill_on_qte_success;	// QTE成功玩家释放技能ID
	int				player_cast_skill_delay;			// 玩家技能施放延迟时间（毫秒）
	int				monster_cast_skill_on_qte_failed;	// QTE失败怪物释放技能ID
	int				monster_cast_skill_delay;			// 怪物技能施放延迟时间（毫秒）
};

// 战场
struct BATTLE_FIELD_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				category;					// 战场类型: 0-阿提卡遗迹, 1-混沌战场, 2-熔岩战场, 3-飞行战场
	int				map_id;						// 战场对应的地图编号
	int				player_count;				// 战场人数（单方）
	int				group_a_count;				// a方人数 player_count不再生效
	int				group_b_count;				// b方人数 player_count不再生效
	int				level_section[10];			// 等级段1-10下限
	
	unsigned int	daily_limit;				// 每日限次
	WEEKDAY_TIME	daily_limit_reset_time;		// 每日限次重置时间
	unsigned int	weekly_limit;				// 每周限次
	WEEKDAY_TIME	weekly_limit_reset_time;	// 每周限次重置时间

	struct
	{
		WEEKDAY_TIME	open;					// 开启时间
		WEEKDAY_TIME	close;					// 关闭时间
	}
	time_section[4];							// 时间段配置
	
	int				entry_point[3];				// A方，B方，旁观方进入点ID
	int				revive_point[3];			// A方，B方，旁观方复活点ID
	int				observer_buff[3];			// 旁观方buff

	int				controller_on_start;		// 战斗开始时开启控制器ID
	int				battle_duration;			// 战场持续时间（分）
	int				escape_punish_time;			// 逃跑惩罚时间（分）
	int				battle_prepare_time;		// 战斗准备时间（秒）
	int				battle_end_count_down;		// 结束倒计时时间（秒）
	int				revive_count_down;			// 死亡复活倒计时时间（秒）

	int				resource;					// 资源总量
	int				kill_score;					// 击杀得分
	int				assist_score;				// 助攻得分
	int				assist_score_min_per_kill;	// 单次助攻积分下限
	int				assist_score_max_per_kill;	// 单次助攻积分上限
	float			healer_assist_factor;		// 仙女助攻积分系数
	int				rescue_score;				// 拯救积分
	int				first_blood_score;			// 首杀得分

	int				winner_extra_score;			// 胜方额外得分
	int				loser_extra_score;			// 负方额外得分
	int				draw_game_extra_score;		// 平手额外得分

	struct
	{
		int			count;						// 连杀数
		int			notification_text;			// 到达该连杀数时广播文字
	}
	combo_kill[3];
};

// 队伍加成配置
struct TEAM_POWER_UP_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				time_section[4];			// 组队时间1-4档上限（秒）
	int				friendship_section[4];		// 队伍总好友度1-4档上限

	int				buff_pack_table[5][5];		// 组队时间1-5档好友度1-5档状态包ID
};

// 翅膀 
struct WING_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				model_path[2];				// 翅膀男/女模型路径
	unsigned int	default_color;				// 默认颜色
	float			fly_speed;					// 飞行速度
	int				open_wings_pray_time;		// 打开翅膀吟唱时间

	struct  
	{
		int			id;							// 飞行附带技能ID
		int			level;						// 飞行附带技能等级
	}
	fly_skills[4];								// 飞行附带技能1-4
	
	unsigned int	fly_replace_skill_bar;			// 飞行时替换技能栏
	unsigned int	fly_show_addtional_skill_bar;	// 飞行时显示额外技能栏

	unsigned int	fly_addon_pack[5];			// 飞行附加属性包ID1-5
};

// 单人竞技场
struct SOLO_ARENA_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				win_base_score;				// 获胜获得基础积分
	int				lose_base_score;			// 失败获得基础积分
	int				combo_score[4];				// 2/10/15/20连胜以上获得积分

	struct
	{
		int			score;						// 积分
		struct
		{
			int		items[5];					// 奖励物品
			int		bind_money;					// 奖励绑定币
			int		money;						// 奖励交易币
		}
		instant_award,							// 当场奖励
		finish_award;							// 结算奖励
	}
	sections[10];								// 1-10档
};

// 抽奖
struct LUCKY_DRAW_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct
	{
		float		ratio;						// 倍率
		float		prob;						// 概率
	}
	money_exp_sections[5];						// 经验和钱第1-5档倍率

	struct
	{
		int			item_id;					// 物品ID
		int			count;						// 物品数量
		unsigned int is_bind;					// 物品是否绑定
		float		prob;						// 概率
	}
	item_config[10];							// 物品1-10

	int				draw_cost_bind_money;		// 每次抽奖消耗绑定币数量
	int				draw_cost_money;			// 每次抽奖消耗交易币数量
	int				draw_cost_item;				// 每次抽奖消耗物品ID
	int				draw_cost_item_count;		// 每次抽奖消耗物品数量
	int				draw_cost_fix_config;		// 消耗用等级修正表ID
	int				max_draw_count;				// 最大抽奖次数
};

// 聚能套装属性表
struct EQUIPMENT_ENHANCE_COMBO_CONFIG 
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct
	{
		float		perfect_point;				// 阶段n单件完美度
		int			addon_package;				// 阶段n属性包
	}
	sections[15];								// 15个阶段
};

// 每日杀怪数限制
struct MONSTER_KILL_LIMIT_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				max_per_day;				// 每日杀怪数上限
	int				monster_ids[10];			// 怪物ID1-10
};

// 物品兑换
struct ITEM_EXCHANGE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				item_id;					// 兑换物品ID
	int				item_count;					// 兑换物品数量
	int				is_bind;					// 兑换物品是否绑定

	unsigned int	is_limited;					// 可兑换次数上限
	int				reset_type;					// 兑换重置类型 0=不重置 1=每日6点重置 2=每周一6点重置 
	int				description;				// 兑换描述

	int				require_player_level;		// 需求人物等级
	int				require_fight_power;		// 需求人物战斗力
	int				require_exchanged;			// 前提兑换ID
	int				require_task;				// 前提任务ID
	int				mutex_task;					// 互斥任务ID
	int				mutex_saint_cloth;			// 互斥圣衣ID
	int				require_repu;				// 前提声望ID
	int				require_repu_value;			// 前提声望值

	struct
	{
		int			id;							// 物品ID
		int			count;						// 物品数量
	}
	cost_item[3];								// 兑换需求物品1-3

	int				cost_money;					// 兑换需求金币
	int				cost_bind_money;			// 兑换需求绑定币
	int				cost_repu;					// 兑换需求声望ID
	int				cost_repu_value;			// 兑换需求声望值
};

// 每日福利任务配置
struct DAILY_BENEFIT_TASK_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	WEEKDAY_TIME	reset_time;					// 军团福利库开启状态每日重置时间
	struct
	{
		int			library_id;					// 军团福利库ID
		int			cost_item_id;				// 军团福利库开启所需物品
		int			cost_item_count;			// 军团福利库开启所需物品数量
		int			get_item_id;				// 军团福利库开启者获得物品
		int			get_item_count;				// 军团福利库开启者获得物品数量
	}
	config[3];									// 福利库配置1-3
};

// 星域探索配置表
struct STAR_FIELD_EXPLORE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct
	{
		int			atom_gen_config_id;			// 普通微粒生成配置ID
		float		special_atom_prob;			// 惊喜微粒生成概率
		int			special_atom_gen_config_id;	// 惊喜微粒生成配置ID
		int			explore_cost_bind_money;	// 消耗绑定币
		int			explore_cost_item_id;		// 消耗物品ID
		int			explore_cost_item_count;	// 消耗物品数量
	}
	field[75];									// 探索区域1-75
};

// 微粒生成配置表
struct ATOM_GENERATION_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	float			gen_count_prob[4];			// 获得1-4个微粒的概率
	struct
	{
		int			id;							// 微粒ID
		float		prob;						// 概率
		int			count;						// 数量
	}
	atom[32];									// 微粒1-32
};

// 微粒合成配置表
struct ATOM_COMBINE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct
	{
		namechar	name[16];					// 名字
		int			need_count;					// 合成需求数量
		int			cost_bind_money;			// 合成需要绑定币
		int			cost_money;					// 合成需要金币
		struct
		{
			int			id;						// 物品ID
			int			count;					// 物品数量
		}
		cost_item[3];							// 合成需要物品1-3
		int			increase_prob_item;			// 合成需要增加概率物品
		float		normal_prob;				// 不使用概率物品时合成概率
		float		increased_prob;				// 使用概率物品时合成概率
	}
	atom[10];									// 微粒合成1-10
};

// 微粒链配置
struct ATOM_CHAIN_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				level_max;					// 微粒链等级上限
	struct
	{
		namechar	name[16];					// 名称
		int			atom_req_config;			// 微粒需求配置
		int			background_path;			// 背景图
		int			teammate_atom_req_config;	// 溅射微粒生成配置
		int			addon_pack;					// 完成获得属性包

		struct
		{
			int		id;							// 完成获得物品ID
			int		count;						// 完成获得物品数量
			float	prob;						// 完成获得物品概率
		}
		complete_award_items[3];

		int			complete_active_star_field_incubation;	// 完成激活星域培养ID
	}
	chain[100];									// 微粒链1-100级
};

// 微粒需求配置
struct ATOM_REQUIREMENT_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct
	{
		int			req_atom_id;				// 需求微粒ID
		int			req_atom_count;				// 需求微粒数量
		struct  
		{
			int		x;							// x座标
			int		y;							// y座标
		}
		pos;									// 座标 
	}
	slot[32];									// 位置1-32
};

// 星力配置
struct COSMOS_STAR_FORCE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct
	{
		int			star_force;					// 星力值
		int			addon_pack;					// 激活的附加属性包
	}
	config[10];									// 星力配置1-10
};

// 星域培养配置
struct STAR_FIELD_INCUBATION_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				icon;						// 显示图标
	int				incubate_time;				// 培养时间(秒)
	int				drop_table;					// 产出掉落表
	int				cost_bind_money;			// 消耗绑定币
	int				cost_money;					// 培养时间(秒)
	
	struct
	{
		int			id;							// ID
		int			count;						// 数量
	}
	cost_items[3],								// 消耗物品
	cost_atoms[3];								// 消耗微粒
};

// 披风配置
struct CLOAK_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				model_path[2];				// 男/女模型路径
};

// 神器配置
struct RELIC_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct
	{
		int			need_power;					// 需要神力值
		int			max_enhance_level;			// 允许最高精炼等级
	}
	states[5];									// 境界1-5

	struct
	{
		float		prob;						// 成功概率
		int			increase_blesssing_on_failed;// 失败后增加祝福值
		int			optional_item;				// 可选物品id
		float		prob_with_optional_item;	// 使用可选物品时的成功率
		int			increase_blesssing_on_failed_with_optional_item;	// 使用可选物品失败时增加的祝福值
		int			max_blessing;				// 祝福值上限
		int			require_aura[6];			// 0:唯一属性精炼需要灵气，1-5:境界1-5属性精炼需要灵气
	}
	enhance_config[32];							// 精炼1-32
};

// 神器属性条目配置
struct RELIC_PROP_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct
	{
		int			addon_pack;					// 附加属性包
		int			power;						// 附加神力值
		int			addon_pack_for_slot[12];	// 生效栏1-12附加属性包
	}
	enhance[33];								// 精炼0-32
};

// 神器组合配置
struct RELIC_COMBO_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				relics[12];					// 组合中的神器1-12
	int				need_count;					// 组合属性需要符合的神器数量
	int				addon_pack;					// 组合属性属性包
	int				fight_power;				// 组合属性战斗力
};

// 圣斗士意志配置
struct SAINT_WILLPOWER_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct
	{
		int			need_player_level;			// 开启需要人物等级
		int			need_skill_point;			// 开启需要觉悟值
		int64_t		cost_exp;					// 开启需要消耗经验值
		int			addon_pack;					// 附带属性包
		int			enable_star_id;				// 开启星辰ID
	}
	config[200];								// 等级1~200
};

// 调查问卷配置
struct SURVEY_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	unsigned int	is_enable;					// 问卷是否开放
	int				award_task;					// 奖励任务ID
	unsigned int	questions_count;			// 问题总数
	unsigned int	options_count[10];			// 问题1-10最大选项数量
};

// 灵魂之甲
struct SOUL_ARMOR_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				icon_path;					// 图标路径
	int				type;						// 铠甲类型
	int				gem_type_mask;				// 允许镶嵌宝石类型
	int				init_level;					// 铠甲初始等级

	struct
	{
		int			addon_pack;					// x级附加属性包
		int			max_gem_count;				// x级允许镶嵌宝石个数
		int			max_gem_level;				// x级允许镶嵌宝石最高等级
	}
	config[16];									// 0-15级

	struct
	{
		int			need_player_level;			// 升到x级需要人物等级
		int			cost_item;					// 升到x级需要物品ID
		int			cost_item_count;			// 升到x级需要物品数量
		int			cost_bind_money;			// 升到x级需要绑定金币
		int			cost_exp;					// 升到x级需要消耗经验
		int			cost_exp2;					// 升到x级需要消耗第二经验
	}
	upgrade_config[15];							// 升到1-15级需求配置
};

// 灵魂宝石激活属性
struct SOUL_ARMOR_GEM_COMBO_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				armor_type;					// 生效部位
	int				gem_type[5];				// 激活宝石类型1-5

	struct
	{
		int			req_gem_level_min;			// 激活技能需要最低等级
		int			skill_id;					// 激活技能ID
	}
	active_skill[4];							// 激活技能1-4
};

// 服务器大战 
struct SERVER_BATTLE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				map_id;						// 战场对应的地图编号	
	int				player_count;				// 战场人数（单方）

	struct
	{
		int			cost_item;					// 进入赛场要求物品
		int			controller_on_start;		// 赛场开始时开启控制器
	}
	field_config[3];							// 赛场1-3

	int				observer_item;				// 旁观进入赛场要求物品
	
	int				entry_point[3];				// A方，B方，旁观方进入点ID
	int				revive_point[3];			// A方，B方，旁观方复活点ID

	int				observer_buff[3];				//旁观方buff

	int				battle_duration;			// 战场持续时间（分）
	int				battle_prepare_time;		// 战斗准备时间（秒）
	int				battle_end_count_down;		// 结束倒计时时间（秒）
	int				revive_count_down;			// 死亡复活倒计时时间（秒）

	int				resource;					// 资源总量
	int				kill_score;					// 击杀得分
	int				assist_score;				// 助攻得分
	int				assist_score_min_per_kill;	// 单次助攻积分下限
	int				assist_score_max_per_kill;	// 单次助攻积分上限
	float			healer_assist_factor;		// 仙女助攻积分系数
	int				rescue_score;				// 拯救积分
	int				first_blood_score;			// 首杀得分

	int				winner_extra_score;			// 胜方额外得分
	int				loser_extra_score;			// 负方额外得分
	int				draw_game_extra_score;		// 平手额外得分

	struct
	{
		int			count;						// 连杀数
		int			notification_text;			// 到达该连杀数时广播文字
	}
	combo_kill[3];

	struct
	{
		int				winner_award_task;			// 胜方奖励任务id
		int				loser_award_task;			// 负方奖励任务id
	}
	round[2];
	
};

// 小数值声望模板
struct LITTLE_VALUE_REPUTATION_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	struct  
	{
		namechar			repu_name[16];		// 声望名称
		int					repu_min;			// 声望数值下限
		int					repu_max;			// 声望数值上限

	}reputations[64];
};

// 服务器教皇
struct SERVER_PAPA_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// 名称

	int				candidate_fight_value_req;		//	候选人需求战斗力
	int				voter_fight_value_req;			//	选举人需求战斗力
	int				voter_num_req;					//	开启选举所需选举人数

	int				papa_banner_item;				//	教皇令旗id
	int				banner_used_limit_per_day;		//  令旗每天使用次数上限
	int				papa_fashion_items[2];			//	教皇时装物品id
	int				forbid_chat_limit_per_day;		//	每日禁言次数上限
	int				forbid_chat_item;				//	禁言消耗物品id

	int				papa_server_tasks[3];			//	教皇全服任务id

};

// CONFIG add here

enum ID_SPACE
{
	ID_SPACE_INVALID	= -1,
	ID_SPACE_ESSENCE	= 0,
	ID_SPACE_ADDON		= 1,
	ID_SPACE_TALK		= 2,
	ID_SPACE_RECIPE		= 3,
	ID_SPACE_CONFIG		= 4,

	ID_SPACE_MAX,
};

enum DATA_TYPE
{
	DT_INVALID = 0,
	DT_EQUIPMENT_ADDON,
	DT_EQUIPMENT_ESSENCE,
	DT_REFINE_TICKET_ESSENCE,
	DT_MEDICINE_ESSENCE,
	DT_MATERIAL_ESSENCE,
	DT_SKILLTOME_ESSENCE,		
	DT_TRANSMITROLL_ESSENCE,
	DT_LUCKYROLL_ESSENCE,
	DT_TOWNSCROLL_ESSENCE,
	DT_REVIVESCROLL_ESSENCE,
	DT_TASKMATTER_ESSENCE,
	DT_DROPTABLE_ESSENCE,
	DT_MONSTER_ESSENCE,	
	DT_NPC_TALK_SERVICE,
	DT_NPC_SELL_SERVICE,
	DT_NPC_BUY_SERVICE,
	DT_NPC_TASK_IN_SERVICE,
	DT_NPC_TASK_OUT_SERVICE,
	DT_NPC_TASK_MATTER_SERVICE,
	DT_NPC_HEAL_SERVICE,
	DT_NPC_TRANSMIT_SERVICE,
	DT_NPC_PROXY_SERVICE,
	DT_NPC_STORAGE_SERVICE,
	DT_NPC_TYPE,
	DT_NPC_ESSENCE,
	DT_TALK_PROC,
	DT_RECIPE_ESSENCE,	
	DT_ENEMY_FACTION_CONFIG,
	DT_CHARRACTER_CLASS_CONFIG,
	DT_PARAM_ADJUST_CONFIG,
	DT_TASKDICE_ESSENCE,
	DT_TASKNORMALMATTER_ESSENCE,
	DT_PLAYER_LEVELEXP_CONFIG,
	DT_MINE_ESSENCE,
	DT_FIREWORKS_ESSENCE,
	DT_NPC_WAR_TOWERBUILD_SERVICE,
	DT_PLAYER_SECONDLEVEL_CONFIG,
	DT_NPC_RESETPROP_SERVICE,
	DT_ESTONE_ESSENCE,
	DT_PSTONE_ESSENCE,
	DT_SSTONE_ESSENCE,
	DT_RECIPEROLL_ESSENCE,
	DT_SUITE_ESSENCE,
	DT_DOUBLE_EXP_ESSENCE,
	DT_NPC_EQUIPBIND_SERVICE,
	DT_NPC_EQUIPDESTROY_SERVICE,
	DT_NPC_EQUIPUNDESTROY_SERVICE,
	DT_SKILLMATTER_ESSENCE,
	DT_VEHICLE_ESSENCE,
	DT_COUPLE_JUMPTO_ESSENCE,
	DT_LOTTERY_ESSENCE,
	DT_CAMRECORDER_ESSENCE,
	DT_TITLE_PROP_CONFIG,
	DT_SPECIAL_ID_CONFIG,
	DT_TEXT_FIREWORKS_ESSENCE,
	DT_TALISMAN_MAINPART_ESSENCE,
	DT_TALISMAN_EXPFOOD_ESSENCE,
	DT_TALISMAN_MERGEKATALYST_ESSENCE,
	DT_TALISMAN_ENERGYFOOD_ESSENCE,
	DT_SPEAKER_ESSENCE,
	DT_PLAYER_TALENT_CONFIG,
	DT_POTENTIAL_TOME_ESSENCE,
	DT_AIRCRAFT_ESSENCE,
	DT_CHANGE_SHAPE_ESSENCE,
	DT_SUMMON_MONSTER_ESSENCE,
	DT_PET_BEDGE_ESSENCE,
	DT_PET_FOOD_ESSENCE,
	DT_PET_SKILL_ESSENCE,
	DT_PET_ARMOR_ESSENCE,
	DT_MERGE_RECIPE_ESSENCE,
	DT_NPC_HOTEL_SERVICE,
	DT_STATUS_POINT_PROP_CONFIG,
	DT_PLAYER_STATUS_POINT_CONFIG,
	DT_PRODUCE_TYPE_CONFIG,
	DT_NPC_LEARN_PRODUCE_SERVICE,
	DT_AI_HELPER_ESSENCE,
	DT_ITEM_TRADE_CONFIG,
	DT_LEVELUP_MODIFY_CONFIG,
	DT_SKILL_LEARN_CONFIG,
	DT_EQUIPMENT_QUALITY_CONFIG,
	DT_EQUIPMENT_ENHANCE_TRANSFORM_CONFIG,
	DT_TRADE_DISTANCE_CONFIG,
	DT_NPC_LEARN_SKILL_SERVICE,
	DT_NPC_TRADE_PORT_SERVICE,
	DT_NPC_SWITCH_PROF_SERVICE,
	DT_TRADE_ITEM_ESSENCE,
	DT_ADDON_PACKAGE_CONFIG,
	DT_ADDON_STORAGE_CONFIG,
	DT_EQUIPMENT_PROPERTY_RANDOM_CONFIG,
	DT_INSTANCE_CONFIG,
	DT_BOOK_ESSENCE,
	DT_TRADE_RANDOM_EVENT_CONFIG,
	DT_MONEYBAG_ESSENCE,
	DT_SYSTEM_MAIL_CONFIG,
	DT_INSTANCE_TABLE_CONFIG,
	DT_PET_REVIVE_ESSENCE,
	DT_FIRE_ESSENCE,
	DT_KM_PARAM_ADJUST_CONFIG,
	DT_TIME_GIFT_BAG_CONFIG,
	DT_EQUIPMENT_ENHANCE_MODEL_CONFIG,
	DT_IDENTIFY_SCROLL_ESSENCE,
	DT_CHAR_CAMERA_CONFIG,
	DT_DYNAMIC_INSTANCE_CONFIG,
	DT_DYNAMIC_MONSTER_PACK_ESSENCE,
	DT_PLAYER_SUB_PROF_LEVEL_EXP_CONFIG,
	DT_PET_EGG_ESSENCE,
	DT_SPECIAL_STATUS_PACKAGE_CONFIG,
	DT_STATUS_PACKAGE_EXPRESSIONS_CONFIG,
	DT_RESURRECT_TIME_CONFIG,
	DT_NPC_RECIPE_ESSENCE,
	DT_GIFT_BAG_CONFIG,
	DT_SPECIAL_ITEMS_PACK_ESSENCE,
	DT_TRANSMITBOX_ESSENCE,
	DT_REPUTATION_CONFIG,
	DT_TASK_FIX_CONFIG,
	DT_BODY_TRANSFORM_CONFIG,
	DT_MONSTER_NPC_PACK_CONFIG,
	DT_TEXT_PACK_CONFIG,
	DT_STAR_SOUL_CHAIN_CONFIG,
	DT_STAR_SOUL_STONE_ESSENCE,
	DT_STAR_SOUL_CHAIN_COMBO_CONFIG,
	DT_COMBO_PACK_CONFIG,
	DT_MINE_PACK_CONFIG,
	DT_SUMMON_MONSTER_NPC_PACK_CONFIG,
	DT_SUMMON_MINE_PACK_CONFIG,
	DT_ENHANCE_ITEM_ESSENCE,
	DT_ENHANCE_SHOW_CONFIG,
	DT_WORLD_TELEPORT_POINT_CONFIG,
	DT_ENHANCE_TRANSFER_CONFIG,
	DT_STAR_SOUL_STONE_UPGRADE_ITEM_ESSENCE,
	DT_EQUIPMENT_PROCESSING_ITEM_ESSENCE,
	DT_PET_APTITUDE_STONE_ESSENCE,
	DT_PET_SKILL_LEVEL_UP_STONE_ESSENCE,
	DT_COMMON_MONSTER_CONFIG,
	DT_PET_GROWTH_STONE_ESSENCE,
	DT_PET_CATCHER_ESSENCE,
	DT_SUMMON_CATEGORY_CONFIG,
	DT_STORED_EXP_CONFIG,
	DT_PASSIVE_SKILL_CONFIG,
	DT_DROP_BY_LEVEL_CONFIG,
	DT_STORAGE_TASK_MAX_COUNT_CONFIG,
	DT_LEVEL_ADAPT_WEIGHT_CONFIG,
	DT_GUARDIAN_STAR_CONFIG,
	DT_GUARDIAN_STONE_ESSENCE,
	DT_LEAGUE_WAR_CONFIG,
	DT_GUARDIAN_SOUL_ESSENCE,
	DT_GUARDIAN_SOUL_SKILL_ESSENCE,
	DT_GUARDIAN_SOUL_SKILL_UP_ESSENCE,
	DT_GUARDIAN_SOUL_APTITUDE_STONE_ESSENCE,
	DT_REST_EXP_CONFIG,
	DT_NPC_DUNGEON_SERVICE,
	DT_ENFORCED_MOVE_CONFIG,
	DT_PROF_SELECT_SERVICE,
	DT_STAR_BOARD_CONFIG,
	DT_STAR_CONFIG,
	DT_ASTROLOGY_CONFIG,
	DT_STAR_SOUL_ESSENCE,
	DT_ASTROLOGY_ITEM_ESSENCE,
	DT_EXTEND_ENHANCE_LIMIT_ITEM_ESSENCE,
	DT_SOLO_CHALLENGE_DUNGEON_CONFIG,
	DT_CLOTH_CONFIG,
	DT_QTE_CONFIG,
	DT_ATHENA_BLESSING_CONFIG,
	DT_SELF_SERVICE_CONFIG,
	DT_CLOTH_UPGRADE_ITEM_ESSENCE,
	DT_ATHENA_AWARD_CONFIG,
	DT_DAILY_LIMITATION_CONFIG,
	DT_HOOK_MODEL_CONFIG,
	DT_NPC_LIMITED_SALE_SERVICE,
	DT_CLOTH_UPGRADE_CONFIG,
	DT_PRODUCE_ENERGY_CONFIG,
	DT_SUIT_TAG_CONFIG,
	DT_SUIT_TAG_ACTIVE_CONFIG,
	DT_VALUE_INCREASE_ESSENCE,
	DT_PET_CONFIG,
	DT_PET_ACCESSORY_ESSENCE,
	DT_PRAY_EXP_CONFIG,
	DT_CONSTELLATION_GUARD_CONFIG,
	DT_LEAGUE_REPU_CONFIG,
	DT_ALBUM_CONFIG,
	DT_MODEL_CANDIDATE_CONFIG,
	DT_COMBAT_PET_ESSENCE,
	DT_COMBAT_PET_SKILL_BOOK_ESSENCE,
	DT_COMBAT_PET_EQUIPMENT_ESSENCE,
	DT_STAR_SOUL_BOX_ESSENCE,
	DT_EQUIPMENT_APPEARANCE_ESSENCE,
	DT_PLAYER_APPEARANCE_ESSENCE,
	DT_DRIFT_BOTTLE_ESSENCE,
	DT_COMBAT_PET_CONFIG,
	DT_VIP_CONFIG,
	DT_MONSTER_AFFIX_COMBINATION_CONFIG,
	DT_MONSTER_AFFIX_RANDOM_PACK_CONFIG,
	DT_QTE_PLAYER_MONSTER_INTERACTION_CONFIG,
	DT_BATTLE_FIELD_CONFIG,
	DT_TEAM_POWER_UP_CONFIG,
	DT_DIVINING_ITEM_ESSENCE,
	DT_WING_CONFIG,
	DT_SOLO_ARENA_CONFIG,
	DT_LUCKY_DRAW_CONFIG,
	DT_NPC_BATTLE_FIELD_SERVICE,
	DT_EQUIPMENT_ENHANCE_COMBO_CONFIG,
	DT_NPC_IMPRINT_SERVICE,
	DT_MONSTER_KILL_LIMIT_CONFIG,
	DT_ITEM_EXCHANGE_CONFIG,
	DT_NPC_ITEM_EXCHANGE_SERVICE,
	DT_EMOTION_ICON_PACK_ESSENCE,
	DT_DAILY_BENEFIT_TASK_CONFIG,
	DT_REVENGE_ITEM_ESSENCE,
	DT_STAR_FIELD_EXPLORE_CONFIG,
	DT_ATOM_GENERATION_CONFIG,
	DT_ATOM_COMBINE_CONFIG,
	DT_ATOM_CHAIN_CONFIG,
	DT_ATOM_REQUIREMENT_CONFIG,
	DT_COSMOS_STAR_FORCE_CONFIG,
	DT_STAR_FIELD_INCUBATION_CONFIG,
	DT_EQUIPMENT_DYE_ESSENCE,
	DT_RELIC_ESSENCE,
	DT_CLOAK_CONFIG,
	DT_RELIC_CONFIG,
	DT_RELIC_PROP_CONFIG,
	DT_RELIC_COMBO_CONFIG,
	DT_SUIT_TAG_MIGRATION_CONFIG,
	DT_MARRIAGE_CERTIFICATE_ESSENCE,
	DT_NPC_FORCE_SELECT_SERVICE,
	DT_SAINT_WILLPOWER_CONFIG,
	DT_SURVEY_CONFIG,
	DT_SOUL_ARMOR_CONFIG,
	DT_SOUL_ARMOR_GEM_ESSENCE,
	DT_SOUL_ARMOR_GEM_COMBO_CONFIG,
	DT_SERVER_BATTLE_CONFIG,
	DT_SKILL_CLEANER_ESSENCE,
	DT_LITTLE_VALUE_REPUTATION_CONFIG,
	DT_SERVER_PAPA_CONFIG,

	DT_MAX,
};

#pragma pack(pop, EXP_TYPES_INC)
#endif//_EXP_TYPES_H_


