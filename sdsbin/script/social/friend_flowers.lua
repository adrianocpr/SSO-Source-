--[[ @i18n social ]]
local _t = require("i18n").context("social")
friend_flowers = {}
friend_flowers_gfx = {}

friend_flowers_show = {99,521,1001,1314} -- 界面前四个选项

-- 一般寄语：“送你n多鲜花”， 见 function friend_flowers:GetDescOfFlowers
-- 特殊寄语：以下
friend_flowers[99] = _t"长长久久的爱之祝福，不再让你孤单寂寞。当99朵玫瑰飞抵你的心房的那一刻，我向苍天起誓，为我们的爱立下了长长久久的誓言！"
friend_flowers[521] = _t"我爱你，这三个字用来表达我对你的心，我爱你，这是我对爱的呼唤。我要亲吻着你的手让这三个字响遍整个世界！"
friend_flowers[1001] = _t"一千零一夜的浪漫真情，守护千里挑一的你。我的眼中写满了星辰下的情歌。我愿你唱上一千零一夜！因为，你是我的唯一！"
friend_flowers[1314] = _t"一生一世，相爱相知。相约今生，一根红线把我们牵到了一起。接着，我要一直走下去，牵着你的手走上一生一世！"


friend_flowers_gfx[99] = "界面\\全屏心中级心7S.gfx"
friend_flowers_gfx[521] = "界面\\全屏心中级心7S.gfx"
friend_flowers_gfx[1001] = "界面\\全屏心高级心7S.gfx"
friend_flowers_gfx[1314] = "界面\\全屏心高级心7S.gfx"

function friend_flowers:GetDescOfFlowers(num)
    return friend_flowers[num]
end

function friend_flowers:GetGfxOfFlowers(num)
    return friend_flowers_gfx[num]
end

function friend_flowers:GetFlowerNumOfIndex(index)
    return friend_flowers_show[index]
end

function friend_flowers:GetFlowerTid()
    return 22746
end