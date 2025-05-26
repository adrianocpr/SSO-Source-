Panel_GuideSub = ui.dialog.get("Panel_GuideSub")
local dlg = Panel_GuideSub
local format, byte = string.format, string.byte

local cur_lev = dlg:get_obj("Label_LevTags")

local MAX_NUM = 8
local real_fight 	= ui.obj_group:new()
local normal_fight  = ui.obj_group:new()
for i = 1, MAX_NUM do
	table.insert(normal_fight.objs, dlg:get_obj("Image_NaturalFightValue" .. i) )
	table.insert(real_fight.objs,	dlg:get_obj("Image_RealFightValue" .. i) )
end


local sub_power_list = 
{
	[1]	= {SAINTCLOTHES_BRONZE, SAINTCLOTHES_SILVER, SAINTCLOTHES_GOLDEN, SAINTCLOTHES_DEITY, },
	[2]	= {EQUIPMENT_STRENGTHEN, },
	[3]	= {MICROCOSM_JINGJIE_GROWTH, MICROCOSM_JIDU_XINHUN, MICROCOSM_LUOHOU_XINHUN, MICROCOSM_ZHENYANG_XINHUN, },	
	[4]	= {SELF_XINFA_SKILL, },
	[5]	= {TREASURE_QUALITY, },
	[6]	= {ATTENDANT_APTITUDE, ATTENDANT_COMBAT, ATTENDANT_OTHER, },
	[7]	= {EQUIPMENT_QUALITY, },
	[8]	= {EQUIPMENT_DEVIL, },
}
	
local MAX_SUB_CLASS = 8
local fight_lab = ui.obj_group:new()
local fight_pro = ui.obj_group:new()
local fight_btn = ui.obj_group:new()
for i = 1, MAX_SUB_CLASS do
	table.insert(fight_lab.objs, dlg:get_obj("Label_Guide" .. i) )
	table.insert(fight_pro.objs, dlg:get_obj("Progress_Guide" .. i) )
	table.insert(fight_btn.objs, dlg:get_obj("Button_Guide" .. i) )
end

-------------------------------------
--		overrides
-------------------------------------
function dlg:Init()
    self.idx	= nil
    self.guide	= nil
    
    self:RegisterEvent("Button_PageUp",		self.OnPageUp)
	self:RegisterEvent("Button_PageDown",	self.OnPageDown)
end


function dlg:ShowDialog()
    self.idx, self.guide = self:get_cur_guide()
    self:player_lev_up()
    self:combat_power_update()
end



-------------------------------------
--		panel message
-------------------------------------
function dlg:OnPageUp()
    if not self.idx then return end
    if guide_power[self.idx - 1] then
        self.idx	= self.idx - 1
        self.guide	= guide_power[self.idx]
    end
    self:combat_power_update()
end


function dlg:OnPageDown()  
    if not self.idx then return end
    if guide_power[self.idx + 1] then
        self.idx	= self.idx + 1
        self.guide	= guide_power[self.idx]
    end
    self:combat_power_update()
end


-------------------------------------
--		function called by others
-------------------------------------
function dlg:player_lev_up()
    local prop = GameApi.GetHostProp()
    local text = format(STRING_TABLE.GUIDE_CUR_LEV, prop.level)
    cur_lev:set_text(text)
end


function dlg:combat_power_update()
    local guide = self.guide
    if not guide then return end
    
    -- 总战斗力   
    self:show_fight_value(normal_fight, guide.power_total)
    local prop = GameApi.GetHostProp()
    self:show_fight_value(real_fight, prop.power)
    
    -- 战斗力分类
    local power_list = GameApi.GetHostCombatPowerList()
    for i = 1, MAX_SUB_CLASS do
        self:show_sub_power(i, power_list, guide.list[i] or {})
    end
end


-------------------------------------
--		function called by self
-------------------------------------
function dlg:get_cur_guide()
    local prop = GameApi.GetHostProp()
    for index, guide in ipairs(guide_power) do
        if prop.level >= guide.min_lev and prop.level <= guide.max_lev then
            return index, guide
        end
    end
end


local zero = byte("0")
function dlg:show_fight_value(group, val)
    local str = tostring(val)
    local len = string.len(str)
    local n
    for i, img in ipairs(group.objs) do        
        if len >= i then
            n = byte(str, len - i + 1)
            img:show(true)
            img:SetImageFile(ResourceConfig:GetNumImage(n - zero), 1)
        else
            img:show(false)
        end
    end
end


function dlg:show_sub_power(index, list, sub_class)
    local sub_list = sub_power_list[index]
    local total = 0
    for _, i in ipairs(sub_list or {}) do
        total = total + list[i]
    end
    
    local power = sub_class.power or 0
    fight_lab.objs[index]:set_text(format("%d/%d", total, power))
    local rate = total / power
    if rate > 1 then rate = 1 end
    fight_pro.objs[index]:SetProgress(rate)
    
    if sub_class.help then
    	fight_btn.objs[index]:command(function()
    										local guide_container = "Panel_GuideContainer"
    										if not DlgApi.IsDialogShow(guide_container) then
    											DlgApi.ShowDialog(guide_container, true, false, true)        	
    										end
    										local show_list = help_data[sub_class.help] and help_data[sub_class.help].show_list
    										local idx = show_list and math.random(1, #show_list)
    										local show_data = {typ = TYPE_GUIDE, id = sub_class.help, show_idx = idx}
    										local rect = fight_btn.objs[index]:get_rect(false)
    										local show_pos	= { x = rect.x + rect.width / 2, y = rect.y + rect.height / 2}
    										Panel_GuideContainer:show_guide(show_data)    										
    									end)
    else
        fight_btn.objs[index]:un_command()
    end
end