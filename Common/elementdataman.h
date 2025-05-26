#ifndef _ELEMENTDATAMAN_H_
#define _ELEMENTDATAMAN_H_

#include <stdlib.h>
#include <stdio.h>
#include <vector.h>
#include <hashmap.h>
#include <assert.h>
#include <set>
#include <vector>
#include <map>
#include <string>
#include <sstream>

#include "exptypes.h"

#define _ELEMENT_DATA_BATCH(_macro)\
	_macro(EQUIPMENT_ADDON, equipment_addon);\
	_macro(EQUIPMENT_ESSENCE, equipment_essence);\
	_macro(REFINE_TICKET_ESSENCE, refine_ticket_essence);\
	_macro(MEDICINE_ESSENCE, medicine_essence);\
	_macro(MATERIAL_ESSENCE, material_essence);\
	_macro(SKILLTOME_ESSENCE, skilltome_essence);\
	_macro(TRANSMITROLL_ESSENCE, transmitroll_essence);\
	_macro(LUCKYROLL_ESSENCE, luckyroll_essence);\
	_macro(TOWNSCROLL_ESSENCE, townscroll_essence);\
	_macro(REVIVESCROLL_ESSENCE, revivescroll_essence);\
	_macro(TASKMATTER_ESSENCE, taskmatter_essence);\
	_macro(DROPTABLE_ESSENCE, droptable_essence);\
	_macro(MONSTER_ESSENCE, monster_essence);\
	_macro(NPC_TALK_SERVICE, npc_talk_service);\
	_macro(NPC_SELL_SERVICE, npc_sell_service);\
	_macro(NPC_BUY_SERVICE, npc_buy_service);\
	_macro(NPC_TASK_IN_SERVICE, npc_task_in_service);\
	_macro(NPC_TASK_OUT_SERVICE, npc_task_out_service);\
	_macro(NPC_TASK_MATTER_SERVICE, npc_task_matter_service);\
	_macro(NPC_HEAL_SERVICE, npc_heal_service);\
	_macro(NPC_TRANSMIT_SERVICE, npc_transmit_service);\
	_macro(NPC_PROXY_SERVICE, npc_proxy_service);\
	_macro(NPC_STORAGE_SERVICE, npc_storage_service);\
	_macro(NPC_TYPE, npc_type);\
	_macro(NPC_ESSENCE, npc_essence);\
	_macro(RECIPE_ESSENCE, recipe_essence);\
	_macro(ENEMY_FACTION_CONFIG, enemy_faction_config);\
	_macro(CHARRACTER_CLASS_CONFIG, character_class_config);\
	_macro(PARAM_ADJUST_CONFIG, param_adjust_config);\
	_macro(TASKDICE_ESSENCE, taskdice_essence);\
	_macro(TASKNORMALMATTER_ESSENCE, tasknormalmatter_essence);\
	_macro(PLAYER_LEVELEXP_CONFIG, player_levelexp_config);\
	_macro(MINE_ESSENCE, mine_essence);\
	_macro(FIREWORKS_ESSENCE, fireworks_essence);\
	_macro(NPC_WAR_TOWERBUILD_SERVICE, npc_war_towerbuild_service);\
	_macro(PLAYER_SECONDLEVEL_CONFIG, player_secondlevel_config);\
	_macro(NPC_RESETPROP_SERVICE, npc_resetprop_service);\
	_macro(ESTONE_ESSENCE, estone_essence);\
	_macro(PSTONE_ESSENCE, pstone_essence);\
	_macro(SSTONE_ESSENCE, sstone_essence);\
	_macro(RECIPEROLL_ESSENCE, reciperoll_essence);\
	_macro(SUITE_ESSENCE, suite_essence);\
	_macro(DOUBLE_EXP_ESSENCE, double_exp_essence);\
	_macro(NPC_EQUIPBIND_SERVICE, npc_equipbind_service);\
	_macro(NPC_EQUIPDESTROY_SERVICE, npc_equipdestroy_service);\
	_macro(NPC_EQUIPUNDESTROY_SERVICE, npc_equipundestroy_service);\
	_macro(SKILLMATTER_ESSENCE, skillmatter_essence);\
	_macro(VEHICLE_ESSENCE, vehicle_essence);\
	_macro(COUPLE_JUMPTO_ESSENCE, couple_jumpto_essence);\
	_macro(LOTTERY_ESSENCE, lottery_essence);\
	_macro(CAMRECORDER_ESSENCE, camrecorder_essence);\
	_macro(TITLE_PROP_CONFIG, title_prop_config);\
	_macro(SPECIAL_ID_CONFIG, special_id_config);\
	_macro(TEXT_FIREWORKS_ESSENCE, text_fireworks_essence);\
	_macro(TALISMAN_MAINPART_ESSENCE, talisman_mainpart_essence);\
	_macro(TALISMAN_EXPFOOD_ESSENCE, talisman_expfood_essence);\
	_macro(TALISMAN_MERGEKATALYST_ESSENCE, talisman_mergekatalyst_essence);\
	_macro(TALISMAN_ENERGYFOOD_ESSENCE, talisman_energyfood_essence);\
	_macro(SPEAKER_ESSENCE, speaker_essence);\
	_macro(PLAYER_TALENT_CONFIG, player_talent_config);\
	_macro(POTENTIAL_TOME_ESSENCE, potential_tome_essence);\
	_macro(AIRCRAFT_ESSENCE, aircraft_essence);\
	_macro(CHANGE_SHAPE_ESSENCE, change_shape_essence);\
	_macro(SUMMON_MONSTER_ESSENCE, summon_monster_essence);\
	_macro(PET_BEDGE_ESSENCE, pet_bedge_essence);\
	_macro(PET_FOOD_ESSENCE, pet_food_essence);\
	_macro(PET_SKILL_ESSENCE, pet_skill_essence);\
	_macro(PET_ARMOR_ESSENCE, pet_armor_essence);\
	_macro(MERGE_RECIPE_ESSENCE, merge_recipe_essence);\
	_macro(NPC_HOTEL_SERVICE, npc_hotel_service);\
	_macro(STATUS_POINT_PROP_CONFIG, status_point_prop_config);\
	_macro(PLAYER_STATUS_POINT_CONFIG, player_status_point_config);\
	_macro(PRODUCE_TYPE_CONFIG, produce_type_config);\
	_macro(NPC_LEARN_PRODUCE_SERVICE, npc_learn_produce_service);\
	_macro(AI_HELPER_ESSENCE, ai_helper_essence);\
	_macro(ITEM_TRADE_CONFIG, item_trade_config);\
	_macro(LEVELUP_MODIFY_CONFIG, levelup_modify_config);\
	_macro(SKILL_LEARN_CONFIG, skill_learn_config);\
	_macro(EQUIPMENT_QUALITY_CONFIG, equipment_quality_config);\
	_macro(EQUIPMENT_ENHANCE_TRANSFORM_CONFIG, equipment_enhance_transform_config);\
	_macro(TRADE_DISTANCE_CONFIG, trade_distance_config);\
	_macro(NPC_LEARN_SKILL_SERVICE, npc_learn_skill_service);\
	_macro(NPC_TRADE_PORT_SERVICE, npc_trade_port_service);\
	_macro(NPC_SWITCH_PROF_SERVICE, npc_switch_prof_service);\
	_macro(TRADE_ITEM_ESSENCE, trade_item_essence);\
	_macro(ADDON_PACKAGE_CONFIG, addon_package_config);\
	_macro(ADDON_STORAGE_CONFIG, addon_storage_config);\
	_macro(EQUIPMENT_PROPERTY_RANDOM_CONFIG, equipment_property_random_config);\
	_macro(INSTANCE_CONFIG, instance_config);\
	_macro(BOOK_ESSENCE, book_essence);\
	_macro(TRADE_RANDOM_EVENT_CONFIG, trade_random_event_config);\
	_macro(MONEYBAG_ESSENCE, moneybag_essence);\
	_macro(SYSTEM_MAIL_CONFIG, system_mail_config);\
	_macro(INSTANCE_TABLE_CONFIG, instance_table_config);\
	_macro(PET_REVIVE_ESSENCE, pet_revive_essence);\
	_macro(FIRE_ESSENCE, fire_essence);\
	_macro(KM_PARAM_ADJUST_CONFIG, km_param_adjust_config);\
	_macro(TIME_GIFT_BAG_CONFIG, time_gift_bag_config);\
	_macro(EQUIPMENT_ENHANCE_MODEL_CONFIG, equipment_enhance_model_config);\
	_macro(IDENTIFY_SCROLL_ESSENCE, identify_scroll_essence);\
	_macro(CHAR_CAMERA_CONFIG, char_camera_config);\
	_macro(DYNAMIC_INSTANCE_CONFIG, dynamic_instance_config);\
	_macro(DYNAMIC_MONSTER_PACK_ESSENCE, dynamic_monster_pack_essence);\
	_macro(PLAYER_SUB_PROF_LEVEL_EXP_CONFIG, player_sub_prof_level_exp_config);\
	_macro(PET_EGG_ESSENCE, pet_egg_essence);\
	_macro(SPECIAL_STATUS_PACKAGE_CONFIG, special_status_package_config);\
	_macro(STATUS_PACKAGE_EXPRESSIONS_CONFIG, status_package_expressions_config);\
	_macro(RESURRECT_TIME_CONFIG, resurrect_time_config);\
	_macro(NPC_RECIPE_ESSENCE, npc_recipe_essence);\
	_macro(GIFT_BAG_CONFIG, gift_bag_config);\
	_macro(SPECIAL_ITEMS_PACK_ESSENCE, special_items_pack_essence);\
	_macro(TRANSMITBOX_ESSENCE, transmitbox_essence);\
	_macro(REPUTATION_CONFIG, reputation_config);\
	_macro(TASK_FIX_CONFIG, task_fix_config);\
	_macro(BODY_TRANSFORM_CONFIG, body_transform_config);\
	_macro(MONSTER_NPC_PACK_CONFIG, monster_npc_pack_config);\
	_macro(TEXT_PACK_CONFIG, text_pack_config);\
	_macro(STAR_SOUL_CHAIN_CONFIG, star_soul_chain_config);\
	_macro(STAR_SOUL_STONE_ESSENCE, star_soul_stone_essence);\
	_macro(STAR_SOUL_CHAIN_COMBO_CONFIG, star_soul_chain_combo_config);\
	_macro(COMBO_PACK_CONFIG, combo_pack_config);\
	_macro(MINE_PACK_CONFIG, mine_pack_config);\
	_macro(SUMMON_MONSTER_NPC_PACK_CONFIG, summon_monster_npc_pack_config);\
	_macro(SUMMON_MINE_PACK_CONFIG, summon_mine_pack_config);\
	_macro(ENHANCE_ITEM_ESSENCE, enhance_item_essence);\
	_macro(ENHANCE_SHOW_CONFIG, enhance_show_config);\
	_macro(WORLD_TELEPORT_POINT_CONFIG, world_teleport_point_config);\
	_macro(ENHANCE_TRANSFER_CONFIG, enhance_transfer_config);\
	_macro(STAR_SOUL_STONE_UPGRADE_ITEM_ESSENCE, star_soul_stone_upgrade_item_essence);\
	_macro(EQUIPMENT_PROCESSING_ITEM_ESSENCE, equipment_processing_item_essence);\
	_macro(PET_APTITUDE_STONE_ESSENCE, pet_aptitude_stone_essence);\
	_macro(PET_SKILL_LEVEL_UP_STONE_ESSENCE, pet_skill_level_up_stone_essence);\
	_macro(COMMON_MONSTER_CONFIG, common_monster_config);\
	_macro(PET_GROWTH_STONE_ESSENCE, pet_growth_stone_essence);\
	_macro(PET_CATCHER_ESSENCE, pet_catcher_essence);\
	_macro(SUMMON_CATEGORY_CONFIG, summon_category_config);\
	_macro(STORED_EXP_CONFIG, stored_exp_config);\
	_macro(PASSIVE_SKILL_CONFIG, passive_skill_config);\
	_macro(DROP_BY_LEVEL_CONFIG, drop_by_level_config);\
	_macro(STORAGE_TASK_MAX_COUNT_CONFIG, storage_task_max_count_config);\
	_macro(LEVEL_ADAPT_WEIGHT_CONFIG, level_adapt_weight_config);\
	_macro(GUARDIAN_STAR_CONFIG, guardian_star_config);\
	_macro(GUARDIAN_STONE_ESSENCE, guardian_stone_essence);\
	_macro(LEAGUE_WAR_CONFIG, league_war_config);\
	_macro(GUARDIAN_SOUL_ESSENCE, guardian_soul_essence);\
	_macro(GUARDIAN_SOUL_SKILL_ESSENCE, guardian_soul_skill_essence);\
	_macro(GUARDIAN_SOUL_SKILL_UP_ESSENCE, guardian_soul_skill_up_essence);\
	_macro(GUARDIAN_SOUL_APTITUDE_STONE_ESSENCE, guardian_soul_aptitude_stone_essence);\
	_macro(REST_EXP_CONFIG, rest_exp_config);\
	_macro(NPC_DUNGEON_SERVICE, npc_dungeon_service);\
	_macro(ENFORCED_MOVE_CONFIG, enforced_move_config);\
	_macro(PROF_SELECT_SERVICE, prof_select_service);\
	_macro(STAR_BOARD_CONFIG, star_board_config);\
	_macro(STAR_CONFIG, star_config);\
	_macro(ASTROLOGY_CONFIG, astrology_config);\
	_macro(STAR_SOUL_ESSENCE, star_soul_essence);\
	_macro(ASTROLOGY_ITEM_ESSENCE, astrology_item_essence);\
	_macro(EXTEND_ENHANCE_LIMIT_ITEM_ESSENCE, extend_enhance_limit_item_essence);\
	_macro(SOLO_CHALLENGE_DUNGEON_CONFIG, solo_challenge_dungeon_config);\
	_macro(CLOTH_CONFIG, cloth_config);\
	_macro(QTE_CONFIG, qte_config);\
	_macro(ATHENA_BLESSING_CONFIG, athena_blessing_config);\
	_macro(SELF_SERVICE_CONFIG, self_service_config);\
	_macro(CLOTH_UPGRADE_ITEM_ESSENCE, cloth_upgrade_item_essence);\
	_macro(ATHENA_AWARD_CONFIG, athena_award_config);\
	_macro(DAILY_LIMITATION_CONFIG, daily_limitation_config);\
	_macro(HOOK_MODEL_CONFIG, hook_model_config);\
	_macro(NPC_LIMITED_SALE_SERVICE, npc_limited_sale_service);\
	_macro(CLOTH_UPGRADE_CONFIG, cloth_upgrade_config);\
	_macro(PRODUCE_ENERGY_CONFIG, produce_energy_config);\
	_macro(SUIT_TAG_CONFIG, suit_tag_config);\
	_macro(SUIT_TAG_ACTIVE_CONFIG, suit_tag_active_config);\
	_macro(VALUE_INCREASE_ESSENCE, value_increase_essence);\
	_macro(PET_CONFIG, pet_config);\
	_macro(PET_ACCESSORY_ESSENCE, pet_accessory_essence);\
	_macro(PRAY_EXP_CONFIG, pray_exp_config);\
	_macro(CONSTELLATION_GUARD_CONFIG, constellation_guard_config);\
	_macro(LEAGUE_REPU_CONFIG, league_repu_config);\
	_macro(ALBUM_CONFIG, album_config);\
	_macro(MODEL_CANDIDATE_CONFIG, model_candidate_config);\
	_macro(COMBAT_PET_ESSENCE, combat_pet_essence);\
	_macro(COMBAT_PET_SKILL_BOOK_ESSENCE, combat_pet_skill_book_essence);\
	_macro(COMBAT_PET_EQUIPMENT_ESSENCE, combat_pet_equipment_essence);\
	_macro(STAR_SOUL_BOX_ESSENCE, star_soul_box_essence);\
	_macro(EQUIPMENT_APPEARANCE_ESSENCE, equipment_appearance_essence);\
	_macro(PLAYER_APPEARANCE_ESSENCE, player_appearance_essence);\
	_macro(DRIFT_BOTTLE_ESSENCE, drift_bottle_essence);\
	_macro(COMBAT_PET_CONFIG, combat_pet_config);\
	_macro(VIP_CONFIG, vip_config);\
	_macro(MONSTER_AFFIX_COMBINATION_CONFIG, monster_affix_combination_config);\
	_macro(MONSTER_AFFIX_RANDOM_PACK_CONFIG, monster_affix_random_pack_config);\
	_macro(QTE_PLAYER_MONSTER_INTERACTION_CONFIG, qte_player_monster_interaction_config);\
	_macro(BATTLE_FIELD_CONFIG, battle_field_config);\
	_macro(TEAM_POWER_UP_CONFIG, team_power_up_config);\
	_macro(DIVINING_ITEM_ESSENCE, divining_item_essence);\
	_macro(WING_CONFIG, wing_config);\
	_macro(SOLO_ARENA_CONFIG, solo_arena_config);\
	_macro(LUCKY_DRAW_CONFIG, lucky_draw_config);\
	_macro(NPC_BATTLE_FIELD_SERVICE, npc_battle_field_service);\
	_macro(EQUIPMENT_ENHANCE_COMBO_CONFIG, equipment_enhance_combo_config);\
	_macro(NPC_IMPRINT_SERVICE, npc_imprint_service);\
	_macro(MONSTER_KILL_LIMIT_CONFIG, monster_kill_limit_config);\
	_macro(ITEM_EXCHANGE_CONFIG, item_exchange_config);\
	_macro(NPC_ITEM_EXCHANGE_SERVICE, npc_item_exchange_service);\
	_macro(EMOTION_ICON_PACK_ESSENCE, emotion_icon_pack_essence);\
	_macro(DAILY_BENEFIT_TASK_CONFIG, daily_benefit_task_config);\
	_macro(REVENGE_ITEM_ESSENCE, revenge_item_essence);\
	_macro(STAR_FIELD_EXPLORE_CONFIG, star_field_explore_config);\
	_macro(ATOM_GENERATION_CONFIG, atom_generation_config);\
	_macro(ATOM_COMBINE_CONFIG, atom_combine_config);\
	_macro(ATOM_CHAIN_CONFIG, atom_chain_config);\
	_macro(ATOM_REQUIREMENT_CONFIG, atom_requirement_config);\
	_macro(COSMOS_STAR_FORCE_CONFIG, cosmos_star_force_config);\
	_macro(STAR_FIELD_INCUBATION_CONFIG, star_field_incubation_config);\
	_macro(EQUIPMENT_DYE_ESSENCE, equipment_dye_essence);\
	_macro(RELIC_ESSENCE, relic_essence);\
	_macro(CLOAK_CONFIG, cloak_config);\
	_macro(RELIC_CONFIG, relic_config);\
	_macro(RELIC_PROP_CONFIG, relic_prop_config);\
	_macro(RELIC_COMBO_CONFIG, relic_combo_config);\
	_macro(SUIT_TAG_MIGRATION_CONFIG, suit_tag_migration_config);\
	_macro(MARRIAGE_CERTIFICATE_ESSENCE, marriage_certificate_essence);\
	_macro(NPC_FORCE_SELECT_SERVICE, npc_force_select_service);\
	_macro(SAINT_WILLPOWER_CONFIG, saint_willpower_config);\
	_macro(SURVEY_CONFIG, survey_config);\
	_macro(SOUL_ARMOR_CONFIG, soul_armor_config);\
	_macro(SOUL_ARMOR_GEM_ESSENCE, soul_armor_gem_essence);\
	_macro(SOUL_ARMOR_GEM_COMBO_CONFIG, soul_armor_gem_combo_config);\
	_macro(SERVER_BATTLE_CONFIG, server_battle_config);\
	_macro(SKILL_CLEANER_ESSENCE,skill_cleaner_essence);\
	_macro(LITTLE_VALUE_REPUTATION_CONFIG,little_value_reputation_config);\
	_macro(SERVER_PAPA_CONFIG,server_papa_config);\
	

#define _ELEMENT_DATA_BATCH_ITEMS(_macro)\
	_macro(EQUIPMENT_ESSENCE);\
	_macro(PET_FOOD_ESSENCE);\
	_macro(PET_BEDGE_ESSENCE);\
	_macro(PET_SKILL_ESSENCE);\
	_macro(MEDICINE_ESSENCE);\
	_macro(MATERIAL_ESSENCE);\
	_macro(TASKMATTER_ESSENCE);\
	_macro(TASKNORMALMATTER_ESSENCE);\
	_macro(RECIPEROLL_ESSENCE);\
	_macro(SKILLMATTER_ESSENCE);\
	_macro(SKILLTOME_ESSENCE);\
	_macro(TRANSMITROLL_ESSENCE);\
	_macro(FIREWORKS_ESSENCE);\
	_macro(VEHICLE_ESSENCE);\
	_macro(CHANGE_SHAPE_ESSENCE);\
	_macro(LOTTERY_ESSENCE);\
	_macro(SPEAKER_ESSENCE);\
	_macro(TASKDICE_ESSENCE);\
	_macro(STAR_SOUL_STONE_ESSENCE);\
	_macro(ENHANCE_ITEM_ESSENCE);\
	_macro(STAR_SOUL_STONE_UPGRADE_ITEM_ESSENCE);\
	_macro(EQUIPMENT_PROCESSING_ITEM_ESSENCE);\
	_macro(PET_APTITUDE_STONE_ESSENCE);\
	_macro(PET_SKILL_LEVEL_UP_STONE_ESSENCE);\
	_macro(PET_GROWTH_STONE_ESSENCE);\
	_macro(PET_CATCHER_ESSENCE);\
	_macro(GUARDIAN_STONE_ESSENCE);\
	_macro(GUARDIAN_SOUL_ESSENCE);\
	_macro(GUARDIAN_SOUL_SKILL_ESSENCE);\
	_macro(GUARDIAN_SOUL_SKILL_UP_ESSENCE);\
	_macro(GUARDIAN_SOUL_APTITUDE_STONE_ESSENCE);\
	_macro(STAR_SOUL_ESSENCE);\
	_macro(ASTROLOGY_ITEM_ESSENCE);\
	_macro(EXTEND_ENHANCE_LIMIT_ITEM_ESSENCE);\
	_macro(CLOTH_UPGRADE_ITEM_ESSENCE);\
	_macro(BOOK_ESSENCE);\
	_macro(VALUE_INCREASE_ESSENCE);\
	_macro(PET_ACCESSORY_ESSENCE);\
	_macro(COMBAT_PET_ESSENCE);\
	_macro(COMBAT_PET_SKILL_BOOK_ESSENCE);\
	_macro(COMBAT_PET_EQUIPMENT_ESSENCE);\
	_macro(STAR_SOUL_BOX_ESSENCE);\
	_macro(EQUIPMENT_APPEARANCE_ESSENCE);\
	_macro(PLAYER_APPEARANCE_ESSENCE);\
	_macro(DRIFT_BOTTLE_ESSENCE);\
	_macro(DIVINING_ITEM_ESSENCE);\
	_macro(EMOTION_ICON_PACK_ESSENCE);\
	_macro(REVENGE_ITEM_ESSENCE);\
	_macro(EQUIPMENT_DYE_ESSENCE);\
	_macro(RELIC_ESSENCE);\
	_macro(MARRIAGE_CERTIFICATE_ESSENCE);\
	_macro(SOUL_ARMOR_GEM_ESSENCE);\
	_macro(SKILL_CLEANER_ESSENCE);\


struct ElementDataTypeMeta
{
	struct Entry
	{
		std::wstring name;
		unsigned int offset;
		unsigned int length;
	};

	ID_SPACE id_space;
	std::wstring i18n_bundle;
	std::vector<Entry> entries;
};

class elementdataman
{
public:
	typedef bool (*L10NTextFunc)(std::wstring& result, const wchar_t* id);
public:
	elementdataman();
	virtual ~elementdataman();

	//////////////////////////////////////////////////////////////////////////

#define _DECLARE_FUNCS(type, lower_case_name)\
	void add_structure(ID_SPACE space, unsigned int id, type& data);\
	static DATA_TYPE get_data_type_of(type* t) { return DT_##type; }
#define DECLARE_FUNCS(type, lower_case_name) _DECLARE_FUNCS(type, lower_case_name)

	_ELEMENT_DATA_BATCH(DECLARE_FUNCS);
#undef DECLARE_FUNCS
#undef _DECLARE_FUNCS

	static DATA_TYPE get_data_type_by_string(const char* type_name);

	void add_talk(unsigned int id, talk_proc* data);

	//////////////////////////////////////////////////////////////////////////
public:
	/// @deprecated this method is slow.
	unsigned int get_data_id(ID_SPACE idspace, unsigned int index, DATA_TYPE & datatype);

	unsigned int get_first_data_id(ID_SPACE idspace, DATA_TYPE & datatype);
	unsigned int get_next_data_id(ID_SPACE idspace, DATA_TYPE & datatype);
	unsigned int get_data_num(ID_SPACE idspace);

	DATA_TYPE get_data_type(unsigned int id, ID_SPACE idspace);
	const void * get_data_ptr(unsigned int id, ID_SPACE idspace, DATA_TYPE & datatype);
	size_t get_data_size(DATA_TYPE dt) { return dt >= 0 && dt < (int)type_size_array.size() ? type_size_array[dt] : 0; }

	unsigned int get_data_num(DATA_TYPE dt) { return vbase_ptr_array[dt]->size(); }
	const void* get_first_data_ptr(DATA_TYPE dt) { return get_data_num(dt) ? vbase_ptr_array[dt]->get(0) : 0; }

	bool is_item_type(DATA_TYPE datatype);
	const ITEM_COMMON_PROP* get_item_common_prop(unsigned int id);
	ITEM_COMMON_PROP* get_writable_item_common_prop(DATA_TYPE datatype, void* data);

	template<class T>
	ITEM_COMMON_PROP* get_writable_item_common_prop(T& data)
	{
		DATA_TYPE dt = get_data_type_of(&data);
		return get_writable_item_common_prop(dt, (void*)&data);
	}

	template <typename FUNCTION> 
	void for_each(DATA_TYPE dt, FUNCTION func)
	{
		for (size_t i=0; i<vbase_ptr_array[dt]->size(); ++i)
			func(vbase_ptr_array[dt]->get(i));
	}

	int save_data(const char * pathname, bool bForClient = false);
	int load_data(const char * pathname);

	void set_export_for_server_only(DATA_TYPE dt) { export_for_server_set.insert(dt); }

	void add_meta_info(DATA_TYPE dt, const ElementDataTypeMeta::Entry& meta_entry) { meta_map[dt].entries.push_back(meta_entry); }
	ElementDataTypeMeta& add_meta_info(DATA_TYPE dt) { return meta_map[dt]; }
	ElementDataTypeMeta* get_meta_info(DATA_TYPE dt) { MetaMap::iterator it = meta_map.find(dt); return it == meta_map.end() ? NULL : &it->second; }
	L10NTextFunc get_l10n_text_func() { return l10n_func; }
	void set_l10n_text_func(L10NTextFunc func) { l10n_func = func; }

protected:

	class vbase
	{
	public:
		virtual ~vbase() { }
		virtual size_t size() = 0;
		virtual void* get(size_t) = 0;
		virtual int save(elementdataman* man, FILE* file) = 0;
		virtual int save_empty(elementdataman* man, FILE* file) = 0;
		virtual int load(elementdataman* man, FILE* file) = 0;
	};

	template<class T>
	class array : public vbase
	{
		enum 
		{
			MAGIC = 0xfefecdcd,
		};
	public:
		virtual size_t size() { return _v.size(); }
		inline void push_back(const T & x) { _v.push_back(x); }
		inline const T & operator [](size_t pos) const { return _v[pos]; }
		inline T & operator [](size_t pos) {return _v[pos];}
		virtual void* get(size_t pos) { return &_v[pos]; }
		virtual int save(elementdataman* man, FILE * file)
		{
			unsigned int ts = sizeof(T);
			fwrite(&ts, sizeof(ts), 1, file);
			unsigned int s = _v.size();
			fwrite(&s, sizeof(s), 1, file);
			if(s>0)		fwrite(&(_v[0]), sizeof(T), s, file);

			const unsigned int magic = MAGIC;
			fwrite(&magic, sizeof(magic), 1, file );
			return 0;
		}
		virtual int save_empty(elementdataman* man, FILE* file)
		{
			unsigned int ts = sizeof(T);
			fwrite(&ts, sizeof(ts), 1, file);
			unsigned int s = 0;
			fwrite(&s, sizeof(s), 1, file);

			const unsigned int magic = MAGIC;
			fwrite(&magic, sizeof(magic), 1, file );
			return 0;
		}
		virtual int load(elementdataman* man, FILE * file)
		{
			unsigned int ts;
			if(fread(&ts, sizeof(ts), 1, file) != 1)	{ assert(0); return -1; }
			if(ts != sizeof(T))									{ assert(0); return -1; }
			unsigned int s;
			if(fread(&s, sizeof(s), 1, file) != 1)	{ assert(0); return -1; }
			if(s>0)
			{
				_v.reserve(s);
				T data;
				unsigned int i;
				for(i=0; i<s; i++)
				{
					if(fread(&data, sizeof(T), 1, file) != 1) 	{ assert(0); return -1; }
					load_l10n_text(man, data);
					_v.push_back(data);
				}
			}

			unsigned int magic = 0;
			fread(&magic, sizeof(magic), 1, file );
			assert(magic == MAGIC);
			return 0;
		}
		virtual void load_l10n_text(elementdataman* man, T& data) {}
	protected:
		abase::vector<T> _v;
	};

	template<class T>
	class data_array : public array<T>
	{
	public:
		virtual void load_l10n_text(elementdataman* man, T& data)
		{
#ifdef _ELEMENTCLIENT
			elementdataman::L10NTextFunc l10n_func = man->get_l10n_text_func();
			if(!l10n_func) return;

			DATA_TYPE dt = man->get_data_type_of(&data);
			ElementDataTypeMeta* pMeta = man->get_meta_info(dt);
			if(!pMeta) return;
			if(pMeta->i18n_bundle.size() <= 0) return;

			std::wstringstream ss;
			ss << pMeta->i18n_bundle << "_" << data.id << "_";
			std::wstring prefix = ss.str();

			for(size_t i = 0; i < pMeta->entries.size(); ++i)
			{
				ss.str(L"");
				ElementDataTypeMeta::Entry& e = pMeta->entries[i];

				ss << prefix << e.name;

				std::wstring id, text;
				id = ss.str();

				if(l10n_func(text, id.c_str()))
				{
					wchar_t* pDest = (wchar_t*)((unsigned char*)&data + e.offset);
					wcsncpy_s(pDest, e.length / sizeof(wchar_t), text.c_str(), _TRUNCATE);
				}
			}
#endif
		}
	};

	void prepare_data(DATA_TYPE dt, void* data);

	void prepare_item_common_prop(ITEM_COMMON_PROP* pCommon)
	{
		if(!pCommon) return;
		if(pCommon->pile_num_max == 0)
			pCommon->pile_num_max = 1;
	}

	template<class Type>
	void _add_structure(ID_SPACE space, unsigned int id, Type& data )
	{
		DATA_TYPE dt = get_data_type_of(&data);
		prepare_data(dt, &data);

		ITEM_COMMON_PROP* pCommon = get_writable_item_common_prop(data);
		prepare_item_common_prop(pCommon);

		array<Type>& arr = (array<Type>&)*vbase_ptr_array[dt];

		arr.push_back(data);
		unsigned int pos = arr.size()-1;
		add_id_index(space, id, dt, pos, &(arr[0]));
	}

	template<class Type>
	bool _setup_hash_map(DATA_TYPE type, array<Type>& arr)
	{
		if(arr.size() <= 0) return true;

		LOCATION p;
		p.type = type;
		ElementDataTypeMeta* pMeta = get_meta_info(type);
		if(!pMeta) return false;
		ID_SPACE space = pMeta->id_space;
		if(space <= ID_SPACE_INVALID || space >= ID_SPACE_MAX) return false;

		for(size_t i = 0; i < arr.size(); ++i)
		{
			start_ptr_array[p.type] = &(arr[0]);
			p.pos = i;
			id_index_map[space][arr[i].id] = p;
		}
		return true;
	}

	bool setup_hash_map();

	void add_id_index(ID_SPACE idspace, unsigned int id, DATA_TYPE type, unsigned int pos, void * start);

	static void NormalizeRandom(float* r, int n);

	array<talk_proc *>					talk_proc_array;

#define _DECLARE_ARRAYS(type, lower_case_name)\
	data_array<type>			lower_case_name##_array;
#define DECLARE_ARRAYS(type, lower_case_name) _DECLARE_ARRAYS(type, lower_case_name)

	_ELEMENT_DATA_BATCH(DECLARE_ARRAYS);
#undef DECLARE_ARRAYS
#undef _DECLARE_ARRAYS
	
	// the global hash_map for each id space
private:
	struct LOCATION
	{
		DATA_TYPE		type;
		unsigned int	pos;
	};
	typedef abase::hash_map<unsigned int, LOCATION> IDToLOCATIONMap;
	typedef std::map<DATA_TYPE, ElementDataTypeMeta> MetaMap;
	typedef std::map<std::string, DATA_TYPE> TypeNameMap;

	IDToLOCATIONMap				id_index_map[ID_SPACE_MAX];
	IDToLOCATIONMap::iterator	id_index_itr[ID_SPACE_MAX];

	array<void *>				start_ptr_array;
	array<vbase*>				vbase_ptr_array;
	array<unsigned int>			type_size_array;

	std::set<DATA_TYPE>			export_for_server_set;
	MetaMap						meta_map;
	L10NTextFunc				l10n_func;
};

#endif
