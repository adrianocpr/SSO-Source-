local DlgApi		= DlgApi
local GameApi		= GameApi
local DlgTemplate 	= DlgTemplate
local Format, type,Len,Gsub,Find,Sub	= string.format, type,string.len,string.gsub,string.find,string.sub
local Insert 		= table.insert
Panel_Hint = DlgTemplate:new({this = "Panel_Hint"})

local NONE_MODE  	= 0
local TEXT_MODE  	= 1
local ITEM_MODE  	= 2
local LIST_MODE		= 3
local SKILL_MODE    = 4
local COSMOS_BURST_MODE = 5

local Hint_Width_Setting = 
{
    TEXT_MAX_WIDTH = 250,--文字使用最大宽度限制
    LIST_MIN_WIDTH = 200,
    ITEM_MIN_WIDTH = 200,
    SKILL_MIN_WIDTH = 200, 
    COSMOS_BURST_MIN_WIDTH = 200,
}


-- 根据msgboxframe.tga尺寸调整
local LIMIT_HEI	 = 20 --边框的高度，上下各1半
local LIMIT_WID	 = 20 --边框的宽度,两边各1半
local TITLE_MARGIN = 2 --标题留边

local HINT_DIR = --group_list的叠加方向
{
    HORIZONTAL = 1, --水平
    VERTICAL = 2, --垂直
}

local HINT_FROM = 
{
    FROM_GAME_HOVER	= 1, --游戏内悬浮
    FROM_GAME_CLICK	= 2, --游戏内点击
    FROM_OUT_CHAT	= 3, --外置聊天栏
}

local ITEM_TITLE_BG = 
{
    [1]="special\\Hint\\Quality_1.tga",
    [2]="special\\Hint\\Quality_2.tga",
    [3]="special\\Hint\\Quality_3.tga",
    [4]="special\\Hint\\Quality_4.tga",
    [5]="special\\Hint\\Quality_5.tga",
    [6]="special\\Hint\\Quality_6.tga",
}
--辅助数据
Panel_Hint.hint_from = HINT_FROM.FROM_GAME_HOVER

--记录数据
Panel_Hint.hint_group_list = {gameUI = {}, chatUI={},}
local mt = 
{
    __index = function (t,k)
        if Panel_Hint.hint_from == HINT_FROM.FROM_GAME_HOVER or
        Panel_Hint.hint_from == HINT_FROM.FROM_GAME_CLICK then
            return t.gameUI[k]
        elseif Panel_Hint.hint_from == HINT_FROM.FROM_OUT_CHAT then
            return t.chatUI[k]
        end
    end,
    __newindex = function (t,k,v)
        if Panel_Hint.hint_from == HINT_FROM.FROM_GAME_HOVER or
        Panel_Hint.hint_from == HINT_FROM.FROM_GAME_CLICK then
            t.gameUI[k] = v
        elseif Panel_Hint.hint_from == HINT_FROM.FROM_OUT_CHAT then
            t.chatUI[k] = v
        end 
    end
}
setmetatable(Panel_Hint.hint_group_list, mt)

local HintSettings = 
{
    [HINT_FROM.FROM_GAME_HOVER] = 
    {
        dir = HINT_DIR.HORIZONTAL,
        GetGroupListCount = function ()
            return #Panel_Hint.hint_group_list.gameUI
        end,
        showClose = false,
        widthScale = 1,
    },
    [HINT_FROM.FROM_GAME_CLICK] = 
    {
        dir = HINT_DIR.HORIZONTAL,
        GetGroupListCount = function ()
            return #Panel_Hint.hint_group_list.gameUI
        end,
        showClose = true,
        widthScale = 1,
    },
    [HINT_FROM.FROM_OUT_CHAT] = 
    {
        dir = HINT_DIR.VERTICAL,
        GetGroupListCount = function ()
            return #Panel_Hint.hint_group_list.chatUI
        end,
        showClose = true,
        widthScale = 0.8
    },
}



-------------------------------------
--		overrides
-------------------------------------
function Panel_Hint:Init()
    self.hint_templ:Show(false)
end


function Panel_Hint:SaveHintData(hintFrom, func,func_arg)
    self.hint_from = hintFrom
    self.hint_group_list.func = func
    self.hint_group_list.func_arg = func_arg
end


-------------------------------------
--		function called by others
-------------------------------------
function Panel_Hint:SetTextHint(text, hintFrom)  
    local text_list = self:SplitText(text)   
    for i, text in ipairs(text_list) do 
        if not self.hint_group_list[i] then
            self.hint_group_list[i] = self.hint_templ:Colone(i)
        end
    	self.hint_group_list[i]:set_text_hint(text)
    end
    self:SaveHintData(hintFrom, self.UpdateHints, {#text_list, false})
    self:UpdateHints(#text_list, true)
end


local ARTIFACT_COMPARE_CONTEXT = 5
function Panel_Hint:SetItemHint(itemList, context, show_id, hintFrom)
    for i, item_info in ipairs(itemList) do        
        local head = {}
	    if i <= 1 then 
	        item_info.context = context
	    else
	        item_info.compare_equip = true	        
	    end
        local showSkill = true
        --对于神器比较，只在最后一个显示技能，为了排版空间太小
        if context == ARTIFACT_COMPARE_CONTEXT and #itemList > 1 and i ~= #itemList then
            showSkill = false
        else
            showSkill = item_info.show_skill
        end
        local skillHead = nil
	    if show_id then 
	        Insert(head, Format("id:%d", item_info.id)) 
            if item_info.skill_id and showSkill then
                skillHead = Format("id:%d",item_info.skill_id)
            end
	    end
	    local title, textList = LuaItemDesc:GetItemDesc(item_info.cid, item_info)
    	if not self.hint_group_list[i] then
        	self.hint_group_list[i] = self.hint_templ:Colone(i)
    	end
        
        local skillDesc = nil
        if item_info.skill_id and showSkill then
            skillDesc = skill_desc:GetDesc_Ui(item_info.skill_id,1,skill_desc.CONTEXT.SKILL_NORMAL,nil,skill_desc.MASK.HINT_SKILL_ACTIVE)
        end
        
	    self.hint_group_list[i]:set_item_hint(head, item_info.icon, title, self:GetItemTitleBg(item_info.quality),textList,skillHead,skillDesc)
        if item_info.extraItem then
            local extraHead = {}
            if show_id then
                Insert(extraHead,Format("id:%d", item_info.extraItem.id))
            end
            local extraTitle,extraTextList = LuaItemDesc:GetItemDesc(item_info.extraItem.cid,item_info.extraItem)
            self.hint_group_list[i]:set_item_hint(extraHead, 
                item_info.extraItem.icon, extraTitle, 
                self:GetItemTitleBg(item_info.extraItem.quality),extraTextList, nil,nil,true)
        end
    end
    self:SaveHintData(hintFrom,self.UpdateHints,{#itemList,false})
    self:UpdateHints(#itemList,true)
end


function Panel_Hint:SetEquipCombineHint(itemList, context, show_id, hintFrom)
    for i, item_info in ipairs(itemList) do        
        local head = {}
        if i <= 1 then 
            item_info.context = context
        elseif i == 2 then
            Insert(head, STRING_TABLE.STRING_EQUIP_COMBINE_HINT)  
        else
            Insert(head, STRING_TABLE.STRING_EQUIP_COMAPRE_INTER)        
        end
        if show_id then 
            Insert(head, Format("id:%d", item_info.id)) 
        end
        local title, textList = LuaItemDesc:GetItemDesc(item_info.cid, item_info)
        
        if not self.hint_group_list[i] then
            self.hint_group_list[i] = self.hint_templ:Colone(i)
        end
        self.hint_group_list[i]:set_item_hint(head, item_info.icon, title, self:GetItemTitleBg(item_info.quality), textList)
    end
    self:SaveHintData(hintFrom,self.UpdateHints,{#itemList,false})
    self:UpdateHints(#itemList,true)
end


function Panel_Hint:SetSkillHint(skillInfo,context,show_id, hintFrom)
    local skilldesc = skill_desc:GetDesc_Ui(skillInfo.id,skillInfo.level,context,nil,skillInfo.mask)
    local idx = 1
    if not self.hint_group_list[idx] then
        self.hint_group_list[idx] = self.hint_templ:Colone(idx)
    end
    local head = nil
    if show_id then
        head = Format("id:%d",skillInfo.id)
    end
    self.hint_group_list[idx]:set_skill_hint(head,skilldesc)
    self:SaveHintData(hintFrom,self.UpdateHints,{idx,false})
    self:UpdateHints(idx,true)
end


function Panel_Hint:SetPseudoSkillHint(skillInfo,show_id, hintFrom)
    local skilldesc = skill_desc:GetPseudoSkillDesc_Ui(skillInfo.id,skillInfo.type)
    local idx = 1
    if not self.hint_group_list[idx] then
        self.hint_group_list[idx] = self.hint_templ:Colone(idx)
    end
    local head = nil
    if show_id then
        head = Format("id:%d",skillInfo.id)
    end
    self.hint_group_list[idx]:set_skill_hint(head,skilldesc)
    self:SaveHintData(hintFrom,self.UpdateHints,{idx,false})
    self:UpdateHints(idx,true)
end


local FilterNewLine = glb_FilterNewLine
function Panel_Hint:SetSanitCloth(saint_cloth, show_id, hintFrom)
    self:SaveHintData(hintFrom,self.SetSanitCloth,{saint_cloth,show_id,hintFrom})
    local title, textList = spec_desc:saint_cloth_desc(saint_cloth)
    for i, line in ipairs(textList or {}) do
        textList[i] = FilterNewLine(line)
    end
        
    local head = {}
    if show_id then
        Insert(head, Format("id:%d", saint_cloth.id))
    end
    self:SetCommonItem(head, saint_cloth.icon, title,self:GetItemTitleBg(saint_cloth.quality),textList,hintFrom)
end


function Panel_Hint:SetSanitClothEnhance(saint_cloth_enhance, show_id, hintFrom)
    local title, textList = spec_desc:saint_cloth_enhance_desc(saint_cloth_enhance)
    for i, line in ipairs(textList or {}) do
        textList[i] = FilterNewLine(line)
    end
    self:SetCommonItem({}, saint_cloth_enhance.enhance_icon, title, self:GetItemTitleBg(saint_cloth_enhance.quality),textList,hintFrom)
end


function Panel_Hint:SetCosmosStar(cosmos_star, star_soul, show_id, hintFrom)
    local head_list = spec_desc:cosmos_desc(cosmos_star)
    for i, line in ipairs(head_list or {}) do
        head_list[i] = FilterNewLine(line)
    end
    
    -- 未镶嵌星魂
    if not next(star_soul) then        
    	self:SetCommonList(head_list,hintFrom)
        return
    end    
    -- 镶嵌星魂数据
    if show_id then
        Insert(head_list, Format("id:%d", star_soul.id))
    end
    local title, textList = LuaItemDesc:GetItemDesc(star_soul.cid, star_soul)
    self:SetCommonItem(head_list, star_soul.icon, title, self:GetItemTitleBg(star_soul.quality),textList,hintFrom)
end


function Panel_Hint:SetCosmosStage(stage, hintFrom)
    local list = spec_desc:cosmos_stage_desc(stage)
    self:SetCommonList(list,hintFrom)
end


function Panel_Hint:SetCosmosBurstHint(burstHintInfo, curAp, maxAp, burstLevel, hintFrom)
    local idx = 1
    if not self.hint_group_list[idx] then
        self.hint_group_list[idx] = self.hint_templ:Colone(idx)
    end
    self.hint_group_list[idx]:set_cosmos_burst_hint(burstHintInfo,curAp,maxAp,burstLevel)
    self:SaveHintData(hintFrom,self.UpdateHints,{idx,false})
    self:UpdateHints(idx,true)
end


function Panel_Hint:SetBuff(buff_id, param, show_id, hintFrom)
    local desc = skill_man:GetBuffDesc(buff_id, param)
    if show_id then
        desc = Format("id:%d\r%s", buff_id, desc)
    end
    self:SetTextHint(desc, hintFrom)
end


function Panel_Hint:SetSoulArmor(armor, show_id, hintFrom)
    local head = {}
    if show_id then        
        Insert(head, Format("id:%d", armor.armor_id))
    end

    local title, textList = spec_desc:armor_desc(armor)
    self:SetCommonItem(head, armor.icon, title, self:GetItemTitleBg(1), textList, hintFrom)
end


function Panel_Hint:RefreshHint(hintFrom)
    self.hint_from = hintFrom
    if self.hint_group_list.func and self.hint_group_list.func_arg then
        self.hint_group_list.func(self,unpack(self.hint_group_list.func_arg))
    end
end


-------------------------------------
--		function called by self
-------------------------------------
function Panel_Hint:GetItemTitleBg(quality)
    return ITEM_TITLE_BG[1]
    --return ITEM_TITLE_BG[quality]
end

function Panel_Hint:SetCommonItem(head, icon, title, titleBg,textList,hintFrom)
    local idx = 1
    if not self.hint_group_list[idx] then
    	self.hint_group_list[idx] = self.hint_templ:Colone(idx)
    end
    self.hint_group_list[idx]:set_item_hint(head, icon or "", title, titleBg,textList)
    self:SaveHintData(hintFrom,self.UpdateHints,{idx,false})
    self:UpdateHints(idx,true)
end

function Panel_Hint:SetCommonList(list, hintFrom)
    local idx = 1
    if not self.hint_group_list[idx] then
    	self.hint_group_list[idx] = self.hint_templ:Colone(idx)
    end
    self.hint_group_list[idx]:set_list_hint(list)
    self:SaveHintData(hintFrom,self.UpdateHints,{idx,false})
    self:UpdateHints(idx,true)
end

function Panel_Hint:SplitText(text)
    local text_list = {}
    local init = 0
    local start_find, end_find = text:find("\t", init)
    while start_find do
        Insert(text_list, text:sub(init, start_find-1))
        init = end_find + 1
        start_find, end_find = text:find("\t", init)
    end
    Insert(text_list, text:sub(init, text:len()))
    return text_list
end

function Panel_Hint:UpdateHints(hint_num, needCalcScale)
    --计算尺寸
    local total_hei, total_wid = 0, 0
    local hei, wid
    local dir = HintSettings[self.hint_from].dir
    for i = 1, hint_num do
        hei, wid = self.hint_group_list[i]:update(total_wid,total_hei,
            dir,i==1,i==hint_num)
        if dir == HINT_DIR.HORIZONTAL then
            if hei > total_hei then
                total_hei = hei
            end
            total_wid = total_wid + wid        
        elseif dir == HINT_DIR.VERTICAL then
            if wid > total_wid then
                total_wid = wid
            end
            total_hei = total_hei + hei
        end
    end

    for i = hint_num + 1, HintSettings[self.hint_from].GetGroupListCount() do
        self.hint_group_list[i]:hide()
    end
    DlgApi.SetDialogSize(self.this, total_wid, total_hei)
end



-------------------------------------
--		hint group
-------------------------------------
local hint_group = 
{
	panel_name	= "", --面板名
	obj_list 	= {}, --面板内的所有控件
    --{标题栏,分隔符，参数栏，图标均可以为多个
    title_num   = 0,
    titleBg_num = 0,
	sep_num		= 0,
	para_num	= 0,
	icon_num    = 0,
    text_num    = 0,
    --}

	mode	 	= NONE_MODE,

    --辅助记录
   txt_wid = 0,--内容宽度
   txt_hei = 0,--内容高度
   scale = 1,--缩放比例
   sep_hei = 0,--分割条高度
   line_space = 0,--行间距

   sepIdx = 1,--分隔条索引
   paraIdx = 1,--参数label索引
   textIdx = 1,--textArea索引
   iconIdx = 1,--图标索引
   titleIdx = 1,--标题索引
   titleBgIdx = 1,--标题背景索引
   last_sep = false,--记录是否上一条为分隔条，避免多个分隔条紧接
   rightItemList = {}, --记录靠右的项目
   centerItemList = {}, --记录中间的项目
}

--初始化一些辅助信息
function hint_group:init_assist_info()
    self.sepIdx = 1--分隔条索引
    self.paraIdx = 1--参数label索引
    self.textIdx = 1--textArea索引
    self.iconIdx = 1--图标索引
    self.titleIdx = 1--标题索引
    self.titleBgIdx = 1--标题背景索引
    self.last_sep = false--记录是否上一条为分隔条，避免多个分隔条紧接   
    self.rightItemList = {}
    self.centerItemList = {}
end

--记录一些辅助信息
function hint_group:rec_assit_info()
    if self.titleIdx > self.title_num then self.title_num = self.titleIdx end
    if self.titleBgIdx > self.titleBg_num then self.titleBg_num = self.titleBgIdx end
    if self.iconIdx > self.icon_num then self.icon_num = self.iconIdx end
    if self.paraIdx > self.para_num then self.para_num = self.paraIdx end
    if self.sepIdx > self.sep_num then self.sep_num = self.sepIdx end
    if self.textIdx > self.text_num then self.text_num = self.textIdx end
end

function hint_group:new(panel_name, obj_list)
    local inst = CreateObj(self) 
    inst.obj_list 	= obj_list     
    inst.panel_name	= panel_name
    return inst
end


function hint_group:hide()
    self.mode = NONE_MODE
    for _, obj_name in pairs(self.obj_list) do
        DlgApi.ShowItem(self.panel_name, obj_name, false)
    end
    self:hide_gener_obj()
end

function hint_group:hide_gener_obj()
    self:hide_one_gener_objs(self.obj_list.title,self.title_num)
    self:hide_one_gener_objs(self.obj_list.titleBg,self.titleBg_num)
    self:hide_one_gener_objs(self.obj_list.sep,self.sep_num)
    self:hide_one_gener_objs(self.obj_list.para,self.para_num)
    self:hide_one_gener_objs(self.obj_list.icon,self.icon_num)
    self:hide_one_gener_objs(self.obj_list.text,self.text_num)
end

--隐藏一组由objBaseName生成的控件
function hint_group:hide_one_gener_objs(objBaseName,num)
    local obj_name
    for i = 1, num do
        obj_name = Format("%s_%s", objBaseName, i)
        DlgApi.ShowItem(self.panel_name, obj_name, false)
    end 
end


function hint_group:set_text_hint(text)
    self.hint_txt   = text
    self.mode		= TEXT_MODE
    self:switch_mode()
end


function hint_group:set_list_hint(text_list)
    self.text_list  = text_list
    self.mode		= LIST_MODE
    self:switch_mode()
end

--[[
itemInfo = 
{
    head_list,title_txt,title_bg,icon,text_list
}
added 表示是否后加的
]]--
--wangliang 有时间考虑，用所有的悬浮对象组合成一个List，每个对象有类型，以此能够在一个面板上衔接不同类型对象的
--悬浮
function hint_group:set_item_hint(head_list, icon, title_text,title_bg,text_list,skill_head,skill_desc,added)
    if not self.itemInfos or not added then
        self.itemInfos = {}
    end
    itemInfo = {}    
    itemInfo.head_list	= head_list or {}
    itemInfo.title_txt 	= title_text
    itemInfo.title_bg = title_bg
    itemInfo.icon		= icon
    itemInfo.text_list  = text_list or {}
    itemInfo.skill_head = skill_head
    itemInfo.skill_desc = skill_desc
    Insert(self.itemInfos,itemInfo)
    self.mode		= ITEM_MODE
    self:switch_mode()
end

function hint_group:set_skill_hint(head,skilldesc)
    self.skill_head = head
    self.skill_desc = skilldesc
    self.mode = SKILL_MODE
    self:switch_mode()
end

function hint_group:set_cosmos_burst_hint(burstHintInfo,curAp,maxAp,burstLevel)
    self.burst_info = burstHintInfo
    self.curAp = curAp
    self.maxAp = maxAp
    self.burstLevel = burstLevel
    self.mode = COSMOS_BURST_MODE
    self:switch_mode()
end

function hint_group:switch_mode()
    DlgApi.ShowItem(self.panel_name, self.obj_list.icon, false)
    DlgApi.ShowItem(self.panel_name, self.obj_list.title, false)  
    DlgApi.ShowItem(self.panel_name, self.obj_list.titleBg, false)  
    DlgApi.ShowItem(self.panel_name, self.obj_list.close, false)
    DlgApi.ShowItem(self.panel_name, self.obj_list.bg, true)
    DlgApi.ShowItem(self.panel_name, self.obj_list.para, false)
    DlgApi.ShowItem(self.panel_name, self.obj_list.sep, false)    
    DlgApi.ShowItem(self.panel_name, self.obj_list.text, false)    
    self:hide_gener_obj()
end

--group_x,group_y 新group的可选x,y坐标
--direction group的生长方向
function hint_group:update(group_x,group_y,direction,isFirst,isLast)
    self.scale = DlgApi.GetWindowScale()*DlgApiEx.GetDialogScale(self.panel_name)
    self.sep_hei = DlgApi.GetItemRect(self.panel_name, self.obj_list.sep).height
    self.line_space = DlgApiEx.GetLineSpace(self.panel_name, self.obj_list.para)*self.scale
    local showClose = false
    if HintSettings[Panel_Hint.hint_from].showClose then
        if direction == HINT_DIR.HORIZONTAL and isLast then
            showClose = true
        elseif direction == HINT_DIR.VERTICAL and isFirst then
            showClose = true
        end
    end
    --生成文字左上角坐标
    local base_x,base_y = 0,0
    if direction == HINT_DIR.HORIZONTAL then
        base_x = group_x + LIMIT_WID * self.scale / 2
        base_y = LIMIT_HEI * self.scale / 2
    else
        base_x = LIMIT_WID * self.scale / 2
        base_y = group_y + LIMIT_HEI * self.scale / 2
    end
    -- 内容
    self:init_assist_info()
    if self.mode == TEXT_MODE then    
        self:UpdateTextInfo(base_x,base_y)
    elseif self.mode == LIST_MODE then     
        self:UpdateListInfo(base_x,base_y)
    elseif self.mode == ITEM_MODE then
        self:UpdateItemInfo(base_x,base_y)
    elseif self.mode == SKILL_MODE then --技能
        self:UpdateSkillInfo(base_x,base_y)
    elseif self.mode == COSMOS_BURST_MODE then
        self:UpdateCosmosBurstInfo(base_x,base_y)
    end
    self:rec_assit_info()
    self:Reloc(base_y)
    
    -- 计算整个group_hint大小
    local hint_wid = self.txt_wid + LIMIT_WID * self.scale
    local hint_hei = self.txt_hei + LIMIT_HEI * self.scale

    if direction == HINT_DIR.VERTICAL then  --如果是纵向，保持所有面板宽度相同
        if group_x > hint_wid then hint_wid = group_x end
    end

    -- 关闭按钮
    if showClose then
        local rect_close = DlgApi.GetItemRect(self.panel_name, self.obj_list.close)
        local close_x = group_x + hint_wid
        DlgApi.SetItemPos(self.panel_name, self.obj_list.close, close_x, 0)
        DlgApi.ShowItem(self.panel_name, self.obj_list.close, true)
        hint_wid = hint_wid + rect_close.width
    end

    --背景   
    DlgApi.SetItemSize(self.panel_name, self.obj_list.bg, hint_wid, hint_hei)
    if direction == HINT_DIR.HORIZONTAL then
        DlgApi.SetItemPos(self.panel_name, self.obj_list.bg, group_x, 0)
    else
        DlgApi.SetItemPos(self.panel_name, self.obj_list.bg, 0, group_y)
    end

    -- 返回hint的大小
    return hint_hei, hint_wid
end
--根据sep来分段，一个段内的不拆分，来拆为2列
function hint_group:CalcSplitHeight(base_y)
    local seperate_list = {}
    local sep_name
    for i = 1, self.sep_num do
        sep_name = Format("%s_%s", self.obj_list.sep, i)
        if DlgApi.IsItemShow(self.panel_name,sep_name) then
            local rect = DlgApi.GetItemRect(self.panel_name,sep_name,true)
            if rect then
                Insert(seperate_list,rect.y + rect.height - base_y + 1)
            end
        end
    end
    if #seperate_list == 0 then
        return
    end
    local splitHeight = seperate_list[1]
    local delta = math.abs(splitHeight * 2- self.txt_hei)
    local tmpDelta
    for i = 2, #seperate_list do
        tmpDelta = math.abs(seperate_list[i] * 2 - self.txt_hei)
        if tmpDelta < delta then
            splitHeight = seperate_list[i]
            delta = tmpDelta
        end
    end
    return splitHeight
end

--基于屏幕尺寸调整位置和尺寸
function hint_group:Reloc(base_y)
    --如果不超出屏幕不分割
    local _, winTop, _, winBottom = DlgApi.GetWindowRect()
    local maxHeight = winBottom - winTop - LIMIT_HEI * self.scale
    if self.txt_hei < maxHeight then
        return
    end
    --根据分割线计算分割高度，如没有分割线不分割
    local splitHeight = self:CalcSplitHeight(base_y)
    if not splitHeight then
        return
    end
    --分割
    self:RelocGenItem(self.obj_list.title,self.title_num,base_y,splitHeight)
    self:RelocGenItem(self.obj_list.titleBg,self.titleBg_num,base_y,splitHeight)
    self:RelocGenItem(self.obj_list.sep,self.sep_num,base_y,splitHeight)
    self:RelocGenItem(self.obj_list.para,self.para_num,base_y,splitHeight)
    self:RelocGenItem(self.obj_list.icon,self.icon_num,base_y,splitHeight)
    self:RelocGenItem(self.obj_list.text,self.text_num,base_y,splitHeight)
    --重算宽高
    self.txt_wid = self.txt_wid * 2 + LIMIT_WID * self.scale
    self.txt_hei = math.max(splitHeight,self.txt_hei-splitHeight)
end

--根据最大高度重新布局一组控件
function hint_group:RelocGenItem(objBaseName,num,base_y,splitHeight)
    local obj_name
    for i = 1, num do
        obj_name = Format("%s_%s", objBaseName, i)
        self:RelocObj(base_y, obj_name, splitHeight)
    end 
end

--根据最大高度重新布局单个控件
function hint_group:RelocObj(base_y,obj_name,splitHeight)
    if DlgApi.IsItemShow(self.panel_name,obj_name) then
        local rect = DlgApi.GetItemRect(self.panel_name,obj_name,true)
        if rect then
            if rect.y - base_y > splitHeight then
                DlgApi.SetItemPos(self.panel_name,obj_name,rect.x + self.txt_wid + LIMIT_WID * self.scale,
                    rect.y - splitHeight)
            end
        end
    end
end

--增加分割线
function hint_group:addSep(base_x,base_y,addLineSpace,force_add)
    if not self.last_sep or force_add then
        self:set_sep(base_x, base_y + self.txt_hei)
        self.txt_hei = self.txt_hei + self.sep_hei
        if addLineSpace then
            self.txt_hei = self.txt_hei + self.line_space
        end
    end
end

--增加正文，在现有高度上追加
function hint_group:addPara(text,base_x,base_y)
    if text:len() > 0 then
        local hei, wid = self:set_para(text, base_x, base_y + self.txt_hei)
        if hei > 0 and wid > 0 then
            self.txt_hei = self.txt_hei + hei + self.line_space
            if wid > self.txt_wid then self.txt_wid = wid end
            self.last_sep = false
        end
    end
end

function hint_group:UpdateTextInfo(base_x,base_y)
    self.txt_hei = 0
    self.txt_wid = 0
    local wid = Hint_Width_Setting.TEXT_MAX_WIDTH*self.scale*HintSettings[Panel_Hint.hint_from].widthScale
    self.txt_hei,self.txt_wid = self:set_text_with_width(self.hint_txt, base_x, base_y,wid,true)
end

function hint_group:UpdateListInfo(base_x,base_y)
    self.txt_hei = 0
    self.txt_wid = Hint_Width_Setting.LIST_MIN_WIDTH*self.scale*HintSettings[Panel_Hint.hint_from].widthScale
    -------------
    -- 列表
    for _, text in ipairs(self.text_list) do
        if type(text) == "string" then
            self:addPara(text,base_x,base_y)
        else
            self:addSep(base_x,base_y,true)
        end
    end        
    self:resize_sep(self.sepIdx, self.txt_wid)        
end

--更新一个物品信息，内容itemInfo {head_list,icon,title_txt,title_bg,text_list}
function hint_group:UpdateOneItemInfo(itemInfo,base_x,base_y)
    -- 抬头
    for _, text in ipairs(itemInfo.head_list) do
        if type(text) == "string" then
            self:addPara(text,base_x,base_y)
        else
            self:addSep(base_x,base_y,true)
        end
    end
    -- 图标
    local theIcon = self:create_icon()
    DlgApi.SetItemPos(self.panel_name, theIcon, base_x, base_y + self.txt_hei)
    DlgApiEx.ItemShowIvtrIcon(self.panel_name, theIcon, itemInfo.icon)
    local rect_img = DlgApi.GetItemRect(self.panel_name, theIcon)        
    -- 标题信息 
    -----标题文字
    --标题，付标题
    local title,subtitle = self:GetTitle(itemInfo.title_txt)
    local title_pos = {x=base_x+rect_img.width,y = base_y+self.txt_hei,}
    local title_hei,title_wid,the_title = self:set_title(title,title_pos.x,title_pos.y+TITLE_MARGIN)
    Insert(self.centerItemList,the_title)
    title_hei = title_hei+TITLE_MARGIN*2
    -----标题背景
    if itemInfo.title_bg then
        self:create_titleBg(itemInfo.title_bg,title_pos.x,title_pos.y,title_wid,title_hei)
    end
    --付标题
    if subtitle then
        local subHei, subWid = self:set_para(subtitle, title_pos.x, title_pos.y+title_hei+self.line_space)
        title_hei = title_hei + subHei + self.line_space
        title_wid = math.max(title_wid,subWid)
    end

    local center_hei = rect_img.height
    if title_hei > center_hei then center_hei = title_hei end
    self.txt_hei = self.txt_hei + center_hei
    local center_wid = rect_img.width + title_wid        
    if center_wid > self.txt_wid then self.txt_wid = center_wid end
    ----------------
    -- 正文
    self.last_sep = false
    for _, text in ipairs(itemInfo.text_list) do
        if type(text) == "string" then
            self:addPara(text,base_x,base_y)
        else
            self:addSep(base_x,base_y,true)
        end
    end

    if itemInfo.skill_head or itemInfo.skill_desc then
        --分割线
        self:addSep(base_x,base_y,true)
        self:addPara(ITEM_ARTIFACT_DESC.SKILL,base_x,base_y)
    end
    --技能
    self:UpdateOneSkillInfo(base_x,base_y,itemInfo.skill_head,itemInfo.skill_desc,true) 
end

--更新物品，内容来源于itemInfos {head_list,icon,title_txt,text_list}
function hint_group:UpdateItemInfo(base_x,base_y)
    self.txt_hei = 0
    self.txt_wid = Hint_Width_Setting.ITEM_MIN_WIDTH*self.scale*HintSettings[Panel_Hint.hint_from].widthScale
    if self.itemInfos then
        for i, itemInfo in ipairs(self.itemInfos) do
            if i > 1 then --加一个分割符
                self:addSep(base_x,base_y,true)
            end
            self:UpdateOneItemInfo(itemInfo,base_x,base_y)
        end
    end
    
    self:ResetWidth(base_x,self.txt_wid,self.rightItemList)
    self:reloc_title_align_center(base_x + self.txt_wid,self.centerItemList)
    self:resize_titleBg(self.titleBgIdx,base_x + self.txt_wid)
end

--技能信息
function hint_group:UpdateSkillInfo(base_x,base_y)
    self:UpdateOneSkillInfo(base_x,base_y,self.skill_head,self.skill_desc)
    self:ResetWidth(base_x,self.txt_wid,self.rightItemList)
 end

--生成一个技能信息主体,added参数表明是否是后续加入的
--技能的信息的空行的排除请在生成的时候做
local minGap = LIMIT_WID --同一行两列的最小间距
function hint_group:UpdateOneSkillInfo(base_x,base_y,skill_head,skill_desc,added)
    if not added then
        self.txt_hei = 0
        self.txt_wid = Hint_Width_Setting.SKILL_MIN_WIDTH*self.scale*HintSettings[Panel_Hint.hint_from].widthScale
    end
    local wid,hei,theItem
    -------------
    -- 抬头 id
    if skill_head then
        self:addPara(skill_head,base_x,base_y)
        --分割线
        self:addSep(base_x,base_y,true)
    end
    if not skill_desc then 
        return
    end
    for i,levelInfo in ipairs(skill_desc) do
        if i > 1 then --分割线
            self:addSep(base_x,base_y,true,true)
        end
        --技能主体
        --title 使用Title
        if levelInfo.title then
            local nameWidth,levelWidth = 0,0
            if levelInfo.title.name then
                hei, nameWidth = self:set_title(levelInfo.title.name,base_x,base_y + self.txt_hei)
            end
            if levelInfo.title.level then
                hei, levelWidth,theItem = self:set_title(levelInfo.title.level,base_x,base_y + self.txt_hei)
                if levelWidth > 0 then
                    Insert(self.rightItemList,theItem)
                end
            end
            if nameWidth + minGap + levelWidth > self.txt_wid then
                self.txt_wid = nameWidth + minGap + levelWidth
            end
            if nameWidth>0 or levelWidth>0 then
                self.txt_hei = self.txt_hei + hei + self.line_space
            end
            if levelInfo.title.nextLevel then
                hei, wid = self:set_title(levelInfo.title.nextLevel,base_x,base_y + self.txt_hei)
                if wid > 0 then
                    if wid > self.txt_wid then self.txt_wid = wid end
                    self.txt_hei = self.txt_hei + hei + self.line_space
                end
            end
        end
        --分割线
        if levelInfo.title and (levelInfo.base or levelInfo.commonDesc
             or levelInfo.useDesc) then
            self:addSep(base_x,base_y,true,true)
        end
        --base
        if levelInfo.base then
            local rect_img = nil
            --图标
            if levelInfo.base.icon then
                local theIcon = self:create_icon()
                DlgApi.SetItemPos(self.panel_name, theIcon, base_x, base_y + self.txt_hei)
                DlgApiEx.SkillShowIcon(self.panel_name, theIcon, levelInfo.base.icon,
                    levelInfo.base.pseudoType)
                rect_img = DlgApi.GetItemRect(self.panel_name, theIcon)         
            end
            --时间、距离参数
            local img_width,img_height = 0,0
            if rect_img then img_width,img_height = rect_img.width,rect_img.height end
            local baseStr_x, baseStr_y = base_x + img_width, base_y+self.txt_hei
            local baseStr_hei,baseStr_wid,baseStr_gap = 0,0,self.line_space
            local isFirst = true
            for _,baseStr in ipairs(levelInfo.base) do
                if Len(baseStr) > 0 then
                    if isFirst then
                        isFirst = false
                        hei, wid = self:set_para(baseStr, baseStr_x, baseStr_y)
                        if #levelInfo.base > 1 then
                            local imgGap = (img_height-hei)/(#levelInfo.base-1) - hei
                            if baseStr_gap < imgGap then baseStr_gap = imgGap end
                        end
                        baseStr_hei = hei
                    else
                        hei, wid = self:set_para(baseStr, baseStr_x, baseStr_y + baseStr_hei + baseStr_gap)
                        baseStr_hei = baseStr_hei + baseStr_gap + hei
                    end
                    if wid > baseStr_wid then baseStr_wid = wid end
                end
            end
            if img_width + baseStr_wid > self.txt_wid then self.txt_wid = img_width + baseStr_wid end
            local base_hei = (img_height>baseStr_hei and img_height) or baseStr_hei
            self.txt_hei = self.txt_hei + base_hei
        end
        --分割线
        if levelInfo.base and (levelInfo.commonDesc or levelInfo.useDesc or levelInfo.soulDesc) then
            self:addSep(base_x,base_y,true,true)
        end
        --commonDesc
        if levelInfo.commonDesc then
            hei = self:set_text_with_width(levelInfo.commonDesc, base_x, base_y + self.txt_hei,self.txt_wid)
            self.txt_hei = self.txt_hei + hei + self.line_space
        end
        --useDesc
        if levelInfo.useDesc then
            local text_list = Panel_Hint:SplitText(levelInfo.useDesc)
            for i,text in ipairs(text_list) do
                text = glb_FilterNewLine(text)
                hei = self:set_text_with_width(text, base_x, base_y + self.txt_hei,self.txt_wid)
                self.txt_hei = self.txt_hei + hei + self.line_space
                if i~= #text_list then
                    self:addSep(base_x,base_y,true,true)
                end
            end
        end--useDesc
        --soulDesc
        if levelInfo.soulDesc then
            hei = self:set_text_with_width(levelInfo.soulDesc.header, base_x, base_y + self.txt_hei,self.txt_wid)
            self.txt_hei = self.txt_hei + hei + self.line_space

            self:addSep(base_x,base_y,true,true)

            for _,soulStr in ipairs(levelInfo.soulDesc.desc) do
                hei = self:set_text_with_width(soulStr, base_x, base_y + self.txt_hei,self.txt_wid)
                self.txt_hei = self.txt_hei + hei + self.line_space
            end
        end
    end--skill_desc
end

--更新小宇宙燃烧信息，内容来源于self.burst_info,self.burst_level
function hint_group:UpdateCosmosBurstInfo(base_x,base_y)
    self.txt_hei = 0
    self.txt_wid = Hint_Width_Setting.COSMOS_BURST_MIN_WIDTH*self.scale*HintSettings[Panel_Hint.hint_from].widthScale
    self.last_sep = true
    local hei
    if self.burst_info then
        local apDesc = cosmos_burst:GetCosmosApDesc(self.curAp,self.maxAp)
        if Len(apDesc) > 0 then
            hei = self:set_text_with_width(apDesc, base_x, base_y+self.txt_hei,self.txt_wid)
            self.txt_hei = self.txt_hei + hei + self.line_space
        end
        if self.burst_info.commonDesc and Len(self.burst_info.commonDesc)>0 then
            self:addSep(base_x,base_y,true)
            hei = self:set_text_with_width(self.burst_info.commonDesc, base_x, base_y+self.txt_hei,self.txt_wid)
            self.txt_hei = self.txt_hei + hei + self.line_space
        end
        local burstLevel = self.burstLevel
        if burstLevel == cosmos_burst.COSMOS_BURST_LEVEL.BURST_NO then
            burstLevel = cosmos_burst:GetCosmosCanBurstLevel(self.burstLevel,self.curAp/self.maxAp)
        end
        if self.burst_info.levelDesc then
            for i,_levelDesc in ipairs(self.burst_info.levelDesc) do
                if Len(_levelDesc)>0 then
                    self:addSep(base_x,base_y,true)
                    if i > burstLevel then
                        _levelDesc = glb_DisableText(_levelDesc)
                    end
                    hei = self:set_text_with_width(_levelDesc, base_x, base_y+self.txt_hei,self.txt_wid)
                    self.txt_hei = self.txt_hei + hei + self.line_space
                end
            end
        end
    end
    self:resize_sep(self.sepIdx, self.txt_wid)
end

--初始化一类控件的位置偏移信息序列
function hint_group:GetItemPosList(itemNum,itemOrigin)
    local result = {}
    for i = 1,itemNum do
        local theItem = Format("%s_%s", itemOrigin, i)
        local rect = DlgApi.GetItemRect(self.panel_name,theItem,true)
        if rect then
            Insert(result,{item=theItem,x=rect.x,y=rect.y,wid=rect.width,hei=rect.height})
        end
    end
    return result
end

--计算在哪个text的后面
function hint_group:CalcNeedUpdatePos(itemPoss,textPoss)
    for i=1,#itemPoss do
        for j=#textPoss,1,-1 do
            if itemPoss[i].y > textPoss[j].y then
                itemPoss[i].after = j
                break
            end
        end
    end
end

--计算text改变宽度后的高度变换
function hint_group:ResetTextWidth(textPoss,width)
    for i=1,#textPoss do
        local hei = DlgApiEx.ResetDescTextAreaWidth(self.panel_name,textPoss[i].item,width)
        textPoss[i].yOff = hei - textPoss[i].hei --计算高度变换带来的y方向偏移,给后来者用
    end
    for i=1,#textPoss do
        if textPoss[i].after then --累积高度偏移
            textPoss[i].yOff = textPoss[i].yOff + textPoss[textPoss[i].after].yOff
        end
    end
end

--重设y方向位置
function hint_group:ResetItemYPoss(itemPoss,textPoss)
    for i = 1,#itemPoss do
        if itemPoss[i].after then
            if textPoss[itemPoss[i].after].yOff ~=0 then 
                DlgApi.SetItemPos(self.panel_name,itemPoss[i].item,itemPoss[i].x,itemPoss[i].y+textPoss[itemPoss[i].after].yOff)
            end
        end
    end
end

--重设x方向位置为dockRight
function hint_group:ResetItemXPoss(right,rightItemList)
    for i=1,#rightItemList do
        local rect = DlgApi.GetItemRect(self.panel_name,rightItemList[i],true)
        if rect then
            DlgApi.SetItemPos(self.panel_name,rightItemList[i],right-rect.width,rect.y)
        end
    end 
end

--重设宽度
function hint_group:ResetWidth(base_x,width,rightItemList)
    --分割线宽度重设
    self:resize_sep(self.sepIdx, width)
    --调整由于宽度重设textArea大小导致的高度变换
    local titlePoss = self:GetItemPosList(self.titleIdx,self.obj_list.title)
    local iconPoss = self:GetItemPosList(self.iconIdx,self.obj_list.icon)
    local paraPoss = self:GetItemPosList(self.paraIdx,self.obj_list.para)
    local sepPoss = self:GetItemPosList(self.sepIdx,self.obj_list.sep)
    local textPoss = self:GetItemPosList(self.textIdx,self.obj_list.text)
    self:CalcNeedUpdatePos(titlePoss,textPoss)
    self:CalcNeedUpdatePos(iconPoss,textPoss)
    self:CalcNeedUpdatePos(paraPoss,textPoss)
    self:CalcNeedUpdatePos(sepPoss,textPoss)
    self:CalcNeedUpdatePos(textPoss,textPoss)
    self:ResetTextWidth(textPoss,width)
    self:ResetItemYPoss(titlePoss,textPoss)
    self:ResetItemYPoss(iconPoss,textPoss)
    self:ResetItemYPoss(paraPoss,textPoss)
    self:ResetItemYPoss(sepPoss,textPoss)
    self:ResetItemYPoss(textPoss,textPoss)
    --调整靠右的x坐标
    self:ResetItemXPoss(base_x+width,self.rightItemList)
end

function hint_group:set_para(text, base_x, base_y)
    local hei,wid,lable = self:set_lable(self.obj_list.para,self.para_num,self.paraIdx,text,base_x,base_y)
    if hei > 0 then
        self.paraIdx = self.paraIdx + 1
        self.last_sep = false
    end
    return hei,wid,lable
end

function hint_group:set_title(text, base_x, base_y)
    local hei,wid,lable = self:set_lable(self.obj_list.title,self.title_num,self.titleIdx,text,base_x,base_y)
    if hei > 0 then
        self.titleIdx = self.titleIdx + 1
        self.last_sep = false
    end
    return hei,wid,lable
end

function hint_group:set_lable(lableCtrl,lableNum,idx, text, base_x, base_y)
    local lable = Format("%s_%s", lableCtrl, idx)
    if idx >= lableNum then 
        if not DlgApiEx.IsItemExists(self.panel_name, lable) then       
        	DlgApi.CreateControl(self.panel_name, lableCtrl, lable)
        	DlgApiEx.InitHintTextItem(self.panel_name, lable)
        end              
    end

    local hei, wid = DlgApiEx.GetTextSize(self.panel_name, lable, text)
    if wid <= 0 then hei = 0 end    --防止文字只是一些颜色或控制字符
    DlgApi.ShowItem(self.panel_name, lable, true)
    DlgApi.SetItemText(self.panel_name, lable, text)
    DlgApi.SetItemSize(self.panel_name, lable, wid, hei)
    DlgApi.SetItemPos(self.panel_name, lable, base_x, base_y)
    return hei, wid,lable,isShow
end

function hint_group:create_icon()
    local theIcon = Format("%s_%s", self.obj_list.icon, self.iconIdx)
    if self.iconIdx >= self.icon_num then 
        if not DlgApiEx.IsItemExists(self.panel_name, theIcon) then       
            DlgApi.CreateControl(self.panel_name, self.obj_list.icon, theIcon)
        end              
    end
    DlgApi.ShowItem(self.panel_name, theIcon, true)
    self.iconIdx = self.iconIdx + 1
    return theIcon
end

function hint_group:create_titleBg(titleBgImg,base_x,base_y,wid,hei)
    local theBg = Format("%s_%s",self.obj_list.titleBg,self.titleBgIdx)
    if self.titleBgIdx >= self.titleBg_num then
        if not DlgApiEx.IsItemExists(self.panel_name,theBg) then
            DlgApi.CreateControl(self.panel_name,self.obj_list.titleBg,theBg)
        end
    end
    DlgApiEx.SetEditBoxFrameImg(self.panel_name,theBg,titleBgImg)
    DlgApi.SetItemSize(self.panel_name,theBg,wid,hei)
    DlgApi.SetItemPos(self.panel_name,theBg,base_x,base_y)
    DlgApi.ShowItem(self.panel_name,theBg,true)
    self.titleBgIdx = self.titleBgIdx + 1
end

function hint_group:set_sep(base_x, base_y)
    local sep = Format("%s_%s", self.obj_list.sep, self.sepIdx)
    if self.sepIdx >= self.sep_num then 
        if not DlgApiEx.IsItemExists(self.panel_name, sep) then       
        	DlgApi.CreateControl(self.panel_name, self.obj_list.sep, sep)
        end
    end
    DlgApi.SetItemPos(self.panel_name, sep, base_x, base_y)
    DlgApi.ShowItem(self.panel_name, sep, true)
    self.sepIdx = self.sepIdx + 1
    self.last_sep = true
    return sep
end

function hint_group:resize_sep(sep_num, wid)
    local sep
    for i = 1, sep_num do
        sep = Format("%s_%s", self.obj_list.sep, i)
        DlgApi.SetItemSize(self.panel_name, sep, wid, self.sep_hei)        
    end    
end

--使用width为宽度限制来设置文本区，如果isMaxWidth为true，则width为区域的最大宽度，否则width
--就是区域的宽度
function hint_group:set_text_with_width(text,base_x,base_y,width,isMaxWidth)
    local textCtrl= Format("%s_%s", self.obj_list.text, self.textIdx)
    if self.textIdx >= self.text_num then 
        if not DlgApiEx.IsItemExists(self.panel_name, textCtrl) then       
            DlgApi.CreateControl(self.panel_name, self.obj_list.text, textCtrl)
            DlgApiEx.InitHintTextItem(self.panel_name, textCtrl)
        end
    end
    if isMaxWidth then --否则使用固定宽度
        local _, wid = DlgApiEx.GetTextSize(self.panel_name, textCtrl, text)
        if wid < width then width = wid end
    end
    local hei = DlgApiEx.SetDescTextArea(self.panel_name, textCtrl, text,width)
    DlgApi.SetItemPos(self.panel_name, textCtrl, base_x, base_y)
    DlgApi.ShowItem(self.panel_name, textCtrl, true)
    self.textIdx = self.textIdx + 1
    self.last_sep = false
    return hei,width
end

--根据宽度重新重新定位标题文字为居中
function hint_group:reloc_title_align_center(right,centerItemList)
    local rect,newX
    for i=1,#centerItemList do
        if DlgApiEx.IsItemExists(self.panel_name,centerItemList[i]) then
            rect = DlgApi.GetItemRect(self.panel_name,centerItemList[i],true)
            newX = rect.x + (right - rect.x - rect.width)/2
            if newX < rect.x or newX > right then newX = rect.x end
            DlgApi.SetItemPos(self.panel_name,centerItemList[i],newX,rect.y)
        end
    end
end

function hint_group:resize_titleBg(titleBg_num,right)
    local titleBg,rect
    for i=1,titleBg_num do
        titleBg = Format("%s_%s",self.obj_list.titleBg,i)
        if DlgApiEx.IsItemExists(self.panel_name,titleBg) then
            rect = DlgApi.GetItemRect(self.panel_name,titleBg,true)
            DlgApi.SetItemSize(self.panel_name,titleBg,right-rect.x,rect.height)
        end
    end
end

--获取标题和副标题
function hint_group:GetTitle(titleTxt)
    local pos = Find(titleTxt,'\r')
    if pos and pos~=Len(titleTxt) then
        return Sub(titleTxt,1,pos-1),Sub(titleTxt,pos+1)
    end
    return titleTxt
end

-------------------------------------
--		hint template
-------------------------------------
Panel_Hint.hint_templ = {}
Panel_Hint.hint_templ.obj_templ = 
{	
	{name = "bg", 		ctr = "Edit_BG", 			},
	{name = "close", 	ctr = "Button_Close",		},	
	{name = "icon",		ctr = "Image_Icon", 		},	
	{name = "title",	ctr = "Label_Title", 		},
    {name = "titleBg",  ctr = "Edit_Quality",       },
	{name = "para",		ctr = "Label_Para", 		},
	{name = "sep",		ctr = "Image_Sep", 			},
    {name = "text",     ctr = "TextArea_NormalDesc" },
}


function Panel_Hint.hint_templ:Show(bShow)
    local panel_name = Panel_Hint.this
    for key, obj in pairs(self.obj_templ) do
        DlgApi.ShowItem(panel_name, obj.ctr, bShow or false)
    end
end

function Panel_Hint.hint_templ:GetOriginCtr(ctrlName)
   for _,obj in ipairs(self.obj_templ) do
        if obj.name == ctrlName then return obj.ctr end
   end 
end

function Panel_Hint.hint_templ:Colone(idx)
    local panel_name = Panel_Hint.this
    local new_obj = ""
    local obj_list = {}    
    for _, obj in ipairs(self.obj_templ) do
        new_obj = Format("%s_%s", obj.ctr, idx)
        if not DlgApiEx.IsItemExists(panel_name, new_obj) then
        	DlgApi.CreateControl(panel_name, obj.ctr, new_obj)        	
        end
        obj_list[obj.name] = new_obj
    end
    return hint_group:new(panel_name, obj_list)
end