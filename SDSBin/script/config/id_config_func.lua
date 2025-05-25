module("id_config", package.seeall)


function is_item_important(self, item_id)
	for _, id in ipairs(self.important_id_list) do
		if id == item_id then
			return true
		end
	end
	return false
end


function get_vechicle_adjust_offset(self, vehicle_id)
	local offset = self.vehicle_offset_list[vehicle_id];
	if offset then
		return offset.mount or 0, offset.fly or 0
	end
	return 0, 0
end