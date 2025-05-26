local REPU_BATTLE 	= 3


repu_data = {
	[56] =
	{
		repu_intro	= _t"战场介绍\r新的圣战即将降临，强大的战士才有资格成为守护女神的圣斗士,40级以上的玩家,开始真正的战斗吧！",
		place_title = _t"战场规格",
		skill_title = _t"声望上限",
		method_title = _t"战场指引",
		place_content = "24v24",
		skill_content = "1000000",
		method_content= "${npc(16355)}",
		coin_icon= "\\special\\achi\\Image_History.tga",
		item_info =
		{
			intro = _t"获得足够战场声望点数之后可到${pos(-182,339,402,2,'夏洛克')}处兑换奖励",
			list=
			{
			  	{grade = 2, id_list = {13066,13522,25857,25867,}, },
				{grade = 3, id_list = {3574,2638,4048,2644,}, },
				{grade = 4, id_list = {8393,8394,8395,8396,8397,}, },

			}
		}
	},
}

repu_dir =	{
	{
		type = REPU_BATTLE,
		name = _t"战场声望点数",
		list = {56,},
	},
}

formatters =
{
	[56] =
	{
		get = _t"获得${name}${point}点",
		lose = _t"失去了${name}${point}点",
	},
}
