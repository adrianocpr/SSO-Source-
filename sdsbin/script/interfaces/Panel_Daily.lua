local DlgApi		= DlgApi
local GameApi		= GameApi
local DlgTemplate 	= DlgTemplate
local Format 	  	= string.format
Panel_Daily = DlgTemplate:new({this = "Panel_Daily"})
--Panel_Daily.ACTIVE_LEVEL_LIMIT    = 12 --签到和活跃度都是20级以后才有效。--改放到daily_man中
local RADIO_BUTTON_ID_MAX   = 6 --最大标签页按钮ID

-------------------------------------
--		overrides
-------------------------------------
function Panel_Daily:Init()  --界面事件
	self:RegisterEvent("Button_Close",		                self.OnCancel) 
	self:RegisterEvent('Radio_dailyHour',	                self.DailyTab)
	self:RegisterEvent('Radio_dailyDay',	                self.DailyTab)
	self:RegisterEvent('Radio_dailyWeek',	                self.DailyTab)
	self:RegisterEvent('Radio_dailycopy',	                self.DailyTab)
	self:RegisterEvent('Radio_Boss',	                    self.DailyTab)
	self:RegisterEvent('Button_sign',		                self.sign)
    self:RegisterEvent(WM_MOUSEWHEEL,                       self.OnMouseWheel)    
    self:RegisterEvent(WM_LBUTTONUP, 		                self.OnHit)
    self:RegisterEvent(WM_MOUSEMOVE,                        self.OnMouseMove)
     
    DlgApi.CheckRadioButton(self.this, 1, 5)
    self.TabPos = {}
    self.TabSel = {}
    self.TabHelpSecretary = {}
end


function Panel_Daily:ShowDialog() 
    if DlgApiEx.IsDialogLoad('Panel_HelpSecretary') and DlgApi.IsDialogShow('Panel_HelpSecretary') then
        Panel_HelpSecretary:HideHelpSecretaryActivity(HELP_ACTIVITY, true)            
    end
    DlgApiEx.LoadGameDialog('Panel_DailySub')
    DlgApiEx.LoadGameDialog('Panel_QuestAvailable')
    DlgApiEx.SetDialogInSubDialogItem(self.this, 'Sub_QuestAvailable', 'Panel_QuestAvailable')
    daily_man:build_daily_list()

    --选项卡
    self:DailyTab()
    --每日签到
    self:ShowSign()    
    --活跃度
    self:ShowActive()
end


function Panel_Daily:Tick(delay)    
    self.TickTime = self.TickTime or 0
    self.TickTime = self.TickTime + delay
    if self.TickTime <= 1000 then
        return
    end
    self.TickTime = nil
    
    -- 位置记录 
    local tab = DlgApi.GetCheckedRadioButton(self.this, 1)
    self.TabPos[tab] = DlgApi.GetScrollPos(self.this, 'Sub_list')

    -- 计算当前未选中标签页的指引
    local tab = DlgApi.GetCheckedRadioButton(self.this, 1)
    for i = 1, RADIO_BUTTON_ID_MAX do
        if tab ~= i then
            local list = daily_man:get_daily_list(i)
            for _, daily in ipairs(list) do
                local bShow = self:ShowHelpSecretary(daily)
                if bShow then
                    self.TabHelpSecretary[self.activityType] = i
                    break
                end
            end
        end
    end
end


function Panel_Daily:HideDialog()
    -- 如果日程表界面打开了则只更新首次活动的数据
    if DlgApiEx.IsDialogLoad("Panel_HelpSecretary") and DlgApi.IsDialogShow("Panel_HelpSecretary") then
        if Panel_HelpSecretary and self.help_activity then
            local setp = self.help_activity.active_step
            Panel_HelpSecretary:HideHelpSecretaryActivity(HELP_ACTIVITTIES[step])
        end
    end
end


-------------------------------------
--		panel message
-------------------------------------
function Panel_Daily:sign()
    DlgApi.ShowDialog("Panel_Sign", not DlgApi.IsDialogShow("Panel_Sign"))
end


function Panel_Daily:OnHit(Item)
    if Item:find('Check_Box') then
        local num = tonumber(Item:sub(-1,-1))
        if num and DailyData_ActiveValue[num] then
            daily_man:SendActiveAward(DailyData_ActiveValue[num])
        end
    end
end


function Panel_Daily:DailyTab()
    DlgApiEx.SetDialogInSubDialogItem('Panel_Daily', 'Sub_list') --第3个值为nil表示将sub清空

    -- 更新sub
    local tab = DlgApi.GetCheckedRadioButton(self.this, 1)
    if DlgApiEx.LoadGameDialog('Panel_DailySub') then
        local daily_id = self.TabSel[tab]
        Panel_DailySub:RefreshDialog(tab, daily_id)
    end   
    DlgApi.SetScrollPos(self.this, 'Sub_list', self.TabPos[tab] or 0)

    -- 如果点击了标签页则关闭相应的指引
    local tab = DlgApi.GetCheckedRadioButton(self.this, 1)
    if Panel_HelpSecretary and self.activityType and self.TabHelpSecretary[self.activityType] and tab == self.TabHelpSecretary[self.activityType] then
        Panel_HelpSecretary:HideHelpSecretaryActivity(HELP_ACTIVITTIES[self.help_activity.active_step])
    end
end


function Panel_Daily:OnMouseWheel(itemName, keyState, delta)
	if not itemName then
		return false
	end
    if itemName == 'Sub_list' or itemName:find('Image_') or itemName:find('Radio_') or itemName:find('Progress_') or itemName:find('Check_') then
        local pos = DlgApi.GetScrollPos(self.this, "Sub_list")
        if delta > 0 then
            pos = pos - 30
        elseif delta < 0 then
            pos = pos + 30
        end
        DlgApi.SetScrollPos(self.this, "Sub_list", pos)
    end
    return false
end


function Panel_Daily:OnMouseMove(Item)
    if (Item == "Text_Pos" or Item == "Text_Award") then
        local data = self.help_activity and self.help_activity.active_data or nil
        if data then
            self:OnFirstActivityOperation(data)
        end
    end    
end


-------------------------------------
--		function called by other
-------------------------------------
function Panel_Daily:OnFinishTask()
    set_timeout(function()
                    self:DailyTab()
                    --每日签到
                    self:ShowSign()    
                    --活跃度
                    self:ShowActive()
                end, 500) --等一下服务器
end


function Panel_Daily:SetSelDialy(daily_id)
    local tab = DlgApi.GetCheckedRadioButton(self.this, 1)
    self.TabSel[tab] = daily_id
    self:ShowDailyDetails(daily_id)
end


-- 设置指引信息
function Panel_Daily:ShowHelpSecretary(daily)
    local is_first, step = help_man:get_first_active_step(daily)
    if is_first and step and step ~= -1 then
        if not self.help_activity then
            self.help_activity = {}
        end
        if not self.help_activity.show_activity or not self.activityType or self.activityType ~= HELP_ACTIVITTIES[step] then
            self.help_activity = { show_activity = true, active_data = daily, active_step = step, daily_id = daily.id }
            Panel_HelpSecretary:PopupHelpSecretaryActivity(HELP_ACTIVITTIES[step], daily.Name, self.reset_help_activity, self.this, TYPE_GUIDE)
            self.activityType = HELP_ACTIVITTIES[step]
            return true
        end
    end
    return false
end


function Panel_Daily:OnFirstActivityOperation(daily)
    if not self.help_activity then
        return 
    end
    if not self.help_activity.show_activity then
        return
    end
    local active_daily = self.help_activity.active_data
    if active_daily and active_daily == daily then
        local setp = self.help_activity.active_step
        help_man:AddvanceFirstActivityRecord(setp + 1, daily)
        if DlgApiEx.IsDialogLoad("Panel_HelpSecretary") and DlgApi.IsDialogShow("Panel_HelpSecretary") then
            Panel_HelpSecretary:HideHelpSecretaryActivity(HELP_ACTIVITTIES[setp])
        end        
    end
end


function Panel_Daily:reset_help_activity(typ)
     if typ == TYPE_GUIDE then
        if self.help_activity then
            self.help_activity.show_activity = false
        end
    end
end



-------------------------------------
--		function called by self
-------------------------------------
--单个任务处理
function Panel_Daily:ShowDailyDetails(daily_id)
    local bShow = true
    if not daily_id then 
        bShow = false 
    end
    local daily = DailyData[daily_id] 
    if not daily then 
        bShow = false 
    end     

    -- 领取
    if bShow then
        local pos = daily.Npc and TemplPos:GetPos(daily.Npc) or nil
        local npcHavePos = pos and DlgApiEx.GetRouteLinkText(daily.Npc) or false
        local npc = tostring(npcHavePos or daily.Npc or "")
        DlgApi.SetItemText(self.this,"Text_Pos", format_string:parse(npc))
    else
        DlgApi.SetItemText(self.this,"Text_Pos", "")
    end
    
    -- 奖励
    if bShow then
        local award = "" 
        if type(daily.Award) == 'table' then
            for _,v in ipairs(daily.Award) do award = award .. v .. " " end
        else
            award = daily.Award or ''
        end
        DlgApi.SetItemText(self.this, "Text_Award", format_string:parse(award))
    else
        DlgApi.SetItemText(self.this, "Text_Award", "")
    end
    
    -- 活动介绍
    if bShow then
        DlgApi.SetItemText(self.this, "Text_Intro", daily.Intro or "")
    else
        DlgApi.SetItemText(self.this, "Text_Intro", "")
    end
	
    -- 活动大图
    if bShow then
        DlgApi.SetImageFile(self.this, 'Image_Daily', daily.ImageScene or '', 1)
    else
        DlgApi.SetImageFile(self.this, 'Image_Daily', '', 1)
    end
    
    --等级
    if bShow then
        local lev_begin = daily.Level and daily.Level.Begin or 1
        local lev_end = daily.Level and daily.Level.End or 60
        local lev
        if daily.LevelText then
            lev = daily.LevelText
        else
            local low = format_string:player_lev(lev_begin)
            local high= format_string:player_lev(lev_end)
            lev = Format(STRING_TABLE.DAILY_PLAYER_LEV, low, high)
        end
        DlgApi.SetItemText(self.this, 'Text_Level', lev) 
    else
        DlgApi.SetItemText(self.this, 'Text_Level', "") 
    end

    -- 名字+人数一起显示
    if bShow then
       local player = ''
	   if daily.Players then
	       player = STRING_TABLE.DAILY_SOLO
	       local minP = daily.Players.Min or 1
	       local maxP = daily.Players.Max or minP
	       if maxP > 1 then
	    	  if minP == maxP then
                  player = Format(STRING_TABLE.DAILY_PLAYER_NUM1, minP)
	   		  else
	        	  player = Format(STRING_TABLE.DAILY_PLAYER_NUM2, minP, maxP)	    	
	          end
	       end
	   end
	   player = daily.PlayersText or player
       local name = daily.Name or ""
	   DlgApi.SetItemText(self.this, 'Text_Name', name .. player)
    else
        DlgApi.SetItemText(self.this, 'Text_Name', "")
    end

    --副本奖励类型
    if bShow then
        local award_type = daily.AwardType
        if award_type then
            DlgApi.SetImageFile(self.this,'Image_Award',DailyData_AwardType[award_type],1)
        else
            DlgApi.SetImageFile(self.this,'Image_Award','',1)
        end
    else
        DlgApi.SetImageFile(self.this,'Image_Award','',1)
    end

	--奖励重点提示
	if bShow and daily.AwardGfx == 1 then
		DlgApi.ShowItem(self.this,'Gfx_Award',true)
	else
		DlgApi.ShowItem(self.this,'Gfx_Award',false)
	end

    --活动补偿
    if bShow then
        local activity_t, activity_bonus = daily_man:CalcActivityBonus(daily)
        local str_activity_bonus = ""
        if activity_t > 1 and activity_t <= 3 then
            str_activity_bonus = string.format(STRING_TABLE.DAILY_ACTIVITY_BONUS_TIPS_LESS_EQUAL_THAN_3, activity_t-1, activity_bonus * 100)
        elseif activity_t > 3 then
            str_activity_bonus = string.format(STRING_TABLE.DAILY_ACTIVITY_BONUS_TIPS_ABOVE_THAN_3, activity_bonus * 100)
        end
        DlgApi.SetItemText(self.this, 'Text_Compensate', str_activity_bonus)
        DlgApi.ShowItem(self.this, 'Text_Compensate', activity_t > 1)
        DlgApi.ShowItem(self.this, 'Image_comp', activity_t > 1)
        DlgApi.ShowItem(self.this, 'Edit_compBG', activity_t > 1) 
    else
        DlgApi.ShowItem(self.this, 'Text_Compensate', false)
        DlgApi.ShowItem(self.this, 'Image_comp', false)
        DlgApi.ShowItem(self.this, 'Edit_compBG', false) 
    end
end


--签到
local t_week = 
{
    [1] = STRING_TABLE.DAILY_SUNDAY_INFO,
    [2] = STRING_TABLE.DAILY_MONDAY_INFO,
    [3] = STRING_TABLE.DAILY_TUESDAY_INFO,
    [4] = STRING_TABLE.DAILY_WEDNESDAY_INFO,
    [5] = STRING_TABLE.DAILY_THURSDAY_INFO,
    [6] = STRING_TABLE.DAILY_FRIDAY_INFO,
    [7] = STRING_TABLE.DAILY_SATURDAY_INFO,
}
function Panel_Daily:ShowSign()
    local day = daily_man:GetWeek()
    local txt = t_week[day] or ''
    DlgApi.SetItemText(self.this, 'Label_sign', txt)
    local check_sign = daily_man:check_for_sign()
    if not check_sign then 
        DlgApi.SetItemText(self.this, 'Label_sign', STRING_TABLE.DAILY_PRAYED_INFO)
    end
    local prop = GameApi.GetHostProp()
    local level = prop.level
    if level < 20 then 
        DlgApi.SetItemText(self.this, 'Label_sign', STRING_TABLE.DAILY_LOWLEV_INFO)
    end
    --DlgApi.EnableItem(self.this,'Button_sign',check_sign)
    DlgApi.ShowItem(self.this,'gfx_sign',check_sign)
end


--刷新活跃度相关显示
function Panel_Daily:ShowActive()
    local repu = daily_man:GetActiveValue()
    DlgApi.SetItemText(self.this,'Label_Active',Format(STRING_TABLE.CUR_ACTIVE_VALUE,repu))
    local active_tab = DailyData_ActiveValue
    local repu_max = active_tab[4].active_value
    DlgApi.SetProgress(self.this,'Progress_Active', repu/repu_max)
    DlgApi.SetItemHint(self.this,'Progress_Active',Format(STRING_TABLE.CUR_ACTIVE_VALUE,repu))
    local prg_rect = DlgApi.GetItemRect(self.this,'Progress_Active',true) --false表示取相对位置。
    for k,v in ipairs(active_tab) do    --刷新按钮状态
        local enable_item,check_item = daily_man:GetActiveStatus(v)
        DlgApi.EnableItem(self.this,'Check_Box' .. k,enable_item and (not check_item))
        DlgApi.CheckItem(self.this,'Check_Box' .. k,check_item)
        local txt = Format(STRING_TABLE.DAILY_CHECKBOX_INTRO,active_tab[k].active_value)
        local hint = active_tab[k].intro_long
        --DlgApi.SetItemText(self.this,'Check_Box' .. k,txt)
        DlgApi.SetItemHint(self.this,'Check_Box' .. k,hint)
        --Panel_SkillsGfx:ShowIconGFX(self.this,'Check_Box' .. k, (not enable_item) and check_item)
        --改为箭头闪动
        if enable_item and not check_item then
            DlgApi.ShowItem(self.this, 'Image_Arrow' .. k, true)
            DlgApi.ShowItem(self.this, 'Image_ArrowD' .. k, false)
        else
            DlgApi.ShowItem(self.this, 'Image_Arrow' .. k, false)
            DlgApi.ShowItem(self.this, 'Image_ArrowD' .. k, true)
        end
        local scale = DlgApi.GetWindowScale() --4个游标位置根据4档声望改变。
        local origin = prg_rect.x
        local delta = prg_rect.width / repu_max * active_tab[k].active_value
        local x = origin + delta - 7 * scale
        local y = prg_rect.y - 7 * scale
        DlgApi.SetItemPos(self.this, 'Image_Arrow' .. k, x, y)
        DlgApi.SetItemPos(self.this, 'Image_ArrowD' .. k, x, y)
        local x = x - 33 * scale
        local y = y - 33 * scale
        DlgApi.SetItemPos(self.this, 'Check_Box' .. k, x, y)
        local x = x - 6 * scale
        local y = y - 5 * scale
        DlgApi.SetItemPos(self.this, 'Image_Box' .. k, x, y)
    end
    local prop = GameApi.GetHostProp()
    DlgApi.ShowItem(self.this,'Progress_Active',prop.level >= daily_man.ACTIVE_LEVEL_LIMIT)
end
