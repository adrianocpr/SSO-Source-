--------------------------------
-- 右键菜单配置
RightMenuConfig = {}

-- 菜单显示类型
local TYPE_SHOW_NULL		= 0
local TYPE_SHOW_COMMON		= 1
local TYPE_SHOW_INTERACT	= 2
local TYPE_SHOW_MAIL		= 3
local TYPE_SHOW_KINGDOM     = 4
local TYPE_SHOW_TEAMME1		= 5
local TYPE_SHOW_TEAMME2		= 6
local TYPE_SHOW_TEAMOTHER1	= 7
local TYPE_SHOW_TEAMOTHER2	= 8
local TYPE_SHOW_LEISURE1	= 9
local TYPE_SHOW_LEISURE2	= 10
local TYPE_SHOW_RAID		= 11
local TYPE_SHOW_LEAGUERAID  = 12
local TYPE_SHOW_FRIEND		= 13
local TYPE_SHOW_LEAGUE_ITEM	= 14
local TYPE_SHOW_TOP = 15




-- 菜单选项类型
local TYPE_ITEM_NULL		= 0
local TYPE_ITEM_SUBMENU     = 1
local TYPE_ITEM_TEAMINVITE	= 2
local TYPE_ITEM_SENDSECRET	= 3
local TYPE_ITEM_ADDFRIEND   = 4
local TYPE_ITEM_FOLLOW		= 5
local TYPE_ITEM_OBSERVE		= 6
local TYPE_ITEM_TRADE		= 7
local TYPE_ITEM_PK			= 8
local TYPE_ITEM_COPYNAME    = 9
local TYPE_ITEM_REPORTGM    = 10
local TYPE_ITEM_LEAGUEINVITE= 11
local TYPE_ITEM_MULTIRIDE   = 12
local TYPE_ITEM_COACH	    = 13
local TYPE_ITEM_EMBRACE	    = 14
local TYPE_ITEM_MAILREPLAY	= 15
local TYPE_ITEM_MAILDEL		= 16
local TYPE_ITEM_MAILRES		= 17
local TYPE_ITEM_MAILCANCEL	= 18
local TYPE_ITEM_LEAVETEAM	= 19
local TYPE_ITEM_DISMISSTEAM	= 20
local TYPE_ITEM_RESETTRASN	= 21
local TYPE_ITEM_TRANSLEADER = 22
local TYPE_ITEM_KICKOUT		= 23
local TYPE_ITEM_ASSIST		= 24
local TYPE_ITEM_BLACKLIST 	= 25
local TYPE_ITEM_POWER 		= 26
local TYPE_ITEM_ACHIEVEMENT = 27
local TYPE_ITEM_ADDCARD 	= 28
local TYPE_ITEM_CHALLENGE	= 29
local TYPE_ITEM_RAIDINVITE  = 30
local TYPE_ITEM_RAIDCHANGETEAM = 31
local TYPE_ITEM_LEAGUE_RAID_KICK = 32
local TYPE_ITEM_LEAGUE_RAID_TRANSLEADER = 33
local TYPE_ITEM_FRIEND_CHAT = 34			--	好友聊天
local TYPE_ITEM_FRIEND_MOVE = 35			--	移动分组
local TYPE_ITEM_FRIEND_DEL	= 36			--	删除好友
local TYPE_ITEM_FRIEND_PET = 37				--	宠物学舌
local TYPE_ITEM_LEAGUE_ITEM_LOCK	=	38		-- 锁定物品
local TYPE_ITEM_LEAGUE_ITEM_SET_PRIV	=	39	--	修改物品权限
local TYPE_ITEM_RAIDLEADER	=	40	--	转移团长
local TYPE_ITEM_ROUTE_TO_TEAMMATE = 41
local TYPE_ITEM_SET_RALLY_POINT = 42
local TYPE_ITEM_GIVE_FLOWER = 43
local TYPE_ITEM_SHOW_LEISURE_PLAYER_LEVEL = 44 --右键显示等级
local TYPE_ITEM_REPORT_CHEAT = 45  -- 举报骗子
local TYPE_ITEM_INVITE_STUDENT = 46  -- 收徒
local TYPE_ITEM_INVITE_TEACHER = 47  -- 拜师
local TYPE_ITEM_OBSERVE_IN_TOP = 48  -- 在排好榜中观察

-- 一般情形下不显示的项
RightMenuGeneralForbid = {}
RightMenuGeneralForbid[TYPE_SHOW_COMMON] =
{
   TYPE_ITEM_REPORT_CHEAT,
}

-- 获取右键按钮配置
function RightMenuConfig:GetMenuList(showType, forbidList)
   local origMenus = self[showType]
   local generalForbidItems = RightMenuGeneralForbid[showType]
   if forbidList ~= nil and #forbidList > 0 then
      for i1,v1 in ipairs(origMenus) do
         for i2,v2 in ipairs(forbidList) do
            if v1.type == v2 then
               table.remove(origMenus, i1)
            end
         end
      end
   end

   return origMenus
end


RightMenuConfig[TYPE_SHOW_COMMON] =
{
   {type = TYPE_ITEM_TEAMINVITE, name = _t"组队邀请",
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_SENDSECRET, name = _t"发送密语", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
                              --[[
   {type = TYPE_ITEM_WHISPER, name = "私聊", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
                              ]]--
   {type = TYPE_ITEM_ADDFRIEND, name = _t"加为好友", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_FOLLOW, name = _t"跟随", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},                           
    {type = TYPE_ITEM_OBSERVE, name = _t"观察", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
    {type = TYPE_ITEM_TRADE, name = _t"交易", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
    {type = TYPE_ITEM_LEAGUEINVITE, name = _t"军团邀请", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},                              
    {type = TYPE_ITEM_PK, name = _t"决斗", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",}, 
    {type = TYPE_ITEM_COPYNAME, name = _t"复制名称", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
    {type = TYPE_ITEM_REPORTGM, name = _t"举报外挂", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
    {type = TYPE_ITEM_REPORT_CHEAT, name = _t"举报骗子", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},                              
    {type = TYPE_ITEM_BLACKLIST, name = _t"加入黑名单", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",}, 
     {type = TYPE_ITEM_POWER, name = _t"战斗力", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
     {type = TYPE_ITEM_ACHIEVEMENT, name = _t"比较成就", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",}, 
     {type = TYPE_ITEM_ADDCARD, name = _t"加入名片夹", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
     {type = TYPE_ITEM_INVITE_STUDENT, name = _t"收做徒弟", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
     {type = TYPE_ITEM_INVITE_TEACHER, name = _t"拜为师父", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},                              
}


RightMenuConfig[TYPE_SHOW_INTERACT] =
{
   {type = TYPE_ITEM_LEAGUEINVITE, name = _t"军团邀请",
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_MULTIRIDE, name = _t"多人骑乘", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_COACH, name = _t"教授学徒", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_EMBRACE, name = _t"拥抱", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
}


RightMenuConfig[TYPE_SHOW_MAIL] =
{
   {type = TYPE_ITEM_MAILREPLAY, name = _t"回复",
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_MAILDEL, name = _t"删除", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_MAILRES, name = _t"保留", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_MAILCANCEL, name = _t"取消保留", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
}


RightMenuConfig[TYPE_SHOW_KINGDOM] =
{
   {type = TYPE_ITEM_ADDFRIEND, name = _t"加为好友", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_TEAMINVITE, name = _t"组队邀请",
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},                            
   {type = TYPE_ITEM_SENDSECRET, name = _t"发送密语", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},                                                         
    {type = TYPE_ITEM_COPYNAME, name = _t"复制名称", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",}, 
}

RightMenuConfig[TYPE_SHOW_TEAMME1] =
{
   {type = TYPE_ITEM_LEAVETEAM, name = _t"离开队伍",
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},                            
   {type = TYPE_ITEM_DISMISSTEAM, name = _t"解散队伍", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},                                                         
   {type = TYPE_ITEM_SET_RALLY_POINT, name = _t"集结队伍", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},                                               
    {type = TYPE_ITEM_RESETTRASN, name = _t"重置副本", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",}, 
}

RightMenuConfig[TYPE_SHOW_TEAMME2] =
{
   {type = TYPE_ITEM_LEAVETEAM, name = _t"离开队伍",
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},                            
}

RightMenuConfig[TYPE_SHOW_TEAMOTHER1] =
{
   {type = TYPE_ITEM_SENDSECRET, name = _t"发送密语", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_TRANSLEADER, name = _t"转移队长", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_KICKOUT, name = _t"踢出队伍",
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_TRADE, name = _t"发起交易", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_ADDFRIEND, name = _t"加为好友", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},                                                                                
   {type = TYPE_ITEM_FOLLOW, name = _t"跟随目标", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_ROUTE_TO_TEAMMATE, name = _t"自动前往", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
    {type = TYPE_ITEM_ASSIST, name = _t"协助攻击", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_ACHIEVEMENT, name = _t"比较成就", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",}, 
}

RightMenuConfig[TYPE_SHOW_TEAMOTHER2] =
{
   {type = TYPE_ITEM_SENDSECRET, name = _t"发送密语", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_TRADE, name = _t"发起交易", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_ADDFRIEND, name = _t"加为好友", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},                                                                                
   {type = TYPE_ITEM_FOLLOW, name = _t"跟随目标", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_ROUTE_TO_TEAMMATE, name = _t"自动前往", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},                                                     
    {type = TYPE_ITEM_ASSIST, name = _t"协助攻击", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",}, 
}


RightMenuConfig[TYPE_SHOW_LEISURE1] =
{
   {type = TYPE_ITEM_CHALLENGE, name = _t"挑战", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
}


RightMenuConfig[TYPE_SHOW_LEISURE2] =
{
   {type = TYPE_ITEM_SHOW_LEISURE_PLAYER_LEVEL, name = _t"玩家等级:%s", 
                              imgUp = "special\\RightMenu\\H.tga", 
                              imgDown = "special\\RightMenu\\H.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_CHALLENGE, name = _t"挑战", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_SENDSECRET, name = _t"发送密语", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
}

RightMenuConfig[TYPE_SHOW_RAID] =
{
   {type = TYPE_ITEM_RAIDLEADER, name = _t"转移团长", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_RAIDCHANGETEAM, name = _t"调整分队", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_TRANSLEADER, name = _t"设置队长", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_KICKOUT, name = _t"踢出团队", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
}

RightMenuConfig[TYPE_SHOW_LEAGUERAID] = 
{
   {type = TYPE_ITEM_LEAGUE_RAID_KICK, name = _t"踢出团队", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_LEAGUE_RAID_TRANSLEADER, name = _t"转移指挥", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
}

RightMenuConfig[TYPE_SHOW_FRIEND] = 
{
    {type = TYPE_ITEM_SENDSECRET, name = _t"发送密语", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
    {type = TYPE_ITEM_TEAMINVITE, name = _t"组队邀请",
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
    {type = TYPE_ITEM_FRIEND_CHAT, name = _t"好友聊天", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
    {type = TYPE_ITEM_FRIEND_MOVE, name = _t"移动好友", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",}, 
    {type = TYPE_ITEM_COPYNAME, name = _t"复制名称", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
    {type = TYPE_ITEM_FRIEND_DEL, name = _t"删除好友", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
    {type = TYPE_ITEM_BLACKLIST, name = _t"加入黑名单", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",}, 
    {type = TYPE_ITEM_FRIEND_PET, name = _t"宠物学舌", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",}, 
    {type = TYPE_ITEM_GIVE_FLOWER, name = _t"赠送鲜花", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",}, 
}

RightMenuConfig[TYPE_SHOW_LEAGUE_ITEM] = 
{
   {type = TYPE_ITEM_LEAGUE_ITEM_LOCK, name = _t"加密码锁", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
   {type = TYPE_ITEM_LEAGUE_ITEM_SET_PRIV, name = _t"设置权限", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
}

RightMenuConfig[TYPE_SHOW_TOP] =
{
   {type = TYPE_ITEM_OBSERVE_IN_TOP, name = _t"观察", 
                              imgUp = "common\\button\\none.tga", 
                              imgDown = "special\\RightMenu\\D.tga", 
                              imgOnover = "special\\RightMenu\\H.tga", 
                              imgDisable = "",},
}