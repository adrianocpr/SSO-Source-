-- 不受小助手关闭影响的事件id
SecretarySpecialEvent =
{
	[30007] = true,
	[30008] = true,
	[30018] = true,
	[30021] = true,
	[30022] = true,
	[30023] = true,
	[30024] = true,
	[30030] = true,
	[30038] = true,
	[30039] = true,
	[30048] = true,
	[30051] = true,
	[30053] = true,
	[30058] = true,
	[30059] = true,
	[30062] = true,
	[30064] = true,
	[30065] = true,
	[30069] = true,


}


-- 特殊id对应索引表
SecretarySpecialIDMap = {}

SecretarySpecialIDMap.ItemId2Index =
{
	--	用于物品id对应的提示状态的标记
	--	[物品id] = 序号（从1顺序往后排，不可中间插入）
	--  如果多个物品对应的序号相同，则这些物品使用同一个标记，当其中一个物品触发之后，其他物品就不再触发了。

	[864] = 1,--占星石
	[14187] = 2,--星辰碎片
	[4524] = 4, -- GM飞鞋
	[11725]= 8,--星魂石
	[11726]= 8,--星魂石
    [11727]= 8,--星魂石
    [11728]= 8,--星魂石
    [11729]= 8,--星魂石
    [11730]= 8,--星魂石
    [11731]= 8,--星魂石
    [11732]= 8,--星魂石
    [11733]= 8,--星魂石
    [11734]= 8,--星魂石
	[16909] = 9,--配方
	[16910] = 9,--配方
	[16911] = 9,--配方
	[103] = 10,--坐骑
	[22970] = 9, --配方
	[22971] = 9, --配方
	[22972] = 9, --配方
	[22973] = 9, --配方
	[22974] = 9, --配方
	[22975] = 9, --配方
	[22976] = 9, --配方
	[22977] = 9, --配方
	[22978] = 9, --配方
	[22979] = 9, --配方
	[22980] = 9, --配方
	[22981] = 9, --配方
	[22982] = 9, --配方
	[22983] = 9, --配方
	[22984] = 9, --配方
	[22985] = 9, --配方
	[22986] = 9, --配方
	[22987] = 9, --配方
	[27509] = 11, --公式
	[27510] = 11, --公式
	[27511] = 11, --公式
	[27512] = 11, --公式
	[27513] = 11, --公式
}


SecretarySpecialIDMap.ItemUseId2Index =
{
	--	用于物品id对应的提示状态的标记
	--	[物品id] = 序号（从1顺序往后排，不可中间插入）
	--  如果多个物品对应的序号相同，则这些物品使用同一个标记，当其中一个物品触发之后，其他物品就不再触发了。
    [1419] = 1,

}


SecretarySpecialIDMap.SkillId2Index =
{
	--	用于技能id对应的提示状态的标记
	--	[技能id] = 序号（从1顺序往后排，不可中间插入）
	--  如果多个技能对应的序号相同，则这些技能使用同一个标记，当其中一个技能触发之后，其他技能就不再触发了。

	[2093] = 1,--子弹时间
}


SecretarySpecialIDMap.AcceptTaskId2Index =
{
	--	用于任务id对应的提示状态的标记
	--	[任务id] = 序号（从1顺序往后排，不可中间插入）
	--  如果多个任务对应的序号相同，则这些任务使用同一个标记，当其中一个任务触发之后，其他任务就不再触发了。
	[1054] = 1,
	[1055] = 2,
	[1056] = 3,
	[1058] = 4,
	[1067] = 5,
	[1077] = 6,

	[1698] = 3,
	[1699] = 7,
	[2984] = 8,


}


SecretarySpecialIDMap.FinishTaskId2Index =
{
--	用于任务id对应的提示状态的标记
--	[任务id] = 序号（从1顺序往后排，不可中间插入）
--	[1054] = 1,
--	[1699] = 1,
--	[1056] = 2,
--	[1698] = 2,
--	[1076] = 3,
--	[1105] = 4,
--	[1055] = 5,
--	[1774] = 5,
--	[1070] = 6,
	[98] = 1,
	[102] = 2,
	[3898] = 3,
}


SecretarySpecialIDMap.ShowDlgName2Index =
{
--	--	用于界面显示的提示状态的标记
--	--	[界面名] = 序号（从1顺序往后排，不可中间插入）
	["panel_AttributeMain"] = 1,
	["Panel_Raffle"] = 2,
	["Panel_Revive"] = 3,
	["Panel_MessageQuit"] = 4,
	["Panel_Push"] = 5,
	["Panel_WorldMapNpcList"] = 6,
	["Panel_GuideStage"] = 7,
	["Panel_SubExplore1"] = 8,
	["Panel_SubExplore2"] = 9,
}





function SecretarySpecialIDMap:GetItemIdIndex( id )
    return self.ItemId2Index[id] or 0
end

function SecretarySpecialIDMap:GetItemUseIdIndex( id )
    return self.ItemUseId2Index[id] or 0
end

function SecretarySpecialIDMap:GetSkillIdIndex( id )
    return self.SkillId2Index[id] or 0
end

function SecretarySpecialIDMap:GetAcceptTaskIdIndex( id )
    return self.AcceptTaskId2Index[id] or 0
end

function SecretarySpecialIDMap:GetFinishTaskIdIndex( id )
    return self.FinishTaskId2Index[id] or 0
end

function SecretarySpecialIDMap:GetShowDlgNameIndex( name )
    return self.ShowDlgName2Index[name] or 0
end
