Panel_ArmyMiracle = ui.dialog.get("Panel_ArmyMiracle")

local dlg = Panel_ArmyMiracle

local ALLOC_POINT_MAX = 
{
	8, -- 防御门
	1, -- 高级找车
	1, -- 高级箭塔
	2, -- 军团神威1
	2, -- 军团神威2
	2, -- 军团神威3
	2, -- 军团神威4
}

local IMAGE_PATH =
{
	"kosumo\\4\\Radio_4Checked.tga", -- 防御门
	"kosumo\\4\\Radio_4Checked.tga", -- 高级战车
	"kosumo\\4\\Radio_4Checked.tga", -- 高级箭塔
	"kosumo\\4\\Radio_4Checked.tga", -- 军团神威1
	"kosumo\\4\\Radio_4Checked.tga", -- 军团神威2
	"kosumo\\4\\Radio_4Checked.tga", -- 军团神威3
	"kosumo\\4\\Radio_4Checked.tga", -- 军团神威4
}

function dlg:GetIconImagePath(index)
    return IMAGE_PATH[index] or ""
end

function dlg:GetScienceAllocMax(index)
    return ALLOC_POINT_MAX[index] or 0
end


