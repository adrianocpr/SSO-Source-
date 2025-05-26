pk_cfg = {}

PKFunc = {}

LEAGUE_PK_INSTANT_ID	= 33 	-- 军团PK赛场景ID, 特殊场景

TEAM_PK_INSTANT_ID_PRE = 60
TEAM_PK_INSTANT_ID_TAB = {}
TEAM_PK_INSTANT_ID_TAB = {[51] = 51,[52] = 52,[53] = 53,[54] = 54,[55] = 55,[56] = 56,[57] = 57,[58] = 58,[59] = 59,}
INSTANT_ID_TO_SHOW_KILL_GFX = {}


function PKFunc:IsInTeamPKMap(instId)
    if TEAM_PK_INSTANT_ID_TAB[instId] ~= nil then
        return true
    end
    
    return false
end

function PKFunc:IsInTeamPKAllMap(instId)
    if TEAM_PK_INSTANT_ID_TAB[instId] ~= nil then
        return true
    end
    
    if TEAM_PK_INSTANT_ID_PRE == instId then
    	return true
    end
    
    return false
end

function PKFunc:CheckShowTeamPKGfx(instType,instId)
	if instType == INST_TYPE_WAR then return true end
	-- 竞技场类型不要判断
    if IsInTeamPKMap(instId) then return true end
    if INSTANT_ID_TO_SHOW_KILL_GFX[instId] ~= nil then return true end
    return false
end