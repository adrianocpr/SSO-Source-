local DlgApi	= DlgApi
local GameApi	= GameApi
local DlgTemplate = DlgTemplate
local Format 	= string.format
local _T = STRING_TABLE
Panel_Top = DlgTemplate:new({this = "Panel_Top"})

local MAX_CATEGORY = 5
local MAX_SUB_CATEGORY = 12
local MAX_CUSTOM_HEADER = 4

local selected_map = {}

-------------------------------------
--		overrides
-------------------------------------
local function toogle_dialog(name)
	local is_show = DlgApi.IsDialogShow(name)
	DlgApi.ShowDialog(name, not is_show)
end

function Panel_Top:Init()
	for i = 1, MAX_CATEGORY do
		local cat = LeaderBoard.Categories[i]
		DlgApi.ShowItem(self.this, "Radio_a" .. (i-1), cat ~= nil)
		if cat then DlgApi.SetItemText(self.this, "Radio_a" .. (i-1), cat.name) end
	end
	self:SelectCategory(1)
end

function Panel_Top:ShowBoards(cat_index)
	local cat = LeaderBoard.Categories[cat_index]
	
	for i = 1, MAX_SUB_CATEGORY do
		local board_id = cat[i]
		DlgApi.ShowItem(self.this, "Radio_b" .. (i-1), board_id ~= nil)
		local board_name = board_id and LeaderBoard.Boards[board_id].name or ""
		DlgApi.SetItemText(self.this, "Radio_b" .. (i-1), board_name)
	end
end

function Panel_Top:GetBoardId(cat_index, board_index)
	local cat = LeaderBoard.Categories[cat_index]
	if cat == nil then return 0 end
	local id = cat[board_index]
	return id or 0
end

function Panel_Top:UpdateSelfRank(board_id, rank)
	local board = LeaderBoard.Boards[board_id]
	if board then
		local text = board.self_rank_text or _T["LEADER_BOARD_DEFAULT_RANK_TEXT"]
		DlgApi.SetItemText(self.this, "Label_Self1", text )
		DlgApi.SetItemText(self.this, "Label_Self", rank > 0 and ""..rank or "--" )
	end
end

function Panel_Top:UpdateSelfRank_Range(board_id, rank_low, rank_high)
	local board = LeaderBoard.Boards[board_id]
	if board then
		local text = board.self_rank_text or _T["LEADER_BOARD_DEFAULT_RANK_TEXT"]
		DlgApi.SetItemText(self.this, "Label_Self1", text )
		DlgApi.SetItemText(self.this, "Label_Self", rank_high <= 0 and ""..rank_low or ""..rank_low.." - "..rank_high )
	end
end

function Panel_Top:UpdateHeaders(board_id)
	local board = LeaderBoard.Boards[board_id]
	if board == nil then return end
	
	for i=1, MAX_CUSTOM_HEADER do
		local col = board.cols[i]
		local text = col and col.name or ""
		DlgApi.SetItemText(self.this, "Button_Desc"..i, text )
	end
end

function Panel_Top:FormatListRow(board_id, row_data)
	local board = LeaderBoard.Boards[board_id]
	if board == nil then return "" end
	
	local result = {}
	table.insert(result, row_data.rank)
	local delta_rank = 0
	if row_data.oldrank ~= nil then
		delta_rank = row_data.rank - row_data.oldrank
	end
	if row_data.oldrank == nil then
	    table.insert(result, _T["LEADER_BOARD_NO_CHANGE"])
	elseif row_data.oldrank <= 0 then
		table.insert(result, _T["LEADER_BOARD_NEW"])
	elseif delta_rank == 0 then
		table.insert(result, _T["LEADER_BOARD_NO_CHANGE"])
	elseif delta_rank < 0 then
	    local delta_rank = row_data.rank - row_data.oldrank
		table.insert(result, _T["LEADER_BOARD_UP"]..-delta_rank)
	elseif delta_rank > 0 then
		table.insert(result, _T["LEADER_BOARD_DOWN"]..delta_rank)
	end
	
	table.insert(result, row_data.name)
	
	for _,col in ipairs(board.cols) do
		local formater = LeaderBoard.Formaters[col.type] or LeaderBoard.Formaters.value
		table.insert(result, formater(row_data))
	end
	
	return table.concat(result, "\t")
end

function Panel_Top:SelectCategory(cat_index)
	DlgApi.CheckRadioButton(self.this, 1, cat_index)
	self:ShowBoards(cat_index)
	local selected_board_index = selected_map[cat_index] or 1
	self:SelectBoard(selected_board_index)
end

function Panel_Top:SelectBoard(board_index)
	local cat_index = DlgApi.GetCheckedRadioButton(self.this, 1)
	if cat_index then
		selected_map[cat_index] = board_index
	end
	DlgApi.CheckRadioButton(self.this, 2, board_index)
	
	local id = self:GetBoardId(cat_index,board_index)
	local board = LeaderBoard.Boards[id]
	if board ~= nil then
	 DlgApi.SetItemText(self.this, "Text_Intro", board.desc ) 
	end
	
end

function Panel_Top:SelectBoardById(board_id)
	local cat_index = 0;
	local board_index = 0;
	for i,cat in ipairs(LeaderBoard.Categories) do
		for j,id in ipairs(car) do
			if id == board_id then 
				cat_index = i
				board_index = j
			end
		end
	end
	
	if cat_index > 0 then
		self:SelectCategory(cat_index)
		self:SelectBoard(board_index)
	end
end