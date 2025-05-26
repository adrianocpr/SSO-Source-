---------------------------------------------------------------
--  created:   2013.4.20
--  author:    chenfudun
--
--  竞技场相关配置
---------------------------------------------------------------	

local Arena_Award = Arena_Award

Arena_Award_Func = {}

--奖励描述缓冲区
Arena_Award_Cache = {}

-- level：等级
-- 返回值：当前级和下一级奖励信息
function Arena_Award_Func:GetArenaAwardInfo(rank_level, delta)
    if not rank_level or type(rank_level) ~= "number" then
        return nil
    end

    local sect_delta = delta or 0
    local left_ok  = false
    local right_ok = false

    local retAward = {}
       
	local retAward = Arena_Award_Cache[rank_level]
	if not retAward then
		for k,v in pairs(Arena_Award) do
			if type(v.level_section) == "table" and ((rank_level >= v.level_section[1] and rank_level < v.level_section[2]) or (rank_level >= v.level_section[1] and rank_level >= v.level_section[2] and v.level_section[1] ~= 0 and v.level_section[2] == 0)) then
				-- 当前排名段和周
				local next_section = {}
				local next_week    = {}
				local next_title   = ""
				local next_sect_id = k - sect_delta

				if type(Arena_Award[next_sect_id]) == "table" and type(Arena_Award[next_sect_id].cur_week) == "table" then
					next_section = Arena_Award[next_sect_id].level_section or {}
					next_week	 = Arena_Award[next_sect_id].cur_week or {}
					next_title   = Arena_Award[next_sect_id].cur_title or ""
				end

				retAward = {v.level_section, v.cur_fight, next_section, next_week, next_title}

				if next_sect_id-1 > 0 and type(Arena_Award[next_sect_id-1]) == "table" and type(Arena_Award[next_sect_id-1].cur_week) == "table" then
					right_ok = true
				end
				if type(Arena_Award[next_sect_id+1]) == "table" and type(Arena_Award[next_sect_id+1].cur_week) == "table" then
					left_ok = true
				end

				break

			end
		end	    
	end

	return left_ok, right_ok, retAward
end