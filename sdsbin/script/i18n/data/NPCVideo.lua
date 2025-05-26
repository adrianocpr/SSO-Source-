-- NPC的模板ID对应视频路径
local VideoList = {}

-- 天马职业介绍
VideoList[5087] = "videos\\mp4\\prof02.mp4"
-- 天龙职业介绍
VideoList[5088] = "videos\\mp4\\prof04.mp4"
-- 白鸟职业介绍
VideoList[5089] = "videos\\mp4\\prof03.mp4"
-- 仙女职业介绍
VideoList[5090] = "videos\\mp4\\prof05.mp4"
-- 凤凰职业介绍
VideoList[5091] = "videos\\mp4\\prof06.mp4"


NPCVideo = {}
function NPCVideo:GetVideo (npc_id)
	if VideoList[npc_id]==nil then
	    return ""
	end
	return	VideoList[npc_id]
end
