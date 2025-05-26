module("ModUtility", package.seeall)
local string, table = string, table
local Format = string.format
local Concat = table.concat
local Len	 = string.len
local Insert = table.insert


function GetPetSkill(ItemDescTab)
	local level=ItemDescTab.skill_level_req
	local skill_id=ItemDescTab.skill_id
	if skill_id and level and level > 0 then
	    local skillname = skill_desc:GetSkillName(skill_id)  		
	    if skillname then
	        return ITEM_COLOR_DESC.White..Format(ITEM_PET_SKILL_UP_DESC.PetSkillName,level,ITEM_COLOR_DESC.PetSkill,skillname,ITEM_COLOR_DESC.White,level+1)
	    end
	end
	return ""
end


-- 获取宠物技能
function GetBountySkill(ItemDescTab)
    local SkillNum= #ItemDescTab.skills
    local PassiveSkillNum= #ItemDescTab.passive_skills
    local str=""
    if SkillNum>0 or PassiveSkillNum>0 then
        str=str.."\r"
    end
    if SkillNum>0 then
    	for i=1,SkillNum do
    		local skillname=skill_desc:GetSkillName(ItemDescTab.skills[i].id)
    		local level=ItemDescTab.skills[i].level
    		str=str..Format(ITEM_BOUNTY_SKILL_DESC.BountySkill,ITEM_COLOR_DESC.Blue,skillname,level,ITEM_COLOR_DESC.White)
    	end
    end
    if PassiveSkillNum>0 then 
    	for j=1,PassiveSkillNum do
    		local skillname=skill_desc:GetSkillName(ItemDescTab.passive_skills[j].id)
    		local level=ItemDescTab.passive_skills[j].level
    		str=str..Format(ITEM_BOUNTY_SKILL_DESC.BountySkill,ITEM_COLOR_DESC.LightBlue,skillname,level,ITEM_COLOR_DESC.White)
    	end
    end
    if SkillNum>0 or PassiveSkillNum>0 then
        str=str.."\r"
    end
    return str	
end	

-- 获取宠物技能近远程适用类型
function GetPetSkillType(ItemDescTab)
   local len=#ItemDescTab.available_for_pet_category
   local str=""
   local sign
   if len==1 then
       sign=ItemDescTab.available_for_pet_category[1]
   else
       sign=len
   end
   str=Format(ITEM_PET_SKILL[Format("AvForType_%d",sign)],ITEM_COLOR_DESC.PetSkill,ITEM_COLOR_DESC.White)      
   return str
end

-- 宠物装备攻击力
function GetBountyAttackMax(ItemDescTab)
    local attack_max = ItemDescTab.bounty_attack_max
    if attack_max and attack_max > 0 then 
       	if (ItemDescTab.bounty_attack_min == ItemDescTab.bounty_attack_max ) then             
     		return Format(ITEM_BOUNTY_ATTACK_MAX_DESC.BountyAttackMax1,ItemDescTab.bounty_attack_min)
     	else
     		return Format(ITEM_BOUNTY_ATTACK_MAX_DESC.BountyAttackMax,ItemDescTab.bounty_attack_min,ItemDescTab.bounty_attack_max)
     	end
    end
	return ""
end

-- 宠物携带等级要求
function GetPetSummonReqLevel(ItemDescTab)
    if not ItemDescTab.pet_level then
        return ITEM_COLOR_DESC.White..Format(ITEM_PET_REQ_LEVEL_DESC.PetSummonLevel,ItemDescTab.pet_summon_level_req)
    else
        if (ItemDescTab.pet_summon_level_req > 0 ) then
        	if (ItemDescTab.pet_summon_level_req > ItemDescTab.pet_summon_level) then
        	    return ITEM_COLOR_DESC.Red..Format(ITEM_PET_REQ_LEVEL_DESC.PetSummonLevel,ItemDescTab.pet_summon_level_req)..ITEM_COLOR_DESC.White
    		else
    		    return ITEM_COLOR_DESC.White..Format(ITEM_PET_REQ_LEVEL_DESC.PetSummonLevel,ItemDescTab.pet_summon_level_req)
			end
	  	end
    end
	return ""
end


-- 适用最高携带等级
function GetPetSummonLevelLimit(ItemDescTab)
    local str=""
    if(ItemDescTab.pet_summon_level_limit) then
       str=ITEM_COLOR_DESC.White..string.format(ITEM_SUMMON_LEVEL_LIMIT.Summon_Level_Limit,ItemDescTab.pet_summon_level_limit)
	end
    return str
end

-- 宠物成长度提升石
function GetPetGrowthStoneDesc(ItemDescTab)
   local stonetype=Format("type%d",ItemDescTab.type)
   return Format(ITEM_PET_GROWTH_STONE_DESC[stonetype],ItemDescTab.point_add)
end
	
	
-- 宠物食品类型
function GetPetFoodType(ItemDescTab)
    if not ItemDescTab.pet_food_type and ItemDescTab.pet_food_use then
    	return ""   
    end
    if ItemDescTab.pet_food_usage ~=0 then
        return ""  
    end
    return Format(ITEM_PET_FOOD_USE_DESC.PetFoodUse,ITEM_COLOR_DESC.White,ItemDescTab.pet_food_value) 
end


-- 宠物食品冷却时间
function GetPetFoodColddownTime(ItemDescTab)
    local nTime = ItemDescTab.colddown_time_world
    if (nTime and nTime > 0) then
        return Format(ITEM_TIME_DESC.ColddownTime)..GetTimeText(ItemDescTab.colddown_time_world)
    end
	return ""
end

	
--  宠物自身等级
function GetBountyLevel(ItemDescTab)
    if Len(ItemDescTab.level) == 0 then
    	return ""		
	end
    return Format(ITEM_BOUNTY_LEVEL_DESC.BountyLevel,ItemDescTab.level)
end
	

--[[
-- 宠物技能物品标识
function GetPetSkillTagDesc(ItemDescTab)
    return ITEM_PET_SKILL_TAG_DESC["TagDesc"] .. "\r"
end
--]]

	
-- 宠物食品等级要求
function GetPetReqLevel(ItemDescTab)
    if ItemDescTab.pet_level == nil then
        return ITEM_COLOR_DESC.Red..Format(ITEM_PET_REQ_LEVEL_DESC.PetReqLevel1)..ITEM_COLOR_DESC.White..Format(ITEM_PET_REQ_LEVEL_DESC.PetReqLevel,ItemDescTab.pet_level_req)
    else
        if (ItemDescTab.pet_level_req > 0 ) then
            if (ItemDescTab.pet_level_req > ItemDescTab.pet_level) then
    			return ITEM_COLOR_DESC.Red..Format(ITEM_PET_REQ_LEVEL_DESC.PetReqLevel,ItemDescTab.pet_level_req)..ITEM_COLOR_DESC.White
    		else
    			return Format(ITEM_PET_REQ_LEVEL_DESC.PetReqLevel,ItemDescTab.pet_level_req)
			end
	  	end
    end
	return ""
end


-- 宠物等级要求
function GetBountyReqLevel(ItemDescTab)
    if ItemDescTab.pet_level == nil then
    	return Format(ITEM_BOUNTY_REQ_LEVEL_DESC.BountyReqLevel,ItemDescTab.pet_level_req)
    else  
     	if (ItemDescTab.pet_level_req > 0 ) then
			if (ItemDescTab.pet_level_req > ItemDescTab.pet_level) then
    	  		return ITEM_COLOR_DESC.Red..Format(ITEM_BOUNTY_REQ_LEVEL_DESC.BountyReqLevel,ItemDescTab.pet_level_req)..ITEM_COLOR_DESC.White
    		else
    	  		return Format(ITEM_BOUNTY_REQ_LEVEL_DESC.BountyReqLevel,ItemDescTab.pet_level_req)
			end
	  	end
    end
	return ""
end


--宠物资质强化石提升值	
function GetPetApttAdd(ItemDescTab)
	local add = ItemDescTab.aptitude_add*100
	local str=ITEM_COLOR_DESC.White..Format(ITEM_PET_APTT_STONE_DESC.ApttAdd,add) or ""
	return  str
end	
	
	
--宠物资质强化石成功率
function GetPetAptStoneSucProb(ItemDescTab)
    local prob=ItemDescTab.success_prob
    return prob and ITEM_COLOR_DESC.White..Format(ITEM_PET_APTT_STONE_DESC.SuccessProb,prob*100) or ""
end


function GetPetSkillUpProb(ItemDescTab)
	local prob=ItemDescTab.success_prob
	return prob and ITEM_COLOR_DESC.White..Format(ITEM_PET_SKILL_UP_DESC.SuccessProb,prob*100) or ""
end


-- 携带宠物等级要求
function GetTakeBountyReqLevel(ItemDescTab)
    if not ItemDescTab.require_player_level then
    	return ""   
    end   
	if (ItemDescTab.req_level > 0 ) then
	    local HostPropEx=GameApi.GetHostPropEx()
        local str_lev = format_string:player_lev(ItemDescTab.require_player_level, true)
		if (ItemDescTab.require_player_level > HostPropEx.level) then

    		return ITEM_COLOR_DESC.Red..Format(ITEM_TAKE_BOUNTY_REQ_LEVEL_DESC.TakeBountyReqLevel, str_lev)..ITEM_COLOR_DESC.White
    	else
    	    return Format(ITEM_TAKE_BOUNTY_REQ_LEVEL_DESC.TakeBountyReqLevel, str_lev)
		end
	end
	return ""
end	

function GetPetName(ItemDescTab)
   	local str=""
   	if ItemDescTab.pet_name~=nil then
   		str=str..Format(ITEM_PET_NAME,ITEM_COLOR_DESC.White,ITEM_COLOR_DESC.Green,ItemDescTab.pet_name,ITEM_COLOR_DESC.White) 
   	end
    return str
end

--宠物牌描述
function GetBountyProp(ItemDescTab)
	local prop=""
	local strGrowthLevelValue=""
	local strGrowthStar=""
	--近远程
	prop=prop..Format(ITEM_PET.Category,STRING_TABLE[Format("PET_CATEGORY_%d",ItemDescTab.category)])
	--攻防血
	prop=prop..Format("\r")
	prop=prop..Format(ITEM_PET.Attack,ItemDescTab.attack_min,ItemDescTab.attack_max)
	prop=prop..Format(ITEM_PET.Defense,ItemDescTab.defense)
	prop=prop..Format(ITEM_PET.HpMax,ItemDescTab.hp_max)
	--攻击成长率
	prop=prop..Format("\r")
	if(ItemDescTab.attack_growth_level>0) then
	    strGrowthLevelValue="+"..math.ceil(ItemDescTab.attack_growth-ItemDescTab.attack_growth_base).."(Lv "..ItemDescTab.attack_growth_level..")"
	else
	    strGrowthLevelValue=""
	end
	strGrowthStar=ResourceConfig:GetPetGrowthGradeStarImg(ItemDescTab.attack_growth_grade_star)
	prop=prop..Format(ITEM_PET.AttackGrowth,strGrowthStar,ItemDescTab.attack_growth_base,strGrowthLevelValue)
	
	--防御成长率	
	if(ItemDescTab.defense_growth_level>0) then
	    strGrowthLevelValue="+"..math.ceil(ItemDescTab.defense_growth-ItemDescTab.defense_growth_base).."(Lv "..ItemDescTab.defense_growth_level..")"
	else
	    strGrowthLevelValue=""
	end
	strGrowthStar=ResourceConfig:GetPetGrowthGradeStarImg(ItemDescTab.defense_growth_grade_star)
	
	prop=prop..Format(ITEM_PET.DefenseGrowth,strGrowthStar,ItemDescTab.defense_growth_base,strGrowthLevelValue)
	
	--生命成长率
	if(ItemDescTab.hp_growth_level>0) then
	    strGrowthLevelValue="+"..math.ceil(ItemDescTab.hp_growth-ItemDescTab.hp_growth_base).."(Lv "..ItemDescTab.hp_growth_level..")"
	else
	    strGrowthLevelValue=""
	end
	strGrowthStar=ResourceConfig:GetPetGrowthGradeStarImg(ItemDescTab.hp_growth_grade_star)
	
	prop=prop..Format(ITEM_PET.HpGrowth,strGrowthStar,ItemDescTab.hp_growth_base,strGrowthLevelValue)
	
	--资质
	prop=prop..Format("\r")
	prop=prop..Format(ITEM_PET.AttackApt,ItemDescTab.attack_aptitude*100)
	prop=prop..Format(ITEM_PET.DefenseApt,ItemDescTab.defense_aptitude*100)
	prop=prop..Format(ITEM_PET.HpApt,ItemDescTab.hp_aptitude*100)	
	return prop
end

function GetPetCatcherLimit(ItemDescTab)
   local str=""
   if(ItemDescTab.player_level_req) then
        local str_lev = format_string:player_lev(ItemDescTab.player_level_req, true)
        str = str..string.format(ITEM_PET_CATCHER.PlayerLevelReq, str_lev)
	end
   if(ItemDescTab.max_catch_level) then
       str=str..string.format(ITEM_PET_CATCHER.LevelLimit,ItemDescTab.max_catch_level)
	end
	if(ItemDescTab.target_hp_lower_than) then
	   local nColor = LuaItemDesc:GetItemColor(ItemDescTab.id, ItemDescTab.quality)
	   str=str..string.format(ITEM_PET_CATCHER.UseLimit,ItemDescTab.target_hp_lower_than*100,nColor,ITEM_PET_CATCHER[Format("Quality_%d",ItemDescTab.quality)],ITEM_COLOR_DESC.White)
	end
	return str
end



-- 显示是否死亡描述文本
function GetBountyDead(ItemDescTab)        
	if ItemDescTab.bounty_dead  then
		return Format(ITEM_BOUND_DEAD_DESC.DEAD)
	end
	return ""
end


-- 显示是否修炼描述文本
function GetBountyTrain(ItemDescTab)
	if ItemDescTab.bounty_train then
		return Format(ITEM_BOUND_TRAIN_DESC.Train)
	end
	return Format(ITEM_BOUND_TRAIN_DESC.NotTrain)	     
end


-- 获取雇主名称
function GetEmployersName(ItemDescTab)
    local strEmployersName = ""   
    if Len(ItemDescTab.employers_name) == 0 then
    	return ""
    end
	return Format(ITEM_EMPLOYERS_NAME_DESC.EmployersName,ItemDescTab.employers_name)
end


-- 获取声望要求描述
function GetBountyReqPrestige(ItemDescTab)
    if not ItemDescTab.bounty_req_prestige then
    	return ""   
    end    
	if (ItemDescTab.bounty_req_prestige >= 0 ) then
		if (ItemDescTab.bounty_req_prestige > ItemDescTab.bounty_prestige) then
    		return strBountyReqPrestige..ITEM_COLOR_DESC.Red..Format(ITEM_BOUNTY_REQ_PRESTIGE_DESC,ItemDescTab.bounty_req_prestige)..ITEM_COLOR_DESC.White
    	else
    	    return Format(ITEM_BOUNTY_REQ_PRESTIGE_DESC.BountyReqPrestige,ItemDescTab.bounty_req_prestige)
		end
	end
	return ""
end


function GetPetSkillLearnProb(ItemDescTab)
    local prop=ItemDescTab.learn_prob*100
	return Format(ITEM_PET_SKILL.Prob,prop)	
end


function GetPetSkillInfo(ItemDescTab)
   local str=""
   str="\r"..skill_desc:GetDesc_Str(ItemDescTab.skill_id,1,skill_desc.CONTEXT.SKILL_NORMAL).."\r"
   return str
end


-- 获取宠物评分
function GetBountyScore(ItemDescTab)
   local  SkillSumLel={
[1312]=1,
[116]=1,
[116]=1,
[99]=1,
[100]=1,
[101]=1,
[1232]=45,
[1234]=45,
[1235]=45,
[1264]=45,
[1257]=15,
[1259]=15,
[1262]=15,
[1263]=15,
[1270]=70,
[1272]=70,
[1273]=70,
[1275]=70,
[1279]=90,
[1281]=90,
[1282]=90,
[1283]=90,
[1308]=15,
[1309]=45,
[1310]=70,
[1311]=90,
[1312]=15,
[1313]=45,
[1530]=70,
[1531]=90,
[1532]=15,
[1533]=45,
[1534]=70,
[1535]=90,
[1536]=15,
[1537]=45,
[1538]=70,
[1539]=90,
[1540]=70,
[1541]=90,
[1542]=70,
[1543]=90,
[1544]=15,
[1545]=45,
[1546]=70,
[1547]=90,
[1548]=15,
[1549]=45,
[1550]=70,
[1551]=90,
[1552]=15,
[1553]=45,
[1554]=70,
[1555]=90,
[1556]=15,
[1557]=45,
[1558]=70,
[1559]=90,
[1560]=70,
[1561]=90,
[1562]=15,
[1563]=45,
[1564]=70,
[1565]=90,
[1566]=15,
[1567]=45,
[1568]=70,
[1569]=90,
[1570]=45,
[1571]=70,
[1572]=90,
[1573]=45,
[1574]=70,
[1575]=90,
[1576]=45,
[1577]=70,
[1578]=90,
[1233]=45,
[1258]=15,
[1260]=15,
[1261]=45,
[1265]=45,
[1271]=70,
[1274]=70,
[1276]=70,
[1277]=90,
[1278]=45,
[1280]=90,
[1285]=90,
[1286]=70,
[1287]=90,
[1580]=70,
[1581]=90,
}

local PetSkillScore=
{
	[15]=
		{
			[1]=50,
			[2]=75,
			[3]=100,
		},
	[45]=
		{
			[1]=72,
			[2]=108,
			[3]=144,
		},
	[70]=
		{
			[1]=100,
			[2]=150,
			[3]=200,
		},
	[90]=
		{
			[1]=150,
			[2]=225,
			[3]=300,
		},
}




local EvaluGrowthCoe={	--成长率评分系数
[1]=1,		--攻击成长率
[2]=0.8,	--防御成长率
[3]=0.7,	--生命成长率
}

local EvaluAptCoe={	--资质评分系数
[1]=800,	--攻击资质
[2]=600,	--防御资质
[3]=500,	--生命资质
}

    local GrowScore = ItemDescTab.attack_growth*EvaluGrowthCoe[1]+ ItemDescTab.defense_growth*EvaluGrowthCoe[2]+ ItemDescTab.hp_growth*EvaluGrowthCoe[3]
    local AptScore=ItemDescTab.attack_aptitude*EvaluAptCoe[1]+ItemDescTab.defense_aptitude*EvaluAptCoe[2]+ItemDescTab.hp_aptitude*EvaluAptCoe[3]
    local SkillScore
    local SkillNum= #ItemDescTab.skills
    local PassiveSkillNum= #ItemDescTab.passive_skills
    local SkillScore=0
    if SkillNum>0 then
    	for i=1,SkillNum do
    		local skillid=ItemDescTab.skills[i].id
    		local level=ItemDescTab.skills[i].level
    		local Sumlv
    		if SkillSumLel[skillid] then
	        	Sumlv=SkillSumLel[skillid]   --技能的携带等级
    		end
    	    if PetSkillScore[Sumlv] and PetSkillScore[Sumlv][level] then
    	        SkillScore=SkillScore+PetSkillScore[Sumlv][level]
    	    end
    	end
    end
    
    if PassiveSkillNum>0 then 
    	for j=1,PassiveSkillNum do
    		local skillid=ItemDescTab.passive_skills[j].id
    		local level=ItemDescTab.passive_skills[j].level
    		local Sumlv
    		if SkillSumLel[skillid] then
	        	Sumlv=SkillSumLel[skillid]   --技能的携带等级
    		end
    	    if PetSkillScore[Sumlv] and PetSkillScore[Sumlv][level] then
    	        SkillScore=SkillScore+PetSkillScore[Sumlv][level]
    	    end
    	end
    end
   	local total= GrowScore+AptScore+SkillScore
    return Format(ITEM_BOUNTY_POINT_DESC.BountyPoint,total)
end


-- 宠物攻击天赋
function GetBountyAttackTalent(ItemDescTab)
    local talent = ItemDescTab.bounty_attack_talent 
    if not talent or talent == 0 then
    	return ""   
    end    
    return Format(ITEM_COLOR_DESC.Orange)..Format(ITEM_BOUNTY_ATTACK_TALENT_DESC.BountyAttackTalent,talent)..ITEM_COLOR_DESC.White
end


-- 宠物防御天赋
function GetBountyDefenseTalent(ItemDescTab)
    local talent = ItemDescTab.bounty_defense_talent
    if not talent or talent == 0 then
    	return ""   
    end    
    return Format(ITEM_COLOR_DESC.Orange)..Format(ITEM_BOUNTY_DEFENSE_TALENT_DESC.BountyDefenseTalent,talent)..ITEM_COLOR_DESC.White
end


-- 宠物生命天赋
function GetBountyHPTalent(ItemDescTab)
    local talent = ItemDescTab.bounty_hp_talent
    if not talent or talent == 0 then
    	return ""   
    end 
    return Format(ITEM_COLOR_DESC.Orange)..Format(ITEM_BOUNTY_HP_TALENT_DESC.BountyHPTalent,talent)..ITEM_COLOR_DESC.White
end


-- 获取宠物强特性1
function GetBountyTraitMax1(ItemDescTab)
    local max1 = ItemDescTab.bounty_trait_max_1
    if not max1 or max1 == 0 then
    	return ""   
    end
   
    local nTraitId = ItemDescTab.bounty_trait_max_1
	if nTraitId and nTraitId > 0 then
        return Format(ITEM_BOUNTY_TRAIT_DESC.BountyTraitMax,STRING_TABLE["PET_MERIT_" ..(nTraitId-1)])
	end 		
	return Format(ITEM_COLOR_DESC.Green).."\r".._t"强特性 "..ITEM_COLOR_DESC.White.."\r"
end 


-- 获取宠物强特性2
function GetBountyTraitMax2(ItemDescTab)
    local max2 = ItemDescTab.bounty_trait_max_2
    if not max2 or max2 == 0 then
    	return ""   
    end

    local nTraitId = ItemDescTab.bounty_trait_max_2
	if nTraitId and  nTraitId > 0  then
        return Format(ITEM_BOUNTY_TRAIT_DESC.BountyTraitMax,STRING_TABLE["PET_MERIT_" ..(nTraitId-1)])
	end
	return Format(ITEM_COLOR_DESC.Green).._t"强特性 "..ITEM_COLOR_DESC.White.."\r"
end   


-- 获取宠物弱特性1
function GetBountyTraitMin1(ItemDescTab)
    local min1 = ItemDescTab.bounty_trait_min_1
    if not min1 or min1 == 0 then
    	return ""   
    end
    
    local nTraitId = ItemDescTab.bounty_trait_min_1
	if (nTraitId > 0 ) then
        return Format(ITEM_BOUNTY_TRAIT_DESC.BountyTraitMin,STRING_TABLE["PET_DEFECT_" ..(nTraitId-1)])..ITEM_COLOR_DESC.White
	end
	return Format(ITEM_COLOR_DESC.DarkYellow).._t"弱特性 "..strBountyTraitMin1 ..ITEM_COLOR_DESC.White .."\r"
end 


-- 获取宠物弱特性2
function GetBountyTraitMin2(ItemDescTab)
    local min2 = ItemDescTab.bounty_trait_min_2
    if not min2 or min2 == 0 then
    	return ""   
    end
    
    local nTraitId = ItemDescTab.bounty_trait_min_2
	if (nTraitId > 0 ) then
        return Format(ITEM_BOUNTY_TRAIT_DESC.BountyTraitMin,STRING_TABLE["PET_DEFECT_" ..(nTraitId-1)])
	end
	return Format(ITEM_COLOR_DESC.DarkYellow).._t"弱特性 "..strBountyTraitMin2 ..ITEM_COLOR_DESC.White.."\r"
end 


-- 宠物生命值
function GetBountyMaxhp(ItemDescTab)
    if Len(ItemDescTab.bounty_maxhp) > 0 then
    	return Format(ITEM_BOUNTY_DESC.BountyMaxhp,ItemDescTab.bounty_hp,ItemDescTab.bounty_maxhp)	
	end
	return ""
end


-- 宠物魔法值
function GetBountyMaxmp(ItemDescTab)
    if (Len(ItemDescTab.bounty_maxmp) == 0) then
    	return ""		
	end
    return Format(ITEM_BOUNTY_DESC.BountyMaxmp,ItemDescTab.bounty_mp,ItemDescTab.bounty_maxmp)
end


-- 宠物属性
function GetBountyText(strDesc,nNumber)
    if Len(strDesc) == 0 or  nNumber == 0 then
     	return ""
 	end
    return Format(strDesc,nNumber)
end