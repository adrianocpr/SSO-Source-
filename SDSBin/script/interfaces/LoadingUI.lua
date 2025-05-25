local UIManTemplate = UIManTemplate
local DlgApi  = DlgApi
local GameApi = GameApi
local Format = string.format

LoadingUI = UIManTemplate:new({this = "LoadingUI", index = UIMAN_LOADING})
glb_curUIMan = LoadingUI


-------------------------------------
--		overrides
-------------------------------------
function LoadingUI:Init()
	self:RegisterEvent(LUA_EVENT_LOADING_SETWORLD,    self.OnEventLoadingSetWorld);
	self:RegisterEvent(LUA_EVENT_LOADING_SETPROGRESS, self.OnEventLoadingSetProgress);
end




-------------------------------------
--		C message
-------------------------------------
function LoadingUI:OnEventLoadingSetWorld(event, id, mapfile)
	local ran1 = math.random(LDG_TIP.num)
	local ran2 = math.random(8)
	local tip = Format(LDG_TITLE, LDG_TIP[ran1])
	DlgApi.SetItemText("Win_Loading", "Txt_Tip", tip);
	if id == 0 then
		DlgApi.SetImageFile("Win_Loading", "Img_Loading", Format("MapLoading\\a%d.dds", ran2), 1);
	else
		DlgApi.SetImageFile("Win_Loading", "Img_Loading", Format("MapLoading\\%s.dds", mapfile), 1);
	end
end

function LoadingUI:OnEventLoadingSetProgress(event, progress)
	DlgApi.SetProgress("Win_Loading", "Prgs_Loading", progress);
end
