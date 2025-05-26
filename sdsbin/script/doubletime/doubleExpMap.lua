module("doubleExpMap", package.seeall)


local EXP_OFF = 0
local EXP_ON_2 = 1
local EXP_ON_35 = 2

--[[
 需要双倍经验提示的地图配置在这里
 地图号，等级在level_low与level_high之间时，提示
--]]

_M[401] =   --沙织
{
	[EXP_ON_2] = {level_low = 19, level_high = 201,},
	[EXP_ON_35] = {level_low = 19, level_high = 201,},
}

_M[403] =   --双鱼
{
	[EXP_ON_2] = {level_low = 19, level_high = 60,},
}

_M[406] =   --集结十二宫
{
	[EXP_ON_2] = {level_low = 19, level_high = 60,},
	[EXP_ON_35] = {level_low = 19, level_high = 60,},
}


_M[407] =   --风暴亚特兰蒂斯
{
	[EXP_ON_2] = {level_low = 19, level_high = 60,},
	[EXP_ON_35] = {level_low = 19, level_high = 60,},
}


_M[408] =    --镇魂
{
	[EXP_ON_2] = {level_low = 19, level_high = 201,},
	[EXP_ON_35] = {level_low = 19, level_high = 201,},
}


_M[409] =    --深渊
{
	[EXP_ON_2] = {level_low = 19, level_high = 201,},
	[EXP_ON_35] = {level_low = 19, level_high = 201,},
}

_M[410] =    --冰火深渊
{
	[EXP_ON_2] = {level_low = 19, level_high = 201,},
}

_M[415] =    --复仇者联盟
{
	[EXP_ON_2] = {level_low = 19, level_high = 201,},
	[EXP_ON_35] = {level_low = 19, level_high = 201,},
}

_M[416] =    --冥蝶巢穴
{
	[EXP_ON_2] = {level_low = 19, level_high = 201,},
	[EXP_ON_35] = {level_low = 19, level_high = 201,},
}

_M[417] =    --地狱奏鸣曲
{
	[EXP_ON_2] = {level_low = 19, level_high = 201,},
	[EXP_ON_35] = {level_low = 19, level_high = 201,},
}

_M[418] =    --死去的斗士
{
	[EXP_ON_2] = {level_low = 19, level_high = 201,},
	[EXP_ON_35] = {level_low = 19, level_high = 201,},
}

_M[419] =    --Q版纱织
{
	[EXP_ON_2] = {level_low = 19, level_high = 201,},
	[EXP_ON_35] = {level_low = 19, level_high = 201,},
}

_M[422] =    --逆流双鱼
{
	[EXP_ON_2] = {level_low = 19, level_high = 201,},
}

_M[425] =    --逆流钟楼
{
	[EXP_ON_2] = {level_low = 19, level_high = 201,},
	[EXP_ON_35] = {level_low = 19, level_high = 201,},
}

_M[426] =    --逆流亚特兰蒂斯
{
	[EXP_ON_2] = {level_low = 19, level_high = 201,},
	[EXP_ON_35] = {level_low = 19, level_high = 201,},
}

function GetDoubleExpMap(self, map_id)
    return _M[map_id]
end

function GetExpRateOfMap(self, map_id, level)
	local cfg = _M[map_id]
	local exp_mask = 0
	if cfg == nil then return exp_list end
	for k,v in pairs(cfg) do
		if level >= v.level_low and level <= v.level_high then
			exp_mask = exp_mask + k
		end
	end
    return exp_mask
end