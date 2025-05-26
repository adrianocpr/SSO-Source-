module("mid", package.seeall)

function get_media_id()
    local file = io.open("bin\\mid", "r")
	if not file then return end

	local mid_name
	for line in file:lines() do
		local n1, n2, mid_name = string.find(line, "mid=(%S+)")
		if n1 and n2 and mid_name then
		    return mid_name
		end		
	end
	file:close()
	return mid_name
end