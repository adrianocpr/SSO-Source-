local DlgApi		= DlgApi
local GameApi		= GameApi
local DlgTemplate 	= DlgTemplate
local Format, type,Len,GSub	= string.format, type,string.len,string.gsub
local Random		= math.random
local Insert 		= table.insert
Panel_RoleInfoSkills= DlgTemplate:new({this = "Panel_RoleInfoSkills"})

local vscrollBar_width = 20

Panel_RoleInfoSkills.ItemTab = 
{
	sep = "Image_Sep",
	para = "Label_Para",
	text = "TextArea_NormalDesc",
	title = "Label_Title",
	bgSub = "Sub_HintBG",
	sepNum = 1,
	paraNum = 1,
	textNum = 1,
	titleNum = 1,
	totalHei = 0,
	itemDlg = nil, --摆放item的控件
}


-------------------------------------
--		overrides
-------------------------------------
function Panel_RoleInfoSkills:Init()
	self:HideDefault()
	self:SetItemDlg()
end


----------------------------
--function  called by others
-----------------------------
function Panel_RoleInfoSkills:ShowDesc(skillId,level,isNeedNext)
	if not self.ItemTab.itemDlg then
		return
	end
	self:hide_gener_obj()
	DlgApi.SetScrollPos(self.this, self.ItemTab.bgSub, 0)--初始化滚动条位置
	local skillDescData = skill_desc:GetDesc_WithComp(skillId,level,isNeedNext)
	local scale = DlgApi.GetWindowScale()
	local rect = DlgApi.GetItemRect(self.this, self.ItemTab.bgSub,true)     
	local sep_hei = DlgApi.GetItemRect(self.this, self.ItemTab.sep).height*scale
    local line_space = DlgApiEx.GetLineSpace(self.this, self.ItemTab.para)*scale
	local rightItems = {}
	local base_x,base_y,totalWid = 0,0,rect.width-vscrollBar_width*scale
	self.totalHei = 0
	local titleIdx,paraIdx,textIdx,sepIdx = 1,1,1,1
	local theItem
	if skillDescData then
		--level
		if skillDescData.CompTitle then
			local curhei, wid,nexthei = 0,0,0
			if skillDescData.CompTitle.atkType then
				curhei, wid = self:set_title(titleIdx,skillDescData.CompTitle.atkType,base_x,base_y)
                if wid>0 then titleIdx = titleIdx + 1 end
			end
			if skillDescData.CompTitle.nextLevel then
				nexthei, wid,theItem = self:set_title(titleIdx,skillDescData.CompTitle.nextLevel,base_x,base_y)
                if wid>0 then 
                	titleIdx = titleIdx + 1 
                	Insert(rightItems,theItem)
                end
			end
			base_y = self:SetHei(base_y,math.max(curhei,nexthei),line_space)
		end
		--base
		if skillDescData.base then
			local hei,wid,index = 0,0,0
			for _,baseStr in ipairs(skillDescData.base) do
				if Len(baseStr)>0 then
					hei,wid,theItem = self:set_para(paraIdx,baseStr,base_x,base_y)
					if wid > 0 then
						index = index + 1
						paraIdx = paraIdx + 1
						if index % 2 == 0 then 
							Insert(rightItems,theItem)
							base_y = self:SetHei(base_y,hei,line_space)
						end
					end
				end
			end
			if index % 2 == 1 then --共奇数个
				base_y = self:SetHei(base_y,hei,line_space)
			end
		end
		--common
		if skillDescData.commonDesc then
            local hei = self:set_text_with_width(textIdx, skillDescData.commonDesc, base_x, base_y,totalWid)
            base_y = self:SetHei(base_y,hei,line_space)
            textIdx = textIdx + 1
        end
		--compDesc
		if skillDescData.compDesc then
			for i=1,skillDescData.compDesc.count do
				local preStr,postStr = skillDescData.compDesc.pre[i],skillDescData.compDesc.post[i]
				if preStr == "\t" then
					sepIdx = self:set_sep(sepIdx,base_x,base_y,totalWid,sep_hei)
					base_y = self:SetHei(base_y,sep_hei,line_space)
				else
					local compHei = 0
					textIdx,paraIdx,compHei = self:set_comp_data(textIdx,paraIdx,
						preStr,postStr,base_x,base_y,totalWid,line_space,rightItems)
					base_y = self:SetHei(base_y,compHei,line_space)
				end
			end
		end
		--soulDesc
		if skillDescData.soulDesc then
			local hei = self:set_text_with_width(textIdx, skillDescData.soulDesc.header, base_x, base_y,totalWid)
            base_y = self:SetHei(base_y,hei,line_space)
            textIdx = textIdx + 1

            sepIdx = self:set_sep(sepIdx,base_x,base_y,totalWid,sep_hei)
            base_y = self:SetHei(base_y,sep_hei,line_space)

            for _,soulStr in ipairs(skillDescData.soulDesc.desc) do
            	hei = self:set_text_with_width(textIdx, soulStr, base_x, base_y,totalWid)
            	base_y = self:SetHei(base_y,hei,line_space)
            	textIdx = textIdx + 1
            end
        end
	end

	--记录
	if titleIdx > self.ItemTab.titleNum then self.ItemTab.titleNum = titleIdx end
    if paraIdx > self.ItemTab.paraNum then self.ItemTab.paraNum = paraIdx end
    if textIdx > self.ItemTab.textNum then self.ItemTab.textNum = textIdx end
    if sepIdx > self.ItemTab.sepNum then self.ItemTab.sepNum = sepIdx end
    self:DockRight(rightItems,totalWid)
    --注意调用顺序
	DlgApiEx.SetDialogInSubDialogItem(self.this,self.ItemTab.bgSub)--清除subDlg
    DlgApi.SetDialogSize(self.ItemTab.itemDlg,totalWid,self.totalHei) --重设subDlg高度
    DlgApiEx.SetDialogInSubDialogItem(self.this,self.ItemTab.bgSub,self.ItemTab.itemDlg)--设置上subDlg
end


function Panel_RoleInfoSkills:OnMouseWheel(delta,itemName)
	local dlgName = DlgApiEx.GetMouseOn()
    if dlgName ==  self.ItemTab.itemDlg or itemName == "Edit_BG2" then
        local pos = DlgApi.GetScrollPos(self.this, self.ItemTab.bgSub)
        local dist = self.totalHei/5
        if delta > 0 then
            pos = pos - dist
        elseif delta < 0 then
            pos = pos + dist
        end
   	    DlgApi.SetScrollPos(self.this, self.ItemTab.bgSub, pos)
   	    return true
    end
    return false
end


-----------------------------
--self called
-----------------------------
--创建容纳文字控件的dlg，并嵌入subdlg控件中
function Panel_RoleInfoSkills:SetItemDlg()
	self.ItemTab.itemDlg = DlgApiEx.AddDynamicCreateDlg()
	if self.ItemTab.itemDlg then
		DlgApiEx.SetDialogInSubDialogItem(self.this,self.ItemTab.bgSub,self.ItemTab.itemDlg)
		DlgApiEx.RegisterDlgMsg(self.ItemTab.itemDlg,self.this)
	end
end

function Panel_RoleInfoSkills:HideDefault()
	 DlgApi.ShowItem(self.this, self.ItemTab.sep, false)
	 DlgApi.ShowItem(self.this, self.ItemTab.para, false)
	 DlgApi.ShowItem(self.this, self.ItemTab.text, false)
	 DlgApi.ShowItem(self.this, self.ItemTab.title, false)
end

function Panel_RoleInfoSkills:hide_gener_obj()
	self:hide_one_gener_objs(self.ItemTab.sep,self.ItemTab.sepNum)
    self:hide_one_gener_objs(self.ItemTab.title,self.ItemTab.titleNum)
    self:hide_one_gener_objs(self.ItemTab.para,self.ItemTab.paraNum)
    self:hide_one_gener_objs(self.ItemTab.text,self.ItemTab.textNum)
end

--隐藏一组由objBaseName生成的控件
function Panel_RoleInfoSkills:hide_one_gener_objs(objBaseName,num)
    local obj_name
    for i = 1, num do
        obj_name = Format("%s_%s", objBaseName, i)
        DlgApi.ShowItem(self.ItemTab.itemDlg, obj_name, false)
    end 
end

function Panel_RoleInfoSkills:SetHei(base_y,hei,line_space)
	self.totalHei = base_y + hei
	base_y = self.totalHei +line_space
	return base_y
end

function Panel_RoleInfoSkills:set_para(idx, text, base_x, base_y)
    return self:set_lable(self.ItemTab.para,self.ItemTab.paraNum,idx,text,base_x,base_y)
end

function Panel_RoleInfoSkills:set_title(idx, text, base_x, base_y)
    return self:set_lable(self.ItemTab.title,self.ItemTab.titleNum,idx,text,base_x,base_y)
end

function Panel_RoleInfoSkills:set_lable(lableCtrl,lableNum,idx, text, base_x, base_y)
    local lable = Format("%s_%s", lableCtrl, idx)
    if idx >= lableNum then 
        if not DlgApiEx.IsItemExists(self.ItemTab.itemDlg, lable) then       
        	DlgApiEx.CloneControl(self.this, lableCtrl, self.ItemTab.itemDlg,lable)
        	DlgApiEx.InitHintTextItem(self.ItemTab.itemDlg, lable)
        end              
    end
    DlgApi.ShowItem(self.ItemTab.itemDlg, lable, true)
    
    local hei, wid = DlgApiEx.GetTextSize(self.ItemTab.itemDlg, lable, text)
    if wid <= 0 then hei = 0 end	--防止文字只是一些颜色或控制字符
    DlgApi.SetItemText(self.ItemTab.itemDlg, lable, text)
    DlgApi.SetItemSize(self.ItemTab.itemDlg, lable, wid, hei)
    DlgApi.SetItemPos(self.ItemTab.itemDlg, lable, base_x, base_y)
    return hei, wid,lable
end

function Panel_RoleInfoSkills:set_sep(idx, base_x, base_y,width,height)
    local sep = Format("%s_%s", self.ItemTab.sep, idx)
    if idx >= self.ItemTab.sepNum then 
        if not DlgApiEx.IsItemExists(self.ItemTab.itemDlg, sep) then       
        	DlgApiEx.CloneControl(self.this, self.ItemTab.sep, self.ItemTab.itemDlg, sep)
        end
    end
    DlgApi.SetItemPos(self.ItemTab.itemDlg, sep, base_x, base_y)
    DlgApi.SetItemSize(self.ItemTab.itemDlg, sep, width, height)        
    DlgApi.ShowItem(self.ItemTab.itemDlg, sep, true)    
    return idx+1
end

function Panel_RoleInfoSkills:set_text_with_width(idx,text,base_x,base_y,width)
    local textCtrl= Format("%s_%s", self.ItemTab.text, idx)
    if idx >= self.ItemTab.textNum then 
        if not DlgApiEx.IsItemExists(self.ItemTab.itemDlg, textCtrl) then       
            DlgApiEx.CloneControl(self.this, self.ItemTab.text,self.ItemTab.itemDlg,textCtrl)
            DlgApiEx.InitHintTextItem(self.ItemTab.itemDlg, textCtrl)
        end
    end
    local hei = DlgApiEx.SetDescTextArea(self.ItemTab.itemDlg, textCtrl, text,width)
    DlgApi.SetItemPos(self.ItemTab.itemDlg, textCtrl, base_x, base_y)
    DlgApi.ShowItem(self.ItemTab.itemDlg, textCtrl, true)
    return hei,textCtrl
end

function Panel_RoleInfoSkills:set_comp_data(textIdx,paraIdx,preStr,postStr,base_x,base_y,bgWidth,line_space,rightItems)
	local preHei,preTextCtrl = self:set_text_with_width(textIdx,preStr,base_x,base_y,bgWidth)
	local hei = preHei
	textIdx = textIdx + 1
	if postStr then
		local postHei,postWid,theItem = self:set_para(paraIdx,postStr,base_x,base_y)
		if postWid > 0 then --重新计算位置
			local preHeiInOneLine,preWidthInOneLine = DlgApiEx.GetTextSize(self.ItemTab.itemDlg,
				preTextCtrl,preStr)
			if preWidthInOneLine > bgWidth then
				preWidthInOneLine = preWidthInOneLine % bgWidth
			end
			local isNextLine = preWidthInOneLine + postWid >= bgWidth
			local postY = base_y + preHei - postHei
			if isNextLine then 
				postY = base_y + preHei + line_space
				hei = hei + postHei + line_space
			end
			DlgApi.SetItemPos(self.ItemTab.itemDlg,theItem,base_x,postY)
			Insert(rightItems,theItem)
			paraIdx = paraIdx + 1
		end
	end
	return textIdx,paraIdx,hei
end

--dockRight指定的item
function Panel_RoleInfoSkills:DockRight(rightItemList,right)
	for _,theItem in ipairs(rightItemList) do
		local rect = DlgApi.GetItemRect(self.ItemTab.itemDlg,theItem,true)
		DlgApi.SetItemPos(self.ItemTab.itemDlg,theItem,right-rect.width,rect.y)
	end
end
