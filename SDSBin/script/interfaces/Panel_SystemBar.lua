local DlgApi	= DlgApi
local GameApi	= GameApi
local DlgTemplate = DlgTemplate
local Format 	= string.format
Panel_SystemBar = DlgTemplate:new({this = "Panel_SystemBar"})

local System_Bar 		=	System_Bar
local System_Bar_Sub 	=	System_Bar_Sub
local GROUP_MAIN 		=	1



-------------------------------------
--		overrides
-------------------------------------
function Panel_SystemBar:Init()
    self:RegisterEvent(WM_LBUTTONDOWN,  self.OnEventLButtonDown)
    self:RegisterEvent("Check_Open",	self.OnCommand_Minimize)
    
    self.radio_map = {}
    for button_id, menu in ipairs(System_Bar) do
        DlgApi.SetItemText(self.this, menu.label, menu.name)
        DlgApi.SetObjProperty(self.this, menu.radio, "Button ID", button_id)
        DlgApi.SetObjProperty(self.this, menu.radio, "Group ID", GROUP_MAIN)
        DlgApiEx.SetAcceptMouseMessage(self.this, menu.radio, false)
        if menu.hint then
            DlgApi.SetItemHint(self.this, menu.radio, menu.hint)
        end
        self.radio_map[menu.radio] = button_id
        
        -- 子菜单
        for _, idx in ipairs(menu.sub_button_id) do
            self:update_sub_menu(System_Bar_Sub[idx])
        end
        
        -- 隐藏
        self:show_menu(menu, false)
    end
    
    DlgApiEx.SetTransparent(self.this, "Gfx_levelup", true)
    DlgApi.ShowItem(self.this, "Gfx_levelup", false)
    DlgApi.ShowItem(self.this, "Gfx_bag", false)
end


local counter = 0
local old_check_id = 0
function Panel_SystemBar:Tick(delta)     
    if self.enable_time_count then
        if GlobalApi.LuaGetTickCount() > self.enable_time_count then
            self.enable_time_count = nil
            self:end_system_ani()
        end
        return
    end
    if not DlgApiEx.IsDialogEnabled(self.this) then
        return
    end	
    
    counter = counter + delta
    if counter < 100 then
        return
    end
    counter = 0
    
    -- 收缩
    local bCheck = DlgApi.IsItemChecked(self.this, "Check_Open")
    if bCheck then
        return
    end    
    -- 更新
    local dlg_name, item_name = DlgApi.GetHitItem()
    if dlg_name == self.this and item_name then
        local sub_id = self.radio_map[item_name]
        if sub_id then
            DlgApi.CheckRadioButton(self.this, GROUP_MAIN, sub_id)
        end        
    end
    local check_id = DlgApi.GetCheckedRadioButton(self.this, GROUP_MAIN)
    if old_check_id ~= check_id then
    	for button_id, menu in ipairs(System_Bar) do
        	self:show_menu(menu, button_id == check_id)
    	end
    end
	if check_id >= 0 then
		local x, y = DlgApiEx.GetCursorPos()
		local prop = DlgApi.GetDialogProp(self.this)
		if prop and x and y then
			if x < prop.x or y < prop.y or x > (prop.x + prop.width) or y > (prop.y + prop.height) then
				self:check_close_menu()
			end
		end
	end
end


-------------------------------------
--		panel message
-------------------------------------
function Panel_SystemBar:OnEventLButtonDown(item_name)
    if not item_name:match('Radio_.*') then
        return
    end
    
    local jump
    for _, menu in ipairs(System_Bar) do
        if menu.radio == item_name then
            if menu.jump then
                jump = menu.jump
            else
                local sub_menu = next(menu.sub_button_id) and System_Bar_Sub[menu.sub_button_id[1]]
                jump = sub_menu and sub_menu.jump
            end
            break
        end
    end
    if jump then
        GameUI:OnJumpInterface(jump)
        help_man:TryToWalkCurrDirection(self.this, item_name)
    end
end


function Panel_SystemBar:OnCommand_Minimize()
    local bCheck = DlgApi.IsItemChecked(self.this, "Check_Open")
    local check_id = DlgApi.GetCheckedRadioButton(self.this, GROUP_MAIN)
    
    for button_id, menu in ipairs(System_Bar) do
        DlgApi.ShowItem(self.this, menu.label, not bCheck)
        DlgApi.ShowItem(self.this, menu.radio, not bCheck)
        
        if (not bCheck) and check_id == button_id then
        	self:show_menu(menu, true)
        else
            self:show_menu(menu, false)
        end
    end 
         
    if bCheck then
        DlgApi.ShowItem(self.this, "Gfx_levelup", false)
    	DlgApi.ShowItem(self.this, "Gfx_bag", false)
    end
end


-------------------------------------
--		function called by others
-------------------------------------
function Panel_SystemBar:check_close_menu()
    if not DlgApiEx.IsDialogEnabled(self.this) then
        return
    end  
    local dlg_name, item_name = DlgApi.GetHitItem()
    if dlg_name ~= self.this then
        DlgApi.CheckRadioButton(self.this, GROUP_MAIN, -1)
    end
end


function Panel_SystemBar:get_logic_key_list()
    local list = {}
    for _, sub_menu in pairs(System_Bar_Sub) do        
        if sub_menu.jump then
            local logic = JumpConfig[sub_menu.jump] and JumpConfig[sub_menu.jump].key
            if logic and type(logic) == "number" then
            	table.insert(list, {logic_key = logic, label_key = sub_menu.key})
            end
        end
    end
    return list
end


function Panel_SystemBar:show_system_open(id)
    DlgApi.EnableDialog(self.this, false)
    self.enable_time_count = GlobalApi.LuaGetTickCount() + 1000 * 5
    
    DlgApi.CheckItem(self.this, "Check_Open", false)
    self:OnCommand_Minimize()
    for button_id, menu in ipairs(System_Bar) do
        self:show_menu(menu, false)
    end
    
    local bFind = false
    for button_id, menu in ipairs(System_Bar) do        
        -- 子菜单
        for _, sub_id in ipairs(menu.sub_button_id) do
            if sub_id == id then
                DlgApi.CheckRadioButton(self.this, GROUP_MAIN, button_id)
                bFind = true
                break
            end
        end
        if bFind then 
            -- 背景
    		DlgApi.ShowItem(self.this, menu.bg, true)
    
    		-- 按钮
            for _, sub_id in ipairs(menu.sub_button_id) do
        		self:show_sub_menu(System_Bar_Sub[sub_id], sub_id ~= id)
    		end
            break 
        end
    end    
end


function Panel_SystemBar:end_system_ani()
    DlgApi.EnableDialog(self.this, true)
    self:OnCommand_Minimize()
end


-------------------------------------
--		function called by self
-------------------------------------
function Panel_SystemBar:show_menu(menu, show)
    -- 背景
    DlgApi.ShowItem(self.this, menu.bg, show)
    
    -- 按钮
    for _, idx in ipairs(menu.sub_button_id) do
        self:show_sub_menu(System_Bar_Sub[idx], show)
    end
    
    if show then
        help_man:TryToWalkCurrDirection(self.this,menu.radio,DYNAMIC_DIR_MSG_ONHOVER)
    end
end


function Panel_SystemBar:show_sub_menu(info, show)
    if not info then return end
    if show then        
        show = help_man:judge_show(info)
    end
    
    if info.button then
    	DlgApi.ShowItem(self.this, info.button, show)
    	if info.check_func then
    		local bCheck = info.check_func()
    		DlgApi.CheckItem(self.this, info.button, bCheck)
    	end
    end
    if info.label then
    	DlgApi.ShowItem(self.this, info.label, show)
    end
    if info.key then
    	DlgApi.ShowItem(self.this, info.key, show)    
    end
end


local function toogle_dialog(name)
	local is_show = DlgApi.IsDialogShow(name)
	DlgApi.ShowDialog(name, not is_show)
end
function Panel_SystemBar:update_sub_menu(info)
    if not info then return end
    
    DlgApi.SetItemText(self.this, info.label, info.name)
    if info.hint then
    	DlgApi.SetItemHint(self.this, info.button, info.hint)
    end
    
    if info.jump then
        self:RegisterEvent(info.button, function() 
        											GameUI:OnJumpInterface(info.jump)
        											DlgApi.CheckRadioButton(self.this, GROUP_MAIN, -1)
        											help_man:TryToWalkCurrDirection(self.this,info.button)
        										end)
    end
end
