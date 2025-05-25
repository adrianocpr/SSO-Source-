--[[ @i18n title ]]
local _t = require("i18n").context("title")

------------------------------title pack-----------------------------
--RACE_IOS			= 1		--希腊伊奥斯岛
--RACE_LUSHAN		= 2		--中国庐山 
--RACE_SIBERIA		= 3		--东西伯利亚
--RACE_ANDROMEDA	= 4		--安多罗美达（仙女岛）
--RACE_DEATHQUEEN	= 5		--死亡皇后岛



title_pack = {}

title_pack[1] = 
{
	name  = _t"I·爱与正义的圣斗士",
	desc1 = _t"永久属性：^ffff00生命力+300/躲闪+15",
	desc2 = _t"集齐以下称号，在圣域基加美修处领取奖励" ,
	image = "\\award\\box1.tga",
	list  = 
	{
		{title = 1001, x = 10, y = 10},
		{title = 1002, x = 10, y = 30},
		{title = 3001, x = 10, y = 50},
		{title = 3002, x = 10, y = 70},
		{title = 1201, x = 10, y = 90},
		{title = 1205, x = 10, y = 110},
	},
	award = 1301,
}

title_pack[2] = 
{
	name  = _t"II·守护和平的圣斗士",
	desc1 = _t"永久属性：^ffff00生命力+300/躲闪+15",
	desc2 = _t"集齐以下称号，在圣域基加美修处领取奖励" ,
	image = "\\award\\box1.tga",
	list  = 
	{
		{title = 1003, x = 10, y = 10},
		{title = 1004, x = 10, y = 30},
		{title = 1101, x = 10, y = 50},
		{title = 3003, x = 10, y = 70},
		{title = 3004, x = 10, y = 90},
		{title = 3005, x = 10, y = 110},
	},
	award = 1302,
}

title_pack[3] = 
{
	name  = _t"III·传承宿命的圣斗士",
	desc1 = _t"永久属性：^ffff00生命力+300/躲闪+15",
	desc2 = _t"集齐以下称号，在圣域基加美修处领取奖励",
	image = "\\award\\box1.tga",
	list  = 
	{
		{title = 1005, x = 10, y = 10},
		{title = 1006, x = 10, y = 30},
		{title = 1102, x = 10, y = 50},
		{title = 3006, x = 10, y = 70},
		{title = 3007, x = 10, y = 90},
		{title = 1202, x = 10, y = 110},
		{title = 1206, x = 10, y = 130},
	},
	award = 1303,
}

title_pack[4] = 
{
	name  = _t"IV·坚守信仰的圣斗士",
	desc1 = _t"永久属性：^ffff00生命力+300/躲闪+15",
	desc2 = _t"集齐以下称号，在圣域基加美修处领取奖励" ,
	image = "\\award\\box1.tga",
	list  = 
	{
		{title = 1007, x = 10, y = 10},
		{title = 1008, x = 10, y = 30},
		{title = 1103, x = 10, y = 50},
		{title = 3008, x = 10, y = 70},
		{title = 3009, x = 10, y = 90},
		{title = 3010, x = 10, y = 110},
	},
	award = 1304,
}

title_pack[5] = 
{
	name  = _t"V·神之考验的圣斗士",
	desc1 = _t"永久属性：^ffff00生命力+300/躲闪+15",
	desc2 = _t"集齐以下称号，在圣域基加美修处领取奖励" ,
	image = "\\award\\box1.tga",
	list  = 
	{
		{title = 1009, x = 10, y = 10},
		{title = 1010, x = 10, y = 30},
		{title = 1104, x = 10, y = 50},
		{title = 1203, x = 10, y = 70},
		{title = 1207, x = 10, y = 90},
	},
	award = 1305,
}

title_pack[6] = 
{
	name  = _t"VI·王道力量的圣斗士",
	desc1 = _t"永久属性：^ffff00生命力+300/躲闪+15",
	desc2 = _t"集齐以下称号，在圣域基加美修处领取奖励" ,
	image = "\\award\\box1.tga",
	list  = 
	{
		{title = 1011, x = 10, y = 10},
		{title = 1012, x = 10, y = 30},
		{title = 1105, x = 10, y = 50},
		{title = 3013, x = 10, y = 70},
		{title = 3014, x = 10, y = 90},
		{title = 3015, x = 10, y = 110},
	},
	award = 1306,
}

title_pack[7] = 
{
	name  = _t"VII·梦幻传奇的圣斗士",
	desc1 = _t"永久属性：^ffff00生命力+300/躲闪+15",
	desc2 = _t"集齐以下称号，在圣域基加美修处领取奖励" ,
	image = "\\award\\box1.tga",
	list  = 
	{
		{title = 1013, x = 10, y = 10},
		{title = 1014, x = 10, y = 30},
		{title = 1106, x = 10, y = 50},
		{title = 1204, x = 10, y = 70},
		{title = 1208, x = 10, y = 90},
		{title = 3016, x = 10, y = 110},
		{title = 3017, x = 10, y = 130},
	},
	award = 1307,
}

title_pack[8] = 
{
	name  = _t"VIII·雅典娜的圣斗士",
	desc1 = _t"永久属性：^ffff00生命力+300/躲闪+15",
	desc2 = _t"集齐以下称号，在圣域基加美修处领取奖励" ,
	image = "\\award\\box1.tga",
	list  = 
	{
		{title = 1015, x = 10, y = 10},
		{title = 1016, x = 10, y = 30},
		{title = 1107, x = 10, y = 50},
		{title = 3018, x = 10, y = 70},
	},
	award = 1308,
}

title_pack[9] = 
{
	name  = _t"IX·传说中的圣斗士",
	desc1 = _t"永久属性：^ffff00生命力+300/躲闪+15",
	desc2 = _t"集齐以下称号，在圣域基加美修处领取奖励" ,
	image = "\\award\\box1.tga",
	list  = 
	{
		{title = 1017, x = 10, y = 10},
		{title = 1018, x = 10, y = 30},
		{title = 1108, x = 10, y = 50},
		{title = 3019, x = 10, y = 70},
	},
	award = 1309,
}


