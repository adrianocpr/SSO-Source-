local DlgApi	= DlgApi
local GameApi	= GameApi
local DlgTemplate = DlgTemplate
local Format 	= string.format
local sandbox = require("sandbox")

local dlg = ui.dialog.get("Panel_Console")
Panel_Console = dlg

local suggestion = dlg:get_obj("List_Suggestion")
local edit = dlg:get_obj("DEFAULT_Command")
local console_obj = dlg:get_obj("Command_Edit")
local text_info = dlg:get_obj("Text_Info")

local current_suggestions = {}
local cmd_history = {}

local NORMAL_COLOR = 0xffffff
local LUA_MODE_COLOR = 0xff9900

-------------------------------------
--		overrides
-------------------------------------
function dlg:Init()
	console_obj:command(self.OnCommandEdit)
	suggestion:command(self.OnListSelect)

	self:register_event(WM_KEYDOWN, self.OnEventKeyDown)
	self:register_event(WM_KEYUP, self.OnEventKeyUp)
	self:register_event(WM_LBUTTONUP, self.OnMouseUp)
	self:register_event(WM_CHAR, self.OnEventChar)
	self:register_event(WM_IME_ENDCOMPOSITION, self.OnEventIME)

	text_info:hide()
	self.lua_mode_env = nil
end

function dlg:ShowDialog()
	suggestion:hide()
	suggestion:call_api("DeleteListAllItems")
	self:change_focus(edit)
end

-------------------------------------
--		windows message
-------------------------------------
function dlg:OnMouseUp()
	self:change_focus(edit)
	return false
end

function dlg:OnCommandEdit()
    local is_suggestion_shown = suggestion:is_show()
    local cur_sel = suggestion:call_api("GetListCurLine")
    if is_suggestion_shown and cur_sel ~= -1 then
        self:SelectSuggestion()
        self:UpdateSuggestion()
    else
    	edit:set_text("");
    end
end

function dlg:OnEventKeyDown(item, key, ...)
	local is_suggestion_shown = suggestion:is_show()
	local cur_sel = suggestion:call_api("GetListCurLine")
	if key == VK_ESCAPE then
		if is_suggestion_shown then
			suggestion:hide()
		else
			edit:set_text("")
			self:hide()
		end
		return true
	elseif key == VK_UP or key == VK_DOWN or key == VK_PRIOR or key == VK_NEXT then
		local target = is_suggestion_shown and suggestion or console_obj
		target:deal_message(WM_KEYDOWN, key, unpack(arg))

		if not is_suggestion_shown and (key == VK_UP or key == VK_DOWN) then
			local cmd = console_obj:call_api("GetConsoleLine")
			edit:set_text(cmd)
		end
		return true
	end	
	return false
end

function dlg:OnEventKeyUp(item, key, ...)
	if key == VK_ESCAPE or key == VK_UP or key == VK_DOWN or key == VK_PRIOR or	key == VK_NEXT then
		return false
	end

	if key == VK_ENTER or key == VK_SPACE then
		if suggestion:is_show() then
			suggestion:select()
			return true
		end
		return false
	end

	suggestion:update()
	return false
end

function dlg:OnEventChar(item, char_code, ...)
	local is_suggestion_shown = suggestion:is_show()
	local cur_sel = suggestion:call_api("GetListCurLine")
	local char = string.char(char_code)
	if char == "~" then
		local cmd = edit:get_text()
		edit:set_text(cmd:sub(1, -2))
		self:hide()
		return true
	elseif char == "\r" and (cur_sel < 0 or not is_suggestion_shown) then
		local cmd = edit:get_text()
		console_obj:call_api("SetConsoleLine", cmd)
		console_obj:deal_message(WM_CHAR, char_code, unpack(arg))
		self:run_command(cmd)
		edit:set_text("")
		suggestion:update()
		return true
	end
	return false
end

function dlg:OnEventIME(item, ...)
	suggestion:update()
	return false
end

function dlg:OnListSelect()
	suggestion:select()
	self:change_focus(edit)
end

function dlg:run_command(cmd)
	if self:is_in_lua_mode() then
		if cmd == "end_lua" then
			self:exit_lua_mode()
			return
		end
		local chunk, err = loadstring(cmd)
		if not chunk then
			console.error(err)
		else
			setfenv(chunk, self.lua_mode_env)
			local success, msg = pcall(chunk)
			if not success then
				console.error(msg)
			end
		end
	else
		console.run(cmd)
	end
end

function dlg:is_in_lua_mode()
	return self.lua_mode_env and true or false
end

function dlg:enter_lua_mode()
	self.lua_mode_env = sandbox.create_full()
	edit:set_color(LUA_MODE_COLOR)
end

function dlg:exit_lua_mode()
	self.lua_mode_env = nil
	edit:set_color(NORMAL_COLOR)
end

-------------------------------------
--		function called by others
-------------------------------------
local function format_suggestion(key, input)
	local value = console.suggestions[key] or ""
	local text = ""
	if type(value) == "table" then
		text = value.text or ""
	else
		text = tostring(value)
	end
	key = key:gsub(input, "^ff8000" .. input .. "^N")
	text = text:gsub(input, "^ff8000" .. input .. "^59ACFF")
	return string.format("%s\t^59ACFF%s", key, text)
end

local function format_info(key)
	local value = console.suggestions[key] or ""
	local args = ""
	local text = ""
	if type(value) == "table" then
		args = value.args or ""
		text = value.text or ""
	else
		text = tostring(value)
	end
	return string.format("%s %s\r^59ACFF%s", key, args, text)
end

-------------------------------------
-- suggestion
-------------------------------------

suggestion.current_suggestions = {}

function suggestion:select(index)
	index = index or self:call_api("GetListCurLine")
	if index >= 0 then
		local cmd = self.current_suggestions[index + 1]
		if cmd then
			edit:set_text(cmd .. " ")
		end
		self:call_api("SetListCurLine", -1)
		self:update()
	end
end

function suggestion:clear()
	self:hide()
	text_info:hide()
	self:call_api("SetListText", {})
end

function suggestion:update()
	local input = edit:get_text()
	local list = {}

	if #input <= 0 or dlg:is_in_lua_mode() then
		self:clear()
		return
	end
	
	self.current_suggestions = {}
	local candidates = self.current_suggestions
	input = input:gsub("^%s+", "")
	local lower_input = input:lower()

	for k, v in pairs(console.suggestions) do
		local text = ""
		if type(v) == "table" then
			text = v.text or ""
		else
			text = tostring(v)
		end
		if k:lower():find(lower_input, 1, true) or text:lower():find(lower_input, 1, true) then
			table.insert(candidates, k)
		end
	end

	table.sort(candidates, function(str1, str2)
		if type(str1) == "string" and type(str2) == "string" then
			local index1 = str1:lower():find(lower_input, 1, true) or math.huge
			local index2 = str2:lower():find(lower_input, 1, true) or math.huge
			if index1 == index2 then
				return str1 < str2
			else
				return index1 < index2
			end
		end
		return false
	end)

	for _, cand in ipairs(candidates) do
		table.insert(list, format_suggestion(cand, input))
	end
	
	self:call_api("SetListText", list)
	self:call_api("SetListCurLine", -1)
	self:show(#list > 0)
	text_info:hide()
		
	if #list <= 1 then
		local match = ""
		for k, _ in pairs(console.suggestions) do
			if #k > #match then
				if lower_input:find(k:lower(), 1, true) == 1 then
					match = k
				end
			end
		end
		
		text_info:show(#match > 0)
		if #match > 0 then
			self:hide()
			text_info:set_text(format_info(match))
		end
	end
end
