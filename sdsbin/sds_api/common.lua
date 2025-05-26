---------------------------------------------------------------
--	游戏中一些通用逻辑的API
--  @author hanwei
---------------------------------------------------------------


--- 圣斗士客户端提供给脚本的接口,主要为游戏逻辑接口
module("GameApi")


--- 获取情侣id
-- @param id 玩家id,字符串(64位Id转字符串)
-- @return 情侣id, 用字符串表示
function GetPlayerSpouse(id)
end


--- 获取玩家名称
-- @param id 玩家id,字符串(64位Id转字符串)
-- @return 玩家名称
function GetPlayerName(id)
end


--- 获取玩家声望值 
-- @param id 玩家id,字符串(64位Id转字符串)
-- @return 玩家声望值 
function GetPlayerReputation(id)
end


--- 获得指定角色的姓名(包括玩家和NPC), 不推荐使用 
-- @param i64Id 64位的角色ID,特殊数据类型
-- @return 玩家或者NPC姓名, 如果没有指定id的信息返回nil
function GetUnitName( i64Id )
end


--- 获取怪物/NPC/Mine名字
-- @param tid 怪物/NPC/Mine在elementdata中的id
-- @return 名字, 如果没有指定的数据返回nil
function GetSenceObjName(tid)
end		


--- 获取怪物/NPC/Mine模型的路径id和路径
-- @param tid 怪物/NPC/Mine在elementdata中的id
-- @return 路径id, 如果没有指定的数据返回nil
-- @return 路径, 如果没有指定的数据返回nil
function GetSenceObjModelInfo(tid)		
end


--- 获取物品名称
-- @param tid 物品id
-- @param is_colored 物品名称是否带品质颜色
-- @return 物品名称, 如果没有指定物品返回nil
function GetItemName(tid, is_colored)	
end		


--- 获取战场名字
-- @param tid 剧本定义模板(INSTANCE_CONFIG)id
-- @return 战场名称, 如果没有指定配置表返回nil
function GetBattleName(tid)
end


--- 获取生活技能名字
-- @param tid 生活技能配置表(PLAYER_SUB_PROF_LEVEL_EXP_CONFIG)id
-- @return 声场技能名称, 如果没有指定配置表返回nil
function GetSubProfName(tid)		
end


--- 返回当前地图的星座运势
-- @param  index 星座索引 0～11
-- @return 星座运势值。若发生错误则返回-1
function GetConstellationData(index)
end


--- 返回场景参数
-- @param id 场景参数id
-- @return 场景参数值。若客户端不知道该场景参数的值，返回 0
function GetInstanceVar(id)
end


--- 返回客户端工作路径
-- @return 客户端工作路径
function GetBasePath()
end