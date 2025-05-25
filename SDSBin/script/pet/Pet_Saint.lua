local GameApi = GameApi

-- 服务器发来的id必须是0~11  sModel：模型路径 Act_stand：站立动作  Act_born:出场动作 Act_disappear：离场动作 Act_run:跑动作  Act_skill：技能动作 sMsg:出场后系统提示信息
SAINTPET_TAB = {} 
SAINTPET_TAB[0] = 
{
	sModel = "models\\npcs\\黄金圣斗士\\黄金圣斗士白羊座穆\\黄金圣斗士白羊座穆.ecm",
	Act_stand = "战斗站立",
	Act_born = "出现",
	Act_disappear = "站立",
	Act_run = "奔跑",
	Act_skill = "技能攻击2",
	sMsg = STRING_TABLE.SAINT_PET_SUMMON_1,
}

SAINTPET_TAB[1] = 
{
	sModel = "models\\npcs\\黄金圣斗士\\黄金圣斗士金牛座\\黄金圣斗士金牛座.ecm",
	Act_stand = "战斗站立",
	Act_born = "出现",
	Act_disappear = "站立",
	Act_run = "奔跑",
	Act_skill = "技能攻击5",
	sMsg = STRING_TABLE.SAINT_PET_SUMMON_2,
}

SAINTPET_TAB[2] = 
{
	sModel = "models\\npcs\\黄金圣斗士\\黄金圣斗士双子座撒加\\黄金圣斗士双子座撒加.ecm",
	Act_stand = "战斗站立",
	Act_born = "出现",
	Act_disappear = "站立",
	Act_run = "奔跑",
	Act_skill = "技能攻击2",
	sMsg = STRING_TABLE.SAINT_PET_SUMMON_3,
}
SAINTPET_TAB[3] = 
{
	sModel = "models\\npcs\\黄金圣斗士\\黄金圣斗士巨蟹座迪斯马斯克\\黄金圣斗士巨蟹座迪斯马斯克.ecm",
	Act_stand = "战斗站立",
	Act_born = "出现",
	Act_disappear = "站立",
	Act_run = "奔跑",
	Act_skill = "技能攻击1",
	sMsg = STRING_TABLE.SAINT_PET_SUMMON_4,
}
SAINTPET_TAB[4] = 
{
	sModel = "models\\npcs\\黄金圣斗士\\黄金圣斗士狮子座艾欧里亚\\黄金圣斗士狮子座艾欧里亚.ecm",
	Act_stand = "战斗站立",
	Act_born = "出现",
	Act_disappear = "站立",
	Act_run = "奔跑",
	Act_skill = "技能攻击2快速",
	sMsg = STRING_TABLE.SAINT_PET_SUMMON_5,
}
SAINTPET_TAB[5] = 
{
	sModel = "models\\npcs\\黄金圣斗士\\黄金圣斗士处女座沙加\\黄金圣斗士处女座沙加.ecm",
	Act_stand = "战斗站立",
	Act_born = "出现",
	Act_disappear = "站立",
	Act_run = "奔跑",
	Act_skill = "技能攻击3",
	sMsg = STRING_TABLE.SAINT_PET_SUMMON_6,
}
SAINTPET_TAB[6] = 
{
	sModel = "models\\npcs\\黄金圣斗士\\黄金圣斗士天秤座童虎\\黄金圣斗士天秤座童虎.ecm",
	Act_stand = "战斗站立",
	Act_born = "出现",
	Act_disappear = "站立",
	Act_run = "奔跑",
	Act_skill = "技能攻击1",
	sMsg = STRING_TABLE.SAINT_PET_SUMMON_7,
}
SAINTPET_TAB[7] = 
{
	sModel = "models\\npcs\\黄金圣斗士\\黄金圣斗士天蝎座米罗\\天蝎座米罗.ecm",
	Act_stand = "战斗站立",
	Act_born = "出现",
	Act_disappear = "站立",
	Act_run = "奔跑",
	Act_skill = "技能攻击5",
	sMsg = STRING_TABLE.SAINT_PET_SUMMON_8,
}
SAINTPET_TAB[8] = 
{
	sModel = "models\\npcs\\黄金圣斗士\\黄金圣斗士射手座艾欧罗斯\\黄金圣斗士射手座艾欧罗斯.ecm",
	Act_stand = "战斗站立",
	Act_born = "出现",
	Act_disappear = "站立",
	Act_run = "奔跑",
	Act_skill = "技能攻击2",
	sMsg = STRING_TABLE.SAINT_PET_SUMMON_9,
}
SAINTPET_TAB[9] = 
{
	sModel = "models\\npcs\\黄金圣斗士\\黄金圣斗士摩羯座修罗\\黄金圣斗士摩羯座修罗.ecm",
	Act_stand = "战斗站立",
	Act_born = "出现",
	Act_disappear = "站立",
	Act_run = "奔跑",
	Act_skill = "技能攻击1",
	sMsg = STRING_TABLE.SAINT_PET_SUMMON_10,
}
SAINTPET_TAB[10] = 
{
	sModel = "models\\npcs\\黄金圣斗士\\黄金圣斗士水瓶座卡妙\\黄金圣斗士水瓶座卡妙.ecm",
	Act_stand = "战斗站立",
	Act_born = "出现",
	Act_disappear = "站立",
	Act_run = "奔跑",
	Act_skill = "技能攻击1",
	sMsg = STRING_TABLE.SAINT_PET_SUMMON_11,
}
SAINTPET_TAB[11] = 
{
	sModel = "models\\npcs\\黄金圣斗士\\黄金圣斗士双鱼座阿布罗狄\\黄金圣斗士双鱼座阿布罗狄.ecm",
	Act_stand = "战斗站立",
	Act_born = "出现",
	Act_disappear = "站立",
	Act_run = "奔跑",
	Act_skill = "技能攻击4",
	sMsg = STRING_TABLE.SAINT_PET_SUMMON_12,
}
	
	
		
SaintPet = {}
function SaintPet:GetInfo (id)
	local retCode = 1 -- 1:成功  0：失败
	local sModel = ""
	local Act_stand = ""
	local Act_born = ""
	local Act_disappear = ""
	local Act_run = ""
	local Act_skill = ""
	local sMsg = ""
	if SAINTPET_TAB[id]~=nil then
		sModel = SAINTPET_TAB[id].sModel
		Act_stand = SAINTPET_TAB[id].Act_stand
		Act_born = SAINTPET_TAB[id].Act_born
		Act_disappear = SAINTPET_TAB[id].Act_disappear
		Act_run = SAINTPET_TAB[id].Act_run
		Act_skill = SAINTPET_TAB[id].Act_skill
		sMsg = SAINTPET_TAB[id].sMsg
	else
		retCode = 0
	end
	return retCode,sModel,Act_stand,Act_born,Act_disappear,Act_run,Act_skill,sMsg
end