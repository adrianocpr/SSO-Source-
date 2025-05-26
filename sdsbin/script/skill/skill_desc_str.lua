--[[ @i18n skill ]]
local _t = require("i18n").context("skill")
--技能描述字符串表
skill_desc_str = {}
skill_desc_str[1]=
{
strName=_t"群- 标准攻_战",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "群- 标准攻_战",
StrUseDesc=_t "群- 标准攻_战",
}

skill_desc_str[2]=
{
strName=_t"群- 冲锋_落_战",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "群- 冲锋_落_战",
StrUseDesc=_t "群- 冲锋_落_战",
}

skill_desc_str[3]=
{
strName=_t"群- 大伤害_战",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "群- 大伤害_战",
StrUseDesc=_t "群- 大伤害_战",
}

skill_desc_str[4]=
{
strName=_t"群- 大招_战",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "群- 大招_战",
StrUseDesc=_t "群- 大招_战",
}

skill_desc_str[5]=
{
strName=_t"群- 浮起手_战",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "群- 浮起手_战",
StrUseDesc=_t "群- 浮起手_战",
}

skill_desc_str[6]=
{
strName=_t"群- 浮空追_战",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "群- 浮空追_战",
StrUseDesc=_t "群- 浮空追_战",
}

skill_desc_str[7]=
{
strName=_t"群- 浮空追_战",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "群- 浮空追_战",
StrUseDesc=_t "群- 浮空追_战",
}

skill_desc_str[8]=
{
strName=_t"击退测试",
StrAttacktype=_t"主动诅咒",
StrCompDesc=_t "击退测试",
StrUseDesc=_t "击退测试",
}

skill_desc_str[9]=
{
strName=_t"前冲",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "前冲",
StrUseDesc=_t "前冲",
}

skill_desc_str[10]=
{
strName=_t"后冲",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "后冲",
StrUseDesc=_t "后冲",
}

skill_desc_str[11]=
{
strName=_t"左冲",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "左冲",
StrUseDesc=_t "左冲",
}

skill_desc_str[12]=
{
strName=_t"右冲",
StrAttacktype=_t"主动诅咒",
StrCompDesc=_t "右冲",
StrUseDesc=_t "右冲",
}

skill_desc_str[13]=
{
strName=_t"清除所有技能CD(GM技能勿改)",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "清除所有技能CD(GM技能勿改)",
StrUseDesc=_t "清除所有技能CD(GM技能勿改)",
}

skill_desc_str[14]=
{
strName=_t"通道自身状态格挡",
StrAttacktype=_t"开关技能",
StrCompDesc=_t "通道自身状态格挡",
StrUseDesc=_t "通道自身状态格挡",
}

skill_desc_str[15]=
{
strName=_t"快跑—特殊",
StrAttacktype=_t"主动诅咒",
StrCompDesc=_t "快跑—特殊",
StrUseDesc=_t "快跑—特殊",
}

skill_desc_str[16]=
{
strName=_t"召唤测试",
StrAttacktype=_t"主动诅咒",
StrCompDesc=_t "召唤测试",
StrUseDesc=_t "召唤测试",
}

skill_desc_str[17]=
{
strName=_t"流星突袭",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "对怪物造成2秒倒地，对玩家造成2秒定身\r附加攻击力:{^FFABFC%d^FFFF00}\r附加雷属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r\t^00FF00射手座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发",
StrUseDesc=_t "对怪物造成2秒倒地，对玩家造成2秒定身\r附加攻击力:%d\r附加雷属性攻击力:%d\r造成%d%%的伤害\r\t^00FF00射手座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发",
StrDescNum="0.13*level*level+13.2*level+26.67;0.1*level*level+9.77*level+19.13;100*(0.0054*level+0.6)*(1+0.2*t6)",
StrFuncdesc=_t"远距离快速冲击目标，打击并击倒目标周围的目标",
SkillSoul={ 
   [922] = { desc=_t"使用后获得一点斗志，并进入风暴流星状态，同时对怪物造成重伤，使怪物的伤害抗性下降10%%，持续6秒"},
   [929] = { desc=_t"释放距离增加3米，冷却时间减少20%%"},
   [4288] = { desc=_t"每次会给主目标一个追踪的状态，目标减速1米/秒，持续8秒；对有该状态的目标使用终结技时，会根据斗志的数量x额外附加效果:定身x-2秒,伤害提高5*x%%"},
} ,
}

skill_desc_str[18]=
{
strName=_t"流星空突拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r攻击5次，共造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加风属性攻击力:%d\r攻击5次，共造成%d%%的伤害",
StrDescNum="0.16*level*level+15.84*level+32;0.16*level*level+15.52*level+30.32;100*(0.0137*level+1.51)",
StrFuncdesc=_t"天马座的基础招式，快速出拳打击目标",
}

skill_desc_str[19]=
{
strName=_t"天鹰脚",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r攻击6次，共造成{^FFABFC%d%%^FFFF00}的伤害\r使用一定可以获得一点斗志",
StrUseDesc=_t "附加攻击力:%d\r附加风属性攻击力:%d\r攻击6次，共造成%d%%的伤害\r使用一定可以获得一点斗志",
StrDescNum="0.2*level*level+19.98*level+67.82;0.22*level*level+21.82*level+74.96;100*(0.0174*level+1.91)",
StrFuncdesc=_t"凌厉地飞身横踢倒挂，重创目标",
SkillSoul={ 
   [931] = { desc=_t"目标血量低于50%%时，伤害提高50%%并附带星光惩戒效果"},
} ,
}

skill_desc_str[20]=
{
strName=_t"回旋碎击拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加雷属性攻击力:{^FFABFC%d^FFFF00}\r至少造成{^FFABFC%d%%^FFFF00}的伤害\r倒地时间：3秒\r每点斗志提升25%%的总伤害",
StrUseDesc=_t "附加攻击力:%d\r附加雷属性攻击力:%d\r至少造成%d%%的伤害\r倒地时间：3秒\r每点斗志提升25%%的总伤害",
StrDescNum="0.25*level*level+28*level+232.75;0.47*level*level+53.01*level+441.52;100*2.25/1.75*(0.036*level+4.17)/(1+1.25)",
StrFuncdesc=_t"终结技，消耗当前所有的斗志，将目标抱起砸下，打击并击倒附近的目标.对于不可抱摔的目标，将会从别的角度猛烈攻击",
SkillSoul={ 
   [921] = { desc=_t"每点斗志可以回复15点体力"},
   [925] = { desc=_t"每点斗志额外提升8%%的暴击率"},
   [5676] = { desc=_t"每次击杀1名玩家后，冷却重置，抱摔时免疫控制"},
} ,
}

skill_desc_str[21]=
{
strName=_t"回旋碎击拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r攻击6次，至少共造成{^FFABFC%d%%^FFFF00}的伤害\r可以将怪物打倒4秒\r每点斗志提升25%%的总伤害",
StrUseDesc=_t "附加攻击力:%d\r附加风属性攻击力:%d\r攻击6次，至少共造成%d%%的伤害\r可以将怪物打倒4秒\r每点斗志提升25%%的总伤害",
StrDescNum="0.25*level*level+28*level+232.75;0.47*level*level+53.01*level+441.52;100*2.25/1.75*(0.036*level+4.17)/(1+1.25)",
StrFuncdesc=_t"终结技，消耗当前所有的斗志，以超过光的速度连续攻击",
}

skill_desc_str[22]=
{
strName=_t"流星迅光拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r攻击4次，至少造成{^FFABFC%d%%^FFFF00}的伤害\r最后一击可以将目标怪物击倒3秒\r每点斗志提升25%%的总伤害",
StrUseDesc=_t "附加攻击力:%d\r附加风属性攻击力:%d\r攻击4次，至少造成%d%%的伤害\r最后一击可以将目标怪物击倒3秒\r每点斗志提升25%%的总伤害",
StrDescNum="0.32*level*level+46.83*level+1021.85;0.71*level*level+104.79*level+2285.5;100*2.25/1.75*(0.0713*level+9.7)/(1+1.25)",
StrFuncdesc=_t"终结技，消耗当前所有的斗志，从多个方向以闪电般的速度攻击敌人",
SkillSoul={ 
   [921] = { desc=_t"每点斗志可以回复15点体力"},
   [925] = { desc=_t"每点斗志额外提升8%%的暴击率"},
} ,
}

skill_desc_str[23]=
{
strName=_t"天马斗志",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得天马每五次连击能够增加一点斗志，斗志能使自己的部分技能威力增大，在释放这些技能的时候会自动消耗所有的斗志\r斗志数量上限：5\r斗志持续时间：30秒\r非战斗状态下每4秒会减少一点斗志",
StrUseDesc=_t "使得天马每五次连击能够增加一点斗志，斗志能使自己的部分技能威力增大，在释放这些技能的时候会自动消耗所有的斗志\r斗志数量上限：5\r斗志持续时间：30秒\r非战斗状态下每4秒会减少一点斗志",
StrDescNum="skill_desc_str[17].strName",
StrFuncdesc=_t"领悟斗志的奥义，燃烧斗志发挥更强大的威力",
}

skill_desc_str[24]=
{
strName=_t"雅典娜的恩赐",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使天马能够招架怪物的重击\r并且每消耗一点斗志能瞬间回复自身2%%最大生命",
StrUseDesc=_t "使天马能够招架怪物的重击\r并且每消耗一点斗志能瞬间回复自身2%%最大生命",
}

skill_desc_str[25]=
{
strName=_t"普通攻击空手",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "造成30%%的物理伤害",
StrUseDesc=_t "造成30%%的物理伤害",
}

skill_desc_str[26]=
{
strName=_t"星矢-dot",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "星矢-dot",
StrUseDesc=_t "星矢-dot",
}

skill_desc_str[27]=
{
strName=_t"闪影流星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加雷属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r沉默时间：%d秒",
StrUseDesc=_t "附加攻击力:%d\r附加雷属性攻击力:%d\r造成%d%%的伤害\r沉默时间：%d秒",
StrDescNum="0.26*level*level+35.62*level+647.12;0.32*level*level+43.5*level+791.18;100*(0.0151*level+1.93)*(1-0.25*player.skilllevel[926]);5+player.skilllevel[926]",
StrFuncdesc=_t"打击目标，使目标沉默",
SkillSoul={ 
   [926] = { desc=_t"沉默时间增加1秒，并附带%d秒定身效果",num="3+3*player.skilllevel[4090]"},
   [929] = { desc=_t"释放距离增加3米，冷却时间减少20%%"},
} ,
}

skill_desc_str[28]=
{
strName=_t"星矢-嘲讽",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "星矢-嘲讽",
StrUseDesc=_t "星矢-嘲讽",
}

skill_desc_str[29]=
{
strName=_t"星魂降临",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "伤害提升：20%%\r持续时间：20秒\r效果范围：15米",
StrUseDesc=_t "伤害提升：20%%\r持续时间：20秒\r效果范围：15米",
StrFuncdesc=_t"短时间内使一定范围内的所有队员伤害提升",
}

skill_desc_str[30]=
{
strName=_t"天马之翼",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "提升移动速度：4米/秒\r受到的伤害减少：%d%%\r持续时间：%d秒",
StrUseDesc=_t "提升移动速度：4米/秒\r受到的伤害减少：%d%%\r持续时间：%d秒",
StrDescNum="player.skilllevel[924]*15+25;player.skilllevel[924]*4+12",
StrFuncdesc=_t"短时间内提升自身移动速度和伤害抗性，并免疫定身和减速",
SkillSoul={ 
   [924] = { desc=_t"持续时间增加4秒，受到的伤害额外减少15%%"},
   [4286] = { desc=_t"持续期间附带2米加速、15%%减伤的效果"},
   [5674] = { desc=_t"持续期间每2秒回复10点体力"},
} ,
}

skill_desc_str[31]=
{
strName=_t"星矢-打击回血",
StrAttacktype=_t"主动诅咒",
StrCompDesc=_t "星矢-打击回血",
StrUseDesc=_t "星矢-打击回血",
}

skill_desc_str[32]=
{
strName=_t"星矢-生存2",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "星矢-生存2",
StrUseDesc=_t "星矢-生存2",
}

skill_desc_str[33]=
{
strName=_t"星矢-群拉技能",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "星矢-群拉技能",
StrUseDesc=_t "星矢-群拉技能",
}

skill_desc_str[34]=
{
strName=_t"星矢-测试攒豆",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "星矢-测试攒豆",
StrUseDesc=_t "星矢-测试攒豆",
}

skill_desc_str[35]=
{
strName=_t"T标准攻",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "T标准攻",
StrUseDesc=_t "T标准攻",
}

skill_desc_str[36]=
{
strName=_t"T通用拉仇恨",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "T通用拉仇恨",
StrUseDesc=_t "T通用拉仇恨",
}

skill_desc_str[37]=
{
strName=_t"T单嘲讽",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "T单嘲讽",
StrUseDesc=_t "T单嘲讽",
}

skill_desc_str[38]=
{
strName=_t"T保命",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "T保命",
StrUseDesc=_t "T保命",
}

skill_desc_str[39]=
{
strName=_t"T冲锋1",
StrAttacktype=_t"主动诅咒",
StrCompDesc=_t "T冲锋",
StrUseDesc=_t "T冲锋",
}

skill_desc_str[40]=
{
strName=_t"H标准攻",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "H标准攻",
StrUseDesc=_t "H标准攻",
}

skill_desc_str[41]=
{
strName=_t"H标准治疗",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "H标准治疗",
StrUseDesc=_t "H标准治疗",
}

skill_desc_str[42]=
{
strName=_t"H群治疗",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "H群治疗",
StrUseDesc=_t "H群治疗",
}

skill_desc_str[43]=
{
strName=_t"H应急治疗",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "H应急治疗",
StrUseDesc=_t "H应急治疗",
}

skill_desc_str[44]=
{
strName=_t"H战斗复活",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "H战斗复活",
StrUseDesc=_t "H战斗复活",
}

skill_desc_str[45]=
{
strName=_t"H非战斗复活",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "H非战斗复活",
StrUseDesc=_t "H非战斗复活",
}

skill_desc_str[46]=
{
strName=_t"D标准攻",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "D标准攻",
StrUseDesc=_t "D标准攻",
}

skill_desc_str[47]=
{
strName=_t"D大伤害",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "D大伤害",
StrUseDesc=_t "D大伤害",
}

skill_desc_str[48]=
{
strName=_t"D均匀群伤",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "D均匀群伤",
StrUseDesc=_t "D均匀群伤",
}

skill_desc_str[49]=
{
strName=_t"D暗影步",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "D暗影步",
StrUseDesc=_t "D暗影步",
}

skill_desc_str[50]=
{
strName=_t"D伤害起伏技能",
StrAttacktype=_t"主动诅咒",
StrCompDesc=_t "D伤害起伏技能",
StrUseDesc=_t "D伤害起伏技能",
}

skill_desc_str[51]=
{
strName=_t"单体减少目标5%生命",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "单体减少目标5%生命",
StrUseDesc=_t "单体减少目标5%生命",
}

skill_desc_str[52]=
{
strName=_t"圣域杂兵——普攻技能1",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "圣域杂兵——普攻技能1",
StrUseDesc=_t "圣域杂兵——普攻技能1",
}

skill_desc_str[53]=
{
strName=_t"圣域杂兵——普攻技能2",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "圣域杂兵——普攻技能2",
StrUseDesc=_t "圣域杂兵——普攻技能2",
}

skill_desc_str[54]=
{
strName=_t"星矢-主输出测试",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "测试-主目标dot",
StrUseDesc=_t "测试-主目标dot",
}

skill_desc_str[55]=
{
strName=_t"测试-状态结束触发效果",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "测试-状态结束触发效果",
StrUseDesc=_t "测试-状态结束触发效果",
}

skill_desc_str[56]=
{
strName=_t"测试-减指定技能冷却",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "测试-减指定技能冷却",
StrUseDesc=_t "测试-减指定技能冷却",
}

skill_desc_str[57]=
{
strName=_t"测试追击距离",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "测试追击距离",
StrUseDesc=_t "测试追击距离",
}

skill_desc_str[58]=
{
strName=_t"测试-选区域群",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "测试-选区域群",
StrUseDesc=_t "测试-选区域群",
}

skill_desc_str[59]=
{
strName=_t"测试-合成治疗",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "测试-合成治疗",
StrUseDesc=_t "测试-合成治疗",
}

skill_desc_str[60]=
{
strName=_t"裂风踢",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\t^00FF00风暴流星^FFFF00\r使用终结技时，如果是满斗志状态，则将进入该状态。此状态下该技能的伤害提高50%%，攻击范围提升100%%，且能100%%的溅射旁边的目标，并对主目标造成6秒的减速效果",
StrUseDesc=_t "附加攻击力:%d\r附加风属性攻击力:%d\r造成%d%%的伤害\t^00FF00风暴流星^FFFF00\r使用终结技时，如果是满斗志状态，则将进入该状态。此状态下该技能的伤害提高50%%，攻击范围提升100%%，且能100%%的溅射旁边的目标，并对主目标造成6秒的减速效果",
StrDescNum="0.19*level*level+22.32*level+232.49;0.16*level*level+19.08*level+197.76;100*(0.0105*level+1.24)",
StrFuncdesc=_t"用脚快速踢打目标\r若自己身上有^00FF00风暴流星^A2FFFF状态，则威力大幅增强",
SkillSoul={ 
   [5675] = { desc=_t"风暴流星状态下攻击目标将附带一颗灭绝殒石"},
} ,
}

skill_desc_str[61]=
{
strName=_t"原子破坏",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "开启后，每3秒将消耗一点斗志，对周围4米范围的单位造成150%%的伤害\r并使^c0c0ff[%s]^FFFF00^c0c0ff[%s]^FFFF00^c0c0ff[%s]^FFFF00的伤害下降50%%，同时能够溅射周围目标70%%的伤害，且溅射范围提升100%%\r开启后使用^c0c0ff[%s]^FFFF00将一定获得一点斗志",
StrUseDesc=_t "开启后，每3秒将消耗一点斗志，对周围4米范围的单位造成150%%的伤害\r并使^c0c0ff[%s]^FFFF00^c0c0ff[%s]^FFFF00^c0c0ff[%s]^FFFF00的伤害下降50%%，同时能够溅射周围目标70%%的伤害，且溅射范围提升100%%\r开启后使用^c0c0ff[%s]^FFFF00将一定获得一点斗志",
StrDescNum="skill_desc_str[18].strName;skill_desc_str[19].strName;skill_desc_str[62].strName;skill_desc_str[19].strName",
StrFuncdesc=_t"大幅增加自己的群体攻击能力\r开启状态下再次使用技能可以关闭该效果",
}

skill_desc_str[62]=
{
strName=_t"流星爆裂拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r至少造成{^FFABFC%d%%^FFFF00}的伤害\r每点斗志提升25%%的总伤害\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962原子爆裂拳]^FFFF00\r^c0c0ff伤害提升50%%\r大幅降低目标命中率",
StrUseDesc=_t "附加攻击力:%d\r附加风属性攻击力:%d\r至少造成%d%%的伤害\r每点斗志提升25%%的总伤害\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962原子爆裂拳]^FFFF00\r^c0c0ff伤害提升50%%\r大幅降低目标命中率",
StrDescNum="0.24*level*level+25.69*level+157.07;0.3*level*level+32.21*level+198.49;100*2.25/1.75*(0.0227*level+2.6)/(1+1.25)",
StrFuncdesc=_t"基础终结技，消耗当前所有的斗志，打击目标方向线形范围的目标",
SkillSoul={ 
   [923] = { desc=_t"附带减速效果，减少60%%的速度，持续5秒"},
   [921] = { desc=_t"每点斗志可以回复15点体力"},
   [925] = { desc=_t"每点斗志额外提升8%%的暴击率"},
   [930] = { desc=_t"冷却时间减少2秒，并且成功躲闪时获得一点斗志，生效最小间隔为5秒"},
   [931] = { desc=_t"%s",num="player.skilllevel[4092]>0 and '目标血量低于50%时，伤害提高50%，并附带星光惩戒效果' or ''"},
} ,
}

skill_desc_str[63]=
{
strName=_t"召唤测试2",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "召唤测试2",
StrUseDesc=_t "召唤测试2",
}

skill_desc_str[64]=
{
strName=_t"星命守护",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "状态持续15秒，期间每3秒自动回复一点斗志\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962射手守护]^FFFF00\r^c0c0ff额外获得体力回复\r被攻击时，攻击者的命中率大幅下降",
StrUseDesc=_t "状态持续15秒，期间每3秒自动回复一点斗志\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962射手守护]^FFFF00\r^c0c0ff额外获得体力回复\r被攻击时，攻击者的命中率大幅下降",
StrDescNum="skill_desc_str[18].strName;skill_desc_str[19].strName",
StrFuncdesc=_t"使自己能够获得更多的斗志",
SkillSoul={ 
   [4286] = { desc=_t"持续期间附带2米加速、15%%减伤的效果"},
   [5674] = { desc=_t"持续期间每2秒回复生命上限的1%%"},
} ,
}

skill_desc_str[65]=
{
strName=_t"杂兵壮——普攻技能",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "杂兵壮——普攻技能",
StrUseDesc=_t "杂兵壮——普攻技能",
}

skill_desc_str[66]=
{
strName=_t"开启黄泉之井_透明怪_让第一波怪变阵营",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "开启黄泉之井_透明怪_让第一波怪变阵营",
StrUseDesc=_t "开启黄泉之井_透明怪_让第一波怪变阵营",
}

skill_desc_str[67]=
{
strName=_t"结晶之环",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r使目标移动速度减少60%%，持续6秒\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962曙光女神之怒]^FFFF00\r^c0c0ff伤害提升100%%，并100%%溅射目标周围的敌人\r同时可将目标冻结",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r造成%d%%的伤害\r使目标移动速度减少60%%，持续6秒\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962曙光女神之怒]^FFFF00\r^c0c0ff伤害提升100%%，并100%%溅射目标周围的敌人\r同时可将目标冻结",
StrDescNum="0.3*level*level+35.33*level+368.37;0.28*level*level+33.19*level+345.53;100*(0.0175*level+2.07)",
StrFuncdesc=_t"催动冻气，打击并减速目标及其身边单位",
SkillSoul={ 
   [1833] = { desc=_t"被减速的单位水属性抗性下降%d点，持续6秒",num="25+15*player.skilllevel[4095]"},
   [1834] = { desc=_t"目标被诅咒，伤害减少25%%，持续6秒"},
   [4292] = { desc=_t"对于被寒冰减速或者冰冻的单位，伤害提升25%%"},
   [5677] = { desc=_t"主目标受到的下5次伤害提升30%%"},
} ,
}

skill_desc_str[68]=
{
strName=_t"钻石巨拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r攻击3次，共造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r攻击3次，共造成%d%%的伤害",
StrDescNum="0.16*level*level+15.84*level+32;0.11*level*level+11.2*level+22.69;100*(0.0098*level+1.09)",
StrFuncdesc=_t"白鸟座的基础招式，远程攻击目标",
}

skill_desc_str[69]=
{
strName=_t"星尘拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r攻击2次，共造成{^FFABFC%d%%^FFFF00}的伤害\r使用将增加20点冻气\r\t^00FF00水瓶座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r攻击2次，共造成%d%%的伤害\r使用将增加20点冻气\r\t^00FF00水瓶座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发",
StrDescNum="0.2*level*level+19.4*level+38.4;0.17*level*level+16.88*level+33.95;100*(0.0147*level+1.64)",
StrFuncdesc=_t"白鸟座的进阶招式，运用极地冰寒伤害目标",
SkillSoul={ 
   [1836] = { desc=_t"使用后的8秒内，下一次消耗的冻气减少50%%"},
} ,
}

skill_desc_str[70]=
{
strName=_t"曙光女神的宽恕",
StrAttacktype=_t"主动攻击",
StrMana=_t "消耗%d点冻气",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r冰霜路径宽度:6米\r攻击9次，共造成{^FFABFC%d%%^FFFF00}的伤害\r能够将选中的目标击倒3秒，每次打击都击退目标1米",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r冰霜路径宽度:6米\r攻击9次，共造成%d%%的伤害\r能够将选中的目标击倒3秒，每次打击都击退目标1米",
StrDescNum="0.26*level*level+39.3*level+855.44;0.44*level*level+65.28*level+1424.28;100*(0.054*level+7.35)",
StrFuncdesc=_t"白鸟座的终极奥义，以曙光女神的冰霜轰击目标，冰霜会对其经过的路径上的敌人产生溅射伤害，技能开始施放时附加4秒免控",
SkillSoul={ 
   [1838] = { desc=_t"冷却时间下降20秒%s",num="player.skilllevel[4096]>0 and ',冻气消耗减少30点 'or ''"},
   [4292] = { desc=_t"对于被寒冰减速或者冰冻的单位，伤害提升25%%"},
} ,
}

skill_desc_str[71]=
{
strName=_t"冰霜炸弹",
StrAttacktype=_t"召唤技能",
StrMana=_t "消耗%d点冻气",
StrCompDesc=_t "炸弹数量:%d\r炸弹附加攻击力:{^FFABFC%d^FFFF00}\r炸弹水属性攻击力:{^FFABFC%d^FFFF00}\r每个炸弹爆炸对周围3米的目标造成{^FFABFC%d%%^FFFF00}的伤害\r炸弹最多存在8秒\t^00FF00用键盘或右键按住快捷键不放可以蓄力：^FFFF00\r炸弹数量:3\r每个炸弹爆炸对周围3米的目标造成{^FFABFC%d%%^FFFF00}的伤害\r炸弹移动速度:6米/秒",
StrUseDesc=_t "炸弹数量:%d\r炸弹附加攻击力:%d\r炸弹水属性攻击力:%d\r每个炸弹爆炸对周围3米的目标造成%d%%的伤害\r炸弹最多存在8秒\t^00FF00用键盘或右键按住快捷键不放可以蓄力：^FFFF00\r炸弹数量:3\r每个炸弹爆炸对周围3米的目标造成%d%%的伤害\r炸弹移动速度:6米/秒",
StrDescNum="5+t2;0.19*level*level+19.33*level+65.48;0.11*level*level+11.44*level+39.45;100*1.5*(0.007*level+0.77);100*1.5*(0.007*level+0.77)*(1+0.2*t2)",
StrFuncdesc=_t"在自己身前召唤多个寒冰炸弹攻击附近的敌人\r可以蓄力1秒，蓄满力后可以召出会自动锁定目标的炸弹",
SkillSoul={ 
   [1830] = { desc=_t"不蓄力时，炸弹数量增加1颗；蓄力时，炸弹伤害提升20%%"},
   [1837] = { desc=_t"使用后会在自己身上生成冰壁，抵御下次伤害，冰壁生成后存在60秒，不可叠加"},
   [1839] = { desc=_t"使用后自己和周围12米范围内的队友伤害倍率增加5%%%s，持续10秒，不可叠加",num="player.skilllevel[4097]>0 and '暴击率增加5%' or ' '"},
   [1841] = { desc=_t"对于已经被寒冰减速的单位，被静止的炸弹伤害后会被冰封住3秒"},
} ,
}

skill_desc_str[72]=
{
strName=_t"发通知技能",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "发通知技能",
StrUseDesc=_t "发通知技能",
}

skill_desc_str[73]=
{
strName=_t"开井_远程小弟大伤害技能",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "开井_远程小弟大伤害技能",
StrUseDesc=_t "开井_远程小弟大伤害技能",
}

skill_desc_str[74]=
{
strName=_t"开井_三头犬_扇形AOE",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "开井_三头犬_扇形AOE",
StrUseDesc=_t "开井_三头犬_扇形AOE",
}

skill_desc_str[75]=
{
strName=_t"开井_地狱三头犬最终大招",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "开井_地狱三头犬最终大招",
StrUseDesc=_t "开井_地狱三头犬最终大招",
}

skill_desc_str[76]=
{
strName=_t"三环双鱼-美神变身",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "三环双鱼-美神变身",
StrUseDesc=_t "三环双鱼-美神变身",
}

skill_desc_str[77]=
{
strName=_t"白鸟之舞",
StrAttacktype=_t"主动攻击",
StrMana=_t "消耗%d点冻气",
StrCompDesc=_t "半径：3米\r减速：60%%\r减速持续时间：4秒\r自己后跃12米",
StrUseDesc=_t "半径：3米\r减速：60%%\r减速持续时间：4秒\r自己后跃12米",
StrFuncdesc=_t"在原地释放强大的寒气，使周围敌人减速.同时自己跳向后方",
SkillSoul={ 
   [1831] = { desc=_t"使用后自身获得移动速度提升5米/秒的效果，最多持续8秒，受到伤害则该效果中断%s",num="player.skilllevel[4094]>0 and '，发动时回复攻击力1.7倍的生命' or ''"},
   [1833] = { desc=_t"被减速的单位水属性抗性下降%d点，持续6秒",num="25+15*player.skilllevel[4095]"},
} ,
}

skill_desc_str[78]=
{
strName=_t"寒冷的龙卷风",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "持续召唤冰风连续打击目标区域，每秒打击一次区域半径:5米\r附加攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "持续召唤冰风连续打击目标区域，每秒打击一次区域半径:5米\r附加攻击力:%d\r附加风属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="0.11*level*level+12.71*level+131.18;0.04*level*level+4.25*level+43.71;100*(0.0023*level+0.27)",
StrFuncdesc=_t"催动冰风持续伤害目标区域",
}

skill_desc_str[79]=
{
strName=_t"开启黄泉之井_透明怪_让第二波怪变阵营",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "开启黄泉之井_透明怪_让第二波怪变阵营",
StrUseDesc=_t "开启黄泉之井_透明怪_让第二波怪变阵营",
}

skill_desc_str[80]=
{
strName=_t"破碎",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^c0c0ff[%s]^FFFF00^c0c0ff[%s]^FFFF00能够减少目标{^FFABFC%d^FFFF00}点防御力和10点全属性抗性",
StrUseDesc=_t "使得^c0c0ff[%s]^FFFF00^c0c0ff[%s]^FFFF00能够减少目标%d点防御力和10点全属性抗性",
StrDescNum="skill_desc_str[86].strName;skill_desc_str[84].strName;0.32*level*level+16.57*level+59.78",
}

skill_desc_str[81]=
{
strName=_t"龙之拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r打击4次，共造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r打击4次，共造成%d%%的伤害",
StrDescNum="0.16*level*level+15.84*level+32;0.12*level*level+12.26*level+24.62;100*(0.0147*level+1.63)",
StrFuncdesc=_t"天龙座的基础招式，快速出拳打击目标",
}

skill_desc_str[82]=
{
strName=_t"龙爪斩翔",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r自身进入^c0c0ff[亢龙愈合]^FFFF00状态，持续6秒，该状态下共会回复8%%最大血量，并有10%%的伤害减免效果",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r造成%d%%的伤害\r自身进入^c0c0ff[亢龙愈合]^FFFF00状态，持续6秒，该状态下共会回复8%%最大血量，并有10%%的伤害减免效果",
StrDescNum="0.24*level*level+24.19*level+82.57;0.2*level*level+20.7*level+71.1;100*(0.0127*level+1.39)",
StrFuncdesc=_t"以锋利的龙爪攻击目标，并回复生命",
SkillSoul={ 
   [936] = { desc=_t"使用后，有50%%的概率使目标减速6秒"},
   [938] = { desc=_t"附带一个持续6秒的持续伤害效果，同时对怪物附加抓伤状态，使怪物的伤害倍率下降10%%"},
   [944] = { desc=_t"龙魂裂魄期间伤害提升30%%"},
   [947] = { desc=_t"该技能暴击率提升40%%"},
} ,
}

skill_desc_str[83]=
{
strName=_t"庐山龙飞翔",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\t^00FF00用键盘或右键按住快捷键不放可以蓄力：^FFFF00\r蓄力后最多能额外提升50%%的技能伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r造成%d%%的伤害\t^00FF00用键盘或右键按住快捷键不放可以蓄力：^FFFF00\r蓄力后最多能额外提升50%%的技能伤害",
StrDescNum="0.24*level*level+29.88*level+370.88;0.25*level*level+30.82*level+382.93;100*(0.026*level+3.19)",
StrFuncdesc=_t"化为神龙，以龙头冲击目标，穿到目标身前，最远可以追击10米\r可以蓄力1秒，蓄力后伤害大幅提升",
SkillSoul={ 
   [936] = { desc=_t"有几率将目标击倒3秒，几率和蓄力时间有关，蓄满后为100%%"},
   [941] = { desc=_t"释放距离增加4米"},
   [947] = { desc=_t"该技能暴击率提升40%%"},
   [4299] = { desc=_t"使自己和周围6米的队友提升30%%的伤害抗性，持续6秒"},
} ,
}

skill_desc_str[84]=
{
strName=_t"龙之索",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "把敌方目标和其周围6米的单位拉到自己身前（如果要拉的是敌方玩家，只有当他是你选中的目标时才生效）\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962黄金锁链]^FFFF00\r^c0c0ff将目标拉至身前的同时，可将自身周围的怪物拉至身边，对主目标造成倒地效果",
StrUseDesc=_t "把敌方目标和其周围6米的单位拉到自己身前（如果要拉的是敌方玩家，只有当他是你选中的目标时才生效）\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962黄金锁链]^FFFF00\r^c0c0ff将目标拉至身前的同时，可将自身周围的怪物拉至身边，对主目标造成倒地效果",
StrFuncdesc=_t"用盘龙之索套取目标，把目标拉到自己身边\r同时可取消主目标的飞行状态",
}

skill_desc_str[85]=
{
strName=_t"真龙连牙",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "消耗%d%%的当前生命\r附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r攻击6次，共造成{^FFABFC%d%%^FFFF00}的伤害\r\t^00FF00天秤座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发",
StrUseDesc=_t "消耗%d%%的当前生命\r附加攻击力:%d\r附加地属性攻击力:%d\r攻击6次，共造成%d%%的伤害\r\t^00FF00天秤座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发",
StrDescNum="5-5*player.skilllevel[937];0.23*level*level+25.11*level+153.66;0.26*level*level+28.16*level+173.58;100*(0.031*level+3.56)",
StrFuncdesc=_t"天龙座会不惜任何代价，击败敌人，即使是以命换命！消耗自己的的生命，疯狂地攻击目标",
SkillSoul={ 
   [937] = { desc=_t"使用时不消耗生命值"},
} ,
}

skill_desc_str[86]=
{
strName=_t"狂龙之吼",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "嘲讽一个目标，使其强制攻击自己（对玩家无效）",
StrUseDesc=_t "嘲讽一个目标，使其强制攻击自己（对玩家无效）",
StrFuncdesc=_t"向怪物发出极具威慑的怒吼，使其丧失自主意识",
}

skill_desc_str[87]=
{
strName=_t"庐山龙咆哮",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "打击自身周围圆形6米范围的目标，造成大量仇恨\r附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "打击自身周围圆形6米范围的目标，造成大量仇恨\r附加攻击力:%d\r附加地属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="0.11*level*level+13.38*level+138.51;0.04*level*level+4.55*level+46.41;100*(0.004*level+0.47)",
StrFuncdesc=_t"借龙咆哮之威，对周围敌人造成巨大仇恨",
SkillSoul={ 
   [940] = { desc=_t"每多作用到一个目标，自身的伤害抗性都额外增加1%%，最多叠10层，持续6秒"},
} ,
}

skill_desc_str[88]=
{
strName=_t"龙纹之盾",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "以龙纹之盾保护自己，最多吸收自己生命上限35%%的伤害，持续6秒\r开启护盾后的30秒内，你的下一次^c0c0ff[%s]^FFFF00伤害将大幅提高，并且附带减速效果，减少60%%的移动速度，持续4秒\r处于浮空、倒地、冰冻、石化、沉默、混乱状态下也可使用",
StrUseDesc=_t "以龙纹之盾保护自己，最多吸收自己生命上限35%%的伤害，持续6秒\r开启护盾后的30秒内，你的下一次^c0c0ff[%s]^FFFF00伤害将大幅提高，并且附带减速效果，减少60%%的移动速度，持续4秒\r处于浮空、倒地、冰冻、石化、沉默、混乱状态下也可使用",
StrDescNum="skill_desc_str[87].strName",
StrFuncdesc=_t"给自己加上龙纹之盾保护自己，使自己免受伤害",
}

skill_desc_str[89]=
{
strName=_t"紫龙-解控制",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "紫龙-解控制",
StrUseDesc=_t "紫龙-解控制",
}

skill_desc_str[90]=
{
strName=_t"紫龙-破釜沉舟",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "紫龙-破釜沉舟",
StrUseDesc=_t "紫龙-破釜沉舟",
}

skill_desc_str[91]=
{
strName=_t"紫龙-龙回天",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "紫龙-回光返照",
StrUseDesc=_t "紫龙-回光返照",
}

skill_desc_str[92]=
{
strName=_t"圣剑",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r矩形宽6米，长10米",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r造成%d%%的伤害\r矩形宽6米，长10米",
StrDescNum="0.22*level*level+29.6*level+538.18;0.27*level*level+37.07*level+672.66;100*(0.0269*level+3.44)",
StrFuncdesc=_t"圣剑一出，谁与争辉\r击倒并重创目标方向矩形范围内的单位",
SkillSoul={ 
   [945] = { desc=_t"冷却下降15秒，并附带诅咒效果，减少移动速度且伤害减少30%%，持续6秒"},
   [4298] = { desc=_t"能重置[%s]、[%s]的冷却时间",num="skill_desc_str[84].strName;skill_desc_str[85].strName"},
   [4300] = { desc=_t"使得圣剑变为三段，伤害提升50%%"},
   [5680] = { desc=_t"目标生命低于50%%时，其生命越低，造成的倒地时间越长，最多可增加3秒"},
   [5682] = { desc=_t"燃魂状态下，被击倒的目标将无法回复生命"},
} ,
}

skill_desc_str[93]=
{
strName=_t"升龙霸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r追到目标身前，并把目标打浮空\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962百龙霸]^FFFF00\r^c0c0ff伤害范围大幅增加，对主目标造成长时间的击倒\r同时可100%%溅射其他敌方单位\r不再有前冲效果",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r造成%d%%的伤害\r追到目标身前，并把目标打浮空\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962百龙霸]^FFFF00\r^c0c0ff伤害范围大幅增加，对主目标造成长时间的击倒\r同时可100%%溅射其他敌方单位\r不再有前冲效果",
StrDescNum="0.22*level*level+29.02*level+416.76;0.29*level*level+37.39*level+539.32;100*(0.0283*level+3.55)*(1-0.3*player.skilllevel[942])",
StrFuncdesc=_t"用能将庐山大瀑布逆流的神拳击飞目标",
SkillSoul={ 
   [941] = { desc=_t"释放距离增加4米"},
   [942] = { desc=_t"冷却时间减少15秒，目标浮空后附带8秒的减速；技能伤害下降30%%"},
   [947] = { desc=_t"该技能暴击率提升40%%"},
   [4299] = { desc=_t"使自己和周围6米的队友提升30%%的伤害抗性，持续6秒"},
   [5682] = { desc=_t"燃魂状态下，被击飞的目标将无法回复生命"},
} ,
}

skill_desc_str[94]=
{
strName=_t"龙魂烈燃",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "进入^00FF00燃魂^FFFF00状态，实力大幅提升，持续45秒\t^00FF00燃魂^FFFF00\r提高30%%的生命上限，并获得这么多生命\r^c0c0ff[%s]^FFFF00的伤害提高50%%，发动时消耗的生命提高100%%\r^c0c0ff[%s]^FFFF00得到强化，并且冷却时间减少2秒",
StrUseDesc=_t "进入^00FF00燃魂^FFFF00状态，实力大幅提升，持续45秒\t^00FF00燃魂^FFFF00\r提高30%%的生命上限，并获得这么多生命\r^c0c0ff[%s]^FFFF00的伤害提高50%%，发动时消耗的生命提高100%%\r^c0c0ff[%s]^FFFF00得到强化，并且冷却时间减少2秒",
StrDescNum="skill_desc_str[85].strName;skill_desc_str[82].strName",
StrFuncdesc=_t"天龙座将身上的龙纹能够最大幅度的发挥威力",
}

skill_desc_str[95]=
{
strName=_t"开井_测试怪物变身的有效果技能",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "开井_测试怪物变身的有效果技能",
StrUseDesc=_t "开井_测试怪物变身的有效果技能",
}

skill_desc_str[96]=
{
strName=_t"三环双鱼-双鱼座-白色玫瑰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "三环双鱼-双鱼座-白色玫瑰",
StrUseDesc=_t "三环双鱼-双鱼座-白色玫瑰",
}

skill_desc_str[97]=
{
strName=_t"三环双鱼-双鱼座-红色玫瑰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "三环双鱼-双鱼座-红色玫瑰",
StrUseDesc=_t "三环双鱼-双鱼座-红色玫瑰",
}

skill_desc_str[98]=
{
strName=_t"三环双鱼-双鱼座-黑色玫瑰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "三环双鱼-双鱼座-黑色玫瑰",
StrUseDesc=_t "三环双鱼-双鱼座-黑色玫瑰",
}

skill_desc_str[99]=
{
strName=_t"冰柩",
StrAttacktype=_t"主动诅咒",
StrCompDesc=_t "将目标极冻隔离%d秒\r极冻期间目标无法动弹，冰冻的冰块最多承受%d的伤害\r如果在冰冻结束前打破冰块，则目标会受到%d点伤害",
StrUseDesc=_t "将目标极冻隔离%d秒\r极冻期间目标无法动弹，冰冻的冰块最多承受%d的伤害\r如果在冰冻结束前打破冰块，则目标会受到%d点伤害",
StrDescNum="6+3*t2;t1*(0.000229*level*level+0.002*level+0.75)+1.41*level*level+82.27*level+1217.67;2*(t1*(0.000229*level*level+0.002*level+0.75)+1.41*level*level+82.27*level+1217.67)",
StrFuncdesc=_t"用深寒之力将目标冰封",
SkillSoul={ 
   [1835] = { desc=_t"冰冻持续时间增加3秒，冷却时间下降15秒"},
   [4294] = { desc=_t"冰冻结束后，目标将受到强烈的诅咒，在接下来的5秒内将无法恢复生命"},
   [5678] = { desc=_t"生命降至40%%以下时，立即重置冷却，该效果至少每30秒才能触发一次"},
} ,
}

skill_desc_str[100]=
{
strName=_t"AOE-伤害",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "将敌方目标冰封隔离，期间目标不会受到任何伤害，也无法行动，持续6秒",
StrUseDesc=_t "将敌方目标冰封隔离，期间目标不会受到任何伤害，也无法行动，持续6秒",
}

skill_desc_str[101]=
{
strName=_t"AOE-自爆",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "AOE-自爆",
StrUseDesc=_t "AOE-自爆",
}

skill_desc_str[102]=
{
strName=_t"AOE-减速",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "AOE-减速",
StrUseDesc=_t "AOE-减速",
}

skill_desc_str[103]=
{
strName=_t"测试_石柱_砸怪",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "测试_石柱_砸怪",
StrUseDesc=_t "测试_石柱_砸怪",
}

skill_desc_str[104]=
{
strName=_t"雪暴雷云",
StrAttacktype=_t"召唤技能",
StrMana=_t "消耗%d点冻气",
StrCompDesc=_t "风暴半径:5米\r闪电间隔:2秒\r风暴持续时间:12秒\r附加攻击力:{^FFABFC%d^FFFF00}\r附带风属性攻击力:{^FFABFC%d^FFFF00}\r风暴出现时造成{^FFABFC%d%%^FFFF00}的伤害，并减速3秒\r每次雷击造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "风暴半径:5米\r闪电间隔:2秒\r风暴持续时间:12秒\r附加攻击力:%d\r附带风属性攻击力:%d\r风暴出现时造成%d%%的伤害，并减速3秒\r每次雷击造成%d%%的伤害",
StrDescNum="0.14*level*level+16.12*level+134.74;0.11*level*level+12.31*level+102.58;100*2.1*(0.008*level+0.92);100*(0.008*level+0.92)",
StrFuncdesc=_t"召唤一个强大的风暴，使范围内的所有敌人受到伤害，风暴初始附带一个较大的伤害和减速效果",
SkillSoul={ 
   [1832] = { desc=_t"每次雷击有20%%的概率将目标击晕2秒"},
   [1837] = { desc=_t"使用后会在自己身上生成冰壁，抵御下次伤害，冰壁生成后存在60秒，不可叠加"},
   [1839] = { desc=_t"使用后自己和周围12米范围内的队友伤害倍率增加5%%%s，持续10秒，不可叠加",num="player.skilllevel[4097]>0 and '暴击率增加5%' or ' '"},
} ,
}

skill_desc_str[105]=
{
strName=_t"静止之冻土",
StrAttacktype=_t"召唤技能",
StrMana=_t "消耗%d点冻气",
StrCompDesc=_t "冻土半径:4米\r移动速度下降:60%%\r目标的防御力下降:%d\r冻土持续10秒",
StrUseDesc=_t "冻土半径:4米\r移动速度下降:60%%\r目标的防御力下降:%d\r冻土持续10秒",
StrDescNum="(player.damagehigh+player.damagelow)/2*0.6",
StrFuncdesc=_t"召唤出冻土，降低范围内所有敌人的移动速度、防御力",
SkillSoul={ 
   [1833] = { desc=_t"被减速的单位水属性抗性下降%d点，持续6秒",num="25+15*player.skilllevel[4095]"},
   [1837] = { desc=_t"使用后会在自己身上生成冰壁，抵御下次伤害，冰壁生成后存在60秒，不可叠加"},
   [1839] = { desc=_t"使用后自己和周围12米范围内的队友伤害倍率增加5%%%s，持续10秒，不可叠加",num="player.skilllevel[4097]>0 and '暴击率增加5%' or ' '"},
} ,
}

skill_desc_str[106]=
{
strName=_t"开井_测试怪物变身的有效果技能2",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "开井_测试怪物变身的有效果技能2",
StrUseDesc=_t "开井_测试怪物变身的有效果技能2",
}

skill_desc_str[107]=
{
strName=_t"连-水晶反射",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "连-水晶反射",
StrUseDesc=_t "连-水晶反射",
}

skill_desc_str[108]=
{
strName=_t"连-水晶破碎击飞",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "连-水晶破碎击飞",
StrUseDesc=_t "连-水晶破碎击飞",
}

skill_desc_str[109]=
{
strName=_t"连-不破的黄金野牛",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "连-不破的黄金野牛",
StrUseDesc=_t "连-不破的黄金野牛",
}

skill_desc_str[110]=
{
strName=_t"连-回荡的吼声",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "连-回荡的吼声",
StrUseDesc=_t "连-回荡的吼声",
}

skill_desc_str[111]=
{
strName=_t"连-阿鲁迪巴的破绽",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "连-阿鲁迪巴的破绽",
StrUseDesc=_t "连-阿鲁迪巴的破绽",
}

skill_desc_str[112]=
{
strName=_t"连-挥向阿鲁迪巴之拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "连-挥向阿鲁迪巴之拳",
StrUseDesc=_t "连-挥向阿鲁迪巴之拳",
}

skill_desc_str[113]=
{
strName=_t"升龙阵",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "伤害减免：%d%%\r持续时间：%d秒\r范围半径：5米\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962天秤武库【守】]^FFFF00\r^c0c0ff召唤黄金力量守护阵，防护能力大幅提升",
StrUseDesc=_t "伤害减免：%d%%\r持续时间：%d秒\r范围半径：5米\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962天秤武库【守】]^FFFF00\r^c0c0ff召唤黄金力量守护阵，防护能力大幅提升",
StrDescNum="player.skilllevel[943]*10+50;8-2*player.skilllevel[943]+2*t1*t2",
StrFuncdesc=_t"天龙能够唤醒自己内心强大的守护之力，保护自己和周围的队友",
SkillSoul={ 
   [943] = { desc=_t"冷却时间减少30秒，减伤效果额外提升10%%%s",num="player.skilllevel[4101]>0 and ''or '，持续时间减少2秒'"},
   [5681] = { desc=_t"范围内的自己和队友所有异常抗性增加20点"},
} ,
}

skill_desc_str[114]=
{
strName=_t"测试-主目标伤害加成",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "测试-主目标伤害加成",
StrUseDesc=_t "测试-主目标伤害加成",
}

skill_desc_str[115]=
{
strName=_t"包击中效果1",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "包击中效果1",
StrUseDesc=_t "包击中效果1",
}

skill_desc_str[116]=
{
strName=_t"包击中效果2",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "包击中效果2",
StrUseDesc=_t "包击中效果2",
}

skill_desc_str[117]=
{
strName=_t"包击中效果3",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "包击中效果3",
StrUseDesc=_t "包击中效果3",
}

skill_desc_str[118]=
{
strName=_t"包击中效果4",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "包击中效果4",
StrUseDesc=_t "包击中效果4",
}

skill_desc_str[119]=
{
strName=_t"包击中效果5",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "包击中效果5",
StrUseDesc=_t "包击中效果5",
}

skill_desc_str[120]=
{
strName=_t"包击中效果6",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "包击中效果6",
StrUseDesc=_t "包击中效果6",
}

skill_desc_str[121]=
{
strName=_t"天箭座-连射箭",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天箭座-连射箭",
StrUseDesc=_t "天箭座-连射箭",
}

skill_desc_str[122]=
{
strName=_t"天箭座-夺命箭",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天箭座-夺命箭",
StrUseDesc=_t "天箭座-夺命箭",
}

skill_desc_str[123]=
{
strName=_t"天箭座-电光穿行",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天箭座-电光穿行",
StrUseDesc=_t "天箭座-电光穿行",
}

skill_desc_str[124]=
{
strName=_t"天箭座-高速狩猎",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天箭座-高速狩猎",
StrUseDesc=_t "天箭座-高速狩猎",
}

skill_desc_str[125]=
{
strName=_t"蜥蜴座-云石旋风拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "蜥蜴座-云石旋风拳",
StrUseDesc=_t "蜥蜴座-云石旋风拳",
}

skill_desc_str[126]=
{
strName=_t"蜥蜴座-旋风屏障",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "蜥蜴座-旋风屏障",
StrUseDesc=_t "蜥蜴座-旋风屏障",
}

skill_desc_str[127]=
{
strName=_t"英仙座-蛇发恶魔首",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "英仙座-蛇发恶魔首",
StrUseDesc=_t "英仙座-蛇发恶魔首",
}

skill_desc_str[128]=
{
strName=_t"英仙座-美杜莎之盾",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "英仙座-美杜莎之盾",
StrUseDesc=_t "英仙座-美杜莎之盾",
}

skill_desc_str[129]=
{
strName=_t"乌鸦座-黑色旋风",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "乌鸦座-黑色旋风",
StrUseDesc=_t "乌鸦座-黑色旋风",
}

skill_desc_str[130]=
{
strName=_t"乌鸦座-乌鸦尖嚎",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "乌鸦座-乌鸦尖嚎",
StrUseDesc=_t "乌鸦座-乌鸦尖嚎",
}

skill_desc_str[131]=
{
strName=_t"白鸟裂踢",
StrAttacktype=_t"主动攻击",
StrMana=_t "消耗%d点冻气",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="0.17*level*level+20.64*level+256.19;0.14*level*level+17.13*level+213.73;100*(0.0135*level+1.66)",
StrFuncdesc=_t"将近身的目标冰冻之后踢飞",
SkillSoul={ 
   [1834] = { desc=_t"目标被诅咒，伤害减少25%%，持续6秒"},
} ,
}

skill_desc_str[132]=
{
strName=_t"怪物通用-自杀",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "怪物通用-自杀",
StrUseDesc=_t "怪物通用-自杀",
}

skill_desc_str[133]=
{
strName=_t"三环双鱼-美神变身",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "三环双鱼-美神变身",
StrUseDesc=_t "三环双鱼-美神变身",
}

skill_desc_str[134]=
{
strName=_t"女神鼓舞",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "用爱和美的方式去传播美神强大的小宇宙，提高周围队友50%%的攻击力，需要持续施法",
StrUseDesc=_t "用爱和美的方式去传播美神强大的小宇宙，提高周围队友50%%的攻击力，需要持续施法",
}

skill_desc_str[135]=
{
strName=_t"少女的祈祷",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "美神赐予治愈系的力量，可以为周围友军恢复大量生命值",
StrUseDesc=_t "美神赐予治愈系的力量，可以为周围友军恢复大量生命值",
}

skill_desc_str[136]=
{
strName=_t"战斗外HP药技能",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "战斗外HP药技能",
StrUseDesc=_t "战斗外HP药技能",
}

skill_desc_str[137]=
{
strName=_t"绷带",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "战斗内续航HP药技能",
StrUseDesc=_t "战斗内续航HP药技能",
}

skill_desc_str[138]=
{
strName=_t"战斗内应急HP药技能",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "战斗内应急HP药技能",
StrUseDesc=_t "战斗内应急HP药技能",
}

skill_desc_str[139]=
{
strName=_t"RMB瞬回HP药技能",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "RMB瞬回HP药技能",
StrUseDesc=_t "RMB瞬回HP药技能",
}

skill_desc_str[140]=
{
strName=_t"仙皇座-铁链捆缚",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "仙皇座-铁链捆缚",
StrUseDesc=_t "仙皇座-铁链捆缚",
}

skill_desc_str[141]=
{
strName=_t"仙皇座-连锁铁链防御",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "仙皇座-连锁铁链防御",
StrUseDesc=_t "仙皇座-连锁铁链防御",
}

skill_desc_str[142]=
{
strName=_t"仙皇座-结束铁索防御",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "仙皇座-结束铁索防御",
StrUseDesc=_t "仙皇座-结束铁索防御",
}

skill_desc_str[143]=
{
strName=_t"副本进入测试1",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "副本进入测试1",
StrUseDesc=_t "副本进入测试1",
}

skill_desc_str[144]=
{
strName=_t"副本进入测试2",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "副本进入测试2",
StrUseDesc=_t "副本进入测试2",
}

skill_desc_str[145]=
{
strName=_t"副本进入条件测试3",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "副本进入条件测试3",
StrUseDesc=_t "副本进入条件测试3",
}

skill_desc_str[146]=
{
strName=_t"副本进入条件测试4",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "副本进入条件测试4",
StrUseDesc=_t "副本进入条件测试4",
}

skill_desc_str[147]=
{
strName=_t"副本进入条件测试5",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "副本进入条件测试5",
StrUseDesc=_t "副本进入条件测试5",
}

skill_desc_str[148]=
{
strName=_t"个人连环挑战_怪物1高防御技能",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "个人连环挑战_怪物1高防御技能",
StrUseDesc=_t "个人连环挑战_怪物1高防御技能",
}

skill_desc_str[149]=
{
strName=_t"个人连环挑战_怪物2高攻击技能",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "个人连环挑战_怪物2高攻击技能",
StrUseDesc=_t "个人连环挑战_怪物2高攻击技能",
}

skill_desc_str[150]=
{
strName=_t"个人连环挑战_怪物2高攻击技能",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "个人连环挑战_怪物2高攻击技能",
StrUseDesc=_t "个人连环挑战_怪物2高攻击技能",
}

skill_desc_str[151]=
{
strName=_t"连_获得武器",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "连_获得武器",
StrUseDesc=_t "连_获得武器",
}

skill_desc_str[152]=
{
strName=_t"连_挥舞武器",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "连_挥舞武器",
StrUseDesc=_t "连_挥舞武器",
}

skill_desc_str[153]=
{
strName=_t"连_投掷武器",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "连_投掷武器",
StrUseDesc=_t "连_投掷武器",
}

skill_desc_str[154]=
{
strName=_t"紫龙-基础输出",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "紫龙-基础输出",
StrUseDesc=_t "紫龙-基础输出",
}

skill_desc_str[155]=
{
strName=_t"测试-buff",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "测试-buff",
StrUseDesc=_t "测试-buff",
}

skill_desc_str[156]=
{
strName=_t"连-阿鲁迪巴的回馈",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "连-阿鲁迪巴的回馈",
StrUseDesc=_t "连-阿鲁迪巴的回馈",
}

skill_desc_str[157]=
{
strName=_t"圣光沐浴",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "净化世间污秽的纯粹能量，可以解除一切负面的状态效果",
StrUseDesc=_t "净化世间污秽的纯粹能量，可以解除一切负面的状态效果",
}

skill_desc_str[158]=
{
strName=_t"开启黄泉之井_透明怪_让第一波怪变阵营2",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "开启黄泉之井_透明怪_让第一波怪变阵营2",
StrUseDesc=_t "开启黄泉之井_透明怪_让第一波怪变阵营2",
}

skill_desc_str[159]=
{
strName=_t"加速光效测试",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "加速光效测试",
StrUseDesc=_t "加速光效测试",
}

skill_desc_str[160]=
{
strName=_t"经验获得加速光效测试",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "经验获得加速光效测试",
StrUseDesc=_t "经验获得加速光效测试",
}

skill_desc_str[161]=
{
strName=_t"伤害倍率提高光效测试",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "伤害倍率提高光效测试",
StrUseDesc=_t "伤害倍率提高光效测试",
}

skill_desc_str[162]=
{
strName=_t"攻击力提高光效测试",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "攻击力提高光效测试",
StrUseDesc=_t "攻击力提高光效测试",
}

skill_desc_str[163]=
{
strName=_t"无敌光效测试",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "无敌光效测试",
StrUseDesc=_t "无敌光效测试",
}

skill_desc_str[164]=
{
strName=_t"暴击率提升光效测试",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "暴击率提升光效测试",
StrUseDesc=_t "暴击率提升光效测试",
}

skill_desc_str[165]=
{
strName=_t"中毒光效测试",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "中毒光效测试",
StrUseDesc=_t "中毒光效测试",
}

skill_desc_str[166]=
{
strName=_t"霜冻光效测试",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "霜冻光效测试",
StrUseDesc=_t "霜冻光效测试",
}

skill_desc_str[167]=
{
strName=_t"冰封光效测试",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "冰封光效测试",
StrUseDesc=_t "冰封光效测试",
}

skill_desc_str[168]=
{
strName=_t"诅咒光效测试",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "诅咒光效测试",
StrUseDesc=_t "诅咒光效测试",
}

skill_desc_str[169]=
{
strName=_t"虚弱光效测试",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "虚弱光效测试",
StrUseDesc=_t "虚弱光效测试",
}

skill_desc_str[170]=
{
strName=_t"流血光效测试",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "流血光效测试",
StrUseDesc=_t "流血光效测试",
}

skill_desc_str[171]=
{
strName=_t"眩晕光效测试",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "眩晕光效测试",
StrUseDesc=_t "眩晕光效测试",
}

skill_desc_str[172]=
{
strName=_t"石化光效测试",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "石化光效测试",
StrUseDesc=_t "石化光效测试",
}

skill_desc_str[173]=
{
strName=_t"沉睡光效测试",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "沉睡光效测试",
StrUseDesc=_t "沉睡光效测试",
}

skill_desc_str[174]=
{
strName=_t"灼烧光效测试",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "灼烧光效测试",
StrUseDesc=_t "灼烧光效测试",
}

skill_desc_str[175]=
{
strName=_t"沉默光效测试",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "沉默光效测试",
StrUseDesc=_t "沉默光效测试",
}

skill_desc_str[176]=
{
strName=_t"开启黄泉之井_透明怪_让第三波怪变阵营",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "开启黄泉之井_透明怪_让第三波怪变阵营",
StrUseDesc=_t "开启黄泉之井_透明怪_让第三波怪变阵营",
}

skill_desc_str[177]=
{
strName=_t"连-石柱坍塌",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "连-石柱坍塌",
StrUseDesc=_t "连-石柱坍塌",
}

skill_desc_str[178]=
{
strName=_t"条件触发技能测试",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "条件触发技能测试",
StrUseDesc=_t "条件触发技能测试",
}

skill_desc_str[179]=
{
strName=_t"闯宫-黄金野牛之光",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "闯宫-黄金野牛之光",
StrUseDesc=_t "闯宫-黄金野牛之光",
}

skill_desc_str[180]=
{
strName=_t"紫龙-拉怪-浮空测试",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "紫龙-拉怪-浮空测试",
StrUseDesc=_t "紫龙-拉怪-浮空测试",
}

skill_desc_str[181]=
{
strName=_t"三环狮子-火堆-灼烧",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "三环狮子-火堆-灼烧",
StrUseDesc=_t "三环狮子-火堆-灼烧",
}

skill_desc_str[182]=
{
strName=_t"开井_三头犬_第一次吓唬人扇形AOE",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "开井_三头犬_第一次吓唬人扇形AOE",
StrUseDesc=_t "开井_三头犬_第一次吓唬人扇形AOE",
}

skill_desc_str[183]=
{
strName=_t"三环狮子-狮子座-闪电光速拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "三环狮子-狮子座-闪电光速拳",
StrUseDesc=_t "三环狮子-狮子座-闪电光速拳",
}

skill_desc_str[184]=
{
strName=_t"三环狮子-狮子座-闪电束",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "三环狮子-狮子座-闪电束",
StrUseDesc=_t "三环狮子-狮子座-闪电束",
}

skill_desc_str[185]=
{
strName=_t"庐山龙飞翔",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "紫龙的绝学，击飞敌人造成不俗的伤害。",
StrUseDesc=_t "紫龙的绝学，击飞敌人造成不俗的伤害。",
}

skill_desc_str[186]=
{
strName=_t"庐山升龙霸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "紫龙的终极奥义，造成巨大的伤害。",
StrUseDesc=_t "紫龙的终极奥义，造成巨大的伤害。",
}

skill_desc_str[187]=
{
strName=_t"庐山天龙牙",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "紫龙常用的拳法，造成伤害。",
StrUseDesc=_t "紫龙常用的拳法，造成伤害。",
}

skill_desc_str[188]=
{
strName=_t"三环双鱼-白鸟技能1（召唤）",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "三环双鱼-白鸟技能1（召唤）",
StrUseDesc=_t "三环双鱼-白鸟技能1（召唤）",
}

skill_desc_str[189]=
{
strName=_t"三环双鱼—白鸟透明怪",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "三环双鱼—白鸟透明怪",
StrUseDesc=_t "三环双鱼—白鸟透明怪",
}

skill_desc_str[190]=
{
strName=_t"三环狮子-BOSS火焰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "三环狮子-BOSS火焰",
StrUseDesc=_t "三环狮子-BOSS火焰",
}

skill_desc_str[191]=
{
strName=_t"三环双鱼—黑色守护者",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "三环双鱼—黑色守护者",
StrUseDesc=_t "三环双鱼—黑色守护者",
}

skill_desc_str[192]=
{
strName=_t"十战_玩家_变身紫龙",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "十战_玩家_变身紫龙",
StrUseDesc=_t "十战_玩家_变身紫龙",
}

skill_desc_str[193]=
{
strName=_t"十战_玩家_变身一辉",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "十战_玩家_变身一辉",
StrUseDesc=_t "十战_玩家_变身一辉",
}

skill_desc_str[194]=
{
strName=_t"十战_玩家_变身星矢",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "十战_玩家_变身星矢",
StrUseDesc=_t "十战_玩家_变身星矢",
}

skill_desc_str[195]=
{
strName=_t"凤凰冲击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "一辉常用的拳法，造成伤害。",
StrUseDesc=_t "一辉常用的拳法，造成伤害。",
}

skill_desc_str[196]=
{
strName=_t"凤翼天翔",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "一辉的绝学，在自己的周围造成巨大的火焰伤害。",
StrUseDesc=_t "一辉的绝学，在自己的周围造成巨大的火焰伤害。",
}

skill_desc_str[197]=
{
strName=_t"凤凰幻魔拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "一辉的秘笈，可以击倒并且迷惑敌人。",
StrUseDesc=_t "一辉的秘笈，可以击倒并且迷惑敌人。",
}

skill_desc_str[198]=
{
strName=_t"天马落星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "星矢的普通拳法，但是也有一定的威力。",
StrUseDesc=_t "星矢的普通拳法，但是也有一定的威力。",
}

skill_desc_str[199]=
{
strName=_t"天马流星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "星矢的绝技，可以攻击前方的多名敌人。",
StrUseDesc=_t "星矢的绝技，可以攻击前方的多名敌人。",
}

skill_desc_str[200]=
{
strName=_t"天马彗星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "星矢的绝学，汇聚成一颗彗星给敌人造成巨大的伤害。",
StrUseDesc=_t "星矢的绝学，汇聚成一颗彗星给敌人造成巨大的伤害。",
}

skill_desc_str[201]=
{
strName=_t"十战_玩家_天马回旋碎击拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "十战_玩家_天马回旋碎击拳",
StrUseDesc=_t "十战_玩家_天马回旋碎击拳",
}

skill_desc_str[202]=
{
strName=_t"十战_伏龙普攻",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "十战_伏龙普攻",
StrUseDesc=_t "十战_伏龙普攻",
}

skill_desc_str[203]=
{
strName=_t"十战_伏龙加血",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "十战_伏龙加血",
StrUseDesc=_t "十战_伏龙加血",
}

skill_desc_str[204]=
{
strName=_t"真人纱织-闪现",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "真人纱织-闪现",
StrUseDesc=_t "真人纱织-闪现",
}

skill_desc_str[205]=
{
strName=_t"十战_黑龙技能",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "十战_黑龙技能",
StrUseDesc=_t "十战_黑龙技能",
}

skill_desc_str[206]=
{
strName=_t"十战_怪物伏龙变身",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "十战_怪物伏龙变身",
StrUseDesc=_t "十战_怪物伏龙变身",
}

skill_desc_str[207]=
{
strName=_t"银战_天狼Buff",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "银战_天狼Buff",
StrUseDesc=_t "银战_天狼Buff",
}

skill_desc_str[208]=
{
strName=_t"银战_天狼禁锢",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "银战_天狼禁锢",
StrUseDesc=_t "银战_天狼禁锢",
}

skill_desc_str[209]=
{
strName=_t"银战_狼袭",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "银战_狼袭",
StrUseDesc=_t "银战_狼袭",
}

skill_desc_str[210]=
{
strName=_t"银战_天狼扑杀",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "银战_天狼扑杀",
StrUseDesc=_t "银战_天狼扑杀",
}

skill_desc_str[211]=
{
strName=_t"银战_掉头盔碎衣",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "银战_掉头盔碎衣",
StrUseDesc=_t "银战_掉头盔碎衣",
}

skill_desc_str[212]=
{
strName=_t"银战_狼影",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "银战_狼影",
StrUseDesc=_t "银战_狼影",
}

skill_desc_str[213]=
{
strName=_t"银战_狼绝杀",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "银战_狼绝杀",
StrUseDesc=_t "银战_狼绝杀",
}

skill_desc_str[214]=
{
strName=_t"三环双鱼—影分身攻击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "三环双鱼—影分身攻击",
StrUseDesc=_t "三环双鱼—影分身攻击",
}

skill_desc_str[215]=
{
strName=_t"三环双鱼—红色火焰dot",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "三环双鱼—红色火焰dot",
StrUseDesc=_t "三环双鱼—红色火焰dot",
}

skill_desc_str[216]=
{
strName=_t"三环双鱼—白鸟座技能2（治疗）",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "三环双鱼—白鸟座技能2（治疗）",
StrUseDesc=_t "三环双鱼—白鸟座技能2（治疗）",
}

skill_desc_str[217]=
{
strName=_t"冰河-解控制隐藏",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "冰河-解控制隐藏",
StrUseDesc=_t "冰河-解控制隐藏",
}

skill_desc_str[218]=
{
strName=_t"冰封大地",
StrAttacktype=_t"召唤技能",
StrMana=_t "消耗%d点冻气",
StrCompDesc=_t "极寒半径:4米\r结冰需要时间:3秒\r冻结时间:3秒\r寒冰阵持续10秒\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962水瓶之光]^FFFF00\r^c0c0ff召唤的极寒区域可向主人攻击的目标移动",
StrUseDesc=_t "极寒半径:4米\r结冰需要时间:3秒\r冻结时间:3秒\r寒冰阵持续10秒\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962水瓶之光]^FFFF00\r^c0c0ff召唤的极寒区域可向主人攻击的目标移动",
StrFuncdesc=_t"将极寒注入自己脚下的土地，使得范围内的敌人持续受到极寒的威慑，停留时间过长的敌人就会受到冰霜的审判而被冰冻",
SkillSoul={ 
   [1837] = { desc=_t"使用后会在自己身上生成冰壁，抵御下次伤害，冰壁生成后存在60秒，不可叠加"},
   [1839] = { desc=_t"使用后自己和周围12米范围内的队友伤害倍率增加5%%%s，持续10秒，不可叠加",num="player.skilllevel[4097]>0 and '暴击率增加5%' or ' '"},
   [5679] = { desc=_t"被冻结的敌人不能被技能回复生命"},
} ,
}

skill_desc_str[219]=
{
strName=_t"冰河-冰阵AOE",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "冰河-冰阵AOE",
StrUseDesc=_t "冰河-冰阵AOE",
}

skill_desc_str[220]=
{
strName=_t"十战_怪物冰河钻石星辰拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "十战_怪物冰河钻石星辰拳",
StrUseDesc=_t "十战_怪物冰河钻石星辰拳",
}

skill_desc_str[221]=
{
strName=_t"十战_怪物冰河死亡冰冻一辉",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "十战_怪物冰河死亡冰冻一辉",
StrUseDesc=_t "十战_怪物冰河死亡冰冻一辉",
}

skill_desc_str[222]=
{
strName=_t"十战_怪物一辉凤翼天翔",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "十战_怪物一辉凤翼天翔",
StrUseDesc=_t "十战_怪物一辉凤翼天翔",
}

skill_desc_str[223]=
{
strName=_t"十战_怪物一辉凤凰幻魔拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "十战_怪物一辉凤凰幻魔拳",
StrUseDesc=_t "十战_怪物一辉凤凰幻魔拳",
}

skill_desc_str[224]=
{
strName=_t"极光之守护",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "护盾最多吸收{^FFABFC%d^FFFF00}点伤害\r护盾持续时间：%d秒\r处于浮空、倒地、冰冻、石化、沉默、混乱状态下也可使用\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962曙光护盾]^FFFF00\r^c0c0ff盾被击破时，周围5米范围内的敌人将因寒冷而导致无法移动\r盾附加期间将获得招架效果",
StrUseDesc=_t "护盾最多吸收%d点伤害\r护盾持续时间：%d秒\r处于浮空、倒地、冰冻、石化、沉默、混乱状态下也可使用\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962曙光护盾]^FFFF00\r^c0c0ff盾被击破时，周围5米范围内的敌人将因寒冷而导致无法移动\r盾附加期间将获得招架效果",
StrDescNum="t1*(0.0005234*level*level+0.017*level+2.22)*t3;6+3*t4",
StrFuncdesc=_t"用冻气保护目标，给目标加上护盾",
SkillSoul={ 
   [1840] = { desc=_t"冷却时间下降20秒，且在盾触发时附带解除控制的效果"},
   [4293] = { desc=_t"护盾的血量提高50%%，持续时间提高3秒，并附带反击效果，攻击带盾的目标将被减速，每次减1米，最多减4米/秒"},
   [5678] = { desc=_t"生命降至40%%以下时，立即重置冷却，该效果至少每30秒才能触发一次"},
} ,
}

skill_desc_str[225]=
{
strName=_t"十战_玩家得到小强BUFF",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "十战_玩家得到小强BUFF",
StrUseDesc=_t "十战_玩家得到小强BUFF",
}

skill_desc_str[226]=
{
strName=_t"新手村_玩家变身冥界骷髅兵",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "新手村_玩家变身冥界骷髅兵",
StrUseDesc=_t "新手村_玩家变身冥界骷髅兵",
}

skill_desc_str[227]=
{
strName=_t"三环双鱼_仙皇座透明怪1",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "三环双鱼_仙皇座透明怪1",
StrUseDesc=_t "三环双鱼_仙皇座透明怪1",
}

skill_desc_str[228]=
{
strName=_t"三环双鱼_双鱼座透明怪1",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "三环双鱼_双鱼座透明怪1",
StrUseDesc=_t "三环双鱼_双鱼座透明怪1",
}

skill_desc_str[229]=
{
strName=_t"体力值教学怪物用长吟唱技能",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "体力值教学怪物用长吟唱技能",
StrUseDesc=_t "体力值教学怪物用长吟唱技能",
}

skill_desc_str[230]=
{
strName=_t"体力值教学怪物用加任务完成buff",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "体力值教学怪物用加任务完成buff",
StrUseDesc=_t "体力值教学怪物用加任务完成buff",
}

skill_desc_str[231]=
{
strName=_t"打断技能",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "打断技能",
StrUseDesc=_t "打断技能",
}

skill_desc_str[232]=
{
strName=_t"三环双鱼_增强buff",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "三环双鱼_增强buff",
StrUseDesc=_t "三环双鱼_增强buff",
}

skill_desc_str[233]=
{
strName=_t"天秤_因陀罗小怪AE",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天秤_因陀罗小怪AE",
StrUseDesc=_t "天秤_因陀罗小怪AE",
}

skill_desc_str[234]=
{
strName=_t"流星空突拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r攻击5次，共造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加风属性攻击力:%d\r攻击5次，共造成%d%%的伤害",
StrDescNum="0.16*t4*t4+15.84*t4+32;0.16*t4*t4+15.52*t4+30.32;100*(0.0137*t4+1.51)",
StrFuncdesc=_t"天马座的基础招式，快速出拳打击目标",
}

skill_desc_str[235]=
{
strName=_t"钻石巨拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r攻击3次，共造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r攻击3次，共造成%d%%的伤害",
StrDescNum="0.16*t4*t4+15.84*t4+32;0.11*t4*t4+11.2*t4+22.69;100*(0.0098*t4+1.09)",
StrFuncdesc=_t"白鸟座的基础招式，远程攻击目标",
}

skill_desc_str[236]=
{
strName=_t"龙之拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r打击4次，共造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r打击4次，共造成%d%%的伤害",
StrDescNum="0.16*t4*t4+15.84*t4+32;0.22*t4*t4+21.76*t4+44.02;100*(0.0124*t4+1.37)",
StrFuncdesc=_t"天龙座的基础招式，快速出拳打击目标",
}

skill_desc_str[237]=
{
strName=_t"防御加1000",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防御加1000",
StrUseDesc=_t "防御加1000",
}

skill_desc_str[238]=
{
strName=_t"生命加1000",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "生命加1000",
StrUseDesc=_t "生命加1000",
}

skill_desc_str[239]=
{
strName=_t"命中加1000",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "命中加1000",
StrUseDesc=_t "命中加1000",
}

skill_desc_str[240]=
{
strName=_t"闪避加1000",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "闪避加1000",
StrUseDesc=_t "闪避加1000",
}

skill_desc_str[241]=
{
strName=_t"地攻击加1000",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "地攻击加1000",
StrUseDesc=_t "地攻击加1000",
}

skill_desc_str[242]=
{
strName=_t"水攻击加1000",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "水攻击加1000",
StrUseDesc=_t "水攻击加1000",
}

skill_desc_str[243]=
{
strName=_t"火攻击加1000",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "火攻击加1000",
StrUseDesc=_t "火攻击加1000",
}

skill_desc_str[244]=
{
strName=_t"风攻击加1000",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "风攻击加1000",
StrUseDesc=_t "风攻击加1000",
}

skill_desc_str[245]=
{
strName=_t"地抗加1000",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "地抗加1000",
StrUseDesc=_t "地抗加1000",
}

skill_desc_str[246]=
{
strName=_t"水抗加1000",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "水抗加1000",
StrUseDesc=_t "水抗加1000",
}

skill_desc_str[247]=
{
strName=_t"火抗加1000",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "火抗加1000",
StrUseDesc=_t "火抗加1000",
}

skill_desc_str[248]=
{
strName=_t"风抗加1000",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "风抗加1000",
StrUseDesc=_t "风抗加1000",
}

skill_desc_str[249]=
{
strName=_t"地穿透加1000",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "地穿透加1000",
StrUseDesc=_t "地穿透加1000",
}

skill_desc_str[250]=
{
strName=_t"水穿透加1000",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "水穿透加1000",
StrUseDesc=_t "水穿透加1000",
}

skill_desc_str[251]=
{
strName=_t"火穿透加1000",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "火穿透加1000",
StrUseDesc=_t "火穿透加1000",
}

skill_desc_str[252]=
{
strName=_t"风穿透加1000",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "风穿透加1000",
StrUseDesc=_t "风穿透加1000",
}

skill_desc_str[253]=
{
strName=_t"暴伤加1000",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "暴伤加1000",
StrUseDesc=_t "暴伤加1000",
}

skill_desc_str[254]=
{
strName=_t"暴击率加50",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "暴击率加50",
StrUseDesc=_t "暴击率加50",
}

skill_desc_str[255]=
{
strName=_t"天秤_嘲讽",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "天秤_嘲讽",
StrUseDesc=_t "天秤_嘲讽",
}

skill_desc_str[256]=
{
strName=_t"天秤_小怪献祭",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "天秤_小怪献祭",
StrUseDesc=_t "天秤_小怪献祭",
}

skill_desc_str[257]=
{
strName=_t"免疫测试",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "免疫测试",
StrUseDesc=_t "免疫测试",
}

skill_desc_str[258]=
{
strName=_t"冰河-起手减速",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "冰河-起手减速",
StrUseDesc=_t "冰河-起手减速",
}

skill_desc_str[259]=
{
strName=_t"天秤_眼睛怪AE",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "天秤_眼睛怪AE",
StrUseDesc=_t "天秤_眼睛怪AE",
}

skill_desc_str[260]=
{
strName=_t"天秤_辉火火焰光柱",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "天秤_辉火火焰光柱",
StrUseDesc=_t "天秤_辉火火焰光柱",
}

skill_desc_str[261]=
{
strName=_t"天秤_天捷星毁灭振翅",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "天秤_天捷星毁灭振翅",
StrUseDesc=_t "天秤_天捷星毁灭振翅",
}

skill_desc_str[262]=
{
strName=_t"逃坂_爆炸游尸",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "逃坂_爆炸游尸",
StrUseDesc=_t "逃坂_爆炸游尸",
}

skill_desc_str[263]=
{
strName=_t"逃坂_剧毒游尸",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "逃坂_剧毒游尸",
StrUseDesc=_t "逃坂_剧毒游尸",
}

skill_desc_str[264]=
{
strName=_t"银河竞技场变身观众",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "银河竞技场变身观众",
StrUseDesc=_t "银河竞技场变身观众",
}

skill_desc_str[265]=
{
strName=_t"银河竞技场小宇宙爆发透明怪_黑暗仙女",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "银河竞技场小宇宙爆发透明怪_黑暗仙女",
StrUseDesc=_t "银河竞技场小宇宙爆发透明怪_黑暗仙女",
}

skill_desc_str[266]=
{
strName=_t"银河竞技场小宇宙爆发透明怪_黑暗白鸟",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "银河竞技场小宇宙爆发透明怪_黑暗白鸟",
StrUseDesc=_t "银河竞技场小宇宙爆发透明怪_黑暗白鸟",
}

skill_desc_str[267]=
{
strName=_t"天秤_因陀罗毁灭者特效怪召唤",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "天秤_因陀罗毁灭者特效怪召唤",
StrUseDesc=_t "天秤_因陀罗毁灭者特效怪召唤",
}

skill_desc_str[268]=
{
strName=_t"地伤害倍率",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "地伤害倍率",
StrUseDesc=_t "地伤害倍率",
}

skill_desc_str[269]=
{
strName=_t"水伤害倍率",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "水伤害倍率",
StrUseDesc=_t "水伤害倍率",
}

skill_desc_str[270]=
{
strName=_t"火伤害倍率",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "火伤害倍率",
StrUseDesc=_t "火伤害倍率",
}

skill_desc_str[271]=
{
strName=_t"风伤害倍率",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "风伤害倍率",
StrUseDesc=_t "风伤害倍率",
}

skill_desc_str[272]=
{
strName=_t"伤害倍率",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "伤害倍率",
StrUseDesc=_t "伤害倍率",
}

skill_desc_str[273]=
{
strName=_t"伤害抗性",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "伤害抗性",
StrUseDesc=_t "伤害抗性",
}

skill_desc_str[274]=
{
strName=_t"暴击率减免",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "暴击率减免",
StrUseDesc=_t "暴击率减免",
}

skill_desc_str[275]=
{
strName=_t"暴伤减免",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "暴伤减免",
StrUseDesc=_t "暴伤减免",
}

skill_desc_str[276]=
{
strName=_t"星矢-主输出",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "星矢-主输出",
StrUseDesc=_t "星矢-主输出",
}

skill_desc_str[277]=
{
strName=_t"关卡测试用-打百分之十",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "关卡测试用-打百分之十",
StrUseDesc=_t "关卡测试用-打百分之十",
}

skill_desc_str[278]=
{
strName=_t"逃坂_迪斯马斯克积尸气冥界波",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "逃坂_迪斯马斯克积尸气冥界波",
StrUseDesc=_t "逃坂_迪斯马斯克积尸气冥界波",
}

skill_desc_str[279]=
{
strName=_t"逃坂_迪斯马斯克击飞",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "逃坂_迪斯马斯克击飞",
StrUseDesc=_t "逃坂_迪斯马斯克击飞",
}

skill_desc_str[280]=
{
strName=_t"逃坂_冥界波本身的AE技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "逃坂_冥界波本身的AE技能",
StrUseDesc=_t "逃坂_冥界波本身的AE技能",
}

skill_desc_str[281]=
{
strName=_t"纱织_自保吸收伤害",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "纱织_自保吸收伤害",
StrUseDesc=_t "纱织_自保吸收伤害",
}

skill_desc_str[282]=
{
strName=_t"大地图攻击药剂",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "大地图攻击药剂",
StrUseDesc=_t "大地图攻击药剂",
}

skill_desc_str[283]=
{
strName=_t"大地图暴击药剂",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "大地图暴击药剂",
StrUseDesc=_t "大地图暴击药剂",
}

skill_desc_str[284]=
{
strName=_t"小宇宙爆发动作测试",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗全部小宇宙能量",
StrCompDesc=_t "施放可以对周围怪造成伤害并击倒2秒并获得小宇宙爆发状态，持续120秒\r期间攻击力提升50%%，移动速度提升2.5米/秒\r溅射伤害和溅射范围都提升100%%",
StrUseDesc=_t "施放可以对周围怪造成伤害并击倒2秒并获得小宇宙爆发状态，持续120秒\r期间攻击力提升50%%，移动速度提升2.5米/秒\r溅射伤害和溅射范围都提升100%%",
StrFuncdesc=_t"小宇宙爆发 ",
}

skill_desc_str[285]=
{
strName=_t"职业-免疫",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "职业-免疫",
StrUseDesc=_t "职业-免疫",
}

skill_desc_str[286]=
{
strName=_t"天秤_童虎冰冻透明怪",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "天秤_童虎冰冻透明怪",
StrUseDesc=_t "天秤_童虎冰冻透明怪",
}

skill_desc_str[287]=
{
strName=_t"天秤_童虎冰冻免疫怪",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "天秤_童虎冰冻免疫怪",
StrUseDesc=_t "天秤_童虎冰冻免疫怪",
}

skill_desc_str[288]=
{
strName=_t"冰河-冰霜炸弹附属性",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "冰河-冰霜炸弹附属性",
StrUseDesc=_t "冰河-冰霜炸弹附属性",
}

skill_desc_str[289]=
{
strName=_t"冰河-伤害阵附属性",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "冰河-伤害阵附属性",
StrUseDesc=_t "冰河-伤害阵附属性",
}

skill_desc_str[290]=
{
strName=_t"小宇宙爆发动作测试2",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "小宇宙爆发动作测试2",
StrUseDesc=_t "小宇宙爆发动作测试2",
}

skill_desc_str[291]=
{
strName=_t"天秤_童虎庐山白龙霸",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "天秤_童虎庐山白龙霸",
StrUseDesc=_t "天秤_童虎庐山白龙霸",
}

skill_desc_str[292]=
{
strName=_t"破甲",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "拥有穿透重型怪物护甲的能力",
StrUseDesc=_t "拥有穿透重型怪物护甲的能力",
}

skill_desc_str[293]=
{
strName=_t"地囚星-重踏",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "地囚星-重踏",
StrUseDesc=_t "地囚星-重踏",
}

skill_desc_str[294]=
{
strName=_t"地囚星-虚弱",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "地囚星-虚弱",
StrUseDesc=_t "地囚星-虚弱",
}

skill_desc_str[295]=
{
strName=_t"地囚星-召唤透明怪",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "地囚星-召唤透明怪",
StrUseDesc=_t "地囚星-召唤透明怪",
}

skill_desc_str[296]=
{
strName=_t"透明怪-嘲讽地囚星",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "透明怪-嘲讽地囚星",
StrUseDesc=_t "透明怪-嘲讽地囚星",
}

skill_desc_str[297]=
{
strName=_t"地恶星-减速",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "地恶星-减速",
StrUseDesc=_t "地恶星-减速",
}

skill_desc_str[298]=
{
strName=_t"地恶星-鬼步",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "地恶星-鬼步",
StrUseDesc=_t "地恶星-鬼步",
}

skill_desc_str[299]=
{
strName=_t"地恶星-流血",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "地恶星-流血",
StrUseDesc=_t "地恶星-流血",
}

skill_desc_str[300]=
{
strName=_t"天败星-浮空",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "天败星-浮空",
StrUseDesc=_t "天败星-浮空",
}

skill_desc_str[301]=
{
strName=_t"天败星-浮空追加",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "天败星-浮空追加",
StrUseDesc=_t "天败星-浮空追加",
}

skill_desc_str[302]=
{
strName=_t"命中精通",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "增加{^FFABFC%d^FFFF00}点命中",
StrUseDesc=_t "增加%d点命中",
StrDescNum="0.06*level*level+5.7*level+24.24",
}

skill_desc_str[303]=
{
strName=_t"增加小宇宙能量",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "增加小宇宙能量",
StrUseDesc=_t "增加小宇宙能量",
}

skill_desc_str[304]=
{
strName=_t"冥想",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "使自己静止，回复生命和体力\r每秒回复20点体力和60点生命",
StrUseDesc=_t "使自己静止，回复生命和体力\r每秒回复20点体力和60点生命",
}

skill_desc_str[305]=
{
strName=_t"回城",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "使用念力传送到自己的记忆位置\r当前记录点是: %s",
StrUseDesc=_t "使用念力传送到自己的记忆位置\r当前记录点是: %s",
StrDescNum="GameApi.GetHostTownName()",
}

skill_desc_str[306]=
{
strName=_t"防卡回城",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[307]=
{
strName=_t"测试简单变身",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[308]=
{
strName=_t"雅典娜祝福增加攻击技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[309]=
{
strName=_t"雅典娜祝福增加暴击率技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[310]=
{
strName=_t"雅典娜祝福增加直击率技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[311]=
{
strName=_t"雅典娜祝福回复生命技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[312]=
{
strName=_t"雅典娜祝福白羊座技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[313]=
{
strName=_t"雅典娜祝福金牛座技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[314]=
{
strName=_t"雅典娜祝福双子座技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[315]=
{
strName=_t"雅典娜祝福巨蟹座技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[316]=
{
strName=_t"雅典娜祝福狮子座技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[317]=
{
strName=_t"雅典娜祝福处女座技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[318]=
{
strName=_t"雅典娜祝福天秤座技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[319]=
{
strName=_t"雅典娜祝福射手座技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[320]=
{
strName=_t"雅典娜祝福天蝎座技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[321]=
{
strName=_t"雅典娜祝福摩羯座技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[322]=
{
strName=_t"雅典娜祝福水瓶座技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[323]=
{
strName=_t"雅典娜祝福双鱼座技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[324]=
{
strName=_t"雅典娜祝福白羊座额外技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[325]=
{
strName=_t"雅典娜祝福金牛座额外技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[326]=
{
strName=_t"雅典娜祝福双子座额外技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[327]=
{
strName=_t"雅典娜祝福巨蟹座额外技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[328]=
{
strName=_t"雅典娜祝福狮子座额外技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[329]=
{
strName=_t"雅典娜祝福处女座额外技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[330]=
{
strName=_t"雅典娜祝福天秤座额外技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[331]=
{
strName=_t"雅典娜祝福射手座额外技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[332]=
{
strName=_t"雅典娜祝福天蝎座额外技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[333]=
{
strName=_t"雅典娜祝福摩羯座额外技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[334]=
{
strName=_t"雅典娜祝福水瓶座额外技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[335]=
{
strName=_t"雅典娜祝福双鱼座额外技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[336]=
{
strName=_t"变身黄金",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[337]=
{
strName=_t"变身黄金-技能1",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[338]=
{
strName=_t"变身黄金-技能2",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[339]=
{
strName=_t"格挡",
StrAttacktype=_t"主动祝福",
StrMana=_t "格挡状态下每秒消耗体力 30",
StrCompDesc=_t "需要持续按下Q键施放或鼠标右键持续点下技能\r技能施放快捷键可以系统设置中更改",
StrUseDesc=_t "需要持续按下Q键施放或鼠标右键持续点下技能\r技能施放快捷键可以系统设置中更改",
StrFuncdesc=_t"进入格挡状态\r减少受到伤害80%%",
}

skill_desc_str[340]=
{
strName=_t"打断",
StrAttacktype=_t"主动攻击",
StrMana=_t "消耗体力值 120",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"打断目标正在施放的技能\r如果打断成功，可使对方倒地2.5秒",
}

skill_desc_str[341]=
{
strName=_t"打断",
StrAttacktype=_t"主动攻击",
StrMana=_t "消耗体力值 120",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"打断目标正在施放的技能\r如果打断成功，可使对方定身3秒",
}

skill_desc_str[342]=
{
strName=_t"打断",
StrAttacktype=_t"主动攻击",
StrMana=_t "消耗体力值 120",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"打断目标正在施放的技能\r如果打断成功，可使对方倒地2.5秒",
}

skill_desc_str[343]=
{
strName=_t"前冲",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 60",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向前方快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[344]=
{
strName=_t"后冲",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 60",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向后方快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[345]=
{
strName=_t"左冲",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 60",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向左方快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[346]=
{
strName=_t"右冲",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 60",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向右方快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[347]=
{
strName=_t"龙击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "紫龙的基础招式",
StrUseDesc=_t "紫龙的基础招式",
}

skill_desc_str[348]=
{
strName=_t"龙形拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "龙形冲拳，可以将敌人击退",
StrUseDesc=_t "龙形冲拳，可以将敌人击退",
}

skill_desc_str[349]=
{
strName=_t"升龙拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "庐山奥义，可能将敌人击飞",
StrUseDesc=_t "庐山奥义，可能将敌人击飞",
}

skill_desc_str[350]=
{
strName=_t"龙甲",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "紫龙的防御招式，可以减少自身受到的伤害",
StrUseDesc=_t "紫龙的防御招式，可以减少自身受到的伤害",
}

skill_desc_str[351]=
{
strName=_t"龙虎_虎击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[352]=
{
strName=_t"龙虎_雷爪",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[353]=
{
strName=_t"龙虎_虎啸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[354]=
{
strName=_t"龙虎_碎石任务完成Buff",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[355]=
{
strName=_t"龙虎_拦路石削弱自己",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[356]=
{
strName=_t"龙虎_跑道加速",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[357]=
{
strName=_t"龙虎_瀑布任务完成Buff",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[358]=
{
strName=_t"龙虎_藏身处Buff",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[359]=
{
strName=_t"庐山支线_杀小鸡",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[360]=
{
strName=_t"庐山支线_杀蜜蜂",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[361]=
{
strName=_t"庐山支线_炸老鼠",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "一个定时炸弹",
StrUseDesc=_t "一个定时炸弹",
}

skill_desc_str[362]=
{
strName=_t"庐山支线_杀乌龟",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[363]=
{
strName=_t"格挡",
StrAttacktype=_t"主动祝福",
StrMana=_t "格挡状态下每秒消耗体力 30",
StrCompDesc=_t "需要持续按下Q键施放或鼠标右键持续点下技能\r技能施放快捷键可以系统设置中更改",
StrUseDesc=_t "需要持续按下Q键施放或鼠标右键持续点下技能\r技能施放快捷键可以系统设置中更改",
StrFuncdesc=_t"进入格挡状态\r减少受到伤害80%%",
}

skill_desc_str[364]=
{
strName=_t"格挡",
StrAttacktype=_t"主动祝福",
StrMana=_t "格挡状态下每秒消耗体力 30",
StrCompDesc=_t "需要持续按下Q键施放或鼠标右键持续点下技能\r技能施放快捷键可以系统设置中更改",
StrUseDesc=_t "需要持续按下Q键施放或鼠标右键持续点下技能\r技能施放快捷键可以系统设置中更改",
StrFuncdesc=_t"进入格挡状态\r减少受到伤害80%%",
}

skill_desc_str[365]=
{
strName=_t"格挡",
StrAttacktype=_t"主动祝福",
StrMana=_t "格挡状态下每秒消耗体力 30",
StrCompDesc=_t "需要持续按下Q键施放或鼠标右键持续点下技能\r技能施放快捷键可以系统设置中更改",
StrUseDesc=_t "需要持续按下Q键施放或鼠标右键持续点下技能\r技能施放快捷键可以系统设置中更改",
StrFuncdesc=_t"进入格挡状态\r减少受到伤害80%%",
}

skill_desc_str[366]=
{
strName=_t"格挡",
StrAttacktype=_t"主动祝福",
StrMana=_t "格挡状态下每秒消耗体力 30",
StrCompDesc=_t "需要持续按下Q键施放或鼠标右键持续点下技能\r技能施放快捷键可以系统设置中更改",
StrUseDesc=_t "需要持续按下Q键施放或鼠标右键持续点下技能\r技能施放快捷键可以系统设置中更改",
StrFuncdesc=_t"进入格挡状态\r减少受到伤害80%%",
}

skill_desc_str[367]=
{
strName=_t"闪避",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 60",
StrCompDesc=_t "需要SHIFT+方向键或SHIFT+左键点击地面",
StrUseDesc=_t "需要SHIFT+方向键或SHIFT+左键点击地面",
StrFuncdesc=_t"向指定方向快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[368]=
{
strName=_t"闪避",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 100",
StrCompDesc=_t "需要SHIFT+方向键或SHIFT+左键点击地面",
StrUseDesc=_t "需要SHIFT+方向键或SHIFT+左键点击地面",
StrFuncdesc=_t"向指定方向快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[369]=
{
strName=_t"闪避",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 60",
StrCompDesc=_t "需要SHIFT+方向键或SHIFT+左键点击地面",
StrUseDesc=_t "需要SHIFT+方向键或SHIFT+左键点击地面",
StrFuncdesc=_t"向指定方向快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[370]=
{
strName=_t"闪避",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 60",
StrCompDesc=_t "需要SHIFT+方向键或SHIFT+左键点击地面",
StrUseDesc=_t "需要SHIFT+方向键或SHIFT+左键点击地面",
StrFuncdesc=_t"向指定方向快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[371]=
{
strName=_t"闪避",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 100",
StrCompDesc=_t "需要SHIFT+方向键或SHIFT+左键点击地面",
StrUseDesc=_t "需要SHIFT+方向键或SHIFT+左键点击地面",
StrFuncdesc=_t"向指定方向快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[372]=
{
strName=_t"前冲",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 100",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向前方快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[373]=
{
strName=_t"后冲",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 100",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向后方快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[374]=
{
strName=_t"左冲",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 100",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向左方快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[375]=
{
strName=_t"右冲",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 100",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向右方快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[376]=
{
strName=_t"前冲",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 60",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向前方快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[377]=
{
strName=_t"后冲",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 60",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向后方快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[378]=
{
strName=_t"左冲",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 60",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向左方快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[379]=
{
strName=_t"右冲",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 60",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向右方快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[380]=
{
strName=_t"前冲",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 60",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向前方快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[381]=
{
strName=_t"后冲",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 60",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向后方快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[382]=
{
strName=_t"左冲",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 60",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向左方快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[383]=
{
strName=_t"右冲",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 60",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向右方快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[384]=
{
strName=_t"前冲",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 60",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向前方快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[385]=
{
strName=_t"后冲",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 60",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向后方快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[386]=
{
strName=_t"左冲",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 60",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向左方快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[387]=
{
strName=_t"右冲",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 60",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向右方快速移动5米\r附带1.5秒攻击闪避效果",
}

skill_desc_str[388]=
{
strName=_t"落鹰拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "拳风破空，可以击落飞翔的鹰",
StrUseDesc=_t "拳风破空，可以击落飞翔的鹰",
}

skill_desc_str[389]=
{
strName=_t"冥斗士01—普通攻击1",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[390]=
{
strName=_t"冥斗士01—普通攻击2",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[391]=
{
strName=_t"GM技能秒杀自身周围50米范围怪",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[392]=
{
strName=_t"龙虎_进入副本变身紫龙",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[393]=
{
strName=_t"卡西欧士—普通攻击1",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[394]=
{
strName=_t"卡西欧士—普通攻击2",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[395]=
{
strName=_t"圣斗士男学员少年艾德—普通攻击1",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[396]=
{
strName=_t"圣斗士男学员少年艾德—普通攻击2",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[397]=
{
strName=_t"新手村_卡西欧士_重击",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[398]=
{
strName=_t"新手村_异化艾德_死亡之拳",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[399]=
{
strName=_t"新手村_异化艾德_诅咒",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[400]=
{
strName=_t"测试-抱摔",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[401]=
{
strName=_t"测试-投掷",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[402]=
{
strName=_t"银河竞技场变身观众",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[403]=
{
strName=_t"吸血针",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[404]=
{
strName=_t"天马流行拳动作测试",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[405]=
{
strName=_t"幻眠花",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[406]=
{
strName=_t"绷带",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[407]=
{
strName=_t"生灵水",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[408]=
{
strName=_t"共享视野",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[409]=
{
strName=_t"灵气药剂",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[410]=
{
strName=_t"天池之水",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[411]=
{
strName=_t"测试-选定区域的直线攻击",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[412]=
{
strName=_t"测试-选定区域的圆形攻击",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[413]=
{
strName=_t"测试-选定区域扇形攻击",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[414]=
{
strName=_t"逃坂_迪斯马斯克眩晕玩家",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[415]=
{
strName=_t"庐山支线_炸弹AOE",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[416]=
{
strName=_t"军团基地资源怪物无敌",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[417]=
{
strName=_t"军团基地击杀怪物道具技能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[418]=
{
strName=_t"庐山_毒雾",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[419]=
{
strName=_t"庐山_猛击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[420]=
{
strName=_t"庐山_瘟疫",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[421]=
{
strName=_t"庐山_尸气",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[422]=
{
strName=_t"庐山_龙形尸气",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[423]=
{
strName=_t"庐山_升龙拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[424]=
{
strName=_t"庐山_升龙霸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[425]=
{
strName=_t"庐山_击飞拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[426]=
{
strName=_t"标准属性10级天马",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性10级天马",
StrUseDesc=_t "标准属性10级天马",
}

skill_desc_str[427]=
{
strName=_t"标准属性10级白鸟",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性10级白鸟",
StrUseDesc=_t "标准属性10级白鸟",
}

skill_desc_str[428]=
{
strName=_t"标准属性10级天龙",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性10级天龙",
StrUseDesc=_t "标准属性10级天龙",
}

skill_desc_str[429]=
{
strName=_t"标准属性10级仙女",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性10级仙女",
StrUseDesc=_t "标准属性10级仙女",
}

skill_desc_str[430]=
{
strName=_t"标准属性10级凤凰",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性10级凤凰",
StrUseDesc=_t "标准属性10级凤凰",
}

skill_desc_str[431]=
{
strName=_t"标准属性15级天马",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性15级天马",
StrUseDesc=_t "标准属性15级天马",
}

skill_desc_str[432]=
{
strName=_t"标准属性15级白鸟",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性15级白鸟",
StrUseDesc=_t "标准属性15级白鸟",
}

skill_desc_str[433]=
{
strName=_t"标准属性15级天龙",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性15级天龙",
StrUseDesc=_t "标准属性15级天龙",
}

skill_desc_str[434]=
{
strName=_t"标准属性15级仙女",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性15级仙女",
StrUseDesc=_t "标准属性15级仙女",
}

skill_desc_str[435]=
{
strName=_t"标准属性15级凤凰",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性15级凤凰",
StrUseDesc=_t "标准属性15级凤凰",
}

skill_desc_str[436]=
{
strName=_t"标准属性20级天马",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性20级天马",
StrUseDesc=_t "标准属性20级天马",
}

skill_desc_str[437]=
{
strName=_t"标准属性20级白鸟",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性20级白鸟",
StrUseDesc=_t "标准属性20级白鸟",
}

skill_desc_str[438]=
{
strName=_t"标准属性20级天龙",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性20级天龙",
StrUseDesc=_t "标准属性20级天龙",
}

skill_desc_str[439]=
{
strName=_t"标准属性20级仙女",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性20级仙女",
StrUseDesc=_t "标准属性20级仙女",
}

skill_desc_str[440]=
{
strName=_t"标准属性20级凤凰",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性20级凤凰",
StrUseDesc=_t "标准属性20级凤凰",
}

skill_desc_str[441]=
{
strName=_t"标准属性25级天马",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性25级天马",
StrUseDesc=_t "标准属性25级天马",
}

skill_desc_str[442]=
{
strName=_t"标准属性25级白鸟",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性25级白鸟",
StrUseDesc=_t "标准属性25级白鸟",
}

skill_desc_str[443]=
{
strName=_t"标准属性25级天龙",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性25级天龙",
StrUseDesc=_t "标准属性25级天龙",
}

skill_desc_str[444]=
{
strName=_t"标准属性25级仙女",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性25级仙女",
StrUseDesc=_t "标准属性25级仙女",
}

skill_desc_str[445]=
{
strName=_t"标准属性25级凤凰",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性25级凤凰",
StrUseDesc=_t "标准属性25级凤凰",
}

skill_desc_str[446]=
{
strName=_t"标准属性30级天马",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性30级天马",
StrUseDesc=_t "标准属性30级天马",
}

skill_desc_str[447]=
{
strName=_t"标准属性30级白鸟",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性30级白鸟",
StrUseDesc=_t "标准属性30级白鸟",
}

skill_desc_str[448]=
{
strName=_t"标准属性30级天龙",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性30级天龙",
StrUseDesc=_t "标准属性30级天龙",
}

skill_desc_str[449]=
{
strName=_t"标准属性30级仙女",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性30级仙女",
StrUseDesc=_t "标准属性30级仙女",
}

skill_desc_str[450]=
{
strName=_t"标准属性30级凤凰",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性30级凤凰",
StrUseDesc=_t "标准属性30级凤凰",
}

skill_desc_str[451]=
{
strName=_t"标准属性35级天马",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性35级天马",
StrUseDesc=_t "标准属性35级天马",
}

skill_desc_str[452]=
{
strName=_t"标准属性35级白鸟",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性35级白鸟",
StrUseDesc=_t "标准属性35级白鸟",
}

skill_desc_str[453]=
{
strName=_t"标准属性35级天龙",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性35级天龙",
StrUseDesc=_t "标准属性35级天龙",
}

skill_desc_str[454]=
{
strName=_t"标准属性35级仙女",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性35级仙女",
StrUseDesc=_t "标准属性35级仙女",
}

skill_desc_str[455]=
{
strName=_t"标准属性35级凤凰",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性35级凤凰",
StrUseDesc=_t "标准属性35级凤凰",
}

skill_desc_str[456]=
{
strName=_t"标准属性40级天马",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性40级天马",
StrUseDesc=_t "标准属性40级天马",
}

skill_desc_str[457]=
{
strName=_t"标准属性40级白鸟",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性40级白鸟",
StrUseDesc=_t "标准属性40级白鸟",
}

skill_desc_str[458]=
{
strName=_t"标准属性40级天龙",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性40级天龙",
StrUseDesc=_t "标准属性40级天龙",
}

skill_desc_str[459]=
{
strName=_t"标准属性40级仙女",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性40级仙女",
StrUseDesc=_t "标准属性40级仙女",
}

skill_desc_str[460]=
{
strName=_t"标准属性40级凤凰",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性40级凤凰",
StrUseDesc=_t "标准属性40级凤凰",
}

skill_desc_str[461]=
{
strName=_t"标准属性45级天马",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性45级天马",
StrUseDesc=_t "标准属性45级天马",
}

skill_desc_str[462]=
{
strName=_t"标准属性45级白鸟",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性45级白鸟",
StrUseDesc=_t "标准属性45级白鸟",
}

skill_desc_str[463]=
{
strName=_t"标准属性45级天龙",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性45级天龙",
StrUseDesc=_t "标准属性45级天龙",
}

skill_desc_str[464]=
{
strName=_t"标准属性45级仙女",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性45级仙女",
StrUseDesc=_t "标准属性45级仙女",
}

skill_desc_str[465]=
{
strName=_t"标准属性45级凤凰",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性45级凤凰",
StrUseDesc=_t "标准属性45级凤凰",
}

skill_desc_str[466]=
{
strName=_t"标准属性50级天马",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性50级天马",
StrUseDesc=_t "标准属性50级天马",
}

skill_desc_str[467]=
{
strName=_t"标准属性50级白鸟",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性50级白鸟",
StrUseDesc=_t "标准属性50级白鸟",
}

skill_desc_str[468]=
{
strName=_t"标准属性50级天龙",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性50级天龙",
StrUseDesc=_t "标准属性50级天龙",
}

skill_desc_str[469]=
{
strName=_t"标准属性50级仙女",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性50级仙女",
StrUseDesc=_t "标准属性50级仙女",
}

skill_desc_str[470]=
{
strName=_t"标准属性50级凤凰",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性50级凤凰",
StrUseDesc=_t "标准属性50级凤凰",
}

skill_desc_str[471]=
{
strName=_t"标准属性55级天马",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性55级天马",
StrUseDesc=_t "标准属性55级天马",
}

skill_desc_str[472]=
{
strName=_t"标准属性55级白鸟",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性55级白鸟",
StrUseDesc=_t "标准属性55级白鸟",
}

skill_desc_str[473]=
{
strName=_t"标准属性55级天龙",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性55级天龙",
StrUseDesc=_t "标准属性55级天龙",
}

skill_desc_str[474]=
{
strName=_t"标准属性55级仙女",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性55级仙女",
StrUseDesc=_t "标准属性55级仙女",
}

skill_desc_str[475]=
{
strName=_t"标准属性55级凤凰",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "标准属性55级凤凰",
StrUseDesc=_t "标准属性55级凤凰",
}

skill_desc_str[476]=
{
strName=_t"标准属性测试",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[477]=
{
strName=_t"测试-左1",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[478]=
{
strName=_t"测试-左2",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[479]=
{
strName=_t"原著技能白羊座技能1看动作",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.087*level+16.72)*0.5*100)",
StrFuncdesc=_t"攻击自身周围7米范围内的敌人，并造成浮空效果",
}

skill_desc_str[480]=
{
strName=_t"原著技能金牛座技能1看动作",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.089*level+19.1)*0.5*100)",
StrFuncdesc=_t"攻击自身周围7米范围内的敌人，并造成击退效果",
}

skill_desc_str[481]=
{
strName=_t"原著技能双子座技能1看动作",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.078*level+16.72)*0.5*100)",
StrFuncdesc=_t"攻击自身周围7米范围内的敌人，并造成持续伤害效果",
}

skill_desc_str[482]=
{
strName=_t"原著技能巨蟹座技能1看动作",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.106*level+22.69)*0.5*100)",
StrFuncdesc=_t"攻击自身周围7米范围内的敌人，并造成持续伤害效果",
}

skill_desc_str[483]=
{
strName=_t"原著技能狮子座技能1看动作",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.066*level+14.3)*0.5*100)",
StrFuncdesc=_t"攻击目标及正前方120度范围内敌人，造成大量伤害",
}

skill_desc_str[484]=
{
strName=_t"原著技能处女座技能1看动作",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.122*level+26.22)*0.5*100)",
StrFuncdesc=_t"攻击自身周围7米范围内的敌人，并将其击倒",
}

skill_desc_str[485]=
{
strName=_t"原著技能天秤座技能1看动作",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.066*level+14.3)*0.5*100)",
StrFuncdesc=_t"攻击目标及正前方120度范围内敌人，并造成击退效果",
}

skill_desc_str[486]=
{
strName=_t"原著技能射手座技能1看动作",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.078*level+16.72)*0.5*100)",
StrFuncdesc=_t"攻击目标及正前方120度范围内敌人，并造成减速效果",
}

skill_desc_str[487]=
{
strName=_t"原著技能天蝎座技能1看动作",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.1*level+21.5)*0.5*100)",
StrFuncdesc=_t"攻击目标，造成大量伤害.并造成倒地效果",
}

skill_desc_str[488]=
{
strName=_t"原著技能摩羯座技能1看动作",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.08*level+17.2)*0.5*100)",
StrFuncdesc=_t"攻击目标及正前方8米范围内敌人，并造成倒地效果",
}

skill_desc_str[489]=
{
strName=_t"原著技能水瓶座技能1看动作",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.1*level+21.5)*0.5*100)",
StrFuncdesc=_t"攻击目标及正前方8米范围内敌人，并造成倒地效果",
}

skill_desc_str[490]=
{
strName=_t"原著技能双鱼座技能1看动作",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.055*level+11.94)*0.5*100)",
StrFuncdesc=_t"攻击自身周围7米范围内的敌人，自身附带",
}

skill_desc_str[491]=
{
strName=_t"原著技能天马座技能1看动作",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.122*level+26.27)*0.5*100)",
StrFuncdesc=_t"攻击目标及正前方120度范围内敌人，并造成击退效果",
}

skill_desc_str[492]=
{
strName=_t"原著技能白鸟座技能1看动作",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.122*level+26.27)*0.5*100)",
StrFuncdesc=_t"攻击目标及正前方120度范围内敌人，并持续伤害效果",
}

skill_desc_str[493]=
{
strName=_t"原著技能天龙座技能1看动作",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.111*level+23.88)*0.5*100)",
StrFuncdesc=_t"攻击目标，造成大量伤害.并造成浮空效果",
}

skill_desc_str[494]=
{
strName=_t"原著技能仙女座技能1看动作",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.089*level+19.11)*0.5*100)",
StrFuncdesc=_t"攻击目标及正前方120度范围内敌人，并造成击退效果",
}

skill_desc_str[495]=
{
strName=_t"原著技能凤凰座技能1看动作",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.1*level+21.5)*0.5*100)",
StrFuncdesc=_t"攻击目标及正前方120度范围内敌人，并持续伤害效果",
}

skill_desc_str[496]=
{
strName=_t"支线-庐山-龙珠之谜变身",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[497]=
{
strName=_t"逃坂_解开玩家的束缚",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[498]=
{
strName=_t"大地图防御药剂",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[499]=
{
strName=_t"庐山支线_加速",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[500]=
{
strName=_t"庐山支线_加速",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[501]=
{
strName=_t"狮子考验者大壮男—普通攻击1",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[502]=
{
strName=_t"狮子考验者大壮男—普通攻击2",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[503]=
{
strName=_t"狮子考验者瘦小男—普通攻击1",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[504]=
{
strName=_t"狮子考验者瘦小男—普通攻击2",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[505]=
{
strName=_t"庐山主线_完成任务buff1",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[506]=
{
strName=_t"庐山主线_完成任务buff2",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[507]=
{
strName=_t"庐山主线_完成任务buff3",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[508]=
{
strName=_t"庐山主线_矿物造成玩家伤害",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[509]=
{
strName=_t"新手村主线_加速",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[510]=
{
strName=_t"纱织真人_传送",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[511]=
{
strName=_t"庐山支线-杀燕子",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[512]=
{
strName=_t"闯宫_头像喊话定身",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[513]=
{
strName=_t"活力之光",
StrAttacktype=_t"主动祝福",
StrMana=_t "增加神恩领域值",
StrCompDesc=_t "每秒回复生命:{^FFABFC%d^FFFF00}\r回复量随攻击力和属性攻击力增加而提升",
StrUseDesc=_t "每秒回复生命:%d\r回复量随攻击力和属性攻击力增加而提升",
StrDescNum="math.ceil((0.94675*level*level+56.2375*level+469.625+(t8*1.2-(4.179*level*level+224.3*level+1662))*(0.00038*level+0.044))*((t7>0)?1.8:1)*((t1>0)?2:1.2))-1",
StrFuncdesc=_t"引导神圣之力，连续为目标恢复生命",
SkillSoul={ 
   [1917] = { desc=_t"可对目标周围3米范围内的友方产生20%%的回复量"},
   [4535] = { desc=_t"施放技能3秒以上时可使目标获得共鸣状态，此状态下获得恢复之光初始回复量提升300%%"},
   [5683] = { desc=_t"释放期间，主目标生命低于50%%时，伤害抗性提升30%%"},
} ,
}

skill_desc_str[514]=
{
strName=_t"恢复之光",
StrAttacktype=_t"主动祝福",
StrMana=_t "增加神恩领域值",
StrCompDesc=_t "初始回复生命:{^FFABFC%d^FFFF00}\t^00FF00恢复之光^FFFF00\r每秒回复生命:{^FFABFC%d^FFFF00}\r持续8秒\r回复量随攻击力和属性攻击力增加而提升\r\t^00FF00仙女座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962宝轮之光]^FFFF00\r^c0c0ff初始回复量大幅提升\r神恩状态下增加神恩领域值",
StrUseDesc=_t "初始回复生命:%d\t^00FF00恢复之光^FFFF00\r每秒回复生命:%d\r持续8秒\r回复量随攻击力和属性攻击力增加而提升\r\t^00FF00仙女座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962宝轮之光]^FFFF00\r^c0c0ff初始回复量大幅提升\r神恩状态下增加神恩领域值",
StrDescNum="math.ceil((4.305*level*level+216.4*level+1201+(t8*1.2-(4.375*level*level+179.5*level+974.3))*(0.001*level+0.191))*((t7>0)?1.8:1)*((t1>0)?2:1.2)*0.2)-1;math.ceil((0.53813*level*level+27.05*level+150.125+(t8*1.2-(4.375*level*level+179.5*level+974.3))*(0.00013*level+0.02388))*((t7>0)?1.8:1)*((t1>0)?2:1.2))-1",
StrFuncdesc=_t"使15米范围内队友立即回复部分生命，并获得恢复之光效果，缓慢回复生命",
SkillSoul={ 
   [1918] = { desc=_t"可使自己和队友的伤害抗性提升5%%"},
   [1922] = { desc=_t"释放时可驱散自身和队友受到的移动控制状态，该效果触发冷却时间为12秒"},
   [4535] = { desc=_t"目标处于共鸣状态下时，初始回复量提升300%%"},
} ,
}

skill_desc_str[515]=
{
strName=_t"领域",
StrAttacktype=_t"主动祝福",
StrMana=_t "释放过程中受到攻击会^ff0000立即中断",
StrCompDesc=_t "\t^00FF00神恩领域^FFFF00\r仙女座的技能治疗效果提高100%%\r^00FF00神威领域^FFFF00\r仙女座的技能造成伤害提高100%%\r仙女座的技能治疗效果提高20%%",
StrUseDesc=_t "\t^00FF00神恩领域^FFFF00\r仙女座的技能治疗效果提高100%%\r^00FF00神威领域^FFFF00\r仙女座的技能造成伤害提高100%%\r仙女座的技能治疗效果提高20%%",
StrFuncdesc=_t"切换自身领域",
}

skill_desc_str[516]=
{
strName=_t"安德洛美达之光",
StrAttacktype=_t"主动祝福",
StrMana=_t "神恩领域下才能释放\r消耗神恩领域值上限的50%%",
StrCompDesc=_t "\t^00FF00安德洛美达之光状态^FFFF00\r本守护星座技能治疗效果提高80%%\r每次释放^00FF00活力之光^FFFF00和^00FF00恢复之光^FFFF00，会在目标处释放星云光幕，为其拢罩下的队友回复生命，每名队友同时只能受到一个星云光幕的回复效果影响\r持续15秒",
StrUseDesc=_t "\t^00FF00安德洛美达之光状态^FFFF00\r本守护星座技能治疗效果提高80%%\r每次释放^00FF00活力之光^FFFF00和^00FF00恢复之光^FFFF00，会在目标处释放星云光幕，为其拢罩下的队友回复生命，每名队友同时只能受到一个星云光幕的回复效果影响\r持续15秒",
StrFuncdesc=_t"进入安德洛美达之光状态",
}

skill_desc_str[517]=
{
strName=_t"星云之光",
StrAttacktype=_t"主动祝福",
StrMana=_t "增加神恩领域值",
StrCompDesc=_t "每秒回复生命:{^FFABFC%d^FFFF00}\r回复量随攻击力和属性攻击力增加而提升\r星云之光持续18秒",
StrUseDesc=_t "每秒回复生命:%d\r回复量随攻击力和属性攻击力增加而提升\r星云之光持续18秒",
StrDescNum="math.ceil((0.15722*level*level+9.71667*level+87.5+(t8*1.2-(4.122*level*level+235.5*level+1861))*(0.00006*level+0.00739))*((t7>0)?1.8:1)*((t1>0)?2:1.2))-1",
StrFuncdesc=_t"释放星云之光，使其拢罩范围内的队友缓慢恢复生命",
SkillSoul={ 
   [1919] = { desc=_t"处于星云之光范围内的队友，将在受到伤害时获得持久守护效果5秒，每秒回复生命%d%%",num="1+player.skilllevel[4106]"},
} ,
}

skill_desc_str[518]=
{
strName=_t"星光壁障",
StrAttacktype=_t"主动祝福",
StrMana=_t "增加神恩领域值",
StrCompDesc=_t "回复生命:{^FFABFC%d^FFFF00}\t^00FF00星光壁障^FFFF00\r抵御伤害:{^FFABFC%d^FFFF00}\r最多持续8秒\r回复量与抵御量随攻击力和属性攻击力增加而提升",
StrUseDesc=_t "回复生命:%d\t^00FF00星光壁障^FFFF00\r抵御伤害:%d\r最多持续8秒\r回复量与抵御量随攻击力和属性攻击力增加而提升",
StrDescNum="math.ceil((6.86*level*level+705.8*level+8769+(t8*1.2-(1.716*level*level+389.6*level+3109))*(0.003*level+0.425))*((t7>0)?1.8:1)*((t1>0)?2:1.2))-1;math.ceil((6.86*level*level+705.8*level+8769+(t8*1.2-(1.716*level*level+389.6*level+3109))*(0.003*level+0.425))*((t7>0)?1.8:1)*((t1>0)?2:1.2)*0.2)-1",
StrFuncdesc=_t"使目标立即回复部分生命，并获得星光壁障状态\r该状态可吸收目标所受到直接伤害",
SkillSoul={ 
   [1920] = { desc=_t"%s初始回复量和伤害抵御值提升50%%",num="player.skilllevel[4107]>0 and '' or '目标血量低于50%时'"},
   [1925] = { desc=_t"可以使目标提升移动速度60%%"},
   [4535] = { desc=_t"可使目标获得共鸣状态，此状态下获得恢复之光初始回复量提升300%%"},
} ,
}

skill_desc_str[519]=
{
strName=_t"锁链加持",
StrAttacktype=_t"主动祝福",
StrMana=_t "神恩领域下才能释放",
StrCompDesc=_t "提升目标伤害倍率:80%%",
StrUseDesc=_t "提升目标伤害倍率:80%%",
StrFuncdesc=_t"将力量通过锁链传导于目标，释放技能期间使目标造成伤害大幅提高.",
}

skill_desc_str[520]=
{
strName=_t"牺牲之光",
StrAttacktype=_t"主动祝福",
StrMana=_t "神恩领域下才能释放\r消耗神恩领域值上限的100%%",
StrCompDesc=_t "\t^00FF00牺牲之光^FFFF00\r每秒回复生命:{^FFABFC%d^FFFF00}\r最后回复生命:{^FFABFC%d^FFFF00}\r回复量随攻击力和属性攻击力增加而提升\r^00FF00牺牲之盾^FFFF00\r可抵御人物生命上限的50%%",
StrUseDesc=_t "\t^00FF00牺牲之光^FFFF00\r每秒回复生命:%d\r最后回复生命:%d\r回复量随攻击力和属性攻击力增加而提升\r^00FF00牺牲之盾^FFFF00\r可抵御人物生命上限的50%%",
StrDescNum="math.ceil((3.74*level*level+458.3*level+7961+(t8*1.2-(-3.919*level*level+580.1*level+5283))*(0.001*level+0.25))*((t7>0)?1.8:1)*((t1>0)?2:1.2)*0.15)-1;math.ceil((3.74*level*level+458.3*level+7961+(t8*1.2-(-3.919*level*level+580.1*level+5283))*(0.001*level+0.25))*((t7>0)?1.8:1)*((t1>0)?2:1.2))-1",
StrFuncdesc=_t"^c0c0ff[牺牲之光]^A2FFFF\r使周围队友伤害提高80%%，同时持续回复生命，并在技能完整释放结束时为其回复大量生命\r^c0c0ff[牺牲之盾]^A2FFFF\r自身获得牺牲之盾状态，吸收受到的直接伤害，同时免受控制效果影响，如果牺牲之盾被打破，技能会立刻中止",
}

skill_desc_str[521]=
{
strName=_t"女神垂赐",
StrAttacktype=_t"主动祝福",
StrMana=_t "只能在非战斗状态下施放",
StrCompDesc=_t "复活目标回复生命30%%",
StrUseDesc=_t "复活目标回复生命30%%",
StrFuncdesc=_t"引导女神的力量，使目标复活",
}

skill_desc_str[522]=
{
strName=_t"净土转生",
StrAttacktype=_t"主动祝福",
StrMana=_t "可在战斗状态下施放",
StrCompDesc=_t "复活目标回复生命80%%",
StrUseDesc=_t "复活目标回复生命80%%",
StrFuncdesc=_t"使战死的人获得女神的祝福，复活并继续战斗",
}

skill_desc_str[523]=
{
strName=_t"次元角锁",
StrAttacktype=_t"主动攻击",
StrMana=_t "增加神威领域值",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加雷属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加雷属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.16*level*level+15.84*level+32.04);math.ceil(0.122*level*level+12.08*level+24.43);math.ceil((0.009*level+1.025)*100)",
StrFuncdesc=_t"打击目标，并溅射周围目标\r强化次元角锁状态下，伤害提升50%%",
SkillSoul={ 
   [5685] = { desc=_t"每次攻击增加的神威领域值提升80%%"},
} ,
}

skill_desc_str[524]=
{
strName=_t"光年角锁",
StrAttacktype=_t"主动攻击",
StrMana=_t "增加神威领域值",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加雷属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r50%%概率进入强化次元角锁状态\r\t^00FF00强化次元角锁^FFFF00\r下一次^00FF00次元角锁^FFFF00伤害提高50%%",
StrUseDesc=_t "附加攻击力:%d\r附加雷属性攻击力:%d\r造成%d%%的伤害\r50%%概率进入强化次元角锁状态\r\t^00FF00强化次元角锁^FFFF00\r下一次^00FF00次元角锁^FFFF00伤害提高50%%",
StrDescNum="math.ceil(0.225*level*level+22.33*level+45.17);math.ceil(0.244*level*level+24.16*level+48.86);math.ceil((0.012*level+1.364)*100)",
StrFuncdesc=_t"打击目标，并溅射周围目标",
SkillSoul={ 
   [1928] = { desc=_t"伤害提升20%%"},
   [1931] = { desc=_t"每次攻击有20%%概率可立即重置星云离子风"},
   [5685] = { desc=_t"每次攻击增加的神威领域值提升80%%"},
} ,
}

skill_desc_str[525]=
{
strName=_t"命运圆锁",
StrAttacktype=_t"主动攻击",
StrMana=_t "增加神威领域值",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加雷属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对目标定身:4秒\r减少移动速度:40%%",
StrUseDesc=_t "附加攻击力:%d\r附加雷属性攻击力:%d\r造成%d%%的伤害\r对目标定身:4秒\r减少移动速度:40%%",
StrDescNum="math.ceil(0.16*level*level+16.16*level+48.04);math.ceil(0.122*level*level+12.32*level+36.63);math.ceil((0.004*level+0.516)*100)",
StrFuncdesc=_t"快速冲至目标身前使目标双腿麻痹无法移动，将目标周围的怪物快速拉至目标身边，并造成伤害和减速\r同时可取消主目标的飞行状态",
SkillSoul={ 
   [1924] = { desc=_t"冷却时间变为30秒，同时产生的拉拽效果可对玩家生效"},
   [1927] = { desc=_t"使目标获得锁链共鸣状态15秒，受到仙女座技能伤害提升%d%%",num="6+4*player.skilllevel[4104]"},
} ,
}

skill_desc_str[526]=
{
strName=_t"裂空风暴角锁",
StrAttacktype=_t"主动攻击",
StrMana=_t "至少需要神威领域值达到25%%\r消耗当前全部神威领域值",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加雷属性攻击力:{^FFABFC%d^FFFF00}\r至少造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加雷属性攻击力:%d\r至少造成%d%%的伤害",
StrDescNum="math.ceil(0.16*level*level+16.8*level+81);math.ceil(0.122*level*level+12.81*level+61.77);math.ceil((0.011*level+1.222)*100)",
StrFuncdesc=_t"用锁链卷起目标猛烈的砸击地面，并溅射周围目标\r伤害随当前神威领域值变化，神威领域值满时造成伤害提高300%%\r对玩家和强力怪物使用时将以另一种形式发起进攻",
SkillSoul={ 
   [4539] = { desc=_t"造成伤害提升20%%"},
   [5684] = { desc=_t"神威能量大于80%%时，动作切换为锁链攻击时可立即造成主目标浮空"},
} ,
}

skill_desc_str[527]=
{
strName=_t"地狱圆锁",
StrAttacktype=_t"主动攻击",
StrMana=_t "神威领域下才能释放\r增加神威领域值",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加雷属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加雷属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.252*level*level+27.8*level+195.9);math.ceil(0.305*level*level+33.55*level+236.4);math.ceil((0.012*level+1.345)*100)",
StrFuncdesc=_t"用锁链将目标卷起，并将其击倒4秒",
SkillSoul={ 
   [1930] = { desc=_t"每次使用可获得星云爆发状态10秒，暴击率提升50%%"},
   [4539] = { desc=_t"造成伤害提升20%%"},
} ,
}

skill_desc_str[528]=
{
strName=_t"锁链迷宫",
StrAttacktype=_t"主动攻击",
StrMana=_t "在不同领域下产生的效果不同.",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加雷属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962魑魅魍魉]^FFFF00\r^c0c0ff伤害提升50%%。\r范围增大为半径6米\r开始释放时会将范围内的所有敌人吸附到锁链阵的中心\r技能施放期间免疫控制",
StrUseDesc=_t "附加攻击力:%d\r附加雷属性攻击力:%d\r造成%d%%的伤害\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962魑魅魍魉]^FFFF00\r^c0c0ff伤害提升50%%。\r范围增大为半径6米\r开始释放时会将范围内的所有敌人吸附到锁链阵的中心\r技能施放期间免疫控制",
StrDescNum="math.ceil(0.105*level*level+10.87*level+42.47);math.ceil(0.053*level*level+5.475*level+21.38);math.ceil((0.007*level+0.757)*100)",
StrFuncdesc=_t"释放星云锁链阵打击进入区域的敌人.\r^00FF00神恩领域下^A2FFFF\r可连续将范围内的敌方击退并造成少量伤害，减少自身受到伤害50%%.\r^00FF00神威领域下^A2FFFF\r冷却时间降为1秒，释放时如果消耗神威领域值，则造成伤害提升300%%",
SkillSoul={ 
   [1923] = { desc=_t"释放时可使敌人沉默%s秒，此效果触发冷却时间为30秒",num="player.skilllevel[4105]>0 and '6' or '3'"},
   [1929] = { desc=_t"消耗神威领域值减半，但仍能造成很高的伤害。"},
} ,
}

skill_desc_str[529]=
{
strName=_t"自由星光",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "自由星光持续时间:6秒\t^00FF00自由星光^FFFF00\r免受控制效果影响\r处于眩晕倒地浮空和沉默状态下也可使用",
StrUseDesc=_t "自由星光持续时间:6秒\t^00FF00自由星光^FFFF00\r免受控制效果影响\r处于眩晕倒地浮空和沉默状态下也可使用",
StrFuncdesc=_t"引导小宇宙的力量，解除目标所受到的控制.一段时间内给目标附加自由星光效果",
SkillSoul={ 
   [4537] = { desc=_t"目标周围5米范围内的敌人将被打断同时沉默3秒"},
} ,
}

skill_desc_str[530]=
{
strName=_t"哈迪斯的意志",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962雅典娜意志]^FFFF00\r^c0c0ff额外获得雅典娜意志状态",
StrUseDesc=_t "\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962雅典娜意志]^FFFF00\r^c0c0ff额外获得雅典娜意志状态",
StrFuncdesc=_t"回复满所有的神恩或神威领域值",
}

skill_desc_str[531]=
{
strName=_t"瞬-减防",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[532]=
{
strName=_t"瞬-怪物聚怪减速",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[533]=
{
strName=_t"瞬-怪物大伤害攻击",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[534]=
{
strName=_t"瞬-怪物防御阵",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[535]=
{
strName=_t"瞬-怪物通道治疗",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[536]=
{
strName=_t"瞬-大伤害攻击额外技能1",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[537]=
{
strName=_t"瞬-怪物放治疗区域",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[538]=
{
strName=_t"召唤:白羊座守护",
StrAttacktype=_t"召唤技能",
StrCompDesc=_t "召唤白羊座的星相守护，你和队友可以从星相守护获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
StrUseDesc=_t "召唤白羊座的星相守护，你和队友可以从星相守护获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
}

skill_desc_str[539]=
{
strName=_t"召唤:金牛座守护",
StrAttacktype=_t"召唤技能",
StrCompDesc=_t "召唤金牛座的星相守护，你和队友可以从星相守护获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
StrUseDesc=_t "召唤金牛座的星相守护，你和队友可以从星相守护获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
}

skill_desc_str[540]=
{
strName=_t"召唤:双子座守护",
StrAttacktype=_t"召唤技能",
StrCompDesc=_t "召唤双子座的星相守护，你和队友可以从星相守护获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
StrUseDesc=_t "召唤双子座的星相守护，你和队友可以从星相守护获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
}

skill_desc_str[541]=
{
strName=_t"召唤:巨蟹座守护",
StrAttacktype=_t"召唤技能",
StrCompDesc=_t "召唤巨蟹座的星相守护，你和队友可以从星相守护获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
StrUseDesc=_t "召唤巨蟹座的星相守护，你和队友可以从星相守护获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
}

skill_desc_str[542]=
{
strName=_t"召唤:狮子座守护",
StrAttacktype=_t"召唤技能",
StrCompDesc=_t "召唤狮子座的星相守护，你和队友可以从星相守护获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
StrUseDesc=_t "召唤狮子座的星相守护，你和队友可以从星相守护获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
}

skill_desc_str[543]=
{
strName=_t"召唤:处女座守护",
StrAttacktype=_t"召唤技能",
StrCompDesc=_t "召唤处女座的星相守护，你和队友可以从星相守护\r获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
StrUseDesc=_t "召唤处女座的星相守护，你和队友可以从星相守护\r获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
}

skill_desc_str[544]=
{
strName=_t"召唤:天枰座守护",
StrAttacktype=_t"召唤技能",
StrCompDesc=_t "召唤天枰座的星相守护，你和队友可以从星相守护获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
StrUseDesc=_t "召唤天枰座的星相守护，你和队友可以从星相守护获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
}

skill_desc_str[545]=
{
strName=_t"召唤:天蝎座守护",
StrAttacktype=_t"召唤技能",
StrCompDesc=_t "召唤天蝎座的星相守护，你和队友可以从星相守护获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
StrUseDesc=_t "召唤天蝎座的星相守护，你和队友可以从星相守护获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
}

skill_desc_str[546]=
{
strName=_t"召唤:射手座守护",
StrAttacktype=_t"召唤技能",
StrCompDesc=_t "召唤射手座的星相守护，你和队友可以从星相守护获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
StrUseDesc=_t "召唤射手座的星相守护，你和队友可以从星相守护获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
}

skill_desc_str[547]=
{
strName=_t"召唤:摩羯座守护",
StrAttacktype=_t"召唤技能",
StrCompDesc=_t "召唤摩羯座的星相守护，你和队友可以从星相守护获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
StrUseDesc=_t "召唤摩羯座的星相守护，你和队友可以从星相守护获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
}

skill_desc_str[548]=
{
strName=_t"召唤:水瓶座守护",
StrAttacktype=_t"召唤技能",
StrCompDesc=_t "召唤水瓶座的星相守护，你和队友可以从星相守护获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
StrUseDesc=_t "召唤水瓶座的星相守护，你和队友可以从星相守护获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
}

skill_desc_str[549]=
{
strName=_t"召唤:双鱼座守护",
StrAttacktype=_t"召唤技能",
StrCompDesc=_t "召唤双鱼座的星相守护，你和队友可以从星相守护获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
StrUseDesc=_t "召唤双鱼座的星相守护，你和队友可以从星相守护获得祝福，祝福效果受当前星座运势影响\r仅在副本内可用",
}

skill_desc_str[550]=
{
strName=_t"白羊守护-祝福",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[551]=
{
strName=_t"金牛守护-祝福",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[552]=
{
strName=_t"双子守护-祝福",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[553]=
{
strName=_t"巨蟹守护-祝福",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[554]=
{
strName=_t"狮子守护-祝福",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[555]=
{
strName=_t"处女守护-祝福",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[556]=
{
strName=_t"天枰守护-祝福",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[557]=
{
strName=_t"天蝎守护-祝福",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[558]=
{
strName=_t"射手守护-祝福",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[559]=
{
strName=_t"摩羯守护-祝福",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[560]=
{
strName=_t"水瓶守护-祝福",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[561]=
{
strName=_t"双鱼守护-祝福",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[562]=
{
strName=_t"瞬-大伤害攻击额外技能2",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[563]=
{
strName=_t"龙虎_变身紫龙2",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[564]=
{
strName=_t"瞬-怪物大伤害攻击2",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[565]=
{
strName=_t"庐山圣域密探技能1",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[566]=
{
strName=_t"庐山圣域密探技能2",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[567]=
{
strName=_t"庐山圣域密探技能3",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[568]=
{
strName=_t"星光灭绝",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r附加火属性攻击力:%d\r附加水属性攻击力:%d\r附加风属性攻击力:%d\r造成%d%%伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.087*level+16.72)*0.5*100)",
StrFuncdesc=_t"攻击自身周围7米范围内的敌人，并造成浮空效果",
}

skill_desc_str[569]=
{
strName=_t"泰坦新星",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r附加火属性攻击力:%d\r附加水属性攻击力:%d\r附加风属性攻击力:%d\r造成%d%%伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.089*level+19.1)*0.5*100)",
StrFuncdesc=_t"攻击自身周围7米范围内的敌人，并造成击退效果",
}

skill_desc_str[570]=
{
strName=_t"银河星爆",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r附加火属性攻击力:%d\r附加水属性攻击力:%d\r附加风属性攻击力:%d\r造成%d%%伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.078*level+16.72)*0.5*100)",
StrFuncdesc=_t"攻击自身周围7米范围内的敌人，并造成持续伤害效果",
}

skill_desc_str[571]=
{
strName=_t"积尸气冥界波",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r附加火属性攻击力:%d\r附加水属性攻击力:%d\r附加风属性攻击力:%d\r造成%d%%伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.106*level+22.69)*0.5*100)",
StrFuncdesc=_t"攻击自身周围7米范围内的敌人，并造成持续伤害效果",
}

skill_desc_str[572]=
{
strName=_t"闪电光束拳",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r附加火属性攻击力:%d\r附加水属性攻击力:%d\r附加风属性攻击力:%d\r造成%d%%伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.066*level+14.3)*0.5*100)",
StrFuncdesc=_t"攻击目标及正前方120度范围内敌人，造成大量伤害",
}

skill_desc_str[573]=
{
strName=_t"天魔降服",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r附加火属性攻击力:%d\r附加水属性攻击力:%d\r附加风属性攻击力:%d\r造成%d%%伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.122*level+26.22)*0.5*100)",
StrFuncdesc=_t"攻击自身周围7米范围内的敌人，并将其击倒",
}

skill_desc_str[574]=
{
strName=_t"庐山百龙霸",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r附加火属性攻击力:%d\r附加水属性攻击力:%d\r附加风属性攻击力:%d\r造成%d%%伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.066*level+14.3)*0.5*100)",
StrFuncdesc=_t"攻击目标及正前方120度范围内敌人，并造成击退效果",
}

skill_desc_str[575]=
{
strName=_t"黄金箭",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r附加火属性攻击力:%d\r附加水属性攻击力:%d\r附加风属性攻击力:%d\r造成%d%%伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.078*level+16.72)*0.5*100)",
StrFuncdesc=_t"攻击目标及正前方120度范围内敌人，并造成减速效果",
}

skill_desc_str[576]=
{
strName=_t"猩红毒针",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r附加火属性攻击力:%d\r附加水属性攻击力:%d\r附加风属性攻击力:%d\r造成%d%%伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.1*level+21.5)*0.5*100)",
StrFuncdesc=_t"攻击目标，造成大量伤害.并造成倒地效果",
}

skill_desc_str[577]=
{
strName=_t"黄金圣剑",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r附加火属性攻击力:%d\r附加水属性攻击力:%d\r附加风属性攻击力:%d\r造成%d%%伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.08*level+17.2)*0.5*100)",
StrFuncdesc=_t"攻击目标及正前方8米范围内敌人，并造成倒地效果",
}

skill_desc_str[578]=
{
strName=_t"曙光女神的宽恕",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r附加火属性攻击力:%d\r附加水属性攻击力:%d\r附加风属性攻击力:%d\r造成%d%%伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.1*level+21.5)*0.5*100)",
StrFuncdesc=_t"攻击目标及正前方8米范围内敌人，并造成倒地效果",
}

skill_desc_str[579]=
{
strName=_t"食人鱼玫瑰",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r附加火属性攻击力:%d\r附加水属性攻击力:%d\r附加风属性攻击力:%d\r造成%d%%伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.055*level+11.94)*0.5*100)",
StrFuncdesc=_t"攻击自身周围7米范围内的敌人，自身附带",
}

skill_desc_str[580]=
{
strName=_t"天马流星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "附加攻击力:%d\r附加风属性攻击力:%d\r造成%d%%伤害",
StrDescNum="math.ceil(0.27*level*level+28.91*level+178.31);math.ceil((0.27*level*level+28.91*level+178.31)*3.451);math.ceil((2.24+0.0174*level)*5*100)",
StrFuncdesc=_t"攻击目标及前方一定范围内敌人，并造成击退效果",
}

skill_desc_str[581]=
{
strName=_t"钻石星辰拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r造成%d%%伤害",
StrDescNum="math.ceil(0.27*level*level+28.91*level+178.31);math.ceil((0.27*level*level+28.91*level+178.31)*3.928);math.ceil((2.7+0.021*level)*4*100)",
StrFuncdesc=_t"攻击目标及前方一定范围内敌人，并冰冻目标",
}

skill_desc_str[582]=
{
strName=_t"庐山升龙霸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r造成%d%%伤害",
StrDescNum="math.ceil(0.27*level*level+28.91*level+178.31);math.ceil((0.27*level*level+28.91*level+178.31)*2.334);math.ceil((10.2+0.0791*level)*1*100)",
StrFuncdesc=_t"攻击目标周围敌人，造成大量伤害.并造成浮空效果",
}

skill_desc_str[583]=
{
strName=_t"星云风暴",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加雷属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "附加攻击力:%d\r附加雷属性攻击力:%d\r造成%d%%伤害",
StrDescNum="math.ceil(0.27*level*level+28.91*level+178.31);math.ceil((0.27*level*level+28.91*level+178.31)*1.673);math.ceil((1.89+0.0146*level)*4*100)",
StrFuncdesc=_t"攻击目标及前方一定范围内敌人，并造成击退效果",
}

skill_desc_str[584]=
{
strName=_t"凤翼天翔",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r附加火属性攻击力:%d\r附加水属性攻击力:%d\r附加风属性攻击力:%d\r造成%d%%伤害",
StrDescNum="math.ceil(0.08*level*level+16*level+80);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil(0.02*level*level+4.166*level+20.83);math.ceil((0.1*level+21.5)*0.5*100)",
StrFuncdesc=_t"攻击目标及前方一定范围内敌人，并持续伤害效果",
}

skill_desc_str[585]=
{
strName=_t"测试技能触发QTE",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[586]=
{
strName=_t"争夺boss-群体生命降低",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[587]=
{
strName=_t"争夺boss-区域特殊效果",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[588]=
{
strName=_t"通用——普攻技能1",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[589]=
{
strName=_t"通用——普攻技能1",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[590]=
{
strName=_t"银战_召唤那智",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[591]=
{
strName=_t"迪斯马斯克buff",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "防卡回城",
StrUseDesc=_t "防卡回城",
}

skill_desc_str[592]=
{
strName=_t"引爆",
}

skill_desc_str[733]=
{
strName=_t"圣斗士归来",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "结束美神的庇佑",
StrUseDesc=_t "结束美神的庇佑",
}

skill_desc_str[760]=
{
strName=_t"黄金箭",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "射手黄金圣衣之黄金箭！\r神射手之弑神之箭，威力巨大，可打破一切阻碍！",
StrUseDesc=_t "射手黄金圣衣之黄金箭！\r神射手之弑神之箭，威力巨大，可打破一切阻碍！",
}

skill_desc_str[770]=
{
strName=_t"命令",
}

skill_desc_str[796]=
{
strName=_t"秒他们所有",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "无论是谁都可以秒",
StrUseDesc=_t "无论是谁都可以秒",
}

skill_desc_str[799]=
{
strName=_t"雷穿透",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "火伤害倍率",
StrUseDesc=_t "火伤害倍率",
}

skill_desc_str[800]=
{
strName=_t"雷伤害倍率",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "火伤害倍率",
StrUseDesc=_t "火伤害倍率",
}

skill_desc_str[801]=
{
strName=_t"雷攻击",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "火伤害倍率",
StrUseDesc=_t "火伤害倍率",
}

skill_desc_str[802]=
{
strName=_t"雷抗",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "火伤害倍率",
StrUseDesc=_t "火伤害倍率",
}

skill_desc_str[867]=
{
strName=_t"军团-攻击力",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "攻击力提升{^FFABFC%d%%^FFFF00}",
StrUseDesc=_t "攻击力提升%d%%",
StrDescNum="level",
}

skill_desc_str[868]=
{
strName=_t"军团-防御力",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "防御力提升{^FFABFC%d%%^FFFF00}",
StrUseDesc=_t "防御力提升%d%%",
StrDescNum="level",
}

skill_desc_str[869]=
{
strName=_t"军团-生命",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "生命上限提升{^FFABFC%d%%^FFFF00}",
StrUseDesc=_t "生命上限提升%d%%",
StrDescNum="level",
}

skill_desc_str[870]=
{
strName=_t"军团-沉默忽视",
StrAttacktype=_t"开关技能",
StrCompDesc=_t "忽视沉默抗性提升{^FFABFC%d^FFFF00}点",
StrUseDesc=_t "忽视沉默抗性提升%d点",
StrDescNum="level*2",
}

skill_desc_str[871]=
{
strName=_t"军团-混乱忽视",
StrAttacktype=_t"开关技能",
StrCompDesc=_t "忽视混乱抗性提升{^FFABFC%d^FFFF00}点",
StrUseDesc=_t "忽视混乱抗性提升%d点",
StrDescNum="level*2",
}

skill_desc_str[872]=
{
strName=_t"军团-中毒忽视",
StrAttacktype=_t"开关技能",
StrCompDesc=_t "忽视中毒抗性提升{^FFABFC%d^FFFF00}点",
StrUseDesc=_t "忽视中毒抗性提升%d点",
StrDescNum="level*2",
}

skill_desc_str[873]=
{
strName=_t"军团-流血忽视",
StrAttacktype=_t"开关技能",
StrCompDesc=_t "忽视流血抗性提升{^FFABFC%d^FFFF00}点",
StrUseDesc=_t "忽视流血抗性提升%d点",
StrDescNum="level*2",
}

skill_desc_str[874]=
{
strName=_t"军团-灼烧忽视",
StrAttacktype=_t"开关技能",
StrCompDesc=_t "忽视灼烧抗性提升{^FFABFC%d^FFFF00}点",
StrUseDesc=_t "忽视灼烧抗性提升%d点",
StrDescNum="level*2",
}

skill_desc_str[875]=
{
strName=_t"军团-倒地忽视",
StrAttacktype=_t"开关技能",
StrCompDesc=_t "忽视倒地抗性提升{^FFABFC%d^FFFF00}点",
StrUseDesc=_t "忽视倒地抗性提升%d点",
StrDescNum="level*2",
}

skill_desc_str[876]=
{
strName=_t"军团-冰冻忽视",
StrAttacktype=_t"开关技能",
StrCompDesc=_t "忽视冰冻抗性提升{^FFABFC%d^FFFF00}点",
StrUseDesc=_t "忽视冰冻抗性提升%d点",
StrDescNum="level*2",
}

skill_desc_str[877]=
{
strName=_t"军团-石化忽视",
StrAttacktype=_t"开关技能",
StrCompDesc=_t "忽视石化抗性提升{^FFABFC%d^FFFF00}点",
StrUseDesc=_t "忽视石化抗性提升%d点",
StrDescNum="level*2",
}

skill_desc_str[878]=
{
strName=_t"军团-移动控制忽视",
StrAttacktype=_t"开关技能",
StrCompDesc=_t "忽视移动控制抗性提升{^FFABFC%d^FFFF00}点",
StrUseDesc=_t "忽视移动控制抗性提升%d点",
StrDescNum="level*2",
}

skill_desc_str[879]=
{
strName=_t"军团-虚弱忽视",
StrAttacktype=_t"开关技能",
StrCompDesc=_t "忽视虚弱抗性提升{^FFABFC%d^FFFF00}点",
StrUseDesc=_t "忽视虚弱抗性提升%d点",
StrDescNum="level*2",
}

skill_desc_str[880]=
{
strName=_t"军团-沉默抗性",
StrAttacktype=_t"开关技能",
StrCompDesc=_t "沉默抗性提升{^FFABFC%d^FFFF00}点",
StrUseDesc=_t "沉默抗性提升%d点",
StrDescNum="level*2",
}

skill_desc_str[881]=
{
strName=_t"军团-混乱抗性",
StrAttacktype=_t"开关技能",
StrCompDesc=_t "混乱抗性提升{^FFABFC%d^FFFF00}点",
StrUseDesc=_t "混乱抗性提升%d点",
StrDescNum="level*2",
}

skill_desc_str[882]=
{
strName=_t"军团-中毒抗性",
StrAttacktype=_t"开关技能",
StrCompDesc=_t "中毒抗性提升{^FFABFC%d^FFFF00}点",
StrUseDesc=_t "中毒抗性提升%d点",
StrDescNum="level*2",
}

skill_desc_str[883]=
{
strName=_t"军团-流血抗性",
StrAttacktype=_t"开关技能",
StrCompDesc=_t "流血抗性提升{^FFABFC%d^FFFF00}点",
StrUseDesc=_t "流血抗性提升%d点",
StrDescNum="level*2",
}

skill_desc_str[884]=
{
strName=_t"军团-灼烧抗性",
StrAttacktype=_t"开关技能",
StrCompDesc=_t "灼烧抗性提升{^FFABFC%d^FFFF00}点",
StrUseDesc=_t "灼烧抗性提升%d点",
StrDescNum="level*2",
}

skill_desc_str[885]=
{
strName=_t"军团-倒地抗性",
StrAttacktype=_t"开关技能",
StrCompDesc=_t "倒地抗性提升{^FFABFC%d^FFFF00}点",
StrUseDesc=_t "倒地抗性提升%d点",
StrDescNum="level*2",
}

skill_desc_str[886]=
{
strName=_t"军团-冰冻抗性",
StrAttacktype=_t"开关技能",
StrCompDesc=_t "冰冻抗性提升{^FFABFC%d^FFFF00}点",
StrUseDesc=_t "冰冻抗性提升%d点",
StrDescNum="level*2",
}

skill_desc_str[887]=
{
strName=_t"军团-石化抗性",
StrAttacktype=_t"开关技能",
StrCompDesc=_t "石化抗性提升{^FFABFC%d^FFFF00}点",
StrUseDesc=_t "石化抗性提升%d点",
StrDescNum="level*2",
}

skill_desc_str[888]=
{
strName=_t"军团-移动控制抗性",
StrAttacktype=_t"开关技能",
StrCompDesc=_t "移动控制抗性提升{^FFABFC%d^FFFF00}点",
StrUseDesc=_t "移动控制抗性提升%d点",
StrDescNum="level*2",
}

skill_desc_str[889]=
{
strName=_t"军团-虚弱抗性",
StrAttacktype=_t"开关技能",
StrCompDesc=_t "虚弱抗性提升{^FFABFC%d^FFFF00}点",
StrUseDesc=_t "虚弱抗性提升%d点",
StrDescNum="level*2",
}

skill_desc_str[894]=
{
strName=_t"上色",
}

skill_desc_str[895]=
{
strName=_t"神龙摆尾",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "使15米范围内的友方单位的防御力增加1%%+50",
StrUseDesc=_t "使15米范围内的友方单位的防御力增加1%%+50",
}

skill_desc_str[896]=
{
strName=_t"潜龙勿用",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "使15米范围内的友方单位的攻击力增加1%%+50",
StrUseDesc=_t "使15米范围内的友方单位的攻击力增加1%%+50",
}

skill_desc_str[897]=
{
strName=_t"海皇遗民的祝福",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "使15米范围内的友方单位的暴击率增加1%%",
StrUseDesc=_t "使15米范围内的友方单位的暴击率增加1%%",
}

skill_desc_str[898]=
{
strName=_t"魔铃的守护",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "增加躲闪和命中，增加的值为人物等级+15\r附加战斗力50\r技能专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "增加躲闪和命中，增加的值为人物等级+15\r附加战斗力50\r技能专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="player.prof==2 and ''or '^ff0000'",
}

skill_desc_str[899]=
{
strName=_t"莎尔娜的爱慕",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "风属性攻击力增加1%%\r附加战斗力50\r技能专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "风属性攻击力增加1%%\r附加战斗力50\r技能专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="player.prof==2 and ''or '^ff0000'",
}

skill_desc_str[900]=
{
strName=_t"水元素要义",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "增加10点水属性抗性\r附加战斗力50\r技能专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "增加10点水属性抗性\r附加战斗力50\r技能专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="player.prof==3 and ''or '^ff0000'",
}

skill_desc_str[901]=
{
strName=_t"假死封印术",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "生命上限提升2%%+500\r附加战斗力50\r技能专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "生命上限提升2%%+500\r附加战斗力50\r技能专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="player.prof==4 and ''or '^ff0000'",
}

skill_desc_str[902]=
{
strName=_t"仙女岛之星云庇护",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "暴击率减免提升2%%\r附加战斗力50\r技能专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "暴击率减免提升2%%\r附加战斗力50\r技能专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="player.prof==5 and ''or '^ff0000'",
}

skill_desc_str[903]=
{
strName=_t"皇后岛的不灭记忆",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "暴击率提升1%%，火属性抗性提升5点\r附加战斗力50\r技能专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "暴击率提升1%%，火属性抗性提升5点\r附加战斗力50\r技能专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="player.prof==6 and ''or '^ff0000'",
}

skill_desc_str[904]=
{
strName=_t"永生的忠魂",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "所有属性抗性增加3点\r附加战斗力50",
StrUseDesc=_t "所有属性抗性增加3点\r附加战斗力50",
}

skill_desc_str[5136]=
{
strName=_t"东西伯利亚的苦寒",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "暴击率增加2%%\r附加战斗力50\r技能专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "暴击率增加2%%\r附加战斗力50\r技能专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="player.prof==3 and ''or '^ff0000'",
}

skill_desc_str[5137]=
{
strName=_t"庐山瀑布之逆流",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "所有属性抗性增加2点\r附加战斗力50\r技能专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "所有属性抗性增加2点\r附加战斗力50\r技能专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="player.prof==4 and ''or '^ff0000'",
}

skill_desc_str[5138]=
{
strName=_t"黑玫瑰的遗产",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "攻击力增加1%%\r附加战斗力50\r技能专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "攻击力增加1%%\r附加战斗力50\r技能专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="player.prof==5 and ''or '^ff0000'",
}

skill_desc_str[5139]=
{
strName=_t"轮回中永生的火焰",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "火属性攻击力增加1%%\r附加战斗力50\r技能专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "火属性攻击力增加1%%\r附加战斗力50\r技能专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="player.prof==6 and ''or '^ff0000'",
}

skill_desc_str[917]=
{
strName=_t"使用",
}

skill_desc_str[921]=
{
strName=_t"斗志燃烧",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "每次耗一点斗志都可以回复15点体力\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "每次耗一点斗志都可以回复15点体力\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff巨蛇座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[922]=
{
strName=_t"奇袭",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "每次使用^c0c0ff[%s]^FFFF00会获得一点斗志，并进入^c0c0ff[风暴流星]^FFFF00状态%s。\r同时对怪物造成重伤，使怪物的伤害抗性下降10%%，持续6秒\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "每次使用^c0c0ff[%s]^FFFF00会获得一点斗志，并进入^c0c0ff[风暴流星]^FFFF00状态%s。\r同时对怪物造成重伤，使怪物的伤害抗性下降10%%，持续6秒\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="skill_desc_str[17].strName;player.skilllevel[4089]>0 and skill_desc.specStr[922] or ' ';player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天马座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[923]=
{
strName=_t"破膝之箭",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "被^c0c0ff[%s]^FFFF00攻击到的目标，将减速60%%，持续5秒\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "被^c0c0ff[%s]^FFFF00攻击到的目标，将减速60%%，持续5秒\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="skill_desc_str[62].strName;player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff北冕座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[924]=
{
strName=_t"神圣之翼",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00持续时间延长4秒，且期间伤害减免增加15%%\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00持续时间延长4秒，且期间伤害减免增加15%%\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="skill_desc_str[30].strName;player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff巨蛇座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[925]=
{
strName=_t"勇者不灭",
StrAttacktype=_t"召唤技能",
StrCompDesc=_t "使用终结技能时，每点斗志额外增加8%%的暴击率\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "使用终结技能时，每点斗志额外增加8%%的暴击率\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天马座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[926]=
{
strName=_t"云之冲击",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00的沉默时间提高1秒，并提供%d秒定身\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00的沉默时间提高1秒，并提供%d秒定身\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="skill_desc_str[27].strName;3+player.skilllevel[4090]*3;player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天鹰座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[927]=
{
strName=_t"相同招式无效",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "如果自己在受到完全控制（浮空、倒地、冰冻、石化、抱摔、沉默、混乱）时被攻击，则接下来的%d秒内免疫其他的后续控制，受到多次攻击将重置免疫状态的时间\r免疫效果结束后，需要15秒才能触发下一次效果\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "如果自己在受到完全控制（浮空、倒地、冰冻、石化、抱摔、沉默、混乱）时被攻击，则接下来的%d秒内免疫其他的后续控制，受到多次攻击将重置免疫状态的时间\r免疫效果结束后，需要15秒才能触发下一次效果\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="3+2*t1;player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff半人马座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[928]=
{
strName=_t"暴走流星",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00的持续时间增加3秒，伤害提高10%%\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00的持续时间增加3秒，伤害提高10%%\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="skill_desc_str[1622].strName;player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天马座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[929]=
{
strName=_t"星芒闪动",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00^c0c0ff[%s]^FFFF00^c0c0ff[%s]^FFFF00的释放距离增加3米，冷却时间下降20%%\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00^c0c0ff[%s]^FFFF00^c0c0ff[%s]^FFFF00的释放距离增加3米，冷却时间下降20%%\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="skill_desc_str[17].strName;skill_desc_str[27].strName;skill_desc_str[935].strName;player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff北冕座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[930]=
{
strName=_t"光速的余暇",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^c0c0ff[%s]^FFFF00的冷却时间减少2秒\r并且每当自己成功躲闪时（伤害被偏斜），都能获得一点斗志，这个效果每5秒至多生效一次\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "使得^c0c0ff[%s]^FFFF00的冷却时间减少2秒\r并且每当自己成功躲闪时（伤害被偏斜），都能获得一点斗志，这个效果每5秒至多生效一次\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="skill_desc_str[62].strName;player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff半人马座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[931]=
{
strName=_t"决定性攻击",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^c0c0ff[%s]^FFFF00在目标血量少于50%%时，伤害提高50%%并附带星光惩戒效果%s，\t^00FF00星光惩戒^FFFF00\r使目标减速。叠加到5层时，会沉默且定身3秒。\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "使得^c0c0ff[%s]^FFFF00在目标血量少于50%%时，伤害提高50%%并附带星光惩戒效果%s，\t^00FF00星光惩戒^FFFF00\r使目标减速。叠加到5层时，会沉默且定身3秒。\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="skill_desc_str[19].strName;player.skilllevel[4092]>0 and skill_desc.specStr[931] or '';player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天马座圣衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[932]=
{
strName=_t"火流星",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00技能的流星打击附带3秒减速效果\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00技能的流星打击附带3秒减速效果\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="skill_desc_str[1622].strName;player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天鹰座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[933]=
{
strName=_t"光翼庇护",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "使自己周边充满雾气，雾范围6米，此时自己和队友伤害抗性和伤害倍率增加10%%，同时免受移动控制，雾范围内的敌人移动速度下降60%%，伤害大幅下降\r雾持续8秒，雾不会随人物移动。\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "使自己周边充满雾气，雾范围6米，此时自己和队友伤害抗性和伤害倍率增加10%%，同时免受移动控制，雾范围内的敌人移动速度下降60%%，伤害大幅下降\r雾持续8秒，雾不会随人物移动。\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff半人马座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[934]=
{
strName=_t"超新星冲击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "能够立刻打破目标的护盾，并且让目标定身5秒\r附加攻击力:%d\r附加风属性攻击力:%d\r造成%d%%的伤害\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "能够立刻打破目标的护盾，并且让目标定身5秒\r附加攻击力:%d\r附加风属性攻击力:%d\r造成%d%%的伤害\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="0.06*player.level*player.level+12.65*player.level+62.29;0.08*player.level*player.level+15.5*player.level+76.42;100*(0.0108*player.level+2.38);player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天马座圣衣星铸等级达到32级时获得^A2FFFF",
}

skill_desc_str[935]=
{
strName=_t"天马恒星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "将目标击倒，并且伤害降低\r目标离你的距离越远，伤害下降比例越大\r附加攻击力:%d\r附加风属性攻击力:%d\r造成%d%%的伤害\r倒地时间:3秒\r伤害下降比例:%d%%~%d%%\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "将目标击倒，并且伤害降低\r目标离你的距离越远，伤害下降比例越大\r附加攻击力:%d\r附加风属性攻击力:%d\r造成%d%%的伤害\r倒地时间:3秒\r伤害下降比例:%d%%~%d%%\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="0.04*player.level*player.level+8*player.level+39.96;0.03*player.level*player.level+6.78*player.level+33.19;100*(0.0052*player.level+1.14)*(1+0.3*t3);10+10*t3;40+10*t3;player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天鹰座圣衣星铸等级达到16级时获得^A2FFFF",
SkillSoul={ 
   [929] = { desc=_t"释放距离增加3米，冷却时间减少20%%"},
} ,
}

skill_desc_str[936]=
{
strName=_t"恐惧压迫",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00技能有50%%的概率使目标减速6秒，^c0c0ff[%s]^FFFF00蓄力可以将目标打倒3秒，几率与蓄力时间有关，蓄满为100%%\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00技能有50%%的概率使目标减速6秒，^c0c0ff[%s]^FFFF00蓄力可以将目标打倒3秒，几率与蓄力时间有关，蓄满为100%%\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="skill_desc_str[82].strName;skill_desc_str[83].strName;player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff盾牌座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[937]=
{
strName=_t"复苏龙魂",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00使用时不消耗生命\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00使用时不消耗生命\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="skill_desc_str[85].strName;player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天龙座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[938]=
{
strName=_t"斩灵爪",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00会附带一个持续6秒的持续伤害，同时对怪物附加抓伤状态，使怪物的伤害倍率下降10%%\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00会附带一个持续6秒的持续伤害，同时对怪物附加抓伤状态，使怪物的伤害倍率下降10%%\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="skill_desc_str[82].strName;player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff南鱼座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[939]=
{
strName=_t"涉水而行",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "被^c0c0ff[%s]^FFFF00波及到的敌人都会减少移动速度，每次减少1米/秒，最多叠5层%s\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "被^c0c0ff[%s]^FFFF00波及到的敌人都会减少移动速度，每次减少1米/秒，最多叠5层%s\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="skill_desc_str[1590].strName;player.skilllevel[4100]>0 and skill_desc.specStr[939] or '';player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天龙座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[940]=
{
strName=_t"以一当十",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00技能每多作用到一个目标，就可以给自身增加1%%的伤害抗性，最多能叠加10次，持续6秒\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00技能每多作用到一个目标，就可以给自身增加1%%的伤害抗性，最多能叠加10次，持续6秒\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="skill_desc_str[87].strName;player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff盾牌座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[941]=
{
strName=_t"虽远必诛",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00和^c0c0ff[%s]^FFFF00的施放距离增加4米\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00和^c0c0ff[%s]^FFFF00的施放距离增加4米\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="skill_desc_str[93].strName;skill_desc_str[83].strName;player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff御夫座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[942]=
{
strName=_t"阿喀琉斯之踵",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00伤害下降30%%，在目标浮空后额外附带8秒的减速，冷却减少15秒\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00伤害下降30%%，在目标浮空后额外附带8秒的减速，冷却减少15秒\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="skill_desc_str[93].strName;player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff三角座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[943]=
{
strName=_t"再战",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00的%s减伤效果提高10%%，冷却时间减少30秒\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00的%s减伤效果提高10%%，冷却时间减少30秒\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="skill_desc_str[113].strName;player.skilllevel[4101]>0 and '' or skill_desc.specStr[943];player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天龙座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[944]=
{
strName=_t"双生龙牙",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^00FF00%s^FFFF00状态持续期间，^c0c0ff[%s]^FFFF00和^c0c0ff[%s]^FFFF00的伤害提升30%%\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "^00FF00%s^FFFF00状态持续期间，^c0c0ff[%s]^FFFF00和^c0c0ff[%s]^FFFF00的伤害提升30%%\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="skill_desc_str[1590].strName;skill_desc_str[82].strName;skill_desc_str[83].strName;player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff南鱼座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[945]=
{
strName=_t"震怒龙魂",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00附带群体诅咒效果，群体减速并且减少30%%的伤害，持续6秒，冷却时间减少15秒\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00附带群体诅咒效果，群体减速并且减少30%%的伤害，持续6秒，冷却时间减少15秒\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="skill_desc_str[92].strName;player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff三角座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[946]=
{
strName=_t"逆鳞触怒",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "自身血量低于40%%时，伤害抗性提高%d%%\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "自身血量低于40%%时，伤害抗性提高%d%%\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="20+20*t1;player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天龙座圣衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[947]=
{
strName=_t"王者的威慑",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^c0c0ff[%s]^FFFF00^c0c0ff[%s]^FFFF00^c0c0ff[%s]^FFFF00技能的暴击率提升40%%\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "使得^c0c0ff[%s]^FFFF00^c0c0ff[%s]^FFFF00^c0c0ff[%s]^FFFF00技能的暴击率提升40%%\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="skill_desc_str[93].strName;skill_desc_str[83].strName;skill_desc_str[82].strName;player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff御夫座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[948]=
{
strName=_t"庐山煌龙霸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "强烈龙吼震晕周围4米范围所有敌人，晕迷5秒\r晕迷的目标在受到攻击后会醒来\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "强烈龙吼震晕周围4米范围所有敌人，晕迷5秒\r晕迷的目标在受到攻击后会醒来\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff三角座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[949]=
{
strName=_t"千年龙转生",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "选中自己的一个队友，然后移动到其身边，自己和目标都恢复30%%的血量%s\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "选中自己的一个队友，然后移动到其身边，自己和目标都恢复30%%的血量%s\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="player.skilllevel[4103]>0 and skill_desc.specStr[949] or '';player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天龙座圣衣星铸等级达到32级时获得^A2FFFF",
}

skill_desc_str[950]=
{
strName=_t"银河瀑布倒悬",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "打击目标周围5米的目标\r附加攻击力:%d\r附加地属性攻击力:%d\r造成%d%%的伤害\r这个范围内目标越多，伤害越大，伤害最多放大3倍\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "打击目标周围5米的目标\r附加攻击力:%d\r附加地属性攻击力:%d\r造成%d%%的伤害\r这个范围内目标越多，伤害越大，伤害最多放大3倍\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="0.04*player.level*player.level+7.6*player.level+37.36;0.03*player.level*player.level+5.18*player.level+25.79;100*(0.0058*player.level+1.27);player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff御夫座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[958]=
{
strName=_t"使用",
}

skill_desc_str[959]=
{
strName=_t"使用",
}

skill_desc_str[1109]=
{
strName=_t"小宇宙爆发",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[1111]=
{
strName=_t"疾奔",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "需要双击方向键释放\r战斗中每秒消耗体力值50\r战斗外每秒消耗体力值15",
StrUseDesc=_t "需要双击方向键释放\r战斗中每秒消耗体力值50\r战斗外每秒消耗体力值15",
StrFuncdesc=_t"可进入疾奔状态\r每秒移动速度提高到140%%",
}

skill_desc_str[1117]=
{
strName=_t"使用弦月琴",
}

skill_desc_str[1207]=
{
strName=_t"尤朵拉的药包",
}

skill_desc_str[1208]=
{
strName=_t"普罗米修斯之锤",
}

skill_desc_str[1289]=
{
strName=_t"普通攻击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "造成75%%的伤害",
StrUseDesc=_t "造成75%%的伤害",
}

skill_desc_str[1429]=
{
strName=_t"回旋踢",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "艾欧罗斯的基础招式",
StrUseDesc=_t "艾欧罗斯的基础招式",
}

skill_desc_str[1430]=
{
strName=_t"闪电飞踢",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "艾欧罗斯的强力攻击",
StrUseDesc=_t "艾欧罗斯的强力攻击",
}

skill_desc_str[1444]=
{
strName=_t"白鸟裂踢",
}

skill_desc_str[1445]=
{
strName=_t"裂空风暴角锁",
}

skill_desc_str[1446]=
{
strName=_t"地狱圆锁",
}

skill_desc_str[1462]=
{
strName=_t"正义之语",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "以正义的言辞令敌人羞愧",
StrUseDesc=_t "以正义的言辞令敌人羞愧",
}

skill_desc_str[1463]=
{
strName=_t"恢复生命",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "恢复一定生命值",
StrUseDesc=_t "恢复一定生命值",
}

skill_desc_str[1518]=
{
strName=_t"龙魂感知",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "受治疗效果提升25%%，并使天龙座能够招架怪物的重击",
StrUseDesc=_t "受治疗效果提升25%%，并使天龙座能够招架怪物的重击",
}

skill_desc_str[1519]=
{
strName=_t"凌虐之焰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\t^00FF00烈焰焚烧^FFFF00\r持续造成伤害，最高可叠5层，层数越高造成的伤害越高。\r此状态的层数将提高受到以下技能的伤害\r^00FF00凤凰现临^FFFF00，^00FF00憎恨虐杀^FFFF00，^00FF00幻魔拳^FFFF00，^00FF00电浆风暴^FFFF00\r持续20秒",
StrUseDesc=_t "附加攻击力:%d\r附加火属性攻击力:%d\r造成%d%%的伤害\t^00FF00烈焰焚烧^FFFF00\r持续造成伤害，最高可叠5层，层数越高造成的伤害越高。\r此状态的层数将提高受到以下技能的伤害\r^00FF00凤凰现临^FFFF00，^00FF00憎恨虐杀^FFFF00，^00FF00幻魔拳^FFFF00，^00FF00电浆风暴^FFFF00\r持续20秒",
StrDescNum="math.ceil(0.16*level*level+15.84*level+32.04);math.ceil(0.087*level*level+8.704*level+17.6);math.ceil((0.014*level+1.567)*100)",
StrFuncdesc=_t"打击目标，并溅射周围目标\r给目标附加烈焰焚烧状态",
SkillSoul={ 
   [1932] = { desc=_t"附加烈焰焚烧状态变为2层，伤害提升15%%"},
} ,
}

skill_desc_str[1520]=
{
strName=_t"怒火之焰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\t^00FF00烈焰焚烧^FFFF00\r持续造成伤害，最高可叠5层，层数越高造成的伤害越高。\r此状态的层数将提高受到以下技能的伤害\r^00FF00凤凰现临^FFFF00，^00FF00憎恨虐杀^FFFF00，^00FF00幻魔拳^FFFF00，^00FF00电浆风暴^FFFF00\r持续20秒",
StrUseDesc=_t "附加攻击力:%d\r附加火属性攻击力:%d\r造成%d%%的伤害\t^00FF00烈焰焚烧^FFFF00\r持续造成伤害，最高可叠5层，层数越高造成的伤害越高。\r此状态的层数将提高受到以下技能的伤害\r^00FF00凤凰现临^FFFF00，^00FF00憎恨虐杀^FFFF00，^00FF00幻魔拳^FFFF00，^00FF00电浆风暴^FFFF00\r持续20秒",
StrDescNum="math.ceil(0.195*level*level+19.32*level+39.08);math.ceil(0.131*level*level+13.05*level+26.41);math.ceil((0.017*level+1.841)*100)",
StrFuncdesc=_t"打击目标，并溅射周围目标\r给目标附加烈焰焚烧状态，有概率附加2层",
SkillSoul={ 
   [1932] = { desc=_t"附加烈焰焚烧状态变为2层，伤害提升15%%"},
   [1934] = { desc=_t"每次有10%%概率立即清除电浆风暴的冷却时间"},
} ,
}

skill_desc_str[1521]=
{
strName=_t"冲击之焰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r减少移动速度:60%%",
StrUseDesc=_t "附加攻击力:%d\r附加火属性攻击力:%d\r造成%d%%的伤害\r减少移动速度:60%%",
StrDescNum="math.ceil(0.16*level*level+16.16*level+48.04);math.ceil(0.087*level*level+8.88*level+26.39);math.ceil((0.007*level+0.759)*100)",
StrFuncdesc=_t"打击目标，并溅射周围目标\r给目标立即附加5层烈焰焚烧状态\r产生的高温将使对手减速5秒",
SkillSoul={ 
   [1937] = { desc=_t"冷却时间降为%s秒",num="player.skilllevel[4109]>0 and 15 or 20"},
} ,
}

skill_desc_str[1522]=
{
strName=_t"凤凰现临",
StrAttacktype=_t"主动攻击",
StrMana=_t "目标烈焰焚烧层数越高，造成伤害越高.",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r至少造成{^FFABFC%d%%^FFFF00}的伤害\t^00FF00地狱烈焰^FFFF00\r持续造成伤害\r持续10秒\r\t^00FF00狮子座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发",
StrUseDesc=_t "附加攻击力:%d\r附加火属性攻击力:%d\r至少造成%d%%的伤害\t^00FF00地狱烈焰^FFFF00\r持续造成伤害\r持续10秒\r\t^00FF00狮子座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发",
StrDescNum="math.ceil(0.252*level*level+27.3*level+168.3);math.ceil(0.219*level*level+23.73*level+146.3);math.ceil((0.018*level+2.042)*80)",
StrFuncdesc=_t"猛烈的打击目标，并溅射周围目标\r对目标附加地狱烈焰状态",
SkillSoul={ 
   [1933] = { desc=_t"目标处于5层烈焰焚烧状态时，伤害额外提升25%%"},
   [1939] = { desc=_t"%s可将目标击退3米",num="player.skilllevel[4111]>0 and '' or '目标烈焰焚烧层数达到3层以上时，'"},
   [1944] = { desc=_t"开始释放时可获得凤魂佑护效果5秒，抵御相当于自身生命上限10%%的伤害"},
} ,
}

skill_desc_str[1523]=
{
strName=_t"火鸟之怒",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r目标范围:半径5米圆形区域\t^00FF00火焰之力^FFFF00\r^00FF00凌虐之焰^FFFF00，^00FF00怒火之焰^FFFF00和^00FF00凤凰现临^FFFF00攻击范围扩大为半径5米圆形区域，溅射伤害大幅度提升\r持续10秒\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962狮王怒焰]^FFFF00\r^c0c0ff伤害提升100%%，同时制造一个分身攻击目标，自身获得狮王火焰之力状态",
StrUseDesc=_t "附加攻击力:%d\r附加火属性攻击力:%d\r造成%d%%的伤害\r目标范围:半径5米圆形区域\t^00FF00火焰之力^FFFF00\r^00FF00凌虐之焰^FFFF00，^00FF00怒火之焰^FFFF00和^00FF00凤凰现临^FFFF00攻击范围扩大为半径5米圆形区域，溅射伤害大幅度提升\r持续10秒\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962狮王怒焰]^FFFF00\r^c0c0ff伤害提升100%%，同时制造一个分身攻击目标，自身获得狮王火焰之力状态",
StrDescNum="math.ceil(0.142*level*level+14.66*level+57.28);math.ceil(0.07*level*level+7.244*level+28.29);math.ceil((0.011*level+1.277)*((player.bufflevel[2392]>0)?2.5:1)*100)",
StrFuncdesc=_t"召唤火凤凰焚烧目标区域.同时使自己进入火焰之力状态\r对目标附加烈焰焚烧效果",
SkillSoul={ 
   [4541] = { desc=_t"每次施放时在地面上留下一片火焰痕迹，对在痕迹中的敌人造成伤害"},
   [5687] = { desc=_t"对攻击范围内的目标附加黑洞之力状态"},
   [5686] = { desc=_t"%s使自身进入怒焰状态,提高火鸟之怒的伤害，降低火鸟之怒的冷却时间",num="skill_desc_str[1528].strName"},
} ,
}

skill_desc_str[1524]=
{
strName=_t"凤凰幻动",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "移动距离:15米\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962狮子搏兔]^FFFF00\r^c0c0ff使周围的敌人将在定身4秒\r同时自身将获得狮王之盾状态",
StrUseDesc=_t "移动距离:15米\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962狮子搏兔]^FFFF00\r^c0c0ff使周围的敌人将在定身4秒\r同时自身将获得狮王之盾状态",
StrFuncdesc=_t"展开羽翼向前方快速的滑翔",
SkillSoul={ 
   [1942] = { desc=_t"可立即解除自身的移动控制状态"},
} ,
}

skill_desc_str[1525]=
{
strName=_t"死亡皇后之焰",
StrAttacktype=_t"召唤技能",
StrCompDesc=_t "幻像附加攻击力:{^FFABFC%d^FFFF00}\r幻像附加火属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对目标定身:4秒\r幻像最多存在20秒\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962狮王之影]^FFFF00\r^c0c0ff召唤出黄金狮子座艾欧里亚之影\r伤害提升100%%，同时可打断目标正在释放的技能",
StrUseDesc=_t "幻像附加攻击力:%d\r幻像附加火属性攻击力:%d\r造成%d%%的伤害\r对目标定身:4秒\r幻像最多存在20秒\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962狮王之影]^FFFF00\r^c0c0ff召唤出黄金狮子座艾欧里亚之影\r伤害提升100%%，同时可打断目标正在释放的技能",
StrDescNum="math.ceil(0.195*level*level+23.03*level+240.2);math.ceil(0.131*level*level+15.56*level+162.3);math.ceil((0.013*level+1.536)*100)",
StrFuncdesc=_t"召唤出黑暗凤凰座，快速向敌方移动\r幻像一旦靠近敌方，会立即攻击周围敌人，被攻击到的人将无法移动",
SkillSoul={ 
   [4543] = { desc=_t"召唤的黑暗凤凰移动速度提升3米/秒，同时击中敌人时伤害提升80%%"},
} ,
}

skill_desc_str[1526]=
{
strName=_t"憎恨虐杀",
StrAttacktype=_t"主动攻击",
StrMana=_t "目标烈焰焚烧层数越高，造成伤害越高.",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r击退距离:10米\r至少造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加火属性攻击力:%d\r击退距离:10米\r至少造成%d%%的伤害",
StrDescNum="math.ceil(0.276*level*level+34.04*level+424.1);math.ceil(0.263*level*level+32.44*level+404.1);math.ceil((0.026*level+3.139)*100)",
StrFuncdesc=_t"将内心深处的怨恨发泄在目标身上，将其及其附近敌人拖至身前给予猛烈的打击，并重重的击飞，造成大量伤害",
SkillSoul={ 
   [1933] = { desc=_t"目标处于5层烈焰焚烧状态时，伤害额外提升25%%"},
   [1935] = { desc=_t"每次使用将获得天威凌压状态%d秒，暴击率提升%d%%",num="5+3*player.skilllevel[4112];50+25*player.skilllevel[4112]"},
   [1940] = { desc=_t"冷却时间变为50秒，并且最后一击可使敌人眩晕5秒"},
} ,
}

skill_desc_str[1527]=
{
strName=_t"幻魔拳",
StrAttacktype=_t"主动攻击",
StrMana=_t "目标烈焰焚烧层数越高，造成伤害越高.",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r混乱时间:5秒\r至少造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加火属性攻击力:%d\r混乱时间:5秒\r至少造成%d%%的伤害",
StrDescNum="math.ceil(0.276*level*level+40.96*level+892.9);math.ceil(0.263*level*level+39.03*level+850.9);math.ceil((0.013*level+1.735)*100)",
StrFuncdesc=_t"利用精神力量打击对方，使其进入混乱状态，造成大量伤害",
SkillSoul={ 
   [1933] = { desc=_t"目标处于5层烈焰焚烧状态时，伤害额外提升25%%"},
} ,
}

skill_desc_str[1528]=
{
strName=_t"火之领域",
StrAttacktype=_t"召唤技能",
StrCompDesc=_t "^00FF00领域之力^FFFF00\r伤害倍率提高10%%\r持续20秒",
StrUseDesc=_t "^00FF00领域之力^FFFF00\r伤害倍率提高10%%\r持续20秒",
StrDescNum="10",
StrFuncdesc=_t"使15米范围内自己和队友获得领域之力状态，使用造成伤害提升",
SkillSoul={ 
   [1938] = { desc=_t"领域之力状态下移动速度提升60%%"},
   [1943] = { desc=_t"领域之力状态下受到伤害减少%s%%",num="player.skilllevel[4110]>0 and 25 or 16"},
   [5688] = { desc=_t"可使生命低于50%%的队友及自身瞬间回复生命上限5%%的血量,并且每秒回复生命上限的1%%"},
   [5686] = { desc=_t"使自身进入怒焰状态,提高火鸟之怒的伤害，降低火鸟之怒的冷却时间"},
} ,
}

skill_desc_str[1529]=
{
strName=_t"电浆风暴",
StrAttacktype=_t"主动攻击",
StrMana=_t "目标烈焰焚烧层数越高，造成伤害越高.",
StrCompDesc=_t "幻像附加攻击力:{^FFABFC%d^FFFF00}\r幻像附加火属性攻击力:{^FFABFC%d^FFFF00}\r至少造成{^FFABFC%d%%^FFFF00}的伤害\r黑暗四天王将存在20秒",
StrUseDesc=_t "幻像附加攻击力:%d\r幻像附加火属性攻击力:%d\r至少造成%d%%的伤害\r黑暗四天王将存在20秒",
StrDescNum="math.ceil(0.299*level*level+42.78*level+856.3);math.ceil(0.307*level*level+44*level+880.8);math.ceil((0.03*level+3.971)*100)",
StrFuncdesc=_t"跃起空中，凶猛的打击目标，并溅射周围目标，造成大量伤害\r随机召唤黑暗四天王中的两个来协助作战.",
SkillSoul={ 
   [1933] = { desc=_t"目标处于5层烈焰焚烧状态时，伤害额外提升25%%"},
   [1934] = { desc=_t"怒火之焰有10%%的概率立即清除该技能的冷却时间"},
} ,
}

skill_desc_str[1530]=
{
strName=_t"黑暗之令",
StrAttacktype=_t"召唤技能",
StrCompDesc=_t "伤害倍率提高:50%%\r持续15秒\r黑暗四天王将存在20秒",
StrUseDesc=_t "伤害倍率提高:50%%\r持续15秒\r黑暗四天王将存在20秒",
StrFuncdesc=_t"召唤黑暗四天王中的两个协助作战.同时自己的伤害能力将获得大幅提升.",
}

skill_desc_str[1531]=
{
strName=_t"艾斯美达的祝福",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "火焰护盾存在时间:10秒\r^c0c0ff[艾斯美达之焰]^FFFF00\r对目标持续造成伤害\r持续10秒",
StrUseDesc=_t "火焰护盾存在时间:10秒\r^c0c0ff[艾斯美达之焰]^FFFF00\r对目标持续造成伤害\r持续10秒",
StrFuncdesc=_t"生成火焰护盾保护自己，所有攻击自己的敌人都将受到艾斯美达之焰的燃烧",
}

skill_desc_str[1532]=
{
strName=_t"浴火重生",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "\r\t^00FF00复生之盾^FFFF00\r可吸收伤害量为生命上限的50%%\r最多持续8秒\r^00FF00虚弱^FFFF00\r每2秒损失生命上限的10%%\r持续10秒",
StrUseDesc=_t "\r\t^00FF00复生之盾^FFFF00\r可吸收伤害量为生命上限的50%%\r最多持续8秒\r^00FF00虚弱^FFFF00\r每2秒损失生命上限的10%%\r持续10秒",
StrFuncdesc=_t"凤凰守护星座将在死亡时复活，复活时获得复生之盾状态.复生之盾状态结束前如果被打破，则进入虚弱状态",
SkillSoul={ 
   [4545] = { desc=_t"触发时获得重生之怒效果，不会受到伤害，同时免疫所有控制效果，且体力回满"},
} ,
}

skill_desc_str[1533]=
{
strName=_t"羽影幻遁",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "此技能释放过程中，怪物们会忽略你的存在。",
StrUseDesc=_t "此技能释放过程中，怪物们会忽略你的存在。",
StrFuncdesc=_t"暂时收起锋芒，藏于羽翼之下.",
SkillSoul={ 
   [1945] = { desc=_t"成功释放结束后可进入隐身状态，生命低于50%%时，隐身效果将在释放到第2秒时触发"},
} ,
}

skill_desc_str[1534]=
{
strName=_t"不死鸟之歌",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"用不死鸟的吟唱唤醒处于死亡状态的目标.",
}

skill_desc_str[1535]=
{
strName=_t"一辉_起手DEBUFF怪物技能1",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[1536]=
{
strName=_t"一辉_起手DEBUFF怪物技能2",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[1537]=
{
strName=_t"一辉_召唤替身怪物技能1",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[1538]=
{
strName=_t"一辉_幻魔拳怪物技能1",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[1539]=
{
strName=_t"一辉_幻魔拳怪物技能2",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[1540]=
{
strName=_t"一辉_火焰领域怪物技能1",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[1541]=
{
strName=_t"一辉_火焰领域怪物技能2",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[1542]=
{
strName=_t"一辉_爆发召唤怪物1技能1",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[1543]=
{
strName=_t"一辉_爆发召唤怪物1技能2",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[1544]=
{
strName=_t"一辉_爆发召唤怪物2技能1",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[1545]=
{
strName=_t"一辉_爆发召唤怪物2技能2",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[1546]=
{
strName=_t"一辉_爆发召唤怪物3技能1",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[1547]=
{
strName=_t"一辉_爆发召唤怪物3技能2",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[1548]=
{
strName=_t"一辉_爆发召唤怪物4技能1",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[1549]=
{
strName=_t"一辉_爆发召唤怪物4技能2",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[1550]=
{
strName=_t"一辉_火焰盾反击技能",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[1553]=
{
strName=_t"双子冲击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "加隆的通常单体攻击",
StrUseDesc=_t "加隆的通常单体攻击",
}

skill_desc_str[1554]=
{
strName=_t"异次元空间拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "加隆拿手的攻击技能，可以造成以自身范围圆形的大伤害。",
StrUseDesc=_t "加隆拿手的攻击技能，可以造成以自身范围圆形的大伤害。",
}

skill_desc_str[1555]=
{
strName=_t"死亡宣告",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "加隆出色的减速技能，可以造成前方扇形大范围的倒地效果。",
StrUseDesc=_t "加隆出色的减速技能，可以造成前方扇形大范围的倒地效果。",
}

skill_desc_str[1556]=
{
strName=_t"银河星爆",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "加隆最终绝技，可以造成极大的伤害。",
StrUseDesc=_t "加隆最终绝技，可以造成极大的伤害。",
}

skill_desc_str[1587]=
{
strName=_t"能量释放",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[1590]=
{
strName=_t"龙魂裂破",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "%d秒内对周围4米的敌人共造成5次伤害\r附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "%d秒内对周围4米的敌人共造成5次伤害\r附加攻击力:%d\r附加水属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="8+2*t3;0.16*level*level+16.66*level+72.18;0.09*level*level+9.58*level+41.33;100*(0.0058*level+0.64)*(1+0.3*t3)*1.3",
StrFuncdesc=_t"使自己处于龙魂裂破状态，对周围的敌人造成持续伤害",
SkillSoul={ 
   [939] = { desc=_t"每一次伤害都将使目标减少1米/秒的移动速度，最多叠5层%s",num="player.skilllevel[4100]>0 and '，持续时间增加2秒，伤害提高30%' or ''"},
   [944] = { desc=_t"状态持续期间，龙爪斩翔和庐山龙飞翔的伤害提高30%%"},
} ,
}

skill_desc_str[1622]=
{
strName=_t"星辰乱坠",
StrAttacktype=_t"召唤技能",
StrCompDesc=_t "短时间召唤大量流星打击周围单位\r流星附加攻击力:{^FFABFC%d^FFFF00}\r流星附加风属性攻击力:{^FFABFC%d^FFFF00}\r每颗流星造成{^FFABFC%d%%^FFFF00}的伤害\r持续时间:%d秒\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962箭雨流星]^FFFF00\r^c0c0ff召唤黄金箭雨，伤害较流星提升15%%",
StrUseDesc=_t "短时间召唤大量流星打击周围单位\r流星附加攻击力:%d\r流星附加风属性攻击力:%d\r每颗流星造成%d%%的伤害\r持续时间:%d秒\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962箭雨流星]^FFFF00\r^c0c0ff召唤黄金箭雨，伤害较流星提升15%%",
StrDescNum="0.13*level*level+12.83*level+56.04;0.06*level*level+6.32*level+26.62;120*(1+0.1*player.skilllevel[928])*(0.0035*level+0.38);6+player.skilllevel[928]*3",
StrFuncdesc=_t"召唤流星打击周围目标",
SkillSoul={ 
   [928] = { desc=_t"持续时间增加3秒，伤害提高10%%"},
   [932] = { desc=_t"被流星击中的单位会减少60%%的移动速度，持续3秒"},
   [4287] = { desc=_t"落下的每颗流星有20%%的概率变为大流星，伤害范围增加1米，伤害为原来的4倍"},
} ,
}

skill_desc_str[1723]=
{
strName=_t"积尸气冥界波",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "将所有生命送入地狱！\r无视一切防御，直接攻击灵魂的终极招数！",
StrUseDesc=_t "将所有生命送入地狱！\r无视一切防御，直接攻击灵魂的终极招数！",
}

skill_desc_str[1724]=
{
strName=_t"原子闪电光速拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "超越原子爆裂的强大能量！\r打出光一般的速度！",
StrUseDesc=_t "超越原子爆裂的强大能量！\r打出光一般的速度！",
}

skill_desc_str[1740]=
{
strName=_t"龙爪斩翔",
}

skill_desc_str[1774]=
{
strName=_t"小宇宙精华",
}

skill_desc_str[1775]=
{
strName=_t"玫瑰之刺",
}

skill_desc_str[1794]=
{
strName=_t"黄金圣剑",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "制裁的圣剑，将无尽的黑暗劈开！",
StrUseDesc=_t "制裁的圣剑，将无尽的黑暗劈开！",
}

skill_desc_str[1795]=
{
strName=_t"圣剑三连",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "聚集小宇宙能量的圣剑之芒！\r颤抖吧，大地！",
StrUseDesc=_t "聚集小宇宙能量的圣剑之芒！\r颤抖吧，大地！",
}

skill_desc_str[1830]=
{
strName=_t"六边结晶",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^c0c0ff[%s]^FFFF00不蓄力时，炸弹数量增加1个；蓄力时炸弹的伤害提升20%%\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "使得^c0c0ff[%s]^FFFF00不蓄力时，炸弹数量增加1个；蓄力时炸弹的伤害提升20%%\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="skill_desc_str[71].strName;player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff白鸟座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[1831]=
{
strName=_t"冰之舞",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00在使用后会带一个移动速度增加5米每秒的状态，持续8秒，受到伤害则该状态中断%s\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00在使用后会带一个移动速度增加5米每秒的状态，持续8秒，受到伤害则该状态中断%s\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="skill_desc_str[77].strName;player.skilllevel[4094]>0 and skill_desc.specStr[1831] or '';player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff箭鱼座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[1832]=
{
strName=_t"雪精灵",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00每次雷击有20%%的几率将目标击晕2秒\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00每次雷击有20%%的几率将目标击晕2秒\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="skill_desc_str[104].strName;player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff海蛇座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[1833]=
{
strName=_t"冻裂",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "被寒冰减速的目标的水属性抗性会下降%d点，持续6秒\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "被寒冰减速的目标的水属性抗性会下降%d点，持续6秒\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="25+15*player.skilllevel[4095];player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff白鸟座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[1834]=
{
strName=_t"冻气增幅",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00和^c0c0ff[%s]^FFFF00会附加强力的诅咒，使目标造成的伤害减少25%%，持续6秒\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00和^c0c0ff[%s]^FFFF00会附加强力的诅咒，使目标造成的伤害减少25%%，持续6秒\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="skill_desc_str[67].strName;skill_desc_str[131].strName;player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff箭鱼座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[1835]=
{
strName=_t"速冻",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00的冰冻时间增加3秒，冷却时间下降15秒\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00的冰冻时间增加3秒，冷却时间下降15秒\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="skill_desc_str[99].strName;player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff网罟座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[1836]=
{
strName=_t"以战养战",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "每次使用^c0c0ff[%s]^FFFF00后的8秒内，下一次消耗的冻气减少50%%\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "每次使用^c0c0ff[%s]^FFFF00后的8秒内，下一次消耗的冻气减少50%%\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="skill_desc_str[69].strName;player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff白鸟座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[1837]=
{
strName=_t"永冻冰壁",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "每次使用召唤技能时，都会在自己身上生成冰壁，抵御下次伤害，冰壁生成后存在60秒，不可叠加\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "每次使用召唤技能时，都会在自己身上生成冰壁，抵御下次伤害，冰壁生成后存在60秒，不可叠加\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff乌鸦座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[1838]=
{
strName=_t"寒潮频发",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00冷却时间减少20秒（变为30秒）%s\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00冷却时间减少20秒（变为30秒）%s\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="skill_desc_str[70].strName;player.skilllevel[4096]>0 and skill_desc.specStr[1838] or '';player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff海蛇座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[1839]=
{
strName=_t"潮汐之力",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "冰河每次使用召唤技能，都能激发体内的潮汐之力给自己和周围12米范围内的队友，使得受影响的目标伤害倍率提升5%% %s，持续10秒，不可叠加\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "冰河每次使用召唤技能，都能激发体内的潮汐之力给自己和周围12米范围内的队友，使得受影响的目标伤害倍率提升5%% %s，持续10秒，不可叠加\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="player.skilllevel[4097]>0 and skill_desc.specStr[1839] or ' ' ;player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff白鸟座圣衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[1840]=
{
strName=_t"极光升华",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00冷却时间减少20秒，且在盾触发时附带解除控制的效果\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00冷却时间减少20秒，且在盾触发时附带解除控制的效果\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="skill_desc_str[224].strName;player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff乌鸦座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[1841]=
{
strName=_t"双重冻结",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "对于已经被寒冰减速的单位，被静止的^c0c0ff[%s]^FFFF00伤害后会被冰封住3秒\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "对于已经被寒冰减速的单位，被静止的^c0c0ff[%s]^FFFF00伤害后会被冰封住3秒\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="skill_desc_str[71].strName;player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff网罟座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[1842]=
{
strName=_t"极光天舞",
StrAttacktype=_t"召唤技能",
StrMana=_t "消耗%d点冻气",
StrCompDesc=_t "召唤6只冰鸟，每只冰鸟会随机选取周围5米内的一个目标进行攻击\r冰鸟附加攻击力:%d\r冰鸟附加水属性攻击力:%d\r造成%d%%的伤害\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "召唤6只冰鸟，每只冰鸟会随机选取周围5米内的一个目标进行攻击\r冰鸟附加攻击力:%d\r冰鸟附加水属性攻击力:%d\r造成%d%%的伤害\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="0.05*player.level*player.level+10.46*player.level+51.49;0.03*player.level*player.level+6.83*player.level+34.14;100*(0.0043*player.level+0.94);player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff白鸟座圣衣星铸等级达到32级时获得^A2FFFF",
SkillSoul={ 
   [1837] = { desc=_t"使用后会在自己身上生成冰壁，抵御下次伤害，冰壁生成后存在60秒，不可叠加"},
   [1839] = { desc=_t"使用后自己和周围12米范围内的队友伤害倍率增加5%%%s，持续10秒，不可叠加",num="player.skilllevel[4097]>0 and '暴击率增加5%' or ' '"},
} ,
}

skill_desc_str[1843]=
{
strName=_t"永冻冰海之花",
StrAttacktype=_t"召唤技能",
StrMana=_t "消耗%d点冻气",
StrCompDesc=_t "在目标区域召唤一朵冰花，冰花召出后3秒开始，会在有敌人接近后自爆，使目标减速3秒，如果目标之前已被寒冰减速，则冰冻住3秒\r冰花持续10秒\r冰花附加攻击力:%d\r冰花附加水属性攻击力:%d\r造成%d%%的伤害\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "在目标区域召唤一朵冰花，冰花召出后3秒开始，会在有敌人接近后自爆，使目标减速3秒，如果目标之前已被寒冰减速，则冰冻住3秒\r冰花持续10秒\r冰花附加攻击力:%d\r冰花附加水属性攻击力:%d\r造成%d%%的伤害\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="0.04*player.level*player.level+7.15*player.level+34.81;0.02*player.level*player.level+3.21*player.level+15.77;100*(0.002*player.level+0.44);player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff乌鸦座圣衣星铸等级达到16级时获得^A2FFFF",
SkillSoul={ 
   [1833] = { desc=_t"被减速的单位水属性抗性下降%d点，持续6秒",num="25+15*player.skilllevel[4095]"},
   [1837] = { desc=_t"使用后会在自己身上生成冰壁，抵御下次伤害，冰壁生成后存在60秒，不可叠加"},
   [1839] = { desc=_t"使用后自己和周围12米范围内的队友伤害倍率增加5%%%s，持续10秒，不可叠加",num="player.skilllevel[4097]>0 and '暴击率增加5%' or ' '"},
} ,
}

skill_desc_str[1844]=
{
strName=_t"冰霜巨人封印",
StrAttacktype=_t"主动诅咒",
StrCompDesc=_t "释放技能期间将目标锁住，每秒消耗%d点冻气\r被锁住的目标伤害抗性将下降20%%\r释放技能结束时将使目标额外被锁住3秒\r自己在血量低于60%%时将自动结束该技能\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "释放技能期间将目标锁住，每秒消耗%d点冻气\r被锁住的目标伤害抗性将下降20%%\r释放技能结束时将使目标额外被锁住3秒\r自己在血量低于60%%时将自动结束该技能\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="30*(1-0.5*t6);player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff网罟座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[1917]=
{
strName=_t"精力之光",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使用^c0c0ff[%s]^FFFF00将对目标周围3米范围内的友方产生20%%的治疗\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "使用^c0c0ff[%s]^FFFF00将对目标周围3米范围内的友方产生20%%的治疗\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="skill_desc_str[513].strName;player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff仙女座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[1918]=
{
strName=_t"紧急止血",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00可使自己和队友伤害抗性提升5%%\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00可使自己和队友伤害抗性提升5%%\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="skill_desc_str[514].strName;player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff仙女座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[1919]=
{
strName=_t"持久守护",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "处于^c0c0ff[%s]^FFFF00范围内的队友，将在受到伤害时获得持久守护状态\t^00FF00持久守护^FFFF00\r每秒回复%d%%的生命\r持续5秒\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "处于^c0c0ff[%s]^FFFF00范围内的队友，将在受到伤害时获得持久守护状态\t^00FF00持久守护^FFFF00\r每秒回复%d%%的生命\r持续5秒\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="skill_desc_str[517].strName;1+player.skilllevel[4106];player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff仙女座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[1920]=
{
strName=_t"抢救",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "%s^c0c0ff[%s]^FFFF00的初始回复量和伤害抵御值将提升50%%\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "%s^c0c0ff[%s]^FFFF00的初始回复量和伤害抵御值将提升50%%\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="player.skilllevel[4107]>0 and '' or skill_desc.specStr[1920];skill_desc_str[518].strName;player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff仙女座圣衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[1921]=
{
strName=_t"冥王的特赦",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "使目标获得冥王特赦状态\t^00FF00冥王特赦^FFFF00\r受到致命的一击时，重新燃起战斗的力量\r回复%d%%生命。\r状态持续%d秒\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "使目标获得冥王特赦状态\t^00FF00冥王特赦^FFFF00\r受到致命的一击时，重新燃起战斗的力量\r回复%d%%生命。\r状态持续%d秒\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="20+10*t2;8+8*t2;player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff仙女座圣衣星铸等级达到32级时获得^A2FFFF",
}

skill_desc_str[1922]=
{
strName=_t"激励",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00释放时可驱散自身和队友受到的移动控制状态，该效果触发冷却时间为12秒\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00释放时可驱散自身和队友受到的移动控制状态，该效果触发冷却时间为12秒\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="skill_desc_str[514].strName;player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff六分仪座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[1923]=
{
strName=_t"蔷薇杀阵",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00释放时可使敌人沉默3秒，此效果触发冷却时间为30秒%s\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00释放时可使敌人沉默3秒，此效果触发冷却时间为30秒%s\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="skill_desc_str[528].strName;player.skilllevel[4105]>0 and skill_desc.specStr[1923] or '';player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff六分仪座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[1924]=
{
strName=_t"强力束缚",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00的冷却时间变为30秒，同时产生的拉拽效果将可对玩家生效。\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00的冷却时间变为30秒，同时产生的拉拽效果将可对玩家生效。\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="skill_desc_str[525].strName;player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff武仙座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[1925]=
{
strName=_t"星之轨迹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00可以使目标提升移动速度60%%\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00可以使目标提升移动速度60%%\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="skill_desc_str[518].strName;player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff武仙座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[1926]=
{
strName=_t"电流脉冲",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "使自身获得电流脉冲状态\t^00FF00电流脉冲^FFFF00\r攻击自己的敌人将被电流击倒。\r最多生效5次\r持续10秒\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "使自身获得电流脉冲状态\t^00FF00电流脉冲^FFFF00\r攻击自己的敌人将被电流击倒。\r最多生效5次\r持续10秒\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff武仙座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[1927]=
{
strName=_t"锁链标记",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00将使目标获得锁链共鸣状态\t^00FF00锁链共鸣^FFFF00\r受到仙女座技能伤害提升%d%%\r持续15秒\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00将使目标获得锁链共鸣状态\t^00FF00锁链共鸣^FFFF00\r受到仙女座技能伤害提升%d%%\r持续15秒\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="skill_desc_str[525].strName;6+4*player.skilllevel[4104];player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff变色龙座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[1928]=
{
strName=_t"黄金角锁",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00的伤害提升20%%\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00的伤害提升20%%\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="skill_desc_str[524].strName;player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff仙王座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[1929]=
{
strName=_t"逆之秘仪",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00消耗神威领域值减半，但仍能造成很高的伤害。\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00消耗神威领域值减半，但仍能造成很高的伤害。\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="skill_desc_str[528].strName;player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff变色龙座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[1930]=
{
strName=_t"星云爆发",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "每次使用^c0c0ff[%s]^FFFF00可获得星云爆发状态\t^00FF00星云爆发^FFFF00\r提高暴击率50%%\r持续10秒\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "每次使用^c0c0ff[%s]^FFFF00可获得星云爆发状态\t^00FF00星云爆发^FFFF00\r提高暴击率50%%\r持续10秒\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="skill_desc_str[527].strName;player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff仙王座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[1931]=
{
strName=_t"星云离子风",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加雷属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r每次^c0c0ff[%s]^FFFF00有20%%的概率可立即重置该技能的冷却\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "附加攻击力:%d\r附加雷属性攻击力:%d\r造成%d%%的伤害\r每次^c0c0ff[%s]^FFFF00有20%%的概率可立即重置该技能的冷却\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="math.ceil(0.063*player.level*player.level+12.64*player.level+63.2);math.ceil(0.076*player.level*player.level+15.25*player.level+76.26);math.ceil((0.01*player.level+2.141)*100);skill_desc_str[524].strName;player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff仙王座圣衣星铸等级达到16级时获得^A2FFFF",
SkillSoul={ 
   [4539] = { desc=_t"造成伤害提升20%%"},
} ,
}

skill_desc_str[1932]=
{
strName=_t"烈焰侵袭",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00和^c0c0ff[%s]^FFFF00每次都会附加2层烈焰焚烧状态，同时这两个技能的伤害提升15%%\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00和^c0c0ff[%s]^FFFF00每次都会附加2层烈焰焚烧状态，同时这两个技能的伤害提升15%%\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="skill_desc_str[1519].strName;skill_desc_str[1520].strName;player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff凤凰座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[1933]=
{
strName=_t"高温电浆",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "在目标处于5层烈焰焚烧状态时\r^c0c0ff[%s]^FFFF00，^c0c0ff[%s]^FFFF00，^c0c0ff[%s]^FFFF00和^c0c0ff[%s]^FFFF00额外增加25%%伤害\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "在目标处于5层烈焰焚烧状态时\r^c0c0ff[%s]^FFFF00，^c0c0ff[%s]^FFFF00，^c0c0ff[%s]^FFFF00和^c0c0ff[%s]^FFFF00额外增加25%%伤害\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="skill_desc_str[1522].strName;skill_desc_str[1526].strName;skill_desc_str[1527].strName;skill_desc_str[1529].strName;player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff凤凰座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[1934]=
{
strName=_t"临界温度",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00有10%%的概率立即清除^c0c0ff[%s]^FFFF00的冷却时间\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00有10%%的概率立即清除^c0c0ff[%s]^FFFF00的冷却时间\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="skill_desc_str[1520].strName;skill_desc_str[1529].strName;player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff凤凰座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[1935]=
{
strName=_t"天威凌压",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "每次使用^c0c0ff[%s]^FFFF00将获得天威凌压状态\t^00FF00天威凌压^FFFF00\r暴击率提升%d%%\r持续%d秒\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "每次使用^c0c0ff[%s]^FFFF00将获得天威凌压状态\t^00FF00天威凌压^FFFF00\r暴击率提升%d%%\r持续%d秒\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="skill_desc_str[1526].strName;50+25*player.skilllevel[4112];5+3*player.skilllevel[4112];player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff凤凰座圣衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[1936]=
{
strName=_t"凤凰天暴",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\t^00FF00烈焰焚烧^FFFF00\r持续造成伤害，最高可叠5层，层数越高造成的伤害越高。\r此状态的层数将提高受到以下技能的伤害\r^c0c0ff[%s]^FFFF00，^c0c0ff[%s]^FFFF00，^c0c0ff[%s]^FFFF00和^c0c0ff[%s]^FFFF00\r持续15秒\r^00FF00天火^FFFF00\r持续造成伤害\r持续10秒\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "附加攻击力:%d\r附加火属性攻击力:%d\r造成%d%%的伤害\t^00FF00烈焰焚烧^FFFF00\r持续造成伤害，最高可叠5层，层数越高造成的伤害越高。\r此状态的层数将提高受到以下技能的伤害\r^c0c0ff[%s]^FFFF00，^c0c0ff[%s]^FFFF00，^c0c0ff[%s]^FFFF00和^c0c0ff[%s]^FFFF00\r持续15秒\r^00FF00天火^FFFF00\r持续造成伤害\r持续10秒\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="math.ceil(0.195*t2*t2+19.32*t2+39.08);math.ceil(0.131*t2*t2+13.05*t2+26.41);math.ceil((0.022*t2+2.354)*80);skill_desc_str[1522].strName;skill_desc_str[1526].strName;skill_desc_str[1527].strName;skill_desc_str[1529].strName;player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff凤凰座圣衣星铸等级达到32级时获得^A2FFFF打击目标，并溅射周围目标会给目标附加烈焰焚烧状态和天火状态凌虐之焰的技能等级将影响此技能的伤害",
}

skill_desc_str[1937]=
{
strName=_t"火地狱",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00冷却时间降为%s秒\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00冷却时间降为%s秒\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="skill_desc_str[1521].strName;player.skilllevel[4109]>0 and 15 or 20;player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff船尾座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[1938]=
{
strName=_t"曜星之血",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00可使自己和队友的移动速度提升60%%\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00可使自己和队友的移动速度提升60%%\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="skill_desc_str[1528].strName;player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff船尾座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[1939]=
{
strName=_t"真火暴烈",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "%s^c0c0ff[%s]^FFFF00可将目标击退3米\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "%s^c0c0ff[%s]^FFFF00可将目标击退3米\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="player.skilllevel[4111]>0 and '' or skill_desc.specStr[1939];skill_desc_str[1522].strName;player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天琴座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[1940]=
{
strName=_t"火之十字架",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00的冷却时间变为50秒。\r并且最后一击可使敌人眩晕5秒\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00的冷却时间变为50秒。\r并且最后一击可使敌人眩晕5秒\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="skill_desc_str[1526].strName;player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天琴座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[1941]=
{
strName=_t"日冕冲击波",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r倒地时间:{^FFABFC%d^FFFF00}秒\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "附加攻击力:%d\r附加火属性攻击力:%d\r造成%d%%的伤害\r倒地时间:%d秒\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="math.ceil(0.048*player.level*player.level+9.76*player.level+48.8);math.ceil(0.033*player.level*player.level+6.594*player.level+32.97);math.ceil((0.011*player.level+2.362)*100)*(1+0.3*t1);3+t1;player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天琴座圣衣星铸等级达到16级时获得^A2FFFF瞬间冲击敌人身前，抱起目标重重的向地面撞击，并使周围目标倒地",
}

skill_desc_str[1942]=
{
strName=_t"虚空之力",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "释放^c0c0ff[%s]^FFFF00时可立即解除自身的移动控制状态\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "释放^c0c0ff[%s]^FFFF00时可立即解除自身的移动控制状态\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="skill_desc_str[1524].strName;player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff南十字座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[1943]=
{
strName=_t"火精灵",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00可使自己和队友受到伤害减少%d%%\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00可使自己和队友受到伤害减少%d%%\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="skill_desc_str[1528].strName;player.skilllevel[4110]>0 and 25 or 16;player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天炉座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[1944]=
{
strName=_t"凤魂归还",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00开始释放时可使自己获得凤魂佑护状态\t^00FF00凤魂佑护^FFFF00\r可抵御相当于自身生命上限10%%的伤害\r持续5秒\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00开始释放时可使自己获得凤魂佑护状态\t^00FF00凤魂佑护^FFFF00\r可抵御相当于自身生命上限10%%的伤害\r持续5秒\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="skill_desc_str[1522].strName;player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff南十字座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[1945]=
{
strName=_t"灭寂之力",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00成功释放后进入隐身状态，生命低于50%%时，隐身效果将在释放到第2秒时触发\r隐身效果将在释放任何技能时解除\r状态持续6秒\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00成功释放后进入隐身状态，生命低于50%%时，隐身效果将在释放到第2秒时触发\r隐身效果将在释放任何技能时解除\r状态持续6秒\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="skill_desc_str[1533].strName;player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天炉座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[1946]=
{
strName=_t"炎帝领域",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "自己和15米范围内的队友将获得帝火之力状态\t^00FF00帝火之力^FFFF00\r每次受到攻击时，攻击自己的敌方将获得炎帝之怒状态\r持续15秒\t^00FF00炎帝之怒^FFFF00\r每秒受到伤害\r减少移动速度20%%\r持续5秒\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "自己和15米范围内的队友将获得帝火之力状态\t^00FF00帝火之力^FFFF00\r每次受到攻击时，攻击自己的敌方将获得炎帝之怒状态\r持续15秒\t^00FF00炎帝之怒^FFFF00\r每秒受到伤害\r减少移动速度20%%\r持续5秒\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天炉座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[2014]=
{
strName=_t"浴火重生",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "\t^00FF00复生之盾^FFFF00\r可吸收伤害量为生命上限的50%%\r最多持续8秒\r^00FF00虚弱^FFFF00\r每2秒损失生命上限的10%%\r持续10秒",
StrUseDesc=_t "\t^00FF00复生之盾^FFFF00\r可吸收伤害量为生命上限的50%%\r最多持续8秒\r^00FF00虚弱^FFFF00\r每2秒损失生命上限的10%%\r持续10秒",
StrFuncdesc=_t"凤凰守护星座将在死亡时复活，复活时获得复生之盾状态.复生之盾状态结束前如果被打破，则进入虚弱状态",
SkillSoul={ 
   [4545] = { desc=_t"触发时获得重生之怒效果，不会受到伤害，同时免疫所有控制效果，且体力回满"},
} ,
}

skill_desc_str[1984]=
{
strName=_t"蛮横之盾",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "^c0c0ff[蛮横之盾]^FFFF00\r反击敌人的攻击\r每次反击造成持续5秒的流血，每秒%d点伤害，不可叠加\r并增加自己防御力:%d\r持续30秒",
StrUseDesc=_t "^c0c0ff[蛮横之盾]^FFFF00\r反击敌人的攻击\r每次反击造成持续5秒的流血，每秒%d点伤害，不可叠加\r并增加自己防御力:%d\r持续30秒",
StrDescNum="(13.28*t2*t2+1055*t2+11443)/(35-0.5*t2);(13.28*t2*t2+1055*t2+11443)/5",
StrFuncdesc=_t"提升自身防御力，同时对攻击自己的敌人反击流血状态",
}

skill_desc_str[1985]=
{
strName=_t"猩红海域",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "^c0c0ff[猩红海域]^FFFF00\r每2秒恢复%d生命，并对周围8米内的敌人发动一次攻击\r附加攻击力:%d\r每次造成%d%%伤害\r持续30秒",
StrUseDesc=_t "^c0c0ff[猩红海域]^FFFF00\r每2秒恢复%d生命，并对周围8米内的敌人发动一次攻击\r附加攻击力:%d\r每次造成%d%%伤害\r持续30秒",
StrDescNum="(51.44*t2*t2+589*t2+18844)/5/3*2*((player.prof==4)and 1.25 or 1);(51.44*t2*t2+589*t2+18844);1*(0.011*t2+1.49)*3/15*100",
StrFuncdesc=_t"获得光环，持续伤害周围敌人并使自己迅速回血",
}

skill_desc_str[1986]=
{
strName=_t"观星",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r每秒治疗%d生命\r持续10秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r每秒治疗%d生命\r持续10秒",
StrDescNum="(13.28*t2*t2+1055*t2+11443);0.8*(0.017*t2+1.378)*100;(13.28*t2*t2+1055*t2+11443)/5*3/10*((player.prof==4)and 1.25 or 1)",
StrFuncdesc=_t"以自身为圆心的大范围伤害，同时治疗周围队友",
}

skill_desc_str[1987]=
{
strName=_t"鞭挞乱舞",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r每秒治疗%d生命\r持续10秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r每秒治疗%d生命\r持续10秒",
StrDescNum="(51.44*t2*t2+589*t2+18844);1*(0.011*t2+1.49)*100;(51.44*t2*t2+589*t2+18844)/5*3/10*((player.prof==4)and 1.25 or 1)",
StrFuncdesc=_t"以自身为圆心攻击的持续群攻击，期间对进入范围的敌人造成伤害，并治疗范围内的友军",
}

skill_desc_str[1988]=
{
strName=_t"海之召唤",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(13.28*t2*t2+1055*t2+11443);1.2*(0.017*t2+1.378)*100",
StrFuncdesc=_t"对选定地面范围内敌人造成大量伤害",
}

skill_desc_str[1989]=
{
strName=_t"海蛇之牙",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[海蛇之牙]^FFFF00\r对目标造成每秒%d伤害\r持续20秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[海蛇之牙]^FFFF00\r对目标造成每秒%d伤害\r持续20秒",
StrDescNum="(51.44*t2*t2+589*t2+18844);1*(0.011*t2+1.49)*100;(51.44*t2*t2+589*t2+18844)/5*0.6/20",
StrFuncdesc=_t"伤害前方扇形范围内敌人，并造成中毒效果",
}

skill_desc_str[1990]=
{
strName=_t"九头蛇闪",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(13.28*t2*t2+1055*t2+11443);1.2*(0.017*t2+1.378)*100",
StrFuncdesc=_t"对前方敌人发动一次群攻",
}

skill_desc_str[1991]=
{
strName=_t"炫光",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "召唤北冕座圣衣协助战斗20秒\r圣衣攻击力:%d\r每次攻击造成%d%%的伤害",
StrUseDesc=_t "召唤北冕座圣衣协助战斗20秒\r圣衣攻击力:%d\r每次攻击造成%d%%的伤害",
StrDescNum="(51.44*t2*t2+589*t2+18844);1*(0.011*t2+1.49)/5*3*100",
StrFuncdesc=_t"召唤圣衣，不断折射光芒攻击敌人",
}

skill_desc_str[1992]=
{
strName=_t"巨剑",
StrAttacktype=_t"召唤技能",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(13.28*t2*t2+1055*t2+11443);1.2*(0.017*t2+1.378)*100",
StrFuncdesc=_t"对前方扇形范围内的敌人造成伤害",
}

skill_desc_str[1993]=
{
strName=_t"梵天乐",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[梵天乐]^FFFF00\r降低目标%d攻击力\r持续20秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[梵天乐]^FFFF00\r降低目标%d攻击力\r持续20秒",
StrDescNum="(51.44*t2*t2+589*t2+18844);1*(0.011*t2+1.49)*100;(-1)*(51.44*t2*t2+589*t2+18844)*(-1)/5*0.15",
StrFuncdesc=_t"对自身为圆心范围内的敌人造成伤害，同时降低敌方攻击力",
}

skill_desc_str[1994]=
{
strName=_t"无畏战车",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-2.3*t2*t2+1262*t2+20831);1.2*(0.011*t2+1.524)*100",
StrFuncdesc=_t"化作无畏的战场冲撞敌人，对目标和周围敌人造成大量伤害",
}

skill_desc_str[1995]=
{
strName=_t"回旋飞轮",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "^c0c0ff[回旋飞轮]^FFFF00\r附加防御力:%d\r每2秒对周围5米范围的敌人发动一次攻击\r附加攻击力:%d\r造成%d%%伤害\r持续10秒",
StrUseDesc=_t "^c0c0ff[回旋飞轮]^FFFF00\r附加防御力:%d\r每2秒对周围5米范围的敌人发动一次攻击\r附加攻击力:%d\r造成%d%%伤害\r持续10秒",
StrDescNum="(-2.3*t2*t2+1262*t2+20831)/5*0.2;(-2.3*t2*t2+1262*t2+20831);1*(0.011*t2+1.524)*0.3*2/5*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r召唤飞轮保护自己，提升防御力，并伤害周围敌人",
}

skill_desc_str[1996]=
{
strName=_t"星云谜团",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r减速持续5秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r减速持续5秒",
StrDescNum="(-2.3*t2*t2+1262*t2+20831);0.7*(0.011*t2+1.524)*100",
StrFuncdesc=_t"释放一个陷阱，对周围的敌人持续造成伤害并将敌人拖曳到中心并附带减速效果",
}

skill_desc_str[1997]=
{
strName=_t"星云屏障",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "^c0c0ff[星云屏障]^FFFF00\r吸收最多%d伤害\r持续10秒",
StrUseDesc=_t "^c0c0ff[星云屏障]^FFFF00\r吸收最多%d伤害\r持续10秒",
StrDescNum="(-2.3*t2*t2+1262*t2+20831)/5*3",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对友方单位释放一个由铁锁组成的保护网，代替目标承受大量伤害",
}

skill_desc_str[1998]=
{
strName=_t"网罟之毒",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[网罟之毒]^FFFF00\r对目标造成每秒%d伤害\r持续20秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[网罟之毒]^FFFF00\r对目标造成每秒%d伤害\r持续20秒",
StrDescNum="(-2.3*t2*t2+1262*t2+20831);1.25*(0.011*t2+1.524)*100;(-2.3*t2*t2+1262*t2+20831)/5*0.8/20",
StrFuncdesc=_t"对敌人丢出炸弹，对目标和周围的敌人造成伤害和中毒效果",
}

skill_desc_str[1999]=
{
strName=_t"网罟之伤",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "对周围6米的目标造成伤害，并缠绕，使其无法移动\r附加攻击力:%d\r造成%d%%伤害\r缠绕持续6秒",
StrUseDesc=_t "对周围6米的目标造成伤害，并缠绕，使其无法移动\r附加攻击力:%d\r造成%d%%伤害\r缠绕持续6秒",
StrDescNum="(-2.3*t2*t2+1262*t2+20831);1*(0.011*t2+1.524)*0.3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r释放毒网，对目标周围内的敌人造成定身",
}

skill_desc_str[2000]=
{
strName=_t"鹰翔风暴",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "^c0c0ff[鹰翔风暴]^FFFF00\r提升移动速度4米每秒，且每秒对周围5米范围的敌人发动一次攻击\r附加攻击力:%d\r造成%d%%伤害\r持续15秒",
StrUseDesc=_t "^c0c0ff[鹰翔风暴]^FFFF00\r提升移动速度4米每秒，且每秒对周围5米范围的敌人发动一次攻击\r附加攻击力:%d\r造成%d%%伤害\r持续15秒",
StrDescNum="(-2.3*t2*t2+1262*t2+20831);1*(0.011*t2+1.524)*3/15*100",
StrFuncdesc=_t"提高自身移动速度，并使自身附带群体伤害效果的光环",
}

skill_desc_str[2001]=
{
strName=_t"鹰爪闪光",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-2.3*t2*t2+1262*t2+20831);1.2*(0.011*t2+1.524)*0.3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r冲锋攻击目标，并伤害冲锋路径上的敌人",
}

skill_desc_str[2002]=
{
strName=_t"冥火",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-2.3*t2*t2+1262*t2+20831);1*(0.011*t2+1.524)*3.6/10*100",
StrFuncdesc=_t"在指定地点召唤一团冥火，靠近冥火的敌人会持续受到伤害",
}

skill_desc_str[2003]=
{
strName=_t"白夜",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[白夜]^FFFF00\r降低命中%d\r持续10秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[白夜]^FFFF00\r降低命中%d\r持续10秒",
StrDescNum="(-2.3*t2*t2+1262*t2+20831);1*(0.011*t2+1.524)*0.3*100;(-1)*(-t2*15-100)",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r自身为圆心的大范围群攻，同时降低周围敌人的命中率",
}

skill_desc_str[2037]=
{
strName=_t"破坏小夜曲",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "奥路菲的基本招式，用流动的音符杀伤敌人",
StrUseDesc=_t "奥路菲的基本招式，用流动的音符杀伤敌人",
}

skill_desc_str[2038]=
{
strName=_t"幻想迷月",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "这首曲子可以同时击退多个敌人",
StrUseDesc=_t "这首曲子可以同时击退多个敌人",
}

skill_desc_str[2039]=
{
strName=_t"弦乐之花",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "曲调优美，可以为舞蹈伴奏，也可以治愈伤口",
StrUseDesc=_t "曲调优美，可以为舞蹈伴奏，也可以治愈伤口",
}

skill_desc_str[2079]=
{
strName=_t"天马流星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(4.79*t2*t2+1506*t2+3054);1*(0.02*t2+1.268)*100",
StrFuncdesc=_t"攻击目标及前方一定范围内敌人，并造成击退效果",
}

skill_desc_str[2080]=
{
strName=_t"钻石星辰拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(4.79*t2*t2+1506*t2+3054);1*(0.02*t2+1.268)*100",
StrFuncdesc=_t"攻击目标及前方一定范围内敌人，并冰冻目标",
}

skill_desc_str[2081]=
{
strName=_t"庐山升龙霸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(4.79*t2*t2+1506*t2+3054);1*(0.02*t2+1.268)*100",
StrFuncdesc=_t"攻击目标周围敌人，造成大量伤害.并造成浮空效果",
}

skill_desc_str[2082]=
{
strName=_t"星云风暴",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(4.79*t2*t2+1506*t2+3054);1*(0.02*t2+1.268)*100",
StrFuncdesc=_t"攻击目标及前方一定范围内敌人，并造成击退效果",
}

skill_desc_str[2083]=
{
strName=_t"凤翼天翔",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r8秒内目标受到灼烧，每秒失去%d点生命",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r8秒内目标受到灼烧，每秒失去%d点生命",
StrDescNum="(4.79*t2*t2+1506*t2+3054);1*(0.02*t2+1.268)*100;(4.79*t2*t2+1506*t2+3054)/5/10/8",
StrFuncdesc=_t"攻击目标及前方一定范围内敌人，并持续伤害效果",
}

skill_desc_str[2085]=
{
strName=_t"三相之力",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-3.39*t2*t2+1054*t2+30488);1.2*(0.011*t2+1.602)*100",
StrFuncdesc=_t"对前方扇形范围敌人造成伤害",
}

skill_desc_str[2086]=
{
strName=_t"三界封印",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "技能释放期间提高自身防御力%d\r附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[三界封印]^FFFF00\r降低攻击力%d\r持续10秒",
StrUseDesc=_t "技能释放期间提高自身防御力%d\r附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[三界封印]^FFFF00\r降低攻击力%d\r持续10秒",
StrDescNum="(-3.39*t2*t2+1054*t2+30488)/5*3;(-3.39*t2*t2+1054*t2+30488);1*(0.011*t2+1.602)*0.3*100;(-1)*(-3.39*t2*t2+1054*t2+30488)*(-1)/5*0.18",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r嘲讽附近敌人，并降低自身所受伤害一段时间.嘲讽结束时，对周围大范围敌人造成伤害并降低其攻击力",
}

skill_desc_str[2087]=
{
strName=_t"超速飓风",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r提升周围8米范围内友军5米/秒的移动速度\r加速效果持续8秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r提升周围8米范围内友军5米/秒的移动速度\r加速效果持续8秒",
StrDescNum="(-3.39*t2*t2+1054*t2+30488);1*(0.011*t2+1.602)*100",
StrFuncdesc=_t"伤害一条直线上所有敌人，并对线上的队友提供极大加速",
}

skill_desc_str[2088]=
{
strName=_t"复苏之风",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "作用范围:8米\r每秒治疗%d生命\r移动速度提升:4米/秒\r持续16秒",
StrUseDesc=_t "作用范围:8米\r每秒治疗%d生命\r移动速度提升:4米/秒\r持续16秒",
StrDescNum="(-3.39*t2*t2+1054*t2+30488)/5*3/16*((player.prof==4)and 1.25 or 1)",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r获得光环，持续恢复周围队友，并提高他们的移动速度",
}

skill_desc_str[2089]=
{
strName=_t"黑色翅膀",
StrAttacktype=_t"召唤技能",
StrCompDesc=_t "召唤乌鸦协助战斗20秒\r攻击力:%d\r乌鸦每次攻击造成%d%%的伤害",
StrUseDesc=_t "召唤乌鸦协助战斗20秒\r攻击力:%d\r乌鸦每次攻击造成%d%%的伤害",
StrDescNum="(-3.39*t2*t2+1054*t2+30488);1*(0.011*t2+1.602)/5*3*100",
StrFuncdesc=_t"召唤乌鸦，自动攻击玩家攻击的敌人",
}

skill_desc_str[2090]=
{
strName=_t"黑鸦之风",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[黑鸦之风]^FFFF00\r降低%d防御\r持续15秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[黑鸦之风]^FFFF00\r降低%d防御\r持续15秒",
StrDescNum="(-3.39*t2*t2+1054*t2+30488);1*(0.011*t2+1.602)*0.3*100;(-3.39*t2*t2+1054*t2+30488)*(-1)/5*0.7*(-1)",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r伤害前方扇形范围敌人，并造成伤害加深诅咒",
}

skill_desc_str[2091]=
{
strName=_t"逆袭号角",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[逆袭号角]^FFFF00\r提升自己和附近队友攻击力%d\r持续30秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[逆袭号角]^FFFF00\r提升自己和附近队友攻击力%d\r持续30秒",
StrDescNum="(-3.39*t2*t2+1054*t2+30488);1*(0.011*t2+1.602)*100;(-3.39*t2*t2+1054*t2+30488)/5*0.2",
StrFuncdesc=_t"攻击自身周围的敌人，并提高自己和附近队友的攻击力",
}

skill_desc_str[2092]=
{
strName=_t"幻觉火焰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-3.39*t2*t2+1054*t2+30488);1*(0.011*t2+1.602)*0.3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r冲击到目标前并爆炸，伤害附近的敌人，附带眩晕效果",
}

skill_desc_str[2093]=
{
strName=_t"幻想迷乐",
StrAttacktype=_t"主动诅咒",
StrCompDesc=_t "^c0c0ff[幻想迷乐]^FFFF00\r提升自己%d攻击力，对周围12米范围的敌人每秒进行一次攻击\r附加攻击力:%d\r造成%d%%伤害\r持续20秒",
StrUseDesc=_t "^c0c0ff[幻想迷乐]^FFFF00\r提升自己%d攻击力，对周围12米范围的敌人每秒进行一次攻击\r附加攻击力:%d\r造成%d%%伤害\r持续20秒",
StrDescNum="(-3.39*t2*t2+1054*t2+30488)/5*0.3;(-3.39*t2*t2+1054*t2+30488);1*(0.011*t2+1.602)*3/20*100",
StrFuncdesc=_t"获得光环，不断伤害周围敌人，同时提高自身攻击力",
}

skill_desc_str[2094]=
{
strName=_t"弦乐终止",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-3.39*t2*t2+1054*t2+30488);1*(0.011*t2+1.602)*0.3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r吟唱期间对指定范围内的敌人造成沉默、减速，吟唱结束后对范围内敌人造成大量伤害.",
}

skill_desc_str[2138]=
{
strName=_t"天马流星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天马座奥义",
StrUseDesc=_t "天马座奥义",
}

skill_desc_str[2139]=
{
strName=_t"钻石星辰拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "白鸟座奥义",
StrUseDesc=_t "白鸟座奥义",
}

skill_desc_str[2140]=
{
strName=_t"庐山升龙霸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天龙座奥义",
StrUseDesc=_t "天龙座奥义",
}

skill_desc_str[2141]=
{
strName=_t"星云风暴",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "仙女座奥义",
StrUseDesc=_t "仙女座奥义",
}

skill_desc_str[2142]=
{
strName=_t"凤翼天翔",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "凤凰座奥义",
StrUseDesc=_t "凤凰座奥义",
}

skill_desc_str[1674]=
{
strName=_t"注入",
}

skill_desc_str[1675]=
{
strName=_t"喂下",
}

skill_desc_str[1676]=
{
strName=_t"洒面粉",
}

skill_desc_str[1678]=
{
strName=_t"送礼物",
}

skill_desc_str[1679]=
{
strName=_t"林登的妙招",
}

skill_desc_str[1681]=
{
strName=_t"抽取",
}

skill_desc_str[1682]=
{
strName=_t"抽取",
}

skill_desc_str[1684]=
{
strName=_t"招降",
}

skill_desc_str[1207]=
{
strName=_t"尤朵拉的药包",
}

skill_desc_str[1208]=
{
strName=_t"普罗米修斯之锤",
}

skill_desc_str[1614]=
{
strName=_t"烟雾弹",
}

skill_desc_str[1803]=
{
strName=_t"治疗",
}

skill_desc_str[1813]=
{
strName=_t"站起",
}

skill_desc_str[2048]=
{
strName=_t"狂狮碎裂拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "狮子强力的蓄力攻击，造成前方区域大量的伤害",
StrUseDesc=_t "狮子强力的蓄力攻击，造成前方区域大量的伤害",
}

skill_desc_str[2049]=
{
strName=_t"闪电光速拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "强力的攻击，可以给周围多名敌人造成大伤害。",
StrUseDesc=_t "强力的攻击，可以给周围多名敌人造成大伤害。",
}

skill_desc_str[2050]=
{
strName=_t"狂狮怒吼拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "强力的攻击，可以给周围多名敌人造成大伤害。",
StrUseDesc=_t "强力的攻击，可以给周围多名敌人造成大伤害。",
}

skill_desc_str[2051]=
{
strName=_t"恢复生命",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "可以恢复一些生命。",
StrUseDesc=_t "可以恢复一些生命。",
}

skill_desc_str[2056]=
{
strName=_t"站起",
}

skill_desc_str[2289]=
{
strName=_t"凤凰二式",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "普通的攻击，可以攻击前方的所有敌人",
StrUseDesc=_t "普通的攻击，可以攻击前方的所有敌人",
}

skill_desc_str[2290]=
{
strName=_t"凤凰幻魔拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "一辉的绝技，可以将前方的敌人击晕",
StrUseDesc=_t "一辉的绝技，可以将前方的敌人击晕",
}

skill_desc_str[2291]=
{
strName=_t"凤翼天翔",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "一辉的绝技，可以将前方的敌人造成巨大的伤害",
StrUseDesc=_t "一辉的绝技，可以将前方的敌人造成巨大的伤害",
}

skill_desc_str[2292]=
{
strName=_t"恢复生命",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "可以恢复血量",
StrUseDesc=_t "可以恢复血量",
}

skill_desc_str[2364]=
{
strName=_t"黑暗之拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "暴虐气息转化成力量，挥出的绝强之拳",
StrUseDesc=_t "暴虐气息转化成力量，挥出的绝强之拳",
}

skill_desc_str[2367]=
{
strName=_t"裂风踢",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "我艹，描述改了",
StrUseDesc=_t "我艹，描述改了",
}

skill_desc_str[2380]=
{
strName=_t"爱心箭",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "爱心箭\r用爱心感化邪恶力量吧！",
StrUseDesc=_t "爱心箭\r用爱心感化邪恶力量吧！",
}

skill_desc_str[2381]=
{
strName=_t"绿芒",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "绿芒\r生命的绿色，可以击败邪恶！",
StrUseDesc=_t "绿芒\r生命的绿色，可以击败邪恶！",
}

skill_desc_str[2382]=
{
strName=_t"爱之圣剑",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "爱之圣剑\r爱神的圣剑，将世间的阴暗都驱散吧！",
StrUseDesc=_t "爱之圣剑\r爱神的圣剑，将世间的阴暗都驱散吧！",
}

skill_desc_str[2084]=
{
strName=_t"拷问锁链",
}

skill_desc_str[2400]=
{
strName=_t"流星之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[流星之纹]^FFFF00\r提升^00FF00天马流星拳^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[流星之纹]^FFFF00\r提升^00FF00天马流星拳^FFFF00的威力",
}

skill_desc_str[2401]=
{
strName=_t"坠星之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[坠星之纹]^FFFF00\r提升^00FF00天马流星拳^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[坠星之纹]^FFFF00\r提升^00FF00天马流星拳^FFFF00的威力",
}

skill_desc_str[2402]=
{
strName=_t"镇星之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[镇星之纹]^FFFF00\r提升^00FF00天马流星拳^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[镇星之纹]^FFFF00\r提升^00FF00天马流星拳^FFFF00的威力",
}

skill_desc_str[2403]=
{
strName=_t"陨星之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[陨星之纹]^FFFF00\r提升^00FF00天马流星拳^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[陨星之纹]^FFFF00\r提升^00FF00天马流星拳^FFFF00的威力",
}

skill_desc_str[2404]=
{
strName=_t"彗星之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[彗星之纹]^FFFF00\r提升^00FF00天马流星拳^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[彗星之纹]^FFFF00\r提升^00FF00天马流星拳^FFFF00的威力",
}

skill_desc_str[2405]=
{
strName=_t"霰痕之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[霰痕之纹]^FFFF00\r提升^00FF00钻石星辰拳^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[霰痕之纹]^FFFF00\r提升^00FF00钻石星辰拳^FFFF00的威力",
}

skill_desc_str[2406]=
{
strName=_t"雪痕之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[雪痕之纹]^FFFF00\r提升^00FF00钻石星辰拳^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[雪痕之纹]^FFFF00\r提升^00FF00钻石星辰拳^FFFF00的威力",
}

skill_desc_str[2407]=
{
strName=_t"霜痕之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[霜痕之纹]^FFFF00\r提升^00FF00钻石星辰拳^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[霜痕之纹]^FFFF00\r提升^00FF00钻石星辰拳^FFFF00的威力",
}

skill_desc_str[2408]=
{
strName=_t"冰痕之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[冰痕之纹]^FFFF00\r提升^00FF00钻石星辰拳^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[冰痕之纹]^FFFF00\r提升^00FF00钻石星辰拳^FFFF00的威力",
}

skill_desc_str[2409]=
{
strName=_t"冻气之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[冻气之纹]^FFFF00\r提升^00FF00钻石星辰拳^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[冻气之纹]^FFFF00\r提升^00FF00钻石星辰拳^FFFF00的威力",
}

skill_desc_str[2410]=
{
strName=_t"水印之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[水印之纹]^FFFF00\r提升^00FF00庐山升龙霸^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[水印之纹]^FFFF00\r提升^00FF00庐山升龙霸^FFFF00的威力",
}

skill_desc_str[2411]=
{
strName=_t"波涛之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[波涛之纹]^FFFF00\r提升^00FF00庐山升龙霸^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[波涛之纹]^FFFF00\r提升^00FF00庐山升龙霸^FFFF00的威力",
}

skill_desc_str[2412]=
{
strName=_t"逆水之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[逆水之纹]^FFFF00\r提升^00FF00庐山升龙霸^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[逆水之纹]^FFFF00\r提升^00FF00庐山升龙霸^FFFF00的威力",
}

skill_desc_str[2413]=
{
strName=_t"海啸之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[海啸之纹]^FFFF00\r提升^00FF00庐山升龙霸^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[海啸之纹]^FFFF00\r提升^00FF00庐山升龙霸^FFFF00的威力",
}

skill_desc_str[2414]=
{
strName=_t"银河之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[银河之纹]^FFFF00\r提升^00FF00庐山升龙霸^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[银河之纹]^FFFF00\r提升^00FF00庐山升龙霸^FFFF00的威力",
}

skill_desc_str[2415]=
{
strName=_t"星尘之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[星尘之纹]^FFFF00\r提升^00FF00星云锁链^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[星尘之纹]^FFFF00\r提升^00FF00星云锁链^FFFF00的威力",
}

skill_desc_str[2416]=
{
strName=_t"星芒之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[星芒之纹]^FFFF00\r提升^00FF00星云锁链^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[星芒之纹]^FFFF00\r提升^00FF00星云锁链^FFFF00的威力",
}

skill_desc_str[2417]=
{
strName=_t"星斑之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[星斑之纹]^FFFF00\r提升^00FF00星云锁链^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[星斑之纹]^FFFF00\r提升^00FF00星云锁链^FFFF00的威力",
}

skill_desc_str[2418]=
{
strName=_t"星团之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[星团之纹]^FFFF00\r提升^00FF00星云锁链^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[星团之纹]^FFFF00\r提升^00FF00星云锁链^FFFF00的威力",
}

skill_desc_str[2419]=
{
strName=_t"星云之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[星云之纹]^FFFF00\r提升^00FF00星云锁链^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[星云之纹]^FFFF00\r提升^00FF00星云锁链^FFFF00的威力",
}

skill_desc_str[2420]=
{
strName=_t"火焰之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[火焰之纹]^FFFF00\r提升^00FF00凤翼天翔^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[火焰之纹]^FFFF00\r提升^00FF00凤翼天翔^FFFF00的威力",
}

skill_desc_str[2421]=
{
strName=_t"烈火之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[烈火之纹]^FFFF00\r提升^00FF00凤翼天翔^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[烈火之纹]^FFFF00\r提升^00FF00凤翼天翔^FFFF00的威力",
}

skill_desc_str[2422]=
{
strName=_t"业火之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[业火之纹]^FFFF00\r提升^00FF00凤翼天翔^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[业火之纹]^FFFF00\r提升^00FF00凤翼天翔^FFFF00的威力",
}

skill_desc_str[2423]=
{
strName=_t"灵火之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[灵火之纹]^FFFF00\r提升^00FF00凤翼天翔^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[灵火之纹]^FFFF00\r提升^00FF00凤翼天翔^FFFF00的威力",
}

skill_desc_str[2424]=
{
strName=_t"凤凰之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[凤凰之纹]^FFFF00\r提升^00FF00凤翼天翔^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[凤凰之纹]^FFFF00\r提升^00FF00凤翼天翔^FFFF00的威力",
}

skill_desc_str[2460]=
{
strName=_t"取消变身",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "取消变身",
StrUseDesc=_t "取消变身",
}

skill_desc_str[1866]=
{
strName=_t"重力喷射",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加地属性攻击力:{^FFABFC%d^FFFF00}\r造成150%%的属性伤害",
StrUseDesc=_t "附加地属性攻击力:%d\r造成150%%的属性伤害",
StrDescNum="math.floor(15*level*level+80*level+160)",
StrFuncdesc=_t"此技能会取代普通攻击.",
}

skill_desc_str[1867]=
{
strName=_t"急冻射线",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加水属性攻击力:{^FFABFC%d^FFFF00}\r造成150%%的属性伤害",
StrUseDesc=_t "附加水属性攻击力:%d\r造成150%%的属性伤害",
StrDescNum="math.floor(15*level*level+80*level+160)",
StrFuncdesc=_t"此技能会取代普通攻击.",
}

skill_desc_str[1868]=
{
strName=_t"耀星烈火",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加火属性攻击力:{^FFABFC%d^FFFF00}\r造成150%%的属性伤害",
StrUseDesc=_t "附加火属性攻击力:%d\r造成150%%的属性伤害",
StrDescNum="math.floor(15*level*level+80*level+160)",
StrFuncdesc=_t"此技能会取代普通攻击.",
}

skill_desc_str[1869]=
{
strName=_t"星冕风暴",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加风属性攻击力:{^FFABFC%d^FFFF00}\r造成150%%的属性伤害",
StrUseDesc=_t "附加风属性攻击力:%d\r造成150%%的属性伤害",
StrDescNum="math.floor(15*level*level+80*level+160)",
StrFuncdesc=_t"此技能会取代普通攻击.",
}

skill_desc_str[1870]=
{
strName=_t"离子爆发",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加雷属性攻击力:{^FFABFC%d^FFFF00}\r造成150%%的属性伤害",
StrUseDesc=_t "附加雷属性攻击力:%d\r造成150%%的属性伤害",
StrDescNum="math.floor(15*level*level+80*level+160)",
StrFuncdesc=_t"此技能会取代普通攻击.",
}

skill_desc_str[1871]=
{
strName=_t"黑洞",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "命中提升{^FFABFC%d^FFFF00}",
StrUseDesc=_t "命中提升%d",
StrDescNum="math.floor(6*level*level+20*level+85)",
}

skill_desc_str[1872]=
{
strName=_t"白洞",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "暴击提升{^FFABFC%d%%^FFFF00}",
StrUseDesc=_t "暴击提升%d%%",
StrDescNum="level",
}

skill_desc_str[1873]=
{
strName=_t"狮子宫的星光",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "攻击力提升{^FFABFC%d^FFFF00}",
StrUseDesc=_t "攻击力提升%d",
StrDescNum="math.floor(20*level*level+30*level+310)",
StrFuncdesc=_t"技能作用目标为主人.",
}

skill_desc_str[1874]=
{
strName=_t"金牛宫的星光",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "防御提升{^FFABFC%d^FFFF00}",
StrUseDesc=_t "防御提升%d",
StrDescNum="math.floor(25*level*level+20*level+315)",
StrFuncdesc=_t"技能作用目标为主人.",
}

skill_desc_str[1875]=
{
strName=_t"巨蟹宫的星光",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "地属性攻击提升{^FFABFC%d^FFFF00}",
StrUseDesc=_t "地属性攻击提升%d",
StrDescNum="math.floor(12*level*level+10*level+128)",
StrFuncdesc=_t"技能作用目标为主人.",
}

skill_desc_str[1876]=
{
strName=_t"双鱼宫的星光",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "水属性攻击提升{^FFABFC%d^FFFF00}",
StrUseDesc=_t "水属性攻击提升%d",
StrDescNum="math.floor(12*level*level+10*level+128)",
StrFuncdesc=_t"技能作用目标为主人.",
}

skill_desc_str[1877]=
{
strName=_t"魔羯宫的星光",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "火属性攻击提升{^FFABFC%d^FFFF00}",
StrUseDesc=_t "火属性攻击提升%d",
StrDescNum="math.floor(12*level*level+10*level+128)",
StrFuncdesc=_t"技能作用目标为主人.",
}

skill_desc_str[1878]=
{
strName=_t"水瓶宫的星光",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "风属性攻击提升{^FFABFC%d^FFFF00}",
StrUseDesc=_t "风属性攻击提升%d",
StrDescNum="math.floor(12*level*level+10*level+128)",
StrFuncdesc=_t"技能作用目标为主人.",
}

skill_desc_str[1879]=
{
strName=_t"天蝎宫的星光",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "雷属性攻击提升{^FFABFC%d^FFFF00}",
StrUseDesc=_t "雷属性攻击提升%d",
StrDescNum="math.floor(12*level*level+10*level+128)",
StrFuncdesc=_t"技能作用目标为主人.",
}

skill_desc_str[1880]=
{
strName=_t"射手宫的星光",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "生命提升{^FFABFC%d^FFFF00}",
StrUseDesc=_t "生命提升%d",
StrDescNum="math.floor(45*level*level+115*level+1500)",
StrFuncdesc=_t"技能作用目标为主人.",
}

skill_desc_str[1881]=
{
strName=_t"白羊宫的星光",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "命中提升{^FFABFC%d^FFFF00}",
StrUseDesc=_t "命中提升%d",
StrDescNum="math.floor(3*level*level+10*level+42)",
StrFuncdesc=_t"技能作用目标为主人.",
}

skill_desc_str[1882]=
{
strName=_t"天秤宫的星光",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "闪避提升{^FFABFC%d^FFFF00}",
StrUseDesc=_t "闪避提升%d",
StrDescNum="math.floor(3*level*level+10*level+42)",
StrFuncdesc=_t"技能作用目标为主人.",
}

skill_desc_str[1883]=
{
strName=_t"双子宫的星光",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "暴击提升{^FFABFC%d%%^FFFF00}\r生命提升{^FFABFC%d^FFFF00}",
StrUseDesc=_t "暴击提升%d%%\r生命提升%d",
StrDescNum="math.floor((level+2)/3);math.floor(20*level*level+50*level+100)",
StrFuncdesc=_t"技能作用目标为主人.",
}

skill_desc_str[1884]=
{
strName=_t"处女宫的星光",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "暴击率减免提升{^FFABFC%d%%^FFFF00}\r生命提升{^FFABFC%d^FFFF00}",
StrUseDesc=_t "暴击率减免提升%d%%\r生命提升%d",
StrDescNum="math.floor((level+2)/3);math.floor(20*level*level+50*level+100)",
StrFuncdesc=_t"技能作用目标为主人.",
}

skill_desc_str[2235]=
{
strName=_t"泼水",
}

skill_desc_str[2236]=
{
strName=_t"治疗",
}

skill_desc_str[2237]=
{
strName=_t"封印之力",
}

skill_desc_str[2238]=
{
strName=_t"读信",
}

skill_desc_str[2239]=
{
strName=_t"敲晕",
}

skill_desc_str[2240]=
{
strName=_t"投掷火把",
}

skill_desc_str[2471]=
{
strName=_t"极星之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[极星之纹]^FFFF00\r提升^00FF00天马流星拳^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[极星之纹]^FFFF00\r提升^00FF00天马流星拳^FFFF00的威力",
}

skill_desc_str[2472]=
{
strName=_t"飞星之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[飞星之纹]^FFFF00\r提升^00FF00天马流星拳^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[飞星之纹]^FFFF00\r提升^00FF00天马流星拳^FFFF00的威力",
}

skill_desc_str[2473]=
{
strName=_t"繁星之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[繁星之纹]^FFFF00\r提升^00FF00天马流星拳^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[繁星之纹]^FFFF00\r提升^00FF00天马流星拳^FFFF00的威力",
}

skill_desc_str[2474]=
{
strName=_t"白羽之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[白羽之纹]^FFFF00\r提升^00FF00钻石星辰拳^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[白羽之纹]^FFFF00\r提升^00FF00钻石星辰拳^FFFF00的威力",
}

skill_desc_str[2475]=
{
strName=_t"雾霜之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[雾霜之纹]^FFFF00\r提升^00FF00钻石星辰拳^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[雾霜之纹]^FFFF00\r提升^00FF00钻石星辰拳^FFFF00的威力",
}

skill_desc_str[2476]=
{
strName=_t"飘雪之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[飘雪之纹]^FFFF00\r提升^00FF00钻石星辰拳^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[飘雪之纹]^FFFF00\r提升^00FF00钻石星辰拳^FFFF00的威力",
}

skill_desc_str[2477]=
{
strName=_t"龙爪之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[龙爪之纹]^FFFF00\r提升^00FF00庐山升龙霸^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[龙爪之纹]^FFFF00\r提升^00FF00庐山升龙霸^FFFF00的威力",
}

skill_desc_str[2478]=
{
strName=_t"沧海之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[沧海之纹]^FFFF00\r提升^00FF00庐山升龙霸^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[沧海之纹]^FFFF00\r提升^00FF00庐山升龙霸^FFFF00的威力",
}

skill_desc_str[2479]=
{
strName=_t"升龙之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[升龙之纹]^FFFF00\r提升^00FF00庐山升龙霸^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[升龙之纹]^FFFF00\r提升^00FF00庐山升龙霸^FFFF00的威力",
}

skill_desc_str[2480]=
{
strName=_t"星域之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[星域之纹]^FFFF00\r提升^00FF00星云锁链^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[星域之纹]^FFFF00\r提升^00FF00星云锁链^FFFF00的威力",
}

skill_desc_str[2481]=
{
strName=_t"星屑之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[星屑之纹]^FFFF00\r提升^00FF00星云锁链^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[星屑之纹]^FFFF00\r提升^00FF00星云锁链^FFFF00的威力",
}

skill_desc_str[2482]=
{
strName=_t"星象之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[星象之纹]^FFFF00\r提升^00FF00星云锁链^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[星象之纹]^FFFF00\r提升^00FF00星云锁链^FFFF00的威力",
}

skill_desc_str[2483]=
{
strName=_t"火云之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[火云之纹]^FFFF00\r提升^00FF00凤翼天翔^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[火云之纹]^FFFF00\r提升^00FF00凤翼天翔^FFFF00的威力",
}

skill_desc_str[2484]=
{
strName=_t"赤羽之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[赤羽之纹]^FFFF00\r提升^00FF00凤翼天翔^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[赤羽之纹]^FFFF00\r提升^00FF00凤翼天翔^FFFF00的威力",
}

skill_desc_str[2485]=
{
strName=_t"琉焰之纹",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "激活^c0c0ff[琉焰之纹]^FFFF00\r提升^00FF00凤翼天翔^FFFF00的威力",
StrUseDesc=_t "激活^c0c0ff[琉焰之纹]^FFFF00\r提升^00FF00凤翼天翔^FFFF00的威力",
}

skill_desc_str[2521]=
{
strName=_t"休息",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "可以恢复血量",
StrUseDesc=_t "可以恢复血量",
}

skill_desc_str[2522]=
{
strName=_t"休息",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "可以恢复血量",
StrUseDesc=_t "可以恢复血量",
}

skill_desc_str[2515]=
{
strName=_t"回旋碎击拳",
}

skill_desc_str[2516]=
{
strName=_t"流星迅光拳",
}

skill_desc_str[2517]=
{
strName=_t"白鸟裂踢",
}

skill_desc_str[2518]=
{
strName=_t"曙光女神的宽恕",
}

skill_desc_str[2519]=
{
strName=_t"圣剑",
}

skill_desc_str[2520]=
{
strName=_t"升龙霸",
}

skill_desc_str[2523]=
{
strName=_t"回旋碎击拳",
}

skill_desc_str[2524]=
{
strName=_t"冰封大地",
}

skill_desc_str[2525]=
{
strName=_t"庐山龙飞翔",
}

skill_desc_str[2526]=
{
strName=_t"地狱圆锁",
}

skill_desc_str[2527]=
{
strName=_t"裂空风暴角锁",
}

skill_desc_str[2528]=
{
strName=_t"裂空风暴角锁",
}

skill_desc_str[2529]=
{
strName=_t"憎恨虐杀",
}

skill_desc_str[2530]=
{
strName=_t"幻魔拳",
}

skill_desc_str[2531]=
{
strName=_t"电浆风暴",
}

skill_desc_str[2557]=
{
strName=_t"流星迅光拳",
}

skill_desc_str[2558]=
{
strName=_t"曙光女神的宽恕",
}

skill_desc_str[2559]=
{
strName=_t"圣剑",
}

skill_desc_str[2591]=
{
strName=_t"灭火",
}

skill_desc_str[2596]=
{
strName=_t"天马彗星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天马座的绝技，汇集力量形成巨大的彗星",
StrUseDesc=_t "天马座的绝技，汇集力量形成巨大的彗星",
}

skill_desc_str[2597]=
{
strName=_t"天马流星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天马座的绝技！在小宇宙爆发后威力会更加惊人！",
StrUseDesc=_t "天马座的绝技！在小宇宙爆发后威力会更加惊人！",
}

skill_desc_str[2598]=
{
strName=_t"提升小宇宙",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "不断提升小宇宙，10层将会有惊人的威力！",
StrUseDesc=_t "不断提升小宇宙，10层将会有惊人的威力！",
}

skill_desc_str[2600]=
{
strName=_t"寒冷的龙卷风",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "白鸟座的绝技，来自东西伯利亚的冰风",
StrUseDesc=_t "白鸟座的绝技，来自东西伯利亚的冰风",
}

skill_desc_str[2601]=
{
strName=_t"钻石星尘拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "白鸟座的绝技！",
StrUseDesc=_t "白鸟座的绝技！",
}

skill_desc_str[2602]=
{
strName=_t"冻气",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "白鸟座的冻气，可以冻结毒素。",
StrUseDesc=_t "白鸟座的冻气，可以冻结毒素。",
}

skill_desc_str[2755]=
{
strName=_t"最强之拳",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "增加攻击力:{^FFABFC%d^FFFF00}\r增加战力:{^FFABFC%d^FFFF00}",
StrUseDesc=_t "增加攻击力:%d\r增加战力:%d",
StrDescNum="50*level;50*level",
StrFuncdesc=_t"需要加入军团才可学习升级",
}

skill_desc_str[2756]=
{
strName=_t"最强之盾",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "增加防御力:{^FFABFC%d^FFFF00}\r增加战力:{^FFABFC%d^FFFF00}",
StrUseDesc=_t "增加防御力:%d\r增加战力:%d",
StrDescNum="150*level;50*level",
StrFuncdesc=_t"需要加入军团才可学习升级",
}

skill_desc_str[2757]=
{
strName=_t"精神锁定",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "增加命中:{^FFABFC%d^FFFF00}\r增加战力:{^FFABFC%d^FFFF00}",
StrUseDesc=_t "增加命中:%d\r增加战力:%d",
StrDescNum="22*level;50*level",
StrFuncdesc=_t"需要加入军团才可学习升级",
}

skill_desc_str[2758]=
{
strName=_t"念力闪现",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "增加躲闪:{^FFABFC%d^FFFF00}\r增加战力:{^FFABFC%d^FFFF00}",
StrUseDesc=_t "增加躲闪:%d\r增加战力:%d",
StrDescNum="22*level;50*level",
StrFuncdesc=_t"需要加入军团才可学习升级",
}

skill_desc_str[2789]=
{
strName=_t"冰风暴",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "冰河常用技能， 可以造成前方扇形一定伤害。",
StrUseDesc=_t "冰河常用技能， 可以造成前方扇形一定伤害。",
}

skill_desc_str[2790]=
{
strName=_t"钻石星尘拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "冰河绝技，可以造成前方扇形大量伤害。",
StrUseDesc=_t "冰河绝技，可以造成前方扇形大量伤害。",
}

skill_desc_str[2791]=
{
strName=_t"冰冻光环",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "冰河绝技，可以造成前方扇形敌人冰冻。",
StrUseDesc=_t "冰河绝技，可以造成前方扇形敌人冰冻。",
}

skill_desc_str[2792]=
{
strName=_t"恢复生命",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "恢复生命。",
StrUseDesc=_t "恢复生命。",
}

skill_desc_str[2998]=
{
strName=_t"旋冰破胆拳",
}

skill_desc_str[2999]=
{
strName=_t"寒风领域",
}

skill_desc_str[2820]=
{
strName=_t"星光灭绝",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r离自己2米内的敌人，将承受全额伤害\r离自己2~4米的敌人，将承受80%%的伤害\r离自己4米以上的敌人，将承受50%%的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r离自己2米内的敌人，将承受全额伤害\r离自己2~4米的敌人，将承受80%%的伤害\r离自己4米以上的敌人，将承受50%%的伤害",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1.45*(0.0084*t2+1.725)*100",
StrFuncdesc=_t"对自身周围6米范围内的敌人造成伤害，距离越远，受到的伤害越低\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2821]=
{
strName=_t"星屑旋转功",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r沉默4秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r沉默4秒",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1*(0.0084*t2+1.725)*0.3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对前方60度扇形范围内的敌人造成伤害，并使范围内敌人沉默\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2822]=
{
strName=_t"巨型号角",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1.3*(0.0084*t2+1.725)*100",
StrFuncdesc=_t"对前方80度扇形范围内的敌人造成伤害，并造成击退效果\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2823]=
{
strName=_t"泰坦新星",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1*(0.0084*t2+1.725)*0.3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对自身周围7米范围内的敌人造成伤害，并造成击晕效果\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2824]=
{
strName=_t"银河星爆",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1.4*(0.0084*t2+1.725)*100",
StrFuncdesc=_t"对自身周围8米范围内的敌人造成伤害\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2825]=
{
strName=_t"幻胧魔皇拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[幻胧魔皇拳]^FFFF00\r是对方处于混乱状态",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[幻胧魔皇拳]^FFFF00\r是对方处于混乱状态",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1*(0.0084*t2+1.725)*0.3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对单个敌人造成大量伤害，并使其产生幻觉\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2826]=
{
strName=_t"异次元空间",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1*(0.0084*t2+1.725)*0.3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对单个敌人造成大量伤害，并拉拽到自己身边\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2827]=
{
strName=_t"积尸气冥界波",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[积尸气]^FFFF00\r提升自身攻击力%d\r持续20秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[积尸气]^FFFF00\r提升自身攻击力%d\r持续20秒",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1.15*(0.0084*t2+1.725)*100;(-4.24*t2*t2+1031*t2+49536)/6*0.55",
StrFuncdesc=_t"对自身周围6米范围内的敌人造成伤害，并提高自身攻击力一段时间\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2828]=
{
strName=_t"积尸气鬼苍焰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r使敌人伤害减少25%%",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r使敌人伤害减少25%%",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1.35*(0.0084*t2+1.725)*0.3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对目标及其周围7米范围内的敌人造成伤害\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2829]=
{
strName=_t"闪电光速拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1.35*(0.0084*t2+1.725)*100",
StrFuncdesc=_t"对自身周围8米范围内的敌人造成伤害\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2830]=
{
strName=_t"等离子光速拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[离子火花]^FFFF00\r降低%d点命中\r持续10秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[离子火花]^FFFF00\r降低%d点命中\r持续10秒",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1.2*(0.0084*t2+1.725)*0.3*100;(-1)*(-1)*t3*0.8",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对一条直线上的敌人造成伤害，并降低敌人命中一段时间\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2831]=
{
strName=_t"天魔降服",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1*(0.0084*t2+1.725)*100",
StrFuncdesc=_t"对自身周围7米范围内的敌人造成伤害，造成击倒效果\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2832]=
{
strName=_t"六道轮回",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[轮回]^FFFF00\r沉默，持续5秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[轮回]^FFFF00\r沉默，持续5秒",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1*(0.0084*t2+1.725)*0.3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对自身周围10米范围内的敌人造成伤害，并造成沉默效果\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2833]=
{
strName=_t"天舞宝轮",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "技能释放期间提高自身防御力%d\r附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "技能释放期间提高自身防御力%d\r附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-4.24*t2*t2+1031*t2+49536)/6*5;(-4.24*t2*t2+1031*t2+49536);1.3*(0.0084*t2+1.725)*0.3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对自身周围7米范围内的敌人造成伤害，释放期间自身防御力大增\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2834]=
{
strName=_t"庐山升龙霸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1*(0.0084*t2+1.725)*100",
StrFuncdesc=_t"对目标及其周围4米范围内的敌人造成伤害，并附带击飞效果\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2835]=
{
strName=_t"庐山百龙霸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r倒地3秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r倒地3秒",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1.1*(0.0084*t2+1.725)*0.3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对前方60度扇形范围内的敌人造成伤害并倒地\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2836]=
{
strName=_t"念力幽禁",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[念力幽禁]^FFFF00\r无法移动\r持续10秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[念力幽禁]^FFFF00\r无法移动\r持续10秒",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1*(0.0084*t2+1.725)*100",
StrFuncdesc=_t"对前方120度扇形范围内的敌人造成伤害，并造成定身效果\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2837]=
{
strName=_t"猩红毒针",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1.4*(0.0084*t2+1.725)*0.3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r冲锋，对目标及其周围5米范围内的敌人造成伤害\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2838]=
{
strName=_t"深红毒针",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[深红毒针]^FFFF00\r每秒造成%d伤害\r持续15秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[深红毒针]^FFFF00\r每秒造成%d伤害\r持续15秒",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1.1*(0.0084*t2+1.725)*0.3*100;(-4.24*t2*t2+1031*t2+49536)/6*0.55/8",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对单个敌人造成大量伤害，并造成流血效果\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2839]=
{
strName=_t"原子闪电光速拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1.4*(0.0084*t2+1.725)*100",
StrFuncdesc=_t"对前方80度扇形范围内的敌人造成伤害\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2840]=
{
strName=_t"黄金箭",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[破甲箭]^FFFF00\r降低防御力%d\r降低伤害抗性15%%\r持续10秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[破甲箭]^FFFF00\r降低防御力%d\r降低伤害抗性15%%\r持续10秒",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1.1*(0.0084*t2+1.725)*0.3*100;(-4.24*t2*t2+1031*t2+49536)*(-1)/6/5*(-1)",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对前方90度扇形范围内的敌人造成伤害，并降低其防御力和伤害抗性\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2841]=
{
strName=_t"圣剑三连",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1*(0.0084*t2+1.725)*100",
StrFuncdesc=_t"对一条直线上的敌人造成伤害，最后一击造成击飞效果\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2842]=
{
strName=_t"黄金圣剑",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[虚弱]^FFFF00\r防御力下降%d\r持续6秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[虚弱]^FFFF00\r防御力下降%d\r持续6秒",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1.45*(0.0084*t2+1.725)*0.3*100;(-1)*(-4.24*t2*t2+1031*t2+49536)/6*0.4*(-1)",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对一条直线上的敌人造成超强伤害，发招后自身进入短暂虚弱\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2843]=
{
strName=_t"钻石星尘拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[钻石星辰]^FFFF00\r冰冻4秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[钻石星辰]^FFFF00\r冰冻4秒",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1*(0.0084*t2+1.725)*100",
StrFuncdesc=_t"对前方45度扇形范围内的敌人造成伤害，并造成冰冻效果\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2844]=
{
strName=_t"曙光女神之宽恕",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[绝对零度]^FFFF00\r无法移动\r持续5秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[绝对零度]^FFFF00\r无法移动\r持续5秒",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1*(0.0084*t2+1.725)*0.3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对一条直线上的敌人造成伤害，并且定身一段时间\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2845]=
{
strName=_t"皇室魔宫玫瑰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r回复自身%d生命",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r回复自身%d生命",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1.2*(0.0084*t2+1.725)*100;(-4.24*t2*t2+1031*t2+49536)/6*6/4*3*((player.prof==4)and 1.25 or 1)",
StrFuncdesc=_t"对前方矩形范围内的敌人造成伤害，并回复自身生命\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2846]=
{
strName=_t"吸血玫瑰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[吸血玫瑰]^FFFF00\r使目标沉默并且每秒受到%d点伤害\r持续6秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r^c0c0ff[吸血玫瑰]^FFFF00\r使目标沉默并且每秒受到%d点伤害\r持续6秒",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1*(0.0084*t2+1.725)/3*100;(-4.24*t2*t2+1031*t2+49536)/6*0.4/6",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对目标造成大量伤害，并且使其沉默和持续流血一段时间\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2847]=
{
strName=_t"食人鱼玫瑰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-4.24*t2*t2+1031*t2+49536);1.4*(0.0084*t2+1.725)/3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对自身周围6米范围内的敌人造成伤害\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[2851]=
{
strName=_t"聚力-破盾式",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "将力量集中于一点冲破冥界的结印，对拥有结印的怪物造成巨大伤害",
StrUseDesc=_t "将力量集中于一点冲破冥界的结印，对拥有结印的怪物造成巨大伤害",
}

skill_desc_str[2852]=
{
strName=_t"御敌-冰封式",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "利用冰霜的力量降低怪物的移动速度",
StrUseDesc=_t "利用冰霜的力量降低怪物的移动速度",
}

skill_desc_str[2853]=
{
strName=_t"爆裂-斩魂式",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "将小宇宙熊熊燃烧，对周围的怪物造成毁灭性的打击",
StrUseDesc=_t "将小宇宙熊熊燃烧，对周围的怪物造成毁灭性的打击",
}

skill_desc_str[2725]=
{
strName=_t"星云捕兽夹",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "用来捕捉巨兽的星云锁链网。",
StrUseDesc=_t "用来捕捉巨兽的星云锁链网。",
}

skill_desc_str[2726]=
{
strName=_t"星云巨网",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "用来捕捉飞行生物的星云锁链网。",
StrUseDesc=_t "用来捕捉飞行生物的星云锁链网。",
}

skill_desc_str[2727]=
{
strName=_t"星云回旋镖",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "专门用来对付蝙蝠的星云锁链网。",
StrUseDesc=_t "专门用来对付蝙蝠的星云锁链网。",
}

skill_desc_str[2728]=
{
strName=_t"星云风暴",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "仙女座的绝技！",
StrUseDesc=_t "仙女座的绝技！",
}

skill_desc_str[2738]=
{
strName=_t"凤翼天翔",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "凤凰座的绝技！",
StrUseDesc=_t "凤凰座的绝技！",
}

skill_desc_str[2739]=
{
strName=_t"凤凰幻魔拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "凤凰座的绝技！",
StrUseDesc=_t "凤凰座的绝技！",
}

skill_desc_str[2748]=
{
strName=_t"天马流星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天马座的绝技！",
StrUseDesc=_t "天马座的绝技！",
}

skill_desc_str[2752]=
{
strName=_t"黄金箭",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "射手黄金圣衣之黄金箭！",
StrUseDesc=_t "射手黄金圣衣之黄金箭！",
}

skill_desc_str[2753]=
{
strName=_t"原子闪电光速拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "射手黄金圣衣之原子闪电光速拳！",
StrUseDesc=_t "射手黄金圣衣之原子闪电光速拳！",
}

skill_desc_str[2926]=
{
strName=_t"先祖之心",
}

skill_desc_str[2927]=
{
strName=_t"喂食",
}

skill_desc_str[2928]=
{
strName=_t"治疗",
}

skill_desc_str[2933]=
{
strName=_t"释放迷香",
}

skill_desc_str[2934]=
{
strName=_t"冰封",
}

skill_desc_str[2775]=
{
strName=_t"末日冰凌",
}

skill_desc_str[2776]=
{
strName=_t"残冰风暴",
}

skill_desc_str[2802]=
{
strName=_t"飞跃",
}

skill_desc_str[2803]=
{
strName=_t"箭雨",
}

skill_desc_str[2807]=
{
strName=_t"冲锋",
}

skill_desc_str[2808]=
{
strName=_t"重击",
}

skill_desc_str[2810]=
{
strName=_t"解散机甲",
}

skill_desc_str[2804]=
{
strName=_t"解散机甲",
}

skill_desc_str[2805]=
{
strName=_t"解散机甲",
}

skill_desc_str[2809]=
{
strName=_t"解散机甲",
}

skill_desc_str[2177]=
{
strName=_t"挣脱",
}

skill_desc_str[2160]=
{
strName=_t"挣脱",
}

skill_desc_str[2194]=
{
strName=_t"挣脱",
}

skill_desc_str[2070]=
{
strName=_t"挣脱",
}

skill_desc_str[820]=
{
strName=_t"挣脱",
}

skill_desc_str[3068]=
{
strName=_t"挣脱",
}

skill_desc_str[2904]=
{
strName=_t"绷带",
}

skill_desc_str[2905]=
{
strName=_t"沐浴狼血",
}

skill_desc_str[2907]=
{
strName=_t"蜡",
}

skill_desc_str[2908]=
{
strName=_t"朱利安的笛子",
}

skill_desc_str[2909]=
{
strName=_t"捕获",
}

skill_desc_str[2781]=
{
strName=_t"梦之铃兰",
}

skill_desc_str[996]=
{
strName=_t"星座守护·【白羊】",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "战斗中有几率召唤白羊座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "战斗中有几率召唤白羊座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(85.79*t2*t2-38.47*t2+55940);(0*t2*t2+0.009*t2+1.63)*1*100",
StrFuncdesc=_t"^c0c0ff白羊座圣衣星铸等级达到20级时获得^A2FFFF",
}

skill_desc_str[1013]=
{
strName=_t"星座守护·【金牛】",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "战斗中有几率召唤金牛座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "战斗中有几率召唤金牛座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(85.79*t2*t2-38.47*t2+55940);(0*t2*t2+0.009*t2+1.63)*1*100",
StrFuncdesc=_t"^c0c0ff金牛座圣衣星铸等级达到20级时获得^A2FFFF",
}

skill_desc_str[1014]=
{
strName=_t"星座守护·【双子】",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "战斗中有几率召唤双子座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "战斗中有几率召唤双子座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(85.79*t2*t2-38.47*t2+55940);(0*t2*t2+0.009*t2+1.63)*1*100",
StrFuncdesc=_t"^c0c0ff双子座圣衣星铸等级达到20级时获得^A2FFFF",
}

skill_desc_str[1015]=
{
strName=_t"星座守护·【巨蟹】",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "战斗中有几率召唤巨蟹座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "战斗中有几率召唤巨蟹座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(85.79*t2*t2-38.47*t2+55940);(0*t2*t2+0.009*t2+1.63)*1*100",
StrFuncdesc=_t"^c0c0ff巨蟹座圣衣星铸等级达到20级时获得^A2FFFF",
}

skill_desc_str[1016]=
{
strName=_t"星座守护·【狮子】",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "战斗中有几率召唤狮子座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "战斗中有几率召唤狮子座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(85.79*t2*t2-38.47*t2+55940);(0*t2*t2+0.009*t2+1.63)*1*100",
StrFuncdesc=_t"^c0c0ff狮子座圣衣星铸等级达到20级时获得^A2FFFF",
}

skill_desc_str[1017]=
{
strName=_t"星座守护·【处女】",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "战斗中有几率召唤处女座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "战斗中有几率召唤处女座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(85.79*t2*t2-38.47*t2+55940);(0*t2*t2+0.009*t2+1.63)*1*100",
StrFuncdesc=_t"^c0c0ff处女座圣衣星铸等级达到20级时获得^A2FFFF",
}

skill_desc_str[1018]=
{
strName=_t"星座守护·【天枰】",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "战斗中有几率召唤天枰座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "战斗中有几率召唤天枰座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(85.79*t2*t2-38.47*t2+55940);(0*t2*t2+0.009*t2+1.63)*1*100",
StrFuncdesc=_t"^c0c0ff天秤座圣衣星铸等级达到20级时获得^A2FFFF",
}

skill_desc_str[1019]=
{
strName=_t"星座守护·【天蝎】",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "战斗中有几率召唤天蝎座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "战斗中有几率召唤天蝎座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(85.79*t2*t2-38.47*t2+55940);(0*t2*t2+0.009*t2+1.63)*1*100",
StrFuncdesc=_t"^c0c0ff天蝎座圣衣星铸等级达到20级时获得^A2FFFF",
}

skill_desc_str[1020]=
{
strName=_t"星座守护·【射手】",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "战斗中有几率召唤射手座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "战斗中有几率召唤射手座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(85.79*t2*t2-38.47*t2+55940);(0*t2*t2+0.009*t2+1.63)*1*100",
StrFuncdesc=_t"^c0c0ff射手座圣衣星铸等级达到20级时获得^A2FFFF",
}

skill_desc_str[1021]=
{
strName=_t"星座守护·【魔羯】",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "战斗中有几率召唤魔羯座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "战斗中有几率召唤魔羯座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(85.79*t2*t2-38.47*t2+55940);(0*t2*t2+0.009*t2+1.63)*1*100",
StrFuncdesc=_t"^c0c0ff摩羯座圣衣星铸等级达到20级时获得^A2FFFF",
}

skill_desc_str[1022]=
{
strName=_t"星座守护·【水瓶】",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "战斗中有几率召唤水瓶座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "战斗中有几率召唤水瓶座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(85.79*t2*t2-38.47*t2+55940);(0*t2*t2+0.009*t2+1.63)*1*100",
StrFuncdesc=_t"^c0c0ff水瓶座圣衣星铸等级达到20级时获得^A2FFFF",
}

skill_desc_str[1023]=
{
strName=_t"星座守护·【双鱼】",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "战斗中有几率召唤双鱼座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}伤害",
StrUseDesc=_t "战斗中有几率召唤双鱼座黄金圣斗士\r对当前目标发起一次强力攻击\r附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(85.79*t2*t2-38.47*t2+55940);(0*t2*t2+0.009*t2+1.63)*1*100",
StrFuncdesc=_t"^c0c0ff双鱼座圣衣星铸等级达到20级时获得^A2FFFF",
}

skill_desc_str[3334]=
{
strName=_t"激励",
}

skill_desc_str[3384]=
{
strName=_t"煞气冲击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "逆天的厉害，造成自身圆形的大伤害",
StrUseDesc=_t "逆天的厉害，造成自身圆形的大伤害",
}

skill_desc_str[3385]=
{
strName=_t"戾气轰炸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[3386]=
{
strName=_t"加速",
}

skill_desc_str[3387]=
{
strName=_t"恢复生命",
}

skill_desc_str[2711]=
{
strName=_t"正能量",
}

skill_desc_str[2815]=
{
strName=_t"火焰防御塔建造",
}

skill_desc_str[2816]=
{
strName=_t"寒冰防御塔建造",
}

skill_desc_str[2817]=
{
strName=_t"火焰防御塔建造",
}

skill_desc_str[2818]=
{
strName=_t"寒冰防御塔建造",
}

skill_desc_str[3583]=
{
strName=_t"星屑旋转功",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "异化之星屑，击杀面前一切敌人！",
StrUseDesc=_t "异化之星屑，击杀面前一切敌人！",
}

skill_desc_str[3584]=
{
strName=_t"星光灭绝",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "空间传送与物理光子绞杀的结合！\r能让敌人的肉体和精神全部湮灭！",
StrUseDesc=_t "空间传送与物理光子绞杀的结合！\r能让敌人的肉体和精神全部湮灭！",
}

skill_desc_str[3585]=
{
strName=_t"巨型号角",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "巨大的力量，让敌人全身爆裂而死！",
StrUseDesc=_t "巨大的力量，让敌人全身爆裂而死！",
}

skill_desc_str[3586]=
{
strName=_t"泰坦新星",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "爆发全身的小宇宙，可令天地震动！",
StrUseDesc=_t "爆发全身的小宇宙，可令天地震动！",
}

skill_desc_str[3587]=
{
strName=_t"异次元空间",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "在异次元空间中无限沉沦、湮灭！",
StrUseDesc=_t "在异次元空间中无限沉沦、湮灭！",
}

skill_desc_str[3588]=
{
strName=_t"银河星爆",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "宇宙的威压，谁人能够抵挡！",
StrUseDesc=_t "宇宙的威压，谁人能够抵挡！",
}

skill_desc_str[3589]=
{
strName=_t"积尸气苍鬼焰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "燃尽敌人的灵魂比摧毁肉体更加有效！",
StrUseDesc=_t "燃尽敌人的灵魂比摧毁肉体更加有效！",
}

skill_desc_str[3590]=
{
strName=_t"积尸气冥界波",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "灵魂都没有了，还想做什么！",
StrUseDesc=_t "灵魂都没有了，还想做什么！",
}

skill_desc_str[3591]=
{
strName=_t"六道轮回",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "在六界中沉沦，受尽一切折磨！",
StrUseDesc=_t "在六界中沉沦，受尽一切折磨！",
}

skill_desc_str[3592]=
{
strName=_t"天舞宝轮",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "攻防一体，可令一切敌人臣服！",
StrUseDesc=_t "攻防一体，可令一切敌人臣服！",
}

skill_desc_str[3593]=
{
strName=_t"钳制念动波",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "与我为敌的人，将承受无尽的苦痛！",
StrUseDesc=_t "与我为敌的人，将承受无尽的苦痛！",
}

skill_desc_str[3594]=
{
strName=_t"猩红毒针",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "最仁慈也最恐怖，最后一针将一击致命！",
StrUseDesc=_t "最仁慈也最恐怖，最后一针将一击致命！",
}

skill_desc_str[3544]=
{
strName=_t"天神盾",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "给单个友方目标加护盾",
StrUseDesc=_t "给单个友方目标加护盾",
}

skill_desc_str[3545]=
{
strName=_t"天神领域",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "持续治疗自身周围的友方",
StrUseDesc=_t "持续治疗自身周围的友方",
}

skill_desc_str[3546]=
{
strName=_t"祝福神光",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "用神光照射一个区域，被神光照射的友方持续生命",
StrUseDesc=_t "用神光照射一个区域，被神光照射的友方持续生命",
}

skill_desc_str[3547]=
{
strName=_t"天神领域",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "持续治疗自身周围的友方",
StrUseDesc=_t "持续治疗自身周围的友方",
}

skill_desc_str[3548]=
{
strName=_t"修罗战吼",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "对敌人发起挑衅，同时提高自己的防御",
StrUseDesc=_t "对敌人发起挑衅，同时提高自己的防御",
}

skill_desc_str[3549]=
{
strName=_t"集血拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "攻击敌人同时给自己恢复生命",
StrUseDesc=_t "攻击敌人同时给自己恢复生命",
}

skill_desc_str[3550]=
{
strName=_t"修罗之刻",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "冲锋到一个敌人近前，并造成大量伤害",
StrUseDesc=_t "冲锋到一个敌人近前，并造成大量伤害",
}

skill_desc_str[3551]=
{
strName=_t"修罗之舞",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "对敌人发动三段攻击",
StrUseDesc=_t "对敌人发动三段攻击",
}

skill_desc_str[3552]=
{
strName=_t"断空掌",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "攻击敌人的同时提高自身的攻击力，这个效果最多可叠加5次",
StrUseDesc=_t "攻击敌人的同时提高自身的攻击力，这个效果最多可叠加5次",
}

skill_desc_str[3553]=
{
strName=_t"双重极限",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "对敌人发动两段攻击",
StrUseDesc=_t "对敌人发动两段攻击",
}

skill_desc_str[3554]=
{
strName=_t"十字割",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "对敌人造成流血伤害，效果持续10秒",
StrUseDesc=_t "对敌人造成流血伤害，效果持续10秒",
}

skill_desc_str[3555]=
{
strName=_t"二连斩",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "对敌人发动两段攻击",
StrUseDesc=_t "对敌人发动两段攻击",
}

skill_desc_str[3556]=
{
strName=_t"凶猛撕咬",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "对敌人造成流血伤害，效果持续10秒",
StrUseDesc=_t "对敌人造成流血伤害，效果持续10秒",
}

skill_desc_str[3557]=
{
strName=_t"扑杀",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "对敌人发动迅猛的攻击",
StrUseDesc=_t "对敌人发动迅猛的攻击",
}

skill_desc_str[3558]=
{
strName=_t"挑衅低吼",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "对敌人发起挑衅，同时提高自己的防御",
StrUseDesc=_t "对敌人发起挑衅，同时提高自己的防御",
}

skill_desc_str[3559]=
{
strName=_t"破甲重击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "对敌人发动重击的同时降低目标护甲，这个效果最多可叠加5次",
StrUseDesc=_t "对敌人发动重击的同时降低目标护甲，这个效果最多可叠加5次",
}

skill_desc_str[3560]=
{
strName=_t"地狱轻叹",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "诅咒一个区域，对区域内的敌人造成持续伤害，区域可存在15秒",
StrUseDesc=_t "诅咒一个区域，对区域内的敌人造成持续伤害，区域可存在15秒",
}

skill_desc_str[3561]=
{
strName=_t"冰冷触摸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "对敌人发动三段攻击",
StrUseDesc=_t "对敌人发动三段攻击",
}

skill_desc_str[3562]=
{
strName=_t"自爆瘟疫",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "对敌人造成大量伤害的同时，也消耗自己的生命",
StrUseDesc=_t "对敌人造成大量伤害的同时，也消耗自己的生命",
}

skill_desc_str[3563]=
{
strName=_t"饿鬼吞噬",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "疯狂的啃噬敌人，恢复自己的生命",
StrUseDesc=_t "疯狂的啃噬敌人，恢复自己的生命",
}

skill_desc_str[3263]=
{
strName=_t"取暖",
}

skill_desc_str[3264]=
{
strName=_t"取暖",
}

skill_desc_str[3266]=
{
strName=_t"治疗",
}

skill_desc_str[3489]=
{
strName=_t"白鸟飞踢",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[3715]=
{
strName=_t"次元之核",
}

skill_desc_str[3716]=
{
strName=_t"圣水",
}

skill_desc_str[3717]=
{
strName=_t"火把",
}

skill_desc_str[3718]=
{
strName=_t"沙罗之花",
}

skill_desc_str[3719]=
{
strName=_t"伪装冥斗士",
}

skill_desc_str[3745]=
{
strName=_t"使用",
}

skill_desc_str[3746]=
{
strName=_t"鞭打",
}

skill_desc_str[3749]=
{
strName=_t"治疗",
}

skill_desc_str[3750]=
{
strName=_t"使用",
}

skill_desc_str[3525]=
{
strName=_t"邪恶咆哮",
}

skill_desc_str[3793]=
{
strName=_t"雪球滚滚拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "只对“抢亲小丑”生效，伤害5%%每次",
StrUseDesc=_t "只对“抢亲小丑”生效，伤害5%%每次",
}

skill_desc_str[3800]=
{
strName=_t"解除变身",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "解除雪人变身状态",
StrUseDesc=_t "解除雪人变身状态",
}

skill_desc_str[3794]=
{
strName=_t"天马流星拳",
}

skill_desc_str[2740]=
{
strName=_t"天秤座的枪",
}

skill_desc_str[2729]=
{
strName=_t"天秤座的双节棍",
}

skill_desc_str[3920]=
{
strName=_t"杀戮之光",
}

skill_desc_str[3926]=
{
strName=_t"流星火雨",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "增加风属性攻击力:{^FFABFC%d^FFFF00}\r增加防御力:{^FFABFC%d^FFFF00}\r增加生命:{^FFABFC%d^FFFF00}\r增加战力:{^FFABFC%d^FFFF00}",
StrUseDesc=_t "增加风属性攻击力:%d\r增加防御力:%d\r增加生命:%d\r增加战力:%d",
StrDescNum="19*level+21;40*level+125;175*level+475;50*level",
}

skill_desc_str[3927]=
{
strName=_t"极光冻气",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "增加水属性攻击力:{^FFABFC%d^FFFF00}\r增加防御力:{^FFABFC%d^FFFF00}\r增加生命:{^FFABFC%d^FFFF00}\r增加战力:{^FFABFC%d^FFFF00}",
StrUseDesc=_t "增加水属性攻击力:%d\r增加防御力:%d\r增加生命:%d\r增加战力:%d",
StrDescNum="19*level+21;40*level+125;175*level+475;50*level",
}

skill_desc_str[3928]=
{
strName=_t"圣龙烈霸",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "增加地属性攻击力:{^FFABFC%d^FFFF00}\r增加防御力:{^FFABFC%d^FFFF00}\r增加生命:{^FFABFC%d^FFFF00}\r增加战力:{^FFABFC%d^FFFF00}",
StrUseDesc=_t "增加地属性攻击力:%d\r增加防御力:%d\r增加生命:%d\r增加战力:%d",
StrDescNum="19*level+21;40*level+125;175*level+475;50*level",
}

skill_desc_str[3929]=
{
strName=_t"牺牲裁断",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "增加雷属性攻击力:{^FFABFC%d^FFFF00}\r增加防御力:{^FFABFC%d^FFFF00}\r增加生命:{^FFABFC%d^FFFF00}\r增加战力:{^FFABFC%d^FFFF00}",
StrUseDesc=_t "增加雷属性攻击力:%d\r增加防御力:%d\r增加生命:%d\r增加战力:%d",
StrDescNum="19*level+21;40*level+125;175*level+475;50*level",
}

skill_desc_str[3930]=
{
strName=_t"凤凰梵焰",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "增加火属性攻击力:{^FFABFC%d^FFFF00}\r增加防御力:{^FFABFC%d^FFFF00}\r增加生命:{^FFABFC%d^FFFF00}\r增加战力:{^FFABFC%d^FFFF00}",
StrUseDesc=_t "增加火属性攻击力:%d\r增加防御力:%d\r增加生命:%d\r增加战力:%d",
StrDescNum="19*level+21;40*level+125;175*level+475;50*level",
}

skill_desc_str[3953]=
{
strName=_t"施肥",
}

skill_desc_str[3954]=
{
strName=_t"浇水",
}

skill_desc_str[4003]=
{
strName=_t"冰霜之吸",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "将目标玩家拉拽到自己身前，只能对玩家释放",
StrUseDesc=_t "将目标玩家拉拽到自己身前，只能对玩家释放",
}

skill_desc_str[4023]=
{
strName=_t"剥开",
}

skill_desc_str[4024]=
{
strName=_t"剥开",
}

skill_desc_str[4025]=
{
strName=_t"剥开",
}

skill_desc_str[4026]=
{
strName=_t"剥开",
}

skill_desc_str[4027]=
{
strName=_t"剥开",
}

skill_desc_str[4028]=
{
strName=_t"剥开",
}

skill_desc_str[4029]=
{
strName=_t"剥开",
}

skill_desc_str[4030]=
{
strName=_t"剥开",
}

skill_desc_str[4033]=
{
strName=_t"品尝",
}

skill_desc_str[4034]=
{
strName=_t"品尝",
}

skill_desc_str[4035]=
{
strName=_t"品尝",
}

skill_desc_str[3275]=
{
strName=_t"日冕冲击波",
}

skill_desc_str[4128]=
{
strName=_t"注入能量",
}

skill_desc_str[4089]=
{
strName=_t"强化奇袭",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s天马^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^c0c0ff[%s]^FFFF00的伤害提升20%%",
StrUseDesc=_t "使得^00FF00%s天马^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^c0c0ff[%s]^FFFF00的伤害提升20%%",
StrDescNum="player.prof==2 and ''or '^ff0000';skill_desc_str[922].strName;skill_desc_str[17].strName",
StrFuncdesc=_t"^c0c0ff黑暗天马座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[4090]=
{
strName=_t"强化云之冲击",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s天马^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^c0c0ff[%s]^FFFF00的定身时间变为6秒",
StrUseDesc=_t "使得^00FF00%s天马^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^c0c0ff[%s]^FFFF00的定身时间变为6秒",
StrDescNum="player.prof==2 and ''or '^ff0000';skill_desc_str[926].strName;skill_desc_str[27].strName",
StrFuncdesc=_t"^c0c0ff黑暗天马座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[4091]=
{
strName=_t"强化相同招式无效",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s天马^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，每次免疫控制时间提升到5秒",
StrUseDesc=_t "使得^00FF00%s天马^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，每次免疫控制时间提升到5秒",
StrDescNum="player.prof==2 and ''or '^ff0000';skill_desc_str[927].strName",
StrFuncdesc=_t"^c0c0ff黑暗天马座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[4092]=
{
strName=_t"强化决定性攻击",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s天马^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，使^c0c0ff[%s]^FFFF00在目标血量少于50%%时，伤害也提高50%%并附带星光惩戒效果",
StrUseDesc=_t "使得^00FF00%s天马^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，使^c0c0ff[%s]^FFFF00在目标血量少于50%%时，伤害也提高50%%并附带星光惩戒效果",
StrDescNum="player.prof==2 and ''or '^ff0000';skill_desc_str[931].strName;skill_desc_str[62].strName",
StrFuncdesc=_t"^c0c0ff黑暗天马座圣衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[4093]=
{
strName=_t"强化天马恒星拳",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s天马^FFFF00斗魂^c0c0ff[%s]^FFFF00的伤害提高30%%，伤害下降比例提高10%%",
StrUseDesc=_t "使得^00FF00%s天马^FFFF00斗魂^c0c0ff[%s]^FFFF00的伤害提高30%%，伤害下降比例提高10%%",
StrDescNum="player.prof==2 and ''or '^ff0000';skill_desc_str[935].strName",
StrFuncdesc=_t"^c0c0ff黑暗天马座圣衣星铸等级达到32级时获得^A2FFFF",
}

skill_desc_str[4094]=
{
strName=_t"强化冰之舞",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s白鸟^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，释放^c0c0ff[%s]^FFFF00时会回复自己攻击力1。7倍的生命(%d)",
StrUseDesc=_t "使得^00FF00%s白鸟^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，释放^c0c0ff[%s]^FFFF00时会回复自己攻击力1。7倍的生命(%d)",
StrDescNum="player.prof==3 and ''or '^ff0000';skill_desc_str[1831].strName;skill_desc_str[77].strName;1.7*(player.damagehigh+player.damagelow)/2",
StrFuncdesc=_t"^c0c0ff黑暗白鸟座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[4095]=
{
strName=_t"强化冻裂",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s白鸟^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，减速目标的水属性抗性额外减少15点，变为减少40点",
StrUseDesc=_t "使得^00FF00%s白鸟^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，减速目标的水属性抗性额外减少15点，变为减少40点",
StrDescNum="player.prof==3 and ''or '^ff0000';skill_desc_str[1833].strName",
StrFuncdesc=_t"^c0c0ff黑暗白鸟座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[4096]=
{
strName=_t"强化寒潮频发",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s白鸟^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^c0c0ff[%s]^FFFF00释放时消耗的冻气减少30点",
StrUseDesc=_t "使得^00FF00%s白鸟^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^c0c0ff[%s]^FFFF00释放时消耗的冻气减少30点",
StrDescNum="player.prof==3 and ''or '^ff0000';skill_desc_str[1838].strName;skill_desc_str[70].strName",
StrFuncdesc=_t"^c0c0ff黑暗白鸟座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[4097]=
{
strName=_t"强化潮汐之力",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s白鸟^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，每次释放召唤技能时爆击率额外提升5%%",
StrUseDesc=_t "使得^00FF00%s白鸟^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，每次释放召唤技能时爆击率额外提升5%%",
StrDescNum="player.prof==3 and ''or '^ff0000';skill_desc_str[1839].strName",
StrFuncdesc=_t"^c0c0ff黑暗白鸟座圣衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[4098]=
{
strName=_t"强化永冻冰海之花",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s白鸟^FFFF00斗魂^c0c0ff[%s]^FFFF00不再需要冻气，冷却时间减少2秒",
StrUseDesc=_t "使得^00FF00%s白鸟^FFFF00斗魂^c0c0ff[%s]^FFFF00不再需要冻气，冷却时间减少2秒",
StrDescNum="player.prof==3 and ''or '^ff0000';skill_desc_str[1843].strName",
StrFuncdesc=_t"^c0c0ff黑暗白鸟座圣衣星铸等级达到32级时获得^A2FFFF",
}

skill_desc_str[4099]=
{
strName=_t"强化斩灵爪",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s天龙^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，附加的持续伤害大幅增加，且与自己攻击力相关",
StrUseDesc=_t "使得^00FF00%s天龙^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，附加的持续伤害大幅增加，且与自己攻击力相关",
StrDescNum="player.prof==4 and ''or '^ff0000';skill_desc_str[938].strName",
StrFuncdesc=_t"^c0c0ff黑暗天龙座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[4100]=
{
strName=_t"强化涉水而行",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s天龙^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^c0c0ff[%s]^FFFF00持续时间增加2秒，伤害提升30%%",
StrUseDesc=_t "使得^00FF00%s天龙^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^c0c0ff[%s]^FFFF00持续时间增加2秒，伤害提升30%%",
StrDescNum="player.prof==4 and ''or '^ff0000';skill_desc_str[939].strName;skill_desc_str[1590].strName",
StrFuncdesc=_t"^c0c0ff黑暗天龙座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[4101]=
{
strName=_t"强化再战",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s天龙^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^c0c0ff[%s]^FFFF00的持续时间不再减少",
StrUseDesc=_t "使得^00FF00%s天龙^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^c0c0ff[%s]^FFFF00的持续时间不再减少",
StrDescNum="player.prof==4 and ''or '^ff0000';skill_desc_str[943].strName;skill_desc_str[113].strName",
StrFuncdesc=_t"^c0c0ff黑暗天龙座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[4102]=
{
strName=_t"强化逆鳞触怒",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s天龙^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，生命下降到40%%以下后，增加的抗性额外提升到20%%，变为40%%",
StrUseDesc=_t "使得^00FF00%s天龙^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，生命下降到40%%以下后，增加的抗性额外提升到20%%，变为40%%",
StrDescNum="player.prof==4 and ''or '^ff0000';skill_desc_str[946].strName",
StrFuncdesc=_t"^c0c0ff黑暗天龙座圣衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[4103]=
{
strName=_t"强化千年龙转生",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s天龙^FFFF00斗魂^c0c0ff[%s]^FFFF00在自己可恢复的血量少于30%%时，溢出的回复血量将全部转给目标",
StrUseDesc=_t "使得^00FF00%s天龙^FFFF00斗魂^c0c0ff[%s]^FFFF00在自己可恢复的血量少于30%%时，溢出的回复血量将全部转给目标",
StrDescNum="player.prof==4 and ''or '^ff0000';skill_desc_str[949].strName",
StrFuncdesc=_t"^c0c0ff黑暗天龙座圣衣星铸等级达到32级时获得^A2FFFF",
}

skill_desc_str[4104]=
{
strName=_t"强化锁链标记",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s仙女^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，释放^c0c0ff[%s]^FFFF00后目标受到仙女座技能伤害额外提升4%%，变为10%%",
StrUseDesc=_t "使得^00FF00%s仙女^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，释放^c0c0ff[%s]^FFFF00后目标受到仙女座技能伤害额外提升4%%，变为10%%",
StrDescNum="player.prof==5 and ''or '^ff0000';skill_desc_str[1927].strName;skill_desc_str[525].strName",
StrFuncdesc=_t"^c0c0ff黑暗仙女座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[4105]=
{
strName=_t"强化蔷薇杀阵",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s仙女^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，在有神威领域值时，^c0c0ff[%s]^FFFF00可使目标沉默6秒",
StrUseDesc=_t "使得^00FF00%s仙女^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，在有神威领域值时，^c0c0ff[%s]^FFFF00可使目标沉默6秒",
StrDescNum="player.prof==5 and ''or '^ff0000';skill_desc_str[1923].strName;skill_desc_str[528].strName",
StrFuncdesc=_t"^c0c0ff黑暗仙女座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[4106]=
{
strName=_t"强化持久守护",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s仙女^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，加强后^c0c0ff[%s]^FFFF00的持久守护状态，在被攻击后\r每秒回复生命量额外增加1%%，变为2%%",
StrUseDesc=_t "使得^00FF00%s仙女^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，加强后^c0c0ff[%s]^FFFF00的持久守护状态，在被攻击后\r每秒回复生命量额外增加1%%，变为2%%",
StrDescNum="player.prof==5 and ''or '^ff0000';skill_desc_str[1919].strName;skill_desc_str[517].strName",
StrFuncdesc=_t"^c0c0ff黑暗仙女座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[4107]=
{
strName=_t"强化抢救",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s仙女^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，即使目标血量高于30%%，^c0c0ff[%s]^FFFF00的初始回复量和伤害抵御值都将提升40%%",
StrUseDesc=_t "使得^00FF00%s仙女^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，即使目标血量高于30%%，^c0c0ff[%s]^FFFF00的初始回复量和伤害抵御值都将提升40%%",
StrDescNum="player.prof==5 and ''or '^ff0000';skill_desc_str[1920].strName;skill_desc_str[518].strName",
StrFuncdesc=_t"^c0c0ff黑暗仙女座圣衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[4108]=
{
strName=_t"强化冥王的特赦",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s仙女^FFFF00斗魂^c0c0ff[%s]^FFFF00持续时间额外增加8秒，触发后回复的生命值提高10%%",
StrUseDesc=_t "使得^00FF00%s仙女^FFFF00斗魂^c0c0ff[%s]^FFFF00持续时间额外增加8秒，触发后回复的生命值提高10%%",
StrDescNum="player.prof==5 and ''or '^ff0000';skill_desc_str[1921].strName",
StrFuncdesc=_t"^c0c0ff黑暗仙女座圣衣星铸等级达到32级时获得^A2FFFF",
}

skill_desc_str[4109]=
{
strName=_t"强化火地狱",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s凤凰^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^c0c0ff[%s]^FFFF00的冷却时间降为15秒",
StrUseDesc=_t "使得^00FF00%s凤凰^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^c0c0ff[%s]^FFFF00的冷却时间降为15秒",
StrDescNum="player.prof==6 and ''or '^ff0000';skill_desc_str[1937].strName;skill_desc_str[1521].strName",
StrFuncdesc=_t"^c0c0ff黑暗凤凰座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[4110]=
{
strName=_t"强化火精灵",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s凤凰^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^c0c0ff[%s]^FFFF00中受到伤害减少变为25%%",
StrUseDesc=_t "使得^00FF00%s凤凰^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^c0c0ff[%s]^FFFF00中受到伤害减少变为25%%",
StrDescNum="player.prof==6 and ''or '^ff0000';skill_desc_str[1943].strName;skill_desc_str[1528].strName",
StrFuncdesc=_t"^c0c0ff黑暗凤凰座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[4111]=
{
strName=_t"强化真火暴烈",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s凤凰^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，即使目标身上没有烈焰焚烧效果，^c0c0ff[%s]^FFFF00也能将其击退3米",
StrUseDesc=_t "使得^00FF00%s凤凰^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，即使目标身上没有烈焰焚烧效果，^c0c0ff[%s]^FFFF00也能将其击退3米",
StrDescNum="player.prof==6 and ''or '^ff0000';skill_desc_str[1939].strName;skill_desc_str[1522].strName",
StrFuncdesc=_t"^c0c0ff黑暗凤凰座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[4112]=
{
strName=_t"强化天威凌压",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s凤凰^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^c0c0ff[%s]^FFFF00的暴击率额外提升25%%，变为75%%；持续时间额外增加3秒，变为8秒",
StrUseDesc=_t "使得^00FF00%s凤凰^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^c0c0ff[%s]^FFFF00的暴击率额外提升25%%，变为75%%；持续时间额外增加3秒，变为8秒",
StrDescNum="player.prof==6 and ''or '^ff0000';skill_desc_str[1935].strName;skill_desc_str[1526].strName",
StrFuncdesc=_t"^c0c0ff黑暗凤凰座圣衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[4113]=
{
strName=_t"强化日冕冲击波",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s凤凰^FFFF00斗魂^c0c0ff[%s]^FFFF00伤害提高30%%，倒地时间增加1秒",
StrUseDesc=_t "使得^00FF00%s凤凰^FFFF00斗魂^c0c0ff[%s]^FFFF00伤害提高30%%，倒地时间增加1秒",
StrDescNum="player.prof==6 and ''or '^ff0000';skill_desc_str[1941].strName",
StrFuncdesc=_t"^c0c0ff黑暗凤凰座圣衣星铸等级达到32级时获得^A2FFFF",
}

skill_desc_str[4118]=
{
strName=_t"充能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "能为祈福的雅典娜补充能量",
StrUseDesc=_t "能为祈福的雅典娜补充能量",
}

skill_desc_str[4119]=
{
strName=_t"黄金之怒",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "处女座沙加赐予的招式",
StrUseDesc=_t "处女座沙加赐予的招式",
}

skill_desc_str[4120]=
{
strName=_t"天魔降伏",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "处女座沙加赐予的招式，威力巨大",
StrUseDesc=_t "处女座沙加赐予的招式，威力巨大",
}

skill_desc_str[4247]=
{
strName=_t"黑暗天马流星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(2.95*t2*t2+1315*t2+2684);1*(0.017*t2+1.267)*100",
StrFuncdesc=_t"攻击目标及前方一定范围内敌人，并造成击退效果",
}

skill_desc_str[4248]=
{
strName=_t"黑暗钻石星辰拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(2.95*t2*t2+1315*t2+2684);1*(0.017*t2+1.267)*100",
StrFuncdesc=_t"攻击目标及前方一定范围内敌人，并冰冻目标",
}

skill_desc_str[4249]=
{
strName=_t"黑暗庐山升龙霸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(2.95*t2*t2+1315*t2+2684);1*(0.017*t2+1.267)*100",
StrFuncdesc=_t"攻击目标周围敌人，造成大量伤害.并造成浮空效果",
}

skill_desc_str[4250]=
{
strName=_t"黑暗星云风暴",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(2.95*t2*t2+1315*t2+2684);1*(0.017*t2+1.267)*100",
StrFuncdesc=_t"攻击目标及前方一定范围内敌人，并造成击退效果",
}

skill_desc_str[4251]=
{
strName=_t"黑暗凤翼天翔",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r8秒内目标受到灼烧，每秒失去%d点生命",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r8秒内目标受到灼烧，每秒失去%d点生命",
StrDescNum="(2.95*t2*t2+1315*t2+2684);1*(0.017*t2+1.267)*100;(2.95*t2*t2+1315*t2+2684)/5/10/8",
StrFuncdesc=_t"攻击目标及前方一定范围内敌人，并持续伤害效果",
}

skill_desc_str[3598]=
{
strName=_t"流星空突拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天马座的基础招式",
StrUseDesc=_t "天马座的基础招式",
}

skill_desc_str[3599]=
{
strName=_t"天马流星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天马座的绝技！",
StrUseDesc=_t "天马座的绝技！",
}

skill_desc_str[3726]=
{
strName=_t"冲拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "贵鬼的基础招式",
StrUseDesc=_t "贵鬼的基础招式",
}

skill_desc_str[3727]=
{
strName=_t"念力拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "贵鬼使用念力发出的招式",
StrUseDesc=_t "贵鬼使用念力发出的招式",
}

skill_desc_str[3728]=
{
strName=_t"休息",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "不要着急，休息，休息一会",
StrUseDesc=_t "不要着急，休息，休息一会",
}

skill_desc_str[4471]=
{
strName=_t"锤击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "对单个目标进行锤击，快！准！狠！",
StrUseDesc=_t "对单个目标进行锤击，快！准！狠！",
}

skill_desc_str[4472]=
{
strName=_t"熔火一击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "将泰坦之锤附上天火的力量，可以击晕并灼烧一条线上的多个目标。",
StrUseDesc=_t "将泰坦之锤附上天火的力量，可以击晕并灼烧一条线上的多个目标。",
}

skill_desc_str[4473]=
{
strName=_t"泰坦魂爆",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "利用泰坦之魂的力量轰击周身多个目标，只对生物有效。",
StrUseDesc=_t "利用泰坦之魂的力量轰击周身多个目标，只对生物有效。",
}

skill_desc_str[4497]=
{
strName=_t"泰坦之力",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "主动求取泰坦的祝福，提高自身和友军攻防。",
StrUseDesc=_t "主动求取泰坦的祝福，提高自身和友军攻防。",
}

skill_desc_str[4286]=
{
strName=_t"光速效应",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00以及^c0c0ff[%s]^FFFF00期间，附带2米加速、15%%减伤的效果\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00以及^c0c0ff[%s]^FFFF00期间，附带2米加速、15%%减伤的效果\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="skill_desc_str[30].strName;skill_desc_str[64].strName;player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff罗盘座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[4287]=
{
strName=_t"灭绝陨石",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00落下的每颗流星有20%%的概率变为灭绝陨石，伤害范围增加1米，伤害为原来的4倍\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00落下的每颗流星有20%%的概率变为灭绝陨石，伤害范围增加1米，伤害为原来的4倍\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="skill_desc_str[1622].strName;player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff罗盘座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[4288]=
{
strName=_t"万有引力",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "每次使用^c0c0ff[%s]^FFFF00都会给主目标一个追踪的状态，目标减速1米/秒，持续8秒；对有该状态的目标使用终结技时，会根据斗志的数量x额外附加效果：\r定身：x-2秒\r伤害提高：5*x%%\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "每次使用^c0c0ff[%s]^FFFF00都会给主目标一个追踪的状态，目标减速1米/秒，持续8秒；对有该状态的目标使用终结技时，会根据斗志的数量x额外附加效果：\r定身：x-2秒\r伤害提高：5*x%%\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="skill_desc_str[17].strName;player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff蜥蜴座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[4289]=
{
strName=_t"超新星力场",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "受到超新星力场的保护，使得下5次受到的伤害减少80%%，持续30秒\r处于浮空、倒地、冰冻、石化、沉默、混乱状态下也可使用\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "受到超新星力场的保护，使得下5次受到的伤害减少80%%，持续30秒\r处于浮空、倒地、冰冻、石化、沉默、混乱状态下也可使用\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff蜥蜴座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[4290]=
{
strName=_t"天罚流星",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加雷属性攻击力:{^FFABFC%d^FFFF00}\r攻击5次，共造成{^FFABFC%d%%^FFFF00}的伤害\r最后一击造成3秒倒地\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "附加攻击力:%d\r附加雷属性攻击力:%d\r攻击5次，共造成%d%%的伤害\r最后一击造成3秒倒地\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="0.06*player.level*player.level+11.11*player.level+53.3;0.11*player.level*player.level+20.73*player.level+98.9;100*(0.0168*player.level+5);player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff蜥蜴座圣衣星铸等级达到24级时获得^A2FFFF\r攻击5米半径区域内的目标，并击倒",
}

skill_desc_str[4291]=
{
strName=_t"天马回旋暴风",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "附加攻击力：{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r每秒造成{^FFABFC%d%%^FFFF00}的伤害\r旋风每次伤害会附带2米/秒的减速效果，最多可以叠加3层\r在旋风范围内超过3秒的目标将会被眩晕3秒\r化身旋风时，自己免疫控制，伤害抗性提高50%%，移动速度固定为3米/秒\r旋风持续6秒\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "附加攻击力：%d\r附加风属性攻击力:%d\r每秒造成%d%%的伤害\r旋风每次伤害会附带2米/秒的减速效果，最多可以叠加3层\r在旋风范围内超过3秒的目标将会被眩晕3秒\r化身旋风时，自己免疫控制，伤害抗性提高50%%，移动速度固定为3米/秒\r旋风持续6秒\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="0.04*player.level*player.level+8*player.level+40;0.02*player.level*player.level+5.21*player.level+39.3;100*(0.0028*player.level+0.83);player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff罗盘座圣衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[4292]=
{
strName=_t"脆化冰冻",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00和^c0c0ff[%s]^FFFF00对于被寒冰减速或者冰冻的单位，伤害提升25%%\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00和^c0c0ff[%s]^FFFF00对于被寒冰减速或者冰冻的单位，伤害提升25%%\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="skill_desc_str[67].strName;skill_desc_str[70].strName;player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff白鲸座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[4293]=
{
strName=_t"寒流威慑",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00护盾的血量提高50%%，持续时间提高3秒\r并附带反击效果，攻击带盾的目标将被减速，每次减1米，最多减4米/秒\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00护盾的血量提高50%%，持续时间提高3秒\r并附带反击效果，攻击带盾的目标将被减速，每次减1米，最多减4米/秒\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="skill_desc_str[224].strName;player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff巨爵座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[4294]=
{
strName=_t"活力封印",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00的冰封结束后，目标将受到强烈的诅咒，在接下来的5秒内将无法恢复生命和使用药品\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00的冰封结束后，目标将受到强烈的诅咒，在接下来的5秒内将无法恢复生命和使用药品\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="skill_desc_str[99].strName;player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff白鲸座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[4295]=
{
strName=_t"厄俄斯的制裁",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "远距离攻击选中的3米半径区域，造成伤害，被击中的敌人将被沉默2秒\r变身期间可释放技能^c0c0ff[%s]^FFFF00\r附加攻击力:%d\r附加水属性攻击力:%d\r每次造成%d%%的伤害\r最多持续12秒\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "远距离攻击选中的3米半径区域，造成伤害，被击中的敌人将被沉默2秒\r变身期间可释放技能^c0c0ff[%s]^FFFF00\r附加攻击力:%d\r附加水属性攻击力:%d\r每次造成%d%%的伤害\r最多持续12秒\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="skill_desc_str[104].strName;0.06*player.level*player.level+12.83*player.level+67.25;0.07*player.level*player.level+14.35*player.level+64;100*(0.0124*player.level+2.74);player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff巨爵座圣衣星铸等级达到16级时获得^A2FFFF\r化身为黎明女神，可以发动4次审判攻击，使敌人沉默",
}

skill_desc_str[4296]=
{
strName=_t"北十字的守护",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "需要持续施法，每秒消耗%d点冻气\r自己和区域内的队友每秒恢复%d点生命，随攻击力增长\r区域内的队友提升50%%伤害倍率\r区域内的敌人如果被控制，则伤害抗性下降20%%\r释放时自己免疫控制\r最多持续8秒\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "需要持续施法，每秒消耗%d点冻气\r自己和区域内的队友每秒恢复%d点生命，随攻击力增长\r区域内的队友提升50%%伤害倍率\r区域内的敌人如果被控制，则伤害抗性下降20%%\r释放时自己免疫控制\r最多持续8秒\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="20*(1-0.5*t6);t2*0.25+300;player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff白鲸座圣衣星铸等级达到24级时获得^A2FFFF\r消耗冻气治疗和提升周围队友的伤害，并使进入区域的敌人在被控制时受到额外诅咒",
}

skill_desc_str[4297]=
{
strName=_t"绝对零度结界",
StrAttacktype=_t"主动诅咒",
StrMana=_t "消耗%d点冻气",
StrCompDesc=_t "主动技能，释放一个6米半径的结界\r敌人从外界进入这个结界时，会被冰冻3秒\r结界内的敌人离开这个结界时，也会被冰冻3秒\r结界持续8秒\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "主动技能，释放一个6米半径的结界\r敌人从外界进入这个结界时，会被冰冻3秒\r结界内的敌人离开这个结界时，也会被冰冻3秒\r结界持续8秒\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff巨爵座圣衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[4298]=
{
strName=_t"应剑而生",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使用^c0c0ff[%s]^FFFF00后，能重置^c0c0ff[%s]^FFFF00、^c0c0ff[%s]^FFFF00的冷却时间\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "使用^c0c0ff[%s]^FFFF00后，能重置^c0c0ff[%s]^FFFF00、^c0c0ff[%s]^FFFF00的冷却时间\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="skill_desc_str[92].strName;skill_desc_str[84].strName;skill_desc_str[85].strName;player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff英仙座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[4299]=
{
strName=_t"庇护之云",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "释放^c0c0ff[%s]^FFFF00^c0c0ff[%s]^FFFF00后，使自己和周围15米的队友提升30%%的伤害抗性，持续6秒\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "释放^c0c0ff[%s]^FFFF00^c0c0ff[%s]^FFFF00后，使自己和周围15米的队友提升30%%的伤害抗性，持续6秒\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="skill_desc_str[83].strName;skill_desc_str[93].strName;player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff英仙座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[4300]=
{
strName=_t"修罗之道",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^c0c0ff[%s]^FFFF00动作改变，变为三段，伤害提升50%%\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "使得^c0c0ff[%s]^FFFF00动作改变，变为三段，伤害提升50%%\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="skill_desc_str[92].strName;player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff地狱犬座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[4301]=
{
strName=_t"庐山龙照海",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r浮空3秒\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r造成%d%%的伤害\r浮空3秒\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="0.05*player.level*player.level+10.46*player.level+51.49;0.06*player.level*player.level+11.1*player.level+54.84;100*(0.0097*player.level+2.14);player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff英仙座圣衣星铸等级达到24级时获得^A2FFFF\r地面突起剑刺，将自身周围10米范围的敌人刺起浮空",
}

skill_desc_str[4302]=
{
strName=_t"逆流圣血",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "消耗5%%最大生命值\r(如果身上有护盾效果，则不消耗生命)\r使自己立即解除控制，并且3秒内免疫控制，伤害抗性提升60%%\r处于浮空、倒地、冰冻、石化、沉默、混乱状态下也可使用\r血量低于15%%时，不可使用\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "消耗5%%最大生命值\r(如果身上有护盾效果，则不消耗生命)\r使自己立即解除控制，并且3秒内免疫控制，伤害抗性提升60%%\r处于浮空、倒地、冰冻、石化、沉默、混乱状态下也可使用\r血量低于15%%时，不可使用\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff地狱犬座圣衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[4303]=
{
strName=_t"圣剑天道",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r攻击4次，共造成{^FFABFC%d%%^FFFF00}的伤害\r对怪物额外附加圣剑之痕状态\t^00FF00圣剑之痕^FFFF00\r每秒受到伤害:%d\r持续8秒\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r攻击4次，共造成%d%%的伤害\r对怪物额外附加圣剑之痕状态\t^00FF00圣剑之痕^FFFF00\r每秒受到伤害:%d\r持续8秒\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="0.06*player.level*player.level+12.39*player.level+61.55;0.07*player.level*player.level+13.54*player.level+67.39;100*(0.0147*player.level+3.25);4.7*((t2)*0.5+(t3)*0.25)*0.25*0.125;player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff地狱犬座圣衣星铸等级达到16级时获得^A2FFFF\r猛烈输出，攻击120度10米半径扇形范围目标，对怪物额外造成持续伤害状态",
}

skill_desc_str[4176]=
{
strName=_t"鸦杀",
}

skill_desc_str[4360]=
{
strName=_t"催促",
}

skill_desc_str[4523]=
{
strName=_t"宣战",
}

skill_desc_str[4521]=
{
strName=_t"圣剑",
}

skill_desc_str[4506]=
{
strName=_t"升龙拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "普通攻击，造成伤害同时积攒一层小宇宙",
StrUseDesc=_t "普通攻击，造成伤害同时积攒一层小宇宙",
}

skill_desc_str[4507]=
{
strName=_t"庐山升龙霸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "释放全部的小宇宙，造成大量伤害",
StrUseDesc=_t "释放全部的小宇宙，造成大量伤害",
}

skill_desc_str[4508]=
{
strName=_t"庐山百龙霸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "释放全部的小宇宙，造成持续伤害，同时击倒敌人",
StrUseDesc=_t "释放全部的小宇宙，造成持续伤害，同时击倒敌人",
}

skill_desc_str[4509]=
{
strName=_t"回血",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "恢复血量",
StrUseDesc=_t "恢复血量",
}

skill_desc_str[4560]=
{
strName=_t"爱神之吻",
}

skill_desc_str[4535]=
{
strName=_t"庇护共鸣",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "释放^c0c0ff[%s]^FFFF00持续3秒以上或^c0c0ff[%s]^FFFF00时，会给目标附加共鸣状态\t^00FF00共鸣^FFFF00\r受到^c0c0ff[%s]^FFFF00治疗时，初始治疗量提升300%%\r持续5秒\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "释放^c0c0ff[%s]^FFFF00持续3秒以上或^c0c0ff[%s]^FFFF00时，会给目标附加共鸣状态\t^00FF00共鸣^FFFF00\r受到^c0c0ff[%s]^FFFF00治疗时，初始治疗量提升300%%\r持续5秒\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="skill_desc_str[513].strName;skill_desc_str[518].strName;skill_desc_str[514].strName;player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天鹤座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[4537]=
{
strName=_t"解放之光",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00可将目标周围5米范围内敌人正在释放的技能打断并沉默3秒\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00可将目标周围5米范围内敌人正在释放的技能打断并沉默3秒\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="skill_desc_str[529].strName;player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff仙后座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[4539]=
{
strName=_t"虫洞扭曲",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00、^c0c0ff[%s]^FFFF00和^c0c0ff[%s]^FFFF00的伤害提升20%%\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00、^c0c0ff[%s]^FFFF00和^c0c0ff[%s]^FFFF00的伤害提升20%%\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="skill_desc_str[526].strName;skill_desc_str[527].strName;skill_desc_str[1931].strName;player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff仙后座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[4536]=
{
strName=_t"命运之链",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "使周围15米范围内的队友获得命运之链状态\t^00FF00命运之链^FFFF00\r下次被伤血时，自己和15米范围内的随机一名队友将回复生命，回复量相当于生命上限的10%%\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "使周围15米范围内的队友获得命运之链状态\t^00FF00命运之链^FFFF00\r下次被伤血时，自己和15米范围内的随机一名队友将回复生命，回复量相当于生命上限的10%%\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天鹤座圣衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[4538]=
{
strName=_t"命运献祭",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "技能施放期间，周围5米范围内的队友将免受控制效果的影响，同时伤害抗性提升20%%\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "技能施放期间，周围5米范围内的队友将免受控制效果的影响，同时伤害抗性提升20%%\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天鹤座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[4540]=
{
strName=_t"凤凰召唤",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "召唤凤凰座青铜圣斗士一辉来协助战斗\t^00FF00一辉伤害^FFFF00\r附加攻击力:{^FFABFC%d^FFFF00}\r附加雷属性攻击力:{^FFABFC%d^FFFF00}\r每秒造成{^FFABFC%d%%^FFFF00}的伤害\r一辉存在20秒\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "召唤凤凰座青铜圣斗士一辉来协助战斗\t^00FF00一辉伤害^FFFF00\r附加攻击力:%d\r附加雷属性攻击力:%d\r每秒造成%d%%的伤害\r一辉存在20秒\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="math.ceil(0.03*player.level*player.level+6*player.level+30);math.ceil(0.034*player.level*player.level+6.833*player.level+34.16);math.ceil((0.00163*player.level+0.4167)*100);player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff仙后座圣衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[4541]=
{
strName=_t"岩浆大地",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00将在地面留下一片火焰的痕迹，痕迹范围内的敌人将持续受到伤害\r最多存在8秒\r^00FF00火焰痕迹伤害^FFFF00\r附加攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r每秒造成{^FFABFC%d%%^FFFF00}的伤害\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00将在地面留下一片火焰的痕迹，痕迹范围内的敌人将持续受到伤害\r最多存在8秒\r^00FF00火焰痕迹伤害^FFFF00\r附加攻击力:%d\r附加火属性攻击力:%d\r每秒造成%d%%的伤害\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="skill_desc_str[1523].strName;math.ceil(0.023*player.level*player.level+4.64*player.level+23.2);math.ceil(0.007*player.level*player.level+1.494*player.level+7.473);math.ceil((0.001*player.level+0.214)*100);player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff祭坛座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[4543]=
{
strName=_t"阴影束缚",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00召唤的黑暗凤凰移动速度提升3米/秒，同时击中敌人时伤害提升80%%\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00召唤的黑暗凤凰移动速度提升3米/秒，同时击中敌人时伤害提升80%%\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="skill_desc_str[1525].strName;player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff孔雀座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[4545]=
{
strName=_t"不死鸟传说",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00触发时，将获得重生之怒状态\t^00FF00重生之怒^FFFF00\r不会受到伤害，同时免疫所有控制效果，且体力回满\r持续5秒\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00触发时，将获得重生之怒状态\t^00FF00重生之怒^FFFF00\r不会受到伤害，同时免疫所有控制效果，且体力回满\r持续5秒\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="skill_desc_str[2014].strName;player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff孔雀座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[4542]=
{
strName=_t"三足火鸟",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "用精神力量迷惑周围的所有人，召唤两个幻像协助战斗\r幻像无法被攻击，存在20秒\t^00FF00幻像伤害^FFFF00\r幻像附加攻击力:{^FFABFC%d^FFFF00}\r幻像附加火属性攻击力:{^FFABFC%d^FFFF00}\r幻像每秒造成{^FFABFC%d%%^FFFF00}的伤害\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "用精神力量迷惑周围的所有人，召唤两个幻像协助战斗\r幻像无法被攻击，存在20秒\t^00FF00幻像伤害^FFFF00\r幻像附加攻击力:%d\r幻像附加火属性攻击力:%d\r幻像每秒造成%d%%的伤害\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+40);math.ceil(0.041*player.level*player.level+8.333*player.level+41.66);math.ceil((0.0015*player.level+0.403)*40);player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff祭坛座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[4544]=
{
strName=_t"红莲的化身",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "在目标区域召唤红莲之火\t^00FF00红莲之火^FFFF00\r随机攻击周围10米范围内的1个目标及其周围5米范围内的敌人\r同时附带减速效果\r最多存在10秒，可被攻击。\r红莲之火附加攻击力:{^FFABFC%d^FFFF00}\r红莲之火附加火属性攻击力:{^FFABFC%d^FFFF00}\r红莲之火每秒造成{^FFABFC%d%%^FFFF00}的伤害\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "在目标区域召唤红莲之火\t^00FF00红莲之火^FFFF00\r随机攻击周围10米范围内的1个目标及其周围5米范围内的敌人\r同时附带减速效果\r最多存在10秒，可被攻击。\r红莲之火附加攻击力:%d\r红莲之火附加火属性攻击力:%d\r红莲之火每秒造成%d%%的伤害\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+40);math.ceil(0.041*player.level*player.level+8.333*player.level+41.66);math.ceil((0.009*player.level+2.09)*20);player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff孔雀座圣衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[4546]=
{
strName=_t"地狱幻魔拳",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "使自己获得地狱幻影状态\t^00FF00地狱幻影^FFFF00\r被攻击时，将进入隐身状态，同时在身边产生一个幻像。\r地狱幻影状态最多持续8秒\t^00FF00隐身^FFFF00\r敌人将无法看到你\r隐身状态最多持续10秒\r当施放技能或进入隐身状态3秒后受到伤害时，隐身将会立即解除\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "使自己获得地狱幻影状态\t^00FF00地狱幻影^FFFF00\r被攻击时，将进入隐身状态，同时在身边产生一个幻像。\r地狱幻影状态最多持续8秒\t^00FF00隐身^FFFF00\r敌人将无法看到你\r隐身状态最多持续10秒\r当施放技能或进入隐身状态3秒后受到伤害时，隐身将会立即解除\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff祭坛座圣衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[4594]=
{
strName=_t"云石旋风拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r浮空3秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r浮空3秒",
StrDescNum="(-1.1*t2*t2+780*t2+39548);0.65*(0.008*t2+1.701)*100",
StrFuncdesc=_t"攻击目标及目标周围6米范围内敌人，并将敌人浮空",
}

skill_desc_str[4595]=
{
strName=_t"空气防御壁",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "吸收20%%的伤害，免疫控制5秒，只能对自身释放",
StrUseDesc=_t "吸收20%%的伤害，免疫控制5秒，只能对自身释放",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF",
}

skill_desc_str[4596]=
{
strName=_t"念力投射",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r定身5秒，并为自己补充体力100点",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r定身5秒，并为自己补充体力100点",
StrDescNum="(4.32*t2*t2+644*t2+35155);0.9*(0.008*t2+1.645)*100",
StrFuncdesc=_t"对一条直线上的敌人造成伤害并定身，并为自己补充体力",
}

skill_desc_str[4597]=
{
strName=_t"罗盘禁锢",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r并创造一个6米半径的禁锢区域，区域内的敌人每秒被减速2米/秒，在区域内超过3秒将被定身",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r并创造一个6米半径的禁锢区域，区域内的敌人每秒被减速2米/秒，在区域内超过3秒将被定身",
StrDescNum="(4.32*t2*t2+644*t2+35155);1*(0.008*t2+1.645)/3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r使自己周围6米范围内的敌人受到伤害",
}

skill_desc_str[4598]=
{
strName=_t"白鲸超绞拳 ",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r攻击3次，共造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r攻击3次，共造成%d%%伤害",
StrDescNum="(4.32*t2*t2+644*t2+35155);0.9*(0.008*t2+1.645)*100",
StrFuncdesc=_t"攻击自身周围15米范围内的敌人",
}

skill_desc_str[4599]=
{
strName=_t"灵魂轰炸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r浮空3秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r浮空3秒",
StrDescNum="(4.32*t2*t2+644*t2+35155);1.35*(0.008*t2+1.645)/3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r攻击指定目标，并使其浮空",
}

skill_desc_str[4600]=
{
strName=_t"冰枪白莲华",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r对于被寒冰减速、冰冻的目标，造成1。5倍伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r对于被寒冰减速、冰冻的目标，造成1。5倍伤害",
StrDescNum="(-1.1*t2*t2+780*t2+39548);0.85*(0.008*t2+1.701)*100",
StrFuncdesc=_t"攻击目标方向宽度6米，长15米直线上的所有敌人",
}

skill_desc_str[4601]=
{
strName=_t"明日之杯",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "给周围15米的队友加上状态；血量高于50%%的，提高伤害倍率20%%；血量低于50%%的，提高伤害抗性30%%\r状态持续12秒",
StrUseDesc=_t "给周围15米的队友加上状态；血量高于50%%的，提高伤害倍率20%%；血量低于50%%的，提高伤害抗性30%%\r状态持续12秒",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF",
}

skill_desc_str[4602]=
{
strName=_t"地狱钢球锁链",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r定身5秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r定身5秒",
StrDescNum="(-1.1*t2*t2+780*t2+39548);1.5*(0.008*t2+1.701)*100",
}

skill_desc_str[4603]=
{
strName=_t"恐怖怒吼",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r并使敌人伤害降低30%%，持续5秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r并使敌人伤害降低30%%，持续5秒",
StrDescNum="(-1.1*t2*t2+780*t2+39548);1*(0.008*t2+1.701)/3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r攻击并诅咒自身周围6米范围内的敌人",
}

skill_desc_str[4604]=
{
strName=_t"美杜沙之盾",
StrAttacktype=_t"主动诅咒",
StrCompDesc=_t "拿美杜莎的头，示向前方，使敌人石化\r被石化的目标伤害抗性下降%d%%",
StrUseDesc=_t "拿美杜莎的头，示向前方，使敌人石化\r被石化的目标伤害抗性下降%d%%",
StrDescNum="10+t2",
StrFuncdesc=_t"诅咒石化目标方向120度，半径10米的目标",
}

skill_desc_str[4605]=
{
strName=_t"毒妇恶魔拳 ",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r释放时能去除自己身上的诅咒、持续伤害、减速的效果",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r释放时能去除自己身上的诅咒、持续伤害、减速的效果",
StrDescNum="(4.32*t2*t2+644*t2+35155);1.1*(0.008*t2+1.645)/3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r攻击目标方向120度，8米半径的敌人",
}

skill_desc_str[4606]=
{
strName=_t"莲华爆碎拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(4.32*t2*t2+644*t2+35155);0.9*(0.008*t2+1.645)*100",
StrFuncdesc=_t"攻击目标方向120度，15米半径的敌人",
}

skill_desc_str[4607]=
{
strName=_t"红莲落神",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "提高自己和周围队友的暴击率50%%\r每秒回复2%%最大生命，持续8秒",
StrUseDesc=_t "提高自己和周围队友的暴击率50%%\r每秒回复2%%最大生命，持续8秒",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r祝福自身和自己周围12米范围的队友",
}

skill_desc_str[4608]=
{
strName=_t"绚舞裳闪脚",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r攻击5次，共造成%d%%伤害\r浮空3秒",
StrUseDesc=_t "附加攻击力:%d\r攻击5次，共造成%d%%伤害\r浮空3秒",
StrDescNum="(-1.1*t2*t2+780*t2+39548);0.65*(0.008*t2+1.701)*100",
StrFuncdesc=_t"攻击目标方向120度，10米半径的敌人",
}

skill_desc_str[4609]=
{
strName=_t"念动力 ",
StrAttacktype=_t"瞬移技能",
StrCompDesc=_t "瞬间移动到指定地点",
StrUseDesc=_t "瞬间移动到指定地点",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF",
}

skill_desc_str[4610]=
{
strName=_t"千手神音拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r攻击5次，共造成%d%%伤害\r击中的目标少于4个时，伤害会提升；目标数越少，伤害越高，伤害最多提升90%%",
StrUseDesc=_t "附加攻击力:%d\r攻击5次，共造成%d%%伤害\r击中的目标少于4个时，伤害会提升；目标数越少，伤害越高，伤害最多提升90%%",
StrDescNum="(4.32*t2*t2+644*t2+35155);0.78*(0.008*t2+1.645)*100",
StrFuncdesc=_t"攻击目标方向120度，6半径的敌人",
}

skill_desc_str[4611]=
{
strName=_t"逐星之翎",
StrAttacktype=_t"主动诅咒",
StrCompDesc=_t "将目标变形6秒\r被变形期间无法释放技能，移动速度变为1。5米/秒\r被变形的目标受到的伤害减少50%%",
StrUseDesc=_t "将目标变形6秒\r被变形期间无法释放技能，移动速度变为1。5米/秒\r被变形的目标受到的伤害减少50%%",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF",
}

skill_desc_str[4612]=
{
strName=_t"积尸气转灵波",
StrAttacktype=_t"召唤技能",
StrCompDesc=_t "在自己周围8米范围随机召唤8个灵魂，每个灵魂在出生位置会连续释放3次攻击\r附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "在自己周围8米范围随机召唤8个灵魂，每个灵魂在出生位置会连续释放3次攻击\r附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-1.1*t2*t2+780*t2+39548);1*(0.008*t2+1.701)/1.8*100",
}

skill_desc_str[4613]=
{
strName=_t"灵魂摄取",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "提高自己的伤害倍率25%%，并获得灵魂摄取的状态，持续6秒\r^c0c0ff[灵魂摄取]^FFFF00\r每击中一次，回复1%%的生命，最多触发10次",
StrUseDesc=_t "提高自己的伤害倍率25%%，并获得灵魂摄取的状态，持续6秒\r^c0c0ff[灵魂摄取]^FFFF00\r每击中一次，回复1%%的生命，最多触发10次",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF",
}

skill_desc_str[4760]=
{
strName=_t"鄙视",
}

skill_desc_str[4761]=
{
strName=_t"嘲笑",
}

skill_desc_str[4762]=
{
strName=_t"晕倒",
}

skill_desc_str[4779]=
{
strName=_t"庐山升龙霸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "非常强力的攻击",
StrUseDesc=_t "非常强力的攻击",
}

skill_desc_str[4780]=
{
strName=_t"庐山龙飞翔",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "强力攻击，附带持续性的伤害",
StrUseDesc=_t "强力攻击，附带持续性的伤害",
}

skill_desc_str[4730]=
{
strName=_t"阿瑞斯意志",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "状态持续20秒\r此技能状态会覆盖天神乱漫附带的状态\r天神道修业积累到10点自动学会",
StrUseDesc=_t "状态持续20秒\r此技能状态会覆盖天神乱漫附带的状态\r天神道修业积累到10点自动学会",
StrFuncdesc=_t"借助战神阿瑞斯之力，小幅提升范围内成员的攻击力",
}

skill_desc_str[4731]=
{
strName=_t"天神乱漫",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "状态持续20秒\r此技能状态会覆盖阿瑞斯意志附带的状态\r天神道修业积累到20点自动学会",
StrUseDesc=_t "状态持续20秒\r此技能状态会覆盖阿瑞斯意志附带的状态\r天神道修业积累到20点自动学会",
StrFuncdesc=_t"天神道终极招式，以天神之名大幅提升周围所有成员的\r攻击力",
}

skill_desc_str[4732]=
{
strName=_t"普通攻击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天神道基础招式",
StrUseDesc=_t "天神道基础招式",
}

skill_desc_str[4733]=
{
strName=_t"怒气冲击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "修罗道修业积累到10点自动学会",
StrUseDesc=_t "修罗道修业积累到10点自动学会",
StrFuncdesc=_t"以暴怒的修罗道姿态冲击单个目标造成重创",
}

skill_desc_str[4734]=
{
strName=_t"鬼神乱舞",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "状态持续20秒\r修罗道修业积累到20点自动学会",
StrUseDesc=_t "状态持续20秒\r修罗道修业积累到20点自动学会",
StrFuncdesc=_t"修罗道终极招式，以鬼神之姿再临，大幅提升自身暴击率",
}

skill_desc_str[4735]=
{
strName=_t"普通攻击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "修罗道基础招式",
StrUseDesc=_t "修罗道基础招式",
}

skill_desc_str[4736]=
{
strName=_t"集气拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "人间道修业积累到10点自动学会",
StrUseDesc=_t "人间道修业积累到10点自动学会",
StrFuncdesc=_t"收纳天地元气对单体目标造成大量伤害",
}

skill_desc_str[4737]=
{
strName=_t"斗神拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "流血状态持续10秒，每秒造成4500点伤害\r人间道修业积累到20点自动学会",
StrUseDesc=_t "流血状态持续10秒，每秒造成4500点伤害\r人间道修业积累到20点自动学会",
StrFuncdesc=_t"人间道终极招式，可与神对抗的拳法，对单体目标造成\r大量伤害，并使目标进入流血状态",
}

skill_desc_str[4738]=
{
strName=_t"普通攻击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "人间道基础招式",
StrUseDesc=_t "人间道基础招式",
}

skill_desc_str[4739]=
{
strName=_t"流血切割",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "流血状态持续10秒，每秒造成2200点伤害\r畜生道修业积累到10点自动学会",
StrUseDesc=_t "流血状态持续10秒，每秒造成2200点伤害\r畜生道修业积累到10点自动学会",
StrFuncdesc=_t"利用锋利的钳刃划破目标的身体，对单个目标造成伤害，并使其进入流血状态",
}

skill_desc_str[4740]=
{
strName=_t"致命一击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "畜生道修业积累到20点自动学会",
StrUseDesc=_t "畜生道修业积累到20点自动学会",
StrFuncdesc=_t"畜生道终极招式，集全身之力对单个目标造成大量伤害",
}

skill_desc_str[4741]=
{
strName=_t"普通攻击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "畜生道基础招式",
StrUseDesc=_t "畜生道基础招式",
}

skill_desc_str[4742]=
{
strName=_t"地狱喷泉",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "地狱道修业积累到10点自动学会",
StrUseDesc=_t "地狱道修业积累到10点自动学会",
StrFuncdesc=_t"召唤地狱的烈焰对单个目标造成伤害",
}

skill_desc_str[4743]=
{
strName=_t"猛火冲坏波",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "地狱道修业积累到20点自动学会",
StrUseDesc=_t "地狱道修业积累到20点自动学会",
StrFuncdesc=_t"地狱道终极招式，借助火焰之力对单体目标造成大量伤害",
}

skill_desc_str[4744]=
{
strName=_t"普通攻击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "地狱道基础招式",
StrUseDesc=_t "地狱道基础招式",
}

skill_desc_str[4745]=
{
strName=_t"吸血爪",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "饿鬼道修业积累到10点自动学会",
StrUseDesc=_t "饿鬼道修业积累到10点自动学会",
StrFuncdesc=_t"在攻击的时候吸取对方一定生命",
}

skill_desc_str[4746]=
{
strName=_t"瘟疫风暴",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "饿鬼道修业积累到20点自动学会",
StrUseDesc=_t "饿鬼道修业积累到20点自动学会",
StrFuncdesc=_t"饿鬼道终极招式，以自己为中心撒播致命的病毒造成大量伤害",
}

skill_desc_str[4747]=
{
strName=_t"普通攻击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "饿鬼道基础招式",
StrUseDesc=_t "饿鬼道基础招式",
}

skill_desc_str[4498]=
{
strName=_t"旋风",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"对自身周围5米的敌方目标造成一次伤害，对水晶附加大量伤害",
}

skill_desc_str[4499]=
{
strName=_t"箭雨",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"对目标区域的敌方单位照成持续伤害，对水晶附加大量伤害",
}

skill_desc_str[4502]=
{
strName=_t"解散机甲",
}

skill_desc_str[4500]=
{
strName=_t"冲锋",
}

skill_desc_str[4501]=
{
strName=_t"重击",
}

skill_desc_str[4502]=
{
strName=_t"解散机甲",
}

skill_desc_str[4355]=
{
strName=_t"召唤",
}

skill_desc_str[4356]=
{
strName=_t"召唤",
}

skill_desc_str[4357]=
{
strName=_t"召唤",
}

skill_desc_str[4358]=
{
strName=_t"召唤",
}

skill_desc_str[4763]=
{
strName=_t"格挡",
}

skill_desc_str[4784]=
{
strName=_t"生命回复",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "可以帮助自身恢复40%%的生命值。",
StrUseDesc=_t "可以帮助自身恢复40%%的生命值。",
}

skill_desc_str[4789]=
{
strName=_t"测试情谊技能1",
}

skill_desc_str[4792]=
{
strName=_t"测试情谊技能2",
}

skill_desc_str[4822]=
{
strName=_t"雅典娜的惊叹",
}

skill_desc_str[4823]=
{
strName=_t"雅典娜的惊叹",
}

skill_desc_str[4824]=
{
strName=_t"飞龙破击",
}

skill_desc_str[4825]=
{
strName=_t"飞龙破击",
}

skill_desc_str[3672]=
{
strName=_t"流星突突拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "基础伤害技能",
StrUseDesc=_t "基础伤害技能",
}

skill_desc_str[3673]=
{
strName=_t"天马流星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "攻击目标及前方扇形范围内的敌人",
StrUseDesc=_t "攻击目标及前方扇形范围内的敌人",
}

skill_desc_str[3674]=
{
strName=_t"天马彗星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "攻击目标为中心圆形范围内的敌人",
StrUseDesc=_t "攻击目标为中心圆形范围内的敌人",
}

skill_desc_str[3675]=
{
strName=_t"回旋碎击拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "攻击目标为中心圆形范围内的敌人，击倒目标3秒",
StrUseDesc=_t "攻击目标为中心圆形范围内的敌人，击倒目标3秒",
}

skill_desc_str[3676]=
{
strName=_t"龙之拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "基础伤害技能",
StrUseDesc=_t "基础伤害技能",
}

skill_desc_str[3677]=
{
strName=_t"庐山升龙霸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "攻击目标为中心圆形范围内的敌人，30%%几率浮空目标3秒",
StrUseDesc=_t "攻击目标为中心圆形范围内的敌人，30%%几率浮空目标3秒",
}

skill_desc_str[3678]=
{
strName=_t"庐山龙飞翔",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "攻击目标及前方线形范围内的敌人，20%%几率击倒目标2秒",
StrUseDesc=_t "攻击目标及前方线形范围内的敌人，20%%几率击倒目标2秒",
}

skill_desc_str[3679]=
{
strName=_t"庐山百龙霸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "攻击目标及前方扇形范围内的敌人",
StrUseDesc=_t "攻击目标及前方扇形范围内的敌人",
}

skill_desc_str[3680]=
{
strName=_t"钻石巨拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "基础伤害技能",
StrUseDesc=_t "基础伤害技能",
}

skill_desc_str[3681]=
{
strName=_t"钻石星辰拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "攻击目标及前方扇形范围内的敌人，目标减速3秒",
StrUseDesc=_t "攻击目标及前方扇形范围内的敌人，目标减速3秒",
}

skill_desc_str[3682]=
{
strName=_t"龙卷风舞",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "攻击目标为中心圆形范围内的敌人，30%%几率浮空目标2秒",
StrUseDesc=_t "攻击目标为中心圆形范围内的敌人，30%%几率浮空目标2秒",
}

skill_desc_str[3683]=
{
strName=_t"曙光女神的宽恕",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "攻击目标及前方线形范围内的敌人，40%%几率冰冻目标3秒",
StrUseDesc=_t "攻击目标及前方线形范围内的敌人，40%%几率冰冻目标3秒",
}

skill_desc_str[3684]=
{
strName=_t"凌虐之焰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "基础伤害技能",
StrUseDesc=_t "基础伤害技能",
}

skill_desc_str[3685]=
{
strName=_t"凤翼天翔",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "攻击目标及前方线形范围内的敌人，并造成5秒灼烧伤害",
StrUseDesc=_t "攻击目标及前方线形范围内的敌人，并造成5秒灼烧伤害",
}

skill_desc_str[3686]=
{
strName=_t"凤凰幻魔拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "攻击目标及前方线形范围内的敌人",
StrUseDesc=_t "攻击目标及前方线形范围内的敌人",
}

skill_desc_str[3687]=
{
strName=_t"浴火奋战",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "增加自身伤害，持续20秒，最高可叠加5层",
StrUseDesc=_t "增加自身伤害，持续20秒，最高可叠加5层",
}

skill_desc_str[3688]=
{
strName=_t"次元角锁",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "基础伤害技能",
StrUseDesc=_t "基础伤害技能",
}

skill_desc_str[3689]=
{
strName=_t"恢复之光",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "恢复自身及队友一定量生命值",
StrUseDesc=_t "恢复自身及队友一定量生命值",
}

skill_desc_str[3690]=
{
strName=_t"锁链迷宫",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "自身为圆心的大范围群攻",
StrUseDesc=_t "自身为圆心的大范围群攻",
}

skill_desc_str[3691]=
{
strName=_t"星云风暴",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "攻击目标及前方扇形范围内的敌人，30%%几率击退目标",
StrUseDesc=_t "攻击目标及前方扇形范围内的敌人，30%%几率击退目标",
}

skill_desc_str[4849]=
{
strName=_t"星辰傀儡线",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r被击中的目标减速4米/秒，持续6秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r被击中的目标减速4米/秒，持续6秒",
StrDescNum="(1.68*t2*t2+562*t2+47433);1.1*(0.007*t2+1.778)*100",
StrFuncdesc=_t"对目标周围6米范围内的敌人造成伤害\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[4850]=
{
strName=_t"巨翼翔风",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "持续造成伤害\r附加攻击力:%d\r每次造成%d%%伤害\r在范围内的敌人每多受到一次伤害，伤害增加3%%，最多叠加10层",
StrUseDesc=_t "持续造成伤害\r附加攻击力:%d\r每次造成%d%%伤害\r在范围内的敌人每多受到一次伤害，伤害增加3%%，最多叠加10层",
StrDescNum="(1.68*t2*t2+562*t2+47433);4*(0.007*t2+1.778)/3*100/10",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对自己周围15米的敌人造成大量伤害\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[4437]=
{
strName=_t"黎明审判",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "远距离攻击选中的3米半径区域，造成伤害\r附加攻击力:%d\r附加水属性攻击力:%d\r造成%d%%的伤害\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "远距离攻击选中的3米半径区域，造成伤害\r附加攻击力:%d\r附加水属性攻击力:%d\r造成%d%%的伤害\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="0.06*player.level*player.level+12.83*player.level+67.25;0.07*player.level*player.level+14.35*player.level+64;100*(0.0124*player.level+2.74);player.prof==3 and ''or '^ff0000'",
}

skill_desc_str[4861]=
{
strName=_t"取消变身",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "取消变身",
StrUseDesc=_t "取消变身",
}

skill_desc_str[4860]=
{
strName=_t"跳舞",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "使用后开始跳舞",
StrUseDesc=_t "使用后开始跳舞",
}

skill_desc_str[4862]=
{
strName=_t"星辰傀儡线",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "造成%d%%伤害\r目标减速4米/秒，持续6秒",
StrUseDesc=_t "造成%d%%伤害\r目标减速4米/秒，持续6秒",
StrDescNum="4*1.5*1.8*100",
StrFuncdesc=_t"对目标造成大量伤害",
}

skill_desc_str[4863]=
{
strName=_t"巨翼翔风",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "持续造成伤害\r每秒造成%d%%伤害\r在范围内的敌人每多受到一次伤害，伤害增加8%%，最多叠加10层\r释放技能时免疫控制，且受到的伤害减少50%%",
StrUseDesc=_t "持续造成伤害\r每秒造成%d%%伤害\r在范围内的敌人每多受到一次伤害，伤害增加8%%，最多叠加10层\r释放技能时免疫控制，且受到的伤害减少50%%",
StrDescNum="140",
StrFuncdesc=_t"对自己周围15米的敌人造成大量伤害\r",
}

skill_desc_str[4694]=
{
strName=_t"星云锁链",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "普通的进攻，可以积攒小宇宙能量",
StrUseDesc=_t "普通的进攻，可以积攒小宇宙能量",
}

skill_desc_str[4695]=
{
strName=_t"滚动防御",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "侧重防守的招式，不断旋转的防御阵在获得小宇宙爆发的时候可以生成高防护的能量罩，可以不断积攒小宇宙能量\r注意：只有使用此技能爆发小宇宙的时候才能召唤出防护罩。",
StrUseDesc=_t "侧重防守的招式，不断旋转的防御阵在获得小宇宙爆发的时候可以生成高防护的能量罩，可以不断积攒小宇宙能量\r注意：只有使用此技能爆发小宇宙的时候才能召唤出防护罩。",
}

skill_desc_str[4696]=
{
strName=_t"星云风暴",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "强力的攻击，消耗小宇宙能量",
StrUseDesc=_t "强力的攻击，消耗小宇宙能量",
}

skill_desc_str[4697]=
{
strName=_t"女神赐福",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "恢复生命和体力，战斗中不可以使用",
StrUseDesc=_t "恢复生命和体力，战斗中不可以使用",
}

skill_desc_str[4924]=
{
strName=_t"盖亚颂歌",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "增加{^FFABFC%d^FFFF00}点地属性抗性\r增加{^FFABFC%d^FFFF00}点战力",
StrUseDesc=_t "增加%d点地属性抗性\r增加%d点战力",
StrDescNum="level;50*level",
}

skill_desc_str[4925]=
{
strName=_t"冰河时代",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "增加{^FFABFC%d^FFFF00}点水属性抗性\r增加{^FFABFC%d^FFFF00}点战力",
StrUseDesc=_t "增加%d点水属性抗性\r增加%d点战力",
StrDescNum="level;50*level",
}

skill_desc_str[4926]=
{
strName=_t"冥太阳风",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "增加{^FFABFC%d^FFFF00}点火属性抗性\r增加{^FFABFC%d^FFFF00}点战力",
StrUseDesc=_t "增加%d点火属性抗性\r增加%d点战力",
StrDescNum="level;50*level",
}

skill_desc_str[4927]=
{
strName=_t"真空领域",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "增加{^FFABFC%d^FFFF00}点风属性抗性\r增加{^FFABFC%d^FFFF00}点战力",
StrUseDesc=_t "增加%d点风属性抗性\r增加%d点战力",
StrDescNum="level;50*level",
}

skill_desc_str[4928]=
{
strName=_t"黑暗力场",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "增加{^FFABFC%d^FFFF00}点雷属性抗性\r增加{^FFABFC%d^FFFF00}点战力",
StrUseDesc=_t "增加%d点雷属性抗性\r增加%d点战力",
StrDescNum="level;50*level",
}

skill_desc_str[5033]=
{
strName=_t"闪光碧波拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "凝聚深海碧波的奋力一击",
StrUseDesc=_t "凝聚深海碧波的奋力一击",
}

skill_desc_str[5034]=
{
strName=_t"雷电激光束",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "电闪雷鸣，强烈的闪电光束",
StrUseDesc=_t "电闪雷鸣，强烈的闪电光束",
}

skill_desc_str[5035]=
{
strName=_t"疾驰海龙戟",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "海龙戟被闪电所环绕，释放的瞬间足以破坏山河",
StrUseDesc=_t "海龙戟被闪电所环绕，释放的瞬间足以破坏山河",
}

skill_desc_str[5036]=
{
strName=_t"取消变身",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "取消变身",
StrUseDesc=_t "取消变身",
}

skill_desc_str[5092]=
{
strName=_t"减百分之四十五血",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "减目标百分之四十五的血",
StrUseDesc=_t "减目标百分之四十五的血",
}

skill_desc_str[4636]=
{
strName=_t"南瓜炸弹",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "普通的南瓜炸弹，每使用一次获得一个万圣节之怒",
StrUseDesc=_t "普通的南瓜炸弹，每使用一次获得一个万圣节之怒",
}

skill_desc_str[4637]=
{
strName=_t"南瓜炸弹",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "普通的南瓜炸弹",
StrUseDesc=_t "普通的南瓜炸弹",
}

skill_desc_str[4638]=
{
strName=_t"大号南瓜炸弹",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "大号的南瓜炸弹，威力大，范围广",
StrUseDesc=_t "大号的南瓜炸弹，威力大，范围广",
}

skill_desc_str[4639]=
{
strName=_t"超级南瓜炸弹",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "一个惊天地泣鬼神的南瓜炸弹",
StrUseDesc=_t "一个惊天地泣鬼神的南瓜炸弹",
}

skill_desc_str[4640]=
{
strName=_t"十连发",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "可以连续快速的释放普通南瓜炸弹，但只能放10次",
StrUseDesc=_t "可以连续快速的释放普通南瓜炸弹，但只能放10次",
}

skill_desc_str[5148]=
{
strName=_t"燃烧小宇宙",
}

skill_desc_str[5150]=
{
strName=_t"诅咒药剂",
}

skill_desc_str[5153]=
{
strName=_t"运用神像",
}

skill_desc_str[5064]=
{
strName=_t"空突拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天马的普通攻击，可以积攒小宇宙能量。",
StrUseDesc=_t "天马的普通攻击，可以积攒小宇宙能量。",
}

skill_desc_str[5065]=
{
strName=_t"天马彗星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天马的强力攻击，可以攻击目标及周围的敌人，消耗小宇宙能量。",
StrUseDesc=_t "天马的强力攻击，可以攻击目标及周围的敌人，消耗小宇宙能量。",
}

skill_desc_str[5066]=
{
strName=_t"天马流星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天马的招牌攻击，可以攻击前方扇形的敌人，消耗小宇宙能量。",
StrUseDesc=_t "天马的招牌攻击，可以攻击前方扇形的敌人，消耗小宇宙能量。",
}

skill_desc_str[5072]=
{
strName=_t"闪电光速拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "艾欧里亚的成名绝技。",
StrUseDesc=_t "艾欧里亚的成名绝技。",
}

skill_desc_str[5073]=
{
strName=_t"狮子怒吼拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "艾欧里亚的另一大绝技。",
StrUseDesc=_t "艾欧里亚的另一大绝技。",
}

skill_desc_str[5085]=
{
strName=_t"天马彗星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天马的强力攻击。",
StrUseDesc=_t "天马的强力攻击。",
}

skill_desc_str[5086]=
{
strName=_t"天马流星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天马的招牌攻击。",
StrUseDesc=_t "天马的招牌攻击。",
}

skill_desc_str[5215]=
{
strName=_t"面目全非脚",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "极其无耻的招式，可以把目标打的他妈都不认识他",
StrUseDesc=_t "极其无耻的招式，可以把目标打的他妈都不认识他",
}

skill_desc_str[5216]=
{
strName=_t"还我漂漂拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "无论对方被打成什么样子，都能用这一招来还原",
StrUseDesc=_t "无论对方被打成什么样子，都能用这一招来还原",
}

skill_desc_str[4040]=
{
strName=_t"天马回旋碎击拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天马座的必杀技之一",
StrUseDesc=_t "天马座的必杀技之一",
}

skill_desc_str[4871]=
{
strName=_t"超·天马流星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天马座的超级绝技！",
StrUseDesc=_t "天马座的超级绝技！",
}

skill_desc_str[4879]=
{
strName=_t"星云锁链",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "仙女座的基础招式",
StrUseDesc=_t "仙女座的基础招式",
}

skill_desc_str[4880]=
{
strName=_t"滚动防御",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "将锁链布成圆阵，对进入圆阵的敌人造成伤害，并提升自身防御和回复生命",
StrUseDesc=_t "将锁链布成圆阵，对进入圆阵的敌人造成伤害，并提升自身防御和回复生命",
}

skill_desc_str[4881]=
{
strName=_t"星云风暴",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "仙女座的绝招！",
StrUseDesc=_t "仙女座的绝招！",
}

skill_desc_str[4896]=
{
strName=_t"凌虐之焰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "凤凰座的基础招式",
StrUseDesc=_t "凤凰座的基础招式",
}

skill_desc_str[4897]=
{
strName=_t"凤翼天翔",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "凤凰座的绝招！",
StrUseDesc=_t "凤凰座的绝招！",
}

skill_desc_str[4898]=
{
strName=_t"凤凰闪烁",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "向前快速飞翔一段距离",
StrUseDesc=_t "向前快速飞翔一段距离",
}

skill_desc_str[4899]=
{
strName=_t"凤凰幻魔拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "将敌人困在凤凰幻境中，无法动弹并不断失去生命",
StrUseDesc=_t "将敌人困在凤凰幻境中，无法动弹并不断失去生命",
}

skill_desc_str[4900]=
{
strName=_t"凤凰涅槃",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "对自身施放，凤凰圣衣会在15层涅槃后重生",
StrUseDesc=_t "对自身施放，凤凰圣衣会在15层涅槃后重生",
}

skill_desc_str[5167]=
{
strName=_t"龙之拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天龙座的基础招式",
StrUseDesc=_t "天龙座的基础招式",
}

skill_desc_str[5168]=
{
strName=_t"庐山龙飞翔",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "冲向目标，并把半径15米内的敌人聚拢过来。",
StrUseDesc=_t "冲向目标，并把半径15米内的敌人聚拢过来。",
}

skill_desc_str[5169]=
{
strName=_t"庐山升龙霸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天龙座的绝招！",
StrUseDesc=_t "天龙座的绝招！",
}

skill_desc_str[5180]=
{
strName=_t"钻石巨拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "白鸟座的基础招式",
StrUseDesc=_t "白鸟座的基础招式",
}

skill_desc_str[5181]=
{
strName=_t"钻石星尘拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "白鸟座的绝招！",
StrUseDesc=_t "白鸟座的绝招！",
}

skill_desc_str[5187]=
{
strName=_t"钻石巨拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "白鸟座的基础招式",
StrUseDesc=_t "白鸟座的基础招式",
}

skill_desc_str[5188]=
{
strName=_t"极寒龙卷风",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "来自东西伯利亚的冻气，能够大幅降低敌人的速度",
StrUseDesc=_t "来自东西伯利亚的冻气，能够大幅降低敌人的速度",
}

skill_desc_str[5189]=
{
strName=_t"钻石星尘拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "白鸟座的绝招！",
StrUseDesc=_t "白鸟座的绝招！",
}

skill_desc_str[4776]=
{
strName=_t"降临！奥路菲竖琴",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "\t^c0c0ff[琴之祝福]^FFFF00\r奥路菲竖琴降临使主人伤害提升60%%，持续10秒\r^c0c0ff[琴之守护]^FFFF00\r奥路菲竖琴降临产生一个6米半径的区域，区域内主人和队友受到伤害降低80%%，区域持续时间10秒\t神器效果触发概率与神力值有关\t取下神器时状态会消失",
StrUseDesc=_t "\t^c0c0ff[琴之祝福]^FFFF00\r奥路菲竖琴降临使主人伤害提升60%%，持续10秒\r^c0c0ff[琴之守护]^FFFF00\r奥路菲竖琴降临产生一个6米半径的区域，区域内主人和队友受到伤害降低80%%，区域持续时间10秒\t神器效果触发概率与神力值有关\t取下神器时状态会消失",
StrFuncdesc=_t"使用后获得奥路菲竖琴之祝福状态，处于此状态下战斗中有概率触发^c0c0ff[琴之祝福]^A2FFFF或^c0c0ff[琴之守护]^A2FFFF效果",
}

skill_desc_str[4777]=
{
strName=_t"降临！美杜莎之盾",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "\t^c0c0ff[盾之祝福]^FFFF00\r美杜莎之盾降临使主人攻击无视目标防御，持续10秒\r^c0c0ff[盾之守护]^FFFF00\r美杜莎之盾降临使攻击主人的目标被石化，同时受到伤害减少80%%，被攻击5次后状态消失状态最长持续时间10秒，触发时附带解除控制效果（被守护星等攻击也会消耗次数）\t神器效果触发概率与神力值有关\t取下神器时状态会消失",
StrUseDesc=_t "\t^c0c0ff[盾之祝福]^FFFF00\r美杜莎之盾降临使主人攻击无视目标防御，持续10秒\r^c0c0ff[盾之守护]^FFFF00\r美杜莎之盾降临使攻击主人的目标被石化，同时受到伤害减少80%%，被攻击5次后状态消失状态最长持续时间10秒，触发时附带解除控制效果（被守护星等攻击也会消耗次数）\t神器效果触发概率与神力值有关\t取下神器时状态会消失",
StrFuncdesc=_t"使用后获得美杜沙之盾之祝福状态，处于此状态下战斗中有概率触发^c0c0ff[盾之祝福]^A2FFFF或^c0c0ff[盾之守护]^A2FFFF效果",
}

skill_desc_str[5232]=
{
strName=_t"空突拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天马的普通攻击，可以积攒小宇宙能量。",
StrUseDesc=_t "天马的普通攻击，可以积攒小宇宙能量。",
}

skill_desc_str[5233]=
{
strName=_t"天马彗星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天马的强力攻击，可以攻击目标及周围的敌人，消耗小宇宙能量。",
StrUseDesc=_t "天马的强力攻击，可以攻击目标及周围的敌人，消耗小宇宙能量。",
}

skill_desc_str[5234]=
{
strName=_t"天马流星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天马的招牌攻击，可以攻击前方扇形的敌人，消耗小宇宙能量。",
StrUseDesc=_t "天马的招牌攻击，可以攻击前方扇形的敌人，消耗小宇宙能量。",
}

skill_desc_str[5235]=
{
strName=_t"钻石巨拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "冰河的普通攻击，可以积攒小宇宙能量。",
StrUseDesc=_t "冰河的普通攻击，可以积攒小宇宙能量。",
}

skill_desc_str[5236]=
{
strName=_t"冰冻光环",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "冰河的强力减速攻击，但是冷却时间较长，可以积攒小宇宙能量。",
StrUseDesc=_t "冰河的强力减速攻击，但是冷却时间较长，可以积攒小宇宙能量。",
}

skill_desc_str[5237]=
{
strName=_t"钻石星辰拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "冰河的招牌技能，耗费小宇宙能量。",
StrUseDesc=_t "冰河的招牌技能，耗费小宇宙能量。",
}

skill_desc_str[5549]=
{
strName=_t"绝对零度",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "冰河的防御技能，可以驱散剧毒，同时也会对自身造成一定损伤。",
StrUseDesc=_t "冰河的防御技能，可以驱散剧毒，同时也会对自身造成一定损伤。",
}

skill_desc_str[5546]=
{
strName=_t"感恩",
}

skill_desc_str[5576]=
{
strName=_t"降临！奥路菲竖琴",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "\t^c0c0ff[琴之祝福]^FFFF00\r奥路菲竖琴降临使主人伤害提升60%%，持续10秒\r^c0c0ff[琴之守护]^FFFF00\r奥路菲竖琴降临产生一个6米半径的区域，区域内主人和队友受到伤害降低80%%\t神器效果触发概率与神力值有关",
StrUseDesc=_t "\t^c0c0ff[琴之祝福]^FFFF00\r奥路菲竖琴降临使主人伤害提升60%%，持续10秒\r^c0c0ff[琴之守护]^FFFF00\r奥路菲竖琴降临产生一个6米半径的区域，区域内主人和队友受到伤害降低80%%\t神器效果触发概率与神力值有关",
StrFuncdesc=_t"使用后获得奥路菲竖琴之祝福，战斗中有概率触发^c0c0ff[琴之祝福]^A2FFFF或^c0c0ff[琴之守护]^A2FFFF效果",
}

skill_desc_str[5577]=
{
strName=_t"降临！美杜莎之盾",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "\t^c0c0ff[盾之祝福]^FFFF00\r美杜莎之盾降临使主人攻击无视目标防御，持续10秒\r^c0c0ff[盾之守护]^FFFF00\r美杜莎之盾降临使攻击主人的目标被石化，同时受到伤害减少80%%，被攻击5次后状态消失，触发时附带解除控制效果（被守护星等攻击也会消耗次数）\t神器效果触发概率与神力值有关",
StrUseDesc=_t "\t^c0c0ff[盾之祝福]^FFFF00\r美杜莎之盾降临使主人攻击无视目标防御，持续10秒\r^c0c0ff[盾之守护]^FFFF00\r美杜莎之盾降临使攻击主人的目标被石化，同时受到伤害减少80%%，被攻击5次后状态消失，触发时附带解除控制效果（被守护星等攻击也会消耗次数）\t神器效果触发概率与神力值有关",
StrFuncdesc=_t"使用后获得美杜沙之盾之祝福，战斗中有概率触发^c0c0ff[盾之祝福]^A2FFFF或^c0c0ff[盾之守护]^A2FFFF效果",
}

skill_desc_str[5598]=
{
strName=_t"天蝎尾刺",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "强力的一击，能够立刻使人致命。",
StrUseDesc=_t "强力的一击，能够立刻使人致命。",
}

skill_desc_str[5599]=
{
strName=_t"暗黑警告冲击波",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r定身时间:5秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r定身时间:5秒",
StrDescNum="(1.68*t2*t2+562*t2+47433);1*(0.007*t2+1.778)*100",
StrFuncdesc=_t"召唤暗黑之龙对前方15米范围内直线上的敌人\r造成大量伤害，并使其无法移动\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[5600]=
{
strName=_t"最大警告",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r浮空时间:3秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r浮空时间:3秒",
StrDescNum="(1.68*t2*t2+562*t2+47433);1*(0.007*t2+1.778)/3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r攻击前方120度扇形范围内的敌人，攻击距离为10米\r同时可将范围内的敌人击飞到空中\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[5601]=
{
strName=_t"天鹫喷射风",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r击退:7米\r浮空时间:3秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r击退:7米\r浮空时间:3秒",
StrDescNum="(1.68*t2*t2+562*t2+47433);1*(0.007*t2+1.778)*100",
StrFuncdesc=_t"攻击前方120度扇形范围内的敌人，攻击距离为10米\r同时巨大的风压可将范围内的敌人击退并浮空\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[5602]=
{
strName=_t"宇宙大幻觉",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r至少造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r至少造成%d%%伤害",
StrDescNum="(1.68*t2*t2+562*t2+47433);1*(0.007*t2+1.778)/3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对自己周围7米范围内的敌人造成伤害\r越靠近自己造成的伤害越高\r释放过程中会不断的将敌人向中心吸附同时使其减速\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[5603]=
{
strName=_t"生存之欲望",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-2.86*t2*t2+836*t2+42191);1.3*(0.008*t2+1.736)*100",
StrFuncdesc=_t"对选定区域6米范围内的敌人造成大量伤害\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[5604]=
{
strName=_t"湮灭之爪",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r倒地时间:4秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r倒地时间:4秒",
StrDescNum="(-2.86*t2*t2+836*t2+42191);1.2*(0.008*t2+1.736)/3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对单体目标造成伤害，同时将目标击倒\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[5605]=
{
strName=_t"回旋船桨",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "\t^00FF00弱化^FFFF00\r伤害倍率降低30%%\r最多可叠3层\r反击的弱化效果最少每2秒触发一次",
StrUseDesc=_t "\t^00FF00弱化^FFFF00\r伤害倍率降低30%%\r最多可叠3层\r反击的弱化效果最少每2秒触发一次",
StrFuncdesc=_t"使自己获得船桨护盾状态，此状态下攻击自己的敌人将被弱化\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[5606]=
{
strName=_t"旋转水流粉碎",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r浮空时间:3秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r浮空时间:3秒",
StrDescNum="(-2.86*t2*t2+836*t2+42191);1*(0.008*t2+1.736)/3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对前方15米范围内直线上的敌人造成大量伤害\r同时将范围内的敌人击飞到空中\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[5607]=
{
strName=_t"血花刀剪",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\t^00FF00流血^FFFF00\r每秒造成伤害:%d",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\t^00FF00流血^FFFF00\r每秒造成伤害:%d",
StrDescNum="(-2.86*t2*t2+836*t2+42191);1*(0.008*t2+1.736)*100;(t5+(1.68*t2*t2+562*t2+47433)+t6+t7+t8)*(0.007*t2+1.778)/4*0.167",
StrFuncdesc=_t"攻击前方120度扇形范围内的敌人，攻击距离为6米\r同时对敌人造成流血效果\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[5608]=
{
strName=_t"血花献祭",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-2.86*t2*t2+836*t2+42191);1.1*(0.008*t2+1.736)/3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对自己周围6米范围内的敌人造成伤害\r并附带短距离击退效果\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[5609]=
{
strName=_t"毁灭之翼风",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r沉默时间:3秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r沉默时间:3秒",
StrDescNum="(-2.86*t2*t2+836*t2+42191);1*(0.008*t2+1.736)*100",
StrFuncdesc=_t"对自己周围6米范围内的敌人造成伤害，并使其沉默\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[5610]=
{
strName=_t"火焰之刃",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-2.86*t2*t2+836*t2+42191);1.4*(0.008*t2+1.736)/3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对前方10米范围内直线上的敌人造成大量伤害\r对目标造成1米的震退的效果\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[5611]=
{
strName=_t"火焰紧绕",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "\t^00FF00火焰紧绕^FFFF00\r下次被攻击时，攻击者会受到伤害\r伤害附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "\t^00FF00火焰紧绕^FFFF00\r下次被攻击时，攻击者会受到伤害\r伤害附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-2.86*t2*t2+836*t2+42191);1*(0.008*t2+1.736)*100",
StrFuncdesc=_t"使自己周围10米范围内的队友获得火焰紧绕状态\r此状态下队友在下一次被攻击时产生反击效果\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[5612]=
{
strName=_t"轮回转生",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "冥界士兵会攻击其附近的敌人\r每个士兵攻击两次后将会消失\r攻击附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "冥界士兵会攻击其附近的敌人\r每个士兵攻击两次后将会消失\r攻击附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-2.86*t2*t2+836*t2+42191);0.167*(0.008*t2+1.736)/3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r召唤4个冥界士兵，冥界士兵会主动攻击其5米范围内的敌人\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[5613]=
{
strName=_t"死亡交响曲",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r瘫痪时间:4秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r瘫痪时间:4秒",
StrDescNum="(1.68*t2*t2+562*t2+47433);1*(0.007*t2+1.778)*100",
StrFuncdesc=_t"利用笛声对目标周围6米范围内的敌人造成伤害\r同时使敌人进入瘫痪状态\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[5614]=
{
strName=_t"死亡之潮",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "至少造成%d伤害",
StrUseDesc=_t "至少造成%d伤害",
StrDescNum="(t5+(1.68*t2*t2+562*t2+47433)+t6+t7+t8)*(0.007*t2+1.778)/3/4",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对单体目标造成无视防御的伤害\r目标血量越少，造成伤害越高\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[5618]=
{
strName=_t"雪玫瑰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[5674]=
{
strName=_t"翼之双苍星",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00可使自身每2秒回复10点体力\r^c0c0ff[%s]^FFFF00可使自身每2秒回复生命上限的1%%\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00可使自身每2秒回复10点体力\r^c0c0ff[%s]^FFFF00可使自身每2秒回复生命上限的1%%\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="skill_desc_str[30].strName;skill_desc_str[64].strName;player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天哭星冥衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[5675]=
{
strName=_t"死兆星",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "在风暴流星状态下施放^c0c0ff[%s]^FFFF00将附带1颗灭绝殒石击向目标\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "在风暴流星状态下施放^c0c0ff[%s]^FFFF00将附带1颗灭绝殒石击向目标\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="skill_desc_str[60].strName;player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天哭星冥衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[5676]=
{
strName=_t"银河杀阵",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "每次击杀一名玩家后，^c0c0ff[%s]^FFFF00的冷却时间将会重置，抱摔期间,免疫控制\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrUseDesc=_t "每次击杀一名玩家后，^c0c0ff[%s]^FFFF00的冷却时间将会重置，抱摔期间,免疫控制\r斗魂专属守护星座：^00FF00%s天马^FFFF00",
StrDescNum="skill_desc_str[20].strName;player.prof==2 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天哭星冥衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[5677]=
{
strName=_t"黄金冻结",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00会给当前主目标附加冻结之伤状态\t^00FF00冻结之伤^FFFF00\r下5次受到的攻击伤害提升30%%\r最多持续6秒\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00会给当前主目标附加冻结之伤状态\t^00FF00冻结之伤^FFFF00\r下5次受到的攻击伤害提升30%%\r最多持续6秒\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="skill_desc_str[67].strName;player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天英星冥衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[5678]=
{
strName=_t"极光喷发",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "自身生命降于40%%以下时，每30秒会自动重置一次^c0c0ff[%s]^FFFF00和^c0c0ff[%s]^FFFF00的冷却时间\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "自身生命降于40%%以下时，每30秒会自动重置一次^c0c0ff[%s]^FFFF00和^c0c0ff[%s]^FFFF00的冷却时间\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="skill_desc_str[99].strName;skill_desc_str[224].strName;player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天英星冥衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[5679]=
{
strName=_t"寒武纪大灭绝",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "被^c0c0ff[%s]^FFFF00冰冻的敌人，将无法被技能回复生命\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrUseDesc=_t "被^c0c0ff[%s]^FFFF00冰冻的敌人，将无法被技能回复生命\r斗魂专属守护星座：^00FF00%s白鸟^FFFF00",
StrDescNum="skill_desc_str[218].strName;player.prof==3 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天英星冥衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[5680]=
{
strName=_t"达摩克利斯",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "当目标生命低于50%%时，目标生命越低^c0c0ff[%s]^FFFF00造成的倒地时间越长\r最多可增加3秒\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "当目标生命低于50%%时，目标生命越低^c0c0ff[%s]^FFFF00造成的倒地时间越长\r最多可增加3秒\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="skill_desc_str[92].strName;player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天间星冥衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[5681]=
{
strName=_t"龙祖的血脉",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00可使范围内的自己和队友所有异常抗性增加20点\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00可使范围内的自己和队友所有异常抗性增加20点\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="skill_desc_str[113].strName;player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天间星冥衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[5682]=
{
strName=_t"霸王浮屠",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "燃魂状态下，被^c0c0ff[%s]^FFFF00和^c0c0ff[%s]^FFFF00控制的目标将无法被技能回复生命\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrUseDesc=_t "燃魂状态下，被^c0c0ff[%s]^FFFF00和^c0c0ff[%s]^FFFF00控制的目标将无法被技能回复生命\r斗魂专属守护星座：^00FF00%s天龙^FFFF00",
StrDescNum="skill_desc_str[92].strName;skill_desc_str[93].strName;player.prof==4 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天间星冥衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[5683]=
{
strName=_t"莲华逆转",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00释放期间，主目标生命低于50%%时，伤害抗性提升30%%\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00释放期间，主目标生命低于50%%时，伤害抗性提升30%%\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="skill_desc_str[513].strName;player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天魔星冥衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[5684]=
{
strName=_t"混沌次元风",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "神威能量大于80%%时，^c0c0ff[%s]^FFFF00可立即造成主目标浮空\r该效果仅在动作切换为锁链攻击时生效\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "神威能量大于80%%时，^c0c0ff[%s]^FFFF00可立即造成主目标浮空\r该效果仅在动作切换为锁链攻击时生效\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="skill_desc_str[526].strName;player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天魔星冥衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[5685]=
{
strName=_t"诸神之黄昏",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00和^c0c0ff[%s]^FFFF00每次攻击增加的神威领域值提升80%%\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00和^c0c0ff[%s]^FFFF00每次攻击增加的神威领域值提升80%%\r斗魂专属守护星座：^00FF00%s仙女^FFFF00",
StrDescNum="skill_desc_str[523].strName;skill_desc_str[524].strName;player.prof==5 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天魔星冥衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[5686]=
{
strName=_t"忉利焰天",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00可使自身进入怒焰状态\t^00FF00怒焰^FFFF00\r^c0c0ff[%s]^FFFF00伤害提升150%%，冷却时间减少3秒\r持续20秒\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00可使自身进入怒焰状态\t^00FF00怒焰^FFFF00\r^c0c0ff[%s]^FFFF00伤害提升150%%，冷却时间减少3秒\r持续20秒\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="skill_desc_str[1528].strName;skill_desc_str[1523].strName;player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天捷星冥衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[5687]=
{
strName=_t"黑洞效应",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00的冷却时间变为30秒，同时可以给范围内的目标附加黑洞之力状态\t^00FF00黑洞之力^FFFF00\r拥有该状态的敌人将相互受到吸附作用的影响\r持续6秒\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00的冷却时间变为30秒，同时可以给范围内的目标附加黑洞之力状态\t^00FF00黑洞之力^FFFF00\r拥有该状态的敌人将相互受到吸附作用的影响\r持续6秒\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="skill_desc_str[1523].strName;player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天捷星冥衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[5688]=
{
strName=_t"地狱火凤凰",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "^c0c0ff[%s]^FFFF00可使生命低于50%%的队友及自身瞬间回复生命上限5%%的血量,并且每秒回复生命上限的1%%\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrUseDesc=_t "^c0c0ff[%s]^FFFF00可使生命低于50%%的队友及自身瞬间回复生命上限5%%的血量,并且每秒回复生命上限的1%%\r斗魂专属守护星座：^00FF00%s凤凰^FFFF00",
StrDescNum="skill_desc_str[1528].strName;player.prof==6 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天捷星冥衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[5703]=
{
strName=_t"加速",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"可以暂时提高移动速度",
}

skill_desc_str[5704]=
{
strName=_t"星辰凝聚",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"暂时获得艾欧罗斯的力量，将小宇宙能量牵引至身旁\r需要积攒10层射手小宇宙能量才能使用",
}

skill_desc_str[5129]=
{
strName=_t"天马流星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"星矢的绝技，强力的攻击.",
}

skill_desc_str[5130]=
{
strName=_t"天马彗星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"星矢的另一绝技，汇聚所有流星拳的力量.",
}

skill_desc_str[5776]=
{
strName=_t"天马流星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"扇形攻击，伤害一般.",
}

skill_desc_str[5777]=
{
strName=_t"天马彗星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"圆形攻击，伤害较大.",
}

skill_desc_str[5778]=
{
strName=_t"钻石星尘拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"冰冻扇形攻击，伤害一般.",
}

skill_desc_str[5779]=
{
strName=_t"极寒龙卷风",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"冰冻圆形攻击，伤害较大.",
}

skill_desc_str[5780]=
{
strName=_t"庐山升龙霸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"圆形攻击，伤害一般.有几率将敌人眩晕.",
}

skill_desc_str[5781]=
{
strName=_t"庐山百龙霸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"扇形攻击，伤害较大.",
}

skill_desc_str[5782]=
{
strName=_t"星云风暴",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"扇形攻击，伤害一般.",
}

skill_desc_str[5783]=
{
strName=_t"滚动防御",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"圆形持续攻击，伤害较大.",
}

skill_desc_str[5784]=
{
strName=_t"凤翼天翔",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"灼烧扇形攻击，伤害一般.",
}

skill_desc_str[5785]=
{
strName=_t"凤凰幻魔拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"灼烧扇形攻击，伤害较大.有几率将敌人眩晕.",
}

skill_desc_str[5795]=
{
strName=_t"雪花",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"收集怪物掉落的光球后激活，对雪精灵使用，可以使雪精灵升级.",
}

skill_desc_str[5695]=
{
strName=_t"降临！沙加念珠",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "\t^c0c0ff[念珠攻击]^FFFF00\r念珠降临，对主公攻击的目标发起攻击，对目标以及周围6米半径造成大量伤害，同时封印目标3秒\r造成伤害%d%%\r^c0c0ff[念珠庇护]^FFFF00\r念珠降临使攻击主人的目标被沉默，同时受到伤害减少80%%，被攻击8次后状态消失，触发时附带解除控制效果（被守护星等攻击也会消耗次数）\t神器效果触发概率与神力值有关",
StrUseDesc=_t "\t^c0c0ff[念珠攻击]^FFFF00\r念珠降临，对主公攻击的目标发起攻击，对目标以及周围6米半径造成大量伤害，同时封印目标3秒\r造成伤害%d%%\r^c0c0ff[念珠庇护]^FFFF00\r念珠降临使攻击主人的目标被沉默，同时受到伤害减少80%%，被攻击8次后状态消失，触发时附带解除控制效果（被守护星等攻击也会消耗次数）\t神器效果触发概率与神力值有关",
StrDescNum="(1.2+(player.level-1)*0.00558)*2*100",
StrFuncdesc=_t"使用后获得念珠之祝福，战斗中有概率触发^c0c0ff[念珠攻击]^A2FFFF或^c0c0ff[念珠庇护]^A2FFFF效果",
}

skill_desc_str[5803]=
{
strName=_t"装饰",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[5227]=
{
strName=_t"天马落星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"天马座的必杀技之一",
}

skill_desc_str[5572]=
{
strName=_t"天马流星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"天马座的绝技！",
}

skill_desc_str[5573]=
{
strName=_t"天马流星光速拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"天马座的光速之拳！",
}

skill_desc_str[5880]=
{
strName=_t"暗黑警告冲击波",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "对主目标造成%d%%伤害",
StrUseDesc=_t "对主目标造成%d%%伤害",
StrDescNum="3.3*1.5*1.8*100",
StrFuncdesc=_t"召唤暗黑之龙对前方15米范围内直线上的敌人，对主目标造成大量伤害，并驱散其身上的治疗效果",
}

skill_desc_str[5881]=
{
strName=_t"最大警告",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "造成%d%%伤害\r浮空时间:5秒\r释放技能期间目标将无法移动\r自身免疫控制且受到的伤害减少50%%",
StrUseDesc=_t "造成%d%%伤害\r浮空时间:5秒\r释放技能期间目标将无法移动\r自身免疫控制且受到的伤害减少50%%",
StrDescNum="1120",
StrFuncdesc=_t"攻击前方120度扇形范围内的敌人，攻击距离为10米\r同时可将范围内的敌人击飞到空中",
}

skill_desc_str[5882]=
{
strName=_t"天鹫喷射风",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "对主目标造成%d%%伤害\r目标减速2米/秒，持续6秒",
StrUseDesc=_t "对主目标造成%d%%伤害\r目标减速2米/秒，持续6秒",
StrDescNum="3.6*1.5*1.8*100",
StrFuncdesc=_t"攻击前方120度扇形范围内的敌人，攻击距离为10米\r同时巨大的风压可将范围内的敌人减速",
}

skill_desc_str[5883]=
{
strName=_t"宇宙大幻觉",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "造成%d%%伤害\r倒地时间:5秒\r释放技能时免疫控制，且受到的伤害减少50%%",
StrUseDesc=_t "造成%d%%伤害\r倒地时间:5秒\r释放技能时免疫控制，且受到的伤害减少50%%",
StrDescNum="1050",
StrFuncdesc=_t"对自己周围10米范围内的敌人造成大量伤害\r会将敌人向中心吸附并倒地\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[5895]=
{
strName=_t"天马回旋碎击拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(10*t2*t2+1506*t2+3054);1*(0.03*t2+1.268)*0.3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r抱起目标重重的砸向地面，并将周围敌人击散.对目标及周围5米范围内敌人造成大量伤害\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[5896]=
{
strName=_t"超强寒冷龙卷风",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r浮空时间:3秒\r减速时间:5秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r浮空时间:3秒\r减速时间:5秒",
StrDescNum="(10*t2*t2+1506*t2+3054);1*(0.03*t2+1.268)*0.3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r攻击前方120度扇形范围内的敌人，攻击距离为15米\r可将目标击飞到空中，其他被波及到的敌人将被减速2米/秒\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[5897]=
{
strName=_t"庐山龙天翔",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r浮空时间:3秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r浮空时间:3秒",
StrDescNum="(10*t2*t2+1506*t2+3054);1*(0.03*t2+1.268)*0.3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r冲到目标身前将其击飞，同时可将范围内的其他敌人击退\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[5898]=
{
strName=_t"星云锁链",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r沉默时间:3秒\r定身时间:3秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r沉默时间:3秒\r定身时间:3秒",
StrDescNum="(10*t2*t2+1506*t2+3054);1*(0.03*t2+1.268)*0.3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r攻击前方120度扇形范围内的敌人，攻击距离为10米，可使主目标沉默，同时将范围内的敌人束缚\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[5899]=
{
strName=_t"凤凰幻魔拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r混乱时间:5秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r混乱时间:5秒",
StrDescNum="(10*t2*t2+1506*t2+3054);1*(0.03*t2+1.268)*0.3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r攻击目标及其周围5米范围内的敌人，主目标将进入混乱状态\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[5850]=
{
strName=_t"海之领域",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "海之领域覆盖范围6米，持续10秒\r在领域中驱除、免疫异常状态\r每1。5秒恢复一定生命",
StrUseDesc=_t "海之领域覆盖范围6米，持续10秒\r在领域中驱除、免疫异常状态\r每1。5秒恢复一定生命",
StrFuncdesc=_t"海魔女圣衣星铸到20级获得\r被攻击时一定概率召唤海之领域",
}

skill_desc_str[5927]=
{
strName=_t"圣剑",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"摩羯座修罗的得意技—圣剑连斩，威力无穷.",
}

skill_desc_str[6038]=
{
strName=_t"星光灭绝",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6039]=
{
strName=_t"星屑旋转功",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6040]=
{
strName=_t"巨型号角",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6041]=
{
strName=_t"泰坦新星",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6042]=
{
strName=_t"银河星爆",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6043]=
{
strName=_t"异次元空间",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6044]=
{
strName=_t"积尸气冥界波",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6045]=
{
strName=_t"积尸气苍鬼焰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6046]=
{
strName=_t"闪电光束拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6047]=
{
strName=_t"等离子光束拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6048]=
{
strName=_t"天魔降服",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6049]=
{
strName=_t"天舞宝轮",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6050]=
{
strName=_t"庐山升龙霸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6051]=
{
strName=_t"庐山百龙霸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6052]=
{
strName=_t"钳制念动波",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6053]=
{
strName=_t"猩红毒针",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6054]=
{
strName=_t"原子闪电光束拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6055]=
{
strName=_t"黄金箭",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6056]=
{
strName=_t"圣剑三连",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6057]=
{
strName=_t"黄金圣剑",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6058]=
{
strName=_t"原著-钻石星尘拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6059]=
{
strName=_t"曙光女神的宽恕",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6060]=
{
strName=_t"皇家恶魔玫瑰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6061]=
{
strName=_t"吸血白玫瑰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6093]=
{
strName=_t"脱下黄金圣衣",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[5976]=
{
strName=_t"星云爆裂",
StrAttacktype=_t"",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"爆裂的星云锁链，能够将目标击晕.",
}

skill_desc_str[5979]=
{
strName=_t"鹰之拳",
StrAttacktype=_t"",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"天鹰座的基本招式.",
}

skill_desc_str[5980]=
{
strName=_t"天鹰脚",
StrAttacktype=_t"",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"天鹰座魔铃的绝技.",
}

skill_desc_str[5981]=
{
strName=_t"天鹰流星拳",
StrAttacktype=_t"",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"天鹰座魔铃的另一绝技.",
}

skill_desc_str[5982]=
{
strName=_t"天马流星拳",
StrAttacktype=_t"",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"星矢的绝技，强力的攻击.",
}

skill_desc_str[5983]=
{
strName=_t"光速天马流星拳",
StrAttacktype=_t"",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"天马座的光速之拳！",
}

skill_desc_str[5984]=
{
strName=_t"天马彗星拳",
StrAttacktype=_t"",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"星矢的另一绝技，汇聚所有流星拳的力量.",
}

skill_desc_str[5934]=
{
strName=_t"龙之拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天龙座的基础招式",
StrUseDesc=_t "天龙座的基础招式",
}

skill_desc_str[5935]=
{
strName=_t"庐山龙飞翔",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "冲向目标，并把半径15米内的敌人聚拢过来。",
StrUseDesc=_t "冲向目标，并把半径15米内的敌人聚拢过来。",
}

skill_desc_str[5936]=
{
strName=_t"庐山升龙霸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "天龙座的绝招！",
StrUseDesc=_t "天龙座的绝招！",
}

skill_desc_str[5664]=
{
strName=_t"钻石巨拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"冰河的普通攻击，可以积攒小宇宙能量.",
}

skill_desc_str[5665]=
{
strName=_t"冰冻光环",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"冰河的强力减速攻击，但是冷却时间较长，可以积攒小宇宙能量.",
}

skill_desc_str[5666]=
{
strName=_t"钻石星尘拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"冰河的招牌技能，耗费小宇宙能量.",
}

skill_desc_str[5667]=
{
strName=_t"曙光女神的宽恕",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"卡妙的最终奥义，威力惊人.",
}

skill_desc_str[6098]=
{
strName=_t"降临！阿布罗狄玫瑰",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "\t^c0c0ff[玫瑰攻击]^FFFF00\r玫瑰降临，对主人攻击的目标发起攻击，对目标以及周围6米半径造成大量伤害，同时附带流血效果8秒，每秒伤害为生命上限的4%%(流血效果只对玩家生效，且不受抗性药影响)\r造成伤害%d%%\r^c0c0ff[玫瑰庇护]^FFFF00\r玫瑰降临使攻击主人的目标技能被打断，同时受到伤害减少80%%，被攻击10次后状态消失，触发时附带解除控制效果（被守护星等攻击也会消耗次数）\t神器效果触发概率与神力值有关",
StrUseDesc=_t "\t^c0c0ff[玫瑰攻击]^FFFF00\r玫瑰降临，对主人攻击的目标发起攻击，对目标以及周围6米半径造成大量伤害，同时附带流血效果8秒，每秒伤害为生命上限的4%%(流血效果只对玩家生效，且不受抗性药影响)\r造成伤害%d%%\r^c0c0ff[玫瑰庇护]^FFFF00\r玫瑰降临使攻击主人的目标技能被打断，同时受到伤害减少80%%，被攻击10次后状态消失，触发时附带解除控制效果（被守护星等攻击也会消耗次数）\t神器效果触发概率与神力值有关",
StrDescNum="(1.2+(player.level-1)*0.00558)*2*100",
StrFuncdesc=_t"使用后获得玫瑰之祝福，战斗中有概率触发^c0c0ff[玫瑰攻击]^A2FFFF或^c0c0ff[玫瑰庇护]^A2FFFF效果",
}

skill_desc_str[5965]=
{
strName=_t"庐山亢龙霸",
StrAttacktype=_t"",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6024]=
{
strName=_t"使用",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[5915]=
{
strName=_t"注入",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[5916]=
{
strName=_t"修补",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[5917]=
{
strName=_t"解除石化",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[5918]=
{
strName=_t"解除石化",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[5920]=
{
strName=_t"刺入",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6015]=
{
strName=_t"释放",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6215]=
{
strName=_t"降临！修罗圣剑",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "\t^c0c0ff[圣剑之刃]^FFFF00\r圣剑降临，对主人攻击的目标发起攻击，对目标以及周围6米半径造成大量伤害，同时使主人和周围6米范围内的队友伤害提升50%%\r造成伤害%d%%\r^c0c0ff[圣剑护佑]^FFFF00\r圣剑降临使主人受到伤害减少80%%，持续12秒，触发时附带解除控制效果\t神器效果触发概率与神力值有关",
StrUseDesc=_t "\t^c0c0ff[圣剑之刃]^FFFF00\r圣剑降临，对主人攻击的目标发起攻击，对目标以及周围6米半径造成大量伤害，同时使主人和周围6米范围内的队友伤害提升50%%\r造成伤害%d%%\r^c0c0ff[圣剑护佑]^FFFF00\r圣剑降临使主人受到伤害减少80%%，持续12秒，触发时附带解除控制效果\t神器效果触发概率与神力值有关",
StrDescNum="(1.2+(player.level-1)*0.00558)*2*100",
StrFuncdesc=_t"使用后获得圣剑加持，战斗中有概率触发^c0c0ff[圣剑之刃]^A2FFFF或^c0c0ff[圣剑护佑]^A2FFFF效果",
}

skill_desc_str[6258]=
{
strName=_t"降临！卡妙水瓶",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "\t^c0c0ff[曙光女神的惩戒]^FFFF00\r曙光女神的水瓶降临，对主人攻击的目标发起攻击，对目标以及周围6米半径造成大量伤害，使目标被冰冻4秒。\r同时目标周围的敌人将获得寒气扩散效果，带有寒气扩散效果的敌人在相互靠近或靠近被冰冻的主目标时，将会叠加寒气状态，叠加到5层时将被冰冻。寒气扩散效果持续10秒\r造成伤害%d%%\r^c0c0ff[曙光女神的护佑]^FFFF00\r水瓶将使攻击主人的目标被冰冻4秒，同时主人受到伤害减少80%%，被攻击10次后状态消失，最多持续12秒，触发时附带解除控制效果（被守护星等攻击也会消耗次数）\t神器效果触发概率与神力值有关",
StrUseDesc=_t "\t^c0c0ff[曙光女神的惩戒]^FFFF00\r曙光女神的水瓶降临，对主人攻击的目标发起攻击，对目标以及周围6米半径造成大量伤害，使目标被冰冻4秒。\r同时目标周围的敌人将获得寒气扩散效果，带有寒气扩散效果的敌人在相互靠近或靠近被冰冻的主目标时，将会叠加寒气状态，叠加到5层时将被冰冻。寒气扩散效果持续10秒\r造成伤害%d%%\r^c0c0ff[曙光女神的护佑]^FFFF00\r水瓶将使攻击主人的目标被冰冻4秒，同时主人受到伤害减少80%%，被攻击10次后状态消失，最多持续12秒，触发时附带解除控制效果（被守护星等攻击也会消耗次数）\t神器效果触发概率与神力值有关",
StrDescNum="(1.2+(player.level-1)*0.00558)*2*100",
StrFuncdesc=_t"使用后获得曙光女神的祝福，战斗中有概率触发^c0c0ff[曙光女神的惩戒]^A2FFFF或^c0c0ff[曙光女神的护佑]^A2FFFF效果",
}

skill_desc_str[6243]=
{
strName=_t"交藤缠绕",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r定身时间:5秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r定身时间:5秒",
StrDescNum="(13.28*t2*t2+1055*t2+11443);0.8*(0.017*t2+1.378)*100",
StrFuncdesc=_t"攻击目标及周围一定范围内的敌人，并使范围内的敌人被根须缠绕，造成定身效果",
}

skill_desc_str[6244]=
{
strName=_t"波涛汹涌",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r浮空时间:3秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r浮空时间:3秒",
StrDescNum="(51.44*t2*t2+589*t2+18844);0.8*(0.011*t2+1.49)*100",
StrFuncdesc=_t"攻击自身前方一定范围内的敌人，并造成浮空效果",
}

skill_desc_str[6245]=
{
strName=_t"号令之旗",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r伤害抗性提升15%%\r持续10秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r伤害抗性提升15%%\r持续10秒",
StrDescNum="(-2.3*t2*t2+1262*t2+20831);0.75*(0.011*t2+1.524)*100",
StrFuncdesc=_t"以自身为圆心的大范围伤害，同时提高队友伤害抗性",
}

skill_desc_str[6247]=
{
strName=_t"最后的守护",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "回复%d点血量",
StrUseDesc=_t "回复%d点血量",
StrDescNum="t8*0.125*(0.011*t2+1.524)",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r移除移动控制状态，并回复一定血量",
}

skill_desc_str[6248]=
{
strName=_t"翻江倒海",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-3.39*t2*t2+1054*t2+30488);1.1*(0.011*t2+1.602)*100",
StrFuncdesc=_t"攻击前方扇形区域并向后闪身",
}

skill_desc_str[6249]=
{
strName=_t"鱼群涌动",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "伤害抗性提升50%%\r持续5秒",
StrUseDesc=_t "伤害抗性提升50%%\r持续5秒",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r受到来自大自然的能量保护，伤害抗性大幅提升",
}

skill_desc_str[6250]=
{
strName=_t"迷之笼罩",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r命中值降为0，命中率最低降至75%%\r持续时间:8秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r命中值降为0，命中率最低降至75%%\r持续时间:8秒",
StrDescNum="(4.32*t2*t2+644*t2+35155);0.9*(0.008*t2+1.645)*100",
StrFuncdesc=_t"以自身为圆心的大范围伤害，同时降低周围敌人的命中率",
}

skill_desc_str[6251]=
{
strName=_t"夜幕降临",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r降低伤害20%%\r持续10秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r降低伤害20%%\r持续10秒",
StrDescNum="(4.32*t2*t2+644*t2+35155);0.9*(0.008*t2+1.645)*30",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对选定区域造成范围伤害，同时减弱敌人的伤害",
}

skill_desc_str[6252]=
{
strName=_t"鬼主降临",
StrAttacktype=_t"召唤技能",
StrCompDesc=_t "召唤厉鬼协助战斗20秒\r厉鬼附加攻击力:%d\r厉鬼每次攻击造成%d%%的伤害",
StrUseDesc=_t "召唤厉鬼协助战斗20秒\r厉鬼附加攻击力:%d\r厉鬼每次攻击造成%d%%的伤害",
StrDescNum="(-1.1*t2*t2+780*t2+39548);0.2*(0.008*t2+1.701)*100",
StrFuncdesc=_t"召唤厉鬼，帮助攻击的敌人",
}

skill_desc_str[6253]=
{
strName=_t"毁天灭地",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-1.1*t2*t2+780*t2+39548);1.3*(0.008*t2+1.701)*30",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r攻击自身前方一定范围内的敌人",
}

skill_desc_str[6254]=
{
strName=_t"均衡诅咒",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r沉默\r持续时间:4秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r沉默\r持续时间:4秒",
StrDescNum="(-2.86*t2*t2+836*t2+42191);(0.008*t2+1.736)*100",
StrFuncdesc=_t"对目标及其周围5米范围内的敌人造成大量伤害，并附带沉默效果",
}

skill_desc_str[6255]=
{
strName=_t"黑暗之吻",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(-2.86*t2*t2+836*t2+42191);1.5*(0.008*t2+1.736)*30",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对自身面前区域造成大量伤害",
}

skill_desc_str[6256]=
{
strName=_t"黄金三角次元",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(4.79*t2*t2+1506*t2+3054);1*(0.02*t2+1.268)*100",
StrFuncdesc=_t"对面前敌人造成大量伤害，并击退他们",
}

skill_desc_str[6257]=
{
strName=_t"幻胧魔皇拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害\r使主目标处于混乱状态\r持续5秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害\r使主目标处于混乱状态\r持续5秒",
StrDescNum="(10*t2*t2+1506*t2+3054);1*(0.03*t2+1.268)*0.3*100",
StrFuncdesc=_t"^ff0000小宇宙爆发时可以使用^A2FFFF\r对目标及其周围5米范围内的敌人造成大量伤害，并使主目标产生幻觉\r释放技能时受到的伤害减少30%%",
}

skill_desc_str[6288]=
{
strName=_t"空突拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6289]=
{
strName=_t"流星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"天马座的扇形散弹，还能减速哦！",
}

skill_desc_str[6290]=
{
strName=_t"扫帚星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"大扫帚星圆形攻击，对选中的敌人造成倒地，同时减速周围目标",
}

skill_desc_str[6291]=
{
strName=_t"天马大头锤",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"原地大头锤，造成周围和自己倒地，你看的没错，自己也会倒地哦！",
}

skill_desc_str[6292]=
{
strName=_t"钻石小拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6293]=
{
strName=_t"结晶之环",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"要减速就减一条线！",
}

skill_desc_str[6294]=
{
strName=_t"嗖嗖龙卷风",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"打击敌人，同时形成1-2束龙卷风",
}

skill_desc_str[6295]=
{
strName=_t"钻石星星拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"用扇形冻结一切吧，少年！",
}

skill_desc_str[6296]=
{
strName=_t"龙之拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6297]=
{
strName=_t"庐山龙滑翔",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"天龙滑过之处，不是定身就减速！",
}

skill_desc_str[6298]=
{
strName=_t"童式太极拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"太极拳练到高深处，能形成一个大罩子！据说能减少伤害",
}

skill_desc_str[6299]=
{
strName=_t"庐山升龙吧",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"召唤升龙打飞选中的敌人，减速周围的敌人",
}

skill_desc_str[6300]=
{
strName=_t"星云锁链",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6301]=
{
strName=_t"滚蛋防御",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"滚蛋防御转啊转，加防又加血",
}

skill_desc_str[6302]=
{
strName=_t"星云气流",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"聚起星云气流，想加血的走进来吧",
}

skill_desc_str[6303]=
{
strName=_t"星云疯暴",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"仙女疯了，被打中的话会流血不止哦",
}

skill_desc_str[6304]=
{
strName=_t"火弹",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6305]=
{
strName=_t"弹一闪",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"我过去了，我又回来了，你能把我怎么样啊",
}

skill_desc_str[6306]=
{
strName=_t"火鸟天翔",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"把你们烧成火鸡！",
}

skill_desc_str[6307]=
{
strName=_t"火鸟幻魔拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"灼瞎敌人的眼睛，让他们在黑暗中行走",
}

skill_desc_str[6308]=
{
strName=_t"裁决之拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6309]=
{
strName=_t"次元禁锢",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"不但能禁锢身体，更能禁锢敌人的技能",
}

skill_desc_str[6310]=
{
strName=_t"异次元空间",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"进入异次元空间的人，什么都看不见，什么技能都别想用",
}

skill_desc_str[6311]=
{
strName=_t"银河星爆",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"教皇的喀秋莎火箭炮，原地轰呀轰！",
}

skill_desc_str[6312]=
{
strName=_t"三巴掌",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6313]=
{
strName=_t"旋风拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"我打，我打，给我倒！",
}

skill_desc_str[6314]=
{
strName=_t"健身操",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"学熊熊伸伸懒腰你就不会老，减伤又加速",
}

skill_desc_str[6315]=
{
strName=_t"无敌",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"无敌！这下大家满意了吧！",
}

skill_desc_str[6316]=
{
strName=_t"兔击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6317]=
{
strName=_t"兔子炸弹",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"1个3秒后爆炸的月饼炸弹",
}

skill_desc_str[6318]=
{
strName=_t"追击炸弹",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"1个能够追击目标的炸弹，或者，也可能是2个",
}

skill_desc_str[6319]=
{
strName=_t"兔子飞弹",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"来吧，要炸就炸一片！",
}

skill_desc_str[6320]=
{
strName=_t"闪电枪",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6321]=
{
strName=_t"落雷",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"我劈，我劈！",
}

skill_desc_str[6322]=
{
strName=_t"潮汐之怒",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"大海无量！排山倒海！",
}

skill_desc_str[6323]=
{
strName=_t"海皇神雷",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"威力巨大的雷击，接下来还会对目标区域持续造成雷击",
}

skill_desc_str[6324]=
{
strName=_t"锤击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6325]=
{
strName=_t"泰坦飞锤",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"扔出一柄归去来锤，对敌人造成2次伤害",
}

skill_desc_str[6326]=
{
strName=_t"泰坦之力",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"我加攻，我加防！",
}

skill_desc_str[6327]=
{
strName=_t"泰坦无敌",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"神啊！让我的队友无敌吧，什么？我不无敌还眩晕！",
}

skill_desc_str[6328]=
{
strName=_t"飞箭",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6329]=
{
strName=_t"爱意",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"这个技能非常简单，简单之极，它的作用就是：加血！",
}

skill_desc_str[6330]=
{
strName=_t"拥抱",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"一直穿云箭，6只飞箭来相见！",
}

skill_desc_str[6331]=
{
strName=_t"博爱",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"多重箭！不解释！",
}

skill_desc_str[6332]=
{
strName=_t"熔岩",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6333]=
{
strName=_t"熔岩火人",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"用熔岩攻击敌人，碎裂的熔岩会变成你的火人朋友",
}

skill_desc_str[6334]=
{
strName=_t"熔岩之墙",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"召唤一面熔岩之墙，挡住敌人的去路",
}

skill_desc_str[6335]=
{
strName=_t"熔岩领域",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"在脚下召唤一片熔岩领域，自己在上面加速又加血，敌人嘛，哼哼，烧死你们",
}

skill_desc_str[6336]=
{
strName=_t"冥王之拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6337]=
{
strName=_t"冥月神斩",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"半月斩！",
}

skill_desc_str[6338]=
{
strName=_t"死亡一剑",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"戳！",
}

skill_desc_str[6339]=
{
strName=_t"永恒日蚀",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"头顶黑太阳，打击全世界！",
}

skill_desc_str[6340]=
{
strName=_t"兔拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6341]=
{
strName=_t"多子炸弹",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"弹生蛋，蛋生弹",
}

skill_desc_str[6342]=
{
strName=_t"消失",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"谁都看不见我了",
}

skill_desc_str[6343]=
{
strName=_t"人间大炮",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"来到你身边，带着南瓜炸弹",
}

skill_desc_str[6269]=
{
strName=_t"小宇宙能量",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6355]=
{
strName=_t"德墨忒耳的点金杖",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6356]=
{
strName=_t"智慧之果",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6389]=
{
strName=_t"极乐之梦",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.304*t1*t1+30.096*t1+60.876);math.ceil((0.135*t1+14.337)*100)",
StrFuncdesc=_t"对自身周围6米半径的圆形区域造成伤害",
}

skill_desc_str[6390]=
{
strName=_t"永恒的安眠",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6391]=
{
strName=_t"神罚之梦",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.304*t1*t1+30.096*t1+60.876);math.ceil((0.108*t1+11.556)*100)",
StrFuncdesc=_t"对自身面前90度半径8米的扇形区域伤害",
}

skill_desc_str[6400]=
{
strName=_t"奥林匹斯的永夜",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.304*t1*t1+30.096*t1+60.876);math.ceil((0.161*t1+17.119)*100)",
StrFuncdesc=_t"对自身周围10米半径的圆形区域造成伤害",
}

skill_desc_str[2138]=
{
strName=_t"银河星爆",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "海飞龙奥义",
StrUseDesc=_t "海飞龙奥义",
}

skill_desc_str[6445]=
{
strName=_t"降临！黄金之箭",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "\t^c0c0ff[女神之伤]^FFFF00\r艾欧罗斯弓箭降临，对主人攻击的目标发起攻击，对目标以及周围6米半径造成大量伤害，目标被射中后将被击退5米，同时产生奇妙的身体变化，无法动弹，此期间也不能被技能回复生命，持续4秒。\r造成伤害%d%%\r^c0c0ff[箭之祝福]^FFFF00\r艾欧罗斯弓箭将使攻击主人的目标被击飞并倒地2秒，同时主人受到伤害减少80%%，被攻击10次后状态消失，最多持续12秒，触发时附带解除控制效果（被守护星等攻击也会消耗次数）\t神器效果触发概率与神力值有关",
StrUseDesc=_t "\t^c0c0ff[女神之伤]^FFFF00\r艾欧罗斯弓箭降临，对主人攻击的目标发起攻击，对目标以及周围6米半径造成大量伤害，目标被射中后将被击退5米，同时产生奇妙的身体变化，无法动弹，此期间也不能被技能回复生命，持续4秒。\r造成伤害%d%%\r^c0c0ff[箭之祝福]^FFFF00\r艾欧罗斯弓箭将使攻击主人的目标被击飞并倒地2秒，同时主人受到伤害减少80%%，被攻击10次后状态消失，最多持续12秒，触发时附带解除控制效果（被守护星等攻击也会消耗次数）\t神器效果触发概率与神力值有关",
StrDescNum="(1.2+(player.level-1)*0.00558)*2*100",
StrFuncdesc=_t"使用后获得艾欧罗斯弓箭的祝福，战斗中有概率触发^c0c0ff[女神之伤]^A2FFFF或^c0c0ff[箭之祝福]^A2FFFF效果",
}

skill_desc_str[6412]=
{
strName=_t"憎恨",
StrAttacktype=_t"主动攻击",
StrMana=_t "普通攻击\r释放时，增加一点恶之力，指针向恶之信仰方向偏移\r蓄力1秒释放，指针立即偏移到恶之信仰终端，每30秒只能生效一次\r蓄力后可将怪物击倒浮空,每10秒生效一次",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r至少造成{^FFABFC%d%%^FFFF00}的伤害\r蓄力1秒释放时，伤害提升30%%",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r至少造成%d%%的伤害\r蓄力1秒释放时，伤害提升30%%",
StrDescNum="math.ceil(0.160*level*level+15.840*level+32.040);math.ceil(0.167*level*level+16.500*level+33.375);math.ceil((0.009*level+0.987)*1.2*100)",
StrFuncdesc=_t"打击目标，并溅射周围目标",
SkillSoul={ 
   [6664] = { desc=_t"攻击附加[生命枯萎]效果.最多叠加5层,每层对目标造成每秒%d点伤害,持续6秒",num="math.ceil(t6*0.01*(t5+1)-1)"},
} ,
}

skill_desc_str[6416]=
{
strName=_t"怜悯",
StrAttacktype=_t"主动攻击",
StrMana=_t "普通攻击\r释放时，增加一点善之力，指针向善之信仰方向偏移\r蓄力1秒释放，填满善之力.指针立即偏移到左侧，每30秒只能生效一次\r蓄力后可将怪物击倒浮空,每10秒生效一次",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r至少造成{^FFABFC%d%%^FFFF00}的伤害\r蓄力1秒释放时，伤害提升30%%",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r至少造成%d%%的伤害\r蓄力1秒释放时，伤害提升30%%",
StrDescNum="math.ceil(0.160*level*level+15.840*level+32.040);math.ceil(0.167*level*level+16.500*level+33.375);math.ceil((0.009*level+0.987)*100)",
StrFuncdesc=_t"打击目标，并溅射周围目标，被击中的目标附加^c0c0ff[海龙的震慑]^A2FFFF效果，减速1米/秒",
}

skill_desc_str[6421]=
{
strName=_t"毁灭双子星",
StrAttacktype=_t"主动攻击",
StrMana=_t "释放时，指针向当前所处信仰方向偏移，指针处于中间时，指针偏移方向取决于上次普通攻击是怜悯还是憎恨\r不同信仰造成的效果不同",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r至少造成{^FFABFC%d%%^FFFF00}的伤害\r\t^00FF00恶之结晶^FFFF00\r附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r\t^00FF00善之结晶^FFFF00\r回复生命:{^FFABFC%d^FFFF00}",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r至少造成%d%%的伤害\r\t^00FF00恶之结晶^FFFF00\r附加攻击力:%d\r附加水属性攻击力:%d\r造成%d%%的伤害\r\t^00FF00善之结晶^FFFF00\r回复生命:%d",
StrDescNum="math.ceil(0.242*level*level+25.276*level+72.970);math.ceil(0.252*level*level+26.330*level+76.011);math.ceil((0.018*level+1.979)*100);math.ceil(0.120*level*level+12.557*level+36.250);math.ceil(0.125*level*level+13.080*level+37.760);math.ceil((0.005*level+0.504)*100);math.ceil((0.877*t4*t4+39.653*t4+100.844+(t8*1.2-(4.309*t4*t4+147.903*t4+436.730))*(0.0004*t4+0.044))*(1+(t5>0?t5:0)*0.25))+1",
StrFuncdesc=_t"打击目标，并溅射周围目标\r^00FF00恶之信仰^A2FFFF\r伤害提升20%%\r在目标位置召唤1个恶之结晶\r恶之结晶爆炸时将对周围5米范围内敌人造成伤害，同时给敌人附加^c0c0ff[星辰之怒]^A2FFFF，额外受到^c0c0ff[究极星爆]^A2FFFF100%%的伤害加成，持续15秒\r增加2点恶之力，指针向恶方向移动2格\r^00FF00善之信仰^A2FFFF\r在自身周围召唤1个善之结晶\r善之结晶将给周围15米范围内队友回复生命，每层善之信仰提升25%%生命回复量.\r增加2点善之力，指针向善方向移动2格",
SkillSoul={ 
   [6491] = { desc=_t"额外增加1点<善之力>/<恶之力>"},
   [6502] = { desc=_t"50%%几率额外增加一个<善之结晶>/<恶之结晶>"},
} ,
}

skill_desc_str[6424]=
{
strName=_t"星云海啸",
StrAttacktype=_t"主动攻击",
StrMana=_t "释放时，将消耗所有恶之力\r不同信仰造成效果不同",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r至少造成{^FFABFC%d%%^FFFF00}的伤害\r\t^00FF00恶之结晶^FFFF00\r附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r\t^00FF00善之结晶^FFFF00\r回复生命:{^FFABFC%d^FFFF00}\r爆炸为目标附加瞄准，可叠加2层，每层提升{^FFABFC%d^FFFF00}命中。持续4秒，叠加2层后，将无法受到此技能善之结晶的治疗\r\t^00FF00双子座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r至少造成%d%%的伤害\r\t^00FF00恶之结晶^FFFF00\r附加攻击力:%d\r附加水属性攻击力:%d\r造成%d%%的伤害\r\t^00FF00善之结晶^FFFF00\r回复生命:%d\r爆炸为目标附加瞄准，可叠加2层，每层提升%d命中。持续4秒，叠加2层后，将无法受到此技能善之结晶的治疗\r\t^00FF00双子座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发",
StrDescNum="math.ceil(0.320*level*level+34.560*level+213.120);math.ceil(0.333*level*level+36.000*level+222.000);math.ceil((0.018*level+2.044)*100);math.ceil(0.120*t4*t4+12.557*t4+36.250);math.ceil(0.125*t4*t4+13.080*t4+37.760);math.ceil((0.005*t4+0.504)*100);math.ceil((0.877*t4*t4+39.653*t4+100.844+(t3*1.2-(4.309*t4*t4+147.903*t4+436.730))*(0.0004*t4+0.044))*(1+player.bufflevel[2695]*0.25))+1;math.ceil(((8+t4*2)*(8+t4*2)*0.002+0.5*(8+2*t4)+20)*3-2)",
StrFuncdesc=_t"打击目标，并溅射周围目标\r^00FF00恶之信仰^A2FFFF\r恶之力层数越高，伤害越高\r前3层每层提升20%%伤害\r第4层层提升40%%伤害\r在目标位置召唤2个恶之结晶\r在自身周围召唤1个善之结晶\r^00FF00善之信仰^A2FFFF\r在自身周围召唤2个善之结晶\r在目标位置召唤1个恶之结晶\r恶之结晶爆炸时将对周围5米范围内敌人造成伤害，同时给敌人附加^c0c0ff[星辰之怒]^A2FFFF，持续15秒\r善之结晶将给周围15米范围内队友回复生命，每层善之信仰提升25%%生命回复量.\r",
SkillSoul={ 
   [6510] = { desc=_t"使目标石化,每层恶之力提供0.75秒石化时间,最高石化3秒.30秒内无法再次触发此效果."},
   [6495] = { desc=_t"冷却时间减少2秒"},
} ,
}

skill_desc_str[6425]=
{
strName=_t"究极星爆",
StrAttacktype=_t"主动攻击",
StrMana=_t "释放时，将逐渐消耗2层恶之力\r",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r至少造成{^FFABFC%d%%^FFFF00}的伤害\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962银河星爆]^FFFF00\r^c0c0ff召唤流星雨，造成范围伤害。",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r至少造成%d%%的伤害\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962银河星爆]^FFFF00\r^c0c0ff召唤流星雨，造成范围伤害。",
StrDescNum="math.ceil(0.182*level*level+20.622*level+75.171);math.ceil(0.190*level*level+21.481*level+78.303);math.ceil((0.033*level+3.497)*100)",
StrFuncdesc=_t"发动究极力量，轰炸目标区域.\r对受到^c0c0ff[星辰之怒]^A2FFFF效果影响的敌人造成双倍伤害，若技能开始时存在至少一层恶之力，则可提高50%%伤害",
SkillSoul={ 
   [6498] = { desc=_t"伤害提升10%%"},
} ,
}

skill_desc_str[6438]=
{
strName=_t"海龙之影",
StrAttacktype=_t"主动祝福",
StrMana=_t "不同信仰造成效果不同",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"分裂出自己的人格分身，召唤出的分身最多存在30秒\r^00FF00恶之信仰^A2FFFF\r召唤1个恶之分身，会帮助主人攻击敌人\r召唤2个恶之替身，会持续给周围5米范围内的队友提升伤害倍率10%%\r^00FF00善之信仰^A2FFFF\r召唤1个善之分身，有敌人靠近时，分身将靠近的将敌人束缚5秒后消失\r召唤2个善之替身，会持续给周围5米范围内的敌人造成减速\r",
SkillSoul={ 
   [6490] = { desc=_t"恶之分身的伤害提高50%%"},
} ,
}

skill_desc_str[6439]=
{
strName=_t"时空漩涡",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"自身快速闪现到12米外，在原位置召唤一个分身，分身可吸引附近怪物的仇恨，没有攻击力，闪现后会驱散掉自身受到的减速状态",
SkillSoul={ 
   [6503] = { desc=_t"冷却时间减少3秒"},
} ,
}

skill_desc_str[6440]=
{
strName=_t"黄道喷发",
StrAttacktype=_t"主动攻击",
StrMana=_t "将消耗所有恶之力或善之力\r恶之信仰有额外伤害加成",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r至少造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r至少造成%d%%的伤害",
StrDescNum="math.ceil(0.262*level*level+45.668*level+714.181);math.ceil(0.273*level*level+47.571*level+743.938);math.ceil((0.038*level+4.547)*100)",
StrFuncdesc=_t"猛烈打击目标，并溅射周围目标\r自身获得神魔附体状态，伤害提升20%%，持续20秒\r立即唤醒所有替身，恶之替身会跟随主人对目标释放黄道喷发技能，善之替身将目标束缚5秒\r恶之信仰条件下，恶之力层数越高，伤害越高，\r前3层每层提升20%%伤害\r第4层层提升40%%伤害\r\r",
}

skill_desc_str[6441]=
{
strName=_t"幻胧拳",
StrAttacktype=_t"主动攻击",
StrMana=_t "将消耗所有恶之力或善之力\r不同信仰造成效果不同",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r至少造成{^FFABFC%d%%^FFFF00}的伤害\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962幻龙魔皇拳]^FFFF00\r^c0c0ff对一条直线上的敌人造成伤害并击退。不同信仰造成的效果不同。",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r至少造成%d%%的伤害\r\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962幻龙魔皇拳]^FFFF00\r^c0c0ff对一条直线上的敌人造成伤害并击退。不同信仰造成的效果不同。",
StrDescNum="math.ceil(0.399*level*level+64.464*level+1306.246);math.ceil(0.416*level*level+67.150*level+1360.673);math.ceil((0.046*level+5.930)*100)",
StrFuncdesc=_t"猛烈打击目标，并溅射周围目标\r^00FF00恶之信仰^A2FFFF\r恶之力层数越高，伤害越高，\r前3层每层提升20%%伤害\r第4层层提升40%%伤害\r并将目标击退8米\r^00FF00善之信仰^A2FFFF\r使目标进入混乱状态4秒\r",
SkillSoul={ 
   [6504] = { desc=_t"分裂出一个恶之分身"},
   [6494] = { desc=_t"冷却时间减少8秒"},
   [6490] = { desc=_t"恶之分身的伤害提高50%%"},
} ,
}

skill_desc_str[6442]=
{
strName=_t"黄金三角异次元",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962黄金异次元]^FFFF00\r^c0c0ff使6米范围内的友方单位隐身3秒，对范围内的敌人造成伤害和击退效果。\r",
StrUseDesc=_t "\t^c0c0ff[黄金爆发]^FFFF00状态下\r进阶为^c0c0ff[^fff962黄金异次元]^FFFF00\r^c0c0ff使6米范围内的友方单位隐身3秒，对范围内的敌人造成伤害和击退效果。\r",
StrFuncdesc=_t"使自己或其他玩家进入异次元空间(对怪物不生效).进入异次元后无法被其他人看到(可被怪物看到)，也无法看到其他人，减免80%%伤害，持续6秒.\r目标进入异次元后添加^c0c0ff[放逐免疫]^A2FFFF状态，无法被再次传入异次元，持续30秒.若对敌人施放，其进入异次元后会被沉默，无法施法.若对自己或友方单位施放.不会被沉默.",
}

skill_desc_str[6443]=
{
strName=_t"神之化身",
StrAttacktype=_t"主动祝福",
StrMana=_t "善之信仰下有额外效果.",
StrCompDesc=_t "技能回复生命:{^FFABFC%d^FFFF00}\r\t^00FF00善之结晶^FFFF00\r回复生命:{^FFABFC%d^FFFF00}\r爆炸为目标附加专注，可叠加3层，每层提升3%%暴击。持续10秒，叠加3层后，将无法受到此技能善之结晶的治疗",
StrUseDesc=_t "技能回复生命:%d\r\t^00FF00善之结晶^FFFF00\r回复生命:%d\r爆炸为目标附加专注，可叠加3层，每层提升3%%暴击。持续10秒，叠加3层后，将无法受到此技能善之结晶的治疗",
StrDescNum="math.ceil((7.293*level*level+431.952*level+3992.741+(t8*1.2-(1.983*level*level+314.455*level+1390.217))*(0.003*level+0.376)))+1;math.ceil((0.877*t3*t3+39.653*t3+100.844+(t8*1.2-(4.309*t3*t3+147.903*t3+436.730))*(0.0004*t3+0.044))*(1+(t2>0?t2:0)*0.25))+1",
StrFuncdesc=_t"对自己或友方单位使用，可立即回复其生命\r^00FF00善之信仰^A2FFFF状态下会在自身周围召唤3个善之结晶",
SkillSoul={ 
   [6493] = { desc=_t"冷却时间减少5秒"},
   [6492] = { desc=_t"为目标添加波塞冬的守护状态,吸收目标最大生命值10%%的伤害.持续8秒,目标25秒内无法再次被施加波塞冬的守护"},
} ,
}

skill_desc_str[6460]=
{
strName=_t"双子星的重生",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"召唤星域之力将死亡的目标唤醒",
}

skill_desc_str[6407]=
{
strName=_t"光之箭",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00断翼^FFFF00\r  飞行速度减少2米/秒，持续4秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00断翼^FFFF00\r  飞行速度减少2米/秒，持续4秒",
StrDescNum="math.ceil(0.059*t1*t1+11.853*t1+59.264);math.ceil((0.006*t1+1.311)*100)",
StrFuncdesc=_t"释放光辉之箭对目标造成一次打击，有概率使目标进入^00FF00断翼^A2FFFF状态",
}

skill_desc_str[6408]=
{
strName=_t"烈焰冲击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.084*t1*t1+16.762*t1+83.812);math.ceil((0.012*t1+2.622)*100)",
StrFuncdesc=_t"以剧烈的火焰冲击目标，爆炸后对目标及其周围半径3米范围内的所有目标造成伤害",
}

skill_desc_str[6409]=
{
strName=_t"星辰之光影",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r攻击3次，共造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00星辰打击^FFFF00\r  只对玩家生效，立即消减最大生命值的15%%",
StrUseDesc=_t "附加攻击力:%d\r攻击3次，共造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00星辰打击^FFFF00\r  只对玩家生效，立即消减最大生命值的15%%",
StrDescNum="math.ceil(0.133*t1*t1+26.504*t1+132.518);math.ceil((0.031*t1+6.555)*100)",
StrFuncdesc=_t"以星辰之光和星辰之影连续打击目标后引爆，最后一段攻击有几率额外给予一次^00FF00星辰打击^A2FFFF",
}

skill_desc_str[6568]=
{
strName=_t"火焰震击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00断翼^FFFF00\r  飞行速度减少2米/秒，持续4秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00断翼^FFFF00\r  飞行速度减少2米/秒，持续4秒",
StrDescNum="math.ceil(0.073*t1*t1+14.517*t1+72.583);math.ceil((0.009*t1+1.966)*100)",
StrFuncdesc=_t"释放火球对目标造成一次打击，有概率使目标进入^00FF00断翼^A2FFFF状态",
}

skill_desc_str[6569]=
{
strName=_t"烈焰吐息",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.103*t1*t1+20.530*t1+102.648);math.ceil((0.018*t1+3.933)*100)",
StrFuncdesc=_t"一次猛烈的吐息，对目标方向60°扇形范围内的敌人造成伤害",
}

skill_desc_str[6570]=
{
strName=_t"深红死光",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r攻击5次，共造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00深红漩涡^FFFF00\r  无法移动，持续3秒",
StrUseDesc=_t "附加攻击力:%d\r攻击5次，共造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00深红漩涡^FFFF00\r  无法移动，持续3秒",
StrDescNum="math.ceil(0.162*t1*t1+32.460*t1+162.301);math.ceil((0.046*t1+9.832)*100)",
StrFuncdesc=_t"对目标持续喷吐深红死光，最多攻击5次；每次伤害有几率同时造成^00FF00深红漩涡^A2FFFF效果",
}

skill_desc_str[6571]=
{
strName=_t"致命毒液",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00致命毒液^FFFF00\r  飞行速度减少5米/秒，持续5秒\r  对玩家追加效果，每秒损失1%%当前生命值",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00致命毒液^FFFF00\r  飞行速度减少5米/秒，持续5秒\r  对玩家追加效果，每秒损失1%%当前生命值",
StrDescNum="math.ceil(0.126*t1*t1+25.143*t1+125.717);math.ceil((0.028*t1+5.899)*100)",
StrFuncdesc=_t"喷吐剧毒攻击目标同时造成^00FF00致命毒液^A2FFFF效果",
}

skill_desc_str[6572]=
{
strName=_t"火焰震击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00断翼^FFFF00\r  飞行速度减少2米/秒，持续4秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00断翼^FFFF00\r  飞行速度减少2米/秒，持续4秒",
StrDescNum="math.ceil(0.073*t1*t1+14.517*t1+72.583);math.ceil((0.005*t1+1.075)*100)",
StrFuncdesc=_t"释放火球对目标造成一次打击，有概率使目标进入^00FF00断翼^A2FFFF状态；如果自身处于^00FF00燃烧星辰^A2FFFF状态，伤害提高200%%",
}

skill_desc_str[6573]=
{
strName=_t"治疗波",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "回复生命:{^FFABFC%d^FFFF00}\r对地面目标效果减少50%%",
StrUseDesc=_t "回复生命:%d\r对地面目标效果减少50%%",
StrDescNum="math.ceil((1.489*t1*t1+130.255*t1+639.908+(t8*1.2-(0.516*t1*t1+88.851*t1+367.216))*(0.001*t1+0.299)))",
StrFuncdesc=_t"治疗目标回复其生命，只能对自己和队友使用",
}

skill_desc_str[6574]=
{
strName=_t"星云辉光",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "回复生命:{^FFABFC%d^FFFF00}\r对地面目标效果减少50%%\r^00FF00燃烧星辰^FFFF00\r  烈焰震击伤害提高200%%，持续10秒\r^00FF00风行^FFFF00\r  飞行速度提高3米/秒，伤害抗性增加10%%，持续10秒",
StrUseDesc=_t "回复生命:%d\r对地面目标效果减少50%%\r^00FF00燃烧星辰^FFFF00\r  烈焰震击伤害提高200%%，持续10秒\r^00FF00风行^FFFF00\r  飞行速度提高3米/秒，伤害抗性增加10%%，持续10秒",
StrDescNum="math.ceil((2.978*t1*t1+260.509*t1+1279.816+(t8*1.2-(0.516*t1*t1+88.851*t1+367.216))*(0.003*t1+0.597)))",
StrFuncdesc=_t"治疗自己以及周围10米内的所有队友，同时使自身进入^00FF00燃烧星辰^A2FFFF和^00FF00风行^A2FFFF状态",
}

skill_desc_str[6575]=
{
strName=_t"风行",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "^00FF00风行^FFFF00\r  飞行速度提高3米/秒，伤害抗性增加25%%，持续10秒",
StrUseDesc=_t "^00FF00风行^FFFF00\r  飞行速度提高3米/秒，伤害抗性增加25%%，持续10秒",
StrFuncdesc=_t"自己进入^00FF00风行^A2FFFF状态",
}

skill_desc_str[6576]=
{
strName=_t"火焰震击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00断翼^FFFF00\r  飞行速度减少2米/秒，持续4秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00断翼^FFFF00\r  飞行速度减少2米/秒，持续4秒",
StrDescNum="math.ceil(0.070*t1*t1+13.950*t1+69.749);math.ceil((0.008*t1+1.816)*100)",
StrFuncdesc=_t"释放火球对目标造成一次打击，有概率使目标进入^00FF00断翼^A2FFFF状态",
}

skill_desc_str[6577]=
{
strName=_t"冰封球",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00冰霜束缚^FFFF00\r  无法移动，持续6秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00冰霜束缚^FFFF00\r  无法移动，持续6秒",
StrDescNum="math.ceil(0.085*t1*t1+17.085*t1+85.424);math.ceil((0.013*t1+2.724)*100)",
StrFuncdesc=_t"攻击目标及其周围3米范围的所有单位，造成伤害并使受影响的单位进入^00FF00冰霜束缚^A2FFFF状态",
}

skill_desc_str[6578]=
{
strName=_t"石化之息",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00石化^FFFF00\r  无法行动，持续5秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00石化^FFFF00\r  无法行动，持续5秒",
StrDescNum="math.ceil(0.121*t1*t1+24.162*t1+120.808);math.ceil((0.025*t1+5.448)*100)",
StrFuncdesc=_t"击晕目标并造成大量伤害",
}

skill_desc_str[6579]=
{
strName=_t"风行",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "^00FF00风行^FFFF00\r  飞行速度提高3米/秒，伤害抗性增加15%%，持续10秒",
StrUseDesc=_t "^00FF00风行^FFFF00\r  飞行速度提高3米/秒，伤害抗性增加15%%，持续10秒",
StrFuncdesc=_t"自己进入^00FF00风行^A2FFFF状态",
}

skill_desc_str[6777]=
{
strName=_t"火球",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00断翼^FFFF00\r  飞行速度减少2米/秒，持续4秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00断翼^FFFF00\r  飞行速度减少2米/秒，持续4秒",
StrDescNum="math.ceil(0.062*t1*t1+12.394*t1+61.968);math.ceil((0.007*t1+1.433)*100)",
StrFuncdesc=_t"释放火球对目标造成一次打击，有概率使目标进入^00FF00断翼^A2FFFF状态",
}

skill_desc_str[6778]=
{
strName=_t"吐息",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%",
StrDescNum="math.ceil(0.088*t1*t1+17.527*t1+87.636);math.ceil((0.013*t1+2.867)*100)",
StrFuncdesc=_t"对目标方向60°扇形范围内的敌人造成吐息伤害",
}

skill_desc_str[6779]=
{
strName=_t"极光束",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r攻击5次，共造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%",
StrUseDesc=_t "附加攻击力:%d\r攻击5次，共造成%d%%的伤害\r对地面目标伤害减少50%%",
StrDescNum="math.ceil(0.139*t1*t1+27.713*t1+138.564);math.ceil((0.033*t1+7.167)*100)",
StrFuncdesc=_t"对目标持续喷吐极光束，最多攻击5次",
}

skill_desc_str[6489]=
{
strName=_t"荣耀之仪",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "善之结晶爆炸后附加^00FF00生命之花^FFFF00效果，每层每秒回复{^FFABFC%d^FFFF00}点生命，最多可叠加4层，持续8秒\r恢复生命值多少与善之心的治疗量有关\t\r  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "善之结晶爆炸后附加^00FF00生命之花^FFFF00效果，每层每秒回复%d点生命，最多可叠加4层，持续8秒\r恢复生命值多少与善之心的治疗量有关\t\r  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="math.ceil((0.877*t4*t4+39.653*t4+100.844+(t8*1.2-(4.309*t4*t4+147.903*t4+436.73))*(0.0004*t4+0.044))*(1+t6*0.25)*0.05-1);player.prof==7 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff鹿豹座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[6490]=
{
strName=_t"黑暗救世主",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使你召唤出的^00FF00恶之分身^FFFF00的伤害提升50%%\t\r  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "使你召唤出的^00FF00恶之分身^FFFF00的伤害提升50%%\t\r  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="player.prof==7 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff海飞龙圣衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[6491]=
{
strName=_t"阴影三连星",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "每当你使用^c0c0ff[%s]^FFFF00会根据你当前的^00FF00善之信仰^FFFF00/^00FF00恶之信仰^FFFF00状态，额外获得一个^00FF00善之力^FFFF00/^00FF00恶之力^FFFF00\t\r  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "每当你使用^c0c0ff[%s]^FFFF00会根据你当前的^00FF00善之信仰^FFFF00/^00FF00恶之信仰^FFFF00状态，额外获得一个^00FF00善之力^FFFF00/^00FF00恶之力^FFFF00\t\r  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="skill_desc_str[6421].strName;player.prof==7 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff海飞龙圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[6492]=
{
strName=_t"波塞冬的守护",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使用^c0c0ff[%s]^FFFF00后，能为目标增加一个护盾^c0c0ff[波塞冬的守护]^FFFF00，吸收目标生命值10%%的伤害。持续8秒，25秒内无法再次被施加此护盾\r  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "使用^c0c0ff[%s]^FFFF00后，能为目标增加一个护盾^c0c0ff[波塞冬的守护]^FFFF00，吸收目标生命值10%%的伤害。持续8秒，25秒内无法再次被施加此护盾\r  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="skill_desc_str[6443].strName;player.prof==7 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天幕座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[6493]=
{
strName=_t"天堂的干涉",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使^c0c0ff[%s]^FFFF00的冷却时间减少5秒\t\r  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "使^c0c0ff[%s]^FFFF00的冷却时间减少5秒\t\r  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="skill_desc_str[6443].strName;player.prof==7 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff波江座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[6494]=
{
strName=_t"恐惧弥漫",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使^c0c0ff[%s]^FFFF00的冷却时间减少8秒\t\r  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "使^c0c0ff[%s]^FFFF00的冷却时间减少8秒\t\r  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="skill_desc_str[6441].strName;player.prof==7 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天兽星圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[6495]=
{
strName=_t"平行宇宙",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使^c0c0ff[%s]^FFFF00的冷却时间减少2秒\t\r  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "使^c0c0ff[%s]^FFFF00的冷却时间减少2秒\t\r  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="skill_desc_str[6424].strName;player.prof==7 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff剑鱼座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[6496]=
{
strName=_t"天命之体",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使^c0c0ff[%s]^FFFF00的冷却时间减少30秒\t\r  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "使^c0c0ff[%s]^FFFF00的冷却时间减少30秒\t\r  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="skill_desc_str[6765].strName;player.prof==7 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff波江座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[6497]=
{
strName=_t"海之护体",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "如果自己在受到完全控制（浮空、倒地、冰冻、石化、抱摔、沉默、混乱）时被攻击，则接下来的5秒内会生成一个护盾，减少20%%伤害，受到多次攻击将重置护盾的时间\r护盾结束后，需要15秒才能触发下一次效果\r  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "如果自己在受到完全控制（浮空、倒地、冰冻、石化、抱摔、沉默、混乱）时被攻击，则接下来的5秒内会生成一个护盾，减少20%%伤害，受到多次攻击将重置护盾的时间\r护盾结束后，需要15秒才能触发下一次效果\r  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="player.prof==7 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff皇女座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[6498]=
{
strName=_t"教庭的审判",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使^c0c0ff[%s]^FFFF00的伤害提升10%%\r  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "使^c0c0ff[%s]^FFFF00的伤害提升10%%\r  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="skill_desc_str[6425].strName;player.prof==7 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff鹿豹座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[6499]=
{
strName=_t"神圣绽放",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "驱散范围内友方单位身上的^00FF00生命之花^FFFF00，每驱散一层^00FF00生命之花^FFFF00会恢复{^FFABFC%d^FFFF00}点生命值，恢复生命值的多少与善之结晶治疗量有关\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "驱散范围内友方单位身上的^00FF00生命之花^FFFF00，每驱散一层^00FF00生命之花^FFFF00会恢复%d点生命值，恢复生命值的多少与善之结晶治疗量有关\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="math.ceil((0.877*t4*t4+39.653*t4+100.844+(t8*1.2-(4.309*t4*t4+147.903*t4+436.730))*(0.0004*t4+0.044))*(1+t6*0.25)*0.75*1-1);player.prof==7 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff皇女座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[6500]=
{
strName=_t"邪恶绽放",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "驱散掉范围内敌方单位身上的^00FF00生命枯萎^FFFF00效果，每驱散一层^00FF00生命枯萎^FFFF00会瞬间造成{^FFABFC%d^FFFF00}点伤害。每层造成的伤害值与攻击力和属性攻击力之和的大小有关\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "驱散掉范围内敌方单位身上的^00FF00生命枯萎^FFFF00效果，每驱散一层^00FF00生命枯萎^FFFF00会瞬间造成%d点伤害。每层造成的伤害值与攻击力和属性攻击力之和的大小有关\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="math.ceil(t8*0.25*(1+t7)*1);player.prof==7 and ''or '^ff0001'",
StrFuncdesc=_t"^c0c0ff海飞龙圣衣星铸等级达到32级时获得^A2FFFF",
}

skill_desc_str[6501]=
{
strName=_t"神之牢笼",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "将范围内有^00FF00海龙的震慑^FFFF00效果的敌方单位定身3秒，没有此状态的敌方单位不会造成任何影响\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "将范围内有^00FF00海龙的震慑^FFFF00效果的敌方单位定身3秒，没有此状态的敌方单位不会造成任何影响\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="player.prof==7 and ''or '^ff0002'",
StrFuncdesc=_t"^c0c0ff剑鱼座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[6502]=
{
strName=_t"反物质次元",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使^c0c0ff[%s]^FFFF00有50%%几率额外召唤一个善之结晶/恶之结晶。\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "使^c0c0ff[%s]^FFFF00有50%%几率额外召唤一个善之结晶/恶之结晶。\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="skill_desc_str[6421].strName;player.prof==7 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天幕座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[6503]=
{
strName=_t"聚焦星辰",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使^c0c0ff[%s]^FFFF00的冷却时间减少3秒，变为12秒\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "使^c0c0ff[%s]^FFFF00的冷却时间减少3秒，变为12秒\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="skill_desc_str[6439].strName;player.prof==7 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff剑鱼座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[6504]=
{
strName=_t"灵魂提炼",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "每次施放^c0c0ff[%s]^FFFF00会召唤一个恶之分身\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "每次施放^c0c0ff[%s]^FFFF00会召唤一个恶之分身\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="skill_desc_str[6441].strName;player.prof==7 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天兽星圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[6505]=
{
strName=_t"教皇的圣裁",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "对自己或友方单位使用，减少80%%所受伤害，持续6秒\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "对自己或友方单位使用，减少80%%所受伤害，持续6秒\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="player.prof==7 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天幕座圣衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[6506]=
{
strName=_t"弑神之心",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "根据你当前的^00FF00善之信仰^FFFF00/^00FF00恶之信仰^FFFF00状态造成不同的效果。共持续15秒\r^00FF00恶之信仰^FFFF00每秒减少3%%的血量，增加80%%的伤害倍率，不与仙女的^c0c0ff[%s]^FFFF00叠加。\t^00FF00善之信仰^FFFF00每秒恢复2%%生命值。\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "根据你当前的^00FF00善之信仰^FFFF00/^00FF00恶之信仰^FFFF00状态造成不同的效果。共持续15秒\r^00FF00恶之信仰^FFFF00每秒减少3%%的血量，增加80%%的伤害倍率，不与仙女的^c0c0ff[%s]^FFFF00叠加。\t^00FF00善之信仰^FFFF00每秒恢复2%%生命值。\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="skill_desc_str[519].strName;player.prof==7 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff鬼主座圣衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[6507]=
{
strName=_t"最终献祭",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "解除控制，5秒内免疫任何控制。牺牲所有的分身和替身，每个回复最大生命值5%%的血量。\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "解除控制，5秒内免疫任何控制。牺牲所有的分身和替身，每个回复最大生命值5%%的血量。\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="player.prof==7 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff鬼主座圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[6509]=
{
strName=_t"霸王之怒",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "当你的生命值低于50%%时，触发^00FF00霸王之怒^FFFF00效果，提升20%%伤害。\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "当你的生命值低于50%%时，触发^00FF00霸王之怒^FFFF00效果，提升20%%伤害。\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="player.prof==7 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff天兽星圣衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[6510]=
{
strName=_t"石化凝视",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使^c0c0ff[%s]^FFFF00附加石化效果，持续时间跟恶之力层数有关，每层恶之力增加1秒的眩晕时间。最高眩晕4秒，生效后附加石化疲劳效果，30秒内无法再次触发石化。在善之信仰状态下不会触发\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "使^c0c0ff[%s]^FFFF00附加石化效果，持续时间跟恶之力层数有关，每层恶之力增加1秒的眩晕时间。最高眩晕4秒，生效后附加石化疲劳效果，30秒内无法再次触发石化。在善之信仰状态下不会触发\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="skill_desc_str[6424].strName;player.prof==7 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff鬼主座圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[6511]=
{
strName=_t"噬魂",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "你的恶之结晶爆炸后会给敌人附加^00FF00生命枯萎^FFFF00效果，可叠加5层，每层造成{^FFABFC%d^FFFF00}点伤害，持续6秒。造成的伤害值与攻击力和属性攻击力之和的大小有关\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "你的恶之结晶爆炸后会给敌人附加^00FF00生命枯萎^FFFF00效果，可叠加5层，每层造成%d点伤害，持续6秒。造成的伤害值与攻击力和属性攻击力之和的大小有关\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="math.ceil(t6*0.01*(1+t5)-1);player.prof==7 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff海飞龙圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[6512]=
{
strName=_t"冰冷威慑",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "你的恶之结晶爆炸后会给敌人附加^00FF00海龙的震慑^FFFF00效果，速度减少1米/秒，持续6秒\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "你的恶之结晶爆炸后会给敌人附加^00FF00海龙的震慑^FFFF00效果，速度减少1米/秒，持续6秒\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="player.prof==7 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff皇女座圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[6664]=
{
strName=_t"黑暗信仰",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使你的^c0c0ff[%s]^FFFF00附加^00FF00生命枯萎^FFFF00效果，可叠加5层，每层造成{^FFABFC%d^FFFF00}点伤害，持续6秒。造成的伤害值与攻击力和属性攻击力之和的大小有关\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrUseDesc=_t "使你的^c0c0ff[%s]^FFFF00附加^00FF00生命枯萎^FFFF00效果，可叠加5层，每层造成%d点伤害，持续6秒。造成的伤害值与攻击力和属性攻击力之和的大小有关\t  斗魂专属守护星座：^00FF00%s海龙^FFFF00",
StrDescNum="skill_desc_str[6412].strName;math.ceil(t6*0.01*(1+t5)-1);player.prof==7 and ''or '^ff0000'",
StrFuncdesc=_t"^c0c0ff海飞龙圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[6580]=
{
strName=_t"^fff962黄金之箭",
StrAttacktype=_t"主动攻击",
StrMana=_t "^fff962黄金射手座技能",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r蓄力1秒可将伤害提升100%%\t^00FF00黄金箭之伤^FFFF00\r不能释放技能，同时不能被技能回复生命\r持续4秒\r\t^00FF00射手座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发\r^00FF00黄金爆发^FFFF00\r^c0c0ff[流星爆裂拳]^FFFF00进阶为^c0c0ff[^fff962原子爆裂拳]^FFFF00\r^c0c0ff[星辰乱坠]^FFFF00进阶为^c0c0ff[^fff962箭雨流星]^FFFF00\r^c0c0ff[星命守护]^FFFF00进阶为^c0c0ff[^fff962射手守护]^FFFF00",
StrUseDesc=_t "附加攻击力:%d\r附加风属性攻击力:%d\r造成%d%%的伤害\r蓄力1秒可将伤害提升100%%\t^00FF00黄金箭之伤^FFFF00\r不能释放技能，同时不能被技能回复生命\r持续4秒\r\t^00FF00射手座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发\r^00FF00黄金爆发^FFFF00\r^c0c0ff[流星爆裂拳]^FFFF00进阶为^c0c0ff[^fff962原子爆裂拳]^FFFF00\r^c0c0ff[星辰乱坠]^FFFF00进阶为^c0c0ff[^fff962箭雨流星]^FFFF00\r^c0c0ff[星命守护]^FFFF00进阶为^c0c0ff[^fff962射手守护]^FFFF00",
StrDescNum="math.ceil(0.363*level*level+46.634*level+1666.074);math.ceil(0.378*level*level+48.577*level+1735.494);math.ceil((0.024*level+3.840)*100)",
StrFuncdesc=_t"使用黄金箭远程攻击目标\r被攻击的目标将会立即取消飞行状态\r蓄力后释放可给目标附加黄金箭之伤状态\r",
}

skill_desc_str[6581]=
{
strName=_t"^fff962原子爆裂拳",
StrAttacktype=_t"主动攻击",
StrMana=_t "^fff962黄金技能\r进阶效果：^c0c0ff伤害提升50%%\r大幅降低目标命中率",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加风属性攻击力:{^FFABFC%d^FFFF00}\r至少造成{^FFABFC%d%%^FFFF00}的伤害\r每点斗志提升25%%的总伤害",
StrUseDesc=_t "附加攻击力:%d\r附加风属性攻击力:%d\r至少造成%d%%的伤害\r每点斗志提升25%%的总伤害",
StrDescNum="0.24*t8*t8+25.69*t8+157.07;0.3*t8*t8+32.21*t8+198.49;100*2.25/1.75*(0.0227*t8+2.6)/(1+1.25)*1.5",
StrFuncdesc=_t"基础终结技，消耗当前所有的斗志\r攻击面前扇形区域",
SkillSoul={ 
   [923] = { desc=_t"附带减速效果，减少60%%的速度，持续5秒"},
   [921] = { desc=_t"每点斗志可以回复15点体力"},
   [925] = { desc=_t"每点斗志额外提升8%%的暴击率"},
   [930] = { desc=_t"冷却时间减少2秒，并且成功躲闪时获得一点斗志，生效最小间隔为5秒"},
   [931] = { desc=_t"%s",num="player.skilllevel[4092]>0 and '目标血量低于50%时，伤害提高50%，并附带星光惩戒效果' or ''"},
} ,
}

skill_desc_str[6582]=
{
strName=_t"^fff962箭雨流星",
StrAttacktype=_t"召唤技能",
StrMana=_t "^fff962黄金技能\r进阶效果：^c0c0ff召唤黄金箭雨，伤害较流星提升15%%",
StrCompDesc=_t "短时间召唤大量黄金箭打击周围单位\r黄金箭附加攻击力:{^FFABFC%d^FFFF00}\r黄金箭附加风属性攻击力:{^FFABFC%d^FFFF00}\r每支黄金箭造成{^FFABFC%d%%^FFFF00}的伤害\r持续时间:%d秒",
StrUseDesc=_t "短时间召唤大量黄金箭打击周围单位\r黄金箭附加攻击力:%d\r黄金箭附加风属性攻击力:%d\r每支黄金箭造成%d%%的伤害\r持续时间:%d秒",
StrDescNum="0.13*player.skilllevel[1622]*player.skilllevel[1622]+12.83*player.skilllevel[1622]+56.04;0.06*player.skilllevel[1622]*player.skilllevel[1622]+6.32*player.skilllevel[1622]+26.62;120*(1+0.1*player.skilllevel[928])*(0.0035*player.skilllevel[1622]+0.38)*1.15;6+player.skilllevel[928]*3",
StrFuncdesc=_t"召唤黄金箭雨打击周围目标",
SkillSoul={ 
   [928] = { desc=_t"持续时间增加3秒，伤害提高10%%"},
   [932] = { desc=_t"被流星击中的单位会减少60%%的移动速度，持续3秒"},
   [4287] = { desc=_t"落下的每颗流星有20%%的概率变为大流星，伤害范围增加1米，伤害为原来的4倍"},
} ,
}

skill_desc_str[6583]=
{
strName=_t"^fff962射手守护",
StrAttacktype=_t"主动祝福",
StrMana=_t "^fff962黄金技能\r进阶效果：^c0c0ff额外获得体力回复\r被攻击时攻击者命中将会降低",
StrCompDesc=_t "状态持续15秒，期间每3秒自动回复一点斗志\r每秒回复体力7点\r被攻击时，攻击者命中大幅降低持续5秒，此效果15秒只能触发一次",
StrUseDesc=_t "状态持续15秒，期间每3秒自动回复一点斗志\r每秒回复体力7点\r被攻击时，攻击者命中大幅降低持续5秒，此效果15秒只能触发一次",
StrDescNum="skill_desc_str[18].strName;skill_desc_str[19].strName",
StrFuncdesc=_t"使自己能够获得更多的斗志和体力",
SkillSoul={ 
   [4286] = { desc=_t"持续期间附带2米加速、15%%减伤的效果"},
   [5674] = { desc=_t"持续期间每2秒回复生命上限的1%%"},
} ,
}

skill_desc_str[6584]=
{
strName=_t"^fff962水瓶降临",
StrAttacktype=_t"主动攻击",
StrMana=_t "^fff962黄金水瓶座技能",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r\t^00FF00水瓶座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发\r^00FF00黄金爆发^FFFF00\r^c0c0ff[冰封大地]^FFFF00进阶为^c0c0ff[^fff962水瓶之光]^FFFF00\r^c0c0ff[结晶之环]^FFFF00进阶为^c0c0ff[^fff962曙光女神之怒]^FFFF00\r^c0c0ff[极光之守护]^FFFF00进阶为^c0c0ff[^fff962曙光护盾]^FFFF00",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r造成%d%%的伤害\r\t^00FF00水瓶座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发\r^00FF00黄金爆发^FFFF00\r^c0c0ff[冰封大地]^FFFF00进阶为^c0c0ff[^fff962水瓶之光]^FFFF00\r^c0c0ff[结晶之环]^FFFF00进阶为^c0c0ff[^fff962曙光女神之怒]^FFFF00\r^c0c0ff[极光之守护]^FFFF00进阶为^c0c0ff[^fff962曙光护盾]^FFFF00",
StrDescNum="math.ceil(0.363*level*level+46.634*level+1666.074);math.ceil(0.378*level*level+48.577*level+1735.494);math.ceil((0.036*level+5.760)*100)",
StrFuncdesc=_t"在目标区域召唤水瓶冰冷之力攻击目标区域\r可在瞬间造成大量伤害",
}

skill_desc_str[6585]=
{
strName=_t"^fff962水瓶之光",
StrAttacktype=_t"召唤技能",
StrMana=_t "^fff962黄金技能\r进阶效果：^c0c0ff召唤的极寒区域可向主人攻击的目标移动\r消耗%d点冻气",
StrCompDesc=_t "极寒半径:4米\r结冰需要时间:3秒\r冻结时间:3秒\r寒冰阵持续10秒",
StrUseDesc=_t "极寒半径:4米\r结冰需要时间:3秒\r冻结时间:3秒\r寒冰阵持续10秒",
StrDescNum="0",
StrFuncdesc=_t"将极寒注入脚下区域，且区域可向主人攻击的目标流动.区域范围内的敌人持续受到极寒的威慑，停留时间过长的敌人就会受到冰霜的审判而被冰冻",
SkillSoul={ 
   [1837] = { desc=_t"使用后会在自己身上生成冰壁，抵御下次伤害，冰壁生成后存在60秒，不可叠加"},
   [1839] = { desc=_t"使用后自己和周围12米范围内的队友伤害倍率增加5%%%s，持续10秒，不可叠加",num="player.skilllevel[4097]>0 and '暴击率增加5%' or ' '"},
   [5679] = { desc=_t"被冻结的敌人不能被技能回复生命"},
} ,
}

skill_desc_str[6586]=
{
strName=_t"^fff962曙光女神之怒",
StrAttacktype=_t"主动攻击",
StrMana=_t "^fff962黄金技能\r进阶效果：^c0c0ff伤害提升100%%，并100%%溅射目标周围的敌人\r同时可将目标冻结",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r使目标移动速度减少60%%，持续6秒\r冻结持续3秒",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r造成%d%%的伤害\r使目标移动速度减少60%%，持续6秒\r冻结持续3秒",
StrDescNum="0.3*player.skilllevel[67]*player.skilllevel[67]+35.33*player.skilllevel[67]+368.37;0.28*player.skilllevel[67]*player.skilllevel[67]+33.19*player.skilllevel[67]+345.53;200*(0.0175*player.skilllevel[67]+2.07)",
StrFuncdesc=_t"催动冻气，打击并减速目标及其身边单位，主目标将被冻结",
SkillSoul={ 
   [1833] = { desc=_t"被减速的单位水属性抗性下降%d点，持续6秒",num="25+15*player.skilllevel[4095]"},
   [1834] = { desc=_t"目标被诅咒，伤害减少25%%，持续6秒"},
   [4292] = { desc=_t"对于被寒冰减速或者冰冻的单位，伤害提升25%%"},
   [5677] = { desc=_t"主目标受到的下5次伤害提升30%%"},
} ,
}

skill_desc_str[6587]=
{
strName=_t"^fff962曙光护盾",
StrAttacktype=_t"主动祝福",
StrMana=_t "^fff962黄金技能\r进阶效果：^c0c0ff盾被击破时，周围5米范围内的敌人将因寒冷而导致无法移动\r盾附加期间将获得招架效果",
StrCompDesc=_t "护盾最多吸收{^FFABFC%d^FFFF00}点伤害\r护盾持续时间：%d秒\r获得招架效果\r处于浮空、倒地、冰冻、石化、沉默、混乱状态下也可使用",
StrUseDesc=_t "护盾最多吸收%d点伤害\r护盾持续时间：%d秒\r获得招架效果\r处于浮空、倒地、冰冻、石化、沉默、混乱状态下也可使用",
StrDescNum="math.ceil(0.363*level*level+46.634*level+1666.074);6+3*t4",
StrFuncdesc=_t"用冻气保护目标，给目标加上护盾",
SkillSoul={ 
   [1840] = { desc=_t"冷却时间下降20秒，且在盾触发时附带解除控制的效果"},
   [4293] = { desc=_t"护盾的血量提高50%%，持续时间提高3秒，并附带反击效果，攻击带盾的目标将被减速，每次减1米，最多减4米/秒"},
   [5678] = { desc=_t"生命降至40%%以下时，立即重置冷却，该效果至少每30秒才能触发一次"},
} ,
}

skill_desc_str[6588]=
{
strName=_t"^fff962天秤武库【攻】",
StrAttacktype=_t"主动攻击",
StrMana=_t "^fff962黄金天秤座技能",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加地属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r使目标移动速度减少40%%，持续4秒\r\t^00FF00天秤座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发\r^00FF00黄金爆发^FFFF00\r^c0c0ff[升龙霸]^FFFF00进阶为^c0c0ff[^fff962百龙霸]^FFFF00\r^c0c0ff[升龙阵]^FFFF00进阶为^c0c0ff[^fff962天秤武库【守】]^FFFF00\r^c0c0ff[龙之索]^FFFF00进阶为^c0c0ff[^fff962黄金锁链]^FFFF00",
StrUseDesc=_t "附加攻击力:%d\r附加地属性攻击力:%d\r造成%d%%的伤害\r使目标移动速度减少40%%，持续4秒\r\t^00FF00天秤座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发\r^00FF00黄金爆发^FFFF00\r^c0c0ff[升龙霸]^FFFF00进阶为^c0c0ff[^fff962百龙霸]^FFFF00\r^c0c0ff[升龙阵]^FFFF00进阶为^c0c0ff[^fff962天秤武库【守】]^FFFF00\r^c0c0ff[龙之索]^FFFF00进阶为^c0c0ff[^fff962黄金锁链]^FFFF00",
StrDescNum="math.ceil(0.363*level*level+46.634*level+1666.074);math.ceil(0.378*level*level+48.577*level+1735.494);math.ceil((0.024*level+3.840)*100)",
StrFuncdesc=_t"召唤天秤武器攻击目标区域，对范围内的敌人造成大量伤害\r同时可使敌人减速",
}

skill_desc_str[6589]=
{
strName=_t"^fff962百龙霸",
StrAttacktype=_t"主动攻击",
StrMana=_t "^fff962黄金技能\r进阶效果：^c0c0ff伤害范围大幅增加，对主目标造成长时间的击倒\r同时可100%%溅射其他敌方单位\r不再有前冲效果",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r倒地时间：5秒",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r造成%d%%的伤害\r倒地时间：5秒",
StrDescNum="0.22*player.skilllevel[93]*player.skilllevel[93]+29.02*player.skilllevel[93]+416.76;0.29*player.skilllevel[93]*player.skilllevel[93]+37.39*player.skilllevel[93]+539.32;100*(0.0283*player.skilllevel[93]+3.55)*(1-0.3*player.skilllevel[942])",
StrFuncdesc=_t"借助百龙之力攻击前方90度扇形区域，半径8米",
SkillSoul={ 
   [942] = { desc=_t"冷却时间减少15秒，目标浮空后附带8秒的减速；技能伤害下降30%%"},
   [947] = { desc=_t"该技能暴击率提升40%%"},
   [4299] = { desc=_t"使自己和周围6米的队友提升30%%的伤害抗性，持续6秒"},
   [5682] = { desc=_t"燃魂状态下，被击飞的目标将无法回复生命"},
} ,
}

skill_desc_str[6590]=
{
strName=_t"^fff962天秤武库【守】",
StrAttacktype=_t"主动祝福",
StrMana=_t "^fff962黄金技能\r进阶效果：^c0c0ff召唤黄金力量守护阵，范围扩大同时防护能力大幅提升\r自己和队友在守护阵内的闪避提升",
StrCompDesc=_t "伤害减免：%d%%\r持续时间：%d秒\r范围半径：7米",
StrUseDesc=_t "伤害减免：%d%%\r持续时间：%d秒\r范围半径：7米",
StrDescNum="player.skilllevel[943]*10+60;8-2*player.skilllevel[943]+2*t1*t2",
StrFuncdesc=_t"天龙能够唤醒自己内心强大的守护之力，保护自己和周围的队友",
SkillSoul={ 
   [943] = { desc=_t"冷却时间减少30秒，减伤效果额外提升10%%%s",num="player.skilllevel[4101]>0 and ''or '，持续时间减少2秒'"},
   [5681] = { desc=_t"范围内的自己和队友所有异常抗性增加20点"},
} ,
}

skill_desc_str[6591]=
{
strName=_t"^fff962黄金锁链",
StrAttacktype=_t"主动攻击",
StrMana=_t "^fff962黄金技能\r进阶效果：^c0c0ff将目标拉至身前的同时，可将自身周围的怪物拉至身边，额外对目标造成倒地效果",
StrCompDesc=_t "把敌方目标和其周围6米的单位拉到自己身前（如果要拉的是敌方玩家，只有当他是你选中的目标时才生效）\r主目标倒地时间：3秒",
StrUseDesc=_t "把敌方目标和其周围6米的单位拉到自己身前（如果要拉的是敌方玩家，只有当他是你选中的目标时才生效）\r主目标倒地时间：3秒",
StrFuncdesc=_t"用黄金锁链套取目标，把目标和自身周围5米范围内的怪物拉到自己身边，同时主目标将会倒地，可取消主目标的飞行状态",
}

skill_desc_str[6592]=
{
strName=_t"^fff962天魔降服",
StrAttacktype=_t"主动攻击",
StrMana=_t "^fff962黄金处女座技能",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加雷属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r\t^00FF00星光壁障^FFFF00\r抵御伤害:{^FFABFC%d^FFFF00}\r最多持续8秒\r抵御量随攻击力和属性攻击力增加而提升\r\t^00FF00处女座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发\r^00FF00黄金爆发^FFFF00\r^c0c0ff[锁链迷宫]^FFFF00进阶为^c0c0ff[^fff962魑魅魍魉]^FFFF00\r^c0c0ff[哈迪斯的意志]^FFFF00进阶为^c0c0ff[^fff962雅典娜意志]^FFFF00\r^c0c0ff[恢复之光]^FFFF00进阶为^c0c0ff[^fff962宝轮之光]^FFFF00",
StrUseDesc=_t "附加攻击力:%d\r附加雷属性攻击力:%d\r造成%d%%的伤害\r\t^00FF00星光壁障^FFFF00\r抵御伤害:%d\r最多持续8秒\r抵御量随攻击力和属性攻击力增加而提升\r\t^00FF00处女座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发\r^00FF00黄金爆发^FFFF00\r^c0c0ff[锁链迷宫]^FFFF00进阶为^c0c0ff[^fff962魑魅魍魉]^FFFF00\r^c0c0ff[哈迪斯的意志]^FFFF00进阶为^c0c0ff[^fff962雅典娜意志]^FFFF00\r^c0c0ff[恢复之光]^FFFF00进阶为^c0c0ff[^fff962宝轮之光]^FFFF00",
StrDescNum="math.ceil(0.363*level*level+46.634*level+1666.074);math.ceil(0.378*level*level+48.577*level+1735.494);math.ceil((0.015*level+2.400)*100);math.ceil((6.86*player.skilllevel[518]*player.skilllevel[518]+705.8*player.skilllevel[518]+8769+(t1*1.2-(1.716*player.skilllevel[518]*player.skilllevel[518]+389.6*player.skilllevel[518]+3109))*(0.003*player.skilllevel[518]+0.425))*((t7>0)?1.8:1)*((t1>0)?2:1.2)*0.2)",
StrFuncdesc=_t"以降服天魔之力攻击自身周围敌人，对其造成大量伤害\r同时15米范围内的队友将获得星光壁障状态",
}

skill_desc_str[6593]=
{
strName=_t"^fff962魑魅魍魉",
StrAttacktype=_t"主动攻击",
StrMana=_t "^fff962黄金技能\r进阶效果：^c0c0ff伤害提升50%%.\r范围扩大为6米半径\r开始释放时周围的敌人将被吸附至锁链阵的中心\r技能施放期间免疫控制",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加雷属性攻击力:{^FFABFC%d^FFFF00}\r至少造成{^FFABFC%d%%^FFFF00}的伤害\r伤害会受到神威领域和神威值的加成",
StrUseDesc=_t "附加攻击力:%d\r附加雷属性攻击力:%d\r至少造成%d%%的伤害\r伤害会受到神威领域和神威值的加成",
StrDescNum="math.ceil(0.105*player.skilllevel[528]*player.skilllevel[528]+10.87*player.skilllevel[528]+42.47);math.ceil(0.053*player.skilllevel[528]*player.skilllevel[528]+5.475*player.skilllevel[528]+21.38);math.ceil((0.007*player.skilllevel[528]+0.757)*150)",
StrFuncdesc=_t"将6米半径范围内的敌人吸附至锁链阵的中心，同时对其造成伤害.\r^00FF00神恩领域下^A2FFFF\r可连续将范围内的敌方击退并造成少量伤害，减少自身受到伤害50%%.\r^00FF00神威领域下^A2FFFF\r冷却时间降为1秒，释放时如果消耗神威领域值，则造成伤害提升300%%",
SkillSoul={ 
   [1923] = { desc=_t"释放时可使敌人沉默%s秒，此效果触发冷却时间为30秒",num="player.skilllevel[4105]>0 and '6' or '3'"},
   [1929] = { desc=_t"消耗神威领域值减半，但仍能造成很高的伤害。"},
} ,
}

skill_desc_str[6594]=
{
strName=_t"^fff962雅典娜意志",
StrAttacktype=_t"主动祝福",
StrMana=_t "^fff962黄金技能\r进阶效果：^c0c0ff额外获得雅典娜意志状态",
StrCompDesc=_t "^00FF00雅典娜意志^FFFF00\r此状态下领域技能变为快速释放\r但神恩领域下锁链迷宫将不再产生击退效果",
StrUseDesc=_t "^00FF00雅典娜意志^FFFF00\r此状态下领域技能变为快速释放\r但神恩领域下锁链迷宫将不再产生击退效果",
StrFuncdesc=_t"回复满所有的神恩或神威领域值，获得雅典娜意志状态",
}

skill_desc_str[6595]=
{
strName=_t"^fff962宝轮之光",
StrAttacktype=_t"主动祝福",
StrMana=_t "^fff962黄金技能\r进阶效果：^c0c0ff初始回复量大幅提升\r神恩状态下增加神恩领域值",
StrCompDesc=_t "初始回复生命:{^FFABFC%d^FFFF00}\t^00FF00恢复之光^FFFF00\r每秒回复生命:{^FFABFC%d^FFFF00}\r持续8秒\r回复量随攻击力和属性攻击力增加而提升",
StrUseDesc=_t "初始回复生命:%d\t^00FF00恢复之光^FFFF00\r每秒回复生命:%d\r持续8秒\r回复量随攻击力和属性攻击力增加而提升",
StrDescNum="math.ceil((4.305*player.skilllevel[514]*player.skilllevel[514]+216.4*player.skilllevel[514]+1201+(t8*1.2-(4.375*player.skilllevel[514]*player.skilllevel[514]+179.5*player.skilllevel[514]+974.3))*(0.001*player.skilllevel[514]+0.191))*5*((t7>0)?1.8:1)*((t1>0)?2:1.2)*0.2)-1;math.ceil((0.53813*player.skilllevel[514]*player.skilllevel[514]+27.05*player.skilllevel[514]+150.125+(t8*1.2-(4.375*player.skilllevel[514]*player.skilllevel[514]+179.5*player.skilllevel[514]+974.3))*(0.00013*player.skilllevel[514]+0.02388))*((t7>0)?1.8:1)*((t1>0)?2:1.2))-1",
StrFuncdesc=_t"使15米范围内队友立即回复大量生命，并获得恢复之光效果，缓慢回复生命",
SkillSoul={ 
   [1918] = { desc=_t"可使自己和队友的伤害抗性提升5%%"},
   [1922] = { desc=_t"释放时可驱散自身和队友受到的移动控制状态，该效果触发冷却时间为12秒"},
   [4535] = { desc=_t"目标处于共鸣状态下时，初始回复量提升300%%"},
} ,
}

skill_desc_str[6596]=
{
strName=_t"^fff962艾欧里亚的援护",
StrAttacktype=_t"主动祝福",
StrMana=_t "^fff962黄金狮子座技能",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r\t^00FF00艾欧里亚的援护^FFFF00\r伤害抗性提升40%%\r瞬间回复体力值100\r持续5秒\r处于眩晕倒地浮空和沉默状态下也可使用\r\t^00FF00狮子座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发\r^00FF00黄金爆发^FFFF00\r^c0c0ff[凤凰幻动]^FFFF00进阶为^c0c0ff[^fff962狮子搏兔]^FFFF00\r^c0c0ff[火鸟之怒]^FFFF00进阶为^c0c0ff[^fff962狮王怒焰]^FFFF00\r^c0c0ff[死亡皇后之焰]^FFFF00进阶为^c0c0ff[^fff962狮王之影]^FFFF00",
StrUseDesc=_t "附加攻击力:%d\r附加火属性攻击力:%d\r造成%d%%的伤害\r\t^00FF00艾欧里亚的援护^FFFF00\r伤害抗性提升40%%\r瞬间回复体力值100\r持续5秒\r处于眩晕倒地浮空和沉默状态下也可使用\r\t^00FF00狮子座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发\r^00FF00黄金爆发^FFFF00\r^c0c0ff[凤凰幻动]^FFFF00进阶为^c0c0ff[^fff962狮子搏兔]^FFFF00\r^c0c0ff[火鸟之怒]^FFFF00进阶为^c0c0ff[^fff962狮王怒焰]^FFFF00\r^c0c0ff[死亡皇后之焰]^FFFF00进阶为^c0c0ff[^fff962狮王之影]^FFFF00",
StrDescNum="math.ceil(0.363*level*level+46.634*level+1666.074);math.ceil(0.378*level*level+48.577*level+1735.494);math.ceil((0.036*level+5.760)*100)",
StrFuncdesc=_t"黄金圣斗士艾欧里亚赶来保护自己，并将周围敌人击退\r获得艾欧里亚的援护状态",
}

skill_desc_str[6597]=
{
strName=_t"^fff962狮子搏兔",
StrAttacktype=_t"主动祝福",
StrMana=_t "^fff962黄金技能\r",
StrCompDesc=_t "移动距离:15米\r\t^00FF00狮王之盾^FFFF00\r可吸收自身生命上限15%%的伤害\r盾存在期间免疫所有控制效果\r最多持续5秒",
StrUseDesc=_t "移动距离:15米\r\t^00FF00狮王之盾^FFFF00\r可吸收自身生命上限15%%的伤害\r盾存在期间免疫所有控制效果\r最多持续5秒",
StrFuncdesc=_t"变成狮子向前奋力跳跃\r释放时周围的敌人将在4秒内无法移动\r同时自身将获得狮王之盾状态",
SkillSoul={ 
   [1942] = { desc=_t"可立即解除自身的移动控制状态"},
} ,
}

skill_desc_str[6598]=
{
strName=_t"^fff962狮王怒焰",
StrAttacktype=_t"主动攻击",
StrMana=_t "^fff962黄金技能\r进阶效果：^c0c0ff伤害提升100%%，制造一个幻影施放离子电光拳攻击目标及其周围敌人.同时自身获得狮王火焰之力状态",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加火属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r幻影造成{^FFABFC%d%%^FFFF00}的伤害\r目标范围:半径5米圆形区域\t^00FF00狮王火焰之力^FFFF00\r^00FF00凌虐之焰^FFFF00，^00FF00怒火之焰^FFFF00和^00FF00凤凰现临^FFFF00攻击范围扩大为半径5米圆形区域，溅射伤害将获得更大幅度的提升\r持续15秒",
StrUseDesc=_t "附加攻击力:%d\r附加火属性攻击力:%d\r造成%d%%的伤害\r幻影造成%d%%的伤害\r目标范围:半径5米圆形区域\t^00FF00狮王火焰之力^FFFF00\r^00FF00凌虐之焰^FFFF00，^00FF00怒火之焰^FFFF00和^00FF00凤凰现临^FFFF00攻击范围扩大为半径5米圆形区域，溅射伤害将获得更大幅度的提升\r持续15秒",
StrDescNum="math.ceil(0.142*player.skilllevel[1523]*player.skilllevel[1523]+14.66*player.skilllevel[1523]+57.28);math.ceil(0.07*player.skilllevel[1523]*player.skilllevel[1523]+7.244*player.skilllevel[1523]+28.29);math.ceil((0.011*player.skilllevel[1523]+1.277)*2*((player.bufflevel[2392]>0)?2.5:1)*100);math.ceil((0.011*player.skilllevel[1523]+1.277)*1*100)",
StrFuncdesc=_t"召唤凤凰火焰焚烧目标区域.同时制造一个幻影施放电光拳攻击目标及其周围敌人.自己进入狮王火焰之力状态\r对目标附加烈焰焚烧效果",
SkillSoul={ 
   [4541] = { desc=_t"每次施放时在地面上留下一片火焰痕迹，对在痕迹中的敌人造成伤害"},
   [5687] = { desc=_t"对攻击范围内的目标附加黑洞之力状态"},
   [5686] = { desc=_t"%s使自身进入怒焰状态,提高火鸟之怒的伤害，降低火鸟之怒的冷却时间",num="skill_desc_str[1528].strName"},
} ,
}

skill_desc_str[6599]=
{
strName=_t"^fff962狮王之影",
StrAttacktype=_t"召唤技能",
StrMana=_t "^fff962黄金技能\r进阶效果：^c0c0ff召唤出黄金狮子座艾欧里亚之影\r伤害提升100%%，同时可打断目标正在释放的技能",
StrCompDesc=_t "幻像附加攻击力:{^FFABFC%d^FFFF00}\r幻像附加火属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对目标定身:4秒\r幻像最多存在20秒",
StrUseDesc=_t "幻像附加攻击力:%d\r幻像附加火属性攻击力:%d\r造成%d%%的伤害\r对目标定身:4秒\r幻像最多存在20秒",
StrDescNum="math.ceil(0.195*player.skilllevel[1525]*player.skilllevel[1525]+23.03*player.skilllevel[1525]+240.2);math.ceil(0.131*player.skilllevel[1525]*player.skilllevel[1525]+15.56*player.skilllevel[1525]+162.3);math.ceil((0.013*player.skilllevel[1525]+1.536)*100)",
StrFuncdesc=_t"召唤出艾欧里亚之影，用光速拳攻击目标，并打断目标正在释放的技能，被攻击到的人将无法移动",
SkillSoul={ 
   [4543] = { desc=_t"召唤的黑暗凤凰移动速度提升3米/秒，同时击中敌人时伤害提升80%%"},
} ,
}

skill_desc_str[6745]=
{
strName=_t"强化生命枯萎",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s海龙^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^00FF00生命枯萎^FFFF00的持续伤害效果提升一倍",
StrUseDesc=_t "使得^00FF00%s海龙^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^00FF00生命枯萎^FFFF00的持续伤害效果提升一倍",
StrDescNum="player.prof==7 and ''or '^ff0000';skill_desc_str[6511].strName",
StrFuncdesc=_t"^c0c0ff黑暗海龙圣衣星铸等级达到3级时获得^A2FFFF",
}

skill_desc_str[6746]=
{
strName=_t"强化邪恶绽放",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s海龙^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^c0c0ff[%s]^FFFF00造成的伤害值提升100%%",
StrUseDesc=_t "使得^00FF00%s海龙^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^c0c0ff[%s]^FFFF00造成的伤害值提升100%%",
StrDescNum="player.prof==7 and ''or '^ff0000';skill_desc_str[6500].strName;skill_desc_str[6500].strName",
StrFuncdesc=_t"^c0c0ff黑暗海龙圣衣星铸等级达到10级时获得^A2FFFF",
}

skill_desc_str[6747]=
{
strName=_t"强化反物质次元",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s海龙^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^c0c0ff[%s]^FFFF00召唤额外一个魔晶的几率增加50%%，达到100%%",
StrUseDesc=_t "使得^00FF00%s海龙^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^c0c0ff[%s]^FFFF00召唤额外一个魔晶的几率增加50%%，达到100%%",
StrDescNum="player.prof==7 and ''or '^ff0000';skill_desc_str[6502].strName;skill_desc_str[6421].strName",
StrFuncdesc=_t"^c0c0ff黑暗海龙圣衣星铸等级达到16级时获得^A2FFFF",
}

skill_desc_str[6748]=
{
strName=_t"强化弑神之心",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s海龙^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^c0c0ff[%s]^FFFF00的冷却时间减少24秒，变为36秒",
StrUseDesc=_t "使得^00FF00%s海龙^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，^c0c0ff[%s]^FFFF00的冷却时间减少24秒，变为36秒",
StrDescNum="player.prof==7 and ''or '^ff0000';skill_desc_str[6506].strName;skill_desc_str[6506].strName",
StrFuncdesc=_t"^c0c0ff黑暗海龙圣衣星铸等级达到24级时获得^A2FFFF",
}

skill_desc_str[6749]=
{
strName=_t"强化霸王之怒",
StrAttacktype=_t"被动技能",
StrCompDesc=_t "使得^00FF00%s海龙^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，血量低于50%%触发^00FF00霸王之怒^FFFF00效果提升的伤害倍率增加20%%，最终提升40%%伤害倍率。",
StrUseDesc=_t "使得^00FF00%s海龙^FFFF00斗魂^c0c0ff[%s]^FFFF00生效时，血量低于50%%触发^00FF00霸王之怒^FFFF00效果提升的伤害倍率增加20%%，最终提升40%%伤害倍率。",
StrDescNum="player.prof==7 and ''or '^ff0000';skill_desc_str[6509].strName",
StrFuncdesc=_t"^c0c0ff黑暗海龙圣衣星铸等级达到32级时获得^A2FFFF",
}

skill_desc_str[6700]=
{
strName=_t"拉拽",
StrAttacktype=_t"",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"将敌人拉拽至你的身边",
}

skill_desc_str[6701]=
{
strName=_t"离开战车",
StrAttacktype=_t"",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"离开射手战车",
}

skill_desc_str[6703]=
{
strName=_t"离开战车",
StrAttacktype=_t"",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"离开射手战车",
}

skill_desc_str[6704]=
{
strName=_t"离开战车",
StrAttacktype=_t"",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"离开射手战车",
}

skill_desc_str[6705]=
{
strName=_t"离开战车",
StrAttacktype=_t"",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"离开射手战车",
}

skill_desc_str[6706]=
{
strName=_t"离开战车",
StrAttacktype=_t"",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"离开射手战车",
}

skill_desc_str[6707]=
{
strName=_t"离开战车",
StrAttacktype=_t"",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"离开射手战车",
}

skill_desc_str[6750]=
{
strName=_t"^fff962幻龙魔皇拳",
StrAttacktype=_t"主动攻击",
StrMana=_t "^fff962黄金技能\r进阶效果：^c0c0ff对一条直线上的敌人造成伤害并击退.不同信仰造成的效果不同.",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r至少造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r至少造成%d%%的伤害",
StrDescNum="math.ceil(0.399*player.skilllevel[6441]*player.skilllevel[6441]+64.464*player.skilllevel[6441]+1306.246);math.ceil(0.416*player.skilllevel[6441]*player.skilllevel[6441]+67.150*player.skilllevel[6441]+1360.673);math.ceil((0.046*player.skilllevel[6441]+5.930)*120)",
StrFuncdesc=_t"^00FF00恶之信仰^A2FFFF\r恶之力层数越高，伤害越高，\r前3层每层提升20%%伤害倍率\r第4层层提升40%%伤害倍率\r将当前目标击退8米，其他目标击退2米\r^00FF00善之信仰^A2FFFF\r使当前目标进入混乱状态4秒，其他目标击退2米\r",
}

skill_desc_str[6751]=
{
strName=_t"^fff962黄金异次元",
StrAttacktype=_t"主动攻击",
StrMana=_t "^fff962黄金技能\r进阶效果：^c0c0ff使6米范围内的友方单位隐身3秒,对范围内的敌人造成伤害和击退效果.\r",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.113*t2*t2+31.470*t2+1168.337);math.ceil(0.118*t2*t2+32.781*t2+1217.018);math.ceil((0.018*t2+4.659)*100)",
StrFuncdesc=_t"使自己或其他玩家进入异次元空间(对怪物不生效).进入异次元后无法被其他人看到(可被怪物看到)，也无法看到其他人，减免80%%伤害，持续6秒.\r目标进入异次元后添加^c0c0ff[放逐免疫]^A2FFFF状态，无法被再次传入异次元，持续30秒.若对敌人施放，其进入异次元后会被沉默，无法施法.若对自己或友方单位施放.不会被沉默.",
}

skill_desc_str[6752]=
{
strName=_t"^fff962银河星爆",
StrAttacktype=_t"召唤技能",
StrMana=_t "^fff962黄金技能\r进阶效果：^c0c0ff召唤流星雨，造成范围伤害.",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r至少造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r至少造成%d%%的伤害",
StrDescNum="math.ceil(0.410*player.skilllevel[6425]*player.skilllevel[6425]+46.314*player.skilllevel[6425]+168.827);math.ceil(0.427*player.skilllevel[6425]*player.skilllevel[6425]+48.244*player.skilllevel[6425]+175.861);math.ceil((0.023*player.skilllevel[6425]+2.505)*(1+t4*0.1)*100)",
StrFuncdesc=_t"释放时，将逐渐消耗2层恶之力\r对受到^c0c0ff[星辰之怒]^A2FFFF效果影响的敌人造成双倍伤害.为自己附加减伤护盾，减免80%%伤害，持续5秒，此技能开始施放时存在至少一层恶之力，可提高50%%伤害",
}

skill_desc_str[6753]=
{
strName=_t"^fff962大漩涡",
StrAttacktype=_t"主动祝福",
StrMana=_t "^fff962黄金技能\r进阶效果：^c0c0ff召唤一个海底大漩涡吞噬敌人，将敌人拉拽至漩涡中心并减速",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r附加水属性攻击力:{^FFABFC%d^FFFF00}\r至少造成{^FFABFC%d%%^FFFF00}的伤害\r拉拽范围:6米\r\t^00FF00双子座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发\r^00FF00黄金爆发^FFFF00\r^c0c0ff[究极星爆]^FFFF00进阶为^c0c0ff[^fff962银河星爆]^FFFF00\r^c0c0ff[幻胧拳]^FFFF00进阶为^c0c0ff[^fff962幻龙魔皇拳]^FFFF00\r^c0c0ff[黄金三角异次元]^FFFF00进阶为^c0c0ff[^fff962黄金异次元]^FFFF00",
StrUseDesc=_t "附加攻击力:%d\r附加水属性攻击力:%d\r至少造成%d%%的伤害\r拉拽范围:6米\r\t^00FF00双子座进阶^FFFF00\r释放后进入^c0c0ff[黄金爆发]^FFFF00状态\r此状态消耗后30秒内不会再次触发\r^00FF00黄金爆发^FFFF00\r^c0c0ff[究极星爆]^FFFF00进阶为^c0c0ff[^fff962银河星爆]^FFFF00\r^c0c0ff[幻胧拳]^FFFF00进阶为^c0c0ff[^fff962幻龙魔皇拳]^FFFF00\r^c0c0ff[黄金三角异次元]^FFFF00进阶为^c0c0ff[^fff962黄金异次元]^FFFF00",
StrDescNum="math.ceil(0.506*level*level+89.491*level+2822.386);math.ceil(0.527*level*level+93.220*level+2939.985);math.ceil((0.046*level+6.707)*100)",
StrFuncdesc=_t"第一次有100%%几率将敌人拉拽至中心。之后每次伤害都有10%%几率将敌人拉拽至中心。漩涡内的敌人附加减速4米/秒。",
}

skill_desc_str[6765]=
{
strName=_t"善恶随心",
StrAttacktype=_t"主动祝福",
StrMana=_t "海龙达到随心所欲掌控善恶的境界，持续15秒",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"海龙通过使用怜悯/憎恨技能可瞬间将善之力/恶之力的值涨满，无视^c0c0ff[虔诚]^A2FFFF的转换疲劳",
SkillSoul={ 
   [6496] = { desc=_t"冷却时间减少30秒"},
} ,
}

skill_desc_str[6786]=
{
strName=_t"齐发",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"射出多支箭矢，造成伤害.",
}

skill_desc_str[6487]=
{
strName=_t"闪电流星",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);544",
StrFuncdesc=_t"对自身面前120度半径13米的扇形区域造成伤害",
}

skill_desc_str[6488]=
{
strName=_t"弑神黄金箭",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);440",
StrFuncdesc=_t"对自身面前10米的线形区域造成伤害",
}

skill_desc_str[6604]=
{
strName=_t"钻石星辰拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);450",
StrFuncdesc=_t"对自身面前60度半径10米的扇形区域伤害",
}

skill_desc_str[6605]=
{
strName=_t"寒冷的龙卷风",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);432",
StrFuncdesc=_t"对目标周围5米半径区域造成伤害",
}

skill_desc_str[6606]=
{
strName=_t"曙光女神的宽恕",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);1120",
StrFuncdesc=_t"对自身面前13米范围内线形区域造成伤害",
}

skill_desc_str[6607]=
{
strName=_t"闪电离子拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);448",
StrFuncdesc=_t"对自身周围10米半径的圆形区域造成伤害",
}

skill_desc_str[6608]=
{
strName=_t"闪电光束拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);784",
StrFuncdesc=_t"对自身面前13米线形区域造成伤害",
}

skill_desc_str[6609]=
{
strName=_t"闪电光牙",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);336",
StrFuncdesc=_t"对选中目标造成大量伤害",
}

skill_desc_str[6610]=
{
strName=_t"天空霸邪魑魅魍魉",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);432",
StrFuncdesc=_t"对选中范围内的圆形区域造成伤害\r半径5米",
}

skill_desc_str[6611]=
{
strName=_t"天魔降伏",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);1120",
StrFuncdesc=_t"对选中范围内的圆形区域造成伤害\r半径5米",
}

skill_desc_str[6612]=
{
strName=_t"六道轮回",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);896",
StrFuncdesc=_t"对自身周围10米范围内造成伤害",
}

skill_desc_str[6613]=
{
strName=_t"幻胧拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);224",
StrFuncdesc=_t"对自身面前10米范围内线形区域造成伤害",
}

skill_desc_str[6614]=
{
strName=_t"异次元空间",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);288",
StrFuncdesc=_t"对自身周围10米半径的圆形区域造成伤害",
}

skill_desc_str[6615]=
{
strName=_t"银河星爆",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);600",
StrFuncdesc=_t"对自身周围10米半径的圆形区域造成伤害",
}

skill_desc_str[6616]=
{
strName=_t"庐山升龙霸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);168",
StrFuncdesc=_t"对目标周围5米范围内的敌人造成伤害",
}

skill_desc_str[6617]=
{
strName=_t"庐山百龙霸",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);672",
StrFuncdesc=_t"对自身面前60度半径13米的扇形区域伤害",
}

skill_desc_str[6618]=
{
strName=_t"水晶墙",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);288",
StrFuncdesc=_t"对自身面前13米范围内线形区域造成伤害",
}

skill_desc_str[6619]=
{
strName=_t"星屑旋转",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);240",
StrFuncdesc=_t"对选中目标造成伤害",
}

skill_desc_str[6620]=
{
strName=_t"星光灭绝",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);232",
StrFuncdesc=_t"对自身周围10米半径的圆形区域造成伤害",
}

skill_desc_str[6621]=
{
strName=_t"巨型号角",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);320",
StrFuncdesc=_t"对自身面前13米范围内线形区域造成伤害",
}

skill_desc_str[6622]=
{
strName=_t"泰坦新星",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);432",
StrFuncdesc=_t"对自身周围5米半径的圆形区域造成伤害",
}

skill_desc_str[6623]=
{
strName=_t"金牛凝视",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);224",
StrFuncdesc=_t"对选中目标造成伤害",
}

skill_desc_str[6624]=
{
strName=_t"圣剑",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);112",
StrFuncdesc=_t"对自身面前10米范围内线形区域造成伤害",
}

skill_desc_str[6625]=
{
strName=_t"圣剑真空刃",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);336",
StrFuncdesc=_t"对自身面前5米范围内线形区域造成伤害",
}

skill_desc_str[6626]=
{
strName=_t"达摩克利斯",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);320",
StrFuncdesc=_t"对自身周围13米半径的圆形区域造成伤害",
}

skill_desc_str[6627]=
{
strName=_t"积尸气葬魂波",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);168",
StrFuncdesc=_t"没用",
}

skill_desc_str[6628]=
{
strName=_t"积尸气冥界波",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);544",
StrFuncdesc=_t"对自身周围12米半径的圆形区域造成伤害",
}

skill_desc_str[6629]=
{
strName=_t"积尸气鬼苍焰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);480",
StrFuncdesc=_t"对自身周围10米半径的圆形区域造成伤害",
}

skill_desc_str[6630]=
{
strName=_t"毒蝎念动波",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);560",
StrFuncdesc=_t"对选中目标造成伤害",
}

skill_desc_str[6631]=
{
strName=_t"猩红旋风",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);328",
StrFuncdesc=_t"对目标周围5米范围内的敌人造成伤害",
}

skill_desc_str[6632]=
{
strName=_t"猩红毒针",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);0",
StrFuncdesc=_t"没用",
}

skill_desc_str[6633]=
{
strName=_t"皇家恶魔玫瑰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);432",
StrFuncdesc=_t"对自身周围10米半径的圆形区域造成伤害",
}

skill_desc_str[6634]=
{
strName=_t"食人鱼玫瑰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);400",
StrFuncdesc=_t"对自身面前13米范围内线形区域造成伤害",
}

skill_desc_str[6635]=
{
strName=_t"蔷薇黑玫瑰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.04*player.level*player.level+8*player.level+340);360",
StrFuncdesc=_t"对自身面前13米范围内线形区域造成伤害",
}

skill_desc_str[6702]=
{
strName=_t"怪物伤害计时2分钟",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"用这个技能打打10267怪物开始计时\r一共2分钟",
}

skill_desc_str[6461]=
{
strName=_t"闪避",
StrAttacktype=_t"主动祝福",
StrMana=_t "消耗体力值 100",
StrCompDesc=_t "需要SHIFT+方向键或SHIFT+左键点击地面",
StrUseDesc=_t "需要SHIFT+方向键或SHIFT+左键点击地面",
StrFuncdesc=_t"向指定方向瞬间移动8米\r附带1.5秒攻击闪避效果\r在原位置召唤一个分身",
}

skill_desc_str[6462]=
{
strName=_t"格挡",
StrAttacktype=_t"主动祝福",
StrMana=_t "格挡状态下每秒消耗体力 30",
StrCompDesc=_t "需要持续按下Q键施放或鼠标右键持续点下技能\r技能施放快捷键可以系统设置中更改",
StrUseDesc=_t "需要持续按下Q键施放或鼠标右键持续点下技能\r技能施放快捷键可以系统设置中更改",
StrFuncdesc=_t"进入格挡状态\r减少受到伤害80%%",
}

skill_desc_str[6787]=
{
strName=_t"黑暗三角次元",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(2.95*t2*t2+1315*t2+2684);1*(0.017*t2+1.267)*100",
StrFuncdesc=_t"对面前敌人造成大量伤害，并击退他们",
}

skill_desc_str[6738]=
{
strName=_t"天马印记",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"风属性抗性增加15",
}

skill_desc_str[6739]=
{
strName=_t"巨鲸印记",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"水属性抗性增加15",
}

skill_desc_str[6740]=
{
strName=_t"霸王印记",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"地属性抗性增加15",
}

skill_desc_str[6741]=
{
strName=_t"泰坦印记",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"雷属性抗性增加15",
}

skill_desc_str[6742]=
{
strName=_t"凤凰印记",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"火属性抗性增加15",
}

skill_desc_str[6433]=
{
strName=_t"黄金三角次元",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "海飞龙奥义",
StrUseDesc=_t "海飞龙奥义",
}

skill_desc_str[6817]=
{
strName=_t"怪物去死光环",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"开关技能\r开了这个状态以后，周围10米范围内的怪物就会前扑后继的去死\r而且无限回复体力",
}

skill_desc_str[6826]=
{
strName=_t"小宇宙爆发",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6827]=
{
strName=_t"小宇宙爆发",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6822]=
{
strName=_t"小宇宙爆发",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6788]=
{
strName=_t"来自深海的祝福",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"提升水属性攻击力1%%",
}

skill_desc_str[6789]=
{
strName=_t"兄长的教诲",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"伤害抗性提升1%%",
}

skill_desc_str[6797]=
{
strName=_t"无定光辉",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00断翼^FFFF00\r  飞行速度减少2米/秒，持续4秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00断翼^FFFF00\r  飞行速度减少2米/秒，持续4秒",
StrDescNum="math.ceil(0.080*t1*t1+16.000*t1+80.000);math.ceil((0.011*t1+2.389)*100)",
StrFuncdesc=_t"释放神龙的光辉打击敌人，有概率使目标进入^00FF00断翼^A2FFFF状态",
}

skill_desc_str[6798]=
{
strName=_t"龙炎爆裂",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%",
StrDescNum="math.ceil(0.139*t1*t1+27.713*t1+138.564);math.ceil((0.033*t1+7.167)*100)",
StrFuncdesc=_t"释放龙炎火球，接触到目标时发生大爆炸，波及范围5米内的所有敌人",
}

skill_desc_str[6799]=
{
strName=_t"龙之怒",
StrAttacktype=_t"主动攻击",
StrMana=_t "神龙的怒火焚尽一切",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00龙威^FFFF00\r  飞行速度减少7米/秒，持续2秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00龙威^FFFF00\r  飞行速度减少7米/秒，持续2秒",
StrDescNum="math.ceil(0.196*t1*t1+39.192*t1+195.959);math.ceil((0.067*t1+14.333)*100)",
StrFuncdesc=_t"以自身为中心爆发出猛些的火焰，伤害周围8米内所有敌人并使之陷入^00FF00龙威^A2FFFF状态",
}

skill_desc_str[6800]=
{
strName=_t"神龙闪现",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "冲刺距离:15米\r^00FF00龙火献祭^FFFF00\r  不断攻击周围5米范围内的敌人并附加^00FF00灼烧^FFFF00状态，持续5秒\r  附加攻击力:{^FFABFC%d^FFFF00}\r  每秒造成{^FFABFC%d%%^FFFF00}的伤害\r  对地面目标伤害减少50%%\r^00FF00灼烧^FFFF00\r  每秒受到{^FFABFC%d^FFFF00}点灼烧伤害，持续5秒",
StrUseDesc=_t "冲刺距离:15米\r^00FF00龙火献祭^FFFF00\r  不断攻击周围5米范围内的敌人并附加^00FF00灼烧^FFFF00状态，持续5秒\r  附加攻击力:%d\r  每秒造成%d%%的伤害\r  对地面目标伤害减少50%%\r^00FF00灼烧^FFFF00\r  每秒受到%d点灼烧伤害，持续5秒",
StrDescNum="math.ceil(0.139*t1*t1+27.713*t1+138.564);math.ceil((0.033*t1+7.167)*100);math.ceil(t8*0.18*(0.005*t1+1.194))",
StrFuncdesc=_t"向正前方快速冲刺，同时自己获得^00FF00龙火献祭^A2FFFF状态",
}

skill_desc_str[6801]=
{
strName=_t"无定光辉",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00光辉之网^FFFF00\r  对玩家生效，每秒失去{^FFABFC%d^FFFF00}生命，飞行速度减少2米/秒，持续4秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00光辉之网^FFFF00\r  对玩家生效，每秒失去%d生命，飞行速度减少2米/秒，持续4秒",
StrDescNum="math.ceil(0.073*t1*t1+14.517*t1+72.583);math.ceil((0.006*t1+1.226)*100);math.ceil(t8*0.025*(0.005*t1+1.194))",
StrFuncdesc=_t"释放神龙的光辉打击敌人，有概率使目标进入^00FF00光辉之网^A2FFFF状态",
}

skill_desc_str[6802]=
{
strName=_t"苍蓝祝福",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "^00FF00苍蓝祝福^FFFF00\r每秒回复生命:{^FFABFC%d^FFFF00}\r对地面目标效果减少50%%\r最多叠加3次\r^00FF00祝福之光^FFFF00\r伤害倍率增加30%%\r最多叠加3次",
StrUseDesc=_t "^00FF00苍蓝祝福^FFFF00\r每秒回复生命:%d\r对地面目标效果减少50%%\r最多叠加3次\r^00FF00祝福之光^FFFF00\r伤害倍率增加30%%\r最多叠加3次",
StrDescNum="math.ceil((0.096*t1*t1+8.374*t1+41.137+(t8*1.2-(0.516*t1*t1+88.851*t1+367.216))*(0.00009*t1+0.019)))",
StrFuncdesc=_t"对自己或队友施放^00FF00苍蓝祝福^A2FFFF，持续期间持续恢复生命同时增加伤害倍率，对自己施放时，会额外获得^00FF00祝福之光^A2FFFF",
}

skill_desc_str[6803]=
{
strName=_t"神龙转生",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "回复生命:{^FFABFC%d^FFFF00}\r每层状态追加回复量:{^FFABFC%d^FFFF00}\r对地面目标效果减少50%%",
StrUseDesc=_t "回复生命:%d\r每层状态追加回复量:%d\r对地面目标效果减少50%%",
StrDescNum="math.ceil((0.479*t1*t1+41.868*t1+205.685+(t8*1.2-(0.516*t1*t1+88.851*t1+367.216))*(0.00045*t1+0.096)));math.ceil((0.479*t1*t1+41.868*t1+205.685+(t8*1.2-(0.516*t1*t1+88.851*t1+367.216))*(0.00045*t1+0.096)))",
StrFuncdesc=_t"以苍蓝血脉治疗目标，同时根据目标身上的^00FF00苍蓝祝福^A2FFFF层数追加回复量，生效后吞噬目标的^00FF00苍蓝祝福^A2FFFF及^00FF00祝福之光^A2FFFF，只能对队友和自己释放",
}

skill_desc_str[6804]=
{
strName=_t"神龙闪现",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "冲刺距离:15米\r^00FF00生命之血^FFFF00\r  持续自己和治疗周围5米的队友，每秒回复{^FFABFC%d^FFFF00}生命，持续5秒\r  对地面目标效果减少50%%",
StrUseDesc=_t "冲刺距离:15米\r^00FF00生命之血^FFFF00\r  持续自己和治疗周围5米的队友，每秒回复%d生命，持续5秒\r  对地面目标效果减少50%%",
StrDescNum="math.ceil((0.383*t1*t1+33.494*t1+164.548+(t8*1.2-(0.516*t1*t1+88.851*t1+367.216))*(0.00036*t1+0.077)))",
StrFuncdesc=_t"向正前方快速冲刺，同时自己获得^00FF00生命之血^A2FFFF状态",
}

skill_desc_str[6805]=
{
strName=_t"无定光辉",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00光辉惩戒^FFFF00\r  受到光的惩戒无法动弹，持续3秒，无视抗性和穿透效果",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00光辉惩戒^FFFF00\r  受到光的惩戒无法动弹，持续3秒，无视抗性和穿透效果",
StrDescNum="math.ceil(0.071*t1*t1+14.241*t1+71.207);math.ceil((0.009*t1+1.893)*100)",
StrFuncdesc=_t"释放神龙的光辉打击敌人，有概率使目标进入^00FF00光辉惩戒^A2FFFF状态",
}

skill_desc_str[6806]=
{
strName=_t"夜之诅咒",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00暗翼诅咒^FFFF00\r  飞行速度减少4米/秒，持续4秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00暗翼诅咒^FFFF00\r  飞行速度减少4米/秒，持续4秒",
StrDescNum="math.ceil(0.078*t1*t1+15.601*t1+78.003);math.ceil((0.011*t1+2.271)*100)",
StrFuncdesc=_t"凝聚黑夜的力量攻击敌人，并对其附加^00FF00暗翼诅咒^A2FFFF",
}

skill_desc_str[6807]=
{
strName=_t"混乱风暴",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00混乱^FFFF00\r  混乱状态，持续4秒，无视抗性和穿透效果",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00混乱^FFFF00\r  混乱状态，持续4秒，无视抗性和穿透效果",
StrDescNum="math.ceil(0.101*t1*t1+20.140*t1+100.702);math.ceil((0.018*t1+3.785)*100)",
StrFuncdesc=_t"以目标为中心引发一场风暴，5米范围内所有敌人都将陷入^00FF00混乱^A2FFFF状态",
}

skill_desc_str[6808]=
{
strName=_t"神龙闪现",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "冲刺距离:15米\r^00FF00夜幕降临^FFFF00\r  持续诅咒周围5秒范围内的所有敌人，持续5秒\r^00FF00夜幕^FFFF00\r  伤害倍率下降40%%\r  伤害抗性下降20%%",
StrUseDesc=_t "冲刺距离:15米\r^00FF00夜幕降临^FFFF00\r  持续诅咒周围5秒范围内的所有敌人，持续5秒\r^00FF00夜幕^FFFF00\r  伤害倍率下降40%%\r  伤害抗性下降20%%",
StrFuncdesc=_t"向正前方快速冲刺，同时自己获得^00FF00夜幕降临^A2FFFF状态",
}

skill_desc_str[6809]=
{
strName=_t"无定光辉",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00断翼^FFFF00\r  飞行速度减少2米/秒，持续4秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00断翼^FFFF00\r  飞行速度减少2米/秒，持续4秒",
StrDescNum="math.ceil(0.065*t1*t1+12.997*t1+64.984);math.ceil((0.007*t1+1.576)*100)",
StrFuncdesc=_t"释放神龙的光辉打击敌人，有概率使目标进入^00FF00断翼^A2FFFF状态",
}

skill_desc_str[6810]=
{
strName=_t"双生龙锁",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00龙锁^FFFF00\r  如果目标离自己小于10米，则无法移动；如果目标离自己大于10米，则昏迷；持续5秒，无视抗性和穿透效果",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00龙锁^FFFF00\r  如果目标离自己小于10米，则无法移动；如果目标离自己大于10米，则昏迷；持续5秒，无视抗性和穿透效果",
StrDescNum="math.ceil(0.113*t1*t1+22.511*t1+112.555);math.ceil((0.022*t1+4.729)*100)",
StrFuncdesc=_t"向目标施放青龙之锁，造成伤害并附加^00FF00龙锁^A2FFFF状态",
}

skill_desc_str[6811]=
{
strName=_t"青龙云屏",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "^00FF00青龙云屏^FFFF00\r  伤害抗性提高30%%，持续8秒",
StrUseDesc=_t "^00FF00青龙云屏^FFFF00\r  伤害抗性提高30%%，持续8秒",
StrFuncdesc=_t"以自己为中心施放青之云雾，8米范围内被笼罩的队友获得^00FF00青龙云屏^A2FFFF",
}

skill_desc_str[6812]=
{
strName=_t"神龙闪现",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "^00FF00剧毒之源^FFFF00\r  使周围5米范围内的敌人被剧毒影响，持续5秒\r^00FF00剧毒^FFFF00\r  每秒受到{^FFABFC%d^FFFF00}点伤害，持续5秒",
StrUseDesc=_t "^00FF00剧毒之源^FFFF00\r  使周围5米范围内的敌人被剧毒影响，持续5秒\r^00FF00剧毒^FFFF00\r  每秒受到%d点伤害，持续5秒",
StrDescNum="math.ceil(t8*0.125*(0.005*t1+1.194))",
StrFuncdesc=_t"向正前方快速冲刺，同时自己获得^00FF00剧毒之源^A2FFFF状态",
}

skill_desc_str[6831]=
{
strName=_t"无限体力",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"开关技能\r无限回复体力",
}

skill_desc_str[6832]=
{
strName=_t"无敌免控",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"开关技能\r开了以后就无敌免控",
}

skill_desc_str[6833]=
{
strName=_t"脱战",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"使用了以后马上清除怪物对自己的仇恨\r从清仇恨到完全脱战还需要6秒",
}

skill_desc_str[6834]=
{
strName=_t"冥王之怒炫舞跳舞",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"使用后开始跳舞，适用于任何时装",
}

skill_desc_str[6837]=
{
strName=_t"降临！善恶的裁决",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "\t^c0c0ff[恶意裁决]^FFFF00\r撒加的面具降临，对主人攻击的目标发起攻击，对目标周围6米半径范围内的随机3个敌人造成大量伤害，同时使其进入混乱状态，混乱状态下无法移动，最长持续10秒，4秒后可将正在攻击你的恶梦怪物击杀。击杀后混乱状态结束。\r造成伤害%d%%\r^c0c0ff[善意裁决]^FFFF00\r撒加的面具降临使主人受到伤害减少80%%，被攻击10次后状态消失，最多持续12秒，触发时附带解除控制效果（被守护星等攻击也会消耗次数）同时给主人及附近的队友附加善意之盾效果并为其回复生命，善意之盾可抵御一定伤害。\r回复生命：%d\r抵御伤害：%d\t神器效果触发概率与神力值有关",
StrUseDesc=_t "\t^c0c0ff[恶意裁决]^FFFF00\r撒加的面具降临，对主人攻击的目标发起攻击，对目标周围6米半径范围内的随机3个敌人造成大量伤害，同时使其进入混乱状态，混乱状态下无法移动，最长持续10秒，4秒后可将正在攻击你的恶梦怪物击杀。击杀后混乱状态结束。\r造成伤害%d%%\r^c0c0ff[善意裁决]^FFFF00\r撒加的面具降临使主人受到伤害减少80%%，被攻击10次后状态消失，最多持续12秒，触发时附带解除控制效果（被守护星等攻击也会消耗次数）同时给主人及附近的队友附加善意之盾效果并为其回复生命，善意之盾可抵御一定伤害。\r回复生命：%d\r抵御伤害：%d\t神器效果触发概率与神力值有关",
StrDescNum="(1.2+(player.level-1)*0.00558)*2*100;((2.142*player.level*player.level+182.071*player.level+826.7+(t8*1.2-(1.126*player.level*player.level+68.193*player.level+417.626))*(0.002*player.level+0.369)));((2.142*player.level*player.level+182.071*player.level+826.7+(t8*1.2-(1.126*player.level*player.level+68.193*player.level+417.626))*(0.002*player.level+0.369))*0.2)",
StrFuncdesc=_t"使用后获得善恶面具的祝福，战斗中有概率触发^c0c0ff[善意裁决]^A2FFFF或^c0c0ff[恶意裁决]^A2FFFF效果",
}

skill_desc_str[6899]=
{
strName=_t"测试潜行效果技能10分钟",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6900]=
{
strName=_t"测试潜行加装死效果技能10分钟",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6901]=
{
strName=_t"测试潜行效果技能1分钟",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6902]=
{
strName=_t"测试潜行效果技能2分钟",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6903]=
{
strName=_t"测试潜行效果技能5分钟",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
}

skill_desc_str[6923]=
{
strName=_t"黑暗三角次元",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%伤害",
StrDescNum="(2.95*t2*t2+1315*t2+2684);1*(0.017*t2+1.267)*100",
StrFuncdesc=_t"对面前敌人造成大量伤害，并击退他们",
}

skill_desc_str[6886]=
{
strName=_t"慈悲",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.312*t1*t1+30.888*t1+62.478);math.ceil((0.148*t1+15.812)*100)",
StrFuncdesc=_t"对自身周围10米半径的圆形区域造成伤害",
}

skill_desc_str[6887]=
{
strName=_t"天威",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.312*t1*t1+30.888*t1+62.478);math.ceil((0.036*t1+3.840)*100)",
StrFuncdesc=_t"对自身面前10米范围内线形区域造成伤害",
}

skill_desc_str[6888]=
{
strName=_t"神裁",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.312*t1*t1+30.888*t1+62.478);math.ceil((0.087*t1+9.261)*100)",
StrFuncdesc=_t"对自身周围10米半径的圆形区域造成伤害",
}

skill_desc_str[6889]=
{
strName=_t"恐怖天命",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.304*t1*t1+30.096*t1+60.876);math.ceil((0.070*t1+7.490)*100)",
StrFuncdesc=_t"对自身面前160度半径10米的扇形区域伤害",
}

skill_desc_str[6890]=
{
strName=_t"神之通道",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.304*t1*t1+30.096*t1+60.876);math.ceil((0.100*t1+10.700)*100)",
StrFuncdesc=_t"对选中目标造成伤害",
}

skill_desc_str[6891]=
{
strName=_t"无形意志",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.304*t1*t1+30.096*t1+60.876);math.ceil((0.171*t1+18.189)*100)",
StrFuncdesc=_t"对自身周围10米半径的圆形区域造成伤害",
}

skill_desc_str[6892]=
{
strName=_t"魔龙冲撞",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.294*t1*t1+29.146*t1+58.954);math.ceil((0.102*t1+10.914)*100)",
StrFuncdesc=_t"对自身面前90度半径10米的扇形区域伤害",
}

skill_desc_str[6893]=
{
strName=_t"最大警告",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.294*t1*t1+29.146*t1+58.954);math.ceil((0.063*t1+6.669)*100)",
StrFuncdesc=_t"对自身面前10米范围内线形区域造成伤害",
}

skill_desc_str[6894]=
{
strName=_t"轰鸣飞翔",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.294*t1*t1+29.146*t1+58.954);math.ceil((0.142*t1+15.158)*100)",
StrFuncdesc=_t"对目标周围6米半径的圆形区域造成伤害",
}

skill_desc_str[6895]=
{
strName=_t"星辰傀儡线",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.294*t1*t1+29.146*t1+58.954);math.ceil((0.076*t1+8.084)*100)",
StrFuncdesc=_t"对目标周围3米半径的圆形区域造成伤害",
}

skill_desc_str[6896]=
{
strName=_t"巨翼翔风",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.294*t1*t1+29.146*t1+58.954);math.ceil((0.201*t1+21.423)*100)",
StrFuncdesc=_t"对自身周围10米半径的圆形区域造成伤害",
}

skill_desc_str[6897]=
{
strName=_t"天鹫喷射风",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.294*t1*t1+29.146*t1+58.954);math.ceil((0.076*t1+8.084)*100)",
StrFuncdesc=_t"对自身面前120度半径10米的扇形区域伤害",
}

skill_desc_str[6898]=
{
strName=_t"宇宙大幻觉",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害",
StrDescNum="math.ceil(0.294*t1*t1+29.146*t1+58.954);math.ceil((0.070*t1+7.478)*100)",
StrFuncdesc=_t"对自身周围10米半径的圆形区域造成伤害",
}

skill_desc_str[6828]=
{
strName=_t"分裂信仰",
StrAttacktype=_t"主动祝福",
StrMana=_t "海龙的另一个人格忽然显现",
StrCompDesc=_t "状态最多持续10秒",
StrUseDesc=_t "状态最多持续10秒",
StrFuncdesc=_t"你的下个技能(^00FF00毁灭双子星^A2FFFF，^00FF00海龙之影^A2FFFF，^00FF00神之化身^A2FFFF，^00FF00星云海啸^A2FFFF，^00FF00黄道喷发^A2FFFF，^00FF00幻胧拳^A2FFFF)违背当前信仰.技能效果为另一个信仰的效果.不会改变当前的善之力/恶之力",
}

skill_desc_str[6965]=
{
strName=_t"深红飞弹",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00不稳定灼热^FFFF00\r  每秒受到{^FFABFC%d^FFFF00}点伤害，持续3秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00不稳定灼热^FFFF00\r  每秒受到%d点伤害，持续3秒",
StrDescNum="math.ceil(0.098*t1*t1+19.596*t1+97.980);math.ceil((0.008*t1+1.792)*100);math.ceil(t8*0.029*(0.005*t1+1.493))",
StrFuncdesc=_t"对目标发射深红飞弹，造成伤害并附加^00FF00不稳定灼热^A2FFFF状态，如果目标带有^00FF00不稳定冰寒^A2FFFF则引发一次爆炸，伤害变为2倍",
}

skill_desc_str[6966]=
{
strName=_t"幽蓝飞弹",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00不稳定冰寒^FFFF00\r  飞行和移动速度减少1m/s，持续3秒\r^00FF00冻结^FFFF00\r  被冰封，无法行动，持续3秒\r^00FF00不稳定温度^FFFF00\r  混乱的温度，免疫幽蓝飞弹造成的冻结，持续30秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00不稳定冰寒^FFFF00\r  飞行和移动速度减少1m/s，持续3秒\r^00FF00冻结^FFFF00\r  被冰封，无法行动，持续3秒\r^00FF00不稳定温度^FFFF00\r  混乱的温度，免疫幽蓝飞弹造成的冻结，持续30秒",
StrDescNum="math.ceil(0.069*t1*t1+13.856*t1+69.282);math.ceil((0.008*t1+1.792)*100)",
StrFuncdesc=_t"对目标发射幽蓝飞弹，造成伤害并附加^00FF00不稳定冰寒^A2FFFF状态，如果目标带有^00FF00不稳定灼热^A2FFFF则将其^00FF00冻结^A2FFFF，同时目标进入^00FF00不稳定温度^A2FFFF状态",
}

skill_desc_str[6967]=
{
strName=_t"冰火冲击",
StrAttacktype=_t"主动攻击",
StrMana=_t "深红和幽蓝赐予你死亡",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00不稳定灼热^FFFF00\r  每秒受到{^FFABFC%d^FFFF00}点伤害，持续5秒\r^00FF00不稳定冰寒^FFFF00\r  飞行和移动速度减少1m/s，持续5秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00不稳定灼热^FFFF00\r  每秒受到%d点伤害，持续5秒\r^00FF00不稳定冰寒^FFFF00\r  飞行和移动速度减少1m/s，持续5秒",
StrDescNum="math.ceil(0.120*t1*t1+24.000*t1+120.000);math.ceil((0.025*t1+5.375)*100);math.ceil(t8*0.029*(0.005*t1+1.493))",
StrFuncdesc=_t"同时用深红激光和幽蓝激光冲击目标及其周围6米范围内的所有敌人，造成巨大的伤害并附加^00FF00不稳定灼热^A2FFFF和^00FF00不稳定冰寒^A2FFFF状态",
}

skill_desc_str[6968]=
{
strName=_t"空间折叠",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "^00FF00空间护盾^FFFF00\r  伤害抗性增加50%%，持续5秒",
StrUseDesc=_t "^00FF00空间护盾^FFFF00\r  伤害抗性增加50%%，持续5秒",
StrFuncdesc=_t"穿过空间，闪现到正前方15米处，并为自己附加^00FF00空间护盾^A2FFFF状态",
}

skill_desc_str[6969]=
{
strName=_t"眩光飞弹",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00眩光^FFFF00\r  飞行速度减少0。7m/s，可以叠加5层，持续4秒\r^00FF00致盲^FFFF00\r  命中降为0且免疫^00FF00眩光^FFFF00，持续4秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00眩光^FFFF00\r  飞行速度减少0。7m/s，可以叠加5层，持续4秒\r^00FF00致盲^FFFF00\r  命中降为0且免疫^00FF00眩光^FFFF00，持续4秒",
StrDescNum="math.ceil(0.066*t1*t1+13.212*t1+66.058);math.ceil((0.008*t1+1.629)*100)",
StrFuncdesc=_t"对目标发射眩光飞弹，造成伤害并附加^00FF00眩光^A2FFFF状态，此状态堆叠到5层时，会将目标^00FF00致盲^A2FFFF",
}

skill_desc_str[6970]=
{
strName=_t"束缚之光",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00光之束缚^FFFF00\r  被强烈的光芒吸附，无法移动，持续4秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00光之束缚^FFFF00\r  被强烈的光芒吸附，无法移动，持续4秒",
StrDescNum="math.ceil(0.148*t1*t1+29.542*t1+147.710);math.ceil((0.038*t1+8.144)*100)",
StrFuncdesc=_t"发射束缚之光，击中目标引起爆炸，波及周围6米范围的所有敌人，使之进入^00FF00光之束缚^A2FFFF状态",
}

skill_desc_str[6971]=
{
strName=_t"忏悔之光",
StrAttacktype=_t"主动攻击",
StrMana=_t "在光的面前忏悔吧",
StrCompDesc=_t "附加攻击力:{^FFABFC%d^FFFF00}\r造成{^FFABFC%d%%^FFFF00}的伤害\r对地面目标伤害减少50%%\r^00FF00光辉惩戒^FFFF00\r  受到光的惩戒无法动弹，持续3秒，无视抗性和穿透效果\r^00FF00光之忏悔^FFFF00\r  暴击率降低为0，持续8秒",
StrUseDesc=_t "附加攻击力:%d\r造成%d%%的伤害\r对地面目标伤害减少50%%\r^00FF00光辉惩戒^FFFF00\r  受到光的惩戒无法动弹，持续3秒，无视抗性和穿透效果\r^00FF00光之忏悔^FFFF00\r  暴击率降低为0，持续8秒",
StrDescNum="math.ceil(0.093*t1*t1+18.684*t1+93.420);math.ceil((0.015*t1+3.258)*100)",
StrFuncdesc=_t"发射忏悔之光，击中目标引起爆炸，波及周围6米范围的所有敌人，使之进入^00FF00光辉惩戒^A2FFFF和^00FF00光之忏悔^A2FFFF状态",
}

skill_desc_str[6972]=
{
strName=_t"空间折叠",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "^00FF00空间护盾^FFFF00\r  伤害抗性增加50%%，持续5秒",
StrUseDesc=_t "^00FF00空间护盾^FFFF00\r  伤害抗性增加50%%，持续5秒",
StrFuncdesc=_t"穿过空间，闪现到正前方15米处，并为自己附加^00FF00空间护盾^A2FFFF状态",
}

skill_desc_str[1640]=
{
strName=_t"紫炎",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"普通攻击，有小概率使僵尸定身",
}

skill_desc_str[1641]=
{
strName=_t"紫炎乱舞",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"强力攻击，有较大概率使僵尸定身",
}

skill_desc_str[1642]=
{
strName=_t"紫炎聚集",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"控制技能，定身僵尸",
}

skill_desc_str[1645]=
{
strName=_t"鬼苍焰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"普通攻击，有小概率使僵尸定身",
}

skill_desc_str[1646]=
{
strName=_t"大鬼苍焰",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"强力攻击，有较大概率使僵尸定身",
}

skill_desc_str[1647]=
{
strName=_t"苍焰爆破",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"控制技能，定身僵尸",
}

skill_desc_str[1650]=
{
strName=_t"鬼爪",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"普通攻击，会感染人类",
}

skill_desc_str[1651]=
{
strName=_t"鬼跳",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向前跳跃一小段距离",
}

skill_desc_str[1652]=
{
strName=_t"鬼隐",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"隐身一段时间",
}

skill_desc_str[1654]=
{
strName=_t"鬼爪",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"普通攻击，会感染人类",
}

skill_desc_str[1655]=
{
strName=_t"喷血",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"喷出一口老血感染人类",
}

skill_desc_str[1656]=
{
strName=_t"鬼隐",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"隐身一段时间",
}

skill_desc_str[1657]=
{
strName=_t"浴血",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"浑身浴血，可以在一段时间内抵抗人类的净化",
}

skill_desc_str[6925]=
{
strName=_t"降临！巨蟹之钳",
StrAttacktype=_t"",
StrCompDesc=_t "\t^c0c0ff[巨蟹钳杀]^FFFF00\r巨蟹之钳降临对主人攻击的目标发起攻击，对目标以及周围3米半径造成大量伤害，(天马，天龙，仙女)召唤的巨蟹会将目标拉拽至跟前，(白鸟，凤凰，海龙)召唤的巨蟹会将目标击退，被拉拽/击退的目标4秒内无法施法。3米范围内的所有敌人会持续掉血及减速3米，每秒造成至少1%%目标最大生命值的伤害。目标血量越低，伤害越高，最多可达3%%最大生命值的伤害。\r造成伤害%d%%\r^c0c0ff[巨蟹守护]^FFFF00\r巨蟹之钳降临使攻击主人的目标被变成螃蟹6秒，同时主人受到伤害减少80%%，被攻击10次后状态消失，最多持续12秒，触发时附带解除控制效果（被守护星等攻击也会消耗次数）\t神器效果触发概率与神力值有关",
StrUseDesc=_t "\t^c0c0ff[巨蟹钳杀]^FFFF00\r巨蟹之钳降临对主人攻击的目标发起攻击，对目标以及周围3米半径造成大量伤害，(天马，天龙，仙女)召唤的巨蟹会将目标拉拽至跟前，(白鸟，凤凰，海龙)召唤的巨蟹会将目标击退，被拉拽/击退的目标4秒内无法施法。3米范围内的所有敌人会持续掉血及减速3米，每秒造成至少1%%目标最大生命值的伤害。目标血量越低，伤害越高，最多可达3%%最大生命值的伤害。\r造成伤害%d%%\r^c0c0ff[巨蟹守护]^FFFF00\r巨蟹之钳降临使攻击主人的目标被变成螃蟹6秒，同时主人受到伤害减少80%%，被攻击10次后状态消失，最多持续12秒，触发时附带解除控制效果（被守护星等攻击也会消耗次数）\t神器效果触发概率与神力值有关",
StrDescNum="(1.2+(player.level-1)*0.00558)*2*100",
StrFuncdesc=_t"使用后获得巨蟹之钳的祝福，战斗中有概率触发^c0c0ff[巨蟹钳杀]^A2FFFF或^c0c0ff[巨蟹祝福]^A2FFFF效果",
}

skill_desc_str[6936]=
{
strName=_t"射击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向敌人开火。",
}

skill_desc_str[6937]=
{
strName=_t"雷达",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"利用雷达可以侦查自己一定范围的隐形单位。\r雷达非常容易过热，短时间内频繁使用就会处于过热状态。\r雷达对于处于隐身中的敌人往往具有意想不到的效果。",
}

skill_desc_str[6938]=
{
strName=_t"燃烧弹",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"使你的敌人陷入灼烧的状态，当累积使用一定次数的燃烧弹，还会获得一个额外效果。",
}

skill_desc_str[6939]=
{
strName=_t"冰冻地雷",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"安放一个冰冻地雷，它可以冻伤一定范围的敌人，当累积使用一定次数的冰冻地雷，还会获得一个额外效果。\r冰冻地雷具有反隐效果。",
}

skill_desc_str[6940]=
{
strName=_t"钢铁武装",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"使你获得一个免伤的状态，当累积使用一定次数的钢铁武装，还会获得一个额外效果。",
}

skill_desc_str[6941]=
{
strName=_t"致盲弹",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"使你的敌人陷入黑暗的状态，当累积使用一定次数的致盲弹，还会获得一个额外效果。",
}

skill_desc_str[6942]=
{
strName=_t"充能",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"恢复队友少量生命，当充能达到一定程度，会使被充能者获得“充能无敌”的状态，免疫一切伤害和控制。\r充能侠无法获得“充能无敌”的状态。\r此技能不能对自己使用。",
}

skill_desc_str[6943]=
{
strName=_t"暗杀姿态",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"使自身进入暗杀的阴影之中，在此状态下，暗影侠的暗沙拳将会让敌人一击毙命。\r任何雷达和伤害都会让暗影侠失去暗杀姿态。",
}

skill_desc_str[6944]=
{
strName=_t"暗沙拳",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"配合暗杀姿态使用的高级黑暗格斗技。\r如若没有进入暗杀姿态，这只是一个中看不中用的招式。",
}

skill_desc_str[6962]=
{
strName=_t"防护罩",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"开启一个防护罩，帮助抵消部分伤害。",
}

skill_desc_str[6988]=
{
strName=_t"射击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向敌人开火。",
}

skill_desc_str[6989]=
{
strName=_t"射击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向敌人开火。",
}

skill_desc_str[6990]=
{
strName=_t"射击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向敌人开火。",
}

skill_desc_str[6991]=
{
strName=_t"射击",
StrAttacktype=_t"主动攻击",
StrCompDesc=_t "",
StrUseDesc=_t "",
StrFuncdesc=_t"向敌人开火。",
}

skill_desc_str[7039]=
{
strName=_t"天马印记II",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "伤害抗性提升40%%\r风属性抗性增加15\r持续6秒",
StrUseDesc=_t "伤害抗性提升40%%\r风属性抗性增加15\r持续6秒",
}

skill_desc_str[7040]=
{
strName=_t"巨鲸印记II",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "伤害抗性提升40%%\r水属性抗性增加15\r持续6秒",
StrUseDesc=_t "伤害抗性提升40%%\r水属性抗性增加15\r持续6秒",
}

skill_desc_str[7041]=
{
strName=_t"霸王印记II",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "伤害抗性提升40%%\r地属性抗性增加15\r持续6秒",
StrUseDesc=_t "伤害抗性提升40%%\r地属性抗性增加15\r持续6秒",
}

skill_desc_str[7042]=
{
strName=_t"泰坦印记II",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "伤害抗性提升40%%\r雷属性抗性增加15\r持续6秒",
StrUseDesc=_t "伤害抗性提升40%%\r雷属性抗性增加15\r持续6秒",
}

skill_desc_str[7043]=
{
strName=_t"凤凰印记II",
StrAttacktype=_t"主动祝福",
StrCompDesc=_t "伤害抗性提升40%%\r火属性抗性增加15\r持续6秒",
StrUseDesc=_t "伤害抗性提升40%%\r火属性抗性增加15\r持续6秒",
}
