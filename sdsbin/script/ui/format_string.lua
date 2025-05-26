module("format_string", package.seeall)
local string = string
local format, find, expand, gsub, len, sub = string.format, string.find, string.expand, string.gsub, string.len, string.sub
local rep = string.rep


--在每个字符串换行前增加char个字符，主要用来插入空格，规范格式
function formatString(str,char,k)  
    if (not find(str,"\r")) then
        return str
    end

    local temp = ""
    local ss
    local i,j = 0, 0
    while true do
        j = i
        i = find(str,"\r",i+1)
        if i == nil then
            break
        end
        ss = sub(str,j+1,i-1)
        temp = temp .. ss .. "\r" .. rep(char,k)
    end
    ss = sub(str,j+1,len(str))
    return temp .. ss   
end


function SetString(str, char, k)
    if (not find(str,"\r")) then
        return rep(char, k)..str
    end

    local temp = ""
    local ss
    local i,j = 0, 0
    while true do
        j = i
        i = find(str,"\r",i+1)
        if i == nil then
            break
        end
        ss = sub(str,j+1,i-1)
        temp = temp..rep(char,k)..ss.."\r"
    end
    ss = sub(str,j+1,len(str))
    return temp .. rep(char,k) .. ss
end


----给文本增加k个空格
function SetStringText(str, k)
    if (not find(str,"\r")) then
        return rep("^o", k)..str
    end

    local temp = ""
    local ss
    local i,j = 0, 0
    while true do
        j = i
        i = find(str,"\r",i+1)
        if i == nil then
            break
        end
        ss = sub(str,j+1,i-1)
        temp = temp..rep("^o",k)..ss.."\r"
    end
    ss = sub(str,j+1,len(str))
    return temp .. rep("^o",k) .. ss
end




local def_color = "ffffff"
local money_color = 
{
	"80ff80",
	"80ff80",
	"80ff80",
	"80ff80",
	"ffff80",
	"ffff80",
	"ffff80",
	"ff8080",
	"ff8080",
	"ff8080",
	"ff8080",
	"ff8080",
}

function money(self, money_str, no_color, sep_color)
    local _, count = string.gsub(money_str, "[^\128-\193]", "")
    local color = money_color[count] or def_color
    if not no_color then
    	return format("^%s%s^N", color, money_str)     
    end
    return format("^%s%s^N", sep_color, money_str)
end


function input_money(self, money_str)
    return money_str
end


function player_lev(self, lev, no_color)
    if lev > USE_EXP2_LEV then
        if no_color then
            return format(STRING_TABLE.PLAYER_LEV2, lev - USE_EXP2_LEV)
        else
            return format(STRING_TABLE.PLAYER_LEV2_COLOR, lev - USE_EXP2_LEV)
        end
    end
    return format(STRING_TABLE.PLAYER_LEV1, lev)
end


function player_prof(self, prof, is_prof2)    
    if is_prof2 then
        return STRING_TABLE["PROF2_"..tostring(prof)] or ""
    end
    return STRING_TABLE["PROF_"..tostring(prof)] or ""
end


function exp(self, exp_val,max_exp_val)    
    local unit_val = 100000000
    local rate = 0
    if max_exp_val > 0 then
        rate = exp_val * 100 / max_exp_val
    end
    if exp_val > unit_val then
        return format(STRING_TABLE.HOST_EXP_FMT, exp_val / unit_val, STRING_TABLE.HOST_EXP_UNIT,rate)
    else
        return format(STRING_TABLE.HOST_EXP_FMT, exp_val, "", rate)
    end
end


function store_exp(self, exp_val)
    local unit_val = 100000000
    if exp_val > unit_val then
        return format(STRING_TABLE.HOST_STOREEXP_FMT, exp_val/unit_val, STRING_TABLE.HOST_EXP_UNIT)
    else
        return format(STRING_TABLE.HOST_STOREEXP_FMT, exp_val, "")
    end
end


local solo_challenge_proxy = {}
setmetatable(solo_challenge_proxy, {
    __index = function(t, index)
        local solo = GameApi.GetSoloChallengeInfo() or {}
        return solo[index]
    end
})

local expand_env =
{
    em = function(set, index)
        if not index then
            index = set or 0
            set = 0
        end
        return DlgApiEx.GetEmotionStr(set, index) or ""
    end,
    route = function(id, ...)
        local line_id = 0
        local name = arg[2]
        if type(arg[1]) == "number" then
            line_id = arg[1]
        elseif type(arg[1]) == "string" then
            name = arg[1]
        end

        local pos = TemplPos:GetPos(id)
        if pos then
            return DlgApiEx.GetRouteLinkText(id, line_id, name)
        end
        return GameApi.GetSenceObjName(id) or ""
    end,
	pos = function(x, y, z, mapId, name)
		return DlgApiEx.GetPositionLinkText(x, y, z, mapId, name)
	end,
    url = function(url, name)
        if not url then return "" end
        return DlgApiEx.GetUrlLinkText(url, name) or ""
    end,
	item = function(id)
		return DlgApiEx.GetNormalItemLinkStr(id)
	end,
	help = function(id)
		local info = HELPINFO[id]
		if not info then return "" end
		return DlgApiEx.GetHelpLinkStr(id, info.title or "error")
	end,
	quest = function(id, name)
		return DlgApiEx.GetQuestLinkStr(id, name)
	end,
	jump = function(id)
		local info = JumpConfig[id]
		if not info then return "" end
		return DlgApiEx.GetJumpLinkStr(id, info.name or "error")
	end,
	host_lev = function()
		local prop = GameApi.GetHostProp()
		return prop and format_string:player_lev(prop.level) or ""
	end,
    line = function(map_id, line_id)
        return GameApi.GetLineName(map_id, line_id)
    end,
    dynamic_dir = function (dynamic_dir_id, name )
        return DlgApiEx.GetDynamicDirLinkText(dynamic_dir_id, name)
    end,
    repu = function(id)
    	local val = GameApi.GetHostRepuValue(id)
    	return val or 0
	end,
	task_count = function(id)
		local num = GameApi.GetTaskFinishedCount(id)
		return num or 0
	end,
    scene_param = function(id)
        local num = GameApi.GetInstanceVar(id)
        return num or 0
    end,
    solo_challenge = solo_challenge_proxy,
}

expand_env.npc = expand_env.route

-- 替换各种特殊含义字符串 
--[[
表情：
    ${em(index)}                                            -- 使用0套表情的第index个表情。index从1开始
    ${em(pack, index)}                                      -- 使用第pack套表情的第index个表情。index从1开始
NPC/寻径链接: 
    ${route(id)}, ${npc(id)}
    ${route(id,line_id)}, ${npc(id,line_id)}                -- 可指定寻径目的地线号
    ${route(id,name)}, ${npc(id,name)}                      -- 可自定义链接文字
    ${route(id,line_id,name)}, ${npc(id,line_id,name)}
    ${pos(x,y,z,mapId,name)}
物品链接: ${item(id)}
URL链接: ${url(url, name)}
百科链接: ${help(id)}
任务链接: ${quest(id)}, ${quest(id, name)}
跳转界面链接: ${jump(id)}
玩家等级: ${host_lev}
线路名称: ${line(map_id, line_id)}
界面动态指引： ${dynamic_dir(id, name)}
声望数值: ${repu(id)}
任务计数: ${task_count(id)}
场景参数: ${scene_param(id)}
个人挑战副本: ${solo_challenge.level}, ${solo_challenge.score}, ${solo_challenge.time_text}
]]
function parse(self, text, ...)
    return expand(text, expand_env, ...) or ""
end




local npc_expand_env =
{	
	npc = function(tid)
		return GameApi.GetNpcNameByTid(tid) or ""
	end,
    line = function(map_id, line_id)
        return GameApi.GetLineName(map_id, line_id)
    end
}

-- 解析npc喊话
function npc_msg_parse(self, text)
    -- 等级限制
    do
    	local start = 0, finish, lev_low, lev_high
    	repeat
    	    start, finish, lev_low, lev_high = find(text, "${lev%((%d+)%-(%d+)%)}", start)
    	    if start and finish and lev_low and lev_high then
    	        local prop = GameApi.GetHostProp()
    	        if prop.level < tonumber(lev_low) or prop.level > tonumber(lev_high) then
    	            return {filter = true, }, ""
    	        end
    	        local prefix = sub(text, 1, start - 1)
            	local postfix= sub(text, finish + 1)
            	text = prefix .. postfix
            	start = len(prefix) + 1
    	    end
    	until not lev_low
    end
    
    local wait = false
    -- 替换人名
    do        
        local start = 0, finish, id
        repeat
        	start, finish, id = find(text, "${name%((%x+)%)}", start)    
        	if start and finish and id then
         		local name = GameApi.GetPlayerName("0X"..id)
         		if not name then
         		    return {filter = true, }, ""
         		elseif len(name) <= 0 then
                	wait = true
                	start = finish + 1
            	else
            	    local prefix = sub(text, 1, start - 1)
            	    local postfix= sub(text, finish + 1)
            	    text = format("%s%s%s", prefix, name, postfix)
            	    start = len(prefix) + len(name) + 1
            	end        	            	
        	end
        until not id        
    end
    -- 替换军团
    do
        local start = 0, finish, league_id
        repeat
            start, finish, league_id = find(text, "${league%((%x+)%)}", start)    
        	if start and finish and league_id then
         		local league_name = GameApi.GetLeagueName("0X"..league_id)
            	if not league_name then
            	    return {filter = true, }, ""
            	elseif len(league_name) <= 0 then
                	wait = true
                	start = finish + 1
            	else
            	    local prefix = sub(text, 1, start - 1)
            	    local postfix= sub(text, finish + 1)
            	    text = format("%s%s%s", prefix, league_name, postfix)
            	    start = len(prefix) + len(league_name) + 1
            	end        	            	
        	end
        until not league_id
    end
    if wait then
        return {wait = true, }, ""
    end        
    
    -- 控制字符
    local num
    local ctrls = {}
    text, num = gsub(text, "$UImid", "")  	ctrls.mid = num > 0
    text, num = gsub(text, "$spec", "")		ctrls.spec = num > 0
    text, num = gsub(text, "$owner", "")    ctrls.owner = num > 0
    text, num = gsub(text, "$noname", "")	ctrls.name = num <= 0
    text, num = gsub(text, "$nobubble", "")	ctrls.bubble = num <= 0
    text, num = gsub(text, "$nochat", "")	ctrls.chat = num <= 0
    text, num = gsub(text, "$gm_print", "")	ctrls.gm_print = num > 0      

	-- 替换各种字符
    text = expand(text, npc_expand_env)
	
    return ctrls, text
end
