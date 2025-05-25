---------------------------------------------------------------
--  created:   2009.4.10
--  author:    liudong
--
--  字符串资源。 ---------------------------------------------------------------

local _t = _t

local Format = string.format
module("STRING_TABLE")

-------------
--通用
PLAYER_LEV1				= _t"%d级"
PLAYER_LEV2				= _t"潜修%d"
PLAYER_LEV2_COLOR		= _t"^66FF00潜修%d"
PLAYER_HP               = _t"血啊"
PLAYER_MP               = _t"蓝啊"
PLAYER_OFFLINE			= _t"离线"
PLAYER_EXP_1			= _t"经验：%.0f / %.0f"
PLAYER_EXP_2			= _t"历练：%.0f / %.0f"
PLAYER_STORED_EXP_1		= _t"储存经验：%I64d"
PLAYER_STORED_EXP_2		= _t"储存历练：%I64d"
ITEM_NAME				= _t"『%s』"
EQUIP_NAME				= _t"『%s +%d』"
LEVEL					= _t"%d级"
LEVEL_NAME					= _t"等级"
LEVEL_ZERO				= _t"地基基座"
FONT_NAME				= "方正细黑一简体"
INT_RATE				= "%d%%"
PLAYER_EXP_1_NAME			= _t"经验"
PLAYER_EXP_2_NAME			= _t"历练"

ITEMDESC_RACE1			= _t"希腊"
ITEMDESC_RACE2			= _t"庐山"
ITEMDESC_RACE3			= _t"西伯利亚"
ITEMDESC_RACE4			= _t"仙女岛"
ITEMDESC_RACE5			= _t"死亡皇后岛"

NAME					=	_t"名字"
PROFESSION				= _t"职业"
PROF_0					= _t"未知守护星座"
PROF_1					= _t"候补生"
PROF_2					= _t"天马"
PROF_3					= _t"白鸟"
PROF_4					= _t"天龙"
PROF_5					= _t"仙女"
PROF_6					= _t"凤凰"
PROF_7					= _t"海龙"
PROF_8					= _t"守护星座7"
PROF_9					= _t"守护星座8"
PROF2_0					= _t"未知升阶星座"
PROF2_1					= _t"候补生升阶星座"
PROF2_2					= _t"射手"
PROF2_3					= _t"水瓶"
PROF2_4					= _t"天秤"
PROF2_5					= _t"处女"
PROF2_6					= _t"狮子"
PROF2_7					= _t"双子"
PROF2_8					= _t"守护星座7升阶星座"
PROF2_9					= _t"守护星座8升阶星座"
GENDER					= _t"性别"
GENDER2					= _t"性别："

PROF_ATTR_2					= _t"地"
PROF_ATTR_3					= _t"火"
PROF_ATTR_4					= _t"水"
PROF_ATTR_5					= _t"风"
PROF_ATTR_6					= _t"雷"

PROF_ATTR_HINT_2					= _t"天马攻击"
PROF_ATTR_HINT_3					= _t"白鸟攻击"
PROF_ATTR_HINT_4					= _t"天龙攻击"
PROF_ATTR_HINT_5					= _t"仙女攻击"
PROF_ATTR_HINT_6					= _t"凤凰攻击"
PROF_ATTR_HINT_7					= _t"海龙攻击"


STRING_DATE_FORMAT_FULL	= _t"%Y年%m月%d日 %H:%M:%S"
STRING_TIME_BEFORE		= _t"%s前"
STRING_TIME_DAY         = _t"%d天"
STRING_TIME_HOUR		= _t"%d小时"
STRING_TIME_MINUTE		= _t"%d分钟"
STRING_TIME_MINUTE_SHORT= _t"%d分"
STRING_TIME_SECOND		= _t"%d秒"
STRING_TIME_MIN_SEC		= _t"%d分%d秒"
STRING_TIME_HOUR_MINUTE = _t"%d小时%d分钟"
STRING_TIME_DAY_HOUR    = _t"%d天%d小时"
STRING_TIME_COUNT_DOWN  = _t"剩余时间："
STRING_TIME_COUNT_DOWN_2  = _t"倒计时："
STRING_ITEM_CONTEXT     = _t"%s×%d"
STRING_FORMAT_DATA		= _t"%04d年%02d月%02d日%02d:%02d"
STRING_FORMAT_DATA2		= "%04d.%02d.%02d"
STRING_SUNDAY			= _t"周日"
STRING_MONDAY			= _t"周一"
STRING_TUESDAY			= _t"周二"
STRING_WENESDAY			= _t"周三"
STRING_THURSDAY			= _t"周四"
STRING_FRIDAY			= _t"周五"
STRING_SATURDAY			= _t"周六"
STRING_ALLWEEK			= "" --全周
ALL_DAY					= "" --全天
STRING_TIME_YEAR		= _t"%d年"
STRING_TIME_MONTH		= _t"%d个月"
STRING_TIME_SECONDEX	= _t"%0.1f秒"
STRING_TIME_BEFORE1		= _t"前"
STRING_TIME_HMS		    = "%d:%02d:%02d"

STRING_MORNING		=	_t"上午"
STRING_NOON		=	_t"中午"
STRING_AFTERNOON	=	_t"下午"
STRING_EVENING	=	_t"晚"
STRING_NIGHT	=	_t"夜里"

STRING_OR = _t"%s或%s"

WAN						= _t"%d万"
YOU						= _t"您"
NEW_LINE			    = "\r"

MALE					= _t"男"
FEMALE					= _t"女"

MONSTER_SUMMON_MASTER_NAME 	= "(%s)"
MONSTER_SUMMON_TEAM_NAME 	= _t"(%s 的队伍)"



----------------
--金钱和经验
BIND_MONEY_NAME				= _t"金券"
BIND_CASH_NAME				= _t"星券"
GAIN_BIND_MONEY 			= _t"背包里增加金券 %s"
GAIN_MONEY					= _t"背包里增加金币 %s"
GAIN_CASH					= _t"获得星币 %s"
LOSE_BIND_MONEY 			= _t"背包里减少金券 %s"
LOSE_MONEY					= _t"背包里减少金币 %s"
GAIN_INGOT        			= _t"获得星币 %s%d"
LOST_INGOT        			= _t"扣除星币 %s%d"
GAIN_BIND_INGOT   			= _t"获得星券 %s%d"
LOST_BIND_INGOT 			= _t"扣除星券 %s%d"
PK_DROP_MONEY				= _t"由于红名死亡损失金币 %s"
PK_DROP_EDUR				= _t"由于红名死亡损失装备耐久%d%%"
LOSE_EXP_HINT 				= _t"失去经验值 %I64d"
GAIN_EXP_HINT 				= _t"获得经验值 %I64d"
LOSE_EXP2_HINT 				= _t"失去历练值 %I64d"
GAIN_EXP2_HINT 				= _t"获得历练值 %I64d"
GAIN_STORED_EXP				= _t"获得储存经验 %I64d"
GAIN_STORED_EXP2			= _t"获得储存历练 %I64d"
STORED_EXP_TRANSFORMED 		= _t"储存经验释放了 %I64d"
STORED_EXP2_TRANSFORMED 	= _t"储存历练释放了 %I64d"
GAIN_AP						= _t"获得了怒气 %d"
LEVEL_UP_TOP				= _t"已经达到了最高的等级"
LEVEL_UP_AGE_TOP			= _t"已达到时代允许的最大等级，请团结起来打败进程BOSS开启新时代，按Y查看详情。"
LEVEL_UP_AGE_TOP_IN_CROSSERV= _t"跨服中已达到时代允许的最高等级，请回到原服尝试。"
LEVEL_UP_AUTO   			= _t"当前级别不需要手动升级"
LEVEL_UP_REST_VALUE_SHORT	= _t"^ffffff觉悟值过低（在${jump(6)}界面升级^00ff00战斗技能^ffffff可提升），无法升级"
LEVEL_UP_EXP_SHORT			= _t"经验值不够，无法升级"
LEVEL_UP_EX2_SHORT			= _t"历练值不够，无法升级"
ATTRIBUTE_CUR_EXP			= _t"当前经验:%.0f\r升级经验:%.0f"
ATTRIBUTE_REST				= _t"当前觉悟:%.0f\r升级觉悟:%.0f"


----------------
--链接样式
LINK_NPC_DECORATION = "%s"
LINK_QUEST_DECORATION = _t"【%s】"
LINK_HELP_DECORATION = _t"【%s】"
LINK_PROF_SKILL_DECORATION = _t"[%s 等级%d]"
LINK_JUMP_DECORATION = _t"【%s】"


----------------
--自动寻径
ROUTE_UNKNOWN_LOCATION                      = _t"？？？"
ROUTE_TITLE                                 = _t"正在寻径到：%s"
ROUTE_CURRENT_NODE_DECORATOR                = _t"^ffffff→%s^N"
ROUTE_NONCURRENT_NODE_DECORATOR             = _t"^999999　%s^N"
ROUTE_MOVE_TO_LOCATION                      = _t"前往 %s"
ROUTE_MOVE_TO_NPC                           = _t"前往【%s】的 %s "
ROUTE_TELEPORT_TO                           = _t"传送至【%s】"
ROUTE_CHANGE_LINE_TO                        = _t"切换至【%s】"
ROUTE_NODE_PRECINCT_NAME                    = _t"%s：%s"
ROUTE_AUTO_TELEPORT_INFO                    = _t"即将传送至【%s】"
ROUTE_AUTO_CHANGE_LINE                      = _t"即将切换至【%s】"

ROUTE_BUTTON_TELEPORT_IMMEDIATELY           = _t"立即传送"
ROUTE_BUTTON_TELEPORT_IMMEDIATELY_HINT      = _t"立即传送至【%s】"
ROUTE_BUTTON_TELEPORT_CANCEL                = _t"取消传送"
ROUTE_BUTTON_CHANGE_LINE_IMMEDIATELY        = _t"立即切换"
ROUTE_BUTTON_CHANGE_LINE_IMMEDIATELY_HINT   = _t"立即切换至【%s】"
ROUTE_BUTTON_CHANGE_LINE_CANCEL             = _t"取消切换"

AUTOMOVE_FORBID                             = _t"当前状态下无法寻找路线"
AUTOMOVE_INVALID_MAP                        = _t"当前地图无法寻找路线"
AUTOMOVE_INVALID_START                      = _t"你需要找一个合适的出发位置"
AUTOMOVE_INVALID_DEST                       = _t"您选择的目的地无法寻径"
AUTOMOVE_UNREACHABLE                        = _t"未找到合适的路线前往目的地"
AUTOMOVE_BEGIN                              = _t"开始前往目的地"
AUTOMOVE_CANCEL                             = _t"原定路线已取消"
AUTOMOVE_END                                = _t"到达目的地"
AUTOMOVE_WAIT_FOR_TELEPORT                  = _t"到达传送点，请传送至【%s】"
AUTOMOVE_WAIT_FOR_CHANGE_LINE               = _t"即将切换至【%s】"



----------------------
--矿物
MINE_LEVEL_REQUIRE = _t"等级要求：%s"
MINE_LEVEL_REQUIRE_UNFIT = _t"^ff0000等级要求：%s^N"


----------------------
--称谓相关
TITLE_REPUTATION1  = _t"平平无奇"
TITLE_REPUTATION2  = _t"授业解惑"
TITLE_REPUTATION3  = _t"有教无类"
TITLE_REPUTATION4  = _t"化育英才"
TITLE_REPUTATION5  = _t"传灯布道"
TITLE_REPUTATION6  = _t"桃李满园"
TITLE_REPUTATION7  = _t"百年树人"
TITLE_REPUTATION8  = _t"一代宗师"
TITLE_REPUTATION9  = _t"万世师表"
TITLE_REPUTATION10 = _t"乾坤圣人"



----------------------
--通用操作相关
GENERAL_OPRT4 			= _t"传送中"
GENERAL_OPRT5 			= _t"骑乘"
GENERAL_OPRT15 			= _t"传回军团基地"
GENERAL_OPRT14 			= _t"传送"
GENERAL_OPRT1 			= _t"飞行"
GENERAL_OPRT17			= _t"返回原服"


----------------------
--骑乘相关
CHECK_MOUNT_CONDITION1	= _t"已经在骑乘状态"
CHECK_MOUNT_CONDITION2 	= _t"没有装备坐骑"
CHECK_MOUNT_CONDITION3 	= _t"当前状态不能骑乘"
CHECK_MOUNT_CONDITION4 	= _t"战斗状态禁止骑乘"
CHECK_MOUNT_CONDITION5 	= _t"当前区域禁止骑乘"
CHECK_MOUNT_CONDITION6 	= _t"当前等级不能使用已装备的坐骑"
CHECK_MOUNT_CONDITION7 	= _t"当前装备的坐骑在此区域无效"

----------------------
--修炼
PLAYER_REST_START = _t"沐浴荣光开始"
PLAYER_REST_END = _t"沐浴荣光中止"
PLAYER_STOP_REST_CONFIRM = _t"当前处于“沐浴荣光”中，继续将打断当前进度，是否继续？"

PLAYER_REST_ERROR_UNKNOWN = _t"修炼时发生未知错误"
PLAYER_REST_ERROR_NOT_IN_HOMETOWN = _t"您必须在出生地才能修炼"
PLAYER_REST_ERROR_NEED_REPUTATION = _t"您今天修炼的时间已到达上限"
PLAYER_REST_ERROR_STORED_EXP_FULL = _t"您的储存经验已经达到当前等级的上限：%I64d，无法继续修炼"
PLAYER_REST_ERROR_TIME_EXCEEDED = _t"您今天已经沐浴荣光8小时了，明天再继续吧"
PLAYER_REST_ERROR_IN_RESTING = _t"您已经在修炼状态中了"
PLAYER_REST_ERROR_CANNOT_SITDOWN = _t"当前状态无法开始修炼"

PLAYER_PRAY_STAR = _t"祈祷开始"
PLAYER_PRAY_END = _t"祈祷中止"



----------------------
--守护星
GUARDIAN_STAR_MAX_LEVEL_EXCEEDED = _t"守护星已达到最大等级"
GUARDIAN_STONE_ABSORB_LIMIT = _t"每个守护石最多可吸收守护值：%d"
GUARDIAN_STONE_NOT_SET = _t"未放置守护石"
GUARDIAN_STONE_LEVEL_UNFIT = _t"以当前守护星等级无法吸收该守护石"
GUARDIAN_STONE_ABSOR_ERROR = _t"吸收守护石时发生错误"






----------------------
--GM
GM_REPORT_PLAYER			= _t"玩家 %s 在使用外挂。"
GM_REPORT_COOL				= _t"与前一次投诉时间间隔不能小于5分钟，请您稍候再试。"
GM_REPORT_ADDON_IN			= _t"举报外挂"
GM_HELP_MSG_802				= _t"普通求助"
GM_HELP_MSG_803				= _t"我被卡住了"
GM_HELP_MSG_804				= _t"举报外挂"
GM_REPORT_TYP_0				= _t"举报欺诈信息广告"
GM_REPORT_TYP_1				= _t"举报虚假金币广告"
GM_REPORT_TYP_2				= _t"举报代练广告"
GM_REPORT_TYP_TIPS_0		= _t"玩家 %s 正在发布欺诈信息广告"
GM_REPORT_TYP_TIPS_1		= _t"玩家 %s 正在发布虚假金币广告"
GM_REPORT_TYP_TIPS_2		= _t"玩家 %s 正在发布代练广告"
REPORT_CHEAT_THANKS         = _t"已举报成功，请耐心等待我们的处理。感谢您对圣斗士星矢游戏环境净化所做出的努力"

----------------------
--console
CONSOLE_SERVER_TIME		 	= _t"当前服务器时间是："



----------------------
--师徒
COACH_DISABLE_LEV_HINT1		= _t"高于30级才能成为人师。"
COACH_DISABLE_LEV_HINT2		= _t"低于你的等级10级以上方能成为你的学生。"
COACH_INVITE_MSG			= _t"招募学生的请求已经提交，请等待回应。"



----------------------
--雅典娜祝福
ATHENA_COUNT1				= _t"你获得了雅典娜的祝福！点击按钮领取。\r剩余时间:%d秒"
ATHENA_COUNT2				= _t"你获得了雅典娜的祝福！点击按钮领取。\r剩余时间:%d分%d秒"


----------------------
--其它
SCREENSHOT		=	_t"游戏截图已保存到Screenshots目录"
STUCKED_TELEPORT_CONFIM = _t"您在接下来的10秒内无法攻击和移动，之后传送到最近的复活点(2分钟内无法再次使用)"
STUCKED_TELEPORT_IN_BATTLE = _t"当前的战场不允许使用角色卡死功能，如果您真的遇到卡死，请您点击提交BUG"
NEW_MAP_AREA_EXPLORED = _t"发现新区域：%s"


----------------------
--成就
ACHIEVEMENT_NONE	=	_t"没有成就数据"
ACHIEVEMENT_FINISHED	=	_t"完成"
ACHIEVEMENT_UNFINISHED	=	_t"未完成"
ACHIEVEMENT_PHASE		=	_t"第%s阶段"
ACHIEVEMENT_PHASE1		=	_t"一"
ACHIEVEMENT_PHASE2		=	_t"二"
ACHIEVEMENT_PHASE3		=	_t"三"
ACHIEVEMENT_PHASE4		=	_t"四"
ACHIEVEMENT_PHASE5		=	_t"五"
ACHIEVEMENT_PHASE6		=	_t"六"
ACHIEVEMENT_PHASE7		=	_t"七"
ACHIEVEMENT_PHASE8		=	_t"八"
ACHIEVEMENT_PHASE9		=	_t"九"
ACHIEVEMENT_PHASE10		=	_t"十"
ACHIEVEMENT_ALL			=	_t"成就总览"
ACHIEVEMENT_ALL1		=	_t"总成就"



----------------------
--动作
FACEDESC_WAVEHAND					= _t"大笑"
FACEDESC_NOD						= _t"愤怒"
FACEDESC_SHADEHEAD					= _t"亲亲"
FACEDESC_SHRUG						= _t"吓到"
FACEDESC_LAUGH						= _t"休息"
FACEDESC_ANGRY						= _t"高兴"
FACEDESC_FAINT						= _t"调皮"
FACEDESC_SAD						= _t"飞吻"
FACEDESC_KISSHAND					= _t"再见"
FACEDESC_SHY						= _t"可爱"
FACEDESC_SALUTE						= _t"敬礼"
FACEDESC_SITDOWN					= _t"请求"
FACEDESC_CHARGE						= _t"冲锋"
FACEDESC_THINK						= _t"思考"
FACEDESC_CHALLENGE					= _t"哭泣"
FACEDESC_WIN						= _t"鄙视"
FACEDESC_GAPE						= _t"伸懒腰"
FACEDESC_KISS						= _t"亲吻"
FACEDESC_FIGHT						= _t"害羞"
FACEDESC_ATTACK1					= _t"攻击1"
FACEDESC_ATTACK2					= _t"攻击2"
FACEDESC_ATTACK3					= _t"攻击3"
FACEDESC_ATTACK4					= _t"攻击4"
FACEDESC_DEFENCE					= _t"防御"
FACEDESC_FALL						= _t"摔倒"
FACEDESC_FALLONGROUND				= _t"倒地"
FACEDESC_LOOKAROUND					= _t"张望"
FACEDESC_DANCE						= _t"舞蹈"


----------------------
--怪物词缀
MONSTER_AFFIX_0     = _t"再生" --治疗区域
MONSTER_AFFIX_1     = _t"防护" --防御罩子
MONSTER_AFFIX_2     = _t"爆破" --大范围伤害球
MONSTER_AFFIX_3     = _t"陨石"  --天降神火
MONSTER_AFFIX_4     = _t"石化"  --飞沙走石
MONSTER_AFFIX_5     = _t"辐射"  --瀑布倒流
MONSTER_AFFIX_6     = _t"图腾"  --阴风阵阵
MONSTER_AFFIX_7     = _t"灼烧"
MONSTER_AFFIX_8     = _t"强石化"
MONSTER_AFFIX_9     = _t"强冰冻"
MONSTER_AFFIX_10    = _t"强麻痹"
MONSTER_AFFIX_11    = _t"强灼烧"
MONSTER_AFFIX_12    = _t"恢复"
MONSTER_AFFIX_13    = _t"狂暴"
MONSTER_AFFIX_14    = _t"佣兵"
MONSTER_AFFIX_15    = _t"自爆"
MONSTER_AFFIX_16    = _t"分裂"


----------------------
--提示
WHOLE_MAP_NPC_TOO_MORE	= _t"全地图可见NPC数量大于30, 请适当删除全地图可见NPC"
NPC_TOO_MORE 			= _t"NPC数量大于100, 请适当删除NPC"
BIND_MONEY_LESS_ASK_GOLD_CONFIRM	=	_t"金券不足，以金币补足？"

----------------------
-- 服务器进程与大圣战纪
AGE_NO_COUNT_DOWN	=	_t"无限制"
AGE_COUNT_DOWN_UP	=	_t"已达到"

----------------------
--认证雅典娜
ATHENA_COME_NOTICE = _t"^FF0000女神雅典娜——%s莅临本服，守卫她的圣斗士们，燃烧你们的小宇宙热血沸腾吧！"

AUTHENTICATE_ATHENA_RET_SUCCESS = _t"恭喜您，认证雅典娜成功!您现在可以在女神见证者处创建自己的守卫十二宫了！"
AUTHENTICATE_ATHENA_RET_FAIL = _t"认证雅典娜失败!"

CREATE_12PALACE_RET_SUCCESS = _t"恭喜您，创建12宫成功!您可以打开：社交按钮下的“十二宫”按钮，进行查看"
CREATE_12PALACE_RET_FAIL = _t"创建12宫失败!"

ATHENA_APPOINT_GUARD_0 = _t"任命%s成功!"
ATHENA_APPOINT_GUARD_1 = _t"任命%s错误!"
ATHENA_APPOINT_GUARD_2 = _t"任命%s失败，未找到该玩家"
ATHENA_APPOINT_GUARD_3 = _t"任命%s失败，您不是认证雅典娜!"
ATHENA_APPOINT_GUARD_4 = _t"任命失败，%s已成为认证雅典娜或者是已是其他雅典娜的守护卫士!"
ATHENA_APPOINT_GUARD_5 = _t"任命失败，%s已是守护卫士!"
ATHENA_APPOINT_GUARD_6 = _t"任命失败，%s拒绝成为您的守护卫士!"
ATHENA_APPOINT_GUARD_7 = _t"任命%s失败，应答超时!"
ATHENA_APPOINT_GUARD_8 = _t"任命%s失败，该玩家不在线!"

ATHENA_APPOINT_FRIEND_OFF_LINE = _t"对方现在不在线!"

ATHENA_DEPOSE_RET_SUCCESS = _t"免职成功!"
ATHENA_DEPOSE_RET_FAIL = _t"免职失败!"

ATHENA_QUIT_RET_SUCCESS = _t"辞职成功!"
ATHENA_QUIT_RET_FAIL = _t"辞职失败!"

ATHENA_QUIT_NOTIFICE = _t"%s辞去了黄金%s守卫的职务!"

ATHENA_DISMISSED_BY_ATHENA = _t"你被女神雅典娜%s免除守卫者职务!"

ATHENA_MODIFY_DECLARATION_RET_SUCCESS = _t"修改宣言成功!"
ATHENA_MODIFY_DECLARATION_RET_FAIL = _t"修改宣言失败!"

ATHENA_INVITE_GUARD_NOTICE = _t"女神雅典娜%s邀请您成为自己的黄金%s守卫!"

ATHENA_APPOINT_GUARD_NOTICE = _t"^FF0000女神雅典娜%s将%s晋升为自己的黄金%s守卫！"

ATHENA_DEFAULT_DECLARATION = _t"为了爱与和平，跨越银河的火箭队，为了爱与和平，跨越银河的火箭队，为了爱与和平，跨越银河的火箭队！"

PANEL_SURE_ATHENA_TITLE = _t"雅典娜%s宣言:"
PANEL_SURE_ATHENA_DECLARATION_MODIFY_HINT = _t"双击修改雅典娜宣言，回车确认"

AUTHENTICATE_ATHENA_CHECK_ERR_1 = _t"男性玩家不能认证成为雅典娜！"
AUTHENTICATE_ATHENA_CHECK_ERR_2 = _t"你已是雅典娜！"
AUTHENTICATE_ATHENA_CHECK_ERR_3 = _t"你已被任命为雅典娜12宫守护者！要创建雅典娜请先脱离当前雅典娜12宫"
AUTHENTICATE_ATHENA_CHECK_ERR_4 = _t"缺少认证道具！"

ATHENA_MEMBER_LACK_NAME = _t"(空缺)"
ATHENA_MEMBER_LACK_VAL = "--"

----------------
--星域
STAR_SKY_BUTTON_TO_CHAIN = _t"星座连接"
STAR_SKY_BUTTON_TO_AREA = _t"观星"
STAR_SKY_EXPLORE_AREA_NEED_ITEM = _t"物品: %s x %d个"
STAR_SKY_SPUTTERING_NUM = _t"今天获得他人微粒溅射次数：%d/%d"
STAR_SKY_COMBINE_COST_BINDED_MONEY = _t"金券: %d"
STAR_SKY_COMBINE_COST_MONEY = _t"金币: %d"
STAR_SKY_CHAIN_LEVEL_DESC = _t"观星等级 Lv.%d"
STAR_SKY_EXPLORE_AREA_MONEY_LESS = _t"观星所需金钱不足"
STAR_SKY_EXPLORE_AREA_BIND_MONEY_LESS = _t"观星所需金券不足"
STAR_SKY_EXPLORE_AREA_ITEM_LESS = _t"观星所需物品%s不足"
STAR_SKY_EXPLORE_CHAIN_NODE_LESS = _t"链接所需的%s不足"
STAR_SKY_EXPLORE_CHAIN_EXPLORE_NEED = _t"需要:%s x %d个"
STAR_SKY_EXPLORE_CHAIN_EXPLORED_HINT = _t"已点亮"
STAR_SKY_EXPLORE_CHAIN_NEXT_HINT = _t"请点亮\r%s"
STAR_SKY_EXPLORE_CHAIN_UNEXPLORED_HINT = _t"未点亮\r%s"
STAR_SKY_EXPLORE_AREA_MSG_SUCCESS = _t"恭喜您,本次观星完成"
STAR_SKY_EXPLORE_AREA_MSG_ALL_EXPLORED = _t"观星次数重计，回到首轮观星!!!"
STAR_SKY_EXPLORE_AREA_MSG_CRIT_HIT = _t"爆击(惊喜!)"
STAR_SKY_MSG_GET_ATOM = _t"获得%s x %d个"
STAR_SKY_MSG_COST_ATOM = _t"消耗了%s x %d个"
STAR_SKY_COMBINE_BUTTON_START = _t"微粒进化"
STAR_SKY_COMBINE_BUTTON_STOP = _t"停止"
STAR_SKY_COMBINE_MSG_SUCCESS = _t"恭喜您，进化成功"
STAR_SKY_COMBINE_MSG_FAIL = _t"很遗憾，进化失败"
STAR_SKY_EXPLORE_CHAIN_MSG_SUCCESS = _t"恭喜您,星链点亮成功"
STAR_SKY_EXPLORE_CHAIN_MSG_COST_ATOM = _t"消耗了%s x %d个"
STAR_SKY_SPUTTERING_MSG_SUCCESS = _t"恭喜您，受到来自%s的溅射"
STAR_SKY_COMBINE_ATOM_LESS = _t"%s不足,无法完成进化"
STAR_SKY_COMBINE_BINDED_MONEY_LESS = _t"^FF0000金券不足，无法完成进化"
STAR_SKY_COMBINE_MONEY_LESS = _t"^FF0000金币不足，无法完成进化"
STAR_SKY_COMBINE_ITEM_LESS = _t"^FF0000%s不足，无法完成进化"
STAR_SKY_COMBINE_USE_PROP_ITEM_HINT = _t"使用%s后能大幅提高合成成功率，是否使用?"
STAR_SKY_INCUBATION_TIME_HOUR = _t"%d小时"
STAR_SKY_INCUBATION_TIME_MIN = _t"%d分"
STAR_SKY_INCUBATION_TIME_SEC = _t"%d秒"
STAR_SKY_INCUBATION_LEFT_TIME = _t"%02d:%02d:%02d"
STAR_SKY_INCUBATION_START = _t"祭礼"
STAR_SKY_INCUBATION_END = _t"获取"
STAR_SKY_INCUBATION_MONEY_LESS = _t"星之祭礼金钱不足"
STAR_SKY_INCUBATION_BINDED_MONEY_LESS = _t"星之祭礼金券不足"
STAR_SKY_INCUBATION_LESS = _t"%s不足，无法进行祭礼"
STAR_SKY_CHAIN_SPUTTERING_HINT = _t"此星座图完成会触发微粒溅射\r微粒溅射瞬间可以使周围的队友获得微粒\r队友此时有可能获得4级以上微粒"
STAR_SKY_CHAIN_INCUBATION_HINT = _t"此星座图完成会获得星之祭礼\r获得后每天可在星之祭礼界面进行\r神将响应你的诚意，每天你都会有所收获"
STAR_SKY_INCUBATION_ACTIVE_HINT = _t"激活此祭礼需要达到观星等级%d\r完成星座图的连接可提高观星等级"
STAR_SKY_CHAIN_SPUTTERING_NOTIFY_1 = _t"还剩最后一颗星未点亮！此星链完成会对周围的队友产生溅射!"
STAR_SKY_CHAIN_SPUTTERING_NOTIFY_2 = _t"建议在点亮最后一颗星前召集队友到周围!"
STAR_SKY_CHAIN_LAST_EXPLORE_MSG = _t"此星座图完成时会触发微粒溅射，微粒溅射的瞬间15米范围内的队友有可能获得高级能量微粒，是否继续完成?"
STAR_SKY_CHAIN_LAST_EXPLORE_OK = _t"继续完成"
STAR_SKY_CHAIN_LAST_EXPLORE_CANCEL = _t"寻找队友"
STAR_SKY_EXPLORE_AREA_HINT_LEVEL_1 = _t"观星第二轮，观星将有更大的收获"
STAR_SKY_EXPLORE_AREA_HINT_LEVEL_2 = _t"观星第三轮，观星将有更大的收获"
STAR_SKY_COMBINE_ATOM_PROP_HINT = _t"当前进化成功率：%.01f%%"
STAR_SKY_QUICK_EXPLORE_BUTTON_START = _t"一键观星"
STAR_SKY_QUICK_EXPLORE_BUTTON_STOP = _t"停止观星"
STAR_SKY_AUTO_COMBINE_LESS_ATOM = _t"^FF0000微粒不足"
STAR_SKY_AUTO_COMBINE_COST_BINDED_MONEY = _t"消耗金券: %d"
STAR_SKY_COMBINE_MSG_SUCCESS = _t"恭喜您，进化成功"
STAR_SKY_CHAIN_LEV_ADD_TXT = _t"观星达到Lv%d级时的属性"
STAR_SKY_CHAIN_LEVEL_HINT_0 = _t"观星等级达到24级时，身上将会显示炫酷光效"
STAR_SKY_CHAIN_LEVEL_HINT_1 = _t"观星等级达到48级时，身上将会显示更炫酷光效"
STAR_SKY_CHAIN_LEVEL_HINT_2 = _t"观星等级达到64级时，身上将会显示超炫酷光效"
--------------------
--神器
ARTIFACT_NAME	=	_t"神器"
ARTIFACT_NAME_ACTIVE	=	_t"激活神器"
ARTIFACT_NAME_STORE	=	_t"神器仓库"
ARTIFACT_NO_COMBO = _t"未激活组合属性"
ARTIFACT_OP_FAIL_0 = _t"装备神器失败"
ARTIFACT_OP_FAIL_1 = _t"卸载神器失败"
ARTIFACT_OP_FAIL_2 = _t"替换神器失败"
ARTIFACT_EXCHANGE_EFFECT_FAIL = _t"在装备栏交换神器位置失败"
ARTIFACT_NORMAL_SLOT_FULL = _t"神器包裹栏已满"
ARTIFACT_STATE_NAME_0 = _t"境界：青铜之境"
ARTIFACT_STATE_NAME_1 = _t"境界：白银之境"
ARTIFACT_STATE_NAME_2 = _t"境界：黄金之境"
ARTIFACT_STATE_NAME_3 = _t"境界：神圣之境"
ARTIFACT_STATE_NAME_4 = _t"境界：完美之境"
ARTIFACT_ENHANCE_AURA_LESS = _t"灵气不足，无法灌注"
ARTIFACT_ENHANCE_SUCCESS = _t"神器升级成功"
ARTIFACT_ENHANCE_FAIL = _t"灵气灌注成功"
ARTIFACT_EXTRA_AURA_ZERO = _t"神器已为初始状态，无法还原"
ARTIFACT_EXTRA_AURA_SUCCESS = _t"神器还原成功"
ARTIFACT_EXTRA_AURA_FAIL = _t"神器还原失败"
ARTIFACT_TO_ITEM_FAIL_PACK_FULL = _t"包裹已满，请留出空位后再将神器取出"
ARTIFACT_TO_ITEM_FAIL_BY_STATE = _t"清空所有境界等级才可以取出\r可以将境界等级清空或者转移到别的神器上"
ARTIFACT_TO_ITEM_SUCCESS = _t"神器成功取出"
ARTIFACT_TO_ITEM_FAIL = _t"神器取出失败"
ARTIFACT_FIGHT_POWER = _t"战力：%d"
ARTIFACT_STATE_OPEN_REQUIER = _t"神力值达到%d点开启\r等级：%d\r"
ARTIFACT_STATE_PROP_CUR_LEV = _t"当前等级:%d/%d\r"
ARTIFACT_STATE_PROP_NEXT_LEV = _t"下一等级:%d\r"
ARTIFACT_STATE_ENHANCE_CHECK_ITEM = _t"勾选后消耗，提升灌注效率为%0.2f倍"
ARTIFACT_STATE_CLEAR_HINT = _t"清空所有境界等级，神器将变为初始状态\r建议将等级转移到别的神器上,是否继续？"
ARTIFACT_STATE_ENHANCE_USE_ITEM_HINT = _t"^N未勾选%s^N，勾选后极大提高灌注效率，是否勾选？"
ARTIFACT_POWER_TXT_FORMAT = _t"神力值: %d"
ARTIFACT_HINT_UNIQUE = _t"唯一属性"
ARTIFACT_HINT_STATE = _t"境界属性"
ARTIFACT_HINT_STATE_1 = _t"青铜之境: %d/%d级"
ARTIFACT_HINT_STATE_2 = _t"白银之境: %d/%d级"
ARTIFACT_HINT_STATE_3 = _t"黄金之境: %d/%d级"
ARTIFACT_HINT_STATE_4 = _t"神圣之境: %d/%d级"
ARTIFACT_HINT_STATE_5 = _t"完美之境: %d/%d级"
ARTIFACT_HINT_UNACTIVE = _t"(神力值达到%d后激活)"
ARTIFACT_HINT_SKILL = _t"神器技能"
ARTIFACT_STATE_ENHANCE_MAX_LEV = _t"所有境界等级上限: %d"
ARTIFACT_USE_HINT = _t"使用后进入神器仓库，是否使用？"
ARTIFACT_TRANS_LABEL_SRC = _t"待转移神器"
ARTIFACT_TRANS_LABEL_DST = _t"目标神器"
ARTIFACT_TRANS_ERR_1 = _t"请设置待转移神器!"
ARTIFACT_TRANS_ERR_2 = _t"需要待转移神器境界为非初始等级，请重新设置!"
ARTIFACT_TRANS_ERR_3 = _t"请设置目标神器!"
ARTIFACT_TRANS_ERR_4 = _t"目标神器与待转移神器为同一神器"
ARTIFACT_TRANS_ERR_5 = _t"目标神器已强化，请重新设置!"
ARTIFACT_TRANS_ERR_6 = _t"目标神器的境界等级上限低于待转移神器，请重新设置"
ARTIFACT_TRANS_SUCCESS = _t"神器强化转移成功"
ARTIFACT_TRANS_FAIL = _t"神器强化转移失败"
ARTIFACT_HOST_AURA	=	_t"人物灵气值"
-------------------
--物品锁
ITEM_LOCK_SET_PW_BUTTON_TXT = _t"设置密码"
ITEM_LOCK_MODIFY_PW_BUTTON_TXT = _t"修改密码"
ITEM_LOCK_TIME_0 = _t"%d秒"
ITEM_LOCK_TIME_1 = _t"%d分钟"
ITEM_LOCK_TIME_2 = _t"%d小时"
ITEM_LOCK_TIME_3 = _t"%d天"
ITEM_LOCK_TIME_READY = _t"可以解锁"
ITEM_LOCK_LEFT_TIME = _t"解锁剩余时间:%s"
ITEM_LOCK_NOTIFY_1 = _t"物品锁成功解锁"
ITEM_LOCK_NOTIFY_2 = _t"物品锁设置密码成功"
ITEM_LOCK_NOTIFY_3 = _t"设置/修改密码失败，请检查输入是否正确"
ITEM_LOCK_NOTIFY_4 = _t"物品锁定成功"
ITEM_LOCK_NOTIFY_5 = _t"物品锁解锁倒计时开始，将在7天后解锁"
ITEM_LOCK_NOTIFY_6 = _t"物品锁强制解锁倒计时开始，将在15天后解锁"
ITEM_LOCK_NOTIFY_7 = _t"密码错误，解锁失败"
ITEM_LOCK_NOTIFY_8 = _t"取消解锁，恢复锁定状态"
ITEM_LOCK_ALREADY_LOCKED = _t"物品已经锁定，需要解锁请打开安全锁界面操作"
ITEM_LOCK_NO_SET = _t"密码锁未开启，请先设置密码"
ITEM_LOCK_ISUNLOCKING = _t"目前处于解锁等待期，需要保护物品请先取消解锁"
ITEM_LOCK_CONFIRM_MSG = _t"锁定后解锁物品需要等待7天，是否锁定%s？"
ITEM_LOCK_UNLOCK_LESS_HINT = _t"%s只能解锁完成%d个，\r请先拆分至正确数量后再点击解锁完成"
ITEM_LOCK_UNLOCK_INUNLOCKING_HINT = _t"%s正在解锁倒计时中"
ITEM_LOCK_UNUNLOCK_START_TITLE = _t"输入解锁数量"
ITEM_LOCK_UNUNLOCK_START_HINT = _t"你最多可以解锁%s%d个"
ITEM_LOCK_NOTIFY_4 = _t"已经成功锁定"
ITEM_LOCK_NOTIFY_9 = _t"解锁倒计时成功开启，7天后即可完全解锁"
ITEM_LOCK_NOTIFY_12 = _t"已经成功解锁"
---------------------------
--小宇宙等级/圣斗士意志
PANEL_COSMOS_RANK_LEV = _t"小宇宙等级:%d"
PANEL_COSMOS_RANK_NEXT_NEED = _t"下一等级需要\r人物等级   %s^FFFFFF\r觉悟值      %s"
PANEL_COSMOS_RANK_CUR_LEV = _t"当前等级:%d\r"
PANEL_COSMOS_RANK_NEXT_LEV = _t"下一等级:%d\r"
COSMOS_RANK_LEV_UP_SUC = _t"小宇宙等级升级成功"
COSMOS_RANK_LEV_UP_FAIL = _t"小宇宙等级升级失败"
COSMOS_RANK_EMBED_SUC = _t"小宇宙等级星魂镶嵌成功"
COSMOS_RANK_EMBED_FAIL = _t"小宇宙等级星魂镶嵌失败"
COSMOS_RANK_UNEMBED_SUC = _t"小宇宙等级星魂析出成功"
COSMOS_RANK_UNEMBED_FAIL = _t"小宇宙等级星魂析出失败"
