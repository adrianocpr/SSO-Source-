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
	// ��̸����
	NPC_TALK = 0x80000000,
	// ������Ʒ�ķ���
	NPC_SELL,
	// �ַ��������
	NPC_GIVE_TASK,
	// ����������
	NPC_COMPLETE_TASK,
	// ���ͷ���
	NPC_TRANSMIT,
	// ѧϰ�������ܷ���
	NPC_LEARN_PRODUCE,
	// ���ｻ��
	NPC_ITEM_TRADE,
	// ѧϰ����
	NPC_LEARN_SKILL,
	// TALK����
	TALK_RETURN,
	// �����Ի�
	TALK_EXIT,
	// ��������
	TALK_GIVEUP_TASK,
	// ְҵѡ��
	NPC_PROF_SELECT,
	// ��������
	NPC_DUNGEON,
	// �������۷���
	NPC_LIMITED_SALE,
};

/// NPC �򵥷�����
enum NPC_SIMPLE_SERVICE
{
	SIMPLE_SERVICE_MAIL                     = 0,         ///< �ʼķ���
	SIMPLE_SERVICE_STORAGE                  = 1,         ///< �ֿ����
	SIMPLE_SERVICE_LEAGUE_STORAGE           = 2,         ///< ���Ųֿ�
	SIMPLE_SERVICE_LEAGUE                   = 3,         ///< ���ŷ���
	SIMPLE_SERVICE_LEAGUE_BASE              = 4,         ///< ���ط���
	SIMPLE_SERVICE_LEAGUE_BASE_LEAVE        = 5,         ///< �뿪���ط���
	SIMPLE_SERVICE_DECLARE_LEAGUE_WAR       = 6,         ///< ������ս
	SIMPLE_SERVICE_AUCTION                  = 7,         ///< ��������
	SIMPLE_SERVICE_PROF_SWITCH              = 8,         ///< ְҵ�л�
	SIMPLE_SERVICE_ITEM_DECOMPOSE           = 9,         ///< �ֽ����
	SIMPLE_SERVICE_EQUIP_REFINE             = 10,        ///< װ��ǿ��
	SIMPLE_SERVICE_REFINE_TRANSFER          = 11,        ///< װ��ǿ��ת��
	SIMPLE_SERVICE_EQUIP_PROCESSING         = 12,        ///< װ���ӹ�
	SIMPLE_SERVICE_EQUIP_MERGE_ENHANCE      = 13,        ///< װ���ں�ǿ��
	SIMPLE_SERVICE_MAP_TELEPORT             = 14,        ///< ���ͼ����
	SIMPLE_SERVICE_DOUBLE_EXP               = 15,        ///< ˫������ʱ��
	SIMPLE_SERVICE_LEAVE_DUNGEON            = 16,        ///< �뿪����
	SIMPLE_SERVICE_LEAGUE_BONUS             = 17,        ///< �����Ƽ�������ȡ
	SIMPLE_SERVICE_SOLO_CHALLENGE_DUNGEON   = 18,        ///< ������ս����
	SIMPLE_SERVICE_AFK_EXP					= 19,        ///< �һ�
	SIMPLE_SERVICE_PET_MATING				= 20,        ///< ���ﻯ��
	SIMPLE_SERVICE_GIFT_CARD				= 21,        ///< ��Ʒ��
	SIMPLE_SERVICE_REFERER_INFO				= 22,        ///< �ƹ�����Ϣ
	SIMPLE_SERVICE_ATHENA_CERTIFICATION		= 23,        ///< ��֤�ŵ���
	SIMPLE_SERVICE_XUNBAO					= 24,        ///< Ѱ����
	SIMPLE_SERVICE_EQUIPMENT_DYEING			= 25,        ///< װ��Ⱦɫ
	SIMPLE_SERVICE_LEAGUE_UNION				= 26,        ///< ��������
	SIMPLE_SERVICE_SUIT_TAG_MIGRATION		= 27,        ///< ����ת��
	SIMPLE_SERVICE_EXP_EXCHANGE				= 28,        ///< ����ת��Ϊ�ڶ����� 
	SIMPLE_SERVICE_SERVER_BATTLE			= 29,        ///< ��������ս 
	SIMPLE_SERVICE_ACTIVITY_BATTLE			= 30,		 ///< �ս��
};

/// ITEM_COMMON_PROP::proc_type ���
enum PROC_TYPE
{
	ITEM_PROC_TYPE_NOSELL				= 0x0001,	//�޷�����NPC
	ITEM_PROC_TYPE_NOTRADE  			= 0x0002,	//��Ҽ䲻�ܽ���
	ITEM_PROC_TYPE_CASHITEM 			= 0x0004,	//���������Ʒ
	ITEM_PROC_TYPE_TASKITEM 			= 0x0008,	//��������Ʒ
	ITEM_PROC_TYPE_BIND2				= 0x0010,	//װ�����󶨵���Ʒ
	ITEM_PROC_TYPE_BIND					= 0x0020,	//���Ѿ��󶨵���Ʒ
	ITEM_PROC_TYPE_NO_DEPOSIT			= 0x0040,	//���ɴ�Ųֿ�
	ITEM_PROC_TYPE_NODESTROY			= 0x0080,	//����������
	ITEM_PROC_TYPE_AUTO_DEL				= 0x0100,	//�뿪�ض�����ɾ��  
	ITEM_PROC_TYPE_DROP 				= 0x0200,	//��������ʱ����
	ITEM_PROC_TYPE_PICKBIND				= 0x0400,   //ʰȡ��
	ITEM_PROC_TYPE_SOULBIND_ON_EQUIP	= 0x0800,   //װ��������
	ITEM_PROC_TYPE_DROP_ON_DEAD			= 0x1000,   //����������ʱ����
};

/// ��ӪMask
enum FACTION_MASK
{
	FACTION_NORMAL					 = 0x0001,		///< ��ͨ���
	FACTION_WHITE_NAME				 = 0x0002,		///< ����״̬
	FACTION_RED_NAME				 = 0x0004,		///< ����״̬
	FACTION_BLUE_NAME				 = 0x0008,		///< ����״̬
	FACTION_ATTACKER				 = 0x0010,		///< ��ս����
	FACTION_DEFENDER				 = 0x0020,		///< ��ս�ط�
	FACTION_ATTACKER_ALLIES			 = 0x0040,		///< ��ս�����Ѿ�
	FACTION_DEFENDER_ALLIES			 = 0x0080,		///< ��ս�ط��Ѿ�
	FACTION_MONSTER_NORMAL			 = 0x0100,		///< ��ͨ����
	FACTION_NPC_NORMAL				 = 0x0200,		///< ��ͨNPC(���ܡ���������)
	FACTION_MONSTER_1				 = 0x0400,		///< ������ϵ1
	FACTION_MONSTER_2				 = 0x0800,		///< ������ϵ2
	FACTION_MONSTER_SELF_OPPOSITE	 = 0x1000,		///< �ԵжԹ���
	FACTION_NPC_NEUTRAL				 = 0x2000,		///< ����NPC
	FACTION_MONSTER_EVIL			 = 0x4000,		///< а�����
	FACTION_NPC_ENEMY				 = 0x8000,		///< �ж�NPC
	FACTION_MONSTER_BATTLE			 = 0x10000,		///< ��ս����
	FACTION_MONSTER_ENEMY			 = 0x20000,		///< �жԹ���
	FACTION_FORCE_ATHENA			 = 0x40000,		///< ʥ������
	FACTION_FORCE_POSEIDON			 = 0x80000,		///< ��������
	FACTION_FORCE_HADES				 = 0x100000,	///< ڤ������
};

#pragma pack(push, EXP_TYPES_INC, 4)

#ifdef LINUX
typedef unsigned short namechar;
#else
typedef wchar_t			namechar;
#endif


// װ������Ʒ��ͨ������
struct ITEM_COMMON_PROP
{
	int				item_quality;				// ��ƷƷ��
	int				drop_model;					// �򻯵���ģ��
	int				icon_path;					// ͼ��·��
	
	int				sell_bind_money;			// ���ۻ�ð󶨱�
	int				price;						// ���ۻ�ý��
	int				buy_bind_money;				// ��������󶨱�
	int				shop_price;					// ����������
	unsigned int	id_buy_pre_repu;			// ������������ǰ��ID
	int				buy_pre_repy;				// ������������ǰ��ֵ
	unsigned int	id_buy_repu;				// ������������ID
	int				buy_repy;					// ������������ֵ
	unsigned int	id_buy_item;				// ����������ƷID
	int				buy_item;					// ����������Ʒ����
	
	int				pile_num_max;				// ��Ʒ�ѵ�����
	int				max_hold;					// ����ʰȡ������������
	unsigned int	proc_type;					// ����ʽ
	int				auction_type[3];			// ������1~3������
};

// ��Ʒ�ֽ�ͨ������
struct ITEM_DECOMPOSE
{
	int					cost_cube_energy;	// �ֽ���Ҫ��cube����

	struct  
	{
		unsigned int	item_id;		// �ֽ�����Ʒid
		int				num;			// ����
		float			prob;			// ����
		float			bind_prob;			// �󶨸���
	}result[4];							// �ֽ�����Ʒ
	unsigned int		show_item[4];	// �����ʾ��Ʒ
};

struct WEEKDAY_TIME
{
	unsigned char second;
	unsigned char minute;	
	unsigned char hour;
	char weekday;		// ���ڣ���Ϊ0��Ϊ����Чʱ�䡣-1��ʾ�������ڡ�1-7�ֱ�Ϊ����һ�������ա�

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
// װ����ģ����Ҫʹ�õĸ������Ե����ݽṹ����
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
	unsigned int	id;							// �������Ե�ID
	namechar		name[32];					// �������Ե�����

	int				type;						// �������Ե�����

	int				num_params;					// ���������ԵĲ�������
	_param			param1;						// ��1�������������Ǹ�����
	_param			param2;						// ��2�������������Ǹ�����
	_param			param3;						// ��3�������������Ǹ�����
};


///////////////////////////////////////////////////////////////////////////////////////
//
// װ��ģ�����ݽṹ����
//
//
///////////////////////////////////////////////////////////////////////////////////////

// װ����������
struct EQUIPMENT_ESSENCE
{
	// ������Ϣ
	unsigned int	id;							// װ��(����)ID
	namechar		name[32];					// װ������

	int				category;					// ʥ�����	
	int				star_level;					// װ���Ǽ�

	unsigned int	equip_type;					// װ����𣬿��ܵ��� 0-������1-���ߣ�2-ʱװ��3-��Ʒ��4-����, 5-��ͼ��
	unsigned int	equip_mask;					// �߼��Ͽ���װ���Ĳ�λ���ɲ�ͬ��λMask��ɣ�ʹ�õĲ�λ����Ϊ��
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
												//  EQUIP_MASK_MOUNT			= 0x00100000, // ע��������Ȼ����װ��������ռ�ô�װ��λ
												//  EQUIP_MASK_STAR_ATLAS		= 0x00200000,
												//  EQUIP_MASK_FACE				= 0x00400000,
												//  EQUIP_MASK_EYE				= 0x00800000,
												//  EQUIP_MASK_FACE_DECORATION	= 0x01000000,
												//	EQUIP_MASK_SASH				= 0x02000000,	// 練�
												//	EQUIP_MASK_CLOAK			= 0x04000000,	// ����
												//	EQUIP_MASK_BELT				= 0x08000000,	// ����
												// 	EQUIP_MASK_ALL				= 0x07ffffff,
	int				file_model_male;			// ��ģ��·��
	int				file_model_female;			// Ůģ��·��
	int				file_model_male_l;			// ��ģ������·��
	int				file_model_female_l;		// Ůģ������·��
	int				file_model_arm_l;			// ģ����С��·����
	int				file_model_arm_r;			// ģ����С��·����
	int				active_cloak_level;			// ��������ȼ�

	int				model_candidate_config;		// ��ѡģ�����ñ�
	int				change_model_cost_item_count;// ����ģ�����ĵ�����
	unsigned int	is_can_change_color;		// �Ƿ�ɱ�ɫ
	int				change_color_cost_item_count;// ��ɫ���ĵ�����
	unsigned int	default_color;				// ��ɫͨ��Ĭ����ɫ

	unsigned int	equip_location;				// ģ�͸��ǲ�λ�����ܵ��У�
												// 0 - ����ʾ 1 - ͷ��/ͷ�� 2 - ͷ�� 3 - �ؼ� 4 - �ȼ� 
												// 5 - ���� 6 - ��� 7 - ���� 8 - ʱװͷ�� 9 - ʱװͷ�� 
												// 10 - ʱװ���� 11 - ʱװ���� 12 - ʱװ������ 13 - ʱװЬ 14 - ʱװ���� 
												// 15 - �� 16 - ��Ʒ1��Ԥ���� 17 - ��Ʒ2��Ԥ���� 18 - ��Ʒ3��Ԥ���� 19 - ��Ʒ4��Ԥ���� 
												// 20 - �۾� 21 - ���� 

	unsigned int	action_type;				// �����Ķ����������ͣ����ܵ���: 0-����, 1-����, 2-˫�ֽ�, 3-ħ��, 4-ʥ��, 5-˫����, 6-�����, 7-צ, 8-ذ��, 9-����
	unsigned int	show_type;					// �����ı������ͣ����ܵ��У�0-����, 1-������

	int				normal_attack_sfx;			// ��ͨ����ʱ����Ч·��
	int				armor_type;					// �������Ч����ID
	int				level;						// װ���ȼ�

	unsigned int	character_combo_id;			// ְҵ����
	unsigned int	require_gender;				// �Ա����ƣ�0-�У�1-Ů��2-��Ů����
	int				require_level;				// �ȼ�����
	int				require_cosmos_level;		// С����ȼ�����
	int				require_willpower_level;	// ��־�ȼ�����

	// ��������
	int				dur;						// �;�ֵ
	int				money_per_dur;				// ����1�;���Ҫ��Ǯ��
	int				hp;							// ����ֵ
	int				mp;							// ����ֵ
	int				min_dmg;					// С����
	int				max_dmg;					// �󹥻�
	int				defence;					// ����ֵ
	int				hit;						// ����
	int				dodge;						// ����
	int				element_dmg[5];				// ���Թ��������ء�ˮ���𡢷硢��
	int				fight_power;				// �����ṩս����

	// ��������
	unsigned int	id_random_all;				// ����������и������Կ�������ƷID
	unsigned int	id_random[8];				// ��������������Կ�n������ƷID
	unsigned int	id_random_spe;				// ����������⸽������������ƷID
	unsigned int	id_prop_storage[8];			// �������Կ�nID
	float			spe_prop_ratio;				// �������Կ����
	unsigned int	id_spe_prop_storate;		// �������Կ�ID

	int				suit_tag_conf;				// ��װ��ʶ��ID
	struct
	{
		int			cost_item;					// ��Ҫ����Ʒ
		int			cost_item_count;			// ��Ҫ����Ʒ����
		int			cost_money;					// ��Ҫ�Ľ�Ǯ
		int			refresh_suit_tag_conf;		// �������װ��ʶ��ID
	}
	refresh_suit_tag;							// �������װ��ʶ

	unsigned int	is_suit_tag_migratable;		// ��ʶ�Ƿ��ת��

	struct
	{
		int			item_id;					// �����ʶ��Ҫ����Ʒ
		int			item_count;					// �����ʶ��Ҫ����Ʒ����
	}
	suit_tag_lock_item[10];						// �����ʶ1-10�������

	int				max_enhanch_level;			// ��߿ɵ���ǿ���ȼ�
	int				enhance_type;				// ǿ����������
	struct
	{
		int			min;						// ������Сֵ
		int			max;						// �������ֵ
		int			cost_item_candidates[4];	// ǿ���������
		int			cost_item_count;			// ǿ�������������
		float		success_prob;				// ǿ���ɹ���
		int			cost_money;					// ǿ�������Ǯ
	}
	enhance_configs[20];						// ǿ��1-20����

	struct
	{
		int			id;							// �������԰�id	
		int			need_enhance_level;			// �������԰���Ч��Ҫǿ���ȼ�
		float		need_perfect_point;			// �������԰���Ч��Ҫ������
	}
	extra_addon_packages[16];					// �������԰�����

	int				per_perfect_point_addon_type;	// ÿ�����������ӵĸ���������������
	int				per_perfect_point_addon_value;	// ÿ�����������ӵĸ���������ֵ

	int				fusion_product;				// �ϳɻ�õ�װ��
	float			fusion_success_prob;		// �ϳɵĳɹ���
	struct
	{
		int			id;							// ���Ϻϳ����ĵ���Ʒ
		int			count;						// ���Ϻϳ����ĵ���Ʒ����
	}
	fusion_item_cost[3];						// ���Ϻϳ����ĵ���Ʒ1-3
	int				fusion_cost_money;			// ���Ϻϳ����ĵĽ�Ǯ
	int				fusion_cost_cube_energy;	// ���Ϻϳ����ĵ�cube����

	ITEM_DECOMPOSE	decompose;					// ��ֻ����Ʒ

	unsigned int	id_enhanse_show_conf;		// ǿ����Ч���ñ�

	int				convert_to_equip_id;		// ��Ӧ�һ�װ��id
	
	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};


/////////////////////////////////////////////////////////////////////////////////////////////////
// ������������
/////////////////////////////////////////////////////////////////////////////////////////////////
struct TALISMAN_MAINPART_ESSENCE
{
	unsigned int	id;							// ��������ID
	namechar		name[32];					// ������������

	int				file_model[4];				// ��������ģ��·��1 - 4
	int				file_matter;				// ���ڵ��ϵ�ģ��·��
	int				file_icon;					// ͼ��·��

	// ��������ֻ��װ���ڷ�������λ���ϣ�����ָ��

	namechar		show_level[16];				// ��������Ʒ������
	int				level;						// ���������ȼ�

	int				init_level;					// ��ʼ�ȼ�

	unsigned int	character_combo_id;			// ְҵ����
	unsigned int	require_gender;				// �Ա����ƣ�0-�У�1-Ů��2-��Ů����
	int				require_level;				// �ȼ�����
	unsigned int	sect_mask;					// ����Ҫ��
	int				require_level2;				// ����ȼ�����

	int				max_level;					// ���ɳ��ȼ�
	int				max_level2;					// ���ɳ��ȼ�2

	float			energy_recover_speed;		// �������������ٶ�
	float			energy_recover_factor;		// ��ս��״̬�������������ٶ�˥��ϵ��
	float			energy_drop_speed;			// ���������½��ٶ�

	int				fee_levelup;				// ����������
	int				fee_expfood;				// Ѫ��������
	int				fee_reset;					// ����������
	
	// ��Ǯ
	int				price;						// �����
	int				shop_price;					// ������

	// �ѵ���Ϣ
	int				pile_num_max;				// �ѵ�����

	// ����ʽ
	unsigned int	proc_type;
};

/////////////////////////////////////////////////////////////////////////////////////////////////
// ����Ѫ������
/////////////////////////////////////////////////////////////////////////////////////////////////
struct TALISMAN_EXPFOOD_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				file_matter;				// ���ڵ��ϵ�ģ��·��
	int				file_icon;					// ͼ��·��

	int				exp_added;					// ���ӵľ���ֵ

	unsigned int    sell_for_bind_money;			// �Ƿ���Ϊ�󶨱�
	int				price;						// �����
	int				shop_price;					// ������
	
	unsigned int	music_pick;					// ��Ʒʰȡ��Ч
	unsigned int	music_drop;					// ��Ʒ������Ч

	// �ѵ���Ϣ
	int				pile_num_max;				// �ѵ�����

	// ����ʽ
	unsigned int	proc_type;
};

// ����������������
struct TALISMAN_ENERGYFOOD_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				file_matter;				// ���ڵ��ϵ�ģ��·��
	int				file_icon;					// ͼ��·����

	int				energy_total;				// �ܵľ���ֵ
	int				energy_used_minimum;		// ����ʹ����Сֵ
	
	unsigned int    sell_for_bind_money;			// �Ƿ���Ϊ�󶨱�
	int				price;						// �����
	int				shop_price;					// ������

	unsigned int	music_pick;					// ��Ʒʰȡ��Ч
	unsigned int	music_drop;					// ��Ʒ������Ч

	// �ѵ���Ϣ
	int				pile_num_max;				// ��ҩƷ�Ķѵ�����

	// ����ʽ
	unsigned int	proc_type;
};

/////////////////////////////////////////////////////////////////////////////////////////////////
// ����������
/////////////////////////////////////////////////////////////////////////////////////////////////
struct TALISMAN_MERGEKATALYST_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				file_matter;				// ���ڵ��ϵ�ģ��·��
	int				file_icon;					// ͼ��·��

	unsigned int    sell_for_bind_money;			// �Ƿ���Ϊ�󶨱�
	int				price;						// �����
	int				shop_price;					// ������

	unsigned int	music_pick;					// ��Ʒʰȡ��Ч
	unsigned int	music_drop;					// ��Ʒ������Ч

	// �ѵ���Ϣ
	int				pile_num_max;				// �ѵ�����

	// ����ʽ
	unsigned int	proc_type;
};

// ��װ
struct SUITE_ESSENCE
{
	// ������Ϣ
	unsigned int	id;							// ��װ(����)ID
	namechar		name[32];					// ��װ����

	int				max_equips;					// ��װ����

	struct 
	{
		unsigned int	id;						// ��װ���1~6
	} equipments[6];

	struct 
	{
		unsigned int	id[5];					// 2����6���ܼ���ĸ�������
	} addons[16];								// ǿ���ȼ�0-15ʱ�ļ������԰�

	char			file_gfx[128];				// ���׺��Ч��
	int				hh_type;					// �ҵ�
};

///////////////////////////////////////////////////////////////////////////////////////
// �������ʵ�������
///////////////////////////////////////////////////////////////////////////////////////
struct REFINE_TICKET_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				file_matter;				// ���ڵ��ϵ�ģ��·��
	int				file_icon;					// ͼ��·����

	int				type;						// ��������
	float			ext_succeed_prob;			// ������߳ɹ��ʹ̶�ֵ
	int				success_level;				// �سɶ�Ӧ�ȼ�
	int             min_level;					// ���׶�Ӧ�ȼ�

	unsigned int    sell_for_bind_money;			// �Ƿ���Ϊ�󶨱�
	int				price;						// �����
	int				shop_price;					// ������

	unsigned int	music_pick;					// ��Ʒʰȡ��Ч
	unsigned int	music_drop;					// ��Ʒ������Ч

	// �ѵ���Ϣ
	int				pile_num_max;				// �ѵ�����

	// ����ʽ
	unsigned int	proc_type;
};

///////////////////////////////////////////////////////////////////////////////////////
// ��Ʊ����
///////////////////////////////////////////////////////////////////////////////////////
struct LOTTERY_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				ui_type;					// ��������
	int				is_auto_open;				// �Ƿ��Զ�����	
	int				is_enable_counter;			// �Ƿ��¼ʹ�ô���	

	struct
	{
		namechar		desc[16];				// ��������, ���16������
		int				icon;					// ͼ��·����

	} candidates[32];							// ��ѡͼ��
	
	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

///////////////////////////////////////////////////////////////////////////////////////
// ¼�����
///////////////////////////////////////////////////////////////////////////////////////
struct CAMRECORDER_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				file_matter;				// ���ڵ��ϵ�ģ��·��
	int				file_icon;					// ͼ��·����

	unsigned int    sell_for_bind_money;			// �Ƿ���Ϊ�󶨱�
	int				price;						// �����
	int				shop_price;					// ������

	unsigned int	music_pick;					// ��Ʒʰȡ��Ч
	unsigned int	music_drop;					// ��Ʒ������Ч

	// �ѵ���Ϣ
	int				pile_num_max;				// �ѵ�����

	// ����ʽ
	unsigned int	proc_type;
};


///////////////////////////////////////////////////////////////////////////////////////
//
// ҩƷģ�����ݽṹ����
//
//
///////////////////////////////////////////////////////////////////////////////////////
// ҩƷ��������
struct MEDICINE_ESSENCE
{
	unsigned int	id;							// ҩƷ(����)ID
	namechar		name[32];					// ҩƷ����

	int				require_level;				// ��ҵļ���Ҫ��
	unsigned int	cool_type_mask;				// ��ȴ����
	int				cool_time_world;			// ��ȴʱ��_�����磨���룩
	int				cool_time_instance;			// ��ȴʱ��_�籾�����룩

	int	            use_type_mask;				// �Ƿ��սר�ã�0ͨ�ã�1������ר�ã�2�籾ר�ã�

	int				type;						// ҩ��������֣�0-˲��HP��1-˲��MP��2-˲��HP��MP��
												// 3-������HP��4-������MP��5-������HP��MP
	int				hp_max;						// HP_Max
	int				mp_max;						// MP_Max
	float			hp_max_percent;				// HP_MAX�ٷֱ�
	int				hp[4];						// HP��˲�صı�ʾ���ޣ���˲�صı�ʾ�����Ĵεķֱ𲹸���
	int				mp[4];						// MP��˲�صı�ʾ���ޣ���˲�صı�ʾ�����Ĵεķֱ𲹸���

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

///////////////////////////////////////////////////////////////////////////////////////
//
// ����ԭ��ģ�����ݽṹ����
//
//
///////////////////////////////////////////////////////////////////////////////////////

// ����ԭ�ϱ�������
struct MATERIAL_ESSENCE
{
	unsigned int	id;							// ����ԭ��(����)ID
	namechar		name[32];					// ����ԭ������

	// �����Ϣ
	int				decompose_price;			// ��ּ۸�
	int				decompose_time;				// ���ʱ��
	unsigned int	element_id;					// ��ֳɵ�Ԫʯ������ID
	int				element_num;				// ��ֲ�����Ԫʯ��

	// ��Ʒ���ͨ������
	ITEM_DECOMPOSE decompose;
	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};
		   
// �����鱾������
struct SKILLTOME_ESSENCE
{
	unsigned int	id;							// (����)ID
	namechar		name[32];					// ����

	unsigned int	prof_mask;					// ְҵmask
	int				skill_id;					// ����ID
	int				cosmos_level_req;			// ѧϰ��Ҫ���С����ȼ�

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// ������Ʒ��������
struct SKILLMATTER_ESSENCE
{
	unsigned int	id;							// (����)ID
	namechar		name[32];					// ����

	int				level_required;				// �ȼ�����

	int				id_skill;					// ����ID
	int				level_skill;				// ���ܵȼ�

	struct 
	{
		int			mapid;						// ���ڵ�ͼid
		int			center_pos[3];				// ���ĵ�����x,y,z
		int			radius[3];					// ����x,y,z��İ�߳�
	} use_in_area;								// ��Ҫ��ĳ��������ʹ��

	unsigned int    sitdown;					// �Ƿ�������״̬
	unsigned int	only_in_war;				// �Ƿ��սר��

	unsigned int	cool_type_mask;				// ��ȴʱ������
	int				cool_time;

	unsigned int	permenent;					// ʹ�ú���ʧ��false-��ʧ��true-����ʧ
	unsigned int	cast_skill;					// �Ƿ�αװ�ɵ��ߵ��ü���
	int				id_target[5];				// ���Ŀ��id1-5

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// ����
struct VEHICLE_ESSENCE
{
	unsigned int	id;							// (����)ID
	namechar		name[32];					// ����

	int				file_model;					// ģ���ļ�
	unsigned int	is_flying_vehicle;			// �Ƿ��������

	int				level_required;				// �ȼ�����

	float			speed;						// �����ƶ��ٶ�
	float			swim_speed;					// ˮ���ٶ�
	float			fly_speed;					// �����ٶ�

	char			action[32];					// ʹ��ʱ���Ž�ɫ������
	namechar		progress_desc[16];			// ��������ʾ����
	int				cast_time;					// ����ʱ��(����)
	int				vocation_action_type;		// ����ʱ��������
	namechar		riding_action[16];			// ���ʱ��ɫ���ŵĶ�����
	namechar		flying_action[16];			// ��˷���ʱ��ɫ���ŵĶ�����

	unsigned int	ride_addon_storage[3];		// ��˸������Կ�ID
	unsigned int	equip_addon_storage[3];		// װ���������Կ�ID
	unsigned int	fly_addon_storage[5];		// ���и������Կ�ID

	unsigned int	ride_replace_skill_bar;			// ���ʱ�滻������
	unsigned int	ride_show_addtional_skill_bar;	// ���ʱ��ʾ���⼼����
	unsigned int	fly_replace_skill_bar;			// ����ʱ�滻������
	unsigned int	fly_show_addtional_skill_bar;	// ����ʱ��ʾ���⼼����

	struct  
	{
		int			id;							// ���Ӽ���ID
		int			level;						// ���Ӽ��ܵȼ�
	}
	ride_addon_skill[2],						// ��˸��Ӽ���
	equip_addon_skill[2],						// װ�����Ӽ���
	fly_addon_skill[4];							// ���и�������

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// ������
struct AIRCRAFT_ESSENCE
{
	unsigned int	id;							// (����)ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				file_model;					// ģ���ļ�

	int				file_matter;				// ���ڵ��ϵ�ģ��·����
	int				file_icon;					// ͼ��·����

	unsigned int    sell_for_bind_money;			// �Ƿ���Ϊ�󶨱�
	int				price;						// �����
	int				shop_price;					// ������

	namechar		descript[16];				// ������Ʒ��
	int				level_required;				// �ȼ�����
	unsigned int	character_combo_id;
	unsigned int	only_in_war;				// �Ƿ������ͼר��
	int				fly_mode;					// ����ģʽ

	float			speed;						// �ƶ��ٶ�
	int				mp_used;					// �����������ħ��
	float			sprint_speed;				// ��̷����ٶ�
	int				vp_used;					// ��̷�������Ԫ��

	unsigned int	music_pick;					// ��Ʒʰȡ��Ч
	unsigned int	music_drop;					// ��Ʒ������Ч

	// �ѵ���Ϣ
	int				pile_num_max;				// �ѵ�����

	// ����ʽ
	unsigned int	proc_type;
};

///////////////////////////////////////////////////////////////////////////////////////
// ��������
///////////////////////////////////////////////////////////////////////////////////////
struct LUCKYROLL_ESSENCE
{
	unsigned int	id;							// (����)ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				file_matter;				// ���ڵ��ϵ�ģ��·��
	int				file_icon;					// ͼ��·��

	int				type;						// ���ͣ�0-��Ʒ��1-�����

	unsigned int    sell_for_bind_money;			// �Ƿ���Ϊ�󶨱�
	int				price;						// �����
	int				shop_price;					// ������

	unsigned int	music_pick;					// ��Ʒʰȡ��Ч
	unsigned int	music_drop;					// ��Ʒ������Ч

	// �ѵ���Ϣ
	int				pile_num_max;				// �ѵ�����

	// ����ʽ
	unsigned int	proc_type;
};

///////////////////////////////////////////////////////////////////////////////////////
// ˫���������
///////////////////////////////////////////////////////////////////////////////////////
struct DOUBLE_EXP_ESSENCE
{
	unsigned int	id;							// (����)ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				file_matter;				// ���ڵ��ϵ�ģ��·��
	int				file_icon;					// ͼ��·��

	unsigned int	type_mask;					// Ч�����࣬ ��ѡ����顢��Ǯ�������顢�����Ǯ����������������飩
	float			coefficient;				// �����ı���
	int				double_exp_time;			// ˫������ʱ��(��)

	unsigned int    sell_for_bind_money;			// �Ƿ���Ϊ�󶨱�
	int				price;						// �����
	int				shop_price;					// ������

	unsigned int	music_pick;					// ��Ʒʰȡ��Ч
	unsigned int	music_drop;					// ��Ʒ������Ч

	// �ѵ���Ϣ
	int				pile_num_max;				// �ѵ�����

	// ����ʽ
	unsigned int	proc_type;
};

// �سǾ���
struct TOWNSCROLL_ESSENCE
{
	unsigned int	id;							// (����)ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				file_matter;				// ���ڵ��ϵ�ģ��·��
	int				file_icon;					// ͼ��·��

	float			use_time;					// ʹ��ʱ�䣨�룩

	unsigned int    sell_for_bind_money;			// �Ƿ���Ϊ�󶨱�
	int				price;						// �����
	int				shop_price;					// ������

	int				blank;						// �Ƿ�Ϊ�հ�

	unsigned int	music_pick;					// ��Ʒʰȡ��Ч
	unsigned int	music_drop;					// ��Ʒ������Ч

	// �ѵ���Ϣ
	int				pile_num_max;				// �ѵ�����

	// ����ʽ
	unsigned int	proc_type;
};

// �������
struct REVIVESCROLL_ESSENCE
{
	unsigned int	id;							// (����)ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				file_matter;				// ���ڵ��ϵ�ģ��·��
	int				file_icon;					// ͼ��·��

	float			use_time;					// ʹ��ʱ�䣨�룩
	int				cool_time;					// ��ȴʱ�䣨���룩

	unsigned int    sell_for_bind_money;			// �Ƿ���Ϊ�󶨱�
	int				price;						// �����
	int				shop_price;					// ������

	unsigned int	music_pick;					// ��Ʒʰȡ��Ч
	unsigned int	music_drop;					// ��Ʒ������Ч

	// �ѵ���Ϣ
	int				pile_num_max;				// �ѵ�����

	// ����ʽ
	unsigned int	proc_type;
};

// ������Ʒ
struct TASKMATTER_ESSENCE
{
	unsigned int	id;							// (����)ID
	namechar		name[32];					// ����

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

//	�����������ͨ��Ʒ(����)
struct TASKNORMALMATTER_ESSENCE
{
	unsigned int	id;							// (����)ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				file_icon;					// ͼ��·��
	
	int				props_use_type;				// ��Ʒ��;

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// �������������
struct TASKDICE_ESSENCE
{
	unsigned int	id;							// (����)ID
	namechar		name[32];					// ����

	int				id_instance;				// ��������ڵ�ͼid
	int				center_x;					// ������������ĵ�����x
	int				center_y;					// ������������ĵ�����y
	int				center_z;					// ������������ĵ�����z
	int				half_len_x;					// ���������x��߳���
	int				half_len_y;					// ���������y��߳���
	int				half_len_z;					// ���������z��߳���
	int				file_hint_model;			// ��ʾ��ģ��
	int				common_cool_type;			// ʹ�ú󹫹���ȴ����
	int				common_cool_time;			// ʹ�ú󹫹���ȴʱ��
	int				consume_after_use;			// �Ƿ�ʹ�ú���ʧ
	int				vocation_action_type;		// ʹ��ʱ��������
	char			action[32];					// ʹ��ʱ���Ž�ɫ������
	char			riding_action[32];			// ���ʹ��ʱ���Ŷ�����

	namechar		progress_desc[16];			// ��������ʾ����, ���16������
	int				time_intonate;				// ����ʱ��
	unsigned int	is_notify_when_available;	// �Ƿ��п�ʹ����ʾ
	unsigned int	is_exclusive_for_league;	// �Ƿ���ű��
	unsigned int	help_info;					// ��ʾ����;����ͨ�������Ҳ���ָ����ͼʱ���ô��ı���Ϣ
	unsigned int	help_info2;					// ��ʾ����;����ͨ����������ָ����ͼ����ָ������ʱ���ô��ı���Ϣ
	int				voice_help;					// �Ƿ�����Ч��ʾ"��0����1����
	unsigned int	voice_file;					// ��Ч�ļ�
	unsigned int	is_show_award_hint;			// �Ƿ���������ʾ����ʾ��������Ϣ
	unsigned int	is_show_task_count_hint;	// �Ƿ���������ʾ����ʾ���������Ϣ

	struct
	{
		unsigned int	id;						// ����id
		float			probability;			// ����������ĸ���
		
	} task_lists[32];

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// �̻�����
////////////////////////////////////////////////////////////////////////////////////////
struct FIREWORKS_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				file_fw;					// ����Ч��·��

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// �����̻�����
////////////////////////////////////////////////////////////////////////////////////////
struct TEXT_FIREWORKS_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				file_matter;				// ���ڵ��ϵ�ģ��·��
	int				file_icon;					// ͼ��·��

	int				file_fw;					// ���Ч���ļ�
	int				level;						// �ȼ�

	namechar		char_can_use[256];			// ����ʹ�õ��ַ�����Щ
	int				max_char;					// �������������ַ���

	unsigned int    sell_for_bind_money;			// �Ƿ���Ϊ�󶨱�
	int				price;						// �����
	int				shop_price;					// ������

	unsigned int	music_pick;					// ��Ʒʰȡ��Ч
	unsigned int	music_drop;					// ��Ʒ������Ч

	// �ѵ���Ϣ
	int				pile_num_max;				// ���̻��Ķѵ�����

	// ����ʽ
	unsigned int	proc_type;
};

////////////////////////////////////////////////////////////////////////////////////////
// ǿ��ʯ����
////////////////////////////////////////////////////////////////////////////////////////
struct ESTONE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				estone_type;				//ǿ��ʯ����

	int				file_matter;				// ���ڵ��ϵ�ģ��·��
	int				file_icon;					// ͼ��·��

	struct  
	{
		unsigned int	equip_mask;				// ����Ƕ��װ�����
		unsigned int	effect_addon_type;		// Ч��������������

	} effects[4];

	unsigned int    sell_for_bind_money;		// �Ƿ���Ϊ�󶨱�
	int				price;						// �����
	int				shop_price;					// ������

	float			rank;						// ��ʯƷ��

	unsigned int	music_pick;					// ��Ʒʰȡ��Ч
	unsigned int	music_drop;					// ��Ʒ������Ч

	// �ѵ���Ϣ
	int				pile_num_max;				// �ѵ�����

	// ����ʽ
	unsigned int	proc_type;
};


////////////////////////////////////////////////////////////////////////////////////////
// ǿ����ص���
////////////////////////////////////////////////////////////////////////////////////////
struct ENHANCE_ITEM_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����
	
	unsigned int	equip_mask;					// װ����λ
	int				equip_lv_min;				// ����װ���ȼ�����
	int				equip_lv_max;				// ����װ���ȼ�����
	int				enhanse_lv_min;				// ����ǿ���ȼ�����
	int				enhanse_lv_max;				// ����ǿ���ȼ�����
	struct
	{
		float			prob;					// �ɹ���
		int				gold;					// ���Ľ��
		unsigned int	fail_lv_drop;			// ʧ�ܺ�ǿ���ȼ�����
	} upgrade[15];								// ǿ����1~15����Ҫ��

	// ��Ʒ���ͨ������
	ITEM_DECOMPOSE decompose;
	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// ǿ������Ч�����ñ�
////////////////////////////////////////////////////////////////////////////////////////
struct ENHANCE_SHOW_CONFIG
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				glow_gfx[15];				// ǿ���ȼ�Ϊ1~15��ʱ��ʾ��Gfx
};

////////////////////////////////////////////////////////////////////////////////////////
// ����ʯ����
////////////////////////////////////////////////////////////////////////////////////////
struct PSTONE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				pstone_type;				//����ʯ����� 0:����  1:��ʯ
	
	int				file_matter;				// ���ڵ��ϵ�ģ��·��
	int				file_icon;					// ͼ��·��

	unsigned int	equip_mask;					// ����Ƕ��װ�����
	unsigned int	type_mask;					// ���ĵ�����
	unsigned int	rune_prop;					// ������������
	float			rune_prop_prob;				// ����������Ƕ�󴥷�����
	unsigned int	id_addon_package;			// ���ĸ������԰���ID
	unsigned int	equip_lv_max;				// ��Ӧװ���ȼ�����
	unsigned int	equip_lv_min;				// ��Ӧװ���ȼ�����

	unsigned int	id_uninstall;				// ��ʯȡ��������ƷID
	unsigned int    gem_type;					// ��ʯ������
	int				fee_install;				// ����ʯ��Ƕ����
	int				fee_uninstall;				// ����ʯ��ж����

	unsigned int    sell_for_bind_money;			// �Ƿ���Ϊ�󶨱�
	int				price;						// �����
	int				shop_price;					// ������

	unsigned int	music_pick;					// ��Ʒʰȡ��Ч
	unsigned int	music_drop;					// ��Ʒ������Ч

	// �ѵ���Ϣ
	int				pile_num_max;				// �ѵ�����

	// ����ʽ
	unsigned int	proc_type;
};

////////////////////////////////////////////////////////////////////////////////////////
// ����ʯ����
////////////////////////////////////////////////////////////////////////////////////////
struct SSTONE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				file_matter;				// ���ڵ��ϵ�ģ��·��
	int				file_icon;					// ͼ��·��

	unsigned int	equip_mask;					// ����Ƕ��װ�����
	unsigned int	skill_id;					// ����id
	int				skill_level;				// ���ܵȼ�

	unsigned int    sell_for_bind_money;			// �Ƿ���Ϊ�󶨱�
	int				price;						// �����
	int				shop_price;					// ������

	unsigned int	music_pick;					// ��Ʒʰȡ��Ч
	unsigned int	music_drop;					// ��Ʒ������Ч

	// �ѵ���Ϣ
	int				pile_num_max;				// �ѵ�����

	// ����ʽ
	unsigned int	proc_type;
};

////////////////////////////////////////////////////////////////////////////////////////
// װ���ӹ���Ʒ
////////////////////////////////////////////////////////////////////////////////////////
struct EQUIPMENT_PROCESSING_ITEM_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����
	
	unsigned int	equipment_level_req;		// ���װ���ȼ�Ҫ��
	unsigned int	equip_mask;					// �ɼӹ���λ
	unsigned int	id_prop_storage;			// �������Կ�ID
	unsigned int	prop_storage_time_limit;	// �������Կ�ʱЧ
	
	// ��Ʒ���ͨ������
	ITEM_DECOMPOSE decompose;
	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// Ǳ���鱾��
////////////////////////////////////////////////////////////////////////////////////////
struct POTENTIAL_TOME_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				file_matter;				// ���ڵ��ϵ�ģ��·��
	int				file_icon;					// ͼ��·��

	unsigned int	sect_mask;					// ����Ҫ��
	int				require_level;				// �ȼ�����
	int				potential_id;				// Ǳ��id

	unsigned int    sell_for_bind_money;			// �Ƿ���Ϊ�󶨱�
	int				price;						// �����
	int				shop_price;					// ������

	unsigned int	music_pick;					// ��Ʒʰȡ��Ч
	unsigned int	music_drop;					// ��Ʒ������Ч

	// �ѵ���Ϣ
	int				pile_num_max;				// �ѵ�����

	// ����ʽ
	unsigned int	proc_type;
};

////////////////////////////////////////////////////////////////////////////////////////
// ����ͬ�Ľ�
////////////////////////////////////////////////////////////////////////////////////////
struct COUPLE_JUMPTO_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				file_matter;				// ���ڵ��ϵ�ģ��·��
	int				file_icon;					// ͼ��·��

	unsigned int    sell_for_bind_money;			// �Ƿ���Ϊ�󶨱�
	int				price;						// �����
	int				shop_price;					// ������

	unsigned int	music_pick;					// ��Ʒʰȡ��Ч
	unsigned int	music_drop;					// ��Ʒ������Ч

	// �ѵ���Ϣ
	int				pile_num_max;				// �ѵ�����

	// ����ʽ
	unsigned int	proc_type;
};

// ����
struct SPEAKER_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				id_icon_set;				// ��������׺�

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// �������
struct CHANGE_SHAPE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	namechar		collection[16];
	int				file_model;
	namechar		descript_text[256];
	int				valid_time;
	int				level_required;
	int				stand_mode;
	int				monster_race;
	int				used_vp;
	int				used_time;					// ���ӵ�ͼ�����ʹ�õĴ���
	float			height_var;					// ���κ�߶�����ֵ
	float			speed;
	int				can_attack;					// �Ƿ���Թ���
	int				id_camera;					// ��Ӧ���������id
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
	} addon_skills[3];							// ���Ӽ���

	int				addons[6];					// ��������

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

///////////////////////////////////////////////////////////////////////////////////////
// �䷽����
///////////////////////////////////////////////////////////////////////////////////////
struct RECIPEROLL_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	unsigned int	id_recipe;					// ��Ӧ���䷽ID

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// �����ٻ�ģ��
struct SUMMON_MONSTER_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���
	
	int				file_matter;				// ���ڵ��ϵ�ģ��·��
	int				file_icon;					// ͼ��·��

	int				required_level;

	struct 
	{
		unsigned int	id;
		int				lifespan;
		int				num;
	} monsters[2];

	unsigned int    sell_for_bind_money;			// �Ƿ���Ϊ�󶨱�
	int				price;						// �����
	int				shop_price;					// ������

	unsigned int	music_pick;					// ��Ʒʰȡ��Ч
	unsigned int	music_drop;					// ��Ʒ������Ч

	// �ѵ���Ϣ
	int				pile_num_max;				// �ѵ�����

	// ����ʽ
	unsigned int	proc_type;
};

////////////////////////////////////////////////////////////////////////////////////////
// ����� �һ�����
////////////////////////////////////////////////////////////////////////////////////////
struct AI_HELPER_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				file_matter;				// ���ڵ��ϵ�ģ��·��
	int				file_icon;					// ͼ��·��

	int				duration;					// ʹ����Ч�ڣ��룩
	int				autohook_type;				// �һ���Ʒ����
	int				addon_skill;				// ���ӵļ���ID

	unsigned int    sell_for_bind_money;			// �Ƿ���Ϊ�󶨱�
	int				price;						// �����
	int				shop_price;					// ������

	unsigned int	music_pick;					// ��Ʒʰȡ��Ч
	unsigned int	music_drop;					// ��Ʒ������Ч

	// �ѵ���Ϣ
	int				pile_num_max;				// �ѵ�����

	// ����ʽ
	unsigned int	proc_type;
};

//////////////////////////////////////////////////////////////////////////////////////
// �鼮
//////////////////////////////////////////////////////////////////////////////////////
struct BOOK_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	unsigned int	is_exhibit;					// �Ƿ�Ϊ��֤̽��
	struct
	{
		unsigned int	is_pic;					// ��ҳ�Ƿ�ͼƬ
		int				content;				// ��������
		int				pic_path;				// ����ͼƬ·��
		int				pic_desc;				// ͼƬ����
	}
	pages[20];									// 1-20ҳ����

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

//////////////////////////////////////////////////////////////////////////////////////
// �ػ���
////////////////////////////////////////////////////////////////////////////////////////
struct GUARDIAN_SOUL_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				file_icon;					// ͼ��·��

	struct
	{
		int		star;								// ����Ҫ��
		int		file_head_icon;						// ͷ��
		int		file_model;							// ģ��
	}grade_star[4];								// �ޡ������С��߼�Ʒ

	int				level;						// �ػ����ʼ�ȼ�
	int				summon_level_req;			// �ػ���Я���ȼ�(��սҪ�����Ｖ��)

	unsigned int	constellation;				// ����
	int				class_grade;				// �ػ���׼�

	float			growth_str_factor;			// ���ɳ��ʶ�Ӧ��ϵ��
	float			growth_dur_factor;			// �ͳɳ��ʶ�Ӧ��ϵ��
	float			growth_sta_factor;			// ��ɳ��ʶ�Ӧ��ϵ��

	struct 
	{
		float		limit;						// ����
		float		prob;						// �䵽�������
	}
	str_growth_table[10],						// ���ɳ�������
	dur_growth_table[10],						// �ͳɳ�������
	sta_growth_table[10];						// ��ɳ�������

	struct 
	{
		float		limit;						// ����
		float		prob;						// �䵽�������
	}
	str_aptitude_table[10],						// ����������
	dur_aptitude_table[10],						// ����������
	sta_aptitude_table[10];						// ����������

	struct  
	{
		float		add_value[10];				// 1~10������ֵ
		int			need_point[10];				// 1~10����Ҫ���۶�
	}
	str_aptitude_level_table,					// ������n���Լ�������۶�
	dur_aptitude_level_table,					// ������n���Լ�������۶�
	sta_aptitude_level_table;					// ������n���Լ�������۶�

	int				enhance_exp[15];			// ����1~15����Ҫ��������
	struct
	{
		int			level;						// ����1~15����Ҫ�ػ���ȼ�
		int			player_cosmos_level;		// ����1~15����Ҫ����С����ȼ�
	}
	enhance_req[15];							// ����1~15��������

	int				strength;					// ��ʼ��
	int				durability;					// ��ʼ��
	int				stamina;					// ��ʼ��
	int				init_enhance_limit;			// ��ʼ�����ȼ�����

	float			sight_range;				// ��Ұ
	float			str_range;					// ������

	float			aggro_range;				// ��޾���
	float			aggro_time;					// ���ʱ��

	unsigned int	stand_mode;					// վ����ʽ�����ܵ��У�����վ����˫��վ�������շ��е�

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// �ػ��鼼�ܾ���
////////////////////////////////////////////////////////////////////////////////////////
struct GUARDIAN_SOUL_SKILL_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				file_icon;					// ͼ��·��

	int				id_skill;					// ����id
	int				skill_level;				// ���ܵȼ�
	int				use_prob[3];				// ���ܸ��ȼ�ʹ�ø��ʣ�[0]Ϊ�ȼ�1ʹ�ø���

	int				learn_req_level;			// ѧϰҪ���ػ��鼶��
	int				learn_req_summon_level;		// ѧϰҪ���ػ���Я���ȼ�
	int				learn_bind_money;			// ѧϰ���Ѱ󶨱�
	int				learn_gold;					// ѧϰ���ѽ��
	float			learn_prob;					// ѧϰ�ɹ���

	// ��Ʒ���ͨ������
	ITEM_DECOMPOSE decompose;
	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// �ػ��鼼������ʯ
////////////////////////////////////////////////////////////////////////////////////////
struct GUARDIAN_SOUL_SKILL_UP_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				file_icon;					// ͼ��·��

	int				skill_id;					// ����ID
	int				skill_level_require;		// ��Ҫ���ܵȼ�
	int				req_level;					// �ػ���ȼ�Ҫ��
	int				req_summon_level;			// �ػ���Я���ȼ�Ҫ��
	float			success_prob;				// �����ɹ���
	int				cost_bind_money;			// ������Ҫ�󶨱�
	int				cost_gold;					// ������Ҫ���

	// ��Ʒ���ͨ������
	ITEM_DECOMPOSE decompose;
	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// �ػ�������ǿ��ʯ
////////////////////////////////////////////////////////////////////////////////////////
struct GUARDIAN_SOUL_APTITUDE_STONE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				file_icon;					// ͼ��·��

	int				type;						// ���0=�����ʣ�1=�����ʣ�2=������
	int				point_add;					// �ۻ�������ֵ
	int				summon_level_limit;			// �������Я���ȼ�
	int				cost_bind_money;			// ������Ҫ�󶨱�
	int				cost_gold;					// ������Ҫ���

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};




//////////////////////////////////////////////////////////////////////////////////////
// ������  To Be Delete
////////////////////////////////////////////////////////////////////////////////////////
struct PET_BEDGE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				drop_model;					// �򻯵���ģ��
	int				file_icon;					// ͼ��·��
	float			size;						// �����С

	struct
	{
		int		star;								// ����Ҫ��
		int		file_head_icon;						// ͷ��
		int		file_model;							// ģ��
	}grade_star[4];								// �ޡ������С��߼�Ʒ

	int				level;						// �����ʼ�ȼ�
	int				summon_level_req;			// ����Я���ȼ�(��սҪ�����Ｖ��)

	unsigned int	monster_race;				// ����
	int				pet_category;				// �������� 0=���� 1=Զ��
	int				pet_class_grade;			// ����׼�
	int				normal_atk_skill;			// ��ͨ��������id
	int				special_skill;				// ���⼼��id
	int				target_dist_threshold;		// ���⼼���ٽ����

	float			growth_max_dmg_factor;		// �����ɳ��ʶ�Ӧ��������ϵ��
	float			growth_min_dmg_factor;		// �����ɳ��ʶ�Ӧ��������ϵ��
	float			growth_def_factor;			// �����ɳ��ʶ�Ӧ����ϵ��
	float			growth_hp_factor;			// �����ɳ��ʶ�Ӧ����ϵ��

	struct 
	{
		float		limit;							// ����
		float		prob;							// �䵽�������
	}
	atk_growth_table[10],							// �����ɳ�������
	def_growth_table[10],							// �����ɳ�������
	hp_growth_table[10];							// �����ɳ�������

	struct  
	{
		float		add_value[10];					// 1~10�׳ɳ�������ֵ
		int			need_point[10];					// 1~10�׳ɳ�����Ҫ�ɳ���
	}
	atk_growth_level_table,							// �����ɳ���n������ֵ�Լ�����ɳ���
	def_growth_level_table,							// �����ɳ���n������ֵ�Լ�����ɳ���
	hp_growth_level_table;							// �����ɳ���n������ֵ�Լ�����ɳ���

	struct 
	{
		float		limit;							// ����					
		float		prob;							// �䵽�������
	}
	atk_itg_table[10],							// ������������
	def_itg_table[10],							// ������������
	hp_itg_table[10];							// ������������

	int				hp;							// ��ʼ������
	int				min_dmg;					// ��ʼ��С������
	int				max_dmg;					// ��ʼ��󹥻���
	int				defense;					// ��ʼ������
	float			lucky_att_rate;				// ��ʼ����һ����(%)
	float			direct_att_rate;			// ��ʼֱ����(%)

	float			damage_rate;				// ��ʼ�˺�����
	float			phy_anti_rate;				// ��ʼ�����˺�����
	float			magic_anti_rate;			// ��ʼ�����˺�����
	float			crit_rate;					// ��ʼ������(%)
	float			anti_crit_rate;				// ��ʼ���Ⱪ����(%)
	int				extra_crit_damage;			// ��ʼ���������˺�
	int				extra_crit_defance;			// ��ʼ���������˺�����

	int				extra_heal;					// ��ʼ������Ч���̶�ֵ

	int				hp_gen[2];					// ��ս��״̬��HP�ָ��ٶ�
												// ս��״̬��HP�ָ��ٶ�


	float			sight_range;				// ��Ұ
	float			attack_range;				// ��������
	
	float			aggro_range;				// ��޾���
	float			aggro_time;					// ���ʱ��
	
	unsigned int	stand_mode;					// վ����ʽ�����ܵ��У�����վ����˫��վ�������շ��е�
	
	float			atk_itg_max;				// ������������
	float			def_itg_max;				// ������������
	float			hp_itg_max;					// ������������

	struct
	{
		int			level_req;						// �ȼ�Ҫ��
		int			item_need;						// ��Ҫ����ID
		int			item_num;						// ��Ҫ��������
		int			bind_money_need;				// ��Ҫ�󶨱�
		int			gold_need;						// ��Ҫ���
		float		prob;							// �ɹ���
	}evolution[5];									// ����


	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// ����ʳƷ
////////////////////////////////////////////////////////////////////////////////////////
struct PET_FOOD_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				food_usage;					// ʳƷ��;	0-������ǰֵ 1-���ܶ� 2-�ɳ�ֵ
	int				food_value;					// ʳƷ���ӵ�ֵ
	int				cool_time;					// ����ʳƷ��ȴʱ��

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// ���＼�ܾ���
////////////////////////////////////////////////////////////////////////////////////////
struct PET_SKILL_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				drop_model;					// �򻯵���ģ��
	int				file_icon;					// ͼ��·��

	int				id_skill;					// ����id
	int				skill_level;				// ���ܵȼ�
	int				use_prob[3];				// ���ܸ��ȼ�ʹ�ø��ʣ�[0]Ϊ�ȼ�1ʹ�ø���

	int				learn_pet_level;			// ���Ｖ��Ҫ��
	int				learn_pet_summon_level;		// ѧϰҪ�����Я���ȼ�
	int				available_for_pet_category; // �������õĳ������ͣ���λ�洢
	int				learn_bind_money;			// ѧϰ���Ѱ󶨱�
	int				learn_gold;					// ѧϰ���ѽ��
	float			learn_prob;					// ѧϰ�ɹ���
	
	// ��Ʒ���ͨ������
	ITEM_DECOMPOSE decompose;
	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// ����װ��
////////////////////////////////////////////////////////////////////////////////////////
struct PET_ARMOR_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	unsigned int	equip_mask;					// �߼��Ͽ���װ���Ĳ�λ���ɲ�ͬ��λMask��ɣ�ʹ�õĲ�λ����Ϊ��
	int				file_model;					// ģ��·����
	int				file_model_l;				// ģ��·��������
	int				file_matter;				// ���ڵ��ϵ�ģ��·��
	int				file_icon;					// ͼ��·��

	int				normal_attack_sfx;			// ��ͨ����ʱ����Ч·��
	int				put_in_sfx;					// ��Ʒ������Ч·��
	
	int				require_level;				// �ȼ�����
	unsigned int	require_race;				// ��������
	unsigned int	require_title;				// ͷ������
	float			attack_range;				// ��������

	int				hp;							// ��������ֵ
	int				mp;							// ħ������ֵ
	int				min_dmg;					// ��С����������ֵ
	int				dmg_val;					// ��������������ֵ
	int				defence;					// ����������ֵ
	int				attack;						// ���л���ֵ
	int				armor;						// �������ֵ
	
	int				random_quality_affix;		// �Ƿ����Ʒ����ǰ��׺
	int				id_quality;					// �̶�Ʒ��
	int				id_prefix_addon_package;	// �̶�ǰ׺�������԰�
	int				id_postfix_addon_package;	// �̶���׺�������԰�

	int				id_equip_prop;				// ���������IDģ��

	unsigned int    sell_for_bind_money;			// �Ƿ���Ϊ�󶨱�
	int				price;						// �����
	int				shop_price;					// ������

	unsigned int	music_pick;					// ��Ʒʰȡ��Ч
	unsigned int	music_drop;					// ��Ʒ������Ч

	// �ѵ���Ϣ
	int				pile_num_max;				// �ѵ�����

	// ����ʽ
	unsigned int	proc_type;
};

////////////////////////////////////////////////////////////////////////////////////////
// ��������ǿ��ʯ
////////////////////////////////////////////////////////////////////////////////////////
struct PET_APTITUDE_STONE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����
	
	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���
	
	int				drop_model;					// �򻯵���ģ��
	int				file_icon;					// ͼ��·��
	
	int				pet_level_require;			// ����ȼ�Ҫ��
	int				pet_summon_level_limit;		// �������Я���ȼ�
	float			aptitude_add;				// ǿ������������ֵ
	float			success_prob;				// ǿ���ɹ���
	int				cost_bind_money;			// ǿ����Ҫ�󶨱�
	int				cost_gold;					// ǿ����Ҫ���
	
	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// ���＼������ʯ
////////////////////////////////////////////////////////////////////////////////////////
struct PET_SKILL_LEVEL_UP_STONE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����
	
	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���
	
	int				drop_model;					// �򻯵���ģ��
	int				file_icon;					// ͼ��·��
	
	int				skill_id;					// ����ID
	int				skill_level_require;		// ��Ҫ���ܵȼ�
	int				pet_level_require;			// ����ȼ�Ҫ��
	int				pet_summon_level_require;	// ����Я���ȼ�Ҫ��
	float			success_prob;				// �����ɹ���
	int				cost_bind_money;			// ������Ҫ�󶨱�
	int				cost_gold;					// ������Ҫ���
	
	// ��Ʒ���ͨ������
	ITEM_DECOMPOSE decompose;
	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// ����ɳ�������ʯ
////////////////////////////////////////////////////////////////////////////////////////
struct PET_GROWTH_STONE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����
	
	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���
	
	int				drop_model;					// �򻯵���ģ��
	int				file_icon;					// ͼ��·��
	
	int				type;						// ���0=�����ɳ��ʣ�1=�����ɳ��ʣ�2=�����ɳ���
	int				point_add;					// �ɳ�������ֵ
	int				pet_summon_level_limit;		// �������Я���ȼ�
	int				cost_bind_money;			// ������Ҫ�󶨱�
	int				cost_gold;					// ������Ҫ���
	
	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// ���ﲶ׽����
////////////////////////////////////////////////////////////////////////////////////////
struct PET_CATCHER_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����
	
	int				item_level;					// ��Ʒ�ȼ�
	int				max_catch_level;			// �ɲ�׽Ŀ������ȼ�
	int				player_level_require;		// ʹ����Ҫ����ȼ�
	float			target_hp_lower_than;		// Ŀ��Ѫ���ٷֱ�����

	float			success_prob;				// �ɹ���

	int				vocation_action_type;		// ʹ��ʱ��������
	char			action[32];					// ʹ���䷽ʱ���ŵĶ���

	// ��Ʒ���ͨ������
	ITEM_DECOMPOSE decompose;
	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// ������Ʒ
////////////////////////////////////////////////////////////////////////////////////////
struct PET_ACCESSORY_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				model_path;					// ģ��·��

	int				equip_position;				// װ����λ
	int				increase_max_action_point;	// ���ӳ�����������
	int				enable_functionality;		// �����������⹦��

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

////////////////////////////////////////////////////////////////////////////////////////
// ���̽���Ʒ
////////////////////////////////////////////////////////////////////////////////////////
struct TRADE_ITEM_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				file_matter;				// ���ڵ��ϵ�ģ��·��
	int				file_icon;					// ͼ��·��

	int				category;					// ����Ʒ����
	int             id_producing_area;			// ԭ���ر��
	int				x;							// ԭ��������x
	int				y;							// ԭ��������y
	int				moneybag_type;				// ��ӦǮ������

	int				price;						// �����۸����������
	int				shop_price;					// ���������ۣ�������룩

	int				high_price_time;			// �۸�ָ��>=100%ʱ�۸�ά��ԭʼʱ�䣨�룩
	int				low_price_time;				// �۸�ָ��<100%ʱ�۸�ά��ԭʼʱ�䣨�룩
	int				profit_limit;				// �۸�䶯ǰ����������
	float			price_change_factor;		// ÿ�μ۸�䶯����
	float			max_price_factor;			// �۸�ָ������
	float			min_price_factor;			// �۸�ָ������
	int				required_repu_id;			// ������ཻ��Ʒ��������ID
	int				required_repu_value;		// ������ཻ��Ʒ��������ֵ
	int				required_level;				// ������ཻ��ƷҪ������ȼ�

	struct
	{
		int			distance;					// ����
		float		price_factor_inc;			// �������ڼ�ֵ��ֵ
	}dist_price[8];								// ��Ʒ����1-8ʱ��ֵ��ֵ

	float			max_price_inc_factor;		// ��Ʒ���볬��8ʱ�ļ�ֵ��ֵ

	unsigned int	music_pick;					// ��Ʒʰȡ��Ч
	unsigned int	music_drop;					// ��Ʒ������Ч

	// �ѵ���Ϣ
	int				pile_num_max;				// �ѵ�����

	// ����ʽ
	unsigned int	proc_type;
};

///////////////////////////////////////////////////////////////////////////////////////
//	����Ǯ��
///////////////////////////////////////////////////////////////////////////////////////
struct MONEYBAG_ESSENCE
{
	unsigned int	id;							// (����)ID
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				file_matter;				// ���ڵ��ϵ�ģ��·��
	int				file_icon;					// ͼ��·��

	int				id_repu_exchange;			// �һ�������ID
	int				moneybag_type;				// ��ӦǮ������
	int				id_repu_inc1;				// ��������ʱ�����������ӵ�����1��ID
	int				id_repu_inc2;				// ��������ʱ�����������ӵ�����2��ID
	int				par_value_init;				// Ǯ����ֵ��ʼֵ
	int				par_value_max;				// Ǯ����ֵ����
	int				undercut_bidup_limit;		// �����ۡ�̧���ܴ���
	int				splurge_limit;				// ����һ��ǧ�����
	int				dur_time;					// Ǯ������ʱ��(��)

	unsigned int    sell_for_bind_money;			// �Ƿ���Ϊ�󶨱�
	int				price;						// �����
	int				shop_price;					// ������

	unsigned int	music_pick;					// ��Ʒʰȡ��Ч
	unsigned int	music_drop;					// ��Ʒ������Ч

	// �ѵ���Ϣ
	int				pile_num_max;				// �ѵ�����

	// ����ʽ
	unsigned int	proc_type;	
};

// �ϳ��䷽
struct MERGE_RECIPE_ESSENCE
{
	unsigned int		id;						// �ϳ��䷽����ID
	namechar			name[32];				// �ϳ��䷽��������

	int					keep_time_prop;			// �Ƿ�����һ��Ʒʱ������
	int					keep_bind_prop;			// �Ƿ�����һ��Ʒ������
	int					keep_refine_prop;		// �Ƿ�����һ��Ʒ��������
	int					keep_pstone_prop;		// �Ƿ�����һ��Ʒ׷������

	struct {
		float			probability;			// ���ɸ���
		int				id1;					// ���ɵ���Ʒid
		int				num1;					// ���ɵ�����
		int				id2;					// ���ɵ���Ʒid
		int				num2;					// ���ɵ�����
	} makes[4];

	struct
	{
		int					id_main;			// ����Ʒid
		int					num;
		int					rank;
	} mains[6];

	float				basic_prob;				// �����ɹ�����
	int					fee;					// ������

	struct {
		int				id;						// ����Ʒid
		float			probability;			// ����Ʒ���ӵĳɹ���

	} helpers[4];

	int				id_recipe;					// �ɼ�����ͻ��
};

///////////////////////////////////////////////////////////////////////////////////////
//
// �䷽ģ�����ݽṹ����
//
//
///////////////////////////////////////////////////////////////////////////////////////

// �䷽����
struct RECIPE_ESSENCE
{
	unsigned int	id;							// �䷽����ID
	namechar		name[32];					// �䷽��������


	namechar		type[16];					// �䷽���
	unsigned int	id_name_item;				// ʹ���˴���Ʒ������������Ʒ�����������ߵ����֡������0����Ĭ�ϲ�ʹ�ô���ƷҲ������
	int				live_skill;					// ��Ҫ�����
	int				add_skillpoint;				// ���ӵ�������
	int				learn_need_money;			// ѧϰ���Ľ�Ǯ
	int				learn_need_exp;				// ѧϰ���ľ���
	int				learn_need_live_skill_lvl;	// ѧϰ��Ҫ���ܵȼ�
	int				learn_need_player_lvl;		// ѧϰ��Ҫ��ҵȼ�
	int				use_cost_money;				// ʹ�����Ľ�Ǯ
	int				use_cost_repu_id;			// ʹ����������ID
	int				use_cost_repu_value;		// ʹ������������ֵ
	int				use_cost_produce_energy;	// ʹ�����ľ���ֵ
	
	struct  
	{
		int			skillpoint_limit;			// ������˥������
		float		attenuate_rate;				// ����������˥������
	} point_attenuate[3];

	float			produce_time;				// ����ʱ�䣨�룩
	unsigned int	near_npc[3];				// ���ڴ�NPC��Χ3�׷�Χ�ڣ��ҵĹ�ϵ

	// ����
	struct  
	{
		int			is_must_use;				// �����Ƿ���룬0��1��
		struct  
		{
			unsigned int	id_item;			// ����ID
			int				weight;				// ����Ȩ��
		}optional_material[6];
		int			need_num;					// ������Ҫ����
		int			can_choose_num;				// �Ƿ��ѡ����
		int			max_num;					// ��ѡ��������
	}materails[6];

	// ���
	struct  
	{
		int				weight;					// ���Ȩ��
		struct
		{
			unsigned int	id_item;				// ��ƷID
			int				num;					// ��Ʒ����
			float			prob;					// ��Ʒ����
		}
		drop_table[4],							// ��������
		extra_drop;								// ��������Ʒ

		unsigned int	show_item;				// ��ʾ��Ʒ
		unsigned int	show_item_num;			// ��ʾ��Ʒ����
	}results[8];

	int				vocation_action_type;		// ʹ��ʱ��������
	char			action[32];					// ʹ���䷽ʱ���ŵĶ���

	unsigned int	is_production_bind;			// �Ƿ�󶨲���
	int				extra_drop_table_id;		// ���������������ID
};

struct DROPTABLE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	unsigned int	is_fix_by_level;			// �Ƿ��ܵȼ�����,0:false,1:true
	int				instance_difficulty;		// ��Ӧ�����Ѷȵȼ�

	struct  
	{
		unsigned int	special_item_id;		// ����������ƷID
		int				special_item_num;		// ����������Ʒ����
		float			special_item_ratio;		// ����������Ʒ����
	}special_items[8];

	struct										// ����0~5����Ʒ�ĸ���
	{
		float		probability;

	} num_to_drop[5];

	struct										// ������Ʒ�б�
	{
		unsigned int	id_obj;					// ������Ʒid
		int				number;					// ������Ʒ����
		float			probability;			// �������

	} drops[64];

};

///////////////////////////////////////////////////////////////////////////////////////
//
// ����ģ�����ݽṹ����
//
//		ע: ����ֻ�������������С����, ����Ĺ�����������Ϊһ�������ڸ����н���ѡ��
//
//
///////////////////////////////////////////////////////////////////////////////////////

// ���ﱾ������
struct MONSTER_ESSENCE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����

	namechar		title[16];					// ����ƺ�ǰ׺
	namechar		prop[16];					// ��������, ���16������
	unsigned int	description;				// ��������˵��

	unsigned int	faction;					// �Լ�������Ӫ��ϴ��룬�μ�FACTION_MASK
	unsigned int	monster_faction;			// �������ϸ��ϵ����
	unsigned int	monster_race;				// ��������
	int				file_model;					// ģ��·����
	float			name_pos;					// ���ָ߶�
	float			size;						// ��С
	unsigned int	name_color;					// ������ɫ
	int				file_icon;					// Ŀ��ͷ����Դ�ļ�
	int				armor_type;					// �������Ч����ID
	float			strong_min;					// ǿ׳ϵ����Сֵ
	float			strong_max;					// ǿ׳ϵ�����ֵ
	
	unsigned int	id_strategy;				// ���﹥������ID
												// 0 ��ʾ�����ⲫ�����
												// 1 ��ʾ�����������
												// 2 ��ʾħ�������
												// 3 ��ʾ�ⲫ��Զ�������
												// 4 ������
												// 5 ����������
												// 6 ��׮��
												// 7 ����ħ����
												// 8 С͵��
											
	unsigned int	is_player_shadow;			// �Ƿ�Ϊ���Ӱ�ӹ�
	unsigned int	is_freeze_at_action;		// �Ƿ�����ֹ��ĳ֡
	namechar		freeze_at_action[16];		// ��ֹ������
	int				freeze_at_frame;			// ��ֹ����֡��

	int				quest_kill_as;				// ���������������ID������ɱ��ʱ�����ù�����Ϊ��һ������ID���м�����
	unsigned int	is_public_task_counter;		// �Ƿ��ж����񹫹�����������ɱ��ʱ��ֻҪ��ҹ���������ڹ�������ʱ�ͻ����������Ӽ�����

	int				level;						// ����ȼ�
	int				is_level_selfadaptive;		// �Ƿ�����Ӧ�ȼ�
	int				level_selfadaptive_range;	// ����Ӧ�ȼ�����
	int				level_selfadaptive_max_level;	// ����Ӧ��ߵȼ�
	int				exp_by_level_max_level;		// ƥ����˵ȼ����������߾������ȼ�
	int				drop_by_level_max_level;	// ����������ߵ������ȼ�
	int				level_punish;				// ����ͷ��ȼ�
	int				hp_bar_count;				// Ѫ������
	unsigned int	show_extra_hp_bar;			// ��ʾ����Ѫ��
	unsigned int    rank;						// ����׼�
												// 0 ��ͨ��ͷ��߿��޳��
												// 1 ��Ӣ��ͷ��߿������
												// 2 Boss��ͷ��߿����
	unsigned int	log_type;					// log ���
												// 0 ��ͨ����
												// 1 ���ͼͷĿ��
												// 2 ���ͼ��Ӣ��
												// 3 ������Ӣ��
												// 4 ����BOSS
												// 5 �BOSS
	unsigned int	boss_type;					// BOSS���� 0 ����BOSS 1 ��ͨBOSS 2 ����BOSS
	unsigned int	is_rendering_stroke;		// �Ƿ���Ⱦ���
	unsigned int	is_show_special_ring;		// �Ƿ���ʾϡ�й�Ȧ
	unsigned int	is_play_attacked_effect;	// �Ƿ��ܻ����
	unsigned int	is_play_attacked_action;	// �Ƿ񲥷��ܻ�����
	unsigned int	is_blown_on_dead;			// �Ƿ���������
	unsigned int	id_adjust_config;			// ѡ������������ID
	unsigned int	name_panel;					// ���������ͣ�
												// 0: ��������
												// 1: ���ͼ��Ӣ
												// 2: ���ͼǿ����Ӣ
												// 3: ������Ӣ
												// 4: ����ǿ����Ӣ
												// 5: ���BOSS�����ͼ����ͨ�ã�
	unsigned int	killed_exp;					// ����ɱ���Ƿ���ʧ����
	unsigned int	killed_drop;				// ����ɱ���Ƿ������Ʒ
	int				exp_mode;					// �������ģʽ 0 ���ѷ�̯�� 1 ͬʱ���

	// �������ͣ�ΪMask��Ϸ�ʽ
	//  0��ȱ	     1��ȱ		  2��ȱ          3��ȱ	        4��ȱ
	//  5��ȱ        6��ȱ        7����buff      8����debuff    9���߸���
	// 10���߿���   11��������   12���߼�Ѫ     13��ȱ         14��ȱ
	// 15��ȱ       16��������   17����������� 18��ȱ         19��ȱ
	// 20��ȱ       21��ȱ       22��ȱ         23��ȱ         24���߻���
	// 25���߼���   26���߶���   27���߳�Ĭ     28���ߴ��     29���߳����˺�
	// 30���߽��չ� 31���߽�е
	unsigned int	immune_type;


	unsigned int	hide_aggressive_tag;		// �Ƿ�����������ʶ
	unsigned int	is_notify_hp;				// �Ƿ�ͨ��Ѫ��
	unsigned int	show_name;					// �Ƿ���ʾ����
	unsigned int	is_limited_show_name;		// �Ƿ�����ʾ���ַ�Χ�ʹ�С����
	unsigned int	show_on_minimap;			// �Ƿ���ʾ��С��ͼ��
	unsigned int	show_injured_info;			// �Ƿ���ʾ���˺�����Ϣ
	unsigned int	show_damage_info;			// �Ƿ���ʾ�˺�����Ϣ
	unsigned int	can_selected;				// �Ƿ��ܱ�ѡ��
	unsigned int    can_select_by_tab;			// �Ƿ��ܱ�tabѡ��
	unsigned int    auto_lock;					// �Ƿ��Զ�����
	unsigned int	show_hint;					// �Ƿ���ʾ����
	unsigned int	show_target_of_target;		// �Ƿ���ʾĿ���Ŀ��
	int				id_circle;					// ��ΪĿ��ʱ���µĹ�Ȧid
	float			scale_circle;				// ��ΪĿ��ʱ���µĹ�Ȧ�Ŵ���
	float			sight_range;				// ��Ұ
	unsigned int    can_be_attack;				// �Ƿ��ܱ�����
	unsigned int    is_guard;					// �Ƿ�����
	
	unsigned int	aggressive_mode;			// ������ѡ��0 - ������1 - ����
	unsigned int	help_request_mode;			// ����ģʽ��0-��������1-����ս��ʱ���ȣ�2-��Ϊ����������ʱ����
	float			help_request_range;			// �����뾶
	unsigned int	monster_faction_ask_help;	// ����Щ��ϵ�������ӹ�����ϸ��ϵ��ѡ��
	unsigned int	monster_faction_can_help;	// ������Щ��ϵ�������ӹ�����ϸ��ϵ��ѡ��

	float			aggro_range;				// ��޾���
	float			attack_follow_range;		// ׷������
	float			aggro_time;					// ���ʱ��
	float			aggro_half_decay;			// ��޼�����(��)
	float			dead_aggro_time;			// ����������ʱ��

	unsigned int	patroll_mode;				// Ѳ�߷�ʽ�����ܵ��У�����߶���...
	float			patroll_range;				// �Զ�Ѳ�߰뾶
	unsigned int	stand_mode;					// վ����ʽ�����ܵ��У�����վ����˫��վ�������շ��е�

	float			walk_speed;					// �����ƶ��ٶ�(M/S)
	float			run_speed;					// �����ƶ��ٶ�(M/S)

	unsigned int	common_strategy;			// �������
	int				random_affix_pack;			// �����׺�����
	int				skills_for_affix[32];		// ��׺0-31��Ӧ����id

	unsigned int	notify_task_failed_when_disapper; // ������ʧ֪ͨʧ�ܵ�����ID
	unsigned int	fight_shout;				// ����ս����������������
	unsigned int	die_shout;					// ������������������
	unsigned int	is_fast;					// �Ƿ����
    unsigned int	time_refresh_default;		// ȱʡˢ��ʱ��
	int				dead_body_exist_time;		// ����ʬ�����ʱ��
	unsigned int	after_death;				// ������������-0���Ա�-0x1������-0x2
	struct
	{
		int id;									// ��������ID
		int delta;								// ������������ֵ
	}
	modify_scene_param_when_dead[4];			// ����ʱ�ı䳡������
	int				summon_monster_when_dead[4];// �����ٻ������
	
	float			money_drop_prob;			// ��Ǯ�������
	struct
	{
		int 			min;					// �������
		int				max;					// �������
		int				packs;					// �ֶ���
	}
	common_bind_money_config,					// �������䣺��Ǯ����
	common_money_config;						// �������䣺�ǰ�Ǯ����
	struct
	{
		float 			min;					// ���˵ȼ���ʼ��Ǯϵ�����������
		float			max;					// ���˵ȼ���ʼ��Ǯϵ�����������
		int				packs;					// �ֶ���
	}
	player_spec_bind_money_config,				// ���˵ȼ����䣺��Ǯ����
	player_spec_money_config;					// ���˵ȼ����䣺�ǰ�Ǯ����

	float			exp_factor;					// ����ֵ����
	unsigned int	is_release_stored_exp;		// �Ƿ��ͷŴ��澭��
	unsigned int	is_inc_team_shared_exp;		// �Ƿ����Ӷ��������
	int				hp;							// ������
	float			hp_factor;					// ����ֵ����
	int				hp_min;						// �������ֵ
	int				mp;							// ħ��
	struct  
	{
		int				fight_power;			// ����
		float			fight_power_rate;		// ��������
	}fp[2];
	int				angry;						// ŭ��
	int				exp;						// ����
	int				exp2;						// �ڶ�����
	int				attack;						// ����
	int				armor;						// ����
	float			lucky_att_rate;				// ����һ����
	float			direct_att_rate;			// ֱ����
	int				min_dmg;					// ��С������
	int				max_dmg;					// ��󹥻���
	int				defense;					// ������
	float			damage_rate;				// �˺�����(%)
	float			phy_anti_rate;				// �����˺�����(%)
	float			magic_anti_rate;			// �����˺�����(%)
	float			crit_rate;					// ������(%)
	float			anti_crit_rate;				// ���Ⱪ����(%)
	int				extra_crit_damage;			// ���������˺�
	int				extra_crit_defance;			// ���������˺�����
	int				element_attack[5];			// ���Թ��������ء�ˮ���𡢷硢��
	float			element_anti[5];			// ���Կ��ԣ��ء�ˮ���𡢷硢��
	float			element_damage_rate[5];		// �����˺����ʣ��ء�ˮ���𡢷硢��
	float			resistance[10];				// ���ԣ��ܿء�������ʧѪ������������1������2������3������4������5������
	float			ignor_resist[10];			// ���Լ��⣬�ܿء�������ʧѪ������������1������2������3������4������5������

	struct  
	{
		unsigned int	id_normal_attack;		// �չ�����ID
		int				normal_attack_lvl;		// �չ����ܵȼ�
		float			normal_attack_ratio;	// �չ����ܸ���
	}normal_attack[2];

	float			normal_attack_follow_range;	// �չ�׷������
	float			normal_attack_prob;			// �����չ�����
	float			normal_attack_factor;		// ��ͨ����ϵ��
	float			walk_around_prob;			// �������и���
	float			stand_by_prob;				// ����ԭ�صȴ�����
	int				walk_around_range;			// ���а뾶
	int				walk_around_range_fix;		// ���а뾶����
	int				walk_around_max_dist;		// ����������
	int				walk_around_time;			// ����ʱ��
	int				stand_by_time;				// ԭ�صȴ�ʱ��
	int				stand_by_dist;				// ԭ�صȴ�����

	unsigned int	soul_skill_id;				// ���Ǽ���ID
	int				soul_skill_lvl;				// ���Ǽ��ܵȼ�
	
	unsigned int   combo_pack_id[8];			// ְҵ 1~8 �������ܰ�

	int				hp_gen1;					// ���ٻ�Ѫ�ٶ�
	int				hp_gen2;					// ���ٻ�Ѫ�ٶ�
	int				mp_gen1;					// ���ٻ�ħ�ٶ�
	int				mp_gen2;					// ���ٻ�ħ�ٶ�
	int				fp_gen1;					// ���ٻض����ٶ�
	int				fp_gen2;					// ���ٻض����ٶ�
	float			smash;						// �ػ�
	float			parry;						// �м�
	float			penetration;				// �Ƽ�
	float			shell;						// ����
	float			dmg_anti;					// �˺�����

	unsigned int	role_in_war;				// ��ս�������ݵĽ�ɫ
												// 0 �ޣ�1 ���Ľ�����2 ������3 ������4 Ͷʯ����5 ���͵㣻6 ����㣻7 ����NPC��8 ռ���־��

	struct										// Ӱ���������
	{
		int			id;							// �������
		float		value;						// ������ֵ
	} reputation[2];

	unsigned int	is_player_specific_drop;	// �����Ƿ�����ҹ���
	unsigned int	is_enable_drop_script;		// �Ƿ�ͨ���ű�����
	int				id_drop_table[8];			// ����� id
	int				drop_by_level_config_id[8];	// ���ȼ�������������ģ��id
	int				loot_bag_life_time;			// loot������ʱ�䣨�룩
	unsigned int	is_loot_shared_in_raid;		// �����Ƿ��Ŷӹ���

	unsigned int	passive_skill;				// ���ﱻ������ID
	unsigned int	passive_skill_lvl;			// ���ﱻ�����ܵȼ�
	unsigned int	resource_value;				// ɱ����������Դ��
	unsigned int	score_value;				// ɱ�������ӱ��ַ�
	unsigned int	monster_pet_type;			// �������ѡ��

	unsigned int	catch_pet_reward_item[5];	// ʹ��1-5����׽���ߺ�����Ʒ

	unsigned int	can_tame;					// �Ƿ��ܱ�ѱ��
	unsigned int	tame_summon_pack;			// ѱ�޳ɹ�ʱ�ٻ���ID

	unsigned int	attack_player;				// �Ƿ񹥻����
	unsigned int	attack_list;				// ֻ����Ŀ���б��е�Ŀ��
	unsigned int	attack_targets[32];			// �ض�����Ŀ��

	unsigned int	disappear_type;				// ��ʧ���� 0=���� 1=˲�� 2=������������
	unsigned int	death_type;					// �������� 0=���� 1=˲�� 2=������������

	int				auto_select_priority;		// �Զ�ѡ�����ȼ�
};

// ϵͳ�ʼ�
struct SYSTEM_MAIL_CONFIG
{
	unsigned int	id;							// id 
	namechar		name[32];					// ����

	namechar		sender[16];					// ������
	namechar		title[16];					// ����
	unsigned int	content;					// �ʼ�����
	unsigned int	item_id;					// ������ƷID
	int				item_count;					// ������Ʒ����
	int				money;						// ���������
};

//������Ʒ��
struct SPECIAL_ITEMS_PACK_ESSENCE
{	
	unsigned int	id;							// id
	namechar		name[32];					// ����
	
	int  id_human_warrior_male;		// ����սʿ�л����Ʒid
	int  id_human_warrior_female;	// ����սʿŮ�����Ʒid
	int  id_human_thief_male;		// ����̿��л����Ʒid
	int  id_human_thief_female;		// ����̿�Ů�����Ʒid
	int  id_human_enchanter_male;	// ���෨ʦ�л����Ʒid
	int  id_human_enchanter_female;	// ���෨ʦŮ�����Ʒid
	int  id_human_priest_male;		// ������ʦ�л����Ʒid
	int  id_human_priest_female;	// ������ʦŮ�����Ʒid
	int  id_elf_warrior_male;		// ����սʿ�л����Ʒid
	int  id_elf_warrior_female;		// ����սʿŮ�����Ʒid
	int  id_elf_priest_male;		// ������ʦ�л����Ʒid
	int  id_elf_priest_female;		// ������ʦŮ�����Ʒid
	int  id_elf_poet_male;			// ����ʫ���л����Ʒid
	int  id_elf_poet_female;		// ����ʫ��Ů�����Ʒid
	int  id_dwarf_gunman_male;		// ���˻�ǹ�л����Ʒid
	int  id_dwarf_gunman_female;	// ���˻�ǹŮ�����Ʒid			
	int  id_giant_warrior_male;		// �����ػ����л����Ʒid
	int  id_vampire_thief_male;		// Ѫ��̿��л����Ʒid
	int  id_vampire_thief_female;	// Ѫ��̿�Ů�����Ʒid
	int  id_vampire_enchanter_male;	// Ѫ�巨ʦ�л����Ʒid
	int  id_vampire_enchanter_female;// Ѫ�巨ʦŮ�����Ʒid
	int  id_vampire_blood_male;		// Ѫ��Ѫħ�л����Ʒid
	int  id_vampire_blood_female;	// Ѫ��ѪħŮ�����Ʒid
};

// ESSENCE add here

///////////////////////////////////////////////////////////////////////////////////////
//
// NPCģ�����ݽṹ����
//
//		ע: NPC���������ͬ�����ݽṹ����NPC�ܹ��ṩ�ķ�������Ϊһ�����Լ��뵽NPC�����У�
//			���������ص����ݣ��磺������ʱ����Ʒ�б�ȣ�����Ϊ��������Դ��ڷ���ģ����
//			
//		����Ŀǰ���˽⣬����һ�������¼��ࣺ
//
///////////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////////
//
// NPC����ģ�����ݽṹ����
//
///////////////////////////////////////////////////////////////////////////////////////

// ��̸����
struct NPC_TALK_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����	

	unsigned int	id_dialog;					// �Ի�ID
};

// ������Ʒ�ķ���
struct NPC_SELL_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����

	int				ui_show_item_id;			// ��ʾӵ����ƷID
	unsigned int	is_ui_show_repu;			// �Ƿ���ʾ����
	int				ui_show_repu_id;			// ��ʾ����ID

	struct
	{
		namechar		page_title[8];			// ҳ�����֣����7������
		unsigned int	id_goods[48];			// �ɳ��۵���Ʒ�б�

	} pages[8];									// ��ҳ��ʽ�洢����Ʒ�б�
};

// �չ���Ʒ�ķ���
struct NPC_BUY_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����	

	unsigned int	id_dialog;					// �Ի�ID
};

// �����������
struct NPC_TASK_OUT_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����	

	unsigned int	id_task_set;				// ������

	// ����ˢ������
	unsigned int	auto_refresh_type;			// �Զ�ˢ��ʱ���  (0ÿ�գ�1ÿ��)
	unsigned int	hand_refresh_type;			// �ֶ�ˢ�·�ʽ  (0�ޣ�1��Ǯ��2�󶨽�Ǯ��3��Ʒ)
	unsigned int	id_pre_task;				// ��ǰ������
	int				accept_max;					// �������ȡ��������
	int				need_league_auth;			// �������Ҫ���ų�����
	int				ui_type;					// ������������� (0������1������)
	int				refresh_scope;				// ������ˢ������ (0����ˢ�£�1����ˢ��)
	int				refresh_count;				// ˢ���������������
	int				need_money;					// ˢ������������Ǯ��
	int				need_bind_money;			// ˢ�����������󶨽�Ǯ��
	unsigned int	need_item_id;				// ˢ�������������ƷID
	int				need_item_num;				// ˢ�������������Ʒ����

	unsigned int	id_tasks[256];				// ���Դ���������б�
};

// ��֤����������
struct NPC_TASK_IN_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����	

	unsigned int	id_tasks[256];				// ���Դ���������б�
};

// ����������Ʒ����
struct NPC_TASK_MATTER_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����	

	struct
	{
		unsigned int	id_task;				// ���Դ���������б�
		struct
		{
		unsigned int	id_matter;				// ���������Ʒid
		int				num_matter;				// ���������Ʒ��Ŀ
		} taks_matters[4];

	} tasks[16];
};

// ���Ʒ���
struct NPC_HEAL_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����

	unsigned int	id_dialog;					// �Ի�ID
};

// ���ͷ���
struct NPC_TRANSMIT_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����

	unsigned int	bind_return_town;			// �Ƿ�ɰ�Ϊ�س̵�
	int				id_target[16];				// Ŀ�괫�͵�id

	struct {
		int			id_line;					// Ŀ������ID
		int			id_world;					// Ŀ�������ID
		namechar	name[256];					// Ŀ�������1
		float		x;							// Ŀ���x����
		float		y;							// Ŀ���y����
		float		z;							// Ŀ���z����
		int			fee;						// ����
		int			required_level;				// �ȼ�Ҫ��
	} targets[16];

	unsigned int	id_dialog;					// �Ի�ID
};

// ���۷���
struct NPC_PROXY_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����

	unsigned int	id_dialog;					// �Ի�ID
};

// �洢��Ʒ����Ǯ
struct NPC_STORAGE_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����
};

// ��ս�����������
struct NPC_WAR_TOWERBUILD_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����

	struct 
	{
		int				id_in_build;				// �����еĶ���id
		int				id_buildup;					// ������ɺ�Ķ���id
		int				id_object_need;				// ����Ҫ����Ʒ
		int				time_use;					// ���������ʱ��
		int				fee;						// ��������ķ���

	} build_info[4];
};

// ϴ�����
struct NPC_RESETPROP_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����

	struct 
	{
		int				id_object_need;			// ����Ҫ����Ʒ
		int				resetprop_type;			// ϴ�㷽ʽ
	} prop_entry[6];
};

// װ���󶨷���
struct NPC_EQUIPBIND_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����

	int				id_object_need;				// ����Ҫ����Ʒ
	int				price;						// ����Ҫ��Ǯ
};

// װ�����ٷ���
struct NPC_EQUIPDESTROY_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����

	int				id_object_need;				// ����Ҫ����Ʒ
	int				price;						// ����Ҫ��Ǯ
};

// װ��������ٷ���
struct NPC_EQUIPUNDESTROY_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����

	int				id_object_need;				// ����Ҫ����Ʒ
	int				price;						// ����Ҫ��Ǯ
};

// �õ����
struct NPC_HOTEL_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����

	int				id_world;					// Ŀ�������ID
	float			x;							// Ŀ���x����
	float			z;							// Ŀ���z����
	float			y;							// Ŀ���y����
};

// ����ѧϰ����
struct NPC_LEARN_PRODUCE_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����

	struct
	{
		int				produce_skill;			// �����ID
		int				learn_cost_money;		// ѧϰ���ѽ�Ǯ
	} info[32];
};

// ѧϰ���ܷ���
struct NPC_LEARN_SKILL_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����

	int				ui_index;					// ѧϰ���ܽ�����
	int				level_required;				// Ҫ����ҵȼ�
	int				repu_required_id;			// Ҫ������ֵ���
	int				repu_required_val;			// Ҫ������ֵ��ֵ
	int				id_skill[32];				// ���ڼ��ܵ�ģ��ID
};

// ְҵѡ�����
struct PROF_SELECT_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����

	unsigned int	prof_mask;					// ��ѡְҵmask
	unsigned int	task_id;					// ��������id
};

// ���̸ۿڷ���
struct NPC_TRADE_PORT_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����

	int				id_port;					// �ۿڱ��
	int				x;							// �ۿ�λ������x
	int				y;							// �ۿ�λ������y
	int				moneybag_type;				// ��ӦǮ������
	float			high_price_time_factor;		// �۸�ָ��>=100%ʱ�۸�ά��ʱ��ϵ��
	float			low_price_time_factor;		// �۸�ָ��<100%ʱ�۸�ά��ʱ��ϵ��
	float			profit_limit_factor[16];	// 1-16�ཻ��Ʒ�۸�䶯ǰ����������ϵ��

	struct
	{
		int			id;							// ����Ʒģ��ID
		float		max_price_factor_inc;		// �۸�ָ���������
	}popular[10];								// ���ܻ�ӭ����1-10

	int				id_news;					// ��Ӧ�İ������а�ID
	int				event_type;					// �¼�����

	struct
	{
		int			id;							// ����Ʒģ��ID
		int			number;						// ������
	}goods[20];									// ���ۿڳ������̽���Ʒ1-20
};

// �л�����ְҵ����
struct NPC_SWITCH_PROF_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����
	
	unsigned int    id_items;                   // ��Ҫ����id
	int             items_num;					// ��Ҫ��������
	int				money;						// ��Ҫ�������
	int             bind_money;					// ��Ҫ�󶨱�����
	unsigned int    id_repu;					// ��Ҫ����id
	int				repu_num;					// ��Ҫ��������
};

// ��������
struct NPC_DUNGEON_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����

	unsigned int	dungeon_list[16];			// ����ģ��ID
};

// ս������
struct NPC_BATTLE_FIELD_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����

	unsigned int	battle_field_list[8];		// ս��ģ��ID
};

// �������۷���
struct NPC_LIMITED_SALE_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����

	int				refresh_interval;			// ��Ʒˢ�¼�����룩
	struct
	{
		float		empty_prob;					// ���ڲ�������ƷȨ��
		struct  
		{
			int		id;							// ��ƷID
			float	prob;						// ��Ʒ����Ȩ��
			int		count_min;					// ��Ʒˢ����������
			int		count_max;					// ��Ʒˢ����������
		}
		items[8];								// ����1-8����Ʒ
	}
	groups[8];									// ��1-8����Ʒ��
};

// ���̷���
struct NPC_IMPRINT_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����

	int				server_index;				// ���������
	int				max_text_length;			// ��������
	struct
	{
		int			cost_item;					// ������ƷID
		int			cost_item_count;			// ������Ʒ����
	}
	prioriy[3];									// �������ȼ�1-3������Խ�����ȼ�Խ��
};

// ��Ʒ�һ�����
struct NPC_ITEM_EXCHANGE_SERVICE
{
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����

	struct
	{
		namechar		page_title[16];			// ��ҳ����
		unsigned int	item_exchange_conf_list[32]; // ��Ʒ�һ�����1-32
	}
	pages[8];									// ��ҳ1-8 
};

// ����ѡ�����
struct NPC_FORCE_SELECT_SERVICE
{
	enum ForceMask
	{
		FORCE_NONE		= 0x1,					// ������
		FORCE_ATHENA	= 0x2,					// ʥ��
		FORCE_POSEIDON	= 0x4,					// ����
		FORCE_HADES		= 0x8,					// ڤ��
	};
	unsigned int	id;							// ����(����)ID
	namechar		name[32];					// ����

	unsigned int	force_mask;					// �μ�ForceMask	
};

// SERVICE add here

// NPC���Ͷ���
struct NPC_TYPE
{
	unsigned int	id;							// (����)ID
	namechar		name[32];					// ����	
};

struct NPC_SUB_TYPE
{
	unsigned int	id;							// (����)ID
	namechar		name[32];					// ����	
};

///////////////////////////////////////////////////////////////////////////////////////
//
// NPC����ģ�����ݽṹ����
//
///////////////////////////////////////////////////////////////////////////////////////
struct NPC_ESSENCE
{
	unsigned int	id;							// NPC(����)ID
	namechar		name[32];					// ����

	unsigned int	monster_race;				// NPC����
	unsigned int	description;                // NPC����˵��
	namechar        name_prof_prefix[16];       // NPCְҵǰ׺
	namechar        name_prof_postfix[16];	    // NPCְҵ��׺
	float			name_pos;					// ���ָ߶�

	float			refresh_time;				// ˢ��ʱ��

	int				head_icon;					// ͷ������ͼ��
	int				map_ui_icon;				// Mͼ��ʾͼ��
	unsigned int	is_rendering_stroke;		// �Ƿ���Ⱦ���
	unsigned int	show_on_minimap;			// �Ƿ���ʾ��С��ͼ��
	unsigned int	is_visiable_on_whole_map;	// ȫ��ͼ�ɼ�
	unsigned int	show_injured_info;			// �Ƿ���ʾ���˺�����Ϣ
	unsigned int	show_damage_info;			// �Ƿ���ʾ�˺�����Ϣ
	unsigned int	can_selected;				// �Ƿ��ܱ�ѡ��
	unsigned int	show_hint;					// �Ƿ���ʾ����
	unsigned int    can_talk;					// �Ƿ���ԶԻ�
	unsigned int    is_close_up_when_talk;		// �Ի�ʱ�Ƿ�������ͷ
	unsigned int	can_turn_round;				// �Ƿ����ת��
	unsigned int	check_visible_by_lua;		// �Ƿ��ɽű����ƿͻ�������
	unsigned int	character_combo_id;			// ����ѧϰ�������ܷ����ְҵ

	int				file_model;					// ģ��·����
	int				file_icon;					// ͼ��·��

	unsigned int	id_src_monster;				// �����������ԵĹ���ID������ʱ��ʾʹ�øù��������滻��NPC������
	unsigned int    rank;						// NPC�׼�

	int				id_circle;					// ��ΪĿ��ʱ���µĹ�Ȧid
	float			scale_circle;				// ��ΪĿ��ʱ���µĹ�Ȧ�Ŵ���

	unsigned int	hello_text;					// �����ף���һ�������ı�

	int				service_using_type;			// ����ʹ��Ȩ��

	// �����б�
	unsigned int	id_talk_service;			// ��̸�ķ���ID
	unsigned int	id_sell_service;			// ������Ʒ�ķ���ID
	unsigned int	id_limited_sale_service;	// �������۵ķ���ID
	unsigned int	id_learn_produce;			// ѧϰ�����ķ���
	unsigned int	id_task_out_service;		// ������صķ���ID: �����������
	unsigned int	id_task_in_service;			// ������صķ���ID: ��֤����������
	unsigned int	id_transmit_service;		// ���͵ķ���ID
	unsigned int	id_prof_service;			// ְҵѡ�����
	unsigned int	id_skill_learn_service;		// ����ѧϰ����
	unsigned int	id_recipe_service;			// �䷽�ϳɷ���
	unsigned int	instance_service;			// �籾��������
	unsigned int	dungeon_service;			// ��������
	unsigned int	battle_field_service;		// ս������
	unsigned int	imprint_service;			// ���̷���
	unsigned int	item_exchange_service;		// ��Ʒ�һ�����
	unsigned int	force_select_service;		// ����ѡ�����

	// �򵥷�����ϣ����е�ÿһλ����һ������Ҫ�����ķ���
	// [0] �μ�NPC_SIMPLE_SERVICE
	// [1] Ŀǰ����
	unsigned int	combined_services[2];

	int				id_ai_script;               // AI�ű�id
	unsigned int	collision_in_server;		// �Ƿ������ײ

	unsigned int	mouse_type;					// ���������
	unsigned int	dialog_type;				// �Ի�������

};

///////////////////////////////////////////////////////////////////////////////////////
//
// ����ģ�����ݽṹ����
//
///////////////////////////////////////////////////////////////////////////////////////
struct MINE_ESSENCE
{
	unsigned int	id;							// ��(����)ID
	namechar		name[32];					// ����
						  
	unsigned int	item_quality;				// ��ƷƷ��
	unsigned int	level_min;					// �ȼ�����
	unsigned int	level_max;					// �ȼ�����
	int				refresh_time;				// ˢ��ʱ�䣨�룩
	unsigned int	is_show_tip;				// �Ƿ�������ʾ������
	unsigned int    mine_find_type;				// Ѱ������
	unsigned int	id_equipment_required;		// ����Ҫ�Ĺ�������
	unsigned int	eliminate_tool;				// ���Ĳɾ��þ�(true or false)
	unsigned int	time_min;					// �ɿ�ʱ�����ޣ��룩
	unsigned int	time_max;					// �ɿ�ʱ�����ޣ��룩

	unsigned int	need_live_skill_id;			// ��Ҫ�����ID
	int				need_live_skill_lvl;		// ��Ҫ����ܵȼ�

	int				smart_camera_on_start;		// �ɼ�ʱ���þ�ͷ����ID
	int				smart_camera_on_success;	// �ɼ��ɹ����þ�ͷ����ID

	unsigned int	need_buff;					// �ɼ���Ҫ��ǰ��BUFF
	unsigned int	exclusive_buff;				// �ɼ��Ļ���BUFF
	unsigned int	cast_on_gather_begin;		// �ɼ���ʼʱ��������
	unsigned int	cast_on_gather_success;		// �ɼ��ɹ��󴥷�����
	unsigned int	cast_on_success_level;		// �ɼ��ɹ��󴥷����ܵȼ�

	int				skillpoint;					// ÿ�βɼ�����������Ȼ���ֵ

	struct  
	{
		int			skillpoint_limit;			// ������˥������
		float		attenuate_rate;				// ����������˥������
	} point_attenuate[3];

	int				file_matter;				// ģ��·����
	int				cursor_type;				// �����������
	unsigned int	is_need_roll;				// ʰȡʱ�Ƿ�ROLL��

	unsigned int	drop_table[4];				// �����
	unsigned int	is_drop_to_bag;				// �����Ƿ�ֱ�ӽ���

	unsigned int	task_in;					// ��Ҫ������id
	unsigned int	task_out;					// �ɼ����������id

	unsigned int	uninterruptable;			// �ɼ����̲����ж�, false-�����ж�, true-�����ж�
	unsigned int	is_unmount_on_gather;		// �ɼ�ʱȡ����˺ͷ���
	unsigned int	id_summon_pack;				// ����NPC�ٻ���ID

	struct 
	{
		unsigned int	monster_faction;		// ��޵Ĺ�����ϸ��ϵ
		float			radius;					// ��ް뾶���ף�
		int				num;					// �����ֵ
	} aggros[1];

	unsigned int	role_in_war;				// ��ս�������ݵĽ�ɫ
												// 0 �ޣ�1 ���Ľ�����2 ������3 ������4 Ͷʯ����5 ���͵㣻6 ����㣻7 ����NPC��8 ռ���־��

	int				map_ui_icon;				// Mͼ��ʾͼ��

	unsigned int	permenent;					// �ɼ�����ﲻ��ʧ��false-��ʧ��true-����ʧ

	unsigned int	activate_controller_mode;	// ���������������ʽ
	unsigned int	activate_controller_id[4];	// �������������id

	unsigned int	deactivate_controller_mode;	// �رչ����������ʽ
	unsigned int	deactivate_controller_id[4];// �رչ��������id

	int				vocation_action_type;		// �ɼ�ʱ��������
	char			action[32];					// �ɼ�ʱ���ŵĶ�����

	unsigned int	sound;						// �ɼ�ʱ��Ч
	char			mine_action[32];			// ���ﶯ��
	float			colddown;					// ��ȴʱ��(��)
	float			protect_time_on_born;		// ��������ʱ�䣨�룩

	unsigned int	is_show_progress;			// �Ƿ���ʾ������
	namechar		progress_desc[16];			// ��������ʾ����
	int				is_show_collectable_effect;	// �Ƿ���ʾ�ɲɼ���Ч

	unsigned int	desc;						// ��������
	int				hide_when_uncollectable;	// ���ɲɼ�ʱ����
	int				is_multiple;				// �Ƿ���Զ��˲ɼ�
	int				times_min;					// ����ɲɼ���������
	int				times_max;					// ����ɲɼ���������
	float			prop_eliminate;				// ���Ĳɾ��þ߸���
	int				idRegisterName;				// �ɿ�ɹ�ʱ�����¼���ע������id
	int				idParam1;					// �¼�����1
	int				idParam2;					// �¼�����2

	unsigned int	is_faction_limited;			// �ɼ��Ƿ�����Ӫ����
	struct
	{
		int			faction;					// ����ɼ�����ӪMask, �μ�FACTION_MASK
		int			activate_controller;		// ����Ӫ�ɼ�ʱ�����Ĺ��������
	} faction_cfg[3];
};

// ���ͺ���
struct TRANSMITBOX_ESSENCE
{
	unsigned int	id;					// ���ͺ���(����)ID
	namechar		name[32];			// ����, ���15������
	
	int				shape;				// ���ͣ�0�����壻1��Բ����2�������䣩
	float			radius;				// ��Ч����뾶
	float			height;				// ��Ч�߶�
	int				line_id;			// Ŀ������ID
	int				target_world;		// Ŀ������ID
	float			target_pos_x;		// Ŀ����������x
	float			target_pos_y;		// Ŀ����������y
	float			target_pos_z;		// Ŀ����������z
	unsigned int	faction;			// �Լ�������Ӫ��ϴ��룬�μ�FACTION_MASK
	int				level_req;			// ��ɫ�ȼ�����
	unsigned int	task_req;			// ����ȡ����ǰ��
	int				dungeon_config_id;	// ��������ģ��ID
};

// �Ի����̶���
struct talk_proc
{
	namechar			text[64];					// �Ի��ĵ�һ�����ڵ���ʾ���֣����63������

	struct option
	{
		unsigned int	id;							// ѡ�����ӵ��Ӵ��ڻ���ID, ������λΪ1��ʾ��һ��Ԥ����Ĺ���, Ϊ0��ʾһ���Ӵ���
		namechar		text[64];					// ѡ�����ӵ���ʾ���֣����19������
		unsigned int	param;						// ѡ����صĲ���
		int				param_addon;                // ����Ĳ���
	};

	struct window
	{
		unsigned int	id;							// ����ID, ���λ����Ϊ1
		unsigned int	id_parent;					// ������ID, Ϊ-1��ʾ������

		int				talk_text_len;				// �Ի����ֵĳ���
		namechar * 		talk_text;					// �Ի�����

		int				num_option;					// ѡ����Ŀ
		option *		options;					// ѡ���б�

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

	unsigned int		id_talk;				// �Ի������ID

	int					num_window;				// ���Ի����ֵĴ��ڸ���
	window *			windows;				// ���Ի����ֵĴ���
	
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

	// ���̶���
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
// ϵͳ�����ļ���ģ��
///////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
// ��Ӫ�ж��б�
///////////////////////////////////////////////////////////////////////////////////////
struct ENEMY_FACTION_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������

	unsigned int	enemy_factions[32];		// �μ�FACTION_MASK
											// 0 - ��ͨ��ҵĵж���Ӫ�б�
											// 1 - ����״̬�ĵж���Ӫ�б�
											// 2 - ����״̬�ĵж���Ӫ�б�
											// 3 - ����״̬�ĵж���Ӫ�б�
											// 4 - ��ս�����ĵж���Ӫ�б�
											// 5 - ��ս�ط��ĵж���Ӫ�б�
											// 6 - ��ս�����Ѿ��ĵж���Ӫ�б�
											// 7 - ��ս�ط��Ѿ��ĵж���Ӫ�б�
											// 8 - ��ͨ����ĵж���Ӫ�б�
											// 9 - ��ͨNPC(���ܡ���������)�ĵж���Ӫ�б�
											// 10 - ������ϵ1�ĵж���Ӫ�б�
											// 11 - ������ϵ2�ĵж���Ӫ�б�
											// 12 - �ԵжԹ���
											// 13 - ����NPC
											// 14 - а�����
};

///////////////////////////////////////////////////////////////////////////////////////
// ְҵ�����б�
///////////////////////////////////////////////////////////////////////////////////////
struct CHARRACTER_CLASS_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������

	unsigned int	character_class_id;		// ְҵid

	int				attack_skill_id;		// �չ�����
	float			attack_range;			// �չ�����
	unsigned int	unarmed_normal_attack_skill_id;		// �����չ�����ID

	int				permit_second_prof;		// ��Ӧ�ڶ�ְҵ

	struct  
	{
		int				level_required;			// �����ɫ�ȼ�
		float			hp;						// ��ʼ������
		float			mp;						// ��ʼ����ֵ
		float			fight_power;			// ��ʼ����
		float			angry;					// ��ʼŭ��
		float			min_att;				// ��ʼ��С������
		float			max_att;				// ��ʼ��󹥻���
		float			defence;				// ��ʼ������
		float			attack;					// ��ʼ����
		float			armor;					// ��ʼ����
		float			crit_rate;				// ��ʼ����һ����(%)
		float			anti_crit_rate;			// ��ʼ��������һ����(%)
		int				extra_crit_damage;		// ��ʼ���������˺�
		int				extra_crit_defance;		// ��ʼ���������˺�����
		float			element_dmg[5];			// ��ʼ���Թ��������ء�ˮ���𡢷硢��
		float			element_anti[5];		// ��ʼ���Կ���
		float			element_anti_reduce[5];	// ��ʼ���Կ��Լ���
		float			condition_rate[10];		// ��ʼ״̬���ԣ��ܿء�������ʧѪ������������1������2������3������4������5������
		float			condition_anti[10];		// ��ʼ״̬���ӿ��ԣ��ܿء�������ʧѪ������������1������2������3������4������5������

		float			lvlup_hp;					// ÿ��һ����������������
		float			lvlup_mp;					// ÿ��һ��������������ֵ
		float			lvlup_fight_power;			// ÿ��һ�������Ķ���
		float			lvlup_angry;				// ÿ��һ����������ŭ��
		float			lvlup_min_att;				// ÿ��һ������������С������
		float			lvlup_max_att;				// ÿ��һ������������󹥻���
		float			lvlup_defence;				// ÿ��һ���������ķ�����
		float			lvlup_attack;				// ÿ��һ��������������
		float			lvlup_armor;				// ÿ��һ��������������
		float			lvlup_crit_rate;			// ÿ��һ��������������һ����(%)
		float			lvlup_anti_crit_rate;		// ÿ��һ���������ļ�������һ����(%)
		int				lvlup_extra_crit_damage;	// ÿ��һ���������ı��������˺�
		int				lvlup_extra_crit_defance;	// ÿ��һ���������ı��������˺�����
		float			lvlup_element_dmg[5];		// ÿ��һ�������������Թ��������ء�ˮ���𡢷�
		float			lvlup_element_anti[5];		// ÿ��һ�������������Կ���
		float			lvlup_element_anti_reduce[5];	// ÿ��һ�������������Կ��Լ���
		float			lvlup_condition_rate[10];	// ÿ��һ����������״̬���ԣ���Ĭ�����ҡ��ж�����Ѫ�����ա����ء�������ʯ�������١�����
		float			lvlup_condition_anti[10];	// ÿ��һ����������״̬���ӿ��ԣ���Ĭ�����ҡ��ж�����Ѫ�����ա����ء�������ʯ�������١�����
	}data[10];

	float			lucky_att;				// ����һ����
	float			direct_att;				// ֱ����
	float			damage_rate;			// �˺�����
	float			phy_dmg_anti;			// �����˺�����
	float			magic_dmg_anti;			// �����˺�����
	int				fixed_cure;				// ������Ч���̶�ֵ
	float			cure_rate;				// ������Ч���ٷֱ�
	float			element_att_ratio[5];	// ���Թ�����ϵ�����ء�ˮ���𡢷硢��

	float			walk_speed;				// �����ٶ�(M/S)
	float			run_speed;				// �����ٶ�(M/S)
	int				hp_gen[2];				// ��ս��״̬��HP�ָ��ٶ�
											// ս��״̬��HP�ָ��ٶ�
	int				mp_gen[2];				// ��ս��״̬��MP�ָ��ٶ�
											// ս��״̬��MP�ָ��ٶ�
	int				fight_power_gen[2];		// ��ս��״̬�ж����ָ��ٶ�
											// ս��״̬�ж����ָ��ٶ�
	int				angry_gen[2];			// ��ս��״̬��ŭ���ָ��ٶ�
											// ս��״̬��ŭ���ָ��ٶ�

	int				max_combo;				// ������ߵ���
	unsigned int	is_clear_combo_when_target_changed; // �л�Ŀ���Ƿ���������
	int				combo_clear_time;		// ���������ļ��ʱ�䣨�룩
	int				energy_point_generation;// �������ɶ�������
	int				max_energy_points;		// ����������
	int				energy_points_duration;	// ������ʱ��
	int				energy_points_clear_time;// ��ս���嶹ʱ��

	struct  
	{
		int			value;					// ְҵ����
		int			gen[2];					// ְҵ����ս����/ս���ڻָ��ٶ�
	}
	prof_spec_energy[2];					// ְҵ����1-2

	float			smash;					// �ػ�
	float			parry;					// �м�
	float			penetration;			// �Ƽ�
	float			shell;					// ����
	int				exhaust_qte_skill_id[4];// ����QTE����ID
	int				dash_skill_id[4];		// ˫���ƶ�����ʩ�ż���id ([0]ǰ [1]�� [2]�� [3]��)
	int				cosmos_burst_skill_id;	// С���汬������id
	struct
	{
		int player_lv;						// С����������������ȼ�
		int exp;							// С�����������辭��
		int talent_sum;						// С�������������ķ��ӵ��ܺ�
		unsigned int item_id;				// С��������������ƷID
		int item_num;						// С��������������Ʒ����
	}cosmos[20];							// С��������1~20��

	int				init_skill_id[32];		// ְҵ��������

	struct
	{
		int level_req;						// ����������ҵȼ�
		struct
		{
			int fight_power_req;			// �������ս����
			int saint_cloth_wing[4];		// ս�������id��0-��ͭ 1-���� 2-�ƽ� 3-��ʥ�£���ο�CLOTH_CONFIG::category
			int fasion_wing;				// ʱװ���id
		}
		wings[6];							// ���1-3
	}
	wing_sections[6];						// �������1-3

	struct
	{
		int skill_id;						// �չ�����
		int skill_level;					// �չ����ܵȼ�
		float prob;							// �չ����ܸ���
	}
	shadow_monster_attack_skill[2];			// ������Ӱ�ӹ��չ�����
};

///////////////////////////////////////////////////////////////////////////////////////
// ��������������Ϸ�м��㹫ʽ��ĳЩ����������
///////////////////////////////////////////////////////////////////////////////////////
struct PARAM_ADJUST_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������

	struct
	{
		int			level_diff;				// Player�͹���ļ����(Player-����)(�������Ϊ0ʱ����ʾ����ʧЧ)
		float		adjust_exp;				// ��ɱ�ֻ�þ��������ϵ��(0.0~1.0)
		float		adjust_matter;			// ��ɱ�ֵ�����Ʒ�ĸ��ʵ�����(0.0~1.0)
	} level_diff_adjust[16];				// ������ɱ�ּ�������

	struct
	{
		float		adjust_exp;				// ��ɱ�ֻ�þ��������ϵ��(0.0~1.0)
	} team_adjust[11];						// ���ɱ��ʱ�ļ�������

	struct 
	{
		int			level_diff;				// ����͹���ļ����
		float		adjust_exp;				// ��ɱ�ֳ����õĳ��ﾭ������ϵ��
	} pet_level_diff_adjust[16];			// �����Գ���ɱ�ּ�������

	struct 
	{
		int			level_diff;				// �ػ���͹���ļ����
		float		adjust_exp;				// ��ɱ���ػ����õ��ػ��龭������ϵ��
	} guardian_soul_level_diff_adjust[16];	// �������ػ���ɱ�ּ�������

	float adjust_friend_exp_share[10];		// ���Ѿ�������Ѻö�1~10��ϵ��
};

///////////////////////////////////////////////////////////////////////////////////////
// ����������߱�
///////////////////////////////////////////////////////////////////////////////////////
struct PLAYER_LEVELEXP_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������

	struct
	{
		double		need_exp;				// �����õȼ�������ֵ
		double		need_skill_exp;			// �����õȼ���������ֵ
		double		store_exp_max;			// �õȼ����Ի�����߾���
		double		store_exp2_max;			// �õȼ����Ի�����ߵڶ�����
	}
	player_level[200];						// ��ҵȼ�1~200��������
	double			pet_exp[200];			// ����������1~200��ÿ������Ҫ�ľ���ֵ
	double			guardian_soul_exp[200];	// �ػ���������1~200��ÿ������Ҫ�ľ���ֵ
};

///////////////////////////////////////////////////////////////////////////////////////
// ���澭���������ñ�
///////////////////////////////////////////////////////////////////////////////////////
struct STORED_EXP_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������
	
	int64_t			max_stored_exp[200];	// 1~200�����澭������
	int64_t			max_stored_exp2[200];	// 1~200���ڶ����澭������
};

struct PLAYER_SECONDLEVEL_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������

	float			exp_lost[256];			// ������ʧ��
};

///////////////////////////////////////////////////////////////////////////////////////
// �ӵ��Ӧ���Ա�
///////////////////////////////////////////////////////////////////////////////////////
struct STATUS_POINT_PROP_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������

	int				status_point_type;		// �������

	float			hp;						// ��ʼ������
	float			mp;						// ��ʼħ��
	float			angry;					// ��ʼŭ��
	float			lucky_att;				// ��ʼ����һ��
	float			direct_att;				// ��ʼֱ����
	float			phy_dmg;				// ��ʼ��������
	float			phy_def;				// ��ʼ���������
	float			magic_dmg;				// ��ʼ����������
	float			magic_def;				// ��ʼ����������
	float			spec_dmg;				// ��ʼ���⹥����
	float			spec_def;				// ��ʼ���������
	float			attack;					// ��ʼ����
	float			armor;					// ��ʼ����
	float			crit_rate;				// ��ʼ����һ����(%)
	float			crit_damage;			// ��ʼ����һ���˺�(%)
	float			anti_crit_rate;			// ��ʼ��������һ����(%)
	float			anti_crit_damage;		// ��ʼ��������һ���˺�(%)

	float			attri_dmgs[5];			// ��ʼ���Թ��������ء�ˮ���𡢷硢����
	float			attri_anti[5];			// ��ʼ���Կ���
	float			attri_reduce_anti[5];	// ��ʼ���Կ��Լ���

	float			pet_adapt[2];			// ��ʼ������Ӧ��
	float			pet_affect[2];			// ��ʼ����Ӱ��ֵ

	float			walk_speed;				// �����ٶ�(M/S)
	float			run_speed;				// �����ٶ�(M/S)
	float			riding_speed;			// ������˱����ٶ�(M/S)

	float			hp_gen1;				// ��ս��״̬��HP�ָ��ٶ�
	float			hp_gen2;				// ��ս��״̬�д���HP�ָ��ٶ�
	float			hp_gen3;				// ս��״̬��HP�ָ��ٶ�
	float			hp_gen4;				// ս��״̬�д���HP�ָ��ٶ�
	float			mp_gen1;				// ��ս��״̬��MP�ָ��ٶ�
	float			mp_gen2;				// ��ս��״̬�д���MP�ָ��ٶ�
	float			mp_gen3;				// ս��״̬��MP�ָ��ٶ�
	float			mp_gen4;				// ս��״̬�д���MP�ָ��ٶ�
};

///////////////////////////////////////////////////////////////////////////////////////
// ����ӵ�������
///////////////////////////////////////////////////////////////////////////////////////
struct PLAYER_STATUS_POINT_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������

	int				status_point[200];
};

//�츳������
struct PLAYER_TALENT_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������

	int				talent_point[200];		// ����1-200��ʱ��õ���
	int				subprof_soul_limit[201];// ��ְҵ0-200��ʱ�������
};

// ��ν���Ա�
struct TITLE_PROP_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������

	unsigned int	id_title;				// ��νid

	int				prop_active_when_get;	// �Ƿ�ʱ��Ч
	unsigned int	id_prop;				// �������԰�ID
};

///////////////////////////////////////////////////////////////////////////////////////
// ����ܷ���ģ��
///////////////////////////////////////////////////////////////////////////////////////
struct PRODUCE_TYPE_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������

	unsigned int	id_sub_prof;			// ��ְҵ����
	namechar		sub_type_name[8][16];	// �ӷ���1-8����
};

///////////////////////////////////////////////////////////////////////////////////////
// �������춨���
///////////////////////////////////////////////////////////////////////////////////////
struct LEVELUP_MODIFY_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������

	int				hp_mp_modify[200];		// 1-200��HPMP�ۼ�����ֵ
	int				dmg_def_modify[200];	// 1-200�����������ۼ�����ֵ
	int				hit_jouk_modify[200];	// 1-200�����ж����ۼ�����ֵ
	int				mas_res_modify[200];	// 1-200����ͨ�����ۼ�����ֵ
};

///////////////////////////////////////////////////////////////////////////////////////
// ѧϰ���ܵ�Ԫ
///////////////////////////////////////////////////////////////////////////////////////
struct SKILL_LEARN_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������

	int				skill_id;				// ����id
	int				max_level;				// ����ѧϰ�ȼ�����
	int				prof_limited;			// �������ְҵ

	struct sSkillData
	{
		int				player_level;			// Ҫ����ҵȼ�
		int				player_cosmos_level;	// Ҫ�����С����ȼ�
		int				skill_required_id;		// Ҫ��ǰ�Ἴ�ܵ�ID
		int				skill_required_level;	// Ҫ��ǰ�Ἴ�ܵĵȼ�
		int				repu_required_id;		// Ҫ������ֵ���
		int				repu_required_val;		// Ҫ������ֵ��ֵ
		int				exp_cost;				// �۳�����
		int				gold_reduce;			// �۳���Ǯ
		int				bind_money_reduce;		// �۳��󶨱�
		int				repu_reduced_id;		// �۳�����ֵ���
		int				repu_reduced_val;		// �۳�����ֵ��ֵ
		int				item_reduced_id;		// �۳���������ĳһ����ƷID
		int				item_reduced_number;	// �۳���������ĳһ����Ʒ����
	}skill_data[100];							// 1-20������
};

/////////////////////////////////////////////////////////////////////////////////////////////////
// �������԰�
/////////////////////////////////////////////////////////////////////////////////////////////////
struct ADDON_PACKAGE_CONFIG
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				affix;						// ǰ��׺ѡ��
	namechar		words[16];					// ��׺����
	unsigned int	desc_text;					// ˵������
	int				id_addon_prop[16];			// �������Ե�ID
	int				fight_power;				// �ṩ��ս����
};

/////////////////////////////////////////////////////////////////////////////////////////////////
// �������Կ�
/////////////////////////////////////////////////////////////////////////////////////////////////
struct ADDON_STORAGE_CONFIG
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				num;						// �������԰�����
	struct  
	{
		unsigned int	id_package;				// �������԰�ID
		float			package_rate;			// �������԰�����
	}packages[48];
};

/////////////////////////////////////////////////////////////////////////////////////////////////
// װ���������������
/////////////////////////////////////////////////////////////////////////////////////////////////
struct EQUIPMENT_PROPERTY_RANDOM_CONFIG
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	float			quality_prob[10];			// 0-9��Ʒ�ʵĸ���
	int				id_quality_config[10];		// 0-9��Ʒ��ʱ��Ʒ�������
	float			hole_number_prob[5];		// ����0-4���׵ĸ���
	float			hole_type_prob[8];			// ����0-7�ſ׵ĸ���
	int				hp_point[6];				// ���������0-5
	float			hp_range_prob[5];			// ������1-5�θ���
	int				mp_point[6];				// ħ�������0-5
	float			mp_range_prob[5];			// ħ����1-5�θ���
	int				dmg_min_point[6];			// ��С�����������0-5
	float			dmg_min_range_prob[5];		// ��С��������1-5�θ���
	int				dmg_var_point[6];			// ���������������0-5
	float			dmg_var_range_prob[5];		// ������������1-5�θ���
	int				def_point[6];				// �����������0-5
	float			def_range_prob[5];			// ��������1-5�θ���
	int				hit_point[4];				// ���������0-4
	float			hit_range_prob[3];			// ���е�1-4�θ���
	int				jouk_point[4];				// ���������0-4
	float			jouk_range_prob[3];			// ������1-4�θ���
	int				dur_upper_limit_min;		// װ���;ö����޳�ʼֵ�������
	int				dur_upper_limit_max;		// װ���;ö����޳�ʼֵ�������
};

///////////////////////////////////////////////////////////////////////////////////////
// װ��Ʒ�������
///////////////////////////////////////////////////////////////////////////////////////
struct EQUIPMENT_QUALITY_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������

	int				identify_num_pack;		// ���������������
	int				identify_range_up;		// ����������ϸ�
	int				identify_range_down;	// ����������¸�
	int				main_range_up;			// ������η�Χ�ϸ�
	int				main_range_down;		// ������η�Χ�¸�
	float			main_range_prob;		// ������θ���
	int				high_range_up_max;		// �߲��������ϸ�����
	int				high_range_up_min;		// �߲��������ϸ�����
	float			high_range_prob;		// �߲�θ���
	int				low_range_down_max;		// �Ͳ��������¸�����
	int				low_range_down_min;		// �Ͳ��������¸�����
	float			low_range_prob;			// �Ͳ�θ���
	float			affix_prob[2][2];		// affix_prob[i][j]--iǰ׺j��׺�ĸ���
};

///////////////////////////////////////////////////////////////////////////////////////
// װ��ǿ��ת�ƻ��Ѷ����
///////////////////////////////////////////////////////////////////////////////////////
struct EQUIPMENT_ENHANCE_TRANSFORM_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������

	int				enhanced_level;			// ԭװ��ǿ���ȼ�

	struct
	{
		int			id_item;				// ������ƷID
		int			number;					// ������Ʒ����
	}consume[12][12];						// consume[i][j]--ԭװ����Ŀ��װ���ȼ���i��j
};

///////////////////////////////////////////////////////////////////////////////////////
// ���̽���Ʒ������ֵ�����
///////////////////////////////////////////////////////////////////////////////////////
struct TRADE_DISTANCE_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������

	int				empty;					// ����
};

///////////////////////////////////////////////////////////////////////////////////////
// ��������¼������
///////////////////////////////////////////////////////////////////////////////////////
struct TRADE_RANDOM_EVENT_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������

	namechar		positive_desc[256];		// �����¼�����
	namechar		negative_desc[256];		// �����¼�����
	int				appear_weight;			// �¼����ָ���Ȩ��
	int				positive_prob;			// �������
	int				id_port_service[6];		// �ܱ��¼�Ӱ��ĸۿ�ģ��ID1-6
	
	struct
	{
		int			category;				// �ܱ��¼�Ӱ��Ľ���Ʒ���
		int			price_change_num;		// ���ü۸�ƫ�Ƹ���
		int			affect_depth;			// Ӱ�����
	}affect[5];

	float			max_price_adjust;		// �۸�ָ��������������ֵ��
	float			min_price_adjust;		// �۸�ָ��������������ֵ��
	float			profit_limit_factor;	// �۸�䶯ǰ�����������Ӱ��ϵ��
};

/////////////////////////////////////////////////////////////////////////////////////////
// �籾����ģ��
/////////////////////////////////////////////////////////////////////////////////////////
struct INSTANCE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ���ƣ����15������

	int				show_type;					// �籾��ʾ���ͣ�0��������ս 1��˫����ս 2��������Դ 3��˫����Դ 4��Ԥ�� 5��Ԥ��
	int				win_type;					// �籾ʤ�����ͣ�0����ս 1����Դ
	int				signup_type;				// �籾�������ͣ�0������ 1������ 2������
	int				rand_side;					// �籾�Ƿ�����ֲ�
	int				hide_name;					// �籾�Ƿ�����
	int				inst_time;					// �籾����ʱ�����ޣ��룩
	int				inst_revive_time;			// �籾����ȴ�ʱ�䣨�룩
	int				midway_join;				// �籾���������ܷ���;����
	int				min_player_num;				// �籾��������
	int				zero_player_time;			// �籾������������ʱ����ʱ�䣨�룩
	int				prep_time;					// ս����ʼԤ��ʱ�䣨�룩
	unsigned int	id_ctrl_open;				// ս������ʱ�Զ�����������ID
	unsigned int	id_ctrl_begin;				// ս����ʼս��ʱ�Զ�����������ID
	unsigned int	id_ctrl_end;				// ս������ʱ�Զ�����������ID
	int				end_delay_time;				// ս�������ӳ٣��룩

	struct
	{
		int				max_player;				// �籾һ����������
		int				start_player_num;		// �籾һ��������������
		int				req_money;				// �籾һ��������Ҫ�Ľ�Ǯ��
		unsigned int	req_item;				// ս����һ��������Ҫ�ĵ���
		int				min_level_req;			// �籾һ��������͵ȼ�����
		int				max_level_req;			// �籾һ��������ߵȼ�����
		int				start_area_min[3];		// �籾һ����ʼǰ����λ����Сֵ
		int				start_area_max[3];		// �籾һ����ʼǰ����λ�����ֵ
		unsigned int	id_monster_enter;		// �籾һ�����������ID
		unsigned int	id_monster_revive;		// �籾һ����������ID
		unsigned int	id_key_npc;				// ��ս���͹ؼ�NPC��id
		int				win_res_point;			// ��Դ��籾ʤ������

		struct
		{
			unsigned int	id_res;				// ��Դ��籾��Դ������ID
			int				res_inc_speed;		// ��Դ�����ٶȣ���?��/10�룩
		} res_holds[16];

		int				dead_res_point_inc;		// ��Դ��ս����Ա��ɱ���Է�������Դ��
		int				dead_score_inc;			// ��Ա��ɱ���Է����ӱ��ַ�
		int				id_dead_droptable;		// ��Ա���������ID
		int				id_task_enter[3];		// ����ս���Զ��ӵ�����id

		struct
		{
			int			score;
			int			id_task;
		} task_win[4];							// ʤ�����ַּ�������

		int				id_task_deuce;			// ��һ��ƽ�ּ�������ID
		int				id_task_lose;			// ��һ��ʧ�ܼ�������ID
	} sides[2];		// 0: ��������1: ���ط�

	int				max_spectator_num;			// ����������ս������int����Ϊ0�����ɹ�ս��
	int				id_spectator_item;			// ��������ս��Ҫ���ߣ�all_type��
	int				no_spectator_min[3];		// ��������ս�Ƿ�λ����Сֵ
	int				no_spectator_max[3];		// ��������ս�Ƿ�λ�����ֵ
	unsigned int	id_monster_enter;			// �������������ID
	unsigned int	id_monster_revive;			// ������������ID

	struct
	{
		int			res;
		int			id_task;
	}task_res[5];								// ��Դ��������


};

/////////////////////////////////////////////////////////////////////////////////////////
// ����ID�����
/////////////////////////////////////////////////////////////////////////////////////////
struct SPECIAL_ID_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������
	
	int				world_chat_cost_money;		// ����Ƶ�����Ľ��
	int				world_chat_cool_down;		// ����Ƶ���󶨱ҷ�����ȴ��s��
	int				world_chat_cost_item;		// ����Ƶ��������ƷID
	int				broadcast_cost_item;		// �㲥Ƶ��������ƷID
	int				bind_cash_record_item_id;	// �һ���Ԫ����¼��ƷID
	unsigned int	second_prof_learn_level;	// ѧϰ�ڶ�ְҵ��Ҫ�ȼ�
	int				max_pack_size;				// ������������ֵ
	int				max_storage_size;			// �ֿ���������ֵ	
	unsigned int	no_power_skill_id;			// ���߼���ID
	int				no_power_skill_lvl;			// ���߼��ܵȼ�

	struct  
	{
		int state_id;							// ����״̬ID
		int key;								// ����QTE����
	}exhausted_qte[4];

	unsigned int	league_create_item_id;		// ��������ӵ����ƷID
	int				league_create_item_num;		// ��������ӵ����Ʒ����

	unsigned int   npc_monster_id_default;		// NPCĬ�ϱ������ID
	int				pet_pack_expand_item_id;	// �������������ID

	unsigned int	repu_conf_id;				// �������ñ�ID
	unsigned int	player_levelexp_conf_id;	// ����������߱�ID
	unsigned int	enemy_faction_conf_id;		// �ж���Ӫ��ID
	unsigned int	character_class_conf_id[9];	// ְҵ���Ա�ID, ��0Ӧ��������

	int				default_task_fix_conf_id;	// �����׼�ȼ�������ID
	int				pk_point_decrease;			// ÿ15���Ӽ���PKֵ
	int				cost_per_pk_point;			// ÿ��PKֵ���Ľ��

	int				friend_push_exp_award_factor;	// �̶��ȼ����ͺ��Ѿ��齱��ϵ��
	int				equip_convert_cost_item_id;		// װ���һ�������Ʒid
	int				prof_switch_cost_bind_money;	// �л�ְҵ���İ󶨱�����

	float			dash_speed;						// �������ٶ�
	float			jump_dash_speed;				// ������ǰ���ٶ�
	float			dash_stamina_cost_per_sec;		// ������ÿ����������
	float			jump_dash_stamina_cost_per_sec; // ������ǰ��ÿ����������

	struct _money_model_config
	{
		int		amont;								// Ǯ��
		int		drop_model;							// С��amont��Ǯ��ʹ�õĵ���ģ��
	};
	int				bind_money_icon_path;			// ��Ǯͼ��
	_money_model_config	bind_money_model_config[6];	// ��Ǯ����ģ������
	int				money_icon_path;				// �ǰ�Ǯͼ��
	_money_model_config	money_model_config[6];		// �ǰ�Ǯ����ģ������

	int				new_bee_protection_buff_pack[20];	// ����Ӧ�ȼ���������������ȼ����5*(i+1)��״̬�� (i = 0...19)

	float			relic_slot_factor[6];			// ������Ч��1-6���Ա��� //����
	float			exp_exchange_to_exp2_rate;		// ����ת��Ϊ�ڶ��������
};

/////////////////////////////////////////////////////////////////////////////////////////
// ����ս���ñ�
//////////////////////////////////////////////////////////
struct LEAGUE_WAR_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������
	
	int				base_create_league_repu_id;	// ����������ľ�������ID
	int				base_create_league_repu;	// ����������ľ���������ֵ
	int				base_create_ctrl_id;		// ������Ż��سɹ�����������
	int				base_dismiss_ctrl_id;		// ��ɢ���Ż��سɹ�����������

	int				declare_war_cost_league_repu_id;	// ����ս��ս���ľ�������ID
	int				declare_war_cost_league_repu;		// ����ս��ս���ľ�������ֵ
	int				enter_war_req_player_repu_id;		// ���Ż���ս����Ҫ���������ID
	int				enter_war_req_player_repu;			// ���Ż���ս����Ҫ�����������ֵ

	int				match_start_ctrl_id;		// ��λ����ʼʱ����������
	int				match_end_ctrl_id;			// ��λ������ʱ����������
	int				match_require_repu_type;	// ��λ������Ҫ�������������
												// 0-���� 1-�������� 2-���������� 3-���������� 4-����������
	int				match_require_repu_id;		// ��λ������Ҫ���������ID
	int				match_require_repu;			// ��λ������Ҫ�����������ֵ

	int				normal_enter_monster_id;	// ���Ż��ع�����ս����������ID
	int				normal_revive_monster_id;	// ���Ż��ع�����ս����������ID

	int				def_enter_monster_id;		// ���Ż����ط���������ID
	int				def_revive_monster_id[12];	// �ط���ͨ��������id

	int				atk_enter_monster_id;		// ���Ż��ع���ս����������ID
	int				atk_revive_monster_id[12];	// ������ͨ��������id

	int				revive_time;				// ս������ȴ�ʱ��

	int				base_war_start_ctrl_id;		// ���Ż���ս��ʼʱ����������
	int				base_war_finish_ctrl_id;	// ���Ż���ս����ʱ����������

	int				finish_war_monster_id;		// ս����������id
	int				war_result_stage_param_id;	// �ж�ʤ���ĳ�������id
	int				atk_score_stage_param_id;	// �����������ֳ�������id
	int				def_score_stage_param_id;	// �ط��������ֳ�������id

	struct
	{
		int			min_score;					// �ö�����������
		int			deliver_task;				// ��Ӧ���Ž�������
	} award_cfg[4];								// �����ֶ�����
};

/////////////////////////////////////////////////////////////////////////////////////////
// ������������
/////////////////////////////////////////////////////////////////////////////////////////
struct REST_EXP_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������

	int				player_level;			// ��ҵȼ�
	struct
	{
		float		max_combat_power;		// �õ����ս����
		float		min_exp_factor;			// ��ʹ��澭�鱶��
		float		max_exp_factor;			// ����ߴ��澭�鱶��
	}
	grade_config[32];						// ս�����ֵ����ã�1-32��
};

/*
	���ｻ��
*/

struct ITEM_TRADE_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������

	struct
	{
		namechar		page_title[8];			// ҳ�����֣����7������
		unsigned int	money_type;				// ��iҳ��Ʒ���׻������� , 0��ֻ�շǰ󶨽�ң�1�������ð󶨽�ң����������ð󶨽�ҡ�
		unsigned int	bBind;					// ��iҳ��Ʒ�Ƿ񻻵�����

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
			} repu_min[2];//�����ż�
			
			int money_required;//���������
		} goods[48];
	} pages[4];

	unsigned int	id_dialog;					// �Ի�ID
};

//�籾������
struct INSTANCE_TABLE_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������

	unsigned int instance[16];//�籾id
};

//Ӷ���������
struct PET_REVIVE_ESSENCE
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������

	int				item_quality;			// ��ƷƷ��
	namechar		simple_desc[16];		// ��Ʒ���

	int				file_matter;			// �����ģ��
	int				file_icon;				// ͼ������

	int				level_pet;				// ����Ӷ���ȼ�
	float			rate_hp;				// �����hp�ٷֱ�
	float			rate_mp;				// �����mp�ٷֱ�
	int				decrease_loyalty;		// ����۳��ҳ϶�
	int				increase_service_time;	// �������ӷ���ʱ��

	unsigned int    sell_for_bind_money;		// �Ƿ���Ϊ�󶨱�
    int				price;					// �����
	int				shop_price;				// ������
	unsigned int	music_pick;				// ��Ʒʰȡ��Ч
	unsigned int	music_drop;				// ��Ʒ������Ч

	// �ѵ���Ϣ
	int				pile_num_max;			// �ѵ�����
	// ����ʽ
	unsigned int	proc_type;
};

//����
struct FIRE_ESSENCE
{
	unsigned int	id;						// id
	namechar		name[32];				// ���ƣ����15������

	unsigned int	level;					// �ȼ�
	unsigned int	level_required;			// �ȼ�����

	int				file_matter;			// ģ��·��id
	int             file_gfx_not_active;	// δ����gfx·��
	int             file_gfx_activing;		// ���ڼ���gfx·��
	int             file_gfx_active;		// �Ѽ���gfx·��
	int             file_gfx_die;			// ����Ϩ��gfx·��

	int				cursor_type;			// �����������
	int             need_active;			// �Ƿ���Ҫ����     
	int             active_time;			// ��������ʱ�䣨�룩
	int				skill_id;				// ʩ�ż���id
	int				skill_level;			// ʩ�ż��ܵȼ�
	int				skill_target;			// ����Ŀ��ѡ��
	int				dur_time;				// ʩ�ų���ʱ�䣨�룩
	int				music_id;				// ʩ�Ű���Чid
	int				vocation_action_type;	// �ɼ�ʱ��������
	char			action[32];				// �ɼ�ʱ���ŵĶ�����
	namechar		progress_desc[16];		// ��������ʾ����
	namechar		type_showed[256];		// ������ʾ����
};

//ɱ������������
struct KM_PARAM_ADJUST_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ����

	struct
	{
		int			level_diff;				// Player�͹���ļ����(Player-����)(�������Ϊ0ʱ����ʾ����ʧЧ)
		float		adjust_exp;				// ��ɱ�ֻ�þ��������ϵ��(0.0~1.0)
		float		adjust_exp_subprof;		// ��ɱ�ֻ�ø�ְҵ���������ϵ��(0.0~1.0)
		float		adjust_money;			// ��ɱ�ֻ�ý�Ǯ������Ŀ������ϵ��(0.0~1.0)
		float		adjust_matter;			// ��ɱ�ֵ�����Ʒ�ĸ��ʵ�����(0.0~1.0)
		float		adjust_attack;			// �Թ������ĵȼ��ͷ�ϵ��(0.0~1.0)
		float		adjust_soul;			// �Ե���ĸ��ʵ�����(0.0~1.0)
	} level_diff_adjust[16];				// ������ɱ�ּ�������
};

//����ʱ���
struct TIME_GIFT_BAG_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ����

	unsigned int	require_gender;			// �Ա����ƣ�0-�У�1-Ů��2-��Ů����
	unsigned int	require_race;			// ��������
	unsigned int	character_combo_id;		// ְҵ����
	struct 
	{
		namechar  title[16];				//��i���������
		namechar  desc[256];				//��i���������
		unsigned int time;					//��i������ʱ��,��λ�룬��0ʱΪ������
		unsigned int count;					//��i����Ʒ����	1-6
		struct  
		{
			unsigned int id;				//��i��������Ʒj ID
			unsigned int bBind;				//��i��������Ʒj�Ƿ��
			unsigned int time;				//��i��������Ʒjʱ������,��λ��
		} item[6];							
	}gift[10] ;

};

//ǿ���任���� (װ��ǿ����ʱ��任��������)
struct EQUIPMENT_ENHANCE_MODEL_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ����

	struct		// �仯����
	{
		int  level; // �仯���ζ�Ӧ��ǿ���ȼ�
		int  file_image;//�仯����C��Ӧͼ��
		struct		//����
		{
			int id_race;  				// ���� id
			int file_model_male;		// ��ģ��·��
			int file_model_female;		// Ůģ��·��
			int file_model_male_l;  	// ��ģ������·��
			int file_model_female_l;  	// Ůģ������·��
		}race_data[3];
	}data[3];
};

//��������
struct IDENTIFY_SCROLL_ESSENCE
{
	unsigned int	id;				// id
	namechar		name[32];		// ����

	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	unsigned int	file_matter;	// �����ģ��
	unsigned int	file_icon;		// ͼ������
	unsigned int	quality;		// ���������װ��Ʒ��
	unsigned int	pos;			// ���������װ����λ
	int				max_level;      // �ɼ�����������
	int				min_level;      // �ɼ�����������
	unsigned int    sell_for_bind_money;// �Ƿ���Ϊ�󶨱�
	int				price;			// �����
	int				shop_price;		// ������

	unsigned int	music_pick;		// ��Ʒʰȡ��Ч
	unsigned int	music_drop;		// ��Ʒ������Ч
	int				pile_num_max;	// �ѵ�����
	unsigned int	proc_type;		// ����ʽ
};

//��ɫ���������
struct CHAR_CAMERA_CONFIG
{
    unsigned int	id;				// id
	namechar		name[32];		// ����

	unsigned int	race;			// ��Ӧ����
	unsigned int	gender;			// ��Ӧ�Ա�0-�У�1-Ů��2-��Ů����
	float			height_offset;	// ��������ĵ�ƫ�Ƹ߶�, ����������ĵ����ɫģ�����ĵ�ĸ߶�ƫ����
	float			dist_default;   // �����Ĭ�Ͼ���, ��ʼ����ͷ�������ĵ�ľ���
	float			angle_default;  // �����Ĭ�ϽǶ�, ��ʼ����ͷ�����ĵ�ĽǶ�
	float			dist_switch_camera; // ������л����ӽǷ�Χ, �ڸ÷�Χ�ڽ����ؽ�ɫģ��
	float			dist_min_front;  //��������������������, ��������������ͷ����С����
};

//����
struct DYNAMIC_INSTANCE_CONFIG
{ 
	unsigned int	id;						// id
	namechar		name[32];				// ����

	int				type;					// ��������  0:���˸���  1:��Ӹ��� 2:���帱�� 3:���츱��
	int				difficulty;				// �Ѷ�      0:Ĭ��      1:��ͨ     2:Ӣ��     3:ʷʫ      4:����
	int				level_mode;				// ����Ӧ�ȼ����� 0:��ͨ 1:����ƽ���ȼ�
	int				id_instance;			// ������Ӧ�ĵ�ͼ���

	unsigned int	level;					// �����ı�׼�ȼ�
	unsigned int	auto_modify_level;		// �����Ƿ��Զ������ȼ�
	unsigned int	monster_max_auto_level;	// ������������Ӧ�ȼ�����
	unsigned int	can_ride;				// �������Ƿ�������
	unsigned int	can_fly;				// �������Ƿ���Է���
	unsigned int	is_only_show_when_conditions_met;	// ������������ʱ��ʾ
	int				resurrect_wait_seconds; // ��������ȴ�ʱ�䣨�룩
	int				start_battle_wait_seconds; //����������ս����ʼ�ĵȴ�ʱ�䣨�룩
	unsigned int	force_dead_leave_inst;  // �����������Ƿ�ǿ���뿪����
	int				last_seconds;			// �����ر�����_����ʱ�䵽ʱ���룩
	unsigned int	win_kill_monster_id;    // ����ʤ������_������ʤ����Ҫ��ɱ�Ĺؼ�����ID
	unsigned int	lose_kill_monster_id;   // ����ʧ������_������ʧ�ܱ���ɱ�Ĺؼ�����ID
	int				create_set_team_repu_id;// ���������ɹ������Ŷ�����ID
	int				create_set_team_repu_value;// ���������ɹ������Ŷ�������ֵ
	int				create_control_id;		// ���������ɹ�ʱ�Զ�����������ID
	int				start_battle_control_id;// ����ս����ʼʱ�Զ�����������ID
	int				close_control_id;		// �����ر�ʱ�Զ�����������ID
	unsigned int    born_place_monster_id;	// �������������ID
	unsigned int    resurrent_place_monster_id;// ������������ID
	unsigned int	commander_monster_id;   // ����commander���Թ���ID
	unsigned int	auto_task[4];			// ���븱���Զ��ӵ�������
	unsigned int	task_on_first_enter;	// �״ν��븱����������ID
	float			monster_exp_offset_rate;	// ���ﾭ�鱶�ʸ��� >=-1 exp * (1 + rate)

	unsigned int	delever_task_on_win;	// ������ʤ������ķ�������
	unsigned int	delever_task_on_defeat; // ������ʧ�ܼ���ķ�������
	unsigned int	count_down_on_finish;	// ����ʤ����ʧ�ܺ󵹼�ʱ�ر�

	unsigned int	dungeon_type;			// ��������ģʽ��0 �ϸ�ģʽ 1 ����ģʽ
	int				min_team_nums;			// ������������
	int				max_team_nums;			// ������������
	int				min_team_members;		// ������������
	int				max_team_members;		// ������������
	unsigned int	is_all_team_members_same_league; // �����Ƿ�����ͬһ����

	unsigned int	daily_limit;			// ÿ���޴�
	WEEKDAY_TIME	daily_limit_reset_time;	// ÿ���޴�����ʱ��
	unsigned int	weekly_limit;			// ÿ���޴�
	WEEKDAY_TIME	weekly_limit_reset_time;// ÿ���޴�����ʱ��

	struct
	{
		WEEKDAY_TIME	start;				// ����ʱ��
		WEEKDAY_TIME	end;				// ����ʱ��
	}
	open_time[4];							// ����ÿ�տ���ʱ���

	int				min_player_level;		// ���˵ȼ�����
	int				max_player_level;		// ���˵ȼ�����

	int				premise_active_task;	// ǰ���������

	struct
	{
		int			id;						// ǰ����Ʒid
		int			count;					// ǰ����Ʒ����
		int			cost;					// ǰ����Ʒ����
	}
	premise_item[2];						// ǰ����Ʒ

	struct
	{
		int			id;						// ǰ������id
		int			min;					// ǰ����������
		int			max;					// ǰ����������
		int			cost;					// ǰ����������
	}
	premise_repu[2],						// ǰ������
	premise_raid_repu[2];					// ǰ���Ŷ�����

	int				premise_buff[2];		// ǰ��buff
	int				mutex_buff[2];			// ����buff	

	unsigned int	is_raid_dungeon;		// �Ƿ�֧���Ŷ�ģʽ
	int				min_level_in_raid;		// ��ӵĵȼ���������
	int				max_level_in_raid;		// ��ӵĵȼ���������
	int				min_players_in_raid;	// ��ӵ���������
	int				max_players_in_raid;	// ��ӵ���������
	int				min_level_in_raid_team;	// С�ӵĵȼ���������
	int				max_level_in_raid_team;	// С�ӵĵȼ���������
	int				min_players_in_raid_team;	// С�ӵ���������
	int				max_players_in_raid_team;	// С�ӵ���������
};

// ������������
struct PASSIVE_SKILL_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ����
	
	int				skill_id;				// ��������ID
	int				addon_package[32];		// ���ܵȼ�1~32ʱ�ĸ������԰�
};

// ���ȼ�������������
struct DROP_BY_LEVEL_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ����
	
	int				drop_table_id[200];		//1-200����Ӧ�����id
};

// ����Ӧ�ȼ�Ȩ�����ñ�
struct LEVEL_ADAPT_WEIGHT_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ����

	int				weight[200];			//1-200����ӦȨ��
};

// �������ȡ��������
struct STORAGE_TASK_MAX_COUNT_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ����
	
	int				max_storage_task[200];	//1-200����������ȡ����
};

// �ػ�������
struct GUARDIAN_STAR_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ����

	int				enable_player_level;	// �����ػ�������ȼ�
	int				star_max_level;			// �ػ��ǵȼ�����

	struct
	{
		int			level_up;				// ����һ�������ػ�ֵ
		int			addon_package[4];		// �������԰�ID
	}star_conf[100];						// �ػ������ã�����0��ʾ�ػ��ǵȼ�1��

	int				max_guard_point_per_absorb[150];	// ��ҵȼ�1~150��ÿ���ػ�ʯ��������ػ�ֵ
};

//��̬�����
struct DYNAMIC_MONSTER_PACK_ESSENCE
{
	unsigned int	id;						// id
	namechar		name[32];				// ����

	unsigned int	monster_group_type;		//�������Ԫ�����
	unsigned int	strict_monster_level;	//����ȼ��Ƿ��ϸ�ƥ��
	struct 
	{
		unsigned int	monster_id;		// ����ID
		int				instance_level; // �����Ӧ�����ȼ�
	}monster[16];
};

// ��������ñ�
struct PLAYER_SUB_PROF_LEVEL_EXP_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	unsigned int	id_sub_prof;				// �����ID
	namechar		simple_desc[16];			// ��������
 	unsigned int	file_icon;					// ͼ��·��
	int				max_level;					// ��ǰ���ŵȼ�����

	unsigned int	vocation_type;				// ��ְҵ��������
	int				level_req;					// ��ѧϰ�ü��ܵ�����ȼ�

	double			level_up_exp_need[30];		// ������N�����辭��

	int				learn_recipe[30][6];		// ������1-30���Զ�ѧ����䷽
};

//���ﵰ
struct PET_EGG_ESSENCE
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct
	{
		int			pet_config_id;				// �����ó���ģ��ID
		float		prob;						// ����
	}
	random_config[6];							// �����ó�������1-6

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

//����״̬��
struct SPECIAL_STATUS_PACKAGE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	namechar		desc[16];					// ����˵��
	int				max;						// ����
	int				id_package[10];				// ״̬��id
};

//״̬����ʽ
struct STATUS_PACKAGE_EXPRESSIONS_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int  id_skill_require;						// ��ʽ��Ч������ID
	int  id_skill_result;						// ��ʽ�����������ID
	int  id_package[10];						// ��ʽ�������״̬��idN
};

//��������ȴ�
struct RESURRECT_TIME_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int  resurrect_wait_time[15];				// ��N�������ȴ�ʱ��(��)
	int  dead_count_reduce_time;				// ��������˥�����ʱ��(��)
};

//���
struct GIFT_BAG_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	namechar		desc[256];					// �������
	int				gift_num;					// ������Ʒ����
	struct										// ������ƷN
	{
		unsigned int	id;						// ������ƷN
		int				num;					// ������ƷN����
		unsigned int	bind;					// ������ƷN�Ƿ��
		int				time_limit;				// ������ƷNʱ������
	}gift[6];
};


// �䷽�ϳɷ���
struct NPC_RECIPE_ESSENCE
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	unsigned int	recipes[64];				// �䷽
};

// ����ģ��
struct REPUTATION_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct  
	{
		struct  
		{
			namechar		sec_name[16];		// ��������
			int				sec_min;			// ��������
			int				sec_max;			// ��������
		}secs[5];								// ÿ��5������
	}classes[10];								// 10���ֶ�

	struct  
	{
		namechar			repu_name[16];		// ��������
		unsigned int		repu_info;			// ������������
		int					repu_init;			// ������ʼֵ
		int					repu_min;			// ������ֵ����
		int					repu_max;			// ������ֵ����
		int					repu_show_num;		// ���������ʾ����ֵ
		unsigned int		repu_pic;			// ����ͼƬ
		unsigned int		repu_icon;			// ����ͼ��
		int					repu_class;			// ������Ӧ�ֶ�1-5��0��ʾû�зֶ�
	}reputations[110];
};

// ����ȼ�������
struct TASK_FIX_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	float			task_factor[200];			// ������1-200��ʱ����ϵ��
	float			task_exp2_factor[200];		// ����ڶ�����1-200��ʱ����ϵ��
	float			task_money_factor[200];		// ������1-200��ʱ����ϵ��
	float			task_bind_money_factor[200];// ����󶨽��1-200��ʱ����ϵ��
};

// �����
struct BODY_TRANSFORM_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����
	
	int				transform_type;				// ��������,0:Ϊ�򵥱���1:Ϊ��ȫ����
	namechar		transform_name[16];			// ���������

	unsigned int	whole_trans_model;			// ��ȫ����ģ��

	// �򵥱���
	int				shape_id;					// ����ID
	int				face_id;					// ����ID
	int				hair_id;					// ����ID
	unsigned int	hair_color;					// ��ɫ
	int				skin_color_id;				// ��ɫID
	int				saint_cloth_id;				// �滻ʥ��ID
	unsigned int	helm_id;					// ͷ��ID
	unsigned int	breast_id;					// �ؼ�ID
	unsigned int	leg_id;						// �ȼ�ID
	unsigned int	hand_id;					// ����ID
	unsigned int	weapon_id;					// ����ID
	unsigned int	assist_id;					// ����ID
	unsigned int	mask_id;					// ���ID
	unsigned int	wing_id;					// ���ID

	int				forbid_prof_skill;			// �Ƿ����ְҵ����
	int				is_unsummon_pet;			// �����Ƿ���ճ���
	unsigned int	is_hide_fight_power_wing;	// �Ƿ�����ս�������

	struct
	{
		int			id;
		int			level;
	} addon_skills[6];							// ���Ӽ���.0-3���������ܣ�4,5����������

	unsigned int	is_replace_shortcut_bar;	// �Ƿ��滻��һ�����
	unsigned int	is_disable_jump;			// �Ƿ��ֹ��Ծ
	unsigned int	is_disable_dash;			// �Ƿ��ֹ������
	unsigned int	is_disable_cosmos_burst;	// �Ƿ��ֹС���汬��
	unsigned int	is_disable_mounting;		// �Ƿ��ֹ���
	unsigned int	is_disable_fly;				// �Ƿ��ֹ����
	unsigned int	is_disable_booth;			// �Ƿ��ֹ��̯
	unsigned int	is_disable_name_info;		// �Ƿ�����ͷ����Ϣ
};

//��׼�������ñ�
struct COMMON_MONSTER_CONFIG
{
	unsigned int	id;						// id
	namechar		name[32];				// ����
	
	int				monster_id[200];		// �ȼ�1~200��Ӧ�Ĺ���ID;
};

// �����
struct MONSTER_NPC_PACK_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����
	
	float			active_rate;				// ��������
	
	struct  
	{
		unsigned int	id;						// �������NPCID
		float			rate;					// ���ָ���
	}monster_npcs[8];
};

///////////////////////////////////////////////////////////////////////////////////////
//
// ����������
//
///////////////////////////////////////////////////////////////////////////////////////

struct TEXT_PACK_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				radius;						// �����뾶
	float			active_rate;				// ��������

	struct  
	{
		unsigned int	text_id;				// ����ID
		float			rate;					// ���ָ���
	}texts[16];
};


// �ǻ������ñ�
struct STAR_SOUL_CHAIN_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����
	struct 
	{
		int player_lv[10];							// 1~10 ����Ҫ������ȼ�
		int cosmos_lv[10];							// 1~10 ����Ҫ��С����ȼ�
	}star_chain[5];								// �ǻ���1~5
};

// �ǻ�ʯ
struct STAR_SOUL_STONE_ESSENCE
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int item_quality;							// ��ƷƷ��
	int	drop_model;								// �򻯵���ģ��
	int type;									// ���
	int init_bright;							// ����ȳ�ʼֵ
	int max_bright;								// ���������
	int lv;										// �ǻ�ʯ�ȼ�
	unsigned int equip_slot_mask;				// ����Ƕ��λ��
	int install_bind_gold;						// ��Ƕ���İ󶨱�
	int install_gold;							// ��Ƕ���Ľ��
	int file_icon[51];							// Ʒ��0~50��Ӧ��ͼ��
	int upgrade_bright[50];						// Ʒ��1~50��Ҫ�Ĺ����
	int addon_package[51];						// Ʒ��0~50��Ӧ�������԰�id

	// ��Ʒ���ͨ������
	ITEM_DECOMPOSE decompose;
	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// �ǻ����������
struct STAR_SOUL_CHAIN_COMBO_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int stone_type[4];							// �ǻ�ʯ����1~4
	int	min_lv;									// �����ǻ�ʯ��͵ȼ�
	struct 
	{
		int bright_req;								// �����������
		unsigned int chain_ext_pack_id[5];			// ��϶��ǻ���1~5�����ĸ������԰�ID
	}combo[100];									// ���1~100
};

// �ǻ�ʯ��������
struct STAR_SOUL_STONE_UPGRADE_ITEM_ESSENCE
{
	unsigned int	id;							// id
	namechar		name[32];					// ����
	
	int				item_quality;				// ��ƷƷ��
	namechar		simple_desc[16];			// ��Ʒ���

	int				drop_model;					// �򻯵���ģ��
	int				file_icon;					// ͼ������
	int				max_bright_limit;			// ��ǿ���������
	struct  
	{
		int value;								// ��������Ƚ��
		float probability;						// ����
	}bright_add[2];								// ���������A��B
	
	// ��Ʒ���ͨ������
	ITEM_DECOMPOSE decompose;
	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// ռ�ǵ���
struct ASTROLOGY_ITEM_ESSENCE
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				enable_astrology_button;	// ����ռ�ǰ�ť

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// �ǻ�
struct STAR_SOUL_ESSENCE
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				gfx_path;					// ��Ч����

	int				color;						// �ǻ���ɫ
	unsigned int	conflict_id;				// ��ͻID
	unsigned int	is_mergeable;				// �ɷ�����

	float			exp_factor;					// ����Ʒ��ϵ��
	int				exp_base;					// 1�����徭��
	int				level_up_exp[19];			// 1-19���������辭��
	unsigned int	addon_pack[20];				// �ȼ�1-20�������԰�id
	unsigned int	burst_addon_pack[20];		// �ȼ�1-20�����������԰�id
	int				burst_level;				// �����ȼ�
	unsigned int	burst_buff_pack[20];		// �ȼ�1-20����״̬��id
	unsigned int	fight_power[20];			// �ȼ�1-20ս����

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// ǿ���������޵���
struct EXTEND_ENHANCE_LIMIT_ITEM_ESSENCE
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	unsigned int	equip_mask;					// װ����λ
	int				priority;					// �������ȼ�
	int				accept_equip_level_min;		// ����װ���ȼ�����
	int				accept_equip_level_max;		// ����װ���ȼ�����
	int				accept_enhance_level_min;	// ����ǿ���ȼ�����
	int				accept_enhance_level_max;	// ����ǿ���ȼ�����
	int				use_count_max;				// ÿ��ʹ��������

	struct
	{
		float		min;						// ����
		float		max;						// ����
	}
	increasement[10][5];						// ��1-10������1-5��ǿ�����ްٷֱ�

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// ������������
struct CLOTH_UPGRADE_ITEM_ESSENCE
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	unsigned int	cloth_upgrade_category_mask;// ʥ��ǿ������ mask �μ�CLOTH_CONFIG::UpgradeCategory

	int				need_grade_min;				// ���������ȼ�����
	int				need_grade_max;				// ���������ȼ�����

	int				increase_blesssing;			// ����ף��ֵ
	float			increase_success_prob;		// �����ɹ���

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// �ػ�ʯ
struct GUARDIAN_STONE_ESSENCE
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				item_quality;				// ��ƷƷ��
	int				drop_model;					// �򻯵���ģ��
	int				file_icon;					// ͼ������
	
	int				star_level_max;				// �������յ��ػ��ǵȼ�����
	int				star_level_min;				// �������յ��ػ��ǵȼ�����
	int				guard_point;				// �ػ�ֵ

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// ��ֵ��������
struct VALUE_INCREASE_ESSENCE
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				player_level_min;			// ʹ�ü�������
	int				player_level_max;			// ʹ�ü�������

	int				type;						// ��ֵ��������
												// 0=���� [����1Ϊ����ID]
												// 1=�������ܾ��� [����1Ϊ��������ID]
												// 2=��������ֵ
												// 3=cube����
												// 4=�����ԡ�ٹⵥλʱ�䴢�澭�����
												// 5=���������������ã�
	int				params[2];					// ����1-2

	int				value_min;					// ���ӵ���ֵ����
	int				value_max;					// ���ӵ���ֵ����

	int				max_increase_to;			// ���������ӵ�����ֵ

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// ս������
struct COMBAT_PET_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				model_path[4];				// ģ��·��		0: ����, 1: ͷ, 2:ͷ��, 3:����
	int				gender;						// �Ա�			0: ��, 1:Ů
	unsigned int	skin_default_color;			// Ƥ��Ĭ����ɫ
	unsigned int	hair_default_color;			// ͷ��Ĭ����ɫ

	int				init_aptitude;				// ��ʼ����
	int				max_aptitude;				// �������

	int				player_level_req;			// ����ȼ�Ҫ��
	int				max_level;					// ����ȼ�����

	struct
	{
		float		prob;						// ���ڴ�����ĸ���
		float		min_factor;					// ������С�ٷֱ�
		float		max_factor;					// �������ٷֱ�
	}
	aptitude_sections[10];						// ��������1-10

	int				refresh_aptitude_cost_item;	// ˢ��������Ҫ����id
	int				refresh_aptitude_cost_money;// ˢ��������Ҫ���

	int				default_attack_skill;		// Ĭ�Ϲ�������id
	int				init_skill_slots;			// ��ʼ���ܸ�����
	int				max_skill_slots;			// ����ܸ�����
	int				skill_slot_active_item[4];	// ���似�ܸ�1-4����

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// ս�����＼����
struct COMBAT_PET_SKILL_BOOK_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				skill_id;					// ����id
	int				skill_level;				// ���ܵȼ�
	int				skill_slot;					// ���ܸ�λ��Ҫ��

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// ս������װ��
struct COMBAT_PET_EQUIPMENT_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				model_path[2];				// ��/Ůģ��·��
	int				type;						// װ����λ		0: ͷ, 1:ͷ��, 2:����
	int				gender;						// �Ա�			0: ��, 1:Ů, 2:��Ů�Կ�
	unsigned int	color;						// ��ɫ
	int				level_req;					// �ȼ�����
	int				attack;						// ����
	int				element_attack;				// ���Թ���
	int				hit;						// ����
	int				critical;					// ����
	int				aptitude;					// ����
	int				fight_power;				// ս��
	int				addon_pack_for_player[4];	// �����������԰�1-4

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// �ǻ��
struct STAR_SOUL_BOX_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				star_soul_id;				// ����ǻ�ID
	int				star_soul_exp;				// ����ǻ��ʼ����

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// װ����۱������
struct EQUIPMENT_APPEARANCE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// ���ݵ���
struct PLAYER_APPEARANCE_ESSENCE
{
	enum
	{
		BODY		= 0x1,		// ����
		SKIN_COLOR	= 0x2,		// ��ɫ
		EYE			= 0x4,		// ͫ��
		EYE_COLOR	= 0x8,		// ͫɫ	
		HAIR_COLOR	= 0x10,		// ��ɫ
		FACE		= 0x20,		// ����
		HAIR		= 0x40,		// ����
	};

	unsigned int	id;							// ID
	namechar		name[32];					// ����

	unsigned int	type_mask;					// �������͡��μ������enum

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// ����ƿ 
struct DRIFT_BOTTLE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// ���Ƶ��� 
struct DIVINING_ITEM_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				type;						// ռ�����ͣ�1���� 2���� 3���� 4ս��

	ITEM_DECOMPOSE	decompose;					// ���ͨ������
	ITEM_COMMON_PROP item_common;				// ��Ʒͨ������
};

// ���;���
struct TRANSMITROLL_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				type;						// ���ͣ�0�ټ���Ա 1���͵�����λ�� 2ָ������
	int				level_req;					// ʹ�õȼ�
	int				cool_time;					// ��ȴʱ�䣨�룩
	int				map_id;						// Ŀ���ͼ��
	float			pos[3];						// Ŀ�������

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// ��������
struct EMOTION_ICON_PACK_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				emotion_id;					// ����ID
	int				active_time;				// ����ʱ��(��)

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// ���׷�ٵ���
struct REVENGE_ITEM_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// װ��Ⱦɫ��
struct EQUIPMENT_DYE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	unsigned int	color;						// ��ɫ

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// ����
struct RELIC_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				relic_config;				// �������ñ�ID
	int				level_req;					// ��װ���ȼ�
	int				skill_id;					// ��������ID

	int				unique_props[5];			// Ψһ������Ŀ1-5
	struct  
	{
		int			props[5];					// ������Ŀ1-5
	}
	states[5];									// ����1-5

	int				remove_buff_on_unequip[5];	// ȡ��ʱ��ɢbuff

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// ���֤��
struct MARRIAGE_CERTIFICATE_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};

// ��걦ʯ 
struct SOUL_ARMOR_GEM_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				type;						// ��걦ʯ����
	int				init_gem_exp;				// ��ʼ����
	unsigned int	can_level_up;				// �Ƿ������
	
	unsigned int	addon_pack[65];				// �ȼ�0-64�������԰�
	int				level_need_gem_exp[64];		// �ȼ�1-64��Ҫ����ֵ

	struct  
	{
		int			cost_item;					// ���Ӿ���������ĵ���ID
		int			cost_item_count;			// ���Ӿ���������ĵ�������
		int			add_gem_exp;				// ���Ӿ���
		int			cost_extra_item;			// ���Ӿ����ѡ���ĵ���ID
		int			cost_extra_item_count;		// ���Ӿ����ѡ���ĵ�������
		int			extra_gem_exp;				// ʹ�ÿ�ѡ���ĵ��߶������Ӿ���
	}
	add_gem_exp_config[64];						// �ȼ�0-63ʱ���Ӿ�������

	struct
	{
		int			gfx_path;					// ��Ч·��
		int			need_total_gem_level;		// ��Ч��Ҫ��ʯ�ܵȼ�
	}
	gfx_config[20];								// ��Ч1-20����

	int				decompose_item;				// ��ֳ�����ƷID
	float			min_decompose_item_count_gem_exp_factor;	// �ۻ�����������Ʒ��������ϵ��
	float			max_decompose_item_count_gem_exp_factor;	// �ۻ�����������Ʒ��������ϵ��

	// ��Ʒ��׼��׺����Ǯ�Ͷѵ�
	ITEM_COMMON_PROP item_common;
};


//ϴ���ܵ���
struct SKILL_CLEANER_ESSENCE
{
	unsigned int	id;							// ID
	namechar		name[32];					// ����

	int				level_req;					// ʹ�õȼ�

	ITEM_COMMON_PROP item_common;
};

// �������ܰ�
struct COMBO_PACK_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct
	{
		int id[2];								// ����ID
		float prob;								// ���ܸ���
		int keys[4];							// ���ܰ���1~4
	}skill[8];									// �������� 1~8
};


// �����
struct MINE_PACK_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	float			active_rate;				// ��������
	struct  
	{
		unsigned int	id;						// ����ID
		float			rate;					// ���ָ���
	}mines[8];
};

// �ٻ�����NPC��
struct SUMMON_MONSTER_NPC_PACK_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	unsigned int    monster_npc_pack_id;		// ����NPC��ID
	int				num;						// �ٻ�����
	int				level_mode;					// ����Ӧ�ȼ����� 0:��ͨ 1:����ƽ���ȼ�			
	int				replace_nearby_npc_at_client;	// �νӵĸ���NPC
	int				exist_time;					// ����ʱ�䣨�룩
	float			summon_range;				// �ٻ���Χ���ף�
	int				summon_range_type;			// �ٻ���Χ���� 0:��Χ����� 1:��Χ�ڴ��ǶȾ��ȷֲ�
	int				summon_range_angle;			// �ٻ���Χ�Ƕ�
	int				follow_on_summon;			// �ٻ����Ƿ��Զ������������
	int				unsummon_on_logout;			// �Ƿ��汾����ʧ
	int				follow_attack;				// �Ƿ���汾�幥��
	int				exclusive_mode;				// ר��ģʽ��0 ��ר��, 1 ����ר��, 2���ר��, 3����ר��
	unsigned int	is_exclusively_visible;		// �Ƿ��ר���߿ɼ�
	unsigned int	is_show_master_name;		// �Ƿ���ʾר��������
	unsigned int	link_aggro_to_master;		// ����Ƿ�ת�Ƹ�����
	unsigned int	link_kill_to_master;		// ��ɱ�����Ƿ��������
	unsigned int	link_pk_mode_to_master;		// PKģʽ�Ƿ�������
	unsigned int	link_combo_to_master;		// �����Ƿ�����������

	struct  
	{
		int id;									// ����ID
		int level;								// ���ܵȼ�
	} master_cast_skill_on_summon;				// �ٻ�ʹ���˶���ʹ�ü���
	unsigned int	is_summon_to_specific_pos;	// �Ƿ�ָ�������ٻ�
	unsigned int	is_summon_at_specific_y;	// �Ƿ�ָ���߶��ٻ�(����is_summon_to_specific_posʱ��Ч)

	int				summon_category;			// �������ͣ��μ�SUMMON_CATEGORY_CONFIG
	int				summon_direction_type;		// ���ٻ��ֳ����Ƕ����� 0: ���, 1: �����˵����߳ɹ̶��Ƕ�, 2: �����˵�����ɹ̶��Ƕ�
	int				summon_angle;				// ���ٻ��ֳ�������Ƕ�

	unsigned int	is_show_extra_ui;			// �Ƿ���ʾ�ٻ����ӽ���
	int				extra_ui_skill_id;			// ������渽������id
	int				extra_ui_icon;				// �ٻ����ӽ���ͷ��ͼ��
	unsigned int	is_icon_affects_policy;		// ͷ���Ƿ����Ӱ��������

	unsigned int	summon_prop_inherit_mask;	// �̳��������� MASK
												// 0-����
												// 1-����
												// 2-����һ����
												// 3-ֱ����
												// 4-��С������
												// 5-��󹥻���
												// 6-������
												// 7-�������ֵ
												// 8-�˺�����(%)
												// 9-�˺�����(%)
												// 10-�����˺�����(%)
												// 11-�����˺�����(%)
												// 12-������(%)
												// 13-�����ʼ���(%)
												// 14-���������˺�
												// 15-���������˺�����
												// 16-������Ч��
												// 17-�����Թ�����
												// 18-ˮ���Թ�����
												// 19-�����Թ�����
												// 20-�����Թ�����
												// 21-�����Կ�
												// 22-ˮ���Կ�
												// 23-�����Կ�
												// 24-�����Կ�
												// 25-�����Կ��Լ���
												// 26-ˮ���Կ��Լ���
												// 27-�����Կ��Լ���
												// 28-�����Կ��Լ���
												// 29-��������
};

// �ٻ������
struct SUMMON_MINE_PACK_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����
	
	unsigned int    mine_pack_id;				// �����ID
	int				num;						// ��������
	int				exist_time;					// ����ʱ�䣨�룩
	float			summon_range;				// �ٻ���Χ���ף�
	int				unsummon_on_logout;			// �Ƿ��汾����ʧ
};

// �ٻ������������ñ�
struct SUMMON_CATEGORY_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����
	
	int				max_count[32];				// ��������i������ٻ�����
};

// ���ͼ��������
struct WORLD_TELEPORT_POINT_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				mapid;						// Ŀ�ĵص�ͼ��
	float			pos[3];						// Ŀ�ĵ�����
	int				gold;						// �����������
	int				prem_task_show;				// ��ʾ������ɵ�ǰ������
	int				prem_task;					// ����������ɵ�ǰ������
};

// ǿ��ת�����ñ�
struct ENHANCE_TRANSFER_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct 
	{
		int		gold;				// ��Ǯ����
		struct 
		{
			int id;					// ��Ʒid
			int num;				// ��Ʒ��������
		}
		item_opt,					// ��ѡ��Ʒ
		item_need;					// ��ѡ��Ʒ
		float   no_item_opt_prob;	// �޿�ѡ��Ʒʱ�ĳɹ���
		int     fail_lv_lose;		// ʧ��ʱ����ǿ���ȼ�
	}diff_equiplv_lv[15];			// ���ǿ��ת��
};

// ǿ���ƶ�����
struct ENFORCED_MOVE_CONFIG
{
	enum Action
	{
		ACTION_START,			// �����ƶ�������ʼ
		ACTION_LOOP,			// �����ƶ�����ѭ��
		ACTION_END,				// �����ƶ���������
		ACTION_ACCELERATE,		// �����ƶ���������
		ACTION_FLY,				// �����ƶ���������
		ACTION_GLIDE,			// �����ƶ���������

		ACTION_NUM,
	};

	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct check_point
	{
		int			path_id;					// Ŀ���·��ID
		int			camera_contorl_id;			// ��ͷ����ID
		int			type;						// �ƶ�����: 0=���棬1=����
		unsigned int stay_time_on_end;			// �յ�ͣ��ʱ��
		int			get_buff_on_start;			// ��Ŀ����ƶ�������BUFF ID
		int			remove_buff_on_end;			// Ŀ����ƶ�������ɢBUFF ID
		namechar	actions[ACTION_NUM][16];	// Ŀ�����ض������μ�ENFORCED_MOVE_CONFIG::Action
		int			mapid;						// Ŀ������ڵ�ͼID
		int			qte_id;						// Ŀ���QTEģ��ID
		namechar	action_failed[16];			// Ŀ���QTEʧ�ܲ��Ŷ���
	}
	check_points[5];

	int				back_to_mapid_on_failed;	// QTEʧ�ܷ��صص��ͼID
	float			back_to_pos_on_failed[3];	// QTEʧ�ܷ��صص�����x y z

	int				get_buff_on_finished;		// ǿ���ƶ���������buff
	int				to_mapid_on_offline;		// ���ߺ󵽴�ص��ͼID
	float			to_pos_on_offline[3];		// ���ߺ󵽴�ص�����x y z
};

// ��������
struct STAR_BOARD_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct  
	{
		int			enable_star_id[32];			// �����ǳ�id
		int			cosmos_grade_icon;			// С���澳��ͼ��
		namechar	cosmos_grade_name[16];		// С���澳������
		int			cosmos_grade_desc;			// С���澳������
		unsigned int addon_pack;				// С���澳�總�����԰�
		int			fight_power;				// ս����
	}
	configs[10];								// ���̵ȼ�1-10����
};

// �ǳ�����
struct STAR_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	namechar		desc[16];					// �ǳ�����
	int				icon_path;					// ��Ч����
	int				accept_color;				// �ɲ�����ǳ���ɫ

	int				need_player_level;			// ��������ȼ�
	int				need_realize_point;			// �����������
	int				need_item;					// �����������id

	unsigned int	addon_pack;					// �������԰�id
	int				fight_power;				// ����ս����
};

// ռ������
struct ASTROLOGY_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct
	{
		int			cost_realize_point;			// ���ĸ���
		float		prob;
		int			drop_table;					// �����
		float		prob_enable_next_button;	// ������һ����ť����
	}
	buttons[5];
};

// ������ս����
struct SOLO_CHALLENGE_DUNGEON_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				map;						// ��ս�������ڳ���ID
	struct  
	{
		int			need_fight_power;				// ս��������
		float		pos[3];							// ����ʱ����λ��x,y,z
		int			enable_controller_on_start;		// ����ʱ����Ŀ�����
		int			time_limit;						// ����ʱ��
		int			success_condition;				// ʤ������ 0��û��֣�1��ɱ����
		int			success_need_score;				// ʤ���������ս����
		int			success_need_kill_monster;		// ʤ�������ɱ����ID
		int			enable_controller_on_success;	// ʤ��ʱ����Ŀ�����
		int			disable_controller_on_success;	// ʤ��ʱ�رյĿ�����
		int			enable_controller_on_failed;	// ʧ��ʱ����Ŀ�����
		int			disable_controller_on_failed;	// ʧ��ʱ�رյĿ�����
	}
	level_configs[250];								// 1-250�������

	float			pause_zone_pos[3];				// ��ͣ��ʱ��������x,y,z
	int				success_count_down;				// ��ʤ����ĵ���ʱ
	int				failed_count_down;				// ��ʧ�ܺ�ĵ���ʱ
	int				level_award_task;				// �㽱������ID
	int				week_award_task;				// �ܽ�������ID
};

// ʥ������
struct CLOTH_CONFIG
{
	enum Category
	{
		BRONZE_CLOTH,		// ��ͭ
		SILVER_CLOTH,		// ����
		GOLD_CLOTH,			// �ƽ�
		GOD_CLOTH,			// ��ʥ��
		SURPLICE,			// ڤ��
		SCALE,				// ����
	};

	enum UpgradeCategory
	{
		UPGRADE_BRONZE_CLOTH,		// ��ͭ
		UPGRADE_SILVER_CLOTH,		// ����
		UPGRADE_ARIES,				// ����
		UPGRADE_TAURUS,				// ��ţ��
		UPGRADE_GEMINI,				// ˫����
		UPGRADE_CANCER,				// ��з��
		UPGRADE_LEO,				// ʨ����
		UPGRADE_VIRGO,				// ��Ů��
		UPGRADE_LIBRA,				// �����
		UPGRADE_SCORPIO,			// ��Ы��
		UPGRADE_SAGITTARIUS,		// ������
		UPGRADE_CAPRICORN,			// Ħ����
		UPGRADE_AQUARIUS,			// ˮƿ��
		UPGRADE_PISCES,				// ˫����
		UPGRADE_PEGASUS,			// ������
		UPGRADE_DRACO,				// ������
		UPGRADE_CYGNUS,				// ������
		UPGRADE_ANDROMEDA,			// ��Ů��
		UPGRADE_PHOENIX,			// �����
		UPGRAGE_SURPLICE,			// ڤ��
		UPGRAGE_NEW_SILVER_CLOTH,	// �°���
		UPGRADE_SCALE,				// ����
		UPGRADE_NORMAL_SURPLICE,	// ��ͨڤ��
	};

	unsigned int	id;							// id
	namechar		name[32];					// ����

	namechar		simple_desc[16];			// ʥ�¼��
	unsigned int	is_auto_equip;				// ��ú��Ƿ��Զ�װ��

	struct
	{
		int			need_grade;					// ������Ҫ�����ȼ�
		int			icon_path;					// ͼ��
		int			category;					// ʥ����� �μ�Category
		int			model_path[2];				// ģ��·����(0��/1Ů����ͬ)
		int			helm_model_path_male[10];	// ��ģ��ְҵ2-11ͷ��·����
		int			helm_model_path_female[10];	// Ůģ��ְҵ2-11ͷ��·����
		int			wing_id;					// ���id
		unsigned int wing_color[2];				// ʥ�³����ɫ	
		int			sub_model;					// ʥ�¸�����ģ��·��
		namechar	sub_model_hook_on_body[16];	// ʥ�¸�����ģ�͹ҵ㣨����
		namechar	sub_model_hook[16];			// ʥ�¸�����ģ�͹ҵ㣨ģ�ͣ�
	}
	form_configs[5],							// 0-4����������� (0��ʥ��δ����)
	surplice_form_configs[5];					// ڤ��0-4����������� (0��δ����)

	unsigned int	upgrade_category;			// ʥ��ǿ������ �μ�UpgradeCategory

	unsigned int	prof_mask;					// ְҵ����
	unsigned int	gender_mask;				// �Ա�����
	int				need_level;					// �ȼ�����
	int				need_cosmos_level;			// С����ȼ�����

	int				dur;						// �;�ֵ
	int				money_per_dur;				// ����1�;���Ҫ��Ǯ��
	int				surplice_skill;				// ڤ���󸽴�����id(�����󴥷�)

	int				basic_addon_pack_when_equipped;// װ����Ч_�������԰�ID
	int				basic_addon_pack;			// ӵ����Ч_�������԰�ID
	int				basic_fight_power_when_equipped; // װ����Ч_����ս����
	int				basic_fight_power; 			// ӵ����Ч_����ս����

	int				grade_max;					// �����ȼ�����
	int				cloth_upgrade_conf;			// �������ñ�ID

	struct  
	{
		int			icon;						// �������õȼ�ʱ��ͼ��
		int			addon_pack_when_equipped;	// �������õȼ�ʱ��װ����Ч�����԰�ID
		int			addon_pack;					// �������õȼ�ʱ��ӵ����Ч�����԰�ID
		int			fight_power_when_equipped;	// �������õȼ�ʱװ����Ч��ս����
		int			fight_power;				// �������õȼ�ʱӵ����Ч��ս����
	}
	grade_configs[48];							// ����1-48��������

	struct
	{
		int			skill_id;					// �츳������ID��
		int			grade_req;					// �츳���������ȼ�
	}
	skill_configs_when_equipped[9],				// װ��ʥ�µ��츳����
	skill_configs[9];							// ӵ��ʥ�µ��츳����

	int				cloak_configs[32];			// ���磨�ȼ�1-32������
};

// �������ñ�
struct CLOTH_UPGRADE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct
	{
		int			blesssing_max;				// ף��ֵ����
		float		base_succ_prob;				// �����ɹ���
		int			advanced_blessing;			// �߼�ף��ֵ
		float		advanced_succ_prob;			// �߼�ף���ɹ���
		int			cost_money;					// ���Ľ�Ǯ
		int			cost_item;					// ���ĵ���id
		int			cost_item_count;			// ���ĵ�������
	}
	levels[48];									// ����1-48������
};

// QTE����
struct QTE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				operation_type;				// ������ʽ		0-����(����A)��1-��������(����A)��2-˫����������(����A������B)��3-�ζ���ꣻ4-����HOLD(����A);
												//				5-��������(����A)��6-˫���������� (����A������B)
	int				key[2];						// ����A/B		0-�գ�1-��A����2-��D����3-��������4-��������5-��LMB����6-��RMB����7-���ո񡱣�8-��Q����9-��E��
	int				life_time;					// ����˶�ʱ��n���� (QTE����ʾ����Ļ����ͣ��ʱ��)
	int				break_time;					// ���������жϼ��k����
	int				need_repeat_count;			// ��Ч������ֵm�� (ģʽ0, 1, 2, 3��Ҫ�����Ч�������)
	int				hold_time;					// ��ס����ʱ�� ���� (ģʽ4)

	namechar		action[16];					// ����ʱ���Ŷ��� (����ڽ�����Ч����ʱ���ŵĶ���)
	int				special_ui;					// ����UI����
	int				smart_camera_id;			// ��ͷ����ID
	int				is_hide_key_hint;			// �Ƿ����ذ�����ʾ
	int				show_gfx_on_process;		// ִ��ʱ����ƽ����Ч
	int				show_gfx_on_success;		// �ɹ��󲥷�ƽ����Ч
	int				show_gfx_on_failed;			// ʧ�ܺ󲥷�ƽ����Ч
	float			gfx_percent_pos[2];			// ƽ����Ч��ʾλ�� x,y����ٷֱ�
	int				category;					// QTE���ͱ�ʶ	0-�գ�1-ǿ���ƶ�; 2-�ͷż���; 3-��������; 4-�������; 5-�ҵ㼼������; 6-Ů���ף������; 7-ڤ������; 8-�����д���;

	int				cast_skill;					// ����ͷż���id (QTE�ɹ����ɫ�ͷŵļ���id)
	int				deliver_task;				// ��������ID
	int				finish_task;				// �������ID
	float			revive_hp_percent;			// ���������ٷֱ�

	int				image;						// ����ͼƬ
	float			image_percent_pos[2];		// ����ͼƬ��ʾλ�� x,y����ٷֱ�
	namechar		text[16];					// ��������
	float			text_percent_pos[2];		// ����������ʾλ�� x,y����ٷֱ�
};

// �ŵ���ף������
struct ATHENA_BLESSING_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				blessing_category;			// ��������		0-�������1-����������2-����С���汬����3-ս����ʹ�ü���
	float			trigger_prob;				// ��������
	int				cool_down;					// ��ȴʱ��

	struct
	{
		int			qte_id;						// QTEģ��ID
		float		prob;						// ����
	}
	qte_configs[32];							// 1-32��QTEģ������
};

// �ŵ���ף���齱����
struct ATHENA_AWARD_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct
	{
		int			min;						// ��Ծ����������
		struct
		{
			int		drop_table_id;				// �����ID
			float	prob;						// ����
		}
		drops[4];								// �����1-4����
	}
	activity_configs[10];						// ��Ծ������1-10����
};

// �����������
struct SELF_SERVICE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct
	{
		int			npc_id;						// VIP��ʹ�õ�NPC
	}
	configs[12];								// VIP�ȼ�1-12��ʹ�õ�NPC����

	int				npc_id_for_mvip[18];		// MVIP�ȼ�1-18��ʹ�õ�NPC����
	int				npc_id_for_web_client;		// ΢���÷���NPC
};

// ÿ����ֵ���Ʊ�
struct DAILY_LIMITATION_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct
	{
		int64_t		money_gain_limit;			// ��ý������
		int64_t		bind_money_gain_limit;		// ��ð󶨱�����
		int64_t		exp_gain_limit;				// ��þ�������
		int64_t		exp2_gain_limit;			// ��õڶ���������
		int64_t		bind_money_consume_limit;	// �󶨱���������
	}
	player_level[200];							// ���1-200��ÿ������
};

// �Ҽ�
struct HOOK_MODEL_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	unsigned int	is_player_passive;			// �Ƿ���ұ���
	struct
	{
		namechar		hook_name[16];			// ���ǹҵ�λ��
		int				model;					// �ҵ��ϵ�ģ���ļ�
		namechar		model_hook_name[16];	// ģ�͹ҵ�λ��
	}
	hooks[2];									// �ҵ�1��2������

	struct
	{
		int				id;						// ID
		int				level;					// �ȼ�
	}
	extra_skills[4];							// ���Ӽ���1-4

	unsigned int	is_disable_prof_skills;		// �Ƿ��ְֹҵ����
	unsigned int	is_replace_skill_bar;		// �Ƿ��滻��1�����
	unsigned int	is_disable_mining;			// �Ƿ��ֹ�ɿ�
	unsigned int	is_disable_jump;			// �Ƿ��ֹ��Ծ
	unsigned int	is_disable_dash;			// �Ƿ��ֹ������
	unsigned int	is_disable_cosmos_burst;	// �Ƿ��ֹС���汬��
	unsigned int	is_disable_mounting;		// �Ƿ��ֹ���
	unsigned int	is_disable_fly;				// �Ƿ��ֹ����
	unsigned int	is_disable_booth;			// �Ƿ��ֹ��̯
	unsigned int	is_disable_name_info;		// �Ƿ�����ͷ����Ϣ

	namechar		stand_action[16];					// վ��ʱ�����Ƕ���
	namechar		stand_action_of_hook_model[2][16];	// վ��ʱ��ģ��1-2����
	namechar		run_action[16];						// ����ʱ�����Ƕ���
	namechar		run_action_of_hook_model[2][16];	// ����ʱ��ģ��1-2����
};

// ������������
struct PRODUCE_ENERGY_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				max_produce_energy[200];	// ���Ｖ��1-200ʱ�ľ�������
};

// ��װ��ʶ
struct SUIT_TAG_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	float			no_tag_prob;				// û�б�ʶ�ĸ���
	float			tag_prob[5][10];			// ����1-5����ʶ1-10�ĸ���
};

// ��װ��ʶ��������
struct SUIT_TAG_ACTIVE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				addon_pack[15][5][10][3];	// �Ƚ�1-15, ����1-5, ��ʶ1-10, װ����4-6��ʱ��������԰�
};

// ��װ��ʶת��
struct SUIT_TAG_MIGRATION_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct
	{
		int			item_id;					// ת����Ҫ��Ʒ
		int			item_count;					// ת����Ҫ��Ʒ����
	}
	configs[10];								// ��ʶ1-10ת����Ҫ��Ʒ
};

// ���г�������ģ��
struct PET_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				pet_quality;				// ����Ʒ�� 0-ƽ�� 1-��Ѫ 2-��Ѫ 3-������ 
	int				icon_path[2];				// ͼ��·������/Ů��
	int				model_path[2];				// ģ��·������/Ů��
	
	float			male_prob;					// �Ա��и���
	int				parentage[2];				// ����Ѫͳ1,2
	int				init_level;					// �����ʼ�ȼ�
	int				require_player_level;		// ����Я���ȼ�
	int				race;						// ��������	0-è, 1-��, 2-����, 3-��ӥ, 4-���

	int				init_action_point;			// ����������ʼ����
	int				max_action_point;			// ����������������
	unsigned int	can_propagate;				// �Ƿ���Ի���
	unsigned int	can_auto_pick_up_items;		// �Ƿ����Զ�ʰȡ
};

// ����������
struct PRAY_EXP_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				exp[200];					// �ȼ�1-200��λʱ���þ���
	int				exp2[200];					// �ȼ�1-200��λʱ���õڶ�����
};

// �����ػ�����
struct CONSTELLATION_GUARD_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	float			base_trigger_prob;			// �����������ʣ��Ըø��ʴ�������������12�������������
	struct
	{
		int			skill_id;					// ����ID
		int			wait_time;					// ����׼��ʱ�䣨���룩
		float		prob;						// ��������
	}
	constellation[12];
};

// ������������
struct LEAGUE_REPU_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct
	{
		namechar		name[16];				// ��������
		int				icon_path;				// ����ͼ��·��

		int				repu_max[9];			// 0-8��������������
	}
	reputation[32];								// ����0-31������
};

// ͼ������
struct ALBUM_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				photo_id;					// ͼ��ID
	int				point;						// ͼ������
	struct
	{
		int			item_id;					// ��ƷID
		int			item_count;					// ��Ʒ����
	}
	item_req[3];								// ����ͼ����Ҫ����Ʒ

	int				addon_pack;					// ͼ����������԰�ID
};

// ��ѡģ������
struct MODEL_CANDIDATE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				model[100];					// ��ѡģ��1-100
};

// ս����������
struct COMBAT_PET_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				queue_slot_item_req[5];		// ս������2-6����������Ʒ
	float			queue_slot_factor[5];		// ս������2-6�ӳ�ϵ��

	struct  
	{
		int			attack;						// ����
		int			element_attack;				// ���Թ���
		int			hit;						// ����
		int			critical;					// ����
	}
	level_config[200];							// �ȼ�1-200����������
};

// VIP ����
struct VIP_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct  
	{
		int			cash;						// VIP��ӦԪ����
		int			gift;						// VIP��ȡһ�������
		int			daily_gift;					// VIP��ȡÿ�����
	}
	vip[12];									// VIP����1-12

	struct  
	{
		int			cash_last_month;			// �¶�VIP��Ӧ����Ԫ����
		int			weekly_gift[4];				// �¶�VIPÿ�ܵ�1-4����ȡ���
		int			monthly_gift;				// �¶�VIPÿ����ȡ���
	}
	monthly_vip[18];							// �¶�VIP����1-18
};

// �����׺���
struct MONSTER_AFFIX_COMBINATION_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	unsigned int	affix_combination;			// ��׺���MASK
												// 0x1         = �ٻ�
												// 0x2         = ��̬
												// 0x4         = ����
												// 0x8         = ����
												// 0x10        = ʯ��
												// 0x20        = ����
												// 0x40        = ���
												// 0x80        = ����
												// 0x100       = ǿʯ��
												// 0x200       = ǿ����
												// 0x400       = ǿ���
												// 0x800       = ǿ����
												// 0x1000      = �ָ�
												// 0x2000      = ��
												// 0x4000      = Ӷ��
												// 0x8000      = �Ա�
												// 0x10000     = ����

	int				policy_id;					// ����ID
};

// �����׺�����
struct MONSTER_AFFIX_RANDOM_PACK_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct
	{
		int				affix_combination_conf;	// ��׺���ģ��ID
		int				weight;					// ���Ȩ��
	}
	random_config[64];
};

// QTE�˹ֽ���
struct QTE_PLAYER_MONSTER_INTERACTION_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				qte_conf;					// QTEģ��ID
	namechar		monster_hook_name[16];		// ����ҵ�
	namechar		player_hook_name[16];		// ��ҹҵ�
	unsigned int	is_player_initiative;		// �Ƿ���������ҹ���

	struct  
	{
		namechar		monster_action[16];		// ���ﶯ��
		namechar		player_action[16];		// ��Ҷ���
		unsigned int	is_hook_connect;		// �ҵ��Ƿ�����
	}
	during_qte,									// QTE��
	qte_success,								// QTE�ɹ�
	qte_failed;									// QTEʧ��

	int				player_cast_skill_on_qte_success;	// QTE�ɹ�����ͷż���ID
	int				player_cast_skill_delay;			// ��Ҽ���ʩ���ӳ�ʱ�䣨���룩
	int				monster_cast_skill_on_qte_failed;	// QTEʧ�ܹ����ͷż���ID
	int				monster_cast_skill_delay;			// ���＼��ʩ���ӳ�ʱ�䣨���룩
};

// ս��
struct BATTLE_FIELD_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				category;					// ս������: 0-���Ῠ�ż�, 1-����ս��, 2-����ս��, 3-����ս��
	int				map_id;						// ս����Ӧ�ĵ�ͼ���
	int				player_count;				// ս��������������
	int				group_a_count;				// a������ player_count������Ч
	int				group_b_count;				// b������ player_count������Ч
	int				level_section[10];			// �ȼ���1-10����
	
	unsigned int	daily_limit;				// ÿ���޴�
	WEEKDAY_TIME	daily_limit_reset_time;		// ÿ���޴�����ʱ��
	unsigned int	weekly_limit;				// ÿ���޴�
	WEEKDAY_TIME	weekly_limit_reset_time;	// ÿ���޴�����ʱ��

	struct
	{
		WEEKDAY_TIME	open;					// ����ʱ��
		WEEKDAY_TIME	close;					// �ر�ʱ��
	}
	time_section[4];							// ʱ�������
	
	int				entry_point[3];				// A����B�����Թ۷������ID
	int				revive_point[3];			// A����B�����Թ۷������ID
	int				observer_buff[3];			// �Թ۷�buff

	int				controller_on_start;		// ս����ʼʱ����������ID
	int				battle_duration;			// ս������ʱ�䣨�֣�
	int				escape_punish_time;			// ���ܳͷ�ʱ�䣨�֣�
	int				battle_prepare_time;		// ս��׼��ʱ�䣨�룩
	int				battle_end_count_down;		// ��������ʱʱ�䣨�룩
	int				revive_count_down;			// ���������ʱʱ�䣨�룩

	int				resource;					// ��Դ����
	int				kill_score;					// ��ɱ�÷�
	int				assist_score;				// �����÷�
	int				assist_score_min_per_kill;	// ����������������
	int				assist_score_max_per_kill;	// ����������������
	float			healer_assist_factor;		// ��Ů��������ϵ��
	int				rescue_score;				// ���Ȼ���
	int				first_blood_score;			// ��ɱ�÷�

	int				winner_extra_score;			// ʤ������÷�
	int				loser_extra_score;			// ��������÷�
	int				draw_game_extra_score;		// ƽ�ֶ���÷�

	struct
	{
		int			count;						// ��ɱ��
		int			notification_text;			// �������ɱ��ʱ�㲥����
	}
	combo_kill[3];
};

// ����ӳ�����
struct TEAM_POWER_UP_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				time_section[4];			// ���ʱ��1-4�����ޣ��룩
	int				friendship_section[4];		// �����ܺ��Ѷ�1-4������

	int				buff_pack_table[5][5];		// ���ʱ��1-5�����Ѷ�1-5��״̬��ID
};

// ��� 
struct WING_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				model_path[2];				// �����/Ůģ��·��
	unsigned int	default_color;				// Ĭ����ɫ
	float			fly_speed;					// �����ٶ�
	int				open_wings_pray_time;		// �򿪳������ʱ��

	struct  
	{
		int			id;							// ���и�������ID
		int			level;						// ���и������ܵȼ�
	}
	fly_skills[4];								// ���и�������1-4
	
	unsigned int	fly_replace_skill_bar;			// ����ʱ�滻������
	unsigned int	fly_show_addtional_skill_bar;	// ����ʱ��ʾ���⼼����

	unsigned int	fly_addon_pack[5];			// ���и������԰�ID1-5
};

// ���˾�����
struct SOLO_ARENA_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				win_base_score;				// ��ʤ��û�������
	int				lose_base_score;			// ʧ�ܻ�û�������
	int				combo_score[4];				// 2/10/15/20��ʤ���ϻ�û���

	struct
	{
		int			score;						// ����
		struct
		{
			int		items[5];					// ������Ʒ
			int		bind_money;					// �����󶨱�
			int		money;						// �������ױ�
		}
		instant_award,							// ��������
		finish_award;							// ���㽱��
	}
	sections[10];								// 1-10��
};

// �齱
struct LUCKY_DRAW_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct
	{
		float		ratio;						// ����
		float		prob;						// ����
	}
	money_exp_sections[5];						// �����Ǯ��1-5������

	struct
	{
		int			item_id;					// ��ƷID
		int			count;						// ��Ʒ����
		unsigned int is_bind;					// ��Ʒ�Ƿ��
		float		prob;						// ����
	}
	item_config[10];							// ��Ʒ1-10

	int				draw_cost_bind_money;		// ÿ�γ齱���İ󶨱�����
	int				draw_cost_money;			// ÿ�γ齱���Ľ��ױ�����
	int				draw_cost_item;				// ÿ�γ齱������ƷID
	int				draw_cost_item_count;		// ÿ�γ齱������Ʒ����
	int				draw_cost_fix_config;		// �����õȼ�������ID
	int				max_draw_count;				// ���齱����
};

// ������װ���Ա�
struct EQUIPMENT_ENHANCE_COMBO_CONFIG 
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct
	{
		float		perfect_point;				// �׶�n����������
		int			addon_package;				// �׶�n���԰�
	}
	sections[15];								// 15���׶�
};

// ÿ��ɱ��������
struct MONSTER_KILL_LIMIT_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				max_per_day;				// ÿ��ɱ��������
	int				monster_ids[10];			// ����ID1-10
};

// ��Ʒ�һ�
struct ITEM_EXCHANGE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				item_id;					// �һ���ƷID
	int				item_count;					// �һ���Ʒ����
	int				is_bind;					// �һ���Ʒ�Ƿ��

	unsigned int	is_limited;					// �ɶһ���������
	int				reset_type;					// �һ��������� 0=������ 1=ÿ��6������ 2=ÿ��һ6������ 
	int				description;				// �һ�����

	int				require_player_level;		// ��������ȼ�
	int				require_fight_power;		// ��������ս����
	int				require_exchanged;			// ǰ��һ�ID
	int				require_task;				// ǰ������ID
	int				mutex_task;					// ��������ID
	int				mutex_saint_cloth;			// ����ʥ��ID
	int				require_repu;				// ǰ������ID
	int				require_repu_value;			// ǰ������ֵ

	struct
	{
		int			id;							// ��ƷID
		int			count;						// ��Ʒ����
	}
	cost_item[3];								// �һ�������Ʒ1-3

	int				cost_money;					// �һ�������
	int				cost_bind_money;			// �һ�����󶨱�
	int				cost_repu;					// �һ���������ID
	int				cost_repu_value;			// �һ���������ֵ
};

// ÿ�ո�����������
struct DAILY_BENEFIT_TASK_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	WEEKDAY_TIME	reset_time;					// ���Ÿ����⿪��״̬ÿ������ʱ��
	struct
	{
		int			library_id;					// ���Ÿ�����ID
		int			cost_item_id;				// ���Ÿ����⿪��������Ʒ
		int			cost_item_count;			// ���Ÿ����⿪��������Ʒ����
		int			get_item_id;				// ���Ÿ����⿪���߻����Ʒ
		int			get_item_count;				// ���Ÿ����⿪���߻����Ʒ����
	}
	config[3];									// ����������1-3
};

// ����̽�����ñ�
struct STAR_FIELD_EXPLORE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct
	{
		int			atom_gen_config_id;			// ��ͨ΢����������ID
		float		special_atom_prob;			// ��ϲ΢�����ɸ���
		int			special_atom_gen_config_id;	// ��ϲ΢����������ID
		int			explore_cost_bind_money;	// ���İ󶨱�
		int			explore_cost_item_id;		// ������ƷID
		int			explore_cost_item_count;	// ������Ʒ����
	}
	field[75];									// ̽������1-75
};

// ΢���������ñ�
struct ATOM_GENERATION_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	float			gen_count_prob[4];			// ���1-4��΢���ĸ���
	struct
	{
		int			id;							// ΢��ID
		float		prob;						// ����
		int			count;						// ����
	}
	atom[32];									// ΢��1-32
};

// ΢���ϳ����ñ�
struct ATOM_COMBINE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct
	{
		namechar	name[16];					// ����
		int			need_count;					// �ϳ���������
		int			cost_bind_money;			// �ϳ���Ҫ�󶨱�
		int			cost_money;					// �ϳ���Ҫ���
		struct
		{
			int			id;						// ��ƷID
			int			count;					// ��Ʒ����
		}
		cost_item[3];							// �ϳ���Ҫ��Ʒ1-3
		int			increase_prob_item;			// �ϳ���Ҫ���Ӹ�����Ʒ
		float		normal_prob;				// ��ʹ�ø�����Ʒʱ�ϳɸ���
		float		increased_prob;				// ʹ�ø�����Ʒʱ�ϳɸ���
	}
	atom[10];									// ΢���ϳ�1-10
};

// ΢��������
struct ATOM_CHAIN_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				level_max;					// ΢�����ȼ�����
	struct
	{
		namechar	name[16];					// ����
		int			atom_req_config;			// ΢����������
		int			background_path;			// ����ͼ
		int			teammate_atom_req_config;	// ����΢����������
		int			addon_pack;					// ��ɻ�����԰�

		struct
		{
			int		id;							// ��ɻ����ƷID
			int		count;						// ��ɻ����Ʒ����
			float	prob;						// ��ɻ����Ʒ����
		}
		complete_award_items[3];

		int			complete_active_star_field_incubation;	// ��ɼ�����������ID
	}
	chain[100];									// ΢����1-100��
};

// ΢����������
struct ATOM_REQUIREMENT_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct
	{
		int			req_atom_id;				// ����΢��ID
		int			req_atom_count;				// ����΢������
		struct  
		{
			int		x;							// x����
			int		y;							// y����
		}
		pos;									// ���� 
	}
	slot[32];									// λ��1-32
};

// ��������
struct COSMOS_STAR_FORCE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct
	{
		int			star_force;					// ����ֵ
		int			addon_pack;					// ����ĸ������԰�
	}
	config[10];									// ��������1-10
};

// ������������
struct STAR_FIELD_INCUBATION_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				icon;						// ��ʾͼ��
	int				incubate_time;				// ����ʱ��(��)
	int				drop_table;					// ���������
	int				cost_bind_money;			// ���İ󶨱�
	int				cost_money;					// ����ʱ��(��)
	
	struct
	{
		int			id;							// ID
		int			count;						// ����
	}
	cost_items[3],								// ������Ʒ
	cost_atoms[3];								// ����΢��
};

// ��������
struct CLOAK_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				model_path[2];				// ��/Ůģ��·��
};

// ��������
struct RELIC_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct
	{
		int			need_power;					// ��Ҫ����ֵ
		int			max_enhance_level;			// ������߾����ȼ�
	}
	states[5];									// ����1-5

	struct
	{
		float		prob;						// �ɹ�����
		int			increase_blesssing_on_failed;// ʧ�ܺ�����ף��ֵ
		int			optional_item;				// ��ѡ��Ʒid
		float		prob_with_optional_item;	// ʹ�ÿ�ѡ��Ʒʱ�ĳɹ���
		int			increase_blesssing_on_failed_with_optional_item;	// ʹ�ÿ�ѡ��Ʒʧ��ʱ���ӵ�ף��ֵ
		int			max_blessing;				// ף��ֵ����
		int			require_aura[6];			// 0:Ψһ���Ծ�����Ҫ������1-5:����1-5���Ծ�����Ҫ����
	}
	enhance_config[32];							// ����1-32
};

// ����������Ŀ����
struct RELIC_PROP_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct
	{
		int			addon_pack;					// �������԰�
		int			power;						// ��������ֵ
		int			addon_pack_for_slot[12];	// ��Ч��1-12�������԰�
	}
	enhance[33];								// ����0-32
};

// �����������
struct RELIC_COMBO_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				relics[12];					// ����е�����1-12
	int				need_count;					// ���������Ҫ���ϵ���������
	int				addon_pack;					// ����������԰�
	int				fight_power;				// �������ս����
};

// ʥ��ʿ��־����
struct SAINT_WILLPOWER_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct
	{
		int			need_player_level;			// ������Ҫ����ȼ�
		int			need_skill_point;			// ������Ҫ����ֵ
		int64_t		cost_exp;					// ������Ҫ���ľ���ֵ
		int			addon_pack;					// �������԰�
		int			enable_star_id;				// �����ǳ�ID
	}
	config[200];								// �ȼ�1~200
};

// �����ʾ�����
struct SURVEY_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	unsigned int	is_enable;					// �ʾ��Ƿ񿪷�
	int				award_task;					// ��������ID
	unsigned int	questions_count;			// ��������
	unsigned int	options_count[10];			// ����1-10���ѡ������
};

// ���֮��
struct SOUL_ARMOR_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				icon_path;					// ͼ��·��
	int				type;						// ��������
	int				gem_type_mask;				// ������Ƕ��ʯ����
	int				init_level;					// ���׳�ʼ�ȼ�

	struct
	{
		int			addon_pack;					// x���������԰�
		int			max_gem_count;				// x��������Ƕ��ʯ����
		int			max_gem_level;				// x��������Ƕ��ʯ��ߵȼ�
	}
	config[16];									// 0-15��

	struct
	{
		int			need_player_level;			// ����x����Ҫ����ȼ�
		int			cost_item;					// ����x����Ҫ��ƷID
		int			cost_item_count;			// ����x����Ҫ��Ʒ����
		int			cost_bind_money;			// ����x����Ҫ�󶨽��
		int			cost_exp;					// ����x����Ҫ���ľ���
		int			cost_exp2;					// ����x����Ҫ���ĵڶ�����
	}
	upgrade_config[15];							// ����1-15����������
};

// ��걦ʯ��������
struct SOUL_ARMOR_GEM_COMBO_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				armor_type;					// ��Ч��λ
	int				gem_type[5];				// ���ʯ����1-5

	struct
	{
		int			req_gem_level_min;			// �������Ҫ��͵ȼ�
		int			skill_id;					// �����ID
	}
	active_skill[4];							// �����1-4
};

// ��������ս 
struct SERVER_BATTLE_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				map_id;						// ս����Ӧ�ĵ�ͼ���	
	int				player_count;				// ս��������������

	struct
	{
		int			cost_item;					// ��������Ҫ����Ʒ
		int			controller_on_start;		// ������ʼʱ����������
	}
	field_config[3];							// ����1-3

	int				observer_item;				// �Թ۽�������Ҫ����Ʒ
	
	int				entry_point[3];				// A����B�����Թ۷������ID
	int				revive_point[3];			// A����B�����Թ۷������ID

	int				observer_buff[3];				//�Թ۷�buff

	int				battle_duration;			// ս������ʱ�䣨�֣�
	int				battle_prepare_time;		// ս��׼��ʱ�䣨�룩
	int				battle_end_count_down;		// ��������ʱʱ�䣨�룩
	int				revive_count_down;			// ���������ʱʱ�䣨�룩

	int				resource;					// ��Դ����
	int				kill_score;					// ��ɱ�÷�
	int				assist_score;				// �����÷�
	int				assist_score_min_per_kill;	// ����������������
	int				assist_score_max_per_kill;	// ����������������
	float			healer_assist_factor;		// ��Ů��������ϵ��
	int				rescue_score;				// ���Ȼ���
	int				first_blood_score;			// ��ɱ�÷�

	int				winner_extra_score;			// ʤ������÷�
	int				loser_extra_score;			// ��������÷�
	int				draw_game_extra_score;		// ƽ�ֶ���÷�

	struct
	{
		int			count;						// ��ɱ��
		int			notification_text;			// �������ɱ��ʱ�㲥����
	}
	combo_kill[3];

	struct
	{
		int				winner_award_task;			// ʤ����������id
		int				loser_award_task;			// ������������id
	}
	round[2];
	
};

// С��ֵ����ģ��
struct LITTLE_VALUE_REPUTATION_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	struct  
	{
		namechar			repu_name[16];		// ��������
		int					repu_min;			// ������ֵ����
		int					repu_max;			// ������ֵ����

	}reputations[64];
};

// �������̻�
struct SERVER_PAPA_CONFIG
{
	unsigned int	id;							// id
	namechar		name[32];					// ����

	int				candidate_fight_value_req;		//	��ѡ������ս����
	int				voter_fight_value_req;			//	ѡ��������ս����
	int				voter_num_req;					//	����ѡ������ѡ������

	int				papa_banner_item;				//	�̻�����id
	int				banner_used_limit_per_day;		//  ����ÿ��ʹ�ô�������
	int				papa_fashion_items[2];			//	�̻�ʱװ��Ʒid
	int				forbid_chat_limit_per_day;		//	ÿ�ս��Դ�������
	int				forbid_chat_item;				//	����������Ʒid

	int				papa_server_tasks[3];			//	�̻�ȫ������id

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


