--[[ @i18n pet ]]
local _t = require("i18n").context("pet")

local Format = string.format
module("STRING_TABLE")


----------------------
--宠物
PET_CATEGORY_0 = _t"近程"
PET_CATEGORY_1 = _t"远程"

PET_SUMMON = _t"出战"
PET_UNSUMMON = _t"休息"
PET_PACK_SIZE = _t"宠物栏：%d/%d"
PET_CLASS_GRADE = _t"%d阶"
PET_NOT_EVOLUATED = _t"未进化"
PET_EVOLUTION = _t"%d次进化"
PET_EVOLUTION_AVAILABLE = _t"宠物目前可以进化"
PET_RENAME = _t"更名"
PET_RENAME_CONFIRM = _t"确定"
PET_GROWTH_LEVEL = "Lv%d"

PET_ATTACK_APTITUDE = _t"攻击资质"
PET_DEFENCE_APTITUDE = _t"防御资质"
PET_HP_APTITUDE = _t"生命资质"
PET_ATTACK_GROWTH = _t"攻击成长率"
PET_DEFENCE_GROWTH = _t"防御成长率"
PET_HP_GROWTH = _t"生命成长率"
PET_ATTACK_GROWTH_POINT = _t"攻击成长度"
PET_DEFENCE_GROWTH_POINT = _t"防御成长度"
PET_HP_GROWTH_POINT = _t"生命成长度"

PET_FORGET_SKILL_CONFIRM = _t"这样做，将使你的宠物 %s 遗忘 %d级技能 %s，是否确认？"

PET_SERVICE_ERROR_UNKNOW = _t"使用宠物服务时发生错误"
PET_SERVICE_ERROR_LEVEL = _t"宠物等级不符合条件"
PET_SERVICE_ERROR_MONEY = _t"没有足够的金币或金券"
PET_SERVICE_ERROR_SUMMON_LEVEL_TOO_HIGH = _t"宠物的携带等级过高"
PET_SERVICE_ERROR_SUMMON_LEVEL_TOO_LOW = _t"宠物的携带等级过低"
PET_SERVICE_ERROR_GROWTH_FULL = _t"宠物的成长率已达到满级，无法继续提升"

PET_SKILL_LEARN_BUTTON_TEXT_LEARN = _t"学习"
PET_SKILL_LEARN_BUTTON_TEXT_LEVEL_UP = _t"提升"

PET_SKILL_LEARN_REQUIRE_PET_SUMMON_LEVEL = _t"学习技能需要宠物的携带等级至少为%d"
PET_SKILL_LEARN_REQUIRE_PET_LEVEL = _t"学习技能需要宠物等级达到%d"
PET_SKILL_LEARN_REQUIRE_PET_CATEGORY = _t"学习技能需要宠物类型为%s"

PET_SKILL_LEARN_SUCCESS = _t"宠物学会了新技能！"
PET_SKILL_LEARN_FAILED = _t"宠物没有学会该技能，再多学几次试试吧"

PET_SKILL_LEARN_ERROR_SKILL_FULL = _t"宠物已经学习了足够多的技能了，再学会记不住的啊>_<"
PET_SKILL_LEARN_ERROR_SKILL_EXIST = _t"宠物已经学过这个技能了，不用再学一遍了吧"
PET_SKILL_LEARN_ERROR_INITIATIVE_SKILL_FULL = _t"宠物的主动技能数量已经到达上限"
PET_SKILL_LEARN_ERROR_PASSIVE_SKILL_FULL = _t"宠物的被动技能数量已经到达上限"
PET_SKILL_LEARN_ERROR_PET_CATEGORY = _t"宠物类型不符，不能学习这个技能"

PET_SKILL_LEVEL_UP_REQUIRE_PET_SUMMON_LEVEL = _t"升级技能需要宠物的携带等级不小于%d"
PET_SKILL_LEVEL_UP_REQUIRE_PET_LEVEL = _t"升级技能需要宠物等级达到%d"

PET_SKILL_LEVEL_UP_SUCCESS = _t"宠物的技能等级提升了！"
PET_SKILL_LEVEL_UP_FAILED = _t"宠物的技能等级没有变化，再多学几次试试吧"

PET_SKILL_LEVEL_UP_ERROR_LEVEL_MAX = _t"宠物技能等级已经达到最高了"
PET_SKILL_LEVEL_UP_ERROR_SKILL_NOT_EXIST = _t"宠物尚未学会相应的技能，不能进行技能升级"
PET_SKILL_LEVEL_UP_ERROR_NOT_MATCH = _t"宠物升级石和所选择的宠物技能不匹配"
PET_SKILL_LEVEL_UP_ERROR_LEVEL = _t"宠物技能等级不符合升级石的前提等级需求"

PET_EVOLUTION_MESSAGE_PUT_PET_FIRST = _t"请先将需要进化的宠物放置在进化界面中"
PET_EVOLUTION_REQUIRE_PET_LEVEL = _t"进化需要宠物等级：%d级"
PET_EVOLUTION_REQUIRE_ITEM = _t"进化需要物品：%s"
PET_EVOLUTION_RESULT_TITLE = _t"%s 第%d阶进化成功"

PET_EVOLUTION_FAILED = _t"宠物进化失败"

PET_EVOLUTION_ERROR_MAX = _t"宠物已经进化至最高阶形态了"
PET_EVOLUTION_ERROR_ITEM_NOT_MATCH = _t"使用的进化材料不正确"

PET_APTITUDE_ENHANCE_SUCCESS = _t"提升宠物%s成功！"
PET_APTITUDE_ENHANCE_FAILED = _t"提升宠物%s失败"

PET_APTITUDE_ENHANCE_ERROR_MAX = _t"宠物的%s已经达到上限，无法继续强化"

PET_GROWTH_UPGRADE_PET_SUMMON_LEVEL_LIMIT = _t"宠物携带等级最高为%d"
PET_GROWTH_UPGRADE_STONE_ADD_POINT = _t"提高宠物%s%d点"

PET_GROWTH_COMBINE_SUCCESS = _t"宠物合魂成功！"
PET_GROWTH_COMBINE_ERROR_GRADE_CLASS_MISMATCH = _t"^ff0000两只宠物的阶级不相等，无法进行合魂"
PET_GROWTH_COMBINE_ERROR_SECONDARY_PET_USELESS = _t"^ff0000副宠物初始成长率相对于主宠物较低，无法进行合魂"

PET_GROWTH_TRANSFER_GROWTH_FORMAT = "%.0f^00ff00+%.0f^N"
PET_GROWTH_TRANSFER_SUCCESS = _t"宠物移魂成功！"
PET_GROWTH_TRANSFER_ERROR_GRADE_CLASS = _t"^ff0000两只宠物的阶级差距最大只能为1"
PET_GROWTH_TRANSFER_ERROR_SECONDARY_PET_USELESS = _t"^ff0000副宠物对于主宠物的成长没有任何帮助"





----------------------
--休闲宠（小伙伴）
STF_MINIPET_BLOOD_00	= _t"暹罗"
STF_MINIPET_BLOOD_01	= _t"波斯猫"
STF_MINIPET_BLOOD_02	= _t"美国短毛猫"
STF_MINIPET_BLOOD_03	= _t"苏格兰折耳猫"
STF_MINIPET_BLOOD_04	= _t"孟加拉豹猫"
STF_MINIPET_BLOOD_05	= _t"家猫"

STF_MINIPET_BLOOD_10	= _t"沙皮"
STF_MINIPET_BLOOD_11	= _t"贵妇"
STF_MINIPET_BLOOD_12	= _t"金毛猎犬"
STF_MINIPET_BLOOD_13	= _t"德国牧羊犬"
STF_MINIPET_BLOOD_14	= _t"藏獒"
STF_MINIPET_BLOOD_15	= _t"家狗"

STF_MINIPET_BLOOD_20	= _t"虎皮鹦鹉"
STF_MINIPET_BLOOD_21	= _t"玄凤鸡尾鹦鹉"
STF_MINIPET_BLOOD_22	= _t"蓝冠吸蜜鹦鹉"
STF_MINIPET_BLOOD_23	= _t"非洲灰鹦鹉"
STF_MINIPET_BLOOD_24	= _t"金刚鹦鹉"
STF_MINIPET_BLOOD_25	= ""

STF_MINIPET_BLOOD_30	= _t"老鹰"
STF_MINIPET_BLOOD_31	= ""
STF_MINIPET_BLOOD_32	= ""
STF_MINIPET_BLOOD_33	= ""
STF_MINIPET_BLOOD_34	= _t"白头海鹰"
STF_MINIPET_BLOOD_35	= ""

STF_MINIPET_BLOOD_40	= ""
STF_MINIPET_BLOOD_41	= ""
STF_MINIPET_BLOOD_42	= ""
STF_MINIPET_BLOOD_43	= ""
STF_MINIPET_BLOOD_44	= _t"其它"
STF_MINIPET_BLOOD_45	= ""

STF_MINIPET_RACE_0		= _t"猫"
STF_MINIPET_RACE_1		= _t"狗"
STF_MINIPET_RACE_2		= _t"鹦鹉"
STF_MINIPET_RACE_3		= _t"鹰"
STF_MINIPET_RACE_4		= _t"其它"

STF_MINIPET_KIDNEY_0	= _t"英勇"
STF_MINIPET_KIDNEY_1	= _t"安静"
STF_MINIPET_KIDNEY_2	= _t"聪慧"
STF_MINIPET_KIDNEY_3	= _t"热情"

STF_MINIPET_TALK_0		=	_t"主人"
STF_MINIPET_TALK_1		=	_t"主人~主人~"
STF_MINIPET_TALK_10		= _t"我想要[%s]..."
STF_MINIPET_TALK_11		= _t"我想%s的<%s>了..."
STF_MINIPET_TALK_12		= _t"...抱抱~"
STF_MINIPET_TALK_13		= _t"很开心~"

STF_MINIPET_0					= _t"确定将<%s>放生吗？"
STF_MINIPET_1					= _t"漂流瓶回复"
STF_MINIPET_2					= _t"开始宠物化生"
STF_MINIPET_3					= _t"宠物化生结束"
STF_MINIPET_4					= _t"宠物化生失败"
STF_MINIPET_5					= _t"内容不可为空"
STF_MINIPET_6					= _t"嗯......我觉得还是【%s】更好吧！"
STF_MINIPET_7					= _t"成长值少于500无法化生"
STF_MINIPET_8					= _t"成长值少于1500无法化生"
STF_MINIPET_9					= _t"成长值少于3000无法化生"
STF_MINIPET_10				= _t"成长值少于5000无法化生"
STF_MINIPET_11				= _t"成长值少于7500无法化生"
STF_MINIPET_20				= _t"命名不合法"
STF_MINIPET_21				= _t"心情漂流瓶"
STF_MINIPET_22				= _t"内容不能为空！"
STF_MINIPET_23				= _t"金钱不足500，无法回复信息"
STF_MINIPET_24				= _t"<%s的小玩伴>"
STF_MINIPET_25				= _t"操作倒计时：%ds"
STF_MINIPET_26				= _t"操作超时，无法化生"

STF_MINIPET_EVENT_RET_0		= _t"需要宠物在召出状态"
STF_MINIPET_EVENT_RET_1		= _t"缺少物品"
STF_MINIPET_EVENT_RET_2		= _t"距离目标宠物太远"
STF_MINIPET_EVENT_RET_3		= _t"超时"
STF_MINIPET_EVENT_RET_4		= _t"宠物已不存在"
STF_MINIPET_EVENT_RET_5		= _t"没有%s想要的物品！"
STF_MINIPET_EVENT_RET_6		= _t"<%s>被满足了心愿，很开心"
STF_MINIPET_EVENT_RET_7		= _t"水中不能召唤"
STF_MINIPET_EVENT_RET_8		= _t"被思念宠物不在召出状态"
STF_MINIPET_EVENT_RET_9		= _t"被思念宠物的主人不在线"
STF_MINIPET_EVENT_RET_10	= _t"宠物正在探险，不能召出"

STF_MINIPET_EXPLOR_1			= _t"探险"
STF_MINIPET_EXPLOR_2			= _t"探险中"
STF_MINIPET_EXPLOR_3			= _t"一起加入探险吧！%s的<%s>已经出发了！"
STF_MINIPET_EXPLOR_4			= _t"探险队伍正式出发了！"
STF_MINIPET_EXPLOR_5			= _t"您的宠物<%s>探险归来了！"
STF_MINIPET_EXPLOR_6			= _t"该宠物正在探险中"
STF_MINIPET_EXPLOR_7			= _t"该宠物今天已经探险过"
STF_MINIPET_EXPLOR_8			= _t"已探险"
STF_MINIPET_EXPLOR_9			= _t"%d分钟"
STF_MINIPET_EXPLOR_10			= _t"亲密度不足200无法探险！"
STF_MINIPET_EXPLOR_11	= _t"一起探险啦，<%s>跟随%s的<%s>出发了~"

STF_MINIPET_EXPLOR_RET_1	= _t"<%s>出发了！"
STF_MINIPET_EXPLOR_RET_2	= _t"探险出错..."
STF_MINIPET_EXPLOR_RET_3	= _t"宠物已在探险中"
STF_MINIPET_EXPLOR_RET_4	= _t"无在线好友，无法完成"
STF_MINIPET_EXPLOR_RET_5	= _t"今天已经探险过"
STF_MINIPET_EXPLOR_RET_6	= _t"<%s>体力值不够，无法探险"
STF_MINIPET_EXPLOR_RET_7	= _t"<%s>亲密度不够，无法探险"


STF_MINIPET_JOIN_EXPLOR_RET_1	= _t"<%s>成功加入探险队伍！"
STF_MINIPET_JOIN_EXPLOR_RET_2	= _t"加入探险出错..."
STF_MINIPET_JOIN_EXPLOR_RET_3= _t"您已有宠物在探险，同时只能有1只宠物参加"
STF_MINIPET_JOIN_EXPLOR_RET_4	= _t"队长不在线"
STF_MINIPET_JOIN_EXPLOR_RET_5	= _t"该宠物今天已探险过"
STF_MINIPET_JOIN_EXPLOR_RET_6	= _t"<%s>体力值不够，无法探险"
STF_MINIPET_JOIN_EXPLOR_RET_7	= _t"<%s>亲密度不够，无法探险"
STF_MINIPET_JOIN_EXPLOR_RET_8	= _t"加入探险失败，不是好友关系"
STF_MINIPET_JOIN_EXPLOR_RET_9	= _t"找不到队伍"
STF_MINIPET_JOIN_EXPLOR_RET_10	= _t"加入探险失败，队伍已经出发"

STF_MINIPET_PURIN_RET_1	= _t"放入成功！"
STF_MINIPET_PURIN_RET_2	= _t"放入出错"
STF_MINIPET_PURIN_RET_3= _t"该宠物不能化生"
STF_MINIPET_PURIN_RET_4	= _t"化生次数超出上限"
STF_MINIPET_PURIN_RET_5	= _t"种族不同无法化生"
STF_MINIPET_PURIN_RET_6	= _t"血统跨级无法化生"
STF_MINIPET_PURIN_RET_7	= _t"放出状态无法化生"
STF_MINIPET_PURIN_RET_8	= _t"相同性别无法化生"

STF_MINIPET_CONFIRM_RET_1	= _t"确认化生成功！"
STF_MINIPET_CONFIRM_RET_2	= _t"确认化生出错"
STF_MINIPET_CONFIRM_RET_3= _t"对方未放入宠物"

STF_MINIPET_DRAW_RET_1	= _t"领取化生宝宝成功！"
STF_MINIPET_DRAW_RET_2	= _t"没有宠物在化生"
STF_MINIPET_DRAW_RET_3	= _t"时间未到，请稍后"
STF_MINIPET_DRAW_RET_4	= _t"宠物栏位已满，至少需要两个空闲栏位"

STF_MINIPET_TRAIN_RET_1	= _t"宠物训练中..."
STF_MINIPET_TRAIN_RET_2	= _t"宠物体力值不够，无法训练"
STF_MINIPET_TRAIN_RET_3= _t"宠物不在招出状态，无法训练"

STF_MINIPET_SHORTCUT_1 = _t"点击召唤宠物"
STF_MINIPET_SHORTCUT_2 = _t"点击收回宠物"

STF_MINIPET_ERR_1	= _t"没有宠物，无法化生"
STF_MINIPET_ERR_2	= _t"不在队伍中，无法化生"
STF_MINIPET_ERR_3= _t"队伍人数不为二，无法化生"
STF_MINIPET_ERR_4	= _t"队友不在附近，无法化生"
STF_MINIPET_ERR_5	= _t"不是队长，无法化生"
STF_MINIPET_ERR_6	= _t"正在化生中"
STF_MINIPET_ERR_7	= _t"队友正在化生中"
STF_MINIPET_ERR_8	= _t"队友无宠物"

STF_MINIPET_EXPLOR_STORY_1 = _t"1\r小伙伴在上山的路上遇见了一只兔子，小伙伴被萌到了，同小兔子度过了美好的时光。\r小伙伴经过不懈的努力，终于完成了10000米修行。"
STF_MINIPET_EXPLOR_STORY_2 = _t"2\r小伙伴在前行的路上遇见了一只狗熊，经过激烈的搏斗，小伙伴终于打败了它。\r小伙伴高兴的跑来跑去。"
STF_MINIPET_EXPLOR_STORY_3 = _t"3\r小伙伴在山上举办了篝火晚会。\r那一天，是生命中最美好的一天，小伙伴把它记在心里。\r当然，这一切是个秘密，主人永远不会发现。"
STF_MINIPET_EXPLOR_STORY_4 = _t"4\r听说，遥远的森林里有一座神秘城堡，找到的人可以实现自己的愿望。\r小伙伴经过不懈的努力终于找到了那座神秘城堡，并许下心愿，永远和主人在一起。"
STF_MINIPET_EXPLOR_STORY_5 = _t"5\r穿越过明澈的河流，来到了磅礴的瀑布面前。\r小伙伴感受到了瀑布的威严，心生敬畏。"
STF_MINIPET_EXPLOR_STORY_6 = _t"6\r报告！前方发现目标，正在逐步接近……\r似乎有亮闪闪的东西，挖挖看！\r还真是个宝贝呢，偷偷带回去给主人。"
STF_MINIPET_EXPLOR_STORY_7 = _t"7\r前面路口的提示排写到：“前方山林有狼出没，请小心饶行！”\r但小伙伴从容不迫的组队前行，根本没有发现狼，一场虚惊而已。"
STF_MINIPET_EXPLOR_STORY_8 = _t"8\r突然天降大雨，只得来到一个山洞暂时躲避。\r却意外的发现了一个宝壶，与阿拉丁神灯有异曲同工之妙。\r于是，小伙伴许下心愿——要食物，要好多好多的食物。"
STF_MINIPET_EXPLOR_STORY_9 = _t"9\r报告！前方发现目标，正在逐步接近……\r原来是一只兔子，小伙伴被萌到了，同小兔子度过了美好的时光。"
STF_MINIPET_EXPLOR_STORY_10 = _t"10\r报告！前方发现目标，正在逐步接近……\r小伙伴在前行的路上遇见了一只狗熊，经过激烈的搏斗，小伙伴终于打败了它。"

-- 第一组选择预设
STF_MINIPET_SELECT_1_1 = _t"今天适合聚能"
STF_MINIPET_SELECT_1_2 = _t"今天不适合聚能"
STF_MINIPET_SELECT_1_3 = _t"今天适合聚能"
STF_MINIPET_SELECT_1_4 = _t"今天不适合聚能"
STF_MINIPET_SELECT_1_5 = _t"今天适合聚能"
STF_MINIPET_SELECT_1_6 = _t"今天不适合聚能"

-- 第二组选择预设
STF_MINIPET_SELECT_2_1 = _t"今天运气--大吉"
STF_MINIPET_SELECT_2_2 = _t"今天运气--吉"
STF_MINIPET_SELECT_2_3 = _t"今天运气--一般"
STF_MINIPET_SELECT_2_4 = _t"今天运气--凶"
STF_MINIPET_SELECT_2_5 = _t"今天运气--大凶"
STF_MINIPET_SELECT_2_6 = _t"再来一次"

-- 第三组选择预设
STF_MINIPET_SELECT_3_1 = _t"面条"
STF_MINIPET_SELECT_3_2 = _t"包子"
STF_MINIPET_SELECT_3_3 = _t"麻辣烫"
STF_MINIPET_SELECT_3_4 = _t"驴火"
STF_MINIPET_SELECT_3_5 = _t"盖饭"
STF_MINIPET_SELECT_3_6 = _t"甭吃了"

-- 第四组选择预设
STF_MINIPET_SELECT_4_1 = _t"酒吧"
STF_MINIPET_SELECT_4_2 = _t"公园"
STF_MINIPET_SELECT_4_3 = "KTV"
STF_MINIPET_SELECT_4_4 = _t"电影院"
STF_MINIPET_SELECT_4_5 = _t"游泳馆"
STF_MINIPET_SELECT_4_6 = _t"家呆着"

-- 第五组选择预设
STF_MINIPET_SELECT_5_1 = _t"喜欢他"
STF_MINIPET_SELECT_5_2 = _t"不喜欢他"
STF_MINIPET_SELECT_5_3 = _t"喜欢她？"
STF_MINIPET_SELECT_5_4 = _t"不喜欢她！"
STF_MINIPET_SELECT_5_5 = _t"喜欢他她？"
STF_MINIPET_SELECT_5_6 = _t"搅基吧"

-- 第六组选择预设
STF_MINIPET_SELECT_6_1 = _t"幸运色--红色"
STF_MINIPET_SELECT_6_2 = _t"幸运色--黄色"
STF_MINIPET_SELECT_6_3 = _t"幸运色--黑色"
STF_MINIPET_SELECT_6_4 = _t"幸运色--蓝色"
STF_MINIPET_SELECT_6_5 = _t"幸运色--紫色"
STF_MINIPET_SELECT_6_6 = _t"幸运色--绿色"

-- 第七组选择预设
STF_MINIPET_SELECT_7_1 = _t"刚囊Style"
STF_MINIPET_SELECT_7_2 = "Nobody"
STF_MINIPET_SELECT_7_3 = _t"航母Style"
STF_MINIPET_SELECT_7_4 = _t"最炫民族风"
STF_MINIPET_SELECT_7_5 = _t"真心话"
STF_MINIPET_SELECT_7_6 = _t"大冒险"

-- 第八组选择预设
STF_MINIPET_SELECT_8_1 = _t"火影"
STF_MINIPET_SELECT_8_2 = _t"海贼"
STF_MINIPET_SELECT_8_3 = _t"死神"
STF_MINIPET_SELECT_8_4 = _t"妖尾"
STF_MINIPET_SELECT_8_5 = _t"犬夜叉"
STF_MINIPET_SELECT_8_6 = _t"闹呢？必须刀剑神域！"

-- 第九组选择预设
STF_MINIPET_SELECT_9_1 = _t"暗恋"
STF_MINIPET_SELECT_9_2 = _t"表白"
STF_MINIPET_SELECT_9_3 = _t"玫瑰花"
STF_MINIPET_SELECT_9_4 = _t"巧克力"
STF_MINIPET_SELECT_9_5 = _t"烛光晚餐"
STF_MINIPET_SELECT_9_6 = _t"爱情来了你就上啊"

-- 第十组选择预设
STF_MINIPET_SELECT_10_1 = _t"幸运星座--水相"
STF_MINIPET_SELECT_10_2 = _t"幸运星座--火相"
STF_MINIPET_SELECT_10_3 = _t"幸运星座--风相"
STF_MINIPET_SELECT_10_4 = _t"幸运星座--土相"
STF_MINIPET_SELECT_10_5 = _t"幸运星座--全部都是"
STF_MINIPET_SELECT_10_6 = _t"幸运星座--我自己"


STF_MINIPET_TALK_RET_1	= _t"传授语言成功！"
STF_MINIPET_TALK_RET_2	= _t"好友不在线"
STF_MINIPET_TALK_RET_3	= _t"不是好友关系"
STF_MINIPET_TALK_RET_4	= _t"好友目前无宠物"
STF_MINIPET_TALK_RET_5	= _t"友好度不够"

STF_MINIPET_BOTTLE_RET_1	= _t"漂流瓶使用成功！"
STF_MINIPET_BOTTLE_RET_2	= _t"每天最多扔3次，超上限了"
STF_MINIPET_BOTTLE_RET_3	= _t"敏感字过滤，失败"


----------------------
--战斗宠物 （守护星）

STF_COMPET_1	= _t"战斗队列已满"
STF_COMPET_2	= _t"守护星不在战斗队列"
STF_COMPET_3	= _t"出战"
STF_COMPET_4	= _t"收回"
STF_COMPET_5	= _t"性别不同，无法装备"
STF_COMPET_6	= _t"位置不同，无法装备"
STF_COMPET_7	= _t"是否替换该技能"
STF_COMPET_8	= _t"技能已满，请考虑扩充或替换"
STF_COMPET_9	= _t"缺少物品【%s】，无法扩充战斗队列"
STF_COMPET_10	= _t"请先激活前面的战斗队列"
STF_COMPET_11	= _t"请先激活前面的技能"
STF_COMPET_12	= _t"缺少物品【%s】，无法扩充技能栏位"
STF_COMPET_13	= _t"缺少物品【%s】，无法刷新资质"
STF_COMPET_14	= _t"资质已达上限"
STF_COMPET_15	= _t"金币不足，无法刷新资质"
STF_COMPET_16	= _t"不能放到这里"
STF_COMPET_17	= _t"水下不能召唤"
STF_COMPET_18	= _t"飞行状态不能召唤"
STF_COMPET_19 = _t"更名"
STF_COMPET_20 = _t"确定"
STF_COMPET_21 = _t"玩家须要达到%s"
STF_COMPET_22 = _t"该物品不是技能书"
STF_COMPET_23 = _t"该技能不能放入这个栏位"
STF_COMPET_24 = _t"可用技能栏位不符"
STF_COMPET_25 = _t"该物品不能用于扩充"
STF_COMPET_26 = _t"栏位超出上限"
STF_COMPET_27 = _t"金币不足"
STF_COMPET_28 = _t"<%s的守护星>"
STF_COMPET_29	= _t"拥有【%s】，可开启\r守护星声望商店将提供此物品"
STF_COMPET_30	= _t"此位置守护星资质的%d%%，将加成到出战守护星"
STF_COMPET_31	= _t"守护星"
STF_COMPET_32	= _t"请先脱去守护星身上的装备再进行操作"
STF_COMPET_33	= _t"玩家等级不足"
STF_COMPET_34	= _t"已经有守护星出战了"
STF_COMPET_35	= _t"当前位置守护星无法出战"
STF_COMPET_36	= _t"点击召唤守护星出战"
STF_COMPET_37	= _t"点击收回守护星"
STF_COMPET_38	= _t"守护星级别过低，无法装备"
STF_COMPET_39	=	_t"亲密度：%d"
STF_COMPET_RESET_FAILED_LOCKED = _t"守护星已锁定，无法刷新资质"
STF_COMPET_SKILL_BOOK_LOCKED = _t"技能书已锁定，无法装备"
STF_COMPET_SKILL_EX_FAILED_LOCKED = _t"守护星已锁定，不可替换已有的技能"
STF_COMPET_EQUIP_EX_FAILED_LOCKED = _t"守护星已锁定，不可替换已有装备"
STF_COMPET_ATTRIBUTE	=  _t"属性"
STF_COMPET_APTITUDE		=	_t"当前资质"
STF_COMPET_MAX_APTITUDE		=	_t"资质最大"
STF_COMPET_MAX_LEVEL	=	_t"等级上限"
STF_COMPET_ATTACK		=	_t"攻击力"
STF_COMPET_HIT			=	_t"命中"
STF_COMPET_ELEMENT		=	_t"元素攻击"
STF_COMPET_CRITICAL		=	_t"暴击"
STF_COMPET_PLAYER_LEVEL		=	_t"携带等级"
STF_COMPET_GIFT		=	_t"资质加成"