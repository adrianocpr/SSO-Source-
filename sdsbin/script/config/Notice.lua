-- 最新公告
local notice = _t"^ff0000指引奖励尚未确定\r^ffffff目前升级内容仍在调整中。"


--require "GuideCfg"


GuideMan = {}
function GuideMan:GetNotice()
    return notice
end

function GuideMan:GetGuide(id)
    return GuideCfg[id]
end

function GuideMan:GetGuideOfLevel(level)
    for k,v in ipairs(GuideCfg) do
        if type(v) == nil then
            return nil
        end
        
        if v.level_low <= level and  v.level_high >= level then
            return k,v
        end     
    end
    return nil
end
