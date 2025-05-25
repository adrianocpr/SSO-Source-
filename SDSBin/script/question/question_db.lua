--
--[[ @i18n question ]]
local _t = require("i18n").context("question")
-------------------
--
--    有奖答题题目库
--
-------------------

QuestionDB = {}
QuestionDB[1]=
    {
         question = _t"如何切换游戏画面的”3D渲染“或者”漫画渲染“风格？",
         opt_answer = {
                 [1] = _t"在系统设置中进行切换",
                 [2] = _t"找游戏中NPC切换",
                 [3] = _t"按住ALT+G",
                 [4] = _t"只能在游戏开始时选择",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[2]=
    {
         question = _t"在游戏中如何暂时隐藏其他玩家？",
         opt_answer = {
                 [1] = _t"ALT+P",
                 [2] = _t"ALT+V",
                 [3] = _t"ALT+H",
                 [4] = _t"ALT+E",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[3]=
    {
         question = _t"游戏中默认按住哪个快捷键可以自动拾取掉落的物品？",
         opt_answer = {
                 [1] = _t"F",
                 [2] = _t"H",
                 [3] = _t"ALT",
                 [4] = _t"SHIFT+M",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[4]=
    {
         question = _t"在游戏中谁有权在特殊情况下向您索要账号和密码？ ",
         opt_answer = {
                 [1] = _t"没人有这个权限",
                 [2] = _t"其他玩家",
                 [3] = _t"在线GM",
                 [4] = _t"客服人员",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[5]=
    {
         question = _t"背包满了该如何处理？",
         opt_answer = {
                 [1] = _t"将暂时没用的物品放入仓库",
                 [2] = _t"与其他玩家交易",
                 [3] = _t"不管三七二十一全部卖店",
                 [4] = _t"全部使用掉",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[6]=
    {
         question = _t"当游戏时有明显卡顿感觉时，以下哪种是解决问题的正确方法？",
         opt_answer = {
                 [1] = _t"点击系统菜单的“防卡”按钮",
                 [2] = _t"输入上下左右ABAB",
                 [3] = _t"开着游戏等1小时",
                 [4] = _t"无视之，继续游戏",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[7]=
    {
         question = _t"在游戏中看到有关领奖的信息时应该怎么办？",
         opt_answer = {
                 [1] = _t"只相信官方发布的信息",
                 [2] = _t"直接按着信息提示的做",
                 [3] = _t"无视信息，都是浮云",
                 [4] = _t"忽悠好友先去试试",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[8]=
    {
         question = _t"如何拆分背包中的堆叠物品？",
         opt_answer = {
                 [1] = _t"ALT加鼠标拖动",
                 [2] = _t"直接用鼠标拖动",
                 [3] = _t"双击鼠标右键",
                 [4] = _t"右键点击物品选拆分",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[9]=
    {
         question = _t"如何快速找到包裹内可用魔盒分解的装备？",
         opt_answer = {
                 [1] = _t"打开魔盒分解页，包裹内闪亮的即是",
                 [2] = _t"一目十行的快速扫过装备说明",
                 [3] = _t"所有装备都可以分解",
                 [4] = _t"所有装备都无法分解",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[10]=
    {
         question = _t"在游戏中被卡死在某处该如何处理？",
         opt_answer = {
                 [1] = _t"在系统栏中使用“角色卡死”功能",
                 [2] = _t"重新登录",
                 [3] = _t"使用回城",
                 [4] = _t"向其他玩家求助",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[11]=
    {
         question = _t"如何找到城镇中的某特定NPC？",
         opt_answer = {
                 [1] = _t"打开地图界面查看NPC列表",
                 [2] = _t"询问其他NPC",
                 [3] = _t"向在线GM询问",
                 [4] = _t"四处乱逛",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[12]=
    {
         question = _t"如何在自动寻路状态下开启加速跑状态？",
         opt_answer = {
                 [1] = _t"按住“SHIFT”键",
                 [2] = _t"按住鼠标左键",
                 [3] = _t"按住鼠标右键",
                 [4] = _t"使劲晃电脑屏幕",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[13]=
    {
         question = _t"如何寻找与你等级相近的玩家并成为好友？",
         opt_answer = {
                 [1] = _t"使用“圈子”系统",
                 [2] = _t"在圣域贴小广告",
                 [3] = _t"在频道中大喊",
                 [4] = _t"见人就申请加为好友",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[14]=
    {
         question = _t"当你发现经验涨满却无法升级时，要如何升级？",
         opt_answer = {
                 [1] = _t"按C键打开面板，手动升级",
                 [2] = _t"继续游戏，等级会自动提升",
                 [3] = _t"做活动，自动提升",
                 [4] = _t"打副本，自动提升",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[15]=
    {
         question = _t"如何恢复体力槽？",
         opt_answer = {
                 [1] = _t"体力槽在不使用时会自动恢复",
                 [2] = _t"嗑药",
                 [3] = _t"爆发小宇宙",
                 [4] = _t"击杀其他玩家",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[16]=
    {
         question = _t"在游戏中如何战胜一个人无法打败的强敌？",
         opt_answer = {
                 [1] = _t"召唤好友帮助你",
                 [2] = _t"逃跑",
                 [3] = _t"嘲讽谩骂怪物",
                 [4] = _t"向GM求助",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[17]=
    {
         question = _t"星相守护在什么情况下可以使用？",
         opt_answer = {
                 [1] = _t"组队副本中",
                 [2] = _t"组队时",
                 [3] = _t"任何情况下",
                 [4] = _t"每天固定时段",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[18]=
    {
         question = _t"以下哪一条不是加入军团后的好处？",
         opt_answer = {
                 [1] = _t"勾朋结党、招摇过市",
                 [2] = _t"认识新朋友",
                 [3] = _t"与其他玩家一同游戏，挑战强敌",
                 [4] = _t"获得军团发展所带来的奖励",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[19]=
    {
         question = _t"如何跟随其他的玩家？",
         opt_answer = {
                 [1] = _t"右键该玩家头像，点击“跟随”按钮",
                 [2] = _t"紧跟在该玩家后面",
                 [3] = _t"叫该玩家准许你跟随",
                 [4] = _t"在NPC处申请跟随该玩家",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[20]=
    {
         question = _t"快速奔跑、格挡、闪避会消耗什么？",
         opt_answer = {
                 [1] = _t"体力槽",
                 [2] = _t"生命值",
                 [3] = _t"觉悟值",
                 [4] = _t"小宇宙",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[21]=
    {
         question = _t"以下哪一条不是加其他玩家成为好友后的好处？",
         opt_answer = {
                 [1] = _t"提升本身的战力",
                 [2] = _t"可以快速和其他玩家组队",
                 [3] = _t"方便与好友取得联系",
                 [4] = _t"得到好友带来的各种帮助",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[22]=
    {
         question = _t"游戏中默认按住哪个快捷键可以格挡敌人的攻击？",
         opt_answer = {
                 [1] = _t"Q",
                 [2] = _t"F",
                 [3] = _t"N",
                 [4] = _t"R",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[23]=
    {
         question = _t"普通的恢复药剂和面包在哪里可以购买到？",
         opt_answer = {
                 [1] = _t"圣域药剂师和散落于各处的面包商人",
                 [2] = _t"花钱去商城买",
                 [3] = _t"所有NPC都有卖",
                 [4] = _t"祈求别的玩家赠予",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[24]=
    {
         question = _t"默认的快捷技能栏满了怎么办？",
         opt_answer = {
                 [1] = _t"点击技能栏左侧的按钮展开第三层栏位",
                 [2] = _t"去掉技能栏上没用的技能",
                 [3] = _t"商城购买道具扩充技能栏",
                 [4] = _t"去NPC处开启新的技能栏",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[25]=
    {
         question = _t"什么样的掉落装备可以用魔盒分解？",
         opt_answer = {
                 [1] = _t"需求等级不高于自己15级的非白装",
                 [2] = _t"白装",
                 [3] = _t"无法分解",
                 [4] = _t"全部可以分解",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[26]=
    {
         question = _t"活动指引图标位于界面的哪个位置？",
         opt_answer = {
                 [1] = _t"右上角小地图边缘",
                 [2] = _t"左上角头像的边缘",
                 [3] = _t"左下角",
                 [4] = _t"右下角",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[27]=
    {
         question = _t"足够的觉悟才能升级，如何才能提高觉悟值？",
         opt_answer = {
                 [1] = _t"学习技能或升级技能",
                 [2] = _t"击杀怪物",
                 [3] = _t"做任务",
                 [4] = _t"组队副本",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[28]=
    {
         question = _t"怎样才能使用随身仓库？",
         opt_answer = {
                 [1] = _t"充值1元成为VIP，在系统栏随身服务处打开",
                 [2] = _t"升级仓库",
                 [3] = _t"找特定NPC开启",
                 [4] = _t"在官网上申请",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[29]=
    {
         question = _t"星铸圣衣可能会让圣衣有哪些变化？",
         opt_answer = {
                 [1] = _t"提升属性，获得斗魂和改变形象",
                 [2] = _t"提升耐久度和穿着舒适度",
                 [3] = _t"提升卖店价",
                 [4] = _t"提升觉悟",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[30]=
    {
         question = _t"组队后如何快速的召集队友到你的身边？",
         opt_answer = {
                 [1] = _t"在自己头像下方点击“集结队伍”按钮",
                 [2] = _t"在队伍频道里吼",
                 [3] = _t"去找队友",
                 [4] = _t"给队友发坐标",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[31]=
    {
         question = _t"关于小伙伴（休闲宠物）自动拾取功能描述正确的是?",
         opt_answer = {
                 [1] = _t"所有小伙伴都拥有自动拾取功能",
                 [2] = _t"玩家不可选择被拾取物品的品质",
                 [3] = _t"只有二阶以上的带有自动拾取功能",
                 [4] = _t"不放出宠物也能使用自动拾取功能",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[32]=
    {
         question = _t"如何设置小伙伴自动拾取物品的品质？",
         opt_answer = {
                 [1] = _t"在小伙伴界面的自动拾取配置中",
                 [2] = _t"在系统设置中",
                 [3] = _t"在战斗中不放出小伙伴",
                 [4] = _t"在化生NPC处设置",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[33]=
    {
         question = _t"每天的活跃度会在什么时候清空？",
         opt_answer = {
                 [1] = _t"上午6点",
                 [2] = _t"晚上12点",
                 [3] = _t"中午12点",
                 [4] = _t"下午2点",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[34]=
    {
         question = _t"如何将物品信息发到聊天频道中？",
         opt_answer = {
                 [1] = _t"SHIFT+点击物品图标",
                 [2] = _t"左键点击物品",
                 [3] = _t"拖拽物品到聊天栏",
                 [4] = _t"双击物品",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[35]=
    {
         question = _t"如何屏蔽游戏中的所有特效？",
         opt_answer = {
                 [1] = _t"点击F12或者ALT+L",
                 [2] = _t"找GM申请",
                 [3] = _t"下载插件",
                 [4] = _t"不和其他玩家组队",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[36]=
    {
         question = _t"如何将NPC信息发到聊天频道中？",
         opt_answer = {
                 [1] = _t"SHIFT+点击NPC头像或名称",
                 [2] = _t"找NPC谈话",
                 [3] = _t"SHIFT",
                 [4] = _t"在频道中打NPC的名字",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[37]=
    {
         question = _t"哪几个部位可以使用魔盒升阶提升属性？",
         opt_answer = {
                 [1] = _t"灵石、手环、徽章和珠链",
                 [2] = _t"发带，戒指，项链",
                 [3] = _t"上衣，裤子",
                 [4] = _t"时装",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[38]=
    {
         question = _t"魔盒能量的自动恢复规则是？",
         opt_answer = {
                 [1] = _t"每日上线的前两小时",
                 [2] = _t"不会恢复",
                 [3] = _t"在线即可恢复",
                 [4] = _t"定时恢复",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[39]=
    {
         question = _t"装备聚能有什么好处？",
         opt_answer = {
                 [1] = _t"提升属性",
                 [2] = _t"提升卖店价",
                 [3] = _t"提升外观",
                 [4] = _t"提升舒适度",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[40]=
    {
         question = _t"以下哪种情况不能转移聚能？",
         opt_answer = {
                 [1] = _t"目标装备等阶低于待转移装备",
                 [2] = _t"目标装备属性低于待转移装备",
                 [3] = _t"目标装备等阶高于待转移装备",
                 [4] = _t"目标装备耐久度不满",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[41]=
    {
         question = _t"产出装备的副本会在以下哪一个时间点进行刷新？",
         opt_answer = {
                 [1] = _t"每周六早上6点钟",
                 [2] = _t"每周二上午6点",
                 [3] = _t"每天凌晨1点",
                 [4] = _t"每天中午12点",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[42]=
    {
         question = _t"在队长发出队友召集后，什么行为会打断玩家到队长处的自动寻路？",
         opt_answer = {
                 [1] = _t"自行移动或使用技能",
                 [2] = _t"在频道中聊天",
                 [3] = _t"寻径中按SHIFT",
                 [4] = _t"什么都不按",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[43]=
    {
         question = _t"装备聚能转移会损失聚能和符文属性么？",
         opt_answer = {
                 [1] = _t"不会，损失是不科学的",
                 [2] = _t"会，从头开荒感觉更好",
                 [3] = _t"少许损失",
                 [4] = _t"无法转移",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[44]=
    {
         question = _t"哪种途径可以获得聚能用的灵沐之光？",
         opt_answer = {
                 [1] = _t"做活动",
                 [2] = _t"祈祷",
                 [3] = _t"升级技能",
                 [4] = _t"沐浴荣光",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[45]=
    {
         question = _t"通过什么途径能了解玩家自身战力的不足之处？",
         opt_answer = {
                 [1] = _t"点击雷达左侧战力体检按钮进行查看",
                 [2] = _t"询问圣域NPC",
                 [3] = _t"去网上查攻略",
                 [4] = _t"询问GM",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[46]=
    {
         question = _t"以下哪一条不属于提升玩家自身实力的途径？",
         opt_answer = {
                 [1] = _t"到处闲逛",
                 [2] = _t"对装备聚能",
                 [3] = _t"镶嵌符文",
                 [4] = _t"升级技能",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[47]=
    {
         question = _t"要想获得普通的青铜圣衣必须要收集什么材料？",
         opt_answer = {
                 [1] = _t"青铜圣衣碎片",
                 [2] = _t"生产材料或药水",
                 [3] = _t"分解装备的材料",
                 [4] = _t"采集材料",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[48]=
    {
         question = _t"如何更改默认的快捷键设置？",
         opt_answer = {
                 [1] = _t"在系统的热键设置中更改",
                 [2] = _t"向Gm申请",
                 [3] = _t"无法修改",
                 [4] = _t"在官网上申请",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[49]=
    {
         question = _t"斗魂会提升战斗技能的能力，怎么获得和使用斗魂？",
         opt_answer = {
                 [1] = _t"星铸圣衣获得并在斗魂界面设置",
                 [2] = _t"跪求好友赠送并在斗魂界面设置",
                 [3] = _t"自动获得并设置",
                 [4] = _t"提升觉悟获得并设置",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[50]=
    {
         question = _t"主线所需等级不够时，你可以做什么？",
         opt_answer = {
                 [1] = _t"支线，各种活动",
                 [2] = _t"主线",
                 [3] = _t"剧情副本",
                 [4] = _t"什么都做不了",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[51]=
    {
         question = _t"当有物品需要ROLL点决定归属时，正确的做法是?",
         opt_answer = {
                 [1] = _t"物品附近等待归属决定后再离开",
                 [2] = _t"立即离开副本",
                 [3] = _t"立即前往其他地图",
                 [4] = _t"立即切换分线",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[52]=
    {
         question = _t"在游戏中下列哪个地方可以摆摊？",
         opt_answer = {
                 [1] = _t"大地图的任何地方",
                 [2] = _t"银河斗技场中",
                 [3] = _t"战场中",
                 [4] = _t"军团基地中",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[53]=
    {
         question = _t"如何将地图坐标发到聊天频道中？",
         opt_answer = {
                 [1] = _t"SHIFT+点击大地图",
                 [2] = _t"在地图上标记",
                 [3] = _t"ALT+点击大地图",
                 [4] = _t"双击地图",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[54]=
    {
         question = _t"在战斗中如何打断敌方的读条释放技能？",
         opt_answer = {
                 [1] = _t"使用基本技能中的“打断”技能",
                 [2] = _t"尽量往远处跑",
                 [3] = _t"继续攻击敌人",
                 [4] = _t"走位尽量飘忽",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[55]=
    {
         question = _t"在副本当中遇到“怪盗”的话，最合理的做法是什么？",
         opt_answer = {
                 [1] = _t"等待其他队友都到了再打",
                 [2] = _t"偷偷摸摸自己找地方干掉他",
                 [3] = _t"先下手为强，不用通知其他人",
                 [4] = _t"当没看见，怪盗不掉好东西",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[56]=
    {
         question = _t"在游戏中如何进入拍照模式？",
         opt_answer = {
                 [1] = _t"ALT+Z",
                 [2] = _t"ALT+F",
                 [3] = _t"ALT+S",
                 [4] = _t"ALT+K",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[57]=
    {
         question = _t"周常活动会在以下哪一个时间点进行刷新？",
         opt_answer = {
                 [1] = _t"每周六早上6点钟",
                 [2] = _t"每周二上午6点",
                 [3] = _t"每周五晚上9点",
                 [4] = _t"每周一上午10点",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[58]=
    {
         question = _t"你想把美好的画面保存下来时，如何隐藏游戏界面？",
         opt_answer = {
                 [1] = _t"ALT+H",
                 [2] = _t"ALT+Z",
                 [3] = _t"ALT+P",
                 [4] = _t"ALT+Q",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[59]=
    {
         question = _t"如何避免失手攻击其他玩家？",
         opt_answer = {
                 [1] = _t"在PK设置界面中勾选选项",
                 [2] = _t"不去点击其他玩家",
                 [3] = _t"远离所有玩家",
                 [4] = _t"去找NPC进行设置",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[60]=
    {
         question = _t"守护星座天马座对哪种属性伤害有加成50%",
         opt_answer = {
                 [1] = _t"风",
                 [2] = _t"水",
                 [3] = _t"地",
                 [4] = _t"雷",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[61]=
    {
         question = _t"守护星座白鸟座对哪种属性伤害有加成50%",
         opt_answer = {
                 [1] = _t"水",
                 [2] = _t"地",
                 [3] = _t"风",
                 [4] = _t"雷",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[62]=
    {
         question = _t"交易过程中，什么时候检查交易品能防止对方偷偷减少物品数量？",
         opt_answer = {
                 [1] = _t"双方锁定之后",
                 [2] = _t"对方放入交易品之后",
                 [3] = _t"自己放入交易品后",
                 [4] = _t"检查什么的太麻烦了，直接点交易",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[63]=
    {
         question = _t"守护星座天龙座对哪种属性伤害有加成50%",
         opt_answer = {
                 [1] = _t"地",
                 [2] = _t"水",
                 [3] = _t"风",
                 [4] = _t"雷",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[64]=
    {
         question = _t"守护星座仙女座对哪种属性伤害有加成50%",
         opt_answer = {
                 [1] = _t"雷",
                 [2] = _t"水",
                 [3] = _t"地",
                 [4] = _t"风",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[65]=
    {
         question = _t"守护星座凤凰座对哪种属性伤害有加成50%",
         opt_answer = {
                 [1] = _t"火",
                 [2] = _t"地",
                 [3] = _t"风",
                 [4] = _t"雷",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[66]=
    {
         question = _t"等级低于66级时如何长出圣衣翅膀",
         opt_answer = {
                 [1] = _t"战斗力达到40000",
                 [2] = _t"向女神乞求100次",
                 [3] = _t"向车田乞求100次",
                 [4] = _t"脱穿圣衣100次",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[67]=
    {
         question = _t"等级低于86级高于66级时如何长出圣衣翅膀",
         opt_answer = {
                 [1] = _t"战斗力达到100000",
                 [2] = _t"向女神乞求200次",
                 [3] = _t"向车田乞求200次",
                 [4] = _t"脱穿圣衣200次",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[68]=
    {
         question = _t"等级高于86级时如何长出圣衣翅膀",
         opt_answer = {
                 [1] = _t"战斗力达到180000",
                 [2] = _t"向女神乞求300次",
                 [3] = _t"向车田乞求300次",
                 [4] = _t"脱穿圣衣300次",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[69]=
    {
         question = _t"当到达一定等级后，圣衣翅膀战力要求提高，原有的低阶翅膀会怎样？",
         opt_answer = {
                 [1] = _t"依旧保存",
                 [2] = _t"3天后消失",
                 [3] = _t"10天后消失",
                 [4] = _t"直接消失",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[70]=
    {
         question = _t"当切换职业后，原有的圣衣翅膀会怎样？",
         opt_answer = {
                 [1] = _t"切换为新职业该战力档次的翅膀",
                 [2] = _t"直接消失",
                 [3] = _t"保留原有圣衣翅膀",
                 [4] = _t"3天后切换为新职业翅膀",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[71]=
    {
         question = _t"如何将队伍转化为团队",
         opt_answer = {
                 [1] = _t"队长在头像下方点击“创建团队”按钮",
                 [2] = _t"继续添加队友",
                 [3] = _t"与其他队伍申请合并",
                 [4] = _t"在聊天栏中输入“组建团队”",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[72]=
    {
         question = _t"获得坐骑后如何骑乘？",
         opt_answer = {
                 [1] = _t"装备坐骑后在技能界面找到“骑乘”并使用",
                 [2] = _t"装备成功后自动骑乘",
                 [3] = _t"点击坐骑道具",
                 [4] = _t"大吼：我要骑马！",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[73]=
    {
         question = _t"下列哪一对不是情侣？",
         opt_answer = {
                 [1] = _t"米罗和卡妙",
                 [2] = _t"一辉和艾丝美拉达",
                 [3] = _t"瞬和珍妮",
                 [4] = _t"紫龙和春丽",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[74]=
    {
         question = _t"下列哪个圣斗士长得不漂亮？",
         opt_answer = {
                 [1] = _t"乌鸦座加米安",
                 [2] = _t"双鱼座阿布罗狄",
                 [3] = _t"海魔女苏兰特",
                 [4] = _t"蜥蜴座美斯狄",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[75]=
    {
         question = _t"哪位黄金圣斗士最美丽？",
         opt_answer = {
                 [1] = _t"双鱼座阿布罗狄",
                 [2] = _t"天秤座童虎",
                 [3] = _t"水瓶座卡妙",
                 [4] = _t"巨蟹座迪斯马斯克",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[76]=
    {
         question = _t"下列哪个组合没有血缘关系？",
         opt_answer = {
                 [1] = _t"冰河和艾尔扎克",
                 [2] = _t"艾欧里亚和艾欧罗斯",
                 [3] = _t"瞬和一辉",
                 [4] = _t"撒加和加隆",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[77]=
    {
         question = _t"下列哪个人不是女人？",
         opt_answer = {
                 [1] = _t"海魔女苏兰特",
                 [2] = _t"天鹰座魔铃",
                 [3] = _t"蛇夫座莎尔娜",
                 [4] = _t"潘多拉",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[78]=
    {
         question = _t"卡西欧士跟谁关系最密切？",
         opt_answer = {
                 [1] = _t"蛇夫座莎尔娜",
                 [2] = _t"天鹰座魔铃",
                 [3] = _t"大熊座檄",
                 [4] = _t"凤凰座一辉",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[79]=
    {
         question = _t"庐山升龙霸是哪个圣斗士的大招？",
         opt_answer = {
                 [1] = _t"紫龙",
                 [2] = _t"星矢",
                 [3] = _t"童虎",
                 [4] = _t"冰河",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[80]=
    {
         question = _t"水晶墙和星光灭绝是哪个黄金圣斗士的大招？",
         opt_answer = {
                 [1] = _t"白羊座穆",
                 [2] = _t"处女座沙加",
                 [3] = _t"狮子座艾欧里亚",
                 [4] = _t"水瓶座卡妙",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[81]=
    {
         question = _t"狮子宫黄金圣斗士是？",
         opt_answer = {
                 [1] = _t"艾欧里亚",
                 [2] = _t"迪斯马斯克",
                 [3] = _t"阿布罗狄",
                 [4] = _t"卡妙",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[82]=
    {
         question = _t"13年前，带着婴儿雅典娜逃离圣域的黄金圣斗士是？",
         opt_answer = {
                 [1] = _t"射手座",
                 [2] = _t"摩羯座",
                 [3] = _t"白羊座",
                 [4] = _t"处女座 ",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[83]=
    {
         question = _t"闯黄金十二宫之战中，哪个黄金圣斗士直接对星矢一行放水？",
         opt_answer = {
                 [1] = _t"白羊座穆",
                 [2] = _t"摩羯座修罗",
                 [3] = _t"双鱼座阿布罗狄",
                 [4] = _t"巨蟹座迪斯马斯克",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[84]=
    {
         question = _t"冰河在哪里拿到的白鸟座圣衣？",
         opt_answer = {
                 [1] = _t"东西伯利亚",
                 [2] = _t"庐山",
                 [3] = _t"圣域",
                 [4] = _t"死亡皇后岛",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[85]=
    {
         question = _t"黄金十二宫第三宫是？",
         opt_answer = {
                 [1] = _t"双子宫",
                 [2] = _t"金牛宫",
                 [3] = _t"水瓶宫",
                 [4] = _t"巨蟹宫",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[86]=
    {
         question = _t"关于仙女座瞬的描述，哪一项很不恰当？",
         opt_answer = {
                 [1] = _t"铁血真汉子",
                 [2] = _t"伪娘",
                 [3] = _t"恋哥情结",
                 [4] = _t"异性恋",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[87]=
    {
         question = _t"下列谁不是《圣斗士星矢》中的角色？",
         opt_answer = {
                 [1] = _t"斯巴达人奎托斯",
                 [2] = _t"嘉米尔高原的贵鬼",
                 [3] = _t"恒河水畔的沙加",
                 [4] = _t"庐山上的童虎",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[88]=
    {
         question = _t"睡神名字叫？",
         opt_answer = {
                 [1] = _t"修普诺斯",
                 [2] = _t"不想起床",
                 [3] = _t"达拿都斯",
                 [4] = _t"达纳苏斯",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[89]=
    {
         question = _t"哪一个不是冥界三巨头之一？",
         opt_answer = {
                 [1] = _t"天雄星豹子头林冲",
                 [2] = _t"天猛星拉达曼迪斯",
                 [3] = _t"天雄星艾亚哥斯",
                 [4] = _t"天贵星米诺斯",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[90]=
    {
         question = _t"谁的大招能让九大行星不再移动，能让日蚀永恒、天地黑暗？",
         opt_answer = {
                 [1] = _t"冥王哈迪斯",
                 [2] = _t"黑暗天马座",
                 [3] = _t"卡西欧士",
                 [4] = _t"幼狮座蛮",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[91]=
    {
         question = _t"摩羯宫黄金圣斗士是？",
         opt_answer = {
                 [1] = _t"修罗",
                 [2] = _t"撒加",
                 [3] = _t"艾欧罗斯",
                 [4] = _t"米罗",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[92]=
    {
         question = _t"用箭伤了纱织的是什么座圣斗士？",
         opt_answer = {
                 [1] = _t"天箭座",
                 [2] = _t"乌鸦座",
                 [3] = _t"天鹰座",
                 [4] = _t"蛇夫座",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[93]=
    {
         question = _t"星矢切断了牛哥（金牛座）的哪只角？",
         opt_answer = {
                 [1] = _t"左角",
                 [2] = _t"右角",
                 [3] = _t"双角",
                 [4] = _t"未切断",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[94]=
    {
         question = _t"被称为“最接近神的男人”的黄金圣斗士是哪位？",
         opt_answer = {
                 [1] = _t"处女座：沙加",
                 [2] = _t"双鱼座：阿布罗狄",
                 [3] = _t"天秤座：童虎",
                 [4] = _t"金牛座：阿鲁迪巴",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[95]=
    {
         question = _t"五小强中的瞬长的最像哪位女生？",
         opt_answer = {
                 [1] = _t"死亡皇后岛陪伴一辉的“艾丝美拉达”",
                 [2] = _t"庐山陪伴紫龙的“春丽”",
                 [3] = _t"莎尔娜",
                 [4] = _t"魔铃",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[96]=
    {
         question = _t"下列哪对人物没有血亲关系？",
         opt_answer = {
                 [1] = _t"星矢 魔铃",
                 [2] = _t"紫龙 一辉",
                 [3] = _t"冰河 城户光政",
                 [4] = _t"星矢 紫龙",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[97]=
    {
         question = _t"对于星矢的描述正确的是？",
         opt_answer = {
                 [1] = _t"星矢用手刀砍下了卡西欧士的耳朵",
                 [2] = _t"星矢在西伯利亚修行",
                 [3] = _t"星矢的师傅是卡妙",
                 [4] = _t"星矢的绝招包含绝对零度",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[98]=
    {
         question = _t"处女宫黄金圣斗士是？",
         opt_answer = {
                 [1] = _t"沙加",
                 [2] = _t"艾欧里亚",
                 [3] = _t"迪斯马斯克",
                 [4] = _t"阿布罗狄",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[99]=
    {
         question = _t"黄金十二宫第二宫是？",
         opt_answer = {
                 [1] = _t"金牛宫",
                 [2] = _t"巨蟹宫",
                 [3] = _t"双鱼宫",
                 [4] = _t"狮子宫",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[100]=
    {
         question = _t"黄金十二宫第五宫是？",
         opt_answer = {
                 [1] = _t"狮子宫",
                 [2] = _t"天蝎宫",
                 [3] = _t"天枰宫",
                 [4] = _t"巨蟹宫",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[101]=
    {
         question = _t"下列哪一对不是情侣？",
         opt_answer = {
                 [1] = _t"米罗和卡妙",
                 [2] = _t"一辉和艾丝美拉达",
                 [3] = _t"瞬和珍妮",
                 [4] = _t"紫龙和春丽",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[102]=
    {
         question = _t"是谁从教皇手里把小纱织救出来的？",
         opt_answer = {
                 [1] = _t"艾俄罗斯",
                 [2] = _t"沙加 ",
                 [3] = _t"卡妙",
                 [4] = _t"艾欧里亚",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[103]=
    {
         question = _t"在打败波塞冬时星矢穿上的谁的黄金圣衣？",
         opt_answer = {
                 [1] = _t"射手座",
                 [2] = _t"水瓶座",
                 [3] = _t"天秤座",
                 [4] = _t"白羊座",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[104]=
    {
         question = _t"紫龙的师傅叫什么？",
         opt_answer = {
                 [1] = _t"童虎",
                 [2] = _t"卡妙",
                 [3] = _t"撒加",
                 [4] = _t"穆",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[105]=
    {
         question = _t"十二黄金圣斗士中的哪位被赐予圣剑？",
         opt_answer = {
                 [1] = _t"摩羯座",
                 [2] = _t"射手座",
                 [3] = _t"白羊座",
                 [4] = _t"天秤座",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[106]=
    {
         question = _t"黄金十二宫第七宫是？",
         opt_answer = {
                 [1] = _t"天秤宫",
                 [2] = _t"金牛宫",
                 [3] = _t"水瓶宫",
                 [4] = _t"巨蟹宫",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[107]=
    {
         question = _t"天蝎宫黄金圣斗士是？",
         opt_answer = {
                 [1] = _t"米罗",
                 [2] = _t"穆",
                 [3] = _t"童虎",
                 [4] = _t"迪斯马斯克",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[108]=
    {
         question = _t"圣斗士中谁参加了2次圣战？",
         opt_answer = {
                 [1] = _t"童虎",
                 [2] = _t"卡妙",
                 [3] = _t"艾欧里亚",
                 [4] = _t"穆",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[109]=
    {
         question = _t"‘对神经系统进行打击，使敌手产生幻觉，丧失战斗力的斗技’是？",
         opt_answer = {
                 [1] = _t"凤凰幻魔拳",
                 [2] = _t"凤翼天翔 ",
                 [3] = _t"天马流星拳",
                 [4] = _t"庐山升龙霸",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[110]=
    {
         question = _t"在水瓶宫中，卡妙教会了冰河最强的冻拳是？",
         opt_answer = {
                 [1] = _t"曙光女神之宽恕",
                 [2] = _t"极光雷电冲击",
                 [3] = _t"冰之柩",
                 [4] = _t"凤翼天翔 ",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[111]=
    {
         question = _t"黄金十二宫第八宫是？",
         opt_answer = {
                 [1] = _t"天蝎宫",
                 [2] = _t"金牛宫",
                 [3] = _t"双鱼宫",
                 [4] = _t"狮子宫",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[112]=
    {
         question = _t"圣衣坏了之后没让穆修补的人是?",
         opt_answer = {
                 [1] = _t"一辉",
                 [2] = _t"紫龙",
                 [3] = _t"星矢",
                 [4] = _t"瞬",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[113]=
    {
         question = _t"在圣域中哪个女圣斗士喜欢星矢？",
         opt_answer = {
                 [1] = _t"莎尔娜",
                 [2] = _t"纱织",
                 [3] = _t"魔铃",
                 [4] = _t"卡妙",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[114]=
    {
         question = _t"星矢穿的第一件黄金圣衣是？",
         opt_answer = {
                 [1] = _t"射手座",
                 [2] = _t"处女座 ",
                 [3] = _t"双子座",
                 [4] = _t"天秤座",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[115]=
    {
         question = _t"星矢在闯十二宫时第一个打败的黄金圣斗士是？",
         opt_answer = {
                 [1] = _t"阿鲁迪巴",
                 [2] = _t"米罗",
                 [3] = _t"阿布罗狄",
                 [4] = _t"处女座 ",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[116]=
    {
         question = _t"什么星座圣衣是武器库？",
         opt_answer = {
                 [1] = _t"天秤座",
                 [2] = _t"射手座",
                 [3] = _t"双鱼座",
                 [4] = _t"双子座",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[117]=
    {
         question = _t"患有极度人格分裂症的人是？",
         opt_answer = {
                 [1] = _t"撒加",
                 [2] = _t"卡妙",
                 [3] = _t"哈根",
                 [4] = _t"米诺斯",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[118]=
    {
         question = _t"双子宫黄金圣斗士是？",
         opt_answer = {
                 [1] = _t"撒加",
                 [2] = _t"卡妙",
                 [3] = _t"修罗",
                 [4] = _t"迪斯马斯克",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[119]=
    {
         question = _t"五小强中，哪个星座圣衣拥有自我修复功能？",
         opt_answer = {
                 [1] = _t"凤凰座 ",
                 [2] = _t"天龙座",
                 [3] = _t"仙女座",
                 [4] = _t"白鸟座",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[120]=
    {
         question = _t"黄金星座有几个？",
         opt_answer = {
                 [1] = _t"12",
                 [2] = _t"24",
                 [3] = _t"48",
                 [4] = _t"64",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[121]=
    {
         question = _t"十二黄金中是谁杀死史昂当上教皇？",
         opt_answer = {
                 [1] = _t"撒加",
                 [2] = _t"米罗",
                 [3] = _t"穆",
                 [4] = _t"卡妙",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[122]=
    {
         question = _t"被冠以“圣域的叛徒”的人是？",
         opt_answer = {
                 [1] = _t"艾俄罗斯",
                 [2] = _t"杜拉狄斯",
                 [3] = _t"阿布罗狄",
                 [4] = _t"童虎",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[123]=
    {
         question = _t"金牛座黄金圣衣的角是被谁打掉的？",
         opt_answer = {
                 [1] = _t"星矢 ",
                 [2] = _t"一辉",
                 [3] = _t"冰河",
                 [4] = _t"紫龙",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[124]=
    {
         question = _t"黄金十二宫第十宫是？",
         opt_answer = {
                 [1] = _t"摩羯宫",
                 [2] = _t"天秤宫",
                 [3] = _t"双鱼宫",
                 [4] = _t"天蝎宫",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[125]=
    {
         question = _t"瞬用锁链攻击双子座幻影后，锁链带回了撒加身边的什么东西？",
         opt_answer = {
                 [1] = _t"珠串",
                 [2] = _t"纽扣",
                 [3] = _t"胸章",
                 [4] = _t"头盔",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[126]=
    {
         question = _t"紫龙用哪一件天秤座武器打开了冰棺救出冰河？",
         opt_answer = {
                 [1] = _t"长剑",
                 [2] = _t"双节棍",
                 [3] = _t"盾牌",
                 [4] = _t"长枪",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[127]=
    {
         question = _t"白羊宫黄金圣斗士是？",
         opt_answer = {
                 [1] = _t"穆",
                 [2] = _t"艾欧罗斯",
                 [3] = _t"迪斯马斯克",
                 [4] = _t"阿布罗狄",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[128]=
    {
         question = _t"双鱼宫黄金圣斗士是？",
         opt_answer = {
                 [1] = _t"阿布罗狄",
                 [2] = _t"艾欧里亚",
                 [3] = _t"卡妙",
                 [4] = _t"修罗",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[129]=
    {
         question = _t"迪斯马斯克曾经被撒加派遣去刺杀谁？",
         opt_answer = {
                 [1] = _t"童虎",
                 [2] = _t"穆",
                 [3] = _t"星矢",
                 [4] = _t"艾俄罗斯",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[130]=
    {
         question = _t"童虎在庐山瀑布前打坐是为了做什么？",
         opt_answer = {
                 [1] = _t"监督被封印的魔星",
                 [2] = _t"提升小宇宙",
                 [3] = _t"观察少年圣斗士",
                 [4] = _t"思考人生",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[131]=
    {
         question = _t"撒加在十二宫之战开始前对哪个黄金圣斗士用了幻胧魔皇拳？",
         opt_answer = {
                 [1] = _t"艾欧里亚 ",
                 [2] = _t"沙加",
                 [3] = _t"迪斯马斯克",
                 [4] = _t"米罗",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[132]=
    {
         question = _t"5小强在闯12宫的第一宫时是谁帮助他们修复的圣衣？",
         opt_answer = {
                 [1] = _t"穆先生",
                 [2] = _t"贵鬼",
                 [3] = _t"城户纱织",
                 [4] = _t"童虎",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[133]=
    {
         question = _t"黄金十二宫第十一宫是？",
         opt_answer = {
                 [1] = _t"水瓶宫",
                 [2] = _t"金牛宫",
                 [3] = _t"双鱼宫",
                 [4] = _t"巨蟹宫",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[134]=
    {
         question = _t"圣斗士冥王篇中谁将叹息之墙射穿了？",
         opt_answer = {
                 [1] = _t"12个黄金圣斗士",
                 [2] = _t"5小强",
                 [3] = _t"108个冥斗士",
                 [4] = _t"波塞冬",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[135]=
    {
         question = _t"圣斗士极乐净土篇中星矢为谁挡住了哈迪斯那一剑？",
         opt_answer = {
                 [1] = _t"雅典娜 ",
                 [2] = _t"童虎",
                 [3] = _t"穆",
                 [4] = _t"紫龙",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[136]=
    {
         question = _t"圣斗士中一辉在什么地方修炼?",
         opt_answer = {
                 [1] = _t"死亡皇后岛",
                 [2] = _t"五老峰",
                 [3] = _t"仙女岛",
                 [4] = _t"北欧",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[137]=
    {
         question = _t"冥王篇中12位黄金圣斗士最终在哪里集结？",
         opt_answer = {
                 [1] = _t"叹息之墙",
                 [2] = _t"冰地狱",
                 [3] = _t"朱狄加 ",
                 [4] = _t"雅典娜圣殿",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[138]=
    {
         question = _t"冥王篇中黄金圣斗士用什么武器击穿了叹息之墙？",
         opt_answer = {
                 [1] = _t"射手座的黄金之箭",
                 [2] = _t"雅典娜神仗",
                 [3] = _t"天秤座长枪",
                 [4] = _t"黄金匕首 ",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[139]=
    {
         question = _t"冥王12宫篇中沙加在哪里与撒加、卡妙、修罗三人激战？",
         opt_answer = {
                 [1] = _t"沙罗双树园",
                 [2] = _t"钟楼",
                 [3] = _t"教皇厅",
                 [4] = _t"星楼",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[140]=
    {
         question = _t"符合什么条件的军团可以申请基地？",
         opt_answer = {
                 [1] = _t"上周军团活跃度前200名",
                 [2] = _t"在军团排位赛中取得前5",
                 [3] = _t"军团人数超过500人",
                 [4] = _t"军团规模到达3级",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[141]=
    {
         question = _t"什么情况下军团基地会被系统回收？",
         opt_answer = {
                 [1] = _t"上周军团活跃度掉到前200名以后",
                 [2] = _t"军团人数下降到100人以下",
                 [3] = _t"军团长自动放弃军团基地",
                 [4] = _t"军团排位赛没取得名次",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[142]=
    {
         question = _t"什么行为可以增加与好友的友好度？",
         opt_answer = {
                 [1] = _t"组队打怪或者使用占卜道具",
                 [2] = _t"送鲜花",
                 [3] = _t"组队经过一定时间",
                 [4] = _t"成为好友后进行私聊",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[143]=
    {
         question = _t"哪个快捷键能打开技能菜单下的连招编辑器界面？",
         opt_answer = {
                 [1] = _t"K",
                 [2] = _t"ALT+G",
                 [3] = _t"CTRL+Y",
                 [4] = _t"R",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[144]=
    {
         question = _t"以下哪些不是连招编辑器能实现的功能？ ",
         opt_answer = {
                 [1] = _t"自动爆发小宇宙",
                 [2] = _t"自动选怪",
                 [3] = _t"定点打怪",
                 [4] = _t"自动吃药",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[145]=
    {
         question = _t"“十二宫危机”活动，获得的经验及掉落与玩家哪项数值有关？",
         opt_answer = {
                 [1] = _t"玩家的个人等级",
                 [2] = _t"队伍平均等级",
                 [3] = _t"玩家的战斗力",
                 [4] = _t"队伍人数",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[146]=
    {
         question = _t"“黄金试炼”活动，获得的经验及掉落与玩家哪项数值有关？",
         opt_answer = {
                 [1] = _t"玩家的个人等级",
                 [2] = _t"队伍平均等级",
                 [3] = _t"玩家的战斗力",
                 [4] = _t"队伍人数",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[147]=
    {
         question = _t"“亚特兰蒂斯”活动，获得的经验及掉落与玩家哪项数值有关？",
         opt_answer = {
                 [1] = _t"玩家的个人等级",
                 [2] = _t"队伍平均等级",
                 [3] = _t"玩家的战斗力",
                 [4] = _t"队伍人数",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }
QuestionDB[148]=
    {
         question = _t"使用组队平台时，当玩家组满6人队伍报名时，将发生什么情况？",
         opt_answer = {
                 [1] = _t"无视职业限制直接传送",
                 [2] = _t"需满足副本活动的职业要求",
                 [3] = _t"无法排队，需要单人报名",
                 [4] = _t"系统会将队伍打散来满足职业要求",},
         answer = 1,
         right_words = _t"",
         wrong_words = _t"",
    }