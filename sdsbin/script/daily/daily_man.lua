local Insert = table.insert
-----------------------
-- 日常管理
daily_man = {}
local metatable = {}
setmetatable(daily_man, metatable)
daily_man.ACTIVE_LEVEL_LIMIT = 12 --日程表在12级以上激活


local WEEK		= 3
local DUNGEON	= 4
local RECOMMEND	= 5
local BOSS  	= 6

local ARENA_DAILY_ID    = 95       -- 个人竞技场id
local TASK_ID           = 5429     -- 签到任务id
local TIME_OFFSET       = 6        -- 时间向前偏移量，单位小时，6表示每天从六点开始。用于刷新周期。


local daily_data_init = false
function daily_man:init() --加载
    if not daily_data_init then
        daily_data_init = true
        self:FormatDailyData()        
    end
    metatable:reset_state()
    
    self.daily_list = {}
    self:build_daily_list()    
end


--------------------------
-- 时间处理

function daily_man:update_server_time_flag()
    metatable.need_update_time = true
end


function metatable:reset_state()
    self.need_update_time  = true
    self.server_local_time = 0
end


function metatable.__index(table, key)
    if key == "server_local_time" then
        if rawget(metatable, "need_update_time") then
            rawset(metatable, "server_local_time", GlobalApi.GetServerLocalTime())
            rawset(metatable, "need_update_time", false)
        end
        return rawget(metatable, "server_local_time")
    end
end


--------------------------
-- 活动

function daily_man:get_daily_list(typ)
    return self.daily_list and self.daily_list[typ] or {}
end


local sort_week_func        = nil
local sort_recommend_func   = nil
local sort_boss_func        = nil
function daily_man:build_daily_list()
    self.daily_list[WEEK] = {}
    self.daily_list[RECOMMEND] = {}
    self.daily_list[BOSS] = {}
     
    --获取显示任务等级列表
    local prop = GameApi.GetHostPropEx()    
    for daily_id, daily in pairs(DailyData) do 
        -- 可见时间范围
        daily.Time = self:GetShowTimeRange(daily) 
        
    	-- 位于可见等级之内，并且达到当前环数，或者是当前的周常
        local lev_req  = daily.Level.CanSee <= prop.level and daily.Level.NotSee > prop.level
        local repu_req = self:IsRequReq(daily) 
        local date_req = self:IsTodayFitDateCondition(daily)
	    if lev_req and repu_req and date_req then
            local week_req = self:IsTodayFitWeekCondition(daily)
            if week_req and daily.ShowInDaily ~= false then
	            Insert(self.daily_list[RECOMMEND], daily)
            end
            if daily.Type == 'Week' then
                Insert(self.daily_list[WEEK], daily)
            end
            if daily.Type == 'Boss' then
                Insert(self.daily_list[BOSS], daily)
            end
        end
	end
    
    --周常活动再根据周几和推荐度进行排序
	table.sort(self.daily_list[WEEK], sort_week_func)	
    --推荐活动根据活动优先级排序
	table.sort(self.daily_list[RECOMMEND], sort_recommend_func)
    --boss根据优先级排序
    table.sort(self.daily_list[BOSS], sort_boss_func)    
end


-- 获取当前活动名称
function  daily_man:GetActiveName(daily_id)
    if not daily_id then 
        return false
    end
    local daily = DailyData[daily_id]
    if not daily then
        return false
    end
    return daily.Name
end


function daily_man:GetPlantformType(tid)
    if team_platform.get_config(team_platform.CATEGORY_DUNGEON, tid) then
        return team_platform.CATEGORY_DUNGEON
    else
        return team_platform.CATEGORY_ACTIVITY
    end
end


--任务内容处理，根据活动对应的声望值判断活动是否已经可接。
function daily_man:IsRequReq(daily)
    local taskReq = daily and daily.DailyReq
    if taskReq then 
        local repu = GameApi.GetHostRepuValue(taskReq[1]) or 1
        if repu ~= (taskReq[2] or 1) then 
            return false 
        end
    end
    return true
end


-- 判断当前活动是否是合适的活动
function daily_man:IsActivityAvailable(daily_id)    
    local daily = DailyData[daily_id]
    if not daily then
        return false
    end
    
    -- 等级
    local prop = GameApi.GetHostPropEx()
    if prop.level < daily.Level.CanSee or prop.level > daily.Level.NotSee then
        return false
    end
    -- 声望
    if not self:IsRequReq(daily) then
        return false
    end
    -- 完成次数
    if self:IsDailyComplete(daily) then
        return false
    end
    -- 时间
    if daily.TimeUnmerged then
        local range = self:GetActiveTimeRange(daily)
        if not range then
            return false
        end
    end
    return true
end


--根据可接时间决定该任务是否已超时
function daily_man:IsDailyTimeUp(daily) 
    if not daily.Time then return true end
    local server_local_time = self.server_local_time
    local server_time = server_local_time.hour * 60 + server_local_time.min
    return server_time >= daily.Time.End.union
end


--任务内容处理，是否是当前正在进行的活动
function daily_man:IsDialyInProgress(daily)
    if not self:IsTodayFitWeekCondition(daily) then 
        return false 
    end
    if not daily.Time then return true end
    local server_local_time = self.server_local_time
    local server_time = server_local_time.hour * 60 + server_local_time.min
    return server_time >= daily.Time.Begin.union and server_time < daily.Time.End.union
end


function daily_man:IsTodayFitDateCondition(daily)     
    local date = daily.Date
    if (not date) or (not date[1]) then 
        return true 
    end    
    local t = self.server_local_time
    local time_offset = os.time(t) - TIME_OFFSET * 3600
    for _, v in ipairs(date) do        
        -- 根据时间范围判断
        if type(v) == 'table' then 
            local date_1 = self:TransformDate(v[1])
            local date_2 = self:TransformDate(v[2])
            if time_offset >= date_1 and time_offset <= date_2 + 60 * 60 * 24 then
                return true
            end
        end
    end
    return false
end


--当天周常判断规则
function daily_man:IsTodayFitWeekCondition(daily)    
    if (not daily.Week) then
        return true
    end

    local time_offset = self:GetTimeOffset(TIME_OFFSET)
    if type(daily.Week) == 'table' then
        for _, wday in pairs(daily.Week) do
            if wday == 0 or wday == time_offset.wday then 
                return true 
            end
        end
    elseif type(daily.Week) == 'number' then
        if daily.Week == 0 or daily.Week == time_offset.wday then 
            return true 
        end
    end
    return false
end


function daily_man:IsDailyComplete(daily)
	local count_cur, count_max = self:GetDailyCompleteCount(daily)
	return count_cur >= count_max
end


--任务内容处理，通过任务完成情况获取活动完成次数。
function daily_man:GetDailyCompleteCount(daily)
    local logic = daily.TaskLogic
    local count_cur,count_max
	if daily.Task or daily.Prestige then --如果添了计数用的任务或声望id，则以他们进行计数。
        local task = daily.Task or {}
        local pre = daily.Prestige or {}
        local count = 0
        local tbl= {}
        local tbl_task_org = {}
        local tbl_pres_org = {}
        if not (task or pre) then return 1 end
        for _,v in pairs(task) do
            local v1 = GameApi.GetTaskFinishedCount(v)
		    if type(v) == "table" then
                v1 = (GameApi.GetTaskFinishedCount(v[1]))%v[2]
		    end
            table.insert(tbl,#tbl+1,v1)
            table.insert(tbl_task_org, #tbl_task_org+1, v1)
	    end
        for _,v in pairs(pre) do
            local v2 = GameApi.GetHostRepuValue(v)
		    if type(v) == "table" then
                v2 = (GameApi.GetHostRepuValue(v[1]))%v[2]
		    end
		    table.insert(tbl,#tbl+1,v2)
            table.insert(tbl_pres_org, #tbl_pres_org+1, v2)
	    end
	    table.sort(tbl) --根据任务逻辑返回完成次数
	    if logic and logic == "and" then
		    count_cur = tbl[1]
	    elseif logic and logic == "cond" then
            if #tbl_task_org > 0 and #tbl_pres_org > 0 and #tbl_task_org == #tbl_pres_org then
                for i=1,#tbl_pres_org do
                    count_cur = (GameApi.GetHostRepuValue(daily.Prestige[i][1]) < daily.Prestige[i][2]) and GameApi.GetTaskFinishedCount(daily.Task[i]) or GameApi.GetTaskFinishedCount(daily.Task[i+1])
                end
            end
            count_cur = count_cur or 0
        else
		    count_cur = tbl[#tbl] or 0
	    end
        count_max = daily.TaskCount or "1"
    elseif daily.Platformid then
        local t_id = daily.Platformid
        local t_type = self:GetPlantformType(t_id)
        count_cur,count_max = team_platform.get_counter(t_type, t_id)
	else
		count_cur, count_max = 0, 1
    end
    return count_cur,count_max
end



--------------------------
-- 签到

-- 检查签到
function daily_man:check_for_sign()  
    return GameApi.CanDeliverTask(TASK_ID) and true or false
end

-- 响应签到
function daily_man:sign() 
    local canDeliver = GameApi.CanDeliverTask(TASK_ID)
    if canDeliver then 
        GameApi.MaunallyTrigTask(TASK_ID) 
    end
end



--------------------------
-- 活跃度相关

function daily_man:GetActiveValue() --获取活跃度
    local repu = GameApi.GetHostRepuValue(DailyData_ActiveValue.repu_id) --普通声望计活跃度
    return repu or 0
end


function daily_man:GetActiveStatus(num) --获取活跃度发奖的按钮状态
    local repu = self:GetActiveValue()
    local repu_full = (repu >= num.active_value)
    local award_sended = GameApi.IsTaskFinishSuccess(num.task_id)
    --返回活跃度是否满足和玩家是否已经领过奖励
    return repu_full, award_sended
end


function daily_man:SendActiveAward(num)--活跃度发奖
    local repu_full,award_sended = self:GetActiveStatus(num)
    if repu_full and not award_sended then --此处可能存在脚本把本不应该发的任务发出的情况。
        GameApi.MaunallyTrigTask(num.task_id)
    end
end




--------------------------
-- 活动补偿相关

-- 设置活动补偿相关数据
function daily_man:SetActivityBonus(last_do_times)
    if self.activity_last_do_times == nil then
        self.activity_last_do_times = {}
    end

    if last_do_times == nil or type(last_do_times) ~= "table" then
        for i,v_old in ipairs(self.activity_last_do_times) do
            table.remove(self.activity_last_do_times, i)
        end
        return
    end

    for i,v in ipairs(last_do_times) do
        activity_mul_powers = self:GetActivityBonusMulPowers(v)
        if activity_mul_powers ~= nil and type(activity_mul_powers) == "table" then
            local last_do_time = nil
            for _,v_old in ipairs(self.activity_last_do_times) do
                if v_old.activity_id == v.activity_id and v_old.activity_type == v.activity_type then
                    last_do_time = v_old
                    last_do_time.last_time = v.last_time
                    last_do_time.mul_powers = activity_mul_powers
                    break
                end
            end
            if not last_do_time then
                last_do_time = { activity_id = v.activity_id, activity_type = v.activity_type, last_time = v.last_time, mul_powers = activity_mul_powers }
                table.insert(self.activity_last_do_times, last_do_time)
            end
        end
    end
end


-- 获取活动补偿倍率序列
function daily_man:GetActivityBonusMulPowers(last_do_time)
    if Activity_Bonus == nil or last_do_time == nil or type(last_do_time) ~= "table" then
        return
    end

    for k,v in pairs(Activity_Bonus) do
        if k > 0 and v.activity_id == last_do_time.activity_id and v.activity_type == last_do_time.activity_type then
            return v.mul_powers
        end
    end
end


-- 判断是否是同一组活动补偿
function daily_man:IsSameGroupActivityBonus(id1, id2)
    local bSame = false

    if id1 and type(id1) == "number" and id2 and type(id2) == "number" then
        if id1 == id2 then
            bSame = true
        else
            for k,v in pairs(Activity_Bonus) do
                if k > 0 and v.activity_id == id1 and v.activity_group then
                    for k1, v1 in ipairs(v.activity_group) do
                        if v1 == id2 then
                            bSame = true
                            break
                        end
                    end
                end
                if bSame then
                    break
                end
            end
        end
    end

    return bSame
end


-- 计算活动补偿
function daily_man:CalcActivityBonus(daily)
    local retT, retBonus, retName = 0, 0, ""
    if daily == nil or type(daily) ~= "table" or daily.Platformid == nil then
        return retT, retBonus, retName
    end

    if self.activity_last_do_times == nil or type(self.activity_last_do_times) ~= "table" then
        return retT, retBonus, retName
    end

    local data_tab = {}
    for k, v in ipairs(self.activity_last_do_times) do
        if v.last_time > 0 and v.activity_type == 0 and self:IsSameGroupActivityBonus(v.activity_id, daily.Platformid) then
            local reset_time = team_platform.get_daily_counter_max_reset_time(team_platform.CATEGORY_DUNGEON, v.activity_id)
            ---取接副本当天的重置时间
            local str_last_time = os.date("%m/%d/%Y", v.last_time)
            local str_reset_time = os.date("%X", reset_time)
            local str_origin_time = os.date("%X", 0)
            data_tab.year    = tonumber(str_last_time:sub(7,10))
            data_tab.month   = tonumber(str_last_time:sub(1,2))
            data_tab.day     = tonumber(str_last_time:sub(4,5))
            data_tab.hour    = tonumber(str_reset_time:sub(1,2)) - tonumber(str_origin_time:sub(1,2))
            data_tab.min     = tonumber(str_reset_time:sub(4,5)) - tonumber(str_origin_time:sub(4,5))
            local temp_temp = os.time(data_tab)
            local server_time = os.time(self.server_local_time)
            while temp_temp <= server_time and retT < 4 do
                if temp_temp >= v.last_time then
                    retT = retT + 1
                end
                temp_temp = temp_temp + 86400
            end
            retBonus = v.mul_powers[retT-1] or 0
            retName = daily.Name
        end
    end
    return retT, retBonus, retName
end
    

-- 计算活动补偿
function daily_man:GetActivityBonus(dungeon_id)
    local retT, retBonus, retName = 0, 0, ""
    if not dungeon_id or type(dungeon_id) ~= "number" then
        return retBonus
    end

    local dailys = DailyData
    for _, daily in pairs(dailys) do
        if daily.Platformid and daily.Platformid == dungeon_id then
            retT, retBonus, retName = self:CalcActivityBonus(daily)
        end
    end
    return retBonus
end




	
--------------------------
-- 个人竞技场

function daily_man:IsArenaOpen()   
    local arena_daily = DailyData and DailyData[ARENA_DAILY_ID] or nil
    if arena_daily then
        local range = self:GetActiveTimeRange(arena_daily)
        if range then
            return true
        end
    end      
    return false
end


function daily_man:GetArenaRequestTimeRange()
    local arena_daily = DailyData and DailyData[ARENA_DAILY_ID] or nil
    if arena_daily then
        local range = self:GetActiveTimeRange(arena_daily)
        if range then
            local first_stamp = self:TransformTime(range.Begin.str)
            local last_stamp  = self:TransformTime(range.End.str)
            return first_stamp + 300, last_stamp + 400
        end
    end
end


function daily_man:GetArenaName()
    local arena_name = nil
    local arena_daily = DailyData and DailyData[ARENA_DAILY_ID] or nil
    if arena_daily then
        arena_name = arena_daily.Name
    end
    return arena_name
end



--------------------------
-- 聊天活动列表

function daily_man:GetChatActivityList()
	local list = {}
	if not DailyData then 
        return list 
    end	
	local prop = GameApi.GetHostPropEx()    
	for id, daily in pairs(DailyData) do
        if daily.ShowInDaily ~= false and daily.Platformid and tonumber(daily.Platformid) ~= 0 then
            local lev_req  = daily.Level.CanSee <= prop.level and daily.Level.NotSee > prop.level
            local repu_req = self:IsRequReq(daily)
            local week_req = self:IsTodayFitWeekCondition(daily)
            local date_req = self:IsTodayFitDateCondition(daily)
            if lev_req and repu_req and week_req and date_req then
                list[daily.Name] = daily.Same_As ~= nil and daily.Same_As or id
            end       
        end        
	end
	return list
end




--------------------------
-- 时间相关函数

function daily_man:GetTimeCountDown(timestr)
    local to = self:TransformTime(timestr) --字符串转换为的时间
    local from = os.time(self.server_local_time) --服务器当前时间
    local sub = math.abs(from - to)
    return self:ConvertTimeToString(sub)
end


function daily_man:ConvertTimeToString(sub)
    if sub then
        if sub >= 3600 then
            local first = math.floor(sub/3600) --hour
            local secend = math.floor((sub - first * 3600)/60) --min
            return first .. STRING_TABLE.TEXT_HOUR .. secend .. STRING_TABLE.TEXT_MIN
        else
            local first = math.floor(sub/60) --min
            local secend = sub - first * 60 --secend
            return first .. STRING_TABLE.TEXT_MIN .. secend .. STRING_TABLE.TEXT_SEC
        end
    end
end


function daily_man:GetTimeOffset(t_off) --获取偏移的活动时间
    local t = self.server_local_time
    local t_cur = os.time(t)
    local t_off = t_cur - TIME_OFFSET * 3600
    return os.date('*t', t_off)
end


--获取今天是星期几
function daily_man:GetWeek()
    return self.server_local_time and self.server_local_time.week or nil
end


--辅助函数，将字符串转换为时间值
local transform_time = {}
function daily_man:TransformTime(timestr)
    if not timestr then 
        return 0 
    end

    local server_time = self.server_local_time
    transform_time.year  = server_time.year
    transform_time.month = server_time.month
    transform_time.day   = server_time.day
    transform_time.hour  = tonumber(timestr:sub(1,2))
    transform_time.min   = tonumber(timestr:sub(4,5))
    return os.time(transform_time)
end


--辅助函数，将字符串转换为日期值
local transform_date = {}
function daily_man:TransformDate(datestr)
    if not datestr then
        return 0
    end

    local server_time = self.server_local_time
    if string.len(datestr) == 10 then 
        transform_date.year  = tonumber(datestr:sub(1,4))
    else
        transform_date.year  = server_time.year
    end
    transform_date.month = tonumber(datestr:sub(-5, -4))
    transform_date.day   = tonumber(datestr:sub(-2, -1))
    transform_date.hour  = 0
    transform_date.min   = 0
    return os.time(transform_date)
end



--------------------------
-- 时间相关函数

local function format_time(time_str)
    if not time_str then
        return 
    end
    if time_str == '00:00' then 
        time_str = '24:00'
    end
    local _hour = tonumber(time_str:sub(1,2))
    local _min  = tonumber(time_str:sub(4,5))
    return {hour = _hour, min = _min, union = _hour * 60 + _min, str = time_str, }
end
-- 数据预处理
function daily_man:FormatDailyData()    
    for daily_id, daily in pairs(DailyData) do 
        -- id
        daily.id = daily_id
        -- 时间段
        if daily.TimeUnmerged then            
            for _, range in ipairs(daily.TimeUnmerged) do
                range.Begin = format_time(range.Begin)
                range.End   = format_time(range.End)
            end
            daily.TimeUnmerged.Begin = format_time(daily.TimeUnmerged.Begin)
            daily.TimeUnmerged.End   = format_time(daily.TimeUnmerged.End)
        end
    end
end


function daily_man:GetActiveTimeRange(daily)
    if not daily.TimeUnmerged then
        return
    end
    local server_local_time = self.server_local_time
    local server_time = server_local_time.hour * 60 + server_local_time.min
    if daily.Week_TimeUnmerged then
        local time_offset = self:GetTimeOffset(TIME_OFFSET)
        local week_day    = time_offset.wday
        local index_list  = daily.Week_TimeUnmerged[week_day]        
        for _, idx in ipairs(index_list or {}) do
            local range = daily.TimeUnmerged[idx]
            if range then                
                if range.Begin.union <= server_time and server_time <= range.End.union then
                   return range
                end
            end
        end    
    else
        if daily.TimeUnmerged.Begin and daily.TimeUnmerged.End then
            if daily.TimeUnmerged.Begin.union <= server_time and server_time <= daily.TimeUnmerged.End.union then
                return daily.TimeUnmerged
            end
        else
            for _, range in ipairs(daily.TimeUnmerged) do
                if range.Begin.union <= server_time and server_time <= range.End.union then
                    return range                    
                end
            end
        end
    end    
end


--如果一个活动有多个时间，显示最近的一个
function daily_man:GetShowTimeRange(daily) 
    if not daily.TimeUnmerged then
        return 
    end
    if daily.TimeUnmerged.Begin and daily.TimeUnmerged.End then
        return daily.TimeUnmerged
    end

    local server_local_time = self.server_local_time
    local server_time = server_local_time.hour * 60 + server_local_time.min
    if daily.Week_TimeUnmerged then
        local time_offset = self:GetTimeOffset(TIME_OFFSET)
        local week_day    = time_offset.wday
        local index_list = daily.Week_TimeUnmerged[week_day]        
        for _, idx in ipairs(index_list or {}) do
            local range = daily.TimeUnmerged[idx]
            if range then                
                if server_time <= range.End.union then
                   return range
                end
            end
        end    
    else
        for _, range in ipairs(daily.TimeUnmerged) do
            if server_time <= range.End.union then
                return range
            end
        end        
    end

    local idx = #daily.TimeUnmerged
    return daily.TimeUnmerged[idx]
end



--------------------------
-- 排序函数
sort_week_func = function(a, b)
    local a_week, b_week = 0, 0
    if type(a.Week) == 'number' then a_week = a.Week end
    if type(a.Week) == 'table' then a_week = a.Week[1] end
    if type(b.Week) == 'number' then b_week = b.Week end                                        
    if type(b.Week) == 'table' then b_week = b.Week[1] end
    if a_week ~= b_week then 
        return a_week < b_week
    else
        local a_pre = a.SoftPrecedence or 0
        local b_pre = b.SoftPrecedence or 0
        return a_pre > b_pre  
    end
end

sort_recommend_func = function(a, b)
    local a_pre = a.SoftPrecedence or 0
    local b_pre = b.SoftPrecedence or 0
    return a_pre > b_pre
end

sort_boss_func = function(a, b)
    local a_pre = a.Power or 0
    local b_pre = b.Power or 0
    return a_pre > b_pre  
end
