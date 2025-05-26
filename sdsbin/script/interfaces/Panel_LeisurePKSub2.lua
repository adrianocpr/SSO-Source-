local DlgApi		= DlgApi
local GameApi		= GameApi
local DlgTemplate 	= DlgTemplate
local Format, type,Len	= string.format, type,string.len
local Random		= math.random
local Insert,Concat		= table.insert,table.concat
Panel_LeisurePKSub2 = DlgTemplate:new({this = "Panel_LeisurePKSub2"})

--[[战报
vsDetail = 
{
	player1 = "xxx"
	player2 = "xxx"
	result = 1,2 1=player1,2=player2
	dmgs = {d1,d2,...,}
	skills = {s1,s2,...,}
}
]]--

local Leisure_Skill = 
{
	stone = 1,
	shear = 2,
	pack = 4,
}

local Player_Winer = 
{
	player1 = 1,
	player2 = 2,
}

local m = require("STRING_TABLE")

function Panel_LeisurePKSub2:GetVsText(vsDetail,isSplit)
	local text = {}
	local atker,attacked,fight,winner
	for i,dmg in ipairs(vsDetail.dmgs) do
		if i%2 == 1 then
			atker = vsDetail.player1
			attacked = vsDetail.player2
		else
			atker = vsDetail.player2
			attacked = vsDetail.player1
		end
		local fightFrom = nil
		if vsDetail.skills then
			local skill = vsDetail.skills[i]
			if skill == Leisure_Skill.stone then
				fightFrom = m.Leisure_Arena_Vs_Skill_Desc.stone
			elseif skill == Leisure_Skill.shear then
				fightFrom = m.Leisure_Arena_Vs_Skill_Desc.shear
			elseif skill == Leisure_Skill.pack then
				fightFrom = m.Leisure_Arena_Vs_Skill_Desc.pack
			end
		else
			fightFrom = m.Leisure_Arena_Vs_Skill_Desc.common
		end
		if fightFrom then
			fight = fightFrom[Random(#fightFrom)]
		end
		if atker and attacked and fight then
			local detailFormat = "%d."..fight..","..m.Leisure_Arena_Vs_Desc.dmg
			Insert(text,Format(detailFormat,i,atker,attacked,dmg))
		end
	end
	local vsResult = nil
	if vsDetail.result == Player_Winer.player1 then
		winner = vsDetail.player1
	elseif vsDetail.result == Player_Winer.player2 then
		winner = vsDetail.player2
	end
	if winner then
		vsResult = Format(m.Leisure_Arena_Vs_Desc.result,winner)
	end

	local header = m.Leisure_Arena_Vs_Desc.start
	if #text == 0 then
		Insert(text,"")
	else
		if vsDetail.isPlayer1OnLine == false then
			header = header .. Format(m.Leisure_Arena_Vs_Desc.offLine,vsDetail.player1)
		end
		if vsDetail.isPlayer2OnLine == false then
			header = header .. Format(m.Leisure_Arena_Vs_Desc.offLine,vsDetail.player2)
		end	
	end	
	text[1] =  header.. text[1]
	if vsResult then
		text[#text] = text[#text] .. vsResult
	end
	if isSplit then
		return text
	else
		return Concat(text)
	end
end

