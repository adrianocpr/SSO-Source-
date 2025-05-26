#ifndef __SKILL_SKILLWRAPPER_H
#define __SKILL_SKILLWRAPPER_H

#pragma warning(disable:4786)
#include <hashmap.h>

namespace GNET
{

#pragma pack(1)

	struct PersistentData
	{
		int level;      // »ù´¡¼¶±ð

		PersistentData(int _t = 0, int _l = 1) : level(_l){ }
	};

	typedef abase::hash_map<unsigned int, PersistentData, abase::_hash_function> StorageMap;

	struct Normal_SKILL
	{
		short id_skill;
		unsigned char level;
	};

	struct Soul_Skill_Entry 
	{ 
		int id, level,profression; 
	};
#pragma pack()

	class SkillWrapper
	{
		StorageMap map;
		SkillWrapper();
		static SkillWrapper instance;
		int commonlevel;
	public:
		static SkillWrapper* Instance() { return &instance; }
		~SkillWrapper();
		void LoadData(abase::vector<Normal_SKILL>* pvNormalSkills,abase::vector<Soul_Skill_Entry>* pvSoulSkills);
		int  GetLevel(unsigned int id);
		int  SetLevel(unsigned int id, int level);
		int	 GetTalentSum();
		void SetCommonLevel(int n) { commonlevel = n; }
		int  GetCommonLevel() { return commonlevel; }
	};

}

#endif

