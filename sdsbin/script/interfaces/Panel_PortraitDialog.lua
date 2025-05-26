local DlgApi	= DlgApi
local GameApi	= GameApi
local DlgTemplate = DlgTemplate
local HelpData	= HelpData
local Format 	= string.format
local PANEL_DALAY     = 5000
Panel_PortraitDialog = DlgTemplate:new({this = "Panel_PortraitDialog"})


-------------------------------------
--		overrides
-------------------------------------
function Panel_PortraitDialog:Init()
    self:RegisterEvent("Button_Close",        self.OnCancel)
    --self:ResetData() 
end


function Panel_PortraitDialog:ShowDialog()
    self:Align()
end


function Panel_PortraitDialog:Tick(delaytime) --头像界面显示后计时，用于可能的多个对话文本的刷新和界面的自动关闭。
    self.panelTick = (self.panelTick or 0) + delaytime
    if (self.panelTick < self.panelDelay) or DlgApiEx.IsInAnimationUI(true) then
        return
    end
    self.panelTick = 0
    
    self.txtNum = self.txtNum + 1    
    local talk = self.data[self.txtNum]
    if talk and talk.txt then --如果存在下一个对话表则继续显示
		local aftertime = talk.afterTime or 0
 		ani.dialog.fade_out(self.this,{oncomplete = function() --对话切换效果
				set_timeout(function() 
						self:ShowPortraitDialog(talk)
					DlgApi.ShowDialog(self.this, true, false, false)
				end,aftertime)
    			end,
    			duration = 200,})
    		        	
    else --如果不存在下一个对话则第一次闪烁，第二次关闭。2011-11-10 20:41:23 xxp改为去掉闪烁
        --self.bClose = not self.bClose
        --DlgApi.FlashItem(self.this,"Edit_BG", self.bClose)    	
    	--if not self.bClose then --关闭界面后将
	    	DlgApi.ShowDialog(self.this, false)
    		self:ResetData()
		--end
    end
end


-------------------------------------
--		function called by others
-------------------------------------
function Panel_PortraitDialog:Align()
	DlgApi.SetDialogPosition(self.this, 0, 0, "Panel_QuickBar",
    	                     AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_LEFT, 
        	                 AUIDIALOG_ALIGN_OUTSIDE, AUIDIALOG_ALIGN_TOP )
end


function Panel_PortraitDialog:ResetData()   
    self.panelTick 	= nil
  	self.panelDelay = nil
   	self.txtNum 	= nil
   	self.data 		= nil
   	self.bClose		= nil
end



function Panel_PortraitDialog:PopupTaskEvent(event, taskId)    --此函数中判断event和list是否存在
    local list = 
        {
           [LEVT_TASK_ACCEPT]	= STRING_TABLE.DialogAcceptIdTask,
           [LEVT_TASK_FINISH] 	= STRING_TABLE.DialogFinishIdTask,
           [LEVT_STRATEGY] 	= STRING_TABLE.DialogStrategy,
        }
    local data = list[event] and list[event][taskId]
    if data then
        self.panelDelay = data.delay or PANEL_DALAY
   		self.txtNum 	= 1
    	self.data   	= data
    	self.panelTick 	= 0
    	self.bClose		= false
		self:ShowPortraitDialog(data[self.txtNum])    	
    end
end

                       
function Panel_PortraitDialog:ShowPortraitDialog(talk) --显示对话内容
    if not talk then
        return
    end
    DlgApi.ShowDialog(self.this, true, false, false)
    
    --设置内容和图片
    if talk.txt then
		local id_player = GameApi.GetHostProp().id
		local name_player = '^2462ff' .. GameApi.GetPlayerName(id_player) .. '^400000'
		local txt = Format(talk.txt,name_player)
    	DlgApi.SetItemText(self.this, "Text_PortraitDialog", txt)  
    end
    
    --名称
	if talk.name then
        local name = talk.name
	    if talk.name == "$PLAYER_NAME" then
	       	local prop = GameApi.GetHostProp()
			name = GameApi.GetPlayerName(prop.id)
	    end
    	DlgApi.SetItemText(self.this, "Label_Name", name)
    end
    
    --头像
    DlgApi.SetImageFile(self.this,"Image_PortraitDialog", '', 1) --清空
    if not talk.ShowPortrait then 
        if talk.img then
        	DlgApi.SetImageFile(self.this,"Image_PortraitDialog", talk.img, 1)
        else
            DlgApi.SetImageFile(self.this,"Image_PortraitDialog", ResourceConfig:GetPortraitDefault(), 1)
        end
    end
   	DlgApiEx.ShowQuestPortrait(talk.ShowPortrait)
   	
   	--表情
   	DlgApi.SetImageFile(self.this,"Image_PortraitFace", "", 1) --清空
   	if talk.face then
   	    DlgApi.SetImageFile(self.this,"Image_PortraitFace", talk.face, 1)
   	else
   	    DlgApi.SetImageFile(self.this,"Image_PortraitFace", "", 1)
   	end
    
    --反转图片和内容位置
    local scale = DlgApi.GetWindowScale()
    if talk.reverse then 
	    self:Reverse(true)
	else
	    self:Reverse(false)
    end         
end  

function Panel_PortraitDialog:Reverse(bReverse) --反转整个界面
    
    local function reverse(panel,item)  --反转单个控件
    	local dlg = DlgApi.GetDialogProp(panel)   
    	local itm = DlgApi.GetItemRect(panel,item,true)
		local x = dlg.width - itm.x - itm.width
		DlgApi.SetItemPos(panel,item,x,itm.y)
		--DlgApi.SetItemPos("Panel_PortraitDialog","Image_PortraitFace",1,1)
	end
	
    if not (bReverse or false) == (self.bReverse or false) then
        reverse(self.this,"Image_PortraitFace")
        reverse(self.this,"Label_Name")
        reverse(self.this,"Image_PortraitDialog")
        reverse(self.this,"Text_PortraitDialog")
        self.bReverse = bReverse
    end
    
end
    	
         
    
    
	    
        
