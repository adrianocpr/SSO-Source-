local DlgApi	= DlgApi
local GameApi	= GameApi
local DlgTemplate = DlgTemplate
local HelpData	= HelpData
local Format 	= string.format
Panel_HelpSecretary = DlgTemplate:new({this = "Panel_HelpSecretary"})
Panel_HelpSecretary.show_time = 10000 --自动弹出多个帮助界面时的间隔时间。
local PANEL_LINES = 3  --指引内容少于3行不显示滚动条。


-------------------------------------
--		overrides
-------------------------------------
function Panel_HelpSecretary:Init()
    self:RegisterEvent("Button_Close",        self.OnCancel)
    self.ShowFunc  = nil
    self.ShowPanel = nil
    self.timer_counter = 0
	self:HideArrowExcept(LEFT_TOP_CORNER)
end


function Panel_HelpSecretary:ShowDialog()
    if self.ShowFunc then
        if self.ShowPanel then
        	self.ShowFunc(self.ShowPanel, true)
        	self.PanelBanded = self.ShowPanel
        else
            self.ShowFunc()
        end
    end
    local panel = self.ShowPanel
    self:Align(panel and panel.this or panel, self.OffX, self.OffY, self.aligntype) --ShowPanel有表和值两种可能
end


function Panel_HelpSecretary:Tick(delay) 
    self.m_HintCnt = self.m_HintCnt or 0   --计时关闭已显示的窗口
    self.m_HintCnt = self.m_HintCnt + delay
    self.show_time = self.show_time or PANEL_SHOW_TIME

    -- 重置依附位置和界面顺序
    self:AjustHelpSecretaryDlgLayout()

    self.timer_counter = self.timer_counter + delay
    if self.timer_counter >= self.show_time then
        DlgApi.ShowDialog(self.this, false)
        if self.onEndFunc then
            self.onEndFunc(unpack(self.onEndParam))
            self.onEndFunc  = nil
            self.onEndParam = nil
        end        
    end
end


function Panel_HelpSecretary:HideDialog()
    self.ShowFunc  = nil
    self.ShowPanel = nil
    self.show_time = 10000
    self.OffX = nil
    self.OffY = nil
    self.aligntype = nil
    self.m_HintCnt = nil

    --新手礼包发放
    if self.getgift == true then 
        self:ShowTip("Panel_SystemBar","Button_bag",10,-20,STRING_TABLE.HELP_GAIN_GIFT,3,true)
        self.getgift = nil
    end

    DlgApi.SetItemText(self.this, "Text_Secretary", "")
    DlgApi.FlashItem(self.this,"Image_Secretary",false)
end


function Panel_HelpSecretary:OnCancel()
    DlgApi.ShowDialog(self.this, false)

    if self.onEndFunc ~= nil then
        self.onEndFunc(unpack(self.onEndParam))
        self.onEndFunc  = nil
        self.onEndParam = nil
    end
end


-------------------------------------
--		function called by self
-------------------------------------
function Panel_HelpSecretary:Align(panel,x,y,align)    --将窗口停靠到某个固定位置
    local prop  = DlgApi.GetDialogProp(self.this)
	local left, top, right, bottom = DlgApi.GetWindowRect()
	local align = align or 1
	local scale = DlgApi.GetWindowScale()
    x = x * scale
    y = y * scale    
	self:HideArrowExcept(align)
    if prop then
        if panel then
            local x = (x or 0)
    		local y = (y or 0)
			if align == 2 then
    		DlgApi.SetDialogPosition(self.this, x, y, panel,
        	                     AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_RIGHT, 
            	                 AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_TOP )
			elseif align == 3 then
    			DlgApi.SetDialogPosition(self.this, x, y, panel,
        	                     AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_LEFT, 
            	                 AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_BOTTOM )
			elseif align == 4 then
    			DlgApi.SetDialogPosition(self.this, x, y, panel,
        	                     AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_RIGHT, 
            	                 AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_BOTTOM )
			else
    			DlgApi.SetDialogPosition(self.this, x, y, panel,
        	                     AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_LEFT, 
            	                 AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_TOP )
			end
        else
            	local x = x or 0
	    	x = x + ((right-left)/2 + 10)
    		local y = y or 0 
		y = y + ((bottom-top)/2 + 10)
            	DlgApi.SetDialogPosition(self.this, x, y)
        end
    end
end


function Panel_HelpSecretary:AjustHelpSecretaryDlgLayout()
    self:Align(self.ShowPanel and self.ShowPanel.this or self.ShowPanel,self.OffX,self.OffY,self.aligntype)
    if self.activityType ~= nil and self.activityType ~= HELP_ACTIVITY then
        if self.ShowPanel and self.ShowPanel.this and type(self.ShowPanel.this) == "string" then
            DlgApiEx.InsertDialogBefore("Panel_HelpSecretary", self.ShowPanel.this)
        end
    end
end



-------------------------------------
--      function called by others
-------------------------------------
function Panel_HelpSecretary:ShowHelpData(data)
	local scale = DlgApi.GetWindowScale()    
    if DlgApi.IsDialogShow(self.this) then
        --DlgApi.ShowDialog(self.this,false)
    end --开之前先关一次，确保所有参数重置。
    
    if self.ShowFunc and self.ShowPanel then
        self.ShowFunc(self.ShowPanel, false)
    end
    
    -- 临时快捷栏 
    if data.itemId then
        for k,item in pairs(data.itemId) do
        	DlgApiEx.ShowItemTempShortcut(item)
        end
    end
            	
    if type(data.skillId)== "table" then
        local bInQuickBar = false
        local quickImage = {}
        for _, skill in ipairs(data.skillId) do
        	quickImage = DlgApiEx.GetSkillQuickImages(skill)
        	--得到技能在快捷栏中的所有索引，返回格式为nil或{{dlg1,item1,},{dlg2,item2,}}
        	--类似的还有DlgApiEx.GetItemQuickImages
        	if quickImage then
        	    if DlgApiEx.LoadGameDialog("Panel_TipsArrowDown") then        	        
	            	Panel_TipsArrowDown:ShowOnSkills(quickImage)
	            	break
        	    end                    	
        	else
        	    --DlgApiEx.ShowSkillTempShortcut(skill)
        	end
        end
    end
    
    -- 文字
	local txt = data.txt
	local pos = data.npc and TemplPos:GetPos(data.npc) or nil
    if pos then
        txt = Format(data.txt, DlgApiEx.GetRouteLinkText(data.npc) or "")            	    
    end

    DlgApi.SetItemText(self.this, "Text_Secretary", txt or "")
    
    --帮助要用到的界面    
   if data.panel and DlgApiEx.LoadGameDialog(data.panel) then
        self.ShowPanel = _G[data.panel] or data.panel
        if data.func then
   	    	self.ShowFunc = self.ShowPanel and self.ShowPanel[data.func] or nil
   		end
    else
        if data.func then
            self.ShowFunc = self[data.func]
        else
        	self.ShowFunc  = nil
        	self.ShowPanel = nil
        end
    end

    if data.OffX or data.OffY then
        self.OffX = data.OffX
        self.OffY = data.OffY
    end 
    
    if data.RunTimePanel and data.RunTimeFunc then 
        DlgApi.ShowDialog(data.RunTimePanel,true)
        DlgApi.ShowDialog(data.RunTimePanel,false)
        self.RunTimeFunc=_G[data.RunTimePanel][data.RunTimeFunc]
        self.RunTimeFunc()
    end
	if data.aligntype then
		self.aligntype = data.aligntype
	end
    self:UpdateTextArea("Text_Secretary")  --在显示之前将滚动条去掉
   	if txt then
   		DlgApi.ShowDialog(self.this, true, false, false)
   	else
   	    if self.ShowFunc then
          	self.ShowFunc()    
   	    end
   	end
   	
   	if data.AcceptTaskId then
   	    GameApi.MaunallyTrigTask(data.AcceptTaskId)
   	end
   	
    -- 起始时间及显示时长
    self.timer_counter = 0

end


function Panel_HelpSecretary:PopupHelpSecretary(event)    
    local data = HelpData[event]
    if data then
        self:ShowHelpData(data)
    end    
end


function Panel_HelpSecretary:PopupHelpSecretaryActivity(type, strTips, onEndFunc, ...)    
    if not type then
        return
    end

    local data = HelpData[type]
    if data then
        if self.activityType == nil then
            self.show_time = 15000
        else
            self.show_time = 10000
        end

        self.activityType = type
        if data.txt ~= nil and strTips ~= nil then
            data.txt = string.format(data.format, strTips)
        end
        self:ShowHelpData(data)

        -- 播放声音
        if type == HELP_ACTIVITY then
            if data.sound and AUTO_2D_SOUND and AUTO_2D_SOUND.voiceguide and AUTO_2D_SOUND.voiceguide.female[data.sound]  then
                GameApi.Play2DSound(AUTO_2D_SOUND.voiceguide.female[data.sound])
            end
        end

        if self.onEndFunc then
            self.onEndFunc(unpack(self.onEndParam))
            self.onEndFunc  = nil
            self.onEndParam = nil
        end

        self.onEndFunc = onEndFunc
        self.onEndParam = {...}
    end    
end


function Panel_HelpSecretary:HideHelpSecretaryActivity(type, not_remove_data)
    -- body
    if type ~= nil and type == self.activityType then
        DlgApi.ShowDialog(self.this,false)

        if not not_remove_data then
            if self.onEndFunc ~= nil then
                self.onEndFunc(unpack(self.onEndParam))
                self.onEndFunc  = nil
                self.onEndParam = nil
            end
        end
    end
end


function Panel_HelpSecretary:PopupHelpSecretaryItem(event,itemid)    
    local data = HelpData[event][itemid]
    if data then
        self:ShowHelpData(data)
    end    
end

function Panel_HelpSecretary:PopupTaskEvent(event, taskId)    
    local list = 
        {
           [LEVT_TASK_ACCEPT]			= HelpAcceptIdTask,
           [LEVT_TASK_FINISH] 			= HelpFinishIdTask,
           [LEVT_FIRST_ACCEPT_ID_TASK] 	= HelpFirstAcceptIdTask,
           [LEVT_FIRST_FINISH_ID_TASK]	= HelpFirstFinishIdTask,  
           [LEVT_FIRST_REACH_LVL]       = HelpFirstReachLvl,
        }
        
    local data = list[event] and list[event][taskId] or nil
    if data then
	    self:ShowHelpData(data)	   
	  end
	  	
end

function Panel_HelpSecretary:PopupHelpSecretaryNewSkill(event,skillid)
    local scale = DlgApi.GetWindowScale()
 local data = HelpData[event][skillid]
    if data then
        self:ShowHelpData(data)    
    else
        local img = DlgApiEx.GetSkillQuickImages(skillid)
        if img and img[1] then
			--local rect = DlgApi.GetItemRect(img[1].dialog,img[1].control,true)                    
        	--self:ShowHelpData({skillId = {skillid},txt = '学会了新技能',
        			--panel = img[1].dialog,OffX = rect.x + rect.width/2,OffY = (-38 * scale),aligntype = 3,})
        end
    end
    
end

function Panel_HelpSecretary:UpdateTextArea(item)
	local linestatus = DlgApi.GetTextAreaLineInfo(self.this, item)
	if linestatus then	    
		local bOnlyShowText = linestatus.lines <= PANEL_LINES
		DlgApi.SetOnlyShowText(self.this, item, bOnlyShowText)
	end
end

function Panel_HelpSecretary:HideArrowExcept(id)
	for i = 1,4 do
		DlgApi.ShowItem(self.this,"Image_Arrow" .. i,false)
	end
	local idIndex = {1,1,1,1,}
	if idIndex[id] then
		DlgApi.ShowItem(self.this,"Image_Arrow" .. id,true)
	end
end


-------------------------自定义帮助框------------------------
--arg：	panel：对应帮助要显示在的窗口名
--		control：对应的控件名
--		offx：对控件的偏移x
--		offy：对控件的偏移y		
--		txt：显示的帮助信息
--		style：帮助框的边角显示位置：0：无边角 1：左上边角 2：右上边角 3：左下边角 4 右下边角
--		show：显示与否
--		delaytime：帮助框显示时间
function Panel_HelpSecretary:ShowTip(panel,item,offx,offy,txt,style,bShow,delaytime)
    if DlgApi.IsDialogShow(self.this) then
        DlgApi.ShowDialog(self.this,false)
    end --开之前先关一次，确保所有参数重置。
	local data = 
	{
		txt = txt or "" ,
		aligntype = style,
	}
	local corner = {}
	local dlgProp = DlgApi.GetDialogProp(panel)
	local itemProp = DlgApi.GetItemRect(panel,item,true)
	local scale = DlgApi.GetWindowScale()
	
	corner[LEFT_TOP_CORNER] = 
	{
		x = 0,
		y = 0,
	}
	
    corner[RIGHT_TOP_CORNER] = 
	{
		x = dlgProp.width,
		y = 0,
	}
	
	corner[LEFT_BOTTOM_CORNER] =
	{
		x = 0,
		y = dlgProp.height,
	}
	
	corner[RIGHT_BOTTOM_CORNER] =
	{
		x = dlgProp.width,
		y = dlgProp.height,
	}

	data.OffX = itemProp.x/scale - corner[style].x/scale + (offx or 0)
	data.OffY = itemProp.y/scale - corner[style].y/scale +(offy or 0)
	data.panel = panel
	if bShow then
	   Panel_HelpSecretary.show_time = delaytime or 5000
	        --全局变量修改后要改回去，调用RESET_TIP_TIME()默认是5000
	   Panel_HelpSecretary:ShowHelpData(data)
	else 
	    DlgApi.ShowDialog(self.this,bShow)
	end
	if delaytime then
	set_timeout( function()
		DlgApi.ShowDialog("Panel_HelpSecretary",false)
		self:resetTipTime()
		end,Panel_HelpSecretary.show_time)
	end
	data = nil
end

function Panel_HelpSecretary:resetTipTime()
    self.show_time = 5000
end

function Panel_HelpSecretary:MainTargetHint()
end

function Panel_HelpSecretary:NpcCloseShowHint()
end

function Panel_HelpSecretary:NpcCloseShowHint_LuShan()
end

function Panel_HelpSecretary:FirstAcceptTeleportTask()
    if DlgApiEx.LoadGameDialog('Panel_WorldMap') then
    	Panel_WorldMap.AcceptTeleportTask = true
    end
end
