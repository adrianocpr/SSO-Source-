-------------------------------
--内存加载配置
-------------------------------
Memory_Load_Check = 
{
	load_ornament = true,
	load_terrain_data = true,
	load_terrain_outline = true,
	load_player = true,
	load_npc = true,
	load_ui = true,
}

local UI_Dlg_Create_Filter = 
{
	["Panel_DragDrop.xml"] = true,
	["Panel_DragDropEx.xml"] = true,
	["Panel_EnterWait.xml"] = true,
	["Panel_MsgBoxSample.xml"] = true,
	["Panel_QuickBar.xml"] = true,
	["Panel_Console.xml"] = true,
	["Panel_Esc.xml"] = true,
	["Panel_MessageQuit.xml"] = true,
}

function Memory_Load_Check:IsDlgCanCreate(panel_name)
	if UI_Dlg_Create_Filter[panel_name] then
		return true
	end
	return false
end