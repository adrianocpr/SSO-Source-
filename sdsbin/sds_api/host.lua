---------------------------------------------------------------
--	所有关于主角属性的接口
--  @author hanwei
---------------------------------------------------------------


--- 圣斗士客户端提供给脚本的接口,主要为游戏逻辑接口
module("GameApi")



-------------------------------------------------------------------------------
-- GetHostProp()返回值
-- @class table
-- @name GetHostProp_ReturnValue
-- @field id 玩家ID, 由于为int64, 转换为字符串表示
-- @field level 玩家等级
-- @field ratiohp 玩家当前hp与最大hp比例
-- @field ratiomp 玩家当前mp与最大mp比例
local GetHostProp_ReturnValue = 
{
	id, level, ratiohp, ratiomp
}

---	获得主角简要信息
-- @return GetHostProp_ReturnValue = {id, level, ratiohp, ratiomp} or nil
-- @see GetHostProp_ReturnValue
function GetHostProp()
    return GetHostProp_ReturnValue
end



-------------------------------------------------------------------------------
-- GetHostPropEx()返回值
-- @class table
-- @name GetHostPropEx_ReturnValue
-- @field profession 玩家职业
-- @field gender 玩家性别
-- @field level 玩家等级
-- @field cosmos_level 玩家小宇宙等级
local GetHostPropEx_ReturnValue = 
{
	profession, gender, level, cosmos_level
}

--- 获得主角信息
-- @return GetHostPropEx_ReturnValue = {profession, gender, level, cosmos_level}
-- @see GetHostPropEx_ReturnValue
function GetHostPropEx()
end


-------------------------------------------------------------------------------
-- GetHostAllProp()返回值
-- @class table
-- @name GetHostAllProp_ReturnValue
-- @field id 玩家ID, 由于为int64, 转换为字符串表示
-- @field level 玩家等级
-- @field curhp 玩家当前hp值
-- @field curmp 玩家当前mp值
-- @field maxhp 玩家最大hp值
-- @field maxmp 玩家最大mp值
-- @field damagehigh 玩家最大伤害
-- @field damagelow 玩家最小伤害
-- @field cosmosLevel 玩家小宇宙等级
-- @field attackearth 玩家地属性攻击力
-- @field attackwater 玩家水属性攻击力
-- @field attackfire 玩家火属性攻击力
-- @field attackwind 玩家风属性攻击力
-- @field exp 玩家当前经验
-- @field levelUpExp 玩家升级到下一级经验
local GetHostAllProp_ReturnValue = 
{
	id, level, curhp, curmp, maxhp, maxmp, damagehigh, damagelow, cosmosLevel, attackearth, attackwater, attackfire, attackwind, exp, levelUpExp
}

--- 获得主角详细信息
-- @return GetHostAllProp_ReturnValue = {id, level, curhp, curmp, maxhp, maxmp, damagehigh, damagelow, cosmosLevel, attackearth, attackwater, attackfire, attackwind, exp, levelUpExp}
-- @see GetHostAllProp_ReturnValue
function GetHostAllProp()
end


--- 获得主角能量信息
-- @return int, 玩家当前能量值
-- @return int, 玩家最大能量值
-- @usage 玩家职业为盗贼,此数值有效
function GetHostEPInfo()
end


-------------------------------------------------------------------------------
-- GetTargetProp()返回值
-- @class table
-- @name GetTargetProp_ReturnValue
-- @field id 选中目标ID, 由于为int64, 转换为字符串表示
-- @field level 选中目标等级
-- @field ratiohp 选中目标当前hp与最大hp比例
-- @field ratiomp 选中目标当前mp与最大mp比例
local GetTargetProp_ReturnValue = 
{
	id, level, ratiohp, ratiomp
}

--- 获得主角选中目标的详细信息
-- @return GetTargetProp_ReturnValue = { id, level, ratiohp, ratiomp }
-- @see GetTargetProp_ReturnValue
function GetTargetProp()
end


--- 获得主角的某个属性的攻击
-- @param index 属性索引,范围[1,4], 地水火风
-- @return int, 攻击数值，出错返回0
function GetHostDmg(index)
end


--- 获得主角的某个属性的抗性 
-- @param index 属性索引,范围[1,4], 地水火风
-- @return int, 抗性数值，出错返回0
function GetHostResistance(index)
end


--- 获得主角回城点的名字
-- @return string, 回城点管辖区域名字，如果找不到管辖区域返回经纬度
function GetHostTownName()
end


--- 获得主角副职业等级
-- @param id 副职业id
-- @return int, 此ID对应的副职业等级
function GetHostSubProfLevel(id)
end


--- 获得主角指定ID的声望值 
-- @param id 声望id
-- @return int, 此ID对应的声望值 
function GetHostRepuValue(id)
end


--- 获得主角包裹中某物品的数目 
-- @param id 物品id
-- @return int, 此ID物品在包裹中的个数，没有则返回0
function GetItemNumInPack(id)
end


--- 获得主角装备列表。 
-- @return 返回长度为32的数组，对应装备位标志位置(注意id从0开始).
-- 如果某个装备位没有装备，结果为0； 否则结果为装备id
function GetEquipList()
end


--- 获得主角包裹中的金钱数目
-- @return table，{绑定货币数目，非绑定货币数目}
function GetHostMoneyInPack()
end


--- 返回玩家当前位置坐标
-- @return 玩家当前x轴坐标
-- @return 玩家当前x轴坐标
-- @return 玩家当前x轴坐标
-- @return 玩家当前所在场景id
function GetHostPos()
end


--- 玩家是否曾经和NPC对话
-- @return true/false, 是否曾经和NPC对话
function IsFirstNPCTalk()
end


--- 玩家是否完成过任务 
-- @return true/false, 是否完成过任务
function IsFirstTaskFinished()
end


--- 玩家是否已经使用过特定id的物品(物品需要在SecretarySpecialIDMap中配置)
-- @param idx 物品id在SecretarySpecialIDMap.ItemId2Index表中的值 
-- @return true/false, 是否使用过该idx所配置的物品
function IsFirstUseItemByIdx(idx)
end


--- 玩家是否已经复活过
-- @return true/false, 是否复活过
function IsFirstRevive()
end


--- 玩家是否已经使用过特定id的技能(技能需要在SecretarySpecialIDMap配置)
-- @param idx 技能id在SecretarySpecialIDMap.SkillId2Index表中的值 
-- @return true/false
function IsFirstUseSkillByIdx(idx)
end


--- 整理背包
function ArrangeBag()
end


