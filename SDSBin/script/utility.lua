local pairs, setmetatable, type = pairs, setmetatable, type;
local match = string.match
local gsub	= string.gsub

math.randomseed(os.time())
-- 前几个随机数不是那么随机,所以先生成几个
for i = 1, 50 do
	math.random()
end


-- 加快垃圾回收速度
collectgarbage("setpause", 99)
collectgarbage("setstepmul", 250)


-----------------------
-- 逆序遍历table的迭代器

function ripairs(table)
	function iter(t, i)
		i = i - 1
		local v = t[i]
		if v then
			return i, v
		end
	end
	
	return iter, table, #table + 1
end

---------------------------------------------
-- 尝试以obj.prop_name(...)的方式调用某个函数
-- 若失败则输出错误信息到控制台
function try_call(obj, prop_name, ...)
	if type(obj) ~= "table" then return end
	if type(obj[prop_name]) ~= "function" then return end
	
	local result = {pcall(obj[prop_name], unpack(arg))}
	if result[1] then
		return unpack(result, 2)
	else
		console.error(result[2])
	end
end

---------------------------------------------
-- 尝试以obj:prop_name(...)的方式调用某个函数
-- 若失败则输出错误信息到控制台
function try_method(obj, prop_name, ...)
	return try_call(obj, prop_name, obj, unpack(arg))
end

---------------------------------------------
-- function obj:func(...)
-- end
-- auto_method(obj, "func")
--
-- 这样使用后，该函数就可以通过obj.func()，或者obj:func()两种方式调用
function auto_method(bind_obj, func_name)
	local func = bind_obj[func_name]
	assert(type(func) == "function")

	bind_obj[func_name] = function(...)
		local arg = {...}
		if arg[1] ~= bind_obj then
			table.insert(arg, 1, bind_obj)
		end
		return func(unpack(arg))
	end
end

---------------------------------------------
-- stairs_table 可用于分段配置
stairs_table =
{
	ceil_mode_mt =
	{
		__index = function(table, index)
			local value = rawget(table, index)
			if value or type(index) ~= "number" then return value end

			if type(table._key_seq) ~= "table" then return end

			for _, key in ipairs(table._key_seq) do
				if index <= key then
					return table[key]
				end
			end
		end
	},

	floor_mode_mt =
	{
		__index = function(table, index)
			local value = rawget(table, index)
			if value or type(index) ~= "number" then return value end

			if type(table._key_seq) ~= "table" then return end

			for _, key in ripairs(table._key_seq) do
				if index >= key then
					return table[key]
				end
			end
		end
	},
}

----------------------------------------------
-- @param define_mode 取值可为"ceil"或"floor"，默认为floor
function stairs_table:setup(t, define_mode)
	define_mode = define_mode or "floor"

	local mt = define_mode == "floor" and self.floor_mode_mt or self.ceil_mode_mt

	t._key_seq = {}
	for k, v in pairs(t) do
		if type(k) == "number" then
			table.insert(t._key_seq, k)
		end
	end
	table.sort(t._key_seq)
	setmetatable(t, mt)

	return t
end

------------------
--拷贝表

function CopyTable(src)
	local inst={};
	for k, v in pairs(src) do
		if type(v) == "table" then
			inst[k] = CopyTable(v);
		else
			inst[k] = v;
		end
	end
	local mt = getmetatable(src);
	setmetatable(inst, mt);
	return inst;
end


function CreateObj(template, obj)
	local inst = obj or {};
	local k, v;
	for k, v in pairs(template) do
		if (not inst[k]) and type(v) ~= "function" then
			if type(v)== "table" and v ~= template then
				inst[k] = CopyTable(v);
			end
		end
	end
	setmetatable(inst, template);
	template.__index = template;
	return inst;
end




-------------------------------------------------
--计数器

Counter = 
{
	m_Period = 0,
	m_Counter = 0,
}

function Counter:new()
	return CreateObj(self);
end

function Counter:SetPeriod(period)
	self.m_Period = period;
end

function Counter:GetPeriod()
	return self.m_Period;
end

function Counter:Reset()
	self.m_Counter = 0
end

function Counter:IncCounter(counter)
	self.m_Counter = self.m_Counter + counter;
	return (self.m_Counter >= self.m_Period);
end

function Counter:IsFull()
	return (self.m_Counter >= self.m_Period);
end





-------------------------
--输出日志
function Log(str, ...)
    str = tostring(str)
    str = string.format(str, ...)
    GlobalApi.Log(str)
end

function See(str)
	str=tostring(str)
	DlgApiEx.AddChatMsg(str)
end




----------------------------------
--客户端调用,用于获取脚本配置表


--LuaWrapper无法处理表循环调用, 故使用module表,必须删除_M自身引用
local function FilterSelfQuote(_varName)
    if _G[_varName] and _G[_varName] == _G[_varName]._M then
        _G[_varName]._M = nil
    end
end


--获取打包脚本配置
function glb_GetScriptConfigTable(_varName)
    FilterSelfQuote(_varName)
    return _G[_varName]
end


--获取未打包脚本配置
function glb_GetDetachScriptConfigTable(_fileName, _varName)
    local chunk = loadfile(_fileName)
    if chunk then
        setfenv(chunk, {})
        chunk()
        local env = getfenv(chunk)
        if env and env[_varName] then
            return env[_varName]
        end
    end
end


--获取对齐字符"^o"宽度
function glb_GetSpecCharWidth()
    return CONSTANT_TABLE.spec_char_wid or 0
end


-- 检查一个字符串中是否有非法字符，如果有返回true，否则返回false。
function glb_CheckBadWords(str)
    if not str then
        return false
    end
    local words1 = NameBadWords or {}
    for _, word in ipairs(words1) do
        if match(str, word) then
            return true
        end
    end
    local words2 = ChatBadWords or {}
    for _, word in ipairs(words2) do
        if match(str, word) then
            return true
        end
    end
    return false
end


-- 将非法字符转换成*号
function glb_FilterBadWords(str)
    if not str then
        return ""
    end
    local words = ChatBadWords or {}
    for _, word in ipairs(ChatBadWords or {}) do
        str = gsub(str, word, "***");
    end
    return str
end


-- 将非法字符转换成*号
function glb_FilterSingleBadWords(str)
    if not str then
        return ""
    end
    local words = SingleBadWords or {}
    for _, word in ipairs(SingleBadWords or {}) do
        str = gsub(str, word, "*");
    end
    return str
end



-------------------------------------------------
--脚本处理字符串

local Gsub, Find, Sub  = string.gsub, string.find, string.sub
function glb_FilterNewLine(text)
	if type(text) ~= "string" then
	    return text
	end
	if Find(text,"\r$") then  
	    text = Sub(text, 1, Find(text,"\r$")-1)
	end
    text = Gsub(text, "\r%s*$", "")
    text = Gsub(text, "\r%s*^f2f3f2%s*$", "") 
    return text
end

--分割字符串，返回子串表，不含空串
function glb_StringSplit(str,splitChar)
	if type(str) ~= "string" then
		return
	end
	local str_tab = {}
	for w in string.gmatch(str,"[^"..splitChar.."]+") do
		table.insert(str_tab,w)
	end
	return str_tab
end

function glb_StringMatchCount(str,pattern)
	if type(str) ~= "string" then
		return 0
	end
	local count = 0
	for w in string.gmatch(str,pattern) do
		count= count+1
	end
	return count
end

--设置文本为统一的颜色
function glb_SetTextColor(str,colorStr)
	return colorStr..string.gsub(str,"%^%x%x%x%x%x%x","")
end

--使文字变灰
function glb_DisableText(str)
	return "^646464"..string.gsub(str,"%^%x%x%x%x%x%x","")
end
