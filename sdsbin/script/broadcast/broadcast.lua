module("broadcast", package.seeall)

local channel = {}

channel[1] = 
{
	name = _t"白羊座电台",
	url = "http://www.playradio.cn/game_separate/game_seiya.html",
}


function _M:GetAllChannels()
	local list = {}
	for index,v in ipairs(channel) do
		local item = {}
		item.index = index
		item.name = v.name
		item.url = v.url
		table.insert(list,item)
	end
	return list
end

function _M:GetChannel(index)
	return channel[index]
end
