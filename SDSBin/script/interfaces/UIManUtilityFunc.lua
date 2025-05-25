---------------------------------------------------------------
--  created:   2012.9.19
--  author:    chenfudun
--
--  UI 管理实用接口
---------------------------------------------------------------

UIManUtilityFunc = {}

-- 窗口布局
function UIManUtilityFunc:ArrangeDoubleDialog(leftPanel, rightPanel, bLeftToRight)
    if not leftPanel or not rightPanel then
        return
    end
   
    local mainPanel, assistPanel
    if bLeftToRight then
    	mainPanel = leftPanel
    	assistPanel = rightPanel
    else
    	mainPanel = rightPanel
    	assistPanel = leftPanel
    end

    local space = DIALOG_SPACE * DlgApi.GetWindowScale()
	local mainProp   = DlgApi.GetDialogProp(mainPanel)
	local assistProp = DlgApi.GetDialogProp(assistPanel)
	local left, top, right, bottom = DlgApi.GetWindowRect()
	local width  = right - left
	local height = bottom - top
	local x = (width - mainProp.width - assistProp.width - space) / 2
	local y = (height - mainProp.height) / 2
	DlgApi.SetDialogPosition(mainPanel, x, y)
		
	x = x + mainProp.width + space / 2
	y = (height - assistProp.height) / 2
	DlgApi.SetDialogPosition(assistPanel, x, y)
end


local show_welcome_dialog = false
function UIManUtilityFunc:ShowWelcomeDialog()
	if show_welcome_dialog then
		return 
	end
	local prop = GameApi.GetHostPropEx()
	if prop.level < LEVEL_TO_SHOW_WELCOME then
		return
	end
	show_welcome_dialog = GameApi.PopupDailyInterface("Panel_First", 2)
end
