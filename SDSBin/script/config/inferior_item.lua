--------------------------------------------
--快速出售物品配置

local GRAY  = 0		--  残破[灰]
local WHITE = 1		--  普通[白]
local GREEN = 2		--  优秀[绿]
local BLUE	= 3		--  精良[蓝]
local inferior_data = 
{
 	{main = 20, sub = 1, leaf = 0, quality = GREEN},
 	{main = 1, sub = 1, leaf = 0, quality = BLUE},
 	{main = 1, sub = 2, leaf = 0, quality = BLUE},
 	{main = 1, sub = 3, leaf = 0, quality = BLUE},
 	{main = 1, sub = 4, leaf = 0, quality = BLUE},
 	{main = 1, sub = 5, leaf = 0, quality = BLUE},
 	{main = 1, sub = 6, leaf = 0, quality = BLUE},
}



inferior_item = {}

function inferior_item:key(main, sub, leaf)
    return main * 1000000 + sub * 1000 + leaf
end

function inferior_item:init()
    local key = nil
    for _, info in ipairs(inferior_data) do
        key = self:key(info.main, info.sub, info.leaf)
        self[key] = info
    end    
end
inferior_item:init()


function inferior_item:IsInferiorItem(id, main, sub, leaf, quality)
    local key = self:key(main, sub, leaf)
    local info = self[key]
    if info and info.quality then
        return quality <= info.quality
    end
    return false
end