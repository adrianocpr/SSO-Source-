----------------------------------------
--以下任务完成后，玩家默认形象背上圣衣箱
--

local t = task:new{
	5760,
	5749,
	5752,
	5755,
	5758	
}

function t.on_award(tid)
	GameApi.PlayerShowSaintBox()
end