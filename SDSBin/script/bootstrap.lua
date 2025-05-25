local LuaLoadFile, GlobalApi = LuaLoadFile, GlobalApi

local PACKAGE_PATH =
{
    "?",
    "?.lua",
    "script/?.lua",
    "script/?/?.lua",
    "script/?/init.lua",
    "script/lib/?.lua",
    "script/lib/?/?.lua",
    "script/lib/?/init.lua",
    "addons/lualibs/?.lua",
}
package.path = table.concat(PACKAGE_PATH, ";")
package.cpath = ""

-- A custom loader implementation, which support read files form pck files, 
-- to make "require" available in game.
local function custom_loader(module_name)
    if not LuaLoadFile or not GlobalApi or not GlobalApi.IsFileExist then return "custom loader is not available" end
    local err = ""
    local module_path = string.gsub(module_name, "%.", "/")
    for _, path in ipairs(PACKAGE_PATH) do
        local file_name = string.gsub(path, "%?", module_path)
        if GlobalApi.IsFileExist(file_name) then
            return assert(LuaLoadFile(file_name))
        end
    end
    return ("custom loader can't find module: %s"):format(module_name)
end

if LuaLoadFile and GlobalApi and GlobalApi.IsFileExist then
    table.insert(package.loaders, 2, custom_loader)
end