module("JumpConfig", package.seeall)

_M[1] =
{
	name = _t"角色属性",
	key = LKEY_UI_SHOWDLG_CHARACTER,
	jump = function ()
		GameApi.PopupAttributeInterface()
	end,
}

_M[2] =
{
	name = _t"商城",
	key = LKEY_UI_SHOWDLG_CASHSHOP,
	jump = "Panel_Gshop",
}

_M[3] =
{
	name = _t"BOSS争夺战",
	jump = function()
		DlgApi.CheckRadioButton("Panel_Daily", 1, 6)
		DlgApi.ShowDialog("Panel_Daily", true)
	end,
}

_M[4] =
{
	name = _t"背包",
	key = LKEY_UI_SHOWDLG_INVENTORY,
	jump = function ()
		GameApi.PopupInventoryInterface()
	end,
}

_M[5] =
{
	name = _t"任务列表",
	key = LKEY_UI_SHOWDLG_TASK,
	jump = function ()
		GameApi.PopupTaskInterface()
	end,
}

_M[6] =
{
	name = _t"战斗技能",
	jump = function()
		DlgApi.CheckRadioButton("Panel_Skills", 1, 1)
		DlgApi.ShowDialog("Panel_Skills", true)
	end,
}

_M[7] =
{
	name = _t"地图",
	key =LKEY_UI_SHOWDLG_WORLDMAP,
	jump = function ()
		GameApi.PopupWorldMapInterface()
	end,
}

_M[8] =
{
	name = _t"小宇宙",
	key = LKEY_UI_SHOWDLG_KOSUMO,
	jump = "Panel_CosmosMain",
	validated = function ()
		return GameApi.IsCosmosActive()
	end,
}

_M[9] =
{
	name = _t"圣衣",
	key = LKEY_UI_SHOWDLG_SAINTCLOTH,
	jump = "Panel_SaintCloth",
}

_M[10] =
{
	name = _t"好友",
	key = LKEY_UI_SHOWDLG_FRIEND,
	jump = function ()
		GameApi.PopupFriendInterface()
	end,
}

_M[11] =
{
	name = _t"指引",
	jump = "Panel_Guide",
}

_M[12] =
{
	name = _t"军团",
	key = LKEY_UI_SHOWDLG_LEAGUE,
	jump = function ()
		GameApi.PopupLeague()
	end,
}

_M[13] =
{
	name = _t"排行榜",
	key = LKEY_UI_SHOWDLG_RANKLIST,
	jump = "Panel_Top",
}

_M[14] =
{
	name = _t"未知",
	jump = "",
	validated = false,
}

_M[15] =
{
	name = _t"摄像机",--名字不对吧？
	key = LKEY_UI_SHOWDLG_PRODUCE,
	jump = "Panel_Produce",
}

_M[16] =
{
	name = _t"小伙伴",
	jump = function()
			DlgApi.CheckRadioButton("Panel_Pet", 1, 1)
			DlgApi.ShowDialog("Panel_Pet", true)
		   end,
}

_M[17] =
{
	name = _t"系统设置",
	key = LKEY_UI_SHOWDLG_SYSTEM,
	jump = "Panel_Esc",
}

_M[18] =
{
	name = _t"日程表（点击此处）",
	key = LKEY_UI_SHOWDLG_DAILY,
	jump = function()
		GameApi.PopupDailyInterface("Panel_First")
	end,
	validated_level_min = 15,
}

_M[19] =
{
	name = _t"未知",
	key = LKEY_UI_SHOWDLG_GROUP,
}

_M[20] =
{
	name = _t"圈子",
	key = LKEY_UI_SHOWDLG_CIRCLE,
	jump = function ()
		GameApi.PopupCircleInterface()
	end,
}

_M[21] =
{
	name = _t"小伙伴",
	key = LKEY_UI_SHOWDLG_MINIPET,
	jump = "Panel_Pet",
}

_M[22] =
{
	name = _t"图鉴",
	key = LKEY_UI_SHOWDLG_PHOTOBOOK,
	jump = "Panel_PhotoBook",
}

_M[23] =
{
	name = _t"成就",
	jump = function ()
		GameApi.PopupAchievementInterface()
	end,
}

_M[24] =
{
	name = _t"声望",
	key = LKEY_UI_SHOWDLG_REPUTE,
	jump = "Panel_Reputation",
}

_M[25] =
{
	name = _t"斗魂",
	key = LKEY_UI_SHOWDLG_SOULSKILL,
	jump = "Panel_RoleInfoGift",
}

_M[26] =
{
	name = _t"英雄竞技场",
	jump = "Panel_LeisureTop",
}

_M[27] =
{
	name = _t"连招编辑器",
	key = LKEY_UI_SHOWDLG_SEQUENCE,
	jump = "Panel_SequenceEditor",
	validated_level_min = 20,--最小有效等级
}

_M[28] =
{
	name = _t"称号",
	jump = "Panel_Title",
}

_M[29] =
{
	name = _t"安全锁",
	jump = "Panel_LockMain",
}

_M[30] =
{
	name = "VIP",
	key = LKEY_UI_SHOWDLG_VIP,
	jump = "Panel_Vip",
}

_M[31] =
{
	name = _t"PK设置",
	jump = "Panel_PKSettings",
}

_M[32] =
{
	name = _t"IE窗口",
	jump = "Panel_IE",
}

_M[33] =
{
	name = _t"帮助",
	jump = "Panel_Help",
	validated = false,
}

_M[34] =
{
	name = _t"基础技能",
	jump = function()
				DlgApi.CheckRadioButton("Panel_Skills", 1, 0)
				DlgApi.ShowDialog("Panel_Skills", true)
		   end,
}

_M[35] =
{
	name = _t"魔盒",
	jump = function()
				if DlgApi.IsDialogShow("Panel_MagicBox") then
					DlgApiEx.SendDlgCommand(UIMAN_INGAME,"Panel_MagicBox","IDCANCEL")
				else
					DlgApiEx.SendDlgCommand(UIMAN_INGAME, "Panel_Bag", "Button_magicbox")
				end
			end,
}

_M[36] =
{
	name = _t"摆摊",
	jump = function()
				if DlgApi.IsDialogShow("Panel_StallHost") then
					DlgApi.ShowDialog("Panel_StallHost",false)
				else
					DlgApiEx.SendDlgCommand(UIMAN_INGAME, "Panel_Bag", "Button_Booth")
				end
			end,
}

_M[37] =
{
	name = _t"技能",
	key = LKEY_UI_SHOWDLG_SKILL,
	jump = function ()
		GameApi.PopupSkillInterface()
	end
}

_M[38] =
{
	name = _t"生产",
	key = LKEY_UI_SHOWDLG_PRODUCE,
	jump = "Panel_Produce",
	validated_level_min = 30,
}

_M[39] =
{
	name = _t"活动",
	jump = "Panel_First",
}

_M[40] =
{
	name = _t"珍宝",
	jump = "Panel_Treasure",
	validated = false,
}

_M[41] =
{
	name = _t"随身服务",
	jump = function ()
				DlgApiEx.SendDlgCommand(UIMAN_INGAME, "Panel_SubVip2", "Button_SelfService")
		   end,
	validated = false,
}

_M[42] =
{
	name = _t"照相",
	key = LKEY_UI_SHOWDLG_CAMERA,
	jump = "Panel_Shots",
}

_M[43] =
{
	name = _t"守护星",
	key = LKEY_UI_SHOWDLG_PET,
	jump = "Panel_Follower",
	validated_level_min = 59,
}

_M[44] =
{
	name = _t"进程",
	key = LKEY_UI_SHOWDLG_COURSE,
	jump = "Panel_Time",
}

_M[45] =
{
	name = _t"隐玩家",
	key = LKEY_HIDE_PLAYERMODEL,
	jump = function ()
		GameApi.HidePlayerModel()
	end,
}

_M[46] =
{
	name = _t"隐陪伴",
	key = LKEY_HIDE_PETMODEL,
	jump = function ()
		GameApi.HidePetModel()
	end,
}

_M[47] =
{
	name = _t"挂机",
	jump = function ()
				GameApi.PressQuick(47)
		   end,
}

_M[48] =
{
	name = _t"交谈",
	jump = function ()
				GameApi.PressQuick(48)
		   end,
}

_M[49] =
{
	name = _t"防卡",
	jump = function ()
				GameApi.PressQuick(49)
		   end,
}

_M[50] =
{
	name = _t"修炼",
	jump = function()
				DlgApi.CheckRadioButton("Panel_Skills", 1, 3)
				DlgApi.ShowDialog("Panel_Skills", true)
		   end,
}

_M[51] =
{
	name = _t"品阶",
	jump = function()
				DlgApiEx.SendDlgCommand(UIMAN_INGAME, "Panel_Bag", "Button_magicbox")
				DlgApiEx.SendDlgCommand(UIMAN_INGAME, "Panel_MagicBox", "Radio_combine")
				DlgApi.CheckRadioButton("Panel_MagicBox", 1, 2)
		   end,
}

_M[52] =
{
	name = _t"符文镶嵌npc寻径",
	jump = function()
				GameApi.RouteTo(11576, 0) --有（temlid，lineid）和 （x,y,z,mapid，lineid）两种参数形式
		   end,
}

_M[53] =
{
	name = _t"竞技",
	jump = function()
				if GameApi.IsArenaForbidden() then
					DlgApiEx.MsgBox("", MB_OK, STRING_TABLE.ARENA_FORBIDDEN)
					return
				end
				DlgApi.ShowDialog("Panel_Arena", true)
		   end,
}

_M[54] =
{
	name = _t"贵鬼辞典",
	jump = function()
				local count = GameApi.GetHostRepuValue(43) < 99 and GameApi.GetTaskFinishedCount(5642) or GameApi.GetTaskFinishedCount(6855)
				if count < 1 then
					local is_show = DlgApi.IsDialogShow("Panel_Question")
					DlgApi.ShowDialog("Panel_Question", not is_show)
				end
		   end,
}

_M[55] =
{
	name = _t"女神宝库",
	key = LKEY_UI_SHOWDLG_QUEST,
	jump = function ()
		GameApi.PopupQuestBenefitLibInterface()
	end,
	validated_level_min = 50,
}

_M[56] =
{
	name = _t"可接任务",
	jump = function()
				local dlg = ui.dialog.get("Panel_Quest")
				dlg:show()
				DlgApiEx.SendDlgCommand(UIMAN_INGAME, dlg.name, "Radio_Category3")
		   end,
}
_M[57] =
{
	name = _t"战力体检",
	jump = function()
				DlgApi.ShowDialog('Panel_GuideExam',true)
		   end,
	validated = false,
}
_M[58] =
{
	name = _t"个人竞技场",
	jump = function()
				if GameApi.IsArenaForbidden() then
					DlgApiEx.MsgBox("", MB_OK, STRING_TABLE.ARENA_FORBIDDEN)
					return
				end
				DlgApi.ShowDialog("Panel_Arena", true)
		   end,
	validated_level_min = 55,
}

_M[59] =
{
	name = _t"占星",
	jump = function()
			local dlg = ui.dialog.get("Panel_CosmosMain")
			dlg:show()
			DlgApiEx.SendDlgCommand(UIMAN_INGAME, "Panel_Cosmos", "Button_astr")
		end,
}

_M[60] =
{
	name = _t"守护星军需官寻径",
	jump = function()
				GameApi.RouteTo(22956, 0) --有（temlid，lineid）和 （x,y,z,mapid，lineid）两种参数形式
		   end,
}


_M[61] =
{
	name = _t"车田正美寻径",
	jump = function()
				GameApi.RouteTo(9187, 0) --有（temlid，lineid）和 （x,y,z,mapid，lineid）两种参数形式
		   end,
}


_M[62] =
{
	name = _t"魔盒分解",
	jump = function()
				DlgApiEx.SendDlgCommand(UIMAN_INGAME, "Panel_Bag", "Button_magicbox")
				DlgApiEx.SendDlgCommand(UIMAN_INGAME, "Panel_MagicBox", "Radio_combine")
				DlgApi.CheckRadioButton("Panel_MagicBox", 1, 1)
		   end,
}

_M[63] =
{
	name = _t"点击查看详细",
	jump = "Panel_GuideStage",
}

_M[64] =
{
	name = _t"阿尔泰寻径",
	jump = function()
				GameApi.RouteTo(17440, 0) --有（temlid，lineid）和 （x,y,z,mapid，lineid）两种参数形式
		   end,
}

_M[65] =
{
	name = _t"守卫十二宫",
	jump = "Panel_SureAthena",
	validated = function()
		return GameApi.IsAthenaOpenToHost()
	end
}

_M[66] =
{
	name = _t"电台",
	jump = "Panel_Broadcast",
}

_M[67] =
{
	name = _t"生产技能训练师寻径",
	jump = function()
				GameApi.RouteTo(17542, 0) --有（temlid，lineid）和 （x,y,z,mapid，lineid）两种参数形式
		   end,
}

_M[68] =
{
	name = _t"工艺师寻径",
	jump = function()
				GameApi.RouteTo(11579, 0) --有（temlid，lineid）和 （x,y,z,mapid，lineid）两种参数形式
		   end,
}

_M[69] =
{
	name = _t"雅典娜",
	jump = "Panel_AthenaSure",
}

_M[70] =
{
	name = _t"星币交易",
	jump = "Panel_StarAuction",
	--validated = false,
}

_M[71] =
{
	name = _t"观星",
	key = LKEY_UI_SHOWDLG_STAREXPLORE,
	jump = "Panel_Explore",
	validated = function()
		local count = GameApi.GetTaskFinishedCount(9514)
		return count and count >= 1
	end,
}

_M[72] =
{
	name = _t"师徒",
	jump = "Panel_Teacher",
}

_M[73] =
{
	name = _t"隐特效",
	key = LKEY_HIDE_GFX,
	jump = function ()
		GameApi.HideGfx()
	end,
}

_M[74] =
{
	name = _t"神器",
	jump = "Panel_Artifact",
	validated_level_min = 70,
}

_M[75] =
{
	name = _t"师徒",
	key = LKEY_UI_SHOWDLG_TEACHER,
	jump = "Panel_Teacher",
}

_M[76] =
{
	name = _t"隐界面",
	key = LKEY_UI_SHOW_ALLPANELS,
	jump = function ()
		GameApi.ShowAllPanels()
	end,
}

_M[77] =
{
	name = _t"隐怪物",
	key = LKEY_HIDE_MONSTERMODEL,
	jump = function ()
		GameApi.HideMonster()
	end,
}

_M[78] =
{
	name = _t"显示控制台",
	key = LKEY_UI_SHOWDLG_CONSOLE,
	jump = "Panel_Console",
	validated = function ()
		return GameApi.IsConsoleEnable()
	end,
}

_M[79] =
{
	name = _t"显示GM面板",
	key = LKEY_UI_SHOWDLG_GMCONSOLE,
	jump = "Panel_GMConsole",
	validated = function ()
		return GameApi.IsHostGm()
	end,
}

_M[80] =
{
	name = _t"进入聊天",
	key = LKEY_UI_CHAT_ENTER,
	jump = function ()
		GameApi.ChatUiEnter()
	end,
}

_M[81] =
{
	name = _t"聊天栏回复",
	key = LKEY_UI_CHAT_REPLY,
	jump = function ()
		GameApi.ChatUiReply()
	end
}

_M[82] =
{
	name = _t"物品锁",
	jump = "Panel_ItemLock",
}

_M[83] =
{
	name = _t"星座连接",--确保打开该分页，但还是不完善
	jump = function()
				DlgApi.ShowDialog("Panel_Explore",true)
				set_timeout(function()
				if not DlgApi.IsDialogShow("Panel_SubExplore2") then
					DlgApiEx.SendDlgCommand(UIMAN_INGAME,"Panel_Explore","Button_StarLine")
				end
			end,100)
			end,
}

_M[84] =
{
	name = _t"神器使者寻径",
	jump = function()
				GameApi.RouteTo(36329, 0) --有（temlid，lineid）和 （x,y,z,mapid，lineid）两种参数形式
		   end,
}

_M[85] =
{
	name = _t"观星",--确保打开该分页，但还是不完善
	jump = function()
				DlgApi.ShowDialog("Panel_Explore",true)
				set_timeout(function()
				if not DlgApi.IsDialogShow("Panel_SubExplore1") then
					DlgApiEx.SendDlgCommand(UIMAN_INGAME,"Panel_Explore","Button_StarLine")
				end
			end,100)
			end,
}

_M[86] =
{
	name = _t"战队",
	jump = "Panel_TeamArena",
	validated_level_min = 90,
}

_M[87] =
{
	name = _t"灵魂之甲",
	key = LKEY_UI_SHOWDLG_ARMOR,
	jump = "Panel_SoulArmor",
	validated_level_min = 80,
}

_M[88] =
{
	name = _t"商城",
	jump = function()
				DlgApi.ShowDialog("Panel_Gshop",true)
				DlgApiEx.SendDlgCommand(UIMAN_INGAME, "Panel_Gshop", "Radio_2")
				set_timeout(function()
					DlgApiEx.SendDlgCommand(UIMAN_INGAME, "Panel_Gshop", "Button_HotItem4")
			end,100)
		   end,
}

_M[89] =
{
	name = _t"星币商城",
	jump = function()
				DlgApi.ShowDialog("Panel_Gshop",true)
				DlgApiEx.SendDlgCommand(UIMAN_INGAME, "Panel_Gshop", "Radio_2")
		   end,
}

_M[90] =
{
	name = _t"青木原树海",
	jump = function()
		GameApi.ShowCountBirds(1)
	end,
	validated_level_min = 15,
}