------------------------
-- charge特效配置表


--[[
charge特效数据格式：
{
	gfx,  		特效路径
	hook, 		特效挂点
	end_scale,	蓄力结束后特效
}

注意事项:
Charge_Gfx可以不连续, 索引为技能id
]]--


Charge_Gfx = {}

Charge_Gfx[5] =
{
   	{ gfx = "策划联入\\无敌.gfx", hook = "HH_Spine", end_scale = 2.0, },
	{ gfx = "策划联入\\无敌_吸魂爆发.gfx", hook = "HH_Head", end_scale = 5.0, },
}

Charge_Gfx[166] =
{
   	{ gfx = "策划联入\\无敌.gfx", hook = "", end_scale = 10.0, },
}

Charge_Gfx[6412] =
{
   	{ gfx = "策划联入\\无敌.gfx", hook = "HH_Spine", end_scale = 2.0, },
	{ gfx = "策划联入\\无敌_吸魂爆发.gfx", hook = "HH_Head", end_scale = 5.0, },
}

Charge_Gfx[6416] =
{
   	{ gfx = "策划联入\\无敌.gfx", hook = "HH_Spine", end_scale = 2.0, },
	{ gfx = "策划联入\\无敌_吸魂爆发.gfx", hook = "HH_Head", end_scale = 5.0, },
}

Charge_Gfx[6580] =
{
   	{ gfx = "策划联入\\无敌.gfx", hook = "HH_Spine", end_scale = 2.0, },
	{ gfx = "策划联入\\无敌_吸魂爆发.gfx", hook = "HH_Head", end_scale = 5.0, },
}

