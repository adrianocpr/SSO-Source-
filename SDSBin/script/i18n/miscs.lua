--[[ @i18n miscs ]]
local _t = require("i18n").context("miscs")

module("STRING_TABLE")

---------------------
-- 待删除的字符串资源

--sect


BOOK_COLLECT_DONE = _t"%s 加入了收藏：%s"
UNSIRED = _t"未修炼"
SIRED = _t"已修炼"
ERR_FORGET_SUBPROF_ITEM = _t"这个物品不是遗忘副守护星座所需的"
DIS_HIDE_MONSTER = _t"隐藏其他怪物"
DIS_SHOW_MONSTER = _t"显示其他怪物"
DIS_HIDE_PLAYER = _t"隐藏其他玩家"
DIS_SHOW_PLAYER = _t"显示其他玩家"
DIS_HIDE_PET = _t"隐藏其他宠物"
DIS_SHOW_PET = _t"显示其他宠物"
DIS_LOW_SETTING = _t"降低视频总体设置"
DIS_RESTORE_SETTING = _t"恢复原有视频设置"

VITALITY_NUM =_t"精力值：%d/%d"
VIGOUR_NUM =_t"活力值：%d/%d"

PET_NOT_BOUND = _t"宠物尚未绑定，不能这样做"
PET_RENAME_BADWORDS = _t"名字中含有非法字符"
PET_SIRE_ALREADY = _t"已修炼过的宠物无法再次修炼"
EGG_FINISH_INCU_INFORM = _t"用去%d分钟时间后，宠物 %s 炼化已完成"
PET_SELF_INC_CONFIRM = _t"将宠物原石放入炼化栏即开始炼化,是否确定?"
PET_RENAME_FAILED = _t"只能对已绑定宠物的名字进行修改"
PET_NPC_INCBATOR_FULL = _t"宠物修炼师的炼化栏空间已被占满"
PET_BOUND_CONFIRM = _t"放入宠物栏后将被绑定，无法再交易给他人，是否确定？"
PET_INCUBATOR_EMPTY_HINT = _t"放入宠物原石即开始炼化"
PET_INCUBATOR_IN_INC = _t"正在进行炼化"
PET_PACK_FULL = _t"你的宠物栏空间已满"
PET_INCBATOR_FULL = _t"你的宠物炼化栏空间已满"

EGG_LEVEL_MISMATCH = _t"你的等级尚未达到此宠物原石的炼化等级要求"
PET_FEED_NOPET = _t"请先选中要喂食的宠物或者将其唤出"
PET_FEED_NOFOOD = _t"没有找到该宠物所需的食物"
PET_FEED_FAILED = _t"没有选中的宠物或没有对应的宠物食物"
EGG_IN_INCU = _t"%s正在进行炼化 \r炼化已持续进行%d分%d秒"
EGG_IN_INCU_NPC = _t"%s正在进行炼化 \r剩余时间%d小时%d分钟"
EGG_EMPTY_NPC = _t"宠物修炼师的代理炼化需要进行12小时，可离线托管，代理炼化与自身炼化的效果相同。"
EGG_FINISH_INCU = _t"%s炼化已完成"
ITEM_COUNT_ONE = _t"无法拆分"
PACK_FULL_WARNING = _t"包裹空间已满，无法拆分物品"
PET_MERIT_0 = _t"物理精通"
PET_MERIT_1 = _t"地系精通"
PET_MERIT_2 = _t"水系精通"
PET_MERIT_3 = _t"火系精通"
PET_MERIT_4 = _t"风系精通"
PET_MERIT_5 = _t"光明精通"
PET_MERIT_6 = _t"黑暗精通"

PET_DEFECT_0 = _t"物理薄弱"
PET_DEFECT_1 = _t"地系薄弱"
PET_DEFECT_2 = _t"水系薄弱"
PET_DEFECT_3 = _t"火系薄弱"
PET_DEFECT_4 = _t"风系薄弱"
PET_DEFECT_5 = _t"光明薄弱"
PET_DEFECT_6 = _t"黑暗薄弱"

PET_TALENT_0 = _t"生命值天赋加强，等级%d"
PET_TALENT_1 = _t"攻击力天赋加强，等级%d"
PET_TALENT_2 = _t"防御力天赋加强，等级%d"
PET_TALENT_0_DETAIL = _t"提升生命值成长率 %.1f%%"
PET_TALENT_1_DETAIL = _t"提升攻击力成长率 %.1f%%"
PET_TALENT_2_DETAIL = _t"提升防御力成长率 %.1f%%"


EQUIPENCHANGE_LACK_BINDMONEY = _t"您携带的抵用金不足以支付本次强化费用，是否用金币补足差额？"
SHOP_BUY_LACK_BINDMONEY = _t"您携带的抵用金不足以支付本次购买，是否用金币补足差额？"
TALENT_REQUIRE_MISMATCH = _t"需要前置天赋 %s 到%d级"
INFO_OVERTIME = _t"该请求因超时已被忽略"

SECT_DISCIPLE_FINISH 	= _t"%s 出师"
SECT_DISCIPLE_EXPEL 	= _t"%s 被逐出师门"
SECT_DISCIPLE_QUIT 		= _t"%s 叛师"
SECT_DISCIPLE_RECRUIT 	= _t"%s 加入师门"


LEVELUP			=	_t"你升到了%d级"
LEVELUPEX		=	_t"潜修等级提升为%d级"
GOTSP			=	_t"获得%d点副守护星座经验"

PICKUPITEM		=	_t"拾取了%d个 %s"
PRODUCEITEM		=	_t"制造了%d个 %s"
DISCONNECTED	=	_t"与服务器的连接已经断开，请您重新登录。"
NOTARGET		=	_t"没有选择使用对象"

TARGETISFAR		=	_t"目标距离过远"
WRONGVERSION	=	_t"您的客户端程序版本过低，请先退出游戏进行更新。"
OFFLINE			=	_t"%s 目前没有在线或角色不存在"

TARGETWRONG		=	_t"所选目标有误"
SEARCHTEAM		=	_t"寻找队伍"

SEARCHTEAMMEM	=	_t"招募队员"
LEVELANDPROF	=	_t"%s %s "
INITIATIVE		=	_t"主动"
PASSIVE			=	_t"被动"

DEAD_STATUS     =   _t"操作失败，你处于死亡状态"

LEVEL2UP		=	_t"你的级别达到了 %s"
FAILEDTOCONN	=	_t"无法连接到服务器"

KICKOUTROLE		=	_t"角色%I64d已被封禁"
KICKOUTUSER		=	_t"帐号%d已被封禁"
ONLINENUMBER	=	_t"在线人数 %d / %d"
RESTARTSEV		=	_t"服务器即将重新启动"
SHUTUPROLE		=	_t"角色%I64d被禁言%d秒"

SHUTUPUSER		=	_t"帐号%d被禁言%d秒"
NEEDMONEY		=	_t"没有足够的金钱"
MYFRIEND		=	_t"我的好友"

MSGSENDFAIL		=	_t"消息发送失败"
MSGSENDWAIT		=	_t"该信息每个小时只能发送一次"
OPTSUCCESS		=	_t"操作成功"
OFFLINE2		=	_t"查无此人或者对方现在不在线"

SERVERCLOSE		=	_t"游戏将在%d秒钟后暂时关闭"
WRONGROLE		=	_t"查无此人"

EGGDISAPPEAR			=	_t"%d个 %s 开始炼化"
ITEMDISAPPEAR			=	_t"%d个 %s 消失了"
ERR_INSTDATA			=	_t"圣斗士星矢ol欢迎你！"

CMD_INCOOLTIME			=	_t"命令还没有恢复"
TRASHBOX_EXPAND			=	_t"仓库已扩建为%d格"

BEKILLED				=	_t"你被 %s 杀死了"

CHAT2					=	_t"%s：%s"
CHAT_BLESS					=	_t"%s 得到雅典娜的祝福，获得雅典娜亲手赠予的奖励：%s。"
FORBIDTIME				=	_t"封禁剩余时间：%d分钟"
FORBIDLOGIN				=	_t"禁止登陆"
LOGIN_SHOULD_SELECT_LINE=   _t"请选择游戏线路"

FORBIDTALK				=	_t"禁止发言"
FORBIDTRADE				=	_t"禁止与玩家交易"
FORBIDSELL				=	_t"禁止卖出物品"
FORBIDREASON			=	_t"封禁理由：%s"
DUEL_WIN				=	_t"&%s& 在决斗中战胜了 &%s&"

DUEL_DRAW				=	_t"&%s& 和 &%s& 的决斗未分胜负"
DUEL_INFIGHT			=	_t"战斗状态中不能进行决斗"
DUEL_ASKSENT			=	_t"决斗邀请已向对方发出，请等待回应"
WRONGPROF				=	_t"守护星座不符合要求，不能这么做"
BUSINESS_SKILL_FOREKNOW	=	_t"行情预测"

PET_CORRALFULL			=	_t"宠物背包已满，无法进行炼化"

SERVERUPDATE			=	_t"服务器正在维护中，请您稍候登陆。"

OBTAINTANK				=	_t"取得了攻城车的控制权"
LOSETANK				=	_t"失去了攻城车的控制权"
GM_INVISIBLE			=	_t"进入隐身状态"
GM_VISIBLE				=	_t"脱离隐身状态"

GM_INVINCIBLE			=	_t"进入无敌状态"
GM_VINCIBLE				=	_t"脱离无敌状态"
DEST_ERRINSTANCE		=	_t"目的地不在本地图范围内。"
DEST_NORTHEAST			=	_t"目的地可能在东北方。"
DEST_SOUTHEAST			=	_t"目的地可能在东南方。"

DEST_EAST				=	_t"目的地可能在东方。"
DEST_NORTHWEST			=	_t"目的地可能在西北方。"
DEST_SOUTHWEST			=	_t"目的地可能在西南方。"
DEST_WEST				=	_t"目的地可能在西方。"
DEST_NORTH				=	_t"目的地可能在北方。"

DEST_SOUTH				=	_t"目的地可能在南方。"
DEST_UPSIDE				=	_t"目的地可能在上方。"
DEST_DOWNSIDE			=	_t"目的地可能在下方。"
BUSINESS_SKILL_UNDERCUT	=	_t"砍价"
BUSINESS_SKILL_BIDUP	=	_t"抬价"

BUSINESS_SKILL_SPLURGE	=	_t"漫天要价"
BUSINESS_SKILL_SUCCESS	=	_t"%s成功！"
ERR_GSHOPDATA			=	_t"商城数据与服务器不同步"
NEW_INVENTORY_SIZE		=	_t"包裹已扩充为%d格"

BUSINESS_SKILL_FAILED	=	_t"%s失败"
ITEMBIND				=	_t"%s绑定成功"
BINDAFTEREQUIP			=	_t"%s将于装备后绑定"

LEARNSKILL				=	_t"学会“%s”%d级"
CLEARSKILL				=	_t"重置“%s”为%d级"


FACTION_TRASHBOX_EXPAND	=	_t"公会仓库空间扩建到了%d格"

LEVEL2_1				=	_t"无"
LEVEL2_2				=	_t"修真第一层"
LEVEL2_3				=	_t"修真第二层"
LEVEL2_4				=	_t"修真第三层"

LEVEL2_5				=	_t"修真第四层"
LEVEL2_6				=	_t"修真第五层"
LEVEL2_7				=	_t"修真第六层"
LEVEL2_8				=	_t"保留1"



BUSINESS_PURCHASED		=	_t"购买了商品"
BUSINESS_SOLD			=	_t"出售了商品"
LEARNTALENT				=	_t"已领悟天赋 %s %d阶"


WHOSETHING				=	"%s \r (%s)"

LEVELUP2				=	_t"你的副守护星座升到了%d级"
CANNOT_ARRANGE			=	_t"现在无法整理"

SELF_ACTION_START		=   _t"启动自我施法"
SELF_ACTION_END			=	_t"关闭自我施法"
HOT_KEY_REG_BY_OTHER	=	_t"注册失败: 热键已被其他程序注册"
MONEY_BAG_TYPE_1		=	_t"墨丘利经商"

MONEY_BAG_TYPE_2		=   _t"商业节"
MONEY_BAG_TYPE_3		=	_t"跑商钱袋种类预留3"
MONEY_BAG_TYPE_4		=	_t"跑商钱袋种类预留4"
MONEY_BAG_TYPE_5		=	_t"跑商钱袋种类预留5"
MONEY_BAG_TYPE_6		=	_t"跑商钱袋种类预留6"

MONEY_BAG_TYPE_7		=   _t"跑商钱袋种类预留7"
MONEY_BAG_TYPE_8		=	_t"跑商钱袋种类预留8"
MONEY_BAG_TYPE_9		=	_t"跑商钱袋种类预留9"
MONEY_BAG_TYPE_10		=	_t"跑商钱袋种类预留10"
MONEY_BAG_TYPE_11		=	_t"跑商钱袋种类预留11"

MONEY_BAG_TYPE_12		=   _t"跑商钱袋种类预留12"
MONEY_BAG_TYPE_13		=	_t"跑商钱袋种类预留13"
MONEY_BAG_TYPE_14		=	_t"跑商钱袋种类预留14"
MONEY_BAG_TYPE_15		=	_t"跑商钱袋种类预留15"
MONEY_BAG_TYPE_16		=	_t"跑商钱袋种类预留16"

MONEY_BAG_TYPE_17		=   _t"跑商钱袋种类预留17"
MONEY_BAG_TYPE_18		=	_t"跑商钱袋种类预留18"
MONEY_BAG_TYPE_19		=	_t"跑商钱袋种类预留19"
MONEY_BAG_TYPE_20		=	_t"跑商钱袋种类预留20"
MONEY_BAG_TYPE_21		=	_t"跑商钱袋种类预留21"

MONEY_BAG_TYPE_22		=   _t"跑商钱袋种类预留22"
MONEY_BAG_TYPE_23		=	_t"跑商钱袋种类预留23"
MONEY_BAG_TYPE_24		=	_t"跑商钱袋种类预留24"
MONEY_BAG_TYPE_25		=	_t"跑商钱袋种类预留25"
MONEY_BAG_TYPE_26		=	_t"跑商钱袋种类预留26"

MONEY_BAG_TYPE_27		=   _t"跑商钱袋种类预留27"
MONEY_BAG_TYPE_28		=	_t"跑商钱袋种类预留28"
MONEY_BAG_TYPE_29		=	_t"跑商钱袋种类预留29"
MONEY_BAG_TYPE_30		=	_t"跑商钱袋种类预留30"
MONEY_BAG_TYPE_31		=	_t"跑商钱袋种类预留31"

MONEY_BAG_TYPE_32			=   _t"跑商钱袋种类预留32"


NOTINARMY					=	_t"你不在任何军团中。"
NOTINKINGDOM				=	_t"你不在任何公会中。"


THEME_NORMAL					=	_t"默认外观"
THEME_NEW						=	_t"备选外观"
EMPTY_STONE						=	_t"没有宝石"


ITEMDESC_NAMENUMBER					= _t"%s （%d）" 	--  物品名称（数量）
ITEMDESC_2STRINGS					= "%s %s" 		--  两个字符串的都可以使用这个，比如：镶嵌物名称 镶嵌物描述
ITEMDESC_ERRORITEM					= _t"错误物品"
ITEMDESC_ALL						= _t"全部"
ITEMDESC_FATALERROR					= _t"发生致命错误的物品"
ITEMDESC_SUITE_PROP_ITEM			= _t"套装(%d)："
ITEMDESC_LEVEL2_REQUIRE				= _t"修真等级要求 %s"
ITEMDESC_PET_SKILL_DESC				= _t"技能%s%d级"


ENHANCE_SUCCESS						= _t"成功地完成了聚能，装备的品质提升了。"
ENHANCE_SUCCESS_WITH_NEW_HOLE		= _t"成功地完成了强化，装备的品质提升了 恭喜您获得了%d号宝石孔。"
ENHANCE_FAIL						= _t"聚能失败"
INSTALL_RUNE_SUCCESS				= _t"镶嵌成功，符文蕴含的力量已被激发。"
INSTALL_STONE_SUCCESS				= _t"镶嵌宝石成功"
UNINSTALL_RUNE_SUCCESS				= _t"拆卸符文成功，符文已销毁。"
UNINSTALL_STONE_SUCCESS				= _t"拆卸宝石成功，获得一颗宝石。"
MARK_ITEM_SUCCESS					= _t"刻名成功，你已成为此装备的专属主人。"
MARK_ITEM_FAIL						= _t"刻名失败，用于刻名的物品已损毁。"
IDENTIFY_ITEM_SUCCESS				= _t"装备鉴定成功！"
REIDENTIFY_ITEM_SUCCESS				= _t"装备重新鉴定成功！"
EQUIP_ALREADY_IDENTIFY				= _t"装备已经鉴定过。"
IDENTIFY_ERROR_NOT_IN_NORMAL_PACK	= _t"请将装备放入包裹后再进行鉴定"

ITEM_QUALITY_0						= _t"残破"
ITEM_QUALITY_1						= _t"普通"
ITEM_QUALITY_2						= _t"优秀"
ITEM_QUALITY_3						= _t"精良"
ITEM_QUALITY_4						= _t"史诗"
ITEM_QUALITY_5						= _t"传说"
ITEM_QUALITY_6						= _t"预留"
ITEM_QUALITY_7						= _t"预留"
ITEM_QUALITY_8						= _t"套装"
ITEM_QUALITY_9						= _t"高级套装"

PRODUCE_CRIT_NOTIFY					= _t"%s在生产过程中意外地获得了[%s]*%d！"
FORGET_PRODUCE_SKILL				= _t"你遗忘了副守护星座 %s"
FORGET_PRODUCE_SKILL_LEVEL			= _t"副守护星座%s降到%d级"
CURRENT_CONSTELLATION			= _t"星象呈现为 %s"
GET_SUB_PROFESSION_POINT  		= _t"获得了 %d点 副守护星座点数"
GIFT_TIME_WAIT_TIME				= _t"等待一个新的启示："
GIFT_TIME_READY_TO_RECEIVE		= _t"触碰天象，获取启示"

GIFT_RECEIVE_TEXT				= _t"预留   格包裹空间后点击领取。稍候        钟可打开一个新的启示。"
GIFT_RECEIVE_SIMPLE_TEXT		= _t"预留   格包裹空间后点击领取。"
SHOW_DAMAGE_TYPE_SHOW_ALL		= _t"显示所有伤害"
SHOW_DAMAGE_TYPE_SHOW_SELF		= _t"只显示自己和宠物的伤害"
SHOW_DAMAGE_TYPE_SHOW_NONE		= _t"不显示伤害"

COUNT_DOWN_GIFT_WAITING			= _t"新的启示尚未到来"

RETURN_TO_TOWN_POS				= _t"当前回城位置：%s"


COMBAT_LEADER_OFFLINE		= _t"对方会长不在线，无法进行挑战"
COMBAT_INVITE_COOLING		= _t"公会荣誉战请求冷却中，间隔至少5分钟"
COMBAT_THEY_IN_BATTLE		= _t"公会正处于公会荣誉战中，请稍后再发起挑战"
COMBAT_INVITE_THEY_LEL_LOW	= _t"对方公会等级不足2级，无法对其宣战"
COMBAT_BROADCAST_INVITE		= _t"%s 公会向 %s 公会提出了荣誉战请求"
COMBAT_BROADCAST_ACCEPT		= _t"%s 公会接受了 %s 公会的挑战"
COMBAT_BROADCAST_REFUSE		= _t"%s 公会拒绝了 %s 公会的挑战"
COMBAT_BROADCAST_TIMEOUT	= _t"%s 公会向 %s 公会的荣誉宣战迟迟没有回应，宣战请求失效"
COMBAT_BROADCAST_RESULT		= _t"%s 公会与 %s 公会的荣誉战结束，总杀人数 %d:%d，%s 公会获得了胜利！"
COMBAT_BROADCAST_DEUCE		= _t"%s 公会与 %s 公会的荣誉战结束，总杀人数 %d:%d，双方战成平手。"

PRAY_COUNT_LESS_THAN_MAX	= _t"\r                今日祈福：%d/4。正篇之祈福（每日前4次）能获得\r                人物经验，并有机会获得众神的献礼和祝福"
PRAY_COUNT_OVER_MAX			= _t"\r                今日祈福：%d/4。续篇之祈福（每日4次后）不能获\r                得人物经验和众神献礼，但有机会获得众神祝福"

STF_STRING_551 = _t"已打开好友上下线通知。"
STF_STRING_552 = _t"已取消好友上下线通知。"
STF_STRING_553 = _t"已打开好友自动回复。"
STF_STRING_554 = _t"已取消好友自动回复。"

STF_STRING_6101 = _t"玩家角色ID"
STF_STRING_6102 = _t"帖子接受时间"
STF_STRING_6103 = _t"帖子类型"
STF_STRING_6104 = _t"帖子内容"
STF_STRING_6105 = _t"接受帖子的GM的ID"
STF_STRING_6106 = _t"已处理/放弃处理"
STF_STRING_6107 = _t"结帖时间"
STF_STRING_6108 = _t"备注"

STF_STRING_6201 = _t"命令名称"
STF_STRING_6202 = _t"命令执行详细参数"
STF_STRING_6203 = _t"命令执行时间"
STF_STRING_6204 = _t"执行命令的GM的ID"
STF_STRING_6205 = _t"关联帖子的用户ID"
STF_STRING_6206 = _t"关联帖子的接收时间"

STF_STRING_10200 = _t"亲密无间"
STF_STRING_10201 = _t"结束拥抱"
STF_STRING_10202 = _t"结束多人共骑"
STF_STRING_10203 = _t"%s 邀请你共乘一骑，你同意吗？"
STF_STRING_10204 = _t"%s 谢绝与你多人共骑。"
STF_STRING_10205 = _t"多人共骑"

STF_STRING_10300 = _t"小秘书"
STF_STRING_10301 = _t"搜索结果"

ERR_SSOGT_AGENTNAME			= _t"agentname不合法，获取ticket失败"
ERR_SSOGT_AGENTACCOUNT		= _t"agentaccount不合法，获取ticket失败"
ERR_SSOGT_OTHER				= _t"其他错误（数据库异常）"
ERR_SSOGT_TIMEOUT			= _t"超时，请重试"
ERR_SSOGT_NETERR			= _t"网络通讯错误，请重试"
ERR_SSOGT_BAN				= _t"禁止该账号登陆其他系统"
ERR_SSOGT_ILLEGAL			= _t"该帐号为非法自动登录"
ERR_SSOGT_WRONG_AID			= _t"目的地不合法，获取ticket失败"
ERR_SSOGT_NOACCOUNT			= _t"账号不存在"
ERR_GT_LOGIN_CD					= _t"GT登陆频繁，请稍后再试"

ERR_CDS_FAILED					= _t"跨服失败"
ERR_CDS_COMMUNICATION			= _t"跨服通信失败"
ERR_CDS_REMOTE_VERIFYFAILD		= _t"跨服认证阶段失败"
ERR_CDS_IDENTITY_TIMEOUT		= _t"跨服身份验证超时"
ERR_CDS_IDENTITY_NOTMATCH		= _t"跨服身份验证不匹配"
ERR_CDS_RECV_WRONG_PROTO		= _t"网络通讯错误，请重试"
ERR_CDS_REMOTE_FETCHDATA_TIMEOUT= _t"跨服取数据超时"
ERR_CDS_SAVE_REMOTEDATA			= _t"保存跨服数据失败"
ERR_CDS_SERVICE_FORBIDDEN		= _t"跨服状态下无法使用"

STF_CHOOSE_PROFESSION1	= _t"     确定要选择^FFFF00%s^FFFFFF吗？\r 达到59级可以重新选择其他守护星座。"
STF_CHOOSE_PROFESSION2	= _t"%s选择%s座为守护星座"

STF_NEED_LV_LIMIT				= _t"需要玩家达到%s"
STF_NO_UNDER_WATER				= _t"无法在水中进行"
STF_NO_UNDER_WATER_REST		= _t"无法在水中进行祈祷"
STF_NO_UNDER_WATER_SIT		= _t"无法在水中进行打坐"
STF_NO_CHANGE_MODEL				= _t"无法变身状态下进行"
STF_NO_CHANGE_MODEL_REST	= _t"无法变身状态下进行祈祷"
STF_NO_CHANGE_MODEL_SIT		= _t"无法变身状态下进行打坐"
STF_CUR_STATE_CANNOT_FLY	= _t"当前状态无法飞行"
STF_CUR_STATE_CANNOT_FLY1	= _t"当前场景不允许飞行"
STF_CUR_STATE_CANNOT_FLY2	= _t"变身状态下无法飞行"
STF_CUR_STATE_CANNOT_FLY3	= _t"战斗状态下禁止飞行"
STF_CUR_STATE_CANNOT_MOUNT= _t"当前场景不允许骑乘"
STF_GET_EXP_BY_POWER			= _t"沐浴荣光每5分钟获得%d点储存经验"
STF_MATTER_BIND_MONEY			= _t"金券：%d"
STF_MATTER_BIND_MONEY1		= _t"金券：%d \r（差额可由金币补足）"
STF_MATTER_BIND_MONEY2		= _t"金券不足是否使用金币补足差额？"
STF_MATTER_BIND_MONEY3		= _t"金券总价："
STF_MATTER_MONEY					= _t"金币：%d"
STF_MATTER_MONEY3					= _t"金币总价："
STF_LEVEL_FORMAT					= _t"%d级"
STF_PRAY_TIME							= _t"%d小时%d分钟%d秒"
STF_PRAY_TIME1						= _t"高效时间"
STF_PRAY_TIME2						= _t"普通时间"
STF_PRAY_TIME3						= _t"累计时间"
STF_PRAY_HINT_1							= _t"%d点储存经验+%d点经验"
STF_PRAY_HINT_2							= _t"%d点储存历练+%d点历练"
STF_PRAY_WARNING_1			= _t"您今天沐浴荣光已经达到8小时\r今天继续将无法获得任何储存经验和经验"
STF_PRAY_WARNING_2			= _t"您今天沐浴荣光已经达到8小时\r今天继续将无法获得任何储存历练和历练"
STF_PRAY_EXPTAG_1			= _t"获得储存经验:"
STF_PRAY_EXPTAG_2			= _t"获得储存历练:"
STF_LV_TOO_HIGHT_TO_MINE	= _t"您等级过高，无法采集"
STF_USE_ITEM_CONFIRM			= _t"确定使用【%s】？\r%s"
STF_USE_ITEM_CONFIRM_R1		= _t"今天已经满8小时了，明天再用吧，要不损失可就大了"
STF_USE_ITEM_CONFIRM_R2		= _t"存储经验已达上限，释放一下吧，不然将无法再获得储存经验了"
STF_EXCHANGE_LV						= _t"需等级达到：%s"
STF_EXCHANGE_POWER				= _t"需战力达到：%d"
STF_EXCHANGE_REPUTATION1	= _t"需%s达到%s"
STF_EXCHANGE_REPUTATION2	= _t"需消耗%s %s"
STF_EXCHANGE_TIMES1				= _t"【仅限兑换%d次】"
STF_EXCHANGE_TIMES2				= _t"【不限兑换次数】"
STF_EXCHANGE_TIMES3				= _t"【当日可兑换%d次】"
STF_EXCHANGE_TIMES4				= _t"【本周可兑换%d次】"
STF_EXCHANGE_TIMES5				= _t"【明日可兑换】"
STF_EXCHANGE_TIMES6				= _t"【下周可兑换】"

STF_TEAM_LEADER						= _t" [队]"

SAINT_PET_SUMMON_1			=_t"释放星座守护[白羊座]"
SAINT_PET_SUMMON_2			=_t"释放星座守护[金牛座]"
SAINT_PET_SUMMON_3			=_t"释放星座守护[双子座]"
SAINT_PET_SUMMON_4			=_t"释放星座守护[巨蟹座]"
SAINT_PET_SUMMON_5			=_t"释放星座守护[狮子座]"
SAINT_PET_SUMMON_6			=_t"释放星座守护[处女座]"
SAINT_PET_SUMMON_7			=_t"释放星座守护[天秤座]"
SAINT_PET_SUMMON_8			=_t"释放星座守护[天蝎座]"
SAINT_PET_SUMMON_9			=_t"释放星座守护[射手座]"
SAINT_PET_SUMMON_10			=_t"释放星座守护[摩羯座]"
SAINT_PET_SUMMON_11			=_t"释放星座守护[水瓶座]"
SAINT_PET_SUMMON_12			=_t"释放星座守护[双鱼座]"

STF_EXCHANGE_SERVICE_LEVEL				= _t"等级不满足,无法兑换"
STF_EXCHANGE_SERVICE_FIGHTVALUE		= _t"战斗力不满足,无法兑换"
STF_EXCHANGE_SERVICE_LIMIT				= _t"已经达到兑换次数上限"
STF_EXCHANGE_SERVICE_REQUIRE_TASK	= _t"任务需求不满足,无法兑换"
STF_EXCHANGE_SERVICE_MUTEX_TASK		= _t"有互斥任务,无法兑换"
STF_EXCHANGE_SERVICE_REPUTATION		= _t"前提声望不满足,无法兑换"
STF_EXCHANGE_SERVICE_MONEY				= _t"金币不足,无法兑换"
STF_EXCHANGE_SERVICE_BIND_MONEY		= _t"金券不足,无法兑换"
STF_EXCHANGE_SERVICE_COST_REPUTATION= _t"没有足够的声望消耗,无法兑换"
STF_EXCHANGE_SERVICE_COST_ITEM		= _t"消耗物品不满足,无法兑换"
STF_EXCHANGE_TASK		= _t"任务条件不满足,无法兑换"
STF_EXCHANGE_PACKAGE_FULL		= _t"包裹已满,无法兑换"
STF_EXCHANGE_PACKAGE1		= _t"包裹空间不足"
STF_EXCHANGE_PACKAGE2		= _t"超过最大兑换次数100"
STF_EXCHANGE_PACKAGE3		= _t"金币不足"
STF_EXCHANGE_PACKAGE4		= _t"金券不足"
STF_EXCHANGE_PACKAGE5		= _t"%s不足"

STF_GT_TEAM_HINT_ENTER		= _t"加入队伍语音聊天房间"
STF_GT_TEAM_HINT_LEAVE		= _t"离开队伍语音聊天房间"

STF_HINT_HIDE_PET		= _t"进入多人战斗场景，为了更加流畅已帮您隐藏了不重要的模型，可以使用快捷键Alt+N恢复"
STF_LOADING_ERROR_HINT		= _t"加载建筑失败，请退出游戏进行版本验证"

STD_HIDE_GFX_DESC = _t"屏蔽游戏中的光效"

STD_TERRITORY_0 = _t"是否在当前位置开启军团传送？"
STD_TERRITORY_1 = _t"【红方】%s"
STD_TERRITORY_2 = _t"【蓝方】%s"
STD_TERRITORY_3 = _t"能量水晶%d%%"
STD_TERRITORY_4 = _t"防御水晶%d%%"
STD_TERRITORY_5 = _t"核心水晶%d%%"
STD_TERRITORY_6 = _t"战斗剩余时间：%d分钟"
STD_TERRITORY_7 = _t"确定离开当前战场？"
STD_TERRITORY_8 = _t"开启军团传送"
STD_TERRITORY_9 = _t"%s-战况"
STD_TERRITORY_10 = _t"战斗等待时间：%d分钟"
STD_TERRITORY_11 = _t"离开（%d秒）"
STD_TERRITORY_12 = _t"红方战车数量：%d"
STD_TERRITORY_13 = _t"蓝方战车数量：%d"
STD_TERRITORY_14 = _t"军团长已在%s展开传送门，30秒后团员可以传送至此！"
STD_TERRITORY_15 = _t"需要冷却%d秒"
STD_TERRITORY_16 = _t"可以开启传送门"
STD_TERRITORY_17 = _t"传送门已经稳定，突击开始！战斗吧！"
STD_TERRITORY_18 = _t"传送门能量耗尽消失了..."
STD_TERRITORY_19 = _t"战斗剩余时间：%d秒"
STD_TERRITORY_20 = _t"战斗等待时间：%d秒"
STD_TERRITORY_21 = _t"战斗状态下无法进入战场"
STD_TERRITORY_22 = _t"战斗状态下无法离开战场"

HOST_EXP_FMT 		= _t"%.0f%s (%.0f%%)" --格式
HOST_STOREEXP_FMT 	= _t"%.0f%s" --格式
HOST_EXP_UNIT 		= _t"亿" --单位