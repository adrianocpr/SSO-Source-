#ifndef __SKILL_SKILL_H
#define __SKILL_SKILL_H

#pragma warning(disable:4786)
#include "playerwrapper.h"
#include "skillwrapper.h"
#include "skillenum.h"
#include "skillstub.h"

namespace GNET
{

	// 目标类型限制
	enum 
	{
		TARGET_TYPE_NEEDNOTTARGET = 0,		//无需目标
		TARGET_TYPE_NEEDTARGET,				//需要目标
		TARGET_TYPE_ZOMBIE,					//目标仅限尸体
		TARGET_TYPE_MASSIVE,				//不选目标群攻
		TARGET_TYPE_MASTER,					//宠物主人
		TARGET_TYPE_AREA,					//选中区域
	};
	typedef unsigned int ID;


	class Skill
	{
	protected:
		const SkillStub* stub;
		PlayerWrapper player;

		unsigned int baselevel;
		unsigned int reallevel;
		unsigned int addon;		


	//********************************************************
	// 技能成员数据接口
	public:
		Skill(ID skill_id, int lev);
		virtual ~Skill() 
		{
		}

		void Destroy() { delete this; }
		const SkillStub * GetStub() const {	return stub; }
		PlayerWrapper * GetPlayer()  { return &player; }
		float GetRange() { return player.GetRange(); }	

		// 技能等级操作
		enum SKILL_LEVEL_TYPE
		{
			BASE		= 0,	//基础等级，通过学习达到的级别
			ADDON		= 1,	//附加等级
			COMMON		= 2,	//公共等级
			REAL		= 3,	//实际等级 = base+addon+common
		};
		int GetSkillLevel(SKILL_LEVEL_TYPE type);
		int SetSkillLevel(SKILL_LEVEL_TYPE type, int);
		int UpdateLevel();
		const wchar_t* GetShowlevel();


	//********************************************************
	// 技能静态数据读取接口
	public:
		// 技能ID
		ID GetId() const { return stub->id; }
		// 技能类别 1.主动攻击, 2.主动祝福, 3.主动诅咒, 4.被动, 5.辅助技能, 6.合成
		char GetType() const { return stub->type; }
		// 技能来源 1.学习技能, 2.天赋技能, 3.天生技能, 4.装备附加技能
		char GetOrginType() { return stub->origintype; }
		// 是否为天赋技能
		bool IsTalentSkill() const { return stub->IsTalentSkill(); }
		// 目标类型限制, 0 无需目标， 1 需要目标，  2 目标仅限于尸体, 3 不选目标群攻
		int GetTargetType();
		// 可使用场景
		int GetMapUseable() const { return stub->mapusable; }		
		// 攻击范围
		ATTACK_RANGE GetAttackRange() const { return ATTACK_RANGE(stub->rangetype); }
		
		float GetCylinderRadius() const {return stub->cylinderradius;}
		float GetCylinderLength() const {return stub->cylinderlength;}
		float GetSectorRadius() const {return stub->sectorradius;}
		int GetSectorAngle() const {return stub->sectorangle;}

		// 0:不隐藏场景 1:隐藏场景和怪物 2:隐藏场景且只显示和自己发生战斗的怪物
		int GetHideBackground() { return stub->hidebackground; }

		//获取技能目标
		int GetAffectType() const { return stub->affecttype; }
		//获取指定npc编号
		const abase::vector<int>& GetSpecificnpc() const { return stub->specificnpc; }
		// 是否尸体
		bool IsBody() const { return stub->targettype == TARGET_BODY; }
		//获取技能优先级
		int GetPriority() const { return stub->priority; }
		// 使用后是否自动攻击
		bool IsAutoAttack() { return stub->autoattack == 0; }
		// 瞬发技能
		bool IsInstant() { return stub->timetype == TIME_INSTANT; }
		// 是否通道技能
		bool IsChannel() { return stub->barshow == BAR_SHOW_CHANNEL; }
		// 是否按钮式通道技能
		bool IsBtnChannel() { return stub->barshow == BAR_SHOW_BTN_CHANNEL; }
		// 是否蓄力技能
		bool IsCharge() { return stub->barshow == BAR_SHOW_CHARGE; }
		// 是否小宇宙技能
		bool IsMicrocosm() { return stub->extraflag == SKILL_EXTRA_FLAG_MICROCOSM; }
		// 是否显示怪物吟唱条
		bool IsShowNpcPrayingBar() { return stub->extraflag == SKILL_EXTRA_FLAG_NPC_PRAY; }
		// 是否投掷技能
		bool IsCast() { return stub->extraflag == SKILL_EXTRA_FLAG_CAST; }
		// 是否抱摔技能
		bool IsHug() { return stub->extraflag == SKILL_EXTRA_FLAG_HUG; }
		// 是否定点抱摔/投掷
		bool IsFixCast() const { return stub->fixcast != 0; }
		// 是否显示引导条
		bool IsShowBootBar() { return stub->bootbar; }
		// 是否自中断
		bool IsSelfInterrupt() { return stub->selfinterrupt; }
		// 是否移动中断
		bool IsMoveInterrupt() { return stub->moveinterrupt; }
		// 是否隐藏场景
		bool IsHideBackground() { return stub->hidebackground != 0; }
		// 击晕沉默是否可用
		bool IsDizzyUsable() { return stub->dizzyusable; }
		// 是否条件触发技能
		bool IsConditionTrigger() { return stub->usetype == MODE_CONDITION; }
		//0隐藏 1显示职业技能栏 2显示在天赋技能栏 3显示在XP技能栏 4显示在爆发技能栏 5显示在宠物技能栏	        
		char GetShowType() { return stub->showtype; }
		// 获取技能施放可用状态掩码
		int GetCanUseStateMask() { return stub->statecondition; }
		// 获取技能施放不可用状态掩码
		int GetCannotUseStateMask() { return 0; }
		// 使用有变身限制
		int GetShapeLimit() { return stub->shape_limit; }
		// 是否宠物自动攻击
		bool IsPetAuto() { return stub->extraflag == SKILL_EXTRA_FLAG_PETAUTO; }
		// 获取施放技能对人物状态的要求
		virtual int GetSelfCondition() { return stub->selfcondition; }
		// 获取技能移动方式
		MOVE_MODE GetMoveMode() const { return MOVE_MODE(stub->movemode); }
		// 获取技能移动表现样式
		MOVE_STYLE GetMoveStyle() const { return MOVE_STYLE(stub->movestyle); }
		// 获取技能移动距离
		float GetMoveDistance() const { return stub->movefix; }
		// 获取技能移动延迟
		int GetMoveDelay() const { return stub->movedelay; }
		// 获取技能施放距离
		float GetCastDistance() const { return stub->castdistance; }
		// 获取技能施放时间
		int GetCastTime() const { return stub->casttime; }
		// 获取技能职业限制
		int GetProfession() const { return stub->profession; }
		// 获取技能可用状态包ID
		int GetCanUseFilterId() { return stub->canusefilterid; }
		// 获取技能不可用状态包ID
		int GetCannotUseFilterId() { return stub->cannotusefilterid; }
		// 获取技能对武器的要求
		int GetWeaponRequired() { return stub->weaponrequired; }
		// 获取技能最大等级
		int GetMaxLevel()  { return stub->maxlevel; }
		//获得瞬时技能光效id
		int GetInstanteGfxId() const {return stub->instanteGfx_Id;}
		// 使用需要hp,mp的百分比限制; 输出参数: condition 条件限制， ratio 比率 
		void GetOtherCondition(char &condition, float &ratio) { condition = stub->othercondition; ratio = stub->other_ratio; }
		// 使用需要item(物品) 返回值为0表示不需要消耗物品
		int GetRequiredItemId() { return stub->goods_id; }
		// 使用技能需要的物品数量
		int GetRequiredItemNum() { return stub->goods_num; }		
		// 获取技能执行段数
		int GetProcedureNum() const { return stub->procedure_num; }
		// 技能执行段Combo
		int GetProcedureTime(size_t index) const { return stub->procedure_time.size() >= index ? stub->procedure_time[index - 1] : 0; }
		// 获取执行段毫秒时间（0 ~ num-1）
		bool GetProcedureCombo(size_t index) const { return stub->procedure_combo.size() >= index ? stub->procedure_combo[index - 1] > 0 : false; }
		// 显示预警光效时间
		int GetShowCampGfxTime() const {return stub->showCampGfxTime;}
        // 预警光效类型  0:程序指定 1:中立 2:友好 3:敌对
        int GetCampGfxType() const {return stub->campGfxType;}
		// 是否变身禁用
		bool IsForbidByShape() const {return stub->canforbidbyshape;}
		//获取斗魂技能组别
		int GetSoulSkillType() const {return stub->soulskilltype;}
		//是否斗魂技能
		bool IsSoulSkill() const {return stub->soulskilltype>0;}
		//界面特效
		const char* GetUiGfx() const {return stub->ui_gfx;}

	//********************************************************
	// 技能使用条件
	public:
		enum CONDTION_CHECK_RET
		{
			CCR_OK					= 0,	//条件判断通过	
			CCR_MP_LACK				= -1,	//MP不足
			CCR_AP_LACK				= -2,	//AP不足
			CCR_VP_LACK				= -3,	//VP不足
			CCR_ITEM_LACK			= -4,	//物品缺乏
			CCR_MASK_UNFIT			= -5,	//状态掩码不符
			CCR_SHAPE_LIMIT			= -6,	//变身限制
			CCR_HP_LT_RATIO			= -7,	//hp低于maxhp的百分比
			CCR_HP_GT_RATIO			= -8,	//hp高于maxhp的百分比
			CCR_MP_LT_RATIO			= -9,	//mp低于maxmp的百分比
			CCR_MP_GT_RATIO			= -10,	//mp高于maxmp的百分比
			CCR_WEAPON_UNFIT		= -11,	//武器装备不符
			CCR_TARGET_UNFIT		= -12,	//目标不符
			CCR_USABLE_BUFF_UNFIT	= -13,	//可用状态包ID不符
			CCR_UNUSABLE_BUFF_UNFIT	= -14,	//不可用状态包ID不符
			CCR_EP_LACK				= -15,  //EP不足
			CCR_SHAPE_FORBID_PROF	= -16,	//变身状态禁用职业技能
			CCR_ENERGY1_LACK		= -17,	//职业能量1不足
			CCR_ENERGY2_LACK		= -18,	//职业能量2不足
			CCR_MAP_UNUSEABLE		= -19,	//可使用场景不符
			CCR_ADSORPTION_LIMIT	= -20,	//挂件限制
			CCR_FIGHT_DISABLE		= -21,	//战斗状态下是否可用
			CCR_PROFESSION_UNMATCH	= -22,	//职业不符
			CCR_SOUL_SKILL_NOACTIVE	= -23,	//斗魂技能未激活
			CCR_ORIGINAL_SKILL_NO_BURST = -24,//小宇宙未爆发无法使用
			CCR_BATTLE_DISABLE		= -25,	//战场状态下是否可用
		};
		CONDTION_CHECK_RET Condition(UseRequirement& info);
	

	//********************************************************
	// 技能公式数据读取接口
	public:
		// 使用需要MP(魔法)
		int GetMpCost() { return stub->GetMpcost(); }
		// 使用需要VP(斗气)		
		int GetVpCost() { return stub->GetVpcost(); }
		// 使用需要AP(怒气)
		int GetApCost()	{ return stub->GetApcost(); }
		// 使用需要EP(能量)
		int GetEpCost() { return stub->GetEpcost(); }	
		// 使用需要ENERGY1(职业能力1)
		int GetEnergy1Cost() { return stub->GetEnergy1cost(); }
		// 使用需要ENERGY2(职业能力2)
		int GetEnergy2Cost() { return stub->GetEnergy2cost(); }
		// 技能执行时间，单位毫秒
		int GetExecuteTime() { return stub->GetExecutetime(); }
		// 技能冷却时间，单位毫秒
		int GetStubCoolingTime() { return stub->GetCooldowntime(); }
		// 技能组冷却编号
		int GetGroupCoolingID() { return stub->GetGroupcdid(); }
		// 技能组冷却时间 单位毫秒
		int GetGroupCoolingTime() { return stub->GetGroupcdtime(); }		
		// 技能攻击范围 半径
		virtual float GetRadius() { return stub->GetRadius(); }		
		// 追击距离
		float GetPersueDistance() 
		{
			if(stub->rangetype==RANGE_POINT || stub->rangetype==RANGE_SELFBALL)
				return -1;
			else
				return stub->GetPursuedistance(); 
		}
		// 客户端最小吟唱距离
		float GetCMinPrayDistance() { return stub->GetCMinPraydistance(); }		
	};
}


#endif

