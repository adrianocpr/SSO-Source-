--------------------------------------------
-- 后处理效果配置
-- Created by Fengbo
--[[
--------------------------------------------
old_time				怀旧老照片
death					死亡
keep_blue				突出蓝色，其余颜色为灰度
inverse					反色效果
gray					灰度效果
warp 					水下扭曲
warp(scale, speed) 		带参数的水下扭曲，scale为扭曲程度(0~0.1)，speed为扭曲速度(0~4)
dream					梦境
blood					僵尸视角
--------------------------------------------
--]]
module("config.post_effect", package.seeall)

function get(name, ...)
	local code = "return " .. name
	local chunk, err = loadstring(code, "config.post_effect.get(name)")
	if not chunk then return end

	setfenv(chunk, _M)
	local success, ret = pcall(chunk)
	if not success then return end

	if type(ret) == "table" then
		return ret
	elseif type(ret) == "function" then
		return ret(...)
	end 
end

function combine(...)
	local result = {}
	for _, obj in ipairs({...}) do
		if type(obj) == "table" then
			for k, v in pairs(obj) do
				result[k] = v
			end
		end
	end
	return result
end

function old_time(include_ui)
	if include_ui == nil then
		include_ui = false
	end

	return 
	{
		cc = 
		{
			factor = 1,
			texture2 = "textures/colormaping/ccold.dds",
			is_after_ui = include_ui;
		}
	}
end

function death(include_ui)
	if include_ui == nil then
		include_ui = false
	end
	
	return 
	{
		cc = 
		{
			factor = 1,
			texture2 = "textures/colormaping/ccdeath.dds",
			is_after_ui = include_ui;
		}
	}
end

function keep_blue(include_ui)
	if include_ui == nil then
		include_ui = false
	end
	
	return 
	{
		cc = 
		{
			factor = 1,
			texture2 = "textures/colormaping/ccblue.dds",
			is_after_ui = include_ui;
		}
	}
end

function inverse(include_ui)
	if include_ui == nil then
		include_ui = false
	end
	
	return 
	{
		cc = 
		{
			factor = 1,
			texture2 = "textures/colormaping/ccinverse.dds",
			is_after_ui = include_ui;
		}
	}
end

function gray(include_ui)
	if include_ui == nil then
		include_ui = false
	end
	
	return 
	{
		cc = 
		{
			factor = 1,
			texture2 = "textures/colormaping/cchuidu.dds",
			is_after_ui = include_ui;
		}
	}
end

function warp(scale, speed)
	scale = scale or 0.01
	speed = speed or 0.5
	return 
	{
		warp = 
		{
			scale = scale,
			speed = speed,
		}
	}
end

function dream()
	return 
	{
		warp = 
		{
			scale = 0.027,
			speed = 0.34,
		},
		radial_blur =
		{
			center_x = 0.5,
			center_y = 0.5,
			length = 0.2,
			in_focus_radius = 0.08,
			out_focus_radius = 1.09,
		},
	}
end

function blood()
	return 
	{
		full_glow = 
		{
			blur_size = 0,
			level = 0,
			power = 0,
			color = {3.0, 0.1, 0.1, 0.5, },
		},
		radial_blur =
		{
			center_x = 0.5,
			center_y = 0.5,
			length = 0.5,
			in_focus_radius = 0.5,
			out_focus_radius = 1.0,
		},
	}
end

return _M