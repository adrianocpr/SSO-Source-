---------------------------------------------------------------
--	所有关于军团的接口
--  @author hanwei
---------------------------------------------------------------

--- 圣斗士客户端提供给脚本的接口,主要为游戏逻辑接口
module("GameApi")



--- 获得军团信息
-- @return 军团信息:LeagueInfo = <pre>
-- { 
--	 name = "",     -- 军团名
--   level = 1,     -- 军团等级
--   development = 1,  -- 军团活跃度
-- } or nil(不在军团中)
-- </pre>
function GetLeagueInfo()
end


--- 获得军团声望
-- @param index 军团声望编号
-- @return reputation or nil(不在军团中) or -1(声望序号有误或未获取到军团详细信息)
function GetLeagueReputation(index)
end


--- 获得军团增量声望
-- @param index 军团声望编号
-- @return 增量声望信息:IncrementReputatio = <pre>
-- {
--   reputation_sum,               --声望总量
--   reputation_consume,           --声望消耗量
--   day_increase,                 --每日增量
--   week_increase,                --本周增量
--   month_increase,               --本月增量
--   yesterday_increase,           --昨日增量
--   last_week_increase,           --上周增量
--   last_month_increase,          --上月增量
--   update_stamp,                 --更新时间
-- } or nil(不在军团中、声望序号有误或未获取到军团详细信息)
-- </pre>
function GetLeagueIncrementReputation(index)
end