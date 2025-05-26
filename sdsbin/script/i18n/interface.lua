--[[ @i18n interface ]]
local _t = require("i18n").context("interface")

local Format = string.format
module("STRING_TABLE", package.seeall)

----------------
--主界面相关
PROGRESS_CHARGING     		=    _t"蓄力－%s"
PROGRESS_FORMING      		=    _t"结阵－%s"
PROGRESS_ITEM_USING   		=    _t"物品使用中"
PROGRESS_PET_ACTIVE   		=    _t"宠物召唤"
PROGRESS_PET_DEACTIVE 		=    _t"宠物收回"
PROGRESS_PET_COMBINE  		=    _t"宠物合体"
PROGRESS_PET_DECOMBINE		=    _t"解除宠物合体"
STRING_TARGET_SELF    		=    _t"** 你 **"
STRING_LOADING				=    _t"^d8d7a1正在载入游戏，请稍候……"
STRING_CONNECT_SERVER		= 	 _t"^d8d7a1连接中，%d秒后超时，已用时%d秒"
DOMAIN_BELONG_TO			=	 _t"目前归属于 "
STRING_SMASH_HINT			=	 _t"重击效果，造成伤害提升至%0.1f%%"
STRING_ARMOR_HINT			=	 _t"护甲效果，受到伤害减少至%0.1f%%"
DOUBLE_EXP_ON_CONFIRM		=	_t"确认要开启%s时间吗？"
DOUBLE_EXP_QUICK_CLOSE		=	_t"现在暂停将扣除5分钟%s时间"
DOUBLE_EXP_NAME0			=	_t"双倍经验"
DOUBLE_EXP_NAME1			=	_t"3.5倍经验"
DOUBLE_EXP_ON				=	_t"%s开启中  "
DOUBLE_EXP_OFF				=	_t"%s关闭了  "
DOUBLE_EXP_ON2				=	_t"多倍经验开启中  "
DOUBLE_EXP_OFF2				=	_t"多倍经验关闭了  "
DOUBLE_EXP_AVAILABLE_TIME 	= 	_t"剩余时间："
DOUBLE_EXP_TIME_EXHAUSTED 	= 	_t"^ff0000时间已用尽"
DOUBLE_EXP_TIME_EXHAUSTED2 	= 	_t"已经没有可用的%s时间了"
DOUBLE_EXP_BUY				= 	_t"今日第%d次购买双倍经验，需要%d元宝（%d元宝的%.1f折）"
DOUBLE_EXP_FULL_ENOUPH		=	_t"至少再消耗%s的双倍经验时间才可购买"
DOUBLE_EXP_TURN_ON			=	_t"开启%s"
DOUBLE_EXP_TURN_OFF			=	_t"关闭%s"
DOUBLE_EXP_TIME_ADD_NOTIFY	=	_t"您的可用%s时间增加了%d分钟"
DOUBLE_EXP_ON_SUGGESTION	=	_t"已进入高经验地图，建议您按下面的选择开启多倍经验"
DOUBLE_EXP_OFF_SUGGESTION	=	_t"已经离开高经验区域，建议您关闭多倍经验"
HIDE_PANELS_HINT			= 	_t"再次按下%s可以取消界面隐藏。提示文字不会被截图。"

PING_INFO_FAST      = _t"网络延迟：^00ff00%dms^N"
PING_INFO_NORMAL    = _t"网络延迟：^ffff00%dms^N"
PING_INFO_SLOW      = _t"网络延迟：^ff0000%dms^N"
FPS_INFO            = "FPS: %d"

----------------
--通用对话框
MSGBOX_OK      		=   _t"确定"
MSGBOX_CANCEL  		=   _t"取消"
MSGBOX_REFUSE		=   _t"拒绝"
MSGBOX_YES     		=   _t"是"
MSGBOX_NO  			=   _t"否"
MSGBOX_REPLY  		=   _t"回复"
MSGBOX_IGNORE		=	_t"忽略"
MSGBOX_AGREE		=	_t"同意"
INPUTBOX_REMARK 	=   _t"输入标记名称"
STRING_RETURN_LINE 	= 	_t"^ffe185确定要回到选择线路/选择角色画面吗？"
STRING_INPUT_MONEY	= 	_t"输入金钱"
DIFF_PASSWORD		=	_t"前后两次输入的新密码不一致，请重新输入。"
PASSWORD_SHORT		=	_t"密码长度3-8个字符"
MSGBOX_INTEGRATION	= 	_t"领取双倍需消耗系统双倍声望，是否领取?"



-------------
--防沉迷
STRING_ADDICT_HINT	= 	_t"系统提示：由于您未满18岁或未登记防沉迷信息，现在处于防沉迷系统的限制状态当中。"
ANTI_ADDICT_HINT1 	= 	_t"累计在线时间：%s\r您正处于健康游戏时间，\r祝您游戏愉快！"
ANTI_ADDICT_HINT2 	= 	_t"累计在线时间：%s\r您已进入疲劳游戏时间，\r请离线休息！"
ANTI_ADDICT_TEXT0	= 	_t"防沉迷系统提示：您已累计连续在线1小时。"
ANTI_ADDICT_TEXT1	= 	_t"防沉迷系统提示：您已累计连续在线2小时。"
ANTI_ADDICT_TEXT2	= 	_t"防沉迷系统提示：您累计连续在线时间过长，为了您的健康，已强制断线，5小时内会被禁止登陆。"
ANTI_ADDICT_NEAR	= 	_t"防沉迷系统提示：您即将进入亚健康游戏时间，请离线休息至少5小时。"



-------------
--安全锁
TIME_LOCK_COOLDOWN			=	_t"安全时限设置正在冷却中，请稍后再试。"
TIME_LOCK_MINUTE			=	_t"设置时间不能低于0分钟。"
TIME_LOCK_LONG				= 	_t"时间锁不能超过2小时上限"
TIME_LOCK_SAME				= 	_t"设置时间与原时间相同。"
TIME_LOCK_SUCC				= 	_t"安全时限已设定为 %s, 修改将在下次登录之后生效。"
TIME_LOCK_UP_MSG			= 	_t"您上调了安全时限，这样每次上线 %s 之后才能进行列表中的操作。\r您确定要这样做么？"
TIME_LOCK_SHORT_MSG 		= 	_t"您缩短了安全时限，这样每次上线 %s 之后才能进行列表中的操作。\r此修改会在三天后生效，您确定要这样做么？"
TIME_LOCK_CANCEL_MSG		= 	_t"取消时间锁需要3天之后生效,确定取消?"
TIME_LOCK_SHORT_SUCC		= 	_t"安全时限已设定为 %s, 时间锁时效将在%s之后正式生效。"
TIME_LOCK_CANCEL_HINT		= 	_t"时间锁取消成功, 时间锁将在%s之后正式取消。"
TIME_LOCK_HINT				=	_t"时间锁状态尚未解除，请时间锁状态解除后再进行该操作。"
TIME_LOCK_CANCEL			= 	_t"时间限制已过"
TIME_LOCK_TEXT				=	_t"时间锁状态尚未解除"
PASSWORD_LOCK_UNLOCK		= 	_t"解除密码锁成功"
PASSWORD_LOCK_CANCEL		=	_t"清除密码成功"
PASSWORD_LOCK_SETUP			=	_t"设置密码成功"
PASSWORD_LOCK_MODIFY		=	_t"修改密码成功"
PASSWORD_LOCK_DEL			=	_t"设置强制解除密码成功, 密码锁在%s正式取消"
PASSWORD_LOCK_DEL_CANCEL	=	_t"取消强制解除密码"
PASSWORD_LOCK_DEL_SUCC		=	_t"强制解除密码成功"
PASSWORD_LOCK_DEL_MSG		= 	_t"确认强制解除密码?"
PASSWORD_LOCK_DEL_CANCEL_MSG= 	_t"确认取消强制解除密码?"
SAFE_LOCK_TITLE				= 	_t"输入密码锁密码"
SAFE_LOCK_PASSWORD			= 	_t"请输入密码锁密码"
UPDATE_PW_TITLE				= 	_t"输入密码锁密码"
UPDATE_PW_OLD_PASSWORD		= 	_t"旧密码锁密码"
UPDATE_PW_NEW_PASSWORD		= 	_t"新密码锁密码"
UPDATE_PW_CONFIRM_PASSWORD	= 	_t"再次确认密码"
SETTING_PW_TITLE			=	_t"设置密码锁密码"
UPDATE_ITEM_LOCK_PW_TITLE	= 	_t"输入物品锁密码"
UPDATE_ITEM_LOCK_PW_OLD_PASSWORD		= 	_t"旧物品锁密码"
UPDATE_ITEM_LOCK_PW_NEW_PASSWORD		= 	_t"新物品锁密码"
UPDATE_ITEM_LOCK_PW_CONFIRM_PASSWORD	= 	_t"再次确认密码"
SETTING_ITEM_LOCK_PW_TITLE	=	_t"设置物品锁密码"
ITEM_LOCK_TITLE				= 	_t"输入物品锁密码"
ITEM_LOCK_PASSWORD			= 	_t"请输入物品锁密码"
ITEM_LOCK_UNUNLOCK_MSG		= 	_t"您要恢复受保护物品的锁定吗?\r重新锁定后再次解锁需要重新等待7天。"
ITEM_LOCK_FORCE_UNLOCK_MSG	= 	_t"确认强制解除物品锁?"
ITEM_LOCK_UNOPEN			=	_t"物品锁未开启"





----------------------
--人物属性提示相关

GUARD_STAR_LEV_HINT				= _t"人物等级达到%d级开放守护星功能"
KOSUMO_LEV_HINT					= _t"人物等级达到%d级开放小宇宙功能"
GUARD_STAR_NORMAL_HINT			= _t"守护星"
KOSUMO_NORMAL_HINT				= _t"小宇宙"
COMBAT_POWER_VALUE				= _t"战斗力:%d"

GROUP_BASE						= _t"基础"
GROUP_ELEMENT_ATTACK			= _t"元素"
GROUP_ELEMENT_DEFENSE			= _t"抗性"
GROUP_DAMAGE					= _t"附加伤害"
GROUP_DEFENSE					= _t"伤害减免"
GROUP_STATUE_ANTI				= _t"异常抗性"
GROUP_STATUE_IGNORE				= _t"异抗忽视"
GROUP_OTHER						= _t"其它"

ATTRIBUTE				=	_t"人物属性"
ATTRIBUTE2			=	_t"属性"
ATTRIBUTE_HP					= _t"生命力:"
ATTRIBUTE_DMG					= _t"攻击力:"
ATTRIBUTE_DEF					= _t"防御力:"
ATTRIBUTE_ATTACK				= _t"命中:"
ATTRIBUTE_ARMOR					= _t"闪躲:"
ATTRIBUTE_CRIT_RATE				= _t"暴击率:"

ATTRIBUTE_EARTH_DMG				= _t"地属性攻击力:"
ATTRIBUTE_WATER_DMG				= _t"水属性攻击力:"
ATTRIBUTE_FIRE_DMG				= _t"火属性攻击力:"
ATTRIBUTE_WIND_DMG				= _t"风属性攻击力:"
ATTRIBUTE_THUNDER_DMG			= _t"雷属性攻击力:"
ATTRIBUTE_EARTH_ANTI_REDUCE		= _t"地属性抗性减免:"
ATTRIBUTE_WATER_ANTI_REDUCE		= _t"水属性抗性减免:"
ATTRIBUTE_FIRE_ANTI_REDUCE		= _t"火属性抗性减免:"
ATTRIBUTE_WIND_ANTI_REDUCE		= _t"风属性抗性减免:"
ATTRIBUTE_THUNDER_ANTI_REDUCE	= _t"雷属性抗性减免:"

ATTRIBUTE_EARTH_ANTI			= _t"地属性抗性:"
ATTRIBUTE_WATER_ANTI			= _t"水属性抗性:"
ATTRIBUTE_FIRE_ANTI				= _t"火属性抗性:"
ATTRIBUTE_WIND_ANTI				= _t"风属性抗性:"
ATTRIBUTE_THUNDER_ANTI			= _t"雷属性抗性:"

ATTRIBUTE_LUCKY_ATTACK			= _t"幸运一击率:"
ATTRIBUTE_IMPAIR_CRIT_RATE		= _t"暴击率减免:"
ATTRIBUTE_CRIT_DMG				= _t"暴击附加伤害:"
ATTRIBUTE_IMPAIR_CRIT_DMG		= _t"暴击附加伤害减免:"

ATTRIBUTE_PARRY					= _t"招架:"
ATTRIBUTE_PENETRATION			= _t"破甲:"
ATTRIBUTE_DAMAGE_RATE			= _t"伤害倍率:"
ATTRIBUTE_RESIST_DMG			= _t"伤害抗性:"
ATTRIBUTE_PHY_DMG_ANTI			= _t"物理伤害抗性:"
ATTRIBUTE_MAGIC_DMG_ANTI		= _t"精神伤害抗性:"

ATTRIBUTE_MAGIC_SILENT_ANTI		= _t"受控抗性"
ATTRIBUTE_MAGIC_DISORDER_ANTI	= _t"妨害抗性"
ATTRIBUTE_MAGIC_POISON_ANTI		= _t"失血抗性"
ATTRIBUTE_MAGIC_BLOOD_ANTI		= _t"气绝抗性"
ATTRIBUTE_MAGIC_WEAK_ANTI		= _t"弱化抗性"

ATTRIBUTE_MAGIC_SILENT_IGNORE	= _t"受控抗性忽视"
ATTRIBUTE_MAGIC_DISORDER_IGNORE	= _t"妨害抗性忽视"
ATTRIBUTE_MAGIC_POISON_IGNORE	= _t"失血抗性忽视"
ATTRIBUTE_MAGIC_BLOOD_IGNORE	= _t"气绝抗性忽视"
ATTRIBUTE_MAGIC_WEAK_IGNORE		= _t"弱化抗性忽视"

ATTRIBUTE_SURPLICE_LEV			= _t"冥化等级"
ATTRIBUTE_EXP					= _t"经验值"
ATTRIBUTE_SECOND_EXP			= _t"历练值"
ATTRIBUTE_STORE_EXP				= _t"储存经验"
ATTRIBUTE_STORE_EXP2			= _t"储存历练"

ATTRIBUTE_HP_HINT					= _t"玩家每次受到伤害都会减少相应生命值，生命值为0则失去战斗能力"
ATTRIBUTE_DMG_HINT					= _t"每次攻击时可发挥的攻击力"
ATTRIBUTE_DEF_HINT					= _t"防御力越高，所受到的普通攻击伤害越少"
ATTRIBUTE_ATTACK_HINT				= _t"命中越高，攻击时出现偏斜几率越低，偏斜只有5%的伤害"
ATTRIBUTE_ARMOR_HINT				= _t"闪避越高，被攻击时出现偏斜几率越高"
ATTRIBUTE_CRIT_RATE_HINT			= _t"出现暴击的概率，暴击为原有伤害的1.5倍"

ATTRIBUTE_EARTH_DMG_HINT			= _t"增加属性攻击伤害，对天龙座更加有效，可被地属性抗性减免"
ATTRIBUTE_WATER_DMG_HINT			= _t"增加属性攻击伤害，对白鸟座更加有效，可被水属性抗性减免"
ATTRIBUTE_FIRE_DMG_HINT				= _t"增加属性攻击伤害，对凤凰座更加有效，可被火属性抗性减免"
ATTRIBUTE_WIND_DMG_HINT				= _t"增加属性攻击伤害，对天马座更加有效，可被风属性抗性减免"
ATTRIBUTE_THUNDER_DMG_HINT			= _t"增加属性攻击伤害，对仙女座更加有效，可被雷属性抗性减免"
ATTRIBUTE_EARTH_ANTI_REDUCE_HINT	= _t"忽视部分地属性抗性"
ATTRIBUTE_WATER_ANTI_REDUCE_HINT	= _t"忽视部分水属性抗性"
ATTRIBUTE_FIRE_ANTI_REDUCE_HINT		= _t"忽视部分火属性抗性"
ATTRIBUTE_WIND_ANTI_REDUCE_HINT		= _t"忽视部分风属性抗性"
ATTRIBUTE_THUNDER_ANTI_REDUCE_HINT	= _t"忽视部分雷属性抗性"

ATTRIBUTE_EARTH_ANTI_HINT			= _t"减少所受地攻击的伤害"
ATTRIBUTE_WATER_ANTI_HINT			= _t"减少所受水攻击的伤害"
ATTRIBUTE_FIRE_ANTI_HINT			= _t"减少所受火攻击的伤害"
ATTRIBUTE_WIND_ANTI_HINT			= _t"减少所受风攻击的伤害"
ATTRIBUTE_THUNDER_ANTI_HINT			= _t"减少所受雷攻击的伤害"

ATTRIBUTE_LUCKY_ATTACK_HINT			= _t"出现幸运一击的概率，幸运一击可直接发挥攻击上限"
ATTRIBUTE_IMPAIR_CRIT_RATE_HINT		= _t"减少被暴击的概率"
ATTRIBUTE_CRIT_DMG_HINT				= _t"暴击后额外增加的攻击力"
ATTRIBUTE_IMPAIR_CRIT_DMG_HINT		= _t"减少被暴击时所受到的暴击伤害"

ATTRIBUTE_PARRY_HINT				= _t"受到重击属性怪物攻击时，将会减免大量的伤害"
ATTRIBUTE_PENETRATION_HINT			= _t"对于有护甲属性怪物，将会产生更高的伤害"
ATTRIBUTE_DAMAGE_RATE_HINT			= _t"提升伤害倍率将会增加实际伤害"
ATTRIBUTE_RESIST_DMG_HINT			= _t"提升伤害抗性将会降低所受伤害"
ATTRIBUTE_PHY_DMG_ANTI_HINT			= _t"降低受到物理属性技能的伤害"
ATTRIBUTE_MAGIC_DMG_ANTI_HINT		= _t"降低受到精神属性技能的伤害"

ATTRIBUTE_MAGIC_SILENT_ANTI_HINT	= _t"对于浮空、拉拽、抱摔、击退有概率免疫"
ATTRIBUTE_MAGIC_DISORDER_ANTI_HINT	= _t"能够减少沉默、移动控制、混乱效果的持续时间"
ATTRIBUTE_MAGIC_POISON_ANTI_HINT	= _t"能够减少中毒、流血、灼烧效果的持续时间"
ATTRIBUTE_MAGIC_BLOOD_ANTI_HINT		= _t"能够减少倒地、冰冻、石化效果的持续时间"
ATTRIBUTE_MAGIC_WEAK_ANTI_HINT		= _t"能够减少诅咒效果的持续时间"

ATTRIBUTE_MAGIC_SILENT_IGNORE_HINT	= _t"使敌人的部分受控抗性无效"
ATTRIBUTE_MAGIC_DISORDER_IGNORE_HINT= _t"使敌人的部分妨害抗性无效"
ATTRIBUTE_MAGIC_POISON_IGNORE_HINT	= _t"使敌人的部分失血抗性无效"
ATTRIBUTE_MAGIC_BLOOD_IGNORE_HINT	= _t"使敌人的部分气绝抗性无效"
ATTRIBUTE_MAGIC_WEAK_IGNORE_HINT	= _t"使敌人的部分弱化抗性无效"

ATTRIBUTE_SURPLICE_LEV_HINT			= _t""
ATTRIBUTE_EXP_HINT					= _t"经验值"
ATTRIBUTE_SECOND_EXP_HINT			= _t"历练值"
ATTRIBUTE_STORE_EXP_HINT			= _t"储存经验"
ATTRIBUTE_STORE_EXP2_HINT			= _t"储存历练"



DEBUG_HP						= _t"生命力\t%d/%d"
DEBUG_MP						= _t"体力\t%d/%d"
DEBUG_VP						= _t"斗气\t%d/%d"
DEBUG_AP						= _t"怒气\t%d/%d"
DEBUG_EP1						= _t"能量1\t%d/%d"
DEBUG_EP2						= _t"能量2\t%d/%d"
DEBUG_EXP						= _t"经验\t%.2f"
DEBUG_ATTACK					= _t"命中\t%d"
DEBUG_ARMOR						= _t"闪躲\t%d"
DEBUG_LUCKY_ATTACK				= _t"幸运一击率\t%.2f"
DEBUG_DIRECT_ATTACK				= _t"直击率\t%.2f"
DEBUG_DMG_LOW					= _t"最小攻击力\t%d"
DEBUG_DMG_HIGH					= _t"最大攻击力\t%d"
DEBUG_DEF						= _t"防御力\t%d"
DEBUG_DAMAGE_RATE				= _t"伤害倍率\t%.2f"
DEBUG_RESIST_DMG				= _t"伤害抗性\t%.2f"
DEBUG_PHY_DMG_ANTI				= _t"物理伤害抗性\t%.2f"
DEBUG_MAGIC_DMG_ANTI			= _t"精神伤害抗性\t%.2f"
DEBUG_CRIT_RATE					= _t"暴击率\t%.2f"
DEBUG_CRIT_DMG					= _t"暴击附加伤害\t%d"
DEBUG_IMPAIR_CRIT_RATE			= _t"暴击率减免\t%.2f"
DEBUG_IMPAIR_CRIT_DMG			= _t"暴击附加伤害减免\t%d"
DEBUG_HEAL_ADDON1				= _t"?被治疗效果固定值\t%d"
DEBUG_EARTH_DMG					= _t"地属性攻击力\t%d"
DEBUG_WATER_DMG					= _t"水属性攻击力\t%d"
DEBUG_FIRE_DMG					= _t"火属性攻击力\t%d"
DEBUG_WIND_DMG					= _t"风属性攻击力\t%d"
DEBUG_THUNDER_DMG				= _t"雷属性攻击力\t%d"
DEBUG_EARTH_ANTI				= _t"地属性抗性\t%.2f"
DEBUG_WATER_ANTI				= _t"水属性抗性\t%.2f"
DEBUG_FIRE_ANTI					= _t"火属性抗性\t%.2f"
DEBUG_WIND_ANTI					= _t"风属性抗性\t%.2f"
DEBUG_THUNDER_ANTI				= _t"雷属性抗性\t%.2f"
DEBUG_EARTH_ANTI_REDUCE			= _t"地属性抗性减免\t%.2f"
DEBUG_WATER_ANTI_REDUCE			= _t"水属性抗性减免\t%.2f"
DEBUG_FIRE_ANTI_REDUCE			= _t"火属性抗性减免\t%.2f"
DEBUG_WIND_ANTI_REDUCE			= _t"风属性抗性减免\t%.2f"
DEBUG_THUNDER_ANTI_REDUCE		= _t"雷属性抗性减免\t%.2f"
DEBUG_EARTH_ATT_RATIO			= _t"地属性伤害倍率\t%.2f"
DEBUG_WATER_ATT_RATIO			= _t"水属性伤害倍率\t%.2f"
DEBUG_FIRE_ATT_RATIO			= _t"火属性伤害倍率\t%.2f"
DEBUG_WIND_ATT_RATIO			= _t"风属性伤害倍率\t%.2f"
DEBUG_THUNDER_ATT_RATIO			= _t"雷属性伤害倍率\t%.2f"
DEBUG_WALK_SPEED				= _t"行走速度\t%.2f"
DEBUG_RUN_SPEED					= _t"奔跑速度\t%.2f"
DEBUG_SWIM_SPEED				= _t"游泳速度\t%.2f"
DEBUG_MOUNT_SPEED				= _t"骑乘速度\t%.2f"
DEBUG_FLY_SPEED					= _t"飞行速度\t%.2f"
DEBUG_JUMP_HIGH					= _t"跳跃高度\t%.2f"
DEBUG_HP_GEN1					= _t"生命值恢复速度\t%d"
DEBUG_MP_GEN1					= _t"体力值恢复速度\t%d"
DEBUG_VP_GEN1					= _t"斗气值恢复速度\t%d"
DEBUG_AP_GEN1					= _t"怒气值恢复速度\t%d"
DEBUG_AP_GEN1					= _t"怒气值恢复速度\t%d"
DEBUG_EP_GEN1_1					= _t"能量值1恢复速度\t%d"
DEBUG_EP_GEN1_2					= _t"能量值2恢复速度\t%d"
DEBUG_HP_GEN2					= _t"战斗状态生命值恢复速度\t%d"
DEBUG_MP_GEN2					= _t"战斗状态体力值恢复速度\t%d"
DEBUG_VP_GEN2					= _t"战斗状态斗气值恢复速度\t%d"
DEBUG_AP_GEN2					= _t"战斗状态怒气值恢复速度\t%d"
DEBUG_EP_GEN2_1					= _t"战斗状态能量值1恢复速度\t%d"
DEBUG_EP_GEN2_2					= _t"战斗状态能量值2恢复速度\t%d"
DEBUG_CONDITION_ANTI1			= _t"受控抗性\t%.2f"
DEBUG_CONDITION_ANTI2			= _t"妨害抗性\t%.2f"
DEBUG_CONDITION_ANTI3			= _t"失血抗性\t%.2f"
DEBUG_CONDITION_ANTI4			= _t"气绝抗性\t%.2f"
DEBUG_CONDITION_ANTI5			= _t"灼烧抗性\t%.2f"
DEBUG_CONDITION_ANTI6			= _t"倒地抗性\t%.2f"
DEBUG_CONDITION_ANTI7			= _t"冰冻抗性\t%.2f"
DEBUG_CONDITION_ANTI8			= _t"石化抗性\t%.2f"
DEBUG_CONDITION_ANTI9			= _t"减速抗性\t%.2f"
DEBUG_CONDITION_ANTI10			= _t"弱化抗性\t%.2f"
DEBUG_CONDITION_RATE1			= _t"忽视受控抗性\t%.2f"
DEBUG_CONDITION_RATE2			= _t"忽视妨害抗性\t%.2f"
DEBUG_CONDITION_RATE3			= _t"忽视失血抗性\t%.2f"
DEBUG_CONDITION_RATE4			= _t"忽视气绝抗性\t%.2f"
DEBUG_CONDITION_RATE5			= _t"忽视灼烧抗性\t%.2f"
DEBUG_CONDITION_RATE6			= _t"忽视倒地抗性\t%.2f"
DEBUG_CONDITION_RATE7			= _t"忽视冰冻抗性\t%.2f"
DEBUG_CONDITION_RATE8			= _t"忽视石化抗性\t%.2f"
DEBUG_CONDITION_RATE9			= _t"忽视减速抗性\t%.2f"
DEBUG_CONDITION_RATE10			= _t"忽视弱化抗性\t%.2f"
DEBUG_EXP_ADDON					= _t"经验获得增加百分比\t%d"
DEBUG_SMASH						= _t"重击\t%.2f"
DEBUG_PARRY						= _t"招架\t%.2f"
DEBUG_SHELL						= _t"护甲\t%.2f"
DEBUG_PENETRATION				= _t"破甲\t%.2f"
DEBUG_HEAL_ADDON				= _t"治疗能力\t%d"


---------------
--称号
NO_TITLE_HINT					= _t"你尚未获得任何称号"
PLAYER_TITLE            		= _t"暂无称号"
GOTTITLE						= _t"你获得一个新称号“%s”"
TITLE_OBTAIN					= _t"★ "
TITLE_NO_OBTAIN					= _t"☆ "


----------------
--声望
REPUTATION_LEVEL1				= "%d/%d"
REPUTATION_LEVEL2				= "%d"


---------------
--NPC服务
CDLGNPC_MAIL                            = _t"邮件服务"
CDLGNPC_STORAGE                         = _t"仓库"
CDLGNPC_LEAGUE_STORAGE                  = _t"军团仓库"
CDLGNPC_AUCTION                         = _t"拍卖行"
CDLGNPC_ITEM_DECOMPOSE                  = _t"物品分解"
CDLGNPC_EQUIP_REFINE                    = _t"装备聚能"
CDLGNPC_REFINE_TRANSFER                 = _t"聚能转移"
CDLGNPC_LEAGUE_CREATE                   = _t"创建军团"
CDLGNPC_LEAGUE_JOIN                     = _t"申请加入军团"
CDLGNPC_BASE_APPLY                      = _t"申请军团基地"
CDLGNPC_BASE_ENTER                      = _t"进入军团基地"
CDLGNPC_BASE_ENTER_OTHERS               = _t"进入其他军团基地"
CDLGNPC_BASE_LEAVE                      = _t"离开军团基地"
CDLGNPC_MAP_TELEPORT                    = _t"大地图传送"
CDLGNPC_EQUIP_PROCESS                   = _t"符文镶嵌"
CDLGNPC_DOUBLE_EXP                      = _t"双倍经验开启/关闭"
CDLGNPC_DECLARE_LEAGUE_WAR              = _t"军团宣战"
CDLGNPC_DECLARE_LEAGUE_WAR1             = _t"军团自由战（按角色名宣战）"
CDLGNPC_DECLARE_LEAGUE_WAR2             = _t"军团自由战（按军团名宣战）"
CDLGNPC_PROF_SWITCH                     = _t"守护星座切换"
CDLGNPC_REFERER_INFO					= _t"推广人信息"
CDLGNPC_GOLDEN_REFERER_INFO				= _t"黄金推广人信息"
CDLGNPC_EQUIP_MERGE_ENHANCE             = _t"装备强化融合"
CDLGNPC_XUNBAO                          = _t"寻宝"
CDLGNPC_LEAVE_DUNGEON                   = _t"离开副本"
CDLGNPC_LEAGUE_BONUS					= _t"军团推荐贡献领取"
CDLGNPC_GIFT_CARD						= _t"礼品卡"
CDLGNPC_SOLO_CHALLENGE_DUNGEON			= _t"[挑战]星辰的史诗"
CDLGNPC_SOLO_AFK_EXP					= _t"沐浴荣光"
CDLGNPC_PET_MATING						= _t"宠物化生"
CDLGNPC_PET_MATING_RE					= _t"领取化生宝宝"
CDLGNPC_GOODBYE							= _t"再见。"
CDLGNPC_LEAGUE_UNION					= _t"创建军团联盟"
CDLGNPC_LEAGUE_UNION_JOIN				= _t"军团联盟列表"
CDLGNPC_SUIT_TAG_TRANSER				= _t"灵纹转移"
CDLGNPC_MULITI_TRANSER					= _t"聚能转移"
CDLGNPC_EXP_EXCHANGE					= _t"历练值兑换"
CDLGNPC_SERVER_BATTLE_JOIN				= _t"进入比赛场地"
CDLGNPC_SERVER_BATTLE_QUERY_PLAYER		= _t"查询本场对手"
CDLGNPC_SERVER_BATTLE_QUERY_SCORE		= _t"查询战绩"
CDLGNPC_SERVER_BATTLE_GET_REWARD		= _t"轮空领奖"
CDLGNPC_SERVER_BATTLE_OBSERVE			= _t"旁观入场"
CDLGNPC_ACTIVITY_BATTLE					= _t"活动战场"

CDLGNPC_SEPERATOR_AVAILABLE_QUESTS      = _t"^004a2f可接任务："
CDLGNPC_SEPERATOR_FINISHED_QUESTS       = _t"^004a2f完成任务："

CDLGNPC_ATHENA_CERTIFICATION			= _t"认证雅典娜"
CDLGNPC_ATHENA_CREATE_12PALACE			= _t"创建12宫"

---------------
--随身服务和续租服务
SELF_SERVICE_NO_SERVICE	  = _t"抱歉，您还不是VIP用户，充值一元即可享受随身仓库服务。"
SELF_SERVICE_VIP_LEVEL	  = _t"%d级"
SELF_SERVICE_VIP_INACTIVE = _t"(未激活)"
SELF_SERVICE_VIP_ACTIVE	  = _t"(已激活)"
SELF_SERVICE_VIP_BINDCASH_LACK = _t"还可继续免费领取幸运币，查看更多信息"
SELF_SERVICE_VIP_BINDCASH_MAX  = _t"系统赠送的幸运币已领完"
SELF_SERVICE_VIP_BINDCASH_NO   = _t"您当前没有可以领取的幸运币"
SELF_SERVICE_LEVEL_UP_POINT = _t"距离VIP下一级别还差%d点"
VIP_RELET_COST_BIND_CASH = _t"%g元宝"
VIP_RELET_OWN_BIND_CASH  = _t"%d元宝"
VIP_REPUTATION_INCREASE  = _t"获得%d点VIP点数"
VIP_REPUTATION_DECREASE  = _t"损失了%d点VIP点数"
VIP_REPUTATION_RESET	 = _t"VIP点数(幸运值)被重置为%d"
VIP_LEVEL_UP			 = _t"VIP等级提升为%d级!"
VIP_EXPIRE_UPDATE_AS_LEVEL_UP = _t"V主流到期时间因VIP等级提升变更至年/月/日/时"
VIP_TIME_EXPIRE = _t"V主流资格已经过期"
VIP_TIME_RELET  = _t"成功续租了V主流时间,到期时间至年/月/日/时"
VIP_BIND_CASH_INCREASE = _t"获得了%d幸运币"
VIP_BIND_CASH_DECREASE = _t"花费了%d幸运币"
VIP_CHAT_CHANNEL_TIPS  = _t"VIP达到6级以上才能在此频道收听和发言"
VIP_MVIP_CUR_CHARGE_POINT  = _t"当月充值点数：%d"
VIP_MVIP_DELTA_TO_NEXT_MVIP_POINT  = _t"距离月度VIP下一级别还差%d点"
VIP_MVIP_DRAW_STATE_NO  = _t"未领取"
VIP_MVIP_DRAW_STATE_OK  = _t"已领取"
VIP_MVIP_LEVEL	  		= _t"%d级"
VIP_MVIP_NEXT_LEVEL	  	= _t"下月月度VIP等级:%d级"
VIP_MVIP_NO_BONUS  		= _t"获得月度VIP特权，即可领取每月丰厚福利"

---------------
--铭刻服务
IMPRINT_LACK_COST_ITEM = _t"缺少修改铭刻的物品 %s，无法修改"
IMPRINT_LEFT_WORDS_NUM = _t"(还剩%d字)"
IMPRINT_NO_LEFT_WORDS  = _t"您已经不能留下更多话啦"
IMPRINT_FORBID_WORDS   = _t"请注意，您输入了屏蔽内容"
IMPRINT_FREE		   = _t"免费"
IMPRINT_NOT_SELECT	   = _t"没有选择铭刻优先级"
IMPRINT_LEV_DISABLE	   = _t"铭刻等级高于该级别,无法选择"
IMPRINT_MODIFY_SUCC	   = _t"铭刻内容修改成功"

------------------
--副本通关奖励
DUNGEON_AWARD_COUNT_DOWN            = _t"剩余时间：%d"
DUNGEON_AWARD_AND_ACTIVITY_BONUS    = _t"%d^fffd44+%d(活动补偿)^N"
DUNGEON_AWARD_MINI_BAR_TITLE		= _t"副本通关"

--------------------
--PK相关
PK_VALUE							= _t"PK值:%d点"
PK_VALUE_TEXT						= _t"%d点"
PK_VALUE_ZERO						= _t"PK值为0点,无需清空"
PK_VALUE_MONEY_LESS					= _t"金币不足, 无法清空"
PK_VALUE_CLEAR_CONFIRM				= _t"确定清空PK值?"


--------------------
--守护星座相关
CHANGE_PROF_CONFIRM					= _t"确定切换守护星座?"
CHANGE_PROF_MONEY_LESS				= _t"金券不足, 无法切换守护星座"
CHANGE_PROF_LEV_LOW					= _t"59级以前不允许切换守护星座"
CHANGE_PROF_DEFAULT_NO			= _t"当前不能切换守护星座"


------------------
--交互信息提示
POPINFO_LEFTTIME					= _t"剩余时间%d秒"
POPINFO_TYPENAME0					= _t"无效请求"
POPINFO_TYPENAME1					= _t"交易请求"
POPINFO_TYPENAME2					= _t"入队请求"
POPINFO_TYPENAME3					= _t"交互请求"
POPINFO_TYPENAME4					= _t"交互请求"
POPINFO_TYPENAME5					= _t"交互请求"
POPINFO_TYPENAME6					= _t"决斗请求"
POPINFO_TYPENAME7					= _t"系统消息"
POPINFO_TYPENAME8					= _t"好友留言"
POPINFO_TYPENAME9					= _t"军团决战请求"
POPINFO_TYPENAME10					= _t"军团请求"
POPINFO_TYPENAME11					= _t"邀请入队请求"
POPINFO_TYPENAME12					= _t"组队请求"
POPINFO_TYPENAME13                  = _t"队员不满足条件,是否强制开启副本"
POPINFO_TYPENAME14                  = _t"邀请进入副本"
POPINFO_TYPENAME15                  = _t"好友申请"
POPINFO_TYPENAME16                  = _t"探险请求"
POPINFO_TYPENAME17                  = _t"邀请进入战场"
POPINFO_TYPENAME18                  = _t"分享任务"
POPINFO_TYPENAME19                  = _t"分享任务"
POPINFO_TYPENAME20					= _t"入团请求"
POPINFO_TYPENAME21					= _t"组团请求"
POPINFO_TYPENAME22					= _t"集合令"
POPINFO_TYPENAME23					= _t"加入排队"
POPINFO_TYPENAME24					= _t"进入排位赛"
POPINFO_TYPENAME25					= _t"师徒邀请"
POPINFO_TYPENAME26					= _t"认证雅典娜邀请"
POPINFO_TYPENAME27					= _t"将被投票踢出队伍"
POPINFO_TYPENAME28					= _t"军团联盟请求"


--------------------
--地图相关
MAP_NPCMARK_FILTER1        = _t"全部显示"
MAP_NPCMARK_FILTER2        = _t"一般任务"
MAP_NPCMARK_FILTER3        = _t"重复任务"
MAP_NPCMARK_FILTER4        = _t"地图传送"
MAP_NPCMARK_FILTER5        = _t"重要地点"
MAP_NPCMARK_FILTER6        = _t"功能"
MAP_NPCMARK_FILTER7        = _t"导师"
MAP_MARK_DELALL_CONFIRM    = _t"确定删除追踪列表中的所有目标地点吗？"
MAP_MARK_DEL_CONFIRM       = _t"确定从追踪列表中删除这个目标地点吗？"
MAP_MARK_FULL              = _t"不能添加更多的追点目标地点了，请删除一些再尝试添加。"
MAP_MARK_FORMAT_ERROR      = _t"输入的坐标格式不正确，请重新输入。"
MAP_MARK_SAVE_SUCC         = _t"目标位置保存成功。"
MAP_MARK_SEP1              = " "
MAP_MARK_SEP2              = ","
MAP_MARK_SEP3              = _t"，"
MAP_MARK_SEP4              = _t"　"
MAP_HOST_LINEINFO          = _t"^f2ebcf^O053位置:%s"
MAP_TELEPORT_TEXT          = "%s %s"
MAP_TELEPORT_HINT          = _t"%s \r传送费用:%s"
MAP_TELEPORT_HINT_AUTOMOVE = _t"\r^00ff00传送到这里继续寻径"
MAP_TELEPROT_MONEYLACK     = _t"传送费用不够"
MAP_TELEPORT_DISABLE       = _t"^c0c0c0%s \r你尚未激活这个传送点"
MAP_MARK_WITH_COLOR        = "^f2ebcf%.0f    %.0f"
MAP_MARK_WITHOUT_COLOR     = "%.0f    %.0f"
MAP_WORLD_MAP              = _t"世界地图"
MAP_POS_FORMAT             = _t"【%s (%d, %d)】"
MAP_ID_REQUIRED            = _t"请输入地图号"
MAP_XPOS_REQUIRED          = _t"请输入X坐标"
MAP_ZPOS_REQUIRED          = _t"请输入Z坐标"

----------------------
--系统栏
SHOP	= _t"商城"
BAG		= _t"包裹"
ROLE	= _t"人物"
SKILL	= _t"技能"
QUEST	= _t"任务"
OTHER	= _t"其他"
SOCIAL	= _t"社交"
SYSTEM	= _t"系统"




----------------------
--排行榜
LEADER_BOARD_DEFAULT_RANK_TEXT = _t"玩家排名："
LEADER_BOARD_NEW = _t"^80FF00新"
LEADER_BOARD_UP = _t"^80FF00↑"
LEADER_BOARD_DOWN = _t"^FFFF00↓"
LEADER_BOARD_NO_CHANGE = "^ffffff--"

----------------------
--战斗力
STF_POWER_WHO = _t"%s的战力"
STF_POWER_VALUE = _t"战力："
STF_POWER_NAME	=	_t"战力"
STF_POWER_TOTAL	= _t"总战力"

SAINTCLOTHES = _t"圣衣："
SAINTCLOTHES_BRONZE1 = _t"青铜圣衣"
SAINTCLOTHES_SILVER1 = _t"白银圣衣"
SAINTCLOTHES_GOLDEN1 = _t"黄金圣衣"
SAINTCLOTHES_DEITY1 = _t"神圣衣"

GROUP_SELF = _t"星座"
GROUP_MICROCOSM = _t"小宇宙"
GROUP_SAINTCLOTHES = _t"圣衣"
GROUP_EQUIPMENT = _t"装备"
GROUP_TREASURE = _t"宝物"
GROUP_ATTENDANT = _t"守护星"
GROUP_COLLECTION = _t"收藏"
GROUP_CONSTELLATION = _t"星座神话"

SELF_LEVEL_GROWTH = _t"等级："
SELF_XINFA_SKILL = _t"觉悟："
SELF_XINFA_SKILL_RATE = _t"觉悟百分比："
SELF_TEXUN_SKILL = _t"奥义："
SELF_CHUILIAN_SKILL = _t"修炼："
MICROCOSM_JINGJIE_GROWTH = _t"境界："
MICROCOSM_JIDU_XINHUN = _t"日相："
MICROCOSM_LUOHOU_XINHUN = _t"月相："
MICROCOSM_ZHENYANG_XINHUN = _t"主序："
SAINTCLOTHES_BRONZE = _t"青铜圣衣："
SAINTCLOTHES_SILVER = _t"白银圣衣："
SAINTCLOTHES_GOLDEN = _t"黄金圣衣："
SAINTCLOTHES_DEITY = _t"神圣衣："
SAINTCLOTHES_SURPLICE = _t"冥衣："
SAINTCLOTHES_SCALE = _t"鳞衣："
EQUIPMENT_QUALITY = _t"品阶："
EQUIPMENT_STRENGTHEN = _t"聚能："
EQUIPMENT_DEVIL = _t"符文："
EQUIPMENT_SUIT = _t"灵纹："
TREASURE_QUALITY = _t"品阶："
TREASURE_STRENGTHEN = _t"聚能："
TREASURE_DEVIL = _t"符文："
ATTENDANT_APTITUDE = _t"资质："
ATTENDANT_COMBAT = _t"战队："
ATTENDANT_OTHER = _t"修行："
COLLECTION_GOODS = _t"图鉴："
COLLECTION_TITLE = _t"称号："
COLLECTION_ACHIEVEMENT = _t"成就："
CONSTELLATION_DISCOVERY = _t"星域探索: "
CONSTELLATION_ARTIFACT = _t"神器："
CONSTELLATION_ARMOR		=	_t"灵魂之甲："

--战斗力hint
SELF_LEVEL_GROWTH_HINT = _t"提升角色等级，可提升此战力"
SELF_XINFA_SKILL_HINT = _t"学习和提升战斗技能可以提升觉悟值人物在19，29，39，49，59级升级时需要达到一定的觉悟值"
SELF_TEXUN_SKILL_HINT = _t"尚未开放"
SELF_CHUILIAN_SKILL_HINT = _t"修炼军团技能，可提升此战力"
MICROCOSM_JINGJIE_GROWTH_HINT = _t"小宇宙境界提升，可提升此战力"
MICROCOSM_JIDU_XINHUN_HINT = _t"由日相星命点及日相星魂，提升注入的日相星魂品质和等级可提升此战力"
MICROCOSM_LUOHOU_XINHUN_HINT = _t"由月相星命点及月相星魂，提升注入的月相星魂品质和等级可提升此战力"
MICROCOSM_ZHENYANG_XINHUN_HINT = _t"由主序星命点及主序星魂，提升注入的主序星魂品质和等级可提升此战力"
SAINTCLOTHES_BRONZE_HINT = _t"星铸穿戴和拥有的青铜圣衣，可提升此战力"
SAINTCLOTHES_HINT = _t"星铸穿戴和拥有的圣衣，可提升此战力"
SAINTCLOTHES_SILVER_HINT = _t"星铸穿戴和拥有的白银圣衣，可提升此战力"
SAINTCLOTHES_GOLDEN_HINT = _t"星铸穿戴和拥有的黄金圣衣，可提升此战力"
SAINTCLOTHES_DEITY_HINT = _t"尚未开放"
EQUIPMENT_QUALITY_HINT = _t"提升穿戴装备的品阶，可提升此战力"
EQUIPMENT_STRENGTHEN_HINT = _t"对穿戴装备进行聚能，可提升此战力"
EQUIPMENT_DEVIL_HINT = _t"对穿戴装备进行符文镶嵌，可提升此战力"
EQUIPMENT_SUIT_HINT = _t"穿戴装备的灵纹成套时，可提升此战力"
TREASURE_QUALITY_HINT = _t"提升穿戴宝物（灵石，手环，徽章，珠链，绶带）的品阶，可提升此战力"
TREASURE_STRENGTHEN_HINT = _t"对穿戴的宝物进行聚能，可提升此战力"
TREASURE_DEVIL_HINT = _t"对穿戴的宝物进行符文镶嵌，可提升此战力"
ATTENDANT_APTITUDE_HINT = _t"提升主战守护星的资质和亲密度，可提升此战力"
ATTENDANT_COMBAT_HINT = _t"提升守护星小队中助战守护星的资质，可提升此战力"
ATTENDANT_OTHER_HINT = _t"为守护星装备守护星战备，可提升此战力"
COLLECTION_GOODS_HINT = _t"集齐与图鉴关联的收藏品，可提升此战力"
COLLECTION_TITLE_HINT = _t"收集有属性加成的称号，可提升此战力"
COLLECTION_ACHIEVEMENT_HINT = _t"达成有属性加成的成就，可提升此战力"


-------------------------
--经验/历练相关
EXP2_VALUE_OUT_OF_RANGE 			= _t"当前没有这么多历练值"
EXP2_EXCHANGE_CONFIRM				= _t"确定兑换历练值?"
EXP_OBTAIN_TAG_NAME					= _t"已获得经验："
EXP2_OBTAIN_TAG_NAME				= _t"已获得历练："
EXP_LEFT_TAG_NAME					= _t"剩余经验："
EXP2_LEFT_TAG_NAME					= _t"剩余历练："
EXP_OFFLINE_AWARD_TAG_NAME			= _t"经验："
EXP2_OFFLINE_AWARD_TAG_NAME			= _t"历练："
STORE_EXP_OFFLINE_AWARD_TAG_NAME	= _t"储存经验："
STORE_EXP2_OFFLINE_AWARD_TAG_NAME	= _t"储存历练："
EXP_ROLEINFO_RATE_NAME				= _t"经验百分比："
EXP2_ROLEINFO_RATE_NAME				= _t"历练百分比："
EXP_OTAIN_HINT						= _t"获得经验："
EXP2_OTAIN_HINT						= _t"获得历练："
EXP_CONSUME_HINT					= _t"消耗经验："
EXP2_CONSUME_HINT					= _t"消耗历练："


----------------------
--聊天
CHAT						=	_t"&%s&：%s"
CHAT_PRIVATE1				=	_t"&%s& 对你说：%s"
CHAT_PRIVATE_FRIEND1		=	_t"好友&%s& 对你说：%s"
CHAT_PRIVATE2				=	_t"你对 &%s& 说：%s"
CHAT_PRIVATE_FRIEND2		=	_t"你对好友 &%s& 说：%s"
CHAT_DISABLE_FAST			=	_t"您发言太快了，两次发言需要2秒的间隔"
CHAT_SAMEMSG_DISABLE_FAST	=	_t"请不要过快地重复发言，两次重复发言需要3秒的间隔"
CHAT_WORLDMSG_NEED_PRODUCT	=   _t"发言失败，你需要借助“世界频道喇叭”来让所有人都听到你的声音。"
CHAT_BROADCASTMSG_NEED_PRODUCT	=   _t"发言失败，你需要借助“广播频道喇叭”来让所有人都听到你的声音。"
CHAT_WORLDMSG_REMINDER_IVTRITRM =   _t"该频道发言将消耗“世界频道喇叭”"
CHAT_WORLDMSG_REMINDER_BINDMONEY=   _t"该频道发言将消耗%d金券"
CHAT_WORLDMSG_AUTO_SETTING	=	_t"该频道发言消耗“世界频道喇叭”或金券提示"
CHAT_WORLDMSG_ONE_ITEM_ONLY =   _t"每次只能往聊天栏发送一个物品标识"
CHAT_GM_HELP_COOLTIME		=   _t"与前一次求助在线客服时间间隔不能少于3分钟，请你稍候再试。"
CHAT_GM_HELP_WAITTIME		= 	_t"与前一次求助在线客服时间间隔不能少于3分钟，请你稍候再试。"
CHAT_GM_HELP_SUCCESS		=	_t"您的问题已提交，请等待处理。"
CHAT_PRIVATE_EMPTY			=	_t"无法发送内容为空的密语。"
CHAT_SPEAK_CHANNEL1			=	_t"普通"
CHAT_SPEAK_CHANNEL2			=	_t"队伍"
CHAT_SPEAK_CHANNEL3			=	_t"密语"
CHAT_SPEAK_CHANNEL4			=	_t"军团"
CHAT_SPEAK_CHANNEL5			=	_t"圈子"
CHAT_SPEAK_CHANNEL6			=	_t"世界"
CHAT_AUTOMOVE_ERROR			= 	_t"这个坐标不在本场景当中。"
CHAT_RECECIVE_NAME1			=	_t"普通"
CHAT_RECECIVE_NAME2			=	_t"活动"
CHAT_RECECIVE_NAME3			=	_t"团队"
CHAT_RECECIVE_NAME4			=	_t"密语"
CHAT_RECECIVE_NAME5			=	_t"军团"
CHAT_RECECIVE_NAME6			=	_t"战斗"
CHAT_NO_TEAM_ERROR			= 	_t"当前没有组队"
CHAT_NO_LEAGUE_ERROR		= 	_t"当前没有参加任何军团"
CHAT_NO_CIRCLE_ERROR		= 	_t"当前没有参加任何圈子"
CHAT_NO_FRIEND_ERROR		= 	_t"当前没有任何好友"
CHAT_NO_WAP_ERROR			= 	_t"当前没有参加战场或排位赛活动"
CHAT_NO_ATHENA_ERROR		= 	_t"当前没有加入守卫12宫组织"
CHAT_NO_ALLIANCE_ERROR		= 	_t"当前没有加入任何军团联盟"
CHAT_IVTR_WRONG				=	_t"背包内的此物品发生改变，链接失效请重新输入"
CHAT_LOCAL_SIGN				= _t"[普]"
CHAT_FARCRY_SIGN			= _t"[世]"
CHAT_TEAM_SIGN				= _t"[队]"
CHAT_FACTION_SIGN			= _t"[军]"
CHAT_WHISPER_SIGN			= _t"[密]"
CHAT_DAMAGE_SIGN			= _t"[伤]"
CHAT_FIGHT_SIGN				= _t"[战]"
CHAT_TRADE_SIGN				= _t"[贸]"
CHAT_SYSTEM_SIGN			= _t"[系]"
CHAT_BROADCAST_SIGN			= ""
CHAT_MISC_SIGN				= _t"[其]"
CHAT_FAMILY_SIGN			= _t"[家]"
CHAT_CIRCLE_SIGN			= _t"[圈]"
CHAT_PLBC_SIGN				= _t"[广]"
CHAT_FRIEND_SIGN			= _t"[友]"
CHAT_VIP_SIGN				= "[VIP]"
CHAT_WAR_SIGN				= _t"[阵]"
CHAT_ATHENA_SIGN			=	_t"[守]"
CHAT_LOG_SIGN				= _t"[记]"
CHAT_ACTIVITY_SIGN			= _t"[活]"
CHAT_LEAGUE_UNION_SIGN		= _t"[盟]"
CHAT_AUTO_REPLY				= _t"  （自动回复）"
CHAT_USE_CHAT_UI_CONFIRM	= _t"确认要将聊天窗口外置在游戏窗口外吗？"
CHAT_FORBID_TIME 	=	_t"发言过于频繁，请等待%d秒"

CHAT_SEND_NAME1			=	_t"普通"
CHAT_SEND_NAME2			=	_t"队伍"
CHAT_SEND_NAME3			=	_t"好友"
CHAT_SEND_NAME4			=	_t"圈子"
CHAT_SEND_NAME5			=	_t"军团"
CHAT_SEND_NAME6			=	_t"密语"
CHAT_SEND_NAME7			=	_t"世界"
CHAT_SEND_NAME8			=	_t"广播"
CHAT_SEND_NAME9			=	"VIP"
CHAT_SEND_NAME10		=	_t"阵营"
CHAT_SEND_NAME11		=	_t"守护"
CHAT_SEND_NAME12		=	_t"" -- 不显示，因为控件被button覆盖
CHAT_SEND_NAME13		=	_t"联盟"

CHAT_COMMAND_MAX		=	_t"无效的命令：命令字数太多"
CHAT_ACTIVITY_SO_MUCH	=	_t"选择的活动太多"
CHAT_ACTIVITY_SET_SEND	=	_t"发送列表"
CHAT_ACTIVITY_SET_RECEIVE=	_t"接受列表"
CHAT_ACTIVITY_NO_ACT	=	_t"请点击聊天输入栏左边的活动按钮，选择活动"
CHAT_ACTIVITY_SHORTCUT	=	_t"快捷输入：#%d#"
CHAT_TEAM_PICK			=	_t"队友%s拾取了%s个%s"


----------------------
-- 功能链接
FUNC_LINK_OP_ONLINE_NOTICE	=	_t"设置"
FUNC_LINK_OP_INVITE_TEAM	=	_t"组队"


----------------------
--连招编辑器
RESET_SEQUENCE_CONFIRM		= 	_t"将恢复到上次保存时状态, 确认撤消?"
CLEAR_SEQUENCE_CONFIRM		= 	_t"将清除当前连招数据, 确认清空?"
SHORTCUT_UNFIT				= 	_t"类型不符，无法作为连招技能使用"
EXIT_SEQUENCE_CONFIRM		=	_t"退出后是否保存修改?"
SAVE_SEQUENCE_MSG			= 	_t"保存成功!"
SAVE_SEQUENCE_ERROR			=	_t"当前正在施放连招技能, 无法保存"
LOOP_IMAGE_HINT				=	_t"可以将当前图标拖拽到上边技能格上,该技能格之后技能会循环施放"
LOOP_SKILL_HINT				=	_t"从此循环"
NONE_BLANK_HINT				=	_t"可以将技能图标拖拽到当前技能格,编辑连招技能"


----------------------
--系统设置
WINDOW_MODE 				= _t"窗口模式"
FULL_SCREEN_MODE	 		= _t"全屏模式"
OPTION_ON					= _t"开"
OPTION_OFF					= _t"关"
CUSTOMIZE_SIZE 				= _t"自定义尺寸"
CUSTOMIZE_FULL_FORBID 		= _t"在自定义的非标准窗口尺寸下，不能切换到全屏模式。"
WINDOW_SIZE_LIMIT 			= _t"窗口模式下不能选择比当前屏幕更大的分辨率。"
CHANNEL_NAME_INPUT 			= _t"请输入频道名称："

FONT_SIZE0					= _t"小"
FONT_SIZE1					= _t"中"
FONT_SIZE2					= _t"大"

VIDEO_LEVEL0				= _t"低"
VIDEO_LEVEL1				= _t"较低"
VIDEO_LEVEL2				= _t"中"
VIDEO_LEVEL3				= _t"较高"
VIDEO_LEVEL4				= _t"高"

FOCUS_LEVEL0				= _t"低"
FOCUS_LEVEL1				= _t"较低"
FOCUS_LEVEL2				= _t"中"
FOCUS_LEVEL3				= _t"较高"
FOCUS_LEVEL4				= _t"高"

PLAYER_NUM0					= _t"10人"
PLAYER_NUM1					= _t"20人"
PLAYER_NUM2					= _t"40人"
PLAYER_NUM3					= _t"80人"
PLAYER_NUM4					= _t"全部"

HEADINFO_LEV0				= _t"关闭"
HEADINFO_LEV1				= _t"简单"
HEADINFO_LEV2				= _t"中等"
HEADINFO_LEV3				= _t"详细"

SHOW_DEMAGE_TYPE0			= _t"不显示"
SHOW_DEMAGE_TYPE1			= _t"显示自己"
SHOW_DEMAGE_TYPE2			= _t"显示所有"


-------------------------
--日程表
DAILY_NAME					=	_t"今日日程"
DAILY_NAME_REGISTERED		=	_t"排队中：\n"
CUR_ACTIVE_VALUE			= _t'活跃度：%d'
HINT_TEAMPLATFORM			= _t'点击这里查看寻找队友的详情。'
HINT_INTEAM				= _t'你在队伍中，可以继续招募其他队友'
HINT_NOTINTEAM				= _t'可以点击左侧按钮寻找队友'
HINT_FINDTEAM				= _t'寻找队伍中，打开组队平台查看详情。'
HINT_CANNOTUSE				= _t'现在不能使用组队平台'
HINT_LITTLECASE			= _t'这个挑战的难度较低，无需其他人帮助'
DAILY_SOLO					= _t"(单人)"
DAILY_LIMIT				= "" --有限
DAILY_PLATFORM_HINT		= _t"加入组队平台"
DAILY_TIMEUP_HINT		= _t"队列不可用"
DAILY_SIGNED_HINT			= _t"排队中"
DAILY_UNSIGN_HINT			= _t"无法排队"
DAILY_NOT_LEAD_HINT		= _t"你不是队长"
DAILY_NOT_RAID_LEAD_HINT		= _t"你不是团长"
DAILY_PLAYER_NUM1			= _t"(%d人)"
DAILY_PLAYER_NUM2			= _t"(%d-%d人)"
DAILY_PLAYER_LEV			= _t"%s-%s"
DAILY_IN_PROGRESS			= _t"(进行中)"
DAILY_BATTLE_AVAILABEL_HINT	= _t"加入战场"
DAILY_BATTLE_ENTER_CONFIRM_HINT	= _t"就位确认中"
DAILY_BATTLE_IN_BATTLE_HINT	= _t"战斗进行中…"
DAILY_BATTLE_CANNOT_SIGH_HINT	= _t"您已经处于战场之中，暂无法使用排队功能"
DAILY_CHECKBOX_INTRO			= _t"活跃度%s"
DAILY_CHECKBOX_HINT			= _t"15级以上当天获得%s点活跃度可开启。"
TEXT_HOUR                   = _t"小时"
TEXT_MIN                    = _t"分钟"
TEXT_SEC                    = _t"秒"
DAILY_BOSS_COME             = _t"%s后出现"
DAILY_BOSS_GO               = _t"%s后消失"
DAILY_BOSS_DEAD             = _t"已死亡"
DAILY_BOSS_POWER            = _t"推荐战力:  %s"
DAILY_ACTIVITY_BONUS_TIPS_LESS_EQUAL_THAN_3	= _t"^e12500%d天未完成，通关经验提高%d%%^N"
DAILY_ACTIVITY_BONUS_TIPS_ABOVE_THAN_3	 	= _t"^e12500多于2天未完成，通关经验提高%d%%^N"
DAILY_ACTIVITY_BONUS_HINT_LESS_EQUAL_THAN_3	= _t"^e12500经验补偿：%d天未完成，通关经验提高%d%%^N"
DAILY_ACTIVITY_BONUS_HINT_ABOVE_THAN_3	 	= _t"^e12500经验补偿：多于2天未完成，通关经验提高%d%%^N"
DAILY_ACTIVITY_BONUS_HELP	= _t"今天您参加%s活动可以获得%d%%的奖励哦！"
DAILY_SIGNUP_WAIT_TOMORROW  = _t"明天才能领取这份奖励哦"
DAILY_LOW_LEVEL = _t"你的等级还比较低，要继续加油哦！"
DAILY_HIGH_LEVEL = _t"您还有以下推荐活动:"
DAILY_WEEDING_HINT1 = _t"你可以完成以下指引任务，获取^00ff00大量经验和星券奖励^ffffff。"
DAILY_WEEDING_HINT2 = _t"你可进行以下挂机活动："
DAILY_WEEDING_HINT3 = _t"${npc(33799,\"点此寻径\")}"
DAILY_GUIDE_HINT = _t"${jump(63,\"点击查看详情\")}"
DAILY_WEEDING_REWARD = _t"今日最多可获%s点经验和%s金券"
DAILY_WEEDING_REWARD2 = _t"今日最多可获%s点历练和%s金券"

-------------------------
--复活
HOST_REBOREN_LEFT_TIME		= _t"%s\r^ffffff%d秒^33ffcc后可以复活"
HOST_REVIVE_TIP0			= _t"^33ffcc小宇宙之火终将再次燃烧！"
HOST_REVIVE_TIP1			= _t"^33ffcc万物皆无常，命运亦如是。"
HOST_REVIVE_TIP2			= _t"^33ffcc生如灿烂夏花，灭如静美秋叶"
HOST_REVIVE_TIP3			= _t"^33ffcc灵魂徘徊在阿格龙河畔。"
HOST_REVIVE_TIP4			= _t"^33ffcc热血澎湃的战士已远去。"

--------------------
--技能复活界面
DIED_REVIVE_SKILLS_TIME_LEFT = _t"剩余时间%d秒"


-------------------------
-- 灵魂之甲
SOULARMOR_ITEMNUM			= _t"x%d"
SOULARMOR_ITEMNUM_RED		= _t"^FF0000x%d"
SOULARMOR_GEM_ADD_EXP		= _t"使用后增加%d点经验"
SOULARMOR_MASK_NOT_FIT		= _t"类型不符,无法镶嵌"
SOULARMOR_GEM_DATA_ERROR	= _t"灵魂宝石数据错误"
SOULARMOR_GEM_LEV_OVERFLOW	= _t"宝石等级过高,无法镶嵌"
SOULARMOR_GEM_REPEAT		= _t"已经镶嵌同种类型的宝石"
SOULARMOR_GEM_NOT_FIT		= _t"不可镶嵌到该灵魂铠甲上"
SOULARMOR_PACK_FULL			= _t"背包已满, 无法进行拆分"
SOULARMOR_PACK_FULL2		= _t"背包已满, 无法卸下宝石"
SOULARMOR_PARTICLE_NUM		= _t"已有碎片：%d"
SOULARMOR_OPER_FREQUENTLY	= _t"操作过于频繁"
SOULARMOR_GEM_NUM_ACTIVE_LEV= _t"%s达到%d级开启"
SOULARMOR_GEM_NUM_ACTIVE    = _t"%s激活后开启"
SOULARMOR_GEM_SPLIT_SUCC	= _t"宝石拆分成功"
SOULARMOR_GEM_SPLIT_ERR		= _t"宝石拆分失败"
SOULARMOR_GEM_EXCHANGE_HINT	= _t"宝石只能和同一铠甲的宝石进行交换"
SOULARMOR_GEM_EXCHANGE_ERR	= _t"宝石移动失败"
SOULARMOR_GEM_EMBED_ERR1	= _t"已经达到宝石数量上限"
SOULARMOR_GEM_EMBED_ERR2	= _t"参数错误"
SOULARMOR_GEM_EMBED_ERR3	= _t"宝石等级过高"
SOULARMOR_GEM_EMBED_ERR4	= _t"宝石类型不符合镶嵌要求"
SOULARMOR_GEM_EMBED_ERR5	= _t"已经镶嵌同种类型的宝石"
SOULARMOR_GEM_UPGRADE_ERR1	= _t"所请求的宝石位置错误"
SOULARMOR_GEM_UPGRADE_ERR2	= _t"宝石ID无效"
SOULARMOR_GEM_UPGRADE_ERR3	= _t"该宝石禁止升级"
SOULARMOR_GEM_UPGRADE_ERR4	= _t"宝石已经到最高等级"
SOULARMOR_GEM_UPGRADE_ERR5	= _t"参数错误"
SOULARMOR_GEM_UPGRADE_ERR6	= _t"所需物品错误"
SOULARMOR_GEM_UPGRADE_ERR7	= _t"所需物品数量参数错误"
SOULARMOR_GEM_UPGRADE_ERR8	= _t"所需物品数量不够"
SOULARMOR_GEM_UPGRADE_ERR9	= _t"所需辅助物品错误"
SOULARMOR_GEM_UPGRADE_ERR10	= _t"所需辅助物品数量错误"
SOULARMOR_GEM_UPGRADE_ERR11	= _t"所需辅助物品数量不够"
SOULARMOR_GEM_UPGRADE_ERR12	= _t"宝石等级已经超过铠甲允许的最大等级"
SOULARMOR_UPGRADE_ERR1		= _t"铠甲ID错误"
SOULARMOR_UPGRADE_ERR2		= _t"铠甲已经达到最大等级"
SOULARMOR_UPGRADE_ERR3		= _t"玩家等级不够"
SOULARMOR_UPGRADE_ERR4		= _t"星币不够"
SOULARMOR_UPGRADE_ERR5		= _t"经验不够"
SOULARMOR_UPGRADE_ERR6		= _t"历练不够"
SOULARMOR_UPGRADE_ERR7		= _t"请求的物品参数错误"
SOULARMOR_UPGRADE_SUCC		= _t"铠甲升级成功"
SOULARMOR_UPGRADE_LEV		= _t"%s升级到%d级"
SOULARMOR_UPGRADE_EXP		= _t"%s获取%d点经验"
SOULARMOR_UPGRADE_FULLLEV	= _t"该部件已经达到满级"
SOULARMOR_UPGRADE_NOTACTIVE	= _t"该部件未激活，激活后才可以升级"
SOULARMOR_UPGRADE_NUM		= _t"宝石升级,消耗道具%d个"
SOULARMOR_GEMS_LEVEL		= _t"所有宝石总等级:%d级"
SOULARMOR_NEXT_GFX_LEVEL	= _t"下一级光效需要%d级"
SOULARMOR_GFX_NO_GEM_HINT	= _t"胸甲第一个孔需要放入灵魂宝石，否则没有光效"
SOULARMOR_NAME				=	_t"灵魂之甲"

--战力体检
POWER_EXAM_OVER_LEVEL = "级之后战力达到"
POWER_EXAM_IN_LEVEL = "级之前战力达到"
-------------------------
-- 快捷键设置
KEY_INPUT 		= _t"^00FF00请输入"
KEY_ERROR 		= _t"不允许使用此键，请输入其他键替代。"
KEY_CONFLICT 	= _t"此键已被使用。\r选择“确定”替代原有定义，选择“取消”重新输入新键。"
KEY_DEFAULT		= _t"恢复默认配置将丢失当前的按键设置, 确定修改?"


---------------------------
----礼品卡
INPUT_GIFT_CARD		=	_t"请输入20位的礼品卡序列号："
INPUT_GIFT_CARD_SIZE_WRONG	=	_t"序列号不是20位，请检查"
GIFT_CARD_ROLE_OLD	=	_t"只有（%s）之后创建的角色才能使用该卡"
GS_ERROR_281 = _t"只有（%s）之后创建的角色才能使用该卡"

ACTIVITY_INTRODUCE_NPC_1 = _t"${npc(44135,\"寻径至奖励大使\")}"
ACTIVITY_INTRODUCE_NPC_2 = _t"${npc(44134,\"寻径至辰己德丸\")}"
ACTIVITY_INTRODUCE_NPC_3 = _t"${npc(44134,\"寻径至辰己德丸\")}"
ACTIVITY_INTRODUCE_NPC_4 = _t""

OPER_LIST =
{
    --	Move keys
    _t"前进",
    _t"后退",
    _t"左平移",
    _t"右平移",
    _t"跳跃/上升",
    _t"下降",
    _t"自动前进",
    _t"跟随",
    _t"镜头拉近",
    _t"镜头拉远",
    --	Chat keys
    _t"回复密语信息",
    --	Select keys
    _t"自我施法",
    _t"选择自己",
    _t"选择队友1",
    _t"选择队友2",
    _t"选择队友3",
    _t"选择队友4",
    _t"选择队友5",
    _t"选择最近可攻击目标",
    _t"协助目标",
    --	UI panel keys
    _t"开/关人物界面",
    _t"开/关商城界面",
    _t"开/关包裹界面",
    _t"开/关任务界面",
    _t"开/关技能界面",
    _t"开/关大地图界面",
    _t"开/关小宇宙界面",
    _t"开/关圣衣界面",
    _t"开/关好友界面",
    _t"开/关军团界面",
    _t"开/关排行榜界面",
    _t"开/关连招界面",
    _t"开/关生产界面",
    _t"开/关守护星界面",
    _t"开/关系统菜单",
    _t"开/关日程表界面",
    _t"开/关团队界面",
    _t"开/关圈子界面",
    _t"开/关小伙伴界面",
    _t"开/关图鉴界面",
    _t"开/关成就界面",
    _t"开/关声望界面",
    _t"开/关斗魂界面",
    _t"开/关照相机",
    _t"开/关女神宝库界面",
    _t"开/关VIP界面",
    _t"开/关进程界面",
    _t"开/关师徒界面",
    _t"开/关观星界面",
    _t"开/关灵魂之甲界面",
    _t"开/关界面显示",
    --	Other keys
    _t"开/关音乐",
    _t"开/关音效",
    _t"音量放大",
    _t"音量减小",

    _t"窗口/全屏切换",
    _t"老板键",

    _t"小宇宙爆发",
    _t"格挡",
    _t"拾取",

    --	Shortcut keys
    _t"主快捷栏1",
    _t"主快捷栏2",
    _t"主快捷栏3",
    _t"主快捷栏4",
    _t"主快捷栏5",
    _t"主快捷栏6",
    _t"主快捷栏7",
    _t"主快捷栏8",
    _t"主快捷栏9",
    _t"主快捷栏0",
    _t"主扩展快捷栏1_1",
    _t"主扩展快捷栏1_2",
    _t"主扩展快捷栏1_3",
    _t"主扩展快捷栏1_4",
    _t"主扩展快捷栏1_5",
    _t"主扩展快捷栏1_6",
    _t"主扩展快捷栏1_7",
    _t"主扩展快捷栏1_8",
    _t"主扩展快捷栏1_9",
    _t"主扩展快捷栏1_0",
    _t"主扩展快捷栏2_1",
    _t"主扩展快捷栏2_2",
    _t"主扩展快捷栏2_3",
    _t"主扩展快捷栏2_4",
    _t"主扩展快捷栏2_5",
    _t"主扩展快捷栏2_6",
    _t"主扩展快捷栏2_7",
    _t"主扩展快捷栏2_8",
    _t"主扩展快捷栏2_9",
    _t"主扩展快捷栏2_0",
    _t"主扩展快捷栏3_1",
    _t"主扩展快捷栏3_2",
    _t"主扩展快捷栏3_3",
    _t"主扩展快捷栏3_4",
    _t"主扩展快捷栏3_5",
    _t"主扩展快捷栏3_6",
    _t"主扩展快捷栏3_7",
    _t"主扩展快捷栏3_8",
    _t"主扩展快捷栏3_9",
    _t"主扩展快捷栏3_0",
    _t"圣衣技能栏",
    _t"圣衣技能栏2",
    _t"圣衣技能栏3",

    _t"隐藏/显示其他宠物模型",
    _t"隐藏/显示其他怪物模型",
    _t"隐藏/显示其他玩家模型",
    _t"隐藏/显示游戏光效",

    _t"输入聊天信息",
    _t"一键选怪",
    _t"截图",
    _t"强制攻击键",
   	_t"取消",
    "W",
    "A",
    "S",
    "D",
    "GM",
    "Console",
    _t"测试",
}
for i, v in ipairs(OPER_LIST) do
    if _M then
    	_M[Format("GAME_OPER_NAME%03d", i)] = v
    end
end
