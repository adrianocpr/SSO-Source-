local DlgTemplate = DlgTemplate
local DlgApi  = DlgApi
local m = require("STRING_TABLE")
local table, os, math = table, os, math

HELP_DAILY_MAX_TIMES = 1  --指引最多显示次数

local history_ui_dir_list = {} -- 本次客户端运行已经执行的界面动态指引

TYPE_GUIDE		= 	0
TYPE_TITLE		= 	1
TYPE_PHOTOBOOK	=	2
TYPE_ACHI		=	3
TYPE_ARMY_ACHI	= 	4
TYPE_HELP		=	5
TYPE_ATHENA		=	6
TYPE_CHALLENGE  =   7 --挑战新记录提醒
TYPE_FPS_WARNING	=	8
TYPE_GOT_FLOWER	=	9
TYPE_QUESTIONAIRE	=	10 --调查问卷

-- 帮助管理	
help_man = DlgTemplate:new()


-------------------------------------
--		overrides
-------------------------------------
function help_man:Init()        
    self:RegisterEventEx(LEVT_TASK_FINISH, 					self.OnFinishIdTask)
    self:RegisterEventEx(LEVT_TASK_ACCEPT, 					self.OnAcceptIdTask)
    self:RegisterEventEx(LEVT_FIRST_TASK_FINISH, 			self.OnFirstTaskFinish)
    self:RegisterEventEx(LEVT_FIRST_TASK_ACCEPT, 			self.OnFirstTaskAccept)
	self:RegisterEventEx(LEVT_FIRST_FINISH_ID_TASK, 		self.OnFirstFinishIdTask)
	self:RegisterEventEx(LEVT_FIRST_ACCEPT_ID_TASK, 		self.OnFirstAcceptIdTask)		
    
    self:RegisterEventEx(LEVT_FIRST_REACH_LVL, 				self.OnFirstReachLev)
    self:RegisterEventEx(LEVT_FIRST_ENTER_GAME,				self.OnCommonHelpHint)
    self:RegisterEventEx(LEVT_FIRST_NPC_TALK,				self.OnCommonHelpHint)
    self:RegisterEventEx(LEVT_FIRST_LEARN_SKILL,			self.OnTempBarHelpHint)
    self:RegisterEventEx(LEVT_FIRST_LOW_HP_IN_FIGHT,		self.OnFirstLowHpInFight)
    self:RegisterEventEx(LEVT_FIRST_LOW_HP_OUT_FIGHT,		self.OnFirstLowHpOutFight)
    self:RegisterEventEx(LEVT_FIRST_MONSTER_POWER_EXHAUST,	self.OnFirstMonsterPowerExhaust)
    self:RegisterEventEx(LEVT_FIRST_MONSTER_DRIFT,			self.OnFirstMonsterDrift)
    self:RegisterEventEx(LEVT_FIRST_DIE,					self.OnCommonHelpHint)
    self:RegisterEventEx(LEVT_FIRST_GAIN_SPEC_ITEM, 		self.OnFirstGainSpecItem) 
    self:RegisterEventEx(LEVT_FIRST_FIGHT, 					self.OnFirstFight)
    self:RegisterEventEx(LEVT_FIRST_USE_SPEC_ITEM, 			self.OnFirstUseSpecItem)
    self:RegisterEventEx(LEVT_FIRST_EQUIP_SUCCESS, 			self.OnFirstEquipSuccess) 
    self:RegisterEventEx(LEVT_FIRST_GAIN_EQUIPMENT, 		self.OnFirstGainEquip)
    self:RegisterEventEx(LEVT_FIRST_CAST_SPEC_SKILL, 		self.OnFirstCastSpecSkill) 
    self:RegisterEventEx(LEVT_LEARN_SKILL, 					self.OnLearnNewSkill)
    self:RegisterEventEx(LEVT_NPC_TALK, 					self.OnNPCTalk)
    self:RegisterEventEx(LEVT_FIRST_SHOW_DIALOG, 			self.OnFirstShowDialog)
    self:RegisterEventEx(LEVT_OBTAIN_ITEM, 					self.OnObtainItem)
    self:RegisterEventEx(LEVT_FIRST_PICKUP_ITEM, 			self.OnFirstPickUpItem)
    self:RegisterEventEx(LEVT_FIRST_TASK_AWARD_ITEM, 		self.OnFirstTaskAwardItem)
    self:RegisterEventEx(LEVT_FIRST_PURCHASE_ITEM, 			self.OnFirstPurchaseItem)
    self:RegisterEventEx(LEVT_FIRST_EQUIP_SPEC_TYPE, 		self.OnFirstEquipSpecEquip)
    self:RegisterEventEx(LEVT_FIRST_SELECT_PET_MONSTER, 	self.OnFirstPetTest)
    self:RegisterEventEx(LEVT_FIRST_EQUIP_PET, 				self.OnFirstPetTest)
    self:RegisterEventEx(LEVT_FIRST_CALL_PET, 				self.OnFirstPetTest)
    self:RegisterEventEx(LEVT_FIRST_PET_LVL_UP, 			self.OnFirstPetTest)
    self:RegisterEventEx(LEVT_FIRST_PET_DIE, 				self.OnFirstPetTest)
    self:RegisterEventEx(LEVT_FIRST_PET_CAN_UPGRADE, 		self.OnFirstPetTest)  
    self:RegisterEventEx(LEVT_UI_DYNAMIC_DIRECTION, 		self.OnUIDynamicDirection)
    self:RegisterEventEx(LEVT_OPEN_DIALOG, 					self.OnOpenDialog)
    self:RegisterEventEx(LEVT_FIRST_DIE_REVIVE, 			self.OnFirstDieRevive)
    self:RegisterEventEx(LEVT_FIRST_MANUALLY_LEVEL_UP, 		self.OnFirstManuallyLevelUp)
    self:RegisterEventEx(LEVT_FIRST_GET_CLOTH, 				self.OnFirstGetCloth)
    self:RegisterEventEx(LEVT_FIRST_GET_TITLE, 				self.OnFirstGetTitle)
    self:RegisterEventEx(LEVT_FIRST_GET_PHOTOBOOK, 			self.OnFirstGetPhotobook)
    self:RegisterEventEx(LEVT_FIRST_GET_ACHIEVEMENT, 		self.OnFirstGetAchievement)
    self:RegisterEventEx(LEVT_PRAY, 						self.OnFirstQuitPray)
    self:RegisterEventEx(LEVT_FIRST_SHORTCUT_FULL, 			self.OnFirstShortcutFull)  
    self:RegisterEventEx(LEVT_LEVEL_UP, 					self.OnHostLevelUp)
    self:RegisterEventEx(LEVT_FIRST_IN_TEAM, 				self.OnFirstInTeam)
    self:RegisterEventEx(LEVT_PACKAGE_FULL,			 	    self.OnPackageFull)
    self:RegisterEventEx(LEVT_REVIVE,                        self.OnRevive)
    self:RegisterEventEx(LEVT_CHOOSE_STYLE_FINISHED,          self.OnFinishedChooseStyle)
    self:RegisterEventEx(LEVT_DRAG_LOCKING_SC,          self.OnDragLockingSC)
    self:RegisterEventEx(LEVT_AUTO_ROUTE_TELEPORT,           self.OnAutoRouteTeleport)
    
    
    self.tick_system_bar = nil
    self:Init_Guide()
    -- [ui_dynamic_dir：operation] = {step = n} 
    self.cur_ui_dir_list = {} -- 当前存在的界面动态指导序列
end


function help_man:RegisterEventEx(event, handler)    
    if event and handler and GameUI then
        GameUI:RegisterEvent(event, GameUI.SecretaryEventNotify)  --dlg事件也被注册给gameui
        self:RegisterEvent(event, handler)
    end
end


function help_man:OnEventMapEx(event, ...)    
    self:OnEventMap_Guide(event, unpack(arg))
    self:OnEventMap(event, event, unpack(arg))
end


function help_man:Tick(deltaTime)
    self:Tick_Guide(deltaTime)
    self:tick_systembar(deltaTime)
    --活动指引
    self:Tick_Activity(deltaTime)
    self:Tick_Welcome(deltaTime)
end


-------------------------------------
--		function about power guide
-------------------------------------
function help_man:get_power_dir()
    return guide_power.dir
end

function help_man:get_standard_power()
    local prof = GameApi.GetHostProp()
    return guide_power.standard[prof.level]
end

function help_man:get_power_intro(power_id)
    for _, dirs in ipairs(guide_power.dir) do
        for _, dir in ipairs(dirs) do
            if dir.power_id == power_id then
                return dir.intro and format_string:parse(dir.intro) or nil
            end
        end
    end
end



-------------------------------------
--		function about systembar
-------------------------------------
function help_man:judge_show(bar)
    if bar and bar.jump then
        return GameUI:IsJumpValidated(bar.jump)
    end
    return true
end

function help_man:init_systembar()
    self.system_btn_list = {}
    for id, bar in pairs(System_Bar_Sub) do
        self.system_btn_list[id] = self:judge_show(bar)
    end
    self.tick_system_bar = true
end


local cool_time = 1000
local count = 0
function help_man:tick_systembar(delta_time)
    if not self.tick_system_bar then
        return
    end
    count = count + delta_time
    if count < cool_time then
        return
    end 
    count = 0
    
    local show
    for id, bar in pairs(System_Bar_Sub) do
        show = self:judge_show(bar)

        if show ~= self.system_btn_list[id] and show then
            Panel_SystemBar:show_system_open(id)
            DlgApiEx.play_system_ani(id)
        end
        self.system_btn_list[id] = show
    end    
end


function help_man:get_system_btn(id)
    local sub = System_Bar_Sub[id]
    return sub.button
end


function help_man:get_system_image(id)
    local sub = System_Bar_Sub[id]
    return sub.image
end


function help_man:end_system_ani()
    Panel_SystemBar:end_system_ani()
end


-------------------------------------
--		function about guide_bar
-------------------------------------
local normal_help_id_list  = {} 
local daily_help_id_list = {}  
function help_man:Init_Guide()
    self.data_idx	= 1 
    self.hint_list	= {}
    self.hint_map	= {}
    self.cur_msg    = {}
    self.next_msg   = {}
    self.first_activities        = {}     
    self.help_activity_max_times = self.help_activity_max_times or {}  -- 首次活动显示次数    
    self:LoadFirstActivityRecord()
    
	-- 注册消息/初始化星期信息    
    local empty_func = function() end
    for id, data in pairs(help_data) do
        if type(id) == "number" and data then
            if data.event and (not self.eventMap[data.event]) then
            	self:RegisterEventEx(data.event, empty_func)            	
        	end
        	if not self.init_static_data then
        	    if data.time_range and data.time_range.week then
                    data.time_range.week_tab = {}
                    for _, v in ipairs(data.time_range.week) do
                        data.time_range.week_tab[v] = true
                    end
        	    end
                if data.daily_id and id >= 500 then
        	        table.insert(daily_help_id_list, id)
                else
                    table.insert(normal_help_id_list, id)
                end
            end            
        end
    end
    self.init_static_data = true
end


function help_man:init_player_guide_info() 
    local prop = GameApi.GetHostProp()
    self.player_lev = prop and prop.level or 0        
end


function help_man:OnResetGuideData(id)
    if id == self.guide_id then
        return
    end
    self.hint_login = {}
    self.guide_id	= id   
end


function help_man:OnEventMap_Guide(event, param)
    if not self.next_msg then return end
    if not self.next_msg[event] then
	    self.next_msg[event] = {}
    end
    if param then
    	self.next_msg[event][param] = true
    end
end


local counter_guide = 0
function help_man:Tick_Guide(deltaTime)
    if counter_guide > 0 then
        counter_guide = counter_guide - deltaTime
        return
    end

    local start  = self.data_idx
    local finish = #normal_help_id_list
    local data	 = nil  
    local count  = 0  
    local id	 = nil    
    for idx = start, finish do
        id   = normal_help_id_list[idx]
        data = help_data[id]  
        self.data_idx = idx + 1
        if data then
            count = count + 1
            self:add_help_data(id, data)
        end
        if count >= 1 then	-- 每帧处理一个
            return
        end
    end 
    self.data_idx = 1
    self.cur_msg  = self.next_msg
    self.next_msg = {}        
    counter_guide = 5000
end


-------------------------------------
--		function about welcome
-------------------------------------
function help_man:ShowWelcomeDlg()
	if self.time_to_show_welcome == nil then
	self.time_to_show_welcome = 5000
	end
end

function help_man:Tick_Welcome(deltaTime)
	if self.time_to_show_welcome ~= nil then
		if self.time_to_show_welcome > 0 then
			self.time_to_show_welcome = self.time_to_show_welcome - deltaTime
			if self.time_to_show_welcome <= 0 then
				UIManUtilityFunc:ShowWelcomeDialog()
			end
		end
	end
end



-----------------------------------------------------------------------------------------
-- 活动指引：修改版
-- 加载活动提醒记录


function help_man:LoadFirstActivityRecord()   
    self.first_activity_record = {} 
    local total_finish, total_steps, dungeon_step, cur_step, id_count, total_ids = GameApi.LoadFirstActivityRecord()
    -- 首次创建记录文件,那么使用默认配置初始化一下
    if (not total_finish or total_finish == 0) and (not total_steps or total_steps == 0) and (not dungeon_step or dungeon_step == 0) and (not cur_step or cur_step == 0) then
        -- 默认值初始化
        -- 记录集合 = {[id] = {活动id编号, 提醒时刻对数量N, 日期, 时刻1开始, 时刻1结束, 时刻2开始, 时刻2结束, }}        
        -- total_ids = {[1] = {-1, 0}, [2] = {3, 1, "2013.1.14", "11:00", "11:30"}}
        self.first_activity_record.total_finish = 0
        self.first_activity_record.total_steps  = 3
        self.first_activity_record.dungeon_step = 0
        self.first_activity_record.cur_step     = 2
        self.first_activity_record.total_ids    = {[1] = {-1, 0}}
        self.first_activity_record.id_count     = #self.first_activity_record.total_ids        
        self:SaveFirstActivityRecord()         
    else
        -- 数据校正
        if cur_step > total_steps then
            cur_step    = 2
            dungeon_step= 0
        end

        -- 加载标记数据    
        self.first_activity_record.total_finish = total_finish
        self.first_activity_record.total_steps  = total_steps
        self.first_activity_record.dungeon_step = dungeon_step
        self.first_activity_record.cur_step     = cur_step
        self.first_activity_record.id_count     = id_count
        self.first_activity_record.total_ids    = total_ids
    end    
end


-- 保存活动提醒记录到文件
function help_man:SaveFirstActivityRecord()
    local total_finish      = self.first_activity_record.total_finish
    local total_steps       = self.first_activity_record.total_steps
    local dungeon_finish    = self.first_activity_record.dungeon_step
    local cur_step          = self.first_activity_record.cur_step
    local id_count          = self.first_activity_record.id_count
    local total_ids         = self.first_activity_record.total_ids
    GameApi.SaveFirstActivityRecord(total_finish, total_steps, dungeon_finish, cur_step, id_count, total_ids)
end


-- 更新活动提醒记录
function help_man:UpdateFirstActivityRecord(daily)
    if not daily.TimeUnmerged then
        return false
    end
    if not self.first_activity_record.total_ids then
        self.first_activity_record.total_ids = {}
    end
    local daily_idx
    for idx, info in ipairs(self.first_activity_record.total_ids) do
        if info[1] == daily.id then
            daily_idx = idx
            break
        end
    end
    -- 生成首条新记录
    if not daily_idx then            
        local range = daily_man:GetActiveTimeRange(daily)
        if range then
            local today = daily_man:TransformTime("00:00")
            help_tip_table = {daily.id, 1, today, range.Begin.str, range.End.str}
            table.insert(self.first_activity_record.total_ids, 1, help_tip_table)
            self.first_activity_record.id_count = #self.first_activity_record.total_ids
            return true            
        end
        return false
    end
    -- 更新数据
    local record = self.first_activity_record.total_ids[daily_idx]
    if not record then
        return false
    end
    local range = daily_man:GetActiveTimeRange(daily)
    if not range then
        return false
    end
    if self:is_same_day(record[3]) then
        -- 同一天, 添加数据            
        for i = 1, v1[2], 2 do
            if range.Begin.str == record[3 + i] and range.End.str == record[3 + i + 1] then
                return true                                     
            end
        end
        table.insert(record, range.Begin.str)
        table.insert(record, range.End.str)
        record[2] = record[2] + 1
        return true    
    else
        -- 非同一天, 重置数据
        local today = daily_man:TransformTime("00:00")
        help_tip_table = {daily.id, 1, today, range.Begin.str, range.End.str}
        self.first_activity_record.total_ids[daily_idx] = help_tip_table
        return true
    end
    return false
end



-- 更新所有需要提醒的活动
function help_man:Tick_Activity(deltaTime)
    -- 一分钟检测一次
    self.startTickActivity = self.startTickActivity or GlobalApi.LuaGetTickCount()
    local cur_time = GlobalApi.LuaGetTickCount()
    if (cur_time - self.startTickActivity) < 60000 then    
        return
    else
        self.startTickActivity = cur_time
    end
    -- 如果日程表界面打开了不刷新提示
    if DlgApiEx.IsDialogLoad('Panel_Daily') and DlgApi.IsDialogShow('Panel_Daily') then
        return
    end

    -- 如果日程表未打开那么更新首次活动和定时活动的泡泡界面
    local active_ids, active_tips = {}, {}
    local help = nil
    local need_update = false
    for _, daily_help_id in ipairs(daily_help_id_list) do    
        help = help_data[daily_help_id]        
        if self:add_daily_help(daily_help_id, help, active_ids, active_tips) then
            need_update = true
        end
    end

    --根据状态确定是否强制更新(包括:更新显示状态)
    if need_update then        
        if #active_tips > 0 and DlgApiEx.LoadGameDialog('Panel_HelpSecretary') then
            local tips = table.concat(active_tips, "\r")
            Panel_HelpSecretary:PopupHelpSecretaryActivity(HELP_ACTIVITY, tips, self.remove_activity_data, self, TYPE_GUIDE, active_ids)
        end
    end
end


function help_man:remove_single_activity_data(daily)
    if not daily then return false end
    local help_list = {}

    -- 保存通知记录
    local need_save = false
    for help_id, daily_id in pairs(self.first_activities) do
        if daily_id == daily.id then
            local help = help_data[help_id]
            if help then
                if help.freq == FREQUENCY_TIME then
                    if self:UpdateFirstActivityRecord(daily) then
                        need_save = true
                    end
                else
                    self:AddvanceFirstActivityRecord(nil, daily)
                end
            end
            table.insert(help_list, help_id)
        end
    end
    if need_save then
        self:SaveFirstActivityRecord()
    end

    -- 更新状态
    for _, help_id in ipairs(help_list) do
        self:remove_daily_help(help_id)
    end
end


function help_man:remove_activity_data(typ, active_ids)
    if typ ~= TYPE_GUIDE then
        return
    end
    for _, help_id in ipairs(active_ids or {}) do
        local help = help_data[help_id]
        if help and help.daily_id then        
            self:remove_single_activity_data(DailyData[help.daily_id])            
            self:remove_daily_help(help_id)        
        end         
    end    
end


function help_man:add_daily_help(help_id, help, active_ids, active_tips)
    if not help.daily_id then return false end
    if self.hint_map[help_id] and self.hint_map[help_id].show then 
        return false 
    end
    -- 到达帮助次数限制
    if self:reach_help_time_limit(help_id, help.daily_id) then
        return false
    end
    -- 活动是否完成
    if self:has_finished_activity(help_id, help.daily_id) then
        return false
    end
    -- 提示频率限制
    if not self:check_freq(help_id, help) then
        return false
    end
    -- 条件判断
    if not self:check_condition(help) then
        return false
    end
    -- 活动是否激活
    if not daily_man:IsActivityAvailable(help.daily_id) then
        return false
    end
    -- 活动名称
    local active_name = daily_man:GetActiveName(help.daily_id)
    if not active_name then
        return false
    end

    if self.first_activities[help_id] ~= help.daily_id then
        self.first_activities[help_id]  = help.daily_id            
        self:set_show_help_time(help_id, help.daily_id)                
    end
    if not self.hint_map[help_id] then
        self.hint_map[help_id]  = {}
    end
    self.hint_map[help_id].show = true
    self.hint_login[help_id]    = true
    table.insert(active_tips, active_name)
    table.insert(active_ids, help_id)
    return true
end


function help_man:remove_daily_help(help_id)
    local cur_time = GlobalApi.LuaGetTickCount()
    local prop = GameApi.GetHostProp()    
    self.hint_map[help_id] = {lev = prop.level, last_time = cur_time, show = false}
    self.first_activities[help_id] = nil
end


-- 设置显示弹出泡泡次数
function help_man:set_show_help_time(help_data_id, daily_id)
    local help = help_data[help_data_id]
    if not help then return end
    local daily = DailyData[daily_id]
    if not daily then return end

    if help.freq == FREQUENCY_LEVUP then
        if not self.help_activity_max_times[daily_id] then
            self.help_activity_max_times[daily_id] = 0
        end
        self.help_activity_max_times[daily_id] = self.help_activity_max_times[daily_id] + 1
    elseif help.freq == FREQUENCY_TIME then
        if not daily.TimeUnmerged then
            return
        end
        local today = daily_man:TransformTime("00:00")        
        if not self.help_activity_max_times[daily_id] or today ~= self.help_activity_max_times[daily_id].today_stamp then
            self.help_activity_max_times[daily_id] = {today_stamp = today, time_seg = {}}
        end
        local range = daily_man:GetActiveTimeRange(daily)
        if range then
            table.insert(self.help_activity_max_times[daily_id].time_seg, range)
        end
    end
end


-- 判断是否达到弹出次数限制
-- 返回值为 true 表示达到上限或者是数据错误情况
function help_man:reach_help_time_limit(help_data_id, daily_id)    
    local help = help_data[help_data_id]
    if not help then return true end
    local daily = DailyData[daily_id]
    if not daily then return true end

    if help.freq == FREQUENCY_LEVUP then
        if not self.help_activity_max_times[daily_id] then
            self.help_activity_max_times[daily_id] = 0
        end        
        return self.help_activity_max_times[daily_id] >= HELP_DAILY_MAX_TIMES
    elseif help.freq == FREQUENCY_TIME then
        if not daily.TimeUnmerged then
            return true
        end
        if not self.help_activity_max_times[daily_id] then
            return false
        end
        local today = daily_man:TransformTime("00:00")        
        if today ~= self.help_activity_max_times[daily_id].today_stamp then
            return false
        end        
        local range = daily_man:GetActiveTimeRange(daily)
        for _, _range in ipairs(self.help_activity_max_times[daily_id].time_seg) do
            if range == _range then
                return true
            end
        end
    end
    return false
end


-- 修改版：加入对于每日提醒活动的检查
-- 是否是已经完成了的活动,从文件记录中已经获取的为准
function help_man:has_finished_activity(help_data_id, daily_id)
    if not self.first_activity_record or not self.first_activity_record.total_ids then
        return true
    end
    local daily = DailyData[daily_id]
    if not daily then return true end
    local help = help_data[help_data_id]
    if not help then return true end

    for i, info in ipairs(self.first_activity_record.total_ids) do
        if info[1] == daily_id then            
            if help.freq == FREQUENCY_TIME then
                -- 如果没有定时的时间列表,那么直接返回 true,意味着不进行后续的检测了
                if not daily.TimeUnmerged then
                    return true
                end
                local record_time = info[3]
                if not self:is_same_day(record_time) then
                    return false
                end
                local range = daily_man:GetActiveTimeRange(daily)
                if range then
                    for i = 1, info[2], 2 do
                        if range.Begin.str == info[3 + i] and range.End.str == info[3 + i + 1] then
                            return true                            
                        end
                    end
                end                               
            else
                return true
            end
        end
    end
    return false
end


-- 判断是否是同一天
function help_man:is_same_day(day)
    local today = daily_man:TransformTime("00:00")
    if day == today then
        return true
    end
    return false
end


-- 修改首次活动指引记录
function help_man:AddvanceFirstActivityRecord(next_step, daily)
    local record = self.first_activity_record
    if not record then 
        return 
    end
    
    if not record.total_ids then
        record.total_ids = {}
    end
    local find = false
    for idx, info in ipairs(self.first_activity_record.total_ids) do
        if info[1] == daily.id then
            find = true
            break
        end
    end
    if not find then
        table.insert(record.total_ids, 1, {daily.id, 0})
    end

    self:SaveFirstActivityRecord()
    return
end


-- 外部调用:获取首次活动的步骤
function help_man:get_first_active_step(daily)
    -- 是否已经完成首次指引
    local record = self.first_activity_record
    if not record then return end

    -- 任务完成两个条件:
    local step = -1
    local is_first, help_id = self:is_first_active(daily)
    if is_first and help_id then
        local help = help_data[help_id]
        if help and help.daily_type then        
            step = help_data[help_id].daily_type            
        elseif daily.Type == "Dungeon" then
            -- 副本且副本提示未完成时可以优先提示            
            step = 1            
        else
            step = 2
        end
    end
    return is_first, step
end


-- 外部调用:是否是首次活动
function help_man:is_first_active(daily)    
    for help_id, daily_id in pairs(self.first_activities) do
        if daily.id == daily_id then
            local find = false
            for idx, info in ipairs(self.first_activity_record.total_ids) do
                if info[1] == daily.id then
                    find = true
                    break
                end
            end        
            return not find, help_id            
        end
    end
    return false
end





-----------------------------------------------------------------------------------------

local guide_bar = "Panel_GuideBar"
function help_man:update_guide_bar()
    if #self.hint_list > 0 then
        if not DlgApi.IsDialogShow(guide_bar) then
        	DlgApi.ShowDialog(guide_bar, true, false, false)
        end
        Panel_GuideBar:SetHintList(self.hint_list)
    else
        if DlgApiEx.IsDialogLoad(guide_bar) then
            DlgApi.ShowDialog(guide_bar, false)
        end
    end
end


local data_handlers = 
{
	[TYPE_ATHENA] = function(_typ, _id, list)
						local _end_time = GlobalApi.LuaGetTickCount() + 1000 * 60 * 10
    					table.insert(list, 1, {typ = _typ, id = _id, end_time = _end_time})						
    					return true
					end,
	[TYPE_TITLE] = function(_typ, _id, list)
						GameApi.Play2DSound(AUTO_2D_SOUND.TITLE_OBTAIN)
						GameApi.ShowGuideNew(_typ, _id)
						return false
					end,
	[TYPE_PHOTOBOOK] = function(_typ, _id, list)
							GameApi.Play2DSound(AUTO_2D_SOUND.PHOTOBOOK_OBTAIN)
							GameApi.ShowGuideNew(_typ, _id)
							return false
						end,
	[TYPE_ACHI] = function(_typ, _id, list)
						GameApi.Play2DSound(AUTO_2D_SOUND.ACHI_COMPLETE)
						GameApi.ShowGuideNew(_typ, _id)
						return false
				   end,
	[TYPE_ARMY_ACHI] = function(_typ, _id, list)
							GameApi.Play2DSound(AUTO_2D_SOUND.ACHI_COMPLETE)
							GameApi.ShowGuideNew(_typ, _id)
							return false
						end,
	[TYPE_FPS_WARNING] = function(_typ, _id, list)
						local _end_time = GlobalApi.LuaGetTickCount() + 1000 * 60 * 10
    					table.insert(list, 1, {typ = _typ, id = _id, end_time = _end_time})						
    					return true
					end,
	[TYPE_GOT_FLOWER] = function(_typ, _id, list)
						local _end_time = GlobalApi.LuaGetTickCount() + 1000 * 60 * 10
    					table.insert(list, 1, {typ = _typ, id = _id, end_time = _end_time})						
    					return true
					end,
    [TYPE_QUESTIONAIRE] = function(_typ, _id, list)
						local _end_time = GlobalApi.LuaGetTickCount() + 1000 * 60 * 100
    					table.insert(list, 1, {typ = _typ, id = _id, end_time = _end_time})						
    					return true
					end,			
}
function help_man:add_other_data(_typ, _id)
    for i, hint in ipairs(self.hint_list) do
        if hint.id == _id and hint.typ == _typ then
            return
        end
    end
    
    local handler = data_handlers[_typ]
    if handler then
        if not handler(_typ, _id, self.hint_list) then
            return
        end
    else
        local data = help_data[_id]
        if data and data.questionaire == 1 then
            local bExist = false
            for i, hint in ipairs(self.hint_list) do
                if hint.typ == TYPE_QUESTIONAIRE then
                    bExist = true
                    self.hint_list[i].count = self.hint_list[i].count + 1
                    table.insert(self.hint_list[i].tb, data.questionaireid)
                end
            end
            
            if not self.hint_map[_id] then
                self.hint_map[_id] = {}
            end
            self.hint_map[_id].show = true

            if not bExist then
                table.insert(self.hint_list, {typ = TYPE_QUESTIONAIRE, id = _id, count = 1, curIndex = 1, tb = {[1] = data.questionaireid}})
            end
        else
            table.insert(self.hint_list, {typ = _typ, id = _id, count = 1})
        end
    end
    
    -- 更新界面
    self:update_guide_bar()
end


function help_man:add_help_data(_id, data)
    if self.hint_map[_id] and self.hint_map[_id].show then 
        return false 
    end
    if not data then return false end
    
    -- 频率判断
    if not self:check_freq(_id, data) then
        return false
    end
    
    -- 条件判断
    if not self:check_condition(data) then
        return false
    end
    if not data.show_list then
        return false
    end
    
    -- 触发任务
    if data.trig_task then
        GameApi.MaunallyTrigTask(data.trig_task)
    end
    
    -- 如果是调查问卷，则直接调用add_other_data
    if data.questionaire == 1 then
        return self:add_other_data(TYPE_GUIDE, _id)
    end
    -- 添加数据    
    table.insert(self.hint_list, {typ = TYPE_GUIDE, id = _id, show_idx = math.random(1, #data.show_list)})
    if not self.hint_map[_id] then
        self.hint_map[_id] = {}
    end
    self.hint_map[_id].show = true
    self.hint_login[_id] = true
    
    -- 更新界面
    self:update_guide_bar()      
end


function help_man:remove_help_data(typ, id)
    -- 调查问卷删除模式：同一个图标有个计数，计数达到上限count【表示所有问卷已回答】则删除icon
    if typ == TYPE_QUESTIONAIRE then
        for i, hint in ipairs(self.hint_list) do
            if hint.typ == typ then
                self.hint_list[i].curIndex = self.hint_list[i].curIndex + 1
                
                if self.hint_list[i].curIndex > self.hint_list[i].count then
                    table.remove(self.hint_list, i)
                end
                
                self:update_guide_bar()
            end
        end
        return
    end
    
    local bRemove = false
    for i, hint in ipairs(self.hint_list) do
        if hint.id == id and hint.typ == typ then
            table.remove(self.hint_list, i)
            bRemove = true
            break
        end
    end
    if not bRemove then
        return
    end
    
    if typ == TYPE_GUIDE then
        local cur_time = GlobalApi.LuaGetTickCount()
        local prop = GameApi.GetHostProp()    
        self.hint_map[id] = {lev = prop.level, last_time = cur_time, show = false}
    end
    self:update_guide_bar()   
end


function help_man:get_help_hint(typ, id)
    local hint = (id and help_data[id]) and help_data[id].hint or ""
    if typ and typ == TYPE_GUIDE then
        if hint ~= "" and help_data[id].activity_bonus_on then
            local activity_t, activity_bonus, activity_name = daily_man:CalcActivityBonus(DailyData[help_data[id].daily_id])
            if activity_t > 1 then
                local hint_temp = hint
                hint = string.format(hint_temp, activity_name, activity_bonus * 100)
            else
                hint = ""         
            end
        end
    end
    return hint
end


function help_man:get_help_text(typ, id, show_idx)
    local text = (((id and help_data[id]) and help_data[id].show_list) and show_idx) and help_data[id].show_list[show_idx].text or ""
    if typ and typ == TYPE_GUIDE then
        if text ~= "" and help_data[id].activity_bonus_on then
            local activity_t, activity_bonus, activity_name = daily_man:CalcActivityBonus(DailyData[help_data[id].daily_id])
            if activity_t > 1 then
                local text_temp = text
                text = string.format(text_temp, activity_name, activity_bonus * 100)
            else
                text = ""         
            end
        end
    end
    return text    
end


function help_man:check_freq(id, data)    
    if data.freq == FREQUENCY_LEVUP then
        local prop = GameApi.GetHostProp()
        local last_lev = self.hint_map[id] and self.hint_map[id].lev or self.player_lev
        if last_lev >= prop.level then
            return false
        end
    elseif data.freq == FREQUENCY_LOGIN then
       	if self.hint_login[id] then
       	    return false
       	end
    elseif data.freq == FREQUENCY_FIRST then
        if not data.event then 
            return false 
        end
    elseif data.freq == FREQUENCY_TIME then
        if not data.interval then
            return false
        end
        local cur_time = GlobalApi.LuaGetTickCount()   
        if not  self.hint_map[id] then
            self.hint_map[id] = {}
            self.hint_map[id].last_time = cur_time
        end     
        local last_time = self.hint_map[id] and self.hint_map[id].last_time or cur_time
        if (cur_time - last_time) < (data.interval * 1000) then
            return false
        end
    end
    return true
end


function help_man:check_condition(data)
    -- 消息数量限制
    if data.hint_limit then
        if #self.hint_list > data.hint_limit then
            return false
        end
    end
    
    -- 消息
    if data.event then
        local event_tab = self.cur_msg[data.event]
    	if not event_tab then
        	return false
    	end    	
    	if data.event_param then
    	    if not event_tab[data.event_param] then
    	        return false
    	    end    	        	        
    	end
    end
    
    -- 等级
    if data.levs then
        local prop = GameApi.GetHostProp()
        local lev_1 = data.levs[1] or 0
        local lev_2 = data.levs[2] or 1000
        if prop.level < lev_1 or prop.level > lev_2 then
            return false
        end 
    end
	
	--等级具体值的列表 xxp 2013-04-14 14:06:54
	if data.level_value then
        local prop = GameApi.GetHostProp()
		for _,v in ipairs(data.level_value) do
			if prop.level == v then
				return true
			end
		end
		return false
	end
    
    -- 完成成就
    if data.achi_id then
        if not GameApi.IsAchiFinish(data.achi_id) then
            return false
        end
    end
    
    -- 未完成成就
    if data.no_achi_id then
        if GameApi.IsAchiFinish(data.no_achi_id) then
            return false
        end
    end
    
    -- 完成任务
    if data.finish_task_id then
        local count  = GameApi.GetTaskFinishedCount(data.finish_task_id) or 0
        if count > 0 then
            return false
        end        
    end
    
    -- 未完成任务
    if data.no_finish_task_id then
        local count  = GameApi.GetTaskFinishedCount(data.no_finish_task_id) or 0
        if count <= 0 then
            return false
        end
    end
    
    -- 是否可接任务
    if data.can_deliver_task_id then
        if not GameApi.CanDeliverTask(data.can_deliver_task_id) then
            return false
        end
    end
    
    -- 已接受任务
    if data.active_task_id then
        if not GameApi.IsTaskActive(data.active_task_id) then
            return false
        end
    end
    
    -- 未接受任务
    if data.no_active_task_id then
        if GameApi.IsTaskActive(data.no_active_task_id) then
            return false
        end
    end
 
    -- 活动配置
    if data.daily_id then
        if not DailyData or type(DailyData) ~= "table" or not DailyData[data.daily_id] then
            return false
        end
    end

    -- 组队平台配置id
    if data.team_platform_id and data.team_platform_type then
        local count_cur,count_max = team_platform.get_counter(data.team_platform_type, data.team_platform_id)
        if (not count_cur) or (not count_max) then
            return false
        end
        if count_cur >= count_max then
            return false
        end
    end

    -- 活动补偿配置
    if data.activity_bonus_on then
        if not data.daily_id then
            return false
        end
        local daily = DailyData[data.daily_id]
        if not daily then
            return false
        end
        local activity_t = daily_man:CalcActivityBonus(daily)
        if activity_t <= 1 then
            return false
        end
    end
    
    -- 是否可以升级
    if data.can_manual_lev_up ~= nil then
        local can_manual_lev_up = GameApi.IsHostRestReachLevUpRate() and GameApi.IsHostExpReachLevUpRate()
        if can_manual_lev_up ~= data.can_manual_lev_up then
            return false
        end
    end
    
    -- 经验是否达到可升级状态
    if data.exp_reach_lev_up_rate ~= nil then
        local only_exp_reach_lev_up_rate = GameApi.IsHostExpReachLevUpRate() and not GameApi.IsHostRestReachLevUpRate()
        if only_exp_reach_lev_up_rate ~= data.exp_reach_lev_up_rate then
            return false
        end
    end
    
    -- 技能是否可以升级
    if data.can_skill_lev_up then
        if not GameApi.CanHostSkillLevUp() then
            return
        end
    end
    
    -- 时间
    if data.time_range then        
        local server_time = GlobalApi.GetServerLocalTime()
        if data.time_range.date then            
            local server_date = server_time.year * 10000 + server_time.month * 100 + server_time.day
            if server_date < data.time_range.date[1] or server_date > data.time_range.date[2] then
                return false
            end
        end
        if data.time_range.time then            
            local server_time = server_time.hour * 100 + server_time.min
            if server_time < data.time_range.time[1] or server_time > data.time_range.time[2] then
                return false
            end
        end
        if data.time_range.week_tab then
            if not data.time_range.week_tab[server_time.week] then
                return false
            end
        end
    end
    
    -- 星命点
    if data.cosmos_star_can_active then
        if not GameApi.IsCosmosStarCanActive() then
            return
        end
    end
            
    return true
end


-------------------------------------
--		help handle function
-------------------------------------
--通用帮助界面
function help_man:OnCommonHelpHint(event)    
	if DlgApiEx.LoadGameDialog('Panel_HelpSecretary') then
		Panel_HelpSecretary:PopupHelpSecretary(event)
	end
end

--弹出临时快捷栏 
function help_man:OnTempBarHelpHint(event)
    self:OnCommonHelpHint(event)
end

-- 第一次接受任务 
function help_man:OnFirstTaskAccept(event)
end

-- 第一次完成任务 
function help_man:OnFirstTaskFinish(event) 
    return false
end



--接受某任务 
function help_man:OnAcceptIdTask(event, taskid)
	if HelpAcceptIdTask[taskid] then    --帮助信息
		if DlgApiEx.LoadGameDialog('Panel_HelpSecretary') then
    		Panel_HelpSecretary:PopupTaskEvent(event, taskid)
		end
	end
	if DialogAcceptIdTask[taskid] then    --头像喊话
		if DlgApiEx.LoadGameDialog("Panel_PortraitDialog") then
    		Panel_PortraitDialog:PopupTaskEvent(event, taskid)
		end
	end
	if NpcAcceptIdTask[taskid] then    --弹出npc界面
		if DlgApiEx.LoadGameDialog("Panel_NPCContentTips") then
			set_timeout(function() 
							Panel_NPCContentTips:PopupText(event,taskid)
					end,1000) --延时，等一下服务器以同步数据
		end
	end	
	
	-- 界面动态指导
	HelpUIDynDir_Func:OnAcceptTask(taskid)
	if taskid == 3524 then  --弹小宇宙爆发指引，xxp2013-05-13 16:34:02
		DlgApi.ShowDialog('Panel_GuideCosmos',true)
	end

	--锄花任务统计界面 xxp 2013-12-02 16:55:09
	if DlgApiEx.LoadGameDialog("Panel_WeedingAward") then
		Panel_WeedingAward:Toggle()
	end

	
	
    return false --必需返回false,如果注册了其它响应函数还会继续调用
end


--完成某任务 
function help_man:OnFinishIdTask(event, taskid, bSuccess)
    if bSuccess then --成功完成：true，放弃：false
    	if HelpFinishIdTask[taskid] then    --帮助信息
		if DlgApiEx.LoadGameDialog('Panel_HelpSecretary') then
        	Panel_HelpSecretary:PopupTaskEvent(event, taskid)
		end
    	end
        if DlgApiEx.LoadGameDialog('Panel_HelpHit') then
            Panel_HelpHit:PopupInterface(event, taskid)
        end
    	if DialogFinishIdTask[taskid] then    --头像喊话
    		if DlgApiEx.LoadGameDialog("Panel_PortraitDialog") then
        		Panel_PortraitDialog:PopupTaskEvent(event, taskid)
    		end
    	end
    	if NpcFinishIdTask[taskid] then    --弹出npc界面
    		if DlgApiEx.LoadGameDialog("Panel_NPCContentTips") then
        		Panel_NPCContentTips:PopupText(event, taskid)
    		end
    	end
    	-- 界面动态指引  	    
    	HelpUIDynDir_Func:OnFinishTask(taskid) 	    
    end

	--关闭锄花任务统计
	if DlgApiEx.LoadGameDialog("Panel_WeedingAward") then
		--Panel_WeedingAward:Toggle()
	end

    return false --必需返回false,如果注册了其它响应函数还会继续调用
end

-- 第一次接受某任务
function help_man:OnFirstAcceptIdTask(event, taskid)
	if DlgApiEx.LoadGameDialog('Panel_HelpSecretary') then
    	Panel_HelpSecretary:PopupTaskEvent(event, taskid) 
	end
end

-- 第一次完成某任务
function help_man:OnFirstFinishIdTask(event, taskid) 
	if DlgApiEx.LoadGameDialog('Panel_HelpSecretary') then
    	Panel_HelpSecretary:PopupTaskEvent(event, taskid) 
	end
end

-- 到达某等级 
function help_man:OnFirstReachLev(event, lev)
    -- 界面动态指导
    HelpUIDynDir_Func:OnReachLevel(lev) 
end


--战斗中血量过低 
function help_man:OnFirstLowHpInFight(event)
	if DlgApiEx.LoadGameDialog('Panel_HelpSecretary') then
		Panel_HelpSecretary:PopupHelpSecretary(event)
	end
end

--战斗外血量过低 
function help_man:OnFirstLowHpOutFight(event)
	if DlgApiEx.LoadGameDialog('Panel_HelpSecretary') then
    	Panel_HelpSecretary:PopupHelpSecretary(event)
	end
end

--怪物力竭
function help_man:OnFirstMonsterPowerExhaust(event)
	if DlgApiEx.LoadGameDialog('Panel_HelpSecretary') then
    	Panel_HelpSecretary:PopupHelpSecretary(LEVT_FIRST_MONSTER_POWER_EXHAUST)
	end
end

--怪物浮空
function help_man:OnFirstMonsterDrift(event)
	if DlgApiEx.LoadGameDialog('Panel_HelpSecretary') then
    	Panel_HelpSecretary:PopupHelpSecretary(LEVT_FIRST_MONSTER_DRIFT)
	end
end

-- 第一次获得某特殊物品
function help_man:OnFirstGainSpecItem(event, itemid) 
	if DlgApiEx.LoadGameDialog('Panel_HelpSecretary') then
    	Panel_HelpSecretary:PopupHelpSecretaryItem(event,itemid)
	end
end

-- 第一次使用某特殊物品
function help_man:OnFirstUseSpecItem(event, itemid)
end

-- 第一次装备成功
function help_man:OnFirstEquipSuccess(event)
    local Help_SecretaryData={}
	Help_SecretaryData.txt = STRING_TABLE.HELP_CHAR_POINT 
	if DlgApiEx.LoadGameDialog('Panel_HelpSecretary') then
		--Panel_HelpSecretary:ShowTip("Panel_SystemBar","Radio_Roleinfo", 20, 0, STRING_TABLE.HELP_CHAR_POINT,4,true,3000)
	end
end

-- 第一次装备某特殊装备
function help_man:OnFirstEquipSpecEquip(event, equipid)
end

-- 第一次获得装备
function help_man:OnFirstGainEquip(event)
end

-- 第一次施放某些特殊技能
function help_man:OnFirstCastSpecSkill(event, skillid)
end
    
--第一次进入战斗
function help_man:OnFirstFight(event)    
	if DlgApiEx.LoadGameDialog('Panel_HelpSecretary') then
    	Panel_HelpSecretary:PopupHelpSecretary(event)
	end
end

--第一次学习技能
function help_man:OnLearnNewSkill(event, skillid)
--	if DlgApiEx.LoadGameDialog('Panel_HelpSecretary') then
 --   	Panel_HelpSecretary:PopupHelpSecretaryNewSkill(event,skillid)
--	end
	HelpUIDynDir_Func:OnLearnNewSkill(skillid)
    GameUI:OnSkillLearn(skillid)
end

--和NPC对话
local last_sound_key = nil
function help_man:OnNPCTalk(event, npc_id)    
    local sound_key = NpcSoundCfg[npc_id]
	if sound_key then
	    if last_sound_key and GameApi.Is2DSoundPlaying(last_sound_key) then
	        return
    	end
	    if GameApi.Play2DSound(sound_key) then		
			last_sound_key = sound_key
	    end
	end
end

-- 第一次打开界面
function help_man:OnFirstShowDialog(event,panel_name)
    -- 界面动态指引
    HelpUIDynDir_Func:OnFirstOpenDlg(panel_name)
end

--获得物品
function help_man:OnObtainItem(event, item_id)
end

--第一次拾取物品
function help_man:OnFirstPickUpItem(event)
end

--第一次任务奖励获得物品
function help_man:OnFirstTaskAwardItem(event)
end

--第一次从NPC购买物品
function help_man:OnFirstPurchaseItem(event)
end 

--宠物第一次测试
function help_man:OnFirstPetTest(event)
	if DlgApiEx.LoadGameDialog('Panel_HelpSecretary') then
    	Panel_HelpSecretary:PopupHelpSecretary(event)
	end
end

--首次活动
function help_man:OnFirstGainActivity(event)
    if DlgApiEx.LoadGameDialog('Panel_HelpSecretary') then
        Panel_HelpSecretary:PopupHelpSecretary(event)
    end
end

-- 打开界面
function help_man:OnOpenDialog(event,panel_name)
    -- 界面动态指引
    HelpUIDynDir_Func:OnOpenDlg(panel_name)
end

-- 玩家升级
function help_man:OnHostLevelUp()
    -- 界面动态指引
    local std_power = self.get_standard_power()
    if std_power == nil then return end
    local std_power_total = 0
    local prop = GameApi.GetHostProp()
    for v in pairs(std_power) do
        std_power_total = std_power_total + v
    end
    if prop.power < std_power_total then
        self.OnUIDynamicDirection(self,LEVT_UI_DYNAMIC_DIRECTION,CHECK_POWER)
    end
    if prop.level == 15 then
    DlgApi.ShowDialog('Panel_First',not DlgApi.IsDialogShow('Panel_First'), false, false)  
    end  
end

-- 首次死亡复活
function help_man:OnFirstDieRevive()  
    -- 界面动态指导
    HelpUIDynDir_Func:OnLevtEvent(LEVT_FIRST_DIE_REVIVE)
end

-- 首次手动升级
function help_man:OnFirstManuallyLevelUp() 
    -- 界面动态指导
    --HelpUIDynDir_Func:OnLevtEvent(LEVT_FIRST_MANUALLY_LEVEL_UP)
    DlgApiEx.LoadGameDialog('Panel_LevelHint')
    Panel_LevelHint:start_guide()
end

-- 首次快捷栏填满
function help_man:OnFirstShortcutFull() 
    -- 界面动态指导
    HelpUIDynDir_Func:OnLevtEvent(LEVT_FIRST_SHORTCUT_FULL)
end



-- 首次获得圣衣
function help_man:OnFirstGetCloth()
    -- do nothing
end

-- 首次获得称号
function help_man:OnFirstGetTitle() 
    -- 界面动态指导
    HelpUIDynDir_Func:OnLevtEvent(LEVT_FIRST_GET_TITLE)
end

-- 首次获得图鉴
function help_man:OnFirstGetPhotobook()
     -- 界面动态指导
    HelpUIDynDir_Func:OnLevtEvent(LEVT_FIRST_GET_PHOTOBOOK)
end

-- 首次获得成就
function help_man:OnFirstGetAchievement()
     -- 界面动态指导
    HelpUIDynDir_Func:OnLevtEvent(LEVT_FIRST_GET_ACHIEVEMENT)
end

-- 首次沐浴荣光
function help_man:OnFirstQuitPray()
     -- 界面动态指导
    HelpUIDynDir_Func:OnLevtEvent(LEVT_PRAY)
end

-- 首次加入队伍
function help_man:OnFirstInTeam()
     -- 界面动态指导
    HelpUIDynDir_Func:OnLevtEvent(LEVT_FIRST_IN_TEAM)
end

function help_man:OnPackageFull()
     -- 界面动态指导
    HelpUIDynDir_Func:OnLevtEvent(LEVT_PACKAGE_FULL)  
end

function help_man:OnRevive()
     -- 界面动态指导
    HelpUIDynDir_Func:OnLevtEvent(LEVT_REVIVE)  
end


function help_man:OnFinishedChooseStyle()
    HelpUIDynDir_Func:OnLevtEvent(LEVT_CHOOSE_STYLE_FINISHED) 
end

function help_man:OnDragLockingSC()
    HelpUIDynDir_Func:OnLevtEvent(LEVT_DRAG_LOCKING_SC) 
end

function help_man:OnAutoRouteTeleport()
HelpUIDynDir_Func:OnLevtEvent(LEVT_AUTO_ROUTE_TELEPORT) 
end

--[[ 
----------------UI操作动态指导 相关  ------------------------------------
]]--

-- 开始一个界面动态指引
-- event = LEVT_UI_DYNAMIC_DIRECTION
-- operation 为 ui_dynamic_dir 中的operation
-- _step 不用填，它表示当前第几步，不填表示第一步
function help_man:OnUIDynamicDirection(event,operation,_step)
    if event ~= LEVT_UI_DYNAMIC_DIRECTION then return end
    local oprt_serious = ui_dynamic_dir[operation]
    if not oprt_serious then return end


    if _step == nil or _step == 1 then
        if oprt_serious.run_time_once == true then
            if history_ui_dir_list[operation] == true then return end 
            history_ui_dir_list[operation] = true
        end
        
    end
    
    -- 关闭上一次的提示
    if DlgApiEx.LoadGameDialog('Panel_HelpDynDirection') then 
    	DlgApi.ShowDialog('Panel_HelpDynDirection' ,false)
	end
	
    -- 明确第几步的时候需比当前步大1
    if _step and _step > 1 then
        local oprt = self.cur_ui_dir_list[operation]
        if not oprt then return end
        if not oprt.step then return end
        if oprt.step ~=  _step - 1 then return end
        -- 没有下一步了，操作序列缓存结束
        if not oprt_serious[_step] then
            self.cur_ui_dir_list[operation] = nil
            return 
        end
        self.cur_ui_dir_list[operation] = {step = _step}
    else -- 没有明确第几步的，从第一步开始
        self.cur_ui_dir_list[operation] = {step = 1}    
    end
    
    if DlgApiEx.LoadGameDialog('Panel_HelpDynDirection') then
    	Panel_HelpDynDirection:PopupUIDynamicDir(operation,self.cur_ui_dir_list[operation].step)
	end 
end

-- 尝试走一步当前的界面动态指导
--	如果一个界面动态指引依赖于某个UI event/command 或其他UI“操作”，请在这个“操作”成功的末尾加上该函数
--	无需关心“操作”是哪个界面动态指引的哪一步
--	将当前“操作”的 auidialog名字 和 auiobject名字 传进来
function help_man:TryToWalkCurrDirection(panel_name,obj_name,msg)
    local oprt_serious,item = {},{}
    if msg == nil then msg = DYNAMIC_DIR_MSG_CLICK end
    for opr,v in pairs(self.cur_ui_dir_list) do
        oprt_serious = ui_dynamic_dir[opr]
		if oprt_serious and v.step and oprt_serious[v.step] then
		    item = ui_dynamic_dir_item[oprt_serious[v.step]]
		    -- 线索控件符合要求
		    if item and item.panel == panel_name then
		        if item.objs then
    	            for _, o in ipairs(item.objs) do
               			if obj_name == o then 
               			    if item.user_msg == nil and msg==DYNAMIC_DIR_MSG_CLICK or item.user_msg == msg then
    	               			self.OnUIDynamicDirection(self,LEVT_UI_DYNAMIC_DIRECTION,opr,v.step + 1)
    	               			return
               			    end
    	           		end
            		end
		        end
		        if item.objs_pre then
    	            for _, o in ipairs(item.objs_pre) do
    	                local pos1,pos2 = string.find(obj_name,o)
               			if pos1 == 1 and pos2 > 1 then 
               			    if item.user_msg == nil and msg==DYNAMIC_DIR_MSG_CLICK or item.user_msg == msg then
    	               			self.OnUIDynamicDirection(self,LEVT_UI_DYNAMIC_DIRECTION,opr,v.step + 1)
    	               			return
               			    end
    	           		end
            		end
		        end
		    end
		end       
    end
end

--[[ 
----------------UI操作动态指导 相关  end ------------------------------------
]]--





