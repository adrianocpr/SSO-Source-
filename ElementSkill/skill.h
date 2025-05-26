#ifndef __SKILL_SKILL_H
#define __SKILL_SKILL_H

#pragma warning(disable:4786)
#include "playerwrapper.h"
#include "skillwrapper.h"
#include "skillenum.h"
#include "skillstub.h"

namespace GNET
{

	// Ŀ����������
	enum 
	{
		TARGET_TYPE_NEEDNOTTARGET = 0,		//����Ŀ��
		TARGET_TYPE_NEEDTARGET,				//��ҪĿ��
		TARGET_TYPE_ZOMBIE,					//Ŀ�����ʬ��
		TARGET_TYPE_MASSIVE,				//��ѡĿ��Ⱥ��
		TARGET_TYPE_MASTER,					//��������
		TARGET_TYPE_AREA,					//ѡ������
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
	// ���ܳ�Ա���ݽӿ�
	public:
		Skill(ID skill_id, int lev);
		virtual ~Skill() 
		{
		}

		void Destroy() { delete this; }
		const SkillStub * GetStub() const {	return stub; }
		PlayerWrapper * GetPlayer()  { return &player; }
		float GetRange() { return player.GetRange(); }	

		// ���ܵȼ�����
		enum SKILL_LEVEL_TYPE
		{
			BASE		= 0,	//�����ȼ���ͨ��ѧϰ�ﵽ�ļ���
			ADDON		= 1,	//���ӵȼ�
			COMMON		= 2,	//�����ȼ�
			REAL		= 3,	//ʵ�ʵȼ� = base+addon+common
		};
		int GetSkillLevel(SKILL_LEVEL_TYPE type);
		int SetSkillLevel(SKILL_LEVEL_TYPE type, int);
		int UpdateLevel();
		const wchar_t* GetShowlevel();


	//********************************************************
	// ���ܾ�̬���ݶ�ȡ�ӿ�
	public:
		// ����ID
		ID GetId() const { return stub->id; }
		// ������� 1.��������, 2.����ף��, 3.��������, 4.����, 5.��������, 6.�ϳ�
		char GetType() const { return stub->type; }
		// ������Դ 1.ѧϰ����, 2.�츳����, 3.��������, 4.װ�����Ӽ���
		char GetOrginType() { return stub->origintype; }
		// �Ƿ�Ϊ�츳����
		bool IsTalentSkill() const { return stub->IsTalentSkill(); }
		// Ŀ����������, 0 ����Ŀ�꣬ 1 ��ҪĿ�꣬  2 Ŀ�������ʬ��, 3 ��ѡĿ��Ⱥ��
		int GetTargetType();
		// ��ʹ�ó���
		int GetMapUseable() const { return stub->mapusable; }		
		// ������Χ
		ATTACK_RANGE GetAttackRange() const { return ATTACK_RANGE(stub->rangetype); }
		
		float GetCylinderRadius() const {return stub->cylinderradius;}
		float GetCylinderLength() const {return stub->cylinderlength;}
		float GetSectorRadius() const {return stub->sectorradius;}
		int GetSectorAngle() const {return stub->sectorangle;}

		// 0:�����س��� 1:���س����͹��� 2:���س�����ֻ��ʾ���Լ�����ս���Ĺ���
		int GetHideBackground() { return stub->hidebackground; }

		//��ȡ����Ŀ��
		int GetAffectType() const { return stub->affecttype; }
		//��ȡָ��npc���
		const abase::vector<int>& GetSpecificnpc() const { return stub->specificnpc; }
		// �Ƿ�ʬ��
		bool IsBody() const { return stub->targettype == TARGET_BODY; }
		//��ȡ�������ȼ�
		int GetPriority() const { return stub->priority; }
		// ʹ�ú��Ƿ��Զ�����
		bool IsAutoAttack() { return stub->autoattack == 0; }
		// ˲������
		bool IsInstant() { return stub->timetype == TIME_INSTANT; }
		// �Ƿ�ͨ������
		bool IsChannel() { return stub->barshow == BAR_SHOW_CHANNEL; }
		// �Ƿ�ťʽͨ������
		bool IsBtnChannel() { return stub->barshow == BAR_SHOW_BTN_CHANNEL; }
		// �Ƿ���������
		bool IsCharge() { return stub->barshow == BAR_SHOW_CHARGE; }
		// �Ƿ�С���漼��
		bool IsMicrocosm() { return stub->extraflag == SKILL_EXTRA_FLAG_MICROCOSM; }
		// �Ƿ���ʾ����������
		bool IsShowNpcPrayingBar() { return stub->extraflag == SKILL_EXTRA_FLAG_NPC_PRAY; }
		// �Ƿ�Ͷ������
		bool IsCast() { return stub->extraflag == SKILL_EXTRA_FLAG_CAST; }
		// �Ƿ�ˤ����
		bool IsHug() { return stub->extraflag == SKILL_EXTRA_FLAG_HUG; }
		// �Ƿ񶨵㱧ˤ/Ͷ��
		bool IsFixCast() const { return stub->fixcast != 0; }
		// �Ƿ���ʾ������
		bool IsShowBootBar() { return stub->bootbar; }
		// �Ƿ����ж�
		bool IsSelfInterrupt() { return stub->selfinterrupt; }
		// �Ƿ��ƶ��ж�
		bool IsMoveInterrupt() { return stub->moveinterrupt; }
		// �Ƿ����س���
		bool IsHideBackground() { return stub->hidebackground != 0; }
		// ���γ�Ĭ�Ƿ����
		bool IsDizzyUsable() { return stub->dizzyusable; }
		// �Ƿ�������������
		bool IsConditionTrigger() { return stub->usetype == MODE_CONDITION; }
		//0���� 1��ʾְҵ������ 2��ʾ���츳������ 3��ʾ��XP������ 4��ʾ�ڱ��������� 5��ʾ�ڳ��＼����	        
		char GetShowType() { return stub->showtype; }
		// ��ȡ����ʩ�ſ���״̬����
		int GetCanUseStateMask() { return stub->statecondition; }
		// ��ȡ����ʩ�Ų�����״̬����
		int GetCannotUseStateMask() { return 0; }
		// ʹ���б�������
		int GetShapeLimit() { return stub->shape_limit; }
		// �Ƿ�����Զ�����
		bool IsPetAuto() { return stub->extraflag == SKILL_EXTRA_FLAG_PETAUTO; }
		// ��ȡʩ�ż��ܶ�����״̬��Ҫ��
		virtual int GetSelfCondition() { return stub->selfcondition; }
		// ��ȡ�����ƶ���ʽ
		MOVE_MODE GetMoveMode() const { return MOVE_MODE(stub->movemode); }
		// ��ȡ�����ƶ�������ʽ
		MOVE_STYLE GetMoveStyle() const { return MOVE_STYLE(stub->movestyle); }
		// ��ȡ�����ƶ�����
		float GetMoveDistance() const { return stub->movefix; }
		// ��ȡ�����ƶ��ӳ�
		int GetMoveDelay() const { return stub->movedelay; }
		// ��ȡ����ʩ�ž���
		float GetCastDistance() const { return stub->castdistance; }
		// ��ȡ����ʩ��ʱ��
		int GetCastTime() const { return stub->casttime; }
		// ��ȡ����ְҵ����
		int GetProfession() const { return stub->profession; }
		// ��ȡ���ܿ���״̬��ID
		int GetCanUseFilterId() { return stub->canusefilterid; }
		// ��ȡ���ܲ�����״̬��ID
		int GetCannotUseFilterId() { return stub->cannotusefilterid; }
		// ��ȡ���ܶ�������Ҫ��
		int GetWeaponRequired() { return stub->weaponrequired; }
		// ��ȡ�������ȼ�
		int GetMaxLevel()  { return stub->maxlevel; }
		//���˲ʱ���ܹ�Чid
		int GetInstanteGfxId() const {return stub->instanteGfx_Id;}
		// ʹ����Ҫhp,mp�İٷֱ�����; �������: condition �������ƣ� ratio ���� 
		void GetOtherCondition(char &condition, float &ratio) { condition = stub->othercondition; ratio = stub->other_ratio; }
		// ʹ����Ҫitem(��Ʒ) ����ֵΪ0��ʾ����Ҫ������Ʒ
		int GetRequiredItemId() { return stub->goods_id; }
		// ʹ�ü�����Ҫ����Ʒ����
		int GetRequiredItemNum() { return stub->goods_num; }		
		// ��ȡ����ִ�ж���
		int GetProcedureNum() const { return stub->procedure_num; }
		// ����ִ�ж�Combo
		int GetProcedureTime(size_t index) const { return stub->procedure_time.size() >= index ? stub->procedure_time[index - 1] : 0; }
		// ��ȡִ�жκ���ʱ�䣨0 ~ num-1��
		bool GetProcedureCombo(size_t index) const { return stub->procedure_combo.size() >= index ? stub->procedure_combo[index - 1] > 0 : false; }
		// ��ʾԤ����Чʱ��
		int GetShowCampGfxTime() const {return stub->showCampGfxTime;}
        // Ԥ����Ч����  0:����ָ�� 1:���� 2:�Ѻ� 3:�ж�
        int GetCampGfxType() const {return stub->campGfxType;}
		// �Ƿ�������
		bool IsForbidByShape() const {return stub->canforbidbyshape;}
		//��ȡ���꼼�����
		int GetSoulSkillType() const {return stub->soulskilltype;}
		//�Ƿ񶷻꼼��
		bool IsSoulSkill() const {return stub->soulskilltype>0;}
		//������Ч
		const char* GetUiGfx() const {return stub->ui_gfx;}

	//********************************************************
	// ����ʹ������
	public:
		enum CONDTION_CHECK_RET
		{
			CCR_OK					= 0,	//�����ж�ͨ��	
			CCR_MP_LACK				= -1,	//MP����
			CCR_AP_LACK				= -2,	//AP����
			CCR_VP_LACK				= -3,	//VP����
			CCR_ITEM_LACK			= -4,	//��Ʒȱ��
			CCR_MASK_UNFIT			= -5,	//״̬���벻��
			CCR_SHAPE_LIMIT			= -6,	//��������
			CCR_HP_LT_RATIO			= -7,	//hp����maxhp�İٷֱ�
			CCR_HP_GT_RATIO			= -8,	//hp����maxhp�İٷֱ�
			CCR_MP_LT_RATIO			= -9,	//mp����maxmp�İٷֱ�
			CCR_MP_GT_RATIO			= -10,	//mp����maxmp�İٷֱ�
			CCR_WEAPON_UNFIT		= -11,	//����װ������
			CCR_TARGET_UNFIT		= -12,	//Ŀ�겻��
			CCR_USABLE_BUFF_UNFIT	= -13,	//����״̬��ID����
			CCR_UNUSABLE_BUFF_UNFIT	= -14,	//������״̬��ID����
			CCR_EP_LACK				= -15,  //EP����
			CCR_SHAPE_FORBID_PROF	= -16,	//����״̬����ְҵ����
			CCR_ENERGY1_LACK		= -17,	//ְҵ����1����
			CCR_ENERGY2_LACK		= -18,	//ְҵ����2����
			CCR_MAP_UNUSEABLE		= -19,	//��ʹ�ó�������
			CCR_ADSORPTION_LIMIT	= -20,	//�Ҽ�����
			CCR_FIGHT_DISABLE		= -21,	//ս��״̬���Ƿ����
			CCR_PROFESSION_UNMATCH	= -22,	//ְҵ����
			CCR_SOUL_SKILL_NOACTIVE	= -23,	//���꼼��δ����
			CCR_ORIGINAL_SKILL_NO_BURST = -24,//С����δ�����޷�ʹ��
			CCR_BATTLE_DISABLE		= -25,	//ս��״̬���Ƿ����
		};
		CONDTION_CHECK_RET Condition(UseRequirement& info);
	

	//********************************************************
	// ���ܹ�ʽ���ݶ�ȡ�ӿ�
	public:
		// ʹ����ҪMP(ħ��)
		int GetMpCost() { return stub->GetMpcost(); }
		// ʹ����ҪVP(����)		
		int GetVpCost() { return stub->GetVpcost(); }
		// ʹ����ҪAP(ŭ��)
		int GetApCost()	{ return stub->GetApcost(); }
		// ʹ����ҪEP(����)
		int GetEpCost() { return stub->GetEpcost(); }	
		// ʹ����ҪENERGY1(ְҵ����1)
		int GetEnergy1Cost() { return stub->GetEnergy1cost(); }
		// ʹ����ҪENERGY2(ְҵ����2)
		int GetEnergy2Cost() { return stub->GetEnergy2cost(); }
		// ����ִ��ʱ�䣬��λ����
		int GetExecuteTime() { return stub->GetExecutetime(); }
		// ������ȴʱ�䣬��λ����
		int GetStubCoolingTime() { return stub->GetCooldowntime(); }
		// ��������ȴ���
		int GetGroupCoolingID() { return stub->GetGroupcdid(); }
		// ��������ȴʱ�� ��λ����
		int GetGroupCoolingTime() { return stub->GetGroupcdtime(); }		
		// ���ܹ�����Χ �뾶
		virtual float GetRadius() { return stub->GetRadius(); }		
		// ׷������
		float GetPersueDistance() 
		{
			if(stub->rangetype==RANGE_POINT || stub->rangetype==RANGE_SELFBALL)
				return -1;
			else
				return stub->GetPursuedistance(); 
		}
		// �ͻ�����С��������
		float GetCMinPrayDistance() { return stub->GetCMinPraydistance(); }		
	};
}


#endif

