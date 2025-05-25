local api = ConsoleApi
local GameApi = GameApi
local DlgApi = DlgApi
local DlgApiEx = DlgApiEx
local _G = _G
local string = string
local tostring = tostring
local unpack = unpack
local table = table
local ipairs = ipairs
local type = type
local os = os
local require = require
local sandbox = require("sandbox")

module "console"

c2s_simple = 
{
	get_item_sequence = {id = 10808, args = 2},
	teleport = {id = 2008, args = 3},
	set_vp = {id = 1981, args = 1},
	money = {id = 1986, args = 1},
	bind_money = {id = 1987, args = 1},
	rmb = {id = 1985, args = 1},
	forget_skill = {id = 2042, args = 1},
	produce_skill_exp = {id = 8016, args = 2},
	produce_skill_level_up = {id = 8017, args = 1},
	gen_ore = {id = 10804, args = 1},
	add_title = {id = 2014, args = 1},
	remove_title = {id = 2015, args = 1},
	add_repu = {id = 2016, args = 2},
	set_repu = {id = 2017, args = 2},
	controller = {id = 10801, args = 2},
	stored_exp_add = {id = 2025, args = 1},
	stored_exp_trans = {id = 2026, args = 1},
	switch_prof = {id = 10826, args = 1},
	add_account_repu = {id = 2036, args = 2},
	set_account_repu = {id = 2037, args = 2},
	add_friendship = {id = 2029, args = 1},
	
	test_text_pack = {id = 30001, args = 2},
	test_monster_pack = {id = 30002, args = 2},
	
	pet_level = {id = 3006, args = 2},

	set_server_time = {id = 20002, args = 5},
	
	show_global_params = 4000,
	show_scene_params = 4002,
	
	reload_ai_script = 10806,
	safe_lock_off = 1000,
	full_hp_mp = 1980,
	trig_captcha = 2032,
	award_captcha = 2033,

	dungeon_create = {id = 5000, args = 1},
	dungeon_close = 5001,
	dungeon_create_f = {id = 5003, args = 1},
	dungeon_enter = {id = 5004, args = 1},
	dungeon_counter_clear = 5005, 

	photo_book_add = {id = 2060, args = 1},
}

c2d_simple = 
{
	league_level = {id = 205, args = 1},
	
	league_del = 202,
	league_base_recycle = 211,
}

---------------------------
-- command implementations
function info(msg, color)
	msg = tostring(msg) or ""
	for line in string.gmatch(msg, "[^\r\n]+") do
		api.info(line, tostring(color))
	end
end

function error(msg)
	info(msg, "ff0000")
end

function d(...)
	api.c2scmd(unpack(arg))
end

function c2dcmd(id, ...)
	-- because api.c2dcmd only accept strings, we have to convert the args for it.
	local args = {}
	for _, v in ipairs(arg) do
		table.insert(args, tostring(v))
	end
	api.c2dcmd(id, unpack(args))
end

-- api.c2dcmd_ints accepts int values as a vector, server supports it in some acpect.
-- talk with server coder if u want 2 use it.
-- it use cmd 180 instead of 107
function c2dcmd_ints(id, ...)
	local args = {}
	for _, v in ipairs(arg) do
		table.insert(args, v)
	end
	api.c2dcmd_ints(id, unpack(args))
end

function lua(...)
	local code = table.concat({...}, " ")
	code = code:gsub("^%s+", "")

	if #code > 0 then
		local box = sandbox.create_full()
		local chunk, err = loadstring(code)
		if not chunk then
			_M.error(err)
		else
			setfenv(chunk, box)
			local success, msg = pcall(chunk)
			if not success then
				_M.error(msg)
			end
		end
	else
		local dlg = _G.Panel_Console
		if dlg then
			dlg:enter_lua_mode()
		end
	end
end
d_lua = lua

function broadcast(msg)
	msg = msg or ""
	api.c2dcmd(300, tostring(msg))
end

function verbose(is_verbose)
    is_verbose = is_verbose or true
    if type(is_verbose) == "number" then
        is_verbose = is_verbose ~= 0
    end
    api.verbose(is_verbose)
end

function skip_client_validation(is_skip)
    is_skip = is_skip or true
    if type(is_skip) == "number" then
        is_skip = is_skip ~= 0
    end
    api.skip_client_validation(is_skip)
end

function listen(_type, mode)
	local type_map = {["dlv"] = 0, ["gs"]  = 1, ["2dlv"] = 2, ["2gs"] = 3}
	local mode_map = {off = 0, on = 1, on_exclude = 2}
	api.listen(type_map[string.lower(_type)] or _type, mode_map[string.lower(mode)] or mode)
end

function get_item(id, count, life_time)
	life_time = life_time or 0
	count = count or 1
	d(10807, id, count, life_time)
end

function get_cloth(cloth_id)
	d(2065, cloth_id)
end

function get_tempitem(id, count, life_time)
	life_time = life_time or 0
	count = count or 1
	d(10811, id, count, life_time)
end

function move_tempitem(tempidx, count, idx)
	d(40004, tempidx or 0, count or 1, idx or 0)
end

function gen_monster(id, count, life_time)
	life_time = life_time or 100
	count = count or 1
	d(10802, id, count, life_time, 0)
end

function learn_skill(id, level)
	if not level then
		level = (GameApi.GetHostSkillLevel(id) or 0) + 1
	end 
	d(2040, id, level)
end

function level_up(level)
	if not level then
		d(2000)
	else
		d(2003, level)
	end
end

function speed(s)
	s = s or 20
	d(2013, 740404, s)
end

function set_y(s)
	d(2012, 740404, s)
end

function set_home(...)
	if table.maxn(arg) >= 3 then
		d(1001, unpack(arg))
	else
		d(1002)
	end
end

function shortcut(...)
	local cmd = table.concat(arg, " ")
	return api.shortcut("batch " .. cmd)
end

function show_dialog(...)
	for _,v in ipairs(arg) do
		local is_show = DlgApi.IsDialogShow(v)
		DlgApi.ShowDialog(v, not is_show)
	end
end

function show_buff()
	local result = {}
	local buffs = GameApi.GetHostBuff()
	for _, buff in ipairs(buffs) do
		local lv = GameApi.GetHostBuffLevel(buff)
		local str = tostring(buff)
		if lv > 1 then
			str = string.format("%s(lv%d)", str, lv)
		end
		table.insert(result, str)
		if #result >= 5 then
			info("buffs: " .. table.concat(result, ", "))
			result = {}
		end
	end
	info("buffs: " .. table.concat(result, ", "))
end

function show_repu(...)
	local function print_value(id)
		local value = GameApi.GetHostRepuValue(id)
		info(string.format("声望%d = %d", id, value))
	end

	if #arg <= 0 then
		for id = 0, 31 do
			print_value(id)
		end
	end

	for _, id in ipairs(arg) do
		if type(id) == "number" then
			print_value(id)
		end
	end
end

function show_team_repu(...)
	local function print_value(id)
		local value = GameApi.GetTeamReputation(id)
		info(string.format("队伍/团队声望%d = %d", id, value))
	end

	if #arg <= 0 then
		for id = 0, 4 do
			print_value(id)
		end
	end

	for _, id in ipairs(arg) do
		if type(id) == "number" then
			print_value(id)
		end
	end
end

function show_league_repu(...)
	local function print_value(id)
		local value = GameApi.GetLeagueReputation(id)
		info(string.format("军团声望%d = %d", id, value))
	end

	if #arg <= 0 then
		for id = 0, 31 do
			print_value(id)
		end
	end

	for _, id in ipairs(arg) do
		if type(id) == "number" then
			print_value(id)
		end
	end
end

function show_league_inc_repu(inc_type, id)
	local type_map = {
		full = 0,
		day = 1,
		week = 2,
		month = 3,
	}
	local name_map = {
		[0] = "增量声望",
		[1] = "部分增量声望-日",
		[2] = "部分增量声望-周",
		[3] = "部分增量声望-月",
	}

	local inc_type_value = 0
	if type(inc_type) == "string" then
		inc_type_value = type_map[inc_type:lower()] or 0
	else
		-- arg inc_type is skipped.
		id = inc_type
	end

	local name = name_map[inc_type_value] or "???"

	local value = GameApi.GetLeagueIncrementReputation(inc_type_value, id)
	if not value then
		error(string.format("军团%s %d不存在", name, id))
		return
	end
	info(string.format("军团%s %d", name, id))
	info("本日增量=" .. value.day_increase)
	info("本周增量=" .. value.week_increase)
	info("本月增量=" .. value.month_increase)
	info("昨日增量=" .. value.yesterday_increase)
	info("上周增量=" .. value.last_week_increase)
	info("上月增量=" .. value.last_month_increase)
end

function clear_bag()
	safe_lock_off()
	api.clear_bag()
end

function play_animation(id)
	local animation = _G.animation
	animation.play(id)
end

function cosmos_debug(oper_id)
    d(10822, oper_id)
end

function cosmos_value(value)
    d(10822, 5, value or 1000)
end

function cosmos_clear(value)
    d(10822, 7)
end

function play_camera(id)
    local camera = _G.smart_camera
    camera:play(id)
end

function play_swf(path)
	local animation = _G.animation
	path = "flash/" .. path
	animation:play_swf(path)
end

function play_system_ani(id)
    DlgApiEx.play_system_ani(id)
end

function add_global_params(id, value)
	value = value or 1
	d(4001, id, value)
end

function add_scene_params(id, value)
	value = value or 1
	d(4003, id, value)
end

function double_exp(value)
	if value > 1 then
		d(2004, value) -- add double_exp time
	else
		d(2005, value) -- toggle double_exp mode
	end
end

function add_soul_armor(armor_id, armor_lev)
	if armor_id and armor_lev then
		d(5041, armor_id, armor_lev)
	end
end

function league_add_repu(id, value)
	c2dcmd(207, string.format("%d=%d", id, value))
end

function exit()
    api.exit_game()
end

-- _prepare_add_inc_repu_args([inc_type], <id>, <sub_type>, <value>)
local function _prepare_add_inc_repu_args(...)
	local type_map = {
		full = 0,
		day = 1,
		week = 2,
		month = 3,
	}
	local sub_type_map = {
		[0] = -- full
		{
			["cur-day"] = 0,		["today"] = 0,
			["last-day"] = 6,		["yesterday"] = 6,
			["cur-week"] = 2,		["week"] = 2,
			["last-week"] = 8,
			["cur-month"] = 4,		["month"] = 4,
			["last-month"] = 10,
		},
		[1] = -- day
		{
			cur = 1,
			last = 7,
		},
		[2] = -- week
		{
			cur = 3,
			last = 9,
		},
		[3] = -- month
		{
			cur = 5,
			last = 11,
		},
	}

	-- make a copy of arg
	local args = {}
	for _, v in ipairs(arg) do
		table.insert(args, v)
	end

	local inc_type_str = args[1]
	local inc_type = 0
	if type(inc_type_str) == "string" then
		inc_type = type_map[inc_type_str:lower()] or 0
		table.remove(args, 1)
	end

	local id = table.remove(args, 1)
	local sub_type_str = table.remove(args, 1)
	local sub_type = 0
	if type(sub_type_str) == "string" then
		local map = sub_type_map[inc_type] or {}
		sub_type = map[sub_type_str:lower()] or 0
	end

	local value = table.remove(args, 1)

	
	return sub_type, id, value
end

-- league_add_inc_repu([inc_type], <id>, <sub_type>, <value>)
function league_add_inc_repu(...)
	local sub_type, id, value = _prepare_add_inc_repu_args(unpack(arg))

	info(string.format("sub_type=%d, id=%d, value=%d", sub_type, id, value))
	c2dcmd(209, 0, sub_type, id, value)
end

-- add_inc_repu([inc_type], <id>, <sub_type>, <value>)
function add_inc_repu(...)
	local sub_type, id, value = _prepare_add_inc_repu_args(unpack(arg))

	info(string.format("sub_type=%d, id=%d, value=%d", sub_type, id, value))
	d(2038, sub_type, id, value)
end

function themes(name)
    DlgApiEx.ChangeUIThemes(name)
end

function show_combat_power()
	info(string.format("combat power: %.1f", GameApi.GetHostCombatPower()))
end

function musicinfo()
    _G.glb_sound_info = not _G.glb_sound_info
    api.musicinfo()
end

function show_constellation_data(...)
	if #arg > 0 then
		for _, id in ipairs(arg) do
			info(string.format("[%d] = %d", id, GameApi.GetConstellationData(id)))
		end
	else
		for i = 0, 11 do
			show_constellation_data(i)
		end
	end
end

function lua_debug()
	local function start_debug() 
		require("debugger")()
	end
	start_debug()
end

function batch(...)
	if #arg <= 0 then return end
	local str = table.concat(arg, " ")

	for cmd in string.gmatch(str, "[^;]+") do
		run(cmd)
	end
end

function loop(count, ...)
	if #arg <= 0 then return end

	for i=1, count do
		batch(unpack(arg))
	end
end

function dungeon_exit()
	d(5002, 1)
end

function role_info()
	show_dialog("Panel_RoleInfoTest")
end

function game_count_birds()
	_G.dofile_show_err("script\\countbirds\\countbirds_db.lua")
	GameApi.ShowCountBirds(1)
end

function help_notify(typ, id)
    _G.help_man:add_other_data(typ, id)
end

function arena_dump()
	c2dcmd_ints(110)
    set_timeout(function() 
		DlgApi.ShowDialog("Panel_Arena", not DlgApi.IsDialogShow("Panel_Arena"))
		DlgApi.ShowDialog("Panel_Arena", true)
    end, 100)

end

function arena_set_tm_virtual(_year, _month, _day, _hour, _min, _sec)
	if not _year or not _month or not _day or not _hour or not _min or not _sec then
		return
	end

	c2dcmd_ints(111, _year, _month, _day, _hour, _min, _sec)	
	arena_dump()
end

function arena_set_tm_pairing_interval(pairing_interval)
	if not pairing_interval then
		return
	end

	c2dcmd_ints(112, pairing_interval)
	arena_dump()
end

function arena_set_tm_pairing_countdown(count_down)
	if not count_down then
		return
	end

	c2dcmd_ints(113, count_down)
	arena_dump()
end

function arena_set_pairing_threshold_score(threshold_score)
	if not threshold_score then
		return
	end

	c2dcmd_ints(114, threshold_score)
	arena_dump()

end

function arena_set_max_weekly_join_count(max_weekly_join_count)
	if not max_weekly_join_count then
		return
	end

	c2dcmd_ints(115, max_weekly_join_count)
	arena_dump()

end

function task_disable(id)
	if not id then return end
	c2dcmd(501, string.format("0-2-%d-0", id))
end

function task_enable(id)
	if not id then return end
	c2dcmd(501, string.format("1-2-%d-0", id))
end

function bgm_test(id)
    GameApi.PlayInterBGM("{8baf379e-ed67-4a2b-98d0-a45e3939117c}")
end

function gc()
    collectgarbage("collect")
end


enbale_teleprot_test = false
function teleport_test()
	enbale_teleprot_test = not enbale_teleprot_test
	if enbale_teleprot_test then
		teleport_run()
	end
end


function teleport_run()
	_G.set_interval(function()									
						local list = {"m 1", "m 2", "m 3", "m 4", "m 5", "relogin", }
						local idx = _G.math.mod(_G.math.random(1, 100000), #list) 
       					run(list[idx + 1])    								
						end, 2500)	
end

local test_map_interval_id
function test_map()
	local test_map_ptIndex = 1
	local test_map_pts = 
	{
		{map = 2,x = -223,y = 345},
		{map = 2,x = -121,y = 300},
		{map = 2,x = -203,y = 143},
		{map = 2,x = -209,y = 52},
		{map = 2,x = -109,y = 67},
		{map = 2,x = -167,y = 392},
		{map = 2,x = -307,y = 283},
		{map = 2,x = 67,y = 4},
		{map = 2,x = 85,y = -158},
		{map = 2,x = 391,y = -92},
		{map = 2,x = 272,y = -234},
		{map = 2,x = 314,y = -379},
		{map = 2,x = 150,y = -376},
		{map = 2,x = -21,y = -358},
	}
	test_map_interval_id = _G.set_interval(
		function ()
			if test_map_ptIndex > 1 then
				api.log_memory_info(true)
			end
			if test_map_ptIndex > #test_map_pts then
				_G.clear_interval(test_map_interval_id)
				return
			end
			local cmdstr = string.format("teleport %d %d %d",test_map_pts[test_map_ptIndex].map,
				test_map_pts[test_map_ptIndex].x,test_map_pts[test_map_ptIndex].y)
			run(cmdstr)
			test_map_ptIndex = test_map_ptIndex+1
		end,
	3000)
end