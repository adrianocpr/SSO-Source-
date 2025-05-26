local DlgApi	= DlgApi
local GameApi	= GameApi
local DlgTemplate = DlgTemplate
local Format 	= string.format
local _T = STRING_TABLE
Panel_LeisureTop = DlgTemplate:new({this = "Panel_LeisureTop"})

local PAGE_SIZE		= 32
local LIST_SIZE		= 8
local TOP_MAX		= 2048

local COPPER_TOP	= 1
local SILVER_TOP	= 2
local GOLD_TOP		= 3

-------------------------------------
--		overrides
-------------------------------------
function Panel_LeisureTop:Init()
    self:RegisterEvent("Button_Close",      self.OnCancel)
    self:RegisterEvent("Button_Place",      self.OnMyPlace) 
    self:RegisterEvent("Combo_Team1",     	self.OnSearch) 
    self:RegisterEvent("Button_Pre",        self.PrePage)
    self:RegisterEvent("Button_Next",       self.NextPage)
    
    -- 排行榜类型
	local top_list = {}
	for _, info in ipairs(LeaderBoard.LeisureTop) do
	    table.insert(top_list, info.name)
	end
	DlgApi.SetListText(self.this, "Combo_Team1", top_list)		
	
	-- 分页
	self.TopCurPage = 0
    self.pageMax = 0
    self:SetCurPage(0)    
	
	self.LeisureTime = {}
	for _, range in ipairs(LeaderBoard.LeisureTime) do
	    local _begin = range.begin.hour * 60 + range.begin.minute
	    local _finish= range.finish.hour * 60 + range.finish.minute	    
	    table.insert(self.LeisureTime, {_begin, _finish})    
	end
end


function Panel_LeisureTop:ShowDialog()
    self:RequestMyPosition()
end


local counter = 0
function Panel_LeisureTop:Tick(delay)
    counter = counter + delay
    if counter > 500 then
        counter = 0 
    	DlgApi.ShowItem(self.this, "Label_Tips1", self:IsLeisureChallengeTime())
    end
end


-------------------------------------
--		panel message
-------------------------------------
function Panel_LeisureTop:OnMyPlace() 
    self:RequestMyPosition()
end


function Panel_LeisureTop:OnSearch() 
    self:SetCurPage(0)
    self:RequestCurTopList()
end

function Panel_LeisureTop:PrePage()
    self:SetCurPage(self.TopCurPage-1)
    self:RequestCurTopList()
end

function Panel_LeisureTop:NextPage()
    self:SetCurPage(self.TopCurPage+1)
    self:RequestCurTopList()
end

function Panel_LeisureTop:SetCurPage(page)
    if page < 0 then page = 0 end
    if page > self.pageMax then page = self.pageMax end
    self.TopCurPage = page
    DlgApi.SetItemText(self.this, "Label_Page", Format("%d/%d",page+1,self.pageMax+1))
end

-------------------------------------
--		function call by other
-------------------------------------
function Panel_LeisureTop:OnDataReceived(info)
    self:UpdateTopCombo(info.table_id)
    local pageMore = 0
    if info.max_size%PAGE_SIZE > 0 then pageMore = 1 end
    self.pageMax = info.max_size/PAGE_SIZE + pageMore - 1
    self:SetCurPage(info.page_id)
end


function Panel_LeisureTop:GetCurTopId()
    local table_idx = DlgApi.GetListCurLine(self.this, "Combo_Team1") + 1
    return LeaderBoard.LeisureTop[table_idx] and LeaderBoard.LeisureTop[table_idx].id or COPPER_TOP
end

function Panel_LeisureTop:RefreshChallengeCount()
    local hostTopIdx = self:GetHostTopIdx()
    if not hostTopIdx then
        return
    end
    if self:GetCurTopId() == LeaderBoard.LeisureTop[hostTopIdx].id then
        local challengeCount = GameApi.GetHostPvpChallengeCount()
        if challengeCount then
            DlgApi.SetItemText(self.this,"Label_Tips2",Format(STRING_TABLE.LEISURE_CHALLENGE_REMAIN_COUNT_HINT,challengeCount))
        end
    else
        local hostTopName = LeaderBoard.LeisureTop[hostTopIdx].name
        if hostTopName then
            DlgApi.SetItemText(self.this,"Label_Tips2",Format(STRING_TABLE.LEISURE_CHALLENGE_NOT_FIT_HINT,hostTopName))
        end
    end        
end

-------------------------------------
--		function call by self
-------------------------------------
function Panel_LeisureTop:RequestCurTopList()
    local table_id  = self:GetCurTopId()
    local page_id	= self.TopCurPage > 0 and self.TopCurPage or 0
    GameApi.GetIntimeTopTable(table_id, page_id)
end


function Panel_LeisureTop:RequestMyPosition()
    local table_id = self:GetLeisureTopId()
    GameApi.GetIntimeTopTable(table_id, -1)
end

    
function Panel_LeisureTop:GetHostTopIdx()
    local prop = GameApi.GetHostPropEx()
    local lev_min, lev_max
    for idx, info in ipairs(LeaderBoard.LeisureTop) do
        lev_min = info.roleLevelMin or 0
        lev_max = info.roleLevelMax or 0xffffff
	    if prop.level >= lev_min and prop.level <= lev_max then
	        return idx
	    end
	end
end


function Panel_LeisureTop:GetLeisureTopId()
    local idx = self:GetHostTopIdx()
    if idx then
        return LeaderBoard.LeisureTop[idx] and LeaderBoard.LeisureTop[idx].id
    end
end

function Panel_LeisureTop:UpdateTopCombo(table_id)
    for idx, info in ipairs(LeaderBoard.LeisureTop) do
        if info.id == table_id then
            DlgApi.SetListCurLine(self.this, "Combo_Team1", idx - 1 )
            self:RefreshChallengeCount()
            return
        end
    end
end


function Panel_LeisureTop:IsLeisureChallengeTime()
    local data = GlobalApi.GetServerLocalTime()
    local cur_time = data.hour * 60 + data.min
    for _, range in ipairs(self.LeisureTime) do
        if cur_time >= range[1] and cur_time <= range[2] then
            return true
        end
    end
    return false
end
