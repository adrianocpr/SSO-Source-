---------------------------------------------------------------
--	游戏中关于战斗逻辑的API
--  @author hanwei
---------------------------------------------------------------

--- 圣斗士客户端提供给脚本的接口,主要为游戏逻辑接口
module("GameApi")


--- 选择怪物,类似于Tab键切换怪物
function SelectMonster()
end


--- 普通攻击 
function NormalAttack()
end


--- 判断是否可以对选择对象发动攻击
-- @return true/false, 是否允许发动攻击
function CanAttack()
end


--- 判断是否可以自动采矿/收集
-- @return true/false, 是否可以自动采矿/收集
-- @usage [暂时无效]会判断周围10m以内是否有矿,以及采矿工具
function CanAutoGather()
end


--- 采矿/收集
-- @usage 会搜索玩家周围10m以内的矿/植物
function Gather()
end


--- 判断是否可以自动拾取
-- @return true/false, 是否可以自动拾取
-- @usage [暂时无效]
function CanAutoPickUp()
end


--- 拾取物品
function PickUp()
end


--- 当前场景自动寻径 
-- @param x 目标点x轴坐标 
-- @param y 目标点x轴坐标 
-- @param z 目标点x轴坐标 
function StartAutoMove(x, y, z)
end

--- 跨场景自动寻径 
-- 两种调用方式：<pre>
-- RouteTo(templ_id, line_id)
-- RouteTo(x, y, z, map_id, line_id)
--
-- templ_id 寻径的目标NPC/怪物/矿的模板ID
-- line_id 希望前往几线，可选项，0为不换线
-- x 目标点x轴坐标 
-- y 目标点x轴坐标 
-- z 目标点x轴坐标 
-- map_id 地图id
-- </pre>
function RouteTo(...)
end

--- 自动寻径到某场景物品所在地图位置
-- @param id NPC/怪物/矿的id
-- @param x 目标点x轴坐标 
-- @param y 目标点x轴坐标 
-- @param z 目标点x轴坐标 
-- @param z 目标点所在场景id 
function GotoTarget(id, x, y, z, mapid)
end


--- 判断主角是否在自动寻径中
-- @return true/false, 玩家是否在自动寻径状态
function IsAutoMoving()
end


--- 判断玩家是否在“准备拾取状态”中，即拾取一个目标，但目标不在拾取范围，角色自动寻径过去拾取
-- @return true/false 玩家是否在“准备拾取状态”中
function IsPreparingPickingUp()
end


--- 判断是否在拾取状态下
-- @return true/false 玩家是否在拾取状态中
function IsPickingUp()
end


--- 通知服务器,客户端在使用内挂
-- @usage [暂时无效]如果服务器发现没有挂机道具则会断线
function Report2Svr()
end


--- 判断是否在战斗中
-- @return true/false 玩家是否在战斗中
function IsFighting()
end

