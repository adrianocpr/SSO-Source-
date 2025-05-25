Panel_Sign = ui.dialog.get("Panel_Sign")

local dlg = Panel_Sign
dlg.tick = true

local button_award = dlg:get_obj("Button_Award1")
local button_exam = dlg:get_obj("Button_Exam")

-------------------------------------
--		overrides
-------------------------------------
function dlg:Init()  --界面事件
    button_award:command(self.sign)
    button_exam:command(self.exam)
end

function dlg:ShowDialog()
	local prop = GameApi.GetHostProp()
	DlgApi.ShowItem(self.this,'Button_Exam',prop.level >= 35)
end

local counter = 0
function dlg:Tick(delay)
    counter = counter + delay
    if counter > 500 then
        counter = 0 
    	local check_sign = daily_man:check_for_sign()
    	button_award:enable(check_sign)
    	button_award:set_hint(check_sign and "" or STRING_TABLE.DAILY_PRAYED_INFO)
    end
end

function dlg:sign()
    daily_man:sign()
    DlgApi.ShowItem('Panel_Radar', 'gfx_daily', false)
    DlgApi.ShowItem('Panel_Radar', 'Button_Sign', false)
	DlgApi.ShowItem('Panel_Radar', 'gfx_sign', false)
	DlgApi.SetItemHint('Panel_Radar', 'Button_Daily', STRING_TABLE.DAILY_PRAYED_INFO)
    button_award:set_hint(STRING_TABLE.DAILY_PRAYED_INFO)
end

function dlg:exam()
    local isShow = DlgApi.IsDialogShow("Panel_GuideExam")
    DlgApi.ShowDialog("Panel_GuideExam",not isShow)
end
