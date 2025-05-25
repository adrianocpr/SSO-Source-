local DlgApi		= DlgApi
local GameApi		= GameApi
local DlgTemplate 	= DlgTemplate
local Format 	  	= string.format
Panel_RaidHint = DlgTemplate:new({this = "Panel_RaidHint"})


-------------------------------------
--		overrides
-------------------------------------
function Panel_RaidHint:ShowDialog()
	DlgApiEx.InsertDialogAfter(self.this, "")
end


local count = 0
function Panel_RaidHint:Tick(delay)
	count = count + delay
	if count < 1000 then
	    return
	end
	
	count = 0
	self:RefreshHint()	
end



-------------------------------------
--		function called by self
-------------------------------------
local last_step = nil
function Panel_RaidHint:RefreshHint()
    local cur_inst	= InstanceFunc:GetCurInstId()  --当前场景
    local raid_hint = DialogRaidHint[cur_inst]
    if not raid_hint then
        return 
    end
    
    local raid_setp	= self:GetArgsVar(raid_hint.CurArgs or 0)  --当前阶段        
    local data = raid_hint[raid_setp]
	if data then
	    local txt = Format(data[1], unpack(self:GetCurArgs(data)))
	    DlgApi.SetItemText(self.this,'Text_Hint',txt)
	    DlgApi.SetItemText(self.this,'Label_Title',raid_hint.HintTitle)		
	end
	
	if last_step ~= raid_setp or (not data) then
	    last_step = raid_setp
	    self:renew(data, id)
	end
end


function Panel_RaidHint:renew(data,id)
	if data then
	    ani.dialog.fade_in(self.this, {duration = 600,})
		if DlgApi.IsDialogShow('Panel_QuestTrace') then
 			--ani.dialog.fade_out('Panel_QuestTrace',{duration = 600,})
		end
	else
	    if DlgApi.IsDialogShow(self.this) then
			ani.dialog.fade_out(self.this,{duration = 600,})
		end
		if not DlgApi.IsDialogShow('Panel_QuestTrace') then
			ani.dialog.fade_in('Panel_QuestTrace',{duration = 600,} )
		end
	end
end


function Panel_RaidHint:GetCurArgs(data)
    local args = {}
    for i = 2, #data do
        args[#args + 1] = self:GetArgsVar(data[i]) or 0
    end
    return args
end


function Panel_RaidHint:GetArgsVar(id)
    local var
	if type(id) == 'number' then
        var = GameApi.GetInstanceVar(id)
    end
    if type(id) == 'string' then
	    if id:find('repu') then
            local _, _, id = id:find("(%d+)")	    
            var = GameApi.GetLeagueReputation(tonumber(id))
	    end
        if id:find('npc') then
            local _, _, id = id:find("(%d+)")	    
            var = DlgApiEx.GetRouteLinkText(tonumber(id))
        end
    end
	return var or 0
end
