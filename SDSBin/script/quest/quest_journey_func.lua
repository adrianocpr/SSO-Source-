QuestJourney = QuestJourney or {}

------------------------------------------------
-- initial mappings from task id to QuestJourney
QuestJourney._show_map = {}
QuestJourney._active_map = {}
for i, v in ipairs(QuestJourney) do
	v.id = i
	QuestJourney._show_map[v.show_on] = v
	QuestJourney._active_map[v.active_on] = v
end

function QuestJourney:GetTriggerList()
	local list = {}
	local map = {}
	
	local function add(id)
		if not map[id] then
			table.insert(list, id)
			map[id] = true
		end
	end
	for _, v in ipairs(QuestJourney) do
		add(v.show_on)
		add(v.active_on)
	end
	return list
end

function QuestJourney:GetJourneyInfo(finished_task_id)
	local id = finished_task_id
	local result = {}
	if self._show_map[id] then
		local v = self._show_map[id]
		table.insert(result, {
			id = v.id,
			name = v.name or v.active_name or "",
			image = "",
			is_active = false,
		})
	end
	if self._active_map[id] then
		local v = self._active_map[id]
		table.insert(result, {
			id = v.id,
			name = v.active_name or v.name or "",
			image = v.active_image,
			is_active = true,
		})
	end	
	return result
end

function QuestJourney:GetDetail(journey_id, is_active)
	local v = self[journey_id]
	if not v then return "" end
	local detail = is_active and v.active_detail or v.detail
	detail = detail or v.detail or ""
	
	detail = string.gsub(detail, "\n", "\r")
	detail = string.gsub(detail, "\t", "")
	return detail
end