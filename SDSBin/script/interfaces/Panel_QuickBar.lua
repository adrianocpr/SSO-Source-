local DlgApi	= DlgApi
local GameApi	= GameApi
local DlgTemplate = DlgTemplate
local Format 	= string.format
Panel_QuickBar = DlgTemplate:new({this = "Panel_QuickBar"})

--小宇宙集气效果演示------------
--在console里依次输入:
--d_lua
--Panel_QuickBar:Test() --启动集气演示
--Panel_QuickBar:Test() --关闭集气演示
--Panel_QuickBar:UpdateCosmosButtonGfx(juqiLevel,burstLevel) --显示燃烧效果,juqiLevel :0-3,burstLevel:0-3
--end_lua
--------------------------------

local COSMOS_ACTIVE_SETTINGS = 
{
    IMG_INDEX_START = 1,--开始图片
    IMG_INDEX_1 = 9,--临界图片
    IMG_INDEX_2 = 13,--临界图片
    IMG_COUNT = 16,--图片总数
    IMG_PRE = "Image_Cosmos",--图片前缀
}

--缓存这些变量以降低运算,用于计算小宇宙聚气图片index
local COSMOS_IMG_GAP1 = cosmos_burst.COSMOS_ACTIVE_RATE_1/
    (COSMOS_ACTIVE_SETTINGS.IMG_INDEX_1-COSMOS_ACTIVE_SETTINGS.IMG_INDEX_START)
local COSMOS_IMG_GAP2 = (cosmos_burst.COSMOS_ACTIVE_RATE_2-cosmos_burst.COSMOS_ACTIVE_RATE_1)/
    (COSMOS_ACTIVE_SETTINGS.IMG_INDEX_2-COSMOS_ACTIVE_SETTINGS.IMG_INDEX_1)
local COSMOS_IMG_GAP3 = (cosmos_burst.COSMOS_ACTIVE_RATE_3-cosmos_burst.COSMOS_ACTIVE_RATE_2)/
    (COSMOS_ACTIVE_SETTINGS.IMG_COUNT-COSMOS_ACTIVE_SETTINGS.IMG_INDEX_2)

--灯状态
local COSMOS_LAMP = 
{
    [1] = 
    {
        bg = "Edit_LampBG1",--背景
        reach = "Image_BlueLamp",--到达第一状态的时候显示
        flash = "Gfx_BlueFlash",--到达第一状态的时候闪一下
    },
    [2] = 
    {
        bg = "Edit_LampBG2",
        reach = "Image_RedLamp",
        flash = "Gfx_RedFlash",
    },
    [3] = 
    {
        bg = "Edit_LampBG3",
        reach = "Image_YellowLamp",
        flash = "Gfx_YellowFlash",
    },
}
local COSMOS_BUTTON = "Button_cosmos"
local COSMOS_BUTTON_GFX = 
{
    [1] = 
    {
        notReach = "Gfx_Blue",--未到达第一状态的时候显示
        flash = "Gfx_BlueBreak",--到达第一状态的时候闪一下
        burst = "Gfx_BlueBurn",--第一状态燃烧时显示
    },
    [2] = 
    {
        notReach = "Gfx_Red",
        flash = "Gfx_RedBreak",
        burst = "Gfx_RedBurn",
    },
    [3] = 
    {
        notReach = "Gfx_Yellow",
        flash = "Gfx_YellowBreak",
        burst = "Gfx_YellowBurn",
    },
}
------------------------------------
--      local var
------------------------------------
Panel_QuickBar.isCosmosShow = false --小宇宙是否生效
Panel_QuickBar.showCosmosImgIndex = nil --显示的小宇宙图片
Panel_QuickBar.juqiLevel = nil -- 聚气级别
Panel_QuickBar.burstLevel = nil -- 燃烧级别
Panel_QuickBar.canBurstLevel = nil --可以燃烧的基本
-------------------------------------
--		overrides
-------------------------------------

function Panel_QuickBar:OnAttach()
    self:ShowCosmosInterface(false)
    self:SetCosmosHint()
end

local counter = 0
function Panel_QuickBar:Tick(delta)
    counter = counter + delta
    if counter < 200 then
        return
    end
    counter = 0
    
    if self.isCosmosShow then       
        self:UpdateCosmosInterface()
    end
end


-------------------------------------
--		function called by others
-------------------------------------
--
function Panel_QuickBar:CheckCosmosVisibility()
    self.isCosmosShow = cosmos_burst:IsCosmosBurstUiAcitve()
    self:ShowCosmosInterface(self.isCosmosShow)
    self.showCosmosImgIndex = nil --显示的小宇宙图片
    self.juqiLevel = nil -- 聚气级别
    self.burstLevel = nil -- 燃烧级别
    self.canBurstLevel = nil --可以燃烧的基本
end

--设置悬浮提示
function Panel_QuickBar:SetCosmosHint()
    DlgApiEx.SetCosmosBurstHint(self.this,COSMOS_BUTTON)
    for i,buttonGfx in ipairs(COSMOS_BUTTON_GFX) do
        DlgApiEx.SetCosmosBurstHint(self.this,buttonGfx.notReach)
        DlgApiEx.SetCosmosBurstHint(self.this,buttonGfx.flash)
        DlgApiEx.SetCosmosBurstHint(self.this,buttonGfx.burst)
    end
end

function Panel_QuickBar:Test()
    self.test = not self.test
    if self.test then
        self.testRate = 0
    end
end

-------------------------------------
--		function called by self
-------------------------------------
function Panel_QuickBar:UpdateCosmosInterface()
    local info = GameApi.GetHostCosmosInfo()
    if not info then
        self:ShowCosmosInterface(false)
		--DlgApi.ShowDialog('')
        return
    end
    local rate = info.value/info.max
    --测试------------------------------------
    if self.test then
        rate = self.testRate
        if self.testRate < 1 then
            self.testRate = self.testRate + 0.01
        end
    end
    --测试结束---------------------------------
    local juqiLevel = cosmos_burst:GetCosmosJuqiLevel(info.burstLevel,rate)
    local canBurstLevel = cosmos_burst:GetCosmosCanBurstLevel(info.burstLevel,rate)

    self:UpdateCosmosButtonImage(juqiLevel,rate)
    self:UpdateCosmosButtonGfx(juqiLevel,info.burstLevel)
    self:UpdateCosmosLample(canBurstLevel)
    self:PlayCosmosBreakFlash(info.burstLevel)
    self.juqiLevel = juqiLevel
    self.burstLevel = info.burstLevel
    self.canBurstLevel = canBurstLevel
end
--显示小宇宙界面，如果bShow==true，只显示不动态更新部分
function Panel_QuickBar:ShowCosmosInterface(bShow)
    DlgApi.ShowItem(self.this,COSMOS_BUTTON,bShow)
    for _,lamp in ipairs(COSMOS_LAMP) do
        DlgApi.ShowItem(self.this,lamp.bg,bShow)
    end 
    if not bShow then
        for i=1,COSMOS_ACTIVE_SETTINGS.IMG_COUNT do
            local imgFile = Format("%s%02d",COSMOS_ACTIVE_SETTINGS.IMG_PRE,i)
            DlgApi.ShowItem(self.this,imgFile,false)
        end
        for _,buttonGfx in ipairs(COSMOS_BUTTON_GFX) do
            DlgApi.ShowItem(self.this,buttonGfx.notReach,false)
            DlgApi.ShowItem(self.this,buttonGfx.burst,false)
            DlgApi.ShowItem(self.this,buttonGfx.flash,false)
        end
        for _,lamp in ipairs(COSMOS_LAMP) do
            DlgApi.ShowItem(self.this,lamp.reach,false)
            DlgApi.ShowItem(self.this,lamp.flash,false)
        end 
    end
end

--根据怒气值比例获取图片index
function Panel_QuickBar:GetCosmosButtonImg(rate)
    if rate < cosmos_burst.COSMOS_ACTIVE_RATE_1 then
        return COSMOS_ACTIVE_SETTINGS.IMG_INDEX_START + math.floor(rate/COSMOS_IMG_GAP1)
    elseif rate < cosmos_burst.COSMOS_ACTIVE_RATE_2 then
        return COSMOS_ACTIVE_SETTINGS.IMG_INDEX_1 + math.floor((rate-cosmos_burst.COSMOS_ACTIVE_RATE_1)/COSMOS_IMG_GAP2)
    elseif rate < cosmos_burst.COSMOS_ACTIVE_RATE_3 then
        return COSMOS_ACTIVE_SETTINGS.IMG_INDEX_2 + math.floor((rate-cosmos_burst.COSMOS_ACTIVE_RATE_2)/COSMOS_IMG_GAP3)
    else
        return COSMOS_ACTIVE_SETTINGS.IMG_COUNT
    end
end
--根据怒气值显示小宇宙按钮聚气图片
--rate:小宇宙怒气值比例
function Panel_QuickBar:UpdateCosmosButtonImage(juqiLevel,rate)
    local imgIndex = nil
    if juqiLevel>cosmos_burst.COSMOS_JUQI_LEVEL.JUQI_NO then
        imgIndex = self:GetCosmosButtonImg(rate)
    end
    if self.showCosmosImgIndex == imgIndex then
        return
    end
    self.showCosmosImgIndex = imgIndex
    for i=1,COSMOS_ACTIVE_SETTINGS.IMG_COUNT do
        local imgFile = Format("%s%02d",COSMOS_ACTIVE_SETTINGS.IMG_PRE,i)
        DlgApi.ShowItem(self.this,imgFile,i == imgIndex)
    end
end
--显示小宇宙按钮特效 juqiLevel:聚气状态,burstLevel:燃烧状态
function Panel_QuickBar:UpdateCosmosButtonGfx(juqiLevel,burstLevel)
    if self.juqiLevel ~= juqiLevel then
        for i,buttonGfx in ipairs(COSMOS_BUTTON_GFX) do
            DlgApi.ShowItem(self.this,buttonGfx.notReach,i == juqiLevel)
        end
    end
    if self.burstLevel ~= burstLevel then
        for i,buttonGfx in ipairs(COSMOS_BUTTON_GFX) do
            DlgApi.ShowItem(self.this,buttonGfx.burst,i == burstLevel)
			if i == burstLevel and DlgApi.IsDialogShow('Panel_GuideCosmos') then --xxp2013-05-13 17:02:12增加小宇宙爆发时关闭小宇宙爆发指引
				DlgApi.ShowDialog('Panel_GuideCosmos', false)
			end
        end
    end
end
--显示小宇宙灯
function Panel_QuickBar:UpdateCosmosLample(canBurstLevel)
    if self.canBurstLevel ~= canBurstLevel then
        for i,lamp in ipairs(COSMOS_LAMP) do
            DlgApi.ShowItem(self.this,lamp.reach,canBurstLevel>=i)
            DlgApi.ShowItem(self.this,lamp.flash,canBurstLevel==i)
        end
    end
end
--播放闪烁特效
function Panel_QuickBar:PlayCosmosBreakFlash(burstLevel)
    if self.burstLevel ~= burstLevel then
        for i,buttonGfx in ipairs(COSMOS_BUTTON_GFX) do
            DlgApi.ShowItem(self.this,buttonGfx.flash,burstLevel==i)
        end
    end
end
