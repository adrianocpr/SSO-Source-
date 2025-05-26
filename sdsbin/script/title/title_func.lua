local Match = string.match
local Len   = string.len
local Gsub  = string.gsub
local INVALID_ID = "0X0000000000000000"
local tostring, Log, GameApi = tostring, Log, GameApi
local STRING_TABLE = STRING_TABLE



----------------------
-- 称谓相关操作
module("title_func")

function _M:FormatTitle(title_text, player_id)
    local title_env = 
    {
        spouse = GameApi.GetPlayerName(GameApi.GetPlayerSpouse(player_id)) or "",
        companion = GameApi.GetPlayerName(GameApi.GetPlayerCompanion(player_id)) or "",
    }

    return title_text:expand(title_env)
end

function _M:GetSepcTitleText(titleId, playerId)
    -- 威望固定称谓
--    if 1 == titleId then
--        return GetReputationTitleText(playerId)
--    end        
--    return ""
end


function GetReputationTitleText(playerId)
    local reputation = GameApi.GetPlayerReputation(playerId)
    if reputation then
	    if ( reputation < 5000 ) then
			return STRING_TABLE.TITLE_REPUTATION1
	    elseif ( reputation < 25000 ) then
			return STRING_TABLE.TITLE_REPUTATION2
	    elseif ( reputation < 50000 ) then
			return STRING_TABLE.TITLE_REPUTATION3
	    elseif ( reputation < 100000 ) then
			return STRING_TABLE.TITLE_REPUTATION4
	    elseif ( reputation < 200000 ) then
			return STRING_TABLE.TITLE_REPUTATION5
	    elseif ( reputation < 500000 ) then
			return STRING_TABLE.TITLE_REPUTATION6
	    elseif ( reputation < 1000000 ) then
			return STRING_TABLE.TITLE_REPUTATION7
	    elseif ( reputation < 2000000 ) then
			return STRING_TABLE.TITLE_REPUTATION8
	    elseif( reputation < 5000000 ) then
			return STRING_TABLE.TITLE_REPUTATION9
	    else
	 		return STRING_TABLE.TITLE_REPUTATION10
        end
    end
    return ""
end



local jihe1={1,2,3,13,14,15}
local jihe2={4,5,6,16,17,18}
local jihe3={7,8,9,19,20,21}
local jihe4={10,11,12,22,23,24}
function GetSkillSpec(_, prof)
    for i = 1, 6 do
        if (prof == jihe1[i]) then
            return 0,1
        end
        if (prof == jihe2[i]) then
            return 0,2
        end
        if (prof == jihe3[i]) then
            return 0,3
        end
        if (prof == jihe4[i]) then
            return 0,4
        end
    end
    return 0,0
end

