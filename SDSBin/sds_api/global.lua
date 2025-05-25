---------------------------------------------------------------
--	圣斗士客户端提供给所有脚本的全局接口
--  @author hanwei
---------------------------------------------------------------

--- 圣斗士客户端提供给所有脚本的全局接口,主要为游戏逻辑接口(可以在特效脚本中调用)
module("GlobalApi")


--- 计算指定文件的MD5码 
-- @param fileName 文件路径
-- @return 文件的MD5码 
function CalcFileMd5( fileName )
end


--- 获取一个时间，从系统开始运行开始，单位毫秒
-- @return 系统运行的时间
function LuaGetTickCount( )
end


--- 输出日志信息到EC.Log文件中 
-- @param str 要输出到日志的信息 
function Log(str)
end


-------------------------------------------------------------------------------
-- 服务器时间类型
-- @class table
-- @name date_type
-- @field year 年, 从1900年开始
-- @field month 月, 1 - 12
-- @field day 日, 1 – 31
-- @field hour 小时, 0 – 23
-- @field minute 分钟, 0 – 59
-- @field second 秒, 0 – 59
-- @field week 周, 1 - 7
local date_type = {}


--- 获取服务器时间 
-- @return date = {year, month, day, hour, minute, second, week}
-- @see date_type
function GetServerGMTDate()
end


--- 获取服务器在本地的时间,根据客户端时区计算偏移 
-- @return date = {year, month, day, hour, minute, second, week}
-- @see date_type
function GetServerLocalTime()
end


--- 播放脚步声 
-- @usage
--  <pre>
--	注意：ModEditor 里面脚本时间的文字编码格式有问题，在 UTF8 的buffer中存了ansi
--	编码的文字。目前按照ModEditor方式解析（实际上是错误的）。 
--	所以，如果在正常的lua环境中调用该函数，strOption中汉字会出问题。 
--	建议：检查ModEditor代码
--  </pre>
-- @param i64Id 玩家Id
-- @param strOption 文本信息,用于标示属性
function PlayMoveSound(i64Id, strOption)
end
