AgeFunc = {}

function AgeFunc:GetAge(age_index)
	if age_index < 0 then
		return Age_BC[-age_index]
	end
    return Age[age_index]
end

function AgeFunc:GetAgeBoss(age_index)
    return Age_Boss[age_index]
end

function AgeFunc:GetAgeBossTitle(age_index)
    return Age_Boss_Title
end

function AgeFunc:GetAgeGlobalParamID()
    return Age_Boss_Global_Param_ID
end

function AgeFunc:GetAgeBossImgCfg()
    return Age_Boss_Img_Cfg
end

function AgeFunc:GetExpRatio(age_index,player_level)
    if age_lev_exp_cfg[player_level] ~= nil then
        if age_lev_exp_cfg[player_level][age_index] ~= nil then
            return age_lev_exp_cfg[player_level][age_index]
        end
    end
    return 1
end

function AgeFunc:GetTitleFontAndColor()
    return Age_FontAndColor
end

function AgeFunc:GetAgeNum()
    return #Age + #Age_BC
end

function AgeFunc:GetAgeBrief()
    local list = {}

    -- convert Age_BC (k) as Age (1 - k)
    if Age_BC ~= nil and type(Age_BC)=="table" then
        for k,v in ipairs(Age_BC) do
            local item = {}
            item.index = 1 - k
            item.name = v.name
            table.insert(list,1,item)
        end
    end

    if Age ~= nil and type(Age)=="table" then
        for k,v in ipairs(Age) do
            local item = {}
            item.index = k
            item.name = v.name
            table.insert(list,item)
        end
    end
    return list
end