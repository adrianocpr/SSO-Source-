#ifndef __ELEMENT_SKILL_H
#define __ELEMENT_SKILL_H

#include "skill.h"
#include "skillstub.h"
#include "skillenum.h"
#include "playerwrapper.h"


namespace GNET
{
	// ����
	enum 
	{
		SKILL_CD_ID_OFFSET = 1024,
		GROUP_CD_ID_OFFSET = 100000, 
		MOUNT_ACTION_OFFSET	= 10,
	};

	enum LEARN_CHECK_RET
	{
		LCR_OK					= 0,	//�ɹ�
		LCR_INVALID_ID			= -1,	//��Ч����ID
		LCR_LEARN_LVL_UNFIT		= -2,	//����ѧϰ�ĵȼ���Ч
		LCR_REQ_LVL_UNFIT		= -3,	//�츳ѧϰ����ȼ�������
		LCR_PRE_TALENT_UNFIT	= -4,	//ǰ���츳�ӵ㲻����
		LCR_TALENT_SP_LACK		= -5,	//�츳��������
		LCR_CANNOT_LEARN		= -6,	//����ѧϰ�ļ������
	};


	class ElementSkill
	{
	public:				
		struct LearnRequirement
		{
			int level;			//��Ҽ���
			int talent;			//�츳����
		};
		static LEARN_CHECK_RET LearnCondition(ID id, LearnRequirement& info, int baselevel); 
 		
	public:
		// ��ȡ���ܰ汾
		static int GetVersion();

		// ��ȡ���ܣ��츳�� ��󼶱�; ����-1��ʾ����;
		static int SkillMaxLevel(ID id);
		// ���ܿɷ��ڻ��Ρ���Ĭ״̬��ʹ��
		static bool SkillDizzyUsable(ID id);		
		// ������������ 
		//ToDo���������ڼ��ܲ���ȫ���أ�������ֻ�����еļ��ܣ��ⲿ���д��Ƕ����� [3/9/2013 wangliang]
		static ID NextSkill(ID id = 0);
		// �Ƿ���ͨ��������
		static bool IsCommonSkill(ID id);
		// ��ȡ��������, type
		static char GetType(ID id); 
		static int GetAttackRange(ID id);
		// ��ȡ����ͼ��
		static const char* GetIcon(ID id);
		// ��ȡ����ִ��ʱ��
		static int GetExecuteTime(ID id, int level);		
		// ��ȡѧϰ��level���츳ʱ��Ҫ�����ҵȼ�; ����-1 ��ʾ����
		static int RequirePlayerLevel(ID id, int level);
		//��ȡ�츳���ѧϰ���𣨼ӵ����ޣ�; ����-1��ʾ����;
		static int TalentMaxLearnLevel(ID id);	
		//��ȡ����츳���ܵȼ���
		static int GetTalentSum();
		//��ȡ����ǰ���츳����1��id ����id�� index ��������(��1��ʼ); ����-1��ʾ����;
		static int GetTalentSize1(ID id);
		//��ȡ����ǰ���츳����1��id ����id�� index ��������(��1��ʼ); ����-1��ʾ����;
		static int GetTalentList1(ID id, int index);
		//��ȡ����ǰ���츳����1 ����ӵ��ܺͣ�����-1��ʾ����;
		static int GetTalentSum1(ID id);
		//��ȡ����ǰ���츳����2��id ����id�� index ��������(��1��ʼ); ����-1��ʾ����;
		static int GetTalentSize2(ID id);
		//��ȡ����ǰ���츳����2��id ����id�� index ��������(��1��ʼ); ����-1��ʾ����;
		static int GetTalentList2(ID id, int index);
		//��ȡ����ǰ���츳����2 ����ӵ��ܺͣ�����-1��ʾ����;
		static int GetTalentSum2(ID id);
		//�츳ѧϰС����ȼ�����
		static int GetTalentRequiredCosmos(ID id, int level);
		//�츳ѧϰ���ľ���
		static int GetTalentCostExp(ID id, int level);		

		// ������Ҽ�������
		static void LoadSkillData(void * pvNormalSkills,void* pvSoulSkills);		
		// ���ü��ܵȼ�
		static int SetLevel(ID id, int baselevel);
		// ����buff�ȼ�
		static void AddBuffLevel(int buffid, int buff_level);
		// �Ƴ�buff�ȼ�
		static void RemoveBuffLevel(int buffid);
	};

}

#endif
