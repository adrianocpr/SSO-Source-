---------------------------------------------------------------
--  created:   2012.10.6
--  author:    chenfudun
--
--  NPC列表搜索功能
---------------------------------------------------------------

NpcListSearchFunc = {}

--------------------------------------------------------------------------------------------
--- 搜索接口：在 allNpcList 中搜索与输入 inputStr 相关的 NPC 列表
function NpcListSearchFunc:GetNPCList(inputStr, allNpcList)
	if SEARCH_LANGUAGE == "Chinese" then
	   return self:GetNPCList_ChineseInitials(inputStr, allNpcList)
	end
end

--------------------------------------------------------------------------------------------
--- 汉语拼音首字母搜索接口
function NpcListSearchFunc:GetNPCList_ChineseInitials(inputStr, allNpcList)
	if not inputStr or inputStr == "" then
	    return allNpcList
	end

	--搜索结果
	retNpcList = {}

	--输入的是非拼音或字母形式，直接匹配
	inputStrCapitals, bPinYin = self:GetChineseInitials(inputStr)
	if not bPinYin then
		for _, npcName in ipairs(allNpcList) do
	    	if string.find(npcName, inputStr) then    
	        	table.insert(retNpcList, npcName)
	    	end
		end

		return retNpcList
	end

	--输入的是拼音或字母形式，先计算全部 NPC 列表的首字母拼音序列然后再匹配
	allNpcPinYinList = {}
	for k, npcName in ipairs(allNpcList) do
		npcNameCapital = self:GetChineseInitials(npcName)
		allNpcPinYinList[k] = allNpcPinYinList[k] and (allNpcPinYinList[k] .. npcNameCapital) or npcNameCapital
	end
	
	for k, npcPinYinCapital in ipairs(allNpcPinYinList) do
	    if string.find(string.lower(npcPinYinCapital), string.lower(inputStr)) then 
	        table.insert(retNpcList, allNpcList[k])
	    end
	end
	
	return retNpcList 
end

--- 计算 strName 的汉语拼音首字母
function NpcListSearchFunc:GetChineseInitials(strName)
	iSectorCode = 0     --汉字区码
	iPosCode	= 0     --汉字位码
	iSecPosCode = 0     --汉字区位码
	iOffset	    = 0     --二级字库偏移量
	strRet   	= nil	--返回字符串
	bPinYin     = false --strName 是否是拼音/字符形式
		
	if string.len(strName) == 1 and string.byte(strName) < 128 then
	    return strName, true
	end
	
	for i = 1, string.len(strName) - 1, 2 do
		i1 = string.byte(strName,i)
		i2 = string.byte(strName,i+1)				
		if i1 < 128 then
			bPinYin = true
			strRet = strRet and (strRet .. string.sub(strName, 1, 1)) or string.sub(strName, 1, 1)
		else
		   	bPinYin = false
			iSectorCode = i1 - 160								--区码
			iPosCode 	= i2 - 160								--位码
			iSecPosCode = iSectorCode * 100 + iPosCode			--区位码
			if  iSecPosCode > 1600 and iSecPosCode < 5590 then	--第一个字符
				for j = 23, 0, -1 do             				--找声母
					if iSecPosCode >= CAreaPosValueTable[j] then
						strRet = strRet and (strRet .. CPYFirstAreaCapitalTable[j]) or CPYFirstAreaCapitalTable[j]
						break
					end
				end
			else
				iOffset = (iSectorCode - 56 ) * 94 + iPosCode - 1  --计算偏移量
				if iOffset >= 0 and iOffset <= 3007 then           --二区汉字
					strRet = strRet and (strRet .. CPYSecondAreaCapitalTable[iOffset]) or CPYSecondAreaCapitalTable[iOffset]
				end
			end
	    end
	end

	return strRet, bPinYin	
end

--------------------------------------------------------------------------------------------