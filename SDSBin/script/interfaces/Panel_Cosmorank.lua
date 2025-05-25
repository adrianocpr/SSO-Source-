local DlgApi		= DlgApi
local GameApi		= GameApi
local DlgTemplate 	= DlgTemplate
local Format 	  	= string.format
Panel_Cosmorank = DlgTemplate:new({this = "Panel_Cosmorank"})

local UISetting = 
{
	[2] = --[prof]
	{
		img = "res\\exam\\1.dds",
		pos = { {151,76},{163,215},{64,155},{149,268},},
	},
	[3] = --[prof]
	{
		img = "res\\exam\\2.dds",
		pos = { {159,114},{202,214},{88,175},{198,342},},
	},
	[4] = --[prof]
	{
		img = "res\\exam\\3.dds",
		pos = { {159,114},{202,214},{88,175},{198,342},},
	},
	[5] = --[prof]
	{
		img = "res\\exam\\4.dds",
		pos = { {159,114},{202,214},{88,175},{198,342},},
	},
	[6] = --[prof]
	{
		img = "res\\exam\\5.dds",
		pos = { {159,114},{202,214},{88,175},{198,342},},
	},
	[7] = --[prof]
	{
		img = "res\\exam\\6.dds",
		pos = { {157,95},{281,221},{42,220},{155,239},},
	},
}

local StarItemFmt = 
{
	"Image_N%d","Image_Up%d","Image_Light%d",
}

function Panel_Cosmorank:UpdateUI(prof)
	if not UISetting[prof] then
		return
	end
	DlgApi.SetImageFile(self.this,"Img_Bg",UISetting[prof].img,1)
	for i,pos in ipairs(UISetting[prof].pos) do
		for _,itemFmt in ipairs(StarItemFmt) do
			local itemStr = Format(itemFmt,i)
			local rect = DlgApiEx.GetItemDefaultRect(self.this,itemStr)
			if rect then
				local x = pos[1] - rect.width/2
				local y = pos[2] - rect.height/2
				DlgApiEx.SetItemDefaultPos(self.this,itemStr,x,y)
			end
		end
	end
end