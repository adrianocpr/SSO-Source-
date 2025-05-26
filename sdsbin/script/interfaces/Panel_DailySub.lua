local DlgApi		= DlgApi
local GameApi		= GameApi
local DlgTemplate 	= DlgTemplate
local Format 	  	= string.format
Panel_DailySub = ui.dialog.get("Panel_DailySub")
Panel_DailySub.tick = true

Panel_DailySub.itemPos = --界面基本尺寸配置
    {
        radio = {x = 0, y = 0},
        name = {x = 53, y = 6},
        time = {x = 224, y = 30},
        image = {x = 2, y = 2},
        prg = {x = 244, y = 6},
        count = {x = 240, y = 7},
        check = {x = 247, y = 32},
        status = {x = 264, y = 30},
        power = {x = 235, y = 6},
        gfx  = {x = 5, y = 5},
        img_activity_bonus   = {x = 53, y = 32},
        label_activity_bonus = {x = 69, y = 30},
        width = 355,
        high = 51,
    }
Panel_DailySub.itemList = --控件名称列表
    {
        { key = "name",		val = 'Label_name', },
        { key = "time", 	val = 'Label_time',},
        { key = "radio",	val = 'Radio_daily',},
        { key = "count",	val = 'Label_count',},
        { key = "prg",		val = 'Progress_recommend',},
        { key = "check",	val = 'Check_team',},
        { key = "image", 	val = 'Image_list',},
        { key = "status", 	val = 'Label_status',},
        { key = "power", 	val = 'Label_power',},
        { key = "gfx",      val = 'Gfx_New',},
        { key = "img_activity_bonus",   val = 'Image_Compensate',},
        { key = "label_activity_bonus", val = 'Label_Compensate',},      
    }


-------------------------------------
--		overrides
-------------------------------------
function Panel_DailySub:Init()
    self:RegisterEvent(WM_LBUTTONDOWN, 		self.OnHit)
    self:RegisterEvent(WM_MOUSEWHEEL,       self.OnMouseWheel)
    self:RegisterEvent(WM_MOUSEMOVE,       self.OnMouseMove)
    
    for _, v in ipairs(self.itemList) do
        DlgApi.ShowItem(self.this, v.val..0, false)
    end
    DlgApiEx.SetNoFlush(self.this, true)
    self.show_list = {}
end


function Panel_DailySub:Tick(delay)
    self.TickTime = self.TickTime or 0
    self.TickTime = self.TickTime + delay
    if self.TickTime <= 1000 then
        return
    end
    self.TickTime = nil 

    for idx, daily in ipairs(self.show_list or {}) do
        --刷新第i个活动组中的内容
        self:UpdateDailyInfo(idx, daily)
    end
end


-------------------------------------
--		panel message
-------------------------------------
function Panel_DailySub:OnHit(Item)
    if Item:match('Check_team%d+') then
	    local sel = tonumber(Item:match("%d+"))
        self:OnCheckOperation(sel)

        local daily = self.show_list[sel] or {}
        Panel_Daily:OnFirstActivityOperation(daily)
        return
    end
    if Item:match('Radio_daily%d+') then
    	local sel = tonumber(Item:match("%d+"))    	
    	DlgApi.CheckRadioButton(self.this, 1, sel)

        local daily = self.show_list[sel] or {}
        if daily then
            Panel_Daily:SetSelDialy(daily.id)
        end
        local remove_success = help_man:remove_single_activity_data(daily)
        DlgApi.ShowItem(self.this, 'Gfx_New' .. sel, remove_success or false)
	end            
end


function Panel_DailySub:OnMouseWheel(itemName, keyState, delta)
    Panel_Daily:OnMouseWheel(itemName, keyState, delta)
end


function Panel_DailySub:OnMouseMove(Item, param, x, y)
    if Item:match('Radio_daily%d+') then
        local sel = tonumber(Item:match("%d+"))
        local daily = self.show_list[sel] or {}
        local remove_success = help_man:remove_single_activity_data(daily)
        DlgApi.ShowItem(self.this,'Gfx_New' .. sel, remove_success or false)
    elseif Item:match('Check_team%d+') then
        local sel = tonumber(Item:match("%d+"))
        local daily = self.show_list[sel] or {}
        --处理组队平台
        if daily.Platformid ~= nil and daily.Platformid ~= 0 then 
            local t_id   = daily.Platformid or 0
            local t_type = daily_man:GetPlantformType(t_id)
            GameApi.ShowPlayformHint(self.this, Item, x + 10, y + 10, t_type, t_id)        
        end
    end
end



-------------------------------------
--      function called by others
-------------------------------------
function Panel_DailySub:RefreshDialog(tab, daily_id)
    -- 显示列表生成    
    if tab == 5 then
        local list = daily_man:get_daily_list(tab)
        self.show_list = {}

        -- 先找未提示的副本
        for i, daily in ipairs(list) do
            local is_first = help_man:is_first_active(daily)
            if is_first == true and daily.Type == "Dungeon" then
                table.insert(self.show_list, daily)
            end
        end
        -- 再找未提示的其他
        for i, daily in ipairs(list) do
            local is_first = help_man:is_first_active(daily)
            if is_first == true and daily.Type ~= "Dungeon" then
                table.insert(self.show_list, daily)
            end
        end
        -- 再添加其他的
        for i, daily in ipairs(list) do
            local is_first = help_man:is_first_active(daily)
            if is_first == false then            
                table.insert(self.show_list, daily)
            end
        end
    else
        self.show_list = daily_man:get_daily_list(tab)
    end

    -- 控件生成
    self:ClearList()
    self:CreateList()

    -- 默认选择第一个
    local index = 1
    for i, daily in ipairs(self.show_list) do
        if daily.id == daily_id then
            index = i
        end
    end
    local sel_daily = self.show_list[index]
    DlgApi.CheckRadioButton(self.this, 1, index)    
    Panel_Daily:SetSelDialy(sel_daily and sel_daily.id or 0)
end


-------------------------------------
--		function called by self
-------------------------------------
function Panel_DailySub:OnCheckOperation(sel)    
    local daily = self.show_list[sel] or {}
    local status_check = DlgApi.IsItemChecked(self.this, "Check_team" .. sel)

    -- 战场中
    local bInBattle = GameApi.IsInBattle()
    if bInBattle then
        DlgApi.CheckItem(self.this, 'Check_team' .. sel,  false)
        DlgApiEx.MsgBox(self.this, MB_OK, STRING_TABLE.DAILY_BATTLE_CANNOT_SIGH_HINT)
        return
    end

    -- 处理战场
    if daily.BattleId ~= nil and daily.BattleId ~= 0 then
        local t_id = daily.BattleId or 0
        local t_status, punish_time_tips = GameApi.GetBattleQueueState(daily.BattleId)
        if t_status == "battle_punish" then
            if punish_time_tips ~= nil then
                DlgApi.CheckItem(self.this, 'Check_team' .. sel,  false)
                local punish_tips = Format(STRING_TABLE.PUBLIC_BATTLE_PUNISH_TIPS, punish_time_tips)
                DlgApiEx.MsgBox(self.this, MB_OK, punish_tips)
            end
            return
        end

        if not status_check then
            GameApi.RegisterBattle(t_id)
        else
            GameApi.UnRegisterBattle(t_id)
        end
    end

    -- 处理组队平台
    if daily.Platformid ~= nil and daily.Platformid ~= 0 then 
        local t_id = daily.Platformid or 0
        local t_type = daily_man:GetPlantformType(t_id)
        local is_team = team_platform.has_team()
        if not status_check then
            team_platform.register(t_type, t_id, is_team)
        else
            team_platform.quit(t_type, t_id)
        end
    end

    set_timeout(function()
						Panel_DailySub:SetCheckStatus(sel, daily)
				  end, 1000)
end


function Panel_DailySub:SetCheckStatus(idx, daily)
    local show_item, enable_item, check_item, item_hint, item_text = self:GetOperStatus(daily)
    DlgApi.ShowItem(self.this, 'Check_team' .. idx,   show_item)
    DlgApi.EnableItem(self.this, 'Check_team' .. idx, enable_item)
    DlgApi.EnableItem(self.this, 'Label_status' .. idx, enable_item)
    DlgApi.CheckItem(self.this, 'Check_team' .. idx,  check_item)
    DlgApi.SetItemText(self.this, 'Label_status' .. idx, item_text)
    DlgApi.ShowItem(self.this, 'Label_status' .. idx,    show_item)
end


function Panel_DailySub:GetOperStatus(daily)
    local show_item, enable_item, check_item, item_hint, item_text, label_time_punish
    
    --处理组队平台
    if daily.Platformid and tonumber(daily.Platformid) ~= 0 then
        local t_id = tonumber(daily.Platformid or 0)
        local t_type = daily_man:GetPlantformType(t_id)
        local t_status = team_platform.get_state(t_type, t_id)
        if t_status == 'available' then
            enable_item = true
            show_item = true
            item_hint = STRING_TABLE.DAILY_PLATFORM_HINT
            item_text = STRING_TABLE.DAILY_PLATFORM_HINT
        end
        if t_status == 'disabled' then
            enable_item = false
            show_item = false
        end
        if (t_status == 'registered') or  (t_status == 'team_registered') then
            enable_item = true
            check_item = true
            show_item = true
            item_hint = STRING_TABLE.DAILY_SIGNED_HINT
            item_text = STRING_TABLE.DAILY_SIGNED_HINT
        end
        if team_platform.has_team() and not team_platform.is_team_leader() then
            enable_item = false
            item_text = STRING_TABLE.DAILY_NOT_LEAD_HINT
            item_hint = STRING_TABLE.DAILY_NOT_LEAD_HINT
        end
        if team_platform.has_raid() and not team_platform.is_raid_leader() then
            enable_item = false
            item_text = STRING_TABLE.DAILY_NOT_RAID_LEAD_HINT
            item_hint = STRING_TABLE.DAILY_NOT_RAID_LEAD_HINT
        end
        
        local t_cfg = team_platform.get_config(t_type, t_id)
        if t_cfg ~= nil and t_cfg.exclusive_task ~= nil then
            for _,v in pairs(t_cfg.exclusive_task) do
                if GameApi.IsTaskActive(v) then
                    show_item = false
                    break
                end
            end 
        end
    end
       
    --处理战场
    if daily.BattleId and tonumber(daily.BattleId) ~= 0 then
        show_item   = true
        local t_id = tonumber(daily.BattleId or 0)
        local t_status, punish_time_tips = GameApi.GetBattleQueueState(t_id)   
        if t_status == "battle_available" then
            enable_item = true
            check_item  = false
            item_hint = STRING_TABLE.DAILY_BATTLE_AVAILABEL_HINT
            item_text = STRING_TABLE.DAILY_BATTLE_AVAILABEL_HINT                
        elseif t_status == "battle_registered" or t_status == "battle_join" or t_status == "battle_join_re" then
            enable_item = true
            check_item = true            
            item_hint = STRING_TABLE.DAILY_SIGNED_HINT
            item_text = STRING_TABLE.DAILY_SIGNED_HINT  
        elseif t_status == "battle_enter_confirm" then
            enable_item = false
            check_item = true            
            item_hint = STRING_TABLE.DAILY_BATTLE_ENTER_CONFIRM_HINT
            item_text = STRING_TABLE.DAILY_BATTLE_ENTER_CONFIRM_HINT            
        elseif t_status == "battle_in_battle" then
            enable_item = false
            check_item  = true
            item_hint = STRING_TABLE.DAILY_BATTLE_IN_BATTLE_HINT
            item_text = STRING_TABLE.DAILY_BATTLE_IN_BATTLE_HINT
        elseif t_status == "battle_punish" then
            enable_item = false
            check_item  = false
            item_hint = STRING_TABLE.DAILY_BATTLE_AVAILABEL_HINT
            item_text = STRING_TABLE.DAILY_BATTLE_AVAILABEL_HINT
        end
    end

    --次数用完则不显示，战场也要加相应计数。
    local countCur, countMax = daily_man:GetDailyCompleteCount(daily) 
    if countCur and countMax and countCur >= countMax then 
        show_item = false
    end
    --未开始的活动隐藏组队check按钮 
    if not daily_man:IsDialyInProgress(daily) then 
        show_item = false
    end
    return show_item or false, enable_item or false, check_item or false, item_hint or "", item_text or ""
end


function Panel_DailySub:CheckDaily(idx)
    DlgApi.CheckRadioButton(self.this, 1, idx)
end


function Panel_DailySub:ClearList() --清除活动列表
    local i = 1
    while DlgApiEx.IsItemExists(self.this, 'Label_name' .. i) do
        self:ClearDaily(i)
        i = i + 1
    end
end


function Panel_DailySub:ClearDaily(i) --清除第i个活动控件组
    for _, v in ipairs(self.itemList) do
        item = v.val .. i
        if DlgApiEx.IsItemExists(self.this, item) then
            DlgApi.ShowItem(self.this, item, false)
        end
    end
end


function Panel_DailySub:CreateList() --创建活动列表
    local list = self.show_list
    for idx, daily in ipairs(list) do
	    --创建第i个活动控件组
        self:CreateDaily(idx) 
        --向第i个活动组中添加内容
        self:UpdateDailyInfo(idx, daily)
    end
    
    local scale = DlgApi.GetWindowScale()
    local w = self.itemPos.width * scale
    local h = self.itemPos.high * #list * scale
    DlgApi.SetDialogSize(self.this, w, h) --设置界面大小      
    DlgApiEx.SetDialogInSubDialogItem('Panel_Daily', 'Sub_list', 'Panel_DailySub')
end


--创建第i个活动控件组
function Panel_DailySub:CreateDaily(idx) 
    local scale = DlgApi.GetWindowScale()
    for _, v in ipairs(self.itemList) do
        item = v.val .. idx
        if not DlgApiEx.IsItemExists(self.this, item) then
            DlgApi.CreateControl(self.this, v.val .. 0, item)
            DlgApi.SetItemPos(self.this, item, self.itemPos[v.key].x * scale, (self.itemPos[v.key].y + (idx - 1) * self.itemPos.high) * scale)
                    
            if v.val == 'Radio_daily' then 
                --设置radio button id
                DlgApi.SetObjProperty(self.this, item, "Button ID", idx) --禁忌接口
                DlgApiEx.SetAcceptMouseMessage(self.this, item, false)
            elseif v.val == 'Image_list' then
                --设置图片悬浮置顶
                DlgApi.SetObjProperty(self.this, item, "Render Top", true) --禁忌接口
            end
        end
        DlgApi.ShowItem(self.this, item, true)
    end
end


local week_tab = 
{
    STRING_TABLE.STRING_ALLWEEK,
    STRING_TABLE.STRING_SUNDAY,
    STRING_TABLE.STRING_MONDAY,
    STRING_TABLE.STRING_TUESDAY,
    STRING_TABLE.STRING_WENESDAY,
    STRING_TABLE.STRING_THURSDAY,
    STRING_TABLE.STRING_FRIDAY,
    STRING_TABLE.STRING_SATURDAY,                   
} 
function Panel_DailySub:UpdateDailyInfo(idx, daily)
    local panel = self.this
    -- 时间
    local timeRanger = STRING_TABLE.ALL_DAY
    if daily.Time then        
        local timeBegin = daily.Time.Begin.str or " "
        local timeEnd = daily.Time.End.str or " "        
        if daily.CountDown then
            if daily_man:IsDialyInProgress(daily) then
                timeRanger = Format(STRING_TABLE.DAILY_BOSS_GO,daily_man:GetTimeCountDown(timeEnd))
            elseif daily_man:IsDailyTimeUp(daily) then
                timeRanger = STRING_TABLE.DAILY_BOSS_DEAD
            else
                timeRanger = Format(STRING_TABLE.DAILY_BOSS_COME,daily_man:GetTimeCountDown(timeBegin))
            end
        else
            timeRanger = timeBegin .. "-" .. timeEnd
        end
    end

    local tab = DlgApi.GetCheckedRadioButton('Panel_Daily', 1) 
    -- 周常页和推荐页中显示周几
    if tab == 3 or (tab == 5 and daily.ShowDate) then  
        timeRanger = ''
        if type(daily.Week) == 'table' then
            for _,v in pairs(daily.Week) do
                timeRanger = timeRanger .. ' ' .. week_tab[v + 1]
            end
        else
            timeRanger = week_tab[(daily.Week or 0) + 1]
        end
    end
    -- 如果是周常boss，未到当天时也只显示周常。
    if daily.Type == 'Boss' and daily.Week then 
        if not daily_man:IsTodayFitWeekCondition(daily) then
            timeRanger = ''
            if type(daily.Week) == 'table' then
                for _,v in pairs(daily.Week) do
                    timeRanger = timeRanger .. ' ' .. week_tab[v + 1]
                end
            else
                timeRanger = timeRanger .. ' ' .. week_tab[daily.Week + 1]
            end
        end
    end
    -- 根据活动的状态上色
    if tab ~= 3 then
        if daily.Time then
            if daily_man:IsDialyInProgress(daily) then
                timeRanger = timeRanger .. STRING_TABLE.DAILY_IN_PROGRESS
            else
                timeRanger = '^ff0000' .. timeRanger
            end
        end
    else
        if not daily_man:IsTodayFitWeekCondition(daily) then
            timeRanger = '^ff0000' .. timeRanger
        end
    end
    -- 战场显示逃跑惩罚时间
    if daily.BattleId and tonumber(daily.BattleId) ~= 0 then
        local t_id = tonumber(daily.BattleId or 0)
        local t_status, punish_time_tips = GameApi.GetBattleQueueState(t_id)
        if t_status == "battle_punish" and punish_time_tips ~= nil then     
            label_time_punish = STRING_TABLE.PUBLIC_BATTLE_PUNISH_TIPS_LABEL .. punish_time_tips
            timeRanger = label_time_punish
        end
    end

    DlgApi.SetItemText(panel, 'Label_time'..idx, timeRanger)
    
    -- 名称
    local name = daily.Name or " "

    -- 图标
    local img = daily.Image or "quest\\face\\惊恐.tga"
    DlgApi.SetImageFile(panel, 'Image_list'..idx, img, 1)
    
    -- 数量
    local count_cur,count_max = daily_man:GetDailyCompleteCount(daily,daily.TaskLogic)
    local count_cur = count_cur or 0
    local count_max = count_max or 0
    local count_cur = math.min(count_cur, tonumber(count_max))
    local count = count_cur .. "/" .. count_max
    if tonumber(count_cur) >= tonumber(count_max) then 
        count = '^00ff00' .. count 
        name = '^00ff00' .. name 
        timeRanger = '^00ff00' .. timeRanger
    end
    if daily.TaskRandomCount == true then
        count = STRING_TABLE.DAILY_LIMIT
    end
    DlgApi.SetItemText(panel, 'Label_count'..idx, count)
    DlgApi.SetItemText(panel, 'Label_name'..idx, name)   

    -- 推荐度
    if daily.Precedence then
        local pre = math.floor(tonumber(daily.Precedence)/20) / 5
        DlgApi.SetProgress(panel, 'Progress_recommend'..idx, pre) 
    else
        DlgApi.ShowItem(panel, 'Progress_recommend'..idx, false)
    end

    --Boss推荐战力
    if daily.Power then
        local power = Format(STRING_TABLE.DAILY_BOSS_POWER,daily.Power)
        DlgApi.SetItemText(panel, 'Label_power' .. idx, power)
    else
        DlgApi.ShowItem(panel, 'Label_power' .. idx, false)
    end

    --组队平台/战场
    self:SetCheckStatus(idx, daily)

    --判断当前活动是否是首次活动(这里的首次活动是第一次活动,而不是提示完成就不显示的活动)
    DlgApi.ShowItem(panel,'Gfx_New' .. idx, help_man:is_first_active(daily))

    --设置指引
    Panel_Daily:ShowHelpSecretary(daily)

    --活动补偿
    local activity_t, activity_bonus = daily_man:CalcActivityBonus(daily)
    local str_activity_bonus = ""
    if activity_t > 1 and activity_t <= 3 then
        str_activity_bonus = string.format(STRING_TABLE.DAILY_ACTIVITY_BONUS_HINT_LESS_EQUAL_THAN_3, activity_t-1, activity_bonus * 100)
    elseif activity_t > 3 then
        str_activity_bonus = string.format(STRING_TABLE.DAILY_ACTIVITY_BONUS_HINT_ABOVE_THAN_3, activity_bonus * 100)
    end

    DlgApi.ShowItem(panel, 'Image_Compensate' .. idx, activity_t > 1)
    DlgApi.SetItemHint(panel,'Image_Compensate' .. idx,str_activity_bonus)   
    DlgApi.ShowItem(panel, 'Label_Compensate' .. idx, activity_t > 1)
    DlgApi.SetItemHint(panel,'Label_Compensate' .. idx,str_activity_bonus)   
end