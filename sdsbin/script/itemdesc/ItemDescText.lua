--[[ @i18n item ]]
local _t = require("i18n").context("item")
-- 颜色控制字符串
ITEM_COLOR_DESC = {}
ITEM_COLOR_DESC.Gray   		= "^a1a3a4"	--	gray
ITEM_COLOR_DESC.White  		= "^f2f3f2"	--	white
ITEM_COLOR_DESC.Green  		= "^00ff00"	--	green
ITEM_COLOR_DESC.Purple 		= "^a800ff"	--	purple 专业技能物品
ITEM_COLOR_DESC.Orange    	= "^e5872f"	--	orange	古币
ITEM_COLOR_DESC.Yellow 		= "^ffff00"	--	yellow 物品需求色
ITEM_COLOR_DESC.Red 		= "^ff0000"	--	red
ITEM_COLOR_DESC.Blue	    ="^0184ff"	   --blue
ITEM_COLOR_DESC.DarkYellow 	= "^ffc000"	--	装备强化等级
ITEM_COLOR_DESC.LightBlue 	= "^00d2ff"	--	宠物技能
ITEM_COLOR_DESC.PetSkill	= "^c0c0ff"	--	宠物技能名
ITEM_COLOR_DESC.Brown	    ="^BDB76B"	   --brown
--ITEM_COLOR_DESC.TestColor		="^45d8ff"	--	装备强化、加工、融合的前缀颜色
ITEM_COLOR_DESC.Enhance = "^45d8ff"
ITEM_COLOR_DESC.TestColor   = "^ffff00"





ITEM_COLORSTR = {}
ITEM_COLORSTR[0] = STRING_TABLE.ITEMQUALITY_COL_0
ITEM_COLORSTR[1] = STRING_TABLE.ITEMQUALITY_COL_1
ITEM_COLORSTR[2] = STRING_TABLE.ITEMQUALITY_COL_2
ITEM_COLORSTR[3] = STRING_TABLE.ITEMQUALITY_COL_3
ITEM_COLORSTR[4] = STRING_TABLE.ITEMQUALITY_COL_4
ITEM_COLORSTR[5] = STRING_TABLE.ITEMQUALITY_COL_5
ITEM_COLORSTR[6] = STRING_TABLE.ITEMQUALITY_COL_6
ITEM_COLORSTR[7] = STRING_TABLE.ITEMQUALITY_COL_7
ITEM_COLORSTR[8] = STRING_TABLE.ITEMQUALITY_COL_8
ITEM_COLORSTR[9] = STRING_TABLE.ITEMQUALITY_COL_9


ITEM_GUIDE_LINK_DESC = {}
ITEM_GUIDE_LINK_DESC.LINK = _t"包裹中左键点击寻路,相关: ^U00FF00%s%s^u"


-- 字体字号
ITEM_SIZE_DESC = {}
ITEM_SIZE_DESC["Size10"] = "^O001"	--	方正细黑一简体 10 常规
ITEM_SIZE_DESC["Size12A"]= "^O013"  -- 常规12号
ITEM_SIZE_DESC["Size12"] = "^O013"	--	楷体12 0阴影
ITEM_SIZE_DESC["Size10A"] = "^O041"	--	楷体10 100阴影
ITEM_SIZE_DESC["Size9"] = "^O109"   --  方正细黑一简体 9 常规
ITEM_SIZE_DESC["Size8"] = "^O110"   --  方正细黑一简体 8 常规
ITEM_SIZE_DESC["Size11"] = "^O114"   --  方正细黑一简体 8 常规

-- 物品显示
ITEM_PROC_MASK_DESC = {}
ITEM_PROC_MASK_DESC["Mask1"] = _t"不可出售\r"
ITEM_PROC_MASK_DESC["Mask2"] = _t"不可交易\r"
ITEM_PROC_MASK_DESC["Mask3"] = nil
ITEM_PROC_MASK_DESC["Mask4"] = nil
ITEM_PROC_MASK_DESC["Mask5"] = _t"装备后绑定\r"
ITEM_PROC_MASK_DESC["Mask6"] = _t"直接绑定\r"
ITEM_PROC_MASK_DESC["Mask7"] = _t"不可存放仓库\r"
ITEM_PROC_MASK_DESC["Mask8"] = _t"不可销毁\r"
ITEM_PROC_MASK_DESC["Mask9"] = _t"切换场景消失后消失\r"
ITEM_PROC_MASK_DESC["Mask10"] = _t"红名死亡后消失\r"
ITEM_PROC_MASK_DESC["Mask11"] = _t"拾取后绑定\r"

ITEM_PROC_MASK_DESC["Mask_Bound1"] = _t"不可出售\r"
ITEM_PROC_MASK_DESC["Mask_Bound2"] = nil
ITEM_PROC_MASK_DESC["Mask_Bound3"] = nil
ITEM_PROC_MASK_DESC["Mask_Bound4"] = nil
ITEM_PROC_MASK_DESC["Mask_Bound5"] = nil
ITEM_PROC_MASK_DESC["Mask_Bound6"] = nil
ITEM_PROC_MASK_DESC["Mask_Bound7"] = _t"不可存放仓库\r"
ITEM_PROC_MASK_DESC["Mask_Bound8"] = _t"不可销毁\r"
ITEM_PROC_MASK_DESC["Mask_Bound9"] = nil
ITEM_PROC_MASK_DESC["Mask_Bound10"] = nil
ITEM_PROC_MASK_DESC["Mask_Bound11"] = nil


-- 物品名称显示格式
ITEM_NAME_DESC = {}
ITEM_NAME_DESC["Name"] = "%s "
ITEM_NAME_DESC["Name1"] = "%s +%d"
ITEM_NAME_DESC["NameLevel"] = _t"需求%s %d级"


-- 物品数量显示格式
ITEM_COUNT_DESC = {}
ITEM_COUNT_DESC["Count"] = _t"（%d）"
ITEM_COUNT_DESC.MaxHold  = _t"%s最多可携带%d个"


-- 物品绑定状态显示格式
ITEM_BOUND_DESC = {}
ITEM_BOUND_DESC["Bound"] =_t"已绑定\r"
ITEM_BOUND_DESC["Bound1"] =_t"装备后绑定\r"


-- 物品时间显示格式
ITEM_TIME_DESC = {}
ITEM_TIME_DESC["ExpireTime"] = _t"剩余时间 "
ITEM_TIME_DESC["Day"] = _t"%d天"
ITEM_TIME_DESC["Hour"] = _t"%d小时"
ITEM_TIME_DESC["Minute"] = _t"%d分"
ITEM_TIME_DESC["Second"] = _t"%d秒"
ITEM_TIME_DESC["ValidTime"] = _t"持续时间 "
ITEM_TIME_DESC["ColddownTime"] = _t"冷却时间 "
ITEM_TIME_DESC["ExpireColddownTime"] = _t"剩余冷却时间 "

--物品拆分状态显示
ITEM_COMPOSE_DESC={}
ITEM_COMPOSE_DESC["CANNOT"]=_t"不可分解\r"

-- 物品价格显示格式
ITEM_PRICE_DESC = {}
ITEM_PRICE_DESC.PriceTotalPrice = _t"价格 %s\r"
ITEM_PRICE_DESC.PriceTotalPrice1 = _t"价格 %s (%s)\r"
ITEM_PRICE_DESC.PriceTotalPrice2 = _t"价格 %s\r或者 %s\r"
ITEM_PRICE_DESC.PriceTotalPrice3 = _t"价格 %s (%s)\r或者 %s (%s)\r"
ITEM_PRICE_DESC["Price"] = _t"价格 %s"
ITEM_PRICE_DESC["Price1"] = _t"价格 %s (%s)"
ITEM_PRICE_DESC.Repair = _t"修理费 %s\r"
ITEM_PRICE_DESC["ItemCost"] = _t"需要 %s × %d "
ITEM_PRICE_DESC["ItemCost1"] = _t"需要 %s × %d "
ITEM_PRICE_DESC["PrestigePrice"] = _t"消耗 %s %d "
ITEM_PRICE_DESC["ReqPrestigeCount"] = _t"需求 %s %d阶 "
ITEM_PRICE_DESC.Empty = ""

--是否学会
ITEM_LEARNED_DESC = {}
ITEM_LEARNED_DESC["Learned"] = _t"已学会\r"

--配方等级
ITEM_RECIPE_DESC = {}
ITEM_RECIPE_DESC["Exp"] = _t"学习消耗经验%d"
ITEM_RECIPE_DESC["PlayerLev"] = _t"学习需要玩家达到%s\r"
ITEM_RECIPE_DESC["Coin"] = _t"学习消耗金钱%d"

--等级需求
ITEM_REQ_LEVEL_DESC = {}
ITEM_REQ_LEVEL_DESC["ReqLevel"] = _t"要求等级  %d\r"
ITEM_REQ_LEVEL_DESC["ReqLevel2"] = _t"要求潜修等级  %d\r"

--小宇宙等级需求
ITEM_REQ_COSMOS_LEVEL_DESC = {}
ITEM_REQ_COSMOS_LEVEL_DESC["ReqCosmosLevel"] = _t"要求小宇宙等级  %d\r"

-- 携带宠物等级要求
ITEM_TAKE_BOUNTY_REQ_LEVEL_DESC = {}
ITEM_TAKE_BOUNTY_REQ_LEVEL_DESC["TakeBountyReqLevel"] = _t"携带等级  %s\r"

--适用携带等级
ITEM_SUMMON_LEVEL_LIMIT={}
ITEM_SUMMON_LEVEL_LIMIT["Summon_Level_Limit"]=_t"适用携带等级不超过%d的宠物\r"

--使用次数
ITEM_USE_TIMES_DESC = {}
ITEM_USE_TIMES_DESC["UseTimes"] = _t"使用次数 %d\r"

--战斗力
FIGHT_POWER   = _t"★战力 %d\r"


--是否死亡
ITEM_BOUND_DEAD_DESC = {}
ITEM_BOUND_DEAD_DESC["DEAD"] = _t"死亡\r"

--是否修炼
ITEM_BOUND_TRAIN_DESC = {}
ITEM_BOUND_TRAIN_DESC["Train"] = _t"已修炼\r"
ITEM_BOUND_TRAIN_DESC["NotTrain"] = _t"未修炼\r"

--声望限制
ITEM_BOUNTY_REQ_PRESTIGE_DESC = {}
ITEM_BOUNTY_REQ_PRESTIGE_DESC["BountyReqPrestige"] = _t"声望限制 %d\r"

--宠物评分
ITEM_BOUNTY_POINT_DESC = {}
ITEM_BOUNTY_POINT_DESC["BountyPoint"] = _t"评分 %d\r"

--宠物技能卷轴
ITEM_PET_SKILL={}
ITEM_PET_SKILL["Prob"]=_t"学习成功率 %d%%\r"
ITEM_PET_SKILL["AvForType_0"]=_t"%s近程%s宠物专用技能书\r"
ITEM_PET_SKILL["AvForType_1"]=_t"%s远程%s宠物专用技能书\r"
ITEM_PET_SKILL["AvForType_2"]=_t"%s通用%s宠物技能书\r"


--抽取次数
ITEM_DICE_CET_DESC = {}
ITEM_DICE_CET_DESC["DiceCnt"] = _t"抽取次数 %d\r"

--是否多人骑乘
ITEM_MORE_SEATER_RIDES_DESC = {}
ITEM_MORE_SEATER_RIDES_DESC["MoreSeaterRides"] = _t"多人骑乘坐骑\r"
ITEM_MORE_SEATER_RIDES_DESC["SingleSeaterRide"] =_t"坐骑\r"

--是否可进行攻击
ITEM_RIDES_ATTACK_DESC = {}
ITEM_RIDES_ATTACK_DESC["rides_attack"] = _t"可进行攻击\r"

--装备限制
ITEM_EQUIP_REQ_TEXT_DESC = {}
ITEM_EQUIP_REQ_TEXT_DESC["ProfessionReq1"] = "%s  "
ITEM_EQUIP_REQ_TEXT_DESC["ProfessionReq2"] = "%s  "
ITEM_EQUIP_REQ_TEXT_DESC["ProfessionReq3"] = "%s  "
ITEM_EQUIP_REQ_TEXT_DESC["ProfessionReq4"] = "%s  "
ITEM_EQUIP_REQ_TEXT_DESC["ProfessionReq5"] = "%s  "
ITEM_EQUIP_REQ_TEXT_DESC["ProfessionReq6"] = "%s  "
ITEM_EQUIP_REQ_TEXT_DESC["ProfessionReq7"] = "%s  "
ITEM_EQUIP_REQ_TEXT_DESC["ProfessionReq8"] = "%s  "

ITEM_EQUIP_REQ_TEXT_DESC["RaceReq1"] = "%s "
ITEM_EQUIP_REQ_TEXT_DESC["RaceReq2"] = "%s "
ITEM_EQUIP_REQ_TEXT_DESC["RaceReq3"] = "%s "
ITEM_EQUIP_REQ_TEXT_DESC["RaceReq4"] = "%s "
ITEM_EQUIP_REQ_TEXT_DESC["RaceReq5"] = "%s "

ITEM_EQUIP_REQ_TEXT_DESC["RaceReqMask1"] = _t"人类专用\r"


--强化等级
ITEM_REFINE_LEVEL_DESC = {}
ITEM_REFINE_LEVEL_DESC["RefineLevel"] = _t"■ 基础聚能完美度%d（最高%d）\r   战力+%d\r"
ITEM_REFINE_LEVEL_DESC["RefineLevel_S"] = _t"■ 聚能完美度 %d/%d\r"
ITEM_REFINE_LEVEL_DESC["RefineLevel_A"] = _t"■ 基础聚能完美度%d（最高%d）\r   进阶聚能完美度%d（最高%d）\r   战力+%d\r"

--强化为空字符
EMPTY_E_ENHANCE_LEVEL = _t"■ 可聚能\r"
EMPTY_J_ENHANCE_LEVEL = _t"■ 可聚能\r"



-- 主人
ITEM_EMPLOYERS_NAME_DESC = {}
ITEM_EMPLOYERS_NAME_DESC["EmployersName"] = _t"主人 %s\r"



--性别限制
ITEM_REQ_GENDER_DESC = {}
ITEM_REQ_GENDER_DESC["ReqGender"] = _t"性别限制 %s\r"




--宠物技能
ITEM_BOUNTY_SKILL_DESC = {}
ITEM_BOUNTY_SKILL_DESC["BountySkill"] =  _t"%s技能 %s %d级%s\r"

--应用区域
ITEM_VALID_AREA_DESC = {}
ITEM_VALID_AREA_DESC["ValidArea"] = _t"应用区域 %s\r"

--宠物属性
ITEM_BOUNTY_DESC = {}
ITEM_BOUNTY_DESC["BountyMaxhp"] = _t"生命值 %d/%d\r"
ITEM_BOUNTY_DESC["BountyMaxmp"] = _t"魔法值 %d/%d\r"
ITEM_BOUNTY_DESC["BountyHPGrow"] = _t"生命值成长率 %.2f\r"
ITEM_BOUNTY_DESC["BountyMPGrow"] = _t"魔法值成长率 %.2f\r"
ITEM_BOUNTY_DESC["BountyAttackGrow"] = _t"攻击成长率 %.2f\r"
ITEM_BOUNTY_DESC["BountyDefense"] = _t"防御力 %d\r"
ITEM_BOUNTY_DESC["BountyDefenseGrow"] = _t"防御成长率 %.2f\r"

ITEM_PET_APTT_STONE_DESC={}
ITEM_PET_APTT_STONE_DESC["SuccessProb"]=_t"提升成功率 %.1f%%\r"
ITEM_PET_APTT_STONE_DESC["ApttAdd"]=_t"使资质提升 %.1f%%\r"



--技能名称
ITEM_PET_SKILL_UP_DESC = {}
ITEM_PET_SKILL_UP_DESC["PetSkillName"] = _t"将%d级的%s%s%s升至%d级\r"
ITEM_PET_SKILL_UP_DESC["SuccessProb"]=_t"提升成功率 %d%%\r"
--药品类型
ITEM_MEDICINE_TYPE_DESC = {}
ITEM_MEDICINE_TYPE_DESC["MedicineType0"] = _t"使用效果 共可恢复%d点生命\r每次最多恢复%d点生命\r还可恢复%d点生命\r"
ITEM_MEDICINE_TYPE_DESC["MedicineType1"] = _t"使用效果 共可恢复%d点能量\r每次最多恢复%d点能量\r还可恢复%d点能量\r"
ITEM_MEDICINE_TYPE_DESC["MedicineType2"] = _t"使用效果 共可恢复%d点生命和%d点能量\r每次最多恢复%d点生命和%d点能量\r还可恢复%d点生命及%d点能量\r"
ITEM_MEDICINE_TYPE_DESC["MedicineType3"] = _t"使用效果 恢复%d点生命\r之后的6秒内持续恢复%d点生命\r"
ITEM_MEDICINE_TYPE_DESC["MedicineType3A"] = _t"使用效果 恢复%d点生命\r"
ITEM_MEDICINE_TYPE_DESC["MedicineType4"] = _t"使用效果 恢复%d点能量\r之后的6秒内持续恢复%d点能量\r"
ITEM_MEDICINE_TYPE_DESC["MedicineType4A"] = _t"使用效果 恢复%d点能量\r"
ITEM_MEDICINE_TYPE_DESC["MedicineType5"] = _t"使用效果 恢复%d点生命及%d点能量\r之后的6秒内持续恢复%d点生命和%d点能量\r"
ITEM_MEDICINE_TYPE_DESC["MedicineType5A"] = _t"使用效果 恢复%d点生命及%d点能量\r"
ITEM_MEDICINE_TYPE_DESC["MedicineType6"] = _t"共可恢复%d点生命\r每次最多恢复%d%%生命\r还可恢复%d点生命\r"
ITEM_MEDICINE_TYPE_DESC["MedicineType6A"] = _t"共可恢复%d点生命\r每次最多恢复%d%%生命\r"
ITEM_MEDICINE_TYPE_DESC["MedicineType7"] = _t"持续恢复 %d元气\r"

--移动速度
ITEM_MOVE_SPEED_DESC = {}
ITEM_MOVE_SPEED_DESC["MoveSpeed"] = _t"^%06x移动速度 %.1f\r"
ITEM_MOVE_SPEED_DESC["FlyMoveSpeed"] = _t"^%06x飞行速度 %.1f\r"


--装备攻击距离
ITEM_EQUIP_ATK_DISTANCE_DESC = {}
ITEM_EQUIP_ATK_DISTANCE_DESC["EquipAtkDistance"] = _t"攻击距离 %d\r"

--前缀附加属性包说明文字
ITEM_PREFIX_DESC = {}
ITEM_PREFIX_DESC["PrefixDes"] = _t"附加属性 %s\r"

--后缀附加属性包说明文字
ITEM_SUFFIX_DESC = {}
ITEM_SUFFIX_DESC["SuffixDes"] = _t"附加属性 %s\r"

ITEM_ENHANCE_ATTR_DESC = {
    [1] = _t"生命力+%d\r",
    [13] = _t"地攻击+%d\r",
    [14] = _t"水攻击+%d\r",
    [15] = _t"火攻击+%d\r",
    [16] = _t"风攻击+%d\r",
    [113] = _t"雷攻击+%d\r",
    [35] = _t"命中+%d\r",
    [36] = _t"闪避+%d\r",
    [39] = _t"防御力+%d\r",
    [107] = _t"攻击力+%d\r",
}
--进阶聚能显示属性
ITEM_ENHANCE_ATTR_DESC_ADVANCE = {
    [1] = _t"生命力+%d[%d*%d%%]\r",
    [13] = _t"地攻击+%d[%d*%d%%]\r",
    [14] = _t"水攻击+%d[%d*%d%%]\r",
    [15] = _t"火攻击+%d[%d*%d%%]\r",
    [16] = _t"风攻击+%d[%d*%d%%]\r",
    [113] = _t"雷攻击+%d[%d*%d%%]\r",
    [35] = _t"命中+%d[%d*%d%%]\r",
    [36] = _t"闪避+%d[%d*%d%%]\r",
    [39] = _t"防御力+%d[%d*%d%%]\r",
    [107] = _t"攻击力+%d[%d*%d%%]\r",
}

-- 强化激活字符串
ITEM_ENHANCE_EXTRA_DESC = {}
ITEM_ENHANCE_EXTRA_DESC["NOT_ACTIVATE"] = _t"未激活：%s (%d)\r"
ITEM_ENHANCE_EXTRA_DESC["ACTIVATE"] = _t"已激活：%s (%d)\r"
ITEM_ENHANCE_EXTRA_DESC["PERFECT"] = _t"★%d个完美激活\r   "

--当前强化等级包说明文字
ITEM_ENHANCE_DESC = {}
ITEM_ENHANCE_DESC["enhance_addon_group"] = "%s%s\r"

SUIT_TAG_LINE_DESC = _t"灵纹：%s\r"
SUIT_TAG_EXTRA_DESC = _t"灵纹可改造、转移\r"


--装备攻击力
ITEM_EQUIP_MAXATTACK_DESC = {}
ITEM_EQUIP_MAXATTACK_DESC["EquipMaxattack"] = _t"攻击力 %d～%d "
ITEM_EQUIP_MAXATTACK_DESC["EquipMaxattack1"] = _t"攻击力 %d "
ITEM_EQUIP_MAXATTACK_DESC["EquipMaxattackAdd"] = _t"(+%d～%d)\r"
ITEM_EQUIP_MAXATTACK_DESC["EquipMaxattackAdd1"] = "(+%d)\r"
ITEM_EQUIP_MAXATTACK_DESC["EquipMaxattackExtra"] = _t"(攻击力:%d～%d)"

--宠物装备攻击力
ITEM_BOUNTY_ATTACK_MAX_DESC = {}
ITEM_BOUNTY_ATTACK_MAX_DESC["BountyAttackMax"] = _t"攻击 %d～%d\r"
ITEM_BOUNTY_ATTACK_MAX_DESC["BountyAttackMax1"] = _t"攻击 %d\r"



--装备生命值
ITEM_EQUIP_MAX_HP_DESC = {}
ITEM_EQUIP_MAX_HP_DESC["EquipMaxhp"] = _t"生命力 %d "
ITEM_EQUIP_MAX_HP_DESC["EquipMaxhpAdd"] = "(+%d)\r"
ITEM_EQUIP_MAX_HP_DESC["EquipMaxhpExtra"] = _t"(生命力:%d)"

--装备魔法值
ITEM_EQUIP_MAX_MP_DESC = {}
ITEM_EQUIP_MAX_MP_DESC["EquipMaxmp"] = _t"魔力 %d "
ITEM_EQUIP_MAX_MP_DESC["EquipMaxmpAdd"] = "(+%d)\r"
ITEM_EQUIP_MAX_MP_DESC["EquipMaxmpExtra"] = _t"(魔力:%d)"

--装备防御力
ITEM_EQUIP_DEFENCE_DESC = {}
ITEM_EQUIP_DEFENCE_DESC["EquipDefence"] = _t"防御力 %d "
ITEM_EQUIP_DEFENCE_DESC["EquipDefenceAdd"] = "(+%d)\r"
ITEM_EQUIP_DEFENCE_DESC["EquipDefenceExtra"] = _t"(防御力:%d)"

--宠物食品类型
ITEM_PET_FOOD_USE_DESC = {}
ITEM_PET_FOOD_USE_DESC["PetFoodUse"] = _t"%s增加宠物体力 %d\r"

-- 装备类别
ITEM_EQUIP_POS_DESC = {}
ITEM_EQUIP_POS_DESC["EquipPos1"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos2"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos3"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos4"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos5"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos6"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos7"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos8"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos9"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos10"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos11"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos12"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos13"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos14"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos15"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos16"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos17"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos18"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos19"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos20"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos21"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos22"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos23"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos24"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos25"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos26"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos27"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos28"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos29"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos30"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos31"] = "%s "
ITEM_EQUIP_POS_DESC["EquipPos32"] = "%s "

-- 宠物当前等级
ITEM_BOUNTY_LEVEL_DESC = {}
ITEM_BOUNTY_LEVEL_DESC["BountyLevel"] = _t"宠物等级 %d\r"


--此装备是否被鉴定过
ITEM_EQUIP_APPRAISE_TEXT_DESC = {}
ITEM_EQUIP_APPRAISE_TEXT_DESC.AppraiseDesc   = "%s\r"
ITEM_EQUIP_APPRAISE_TEXT_DESC.NotAppraise    = _t"随机属性"
ITEM_EQUIP_APPRAISE_TEXT_DESC.FixedAppraise	 = _t"固定属性"

-- 装备强化融合属性
ITEM_EQUIP_MERGE_TEXT_DESC = ""
ITEM_EQUIP_MERGE_TEXT_DESC_TAG = _t"■ 增强融合\r"

----聚能套装激活属性描述
STRING_EQUIP_ENHANCE_SUIT_DESC = _t"^ffff00★ 9件聚能激活(聚能1-12级）\r   单件大于%d完美度\r"
STRING_EQUIP_ENHANCE_SUIT_ADDON_DESC = _t"%s\r"
STRING_EQUIP_ENHANCE_SUIT_DESC_ADVANCE = _t"^ffff00★ 9件聚能激活（高于聚能12级）\r   单件大于%d完美度\r"
STRING_EQUIP_ENHANCE_SUIT_ADDON_DESC_ADVANCE = _t"%s\r"

-- 装备额外属性
ITEM_EQUIP_EXTRA_TEXT_DESC = ""
ITEM_EQUIP_EXTRA_TEXT_DESC_TAG = "%s\r"

-- 装备加工属性
ITEM_EQUIP_PROCESS_TEXT_DESC = _t"■ 符文（战力+%d)\r"
ITEM_EQUIP_PROCESS_TEXT_DESC1 = _t"■ 符文\r"
ITEM_EQUIP_PROCESS_TIMELEFT_DESC1 = _t"    剩余时间:%d秒"
ITEM_EQUIP_PROCESS_TIMELEFT_DESC2 = _t"    剩余时间:%d分"
ITEM_EQUIP_PROCESS_TIMELEFT_DESC3 = _t"    剩余时间:%d时%d分"
ITEM_EQUIP_PROCESS_TIMELEFT_DESC4 = _t"    剩余时间:%d天%d时"
ITEM_EQUIP_PROCESS_TIMELEFT_DESC5 = _t"    ★永久"
ITEM_EQUIP_PROCESS_TIMELEFT_DESC6 = _t"    已过期"
ITEM_EQUIP_PROCESS_EMPTY_TEXT_DESC = ""


--装备品级
ITEM_EQUIP_LEV_TEXT = _t"%s%d阶"
--装备需求意志等级
ITEM_EQUIP_WILLLEV_TEXT = _t"要求小宇宙等级 %d\r"


ITEM_PET_NAME=_t"%s宠物名: %s%s%s\r"

ITEM_PET={}
ITEM_PET["AttackGrowth"]=_t"攻击成长率：%s%d%s\r"
ITEM_PET["DefenseGrowth"]=_t"防御成长率：%s%d%s\r"
ITEM_PET["HpGrowth"]=_t"生命成长率：%s%d%s\r"

ITEM_PET["Category"]=_t"%s宠物\r"
ITEM_PET["Attack"]=_t"攻击：%d - %d\r"
ITEM_PET["Defense"]=_t"防御：%d\r"
ITEM_PET["HpMax"]=_t"生命：%d\r"

ITEM_PET["AttackApt"]=_t"攻击资质：%.1f%%\r"
ITEM_PET["DefenseApt"]=_t"防御资质：%.1f%%\r"
ITEM_PET["HpApt"]=_t"生命资质：%.1f%%\r"


--	prop=prop.."攻击成长率："..Format("%.2f",ItemDescTab.attack_growth)..Format("\r")
--	prop=prop.."防御成长率："..Format("%.2f",ItemDescTab.defense_growth)..Format("\r")
--	prop=prop.."生命成长率："..Format("%.2f",ItemDescTab.hp_growth)..Format("\r")
--	prop=prop.."攻击资质："..Format("%.2f%%",ItemDescTab.attack_aptitude*100)..Format("\r")
--	prop=prop.."防御资质："..Format("%.2f%%",ItemDescTab.defense_aptitude*100)..Format("\r")
--	prop=prop.."生命资质："..Format("%.2f%%",ItemDescTab.hp_aptitude*100)..Format("\r")
--	prop=prop.."攻击力："..ItemDescTab.attack_min.."-"..ItemDescTab.attack_max..Format("\r")
--	prop=prop.."防御："..ItemDescTab.defense..Format("\r")
--	prop=prop.."当前生命："..ItemDescTab.hp..Format("\r")
--	prop=prop.."生命上限："..ItemDescTab.hp_max..Format("\r")


--宠物技能卷轴
--ITEM_PET_SKILL_TAG_DESC = {}
--ITEM_PET_SKILL_TAG_DESC["TagDesc"] = "宠物技能卷轴"

--宠物攻击天赋
ITEM_BOUNTY_ATTACK_TALENT_DESC = {}
ITEM_BOUNTY_ATTACK_TALENT_DESC["BountyAttackTalent"] = _t"攻击天赋 %d级\r"

--宠物防御天赋
ITEM_BOUNTY_DEFENSE_TALENT_DESC = {}
ITEM_BOUNTY_DEFENSE_TALENT_DESC["BountyDefenseTalent"] = _t"防御天赋 %d级\r"

--宠物生命天赋
ITEM_BOUNTY_HP_TALENT_DESC = {}
ITEM_BOUNTY_HP_TALENT_DESC["BountyHPTalent"] = _t"生命天赋 %d级\r"

--宠物宠物强/弱特性
ITEM_BOUNTY_TRAIT_DESC = {}
ITEM_BOUNTY_TRAIT_DESC["BountyTraitMax"] = "%s "
ITEM_BOUNTY_TRAIT_DESC["BountyTraitMin"] = "%s "

--宠物捕捉道具
ITEM_PET_CATCHER={}
ITEM_PET_CATCHER["PlayerLevelReq"]=_t"使用需要人物达到%s\r"
ITEM_PET_CATCHER["LevelLimit"]=_t"只能对等级不超过%d的目标使用\r"
ITEM_PET_CATCHER["UseLimit"]=_t"对血量低于%d%%的宠物怪使用可以\r捕捉到一只^%06x%s的宠物%s\r"
ITEM_PET_CATCHER["Quality_0"]=_t"一般的"
ITEM_PET_CATCHER["Quality_1"]=_t"普通的"
ITEM_PET_CATCHER["Quality_2"]=_t"良好的"
ITEM_PET_CATCHER["Quality_3"]=_t"卓越的"

--圣衣是否拥有
SAINT_CLOTH_OBTAIN={}
SAINT_CLOTH_OBTAIN["not_obtained"]=_t"^ff0000未获得圣衣^f2f3f2"

--圣衣类型
SAINT_CLOTH_CLASS={
	[0]	=_t"^f2f3f2【青铜圣衣】^f2f3f2\r",
	[1]	=_t"^0184ff【白银圣衣】^f2f3f2\r",
	[2]	=_t"^ffff00【黄金圣衣】^f2f3f2\r",
	[3]	=_t"^ff0000【神圣衣】^f2f3f2\r",
}

--圣衣战斗力
SAINT_CLOTH_FIGHT_POWER_DESC = {}
SAINT_CLOTH_FIGHT_POWER_DESC["fight_power"] = "\r          ^45d8ff%d^f2f3f2"
SAINT_CLOTH_FIGHT_POWER_DESC["fight_power_when_equipped"] = _t"★战力 ^ffc000%d^f2f3f2"

--圣衣属性
SAINT_CLOTH_ADDON = {}
SAINT_CLOTH_ADDON["addon_pack"] = _t"^O013^ff0000拥有者属性提升^O001 \r^ffc000★战力 %d^00ff00\r%s"
SAINT_CLOTH_ADDON["addon_pack_when_equipped"] = _t"\r^O013^f2f3f2装备后属性提升^O001 \r^ffc000★战力 %d^00ff00\r%s"
SAINT_CLOTH_ADDON["enhance_lev"] = _t"星铸等级 %d"
--圣衣装备需要条件
SAINT_CLOTH_REQ_DESC = {}
SAINT_CLOTH_REQ_DESC["req_level"] = _t"要求级别 %s"
SAINT_CLOTH_REQ_DESC["req_gender"] = _t"要求性别 %d\r"
SAINT_CLOTH_REQ_DESC["req_cosmos_level"] = _t"要求小宇宙等级 %d\r"

----------小宇宙
COSMOS_STAR_ADDON					= "%s\r"
COSMOS_STAR_FIGHT_POWER				= _t"^ffff00★战力 %d^f2f3f2\r"
COSMOS_STAR_NEED_PLAY_LEVEL			= _t"激活等级 %s\r"
COSMOS_STAR_NEED_REALIZE_POINT		= _t"需要小宇宙感悟 %d\r"
COSMOS_STAR_UNACTIVED				= _t"^ff0000未激活^f2f3f2\r"
COSMOS_STAR_ACTIVED					= ""
COSMOS_STAR_NO_STONE				= _t"^ff0000未注入星魂^f2f3f2"
COSMOS_STAR_HAVE_STONE				= _t"^f2f3f2已注入星魂^f2f3f2\r"
COSMOS_STAR_ACCEPT_COLOR={
	[0]	=_t"·^ff0000【日相】^f2f3f2\r",
	[1]	=_t"·^0184ff【月相】^f2f3f2\r",
	[2]	=_t"·^ffff00【主序】^f2f3f2\r",
    [3] =_t"^f2f3f2\r",
    [4] =_t"^f2f3f2\r",
    [5] =_t"^f2f3f2\r",
    [6] =_t"^f2f3f2\r",
}
COSMOS_STAGE_FIGHT_POWER			= _t"^ffff00★战力 %d^f2f3f2"
COSMOS_STAGE_ADDON					= "%s"
COSMOS_RANK_STAR_NEED_RANK_LEVEL    = _t"激活小宇宙等级 %d\r"
COSMOS_RANK_STAR_NEED_SKILL_POINT      = _t"需要技能感悟 %d\r"


--装备耐久度
ITEM_ENDURE_DESC = {}
ITEM_ENDURE_DESC["Endure"] = _t"%s耐久度 %d/%d"
ITEM_ENDURE_DESC["Zero"] = _t"，修理后才能装备"

-- 镶嵌效果
ITEM_TESSERA_ADD_DESC = {}
ITEM_TESSERA_ADD_DESC["TesseraAdd"] = _t"镶嵌效果 %s\r"

-- 宠物蛋等级要求描述
ITEM_MASTER_REQ_LEVEL_DESC = {}
ITEM_MASTER_REQ_LEVEL_DESC["MasterReqLevel"] = _t"炼化等级要求 %d级\r"

-- 宠物食品等级要求
ITEM_PET_REQ_LEVEL_DESC = {}
ITEM_PET_REQ_LEVEL_DESC["PetReqLevel"] = _t"宠物等级要求 %d\r"
ITEM_PET_REQ_LEVEL_DESC["PetReqLevel1"] = _t"当前没有出战的宠物\r"
ITEM_PET_REQ_LEVEL_DESC["PetSummonLevel"]=_t"宠物携带等级要求 %d\r"

-- 宠物装备等级要求
ITEM_BOUNTY_REQ_LEVEL_DESC = {}
ITEM_BOUNTY_REQ_LEVEL_DESC["BountyReqLevel"] = _t"等级要求 %d\r"
ITEM_BOUNTY_REQ_LEVEL_DESC["BountyReqLevel1"] = _t"当前没有选中的宠物\r"

-- 装备强化等级N触发第N灵魂形态
ITEM_EQUIP_SOUL_1_DESC = {}
ITEM_EQUIP_SOUL_1_DESC["EquipSoul1"] = _t"装备强化到%d级将触发初级灵魂形态\r"
ITEM_EQUIP_SOUL_1_DESC["EquipSoul2"] = _t"装备强化到%d级将触发中级灵魂形态\r"
ITEM_EQUIP_SOUL_1_DESC["strEquipSoul3"] = _t"装备强化到%d级将触发高级灵魂形态\r"

-- 是否已收藏
ITEM_BE_COLLECTED_DESC = {}
ITEM_BE_COLLECTED_DESC["BeCollected"] = _t"已收藏\r"
ITEM_BE_COLLECTED_DESC["NotBeCollected"] = _t"未收藏\r"

ITEM_PET_GROWTH_STONE_DESC={}
ITEM_PET_GROWTH_STONE_DESC["type0"]=_t"增加宠物攻击成长率%d点成长度\r"
ITEM_PET_GROWTH_STONE_DESC["type1"]=_t"增加宠物防御成长率%d点成长度\r"
ITEM_PET_GROWTH_STONE_DESC["type2"]=_t"增加宠物生命成长率%d点成长度\r"

--星魂类别
ITEM_SOUL_STONE={}
ITEM_SOUL_STONE["SoulStoneType1"]=_t"力量\r"
ITEM_SOUL_STONE["SoulStoneType2"]=_t"灵力\r"
ITEM_SOUL_STONE["SoulStoneType3"]=_t"暴伤\r"
ITEM_SOUL_STONE["SoulStoneType4"]=_t"大攻击\r"
ITEM_SOUL_STONE["SoulStoneType5"]=_t"攻击\r"
ITEM_SOUL_STONE["SoulStoneType6"]=_t"附加伤害\r"
ITEM_SOUL_STONE["SoulStoneType7"]=_t"防御\r"
ITEM_SOUL_STONE["SoulStoneType8"]=_t"耐力\r"
ITEM_SOUL_STONE["SoulStoneType9"]=_t"体力\r"
ITEM_SOUL_STONE["SoulStoneType10"]=_t"生命\r"

ITEM_SOUL_STONE["Level1"]=_t"初级"
ITEM_SOUL_STONE["Level2"]=_t"中级"
ITEM_SOUL_STONE["Level3"]=_t"高级"

ITEM_SOUL_STONE["StrAddon"]=_t"基础属性: %s\r"
ITEM_SOUL_STONE["Quality"]=_t"品质:%d品\r"
ITEM_SOUL_STONE["CurBright"]=_t"魂力当前值:%d\r"
ITEM_SOUL_STONE["InitBright"]=_t"魂力初始值:%d\r"

--星魂强化道具
ITEM_SOUL_STAR_STONE_LEVEL_UP={}
ITEM_SOUL_STAR_STONE_LEVEL_UP["Desc"]=_t"%s可以提升星魂的魂力%d点\r有小概率使魂力提升%d点\r星魂的最大魂力不能超过%d\r"

--装备基础属性点
ITEM_EQUIP_BASEPROP_DESC = {}
ITEM_EQUIP_BASEPROP_DESC["Strength"]=_t"%s力量 %d\r"
ITEM_EQUIP_BASEPROP_DESC["Stamina"]=_t"%s体力 %d\r"
ITEM_EQUIP_BASEPROP_DESC["Mana"]=_t"%s灵力 %d\r"
ITEM_EQUIP_BASEPROP_DESC["Durability"]=_t"%s耐力 %d\r"

ITEM_EQUIP_BASEPROP_EXTRA_DESC = {}
ITEM_EQUIP_BASEPROP_EXTRA_DESC["Strength"]=_t"力量"
ITEM_EQUIP_BASEPROP_EXTRA_DESC["Stamina"]=_t"体力"
ITEM_EQUIP_BASEPROP_EXTRA_DESC["Mana"]=_t"灵力"
ITEM_EQUIP_BASEPROP_EXTRA_DESC["Durability"]=_t"耐力"

--装备属性攻击力
ITEM_EQUIP_ELEMENTDMG_DESC = {}
ITEM_EQUIP_ELEMENTDMG_DESC["Earth"]=_t"%s地攻击 %d\r"
ITEM_EQUIP_ELEMENTDMG_DESC["Water"]=_t"%s水攻击 %d\r"
ITEM_EQUIP_ELEMENTDMG_DESC["Fire"]=_t"%s火攻击 %d\r"
ITEM_EQUIP_ELEMENTDMG_DESC["Wind"]=_t"%s风攻击 %d\r"
ITEM_EQUIP_ELEMENTDMG_DESC["Thunder"]=_t"%s雷攻击 %d\r"

ITEM_EQUIP_ELEMENTDMG_EXTRA_DESC = {}
ITEM_EQUIP_ELEMENTDMG_EXTRA_DESC["Earth"]=_t"(地攻击:%d)"
ITEM_EQUIP_ELEMENTDMG_EXTRA_DESC["Water"]=_t"(水攻击:%d)"
ITEM_EQUIP_ELEMENTDMG_EXTRA_DESC["Fire"] =_t"(火攻击:%d)"
ITEM_EQUIP_ELEMENTDMG_EXTRA_DESC["Wind"] =_t"(风攻击:%d)"
ITEM_EQUIP_ELEMENTDMG_EXTRA_DESC["Thunder"] =_t"(雷攻击:%d)"

ITEM_EQUIP_FIGHT_POWER_BASE 	= _t"★战力 %-5d\r"
ITEM_EQUIP_FIGHT_POWER_DESC		= _t"★战力 %-24d \r"	
ITEM_EQUIP_FIGHT_POWER_ENHANCE 	= _t"★战力 %d"
ITEM_EQUIP_FIGHT_POWER			= " + %d\r"

--守护星
ITEM_GUARD_STAR={}
ITEM_GUARD_STAR["GuardPoint"]=_t"守护值 %d\r"
ITEM_GUARD_STAR["GuardLevel1"]=_t"可吸收的守护星等级下限： %d\r"
ITEM_GUARD_STAR["GuardLevel2"]=_t"可吸收的守护星等级上限： %d\r"

--分解
ITEM_DECOMPSE={}
ITEM_DECOMPSE["Item"]=_t"%s分解: %s%s"


--星魂
STAR_SOUL = {}
STAR_SOUL_ADDON_PACK 	= "%s\r"
STAR_SOUL_NEXT_LEVEL    = _t"^ffff00下一等级:                     ^00ff00%d级"
STAR_SOUL_BURST_DESC	= _t"^ff0000^O013爆发属性"
STAR_SOUL_BURST_ADDON_PACK 	= "%s\r"
STAR_SOUL_BURST_BUFF_PACK	= _t"%s\r★第%d阶段爆发\r"
STAR_SOUL_FIGHT_POWER_NULL = _t"\r"
STAR_SOUL_EXP			= _t"\r^ffff00经验 ^00ff00%d^f2f3f2/%d\r"
STAR_SOUL_LEV			= _t"^ffff00等级 ^00ff00%d^f2f3f2         "
STAR_SOUL_LEV_EXP1		= _t"等级 %s%d"
STAR_SOUL_LEV_EXP2		= _t"                     经验 %s%d%s/%d\r"  
STAR_SOUL_CLASS			= {
	[0]	="",
	[1]	=_t"护盾",
	[2]	=_t"神速",
	[3]	=_t"蛮力",
	[4]	=_t"韧性",
	[5]	=_t"穿透",
	[6]	=_t"生命",
	[7]	="",
	[8]	="",
	[9]	="",
	[10]="",
}
STAR_SOUL_CLASS_HINT = _t"带有<%s>爆发属性的小宇宙中\r只能同时注入一个"

STAR_SOUL_COLOR={
	[1]	=_t"^ff0000【日相】^f2f3f2^O001",
	[2]	=_t"^0184ff【月相】^f2f3f2^O001",
	[3]	=_t"^ffff00【主序】^f2f3f2^O001",
}

--星魂盒
STAR_SOUL_BOX_DESC = _t"使用后获得%d级星魂:%s"


--套装
EQUIP_SUIT_TAG_DESC =
{
	[1]  = _t"I·格里芬之爪",
	[2]  = _t"II·金苹果",
    [3]  = _t"III·丰饶之角",
    [4]  = _t"IV·弥诺陶斯",
    [5]  = _t"V·塞壬之羽",
    [6]  = _t"VI·地狱之石",
    [7]  = _t"VII·梅杜莎",
    [8]  = _t"VIII·许德拉",
    [9]	 = _t"IX·力量之杯",
    [10] = _t"X·涅柔斯之环",
    [11] = _t"XI·桂冠",
    [12] = _t"XII·胜利之矛",
    [13] = _t"XIII·英雄",
    [14] = _t"XIV·复仇",
    [15] = _t"XV·泰坦之力",
    [16] = _t"XVIII·命运",
}

EQUIP_SUIT_TAG_DESC_TITLE = _t"灵纹：%s\r"
EQUIP_SUIT_TAG_DESC_TITLE1 = _t"灵纹：%s\r"
EQUIP_SUIT_TAG_DESC_STR1 = "[4]%s\r"
EQUIP_SUIT_TAG_DESC_STR2 = "[5]%s\r"
EQUIP_SUIT_TAG_DESC_STR3 = "[6]%s\r"

--宠物装备
ITEM_COMBATPET_EQUIP_DESC = {}
ITEM_COMBATPET_EQUIP_DESC["DESC"] = _t"守护星专用装备\r"
ITEM_COMBATPET_EQUIP_DESC["Part_Type_Head"] = _t"装备部位 战盔\r"
ITEM_COMBATPET_EQUIP_DESC["Part_Type_Hair"] = _t"装备部位 战靴\r"
ITEM_COMBATPET_EQUIP_DESC["Part_Type_Body"] = _t"装备部位 战甲\r"
ITEM_COMBATPET_EQUIP_DESC["Gender_Male"] = _t"性别限制 男\r"
ITEM_COMBATPET_EQUIP_DESC["Gender_Female"] = _t"性别限制 女\r"
ITEM_COMBATPET_EQUIP_DESC["Gender_None"] = _t"性别限制 无\r"
ITEM_COMBATPET_EQUIP_DESC["LevelReq"] = _t"要求等级:%d\r"
ITEM_COMBATPET_EQUIP_DESC["Attack"] = _t"攻击力 %d\r"
ITEM_COMBATPET_EQUIP_DESC["ElementAttack"] = _t"属性攻击力 %d\r"
ITEM_COMBATPET_EQUIP_DESC["Hit"] = _t"命中 %d\r"
ITEM_COMBATPET_EQUIP_DESC["Critical"] = _t"暴击率 %d%%\r"
ITEM_COMBATPET_EQUIP_DESC["Power"] = _t"★战力 %-5d\r"
ITEM_COMBATPET_EQUIP_DESC["Aptitude"] = _t"资质 %d\r"
ITEM_COMBATPET_EQUIP_DESC["AddonDesc"] = _t"增加人物属性\r"
ITEM_COMBATPET_EQUIP_DESC["Addon1"] = _t"  %s\r"
ITEM_COMBATPET_EQUIP_DESC["Addon2"] = _t"  %s\r"
ITEM_COMBATPET_EQUIP_DESC["Addon3"] = _t"  %s\r"
ITEM_COMBATPET_EQUIP_DESC["Addon4"] = _t"  %s\r"

--宠物技能书
ITEM_PET_SKILL_BOOK_DESC = {}
ITEM_PET_SKILL_BOOK_DESC["Slot"] = _t"放入技能格\r%s\r"
ITEM_PET_SKILL_BOOK_DESC["Skill_Name"] = _t"附带技能:%s"
ITEM_PET_SKILL_BOOK_DESC["Skill_Level"] = _t"%d级\r"

--宠物
ITEM_COMBATPET_DESC = {}
ITEM_COMBATPET_DESC["Max_Level"] = _t"等级上限:%s\r"
ITEM_COMBATPET_DESC["Aptitude"] = _t"当前资质:%d\r"
ITEM_COMBATPET_DESC["Max_Aptitude"] = _t"最大资质:%d\r"
ITEM_COMBATPET_DESC["Gender_Male"] = _t"性别:男\r"
ITEM_COMBATPET_DESC["Gender_Female"] = _t"性别:女\r"
ITEM_COMBATPET_DESC["Max_Skill_Slots"] = _t"技能格数:%d\r"
ITEM_COMBATPET_DESC["Damage"] = _t"攻击力:%d\r"
ITEM_COMBATPET_DESC["ElementDamage"] = _t"全属性攻击力:%d\r"
ITEM_COMBATPET_DESC["Hit"] = _t"命中:%d\r"
ITEM_COMBATPET_DESC["Critical"] = _t"暴击率:%d%%\r"
ITEM_COMBATPET_DESC["Equip1"] = _t"战盔:%s\r"
ITEM_COMBATPET_DESC["Equip2"] = _t"战靴:%s\r"
ITEM_COMBATPET_DESC["Equip3"] = _t"战甲:%s\r"
ITEM_COMBATPET_DESC["Skill_Name"] = _t"技能:%s"
ITEM_COMBATPET_DESC["Skill_Level"] = _t"%d级\r"
ITEM_COMBATPET_DESC["Player_Level_Req"] = _t"人物等级要求:%s\r"


--任务随机发生器临时数据
ITEM_TASK_TRIG_DESC = {}
ITEM_TASK_TRIG_DESC["TITLE"] = _t"%s打开后获得：\r%s银河狂欢币*5\r"
ITEM_TASK_TRIG_DESC["EXP"]   = _t"经验：%.0f\r"
ITEM_TASK_TRIG_DESC["STORE_EXP"]   = _t"储存经验：%.0f\r"
ITEM_TASK_TRIG_DESC["EXP2"]   = _t"历练：%.0f\r"
ITEM_TASK_TRIG_DESC["STORE_EXP2"]   = _t"储存历练：%.0f\r"
ITEM_TASK_TRIG_DESC["BIND_MONEY"]   = _t"金券：%d\r"
ITEM_TASK_TRIG_DESC["TASK_FINISH_COUNT"] = _t"还可以使用%d次\r"
ITEM_TASK_TRIG_DESC["TASK_TIME_LIMIT"] = _t"^FF0000一天后可继续使用^F2F3F2\r"

--神器
ITEM_ARTIFACT_DESC ={}
ITEM_ARTIFACT_DESC["POWER"] = _t"神力值: %d"
ITEM_ARTIFACT_DESC["UNIQUE"] = _t"唯一属性"
ITEM_ARTIFACT_DESC["STATE"] = _t"境界属性"
ITEM_ARTIFACT_DESC["STATE_1"] = _t"青铜之境: %d/%d级"
ITEM_ARTIFACT_DESC["STATE_2"] = _t"白银之境: %d/%d级"
ITEM_ARTIFACT_DESC["STATE_3"] = _t"黄金之境: %d/%d级"
ITEM_ARTIFACT_DESC["STATE_4"] = _t"神圣之境: %d/%d级"
ITEM_ARTIFACT_DESC["STATE_5"] = _t"完美之境: %d/%d级"
ITEM_ARTIFACT_DESC["UNACTIVE"] = _t"(神力值达到%d后激活)"
ITEM_ARTIFACT_DESC["SKILL"] = _t"神器技能"

--灵魂之甲
ITEM_SOULARMOR_GEM = {}
ITEM_SOULARMOR_GEM.StrAddon     =   _t"宝石属性\r%s\r"
ITEM_SOULARMOR_GEM.StrNextAddon =   _t"下一级:%s%s\r"
ITEM_SOULARMOR_GEM.StrExp       =   _t"附带经验：%d/%d\r"
ITEM_SOULARMOR_GEM.FullLev      =   _t"已满级\r"

SOULARMOR_DESC = {}
SOULARMOR_DESC.NAME_LEV_ACTIVE  =   _t"%s\r铠甲等级%d级"
SOULARMOR_DESC.NAME_LEV         =   _t"%s\r^FF0000未激活"
SOULARMOR_DESC.ADDON_PACK       =   _t"附带属性\r%s"
SOULARMOR_DESC.GEM_EMBED        =   _t"宝石镶嵌（最高等级%d级）"
SOULARMOR_DESC.GEM_INFO         =   _t"%s%s+%d"
SOULARMOR_DESC.GEM_EMPTY        =   _t"^FFFFFF空"
SOULARMOR_DESC.NEXT_PLAYER_LEV  =   _t"下一级\r等级%d需要等级：%s"
SOULARMOR_DESC.NEXT_ADDON_PACK  =   _t"等级%d附带:\r%s"
SOULARMOR_DESC.NEXT_GEM_NUM     =   _t"下级最多镶嵌灵魂宝石%d颗，最高等级%d级"

SOULARMOR_GEM_DESC_EXTRA_OTHER  = _t"可以镶嵌除冥王星外的所有宝石,同种宝石只能镶嵌一颗"
SOULARMOR_GEM_DESC_EXTRA_ALL	= _t"可以镶嵌所有宝石,同种宝石只能镶嵌一颗"
