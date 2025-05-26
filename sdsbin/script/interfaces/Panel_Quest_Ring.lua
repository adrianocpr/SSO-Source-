Panel_Quest_Ring = ui.dialog.get("Panel_Quest_Ring")

local dlg = Panel_Quest_Ring

-- 用于记录环任务刷新次数的声望ID
local refresh_remain_repu_id = 33

-- 用于记录环任务命运刷新次数的声望ID
local dice_refresh_remain_repu_id = 82

-- 命运骰子物品id
local dice_item_id = 20568

-- 命运刷新的开启等级
local dice_refresh_enable_level = 60

-- 用于玩家手动刷新环任务的任务ID，该任务必须勾选“允许客户端手动触发”
local refresh_task_id = 1269

-- 命运刷新任务ID，该任务必须勾选“允许客户端手动触发”
local dice_refresh_task_id = 9016

local ring_config = {}

--[[环任务图片和描述配置，格式如下：
ring_config[1225] =	-- 环的起始任务ID
{
	name = "白鸟座冰河",								-- 环名称
	star = 1,											-- 星级，有效值1-5，0.5可显示半颗星
	image = "res/photobook/白鸟座冰河.dds",				-- 图片路径
	desc = "描述文字\r换行"								-- 描述文字
}
]]
ring_config[1232] =
{
	name = _t"^9400D3金牛座阿鲁迪巴",
	star = 3,
	image = "res/photobook/金牛座阿鲁迪巴.dds",
	desc = _t"　　守护金牛宫的黄金圣斗士，号称「黄金野牛」。防御力很强，而且善于躲闪。对战时直观的印象是其强大的力量，身形庞大，灵活度却没有因此受到影响。星矢的流星拳完全无法伤其分毫。而阿鲁迪巴以猛牛之角抵为名的必杀技「巨型号角」平时是以双手抱胸的姿态发出，一旦释放双臂挥出，其威力倍增。拳法也类似刀法中的「居合斩」。\r　　阿鲁迪巴的性格豪放磊落，不拘面子和大道理，只相信自己的判断。在十二宫的战斗中有意放水，令星矢等人安全通过，头上的牛角因而被斩落。在冥斗士入侵圣域一战中，对抗地暗星奈欧比时壮烈牺牲，不过临死之前也将敌人的身体完全破坏。"
}

ring_config[1199] =
{
	name = _t"^00BFFF天琴座奥路菲",
	star = 2,
	image = "res/photobook/天琴座奥路菲.dds",
	desc = _t"　　奥路菲因为冥王对自己有恩而一直为冥王弹奏乐曲，星矢等人到来的时候，奥路菲曾出手相救，但却不参与圣战。最后由于星矢和瞬的缘故，奥路菲才从知道了当时法拉奥设计的圈套使尤莉迪丝变成石头并且使奥路费明白了生命的道理，悲痛欲绝的奥路菲力战法拉奥，将其击败后，奥路菲以雅典娜的圣斗士的身份加入圣战。有死的觉悟的奥路菲在带领星矢和瞬行刺冥王哈迪斯的时候，被拉达曼迪斯偷袭重伤，而奥路菲的最大奥义打中的却是冥王的幻影，行刺行动失败，奥路菲战死在冥王神殿。 追随爱人而去，奥路菲将化作星尘，在北方的天空演奏情歌。年少时的奥路菲同尤莉迪丝坠入爱河，爱人尤莉迪丝在一次意外中死去，痛心的奥路菲为了使爱人复活，因此进入冥界祈求冥王哈迪斯使其复活，奥路菲的美妙乐曲打动了冥王哈迪斯，将其复活。"
}

ring_config[1239] =
{
	name = _t"^00BFFF黑暗天龙",
	star = 1,
	image = "res/photobook/黑暗天龙.dds",
	desc = _t"　　黑暗四天王之一，实力似乎也居四天王之冠，在死亡皇后岛被夺得凤凰星座圣衣的一辉收为部下。在协助一辉争夺射手座黄金圣衣的战斗中与因修复圣衣而大量失血的紫龙对战，初期占据上风，紫龙浑身爆血后使出庐山升龙霸才勉强取胜。垂死的黑暗天龙被紫龙等青铜圣斗士的友情所感动，临死时点了紫龙的止血真央点。\r　　黑暗天龙还有一个盲了双目的哥哥，在黑暗中作战时由于有其兄提示对方方位，可以大占上风。"
}

ring_config[1074] =
{
	name = _t"^00BFFF卡西欧士",
	star = 1,
	image = "res/photobook/普卡西欧士.dds",
	desc = _t"　　蛇夫座白银圣斗士莎尔娜的徒弟，天马圣衣争夺者。卡西欧士从小就生活在希腊圣域，接受莎尔娜刻苦严格的圣斗士训练。其人身强体壮，力大如牛，一只手可以握起星矢的身躯，应当实力不菲。可惜造化弄人，卡西欧士只是一个配角，所以作者让他在争夺圣衣的决斗中输给了天马星座星矢，并且失去了一只耳朵。\r　　青铜圣斗士勇闯黄金十二宫时，星矢在狮子宫陷入苦战。  虽然其貌不扬，但为了爱情而牺牲的可敬的人原本已经发誓效忠雅典娜的狮子宫黄金圣斗士艾欧里亚被教皇偷袭，中了幻胧魔王拳，迷乱心智，对星矢进行了攻击。唯一解除幻胧魔王拳迷幻的方法，就是敌人死在他的面前。莎尔娜听说此事，即欲赶往狮子宫。卡西欧士为了不让莎尔娜受到伤害，勇敢的代替莎尔娜去承受死亡，解救了宿敌星矢。"
}

ring_config[1225] =
{
	name = _t"^00BFFF美穗",
	star = 1,
	image = "res/photobook/普美穗.dds",
	desc = _t"　　她是一个从小就没有父母的孤儿，一直在星之子学园生活，与星矢一起长大。她很喜欢小孩子，长大后继续留在了学园中。她是一个善良、纯洁、可爱的女孩子。她与星矢之间的爱情是许多人议论的话题。首先，当星矢丛圣域训练归来时，她是多么的高兴。其次，当星矢等人经历了诸多战斗后，她毅然阻止星矢不要去圣域与教皇决战。"
}

ring_config[1187] =
{
	name = _t"^00BFFF天鹰座魔铃",
	star = 2,
	image = "res/photobook/天鹰座魔铃.dds",
	desc = _t"　　天鹰座白银圣斗士，天马座星矢的师傅。其洞察力十分出色，是一位相当优秀的女战士，性格冷静沉着。尽管同男性圣斗士相比体力有所不足，但是以高敏捷度的优势在战斗中可以更为机动灵活。一旦发现对手出现破绽，就在瞬间进行必杀攻击。\r　　一直在寻找据信活在世上的弟弟，曾被星矢误认为是自己的姐姐。在冥界篇中找回了星矢的姐姐星华。"
}

ring_config[1249] =
{
	name = _t"^9400D3白羊座穆",
	star = 3,
	image = "res/photobook/白羊座穆.dds",
	desc = _t"　　一开始便对现任教皇产生怀疑，故居住于帕尔米高原上，拒绝接受教皇的指示。穆的念力强大，亦是世上唯一拥有修补圣衣能力的人。极富正义与智慧的黄金圣斗士，并擅长修理圣衣。在十二宫之战中，帮助星矢他们领悟第七感。冥界之战中，击败最强的冥斗士之一，地妖星的巴比隆。后在突破叹息之墙时与其他黄金圣斗士一起牺牲。"
}

ring_config[1193] =
{
	name = _t"^00BFFF蛇夫座莎尔娜",
	star = 2,
	image = "res/photobook/蛇夫座莎尔娜.dds",
	desc = _t"　　与星矢争夺天马座圣衣的卡西欧士的师傅，在丑陋的面具下隐藏的是天使般美丽的容颜。十分自傲，因卡西欧士竟然败于星矢手下，而亲自动手收拾星矢。但是却在战斗中被星矢打掉面具。作为女性的圣斗士，被男人看到自己的面容是最大的耻辱，要么杀死对方，要么爱上她……因此和其他白银圣斗士一起来处死星矢，但在面对奉命来日本处死星矢收回黄金圣衣的艾欧里亚时，则最后选择了爱上星矢，并舍身为星矢挡下了艾欧里亚的重拳。参加了北欧和海界之战。在冥斗士入侵圣域的关键时刻，莎尔娜在防御作战中发挥了重要的作用。"
}

ring_config[1212] =
{
	name = _t"^00BFFF水蛇座市",
	star = 1,
	image = "res/photobook/水蛇座市.dds",
	desc = _t"　　性格比较阴沉，旁人很难理解他到底在想什么。银河战争败给冰河，擅长毒牙攻击。虽然长相难看，实际上却是个好人，是一个充满了喜感的角色。"
}

ring_config[1244] =
{
	name = _t"^9400D3天秤座童虎",
	star = 3,
	image = "res/photobook/天秤座童虎.dds",
	desc = _t"　　守护天秤座的黄金圣斗士，紫龙的师傅。受雅典娜之命来监视冥界一百零八名冥斗士而常年端坐于中国庐山五老峰，是雅典娜最信任的圣斗士，被赐予假死之术。被所有圣斗士尊称为“老师”。在冥王十二宫里指导加隆领悟第八感，后在突破叹息之墙时与其他黄金圣斗士一起牺牲。"
}

ring_config[1219] =
{
	name = _t"^00BFFF大熊座檄",
	star = 1,
	image = "res/photobook/大熊座檄.dds",  --檄
	desc = _t"　　以双手扼死巨熊来锻练的圣斗士，在银河擂台赛中败给星矢。绝招是倒挂大熊，在落基山经过非常刻苦的修行。据说他一直怀揣着成为教练的梦想，为人自信而又充满爱心，非常喜欢小孩子。"
}

ring_config[1205] =
{
	name = _t"^00BFFF独角兽座邪武",
	star = 1,
	image = "res/photobook/独角兽座邪武.png", --邪武
	desc = _t"　　也是为银河战争而集结的青铜圣斗士之一，在初战中战胜蛮后，在第二场战斗中面对瞬的星云锁链无计可施而落败。之后回到阿尔及利亚再次修炼。十二宫篇中及时回到了雅典娜身边击退了进犯的杂兵们。"
}

ring_config[1068] =
{
	name = _t"^00BFFF天马座星矢",
	star = 1,
	image = "res/photobook/天马座星矢.dds",
	desc = _t"　　头号主角，天马星座。平时像个孩子，性格天真活泼。但战斗时，尤其是雅典娜遇到危难，便会不顾一切的去战斗，是其他人的精神领袖。总冲在战斗的最前边。修炼地是希腊圣域。魔玲的弟子。"
}

ring_config[1256] =
{
	name = _t"^00BFFF天龙座紫龙",
	star = 1,
	image = "res/photobook/天龙座紫龙.dds",
	desc = _t"　　天龙座的青铜圣斗士，使用“龙拳”作战，于天秤座黄金圣斗士童虎指导之下在中国庐山五老峰修行。是能让庐山大瀑布逆流的男人。\r　　性格豪爽，非常重情义，相信友情的力量，并愿为友情而死，是为了他人而牺牲生命的人。紫龙参与的战斗多为惨烈的死斗，往往要不惜性命来爆发小宇宙，最终才能战胜原本毫无胜算的强敌。"
}

ring_config[2472] =
{
	name = _t"^9400D3狮子座艾欧里亚",
	star = 3,
	image = "res/photobook/狮子座艾欧里亚.dds",
	desc = _t"　　守护狮子宫黄金圣斗士，懂得多种光速拳，被称为“黄金狮子”。射手座 艾欧罗斯的弟弟，以勇猛刚强著称，极富正义与勇气。并一心想洗去兄长的污名，被双子座撒加用“幻胧魔皇拳”所操纵，在狮子宫与星矢对战。幸有卡西欧士的牺牲，最后恢复清醒。冥界一战，一人独挡六名冥斗士，用光速拳打败地伏星拉美。最后因冥结界自己被弱化而败于冥界三巨头之一 天猛星 拉达曼迪斯手下。在冥界为了击穿叹息之墙而牺牲，为雅典娜献身。"
}

ring_config[2484] =
{
	name = _t"^00BFFF艾丝美拉达",
	star = 1,
	image = "res/photobook/普艾丝美拉达.dds",  
	desc = _t"　　美丽善良的少女，在一辉修行时，给了一辉莫大的安慰与关怀。纯洁美丽，宛如地狱中倔强盛开的鲜花。在一辉取得凤凰座圣衣的最后期限，一辉与基鲁提发生了争斗，为了保护一辉舍身受了基鲁提一拳而丧命。一辉因此舍弃了爱与正义，化身憎恨，杀死了基鲁提并取得了凤凰座的圣衣。"
}

ring_config[2500] =
{
	name = _t"^00BFFF黑暗白鸟",
	star = 1,
	image = "res/photobook/黑暗白鸟.dds",  
	desc = _t"　　黑暗四天王之一，被冰河击败，临死前用眼睛录下冰河的绝招，将眼球传送给一辉。"
}

ring_config[2495] =
{
	name = _t"^00BFFF黑暗天马",
	star = 1,
	image = "res/photobook/黑暗天马.dds",  
	desc = _t"　　黑暗四天王之一，使用黑死拳，能够隔着圣衣破坏身体，使身体表面出现黑斑，黑斑不断扩大，破坏组织器官，使身体灼烧而死。曾击败过星矢，后被瞬击败。"
}

ring_config[2505] =
{
	name = _t"^00BFFF黑暗仙女",
	star = 1,
	image = "res/photobook/黑暗仙女.dds",  
	desc = _t"　　黑暗四天王之一，像蛇一样的黑暗锁链吸取敌人的生命，仿佛有八种让人讨厌的昆虫在进行攻击，被瞬击败。"
}

ring_config[2477] =
{
	name = _t"^00BFFF基鲁提",
	star = 1,
	image = "res/photobook/普基鲁提.dds",  
	desc = _t"　　身世迷团重重的圣斗士，一辉的师父。认为一辉太过仁慈，缺少必要的憎恨。在一辉争夺凤凰座圣衣的战斗中，误杀了艾丝美拉达，因此激发了一辉内心的憎恨。最终被充满憎恨之意的一辉杀死。"
}

ring_config[2512] =
{
	name = _t"^00BFFF强戈",
	star = 1,
	image = "res/photobook/黑暗强戈.dds",  
	desc = _t"　　黑暗圣斗士的首领，妄图夺得凤凰座圣衣，但无法获得圣衣对其的认可。最后被身穿凤凰座圣衣的一辉杀死。"
}

ring_config[2466] =
{
	name = _t"^9400D3双子座撒加",
	star = 3,
	image = "res/photobook/双子座撒加.dds",
	desc = _t"　　守护双子宫的黄金圣斗士。十三年前囚禁了罪大恶极的加隆。但终于控制不住野心，刺杀了前教皇，并冒名担任教皇亚历士，拥有双重性格，一面既善良而又得人心，而另一面则充满邪恶。善良时受人像神般景仰，邪恶时又如同恶魔，是最具人性的悲剧角色。在战斗力方面，撒加同时拥有精神控制能力及物质毁灭能力。\r　　当星矢去到教廷时，才揭发他就是现任教皇。最后在雅典娜面前自杀赎罪，并得到雅典娜的宽恕。"
}

ring_config[2489] =
{
	name = _t"^9400D3处女座沙加",
	star = 3,
	image = "res/photobook/处女座沙加.dds",
	desc = _t"　　守护处女宫的黄金圣斗士，是佛祖释迦牟尼的转生，被称为“最接近神的人”。较先领悟到第八感，平日紧闭双眼累积小宇宙，爆发时的力量接近于神。位于第六宫的处女宫在沙加的守护下成为十二宫中最强的防御关卡。"
}

ring_config[2460] =
{
	name = _t"^9400D3摩羯座修罗",
	star = 3,
	image = "res/photobook/摩羯座修罗.dds",
	desc = _t"　　守护摩羯宫的黄金圣斗士，是让十三年前逃亡的艾欧罗斯濒临死亡的人。修罗的手刀拥有圣剑「Excalibur」一般的威力，无坚不摧，一掌劈下，最坚硬的天龙座的盾也裂为两段。其腿击也是相当凌厉且能对应对手的行动做出不同战法，其借力打击的「飞跃之石」还曾压制紫龙的庐山升龙霸。可以说是一位格斗感相当优秀的黄金圣斗士，身体灵活度和格斗术凌驾于其他圣斗士之上，　拥有「最忠诚的圣斗士」之称。因受教皇的蒙蔽而向其效忠，但在濒死之际终于幡然醒悟，并「化为星宿守护雅典娜」。冥王篇里，与撒加等人一起回到圣域，至死不负「忠诚」之名。"
}

ring_config[2519] =
{
	name = _t"^00BFFF凤凰座一辉",
	star = 1,
	image = "res/photobook/凤凰座一辉.dds",
	desc = _t"　　仙女座圣斗士瞬的哥哥，师从死亡皇后岛的神秘圣斗士基尔狄。最强的青铜圣斗士，而且也擅长对敌人进行精神方面的进攻。充满仇恨的男人，自称是「舍弃一切的人」，但却被沙加评价作那种「将正义压抑在内心深处的人」。性格冷酷无情，却掩不住满怀炽热，对于弟弟瞬更是有着难以掩饰的关怀。从来不说是朋友给了他希望、信任、信心和友爱，却总是在星矢等人最危险的时候赶到。"
}

ring_config[5905] =
{
	name = _t"^00BFFF白鸟座冰河",
	star = 1,
	image = "res/photobook/白鸟座冰河.dds",
	desc = _t"　　冰河曾接到来自圣域的指示，让他去银河战争现场处罚私斗的青铜圣斗士们，但却被卷入了同暗黑圣斗士们争夺黄金圣衣的战斗，期间与星矢等人结下深厚的友谊。之后，作为守护雅典娜的圣斗士同星矢等人并肩作战，捍卫大地的和平。"
}

ring_config[5911] =
{
	name = _t"^9400D3巨蟹座迪斯马斯克",
	star = 3,
	image = "res/photobook/巨蟹座迪斯马克斯.dds",
	desc = _t"　　守卫巨蟹宫的黄金圣斗士。嗜好杀戮，为了所谓的惩罚邪恶而不计正义，不惜伤害无辜。在巨蟹宫的四壁布满了他的牺牲者的面孔，其中不乏老人和孩童，以此作为胜利的炫耀。本人也因此而得名为「Death Mask」。其必杀技「积尸气冥界波」则是从食指间发出灵气，将对手魂魄送入冥界。在同紫龙的战斗中，遭到圣衣抛弃而失败身亡。冥王篇中，被冥王哈迪斯复活送去圣域执行暗杀女神的任务，再次失败后被拉达曼迪斯丢入冥界。极乐净土篇中作为黄金圣斗士参加了对叹息之壁的决死一击。"
}

ring_config[5917] =
{
	name = _t"^9400D3射手座艾欧罗斯",
	star = 3,
	image = "res/photobook/射手座艾欧罗斯.dds",
	desc = _t"　　狮子座黄金圣斗士艾欧里亚的哥哥，教皇史昂钦定的教皇继任者。其英勇仁厚的身姿为圣斗士们所尊敬。十三年前，保护险遭篡夺教皇之位的撒加加害的襁褓中的女神欲逃离圣域，在被摩羯座的修罗重伤、将女神和黄金圣衣托付给了来希腊旅行的城户光政后离开人世。死后的艾俄洛斯之英灵寄宿在黄金圣衣中，几度在星矢等人危难之时出现在他们身边，帮助他们战胜强敌。曾在射手宫的墙壁上刻下遗书「女神就交给你们了」。"
}

ring_config[5941] =
{
	name = _t"^00BFFF海皇子克修拉",
	star = 2,
	image = "res/photobook/海皇海皇子克修拉.dds",
	desc = _t"　　克修拉体内能激发七脉轮，拥有惊人的力量，同时也充满了来自古印度的神秘感。拥有黄金长矛，威力十分可观，但紫龙在失明的前一瞬看穿了他的星命点排列。被紫龙的圣剑打败的克利什纳相当富有武士精神，尊重比自己实力强大的对手，这一点十分令人钦佩。"
}

ring_config[5935] =
{
	name = _t"^9400D3海龙加隆",
	star = 2,
	image = "res/photobook/海皇海龙加隆.dds",
	desc = _t"　　撒加的孪生弟弟，也是双子座黄金圣斗士的另一人，但不为人所知。作为镇守北大西洋海之柱的海将军，七位海将军之长，欲借波塞冬名义打倒雅典娜征服整个大地，故有「连神都敢欺骗的男人」之称。自称与经常在善与恶的两种心情之间徘徊的哥哥不同，只有拥有一颗邪恶之心。海界之战后，加隆洗心革面继承了哥哥的遗志，并作为黄金圣斗士为女神而战。其实力不亚于撒加，即使在同冥界三巨头的对决中亦游刃有余。"
}

ring_config[5929] =
{
	name = _t"^9400D3水瓶座卡妙",
	star = 3,
	image = "res/photobook/水瓶座卡妙.dds",
	desc = _t"　　守护水瓶宫的黄金圣斗士，是冷傲决绝的冰之圣斗士，有「水与冰的魔法师」之称。为人既正直又拥有真正的强悍。作为白鸟座圣斗士冰河和海斗士艾尔扎克的师父，总是教诲冰河和艾尔扎克「对敌人要保持冷酷」，但是自己却没法贯彻而在十二宫与爱徒冰河的战斗中含笑而逝。"
}

ring_config[5923] =
{
	name = _t"^9400D3天蝎座米罗",
	star = 3,
	image = "res/photobook/天蝎座米罗.dds",
	desc = _t"　　守护圣域十二宫第八宫天蝎宫的圣斗士，性格最接近普通人，在圣域有“希腊的阳光”之称。他给人印象最深的就是灿烂的笑容，不论是面对多舛的命运还是强大的敌人，米罗总是用笑容来掩盖内心的痛苦和愤怒。最后，米罗与其他十一位黄金圣斗士用生命为青铜圣斗士们打开了通往极乐净土的道路。米罗对女神的忠心、对大地的热爱化作一道光芒，永远留在了天蝎座黄金圣衣上。"
}

ring_config[10549] =
{
	name = _t"^9400D3双鱼座阿布罗狄",
	star = 3,
	image = "res/photobook/双鱼座阿布罗迪.dds",
	desc = _t"　　守护十二宫最后一宫的黄金圣斗士，其美貌也是在88名圣斗士中首屈一指，有「与日月争辉的美之战士」之称。以三色玫瑰为武器进行战斗的黄金圣斗士，其中有让对方五感尽失的红玫瑰、无坚不摧的黑玫瑰及吸尽对方血液的白玫瑰，其皇家魔宫玫瑰在圣斗士的各种必杀技中堪称华丽之最。"
}

ring_config[10670] =
{
	name = _t"^00BFFF贵鬼",
	star = 1,
	image = "res/photobook/普贵鬼.dds",
	desc = _t"　　贵鬼是穆先生的徒弟。每个白羊座都会有一个助手，贵鬼就是在嘉米尔和穆先生相遇被收养的。贵鬼眼睛上方的豆点形状的眉毛是嘉米尔一族的象征。贵鬼的必杀技是念动力，以念力瞬间移动物体或人，速度可达到光速。"
}

ring_config[11448] =
{
	name = _t"^00BFFF春丽",
	star = 1,
	image = "res/photobook/普春丽.dds",
	desc = _t"　　她从小就被人遗弃在庐山，是老师（童虎）一直抚养她长大。中国的秀丽河山给予她善良的心灵与坚强的意志。她的祈祷和细心照顾一直支持着紫龙。"
}
ring_config[11628] =
{
	name = _t"^9400D3海魔女苏兰特",
	star = 3,
	image = "res/photobook/海皇海魔女苏兰特.dds",
	desc = _t"　　海皇波塞冬手下七大海斗士之一。苏兰特内心纯真，一心相信波塞冬可以洗涤世上的邪恶建立理想国。苏兰特善于使用笛声，其威力曾将阿鲁迪巴逼入绝境，在守护南大西洋支柱的战斗中，被瞬打败。"
}
ring_config[12140] =
{
	name = _t"^9400D3天猛星拉达曼迪斯",
	star = 3,
	image = "res/photobook/冥天猛星拉达曼迪斯.dds",
	desc = _t"　　号称一百零八名冥斗士中最强的“冥界三巨头”之一。故事开始时违背潘多拉的旨意擅自派遣冥斗士正规军前往圣域，此后成为星矢等人的劲敌。他不仅被冥王所信赖，同时也被手下所爱戴。在冥界战斗中被加隆的自杀式攻击击中，最终消失在冥界的天空中。"
}
ring_config[12154] =
{
	name = _t"^9400D3天贵星米诺斯",
	star = 3,
	image = "res/photobook/冥天贵星米诺斯.dds",
	desc = _t"　　冥界三巨头之一，实力与其他二人在伯仲之间。米诺斯性格沉稳，会在战局中判断出最合适的出手时机。作为最后一名被击败的三巨头，为了截住前往极乐净土的星矢等人，与冰河发生了激烈的战斗。之后踏入异次元空间，因没有神的庇护而粉身碎骨。"
}
--------------------------------------
local refresh_button = dlg:get_obj("Button_Refresh")
local dice_group = dlg:get_obj_group{
	label = "Label_DiceCount",
	icon = "Image_Dice",
}

function dlg:GetRefreshRemainCount()
	return GameApi.GetHostRepuValue(refresh_remain_repu_id)
end

function dlg:GetDiceRefreshRemainCount()
	return GameApi.GetHostRepuValue(dice_refresh_remain_repu_id)
end

function dlg:GetDiceCount()
	return GameApi.GetItemNumInPack(dice_item_id) or 0
end

function dlg:IsDiceRefreshEnabled()
	return GameApi.GetHostProp().level >= dice_refresh_enable_level
end


function dlg:UpdateRefreshCount()
	local refresh_count = self:GetRefreshRemainCount()
	local dice_enabled = self:IsDiceRefreshEnabled()
	local dice_refresh_count = self:GetDiceRefreshRemainCount()
	local dice_count = self:GetDiceCount()

	local text = ""
	local hint = ""
	if dice_enabled then
		if refresh_count > 0 then
			text = STRING_TABLE.TASK_RING_REFRESH or ""
			text = text:format(refresh_count)
			hint = STRING_TABLE.TASK_RING_REFRESH_HINT or ""
		elseif dice_refresh_count > 0 then
			text = STRING_TABLE.TASK_RING_DICE_REFRESH or ""
			text = text:format(dice_refresh_count)

			if dice_count > 0 then
				hint = STRING_TABLE.TASK_RING_DICE_REFRESH_HINT or ""
				hint = hint:format(dice_count)
			else
				hint = STRING_TABLE.TASK_RING_NO_DICE_HINT or ""
			end
		else
			text = STRING_TABLE.TASK_RING_DICE_REFRESH_COUNT_ZERO or ""
			text = text:format(dice_refresh_count)

			hint = STRING_TABLE.TASK_RING_DICE_REFRESH_COUNT_ZERO_HINT or ""
		end
	else
		if refresh_count > 0 then
			text = STRING_TABLE.TASK_RING_REFRESH or ""
			text = text:format(refresh_count)
			hint = STRING_TABLE.TASK_RING_REFRESH_HINT or ""
		else
			text = STRING_TABLE.TASK_RING_REFRESH_COUNT_ZERO or ""
			text = text:format(dice_refresh_count)

			hint = STRING_TABLE.TASK_RING_REFRESH_COUNT_ZERO_HINT or ""
		end
	end

	refresh_button:set_text(text)
	refresh_button:set_hint(hint)
	refresh_button:enable(refresh_count > 0 or (dice_enabled and dice_refresh_count > 0 and dice_count > 0))
	dice_group.objs.label:set_text(("x%d"):format(dice_count))
	dice_group:show(dice_enabled and refresh_count <= 0)
end

function dlg:Refresh()
	local refresh_count = self:GetRefreshRemainCount()
	local dice_refresh_count = self:GetDiceRefreshRemainCount()
	if refresh_count > 0 then
		GameApi.MaunallyTrigTask(refresh_task_id)
	elseif dice_refresh_count > 0 then
		GameApi.MaunallyTrigTask(dice_refresh_task_id)
	end
end

function dlg:GetImage(task_id)
	local conf = ring_config[task_id] or {}
	return conf.image or ""
end

function dlg:GetDesc(task_id)
	local conf = ring_config[task_id] or {}
	return conf.desc or ""
end

function dlg:GetName(task_id)
	local conf = ring_config[task_id] or {}
	return conf.name or ""
end

function dlg:GetStar(task_id)
	local conf = ring_config[task_id] or {}
	local star = conf.star or 1
	return star * 20
end