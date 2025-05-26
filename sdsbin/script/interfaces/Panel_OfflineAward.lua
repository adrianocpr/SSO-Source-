Panel_OfflineAward = ui.dialog.get("Panel_OfflineAward")

local dlg = Panel_OfflineAward

local items_group = dlg:get_obj_group{
	label = "Label_Item",
}
for icon in dlg:iter_objs_like("Image_Item%d") do
	table.insert(items_group, icon)
end
function items_group:clear()
	for _, icon in ipairs(items_group) do
		icon:clear_icon()
	end
end
function items_group:is_show()
	return self.label:is_show()
end

local ok_button 		= dlg:get_obj("Button_OK")
local exp 				= dlg:get_obj("Label_ExpValue")
local exp_tag	 		= dlg:get_obj("Label_Exp1")
local stored_exp 		= dlg:get_obj("Label_StoredExpValue")
local stored_exp_tag 	= dlg:get_obj("Label_Exp2")



function dlg:Init()
	ok_button:command(self.hide)

	exp:set_text("")
	stored_exp:set_text("")
	exp:set_text("")
	items_group:clear()
end


function dlg:show_award_info(task_id)
	local award = GameApi.GetTaskAwardInfo(task_id)
	if not award then return end
	self:show(true, false, false)

	if award.exp > 0 then
		exp:set_text(award.exp)
		exp_tag:set_text(STRING_TABLE.EXP_OFFLINE_AWARD_TAG_NAME)
	else
		exp:set_text(award.exp2)
		exp_tag:set_text(STRING_TABLE.EXP2_OFFLINE_AWARD_TAG_NAME)
	end
	if award.stored_exp > 0 then
		stored_exp:set_text(award.stored_exp)
		stored_exp_tag:set_text(STRING_TABLE.STORE_EXP_OFFLINE_AWARD_TAG_NAME)
	else
		stored_exp:set_text(award.stored_exp2)
		stored_exp_tag:set_text(STRING_TABLE.STORE_EXP2_OFFLINE_AWARD_TAG_NAME)
	end

	items_group:clear()
	items_group:show(award.items and #award.items > 0)

	for i, item in ipairs(award.items or {}) do
		if i <= #items_group then
			local icon = items_group[i]
			icon:show_ivtr_icon(item.id)
		else
			icon:clear_icon()
		end
	end
end
