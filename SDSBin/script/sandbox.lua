---------------------------------------------
-- 在sandbox中载入文件，可用于载入配置文件
-- 不会对_G造成污染，并可限制/替换被载入的文件可调用的接口
-- 
-- @author FengBo

module("sandbox", package.seeall)

basic =
{
	require = require,
	string = string,
	table = table,
	ipairs = ipairs,
	pairs = pairs,
}

--[[-------------------------------------------
-- 创建一个sandbox，参数为sandbox的运行环境
-- 每一个参数都必须是一个table，sandbox内的代码执行时，将依次在这些table中查找
--
-- 创建后的sandbox可通过以下写法载入文件
-- local box = sandbox.create()
-- box("filename.lua")
--]]
function create(...)
	local mt = {...}
	mt.__index = function(t, index)
		for _, env in ipairs(mt) do
			local value = rawget(env, index)
			if value then
				return value
			end
		end
		return rawget(t, index)
	end

	mt.__call = function(t, filename)
		return _M.load_file(filename, t)
	end

	local t = {}
	setmetatable(t, mt)
	return t
end

--[[-------------------------------------------
-- 创建一个sandbox，并给予最基本的运行环境
--]]
function create_basic(...)
	local arg = {...}
	table.insert(arg, basic)
	return create(unpack(arg))
end

--[[-------------------------------------------
-- 创建一个sandbox，并给予_G中所有内容的访问权限
--]]
function create_full(...)
	local arg = {...}
	table.insert(arg, _G)
	return create(unpack(arg))
end

function load_file(filename, sandbox)
	local chunk, err = LuaLoadFile(filename)
	if chunk then
		setfenv(chunk, sandbox)
    	local success, ret = pcall(chunk)
    	if not success then
    		return nil, ret
    	else
    		return sandbox
    	end
	else
		return nil, err
	end

	return nil
end

return _M