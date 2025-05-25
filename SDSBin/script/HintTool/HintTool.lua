HintTool = {}

function HintTool:GetItemHint(item_info, context, show_id)
	local ret = ""    
    local head = {}
    item_info.context = context
    if show_id then 
        Insert(head, Format("id:%d", item_info.id)) 
    end
    local title, textList = LuaItemDesc:GetItemDesc(item_info.cid, item_info)

    --ret = ret .. self:ParseIcon(item_info.icon)
    ret = ret .. self:ParseIconId(item_info.id)
    ret = ret .. self:ParseTitle(title)
    ret = ret .. self:ParseText(textList)

    if item_info.extraItem then
        local extraHead = {}
        if show_id then
            Insert(extraHead,Format("id:%d", item_info.extraItem.id))
        end
        local extraTitle,extraTextList = LuaItemDesc:GetItemDesc(item_info.extraItem.cid,item_info.extraItem)
        ret = ret .. self:ParseIconId(item_info.extraItem.id)
        ret = ret .. self:ParseTitle(extraTitle)
   		ret = ret .. self:ParseText(extraTextList)
    end
    
    -- 替换 < > "
    ret = string.gsub(ret, "<", "&lt;")
    ret = string.gsub(ret, ">", "&gt;")
    ret = string.gsub(ret, "\"", "&quot;")
    return ret
end

function HintTool:GetSanitCloth(saint_cloth, show_id)
    local ret = ""  
    local title, textList = spec_desc:saint_cloth_desc(saint_cloth)

    local head = {}
    if show_id then
        Insert(head, Format("id:%d", saint_cloth.id))
    end
    
    --ret = ret .. self:ParseIcon(item_info.icon)
    ret = ret .. self:ParseClothIconId(saint_cloth.id,saint_cloth.grade)
    ret = ret .. self:ParseTitle(title)
    ret = ret .. self:ParseText(textList)
    
    -- 替换 < > "
    ret = string.gsub(ret, "<", "&lt;")
    ret = string.gsub(ret, ">", "&gt;")
    ret = string.gsub(ret, "\"", "&quot;")
    return ret
end

function HintTool:GetCosmosHint(cosmos_star, star_soul, show_id)
	local ret = ""    
	local head_list = spec_desc:cosmos_desc(cosmos_star)
    --for i, line in ipairs(head_list or {}) do
    --    head_list[i] = FilterNewLine(line)
    --end
    
    -- 未镶嵌星魂
    if not next(star_soul) then        
    	ret = ret .. self:ParseText(textList)
        return ret
    end    
    -- 镶嵌星魂数据
    if show_id then
        Insert(head_list, Format("id:%d", star_soul.id))
    end
    local title, textList = LuaItemDesc:GetItemDesc(star_soul.cid, star_soul)
    
    --ret = ret .. self:ParseIcon(item_info.icon)
    ret = ret .. self:ParseIconId(star_soul.id)
    ret = ret .. self:ParseTitle(title)
    ret = ret .. self:ParseText(textList)
    
    -- 替换 < > "
    ret = string.gsub(ret, "<", "&lt;")
    ret = string.gsub(ret, ">", "&gt;")
    ret = string.gsub(ret, "\"", "&quot;")
    return ret
end

function HintTool:GetSkillHint(skillInfo,context,show_id)
    local ret = "" 
    local skilldesc = skill_desc:GetDesc_Ui(skillInfo.id,skillInfo.level,context,nil,skillInfo.mask)
    local idx = 1
    local head = nil
    if show_id then
        head = Format("id:%d",skillInfo.id)
    end

    --ret = ret .. self:ParseIcon(item_info.icon)
    ret = ret .. self:ParseSkillIconId(skillInfo.name_id)
    ret = ret .. self:ParseSkillTitleName(skillInfo.name,skillInfo.level)
    ret = ret .. self:ParseSkillTitle(skilldesc[1].title)
    ret = ret .. self:ParseSkillText(skilldesc[1].base)
    ret = ret .. self:ParseSkillText(skilldesc[1].commonDesc)
    ret = ret .. self:ParseSkillText(skilldesc[1].useDesc)
    ret = ret .. self:ParseSkillText(skilldesc[1].soulDesc)
    
    -- 替换 < > "
    ret = string.gsub(ret, "<", "&lt;")
    ret = string.gsub(ret, ">", "&gt;")
    ret = string.gsub(ret, "\"", "&quot;")
    return ret
end


function HintTool:GetSoulArmor(armor, show_id)
	local ret = "" 
    local head = {}
    if show_id then        
        Insert(head, Format("id:%d", armor.armor_id))
    end

    local title, textList = spec_desc:armor_desc(armor)
    
    ret = ret .. self:ParseArmorIconId(armor.armor_id,armor.tp)
    ret = ret .. self:ParseTitle(title)
    ret = ret .. self:ParseText(textList)
    return ret
end


-- title 的格式
-- “^ffffff^O013物品名称^ffffff\r^ffffff战力 4000”
function HintTool:ParseTitle(title)
	local ret = ""
	for t in string.gfind(title,"([^\r]+)") do
		local newline = self:ParseTitleLine(t)
		if string.len(ret) > 0 and string.len(newline) > 0 then ret = ret.."EOL;" end
		ret = ret..""..newline
	end
	return ret
end

function HintTool:ParseSkillTitle(title)
	local ret = ""
	for k,v in ipairs(title) do
		if type(v) == "string" and string.len(v) > 0 then
			local newline = self:ParseTitleLine(v)
			if string.len(ret) > 0 and string.len(newline) > 0 then ret = ret.."EOL;" end
			ret = ret..""..newline
		end
	end
	return ret
end

function HintTool:ParseSkillTitleName(name,level)
	local ret = ""
	ret = "IconDesc|"..name.."|#ffffff;" -- 生成一规格文字
	ret = ret .."EOL;"
	ret = ret .. "IconDesc|"..level.."级|#ffffff;" -- 生成一规格文字
	return ret
end

-- text 的格式
-- “^ffffff^O013物品名称^ffffff\r^ffffff战力 4000”
function HintTool:ParseText(text)
	local ret = ""
	local is_sep = false
	for k,v in ipairs(text) do
		if type(v) == "string" and string.len(v) > 0 then
			local newline = self:ParseTextLine(v)
			if string.len(ret) > 0 and not is_sep and string.len(newline) > 0 then ret = ret.."EOL;" end
			if string.len(newline) > 0 then
				ret = ret..""..newline
				is_sep = false
			end
		elseif type(v) == "table" then
			if not is_sep then
				local newline = "Separator|png/sep.png;"
				ret = ret..""..newline
			end
			is_sep = true
		end
	end
	return ret
end

function HintTool:ParseSkillText(text)
	local ret = ""
	if text == nil then return ret end
	
	if type(text) == "string" and string.len(text) > 0 then
		for t in string.gfind(text,"([^\r]+)") do
			local newline = self:ParseTextLine(t)
			if string.len(ret) > 0 and string.len(newline) > 0 then ret = ret.."EOL;" end
			ret = ret..""..newline
		end
	else
		local is_sep = false
		for k,v in ipairs(text) do
			if type(v) == "string" and string.len(v) > 0 then
				local newline = self:ParseTextLine(v)
				if string.len(ret) > 0 and not is_sep and string.len(newline) > 0 then ret = ret.."EOL;" end
				if string.len(newline) > 0 then
					ret = ret..""..newline
					is_sep = false
				end
			elseif type(v) == "table" then
				if not is_sep then
					local newline = "Separator|png/sep.png;"
					ret = ret..""..newline
				end
				is_sep = true
			end
		end	
	end

	return ret
end



-- “^ffffff^O013物品名称”
function HintTool:ParseTitleLine(line)
	local ret = ""
	local idx_title, idx_end, idx, color, title, sub = 1, 1, 1,"ffffff", "", line

	--	找距离下段物品名称最近的修饰符
	local head = string.sub(sub,1,1)
	local sec = string.sub(sub,2,2)
	while head == "^" do
		if sec == "O" or sec == "o" then
			sub = string.sub(sub,6) -- cut "^O013"
		else
			local idx_1,idx_2,color1 = string.find(sub,"^%^(%x%x%x%x%x%x)")
			if color1 ~= nil then
				sub = string.sub(sub,idx_2 + 1) -- cut "^ffffff"
				color = color1
			end
		end	
		head = string.sub(sub,1,1)
		sec = string.sub(sub,2,2)
	end
	if sub == nil then return ret end
	idx_title,idx_end,title = string.find(sub,"([^%^]+)") -- 找到一段物品名称
	while title ~= nil and string.len(title) > 0 do
		local has_tag, text = self:ParseNIV(title)
		if has_tag then
			ret = ret .. "NIV"..text.."|".."#"..color..";" -- 生成一段带标签的规格文字
		else
			ret = ret .. "IconDesc|"..title.."|".."#"..color..";" -- 生成一规格文字
		end
		sub = string.sub(sub,idx_end + 1)
		if sub == nil then break end

		--	找距离下段物品名称最近的修饰符
		local head = string.sub(sub,1,1)
		local sec = string.sub(sub,2,2)
		while head == "^" do
			if sec == "O" or sec == "o" then
				sub = string.sub(sub,6) -- cut "^O013"
			else
				local idx_1,idx_2,color1 = string.find(sub,"^%^(%x%x%x%x%x%x)")
				if color1 ~= nil then
					sub = string.sub(sub,idx_2 + 1) -- cut "^ffffff"
					color = color1
				end
			end	
			head = string.sub(sub,1,1)
			sec = string.sub(sub,2,2)
		end
		idx_title,idx_end,title = string.find(sub,"([^%^]+)") -- 找下一段物品名称
	end
	return ret
end


-- “^ffffff^O013物品名称”
function HintTool:ParseTextLine(line)
	local ret = ""
	local idx_title, idx_end, idx, color, title, sub = 1, 1, 1,"ffffff", "", line

	--	找距离下段物品名称最近的修饰符
	local head = string.sub(sub,1,1)
	local sec = string.sub(sub,2,2)
	while head == "^" do
		if sec == "O" or sec == "o" then
			local idx_1,idx_2,font = string.find(sub,"^%^[Oo](%d*)")
			if idx_2 ~= nil then sub = string.sub(sub,idx_2 + 1) end-- cut "^O013" 
		else
			local idx_1,idx_2,color1 = string.find(sub,"^%^(%x%x%x%x%x%x)")
			if color1 ~= nil then
				sub = string.sub(sub,idx_2 + 1) -- cut "^ffffff"
				color = color1
			end
		end
		head = string.sub(sub,1,1)
		sec = string.sub(sub,2,2)
	end
	if sub == nil then return ret end
	idx_title,idx_end,title = string.find(sub,"([^%^^\r]+)") -- 找到一段物品名称
	while title ~= nil and string.len(title) > 0 do
		local has_tag, text = self:ParseNIV(title)
		if has_tag then
			ret = ret .. "NIV"..text.."|".."#"..color..";" -- 生成一段带标签的规格文字
		else
			ret = ret .. "Text|"..title.."|".."#"..color..";" -- 生成一规格文字
		end
		sub = string.sub(sub,idx_end + 1)
		if sub == nil then break end

		--	找距离下段物品名称最近的修饰符
		local head = string.sub(sub,1,1)
		local sec = string.sub(sub,2,2)
	
		while head == "^" or head == "\r" do
			if head == "\r" then
				ret = ret .. "EOL;"
				sub = string.sub(sub,2)
			elseif sec == "O" or sec == "o" then
				local idx_1,idx_2,font = string.find(sub,"^%^[Oo](%d*)")
				if idx_2 ~= nil then sub = string.sub(sub,idx_2 + 1) end-- cut "^O013"
			else
				local idx_1,idx_2,color1 = string.find(sub,"^%^(%x%x%x%x%x%x)")
				if color1 ~= nil then
					sub = string.sub(sub,idx_2 + 1) -- cut "^ffffff"
					color = color1
				else
					sub = string.sub(sub,2)
				end
			end
			head = string.sub(sub,1,1)
			sec = string.sub(sub,2,2)	
		end
		
		idx_title,idx_end,title = string.find(sub,"([^%^^\r]+)") -- 找下一段物品名称
	end
	return ret
end


function HintTool:ParseNIV(text)
	local ret = ""
	local has_tag = false 
	local idx_1,idx_2,tag,sub = 1,1,"",text

    while sub ~= nil and string.len(sub) > 0 do
	    idx_1,idx_2,tag = string.find(sub,"^<(%d+)>")
		if idx_1 == 1 and string.len(tag) > 0 then
			if tag == "3" then
				idx_1,idx_2,tag = string.find(sub,"<3><[%p%d]+><[%p%d]+><([%p%d]+)><[%p%d]+><>")
				if tag ~= nil then
					ret = ret .. "|png/hint/" .. tag .. ".png"
					has_tag = true
				end
			end
		else
			idx_1,idx_2,tag = string.find(sub,"^([^<^>]+)")
			if idx_1 == 1 and tag ~= nil then
				ret = ret .. "|" .. tag
			end
		end
		if idx_1 == nil then break end
		sub = string.sub(sub,idx_2 + 1)
    end
    return has_tag,ret
end

function HintTool:ParseIcon(icon)
	local ret = ""
	local idx_1, idx_2, file_name = string.find(icon,"([^%.]+)")
	if file_name ~= nil then
		ret = ret .. "ItemIcon|png/"..file_name..".png;"
	end
	return ret
end

function HintTool:ParseIconId(icon_id)
	local ret = ""
	if icon_id ~= nil then
		ret = ret .. "ItemIcon|png/"..icon_id..".png;"
	end
	return ret
end

function HintTool:ParseArmorIconId(icon_id,tp)
	local ret = ""
	if icon_id ~= nil then
		ret = ret .. "ItemIcon|png/armor"..icon_id.."_"..tp..".png;"
	end
	return ret
end

function HintTool:ParseClothIconId(icon_id,grade)
	local ret = ""
	if icon_id ~= nil then
		ret = ret .. "ItemIcon|png/cloth"..icon_id.."_"..grade..".png;"
	end
	return ret
end

function HintTool:ParseSkillIconId(icon_id)
	local ret = ""
	if icon_id ~= nil then
		ret = ret .. "ItemIcon|png/skill/"..icon_id..".png;"
	end
	return ret
end