local script_list = 
{
	"social//team_platform_func.lua",
	"sds_api//common.lua",
	"sds_api//debug.lua",
	"sds_api//dlgapi.lua",
	"sds_api//dlgapiex.lua",
	"sds_api//game.lua",
	"sds_api//global.lua",
	"sds_api//host.lua",
	"sds_api//league.lua",
	"sds_api//music.lua",
	"sds_api//pet.lua",
	"sds_api//skill.lua",
	"sds_api//task.lua",
}

function GetDocList()
	local list = {"%.luadoc$", }
	for _, script in ipairs(script_list) do
		script = string.gsub(script, "%.", "%%%.")
		script = string.gsub(script, "//", "%%%/")
		table.insert(list, script)
	end
	return list
end