module("skill_act", package.seeall)


-- 星矢带溅射光效的技能
_M[18] = function(skill_id, skill_lev, profession, fly_type, att_type, bHostplayer, uiExtState)
	local buff_level = GameApi.GetHostBuffLevel(123)
	local skill = skill_data[skill_id]
    if buff_level and buff_level > 0 then
    	local temp_str = skill.action[ACTION_LIST_BEGIN + profession]
        local act_str = string.sub(temp_str, 1, string.len(temp_str) - 1)..2
        return act_str
    end
end
_M[19] = _M[18]

--星矢 晕小技能
--_M[60] = function(skill_id, skill_lev, profession, fly_type, att_type, bHostplayer, uiExtState)
--	local buff_level = GameApi.GetHostBuffLevel(868)
--	local skill = skill_data[skill_id]
--	local temp_str = skill.action[ACTION_LIST_BEGIN + profession]
--	if buff_level and buff_level>0 then
--	    temp_str="晕小技能带流星_星矢"
--	end
--	return temp_str
--
--end



-- 瞬上状态
_M[515] = function(skill_id, skill_lev, profession, fly_type, att_type, bHostplayer, uiExtState)
	local buff_level = GameApi.GetHostBuffLevel(292)
	local skill = skill_data[skill_id]
	local temp_str = skill.action[ACTION_LIST_BEGIN + profession]
    if buff_level and buff_level > 0 then
        local act_str = string.gsub(temp_str, "治疗", "输出")
        return act_str
    end
    return temp_str
end


-- 看其他人的小宇宙爆发
_M[284] = function(skill_id, skill_lev, profession, fly_type, att_type, bHostplayer, uiExtState)
	if not bHostplayer then
	    return "小宇宙爆发其它_星矢"
	end
end


-- 普攻随机
--_M[234] = function(skill_id, skill_lev, profession, fly_type, att_type, bHostplayer, uiExtState)
--	local snd_idx = math.random(2)
--	local skill = skill_data[skill_id]
--    local temp_str = skill.action[ACTION_LIST_BEGIN + profession]
--    local act_str = string.gsub(temp_str,"%d",snd_idx)
--   	return act_str
--end
--_M[235] = _M[234]
--_M[236] = _M[234]
_M[1289] = _M[234]


-- 蓄力测试技能
_M[289] = function(skill_id, skill_lev, charge_time, profession, fly_type, att_type, bHostplayer, uiExtState)
	if charge_time > 100 then
	    return "dot技能3_紫龙"
	end
end

-- 一辉标准攻击
_M[1519] = function(skill_id, skill_lev, profession, fly_type, att_type, bHostplayer, uiExtState)
	local buff_level = GameApi.GetHostBuffLevel(830)
	local buff_level2 = GameApi.GetHostBuffLevel(2789)
	local skill = skill_data[skill_id]
	local temp_str = skill.action[ACTION_LIST_BEGIN + profession]
    if (buff_level and buff_level > 0 ) or (buff_level2 and buff_level2 > 0 )   then
        local act_str = string.gsub(temp_str, "_", "群_")
        return act_str
    end
    return temp_str
end
_M[1520] = _M[1519]
_M[1522] = _M[1519]


-- 加降普攻
_M[6459] = function(skill_id, skill_lev, profession, fly_type, att_type, bHostplayer, uiExtState)
	local buff_level = GameApi.GetHostBuffLevel(2722)
	local skill = skill_data[skill_id]
	local temp_str = skill.action[ACTION_LIST_BEGIN + profession]
	local act_str
	act_str = "恶之普通攻击_加隆"
    if buff_level and buff_level > 0 then
        act_str = "善之普通攻击_加隆"
	else
		act_str = "恶之普通攻击_加隆"
	end
	return act_str
end


