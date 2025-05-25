-- 将模块赋予一个本地别名 
local WFItemDesc = ModUtility
local Format = string.format
local Gsub	 = string.gsub
local Concat = table.concat
local Insert = table.insert
local ItemExtDesc = ItemExtDesc
local ItemColor = ItemColor
local Len = string.len



-- 物品类型对应值 
-- 保留物品
local ICID_ITEM							= -100
local ICID_ERRORITEM 					= 0
local ICID_EQUIP 						= 1
local ICID_VEHICLE						= 2
local ICID_LOTTERY						= 3
local ICID_CHANGE_SHAPE					= 4
local ICID_SKILLMATTER					= 5
local ICID_MEDICINE						= 6
local ICID_RECIPEROLL					= 7
local ICID_TASKITEM						= 8
local ICID_TASKDICE						= 9
local ICID_STAR_SOUL_STONE				= 10	--星魂石
local ICID_ENHANCE_ITEM					= 11	--装备强化道具
local ICID_EQUIP_PROCESSING_ITEM		= 12	--装备加工道具
local ICID_STAR_SOUL_STONE_LEVEL_UP		= 13	--星魂石提升道具
local ICID_RECIPE						= 14
local ICID_MINE							= 15
local ICID_MATERIAL						= 16
local ICID_PET_GROWTH_STONE				= 17	--宠物成长度提升物品
local ICID_PET_FOOD						= 18
local ICID_PET_BEDGE					= 19
local ICID_PET_SKILL					= 20
local ICID_PET_SKILL_UP					= 21	--宠物技能提升物品	
local ICID_PET_APTITUDE_STONE			= 22	--宠物资质石头
local ICID_PET_CATCHER				 	= 23	--宠物捕捉道具
local ICID_GUARDIAN_STONE				= 24	--守护星
local ICID_EXTEND_ENHANCE_LIMIT_ITEM	= 25	--强化增加下限道具
local ICID_CLOTH_UPGRADE_ITEM			= 26	--星铸辅助道具
local ICID_STAR_SOUL					= 27	--星魂
local ICID_ASTROLOGY_ITEM				= 28	--占星道具
local ICID_VALUE_INCREASE_ITEM			= 29	--数值提升道具
local ICID_BOOK							= 30	--书籍
local ICID_STAR_SOUL_BOX 				= 31	--星魂盒
local ICID_DRIFT_BOTTLE					= 32	--漂流瓶
local ICID_COMBATPET					= 33	--战斗宠
local ICID_PET_SKILLBOOK				= 34	--战斗宠物技能书
local ICID_COMBATPET_EQUIP				= 35	--战斗宠装备
local ICID_PET_EGG						= 36	--宠物蛋
local ICID_RELIC						= 39 	--神器
local ICID_SOUL_ARMOR_GEM				= 43    --灵魂宝石

-- 待定物品
local ICID_DOUBLEEXP 					= 100
local ICID_COUPLE_JUMPTO				= 101
local ICID_REFINETICKET					= 102
local ICID_ESTONE						= 103
local ICID_SSTONE						= 104
local ICID_TALISMAN_EXPFOOD				= 105
local ICID_TALISMAN_MERGEKATALYST		= 106
local ICID_TALISMAN_ENERGYFOOD			= 107
local ICID_TEXT_FIREWORK				= 108
local ICID_FIREWORK						= 109
local ICID_REVSCROLL					= 110
local ICID_SPAKER						= 111
local ICID_LUCKYROLL					= 112
local ICID_SUMMON_MONSTER				= 113
local ICID_AI_HELPER					= 114
local ICID_TRADE_ITEM					= 115
local ICID_MONEYBAG						= 116
local ICID_CAMRECORDER					= 117
local ICID_PET_REVIVE_ESSENCE			= 118
local ICID_FIRE_ESSENCE					= 119
local ICID_IDENTIFY_SCROLL_ESSENCE 		= 120
local ICID_TASKNMMATTER					= 121		
local ICID_AIRCRAFT						= 122
local ICID_TALISMAN_MAINPART			= 123
local ICID_SKILLTOME					= 124
local ICID_TOWNSCROLL					= 125
local ICID_TRANSMITROLL					= 126
		


local EQUIP_TYPE_WEAPON = 0		--	武器
local EQUIP_TYPE_ARMOR = 1		--	防具
local EQUIP_TYPE_FASHION = 2	--	时装
local EQUIP_TYPE_ORNAMENT = 3	--	饰品
local EQUIP_TYPE_WING = 4		--	翅膀
local EQUIP_TYPE_MAGIC = 5		--	法器
local EQUIP_TYPE_TOOL = 6		--	采集工具

local RUNE_TYPE_RUNE = 0		--	属性石（符文）
local RUNE_TYPE_STONE = 1		--	属性石（宝石）




-- 获取某类物品描述文本
LuaItemDesc = {}


-- 使用物品NPC寻路链接
function LuaItemDesc:UseGuideLink(tid)
    local id = ItemTrack[tid]
    if id then
       GameApi.RouteTo(id) 
    end
    return true
end

function LuaItemDesc:GetGuideLink(tid)
    local npcId = ItemTrack[tid]
    if not npcId then
        return
    end
    local pos = TemplPos:GetPos(npcId)   
    if not pos then
        return
    end
    local name = GameApi.GetSenceObjName(npcId)
    if name then
        return Format(ITEM_GUIDE_LINK_DESC.LINK,ITEM_COLOR_DESC.Green ,name)
    end
end


-- 获得物品链接名
function LuaItemDesc:GetItemLinkName(icid, tab)
    if icid == ICID_EQUIP then
         if tab.refine_level > 0 then
             return Format(STRING_TABLE.EQUIP_NAME, tab.name, tab.refine_level)
         end
    end
    return Format(STRING_TABLE.ITEM_NAME, tab.name)
end


-- 物品附加描述
function LuaItemDesc:GetItemExtDesc(tid)
    return ItemExtDesc[tid] 
end


-- 物品颜色
local CustomTable = 
{
    COLOR_WHITE, COLOR_PURPLE, COLOR_BLUE, COLOR_ORANGE, COLOR_GREEN, 
    COLOR_RED, COLOR_DARKGOLD, COLOR_GRAY, COLOR_YELLOW, COLOR_CYANINE, 
}
local QualityTable= 
{
    QUALITY_COLOR_0, QUALITY_COLOR_1, QUALITY_COLOR_2, QUALITY_COLOR_3, QUALITY_COLOR_4, 
    QUALITY_COLOR_5, QUALITY_COLOR_6, QUALITY_COLOR_7, QUALITY_COLOR_8, QUALITY_COLOR_9,
}
function LuaItemDesc:GetItemColor(tid, quality)
    if ItemColor[tid] then
        local idx = ItemColor[tid] + 1
        return CustomTable[idx]
    elseif quality then
        local idx = quality + 1
        return QualityTable[idx]
    end
    return QUALITY_COLOR_0
end



-- 武器强化颜色
local EnhanceColorTable =
{
    0xff000000, 0xff000000, 0xff000000, 0xff000f00, 0xff000f00,
    0xff000f00, 0xff000033, 0xff000033, 0xff000033, 0xff32012c,
    0xff32012c, 0xffffff00, 0xffffff00, 0xffffff00, 0xffffff00,
}
function LuaItemDesc:GetWeaponEnhanceColor(level)
    if level > 0 and level < 16 then
        return EnhanceColorTable[level];
    end
    return 0xff000000;
end


-- 物品图标高亮索引
function LuaItemDesc:GetItemHighLightIdx(tid)
    return ItemColor[tid] or 0
end



---------------------------
-- 物品悬浮提示
local FilterNewLine = glb_FilterNewLine
local CONTEXT_DEFAULT = 0 	--	普通

function LuaItemDesc:GetItemDesc(icid, tab)    
    if not tab.context then
        tab.context = CONTEXT_DEFAULT
    end
	local ret, base, list = pcall(self.GetBaseDesc, self, icid, tab)	    
    if ret and base then
        --去掉末尾的\r
        base = FilterNewLine(base)
        for i, line in ipairs(list or {}) do
            list[i] = FilterNewLine(line)
        end
    else
        -- 错误信息输出到"EC.log"
        GlobalApi.Log(base)
        return "", {}
    end 
    list = list or {}
    
    -- 物品附加说明
    local ext = ItemExtDesc[tab.id]
    if ext and string.len(ext) > 0 then 
        Insert(list, format_string:parse(ext or ""))       
    end  
    
    -- 分解信息
	local decompse = WFItemDesc.GetDeCompseText(tab)
	if decompse ~= "" then
	    Insert(list, decompse)
	end
	
    -- 物品附加NPC链接
    local guide = self:GetGuideLink(tab.id)
    if guide and string.len(guide) > 0 then
        Insert(list, guide)
    end   
	return base, list
end



local ItemFuncTable = 
{
[ICID_RECIPEROLL] 					= "GetRecipeDesc",
[ICID_SKILLMATTER]					= "GetSkillmatter",
[ICID_EQUIP]						= "GetEquipDesc",
[ICID_MEDICINE]						= "GetMedicineDesc",
[ICID_CHANGE_SHAPE]					= "GetChangeShapeDesc",
[ICID_PET_BEDGE]					= "GetPetBedgeDesc",
[ICID_LOTTERY]						= "GetLotteryDesc",
[ICID_VEHICLE]						= "GetVehicleDesc",
[ICID_PET_FOOD]						= "GetPetFoodDesc",
[ICID_PET_SKILL]					= "GetPetSkillDesc",
[ICID_TASKITEM]						= "GetTaskitem",
[ICID_TASKDICE]						= "GetTaskDice",
[ICID_STAR_SOUL_STONE]				= "GetSoulStone",
[ICID_PET_APTITUDE_STONE]			= "GetPetApttStone",
[ICID_PET_SKILL_UP]					= "GetPetSkillUp",
[ICID_STAR_SOUL_STONE_LEVEL_UP]		= "GetStarSoulStoneLvlUp",
[ICID_PET_GROWTH_STONE]				= "GetPetGrowthStone",
[ICID_PET_CATCHER]					= "GetPetCatcher",
[ICID_GUARDIAN_STONE]				= "GetGuardStone",
[ICID_EXTEND_ENHANCE_LIMIT_ITEM]    = "GetExtendEnhanceLimitItem",
[ICID_STAR_SOUL]					= "GetStarSoul",
[ICID_STAR_SOUL_BOX]				= "GetStarSoulBox",
[ICID_COMBATPET]					= "GetCombatPetDesc",
[ICID_PET_SKILLBOOK]				= "GetSkillBookDesc",
[ICID_COMBATPET_EQUIP]				= "GetCombatEquipDesc",
[ICID_RELIC]						= "GetArtifactDesc",
[ICID_SOUL_ARMOR_GEM]				= "GetSoulArmorGem",
}

local CONTEXT_BOOTH_BUY		= 2			--	摆摊购买


function LuaItemDesc:GetBaseDesc(icid, tab)
    if tab.context == CONTEXT_BOOTH_BUY then
        return LuaItemDesc:GetBaseItemDesc(tab)
    end 
    local funcName = ItemFuncTable[icid]
    if funcName and self[funcName] then
        return self[funcName](self, tab)
    end
    return LuaItemDesc:GetBaseItemDesc(tab)
end




--基本类物品描述 
function LuaItemDesc:GetBaseItemDesc(tab)
    local strTitleList = {}
    -- 名字和数量 	
	Insert(strTitleList, WFItemDesc.GetNameCountText(tab))			
    
    local strDescList = {}
	-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab))
	-- 最大携带上限
	Insert(strDescList, WFItemDesc.GetMaxHoldText(tab))
    -- 物品状态描述     
    Insert(strDescList, WFItemDesc.GetProcMask(tab))		
	-- 绑定状态 	
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))			
	-- 价格描述
	Insert(strDescList, WFItemDesc.GetContextPriceText(tab))

	return Concat(strTitleList), strDescList
end

--配方卷轴物品描述
function LuaItemDesc:GetRecipeDesc(tab)    
	local strTitleList = {}
	-- 名字和数量 	
	Insert(strTitleList, WFItemDesc.GetNameCountText(tab))
	
	local strDescList = {}		
	-- 是否已学会 	
	Insert(strDescList, WFItemDesc.GetLearnedText(tab))				
	-- 配方归属生活技能和配方等级
	Insert(strDescList, WFItemDesc.GetRecipeText(tab))
	--学习要求玩家等级
	Insert(strDescList, WFItemDesc.GetRecipePlayerLev(tab))
    --学习消耗经验 	
    Insert(strDescList, WFItemDesc.GetRecipeExp(tab))
	--学习消耗金钱 	
	Insert(strDescList, WFItemDesc.GetRecipePlayerCoin(tab))			
	-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab))	
	-- 最大携带上限
	Insert(strDescList, WFItemDesc.GetMaxHoldText(tab))
    -- 物品状态描述     
    Insert(strDescList, WFItemDesc.GetProcMask(tab) )			
	-- 绑定状态 	
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab) )	
	-- 价格描述
	Insert(strDescList, WFItemDesc.GetContextPriceText(tab) )	

	return Concat(strTitleList),strDescList
end


--药品
function LuaItemDesc:GetMedicineDesc(tab)
    local strTitleList = {}	
	-- 名字和数量 	
	Insert(strTitleList, WFItemDesc.GetNameCountText(tab) )
	
    local strDescList = {}	
	-- 等级要求
	Insert(strDescList, WFItemDesc.GetReqLevel(tab) )	
	-- 冷却时间
	Insert(strDescList, WFItemDesc.GetColddownTime(tab) )
	-- 剩余冷却时间_大世界 	
	Insert(strDescList, WFItemDesc.GetExpireColddownTime(tab) )
	-- 应用区域
	-- Insert(strDescList, WFItemDesc.GetValidArea(tab) )	
	-- 药品类型
	Insert(strDescList, WFItemDesc.GetMedicineType(tab) )	
	-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab) )	
	-- 最大携带上限
	Insert(strDescList, WFItemDesc.GetMaxHoldText(tab))		
    -- 物品状态描述     
    Insert(strDescList, WFItemDesc.GetProcMask(tab) )	
	-- 绑定状态 
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab) )
	-- 价格描述
	Insert(strDescList, WFItemDesc.GetContextPriceText(tab) )

	return Concat(strTitleList), strDescList
end	


--技能物品 
function LuaItemDesc:GetSkillmatter(tab)
  	local strDescTitleList = {}
  	-- 名字和数量 	
	Insert(strDescTitleList, WFItemDesc.GetNameCountText(tab))	
	-- 等级要求
	Insert(strDescTitleList, WFItemDesc.GetReqLevel(tab, true))
  	
  	local strDescList = {}
	-- 冷却时间
	Insert(strDescList, WFItemDesc.GetColddownTime(tab))
	-- 剩余冷却时间_大世界 	
	Insert(strDescList, WFItemDesc.GetExpireColddownTime(tab))		
	-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab))
	-- 最大携带上限
	Insert(strDescList, WFItemDesc.GetMaxHoldText(tab))
    -- 物品状态描述     
    Insert(strDescList, WFItemDesc.GetProcMask(tab))
	-- 绑定状态 	
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))
	-- 价格描述
	Insert(strDescList, WFItemDesc.GetContextPriceText(tab))
	
	return Concat(strDescTitleList), strDescList
end


--装备
function LuaItemDesc:GetEquipDesc(tab)    
	local strTitleList = {}
    -- 装备名字显示相关
    Insert(strTitleList, WFItemDesc.GetEquipNameText(tab))    
     -- 战斗力
    Insert(strTitleList, WFItemDesc.GetEquipFightPower(tab))
    
    local strAttributeList = {}
    Insert(strAttributeList, {})
    -- 攻击力 	
    Insert(strAttributeList, WFItemDesc.GetEquipMaxattack(tab))
    -- 防御力 	
    Insert(strAttributeList, WFItemDesc.GetEquipDefence(tab))
	-- 生命值 	
	Insert(strAttributeList, WFItemDesc.GetEquipMaxhp(tab))	
	-- 魔法值 	
	Insert(strAttributeList, WFItemDesc.GetEquipMaxmp(tab))
	-- 基础属性点
	Insert(strAttributeList, WFItemDesc.GetEquipBaseProp(tab))	
	-- 属性攻
	Insert(strAttributeList, WFItemDesc.GetEquipElementDmg(tab))  
    -- 装备部位
	Insert(strAttributeList, WFItemDesc.GetEquipPos(tab))
	-- 攻击距离
	Insert(strAttributeList, WFItemDesc.GetEquipAtkDistance(tab))
	-- 性别限制
    Insert(strAttributeList, WFItemDesc.GetReqGender(tab))
	-- 等级要求
	Insert(strAttributeList, WFItemDesc.GetReqLevel(tab))
	-- 意志等级要求（小宇宙等级）
	Insert(strAttributeList, WFItemDesc.GetReqWillPowerLevel(tab))
	-- 小宇宙等级要求
	Insert(strAttributeList, WFItemDesc.GetReqCosmosLevel(tab))	
	-- 装备限制
	Insert(strAttributeList, WFItemDesc.GetEquipReqNameText(tab))
	-- 装备耐久度 	
    Insert(strAttributeList, WFItemDesc.GetEndureText(tab))
    -- 分隔线
	Insert(strAttributeList, {})
	-- 鉴定属性相关 	
    Insert(strAttributeList, WFItemDesc.GetEquipAppraiseText(tab))
    -- 分隔线
	Insert(strAttributeList, {})
    -- 强化等级
	Insert(strAttributeList, WFItemDesc.GetRefineLevel(tab))
	-- 当前强化等级包说明文字 
	--Insert(strAttributeList, WFItemDesc.GetEnhanceStr(tab))
	-- 强化套装属性
	Insert(strAttributeList, WFItemDesc.GetEquipEnhanceSuitAddon(tab))
	--融合属性	
	Insert(strAttributeList, WFItemDesc.GetEquipEnhanceMergeText(tab))
	-- 加工属性相关	
	Insert(strAttributeList, WFItemDesc.GetEquipProcessText(tab))
    -- 分割线
   	Insert(strAttributeList, {})
    -- 套装标识
   	Insert(strAttributeList, WFItemDesc.GetSuitString(tab))
   	-- 套装是否可转移描述
   	Insert(strAttributeList, WFItemDesc.GetIsSuitTagMigratable(tab))
   	-- 分割线
	Insert(strAttributeList, {})	
	-- 剩余时间
	Insert(strAttributeList, WFItemDesc.GetExpireTimeText(tab))
	-- 最大携带上限
	Insert(strAttributeList, WFItemDesc.GetMaxHoldText(tab))
    -- 物品状态描述 	
    Insert(strAttributeList, WFItemDesc.GetProcMask(tab))	
	-- 绑定状态 	
	Insert(strAttributeList, WFItemDesc.GetBoundStateText(tab))
	-- 是否可拆分 
	Insert(strAttributeList, WFItemDesc.GetComposeText(tab))
	-- 价格描述
	Insert(strAttributeList, WFItemDesc.GetContextPriceText(tab))

	return Concat(strTitleList), strAttributeList
end


-- 变身类物品描述 
function LuaItemDesc:GetChangeShapeDesc(tab)
    local strDescList = {}	
	-- 名字和数量 	
	Insert(strDescList, WFItemDesc.GetNameCountText(tab))		
	--等级要求
	Insert(strDescList, WFItemDesc.GetReqLevel(tab))	
	--使用次数
	Insert(strDescList, Format(ITEM_USE_TIMES_DESC.UseTimes,tab.use_times))	
	--有效期 
	Insert(strDescList, WFItemDesc.GetValidTimeText(tab))
	-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab))
	-- 最大携带上限
	Insert(strDescList, WFItemDesc.GetMaxHoldText(tab))
	-- 物品状态描述 	
	Insert(strDescList, WFItemDesc.GetProcMask(tab))		
	-- 绑定状态 
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))
	-- 价格描述
	Insert(strDescList, WFItemDesc.GetContextPriceText(tab))

	return Concat(strDescList)
end


--魔宠牌类物品描述
function LuaItemDesc:GetPetBedgeDesc(tab)
    local strDescList = {}
	
	-- 名字和数量 
	Insert(strDescList, WFItemDesc.GetNameCountText(tab))	
	--宠物名字
	Insert(strDescList, WFItemDesc.GetPetName(tab))
	--等级
	Insert(strDescList, WFItemDesc.GetBountyLevel(tab))		
	--携带宠物等级要求
	Insert(strDescList, WFItemDesc.GetTakeBountyReqLevel(tab))
	
	--查看宠物评分
	Insert(strDescList, WFItemDesc.GetBountyScore(tab))
	--查看宠物属性
	Insert(strDescList, WFItemDesc.GetBountyProp(tab))
	--查看宠物技能
	Insert(strDescList, WFItemDesc.GetBountySkill(tab))

	
				
--	--雇主
--	Insert(strDescList, WFItemDesc.GetEmployersName(tab))
--	--声望要求
--	Insert(strDescList, WFItemDesc.GetBountyReqPrestige(tab))
--	-- 魔宠评分
--	Insert(strDescList, WFItemDesc.GetBountyPoint(tab))
--	--魔宠生命值 
--	Insert(strDescList, WFItemDesc.GetBountyMaxhp(tab))
--	--魔宠生命值成长率
--	Insert(strDescList, WFItemDesc.GetBountyText(ITEM_BOUNTY_DESC.BountyHPGrow,tab.bounty_hp_grow))
--	--魔宠魔法值 
--	Insert(strDescList, WFItemDesc.GetBountyMaxmp(tab))
--	--魔宠魔法值成长率
--	Insert(strDescList, WFItemDesc.GetBountyText(ITEM_BOUNTY_DESC.BountyMPGrow,tab.bounty_mp_grow))
--	--魔宠攻击
--	Insert(strDescList, WFItemDesc.GetBountyAttackMax(tab))	
--	--魔宠攻击成长率 
--	Insert(strDescList, WFItemDesc.GetBountyText(ITEM_BOUNTY_DESC.BountyAttackGrow,tab.bounty_attack_grow))
--	--魔宠防御
--	Insert(strDescList, WFItemDesc.GetBountyText(ITEM_BOUNTY_DESC.BountyDefense,tab.bounty_defense))
--	--魔宠防御成长率
--	Insert(strDescList, WFItemDesc.GetBountyText(ITEM_BOUNTY_DESC.BountyDefenseGrow,tab.bounty_defense_grow)) 
--	-- 剩余时间
--	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab) )
--	--是否修炼
--	Insert(strDescList, WFItemDesc.GetBountyTrain(tab))
--  --魔宠强特性1
--	Insert(strDescList, WFItemDesc.GetBountyTraitMax1(tab))
--  --魔宠强特性2
--	Insert(strDescList, WFItemDesc.GetBountyTraitMax2(tab))
--  --魔宠弱特性1
--	Insert(strDescList, WFItemDesc.GetBountyTraitMin1(tab))
--  --魔宠弱特性2
--	Insert(strDescList, WFItemDesc.GetBountyTraitMin2(tab))
--  --魔宠攻击天赋
--	Insert(strDescList, WFItemDesc.GetBountyAttackTalent(tab))
--  --魔宠防御天赋
--	Insert(strDescList, WFItemDesc.GetBountyDefenseTalent(tab)	)
--  --魔宠生命天赋
--	Insert(strDescList, WFItemDesc.GetBountyHPTalent(tab))
--	-- 魔宠技能1
--	if (tab.bounty_skill1) then
--		Insert(strDescList, string.format(ITEM_COLOR_DESC.LightBlue)..WFItemDesc.GetBountySkill(tab.bounty_skill1).. string.format(ITEM_COLOR_DESC.White))
--	end
--	-- 魔宠技能2
--	if (tab.bounty_skill2) then
--		Insert(strDescList, string.format(ITEM_COLOR_DESC.LightBlue)..WFItemDesc.GetBountySkill(tab.bounty_skill2).. string.format(ITEM_COLOR_DESC.White))
--	end
--	-- 魔宠技能3
--	if (tab.bounty_skill3) then
--		Insert(strDescList, string.format(ITEM_COLOR_DESC.LightBlue)..WFItemDesc.GetBountySkill(tab.bounty_skill3).. string.format(ITEM_COLOR_DESC.White))
--	end	
--	-- 魔宠技能4
--	if (tab.bounty_skill4) then
--		Insert(strDescList, string.format(ITEM_COLOR_DESC.LightBlue)..WFItemDesc.GetBountySkill(tab.bounty_skill4).. string.format(ITEM_COLOR_DESC.White))
--	end	
--	-- 魔宠技能5
--	if (tab.bounty_skill5) then
--		Insert(strDescList, string.format(ITEM_COLOR_DESC.LightBlue)..WFItemDesc.GetBountySkill(tab.bounty_skill5).. string.format(ITEM_COLOR_DESC.White))
--	end
--	-- 魔宠技能6
--	if (tab.bounty_skill6) then
--		Insert(strDescList, string.format(ITEM_COLOR_DESC.LightBlue)..WFItemDesc.GetBountySkill(tab.bounty_skill6).. string.format(ITEM_COLOR_DESC.White))
--	end
--	-- 魔宠技能7
--	if (tab.bounty_skill7) then
--		Insert(strDescList, string.format(ITEM_COLOR_DESC.LightBlue)..WFItemDesc.GetBountySkill(tab.bounty_skill7).. string.format(ITEM_COLOR_DESC.White))
--	end
--	-- 魔宠技能8
--	if (tab.bounty_skill8) then
--		Insert(strDescList, WFItemDesc.GetBountySkill(tab.bounty_skill8))
--	--end
--	-- 剩余时间
--	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab))

	-- 最大携带上限
	Insert(strDescList, WFItemDesc.GetMaxHoldText(tab))
	-- 物品状态描述 
	Insert(strDescList, WFItemDesc.GetProcMask(tab))				
	-- 绑定状态 
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))
	--是否死亡
	Insert(strDescList, WFItemDesc.GetBountyDead(tab))	
	-- 价格描述
	Insert(strDescList, WFItemDesc.GetContextPriceText(tab))

	return Concat(strDescList)
end
	
	
--交通工具 
function LuaItemDesc:GetVehicleDesc(tab)
	local strTitleDescList = {}
	-- 名字和数量 	
	Insert(strTitleDescList, WFItemDesc.GetNameCountText(tab))
	--等级要求
	Insert(strTitleDescList, WFItemDesc.GetReqLevel(tab))
	
	local strDescList = {} 
	--是否多人骑乘
	Insert(strDescList, WFItemDesc.GetMoreSeaterRides(tab))	
	--是否可进行攻击 
	Insert(strDescList, WFItemDesc.GetRidesAttack(tab))
	--移动速度
	Insert(strDescList, WFItemDesc.GetMoveSpeed(tab))
	--飞行速度
	Insert(strDescList, WFItemDesc.GetFlyMoveSpeed(tab))	
	-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab))
	-- 最大携带上限
	Insert(strDescList, WFItemDesc.GetMaxHoldText(tab))		
	-- 物品状态描述 	
	Insert(strDescList, WFItemDesc.GetProcMask(tab) )	
	-- 绑定状态 
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))
	-- 价格描述
	Insert(strDescList, WFItemDesc.GetContextPriceText(tab))
	
	return Concat(strTitleDescList), strDescList
end	


--彩票
function LuaItemDesc:GetLotteryDesc(tab)    
	local strDescList = {} 
	
	-- 名字和数量 	
	Insert(strDescList, WFItemDesc.GetNameCountText(tab))	
	-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab))
	-- 最大携带上限
	Insert(strDescList, WFItemDesc.GetMaxHoldText(tab))	
	-- 物品状态描述 	
	Insert(strDescList, WFItemDesc.GetProcMask(tab))	
	-- 绑定状态 
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))
	-- 价格描述
	Insert(strDescList, WFItemDesc.GetContextPriceText(tab))

	return Concat(strDescList)
end	


--宠物技能卷轴 
function LuaItemDesc:GetPetSkillDesc(tab)
	local strDescList = {} 
	
	-- 名字和数量 	
	Insert(strDescList, WFItemDesc.GetNameCountText(tab))	
	-- 宠物卷轴标识
	--Insert(strDescList, WFItemDesc.GetPetSkillTagDesc(tab))
	
	--宠物等级限制
	--Insert(strDescList, WFItemDesc.GetBountyReqLevel(tab))	
	
	--宠物携带等级限制
	Insert(strDescList, WFItemDesc.GetPetSummonReqLevel(tab))
	--适用近远程限制
	Insert(strDescList, WFItemDesc.GetPetSkillType(tab))
	--宠物技能成功率 
	Insert(strDescList, WFItemDesc.GetPetSkillLearnProb(tab))	
	--宠物技能信息
	Insert(strDescList, WFItemDesc.GetPetSkillInfo(tab))
		-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab))
	-- 最大携带上限
	Insert(strDescList, WFItemDesc.GetMaxHoldText(tab))
	-- 物品状态描述 
	Insert(strDescList, WFItemDesc.GetProcMask(tab))	
	-- 绑定状态 
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))
	-- 价格描述
	Insert(strDescList, WFItemDesc.GetContextPriceText(tab))
	
	return Concat(strDescList)
end	



--任务道具
function LuaItemDesc:GetTaskitem(tab)
    local strDescTitleList = {}
    -- 名字和数量 	
	Insert(strDescTitleList, WFItemDesc.GetNameCountText(tab))
    
	local strDescList = {} 
	-- 物品状态描述 	
	Insert(strDescList, WFItemDesc.GetProcMask(tab))
	-- 绑定状态
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))
	-- 最大携带上限
	Insert(strDescList, WFItemDesc.GetMaxHoldText(tab))
	-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab))

	return Concat(strDescTitleList), strDescList
end	



----------------------------------------
--任务随机发生器
function LuaItemDesc:GetTaskDice(tab)
	local strTitleList = {}	
	-- 名字和数量 	
	Insert(strTitleList, WFItemDesc.GetNameCountText(tab) )
	
	local strDescList = {}
	-- 军团标记
	Insert(strDescList, WFItemDesc.GetTaskDiceLeagueDesc(tab) )					
	-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab) )	
	-- 最大携带上限
	Insert(strDescList, WFItemDesc.GetMaxHoldText(tab))
    -- 物品状态描述     
    Insert(strDescList, WFItemDesc.GetProcMask(tab) )			
	-- 绑定状态 	
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab) )	
	-- 价格描述
	Insert(strDescList, WFItemDesc.GetContextPriceText(tab) )	
	-- 错误信息
	Insert(strDescList, WFItemDesc.GetErrorText(tab) )
	-- 特殊物品显示逻辑
	Insert(strDescList, WFItemDesc.GetTaskExpText(tab))
	-- 任务随机发生器显示任务完成次数
	Insert(strDescList, WFItemDesc.GetTaskFinishCount(tab))	
	-- 特殊礼包根据声望id显示使用期限
	Insert(strDescList, WFItemDesc.GetTaskFinishDate(tab))	

	return Concat(strTitleList),strDescList
end	


--魔宠食品
function LuaItemDesc:GetPetFoodDesc(tab)
    local strDescTitleList = {}
    -- 名字和数量 
	Insert(strDescTitleList, WFItemDesc.GetNameCountText(tab))	
    -- 魔宠食品等级要求
    Insert(strDescTitleList, WFItemDesc.GetPetReqLevel(tab))
    
    local strDescList = {}  
    --魔宠食品类型
	Insert(strDescList, WFItemDesc.GetPetFoodType(tab))	
    -- 魔宠食品冷却时间
    Insert(strDescList, WFItemDesc.GetPetFoodColddownTime(tab))
	--魔宠食品剩余冷却时间
	Insert(strDescList, WFItemDesc.GetExpireColddownTime(tab))
		-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab))
	-- 最大携带上限
	Insert(strDescList, WFItemDesc.GetMaxHoldText(tab))
	-- 物品状态描述 	
	Insert(strDescList, WFItemDesc.GetProcMask(tab))	
	-- 绑定状态 	
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))
	-- 价格描述 
	Insert(strDescList, WFItemDesc.GetContextPriceText(tab))
	
	return Concat(strDescTitleList), strDescList
end




--星魂石 
function LuaItemDesc:GetSoulStone(tab)
    local strDescTitleList = {}
    -- 名字和数量 	
	Insert(strDescTitleList,  WFItemDesc.GetSoulStoneNameCountText(tab))
	-- 品质 	
	Insert(strDescTitleList,  WFItemDesc.GetSoulStoneQuality(tab))
    
    local strDescList = {}	
	-- 光泽度 	
	Insert(strDescList,  WFItemDesc.GetSoulStoneLight(tab))
	-- 附加属性 	
	Insert(strDescList,  WFItemDesc.GetSoulStoneAddon(tab))	
		-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab))
	-- 最大携带上限
	Insert(strDescList, WFItemDesc.GetMaxHoldText(tab))
	-- 物品状态描述 	
	Insert(strDescList, WFItemDesc.GetProcMask(tab))	
	-- 绑定状态 
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))
	-- 价格描述	
	Insert(strDescList,  WFItemDesc.GetContextPriceText(tab))
	
	return Concat(strDescTitleList), strDescList
end	


--宠物资质强化石
function LuaItemDesc:GetPetApttStone(tab)
    local strDescTitleList = {}
    -- 名字和数量 	
	Insert(strDescTitleList,  WFItemDesc.GetNameCountText(tab) )
	--宠物携带等级限制
	Insert(strDescTitleList, WFItemDesc.GetPetSummonLevelLimit(tab) )
    
    local strDescList = {}
		
	-- 资质提升量 	
	Insert(strDescList,  WFItemDesc.GetPetApttAdd(tab) )
	--成功率
	Insert(strDescList,  WFItemDesc.GetPetAptStoneSucProb(tab) )
		-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab))
	-- 最大携带上限
	Insert(strDescList, WFItemDesc.GetMaxHoldText(tab))
	-- 物品状态描述 	
	Insert(strDescList, WFItemDesc.GetProcMask(tab))	
	-- 绑定状态 
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))	
	-- 价格描述	
	Insert(strDescList,  WFItemDesc.GetContextPriceText(tab) )
	
	return Concat(strDescTitleList), strDescList
end	


--宠物技能提升石
function LuaItemDesc:GetPetSkillUp(tab)
    local strDescList = {}
    
	-- 名字和数量 	
	Insert(strDescList,  WFItemDesc.GetNameCountText(tab) )	
	
	--宠物等级限制
	--Insert(strDescList, WFItemDesc.GetBountyReqLevel(tab) )
	
	--宠物携带等级限制
	Insert(strDescList, WFItemDesc.GetPetSummonReqLevel(tab) )	
	-- 技能名和等级 	
	Insert(strDescList,  WFItemDesc.GetPetSkill(tab) )
	-- 成功率
	Insert(strDescList,  WFItemDesc.GetPetSkillUpProb(tab) )
		-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab))
	-- 最大携带上限
	Insert(strDescList, WFItemDesc.GetMaxHoldText(tab))	
	-- 物品状态描述 	
	Insert(strDescList, WFItemDesc.GetProcMask(tab))	
	-- 绑定状态 
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))
	-- 价格描述	
	Insert(strDescList,  WFItemDesc.GetContextPriceText(tab))
	
	return Concat(strDescList)
end	


--星魂石提升道具
function LuaItemDesc:GetStarSoulStoneLvlUp(tab)
   local strDescList = {}
   
	-- 名字和数量 	
	Insert(strDescList,  WFItemDesc.GetNameCountText(tab) )
	--星魂石提升道具描述
	Insert(strDescList, WFItemDesc.GetStarSoulStoneDesc(tab) )
		-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab))
	-- 最大携带上限
	Insert(strDescList, WFItemDesc.GetMaxHoldText(tab))
	-- 物品状态描述 	
	Insert(strDescList, WFItemDesc.GetProcMask(tab))	
	-- 绑定状态 
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))
	-- 价格描述	
	Insert(strDescList,  WFItemDesc.GetContextPriceText(tab))
	
	return Concat(strDescList) 
end


--宠物成长度提升道具
function LuaItemDesc:GetPetGrowthStone(tab)
    local strDescList = {}
    
	-- 名字和数量 	
	Insert(strDescList,  WFItemDesc.GetNameCountText(tab) )
	
--	--宠物携带等级限制
--	Insert(strDescList, WFItemDesc.GetPetSummonLevelLimit(tab) )

	--宠物成长度提升石描述
	Insert(strDescList, WFItemDesc.GetPetGrowthStoneDesc(tab) )
		-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab))
	-- 最大携带上限
	Insert(strDescList, WFItemDesc.GetMaxHoldText(tab))
	-- 物品状态描述 	
	Insert(strDescList, WFItemDesc.GetProcMask(tab))	
	-- 绑定状态 
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))
	-- 价格描述	
	Insert(strDescList,  WFItemDesc.GetContextPriceText(tab))
	
	return Concat(strDescList)
end

--宠物捕捉道具
function LuaItemDesc:GetPetCatcher(tab)
	local strDescList = {}
	-- 名字和数量 	
	Insert(strDescList,  WFItemDesc.GetNameCountText(tab) )
	--宠物捕捉道具的一些限制
	Insert(strDescList, WFItemDesc.GetPetCatcherLimit(tab) )
		-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab))
	-- 最大携带上限
	Insert(strDescList, WFItemDesc.GetMaxHoldText(tab))
	-- 物品状态描述 	
	Insert(strDescList, WFItemDesc.GetProcMask(tab))	
	-- 绑定状态 
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))
	-- 价格描述	
	Insert(strDescList,  WFItemDesc.GetContextPriceText(tab))
	return Concat(strDescList)
end


function LuaItemDesc:GetGuardStone(tab)
	local strDescList = {}
	
	-- 名字和数量 	
	Insert(strDescList,  WFItemDesc.GetNameCountText(tab) )
	--获取守护点数
	Insert(strDescList, WFItemDesc.GetGuardPoint(tab) )
	--获取可吸收星级上下限
	Insert(strDescList, WFItemDesc.GetUsableGuardLevel(tab) )
		-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab))
	
	-- 最大携带上限
	Insert(strDescList, WFItemDesc.GetMaxHoldText(tab))
	-- 物品状态描述 	
	Insert(strDescList, WFItemDesc.GetProcMask(tab))	
	-- 绑定状态 
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))
	-- 价格描述	
	Insert(strDescList,  WFItemDesc.GetContextPriceText(tab))
	return Concat(strDescList)
end


function LuaItemDesc:GetExtendEnhanceLimitItem(tab)
	local strDescList = {}
	-- 名字和数量 	
	Insert(strDescList,  WFItemDesc.GetNameCountText(tab) )	
		-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab))
	-- 最大携带上限
	Insert(strDescList, WFItemDesc.GetMaxHoldText(tab))
	-- 物品状态描述 	
	Insert(strDescList, WFItemDesc.GetProcMask(tab))	
	-- 绑定状态 
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))
	-- 价格描述	
	Insert(strDescList,  WFItemDesc.GetContextPriceText(tab))
	return Concat(strDescList)
end

function LuaItemDesc:GetCombatPetDesc(tab)
	local strDescList = {}

	return Concat(strDescList)
end

function LuaItemDesc:GetSkillBookDesc(tab)
	local strDescList = {}

	return Concat(strDescList)
end


function LuaItemDesc:GetCombatEquipDesc(tab)
	local strDescList = {}

	return Concat(strDescList)
end

--星魂
function LuaItemDesc:GetStarSoul(tab)
    local strTitleList = {}   
	-- 名字和数量
	Insert(strTitleList,  WFItemDesc.GetStarSoulNameCountText(tab))	
	-- 颜色
	Insert(strTitleList,  WFItemDesc.GetStarSoulColor(tab))
	-- 战斗力
	Insert(strTitleList,  WFItemDesc.GetStarSoulFightPower(tab))	
	
	local strDescList = {}
	Insert(strDescList,  WFItemDesc.GetStarSoulLevelExp(tab))
	-- 当前等级
	--Insert(strDescList,  Format(STAR_SOUL_LEV, tab.star_soul_lev))
	-- 主序类别
	--Insert(strDescList,  STAR_SOUL_CLASS[tab.conflict_id])
	-- 当前经验
	--Insert(strDescList,  Format(STAR_SOUL_EXP, tab.cur_exp, tab.lev_up_exp))
	-- 分隔线
	Insert(strDescList, {})	
    -- 附加属性
	Insert(strDescList,  WFItemDesc.GetStarSoulAddon(tab))	
	-- 分隔线
	Insert(strDescList, {})	
	-- 爆发属性说明
	Insert(strDescList, STAR_SOUL_BURST_DESC)	
	-- 爆发属性
	Insert(strDescList,  WFItemDesc.GetStarSoulBurstAddon(tab))	
	-- 爆发状态包
	Insert(strDescList,  WFItemDesc.GetStarSoulBurstBuff(tab))	

	if tab.star_soul_lev < tab.max_lev then
		Insert(strDescList, {})
		Insert(strDescList, Format(STAR_SOUL_NEXT_LEVEL,tab.star_soul_lev+1))

		Insert(strDescList, {})
		Insert(strDescList,  WFItemDesc.GetStarSoulAddon(tab,true))	

		Insert(strDescList, {})
		Insert(strDescList, STAR_SOUL_BURST_DESC)
		Insert(strDescList,  WFItemDesc.GetStarSoulBurstAddon(tab,true))
		Insert(strDescList,  WFItemDesc.GetStarSoulBurstBuff(tab,true))
	end
	
	-- 剩余时间
	local expireTime = WFItemDesc.GetExpireTimeText(tab)
	if expireTime and Len(expireTime)>0 then
		Insert(strDescList, {})
		Insert(strDescList, expireTime)
	end

--	-- 最大携带上限
--	Insert(strDescList, WFItemDesc.GetMaxHoldText(tab))
--	-- 物品状态描述
--	Insert(strDescList, WFItemDesc.GetProcMask(tab))		
--	-- 绑定状态
--	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))			
--	-- 价格描述
--	Insert(strDescList, WFItemDesc.GetContextPriceText(tab))
	
	-- 星魂冲突提示
	local conflictDesStr = WFItemDesc.GetConflictHint(tab)
	if conflictDesStr and Len(conflictDesStr) > 0 then
		Insert(strDescList, {})
		Insert(strDescList, WFItemDesc.GetConflictHint(tab))
	end
	
	return Concat(strTitleList),strDescList
end	

-- 星魂盒
function LuaItemDesc:GetStarSoulBox(tab)
	local strTitleList = {}
    -- 名字和数量 	
	Insert(strTitleList, WFItemDesc.GetNameCountText(tab))		
	
	local strDescList = {}
	--描述
	local starSoulInfo = tab.extraItem
	if starSoulInfo then
		Insert(strDescList,Format(STAR_SOUL_BOX_DESC,starSoulInfo.star_soul_lev,
			starSoulInfo.name))
	end
		-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab))
	-- 最大携带上限
	Insert(strDescList, WFItemDesc.GetMaxHoldText(tab))
	-- 物品状态描述
	Insert(strDescList, WFItemDesc.GetProcMask(tab))		
	-- 绑定状态
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))			
	-- 价格描述
	Insert(strDescList, WFItemDesc.GetContextPriceText(tab))
	return Concat(strTitleList),strDescList
end


-- 战斗宠物装备
function LuaItemDesc:GetCombatEquipDesc(tab)
	local strTitleList = {}
    -- 名字和数量 	
	Insert(strTitleList, WFItemDesc.GetNameCountText(tab))
	--宠物装备战力
	Insert(strTitleList, WFItemDesc.GetCombatpetEquipPowerValue(tab))		
	
	local strDescList = {}
	--描述
	--分割线
	Insert(strDescList, {})
	--宠物装备描述
	Insert(strDescList, WFItemDesc.GetCombatpetEquipDesc(tab))	
	--宠物装备攻击力
	Insert(strDescList, WFItemDesc.GetCombatpetEquipAttack(tab))
	--宠物装备属性攻击力
	Insert(strDescList, WFItemDesc.GetCombatpetEquipElementAttack(tab))
	--宠物装备命中
	Insert(strDescList, WFItemDesc.GetCombatpetEquipHit(tab))
	--宠物装备暴击
	Insert(strDescList, WFItemDesc.GetCombatpetEquipCritical(tab))
	--宠物资质
	Insert(strDescList, WFItemDesc.GetCombatpetEquipAptitude(tab))
	--分割线
	Insert(strDescList, {})
	--要求等级
	Insert(strDescList, WFItemDesc.GetCombatpetEquipLevelReq(tab))
	--宠物装备部位
	Insert(strDescList, WFItemDesc.GetCombatpetEquipPartType(tab))
	--宠物装备性别要求
	Insert(strDescList, WFItemDesc.GetCombatpetEquipGender(tab))
	
	--分割线
	Insert(strDescList, {})
	--增加人物属性
	Insert(strDescList, WFItemDesc.GetCombatpetEquipAddon(tab))
	--分割线
	Insert(strDescList, {})
	--最大持有数量
	Insert(strDescList, WFItemDesc.GetMaxHoldText(tab))
	-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab))
	-- 物品状态描述 	
	Insert(strDescList, WFItemDesc.GetProcMask(tab))		
	-- 绑定状态 
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))
	-- 价格描述
	Insert(strDescList, WFItemDesc.GetContextPriceText(tab))

	return Concat(strTitleList),strDescList
end

-- 战斗宠物
function LuaItemDesc:GetCombatPetDesc(tab)
	local strTitleList = {}
    -- 名字和数量 	
	Insert(strTitleList, WFItemDesc.GetNameCountText(tab))		

	local strDescList = {}
	--宠物性别
	Insert(strDescList, WFItemDesc.GetCombatpetGender(tab))	
	--需要人物等级
	Insert(strDescList, WFItemDesc.GetCombatpetReqLevel(tab))
	--宠物最大等级
	Insert(strDescList, WFItemDesc.GetCombatpetMaxLevel(tab))
	--技能格数量
	Insert(strDescList, WFItemDesc.GetCombatpetMaxSkillSlots(tab))
	--分割线
	Insert(strDescList, {})
	--当前资质
	Insert(strDescList, WFItemDesc.GetCombatpetAptitude(tab))
	--最大资质
	Insert(strDescList, WFItemDesc.GetCombatpetMaxAptitude(tab))
	--分割线
	Insert(strDescList, {})
	--宠物攻击力
	Insert(strDescList, WFItemDesc.GetCombatpetDamage(tab))
	--宠物属性攻击力
	Insert(strDescList, WFItemDesc.GetCombatpetElementDamage(tab))
	--宠物命中
	Insert(strDescList, WFItemDesc.GetCombatpetHit(tab))
	--宠物暴击
	Insert(strDescList, WFItemDesc.GetCombatpetCritical(tab))
	--分割线
	Insert(strDescList, {})
	--宠物装备
	Insert(strDescList, WFItemDesc.GetCombatpetEquip1(tab))
	Insert(strDescList, WFItemDesc.GetCombatpetEquip2(tab))
	Insert(strDescList, WFItemDesc.GetCombatpetEquip3(tab))
	--宠物技能
	Insert(strDescList, WFItemDesc.GetCombatpetSkill1(tab))
	Insert(strDescList, WFItemDesc.GetCombatpetSkill2(tab))
	Insert(strDescList, WFItemDesc.GetCombatpetSkill3(tab))
	Insert(strDescList, WFItemDesc.GetCombatpetSkill4(tab))
	--分割线
	Insert(strDescList, {})
	-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab))
	-- 物品状态描述 	
	Insert(strDescList, WFItemDesc.GetProcMask(tab))		
	-- 绑定状态 
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))
	-- 价格描述
	Insert(strDescList, WFItemDesc.GetContextPriceText(tab))
	return Concat(strTitleList),strDescList
end

-- 战斗宠物技能书
function LuaItemDesc:GetSkillBookDesc(tab)
	local strTitleList = {}
    -- 名字和数量 	
	Insert(strTitleList, WFItemDesc.GetNameCountText(tab))		
	local strDescList = {}
		--宠物技能书对技能格要求
	Insert(strDescList, {})
	Insert(strDescList,WFItemDesc.GetPetSkillBookSlot(tab))
		--宠物技能书技能名字	
	Insert(strDescList,WFItemDesc.GetPetSkillBookSkillName(tab))
	--宠物技能书技能描述
	Insert(strDescList,WFItemDesc.GetPetSkillBookSkillDesc(tab))
		-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab))
	-- 物品状态描述 	
	Insert(strDescList, WFItemDesc.GetProcMask(tab))		
	-- 绑定状态 
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))
	-- 价格描述
	Insert(strDescList, WFItemDesc.GetContextPriceText(tab))
	return Concat(strTitleList),strDescList
end

function LuaItemDesc:GetArtifactDesc(tab)
	local strTitleList = {}
    -- 名字和数量 	
	Insert(strTitleList, WFItemDesc.GetNameCountText(tab))
	 -- 神力
    Insert(strTitleList, WFItemDesc.GetArtifactPower(tab))

    local strDescList = {}
    -- 绑定状态 
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))
    --属性
    WFItemDesc.GetArtifactState(tab, strDescList)
    return Concat(strTitleList),strDescList
end


function LuaItemDesc:GetSoulArmorGem(tab)
	local strTitleList = {}
    -- 名字和数量 	
	Insert(strTitleList, WFItemDesc.GetSoulArmorGemText(tab))
	
	-- 战斗力
	Insert(strTitleList, Format(FIGHT_POWER, tab.fight_power))
	
	
	local strDescList = {}
	Insert(strDescList, {})
	-- 宝石属性
	Insert(strDescList, WFItemDesc.GetSoulArmorGemAddon(tab))
	
	-- 经验
	Insert(strDescList, WFItemDesc.GetSoulArmorGemExp(tab))
	Insert(strDescList, {})
	-- 下一级属性
	Insert(strDescList, WFItemDesc.GetSoulArmorGemNextAddon(tab))
	-- 剩余时间
	Insert(strDescList, WFItemDesc.GetExpireTimeText(tab))
	Insert(strDescList, {})
	-- 绑定状态 
	Insert(strDescList, WFItemDesc.GetBoundStateText(tab))
	-- 价格描述
	Insert(strDescList, WFItemDesc.GetContextPriceText(tab))
	return Concat(strTitleList),strDescList
end
