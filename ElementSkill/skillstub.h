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
		ID      id;						// ����ID  
		AString	icon;					// ͼ��	

		char    type;					// ��������
		char    usetype;				// ����ʹ�÷�ʽ
		char    origintype;				// ������Դ  
		char    showtype;				// ��ʾ��ʽ 
		int     affecttype;             // ��Ч����
		int		profession;				// ְҵ����
		ARRAY   specificnpc;            // ָ��npc
		int     priority;				// ���ȼ�
		char	hidebackground;			// �Ƿ����س���
		char    timetype;				// ʱ������
		char    barshow;				// ʱ������ʾ��ʽ
		char    extraflag;				// ���ܶ����ʾ 
		char	fixcast;				// ���㱧ˤ/Ͷ��
		char	movemode;				// �ƶ���ʽ	
		char	movestyle;				// �ƶ���ʽ ��ͨ(0) ����(1)
		float	movefix;				// �ƶ���������
		int		movedelay;				// �ƶ��ӳ�
		float	castdistance;			// ��ˤ/Ͷ������
		int     casttime;				// Ͷ��ʱ�䣨���룩

		int     maxlevel;				// ������󼶱�
		int     talentmaxlearn;			// �츳���ѧϰ����

		char    autoattack;				// �Զ�����

		char    rangetype;				// ���÷�Χ

		float	radius;					// ���ܹ�����Χ �뾶	
		float	cylinderradius;			//Բ���뾶
		float	cylinderlength;			//Բ������
		float	sectorradius;			//���ΰ뾶
		int		sectorangle;			//�����Ž�

		bool    moveinterrupt;			// �Ƿ��ƶ��ж�
		bool	selfinterrupt;			// �Ƿ��ƶ����ж�
		bool	bootbar;				// �Ƿ���ʾ������

		char    selfcondition;			// �������� 
		char    targettype;				// Ŀ����������

		char    delaymode;				// ��ʱ��ʽ  
		int     delaytime;				// ��ʱʱ��
		int     flyspeed;				// �����ٶ�

		int     statecondition;			// ״̬ʩ������ 
		int		canusefilterid;			// ����״̬��ID
		int		cannotusefilterid;		// ������״̬��ID
		bool    fightusable;			// ս��״̬���Ƿ����
		bool    dizzyusable;			// ����״̬���Ƿ���� 
		int		weaponrequired;			// ����ʩ����������		
		char	othercondition;			// hp, mp��������Ҫ��
		float	other_ratio;			// hp, mpҪ��ı���
		int 	shape_limit;			// �����ͷż��ܵı���״̬
		int		goods_id;				// ʹ����Ҫitem(��Ʒ) ����ֵΪ0��ʾ����Ҫ������Ʒ
		int		goods_num;				// ʹ����Ҫ��Ʒ������
		int		mapusable;				// ��ʹ�ó���

		int		instanteGfx_Id;			//˲����ЧGfxId

		int		procedure_num;			// ����ִ�ж���
		ARRAY	procedure_combo;		// ����ִ�ж�Combo
		ARRAY	procedure_time;			// ����ִ�жκ���ʱ�䣨0 ~ num-1��

		ARRAY	mask_formulas;			// ʹ�ù�ʽ��־
		int		mp_cost;				// ʹ����ҪMP(ħ��)
		int		vp_cost;				// ʹ����ҪVP(����)
		int 	ap_cost;				// ʹ����ҪAP(ŭ��)
		int		ep_cost;				// ʹ����ҪEP(����)
		int		energy1_cost;			// ʹ����ҪENERGY1(ְҵ����1)
		int		energy2_cost;			// ʹ����ҪENERGY2(ְҵ����2)		
		int		execute_time;			// ����ִ��ʱ�䣬��λ����
		int		cooldown_time;			// ������ȴʱ�䣬��λ����
		int		groupcd_id;				// ��������ȴ���
		int 	groupcd_time;			// ��������ȴʱ�� ��λ����
		float	pursue_distance;		// �ͻ���׷�����룬����ʩ�ŵ�Ŀ��㵽����ľ�������
		float	cminpray_distance;		// �ͻ�����С��������

		int	    showCampGfxTime;		//��ʾԤ����Чʱ��
        int     campGfxType;            //Ԥ����Ч����  0:����ָ�� 1:���� 2:�Ѻ� 3:�ж�
		bool	canforbidbyshape;		//���������Ƿ���Ч		
		int		soulskilltype;			//���꼼�����

		AString ui_gfx;					//������Ч

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
		int GetTalentList1(int index) const { return 0; }			//�츳ǰ������1
		int GetTalentSize1() const { return 0; }					//ǰ���츳1����
		int GetTalentSum1() const { return 0; }						//ǰ���츳����1���ܺ�

		int GetTalentList2(int index) const { return 0; }			//�츳ǰ������2
		int GetTalentSize2() const { return 0; }					//ǰ���츳2����
		int GetTalentSum2() const { return 0; }						//ǰ���츳����2���ܺ� 

		int GetTalentSp() const { return 0; }						//�츳���ĵ��� 
		int GetTalentRequiredLevel(int level) const { return 0; }	//�츳ѧϰ�ȼ�Ҫ�� 
		int GetTalentRequiredCosmos(int level) const { return 0; }	//�츳ѧϰС����ȼ�����
		int GetTalentCostExp(int level) const { return 0; }			//�츳ѧϰ���ľ���
	};
}


#endif
