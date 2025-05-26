-- 说明
-- seg：阶段配置
-- time：次阶段用时
-- speed: 文字上升速度
-- scale: 本阶段时间内变化到这个大小
-- disappear: 本阶段时间内消失

-- move：立体空间移动 （如果不配置则无效果）（目前只支持 BUBBLE_SKILL_DAMAGE BUBBLE_CRITICAL_STRIKE BUBBLE_DIRECT_HIT BUBBLE_HITMISSED BUBBLE_IMMUNE）

BUBBLE_SKILL_DAMAGE = 0 --技能伤害
BUBBLE_CRITICAL_STRIKE = 1 --暴击
BUBBLE_EXP = 2 --经验
BUBBLE_LEVELUP = 3 --升级
BUBBLE_HITMISSED = 4 --躲闪
BUBBLE_IMMUNE = 5 --免疫
BUBBLE_INVINCIBLE = 6 --无敌
BUBBLE_HPWARN = 7 --（暂未使用）
BUBBLE_MPWARN = 8 --（暂未使用）
BUBBLE_HEAL = 9 --加血
BUBBLE_DIRECT_HIT = 10 --直击
BUBBLE_REDUCE = 11 --吸收

local BubbleInfo = {}

--技能伤害
BubbleInfo[BUBBLE_SKILL_DAMAGE] =
{
	   seg =
		{
			[1] = {time = 0,	speed = 0.0,	scale = 1,	disappear = 0},
			[2] = {time = 0,	speed = 0,	    scale = 1,	disappear = 0},
			[3] = {time = 0,	speed = 0,	scale = 1,	disappear = 0},
			[4] = {time = 50,	speed = 0,	scale = 2.5,	disappear = 0},
			[5] = {time = 250,	speed = 0,	scale = 2.5,	disappear = 0},
			[6] = {time = 150,	speed = 3.5,	scale = 1,	disappear = 0},
			[7] = {time = 500,	speed = 2.5,	scale = 1,	disappear = 1},
		},
		move = 
		{
			delay_time = 0, -- 用于设置启动时机
			move_time	=	99999, -- 启动后移动用时
			speed_h = 0, -- 水平速度
			speed_v_base = 3.0,	-- 基础垂直速度 （垂直速度 = 基础垂直速度 + 随机值）
			speed_v_min = 2.0, -- 随机垂直速度最小值
			speed_v_max = 4.0, -- 随机垂直速度最大值
			acc_h = 0, -- 水平加速度（逆向,阻力）
			acc_v = 39.8, -- 垂直加速度（重力）
		},

}
--[[备用，飞出后上浮淡出效果
		seg =
		{
			[1] = {time = 0,	speed = 0.0,	scale = 1,	disappear = 0},
			[2] = {time = 75,	speed = 5,	    scale = 1.5,	disappear = 0},
			[3] = {time = 250,	speed = 0,	    scale = 2.0,	disappear = 0},
			[4] = {time = 300,	speed = 0,	    scale = 1,	disappear = 0},
			[5] = {time = 500,	speed = 2,	    scale = 1,	disappear = 0},
			[6] = {time = 100,	speed = 2,	    scale = 1,	disappear = 1},
		},
		move = 
		{
			delay_time = 0, -- 用于设置启动时机
			move_time	=	325, -- 启动后移动用时
			speed_h = 10, -- 水平速度
			speed_v_base = 10,	-- 基础垂直速度 （垂直速度 = 基础垂直速度 + 随机值）
			speed_v_min = 0, -- 随机垂直速度最小值
			speed_v_max = 0, -- 随机垂直速度最大值
			acc_h = 0, -- 水平加速度（逆向,阻力）
			acc_v = 50, -- 垂直加速度（重力）
		},]]--

--暴击
BubbleInfo[BUBBLE_CRITICAL_STRIKE] =
{
		seg =
		{
			[1] = {time = 0,	speed = 0.0,	scale = 1,	disappear = 0},
			[2] = {time = 0,	speed = 0,	    scale = 1,	disappear = 0},
			[3] = {time = 0,	speed = 0,	scale = 1,	disappear = 0},
			[4] = {time = 50,	speed = 0,	scale = 4,	disappear = 0},
			[5] = {time = 250,	speed = 0,	scale = 4,	disappear = 0},
			[6] = {time = 150,	speed = 3.5,	scale = 1,	disappear = 0},
			[7] = {time = 500,	speed = 2.5,	scale = 1,	disappear = 1},
		},
		move = 
		{
			delay_time = 0, -- 用于设置启动时机
			move_time	=	99999, -- 启动后移动用时
			speed_h = 0, -- 水平速度
			speed_v_base = 5.0,	-- 基础垂直速度 （垂直速度 = 基础垂直速度 + 随机值）
			speed_v_min = 2.0, -- 随机垂直速度最小值
			speed_v_max = 4.0, -- 随机垂直速度最大值
			acc_h = 0, -- 水平加速度（逆向,阻力）
			acc_v = 39.8, -- 垂直加速度（重力）
		},
		--[[seg =
		{
			[1] = {time = 0,	speed = 0.0,	scale = 3,	disappear = 0},
			[2] = {time = 20,	speed = 0,	    scale = 4,	disappear = 0},
			[3] = {time = 150,	speed = 0,	scale = 3,	disappear = 0},
			[4] = {time = 100,	speed = 1.5,	scale = 1,	disappear = 0},
			[5] = {time = 500,	speed = 0.5,	scale = 1,	disappear = 1},
		},]]--
		
}

--经验
BubbleInfo[BUBBLE_EXP] =
{
		seg =
		{
			[1] = {time = 0,		speed = 0.0,	scale = 2,	disappear = 0},
			[2] = {time = 600,	speed = 0.0,	scale = 1,	disappear = 0},
			[3] = {time = 300,	speed = 1.5,	scale = 1,	disappear = 0},
			[4] = {time = 700,	speed = 1.5,	scale = 1,	disappear = 1},
		},
}

--升级
BubbleInfo[BUBBLE_LEVELUP] =
{
		seg =
		{
			[1] = {time = 0,		speed = 0.0,	scale = 2,	disappear = 0},
			[2] = {time = 600,	speed = 0.0,	scale = 1,	disappear = 0},
			[3] = {time = 300,	speed = 1.5,	scale = 1,	disappear = 0},
			[4] = {time = 700,	speed = 1.5,	scale = 1,	disappear = 1},
		},
}

--躲闪
BubbleInfo[BUBBLE_HITMISSED] =
{
		seg =
		{
			[1] = {time = 0,		speed = 0.0,	scale = 2,	disappear = 0},
			[2] = {time = 600,	speed = 0.0,	scale = 1,	disappear = 0},
			[3] = {time = 300,	speed = 1.5,	scale = 1,	disappear = 0},
			[4] = {time = 700,	speed = 1.5,	scale = 1,	disappear = 1},
		},
}

--免疫
BubbleInfo[BUBBLE_IMMUNE] =
{
		seg =
		{
			[1] = {time = 0,		speed = 0.0,	scale = 2,	disappear = 0},
			[2] = {time = 600,	speed = 0.0,	scale = 1,	disappear = 0},
			[3] = {time = 300,	speed = 1.5,	scale = 1,	disappear = 0},
			[4] = {time = 700,	speed = 1.5,	scale = 1,	disappear = 1},
		},
}

--无敌
BubbleInfo[BUBBLE_INVINCIBLE] =
{
		seg =
		{
			[1] = {time = 0,		speed = 0.0,	scale = 2,	disappear = 0},
			[2] = {time = 600,	speed = 0.0,	scale = 1,	disappear = 0},
			[3] = {time = 300,	speed = 1.5,	scale = 1,	disappear = 0},
			[4] = {time = 700,	speed = 1.5,	scale = 1,	disappear = 1},
		},
}

--（暂未使用）
BubbleInfo[BUBBLE_HPWARN] =
{
		seg =
		{
			[1] = {time = 0,		speed = 0.0,	scale = 2,	disappear = 0},
			[2] = {time = 600,	speed = 0.0,	scale = 1,	disappear = 0},
			[3] = {time = 300,	speed = 1.5,	scale = 1,	disappear = 0},
			[4] = {time = 700,	speed = 1.5,	scale = 1,	disappear = 1},
		},
}

--（暂未使用）
BubbleInfo[BUBBLE_MPWARN] =
{
		seg =
		{
			[1] = {time = 0,		speed = 0.0,	scale = 2,	disappear = 0},
			[2] = {time = 600,	speed = 0.0,	scale = 1,	disappear = 0},
			[3] = {time = 300,	speed = 1.5,	scale = 1,	disappear = 0},
			[4] = {time = 700,	speed = 1.5,	scale = 1,	disappear = 1},
		},
}

--加血
BubbleInfo[BUBBLE_HEAL] =
{
		seg =
		{
			[1] = {time = 0,		speed = 0.0,	scale = 2,	disappear = 0},
			[2] = {time = 600,	speed = 0.0,	scale = 1,	disappear = 0},
			[3] = {time = 300,	speed = 1.5,	scale = 1,	disappear = 0},
			[4] = {time = 700,	speed = 1.5,	scale = 1,	disappear = 1},
		},
}

--直击
BubbleInfo[BUBBLE_DIRECT_HIT] =
{
		seg =
		{
			[1] = {time = 0,		speed = 0.0,	scale = 2,	disappear = 0},
			[2] = {time = 600,	speed = 0.0,	scale = 1,	disappear = 0},
			[3] = {time = 300,	speed = 1.5,	scale = 1,	disappear = 0},
			[4] = {time = 700,	speed = 1.5,	scale = 1,	disappear = 1},
		},
		--[[move = 
		{
			delay_time = 0, -- 用于设置启动时机
			move_time	=	99999, -- 启动后移动用时
			speed_h = 10.0, -- 水平速度
			speed_v_base = 3.0,	-- 基础垂直速度 （垂直速度 = 基础垂直速度 + 随机值）
			speed_v_min = 2.0, -- 随机垂直速度最小值
			speed_v_max = 4.0, -- 随机垂直速度最大值
			acc_h = 9.0, -- 水平加速度（逆向,阻力）
			acc_v = 9.8, -- 垂直加速度（重力）
		},]]--
}

--吸收
BubbleInfo[BUBBLE_REDUCE] =
{
		seg =
		{
			[1] = {time = 0,		speed = 0.0,	scale = 2,	disappear = 0},
			[2] = {time = 600,	speed = 0.0,	scale = 1,	disappear = 0},
			[3] = {time = 300,	speed = 1.5,	scale = 1,	disappear = 0},
			[4] = {time = 700,	speed = 1.5,	scale = 1,	disappear = 1},
		},
}

Bubble_Info = {}
function Bubble_Info:GetInfoNum (idx)
	n = table.getn(BubbleInfo[idx].seg)
	return n
end

function Bubble_Info:GetInfo (idx,i)
	return BubbleInfo[idx].seg[i].time,BubbleInfo[idx].seg[i].speed,BubbleInfo[idx].seg[i].scale,BubbleInfo[idx].seg[i].disappear
end

function Bubble_Info:GetMoveInfo (idx)
	if BubbleInfo[idx].move == nil then
		return 0
	else
		return BubbleInfo[idx].move.delay_time,
		BubbleInfo[idx].move.move_time,
		BubbleInfo[idx].move.speed_h,
		BubbleInfo[idx].move.speed_v_base,
		BubbleInfo[idx].move.speed_v_min,
		BubbleInfo[idx].move.speed_v_max,
		BubbleInfo[idx].move.acc_h,
		BubbleInfo[idx].move.acc_v
	end
end
