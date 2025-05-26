--技能描述生成文件

local Format,Gsub,Match,Len,Find,Sub  = string.format,string.gsub,string.match,string.len,string.find,string.sub
local Concat,Insert = table.concat,table.insert
local GameApi       = GameApi

-------------------------------------
--      外部调用接口
-------------------------------------
--获取技能描述结构,普通技能pseudoType=nil
--spec参数用于补充的一些特殊设定 {useActive = true/false}
function skill_desc:GetDesc_Ui(skillID,level,context,pseudoType,mask)
    return self:GetDesc(skillID,level,context,false,pseudoType,mask)
end

--获取技能描述字符串，去除分隔线"\t",普通技能pseudoType=nil
function skill_desc:GetDesc_Str(skillID,level,context,pseudoType)
    local skilldesc = self:GetDesc(skillID,level,context,true,pseudoType)
    local result = {}
    for _,levelInfo in ipairs(skilldesc) do
        if levelInfo.title then Insert(result,levelInfo.title) end
        if levelInfo.base then Insert(result,levelInfo.base) end
        if levelInfo.commonDesc then Insert(result,levelInfo.commonDesc) end
        if levelInfo.useDesc then Insert(result,levelInfo.useDesc) end
        if levelInfo.soulDesc then Insert(result,levelInfo.soulDesc) end
    end
    return Concat(result,"\r")
end

--获取伪技能描述结构
function skill_desc:GetPseudoSkillDesc_Ui(skillID,pseudoType)
    return self:GetDesc_Ui(skillID,1,self.CONTEXT.SKILL_NORMAL,pseudoType)
end
--获取伪技能描述字符串，去除分隔线"\t"
function skill_desc:GetPseudoSkillDesc_Str(skillID,pseudoType)
    return self:GetDesc_Str(skillID,1,self.CONTEXT.SKILL_NORMAL,pseudoType)
end
--获取内嵌比较的描述结构，都是非伪技能，所以暂时不用pseudoType参数
function skill_desc:GetDesc_WithComp(skillID,level,isNeedNext)
    local result = {}
    result.CompTitle = self:GetCompTitle(skillID,level,isNeedNext)
    if level == 0 then 
        level = 1
        isNeedNext = false
    end
    result.base = self:GetBaseInfo(skillID,level)
    result.commonDesc = self:GetCompCommonDesc(skillID)
    result.compDesc = self:GetCompDesc(skillID,level,isNeedNext)
    result.soulDesc = self:GetSoulDesc(skillID,level,false,true)
    return result
end
-------------------------------------
--      内部调用接口
-------------------------------------
--获取技能的描述的接口，需传入技能
--skillID: 技能id; context:上下文;  level:技能等级，请根据上下文来输入学习等级、显示等级
--返回描述为{curLevelInfo,nextLevelInfo(可能没有)，
--每级信息中包括名字、基础信息、使用描述}
-- pseudoType ，如果有值则为伪技能
-- mask，如果有，则为掩码，用于一些特殊设定
function skill_desc:GetDesc(skillID,level,context,isStr,pseudoType,mask)
    local result = {}
    if self:IsReallyPseudo(pseudoType) then
        if not pseudo_skill_str[pseudoType][skillID] then
            return result
        end
    else
        if not skill_data[skillID] then --"error"..skillID..":"..context
            return result 
        end 
    end
    if level==0 then
        context= self.CONTEXT.SKILL_NORMAL
    end

    --技能面板/快捷面板
    if context == self.CONTEXT.SKILL_NORMAL or context == self.CONTEXT.QUICK_BAR then
        if level==0 then
            result[1] = 
            {
                title = self:GetNameLevel(skillID,level,false,isStr,pseudoType,mask),
                base = self:GetBaseInfo(skillID,level+1,isStr,pseudoType),
                commonDesc = self:GetCommonDesc(skillID,pseudoType),
                useDesc = self:GetUseDesc(skillID,level+1,isStr,pseudoType),
                soulDesc = self:GetSoulDesc(skillID,level+1,isStr,false,pseudoType),
            }
        else
        	result[1] = 
            {
                title = self:GetNameLevel(skillID,level,false,isStr,pseudoType),
                base = self:GetBaseInfo(skillID,level,isStr,pseudoType),
                commonDesc = self:GetCommonDesc(skillID,pseudoType),
                useDesc = self:GetUseDesc(skillID,level,isStr,pseudoType),
                soulDesc = self:GetSoulDesc(skillID,level,isStr,false,pseudoType),
            }
        
        end
    --技能学习面板悬浮 当前等级和下一等级
    elseif context == self.CONTEXT.SKILL_LEVEL_UP then
        if level==0 then
            result[1] = 
            {
                title = self:GetNameLevel(skillID,level,false,isStr,mask),
                base = self:GetBaseInfo(skillID,level+1,isStr),
                commonDesc = self:GetCommonDesc(skillID),
                useDesc = self:GetUseDesc(skillID,level+1,isStr),
                soulDesc = self:GetSoulDesc(skillID,level+1,isStr),
            }
            
        else
            result[1] =
            {
                title = self:GetNameLevel(skillID,level,false,isStr),
                base = self:GetBaseInfo(skillID,level,isStr),
                commonDesc = self:GetCommonDesc(skillID),
                useDesc = self:GetUseDesc(skillID,level,isStr),
                soulDesc = self:GetSoulDesc(skillID,level,isStr),
            }
            result[2] = 
            {
                title = self:GetNameLevel(skillID,level+1,true,isStr),
                useDesc = self:GetUseDesc(skillID,level+1,isStr),
            }
        end
    end
    return result
end

--是否是真的伪技能，可能是普通技能伪装的
function skill_desc:IsReallyPseudo(pseudoType)
    if pseudoType and pseudoType ~= PseudoSkillType.BASIC then
        return true
    else
        return false
    end
end

--获取描述字符串
function skill_desc:GetDescStr(skillID,pseudoType)
    if self:IsReallyPseudo(pseudoType) then
        return pseudo_skill_str[pseudoType][skillID]
    else
        return skill_desc_str[skillID]
    end
end

--获取名字等级
function skill_desc:GetNameLevel(skillID,level,isNext,isStr,pseudoType,mask)
    local nameLevel = {}
    local skillDescStr = self:GetDescStr(skillID,pseudoType)
    if skillDescStr then
        if isNext then
            nameLevel.name = self.strNextName
        else
            nameLevel.name = Format(self.strName,skillDescStr.strName)
        end
        if not pseudoType then --伪技能无等级
            if level > 0 then
                nameLevel.level = Format(self.strLevel,level)
            else
                if mask == self.MASK.HINT_SKILL_ACTIVE then --使用未激活
                    nameLevel.level = self.strUnActiveLevel
                else    
                    nameLevel.level = self.strUnlearnLevel
                end
                nameLevel.nextLevel = Format(self.strLevel,level+1)
            end
        end
    end
    if not isStr then
        return nameLevel
    else
        if nameLevel.name and Len(nameLevel.name)>0 then
            return nameLevel.name --字符串描述中只给出名字
        end
    end
end
--获取技能的冷却时间、执行时间、释放距离
function skill_desc:GetBaseInfo(skillID,level,isStr,pseudoType)
    local baseInfo = {}

    if self:IsReallyPseudo(pseudoType) then --伪技能
        baseInfo.icon = pseudo_skill_str[pseudoType][skillID].icon
        baseInfo.pseudoType = pseudoType
        if isStr then
            return
        else
            return baseInfo
        end
    end

    local skill = skill_man:GetSkillData(skillID)
    if skill then
        baseInfo.icon = skill.icon
        if skill.type ~=skill_type.TYPE_PASSIVE then
            --冷却时间
            local coolDownTime = self:GetFormulaValue(skillID,level,skill.cooldown_time)
            if coolDownTime >0 then
                -- = Format(self.strUnCoolTime)
                Insert(baseInfo,Format(self.strCoolTime,coolDownTime/1000))
            else
                Insert(baseInfo,"")
            end

            --执行时间
            local executeTime = self:GetFormulaValue(skillID,level,skill.execute_time)
            if executeTime==0 then
                Insert(baseInfo,Format(self.strInstantExecute))
            else
                Insert(baseInfo,Format(self.strExecuteTime,executeTime/1000))
            end

            --追击距离
            if skill.rangetype < skill_attack_range.RANGE_POINT or
                skill.rangetype > skill_attack_range.RANGE_SELFBALL then --不是不选对象的自身范围技能
            local pursueDistance = self:GetFormulaValue(skillID,level,skill.pursue_distance)
                Insert(baseInfo,Format(self.strAttackrange,pursueDistance))
            else
                Insert(baseInfo,skill_desc.strAttackrangeSelf)
            end
        end
    end
    if isStr then
        local desc = ""
        for i=1,#baseInfo do
            if Len(baseInfo[i]) > 0 then
                desc = desc ..baseInfo[i].."\r" 
            end
        end
        desc = glb_FilterNewLine(desc)
        if Len(desc)>0 then return desc end
    else
        return baseInfo
    end
end
--执行字符串，生成执行后的字符串
function skill_desc:execute_str(fmt,...)
    fmt = Gsub(fmt,"\r","\\r")
    local str = Format("return string.format(\"%s\"",fmt)
    for _,strParam in ipairs(arg) do
        str = str .. Format(",%s",strParam)
    end
    str = str .. ")"
    local chunk = loadstring(str)
    if chunk then
        local env = {math = math,string = string, skill_desc=skill_desc,
        skill_desc_str=skill_desc_str,GameApi=GameApi,}
        setfenv(chunk,env)
        local ret, value = pcall(chunk)
        if ret and value then
            return value
        end
    end
end

--计算字符串表达式值
function skill_desc:CalcStrValue(str)
    local chunk = loadstring("return "..str)
    if chunk then
        local env = {math = math,string = string,skill_desc=skill_desc,
        skill_desc_str=skill_desc_str,GameApi=GameApi,}
        setfenv(chunk, env)
        local ret, value = pcall(chunk)
        if ret and value then
            return value
        end
    end
    return 0    
end

function skill_desc:_GetCommonDesc(skillID,showActType,pseudoType)
    local skillDescStr = self:GetDescStr(skillID,pseudoType)
    local result = {}
    if skillDescStr then
        if showActType and skillDescStr.StrAttacktype then
            local attackDesc = glb_FilterNewLine(self.Font.skillAttacktype..self.Color.skillAttacktype..skillDescStr.StrAttacktype)
            attackDesc = self:execute_str(attackDesc)
            if attackDesc then
                Insert(result,attackDesc)
            end
        end
      
        if skillDescStr.StrMana and Len(skillDescStr.StrMana)>0 then
            local skill = skill_man:GetSkillData(skillID)
            local strMana = glb_FilterNewLine(self.Font.skillMana..self.Color.skillMana..skillDescStr.StrMana)
            local argsPart = nil
            if string.find(strMana,"%d") then --需要引公式的情况
                if skill.energy1_cost and skill.energy1_cost~="0" then
                	argsPart=skill.energy1_cost
                elseif skill.energy2_cost and skill.energy2_cost~="0" then
                	argsPart=skill.energy2_cost
                else
                    argsPart="0"
                end
                argsPart = self:GetFormulaValue(skillID,1,argsPart)  --等级不影响消耗，1是随便传的
                strMana = self:execute_str(strMana,argsPart)
            else --纯文字
            	strMana = self:execute_str(strMana)
            end
            if strMana then
                Insert(result,strMana)
            end
        end
        if skillDescStr.StrFuncdesc then
            local funcDesc = glb_FilterNewLine(self.Font.skillFuncdesc..self.Color.skillFuncdesc..skillDescStr.StrFuncdesc)
            funcDesc = self:execute_str(funcDesc)
            if funcDesc then
                Insert(result,funcDesc)
            end
        end
    end
    local desc = ""
    for i=1,#result do
        if Len(result[i]) > 0 then
            desc = desc ..result[i].."\r" 
        end
    end
    desc = glb_FilterNewLine(desc)

    if Len(desc)>0 then return desc end
end

--获得通用描述
function skill_desc:GetCommonDesc(skillID,pseudoType)
    return self:_GetCommonDesc(skillID,true,pseudoType)
end

--在UseDesc中如使用分割线，请使用"\t"
function skill_desc:GetUseDesc(skillID,level,isStr,pseudoType)
   local skillDescStr = self:GetDescStr(skillID,pseudoType)
   if skillDescStr and skillDescStr.StrUseDesc then
        local argsStr = nil
        if skillDescStr.StrDescNum then
            argsStr = Gsub(skillDescStr.StrDescNum,";",",")
            argsStr = skill_man:GetFormulaValueStr(skillID,level,argsStr)
        end
        local desc = self:execute_str(skillDescStr.StrUseDesc,argsStr)
        if desc and Len(desc) > 0 then
            desc = self.Font.skillUsedesc..self.Color.skillUsedesc..desc
            desc = Gsub(desc,"\t","\t"..self.Font.skillUsedesc..self.Color.skillUsedesc)
            desc = glb_FilterNewLine(desc)
            if isStr then
                desc = Gsub(desc,"\t","\r")
            end
            if Len(desc)>0 then return desc end
        end
   end
end

function skill_desc:GetCompTitle(skillID,level,isNeedNext)
    local CompTitle = {}
    local skillDescStr = skill_desc_str[skillID]
    if skillDescStr then
        if skillDescStr.StrAttacktype then
            local atkType = glb_FilterNewLine(self.Font.skillAttacktype..self.Color.skillAttacktype..skillDescStr.StrAttacktype)
            atkType = self:execute_str(atkType)
            if atkType then
                CompTitle.atkType = atkType
            end
        end
        if isNeedNext then
            CompTitle.nextLevel = Format(self.strNextLevel,level+1)
        end
    end
    return CompTitle
end
--获取用于比较的通用描述
function skill_desc:GetCompCommonDesc(skillID)
    return self:_GetCommonDesc(skillID,false)
end

--获取带比较的描述部分，返回值包括前半段，后半段，段数
function skill_desc:GetCompDesc(skillID,level,isNeedNext)
    local skillDescStr = skill_desc_str[skillID]
    if skillDescStr and skillDescStr.StrCompDesc then
        local descStr = Gsub(skillDescStr.StrCompDesc,"\t","\r\t\r") --将\t拆成独立的一行
        local compTab = glb_StringSplit(descStr,"\r")
        local compArgTab = glb_StringSplit(skillDescStr.StrDescNum,";")
        local argIndex = 1
        local result = {}
        result.pre = {}
        result.post = {}
        result.count = #compTab
        for i,compStr in ipairs(compTab) do
            result.pre[i],result.post[i],argIndex = self:GetOneCompDesc(
                skillID,compStr,compArgTab,argIndex,level,isNeedNext)
        end
        return result
    end
end
--只处理一个由{}括起来的部分,模式为"%{.-%%d.-%}"，
--compStr中的参数只检测"%%[ds]"
local compDescDefaultFontColor = skill_desc.Font.skillUsedesc..skill_desc.Color.skillUsedesc
function skill_desc:GetOneCompDesc(skillID,compStr,argTab,argIndex,level,isNeedNext)
    --计算左边
    local preStr = Gsub(compStr,"[%{%}]","")
    local argCount = glb_StringMatchCount(preStr,"%%[ds]")
    local preArgStr = ""
    for i=1,argCount do
        preArgStr = preArgStr..skill_man:GetFormulaValueStr(skillID,level,argTab[argIndex+i-1])
        if i ~= argCount then
            preArgStr = preArgStr .. ","
        end
    end
    if Len(preArgStr) == 0 then
        preArgStr = nil
    end
    preStr = self:execute_str(preStr,preArgStr)
    if preStr and Len(preStr)>0 and preStr ~="\t" then
        preStr = compDescDefaultFontColor..preStr
    end
    local nextArgIndex = argIndex+argCount
    --计算右边
    local postStr = nil
    if isNeedNext then --如果需要下一级的比较数据
        local pos = Find(compStr,"%{.-%}")--只处理第一个"{}""
        if pos then
            local preCompStr = Sub(compStr,1,pos-1)
            local compValStartIndex = argIndex + glb_StringMatchCount(preCompStr,"%%[ds]")
            postStr = Match(compStr,"%{(.-)%}")
            local deltaStr = ""
            local i,j,compValIndex = 1,0,compValStartIndex
            while true do
                i,j = Find(postStr,"%%[ds]",j+1)
                if not i then break end --找不到就退出循环
                if Sub(postStr,i,j) == "%d" then
                    local curVal = self:GetFormulaValue(skillID,level,argTab[compValIndex])
                    local nextVal = self:GetFormulaValue(skillID,level+1,argTab[compValIndex])
                    local delta = math.floor(nextVal)-math.floor(curVal)
                    if delta ~= 0 then
                        local op = _t"↑"
                        if delta < 0 then op = _t"↓" end
                        deltaStr = deltaStr..Format("(%s%d)",op,delta)
                    end
                end
                compValIndex = compValIndex+1
            end
            postStr = postStr..deltaStr
            local count = glb_StringMatchCount(postStr,"%%[ds]")
            local postArgStr = ""
            for i=1,count do
                postArgStr = postArgStr..skill_man:GetFormulaValueStr(skillID,level+1,argTab[compValStartIndex+i-1])
                if i ~= count then
                    postArgStr = postArgStr .. ","
                end
            end
            if Len(postArgStr) == 0 then
                postArgStr = nil
            end
            postStr = self:execute_str(postStr,postArgStr)
            if postStr and Len(postStr)>0 then
                postStr = compDescDefaultFontColor..postStr
            end
        end
    end
    return preStr,postStr,nextArgIndex
end

function skill_desc:GetNextNameLevel(skillID,level)
    return Format(self.strNextLevel,level)
end
--showUnAct参数标注是否显示非激活
function skill_desc:GetSoulDesc(skillID,level,isStr,showUnAct,pseudoType)
    local skillDescStr = self:GetDescStr(skillID,pseudoType)
    if skillDescStr and skillDescStr.SkillSoul then
        local act,unAct = {},{}
        for id,soulDesc in pairs(skillDescStr.SkillSoul) do
            if soulDesc.desc and skill_desc_str[id] then
                local isActive = GameApi.IsSoulSkillActive(id)
                if isActive or showUnAct then
                    local argsStr = nil
                    if soulDesc.num then
                        argsStr = Gsub(soulDesc.num,";",",")
                        argsStr = skill_man:GetFormulaValueStr(skillID,level,argsStr)
                    end
                    local resultDesc = self:execute_str(soulDesc.desc,argsStr)
                    if resultDesc and Len(resultDesc) > 0 then--有描述
                        local nameColor = isActive and self.Color.soulActiveName or self.Color.soulUnActiveName
                        local descColor = isActive and self.Color.soulActiveDesc or self.Color.soulUnActiveDesc
                        local nameFont = isActive and self.Font.soulActivNameFont or self.Font.soulUnActivNameFont
                        local descFont = isActive and self.Font.soulActivDescFont or self.Font.soulUnActivDescFont
                        local soulStr = Format("%s:%s", nameFont..nameColor .. skill_desc_str[id].strName,
                            descFont.. descColor .. resultDesc)
                        if isActive then
                            Insert(act,soulStr)
                        else
                            Insert(unAct,soulStr)
                        end
                    end
                end
            end
        end
        local result = {header="\r"..self.soulTag,desc={},}
        for _,soulStr in ipairs(act) do
            Insert(result.desc,soulStr)
        end
        for _,soulStr in ipairs(unAct) do
            Insert(result.desc,soulStr)
        end
        if #result.desc>0 then
            if isStr then
                return result.header.."\r"..Concat(result.desc,"\r")
            else
                return result
            end
        end
    end
end

--计算公式的值，公式中可有如下参数
--t1..t8,player.level,level,player.skilllevel,player.bufflevel
function skill_desc:GetFormulaValue(skillId,skillLevel,formula)
    if not formula or Len(formula) <= 0 then
        return 0
    end
    --替换数值
    formula = skill_man:GetFormulaValueStr(skillId,skillLevel,formula)
    -- 计算公式
    return self:CalcStrValue(formula)
end
--获取技能名字 
function skill_desc:GetSkillName(skillID)
    local skillDescStr = skill_desc_str[skillID]
    if skillDescStr and "table"==type(skillDescStr) then
        local name = skillDescStr.strName
        if name and "string"==type(name) then
            return name
        end
    end
    return nil--"error"..skillID
end


--获取技能物品使用错误
function skill_desc:GetSkillItemErrStr(itemId, err_key)
    if itemId then
        local key = con_key .. Format("_ITEM%d", itemId)
        local str = STRING_TABLE[key]
        if str then return str end
    end
    return STRING_TABLE[err_key.."_ITEM_DEFAULT"] or err_key
end


--获取技能释放条件不足描述
function skill_desc:GetSkillCastConditionStr(skillId, con_key, profId)
    --特定技能
    if skillId then
        local key = con_key .. Format("_SKILL%d", skillId)
        local str = STRING_TABLE[key]
        if str then return str end
    end
    --特定职业
    if profId then
        local key = con_key .. Format("_PROF%d", profId)
        local str = STRING_TABLE[key]
        if str then return str end
    end
    --默认, CHECK_SKILL_CAST_CONDITION??_DEFAULT
    return STRING_TABLE[con_key.."_DEFAULT"] or con_key 
end