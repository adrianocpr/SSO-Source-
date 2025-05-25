--[[ @i18n achievement ]]
local _t = require("i18n").context("achievement")
achiev_cond_def = {
    [1]=
        {
        client_check = 0,----
        desc = _t"首次死亡",----
},
    [2]=
        {
        client_check = 0,----
        desc = _t"首次结婚",----
},
    [3]=
        {
        client_check = 1,----
        desc = _t"首次拜师",----
},
    [4]=
        {
        client_check = 1,----
        desc = _t"首次收徒",----
},
    [5]=
        {
        client_check = 1,----
        desc = _t"创建或加入一个军团",----
},
    [6]=
        {
        client_check = 1,----
        desc = _t"首次星魂注入",----
},
    [7]=
        {
        client_check = 1,----
        desc = _t"首次星魂析出",----
},
    [8]=
        {
        client_check = 1,----
        desc = _t"首次星魂融合",----
},
    [9]=
        {
        client_check = 1,----
        desc = _t"首次使用骑乘技能",----
},
    [10]=
        {
        client_check = 1,----
        desc = _t"首次社区激活角色",----
},
    [11]=
        {
        client_check = 1,----
        desc = _t"首次使用组队语音",----
},
    [12]=
        {
        client_check = 1,----
        desc = _t"首次加好友",----
},
    [13]=
        {
        client_check = 1,----
        desc = _t"首次组队",----
},
    [14]=
        {
        client_check = 1,----
        desc = _t"首次手动升级",----
},
    [15]=
        {
        client_check = 1,----
        desc = _t"首次进入军团语音",----
},
    [16]=
        {
        client_check = 1,----
        desc = _t"首次装备聚能转移",----
},
    [17]=
        {
        client_check = 1,----
        desc = _t"首次便携版登陆",----
},
    [18]=
        {
        client_check = 1,----
        desc = _t"首次领取系统双倍经验",----
},
    [19]=
        {
        client_check = 1,----
        desc = _t"首次学习天赋技能",----
},
    [20]=
        {
        client_check = 1,----
        desc = _t"首次慢节奏挂机胜利",----
},
    [21]=
        {
        client_check = 1,----
        desc = _t"首次拍卖一个物品",----
},
    [22]=
        {
        client_check = 1,----
        desc = _t"首次竞拍成功一个物品",----
},
    [23]=
        {
        client_check = 1,----
        desc = _t"首次元宝交易",----
},
    [24]=
        {
        client_check = 1,----
        desc = _t"首次职业切换",----
},
    [25]=
        {
        client_check = 1,----
        desc = _t"首次摆摊",----
},
    [26]=
        {
        client_check = 1,----
        desc = _t"首次从别人摊位购买东西",----
},
    [27]=
        {
        client_check = 1,----
        desc = _t"首次摆摊成功售出东西",----
},
    [28]=
        {
        client_check = 1,----
        desc = _t"首次摆摊成功收购东西",----
},
    [29]=
        {
        client_check = 1,----
        desc = _t"首次成功设置时间锁",----
},
    [30]=
        {
        client_check = 1,----
        desc = _t"首次成功设置密码锁",----
},
    [31]=
        {
        client_check = 1,----
        desc = _t"首次选择职业",----
},
    [32]=
        {
        client_check = 1,----
        desc = _t"技能学习",----
},
    [33]=
        {
        client_check = 1,----
        desc = _t"首次小宇宙爆发",----
},
    [34]=
        {
        client_check = 1,----
        desc = _t"连招编辑器",----
},
    [35]=
        {
        client_check = 1,----
        desc = _t"首次使用占星",----
},
    [36]=
        {
        client_check = 1,----
        desc = _t"首次符文镶嵌",----
},
    [37]=
        {
        client_check = 1,----
        desc = _t"首次装备聚能",----
},
    [38]=
        {
        client_check = 1,----
        desc = _t"首次魔盒合成",----
},
    [39]=
        {
        client_check = 1,----
        desc = _t"首次魔盒拆分",----
},
    [40]=
        {
        client_check = 1,----
        desc = _t"圣衣星铸",----
},
    [41]=
        {
        client_check = 1,----
        desc = _t"沐浴荣光",----
},
    [42]=
        {
        client_check = 1,----
        desc = _t"首次消费一次星券",----
},
    [43]=
        {
        client_check = 1,----
        desc = _t"首次装上一个称号",----
},
    [44]=
        {
        client_check = 1,----
        desc = _t"首次打开仓库",----
},
    [101]=
        {
        client_check = 0,----
        desc = _t"达成某成就",----
},
    [102]=
        {
        client_check = 0,----
        desc = _t"人物等级达到",----
},
    [103]=
        {
        client_check = 0,----
        desc = _t"小宇宙等级达到",----
},
    [104]=
        {
        client_check = 0,----
        desc = _t"完成某任务",----
},
    [105]=
        {
        client_check = 0,----
        desc = _t"杀死某个ID的怪物",----
},
    [106]=
        {
        client_check = 0,----
        desc = _t"声望值达到",----
},
    [107]=
        {
        client_check = 0,----
        desc = _t"增量声望值达到",----
},
    [108]=
        {
        client_check = 0,----
        desc = _t"挑战副本胜利",----
},
    [109]=
        {
        client_check = 0,----
        desc = _t"完成某个战场",----
},
    [110]=
        {
        client_check = 0,----
        desc = _t"绑定币达到",----
},
    [111]=
        {
        client_check = 0,----
        desc = _t"金钱达到",----
},
    [112]=
        {
        client_check = 0,----
        desc = _t"战斗力达到",----
},
    [113]=
        {
        client_check = 0,----
        desc = _t"获得称号的个数",----
},
    [114]=
        {
        client_check = 0,----
        desc = _t"是否有特定的称号",----
},
    [115]=
        {
        client_check = 0,----
        desc = _t"获得图鉴的个数",----
},
    [116]=
        {
        client_check = 0,----
        desc = _t"获得圣衣的个数",----
},
    [117]=
        {
        client_check = 0,----
        desc = _t"获得某类圣衣的个数",----
},
    [118]=
        {
        client_check = 0,----
        desc = _t"好友的个数",----
},
    [119]=
        {
        client_check = 0,----
        desc = _t"任意好友的友好度达到",----
},
    [120]=
        {
        client_check = 0,----
        desc = _t"打死小偷怪",----
},
    [121]=
        {
        client_check = 0,----
        desc = _t"VIP",----
},
    [122]=
        {
        client_check = 0,----
        desc = _t"装备或活动副本胜利",----
},
    [123]=
        {
        client_check = 0,----
        desc = _t"获得某品质星魂",----
},
    [124]=
        {
        client_check = 0,----
        desc = _t"星魂满级个数",----
},
    [125]=
        {
        client_check = 0,----
        desc = _t"获得坐骑个数",----
},
    [126]=
        {
        client_check = 0,----
        desc = _t"你暗恋的好友也暗恋你",----
},
    [127]=
        {
        client_check = 0,----
        desc = _t"在地图ID为A的地方击杀玩家个数达到B",----
},
    [128]=
        {
        client_check = 0,----
        desc = _t"某个生产技能达到等级",----
},
    [129]=
        {
        client_check = 0,----
        desc = _t"在慢节奏PVP中战胜队友次数达到（挑战赛）",----
},
    [130]=
        {
        client_check = 0,----
        desc = _t"在慢节奏PVP中连续猜拳胜利次数达到（淘汰赛）",----
},
    [131]=
        {
        client_check = 0,----
        desc = _t"在慢节奏PVP中排名达到（淘汰赛）",----
},
    [132]=
        {
        client_check = 0,----
        desc = _t"任意生产技能达到1级",----
},
    [133]=
        {
        client_check = 0,----
        desc = _t"任意圣衣星铸等级达到",----
},
    [134]=
        {
        client_check = 0,----
        desc = _t"小宇宙星力值达到",----
},
    [135]=
        {
        client_check = 0,----
        desc = _t"聚能完美度达到",----
},
    [136]=
        {
        client_check = 0,----
        desc = _t"购买物品id的个数",----
},
    [1001]=
        {
        client_check = 0,----
        desc = _t"完成某任务次数",----
},
    [1002]=
        {
        client_check = 0,----
        desc = _t"完成某类任务的次数",----
},
    [1003]=
        {
        client_check = 0,----
        desc = _t"某段时间A里每B段时间完成某类任务次数",----
},
    [1004]=
        {
        client_check = 0,----
        desc = _t"连续完成某类任务次数",----
},
    [1005]=
        {
        client_check = 0,----
        desc = _t"击杀某ID的怪物次数",----
},
    [1006]=
        {
        client_check = 0,----
        desc = _t"学会某类技能某等级的个数",----
},
    [1007]=
        {
        client_check = 0,----
        desc = _t"徒弟出师的个数",----
},
    [1008]=
        {
        client_check = 0,----
        desc = _t"某副本胜利的次数",----
},
    [1009]=
        {
        client_check = 0,----
        desc = _t"某战场胜利的次数",----
},
    [1010]=
        {
        client_check = 0,----
        desc = _t"击杀某ID集合的怪物次数",----
},
    [1011]=
        {
        client_check = 0,----
        desc = _t"获得图鉴ID集合的个数",----
},
}