LeaderBoard = {}
-------------------------------------
--		慢节奏PVP
-------------------------------------	
local LeisureTopType = 
{
	COPPER = 1,
	SILVER = 2,
	GOLD = 3,
}

LeaderBoard.LeisureTop =
{
	[LeisureTopType.COPPER] = {name = _t"铜榜", id = 4052, roleLevelMin = 40, roleLevelMax = 59,},
	[LeisureTopType.SILVER] = {name = _t"银榜", id = 4051, roleLevelMin = 60, roleLevelMax = 79,},
	[LeisureTopType.GOLD] = {name = _t"金榜", id = 4050, roleLevelMin = 80,},
}
LeaderBoard.LeisureTime =
{
	{
		begin	= { hour = 0, minute = 0, },
		finish	= { hour = 18, minute = 30, },
	},
	{
		begin	= { hour = 20, minute = 00, },
		finish	= { hour = 23, minute = 55, },
	},
}
LeaderBoard.LeisureArena_Time = 
{
	--开始小时，开始分钟，结束小时，结束分钟，技能可设置的持续分钟
	round1 = {beginHour=19,beginMin= 0,endHour=19,endMin=10,skillMin=9,},
	round2 = {beginHour=19,beginMin=10,endHour=19,endMin=20,skillMin=9,},
	round3 = {beginHour=19,beginMin=20,endHour=19,endMin=30,skillMin=9,},
	round4 = {beginHour=19,beginMin=30,endHour=19,endMin=40,skillMin=9,},
	round5 = {beginHour=19,beginMin=40,endHour=19,endMin=50,skillMin=9,},
	award  = {beginHour=19,beginMin=50,endHour=20,endMin=0,},
}

function LeaderBoard:InitLeisureArena()
	GameApi.InitLeisureArenaSettings(self.LeisureTop,self.LeisureArena_Time)
end
LeaderBoard:InitLeisureArena()


function LeaderBoard:IsLeisureTop(top_id)
    for _, top in ipairs(self.LeisureTop) do
        if top.id == top_id then
            return true
        end
    end
    return false
end





-------------------------------------
--		排行榜
-------------------------------------
LeaderBoard.Categories =
{
	{name = _t"个人"; 1,2,11,12,21,22,351,},
	{name = _t"个人战力"; 51,52,53,54,55,56,31,},
	{name = _t"个人即时"; 4000,4001,},
	{name = _t"军团内"; 5001,},
	{name = _t"军团间"; 1001,1601,1002,1701},
}

LeaderBoard.Boards =
{
	[1] = {
					name = _t"等级排行",
					self_rank_text = _t"玩家排名：",
					cols =
					{
						--{type = "hometown", name = "出生地"},
						{type = "prof", name = _t"守护星座"},
						{type = "player_level", name = _t"等级"},
					},
					desc = _t" 玩家获得称号\r     冠军    个人等级排行榜获得第1名\r     亚军    个人等级排行榜获得第2-3名\r     季军    个人等级排行榜获得第4-10名",
				},
	[2] = {
					name = _t"财富排行",
					self_rank_text = _t"玩家排名：",
					cols =
					{
						--{type = "hometown", name = "出生地"},
						{type = "prof", name = _t"守护星座"},
						{type = "gold", name = _t"财富(金)"},
					},
					desc = _t" 玩家获得称号\r     富甲天下    个人财富排行榜获得第1名\r     富可敌国    个人财富排行榜获得第2-3名\r     富贵如云    个人财富排行榜获得第4-10名",
				},
	[11] = {
					name = _t"成就点数",
					self_rank_text = _t"玩家排名：",
					cols =
					{
						--{type = "hometown", name = "出生地"},
						{type = "prof", name = _t"守护星座"},
						{type = "point", name = _t"点数"},
					},
					desc = _t" 玩家获得称号\r     登峰造极    个人成就点数排行榜获得第1名\r     炉火纯青    个人成就点数排行榜获得第2-3名\r     集大成者    个人成就点数排行榜获得第4-10名",
				},
	[12] = {
					name = _t"个人觉悟",
					self_rank_text = _t"玩家排名：",
					cols =
					{
						--{type = "hometown", name = "出生地"},
						{type = "prof", name = _t"守护星座"},
						{type = "value", name = _t"觉悟"},
					},
					desc = _t"",
				},
	[21] = {
					name = _t"星辰史诗",
					self_rank_text = _t"玩家排名：",
					cols =
					{
						--{type = "hometown", name = "出生地"},
						{type = "prof", name = _t"守护星座"},
						{type = "value", name = _t"层数"},
					},
					desc = _t" 玩家获得称号\r     战神化身    个人星辰史诗排行榜获得第1名\r     战争之王    个人星辰史诗排行榜获得第2-3名\r     威名四播    个人星辰史诗排行榜获得第4-10名",
				},
	[22] = {
					name = _t"鲜花值",
					self_rank_text = _t"玩家排名：",
					cols =
					{
						--{type = "hometown", name = "出生地"},
						{type = "prof", name = _t"守护星座"},
						{type = "value", name = _t"鲜花值"},
					},
					desc = _t" 鲜花榜单每天都会刷新；且每周会进行一次总榜刷新，并在每周二维护后发放称号\r 玩家获得称号\r     月下鲜花圆舞曲    个人鲜花排行榜获得第1名\r        玫瑰的爱恋       个人鲜花排行榜获得第2名\r        夏花般灿烂       个人鲜花排行榜获得第3名\r        万花中间过       个人鲜花排行榜获得第4-10名",
				},
	[51] = {
					name = _t"总战力",
					self_rank_text = _t"玩家排名：",
					cols =
					{
						--{type = "hometown", name = "出生地"},
						{type = "prof", name = _t"守护星座"},
						{type = "value", name = _t"战力"},
					},
					desc = _t" 玩家获得称号\r     皇者之姿    个人总战力排行榜获得第1名\r     霸者之姿    个人总战力排行榜获得第2-3名\r     王者之姿    个人总战力排行榜获得第4-10名",
				},
	[52] = {
					name = _t"小宇宙战力",
					self_rank_text = _t"玩家排名：",
					cols =
					{
						--{type = "hometown", name = "出生地"},
						{type = "prof", name = _t"守护星座"},
						{type = "value", name = _t"战力"},
					},
					desc = _t" 玩家获得称号\r     神之领域    个人小宇宙战力排行榜获得第1名\r     宇宙之心    个人小宇宙战力排行榜获得第2-3名\r     阿赖耶识    个人小宇宙战力排行榜获得第4-10名",
				},
	[53] = {
					name = _t"圣衣战力",
					self_rank_text = _t"玩家排名：",
					cols =
					{
						--{type = "hometown", name = "出生地"},
						{type = "prof", name = _t"守护星座"},
						{type = "value", name = _t"战力"},
					},
					desc = _t" 玩家获得称号\r     弑神之衣    个人圣衣战力排行榜获得第1名\r     屠魔之衣    个人圣衣战力排行榜获得第2-3名\r     英雄之衣    个人圣衣战力排行榜获得第4-10名",
				},
	[54] = {
					name = _t"宝物战力",
					self_rank_text = _t"玩家排名：",
					cols =
					{
						--{type = "hometown", name = "出生地"},
						{type = "prof", name = _t"守护星座"},
						{type = "value", name = _t"战力"},
					},
					desc = _t" 玩家获得称号\r     弑神之令    个人宝物战力排行榜获得第1名\r     屠魔之令    个人宝物战力排行榜获得第2-3名\r     英雄之令    个人宝物战力排行榜获得第4-10名",
				},
	[55] = {
					name = _t"装备战力",
					self_rank_text = _t"玩家排名：",
					cols =
					{
						--{type = "hometown", name = "出生地"},
						{type = "prof", name = _t"守护星座"},
						{type = "value", name = _t"战力"},
					},
					desc = _t" 玩家获得称号\r     弑神之契    个人装备战力排行榜获得第1名\r     屠魔之契    个人装备战力排行榜获得第2-3名\r     英雄之契    个人装备战力排行榜获得第4-10名",
				},
	[56] = {
					name = _t"守护星战力",
					self_rank_text = _t"玩家排名：",
					cols =
					{
						--{type = "hometown", name = "出生地"},
						{type = "prof", name = _t"守护星座"},
						{type = "value", name = _t"战力"},
					},
					desc = _t"",
				},
	[31] = {
					name = _t"战神遗迹等级",
					self_rank_text = _t"玩家排名：",
					cols =
					{
						--{type = "hometown", name = "出生地"},
						{type = "prof", name = _t"守护星座"},
						{type = "level2", name = _t"竞技等级"},
						{type = "value", name = _t"竞技战力"},
					},
					desc = _t"",
				},
	[351] = {
					name = _t"周活跃度",
					self_rank_text = _t"玩家排名：",
					cols =
					{
						--{type = "hometown", name = "出生地"},
						{type = "prof", name = _t"守护星座"},
						{type = "point", name = _t"活跃度"},
					},
					desc = _t" 玩家获得称号\r     教皇    个人周活跃度排行榜获得第1名\r     长老    个人周活跃度排行榜获得第2-10名\r     祭司    个人周活跃度排行榜获得第11-100名\r     门徒    个人周活跃度排行榜获得第101-200名",
				},
	[1001]= {
					name = _t"军团规模",
					self_rank_text = _t"军团排名：",
					cols =
					{
						{type = "level", name = _t"规模"},
					},
					desc = _t"",
				},
	[1002]= {
					name = _t"军团战力",
					self_rank_text = _t"军团排名：",
					cols =
					{
						{type = "value", name = _t"战力统计"},
					},
					desc = _t"  军团战力为军团内历史最高战力前60名玩家的历史最高战力总和\r  战力前两名的军团无法与其他军团结成联盟",
				},
	[1108]= {
					name = _t"战魂点数",
					self_rank_text = _t"军团排名：",
					cols =
					{
						{type = "point", name = _t"战魂点数"},
					},
					desc = _t"",
				},
	[1601]= {
					name = _t"周活跃度",
					self_rank_text = _t"军团排名：",
					cols =
					{
						{type = "point", name = _t"军团活跃度"},
					},
					desc = _t"军团长获得称号：\r史诗军团神圣之章     军团周活跃度排行榜获得第一名         获得金币：14400000     获得贡献奖章：25\r  传说军团之章         军团周活跃度排行榜获得第二名         获得金币：12800000     获得贡献奖章：20\r  至高军团之章         军团周活跃度排行榜获得第三名         获得金币：12800000     获得贡献奖章：15\r  无尚军团之章         军团周活跃度排行榜获得第四到十名   获得金币：9600000       获得贡献奖章：10\r  荣耀军团之章         军团周活跃度排行榜获得第十一到二十名      获得金币：6400000\r  璀璨军团之章         军团周活跃度排行榜获得第二十一到三十名    获得金币：4800000\r  光辉军团之章         军团周活跃度排行榜获得第三十一到四十名    获得金币：3200000\r  激励军团之章         军团周活跃度排行榜获得第四十一到五十名    获得金币：1600000",
				},
	[1701]= {
					name = _t"跨服积分",
					self_rank_text = _t"军团排名：",
					cols =
					{
						{type = "point", name = _t"跨服积分"},
					},
					desc = _t"截止到7月29日23:59，排名最高的6个军团获得参加第二届军团跨服赛的资格",
				},	
	[2051] = {
					name = _t"跨服竞技",
					self_rank_text = _t"玩家排名：",
					cols =
					{
						--{type = "hometown", name = "出生地"},
						{type = "prof", name = _t"守护星座"},
						{type = "value", name = _t"战力"},
					},
					desc = _t" 前30名玩家获得跨服队长资格，可以带领队伍参加跨服竞技报名",
				},
	[4000] = {
					name = _t"等级排行",
					self_rank_text = _t"玩家排名：",
					cols =
					{
						--{type = "hometown", name = "出生地"},
						{type = "prof", name = _t"守护星座"},
						{type = "player_level", name = _t"等级"},
					},
					desc = _t"",
				},
	[4001] = {
					name = _t"战力排行",
					self_rank_text = _t"玩家排名：",
					cols =
					{
						{type = "prof", name = _t"守护星座"},
						{type = "value", name = _t"战力"},
						{type = "player_level2", name = _t"等级"},
					},
					desc = _t"",
				},
	[5001] = {
					name = _t"等级排行",
					self_rank_text = _t"玩家排名：",
					cols =
					{
						--{type = "hometown", name = "出生地"},
						{type = "prof", name = _t"守护星座"},
						{type = "player_level", name = _t"等级"},
					},
					desc = _t"",
				},
	--[[[5051] = {
					name = "战力排行",
					self_rank_text = "玩家排名：",
					cols =
					{
						--{type = "hometown", name = "出生地"},
						{type = "prof", name = "守护星座"},
						{type = "value", name = "战力"},
					},
					desc = _t"",
				},
	[5351] = {
					name = "本周活跃度",
					self_rank_text = "玩家排名：",
					cols =
					{
						--{type = "hometown", name = "出生地"},
						{type = "prof", name = "守护星座"},
						{type = "value", name = "活跃度"},
					},
					desc = _t"",
				},]]
	--[[[7351] = {
					name = "上周活跃度",
					self_rank_text = "玩家排名：",
					cols =
					{
						--{type = "hometown", name = "出生地"},
						{type = "prof", name = "守护星座"},
						{type = "value", name = "活跃度"},
					},
					desc = _t"",
				},]]
	--[[[5602] = {
					name = "本周贡献度",
					self_rank_text = "玩家排名：",
					cols =
					{
						--{type = "hometown", name = "出生地"},
						{type = "prof", name = "守护星座"},
						{type = "value", name = "贡献"},
					},
					desc = _t"",
				},]]
	--[[[7602] = {
					name = "上周贡献度",
					self_rank_text = "玩家排名：",
					cols =
					{
						--{type = "hometown", name = "出生地"},
						{type = "prof", name = "守护星座"},
						{type = "value", name = "贡献"},
					},
					desc = _t"",
				},]]
}

LeaderBoard.Formaters =
{
	hometown = function(data)
		return data.hometown ~= nil and STRING_TABLE["ITEMDESC_RACE"..data.hometown] or _t"未知"
	end,

	prof = function(data)
		if data.isprof2 then
		return STRING_TABLE["PROF2_"..data.prof] or _t"未知"
		end
		return STRING_TABLE["PROF_"..data.prof] or _t"未知"
	end,

	value = function(data)
		return ""..data.value
	end,

	level = function(data)
		return data.value .. _t"级"
	end,

	player_level = function(data)
		return format_string:player_lev(data.value, true)
	end,

	player_level2 = function(data)
		return format_string:player_lev(data.level2, true)
	end,
	
	level2 = function(data)
		return data.level2 .. _t"级"
	end,

	people = function(data)
		return data.value .. _t"人"
	end,

	gold = function(data)
    	local money = data.value
         if money >= 100000000 then
             local big  = math.modf(money/100000000)
             local small = math.modf(math.mod(money,100000000)/10000)   
             return big .._t"亿"..((small == 0) and "" or (small .._t"万"))
         elseif money >= 10000 then
             local big  = math.modf(money/10000)
             local small = math.mod(money,10000)  
             return big .. _t"万"..((small == 0) and "" or small)
         else
             return data.value ..""   
         end
         return "0"
	end,
	
	point = function(data)
		return data.value .. _t"点"
	end,
}
