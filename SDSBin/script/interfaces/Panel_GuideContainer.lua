Panel_GuideContainer = ui.dialog.get("Panel_GuideContainer")
local Format = string.format
local dlg = Panel_GuideContainer
dlg.tick = true
local sub = dlg:get_obj("Sub_Guide")

-------------------------------------
--		overrides
-------------------------------------
function dlg:Init()
    self.typ	= nil    
    self.id		= nil
    self.panel	= nil
end


local counter = 0
function dlg:Tick(tick_time)
    counter = counter + tick_time
    if counter < 200 then
        return
    end
    counter = 0
    
    if not self.panel then
        return
    end
    if DlgApi.IsDialogShow(self.panel) then
        return 
    end
    self:show(false)
end


function dlg:HideDialog()
    self.typ	= nil    
    self.id		= nil
    self.panel	= nil   
end


-------------------------------------
--		panel message
-------------------------------------


-------------------------------------
--		function called by other
-------------------------------------
local sub_dialogs =
{
	[TYPE_GUIDE] 		= {	
								panel = "Panel_GuideMsg", 
								func = function(show_data) 
												return Panel_GuideMsg:SetHintInfo(show_data)
								   		end, 
						   },
	[TYPE_TITLE] 		= {	
								panel = "Panel_GuideNew", 
								func = function(show_data) 
												GameApi.ShowGuideNew(show_data.typ, show_data.id)
												help_man:remove_help_data(show_data.typ, show_data.id)
												return true
								   		end, 
						   },
	[TYPE_PHOTOBOOK] 	= {	
								panel = "Panel_GuideNew", 
								func = function(show_data) 
												GameApi.ShowGuideNew(show_data.typ, show_data.id)
												help_man:remove_help_data(show_data.typ, show_data.id)
												return true
								   		end, 
						   },
	[TYPE_ACHI] 		= {	
								panel = "Panel_GuideNew", 
								func = function(show_data) 
												GameApi.ShowGuideNew(show_data.typ, show_data.id)
												help_man:remove_help_data(show_data.typ, show_data.id)
												return true
								   		end, 
						   },
	[TYPE_ARMY_ACHI] 	= {	
								panel = "Panel_GuideNew", 
								func = function(show_data) 
												GameApi.ShowGuideNew(show_data.typ, show_data.id)
												help_man:remove_help_data(show_data.typ, show_data.id)
												return true
								   		end, 
						   },
	[TYPE_HELP] 		= {	
								panel = "Panel_HelpNew", 
								func = function(show_data) 
												GameApi.ShowHelpNew(show_data.typ, show_data.id)
												help_man:remove_help_data(show_data.typ, show_data.id)
												return true
								   		end, 
						   },
	[TYPE_FPS_WARNING] 	= {	
								panel = "Panel_MessageCheck", 
								func = function(show_data) 
												help_man:remove_help_data(show_data.typ, show_data.id)
												return true
								   		end, 
						   },
	[TYPE_GOT_FLOWER] 	= {	
								panel = "Panel_FlowerAnnal", 
								func = function(show_data) 
												help_man:remove_help_data(show_data.typ, show_data.id)
												return true
								   		end, 
						   },				   
}


function dlg:show_guide(show_data, pos)
    if self.typ == show_data.typ and self.id == show_data.id then
        self:show(false)
        return false
    end
    if not sub_dialogs[show_data.typ] then
        return false
    end
    local sub_dialog = sub_dialogs[show_data.typ]
    self.typ	= show_data.typ
    self.id 	= show_data.id        
    self.panel	= sub_dialog.panel
    
    -- 子窗口
    local prop = DlgApi.GetDialogProp(self.panel)
    self:set_size(prop.width, prop.height)
    sub:set_size(prop.width, prop.height)
    sub:SetDialogInSubDialogItem(self.panel)
    if not sub_dialog.func(show_data) then
        self:show(false)
        return false
    end        
    
    -- 位置
    if pos then
    	self:set_pos(0, 0, "Panel_GuideBar", AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_CENTER, AUIDIALOG_ALIGN_OUTSIDE, AUIDIALOG_ALIGN_TOP)
    	local prop = self:get_prop()
    	self:set_pos(pos.x - prop.width / 2, prop.y)
    else
        self:set_pos(0, 0, "", AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_CENTER, AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_CENTER)
    end
    return true
end


-------------------------------------
--		function called by self
-------------------------------------

