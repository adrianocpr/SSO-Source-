--[[ @i18n help ]]
local _t = require("i18n").context("help")
---界面指引的数据处理脚本
--阶段指引
module("guide_stage", package.seeall)

_M.PARAM_SERVER 	= 1
_M.PARAM_POWER		= 2
_M.PARAM_LEVEL		= 3
_M.PARAM_CLOTH_NUM	= 4
_M.PARAM_CLOTH_LEV	= 5
_M.PARAM_FRIEND_NUM	= 6
_M.PARAM_STARFORCE	= 7


_M[1] = 
{
	quest_id = 7661,
	achi_id  = 5044,
	param_typ= _M.PARAM_POWER,
	title	 = _t"达到25级且战力达到5000",
	status	 = "%d/5000",
	desc	 = _t"经验：250000  星券：100",
}

_M[2] = 
{	
	quest_id = 7662,
	achi_id  = 5045,
	param_typ= _M.PARAM_POWER,
	title	 = _t"达到35级且战力达到9000",
	status	 = "%d/9000",
	desc	 = _t"经验：500000  星券：150",
}

_M[3] = 
{
	quest_id = 7663,
	achi_id  = 5046,
	param_typ= _M.PARAM_POWER,
	title	 = _t"达到45级且战力达到15000",
	status	 = "%d/15000",
	desc	 = _t"经验：1000000  星券：200",
}

_M[4] = 
{
	quest_id = 7664,
	achi_id  = 5047,
	param_typ= _M.PARAM_POWER,
	title	 = _t"达到55级且战力达到28000",
	status	 = "%d/28000",
	desc	 = _t"经验：2000000  星券：250",
}

_M[5] = 
{
	quest_id = 7665,
	achi_id  = 5048,
	param_typ= _M.PARAM_POWER,
	title	 = _t"达到65级且战力达到50000",
	status	 = "%d/50000",
	desc	 = _t"经验：5000000  星券：300",
}

_M[6] = 
{
	quest_id = 7666,
	achi_id  = 5049,
	param_typ=  _M.PARAM_POWER,
	title	 = _t"达到75级且战力达到80000",
	status	 = "%d/80000",
	desc	 = _t"经验：10000000  星券：400",
}

_M[7] = 
{
	quest_id = 7667,
	achi_id  = 5050,
	param_typ= _M.PARAM_POWER,
	title	 = _t"达到85级且战力达到115000",
	status	 = "%d/115000",
	desc	 = _t"经验：40000000  星券：500",
}

_M[8] = 
{
	quest_id = 7668,
	achi_id  = 5051,
	param_typ= _M.PARAM_POWER,
	title	 = _t"达到95级且战力达到150000",
	status	 = "%d/150000",
	desc	 = _t"经验：80000000  星券：600",
}


