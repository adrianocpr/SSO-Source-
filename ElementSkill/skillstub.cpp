#include "skillstub.h"
#include "LuaFuncs.h"


#define _EW(a)   LPCWSTR(L##a)

namespace GNET
{
	SkillStub::SkillStub(ID skill_id) : id(skill_id)
	{
		icon.Empty();
	}

	SkillStub::~SkillStub()
	{
	}

	SkillStub::skill_stub_map& SkillStub::GetMap()
	{ 
		static skill_stub_map map; 
		return map; 
	}

	const SkillStub *SkillStub::GetStub(ID skill_id)
	{
		skill_stub_map::iterator it = GetMap().find(skill_id);
		if(it == GetMap().end())
		{
			DEFINE_SCRIPT_CALL_CONTEXT(context, args, results);
			args.push_back((double)skill_id);
			if(CallFunc(args,results,"skill_man","GetSkillData"))
			{
				if(results.size() == 1&&results[0].m_Type == CScriptValue::SVT_ARRAY)
				{
					SkillStub* pStub = new SkillStub(skill_id);
					if(NULL!=pStub&&pStub->InitSkillStubData(results[0]))
					{
						GetMap().insert(skill_stub_map::value_type(skill_id, pStub));
						return pStub;
					}
				}
			}
			return NULL;
		}
		else return it->second;
	}

	bool SkillStub::InitSkillStub(ID skill_id, CScriptValue& skill_data)
	{
		const SkillStub* pStub = SkillStub::GetStub(skill_id);
		SkillStub* pSkillStub = NULL;
		if (NULL == pStub)
		{
			pSkillStub = new SkillStub(skill_id);
			pSkillStub->id = skill_id;		
		}
		else
		{
			pSkillStub = const_cast<SkillStub*>(pStub);
		}	

		if (NULL == pSkillStub) 
			return false;
		return pSkillStub->InitSkillStubData(skill_data);
	}

	bool SkillStub::GetFormulaValue(int index, CScriptValue& sv) const
	{
		int formula_idx = mask_formulas[index];
		DEFINE_SCRIPT_CALL_CONTEXT(context, args, results);
		args.push_back((double)id);
		args.push_back((double)formula_idx);
		if (!CallFunc(args, results, "skill_man", "get_formula_value"))
			return false;

		if (results.size() <= 0)
			return false;
		sv = results[0];
		return true;
	}

	int	SkillStub::GetIntFormulaValue(int index) const
	{
		CScriptValue sv;
		if (GetFormulaValue(index, sv))
			return sv.GetInt();
		return 0;
	}

	float SkillStub::GetFloatFormulaValue(int index) const
	{
		CScriptValue sv;
		if (GetFormulaValue(index, sv))
			return (float)sv.GetDouble();
		return 0.0f;
	}

	bool SkillStub::InitSkillStubData(CScriptValue& skill_data)
	{
		icon.Empty();
		type = TYPE_ATTACK;
		usetype = MODE_AUTO;
		origintype = ORIGIN_LEARN;
		showtype = ST_HIDE;
		affecttype = 0;
		profession = 0;
		priority = 1;
		hidebackground =0;
		timetype = TIME_NORMAL;
		barshow = BAR_SHOW_NO;
		extraflag = SKILL_EXTRA_FLAG_NONE;
		fixcast = 0;
		movemode = MOVE_NONE;
		movestyle = MOVE_STYLE_INVALID;
		movefix = 0.0f;
		movedelay = 0;
		castdistance = 0.0f;
		casttime = 0;
		maxlevel = 200;
		talentmaxlearn = 0;
		autoattack = 1;
		rangetype = GNET::RANGE_INVALID;
		cylinderradius = 0.0f;
		cylinderlength = 0.0f;
		sectorradius = 0.0f;
		sectorangle = 0;
		moveinterrupt = false;
		selfinterrupt = false;
		bootbar = true;
		selfcondition = GNET::SC_BOTH;
		targettype = GNET::TARGET_NORMAL;
		delaymode = 0;
		delaytime = 0;
		flyspeed = 0;
		statecondition = 0;
		canusefilterid = 0;
		cannotusefilterid = 0;
		fightusable = true;
		dizzyusable = false;
		weaponrequired = 0;
		othercondition = 0;
		other_ratio = 0.0f;
		shape_limit = 0;
		goods_id = 0;
		goods_num = 0;
		mapusable = 0;
		instanteGfx_Id = 0;
		procedure_num = 0;
		mp_cost = 0;
		vp_cost = 0;
		ap_cost = 0;	
		ep_cost = 0;	
		energy1_cost = 0;
		energy2_cost = 0;
		execute_time = 0;
		cooldown_time = 0;
		groupcd_id = 0;
		groupcd_time = 0;
		pursue_distance = 0.0f;
		cminpray_distance = 0.0f;
		radius = 0.0f;
		showCampGfxTime = 0;
        campGfxType = 0;
		canforbidbyshape = false;
		soulskilltype = 0;
		ui_gfx.Empty();
#define ASSIGN_ASTRING(x) if(str == _EW(#x)) {val.RetrieveAString(x);continue;}
#define ASSIGN_CHAR(x) if(str == _EW(#x)) {x=val.GetInt();continue;}
#define ASSIGN_DOUBLE(x,doubleType) if(str == _EW(#x)) {x=(doubleType)val.GetDouble();continue;}
#define ASSIGN_BOOL(x) if(str == _EW(#x)) {x=val.GetBool();continue;}
#define ASSIGN_ARRAY(x) if(str == _EW(#x)) {GetValue(x,val);continue;}
#define ASSIGN_NOT_FORMULA_DOUBLE(x,index,doubleType) \
	if (str == _EW(#x) && !mask_formulas[index])\
		{x=(doubleType)val.GetDouble();continue;}

		for(size_t i = 0;i<skill_data.m_ArrKey.size();++i)
		{
			const CScriptValue& key = skill_data.m_ArrKey[i];
			const CScriptValue& val = skill_data.m_ArrVal[i];
			if (CScriptValue::SVT_STRING!=key.m_Type)
				continue;
			AWString str;
			key.RetrieveAWString(str);
			ASSIGN_ARRAY(mask_formulas)
		}

		for(size_t i = 0;i<skill_data.m_ArrKey.size();++i)
		{
			const CScriptValue& key = skill_data.m_ArrKey[i];
			const CScriptValue& val = skill_data.m_ArrVal[i];
			if (CScriptValue::SVT_STRING!=key.m_Type)
				continue;
			AWString str;
			key.RetrieveAWString(str);
			
			ASSIGN_ASTRING(icon)
			ASSIGN_CHAR(type)
			ASSIGN_CHAR(usetype)
			ASSIGN_CHAR(origintype)
			ASSIGN_CHAR(showtype)
			ASSIGN_CHAR(affecttype)
			ASSIGN_DOUBLE(profession,int)
			ASSIGN_ARRAY(specificnpc)
			ASSIGN_DOUBLE(priority,int)
			ASSIGN_CHAR(hidebackground)
			ASSIGN_CHAR(timetype)
			ASSIGN_CHAR(barshow)
			ASSIGN_CHAR(extraflag)
			ASSIGN_CHAR(fixcast)
			ASSIGN_CHAR(movemode)
			ASSIGN_CHAR(movestyle)
			ASSIGN_DOUBLE(movefix,float)
			ASSIGN_DOUBLE(movedelay,int)
			ASSIGN_DOUBLE(castdistance,float)
			ASSIGN_DOUBLE(casttime,int)
			ASSIGN_DOUBLE(maxlevel,int)
			ASSIGN_DOUBLE(talentmaxlearn,int)
			ASSIGN_CHAR(autoattack)
			ASSIGN_CHAR(rangetype)
			ASSIGN_DOUBLE(cylinderradius,float)
			ASSIGN_DOUBLE(cylinderlength,float)
			ASSIGN_DOUBLE(sectorradius,float)
			ASSIGN_DOUBLE(sectorangle,int)
			ASSIGN_BOOL(moveinterrupt)
			ASSIGN_BOOL(selfinterrupt)
			ASSIGN_BOOL(bootbar)
			ASSIGN_CHAR(selfcondition)
			ASSIGN_CHAR(targettype)
			ASSIGN_CHAR(delaymode)
			ASSIGN_DOUBLE(delaytime,int)
			ASSIGN_DOUBLE(flyspeed,int)
			ASSIGN_DOUBLE(statecondition,int)
			ASSIGN_DOUBLE(canusefilterid,int)
			ASSIGN_DOUBLE(cannotusefilterid,int)
			ASSIGN_BOOL(fightusable)
			ASSIGN_BOOL(dizzyusable)
			ASSIGN_DOUBLE(weaponrequired,int)
			ASSIGN_CHAR(othercondition)
			ASSIGN_DOUBLE(other_ratio,float)
			ASSIGN_DOUBLE(shape_limit,int)
			ASSIGN_DOUBLE(goods_id,int)
			ASSIGN_DOUBLE(goods_num,int)
			ASSIGN_DOUBLE(mapusable,int)
			ASSIGN_DOUBLE(instanteGfx_Id,int)
			ASSIGN_DOUBLE(procedure_num,int)
			ASSIGN_ARRAY(procedure_combo)
			ASSIGN_ARRAY(procedure_time)
			ASSIGN_DOUBLE(showCampGfxTime,int)
			ASSIGN_DOUBLE(campGfxType,int)
			ASSIGN_BOOL(canforbidbyshape)
			ASSIGN_DOUBLE(soulskilltype,int)
			ASSIGN_ASTRING(ui_gfx)

			ASSIGN_NOT_FORMULA_DOUBLE(mp_cost,formula_mp_cost,int)
			ASSIGN_NOT_FORMULA_DOUBLE(vp_cost,formula_vp_cost,int)
			ASSIGN_NOT_FORMULA_DOUBLE(ap_cost,formula_ap_cost,int)
			ASSIGN_NOT_FORMULA_DOUBLE(ep_cost,formula_ep_cost,int)
			ASSIGN_NOT_FORMULA_DOUBLE(energy1_cost,formula_energy1_cost,int)
			ASSIGN_NOT_FORMULA_DOUBLE(energy2_cost,formula_energy2_cost,int)
			ASSIGN_NOT_FORMULA_DOUBLE(execute_time,formula_execute_time,int)
			ASSIGN_NOT_FORMULA_DOUBLE(cooldown_time,formula_cooldown_time,int)
			ASSIGN_NOT_FORMULA_DOUBLE(groupcd_id,formula_groupcd_id,int)
			ASSIGN_NOT_FORMULA_DOUBLE(groupcd_time,formula_groupcd_time,int)
			ASSIGN_NOT_FORMULA_DOUBLE(radius,formula_radius,float)
			ASSIGN_NOT_FORMULA_DOUBLE(pursue_distance,formula_pursue_distance,float)
			ASSIGN_NOT_FORMULA_DOUBLE(cminpray_distance,formula_cminpray_distance,float)
		}
		// Í¼±êÂ·¾¶Ð¡Ð´
		icon.MakeLower();

		return true;
#undef ASSIGN_CHAR
#undef ASSIGN_DOUBLE
#undef ASSIGN_BOOL
#undef ASSIGN_ARRAY	
#undef ASSIGN_NOT_FORMULA_DOUBLE
	}
}
