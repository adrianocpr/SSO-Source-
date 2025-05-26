--------------------------------------------
-- 签到任务相关配置
-- Created by Fengbo

--------------------------------------------
-- 本文件需要在客户端和服务器保持一致内容
-- 客户端脚本路径: SDSScript/quest/daily_sign_in.lua
-- 服务器端脚本路径: SDS_ServerData/script/taskscript/conf/daily_sign_in.lua

-- 用于每日签到的任务ID
daily_sign_in_task_id = 1437

-- 起始奖励配置（前N天的奖励），若按完成次数未找到起始奖励配置，则使用星期奖励配置。
-- 另外需要注意，任务在发放奖励时，会先增加任务计数，然后才发放奖励。
--[[
newbee_award =
{
	[1] = {										-- 任务完成次数为1时的奖励
		[0] = {									-- 玩家等级小于30级时的奖励
			exp = 10000,								-- 发放经验
			bind_money = 10000,							-- 发放绑定币
			bind_cash = 100,							-- 发放绑定元宝
			luck_draw = {								-- 抽奖奖励
				id = 234, 								-- 抽奖模板id
				base_money = 10000, 					-- 抽奖基础金币
				base_bind_money = 10000, 				-- 抽奖基础绑定币
				base_exp = 5000,						-- 抽奖基础经验
			},
			{item_id = 123, item_count = 3},			-- 奖励物品123，数量3个 (物品默认绑定)
			{item_id = 456},							-- 数量为1时可以不写	(物品默认绑定)
			{item_id = 456, bind = false},				-- 发放非绑定物品
		},
		[30] = {									-- 玩家等级大于等于30级时的奖励
			{item_id = 123, item_count = 3},
			{item_id = 456, item_count = 3},
		},
	},
	[2] = {										-- 任务完成次数为2时的奖励
		[0] = {
			{item_id = 123, item_count = 3},
		},
		[30] = {
			{item_id = 123, item_count = 3},
		},
	},
}
--]]

newbee_award =
{
	[1] = {
		[0] = {
			exp = 100000,
			bind_cash = 200,
			{item_id = 12159, bind = true},
		},
	},
	[2] = {
		[0] = {
			exp = 200000,
			bind_cash = 300,
			{item_id = 15316, bind = true},
		},
	},
	[3] = {
		[0] = {
			exp = 500000,
			bind_cash = 500,
			{item_id = 14909, bind = true},
		},
	},
}

-- 星期奖励配置
--[[
weekday_award =
{
	[0] = {										-- 星期日奖励
		[0] = {									-- 玩家等级小于30级时的奖励
			exp = 10000,								-- 发放经验
			bind_money = 10000,							-- 发放绑定币
			bind_cash = 100,							-- 发放绑定元宝
			{item_id = 123, item_count = 3},			-- 奖励物品123，数量3个 (物品默认绑定)
			{item_id = 456},							-- 数量为1时可以不写	(物品默认绑定)
			{item_id = 456, bind = false},				-- 发放非绑定物品
		},
		[30] = {									-- 玩家等级大于等于30级时的奖励
			{item_id = 123, item_count = 3},
			{item_id = 456, item_count = 3},
		},
	},
	[1] = {										-- 星期一奖励
		[0] = {
			{item_id = 123, item_count = 3},
		},
		[30] = {
			{item_id = 456, item_count = 3},
		},
	},
	[2] = {										-- 星期二奖励
		[0] = {
			{item_id = 123, item_count = 3},
		},
		[30] = {
			{item_id = 123, item_count = 3},
		},
	},
}
--]]

weekday_award =
{
	[0] = {
		[0] = {
			bind_cash = 50,
			{item_id = 10758, item_count = 5},
			luck_draw = {								-- 抽奖奖励
				id = 25828, 							-- 抽奖模板id
				base_bind_money = 3000, 				-- 抽奖基础绑定币
				base_exp = 100000,						-- 抽奖基础经验
			},
		},
		[26] = {
			bind_cash = 50,
			{item_id = 27035, item_count = 2},
			luck_draw = {								-- 抽奖奖励
				id = 25828, 							-- 抽奖模板id
				base_bind_money = 3000, 				-- 抽奖基础绑定币
				base_exp = 100000,						-- 抽奖基础经验
			},
		},
		[60] = {
			bind_cash = 80,
			{item_id = 27036, item_count = 2},
			luck_draw = {								-- 抽奖奖励
				id = 25829, 							-- 抽奖模板id
				base_bind_money = 6000, 				-- 抽奖基础绑定币
				base_exp = 300000,						-- 抽奖基础经验
			},
		},
		[100] = {
			bind_cash = 80,
			{item_id = 27036, item_count = 2},
			luck_draw = {								-- 抽奖奖励
				id = 25829, 							-- 抽奖模板id
				base_bind_money = 10000, 				-- 抽奖基础绑定币
				base_exp2 = 50000,						-- 抽奖基础经验
			},
		},
	},
	[1] = {
		[0] = {
			bind_cash = 50,
			{item_id = 15392, item_count = 5},
			luck_draw = {								-- 抽奖奖励
				id = 25828, 							-- 抽奖模板id
				base_bind_money = 3000, 				-- 抽奖基础绑定币
				base_exp = 100000,						-- 抽奖基础经验
			},
		},
		[26] = {
			bind_cash = 50,
			{item_id = 13066, item_count = 2},
			luck_draw = {								-- 抽奖奖励
				id = 25828, 							-- 抽奖模板id
				base_bind_money = 3000, 				-- 抽奖基础绑定币
				base_exp = 100000,						-- 抽奖基础经验
			},
		},
		[60] = {
			bind_cash = 80,
			{item_id = 13066, item_count = 3},
			luck_draw = {								-- 抽奖奖励
				id = 25829, 							-- 抽奖模板id
				base_bind_money = 6000, 				-- 抽奖基础绑定币
				base_exp = 300000,						-- 抽奖基础经验
			},
		},
		[100] = {
			bind_cash = 80,
			{item_id = 13066, item_count = 3},
			luck_draw = {								-- 抽奖奖励
				id = 25829, 							-- 抽奖模板id
				base_bind_money = 10000, 				-- 抽奖基础绑定币
				base_exp2 = 50000,						-- 抽奖基础经验
			},
		},
	},
	[2] = {
		[0] = {
			bind_cash = 50,
			{item_id = 5114, item_count = 5},
			luck_draw = {								-- 抽奖奖励
				id = 25828, 							-- 抽奖模板id
				base_bind_money = 3000, 				-- 抽奖基础绑定币
				base_exp = 100000,						-- 抽奖基础经验
			},
		},
		[26] = {
			bind_cash = 50,
			{item_id = 5114, item_count = 20},
			luck_draw = {								-- 抽奖奖励
				id = 25828, 							-- 抽奖模板id
				base_bind_money = 3000, 				-- 抽奖基础绑定币
				base_exp = 100000,						-- 抽奖基础经验
			},
		},
		[60] = {
			bind_cash = 80,
			{item_id = 9838, item_count = 20},
			luck_draw = {								-- 抽奖奖励
				id = 25829, 							-- 抽奖模板id
				base_bind_money = 6000, 				-- 抽奖基础绑定币
				base_exp = 300000,						-- 抽奖基础经验
			},
		},
		[100] = {
			bind_cash = 80,
			{item_id = 9838, item_count = 20},
			luck_draw = {								-- 抽奖奖励
				id = 25829, 							-- 抽奖模板id
				base_bind_money = 10000, 				-- 抽奖基础绑定币
				base_exp2 = 50000,						-- 抽奖基础经验
			},
		},
	},
	[3] = {
		[0] = {
			bind_cash = 50,
			{item_id = 3093, item_count = 1},
			luck_draw = {								-- 抽奖奖励
				id = 25828, 							-- 抽奖模板id
				base_bind_money = 3000, 				-- 抽奖基础绑定币
				base_exp = 100000,						-- 抽奖基础经验
			},
		},
		[26] = {
			bind_cash = 50,
			{item_id = 18367, item_count = 1},
			luck_draw = {								-- 抽奖奖励
				id = 25828, 							-- 抽奖模板id
				base_bind_money = 3000, 				-- 抽奖基础绑定币
				base_exp = 100000,						-- 抽奖基础经验
			},
		},
		[60] = {
			bind_cash = 80,
			{item_id = 18368, item_count = 1},
			luck_draw = {								-- 抽奖奖励
				id = 25829, 							-- 抽奖模板id
				base_bind_money = 6000, 				-- 抽奖基础绑定币
				base_exp = 300000,						-- 抽奖基础经验
			},
		},
		[100] = {
			bind_cash = 80,
			{item_id = 18368, item_count = 2},
			luck_draw = {								-- 抽奖奖励
				id = 25829, 							-- 抽奖模板id
				base_bind_money = 10000, 				-- 抽奖基础绑定币
				base_exp2 = 50000,						-- 抽奖基础经验
			},
		},
	},
	[4] = {
		[0] = {
			bind_cash = 50,
			{item_id = 15392, item_count = 5},
			luck_draw = {								-- 抽奖奖励
				id = 25828, 							-- 抽奖模板id
				base_bind_money = 3000, 				-- 抽奖基础绑定币
				base_exp = 100000,						-- 抽奖基础经验
			},
		},
		[26] = {
			bind_cash = 50,
			{item_id = 11777, item_count = 10},
			luck_draw = {								-- 抽奖奖励
				id = 25828, 							-- 抽奖模板id
				base_bind_money = 3000, 				-- 抽奖基础绑定币
				base_exp = 100000,						-- 抽奖基础经验
			},
		},
		[60] = {
			bind_cash = 80,
			{item_id = 13580, item_count = 5},
			luck_draw = {								-- 抽奖奖励
				id = 25829, 							-- 抽奖模板id
				base_bind_money = 6000, 				-- 抽奖基础绑定币
				base_exp = 300000,						-- 抽奖基础经验
			},
		},
		[100] = {
			bind_cash = 80,
			{item_id = 13580, item_count = 5},
			luck_draw = {								-- 抽奖奖励
				id = 25829, 							-- 抽奖模板id
				base_bind_money = 10000, 				-- 抽奖基础绑定币
				base_exp2 = 50000,						-- 抽奖基础经验
			},
		},
	},
	[5] = {
		[0] = {
			bind_cash = 50,
			{item_id = 10758, item_count = 10},
			luck_draw = {								-- 抽奖奖励
				id = 25828, 							-- 抽奖模板id
				base_bind_money = 3000, 				-- 抽奖基础绑定币
				base_exp = 100000,						-- 抽奖基础经验
			},
		},
		[26] = {
			bind_cash = 50,
			{item_id = 14906, item_count = 1},
			luck_draw = {								-- 抽奖奖励
				id = 25828, 							-- 抽奖模板id
				base_bind_money = 3000, 				-- 抽奖基础绑定币
				base_exp = 100000,						-- 抽奖基础经验
			},
		},
		[60] = {
			bind_cash = 80,
			{item_id = 14906, item_count = 2},
			luck_draw = {								-- 抽奖奖励
				id = 25829, 							-- 抽奖模板id
				base_bind_money = 6000, 				-- 抽奖基础绑定币
				base_exp = 300000,						-- 抽奖基础经验
			},
		},
		[100] = {
			bind_cash = 80,
			{item_id = 14906, item_count = 2},
			luck_draw = {								-- 抽奖奖励
				id = 25829, 							-- 抽奖模板id
				base_bind_money = 10000, 				-- 抽奖基础绑定币
				base_exp2 = 50000,						-- 抽奖基础经验
			},
		},
	},
	[6] = {
		[0] = {
			bind_cash = 50,
			{item_id = 15392, item_count = 5},
			luck_draw = {								-- 抽奖奖励
				id = 25828, 							-- 抽奖模板id
				base_bind_money = 3000, 				-- 抽奖基础绑定币
				base_exp = 100000,						-- 抽奖基础经验
			},
		},
		[26] = {
			bind_cash = 50,
			{item_id = 13522, item_count = 2},
			luck_draw = {								-- 抽奖奖励
				id = 25828, 							-- 抽奖模板id
				base_bind_money = 3000, 				-- 抽奖基础绑定币
				base_exp = 100000,						-- 抽奖基础经验
			},
		},
		[60] = {
			bind_cash = 80,
			{item_id = 13523, item_count = 2},
			luck_draw = {								-- 抽奖奖励
				id = 25829, 							-- 抽奖模板id
				base_bind_money = 6000, 				-- 抽奖基础绑定币
				base_exp = 300000,						-- 抽奖基础经验
			},
		},
		[100] = {
			bind_cash = 80,
			{item_id = 13523, item_count = 2},
			luck_draw = {								-- 抽奖奖励
				id = 25829, 							-- 抽奖模板id
				base_bind_money = 10000, 				-- 抽奖基础绑定币
				base_exp2 = 50000,						-- 抽奖基础经验
			},
		},
	},
}
