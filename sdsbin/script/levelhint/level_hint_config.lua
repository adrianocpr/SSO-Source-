--[[ @i18n help ]]
local _t = require("i18n").context("help")
LevelHintConfig = {}

--仿照上面的继续写	

LevelHintConfig[1] = 
{
	level = 20,			--目标级别
	persuit = 			--追求
	{
		[1] = 
		{
			icon = "\\res\\keylevel\\skills.dds",
			desc = _t"连招编辑器(20级)",
			hint = _t"下一个等级段可以使用新功能：连招编辑器！",
		},
		--继续配置
	},
}

LevelHintConfig[2] = 
{
	level = 30,			--目标级别
	persuit = 			--追求
	{
		[1] = 
		{
			icon = "\\res\\keylevel\\bronze.dds",
			desc = _t"青铜圣衣(30级)",
			hint = _t"下一个等级段可以追求第2套青铜圣衣！",
		},
		[2] = 
		{
			icon = "\\res\\keylevel\\produce.dds",
			desc = _t"生产(30级)",
			hint = _t"下一个等级段可以学习生产技能了！",
		},
		--继续配置
	},
}

LevelHintConfig[3] = 
{
	level = 40,			--目标级别
	persuit = 			--追求
	{
		[1] = 
		{
			icon = "\\res\\keylevel\\cosmos1.dds",
			desc = _t"小宇宙开启(45)",
			hint = _t"下一个等级段可以开启小宇宙系统来进一步增强实力！",
		},
		--继续配置
	},
	demand = 			--要求
	{
		[1] = 
		{
			icon = "\\res\\keylevel\\wing1.dds",
			desc = _t"66级之前战力40000即可获得圣衣翅膀",
			hint = _t"当战力达到40000时可以获得对应职业的圣衣翅膀！",
		},
		--继续配置
	},
}

LevelHintConfig[4] = 
{
	level = 50,			--目标级别
	persuit = 			--追求
	{
		[1] = 
		{
			icon = "\\res\\keylevel\\bronze.dds",
			desc = _t"青铜圣衣二(50级)",
			hint = _t"下一个等级段可以追求第3套青铜圣衣！",
		},
		[2] = 
		{
			icon = "\\res\\keylevel\\cosmos2.dds",
			desc = _t"小宇宙6感",
			hint = _t"下一个等级段可以开启小宇宙第6感了！",
		},
		--继续配置
	},
}

LevelHintConfig[5] = 
{
	level = 60,			--目标级别
	daily_task =		--新日常活动 
	{
		[1] = 						
		{
			icon = "res\\daily\\复活！圣域镇魂歌.dds",			--图标路径
			desc = _t"复活！圣域镇魂曲",			--描述
			pre = 					--上一级的描述和图标路径
			{
				icon = "res\\daily\\集结！十二宫危机.dds",
				desc = _t"集结！十二宫危机",
			},
		},
		[2] = 						
		{
			icon = "res\\daily\\魔星的末日.dds",			--图标路径
			desc = _t"深渊！魔星的末日",			--描述
			pre = 					--上一级的描述和图标路径
			{
				icon = "res\\daily\\风暴！亚特兰蒂斯.dds",
				desc = _t"风暴！亚特兰蒂斯",
			},
		},
		[3] = 						
		{
			icon = "res\\daily\\北欧小镇.dds",			--图标路径
			desc = _t"大反攻！冰国邪神",			--描述
			pre = 					--上一级的描述和图标路径
			{
				icon = "res\\daily\\传承！黄金试炼.dds",
				desc = _t"传承！黄金试练",
			},
		},
		--...继续配置
	},
	persuit = 			--追求
	{
		[1] = 
		{
			icon = "\\res\\keylevel\\sliver.dds",
			desc = _t"白银圣衣(60级)",
			hint = _t"下一个等级段可以追求第1套白银圣衣！",
		},
		[2] = 
		{
			icon = "\\res\\keylevel\\cosmos3.dds",
			desc = _t"小宇宙7感",
			hint = _t"下一个等级段可以开启小宇宙第7感了！",
		},
		--继续配置
	},
}

LevelHintConfig[6] = 
{
	level = 70,			--目标级别
	persuit = 			--追求
	{
		[1] = 
		{
			icon = "\\res\\keylevel\\sliver.dds",
			desc = _t"白银圣衣二(75级)",
			hint = _t"下一个等级段可以追求第2套白银圣衣！",
		},
		[2] = 
		{
			icon = "\\res\\keylevel\\cosmos4.dds",
			desc = _t"小宇宙8感",
			hint = _t"下一个等级段可以开启小宇宙第8感了！",
		},
		--继续配置
	},
}

LevelHintConfig[7] = 
{
	level = 80,			--目标级别
	persuit = 			--追求
	{
		[1] = 
		{
			icon = "\\res\\keylevel\\gold.dds",
			desc = _t"黄金圣衣",
			hint = _t"下一个等级段可以追求第1套黄金圣衣！",
		},
		--继续配置
	},
}

LevelHintConfig[8] = 
{
	level = 95,			--目标级别
	persuit = 			--追求
	{
		[1] = 
		{
			icon = "\\res\\keylevel\\gold.dds",
			desc = _t"即将进入95级战场分段",
			hint = _t"升到95级后，进入阿提卡、混沌、熔岩、天空等战场时将与95级以上的玩家共同竞技，请慎重选择",
		},
		--继续配置
	},
}	
