local DlgApi		= DlgApi
local DlgApiEx		= DlgApiEx
local GameApi		= GameApi
local DlgTemplate 	= DlgTemplate
local Format 	  	= string.format

HOME_PAGE = 0
WIKI_PAGE = 1
MAP_PAGE = 2
PATCH_PAGE	= 3
DATA_PAGE 	= 4

Panel_Help = DlgTemplate:new({this = "Panel_Help",CurPage = HOME_PAGE})

-------------------------------------
--		overrides
-------------------------------------
function Panel_Help:Init()
    self:RegisterEvent("Button_Close",       	self.OnCancel)      
    self:RegisterEvent("Button_search",      	self.OnSearch)
    self:RegisterEvent("Edit_search",      		self.OnSearch)
    self:RegisterEvent("Button_homePage",		self.OnHomePage)
	self:RegisterEvent("Button_wiki",			self.OnWikiPage)
	self:RegisterEvent("Button_map",			self.OnMapPage)
	self:RegisterEvent("Button_patch",			self.OnPatchPage)
	self:RegisterEvent("Button_data",			self.OnDataPage) 
	
	
	Panel_Help:SetPage(HOME_PAGE)
end

function Panel_Help:OnSearch()
	local strKey = DlgApi.GetItemText(self.this,"Edit_search")
	if strKey~=nil and strKey~="" then
		DlgApiEx.SetDialogInSubDialogItem("Panel_Help","Sub_help","Panel_HelpResult") 
		if self.CurPage == HOME_PAGE then	--	全类搜索 
			Panel_Help:OnSearchAll(strKey,HELP_PAGE_HOME)
    	elseif  self.CurPage == WIKI_PAGE then -- 仅百科搜索
   			Panel_Help:OnSearchAll(strKey,HELP_PAGE_WIKI)
    	elseif  self.CurPage == MAP_PAGE then -- 仅地图搜索
    		Panel_Help:OnSearchAll(strKey,HELP_PAGE_MAP)
    	elseif  self.CurPage == PATCH_PAGE then -- 仅更新搜索
      		Panel_Help:OnSearchAll(strKey,HELP_PAGE_PATCH)
    	elseif  self.CurPage == DATA_PAGE then -- 仅数据搜索 
      		Panel_Help:OnSearchAll(strKey,HELP_PAGE_DATA)   
    	else
    	
    	end
	end
	DlgApi.SetItemText(self.this,"Edit_search","")
end

function Panel_Help:OnHomePage()
    Panel_Help:SetPage(HOME_PAGE)
end

function Panel_Help:OnWikiPage()
    Panel_Help:SetPage(WIKI_PAGE)
end

function Panel_Help:OnMapPage()
    Panel_Help:SetPage(MAP_PAGE)
end

function Panel_Help:OnPatchPage()
    Panel_Help:SetPage(PATCH_PAGE)
end

function Panel_Help:OnDataPage()
    Panel_Help:SetPage(DATA_PAGE)
end

function Panel_Help:SetPage(page)
	self.CurPage = page
    if self.CurPage == HOME_PAGE then
		DlgApiEx.SetDialogInSubDialogItem("Panel_Help","Sub_help","Panel_helpHomePage")  
		Panel_Help:CreateNavigation(HELP_PAGE_HOME,-1) 
    elseif  self.CurPage == WIKI_PAGE then
    	DlgApiEx.SetDialogInSubDialogItem("Panel_Help","Sub_help","Panel_HelpResult") 
    	Panel_Help:CreateNavigation(HELP_PAGE_WIKI,-1)   
    	Panel_HelpResult:UpdateRootDir(HELP_PAGE_WIKI)     
    elseif  self.CurPage == MAP_PAGE then
    	DlgApiEx.SetDialogInSubDialogItem("Panel_Help","Sub_help","Panel_HelpResult")  
    	Panel_Help:CreateNavigation(HELP_PAGE_MAP,-1)  
    	Panel_HelpResult:UpdateRootDir(HELP_PAGE_MAP)      
    elseif  self.CurPage == PATCH_PAGE then
    	DlgApiEx.SetDialogInSubDialogItem("Panel_Help","Sub_help","Panel_HelpResult")  
    	Panel_Help:CreateNavigation(HELP_PAGE_PATCH,-1) 
    	Panel_HelpResult:UpdateRootDir(HELP_PAGE_PATCH)       
    elseif  self.CurPage == DATA_PAGE then
    	DlgApiEx.SetDialogInSubDialogItem("Panel_Help","Sub_help","Panel_HelpResult") 
    	Panel_Help:CreateNavigation(HELP_PAGE_DATA,-1)   
    	Panel_HelpResult:UpdateRootDir(HELP_PAGE_DATA)      
    else
    	DlgApiEx.SetDialogInSubDialogItem("Panel_Help","Sub_help")   
    	Panel_Help:CreateNavigation(nil,-1) 
    end
end

function Panel_Help:GetCurPage()
	return self.CurPage
end

function Panel_Help:ShowDialog()
end

function Panel_Help:HideDialog()
end

--- 创建导航栏
function Panel_Help:CreateNavigation(id,param)
	local strNav = ""
	local tempId = id
	while HELPINFO[tempId]~=nil do
		local strTemp = DlgApiEx.GetItemLinkStr(HELPINFO[tempId].title,HELPINFO[tempId].kind,tempId,param,255,255,255,255)..strNav
		if HELPINFO[tempId].father~=nil and HELPINFO[tempId].father~=0 then
			tempId = HELPINFO[tempId].father
			strNav = "\\"..strTemp
		else
			strNav = ".\\"..strTemp
			break
		end
	end
	DlgApi.SetItemText(self.this,"Text_navigation",strNav)
end

--- 响应点击导航栏
function Panel_Help:OnNavigationClick(kind,id,param)
	if id==HELP_PAGE_HOME then Panel_Help:SetPage(HOME_PAGE) end
	if id==HELP_PAGE_WIKI then Panel_Help:SetPage(WIKI_PAGE) end
	if id==HELP_PAGE_MAP then Panel_Help:SetPage(MAP_PAGE) end
	if id==HELP_PAGE_DATA then Panel_Help:SetPage(DATA_PAGE) end
	if id==HELP_PAGE_PATCH then Panel_Help:SetPage(PATCH_PAGE) end
	if Panel_HelpResult~=nil then
		Panel_HelpResult:OnLinkClick(kind,id,-1)
	end
end

--- 搜索HELPINFO表
function Panel_Help:OnSearchAll(strKey,iPage)
	Panel_Help:CreateNavigation(iPage,-1) 
	local dataTab = {}
	local n = 0
	local idx = n+1
	--- 搜索数据
	--- 先从标签搜索
	if iPage==HELP_PAGE_HOME or iPage==HELP_PAGE_DATA  then
		local _E_TAB = {}--data数据
		for _, info in pairs(HELP_ELEMENTDATA) do
			if info.tag~=nil then
				for i, tag in pairs(info.tag) do
					if HELP_TAG[tag]~=nil and string.find(HELP_TAG[tag].Value,strKey) then
						_E_TAB[_] = 1
					end
				end
			end      
		end
		local _T_TAB = {}--任务
		for _, info in pairs(HELP_TASKDATA) do
			if info.tag~=nil then
				for i, tag in pairs(info.tag) do
					if HELP_TAG[tag]~=nil and string.find(HELP_TAG[tag].Value,strKey) then
						_T_TAB[_] = 1
					end
				end
			end      
		end
		local _S_TAB = {}--技能
		for _, info in pairs(HELP_SKILLDATA) do
			if info.tag~=nil then
				for i, tag in pairs(info.tag) do
					if HELP_TAG[tag]~=nil and string.find(HELP_TAG[tag].Value,strKey) then
						_S_TAB[_] = 1
					end
				end
			end      
		end
		-- 标签搜索结束 结果存入3个表中

		dataTab = GameApi.GetDateManForHelp(-1,strKey) -- 按名称搜索的结果加入dataTab表中
		for _, info in pairs(dataTab) do -- 混入脚本中配置的权重
			if info.id==HELP_DATA_SKILL then
				if HELP_SKILLDATA[info.param]~=nil then 
					if HELP_SKILLDATA[info.param].w~=nil then dataTab[_].w = HELP_SKILLDATA[info.param].w end
					--if HELP_SKILLDATA[info.param].tag~=nil then dataTab[_].tag = HELP_SKILLDATA[info.param].tag end
					--if HELP_SKILLDATA[info.param].desc~=nil then dataTab[_].desc = HELP_SKILLDATA[info.param].desc end
					if _S_TAB[info.param]~=nil then _S_TAB[info.param]=nil end -- 搜索结果重复了
				end
			elseif info.id==HELP_DATA_TASK then
				if HELP_TASKDATA[info.param]~=nil then 
					if HELP_TASKDATA[info.param].w~=nil then dataTab[_].w = HELP_TASKDATA[info.param].w end
					--if HELP_TASKDATA[info.param].tag~=nil then dataTab[_].tag = HELP_TASKDATA[info.param].tag end
					--if HELP_TASKDATA[info.param].desc~=nil then dataTab[_].desc = HELP_TASKDATA[info.param].desc end
					if _T_TAB[info.param]~=nil then _T_TAB[info.param]=nil end -- 搜索结果重复了
				end
			elseif HELP_ELEMENTDATA[info.param]~=nil then
				if HELP_ELEMENTDATA[info.param].w~=nil then dataTab[_].w = HELP_ELEMENTDATA[info.param].w end 
				--if HELP_ELEMENTDATA[info.param].tag~=nil then dataTab[_].tag = HELP_ELEMENTDATA[info.param].tag end 
				--if HELP_ELEMENTDATA[info.param].desc~=nil then dataTab[_].desc = HELP_ELEMENTDATA[info.param].desc end 
				if _E_TAB[info.param]~=nil then _E_TAB[info.param]=nil end -- 搜索结果重复了
			end
		end
		n = table.getn(dataTab)
		idx = n+1
		for _, info in pairs(_E_TAB) do
			if info~=nil then
				local da = GameApi.GetADateForHelp(-1,_) -- -1这里只表示 除技能和任务以外的类别 真正类别等返回值的kind
				if da~=nil then 
					local _tp = {name=da.name,kind=HELP_PAGE_DATA,id=da.id,param=_, w=HELP_ELEMENTDATA[_].w}
					dataTab[idx] = _tp
					idx = idx+1
				end
			end      
		end
		for _, info in pairs(_T_TAB) do
			if info~=nil then
				local da = GameApi.GetADateForHelp(HELP_DATA_TASK,_)
				if da~=nil then 
					local _tp = {name=da.name,kind=HELP_PAGE_DATA,id=da.id,param=_, w=HELP_TASKDATA[_].w}
					dataTab[idx] = _tp
					idx = idx+1
				end
			end      
		end
		for _, info in pairs(_S_TAB) do
			if info~=nil then
				local da = GameApi.GetADateForHelp(HELP_DATA_SKILL,_)
				if da~=nil then 
					local _tp = {name=da.name,kind=HELP_PAGE_DATA,id=da.id,param=_, w=HELP_SKILLDATA[_].w}
					dataTab[idx] = _tp
					idx = idx+1
				end
			end      
		end
	end -------------------------------------------------------------------

	n = table.getn(dataTab)
	idx = n+1
	for _, info in pairs(HELPINFO) do
		if iPage==HELP_PAGE_HOME or iPage==info.kind  then
			if string.find(info.title,strKey) then
				local _tp = {name=info.title,kind=info.kind,id=_,param=-1,w=info.w}
				dataTab[idx] = _tp
				idx = idx+1
			elseif info.tag~=nil then
				for i, tag in pairs(info.tag) do
					if HELP_TAG[tag]~=nil and string.find(HELP_TAG[tag].Value,strKey) then
						local _tp = {name=info.title,kind=info.kind,id=_,param=-1, w=info.w}
						dataTab[idx] = _tp
						idx = idx+1
					end
				end
			end 
		end      
	end	
	Panel_HelpResult:UpdateSearchResult(dataTab,true)
end

--- 系统调用 取得数据的子索引
function Panel_Help:GetDataIndex()
	return HELP_DATA_NPC,HELP_DATA_MINE,HELP_DATA_MONSTER,HELP_DATA_BOOK,HELP_DATA_MATTER,HELP_DATA_EQUIP,HELP_DATA_TASK,HELP_DATA_SKILL
end 

function Panel_Help:GetDataPageIndex()
	return HELP_PAGE_DATA
end 

-- 取得配置文件的权重
function Panel_Help:GetItemW(kind,id,param)
	if HELPINFO[id]==nil or HELPINFO[id].kind~=kind then return 0,0  end 
	local w=0
	if kind==HELP_PAGE_DATA then
		local da
		if id==HELP_DATA_TASK then
			da = GameApi.GetADateForHelp(HELP_DATA_TASK,param)
			if HELP_TASKDATA[param]~=nil and HELP_TASKDATA[param].w~=nil then w = HELP_TASKDATA[param].w end
		elseif id==HELP_DATA_SKILL then
			da = GameApi.GetADateForHelp(HELP_DATA_SKILL,param)
			if HELP_SKILLDATA[param]~=nil and HELP_SKILLDATA[param].w~=nil then w = HELP_SKILLDATA[param].w end
		else
			da = GameApi.GetADateForHelp(-1,param)
			if HELP_ELEMENTDATA[param]~=nil and HELP_ELEMENTDATA[param].w~=nil then w = HELP_ELEMENTDATA[param].w end
		end
		if da==nil then  return 0,0 end
		return 1,w
	else
		if HELPINFO[id].desc==nil then return 0,0 end -- 因为不是叶子节点 所以不用
		if HELPINFO[id].w~=nil then w = HELPINFO[id].w end
		return 1,w
	end
end 

function Panel_Help:GetItemName(kind,id,param)
	if HELPINFO[id]==nil or HELPINFO[id].kind~=kind then return ""  end 
	if kind==HELP_PAGE_DATA then
		local da
		if id==HELP_DATA_TASK then
			da = GameApi.GetADateForHelp(HELP_DATA_TASK,param)
		elseif id==HELP_DATA_SKILL then
			da = GameApi.GetADateForHelp(HELP_DATA_SKILL,param)
		else
			da = GameApi.GetADateForHelp(-1,param)
		end
		if da==nil then  return "" end
		return da.name
	else
		return HELPINFO[id].title
	end
end

function Panel_Help:OnGuide(filename)
	if filename~=nil and HELP_DIALOG[filename]~=nil and HELP_DIALOG[filename].value~=nil and  HELPINFO[HELP_DIALOG[filename].value]~=nil then
		Panel_Help:SetPage(HELP_PAGE_WIKI)
		Panel_HelpResult:OnLinkClick(HELPINFO[HELP_DIALOG[filename].value].kind,HELP_DIALOG[filename].value,-1)
	else
		Panel_Help:SetPage(HOME_PAGE)
	end 
end