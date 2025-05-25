local DlgApi		= DlgApi
local GameApi		= GameApi
local DlgTemplate 	= DlgTemplate
local Format 	  	= string.format
local star 			= DialogStarGuard

Panel_StarGuard = DlgTemplate:new({this = "Panel_StarGuard"})


-------------------------------------
--		overrides
-------------------------------------
function Panel_StarGuard:Init()
     self:RegisterEvent(WM_LBUTTONUP, self.OnHit)
end

function Panel_StarGuard:OnHit(Item)
    if Item == 'Button_Star' then
        for k,v in pairs(DialogStarGuard.Skills) do
            GameApi.CastSkill(v)
        end
    end
end

-------------------------------------
--		function called by self
-------------------------------------
function Panel_StarGuard:renew(stars)
	if stars then
	    if not DlgApi.IsDialogShow(self.this) then
			ani.dialog.fade_in(self.this,{  duration = 600,})
            set_timeout(function() DlgApi.ShowItem(self.this,'Gfx_Star',false) end,10000)
        end
	else
	    if DlgApi.IsDialogShow(self.this) then
		    ani.dialog.fade_out(self.this,{  duration = 600,})
		end
	end
end


function Panel_StarGuard:RefreshHint()
    local inst = InstanceFunc:GetCurInstId() or 0   --当前场景
    local stars = self:GetStars() --玩家星座
    local values = GameApi.GetConstellationData(stars-1) 
	if  values ~= -1 then
        local star_1 = star.LevelHintStar_half 
        local star_2 = star.LevelHintStar 
        local atk = math.ceil(tonumber(values)/10)
        local star_num_1 = math.floor(atk/2)
        local star_num_2 = 0
        if math.fmod(atk,2) > 0 then
            star_num_2 = 1
        end
        local star_string = ''
        for var = 1,star_num_1 do
            star_string = star_string .. star_2
        end
        for var = 1,star_num_2 do
            star_string = star_string .. star_1
        end
        local imgHint1 = Format(star.ImageHint1, star.name[stars],star_string) --星座悬浮提示名字和运势强度
	    local imgHint2 = Format(star.Text,   atk) .. '%' --悬浮提示增加攻击力
     	DlgApi.SetItemHint(self.this,'Button_Star',imgHint1 .. '\r'.. imgHint2 .. '\r\r' .. star.ImageHint2)
        local img = star.Image[stars] --星座图片
        DlgApi.SetImageFile(self.this,'Image_Star',img,1)
        --DlgApi.SetItemText(self.this,'Label_Attack',txt)
        --local prg = math.ceil(tonumber(values or 0)/10) / 10 --设置星座运势进度值
        --DlgApi.SetProgress(self.this, 'Progress_Star', prg)
        --local prgHint = Format(star.PrgHint,values) --设置星座运势悬浮提示
     	--DlgApi.SetItemHint(self.this,'Progress_Star',prgHint)
	end
	self:renew(stars)
end


function Panel_StarGuard:GetStars() --根据玩家获得的技能判断玩家是什么星座，略绕。
    for k,v in pairs(DialogStarGuard.Skills) do
        local skill_lv = GameApi.GetHostSkillLevel(v)
        if skill_lv then
            return k
        end
    end
    return 0
end



