Panel_SkillsBean = ui.dialog.get("Panel_SkillsBean")

local dlg = Panel_SkillsBean
dlg.tick = true

local MAX_STACK = 5
local beans = ui.obj_group:new()
for i = 1, MAX_STACK do
	table.insert(beans.objs, dlg:get_obj("Image_" .. i))
end


function dlg:Init()
    self.num	= 0
    self.count	= 0
end


local counter = 0
function dlg:Tick(tick_time)
    counter = counter + tick_time
    if counter <= 30 then
        return
    end	
    counter = 0 
    
	self.count = self.count - tick_time
	if self.count <= 0 then
	    self.num = 0
	end
	for i, bean in ipairs(beans.objs) do
		bean:show(i <= self.num)
	end
end


function dlg:PopupBeans(num, count)
    self.num 	= num
    self.count 	= count
end