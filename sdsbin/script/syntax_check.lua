--------------------------------------------
-- lua�﷨������
-- Created by Fengbo
--
-- ��װ��lua�����Ļ��������� lua syntax_check.lua
-- ���ɼ�鵱ǰĿ¼�£��������ļ��У�����lua�ļ����﷨����
--
-- ** ��Ҫlfs���֧�� 

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
	print("�ű������﷨�������𷢲������س�������")
	io.read()
end
