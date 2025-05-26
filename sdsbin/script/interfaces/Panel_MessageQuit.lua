Panel_MessageQuit = ui.dialog.get("Panel_MessageQuit")
local Format = string.format
local dlg = Panel_MessageQuit
local RECOMMEND	= 5
local TODO_DAILY_MAX = 3
local WEEDING_COUNT_MAX = 72
local IMAGE_GUIDE_UNFINISH = "special\\help\\Unfinsh.png"

-------------------------------------
--		overrides
-------------------------------------
function dlg:Init()
	self:RegisterEvent('Button_Pray',		                self.Pray)
	self:RegisterEvent('Button_Daily',		                self.Daily)
end

function dlg:Pray()
	GameApi.CastSkill(23)
end

function dlg:Daily()
	local toggle = DlgApi.IsDialogShow('Panel_First')
	DlgApi.ShowDialog('Panel_First',not toggle)
	DlgApi.ShowDialog(self.this,false)
end

function dlg:ShowDialog()
	daily_man:init()
    daily_man:build_daily_list()
	local tbl_daily = daily_man.daily_list[RECOMMEND]
	local tbl_daily_todo = {}
	self:HideItem()
	for _,daily in ipairs(tbl_daily) do
		if not daily_man:IsDailyComplete(daily) then
			table.insert(tbl_daily_todo,daily)
		end
		if #tbl_daily_todo >= TODO_DAILY_MAX then
			break
		end
	end
	self:ShowDailyList(tbl_daily_todo)
end

function dlg:ShowDailyList(tbl_daily_todo)
	for k,daily in ipairs(tbl_daily_todo) do
		self:ShowDaily(daily,k)
	end
end

function dlg:ShowDaily(daily,k)
	if not daily then return end
	local name = daily.Name or ''
	local img = daily.Image or ''
	DlgApi.SetItemText(self.this, 'Label_Name' .. k, name)
	DlgApi.ShowItem(self.this, 'Label_Name' .. k, true)
	DlgApi.SetImageFile(self.this, 'Image_Picture' .. k, img, 1)
	DlgApi.ShowItem(self.this, 'Image_Picture' .. k, true)
	-- 推荐度
	if daily.Precedence then
		local pre = math.floor(tonumber(daily.Precedence)/20) / 5
		DlgApi.SetProgress(self.this, 'Progress_Star' .. k, pre) 
		DlgApi.ShowItem(self.this, 'Progress_Star' .. k, true)
	end
	if daily.Intro then
		local intro = daily.Intro:sub(1,100) .. _t'……'
		DlgApi.SetItemHint(self.this, 'Image_Picture' .. k, intro)
	end
end

tbl_task_idle = {9208,9113,9115,9116,9117,9118,12012} --挂机活动相关数据
tbl_daily_idle = {DailyData[117],}

function dlg:HideItem()
	for i = 1,4,1 do
		DlgApi.ShowItem(self.this,'Label_Name' .. i, false)
		DlgApi.ShowItem(self.this,'Image_Picture' .. i, false)
		DlgApi.ShowItem(self.this,'Progress_Star' .. i, false)
	end
	local prop = GameApi.GetHostProp()
	DlgApi.ShowItem(self.this,'Button_Daily',prop.level >= daily_man.ACTIVE_LEVEL_LIMIT)
	
	if prop.level < daily_man.ACTIVE_LEVEL_LIMIT then  --小于15级不显示活动内容
		DlgApi.SetItemText(self.this,'Label_ForceQuitTags',STRING_TABLE.DAILY_LOW_LEVEL)
	else
		DlgApi.SetItemText(self.this,'Label_ForceQuitTags',STRING_TABLE.DAILY_HIGH_LEVEL)
	end

	if prop.level < 40 then  --小于40级不显示除草提示
		DlgApi.SetItemText(self.this,'Label_IdleHintTags',STRING_TABLE.DAILY_WEEDING_HINT1)
		local guide_list = Panel_GuidePortable:get_guide_can_show(1)
		local item = guide_list[1]
		local achievement = GameApi.GetAchievement(item.achieve_id)
		local name = achievement.name
		local reward = item.award
		DlgApi.SetImageFile(self.this, 'Image_Picture4', IMAGE_GUIDE_UNFINISH, 1)
		DlgApi.ShowItem(self.this,'Image_Picture4',true)
		DlgApi.SetItemText(self.this,'Label_Name4',name)
		DlgApi.ShowItem(self.this,'Label_Name4',true)
		DlgApi.SetItemText(self.this,'Label_IdleReward',reward)
		local text = format_string:parse(STRING_TABLE.DAILY_GUIDE_HINT)
		DlgApi.SetItemText(self.this,'Text_Idle1',text)
	else
		local reward = idle_data[prop.level]
		local count = WEEDING_COUNT_MAX - GameApi.GetHostRepuValue(83) 
	local exp = reward.exp and (reward.exp * count) or (reward.exp2 * count)
	local exp_str = reward.exp and STRING_TABLE.DAILY_WEEDING_REWARD or STRING_TABLE.DAILY_WEEDING_REWARD2
		local bindmoney = reward.bindmoney * count
		DlgApi.SetItemText(self.this,'Label_IdleHintTags',STRING_TABLE.DAILY_WEEDING_HINT2)
		local text = Format(exp_str,exp,bindmoney)
		DlgApi.SetItemText(self.this,'Label_IdleReward',text)
		self:ShowDaily(tbl_daily_idle[1],4)
		local text = format_string:parse(STRING_TABLE.DAILY_WEEDING_HINT3)
		DlgApi.SetItemText(self.this,'Text_Idle1', text)
	end
end

