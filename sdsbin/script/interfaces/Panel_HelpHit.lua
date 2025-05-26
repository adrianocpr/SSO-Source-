---------------------------------------------------------------
--  created:   2013.1.7
--  author:    chenfudun
--
--  新帮助界面
---------------------------------------------------------------

local DlgApi	= DlgApi
local GameApi	= GameApi
local DlgTemplate = DlgTemplate
local HelpData	= HelpData
local Format 	= string.format
Panel_HelpHit = DlgTemplate:new({this = "Panel_HelpHit"})

-------------------------------------
--		overrides
-------------------------------------
function Panel_HelpHit:Init()
    -- 显示接口方法及界面
    self.ShowFunc  = nil
    self.ShowPanel = nil

    -- 界面关闭时回调方法及参数
    self.onEndFunc = nil
    self.onEndParam = nil

    -- 时间相关变量
    self.show_time = 0    
    self.timer_counter = 0

    -- 注册事件处理接口
    self:EventMapConfig()
end

function Panel_HelpHit:RegisterEventEx(event, handler)
    if event and handler and GameUI then
        GameUI:RegisterEvent(event, GameUI.SecretaryEventNotify)
        self:RegisterEvent(event, handler)
    end
end

function Panel_HelpHit:ShowDialog()
    if self.ShowFunc then
        if self.ShowPanel then
        	self.ShowFunc(self.ShowPanel, true)
        else
            self.ShowFunc()
        end
    end
    local panel = self.ShowPanel
    self:Align(self.ShowPanel and self.ShowPanel.this or 
    		self.ShowPanel,self.OffX,self.OffY,self.aligntype) --ShowPanel有表和值两种可能
end


function Panel_HelpHit:HideDialog()
    self.ShowFunc  = nil
    self.ShowPanel = nil
    self.OffX = nil
    self.OffY = nil
    self.aligntype = nil

    if self.onEndFunc ~= nil then
        self.onEndFunc(unpack(self.onEndParam))
        self.onEndFunc  = nil
        self.onEndParam = nil
    end
end


-------------------------------------
--		function called by others
-------------------------------------
function Panel_HelpHit:Align(panel,x,y,align)    --将窗口停靠到某个固定位置
    local prop  = DlgApi.GetDialogProp(self.this)
	local left, top, right, bottom = DlgApi.GetWindowRect()
	local align = align or 1
	local scale = DlgApi.GetWindowScale()
    x = x * scale
    y = y * scale    
	--self:HideArrowExcept(align)  --未来也扩展成这种方式
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

function Panel_HelpHit:Tick(delay)
    self.timer_counter = self.timer_counter + delay
    if self.timer_counter >= self.show_time then
        DlgApi.ShowDialog(self.this,false)
    end
end
    
function Panel_HelpHit:SetHelpData(data)
    if self.ShowFunc and self.ShowPanel then
        self.ShowFunc(self.ShowPanel, false)
    end
    
    -- 依附界面
   if data.panel and DlgApiEx.LoadGameDialog(data.panel) then
        self.ShowPanel = _G[data.panel] or data.panel
        if data.func then
            self.ShowFunc = self.ShowPanel and self.ShowPanel[data.func] or nil
        end
    else
        if data.func then
            self.ShowFunc = self[data.func]
        else
            self.ShowFunc  = nil
            self.ShowPanel = nil
        end
    end
    
    -- 位置及布局方式
    local scale = DlgApi.GetWindowScale() 
    if data.OffX and data.OffY then
        self.OffX = data.OffX
        self.OffY = data.OffY
    end    
    if data.aligntype then
        self.aligntype = data.aligntype
    end

    -- 起始时间及显示时长
    self.timer_counter = 0
    self.show_time = self.custom_show_time or PANEL_SHOW_TIME   
    self.custom_show_time = nil
    if data.duration then
        self.custom_show_time = data.duration
    end

    DlgApi.ShowDialog(self.this, true, false, false)
end

-- 通用有效性测试
function Panel_HelpHit:CheckCommonValidConfig(event)
    if not event then
        return false
    end

    if not self.eventMap or not self.eventMap[event] then
        return false
    end

    if not HelpData or not HelpData[event] then
        return false
    end

    return true
end

-- 任务有效性测试
function Panel_HelpHit:CheckTaskValidConfig(event, taskId)
    if not taskId then
        return false
    end

    if not HelpData[event][taskId] then
        return false
    end

    local data = HelpData[event][taskId]
    if not data.panel or not data.item then
        return false
    end

    local is_panel_shown = DlgApi.IsDialogShow(data.panel)
    local is_item_shown  = DlgApi.IsItemShow(data.panel, data.item)
    if not is_panel_shown or not is_item_shown then
        return false
    end

    return true
end

function Panel_HelpHit:PopupInterface(event, param2)    
    if self:CheckCommonValidConfig(event) then
        local handler = self.eventMap[event]
        handler(self, event, param2)
    end
end

-------------------------------------
--      事件处理接口
-------------------------------------
-- 注册事件处理接口
function Panel_HelpHit:EventMapConfig()
    self:RegisterEventEx(LEVT_TASK_FINISH,    self.OnFinishIdTask)   -- 首次完成任务
end

-- 首次完成任务触发
function Panel_HelpHit:OnFinishIdTask(event, taskId)
    if self:CheckTaskValidConfig(event, taskId) then
        local data = HelpData[event][taskId]
        self:SetHelpData(data)
    end
end