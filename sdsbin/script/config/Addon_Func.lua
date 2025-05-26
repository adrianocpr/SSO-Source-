---------------------------------------------------------------
--  created:   2012.11.1
--  author:    chenfudun
--
--  属性包配置接口
---------------------------------------------------------------

local GameApi = GameApi
local Addon_Templ = Addon_Templ

Addon_Func = {}

--属性包缓冲区
Addon_Cache = {}

--属性包属性数据
--addonPackgeId：属性包id
--返回值：属性包属性数据
function Addon_Func:GetAddonPackageData(addonPackgeId)
	local addon_set = {}
	if Addon_Cache[addonPackgeId] == nil then
		Addon_Cache[addonPackgeId] = GameApi.GetAddonData(addonPackgeId) or nil
	end
	local addonData = Addon_Cache[addonPackgeId]
	if addonData ~= nil then
		addon_set[0] = { ["type"] = 0, ["param1"] = addonData.fight_power, ["param2"] = 0, ["param3"] = 0 }
		if addonData.addon_count ~= nil and addonData.addon_count > 0 then
			for i=1,addonData.addon_count do
				local addon = addonData.addons[i] or nil
				if addon then
					if addon_set[addon.type] == nil then
						addon_set[addon.type] = { ["type"] = addon.type, ["param1"] = addon.param1, ["param2"] = addon.param2, ["param3"] = addon.param3 }	
					else
						addon_set[addon.type].param1 = addon_set[addon.type].param1 + addon.param1
						addon_set[addon.type].param2 = addon_set[addon.type].param2 + addon.param2
						addon_set[addon.type].param3 = addon_set[addon.type].param3 + addon.param3											
					end
				end
			end
		end
	end
	return addon_set
end

--属性包描述字符串
--addonPackgeId：属性包id
--bNotFightPower：是否不包含战斗力,一般物品描述时不需要，只有圣衣比较等情况下才需要
--返回值：属性包描述字符串
function Addon_Func:GetAddonPackageDesc(addonPackgeId, bNotFightPower)
	if addonPackgeId == nil then
		return
	end
	
	local addonStrDesc = ""
	local addonData = self:GetAddonPackageData(addonPackgeId)
	return self:_GetAddonDesc(addonData,bNotFightPower)
end

--把属性包数值转为描述串序列
function Addon_Func:ConvertAddonDataToDescList(addonData,bNotFightPower)
	local descTable = {}
	if not addonData then
		return descTable
	end
	local addonStrDesc = ""
	if addonData[0] ~= nil and Addon_Templ[0] ~= nil and bNotFightPower ~= nil and bNotFightPower == false then
		local addon = addonData[0]
		local addon_templ = Addon_Templ[0]
		addonStrDesc = string.format(addon_templ.format, addon.param1*addon_templ.mul_power, addon.param2*addon_templ.mul_power, addon.param3*addon_templ.mul_power)
		table.insert(descTable, addonStrDesc)
	end
	addonData[0] = nil
	for _, addon in pairs(addonData) do
		local addon_templ = Addon_Templ[addon.type] or nil
		if addon_templ then		
			if addon.type > 0 then
				addonStrDesc = string.format(addon_templ.format, addon.param1*addon_templ.mul_power, addon.param2*addon_templ.mul_power, addon.param3*addon_templ.mul_power)
				table.insert(descTable, addonStrDesc)
			end
		end
	end
	return descTable
end
--属性包描述字符串
--addonPackgeId：属性包id
--bNotFightPower：是否不包含战斗力,一般物品描述时不需要，只有圣衣比较等情况下才需要
--返回值：属性包描述字符串列表
function Addon_Func:GetAddonPackageDescList(addonPackgeId, bNotFightPower)
	local addonData = self:GetAddonPackageData(addonPackgeId)
	return self:ConvertAddonDataToDescList(addonData,bNotFightPower)
end

function Addon_Func:GetAddonPackageSetDescList(addonPackageIds,bNotFightPower)
	local addonData = self:GetAddonPackageSetData(addonPackageIds)
	return self:ConvertAddonDataToDescList(addonData,bNotFightPower)
end
-- 两个属性包比较结果字符串
-- mainAddonPackgeId：主属性包id
-- assistAddonPackageId：辅助属性包id
-- bCompareSort：比较顺序，{["true"]=主属性包-辅助属性包，["false"]=辅助属性包-主属性包}
--               默认true(即无值或者为true都是默认情形)
-- bNotFightPower:是否比较战力，nil和false表示比较
-- 返回值：{主属性包描述字符串:比较结果属性包}
function Addon_Func:GetCompareAddonPackageDesc(mainAddonPackgeId, assistAddonPackageId, bCompareSort,bNotFightPower)
	local addonStrDesc = ""
	if mainAddonPackgeId == nil or assistAddonPackageId == nil then
		return addonStrDesc
	end

	local mainAddonData = self:GetAddonPackageData(mainAddonPackgeId)
	local assistAddonData = self:GetAddonPackageData(assistAddonPackageId)
	local diffAddonData = {}

	-- set difference of main addon and assist addon
	for _, mainAddon in pairs(mainAddonData) do
		if assistAddonData[mainAddon.type] ~= nil then
			assistAddon = assistAddonData[mainAddon.type]
			diffAddonData[mainAddon.type] = { ["type"] = mainAddon.type, ["param1"] = mainAddon.param1 - assistAddon.param1, ["param2"] = mainAddon.param2 - assistAddon.param2, ["param3"] = mainAddon.param3 - assistAddon.param3 }
		else
			diffAddonData[mainAddon.type] = { ["type"] = mainAddon.type, ["param1"] = mainAddon.param1 - 0, ["param2"] = mainAddon.param2 - 0, ["param3"] = mainAddon.param3 - 0 }
		end
	end

	for _, assistAddon in pairs(assistAddonData) do
		if diffAddonData[assistAddon.type] == nil then
			diffAddonData[assistAddon.type] = { ["type"] = assistAddon.type, ["param1"] = 0 - assistAddon.param1, ["param2"] = 0 - assistAddon.param2, ["param3"] = 0 - assistAddon.param3 }
		end
	end

	-- set the result description
	local strPrefixTable = {}
	local strPostfixTable = {}
	local maxStrLen = 0
	local addonStrPrefix = {}

	local prefixDesc,postfixDesc = "",""
	-- 最先显示战力
	if not bNotFightPower then
		prefixDesc = self:GetAddonPrefixDesc(Addon_Templ[0], mainAddonData[0])
		postfixDesc = self:GetAddonPostfixDesc(diffAddonData[0], bCompareSort)
		table.insert(strPrefixTable, prefixDesc)
		table.insert(strPostfixTable, postfixDesc)	
	end
	diffAddonData[0] = nil

	for _, resultAddon in pairs(diffAddonData) do
		local addon_templ = Addon_Templ[resultAddon.type] or nil
		if addon_templ then
			local strDesc = self:GetAddonPrefixDesc(Addon_Templ[resultAddon.type], mainAddonData[resultAddon.type])
			if strDesc ~= nil and maxStrLen < string.len(strDesc) then
				maxStrLen = string.len(strDesc)
			end
			addonStrPrefix[resultAddon.type] = strDesc
			table.insert(strPrefixTable, strDesc)
		end			
	end

	addonStrDesc = prefixDesc .. string.rep(" ", (maxStrLen - string.len(prefixDesc)) * 2) .. postfixDesc

	for _, resultAddon in pairs(diffAddonData) do
		if addonStrDesc ~= "" then
			addonStrDesc = addonStrDesc .. "\r"
		end
		local strDesc = addonStrPrefix[resultAddon.type]
		addonStrDesc = addonStrDesc .. strDesc .. string.rep(" ", (maxStrLen - string.len(strDesc)) * 2)
		
		local postfixDesc = self:GetAddonPostfixDesc(resultAddon, bCompareSort)	
		addonStrDesc = addonStrDesc .. postfixDesc
		table.insert(strPostfixTable, postfixDesc)
	end

	--return addonStrDesc
	return strPrefixTable, strPostfixTable	
end

function Addon_Func:GetAddonPrefixDesc(addon_templ, addon)
	local strDesc = ""
	if addon ~= nil and addon_templ ~= nil then
		strDesc = string.format(addon_templ.format, addon.param1*addon_templ.mul_power, addon.param2*addon_templ.mul_power, addon.param3*addon_templ.mul_power)
	else
		strDesc = string.format(addon_templ.format, 0, 0, 0)
	end

	return strDesc
end

function Addon_Func:GetAddonPostfixDesc(addon, bCompareSort)
	local strEqual = _t"＝"
	local strBeyond, strBelow
	if bCompareSort == nil or bCompareSort then
		strBeyond = _t"↑"
		strBelow  = _t"↓"
	else
		strBeyond = _t"↓"
		strBelow  = _t"↑"
	end

	local postfixDesc = ""	
	if addon.param1 > 0 then
		postfixDesc = strBeyond .. string.format(" %d", addon.param1)			
	elseif addon.param1 < 0 then
		postfixDesc = strBelow .. string.format(" %d", addon.param1 * (-1))				
	else
		postfixDesc = " "
--	else
--		postfixDesc = strEqual .. string.format(" %d", addon.param1)		
	end

	return postfixDesc
end

--值比较,如果valDiff为空只返回主描述，如果addonTempId不填，则默认为战力
--wangliang
function Addon_Func:GetAddOnValueCompareDesc(valMain,valDiff,addonTempId)
	if not addonTempId then
		addonTempId = 0
	end
	if not Addon_Templ[addonTempId] then
		return
	end
	local prefixDesc = {}
	local postfixDesc = nil
	table.insert(prefixDesc,string.format(Addon_Templ[addonTempId].format,valMain))
	if valDiff then
		local delta = valDiff-valMain
		local op
		if delta > 0 then
			op = _t"↑"
		elseif delta < 0 then
			op = _t"↓"
			delta = -delta
		end
		local postStr = ""
		if delta ~=0 then
			postStr = string.format("%s %d",op,delta)
		end
		postfixDesc = {}
		table.insert(postfixDesc,postStr)
	end
	return prefixDesc,postfixDesc
end
-- self called 获取多个属性包累积在一起的附加属性数据
function Addon_Func:GetAddonPackageSetData(addonPackageIds)
	local addon_set = {}
	for _,addonPackageId in ipairs(addonPackageIds) do
		local onePackData = self:GetAddonPackageData(addonPackageId)
		for _,addon in pairs(onePackData) do
			if addon_set[addon.type] == nil then
				addon_set[addon.type] = { ["type"] = addon.type, ["param1"] = addon.param1, ["param2"] = addon.param2, ["param3"] = addon.param3 }	
			else
				addon_set[addon.type].param1 = addon_set[addon.type].param1 + addon.param1
				addon_set[addon.type].param2 = addon_set[addon.type].param2 + addon.param2
				addon_set[addon.type].param3 = addon_set[addon.type].param3 + addon.param3											
			end
		end
	end
	return addon_set
end
--self called 获取描述, bNotFightPower = nil or true时不生成战力
function Addon_Func:_GetAddonDesc(addonData, bNotFightPower)
	local addonStrDesc = ""
	if addonData[0] ~= nil then
		if Addon_Templ[0] ~= nil and bNotFightPower == false then
			local addon = addonData[0]
			local addon_templ = Addon_Templ[0]
			addonStrDesc = self:FormatAddonDesc(addon)
			--addonStrDesc = string.format(addon_templ.format, addon.param1*addon_templ.mul_power, addon.param2*addon_templ.mul_power, addon.param3*addon_templ.mul_power)
		end
		addonData[0] = nil
	end

	for _, addon in pairs(addonData) do
		local addon_templ = Addon_Templ[addon.type]
		if addon_templ then
			if addonStrDesc ~= "" then
				addonStrDesc = addonStrDesc .. "\r"
			end			
			if addon.type > 0 then
				addonStrDesc = addonStrDesc .. self:FormatAddonDesc(addon)
				--addonStrDesc = addonStrDesc .. string.format(addon_templ.format, addon.param1*addon_templ.mul_power, addon.param2*addon_templ.mul_power, addon.param3*addon_templ.mul_power)
			end
		end
	end
	return addonStrDesc
end

function Addon_Func:FormatAddonDesc(addon)
	local strDesc = ""
	if not Addon_Templ or not addon or type(addon) ~= "table" then
		return strDesc
	end

	local addon_templ = Addon_Templ[addon.type]
	if not addon_templ or type(addon_templ) ~= "table" then
		return strDesc
	end

	strDesc = string.format(addon_templ.format, addon.param1*addon_templ.mul_power, addon.param2*addon_templ.mul_power, addon.param3*addon_templ.mul_power)

	-- 是否需要特殊处理
	if Addon_Special_Templ_Id and type(Addon_Special_Templ_Id) == "table" then
		for k,special_types in pairs(Addon_Special_Templ_Id) do
			for i,v in ipairs(special_types) do
				if v == addon.type then
					if k == ADDON_SPECIAL_SKILL then
						strDesc = self:Addon_Special_Skill_Func(addon)
						return strDesc
					end
				end
			end
		end
	end

	return strDesc
end

function Addon_Func:Addon_Special_Skill_Func(addon)
	if not skill_desc or not addon or type(addon) ~= "table" then 
		return "" 
	end
	local addon_templ = Addon_Templ[addon.type]
	if not addon_templ or type(addon_templ) ~= "table" then
		return ""
	end
	
	local skill_name = skill_desc:GetSkillName(addon.param1)
	local strDesc = string.format(addon_templ.format, skill_name, addon.param2*addon_templ.mul_power, addon.param3*addon_templ.mul_power)
	return strDesc
end

--other called 获取附加属性包集合的累积描述
function Addon_Func:GetAddonPackageSetDesc(addonPackageIds,bNotFightPower)
	local addonSetData = self:GetAddonPackageSetData(addonPackageIds)
	return self:_GetAddonDesc(addonSetData,bNotFightPower)
end