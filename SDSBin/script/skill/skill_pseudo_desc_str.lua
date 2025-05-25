--[[ @i18n skill ]]
local _t = require("i18n").context("skill")

pseudo_skill_str = {}

pseudo_skill_str[PseudoSkillType.CMD] = {}
pseudo_skill_str[PseudoSkillType.POSE] = {}

--pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_WALKRUN] = 
--{
--	strName="^O009走跑切换",
--	icon = "走跑转换.dds",
--	StrFuncdesc="走的太慢，就跑呗，跑的太快了就走吧",
--	StrUseDesc= "走走跑跑，没病走两布",
--}
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_WALKRUN] = { strName = _t"走跑转换", icon = "走跑转换.dds", StrFuncdesc = _t"切换行走/跑步状态", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_FINDTARGET] = { strName = _t"搜寻目标", icon = "寻找目标.tga", StrFuncdesc = _t"寻找到最近的怪物", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_ASSISTATTACK] = { strName = _t"协助攻击", icon = "协助攻击.dds", StrFuncdesc = _t"选中你当前目标的目标", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_INVITETOTEAM] = { strName = _t"邀请加入队伍", icon = "邀请加入.dds", StrFuncdesc = _t"邀请目标加入队伍", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_LEAVETEAM  ] = { strName = _t"脱离队伍", icon = "脱离队伍.dds", StrFuncdesc = _t"离开队伍", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_KICKTEAMMEM] = { strName = _t"遣出队员", icon = "踢出队伍.tga", StrFuncdesc = _t"遣出队员", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_FINDTEAM] = { strName = _t"搜寻队伍", icon = "寻找队伍.tga", StrFuncdesc = _t"搜寻队伍", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_STARTTRADE] = { strName = _t"交易", icon = "交易命令.dds", StrFuncdesc = _t"与当前选中目标交易\r目标必须在自己周围10米内", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_SELLBOOTH] = { strName = _t"摆摊", icon = "摆摊卖.dds", StrFuncdesc = _t"开设一个摊位，可以卖出和收购物品", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_BUYBOOTH] = { strName = _t"摆摊", icon = "摆摊卖.dds", StrFuncdesc = _t"摆摊", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_INVITETOFACTION] = { strName = _t"邀请加入公会", icon = "邀请加入.tga", StrFuncdesc = _t"邀请加入公会", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_PICKUP] = { strName = _t"拾取", icon = "拾取.dds", StrFuncdesc = _t"拾取地面上掉落的物品和金钱\r每次使用拾取最近的一个", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_GATHER] = { strName = _t"挖掘采集", icon = "挖掘.tga", StrFuncdesc = _t"挖掘采集", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_RUSHFLY] = { strName = _t"加速飞行", icon = "加速飞行.tga", StrFuncdesc = _t"加速飞行", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_BINDBUDDY] = { strName = _t"相依相偎", icon = "摆摊卖.dds", StrFuncdesc = _t"相依相偎", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_PET_NORMAL_ATTACK] = { strName = _t"魔宠普通攻击", icon = "宠物普攻.dds", StrFuncdesc = _t"魔宠普通攻击", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_MOUNT] = { strName = _t"骑乘", icon = "骑乘.dds", StrFuncdesc = _t"进入骑乘状态\r必须装备有坐骑", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_TALK_TO_NPC] = { strName = _t"交谈", icon = "交谈.dds", StrFuncdesc = _t"与最近的NPC交谈\r当附近人太多选不中NPC时使用", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_TELEPORT_TO_LEAGUEBASE] = { strName = _t"传回军团基地", icon = "摆摊卖.dds", StrFuncdesc = _t"传回军团基地", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_REST] = { strName = _t"祈祷", icon = "祈祷.dds", StrFuncdesc = _t"^ffffff使用后进入^ffff00祈祷^ffffff状态\r^a2ffff每10秒获得一次经验\r每秒恢复60点生命力\r每秒恢复20点体力值\r^ffff00获得的经验跟等级相关\r1分钟无任何操作也将进入祈祷状态\r^ffffff移动将打断", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_HIDE_PLAYER] = { strName = _t"隐藏其他玩家", icon = "隐藏其他玩家.dds", StrFuncdesc = _t"隐藏其他玩家", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_HIDE_PET] = { strName = _t"隐藏其他玩家宠物", icon = "隐藏其他召唤物.dds", StrFuncdesc = _t"隐藏其他玩家宠物", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_AFK] = { strName = _t"沐浴荣光", icon = "沐浴荣光.dds", StrFuncdesc = _t"^ffffff使用后将查看^ffff00沐浴荣光^ffffff的当前状态\r^a2ffff沐浴荣光状态每天持续8小时\r每5分钟获得一次储存经验\r^ffff00获得的储存经验跟战力相关\r", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_AIRCRAFT] = { strName = _t"骑乘飞行", icon = "飞行.dds", StrFuncdesc = _t"进入/解除骑乘飞行状态", StrUseDesc = "", }
pseudo_skill_str[PseudoSkillType.CMD][CmdSkillIds.CMD_FLY] = { strName = _t"飞行", icon = "飞行.dds", StrFuncdesc = _t"开启/结束 飞行", StrUseDesc = "", }

function pseudo_skill_str:GetCmdIcons()
	local result = {}
	if pseudo_skill_str[PseudoSkillType.CMD] then
		for k,v in pairs(pseudo_skill_str[PseudoSkillType.CMD]) do
			result[k] = v.icon
		end
	end
	return result
end