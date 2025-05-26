#ifndef __ELEMENT_SKILL_H
#define __ELEMENT_SKILL_H

#include "skill.h"
#include "skillstub.h"
#include "skillenum.h"
#include "playerwrapper.h"


namespace GNET
{
	// 配置
	enum 
	{
		SKILL_CD_ID_OFFSET = 1024,
		GROUP_CD_ID_OFFSET = 100000, 
		MOUNT_ACTION_OFFSET	= 10,
	};

	enum LEARN_CHECK_RET
	{
		LCR_OK					= 0,	//成功
		LCR_INVALID_ID			= -1,	//无效技能ID
		LCR_LEARN_LVL_UNFIT		= -2,	//技能学习的等级无效
		LCR_REQ_LVL_UNFIT		= -3,	//天赋学习需求等级不满足
		LCR_PRE_TALENT_UNFIT	= -4,	//前提天赋加点不满足
		LCR_TALENT_SP_LACK		= -5,	//天赋点数不足
		LCR_CANNOT_LEARN		= -6,	//不可学习的技能类别
	};


	class ElementSkill
	{
	public:				
		struct LearnRequirement
		{
			int level;			//玩家级别
			int talent;			//天赋点数
		};
		static LEARN_CHECK_RET LearnCondition(ID id, LearnRequirement& info, int baselevel); 
 		
	public:
		// 获取技能版本
		static int GetVersion();

		// 获取技能（天赋） 最大级别; 返回-1表示错误;
		static int SkillMaxLevel(ID id);
		// 技能可否在击晕、沉默状态下使用
		static bool SkillDizzyUsable(ID id);		
		// 遍历技能数据 
		//ToDo：由于现在技能不是全加载，遍历的只是已有的技能，这部分有待亚东处理 [3/9/2013 wangliang]
		static ID NextSkill(ID id = 0);
		// 是否普通攻击技能
		static bool IsCommonSkill(ID id);
		// 获取技能类型, type
		static char GetType(ID id); 
		static int GetAttackRange(ID id);
		// 获取技能图标
		static const char* GetIcon(ID id);
		// 获取技能执行时间
		static int GetExecuteTime(ID id, int level);		
		// 获取学习第level级天赋时，要求的玩家等级; 返回-1 表示错误；
		static int RequirePlayerLevel(ID id, int level);
		//获取天赋最大学习级别（加点上限）; 返回-1表示错误;
		static int TalentMaxLearnLevel(ID id);	
		//获取玩家天赋技能等级和
		static int GetTalentSum();
		//获取技能前提天赋序列1，id 技能id， index 序列索引(从1开始); 返回-1表示错误;
		static int GetTalentSize1(ID id);
		//获取技能前提天赋序列1，id 技能id， index 序列索引(从1开始); 返回-1表示错误;
		static int GetTalentList1(ID id, int index);
		//获取技能前提天赋序列1 所需加点总和；返回-1表示错误;
		static int GetTalentSum1(ID id);
		//获取技能前提天赋序列2，id 技能id， index 序列索引(从1开始); 返回-1表示错误;
		static int GetTalentSize2(ID id);
		//获取技能前提天赋序列2，id 技能id， index 序列索引(从1开始); 返回-1表示错误;
		static int GetTalentList2(ID id, int index);
		//获取技能前提天赋序列2 所需加点总和；返回-1表示错误;
		static int GetTalentSum2(ID id);
		//天赋学习小宇宙等级需求
		static int GetTalentRequiredCosmos(ID id, int level);
		//天赋学习消耗经验
		static int GetTalentCostExp(ID id, int level);		

		// 加载玩家技能数据
		static void LoadSkillData(void * pvNormalSkills,void* pvSoulSkills);		
		// 设置技能等级
		static int SetLevel(ID id, int baselevel);
		// 设置buff等级
		static void AddBuffLevel(int buffid, int buff_level);
		// 移除buff等级
		static void RemoveBuffLevel(int buffid);
	};

}

#endif
