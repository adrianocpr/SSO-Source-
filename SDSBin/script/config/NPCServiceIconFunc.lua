---------------------------------------------------------------
--  created:   2012.10.20
--  author:    chenfudun
--  NPC列表图标接口
---------------------------------------------------------------

NPCServiceIconFunc = {}

function NPCServiceIconFunc:GetSelfServiceIconName(id)
	return NPCServiceIconList.SelfService[id]
end