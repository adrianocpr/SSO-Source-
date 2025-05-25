----守护星座选择配置
--[[  说明：
		name：用于选择职业的时候 显示职业名称
		backimg_choose：选择职业时的背景
		backimg_change：切换职业时的背景
		btn_normal,btn_checked,btn_hover:切换职业界面中每个职业按键的状态图（这个暂时不用了）
		attri1：选择职业的属性值 0~100
		attri_hint1：选择职业时属性的说明
		brief：选择职业界面的简介
		desc：选择职业界面的详细说明
		animation_id: 动画ID  -1表示没有  （这个暂时不用了 可以配置为-1）
		video: 视频文件路径 例如："videos\\mp4\\master_hand.mp4"

		<建议： 建议配置的所有中文不要写在本脚本中，最好写在common.lua这个脚本中，用STRING_TABLE.XXX方式调用，方便日后翻译成其他语言>
--]]

local ProfessionInfo = {}

-- 候补生
ProfessionInfo[1] =
{
		name = STRING_TABLE.PROF_1,
		backimg_choose = "background\\Loading01.jpg",---背景图片
		backimg_change = "background\\Loading01.jpg",---背景图片
		btn_normal = "common\\Button_AddUp.tga",---对应按钮
		btn_checked = "common\\Button_AddDown.tga",---对应按钮被选中
		btn_hover = "common\\Button_AddOnhover.tga",---对应按钮被鼠标划过

		show_1 		= 1,
		title_1		= "",
		attri1_1 	= 100,
		attri2_1 	= 80,
		attri3_1 	= 60,
		attri4_1 	= 100,
		attri5_1 	= 70,
		attri6_1 	= 50,
		attri_hint1_1 = _t"代表伤害能力，数值越高击杀敌人的速度越快",
		attri_hint2_1 = _t"代表生存能力,数值越高越难被击杀",
		attri_hint3_1 = _t"代表对队友的支援能力,让队友输出更高存活能力更强",
		attri_hint4_1 = _t"代表短时间输出大量伤害的能力",
		attri_hint5_1 = _t"代表让敌人进入异常状态的能力",
		attri_hint6_1 = _t"代表让敌人进入异常状态的能力",

		show_2 		= 0,
		title_2		= "",
		attri1_2 	= 100,
		attri2_2 	= 80,
		attri3_2 	= 60,
		attri4_2 	= 100,
		attri5_2 	= 70,
		attri6_2 	= 50,
		attri_hint1_1 = _t"代表伤害能力，数值越高击杀敌人的速度越快",
		attri_hint2_1 = _t"代表生存能力,数值越高越难被击杀",
		attri_hint3_1 = _t"代表对队友的支援能力,让队友输出更高存活能力更强",
		attri_hint4_1 = _t"代表短时间输出大量伤害的能力",
		attri_hint5_1 = _t"代表让敌人进入异常状态的能力",
		attri_hint6_1 = _t"代表攻击距离",

		animation_id = 3,
		video = "videos\\mp4\\master_hand.mp4",
		brief = _t"做战范围：近身\r特长：爆发输出\r独有战术：斗气积攒与爆发、激励队伍、瞬间超速、投技" ,
		desc = _t"守护星座1的简介 啦啦啦 ￥%……*（（……@。。。。"
}

-- 天马
ProfessionInfo[2] =
{
		name = STRING_TABLE.PROF_2,
		backimg_choose = "res\\occupation\\pegasus.tga",
		backimg_change = "res\\occupation\\pegasus.tga",
		btn_normal = "common\\Button_CloseUp.tga",---对应按钮
		btn_checked = "common\\Button_CloseDown.tga",---对应按钮被选中
		btn_hover = "common\\Button_CloseOnhover.tga",---对应按钮被鼠标划过

		show_1 		= 1,
		title_1		= "",
		attri1_1 = 80,
		attri2_1 =80,
		attri3_1 =20,
		attri4_1 =100,
		attri5_1 =60,
		attri6_1 	= 60,
		attri_hint1_1 = _t"代表伤害能力，数值越高击杀敌人的速度越快",
		attri_hint2_1 = _t"代表生存能力,数值越高越难被击杀",
		attri_hint3_1 = _t"代表对队友的支援能力,让队友输出更高存活能力更强",
		attri_hint4_1 = _t"代表短时间输出大量伤害的能力",
		attri_hint5_1 = _t"代表让敌人进入异常状态的能力",
		attri_hint6_1 = _t"代表攻击距离",

		show_2 		= 0,
		title_2		= "",
		attri1_2 = 100,
		attri2_2 =80,
		attri3_2 =40,
		attri4_2 =100,
		attri5_2 =70,
		attri6_2 	= 50,
		attri_hint1_2 = _t"代表伤害能力，数值越高击杀敌人的速度越快",
		attri_hint2_2 = _t"代表生存能力,数值越高越难被击杀",
		attri_hint3_2 = _t"代表对队友的支援能力,让队友输出更高存活能力更强",
		attri_hint4_2 = _t"代表短时间输出大量伤害的能力",
		attri_hint5_2 = _t"代表让敌人进入异常状态的能力",
		attri_hint6_2 = _t"代表攻击距离",

		animation_id = 3001,
		video = "videos\\mp4\\prof02.mp4",
		brief = _t"       ^ffffff作战范围：近身   特长：爆发输出\r\r战术：斗气积攒与爆发、激励队伍\r          瞬间超速、投技",
		desc = _t"^O021^c0d9d9天马座的特点:\r      天马是天生的勇士，能够将斗志化为无尽的力量展开丰富多样的攻击，令敌人胆寒。配合其强大的机动力，能够很好的压制对手。"
}

-- 白鸟
ProfessionInfo[3] =
{
		name = STRING_TABLE.PROF_3,
		backimg_choose = "res\\occupation\\bird.tga",
		backimg_change = "res\\occupation\\bird.tga",
		btn_normal = "common\\Button_ConfirmUp.tga",---对应按钮
		btn_checked = "common\\Button_ConfirmDown.tga",---对应按钮被选中
		btn_hover = "common\\Button_ConfirmOnhover.tga",---对应按钮被鼠标划过

		show_1 		= 1,
		title_1		= "",
		attri1_1 = 80,
		attri2_1 =40,
		attri3_1 =40,
		attri4_1 =60,
		attri5_1 =80,
		attri6_1 	= 100,
		attri_hint1_1 = _t"代表伤害能力，数值越高击杀敌人的速度越快",
		attri_hint2_1 = _t"代表生存能力,数值越高越难被击杀",
		attri_hint3_1 = _t"代表对队友的支援能力,让队友输出更高存活能力更强",
		attri_hint4_1 = _t"代表短时间输出大量伤害的能力",
		attri_hint5_1 = _t"代表让敌人进入异常状态的能力",
		attri_hint6_1 = _t"代表攻击距离",

		show_2 		= 0,
		title_2		= "",
		attri1_2 = 100,
		attri2_2 =80,
		attri3_2 =40,
		attri4_2 =100,
		attri5_2 =70,
		attri6_2 	= 50,
		attri_hint1_2 = _t"代表伤害能力，数值越高击杀敌人的速度越快",
		attri_hint2_2 = _t"代表生存能力,数值越高越难被击杀",
		attri_hint3_2 = _t"代表对队友的支援能力,让队友输出更高存活能力更强",
		attri_hint4_2 = _t"代表短时间输出大量伤害的能力",
		attri_hint5_2 = _t"代表让敌人进入异常状态的能力",
		attri_hint6_2 = _t"代表攻击距离",

		animation_id = 3004,
		video = "videos\\mp4\\prof03.mp4",
		brief = _t"           ^ffffff作战范围：远程  特长：冻结\r\r战术：群体冻结、触发冰爆、冰封区域\r          解除控制",
		desc = _t"^O021^0099cc白鸟座的特点:\r      白鸟是寒冰的化身，能够利用寒冰的力量控制敌人，释放出巨大的伤害。同时白鸟也擅长利用风和雷的力量，玩弄敌人于鼓掌之上"
}

-- 天龙
ProfessionInfo[4] =
{
		name = STRING_TABLE.PROF_4,
		backimg_choose = "res\\occupation\\dragon.tga",
		backimg_change = "res\\occupation\\dragon.tga",
		btn_normal = "common\\Button_DecUp.tga",---对应按钮
		btn_checked = "common\\Button_DecDown.tga",---对应按钮被选中
		btn_hover = "common\\Button_DecOnhover.tga",---对应按钮被鼠标划过

		show_1 		= 1,
		title_1		= "",
		attri1_1 = 80,
		attri2_1 =100,
		attri3_1 =40,
		attri4_1 =80,
		attri5_1 =100,
		attri6_1 	= 60,
		attri_hint1_1 = _t"代表伤害能力，数值越高击杀敌人的速度越快",
		attri_hint2_1 = _t"代表生存能力,数值越高越难被击杀",
		attri_hint3_1 = _t"代表对队友的支援能力,让队友输出更高存活能力更强",
		attri_hint4_1 = _t"代表短时间输出大量伤害的能力",
		attri_hint5_1 = _t"代表让敌人进入异常状态的能力",
		attri_hint6_1 = _t"代表攻击距离",

		show_2 		= 0,
		title_2		= "",
		attri1_2 = 100,
		attri2_2 =80,
		attri3_2 =40,
		attri4_2 =100,
		attri5_2 =70,
		attri6_2 	= 50,
		attri_hint1_2 = _t"代表伤害能力，数值越高击杀敌人的速度越快",
		attri_hint2_2 = _t"代表生存能力,数值越高越难被击杀",
		attri_hint3_2 = _t"代表对队友的支援能力,让队友输出更高存活能力更强",
		attri_hint4_2 = _t"代表短时间输出大量伤害的能力",
		attri_hint5_2 = _t"代表让敌人进入异常状态的能力",
		attri_hint6_2 = _t"代表攻击距离",

		animation_id = 3002,
		video = "videos\\mp4\\prof04.mp4",
		brief = _t"           ^ffffff作战范围：近身  特长：生存\r\r战术：增强回复效果、吸引仇恨\r          群体控制、保护队友" ,
		desc = _t"^O021^33ff99天龙座的特点:\r      天龙在庐山大瀑布下练就了无与伦比的强大力量，这种力量令天龙无往不利。他们拥有过人的体制，能够承受更多的伤害。冲锋陷阵是团队胜利的保证"
}

-- 仙女
ProfessionInfo[5] =
{
		name = STRING_TABLE.PROF_5,
		backimg_choose = "res\\occupation\\fairy.tga",
		backimg_change = "res\\occupation\\fairy.tga",
		btn_normal = "common\\Button_AddUp.tga",---对应按钮
		btn_checked = "common\\Button_AddDown.tga",---对应按钮被选中
		btn_hover = "common\\Button_AddOnhover.tga",---对应按钮被鼠标划过

		show_1 		= 1,
		title_1		= _t"神恩领域",
		attri1_1 = 60,
		attri2_1 =100,
		attri3_1 =100,
		attri4_1 =40,
		attri5_1 =40,
		attri6_1 	= 80,
		attri_hint1_1 = _t"代表伤害能力，数值越高击杀敌人的速度越快",
		attri_hint2_1 = _t"代表生存能力,数值越高越难被击杀",
		attri_hint3_1 = _t"代表对队友的支援能力,让队友输出更高存活能力更强",
		attri_hint4_1 = _t"代表短时间输出大量伤害的能力",
		attri_hint5_1 = _t"代表让敌人进入异常状态的能力",
		attri_hint6_1 = _t"代表攻击距离",

		show_2 		= 1,
		title_2		= _t"神威领域",
		attri1_2 = 80,
		attri2_2 =100,
		attri3_2 =80,
		attri4_2 =80,
		attri5_2 =80,
		attri6_2 	= 80,
		attri_hint1_2 = _t"代表伤害能力，数值越高击杀敌人的速度越快",
		attri_hint2_2 = _t"代表生存能力,数值越高越难被击杀",
		attri_hint3_2 = _t"代表对队友的支援能力,让队友输出更高存活能力更强",
		attri_hint4_2 = _t"代表短时间输出大量伤害的能力",
		attri_hint5_2 = _t"代表让敌人进入异常状态的能力",
		attri_hint6_2 = _t"代表攻击距离",

		animation_id = 3003,
		video = "videos\\mp4\\prof05.mp4",
		brief = _t"           ^ffffff作战范围：中程  特长：支援\r\r战术：切换治疗及输出状态、回复\r          激励队友、束缚、聚拢目标" ,
		desc = _t"^O021^ff3366仙女座的特点:\r        仙女座圣斗士能够在两种领域间切换。神恩领域中他拥有强大的恢复能力，而在神威领域中他又可以运用锁链的力量带给敌人强有力的打击。"
}

-- 凤凰
ProfessionInfo[6] =
{
		name = STRING_TABLE.PROF_6,
		backimg_choose = "res\\occupation\\phoenix.tga",
		backimg_change = "res\\occupation\\phoenix.tga",
		btn_normal = "common\\Button_HelpUp.tga",---对应按钮
		btn_checked = "common\\Button_HelpDown.tga",---对应按钮被选中
		btn_hover = "common\\Button_HelpOnhover.tga",---对应按钮被鼠标划过

		show_1 		= 1,
		title_1		= "",
		attri1_1 = 80,
		attri2_1 =40,
		attri3_1 =20,
		attri4_1 =80,
		attri5_1 =80,
		attri6_1 	= 100,
		attri_hint1_1 = _t"代表伤害能力，数值越高击杀敌人的速度越快",
		attri_hint2_1 = _t"代表生存能力,数值越高越难被击杀",
		attri_hint3_1 = _t"代表对队友的支援能力,让队友输出更高存活能力更强",
		attri_hint4_1 = _t"代表短时间输出大量伤害的能力",
		attri_hint5_1 = _t"代表让敌人进入异常状态的能力",
		attri_hint6_1 = _t"代表攻击距离",

		show_2 		= 0,
		title_2		= "",
		attri1_2 = 100,
		attri2_2 =80,
		attri3_2 =40,
		attri4_2 =100,
		attri5_2 =70,
		attri6_2 	= 50,
		attri_hint1_2 = _t"代表伤害能力，数值越高击杀敌人的速度越快",
		attri_hint2_2 = _t"代表生存能力,数值越高越难被击杀",
		attri_hint3_2 = _t"代表对队友的支援能力,让队友输出更高存活能力更强",
		attri_hint4_2 = _t"代表短时间输出大量伤害的能力",
		attri_hint5_2 = _t"代表让敌人进入异常状态的能力",
		attri_hint6_2 = _t"代表攻击距离",

		animation_id = 3,
		video = "videos\\mp4\\prof06.mp4",
		brief = _t"         ^ffffff作战范围：远程  特长：持续输出\r\r战术：召唤黑暗圣斗士、火焰持续伤害\r          重生" ,
		desc = _t"^O021^cd7f32凤凰座的特点:\r    凤凰座圣斗士是死亡的化身。残酷的历练铸就了他的残暴。他熟练的运用火焰的力量使敌人在痛苦中死去。同时作为不死鸟的化身，他可以浴火重生。"
}


-- 海龙
ProfessionInfo[7] =
{
		name = STRING_TABLE.PROF_7,
		backimg_choose = "res\\occupation\\hailong.tga",
		backimg_change = "res\\occupation\\hailong.tga",
		btn_normal = "common\\Button_ConfirmUp.tga",---对应按钮
		btn_checked = "common\\Button_ConfirmDown.tga",---对应按钮被选中
		btn_hover = "common\\Button_ConfirmOnhover.tga",---对应按钮被鼠标划过

		show_1 		= 1,
		title_1		= _t"善之信仰",
		attri1_1 =60,
		attri2_1 =80,
		attri3_1 =100,
		attri4_1 =40,
		attri5_1 =80,
		attri6_1 =100,
		attri_hint1_1 = _t"代表伤害能力，数值越高击杀敌人的速度越快",
		attri_hint2_1 = _t"代表生存能力,数值越高越难被击杀",
		attri_hint3_1 = _t"代表对队友的支援能力,让队友输出更高存活能力更强",
		attri_hint4_1 = _t"代表短时间输出大量伤害的能力",
		attri_hint5_1 = _t"代表让敌人进入异常状态的能力",
		attri_hint6_1 = _t"代表攻击距离",

		show_2 		= 1,
		title_2		= _t"恶之信仰",
		attri1_2 =100,
		attri2_2 =80,
		attri3_2 =60,
		attri4_2 =80,
		attri5_2 =40,
		attri6_2 =100,
		attri_hint1_2 = _t"代表伤害能力，数值越高击杀敌人的速度越快",
		attri_hint2_2 = _t"代表生存能力,数值越高越难被击杀",
		attri_hint3_2 = _t"代表对队友的支援能力,让队友输出更高存活能力更强",
		attri_hint4_2 = _t"代表短时间输出大量伤害的能力",
		attri_hint5_2 = _t"代表让敌人进入异常状态的能力",
		attri_hint6_2 = _t"代表攻击距离",

		animation_id = 3004,
		video = "videos\\mp4\\prof07.mp4",
		brief = _t"^ffffff范围：远程  特长：幻影、善恶两面\r\r战术：切换人格支援队友或输出伤害、运用幻影迷惑对方" ,
		desc = _t"^O021^CD00CD海龙的特点:\r     拥有善恶两种人格，^FFFF00善良^CD00CD带给他强大的群体回复和控制能力，^EE0000邪恶^CD00CD带给他恐怖的伤害和爆发力。幻影是他的特长，灵活的人格转换是他强有力的武器"
}

-- 未用
ProfessionInfo[8] =
{
		name = STRING_TABLE.PROF_8,
		backimg_choose = "background\\Loading08.jpg",
		backimg_change = "background\\Loading08.jpg",
		btn_normal = "common\\Button_AddUp.tga",---对应按钮
		btn_checked = "common\\Button_AddDown.tga",---对应按钮被选中
		btn_hover = "common\\Button_AddOnhover.tga",---对应按钮被鼠标划过

		show_1 		= 1,
		title_1		= "",
		attri1_1 = 100,
		attri2_1 = 10,
		attri3_1 = 80,
		attri4_1 = 100,
		attri5_1 = 50,
		attri6_1 	= 50,
		attri_hint1_1 = "1232134",
		attri_hint2_1 = "r2352574",
		attri_hint3_1 = "1232!#$$134",
		attri_hint4_1 = "123f234342134",
		attri_hint5_1 = "fffffff",
		attri_hint6_1 = _t"代表让敌人进入异常状态的能力",

		show_2 		= 0,
		title_2		= "",
		attri1_2 = 100,
		attri2_2 =80,
		attri3_2 =40,
		attri4_2 =100,
		attri5_2 =70,
		attri6_2 	= 50,
		attri_hint1_2 = _t"代表伤害能力，数值越高击杀敌人的速度越快",
		attri_hint2_2 = _t"代表生存能力,数值越高越难被击杀",
		attri_hint3_2 = _t"代表对队友的支援能力,让队友输出更高存活能力更强",
		attri_hint4_2 = _t"代表短时间输出大量伤害的能力",
		attri_hint5_2 = _t"代表让敌人进入异常状态的能力",
		attri_hint6_2 = _t"代表攻击距离",

		animation_id = 3,
		video = "videos\\mp4\\master_hand.mp4",
		brief = "22222" ,
		desc = _t"守护星座8的简介 啦啦啦 ￥%……*（（……@。。。。"
}






Choose_Pro = {}
function Choose_Pro:GetInfo (pro)
	if ProfessionInfo[pro]==nil then
	    return "","","","",""
	end
	return	ProfessionInfo[pro].name,
					ProfessionInfo[pro].backimg_choose,
					ProfessionInfo[pro].backimg_change,
					ProfessionInfo[pro].brief,
					ProfessionInfo[pro].desc
end

function Choose_Pro:GetBtnInfo (pro)--- 获得对应按键的图片资源
	if ProfessionInfo[pro]==nil then
	    return "","",""
	end
	return ProfessionInfo[pro].btn_normal,ProfessionInfo[pro].btn_checked,ProfessionInfo[pro].btn_hover
end

function Choose_Pro:GetAttriInfo1 (pro)
	if ProfessionInfo[pro]==nil then
	    return 0,0,0,0,0,0,"","","","","","",0,""
	end
	return ProfessionInfo[pro].attri1_1,ProfessionInfo[pro].attri2_1,ProfessionInfo[pro].attri3_1,ProfessionInfo[pro].attri4_1,ProfessionInfo[pro].attri5_1,ProfessionInfo[pro].attri6_1,
		ProfessionInfo[pro].attri_hint1_1,ProfessionInfo[pro].attri_hint2_1,ProfessionInfo[pro].attri_hint3_1,ProfessionInfo[pro].attri_hint4_1,ProfessionInfo[pro].attri_hint5_1,ProfessionInfo[pro].attri_hint6_1,
		ProfessionInfo[pro].show_1,ProfessionInfo[pro].title_1
end

function Choose_Pro:GetAttriInfo2 (pro)
	if ProfessionInfo[pro]==nil then
	    return 0,0,0,0,0,0,"","","","","","",0,""
	end
	return ProfessionInfo[pro].attri1_2,ProfessionInfo[pro].attri2_2,ProfessionInfo[pro].attri3_2,ProfessionInfo[pro].attri4_2,ProfessionInfo[pro].attri5_2,ProfessionInfo[pro].attri6_2,
		ProfessionInfo[pro].attri_hint1_2,ProfessionInfo[pro].attri_hint2_2,ProfessionInfo[pro].attri_hint3_2,ProfessionInfo[pro].attri_hint4_2,ProfessionInfo[pro].attri_hint5_2,ProfessionInfo[pro].attri_hint6_2,
		ProfessionInfo[pro].show_2,ProfessionInfo[pro].title_2
end

function Choose_Pro:GetAnimationID (pro)---
	if ProfessionInfo[pro]==nil then
	    return -1
	end
	return ProfessionInfo[pro].animation_id
end

function Choose_Pro:GetVideo (pro)---
	if ProfessionInfo[pro]==nil then
	    return ""
	end
	return ProfessionInfo[pro].video
end
