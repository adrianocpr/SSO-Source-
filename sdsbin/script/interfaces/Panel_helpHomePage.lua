local DlgApi		= DlgApi
local GameApi		= GameApi
local DlgTemplate 	= DlgTemplate
local Format 	  	= string.format
Panel_helpHomePage = DlgTemplate:new({this = "Panel_helpHomePage"})

-------------------------------------
--		overrides
-------------------------------------
function Panel_helpHomePage:Init()
	self:RegisterEvent("Button_levelUp",		self.OnLevelUp)
	self:RegisterEvent("Button_money",			self.OnMoney)
	self:RegisterEvent("Button_friend",			self.OnFriend)
	self:RegisterEvent("Button_army",				self.OnArmy)
	self:RegisterEvent("Button_level",			self.OnLevel)
	self:RegisterEvent("Button_habit",			self.OnHabit)
	self:RegisterEvent("Button_random",			self.OnRandom)
	self:RegisterEvent("Button_question",		self.OnQuestion)
end

function Panel_helpHomePage:ShowDialog()
end

function Panel_helpHomePage:HideDialog()
end
-----------------------------我想快升级——每隔X级对应一个推荐组ID----------------------------------------------------------
function Panel_helpHomePage:OnLevelUp()
	local hostinfo = GameApi.GetHostPropEx()
	if HELP_ADVANCE_UPGRADE[hostinfo.level]==nil then return end
	DlgApiEx.SetDialogInSubDialogItem("Panel_Help","Sub_help","Panel_HelpResult") 
	Panel_HelpResult:UpdateAdvance(HELP_ADVANCE_UPGRADE[hostinfo.level].value)
end
-----------------------------我想赚钱——每隔X级对应一个推荐组ID----------------------------------------------------------
function Panel_helpHomePage:OnMoney()
	local hostinfo = GameApi.GetHostPropEx()
	if HELP_ADVANCE_MONEY[hostinfo.level]==nil then return end
	DlgApiEx.SetDialogInSubDialogItem("Panel_Help","Sub_help","Panel_HelpResult") 
	Panel_HelpResult:UpdateAdvance(HELP_ADVANCE_MONEY[hostinfo.level].value)
end
-----------------------------我想交朋友——男对应一个推荐组ID，女对应一个推荐组ID  (对应性别，0-男，1-女，2-男女都可)--------
function Panel_helpHomePage:OnFriend()
	local hostinfo = GameApi.GetHostPropEx()
	if HELP_ADVANCE_FRIEND[hostinfo.gender]==nil then return end
	DlgApiEx.SetDialogInSubDialogItem("Panel_Help","Sub_help","Panel_HelpResult") 
	Panel_HelpResult:UpdateAdvance(HELP_ADVANCE_FRIEND[hostinfo.gender].value)
end
-----------------------------我想玩军团——对应同一个推荐组ID----------------------------------------------------------
function Panel_helpHomePage:OnArmy()
	if HELP_ADVANCE_CORPS==nil then return end
	DlgApiEx.SetDialogInSubDialogItem("Panel_Help","Sub_help","Panel_HelpResult") 
	Panel_HelpResult:UpdateAdvance(HELP_ADVANCE_CORPS)
end
-----------------------------?根据我的等级----------------------------------------------------------
function Panel_helpHomePage:OnLevel()
	local hostinfo = GameApi.GetHostPropEx()
	if HELP_ADVANCE_BY_LV[hostinfo.level]==nil then return end
	DlgApiEx.SetDialogInSubDialogItem("Panel_Help","Sub_help","Panel_HelpResult") 
	Panel_HelpResult:UpdateAdvance(HELP_ADVANCE_BY_LV[hostinfo.level].value)
end
-----------------------------?根据我的习惯----------------------------------------------------------
function Panel_helpHomePage:OnHabit()
	DlgApiEx.SetDialogInSubDialogItem("Panel_Help","Sub_help","Panel_HelpResult") 
	Panel_HelpResult:OnHabit()
end
-----------------------------随便看看----------------------------------------------------------
function Panel_helpHomePage:OnRandom()
	DlgApiEx.SetDialogInSubDialogItem("Panel_Help","Sub_help","Panel_HelpResult") 
	Panel_HelpResult:OnRandom()
end

-----------------------------问题解答----------------------------------------------------------
function Panel_helpHomePage:OnQuestion()
	local hostinfo = GameApi.GetHostPropEx()
	if HELP_ADVANCE_QUESTION[hostinfo.level]==nil then return end
	DlgApiEx.SetDialogInSubDialogItem("Panel_Help","Sub_help","Panel_HelpResult") 
	Panel_HelpResult:UpdateAdvance(HELP_ADVANCE_QUESTION[hostinfo.level].value)
end