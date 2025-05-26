Panel_RaidInfo = ui.dialog.get("Panel_RaidInfo")

local dlg = Panel_RaidInfo

local img = dlg:get_obj("Image_Raid")

function dlg:Init()
	self:SetItemImageList("Label_DifficultyValue")
end

function dlg:UpdateInfo(category, tid)
	local info = team_platform.get_config(category, tid)
	if not info then self:hide() end

	self:SetItemText("Label_Title", info.name)
	img:SetImageFile(info.image or "", 1)
	self:SetItemText("Text_RaidInfo", info.desc or "")
	self:SetItemText("Label_LevelValue", info.level_info or "")
	self:SetItemText("Label_DifficultyValue", ResourceConfig:GetDifficultyStarImg(info.difficulty or 0))
	self:SetItemText("Label_AwardValue", "UpdateRepuInfo")
end
