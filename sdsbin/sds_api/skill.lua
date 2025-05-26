---------------------------------------------------------------
--	所有关于技能的接口
--  @author hanwei
---------------------------------------------------------------

--- 圣斗士客户端提供给脚本的接口,主要为游戏逻辑接口
module("GameApi")



--- 获得主角buff
-- @return table, 玩家当前buff列表{buff1_id, buff2_id, buff3_id, ....}
function GetHostBuff()
end


--- 获得选中目标的buff
-- @return table, 选中目标当前buff列表{buff1_id, buff2_id, buff3_id, ....}
function GetTargetBuff()
end


--- 获得主角身上技能的等级
-- @param skillId 技能Id
-- @return int, 指定技能等级,如果没有该技能等级为-1
function GetHostSkillLevel(skillId)
end


--- 获得主角身上buff的等级 
-- @param idBuff buff的Id
-- @return int, 指定buff等级,如果没有该buff等级为-1
function GetHostBuffLevel(idBuff)
end


--- 获取主角某个技能的前提天赋信息, 暂时无效
-- @param skillId 技能Id
-- @return talbe, 天赋数据<pre>
--{ 
--	preTalent=
--	{
--		skills =
--		{
--		    {id = 31, 	baseLevel = 5 or nil},
--		    {id = 142, 	baseLevel = 2 or nil},
--		},
--		nTotalPoint = 13,
--	}, 
--	preTalent2=
--	{
--		--同 preTalent 类似
--	} 
--} or nil
-- </pre>
function GetSkillPreTalentInfo(skillId)
end


---	判断玩家是否在准备使用指定技能的状态中
-- (准备使用技能状态, 即对一个目标释放技能，但目标不在射程，角色自动寻径过去释放技能的状态)
-- @param skillId 技能Id
-- @return true/false, 表示是否在准备使用技能状态
function IsPreparingSkill(skillId)
end

 
--- 判断玩家是否在吟唱指定技能状态
-- @param skillId 技能Id
-- @return true/false, 玩家是否吟唱指定技能
function IsUsingSkill(skillId)    
end


--- 判断玩家指定技能施放条件是否满足 
-- @param skillId 技能Id
-- @return int, 施放技能错误码, 0表示条件判断通过
function CheckSkillCastCondition(skillId)
end


--- 判断指定技能是否在冷却中
-- @param skillId 技能Id
-- @return true/false, 指定技能是否在冷却中
function IsSkillCooling(skillId)
end


--- 获取开关技能当前状态
-- @param skillId 技能Id
-- @return 如果没有当前技能或者该技能不是开关技能, 返回nil; 开:1, 关:0
function GetSkillSwitchSkillState(skillId)
end


--- 读取技能冷却时间
-- @param skillId 技能Id
-- @param skilllv 技能等级
-- @return 技能冷却时间 or nil
function GetSkillCoolDown(skillId, skilllv)
end


--- 读取技能执行时间
-- @param skillId 技能Id
-- @param skilllv 技能等级
-- @return 技能执行时间 or nil
function GetSkillExcuTime(skillId, skilllv)
end


--- 读取技能段数
-- @param skillId 技能Id
-- @param skilllv 技能等级
-- @return 读取技能段数 or nil
function GetSkillProcedureNum(skillId, skilllv)
end


--- 读取技能某段的附加攻击力
-- @param skillId 技能Id
-- @param skilllv 技能等级
-- @param skill_setp 技能的段数
-- @return 技能某段的附加攻击力 or nil
function GetSkillDamageAdd(skillId, skilllv, skill_setp)
end


--- 读取技能的累积伤害倍率
-- @param skillId 技能Id
-- @param skilllv 技能等级
-- @return 为技能的所有伤害段的物理伤害倍率或魔法伤害倍率之和（ratio之和） or nil
-- @return 为技能的所有伤害段的属性伤害倍率之和 （每个技能只会带一种属性伤害）or nil
function GetSkillRatio(skillId, skilllv)
end


--- 获取某个技能的伤害公式
-- @param skillId 技能Id
-- @return talbe, 伤害公式列表<pre>
--{ 
--		{step = 1, 	calc = "..."},
--		{step = 2, 	calc = "...."},
--} or nil
-- </pre>
function CalculateString(skillId)
end