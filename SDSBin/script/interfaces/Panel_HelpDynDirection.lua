local DlgApi	= DlgApi
local GameApi	= GameApi
local DlgTemplate = DlgTemplate
local HelpData	= HelpData
local Format 	= string.format
Panel_HelpDynDirection = DlgTemplate:new({this = "Panel_HelpDynDirection"})
local PANEL_LINES = 3  --指引内容少于3行不显示滚动条。
local PANEL_DEF_MAX_SHOW_TIME = 60000
local PANEL_DEF_MIN_SHOW_TIME = 2000

-------------------------------------
--		overrides
-------------------------------------
function Panel_HelpDynDirection:Init()
    self:RegisterEvent("Button_Close",        self.OnCancel)
    self.ShowPanel = nil
    self.ParentPanel = nil
    self.ShowObjs = nil
	self:HideArrowExcept(LEFT_TOP_CORNER)
	self.show_time = 0
	self.max_time = PANEL_DEF_MAX_SHOW_TIME
	self.take_a_step_when_time_out = nil
	self.operation = nil
	self.step = nil

end


function Panel_HelpDynDirection:ShowDialog()    
    local panel = self.ShowPanel
    self:Align(self.ShowPanel and self.ShowPanel.this or 
    		self.ShowPanel,self.OffX,self.OffY,self.aligntype) --ShowPanel有表和值两种可能
end


function Panel_HelpDynDirection:HideDialog()
    self.ShowPanel = nil
    self.ParentPanel = nil
    self.ShowObjs   = nil
    self.OffX = nil
    self.OffY = nil
    self.aligntype = nil
    self.m_HintCnt = nil
    self.show_time = 0
    self.max_time = PANEL_DEF_MAX_SHOW_TIME
	self.take_a_step_when_time_out = nil

    DlgApi.FlashItem(self.this,"Image_Secretary",false)
end


-------------------------------------
--		function called by others
-------------------------------------
function Panel_HelpDynDirection:Align(panel,x,y,align)    --将窗口停靠到某个固定位置
    local prop  = DlgApi.GetDialogProp(self.this)
	local left, top, right, bottom = DlgApi.GetWindowRect()
	local align = align or 1
	local scale = DlgApi.GetWindowScale()
    x = x * scale
    y = y * scale
	self:HideArrowExcept(align)
    if prop then
        if panel then
            local x = (x or 0)
    		local y = (y or 0)
			if align == 2 then
    		DlgApi.SetDialogPosition(self.this, x, y, panel,
        	                     AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_RIGHT, 
            	                 AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_TOP )
			elseif align == 3 then
    			DlgApi.SetDialogPosition(self.this, x, y, panel,
        	                     AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_LEFT, 
            	                 AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_BOTTOM )
			elseif align == 4 then
    			DlgApi.SetDialogPosition(self.this, x, y, panel,
        	                     AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_RIGHT, 
            	                 AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_BOTTOM )
			else
    			DlgApi.SetDialogPosition(self.this, x, y, panel,
        	                     AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_LEFT, 
            	                 AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_TOP )
			end
        else
            	local x = x or 0
	    	x = x + ((right-left)/2 + 10)
    		local y = y or 0 
		y = y + ((bottom-top)/2 + 10)
            	DlgApi.SetDialogPosition(self.this, x, y)
        end
    end
end

function Panel_HelpDynDirection:Tick(delay)
    self.show_time = self.show_time + delay

    self:Align(self.ShowPanel and self.ShowPanel.this or self.ShowPanel,self.OffX,self.OffY,self.aligntype)

    -- 前2秒不消失
    if self.show_time < PANEL_DEF_MIN_SHOW_TIME then
        return
    -- 60秒后一定消失
    elseif self.show_time > self.max_time then
        if self.take_a_step_when_time_out ~= nil and self.take_a_step_when_time_out > 0  and self.step ~= nil then
            help_man:OnUIDynamicDirection(LEVT_UI_DYNAMIC_DIRECTION,self.operation,self.step + 1)           
        else
            DlgApi.ShowDialog(self.this ,false)
        end
        return
    end
    
    -- 2 - 60秒之间，停靠界面消失或者线索控件消失，则消失
    if self.ShowPanel then
        if not DlgApi.IsDialogShow(self.ShowPanel) then
            DlgApi.ShowDialog(self.this ,false)
            return
        end     
    end
    
   if self.ShowPanel and self.ShowObjs then
        -- 线索控件隐藏则泡泡隐藏
        local bOpen = false
        for _, obj in ipairs(self.ShowObjs) do
            bOpen = bOpen or DlgApi.IsItemShow(self.ShowPanel,obj) 
        end
        if not bOpen then
            DlgApi.ShowDialog(self.this ,false)
             return
        end 
    end
   
end

function Panel_HelpDynDirection:UpdateTextArea(item)
	local linestatus = DlgApi.GetTextAreaLineInfo(self.this, item)
	if linestatus then	    
		local bOnlyShowText = linestatus.lines <= PANEL_LINES
		DlgApi.SetOnlyShowText(self.this, item, bOnlyShowText)
	end
end

function Panel_HelpDynDirection:HideArrowExcept(id)
	for i = 1,4 do
		DlgApi.ShowItem(self.this,"Image_Arrow" .. i,false)
	end
	local idIndex = {1,1,1,1,}
	if idIndex[id] then
		DlgApi.ShowItem(self.this,"Image_Arrow" .. id,true)
	end
end


-------------------------自定义帮助框------------------------
--arg：	panel：对应帮助要显示在的窗口名
--		control：对应的控件名
--		offx：对控件的偏移x
--		offy：对控件的偏移y		
--		txt：显示的帮助信息
--		style：帮助框的边角显示位置：0：无边角 1：左上边角 2：右上边角 3：左下边角 4 右下边角
--		show：显示与否
--		delaytime：帮助框显示时间
function Panel_HelpDynDirection:ShowTip(panel,item,offx,offy,txt,style,bShow,delaytime)
    if DlgApi.IsDialogShow(self.this) then
        DlgApi.ShowDialog(self.this,false)
    end --开之前先关一次，确保所有参数重置。
	local data = 
	{
		txt = txt or "" ,
		aligntype = style,
	}
	local corner = {}
	local dlgProp = DlgApi.GetDialogProp(panel)
	local itemProp = DlgApi.GetItemRect(panel,item,true)
	local scale = DlgApi.GetWindowScale()
	
	corner[LEFT_TOP_CORNER] = 
	{
		x = 0,
		y = 0,
	}
	
    corner[RIGHT_TOP_CORNER] = 
	{
		x = dlgProp.width,
		y = 0,
	}
	
	corner[LEFT_BOTTOM_CORNER] =
	{
		x = 0,
		y = dlgProp.height,
	}
	
	corner[RIGHT_BOTTOM_CORNER] =
	{
		x = dlgProp.width,
		y = dlgProp.height,
	}

	data.OffX = itemProp.x/scale - corner[style].x/scale + (offx or 0)
	data.OffY = itemProp.y/scale - corner[style].y/scale +(offy or 0)
	data.panel = panel
	if bShow then
	   Panel_HelpSecretary.show_time = delaytime or 5000
	        --全局变量修改后要改回去，调用RESET_TIP_TIME()默认是5000
	   Panel_HelpSecretary:ShowHelpData(data)
	else 
	    DlgApi.ShowDialog(self.this,bShow)
	end
	if delaytime then
	set_timeout( function()
		DlgApi.ShowDialog(self.this,false)
		self:resetTipTime()
		end,Panel_HelpSecretary.show_time)
	end
	data = nil
end

function Panel_HelpDynDirection:resetTipTime()
    self.show_time = 5000
end


--[[ 
----------------UI操作动态指导 相关  ------------------------------------
]]--
-- 
function Panel_HelpDynDirection:PopupUIDynamicDir(operation,step)
    if not ui_dynamic_dir[operation] then return end
    if not ui_dynamic_dir[operation][step] then return end
    self.operation = operation
    self.step		=	step
    local item = ui_dynamic_dir_item[ui_dynamic_dir[operation][step]]
    if item then
        self:ShowUIDirItem(item)
    end    
end


-- 传入 ui_dynamic_dir_item
function Panel_HelpDynDirection:ShowUIDirItem(data)
	local scale = DlgApi.GetWindowScale()    
    if DlgApi.IsDialogShow(self.this) then
        DlgApi.ShowDialog(self.this,false)
    end --开之前先关一次，确保所有参数重置。
      
    -- 文字
	local txt = format_string:parse(data.txt or "")
    DlgApi.SetItemText(self.this, "Text_Secretary", txt or "")
    
    
    -- 显示时间
    if data.max_time ~= nil and data.max_time > PANEL_DEF_MIN_SHOW_TIME then
        self.max_time = data.max_time
    else
        self.max_time = PANEL_DEF_MAX_SHOW_TIME
    end
    self.take_a_step_when_time_out = data.take_a_step_when_time_out
    
    --帮助要用到的界面    
    if data.panel and DlgApiEx.LoadGameDialog(data.panel) then
        self.ShowPanel = data.panel
        self.ParentPanel = data.parent_panel
        self.ShowObjs = data.objs
    else
        self.ShowPanel = nil
        self.ShowObjs = data.objs
    end
   	
   	-- 指引泡泡的位置
    if data.OffX or data.OffY then
        self.OffX = data.OffX
        self.OffY = data.OffY
    end 
    
    
	if data.aligntype then
		self.aligntype = data.aligntype
	end
    self:UpdateTextArea("Text_Secretary")  --在显示之前将滚动条去掉~
    
    --[[ 界面动态指导无权让他依赖的界面打开
    if self.ShowPanel and not DlgApi.IsDialogShow(self.ShowPanel) then
        if data.ShowFunc then
    		data.ShowFunc()
        else
         	DlgApi.ShowDialog(self.ShowPanel, true)
        end
    end
    ]]--
    -- 声音
    if data.sound and AUTO_2D_SOUND and AUTO_2D_SOUND.voiceguide and AUTO_2D_SOUND.voiceguide.female[data.sound]  then
        GameApi.PlayHelpSound(AUTO_2D_SOUND.voiceguide.female[data.sound])
    end
    
   	if txt then
   		DlgApi.ShowDialog(self.this, true, false , false)
   	end
end

--[[ 
----------------UI操作动态指导 相关  end  --------------------------------
]]--