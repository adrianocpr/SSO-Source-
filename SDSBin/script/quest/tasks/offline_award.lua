----------------------------------------
--以下任务完成后，显示Panel_OfflineAward界面
--
local t = task:new{
	2563,
	2564,
	2565,
	2566,
	2567,
	2568,
	2569,
}

function t.on_award(tid)
	DlgApiEx.LoadGameDialog("Panel_OfflineAward")
	if Panel_OfflineAward then
		Panel_OfflineAward:show_award_info(tid)
	end
end