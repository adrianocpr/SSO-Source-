#include "skill.h"
#include "windows.h"
#include <algorithm>
#include "Log\log.h"
namespace GNET
{
	PlayerWrapper::BuffLevelMap PlayerWrapper::bufflevels;

	Skill::Skill(ID skill_id, int lev)
	{
		stub = SkillStub::GetStub(skill_id);
		if(NULL == stub)
		{
			LOG_SKILL(L"Skill construct fail:id = %d,lev = %d\n",skill_id,lev);
			stub = SkillStub::GetStub(1);
		}
		if (NULL == stub)
		{
			ASSERT(0);
			return;
		}
		SetSkillLevel(BASE, 0);
		SetSkillLevel(ADDON, 0);

		int max = stub->maxlevel;
		lev = lev > max ? max : lev;
		SetSkillLevel(BASE, lev);
	}


	int Skill::UpdateLevel()
	{
		if(0 == baselevel)
		{
			reallevel = 0;
		}
		else
		{
			reallevel = baselevel + addon + SkillWrapper::Instance()->GetCommonLevel();
			if((int)reallevel > stub->maxlevel)
				reallevel = stub->maxlevel;
		}
		return reallevel;
	}


	int Skill::GetSkillLevel(SKILL_LEVEL_TYPE type)
	{
		switch (type)
		{
		case BASE:
			return baselevel;
		case ADDON:
			return addon;
		case COMMON:
			return SkillWrapper::Instance()->GetCommonLevel();
		case REAL:
			return reallevel;
		default:
			return 0;
		}
	}


	int Skill::SetSkillLevel(SKILL_LEVEL_TYPE type, int level)
	{
		switch (type)
		{
		case BASE:
			baselevel = level;
			break;
		case ADDON:
			addon = level;
			break;
		case COMMON:
			SkillWrapper::Instance()->SetCommonLevel(level);
			break;
		default:
			break;
		}
		return UpdateLevel();
	}


	const wchar_t* Skill::GetShowlevel()
	{
		static wchar_t buffer[16];
		if(reallevel!=baselevel)
			_snwprintf(buffer, 64, L"%d+%d", baselevel, reallevel-baselevel);
		else
			_snwprintf(buffer, 64, L"%d", baselevel);
		return buffer;
	}


	int Skill::GetTargetType()
	{
		if(stub->targettype == TARGET_BODY)
		{
			return TARGET_TYPE_ZOMBIE;
		}

		if (stub->rangetype == RANGE_AREA)
		{
			return TARGET_TYPE_AREA;
		}

		if(stub->type==TYPE_ATTACK || stub->type==TYPE_CURSE)
		{
			if(stub->rangetype>=RANGE_POINT && stub->rangetype<=RANGE_SELFBALL)
				return TARGET_TYPE_MASSIVE;
			return TARGET_TYPE_NEEDTARGET;
		}

		if(stub->rangetype>=RANGE_POINT && stub->rangetype<=RANGE_SELFBALL)
			return TARGET_TYPE_NEEDNOTTARGET;

		if (stub->rangetype==RANGE_MASTER)
			return TARGET_TYPE_MASTER;

		return TARGET_TYPE_NEEDTARGET;
	}


	Skill::CONDTION_CHECK_RET Skill::Condition(UseRequirement& info)
	{
		//将UseRequirement的数值设置到player中
		GetPlayer()->SetData(info);

		int prof = GetPlayer()->GetCurPorfession();
		if ((stub->profession & ( 1<< (prof-1) ) ) == 0)
		{
			return CCR_PROFESSION_UNMATCH;
		}

		if (info.mp < GetMpCost())
		{
			return CCR_MP_LACK;
		}

		if (GetApCost()<0 && info.ap<(-GetApCost()))
		{
			return CCR_AP_LACK;
		}

		if (info.vp < GetVpCost())
		{
			return CCR_VP_LACK;
		}

		if (GetEnergy1Cost()>0 && info.energy[0]<GetEnergy1Cost())
		{
			return CCR_ENERGY1_LACK;
		}

		if (GetEnergy2Cost()>0 && info.energy[1]<GetEnergy2Cost())
		{
			return CCR_ENERGY2_LACK;
		}

		if (info.item_id != 0 && info.item_amount < GetRequiredItemNum())
		{
			return CCR_ITEM_LACK;
		}

		//击晕，沉默状态，浮空
		if (info.state_mask & ((1<<12) | (1<<13) | (1<<15)))
		{
			if (!IsDizzyUsable())
			{
				return CCR_MASK_UNFIT;
			}
		}

		if (!(GetMapUseable() & (1 << info.inst_type)))
		{
			return CCR_MAP_UNUSEABLE;
		}

		int maskcanuse = GetCanUseStateMask();
		if (maskcanuse != 0)
		{
			if ((info.state_mask & maskcanuse) != maskcanuse)
			{
				return CCR_MASK_UNFIT;
			}
		}

		int maskcannotuse = GetCannotUseStateMask();
		if (maskcannotuse != 0)
		{
			if ((info.state_mask & maskcannotuse) != 0)
			{
				return CCR_MASK_UNFIT;
			}
		}

		if (info.lies & (LIES_DISABLE_SKILL | LIES_STUN | LIES_DRIFT | LIES_DOWN))
		{
			if (!IsDizzyUsable())
			{
				return CCR_MASK_UNFIT;
			}
		}

		int canusefilterid = GetCanUseFilterId();
		if (canusefilterid != 0)
		{
			//低6位数字标识状态包id，高位表示level需求
			int fid = canusefilterid % 1000000;
			int num = canusefilterid / 1000000;
			if (num == 0) num = 1;
			if (!PlayerWrapper::IsExistBuff(fid, num))
			{
				return CCR_USABLE_BUFF_UNFIT;
			}
		}

		int cannotusefilterid = GetCannotUseFilterId();
		if (cannotusefilterid != 0)
		{
			if (PlayerWrapper::IsExistBuff(cannotusefilterid, 1))
			{
				return CCR_UNUSABLE_BUFF_UNFIT;
			}
		}

		int shape = GetShapeLimit();
		if (shape != 0 && info.shape == shape)
		{
			return CCR_SHAPE_LIMIT;
		}
		// 挂件状态
		if (shape != 0 && info.adsorption_disable)
		{
			return CCR_ADSORPTION_LIMIT;
		}

		char condition = 0;
		float ratio = 0.0;
		GetOtherCondition(condition, ratio);
		if(condition != 0)
		{
			enum { HP_BLOW = 1, HP_ABOVE = 2, MP_BLOW = 3, MP_ABOVE = 4, };
			switch(condition)
			{
			case HP_BLOW:
				if (info.hp < info.maxhp*ratio) return CCR_HP_LT_RATIO;
				break;
			case HP_ABOVE:
				if (info.hp > info.maxhp*ratio) return CCR_HP_GT_RATIO;
				break;
			case MP_BLOW:
				if (info.mp < info.maxmp*ratio) return CCR_MP_LT_RATIO;
				break;
			case MP_ABOVE:
				if (info.mp < info.maxmp*ratio) return CCR_MP_GT_RATIO;
				break;
			default:
				break;
			}
		}

		//武器限制
		int weapon = GetWeaponRequired();
		if ((1<<(info.weapon_hold) & weapon) == 0)
		{
			return CCR_WEAPON_UNFIT;
		}

		if (info.isfight && !stub->fightusable)
		{
			return CCR_FIGHT_DISABLE;
		}

		return CCR_OK;
	}
}
