Panel_Quest_Library = ui.dialog.get("Panel_Quest_Library")

local dlg = Panel_Quest_Library

-- 每天能够完成库任务的最大次数
local MAX_FINISHED_COUNT = 50

-- 用于记录每天可完成库任务的声望ID
local finished_count_repu_id = 66

function dlg:Update()
	local max = MAX_FINISHED_COUNT
	local cur = GameApi.GetHostRepuValue(finished_count_repu_id)

	local label = dlg:get_obj("Label_FinishedCount")
	label:set_text(STRING_TABLE["TASK_LIB_FINISHED_COUNT"]:format(cur, max))
end