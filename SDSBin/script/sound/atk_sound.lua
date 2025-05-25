atk_sound  = {}

-------------------------------------
--		function called by other
-------------------------------------
--iSkill 		: 攻击方的技能id
--iArmor		: 被攻击方的装甲类型
--v3TargetPos	: 被攻击方的坐标{x,y,z}
function atk_sound:OnAtkHit(iSkill, iHit, iArmorType, v3TargetPos)
	if self:OnAtkHitSpecial(iSkill, iHit, iArmorType, v3TargetPos) then
	    return	    
	end
	self:OnAtkHitUseTable(iSkill, iArmorType, v3TargetPos)
end



-------------------------------------
--		function called by self
-------------------------------------
function atk_sound:OnAtkHitUseTable(iSkill, iArmorType, v3TargetPos)
    local soundstr = "" 	--声音文件名，格式："sfx\\..."
	local mindist = 5.0		--该声音开始衰减的距离（大于这个距离开始指数衰减）
	local maxdist = 15.0 	--听到该声音的最远距离

  	local atk_relation = AtkDefRelation[iSkill]
  	if not atk_relation then return end 
  	local atk_type = AtkSoundType[atk_relation]
  	if not atk_type then return end
  
    if type( atk_type[iArmorType] ) == "table" then
    	if next(atk_type[iArmorType]) then
    		local snd_idx  = math.random(#atk_type[iArmorType])
    		local soundstr = atk_type[iArmorType][snd_idx];
    		GameApi.Play3DSound(soundstr, mindist, maxdist, v3TargetPos)
    	end
     elseif type(atk_type[1]) == "string" then
       	if next(atk_type) then
    		local snd_idx  = math.random(#atk_type)
    		local soundstr = atk_type[snd_idx];
    		GameApi.Play3DSound(soundstr, mindist, maxdist, v3TargetPos)
	    end 
	end
end


function atk_sound:OnAtkHitSpecial(iSkill, iHit, iArmorType, v3TargetPos)    
    return false
end