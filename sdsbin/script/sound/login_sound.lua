------------------------------------------------
-- Login sound
-- 
-- Created by Feng Bo
--

module("LOGIN_SOUND", package.seeall)

MUSIC_LOGIN = "{f3c61ce8-d657-4cd4-8064-aaeb1c3fd7fb}"
MUSIC_SELECT_CHARACTER = "{2e930f74-3f74-4d07-9989-175a1d1e9c1b}"
MUSIC_CREATE_CHARACTER = "{7ff9f227-af73-4f73-b3db-1af52b4bfca3}"

BUTTON_CLICK = "{ab5c068a-2832-49f5-ad13-78c779c67b0b}"
CHECK_CLICK = "{1196bb59-4d97-4289-a4dd-0729f9d8e049}"
LOGIN = "{7dbb6bf5-cd33-4b91-bc10-928d2bedaa15}"
START_GAME = "{cb13e365-33e9-4dbe-ad59-efa6e92facef}"
MOUSE_OVER = "{facb2245-9089-4059-8a89-f06aa395ec80}"
FLY_IN = "{c7540425-c419-4798-bf8b-f8c01d36e6a2}"
FLY_OUT = "{cb2c5a3b-6990-400f-ac7d-5b9c84a87ace}"
LIST_SLIDE_OUT = "{cc196623-5ac7-4962-8b91-b172ecad878e}"
LIST_SLIDE_IN = "{56095ba1-bf58-4fb2-a771-1dd3cb779a8a}"
PAGE = "{a13a01d7-cbd3-4c9b-a183-fc17e59dc5cd}"


local sound_config = 
{
	default =
	{
		buttonPress = BUTTON_CLICK,
		rollOver = MOUSE_OVER,
		dropDownShow = LIST_SLIDE_OUT,
		dropDownHide = LIST_SLIDE_IN,
		["login.listSlideIn"] = LIST_SLIDE_IN,
		["login.listSlideOut"] = LIST_SLIDE_OUT,
		["login.flyIn"] = FLY_IN,
		["login.flyOut"] = FLY_OUT,
	},

	btnLogin =
	{
		buttonClick = LOGIN,
	},

	btnEnter =
	{
		buttonClick = START_GAME,
	},

	btnServer =
	{
		buttonClick = "",
	},

	checkSaveUsername =
	{
		buttonClick = CHECK_CLICK,
	},

	checkForce =
	{
		buttonClick = CHECK_CLICK,
	},
}


------------------------------------------------
local function init_sound_config()
	for k, v in pairs(sound_config) do
		if type(v) == "table" and k ~= "default" then
			setmetatable(v, {__index = sound_config.default})
		end
	end
end
init_sound_config()

function _M:GetGUID(key)
	return _M[key] or ""
end

function _M:GetUISoundGUID(event, instance)
	local cfg = sound_config[instance] or sound_config.default
	return cfg[event] or ""
end