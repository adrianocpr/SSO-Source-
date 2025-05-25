--[[ @i18n quest ]]


local _t = require("i18n").context("quest")
-- 任务头像喊话数据
-- 接受某任务 

----------DialogAcceptIdTask DialogStrategy DialogFinishIdTask表格式-------------------
--DialogFinishIdTask[1055] = --只有一次对话框显示。
--{
-- [1] = {
--  txt = "希望你能凭借自己的力量在这个死亡之岛上生存下去。",
--  name = "科塞尔",
--  img = "quest\\Portrait\\test1.jpg",--如左路径，显示大头像。
--  ShowPortrait = true,--显示玩家自己头像，此时上一项无效。false或不填此项无效。
--  reverse = true, --如果为true，头像显示在对话的右边，其他值或者不填不变。
--  face = "quest\\Portrait\\test1.jpg",--显示头像旁边的小老虎表情。
--  },
--  delay = 10000,  --单位毫秒，如果不填，默认为5000。 
--}
----------NpcAcceptIdTask NpcFinishIdTask 表格式-------------------
--{
--     delay = 30000, --界面显示时间，delay毫秒后开始闪烁，再过3秒后自动关闭。
--     [1] = {
--                  txt = "恭喜您获得了神圣祈祷经验奖励，您剩余的神圣祈祷时间为：%d小时", --界面文本内容，%d会被替换为repu id声望值。
--                  name = "神圣祈祷", --界面标题
--                  img = "quest\\Portrait\\", --此项无效
--                  ShowPortrait = false, --此项无效
--                  repu = 30 --取值声望，用于txt中
--                  afterTime = 3000, -- 此界面在出现前所等待
--           },
--} 
DialogFinishIdTask = {} --完成任务触发头像喊话
DialogAcceptIdTask = {} --接受任务触发头像喊话
DialogStrategy = {} --策略触发头像喊话
NpcAcceptIdTask = {} --接受任务触发npc对话界面
NpcFinishIdTask = {} --完成任务触发npc对话界面

DialogStrategy[1] =        ---_激斗！黄金十二宫！
{
     delay = 3000,
     [1] = {
                  txt = _t"什么！水晶之墙上出现了裂痕？",
                  name = _t"白羊宫守卫长",
                  img = "res\\portrait\\狮子考验者瘦小男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[2] =        ---_激斗！黄金十二宫！
{
     delay = 3000,
     [1] = {
                  txt = _t"真的是裂痕！难道水晶之墙的力量减弱了？ ",
                  name = _t"白羊宫守卫长",
                  img = "res\\portrait\\狮子考验者瘦小男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[3] =        ---_激斗！黄金十二宫！
{
     delay = 3000,
     [1] = {
                  txt = _t"你是什么人？竟然能破坏穆先生的水晶之墙？",
                  name = _t"白羊宫守卫长",
                  img = "res\\portrait\\狮子考验者瘦小男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[4] =        ---_激斗！黄金十二宫！
{
     delay = 3000,
     [1] = {
                  txt = _t"难道，水晶之墙竟会被你这样的家伙击碎吗？我不相信！",
                  name = _t"白羊宫守卫长",
                  img = "res\\portrait\\狮子考验者瘦小男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[5] =        ---_激斗！黄金十二宫！
{
     delay = 3000,
     [1] = {
                  txt = _t"不，这不可能……",
                  name = _t"白羊宫守卫长",
                  img = "res\\portrait\\狮子考验者瘦小男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[6] =        ---_激斗！黄金十二宫！
{
     delay = 3000,
     [1] = {
                  txt = _t"嗯，这还像点样子，你的拳头不像刚才那样软弱了。",
                  name = _t"阿鲁迪巴",
                  img = "res\\portrait\\黄金圣斗士金牛座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[7] =        ---_激斗！黄金十二宫！
{
     delay = 3000,
     [1] = {
                  txt = _t"尽你所能向我挥拳吧，让我看看你的实力究竟到了什么程度。",
                  name = _t"阿鲁迪巴",
                  img = "res\\portrait\\黄金圣斗士金牛座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[131] =        ---_激斗！黄金十二宫！
{
     delay = 2500,
     [1] = {
                  txt = _t"什么人？竟敢擅闯白羊宫！",
                  name = _t"白羊宫守卫",
                  img = "res\\portrait\\圣域杂兵瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"有紧急的事情要报告给教皇大人！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"教皇大人有禁令，任何人不得未经允许踏入十二宫，你必须马上离开！",
                  name = _t"白羊宫守卫",
                  img = "res\\portrait\\圣域杂兵瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"不见到教皇大人，我是不会离开的！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"真是啰嗦，把他赶出去！",
                  name = _t"白羊宫守卫",
                  img = "res\\portrait\\圣域杂兵瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [6] = {
                  txt = _t"没办法，只好硬闯了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[132] =        ---_激斗！黄金十二宫！
{
     delay = 2500,
     [1] = {
                  txt = _t"竟然有人闯入白羊宫？守卫们都被打倒了吗？",
                  name = _t"白羊宫守卫长",
                  img = "res\\portrait\\狮子考验者瘦小男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"我并不想和守卫们战斗，有紧急的事情要报告给教皇大人！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"入侵者！不要妄想！没人可以通过穆大人的水晶之墙！",
                  name = _t"白羊宫守卫长",
                  img = "res\\portrait\\狮子考验者瘦小男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"原谅我，我必须要去见教皇大人！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[133] =        ---_激斗！黄金十二宫！
{
     delay = 2500,
     [1] = {
                  txt = _t"居然有人闯过了白羊宫？哼！别想再通过金牛宫！",
                  name = _t"金牛宫守卫长",
                  img = "res\\portrait\\狮子考验者大壮男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[134] =        ---_激斗！黄金十二宫！
{
     delay = 2500,
     [1] = {
                  txt = _t"站住！不要再向前走了，我阿鲁迪巴奉命在这里守护金牛宫。",
                  name = _t"阿鲁迪巴",
                  img = "res\\portrait\\黄金圣斗士金牛座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"阿鲁迪巴大人，冥界打算重铸冥王神衣，我要马上报告教皇。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"冥王神衣！难道哈迪斯……？不过教皇刚刚下令，无论是什么紧急情况，都不要打扰他。你还是离开吧！",
                  name = _t"阿鲁迪巴",
                  img = "res\\portrait\\黄金圣斗士金牛座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"这么重大的事，我一定要报告给教皇，没有人可以阻止我，哪怕是大人你！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"哈哈哈！口气真大，如果你能把我打退半步，我就让你过去！放马过来吧！",
                  name = _t"阿鲁迪巴",
                  img = "res\\portrait\\黄金圣斗士金牛座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[8] =        ---_三环双鱼宫
{
     delay = 3000,
     [1] = {
                  txt = _t"欢迎来到双鱼座幻想空间，祝你们好运！",
                  name = _t"阿布罗狄",
                  img = "res\\portrait\\黄金圣斗士双鱼座a.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5786] =        ---开启黄泉之井_开启黄泉之井
{
     delay = 3000,
     [1] = {
                  txt = _t"多久了，没有一个活人玩具来到这个地方，你知道吗？",
                  name = _t"冥界喽啰",
                  img = "res\\portrait\\冥界杂兵近战瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"我们多么的孤独。啊，放心吧，我不会很快就让你死，让我慢慢的折磨你！！！",
                  name = _t"冥界喽啰",
                  img = "res\\portrait\\冥界杂兵近战瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5788] =        ---开启黄泉之井_开启黄泉之井
{
     delay = 3000,
     [1] = {
                  txt = _t"哈哈，真是个废物，连一个人类也杀不死！让我们兄弟来对付一下这个玩具",
                  name = _t"冥界喽啰",
                  img = "res\\portrait\\冥界杂兵近战瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5789] =        ---开启黄泉之井_开启黄泉之井
{
     delay = 3000,
     [1] = {
                  txt = _t"混蛋，看样子这个家伙不那么容易对付啊，不过这样才有点意思！一起上，宰了他！",
                  name = _t"冥界喽啰",
                  img = "res\\portrait\\冥斗士杂兵远程男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[9] =        ---开启黄泉之井_开启黄泉之井
{
     delay = 3000,
     [1] = {
                  txt = _t"三头犬，是地狱三头犬，快跑！！！",
                  name = _t"冥界喽啰",
                  img = "res\\portrait\\冥界杂兵近战瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[445] =        ---迎战天狼座_银河战争
{
     delay = 4000,
     [1] = {
                  txt = _t"你真不走运，竟然遇上我天狼座那智。",
                  name = _t"那智",
                  img = "res\\portrait\\青铜圣斗士天狼座那智.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"运气不好的也许是你！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"哼！那就让你尝尝我的厉害，打倒了你，下一个就是凤凰座！",
                  name = _t"那智",
                  img = "res\\portrait\\青铜圣斗士天狼座那智.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[447] =        ---扶起天狼座_银河战争
{
     delay = 4000,
     [1] = {
                  txt = _t"别小看我！看我天狼座奥义！",
                  name = _t"那智",
                  img = "res\\portrait\\青铜圣斗士天狼座那智.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"我怎么会被……打败……",
                  name = _t"那智",
                  img = "res\\portrait\\青铜圣斗士天狼座那智.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[10] =        ---_银河战争
{
     delay = 4000,
     [1] = {
                  txt = _t"不愧是天狼座，一上来就用这种猛烈的攻击。",
                  name = _t"蛮",
                  img = "res\\portrait\\青铜圣斗士幼狮座蛮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哼，这种程度也敢来争夺黄金圣衣。",
                  name = _t"邪武",
                  img = "res\\portrait\\青铜圣斗士独角兽座邪武.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"邪武……等着瞧！",
                  name = _t"蛮",
                  img = "res\\portrait\\青铜圣斗士幼狮座蛮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[11] =        ---_银河战争
{
     delay = 4000,
     [1] = {
                  txt = _t"什么？看来我要认真一些了！",
                  name = _t"那智",
                  img = "res\\portrait\\青铜圣斗士天狼座那智.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"凤凰座和白鸟座那两个胆小鬼都没来，搞的我们连休息时间都没有。",
                  name = _t"市",
                  img = "res\\portrait\\青铜圣斗士水蛇座市.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"想休息就去吧，不过时间可不会太久。",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"你是……白鸟座冰河！",
                  name = _t"市",
                  img = "res\\portrait\\青铜圣斗士水蛇座市.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[12] =        ---_银河战争
{
     delay = 4000,
     [1] = {
                  txt = _t"可恶！绝不会饶过你！",
                  name = _t"那智",
                  img = "res\\portrait\\青铜圣斗士天狼座那智.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"天狼座的对手好强！",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"嗯，我能感觉到他的小宇宙非同寻常！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[13] =        ---_银河战争
{
     delay = 4000,
     [1] = {
                  txt = _t"天狼座好像受了重伤。",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"别着急，星矢，下一个就轮到你，哈哈哈。",
                  name = _t"檄",
                  img = "res\\portrait\\青铜圣斗士大熊座檄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"我不会输的！",
                  name = _t"那智",
                  img = "res\\portrait\\青铜圣斗士天狼座那智.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[97] =        ---圣斗士的修行_新手村
{
     delay = 3000,
     [1] = {
                  txt = _t"不好啦！快……卡西欧士……又来了！",
                  name = _t"圣斗士候补生",
                  img = "res\\portrait\\圣斗士女学员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"卡西欧士疯了，他说要独占这个训练场，想把大家都赶走！",
                  name = _t"圣斗士候补生",
                  img = "res\\portrait\\圣斗士女学员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[307] =        ---历史积淀的矛盾_新手村
{
     delay = 3000,
     [1] = {
                  txt = _t"卡西欧士，该你了！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"住手！你们难道都忘了，圣斗士是不允许私斗的！",
                  name = _t"魔铃",
                  img = "res\\portrait\\魔铃.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[308] =        ---秘训！爱情海滩_新手村
{
     delay = 3000,
     [1] = {
                  txt = _t"咦，艾娅！她旁边的黑袍少女是……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1067] =        ---住手！卡西欧士_新手村
{
     delay = 3000,
     [1] = {
                  txt = _t"呃——啊——卡西欧士！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"拦住他，这里还轮不到他放肆！",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\沙尔拉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[316] =        ---无法承受之痛_新手村
{
     delay = 3000,
     [1] = {
                  txt = _t"艾娅不在！她去了哪里？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[320] =        ---圣斗士墓地_新手村
{
     delay = 3000,
     [1] = {
                  txt = _t"那个黑袍少女是……算了，现在最重要的是找到艾娅。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[117] =        ---凄绝！眼中的笑意_新手村
{
     delay = 3000,
     [1] = {
                  txt = _t"艾娅！！！你……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"呵呵，你有时间还是先关心你自己吧。这里的英灵可没有那么好脾气！",
                  name = _t"艾娅",
                  img = "res\\portrait\\圣域圣斗士女学员艾亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"是谁玷污了圣洁的墓地……闯入这里的人都必须死！",
                  name = _t"狂暴的圣斗士英灵",
                  img = "res\\portrait\\圣斗士英灵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[113] =        ---爆发吧，星矢！_新手村
{
     delay = 3000,
     [1] = {
                  txt = _t"莎尔娜大人，现在不用麻烦您，让我们来处置逃跑者。",
                  name = _t"白银侍从",
                  img = "res\\portrait\\希腊士兵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"杀了他，这小子已经不行了！",
                  name = _t"白银侍从",
                  img = "res\\portrait\\希腊士兵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[14] =        ---_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"紫龙，赢了我，黄金圣衣的部件就是你的了！不过这是不可能的！",
                  name = _t"黑暗天龙",
                  img = "res\\portrait\\黑暗天龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[15] =        ---_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"怎么回事，我根本伤不了黑暗天龙？难道这就是瞬所说的伏龙，这里还有隐藏在暗中的敌人吗？等等，难道漂浮着的烟尘中隐藏着敌人？",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[16] =        ---_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"碍手碍脚的家伙死了也好。亲情？我们黑暗圣斗士，黑暗圣斗士才不相信这一套愚蠢的理论！（脸部有点抽搐）",
                  name = _t"黑暗天龙",
                  img = "res\\portrait\\黑暗天龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[17] =        ---_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"愚蠢的紫龙，这么虚弱的身体居然还想战斗，那就让你死的快一点吧！",
                  name = _t"黑暗天龙",
                  img = "res\\portrait\\黑暗天龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"为了我的同伴，我愿意舍弃自己的生命。",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[18] =        ---_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"蠢货，蠢货，什么亲情友情都是不存在的！！！",
                  name = _t"黑暗天龙",
                  img = "res\\portrait\\黑暗天龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"赌上我的性命，也要为同伴战斗到底！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[687] =        ---_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"我的……最后一击应该让你止住血了吧。",
                  name = _t"黑暗天龙",
                  img = "res\\portrait\\黑暗天龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"为什么，要帮我？",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"紫龙，你为了同伴，居然可以牺牲自己，我也想体会一下这种感……觉……",
                  name = _t"黑暗天龙",
                  img = "res\\portrait\\黑暗天龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[19] =        ---_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"哼，第一个送死的终于来了。",
                  name = _t"一辉",
                  img = "res\\portrait\\凤凰座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"一辉，少得意。今天我要击败你！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[20] =        ---_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"冰河，我能看见你内心的脆弱，这将让你葬身于此！",
                  name = _t"一辉",
                  img = "res\\portrait\\凤凰座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"一辉，少说大话了！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[21] =        ---_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"冰河，你的拳对我没有一点威胁，因为你的内心还有太多羁绊。",
                  name = _t"一辉",
                  img = "res\\portrait\\凤凰座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[688] =        ---_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"一辉好……强大，但是，我不会让你全身而退的！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"混蛋，居然还能够将我冰冻，但是冰河，你这样的冻气根本就不足以将我冰封，让我亲手取下你的头颅！",
                  name = _t"一辉",
                  img = "res\\portrait\\凤凰座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"什么？冰封自己解开了，冰河已经死了！伤成这样居然还可以弄伤我，冰河，我真有点佩服你了。",
                  name = _t"一辉",
                  img = "res\\portrait\\凤凰座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"(喃喃低语)星矢……星矢……",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[22] =        ---_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"又一个半死的家伙想早点去地狱吗？",
                  name = _t"一辉",
                  img = "res\\portrait\\凤凰座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"一辉，我不会放过你！同伴们未完成的使命就由我来继续！",
                  name = _t"天马",
                  img = "res\\portrait\\天马.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"将死的傻瓜！",
                  name = _t"一辉",
                  img = "res\\portrait\\凤凰座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[23] =        ---_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"星矢，你比那几个废物稍强一点，但是与我一辉相比还差的远呢。",
                  name = _t"一辉",
                  img = "res\\portrait\\凤凰座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"今天你也将死在这里。感受绝望的痛苦吧！",
                  name = _t"一辉",
                  img = "res\\portrait\\凤凰座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[24] =        ---_十风穴决战
{
     delay = 2000,
     [1] = {
                  txt = _t"星……矢，战胜一辉。",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"星矢……加油！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"星……矢，击败哥哥！",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"怎么回事，我感受到星矢的拳上有其他人的气息！星矢的小宇宙明显增强了很多！",
                  name = _t"一辉",
                  img = "res\\portrait\\凤凰座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"一辉，这就是同伴的力量，而恶魔一般的你是根本无法体会到的！我将击倒你！！！",
                  name = _t"星矢",
                  img = "res\\portrait\\天马.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [6] = {
                  txt = _t"荒唐的废话！打倒我看看啊！",
                  name = _t"一辉",
                  img = "res\\portrait\\凤凰座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[689] =        ---_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"星矢，终于还是你赢了。",
                  name = _t"一辉",
                  img = "res\\portrait\\凤凰座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"胜利的不是我，是友情。",
                  name = _t"星矢",
                  img = "res\\portrait\\天马.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"伟大的友情！",
                  name = _t"星矢",
                  img = "res\\portrait\\天马.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[25] =        ---_紫龙与雷虎
{
     delay = 3000,
     [1] = {
                  txt = _t"雷虎、紫龙，今天一定要让你们知道我们的厉害！",
                  name = _t"强盗头目",
                  img = "res\\portrait\\庐山强盗强壮男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"报仇！报仇！",
                  name = _t"强盗",
                  img = "res\\portrait\\中毒的村民壮硕.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"我可没功夫跟这帮杂鱼玩，紫龙，交给你啦，哈哈！",
                  name = _t"雷虎",
                  img = "res\\portrait\\庐山雷虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"又是你们这群强盗？上次放过了你们，竟然还敢回来作恶。",
                  name = _t"紫龙",
                  img = "res\\portrait\\紫龙裸衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"可恶，居然让雷虎这小子跑了，大家别放过紫龙！",
                  name = _t"强盗头目",
                  img = "res\\portrait\\庐山强盗强壮男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [6] = {
                  txt = _t"放心，头领，我们已经把路堵上了，紫龙逃不掉了！",
                  name = _t"强盗",
                  img = "res\\portrait\\中毒的村民壮硕.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [7] = {
                  txt = _t"那就让我来收拾你们吧。",
                  name = _t"紫龙",
                  img = "res\\portrait\\紫龙裸衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[26] =        ---_紫龙与雷虎
{
     delay = 3000,
     [1] = {
                  txt = _t"紫龙，快跟上！",
                  name = _t"雷虎",
                  img = "res\\portrait\\庐山雷虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[27] =        ---_紫龙与雷虎
{
     delay = 3000,
     [1] = {
                  txt = _t"大家一起上，杀了他，庐山是我们的！",
                  name = _t"强盗头目",
                  img = "res\\portrait\\庐山强盗强壮男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"我们的！我们的！",
                  name = _t"强盗",
                  img = "res\\portrait\\中毒的村民壮硕.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"杀死紫龙！",
                  name = _t"强盗头目",
                  img = "res\\portrait\\庐山强盗强壮男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"紫龙！紫龙！",
                  name = _t"强盗",
                  img = "res\\portrait\\中毒的村民壮硕.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"真是不知悔改。",
                  name = _t"紫龙",
                  img = "res\\portrait\\紫龙裸衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[880] =        ---决斗！_紫龙与雷虎
{
     delay = 3000,
     [1] = {
                  txt = _t"雷虎，我曾说过，如果私斗，就不再是我的学生。",
                  name = _t"童虎",
                  img = "res\\portrait\\黄金圣斗士天枰座童虎老年.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"你违反了禁令，我只能将你逐出师门。",
                  name = _t"童虎",
                  img = "res\\portrait\\黄金圣斗士天枰座童虎老年.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"为什么！难道你看不出来我比紫龙更强吗？",
                  name = _t"雷虎",
                  img = "res\\portrait\\庐山雷虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"你还是不懂，现在的你即使再怎么修炼，也穿不上天龙座圣衣。",
                  name = _t"童虎",
                  img = "res\\portrait\\黄金圣斗士天枰座童虎老年.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"希望你以后能明白我的话，你走吧。",
                  name = _t"童虎",
                  img = "res\\portrait\\黄金圣斗士天枰座童虎老年.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [6] = {
                  txt = _t"不可能！我不相信！你一定会后悔的！",
                  name = _t"雷虎",
                  img = "res\\portrait\\庐山雷虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [7] = {
                  txt = _t"雷虎……",
                  name = _t"紫龙",
                  img = "res\\portrait\\紫龙裸衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[28] =        ---_紫龙与雷虎
{
     delay = 3000,
     [1] = {
                  txt = _t"紫龙，你太慢了！",
                  name = _t"雷虎",
                  img = "res\\portrait\\庐山雷虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[29] =        ---_三环天秤
{
     delay = 5000,
     [1] = {
                  txt = _t"通往中间圆盘的道路已打开",
                  name = _t"艾娅",
                  img = "res\\portrait\\希腊少女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[30] =        ---_三环天秤
{
     delay = 5000,
     [1] = {
                  txt = _t"通往上层的楼梯已经打开",
                  name = _t"艾娅",
                  img = "res\\portrait\\希腊少女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[31] =        ---_三环天秤
{
     delay = 5000,
     [1] = {
                  txt = _t"通往太极圆台的传送点已在窗边开启",
                  name = _t"艾娅",
                  img = "res\\portrait\\希腊少女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[32] =        ---_三环天秤
{
     delay = 5000,
     [1] = {
                  txt = _t"地狱海水将在5秒后降临，速度寻找高地躲避",
                  name = _t"艾娅",
                  img = "res\\portrait\\希腊少女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[33] =        ---_逃离比良坂
{
     delay = 5000,
     [1] = {
                  txt = _t"哈哈哈哈，像所有废物一样死在黄泉比良坂吧！",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"迪斯马斯克，你这种残忍根本不配做黄金圣斗士！！！",
                  name = _t"",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[34] =        ---_逃离比良坂
{
     delay = 5000,
     [1] = {
                  txt = _t"混蛋，居然可以伤到我，看样子我对你有点低估。",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[35] =        ---_逃离比良坂
{
     delay = 5000,
     [1] = {
                  txt = _t"看来我最近疏于练习啊！居然被一个后辈逼着要动点真功夫。",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"我的身体怎么不能……不能动弹了？",
                  name = _t"",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"让我想想怎们折磨你？",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"可恶，我一定要挣脱迪斯马斯克的束缚。",
                  name = _t"",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"啊，就用这个，让你享受一下痛苦一点一点渗透到你心底，但是却依然不死的恐惧！！！",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [6] = {
                  txt = _t"怎么样！怎么样！是不是很痛快！哈哈哈哈，吃掉他，吃掉他！",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [7] = {
                  txt = _t"啊……好痛苦！",
                  name = _t"",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [8] = {
                  txt = _t"不，我不能就这么倒在这个地方！我不会轻易就被打败！",
                  name = _t"",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [9] = {
                  txt = _t"燃……烧……燃烧吧！我的小宇宙！！！",
                  name = _t"",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [10] = {
                  txt = _t"怎……怎么可能？没有人能够解开我的束缚啊！",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[969] =        ---黑暗中的光明_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"这是……圣域的人！怎么会到庐山来？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"怎么样？问出什么没有？",
                  name = _t"圣域追击者",
                  img = "res\\portrait\\狮子考验者瘦小男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [3] = {
                  txt = _t"不行啊，这家伙嘴硬得很，已经被我打昏过去了。",
                  name = _t"圣域侍从",
                  img = "res\\portrait\\圣域杂兵壮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"该死，那位大人马上就要来了，要是耽误了大人的事你应该知道下场！",
                  name = _t"圣域追击者",
                  img = "res\\portrait\\狮子考验者瘦小男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t" 算了这个候补生看来快死了，把这个废物杀了，我们再去抓几个候补生过来。我就不信所有人都这么嘴硬！",
                  name = _t"圣域追击者",
                  img = "res\\portrait\\狮子考验者瘦小男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [6] = {
                  txt = _t"不好！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [7] = {
                  txt = _t"什么人？给我出来！",
                  name = _t"圣域追击者",
                  img = "res\\portrait\\狮子考验者瘦小男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1097] =        ---春之恋_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"看来李云说得没错，地龙的传说不可信。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[888] =        ---碧龙潭_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"该死！你们给我等着，那位大人一定不会放过你们……",
                  name = _t"圣域侍卫",
                  img = "res\\portrait\\狮子考验者瘦小男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[807] =        ---林乱_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"不好了……老师！村里……村里……",
                  name = _t"春丽",
                  img = "res\\portrait\\春丽.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[891] =        ---林乱_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"春丽，你呆在老师身边，我先回村子看看！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"等等，紫龙——",
                  name = _t"春丽",
                  img = "res\\portrait\\春丽.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[980] =        ---怒火_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"迪斯马斯克！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[981] =        ---最后的嘱托_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"咦，那是……春丽！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[910] =        ---机关_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"这是！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[912] =        ---巨蟹的追击_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"挑战者，去见神龙吧，相信我们还有机会再见……",
                  name = _t"神秘英灵",
                  img = "res\\portrait\\圣斗士英灵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[745] =        ---水中少年（二）_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"………………",
                  name = _t"狄蒂斯",
                  img = "res\\portrait\\圣域美人鱼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1113] =        ---营救_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"这是？春丽，这些战士就交给我来对付，你快回去找紫龙。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1115] =        ---返回隐龙村_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"抓住他，他是圣域的叛徒！",
                  name = _t"黄金侍从",
                  img = "res\\portrait\\狮子考验者大壮男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1064] =        ---圣斗士的修行_新手村
{
     delay = 5000,
     [1] = {
                  txt = _t"呜哈哈哈，给我打，把他们赶出训练场，这里他们不配使用……",
                  name = _t"卡西欧士",
                  img = "res\\portrait\\卡西欧士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3031] =        ---逃离！莎尔娜的追杀_新手村
{
     delay = 3000,
     [1] = {
                  txt = _t"可恶！星矢那小子想带着圣衣逃出圣域！",
                  name = _t"白银追击者",
                  img = "res\\portrait\\圣域杂兵瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"快追！绝对不能让星矢活着回去！",
                  name = _t"白银追击者",
                  img = "res\\portrait\\圣域圣斗士女学员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"魔铃，你们先走，这里交给我！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"这样也好，你自己要小心！",
                  name = _t"魔铃",
                  img = "res\\portrait\\魔铃.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[123] =        ---觉醒！圣衣的力量_新手村
{
     delay = 3000,
     [1] = {
                  txt = _t"圣域的女孩……难道是艾娅！！她……背叛了圣域吗？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1120] =        ---禁地！观星楼_新手村
{
     delay = 3000,
     [1] = {
                  txt = _t"这里是……观星楼？怎么会有冥界的人！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[319] =        ---再见，星矢！_新手村
{
     delay = 3000,
     [1] = {
                  txt = _t"不好了……艾娅……艾娅带着艾德去了圣斗士墓地！",
                  name = _t"圣斗士候补生",
                  img = "res\\portrait\\圣斗士女学员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[310] =        ---黄金的小宇宙_新手村
{
     delay = 3000,
     [1] = {
                  txt = _t"星矢！",
                  name = _t"魔铃",
                  img = "res\\portrait\\魔铃.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[323] =        ---书中的秘密_新手村
{
     delay = 3000,
     [1] = {
                  txt = _t"怎么回事？书上……记载的都是关于第一代圣战的消息！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1136] =        ---白日之梦_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"站住！最近村子有些变化，外乡人最好不要进去……",
                  name = _t"隐龙村村民",
                  img = "res\\portrait\\庐山村民男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[324] =        ---爆发！小宇宙的力量_新手村
{
     delay = 4000,
     [1] = {
                  txt = _t"艾娅，这就是你用生命换回的艾德！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"可是，这真的是你想要的吗？这样的艾德活着只会痛苦……我会亲手解决他！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1178] =        ---再见，星矢！_新手村
{
     delay = 3000,
     [1] = {
                  txt = _t"星矢，你终于成为了真正的圣斗士……不过，我绝不会输给你！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1134] =        ---等候命令之时_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"好轻的身体！这股从心底涌现的力量是……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这就是圣斗士的圣衣的力量！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不过，现在最要紧的是赶快回去找魔铃，将观星楼的事情告诉她！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 5000,
           },
     [4] = {
                  txt = _t"冥界的人既然出现在观星楼，他们一定谋划着什么！还有最后出现的那个人……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"看来，新的圣战即将开始！我还需要不断——不断的修行！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [6] = {
                  txt = _t"总有一天，我会用自己的力量，打败哈迪斯，消灭冥界！终结这场圣战！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[36] =        ---_三环双鱼宫
{
     delay = 5000,
     [1] = {
                  txt = _t"要小心玫瑰战士阿奎瓦，他可是个兄弟众多的狠角色。",
                  name = _t"神秘少女",
                  img = "res\\portrait\\希腊少女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[131] =        ---激怒的独角兽！_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"竟敢对小姐无理，让我独角兽座的邪武来收拾你！",
                  name = _t"邪武",
                  img = "res\\portrait\\青铜圣斗士独角兽座邪武.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[333] =        ---黄金圣衣，初现！_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"我的圣衣！！和黄金圣衣产生了共鸣！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[133] =        ---星之子_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"纱织小姐，天翼不见了！",
                  name = _t"美穗",
                  img = "res\\portrait\\富士山美惠.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[337] =        ---天马故乡_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"这里有股黑暗的小宇宙！……不，消失了，一转眼就消失了。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[339] =        ---行踪_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"又出现了，黑暗小宇宙！……前面的是皮包？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[340] =        ---黑暗，意外的发现！_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"危险的气息越来越重了，要马上找到那个孩子……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[341] =        ---黑暗，意外的发现！_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"被这小子看到了！",
                  name = _t"未知的声音一",
                  img = "res\\portrait\\",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"如果计划被破坏，那位大人会杀了我们的。不能让这孩子说出去！",
                  name = _t"未知的声音二",
                  img = "res\\portrait\\",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"谁？！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"糟糕，来人了，撤！",
                  name = _t"未知的声音一",
                  img = "res\\portrait\\",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"等我先解决这小子！（挥拳声）",
                  name = _t"未知的声音二",
                  img = "res\\portrait\\",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [6] = {
                  txt = _t"啊！（小孩子的尖叫声）",
                  name = _t"小男孩",
                  img = "res\\portrait\\富士山普通居民小孩.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[343] =        ---再遇天马_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"终于找到你们了！天翼，没事吧？",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[348] =        ---不可磨灭之记忆--仙女_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"这个孩子的身体是属于那位大人的。",
                  name = _t"幼年潘多拉",
                  img = "res\\portrait\\潘多拉幼年抱哈迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"不！绝不会把瞬交给你！",
                  name = _t"一辉",
                  img = "res\\portrait\\一辉幼年抱着瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"放手，不然……",
                  name = _t"幼年潘多拉",
                  img = "res\\portrait\\潘多拉幼年抱哈迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[350] =        ---永远属于你_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"……唔！唔唔唔啊啊啊……！！",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[351] =        ---破坏幻象的方法_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"是那些扭曲空间兽！看来要先破坏它们维系的扭曲空间力场。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[353] =        ---不可磨灭之记忆--天马_银河竞技场
{
     delay = 2000,
     [1] = {
                  txt = _t"姐姐，不要走！",
                  name = _t"星矢",
                  img = "res\\portrait\\幼年星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"星矢，你一定要找到我！",
                  name = _t"星华",
                  img = "res\\portrait\\幼年星华.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[360] =        ---阴森之宅_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"就是这个人吗？",
                  name = _t"未知的声音",
                  img = "res\\portrait\\",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"对，很有趣吧。",
                  name = _t"另两个声音",
                  img = "res\\portrait\\",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"确实有不寻常的感觉。就让我司掌王和英雄的辉煌之梦来会会他/她吧。",
                  name = _t"未知的声音",
                  img = "res\\portrait\\",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"（不怀好意的笑声。）",
                  name = _t"另两个声音",
                  img = "res\\portrait\\",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"谁？！我好像听到了……人说话的声音。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[362] =        ---黑暗的踪迹（二）_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"前面是教皇大人？教皇大人居然亲自来了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[363] =        ---陷阱，已经布下？_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"他临死前说的话什么意思，难道……（惊觉）难道我陷入了跟瞬和星矢一样的幻境中……？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[366] =        ---脱困，自杀之森！_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"前面有一个村子……终于走出那片诡异的树海了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[367] =        ---师徒，光明与黑暗_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"这里，就是那三位圣斗士安眠的地方……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[368] =        ---师徒，光明与黑暗_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"不好了，雾隐老师他——",
                  name = _t"鹿香",
                  img = "res\\portrait\\圣域圣斗士女学员艾亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[370] =        ---危急，执着的师父！_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"啊……（重击倒地）",
                  name = _t"雾隐",
                  img = "res\\portrait\\圣域老年助祭司.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"黑暗天龙！居然对自己老师也下了毒手！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[375] =        ---迷踪_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"我感觉到了瞬和星矢残留的小宇宙。看来他们已经经过这里了。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[189] =        ---黑暗之力_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"（奸笑声）嘻嘻嘻——",
                  name = _t"黑暗大力士",
                  img = "res\\portrait\\黑暗杂兵2.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"滚石朝这边来了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[376] =        ---黑影之中？_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"似乎有什么人……不，这种感觉不像被人注视。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[377] =        ---黑影之中？_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"不会错的，的确有什么在暗处……我要告诉冰河小心些。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[378] =        ---对战，黑暗天龙_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"有人封住了我的攻击！谁？！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[380] =        ---意外的敌人？_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"怎么到现在还没动手，冰河？",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\莎尔娜.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"……",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"你难道要违背教皇的命令吗？杀了他们！",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\莎尔娜.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"……",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"白银圣斗士，蛇夫座的莎尔娜！她为什么在这里？！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[385] =        ---为了爱与正义！_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"哼，抓到了一只耗子。",
                  name = _t"索恩斯",
                  img = "res\\portrait\\狮子座考验大壮男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[393] =        ---黑暗的防御_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"等候多时了！",
                  name = _t"黑暗仙女",
                  img = "res\\portrait\\黑暗仙女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[397] =        ---黑暗的霜冻_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"让我来会会你吧！",
                  name = _t"黑暗白鸟",
                  img = "res\\portrait\\黑暗白鸟座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[400] =        ---黑暗的流星_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"这里就是你的葬身之地！",
                  name = _t"黑暗天马",
                  img = "res\\portrait\\黑暗天马座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[401] =        ---十风穴，决战之地_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"你终于来了。",
                  name = _t"星矢",
                  img = "res\\portrait\\星矢圣域便装版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"太好了，伙伴们都陆陆续续赶到了。",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[213] =        ---战友，再次集结_银河竞技场
{
     delay = 2000,
     [1] = {
                  txt = _t"赶上了，耶！",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 500,
           },
     [2] = {
                  txt = _t"谁？！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[402] =        ---重生，天马圣衣！_银河竞技场
{
     delay = 2000,
     [1] = {
                  txt = _t"呀——呵！！！",
                  name = _t"星矢",
                  img = "res\\portrait\\星矢圣域便装版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[404] =        ---一起战斗吧，伙伴们_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"伙伴们，我来了！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 500,
           },
     [2] = {
                  txt = _t"是冰河！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[407] =        ---背叛者的下场_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"为什么魔铃一脸冷峻的出现在这里？难道星矢真的……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[408] =        ---圣斗士之墓！！_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"不，这不是真的！冰河！星矢！瞬！紫龙！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[409] =        ---生或死_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"这是——黑暗天马！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[410] =        ---生或死_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"黑暗白鸟！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[411] =        ---生或死_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"黑暗天龙！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[412] =        ---生或死_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"黑暗仙女！——死的是黑暗四天王，冰河他们还活着！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[415] =        ---倒吊者_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"葬身大海吧，魔铃！",
                  name = _t"摩西斯",
                  img = "res\\portrait\\白银白鲸座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"魔铃有危险！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[224] =        ---天马来到_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"魔铃，我来救你！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[420] =        ---乌鸦，不祥之音_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"他他他他……他们居然跳了下去！",
                  name = _t"加米安",
                  img = "res\\portrait\\白银乌鸦座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[521] =        ---女神的小宇宙？_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"什……什么！原本如同我手足一般的乌鸦居然因为这个小妞而反过来攻击我？！",
                  name = _t"加米安",
                  img = "res\\portrait\\白银乌鸦座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[423] =        ---昏迷的天马 _银河竞技场
{
     delay = 1000,
     [1] = {
                  txt = _t"（昏迷中）唔……",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 500,
           },
     [2] = {
                  txt = _t"看来星矢伤势严重，一时间无法醒来。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[426] =        ---白银，制裁者！_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"还有谁敢越过这条线？！越线者死！",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"是一辉！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4343] =        ---宇宙的共鸣_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"我奉教皇之命取回黄金圣衣",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"黄金圣斗士，狮子座的艾欧里亚！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1401] =        ---射手座黄金圣衣？_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"让他进来。",
                  name = _t"城户纱织",
                  img = "res\\portrait\\城户纱织.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[194] =        ---逃脱的契机_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"可恶，被他跑了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1305] =        ---仙女座瞬_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"那就是仙女座的瞬？真是个漂亮的人！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[107] =        ---住手！卡西欧士_新手村
{
     delay = 3000,
     [1] = {
                  txt = _t"糟糕！我们快去看看！",
                  name = _t"星矢",
                  img = "res\\portrait\\星矢圣域便装版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1206] =        ---邪武传记02_环任务
{
     delay = 5000,
     [1] = {
                  txt = _t"难道邪武对雅典娜大人怀有特殊的感情么……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1295] =        ---邪武传记04_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"该死，周围全是怪物，不能这样贸然前进，先把这些怪物清理掉。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1296] =        ---邪武传记04_环任务
{
     delay = 5000,
     [1] = {
                  txt = _t"能感觉到邪武的小宇宙，就在前面不远处。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1209] =        ---邪武传记05_环任务
{
     delay = 5000,
     [1] = {
                  txt = _t"没有用的，他会永远陪在我的身边，你就死了心吧。我现在心情不错，如果你能乖乖离开就暂且饶你一命。",
                  name = _t"树海梦灵",
                  img = "res\\portrait\\冥界杂兵近战瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"开什么玩笑，我怎么能抛下战友离开。看来只有打败你，邪武才能醒过来。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1112] =        ---白日之梦_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"好了，我们快去村子里吧。我开始有些担心了！",
                  name = _t"阿良",
                  img = "res\\portrait\\庐山村民男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1535] =        ---纱织的日记_纱织的别墅
{
     delay = 8000,
     [1] = {
                  txt = _t"今天，我很开心，他回来了，带着他的圣衣！可是他一回来就顶撞我，最终我答应帮他找到他的姐姐，代价是他参加我举办的银河竞技赛……",
                  name = _t"城户纱织",
                  img = "res\\portrait\\圣斗士_雅典娜.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[624] =        ---线索_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"啊啊啊，我的皮包丢了！！！",
                  name = _t"被盗的观众",
                  img = "res\\portrait\\富士山普通居民男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"找到了，应该就是他！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[37] =        ---_三环双鱼宫
{
     delay = 3000,
     [1] = {
                  txt = _t"就让你们见识一下仙王座最强之铁索防御吧！",
                  name = _t"仙王座白银圣斗士",
                  img = "res\\portrait\\白银圣斗士仙皇座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"蛮力在我的面前是毫无作用的！",
                  name = _t"仙王座白银圣斗士",
                  img = "res\\portrait\\白银圣斗士仙皇座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
} 
DialogStrategy[38] =        ---_银河战争
{
     delay = 4000,
     [1] = {
                  txt = _t"教皇大人，我一定会带着黄金圣衣回圣域的！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[39] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"我要将你的脑袋也砍下来，跟其他的脑袋落成一摞。",
                  name = _t"卡西欧士",
                  img = "res\\portrait\\卡西欧士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[40] =        ---_个人挑战
{
     delay = 3000,
     [1] = {
                  txt = _t"哇哈哈哈，我倒要看看你能往哪里跑？",
                  name = _t"卡西欧士",
                  img = "res\\portrait\\卡西欧士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[41] =        ---_个人挑战
{
     delay = 3000,
     [1] = {
                  txt = _t"尝尝卡西欧士的死亡重拳！",
                  name = _t"卡西欧士",
                  img = "res\\portrait\\卡西欧士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[42] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"没人能够战胜我！我最终将得到圣衣，青铜，白银，然后是黄金圣衣！",
                  name = _t"艾德",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[43] =        ---_个人挑战
{
     delay = 5001,
     [1] = {
                  txt = _t"痛苦，那些痛苦！你也尝尝我所经历的痛苦啊！！！",
                  name = _t"艾德",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[44] =        ---_个人挑战
{
     delay = 5002,
     [1] = {
                  txt = _t"这一拳！只要这一拳击中！我就可以将你杀死你！",
                  name = _t"艾德",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[45] =        ---_个人挑战
{
     delay = 5003,
     [1] = {
                  txt = _t"居然真有人能活着来准备挑战这里！？",
                  name = _t"天马星魂",
                  img = "res\\portrait\\初代天马英灵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[46] =        ---_个人挑战
{
     delay = 5004,
     [1] = {
                  txt = _t"面前的一切都将消失！天马流星拳！",
                  name = _t"天马星魂",
                  img = "res\\portrait\\初代天马英灵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[47] =        ---_个人挑战
{
     delay = 5005,
     [1] = {
                  txt = _t"星魂闪！天马的骄傲！进攻！",
                  name = _t"天马星魂",
                  img = "res\\portrait\\初代天马英灵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[48] =        ---_个人挑战
{
     delay = 5006,
     [1] = {
                  txt = _t"食物，终于送食物来了！",
                  name = _t"地狱三头犬",
                  img = "res\\portrait\\圣域地狱三头犬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[49] =        ---_个人挑战
{
     delay = 5007,
     [1] = {
                  txt = _t"我要吃掉你，吃掉你！！！",
                  name = _t"地狱三头犬",
                  img = "res\\portrait\\圣域地狱三头犬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[50] =        ---_个人挑战
{
     delay = 5008,
     [1] = {
                  txt = _t"你把我惹怒了，我一定要吃了你，吃了你！！！",
                  name = _t"地狱三头犬",
                  img = "res\\portrait\\圣域地狱三头犬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[51] =        ---_个人挑战
{
     delay = 5009,
     [1] = {
                  txt = _t"我的宝贝们，玩具来了！",
                  name = _t"加米安",
                  img = "res\\portrait\\白银乌鸦座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[52] =        ---_个人挑战
{
     delay = 5010,
     [1] = {
                  txt = _t"黑色尖啸！陷入无尽的痛苦之中！！！",
                  name = _t"加米安",
                  img = "res\\portrait\\白银乌鸦座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[53] =        ---_个人挑战
{
     delay = 5011,
     [1] = {
                  txt = _t"宝贝们，帮我消灭他！！！",
                  name = _t"加米安",
                  img = "res\\portrait\\白银乌鸦座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[54] =        ---_个人挑战
{
     delay = 5012,
     [1] = {
                  txt = _t"你变成一尊石像或许会好看一点！",
                  name = _t"白银英仙座",
                  img = "res\\portrait\\白银圣斗士英仙座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[55] =        ---_个人挑战
{
     delay = 4000,
     [1] = {
                  txt = _t"绝命盾击——倒！",
                  name = _t"白银英仙座",
                  img = "res\\portrait\\白银圣斗士英仙座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[56] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"全部石化吧！美杜莎之盾！！！",
                  name = _t"白银英仙座",
                  img = "res\\portrait\\白银圣斗士英仙座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[876] =        ---_紫龙与雷虎
{
     delay = 4000,
     [1] = {
                  txt = _t"不愧是紫龙，竟然挥出了庐山升龙霸！我雷虎正式向你提出决斗！",
                  name = _t"雷虎",
                  img = "res\\portrait\\庐山雷虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"听我说，雷虎，我也不知道刚才是怎么回事，只是一心想救出春丽。",
                  name = _t"紫龙",
                  img = "res\\portrait\\紫龙裸衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"别啰嗦了，迎战吧！",
                  name = _t"雷虎",
                  img = "res\\portrait\\庐山雷虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[58] =        ---_紫龙与雷虎
{
     delay = 2500,
     [1] = {
                  txt = _t"紫龙，你还不出手吗？",
                  name = _t"雷虎",
                  img = "res\\portrait\\庐山雷虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"我绝不会还手的！",
                  name = _t"紫龙",
                  img = "res\\portrait\\紫龙裸衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"哼！",
                  name = _t"雷虎",
                  img = "res\\portrait\\庐山雷虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[59] =        ---_紫龙与雷虎
{
     delay = 3000,
     [1] = {
                  txt = _t"让我看看你的真正实力吧，紫龙！",
                  name = _t"雷虎",
                  img = "res\\portrait\\庐山雷虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"想不到雷虎的力量竟然这么强大……",
                  name = _t"紫龙",
                  img = "res\\portrait\\紫龙裸衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[60] =        ---_紫龙与雷虎
{
     delay = 3000,
     [1] = {
                  txt = _t"可恶，我倒要看看你能坚持多久！",
                  name = _t"雷虎",
                  img = "res\\portrait\\庐山雷虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"好强，这样下去我会被杀死的！",
                  name = _t"紫龙",
                  img = "res\\portrait\\紫龙裸衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1137] =        ---光明！紫龙的希望_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"可惜只找到这些，先把这些书页合订起来吧，希望对春丽有些帮助。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[878] =        ---_紫龙与雷虎
{
     delay = 3000,
     [1] = {
                  txt = _t"雷虎，你的招式虽然厉害，但仍然有空隙。",
                  name = _t"紫龙",
                  img = "res\\portrait\\紫龙裸衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"空隙？少说笑了，接招吧！",
                  name = _t"雷虎",
                  img = "res\\portrait\\庐山雷虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[62] =        ---_紫龙与雷虎
{
     delay = 3000,
     [1] = {
                  txt = _t"就是那团黄光！雷虎招式的破绽！",
                  name = _t"紫龙",
                  img = "res\\portrait\\紫龙裸衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1037] =        ---心之宁静_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"哼，区区青铜圣斗士，你以为你们能够逃出我的手掌心！",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座迪斯马斯克.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"乖乖的交出雅典娜之泪，我可以让你们死得痛快点。",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座迪斯马斯克.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1434] =        ---圣域追击者_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"抓住他，他和紫龙一样都是圣域的叛徒！",
                  name = _t"圣域追击者",
                  img = "res\\portrait\\圣域杂兵壮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"可恶！这是圣域追击者，紫龙一定遇到了危险！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1116] =        ---黄金侍从_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"不知道春丽和李云有没有安全的回到茅屋。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1142] =        ---悲伤的抉择_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"到现在还没找到李云，难道他不在候补生这里？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1143] =        ---悲伤的抉择_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"李云！！怎会这样！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"杀了我！快杀了我！如果你是我的朋友，就杀死我。",
                  name = _t"李云",
                  img = "res\\portrait\\庐山学员男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"啊——",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1438] =        ---不死的力量_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"雷虎！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[857] =        ---神龙碑的启示_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"命运的斗士，这是最后的考验！打败我，或者让我将你变成庐山上的英灵！",
                  name = _t"神秘英灵",
                  img = "res\\portrait\\圣斗士英灵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1098] =        ---幻象之门_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"迪斯马斯克！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1145] =        ---命运的考验_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"春丽！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[799] =        ---强大的战士？_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"走吧，我要让那些人看看我的厉害！",
                  name = _t"啸风",
                  img = "res\\portrait\\庐山村民男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [2] = {
                  txt = _t"老虎不发威，真当我是病猫了还！",
                  name = _t"啸风",
                  img = "res\\portrait\\庐山村民男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [3] = {
                  txt = _t"我们到了吗？你怎么停下了？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 10000,
           },
     [4] = {
                  txt = _t"呃……怎……怎么这么多人……",
                  name = _t"啸风",
                  img = "res\\portrait\\庐山村民男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [5] = {
                  txt = _t"哎呀，我腰疼的厉害，还是不陪你去见紫龙了。他就在梯田尽头的茅屋里面，我先走了。",
                  name = _t"啸风",
                  img = "res\\portrait\\庐山村民男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1439] =        ---强大的战士？_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"哈哈哈，紫龙，你现在不过是个瞎子，还想保护那些村民？还是先照顾好自己吧！",
                  name = _t"圣域追击者",
                  img = "res\\portrait\\狮子考验者瘦小男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"紫龙！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[7010] =        ---复明药_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"好了，现在把你的小宇宙的力量输入药中。你一定要控制好自己的力量，能不能治好紫龙的眼睛就靠你了！",
                  name = _t"李云",
                  img = "res\\portrait\\庐山学员男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1140] =        ---圣域密探_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"看样子是昏了过去，先回去找李云想想办法，一定要弄清楚毒源在哪里。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1441] =        ---幻眠花_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"哼，你说的什么我根本不知道，拿朵花来想吓唬大爷吗！",
                  name = _t"圣域密探",
                  img = "res\\portrait\\杂兵壮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1442] =        ---幻眠花_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"咦，我的头怎么晕晕的？不对，这到底是什么花？你怎么变成了两个人？",
                  name = _t"圣域密探",
                  img = "res\\portrait\\杂兵壮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1443] =        ---幻眠花_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"呼……呼呼……呼呼呼……",
                  name = _t"圣域密探",
                  img = "res\\portrait\\杂兵壮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1444] =        ---幻眠花_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"迪斯马斯克大人！您想知道村民们中的毒？大人您忘了吗？他们正是中了大人的积尸气才变成了这样的！",
                  name = _t"圣域密探",
                  img = "res\\portrait\\杂兵壮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这些蠢货喝了混有大人积尸气的水……嘿嘿，他们和圣域的叛徒紫龙有些关系，我们正好可以利用……",
                  name = _t"圣域密探",
                  img = "res\\portrait\\杂兵壮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2077] =        ---破坏幻象的方法_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"（痛苦的声音）啊啊啊啊啊————",
                  name = _t"幼年潘多拉",
                  img = "res\\portrait\\潘多拉幼年抱哈迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"生效了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1452] =        ---灵魂守护_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"很好，你已经通过了考验，现在到我这里来。",
                  name = _t"神秘英灵",
                  img = "res\\portrait\\圣斗士英灵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[413] =        ---魔铃危急_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"这个臭蜥蜴就交给我！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"星矢！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1099] =        ---幻象之门_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"不要被迷惑，他只不过是你心中的幻象。如果不能看破这一切，受伤的只会是自己。",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1403] =        ---阿鲁迪巴传记02_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"小妹妹就跟我们一起去修炼吧，我们可是村里最强的人了。",
                  name = _t"堕落修炼者",
                  img = "res\\portrait\\圣斗士男学员少年艾德异化.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"不要碰我！救命啊！",
                  name = _t"谜之少女",
                  img = "res\\portrait\\庐山小女孩.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"你们这群无赖，没看出人家不愿意吗！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [4] = {
                  txt = _t"多管闲事，兄弟们给我上，让这个家伙先陪咱们玩玩！",
                  name = _t"堕落修炼者",
                  img = "res\\portrait\\圣斗士男学员少年艾德异化.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1233] =        ---阿鲁迪巴传记02_环任务
{
     delay = 3000,
     [1] = {
                  txt = _t"村边的小混混给我出来，怎么见到我来了就吓得躲起来了么！",
                  name = _t"翔",
                  img = "res\\portrait\\黑暗杂兵1.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1234] =        ---阿鲁迪巴传记03_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"咦？还有一个没有跑，没来的及逃跑么？让你尝尝我的厉害！",
                  name = _t"翔",
                  img = "res\\portrait\\黑暗杂兵1.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1407] =        ---阿鲁迪巴传记06_环任务
{
     delay = 3000,
     [1] = {
                  txt = _t"等一等，前面的人等一等。",
                  name = _t"谜之少女",
                  img = "res\\portrait\\庐山小女孩.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1420] =        ---美穗传记03_环任务
{
     delay = 6000,
     [1] = {
                  txt = _t"美穗不好了，孤儿达野离家出走了，刚刚得到消息他好像进入了树海。",
                  name = _t"星之子员工",
                  img = "res\\portrait\\古拉杜财团雇员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1422] =        ---美穗传记04_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"你们这些黑暗的势力倘若对那孩子动一根手指，我就让你们血债血偿！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1229] =        ---美穗传记05_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"美穗老师，你在哪里……",
                  name = _t"达野",
                  img = "res\\portrait\\希腊小男孩新版主角.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"快走！这个家伙由我来抵挡！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1462] =        ---穆传记02_环任务
{
     delay = 6000,
     [1] = {
                  txt = _t"穆先生，童虎老师让我传话，说有一名身份未知的白银圣斗士进入了庐山。",
                  name = _t"庐山学员",
                  img = "res\\portrait\\庐山学员男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"白银圣斗士来到庐山，穆先生就由我先去打探一下。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1464] =        ---穆传记03_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"哪里来的这么多乌鸦，竟然阻挠我的前进。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1466] =        ---穆传记06_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"修复圣衣需要你捐出身上二分之一的鲜血才能修复成功。",
                  name = _t"穆",
                  img = "res\\portrait\\黄金圣斗士白羊座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"二分之一，普通人流失三分之一的鲜血就会危及生命，你不会是为了替那个小鬼报仇想害死我吧。别说是二分之一，就是一滴血我也不会修！",
                  name = _t"乌鸦座",
                  img = "res\\portrait\\白银乌鸦座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1413] =        ---檄传记02_环任务
{
     delay = 6000,
     [1] = {
                  txt = _t"檄哥哥，原来你在这里，希望你能传授我格斗技。",
                  name = _t"孤儿",
                  img = "res\\portrait\\圣域高级区村民孩童.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"看来这位小朋友有事情要找我，如果没有重要的事情我就先去陪他了。",
                  name = _t"檄",
                  img = "res\\portrait\\青铜圣斗士大熊座檄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1415] =        ---檄传记03_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"这些可恶的黑暗圣斗士，留在附近迟早是个隐患，先把他们解决掉。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1416] =        ---檄传记03_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"那边感觉到了檄的小宇宙。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1223] =        ---檄传记05_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"不好了，美穗老师和一名孤儿被那些穿着黑色盔甲的家伙包围了。",
                  name = _t"星之子员工",
                  img = "res\\portrait\\古拉杜财团雇员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1418] =        ---檄传记05_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"美穗老师，不要怕，我会像勇敢的男子汉保护你的。",
                  name = _t"孤儿",
                  img = "res\\portrait\\圣域高级区村民孩童.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1419] =        ---檄传记05_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"檄保护好他们两个，其他的对手让我来处理。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1223] =        ---檄传记05_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"檄哥哥我找到了学习格斗技的理由。",
                  name = _t"孤儿",
                  img = "res\\portrait\\圣域高级区村民孩童.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"你个小家伙又在想什么鬼主意。",
                  name = _t"檄",
                  img = "res\\portrait\\青铜圣斗士大熊座檄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"不是的，现在星矢哥哥和檄哥哥很少待在学园里，所以就由我来保护美穗老师吧。",
                  name = _t"孤儿",
                  img = "res\\portrait\\圣域高级区村民孩童.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [4] = {
                  txt = _t"哈哈，好吧，不过要等你再长大一些。",
                  name = _t"檄",
                  img = "res\\portrait\\青铜圣斗士大熊座檄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1245] =        ---童虎传记02_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"老师的这些考验应该包含着某种特别的深意，我要努力完成。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1472] =        ---黑暗天龙传记01_环任务
{
     delay = 6000,
     [1] = {
                  txt = _t"那边的青年等一下，也许我可以解答你心中的疑问。只是这里说话有些不便，不如借个地方说话如何？",
                  name = _t"陌生青年",
                  img = "res\\portrait\\黑暗杂兵1.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1240] =        ---黑暗天龙传记02_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"杀，杀死所有的人……",
                  name = _t"乐平",
                  img = "res\\portrait\\黑暗杂兵1.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1243] =        ---黑暗天龙传记05_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"我的好徒儿你竟然又回来看为师了，不枉为师当年你对你的一番调教。",
                  name = _t"黑暗老人",
                  img = "res\\portrait\\庐山神秘怪人.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"你这个杀人魔王，都是因为你吼和哮才变成了黑暗圣斗士，最后惨死，我绝不会饶恕你！",
                  name = _t"乐平",
                  img = "res\\portrait\\黑暗杂兵1.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"我一生中就收了两个徒弟，结果都背叛了我。当初若是你听命于我说不定早就成为了皇后岛的霸主，而他也能报被强戈暗算之仇。",
                  name = _t"黑暗老人",
                  img = "res\\portrait\\庐山神秘怪人.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1455] =        ---市传记02_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"……",
                  name = _t"市",
                  img = "res\\portrait\\青铜圣斗士水蛇座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1456] =        ---市传记03_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"感觉到市的小宇宙去往了树海的方向，问问蛮有没有注意到他。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1457] =        ---市传记04_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"救命！谁来帮帮我！",
                  name = _t"市",
                  img = "res\\portrait\\青铜圣斗士水蛇座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"糟糕，是市的声音。可是周围全是怪物，赶紧处理掉去救市。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1458] =        ---市传记04_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"市似乎刚刚在这附近逗留过。那边的地上似乎留下了什么线索。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1459] =        ---市传记04_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"这好像是市的东西。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1216] =        ---市传记05_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"可恶，就用我的拳头来让你清醒一下。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1460] =        ---市传记05_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"我竟然没有识破这些梦灵的伪装，那真正的市到底在什么地方？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1087] =        ---星矢传记02_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"这是……残留的小宇宙？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"强烈的冲击力，似乎想要迸发出无尽的力量，而且还能感觉到一股炙热的信念，似乎是在……保护什么……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"看来不释放小宇宙是不会弄明白的。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1083] =        ---星矢传记03_环任务
{
     delay = 6000,
     [1] = {
                  txt = _t"魔铃，星矢弄出的那一片遗迹到底是怎么回事？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"那件事稍后再说，村落那边刚刚被古代巨狼袭击了，你先去保护村民，不过不要轻举妄动，我去请求支援稍后就到。有什么疑问可以问下这位叫维比娅的少女。",
                  name = _t"魔铃",
                  img = "res\\portrait\\魔铃.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1085] =        ---星矢传记04_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"喂，你应该是圣斗士吧。为什么星矢哥哥没有来？",
                  name = _t"小男孩",
                  img = "res\\portrait\\希腊小男孩.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1073] =        ---星矢传记06_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"我和你说过不要轻举妄动，鲁莽方面简直就和星矢那小子一样。",
                  name = _t"魔铃",
                  img = "res\\portrait\\魔铃.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1078] =        ---卡西欧士传记05_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"卡西欧士不好了，莎尔娜在执行任务的时候被命运斗士困在失落森林。",
                  name = _t"马卡",
                  img = "res\\portrait\\圣斗士男学员3.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"不会是因为我的事情而掉以轻心，必须要快点赶过去。",
                  name = _t"卡西欧士",
                  img = "res\\portrait\\卡西欧士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1476] =        ---魔铃传记02_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"这些斗篷怪人为什么会袭击我，难道是因为那封艾欧里亚的信？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1477] =        ---魔铃传记03_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"难道魔铃的朋友其实是那只鹰？不如试一下那个徽章。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1399] =        ---心诚则灵_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"春丽你看，那是李云。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[813] =        ---紫龙的决意_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"紫龙，请等一等！我知道没有办法阻止你们的比试，可是请等一等，一定要先治好你的眼睛。",
                  name = _t"春丽",
                  img = "res\\portrait\\春丽.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"春丽，你不用安慰我了，我的眼睛已经……",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不，我已经找到了足够的草药，你等一等，我现在就去拿……",
                  name = _t"春丽",
                  img = "res\\portrait\\春丽.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"紫龙，无论如何这毕竟是春丽的希望。你就试试吧！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"我现在就去找春丽！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1052] =        ---雷虎的牺牲_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"哼，想要救雷虎。就带着雅典娜之泪到圣战遗址来！",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座迪斯马斯克.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"迪斯马斯克，没想到你身为黄金圣斗士居然背后偷袭！",
                  name = _t"童虎",
                  img = "res\\portrait\\童虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"老师！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1047] =        ---雷虎没死？_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"哈哈哈，蠢货，让你尝尝这些复活圣斗士的厉害吧。",
                  name = _t"雷虎",
                  img = "res\\portrait\\庐山雷虎变异.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1319] =        ---三年之约（四）_
{
     delay = 8000,
     [1] = {
                  txt = _t"没有青岚所说的人，不如去问问旁边那个老丈是否知道白露去了哪里。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1548] =        ---莎尔娜02_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"你怎么会出现在这里？",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\沙尔拉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"我听到一些有恶徒假扮成你的样子的传言。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"确实是这样，但是这是我自己的事情。",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\沙尔拉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1549] =        ---莎尔娜03_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"莎尔娜似那家伙似乎很生气，还丢下了什么东西，糟糕，被那个可疑的家伙捡到了。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [2] = {
                  txt = _t"喂，把你刚刚捡到的东西交出来！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [3] = {
                  txt = _t"我奉圣域之命在这里巡逻，我所得到的东西都要交回圣域，你难道要违抗圣域的命令！",
                  name = _t"渗透者",
                  img = "res\\portrait\\圣域杂兵远程2.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [4] = {
                  txt = _t"看来只好从她手里硬抢了，记得手里还有些烟雾弹，正好派上用场。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1550] =        ---莎尔娜03_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"没想到这是一封写给莎尔娜的情书，似乎感觉和这个案件有某种联系。按照信上的地址先去找找看。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1197] =        ---莎尔娜05_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"大胆狂徒竟然扮作圣斗士的模样招摇撞骗，看招！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1551] =        ---莎尔娜06_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"呼……没想到这一切都是你搞的鬼。",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\沙尔拉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"哈哈，将你引到这里我可是费了不少的功夫，这里就是你的坟墓！",
                  name = _t"前圣域队长",
                  img = "res\\portrait\\圣域杂兵壮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"这次可不会让你跑掉了，你这个罪大恶极的家伙！",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\沙尔拉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[63] =        ---_紫龙与雷虎
{
     delay = 3000,
     [1] = {
                  txt = _t"紫龙，你动作太慢了，我已经赢了，哈哈！",
                  name = _t"雷虎",
                  img = "res\\portrait\\庐山雷虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[64] =        ---_紫龙与雷虎
{
     delay = 3000,
     [1] = {
                  txt = _t"杀死紫龙！",
                  name = _t"强盗头目",
                  img = "res\\portrait\\庐山强盗强壮男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1667] =        ---奥路菲01-2_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"救救我，好痛苦…… ",
                  name = _t"神秘的声音",
                  img = "res\\portrait\\默认.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"是谁！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1202] =        ---奥路菲04_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"黑色的光芒从你的眉心射出，你已经被邪恶的力量蛊惑成为了它的奴隶。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1202] =        ---奥路菲04_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"不好，结界似乎受到了冲击眼看就要破碎了。当年连黄金都制服不了的邪恶神灵难道就这样重现人间了么。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1204] =        ---奥路菲06_环任务
{
     delay = 4000,
     [1] = {
                  txt = _t"我感到一股强大的小宇宙，这是黄金圣斗士才会有的小宇宙！！！去看一下。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[756] =        ---无法说出的爱_庐山
{
     delay = 2000,
     [1] = {
                  txt = _t"哎呀——",
                  name = _t"少女苏芳",
                  img = "res\\portrait\\庐山少女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[757] =        ---无法说出的爱_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"虽然她这样说，但是无论如何还是觉得无法放心，还是跟上去看看吧。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1555] =        ---黑暗天龙的秘密（二）_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"岩石中镶嵌了一排深深的脚印。虽然纷杂，但依稀可以辨认出，似乎不止有两个人在这里训练过。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1658] =        ---一定要守护你4_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"糟糕，他们被那些古拉杜财团警卫包围了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1553] =        ---男子汉的约定一_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"独角兽圣衣！邪武一定在前面",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1599] =        ---男子汉的约定五_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"啊啊啊啊！我一定会打败你们的！！",
                  name = _t"邪武",
                  img = "res\\portrait\\青铜圣斗士独角兽座邪武.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[274] =        ---无法触碰的爱（二）_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"哼，这小子果然在这里！死心吧，梦神大人不会放过你的！",
                  name = _t"邪恶守卫",
                  img = "res\\portrait\\黑暗杂兵2.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[275] =        ---无法触碰的爱（三）_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"不要难过……莹……我会一直在你身边……一直在你身边……",
                  name = _t"细小的声音",
                  img = "res\\portrait\\",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"这……这些萤火虫……是银，是他……",
                  name = _t"莹",
                  img = "res\\portrait\\富士山美惠.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[65] =        ---_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"嗯？这些青铜圣斗士居然真的敢来这里！那就让他们葬身在此吧！",
                  name = _t"黑暗圣斗士",
                  img = "res\\portrait\\黑暗杂兵1.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[685] =        ---十风穴的最后决战_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"别得……意……黑暗天龙阁下和他的幻影一定会收拾掉……你……们……",
                  name = _t"黑暗圣斗士",
                  img = "res\\portrait\\皇后岛黑暗圣斗士近程.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1612] =        ---谜团，突如其来的敌人（一）_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"嘿嘿，想去找医生？只怕你们没有这个时间。",
                  name = _t"暗杀者",
                  img = "res\\portrait\\圣域杂兵瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"小心，他们来了……",
                  name = _t"师父",
                  img = "res\\portrait\\狮子考验者瘦小男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1616] =        ---解救昏迷的先知（四）_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"你要按照我的吩咐把药放进去，现在把草药放进去。",
                  name = _t"医生",
                  img = "res\\portrait\\男子头像1.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1736] =        ---谜团，来自圣域的杀手_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"杀死他们，那位大人有令，决不能让他们活着。",
                  name = _t"黑衣追杀者",
                  img = "res\\portrait\\默认.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"可恶，他们又追上来了。",
                  name = _t"先知",
                  img = "res\\portrait\\格劳刻（失明老头）.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1621] =        ---惊变！被掳走的先知_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"不好，先知大人，小心……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"可恶，我绝不会让你们伤害先知大人！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1740] =        ---惊变！被掳走的先知_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"找到了！先知在这里！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1623] =        ---解救被困的先知_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"无知的人，看来你还不知道青木原树海的恐怖。陷入青木原的幻境吧，我会把你们全部杀死！",
                  name = _t"黑色身影",
                  img = "res\\portrait\\嘉米尔纷争法师3.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1624] =        ---暂时脱险，突然到来的村民_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"等等，不要碰他！你这样做只会害了他！",
                  name = _t"铃之村村民",
                  img = "res\\portrait\\默认.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1744] =        ---上当！背后袭来的敌人_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"什么人！出来！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"嘿嘿，我们已经在这里等你很久了，这次绝不会让你逃跑。",
                  name = _t"斗篷人",
                  img = "res\\portrait\\嘉米尔纷争法师3.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1745] =        ---上当！背后袭来的敌人_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"呃……就算你打败我们也没有用，先知还在我们手中，他绝对会被杀死！",
                  name = _t"斗篷人",
                  img = "res\\portrait\\嘉米尔纷争法师3.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"不好，先知大人！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1626] =        ---身穿黄金圣衣的人_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"哼，一群没用的东西，想不到还要我亲自动手！",
                  name = _t"黄金幻影",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1748] =        ---解救朋友，真挚的云光_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"枫！",
                  name = _t"云光",
                  img = "res\\portrait\\庐山学员男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"云光小心，他……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1638] =        ---俯视群山的迅风_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"好快的速度！突然间就不见了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1751] =        ---俯视群山的迅风_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"他就在上面。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1752] =        ---俯视群山的迅风_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"走得真快，还要往上才行。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1753] =        ---俯视群山的迅风_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"在这！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1756] =        ---残酷决绝的胜利_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"你太软弱了，敌人就应该彻底毁灭。",
                  name = _t"迅风",
                  img = "res\\portrait\\庐山学员男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1757] =        ---解救焦急母亲_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"不好，她被蛇围住！，快把这些该死的蛇解决掉。",
                  name = _t"师父",
                  img = "res\\portrait\\狮子考验者瘦小男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1647] =        ---寻回失踪的女儿_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"师父去了这么久还没有回来，难道是……出了什么事情……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1648] =        ---突变！被掳走的母亲_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"咦，这是什么？就没……",
                  name = _t"谭晔",
                  img = "res\\portrait\\富士山普通居民女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"不好！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1760] =        ---突变！被掳走的母亲_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"师父！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1761] =        ---神龙的青睐_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"圣斗士，我感到你的血脉很奇怪，可以到我身边来吗？",
                  name = _t"神龙",
                  img = "res\\portrait\\默认.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"什么人？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1763] =        ---神龙之息，传往死亡之地_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"谭晔！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[90] =        ---开启黄泉之井_开启黄泉之井
{
     delay = 3000,
     [1] = {
                  txt = _t"哈哈！又来了个送死的！",
                  name = _t"冥界杂士兵",
                  img = "res\\portrait\\冥界杂兵近战瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[66] =        ---_
{
     delay = 5000,
     [1] = {
                  txt = _t"什么，吞噬了黑气的地狱三头犬变得更加强壮了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1610] =        ---与师父再会_
{
     delay = 3000,
     [1] = {
                  txt = _t"师父也来银河竞技场了？我得赶快去看看，也许他有什么急事。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[67] =        ---十风穴的最后决战_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"不错的观察力嘛，不过即便是识破我的伪装也不可能战胜我们黑暗天龙兄弟！！！受死吧！",
                  name = _t"黑暗伏龙",
                  img = "res\\portrait\\黑暗天龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1632] =        ---强大，为他人而战的云光_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"帮助庐山的村民！我也去看看吧，希望可以帮上什么忙。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[686] =        ---十风穴的最后决战_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"紫龙，你来送死了吗？",
                  name = _t"黑暗天龙",
                  img = "res\\portrait\\黑暗天龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[690] =        ---十风穴的最后决战_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"冰河！",
                  name = _t"一辉",
                  img = "res\\portrait\\凤凰座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2054] =        ---十风穴的最后决战_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"紫龙，冰河，瞬！一辉，你究竟做了什么！！！",
                  name = _t"星矢",
                  img = "res\\portrait\\天马.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[68] =        ---十风穴的最后决战_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"星矢，我不想再跟你们玩下去了，你们这些废物都给我去地狱报到吧！！！",
                  name = _t"一辉",
                  img = "res\\portrait\\凤凰座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"一辉的拳……不，瞬，紫龙，冰河……不！！！不要伤害我的同伴！！！",
                  name = _t"星矢",
                  img = "res\\portrait\\天马.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"一辉，一辉，一辉！！！你太过分了！！！",
                  name = _t"星矢",
                  img = "res\\portrait\\天马.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"拖着这种伤痕累累的身体你又能怎么样呢！",
                  name = _t"一辉",
                  img = "res\\portrait\\凤凰座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[684] =        ---十风穴的最后决战_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"这里到处都是黑暗圣斗士，想找到一辉只能先突破这里了。",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2060] =        ---十风穴的最后决战_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"这些烟尘是什么？气氛不对，我要警惕瞬所说的，隐藏在黑暗中的敌人。",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2066] =        ---激怒的独角兽！_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"住手，邪武！你难道不听我的话了吗？",
                  name = _t"城户纱织",
                  img = "res\\portrait\\城户纱织.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[69] =        ---_开启黄泉之井
{
     delay = 8000,
     [1] = {
                  txt = _t"过了这座桥就是黄泉之井了，分头行动吧，我们得快点找到奥路菲大人。",
                  name = _t"尤朵拉",
                  img = "res\\portrait\\圣斗士女学员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2076] =        ---追击！黑暗圣斗士_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"不知死活的家伙，让我来会会你！",
                  name = _t"黑暗凤凰",
                  img = "res\\portrait\\黑暗凤凰.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[347] =        ---凤凰的影子_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"消失了！难道真的是影子？！这件事要赶紧告诉瞬。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[148] =        ---自杀之森_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"星云锁链在动！",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[152] =        ---绝不放开你_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"出来吧，哈迪斯大人的侍从们！",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉幼年抱哈迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"是！",
                  name = _t"幽冥侍从",
                  img = "res\\portrait\\空壳的圣衣怪长枪盾牌男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[159] =        ---失散的姐弟_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"姐姐，不要走！",
                  name = _t"星矢",
                  img = "res\\portrait\\幼年星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[160] =        ---幻之火焰_银河竞技场
{
     delay = 5000,
     [1] = {
                  txt = _t"哪里来的火焰？！这是真实的还是幻境？……星矢应该知道！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[162] =        ---醒来吧，天马座_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"唔唔唔啊啊啊啊啊！！！",
                  name = _t"星矢",
                  img = "res\\portrait\\星矢圣域便装版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"糟了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[164] =        ---冥王麾下四梦神之二_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"（渐行渐远的声音）再见了，女神的圣斗士。",
                  name = _t"俄尼奥斯",
                  img = "res\\portrait\\扭曲空间兽.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[438] =        ---幽冥之路的祭礼_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"安眠吧，雾隐老师……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[191] =        ---黑影之中_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"我们分头去找黑暗天龙，一定能找到！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[196] =        ---真相，教皇命令的背后_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"呵呵呵，是你太天真了！",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\莎尔娜.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[383] =        ---为了爱与正义！_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"冰河，我先行一步，我们在十风穴等你！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"好！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2078] =        ---失败者的请罪_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"黑暗圣斗士经过的地方，居然还有牧民在？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[205] =        ---黑暗锁链_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"锁链化成了黑色的小蛇！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"黑暗锁链化成的小黑蛇会紧紧缠绕着你，直到你死的那一刻！ ",
                  name = _t"黑暗仙女",
                  img = "res\\portrait\\黑暗仙女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"没那么容易！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[395] =        ---黑暗的霜冻_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"在我暗黑冰壁的阻挡下，任何人都别想通过这里！",
                  name = _t"黑暗白鸟",
                  img = "res\\portrait\\黑暗白鸟座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"冰壁？别以为这样就能挡住我！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "surfaces\\res\\face\\是",
                  afterTime = 0,
           },
} 
DialogStrategy[70] =        ---_纱织的别墅
{
     delay = 5000,
     [1] = {
                  txt = _t"啊！我受伤了，小宇宙在我体内燃烧，苏醒吧，我的小宇宙！",
                  name = _t"城户纱织",
                  img = "res\\portrait\\圣斗士_雅典娜.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这就是女神的光辉，没有什么力量能再让我受到丝毫伤害；但是你们的表现令我心痛，我不会再给你额外奖励的！",
                  name = _t"城户纱织",
                  img = "res\\portrait\\圣斗士_雅典娜.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[71] =        ---_纱织的别墅
{
     delay = 5000,
     [1] = {
                  txt = _t"感谢你，我的勇士，我想我现在安全了，待会儿神秘祭司来了后，你可以去她那里领取我答应给你的额外奖励，快去吧！",
                  name = _t"城户纱织",
                  img = "res\\portrait\\圣斗士_雅典娜.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[396] =        ---黑暗的霜冻_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"居然击碎了暗黑冰壁！",
                  name = _t"黑暗白鸟",
                  img = "res\\portrait\\黑暗白鸟座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[208] =        ---黑暗之冰_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"我被冰冻了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"就在我永远不会融化的冰凌柩中沉睡吧！",
                  name = _t"黑暗白鸟",
                  img = "res\\portrait\\黑暗白鸟座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"……我绝不会……被困在这里！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[406] =        ---讨伐者_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"我还当是谁，原来是嘉米尔之穆！哼哼，即使是你，也无法包庇这个青铜圣斗士！",
                  name = _t"美斯狄",
                  img = "res\\portrait\\白银蜥蜴座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 500,
           },
     [2] = {
                  txt = _t"谁？！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[218] =        ---背叛者的下场_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"星矢死了？！不可能，我要找到他！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 500,
           },
     [2] = {
                  txt = _t"白费力气。也罢，反正你马上也会和他一样。",
                  name = _t"美斯狄",
                  img = "res\\portrait\\白银蜥蜴座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[222] =        ---魔铃危急_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"居然欺骗白银圣斗士，魔铃罪该万死！",
                  name = _t"美斯狄",
                  img = "res\\portrait\\白银蜥蜴座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[421] =        ---圣域的杀手_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"咿咿咿咿咿——莎尔娜你怎么突然说这么奇怪的话！",
                  name = _t"加米安",
                  img = "res\\portrait\\白银乌鸦座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[525] =        ---乌鸦的哀声_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"可恶，可恶啊！！",
                  name = _t"加米安",
                  img = "res\\portrait\\白银乌鸦座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[72] =        ---_钟楼
{
     delay = 7000,
     [1] = {
                  txt = _t"冥王的爪牙正在入侵圣域，守住圣域大门！",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\莎尔娜圣衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"如果有超过10个冥界爪牙冲入圣域，你们就别再说自己是圣斗士了！",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\莎尔娜圣衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[73] =        ---_钟楼
{
     delay = 7000,
     [1] = {
                  txt = _t"没想到你们还打败了一个冥斗士！",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\莎尔娜圣衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"雅典娜神像附近出现了冥界爪牙，快去守卫雅典娜神像！跟上我，别再磨蹭了!",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\莎尔娜圣衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[74] =        ---_钟楼
{
     delay = 7000,
     [1] = {
                  txt = _t"大批冥界爪牙正在涌来，保卫雅典娜神像！",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\莎尔娜圣衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[75] =        ---十风穴的最后决战_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"紫龙，你还要勉强战斗吗？我现在轻易就可以杀死你，你所谓的友情真的这么重要吗？",
                  name = _t"黑暗天龙",
                  img = "res\\portrait\\黑暗天龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"黑天龙，即……便，即便你可以将我击倒一百次，但是我还会，还是会第一百零一次的站起来！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"愚蠢！愚蠢！愚蠢！什么友情？真的值得你付出生命去守护吗？",
                  name = _t"黑天龙",
                  img = "res\\portrait\\黑暗天龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[76] =        ---十风穴的最后决战_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"一辉，别狂妄了，尝尝我冰河真正的绝技！冰冻光环！！！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哼，一辉，你也不过如此，刚才那些不过也就是大话，我的冰冻光环是接近绝对零度的存在，就算是神也会被冰冻住！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"冰河，你难道就这么点本事吗？你要看看真正的火焰是什么样子吗？",
                  name = _t"一辉",
                  img = "res\\portrait\\凤凰座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"什……么，什么，究竟，究竟是什么样的实力才能突破我引以为豪的冰冻光环？",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2103] =        ---圣域密探_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"那个人看起来鬼鬼祟祟的，过去看看。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[982] =        ---决斗！龙与虎_庐山
{
     delay = 4000,
     [1] = {
                  txt = _t"紫龙，快给我站起来！你难道要躲在春丽的身后？你个懦夫！",
                  name = _t"雷虎",
                  img = "res\\portrait\\庐山雷虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"雷虎，事情不是你想的那样，紫龙……紫龙他……",
                  name = _t"春丽",
                  img = "res\\portrait\\春丽.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"春丽，你让开！紫龙他根本不配成为天龙座圣斗士，想不到我期待了两年的对手居然是一个懦夫！",
                  name = _t"雷虎",
                  img = "res\\portrait\\庐山雷虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"不！紫龙他……他已经瞎了……",
                  name = _t"春丽",
                  img = "res\\portrait\\春丽.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"春丽，不要说！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[77] =        ---_钟楼
{
     delay = 7000,
     [1] = {
                  txt = _t"看！神像得到了雅典娜神力的护佑！",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\莎尔娜圣衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[78] =        ---_钟楼
{
     delay = 7000,
     [1] = {
                  txt = _t"你们英勇地保卫了雅典娜神像，这是你们应得的奖励！",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\莎尔娜圣衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2110] =        ---十风穴的最后决战_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"我感觉好累……但是现在还不是放弃的时候，同伴们都还在等我！星矢，现在不是倒下的时候！！！",
                  name = _t"星矢",
                  img = "res\\portrait\\天马.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[79] =        ---_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"紫龙住手，你再这样战斗下去一定会流血不止而死的！难道你不想活了吗！",
                  name = _t"黑天龙",
                  img = "res\\portrait\\黑暗天龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"我自己的生命算什么！同伴们都在等着我，我愿意舍弃自己的生命！！！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[80] =        ---_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"冰河！这就是我们之间实力的差距！在地狱慢慢反省自己的愚蠢吧！！！",
                  name = _t"一辉",
                  img = "res\\portrait\\凤凰座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[81] =        ---_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"不可能，不可能，不可能，星矢为什么突然变得如此强大？",
                  name = _t"一辉",
                  img = "res\\portrait\\凤凰座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1320] =        ---遗失的记忆_圣域主城
{
     delay = 3000,
     [1] = {
                  txt = _t"嗯……？这种异常熟悉的感觉……对了，我之前还忘记过一件事！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1539] =        ---疑惑？曾经失踪的自己_圣域主城
{
     delay = 3000,
     [1] = {
                  txt = _t"咦，是你……？",
                  name = _t"圣域侍从",
                  img = "res\\portrait\\教皇侍卫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [2] = {
                  txt = _t"……？难道你认识我？你是谁？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"奇怪，怎么跑了？！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1326] =        ---初代天马！莫名的熟悉_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"……从刚刚开始，就能感觉森林深处有股异常熟悉的小宇宙……到底是谁……？算了，还是过去看看吧！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1494] =        ---流言，星之子圣斗士_银河竞技场银都市
{
     delay = 3000,
     [1] = {
                  txt = _t"什么破圣斗士，仗着自己变强了就四处报复人，不就是小时候被打过……这些该死的孤儿……",
                  name = _t"年轻市民",
                  img = "res\\portrait\\富士山普通居民男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"难道是在说星之子学园的圣斗士？过去看看！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1496] =        ---追查事件背后的真相_银河竞技场银都市
{
     delay = 3000,
     [1] = {
                  txt = _t"还得想些办法……这些还不足以使那些圣斗士引起公愤……",
                  name = _t"伪圣域侍卫",
                  img = "res\\portrait\\教皇侍卫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"要不咱们再下手重点吧……不知道还有没有其他欺负过他们的市民……",
                  name = _t"伪圣域侍卫",
                  img = "res\\portrait\\教皇侍卫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"你们到底想做什么？！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1497] =        ---追查事件背后的真相_银河竞技场银都市
{
     delay = 3000,
     [1] = {
                  txt = _t"这是什么……好像是从刚才的蒙面人身上掉下来的……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1334] =        ---激怒！黑暗之焰再现（一）_银河竞技场银都市
{
     delay = 3000,
     [1] = {
                  txt = _t"你胸口的黑气是——？！！",
                  name = _t"市",
                  img = "res\\portrait\\男子头像1.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"怎么回事，这已经是第二次出现了！这股黑气到底是——？！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1336] =        ---梦魇！失控的黑暗之心_银河竞技场银都市
{
     delay = 2000,
     [1] = {
                  txt = _t"你是什么东西？凭什么教训我！！！去死吧——！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1498] =        ---梦魇！失控的黑暗之心_银河竞技场银都市
{
     delay = 3000,
     [1] = {
                  txt = _t"怎么？这就败了？那我现在就送你去地狱吧！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"不要！！！不要伤害市哥哥！！！",
                  name = _t"元",
                  img = "res\\portrait\\希腊小男孩.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"——！！！怎么回事，我竟然会——想要杀了市……？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1337] =        ---惊醒！摆脱噩梦_银河竞技场银都市
{
     delay = 3000,
     [1] = {
                  txt = _t"你、你没事了吗？你不会再伤害市哥哥了……对不对？",
                  name = _t"元",
                  img = "res\\portrait\\希腊小男孩.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"……对，不要怕，我不会再伤害你的市哥哥了……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1821] =        ---盗火者封印_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"怎么回事？竟然什么都没有发生……是我的力量太弱了吗？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"现在该怎么办？最好是立刻禀报圣域！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"咦？好像从罗德里奥村的方向传来了奇怪的声音。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1822] =        ---盗火者封印_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"哈哈……你……你来晚了，罗德里奥村已经……",
                  name = _t"渗透者",
                  img = "res\\portrait\\圣域杂兵瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"你说什么？罗德里奥村怎么了？……混蛋！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"嘿嘿……嘿嘿……",
                  name = _t"渗透者",
                  img = "res\\portrait\\圣域杂兵瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2102] =        ---盗火者封印_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"怎么会这样……？这里发生了什么？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"尤朵拉！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1823] =        ---罗德里奥村的惨剧_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"尤朵拉，坚持住！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1824] =        ---罗德里奥村的惨剧_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"怎么办？还是没有苏醒的迹象……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1825] =        ---罗德里奥村的惨剧_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"尤朵拉，坚持住！你可以的！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1807] =        ---幸存者_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"你也在这里，这里发生了什么事？",
                  name = _t"魔铃",
                  img = "res\\portrait\\魔铃.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1829] =        ---破火者_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"这……是伟大的盗火者普罗米修斯所使用的锤子？啊！我感觉到全身都充满了力量！小宇宙的力量！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1813] =        ---再遇，神秘的圣斗士_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"双子的撒加？？？你怎么会出现？",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"……",
                  name = _t"神秘的圣斗士",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"住手！你要干什么！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"……",
                  name = _t"神秘的圣斗士",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"他不是敌人！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [6] = {
                  txt = _t"消失了？",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1831] =        ---黄金圣斗士集结_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"卑微的冥兵，阻挡不住我的脚步！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1832] =        ---黄金圣斗士集结_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"时间不多了，我要立刻赶到狂脊之巅，与黄金圣斗士们会合。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1817] =        ---死亡与长眠_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"发现敌情！冥斗士们，团结起来，保卫我们的信念！",
                  name = _t"冥兵百夫长",
                  img = "res\\portrait\\冥斗士杂兵远程男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1836] =        ---死亡与长眠_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"坚持住！我们来支援你了！",
                  name = _t"魔铃",
                  img = "res\\portrait\\魔铃.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"真是个很有意思的家伙。",
                  name = _t"修普诺斯",
                  img = "res\\portrait\\睡神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1838] =        ---冥王神衣的覆灭_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"为什么……我有这么强大的冥衣，还会输？",
                  name = _t"阿历克斯",
                  img = "res\\portrait\\圣斗士学员阿历克斯冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"因为，你失去了正义的力量！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"快对冥王神衣动手，时间来不及了！",
                  name = _t"魔铃",
                  img = "res\\portrait\\魔铃.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1839] =        ---冥王神衣的覆灭_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"不好，撤退！我们必须保护冥王大人的神衣！",
                  name = _t"潘多拉",
                  img = "res\\portrait\\",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"大人的神衣得到足够的煅烧了吗？",
                  name = _t"达拿都斯",
                  img = "res\\portrait\\死神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不知道！但不能再待下去了！撤退！",
                  name = _t"修普诺斯",
                  img = "res\\portrait\\睡神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2135] =        ---冥王神衣的覆灭_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"我不会让你破坏潘多拉大人的计划！",
                  name = _t"阿历克斯",
                  img = "res\\portrait\\圣斗士学员阿历克斯冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"阿历克斯！！！我终于找到你了！！！你会为你的行为付出代价！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"雅典娜背叛了我，潘多拉大人给了我新生，只要是大人的命令我一定会服从！和圣域一系的罗德里奥村必须消灭！",
                  name = _t"阿历克斯",
                  img = "res\\portrait\\圣斗士学员阿历克斯冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"阿历克斯！杀了这个敌人！",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉拿三叉戟.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"是！",
                  name = _t"潘多拉",
                  img = "res\\portrait\\圣斗士学员阿历克斯冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1501] =        ---尼亚？！谋划者的真实面目_银河竞技场银都市
{
     delay = 2000,
     [1] = {
                  txt = _t"——是你！！！",
                  name = _t"伪圣斗士候补生",
                  img = "res\\portrait\\圣斗士男学员3.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1503] =        ---尼亚？！谋划者的真实面目_银河竞技场银都市
{
     delay = 3000,
     [1] = {
                  txt = _t"糟糕！被你说的那家伙发现了！啊！他来了！！！",
                  name = _t"伪圣斗士候补生",
                  img = "res\\portrait\\圣斗士男学员3.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"什么？！！",
                  name = _t"尼亚",
                  img = "res\\portrait\\圣域杂兵远程2.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"——怎么是你？！尼亚！你怎么会在这？！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2204] =        ---残酷的谜之幻影_青木原树海
{
     delay = 4000,
     [1] = {
                  txt = _t"糟糕！竟然晚了一步，那股黑暗的小宇宙已经凝聚而成了——",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[82] =        ---_风暴亚特兰蒂斯
{
     delay = 6000,
     [1] = {
                  txt = _t"我只能送你们到这里了！前面深不可测的大洋下，埋葬了沉没的亚特兰蒂斯……希望还能再次见到活着的你们，我得快点闪了！",
                  name = _t"水手",
                  img = "res\\portrait\\圣域高级区朱利安护卫队长.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"呵呵呵，你们这些自不量力的小鬼，竟然真的查到这儿了。也好，你们就去给我伟大的海皇陪葬吧！大海就是你们的坟墓！海的勇士们，上！",
                  name = _t"狄蒂丝",
                  img = "res\\portrait\\海斗士美人鱼鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[83] =        ---_风暴亚特兰蒂斯
{
     delay = 5000,
     [1] = {
                  txt = _t"没想到你们竟然能走到这里，不过没关系，这里就将是你们的埋骨之地了，别再挣扎了！",
                  name = _t"狄蒂丝",
                  img = "res\\portrait\\海斗士美人鱼鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"看到周围的海龙鳞衣了么？其中只有一个是真的，每次你们当中都会有一个人被选中去查看海龙鳞衣的真假，只有找到真的海龙鳞衣，你们才有机会通过这里！",
                  name = _t"狄蒂丝",
                  img = "res\\portrait\\海斗士美人鱼鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"如果你们找到的是假的海龙鳞衣，那么恭喜你们，你们离坟墓又近了一些！",
                  name = _t"狄蒂丝",
                  img = "res\\portrait\\海斗士美人鱼鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[84] =        ---_风暴亚特兰蒂斯
{
     delay = 5000,
     [1] = {
                  txt = _t"咦，这些潮汐蟹是怎么了，好像是发生了变异，什么力量？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2188] =        ---残酷的谜之幻影_青木原树海
{
     delay = 3000,
     [1] = {
                  txt = _t"不要！！！不要伤害市哥哥！！！",
                  name = _t"元",
                  img = "res\\portrait\\希腊小男孩.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"凭什么，这种无能的弱者就该被杀死！你不过就是个孤儿，不如就让我送你们一块下地狱吧！！！",
                  name = _t"黑暗自我",
                  img = "res\\portrait\\默认.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"住手！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"……不对，这只是幻象，只是树海中产生的幻象……这个黑暗人影到底是……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1507] =        ---幻境，具象化的黑暗自我_青木原树海
{
     delay = 3000,
     [1] = {
                  txt = _t"为什么要驱散我？我才是你真正的模样！你这个懦夫！去死吧！！！",
                  name = _t"黑暗自我",
                  img = "res\\portrait\\默认.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1346] =        ---幻境，具象化的黑暗自我_青木原树海
{
     delay = 3000,
     [1] = {
                  txt = _t"咦，又有什么幻影出来了，这是——",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1511] =        ---未知的强大力量（一）_铃之村
{
     delay = 3000,
     [1] = {
                  txt = _t"哇哇哇——你做什么？干嘛打散草垛！！！",
                  name = _t"小铃村",
                  img = "res\\portrait\\女性助祭司3.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1351] =        ---打倒困难的勇气（二）_铃之村
{
     delay = 3000,
     [1] = {
                  txt = _t"走吧，我们回爷爷那去，你要快点跟上来喔～",
                  name = _t"小铃村",
                  img = "res\\portrait\\女性助祭司4.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1357] =        ---来自圣域的杀手（一）_竹林
{
     delay = 3000,
     [1] = {
                  txt = _t"你这个背叛圣域的叛徒！！！",
                  name = _t"神秘敌人",
                  img = "res\\portrait\\教皇侍卫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1524] =        ---埋藏记忆深处的声音_竹林
{
     delay = 3000,
     [1] = {
                  txt = _t"不行！我不能被黑暗侵蚀！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"——？！！这股温暖的蓝光是——？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"体内的黑暗之力，好像渐渐被压制下去了——",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"不要被黑暗侵蚀，到我这里来！！！",
                  name = _t"云峰",
                  img = "res\\portrait\\",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1368] =        ---考验！光与暗的之战（三）_圣战遗址
{
     delay = 3000,
     [1] = {
                  txt = _t"我要让这地狱幽灵将你引入地狱！！！",
                  name = _t"黑暗兽影",
                  img = "res\\portrait\\圣域死亡精灵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1533] =        ---考验！光与暗的之战（三）_圣战遗址
{
     delay = 3000,
     [1] = {
                  txt = _t"虚伪！虚伪！！！这只是你伪装的答案，总有一天你会说真话的！！！",
                  name = _t"黑暗兽影",
                  img = "res\\portrait\\圣域死亡精灵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1369] =        ---被人控制的记忆_圣战遗址
{
     delay = 3000,
     [1] = {
                  txt = _t"嗯——？原来如此，你身上有着曾被禁锢记忆的创伤。",
                  name = _t"神龙之灵",
                  img = "res\\portrait\\默认.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
} 
DialogAcceptIdTask[1844] =        ---虚无_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"消，消失了！！！他到底是谁？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1870] =        ---神殿_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"为什么还没有找到火种所在的地方！",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉拿三叉戟.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这种办事效率真是让人绝望！",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉拿三叉戟.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"对不起，大人，他们都不肯说……",
                  name = _t"冥界侍卫",
                  img = "res\\portrait\\冥界杂兵近战2.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"我来让他说，睡眠的力量是无穷的。",
                  name = _t"修普诺斯",
                  img = "res\\portrait\\睡神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"在……（声音太小，听不清楚）",
                  name = _t"村民",
                  img = "res\\portrait\\希腊渔夫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [6] = {
                  txt = _t"我们快去！",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉拿三叉戟.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1901] =        ---孤独_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"喂！这个人是不可接触者，不许跟他说话！",
                  name = _t"加米安",
                  img = "res\\portrait\\白银乌鸦座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"你是谁？（刚刚卖我面包的那个人！）",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"本大爷是乌鸦星座的白银圣斗士！受命监视这个人！",
                  name = _t"加米安",
                  img = "res\\portrait\\白银乌鸦座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1905] =        ---铃兰_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"加米安大人！加米安大人！不好啦！",
                  name = _t"尤朵拉",
                  img = "res\\portrait\\圣域圣斗士女学员艾亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这不是尤朵拉妹妹吗？出了什么事情？",
                  name = _t"加米安",
                  img = "res\\portrait\\白银乌鸦座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"有一只可怜的乌鸦受伤了，掉在了金穗花田里！",
                  name = _t"尤朵拉",
                  img = "res\\portrait\\圣域圣斗士女学员艾亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"什么？竟然有这么悲惨的事情？",
                  name = _t"加米安",
                  img = "res\\portrait\\白银乌鸦座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"是啊！那里有好多蛇啊！人家怕蛇不敢去救！",
                  name = _t"尤朵拉",
                  img = "res\\portrait\\圣域圣斗士女学员艾亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [6] = {
                  txt = _t"别怕！我这就去！",
                  name = _t"加米安",
                  img = "res\\portrait\\白银乌鸦座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[85] =        ---_纱织的别墅
{
     delay = 5000,
     [1] = {
                  txt = _t"我来得晚了一些，还好有你，为了表达我的感谢，我这里有些东西，如果你需要的话可以看一看！",
                  name = _t"辰巳德丸",
                  img = "res\\portrait\\辰巳德丸西服.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1916] =        ---纷争_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"滚开！别挡我的路！",
                  name = _t"阿历克斯",
                  img = "res\\portrait\\圣斗士学员阿历克斯冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"阿历克斯！你以前也是这里的学员，大家的关系很好，怎么现在成了这样呢！",
                  name = _t"候补生",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"因为我很讨厌这类虚伪的正义脸孔！怎么，你还想找打吗？",
                  name = _t"阿历克斯",
                  img = "res\\portrait\\圣斗士学员阿历克斯冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"住手！阿历克斯，你是我们的同学，但看看你现在成了什么样子？",
                  name = _t"尤朵拉",
                  img = "res\\portrait\\圣域圣斗士女学员艾亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"……",
                  name = _t"阿历克斯",
                  img = "res\\portrait\\圣斗士学员阿历克斯冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [6] = {
                  txt = _t"少对我说教，你这个……哼，懒得和你废话！滚开滚开！",
                  name = _t"阿历克斯",
                  img = "res\\portrait\\圣斗士学员阿历克斯冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1961] =        ---忧离_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"你到底想不想成为圣斗士？",
                  name = _t"黑衣少女",
                  img = "res\\portrait\\潘多拉拿三叉戟.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"我当然想，可是……",
                  name = _t"阿历克斯",
                  img = "res\\portrait\\圣斗士学员阿历克斯冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"没有勇气挑战自我的人，永远不会有出息。",
                  name = _t"黑衣少女",
                  img = "res\\portrait\\潘多拉拿三叉戟.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"……",
                  name = _t"阿历克斯",
                  img = "res\\portrait\\圣斗士学员阿历克斯冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1975] =        ---友情_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"站住！把你手上的东西交出来！",
                  name = _t"阿历克斯",
                  img = "res\\portrait\\圣斗士学员阿历克斯冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"阿历克斯？怎么是你？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[86] =        ---_风暴亚特兰蒂斯
{
     delay = 5000,
     [1] = {
                  txt = _t"快来人啊，快来人救救我！该死的，难道我要死在这里了……",
                  name = _t"遗迹探险家普尔斯",
                  img = "res\\portrait\\圣斗士学院阿历克斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[87] =        ---_风暴亚特兰蒂斯
{
     delay = 5000,
     [1] = {
                  txt = _t"感谢你们救了我，我想我现在安全了，下面的探险我就不再去了；我这里有些东西，都是我在以往的探险中发现的，也许你们能用到，快来看一看吧！",
                  name = _t"遗迹探险家普尔斯",
                  img = "res\\portrait\\圣斗士学院阿历克斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1491] =        ---初代天马！莫名的熟悉_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"这是……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2193] =        ---莎尔娜04_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"莎尔娜你难道怕了么，有本事来追我啊！",
                  name = _t"斗篷人",
                  img = "res\\portrait\\庐山神秘怪人.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"你要冷静，这很可能是个陷阱！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[88] =        ---_风暴亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"不好，它们来了，危险，快消灭它们！",
                  name = _t"受困的灵魂",
                  img = "res\\portrait\\嘉米尔圣衣衣魂.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[89] =        ---_风暴亚特兰蒂斯
{
     delay = 5500,
     [1] = {
                  txt = _t"感谢你们！我终于解脱了，接下去就拜托你们了！不好，他们来了！",
                  name = _t"挣扎中的魔鬼鱼灵魂",
                  img = "res\\portrait\\海将军六圣兽.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[90] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"红日被阴云隐没，下一个日出究竟在何方，我该离开，还是忘却。",
                  name = _t"善之幻象",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[91] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"历史终究是由胜利者书写的，力量，有了力量你就能拥有一切。",
                  name = _t"恶之幻象",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[92] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"混沌的过往，沾满鲜血的双手，不能磨灭的罪恶，苦痛将永世伴随着我。",
                  name = _t"善之幻象",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[93] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"人类需要由强大的力量驱引，这个时代的英雄就是我！伟大的不朽的我！",
                  name = _t"恶之幻象",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[94] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"赶快离开这里，否则你可能再也不能离开。",
                  name = _t"善之幻象",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[95] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"蝼蚁，你确实已经命不久矣！",
                  name = _t"恶之幻象",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"怎么回事？这些幻象究竟是什么？观星楼里还隐藏着其他的秘密吗？什么？楼上有异动？",
                  name = _t"",
                  img = "res\\portrait\\$PLAYER_NAME",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2250] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"活人，你将后悔选择来到这里！",
                  name = _t"冥界幻象",
                  img = "res\\portrait\\嘉米尔冥斗士初级.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2251] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"愚蠢的活人，这里也将同时埋葬你！",
                  name = _t"冥界幻象",
                  img = "res\\portrait\\嘉米尔冥斗士初级.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2253] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"哈哈，哈哈，哈哈哈哈……为什么你又来到这里，为什么你还没有死去，你也想品尝死亡的冰凉吗？痛陈心扉的，撕裂的痛苦吗！！！",
                  name = _t"艾德幻象",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2249] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"艾德？你们怎么在这里，艾德，难道你还活着？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"活着？死了？活着是为了什么？死了又是为了什么？我曾经活着吗？我现在死了吗？",
                  name = _t"艾德幻象",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"艾德，艾德，你要去哪？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6509] =        ---_剧情：射手逃亡
{
     delay = 5000,
     [1] = {
                  txt = _t"艾欧罗斯！别再逃下去了。如果你还是一名黄金圣斗士，就马上跟我回圣域见教皇！",
                  name = _t"修罗",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"修罗，教皇不会听我解释的，我现在还想不通，教皇他怎么会突然变成……",
                  name = _t"艾欧罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"住口！你竟然打伤了教皇！背叛教皇就是背叛雅典娜！",
                  name = _t"修罗",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"你不明白，教皇他……总之，我不会和你战斗的。",
                  name = _t"艾欧罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"艾欧罗斯，你背叛了圣域，背叛了雅典娜，我修罗是绝不会放过你的！",
                  name = _t"修罗",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [6] = {
                  txt = _t"修罗……",
                  name = _t"艾欧罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[96] =        ---_剧情：射手逃亡
{
     delay = 5000,
     [1] = {
                  txt = _t"修罗大人，就让我们来清理挡路的石头，然后抓住艾欧罗斯吧。",
                  name = _t"追兵",
                  img = "res\\portrait\\圣域杂兵瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"随便你们，反正艾欧罗斯和眼前这个家伙都是死路一条。",
                  name = _t"修罗",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[97] =        ---_剧情：射手逃亡
{
     delay = 5000,
     [1] = {
                  txt = _t"你已经激怒我了！",
                  name = _t"修罗",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[98] =        ---_剧情：射手逃亡
{
     delay = 5000,
     [1] = {
                  txt = _t"竟然能和我修罗对抗这么久！",
                  name = _t"修罗",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[99] =        ---_剧情：射手逃亡
{
     delay = 5000,
     [1] = {
                  txt = _t"死吧！叛逆者！",
                  name = _t"修罗",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[100] =        ---_剧情：射手逃亡
{
     delay = 5000,
     [1] = {
                  txt = _t"住手！修罗！",
                  name = _t"修罗",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[101] =        ---_剧情：射手逃亡
{
     delay = 5000,
     [1] = {
                  txt = _t"住手！修罗！",
                  name = _t"修罗",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[102] =        ---_剧情：射手逃亡
{
     delay = 5000,
     [1] = {
                  txt = _t"住手！修罗！",
                  name = _t"艾欧罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"修罗，放弃吧，你的敌人不是艾欧罗斯！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"哼，你认为黄金圣斗士会被吓倒吗？真是可笑！",
                  name = _t"修罗",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[129] =        ---_剧情：射手逃亡
{
     delay = 3000,
     [1] = {
                  txt = _t"住手！修罗！",
                  name = _t"艾欧罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"艾欧罗斯，你不该回来……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2246] =        ---临终的托付_剧情：射手逃亡
{
     delay = 5000,
     [1] = {
                  txt = _t"我是射手座的黄金圣斗士艾欧罗斯，圣域中有人想杀这婴儿，我拼了性命才救她逃到这里，但是我已经无力在保护他了。",
                  name = _t"艾欧罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"圣斗士？艾欧罗斯！我在山下的村子里听说过你的名字。我现在该怎么做？",
                  name = _t"城户光政",
                  img = "res\\portrait\\城户光政.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"这个婴儿，是当世上弥漫邪恶之际，每数百年才会降临一次的救世主，也就是雅典娜的化身，",
                  name = _t"艾欧罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"请您一定要保护她长大成人，那时候会有一群勇敢的少年前来保护她。",
                  name = _t"艾欧罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"雅典娜？这个婴儿是雅典娜？",
                  name = _t"城户光政",
                  img = "res\\portrait\\城户光政.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [6] = {
                  txt = _t"是的，请您带着雅典娜和这个黄金圣衣箱马上离开这里，快走……",
                  name = _t"艾欧罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [7] = {
                  txt = _t"艾欧罗斯！",
                  name = _t"城户光政",
                  img = "res\\portrait\\城户光政.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [8] = {
                  txt = _t"艾欧罗斯……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[103] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"%s,死在这里，死在这里，死在这里！！！",
                  name = _t"艾德幻象",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[104] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"我在哪？我不是死了吗？我得到圣衣了吗？我是最强的圣斗士吗？",
                  name = _t"艾德幻象",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"我是，我是，我是，我是最强的圣斗士，我将成为最伟大的黄金圣斗士，哈哈哈哈！",
                  name = _t"艾德幻象",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[105] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"我在哪？我不是死了吗？我能战胜卡西欧士吗？我能成为青铜圣斗士吗？",
                  name = _t"艾德幻象",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"不！不！不！我死了，我被你杀死了，我多想活着啊……",
                  name = _t"艾德幻象",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[106] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"我在哪？我是谁？我活着还是死了？我该去往哪里？谁能告诉我？谁能告诉我？",
                  name = _t"艾德幻象",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[107] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"死亡对于我和另一个我或许是一件……好事……",
                  name = _t"艾德幻象",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1845] =        ---报讯_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"看来我得赶紧把这里的情况通知训练营的莎尔娜！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1859] =        ---抓不住的风_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"这里看样子没有什么异常，也感觉不到任何有敌意的小宇宙。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"艾欧里亚和魔铃也在这里。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2294] =        ---封印黄泉之井_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"前面的人是谁……？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1835] =        ---决战！死亡与长眠_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"哼！狂妄的小子！",
                  name = _t"达拿都斯",
                  img = "res\\portrait\\死神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"约尔曼冈德，交给你了，不要让我失望。",
                  name = _t"达拿都斯",
                  img = "res\\portrait\\死神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"吼！吼！吼！！！",
                  name = _t"约尔曼冈德",
                  img = "res\\portrait\\圣域冥腹蛇.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[108] =        ---_十风穴
{
     delay = 5000,
     [1] = {
                  txt = _t"救命啊！救命啊！我在下面！！",
                  name = _t"遇难的登山家",
                  img = "res\\portrait\\希腊猎人.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[109] =        ---_十风穴
{
     delay = 5000,
     [1] = {
                  txt = _t"我受了重伤，需要治疗！请帮帮我！",
                  name = _t"遇难的登山家",
                  img = "res\\portrait\\希腊猎人.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[110] =        ---_十风穴
{
     delay = 5000,
     [1] = {
                  txt = _t"谢谢你们，我的伤好多了。这样我自己就能上去了。",
                  name = _t"遇难的登山家",
                  img = "res\\portrait\\希腊猎人.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [2] = {
                  txt = _t"我这里有些好东西，为了感谢你们的帮助，就打折卖给你们吧。",
                  name = _t"遇难的登山家",
                  img = "res\\portrait\\希腊猎人.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[111] =        ---_十风穴
{
     delay = 5000,
     [1] = {
                  txt = _t"我还以为你们不敢来了呢！",
                  name = _t"黑暗天马",
                  img = "res\\portrait\\黑暗天马座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[112] =        ---_十风穴
{
     delay = 5000,
     [1] = {
                  txt = _t"你们以为赢了我？那就大错特错了……",
                  name = _t"黑暗天马",
                  img = "res\\portrait\\黑暗天马座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [2] = {
                  txt = _t"你们是不可能到达一辉那里的……",
                  name = _t"黑暗天马",
                  img = "res\\portrait\\黑暗天马座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[113] =        ---_十风穴
{
     delay = 5000,
     [1] = {
                  txt = _t"我等你们很久了！今天一定要你们知道，谁的冻气才是最强的！",
                  name = _t"黑暗白鸟",
                  img = "res\\portrait\\黑暗白鸟座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[114] =        ---_十风穴
{
     delay = 5000,
     [1] = {
                  txt = _t"我黑暗白鸟即使打败了，也不会临阵脱逃！",
                  name = _t"黑暗白鸟",
                  img = "res\\portrait\\黑暗白鸟座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [2] = {
                  txt = _t"你们的拳法已经牢牢的印在了我的眼中……对一辉就是不管用的了……哈哈哈……",
                  name = _t"黑暗白鸟",
                  img = "res\\portrait\\黑暗白鸟座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[115] =        ---_十风穴
{
     delay = 5000,
     [1] = {
                  txt = _t"你们这帮蠢货，落入了我的陷阱就别想逃了！",
                  name = _t"黑暗仙女",
                  img = "res\\portrait\\黑暗仙女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[116] =        ---_十风穴
{
     delay = 5000,
     [1] = {
                  txt = _t"让你们尝尝黑暗锁链的恐怖滋味！",
                  name = _t"黑暗仙女",
                  img = "res\\portrait\\黑暗仙女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[117] =        ---_十风穴
{
     delay = 5000,
     [1] = {
                  txt = _t"真让我意外啊，杂碎青铜，你们竟然能来到这里。不过也就到此为止了！",
                  name = _t"黑暗天龙",
                  img = "res\\portrait\\黑暗天龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[118] =        ---_十风穴
{
     delay = 5000,
     [1] = {
                  txt = _t"一辉大人……我的生命燃尽了……",
                  name = _t"黑暗天龙",
                  img = "res\\portrait\\黑暗天龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [2] = {
                  txt = _t"哥哥……这就是你一直以来所看到的黑暗吗……",
                  name = _t"黑暗天龙",
                  img = "res\\portrait\\黑暗天龙座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[119] =        ---_十风穴
{
     delay = 5000,
     [1] = {
                  txt = _t"你们这是自寻死路！被凤凰的火焰烧成灰烬吧！！",
                  name = _t"凤凰座一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[120] =        ---_十风穴
{
     delay = 5000,
     [1] = {
                  txt = _t"我终究……还是被自己的怒火烧尽了……",
                  name = _t"凤凰座一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [2] = {
                  txt = _t"你们的战斗不会就此结束……",
                  name = _t"凤凰座一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[121] =        ---_重返观星楼
{
     delay = 10000,
     [1] = {
                  txt = _t"我又回到了这个罪恶之地，是的，我怎么可能遗忘掉这里的一切，阴谋、杀戮、权利。",
                  name = _t"善之幻象",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[309] =        ---黄金的小宇宙_新手村
{
     delay = 4000,
     [1] = {
                  txt = _t"你快看，就是这里！你感受到那些石头上的气息了吗？",
                  name = _t"星矢",
                  img = "res\\portrait\\星矢圣域便装版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[109] =        ---无法承受之痛_新手村
{
     delay = 4000,
     [1] = {
                  txt = _t"艾娅，接下来就是星矢和卡西欧士的竞技，我绝对不会让这样的事情再次发生！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2314] =        ---天马座星矢_新手村
{
     delay = 4000,
     [1] = {
                  txt = _t"魔铃，为什么这么着急离开，我明明可以光明正大的离开圣域！",
                  name = _t"星矢",
                  img = "res\\portrait\\星矢圣域便装版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"明天？莎尔娜绝不会让你活过明天的！",
                  name = _t"魔铃",
                  img = "res\\portrait\\魔铃.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"这是……魔铃和星矢的声音？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2228] =        ---到达特定地点_剧情：射手逃亡
{
     delay = 5000,
     [1] = {
                  txt = _t"我不想伤到任何人，快闪开！",
                  name = _t"艾欧罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"少废话，圣域的人是从来不会退缩的！",
                  name = _t"修罗",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2229] =        ---击碎路障_剧情：射手逃亡
{
     delay = 5000,
     [1] = {
                  txt = _t"乖乖投降吧！艾欧罗斯！",
                  name = _t"修罗",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2230] =        ---到达特定地点2_剧情：射手逃亡
{
     delay = 5000,
     [1] = {
                  txt = _t"不要做无谓的抵抗了，艾欧罗斯！你的伤会把你拖累死的！",
                  name = _t"修罗",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2231] =        ---击碎路障2_剧情：射手逃亡
{
     delay = 5000,
     [1] = {
                  txt = _t"觉悟吧，艾欧罗斯！",
                  name = _t"修罗",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2232] =        ---到达特定地点3_剧情：射手逃亡
{
     delay = 5000,
     [1] = {
                  txt = _t"还是让我修罗来斩掉你的头颅吧！",
                  name = _t"修罗",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2233] =        ---击碎路障3_剧情：射手逃亡
{
     delay = 5000,
     [1] = {
                  txt = _t"艾欧罗斯，你是逃不掉的！",
                  name = _t"修罗",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2234] =        ---到达石柱谷_剧情：射手逃亡
{
     delay = 5000,
     [1] = {
                  txt = _t"拦住艾欧罗斯！别让他跑了！",
                  name = _t"追兵队长",
                  img = "res\\portrait\\圣域杂兵壮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"尝尝石头的滋味吧，艾欧罗斯！",
                  name = _t"投石兵",
                  img = "res\\portrait\\圣域杂兵壮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2236] =        ---击败巨型杂兵两兄弟_剧情：射手逃亡
{
     delay = 5000,
     [1] = {
                  txt = _t"艾欧罗斯，就让我们两兄弟来结果你吧！",
                  name = _t"大块头",
                  img = "res\\portrait\\卡西欧士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2239] =        ---离开钟乳洞到达平台_剧情：射手逃亡
{
     delay = 4000,
     [1] = {
                  txt = _t"终于逃脱了，已经摆脱修罗了吗？咳，咳……",
                  name = _t"艾欧罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2242] =        ---与艾欧罗斯对完话_剧情：射手逃亡
{
     delay = 4000,
     [1] = {
                  txt = _t"哈哈哈哈，艾欧罗斯，你以为你可以就这样逃走吗？别妄想了！",
                  name = _t"修罗",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"修罗，你还是追来了，咳，咳……",
                  name = _t"艾欧罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"艾欧罗斯，快离开这里，我来挡住他！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"拜托你了……少年。",
                  name = _t"艾欧罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"你是谁，怎么会认识我？哼，不管你是谁，叛逆者的下场只有死！",
                  name = _t"修罗",
                  img = "res\\portrait\\黄金圣斗士射手座便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2320] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"你战胜了你自己的恐惧，或许你也能战胜整个圣域的恐惧，你愿意跟我揭开13年的秘密吗？",
                  name = _t"善之幻象",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2323] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"13年之前这里发生了可怕的事情，一个利欲熏心的恶魔做了大逆不道之事。",
                  name = _t"善之幻象",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"恶魔隐藏了自己并且渐行渐远，我必须驱散邪恶，让光明重新恩泽大地。什么！恶魔，你……",
                  name = _t"善之幻象",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"蠢货，你想阻止我，你想阻止历史的进程吗！死吧！",
                  name = _t"恶之双子",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"居然想私窥我的秘密！%s你也死在这里吧！",
                  name = _t"恶之双子",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[122] =        ---_风暴亚特兰蒂斯
{
     delay = 5500,
     [1] = {
                  txt = _t"感谢你们，我终于解脱了！海魔女鳞衣会去寻找它新的主人，我们再会吧！",
                  name = _t"挣扎中的海魔女灵魂",
                  img = "res\\portrait\\海斗士海魔女鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[123] =        ---_风暴亚特兰蒂斯
{
     delay = 5500,
     [1] = {
                  txt = _t"感谢你们，我终于解脱了！前面的道路更加凶险了，希望你们能活着离开！",
                  name = _t"挣扎中的海皇子灵魂",
                  img = "res\\portrait\\海将军海皇子克修拉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[124] =        ---_风暴亚特兰蒂斯
{
     delay = 5000,
     [1] = {
                  txt = _t"哎呀！运气不太好啊，找到的是假的海龙鳞衣，小心点！",
                  name = _t"狄蒂丝",
                  img = "res\\portrait\\海斗士美人鱼鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[125] =        ---_风暴亚特兰蒂斯
{
     delay = 6000,
     [1] = {
                  txt = _t"没想到，你们竟然找到了真的海龙鳞衣，不过你们也将唤醒沉睡的海龙灵魂，接受他愤怒的海浪吧！",
                  name = _t"狄蒂丝",
                  img = "res\\portrait\\海斗士美人鱼鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2359] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"你的小宇宙居然已经成长到这个地步……我……一定……会杀死你……",
                  name = _t"恶之幻象",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"你真的战胜了这个恶魔，光明或许马上就会降临人间，久违的正义真的会再临大地了啊！",
                  name = _t"善之幻象",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"来，真相即将为这个世界揭晓。",
                  name = _t"善之双子",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2356] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"这里就是观星楼的顶层吗？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"什么！？这个尸体究竟是？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"怎么？这里还有一堵念力墙？我能击碎这堵念力墙吗？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2362] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"嗯？这挫头发为什么会时而变成蓝色时而变成白色？这究竟是谁遗留下来的？这个尸体又究竟是谁的呢？幻象所谓的巨大的阴谋是什么呢？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"%s现在赶快回来，现在！我没有时间跟你解释，现在！快从传送阵回来！",
                  name = _t"希尔汗",
                  img = "res\\portrait\\庐山神秘怪人.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2207] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"突然出现的裂隙是什么？不对，这个裂隙可以源源不断的运送冥界士兵！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"死吧，圣斗士！",
                  name = _t"冥界幻象",
                  img = "res\\portrait\\嘉米尔冥斗士初级.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[126] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"螳臂挡车，历史进步的如此之慢正是因为有你们这种不明事理，愚蠢至极的伪君子阻碍，今天我将代表历史彻底终结你！",
                  name = _t"恶之幻象",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"胡说，你所谓的进步就是驾驭在他人的尊严和性命之上的吗！我不会轻易放弃！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"嗯？居然还可以打？",
                  name = _t"恶之幻象",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[127] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"什么是神？神就是做了你们这群凡夫俗子不能做之事而被颂扬成为神，而今天你将光荣的被神屠戮。",
                  name = _t"恶之幻象",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"什么神？仅仅为了满足自己的私欲怎们能成为神！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"嗯？到现在还没死吗？",
                  name = _t"恶之幻象",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[128] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"凡人，难道不能从历史中吸取一丁点的教训吗？胜利者才有资格评判什么是正义什么是光明！",
                  name = _t"恶之幻象",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"即便历史书被颠倒，事实也不会被任意抹黑！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"嗯？你究竟是多么顽强？",
                  name = _t"恶之幻象",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2408] =        ---_重返观星楼
{
     delay = 8000,
     [1] = {
                  txt = _t"这些冥界幻象怎么会出现？为什么这些幻想会攻击我？艾德究竟去了哪了？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2409] =        ---_重返观星楼
{
     delay = 8000,
     [1] = {
                  txt = _t"为什么又出现了这么多幻象？观星楼究竟是怎么了？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1775] =        ---水中少年（十一）_庐山
{
     delay = 5000,
     [1] = {
                  txt = _t"对不起，狄蒂丝大人……我不能回到您和波赛冬大人身边去。",
                  name = _t"蓝斯",
                  img = "res\\portrait\\庐山学员男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"…………",
                  name = _t"狄蒂丝",
                  img = "res\\portrait\\圣域美人鱼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"狄蒂丝大人……是您从船难中救了我，也是您把我抚养长大，教导我要成为一个伟大的海斗士，为了波赛冬大人而战。",
                  name = _t"蓝斯",
                  img = "res\\portrait\\庐山学员男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"我无法原谅背叛波赛冬大人的人，不过……你听着我根本就没见过你，以后你也不要再出现在我的面前！",
                  name = _t"狄蒂丝",
                  img = "res\\portrait\\圣域美人鱼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"狄蒂丝大人……对不起，我要留在庐山，守护我所爱的人！",
                  name = _t"蓝斯",
                  img = "res\\portrait\\庐山学员男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1773] =        ---水中少年（十）_庐山
{
     delay = 5000,
     [1] = {
                  txt = _t"狄蒂丝大人，我已经考虑得很清楚了，我们走吧。",
                  name = _t"蓝斯",
                  img = "res\\portrait\\庐山学员男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"蓝斯！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[130] =        ---_风暴亚特兰蒂斯
{
     delay = 5000,
     [1] = {
                  txt = _t"哼哼，没想到你们这些圣斗士们也会对深海底的事儿感兴趣。不过可惜了，你们的尸体就要被鱼啃食光了，哈哈哈！",
                  name = _t"黑暗飞鱼座艾莉丝",
                  img = "res\\portrait\\黑暗杂兵远程1.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"你是黑暗圣斗士！你们在亚特兰蒂斯做什么？难道……海上风暴肆虐是你们和狄蒂丝搞的鬼？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"少废话！让我在这里结果你们吧！",
                  name = _t"黑暗飞鱼座艾莉丝",
                  img = "res\\portrait\\黑暗杂兵远程1.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[135] =        ---_激斗！黄金十二宫！
{
     delay = 2500,
     [1] = {
                  txt = _t"尽你所能向我挥拳吧，让我看看你的实力究竟到什么程度了。",
                  name = _t"阿鲁迪巴",
                  img = "res\\portrait\\黄金圣斗士金牛座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6502] =        ---_激斗！黄金十二宫！
{
     delay = 3000,
     [1] = {
                  txt = _t"前面就是黄金十二宫了，一定要把消息尽快告诉教皇。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"希望守卫这里的卫兵队长能帮我把消息传给教皇。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[137] =        ---_激斗！黄金十二宫！
{
     delay = 2500,
     [1] = {
                  txt = _t"希望守卫这里的卫兵队长能帮我把消息传给教皇。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2525] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"这些幻象？究竟是什么力量控制了这些？这些究竟是真实的，还是仅仅是我自己的臆想？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这些书架很可疑，或许能够发现什么线索。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1907] =        ---_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"这下可糟了，怎么办呢？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"那边……好像有什么发光的物体，是什么呢？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2553] =        ---_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"咳……咳……",
                  name = _t"桑坦诺亚",
                  img = "res\\portrait\\坦桑诺亚男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这个徽章……上面是射手座的图案！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"桑坦诺亚不会跟我说话了，我还是去问问小乞丐吧，老天保佑，希望他能知道些什么。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"……",
                  name = _t"桑坦诺亚",
                  img = "res\\portrait\\坦桑诺亚男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2412] =        ---_欺瞒神的男人
{
     delay = 5000,
     [1] = {
                  txt = _t"蠢蛋小子，让你见识见识我们战斗勇士海神卫灵，你将死在这里，死在这里，哈哈！",
                  name = _t"海神卫灵统领",
                  img = "res\\portrait\\怪物海斗士杂兵瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2453] =        ---_欺瞒神的男人
{
     delay = 6000,
     [1] = {
                  txt = _t"啊，马萨卡！这，这，这怎么可能这样，我不相信，你怎么可能打败我们，混蛋混蛋，居然被你侥幸获胜了，卫灵都上，都上，给我杀了他。",
                  name = _t"海神卫灵统领",
                  img = "res\\portrait\\怪物海斗士杂兵瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"你们以为数量就可以取胜？海里的垃圾，大爷今天心情不错，就让你们死前见识见识什么是黄金圣斗士的实力！",
                  name = _t"加隆",
                  img = "res\\portrait\\加隆便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2455] =        ---_欺瞒神的男人
{
     delay = 5000,
     [1] = {
                  txt = _t"别打我，我不会打架，我不会打架，对对对，你是大爷，你是大爷，哼，等会看海龙大人怎么折磨你，没有，我什么也没说啊。",
                  name = _t"海神卫灵统领",
                  img = "res\\portrait\\怪物海斗士杂兵瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这里究竟是什么地方？",
                  name = _t"加隆",
                  img = "res\\portrait\\加隆便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"这里？大人您不知道吗？这里是海神波塞冬大人安寝的地方，对，就在前面，对，您可以去，就在前面。",
                  name = _t"海神卫灵统领",
                  img = "res\\portrait\\怪物海斗士杂兵瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2457] =        ---_欺瞒神的男人
{
     delay = 5000,
     [1] = {
                  txt = _t"这里如此安静？前面的封印？",
                  name = _t"加隆",
                  img = "res\\portrait\\加隆便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2546] =        ---_欺瞒神的男人
{
     delay = 5000,
     [1] = {
                  txt = _t"谁！居然触碰尘封千年的封印，我北大西洋最高统领海龙将军在此！",
                  name = _t"修亚",
                  img = "res\\portrait\\海将军海龙鳞衣人形版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这个小宇宙！虽然只是灵体却……如此强大！",
                  name = _t"加隆",
                  img = "res\\portrait\\加隆便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"海神卫灵！消灭他！！！",
                  name = _t"修亚",
                  img = "res\\portrait\\海将军海龙鳞衣人形版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2547] =        ---_欺瞒神的男人
{
     delay = 5000,
     [1] = {
                  txt = _t"我还以为是什么东西，这次换上大号的海垃圾了吗？好久没玩这个了！看样子是时候舒展舒展筋骨了。",
                  name = _t"加隆",
                  img = "res\\portrait\\加隆便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2548] =        ---_欺瞒神的男人
{
     delay = 5000,
     [1] = {
                  txt = _t"嗯？原来如此，你能见到我果然不是偶然，不过我倒要看看你还有什么本事，或许你会是下一个延续者也不一定。",
                  name = _t"修亚",
                  img = "res\\portrait\\海将军海龙鳞衣人形版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"延续者？那是什么东西？能够给我力量吗？",
                  name = _t"加隆",
                  img = "res\\portrait\\加隆便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"只要你能打败我，自然就会知道。",
                  name = _t"修亚",
                  img = "res\\portrait\\海将军海龙鳞衣人形版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"他的小宇宙又变强了？也好，就让我彻彻底底的舒展一下筋骨也好！哼！",
                  name = _t"加隆",
                  img = "res\\portrait\\加隆便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2550] =        ---_欺瞒神的男人
{
     delay = 8000,
     [1] = {
                  txt = _t"做的，很好……我守护这里千年就是等待命运中的你，能够来到这里并且解开命运的封印，彻底将我的意志击败击毁，你将成为下一个海将军的统领者，我们称其为延续者。",
                  name = _t"修亚",
                  img = "res\\portrait\\海将军海龙鳞衣人形版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"延续者的使命就是统领七海将军，守卫海皇波塞冬大人，并且助波塞冬大人重新返回荣耀的顶点，荣耀与责任伴随着延续者，你准备接过我的衣钵成为下一位海龙将军了吗？",
                  name = _t"修亚",
                  img = "res\\portrait\\海将军海龙鳞衣人形版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"（统领整个海界海斗士？难道我加隆的好机会要来了吗？）我当然愿意成为波塞冬大人忠实的海龙将军。",
                  name = _t"加隆",
                  img = "res\\portrait\\加隆便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"很好，现在我将将你送往海皇神殿，接受海皇大人的指引。",
                  name = _t"修亚",
                  img = "res\\portrait\\海将军海龙鳞衣人形版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[138] =        ---_欺瞒神的男人
{
     delay = 5000,
     [1] = {
                  txt = _t"龙神之怒！如果你真的能成为延续者，就拿出你的真本事吧！",
                  name = _t"修亚",
                  img = "res\\portrait\\海将军海龙鳞衣人形版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"如果你是这种水平，那么我必然可以轻松取胜。",
                  name = _t"加隆",
                  img = "res\\portrait\\加隆便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[139] =        ---_欺瞒神的男人
{
     delay = 5000,
     [1] = {
                  txt = _t"干的不错，但是你能一直保持这样的水准吗？战争可是旷日持久的！是时候再给你一点压力了！",
                  name = _t"修亚",
                  img = "res\\portrait\\海将军海龙鳞衣人形版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这种程度的战斗，我可以打一万场。",
                  name = _t"加隆",
                  img = "res\\portrait\\加隆便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[140] =        ---_欺瞒神的男人
{
     delay = 5000,
     [1] = {
                  txt = _t"真是一个有趣的人，看来我没有白白等待千年，不过可不要麻痹大意，战争往往最后一刻才能决出胜负！",
                  name = _t"修亚",
                  img = "res\\portrait\\海将军海龙鳞衣人形版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"我早已经胜券在握。",
                  name = _t"加隆",
                  img = "res\\portrait\\加隆便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[81] =        ---前往白羊宫_激斗！黄金十二宫！
{
     delay = 3000,
     [1] = {
                  txt = _t"前面就是白羊座穆大人守卫的白羊宫。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"但是此刻穆大人在嘉米尔，那么会是谁守卫在这里呢？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"但愿不会在白羊宫遇上什么麻烦……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2425] =        ---前往金牛宫_激斗！黄金十二宫！
{
     delay = 3000,
     [1] = {
                  txt = _t"虽然穆大人不在白羊宫，但是居然能布下如此强大的水晶墙。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"难道这就是黄金圣斗士的实力吗？果然很强大……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不管怎么说，已经通过白羊宫了。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"好！下面是金牛宫！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1854] =        ---寂静之村_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"在这个紧要关头，教皇居然在祈祷。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"对了，刚才魔铃说罗德里奥村附近发生了异动，潘多拉一定去了那里！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[141] =        ---_纱织的别墅
{
     delay = 5000,
     [1] = {
                  txt = _t"他们来了，快来保护我，如果你的表现让我满意的话，我会考虑多给你一些奖励的！",
                  name = _t"城户纱织",
                  img = "res\\portrait\\圣斗士_雅典娜.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[142] =        ---_纱织的别墅
{
     delay = 5000,
     [1] = {
                  txt = _t"你们要再努力一点，如果我还像刚刚那样受到那么多伤害的话，你的额外奖励就没有了！",
                  name = _t"城户纱织",
                  img = "res\\portrait\\圣斗士_雅典娜.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[143] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"这就是你的内心，你根本不知道你内心是多么肮脏，多么龌龊，多么不堪！",
                  name = _t"恶之幻象",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[144] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"我真惊讶你的影子居然有如此强大的实力，看样子你内心隐匿着太多不可告人的秘密啊！",
                  name = _t"恶之幻象",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[145] =        ---_重返观星楼
{
     delay = 5000,
     [1] = {
                  txt = _t"嗯，我最喜欢这一段，能够让我更深入的了解你。来，看看你的内心是何等丑陋吧！",
                  name = _t"恶之幻象",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[146] =        ---_风暴亚特兰蒂斯
{
     delay = 8000,
     [1] = {
                  txt = _t"我们伟大的黑暗主宰即将和海皇同时苏醒，掌控这世间的一切！狄蒂丝委托我在此拦住你们，真让我失望啊，难道海界无人了么？竟然让你们走到这里，好吧，就让我来终结你们吧！",
                  name = _t"黑暗鲸鱼座梅德赛斯",
                  img = "res\\portrait\\富士山扭曲空间兽.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2653] =        ---画皮者佐拉顿（三）_遗忘之路支线
{
     delay = 3000,
     [1] = {
                  txt = _t"这里是墓地！那个疯子想让我做什么？！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2655] =        ---弱者的世界（一）_遗忘之路支线
{
     delay = 3000,
     [1] = {
                  txt = _t"虽然只是粗陋的食物，但应该能让那个老人醒来。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2657] =        ---弱者的世界（二）_遗忘之路支线
{
     delay = 3000,
     [1] = {
                  txt = _t"该死的老头，居然还找帮手，今天开始你都不会有饭吃了！全都扔在这里！",
                  name = _t"流放者1、2",
                  img = "res\\portrait\\遗忘之路流放者1.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"你们是谁？为什么要扔掉老人家的饭！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2659] =        ---弱者的世界（三）_遗忘之路支线
{
     delay = 2000,
     [1] = {
                  txt = _t"一把剑浮现了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2660] =        ---弱者的世界（三）_遗忘之路支线
{
     delay = 2000,
     [1] = {
                  txt = _t"难道这就是老人说的帮手？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2661] =        ---弱者的世界（四）_遗忘之路支线
{
     delay = 2000,
     [1] = {
                  txt = _t"出现吧，剑魂！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2664] =        ---弱者的世界（六）_遗忘之路支线
{
     delay = 2000,
     [1] = {
                  txt = _t"哼，可恶的老头！死吧！",
                  name = _t"流放者",
                  img = "res\\portrait\\遗忘之路流放者1.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"住手！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2667] =        ---永不会伤痛（三）_遗忘之路支线
{
     delay = 2000,
     [1] = {
                  txt = _t"为什么，我感到如此诡异的气氛……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2669] =        ---永不会伤痛（五）_遗忘之路支线
{
     delay = 2000,
     [1] = {
                  txt = _t"他醒了！哦，他醒了！（哭泣）",
                  name = _t"哈尔娜",
                  img = "res\\portrait\\希腊平民少女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2671] =        ---永不会伤痛（六）_遗忘之路支线
{
     delay = 2000,
     [1] = {
                  txt = _t"彭索斯？他在这里干什么？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2672] =        ---永不会伤痛（七）_遗忘之路支线
{
     delay = 3000,
     [1] = {
                  txt = _t"为什么老爹变成了冥界异化者？要赶紧把这件事告诉长老。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2676] =        ---瓶中的女人（二）_遗忘之路支线
{
     delay = 3000,
     [1] = {
                  txt = _t"神殿中回荡着瓶中女人的呼唤声，却没有任何回应。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2601] =        ---瓶中的女人（六）_遗忘之路支线
{
     delay = 2000,
     [1] = {
                  txt = _t"从生命之树上发出了耀眼的光芒！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2684] =        ---命运之线（三）_遗忘之路支线
{
     delay = 2000,
     [1] = {
                  txt = _t"嘻嘻，好像很有趣哦，就让我未来女神来见你吧。",
                  name = _t"克罗托",
                  img = "res\\portrait\\命运三女神幻象可罗素女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"妹妹，不要鲁莽。",
                  name = _t"拉切西斯",
                  img = "res\\portrait\\命运女神幻像.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2698] =        ---海之灵魂，苏醒（二）_遗忘之路支线
{
     delay = 2000,
     [1] = {
                  txt = _t"是纳格雅！她怎么倒在地上？！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2700] =        ---海之灵魂，苏醒（二）_遗忘之路支线
{
     delay = 3000,
     [1] = {
                  txt = _t"为什么村民都变成了海怪？纳格雅应该知道些什么！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2702] =        ---海之灵魂，苏醒（四）_遗忘之路支线
{
     delay = 2000,
     [1] = {
                  txt = _t"是谁如此无礼？！",
                  name = _t"海斗士灵魂",
                  img = "res\\portrait\\怪物海斗士杂兵壮（鳍半透明.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2703] =        ---一大波海妖_遗忘之路支线
{
     delay = 3000,
     [1] = {
                  txt = _t"就在这里等着好了，等一下那一大波海妖就会来，嘿嘿嘿嘿……",
                  name = _t"长老",
                  img = "res\\portrait\\遗忘之村村长.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3078] =        ---海盗王的宝藏（五）_遗忘之路支线
{
     delay = 2000,
     [1] = {
                  txt = _t"嗷嗷嗷嗷！！！！！！！",
                  name = _t"宝藏看守兽",
                  img = "res\\portrait\\圣域战神圣蛇.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2716] =        ---至强之剑（三）_遗忘之路支线
{
     delay = 2000,
     [1] = {
                  txt = _t"剑……断掉了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2717] =        ---至强之剑（六）_遗忘之路支线
{
     delay = 3000,
     [1] = {
                  txt = _t"又断了！问题一定不在这里。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2721] =        ---美人鱼（四）_遗忘之路支线
{
     delay = 2000,
     [1] = {
                  txt = _t"海中出现了一头海兽！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2722] =        ---美人鱼（四）_遗忘之路支线
{
     delay = 2000,
     [1] = {
                  txt = _t"海兽送来了什么？我去看看。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2424] =        ---_激斗！黄金十二宫！
{
     delay = 4000,
     [1] = {
                  txt = _t"这些奇怪的光是怎么回事？这是哪里？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"那位大人有令，擅闯十二宫者，杀！",
                  name = _t"卫兵队长",
                  img = "res\\portrait\\圣域杂兵壮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[147] =        ---_激斗！黄金十二宫！
{
     delay = 2500,
     [1] = {
                  txt = _t"没有人能走出这个次元。",
                  name = _t"卫兵队长",
                  img = "res\\portrait\\圣域杂兵壮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"天魔降伏！！！",
                  name = _t"沙加",
                  img = "res\\portrait\\黄金圣斗士处女座沙加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[148] =        ---_激斗！黄金十二宫！
{
     delay = 2500,
     [1] = {
                  txt = _t"是处女宫的沙加救了我？那些光都不见了。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"总之，先前往金牛宫吧。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2666] =        ---英雄的梦想（一）_遗忘之路支线
{
     delay = 3000,
     [1] = {
                  txt = _t"我愿意~~~~~~",
                  name = _t"涅菲德娅",
                  img = "res\\portrait\\庐山村民老妇人.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[149] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"这里难道是……异次元空间！？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[150] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"别以为穿上了那件可笑的圣衣就妄想能够战胜我！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"什……么？你竟然领悟了新的招数？",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"没错！我一定会打败你！燃烧吧！小宇宙！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[151] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"别以为穿上了那件可笑的圣衣就妄想能够战胜我！",
                  name = _t"卡妙",
                  img = "res\\portrait\\黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"什……么？你竟然领悟了新的招数？",
                  name = _t"卡妙",
                  img = "res\\portrait\\黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"没错！我一定会打败你！燃烧吧！小宇宙！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[152] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"别以为穿上了那件可笑的圣衣就妄想能够战胜我！",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座迪斯马斯克.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"什……么？你竟然领悟了新的招数？",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座迪斯马斯克.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"没错！我一定会打败你！燃烧吧！小宇宙！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[153] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"别以为穿上了那件可笑的圣衣就妄想能够战胜我！",
                  name = _t"阿布罗狄",
                  img = "res\\portrait\\黄金圣斗士双鱼座阿布罗狄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"什……么？你竟然领悟了新的招数？",
                  name = _t"阿布罗狄",
                  img = "res\\portrait\\黄金圣斗士双鱼座阿布罗狄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"没错！我一定会打败你！燃烧吧！小宇宙！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[154] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"别以为穿上了那件可笑的圣衣就妄想能够战胜我！",
                  name = _t"沙加",
                  img = "res\\portrait\\黄金圣斗士处女座沙加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"什……么？你竟然领悟了新的招数？",
                  name = _t"沙加",
                  img = "res\\portrait\\黄金圣斗士处女座沙加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"没错！我一定会打败你！燃烧吧！小宇宙！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2915] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"哈哈哈！没人可以从这里走出去！",
                  name = _t"黑发金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2916] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"绝望吧！不要再做徒劳无益的事情了！",
                  name = _t"黑发金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2917] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"你终将葬身于此！",
                  name = _t"黑发金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2918] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"听着，你并不存在，你只是我内心罪恶的幻象，只有消灭你我才能走出这里！",
                  name = _t"你的幻象",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这不可能，你才是虚幻的！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2921] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"你擅闯观星楼，让圣衣蒙羞，你要为你的罪孽付出代价！死吧！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"是的，我是罪人，我是罪人……我必须死。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不要相信他，你看到的只是幻象！！！",
                  name = _t"蓝发金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"幻象？没错，我是为了守护圣域才进入观星楼，我没有让圣衣蒙羞！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"我还要留着这具身躯守卫雅典娜，我怎么能死在这种地方！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2926] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"哈哈哈！没人可以从这里走出去！",
                  name = _t"黑发金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2927] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"绝望吧！不要再做徒劳无益的事情了！",
                  name = _t"黑发金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2928] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"你终将葬身于此！",
                  name = _t"黑发金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2929] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"听着，你并不存在，你只是我内心罪恶的幻象，只有消灭你我才能走出这里！",
                  name = _t"你的幻象",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这不可能，你才是虚幻的！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2932] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"你擅闯观星楼，让圣衣蒙羞，你要为你的罪孽付出代价！死吧！",
                  name = _t"卡妙",
                  img = "res\\portrait\\黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"是的，我是罪人，我是罪人……我必须死。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不要相信他，你看到的只是幻象！！！",
                  name = _t"蓝发金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"幻象？没错，我是为了守护圣域才进入观星楼，我没有让圣衣蒙羞！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"我还要留着这具身躯守卫雅典娜，我怎么能死在这种地方！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2937] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"哈哈哈！没人可以从这里走出去！",
                  name = _t"黑发金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2938] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"绝望吧！不要再做徒劳无益的事情了！",
                  name = _t"黑发金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2939] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"你终将葬身于此！",
                  name = _t"黑发金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2940] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"听着，你并不存在，你只是我内心罪恶的幻象，只有消灭你我才能走出这里！",
                  name = _t"你的幻象",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这不可能，你才是虚幻的！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2943] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"你擅闯观星楼，让圣衣蒙羞，你要为你的罪孽付出代价！死吧！",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座迪斯马斯克.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"是的，我是罪人，我是罪人……我必须死。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不要相信他，你看到的只是幻象！！！",
                  name = _t"蓝发金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"幻象？没错，我是为了守护圣域才进入观星楼，我没有让圣衣蒙羞！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"我还要留着这具身躯守卫雅典娜，我怎么能死在这种地方！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2948] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"哈哈哈！没人可以从这里走出去！",
                  name = _t"黑发金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2949] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"绝望吧！不要再做徒劳无益的事情了！",
                  name = _t"黑发金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2950] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"你终将葬身于此！",
                  name = _t"黑发金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2951] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"听着，你并不存在，你只是我内心罪恶的幻象，只有消灭你我才能走出这里！",
                  name = _t"你的幻象",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这不可能，你才是虚幻的！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2954] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"你擅闯观星楼，让圣衣蒙羞，你要为你的罪孽付出代价！死吧！",
                  name = _t"阿布罗狄",
                  img = "res\\portrait\\黄金圣斗士双鱼座阿布罗狄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"是的，我是罪人，我是罪人……我必须死。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不要相信他，你看到的只是幻象！！！",
                  name = _t"蓝发金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"幻象？没错，我是为了守护圣域才进入观星楼，我没有让圣衣蒙羞！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"我还要留着这具身躯守卫雅典娜，我怎么能死在这种地方！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2959] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"哈哈哈！没人可以从这里走出去！",
                  name = _t"黑发金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2960] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"绝望吧！不要再做徒劳无益的事情了！",
                  name = _t"黑发金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2961] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"你终将葬身于此！",
                  name = _t"黑发金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2962] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"听着，你并不存在，你只是我内心罪恶的幻象，只有消灭你我才能走出这里！",
                  name = _t"你的幻象",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这不可能，你才是虚幻的！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2965] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"你擅闯观星楼，让圣衣蒙羞，你要为你的罪孽付出代价！死吧！",
                  name = _t"沙加",
                  img = "res\\portrait\\黄金圣斗士处女座沙加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"是的，我是罪人，我是罪人……我必须死。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不要相信他，你看到的只是幻象！！！",
                  name = _t"蓝发金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"幻象？没错，我是为了守护圣域才进入观星楼，我没有让圣衣蒙羞！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"我还要留着这具身躯守卫雅典娜，我怎么能死在这种地方！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3505] =        ---玩家pk艾德喊话用1_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"这就是圣域天才候补生的实力吗？不过，艾德！我绝不会输给你！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"%s很好，就是这股气势！站起来，我知道这绝不是你全部的实力！",
                  name = _t"艾德",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3506] =        ---玩家pk艾德喊话用2_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"这就是你全部的实力吗？你太让我失望了！",
                  name = _t"艾德",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"燃烧你的小宇宙吧！否则你根本不是我的对手！",
                  name = _t"艾德",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2977] =        ---圣斗士的斗技_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"将你的力量集中起来！将你体内的一切集中在精神之上！！",
                  name = _t"魔铃",
                  img = "res\\portrait\\魔铃.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"集中到你要破坏的那一点上！粉碎那些石块！！",
                  name = _t"魔铃",
                  img = "res\\portrait\\魔铃.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3004] =        ---战斗修行_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"呜哈哈哈，星矢呢，快让他出来！",
                  name = _t"卡西欧士",
                  img = "res\\portrait\\卡西欧士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"是不是已经吓得逃离圣域了！呜哈哈哈……",
                  name = _t"卡西欧士",
                  img = "res\\portrait\\卡西欧士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"卡西欧士，星矢不在这里。这次你们的对手是我。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5629] =        ---战斗修行_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"我们走！",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\莎尔娜.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哼，这次算你们走运！替我告诉星矢，这次我一定要将他的头拧下来！呜哈哈……",
                  name = _t"卡西欧士",
                  img = "res\\portrait\\卡西欧士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3335] =        ---阳光一样的男人_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"这……好奇怪的感觉！就像灵魂在燃烧一样！这就是小宇宙的力量吗？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2984] =        ---开始！圣衣竞技赛_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"快，我们快走，圣衣竞技赛已经开始了！",
                  name = _t"星矢",
                  img = "res\\portrait\\星矢圣域便装版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"星矢，等等我……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2987] =        ---为了爱与正义_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"为了爱与正义！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [2] = {
                  txt = _t"我宣誓用自己的生命来守护雅典娜！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"很好！%s，以雅典娜之名，我在此宣布你成为新的圣斗士！",
                  name = _t"教皇",
                  img = "res\\portrait\\教皇.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3336] =        ---艾德之死_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"这里就是艾德的房间？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"希望艾德有留下一些线索……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3011] =        ---艾德之死_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"这里没什么奇怪的……咦？那个桌子上，好像放了一本日记。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3012] =        ---日记中的线索_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"星矢一直和艾德在沙滩修行，也许他会知道艾德最近的行踪。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3014] =        ---承载荣耀的圣地_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"怎么回事？这些候补生为什么都昏倒在这里？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"救命！救命！！",
                  name = _t"圣斗士候补生",
                  img = "res\\portrait\\圣域圣斗士女学员艾亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2992] =        ---墓地中的小宇宙_群星之地
{
     delay = 4000,
     [1] = {
                  txt = _t"难怪艾德会经常到这里来。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这里沉睡着圣域的英雄。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"只有在这里，我才可以体会到圣斗士不屈的意志！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3017] =        ---墓地中的小宇宙_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"咦，这是……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2994] =        ---圣战之墙_群星之地
{
     delay = 5000,
     [1] = {
                  txt = _t"裂隙就在圣战之墙那里，你要小心！",
                  name = _t"圣斗士英灵",
                  img = "res\\portrait\\圣斗士英灵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3019] =        ---圣战之墙_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"这里就是裂隙？里面似乎有股邪恶的力量，周围的守卫都昏倒了。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"艾德就是从这里进去后就……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3455] =        ---伪装潜入_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"这里的巡逻守卫好像变多了，我得想点办法才行。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"对了，我可以点燃圣战之墙下面的枯树，吸引守卫们的注意。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4067] =        ---禁地！观星楼_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"从这里应该可以爬上观星楼。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3023] =        ---禁地！观星楼_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"这是？怎么可能！！！冥界的人居然会出现在观星楼！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"糟糕，有个圣斗士跑上来了，快去通知暗影大人！",
                  name = _t"",
                  img = "res\\portrait\\冥界杂兵近战瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3025] =        ---冥界阴谋？_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"冥界的人到底在这里找什么东西？这会不会和艾德的变化有关？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3026] =        ---冥界阴谋？_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"他们似乎是在找关于冥王神血的消息。到二楼看看。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3027] =        ---冥界阴谋？_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"艾……艾德！！这怎么可能！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2986] =        ---圣斗士的荣耀_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"艾德，这场战斗我已经期待了很久！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"我一定会打败你，成为守护雅典娜的圣斗士！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"哈哈哈，来吧！拿出你全部的实力，无论我们谁会赢。",
                  name = _t"艾德",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"我相信只有最强的人才有资格守护雅典娜！",
                  name = _t"艾德",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2597] =        ---瓶中的女人（二）_遗忘之路支线
{
     delay = 3000,
     [1] = {
                  txt = _t"命运女神，让我死掉吧！！！！！！！",
                  name = _t"诡异的瓶子",
                  img = "res\\portrait\\",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2732] =        ---作证_遗忘之路支线
{
     delay = 3000,
     [1] = {
                  txt = _t"我为这2人证明，他们将谨守诺言，永世不悔！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2687] =        ---命运之线（四）_
{
     delay = 5000,
     [1] = {
                  txt = _t"你已经破解了过去的迷惘。现在睁开眼睛看看你所在的这个世界吧。",
                  name = _t"过去女神",
                  img = "res\\portrait\\命运三女神幻象3.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3164] =        ---圣域的花朵_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"圣斗士大人，你好！我是尤朵拉，一名立志成为圣斗士的候补生。",
                  name = _t"尤朵拉",
                  img = "res\\portrait\\圣域圣斗士女学员艾亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[3165] =        ---充满荣光之路_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"嘿嘿！看看我们谁能先到圣城！",
                  name = _t"尤朵拉",
                  img = "res\\portrait\\圣域圣斗士女学员艾亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哇！你跑的好快！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"嘿！等等我啊！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3166] =        ---充满荣光之路_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"嘻嘻，你的速度很快嘛！",
                  name = _t"尤朵拉",
                  img = "res\\portrait\\圣域圣斗士女学员艾亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"呼……呼……你跑的也不慢啊！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3168] =        ---黄金狮子_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"这就是黄金圣斗士艾欧里亚大人，我曾在圣衣争夺场上见过他。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3177] =        ---第一个任务_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"嗨！看你神色匆忙的样子，教皇大人给你委派了什么紧急的任务？",
                  name = _t"尤朵拉",
                  img = "res\\portrait\\圣域圣斗士女学员艾亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[3178] =        ---失踪的候补生_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"尤朵拉妹妹，刚才，你们说的是真的吗？",
                  name = _t"尤丽缇丝",
                  img = "res\\portrait\\尤丽缇丝.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[3183] =        ---天琴座的奥路菲_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"奥路菲大人……！",
                  name = _t"尤丽缇丝",
                  img = "res\\portrait\\尤丽缇丝.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [2] = {
                  txt = _t"尤丽缇丝，你怎么来了！这里很危险，你应该立刻返回圣城！",
                  name = _t"奥路菲",
                  img = "res\\portrait\\白银圣斗士天琴座奥路菲.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不，我要和奥路菲大人在一起！",
                  name = _t"尤丽缇丝",
                  img = "res\\portrait\\尤丽缇丝.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[3184] =        ---森林中的阴影_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"奥路菲大人，您不能让我在这里等待，而您却孤身犯险……",
                  name = _t"尤丽缇丝",
                  img = "res\\portrait\\尤丽缇丝.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"尤丽缇丝，身为一个圣斗士，我必须对失踪的候补生们负责！",
                  name = _t"奥路菲",
                  img = "res\\portrait\\白银圣斗士天琴座奥路菲.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"放心吧，我不会有事的！在这里等我，我很快就会回来！",
                  name = _t"奥路菲",
                  img = "res\\portrait\\白银圣斗士天琴座奥路菲.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3186] =        ---森林中的阴影_新版圣域
{
     delay = 5000,
     [1] = {
                  txt = _t"哎？是那个在路边帮朋友征集幸福的黑衣少女？她怎么走进了失落森林？万一她遇到危险怎么办？我应该追上去把她带回候补生训练营！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3190] =        ---黑衣人_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"救命啊！有人吗？谁来救救我啊！你们不要过来……",
                  name = _t"黑衣少女",
                  img = "res\\portrait\\潘多拉空手.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"不好！那个黑衣少女遇到了危险！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[3193] =        ---奥路菲的计划_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"奥路菲大人，对不起，我偷偷跟在这位圣斗士大人身后，赶了过来。",
                  name = _t"尤丽缇丝",
                  img = "res\\portrait\\尤丽缇丝.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"尤丽缇丝！你来这里做什么？赶快回去！",
                  name = _t"奥路菲",
                  img = "res\\portrait\\白银圣斗士天琴座奥路菲.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3196] =        ---奥路菲的计划_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"这就是雅典娜封印的碎片吗？……奇怪，附近有一个温暖而正义的小宇宙，是谁在这里？ ",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这么长的时间……我终于再次苏醒，再次感受到澎湃的战意和友好的小宇宙。",
                  name = _t"罗德里奥",
                  img = "res\\portrait\\圣斗士英灵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3198] =        ---英灵！先代天马座！_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"做得不错，现在你去触摸远古之柱，感受天马圣衣的灵魂！",
                  name = _t"罗德里奥",
                  img = "res\\portrait\\圣斗士英灵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这位前辈身上散发出强烈的充满正义感的小宇宙！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3199] =        ---英灵！先代天马座！_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"这个圣衣碎片，闪烁着星一样的光芒，上面还有一滴神秘的血痕，这种高贵庄严的气质简直是令人心折，这是什么圣衣的碎片？ ",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"你的表现非常完美！我相信，是雅典娜女神的指引让我找到了你！",
                  name = _t"罗德里奥",
                  img = "res\\portrait\\圣斗士英灵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3201] =        ---目标！冥王神血！_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"这里被冥界士兵占据了！他们来这里一定是为了寻找冥王神血的，我得清除掉这些障碍！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3203] =        ---目标！冥王神血！_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"太好了！这里也有雅典娜封印的碎片！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3205] =        ---目标！冥王神血！_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"站住！把冥王神血交出来！",
                  name = _t"阿历克斯",
                  img = "res\\portrait\\圣斗士学员阿历克斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"一个圣斗士候补生？你是谁？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"哼！我就是你们要找的阿历克斯。",
                  name = _t"阿历克斯",
                  img = "res\\portrait\\圣斗士学员阿历克斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3207] =        ---圣域背叛者_新版圣域
{
     delay = 5000,
     [1] = {
                  txt = _t"我不会放弃的！什么女神，什么正义和爱，都是废话！",
                  name = _t"阿历克斯",
                  img = "res\\portrait\\圣斗士学员阿历克斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"你不懂得最强的力量就是爱，要学会爱才会拥有真正的力量吗？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"少废话！我恨透了你们这些自以为是的家伙！以后我们还会战斗的！",
                  name = _t"阿历克斯",
                  img = "res\\portrait\\圣斗士学员阿历克斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"混蛋！居然让他跑了。不过现在不是追他的时候，我得尽快向罗德里奥复命！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3349] =        ---雅典娜封印_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"消，消失了！！！！他到底是谁？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3216] =        ---天空中的阴影_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"年轻的圣斗士啊，慢些走！我需要你的帮助！",
                  name = _t"车田老师",
                  img = "res\\portrait\\城户光政.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"一个慈祥的老者？过去听听他有什么话说。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3223] =        ---沙加！最接近神的人！_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"可恶的冥蝮蛇，别想染指我的家园！",
                  name = _t"尤朵拉",
                  img = "res\\portrait\\圣域圣斗士女学员艾亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"尤朵拉！你怎么在这里？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3229] =        ---冥王神血的秘密_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"幸好雅典娜封印结界没有出什么意外！我还是赶紧去找艾欧里亚大人吧！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3240] =        ---风的记忆_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"项链上有一股暖流应和着我的小宇宙，这暖流包含着思念、牵挂和温柔博大的亲情。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"就好象姐姐的呵护，又好象是永无休止的寻找，在呵护中夹杂着无尽的忧伤期盼。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"她到底是谁？她去了哪里？我得用小宇宙捕捉她的信息，依靠项链的指引继续寻找。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3241] =        ---风的记忆_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"小宇宙的线索指引到这里就断了……咦？地上有个小皮包。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3248] =        ---失忆少女_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"前方穿白衣服的少女……就是她了，一定就是毕庇斯老爷爷的养女！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3257] =        ---射手的遗物_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"喂！这里是禁地！非请勿入！",
                  name = _t"加米安",
                  img = "res\\portrait\\白银乌鸦座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"你是谁？（刚刚卖我面包的那个人！）",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"本大爷是乌鸦星座的加米安！受命看管这里！兄弟们，攻击！",
                  name = _t"加米安",
                  img = "res\\portrait\\白银乌鸦座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3258] =        ---射手的遗物_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"加米安大人！加米安大人！不好啦！",
                  name = _t"尤朵拉",
                  img = "res\\portrait\\圣域圣斗士女学员艾亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这不是尤朵拉妹妹吗？出了什么事情？",
                  name = _t"加米安",
                  img = "res\\portrait\\白银乌鸦座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"您收集的那些准备喂乌鸦吃的草料种子，都被人拿走了！",
                  name = _t"尤朵拉",
                  img = "res\\portrait\\圣域圣斗士女学员艾亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"什么？谁这么大胆，敢动本大爷的东西！我去看看！",
                  name = _t"加米安",
                  img = "res\\portrait\\白银乌鸦座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3261] =        ---尘封的十三年_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"这里有三个土堆，那个才是射手座埋藏宝物的土堆呢？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"时间紧迫，挖开一个看看吧！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3265] =        ---盗火者神器_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"我已经很努力的燃烧小宇宙了，可惜什么也没有发生。难道是因为我的小宇宙还不够强大吗？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"远处传来的那声巨响！！糟了，莫非是罗德里奥村发生了什么变故？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3269] =        ---黑暗的伪装_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"尤朵拉！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3271] =        ---罗德里奥村惨剧！_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"尤朵拉，坚持住！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3272] =        ---罗德里奥村惨剧！_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"尤朵拉，保持呼吸！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3273] =        ---罗德里奥村惨剧！_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"尤朵拉，坚持住！你可以的！你不能死！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3276] =        ---幸存者？_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"这……结界果然被破坏了！！！阿历克斯，我一定不会饶过你！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3279] =        ---以战之名_新版圣域
{
     delay = 5000,
     [1] = {
                  txt = _t"我必须将这里发生的一切，立刻汇报给教皇！哪怕，需要我强闯十二宫！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3286] =        ---骗局！_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"原来破坏了雅典娜封印结界的就是这个冥界刺客！可毕庇斯的养女到底在哪？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3287] =        ---骗局！_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"哼哼！你总是这么姗姗来迟！",
                  name = _t"阿历克斯",
                  img = "res\\portrait\\圣斗士学员阿历克斯冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"阿历克斯！是你！我要杀了你！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3289] =        ---阿历克斯！冥界战士！_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"怎么回事？你的力量居然变得这么强大。",
                  name = _t"阿历克斯",
                  img = "res\\portrait\\圣斗士学员阿历克斯冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"不过圣域的好日子就快到头了！我们已经取得了火种，如今冥王大人的神衣正在锻炼之中！哈哈哈！有本事就来狂脊之巅吧！",
                  name = _t"阿历克斯",
                  img = "res\\portrait\\圣斗士学员阿历克斯冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"可恶！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3291] =        ---阿历克斯！冥界战士！_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"那边有个人！我见过他，是艾欧里亚身边的侍从！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"他睡着了？喂！醒一醒！别睡了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3294] =        ---睡神结界_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"居然是你！破坏了睡神结界的，竟然是传说中的普罗米修斯之锤！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3301] =        ---狂脊之巅的战斗_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"与神的战斗不可避免。我们黄金圣斗士不会惧怕任何敌人！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3305] =        ---决战！死亡与长眠_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"情况不妙，大人的神衣遭到攻击！必须立刻撤退！",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉空手.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"大人的神衣得到足够的煅烧了吗？他们竟然可以破坏大人的神衣？",
                  name = _t"达拿都斯",
                  img = "res\\portrait\\死神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"可恶！千算万算，居然没有算到这一步！",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉空手.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"真可惜……",
                  name = _t"修普诺斯",
                  img = "res\\portrait\\冥斗士睡神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"冥王神衣消失了！！！那边倒在地上的是……罗德里奥村的失忆少女？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[160] =        ---_十二宫-金牛宫
{
     delay = 4000,
     [1] = {
                  txt = _t"就凭你们，区区青铜圣斗士，别妄想再前进一步！",
                  name = _t"阿鲁迪巴",
                  img = "res\\portrait\\黄金圣斗士金牛座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [2] = {
                  txt = _t"可恶！身体动弹不了了！小宇宙，在消褪……",
                  name = _t"星矢",
                  img = "res\\portrait\\天马.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [3] = {
                  txt = _t"金牛宫的战斗已经开始了，我们得抓紧行动！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [4] = {
                  txt = _t"大家一定小心，阿鲁迪巴可是一个狠角色，传说他的绝招泰坦新星，至今无人可挡！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[161] =        ---_十二宫-金牛宫
{
     delay = 3000,
     [1] = {
                  txt = _t"可怕的蛮力！他的力量还在不断的增强！",
                  name = _t"星矢",
                  img = "res\\portrait\\天马.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"哈哈哈……让你们见识一下黄金圣斗士的实力！",
                  name = _t"阿鲁迪巴",
                  img = "res\\portrait\\黄金圣斗士金牛座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"只有孤注一掷，发动光速天马流星拳，才能有获胜的希望。",
                  name = _t"童虎老师",
                  img = "res\\portrait\\童虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [4] = {
                  txt = _t"无论如何都不要放弃，你们周围充满了小宇宙的能量，利用它们，帮助星矢燃烧更为强大的小宇宙！",
                  name = _t"雅典娜",
                  img = "res\\portrait\\圣斗士_雅典娜.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[162] =        ---_风暴亚特兰蒂斯
{
     delay = 5000,
     [1] = {
                  txt = _t"时间到了，我们没能完成狄蒂丝大人的任务，现在不需要再做无谓的牺牲了，我们准备撤吧！",
                  name = _t"邪恶术士士兵",
                  img = "res\\portrait\\堕落炼金术士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[163] =        ---_风暴亚特兰蒂斯
{
     delay = 4000,
     [1] = {
                  txt = _t"不知死活的东西，凭你们也敢来阻挡我！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[3189] =        ---黑衣人_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"黑色衣服？是什么意思呢……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3172] =        ---圣斗士的誓言_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"脑袋晕沉沉的，刚才发生了什么……？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"眼前这神秘的光芒是……？我感觉到一种呼唤……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[3192] =        ---隐匿的危险_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"谢谢你，圣斗士大人，我这就回圣城，不用担心我。",
                  name = _t"黑衣少女",
                  img = "res\\portrait\\潘多拉空手.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3195] =        ---奥路菲的计划_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"按奥路菲大人说的，我们分头寻找封印碎片，我先到旁边这处遗迹看看。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"你要小心。",
                  name = _t"奥路菲",
                  img = "res\\portrait\\白银圣斗士天琴座奥路菲.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3213] =        ---雅典娜封印_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"那边好像有人！是谁？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3242] =        ---风的记忆_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"神殿门口有个老乞丐正在晒太阳，也许他能提供一些新的线索。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3453] =        ---圣战之墙_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"这里是……观星楼！！这不可能！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"怎么才能进去呢？……有了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[164] =        ---_风暴亚特兰蒂斯
{
     delay = 7000,
     [1] = {
                  txt = _t"感谢你们救了我，我想我现在安全了，下面的探险我就不再去了；我这里有些东西，都是我在以往的探险中发现的，也许你们能用到，快来看一看吧！",
                  name = _t"遗迹探险家普尔斯",
                  img = "res\\portrait\\圣斗士学院阿历克斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3290] =        ---阿历克斯！冥界战士！_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"这就是普罗米修斯之锤！我终于得到它了！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3262] =        ---尘封的十三年_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"这块石头！一定就是普罗米修斯神石了。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2978] =        ---战斗修行_出生地
{
     delay = 3000,
     [1] = {
                  txt = _t"修行场就在山下。你可以双击方向键，这样能跟快的跑到那里。",
                  name = _t"魔铃",
                  img = "res\\portrait\\魔铃.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[165] =        ---_圣战回忆
{
     delay = 7000,
     [1] = {
                  txt = _t"我的圣斗士们，为了正义与大地，燃烧小宇宙吧！",
                  name = _t"雅典娜",
                  img = "res\\portrait\\圣斗士_雅典娜.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[166] =        ---_开启黄泉之井
{
     delay = 3000,
     [1] = {
                  txt = _t"封印碎片的气息出现在金穗花田，不过我感觉到有些不安，你还是不要跟我去了。",
                  name = _t"奥路菲",
                  img = "res\\portrait\\白银圣斗士天琴座奥路菲.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"不用担心我，有您在身边，我什么都不怕。",
                  name = _t"尤丽缇丝",
                  img = "res\\portrait\\尤丽缇丝.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"什么！冥界的人居然入侵到了这里！",
                  name = _t"奥路菲",
                  img = "res\\portrait\\白银圣斗士天琴座奥路菲.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[167] =        ---_开启黄泉之井
{
     delay = 3000,
     [1] = {
                  txt = _t"什么！有冥界的人！尤丽缇丝你不要跟过来，让我收拾掉他们！",
                  name = _t"奥路菲",
                  img = "res\\portrait\\白银圣斗士天琴座奥路菲.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"奥路菲大人，您也要小心……",
                  name = _t"尤丽缇丝",
                  img = "res\\portrait\\尤丽缇丝.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3527] =        ---消灭冥界喽啰_开启黄泉之井
{
     delay = 3000,
     [1] = {
                  txt = _t"只是几个小喽啰，看来我的担心有点多余了。",
                  name = _t"奥路菲",
                  img = "res\\portrait\\白银圣斗士天琴座奥路菲.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"奥路菲大人，前面好美啊！这里的花好像排成了心型啊！难道是我的错觉吗？",
                  name = _t"尤丽缇丝",
                  img = "res\\portrait\\尤丽缇丝.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[168] =        ---_开启黄泉之井
{
     delay = 3000,
     [1] = {
                  txt = _t"奥路菲大人，这里好美啊！",
                  name = _t"尤丽缇丝",
                  img = "res\\portrait\\尤丽缇丝.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[169] =        ---_开启黄泉之井
{
     delay = 3000,
     [1] = {
                  txt = _t"奥路菲大人，您能为我弹奏一曲吗？",
                  name = _t"尤丽缇丝",
                  img = "res\\portrait\\尤丽缇丝.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[170] =        ---_开启黄泉之井
{
     delay = 3000,
     [1] = {
                  txt = _t"啊，好多蛇！",
                  name = _t"尤丽缇丝",
                  img = "res\\portrait\\尤丽缇丝.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"不要怕，我来赶走这些蛇。",
                  name = _t"奥路菲",
                  img = "res\\portrait\\白银圣斗士天琴座奥路菲.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3533] =        ---_开启黄泉之井
{
     delay = 3000,
     [1] = {
                  txt = _t"这里怎么会出现这么多冥蝮蛇？我得赶紧找到封印碎片。",
                  name = _t"奥路菲",
                  img = "res\\portrait\\白银圣斗士天琴座奥路菲.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[171] =        ---_开启黄泉之井
{
     delay = 3000,
     [1] = {
                  txt = _t"奥路菲大人，小心！",
                  name = _t"尤丽缇丝",
                  img = "res\\portrait\\尤丽缇丝.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"尤丽缇丝！！！",
                  name = _t"奥路菲",
                  img = "res\\portrait\\白银圣斗士天琴座奥路菲.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3569] =        ---_狮子的遭遇
{
     delay = 3000,
     [1] = {
                  txt = _t"这里果然也有冥界的势力！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"嗯？圣斗士？宰了他！",
                  name = _t"冥界士兵",
                  img = "res\\portrait\\冥界杂兵近战2.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3574] =        ---_狮子的遭遇
{
     delay = 3000,
     [1] = {
                  txt = _t"什么虫子居然这么大胆！",
                  name = _t"达拿都斯",
                  img = "res\\portrait\\死神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"冥界的死神！？",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"啊，一个黄金圣斗士，难怪我的小玩具打不过你。",
                  name = _t"达拿都斯",
                  img = "res\\portrait\\死神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"不过随意弄坏我的玩具，我可要生气了。",
                  name = _t"达拿都斯",
                  img = "res\\portrait\\死神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3576] =        ---_狮子的遭遇
{
     delay = 5000,
     [1] = {
                  txt = _t"你们这些冥界的走狗，到圣域来有什么阴谋！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"阴谋？真是愚蠢的人类，神的意志岂是你这种蝼蚁可以揣摩的！！！啊，你非常非常幸运，居然可以被我亲手杀死。",
                  name = _t"达拿都斯",
                  img = "res\\portrait\\死神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[173] =        ---_开启黄泉之井
{
     delay = 3000,
     [1] = {
                  txt = _t"据说只有领悟小宇宙第八感的圣斗士才能活着进入冥界。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"难道……奥路菲已经领悟了第八感？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"难道圣域的传言是真的？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"奥路菲大人……拥有足以媲美黄金圣斗士的实力！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3584] =        ---_狮子的遭遇
{
     delay = 5000,
     [1] = {
                  txt = _t"你不可能再前进一步！这里就是你的墓地！",
                  name = _t"冥界士兵",
                  img = "res\\portrait\\冥界杂兵近战2.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[174] =        ---_狮子的遭遇
{
     delay = 5000,
     [1] = {
                  txt = _t"你就这么点水平吗？真的好无聊，现在，去死吧！",
                  name = _t"达拿都斯",
                  img = "res\\portrait\\死神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[175] =        ---_狮子的遭遇
{
     delay = 5000,
     [1] = {
                  txt = _t"你听见了吗？死亡的声音！",
                  name = _t"达拿都斯",
                  img = "res\\portrait\\死神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[176] =        ---_狮子的遭遇
{
     delay = 5000,
     [1] = {
                  txt = _t"好厉害，我……我……还活着吗？",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"我什么时候变得这么仁慈了，刚才的一击居然没杀死你这个小虫子，可恶的蟑螂，这一次你不会再这么幸运了！！！",
                  name = _t"达拿都斯",
                  img = "res\\portrait\\死神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[177] =        ---_狮子的遭遇
{
     delay = 3000,
     [1] = {
                  txt = _t"达拿都斯，你又在跟虫子玩无聊的游戏了。",
                  name = _t"修普诺斯",
                  img = "res\\portrait\\冥斗士睡神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"修普诺斯？你居然也来了。这不是一个普通的虫子。",
                  name = _t"达拿都斯",
                  img = "res\\portrait\\死神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"是吗？我倒是想看看他有什么本事。",
                  name = _t"修普诺斯",
                  img = "res\\portrait\\冥斗士睡神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"陷入无尽的沉眠吧，无尽沉眠！",
                  name = _t"修普诺斯",
                  img = "res\\portrait\\冥斗士睡神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[178] =        ---_狮子的遭遇
{
     delay = 3000,
     [1] = {
                  txt = _t"黄金圣斗士……不会这么轻易就被你们打败的！！！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这个小虫子果然有趣，看样子再漫不经心就要有辱我们神的威严了。",
                  name = _t"修普诺斯",
                  img = "res\\portrait\\冥斗士睡神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"永恒的安眠！！！",
                  name = _t"修普诺斯",
                  img = "res\\portrait\\冥斗士睡神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[179] =        ---_狮子的遭遇
{
     delay = 3000,
     [1] = {
                  txt = _t"修普诺斯，你太仁慈了！",
                  name = _t"达拿都斯",
                  img = "res\\portrait\\死神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这种小虫子对于我们的计划不会有任何影响的。",
                  name = _t"修普诺斯",
                  img = "res\\portrait\\冥斗士睡神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"随便你，总之下次我不会再留下任何活口。",
                  name = _t"达拿都斯",
                  img = "res\\portrait\\死神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[180] =        ---_圣战回忆
{
     delay = 7000,
     [1] = {
                  txt = _t"冥界的敌人正在进犯圣域！击退敌人，保卫圣域！",
                  name = _t"童虎",
                  img = "res\\portrait\\天秤座童虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"战场上空出现了死神和睡神的巨大幻象。冲破敌阵，设法破除这些幻象。",
                  name = _t"史昂",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[181] =        ---_圣战回忆
{
     delay = 7000,
     [1] = {
                  txt = _t"前面就是造成天空幻象的机关法阵，关闭这些机关来破除法阵！",
                  name = _t"史昂",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[182] =        ---_圣战回忆
{
     delay = 5000,
     [1] = {
                  txt = _t"你们已经破除了死神的幻象法阵，死神的幻象从天空消失了。",
                  name = _t"史昂",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[183] =        ---_圣战回忆
{
     delay = 5000,
     [1] = {
                  txt = _t"你们已经破除了睡神的幻象法阵，睡神的幻象从天空消失了。",
                  name = _t"史昂",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[184] =        ---_狮子的遭遇
{
     delay = 3000,
     [1] = {
                  txt = _t"来点小刺激吧！",
                  name = _t"达拿都斯",
                  img = "res\\portrait\\死神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[185] =        ---_狮子的遭遇
{
     delay = 5000,
     [1] = {
                  txt = _t"阿历克斯，现在住手还来得及，跟我回去圣域，祈求教皇大人的原谅。",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"圣域？圣斗士？哈哈，你以为我还多么稀罕这些东西吗，成不了圣域的圣斗士，就让圣域彻底毁灭！！！",
                  name = _t"阿历克斯",
                  img = "res\\portrait\\圣斗士学员阿历克斯冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[186] =        ---_狮子的遭遇
{
     delay = 3000,
     [1] = {
                  txt = _t"阿历克斯，不要再执迷不悟了，冥界只能将你引入黑暗。",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"黑暗？那也总比圣域的伪善来的光明正大！！！",
                  name = _t"阿历克斯",
                  img = "res\\portrait\\圣斗士学员阿历克斯冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"我要杀死你，艾欧里亚！！！",
                  name = _t"阿历克斯",
                  img = "res\\portrait\\圣斗士学员阿历克斯冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3570] =        ---_狮子的遭遇
{
     delay = 5000,
     [1] = {
                  txt = _t"前面那个人是谁？难道是……阿历克斯？",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3573] =        ---_狮子的遭遇
{
     delay = 5000,
     [1] = {
                  txt = _t"阿历克斯，你怎会在这里，你身上穿到是，冥衣？",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"艾欧里亚！圣域的狗，今天就是你的死期。",
                  name = _t"阿历克斯",
                  img = "res\\portrait\\圣斗士学员阿历克斯冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[240] =        ---_狮子的遭遇
{
     delay = 3000,
     [1] = {
                  txt = _t"死神你想逃走？",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"逃走？哈哈，我现在就杀了你！",
                  name = _t"达拿都斯",
                  img = "res\\portrait\\死神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"黑暗终结第四奏鸣曲！",
                  name = _t"达拿都斯",
                  img = "res\\portrait\\死神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[187] =        ---_大众战场
{
     delay = 6000,
     [1] = {
                  txt = _t"战斗将在30秒后开始，请做好准备！",
                  name = _t"阿鲁迪巴",
                  img = "res\\portrait\\黄金圣斗士金牛座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[188] =        ---_大众战场
{
     delay = 6000,
     [1] = {
                  txt = _t"战斗开始，女神的战士们呀！抢占有利的地势，向对手发起冲锋吧！",
                  name = _t"阿鲁迪巴",
                  img = "res\\portrait\\黄金圣斗士金牛座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[189] =        ---_大众战场
{
     delay = 6000,
     [1] = {
                  txt = _t"终极战斗任务将在1分钟后更新。向阿提卡的中心进发吧！女神神殿的争夺战在等待着你们！",
                  name = _t"阿鲁迪巴",
                  img = "res\\portrait\\黄金圣斗士金牛座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[190] =        ---_大众战场
{
     delay = 6000,
     [1] = {
                  txt = _t"终极战斗目标：守护女神神殿开启。通往神殿的传送通道已经打开。灵活运用你的战力和智慧，向女神证明你的实力吧！",
                  name = _t"阿鲁迪巴",
                  img = "res\\portrait\\黄金圣斗士金牛座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[191] =        ---_大众战场
{
     delay = 6000,
     [1] = {
                  txt = _t"真正的圣斗士绝不放弃希望！战斗将在1分钟后结束，燃烧你的小宇宙，发动最强的一击吧！",
                  name = _t"阿鲁迪巴",
                  img = "res\\portrait\\黄金圣斗士金牛座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[192] =        ---_十二宫-金牛宫
{
     delay = 5000,
     [1] = {
                  txt = _t"时间不多了!下一宫在等待着我们!为了雅典娜,就算碰到最后一丝力气,也绝不放弃!",
                  name = _t"星矢",
                  img = "res\\portrait\\天马.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2713] =        ---海盗王的宝藏（五）_遗忘之路支线
{
     delay = 5000,
     [1] = {
                  txt = _t"藏宝图指示到了这里，难道要跳上悬崖？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3081] =        ---鲜血的祭礼（一）_遗忘之路主线
{
     delay = 3000,
     [1] = {
                  txt = _t"看啊，是那个傻瓜多吉。",
                  name = _t"吉斯",
                  img = "res\\portrait\\圣域杂兵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哈哈哈，他还相信教皇？今天又赎了多少罪孽啊？",
                  name = _t"克劳萨",
                  img = "res\\portrait\\圣域杂兵瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"哈哈哈哈……",
                  name = _t"吉斯",
                  img = "res\\portrait\\圣域杂兵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"哈哈哈哈……",
                  name = _t"克劳萨",
                  img = "res\\portrait\\圣域杂兵瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"……",
                  name = _t"多吉",
                  img = "res\\portrait\\圣域老年助祭司.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3084] =        ---荒芜的重逢（二）_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"大人！圣斗士大人！",
                  name = _t"库巴",
                  img = "res\\portrait\\遗忘之路流放者2.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"……是在喊我的吗？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"当然当然！见到您太高兴了……来，过这里来。",
                  name = _t"库巴",
                  img = "res\\portrait\\遗忘之路流放者2.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3087] =        ---独行的孩子（一）_遗忘之路主线
{
     delay = 3000,
     [1] = {
                  txt = _t"那边是什么？……一个孩子？这种地方怎么会有小孩？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3089] =        ---叛徒的处刑（二）_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"住手！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3097] =        ---未来的脚步（一）_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"好难缠的家伙，这个怪物身上有一股异常深邃的小宇宙。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"那个是什么？似乎是小宇宙之源……我采来看看。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3101] =        ---孤独的神殿（一）_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"喂！老太婆，限期已经到了，把神殿让给大爷们住！",
                  name = _t"遗忘强盗",
                  img = "res\\portrait\\圣域杂兵瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"……",
                  name = _t"扫地老妇",
                  img = "res\\portrait\\圣域女性助祭司1.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"你这是什么态度！",
                  name = _t"遗忘强盗",
                  img = "res\\portrait\\圣域杂兵瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"不要管她，进神殿。",
                  name = _t"贾塞伦",
                  img = "res\\portrait\\圣域杂兵壮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"慢着！你们怎么能这样欺凌一个年长的女性！我是不会允许的！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3103] =        ---萧索的大地（一）_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"终于取得了胜利……咦，这家伙身上的标记怎么好象在哪儿见过……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3104] =        ---萧索的大地（二）_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"你终于来了！",
                  name = _t"高龙巴",
                  img = "res\\portrait\\富士山星之子学园孤儿女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3173] =        ---圣斗士的誓言_新版圣域
{
     delay = 2000,
     [1] = {
                  txt = _t"这个地方……为什么感觉这么熟悉！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[3175] =        ---守护！最高的使命_新版圣域
{
     delay = 5000,
     [1] = {
                  txt = _t"守护！是圣斗士的最高使命！我会牢记这一点。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[3200] =        ---目标！冥王神血！_新版圣域
{
     delay = 2000,
     [1] = {
                  txt = _t"罗德里奥前辈，我不会辜负你的期望！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"我会找到冥王神血，绝不会让它落入冥界手中！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"根据奥路菲大人的情报，第二块雅典娜封印碎片，应该也在那个位置。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[3222] =        ---沙加！最接近神的人！_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"艾欧里亚大人让我去罗德里奥村，他一定是发现了什么。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3268] =        ---黑暗的伪装_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"哈哈……你已经晚了……罗德里奥村……",
                  name = _t"渗透者",
                  img = "res\\portrait\\冥斗士杂兵远程女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"罗德里奥村……？发生了什么事情？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3129] =        ---沧桑的故园（一）_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"这里……就是射手艾欧罗斯生长的地方……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这么多年了，如此破败……对，我找些石料来修理一下。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3133] =        ---动荡的岁月（二）_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"不好了！不好了！",
                  name = _t"高龙巴",
                  img = "res\\portrait\\富士山星之子学园孤儿女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"怎么了？出了什么事？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3134] =        ---何处的正义（一）_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"那里是……那是？？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"是艾欧里亚大人！黄金狮子！他怎么会出现在这里？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3135] =        ---迷惑的狮子（一）_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"……突然消失了？？是用念力传送走了吧……这不像……我所认识的黄金狮子……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"他的小宇宙里有一种残忍的暴戾之气……这绝不是正常的艾奥里亚……咦？那是？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"是高龙巴！又出什么事情了？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"……不好了！有新的情况！",
                  name = _t"高龙巴",
                  img = "res\\portrait\\富士山星之子学园孤儿女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3136] =        ---时光的消逝（一）_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"住手！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3138] =        ---时光的消逝（三）_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"啊啊啊啊啊啊啊啊……这是怎样的小宇宙……出乎意料地强大……",
                  name = _t"潘恩",
                  img = "res\\portrait\\遗忘之村盗贼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"潘恩！你的骗局结束了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3139] =        ---最后的疯狂（一）_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"呼……终于结束了。且慢，这个人身上也有类似的标记……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这个标记我在海鸣之影和贾塞伦身上都看到过……这是什么意思？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3140] =        ---未来的萌芽（一）_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"这里……就是红石山崖，十三年前，艾欧罗斯死去的地方。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"前面……被一群人围着的是谁？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3142] =        ---昔日的战场_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"艾欧罗斯大人，虽然我还不知道十三年前的真相，但我相信你是正义的。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"……",
                  name = _t"希尔汗",
                  img = "res\\portrait\\庐山神秘怪人.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"……这是……这是？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"一个残留的小宇宙……充满温暖和光明……就在这一带……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"咦？一个黄金戒指……？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3144] =        ---圣域的传言（一）_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"这是谁？甘道夫！他怎么会在这里？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3150] =        ---避难的长征（四）_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"站住！",
                  name = _t"奥古斯塔",
                  img = "res\\portrait\\遗忘之路流放者2.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"你是……放逐者之王？你怎么会在这里？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"我只想找你谈谈。",
                  name = _t"奥古斯塔",
                  img = "res\\portrait\\遗忘之路流放者2.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3153] =        ---漂泊的搜寻（一）_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"诶？这里有两个人……不如跟他们打听一下情报吧。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2830] =        ---发现的旅程_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"就是这里了吧……哦，那里，确实在沙子里埋藏着书一样的物品……哦，有海魔正在靠近……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2831] =        ---海魔的袭击_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"呼，终于搞定了……现在让我把这本书挖出来……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2832] =        ---沙中的书籍_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"果然不出所料，全是看不懂的古代文字……还是拿回去大家一起看吧。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2833] =        ---陌生的问询_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"回来了……那是谁？出了什么情况？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"你们两个乖乖跟我走！上头有命令要审查你们！",
                  name = _t"海盗传令兵",
                  img = "res\\portrait\\遗忘之路海盗亡灵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"凭什么？我们犯了什么罪过？",
                  name = _t"苏兰特",
                  img = "res\\portrait\\朱利安.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"住手！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2835] =        ---豪快的格斗_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"太……太厉害了！兄弟们跑啊！！！",
                  name = _t"海盗传令兵",
                  img = "res\\portrait\\遗忘之路海盗亡灵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2849] =        ---战斗的理由_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"呼……这些海盗们越来越多是怎么一回事……我该回去看看。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2855] =        ---海滩的搜寻_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"有人在叫……难道出事了？我必须回去……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2863] =        ---扬帆的愿望（一）_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"海皇神殿快要到了……咦？前面那是谁？看起来像他们说的造船厂厂主。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2865] =        ---船厂之异变（一）_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"是谁在这里吵闹？快些干活，不许偷懒！喂？你是谁？",
                  name = _t"暗黑独角兽",
                  img = "res\\portrait\\青铜圣斗士独角兽座邪武.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2874] =        ---黑暗的消亡（一）_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"啊啊啊……不甘心……我会在死亡皇后岛等着你！",
                  name = _t"暗黑独角兽",
                  img = "res\\portrait\\青铜圣斗士独角兽座邪武.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2880] =        ---人鱼的幻化_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"这里就是出现了美人鱼的地方……我找找……咿？怎么会有一位少女？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2886] =        ---彼岸的轻舟_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"这里就是传说之中神的牢狱……非常危险……",
                  name = _t"狄蒂丝",
                  img = "res\\portrait\\圣域美人鱼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"再危险我也要过去看看，谢谢你送我到这里。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"……那么我在这里为你祈祷。",
                  name = _t"狄蒂丝",
                  img = "res\\portrait\\圣域美人鱼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2888] =        ---凌波的穿越_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"接近了……这里确实有着危险强大的小宇宙……等等，我必须告诉狄蒂丝一些重要的事情。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2892] =        ---漆黑的牢狱_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"里面黑漆漆的什么都看不到……这是什么？是一张封印？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"什、什么？摸了一下就出现一位黄金圣斗士？？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2894] =        ---遥远的距离_遗忘之路主线
{
     delay = 3000,
     [1] = {
                  txt = _t"这个地方……这个封印……？不好！有一股力量控制着我要把它揭下来！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2900] =        ---古代的岬角_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"这里就是和希尔汗约定的地方了吧。那是……不好，有人袭击！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2901] =        ---未来的回音_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"呼……呼……幸好你赶到，圣域和女神的战争要正式开启了。",
                  name = _t"希尔汗",
                  img = "res\\portrait\\庐山神秘怪人.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [2] = {
                  txt = _t"发生什么事情了？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[193] =        ---_破灭！黑之幻魔拳！
{
     delay = 4000,
     [1] = {
                  txt = _t"那是……哥哥，还有一名黄金圣斗士！我的锁链感觉到了敌意。",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"是处女座沙加，难道是他打伤了一辉？我们还是赶快过去看看吧。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3988] =        ---问问一辉这是怎么回事_破灭！黑之幻魔拳！
{
     delay = 4000,
     [1] = {
                  txt = _t"瞬，你是来和我一起统治这个岛屿和黑暗圣斗士的吗？",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"不，哥哥，我们是雅典娜的圣斗士，我们是为了拯救这座岛屿而来的啊！",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"拯救？哈哈哈哈！看来你并不赞同我啊，那么就……",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"接招吧！凤凰幻魔拳！",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[194] =        ---_破灭！黑之幻魔拳！
{
     delay = 4000,
     [1] = {
                  txt = _t"怎么回事？我们刚才不是在熔金营地吗？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"我的锁链感觉不到活人的气息，这里应该是哥哥布下的幻境。",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"一辉？他为什么要攻击我们？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"我也不明白，总之，先离开这里吧。",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[195] =        ---_破灭！黑之幻魔拳！
{
     delay = 4000,
     [1] = {
                  txt = _t"想冲过这个石阵，只有关掉上面的开关才行，但首先要跳上矿道两侧。",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[196] =        ---_破灭！黑之幻魔拳！
{
     delay = 4000,
     [1] = {
                  txt = _t"哈哈，我大熊座檄和一辉一起统治死亡皇后岛，你们两个也快点加入吧。",
                  name = _t"檄",
                  img = "res\\portrait\\青铜圣斗士大熊座檄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这是不可能的！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"那你们就只有去死了！",
                  name = _t"檄",
                  img = "res\\portrait\\青铜圣斗士大熊座檄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[197] =        ---_破灭！黑之幻魔拳！
{
     delay = 4000,
     [1] = {
                  txt = _t"看来我要亲自动手了。",
                  name = _t"檄",
                  img = "res\\portrait\\青铜圣斗士大熊座檄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[198] =        ---_破灭！黑之幻魔拳！
{
     delay = 4000,
     [1] = {
                  txt = _t"两扇门中只有一扇是正确的路，可我的锁链无法看穿，只能试试运气了。",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[199] =        ---_破灭！黑之幻魔拳！
{
     delay = 4000,
     [1] = {
                  txt = _t"哼，你绝不是大熊座檄，他的巨熊吊杀可没有这么软弱。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"嘴硬的小子，让你知道厉害。",
                  name = _t"檄",
                  img = "res\\portrait\\青铜圣斗士大熊座檄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[200] =        ---_十二宫-双子宫
{
     delay = 7000,
     [1] = {
                  txt = _t"盲目的向前冲，是无法通过双子宫的。同时关闭两边的迷雾，你们才能通过这里。",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[201] =        ---_十二宫-双子宫
{
     delay = 7000,
     [1] = {
                  txt = _t"这里是由我主宰的空间。要想面对我，先解决了这里的守护者再说。",
                  name = _t"撒加",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[202] =        ---_十二宫-双子宫
{
     delay = 7000,
     [1] = {
                  txt = _t"竟然能突破次元空间的困境。不过如果无法击败我，你们依然不能离开这里。",
                  name = _t"撒加",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[203] =        ---_十二宫-双子宫
{
     delay = 7000,
     [1] = {
                  txt = _t"竟然能打败我的分身，那我就放你们通过吧。但是，你们不会一直这么顺利的。",
                  name = _t"撒加",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[204] =        ---_风暴亚特兰蒂斯
{
     delay = 5000,
     [1] = {
                  txt = _t"时间到了，我们没能完成狄蒂丝大人的任务，现在不需要再做无谓的牺牲了，我们准备撤吧！",
                  name = _t"小海妖",
                  img = "res\\portrait\\海妖美女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[205] =        ---_风暴亚特兰蒂斯
{
     delay = 4000,
     [1] = {
                  txt = _t"伟大的海皇即将苏醒，他将掌控这世间的一切！",
                  name = _t"狄蒂丝",
                  img = "res\\portrait\\海斗士美人鱼鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"来人，我给你们3分钟，一定要将来犯的敌人全部消灭在这里！",
                  name = _t"狄蒂丝",
                  img = "res\\portrait\\海斗士美人鱼鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"是，谨遵狄蒂丝大人您的命令，我们一定会完成您交待的任务的！",
                  name = _t"邪恶术士士兵",
                  img = "res\\portrait\\堕落炼金术士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[206] =        ---_风暴亚特兰蒂斯
{
     delay = 4000,
     [1] = {
                  txt = _t"伟大的海皇即将苏醒，他将掌控这世间的一切！",
                  name = _t"狄蒂丝",
                  img = "res\\portrait\\海斗士美人鱼鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"来人，我给你们3分钟，一定要将来犯的敌人全部消灭在这里！",
                  name = _t"狄蒂丝",
                  img = "res\\portrait\\海斗士美人鱼鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"是，谨遵狄蒂丝大人您的命令，我们一定会完成您交待的任务的！",
                  name = _t"小海妖",
                  img = "res\\portrait\\海妖美女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2857] =        ---艰难的路程（一）_
{
     delay = 2000,
     [1] = {
                  txt = _t"这一定是贝纳库斯的势力来阻止我们的！",
                  name = _t"朱利安·索罗",
                  img = "res\\portrait\\朱利安.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"放心！我会保护你的！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2858] =        ---艰难的路程（二）_
{
     delay = 2000,
     [1] = {
                  txt = _t"越来越多了！我们必须迅速到达索罗大宅！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2859] =        ---艰难的路程（三）_
{
     delay = 2000,
     [1] = {
                  txt = _t"圣斗士的斗魂是不可战胜的！我们到了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4168] =        ---一辉回忆_一辉回忆
{
     delay = 3000,
     [1] = {
                  txt = _t"我们先一起杀死一辉，然后才有机会获得凤凰座圣衣！",
                  name = _t"皇后岛学员",
                  img = "res\\portrait\\圣域圣斗士男学员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"想击败我，先去地狱走几遭再说吧！",
                  name = _t"一辉",
                  img = "res\\portrait\\一辉便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4169] =        ---一辉回忆_一辉回忆
{
     delay = 3000,
     [1] = {
                  txt = _t"一辉这小子居然还没死，但是你这次不会这么幸运。",
                  name = _t"皇后岛学员",
                  img = "res\\portrait\\圣域圣斗士男学员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4170] =        ---一辉回忆_一辉回忆
{
     delay = 3000,
     [1] = {
                  txt = _t"一辉你的实力果然不俗，但是今天你也只能走到这里！",
                  name = _t"皇后岛学员",
                  img = "res\\portrait\\圣域圣斗士男学员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"一辉……即……便你能击败我们，你也会死在枫的拳下！",
                  name = _t"皇后岛学员",
                  img = "res\\portrait\\圣域圣斗士男学员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 10000,
           },
} 
DialogFinishIdTask[4171] =        ---一辉回忆_一辉回忆
{
     delay = 2000,
     [1] = {
                  txt = _t"一辉！那些废物果然不能阻挡你。",
                  name = _t"枫",
                  img = "res\\portrait\\皇后岛学员枫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"但是你我之间只能有一人有资格挑战基鲁提。",
                  name = _t"枫",
                  img = "res\\portrait\\皇后岛学员枫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不过很抱歉，这个人会是我！",
                  name = _t"枫",
                  img = "res\\portrait\\皇后岛学员枫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"枫，你已经死了！",
                  name = _t"一辉",
                  img = "res\\portrait\\一辉便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"别说大话了！",
                  name = _t"枫",
                  img = "res\\portrait\\皇后岛学员枫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4173] =        ---一辉回忆_一辉回忆
{
     delay = 3000,
     [1] = {
                  txt = _t"一辉，你不杀死我吗？",
                  name = _t"枫",
                  img = "res\\portrait\\皇后岛学员枫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哼哼，你以为我会感激你吗？即便你击败我了，你还是会被基鲁提杀死，哈哈。",
                  name = _t"枫",
                  img = "res\\portrait\\皇后岛学员枫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"我一定可以击败基鲁提，然后回到家乡。",
                  name = _t"一辉",
                  img = "res\\portrait\\一辉便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4174] =        ---一辉回忆_一辉回忆
{
     delay = 3000,
     [1] = {
                  txt = _t"嗯，一辉？为什么不杀死枫！你这次放过敌人，那么下次的死斗中永远躺在地上的人就可能是你！",
                  name = _t"基鲁提",
                  img = "res\\portrait\\基鲁提.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"要憎恨，用憎恨的心击溃你的敌人！",
                  name = _t"基鲁提",
                  img = "res\\portrait\\基鲁提.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"善良、有感情的心会阻碍你的发展！",
                  name = _t"基鲁提",
                  img = "res\\portrait\\基鲁提.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"是，多谢老师的指点。",
                  name = _t"一辉",
                  img = "res\\portrait\\一辉便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"蠢货！谁要你道谢，击败我！杀死我！",
                  name = _t"基鲁提",
                  img = "res\\portrait\\基鲁提.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[207] =        ---_一辉回忆
{
     delay = 3000,
     [1] = {
                  txt = _t"一辉今天只有两条路可以走！",
                  name = _t"基鲁提",
                  img = "res\\portrait\\基鲁提.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"要么杀死我，成为新生的凤凰座圣斗士，要么……",
                  name = _t"基鲁提",
                  img = "res\\portrait\\基鲁提.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"永远的成为皇后岛的幽魂吧！",
                  name = _t"基鲁提",
                  img = "res\\portrait\\基鲁提.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[208] =        ---_一辉回忆
{
     delay = 3000,
     [1] = {
                  txt = _t"憎恨吧，把敌人打得体无完肤吧！",
                  name = _t"基鲁提",
                  img = "res\\portrait\\基鲁提.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"抛弃一切的温情，憎恨把你变成孤儿的父母吧！",
                  name = _t"基鲁提",
                  img = "res\\portrait\\基鲁提.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"憎恨让你当替身，被送来这里的弟弟吧！",
                  name = _t"基鲁提",
                  img = "res\\portrait\\基鲁提.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"憎恨制造你厄运的古拉杜财团吧！",
                  name = _t"基鲁提",
                  img = "res\\portrait\\基鲁提.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"憎恨！憎恨！憎恨！！！",
                  name = _t"基鲁提",
                  img = "res\\portrait\\基鲁提.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3829] =        ---到达死亡之地_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"咦……这里有个人！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3832] =        ---会烤肉的圣斗士_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"你难道就让我吃这些？这，至少也得烤一下吧。",
                  name = _t"大有",
                  img = "res\\portrait\\圣斗士男学员少年艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3834] =        ---黑暗圣斗士_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"快！！一定要夺回海望沙滩！绝不能让黑暗圣斗士离开皇后岛！",
                  name = _t"枫",
                  img = "res\\portrait\\皇后岛学员枫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"皇后岛的候补生绝对没有一个懦夫！",
                  name = _t"枫",
                  img = "res\\portrait\\皇后岛学员枫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3837] =        ---枫的信任_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"等等！（一个声音在你身后响起）",
                  name = _t"皇后岛候补生",
                  img = "res\\portrait\\皇后岛学员枫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3839] =        ---消失的岛屿_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"我好像听到了螺声。是船到了吗？这次怎么这么早？",
                  name = _t"黑暗监督者",
                  img = "res\\portrait\\黑暗杂兵1.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[3737] =        ---瞬的温柔_死亡皇后岛
{
     delay = 4000,
     [1] = {
                  txt = _t"瞬，你放心！如果黑暗天狼座一直躲着也就罢了。只要敢出来，我一定让他试试我的拳头。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[3738] =        ---黑暗天狼座_死亡皇后岛
{
     delay = 4000,
     [1] = {
                  txt = _t"圣斗士大人快跟我来。奴隶居所就在前面。",
                  name = _t"奴隶",
                  img = "res\\portrait\\皇后岛男奴隶.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3843] =        ---黑暗天狼座_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"奇怪？里面根本就没人！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"怎么可能！大人，你再试试别的房间。他们一定在里面！",
                  name = _t"奴隶",
                  img = "res\\portrait\\皇后岛男奴隶.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[3739] =        ---绝杀！银狼的陷阱_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"哈哈哈，蠢货！你会为你的自大付出代价！",
                  name = _t"黑暗天狼座",
                  img = "res\\portrait\\青铜圣斗士天狼座那智.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3844] =        ---绝杀！银狼的陷阱_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"该死！一帮蠢货！连个青铜圣斗士都对付不了！",
                  name = _t"黑暗天狼座",
                  img = "res\\portrait\\青铜圣斗士天狼座那智.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3847] =        ---锁链的指引_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"这是！！这些候补生都死了！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[3747] =        ---怨恨之衣_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"哦？想不到还有一个没死。看来我出手太轻了！",
                  name = _t"一辉",
                  img = "res\\portrait\\凤凰座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"一辉！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[3748] =        ---怨恨之衣_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"这就是黑暗圣衣的力量？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"不对！似乎有什么东西要出来了！一辉这是怎么回事？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"哈哈哈，你就好好体验这股力量吧！",
                  name = _t"一辉",
                  img = "res\\portrait\\凤凰座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3849] =        ---怨恨之衣_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"为什么一辉要让我穿上黑暗圣衣？难道他真的……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"不行！我必须赶快将这件事情告诉枫！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3853] =        ---不可思议的力量_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"一辉，你要干什么！难道你要对瞬出手吗？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[3754] =        ---淘金者之村_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"喂！等等，我有个好消息要告诉你们！（这是逃奴大有的声音）",
                  name = _t"大有",
                  img = "res\\portrait\\圣斗士男学员少年艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[3758] =        ---一把大火_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"你跟我来！",
                  name = _t"大有",
                  img = "res\\portrait\\圣斗士男学员少年艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"听说今天会有一批奴隶过来。我会在附近点火制造混乱。",
                  name = _t"大有",
                  img = "res\\portrait\\圣斗士男学员少年艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"你就趁机混在奴隶当中。",
                  name = _t"大有",
                  img = "res\\portrait\\圣斗士男学员少年艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3858] =        ---一把大火_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"想不到会有圣斗士到这里来！不过你没有伪装的必要。",
                  name = _t"蛇影",
                  img = "res\\portrait\\青铜圣斗士水蛇座市.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3859] =        ---让人战栗的小宇宙_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"这是！黄金圣斗士沙加！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3864] =        ---不得不去的理由_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"不见了！难道他真的是奴隶主？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3865] =        ---不得不去的理由_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"对不起，大有。也许那真的是个陷阱，但是我们必须要去！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3868] =        ---黑暗暗杀者_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"奇怪？这里怎么会只有这么几个守卫？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3871] =        ---黑暗暗杀者_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"必须赶快离开这里！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5591] =        ---黑暗暗杀者_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"可恶！那个奴隶在这里埋了很多炸药！我们快跑！！！",
                  name = _t"黑暗圣斗士",
                  img = "res\\portrait\\黑暗杂兵1.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这是！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3901] =        ---黑暗中的身影_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"什么人！出来！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3877] =        ---冲击熔金营地_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"前进！夺回熔金营地！！",
                  name = _t"皇后岛候补生",
                  img = "res\\portrait\\皇后岛学员枫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3878] =        ---地狱岛的战魂_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"救……救命！",
                  name = _t"奄奄一息的人",
                  img = "res\\portrait\\塔瓦娜遗民.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[3783] =        ---塔瓦娜遗民_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"他是塔瓦娜人。看来黑暗圣斗士已经控制了那里。",
                  name = _t"枫",
                  img = "res\\portrait\\皇后岛学员枫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"枫！你怎么……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[3797] =        ---背叛者_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"等等……",
                  name = _t"塔瓦娜遗民",
                  img = "res\\portrait\\塔瓦娜遗民.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[3818] =        ---枫的决意_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"不只是一辉，还有我们！",
                  name = _t"星矢",
                  img = "res\\portrait\\天马.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"星矢！紫龙！冰河！你们……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[209] =        ---_风暴亚特兰蒂斯
{
     delay = 4000,
     [1] = {
                  txt = _t"敌人太厉害了，我们完全不是对手，快撤！",
                  name = _t"邪恶术士士兵",
                  img = "res\\portrait\\堕落炼金术士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[210] =        ---_风暴亚特兰蒂斯
{
     delay = 4000,
     [1] = {
                  txt = _t"敌人太厉害了，我们完全不是对手，快撤！",
                  name = _t"小海妖",
                  img = "res\\portrait\\海妖美女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4176] =        ---_一辉回忆
{
     delay = 3000,
     [1] = {
                  txt = _t"混账为什么停下来！为什么！",
                  name = _t"基鲁提",
                  img = "res\\portrait\\基鲁提.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"打！绝不要手软！！！",
                  name = _t"基鲁提",
                  img = "res\\portrait\\基鲁提.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"一辉！！！杀死我！！！",
                  name = _t"基鲁提",
                  img = "res\\portrait\\基鲁提.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"杀死我！！！一辉你会为你的仁慈付出代价的！",
                  name = _t"基鲁提",
                  img = "res\\portrait\\基鲁提.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[211] =        ---_破灭！黑之幻魔拳！
{
     delay = 4000,
     [1] = {
                  txt = _t"我幼师座蛮再给你们一次机会，和一辉大人一起统治死亡皇后岛吧！",
                  name = _t"蛮",
                  img = "res\\portrait\\青铜圣斗士幼狮座蛮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这是不可能的！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"哼！那就没什么好说的了，大家一起上！",
                  name = _t"蛮",
                  img = "res\\portrait\\青铜圣斗士幼狮座蛮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[212] =        ---_破灭！黑之幻魔拳！
{
     delay = 4000,
     [1] = {
                  txt = _t"选择一扇正确的门吧。",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[213] =        ---_破灭！黑之幻魔拳！
{
     delay = 4000,
     [1] = {
                  txt = _t"我们终于出来了。",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"别高兴的太早，还有我水蛇座市！",
                  name = _t"市",
                  img = "res\\portrait\\青铜圣斗士水蛇座市.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"如果想让我们加入你们，我劝你还是别费口舌了。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"好，那就尽快杀死你们吧！",
                  name = _t"市",
                  img = "res\\portrait\\青铜圣斗士水蛇座市.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[214] =        ---_破灭！黑之幻魔拳！
{
     delay = 4000,
     [1] = {
                  txt = _t"是哥哥，我们快追上去吧",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[215] =        ---_破灭！黑之幻魔拳！
{
     delay = 4000,
     [1] = {
                  txt = _t"想不到你们竟然能来到这里。",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"你绝不是一辉！你到底是谁？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"哈哈哈，我嘛……",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"黑暗凤凰！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"哈哈，就是我，比一辉强大数百倍的黑暗凤凰！",
                  name = _t"黑暗凤凰",
                  img = "res\\portrait\\黑暗凤凰座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[216] =        ---_破灭！黑之幻魔拳！
{
     delay = 4000,
     [1] = {
                  txt = _t"哈哈，你们逃不出去！",
                  name = _t"檄",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[217] =        ---_破灭！黑之幻魔拳！
{
     delay = 4000,
     [1] = {
                  txt = _t"这次一定要选择正确的门。我觉得，也许是……左侧？",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[218] =        ---_破灭！黑之幻魔拳！
{
     delay = 4000,
     [1] = {
                  txt = _t"哈哈，你们又回来了！",
                  name = _t"蛮",
                  img = "res\\portrait\\青铜圣斗士幼狮座蛮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[219] =        ---_破灭！黑之幻魔拳！
{
     delay = 4000,
     [1] = {
                  txt = _t"我想……会不会是这样，第一段路选左边的门，第二段路选右边的门？",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[220] =        ---_破灭！黑之幻魔拳！
{
     delay = 4000,
     [1] = {
                  txt = _t"什么！怎么又回到了这里？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"看来一定要选择了正确的门才能够出去。",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[221] =        ---_破灭！黑之幻魔拳！
{
     delay = 4000,
     [1] = {
                  txt = _t"不知道我们是不是选对了门。",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[222] =        ---_一辉回忆
{
     delay = 3000,
     [1] = {
                  txt = _t"对，就是这样，杀死我，杀死我！",
                  name = _t"基鲁提",
                  img = "res\\portrait\\基鲁提.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"为什么出拳这么弱，为什么！我是你的敌人，用你的憎恨杀死我啊！！！",
                  name = _t"基鲁提",
                  img = "res\\portrait\\基鲁提.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"蠢货！废物！渣滓！杀死我！",
                  name = _t"基鲁提",
                  img = "res\\portrait\\基鲁提.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[223] =        ---_一辉回忆
{
     delay = 3000,
     [1] = {
                  txt = _t"一辉，让你见识见识我的绝技，我的小宇宙化成的愤怒！！！",
                  name = _t"枫",
                  img = "res\\portrait\\皇后岛学员枫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[224] =        ---_十二宫-双子宫
{
     delay = 3000,
     [1] = {
                  txt = _t"左侧通道的迷雾已散去。大家赶快通过。",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[225] =        ---_十二宫-双子宫
{
     delay = 3000,
     [1] = {
                  txt = _t"右侧通道的迷雾已散去。大家赶快通过。",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[226] =        ---_钟楼
{
     delay = 5000,
     [1] = {
                  txt = _t"竟然让那么多敌人进入。你们太令我失望了。",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\莎尔娜圣衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"先不要管那么多了，挡住前面到来的冥斗士！",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\莎尔娜圣衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1133] =        ---_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"这个孩子就是天翼？一看就是个不安分的男孩。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4286] =        ---_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"全是没用的东西！让我来！",
                  name = _t"黑暗天龙",
                  img = "res\\portrait\\黑暗天龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2084] =        ---_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"纱织小姐，这里就交给我了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
NpcAcceptIdTask[236] =        ---_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"交给我吧！我一定会保护纱织小姐的！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[227] =        ---_射手逃亡
{
     delay = 7000,
     [1] = {
                  txt = _t"快帮我挡住追兵！",
                  name = _t"艾欧罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座艾欧罗斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[228] =        ---_射手逃亡
{
     delay = 3000,
     [1] = {
                  txt = _t"半人马座！只有先击败他，我们才能闯出一条路。",
                  name = _t"艾欧罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座艾欧罗斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[229] =        ---_射手逃亡
{
     delay = 7000,
     [1] = {
                  txt = _t"修罗追来了，他的力量太强大了，不能近身，我们需要尽快打通前面的道路！",
                  name = _t"艾欧罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座艾欧罗斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[230] =        ---_射手逃亡
{
     delay = 7000,
     [1] = {
                  txt = _t"修罗已经赶去了前方，看来必须击败他，我们才能逃出圣域！前进吧勇士！",
                  name = _t"艾欧罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座艾欧罗斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[231] =        ---_破灭！黑之幻魔拳！
{
     delay = 4000,
     [1] = {
                  txt = _t"什么！我的身体不能动了！",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1138] =        ---光明！紫龙的希望_庐山
{
     delay = 4000,
     [1] = {
                  txt = _t"快去找春丽吧！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4288] =        ---_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"我能感觉到，那个叫做一辉的人心中的信念。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[691] =        ---_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"我……还……活着？可是身体好像不听使唤了一样……",
                  name = _t"星矢",
                  img = "res\\portrait\\天马.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 6000,
           },
     [2] = {
                  txt = _t"同伴们……都在等我，我必须！必须赶去！",
                  name = _t"星矢",
                  img = "res\\portrait\\天马.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[441] =        ---_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"紫龙，我现在去救星矢，你一定要战胜黑暗天龙！",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"但是我的锁链警告我一定要小心黑暗天龙隐藏在暗中的敌人。",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"黑暗中的敌人！？",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[232] =        ---_十二宫-双子宫
{
     delay = 7000,
     [1] = {
                  txt = _t"这里的空间出现了混乱，不要一味冲向敌人，可以试试相反的方向。",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[854] =        ---神秘英灵_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"到神龙岭来！让我看看你的实力！",
                  name = _t"神秘英灵",
                  img = "res\\portrait\\圣斗士英灵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 4000,
           },
     [2] = {
                  txt = _t"走吧！我倒要看看这个考验是什么！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3405] =        ---金色幻象_群星之地
{
     delay = 4000,
     [1] = {
                  txt = _t"好轻的身体！这股从心底涌现的力量是……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这……这就是圣斗士的圣衣的力量！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不过，现在最要紧的是赶快回去找魔铃，将观星楼的事情告诉她！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 5000,
           },
     [4] = {
                  txt = _t"冥界的人既然出现在观星楼，他们一定谋划着什么！还有最后出现的那个人……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [5] = {
                  txt = _t"看来，新的圣战即将开始！我还需要不断——不断的修行！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [6] = {
                  txt = _t"总有一天，我会用自己的力量，打败哈迪斯，消灭冥界！终结这场圣战！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
} 
DialogFinishIdTask[3407] =        ---金色幻象1_群星之地
{
     delay = 4000,
     [1] = {
                  txt = _t"好轻的身体！这股从心底涌现的力量是……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这……这就是圣斗士的圣衣的力量！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不过，现在最要紧的是赶快回去找魔铃，将观星楼的事情告诉她！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 5000,
           },
     [4] = {
                  txt = _t"冥界的人既然出现在观星楼，他们一定谋划着什么！还有最后出现的那个人……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [5] = {
                  txt = _t"看来，新的圣战即将开始！我还需要不断——不断的修行！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [6] = {
                  txt = _t"总有一天，我会用自己的力量，打败哈迪斯，消灭冥界！终结这场圣战！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
} 
DialogFinishIdTask[3409] =        ---金色幻象2_群星之地
{
     delay = 4000,
     [1] = {
                  txt = _t"好轻的身体！这股从心底涌现的力量是……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这……这就是圣斗士的圣衣的力量！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不过，现在最要紧的是赶快回去找魔铃，将观星楼的事情告诉她！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 5000,
           },
     [4] = {
                  txt = _t"冥界的人既然出现在观星楼，他们一定谋划着什么！还有最后出现的那个人……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [5] = {
                  txt = _t"看来，新的圣战即将开始！我还需要不断——不断的修行！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [6] = {
                  txt = _t"总有一天，我会用自己的力量，打败哈迪斯，消灭冥界！终结这场圣战！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
} 
DialogFinishIdTask[3411] =        ---金色幻象3_群星之地
{
     delay = 4000,
     [1] = {
                  txt = _t"好轻的身体！这股从心底涌现的力量是……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这……这就是圣斗士的圣衣的力量！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不过，现在最要紧的是赶快回去找魔铃，将观星楼的事情告诉她！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 5000,
           },
     [4] = {
                  txt = _t"冥界的人既然出现在观星楼，他们一定谋划着什么！还有最后出现的那个人……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [5] = {
                  txt = _t"看来，新的圣战即将开始！我还需要不断——不断的修行！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [6] = {
                  txt = _t"总有一天，我会用自己的力量，打败哈迪斯，消灭冥界！终结这场圣战！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
} 
DialogFinishIdTask[3413] =        ---金色幻象4_群星之地
{
     delay = 4000,
     [1] = {
                  txt = _t"好轻的身体！这股从心底涌现的力量是……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这……这就是圣斗士的圣衣的力量！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不过，现在最要紧的是赶快回去找魔铃，将观星楼的事情告诉她！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 5000,
           },
     [4] = {
                  txt = _t"冥界的人既然出现在观星楼，他们一定谋划着什么！还有最后出现的那个人……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [5] = {
                  txt = _t"看来，新的圣战即将开始！我还需要不断——不断的修行！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [6] = {
                  txt = _t"总有一天，我会用自己的力量，打败哈迪斯，消灭冥界！终结这场圣战！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
} 
DialogFinishIdTask[1729] =        ---无法触碰的爱（一）_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"木盒中放着一副面具，戴上它，就看不到面具下那张脸的悲喜。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[299] =        ---父与子（三）_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"孩子……我错了，还有什么能比看到你平安回来更重要呢？原谅我……",
                  name = _t"伊万",
                  img = "res\\portrait\\富士山铃之村老年隐士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"原谅我没有早点回来……父亲。",
                  name = _t"拉克萨斯",
                  img = "res\\portrait\\怪物海斗士杂兵瘦（鳍半透明.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[253] =        ---一定要守护你6_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"我先回去了，阿姨。记得来找我玩哦！",
                  name = _t"成辉",
                  img = "res\\portrait\\希腊小男孩新版主角.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[547] =        ---宝物商人格里夫塔_银河竞技场
{
     delay = 2000,
     [1] = {
                  txt = _t"鬼屋旧灯拿到了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[548] =        ---宝物商人格里夫塔_银河竞技场
{
     delay = 2000,
     [1] = {
                  txt = _t"星辰樱拿到了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[549] =        ---宝物商人格里夫塔_银河竞技场
{
     delay = 2000,
     [1] = {
                  txt = _t"鬼隐石拿到了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3007] =        ---天马座星矢_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"星矢胜利，获得了天马座圣衣！",
                  name = _t"教皇",
                  img = "res\\portrait\\教皇.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"祝贺你！星矢！",
                  name = _t"艾德",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3457] =        ---天马座星矢_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"下一场战斗即将开始，请艾德和%s做好准备！",
                  name = _t"教皇",
                  img = "res\\portrait\\教皇.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3388] =        ---星之祭坛的启示_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"这是……什么地方……！？艾德，为什么要带我来这里？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"……",
                  name = _t"艾德",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3391] =        ---星之祭坛的启示_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"这是……什么地方……！？艾德，为什么要带我来这里？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"……",
                  name = _t"艾德",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3394] =        ---星之祭坛的启示_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"这是……什么地方……！？艾德，为什么要带我来这里？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"……",
                  name = _t"艾德",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3397] =        ---星之祭坛的启示_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"这是……什么地方……！？艾德，为什么要带我来这里？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"……",
                  name = _t"艾德",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3400] =        ---星之祭坛的启示_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"这是……什么地方……！？艾德，为什么要带我来这里？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"……",
                  name = _t"艾德",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3033] =        ---爆发吧，星矢！_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"星矢，希望你可以找到你的姐姐！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"冥界的阴谋还没有查明。我现在还不能离开圣域！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2998] =        ---冥界入侵！_群星之地
{
     delay = 5000,
     [1] = {
                  txt = _t"观星楼里面有强大的小宇宙！到底是谁？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[3003] =        ---圣斗士的宿命_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"圣域！我终于可以去圣域了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"魔铃让我不要将观星楼的事情告诉任何人，包括教皇吗？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"可是教皇就是雅典娜女神在大地的代言人啊！效忠教皇，就是效忠于雅典娜啊！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4350] =        ---尘封的十三年_新版圣域
{
     delay = 5000,
     [1] = {
                  txt = _t"你在这里干什么？快滚出去！这里是禁地！！！",
                  name = _t"加米安",
                  img = "res\\portrait\\白银乌鸦座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"糟糕……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[233] =        ---_激斗！黄金十二宫！
{
     delay = 2500,
     [1] = {
                  txt = _t"看来只有击倒他们才能离开这里了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2460] =        ---修罗01_环任务
{
     delay = 5000,
     [1] = {
                  txt = _t"不好了！那些冥界异化者抢走了村里的粮食，这可怎么办啊！",
                  name = _t"遗忘之村村民",
                  img = "res\\portrait\\圣域杂兵壮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2801] =        ---修罗05_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"这股小宇宙，难道是修罗？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3342] =        ---撒加02_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"那边的人快离开这里，这些都是些杀人不眨眼的海怪！",
                  name = _t"吉米",
                  img = "res\\portrait\\圣域老年助祭司.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2470] =        ---撒加05_环任务
{
     delay = 3000,
     [1] = {
                  txt = _t"一花一世界，一叶一菩提。",
                  name = _t"神秘的声音",
                  img = "res\\portrait\\默认.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2797] =        ---沙加04_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"沙加！他站在这里干什么？前面的那群人是……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"该死的家伙，今天就废了你的腿，以后的日子就在绝望中度过吧。",
                  name = _t"奴隶监工",
                  img = "res\\portrait\\黑暗杂兵1.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"大人，求求您，放过我吧。我家里还有八十岁的老母亲等着照料。",
                  name = _t"奴隶青年",
                  img = "res\\portrait\\圣斗士男学员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [4] = {
                  txt = _t"住手！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2513] =        ---强戈02_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"看来只有去找那些黑暗圣斗士问个清楚了。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2516] =        ---强戈05_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"队长，一辉大人回到岛上了，咦，您这是……",
                  name = _t"黑暗传令兵",
                  img = "res\\portrait\\黑暗杂兵1.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2790] =        ---强戈07_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"这是一辉的小宇宙！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2782] =        ---基鲁提01_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"救命啊，救命啊！",
                  name = _t"少女",
                  img = "res\\portrait\\圣斗士女学员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2784] =        ---基鲁提03_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"只有倒在地上的黑暗圣斗士，那个杰西的护卫到哪里去了？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2757] =        ---艾丝美拉达02_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"这里的花不错，给艾丝美拉达小姐带一些吧。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2488] =        ---艾丝美拉达05_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"琳，我刚刚看到一辉了，他往艾丝美拉达的墓那里去了！",
                  name = _t"死亡皇后岛候补生",
                  img = "res\\portrait\\圣斗士男学员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2763] =        ---艾丝美拉达05_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"一辉已经离开了么，那是……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2764] =        ---艾丝美拉达05_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"即使一辉表面上变得冷酷无比，在他的内心深处那个叫艾丝美拉达的女孩仍然让他保持着最后的温柔。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2768] =        ---黑暗天马02_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"求求你，不要再说黑暗天马的坏话了，他已经死了……",
                  name = _t"汤姆",
                  img = "res\\portrait\\圣斗士男学员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2775] =        ---黑暗仙女03_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"梅兰说过就在这附近，仔细找找看吧。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"头儿，刚才就是这家伙把我们揍了一顿。这个仇可不能不报啊！",
                  name = _t"矿坑守卫",
                  img = "res\\portrait\\黑暗杂兵1.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2777] =        ---黑暗仙女03_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"哦，照片原来就在这里，刚才怎么没有发现呢。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[2508] =        ---黑暗仙女04_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"看来梅兰姑娘找得就是黑暗仙女，可惜那个男人已经在十风穴……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2766] =        ---黑暗白鸟02_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"别打我，我告诉你就是了。鸦就一直在火山附近修炼。",
                  name = _t"黑暗斗士",
                  img = "res\\portrait\\黑暗杂兵1.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2751] =        ---艾欧里亚03_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"这个教皇的走狗似乎留下了什么东西，是一封信。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2752] =        ---艾欧里亚03_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"这封信里竟然有这样的秘密，没想到真正的玛尔斯已经被关押起来了。咦！这个小宇宙是……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2753] =        ---艾欧里亚04_环任务
{
     delay = 2000,
     [1] = {
                  txt = _t"这个人是……受了好重的伤，先去帮他找点药吧。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[234] =        ---唤醒魔鬼鱼_风暴亚特兰蒂斯
{
     delay = 6000,
     [1] = {
                  txt = _t"救我……快救救我……",
                  name = _t"挣扎中的魔鬼鱼灵魂",
                  img = "res\\portrait\\海将军六圣兽.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"挣扎的鳞衣似乎引起了巨大的震动效应，难道……海啸频发是因为它？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"美人鱼狄蒂丝和邪恶的黑暗势力联手，他们将我的灵魂困在这个鳞衣中，试图唤醒7个海将军！趁我还没有被邪恶的力量彻底同化，请你……将我的灵魂从鳞衣中施放出来……快点……",
                  name = _t"挣扎中的魔鬼鱼灵魂",
                  img = "res\\portrait\\海将军六圣兽.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[235] =        ---_钟楼
{
     delay = 6000,
     [1] = {
                  txt = _t"年轻人,帮帮我！",
                  name = _t"圣域钟表匠  埃迪卡拉",
                  img = "res\\portrait\\修炼拳师男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[236] =        ---_钟楼
{
     delay = 6000,
     [1] = {
                  txt = _t"谢谢你们，帮我拿回了这个零件。",
                  name = _t"圣域钟表匠  埃迪卡拉",
                  img = "res\\portrait\\修炼拳师男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[237] =        ---_圣战回忆
{
     delay = 7000,
     [1] = {
                  txt = _t"关闭一个机关的时候，和它相连的机关开关状态就会改变。。。相信以你们的智慧可以关闭所有的机关。",
                  name = _t"史昂",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[238] =        ---_狮子的遭遇
{
     delay = 3000,
     [1] = {
                  txt = _t"仅仅只有我们可能不够热闹，为什么不让游戏更有趣呢？",
                  name = _t"达拿都斯",
                  img = "res\\portrait\\死神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[239] =        ---_狮子的遭遇
{
     delay = 3000,
     [1] = {
                  txt = _t"好有趣的虫子，居然现在还能活着，那么接下来的惊喜呢？",
                  name = _t"达拿都斯",
                  img = "res\\portrait\\死神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[864] =        ---战斗还没有结束！_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"为什么？庐山到底还有什么危机？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"积尸气已经全部被净化，迪斯马斯克也离开了庐山，难道……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"孩子，神龙没有说错。你真的以为迪斯马斯离开了吗？",
                  name = _t"童虎",
                  img = "res\\portrait\\黄金圣斗士天枰座童虎老年.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"老师！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[241] =        ---_钟楼
{
     delay = 7000,
     [1] = {
                  txt = _t"干得不错！又一大波敌人就要到来了，不要放松警惕。",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\莎尔娜圣衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[242] =        ---_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"青铜圣斗士，别想着活着出去！",
                  name = _t"黑暗杂兵",
                  img = "res\\portrait\\黑暗杂兵1.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[243] =        ---_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"一辉！让你见识一下我白鸟极寒的威力！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4487] =        ---_十风穴决战
{
     delay = 2000,
     [1] = {
                  txt = _t"前面的人是谁……？",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"冰河！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4486] =        ---_十风穴决战
{
     delay = 3000,
     [1] = {
                  txt = _t"黑暗天龙的拳果然也很厉害，身体感觉好沉……",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"但是无论如何我也要找到一辉夺回黄金圣衣！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[1779] =        ---竹子开花了（一）_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"村子里的万晓生号称无所不知，去问问他看看。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2105] =        ---龙珠之谜（四）_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"哇！好多毒蛇，还是问问旁边的养蛇人有什么好办法吧。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4760] =        ---_欺瞒神的男人
{
     delay = 5000,
     [1] = {
                  txt = _t"挡我的，不管只是一处机关还是人类，即便是神也要死，哈哈哈哈……",
                  name = _t"加隆",
                  img = "res\\portrait\\加隆便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4553] =        ---_剧本：七大洋之战
{
     delay = 4000,
     [1] = {
                  txt = _t"狄蒂斯，你来告诉他们要怎样拯救雅典娜吧。",
                  name = _t"海龙",
                  img = "res\\portrait\\海将军海龙鳞衣人形版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哼，听着，只有摧毁七大洋之柱和生命之柱，才能救出雅典娜。",
                  name = _t"狄蒂丝",
                  img = "res\\portrait\\海斗士美人鱼鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不过，凭你们几个青铜圣斗士是不可能办到的。哈哈哈！",
                  name = _t"狄蒂丝",
                  img = "res\\portrait\\海斗士美人鱼鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"可恶，我们分头行动吧。",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"各位加油！！",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4555] =        ---_剧本：七大洋之战
{
     delay = 4000,
     [1] = {
                  txt = _t"是北太平洋之柱被击碎的声音，干得好，星矢！",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4769] =        ---_剧本：七大洋之战
{
     delay = 4000,
     [1] = {
                  txt = _t"我是镇守南太平洋之柱的六圣兽伊奥。",
                  name = _t"六兽妖",
                  img = "res\\portrait\\海将军六圣兽.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"仙女座，这里将成为你的葬身之地！",
                  name = _t"六兽妖",
                  img = "res\\portrait\\海将军六圣兽.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4560] =        ---_剧本：七大洋之战
{
     delay = 4000,
     [1] = {
                  txt = _t"好，南太平洋之柱被击碎了。",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4770] =        ---_剧本：七大洋之战
{
     delay = 4000,
     [1] = {
                  txt = _t"是你！凤凰座的一辉！不可能，你应该已经死了！",
                  name = _t"海怪",
                  img = "res\\portrait\\海斗士水魔鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哼，阎王一直都很讨厌我，但好像对你特别感兴趣呢。",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"可恶，还是让我把你送回地狱去吧。",
                  name = _t"海怪",
                  img = "res\\portrait\\海斗士水魔鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[244] =        ---_剧本：七大洋之战
{
     delay = 4000,
     [1] = {
                  txt = _t"一辉，难道你没有人类的感情吗？",
                  name = _t"海怪",
                  img = "res\\portrait\\海斗士水魔鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哼，只有弱者才会在乎感情这种东西。",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"啊！我看到了，你内心深处最在乎的人！",
                  name = _t"海怪",
                  img = "res\\portrait\\海斗士水魔鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[245] =        ---_剧本：七大洋之战
{
     delay = 4000,
     [1] = {
                  txt = _t"艾丝美拉达！",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4569] =        ---_剧本：七大洋之战
{
     delay = 4000,
     [1] = {
                  txt = _t"前面就是海皇神殿了，我得尽快破坏生命之柱。",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4571] =        ---_剧本：七大洋之战
{
     delay = 4000,
     [1] = {
                  txt = _t"哈哈哈，我终于醒来了！",
                  name = _t"海皇波塞冬",
                  img = "res\\portrait\\海皇波塞冬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4573] =        ---_剧本：七大洋之战
{
     delay = 4000,
     [1] = {
                  txt = _t"怎么可能！我是神……",
                  name = _t"海皇波塞冬",
                  img = "res\\portrait\\海皇波塞冬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"海皇，被我们……击倒了！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"接下来，来击碎生命之柱吧！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4575] =        ---_剧本：七大洋之战
{
     delay = 4000,
     [1] = {
                  txt = _t"我的小宇宙！燃烧吧！让我用生命来击碎这柱子吧！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4583] =        ---海啸，灾难之源！_东西伯利亚
{
     delay = 3000,
     [1] = {
                  txt = _t"是艾尔扎克！！！",
                  name = _t"雅科夫",
                  img = "res\\portrait\\冰大陆雅科夫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4681] =        ---奥尔哈钢之核_东西伯利亚
{
     delay = 3000,
     [1] = {
                  txt = _t"这里，就是水瓶座黄金圣斗士卡妙曾经住过的地方……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4682] =        ---奥尔哈钢之核_东西伯利亚
{
     delay = 3000,
     [1] = {
                  txt = _t"找到了，这里一定有关于奥尔哈钢之核的记载！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4589] =        ---冰川的怒吼_东西伯利亚
{
     delay = 2000,
     [1] = {
                  txt = _t"永久冰壁雪崩了！！！！",
                  name = _t"受伤的圣斗士候补生",
                  img = "res\\portrait\\东西伯利亚圣斗士学员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"什么！！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4690] =        ---寒冰之白鸟_东西伯利亚
{
     delay = 3000,
     [1] = {
                  txt = _t"白鸟圣衣……就在这冰壁之后！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4691] =        ---寒冰之白鸟_东西伯利亚
{
     delay = 3000,
     [1] = {
                  txt = _t"白鸟圣衣发出彻骨的寒气！要尽快将它送给冰河。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4692] =        ---寒冰之白鸟_东西伯利亚
{
     delay = 3000,
     [1] = {
                  txt = _t"我从来……都没有见过冰河那种表情……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4611] =        ---凛风中的花蕾_东西伯利亚
{
     delay = 1000,
     [1] = {
                  txt = _t"救命！！",
                  name = _t"娜塔莎",
                  img = "res\\portrait\\娜塔莎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"那是……",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4702] =        ---白鸟，禁锢之翅！_东西伯利亚
{
     delay = 3000,
     [1] = {
                  txt = _t"白鸟座冰河，我需要你的力量，归顺我吧！",
                  name = _t"亚雷库萨",
                  img = "res\\portrait\\默认.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"冰河危险！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4703] =        ---白鸟，禁锢之翅！_东西伯利亚
{
     delay = 1500,
     [1] = {
                  txt = _t"不，冰河！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"我来做你的对手！",
                  name = _t"艾尔扎克",
                  img = "res\\portrait\\海斗士北海巨妖.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4705] =        ---压迫！魔鬼鱼_东西伯利亚
{
     delay = 2500,
     [1] = {
                  txt = _t"放弃吧，这不是你该来的地方！不要插手我和冰河的事情，也不要妄图拿到奥尔哈钢之核，那是属于波塞冬大人的！",
                  name = _t"艾尔扎克",
                  img = "res\\portrait\\海斗士北海巨妖.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"……什么！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4627] =        ---最寒冷的地方_东西伯利亚
{
     delay = 1000,
     [1] = {
                  txt = _t"冰河！冰河！！！",
                  name = _t"雅科夫",
                  img = "res\\portrait\\冰大陆雅科夫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4712] =        ---最寒冷的地方_东西伯利亚
{
     delay = 3000,
     [1] = {
                  txt = _t"没错，这里散发着无比寒冷的冻气！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4720] =        ---突如其来的黑暗？_东西伯利亚
{
     delay = 1500,
     [1] = {
                  txt = _t"……发生了什么……冰河？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4722] =        ---双子残影_东西伯利亚
{
     delay = 1500,
     [1] = {
                  txt = _t"前面就是世界之树，可……？！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4656] =        ---迷醉之海妖_东西伯利亚
{
     delay = 1500,
     [1] = {
                  txt = _t"这件事我来办。",
                  name = _t"加隆",
                  img = "res\\portrait\\便装加隆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4733] =        ---迷醉之海妖_东西伯利亚
{
     delay = 1000,
     [1] = {
                  txt = _t"退下吧。",
                  name = _t"加隆",
                  img = "res\\portrait\\便装加隆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"……是，大人。",
                  name = _t"海妖帕瑟芬",
                  img = "res\\portrait\\海妖美女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4734] =        ---极光之地_东西伯利亚
{
     delay = 1000,
     [1] = {
                  txt = _t"娜塔莎！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4662] =        ---一定要平安，朋友_东西伯利亚
{
     delay = 1000,
     [1] = {
                  txt = _t"奥……钢……",
                  name = _t"朱利安",
                  img = "res\\portrait\\朱利安便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"大人！大人！",
                  name = _t"苏兰特",
                  img = "res\\portrait\\海魔女苏兰特便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4740] =        ---魔鬼鱼，再次出现_东西伯利亚
{
     delay = 1500,
     [1] = {
                  txt = _t"留下这个女人，冰河！",
                  name = _t"艾尔扎克",
                  img = "res\\portrait\\海斗士北海巨妖.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"对不起，艾尔扎克。",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4744] =        ---誓死保护你_东西伯利亚
{
     delay = 1500,
     [1] = {
                  txt = _t"放开娜塔莎，亚雷库萨！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4672] =        ---蔚蓝的梦_东西伯利亚
{
     delay = 1500,
     [1] = {
                  txt = _t"不会在这里结束！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4747] =        ---蔚蓝的梦_东西伯利亚
{
     delay = 1000,
     [1] = {
                  txt = _t"哼，果然追来了。",
                  name = _t"亚雷库萨",
                  img = "res\\portrait\\默认.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4673] =        ---冰冷的王座_东西伯利亚
{
     delay = 1000,
     [1] = {
                  txt = _t"哥哥！不要！",
                  name = _t"娜塔莎",
                  img = "res\\portrait\\娜塔莎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4674] =        ---美丽的南方_东西伯利亚
{
     delay = 3000,
     [1] = {
                  txt = _t"请住手！不要再打了！请住手吧！不要再有亲人在我面前死去了……",
                  name = _t"娜塔莎",
                  img = "res\\portrait\\娜塔莎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4753] =        ---冰冷的故园_东西伯利亚
{
     delay = 1500,
     [1] = {
                  txt = _t"艾尔扎克！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"封印终于被打开，辛苦你们了。",
                  name = _t"艾尔扎克",
                  img = "res\\portrait\\海斗士北海巨妖.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4756] =        ---封印海皇之力_东西伯利亚
{
     delay = 3000,
     [1] = {
                  txt = _t"取出奥尔哈钢之核吧，女神的圣斗士！它是属于你们的……对……属于你们的……",
                  name = _t"瓦尔基里",
                  img = "res\\portrait\\冰之国公主瓦尔基里.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4757] =        ---封印海皇之力_东西伯利亚
{
     delay = 3000,
     [1] = {
                  txt = _t"哈哈哈哈哈，终于等到了这一步，交给我吧，奥尔哈钢之核！！",
                  name = _t"加隆",
                  img = "res\\portrait\\便装加隆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"你说什么，加隆？！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[5085] =        ---冰河回忆_冰河回忆
{
     delay = 3000,
     [1] = {
                  txt = _t"嗯？还有活着的人类，杀了他们！",
                  name = _t"海斗士",
                  img = "res\\portrait\\怪物海斗士杂兵瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这些是什么？艾德罗小心！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士白鸟座冰河便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[246] =        ---冰河回忆_冰河回忆
{
     delay = 3000,
     [1] = {
                  txt = _t"艾尔扎克！那么多无辜的村民，那么多共同训练的候补生，都……",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士白鸟座冰河便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"冰河，现在不是说话的时候，他们的头领就在前面，我一定不会让他活着离开这里！！！",
                  name = _t"艾尔扎克",
                  img = "res\\portrait\\皇后岛学员枫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[247] =        ---冰河回忆_冰河回忆
{
     delay = 3000,
     [1] = {
                  txt = _t"冰河……一定要找到艾尔扎克，只有他能拯救村子……",
                  name = _t"艾德罗",
                  img = "res\\portrait\\圣域圣斗士男学员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"不！！！艾德罗！！！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士白鸟座冰河便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[248] =        ---冰河回忆_冰河回忆
{
     delay = 3000,
     [1] = {
                  txt = _t"哼哼哼，死到临头还说大话，让我想想怎么杀死你。",
                  name = _t"海斗士士兵",
                  img = "res\\portrait\\海斗士杂兵壮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"整个村子，心中的正义，圣斗士的职责，统统的宣泄在你们身上！！！",
                  name = _t"艾尔扎克",
                  img = "res\\portrait\\皇后岛学员枫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"少说大话了，受死吧！",
                  name = _t"海斗士士兵",
                  img = "res\\portrait\\海斗士杂兵壮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"这就是艾尔扎克愤怒时的小宇宙吗？简直像卡妙老师一样的强大……",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士白鸟座冰河便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"冰河，太好了，你还活着，这些杂碎的首领就在前面，我不会，不会让他活着离开的！！！",
                  name = _t"艾尔扎克",
                  img = "res\\portrait\\皇后岛学员枫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[249] =        ---_新三环大蛇
{
     delay = 4000,
     [1] = {
                  txt = _t"快走，你这个亵渎神的家伙！",
                  name = _t"弓箭手托尔",
                  img = "res\\portrait\\北欧神族勇士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"我的孩子，你们错了，洛基他根本不是神，他是恶魔，他会摧毁整个世界！",
                  name = _t"神族长老",
                  img = "res\\portrait\\北欧神族长老男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"别再和他废话了，这个老东西是个不折不扣的异教徒，我们只要将他押送至最高处，然后将他处决就好了！",
                  name = _t"弓箭手克尔",
                  img = "res\\portrait\\北欧神族勇士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [4] = {
                  txt = _t"快走，老家伙，我们要用你的鲜血来平息神的愤怒，这是你的荣幸！",
                  name = _t"弓箭手托尔",
                  img = "res\\portrait\\北欧神族勇士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [5] = {
                  txt = _t"神啊，原谅他们吧，他们被迷惑的太久了，根本不知道自己在做什么，希望我的血能唤醒他们！",
                  name = _t"神族长老",
                  img = "res\\portrait\\北欧神族长老男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [6] = {
                  txt = _t"还在罗哩罗嗦什么，拖延时间么，快走，不要逼我动手啊，你这异教徒！",
                  name = _t"弓箭手托尔",
                  img = "res\\portrait\\北欧神族勇士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[250] =        ---_新三环大蛇
{
     delay = 5000,
     [1] = {
                  txt = _t"感谢你们救了我，净化邪神的道路很危险，我这里有些东西，也许能帮助到你们，看一看吧！",
                  name = _t"神族长老",
                  img = "res\\portrait\\北欧神族长老男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[251] =        ---_新三环大蛇
{
     delay = 3000,
     [1] = {
                  txt = _t"洛基，你这个邪神，我诅咒你，你必将灭亡！",
                  name = _t"神族长老",
                  img = "res\\portrait\\北欧神族长老男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"我等着，不过你永远看不到这天了，灵魂湮灭！",
                  name = _t"邪神洛基",
                  img = "res\\portrait\\死神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5172] =        ---冰河回忆_冰河回忆
{
     delay = 3000,
     [1] = {
                  txt = _t"谁人阻碍吾皇圣选仪式，这个村子有未来的海将军，我需要现在带他走，为日后吾皇征伐大陆服务。",
                  name = _t"魔鬼鱼灵体",
                  img = "res\\portrait\\海斗士北海巨妖.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"什么皇！什么圣选仪式！为什么海将军！就因为这些就能让我们整个村子都被你任意屠戮吗！",
                  name = _t"艾尔扎克",
                  img = "res\\portrait\\皇后岛学员枫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不能原谅，不能原谅，我不能原谅你们！！！",
                  name = _t"艾尔扎克",
                  img = "res\\portrait\\皇后岛学员枫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"嗯？这个愤怒复杂的小宇宙非常强大啊！",
                  name = _t"魔鬼鱼灵体",
                  img = "res\\portrait\\海斗士北海巨妖.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[252] =        ---冰河回忆_冰河回忆
{
     delay = 3000,
     [1] = {
                  txt = _t"吾皇之力赐予我力量！",
                  name = _t"魔鬼鱼灵体",
                  img = "res\\portrait\\海斗士北海巨妖.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"冰河！危险！闪开！！！",
                  name = _t"艾尔扎克",
                  img = "res\\portrait\\皇后岛学员枫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不！艾尔扎克！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士白鸟座冰河便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"哈哈哈哈哈哈哈！",
                  name = _t"魔鬼鱼灵体",
                  img = "res\\portrait\\海斗士北海巨妖.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"愚蠢的人类，居然妄图与吾之神力对抗！",
                  name = _t"魔鬼鱼灵体",
                  img = "res\\portrait\\海斗士北海巨妖.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [6] = {
                  txt = _t"冰河跟你那个愚蠢的朋友一起去地狱相会吧！",
                  name = _t"魔鬼鱼灵体",
                  img = "res\\portrait\\海斗士北海巨妖.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [7] = {
                  txt = _t"你说谁要去地狱？",
                  name = _t"艾尔扎克",
                  img = "res\\portrait\\皇后岛学员枫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [8] = {
                  txt = _t"艾尔扎克！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士白鸟座冰河便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [9] = {
                  txt = _t"怎么会，怎么可能再站起来！",
                  name = _t"魔鬼鱼灵体",
                  img = "res\\portrait\\海斗士北海巨妖.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [10] = {
                  txt = _t"下地狱的会是你！",
                  name = _t"艾尔扎克",
                  img = "res\\portrait\\皇后岛学员枫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5087] =        ---冰河回忆_冰河回忆
{
     delay = 5000,
     [1] = {
                  txt = _t"这就是吾皇所谓的试炼吗？但是吾此行的目的已经达到，那位后继的海魔鱼将军今后一定能发扬吾海之神力！",
                  name = _t"魔鬼鱼灵体",
                  img = "res\\portrait\\海斗士北海巨妖.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"死到最后居然还在说一些莫名其妙的话！",
                  name = _t"艾尔扎克",
                  img = "res\\portrait\\皇后岛学员枫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不管是谁，只要践踏我心中的正义，我一定要将他们击败！",
                  name = _t"艾尔扎克",
                  img = "res\\portrait\\皇后岛学员枫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"守护正义！守护圣域！守护雅典娜女神！",
                  name = _t"艾尔扎克",
                  img = "res\\portrait\\皇后岛学员枫.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"艾尔扎克成为圣斗士的理想好崇高，他一定可以成为白鸟座的圣斗士吧！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士白鸟座冰河便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4886] =        ---危急！沙织失踪_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"这里就是亚特兰蒂斯？想不到海底还有这样的地方！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4784] =        ---前代海皇涅柔斯_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"不好啦！海盗来啦！他们来抢水和粮食啦！",
                  name = _t"慌张的孩子",
                  img = "res\\portrait\\星之子学员瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"你说什么！该死！这些没有人性的家伙！",
                  name = _t"雅弗",
                  img = "res\\portrait\\北欧神族长老男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"该怎么办？难道我们就要死了吗？不，我不想死，呜呜……",
                  name = _t"慌张的船员",
                  img = "res\\portrait\\星之子学员瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[5124] =        ---传书！神秘的召唤！（天马）_职业任务-圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"%s收？这封信是给我的？真奇怪……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"听说你到圣域后，混得不错。我即将返回圣域，正好与你一见！我在雅典娜巨像下面等你——知名不具",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"看来，有一个人想要见我……会是谁呢？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5142] =        ---子任务一：神秘人_职业任务-圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"%s，你终于来了，还在奇怪我是什么人？嘿嘿……想知道我是谁，得先追上我才成！",
                  name = _t"神秘人",
                  img = "res\\portrait\\庐山神秘怪人.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"是你给我发的信？你是谁？别跑……你给我站住！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[7340] =        ---18级FIGHT！灵活的闪避！天马_职业任务-圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"莎尔娜！住手！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"看到你穿着的天马圣衣，我就会想起那个讨厌的小子！看拳！",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\沙尔拉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[5125] =        ---传书！神秘的召唤！（白鸟）_职业任务-圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"%s收？这封信是给我的？真奇怪……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"听说你到圣域后，混得不错。我即将返回圣域，正好与你一见！我在雅典娜巨像下面等你——知名不具",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"看来，有一个人想要见我……会是谁呢？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5143] =        ---子任务一：神秘人_职业任务-圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"%s，你终于来了，还在奇怪我是什么人？嘿嘿……想知道我是谁，得先追上我才成！",
                  name = _t"神秘人",
                  img = "res\\portrait\\庐山神秘怪人.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"是你给我发的信？你是谁？别跑……你给我站住！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[7341] =        ---18级FIGHT！灵活的闪避！白鸟_职业任务-圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"莎尔娜！住手！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"看来你选择了白鸟座作为你的守护星座，来，看看你的冻气是否能够冰冻我！看拳！",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\沙尔拉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[5126] =        ---传书！神秘的召唤！（天龙）_职业任务-圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"%s收？这封信是给我的？真奇怪……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"听说你到圣域后，混得不错。我即将返回圣域，正好与你一见！我在雅典娜巨像下面等你——知名不具",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"看来，有一个人想要见我……会是谁呢？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5144] =        ---子任务一：神秘人_职业任务-圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"%s，你终于来了，还在奇怪我是什么人？嘿嘿……想知道我是谁，得先追上我才成！",
                  name = _t"神秘人",
                  img = "res\\portrait\\庐山神秘怪人.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"是你给我发的信？你是谁？别跑……你给我站住！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[7342] =        ---18级FIGHT！灵活的闪避！天龙_职业任务-圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"莎尔娜！住手！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"拥有了世界上最坚硬的盾，未必就是无敌的，让我来掂量一下你的实力吧！看拳！",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\沙尔拉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[5127] =        ---传书！神秘的召唤！（仙女）_职业任务-圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"%s收？这封信是给我的？真奇怪……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"听说你到圣域后，混得不错。我即将返回圣域，正好与你一见！我在雅典娜巨像下面等你——知名不具",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"看来，有一个人想要见我……会是谁呢？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5145] =        ---子任务一：神秘人_职业任务-圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"%s，你终于来了，还在奇怪我是什么人？嘿嘿……想知道我是谁，得先追上我才成！",
                  name = _t"神秘人",
                  img = "res\\portrait\\庐山神秘怪人.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"是你给我发的信？你是谁？别跑……你给我站住！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[7343] =        ---18级FIGHT！灵活的闪避！仙女_职业任务-圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"莎尔娜！住手！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"%s，你居然选择了仙女座作为守护星座！这注定了你的失败！看拳！",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\沙尔拉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[5128] =        ---传书！神秘的召唤！（凤凰）_职业任务-圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"%s收？这封信是给我的？真奇怪……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"听说你到圣域后，混得不错。我即将返回圣域，正好与你一见！我在雅典娜巨像下面等你——知名不具",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"看来，有一个人想要见我……会是谁呢？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5146] =        ---子任务一：神秘人_职业任务-圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"%s，你终于来了，还在奇怪我是什么人？嘿嘿……想知道我是谁，得先追上我才成！",
                  name = _t"神秘人",
                  img = "res\\portrait\\庐山神秘怪人.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"是你给我发的信？你是谁？别跑……你给我站住！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[7344] =        ---18级FIGHT！灵活的闪避！凤凰_职业任务-圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"莎尔娜！住手！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"%s，浴火重生的凤凰星座，将因为你的失败而蒙上污点！看拳！",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\沙尔拉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[5129] =        ---再战！不甘的大熊座！（天马）_青木原树海
{
     delay = 3000,
     [1] = {
                  txt = _t"%s收？又是谁给我传书？真奇怪……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"虽然我曾经输给过星矢，可不代表我就怕了天马座！%s，我在青木原树海等着与你一战！——大熊座檄",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[7345] =        ---25级FIGHT！沉着的格挡！天马_青木原树海
{
     delay = 3000,
     [1] = {
                  txt = _t"%s，出手吧，我将在这里洗刷掉天马座星矢所带给我的耻辱！",
                  name = _t"大熊座檄",
                  img = "res\\portrait\\青铜圣斗士大熊座檄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[5131] =        ---再战！执着的水蛇座！（白鸟）_青木原树海
{
     delay = 3000,
     [1] = {
                  txt = _t"%s收？又是谁给我传书？真奇怪……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"虽然我曾经输给过冰河，可不代表我就怕了白鸟座！%s，我在青木原树海等着与你一战！——水蛇座市",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[7346] =        ---25级FIGHT！沉着的格挡！白鸟_青木原树海
{
     delay = 3000,
     [1] = {
                  txt = _t"银河战争中的失败是我毕生的耻辱，击败白鸟星座将是我永恒的宿命！",
                  name = _t"水蛇座市",
                  img = "res\\portrait\\青铜圣斗士水蛇座市.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[5132] =        ---再战！好战的幼狮座！（天龙）_青木原树海
{
     delay = 3000,
     [1] = {
                  txt = _t"%s收？又是谁给我传书？真奇怪……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"虽然我曾经输给过紫龙，可不代表我就怕了天龙座！%s，我在青木原树海等着与你一战！——幼狮座蛮",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[7347] =        ---25级FIGHT！沉着的格挡！天龙_青木原树海
{
     delay = 3000,
     [1] = {
                  txt = _t"不要以为你自己真的是防御无敌，银河战争里你最幸运的是没有遇到我！",
                  name = _t"幼狮座蛮",
                  img = "res\\portrait\\青铜圣斗士幼狮座蛮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[5133] =        ---再战！阴险的独角兽！（仙女）_青木原树海
{
     delay = 3000,
     [1] = {
                  txt = _t"%s收？又是谁给我传书？真奇怪……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"虽然我曾经输给过瞬，可不代表我就怕了仙女座！%s，我在青木原树海等着与你一战！——独角兽座邪武",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[7348] =        ---25级FIGHT！沉着的格挡！仙女_青木原树海
{
     delay = 3000,
     [1] = {
                  txt = _t"在纱织小姐面前，我必须收敛起最擅长的邪恶手段。这次，我将火力全开！",
                  name = _t"独角兽座邪武",
                  img = "res\\portrait\\青铜圣斗士独角兽座邪武.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[5134] =        ---再战！狡猾的天狼座！（凤凰）_青木原树海
{
     delay = 3000,
     [1] = {
                  txt = _t"%s收？又是谁给我传书？真奇怪……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"虽然我曾经输给过一辉，可不代表我就怕了凤凰座！%s，我在青木原树海等着与你一战！——天狼座那智",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[7349] =        ---25级FIGHT！沉着的格挡！凤凰_青木原树海
{
     delay = 3000,
     [1] = {
                  txt = _t"不要总是一副嚣张至极的样子！咬人的狗从来不叫，杀人的狼只愿意偷袭！",
                  name = _t"天狼座那智",
                  img = "res\\portrait\\青铜圣斗士天狼座那智.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5116] =        ---战斗！海盗来袭_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"不好！这家伙太厉害，我们快跑！",
                  name = _t"疯狂的船员",
                  img = "res\\portrait\\遗忘之路流放者2.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4893] =        ---涅柔斯之村_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"站住！这里不欢迎人类！",
                  name = _t"人鱼守卫",
                  img = "res\\portrait\\怪物海斗士杂兵瘦（鳍半透明.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4895] =        ---出现！海斗士狄蒂斯_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"哼，打败我并不算什么！海皇陛下已经归来，你很快就能见识到海斗士真正的强大。",
                  name = _t"狄蒂丝",
                  img = "res\\portrait\\海斗士美人鱼鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4899] =        ---海皇真正的身份？_亚特兰蒂斯
{
     delay = 2000,
     [1] = {
                  txt = _t"哎呀，这是哪里？谁找我！",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"贵鬼！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4809] =        ---勇气的证明_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"你走吧，我倒是想看看你能走多远！哈哈哈！",
                  name = _t"拜安",
                  img = "res\\portrait\\海将军马拜安.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4902] =        ---快！追上沙织_亚特兰蒂斯
{
     delay = 2000,
     [1] = {
                  txt = _t"纱织小姐！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4903] =        ---海魔女苏兰特_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"%s，请不要阻止我。我必须去见海皇，只有这样才能阻止这场灾难！",
                  name = _t"城户纱织",
                  img = "res\\portrait\\城户纱织.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"不……纱织小姐！这样太危险了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"苏兰特，我们走吧。",
                  name = _t"城户纱织",
                  img = "res\\portrait\\城户纱织.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4904] =        ---海魔女苏兰特_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"咦？魔铃！阿鲁迪巴！艾欧里亚！米罗！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4912] =        ---心灵狩猎者_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"这个奇怪的震动是怎么回事？难道修亚说的是真的？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4917] =        ---苏醒？海皇波塞冬_亚特兰蒂斯
{
     delay = 4000,
     [1] = {
                  txt = _t"伟大的海皇陛下，我是您最忠诚的斗士。以我的鲜血为引，降临您的意志吧。",
                  name = _t"修亚",
                  img = "res\\portrait\\便装加隆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哼，忠诚？与雅典娜的圣斗士合作，这就是你的忠诚？",
                  name = _t"海皇波塞冬",
                  img = "res\\portrait\\海皇波塞冬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不，陛下，神秘人篡夺了海飞龙圣衣。他阴谋的利用您的转世。海龙一族世代守护陛下，绝不能让这样的事情发生。",
                  name = _t"修亚",
                  img = "res\\portrait\\便装加隆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"哈哈哈，荒谬！没有人可以利用我。占领大地，这就是我的意志。你居然违背我的意志！背叛者没有生存的价值！",
                  name = _t"海皇波塞冬",
                  img = "res\\portrait\\海皇波塞冬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"怎么会这样……怎么会这样……我是个背叛者……可耻的背叛者，没有活下去的价值……",
                  name = _t"修亚",
                  img = "res\\portrait\\便装加隆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [6] = {
                  txt = _t"等等，修亚！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4920] =        ---恐怖的海妖_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"不错，不错，你居然能够在卡萨的幻境中活下来。",
                  name = _t"海飞龙",
                  img = "res\\portrait\\【海龙】加隆头像.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"什么人！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4838] =        ---复活！新生的圣衣_亚特兰蒂斯
{
     delay = 1000,
     [1] = {
                  txt = _t"嘿嘿，我们来了！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"有我！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"有我！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"还有我！",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4840] =        ---海斗士巡查者_亚特兰蒂斯
{
     delay = 2000,
     [1] = {
                  txt = _t"我们走！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4844] =        ---惊现，异次元空间_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"这是异次元空间的力量，我们都见过，而且我的体验最为深刻！",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"一辉！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4850] =        ---封闭的大门_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"等等，我和你一起去！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4927] =        ---开启大门_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"什么人！",
                  name = _t"海斗士哨卫",
                  img = "res\\portrait\\怪物海斗士杂兵瘦（鳍半透明.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4854] =        ---突破！比米尼大墙_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"我们走！紫龙他们就在前面。",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4932] =        ---海豚之心_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"奇怪怎么什么都没有？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"不好！海豚之心已经没海皇子拿走了！我们已经被包围了！",
                  name = _t"海龙潜藏者",
                  img = "res\\portrait\\怪物海斗士杂兵瘦（鳍半透明.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4858] =        ---死战！波塞多尼亚_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"哈哈哈，杀死这个圣斗士。海皇大人一定会重重的赏我们！",
                  name = _t"海皇子侍卫",
                  img = "res\\portrait\\怪物海斗士杂兵瘦（鳍半透明.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4935] =        ---看不见的城塞_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"嘿嘿，听说了没有？有几个圣斗士闯到这里来了。",
                  name = _t"海皇子侍卫",
                  img = "res\\portrait\\怪物海斗士杂兵瘦（鳍半透明.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"什么！他们怎么会到这里来，难道连海将军大人们也不是他们的对手？",
                  name = _t"海皇子侍卫",
                  img = "res\\portrait\\怪物海斗士杂兵瘦（鳍半透明.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"当然不是。大人们要帮助海皇陛下对付雅典娜，根本就没有时间理会这几个圣斗士。",
                  name = _t"海皇子侍卫",
                  img = "res\\portrait\\怪物海斗士杂兵瘦（鳍半透明.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"可是，放任他们在城里乱串，会不会让他们找到去神殿的方法？",
                  name = _t"海皇子侍卫",
                  img = "res\\portrait\\怪物海斗士杂兵瘦（鳍半透明.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"放心吧。除非他们能拿到队长的城塞地图，否则根本不可能找到克修拉大人。",
                  name = _t"海皇子侍卫",
                  img = "res\\portrait\\怪物海斗士杂兵瘦（鳍半透明.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4937] =        ---光之后的世界_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"我们走！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4939] =        ---巨弩的威胁_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"与波塞冬陛下作对的污秽之徒啊，你们这是在找死！",
                  name = _t"克修拉",
                  img = "res\\portrait\\海将军海皇子克修拉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4940] =        ---巨弩的威胁_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"这是？海皇子克修拉！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4865] =        ---激斗海皇子_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"既然如此，我就代表波塞冬陛下净化你们这些污秽之徒。",
                  name = _t"克修拉",
                  img = "res\\portrait\\海将军海皇子克修拉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4867] =        ---快！时间不多了_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"不好了，冰河和瞬遇到危险了。",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4870] =        ---冰与火的碰撞_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"快，那些圣斗士就在里面，把这里炸掉，绝不能让他们活着出来！",
                  name = _t"狂热的海斗士",
                  img = "res\\portrait\\怪物海斗士杂兵瘦（鳍半透明.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4875] =        ---六圣兽的强袭_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"这次我就放过你们。告诉冰河，下次我会取他的性命。",
                  name = _t"艾尔扎克",
                  img = "res\\portrait\\海斗士北海巨妖.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哼，艾尔扎克，我可不打算放过他们。我要让他们见识下六圣兽的厉害！",
                  name = _t"六圣兽",
                  img = "res\\portrait\\海将军六圣兽.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"这是你的事情，我不会干涉。",
                  name = _t"艾尔扎克",
                  img = "res\\portrait\\海斗士北海巨妖.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4877] =        ---冲出波塞多尼亚_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"我们走！去海皇神殿！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4878] =        ---神秘的海龙座_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"我们一定要救出纱织小姐，谁也阻止不了！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"等等，星矢。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4879] =        ---最强的海将军_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"%s，这里就交给你了！你一定要赶上来，我们在前面等你！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[4880] =        ---来自远方的帮助_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"等等！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4953] =        ---来自远方的帮助_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"%s，不用追了！星矢他们需要你的帮助！",
                  name = _t"童虎",
                  img = "res\\portrait\\黄金圣斗士天秤座童虎老年.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"老师！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"你在这里等莎尔娜，她会告诉你该怎么做。",
                  name = _t"童虎",
                  img = "res\\portrait\\黄金圣斗士天秤座童虎老年.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[253] =        ---_重生！圣域镇魂歌
{
     delay = 3000,
     [1] = {
                  txt = _t"多么新鲜的躯体！不过真是可惜呢，很快你们都将变成墓地里的青苔！",
                  name = _t"前代变色龙座珍妮",
                  img = "res\\portrait\\青铜圣斗士变色龙座珍妮冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"珍妮大人请稍事休息，就让属下来收拾这帮不知死活的家伙！",
                  name = _t"墓地卫队长",
                  img = "res\\portrait\\冥斗士大镰刀男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[254] =        ---_新三环北欧小镇
{
     delay = 5000,
     [1] = {
                  txt = _t"善良的圣斗士们，不要靠近我！小心有埋伏！",
                  name = _t"克斯丁",
                  img = "res\\portrait\\北欧神族勇士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"小心！他们来了！",
                  name = _t"克斯丁",
                  img = "res\\portrait\\北欧神族勇士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[255] =        ---_新三环北欧小镇
{
     delay = 5000,
     [1] = {
                  txt = _t"太感谢你们了！我这里有些好东西，有需要的就便宜点卖给你们",
                  name = _t"克斯丁",
                  img = "res\\portrait\\北欧神族勇士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5329] =        ---战斗之路_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"谢谢你，拉娜！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[197] =        ---白鸟的背叛？_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"冰河，这里就交给你了，不要辜负教皇对你的信任！",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\莎尔娜.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"……",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4898] =        ---潜藏的危机_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"人呢，怎么不见了？",
                  name = _t"海斗士奸细",
                  img = "res\\portrait\\怪物海斗士杂兵瘦（鳍半透明.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"不知道啊，老东西走得挺快。",
                  name = _t"海斗士奸细",
                  img = "res\\portrait\\怪物海斗士杂兵瘦（鳍半透明.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不好！快去找找！",
                  name = _t"海斗士奸细",
                  img = "res\\portrait\\怪物海斗士杂兵瘦（鳍半透明.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5086] =        ---冰河回忆_冰河回忆
{
     delay = 5000,
     [1] = {
                  txt = _t"前面的人是？艾尔扎克，太好了。",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士白鸟座冰河便装.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[256] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"我的铁拳早已饥渴难耐！",
                  name = _t"雷虎魔化",
                  img = "res\\portrait\\庐山雷虎变异.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[257] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"虎跃冲击！",
                  name = _t"雷虎魔化",
                  img = "res\\portrait\\庐山雷虎变异.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[258] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"收集你们这些弱小者的灵魂是我的爱好！",
                  name = _t"巨蟹座",
                  img = "res\\portrait\\黄金圣斗士巨蟹座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[259] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"积尸气冥界波！！！",
                  name = _t"巨蟹座",
                  img = "res\\portrait\\黄金圣斗士巨蟹座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[260] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"我不想任何人来这里打扰我。",
                  name = _t"海龙灵体",
                  img = "res\\portrait\\海将军海龙鳞衣人形版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[261] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"大海无量！",
                  name = _t"海龙灵体",
                  img = "res\\portrait\\海将军海龙鳞衣人形版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[262] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"我的圣剑将斩断一切！",
                  name = _t"摩羯座",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[263] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"圣剑出击！",
                  name = _t"摩羯座",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[264] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"我对你的憎恨已经无法叠加！",
                  name = _t"基鲁提",
                  img = "res\\portrait\\基鲁提.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[265] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"火焰之拳！",
                  name = _t"基鲁提",
                  img = "res\\portrait\\基鲁提.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[266] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"这里只有神可以允许进入。",
                  name = _t"处女座",
                  img = "res\\portrait\\黄金圣斗士处女座沙加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[267] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"天神降世！",
                  name = _t"处女座",
                  img = "res\\portrait\\黄金圣斗士处女座沙加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4558] =        ---_剧本：七大洋之战
{
     delay = 4000,
     [1] = {
                  txt = _t"瞬，童虎老师让我带来了天秤座的黄金圣衣！",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4565] =        ---_剧本：七大洋之战
{
     delay = 4000,
     [1] = {
                  txt = _t"一辉，只有用天秤座的黄金圣衣才能破坏海之柱！",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4570] =        ---_剧本：七大洋之战
{
     delay = 4000,
     [1] = {
                  txt = _t"莎，莎尔娜小姐！你怎么了？振作一点！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哼，不自量力的家伙！生命之柱应该灌满了水，雅典娜就快死了，快滚开吧！",
                  name = _t"海皇波塞冬",
                  img = "res\\portrait\\海皇波塞冬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"你才应该给我滚开！波塞冬！不然就尝尝我的拳头！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"算了吧，你连我的一个小指头也动不了，因为我可是神啊！",
                  name = _t"海皇波塞冬",
                  img = "res\\portrait\\海皇波塞冬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"你算什么神！就让我星矢来打倒你！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[268] =        ---_剧本：七大洋之战
{
     delay = 4000,
     [1] = {
                  txt = _t"哈哈哈！向神挥拳，必定会全数打回到自己身上！",
                  name = _t"海皇波塞冬",
                  img = "res\\portrait\\海皇波塞冬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[269] =        ---_剧本：七大洋之战
{
     delay = 4000,
     [1] = {
                  txt = _t"我不是说过了吗，我是神啊！对你而言，就到此为止了。",
                  name = _t"海皇波塞冬",
                  img = "res\\portrait\\海皇波塞冬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"就算你是神，我也一定，要，打倒你！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[270] =        ---_剧本：七大洋之战
{
     delay = 4000,
     [1] = {
                  txt = _t"你居然对你的弟弟下手，你究竟是不是人类！",
                  name = _t"海怪",
                  img = "res\\portrait\\海斗士水魔鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"白痴，真正的瞬就倒在哪里。",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[271] =        ---_剧本：七大洋之战
{
     delay = 4000,
     [1] = {
                  txt = _t"如果早知道你的弱点是艾丝美拉达，也许我还可以杀掉你……",
                  name = _t"海怪",
                  img = "res\\portrait\\海斗士水魔鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"没错，如果不是你已经力尽了，也许可以杀掉我。",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4567] =        ---_4000
{
     delay = 4000,
     [1] = {
                  txt = _t"太好了，南冰洋之柱也被击碎了！",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[272] =        ---_
{
     delay = 4000,
     [1] = {
                  txt = _t"六兽妖有六种招式，我必须在他出招的时候用锁链的不同形状来对付他……",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3831] =        ---皇后岛突变_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"哎呀，是哪个缺德的家伙？敢拿水泼我！",
                  name = _t"大有",
                  img = "res\\portrait\\圣斗士男学员少年艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3842] =        ---黑暗天狼座_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"快，就在那里！快就在那些石头后面！",
                  name = _t"奴隶",
                  img = "res\\portrait\\皇后岛男奴隶.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3856] =        ---一把大火_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"咳咳咳，怎么回事？外面怎么会有这么多烟？算了，你们快跟我回去吧！",
                  name = _t"矿坑守卫",
                  img = "res\\portrait\\黑暗杂兵远程1.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[3765] =        ---奴隶主的命令_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"还是先向附近的奴隶打听一下吧。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3862] =        ---消失的候补生_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"再到里面看看。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3869] =        ---黑暗暗杀者_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"快走！枫让我来救你们！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哈哈哈，走？往哪里走！这次一定要让你们死无葬身之地！",
                  name = _t"黑暗暗杀者",
                  img = "res\\portrait\\黑暗杂兵1.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"该死！这果然是个阴谋！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3902] =        ---黑暗中的身影_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"可恶，让他给逃了！他到底是谁？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3882] =        ---奇怪的举动_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"怎会这样？大长老！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[3801] =        ---醒悟_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"看来一辉已经去救大长老了，我必须赶快去与他汇合！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3861] =        ---奴隶主的命令_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"年轻人，你请不要再为难他们了。他们什么也不会说的。",
                  name = _t"老奴隶",
                  img = "res\\portrait\\皇后岛奴隶主.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4351] =        ---圣斗士守则_群星之地
{
     delay = 2000,
     [1] = {
                  txt = _t"嘿嘿，%s，魔铃也让你来背圣斗士守则了！",
                  name = _t"星矢",
                  img = "res\\portrait\\星矢圣域便装版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"星矢！要是让魔铃听到你说这些话，你又该被罚了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3005] =        ---战斗修行_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"呜哈哈，小不点，我要把你捏碎！",
                  name = _t"卡西欧士",
                  img = "res\\portrait\\卡西欧士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"住手！卡西欧士，你要违反圣斗士守则吗？",
                  name = _t"魔铃",
                  img = "res\\portrait\\魔铃.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"哼，魔铃。我的弟子还轮不到你来管，还是管好你自己的人吧！",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\莎尔娜.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
NpcAcceptIdTask[5441] =        ---守护银都市！_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"糟糕！我要快点通知古拉杜财团警卫们行动起来，保护银都市！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5641] =        ---制裁，教皇之怒！_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"圣域士兵竟然是由这些怪物伪装的！那教皇到底是什么？！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5288] =        ---人鱼之泪（二）_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"啊！痛……该死的怪物！我不能在这里失败！莉莉……",
                  name = _t"皮克斯",
                  img = "res\\portrait\\圣域圣斗士男学员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"坚持住，皮克斯，由我来消灭这个怪物！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5291] =        ---人鱼之泪（四）_亚特兰蒂斯
{
     delay = 3000,
     [1] = {
                  txt = _t"莉莉，不管你变成什么样，我都会全心全意的爱着你。所以嫁给我吧，我爱你。",
                  name = _t"皮克斯",
                  img = "res\\portrait\\圣域圣斗士男学员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[273] =        ---_副本:七大洋柱
{
     delay = 7000,
     [1] = {
                  txt = _t"要想拯救雅典娜，必须先打败镇守七大洋巨柱的七个海斗士。你们先前往北冰洋之柱，打败魔鬼鱼艾尔扎克吧！",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[274] =        ---_副本:七大洋柱
{
     delay = 7000,
     [1] = {
                  txt = _t"接下来前往北太平洋之柱，消灭海马拜安吧！你们可以从巨柱旁的传送点回到海底平台中心。",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[275] =        ---_副本:七大洋柱
{
     delay = 7000,
     [1] = {
                  txt = _t"干得漂亮！镇守南太平洋的海斗士是六妖兽伊奥，他具有六种野兽的能力，小心应对他变化多端的攻击。",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[276] =        ---_副本:七大洋柱
{
     delay = 7000,
     [1] = {
                  txt = _t"印度洋的海皇子是最强大的海斗士之一，战胜他需要圣斗士强大的勇气和意志！",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[277] =        ---_副本:七大洋柱
{
     delay = 7000,
     [1] = {
                  txt = _t"时间紧迫，雅典娜危在旦夕！南冰洋的海斗士海怪卡萨会变成你熟悉人的模样，千万不要被他的伪装欺骗！",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[278] =        ---_副本:七大洋柱
{
     delay = 7000,
     [1] = {
                  txt = _t"镇守南大西洋的是海魔女苏兰特，当她的笛声响起时，你们就要小心了。",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[279] =        ---_副本:七大洋柱
{
     delay = 7000,
     [1] = {
                  txt = _t"镇守北大西洋的海龙加隆是双子座撒加的兄弟，他有着黄金圣斗士般的实力！你们一定要小心了！",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[280] =        ---_副本:七大洋柱
{
     delay = 7000,
     [1] = {
                  txt = _t"现在你们终于要面对海皇了！只要心中有着守卫雅典娜的决心，有着对人类的爱，即便是神也是可以被打败的！",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[281] =        ---_副本:七大洋柱
{
     delay = 7000,
     [1] = {
                  txt = _t"如果想要拯救雅典娜就来生命之柱找我！但是，人永远也不可能打败神的！",
                  name = _t"海皇",
                  img = "res\\portrait\\海皇波塞冬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[282] =        ---_副本:七大洋柱
{
     delay = 7000,
     [1] = {
                  txt = _t"你的圣衣本该是我的！",
                  name = _t"艾德幻象",
                  img = "res\\portrait\\新艾德.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[283] =        ---_副本:七大洋柱
{
     delay = 7000,
     [1] = {
                  txt = _t"如果不是你抢走了神衣碎片，我本可以成为最强的圣斗士！都是你！",
                  name = _t"阿历克斯幻象",
                  img = "res\\portrait\\圣斗士学员阿历克斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[284] =        ---_副本:七大洋柱
{
     delay = 7000,
     [1] = {
                  txt = _t"你的命是我救的，现在我就要拿回来！",
                  name = _t"雷虎幻象",
                  img = "res\\portrait\\庐山雷虎正常.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5723] =        ---陨落的天使_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"尤朵拉，我一定会把阿历克斯揪出来，为你报仇！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5722] =        ---陨落的天使_新版圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"村长！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[5739] =        ---世界中心的擂台_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"你来的很及时，%s，大家都在等你。",
                  name = _t"城户纱织",
                  img = "res\\portrait\\城户纱织.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"纱……纱织小姐！",
                  name = _t"古拉杜财团警卫",
                  img = "res\\portrait\\古拉杜财团雇员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3299] =        ---战斗在狂脊之巅！_新版圣域
{
     delay = 5000,
     [1] = {
                  txt = _t"圣斗士，不要太嚣张！让我杰夫卡取你的性命！！！",
                  name = _t"杰夫卡",
                  img = "res\\portrait\\冥斗士天败星伊万.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[5744] =        ---为了爱与正义_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"为了爱与正义！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [2] = {
                  txt = _t"我宣誓用自己的生命来守护雅典娜！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"很好！%s，以雅典娜之名，我在此宣布你成为新的圣斗士！",
                  name = _t"教皇",
                  img = "res\\portrait\\教皇.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[5745] =        ---为了爱与正义_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"为了爱与正义！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [2] = {
                  txt = _t"我宣誓用自己的生命来守护雅典娜！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"很好！%s，以雅典娜之名，我在此宣布你成为新的圣斗士！",
                  name = _t"教皇",
                  img = "res\\portrait\\教皇.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[5746] =        ---为了爱与正义_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"为了爱与正义！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [2] = {
                  txt = _t"我宣誓用自己的生命来守护雅典娜！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"很好！%s，以雅典娜之名，我在此宣布你成为新的圣斗士！",
                  name = _t"教皇",
                  img = "res\\portrait\\教皇.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[5747] =        ---为了爱与正义_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"为了爱与正义！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [2] = {
                  txt = _t"我宣誓用自己的生命来守护雅典娜！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"很好！%s，以雅典娜之名，我在此宣布你成为新的圣斗士！",
                  name = _t"教皇",
                  img = "res\\portrait\\教皇.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5761] =        ---为了爱与正义_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"可恶，为什么不行！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哼，那是因为你的修行还不够！",
                  name = _t"魔铃",
                  img = "res\\portrait\\魔铃.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5750] =        ---为了爱与正义_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"可恶，为什么不行！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哼，那是因为你的修行还不够！",
                  name = _t"魔铃",
                  img = "res\\portrait\\魔铃.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5753] =        ---为了爱与正义_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"可恶，为什么不行！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哼，那是因为你的修行还不够！",
                  name = _t"魔铃",
                  img = "res\\portrait\\魔铃.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5756] =        ---为了爱与正义_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"可恶，为什么不行！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哼，那是因为你的修行还不够！",
                  name = _t"魔铃",
                  img = "res\\portrait\\魔铃.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5759] =        ---为了爱与正义_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"可恶，为什么不行！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哼，那是因为你的修行还不够！",
                  name = _t"魔铃",
                  img = "res\\portrait\\魔铃.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1092] =        ---逃离比良坂_逃离比良坂
{
     delay = 3000,
     [1] = {
                  txt = _t"为什么感觉这个紫龙非常不对劲！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5798] =        ---逃离比良坂_逃离比良坂
{
     delay = 3000,
     [1] = {
                  txt = _t"怎么会，迷雾之后全部都是游尸！这就是黄泉比良坂吗！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5818] =        ---逃离比良坂_逃离比良坂
{
     delay = 5000,
     [1] = {
                  txt = _t"终于消灭了这些游尸，前面那个跑步的人是，庐山的阿步？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5817] =        ---逃离比良坂_逃离比良坂
{
     delay = 5000,
     [1] = {
                  txt = _t"一个爱跑步的游尸……等等前面那个人是谁？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5801] =        ---逃离比良坂_逃离比良坂
{
     delay = 5000,
     [1] = {
                  txt = _t"这个虽然长相是李云，但是应该也仅仅是一个游尸，他不攻击我究竟为何？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5805] =        ---逃离比良坂_逃离比良坂
{
     delay = 5000,
     [1] = {
                  txt = _t"虽然有些行动不便的感觉，但是很厉害的样子。。。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5804] =        ---逃离比良坂_逃离比良坂
{
     delay = 5000,
     [1] = {
                  txt = _t"前面那么多游尸，凭我自己恐怕很难冲过去啊。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5812] =        ---逃离比良坂_逃离比良坂
{
     delay = 5000,
     [1] = {
                  txt = _t"变回来了？要是能一直如此恐怕连冥王也可以击败吧！这个比良坂真是既恐怖又有趣。紫龙！这个小宇宙，对，是紫龙！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5813] =        ---逃离比良坂_逃离比良坂
{
     delay = 5000,
     [1] = {
                  txt = _t"瞧瞧这是谁来了，真是让我大吃一惊啊，居然可以突破游尸阵？怎么，要跟紫龙一起去地狱吗？哈哈，太感人了！",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座迪斯马斯克.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"迪斯马斯克，我们一定可以战胜你离开黄泉比良坂！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"迪斯马斯克，接受正义的惩罚吧！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"少在这里说大话了，现在就送你们到地狱去！",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座迪斯马斯克.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[285] =        ---逃离比良坂_逃离比良坂
{
     delay = 3000,
     [1] = {
                  txt = _t"来点有趣的东西！给我的小奴隶们开开荤！哈哈哈哈哈！",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座迪斯马斯克.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"啊……啊……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"%s，%s！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"小宇宙，小宇宙，爆发吧！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"什么！居然可以挣脱我的积尸气鬼束缚！越来越有趣了！",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座迪斯马斯克.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5815] =        ---逃离比良坂_逃离比良坂
{
     delay = 5000,
     [1] = {
                  txt = _t"为什么，为什么怎么也不能击倒迪斯马斯克，这就是黄金圣斗士的实力吗？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"有趣有趣！虽然只是两个青铜圣斗士却要逼得我真正的活动活动筋骨！",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座迪斯马斯克.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"准备好真正的战斗了吗！？下面将会是有趣的部分！",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座迪斯马斯克.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5900] =        ---_剧本：银河战争
{
     delay = 4000,
     [1] = {
                  txt = _t"紫龙，老师他……病危了！",
                  name = _t"春丽",
                  img = "res\\portrait\\春丽.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"什么！春丽，再等我几秒钟，我和你立刻回庐山！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"竟然这样说！紫龙，我是不会那么容易被你打倒的！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"别担心，星矢，等一下我必定一击打倒你！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5901] =        ---_剧本：银河战争
{
     delay = 4000,
     [1] = {
                  txt = _t"紫龙，我已经看穿庐山升龙霸的弱点了！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"什么？少说大话了，专心战斗吧！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[286] =        ---_风暴亚特兰蒂斯
{
     delay = 5000,
     [1] = {
                  txt = _t"很遗憾，还是假的海龙鳞衣！你们不会再有机会了，因为我决定亲自解决你们，受死吧……",
                  name = _t"狄蒂丝",
                  img = "res\\portrait\\海斗士美人鱼鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[287] =        ---_纱织的别墅
{
     delay = 5000,
     [1] = {
                  txt = _t"你的表现太令我失望了，还是再去锻炼锻炼吧！这次我不会再给你额外奖励的！",
                  name = _t"城户纱织",
                  img = "res\\portrait\\圣斗士_雅典娜.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3099] =        ---堕落的颂歌_遗忘之路主线
{
     delay = 3000,
     [1] = {
                  txt = _t"站住！留下买路钱！",
                  name = _t"强盗",
                  img = "res\\portrait\\圣域杂兵瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[288] =        ---_新三环北欧小镇
{
     delay = 3000,
     [1] = {
                  txt = _t"不要以为我受伤了，就畏惧你们！消灭你们简直易如反掌！",
                  name = _t"巴度",
                  img = "res\\portrait\\辅星剑齿虎巴度.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[289] =        ---_新三环北欧小镇
{
     delay = 3000,
     [1] = {
                  txt = _t"好像什么也没发现",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[290] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"低贱的种族，愚蠢的人类！",
                  name = _t"海魔鱼灵体",
                  img = "res\\portrait\\海斗士北海巨妖.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[291] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"大海的愤怒将彻底净化大陆！",
                  name = _t"海魔鱼灵体",
                  img = "res\\portrait\\海斗士北海巨妖.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[292] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"我的毒针将为你的生命画上句号！",
                  name = _t"天蝎座",
                  img = "res\\portrait\\黄金圣斗士天蝎座米罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[293] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"蝎子的毒针将正中你的命门！",
                  name = _t"天蝎座",
                  img = "res\\portrait\\黄金圣斗士天蝎座米罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[294] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"低贱的种族，愚蠢的人类！",
                  name = _t"六圣兽灵体",
                  img = "res\\portrait\\海将军六圣兽.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[295] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"圣熊咆哮的力量！",
                  name = _t"六圣兽灵体",
                  img = "res\\portrait\\海将军六圣兽.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[296] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"我将为你制作漂亮的永恒冰棺！",
                  name = _t"水瓶座",
                  img = "res\\portrait\\黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[297] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"女神的仁慈就是将你摧毁！",
                  name = _t"水瓶座",
                  img = "res\\portrait\\黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[298] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"你的血将映衬出我对哈迪斯大人的一片忠诚！",
                  name = _t"拉达曼迪斯",
                  img = "res\\portrait\\冥斗士天猛星拉大曼迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[299] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"终结吧！猛龙巨牙！",
                  name = _t"拉达曼迪斯",
                  img = "res\\portrait\\冥斗士天猛星拉大曼迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[300] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"战胜我，你就是这个人世的下一个神！不过这是一场痴梦了！",
                  name = _t"双子座",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[301] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"一切终结吧！",
                  name = _t"双子座",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[302] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"我的实力在黄金圣斗士之上？你应该马上就能明白！",
                  name = _t"戴达罗斯",
                  img = "res\\portrait\\白银仙皇座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[303] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"看看真正的星云锁链吧！",
                  name = _t"戴达罗斯",
                  img = "res\\portrait\\白银仙皇座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[304] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"你将优雅的死去，正如我优雅的杀戮。",
                  name = _t"双鱼座",
                  img = "res\\portrait\\黄金圣斗士双鱼座阿布罗狄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[305] =        ---个人挑战_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"死在玫瑰的盛宴之中，也是一种幸福。",
                  name = _t"双鱼座",
                  img = "res\\portrait\\黄金圣斗士双鱼座阿布罗狄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[306] =        ---_纱织的别墅
{
     delay = 5000,
     [1] = {
                  txt = _t"哼，所有的人都看不起我，等我这次抓回城户纱织，潘多拉大人一定会重重的赏赐我的！",
                  name = _t"地奇星赛洛斯",
                  img = "res\\portrait\\冥斗士地奇星赛洛斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[307] =        ---_纱织的别墅
{
     delay = 4000,
     [1] = {
                  txt = _t"纱织小姐，海皇命我来邀请您去亚特兰蒂斯做客！",
                  name = _t"海魔女苏兰特",
                  img = "res\\portrait\\海将军海魔女苏兰特.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"什么？你不愿意去，那么不要怪我了！",
                  name = _t"海魔女苏兰特",
                  img = "res\\portrait\\海斗士海魔女鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6631] =        ---纱织的日记_纱织的别墅
{
     delay = 8000,
     [1] = {
                  txt = _t"今天，我很开心，他回来了，带着他的圣衣！可是他一回来就顶撞我，最终我答应帮他找到他的姐姐，代价是他参加我举办的银河竞技赛……",
                  name = _t"城户纱织",
                  img = "res\\portrait\\圣斗士_雅典娜.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[308] =        ---纱织的日记_冥斗士阴影_纱织的别墅
{
     delay = 10000,
     [1] = {
                  txt = _t"银河擂台赛终于开始了。灯光暗了下来，俯瞰着灯柱中的擂台及黑暗中攒攒而动的众人。与他们的距离是那么遥远，我不想当女神，女神的记忆里有无尽的战斗与血腥，冥王、海皇都是我的敌人，而我却只想做一个平常的女孩……",
                  name = _t"城户纱织",
                  img = "res\\portrait\\圣斗士_雅典娜.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[309] =        ---十二宫拯救冰河_十二宫-天秤宫
{
     delay = 3000,
     [1] = {
                  txt = _t"这个冰棺里的人是……冰河！",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"冰河……一定要坚持住！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"冰河，永远都不要放弃生的希望！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6732] =        ---遗忘的启程_遗忘之路主线
{
     delay = 3000,
     [1] = {
                  txt = _t"前面那个人是……加米安？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6750] =        ---狮子的荣耀_遗忘之路主线
{
     delay = 3000,
     [1] = {
                  txt = _t"不好啦！那个小姑娘不见了！",
                  name = _t"加米安",
                  img = "res\\portrait\\白银乌鸦座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"什么？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3143] =        ---昔日的战场_遗忘之路主线
{
     delay = 3000,
     [1] = {
                  txt = _t"勇敢的圣斗士，是时候让你知道历史的真相了！",
                  name = _t"命运女神",
                  img = "res\\portrait\\命运女神幻像.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[2872] =        ---凶手的跟随_遗忘之路主线
{
     delay = 3000,
     [1] = {
                  txt = _t"哼！这个傻瓜，果然中计了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3141] =        ---未来的萌芽_遗忘之路主线
{
     delay = 3000,
     [1] = {
                  txt = _t"你，终于来了！我等你很久了。",
                  name = _t"神秘男子",
                  img = "res\\portrait\\庐山神秘怪人.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6779] =        ---祭司的呼唤_遗忘之路主线
{
     delay = 3000,
     [1] = {
                  txt = _t"勇敢的少年，到我这里来。",
                  name = _t"克洛托",
                  img = "res\\portrait\\命运女神幻像.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6781] =        ---囚徒之地狱_遗忘之路主线
{
     delay = 2000,
     [1] = {
                  txt = _t"我……似乎记起了一些事情……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"周围的震动，是怎么回事？",
                  name = _t"加隆",
                  img = "res\\portrait\\便装加隆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6784] =        ---囚徒之地狱_遗忘之路主线
{
     delay = 3000,
     [1] = {
                  txt = _t"终于，要还我自由了么？为什么，我没有一点激动。",
                  name = _t"加隆",
                  img = "res\\portrait\\便装加隆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"你是谁？为什么会被关在这里？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"这不重要！我现在心里充满了仇恨，但也充满了希望。咦？你居然中了幻胧魔皇拳？",
                  name = _t"加隆",
                  img = "res\\portrait\\便装加隆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"幻胧魔皇拳？我不明白你的意思……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"哈哈哈！遇到我是你的幸运！让我解开你的魔咒！就当是我对那个可怕男人的复仇方式吧！",
                  name = _t"加隆",
                  img = "res\\portrait\\便装加隆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [6] = {
                  txt = _t"啊啊啊啊……我的头……好疼……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6785] =        ---神圣的罪恶_遗忘之路主线
{
     delay = 3000,
     [1] = {
                  txt = _t"快！离开这里！",
                  name = _t"希尔汗",
                  img = "res\\portrait\\庐山神秘怪人.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6350] =        ---阿赖耶识_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"呱呱，早知道那三个黄金圣斗士不可靠。居然让一只小蚂蚁跟到这里来了。",
                  name = _t"赛洛斯",
                  img = "res\\portrait\\冥斗士地奇星赛洛斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"呱呱，幸亏被伟大的赛洛斯大人发现了！",
                  name = _t"赛洛斯",
                  img = "res\\portrait\\冥斗士地奇星赛洛斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"地奇星赛洛斯！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[6291] =        ---冥界守卫_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"呱，愚蠢的青铜圣斗士，你已经被我的守卫包围了！",
                  name = _t"赛洛斯",
                  img = "res\\portrait\\冥斗士地奇星赛洛斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6352] =        ---冥界守卫_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"可恶！你给我等着！我还会回来找你的！",
                  name = _t"赛洛斯",
                  img = "res\\portrait\\冥斗士地奇星赛洛斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6354] =        ---追寻！背叛的理由_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"撒加！卡妙！修罗！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6358] =        ---用生命去救赎_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"%s,我们走了！雅典娜就交给你和星矢他们了！",
                  name = _t"撒加",
                  img = "res\\portrait\\黄金圣斗士双子座撒加冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"撒加、卡妙、修罗啊，虽然没有办法帮助你们！但我也是雅典娜的圣斗士！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"我会用自己的方法去哈迪斯城。去完成属于我的使命！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6368] =        ---被遗忘的道路_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"不好！好像有人遇到危险了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6377] =        ---尤里安的战斗_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"穆先生、米罗、艾欧里亚，你们也来了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[6308] =        ---弱者的悲哀_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"穆先生，为什么要禁锢我！快把我放开！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"%s，你已经做得很好了。接下来的战斗就交给我们吧！",
                  name = _t"穆",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6379] =        ---弱者的悲哀_海因斯坦堡
{
     delay = 2000,
     [1] = {
                  txt = _t"等等……等等我……",
                  name = _t"尤里安",
                  img = "res\\portrait\\哈迪斯城幸存者男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[6311] =        ---哀嚎的亡灵_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"我们分头行动，然后在村子后面汇合！",
                  name = _t"尤里安",
                  img = "res\\portrait\\哈迪斯城幸存者男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6388] =        ---安息墓园_海因斯坦堡
{
     delay = 2000,
     [1] = {
                  txt = _t"尤里安，为什么停下了？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6394] =        ---粉碎结界之心_海因斯坦堡
{
     delay = 2000,
     [1] = {
                  txt = _t"%s！（星矢他们的声音在你身后响起）",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[6326] =        ---天捷星西路费都_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"哼，区区青铜圣斗士，竟敢向挑衅我天捷星。看来我得让你们见识下地狱的可怖！",
                  name = _t"西路费都",
                  img = "res\\portrait\\冥斗士天捷星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6397] =        ---天捷星西路费都_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"呱呱，想不到连西路费都都不是你的对手。不过，你们的好日子已经到头了！",
                  name = _t"赛洛斯",
                  img = "res\\portrait\\冥斗士地奇星赛洛斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"又是你，塞洛斯！你只敢龟缩在暗中吗？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6398] =        ---天捷星西路费都_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"桀桀，龟缩？伟大的赛洛斯怎么会干那种事，是你自己找不到我罢了！",
                  name = _t"赛洛斯",
                  img = "res\\portrait\\冥斗士地奇星赛洛斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6399] =        ---天捷星西路费都_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"笨蛋！我在这里！呱呱呱……",
                  name = _t"赛洛斯",
                  img = "res\\portrait\\冥斗士地奇星赛洛斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6400] =        ---天捷星西路费都_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"呱呱，终于找来了吗？我已经等你很久了。",
                  name = _t"赛洛斯",
                  img = "res\\portrait\\冥斗士地奇星赛洛斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6401] =        ---惊现！冥界三巨头_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"哼，简直是浪费我的时间。赛洛斯，这里就交给你了。",
                  name = _t"拉达曼迪斯",
                  img = "res\\portrait\\冥斗士天猛星拉大曼迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"呱呱，拉达曼迪斯大人，你放心！我一定会好好招待他的！",
                  name = _t"赛洛斯",
                  img = "res\\portrait\\冥斗士地奇星赛洛斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"%s！",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"可恶！来得真快！算你走运！",
                  name = _t"赛洛斯",
                  img = "res\\portrait\\冥斗士地奇星赛洛斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6404] =        ---彼岸花海_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"可恶，就算没有你们的帮助，我也一定会找到姐姐！",
                  name = _t"尤里安",
                  img = "res\\portrait\\哈迪斯城幸存者男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"尤里安，你等等……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[6334] =        ---睡神结界_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"能够走到这里，我天魔星奎因赞赏你们的勇气。不过你们的好运到此为止了！",
                  name = _t"奎因",
                  img = "res\\portrait\\冥斗士天魔星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6408] =        ---圣洁的世界_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"咦，那是什么？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"好像是一个空间入口。应该是睡神结界核心的冲击造成的。",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"姐姐！是姐姐！我感觉姐姐就在里面！",
                  name = _t"尤里安",
                  img = "res\\portrait\\哈迪斯城幸存者男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[6336] =        ---尤里安的决意_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"%s，感谢你们一直以来的帮助。我想我们是时候说分手了！",
                  name = _t"尤里安",
                  img = "res\\portrait\\哈迪斯城幸存者男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"可是尤里安，你根本不知道那里面有什么？让我陪你一起去。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不！你们还有更重要的事情要做！姐姐就让我自己来救吧。",
                  name = _t"尤里安",
                  img = "res\\portrait\\哈迪斯城幸存者男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"希望你们可以成功的拯救这个世界。也许我很还有机会相见。",
                  name = _t"尤里安",
                  img = "res\\portrait\\哈迪斯城幸存者男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[6337] =        ---前往哈迪斯城_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"%s，尤里安让我想起了星华姐姐。等救出雅典娜，我也一定要去找她。",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"星矢，我相信你一定可以做到。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6412] =        ---冥界之城_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"穆！米罗！艾欧里亚！这是……拉达曼迪斯你把他们怎么了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6414] =        ---潘多拉的魔盒_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"你最好不要打开那个盒子！如果你想死，就当我没说过！",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"潘多拉！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6415] =        ---冲击城塞_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"可恶！潘多拉不见了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6346] =        ---英雄的赞歌_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"听着，我们的师父。不是你这样的杂碎能够侮辱的！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6797] =        ---火种的传承_遗忘之路主线
{
     delay = 3000,
     [1] = {
                  txt = _t"太好了，大家都在！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6791] =        ---女神的使命_遗忘之路主线
{
     delay = 3000,
     [1] = {
                  txt = _t"原来你们都在这里，这样事情就简单多了。",
                  name = _t"穆",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"嘉米尔的穆！",
                  name = _t"城户纱织",
                  img = "res\\portrait\\城户纱织.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6793] =        ---凤凰的踪迹_遗忘之路主线
{
     delay = 3000,
     [1] = {
                  txt = _t"%s，我们相信你！加油吧！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"一定要找到一辉和瞬！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"我们一定能摧毁教皇的阴谋！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6353] =        ---冥界守卫_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"咦，这里居然还有普通的人类活着！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[5833] =        ---公布！竞技赛的名单_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"你听说了吗？这次竞技赛出现了一个很厉害的人物！",
                  name = _t"候补生",
                  img = "res\\portrait\\圣域圣斗士男学员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"是谁？卡西欧士？星矢?还是%s？",
                  name = _t"候补生",
                  img = "res\\portrait\\圣域圣斗士女学员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不，都不是！听说他叫艾德，他已经领悟了小宇宙的力量。",
                  name = _t"候补生",
                  img = "res\\portrait\\圣域圣斗士男学员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5835] =        ---公布！竞技赛的名单_群星之地
{
     delay = 3000,
     [1] = {
                  txt = _t"艾德？就是那个传说中的天才候补生吗？想不到我的对手会是他！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[310] =        ---_重铸！新生的圣衣！
{
     delay = 4000,
     [1] = {
                  txt = _t"教皇有命，杀掉城户纱织！",
                  name = _t"托勒密",
                  img = "res\\portrait\\白银天箭座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"可恶！大家保护好纱织小姐！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[8301] =        ---_重铸！新生的圣衣！
{
     delay = 4000,
     [1] = {
                  txt = _t"纱织小姐！！！",
                  name = _t"邪武",
                  img = "res\\portrait\\青铜圣斗士独角兽座邪武.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 4000,
           },
     [2] = {
                  txt = _t"哈哈，只有教皇大人才能拔除纱织身上的箭，不过，想见到教皇，必须打倒守护十二宫的黄金圣斗士。",
                  name = _t"托勒密",
                  img = "res\\portrait\\白银天箭座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"钟楼已经被点燃，十二个小时后所有的火焰熄灭，黄金箭也会完全插入纱织的心脏！",
                  name = _t"托勒密",
                  img = "res\\portrait\\白银天箭座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"可恶！一定要尽快赶去教皇厅！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6278] =        ---_重铸！新生的圣衣！
{
     delay = 4000,
     [1] = {
                  txt = _t"白羊宫的守护者竟然是……穆！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"没时间解释了，快把你们的圣衣交出来，我会把他们修好。",
                  name = _t"穆",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"贵鬼，准备开始。",
                  name = _t"穆",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"啊！是！",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6279] =        ---_重铸！新生的圣衣！
{
     delay = 4000,
     [1] = {
                  txt = _t"先是天马圣衣，我需要银星砂、奥尔哈钢、伽玛石各2份。",
                  name = _t"穆",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6280] =        ---_重铸！新生的圣衣！
{
     delay = 4000,
     [1] = {
                  txt = _t"然后是白鸟圣衣，我需要3份银星砂、1份奥尔哈钢和2份伽玛石。",
                  name = _t"穆",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6281] =        ---_重铸！新生的圣衣！
{
     delay = 4000,
     [1] = {
                  txt = _t"接下来是天龙圣衣，我需要2份银星砂、3份奥尔哈钢和1份伽玛石。",
                  name = _t"穆",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6282] =        ---_重铸！新生的圣衣！
{
     delay = 4000,
     [1] = {
                  txt = _t"最后是仙女圣衣，我需要2份银星砂、1份奥尔哈钢和3份伽玛石。",
                  name = _t"穆",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[311] =        ---_重铸！新生的圣衣！
{
     delay = 4000,
     [1] = {
                  txt = _t"贵鬼，快一点，我们时间紧迫。",
                  name = _t"穆",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[312] =        ---_重铸！新生的圣衣！
{
     delay = 4000,
     [1] = {
                  txt = _t"贵鬼，别贪玩，快把材料拿过来。",
                  name = _t"穆",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[313] =        ---_重铸！新生的圣衣！
{
     delay = 4000,
     [1] = {
                  txt = _t"贵鬼，你在干什么？",
                  name = _t"穆",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[314] =        ---_重铸！新生的圣衣！
{
     delay = 4000,
     [1] = {
                  txt = _t"贵鬼，我的忍耐是有限度的。",
                  name = _t"穆",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[315] =        ---_重铸！新生的圣衣！
{
     delay = 4000,
     [1] = {
                  txt = _t"（怒）贵！鬼！星光灭……",
                  name = _t"穆",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"别！别！穆先生，我会好好干活的……",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[316] =        ---_重铸！新生的圣衣！
{
     delay = 4000,
     [1] = {
                  txt = _t"贵鬼，你太让为师失望了……",
                  name = _t"穆",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[7008] =        ---_重铸！新生的圣衣！
{
     delay = 3000,
     [1] = {
                  txt = _t"贵鬼，不许乱跑",
                  name = _t"穆",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"(*^__^*) 嘻嘻……",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"- -！",
                  name = _t"穆",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[7009] =        ---_重铸！新生的圣衣！
{
     delay = 3000,
     [1] = {
                  txt = _t"贵鬼，不许乱跑",
                  name = _t"穆",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"(*^__^*) 嘻嘻……",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"- -！",
                  name = _t"穆",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6050] =        ---征途的尽头（二）_仙女岛
{
     delay = 3000,
     [1] = {
                  txt = _t"前面有一个人在修船？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6051] =        ---征途的尽头（二）_仙女岛
{
     delay = 3000,
     [1] = {
                  txt = _t"我明明看到了一个人，为什么走近却什么都没有？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6052] =        ---征途的尽头（四）_仙女岛
{
     delay = 3000,
     [1] = {
                  txt = _t"船体已经破烂不堪。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6053] =        ---征途的尽头（四）_仙女岛
{
     delay = 3000,
     [1] = {
                  txt = _t"如果再经历一次剧烈撞击，龙骨一定会碎裂。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6054] =        ---征途的尽头（四）_仙女岛
{
     delay = 3000,
     [1] = {
                  txt = _t"我只能勉强修补到这种程度……但这艘船已经无法用了。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6055] =        ---征途的尽头（五）_仙女岛
{
     delay = 3000,
     [1] = {
                  txt = _t"请住手……",
                  name = _t"细小的声音",
                  img = "res\\portrait\\灵魂娃娃.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[6028] =        ---短暂的再会（六）_仙女岛
{
     delay = 3000,
     [1] = {
                  txt = _t"我感到一丝微弱的小宇宙出现了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6061] =        ---短暂的再会（八）_仙女岛
{
     delay = 3000,
     [1] = {
                  txt = _t"一个人出现在泉水上方？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6062] =        ---牺牲之祭（三）_仙女岛
{
     delay = 3000,
     [1] = {
                  txt = _t"那个特里休斯，给我的不是疗伤药而是安眠药吧……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[6040] =        ---牺牲之祭（九）_仙女岛
{
     delay = 3000,
     [1] = {
                  txt = _t"哈哈哈，谁要找我的尸体？！",
                  name = _t"特里休斯",
                  img = "res\\portrait\\圣域杂兵壮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"特里休斯！你活下来了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6477] =        ---僵尸新娘（四）_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"接新娘的人来了，让我们看看你有没有能力把新娘接走吧~",
                  name = _t"维多利亚的闺蜜",
                  img = "res\\portrait\\哈迪斯城女仆亡灵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[6458] =        ---海因斯坦（五）_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"你们逃不了了！",
                  name = _t"冥界士兵",
                  img = "res\\portrait\\冥界杂兵近战瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6483] =        ---海因斯坦（八）_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"这束花像是有灵魂一样发出微弱的哀鸣。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6486] =        ---丢失的腿骨（一）_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"是这个吧，那个女裁缝的右腿，可它已经变成蝙蝠的乐园了。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[317] =        ---_重铸！新生的圣衣！
{
     delay = 2000,
     [1] = {
                  txt = _t"哎呦！",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6488] =        ---丢失的腿骨（一）_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"希望还能用……先拿回去吧。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6490] =        ---噩梦之沙（一）_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"哇，我变成了蝙蝠！跟着这些蝙蝠去看看吧。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6491] =        ---噩梦之沙（一）_海因斯坦堡
{
     delay = 3000,
     [1] = {
                  txt = _t"一个睡神的使者？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[822] =        ---唯一的办法_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"李云！！你在干什么？为什么……为什么你要喝下有毒的水！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"%s，这是拯救村民唯一的办法了，我必须这么做……",
                  name = _t"李云",
                  img = "res\\portrait\\庐山李云异化.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
NpcFinishIdTask[4324] =        ---鹰之眼_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"什么也没看到。难道迪斯马斯克已经离开了庐山？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[7125] =        ---迪斯马斯克的力量_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"不行，不能再深入了。先回去找老师想办法。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[1049] =        ---脱出！黄泉比良坂_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"哼，就凭你们？有本事就到我的黄泉比良坂来吧。",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座迪斯马斯克.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"迪斯马斯克！！！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3888] =        ---救出大长老_死亡皇后岛
{
     delay = 3000,
     [1] = {
                  txt = _t"大长老！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"%s，我很高兴，雅典娜身边有你这样强大的圣斗士！",
                  name = _t"塔瓦娜大长老",
                  img = "res\\portrait\\塔瓦娜遗民.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"这个牢笼不能用外力打破。开启的办法就在我旁边的石柱上。",
                  name = _t"塔瓦娜大长老",
                  img = "res\\portrait\\塔瓦娜遗民.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6380] =        ---黑暗中的明灯_海因斯坦堡
{
     delay = 2000,
     [1] = {
                  txt = _t"我们到了！神父，神父……",
                  name = _t"尤里安",
                  img = "res\\portrait\\哈迪斯城幸存者男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"咦？情况好像有些不对！",
                  name = _t"尤里安",
                  img = "res\\portrait\\哈迪斯城幸存者男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[318] =        ---_圣域
{
     delay = 4000,
     [1] = {
                  txt = _t"冥界的召唤师正在企图恢复梦神的力量，快阻止他们！",
                  name = _t"阿鲁迪巴",
                  img = "res\\portrait\\黄金圣斗士金牛座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[319] =        ---_圣域
{
     delay = 4000,
     [1] = {
                  txt = _t"又出现了很多冥界的士兵，坚持住，不能让他们的阴谋得逞！",
                  name = _t"阿鲁迪巴",
                  img = "res\\portrait\\黄金圣斗士金牛座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[320] =        ---_圣域
{
     delay = 4000,
     [1] = {
                  txt = _t"可恶的圣斗士们，你们是无法战胜我的，来见识见识我强大的小宇宙吧！",
                  name = _t"梦神",
                  img = "res\\portrait\\梦神合体.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[321] =        ---_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"不要松懈，梦神的计划还没有停止，时刻准备战斗！",
                  name = _t"阿鲁迪巴",
                  img = "res\\portrait\\黄金圣斗士金牛座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[322] =        ---_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"啊……我还会再回来的！下次绝饶不了你们！",
                  name = _t"梦神",
                  img = "res\\portrait\\梦神合体.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[6896] =        ---40级召唤！神龙之试炼！天马_庐山
{
     delay = 1500,
     [1] = {
                  txt = _t"远来的客人，光荣的战士，飞翔的天马座，请来天池参与华夏神龙之试炼！",
                  name = _t"神龙之灵",
                  img = "res\\portrait\\默认.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [2] = {
                  txt = _t"是谁？这个声音是谁？华夏神龙之试炼又是什么？真奇怪……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
} 
DialogFinishIdTask[6913] =        ---子任务一：到达_庐山
{
     delay = 1500,
     [1] = {
                  txt = _t"这里荡漾着和煦的微风，我似乎感觉到了风元素的存在。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [2] = {
                  txt = _t"微风吹拂着发丝的感觉，真的很微妙。我感觉了，它的存在！我抓住它了！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
} 
DialogFinishIdTask[6918] =        ---子任务二：切磋_庐山
{
     delay = 1500,
     [1] = {
                  txt = _t"%s，你居然已经成长到了可以与我平分秋色的程度，不，甚至比我更强……",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
} 
DialogAcceptIdTask[6898] =        ---40级召唤！神龙之试炼！白鸟_庐山
{
     delay = 1500,
     [1] = {
                  txt = _t"远来的客人，光荣的战士，极寒之白鸟座，请来天池参与华夏神龙之试炼！",
                  name = _t"神龙之灵",
                  img = "res\\portrait\\默认.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [2] = {
                  txt = _t"是谁？这个声音是谁？华夏神龙之试炼又是什么？真奇怪……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
} 
DialogFinishIdTask[6914] =        ---子任务一：到达_庐山
{
     delay = 1500,
     [1] = {
                  txt = _t"这里，应该就是水之元素所在地了吧？我感觉了，它的存在！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
} 
DialogFinishIdTask[6919] =        ---子任务二：切磋_庐山
{
     delay = 1500,
     [1] = {
                  txt = _t"%s，你居然已经成长到了可以与我平分秋色的程度，不，甚至比我更强……",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
} 
DialogAcceptIdTask[6900] =        ---40级召唤！神龙之试炼！天龙_庐山
{
     delay = 1500,
     [1] = {
                  txt = _t"远来的客人，光荣的战士，坚忍的天龙座，请来天池参与华夏神龙之试炼！",
                  name = _t"神龙之灵",
                  img = "res\\portrait\\默认.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [2] = {
                  txt = _t"是谁？这个声音是谁？华夏神龙之试炼又是什么？真奇怪……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
} 
DialogFinishIdTask[6915] =        ---子任务一：到达_庐山
{
     delay = 1500,
     [1] = {
                  txt = _t"这种厚重、沉稳的感觉，是地之元素？我感觉了，它的存在！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
} 
DialogFinishIdTask[6920] =        ---子任务二：切磋_庐山
{
     delay = 1500,
     [1] = {
                  txt = _t"%s，你居然已经成长到了可以与我平分秋色的程度，不，甚至比我更强……",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
} 
DialogAcceptIdTask[6902] =        ---40级召唤！神龙之试炼！仙女_庐山
{
     delay = 1500,
     [1] = {
                  txt = _t"远来的客人，光荣的战士，被缚的仙女座，请来天池参与华夏神龙之试炼！",
                  name = _t"神龙之灵",
                  img = "res\\portrait\\默认.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [2] = {
                  txt = _t"是谁？这个声音是谁？华夏神龙之试炼又是什么？真奇怪……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
} 
DialogFinishIdTask[6916] =        ---子任务一：到达_庐山
{
     delay = 1500,
     [1] = {
                  txt = _t"这种狂暴的、毁灭与生机共存的奇怪感觉，就是雷之元素的真相吗？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
} 
DialogFinishIdTask[6921] =        ---子任务二：切磋_庐山
{
     delay = 1500,
     [1] = {
                  txt = _t"%s，你居然已经成长到了可以与我平分秋色的程度，不，甚至比我更强……",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
} 
DialogAcceptIdTask[6904] =        ---40级召唤！神龙之试炼！凤凰_庐山
{
     delay = 1500,
     [1] = {
                  txt = _t"远来的客人，光荣的战士，燃烧的凤凰座，请来天池参与华夏神龙之试炼！",
                  name = _t"神龙之灵",
                  img = "res\\portrait\\默认.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [2] = {
                  txt = _t"是谁？这个声音是谁？华夏神龙之试炼又是什么？真奇怪……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
} 
DialogFinishIdTask[6917] =        ---子任务一：到达_庐山
{
     delay = 1500,
     [1] = {
                  txt = _t"我感觉到浓浓的香火气息与愿望之力——四处跳跃着的微小原子，就是火之元素吗？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
} 
DialogFinishIdTask[6922] =        ---子任务二：切磋_庐山
{
     delay = 1500,
     [1] = {
                  txt = _t"%s，你居然已经成长到了可以与我平分秋色的程度，不，甚至比我更强……",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
} 
DialogStrategy[323] =        ---_迷幻雪山
{
     delay = 8000,
     [1] = {
                  txt = _t"收集好了雪球要及时交给我哦，每天只可以上交一次，计时结束，还没有上交雪球将无法领奖！",
                  name = _t"城户纱织",
                  img = "res\\portrait\\圣斗士_雅典娜.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6683] =        ---艾欧罗斯传记（一）_环任务
{
     delay = 3000,
     [1] = {
                  txt = _t"砰！！！噼砰！！！轰隆隆……",
                  name = _t"爆炸声",
                  img = "res\\portrait\\默认.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [2] = {
                  txt = _t"发生了什么？听起来像是在遗忘之村附近发生了爆炸！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6687] =        ---艾欧罗斯传记（三）_环任务
{
     delay = 3000,
     [1] = {
                  txt = _t"这个小宇宙是艾欧里亚的，看来他就在前面。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6689] =        ---艾欧罗斯传记（四）_环任务
{
     delay = 3000,
     [1] = {
                  txt = _t"射手座圣衣？艾欧罗斯大人还活着么！还有为什么村子附近会出现这么可怕的敌人！",
                  name = _t"道格拉斯",
                  img = "res\\portrait\\圣域杂兵壮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [2] = {
                  txt = _t"看来艾欧里亚似乎成为了某一个势力的目标！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6693] =        ---迪斯马斯克传记（二）_环任务
{
     delay = 3000,
     [1] = {
                  txt = _t"像苍蝇一样跟在我的后面，你们是想离死亡更近一点么！那就由我来实现愿望吧。",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座迪斯马斯克.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6698] =        ---迪斯马斯克传记（四）_环任务
{
     delay = 3000,
     [1] = {
                  txt = _t"感觉到了迪斯马斯克的小宇宙，在他旁边的那个家伙是……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6700] =        ---迪斯马斯克传记（四）_环任务
{
     delay = 3000,
     [1] = {
                  txt = _t"迪斯马斯克快去干掉这个碍眼的家伙！",
                  name = _t"死之炼金术士",
                  img = "res\\portrait\\堕落炼金术士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [2] = {
                  txt = _t"……",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座迪斯马斯克.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1500,
           },
     [3] = {
                  txt = _t"迪斯马斯克你怎么还不动手！难道你忘记了是我用冥界的结晶将你复活的么。哼！等我收拾掉这个家伙再来收拾你这个不听话的傀儡！",
                  name = _t"死之炼金术士",
                  img = "res\\portrait\\堕落炼金术士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6705] =        ---冰河传记（一）_环任务
{
     delay = 3000,
     [1] = {
                  txt = _t"救命啊，谁来救救我！",
                  name = _t"少女",
                  img = "res\\portrait\\东西伯利亚居民女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6707] =        ---冰河传记（三）_环任务
{
     delay = 3000,
     [1] = {
                  txt = _t"咦！原来冰河就在这附近。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6709] =        ---冰河传记（四）_环任务
{
     delay = 3000,
     [1] = {
                  txt = _t"那就是雪莲花！不过周围的那些怪物似乎都在守护这株植物，没办法只好打败它们。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6712] =        ---冰河传记（五）_环任务
{
     delay = 3000,
     [1] = {
                  txt = _t"不好！冰河被一群冰斗士围住了！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[7013] =        ---克修拉传记（二）_环任务
{
     delay = 3000,
     [1] = {
                  txt = _t"这么多的塞壬先锋，先把这些海妖解决掉再说。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6669] =        ---一辉传记（二）_环任务
{
     delay = 3000,
     [1] = {
                  txt = _t"这是一辉的小宇宙！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6673] =        ---一辉传记（四）_环任务
{
     delay = 3000,
     [1] = {
                  txt = _t"嘿嘿，前面可不是你该去的地方，如果你回去的话我很乐意放过你！",
                  name = _t"黑暗凤凰",
                  img = "res\\portrait\\黑暗凤凰.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [2] = {
                  txt = _t"别做梦了，胆敢阻挡我去路的人都将被我毁灭！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [3] = {
                  txt = _t"愚蠢的圣斗士，就让你尝尝我黑暗凤凰的厉害。",
                  name = _t"黑暗凤凰",
                  img = "res\\portrait\\黑暗凤凰.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6675] =        ---一辉传记（五）_环任务
{
     delay = 3000,
     [1] = {
                  txt = _t"前面的那是一辉……还有艾丝美拉达！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[6676] =        ---一辉传记（五）_环任务
{
     delay = 3000,
     [1] = {
                  txt = _t"艾丝美拉达你不要走！和我在一起！",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [2] = {
                  txt = _t"一辉你还记得当初说过当你成为圣斗士就会一直陪在我的身边么，答应我不要留下我，一直陪着我。",
                  name = _t"艾丝美拉达",
                  img = "res\\portrait\\艾丝美拉达.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [3] = {
                  txt = _t"艾丝美拉达，我……会一直陪在你身……咦，头好晕……",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[324] =        ---_十二宫摩羯宫
{
     delay = 8000,
     [1] = {
                  txt = _t"在神话时代，雅典娜曾把王者之剑颁给最忠诚追随者--摩羯座圣斗士。摩羯座一直被称为雅典娜最忠诚的圣斗士。",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"可是他却不知道，真正的雅典娜是纱织小姐。为了挽救雅典娜，即使是面对再危险的阻碍，我们也不会退缩。",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[325] =        ---_十二宫摩羯宫
{
     delay = 8000,
     [1] = {
                  txt = _t"我们已经突破了摩羯宫，难道这里没有守护的圣斗士么？",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"别高兴的太早！我是不会让你们过去的！我只是不想让鼠辈的血弄脏了雅典娜的雕像。",
                  name = _t"修罗",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[326] =        ---_重生！圣域镇魂歌
{
     delay = 4000,
     [1] = {
                  txt = _t"真是精彩的战斗呢！不过，你们到此为止了！奉潘多拉大人的旨意，擅闯墓地者——死！",
                  name = _t"前代变色龙座珍妮",
                  img = "res\\portrait\\青铜圣斗士变色龙座珍妮冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[327] =        ---_重生！圣域镇魂歌
{
     delay = 4000,
     [1] = {
                  txt = _t"真是可怜的小宠物呢！在你们临死之前，就让我送你们一点神秘的小礼物吧！愚笨的小鬼们，听好我的提示喔！",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉幼年抱哈迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"这次的提示是西北空地，嘻嘻，你们只有60秒的时间，动作要快呦！",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉幼年抱哈迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
} 
DialogStrategy[328] =        ---_重生！圣域镇魂歌
{
     delay = 4000,
     [1] = {
                  txt = _t"真是可怜的小宠物呢！在你们临死之前，就让我送你们一点神秘的小礼物吧！愚笨的小鬼们，听好我的提示喔！",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉幼年抱哈迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"这次的提示是东北祭坛，嘻嘻，你们只有60秒的时间，动作要快呦！",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉幼年抱哈迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
} 
DialogStrategy[329] =        ---_重生！圣域镇魂歌
{
     delay = 4000,
     [1] = {
                  txt = _t"真是可怜的小宠物呢！在你们临死之前，就让我送你们一点神秘的小礼物吧！愚笨的小鬼们，听好我的提示喔！",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉幼年抱哈迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"这次的提示是北部石屋，嘻嘻，你们只有60秒的时间，动作要快呦！",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉幼年抱哈迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
} 
DialogStrategy[330] =        ---_重生！圣域镇魂歌
{
     delay = 4000,
     [1] = {
                  txt = _t"真是可怜的小宠物呢！在你们临死之前，就让我送你们一点神秘的小礼物吧！愚笨的小鬼们，听好我的提示喔！",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉幼年抱哈迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"这次的提示是墓地长廊，嘻嘻，你们只有60秒的时间，动作要快呦！",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉幼年抱哈迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
} 
DialogStrategy[331] =        ---_重生！圣域镇魂歌
{
     delay = 4000,
     [1] = {
                  txt = _t"这次的提示是西北空地，60秒的时间，红色标记，嘻嘻，快点找到我赐予你们的死亡礼物吧！",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉幼年抱哈迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[332] =        ---_重生！圣域镇魂歌
{
     delay = 4000,
     [1] = {
                  txt = _t"这次的提示是东北祭坛，60秒的时间，红色标记，嘻嘻，快点找到我赐予你们的死亡礼物吧！",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉幼年抱哈迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[333] =        ---_重生！圣域镇魂歌
{
     delay = 4000,
     [1] = {
                  txt = _t"这次的提示是北部石屋，60秒的时间，红色标记，嘻嘻，快点找到我赐予你们的死亡礼物吧！",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉幼年抱哈迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[334] =        ---_重生！圣域镇魂歌
{
     delay = 4000,
     [1] = {
                  txt = _t"这次的提示是墓地长廊，60秒的时间，红色标记，嘻嘻，快点找到我赐予你们的死亡礼物吧！",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉幼年抱哈迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[335] =        ---_重生！圣域镇魂歌
{
     delay = 4000,
     [1] = {
                  txt = _t"临别的礼物，真是有趣的折磨呢！是时候让你们葬身墓地了，就让我为你们开启死亡的乐章吧！",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉幼年抱哈迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[336] =        ---_十二宫双鱼宫
{
     delay = 4000,
     [1] = {
                  txt = _t"血腥玫瑰！就让你们感受下血染玫瑰的美丽",
                  name = _t"阿布罗狄",
                  img = "res\\portrait\\黄金圣斗士双鱼座阿布罗狄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[337] =        ---_十二宫双鱼宫
{
     delay = 4000,
     [1] = {
                  txt = _t"白色的玫瑰，在鲜血中盛开，一定会非常美丽",
                  name = _t"阿布罗狄",
                  img = "res\\portrait\\黄金圣斗士双鱼座阿布罗狄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[338] =        ---_十二宫双鱼宫
{
     delay = 4000,
     [1] = {
                  txt = _t"就让你们在玫瑰的芬芳中死亡吧！",
                  name = _t"阿布罗狄",
                  img = "res\\portrait\\黄金圣斗士双鱼座阿布罗狄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[339] =        ---_十二宫双鱼宫
{
     delay = 4000,
     [1] = {
                  txt = _t"鲜血染成的玫瑰！真是太美丽了！",
                  name = _t"阿布罗狄",
                  img = "res\\portrait\\黄金圣斗士双鱼座阿布罗狄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[340] =        ---_女神的挽歌
{
     delay = 3000,
     [1] = {
                  txt = _t"穆，你胆敢与我为敌，应该有死的觉悟了吧？",
                  name = _t"史昂",
                  img = "res\\portrait\\复生的白羊座史昂.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"死守白羊宫是我的使命……就算是老师你也休想通过这里！",
                  name = _t"穆",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [3] = {
                  txt = _t"我会亲手了结你，永别了，穆！",
                  name = _t"史昂",
                  img = "res\\portrait\\复生的白羊座史昂.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [4] = {
                  txt = _t"住手！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[341] =        ---_女神的挽歌
{
     delay = 3000,
     [1] = {
                  txt = _t"哈哈哈哈……大吃一惊吧，这全是我地暗星尼奥比的杰作！",
                  name = _t"尼奥比",
                  img = "res\\portrait\\冥斗士地暗星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [2] = {
                  txt = _t"什么！你竟然杀死了阿鲁迪巴！我要替他报仇！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[342] =        ---_女神的挽歌
{
     delay = 3000,
     [1] = {
                  txt = _t"来吧，艾俄罗斯，用的的黄金箭射穿我的胸膛吧！",
                  name = _t"修罗",
                  img = "res\\portrait\\复生的黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"为你的罪行忏悔吧！惩戒之箭！",
                  name = _t"幻象 艾俄罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座艾欧罗斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [3] = {
                  txt = _t"唔……艾俄罗斯，对我这样的人，难道你还心存怜悯吗？",
                  name = _t"修罗",
                  img = "res\\portrait\\复生的黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [4] = {
                  txt = _t"惩戒之箭！",
                  name = _t"幻象 艾俄罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座艾欧罗斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [5] = {
                  txt = _t"你太仁慈了，艾俄罗斯，正义需要的是决断！",
                  name = _t"修罗",
                  img = "res\\portrait\\复生的黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [6] = {
                  txt = _t"不，你错了，正义需要的是牺牲——正义之箭！",
                  name = _t"幻象 艾俄罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座艾欧罗斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 4000,
           },
     [7] = {
                  txt = _t"啊……原来……是这样啊……雅典娜……",
                  name = _t"修罗",
                  img = "res\\portrait\\复生的黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [8] = {
                  txt = _t"真是笨拙的人……",
                  name = _t"幻象 艾俄罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座艾欧罗斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[343] =        ---_女神的挽歌
{
     delay = 3000,
     [1] = {
                  txt = _t"加隆，现身吧，不要再躲躲藏藏了！",
                  name = _t"卡妙",
                  img = "res\\portrait\\复生的黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"什……这些是……我造的冰棺？",
                  name = _t"卡妙",
                  img = "res\\portrait\\复生的黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"哼，不过是些幻象罢了。而且我很清楚，突破这个幻象的关键是——",
                  name = _t"卡妙",
                  img = "res\\portrait\\复生的黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [4] = {
                  txt = _t"封印冰河的冰棺……",
                  name = _t"卡妙",
                  img = "res\\portrait\\复生的黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[344] =        ---_女神的挽歌
{
     delay = 5000,
     [1] = {
                  txt = _t"卡妙老师，你曾教导我要冷酷的对待敌人。我们这些圣斗士，不正是身着冥衣的你的敌人吗？",
                  name = _t"幻象 冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"冰河，我确实如此教导过你。不过十二宫一战后，你已经找到了自己前进的道路吧。",
                  name = _t"卡妙",
                  img = "res\\portrait\\复生的黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"看到你们这些后辈的成长，真是又欣喜又寂寞。而我们这些死者，如今也有不得不完成的使命。",
                  name = _t"卡妙",
                  img = "res\\portrait\\复生的黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [4] = {
                  txt = _t"卡妙老师……",
                  name = _t"幻象 冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [5] = {
                  txt = _t"虽然时间很短暂，虽然只是幻象而已，不过还能见到你，为师真的很开心……",
                  name = _t"卡妙",
                  img = "res\\portrait\\复生的黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
} 
DialogStrategy[345] =        ---_女神的挽歌
{
     delay = 4000,
     [1] = {
                  txt = _t"加隆，不要去！那是海龙的鳞衣！",
                  name = _t"撒加",
                  img = "res\\portrait\\黄金圣斗士双子座撒加冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"撒加，将我逼到这个地步的不正是你吗？事到如今你还想装出一个好哥哥的样子吗？！",
                  name = _t"加隆",
                  img = "res\\portrait\\便装加隆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"唔……可恶……你是故意造出这个幻象来惩罚我吗……你还在怨恨着我吗……",
                  name = _t"撒加",
                  img = "res\\portrait\\黄金圣斗士双子座撒加冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[346] =        ---_女神的挽歌
{
     delay = 3000,
     [1] = {
                  txt = _t"加隆，谢谢你代替我守护双子宫。",
                  name = _t"撒加",
                  img = "res\\portrait\\黄金圣斗士双子座撒加冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"我只是个幻象罢了……你在对一个幻象说话吗？",
                  name = _t"加隆",
                  img = "res\\portrait\\便装加隆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"不，加隆，你不是幻象——你是我撒加的兄弟——虽然用了很长时间，不过总算能够说出这句话了。",
                  name = _t"撒加",
                  img = "res\\portrait\\黄金圣斗士双子座撒加冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [4] = {
                  txt = _t"……哼，被识破了吗。真让人头疼啊……这样的笨蛋哥哥",
                  name = _t"加隆",
                  img = "res\\portrait\\便装加隆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[347] =        ---_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"仪式准备完成啦！阿鲁迪巴，受死吧！看看你们谁能拦住我！",
                  name = _t"梦神",
                  img = "res\\portrait\\梦神合体.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [2] = {
                  txt = _t"我拼死也不会让你踏足圣域一步的，滚回你的冥界！",
                  name = _t"阿鲁迪巴",
                  img = "res\\portrait\\黄金圣斗士金牛座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[348] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"我的箭不仅仅要射穿你的圣衣，还有你的心脏！",
                  name = _t"托勒密",
                  img = "res\\portrait\\白银天箭座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[349] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"前路漫漫，如果连我这里都不能通过，你怎么才能肩负起保卫雅典娜的责任？",
                  name = _t"白羊座",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[350] =        ---_个人挑战
{
     delay = 3000,
     [1] = {
                  txt = _t"星光灭绝！",
                  name = _t"白羊座",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[351] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"嗯？最近不自量力的人还真是多。",
                  name = _t"金牛座",
                  img = "res\\portrait\\黄金圣斗士金牛座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[352] =        ---_个人挑战
{
     delay = 3000,
     [1] = {
                  txt = _t"巨型号角！",
                  name = _t"金牛座",
                  img = "res\\portrait\\黄金圣斗士金牛座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[353] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"毒蛇的厉牙可不是用来装饰门面的！",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\莎尔娜.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[354] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"你虽然不能生的优雅，但至少还能优雅的死去。",
                  name = _t"美斯狄",
                  img = "res\\portrait\\白银蜥蜴座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[355] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"我可不是只能嗡嗡作响的小苍蝇！",
                  name = _t"狄奥",
                  img = "res\\portrait\\",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[356] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"如果你能通过这里，或许你也有资格见见艾欧里亚。",
                  name = _t"魔铃",
                  img = "res\\portrait\\魔灵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[357] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"狮子宫只相信速度和力量，能不能走出去，就看你的实力了！",
                  name = _t"狮子座",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[358] =        ---_个人挑战
{
     delay = 3000,
     [1] = {
                  txt = _t"闪电光速拳！",
                  name = _t"狮子座",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[359] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"我的圆盾渴望你的鲜血！",
                  name = _t"巴比伦",
                  img = "res\\portrait\\白银半人马.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[360] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"音乐可以让人欢乐，也可以让人悲伤。",
                  name = _t"奥路菲",
                  img = "res\\portrait\\白银天琴座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[361] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"你将无意识的死去，因为巨鲸将直接将你吞没。",
                  name = _t"摩西斯",
                  img = "res\\portrait\\白银白鲸座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[362] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"……",
                  name = _t"射手座",
                  img = "res\\portrait\\黄金圣斗士射手座艾欧罗斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[363] =        ---_仲夏节祈福副本
{
     delay = 4000,
     [1] = {
                  txt = _t"穿上我旁边的黄金圣衣就可以为雅典娜补充能量！大家一定要守护好雅典娜！",
                  name = _t"沙加",
                  img = "res\\portrait\\黄金圣斗士处女座沙加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[364] =        ---_仲夏节祈福副本
{
     delay = 4000,
     [1] = {
                  txt = _t"尽快除掉冥界女妖！梦神控制了它的意志，它只会攻击雅典娜！",
                  name = _t"沙加",
                  img = "res\\portrait\\黄金圣斗士处女座沙加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[365] =        ---_仲夏节祈福副本
{
     delay = 4000,
     [1] = {
                  txt = _t"不好！梦神的灵体出现了！全力保护雅典娜！",
                  name = _t"沙加",
                  img = "res\\portrait\\黄金圣斗士处女座沙加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"雅典娜！乖乖的献上你的生命吧！",
                  name = _t"梦神",
                  img = "res\\portrait\\梦神合体.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"别作梦了！有我们在，不会让你伤害雅典娜的！",
                  name = _t"",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"你们这是自寻死路！自寻死路！",
                  name = _t"梦神",
                  img = "res\\portrait\\梦神合体.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[366] =        ---_仲夏节祈福副本
{
     delay = 4000,
     [1] = {
                  txt = _t"感谢你们！勇敢正义的少年！你们再一次击败了邪恶！",
                  name = _t"雅典娜",
                  img = "res\\portrait\\城户沙织.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[367] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"人海战术吗！你们这种杂兵来多少都不怕！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[368] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"这里全部都是精英守卫吗？看上去很麻烦的样子啊！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"不过无论如何，我也一定要通过！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[369] =        ---_个人挑战
{
     delay = 10000,
     [1] = {
                  txt = _t"巨大的石柱，是要考验我的攻击力吗！？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[370] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"你身上有我要的宝物吗？闪闪发亮的宝物！",
                  name = _t"全拿走",
                  img = "res\\portrait\\小偷怪.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[3537] =        ---黄泉之井的镇魂曲_开启黄泉之井
{
     delay = 3000,
     [1] = {
                  txt = _t"尤丽缇丝！！！",
                  name = _t"奥路菲",
                  img = "res\\portrait\\白银圣斗士天琴座奥路菲.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[5784] =        ---黄泉之井的镇魂曲_开启黄泉之井
{
     delay = 5000,
     [1] = {
                  txt = _t"从黄泉之井的方向散发出邪恶的小宇宙，冥界的人一定在那里！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[4141] =        ---以战之名_新版圣域
{
     delay = 5000,
     [1] = {
                  txt = _t"雅典娜！我听到了雅典娜女神的声音！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[8342] =        ---梦境之神（一）_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"不见了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[365] =        ---辉煌之梦_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"总算……摆脱了梦神的纠缠。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"前面的人是？……冰河！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[384] =        ---为了爱与正义！_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"%s，你先走吧，星矢他们就在前面，现在追上去还来得及。",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"冰河……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[5438] =        ---冻结，黑色的雪！_银河竞技场
{
     delay = 3000,
     [1] = {
                  txt = _t"总算找到你们了，圣斗士！",
                  name = _t"黑暗白鸟",
                  img = "res\\portrait\\黑暗白鸟座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[371] =        ---_个人挑战
{
     delay = 8000,
     [1] = {
                  txt = _t"别让他轻易破坏石柱！",
                  name = _t"守卫",
                  img = "res\\portrait\\狮子座考验瘦小男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[372] =        ---_个人挑战
{
     delay = 8000,
     [1] = {
                  txt = _t"别让他轻易破坏石柱！",
                  name = _t"守卫",
                  img = "res\\portrait\\狮子座考验大壮男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[373] =        ---_个人挑战
{
     delay = 8000,
     [1] = {
                  txt = _t"别让他轻易破坏石柱！",
                  name = _t"守卫",
                  img = "res\\portrait\\狮子座考验大壮男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[374] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"……",
                  name = _t"天秤座",
                  img = "res\\portrait\\黄金圣斗士天秤座童虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[375] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"……",
                  name = _t"天秤座",
                  img = "res\\portrait\\黄金圣斗士天秤座童虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[376] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"我现在就剥夺你心脏跳动的权利！",
                  name = _t"天蝎座",
                  img = "res\\portrait\\黄金圣斗士天蝎座米罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[377] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"猩红毒针！",
                  name = _t"天蝎座",
                  img = "res\\portrait\\黄金圣斗士天蝎座米罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[378] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"我已经为你准备好了死亡冰棺！",
                  name = _t"水瓶座",
                  img = "res\\portrait\\黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[379] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"曙光女神的宽恕！",
                  name = _t"水瓶座",
                  img = "res\\portrait\\黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[380] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"你能伴随美丽的玫瑰而亡，也是幸福的归宿了！",
                  name = _t"双鱼座",
                  img = "res\\portrait\\黄金圣斗士双鱼座阿布罗狄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[381] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"死亡玫瑰！",
                  name = _t"双鱼座",
                  img = "res\\portrait\\黄金圣斗士双鱼座阿布罗狄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[382] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"阴谋只是失败者的借口，实力才是胜利者的标志！",
                  name = _t"加隆",
                  img = "res\\portrait\\便装加隆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[383] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"银河星爆！",
                  name = _t"加隆",
                  img = "res\\portrait\\便装加隆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[384] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"历史将证明我现在所做的一切都是正确和伟大的！",
                  name = _t"撒加",
                  img = "res\\portrait\\黄金圣斗士双子座撒加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[385] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"银河星爆！",
                  name = _t"撒加",
                  img = "res\\portrait\\黄金圣斗士双子座撒加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[386] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"你必须死在这条路上！",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[387] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"你想通过这里，首先跨过我的尸体吧！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[388] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"出招吧！紫龙不会让你轻易通过这里的！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[389] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"你将永远被冰封在这里，永远！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[390] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"为了爱与正义！锁链舞动起来吧！",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[391] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"如果你能通过这里，前方的路大概会更加平坦！",
                  name = _t"戴达罗斯",
                  img = "res\\portrait\\白银仙皇座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[392] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"停下！",
                  name = _t"摩羯座",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[393] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"圣剑！",
                  name = _t"摩羯座",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[8315] =        ---天魔降伏的考验一阶_趣味任务
{
     delay = 3000,
     [1] = {
                  txt = _t"我已经在周围布下了保留结界。%s，你只有四分钟的时间去破坏它。",
                  name = _t"沙加",
                  img = "res\\portrait\\黄金圣斗士处女座沙加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[8316] =        ---天魔降伏的考验二阶_趣味任务
{
     delay = 3000,
     [1] = {
                  txt = _t"我已经在周围布下了保留结界。%s，你只有三分钟的时间去破坏它。",
                  name = _t"沙加",
                  img = "res\\portrait\\黄金圣斗士处女座沙加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[8317] =        ---天魔降伏的考验三阶_趣味任务
{
     delay = 3000,
     [1] = {
                  txt = _t"我已经在周围布下了保留结界。%s，你只有二分钟的时间去破坏它。",
                  name = _t"沙加",
                  img = "res\\portrait\\黄金圣斗士处女座沙加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[8339] =        ---天魔降伏的考验一阶_趣味任务
{
     delay = 3000,
     [1] = {
                  txt = _t"%s，听好了！接下来我会全力攻击你。你只有两条路可以走。活着或者死！",
                  name = _t"沙加",
                  img = "res\\portrait\\黄金圣斗士处女座沙加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[8340] =        ---天魔降伏的考验二阶_趣味任务
{
     delay = 3000,
     [1] = {
                  txt = _t"%s，听好了！接下来我会全力攻击你。你只有两条路可以走。活着或者死！",
                  name = _t"沙加",
                  img = "res\\portrait\\黄金圣斗士处女座沙加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[8341] =        ---天魔降伏的考验三阶_趣味任务
{
     delay = 3000,
     [1] = {
                  txt = _t"%s，听好了！接下来我会全力攻击你。你只有两条路可以走。活着或者死！",
                  name = _t"沙加",
                  img = "res\\portrait\\黄金圣斗士处女座沙加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[394] =        ---_个人挑战
{
     delay = 5000,
     [1] = {
                  txt = _t"……",
                  name = _t"史昂",
                  img = "res\\portrait\\复生的白羊座史昂.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[395] =        ---_混沌战场
{
     delay = 11000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 60 ^050505秒后开始，请双方做好准备！",
                  name = _t"雅典娜",
                  img = "res\\portrait\\副本传送雅典娜雕像.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[396] =        ---_混沌战场
{
     delay = 11000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 50 ^050505秒后开始，请双方做好准备！",
                  name = _t"雅典娜",
                  img = "res\\portrait\\副本传送雅典娜雕像.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[397] =        ---_混沌战场
{
     delay = 11000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 40 ^050505秒后开始，请双方做好准备！",
                  name = _t"雅典娜",
                  img = "res\\portrait\\副本传送雅典娜雕像.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[398] =        ---_混沌战场
{
     delay = 11000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 30 ^050505秒后开始，请双方做好准备！",
                  name = _t"雅典娜",
                  img = "res\\portrait\\副本传送雅典娜雕像.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[399] =        ---_混沌战场
{
     delay = 11000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 20 ^050505秒后开始，请双方做好准备！",
                  name = _t"雅典娜",
                  img = "res\\portrait\\副本传送雅典娜雕像.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[400] =        ---_混沌战场
{
     delay = 2000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 10 ^050505秒后开始，请双方做好准备！",
                  name = _t"雅典娜",
                  img = "res\\portrait\\副本传送雅典娜雕像.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[401] =        ---_混沌战场
{
     delay = 2000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 9 ^050505秒后开始，请双方做好准备！",
                  name = _t"雅典娜",
                  img = "res\\portrait\\副本传送雅典娜雕像.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[402] =        ---_混沌战场
{
     delay = 2000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 8 ^050505秒后开始，请双方做好准备！",
                  name = _t"雅典娜",
                  img = "res\\portrait\\副本传送雅典娜雕像.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[403] =        ---_混沌战场
{
     delay = 2000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 7 ^050505秒后开始，请双方做好准备！",
                  name = _t"雅典娜",
                  img = "res\\portrait\\副本传送雅典娜雕像.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[404] =        ---_混沌战场
{
     delay = 2000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 6 ^050505秒后开始，请双方做好准备！",
                  name = _t"雅典娜",
                  img = "res\\portrait\\副本传送雅典娜雕像.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[405] =        ---_混沌战场
{
     delay = 2000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 5 ^050505秒后开始，请双方做好准备！",
                  name = _t"雅典娜",
                  img = "res\\portrait\\副本传送雅典娜雕像.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[406] =        ---_混沌战场
{
     delay = 2000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 4 ^050505秒后开始，请双方做好准备！",
                  name = _t"雅典娜",
                  img = "res\\portrait\\副本传送雅典娜雕像.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[407] =        ---_混沌战场
{
     delay = 2000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 3 ^050505秒后开始，请双方做好准备！",
                  name = _t"雅典娜",
                  img = "res\\portrait\\副本传送雅典娜雕像.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[408] =        ---_混沌战场
{
     delay = 2000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 2 ^050505秒后开始，请双方做好准备！",
                  name = _t"雅典娜",
                  img = "res\\portrait\\副本传送雅典娜雕像.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[409] =        ---_混沌战场
{
     delay = 2000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 1 ^050505秒后开始，请双方做好准备！",
                  name = _t"雅典娜",
                  img = "res\\portrait\\副本传送雅典娜雕像.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[410] =        ---_混沌战场
{
     delay = 3000,
     [1] = {
                  txt = _t"^ff0000战斗开始！！！",
                  name = _t"雅典娜",
                  img = "res\\portrait\\副本传送雅典娜雕像.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[411] =        ---_剧情12宫巨蟹
{
     delay = 3000,
     [1] = {
                  txt = _t"不！！！住手迪斯马斯克！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"进攻都不起作用吗？这是一场幻象？残存在巨蟹宫的怨念吗？",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[8803] =        ---_剧情12宫巨蟹
{
     delay = 5000,
     [1] = {
                  txt = _t"前面就是巨蟹宫了吧！时间紧迫，雅典娜危在旦夕，我必须尽快突破这里！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"居然有个不知死活的青铜圣斗士擅闯巨蟹宫，阻止他！",
                  name = _t"巨蟹宫守卫",
                  img = "res\\portrait\\圣域杂兵瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[8802] =        ---_剧情12宫巨蟹
{
     delay = 5000,
     [1] = {
                  txt = _t"可恨的青铜圣斗士……等会你就会知道……迪斯马斯克大人到底有多么……可……怕！",
                  name = _t"巨蟹宫守卫",
                  img = "res\\portrait\\圣域杂兵瘦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[8953] =        ---_剧情12宫巨蟹
{
     delay = 5000,
     [1] = {
                  txt = _t"怎么回事，这些漂浮的幽灵是什么，巨蟹宫的气氛真的非常阴森。",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"迪斯马斯克不在这里吗？（响动）什么，声音是从那边传来的，是迪斯马斯克吗？",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[8955] =        ---_剧情12宫巨蟹
{
     delay = 5000,
     [1] = {
                  txt = _t"原来这些景象都是死者生前最后的怨念啊，迪斯马斯克居然连无辜的孩子都不放过！迪斯马斯克，我一定会战胜你！！！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"（响动）又有异响，这次是从那边传来的！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[8957] =        ---_剧情12宫巨蟹
{
     delay = 5000,
     [1] = {
                  txt = _t"为什么，为什么不停止杀戮，为什么！！！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哈哈哈哈哈，愚蠢的弱者，只会生存在可怜的怜悯之中吗，紫龙？既然这么可怜那些弱者，就跟他们一起下地狱好了！",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座迪斯马斯克.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[8950] =        ---_剧情12宫巨蟹
{
     delay = 5000,
     [1] = {
                  txt = _t"这些消散不去的迷雾是什么？难道是迪斯马斯克的积尸气？",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"不好，迷雾会产生怪物，我必须快速击溃这些积尸气源。",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[8800] =        ---_剧情12宫巨蟹
{
     delay = 5000,
     [1] = {
                  txt = _t"又产生了大量的积尸气，必须快速消灭这些积尸气！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[412] =        ---_剧情12宫巨蟹
{
     delay = 5000,
     [1] = {
                  txt = _t"紫龙，今天我就帮助你认识一下自己的懦弱和无能！",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座迪斯马斯克.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[8962] =        ---_剧情12宫巨蟹
{
     delay = 5000,
     [1] = {
                  txt = _t"紫龙，这里就是我最爱的黄泉比良坂，在这里战斗，我的实力将更进一步！",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\黄金圣斗士巨蟹座迪斯马斯克.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[8801] =        ---_剧情12宫巨蟹
{
     delay = 5000,
     [1] = {
                  txt = _t"这就是迪斯马斯克的积尸气吧，遇到迪斯马斯克的时候一定要当心这个可怕的技能！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[413] =        ---_剧情12宫巨蟹
{
     delay = 5000,
     [1] = {
                  txt = _t"又是这些会不断引出僵尸的积尸气，必须快速击溃这些积尸气！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[8805] =        ---_剧情12宫巨蟹
{
     delay = 5000,
     [1] = {
                  txt = _t"迪斯马斯克，一切都结束了！",
                  name = _t"紫龙",
                  img = "res\\portrait\\紫龙裸衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"又一盏灯火熄灭了吗，我要迅速赶往狮子宫！",
                  name = _t"紫龙",
                  img = "res\\portrait\\紫龙裸衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[8958] =        ---_剧情12宫巨蟹
{
     delay = 5000,
     [1] = {
                  txt = _t"迪斯马斯克，接受我紫龙的愤怒吧！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[5932] =        ---卡妙传记（四）_环任务
{
     delay = 6000,
     [1] = {
                  txt = _t"啊啊啊……艾米莉！你怎么会变成这样！",
                  name = _t"克雷托",
                  img = "res\\portrait\\东西伯利亚圣斗士学员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [2] = {
                  txt = _t"（吼……吼……）",
                  name = _t"异化的艾米莉",
                  img = "res\\portrait\\哈迪斯城女仆亡灵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[8941] =        ---卡妙传记（六）_环任务
{
     delay = 3000,
     [1] = {
                  txt = _t"绝—对—零—度！",
                  name = _t"卡妙",
                  img = "res\\portrait\\黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [2] = {
                  txt = _t"艾米莉！艾米莉！你好些了么？",
                  name = _t"克雷托",
                  img = "res\\portrait\\东西伯利亚圣斗士学员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [3] = {
                  txt = _t"呜—嗯—我似乎……做了一个很可怕的梦……",
                  name = _t"艾米莉",
                  img = "res\\portrait\\东西伯利亚居民女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[8323] =        ---卡妙传记（三）_环任务
{
     delay = 3000,
     [1] = {
                  txt = _t"这是卡妙的小宇宙！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[414] =        ---_纱织的别墅
{
     delay = 5000,
     [1] = {
                  txt = _t"无论如何，我也要找到我丢失的那本日记！",
                  name = _t"纱织",
                  img = "res\\portrait\\Q版城户纱织.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[415] =        ---_纱织的别墅
{
     delay = 5000,
     [1] = {
                  txt = _t"雅典娜！你不要欺人太甚，虽然我变小了，但我海皇波塞冬的实力仍然不是你可以抗衡的！",
                  name = _t"海皇波塞冬",
                  img = "res\\portrait\\Q版海皇波塞冬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[416] =        ---_纱织的别墅
{
     delay = 3000,
     [1] = {
                  txt = _t"雅典娜！你到底想要怎么样？",
                  name = _t"冥王哈迪斯",
                  img = "res\\portrait\\Q冥王哈迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"把我的日记还给我，然后离开我的家！",
                  name = _t"纱织",
                  img = "res\\portrait\\Q版城户纱织.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"什么日记，我根本没有见到过！",
                  name = _t"冥王哈迪斯",
                  img = "res\\portrait\\Q冥王哈迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"还在狡辩，受死吧，哈迪斯！",
                  name = _t"纱织",
                  img = "res\\portrait\\Q版城户纱织.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[417] =        ---_纱织的别墅
{
     delay = 3000,
     [1] = {
                  txt = _t"暴怒中的女人，果然不可理喻，即便是女神……",
                  name = _t"冥王哈迪斯",
                  img = "res\\portrait\\Q冥王哈迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"日记，我的日记呢？难道真的不是哈迪斯拿走了！",
                  name = _t"纱织",
                  img = "res\\portrait\\Q版城户纱织.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"哈哈，城户纱织，你根本不配女神的称号，你的日记在我这里！",
                  name = _t"教皇",
                  img = "res\\portrait\\Q版教皇.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 6000,
           },
} 
DialogStrategy[418] =        ---_纱织的别墅
{
     delay = 3000,
     [1] = {
                  txt = _t"你将永远找不到你的日记，哈哈哈哈！",
                  name = _t"教皇",
                  img = "res\\portrait\\Q版教皇.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[9124] =        ---幽香的桂花酒_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"哈哈哈哈，%s,够豪气！来干了！！！",
                  name = _t"醉千杯",
                  img = "res\\portrait\\富士山铃之村老年隐士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9135] =        ---幽香的桂花酒_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"（第一坛下肚，你感觉一股酒劲涌上头来，头有些晕晕的）",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9136] =        ---幽香的桂花酒_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"（第二坛下肚，天开始旋了，地开始转了，你有些站不稳了！）",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[9132] =        ---射手座的指引_庐山
{
     delay = 4000,
     [1] = {
                  txt = _t"%s，挡住我射出的箭，如果你连这个都做不到。你将没有资格守护在雅典娜身边。",
                  name = _t"射手座圣衣",
                  img = "res\\portrait\\黄金圣斗士射手座圣衣组合版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9166] =        ---月饼大盗_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"嘿嘿，好香好香，又有月饼吃啦！",
                  name = _t"月饼大盗",
                  img = "res\\portrait\\遗忘之路流放者2.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哼，吃月饼，先吃吃我的拳头吧！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9167] =        ---月饼大盗_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"可恶，你等着，我一定还会再回来的！",
                  name = _t"月饼大盗",
                  img = "res\\portrait\\遗忘之路流放者2.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9145] =        ---手舞足蹈_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"想不到居然被一只猴子耍了，回去之后一定不能让大家知道！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9150] =        ---手舞足蹈_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"想不到居然被一只猴子耍了，回去之后一定不能让大家知道！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9155] =        ---手舞足蹈_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"想不到居然被一只猴子耍了，回去之后一定不能让大家知道！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9160] =        ---手舞足蹈_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"想不到居然被一只猴子耍了，回去之后一定不能让大家知道！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9165] =        ---手舞足蹈_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"想不到居然被一只猴子耍了，回去之后一定不能让大家知道！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[9096] =        ---中炸弹提示_中秋夜！月饼大爆炸
{
     delay = 4000,
     [1] = {
                  txt = _t"哈！我获得了一个大号南瓜炸弹！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[9111] =        ---大炸弹提示_中秋夜！月饼大爆炸
{
     delay = 4000,
     [1] = {
                  txt = _t"哇！我获得了一个超级南瓜炸弹！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[9411] =        ---连珠炸弹提示_中秋夜！月饼大爆炸
{
     delay = 4000,
     [1] = {
                  txt = _t"连珠炮！这下我能连续扔10个炸弹拉！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9121] =        ---剧情12宫双子宫_剧情12宫双子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"前面宏伟的建筑就是双子宫了吗？但是为什么我的锁链感觉不到一点敌人的小宇宙呢？",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"什么人！居然擅闯伟大的双子宫！",
                  name = _t"双子宫守卫",
                  img = "res\\portrait\\圣域杂兵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9172] =        ---剧情12宫双子宫_剧情12宫双子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"哼哼……你一定会永远的迷失在双子宫的，永……远……",
                  name = _t"双子宫守卫",
                  img = "res\\portrait\\圣域杂兵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"永远迷失在双子宫？这究竟是什么意思？",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"不管怎样，现在只能硬着头皮前进了！",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9462] =        ---剧情12宫双子宫_剧情12宫双子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"为什么，双子宫门前反而这么安静，不对！有大量的敌人！！！",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"呱……呱……呱",
                  name = _t"乌鸦群",
                  img = "res\\portrait\\乌鸦.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9173] =        ---剧情12宫双子宫_剧情12宫双子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"混蛋！混蛋！居然对本大爷的小宠物们这么残忍！让本大爷取了你的小狗命！",
                  name = _t"加米安",
                  img = "res\\portrait\\白银乌鸦座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9174] =        ---剧情12宫双子宫_剧情12宫双子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"哼哼哼，要不是本大爷这次得了重感冒，你以为自己会有机会赢我吗？",
                  name = _t"加米安",
                  img = "res\\portrait\\白银乌鸦座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"迷失在双子宫？这究竟是什么意思？",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"哈哈哈，我可是世界上最聪明的圣斗士，我怎么可能告诉你开启双子座的机关需要分别开启双边甬道的机关呢。",
                  name = _t"加米安",
                  img = "res\\portrait\\白银乌鸦座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"嗯？我好像说了什么……",
                  name = _t"加米安",
                  img = "res\\portrait\\白银乌鸦座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"开启两边的机关，首先要开启两边的机关，就可以穿过双子宫了！",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9175] =        ---剧情12宫双子宫_剧情12宫双子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"双子宫的无尽迷宫解开了，不过我的锁链怎么还是感觉不到一丝敌人的气息。",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9468] =        ---剧情12宫双子宫_剧情12宫双子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"这里是双子宫，一个矛盾之地，你在这里可以得到答案，也会感到困惑，你在这里可以感到安全，也会感到恐惧，你在这里可以拥有自由，也会被永久的囚禁。",
                  name = _t"神秘的双子座圣衣",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"你究竟是谁？为什么一点也感觉不到你的小宇宙！",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"我是谁？我是天使，也是恶魔，我是人类的救世主，也是人世的终结者，我是一粒的微尘，也是整个宇宙，我是一个问题，也是一个答案。",
                  name = _t"神秘的双子座圣衣",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9470] =        ---剧情12宫双子宫_剧情12宫双子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"说了好多好多，说的好累好累，我想你也累了吧，不过幸好，双子宫可以将你埋葬。",
                  name = _t"神秘的双子座圣衣",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9472] =        ---剧情12宫双子宫_剧情12宫双子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"我我我……我是谁？我是谁？我是守卫雅典娜女神的黄金圣斗士双子座，对，我是守护雅典娜女神的双子座。",
                  name = _t"神秘的双子座圣衣",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"不不不，我是代替神成为人类救世主的最强圣斗士，你是谁！？陷入到无尽的异次元空间之中吧！",
                  name = _t"神秘的双子座圣衣",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9473] =        ---剧情12宫双子宫_剧情12宫双子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"抱歉，另一个我将你带进了这个次元空间，想要脱出这个次元空间，只能靠你自己的小宇宙将另一个我击败。",
                  name = _t"善之双子",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这里就是异次元空间，是我双子座凭借自己的意念之力进入的次元空间，这里不同于人界，也不同于地狱界，可以说是一个无边的黑洞。",
                  name = _t"善之双子",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9474] =        ---剧情12宫双子宫_剧情12宫双子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"这是善之圣衣，触碰此圣衣可以获得正义之光，以此来压制邪恶双子的戾气。",
                  name = _t"善之双子",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9475] =        ---剧情12宫双子宫_剧情12宫双子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"这是恶之圣衣，触碰此圣衣可以获得恶魔之力，以此来戳穿善之双子的虚伪之光。",
                  name = _t"善之双子",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9476] =        ---剧情12宫双子宫_剧情12宫双子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"下面仔细听我说！",
                  name = _t"善之双子",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"黄色的光球可以给你提供奇妙的恢复和小宇宙的提升，但是这些光球也会变成邪恶的炸弹，一旦你没有汲取足够多的黄色光球，那么蜕变的黑色光球将给你带来致命的打击。",
                  name = _t"善之双子",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"汲取足够多的黄色光球，躲避黑色邪恶光球。",
                  name = _t"善之双子",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9561] =        ---剧情12宫双子宫_剧情12宫双子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"哈哈……哈哈哈……哈哈哈……",
                  name = _t"恶之双子",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"那些伪善就是我作为人类的唯一缺点了吧！现在我收起这些可笑的伪善，带领你们这些懦弱无能的人类走向新世界！",
                  name = _t"恶之双子",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9477] =        ---剧情12宫双子宫_剧情12宫双子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"！！！我的异度空间奔溃了？",
                  name = _t"恶之双子",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"不！不！不！！！",
                  name = _t"恶之双子",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"结束了吗？",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9562] =        ---剧情12宫双子宫_剧情12宫双子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"终于突破双子宫了吗？真是一段不可思议的旅程。但是这个肯定不是真正的双子座，我的锁链探寻不到他的小宇宙！",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"不过现在也不是感叹的时候了，纱织小姐危在旦夕！",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"下面的是巨蟹宫了吧！",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[8513] =        ---恶战！黄金野牛之拳！_剧情12宫金牛宫
{
     delay = 4000,
     [1] = {
                  txt = _t"记住我说过的话，绝对不可以轻视黄金圣斗士的实力！",
                  name = _t"穆",
                  img = "res\\portrait\\黄金圣斗士白羊座穆.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"穆先生！我会牢牢记住的！好，下面前往金牛宫！！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[8515] =        ---恶战！黄金野牛之拳！_剧情12宫金牛宫
{
     delay = 3000,
     [1] = {
                  txt = _t"有敌人闯入！快拦住他们！",
                  name = _t"卫兵队长",
                  img = "res\\portrait\\杂兵壮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"让我来碾碎这些小虫子吧！",
                  name = _t"巨型金牛宫守卫",
                  img = "res\\portrait\\圣域杂兵壮.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[8517] =        ---恶战！黄金野牛之拳！_剧情12宫金牛宫
{
     delay = 4000,
     [1] = {
                  txt = _t"星矢，我等你很久了，跟我卡西欧士再次一决胜负吧！",
                  name = _t"卡西欧士",
                  img = "res\\portrait\\卡西欧士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[8518] =        ---恶战！黄金野牛之拳！_剧情12宫金牛宫
{
     delay = 4000,
     [1] = {
                  txt = _t"可恶……莎尔娜小姐，我尽力了，我没法阻拦星矢。",
                  name = _t"卡西欧士",
                  img = "res\\portrait\\卡西欧士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"卡西欧士……",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[8522] =        ---恶战！黄金野牛之拳！_剧情12宫金牛宫
{
     delay = 4000,
     [1] = {
                  txt = _t"不可能，难道……星矢在战斗中觉醒了第七感？",
                  name = _t"阿鲁迪巴",
                  img = "res\\portrait\\黄金圣斗士金牛座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哈哈，金牛座的阿鲁迪巴，你终于准备出拳了啊！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[419] =        ---恶战！黄金野牛之拳！_剧情12宫金牛宫
{
     delay = 6000,
     [1] = {
                  txt = _t"我会遵守承诺，你们可以通过金牛宫了。不过我还是要提醒你们，随后的战斗可不会这么轻松啦。",
                  name = _t"阿鲁迪巴",
                  img = "res\\portrait\\黄金圣斗士金牛座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[420] =        ---_混沌战场
{
     delay = 15000,
     [1] = {
                  txt = _t"当资源点水晶完全变色时，水晶周围20m的本方玩家可获得夺旗积分，开启水晶后不要急着离开哦。",
                  name = _t"雅典娜",
                  img = "res\\portrait\\副本传送雅典娜雕像.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9831] =        ---沙加！接近神的男人！_剧情12宫处女宫
{
     delay = 4000,
     [1] = {
                  txt = _t"处女宫的黄金圣斗士是沙加，那家伙可以说是最接近神的男人。",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"最接近神的男人？什么意思？",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"我只能告诉你一件事，千万别让沙加睁开眼睛。",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"如果让沙加睁开了眼睛，你们所有的人都必死无疑。",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9835] =        ---沙加！接近神的男人！_剧情12宫处女宫
{
     delay = 4000,
     [1] = {
                  txt = _t"卑微的人，竟敢踏入处女宫，接受惩罚吧！",
                  name = _t"神像",
                  img = "res\\portrait\\命运女神幻像.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9841] =        ---沙加！接近神的男人！_剧情12宫处女宫
{
     delay = 3000,
     [1] = {
                  txt = _t"神像都消失了！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"难道刚才那些是处女宫的守护者制造的幻象？",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"好强的力量……",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9844] =        ---沙加！接近神的男人！_剧情12宫处女宫
{
     delay = 4000,
     [1] = {
                  txt = _t"看上去这些杂鱼耽搁了他们不少时间，我的兄弟们还真是弱啊。",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9845] =        ---沙加！接近神的男人！_剧情12宫处女宫
{
     delay = 4000,
     [1] = {
                  txt = _t"一辉！我在这等你很久了。",
                  name = _t"基鲁提",
                  img = "res\\portrait\\基鲁提.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"基……鲁提！不可能，你已经死了！",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"别太天真了，你真以为凭你那样的实力可以杀死我吗？",
                  name = _t"基鲁提",
                  img = "res\\portrait\\基鲁提.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"那就让你再见识一次我的实力。",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9846] =        ---沙加！接近神的男人！_剧情12宫处女宫
{
     delay = 4000,
     [1] = {
                  txt = _t"只是幻象吗？为什么离处女宫越近，就越会想起以前死亡皇后岛的事情？",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9848] =        ---沙加！接近神的男人！_剧情12宫处女宫
{
     delay = 4000,
     [1] = {
                  txt = _t"沙加，你让我的兄弟们受了重伤，不会就这样了事的。",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"原来是凤凰座的一辉啊，让我来唤醒你的记忆吧，我说过，再次见到你的时候，就是你的死期。",
                  name = _t"沙加",
                  img = "res\\portrait\\黄金圣斗士处女座沙加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"我！想起来了！你是死亡皇后岛上！那个能够随时取走我性命的男人！",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9849] =        ---沙加！接近神的男人！_剧情12宫处女宫
{
     delay = 4000,
     [1] = {
                  txt = _t"哼，不自量力的反抗，让我为你选择一个合适的葬身之地吧。",
                  name = _t"沙加",
                  img = "res\\portrait\\黄金圣斗士处女座沙加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[421] =        ---沙加！接近神的男人！_剧情12宫处女宫
{
     delay = 4000,
     [1] = {
                  txt = _t"一辉，我是来向你讨回凤凰座圣衣的！",
                  name = _t"强戈",
                  img = "res\\portrait\\强戈.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哼，被我杀死的人也敢来向我挑战，无论你是不是幻象，我都不介意再杀你一次。",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9851] =        ---沙加！接近神的男人！_剧情12宫处女宫
{
     delay = 4000,
     [1] = {
                  txt = _t"果然只是幻象！",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[422] =        ---沙加！接近神的男人！_剧情12宫处女宫
{
     delay = 4000,
     [1] = {
                  txt = _t"哼，如果你现在跪下来把我像神一样膜拜，说不定我会放过你。",
                  name = _t"沙加",
                  img = "res\\portrait\\黄金圣斗士处女座沙加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"很遗憾，我不相信神佛，我只相信自己的力量。",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[423] =        ---沙加！接近神的男人！_剧情12宫处女宫
{
     delay = 4000,
     [1] = {
                  txt = _t"看来，我似乎是小看你了！开！",
                  name = _t"沙加",
                  img = "res\\portrait\\黄金圣斗士处女座沙加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9855] =        ---沙加！接近神的男人！_剧情12宫处女宫
{
     delay = 4000,
     [1] = {
                  txt = _t"是一辉救了我们……",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[424] =        ---剧情12宫狮子宫_剧情12宫狮子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"我在哪里？我在干什么？星矢！你怎么会在这里？",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"艾欧里亚你的意志终于恢复了吗？",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"啊！啊！啊！！！我的头，好像就要爆炸一样，啊！！！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"不不不，我要杀人，我要杀人，我要杀人！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"艾欧里亚！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[425] =        ---剧情12宫狮子宫_剧情12宫狮子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"艾欧里亚，让我卡西欧士来做你的对手吧！我倒是想看看你这个叛徒的弟弟有什么能耐！",
                  name = _t"卡西欧士",
                  img = "res\\portrait\\卡西欧士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"嗯？一个圣斗士候补生居然都跑来狮子宫叫嚣了！你能承受百分之一力量的闪电光速拳吗！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[426] =        ---剧情12宫狮子宫_剧情12宫狮子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"不！卡西欧士！！！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"星矢，只有一个人死亡才可能唤醒教皇的魔皇拳，我不是为了你，而是为了不想莎尔娜为了你的死而悲伤……",
                  name = _t"卡西欧士",
                  img = "res\\portrait\\卡西欧士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"我的头……我的头……我懂了，这就是杀戮的快感啊，我还要继续屠杀，屠杀！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[427] =        ---剧情12宫狮子宫_剧情12宫狮子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"我的头，我的头，我好想住手，但是身体却不听使唤，星矢，击败我，击败我！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9895] =        ---剧情12宫狮子宫_剧情12宫狮子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"啊！！！啊！！！我的头，我的头……",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"沙加，你先退下吧！",
                  name = _t"教皇",
                  img = "res\\portrait\\教皇.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"哼，艾欧里亚，我不会杀死你，但是你将成为我的杀戮工具，除非有人死在你的面前，否则你会永远被魔皇拳控制！",
                  name = _t"教皇",
                  img = "res\\portrait\\教皇.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"我的头，我的头，我的头……",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9882] =        ---剧情12宫狮子宫_剧情12宫狮子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"怎么！狮子宫居然还有守卫？难道艾欧里亚不欢迎我们通过狮子宫？",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"星矢，我们劝你赶紧离开，艾欧里亚大人已经下达了命令，擅闯狮子宫者，格杀勿论！",
                  name = _t"狮子宫守卫",
                  img = "res\\portrait\\圣域杂兵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9883] =        ---剧情12宫狮子宫_剧情12宫狮子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"终于击败了守卫，前面就是狮子宫了！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9884] =        ---剧情12宫狮子宫_剧情12宫狮子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"星矢，停下！再敢前进一步，前面将是你的坟墓！",
                  name = _t"美斯狄",
                  img = "res\\portrait\\白银蜥蜴座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"美斯狄！我现在必须通过狮子宫！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"麻烦！对手又是这种脏兮兮的青铜！",
                  name = _t"美斯狄",
                  img = "res\\portrait\\白银蜥蜴座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9886] =        ---剧情12宫狮子宫_剧情12宫狮子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"即便侥幸胜过了我，哼哼哼……最近狂躁的艾欧里亚大人也一定不会放过你。",
                  name = _t"美斯狄",
                  img = "res\\portrait\\白银蜥蜴座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"狂躁的艾欧里亚？为什么这么说？",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"当……你死的……时候……就会知道……",
                  name = _t"美斯狄",
                  img = "res\\portrait\\白银蜥蜴座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9889] =        ---剧情12宫狮子宫_剧情12宫狮子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"教皇，我要拜见女神大人！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"放肆！没人可以见女神大人！",
                  name = _t"教皇",
                  img = "res\\portrait\\教皇.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"如果你拦着我，那么即便是击败你，我也要见女神大人！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"果然是叛徒的弟弟！连骄傲的狮子座也要背叛女神了啊！",
                  name = _t"教皇",
                  img = "res\\portrait\\教皇.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"胡说，背叛女神的根本就是你，女神宫殿根本就没有女神！我要打倒你，教皇！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [6] = {
                  txt = _t"住手，艾欧里亚！你知道自己在跟谁作战吗？想要碰教皇大人，就先请击败我！",
                  name = _t"沙加",
                  img = "res\\portrait\\黄金圣斗士处女座沙加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9897] =        ---剧情12宫狮子宫_剧情12宫狮子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"艾欧里亚，女神危在旦夕，请让我通过狮子宫！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"啊……啊，我的头好痛，我的头好痛……",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"艾欧里亚！艾欧里亚！艾欧里亚……",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"怎么回事，这些腐蚀之物究竟是什么？艾欧里亚看上去神智不清，是因为这些秽物腐蚀了他的心智吗？",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9901] =        ---剧情12宫狮子宫_剧情12宫狮子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"艾欧里亚，我是星矢，你清醒了吗？",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"星……矢，我……在干什么？",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"啊！！！我的头……啊！！！擅闯狮子宫的人都必须接受接受血债的惩罚！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[428] =        ---剧情12宫狮子宫_剧情12宫狮子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"射手座的黄金的圣衣！？居然……居然穿在了我的身上？",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哥哥……哥哥……啊，我的头好痛……",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"我的头，我的头，我好想住手，但是身体却不听使唤，星矢，击败我，击败我！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9942] =        ---剧情12宫狮子宫_剧情12宫狮子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"干的好星矢，我现在终于控制自己不再举起拳头……",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"不，是艾欧罗斯大人的英灵帮助了我，凭我自己的能力怎么可能胜过你。",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"我都做了什么，卡西欧士怎么会……我都做了什么，星矢，快，赶去处女宫！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9964] =        ---剧情12宫狮子宫_剧情12宫狮子宫
{
     delay = 5000,
     [1] = {
                  txt = _t"是……星矢吗？我的身体好像变成了另一个人，啊……啊……好痛苦",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"艾欧里亚，你没事吧！？果然是这些秽物在腐蚀艾欧里亚的心智。",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"我的头，我的头，不不不！擅闯狮子宫的人都要接受制裁！！！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9447] =        ---入此门者_冥界
{
     delay = 2000,
     [1] = {
                  txt = _t"喂！那边的是谁？",
                  name = _t"绝望守卫",
                  img = "res\\portrait\\暴怒之衣穿着形态.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9648] =        ---哈迪斯的制裁_冥界
{
     delay = 1000,
     [1] = {
                  txt = _t"该死的圣斗士！你们将永远在这里接受冥王陛下的惩罚！",
                  name = _t"库托斯",
                  img = "res\\portrait\\冥斗士冰系先锋.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"这是你们胆敢反抗陛下的代价！",
                  name = _t"明塔",
                  img = "res\\portrait\\冥界杂兵远程女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"……",
                  name = _t"修罗",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [4] = {
                  txt = _t"……",
                  name = _t"卡妙",
                  img = "res\\portrait\\黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9826] =        ---最后的告别_冥界
{
     delay = 2000,
     [1] = {
                  txt = _t"救命！救救我！",
                  name = _t"被缚的灵魂",
                  img = "res\\portrait\\黄泉比良坂爆炸游尸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"……是谁？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9827] =        ---裁决_冥界
{
     delay = 2000,
     [1] = {
                  txt = _t"什么人！出来！",
                  name = _t"审判厅守卫",
                  img = "res\\portrait\\冥斗士大镰刀男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9828] =        ---战友_冥界
{
     delay = 2000,
     [1] = {
                  txt = _t"星矢！瞬！你们果然在这里！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9903] =        ---黑风之狱_冥界
{
     delay = 2000,
     [1] = {
                  txt = _t"……好大的狗！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"而且在吃人！狗怎么可以吃人呢？",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"小心！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9967] =        ---地狱看门狗_冥界
{
     delay = 2000,
     [1] = {
                  txt = _t"大胆之徒！竟敢殴打冥王陛下的爱犬，这等于殴打冥王陛下本人！",
                  name = _t"法拉奥",
                  img = "res\\portrait\\冥斗士天兽星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"……你的意思是冥王是条狗？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"……好大的胆子！这个罪死一万次都不能原谅！",
                  name = _t"法拉奥",
                  img = "res\\portrait\\冥斗士天兽星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[9268] =        ---本位变音_冥界
{
     delay = 1000,
     [1] = {
                  txt = _t"哈哈哈哈……就由我法拉奥来衡量你们的罪过吧！",
                  name = _t"法拉奥",
                  img = "res\\portrait\\冥斗士天兽星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"……心，心脏飞出来了！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"等等！",
                  name = _t"奥路菲",
                  img = "res\\portrait\\白银圣斗士天琴座奥路菲.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [4] = {
                  txt = _t"奥，奥路菲！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [5] = {
                  txt = _t"就由我来解决他们吧。",
                  name = _t"奥路菲",
                  img = "res\\portrait\\白银圣斗士天琴座奥路菲.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9924] =        ---延连音_冥界
{
     delay = 2000,
     [1] = {
                  txt = _t"终于被我抓到了你这个叛徒！刚才那一下不好受吧！",
                  name = _t"法拉奥",
                  img = "res\\portrait\\冥斗士天兽星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"奥路菲！！你这个冥斗士做了什么！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9927] =        ---西绪弗斯_冥界
{
     delay = 1000,
     [1] = {
                  txt = _t"那里有个人在推石头……问问他看有没有情报吧。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9933] =        ---龙与白鸟_冥界
{
     delay = 1000,
     [1] = {
                  txt = _t"站住！我是天角星的洛克，死吧，圣……",
                  name = _t"洛克",
                  img = "res\\portrait\\冥斗士天角星洛克.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"庐山升龙霸！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"什么？洛克被打倒了？可恶！看我天败星……",
                  name = _t"伊万",
                  img = "res\\portrait\\冥斗士天败星伊万.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [4] = {
                  txt = _t"没时间听你自报姓名！钻石星辰拳！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [5] = {
                  txt = _t"真是不堪一击……都解决了吗？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9934] =        ---地狱豺狼之力_冥界
{
     delay = 1000,
     [1] = {
                  txt = _t"小子们，得意得太早了！还有我幽灵狼在看着你们！",
                  name = _t"菲列基亚斯",
                  img = "res\\portrait\\黑暗杂兵头目.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"庐山升龙霸！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"钻石星辰拳！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [4] = {
                  txt = _t"狂妄！咆哮地狱！",
                  name = _t"菲列基亚斯",
                  img = "res\\portrait\\黑暗杂兵头目.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [5] = {
                  txt = _t"糟，糟糕，紫龙和冰河都被打倒了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[9282] =        ---双子再登场_冥界
{
     delay = 1000,
     [1] = {
                  txt = _t"别急啊，还有我呢，小狼狼，来，跟加隆大爷切磋一下。把你的招数都使出来。",
                  name = _t"加隆",
                  img = "res\\portrait\\黄金圣斗士双子座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"加，加隆！咆哮地狱！咆哮地狱！可恶，怎么完全无效？咆哮……",
                  name = _t"菲列基亚斯",
                  img = "res\\portrait\\黑暗杂兵头目.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"银河星爆！",
                  name = _t"加隆",
                  img = "res\\portrait\\黄金圣斗士双子座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [4] = {
                  txt = _t"……这，差距也太大了吧……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9940] =        ---火海浩瀚之波_冥界
{
     delay = 1000,
     [1] = {
                  txt = _t"……是，是，是教皇大人！白羊宫的史昂！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
} 
DialogFinishIdTask[9952] =        ---破坏死者之柱_冥界
{
     delay = 1000,
     [1] = {
                  txt = _t"加隆，我们还有一场架没打完呢。",
                  name = _t"拉达曼迪斯",
                  img = "res\\portrait\\冥斗士天猛星拉大曼迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"欢迎之至。一路上对付的全是废物，实在是缺乏刺激。",
                  name = _t"加隆",
                  img = "res\\portrait\\黄金圣斗士双子座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9953] =        ---飞龙再生_冥界
{
     delay = 1000,
     [1] = {
                  txt = _t"你们圣域已经全完了，我要报你杀我六名部下的仇！加隆，来吧！",
                  name = _t"拉达曼迪斯",
                  img = "res\\portrait\\冥斗士天猛星拉大曼迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"等等！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9875] =        ---危机时刻_冥界
{
     delay = 1000,
     [1] = {
                  txt = _t"拉达曼提斯大人！潘多拉女王有令，要您去参加音乐会！",
                  name = _t"天辉星",
                  img = "res\\portrait\\冥斗士天牢星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"哼……看来我们的决斗要延期了，加隆！",
                  name = _t"拉达曼提斯",
                  img = "res\\portrait\\冥斗士天猛星拉大曼迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"这……突然出现了数名有着恐怖小宇宙的冥斗士……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
} 
DialogAcceptIdTask[9682] =        ---血池地狱_冥界
{
     delay = 2000,
     [1] = {
                  txt = _t"%s，我和紫龙先走，你随后跟上来！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9757] =        ---血池地狱_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"奇怪……怎么好像感觉不到紫龙他们的小宇宙了？在找找看。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9758] =        ---血池地狱_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"这里也没有。难道是出了什么事情？",
                  name = _t"",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9759] =        ---血池地狱_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"桀桀，不用找了。来到血池地狱，你们只有一条路可以走！那就是死！",
                  name = _t"西路费都",
                  img = "res\\portrait\\冥斗士天捷星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[9683] =        ---消失的紫龙和冰河_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"桀桀，想要知道紫龙他们的下落，就先找到我的真身吧！",
                  name = _t"西路费都",
                  img = "res\\portrait\\冥斗士天捷星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[9684] =        ---天捷星的诡计_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"笨蛋！你以为我真的会给你机会吗？你就等着被血咒之力侵蚀吧！",
                  name = _t"西路费都",
                  img = "res\\portrait\\冥斗士天捷星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"（%s，%s，快醒醒！你不可以倒在这里！）",
                  name = _t"雅典娜",
                  img = "res\\portrait\\城户纱织.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [3] = {
                  txt = _t"是雅典娜！对，我绝不可以倒在这里！我必须赶到雅典娜身边！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9765] =        ---天捷星的诡计_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"怎么回事！你居然破除了血咒之力！这不可能！",
                  name = _t"西路费都",
                  img = "res\\portrait\\冥斗士天捷星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[9685] =        ---血之傀儡_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"可恶！血之傀儡，全部给我上，杀死他！",
                  name = _t"西路费都",
                  img = "res\\portrait\\冥斗士天捷星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9766] =        ---血之傀儡_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"咦？这个小宇宙很熟悉，是%s吗？",
                  name = _t"神秘的声音",
                  img = "res\\portrait\\嗜血蝙蝠.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"是谁！！！好像是那边的巨石中传过来的。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9769] =        ---与雷虎的比斗_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"%s，想不到即使有冥王结界的压制，你的实力还这么强！",
                  name = _t"雷虎",
                  img = "res\\portrait\\庐山雷虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"看来我彻彻底底的输了！",
                  name = _t"雷虎",
                  img = "res\\portrait\\庐山雷虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9994] =        ---恶魂的怨力_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"西路费都，受死吧！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[9694] =        ---打败天捷星_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"可恶！既然你这么想死，那就让你看看我西路费都真正的实力！",
                  name = _t"西路费都",
                  img = "res\\portrait\\冥斗士天捷星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9773] =        ---只能前行的脚步_冥界
{
     delay = 2000,
     [1] = {
                  txt = _t"这股小宇宙是……一辉！他也来了吗？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"%s，你现在还有时间关心别人吗？",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"潘多拉！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[9697] =        ---潘多拉的意图？_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"对不起，一辉，我必须要赶到雅典娜身边！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"所以，你一定不能死！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[9701] =        ---三宗罪之贪婪_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"欲望，欲望，所有的人都有欲望！存有欲望之人将永远无法离开这里！",
                  name = _t"贪婪",
                  img = "res\\portrait\\瘟疫之衣静立组合形态.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"什么东西！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9779] =        ---贪婪之拾遗（一）_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"这是一颗价值连城的红宝石。把它据为己有吧。只要有了这颗宝石，你就可以过上奢侈的生活。你可以住上豪宅，你可以娶漂亮的老婆……",
                  name = _t"贪婪",
                  img = "res\\portrait\\瘟疫之衣静立组合形态.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"哼，你别想动摇我。这对我来说不过是一块红色的石头！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9781] =        ---贪婪之拾遗（二）_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"这是冥王神衣！不可能，它怎么会出现在这里！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10027] =        ---贪婪之力量（一）_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"哈哈哈，干得不错。来吧，冰河已经被你杀死了，冥王神衣是你的了！有了神衣，你就可以统治整个世界！",
                  name = _t"贪婪",
                  img = "res\\portrait\\瘟疫之衣静立组合形态.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"又是你！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[9706] =        ---三宗罪之暴食_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"可恶！我一定会找到你的弱点的，一定会！！！",
                  name = _t"贪婪",
                  img = "res\\portrait\\瘟疫之衣静立组合形态.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9785] =        ---冲出热砂地狱_冥界
{
     delay = 2000,
     [1] = {
                  txt = _t"好，继续前进吧！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"等等，%s。",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9788] =        ---冰河的托付_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"咦？雅典娜神像在发光，难道是在指引我什么？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9790] =        ---鲁邦的故事_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"鲁琪，你怎么了！醒醒，你快醒醒！你不可以离开我！！！",
                  name = _t"鲁邦",
                  img = "res\\portrait\\坦桑诺亚男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9792] =        ---忘恩负义_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"等等，哥哥都是为了我才会这么做。请你不要伤害他，要杀就杀我吧。",
                  name = _t"鲁琪",
                  img = "res\\portrait\\命运三女神幻象3.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9794] =        ---灵魂的伪装_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"哥顿，你这个胆小鬼，快出来！",
                  name = _t"鲁邦",
                  img = "res\\portrait\\坦桑诺亚男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"鲁邦，没有人敢在群蛇地狱闹事，你这是在找死！！",
                  name = _t"哥顿",
                  img = "res\\portrait\\冥斗士天牢星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9799] =        ---寒冰地狱_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"咦……我好像感觉到了星矢的小宇宙。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9800] =        ---寒冰地狱_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"星矢！你怎么了！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[9735] =        ---神像的召唤_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"星矢！希望神像的力量能够帮助到你。你一定要醒过来啊！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9804] =        ---星矢的小宇宙_冥界
{
     delay = 4000,
     [1] = {
                  txt = _t"哦——看样子你们还剩下一口气。不过，你们要完全断气，也只是时间的问题罢了。",
                  name = _t"巴连达英",
                  img = "res\\portrait\\冥斗士天哭星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 4000,
           },
     [2] = {
                  txt = _t"既然如此，还是让我送你们一程吧。也好让你们不用继续受罪！",
                  name = _t"巴连达英",
                  img = "res\\portrait\\冥斗士天哭星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"住手！！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[9737] =        ---危险！星矢_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"等……等等……",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"星矢！！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"巴连达英，我们……有过约定！你……你的对手……是我！！！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9806] =        ---天哭星的默认_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"不可能！不可能！！我怎么会败给你们！！！",
                  name = _t"巴连达英",
                  img = "res\\portrait\\冥斗士天哭星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[9743] =        ---冲入犹大厅_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"星矢，我们走吧！一定要赶到雅典娜身边！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"拦住他们！绝不能让他们接近冥王大人！",
                  name = _t"冥斗士",
                  img = "res\\portrait\\冥斗士杂兵远程男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9812] =        ---瞬_冥界
{
     delay = 2000,
     [1] = {
                  txt = _t"瞬！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10031] =        ---叹息之墙_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"可恶！为什么破坏不了这该死的墙！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"没用的！叹息之墙只有神才能通过！",
                  name = _t"沙加",
                  img = "res\\portrait\\黄金圣斗士处女座沙加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[9747] =        ---沙加的牺牲_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"住手！沙加！我可不能让你这种好汉白白送死！",
                  name = _t"童虎",
                  img = "res\\portrait\\黄金圣斗士天秤座童虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"沙加，老师说的没错。像一个人先走还早得很呢！",
                  name = _t"米罗",
                  img = "res\\portrait\\黄金圣斗士天蝎座米罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"你、你们都……",
                  name = _t"沙加",
                  img = "res\\portrait\\黄金圣斗士处女座沙加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[9752] =        ---冲向极乐净土_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"黄金圣斗士们走了…他们将爱与正义…一切都托付给我们了……",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"走吧！黄金圣斗士拼了命为我们打开了这个洞口，绝不能让他们白白牺牲了！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"嗯！！你们先走，我随后就跟上去！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [4] = {
                  txt = _t"天龙座，快让开！",
                  name = _t"哥顿",
                  img = "res\\portrait\\冥斗士天牢星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9821] =        ---一辉来了！_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"这个小宇宙是？一辉和潘多拉！他们怎么会在一起？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9822] =        ---一辉来了！_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"慢着一辉！要是追着紫龙他们过去，你也会落得尸骨无存的……",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"我知道，但是我还是非去不可！",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"我可以助你前往极乐净土……不过，你要替我报仇，拜托你，一辉！！（潘多拉讲述起她的故事……）",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [4] = {
                  txt = _t"带上我的项链，你就可以去极乐净土了！你要记住真正恐怖的是哈迪斯的亲信达拿都斯和修普诺斯！！你要……",
                  name = _t"潘多拉",
                  img = "res\\portrait\\潘多拉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"潘多拉，你怎么了！",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [6] = {
                  txt = _t"笨蛋！先担心你自己再说吧！去死吧！凤凰座！",
                  name = _t"天英星",
                  img = "res\\portrait\\冥斗士天英星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[9998] =        ---极寒！冰封的天秤宫！_剧情12宫天秤宫
{
     delay = 4000,
     [1] = {
                  txt = _t"前面是天秤宫，紫龙，老师应该没理由阻止我们吧。",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"我也是这样想。",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"这一宫看来可以直接通过了。",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10001] =        ---极寒！冰封的天秤宫！_剧情12宫天秤宫
{
     delay = 4000,
     [1] = {
                  txt = _t"防御壁挡在这里，看来我们必须绕过去。",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10004] =        ---极寒！冰封的天秤宫！_剧情12宫天秤宫
{
     delay = 4000,
     [1] = {
                  txt = _t"擅闯十二宫的青铜小子们！准备受死吧！",
                  name = _t"银蝇座",
                  img = "res\\portrait\\白银银蝇座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"看来即使老师守护的宫殿也没法轻易通过，只好一战了。",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10007] =        ---极寒！冰封的天秤宫！_剧情12宫天秤宫
{
     delay = 4000,
     [1] = {
                  txt = _t"那是？冰河！冰河被封在冰棺里！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"我想除了冰河的老师卡妙之外，不会有别人能做到这种事情。",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"我在异次元空间失去了冰河的踪迹，没想到他在这里。",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10012] =        ---极寒！冰封的天秤宫！_剧情12宫天秤宫
{
     delay = 4000,
     [1] = {
                  txt = _t"我从异次元里出来了？这是哪里？",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"我的老师,卡妙!难道这里是水瓶宫？",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"这里是第七宫，天秤宫，为师命你不得再继续前进。",
                  name = _t"卡妙",
                  img = "res\\portrait\\黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"不行，就算是您的命令，我也不能听从。",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"那我就只有诉诸武力了。",
                  name = _t"卡妙",
                  img = "res\\portrait\\黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[429] =        ---极寒！冰封的天秤宫！_剧情12宫天秤宫
{
     delay = 4000,
     [1] = {
                  txt = _t"冰河，接受为师的冰封吧！",
                  name = _t"卡妙",
                  img = "res\\portrait\\黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10016] =        ---极寒！冰封的天秤宫！_剧情12宫天秤宫
{
     delay = 4000,
     [1] = {
                  txt = _t"一定是那时候，哥哥破坏了异次元空间，冰河才坠落到了天秤宫。",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"等等，我感到了冰河的小宇宙，冰河还活着！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"我们快打碎冰棺，救出冰河！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10018] =        ---极寒！冰封的天秤宫！_剧情12宫天秤宫
{
     delay = 4000,
     [1] = {
                  txt = _t"完全…没有办法破坏冰棺！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10019] =        ---极寒！冰封的天秤宫！_剧情12宫天秤宫
{
     delay = 4000,
     [1] = {
                  txt = _t"是天秤座的黄金圣衣！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10021] =        ---极寒！冰封的天秤宫！_剧情12宫天秤宫
{
     delay = 4000,
     [1] = {
                  txt = _t"这里交给我吧，你们两个先走，时间不多了。",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"明白了，瞬，拜托了。",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[9750] =        ---天贵星米诺斯_冥界
{
     delay = 3000,
     [1] = {
                  txt = _t"你们想对叹息之墙做什么？给我让开！",
                  name = _t"米诺斯",
                  img = "res\\portrait\\冥斗士天贵星米洛斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10068] =        ---剧情12宫天蝎宫_剧情12宫天蝎宫
{
     delay = 5000,
     [1] = {
                  txt = _t"不知道冰河怎么样了？",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"放心吧，有瞬在，我相信冰河一定能恢复过来！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"无论如何，先突破这里再说吧！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10097] =        ---剧情12宫天蝎宫_剧情12宫天蝎宫
{
     delay = 5000,
     [1] = {
                  txt = _t"前面就是天蝎宫的守卫了！让我们一鼓作气冲过去吧！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"冲过去！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10070] =        ---剧情12宫天蝎宫_剧情12宫天蝎宫
{
     delay = 5000,
     [1] = {
                  txt = _t"星矢，你感受到了吗？",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"这个正在燃烧中的小宇宙是？瞬！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"我想起了老师给我讲过的一个故事，一个猎人精疲力尽了，熊给他叼来了鲜鱼充饥，狐狸带来了葡萄，但是兔子什么也没有，就自己跳进火里成为猎人的美餐。",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"你是说瞬燃烧自己的小宇宙来给冰河取暖？",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"这就是瞬的圣斗士之道，他不喜欢战斗，宁愿牺牲自己来保全同伴。现在不是说这个时候星矢，我们必须尽快通过天蝎宫！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10072] =        ---剧情12宫天蝎宫_剧情12宫天蝎宫
{
     delay = 5000,
     [1] = {
                  txt = _t"既然到了这里，就别想着要离开！",
                  name = _t"米罗",
                  img = "res\\portrait\\黄金圣斗士天蝎座米罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"那个人不是天蝎座的米罗吗？",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"你们唯一的出路就是死亡！",
                  name = _t"米罗",
                  img = "res\\portrait\\黄金圣斗士天蝎座米罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10087] =        ---剧情12宫天蝎宫_剧情12宫天蝎宫
{
     delay = 5000,
     [1] = {
                  txt = _t"只有这种实力居然斗胆要闯我天蝎宫！简直就是不自量力！",
                  name = _t"米罗",
                  img = "res\\portrait\\黄金圣斗士天蝎座米罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"还有别的小宇宙存在！？看来你们还有其他的同伴啊！应该就是卡妙的弟子冰河吧！",
                  name = _t"米罗",
                  img = "res\\portrait\\黄金圣斗士天蝎座米罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"冰……河，冰河已经重新站起来了吗……",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10098] =        ---剧情12宫天蝎宫_剧情12宫天蝎宫
{
     delay = 5000,
     [1] = {
                  txt = _t"身体还是不能自由的行动啊，但是星矢和紫龙的小宇宙越来越虚弱了，我必须再快点，再快点！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10077] =        ---剧情12宫天蝎宫_剧情12宫天蝎宫
{
     delay = 5000,
     [1] = {
                  txt = _t"这么多守卫都被星矢和紫龙击败了，那么守卫天蝎宫的黄金圣斗士究竟是怎么样强大的存在啊！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10078] =        ---剧情12宫天蝎宫_剧情12宫天蝎宫
{
     delay = 5000,
     [1] = {
                  txt = _t"这是什么怪物？看上去像是蝎子！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10079] =        ---剧情12宫天蝎宫_剧情12宫天蝎宫
{
     delay = 5000,
     [1] = {
                  txt = _t"这些蝎子的毒针就可以轻易将我麻痹，那么天蝎宫的米罗的毒针会有怎么样的威力呢？",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10080] =        ---剧情12宫天蝎宫_剧情12宫天蝎宫
{
     delay = 5000,
     [1] = {
                  txt = _t"站住，青铜圣斗士！不用劳驾米罗大人，我半人马座的巴别就可以送你到黄泉路！",
                  name = _t"巴别",
                  img = "res\\portrait\\白银半人马.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"让开！我现在没有时间跟你做游戏！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10081] =        ---剧情12宫天蝎宫_剧情12宫天蝎宫
{
     delay = 5000,
     [1] = {
                  txt = _t"好强的冻气……但是，米罗大人的毒针一定能让你在不经意间就告别人世的……",
                  name = _t"巴别",
                  img = "res\\portrait\\白银半人马.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"又是毒针！看样子我一定要小心米罗的毒性攻击，一旦身重多次，可能就会败在他的手下。",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10082] =        ---剧情12宫天蝎宫_剧情12宫天蝎宫
{
     delay = 5000,
     [1] = {
                  txt = _t"紫龙，星矢！你们没事吧！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"冰河！你恢复了！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"冰河，卡妙费尽心思将你冰冻在天秤宫，你居然还自己跑来天蝎宫送死，根本一点也不理解你恩师的良苦用心啊！",
                  name = _t"米罗",
                  img = "res\\portrait\\黄金圣斗士天蝎座米罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"米罗，我将带上伙伴们的信念，将你彻底击败！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10084] =        ---剧情12宫天蝎宫_剧情12宫天蝎宫
{
     delay = 5000,
     [1] = {
                  txt = _t"冰河，是你们赢了！",
                  name = _t"米罗",
                  img = "res\\portrait\\黄金圣斗士天蝎座米罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"米罗，我只是抵挡了你的一次进攻而已，想要击败你，恐怕拼劲我们所有人的力量也不可能啊！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"冰河，我只是想测试你们能在这场战斗里支撑多久！最后的敌人恐怕即便是我也不能将其击败！我想凭借你们的信念或许可以战胜他！",
                  name = _t"米罗",
                  img = "res\\portrait\\黄金圣斗士天蝎座米罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"通过天蝎宫吧，青铜圣斗士们！无论何时，都不要放弃自己的信念！",
                  name = _t"米罗",
                  img = "res\\portrait\\黄金圣斗士天蝎座米罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10075] =        ---剧情12宫天蝎宫_剧情12宫天蝎宫
{
     delay = 5000,
     [1] = {
                  txt = _t"冰河……冰河……冰河",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"是谁……是谁在呼喊我……",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"我好想睡……我好想睡……但是这股温暖柔和的小宇宙是谁？",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"冰河……醒来啊……醒来啊……",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10471] =        ---剧情12宫天蝎宫_剧情12宫天蝎宫
{
     delay = 5000,
     [1] = {
                  txt = _t"瞬，这是瞬的小宇宙，瞬在召唤我，瞬！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"我的小宇宙，重新燃烧起来吧！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10480] =        ---剧情12宫天蝎宫_剧情12宫天蝎宫
{
     delay = 5000,
     [1] = {
                  txt = _t"冰河，紫龙和星矢的小宇宙越来越虚弱，快！你先赶去救他们，我休息一下马上也会赶去！",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"你没事吧瞬，好，我一定可以击败天蝎座的米罗的！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10470] =        ---剧情12宫天蝎宫_剧情12宫天蝎宫
{
     delay = 5000,
     [1] = {
                  txt = _t"冰河醒来啊冰河……",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"燃烧吧！小宇宙！",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"如此温暖……如此熟悉……究竟是谁在呼唤我……",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"冰河醒来啊冰河……",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"燃烧吧小宇宙，燃烧……",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10537] =        ---月度日常天蝎变蝎提示_月度日常天蝎
{
     delay = 5000,
     [1] = {
                  txt = _t"糟糕！变成毒蝎了，要赶紧到寒冰领域中解毒。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[430] =        ---跨服组队PK赛_阿提卡遗迹
{
     delay = 61000,
     [1] = {
                  txt = _t"^050505距离比赛正式开始还有^ff0000 5 ^050505分钟，请双方玩家通知队友，迅速入场！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[431] =        ---跨服组队PK赛_阿提卡遗迹
{
     delay = 61000,
     [1] = {
                  txt = _t"^050505距离比赛正式开始还有^ff0000 4 ^050505分钟，请双方玩家通知队友，迅速入场！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[432] =        ---跨服组队PK赛_阿提卡遗迹
{
     delay = 61000,
     [1] = {
                  txt = _t"^050505距离比赛正式开始还有^ff0000 3 ^050505分钟，请双方玩家通知队友，迅速入场！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[433] =        ---跨服组队PK赛_阿提卡遗迹
{
     delay = 61000,
     [1] = {
                  txt = _t"^050505距离比赛正式开始还有^ff0000 2 ^050505分钟，请双方玩家通知队友，迅速入场！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[434] =        ---跨服组队PK赛_阿提卡遗迹
{
     delay = 50000,
     [1] = {
                  txt = _t"^050505距离比赛正式开始还有^ff0000 1 ^050505分钟，请双方玩家通知队友，迅速入场！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[435] =        ---跨服组队PK赛_阿提卡遗迹
{
     delay = 30000,
     [1] = {
                  txt = _t"^050505第一局比赛即将开始，请双方人员做好准备！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[436] =        ---跨服组队PK赛_阿提卡遗迹
{
     delay = 11000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 30 ^050505秒后开始，请双方做好准备！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[437] =        ---跨服组队PK赛_阿提卡遗迹
{
     delay = 11000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 20 ^050505秒后开始，请双方做好准备！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[438] =        ---跨服组队PK赛_阿提卡遗迹
{
     delay = 2000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 10 ^050505秒后开始，请双方做好准备！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[439] =        ---跨服组队PK赛_阿提卡遗迹
{
     delay = 2000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 9 ^050505秒后开始，请双方做好准备！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[440] =        ---跨服组队PK赛_阿提卡遗迹
{
     delay = 2000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 8 ^050505秒后开始，请双方做好准备！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[441] =        ---跨服组队PK赛_阿提卡遗迹
{
     delay = 2000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 7 ^050505秒后开始，请双方做好准备！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[442] =        ---跨服组队PK赛_阿提卡遗迹
{
     delay = 2000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 6 ^050505秒后开始，请双方做好准备！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[443] =        ---跨服组队PK赛_阿提卡遗迹
{
     delay = 2000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 5 ^050505秒后开始，请双方做好准备！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[444] =        ---跨服组队PK赛_阿提卡遗迹
{
     delay = 2000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 4 ^050505秒后开始，请双方做好准备！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[445] =        ---跨服组队PK赛_阿提卡遗迹
{
     delay = 2000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 3 ^050505秒后开始，请双方做好准备！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[446] =        ---跨服组队PK赛_阿提卡遗迹
{
     delay = 2000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 2 ^050505秒后开始，请双方做好准备！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[447] =        ---跨服组队PK赛_阿提卡遗迹
{
     delay = 2000,
     [1] = {
                  txt = _t"^050505战斗将在^ff0000 1 ^050505秒后开始，请双方做好准备！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[448] =        ---跨服组队PK赛_阿提卡遗迹
{
     delay = 3000,
     [1] = {
                  txt = _t"^ff0000战斗开始！！！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[5925] =        ---米罗的故事_圣域
{
     delay = 3000,
     [1] = {
                  txt = _t"%s,释放你的小宇宙，试着将蝎毒与小宇宙融合。",
                  name = _t"米罗",
                  img = "res\\portrait\\黄金圣斗士天蝎座米罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10540] =        ---剧情12宫水瓶宫_剧情12宫水瓶宫
{
     delay = 5000,
     [1] = {
                  txt = _t"这个小宇宙是！紫龙！！！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"紫龙的小宇宙像是飞龙一样升上了天空！",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"紫龙（低头无语）……星矢，瞬，你们先走吧，我准备独自对抗卡妙老师。",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"冰河，我们知道了，你一定要跟上来！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10566] =        ---剧情12宫水瓶宫_剧情12宫水瓶宫
{
     delay = 5000,
     [1] = {
                  txt = _t"吾师卡妙，等着弟子吧！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10557] =        ---剧情12宫水瓶宫_剧情12宫水瓶宫
{
     delay = 5000,
     [1] = {
                  txt = _t"冰河，居然还有命跑到卡妙大人的水瓶宫来！让我巨鲸座的摩西送你到地狱去！",
                  name = _t"摩西",
                  img = "res\\portrait\\白银白鲸座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"地狱我已经去过几次了！这次应该让你也体验一番！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10558] =        ---剧情12宫水瓶宫_剧情12宫水瓶宫
{
     delay = 5000,
     [1] = {
                  txt = _t"好强……好强……的冻气……这股冻气甚至……要……超过……卡妙……大……人……这群可怕的……青铜圣斗士……",
                  name = _t"摩西",
                  img = "res\\portrait\\白银白鲸座.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10559] =        ---剧情12宫水瓶宫_剧情12宫水瓶宫
{
     delay = 5000,
     [1] = {
                  txt = _t"冰河，你还是到了水瓶宫啊！",
                  name = _t"卡妙",
                  img = "res\\portrait\\黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"卡妙老师，我冰河向您致敬，是您教导我成为圣斗士的。",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"冰河，当你们进入十二宫的时候我就隐隐感觉到这一战不可避免，虽然我极力想要保护你。不过现在看来……拿出你的全部本事吧，冰河！",
                  name = _t"卡妙",
                  img = "res\\portrait\\黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"您传授给我的全部本事，这一次我将全部展示给您。",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [5] = {
                  txt = _t"来吧冰河！我在水瓶宫教授你战斗知识也将在水瓶宫彻底冰封你！",
                  name = _t"卡妙",
                  img = "res\\portrait\\黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10567] =        ---剧情12宫水瓶宫_剧情12宫水瓶宫
{
     delay = 5000,
     [1] = {
                  txt = _t"这些风雪，仅仅是老师走过就能产生这么强的冻气吗？我要当心这些冰刺……",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10561] =        ---剧情12宫水瓶宫_剧情12宫水瓶宫
{
     delay = 5000,
     [1] = {
                  txt = _t"冰河，让我看看你离开我之后修炼的成果吧！",
                  name = _t"卡妙",
                  img = "res\\portrait\\黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"老师，我将让您见证我的成长！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10563] =        ---剧情12宫水瓶宫_剧情12宫水瓶宫
{
     delay = 5000,
     [1] = {
                  txt = _t"做得好冰河，我已经没有什么可以教你的了，你终于超越了我，我非常欣……慰……",
                  name = _t"卡妙",
                  img = "res\\portrait\\黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"现在用你的力量，去美化你……的人生吧冰河……",
                  name = _t"卡妙",
                  img = "res\\portrait\\黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"老师，是您拼劲生命才指引我达到了真正的绝对零度，我绝不会忘记您教给我的一切，卡……妙……老……师……",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10453] =        ---考验！射手的托付！_剧情12宫天秤宫
{
     delay = 4000,
     [1] = {
                  txt = _t"前面是第九宫，射手宫！艾欧罗斯守护的宫殿！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"艾欧罗斯已去世多年，这里应该没有黄金圣斗士守护，我们尽快前往下一宫吧！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"带着我只会拖累你们，你们先走，我稍微恢复一些就会跟上，千万小心，我的锁链感觉到了危险。",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10457] =        ---考验！射手的托付！_剧情12宫天秤宫
{
     delay = 4000,
     [1] = {
                  txt = _t"站住！",
                  name = _t"神秘的灵魂",
                  img = "res\\portrait\\初代天马英灵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10459] =        ---考验！射手的托付！_剧情12宫天秤宫
{
     delay = 4000,
     [1] = {
                  txt = _t"少年们！你们经受住了考验！我们可以放心的离开了……",
                  name = _t"前代天马座灵魂",
                  img = "res\\portrait\\初代天马英灵.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10462] =        ---考验！射手的托付！_剧情12宫天秤宫
{
     delay = 4000,
     [1] = {
                  txt = _t"那个是！射手座的黄金圣衣！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"听着，如果你们是守护雅典娜的真正斗士，就必须先要通过我的考验！",
                  name = _t"射手座黄金圣衣",
                  img = "res\\portrait\\黄金圣斗士射手座圣衣组合版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"雅典娜的圣斗士不仅要有力量，还有有坚定的信念！让我来看看你们能否坚持信仰！",
                  name = _t"射手座黄金圣衣",
                  img = "res\\portrait\\黄金圣斗士射手座圣衣组合版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10464] =        ---考验！射手的托付！_剧情12宫天秤宫
{
     delay = 4000,
     [1] = {
                  txt = _t"你是！射手座的黄金圣斗士！艾欧罗斯！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10465] =        ---考验！射手的托付！_剧情12宫天秤宫
{
     delay = 4000,
     [1] = {
                  txt = _t"你们做的很好！但仅凭这些还不够，你们需要变得更强！",
                  name = _t"艾欧罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座艾欧罗斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"什么？我感觉到体内的小宇宙在极速燃烧，是射手座圣衣给了我力量！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"再来试试你的拳头吧！",
                  name = _t"艾欧罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座艾欧罗斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10467] =        ---考验！射手的托付！_剧情12宫天秤宫
{
     delay = 4000,
     [1] = {
                  txt = _t"我见证到了你们的勇气和意志！终于能够放心了！",
                  name = _t"射手座黄金圣衣",
                  img = "res\\portrait\\黄金圣斗士射手座圣衣组合版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"冰河！瞬！你们终于来了！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"快看！射手座的黄金圣衣转向那面墙壁了！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10689] =        ---剧情12宫水瓶宫_剧情12宫水瓶宫
{
     delay = 15000,
     [1] = {
                  txt = _t"冰河！击碎这个小冰棺，否则你不可以休息！",
                  name = _t"卡妙老师",
                  img = "res\\portrait\\黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10687] =        ---剧情12宫水瓶宫_剧情12宫水瓶宫
{
     delay = 5000,
     [1] = {
                  txt = _t"冰河，振作起来继续打，冰河振作起来……冰河……冰河……",
                  name = _t"卡妙老师",
                  img = "res\\portrait\\黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10686] =        ---剧情12宫水瓶宫_剧情12宫水瓶宫
{
     delay = 5000,
     [1] = {
                  txt = _t"冰河，永远在我万年冰棺之中长眠吧！水瓶宫就是你的最终归宿了，为师至少亲自送你离开了人世。",
                  name = _t"卡妙老师",
                  img = "res\\portrait\\黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10688] =        ---剧情12宫水瓶宫_剧情12宫水瓶宫
{
     delay = 5000,
     [1] = {
                  txt = _t"什么，冰河的小宇宙又复苏了！？怎么可能，而且这股小宇宙的能量要比之前更强了！？",
                  name = _t"卡妙老师",
                  img = "res\\portrait\\黄金圣斗士水瓶座卡妙.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"卡妙老师是您教育我绝对不可以放弃自己的信念，绝对不能再任务没有完成的时候就倒下的！！！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[449] =        ---跨服组队PK赛_阿提卡遗迹
{
     delay = 61000,
     [1] = {
                  txt = _t"比赛三局两胜制，杀人数优先达到18的一方将获得本局胜利，获得2局胜利的队伍将获得本场比赛的最终胜利！玩家复活时，将携带7S的无敌保护状态，主动攻击其他玩家时失效！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11139] =        ---月度日常射手技能提示_月度日常射手
{
     delay = 5000,
     [1] = {
                  txt = _t"我觉得浑身充满了力量，现在可以使用“星辰凝聚”技能了。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[450] =        ---_大雪！保卫圣诞树！
{
     delay = 5000,
     [1] = {
                  txt = _t"大家做好准备，敌人很快就要出现了！",
                  name = _t"雪精灵",
                  img = "res\\portrait\\雪人蓝小丑.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[451] =        ---_大雪！保卫圣诞树！
{
     delay = 5000,
     [1] = {
                  txt = _t"大家小心，一大波敌人就要到来了！",
                  name = _t"雪精灵",
                  img = "res\\portrait\\雪人蓝小丑.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[452] =        ---_大雪！保卫圣诞树！
{
     delay = 5000,
     [1] = {
                  txt = _t"波塞冬出现了！大家顶住啊！",
                  name = _t"雪精灵",
                  img = "res\\portrait\\雪人蓝小丑.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[453] =        ---_大雪！保卫圣诞树！
{
     delay = 5000,
     [1] = {
                  txt = _t"等我长大了，我还会回来的！",
                  name = _t"波塞冬小时候",
                  img = "res\\portrait\\海皇波塞冬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[454] =        ---_大雪！保卫圣诞树！
{
     delay = 5000,
     [1] = {
                  txt = _t"哈迪斯出现了！大家顶住啊！",
                  name = _t"雪精灵",
                  img = "res\\portrait\\雪人蓝小丑.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[455] =        ---_大雪！保卫圣诞树！
{
     delay = 5000,
     [1] = {
                  txt = _t"等我长大了，我还会回来的！",
                  name = _t"哈迪斯小时候",
                  img = "res\\portrait\\Q冥王哈迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[456] =        ---_哀嚎！地狱奏鸣曲
{
     delay = 5000,
     [1] = {
                  txt = _t"当你进入这里，生死将由不得你！",
                  name = _t"天雄星艾亚哥斯",
                  img = "res\\portrait\\冥斗士天雄星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[457] =        ---_哀嚎！地狱奏鸣曲
{
     delay = 5000,
     [1] = {
                  txt = _t"是谁触发了我的法阵，让我去将他的灵魂碾碎！",
                  name = _t"天贵星米洛斯",
                  img = "res\\portrait\\冥斗士天贵星米洛斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[458] =        ---_哀嚎！地狱奏鸣曲
{
     delay = 5000,
     [1] = {
                  txt = _t"原来是你们，真是不自量力，竟敢来到这里，受死吧！",
                  name = _t"天贵星米洛斯",
                  img = "res\\portrait\\冥斗士天贵星米洛斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[459] =        ---_哀嚎！地狱奏鸣曲
{
     delay = 5000,
     [1] = {
                  txt = _t"米洛斯大人，让我去吧！我会让他们后悔来到这里的！",
                  name = _t"寒冰冥斗士",
                  img = "res\\portrait\\冥斗士冰系先锋.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[460] =        ---_哀嚎！地狱奏鸣曲
{
     delay = 5000,
     [1] = {
                  txt = _t"快去搜寻盗宝贼吧！他就躲在石堆里！",
                  name = _t"天间星卡隆",
                  img = "res\\portrait\\冥斗士天间星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[461] =        ---_哀嚎！地狱奏鸣曲
{
     delay = 5000,
     [1] = {
                  txt = _t"已经杀死了盗宝贼，去找卡隆，看他满意了没！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[462] =        ---_哀嚎！地狱奏鸣曲
{
     delay = 5000,
     [1] = {
                  txt = _t"我卡隆的奸诈是出了名了，虽然你们在帮我做事，我仍然不会手下留情的！",
                  name = _t"天间星卡隆",
                  img = "res\\portrait\\冥斗士天间星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[11452] =        ---春丽传记5_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"小心！他来了！",
                  name = _t"春丽",
                  img = "res\\portrait\\春丽.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11456] =        ---春丽传记5_庐山
{
     delay = 3000,
     [1] = {
                  txt = _t"谢谢你，希望山神可以保佑紫龙，也保佑这个小偷。",
                  name = _t"春丽",
                  img = "res\\portrait\\春丽.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11462] =        ---月度日常摩羯变身提示_月度日常摩羯
{
     delay = 5000,
     [1] = {
                  txt = _t"我似乎领悟到了圣剑的精髓，身体里似乎有力量要迸发出来……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[10595] =        ---未闻花名（六）_冥界下篇支线
{
     delay = 3000,
     [1] = {
                  txt = _t"哈哈哈哈，你说得没错，可怜的人。",
                  name = _t"血池引诱者",
                  img = "res\\portrait\\默认.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10696] =        ---淘金者哀歌（五）_冥界下篇支线
{
     delay = 3000,
     [1] = {
                  txt = _t"陶罐并没有被修好。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"请等一等，好心的人。",
                  name = _t"寇德莉亚",
                  img = "res\\portrait\\希腊平民少女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[10608] =        ---淘金者哀歌（七）_冥界下篇支线
{
     delay = 3000,
     [1] = {
                  txt = _t"哈哈哈，放弃吧！她们是不会离开我的！",
                  name = _t"贪婪",
                  img = "res\\portrait\\半身巨人.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10943] =        ---金牛之魂（三）_冥界下篇支线
{
     delay = 3000,
     [1] = {
                  txt = _t"就是这里！在这里能看到金牛座！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10947] =        ---巨蟹之魂（三）_冥界下篇支线
{
     delay = 3000,
     [1] = {
                  txt = _t"就是这里了！前方的天空，巨蟹座的星光正在闪烁！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10951] =        ---天蝎之魂（三）_冥界下篇支线
{
     delay = 3000,
     [1] = {
                  txt = _t"就是这里了，天蝎座在前方闪烁！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10954] =        ---叛家者（一）_冥界下篇支线
{
     delay = 3000,
     [1] = {
                  txt = _t"是谁……我正在想一件事情，很重要的事情。",
                  name = _t"加隆",
                  img = "res\\portrait\\加隆便装1.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"加隆？！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[10974] =        ---叛神者（一）_冥界下篇支线
{
     delay = 3000,
     [1] = {
                  txt = _t"我就是犹大厅的罪裁人！",
                  name = _t"撒加",
                  img = "res\\portrait\\黄金圣斗士双子座撒加冥衣版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"撒加？！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11535] =        ---梦游者（一）_冥界
{
     delay = 1000,
     [1] = {
                  txt = _t"捉住这个可疑人物！",
                  name = _t"黑风追杀者",
                  img = "res\\portrait\\冥界杂兵远程女.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11537] =        ---梦游者（二）_冥界
{
     delay = 1000,
     [1] = {
                  txt = _t"捉住这个可疑人物！",
                  name = _t"审判厅追杀者",
                  img = "res\\portrait\\冥斗士杂兵远程男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11539] =        ---梦游者（三）_冥界
{
     delay = 1000,
     [1] = {
                  txt = _t"捉住这个可疑人物！",
                  name = _t"冥河追杀者",
                  img = "res\\portrait\\冥斗士大镰刀男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11534] =        ---替身_冥界
{
     delay = 1000,
     [1] = {
                  txt = _t"……他在干什么？在往河水里丢硬币？这是怎么回事？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11413] =        ---尤利缇斯的生活（六）_冥界
{
     delay = 1000,
     [1] = {
                  txt = _t"那个人是……希尔汗！遗忘之路的念力战士！他怎么在这里？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[11418] =        ---这就是一生（零）_冥界
{
     delay = 1000,
     [1] = {
                  txt = _t"这里……有一股不寻常的小宇宙波动。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11433] =        ---这就是一生（二）_冥界
{
     delay = 1000,
     [1] = {
                  txt = _t"哦，那里就是刚才的老人。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11482] =        ---这就是一生（五）_冥界
{
     delay = 1000,
     [1] = {
                  txt = _t"糟糕，有数道非常强大的冥斗士小宇宙正在冲向这里！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [2] = {
                  txt = _t"快走！这里危险！",
                  name = _t"卡斯托尔",
                  img = "res\\portrait\\遗忘之村村长.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[10596] =        ---未闻花名（七）_冥界下篇支线
{
     delay = 3000,
     [1] = {
                  txt = _t"卡西欧士，你忘了我的话了吗？",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\莎尔娜.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11399] =        ---尤利缇斯的生活（二）_冥界
{
     delay = 1000,
     [1] = {
                  txt = _t"（你默默拨动了琴弦，弦乐之华的旋律飘荡在空中……）",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [2] = {
                  txt = _t"啊……这支曲子我再听一千年也不会厌倦的。",
                  name = _t"尤利缇斯",
                  img = "res\\portrait\\尤丽缇斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[11206] =        ---这就是一生（一）_冥界
{
     delay = 1000,
     [1] = {
                  txt = _t"……奇怪的老人。等等，另一个小宇宙出现了。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [2] = {
                  txt = _t"出了什么事？我感受到了小宇宙的波动！",
                  name = _t"童虎",
                  img = "res\\portrait\\黄金圣斗士天秤座童虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[463] =        ---_冥蝶巢穴
{
     delay = 30000,
     [1] = {
                  txt = _t"    这些妖异的花似乎在孵化着邪恶的存在，趁孵化期间毫无危险的消灭它们还是等待其孵化完毕？不过危险与机遇并存，具体怎么选择就看你们的！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[464] =        ---_冥蝶巢穴
{
     delay = 5000,
     [1] = {
                  txt = _t"出来吧孩儿们！给这些可恶的虫子点厉害瞧瞧。",
                  name = _t"地妖星",
                  img = "res\\portrait\\冥斗士地妖星缪.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[465] =        ---_冥蝶巢穴
{
     delay = 10000,
     [1] = {
                  txt = _t"哦！这是什么鬼地方，要买东西趁早，我还要赶着回去呢。",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[466] =        ---_军团基地春节活动
{
     delay = 8000,
     [1] = {
                  txt = _t"冥界势力已经开始入侵军团基地了！",
                  name = _t"雅典娜",
                  img = "res\\portrait\\雅典娜神圣衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[467] =        ---_军团基地春节活动
{
     delay = 8000,
     [1] = {
                  txt = _t"天猛星拉达曼提斯在中路出现了！",
                  name = _t"撒加",
                  img = "res\\portrait\\黄金圣斗士双子座撒加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[468] =        ---_军团基地春节活动
{
     delay = 8000,
     [1] = {
                  txt = _t"天雄星艾亚哥斯在左路出现了！",
                  name = _t"沙加",
                  img = "res\\portrait\\黄金圣斗士处女座沙加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[469] =        ---_军团基地春节活动
{
     delay = 8000,
     [1] = {
                  txt = _t"天贵星米诺斯在右路出现了！",
                  name = _t"童虎",
                  img = "res\\portrait\\天秤座童虎.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[470] =        ---_军团基地春节活动
{
     delay = 8000,
     [1] = {
                  txt = _t"少年们！与我的黄金圣斗士一起保卫大地吧！",
                  name = _t"雅典娜",
                  img = "res\\portrait\\雅典娜神圣衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[471] =        ---_军团基地春节活动
{
     delay = 8000,
     [1] = {
                  txt = _t"我拉达曼提斯绝不会就此罢休的……",
                  name = _t"拉达曼提斯",
                  img = "res\\portrait\\冥斗士天猛星拉大曼迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[472] =        ---_军团基地春节活动
{
     delay = 8000,
     [1] = {
                  txt = _t"我艾亚哥斯还会再回来的……",
                  name = _t"艾亚哥斯",
                  img = "res\\portrait\\冥斗士天雄星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[473] =        ---_军团基地春节活动
{
     delay = 8000,
     [1] = {
                  txt = _t"下一次，我米诺斯会将你们全都杀死……",
                  name = _t"米诺斯",
                  img = "res\\portrait\\冥斗士天贵星米洛斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11069] =        ---_剧情12宫摩羯宫
{
     delay = 4000,
     [1] = {
                  txt = _t"太阳下山了！火钟上只剩三个火焰了！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"前面不远就是摩羯宫，大家努力！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"好不容易来到了这里！",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"就是因为集合了众人的力量才来到这里，继续前进吧！",
                  name = _t"冰河",
                  img = "res\\portrait\\青铜圣斗士冰河.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11447] =        ---_剧情12宫摩羯宫
{
     delay = 4000,
     [1] = {
                  txt = _t"看起来摩羯宫没有黄金圣斗士守护，大家快冲过去！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11077] =        ---_剧情12宫摩羯宫
{
     delay = 4000,
     [1] = {
                  txt = _t"原来是几只蚂蚁闯入了摩羯宫！",
                  name = _t"修罗",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"紫龙！！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"大家先走，由我紫龙来拦住修罗！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [4] = {
                  txt = _t"小子，你会后悔的！！",
                  name = _t"修罗",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[474] =        ---_剧情12宫摩羯宫
{
     delay = 4000,
     [1] = {
                  txt = _t"什么？竟然能毁了我的一柄圣剑，难以饶恕！",
                  name = _t"修罗",
                  img = "res\\portrait\\黄金圣斗士摩羯座修罗.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11546] =        ---_剧情12宫双鱼宫
{
     delay = 4000,
     [1] = {
                  txt = _t"前方就是黄金十二宫的最后一宫——双鱼宫，时间不多了，一定要尽快通过。",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"我的锁链有所警觉，路上这些玫瑰看上去暗藏着危险。",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11548] =        ---_剧情12宫双鱼宫
{
     delay = 4000,
     [1] = {
                  txt = _t"丑陋的青铜圣斗士，准备死在玫瑰的毒刺下吧！",
                  name = _t"双鱼宫守卫",
                  img = "res\\portrait\\双鱼守护者男.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11551] =        ---_剧情12宫双鱼宫
{
     delay = 4000,
     [1] = {
                  txt = _t"区区的青铜圣斗士，竟然能来到这里。",
                  name = _t"阿布罗狄",
                  img = "res\\portrait\\黄金圣斗士双鱼座阿布罗狄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"你杀了我师父仙王座的戴达罗斯，今天我会杀死你为他报仇。",
                  name = _t"瞬",
                  img = "res\\portrait\\青铜圣斗士瞬.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"哼！妄想报仇，只会落得死无葬身之地。",
                  name = _t"阿布罗狄",
                  img = "res\\portrait\\黄金圣斗士双鱼座阿布罗狄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11555] =        ---_剧情12宫双鱼宫
{
     delay = 4000,
     [1] = {
                  txt = _t"糟糕，星矢吸入了大量玫瑰毒气，已经完全失去意识了。",
                  name = _t"魔铃",
                  img = "res\\portrait\\魔铃.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11556] =        ---_剧情12宫双鱼宫
{
     delay = 4000,
     [1] = {
                  txt = _t"希望星矢戴上我的面具后能苏醒过来，全靠你了，星矢。",
                  name = _t"魔铃",
                  img = "res\\portrait\\魔铃.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11558] =        ---_剧情12宫双鱼宫
{
     delay = 4000,
     [1] = {
                  txt = _t"是魔铃救了我，我不会让你失望的，我这就赶去见教皇。",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11559] =        ---_剧情12宫双鱼宫
{
     delay = 4000,
     [1] = {
                  txt = _t"星矢，你终于来到这里了，睁开你的双眼看看我是谁吧！",
                  name = _t"教皇",
                  img = "res\\portrait\\教皇.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"什么，教皇的真面目竟然是双子座的黄金圣斗士！",
                  name = _t"星矢",
                  img = "res\\portrait\\青铜圣斗士星矢.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"受死吧！星矢！",
                  name = _t"撒加",
                  img = "res\\portrait\\黄金圣斗士双子座撒加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11561] =        ---_剧情12宫双鱼宫
{
     delay = 4000,
     [1] = {
                  txt = _t"屡次入侵我意识的人终于出现了吗？凤凰座的一辉！",
                  name = _t"撒加",
                  img = "res\\portrait\\黄金圣斗士双子座撒加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"没错，我绝不会让你再伤害星矢！",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11562] =        ---_剧情12宫双鱼宫
{
     delay = 4000,
     [1] = {
                  txt = _t"可恶啊！谁也别想拿到雅典娜的盾牌！",
                  name = _t"撒加",
                  img = "res\\portrait\\黄金圣斗士双子座撒加.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[475] =        ---_剧情12宫摩羯宫
{
     delay = 4000,
     [1] = {
                  txt = _t"同归于尽吧！庐山亢龙霸！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[11822] =        ---爱在元宵，灯谜_情人元宵节活动
{
     delay = 3000,
     [1] = {
                  txt = _t"恭喜你，猜对了~~",
                  name = _t"春丽",
                  img = "res\\portrait\\春丽.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[476] =        ---_月度活动双鱼
{
     delay = 5000,
     [1] = {
                  txt = _t"这里的玫瑰已经被天魔星的魔鬼花侵蚀了，尽快清除变异中的玫瑰，防止它变成魔鬼花！",
                  name = _t"阿布罗狄",
                  img = "res\\portrait\\黄金圣斗士双鱼座阿布罗狄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[477] =        ---_月度活动双鱼
{
     delay = 5000,
     [1] = {
                  txt = _t"我的魔鬼花！可恶！我要你们为此付出代价！",
                  name = _t"奎因",
                  img = "res\\portrait\\冥斗士天魔星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[11859] =        ---变冥蝶提示_月度活动双鱼
{
     delay = 4000,
     [1] = {
                  txt = _t"吸入了过量的魔鬼花粉会变成冥蝶，快到白玫瑰附近解毒！",
                  name = _t"阿布罗狄",
                  img = "res\\portrait\\黄金圣斗士双鱼座阿布罗狄.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[478] =        ---_月度活动白羊
{
     delay = 5000,
     [1] = {
                  txt = _t"想接受穆先生的试炼，首先得过了我贵鬼这一关！",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[479] =        ---_月度活动白羊
{
     delay = 5000,
     [1] = {
                  txt = _t"打的我好疼，穆先生，你要帮我好好处罚他们！",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12109] =        ---清明！艾德之墓_清明节任务链
{
     delay = 4000,
     [1] = {
                  txt = _t"%s，我的老友，感谢你能来看我！",
                  name = _t"艾德",
                  img = "res\\portrait\\新艾德半透.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12111] =        ---清明！艾德之墓_清明节任务链
{
     delay = 4000,
     [1] = {
                  txt = _t"虽然我没能成为圣斗士，但是我的灵魂依然在守护着女神、守护着大地……",
                  name = _t"艾德",
                  img = "res\\portrait\\新艾德半透.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12113] =        ---清明！卡西欧士的心愿_清明节任务链
{
     delay = 4000,
     [1] = {
                  txt = _t"是你啊！%s，真没想到我的敌人也会来看我。",
                  name = _t"卡西欧士",
                  img = "res\\portrait\\卡西欧士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12115] =        ---清明！卡西欧士的心愿_清明节任务链
{
     delay = 4000,
     [1] = {
                  txt = _t"请帮我转告莎尔娜小姐，无论发生什么事都不要害怕，我会……永远守护着她……",
                  name = _t"卡西欧士",
                  img = "res\\portrait\\卡西欧士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12118] =        ---清明！艾欧罗斯的意志_清明节任务链
{
     delay = 4000,
     [1] = {
                  txt = _t"居然还有人来看我这个所谓的叛徒，真实令人惊奇啊。",
                  name = _t"艾欧罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座艾欧罗斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12120] =        ---清明！艾欧罗斯的意志_清明节任务链
{
     delay = 4000,
     [1] = {
                  txt = _t"勇敢正义的少年啊，有你们守护在雅典娜身边，我就放心了……",
                  name = _t"艾欧罗斯",
                  img = "res\\portrait\\黄金圣斗士射手座艾欧罗斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12122] =        ---清明！祭拜史昂_清明节任务链
{
     delay = 4000,
     [1] = {
                  txt = _t"很久没人来过了，我以为我早已被这个世界所遗忘，也遗忘了这个世界……",
                  name = _t"史昂",
                  img = "res\\portrait\\白羊座史昂灵魂状态.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12124] =        ---清明！祭拜史昂_清明节任务链
{
     delay = 4000,
     [1] = {
                  txt = _t"再次听到战争的号角真好！记住，永远不要掉以轻心，邪恶必将卷土重来，但正义也一定会战胜邪恶！",
                  name = _t"史昂",
                  img = "res\\portrait\\白羊座史昂灵魂状态.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[12150] =        ---拉达曼迪斯05_环任务
{
     delay = 5000,
     [1] = {
                  txt = _t"拉达曼迪斯不要再浪费时间了，快去完成我交给你的使命！！",
                  name = _t"冥王哈迪斯",
                  img = "res\\portrait\\冥王哈迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [2] = {
                  txt = _t"遵命，吾伟大的王！",
                  name = _t"拉达曼迪斯",
                  img = "res\\portrait\\冥斗士天猛星拉大曼迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 1000,
           },
     [3] = {
                  txt = _t"雅典娜的圣斗士今天我就饶了你，反正再过不久整个大地就将陷落，你也只不过多活一段时间。",
                  name = _t"拉达曼迪斯",
                  img = "res\\portrait\\冥斗士天猛星拉大曼迪斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[480] =        ---_儿童节战场
{
     delay = 5000,
     [1] = {
                  txt = _t"战斗将在60秒后开启！",
                  name = _t"温柔的大丑",
                  img = "res\\portrait\\雪人蓝小丑.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[481] =        ---_儿童节战场
{
     delay = 5000,
     [1] = {
                  txt = _t"战斗将在30秒后开启！",
                  name = _t"温柔的大丑",
                  img = "res\\portrait\\雪人蓝小丑.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[482] =        ---_儿童节战场
{
     delay = 5000,
     [1] = {
                  txt = _t"战斗将在10秒后开启！",
                  name = _t"温柔的大丑",
                  img = "res\\portrait\\雪人蓝小丑.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[483] =        ---_儿童节战场
{
     delay = 5000,
     [1] = {
                  txt = _t"缩小世界的战斗开始啦！",
                  name = _t"温柔的大丑",
                  img = "res\\portrait\\雪人蓝小丑.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[484] =        ---_儿童节战场
{
     delay = 5000,
     [1] = {
                  txt = _t"战斗将在60秒后结束！",
                  name = _t"温柔的大丑",
                  img = "res\\portrait\\雪人蓝小丑.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[485] =        ---_儿童节战场
{
     delay = 5000,
     [1] = {
                  txt = _t"战斗将在30秒后结束！",
                  name = _t"温柔的大丑",
                  img = "res\\portrait\\雪人蓝小丑.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[486] =        ---_
{
     delay = 5000,
     [1] = {
                  txt = _t"只有摧毁敌方堡垒，才能获得胜利！",
                  name = _t"温柔的大丑",
                  img = "res\\portrait\\雪人蓝小丑.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[487] =        ---_
{
     delay = 5000,
     [1] = {
                  txt = _t"击杀敌方士兵或摧毁防御塔将获得赏金，每10层赏金可以提升一次技能！",
                  name = _t"温柔的大丑",
                  img = "res\\portrait\\雪人蓝小丑.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[488] =        ---_熔岩战场
{
     delay = 10000,
     [1] = {
                  txt = _t"抢旗并且带回到本方占领岛屿！这就是你所需要注意的全部问题。",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12254] =        ---闪耀！天马座的流星_群星之地
{
     delay = 1000,
     [1] = {
                  txt = _t"星矢！死吧！",
                  name = _t"卡西欧士",
                  img = "res\\portrait\\卡西欧士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [2] = {
                  txt = _t"（圣衣争夺战已经开始了？）",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12256] =        ---蛇之杀气_群星之地
{
     delay = 2000,
     [1] = {
                  txt = _t"大家准备作战！不能让那个异乡人拿走属于希腊的圣衣！",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\莎尔娜.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [2] = {
                  txt = _t"（看来他们果然要行动了……先打听一下吧）",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[12184] =        ---疯狂的妖花_群星之地
{
     delay = 2000,
     [1] = {
                  txt = _t"卡西欧士！你这个没用的废物，你留在这里继续修炼，别再让我丢脸了！",
                  name = _t"莎尔娜",
                  img = "res\\portrait\\莎尔娜.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [2] = {
                  txt = _t"是，是……(可恶的星矢，居然让莎尔娜大人对我如此不满……）",
                  name = _t"卡西欧士",
                  img = "res\\portrait\\卡西欧士.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [3] = {
                  txt = _t"（还是赶紧回去通报一下吧……）",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12270] =        ---逃亡_群星之地
{
     delay = 2000,
     [1] = {
                  txt = _t"莎尔娜跟星矢在对峙，太晚了吗？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12277] =        ---远古圣坛_群星之地
{
     delay = 1000,
     [1] = {
                  txt = _t"果然有冥兵！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12279] =        ---逝者的光芒_群星之地
{
     delay = 2000,
     [1] = {
                  txt = _t"那个灵魂……小宇宙的痕迹就是他的吗？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12289] =        ---幻象_群星之地
{
     delay = 2000,
     [1] = {
                  txt = _t"……这是什么地方？我怎么来了这里？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [2] = {
                  txt = _t"这里就是你灵魂安息的地方。",
                  name = _t"金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座黑脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [3] = {
                  txt = _t"你，你是什么人？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12302] =        ---光芒的指引_圣域
{
     delay = 2000,
     [1] = {
                  txt = _t"往这里看，往这里看。",
                  name = _t"宁芙",
                  img = "res\\portrait\\海斗士美人鱼鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [2] = {
                  txt = _t"这是……宁芙大人？您怎么在这里？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12304] =        ---向圣域前进_圣域
{
     delay = 2000,
     [1] = {
                  txt = _t"陌生人，慢一点，我需要您的帮助。",
                  name = _t"黑衣少女",
                  img = "res\\portrait\\潘多拉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [2] = {
                  txt = _t"您是……好吧，我应该帮助别人（奇怪，为甚么会觉得难以拒绝？）。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [3] = {
                  txt = _t"太谢谢了，我就知道您是一位好心人。",
                  name = _t"黑衣少女",
                  img = "res\\portrait\\潘多拉.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12306] =        ---雅典娜之城_圣域
{
     delay = 2000,
     [1] = {
                  txt = _t"这里……果然是光辉的伟大城市！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [2] = {
                  txt = _t"干劲要足一点！注意感受小宇宙！",
                  name = _t"艾欧里亚",
                  img = "res\\portrait\\黄金圣斗士狮子座艾欧里亚.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [3] = {
                  txt = _t"那位是……他的小宇宙让我感受到正义，或许可以问问他。",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12274] =        ---异变！圣战之墙_群星之地
{
     delay = 2000,
     [1] = {
                  txt = _t"太……太可怕了！墓地出了大事！",
                  name = _t"圣斗士学员",
                  img = "res\\portrait\\圣斗士女学员.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 2000,
           },
     [2] = {
                  txt = _t"（出了大事？过去看看）",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[939] =        ---神谕_小黑屋
{
     delay = 4000,
     [1] = {
                  txt = _t"别太匆忙哦，不止五个星座的灵魂在等待你呢，嘿嘿。",
                  name = _t"神秘的声音",
                  img = "res\\portrait\\海将军海龙鳞衣人形版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[489] =        ---_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"别以为穿上了那件可笑的圣衣就妄想能够战胜我！",
                  name = _t"双子座",
                  img = "res\\portrait\\黄金圣斗士双子座撒加黑发披风.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"什……么？你竟然领悟了新的招数？",
                  name = _t"双子座",
                  img = "res\\portrait\\黄金圣斗士双子座撒加黑发披风.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [3] = {
                  txt = _t"没错！我一定会打败你！燃烧吧！小宇宙！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[12314] =        ---双子幻象喊话1_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"哈哈哈！没人可以从这里走出去！",
                  name = _t"黑发金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12317] =        ---双子幻象喊话2_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"绝望吧！不要再做徒劳无益的事情了！",
                  name = _t"黑发金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12318] =        ---双子幻象喊话3_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"你终将葬身于此！",
                  name = _t"黑发金色幻象",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12319] =        ---玩家幻象喊话_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"听着，你并不存在，你只是我内心罪恶的幻象，只有消灭你我才能走出这里！",
                  name = _t"你的幻象",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12322] =        ---黄金圣斗士幻象喊话_观星楼异次元空间
{
     delay = 4000,
     [1] = {
                  txt = _t"你擅闯观星楼，让圣衣蒙羞，你要为你的罪孽付出代价！死吧！",
                  name = _t"双子座",
                  img = "res\\portrait\\黄金圣斗士双子座撒加黑发披风.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[490] =        ---冥王之怒3阶段_服务器事件-冥王之怒
{
     delay = 6000,
     [1] = {
                  txt = _t"死神和睡神已经准备迎战女神的圣斗士了！",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉狮子版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"睡神和死神是双胞胎，只有他们都处于濒死状态才能真正死亡。",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉狮子版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[491] =        ---冥王之怒3阶段_服务器事件-冥王之怒
{
     delay = 6000,
     [1] = {
                  txt = _t"根本没打算和你们在这里浪费时间，就让你们见识下神的力量！",
                  name = _t"睡神",
                  img = "res\\portrait\\冥斗士睡神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"就算是神，也别想阻挡我！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[492] =        ---冥王之怒3阶段_服务器事件-冥王之怒
{
     delay = 6000,
     [1] = {
                  txt = _t"原谅我，哈迪斯大人，我不得不让这片净土染上这些凡人的鲜血了！",
                  name = _t"睡神",
                  img = "res\\portrait\\冥斗士睡神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[493] =        ---冥王之怒3阶段_服务器事件-冥王之怒
{
     delay = 6000,
     [1] = {
                  txt = _t"现在，我要让你们明白，触怒神明将会招致什么样的下场！",
                  name = _t"死神",
                  img = "res\\portrait\\死神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[494] =        ---冥王之怒3阶段_服务器事件-冥王之怒
{
     delay = 6000,
     [1] = {
                  txt = _t"不可饶恕，竟然弄伤我这神的身体，我要将你们粉身碎骨！",
                  name = _t"死神",
                  img = "res\\portrait\\死神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[495] =        ---冥王之怒3阶段_服务器事件-冥王之怒
{
     delay = 6000,
     [1] = {
                  txt = _t"不可能，身为神的我居然会败给人类……",
                  name = _t"死神",
                  img = "res\\portrait\\死神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
     [2] = {
                  txt = _t"怎么可能，只不过是一群凡人……",
                  name = _t"睡神",
                  img = "res\\portrait\\冥斗士睡神.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 60000,
           },
     [3] = {
                  txt = _t"从没见过这么差劲的神……",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogAcceptIdTask[12611] =        ---冥王之怒3阶段_服务器事件-冥王之怒
{
     delay = 6000,
     [1] = {
                  txt = _t"只有远离睡神殿，才能在无尽噩梦中醒来。",
                  name = _t"一辉",
                  img = "res\\portrait\\青铜圣斗士一辉狮子版.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[496] =        ---飞行战场_飞行战场
{
     delay = 10000,
     [1] = {
                  txt = _t"请你飞过熔岩在敌人基地附近夺回本方战旗并且带回基地，那么你们离着战役的胜利就又进了一步！",
                  name = _t"贵鬼",
                  img = "res\\portrait\\贵鬼.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[497] =        ---逆流！亚特兰蒂斯_风暴亚特兰蒂斯
{
     delay = 5000,
     [1] = {
                  txt = _t"哎呀！运气不太好啊，找到的是假的冥界之锤，小心点！",
                  name = _t"狄蒂丝",
                  img = "res\\portrait\\海斗士美人鱼鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[498] =        ---逆流！亚特兰蒂斯_风暴亚特兰蒂斯
{
     delay = 6000,
     [1] = {
                  txt = _t"没想到，你们竟然找到了真的冥界之锤，不过你们也将召唤天异星大人，接受他的愤怒之剑吧！",
                  name = _t"狄蒂丝",
                  img = "res\\portrait\\海斗士美人鱼鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[499] =        ---逆流！亚特兰蒂斯_风暴亚特兰蒂斯
{
     delay = 5000,
     [1] = {
                  txt = _t"很遗憾，还是假的冥界之锤！你们不会再有机会了，因为深潜者会来解决你们，受死吧……",
                  name = _t"狄蒂丝",
                  img = "res\\portrait\\海斗士美人鱼鳞衣.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[500] =        ---领土战怪物入侵喊话2min_领土战
{
     delay = 20000,
     [1] = {
                  txt = _t"异界的怪物在2分钟后进攻我方水晶，请做好防御准备！",
                  name = _t"星域祭司",
                  img = "res\\portrait\\女性助祭司2.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[501] =        ---领土战怪物入侵喊话1min_领土战
{
     delay = 20000,
     [1] = {
                  txt = _t"异界的怪物在1分钟后进攻我方水晶，请做好防御准备！",
                  name = _t"星域祭司",
                  img = "res\\portrait\\女性助祭司2.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12300] =        ---落月_新手村海龙主线
{
     delay = 3000,
     [1] = {
                  txt = _t"从未把小宇宙提升到如此境界……我的心中充满了信念！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [2] = {
                  txt = _t"可是……那个恐怖的黄金幻象究竟是谁？",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [3] = {
                  txt = _t"总觉得他和我有什么小宇宙的联系，而且观星楼的事情非常离奇！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12301] =        ---落月_新手村海龙主线
{
     delay = 3000,
     [1] = {
                  txt = _t"我一定要追查下去，亲手把破坏正义的恶势力一一打倒！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [2] = {
                  txt = _t"这也是我在继承海龙血脉时就同时继承的战之宿命！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 3000,
           },
     [3] = {
                  txt = _t"燃烧吧，我的小宇宙！",
                  name = _t"$PLAYER_NAME",
                  img = "res\\portrait\\",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[502] =        ---_月度双子
{
     delay = 5000,
     [1] = {
                  txt = _t"看看吧，你们心中的正义就像他一样，只会躲在卫兵的身后！而我将会打败他，还有你们！",
                  name = _t"恶双子",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[503] =        ---_月度双子
{
     delay = 4000,
     [1] = {
                  txt = _t"看来我真是小看你们了！受死吧！",
                  name = _t"恶双子",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[504] =        ---_月度双子
{
     delay = 4000,
     [1] = {
                  txt = _t"人类心中的恶念是永远不会消失的！",
                  name = _t"恶双子",
                  img = "res\\portrait\\黄金圣斗士双子座无脸.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[505] =        ---_副本：七大洋柱
{
     delay = 8000,
     [1] = {
                  txt = _t"克修拉已经无敌了，必须借助法阵的力量才能战胜他！",
                  name = _t"紫龙",
                  img = "res\\portrait\\青铜圣斗士紫龙睁眼.tga",
                  ShowPortrait = true,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogFinishIdTask[12977] =        ---巨蟹！僵尸来了_哈迪斯城
{
     delay = 6000,
     [1] = {
                  txt = _t"表现不错嘛，你可以离开这里了！",
                  name = _t"迪斯马斯克",
                  img = "res\\portrait\\复生的黄金圣斗士巨蟹座迪斯马斯克.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[506] =        ---_军团副本1
{
     delay = 6000,
     [1] = {
                  txt = _t"卑贱的圣斗士，忏悔自己的罪行吧！出来吧，命运之碑！",
                  name = _t"路尼",
                  img = "res\\portrait\\冥斗士天英星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[507] =        ---_军团副本1
{
     delay = 6000,
     [1] = {
                  txt = _t"啊啊……居然败给这些卑贱的圣斗士……哈迪斯大人……我已经力尽……",
                  name = _t"路尼",
                  img = "res\\portrait\\冥斗士天英星.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 
DialogStrategy[508] =        ---_军团副本1
{
     delay = 3000,
     [1] = {
                  txt = _t"看俺的绝技：蛙轧死式！",
                  name = _t"塞洛斯",
                  img = "res\\portrait\\冥斗士地奇星赛洛斯.tga",
                  ShowPortrait = false,
                  repu = 0,
                  face = "",
                  afterTime = 0,
           },
} 



