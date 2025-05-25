--[[ @i18n dungeon ]]
local _t = require("i18n").context("dungeon")
DialogStarGuard =
{}
DialogStarGuard.luck_level =  --场景参数值对应的星座运势强度
    {
             --1    --2     --3     --4     --5     --6     --7     --8     --9     --10                                       
             1,		1,		1,		1,		1,		1,		1,		1,		1,		1,		--0
             2,		2,		2,		2,		2,		2,		2,		2,		2,		2,		--1
             3,		3,		3,		3,		3,		3,		3,		3,		3,		3,		--2
             4,		4,		4,		4,		4,		4,		4,		4,		4,		4,		--3
             5,		5,		5,		5,		5,		5,		5,		5,		5,		5,		--4
             6,		6,		6,		6,		6,		6,		6,		6,		6,		6,		--5
             7,		7,		7,		7,		7,		7,		7,		7,		7,		7,		--6
             8,		8,		8,		8,		8,		8,		8,		8,		8,		8,		--7
             9,		9,		9,		9,		9,		9,		9,		9,		9,		9,		--8
             10,	10,		10,		10,		10,		10,		10,		10,		10,		10,		--9
    }

DialogStarGuard.name =  --十二星座名字
    {
        _t'白羊',
        _t'金牛',
        _t'双子',
        _t'巨蟹',
        _t'狮子',
        _t'处女',
        _t'天秤',
        _t'天蝎',
        _t'射手',
        _t'摩羯',
        _t'水瓶',
        _t'双鱼',
    }

DialogStarGuard.Skills =  --玩家星座对应获得的技能
    {
        538,
        539,
        540,
        541,
        542,
        543,
        544,
        545,
        546,
        547,
        548,
        549,
    }

DialogStarGuard.ImageHint1 = _t'^ffff00%s守护 %s'
DialogStarGuard.ImageHint2 = _t'^ffffff召唤你的星相守护。点击触摸该守护可以获得\r持续30分钟的增益状态。队友也可以触摸它。\r只能在多人副本中召唤。'
DialogStarGuard.Text = _t'^00ff00攻击力+%d'
DialogStarGuard.PrgHint = _t'运势强度：%d'

DialogStarGuard.Image =  --玩家星座对应图片
    {
        'res\\starguard\\白羊.dds',
        'res\\starguard\\金牛.dds',
        'res\\starguard\\双子.dds',
        'res\\starguard\\巨蟹.dds',
        'res\\starguard\\狮子.dds',
        'res\\starguard\\处女.dds',
        'res\\starguard\\天平.dds',
        'res\\starguard\\天蝎.dds',
        'res\\starguard\\射手.dds',
        'res\\starguard\\摩羯.dds',
        'res\\starguard\\水瓶.dds',
        'res\\starguard\\双鱼.dds',
    }

DialogStarGuard.LevelHintStar_half =  _t'☆'
DialogStarGuard.LevelHintStar =  _t'★'
    
