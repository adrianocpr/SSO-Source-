--本脚本与task_list.lua共用一个环境，可以调用任何任务脚本接口
--TaskCApi.SetDungeonEntranceStatus(high32, low32)             --设置副本状态字。

--一些重要约定
--限制副本进入次数的任务，非程序调用，[副本模板id]={进入任务id,分配起始位，位数长度，每日准入次数}
local DungeonLimitHigh32TaskList = {
  [13093] = {6858,0,2,100},	--道标要塞，副本模板id 13093，进入任务id 6858
  [13085] = {6856,2,2,100},	--帝王谷，副本模板id 13085，进入任务id 6856
  [13086] = {6860,4,2,100},	--灯塔，副本模板id 13086，进入任务id 6860
  [13090] = {6866,6,2,100},	--神之试炼，副本模板id 13090，进入任务id 6866
}
local DungeonLimitLow32TaskList = {
}
--判断任务是否是关注类别的结果，非程序调用
local eCheckResult = {
  None,
  High32,
  Low32,
}

DungeonEntrance = 
{
	--判断副本模板id是否合法, 为策划内部使用
	CheckLegalDungeon = function(checkDungeonID)
		local result = eCheckResult.None
		for dungeonID,_ in pairs(DungeonLimitHigh32TaskList) do
		    if dungeonID == checkDungeonID then
		        result = eCheckResult.High32 
		    end
		end
		
		for dungeonID,_ in pairs(DungeonLimitLow32TaskList) do
    		if dungeonID == checkDungeonID then
    		    result = eCheckResult.Low32 
    		   end
  		end
  		
  		return result
  	end
  	,
	--判断任务id是否是副本关注完成次数的任务, 为策划内部使用
	CheckLegalTask = function(checkTaskID)
		local result = eCheckResult.None
		for _,limit in pairs(DungeonLimitHigh32TaskList) do
		    local limitTaskID = limit[1]
		    if limitTaskID == checkTaskID then
		        result = eCheckResult.High32 
		    end
		end
		
		for _,limit in pairs(DungeonLimitLow32TaskList) do
    			local limitTaskID = limit[1]
    			if limitTaskID == checkTaskID then
    		    		legal = eCheckResult.Low32 
    			end
  		end
  		
  		return result
  	end
  	,
  	--重写状态字，非程序调用的接口，为策划内部使用
  	RebuildStatus = function()
  		local high32table = {}
  		local low32table = {}
  		--处理可能的越界
  		for _,limit in pairs(DungeonLimitHigh32TaskList) do
			local taskID = limit[1]
    		local startBit = limit[2]
    		local lenBit = limit[3]
    		local taskCompleteTimes = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(taskID)
    		if taskCompleteTimes >= 2^lenBit - 1 then
    			taskCompleteTimes = 2^lenBit - 1 
    		end
    		  
    		table.insert(high32table,{taskCompleteTimes, lenBit})
  		end
  		
  		for _,limit in pairs(DungeonLimitLow32TaskList) do
    		local taskID = limit[1]
    		local startBit = limit[2]
    		local lenBit = limit[3]
    		local taskCompleteTimes = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(taskID)
    		if taskCompleteTimes >= 2^lenBit - 1 then
    			taskCompleteTimes = 2^lenBit - 1 
    		end
    		
    		table.insert(low32table,{taskCompleteTimes, lenBit})
  		end
  		
  		--拼接2个32位number
  		local high32 = 0
  		local low32 = 0
  		for i,var in pairs(high32table) do
    		local taskCompleteTimes = var[1]
    		local startBit = var[2]
    		high32 = high32 + taskCompleteTimes * 2^startBit
  		end
  		
  		for i,var in pairs(low32table) do
    		local taskCompleteTimes = var[1]
    		local startBit = var[2]
    		low32 = low32 + taskCompleteTimes * 2^startBit
  		end
  
  		--写入状态字
  		TaskCApi.SetDungeonEntranceStatus(high32, low32)  --新接口
  	end
  	,
  	
	--程序接口：角色上线时初始化状态字
	OnInitStatus = function(Self)
		Self.RebuildStatus()
	end
	,
	
	--程序接口：更新状态字
	OnUpdateStatus = function(Self, updateTaskID)
		local result = Self.CheckLegalTask(updateTaskID)
		if result ~= eCheckResult.None then
		    return Self.RebuildStatus()
		end
	end
	,
	
	--程序接口：检查DungeonStatus，看是否满足状态字条件
	OnCheckDungeonStatus = function(Self, high32, low32, dungeonID)
		local meetStatusCondition = false
		--先验证是否合法的副本模板ID
		local result = Self.CheckLegalDungeon(dungeonID)
		--去高截低，判断次数是否满足条件
		if result == eCheckResult.High32 then
		    local startBit = DungeonLimitHigh32TaskList[dungeonID][2]
		    local endBit = DungeonLimitHigh32TaskList[dungeonID][3] + startBit
		    local times = math.floor( high32 % 2^endBit / 2^startBit )
		    if times < DungeonLimitHigh32TaskList[dungeonID][4] then
		        meetStatusCondition = true
		    end		
		elseif result == eCheckResult.Low32 then
    		local startBit = DungeonLimitLow32TaskList[dungeonID][2]
    		local endBit = DungeonLimitLow32TaskList[dungeonID][3] + startBit
    		local times = math.floor( low32 % 2^endBit / 2^startBit )
    		if times < DungeonLimitLow32TaskList[dungeonID][4] then
      			meetStatusCondition = true
    		end
    	end	
    	
    	return meetStatusCondition	
	end    
}
  