--[[ @i18n skill ]]
local _t = require("i18n").context("skill")
-------------------------------

SequenceSkill =
--连续技能配置表
{
	[1] =
	{
		name = _t"大招", --名称
		image = 3, --图标
		loopStart = 3, --循环开始
		skills =  --技能序列
		{
			-- [位置,最大为10] = {技能Id,是否蓄力}
			[1] = {skillId = 13},--清除cd
			[2] = {skillId = 39,isCharge = false},--群攻
			[3] = {skillId = 13},--清除cd
			[4] = {skillId = 39,isCharge = true},
		},
	},

	[2] =
	{
		name = _t"天马座输出", --名称
		image = 2, --图标
		loopStart = 2,
		skills =
		{
			-- [位置] = {技能Id,是否蓄力}
			[1] = {skillId = 17},
			[2] = {skillId = 1622},
			[3] = {skillId = 19},
			[4] = {skillId = 18},
			[5] = {skillId = 18},
			[6] = {skillId = 19},
			[7] = {skillId = 29},
			[8] = {skillId = 62},
			[9] = {skillId = 64},
			[10] = {skillId = 60},

		},
	},

	[3] =
	{
		name = _t"白鸟座单人输出", --名称
		image = 5, --图标
		loopStart = 1,
		skills =
		{
			-- [位置] = {技能Id,是否蓄力}
			[1] = {skillId = 67},
			[2] = {skillId = 71,isCharge = true},
			[3] = {skillId = 99},
			[4] = {skillId = 69},
			[5] = {skillId = 104},
			[6] = {skillId = 68},
			[7] = {skillId = 69},
			[8] = {skillId = 70},
			[9] = {skillId = 69},
			[10] = {skillId = 71,isCharge= false},
		},
	},

	[4] =
	{
		name = _t"天龙座输出", --名称
		image = 6, --图标
		loopStart = 2,
		skills =
		{
			-- [位置] = {技能Id,是否蓄力}
			[1] = {skillId = 84},
			[2] = {skillId = 1590},
			[3] = {skillId = 83,isCharge=true},
			[4] = {skillId = 85},
			[5] = {skillId = 82},
			[6] = {skillId = 92},
			[7] = {skillId = 93},
			[8] = {skillId = 81},
			[9] = {skillId = 82},
		},
	},
	[5] =
	{
		name = _t"仙女座输出", --名称
		image = 4, --图标
		loopStart = 1,
		skills =
		{
			-- [位置] = {技能Id,是否蓄力}
			[1] = {skillId = 525},
			[2] = {skillId = 524},
			[3] = {skillId = 523},
			[4] = {skillId = 524},
			[5] = {skillId = 523},
			[6] = {skillId = 526},
		},
	},
	[6] =
	{
		name = _t"凤凰座输出", --名称
		image = 4, --图标
		loopStart = 1,
		skills =
		{
			-- [位置] = {技能Id,是否蓄力}
			[1] = {skillId = 1521},
			[2] = {skillId = 1529},
			[3] = {skillId = 1527},
			[4] = {skillId = 1526},
			[5] = {skillId = 1528},
			[6] = {skillId = 1520},
			[7] = {skillId = 1519},
			[8] = {skillId = 1520},
			[9] = {skillId = 1522},
		},
	},
	[7] =
	{
		name = _t"群攻输出", --名称
		image = 3, --图标
		loopStart = 1,
		skills =
		{
			-- [位置] = {技能Id,是否蓄力}
			[1] = {skillId = 525},
			[2] = {skillId = 524},
			[3] = {skillId = 523},
			[4] = {skillId = 528},
		},
	},
	[8] =
	{
		name = _t"群攻输出", --名称
		image = 3, --图标
		loopStart = 1,
		skills =
		{
			-- [位置] = {技能Id,是否蓄力}
			[1] = {skillId = 1521},
			[2] = {skillId = 1529},
			[3] = {skillId = 1528},
			[4] = {skillId = 1523},
			[5] = {skillId = 1520},
			[6] = {skillId = 1519},
			[7] = {skillId = 1520},
			[8] = {skillId = 1522},
		},
	},
		[9] =--天马 有奇袭之后的连招
	{
		name = _t"奇袭斗魂连招", --名称
		image = 3, --图标
		loopStart = 1,
		skills =
		{
			-- [位置] = {技能Id,是否蓄力}
			[1] = {skillId = 17},
			[2] = {skillId = 1622},
			[3] = {skillId = 60},
			[4] = {skillId = 19},
			[5] = {skillId = 18},
			[6] = {skillId = 29},
			[7] = {skillId = 62},
			[8] = {skillId = 60},
			[9] = {skillId = 64},
			[10] = {skillId = 19},
		},
	},

		[10] =
	{
		name = _t"白鸟座群体输出", --名称
		image = 6, --图标
		loopStart = 1,
		skills =
		{
			-- [位置] = {技能Id,是否蓄力}
			[1] = {skillId = 105},
			[2] = {skillId = 69},
			[3] = {skillId = 104},
			[4] = {skillId = 68},
			[5] = {skillId = 69},
			[6] = {skillId = 71,isCharge= true},
			[7] = {skillId = 68},
			[8] = {skillId = 70},
			[9] = {skillId = 69},
		},
	},
		[11] =
	{
		name = _t"仙女座回复", --名称
		image = 5, --图标
		loopStart = 1,
		skills =
		{
			-- [位置] = {技能Id,是否蓄力}
			[1] = {skillId = 516},
			[2] = {skillId = 518},
			[3] = {skillId = 517},
			[4] = {skillId = 514},
			[5] = {skillId = 513},
			[6] = {skillId = 514},
			[7] = {skillId = 513},
		},
	},
		[12] =
	{
		name = _t"白鸟座组队输出", --名称
		image = 4, --图标
		loopStart = 1,
		skills =
		{
			-- [位置] = {技能Id,是否蓄力}
			[1] = {skillId = 105},
			[2] = {skillId = 67},
			[3] = {skillId = 69},
			[4] = {skillId = 70},
			[5] = {skillId = 71,isCharge= true},
			[6] = {skillId = 67},
			[7] = {skillId = 104},
			[8] = {skillId = 69},
			[9]=  {skillId = 71,isCharge= true},
			[10] = {skillId = 68},
		},
	},

		[13] =
	{
		name = _t"海龙单体输出", --名称
		image = 4, --图标
		loopStart = 1,
		skills =
		{
			-- [位置] = {技能Id,是否蓄力}
			[1] = {skillId = 6438},
			[2] = {skillId = 6412,isCharge= true},
			[3] = {skillId = 6750},
			[4] = {skillId = 6421},
			[5] = {skillId = 6424},
			[6] = {skillId = 6412},
			[7] = {skillId = 6421},
			[8] = {skillId = 6424},
			[9]=  {skillId = 6421},
			[10] = {skillId = 6440},
		},
	},
			[14] =
	{
		name = _t"海龙群体输出", --名称
		image = 5, --图标
		loopStart = 1,
		skills =
		{
			-- [位置] = {技能Id,是否蓄力}
			[1] = {skillId = 6438},
			[2] = {skillId = 6753},
			[3] = {skillId = 6421},
			[4] = {skillId = 6425},
			[5] = {skillId = 6421},
			[6] = {skillId = 6425},
			[7] = {skillId = 6421},
			[8] = {skillId = 6425},
			[9]=  {skillId = 6421},
			[10] = {skillId = 6425},
		},
	}


}

ProfSequenceSkillConf =
--职业连续技能配置
{
	[1] = --职业Id
	{
		[1] = 1,--位置（最大为5） = 连招id
		[2] = 2,
	},
	[2] =
	{
		[1] = 2,
		[2]=  9,
	},
	[3] =
	{
		[1] = 12,
		[2]=10,
		[3]=3,
	},
	[4] =
	{
		[1] = 4,
	},
	[5] =
	{
		[1] = 5,
		[2] = 7,
		[3] = 11,
	},
	[6] =
	{
		[1] = 6,
		[2] = 8,
	},
	[7] =
	{
		[1] = 13,
		[2] = 14,
	}

}
--根据职业id,位置返回连续技能配置
function ProfSequenceSkillConf:GetProfSequenceSkills(_profId)
	if(ProfSequenceSkillConf[_profId]) then
		local profSeqSkills = {}
		for slot,seqId in pairs(ProfSequenceSkillConf[_profId]) do
			profSeqSkills[slot] = SequenceSkill[seqId]
		end
		return profSeqSkills
	end
	return nil
end

--连招设置
SequenceSkillSetting =
{
	Anchor_SelMonsterRadius = 6, --定点选怪半径
	Anchor_MoveRadius = 5,--定点移动半径
}
