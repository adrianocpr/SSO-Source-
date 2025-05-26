local UIManTemplate = UIManTemplate
local DlgApi  = DlgApi
local GameAi = GameAi
local Format = string.format

local socket_url = require("socket.url")
local llthreads = require("llthreads")
local xml = require("slaxdom")

LoginUI = UIManTemplate:new({this = "LoginUI", index = UIMAN_LOGIN})
glb_curUIMan = LoginUI

local function log(...)
	local args = {...}
	local buf = {}
	for _, v in ipairs(args) do
		table.insert(buf, v ~= nil and tostring(v) or "nil")
	end
	GlobalApi.Log(table.concat(buf, ", "))
end

function LoginUI:Init()
end


function LoginUI:ResizeWindows()
end

local customize_icons =
{
	body = "res/login/body_${gender}_${index}.png",
	face = "res/login/face_${gender}_${index}.png",
	eye = "res/login/eye_${gender}_${index}.png",
	faceDecoration = "res/login/face_decoration_${gender}_${index}.png",
	hair = "res/login/hair_${gender}_${index}.png",
	saintCloth = "res/login/saint_cloth_${index}.png"
}

function LoginUI:GetCustomizeIconPath(customize_type, gender, index)
	local env =	{
		index = index,
		gender = gender == 0 and "m" or "f",
	}

	local url = customize_icons[customize_type] or ""
	return string.expand(url, env)
end

local function parse_url_query(query)
	local result = {}
	for k, v in string.gmatch(query, "([^&=]+)=([^&]+)") do
	    result[k] = v
    end
    return result
end

function LoginUI:CheckBrowserURLForLogin(url)
	local parsed = socket_url.parse(url)
	if not parsed then return nil end

	local path = parsed.path or ""
	local query = parsed.query or ""
	if path:find("ticket") then
		local q = parse_url_query(parsed.query)
		if q.userId and q.agent and q.ticket then
			local username = nil
			local password = q.ticket
			if q.agent == "dev_test" then
				-- special agent string for local test
				username = q.userId
			else
				username = ("%s@%s@sso"):format(q.userId, q.agent)
			end
			return {username = username, password = password}
		end
	end
	return nil
end

local function http_request(url, on_success, on_error)
	local lua_env =
	{
		package_path = package.path
	}

	local thread_code = [[
		local chunk, err = LuaLoadFile("script/bootstrap.lua")
		if chunk then
			local success, err = pcall(chunk)
		    if not success then
		        return nil, err
		    end    
		else
			return nil, err
		end

		local arg = {...}

		local http = require("socket.http")
		http.TIMEOUT = 10
		return http.request(unpack(arg))
	]]

	local thread = llthreads.new(thread_code, url)
	thread:start()

	local interval_id = 0
	interval_id = set_interval(function()
		local success, response, code = thread:join(10)
		local err = success and nil or response

		if success then
			if type(on_success) == "function" then
				on_success(response, code)
			end
			clear_interval(interval_id)
		elseif err ~= "timeout" then
			if type(on_error) == "function" then
				on_error(err)
			end
			clear_interval(interval_id)
		end
	end)
end

local function element_text(el)
	local pieces = {}
	for _, n in ipairs(el.kids) do
		if n.type == "element" then 
			table.insert(pieces, element_text(el))
		elseif n.type == "text" then
			table.insert(pieces, n.value)
		end
	end
	return table.concat(pieces)
end

function LoginUI:FetchAnnouncement(url, callback)
	log("LoginUI:FetchAnnouncement, url = ", url)
	http_request(url, 
		function(response, code)
			log("LoginUI:FetchAnnouncement, success. code = ", code)
			if type(callback) == "function" then
				if response and code == 200 then
					local doc = xml:dom(response)
					local content = element_text(doc.root)
					callback(content)
				else
					callback("")
				end
			end
		end, 
		function(err)
			log("LoginUI:FetchAnnouncement, success. err = ", err)
			if type(callback) == "function" then
				callback("")
			end
		end
	)
end


-------------------
--init game status
do
    Panel_HelpSecretary = nil
    Panel_HelpLevelTips = nil
end

