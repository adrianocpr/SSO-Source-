---------------------------------------------------------------
--  created:   2013.7.10
--  author:    chenfudun
--
--  邮箱配置接口
---------------------------------------------------------------

MailerFunc = {}

function MailerFunc:GetMailerId(map_id)
    for _, v in ipairs(Mailers) do
        if v.map_id == map_id then
            return v.npc_id
        end
    end    
end