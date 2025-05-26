-- 系统命令快捷符
-- author : Ma Yuanzheng
-- Date: 2012.11.12

local cmd_func = {}

CmdWordsMan = {}

-- 寻找句子中的系统命令
function CmdWordsMan:FindCommand(sentence)
    -- 以/开头，支持后跟至多4个wchar或12个char
    local firstidx, lastidx, key = string.find(sentence,"(/%S+)")
     if firstidx == 1 and lastidx > 1 and lastidx <= 13 then
        return key
    end
    return nil
end

function CmdWordsMan:ExcuteCommand(command_words)
    local words = CommandWords[command_words]
    if words == nil then
         GlobalApi.Log("No Command : "..command_words .. "") 
         DlgApiEx.AddChatMsg(_t"无效的指令")
         return
    end
    
    local func = cmd_func[words.command]
    if func == nil then
        GlobalApi.Log("Command "..command .. "has no function, function No.:" .. words.command)
    return
    end
    -- 执行命令 
    func()
end


-- 切换普通频道
cmd_func[1] = function()
	GameApi.ChangeChatChannel(1) -- 界面上的buttonid 
end
-- 切换队伍频道
cmd_func[2] = function()
	GameApi.ChangeChatChannel(2) -- 界面上的buttonid 
end
-- 切换好友频道
cmd_func[3] = function()
	GameApi.ChangeChatChannel(3) -- 界面上的buttonid 
end
-- 切换圈子频道
cmd_func[4] = function()
	GameApi.ChangeChatChannel(4) -- 界面上的buttonid 
end
-- 切换密语频道
cmd_func[5] = function()
	GameApi.ChangeChatChannel(5) -- 界面上的buttonid 
end
-- 切换军团频道
cmd_func[6] = function()
	GameApi.ChangeChatChannel(6) -- 界面上的buttonid 
end
-- 切换世界频道
cmd_func[7] = function()
	GameApi.ChangeChatChannel(7) -- 界面上的buttonid 
end
-- 切换广播频道
cmd_func[8] = function()
	GameApi.ChangeChatChannel(8) -- 界面上的buttonid 
end


--以下是表情动作用 id详见action\\actions_expression.lua
-- 播放笑的动作
cmd_func[1000] = function()
	GameApi.OnPlayerExpression(1) -- 播放表情动作 
end

--以下是交互动作用
-- 向目标发出相依相偎的邀请
cmd_func[2000] = function()
	GameApi.OnPlayerExpression(100) -- 播放表情动作
end

--其他有用功能
-- 打印聊天
cmd_func[3000] = function()
	GameApi.PrintChatMsg() -- 打印聊天
end
 