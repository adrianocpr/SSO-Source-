local Format, type = string.format, type

-- 界面配置
exp_ui_config = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,24,25,26,27,21,22,23}

player_exp = {}

-- 注：id不能超过65535
--配置说明
--act：基础动作名  
--common_act：动作后缀（0：加职业后缀 1加通用后缀 2后缀加表情 3无后缀） 
--icon：界面图标 打包在iconlist_action
--desc 界面描述
--keys 触发关键词注意 多个之间逗号分隔，特殊符号要用%号转义 如 :%)",":%}","hehe"

-- 鄙视
player_exp[1] =
{
	act 				= "鄙视",
	common_act	= 2,						
	icon				= "鄙视.dds",
    desc                = _t"鄙视",
	keys				= {_t"鄙视"}, 
}

-- 大笑
player_exp[2] =
{
	act 				= "大笑",
	common_act	= 2,				
	icon				= "大笑.dds",
	desc				= _t"大笑",
	keys				= {_t"大笑", _t"哈哈", _t"2333"},
}

-- 飞吻
player_exp[3] =
{
    act                 = "飞吻",
    common_act  = 2,                
    icon                = "飞吻.dds",
    desc                = _t"飞吻",
    keys                = {_t"飞吻"},
}

-- 加油
player_exp[4] =
{
    act                 = "加油",
    common_act  = 2,                
    icon                = "加油.dds",
    desc                = _t"加油",
    keys                = {_t"加油", _t"刚八呆"},
}

-- 哭
player_exp[5] =
{
    act                 = "哭",
    common_act  = 2,                
    icon                = "哭.dds",
    desc                = _t"哭",
    keys                = {_t"55555", _t"大哭"},
}

-- 拍手
player_exp[6] =
{
    act                 = "拍手",
    common_act  = 2,                
    icon                = "拍手.dds",
    desc                = _t"拍手",
    keys                = {_t"拍手", _t"呱唧呱唧"},
}

-- 生气
player_exp[7] =
{
    act                 = "生气",
    common_act  = 2,                
    icon                = "生气.dds",
    desc                = _t"生气",
    keys                = {_t"生气", _t"怒了", _t"我生气了"},
}

-- 睡觉
player_exp[8] =
{
    act                 = "睡觉",
    common_act  = 2,                
    icon                = "睡觉.dds",
    desc                = _t"睡觉",
    keys                = {_t"困了", _t"睡觉", _t"晚安"},
}

-- 不
player_exp[9] =
{
    act                 = "摇头",
    common_act  = 2,                
    icon                = "不.dds",
    desc                = _t"不",
    keys                = {_t"不要", _t"不嘛", _t"别这样", _t"我不", _t"不是"},
}

-- 晕倒
player_exp[10] =
{
    act                 = "晕倒",
    common_act  = 2,                
    icon                = "晕倒.dds",
    desc                = _t"晕倒",
    keys                = {_t"晕倒", _t"昏倒", _t"我倒"},
}

-- 再见
player_exp[11] =
{
    act                 = "再见",
    common_act  = 2,                
    icon                = "再见.dds",
    desc                = _t"再见",
    keys                = {_t"再见", _t"888", _t"byebye"},
}

-- 蹲下
player_exp[12] =
{
    act                 = "坐",
    common_act  = 2,                
    icon                = "蹲下.dds",
    desc                = _t"坐下",
    keys                = {_t"坐下"},
}

-- 阅读
player_exp[13] =
{
    act                 = "阅读",
    common_act  = 1,                
    icon                = "阅读.dds",
    desc                = _t"阅读",
    keys                = {_t"读书", _t"阅读"},
}

-- 被打飞
player_exp[14] =
{
    act                 = "被击飞",
    common_act  = 1,                
    icon                = "被打飞.dds",
    desc                = _t"被击飞",
    keys                = {_t"被打飞", _t"被击飞"},
}

-- 爆发
player_exp[15] =
{
    act                 = "爆发",
    common_act  = 1,                
    icon                = "爆发.dds",
    desc                = _t"爆发",
    keys                = {_t"爆发", _t"暴走"},
}

-- 奔跑
player_exp[16] =
{
    act                 = "奔跑",
    common_act  = 0,                
    icon                = "奔跑.dds",
    desc                = _t"奔跑",
    keys                = {_t"奔跑", _t"跑啊"},
}

-- 鞭笞
player_exp[17] =
{
    act                 = "鞭挞乱舞",
    common_act  = 1,                
    icon                = "鞭笞.dds",
    desc                = _t"鞭笞",
    keys                = {_t"鞭笞", _t"抽你"},
}

-- 晕
player_exp[18] =
{
    act                 = "被击晕",
    common_act  = 1,                
    icon                = "晕.dds",
    desc                = _t"晕",
    keys                = {_t"晕"},
}

-- 踢你
player_exp[19] =
{
    act                 = "空手破坏",
    common_act  = 1,                
    icon                = "踢你.dds",
    desc                = _t"踢",
    keys                = {_t"踢你", _t"踹你"},
}

-- 街舞
player_exp[20] =
{
    act                 = "鹰翔风暴",
    common_act  = 1,                
    icon                = "街舞.dds",
    desc                = _t"街舞",
    keys                = {_t"街舞", _t"旋风腿"},
}

-- 雅典娜的惊叹1
player_exp[21] =
{
    act                 = "雅典娜的惊叹_中",
    common_act  = 3,                
    icon                = "雅典娜的惊叹1.dds",
    desc                = _t"雅典娜的惊叹1",
    keys                = {_t"雅典娜的惊叹1"},
}

-- 雅典娜的惊叹2
player_exp[22] =
{
    act                 = "雅典娜的惊叹_左",
    common_act  = 3,                
    icon                = "雅典娜的惊叹2.dds",
    desc                = _t"雅典娜的惊叹2",
    keys                = {_t"雅典娜的惊叹2"},
}

-- 雅典娜的惊叹3
player_exp[23] =
{
    act                 = "雅典娜的惊叹_右",
    common_act  = 3,                
    icon                = "雅典娜的惊叹3.dds",
    desc                = _t"雅典娜的惊叹3",
    keys                = {_t"雅典娜的惊叹3"},
}

-- 后空翻
player_exp[24] =
{
    act                 = "后闪两连跳_动画",
    common_act  = 3,                
    icon                = "后空翻.dds",
    desc                = _t"后空翻",
    keys                = {_t"后空翻"},
}

-- 死了
player_exp[25] =
{
    act                 = "死亡_动画",
    common_act  = 3,                
    icon                = "死了.dds",
    desc                = _t"死掉了",
    keys                = {_t"死掉了", _t"死了"},
}

-- 下跪
player_exp[26] =
{
    act                 = "下跪_动画",
    common_act  = 3,                
    icon                = "下跪.dds",
    desc                = _t"下跪",
    keys                = {_t"下跪", _t"给跪"},
}

-- 吓哭了
player_exp[27] =
{
    act                 = "吓尿了_动画",
    common_act  = 3,                
    icon                = "吓哭了.dds",
    desc                = _t"吓哭了",
    keys                = {_t"吓哭了"},
}

-- 相依相偎
player_exp[100] =
{
	act 			= "站立",
	icon			= "拾取.dds",
	desc			= _t"相依相偎",
	keys			= {_t"啵一个", _t":%)"},
	bind			= {type = 1, act1="特殊站立", hh="LeftHand", act2="特殊站立", cc="CC_Ride"},
}

actions_exp = {}

-------------------------------------
--		外部调用接口
-------------------------------------
-- 得到表情动作信息
function actions_exp:getinfo(prof,id)
    local act = player_exp[id]
    local name = ""
    local common_act = 1
    local bind = 0
    local type = 0
    local act1 = ""
    local hh = ""
    local act2 = ""
    local cc = ""
    local desc = ""
    if act then
        if act.act then
            if act.common_act==3 then
                name = act.act
        	elseif act.common_act==2 then 
	        	name = Format("%s_表情", act.act)
        	elseif act.common_act==1 then 
	        	name = Format("%s_通用", act.act)
	        else
	        	local suffix = suffix_profession[prof]
	      	  name = Format("%s_%s", act.act, suffix)
	        end
	        if act.desc then desc = act.desc  end
        end
        if act.bind then 
        	if act.bind.type then type = act.bind.type  end
        	if act.bind.act1 then act1 = act.bind.act1  end
        	if act.bind.hh then hh = act.bind.hh  end
        	if act.bind.act2 then act2 = act.bind.act2  end
        	if act.bind.cc then cc = act.bind.cc  end
        end
    end
    return name, bind, type, act1, hh, act2, cc,desc
end

-- 得到表情图标
function actions_exp:geticon(id)
    local act = player_exp[id]
    local icon = ""
    local desc = ""
    if act and act.icon then
        icon = act.icon
    end
    if act and act.desc then
        desc = act.desc
    end
    return icon,desc
end

-- 得到界面配置
function actions_exp:getui()
    return exp_ui_config
end

-- 匹配关键字
function actions_exp:checkkey(str)
	for _eid, _act in pairs(player_exp) do
		if _act.keys then
			for _kid, _key in pairs(_act.keys) do
				if string.find(str,_key) then
    			return _eid
				end
			end
		end
	end
	return -1
end