local LuaLoadFile, GlobalApi, GameApi, pcall = LuaLoadFile, GlobalApi, GameApi, pcall

local MessageBox = function(_fileName, err)
	local msg = string.format("fail to load file: %s.\r\n%s", tostring(_fileName), tostring(err))
	DebugApi.MessageBox(msg)
end

-- function for marking and loading i18n strings, using default i18n context.
_G._t = require("i18n").context()

function dofile(_fileName)
    -- 加载
    local chunk, err = LuaLoadFile(_fileName)
    if not chunk then
        return false, err
    end
    -- 运行
    local success, err = pcall(chunk)
    if not success then
        return false, err
    end    
    return true
end


function dofile_show_err(_fileName)
    -- 加载
    local chunk, err = LuaLoadFile(_fileName)
    if not chunk then
        GlobalApi.Log(tostring(err))
        MessageBox(_fileName, err)
        return false
    end
    -- 运行
    local success, err = pcall(chunk)
    if not success then
        GlobalApi.Log(tostring(err))
        MessageBox(_fileName, err)
        return false
    end    
    return true
end


-----------------------
-- 加载expand.lua
local function load_expand()
	local chunk, err = LuaLoadFile("script/expand.lua")
    if chunk then
        string.expand = chunk()
    else
        error(err)
    end
end
load_expand()


-----------------------
-- 预加载加载
function load_preload_gfx()
--    for prof, list in pairs(preload_gfx) do
--        for _, gfx in ipairs(list) do
--            GameApi.PreloadGfx(gfx)
--        end
--    end
end