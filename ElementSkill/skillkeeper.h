#ifndef __SKILL_KEEEPER_H
#define __SKILL_KEEEPER_H

#include "skill.h"



namespace GNET
{
	typedef Skill* SkillPTR;

	class SkillKeeper
	{               
		Skill* pointer;
		SkillKeeper() : pointer(NULL) {}
	public: 
		SkillKeeper(Skill* p) : pointer(p)
		{}  

		~SkillKeeper()  
		{       
			if (pointer)
				delete pointer;
		}

		Skill* operator -> ()
		{
			return pointer;
		}

		operator SkillPTR ()
		{
			return pointer;
		}

		SkillKeeper& operator = (Skill* p)
		{
			if (pointer) pointer->Destroy();
			pointer = p;
			return *this;
		}
	};

}


#endif

