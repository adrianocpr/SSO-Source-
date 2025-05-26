------------------------
-- 客户端字符串资源
------------------------

local function load_string_table(file)
	dofile_show_err("script/i18n/" .. file .. ".lua")
end

-- 服务器错误码字符
load_string_table "server_error"

-- 客户端相关字符
load_string_table "url"

-- 载入其它字符串表
module("STRING_TABLE", package.seeall)
load_string_table "common"
load_string_table "login"
load_string_table "item"
load_string_table "quest"
load_string_table "social"
load_string_table "skill"
load_string_table "miscs"
load_string_table "stf"
load_string_table "help"
load_string_table "interface"
load_string_table "daily"
load_string_table "photobook"
load_string_table "dungeon"
load_string_table "leisure"
load_string_table "fight"
load_string_table "pet"
load_string_table "constellation"
load_string_table "animation"




function STRING_TABLE:GetString(key)
    return self[key]
end

-- TODO: The param "key" is useless
function ERROR_MSG_TABLE:GetString(iErrorCode, bLink, key)
    local prefix = bLink and "LINK_ERROR_" or "GS_ERROR_"
    return self[prefix .. iErrorCode]
end