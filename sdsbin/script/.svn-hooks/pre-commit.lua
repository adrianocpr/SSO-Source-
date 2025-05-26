local function check_syntax(file)
	local env = 
	{
		print = function() end,
	}
	setmetatable(env, {__index = _G})
	setfenv(1, env)

	local success, msg = loadfile(file)
	return success and true or msg
end

local function _print(...)
	local msg = table.concat(arg, ", ")
	io.stderr:write(msg .. "\n")
end

local errors = {}
for file in io.lines(arg[1]) do
	if not string.find(file, "%.svn") then
		if string.find(file, "%.lua$") then
			local result = check_syntax(file)
			if result ~= true then
				table.insert(errors, result)
			end
		end
	end
end

if #errors > 0 then
	_print("Lua scripts contains syntax errors, please fix them brefore commit:")
	for _, err in ipairs(errors) do
		_print(err)
	end
	os.exit(1)
end