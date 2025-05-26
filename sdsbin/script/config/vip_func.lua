---------------------------------------------------------------
--  created:   2013.4.17
--  author:    chenfudun
--
--  VIP相关配置接口
---------------------------------------------------------------

local VIP_AUTHORITY_DESC  = VIP_AUTHORITY_DESC
local MVIP_AUTHORITY_DESC = MVIP_AUTHORITY_DESC

VIP_Func = {}

--VIP特权描述缓冲区
VIP_Authority_Desc_Cache  = {}
MVIP_Authority_Desc_Cache = {}

--vip_level：vip 等级
--返回值：VIP特权描述
function VIP_Func:GetVIP_Authority_Desc(vip_level)
    if not vip_level or type(vip_level) ~= "number" then
        return nil
    end
        
	local retDesc = VIP_Authority_Desc_Cache[vip_level]
	if not retDesc then
	    VIP_Authority_Desc_Cache[vip_level] = VIP_AUTHORITY_DESC[vip_level]
	    retDesc = VIP_Authority_Desc_Cache[vip_level]
	end

	return retDesc
end


--mvip_level：月度vip 等级
--返回值：VIP特权描述
function VIP_Func:GetMVIP_Authority_Desc(mvip_level)
    if not mvip_level or type(mvip_level) ~= "number" then
        return nil
    end
        
	local retDesc = MVIP_Authority_Desc_Cache[mvip_level]
	if not retDesc then
	    MVIP_Authority_Desc_Cache[mvip_level] = MVIP_AUTHORITY_DESC[mvip_level]
	    retDesc = MVIP_Authority_Desc_Cache[mvip_level]
	end

	return retDesc
end

-- 获取本级和下一级的VIP特权描述
function VIP_Func:GetVIP_Authority_Descs(cur_vip_level, next_vip_level)
	local curDesc  = self:GetVIP_Authority_Desc(cur_vip_level)
	local nextDesc = self:GetVIP_Authority_Desc(next_vip_level)

	return curDesc, nextDesc
end

-- 获取本级和下一级的月度VIP特权描述
function VIP_Func:GetMVIP_Authority_Descs(cur_mvip_level, next_mvip_level)
	local curDesc  = self:GetMVIP_Authority_Desc(cur_mvip_level)
	local nextDesc = self:GetMVIP_Authority_Desc(next_mvip_level)

	return curDesc, nextDesc
end