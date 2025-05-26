local DlgApi		= DlgApi
local DlgApiEx		= DlgApiEx
local GameApi		= GameApi
local DlgTemplate 	= DlgTemplate
local Format 	  	= string.format
local Insert		= table.insert

Panel_HelpResult	= DlgTemplate:new({this = "Panel_HelpResult",iLinesPerPage = 200, iCurPage = 1, iMaxPage = 1,retTab = {},bFind = false,hostinfo = nil})

---排序
local sortFunc = function(a,b) 
	local aw = 0
	local bw = 0
	if HELPINFO[a] ~= nil and HELPINFO[a].w ~= nil then aw = HELPINFO[a].w end
	if HELPINFO[b] ~= nil and HELPINFO[b].w ~= nil then bw = HELPINFO[b].w end
	return bw<aw
end

---排序
local sortFunc1 = function(a,b) 
	local aw = 0
	local bw = 0
	if a.w ~= nil then aw = a.w end
	if b.w ~= nil then bw = b.w end
	return bw<aw
end
 
---取整数部分 
function getIntPart(x)
	if x <= 0 then
	   return math.ceil(x)
	end
	
	if math.ceil(x) == x then
	   x = math.ceil(x)
	else
	   x = math.ceil(x) - 1
	end
	return x
end


-------------------------------------
--		overrides
-------------------------------------
function Panel_HelpResult:Init()
	self:RegisterEvent("Button_Pre",       	self.OnBtnPrev)
	self:RegisterEvent("Button_Next",       	self.OnBtnNext)        	
end

function Panel_HelpResult:ShowDialog()

end

function Panel_HelpResult:HideDialog()

end


--- 条件判断
function Panel_HelpResult:CheckCondition(info)
	
	if info.cdn~=nil and HELP_CONDITION~=nil and HELP_CONDITION[info.cdn]~=nil then
		-- 级别
		if HELP_CONDITION[info.cdn].minLv~=nil and HELP_CONDITION[info.cdn].maxLv~=nil and self.hostinfo.level~=nil then
			if self.hostinfo.level<HELP_CONDITION[info.cdn].minLv or self.hostinfo.level>HELP_CONDITION[info.cdn].maxLv then return 0 end 
		end
		-- 性别
		if HELP_CONDITION[info.cdn].gender~=nil and self.hostinfo.gender~=nil then
			if  self.hostinfo.gender~= HELP_CONDITION[info.cdn].gender then return 0 end 
		end
		-- 职业
		if HELP_CONDITION[info.cdn].pro~=nil and self.hostinfo.profession~=nil then
			if  self.hostinfo.profession~= HELP_CONDITION[info.cdn].pro then return 0 end 
		end
		-- VIP
		if HELP_CONDITION[info.cdn].minvip~=nil and HELP_CONDITION[info.cdn].maxvip~=nil and self.hostinfo.vip~=nil then
			if self.hostinfo.vip<HELP_CONDITION[info.cdn].minvip or self.hostinfo.vip>HELP_CONDITION[info.cdn].maxvip then return 0 end 
		end
		-- 军团
		if HELP_CONDITION[info.cdn].league~=nil and self.hostinfo.league~=nil then
			if  self.hostinfo.league~= HELP_CONDITION[info.cdn].league then return 0  end
		end 
	end
	return 1
end

--- 更新根目录
function Panel_HelpResult:UpdateRootDir(id)
	self.hostinfo = GameApi.GetHostPropEx()
	DlgApi.SetItemText(self.this,"Text_InviteIntro","")
	local num = 0
	local tempTab = {}
	local idx = 1
	local r 
	local g
	local b
	for _, info in pairs(HELPINFO) do
   	if info.father == id and Panel_HelpResult:CheckCondition(info)==1 then 
   		tempTab[idx] = _
			idx = idx+1
   		num = num+1
    end        
 	end
 	table.sort(tempTab,sortFunc)
 	for _, i in pairs(tempTab) do
 		if HELP_COLOR~=nil and HELPINFO[i].w~=nil and HELPINFO[i].w>=0 and HELPINFO[i].w<=4 then
 			r = HELP_COLOR[HELPINFO[i].w].r
 			g = HELP_COLOR[HELPINFO[i].w].g
 			b = HELP_COLOR[HELPINFO[i].w].b
 		else
 			r = 255
 			g = 255
 			b = 255
 		end
 		DlgApi.AppendItemText(self.this,"Text_InviteIntro",DlgApiEx.GetItemLinkStr(HELPINFO[i].title,HELPINFO[i].kind,i,-1,r,g,b,255).."\r")
 	end
 	DlgApi.SetItemText(self.this,"Label_result",Format(STRING_TABLE.STF_HELP_SEARCH_0,num))
	DlgApi.SetItemText( self.this,"Label_Page", "1/1" )
	DlgApi.EnableItem( self.this, "Button_Pre", false )
	DlgApi.EnableItem( self.this, "Button_Next", false )
end


--- 响应点击NPC
function Panel_HelpResult:OnLinkClickNPC(kind,id,param)
	local npcInfo = GameApi.GetHelpNPC(kind,id,param)
	if not npcInfo then return end
	DlgApi.SetItemText(self.this,"Label_result",npcInfo.name)
	
	local list = {}
	Insert(list, npcInfo.name)
	Insert(list, npcInfo.pref_pro ~= "" and npcInfo.pref_pro or nil)	-- 名字前缀
	Insert(list, npcInfo.post_pro ~= "" and npcInfo.post_pro or nil)	-- 名字前缀
	
	-- 服务-------------------------------------------------------------------------------
	do 
    	local tag = 0
    	for _, service in pairs(npcInfo.server_arr) do
    		if tag == 0 then
    			tag = 1
    			Insert(list, "")
    			Insert(list, STRING_TABLE.STF_HELP_NPC)
    			Insert(list, service)
    		else
    		    Insert(list, ","..service)
    		end
     	end
     	if tag==1 then Insert(list, "") end
 	end
 	
 	--发放任务------------------------------------------------------------------------------------------
 	do
 		local tag = 0
 		local st_st = ""
     	for _, v in pairs(npcInfo.task_out) do
     	    st_st = ""     		
     		if v.task_state ==1 then -- 已接
     			st_st = STRING_TABLE.STF_HELP_NPC_3
     		elseif v.task_state ==2 then -- 完成
     			st_st = STRING_TABLE.STF_HELP_NPC_4
     		end
    		if tag == 0 then
    			tag = 1
    			Insert(list, "")
    			Insert(list, STRING_TABLE.STF_HELP_NPC_6)
    			Insert(list, DlgApiEx.GetItemLinkStr(v.tast_name,HELP_PAGE_DATA,HELP_DATA_TASK,v.tast_id,255,255,255,255)..st_st)
    		else
    		    Insert(list, ","..DlgApiEx.GetItemLinkStr(v.tast_name,HELP_PAGE_DATA,HELP_DATA_TASK,v.tast_id,255,255,255,255)..st_st)
    		end
     	end
     	if tag==1 then Insert(list, "") end
 	end
 	
 	--验证完成任务------------------------------------------------------------------------------------------
 	do
     	local tag = 0
     	local st_st = ""
     	for _, v in pairs(npcInfo.task_in) do
     		st_st = ""
     		if v.task_state ==1 then -- 已接
     			st_st = STRING_TABLE.STF_HELP_NPC_3
     		elseif v.task_state ==2 then -- 完成
     			st_st = STRING_TABLE.STF_HELP_NPC_4
     		end
    		if tag==0 then
    			tag = 1
    			Insert(list, "")
    			Insert(list, STRING_TABLE.STF_HELP_NPC_7)
    			Insert(list, DlgApiEx.GetItemLinkStr(v.tast_name,HELP_PAGE_DATA,HELP_DATA_TASK,v.tast_id,255,255,255,255)..st_st)
    		else
    		    Insert(list, ","..DlgApiEx.GetItemLinkStr(v.tast_name,HELP_PAGE_DATA,HELP_DATA_TASK,v.tast_id,255,255,255,255)..st_st)
    		end
     	end
     	if tag==1 then Insert(list, "") end
 	end
 	
 	-- 补充说明文字
 	if HELP_ELEMENTDATA[tid] ~= nil and HELP_ELEMENTDATA[tid].desc ~= nil then  
 	    Insert(list, "")
 	    Insert(list, "^O000^ffffff"..HELP_ELEMENTDATA[tid].desc)
 	end
 	local str = table.concat(list, "\r")
 	DlgApi.AppendItemText(self.this,"Text_InviteIntro", format_string:parse(str))-- 名称	
end


--- 响应点击矿
function Panel_HelpResult:OnLinkClickMine(kind, id, param)
	local mineInfo = GameApi.GetHelpMine(kind,id,param)
	if not mineInfo then return end
	DlgApi.SetItemText(self.this,"Label_result",mineInfo.name)
	
	local list = {}
	Insert(list, mineInfo.name)
	Insert(list, "")	

	if mineInfo.level_required ~= nil then-- 等级需求
		Insert(list, Format(STRING_TABLE.STF_HELP_MINE_1, format_string:player_lev(mineInfo.level_required) ))
	end
	if mineInfo.id_equipment_required ~= nil then -- 需要工具
		Insert(list, "")
		Insert(list, STRING_TABLE.STF_HELP_MINE_2)	
		Insert(list, DlgApiEx.GetItemLinkStr(mineInfo.name_equipment_required,HELP_PAGE_DATA,HELP_DATA_MATTER,mineInfo.id_equipment_required,255,255,255,255))
	end
	if mineInfo.need_live_skill_id ~= nil then -- 需要的生活技能
		Insert(list, "")
		Insert(list, STRING_TABLE.STF_HELP_MINE_3)	
		local need_live_skill_lvl = Format("(Lv.%d)",mineInfo.need_live_skill_lvl)
		Insert(list, DlgApiEx.GetItemLinkStr(mineInfo.need_live_skill_name,HELP_PAGE_DATA,HELP_DATA_SKILL,mineInfo.mineInfo.need_live_skill_id ,255,255,255,255)..need_live_skill_lvl)	
	end
	if mineInfo.task_in ~= nil then -- 需要的任务
		Insert(list, "")
		Insert(list, STRING_TABLE.STF_HELP_MINE_4)	
		Insert(list, DlgApiEx.GetItemLinkStr(mineInfo.name_task_in,HELP_PAGE_DATA,HELP_DATA_TASK,mineInfo.task_in,255,255,255,255))
	end
	--掉落
	do 
    	local tag = 0
     	for _, v in pairs(mineInfo.drop_table) do
    		if tag==0 then
    			tag = 1
    			Insert(list, "")
    			Insert(list, STRING_TABLE.STF_HELP_MINE_5)
    			Insert(list, DlgApiEx.GetItemLinkStr(v.drop_name,HELP_PAGE_DATA,HELP_DATA_MATTER,v.drop_id,255,255,255,255))
    		else
    		    Insert(list, ","..DlgApiEx.GetItemLinkStr(v.drop_name,HELP_PAGE_DATA,HELP_DATA_MATTER,v.drop_id,255,255,255,255))
    		end
     	end
	end

	Insert(list, "")
	Insert(list, STRING_TABLE.STF_HELP_MINE_0)
	-- 介绍
	Insert(list, mineInfo.desc)
	
	-- 补充说明文字
	if HELP_ELEMENTDATA[tid]~=nil and HELP_ELEMENTDATA[tid].desc~=nil then  
	    Insert(list, "")
	    Insert(list, "^O000^ffffff"..HELP_ELEMENTDATA[tid].desc.."\r")
 	end 	
 	
 	local str = table.concat(list, "\r")
 	DlgApi.SetItemText(self.this,"Text_InviteIntro", format_string:parse(str))
end


--- 响应点击怪物
function Panel_HelpResult:OnLinkClickMonster(kind,id,param)
	local monsterInfo = GameApi.GetHelpMonster(kind,id,param)
	if not monsterInfo then return end	
	DlgApi.SetItemText(self.this,"Label_result",monsterInfo.name)
	
	local list = {}
	Insert(list, monsterInfo.name)
	if monsterInfo.title~=nil then
	    Insert(list, "")
		Insert(list, STRING_TABLE.STF_HELP_MONSTER_0)
		Insert(list, monsterInfo.title)-- 称号
	end	
	if monsterInfo.prop~=nil then 
	    Insert(list, "")
		Insert(list, STRING_TABLE.STF_HELP_MONSTER_1)
		Insert(list, monsterInfo.prop)-- 属性"
	end
	Insert(list, "")
	Insert(list, STRING_TABLE.STF_HELP_MONSTER_3)
	Insert(list, Format("%d",monsterInfo.hp)) -- 生命值		
	--掉落
	do
    	tag = 0
     	for _, v in pairs(monsterInfo.drop_table) do
    		if tag==0 then
    			tag = 1
    			Insert(list, "")
				Insert(list, STRING_TABLE.STF_HELP_MONSTER_4)
				Insert(list, DlgApiEx.GetItemLinkStr(v.drop_name,HELP_PAGE_DATA,HELP_DATA_MATTER,v.drop_id,255,255,255,255))
    		else
    		    Insert(list, ","..DlgApiEx.GetItemLinkStr(v.drop_name,HELP_PAGE_DATA,HELP_DATA_MATTER,v.drop_id,255,255,255,255))
    		end
     	end
	end
	if monsterInfo.description~=nil then 
	    Insert(list, "")
		Insert(list, STRING_TABLE.STF_HELP_MONSTER_2)
		Insert(list, monsterInfo.description) -- 说明
	end	
	-- 补充说明文字
	if HELP_ELEMENTDATA[id]~=nil and HELP_ELEMENTDATA[id].desc~=nil then 
	    Insert(list, "")
		Insert(list, "^O000^ffffff"..HELP_ELEMENTDATA[id].desc)
 	end
 	
 	local str = table.concat(list, "\r")
 	DlgApi.SetItemText(self.this,"Text_InviteIntro", format_string:parse(str))
end


--- 响应点击物品
function Panel_HelpResult:OnLinkClickItem(kind, id, param)
	local itemInfo = GameApi.GetHelpItem(kind, id, param)
	if not itemInfo then return end	
	DlgApi.SetItemText(self.this,"Label_result",itemInfo.name)
	
	local list = {}
	local base, desc_list = LuaItemDesc:GetItemDesc(itemInfo.cid, itemInfo)
	Insert(list, base)
	-- 补充说明文字
	if HELP_ELEMENTDATA[id]~=nil and HELP_ELEMENTDATA[id].desc~=nil then  
	    Insert(list, "")
		Insert(list, "^O000^ffffff"..HELP_ELEMENTDATA[id].desc)
 	end
 	
 	local str = table.concat(list, "\r")
 	DlgApi.SetItemText(self.this,"Text_InviteIntro", format_string:parse(str))
end


--- 响应点击Skill
function Panel_HelpResult:OnLinkClickSkill(kind,id,param)
	local skillInfo = GameApi.GetHelpSkill(kind,id,param)
	if not skillInfo then return end
	DlgApi.SetItemText(self.this,"Label_result",skillInfo.name)
	
	local list = {}
	Insert(list, skillInfo.icon.." ^O053"..skillInfo.name.."^O000")
	Insert(list, "")
	Insert(list, STRING_TABLE.STF_HELP_SKILL_0)
	Insert(list, skillInfo.detail)
	-- 补充说明文字
	if HELP_SKILLDATA[id]~=nil and HELP_SKILLDATA[id].desc~=nil then  
		Insert(list, "")
		Insert(list, "^O000^ffffff"..HELP_SKILLDATA[id].desc)
 	end
 	
 	local str = table.concat(list, "\r")
 	DlgApi.SetItemText(self.this,"Text_InviteIntro", format_string:parse(str))
end


--- 响应点击Task
function Panel_HelpResult:OnLinkClickTask(kind,id,param)
	local taskInfo = GameApi.GetHelpTask(kind,id,param)
	if not taskInfo then return end	
	DlgApi.SetItemText(self.this,"Label_result",taskInfo.name)
	
	local list = {}	
	Insert(list, taskInfo.name) -- 任务名称
	Insert(list, "")
	Insert(list, STRING_TABLE.STF_HELP_TASK_0)
	Insert(list, taskInfo.detail)	-- 介绍
	if taskInfo.npc_source~=nil then -- 发放NPC
		Insert(list, "")
		Insert(list, STRING_TABLE.STF_HELP_TASK_1)
		Insert(list, DlgApiEx.GetItemLinkStr(taskInfo.npc_source,HELP_PAGE_DATA,HELP_DATA_NPC,taskInfo.npc_source_tid,255,255,255,255))
	end
	if taskInfo.npc_award~=nil then -- 验证NPC
		Insert(list, "")
		Insert(list, STRING_TABLE.STF_HELP_TASK_2)
		Insert(list, DlgApiEx.GetItemLinkStr(taskInfo.npc_award,HELP_PAGE_DATA,HELP_DATA_NPC,taskInfo.npc_award_tid,255,255,255,255))
	end
	
	do
    	local tag = 0
    	local st_st = ""
     	for _, v in pairs(taskInfo.task_sub) do
     		st_st = ""
     		if v.task_state ==1 then -- 已接
     			st_st = STRING_TABLE.STF_HELP_NPC_3
     		elseif v.task_state ==2 then -- 完成
     			st_st = STRING_TABLE.STF_HELP_NPC_4
     		end
    		if tag==0 then
    			tag = 1
    			Insert(list, "")
				Insert(list, STRING_TABLE.STF_HELP_TASK_3)
				Insert(list, DlgApiEx.GetItemLinkStr(v.tast_name,HELP_PAGE_DATA,HELP_DATA_TASK,v.tast_id,255,255,255,255)..st_st)
    		else
    		    Insert(list, ","..DlgApiEx.GetItemLinkStr(v.tast_name,HELP_PAGE_DATA,HELP_DATA_TASK,v.tast_id,255,255,255,255)..st_st)
    		end
     	end
	end 	
 	-- 补充说明文字
 	if HELP_TASKDATA[id]~=nil and HELP_TASKDATA[id].desc~=nil then  
 	    Insert(list, "")
		Insert(list, "^O000^ffffff"..HELP_TASKDATA[id].desc)
 	end
	
	local str = table.concat(list, "\r")
 	DlgApi.SetItemText(self.this,"Text_InviteIntro", format_string:parse(str))
end


--- 响应点击
function Panel_HelpResult:OnLinkClick(kind,id,param)
	Panel_Help:CreateNavigation(id,param)
	DlgApi.SetItemText(self.this,"Text_InviteIntro","")
	DlgApi.SetItemText(self.this,"Label_result","")

	--- 对配置文件的操作 HelpSearchTable.lua
	if kind ~= HELP_PAGE_DATA and HELPINFO[id] ~= nil and HELPINFO[id].desc ~= nil and HELPINFO[id].desc ~= "" then
		-- 修改导航为上一级
		if HELPINFO[id].father~=nil and HELPINFO[id].father~=0 and HELPINFO[HELPINFO[id].father]~=nil then 
		    Panel_Help:CreateNavigation(HELPINFO[id].father,-1) 
		end
		
		local list = {}
		if HELPINFO[id].map~=nil then
			local mapname = HELPINFO[id].title
			local markicon = HELPINFO[id].map.mark
			local mid = HELPINFO[id].map.id
			local x = HELPINFO[id].map.x
			local y = HELPINFO[id].map.y
			local z = HELPINFO[id].map.z
			if HELPINFO[id].map.text~=nil then 
			    mapname = HELPINFO[id].map.text 
			end
			Insert(list, STRING_TABLE.STF_HELP_MAP_0..DlgApiEx.GetMapLinkStr(mapname,markicon,mid,x,y,z,255,255,255,255))
		end
		Insert(list, HELPINFO[id].desc)
		local str = table.concat(list, "\r")
		DlgApi.SetItemText(self.this,"Text_InviteIntro", format_string:parse(str))
		DlgApi.SetItemText(self.this,"Label_result",HELPINFO[id].title..":")
		GameApi.RecordHabitForHelp(kind,id,param)
		return 
	end
	
	--- 如果是数据NPC
	if param~=-1 and kind==HELP_PAGE_DATA and id ==HELP_DATA_NPC then
		self:OnLinkClickNPC(kind,id,param)
		GameApi.RecordHabitForHelp(kind,id,param)
		return 
	end
	
	--- 如果是数据矿
	if param~=-1 and kind==HELP_PAGE_DATA and id ==HELP_DATA_MINE then
		self:OnLinkClickMine(kind,id,param)
		GameApi.RecordHabitForHelp(kind,id,param)
		return 
	end
	
	--- 如果是数据怪物
	if param~=-1 and kind==HELP_PAGE_DATA and id ==HELP_DATA_MONSTER then
		self:OnLinkClickMonster(kind,id,param)
		GameApi.RecordHabitForHelp(kind,id,param)
		return 
	end
	
	--- 如果是配方卷轴 物品 装备
	if param~=-1 and kind==HELP_PAGE_DATA then
		if id==HELP_DATA_BOOK or id==HELP_DATA_MATTER or id==HELP_DATA_EQUIP then
			self:OnLinkClickItem(kind,id,param)
			GameApi.RecordHabitForHelp(kind,id,param)
			return 
		end
	end
	
	--- 如果是数据技能
	if param~=-1 and kind==HELP_PAGE_DATA and id ==HELP_DATA_SKILL then
		self:OnLinkClickSkill(kind,id,param)
		GameApi.RecordHabitForHelp(kind,id,param)
		return 
	end
	
	--- 如果是数据Task
	if param~=-1 and kind==HELP_PAGE_DATA and id ==HELP_DATA_TASK then
		self:OnLinkClickTask(kind,id,param)
		GameApi.RecordHabitForHelp(kind,id,param)
		return 
	end

 	--- 如果是数据类 需要对 elementdata task skill资源操作	
	local dataTab = {}
	if kind==HELP_PAGE_DATA then
		dataTab = GameApi.GetDateManForHelp(id,"")
		for _, info in pairs(dataTab) do -- 混入脚本中配置的权重
			if info.id==HELP_DATA_SKILL then
				if HELP_SKILLDATA[info.param]~=nil and HELP_SKILLDATA[info.param].w~=nil then dataTab[_].w = HELP_SKILLDATA[info.param].w end
			elseif info.id==HELP_DATA_TASK then
				if HELP_TASKDATA[info.param]~=nil and HELP_TASKDATA[info.param].w~=nil then dataTab[_].w = HELP_TASKDATA[info.param].w end
			elseif HELP_ELEMENTDATA[info.param]~=nil and HELP_ELEMENTDATA[info.param].w~=nil then
				dataTab[_].w = HELP_ELEMENTDATA[info.param].w
			end
		end
	end

	if param==-1 then --点击的是目录
		local n = table.getn(dataTab)
		local idx = n+1
		for _, info in pairs(HELPINFO) do
			if info.father == id then 
				local _tp = {name=info.title,kind=info.kind,id=_,param=-1,w=info.w}
				dataTab[idx] = _tp
				idx = idx+1
			end      
		end	
	end
	Panel_HelpResult:UpdateSearchResult(dataTab,false)
end


--- 显示查询结果
function Panel_HelpResult:UpdateSearchResult(dataTab,bFind)
	self.bFind = bFind
	self.retTab = {}
	local n = 0
	local idx = n+1

	self.hostinfo = GameApi.GetHostPropEx() 
	for _, info in pairs(dataTab) do if 
		Panel_HelpResult:CheckCondition(info)==1 then 
			self.retTab[idx] = info 
			idx = idx+1 
		end
 
	end	

	table.sort(self.retTab,sortFunc1)
 	
	local num = table.getn(self.retTab) 
	self.iCurPage = 1 
	self.iMaxPage = getIntPart( num / (self.iLinesPerPage+1) + 1 ) 
	if num~=0 then 
		DlgApi.SetItemText(self.this,"Label_result",Format(STRING_TABLE.STF_HELP_SEARCH_0,num)) 
	elseif bFind==true then 
		DlgApi.SetItemText(self.this,"Label_result",STRING_TABLE.STF_HELP_SEARCH_1) 
	end 
	Panel_HelpResult:OnPage() 
end

function Panel_HelpResult:OnPage()
	if DlgApi.IsDialogShow(self.this) then DlgApi.ChangeFocus(self.this,"Text_InviteIntro") end
	DlgApi.SetItemText(self.this,"Text_InviteIntro","")
	local str = Format( "%d/%d", self.iCurPage, self.iMaxPage )
	DlgApi.SetItemText( self.this,"Label_Page", str )
	local curpage = getIntPart( self.iCurPage )
	local maxpage = getIntPart( self.iMaxPage )
  local bPageUp = false
	if curpage > 1 then bPageUp = true end
	DlgApi.EnableItem( self.this, "Button_Pre", bPageUp )
	local bPageDown = false
	if curpage < maxpage then bPageDown = true end
	DlgApi.EnableItem( self.this, "Button_Next", bPageDown )
	local kind
	--- 数据查询结果
	local s = (self.iCurPage-1) * self.iLinesPerPage+1
	local e = s + self.iLinesPerPage -1
	local kind
	local info
	local r 
	local g
	local b
	for i = s, e do
		info = self.retTab[i]
  	if info~=nil then
			kind = ""
			
			if self.bFind==true then 
				if info.kind==HELP_PAGE_DATA then
					if HELPINFO[info.id]~=nil then 
						if HELP_COLOR~=nil and HELPINFO[info.id].w~=nil and HELPINFO[info.id].w>=0 and HELPINFO[info.id].w<=4 then
				 			r = HELP_COLOR[HELPINFO[info.id].w].r
				 			g = HELP_COLOR[HELPINFO[info.id].w].g
				 			b = HELP_COLOR[HELPINFO[info.id].w].b
				 		else
				 			r = 255
				 			g = 255
				 			b = 255
				 		end
						kind = "    ["..DlgApiEx.GetItemLinkStr(HELPINFO[info.id].title,HELPINFO[info.id].kind,info.id,-1,r,g,b,255).."]" 
					end 
				else
					if HELPINFO[info.kind]~=nil then 
						if HELP_COLOR~=nil and HELPINFO[info.kind].w~=nil and HELPINFO[info.kind].w>=0 and HELPINFO[info.kind].w<=4 then
				 			r = HELP_COLOR[HELPINFO[info.kind].w].r
				 			g = HELP_COLOR[HELPINFO[info.kind].w].g
				 			b = HELP_COLOR[HELPINFO[info.kind].w].b
				 		else
				 			r = 255
				 			g = 255
				 			b = 255
				 		end
						kind = "    ["..DlgApiEx.GetItemLinkStr(HELPINFO[info.kind].title,HELPINFO[info.kind].kind,info.kind,-1,r,g,b,255).."]" 
					end 
				end
			end
			if HELP_COLOR~=nil and HELPINFO[info.id].w~=nil and HELPINFO[info.id].w>=0 and HELPINFO[info.id].w<=4 then
	 			r = HELP_COLOR[HELPINFO[info.id].w].r
	 			g = HELP_COLOR[HELPINFO[info.id].w].g
	 			b = HELP_COLOR[HELPINFO[info.id].w].b
	 		else
	 			r = 255
	 			g = 255
	 			b = 255
	 		end
	    DlgApi.AppendItemText(self.this,"Text_InviteIntro",DlgApiEx.GetItemLinkStr(info.name,info.kind,info.id,info.param,r,g,b,255)..kind.."\r")
		end
	end
end

-- 显示推荐组
function Panel_HelpResult:UpdateAdvance(groupID)
	DlgApi.SetItemText(self.this,"Text_InviteIntro","")
	if HELP_ADVANCE[groupID]==nil then return end 
	local dataTab = {}
	local n = 0
	local idx = n+1
	if HELP_ADVANCE[groupID].helpinfo~=nil then 
		for _, id in pairs(HELP_ADVANCE[groupID].helpinfo) do
			if HELPINFO[id]~=nil then
				dataTab[idx] = {name=HELPINFO[id].title,kind=HELPINFO[id].kind,id=id,param=-1,w=HELPINFO[id].w}
				idx = idx+1
			end
		end
	end
	if HELP_ADVANCE[groupID].elementdata~=nil then 
		for _, id in pairs(HELP_ADVANCE[groupID].elementdata) do
			local da = GameApi.GetADateForHelp(-1,id)
			if da~=nil then 
				local _tp = {name=da.name,kind=HELP_PAGE_DATA,id=da.id,param=id}
				if HELP_ELEMENTDATA[id]~=nil then _tp.w=HELP_ELEMENTDATA[id].w end
				dataTab[idx] = _tp
				idx = idx+1
			end
		end
	end
	if HELP_ADVANCE[groupID].task~=nil then 
		for _, id in pairs(HELP_ADVANCE[groupID].task) do
			local da = GameApi.GetADateForHelp(HELP_DATA_TASK,id)
			if da~=nil then 
				local _tp = {name=da.name,kind=HELP_PAGE_DATA,id=da.id,param=id}
				if HELP_TASKDATA[id]~=nil then _tp.w=HELP_TASKDATA[id].w end
				dataTab[idx] = _tp
				idx = idx+1
			end
		end
	end
	if HELP_ADVANCE[groupID].skill~=nil then 
		for _, id in pairs(HELP_ADVANCE[groupID].skill) do
			local da = GameApi.GetADateForHelp(HELP_DATA_SKILL,id)
			if da~=nil then 
				local _tp = {name=da.name,kind=HELP_PAGE_DATA,id=da.id,param=id}
				if HELP_SKILLDATA[id]~=nil then _tp.w=HELP_SKILLDATA[id].w end
				dataTab[idx] = _tp
				idx = idx+1
			end
		end
	end
	Panel_HelpResult:UpdateSearchResult(dataTab,true)
end

-----------------------------随便看看----------------------------------------------------------
--随便看看——随机从配置文件中抽取，每个类型下抽4个，几率一样。
function Panel_HelpResult:OnRandom()
	DlgApi.SetItemText(self.this,"Text_InviteIntro","")
	local dataTab = {}
	local n = 0
	local idx = n+1
	local fathers = {HELP_PAGE_WIKI,HELP_PAGE_MAP,HELP_PAGE_DATA,HELP_PAGE_PATCH}
	for _, father in pairs(fathers) do
		local tpTab = Panel_HelpResult:OnRandomByFather(father)
		for i, da in pairs(tpTab) do
			dataTab[idx] = da
			idx = idx+1
		end
	end
	Panel_HelpResult:UpdateSearchResult(dataTab,true)
end

function Panel_HelpResult:OnRandomByFather(father)
	local idx = 1
	local dataTab = {}
	for _, info in pairs(HELPINFO) do
		if info.kind == father then -- 如果要精确到叶子 可改成 info.kind == father
			local _tp = {name=info.title,kind=info.kind,id=_,param=-1,w=info.w}
			dataTab[idx] = _tp
			idx = idx+1
		end      
	end	
	local n = table.getn(dataTab)
	if n<=4 then 
		return dataTab -- 少于四个就直接返回
	end
	local seleTab = {}
	local num = 0
	while (num < 4) do
		local ran = math.random(n)
		if seleTab[ran]==nil then	 seleTab[ran] = dataTab[ran] num = num+1 end
	end
	return seleTab
end 

-----------------------------?根据我的习惯----------------------------------------------------------
function Panel_HelpResult:OnHabit()
	DlgApi.SetItemText(self.this,"Text_InviteIntro","")
	local dataTab = {}
	local n = 0
	local idx = n+1
	local habitTab = GameApi.GetHabitForHelp()
	for i, da in pairs(habitTab) do
		dataTab[idx] = {name=Panel_Help:GetItemName(da.kind,da.id,da.param),kind=da.kind,id=da.id,param=da.param,w=da.w*100000+da.count}
		idx = idx+1
	end
	Panel_HelpResult:UpdateSearchResult(dataTab,true)
end

---------------------------------------------------------------------------------------------------
function Panel_HelpResult:OnBtnPrev()
	self.iCurPage = self.iCurPage - 1
	if self.iCurPage < 1 then self.iCurPage = 1
	else self:OnPage()
	end
end
---------------------------------------------------------------------------------------------------
function Panel_HelpResult:OnBtnNext()
	self.iCurPage = self.iCurPage + 1
	if self.iCurPage > self.iMaxPage then self.iCurPage = self.iMaxPage
	else self:OnPage()
	end
end
