--[[ @i18n quest ]]
local _t = require("i18n").context("quest")

--[[ 
配置任务中需要使用物品的提示信息
Author: Feng Bo 

配置格式如下：
return 
{
	default = "点击使用该物品完成任务",   --所有物品的默认字符串
	
	--物品ID对应提示字符串
	[18924] = "旗子1",                    --物品18924的提示字符串
	[18927] = "旗子2",                    --物品18927的提示字符串
}
--]]

return 
{
	default = _t"点击使用该物品完成任务",
	
	[12681] = _t"试着激发体内的小宇宙力量",
	[13604] = _t"爆发小宇宙，挣脱黑暗冰壁！",
	[13603] = _t"爆发小宇宙，击退小黑蛇！",


}