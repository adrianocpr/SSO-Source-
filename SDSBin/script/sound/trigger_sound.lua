--任务/策略触发音乐对外接口

local FADE 			= true
local NO_FADE 		= false
local DlgTemplate 	= DlgTemplate
local GameApi 		= GameApi

trigger_sound = DlgTemplate:new()


function trigger_sound:Init()
    self:RegisterEventEx(LEVT_TASK_FINISH, 	self.OnFinishIdTask)
    self:RegisterEventEx(LEVT_TASK_ACCEPT, 	self.OnAcceptIdTask)   
    
    if not self.monster_data_init then
        self.monster_data_init	= true
    	self.monster_priority 	= {}
    	self.monster_sound_info	= {}
    	for i, cfg in ipairs(MonsterSoundCfg) do
    	    for _, tid in ipairs(cfg.tids or {}) do
    	        self.monster_priority[tid] 		= i
    			self.monster_sound_info[tid]	= cfg.id
    	    end    	    
    	end
    end
    self:StopInterBGM()
end


function trigger_sound:RegisterEventEx(event, handler)
    if event and handler and GameUI then
        GameUI:RegisterEvent(event, GameUI.SecretaryEventNotify)  --dlg事件也被注册给gameui
        self:RegisterEvent(event, handler)
    end
end


function trigger_sound:Release()
    self:StopInterBGM()
end



-------------------------------------
--		sound handle function
-------------------------------------
-- 接受任务触发
function trigger_sound:OnAcceptIdTask(event, taskId)
    local info = task_sound_list[taskId]
    if info and info.accept then
        self:PlaySound(info.accept)
    end
    return false
end


-- 副本完成
function trigger_sound:OnDungeonSuccess()
--   local guid =  AUTO_2D_SOUND.DUNGEON_SUCCESS
--   if guid then
--       GameApi.PlayInterBGM(guid)
--	   self.m_bgm_id = nil
--   end
end


-- 完成任务触发
function trigger_sound:OnFinishIdTask(event, taskId)
    local info = task_sound_list[taskId]
    if info then
        -- 停止接受任务插播的音乐
        if info.accept then
            local sound = trigger_sound_list[sound_id]
			if sound and sound.bBGM and GameApi.IsInterBGMPlaying(sound.key) then
			    GameApi.StopInterBGM()
			end
        end
        -- 完成任务播放音效
    	if info.finish then
        	self:PlaySound(info.finish)
    	end
    end
    return false
end


-- 策略触发
function trigger_sound:PlotCry(sound_id)
    local id = tonumber(sound_id)
    if id then			
        --对应音乐序列编号
    	self:PlaySound(id)
	end
end


-- 怪物战斗
function trigger_sound:monster_combat(list)
    if self.m_bgm_id and self.m_bgm_id ~= 0 then
        if not GameApi.IsNPCExistByTid(self.m_bgm_id) then
            GameApi.StopInterBGM()
            self.m_bgm_id = nil
        end
    end
    if not list or #list <= 0 then
        return
    end
    -- 如果当前插播音乐
    if GameApi.IsInterBGMPlaying() then
        return
    end
    
    -- 排序
    local priority = self.monster_priority
    local sort_list = {}
    for _, tid in ipairs(list) do
        if priority[tid] then
            table.insert(sort_list, tid)
        end
    end
    table.sort(sort_list, function(tid1, tid2) return priority[tid1] < priority[tid2] end)
    
    -- 播放
    local tid	= sort_list[1]
    local id	= self.monster_sound_info[tid]
    local sound	= trigger_sound_list[id]
    if sound and sound.bBGM then
        self:PlaySound(id)
    end
    self.m_bgm_id = tid
end




-------------------------------------
--		function called by self
-------------------------------------
function trigger_sound:StopInterBGM()
    self.m_bgm_id = nil
    GameApi.StopInterBGM()
end


function trigger_sound:PlaySound(sound_id)
    local sound = trigger_sound_list[sound_id]
	if sound then
	    if sound.bBGM then	        
	        GameApi.PlayInterBGM(sound.key)
	        self.m_bgm_id = nil
	    else
	        GameApi.Play2DSound(sound.key)
	    end
	end	
end