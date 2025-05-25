--[[ @i18n help ]]
local _t = require("i18n").context("help")
---帮助的数据处理脚本
--- 目录结构 -- 与界面对应, 需要用这几个变量表示, 具体数值策划可根据需要而定
HELP_PAGE_HOME = 0
HELP_PAGE_WIKI = 1
HELP_PAGE_MAP  = 2
HELP_PAGE_DATA = 3
HELP_PAGE_PATCH = 4
--- 数据模块的子项， 需要用这几个变量表示， 具体数值策划可根据需要而定
HELP_DATA_NPC			= 2000
HELP_DATA_MINE		= 2001
HELP_DATA_MONSTER	= 2002
HELP_DATA_BOOK		= 2003
HELP_DATA_MATTER	= 2004
HELP_DATA_EQUIP		= 2005
HELP_DATA_TASK		= 2006
HELP_DATA_SKILL		= 2007
---我想玩军团——对应同一个推荐组ID
HELP_ADVANCE_CORPS = 33
dofile_show_err("script/i18n/data/HelpText.lua")
--- 权重的颜色 [0~4]白绿蓝紫橙
HELP_COLOR = {
    [1]=
        {
        r = 0,
        g = 255,
        b = 0,
},
    [2]=
        {
        r = 83,
        g = 142,
        b = 213,
},
    [3]=
        {
        r = 200,
        g = 123,
        b = 222,
},
    [4]=
        {
        r = 224,
        g = 111,
        b = 46,
},
}
---筛选条件，注意为了提高效率 不需要筛选的HELPINFO不要写cdn，否则运算会很慢，同时筛选条件里的每一项如果不填则不判断该项也能提高效率 ( minLv/maxLv：级别区间  minvip/maxvip: VIP区间  gerder：对应性别，0-男，1-女 pro：职业  league：军团 1表示需要有军团)
HELP_CONDITION = {
    [1]=
        {
        minLv = 11,
        maxLv = 200,
},
    [2]=
        {
        minLv = 21,
        maxLv = 200,
},
    [3]=
        {
        minLv = 31,
        maxLv = 200,
},
    [4]=
        {
        minLv = 41,
        maxLv = 200,
},
    [5]=
        {
        minLv = 51,
        maxLv = 200,
},
    [6]=
        {
        minLv = 61,
        maxLv = 200,
},
    [7]=
        {
        minLv = 71,
        maxLv = 200,
},
    [8]=
        {
        minLv = 81,
        maxLv = 200,
},
    [9]=
        {
        gender = 0,
},
    [10]=
        {
        gender = 1,
},
}
--- father:上一级节点   kind:类型  tag:标签[搜索用]  advance:推送组  desc:文字描述  cdn:显示条件指向HELP_CONDITION表  w:权重[0~4]白绿蓝紫橙 map：表示具有地图标记功能（例 map = { mark="时空漩涡.tga", text="中央",id = 101,x = 0,y = 0,z=0}, desc = "33让l杀发." }）
HELPINFO = {
    [HELP_PAGE_HOME]=
        {
        title = _t"首页",
        kind = HELP_PAGE_HOME,
},
    [HELP_PAGE_WIKI]=
        {
        title = _t"百科",
        kind = HELP_PAGE_WIKI,
},
    [HELP_PAGE_MAP]=
        {
        title = _t"地图",
        kind = HELP_PAGE_MAP,
},
    [HELP_PAGE_DATA]=
        {
        title = _t"数据",
        kind = HELP_PAGE_DATA,
},
    [HELP_PAGE_PATCH]=
        {
        title = _t"更新",
        kind = HELP_PAGE_PATCH,
},
    [HELP_DATA_NPC]=
        {
        title = "NPC",
        father = HELP_PAGE_DATA,
        kind = HELP_PAGE_DATA,
},
    [HELP_DATA_MINE]=
        {
        title = _t"矿",
        father = HELP_PAGE_DATA,
        kind = HELP_PAGE_DATA,
},
    [HELP_DATA_MONSTER]=
        {
        title = _t"怪物",
        father = HELP_PAGE_DATA,
        kind = HELP_PAGE_DATA,
},
    [HELP_DATA_BOOK]=
        {
        title = _t"配方卷轴",
        father = HELP_PAGE_DATA,
        kind = HELP_PAGE_DATA,
},
    [HELP_DATA_MATTER]=
        {
        title = _t"物品类",
        father = HELP_PAGE_DATA,
        kind = HELP_PAGE_DATA,
},
    [HELP_DATA_EQUIP]=
        {
        title = _t"装备",
        father = HELP_PAGE_DATA,
        kind = HELP_PAGE_DATA,
},
    [HELP_DATA_TASK]=
        {
        title = _t"任务",
        father = HELP_PAGE_DATA,
        kind = HELP_PAGE_DATA,
},
    [HELP_DATA_SKILL]=
        {
        title = _t"技能",
        father = HELP_PAGE_DATA,
        kind = HELP_PAGE_DATA,
},
    [100]=
        {
        title = _t"基础操作",
        father = HELP_PAGE_WIKI,
        kind = HELP_PAGE_WIKI,
},
    [101]=
        {
        title = _t"界面操作",
        father = HELP_PAGE_WIKI,
        kind = HELP_PAGE_WIKI,
},
    [102]=
        {
        title = _t"经济行为",
        father = HELP_PAGE_WIKI,
        kind = HELP_PAGE_WIKI,
        w = 1,
},
    [103]=
        {
        title = _t"基础功能",
        father = HELP_PAGE_WIKI,
        kind = HELP_PAGE_WIKI,
        w = 3,
},
    [104]=
        {
        title = _t"交互行为",
        father = HELP_PAGE_WIKI,
        kind = HELP_PAGE_WIKI,
        w = 3,
},
    [105]=
        {
        title = _t"角色成长",
        father = HELP_PAGE_WIKI,
        kind = HELP_PAGE_WIKI,
        w = 3,
},
    [106]=
        {
        title = _t"游戏历程",
        father = HELP_PAGE_WIKI,
        kind = HELP_PAGE_WIKI,
        w = 1,
},
    [107]=
        {
        title = _t"特色任务",
        father = HELP_PAGE_WIKI,
        kind = HELP_PAGE_WIKI,
        w = 1,
},
    [108]=
        {
        title = _t"游戏活动",
        father = HELP_PAGE_WIKI,
        kind = HELP_PAGE_WIKI,
        w = 3,
},
    [109]=
        {
        title = _t"圣斗士指南",
        father = HELP_PAGE_WIKI,
        kind = HELP_PAGE_WIKI,
        w = 1,
},
    [21]=
        {
        title = _t"组队连环挑战",
        father = 108,
        kind = HELP_PAGE_WIKI,
        tag = { 1,8,3,24,10 },
        desc = HelpText[21],
},
    [22]=
        {
        title = _t"大众战场",
        father = 108,
        kind = HELP_PAGE_WIKI,
        tag = { 1,2,4,5,8,24,10,20 },
        desc = HelpText[22],
},
    [28]=
        {
        title = _t"军团领土战",
        father = 108,
        kind = HELP_PAGE_WIKI,
        tag = { 1,4,6,26 },
        desc = HelpText[28],
},
    [29]=
        {
        title = _t"摆摊",
        father = 102,
        kind = HELP_PAGE_WIKI,
        tag = { 13,14 },
        desc = HelpText[29],
},
    [30]=
        {
        title = _t"拍卖",
        father = 102,
        kind = HELP_PAGE_WIKI,
        tag = { 13,14 },
        desc = HelpText[30],
},
    [31]=
        {
        title = _t"背包仓库",
        father = 103,
        kind = HELP_PAGE_WIKI,
        tag = { 16 },
        desc = HelpText[31],
},
    [32]=
        {
        title = _t"安全锁时间锁",
        father = 103,
        kind = HELP_PAGE_WIKI,
        tag = { 27,28 },
        desc = HelpText[32],
},
    [33]=
        {
        title = _t"反外挂答题",
        father = 103,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[33],
},
    [34]=
        {
        title = _t"防沉迷系统",
        father = 103,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[34],
},
    [35]=
        {
        title = _t"排行榜",
        father = 103,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[35],
},
    [36]=
        {
        title = _t"时装",
        father = 103,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[36],
},
    [37]=
        {
        title = _t"骑乘",
        father = 103,
        kind = HELP_PAGE_WIKI,
        tag = { 28,29 },
        desc = HelpText[37],
},
    [38]=
        {
        title = _t"个性化",
        father = 103,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[38],
},
    [39]=
        {
        title = _t"表情",
        father = 103,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[39],
},
    [40]=
        {
        title = _t"双倍经验",
        father = 103,
        kind = HELP_PAGE_WIKI,
        tag = { 24,10 },
        desc = HelpText[40],
},
    [41]=
        {
        title = _t"星象守护",
        father = 103,
        kind = HELP_PAGE_WIKI,
        tag = { 17 },
        desc = HelpText[41],
},
    [42]=
        {
        title = _t"组队",
        father = 104,
        kind = HELP_PAGE_WIKI,
        tag = { 18 },
        desc = HelpText[42],
},
    [43]=
        {
        title = _t"聊天",
        father = 104,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[43],
},
    [44]=
        {
        title = _t"邮件",
        father = 104,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[44],
},
    [45]=
        {
        title = _t"圈子",
        father = 104,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[45],
},
    [46]=
        {
        title = _t"好友",
        father = 104,
        kind = HELP_PAGE_WIKI,
        tag = { 18 },
        desc = HelpText[46],
},
    [47]=
        {
        title = _t"PK规则",
        father = 104,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[47],
        w = 1,
},
    [48]=
        {
        title = _t"决斗",
        father = 104,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[48],
},
    [49]=
        {
        title = _t"军团",
        father = 104,
        kind = HELP_PAGE_WIKI,
        tag = { 25,26 },
        desc = HelpText[49],
        w = 1,
},
    [50]=
        {
        title = _t"图鉴",
        father = 106,
        kind = HELP_PAGE_WIKI,
        tag = { 9 },
        desc = HelpText[50],
},
    [51]=
        {
        title = _t"称号",
        father = 106,
        kind = HELP_PAGE_WIKI,
        tag = { 9 },
        desc = HelpText[51],
},
    [52]=
        {
        title = _t"成就",
        father = 106,
        kind = HELP_PAGE_WIKI,
        tag = { 9 },
        desc = HelpText[52],
},
    [53]=
        {
        title = _t"声望",
        father = 106,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[53],
},
    [54]=
        {
        title = _t"命运的试炼",
        father = 107,
        kind = HELP_PAGE_WIKI,
        tag = { 3,24,10 },
        desc = HelpText[54],
},
    [55]=
        {
        title = _t"女神的圣斗士",
        father = 107,
        kind = HELP_PAGE_WIKI,
        tag = { 2,24,10 },
        desc = HelpText[55],
},
    [56]=
        {
        title = _t"货币",
        father = 102,
        kind = HELP_PAGE_WIKI,
        tag = { 13,14 },
        desc = HelpText[56],
},
    [57]=
        {
        title = _t"元宝交易",
        father = 102,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[57],
},
    [58]=
        {
        title = _t"商城",
        father = 102,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[58],
},
    [59]=
        {
        title = "VIP",
        father = 102,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[59],
},
    [60]=
        {
        title = _t"等级",
        father = 105,
        kind = HELP_PAGE_WIKI,
        tag = { 30 },
        desc = HelpText[60],
},
    [61]=
        {
        title = _t"守护星座",
        father = 105,
        kind = HELP_PAGE_WIKI,
        tag = { 30 },
        desc = HelpText[61],
},
    [62]=
        {
        title = _t"小宇宙",
        father = 105,
        kind = HELP_PAGE_WIKI,
        tag = { 30 },
        desc = HelpText[62],
        w = 2,
},
    [63]=
        {
        title = _t"圣衣",
        father = 105,
        kind = HELP_PAGE_WIKI,
        tag = { 30 },
        desc = HelpText[63],
        w = 2,
},
    [64]=
        {
        title = _t"装备",
        father = 105,
        kind = HELP_PAGE_WIKI,
        tag = { 30 },
        desc = HelpText[64],
},
    [65]=
        {
        title = _t"技能",
        father = 105,
        kind = HELP_PAGE_WIKI,
        tag = { 30 },
        desc = HelpText[65],
},
    [66]=
        {
        title = _t"战斗力",
        father = 105,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[66],
        w = 3,
},
    [67]=
        {
        title = _t"魔盒",
        father = 105,
        kind = HELP_PAGE_WIKI,
        tag = { 12,22 },
        desc = HelpText[67],
},
    [68]=
        {
        title = _t"生产",
        father = 105,
        kind = HELP_PAGE_WIKI,
        tag = { 13,14 },
        desc = HelpText[68],
},
    [69]=
        {
        title = _t"体力值",
        father = 105,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[69],
},
    [70]=
        {
        title = _t"交易",
        father = 102,
        kind = HELP_PAGE_WIKI,
        tag = { 13,14 },
        desc = HelpText[70],
},
    [71]=
        {
        title = _t"连招编辑器",
        father = 105,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[71],
},
    [72]=
        {
        title = _t"装备聚能",
        father = 105,
        kind = HELP_PAGE_WIKI,
        tag = { 30 },
        desc = HelpText[72],
        w = 1,
},
    [73]=
        {
        title = _t"守护星座切换",
        father = 105,
        kind = HELP_PAGE_WIKI,
        tag = { 30 },
        desc = HelpText[73],
},
    [74]=
        {
        title = _t"星座物语",
        father = 107,
        kind = HELP_PAGE_WIKI,
        tag = { 2,17 },
        desc = HelpText[74],
},
    [75]=
        {
        title = _t"世界BOSS争夺战",
        father = 108,
        kind = HELP_PAGE_WIKI,
        tag = { 1,3,7,4,22 },
        desc = HelpText[75],
},
    [76]=
        {
        title = _t"地宫",
        father = 108,
        kind = HELP_PAGE_WIKI,
        tag = { 2,3,4,10,11,12,19,21,22,24,20 },
        desc = HelpText[76],
},
    [77]=
        {
        title = _t"英雄竞技场",
        father = 108,
        kind = HELP_PAGE_WIKI,
        tag = { 30 },
        desc = HelpText[77],
},
    [78]=
        {
        title = _t"集结！十二宫危机",
        father = 108,
        kind = HELP_PAGE_WIKI,
        tag = { 3,7,10,24 },
        desc = HelpText[78],
        w = 2,
},
    [79]=
        {
        title = _t"危急！纱织守护者",
        father = 108,
        kind = HELP_PAGE_WIKI,
        tag = { 3,7,10,24 },
        desc = HelpText[79],
        w = 2,
},
    [80]=
        {
        title = _t"风暴！亚特兰蒂斯",
        father = 108,
        kind = HELP_PAGE_WIKI,
        tag = { 3,8,10,24 },
        desc = HelpText[80],
        w = 2,
},
    [81]=
        {
        title = _t"传承！黄金试炼",
        father = 108,
        kind = HELP_PAGE_WIKI,
        tag = { 3,8,10,24 },
        desc = HelpText[81],
        w = 2,
},
    [82]=
        {
        title = _t"潘多拉魔盒",
        father = 108,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[82],
},
    [83]=
        {
        title = _t"军团排位赛",
        father = 108,
        kind = HELP_PAGE_WIKI,
        tag = { 4,15,26 },
        desc = HelpText[83],
},
    [84]=
        {
        title = _t"圣战回忆",
        father = 108,
        kind = HELP_PAGE_WIKI,
        tag = { 3,7,10,24 },
        desc = HelpText[84],
        w = 3,
},
    [85]=
        {
        title = _t"十风穴",
        father = 108,
        kind = HELP_PAGE_WIKI,
        tag = { 1,3,8,10,12,23 },
        desc = HelpText[85],
        w = 3,
},
    [86]=
        {
        title = _t"GT语音",
        father = 104,
        kind = HELP_PAGE_WIKI,
        tag = { 3,15 },
        desc = HelpText[86],
},
    [87]=
        {
        title = _t"界面操作",
        father = 101,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[87],
},
    [88]=
        {
        title = _t"移动",
        father = 100,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[88],
},
    [89]=
        {
        title = _t"视角",
        father = 100,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[89],
},
    [90]=
        {
        title = _t"快捷栏",
        father = 100,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[90],
},
    [91]=
        {
        title = _t"自动寻径",
        father = 100,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[91],
},
    [92]=
        {
        title = _t"拾取",
        father = 100,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[92],
},
    [93]=
        {
        title = _t"常用热键",
        father = 100,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[93],
},
    [94]=
        {
        title = "QTE",
        father = 100,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[94],
},
    [95]=
        {
        title = _t"复活者的挽歌",
        father = 108,
        kind = HELP_PAGE_WIKI,
        tag = { 3,15,25,24,10 },
        desc = HelpText[95],
},
    [96]=
        {
        title = _t"亡者的逆袭",
        father = 108,
        kind = HELP_PAGE_WIKI,
        tag = { 3,15,25,24,10 },
        desc = HelpText[96],
},
    [97]=
        {
        title = _t"女神的恩赐",
        father = 108,
        kind = HELP_PAGE_WIKI,
        tag = { 15,26,24,10 },
        desc = HelpText[97],
},
    [201]=
        {
        title = _t"0~10级生存指南",
        father = 109,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[201],
},
    [202]=
        {
        title = _t"11~20级生存指南",
        father = 109,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[202],
        cdn = 1,
},
    [203]=
        {
        title = _t"21~30级生存指南",
        father = 109,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[203],
        cdn = 2,
},
    [204]=
        {
        title = _t"31~40级生存指南",
        father = 109,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[204],
        cdn = 3,
},
    [205]=
        {
        title = _t"41~50级生存指南",
        father = 109,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[205],
        cdn = 4,
},
    [206]=
        {
        title = _t"51~60级生存指南",
        father = 109,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[206],
        cdn = 5,
},
    [207]=
        {
        title = _t"61~70级生存指南",
        father = 109,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[207],
        cdn = 6,
},
    [208]=
        {
        title = _t"71~80级生存指南",
        father = 109,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[208],
        cdn = 7,
},
    [209]=
        {
        title = _t"81~90级生存指南",
        father = 109,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[209],
        cdn = 8,
},
    [210]=
        {
        title = _t"91~100级生存指南",
        father = 109,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[210],
        cdn = 8,
},
    [211]=
        {
        title = _t"男玩家交友指南",
        father = 109,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[211],
        cdn = 9,
},
    [212]=
        {
        title = _t"女玩家交友指南",
        father = 109,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[212],
        cdn = 10,
},
    [213]=
        {
        title = _t"祈祷和沐浴荣光",
        father = 103,
        kind = HELP_PAGE_WIKI,
        tag = { 2,10,24,31 },
        desc = HelpText[213],
},
    [214]=
        {
        title = _t"军团指南",
        father = 109,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[214],
},
    [300]=
        {
        title = _t"宝物",
        father = 105,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[300],
},
    [301]=
        {
        title = _t"获得青铜圣衣",
        father = 109,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[301],
},
    [302]=
        {
        title = _t"获得白银圣衣",
        father = 109,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[302],
},
    [303]=
        {
        title = _t"获得黄金圣衣",
        father = 109,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[303],
},
    [304]=
        {
        title = _t"符文镶嵌",
        father = 105,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[304],
},
    [305]=
        {
        title = _t"如何提升随从",
        father = 109,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[305],
},
    [306]=
        {
        title = _t"如何获得随从",
        father = 109,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[306],
},
    [307]=
        {
        title = _t"斗魂",
        father = 105,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[307],
},
    [308]=
        {
        title = _t"什么是灵纹",
        father = 109,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[308],
},
    [309]=
        {
        title = _t"什么是高级灵纹",
        father = 109,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[309],
},
    [310]=
        {
        title = _t"储存经验",
        father = 105,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[310],
},
    [311]=
        {
        title = _t"人物属性",
        father = 105,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[311],
},
    [312]=
        {
        title = _t"小伙伴",
        father = 104,
        kind = HELP_PAGE_WIKI,
        desc = HelpText[312],
},
}
--- 属性tag 用于关键字搜索 可以被HELPINFO,HELP_ELEMENTDATA,HELP_TASKDATA,HELP_SKILLDATA引用
HELP_TAG = {
    [1]=
        {
        Value = _t"挑战",
},
    [2]=
        {
        Value = _t"单人",
},
    [3]=
        {
        Value = _t"组队",
},
    [4]=
        {
        Value = "pvp",
},
    [5]=
        {
        Value = _t"阵营战",
},
    [6]=
        {
        Value = _t"国战",
},
    [7]=
        {
        Value = _t"定时活动",
},
    [8]=
        {
        Value = _t"不定时活动",
},
    [9]=
        {
        Value = _t"收集玩法",
},
    [10]=
        {
        Value = _t"经验",
},
    [11]=
        {
        Value = _t"金币",
},
    [12]=
        {
        Value = _t"稀有装备",
},
    [13]=
        {
        Value = _t"经济",
},
    [14]=
        {
        Value = _t"买卖",
},
    [15]=
        {
        Value = _t"军团",
},
    [16]=
        {
        Value = _t"扩包",
},
    [17]=
        {
        Value = _t"星座玩法",
},
    [18]=
        {
        Value = _t"友好度",
},
    [19]=
        {
        Value = _t"刷怪",
},
    [20]=
        {
        Value = "PK",
},
    [21]=
        {
        Value = _t"双倍经验",
},
    [22]=
        {
        Value = _t"极品装备",
},
    [23]=
        {
        Value = _t"装备副本",
},
    [24]=
        {
        Value = _t"快速升级",
},
    [25]=
        {
        Value = _t"每日军团活动",
},
    [26]=
        {
        Value = _t"每周军团活动",
},
    [27]=
        {
        Value = _t"防盗号",
},
    [28]=
        {
        Value = _t"坐骑",
},
    [29]=
        {
        Value = _t"交通工具",
},
    [30]=
        {
        Value = _t"战斗力",
},
    [31]=
        {
        Value = _t"挂机",
},
}
---推荐组 helpinfo:对应HELPINFO的id表		elementdata：对应element模板的id表	task：对应任务的id表  skill：对应技能的id表  	例:	HELP_ADVANCE[1] = { helpinfo = {1,20,207}, elementdata={1216}, task={447}, skill={117,177} 
HELP_ADVANCE = {
    [1]=
        {
        helpinfo = { 201 },
},
    [2]=
        {
        helpinfo = { 202 },
},
    [3]=
        {
        helpinfo = { 203 },
},
    [4]=
        {
        helpinfo = { 204 },
},
    [5]=
        {
        helpinfo = { 205 },
},
    [6]=
        {
        helpinfo = { 206 },
},
    [7]=
        {
        helpinfo = { 207 },
},
    [8]=
        {
        helpinfo = { 208 },
},
    [9]=
        {
        helpinfo = { 209 },
},
    [10]=
        {
        helpinfo = { 210 },
},
    [11]=
        {
        helpinfo = { 201 },
},
    [12]=
        {
        helpinfo = { 202 },
},
    [13]=
        {
        helpinfo = { 203 },
},
    [14]=
        {
        helpinfo = { 204 },
},
    [15]=
        {
        helpinfo = { 205 },
},
    [16]=
        {
        helpinfo = { 206 },
},
    [17]=
        {
        helpinfo = { 207 },
},
    [18]=
        {
        helpinfo = { 208 },
},
    [19]=
        {
        helpinfo = { 209 },
},
    [20]=
        {
        helpinfo = { 210 },
},
    [21]=
        {
        helpinfo = { 201 },
},
    [22]=
        {
        helpinfo = { 202 },
},
    [23]=
        {
        helpinfo = { 203 },
},
    [24]=
        {
        helpinfo = { 204 },
},
    [25]=
        {
        helpinfo = { 205 },
},
    [26]=
        {
        helpinfo = { 206 },
},
    [27]=
        {
        helpinfo = { 207 },
},
    [28]=
        {
        helpinfo = { 208 },
},
    [29]=
        {
        helpinfo = { 209 },
},
    [30]=
        {
        helpinfo = { 210 },
},
    [31]=
        {
        helpinfo = { 42,45,46,86,211,214 },
},
    [32]=
        {
        helpinfo = { 42,45,46,86,212,214 },
},
    [33]=
        {
        helpinfo = { 214 },
},
}
---我想快升级——每隔X级对应一个推荐组ID  (HELP_ADVANCE)
HELP_ADVANCE_UPGRADE = {
    [1]=
        {
        value = 1,
},
    [2]=
        {
        value = 1,
},
    [3]=
        {
        value = 1,
},
    [4]=
        {
        value = 1,
},
    [5]=
        {
        value = 1,
},
    [6]=
        {
        value = 1,
},
    [7]=
        {
        value = 1,
},
    [8]=
        {
        value = 1,
},
    [9]=
        {
        value = 1,
},
    [10]=
        {
        value = 1,
},
    [11]=
        {
        value = 2,
},
    [12]=
        {
        value = 2,
},
    [13]=
        {
        value = 2,
},
    [14]=
        {
        value = 2,
},
    [15]=
        {
        value = 2,
},
    [16]=
        {
        value = 2,
},
    [17]=
        {
        value = 2,
},
    [18]=
        {
        value = 2,
},
    [19]=
        {
        value = 2,
},
    [20]=
        {
        value = 2,
},
    [21]=
        {
        value = 3,
},
    [22]=
        {
        value = 3,
},
    [23]=
        {
        value = 3,
},
    [24]=
        {
        value = 3,
},
    [25]=
        {
        value = 3,
},
    [26]=
        {
        value = 3,
},
    [27]=
        {
        value = 3,
},
    [28]=
        {
        value = 3,
},
    [29]=
        {
        value = 3,
},
    [30]=
        {
        value = 3,
},
    [31]=
        {
        value = 4,
},
    [32]=
        {
        value = 4,
},
    [33]=
        {
        value = 4,
},
    [34]=
        {
        value = 4,
},
    [35]=
        {
        value = 4,
},
    [36]=
        {
        value = 4,
},
    [37]=
        {
        value = 4,
},
    [38]=
        {
        value = 4,
},
    [39]=
        {
        value = 4,
},
    [40]=
        {
        value = 4,
},
    [41]=
        {
        value = 5,
},
    [42]=
        {
        value = 5,
},
    [43]=
        {
        value = 5,
},
    [44]=
        {
        value = 5,
},
    [45]=
        {
        value = 5,
},
    [46]=
        {
        value = 5,
},
    [47]=
        {
        value = 5,
},
    [48]=
        {
        value = 5,
},
    [49]=
        {
        value = 5,
},
    [50]=
        {
        value = 5,
},
    [51]=
        {
        value = 6,
},
    [52]=
        {
        value = 6,
},
    [53]=
        {
        value = 6,
},
    [54]=
        {
        value = 6,
},
    [55]=
        {
        value = 6,
},
    [56]=
        {
        value = 6,
},
    [57]=
        {
        value = 6,
},
    [58]=
        {
        value = 6,
},
    [59]=
        {
        value = 6,
},
    [60]=
        {
        value = 6,
},
    [61]=
        {
        value = 7,
},
    [62]=
        {
        value = 7,
},
    [63]=
        {
        value = 7,
},
    [64]=
        {
        value = 7,
},
    [65]=
        {
        value = 7,
},
    [66]=
        {
        value = 7,
},
    [67]=
        {
        value = 7,
},
    [68]=
        {
        value = 7,
},
    [69]=
        {
        value = 7,
},
    [70]=
        {
        value = 7,
},
    [71]=
        {
        value = 8,
},
    [72]=
        {
        value = 8,
},
    [73]=
        {
        value = 8,
},
    [74]=
        {
        value = 8,
},
    [75]=
        {
        value = 8,
},
    [76]=
        {
        value = 8,
},
    [77]=
        {
        value = 8,
},
    [78]=
        {
        value = 8,
},
    [79]=
        {
        value = 8,
},
    [80]=
        {
        value = 8,
},
    [81]=
        {
        value = 9,
},
    [82]=
        {
        value = 9,
},
    [83]=
        {
        value = 9,
},
    [84]=
        {
        value = 9,
},
    [85]=
        {
        value = 9,
},
    [86]=
        {
        value = 9,
},
    [87]=
        {
        value = 9,
},
    [88]=
        {
        value = 9,
},
    [89]=
        {
        value = 9,
},
    [90]=
        {
        value = 9,
},
    [91]=
        {
        value = 10,
},
    [92]=
        {
        value = 10,
},
    [93]=
        {
        value = 10,
},
    [94]=
        {
        value = 10,
},
    [95]=
        {
        value = 10,
},
    [96]=
        {
        value = 10,
},
    [97]=
        {
        value = 10,
},
    [98]=
        {
        value = 10,
},
    [99]=
        {
        value = 10,
},
    [100]=
        {
        value = 10,
},
}
---我想赚钱——每隔X级对应一个推荐组ID
HELP_ADVANCE_MONEY = {
    [1]=
        {
        value = 11,
},
    [2]=
        {
        value = 11,
},
    [3]=
        {
        value = 11,
},
    [4]=
        {
        value = 11,
},
    [5]=
        {
        value = 11,
},
    [6]=
        {
        value = 11,
},
    [7]=
        {
        value = 11,
},
    [8]=
        {
        value = 11,
},
    [9]=
        {
        value = 11,
},
    [10]=
        {
        value = 11,
},
    [11]=
        {
        value = 12,
},
    [12]=
        {
        value = 12,
},
    [13]=
        {
        value = 12,
},
    [14]=
        {
        value = 12,
},
    [15]=
        {
        value = 12,
},
    [16]=
        {
        value = 12,
},
    [17]=
        {
        value = 12,
},
    [18]=
        {
        value = 12,
},
    [19]=
        {
        value = 12,
},
    [20]=
        {
        value = 12,
},
    [21]=
        {
        value = 13,
},
    [22]=
        {
        value = 13,
},
    [23]=
        {
        value = 13,
},
    [24]=
        {
        value = 13,
},
    [25]=
        {
        value = 13,
},
    [26]=
        {
        value = 13,
},
    [27]=
        {
        value = 13,
},
    [28]=
        {
        value = 13,
},
    [29]=
        {
        value = 13,
},
    [30]=
        {
        value = 13,
},
    [31]=
        {
        value = 14,
},
    [32]=
        {
        value = 14,
},
    [33]=
        {
        value = 14,
},
    [34]=
        {
        value = 14,
},
    [35]=
        {
        value = 14,
},
    [36]=
        {
        value = 14,
},
    [37]=
        {
        value = 14,
},
    [38]=
        {
        value = 14,
},
    [39]=
        {
        value = 14,
},
    [40]=
        {
        value = 14,
},
    [41]=
        {
        value = 15,
},
    [42]=
        {
        value = 15,
},
    [43]=
        {
        value = 15,
},
    [44]=
        {
        value = 15,
},
    [45]=
        {
        value = 15,
},
    [46]=
        {
        value = 15,
},
    [47]=
        {
        value = 15,
},
    [48]=
        {
        value = 15,
},
    [49]=
        {
        value = 15,
},
    [50]=
        {
        value = 15,
},
    [51]=
        {
        value = 16,
},
    [52]=
        {
        value = 16,
},
    [53]=
        {
        value = 16,
},
    [54]=
        {
        value = 16,
},
    [55]=
        {
        value = 16,
},
    [56]=
        {
        value = 16,
},
    [57]=
        {
        value = 16,
},
    [58]=
        {
        value = 16,
},
    [59]=
        {
        value = 16,
},
    [60]=
        {
        value = 16,
},
    [61]=
        {
        value = 17,
},
    [62]=
        {
        value = 17,
},
    [63]=
        {
        value = 17,
},
    [64]=
        {
        value = 17,
},
    [65]=
        {
        value = 17,
},
    [66]=
        {
        value = 17,
},
    [67]=
        {
        value = 17,
},
    [68]=
        {
        value = 17,
},
    [69]=
        {
        value = 17,
},
    [70]=
        {
        value = 17,
},
    [71]=
        {
        value = 18,
},
    [72]=
        {
        value = 18,
},
    [73]=
        {
        value = 18,
},
    [74]=
        {
        value = 18,
},
    [75]=
        {
        value = 18,
},
    [76]=
        {
        value = 18,
},
    [77]=
        {
        value = 18,
},
    [78]=
        {
        value = 18,
},
    [79]=
        {
        value = 18,
},
    [80]=
        {
        value = 18,
},
    [81]=
        {
        value = 19,
},
    [82]=
        {
        value = 19,
},
    [83]=
        {
        value = 19,
},
    [84]=
        {
        value = 19,
},
    [85]=
        {
        value = 19,
},
    [86]=
        {
        value = 19,
},
    [87]=
        {
        value = 19,
},
    [88]=
        {
        value = 19,
},
    [89]=
        {
        value = 19,
},
    [90]=
        {
        value = 19,
},
    [91]=
        {
        value = 20,
},
    [92]=
        {
        value = 20,
},
    [93]=
        {
        value = 20,
},
    [94]=
        {
        value = 20,
},
    [95]=
        {
        value = 20,
},
    [96]=
        {
        value = 20,
},
    [97]=
        {
        value = 20,
},
    [98]=
        {
        value = 20,
},
    [99]=
        {
        value = 20,
},
    [100]=
        {
        value = 20,
},
}
---根据我的等级
HELP_ADVANCE_BY_LV = {
    [1]=
        {
        value = 21,
},
    [2]=
        {
        value = 21,
},
    [3]=
        {
        value = 21,
},
    [4]=
        {
        value = 21,
},
    [5]=
        {
        value = 21,
},
    [6]=
        {
        value = 21,
},
    [7]=
        {
        value = 21,
},
    [8]=
        {
        value = 21,
},
    [9]=
        {
        value = 21,
},
    [10]=
        {
        value = 21,
},
    [11]=
        {
        value = 22,
},
    [12]=
        {
        value = 22,
},
    [13]=
        {
        value = 22,
},
    [14]=
        {
        value = 22,
},
    [15]=
        {
        value = 22,
},
    [16]=
        {
        value = 22,
},
    [17]=
        {
        value = 22,
},
    [18]=
        {
        value = 22,
},
    [19]=
        {
        value = 22,
},
    [20]=
        {
        value = 22,
},
    [21]=
        {
        value = 23,
},
    [22]=
        {
        value = 23,
},
    [23]=
        {
        value = 23,
},
    [24]=
        {
        value = 23,
},
    [25]=
        {
        value = 23,
},
    [26]=
        {
        value = 23,
},
    [27]=
        {
        value = 23,
},
    [28]=
        {
        value = 23,
},
    [29]=
        {
        value = 23,
},
    [30]=
        {
        value = 23,
},
    [31]=
        {
        value = 24,
},
    [32]=
        {
        value = 24,
},
    [33]=
        {
        value = 24,
},
    [34]=
        {
        value = 24,
},
    [35]=
        {
        value = 24,
},
    [36]=
        {
        value = 24,
},
    [37]=
        {
        value = 24,
},
    [38]=
        {
        value = 24,
},
    [39]=
        {
        value = 24,
},
    [40]=
        {
        value = 24,
},
    [41]=
        {
        value = 25,
},
    [42]=
        {
        value = 25,
},
    [43]=
        {
        value = 25,
},
    [44]=
        {
        value = 25,
},
    [45]=
        {
        value = 25,
},
    [46]=
        {
        value = 25,
},
    [47]=
        {
        value = 25,
},
    [48]=
        {
        value = 25,
},
    [49]=
        {
        value = 25,
},
    [50]=
        {
        value = 25,
},
    [51]=
        {
        value = 26,
},
    [52]=
        {
        value = 26,
},
    [53]=
        {
        value = 26,
},
    [54]=
        {
        value = 26,
},
    [55]=
        {
        value = 26,
},
    [56]=
        {
        value = 26,
},
    [57]=
        {
        value = 26,
},
    [58]=
        {
        value = 26,
},
    [59]=
        {
        value = 26,
},
    [60]=
        {
        value = 26,
},
    [61]=
        {
        value = 27,
},
    [62]=
        {
        value = 27,
},
    [63]=
        {
        value = 27,
},
    [64]=
        {
        value = 27,
},
    [65]=
        {
        value = 27,
},
    [66]=
        {
        value = 27,
},
    [67]=
        {
        value = 27,
},
    [68]=
        {
        value = 27,
},
    [69]=
        {
        value = 27,
},
    [70]=
        {
        value = 27,
},
    [71]=
        {
        value = 28,
},
    [72]=
        {
        value = 28,
},
    [73]=
        {
        value = 28,
},
    [74]=
        {
        value = 28,
},
    [75]=
        {
        value = 28,
},
    [76]=
        {
        value = 28,
},
    [77]=
        {
        value = 28,
},
    [78]=
        {
        value = 28,
},
    [79]=
        {
        value = 28,
},
    [80]=
        {
        value = 28,
},
    [81]=
        {
        value = 29,
},
    [82]=
        {
        value = 29,
},
    [83]=
        {
        value = 29,
},
    [84]=
        {
        value = 29,
},
    [85]=
        {
        value = 29,
},
    [86]=
        {
        value = 29,
},
    [87]=
        {
        value = 29,
},
    [88]=
        {
        value = 29,
},
    [89]=
        {
        value = 29,
},
    [90]=
        {
        value = 29,
},
    [91]=
        {
        value = 30,
},
    [92]=
        {
        value = 30,
},
    [93]=
        {
        value = 30,
},
    [94]=
        {
        value = 30,
},
    [95]=
        {
        value = 30,
},
    [96]=
        {
        value = 30,
},
    [97]=
        {
        value = 30,
},
    [98]=
        {
        value = 30,
},
    [99]=
        {
        value = 30,
},
    [100]=
        {
        value = 30,
},
}
---我想交朋友——男对应一个推荐组ID，女对应一个推荐组ID  (对应性别，0-男，1-女，2-男女都可)
HELP_ADVANCE_FRIEND = {
    [0]=
        {
        value = 31,
},
    [1]=
        {
        value = 32,
},
}
---当前等级可能遇到的问题解答  (HELP_ADVANCE)
HELP_ADVANCE_QUESTION = {
    [1]=
        {
        value = 11,
},
    [2]=
        {
        value = 11,
},
    [3]=
        {
        value = 11,
},
    [4]=
        {
        value = 11,
},
    [5]=
        {
        value = 11,
},
    [6]=
        {
        value = 11,
},
    [7]=
        {
        value = 11,
},
    [8]=
        {
        value = 11,
},
    [9]=
        {
        value = 11,
},
    [10]=
        {
        value = 11,
},
    [11]=
        {
        value = 12,
},
    [12]=
        {
        value = 12,
},
    [13]=
        {
        value = 12,
},
    [14]=
        {
        value = 12,
},
    [15]=
        {
        value = 12,
},
    [16]=
        {
        value = 12,
},
    [17]=
        {
        value = 12,
},
    [18]=
        {
        value = 12,
},
    [19]=
        {
        value = 12,
},
    [20]=
        {
        value = 12,
},
    [21]=
        {
        value = 13,
},
    [22]=
        {
        value = 13,
},
    [23]=
        {
        value = 13,
},
    [24]=
        {
        value = 13,
},
    [25]=
        {
        value = 13,
},
    [26]=
        {
        value = 13,
},
    [27]=
        {
        value = 13,
},
    [28]=
        {
        value = 13,
},
    [29]=
        {
        value = 13,
},
    [30]=
        {
        value = 13,
},
    [31]=
        {
        value = 14,
},
    [32]=
        {
        value = 14,
},
    [33]=
        {
        value = 14,
},
    [34]=
        {
        value = 14,
},
    [35]=
        {
        value = 14,
},
    [36]=
        {
        value = 14,
},
    [37]=
        {
        value = 14,
},
    [38]=
        {
        value = 14,
},
    [39]=
        {
        value = 14,
},
    [40]=
        {
        value = 14,
},
    [41]=
        {
        value = 15,
},
    [42]=
        {
        value = 15,
},
    [43]=
        {
        value = 15,
},
    [44]=
        {
        value = 15,
},
    [45]=
        {
        value = 15,
},
    [46]=
        {
        value = 15,
},
    [47]=
        {
        value = 15,
},
    [48]=
        {
        value = 15,
},
    [49]=
        {
        value = 15,
},
    [50]=
        {
        value = 15,
},
    [51]=
        {
        value = 16,
},
    [52]=
        {
        value = 16,
},
    [53]=
        {
        value = 16,
},
    [54]=
        {
        value = 16,
},
    [55]=
        {
        value = 16,
},
    [56]=
        {
        value = 16,
},
    [57]=
        {
        value = 16,
},
    [58]=
        {
        value = 16,
},
    [59]=
        {
        value = 16,
},
    [60]=
        {
        value = 16,
},
    [61]=
        {
        value = 17,
},
    [62]=
        {
        value = 17,
},
    [63]=
        {
        value = 17,
},
    [64]=
        {
        value = 17,
},
    [65]=
        {
        value = 17,
},
    [66]=
        {
        value = 17,
},
    [67]=
        {
        value = 17,
},
    [68]=
        {
        value = 17,
},
    [69]=
        {
        value = 17,
},
    [70]=
        {
        value = 17,
},
    [71]=
        {
        value = 18,
},
    [72]=
        {
        value = 18,
},
    [73]=
        {
        value = 18,
},
    [74]=
        {
        value = 18,
},
    [75]=
        {
        value = 18,
},
    [76]=
        {
        value = 18,
},
    [77]=
        {
        value = 18,
},
    [78]=
        {
        value = 18,
},
    [79]=
        {
        value = 18,
},
    [80]=
        {
        value = 18,
},
    [81]=
        {
        value = 19,
},
    [82]=
        {
        value = 19,
},
    [83]=
        {
        value = 19,
},
    [84]=
        {
        value = 19,
},
    [85]=
        {
        value = 19,
},
    [86]=
        {
        value = 19,
},
    [87]=
        {
        value = 19,
},
    [88]=
        {
        value = 19,
},
    [89]=
        {
        value = 19,
},
    [90]=
        {
        value = 19,
},
    [91]=
        {
        value = 20,
},
    [92]=
        {
        value = 20,
},
    [93]=
        {
        value = 20,
},
    [94]=
        {
        value = 20,
},
    [95]=
        {
        value = 20,
},
    [96]=
        {
        value = 20,
},
    [97]=
        {
        value = 20,
},
    [98]=
        {
        value = 20,
},
    [99]=
        {
        value = 20,
},
    [100]=
        {
        value = 20,
},
}
--- 补充描述 数据中ElementData相关的项
HELP_ELEMENTDATA = {
    [1003]=
        {
        tag = { 1,2,3 },
        desc = _t"我是甩鸡鸡大侠",
},
}
--- 补充描述 数据中任务相关的项
HELP_TASKDATA = {
    [1002]=
        {
        tag = { 1,2,3 },
        desc = _t"我是甩鸡鸡大侠",
},
}
--- 补充描述 数据中技能相关的项
HELP_SKILLDATA = {
    [1004]=
        {
        tag = { 1,2,3 },
        desc = _t"我是甩鸡鸡大侠",
},
}
--- 对话框和展开百科的对应关系(强调 只对应百科)   ["对话框文件名"] = HELPINFO的ID
HELP_DIALOG = {
    ["Panel_Army.xml"]=
        {
        value = 49,
},
    ["Panel_ArmyAddMember.xml"]=
        {
        value = 49,
},
    ["Panel_ArmyBase.xml"]=
        {
        value = 49,
},
    ["Panel_ArmyBaseOther.xml"]=
        {
        value = 49,
},
    ["Panel_ArmyJoin.xml"]=
        {
        value = 49,
},
    ["Panel_ArmyOperate.xml"]=
        {
        value = 49,
},
    ["Panel_Auction.xml"]=
        {
        value = 30,
},
    ["Panel_Bag.xml"]=
        {
        value = 31,
},
    ["Panel_Bank.xml"]=
        {
        value = 31,
},
    ["Panel_Captcha.xml"]=
        {
        value = 33,
},
    ["Panel_ChangePro.xml"]=
        {
        value = 73,
},
    ["Panel_Confess.xml"]=
        {
        value = 47,
},
    ["Panel_Credit.xml"]=
        {
        value = 53,
},
    ["Panel_Daily.xml"]=
        {
        value = 0,
},
    ["Panel_EnhanceTransfer.xml"]=
        {
        value = 72,
},
    ["Panel_Gshop.xml"]=
        {
        value = 58,
},
    ["Panel_Guide.xml"]=
        {
        value = 109,
},
    ["Panel_Help.xml"]=
        {
        value = 0,
},
    ["Panel_HelpNew.xml"]=
        {
        value = 109,
},
    ["Panel_InputBox.xml"]=
        {
        value = 0,
},
    ["Panel_InputBuy.xml"]=
        {
        value = 0,
},
    ["Panel_InputCommodityNum.xml"]=
        {
        value = 0,
},
    ["Panel_InputItem.xml"]=
        {
        value = 0,
},
    ["Panel_InputItemQuest.xml"]=
        {
        value = 0,
},
    ["Panel_LockMain.xml"]=
        {
        value = 32,
},
    ["Panel_MessageComboList.xml"]=
        {
        value = 46,
},
    ["Panel_NoArmyTech.xml"]=
        {
        value = 49,
},
    ["Panel_OnlineNotice.xml"]=
        {
        value = 0,
},
    ["Panel_Other.xml"]=
        {
        value = 87,
},
    ["Panel_Pet.xml"]=
        {
        value = 0,
},
    ["Panel_PhotoBook.xml"]=
        {
        value = 50,
},
    ["Panel_PlayerNear.xml"]=
        {
        value = 46,
},
    ["Panel_Produce.xml"]=
        {
        value = 68,
},
    ["Panel_ProduceLearn.xml"]=
        {
        value = 68,
},
    ["Panel_Push.xml"]=
        {
        value = 109,
},
    ["Panel_RaidInfo.xml"]=
        {
        value = 0,
},
    ["Panel_RoleInfoMain.xml"]=
        {
        value = 60,
},
    ["Panel_SaintClothEnhance.xml"]=
        {
        value = 63,
},
    ["Panel_SequenceEditor.xml"]=
        {
        value = 71,
},
    ["Panel_Settings.xml"]=
        {
        value = 93,
},
    ["Panel_Skills.xml"]=
        {
        value = 65,
},
    ["Panel_Solo_Challenge.xml"]=
        {
        value = 0,
},
    ["Panel_StallHost.xml"]=
        {
        value = 29,
},
    ["Panel_StallView.xml"]=
        {
        value = 29,
},
    ["Panel_Store.xml"]=
        {
        value = 0,
},
    ["Panel_StoreLog.xml"]=
        {
        value = 0,
},
    ["Panel_Top.xml"]=
        {
        value = 35,
},
    ["Panel_Trade.xml"]=
        {
        value = 70,
},
    ["Panel_Treasure.xml"]=
        {
        value = 0,
},
    ["Panel_ViewKosumo.xml"]=
        {
        value = 62,
},
    ["Panel_ViewPlayer.xml"]=
        {
        value = 66,
},
    ["Panel_Vip.xml"]=
        {
        value = 59,
},
    ["Panel_WorldMap.xml"]=
        {
        value = 88,
},
}