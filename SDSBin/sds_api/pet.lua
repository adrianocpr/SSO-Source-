---------------------------------------------------------------
--	所有关于宠物的接口
--  @author hanwei
---------------------------------------------------------------

--- 圣斗士客户端提供给脚本的接口,主要为游戏逻辑接口
module("GameApi")


--- 获得当前激活宠物的详细信息 
-- @return 宠物信息表:
-- <pre>
-- {
--	 id, 宠物id
--	 ratioHP, 宠物当前hp与最大hp比例
--	 ratioMP, 宠物当前mp与最大mp比例
--		level, 宠物等级
-- }
-- </pre>
-- @usage 如果没有激活宠物返回值为nil
function GetPetProp()
end


--- 获得当前激活宠物buff列表
-- @return table, 宠物buff列表, { buff1, buff2, .....}
function GetPetBuff()
end


--- 获取某个宠物的等级 
-- @param iSlot 宠物牌在宠物背包中的索引，第一个宠物牌的索引是1.
-- @return int, 宠物等级，如果没有宠物返回0
function GetPetLevelBySlot(iSlot)
end


--- 获取当前激活宠物在宠物栏中的位置 
-- @return int, 宠物牌在宠物背包中的索引, 没有激活宠物返回-1
function GetActivePet()
end
