local DlgApi	= DlgApi
local GameApi	= GameApi
local DlgTemplate = DlgTemplate
local Format 	= string.format
Panel_NPCContentTips = DlgTemplate:new({this = "Panel_NPCContentTips"})

function Panel_NPCContentTips:PopupText(event, id)
    local list = 
        {
           [LEVT_TASK_ACCEPT]	= STRING_TABLE.NpcAcceptIdTask,
           [LEVT_TASK_FINISH] 	= STRING_TABLE.NpcFinishIdTask,
           [LEVT_STRATEGY] 	= STRING_TABLE.DialogStrategy,
        }
    local data = id and list[event] and list[event][id] and list[event][id]
    self.delay = data.delay
    if data then
        local txt = Format(data[1].txt,GameApi.GetHostRepuValue(data[1].repu)) 
    	DlgApi.SetItemText("Panel_NPCContentTips","Text_Content",txt)
    	DlgApi.SetItemText("Panel_NpcTips","Label_Title",data[1].name)
    	DlgApi.ShowItem("Panel_NpcTips","Button_1",false)
    	DlgApi.ShowItem("Panel_NpcTips","Button_2",false)
    	DlgApi.ShowItem("Panel_NpcTips","Button_Back",false)
    	DlgApi.ShowDialog("Panel_NpcTips",true)
    end
end

function Panel_NPCContentTips:Tick(ticktime) --根据
    local delay = self.delay or 3000
    self.showtime = self.showtime + ticktime
    if self.showtime>=delay then
        DlgApi.FlashItem("Panel_NpcTips","Edit_BG",true)
    end
    if self.showtime >= delay + 3000 then
        DlgApi.ShowDialog("Panel_NpcTips",false)
        DlgApi.FlashItem("Panel_NpcTips","Edit_BG",false)
    end
end
function Panel_NPCContentTips:HideDialog()
    self.showtime = 0
end