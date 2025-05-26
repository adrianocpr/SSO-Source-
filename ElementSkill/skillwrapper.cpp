#include "skillwrapper.h"
#include "skill.h"

namespace GNET
{

	SkillWrapper SkillWrapper::instance;

	SkillWrapper::SkillWrapper():commonlevel(0)
	{
	}

	SkillWrapper::~SkillWrapper()
	{
		map.clear();
	}

	void SkillWrapper::LoadData(abase::vector<Normal_SKILL>* pvNormalSkills,abase::vector<Soul_Skill_Entry>* pvSoulSkills)
	{
		map.clear();
		PersistentData skill;
		if(pvNormalSkills!=NULL)
		{
			for (size_t i=0; i < pvNormalSkills->size(); ++i)
			{
				const Normal_SKILL& item = pvNormalSkills->at(i);
				skill.level = item.level;
				map[item.id_skill] = skill;
			}
		}
		if(pvSoulSkills!=NULL)
		{
			for(size_t i=0;i<pvSoulSkills->size();++i)
			{
				const Soul_Skill_Entry& item= pvSoulSkills->at(i);
				skill.level = item.level;
				map[item.id] = skill;
			}
		}
	}

	int  SkillWrapper::GetLevel(unsigned int id)
	{
		StorageMap::iterator it = map.find(id);
		if(it != map.end() )
			return it->second.level;
		return 0;
	}

	int  SkillWrapper::SetLevel(unsigned int id, int level)
	{
		map[id].level = level;
		return level;
	}

	int	 SkillWrapper::GetTalentSum()
	{
		int sum = 0;
		for (StorageMap::iterator it=map.begin(), ie=map.end(); it!=ie; ++it)
		{
			const SkillStub* stub = SkillStub::GetStub(it->first);
			if (stub!=NULL && stub->IsTalentSkill())
			{
				sum += it->second.level;
			}
		}
		return sum;
	}
}
