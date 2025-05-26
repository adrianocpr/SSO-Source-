#include "ElementSkill.h"
#include "skillwrapper.h"
#include "skillkeeper.h"


#pragma warning (disable: 4005)


namespace GNET
{
	int ElementSkill::GetVersion()
	{
		return 8;
	}

	LEARN_CHECK_RET ElementSkill::LearnCondition(ID id, LearnRequirement& info, int ilevel )
	{
		SkillKeeper s = new Skill(id, ilevel);
		if (!s) return LCR_INVALID_ID;

		const SkillStub * stub = s->GetStub();

		//学习技能，学习判断条件写在模板里
		if (stub->IsCommonSkill())
		{
			return LCR_OK;
		}
		else if (stub->IsTalentSkill())
		{
			if (ilevel<1 || ilevel> stub->talentmaxlearn || ilevel>stub->maxlevel)
			{
				return LCR_LEARN_LVL_UNFIT;
			}

			if (info.level < stub->GetTalentRequiredLevel(ilevel))
			{
				return  LCR_REQ_LVL_UNFIT; 
			}

			int sum = 0;
			int i = stub->GetTalentSize1();
			for ( ; i>0; --i)
			{	
				sum +=  SkillWrapper::Instance()->GetLevel(stub->GetTalentList1(i));
			}
			if (sum < stub->GetTalentSum1())
			{
				return LCR_PRE_TALENT_UNFIT;
			}

			sum = 0;
			i = stub->GetTalentSize2();
			for ( ; i>0; --i)
			{	
				sum +=  SkillWrapper::Instance()->GetLevel(stub->GetTalentList2(i));
			}
			if (sum < stub->GetTalentSum2())
			{
				return LCR_PRE_TALENT_UNFIT;
			}

			if (info.talent < stub->GetTalentSp())
			{
				return LCR_TALENT_SP_LACK;
			}
		}
		else
		{
			return LCR_CANNOT_LEARN;
		}
		return LCR_OK;
	}

	const char* ElementSkill::GetIcon(ID id)
	{
		const SkillStub * s = SkillStub::GetStub(id);
		if (s) return s->icon;
		return "";
	}

	int ElementSkill::GetAttackRange(ID id)
	{
		const SkillStub * s = SkillStub::GetStub(id);
		if (s) return s->rangetype;
		return -1;
	}

	bool ElementSkill::IsCommonSkill(ID id)
	{
		const SkillStub * s = SkillStub::GetStub(id);
		if (s) return MODE_AUTO == s->usetype;
		return false;
	}

	char ElementSkill::GetType(ID id)
	{
		const SkillStub * s = SkillStub::GetStub(id);
		if (s != NULL) return s->type;
		return 0;
	}

	ID ElementSkill::NextSkill(ID start)
	{
		SkillStub::skill_stub_map& m = SkillStub::GetMap();
		SkillStub::skill_stub_map::iterator it; 
		if (start == 0 )
		{
			it = m.begin();
		}
		else
		{
			it = m.find(start);
			++it;
		}

		if (it == m.end())
		{
			return 0;
		}
		else
		{
			return it->second->id;
		}
	}

	bool ElementSkill::SkillDizzyUsable(ID id)
	{
		const SkillStub * stub = SkillStub::GetStub(id);
		return stub? stub->dizzyusable : false;
	}

	int ElementSkill::GetExecuteTime(ID id, int level)
	{
		SkillKeeper s = new Skill(id, level);
		if (!s)	return 0;
		return s->GetExecuteTime(); 
	}

	int ElementSkill::RequirePlayerLevel(ID id, int ilevel)
	{
		SkillKeeper s = new Skill(id, ilevel);
		if (!s) return -1;

		const SkillStub * stub = s->GetStub();
		if(ilevel < 1 || ilevel > stub->talentmaxlearn || ilevel > stub->maxlevel)
		{
			return -1;
		}
		if(stub->origintype==ORIGIN_TALENT)
		{
			return stub->GetTalentRequiredLevel(ilevel);
		}
		return -1;
	}

	int ElementSkill::SkillMaxLevel(ID id)
	{
		const SkillStub* stub = SkillStub::GetStub(id);
		if (!stub) return -1;
		if (stub->origintype != ORIGIN_LEARN && stub->origintype != ORIGIN_TALENT) 
		{
			return -1;
		}
		return stub->maxlevel;
	}


	int ElementSkill::TalentMaxLearnLevel(ID id)
	{
		const SkillStub* stub = SkillStub::GetStub(id);
		if (!stub || stub->origintype!=ORIGIN_TALENT) return -1;
		return stub->talentmaxlearn;
	}

	int ElementSkill::GetTalentSum()
	{
		return SkillWrapper::Instance()->GetTalentSum();
	}

	int ElementSkill::GetTalentSize1(ID id)
	{
		const SkillStub * stub = SkillStub::GetStub(id);
		if (!stub) return -1;
		return stub->GetTalentSize1();
	}

	int ElementSkill::GetTalentList1(ID id, int index)
	{
		const SkillStub * stub = SkillStub::GetStub(id);
		if (!stub) return -1;

		return stub->GetTalentList1(index);
	}

	int ElementSkill::GetTalentSum1(ID id)
	{
		const SkillStub * stub = SkillStub::GetStub(id);
		if (!stub) return -1;

		return stub->GetTalentSum1();
	}

	int ElementSkill::GetTalentSize2(ID id)
	{
		const SkillStub * stub = SkillStub::GetStub(id);
		if (!stub) return -1;

		return stub->GetTalentSize2();
	}

	int ElementSkill::GetTalentList2(ID id, int index)
	{
		const SkillStub * stub = SkillStub::GetStub(id);
		if (!stub) return -1;

		return stub->GetTalentList2(index);
	}

	int ElementSkill::GetTalentSum2(ID id)
	{
		const SkillStub * stub = SkillStub::GetStub(id);
		if (!stub) return -1;

		return stub->GetTalentSum2();
	}

	int ElementSkill::GetTalentRequiredCosmos(ID id, int level)
	{
		const SkillStub * stub = SkillStub::GetStub(id);
		if (!stub) return -1;
		return stub->GetTalentRequiredCosmos(level);
	}

	int ElementSkill::GetTalentCostExp(ID id, int level)
	{
		const SkillStub * stub = SkillStub::GetStub(id);
		if (!stub) return -1;
		return stub->GetTalentCostExp(level);
	}


	void ElementSkill::LoadSkillData(void * pvNormalSkills,void* pvSoulSkills)
	{
		SkillWrapper::Instance()->LoadData((abase::vector<Normal_SKILL>*)pvNormalSkills,
			(abase::vector<Soul_Skill_Entry>*)pvSoulSkills);
	}

	int ElementSkill::SetLevel(ID id, int level)
	{
		return SkillWrapper::Instance()->SetLevel(id, level);
	}

	void ElementSkill::AddBuffLevel(int buffid, int buff_level)
	{
		PlayerWrapper::AddBuffLevel(buffid, buff_level);
	}

	void ElementSkill::RemoveBuffLevel(int buffid)
	{
		PlayerWrapper::RemoveBuffLevel(buffid);
	}

}
