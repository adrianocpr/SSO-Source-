#ifndef __SKILL_SKILLSTUB_H
#define __SKILL_SKILLSTUB_H

#include <vector.h>
#include "hashmap.h"
#include <AString.h>
#include "ScriptValue.h"
#include "skillenum.h"


namespace GNET
{
	class Skill;
	class SkillStub
	{
	public:
		typedef unsigned int ID;
		typedef abase::vector<int> ARRAY;

	public:
		ID      id;						// 技能ID  
		AString	icon;					// 图标	

		char    type;					// 技能类型
		char    usetype;				// 技能使用方式
		char    origintype;				// 技能来源  
		char    showtype;				// 显示方式 
		int     affecttype;             // 生效类型
		int		profession;				// 职业限制
		ARRAY   specificnpc;            // 指定npc
		int     priority;				// 优先级
		char	hidebackground;			// 是否隐藏场景
		char    timetype;				// 时间类型
		char    barshow;				// 时间条显示方式
		char    extraflag;				// 技能额外标示 
		char	fixcast;				// 定点抱摔/投掷
		char	movemode;				// 移动方式	
		char	movestyle;				// 移动样式 普通(0) 闪现(1)
		float	movefix;				// 移动修正距离
		int		movedelay;				// 移动延迟
		float	castdistance;			// 抱摔/投掷距离
		int     casttime;				// 投掷时间（毫秒）

		int     maxlevel;				// 技能最大级别
		int     talentmaxlearn;			// 天赋最大学习级别

		char    autoattack;				// 自动攻击

		char    rangetype;				// 作用范围

		float	radius;					// 技能攻击范围 半径	
		float	cylinderradius;			//圆柱半径
		float	cylinderlength;			//圆柱长度
		float	sectorradius;			//扇形半径
		int		sectorangle;			//扇形张角

		bool    moveinterrupt;			// 是否移动中断
		bool	selfinterrupt;			// 是否移动自中断
		bool	bootbar;				// 是否显示引导条

		char    selfcondition;			// 自身条件 
		char    targettype;				// 目标类型限制

		char    delaymode;				// 延时方式  
		int     delaytime;				// 延时时间
		int     flyspeed;				// 飞行速度

		int     statecondition;			// 状态施放条件 
		int		canusefilterid;			// 可用状态包ID
		int		cannotusefilterid;		// 不可用状态包ID
		bool    fightusable;			// 战斗状态下是否可用
		bool    dizzyusable;			// 击晕状态下是否可用 
		int		weaponrequired;			// 技能施放武器需求		
		char	othercondition;			// hp, mp其他条件要求
		float	other_ratio;			// hp, mp要求的比率
		int 	shape_limit;			// 不能释放技能的变身状态
		int		goods_id;				// 使用需要item(物品) 返回值为0表示不需要消耗物品
		int		goods_num;				// 使用需要物品的数量
		int		mapusable;				// 可使用场景

		int		instanteGfx_Id;			//瞬发特效GfxId

		int		procedure_num;			// 技能执行段数
		ARRAY	procedure_combo;		// 技能执行段Combo
		ARRAY	procedure_time;			// 技能执行段毫秒时间（0 ~ num-1）

		ARRAY	mask_formulas;			// 使用公式标志
		int		mp_cost;				// 使用需要MP(魔法)
		int		vp_cost;				// 使用需要VP(斗气)
		int 	ap_cost;				// 使用需要AP(怒气)
		int		ep_cost;				// 使用需要EP(能量)
		int		energy1_cost;			// 使用需要ENERGY1(职业能量1)
		int		energy2_cost;			// 使用需要ENERGY2(职业能量2)		
		int		execute_time;			// 技能执行时间，单位毫秒
		int		cooldown_time;			// 技能冷却时间，单位毫秒
		int		groupcd_id;				// 技能组冷却编号
		int 	groupcd_time;			// 技能组冷却时间 单位毫秒
		float	pursue_distance;		// 客户端追击距离，技能施放的目标点到自身的距离限制
		float	cminpray_distance;		// 客户端最小吟唱距离

		int	    showCampGfxTime;		//显示预警光效时间
        int     campGfxType;            //预警光效类型  0:程序指定 1:中立 2:友好 3:敌对
		bool	canforbidbyshape;		//变身后禁用是否生效		
		int		soulskilltype;			//斗魂技能组别

		AString ui_gfx;					//界面特效

	public:
		SkillStub(ID skill_id);
		~SkillStub();

		class skill_stub_map : public abase::hash_map<ID, SkillStub*, abase::_hash_function>
		{
		public:		
			~skill_stub_map()
			{
				SkillStub* pStub = NULL;				
				for (iterator iter = begin(); iter != end(); ++iter)
				{
					pStub = iter->second;
					if (NULL != pStub)
						delete pStub;				
				}
				clear();
			}
		};
		static skill_stub_map& GetMap();
		static const SkillStub *GetStub(ID skill_id);
		static bool InitSkillStub(ID skill_id, CScriptValue& skill_data);
		bool InitSkillStubData(CScriptValue& skill_data);

	public:	
		bool IsCommonSkill() const { return origintype == ORIGIN_LEARN; }
		bool IsTalentSkill() const { return origintype == ORIGIN_TALENT; }

	public:	
		enum
		{
			formula_mp_cost,
			formula_vp_cost,
			formula_ap_cost,
			formula_ep_cost,
			formula_energy1_cost,
			formula_energy2_cost,
			formula_execute_time,
			formula_cooldown_time,
			formula_groupcd_id,
			formula_groupcd_time,
			formula_radius,
			formula_pursue_distance,
			formula_cminpray_distance,
			formula_num,
		};
		bool GetFormulaValue(int index, CScriptValue& sv) const;
		int	GetIntFormulaValue(int index) const;
		float GetFloatFormulaValue(int index) const;
		int	GetMpcost() const { return mask_formulas[formula_mp_cost] ? GetIntFormulaValue(formula_mp_cost) : mp_cost; }
		int	GetVpcost() const { return mask_formulas[formula_vp_cost] ? GetIntFormulaValue(formula_vp_cost) : vp_cost; }
		int	GetApcost() const { return mask_formulas[formula_ap_cost] ? GetIntFormulaValue(formula_ap_cost) : ap_cost; } 
		int GetEpcost() const { return mask_formulas[formula_ep_cost] ? GetIntFormulaValue(formula_ep_cost) : ep_cost; }
		int GetEnergy1cost() const { return mask_formulas[formula_energy1_cost] ? GetIntFormulaValue(formula_energy1_cost) : energy1_cost; }
		int GetEnergy2cost() const { return mask_formulas[formula_energy2_cost] ? GetIntFormulaValue(formula_energy2_cost) : energy2_cost; }
		int GetExecutetime() const { return mask_formulas[formula_execute_time] ? GetIntFormulaValue(formula_execute_time) : execute_time; }
		int GetCooldowntime() const { return mask_formulas[formula_cooldown_time] ? GetIntFormulaValue(formula_cooldown_time) : cooldown_time; }
		int GetGroupcdid() const { return mask_formulas[formula_groupcd_id] ? GetIntFormulaValue(formula_groupcd_id) : groupcd_id; }
		int GetGroupcdtime() const { return mask_formulas[formula_groupcd_time] ? GetIntFormulaValue(formula_groupcd_time) : groupcd_time; }		
		float GetRadius() const { return mask_formulas[formula_radius] ? GetIntFormulaValue(formula_radius) : radius; }		
		float GetPursuedistance() const { return mask_formulas[formula_pursue_distance] ? GetIntFormulaValue(formula_pursue_distance) : pursue_distance; }
		float GetCMinPraydistance() const { return mask_formulas[formula_cminpray_distance] ? GetIntFormulaValue(formula_cminpray_distance) : cminpray_distance; }		

	public:
		int GetTalentList1(int index) const { return 0; }			//天赋前提序列1
		int GetTalentSize1() const { return 0; }					//前提天赋1个数
		int GetTalentSum1() const { return 0; }						//前提天赋序列1的总和

		int GetTalentList2(int index) const { return 0; }			//天赋前提序列2
		int GetTalentSize2() const { return 0; }					//前提天赋2个数
		int GetTalentSum2() const { return 0; }						//前提天赋序列2的总和 

		int GetTalentSp() const { return 0; }						//天赋消耗点数 
		int GetTalentRequiredLevel(int level) const { return 0; }	//天赋学习等级要求 
		int GetTalentRequiredCosmos(int level) const { return 0; }	//天赋学习小宇宙等级需求
		int GetTalentCostExp(int level) const { return 0; }			//天赋学习消耗经验
	};
}


#endif
