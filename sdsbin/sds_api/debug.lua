---------------------------------------------------------------
--	@description 游戏调试相关的API
--  @author hanwei
---------------------------------------------------------------

--- 游戏调试相关的API,主要为游戏调试提供一些便捷的调用接口
module("DebugApi")


--- 在客户端屏幕中间滚动显示消息
-- @param msg 滚动消息
function AddMarqueeMsg(msg)
end


--- 弹出windows提示窗口,显示重要的提示信息
-- @param msg 提示信息
function MessageBox(msg)
end


--- 显示新获得称号界面
-- @param titleId 称号id
function AddTitle(titleId)
end



-------------------------------------------------------------------------------
-- 交互信息类型
-- @class table
-- @name msgTyp
-- @field POPINFO_NONE 0,无交互信息
-- @field POPINFO_INVITE_TRADE 1,邀请交易
-- @field POPINFO_JOIN_TEAM 2,加入队伍
-- @field POPINFO_INVITE_BIND 3,选中目标当前mp与最大mp比例
-- @field POPINFO_REQUEST_BIND 4,拥抱
-- @field POPINFO_INVITE_RIDE_TOGETHER 5,共骑一乘
-- @field POPINFO_INVITE_DUEL 6,决斗
-- @field POPINFO_SYSTEM_MSG 7,系统信息
-- @field POPINFO_LEAGUE_INVITE 8,加入队伍
-- @field POPINFO_INVITE_GROUP_AGREE 9,队员邀请其它玩家入队
-- @field POPINFO_INVITE_GROUP 10,被组队玩家邀请入队
local msgTyp = 
{
	POPINFO_NONE = 0,
	POPINFO_INVITE_TRADE,
	POPINFO_JOIN_TEAM,
	POPINFO_INVITE_BIND,
	POPINFO_REQUEST_BIND,
	POPINFO_INVITE_RIDE_TOGETHER,
	POPINFO_INVITE_DUEL,
	POPINFO_SYSTEM_MSG,
	POPINFO_FRIEND_MSG,
	POPINFO_COMBAT_INVITE_RE,
	POPINFO_LEAGUE_INVITE,
	POPINFO_INVITE_GROUP_AGREE,
	POPINFO_INVITE_GROUP,
	POPINFO_NUM
}

--- 显示交互信息提示界面
-- @param msgTyp 信息类型
-- @see msgTyp
-- @param msg 交互信息内容
-- @param msgLife 交互信息显示时间
function RequestTest(msgTyp, msg, msgLife)
end




