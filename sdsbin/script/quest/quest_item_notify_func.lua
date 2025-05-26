-------------------------------------
-- 载入任务中需要使用物品的提示信息
-- Author: Feng Bo 

local quest_item_notify_text = {}

local env = {}
setmetatable(env, {__index = _G})

local function load_config()
	local chunk, err = LuaLoadFile("script/quest/quest_item_notify.lua")
	if chunk then
		setfenv(chunk, env)
    	local success, ret = pcall(chunk)
    	if not success then
    		console.error(ret)
    		return
    	end
    	
    	quest_item_notify_text = ret
	else
		console.error(ret)
	end
end
load_config()

QuestItemNotify = {}

function QuestItemNotify:GetNotifyText(task_id, item_id)
	local t = quest_item_notify_text[item_id]
	
	if type(t) == "string" then
		return t
	else
		return quest_item_notify_text["default"] or ""
	end
end
