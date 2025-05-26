Panel_GuideExam = ui.dialog.get("Panel_GuideExam")
local dlg = Panel_GuideExam

local Format,Len 		= string.format,string.len
local next_level	= dlg:get_obj("Label_NextValue")
local next_pro  	= dlg:get_obj("Progress_NextLevel")
local cur_level		= dlg:get_obj("Label_Level")
local intro_title	= dlg:get_obj("Label_PowerName")
local cur_levelwing	= dlg:get_obj("Label_LevelWing")
local cur_powerwing	= dlg:get_obj("Label_PowerWing")
local label_hint	= dlg:get_obj("Label_Hint2")
local npc_link		= nil
local LEVEL_LIMIT   = 86

local vscrollBar_width = 20
local itemIconSep = 10

local IntroduceSub = 
{
    name = "Label_PowerSteps1",
    info = "Text_PowerInfo",
    item = "Image_Item1",
    button = "Button_Active",
    bgSub = "Sub_Info",
    nameNum = 1,
    infoNum = 1,
    itemNum = 1,
    buttonNum = 1,
    totalHei = 0,
    buttonJump = {},
    subDlg = nil, --摆放item的控件
}
-------------------------------------
--		overrides
-------------------------------------
function dlg:Init()
    --npc_link:command(dlg.link)
    self:HideDefault()
    self:SetSubDlg()
end


function dlg:HideDialog()    
end


-------------------------------------
--		panel message
-------------------------------------
function dlg:link()
end



-------------------------------------
--		function called by other
-------------------------------------
function dlg:update_stage_info(power_value)
	local level_value = GameApi.GetHostProp().level
    local idx = self:get_cur_stage(power_value,level_value)
    local cur_stage = guide_power.stages[idx]
    if cur_stage then        
        local lev
        cur_level:set_text(cur_stage.name)
        if cur_stage.level > LEVEL_LIMIT then
            label_hint:set_text(STRING_TABLE.POWER_EXAM_OVER_LEVEL)
            lev = LEVEL_LIMIT
        else
            label_hint:set_text(STRING_TABLE.POWER_EXAM_IN_LEVEL)
            lev = cur_stage.level
        end
        cur_levelwing:set_text(lev)
        cur_powerwing:set_text(cur_stage.fight)
    else
        cur_level:set_text("")        
    end
    
    local next_stage = guide_power.stages[idx]
    if next_stage then        
        local str = Format(STRING_TABLE.GUIDE_POWER_STAGE, power_value, next_stage.fight)
        next_level:set_text(str)
        next_pro:show(true)
        local rate = power_value /  next_stage.fight
        next_pro:SetProgress(rate)
    else
        next_level:set_text("")
        next_pro:show(false)
    end
end


function dlg:update_power_info(power_id)
    local info = self:get_power_info(power_id)
    if info then
        local str = Format(STRING_TABLE.GUIDE_POWER_INTRO, info.name)
        intro_title:set_text(str)
    else
        intro_title:set_text("")
    end
    local introduce = info and info.introduce or nil
    self:update_power_introduce(introduce)
end

function dlg:update_power_introduce(introduce)
    self:HideGenerObj()
    if not IntroduceSub.subDlg or not introduce then
        return
    end
    DlgApi.SetScrollPos(self.this, IntroduceSub.bgSub, 0)--初始化滚动条位置
    local scale = DlgApi.GetWindowScale()
    local rect = DlgApi.GetItemRect(self.this, IntroduceSub.bgSub)
    local line_space = DlgApiEx.GetLineSpace(self.this, IntroduceSub.name)*scale
    local base_x,base_y,totalWidth = 0,0,rect.width-vscrollBar_width*scale
    local itemRect = DlgApi.GetItemRect(self.this,IntroduceSub.item)
    local itemWid,itemHei = itemRect.width,itemRect.height
    IntroduceSub.totalHei = 0
    IntroduceSub.buttonJump = {}
    local nameIdx,infoIdx,itemIdx,buttonIdx = 1,1,1,1
    for _, detail in ipairs(introduce) do
        if detail.name and Len(detail.name) > 0 then
            local hei,wid = self:SetName(nameIdx,detail.name,base_x,base_y)
            if wid > 0 then 
                nameIdx = nameIdx + 1 
                base_y = self:SetHei(base_y,hei,line_space)
            end
        end
        if detail.info and Len(detail.info) > 0 then
            local hei = self:SetInfoWithWidth(infoIdx,detail.info,base_x,base_y,totalWidth)
            base_y = self:SetHei(base_y,hei,line_space)
            infoIdx = infoIdx + 1
        end
        if detail.items then
            local itemX = base_x
            for _,item in ipairs(detail.items) do
                self:SetItemIcon(itemIdx,item,itemX,base_y)
                itemX = itemX + itemWid + itemIconSep*scale
                itemIdx = itemIdx + 1
            end
            if #detail.items > 0 then
                base_y = self:SetHei(base_y,itemHei,line_space)
            end
        end
        local useButton = self:GetUseButton(detail.button)
        if useButton then
            local hei = self:SetButtonJump(buttonIdx,useButton,base_y,totalWidth)
            buttonIdx = buttonIdx + 1
            base_y = self:SetHei(base_y,hei,line_space)
        end
    end
    --记录
    if nameIdx > IntroduceSub.nameNum then IntroduceSub.nameNum = nameIdx end
    if infoIdx > IntroduceSub.infoNum then IntroduceSub.infoNum = infoIdx end
    if itemIdx > IntroduceSub.itemNum then IntroduceSub.itemNum = itemIdx end
    if buttonIdx > IntroduceSub.buttonNum then IntroduceSub.buttonNum = buttonIdx end
    --注意调用顺序
    DlgApiEx.SetDialogInSubDialogItem(self.this,IntroduceSub.bgSub)--清除subDlg
    DlgApi.SetDialogSize(IntroduceSub.subDlg,totalWidth,IntroduceSub.totalHei) --重设subDlg高度
    DlgApiEx.SetDialogInSubDialogItem(self.this,IntroduceSub.bgSub,IntroduceSub.subDlg)--设置上subDlg
end

function dlg:ButtonJump(button)
    if IntroduceSub.buttonJump[button] then
        GameUI:OnJumpInterface(IntroduceSub.buttonJump[button])
    end
end

function dlg:OnMouseWheel(delta,itemName)
    local dlgName = DlgApiEx.GetMouseOn()
    if dlgName ==  IntroduceSub.subDlg or itemName == "Image_Pro" then
        local pos = DlgApi.GetScrollPos(self.this, IntroduceSub.bgSub)
        local dist = IntroduceSub.totalHei/5
        if delta > 0 then
            pos = pos - dist
        elseif delta < 0 then
            pos = pos + dist
        end
        DlgApi.SetScrollPos(self.this,IntroduceSub.bgSub, pos)
        return true
    end
    return false
end
-------------------------------------
--		function called by self
-------------------------------------
function dlg:get_power_info(power_id)
    for _, dirs in ipairs(guide_power.dir) do
        for _, dir in ipairs(dirs) do
            if dir.power_id == power_id then
                return dir
            end
        end
    end
end


function dlg:get_cur_stage(power_value,level_value)
    local stages = guide_power.stages
	local idx_power, idx_level_max, idx_level_min = #stages, #stages, #stages
    for i = 1, #stages do
        if power_value < stages[i].fight then
            idx_power = i
			break
		end
	end
    for i = 1, #stages do
        if level_value < stages[i].level then
			idx_level_min = i
			break
		end
	end
    for i = idx_level_min, #stages do
        if stages[idx_level_min].level < stages[i].level then
            idx_level_max = i - 1
			break
        end
    end
	if idx_power >= idx_level_min and idx_power<= idx_level_max then
		idx = idx_power
	end
	if idx_power < idx_level_min then
		idx = idx_level_min
	end
	if idx_power > idx_level_max then
		idx = idx_level_max
	end
	return idx    
end

function dlg:HideDefault()
    DlgApi.ShowItem(self.this, IntroduceSub.name, false)
    DlgApi.ShowItem(self.this, IntroduceSub.info, false)
    DlgApi.ShowItem(self.this, IntroduceSub.item, false)
    DlgApi.ShowItem(self.this, IntroduceSub.button, false)
end

function dlg:SetSubDlg()
    IntroduceSub.subDlg = DlgApiEx.AddDynamicCreateDlg()
    if IntroduceSub.subDlg then
        DlgApiEx.SetDialogInSubDialogItem(self.this,IntroduceSub.bgSub,IntroduceSub.subDlg)
        DlgApiEx.RegisterDlgMsg(IntroduceSub.subDlg,self.this)
    end
end

function dlg:HideGenerObj()
    self:HideOneGenerObjs(IntroduceSub.name,IntroduceSub.nameNum)
    self:HideOneGenerObjs(IntroduceSub.info,IntroduceSub.infoNum)
    self:HideOneGenerObjs(IntroduceSub.item,IntroduceSub.itemNum)
    self:HideOneGenerObjs(IntroduceSub.button,IntroduceSub.buttonNum)
end

--隐藏一组由objBaseName生成的控件
function dlg:HideOneGenerObjs(objBaseName,num)
    local obj_name
    for i = 1, num do
        obj_name = Format("%s_%s", objBaseName, i)
        DlgApi.ShowItem(IntroduceSub.subDlg, obj_name, false)
    end 
end

function dlg:SetName(idx,text,base_x,base_y)
    return self:SetLable(IntroduceSub.name,IntroduceSub.nameNum,idx,text,base_x,base_y)
end

function dlg:SetLable(lableCtrl,lableNum,idx, text, base_x, base_y)
    local lable = Format("%s_%s", lableCtrl, idx)
    if idx >= lableNum then 
        if not DlgApiEx.IsItemExists(IntroduceSub.subDlg, lable) then       
            DlgApiEx.CloneControl(self.this, lableCtrl, IntroduceSub.subDlg,lable)
            DlgApiEx.InitHintTextItem(IntroduceSub.subDlg, lable)
        end              
    end
    DlgApi.ShowItem(IntroduceSub.subDlg, lable, true)
    
    local hei, wid = DlgApiEx.GetTextSize(IntroduceSub.subDlg, lable, text)
    if wid <= 0 then hei = 0 end    --防止文字只是一些颜色或控制字符
    DlgApi.SetItemText(IntroduceSub.subDlg, lable, text)
    DlgApi.SetItemSize(IntroduceSub.subDlg, lable, wid, hei)
    DlgApi.SetItemPos(IntroduceSub.subDlg, lable, base_x, base_y)
    return hei, wid,lable
end

function dlg:SetInfoWithWidth(idx,text,base_x,base_y,width)
    local textCtrl= Format("%s_%s", IntroduceSub.info, idx)
    if idx >= IntroduceSub.infoNum then 
        if not DlgApiEx.IsItemExists(IntroduceSub.subDlg, textCtrl) then       
            DlgApiEx.CloneControl(self.this, IntroduceSub.info,IntroduceSub.subDlg,textCtrl)
            DlgApiEx.InitHintTextItem(IntroduceSub.subDlg, textCtrl)
        end
    end
    local hei = DlgApiEx.SetDescTextArea(IntroduceSub.subDlg, textCtrl, text,width)
    DlgApi.SetItemPos(IntroduceSub.subDlg, textCtrl, base_x, base_y)
    DlgApi.ShowItem(IntroduceSub.subDlg, textCtrl, true)
    return hei,textCtrl
end

function dlg:SetItemIcon(idx,item,base_x,base_y)
    local itemIcon = Format("%s_%s",IntroduceSub.item,idx)
    if idx >= IntroduceSub.itemNum then
        if not DlgApiEx.IsItemExists(IntroduceSub.subDlg, itemIcon) then       
            DlgApiEx.CloneControl(self.this, IntroduceSub.item,IntroduceSub.subDlg,itemIcon)
        end
    end
    DlgApi.ShowItem(IntroduceSub.subDlg, itemIcon, true)
    DlgApi.SetItemPos(IntroduceSub.subDlg, itemIcon, base_x, base_y)
    local bUseHint = item.hint and Len(item.hint)>0
    DlgApiEx.ItemShowIvtrIcon(IntroduceSub.subDlg, itemIcon, item.id,not bUseHint)
    if bUseHint then
        DlgApi.SetItemHint(IntroduceSub.subDlg,itemIcon,item.hint)
    end
end

function dlg:SetButtonJump(idx,button,base_y,rightX)
    local buttonCtrl = Format("%s_%s",IntroduceSub.button,idx)
    if idx >= IntroduceSub.buttonNum then
        if not DlgApiEx.IsItemExists(IntroduceSub.subDlg, buttonCtrl) then       
            DlgApiEx.CloneControl(self.this, IntroduceSub.button,IntroduceSub.subDlg,buttonCtrl)
        end
    end
    DlgApi.ShowItem(IntroduceSub.subDlg, buttonCtrl, true)
    local rect = DlgApi.GetItemRect(IntroduceSub.subDlg,buttonCtrl)
    DlgApi.SetItemPos(IntroduceSub.subDlg, buttonCtrl, rightX-rect.width, base_y)
    DlgApi.SetItemText(IntroduceSub.subDlg,buttonCtrl,button.text)
    if button.hint and Len(button.hint) > 0 then
        DlgApi.SetItemHint(IntroduceSub.subDlg,buttonCtrl,button.hint)
    end
    IntroduceSub.buttonJump[buttonCtrl] = button.jump
    return rect.height
end

function dlg:SetHei(base_y,hei,line_space)
    IntroduceSub.totalHei = base_y + hei
    base_y = IntroduceSub.totalHei +line_space
    return base_y
end

--根据等级获取使用的prop
function dlg:GetUseButton(button)
    local prop = GameApi.GetHostProp()
	if button then
		if type(button) == 'function' then button = button() end
		for _,buttonCfg in ipairs(button) do
			if buttonCfg.level and #buttonCfg.level == 2 then
				if prop.level >= buttonCfg.level[1] and prop.level <= buttonCfg.level[2] then
					return buttonCfg
				end
			else
				return buttonCfg
			end
		end
	end
	return nil
end
