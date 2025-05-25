local _t = _t 

--星座
module("STRING_TABLE")

Luck_Color = 
{
	{ name =_t"纯白",	r=255,	g=255,	b=255,},
	{ name =_t"赤红",	r=240,	g=0,	b=0,},
	{ name =_t"金黄",	r=255,	g=215,	b=0,},
	{ name =_t"草绿",	r=124,	g=252,	b=0,},
	{ name =_t"天蓝",	r=0,	g=191,	b=255,},
	{ name =_t"绛紫",	r=153,	g=50,	b=204,},
	{ name =_t"漆黑",	r=10,	g=10,	b=10,},
	{ name =_t"粉红",	r=255,	g=20,	b=147,},
	{ name =_t"海蓝",	r=30,	g=144,	b=255,},
	{ name =_t"墨绿",	r=0,	g=100,	b=0,},
	{ name =_t"亚麻",	r=250,	g=240,	b=230,},
	{ name =_t"暗金",	r=184,	g=134,	b=11,},
	{ name =_t"重褐",	r=139,	g=69,	b=19,},
	{ name =_t"银灰",	r=211,	g=211,	b=211,},
	{ name =_t"血红",	r=141,	g=15,	b=15,},
	{ name =_t"栗色",	r=101,	g=70,	b=42,},
	{ name =_t"象牙",	r=255,	g=255,	b=240,},
	{ name =_t"米黄",	r=255,	g=248,	b=220,},
	{ name =_t"灰石",	r=112,	g=128,	b=144,},
	{ name =_t"珊瑚",	r=255,	g=127,	b=80,},
}

function STRING_TABLE:GetLuckyColor(luckValue)
	local index = math.ceil(luckValue/5)
	if index <=0 and index > #Luck_Color then
		index = 1
	end
	return Luck_Color[index]
end

PANEL_WELCOME_LABLE_STAR = _t"今日%s运程"
DEVIDE_FORTURN_FAIL_MSG = _t"为好友开启星运失败"

local LOVE_FORTUNE = 0--爱情
local WEALTH_FORTUNE = 1--财运
local FRIEND_FORTUNE = 2--友情
local FIGHT_FORTUNE = 3--战斗

function STRING_TABLE:GetPersonFortuneDes(type,value,isHint)
	local desTable = Person_Fortune_Des[type]
	local txt = nil
	if desTable then
		if desTable.number and desTable.number[value] then
			txt = desTable.number
		else
			if desTable.period then
				for _,periodData in ipairs(desTable.period) do
					if periodData.min <= value and periodData.max >= value then
						txt = periodData
						break
					end 
				end
			end
			if not txt then txt = desTable.default end
		end
		if txt then
			if isHint then
				return txt.hint
			else
				return txt.notify
			end
		end
	end
end

Person_Fortune_Des =
{
	[LOVE_FORTUNE] = 
	{
		number = 
		{
			--[1] = {hint = "love1", notify = _t"%s给%s爱情",},
			--[2] = {hint = "love2", notify = _t"%s给%s爱情2",},
		},
		period = 
		{
			{min = 1,max = 300, hint = _t"双倍的付出，收效甚微。", notify = _t"%s说：%s今天在爱情上需要付出加倍的耐心甚至是讨好，但收效甚微。",},
			{min = 301,max = 500, hint = _t"爱情买卖", notify = _t"%s对%s说：爱情不是你想买，想买就能买。",},
			{min = 501,max = 750, hint = _t"地下情的危机。", notify = _t"%s悄悄的说：单身的%s面临暗恋的情愫。即使已有同伴，也会陷入地下情的危机。",},
			{min = 751,max = 1000, hint = _t"不能放弃治疗", notify = _t"%s对%s说：即使没人爱你，也不能放弃治疗。",},
			{min = 1001,max = 1500, hint = _t"无法跳出旧爱的束缚。", notify = _t"%s提醒%s：旧爱难忘，一是时间不够长，二是新欢不够好，两样都只能在未来展望，无法在回忆觅得。",},
			{min = 1501,max = 2000, hint = _t"脱离一头热的状况，对经营爱情的看法变得客观，一切在往好的方向转变。", notify = _t"%s欣慰的看到了%s逐渐脱离了一头热的状况，对经营爱情的看法变得客观，一切在往好的方向转变。",},
			{min = 2001,max = 2500, hint = _t"迷雾开始漫上来。越是不被认可、越是受到压抑的情感，越容易深陷。", notify = _t"%s表示迷雾开始漫上来。越是不被认可、越是受到压抑的情感，越容易让%s深陷其中。",},
			{min = 2501,max = 3000, hint = _t"将期待当做现实，会产生不实际的想法。", notify = _t"%s将所期待的事情当成现实，导致%s对情感会产生不实际的想法。",},
			{min = 3001,max = 3500, hint = _t"沉溺于想象中的爱", notify = _t"%s一直在苦苦等待，但却不知%s已经恋上了想象中的人。",},
			{min = 3501,max = 4000, hint = _t"精神的变化带来情感的变化", notify = _t"%s带来的变动开始出现。现实的干预开始淡去，%s在情感上的心思有变，多因精神层面的想法。",},
			{min = 4001,max = 4500, hint = _t"当未明的情感暴露在阳光下时，结果往往却不会那么糟糕", notify = _t"%s见证了%s的独角戏，之前未曾明朗的情感，今天将被曝光在太阳底下，状况的发展往往没有想象中糟糕。",},
			{min = 4501,max = 5000, hint = _t"今天在情路上要轻装上阵", notify = _t"%s说：既然%s诚心诚意的问了，我就大发慈悲的告诉你——今天需要在情路上轻装上阵。",},
			{min = 5001,max = 5500, hint = _t"耐心化解小矛盾，会使相处更平顺", notify = _t"%s说：今天的%s也许会遇到恋爱的小矛盾，耐心化解之后，相处也将变得平顺许多。",},
			{min = 5501,max = 6000, hint = _t"桃花散去，反而会出现亲切的对象", notify = _t"桃花尽数被%s吹散。%s身边看似寂寥不少，但倍感亲切的对象将会出现。",},
			{min = 6001,max = 6250, hint = _t"道路上充满了荆棘", notify = _t"%s在%s今天的爱情道路上洒满了荆棘。",},
			{min = 6251,max = 6500, hint = _t"披荆斩棘的前进", notify = _t"%s告诉%s：为了爱情，可以披荆斩棘。",},
			{min = 6501,max = 6750, hint = _t"他人的帮助使你在爱情的海洋中一帆风顺", notify = _t"%s可以帮助%s今天在追寻爱情的海洋中一帆风顺。",},
			{min = 6751,max = 7000, hint = _t"长风破浪会有时", notify = _t"%s可以帮助%s今天在追寻爱情的海洋中乘风破浪。",},
			{min = 7001,max = 7250, hint = _t"精心设计的打扮是否能带来爱情", notify = _t"%s为%s精心设计了新的打扮，爱情会迅速的到来吗？",},
			{min = 7251,max = 7500, hint = _t"借我一个怀抱", notify = _t"%s对%s说：能不能借我你的怀抱。",},
			{min = 7501,max = 7750, hint = _t"桃花朵朵开，喜欢的人在何处", notify = _t"%s说：%s的桃花开得正旺，但喜欢的人在哪里？",},
			{min = 7751,max = 8000, hint = _t"靠在你肩上", notify = _t"%s对%s说：如果你累了，可以靠在我肩上。",},
			{min = 8001,max = 8250, hint = _t"找人告白吧", notify = _t"%s悄悄的对%s说，今天去找个人告白吧。",},
			{min = 8251,max = 8500, hint = _t"爱在心头口难开", notify = _t"%s想对%s表白但不知道怎么开口。",},
			{min = 8501,max = 8750, hint = _t"确定的心思带来大胆的行动", notify = _t"%s经过了长期的挣扎，确定了%s的心思，行动变得更加大胆。",},
			{min = 8751,max = 9000, hint = _t"你是风儿我是沙", notify = _t"%s是风儿，%s是沙，缠缠绵绵到天涯。",},
			{min = 9001,max = 9250, hint = _t"创意的示爱才能带来幸福", notify = _t"%s说：有创意的示爱之举会让%s的恋人觉得幸福甜蜜。",},
			{min = 9251,max = 9500, hint = _t"把握主动接近的异性", notify = _t"%s从女神处聆听了神谕：会有异性主动接近%s，要好好把握机会喔。",},
			{min = 9501,max = 9750, hint = _t"旺盛的桃花，不要害羞的表白吧", notify = _t"%s为%s带来了旺盛的桃花运，今天向对方表白会有不错的结果喔，不要害羞的上吧！",},
			{min = 9751,max = 10000, hint = _t"我们结婚吧", notify = _t"%s对%s说：我们结婚吧！",},
		},
		default = {hint = _t"爱情运势",notify = _t"%s为%s揭开了今天的爱情运势",},
	},
	[WEALTH_FORTUNE] = 
	{
		number = 
		{
			--[1] = {hint = "wealth1",notify = _t"%s给%s爱情",},
			--[2] = {hint = "wealth2",notify = _t"%s给%s爱情",},
		},
		period = 
		{
			{min = 1,max = 500, hint = _t"一泄千里的财运", notify = _t"%s说：%s的财运一泄千里，生活非常艰难。",},
			{min = 501,max = 750, hint = _t"娱乐上的过度支出导致一文不名", notify = _t"%s说：%s今天在娱乐上的支出会导致一文不名。",},
			{min = 751,max = 1000, hint = _t"千金散尽还复来", notify = _t"%s劝说已经一文不名的%s：千金散尽还复来。",},
			{min = 1001,max = 1500, hint = _t"巨大的金钱压力要求你管好钱袋", notify = _t"%s说：%s今天金钱压力很大，请管好钱袋。",},
			{min = 1501,max = 2000, hint = _t"正财运不佳，但是也许有意外之财在等待", notify = _t"虽然今天的正财运很差，但%s告诉%s也许有意外之财在等待。",},
			{min = 2001,max = 2500, hint = _t"是借钱呢？还是借钱呢？还是借钱呢？", notify = _t"%s打算向%s借钱，你是借呢？还是借呢？还是借呢？",},
			{min = 2501,max = 3000, hint = _t"意外的支出是为了娱乐和异性埋单", notify = _t"%s预料今天%s会有意外的支出，主要是为了娱乐和异性埋单。",},
			{min = 3001,max = 3500, hint = _t"赚钱不易，要懂得控制开销", notify = _t"%s很惊讶今天的%s赚的都是辛苦钱，居然还不懂得控制开销。",},
			{min = 3501,max = 4000, hint = _t"得失皆是意外，今天就不要在意收支了", notify = _t"得失皆是意外，%s劝%s今天不要太在意收支。",},
			{min = 4001,max = 4500, hint = _t"发现财富的慧眼就在好友之中", notify = _t"%s有发现财富的慧眼，却不告诉%s，强烈鄙视+1。",},
			{min = 4501,max = 5000, hint = _t"朋友的帮助也许能带来新的收入渠道", notify = _t"通常的收入渠道今天也许会出现变数，%s也许能为%s找到新的途径。",},
			{min = 5001,max = 5500, hint = _t"如果今天能买到圣域的土地，那么能赚一大笔钱。", notify = _t"%s告诉%s：如果今天你能买到圣域的土地，那么能赚一大笔钱。",},
			{min = 5501,max = 6000, hint = _t"遵守支出计划表，有利于财富", notify = _t"%s为%s指定了一份支出计划表，如果能遵守的话，有利于财富。",},
			{min = 6001,max = 6250, hint = _t"财不露白是安全之道", notify = _t"%s嫉妒的看着已经盆满钵满的%s。",},
			{min = 6251,max = 6500, hint = _t"冷静方为生财之道", notify = _t"%s提醒财运高涨的%s，千万不要冲动。",},
			{min = 6501,max = 6750, hint = _t"只是守成会浪费今天良好的财运", notify = _t"%s很遗憾的看到，今天的财运很好，但%s决定只守住本钱。",},
			{min = 6751,max = 7000, hint = _t"无人能挡的财运", notify = _t"%s羡慕的看到%s今天无人能挡的财运。",},
			{min = 7001,max = 7500, hint = _t"今天财运的关键在于抱大腿", notify = _t"%s能否让%s抱住大腿是今天的财运的关键",},
			{min = 7501,max = 7750, hint = _t"控制住情绪就能控制住财富", notify = _t"%s耐不住%s的软磨硬泡，悄悄说：情绪的控制是今天财运的关键之处",},
			{min = 7751,max = 8000, hint = _t"疯狂的财运", notify = _t"%s对于%s疯狂的财运瞠目结舌。",},
			{min = 8001,max = 8500, hint = _t"依靠团队是今天财富的关键", notify = _t"%s耐不住%s的软磨硬泡，悄悄说：依靠团队是今天财富的关键",},
			{min = 8501,max = 9000, hint = _t"有高富帅的赞助，要抓住机会喔！", notify = _t"高富帅%s表示，有人需要赞助吗？%s快抓住机会!",},
			{min = 9001,max = 9250, hint = _t"放开一些更容易获利", notify = _t"%s建议%s可以放开自己的口袋，有时冒点风险是很容易获利的呢。",},
			{min = 9251,max = 9500, hint = _t"旺盛的正财运", notify = _t"%s为%s带来了旺盛的正财运，今天按部就班的赚钱方式更加有利。",},
			{min = 9501,max = 9750, hint = _t"神一般的财运", notify = _t"%s看着%s那神一般的财运，口水流了一地。",},
			{min = 9751,max = 10000, hint = _t"超越神的财运", notify = _t"%s无人能挡的财运比起%s那超越神的财运已经不止一提了，出门当心被金砖砸中。",},
		},
		default = {hint = _t"财运",notify = _t"%s为%s揭开了今天的财运",},
	},
	[FRIEND_FORTUNE] = 
	{
		number = 
		{
			--[1] = {hint = "friend1",notify = _t"%s给%s爱情",},
			--[2] = {hint = "friend2",notify = _t"%s给%s爱情",},
		},
		period = 
		{
			{min = 1,max = 500, hint = _t"朋友默默的陪伴着感到孤独的你", notify = _t"%s默默的陪伴着感到孤独的%s",},
			{min = 501,max = 1000, hint = _t"朋友卡", notify = _t"%s对%s说：我一直只把你当朋友的。",},
			{min = 1001,max = 1500, hint = _t"今天可能与朋友发生争吵", notify = _t"今天的%s可能与%s发生争吵。",},
			{min = 1501,max = 2000, hint = _t"争吵也会增进感情", notify = _t"%s与%s发生争吵之后，羁绊反而更加稳固了。",},
			{min = 2001,max = 2500, hint = _t"聚会是认识新朋友的途径", notify = _t"%s和%s需要一场聚会结识新的朋友。",},
			{min = 2501,max = 3000, hint = _t"聚会是认识新朋友的途径", notify = _t"%s和%s需要一场聚会结识新的朋友。",},
			{min = 3001,max = 3500, hint = _t"无谓的矜持会挡住朋友的关心", notify = _t"%s对%s表示很在乎，而后者却一直放不下矜持。",},
			{min = 3501,max = 4000, hint = _t"朋友之间不需要矜持", notify = _t"%s对%s表示很在乎，矜持什么的，早就被抛开了。",},
			{min = 4001,max = 5000, hint = _t"冷战影响双方的心情，尽快和好则海阔天空", notify = _t"%s表示与%s的冷战会影响彼此日常的心情，希望赶紧和好。",},
			{min = 4501,max = 5000, hint = _t"我和我的小伙伴们", notify = _t"%s和他的小伙伴%s需要一起去冒险。",},
			{min = 5001,max = 6000, hint = _t"以和为贵才能解决摩擦", notify = _t"%s可能会在今天的战斗中和%s发生摩擦，以和为贵则能平安度过。",},
			{min = 5501,max = 6000, hint = _t"有摩擦的友情才更牢固", notify = _t"%s与%s发生的摩擦并没有影响他们的友情。",},
			{min = 6001,max = 6500, hint = _t"你的开心是朋友们的期望", notify = _t"%s摆出了奇怪的POSE，希望%s能更开心。",},
			{min = 6501,max = 7000, hint = _t"无悔的友谊", notify = _t"%s对%s说：只要你开心，我愿意付出任何代价",},
			{min = 7001,max = 7500, hint = _t"有异性没人性", notify = _t"%s痛心的表示，%s有异性没人性。",},
			{min = 7501,max = 8000, hint = _t"最能理解你的，往往是损友", notify = _t"%s对%s说，一交损友误终生啊，要求负责！",},
			{min = 8001,max = 8250, hint = _t"与日俱增的友情", notify = _t"%s与%s的友情将会与日俱增。",},
			{min = 8251,max = 8500, hint = _t"突飞猛进的友情", notify = _t"%s与%s的友情将会突飞猛进。",},
			{min = 8501,max = 8750, hint = _t"邀请朋友一起游戏是增进友谊的最好方式", notify = _t"%s想邀请%s参加活动，但却不知道怎么开口。",},
			{min = 8751,max = 8900, hint = _t"邀请就要大声说出来", notify = _t"%s对%s说到：我们一起玩吧！！。",},
			{min = 8901,max = 9000, hint = _t"邀请就要大声说出来·改", notify = _t"%s对%s说到：我们一起玩吧！！。不然就死给你看！",},
			{min = 9001,max = 9250, hint = _t"朋友的帮助带你走出阴影", notify = _t"%s的帮助让%s走出阴影，TA表示感恩。",},
			{min = 9251,max = 9500, hint = _t"朋友一生一起走", notify = _t"%s表示%s是自己一生的朋友。",},
			{min = 9501,max = 9750, hint = _t"好朋友，一辈子", notify = _t"%s对%s说：好朋(ji-)友，一辈子。",},
			{min = 9751,max = 10000, hint = _t"今天的爱情的助力是友情，不妨多多寻求朋友的帮助", notify = _t"%s的友情是%s今天的爱情助力，朋友的帮助可以解除烦恼。",},
		},
		default = {hint = _t"友情运势",notify = _t"%s为%s揭开了今天的友情运势",},
	},
	[FIGHT_FORTUNE] = 
	{
		number = 
		{
			--[1] = {hint = "fight1",notify = _t"%s给%s爱情",},
			--[2] = {hint = "fight2",notify = _t"%s给%s爱情",},
		},
		period = 
		{
			{min = 1,max = 500, hint = _t"不要害怕队友的短板，努力战斗即可获得好的结局", notify = _t"%s说：遇到短板，可能会使%s今天的战斗变得艰难，但是结局总是好的。",},
			{min = 501,max = 1000, hint = _t"取长补短，为平衡之道", notify = _t"%s对%s说：不要害怕短板，取长即可补短。",},
			{min = 1001,max = 2000, hint = _t"疲惫也无法阻挡战斗的意愿", notify = _t"虽然很疲惫，但%s依然希望%s尽心尽力的完成无尽的战斗。",},
			{min = 1501,max = 2000, hint = _t"破釜沉舟", notify = _t"%s对%s说：拿出破釜沉舟的勇气，没有什么能阻挡你的脚步。",},
			{min = 2001,max = 2500, hint = _t"应对意外是战斗的基本素养", notify = _t"%s说：今天的战斗压力相当大，出现意料之外的事情则会让%s无所适从。",},
			{min = 2501,max = 3000, hint = _t"他强任他强", notify = _t"%s点醒了%s：敌人在强大，他强任他强。",},
			{min = 3001,max = 3500, hint = _t"偶遇能让今天的战斗更为踏实", notify = _t"今天在活动中如果能遇到%s，会让%s觉得非常踏实。",},
			{min = 3501,max = 4000, hint = _t"战斗的英姿", notify = _t"%s战斗的英姿让%s为之着迷疯狂。",},
			{min = 4001,max = 4500, hint = _t"战斗可能带来巨大的收获，只有平常心才能面对", notify = _t"%s说：今天的战斗可能带来巨大的收获，%s还能保持平常心吗？",},
			{min = 4501,max = 5000, hint = _t"稳中求胜", notify = _t"%s提醒%s步步为营才是取胜之道，今天的战斗中稳妥为上",},
			{min = 5001,max = 5500, hint = _t"善用策略会带来更好的成绩", notify = _t"%s建议%s在今天的战斗中善用策略，可以创造更理想的成绩。",},
			{min = 5501,max = 6000, hint = _t"膝盖中了一箭", notify = _t"%s听%s说到：想当年本少也是战力五百多万的选手，直到膝盖中了一箭。",},
			{min = 6001,max = 6500, hint = _t"百分之百的战意", notify = _t"见证了整个事件的%s表示：今天的%s打起架来干劲十足。",},
			{min = 6501,max = 7000, hint = _t"不走寻常路", notify = _t"%s建议%s在今天的战斗中能打破常规，力求有所突破",},
			{min = 7001,max = 7500, hint = _t"战斗的伙伴可能成为新的朋友", notify = _t"要留意今天一起战斗的伙伴，其中可能有%s为%s带来的新朋友。",},
			{min = 7501,max = 8000, hint = _t"野兽般的直觉", notify = _t"%s对%s在战斗中表现出的野兽一般的直觉而惊叹！今天如果能保持住，战斗会无往不利。",},
			{min = 8001,max = 8500, hint = _t"朋友的羁绊使你的战斗无往不利", notify = _t"%s和%s的默契越来越好，一起战斗吧。",},
			{min = 8501,max = 9000, hint = _t"偶尔的疯狂，冲吧！", notify = _t"%s对%s忠告：今天就不要考虑后果了，凭直觉战斗吧，偶尔的疯狂对理性的你会是新鲜的体验",},
			{min = 9001,max = 9500, hint = _t"武运昌隆的今天，适合尝试新的战斗", notify = _t"%s预言%s今天的战斗将格外顺利，尤其适合尝试新的战斗。",},
			{min = 9501,max = 10000, hint = _t"和更多的朋友协同作战能使战斗更轻松", notify = _t"%s如果可以与%s合作，则今天的战斗能获得很多很好的响应，可以很轻松的度过一天。",},
		},
		default = {hint = _t"武运",notify = _t"%s为%s揭开了今天的战斗运势",},
	},
}

