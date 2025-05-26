Panel_GuideBar = ui.dialog.get("Panel_GuideBar")
local dlg = Panel_GuideBar
dlg.tick = true
local Format = string.format

local MAX_HINTS = 8
local hints = ui.obj_group:new()
local labels= ui.obj_group:new()
local gfxs  = ui.obj_group:new()
for i = 1, MAX_HINTS do
	table.insert(hints.objs, dlg:get_obj("Button_guide" .. i))		
    table.insert(labels.objs, dlg:get_obj("Label_GuideBarNum" .. i))
    table.insert(gfxs.objs, dlg:get_obj("Image_Gfx" .. i))      
end

-------------------------------------
--		overrides
-------------------------------------
function dlg:Init()
    self.hint_list = {}
    self.default_list = {}    
        
    for i, hint in ipairs(hints.objs) do
        hint:command(function() dlg:guide(i) end)
        hint:FlashItem(true)
        self.default_list[i] = hint:GetItemDefaultRect()
    end
    for i, gfx in ipairs(gfxs.objs) do
        local data = self.hint_list[i]
        gfx:SetTransparent(true)
    end
    self:RefreshHintList()
end


local counter = 0
function dlg:Tick(tick_time)
    counter = counter + tick_time
    if counter < 500 then
        return
    end
    counter = 0
    
    -- 雅典娜祝福更新
    local cur_time = GlobalApi.LuaGetTickCount()
    for i, hint in ipairs(hints.objs) do
        local data = self.hint_list[i]
        if data and data.typ == TYPE_ATHENA then
            if cur_time >= data.end_time then
                help_man:remove_help_data(data.typ, data.id)
                return
            else
        		hint:set_hint(self:get_hint(data))
            end
        end
    end
end



-------------------------------------
--		panel message
-------------------------------------
local guide_msg = "Panel_GuideMsg"
local guide_container = "Panel_GuideContainer"
local last_athena = 0
function dlg:guide(idx)    
    local show_data = self.hint_list[idx]    
    if not show_data then
        if DlgApiEx.IsDialogLoad(guide_container) then
            DlgApi.ShowDialog(guide_container, false)
        end
        return
    end
    
    if show_data.typ == TYPE_ATHENA then 
    	if DlgApiEx.IsDialogLoad(guide_container) then
            DlgApi.ShowDialog(guide_container, false)
        end
        local cur = GlobalApi.LuaGetTickCount()
        if cur <= last_athena then
            return
        end        
        last_athena = cur + 1000
        GameApi.QueryBless()
    elseif show_data.typ == TYPE_CHALLENGE then
        if not DlgApi.IsDialogShow("Panel_LeisurePKAnnal") then
            DlgApi.ShowDialog("Panel_LeisurePKAnnal",true)
        end
        help_man:remove_help_data(TYPE_CHALLENGE,show_data.id)
    elseif show_data.typ == TYPE_QUESTIONAIRE then
        if not DlgApi.IsDialogShow("Panel_Questionaire") then
            DlgApi.ShowDialog("Panel_Questionaire",true)
            GameApi.ShowQuestionaire(show_data.tb[show_data.curIndex])
        end
    else
        if not DlgApi.IsDialogShow(guide_container) then
    		DlgApi.ShowDialog(guide_container, true, false, true)     	
    	end
    	Panel_GuideContainer:show_guide(show_data, self:get_btn_pos(idx))
    end
end


-------------------------------------
--		function called by other
-------------------------------------
function dlg:SetHintList(list)
    self.hint_list = CopyTable(list or {})
    self:RefreshHintList()
    self:resize()
end


function dlg:resize()
    self:set_pos(0, 0, "Panel_QuickBar", AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_CENTER, AUIDIALOG_ALIGN_OUTSIDE, AUIDIALOG_ALIGN_TOP)
end


-------------------------------------
--		function called by self
-------------------------------------
function dlg:RefreshHintList()
    local data, image, rect
    for i, hint in ipairs(hints.objs) do
        local data  = self.hint_list[i]
        local label = labels.objs[i]
        local gfx   = gfxs.objs[i]
        
        if data then
            -- 大小
            rect = self.default_list[i]
        	hint:SetItemDefaultSize(rect.width, rect.height)
        	-- 悬浮提示
        	hint:set_hint(self:get_hint(data))
        	-- 图片
        	image = self:get_show_image(data.typ, data.id)
        	hint:SetImageFile(image.up or "", 0)
        	hint:SetImageFile(image.down or "", 1)
        	hint:SetImageFile(image.onhover or "", 2)  
            -- 角标
            if data.count and data.count > 1 and (data.count - data.curIndex + 1) > 1 then
                label:set_text("" .. (data.count - data.curIndex + 1))
            else
                label:set_text("")
            end
            -- 特效
            if image.gfx and image.gfx:len() > 0 then
                gfx:SetItemGfx(image.gfx)
                gfx:ShowItem(true)
            else
                gfx:ShowItem(false)
            end
        else
            hint:SetItemDefaultSize(0, 0)
            label:set_text("")
            gfx:ShowItem(false)
        end
    end
end


function dlg:get_hint(data)
    if data.typ == TYPE_GUIDE then        
        return help_man:get_help_hint(data.typ, data.id)
    elseif data.typ ==  TYPE_QUESTIONAIRE then
        local id = data.id
        local hint = (id and help_data[id]) and help_data[id].hint or ""
        return hint
    elseif data.typ == TYPE_ATHENA then
        local left_time = (data.end_time - GlobalApi.LuaGetTickCount()) / 1000
        if left_time > 60 then
            local minute = math.modf(left_time / 60)
            return Format(STRING_TABLE.ATHENA_COUNT2, minute, left_time - 60 * minute)
        end
        return Format(STRING_TABLE.ATHENA_COUNT1, left_time)
    elseif data.typ == TYPE_CHALLENGE then
        return STRING_TABLE.LEISURE_CHALLENGE_NEW_HINT
    end
    return ""
end


function dlg:get_show_image(typ, id)
    if typ == TYPE_GUIDE or typ == TYPE_QUESTIONAIRE then
        local image = help_data[id] and help_data[id].image
        return image
    end
    return ResourceConfig:GetTipImage(typ)
end


function dlg:get_btn_pos(idx)
     local obj = hints.objs[idx]
     local rect = obj:get_rect(false)
     return { x = rect.x + rect.width / 2, y = rect.y + rect.height / 2}
end
