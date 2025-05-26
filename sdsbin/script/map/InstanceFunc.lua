---------------------------------------------------------------
--  场景相关处理函数
-- idx, 标示场景存储的位, 范围[0， 79]
--		如果两个场景配置一个idx,进入一个场景之后,另一场景也认为进入
-- help，帮助任务id
local InstAnimationConfig = 
{
   -- [1] = {idx = 0},
   -- [50] = {idx = 1, help = 1054,}, --死亡皇后岛开场指引
   -- [7] = {idx = 7, help = 8866,}, --庐山开场指引
   [50] = {idx = 0},
   [41] = {idx = 1},
   [42] = {idx = 2},
   [43] = {idx = 3},
   [44] = {idx = 4},
   [45] = {idx = 5},
   [1] = {idx = 6},
   [401] = {idx = 7},--女神近卫军
   [406] = {idx = 8},--十二宫危机
   [402] = {idx = 9},--圣战回忆
   [2] = {idx = 10}, --圣域
   [4] = {idx = 11}, --银河竞技场
   [3] = {idx = 12}, --庐山
   [5] = {idx = 13}, --遗忘之路
   [6] = {idx = 14}, --死亡皇后岛
   [7] = {idx = 15}, --东西伯利亚
   [8] = {idx = 16}, --亚特兰蒂斯
   [9] = {idx = 17}, --仙女岛
   [10] = {idx = 18}, --哈迪斯城
}
local INVALID_PRECINCT	= -1


local InstForbidStuckedTel = 
{
	[504] = {},
	[505] = {},
	[602] = {},
}




InstanceFunc = 
{
	cur_inst_id = nil
}


-- 是否第一次进入场景, 根据任务判断, 任务配置在Instance.lua中
function InstanceFunc:GetInstIdx(instId)
    if InstAnimationConfig[instId] then
        return InstAnimationConfig[instId].idx
    end
end


function InstanceFunc:GetCurInstId()
    return self.cur_inst_id
end


-- 通知更换场景
function InstanceFunc:ChangeWorldInstance(instId, bFirstEnterInst)
    -- 场景id
    self.cur_inst_id = instId
    -- 副本指引
    self:UpdateRaidGuide(instId)
    -- 军团跨服PK赛
    do
        if DlgApiEx.IsDialogLoad("Panel_Radar") and Panel_Radar then
            Panel_Radar:UpdateLeaguePK()
        end
        if PKFunc:IsInTeamPKMap(self.cur_inst_id) then
            GameApi.UpdateLeaguePKBCStateInfo()
        else
            local inst_data = Instance[self.cur_inst_id]
            if inst_data and inst_data.iInstType == INST_TYPE_WORLD then
                GameApi.UpdateLeaguePKBCStateInfo()
            end
        end
    end
    -- 锄花任务
    local award_panel = "Panel_WeedingAward"
    local pray_panel = "Panel_Pray"
    local inst = Instance[instId]
    if inst and inst.weeding_award then
        if DlgApiEx.LoadGameDialog(award_panel) then --挂花任务数据统计
            DlgApi.ShowDialog(award_panel,true)
        end
        if DlgApiEx.LoadGameDialog(pray_panel) then --显示沐浴荣光界面
            DlgApi.ShowDialog(pray_panel,true)
        end
    else
        if DlgApiEx.IsDialogLoad(award_panel) then
            if DlgApi.IsDialogShow(award_panel) then
                DlgApi.ShowDialog(award_panel, false)
            end
        end
    end    

    local play_chain = animation:get_play_chain_on_change_instance(instId, bFirstEnterInst)
    play_chain = play_chain or chain:new{}
    
    if bFirstEnterInst then
        local help  = InstAnimationConfig[instId].help
        if help then
            local func = function() Panel_HelpSecretary:ShowHelpData(HelpFirstAcceptIdTask[help]) end
            play_chain:add(func)
        end
        
        play_chain:add(function()
            -- 第一次进入场景 界面动态指导
            HelpUIDynDir_Func:OnChangeInstance(instId)
        end)
    end

    if #play_chain > 0 then
        animation:commit_play_chain(play_chain)
    end
end


local REGION_NONE		= -1
local REGION_PK			= 0
local REGION_SANCTUARY	= 1
local REGION_PK_FREE	= 2
function InstanceFunc:ChangeRegion(last_region, cur_region, bFirst)
    if last_region == cur_region then
        return
    end
    if bFirst then
        if cur_region == REGION_SANCTUARY then
            return STRING_TABLE.FIRST_TO_SANCTUARY
        elseif cur_region == REGION_PK_FREE then
            return STRING_TABLE.FIRST_TO_PKFREE
        end
        return
    end
    
    -- 离开安全区
    if last_region == REGION_SANCTUARY then
        if cur_region == REGION_PK then
            return STRING_TABLE.SANCTUARY_TO_PK
        elseif cur_region == REGION_PK_FREE then
            return STRING_TABLE.SANCTUARY_TO_PKFREE
        end
        return
    end
    -- 离开PK无惩罚区
    if last_region == REGION_PK_FREE then
        if cur_region == REGION_PK then
            return STRING_TABLE.PKFREE_TO_PK
        elseif cur_region == REGION_SANCTUARY then
            return STRING_TABLE.PKFREE_TO_SANCTUARY
        end
        return
    end
    -- 离开PK区
    if last_region == REGION_PK then
        if cur_region == REGION_PK_FREE then
            return STRING_TABLE.PK_TO_PKFREE
        elseif cur_region == REGION_SANCTUARY then
            return STRING_TABLE.PK_TO_SANCTUARY
        end
        return
    end
end


local raid_panel = "Panel_RaidHint"
function InstanceFunc:UpdateRaidGuide(instId) --星辰守护相关
    local raid_hint = DialogRaidHint[self.cur_inst_id]
    if raid_hint then
    	if DlgApiEx.LoadGameDialog(raid_panel) then
    		Panel_RaidHint:RefreshHint()	
    	end
    else
        if DlgApiEx.IsDialogLoad(raid_panel) and DlgApi.IsDialogShow(raid_panel) then
            Panel_RaidHint:renew()
        end
    end

    if DialogRaidHint.StarGuard[instId] then
		if DlgApiEx.LoadGameDialog("Panel_StarGuard") then
			Panel_StarGuard:RefreshHint()	
		end
    else
		if DlgApiEx.IsDialogLoad("Panel_StarGuard") then
			DlgApi.ShowDialog("Panel_StarGuard", false)	
		end
    end
end


function InstanceFunc:GetInstanceNpcList(instId, precinctId)
    for _, v in pairs(NpcList) do
        if v.instance == instId then
            local list = {}
            for _, mark in ipairs(v.list) do
                table.insert(list, mark)
            end
            for _, mark in ipairs(v[precinctId] or {}) do
                table.insert(list, mark)
            end
            return list
        end
    end    
end


function InstanceFunc:GetTeleportInfo(instId, x, y)
    for _, teleport in pairs(TeleportDir) do 
        if teleport.PrecinctId ~= INVALID_PRECINCT and teleport.InstId == instId then
            local inst = Instance[instId]
            if inst and inst[teleport.PrecinctId] and inst[teleport.PrecinctId].rectMap then
                local rect = inst[teleport.PrecinctId].rectMap
                if x >= rect[1] and x <= rect[3] and y >= rect[4] and y <= rect[2] then
                    return teleport.PrecinctId
                end
            end                
        end 
    end
    return INVALID_PRECINCT
end


function InstanceFunc:IsInstForbidStuckedTel(instId)
    if InstForbidStuckedTel[instId] ~= nil then
        return true
    end
    return false
end    
