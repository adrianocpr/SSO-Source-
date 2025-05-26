--世界喊话CD配置
chat_cfg = {}

chat_cfg =
{
	chat_forbid_reset = 30001,	-- ms后重置喊话间隔
	chat_forbid_time = --发送x条后，禁言的时间
	{
		[1] = 0,
		[2] = 0,
		[3] = 5000,
		[4] = 10000,
		[5] = 20000,
		[6] = 30000,
	},
	chat_forbid_time_max = 30000,	--	最大禁言时间
}

function chat_cfg:GetForbidTime(curr_chat_num)
	if curr_chat_num == 0 then return 0 end
	local forbid_time = chat_cfg.chat_forbid_time[curr_chat_num]
	if forbid_time ~= nil then return forbid_time
	else return chat_cfg.chat_forbid_time_max
	end
end

function chat_cfg:GetForbidResetTime()
	return chat_cfg.chat_forbid_reset
end