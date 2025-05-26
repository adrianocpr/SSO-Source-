local GameApi	= GameApi
local Format,Len 	= string.format,string.len

cosmos_burst = {}
--小宇宙爆发界面激活标志技能
local COSMOS_ACTIVE_SKILL = 1109

cosmos_burst.COSMOS_ACTIVE_RATE_1 = 0.5 --小宇宙爆发激活怒气比例
cosmos_burst.COSMOS_ACTIVE_RATE_2 = 0.75
cosmos_burst.COSMOS_ACTIVE_RATE_3 = 1.0

--小宇宙聚气状态
cosmos_burst.COSMOS_JUQI_LEVEL = 
{
    JUQI_NO = 0,--不聚气
    JUQI_LOW = 1,--低级聚气
    JUQI_MID = 2,--中级聚气
    JUQI_HIGH = 3,--高级聚气
}
--小宇宙爆发状态
cosmos_burst.COSMOS_BURST_LEVEL = 
{
    BURST_NO = 0,
    BURST_LOW = 1,
    BURST_MID = 2,
    BURST_HIGH = 3,
}

--根据怒气比例获得聚气的状态
function cosmos_burst:GetCosmosJuqiLevel(burstLevel,rate)
    if burstLevel>self.COSMOS_BURST_LEVEL.BURST_NO then --在爆发
        return self.COSMOS_JUQI_LEVEL.JUQI_NO
    elseif rate < self.COSMOS_ACTIVE_RATE_1 then
        return self.COSMOS_JUQI_LEVEL.JUQI_LOW
    elseif rate < self.COSMOS_ACTIVE_RATE_2 then
        return self.COSMOS_JUQI_LEVEL.JUQI_MID
    else
        return self.COSMOS_JUQI_LEVEL.JUQI_HIGH
    end
end

--根据怒气比例获得可燃烧等级
function cosmos_burst:GetCosmosCanBurstLevel(burstLevel,rate)
    if burstLevel > self.COSMOS_BURST_LEVEL.BURST_NO then
        return self.COSMOS_BURST_LEVEL.BURST_NO
    elseif rate >= self.COSMOS_ACTIVE_RATE_3 then
        return self.COSMOS_BURST_LEVEL.BURST_HIGH
    elseif rate >= self.COSMOS_ACTIVE_RATE_2 then
        return self.COSMOS_BURST_LEVEL.BURST_MID
    elseif rate >= self.COSMOS_ACTIVE_RATE_1 then
        return self.COSMOS_BURST_LEVEL.BURST_LOW
    else
        return self.COSMOS_BURST_LEVEL.BURST_NO
    end
end
--获取怒气描述
function cosmos_burst:GetCosmosApDesc(curAp,maxAp)
	local hint_str
    if curAp >= maxAp then
        hint_str = STRING_TABLE.COSMOS_FULL_HINT        
    else
        hint_str = Format(STRING_TABLE.COSMOS_PERCENT, math.floor(curAp/maxAp * 100))
    end
    return hint_str
end
--小宇宙爆发ui是否激活
function cosmos_burst:IsCosmosBurstUiAcitve()
    local lev = GameApi.GetHostSkillLevel(COSMOS_ACTIVE_SKILL)
    return not (not lev) and lev > 0
end

--小宇宙燃烧界面提示
--burstInfo: addonPackageIds-附加属性包列表,buffIds-1,2,3级
function cosmos_burst:GetCosmosBurstDesc(burstInfo)
	local burstDesc = {}
    local addonDesc = Addon_Func:GetAddonPackageSetDesc(burstInfo.addonPackageIds) or ""
    if Len(addonDesc) > 0 then
        addonDesc = STRING_TABLE.COSMOS_BURST_ADDON_COMMON_DESC .. "\r" .. addonDesc
    else
        addonDesc = STRING_TABLE.COSMOS_BURST_NOADDON_COMMON_DESC
    end
	burstDesc.commonDesc = STRING_TABLE.COSMOS_BURST_COMMON_DESC
	burstDesc.levelDesc = {}
	for i,levelBuffIds in ipairs(burstInfo.buffIds) do
		local _levelDesc = STRING_TABLE.COSMOS_BURST_LEVEL_COMMON_DESC[i] or ""
        --把附加属性包描述放到1阶段
        if i == 1 and Len(addonDesc)>0 then 
            _levelDesc = _levelDesc.."\r"..addonDesc
        end
        --附加Buff描述
		for _,buffId in ipairs(levelBuffIds) do
			local _buffDesc = skill_man:GetBuffDesc(buffId)
			if _buffDesc and Len(_buffDesc)>0 then
				if Len(_levelDesc) > 0 then _levelDesc = _levelDesc.."\r" end
				_levelDesc = _levelDesc .. _buffDesc
			end
		end
		burstDesc.levelDesc[i] = _levelDesc
	end
	return burstDesc
end