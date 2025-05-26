local DlgApi		= DlgApi
local GameApi		= GameApi
local DlgTemplate 	= DlgTemplate
local Format 	  	= string.format
Panel_Radar = DlgTemplate:new({this = "Panel_Radar"})


-------------------------------------
--		overrides
-------------------------------------
function Panel_Radar:Init()
    self:RegisterEvent('Button_DailyTips1', self.OpenDailyList)
    self:RegisterEvent('Button_DailyTips2', self.OpenDailyList)
    self:RegisterEvent('Button_Daily', 		self.OpenDailyList)
    self:RegisterEvent('Button_Activity', 		self.OpenActivivyIntro)
    self:RegisterEvent('Check_RadarConstr', self.ToggleControl)
    self:RegisterEvent('Button_Sign', 		self.Sign)
    self:RegisterEvent('Button_GuideStage', self.GuideStage)
    self:RegisterEvent('Button_exam', 		self.Exam)
    self:RegisterEvent('Button_QuestRmb', 	self.BenefitQuest)
    self:RegisterEvent('Button_Radio', 	    self.OpenBroadcast)
    self:RegisterEvent('Button_LeaguePK',   self.LeaguePK)
    self:RegisterEvent('Button_Time',   	self.PopUpAgeBoss)
    --self:RegisterEvent('Button_VIP', 	self.vip)
    
    DlgApi.SetItemHint(self.this,"Button_LeisureArena", STRING_TABLE.LEISURE_ARENA_BUTTON_HINT)
    DlgApi.SetItemHint(self.this,"Button_Leisure",		STRING_TABLE.LEISURE_TOP_BUTTON_HINT)
    
    self.delaytime = 0
    self.RadioTime = {  --电台热播提示时间
                        {hour = 19, min = 0, sec = 0, last = 120},
                        {hour = 19, min = 10, sec = 0, last = 120},
                        {hour = 19, min = 20, sec = 0, last = 120},
                        {hour = 19, min = 30, sec = 0, last = 120},
                        {hour = 19, min = 40, sec = 0, last = 120},
                        {hour = 19, min = 50, sec = 0, last = 120},
                    }

end


function Panel_Radar:ShowDialog()
    self:hideDailyItem()
    self:UpdateLeaguePK()
    self:UpdateDailyButton()
    --self:ToggleSign()
end


local counter = 0
function Panel_Radar:Tick(delay)
    counter = counter + delay
    if counter > 2000 then
        counter = 0
		self:UpdateBenefitQuestButton()
		self:UpdateDailyButton()
    end

    self.delaytime = self.delaytime + delay
    if self.delaytime < 60000 then
        return
    end
    self.delaytime = 0
    self:RefreshGuideStage()    
end



-------------------------------------
--		panel message
-------------------------------------
function Panel_Radar:vip()
    local bShow = DlgApi.IsDialogShow('Panel_Vip')
	DlgApi.ShowDialog('Panel_Vip', not bShow)
end

function Panel_Radar:Exam()
    local bShow = DlgApi.IsDialogShow('Panel_GuideExam')
	DlgApi.ShowDialog('Panel_GuideExam', not bShow)
	help_man:TryToWalkCurrDirection(self.this,"Button_exam")
end

function Panel_Radar:BenefitQuest()
    GameUI:OnJumpInterface(55)
end

function Panel_Radar:OpenBroadcast()
    local bShow = DlgApi.IsDialogShow('Panel_Radio')
	DlgApi.ShowDialog('Panel_Radio', not bShow)
end

function Panel_Radar:OpenActivivyIntro()
    local bShow = DlgApi.IsDialogShow('Panel_ActivityIntroduce')
	DlgApi.ShowDialog('Panel_ActivityIntroduce', not bShow)
end

function Panel_Radar:PopUpAgeBoss()
    local bShow = GameApi.PopupDailyInterface("Panel_Time")
	return not bShow
end

function Panel_Radar:LeaguePK()
	local bInServerBattle = GameApi.IsInServerBattle()
	local dlg_name = bInServerBattle and 'Panel_ServerWarPK' or 'Panel_TeamPK2'
    local bShow = DlgApi.IsDialogShow(dlg_name)
    DlgApi.ShowDialog(dlg_name, not bShow)
end

function Panel_Radar:Sign()
	DlgApi.ShowDialog("Panel_Sign", not DlgApi.IsDialogShow("Panel_Sign"))
end

function Panel_Radar:OpenDailyList(Item)
	DlgApi.ShowDialog('Panel_First',not DlgApi.IsDialogShow('Panel_First'))	
	help_man:TryToWalkCurrDirection(self.this,"Button_Daily")
end

function Panel_Radar:GuideStage(Item)
	help_man:TryToWalkCurrDirection(self.this,"Button_GuideStage")	
end


-------------------------------------
--		function called by self
-------------------------------------
function Panel_Radar:UpdateBenefitQuestButton()
	local prop = GameApi.GetHostProp()
	DlgApi.ShowItem(self.this,'Button_QuestRmb', prop.level >= 59)
end


-------------------------------------
--		function called by others
-------------------------------------
function Panel_Radar:UpdateLeaguePK()
    local inst_id = InstanceFunc:GetCurInstId()
    local is_pk_inst = inst_id and PKFunc:IsInTeamPKMap(inst_id) or false
    local bInServerBattle = GameApi.IsInServerBattle()
    local is_pk_all_inst = inst_id and PKFunc:IsInTeamPKAllMap(inst_id) or false
    DlgApi.ShowItem(self.this, "Button_LeaguePK", is_pk_inst or bInServerBattle or false)
    DlgApi.ShowItem(self.this, "Button_CrossServer", is_pk_all_inst or false)
end

function Panel_Radar:UpdateDailyButton()
local prop = GameApi.GetHostProp()
	DlgApi.ShowItem(self.this,'Button_Daily', prop.level >= 12)
end 


--根据任务id决定按钮是否显示 gameui.lua调用
function Panel_Radar:ToggleSign()  
    DlgApi.ShowItem(self.this, 'gfx_daily', daily_man:check_for_sign())
end


function Panel_Radar:RefreshGuideStage()
    local bCheck = DlgApi.IsItemChecked(self.this, "Check_RadarConstr")
    local prop = GameApi.GetHostProp()
    DlgApi.ShowItem(self.this, "Button_GuideStage", prop.level >= 25 and (not bCheck))
    DlgApi.ShowItem(self.this, "Button_exam", prop.level >= 35 and (not bCheck)) 
    --判断时间
    local server_local_time = GlobalApi.GetServerLocalTime()
    local server_time = server_local_time.hour * 60 * 60 + server_local_time.min * 60 + server_local_time.sec
    for _,t in ipairs(self.RadioTime) do
        local t_time = t.hour * 60 * 60 + t.min * 60 + t.sec
        if server_time > t_time and server_time < (t_time + t.last) then
            self:ShowRadioGfx(true)
            return
        end
    end
    self:ShowRadioGfx(false)
end


function Panel_Radar:HintLineBreak(txt)
    local pos = txt:find('\r')
    if not pos then
        for i = 60,txt:len(),60 do
            txt = txt:gsub(txt:sub(1,i),txt:sub(1,i+(i/60-1)*2) .. '\r')
        end
    end
    return txt
end


function Panel_Radar:hideDailyItem()
    DlgApi.ShowItem(self.this,"Button_DailyTips1",false)
    DlgApi.ShowItem(self.this,"Image_Daily1",false)
    DlgApi.ShowItem(self.this,"Button_DailyTips2",false)
    DlgApi.ShowItem(self.this,"Image_Daily2",false)
end


function Panel_Radar:ToggleControl()
    -- 默认根据是否check显隐
    local bCheck = DlgApi.IsItemChecked(self.this, "Check_RadarConstr")
    local list = DlgApiEx.GetDialogAllItemsName("Panel_Radar") 
    for _, name in ipairs(list) do
        DlgApi.ShowItem(self.this, name, not bCheck)
    end      
    
    -- toggle后仍然要显示的
    DlgApi.ShowItem(self.this,"Label_RadarMapName",true)
    DlgApi.ShowItem(self.this,"Check_RadarConstr",true)
    DlgApi.ShowItem(self.this,"Combo_line",true)
   
    -- toggle后仍然要隐藏的
    DlgApi.ShowItem(self.this,"Image_SampleDis",false)
    DlgApi.ShowItem(self.this,"Image_Sample",false)
    DlgApi.ShowItem(self.this,"Image_Quest",false)
    DlgApi.ShowItem(self.this,"gfx_daily",false)
    DlgApi.ShowItem(self.this,"gfx_Radio",false)
    self:hideDailyItem()
    
    self:RefreshGuideStage() 
end
   
function Panel_Radar:ShowRadioGfx(bShow)   --电台提示
    local bButtonShow = DlgApi.IsItemShow(self.this,'Button_Radio')
	DlgApi.ShowItem(self.this,'gfx_Radio', bShow and bButtonShow) --显示特效
    if bShow and bButtonShow then --显示文字说明
        if DlgApiEx.LoadGameDialog("Panel_HelpSecretary") then
            Panel_HelpSecretary:PopupHelpSecretary(HELP_RADIO)
        end
    else
        DlgApi.ShowDialog("Panel_HelpSecretary",false)
    end
end
