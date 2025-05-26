local Format = string.format
local STRING_TABLE = _G.STRING_TABLE

LivingSkillDesc = {}


-------------------------------------
--		参数说明
-------------------------------------

--info=
--{
--  id								--技能id
--	level 						--技能等级
--	name							--技能名称
--	simple_desc 			--模板中定义的简单描述信息
--  type							--生活技能类别
--}

function LivingSkillDesc:GetDesc(id, info)
	local level = Format(STRING_TABLE.PRODUCE_SKILL_LEVEL, info.level)
	return Format("%s\v%s\r%s", info.name, level, info.simple_desc)
end