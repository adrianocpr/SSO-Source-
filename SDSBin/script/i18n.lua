require("pack")

module("i18n", package.seeall)

local PACK_PATH_PATTERN = "data/lang_%s.data"	-- eg. "data/lang_zh-TW.data"

local PACK_MAGIC = "LANG"
local PACK_VERSION = 1
local BUNDLE_START_MAGIC = 0xBD57
local BUNDLE_END_MAGIC = 0xBDED

local function auto_method(bind_obj, func_name)
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

function context(name)
	local name = name or ""
	if #name <= 0 then
		name = "common"
	end

	local t = {
		context = name
	}

	setmetatable(t, {
		__call = function(self, ...)
			return _M.get_text(self.context, ...)
		end
	})
	return t
end

local context_map = {}
local id_map = {}

function _M:get_text(context, src_text)
	local bundle = context_map[context]
	if not bundle then return src_text end

	local common_bundle = context_map.common or {}

	return bundle[src_text] or common_bundle[src_text] or src_text
end
auto_method(_M, "get_text")

function _M:get_text_by_id(id)
	for name, bundle in pairs(id_map) do
		local text = bundle[id]
		if text then
			return text
		end
	end
end
auto_method(_M, "get_text_by_id")

function _M:release_bundle(name_pattern)
	if type(name_pattern) ~= "string" then return end

	local need_release = {}
	for name, bundle in pairs(context_map) do
		if name_pattern:match(name) then
			table.insert(need_release, name)
		end
	end

	for _, name in ipairs(need_release) do
		context_map[name] = nil
		id_map[name] = nil
	end
end
auto_method(_M, "release_bundle")

----------------------------------
-- load from language pack
----------------------------------
local function load_bin_v1(language, path)
	local f, err = io.open(path, "rb")
	assert(f, err)

	local function load(f, bytes, fmt)
		local result = { f:read(bytes):unpack(fmt) }
		table.remove(result, 1)
		return unpack(result)
	end

	local function load_header(f)
		local pack_magic = f:read(4)
		local pack_version, timestamp = load(f, 8, "<II")
		print("PACK_MAGIC", pack_magic)
		print("PACK_VERSION", pack_version)
		assert(pack_magic == PACK_MAGIC)
		assert(pack_version == PACK_VERSION)
	end

	local function load_string(f)
		local len = load(f, 4, "<I")
		if len == 0 then
			return ""
		else
			return f:read(len)
		end
	end

	local function load_bundle(f)
		local magic = load(f, 2, "<H")
		print("BUNDLE_START_MAGIC", magic)
		assert(magic == BUNDLE_START_MAGIC)

		local name = load_string(f)
		local entries_count = load(f, 4, "<I")

		local bundle = {}
		for i = 1, entries_count do
			local id = load_string(f)
			local src_text = load_string(f)
			local trans_text = load_string(f)

			table.insert(bundle, { id = id, src_text = src_text, trans_text = trans_text })
		end

		assert(#bundle == entries_count)

		magic = load(f, 2, "<H")
		print("BUNDLE_END_MAGIC", magic)
		assert(magic == BUNDLE_END_MAGIC)
		
		return name, bundle
	end

	local function load_bundles(f)
		local bundles_count = load(f, 4, "<I")
		print(bundles_count)

		local bundles = {}
		for i = 1, bundles_count do
			local name, bundle = load_bundle(f)
			bundles[name] = bundle
		end

		return bundles
	end

	load_header(f)
	local bundles = load_bundles(f)

	f:close()
	return bundles
end

local function load_bundles(bundles)
	local function load_bundle(name, bundle)
		local src2trans = {}
		local id2trans = {}
		context_map[name] = src2trans
		id_map[name] = id2trans

		for _, entry in ipairs(bundle) do
			local id = entry.id
			local src_text = entry.src_text
			local trans_text = entry.trans_text

			if id and #id > 0 then
				id2trans[id] = entry.trans_text or ""
			end
			if src_text and #src_text > 0 then
				src2trans[src_text] = entry.trans_text or ""
			end
		end
	end

	for name, bundle in pairs(bundles) do
		if type(name) == "string" and type(bundle) == "table" then
			load_bundle(name, bundle)
		end
	end
end

function _M:load_pack(language)
	local path = PACK_PATH_PATTERN:format(language)
	pcall(function()
		load_bundles(load_bin_v1(language, path))
	end)
end
auto_method(_M, "load_pack")

-- load language binary pack
if _LANG ~= "zh-CN" then
	_M:load_pack(_LANG)
end

return _M