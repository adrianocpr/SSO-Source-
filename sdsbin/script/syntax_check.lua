--------------------------------------------
-- lua语法错误检查
-- Created by Fengbo
--
-- 在装有lua环境的机器上运行 lua syntax_check.lua
-- 即可检查当前目录下（包含子文件夹）所有lua文件的语法错误
--
-- ** 需要lfs库的支持 

require "lfs"

local all_ok = true

function check_syntax(file)
	local env = 
	{
		print = function() end,
	}
	setmetatable(env, {__index = _G})
	setfenv(1, env)

	local success, msg = loadfile(file)
	if not success then
		_G.print(msg)
		all_ok = false
	end
end

function iter_files(path)
	for file in lfs.dir(path) do
		if file ~= "." and file ~= ".." and string.lower(file) ~= "syntax_check.lua" then
			local f = path .. "/" .. string.lower(file)
			local attr = lfs.attributes(f)
			assert(type(attr) == "table")
			if attr.mode == "directory" then
				iter_files(f)
			elseif string.match(f, "%.lua$") then
				check_syntax(f)
			end
		end
	end
end

iter_files(".")

if not all_ok then
	print("")
	print("脚本存在语法错误，请勿发布。按回车键结束")
	io.read()
end
