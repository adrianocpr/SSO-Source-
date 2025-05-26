--[[ @i18n animation ]]
local _t = require("i18n").context("animation")
--------------------------------------------
-- 动画播放相关配置
-- Created by Fengbo
--[[
在本文件中可以定义各种事件发生时，动画播放方式的相关配置。
事件发生时，将依次执行配置中指定的动作。
目前可以使用的动作包括：

play(id)					以默认方式播放动画，相当于show_mask, screen_fade_out,
							load_animation, screen_fade_in, hide_mask的组合

black_screen(duration)		持续黑屏一段时间，duration不填默认为5000
chapter(chapter, title, text, duration)		显示章信息，包含了显示黑边的过程。duration不填默认为3000
section(chapter, section, text, duration)	显示节信息，包含了显示黑边的过程。duration不填默认为3000
show_curtain_text{duration=5000, can_esc=true, "text1", ... , "textN"}	显示多行渐入文字，需要在黑屏的状态下使用，
															duration为所有文字总共的显示时间（可选），默认为每行文字显示1秒
															can_esc为可选项，默认为true
curtain_text{duration=5000, can_esc=true, m"text1", ... , "textN"}		逐渐变为黑屏并显示多行渐入文字，包含了显示黑边的过程。
															duration为所有文字总共的显示时间（可选），默认为每行文字显示1秒
															相当于show_mask, screen_fade_out, show_curtain_text,
															screen_fade_in, hide_mask的组合。通常单独使用
central_message(msg)		屏幕中央的通知区域显示提示文字信息（注意：在有黑边的状态下无效）

show_mask()					显示上下黑边（带动画效果）
hide_mask()					隐藏上下黑边（带动画效果）
screen_fade_in()			屏幕逐渐由黑屏恢复正常
screen_fade_out()			屏幕逐渐变黑
wait(time)					等待time毫秒。time不填默认为1000

instant_black_screen()		屏幕立即黑屏(注意：需和其它动作组合，否则黑屏会一直持续)
load_animation(id)			开始动画（一般需要和其他动作组合）

award()						通知服务器发放任务奖励。配合任务编辑器中“发放奖励前等待客户端通知”功能使用
trig(task_id)				通知服务器触发任务。任务需勾选“允许客户端手动触发”，并建议该任务具有较为严格的任务条件，并且没有极品奖励。
wait_for_teleport()			等待玩家传送结束。一般需配合award()使用。
auto_move_to{x=1, y=2, z=3, map=50}			开始自动寻径到某个位置。若参数map指定的地图id不是当前地图，则忽略此次寻径
auto_move_to(templ_id)		根据模板templ_id开始自动寻径到某个位置。若该寻径跨地图则忽略

play_smart_camera(id)		播放smart_camera。参见smart_camera_config.lua的配置

start_post_effect(effect_name)	开始屏幕后处理特效。使用后必须在之后调用end_post_effect()结束。
							effect_name的取值可包括：
							-------------------------------
							old_time				怀旧老照片
							death					死亡
							keep_blue				突出蓝色，其余颜色为灰度
							inverse					反色效果
							gray					灰度效果
							warp 					水下扭曲
							warp(scale, speed) 		带参数的水下扭曲，scale为扭曲程度(0~0.1)，speed为扭曲速度(0~4)
							dream					梦境
							blood					僵尸视角
							-------------------------------
end_post_effect()			结束屏幕后处理特效
post_effect(effect_name, 1000) 	相当于start_post_effect, end_post_effect的组合，屏幕后处理特效开启一定时间后自动结束。

play_gfx(file_path)			在玩家所在座标处播放gfx。file_path为gfx文件路径，以屏幕振动为例：play_gfx("振动.gfx")

use_normal_stage = true		不使用动画UI舞台（主界面不会隐藏，玩家可自由移动）

--------------------------------------------
支持的事件包括：
on_quest_deliver				任务发放
on_quest_award					任务完成发奖
on_quest_failed					任务失败
on_change_instance				切换场景（最开始加入instant_black_screen()可以防止进入场景后会先闪现一下游戏场景）
on_change_instance_first_time	第一次切换场景
on_use_item						使用物品
on_gather_start					开始采矿
on_gather_success				采矿成功（对同一个矿来说，on_gather_start和on_gather_success最好仅使用其中一个，并且一定不要和矿物模板中的镜头配置同时使用）
--]]
--------------------------------------------
on_quest_award[1292] =             ----------测试播漫画
{
	load_animation(4101),
}

on_quest_deliver[1131] =             ----------测试屏幕处理特效
{
	use_normal_stage = true,
	post_effect("old_time", 10000),
}

on_quest_deliver[1130] =             ----------测试屏幕处理特效
{
	use_normal_stage = true,
	post_effect("death", 10000),
}

on_quest_deliver[1436] =             ----------测试屏幕处理特效
{
	post_effect("keep_blue", 10000),
}

on_quest_deliver[3] =             ----------测试屏幕处理特效
{
	post_effect("inverse", 10000),
}

on_quest_deliver[1290] =             ----------测试屏幕处理特效
{
	post_effect("gray", 10000),
}

on_quest_deliver[1291] =             ----------测试屏幕处理特效
{
	post_effect("warp", 10000),
}


--------------------------------------------
-- 小黑屋
--------------------------------------------

on_change_instance_first_time[50] =        -----------播放圣战漫画
{
	instant_black_screen(),
	show_mask(),
	load_animation(4000),
	show_curtain_text{duration=6000,_t"希望的少年啊！",_t"聚集到雅典娜的身边吧！",""},
	load_animation(1007),    --小黑屋动画
	instant_black_screen(),
	screen_fade_out(),
	award(2057),             --发奖（勾选了“发放奖励前等待客户端通知”）
	wait(1000),
	screen_fade_in(),
	hide_mask(),
}

on_quest_award[7299] =             ----------召唤5小强镜头
{
	play_smart_camera(58),
}

on_quest_award[951] =             ----------选职业任务
{
	screen_fade_out(),       --黑屏渐入
	wait(2000),              --等待传送
    award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
	wait(1000),              --等待传送
	screen_fade_in(),        --黑屏渐出
}

on_change_instance[41] =        -----------修行地动画任务-天马
{
	instant_black_screen(),
	trig(3558),
	wait(1000),
}

on_quest_award[3558] =             ----------修行地动画播放-天马
{
	instant_black_screen(),
	show_mask(),
	screen_fade_out(),
	load_animation(1002),
	screen_fade_in(),
	instant_black_screen(),
	award(),
	wait(1000),
}

on_change_instance[42] =        -----------修行地动画任务-白鸟
{
	instant_black_screen(),
	trig(5702),
	wait(1000),
}

on_quest_award[5702] =             ----------修行地动画播放-白鸟
{
	instant_black_screen(),
	show_mask(),
	screen_fade_out(),
	load_animation(1002),
	screen_fade_in(),
	instant_black_screen(),
	award(),
	wait(1000),
}

on_change_instance[43] =        -----------修行地动画任务-天龙
{
	instant_black_screen(),
	trig(5703),
	wait(1000),
}

on_quest_award[5703] =             ----------修行地动画播放-天龙
{
	instant_black_screen(),
	show_mask(),
	screen_fade_out(),
	load_animation(1002),
	screen_fade_in(),
	instant_black_screen(),
	award(),
	wait(1000),
}

on_change_instance[44] =        -----------修行地动画任务-仙女
{
	instant_black_screen(),
	trig(5704),
	wait(1000),
}

on_quest_award[5704] =             ----------修行地动画播放-仙女
{
	instant_black_screen(),
	show_mask(),
	screen_fade_out(),
	load_animation(1002),
	screen_fade_in(),
	instant_black_screen(),
	award(),
	wait(1000),
}

on_change_instance[45] =        -----------修行地动画任务-凤凰
{
	instant_black_screen(),
	trig(5705),
	wait(1000),
}

on_quest_award[5705] =             ----------修行地动画播放-凤凰
{
	instant_black_screen(),
	show_mask(),
	screen_fade_out(),
	load_animation(1002),
	screen_fade_in(),
	instant_black_screen(),
	award(),
	wait(1000),
}

on_change_instance[65] =        -----------修行地动画任务-海龙
{
	instant_black_screen(),
	trig(12667),
	wait(1000),
}

on_quest_award[12667] =             ----------修行地动画播放-海龙
{
	instant_black_screen(),
	show_mask(),
	screen_fade_out(),
	load_animation(1002),
	screen_fade_in(),
	instant_black_screen(),
	award(),
	wait(1000),
}


--------------------------------------------
-- 新手村
--------------------------------------------

on_change_instance_first_time[1] =             ----------第1卷
{
	instant_black_screen(),
	play(1010),
	chapter(_t"第 一 卷",_t"启程！圣斗士的传说！","")  -------卷名
}

on_quest_deliver[2975] =             ----------第一卷1话名
{
	section(_t"第一卷 启程！圣斗士的传说！",_t"第 1 话  圣衣！竞技场的死斗！","")   -------话名
}

on_quest_deliver[2976] =             ----------小宇宙的奥秘-动画
{
	show_mask(),
	screen_fade_out(),       --黑屏渐入
    load_animation(1006),
	screen_fade_in(),        --黑屏渐出
	hide_mask(),
}

on_quest_deliver[3524] =             ----------玩家pk艾德-屏幕喊话
{
	use_normal_stage = true,	-- 不使用动画舞台
	central_message(_t"快！点击爆发按钮，爆发你的小宇宙！"),
	wait(3000),
	central_message(_t"快！点击爆发按钮，爆发你的小宇宙！"),
}

on_quest_award[4292] =             ----------开始！圣衣竞技赛-播放动画+动态漫画
{
	show_mask(),
    play_smart_camera(36),
	instant_black_screen(),
	screen_fade_out(),       --黑屏渐入
	load_animation(4001),
	screen_fade_in(),        --黑屏渐出
	hide_mask(),
}
on_quest_award[12254] =             ----------开始！圣衣竞技赛-播放动画+动态漫画
{
	show_mask(),
    play_smart_camera(36),
	instant_black_screen(),
	screen_fade_out(),       --黑屏渐入
	load_animation(4001),
	screen_fade_in(),        --黑屏渐出
	hide_mask(),
}
on_quest_award[5834] =             ----------公布！竞技赛名单-调用镜头
{
    show_mask(),
	play_smart_camera(57),
	hide_mask(),
}

on_quest_award[3004] =             ----------去训练地-调用镜头
{
    show_mask(),
	play_smart_camera(18),
	hide_mask(),
}
on_quest_award[3020] =             ----------圣战之墙-调用镜头
{
	play_smart_camera(19),
}
on_quest_award[6962] =             ----------逃离圣域-调用镜头
{
    show_mask(),
	play_smart_camera(53),
	hide_mask(),
}

on_quest_deliver[3002] =             ----------漫画-莎尔娜VS星矢
{
	screen_fade_out(),       --黑屏渐入
	load_animation(4002),
	screen_fade_in(),        --黑屏渐出
}

on_quest_deliver[12186] =             ----------漫画-莎尔娜VS星矢
{
	screen_fade_out(),       --黑屏渐入
	load_animation(4002),
	screen_fade_in(),        --黑屏渐出
}

on_quest_award[3336] =             ----------第1话黑屏文字+第1卷2话名
{
	screen_fade_out(),       --黑屏渐入
	instant_black_screen(),
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
	wait(1000),              --等待传送
	screen_fade_in(),        --黑屏渐出
	section(_t"第一卷 启程！圣斗士的传说！",_t"第 2 话  爆发！小宇宙第六感！","")
}

on_quest_award[3448] =             ----------第二小结-黑屏文字
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=10000, _t"星矢",_t"希望你可以找到你的姐姐",_t"可惜我现在还不能离开圣域",_t"新的圣战即将来临",_t"冥界已经蠢蠢欲动",_t"我必须留在圣域战斗",_t"把艾德的那一份一起",_t"战斗下去",},
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[3490] =             ----------玩家与老鹰-动画
{
    show_mask(),
	load_animation(1003),
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
	hide_mask(),
}

on_quest_deliver[2986] =            -----------圣衣争夺战开始-天马
{
	section(_t"第一卷 启程！圣斗士的传说！",_t"开始！圣衣争夺战！"),   -------话名
}
on_quest_deliver[4468] =            -----------圣衣争夺战开始-白鸟
{
	section(_t"第一卷 启程！圣斗士的传说！",_t"开始！圣衣争夺战！"),   -------话名   
}
on_quest_deliver[4469] =            -----------圣衣争夺战开始-天龙
{
	section(_t"第一卷 启程！圣斗士的传说！",_t"开始！圣衣争夺战！"),   -------话名  
}
on_quest_deliver[4470] =            -----------圣衣争夺战开始-仙女
{
	section(_t"第一卷 启程！圣斗士的传说！",_t"开始！圣衣争夺战！"),   -------话名  
}
on_quest_deliver[4471] =            -----------圣衣争夺战开始-凤凰
{
	section(_t"第一卷 启程！圣斗士的传说！",_t"开始！圣衣争夺战！"),   -------话名
}


on_quest_award[4391] =             ----------突破！异次元空间！-开场
{
	instant_black_screen(),
	show_curtain_text{duration=6000, _t"这是什么地方？",_t"感受不到任何时间的流动……",""},
	screen_fade_in(),        --黑屏渐出
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
	section(_t"第一卷 启程！圣斗士的传说！",_t"突破！异次元空间！"),   -------伪装成卷话名
}

on_quest_award[4392] =             ----------突破！异次元空间！-开场
{
	instant_black_screen(),
	show_curtain_text{duration=6000, _t"这是什么地方？",_t"感受不到任何时间的流动……",""},
	screen_fade_in(),        --黑屏渐出
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
	section(_t"第一卷 启程！圣斗士的传说！",_t"突破！异次元空间！"),   -------伪装成卷话名
}

on_quest_award[4393] =            ----------突破！异次元空间！-开场
{
	instant_black_screen(),
	show_curtain_text{duration=6000, _t"这是什么地方？",_t"感受不到任何时间的流动……",""},
	screen_fade_in(),        --黑屏渐出
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
	section(_t"第一卷 启程！圣斗士的传说！",_t"突破！异次元空间！"),   -------伪装成卷话名
}

on_quest_award[4394] =             ----------突破！异次元空间！-开场
{
	instant_black_screen(),
	show_curtain_text{duration=6000, _t"这是什么地方？",_t"感受不到任何时间的流动……",""},
	screen_fade_in(),        --黑屏渐出
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
	section(_t"第一卷 启程！圣斗士的传说！",_t"突破！异次元空间！"),   -------伪装成卷话名
}

on_quest_award[4395] =            ----------突破！异次元空间！-开场
{
	instant_black_screen(),
	show_curtain_text{duration=6000, _t"这是什么地方？",_t"感受不到任何时间的流动……",""},
	screen_fade_in(),        --黑屏渐出
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
	section(_t"第一卷 启程！圣斗士的传说！",_t"突破！异次元空间！"),   -------伪装成卷话名
}

on_quest_award[12315] =            ----------突破！异次元空间！-开场
{
	instant_black_screen(),
	show_curtain_text{duration=6000, _t"这是什么地方？",_t"感受不到任何时间的流动……",""},
	screen_fade_in(),        --黑屏渐出
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
	section(_t"第一卷 启程！圣斗士的传说！",_t"突破！异次元空间！"),   -------伪装成卷话名
}

on_quest_award[2920] =          ----------黄金圣斗士出现（天马VS狮子座）
{
	show_mask(),                -------黑边出现
    play_smart_camera(40),
	hide_mask(),                -------黑边取消
}
on_quest_award[2931] =          ----------黄金圣斗士出现（白鸟VS水瓶座）
{
	show_mask(),                -------黑边出现
    play_smart_camera(43),
	hide_mask(),                -------黑边取消
}
on_quest_award[2942] =          ----------黄金圣斗士出现（天龙VS巨蟹座）
{
	show_mask(),                -------黑边出现
    play_smart_camera(41),
	hide_mask(),                -------黑边取消
}
on_quest_award[2953] =          ----------黄金圣斗士出现（仙女VS双鱼座）
{
	show_mask(),                -------黑边出现
    play_smart_camera(42),
	hide_mask(),                -------黑边取消
}
on_quest_award[2964] =          ----------黄金圣斗士出现（凤凰VS处女座）
{
	show_mask(),                -------黑边出现
    play_smart_camera(12),
	hide_mask(),                -------黑边取消
}
on_quest_award[12320] =          ----------黄金圣斗士出现（海龙VS双子座）
{
	show_mask(),                -------黑边出现
    play_smart_camera(42),
	hide_mask(),                -------黑边取消
}
on_quest_award[2923] =             ----------天马座第六感
{
	screen_fade_out(),       --黑屏渐入
	show_mask()	,			 --显示上下黑边（带动画效果）
	load_animation(1004),
	instant_black_screen(),
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
	screen_fade_in(),        --黑屏渐出
    hide_mask()	,			 --隐藏上下黑边（带动画效果）
}
on_quest_award[2934] =             ----------白鸟座第六感
{
	screen_fade_out(),       --黑屏渐入
	show_mask()	,			 --显示上下黑边（带动画效果）
	load_animation(1004),
	instant_black_screen(),
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
	screen_fade_in(),        --黑屏渐出
    hide_mask()	,			 --隐藏上下黑边（带动画效果）
}
on_quest_award[2945] =             ----------天龙座第六感
{
	screen_fade_out(),       --黑屏渐入
	show_mask()	,			 --显示上下黑边（带动画效果）
	load_animation(1004),
	instant_black_screen(),
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
	screen_fade_in(),        --黑屏渐出
    hide_mask()	,			 --隐藏上下黑边（带动画效果）
}
on_quest_award[2956] =             ----------仙女座第六感
{
	screen_fade_out(),       --黑屏渐入
	show_mask()	,			 --显示上下黑边（带动画效果）
	load_animation(1004),
	instant_black_screen(),
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
	screen_fade_in(),        --黑屏渐出
    hide_mask()	,			 --隐藏上下黑边（带动画效果）
}
on_quest_award[2967] =             ----------凤凰座第六感
{
	screen_fade_out(),       --黑屏渐入
	show_mask()	,			 --显示上下黑边（带动画效果）
	load_animation(1004),
	instant_black_screen(),
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
	screen_fade_in(),        --黑屏渐出
    hide_mask()	,			 --隐藏上下黑边（带动画效果）
}
on_quest_award[12322] =             ----------海龙座第六感
{
	screen_fade_out(),       --黑屏渐入
	show_mask()	,			 --显示上下黑边（带动画效果）
	load_animation(1004),    --show_curtain_text{duration=6000, _t"燃烧吧，我的小宇宙！",},
	instant_black_screen(),
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
	screen_fade_in(),        --黑屏渐出
    hide_mask()	,			 --隐藏上下黑边（带动画效果）
}
on_quest_award[4382] =             ----------天马座冲出异次元
{
	screen_fade_out(),       --黑屏渐入
	show_mask()	,
	load_animation(1005),
	instant_black_screen(),
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
	hide_mask()	,
}
on_quest_award[4383] =             ----------白鸟座冲出异次元
{
	screen_fade_out(),       --黑屏渐入
	show_mask()	,
	load_animation(1005),
	instant_black_screen(),
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
	hide_mask()	,
}
on_quest_award[4384] =             ----------天龙座冲出异次元
{
	screen_fade_out(),       --黑屏渐入
	show_mask()	,
	load_animation(1005),	
	instant_black_screen(),
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
	hide_mask()	,
}
on_quest_award[4385] =             ----------仙女座冲出异次元
{
	screen_fade_out(),       --黑屏渐入
	show_mask()	,
	load_animation(1005),	
	instant_black_screen(),
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
	hide_mask()	,
}
on_quest_award[4386] =             ----------凤凰座冲出异次元
{
	screen_fade_out(),       --黑屏渐入
	show_mask()	,
	load_animation(1005),	
	instant_black_screen(),
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
	hide_mask()	,
}
on_quest_award[12448] =             ----------海龙座冲出异次元
{
	screen_fade_out(),       --黑屏渐入
	show_mask()	,
	load_animation(1005),    --	show_curtain_text{duration=6000, _t"本是同根生，相煎何太急",},
	instant_black_screen(),
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
	hide_mask()	,
}
on_quest_deliver[7861] =             ----------战火！巨蟹的前线-屏幕喊话
{
	use_normal_stage = true,	-- 不使用动画舞台
	central_message(_t"快！跟上战车，将它安全护送到竞技场！！！"),
	wait(5000),
	central_message(_t"离战车过远将导致任务失败，请各位队员注意！！！"),
}

on_quest_deliver[8102] =             ----------战火！巨蟹的前线-屏幕喊话
{
	use_normal_stage = true,	-- 不使用动画舞台
	central_message(_t"快！跟上战车，将它安全护送到圣战之墙！！！"),
	wait(5000),
	central_message(_t"离战车过远将导致任务失败，请各位队员注意！！！"),
}
on_quest_award[9870] =             ----------天秤！童虎的回忆进副本字幕
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=10000, _t"追随着童虎老师的记忆",_t"你回到了二百多年前那次圣战爆发的夜晚",""},
	screen_fade_in(),        --黑屏渐出
}

--------------------------------------------
-- 圣域
--------------------------------------------

on_change_instance_first_time[2] =             ----------第2卷
{
	instant_black_screen(),
	chapter(_t"第 二 卷",_t"守护！爱与正义的圣斗士！","")  -------卷名
}

on_quest_deliver[2459] =             ----------最高的杰作（一）-跳跃再提示动画
{
	play(1106),              --播放动画
}

on_quest_deliver[5620] =             ----------最高的杰作（二）-跳跃再提示动画
{
	play(1108),              --播放动画
}

on_quest_award[7531] =             ----------最高的神作-跳跃提示动画
{
	play_smart_camera(39),    --调用镜头
}

on_quest_award[3168] =             ----------黄金狮子-动画
{
	play(1011),              --播放动画
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
}

on_quest_award[3172] =             ----------觐见教皇-动画
{
	show_mask(),
	screen_fade_out(),         --黑屏渐入
	load_animation(1101),      --播放动画
	screen_fade_in(),          --黑屏渐出
	hide_mask(),
}

--[[
on_quest_award[3173] =             ----------圣斗士的誓言-黑屏传送
{
	screen_fade_out(),         --黑屏渐入
	show_curtain_text{duration=2000, _t"这股温暖而强大的力量……"},
	award(),                   --发奖传送（勾选了“发放奖励前等待客户端通知”）
	screen_fade_in(),          --黑屏渐出
}
--]]

on_quest_deliver[3175] =             ----------守护！最高的使命-播动画-圣衣升级
{
	play(1109),    --播动画
}

--[[
on_quest_award[4519] =             ----------守护！最高的使命-黑屏传送
{
	screen_fade_out(),         --黑屏渐入
	wait(1000),
	show_curtain_text{duration=6000, _t"勇敢的少年啊",_t"请一定要记住",_t"守护！是圣斗士的最高使命！",""},
	award(),                   --发奖传送（勾选了“发放奖励前等待客户端通知”）
	screen_fade_in(),          --黑屏渐出
	section(_t"第二卷 守护！爱与正义的圣斗士！",_t"第 1 话  阴影！圣战来临的号角！","")
}
--]]

on_quest_award[3186] =             ----------森林中的阴影-潘多拉镜头
{
	play_smart_camera(44),    --调用镜头
}

on_quest_deliver[3200] =             ----------目标！冥王神血-播动画-冥王神血之谜
{
	play(1127),    --播动画
}

on_quest_award[3209] =             ----------初代天马VS死神-动画
{
	show_mask(),
	screen_fade_out(),         --黑屏渐入
	load_animation(1102),      --播放动画
	instant_black_screen(),
	award(),                   --发奖（勾选了“发放奖励前等待客户端通知”）
	show_curtain_text{duration=7000, _t"在无尽的沉眠中，我听到了雅典娜的呼唤",_t"她温暖而强大的小宇宙使我苏醒",_t"情况紧急，必须尽快找到奥路菲",""},
	screen_fade_in(),          --黑屏渐出
	hide_mask(),
}

on_quest_award[3219] =             ----------尖峰时刻-沙加登场动画
{
	play(1104),              --播放动画
}

on_quest_award[3250] =             ----------望乡-文字+传送
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=2000, _t"回到罗德里奥村后"},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(2000),              --等待传送
	screen_fade_in(),        --黑屏渐出
}

on_quest_deliver[3252] =             ----------狮子的困境-播动画-十三年前的秘密
{
	play(1128),    --播动画
}

on_quest_award[4401] =             ----------狮子的困境-开场文字
{
	instant_black_screen(),
	show_curtain_text{duration=6000, _t"不久前",_t"狂脊山谷",_t"艾欧里亚的调查正在继续……",""},
	screen_fade_in(),        --黑屏渐出
	section(_t"第二卷 守护！爱与正义的圣斗士！",_t"危急！狮子的困境！"),   -------伪装成卷话名
}

on_quest_award[3580] =             ----------狮子的困境-文字+传送
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=8000, _t"迟迟没有艾欧里亚大人的消息",_t"希望他不会遇到什么危险",_t"为了找到另一块盗火者神石",_t"我再次来到泰坦神殿寻找线索",""},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(2000),              --等待传送
}

on_quest_award[3265] =             ----------盗火者神器-屏幕中间文字
{
	use_normal_stage = true,	-- 不使用动画舞台
	play_gfx("5S振动大.gfx"),
	award(),
}

on_quest_award[3269] =             ----------黑暗的伪装-动画：罗德里奥村大火
{
	show_mask(),
	screen_fade_out(),         --黑屏渐入
	load_animation(1125),      --播放动画
	instant_black_screen(),
	award(),                   --发奖（勾选了“发放奖励前等待客户端通知”）
	wait(),
	screen_fade_in(),          --黑屏渐出
}

on_quest_award[5721] =             ----------幸存者-文字
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=6000, _t"”罗德里奥村是我的家乡，",_t"我愿意用生命去保护她！“","",_t"              ——尤朵拉",""},
	screen_fade_in(),        --黑屏渐出
}

on_quest_award[4141] =             ----------以战之命-黑屏文字
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=4000, _t"勇敢的少年！",_t"请遵循自己内心的信仰！",""},
	screen_fade_in(),        --黑屏渐出
	award(),
}

on_quest_award[3290] =             ----------阿历克斯冥界战士-获取普罗米修斯之锤动画
{
	show_mask(),
	screen_fade_out(),         --黑屏渐入
	load_animation(1110),      --播放动画
	award(),
	wait(2000),
	screen_fade_in(),          --黑屏渐出
}

on_quest_award[3303] =             ----------三黄金VS双子神-动画
{
	show_mask(),
	screen_fade_out(),         --黑屏渐入
	load_animation(1103),      --播放动画
	instant_black_screen(),
	award(),                   --发奖（勾选了“发放奖励前等待客户端通知”）
	wait(2000),                --等待传送
	screen_fade_in(),          --黑屏渐出
	hide_mask(),
}
on_quest_award[3718] =        -----------剧情副本：黄泉之井
{
	instant_black_screen(),
	show_curtain_text{duration=4000, _t"不久前",_t"金穗花田",_t"奥路菲和尤丽缇丝",""},
	screen_fade_in(),        --黑屏渐出
	section(_t"第二卷 守护！爱与正义的圣斗士！",_t"黄泉之井的镇魂曲！"),   -------伪装成卷话名
}
on_quest_award[3538] =             ----------尤丽缇丝之死
{
	screen_fade_out(),       --黑屏渐入
	instant_black_screen(),
	show_curtain_text{duration=3000, _t"尤丽缇丝的死令奥路菲陷入了无尽的悲伤之中"},
	instant_black_screen(),
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
	wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[5784] =             ----------黄泉之井展示
{
	show_mask(),
	load_animation(1502),    --播动画
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
	hide_mask(),
}
on_quest_award[5792] =             ----------击败地狱三头犬-漫画+传送
{
	show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(4003),    --播漫画
	show_curtain_text{duration=12000, _t"“不论是人、鸟或昆虫",_t"都只能活一次",_t"即使是闪亮的星星也不例外",_t"已经枯萎的花是无法再度开放的”",_t"                        ——奥路菲",""},
	instant_black_screen(),
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
	hide_mask(),
}

on_quest_award[6502] =        -----------剧情副本：激斗！黄金十二宫！
{
	instant_black_screen(),
	play(1020),
	section(_t"第二卷 守护！爱与正义的圣斗士！",_t"激斗！黄金十二宫！"),   -------伪装成卷话名
}

on_quest_award[6504] =             ----------激斗！黄金十二宫-钟楼点火动画
{
	show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1111),    --播动画
	screen_fade_in(),        --黑屏渐出
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
	hide_mask(),
}

on_quest_award[2425] =             ----------激斗！黄金十二宫-白羊宫熄火动画
{
	show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1113),    --播动画
	screen_fade_in(),        --黑屏渐出
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
	hide_mask(),
}

on_quest_award[89] =             ----------激斗！黄金十二宫-巨型号角动画
{
	show_mask(),
	screen_fade_out(),         --黑屏渐入
	load_animation(1107),      --播放动画
	instant_black_screen(),
	wait(),
	load_animation(1112),      --播放动画
	show_curtain_text{duration=7000, _t"黄金圣斗士的力量远超我的想象",_t"阿鲁迪巴强有力的一拳将我击出了十二宫",_t"当我清醒过来的时候，已经在罗德里奥村了",""},
	instant_black_screen(),
	award(),                   --发奖传送（勾选了“发放奖励前等待客户端通知”）
	wait(),                    --等待传送
	screen_fade_in(),          --黑屏渐出
	hide_mask(),
}

on_quest_award[87] =             ----------激斗！黄金十二宫-阿鲁迪巴出场
{
	show_mask(),
	screen_fade_out(),         --黑屏渐入
	load_animation(1105),      --播放动画
	award(),                   --发奖（勾选了“发放奖励前等待客户端通知”）
	screen_fade_in(),          --黑屏渐出
}

on_quest_award[5766] =             ----------激斗！黄金十二宫-巨型号角动画
{
	section(_t"第二卷 守护！爱与正义的圣斗士！",_t"第 3 话  决战!死亡与长眠！",""),
}

on_quest_award[3304] =             ----------决战！死亡与长眠！——冥王神衣镜头
{
	play_smart_camera(59),
}

on_quest_award[3445] =             ----------天空中的阴影-文字+传送+2卷2话名
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=10000, _t"原来黑衣少女就是冥界的潘多拉",_t"她获得冥王神血的目的",_t"是令哈迪斯的冥衣复苏",_t"身为雅典娜的圣斗士",_t"我决不容许冥界的力量污染圣域",""},
	--load_animation(4104), 
	instant_black_screen(),
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(2000),              --等待传送
	screen_fade_in(),        --黑屏渐出
	section(_t"第二卷 守护！爱与正义的圣斗士！",_t"第 2 话  激斗!黄金十二宫！",""),
}

on_quest_award[3312] =             ----------东方的冒险-文字+传送
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=12000, _t"冥界的军队撤退了",_t"不管他们的计划有没有成功",_t"新的圣战，即将来临！",_t"而此时，东方的银河竞技场又在酝酿什么秘密呢？",_t"失踪的射手座圣衣为什么会在那里出现？",_t"十三年前的圣域，究竟发生了什么？",""},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(3000),              --等待传送
	screen_fade_in(),        --黑屏渐出
}

on_quest_award[3306] =             ----------决战！死亡与长眠！-唤醒失忆少女文字
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=2000, _t"唤醒白衣少女后"},
	screen_fade_in(),        --黑屏渐出
}


on_quest_award[4350] =             ----------尘封的十三年-失败隐藏任务
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=3000, _t"你被加米安赶了出去！"},
	award(),
	wait(),
	screen_fade_in(),        --黑屏渐出
}

on_quest_award[3261] =             ----------尘封的十三年-警告文字
{
	use_normal_stage = true,	-- 不使用动画舞台
	central_message(_t"快！赶在加米安回来之前找到射手座的遗物！"),
	wait(3000),
	central_message(_t"快！赶在加米安回来之前找到射手座的遗物！"),
}

on_quest_deliver[3249] =             ----------望乡-屏幕喊话
{
	use_normal_stage = true,	-- 不使用动画舞台
	central_message(_t"护送少女回村，注意不要让她距离你过远"),
}



--------------------------------------------
-- 银河竞技场
--------------------------------------------

on_change_instance_first_time[4] =             ----------银河竞技场
{
	instant_black_screen(),
	wait(3000),
	play(1012),
}
on_quest_award[7309] =             ----------传送到银河竞技场
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=3000, _t"银河竞技场门口"},
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[446] =             ----------剧本：银河战争：击败天狼座！-黑屏文字
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=3000, _t"天狼座那智被击倒了！"},
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[452] =             ----------剧本：银河战争：凤凰归来！-黑屏文字+传送
{
	screen_fade_out(),       --黑屏渐入
	load_animation(4004),    --播漫画
	show_curtain_text{duration=12000, _t"射手座圣衣被突然出现的一辉夺走",_t"银河擂台赛被迫中止",_t"为夺回圣衣，星矢和冰河冲了出去",_t"而此时，瞬……",""},
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[451] =             ----------剧本：银河战争：进入银河竞技场-黑屏文字
{
	screen_fade_out(),       --黑屏渐入
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[4489] =             ----------剧本：银河战争：银河战争开幕了！-黑屏文字+传送
{
	show_mask(),
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=2000, _t"银河擂台赛开幕了！！！",""},
	load_animation(1204),    --播动画
	instant_black_screen(), 
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
	hide_mask(),
}
on_quest_award[4490] =             ----------剧本：银河战争：伪装成卷话名：天马座星矢 对战 大熊座檄
{
	section(_t"银河擂台赛",_t"天马座星矢  VS  大熊座檄"),   -------伪装成卷话名
}
on_quest_award[4493] =             ----------剧本：银河战争：胜利者：天马座星矢！-黑屏文字+传送
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=6000, _t"胜利者",_t"天马座星矢！",_t"接下来，是白鸟座冰河对阵水蛇座市！",""},
	instant_black_screen(),
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
	section(_t"银河擂台赛",_t"白鸟座冰河  VS  水蛇座市"),   -------伪装成卷话名
}
on_quest_award[4497] =             ----------剧本：银河战争：胜利者：天马座星矢！-黑屏文字+传送
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=5000, _t"胜利者",_t"白鸟座冰河！",""},
	instant_black_screen(), 
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[4499] =             ----------剧本：银河战争：银河战争正在继续！-黑屏文字+传送
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=3000, _t"银河擂台赛正在继续！"},
	instant_black_screen(), 
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
	section(_t"银河擂台赛",_t"天马座星矢  VS  天龙座紫龙"),   -------伪装成卷话名
}
on_quest_award[4503] =             ----------剧本：银河战争：银河战争正在继续！-黑屏文字+传送
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=6000, _t"胜利者，天马座星矢！",_t"星矢艰难的获得了对紫龙的胜利！",""},
	instant_black_screen(), 
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[4530] =             ----------剧本：银河战争：银河战争正在继续！-黑屏文字+传送
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=2000, _t"银河擂台赛正在继续！"},
	instant_black_screen(),
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[4508] =             ----------剧本：银河战争：击败天狼座！-黑屏文字+传送
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=3000, _t"天狼座那智被击倒了！"},
	screen_fade_in(),        --黑屏渐出
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
}
on_quest_award[4512] =             ----------剧本：银河战争：漫画：凤凰归来！-黑屏文字+传送
{
	screen_fade_out(),       --黑屏渐入
	load_animation(4004),    --播漫画
	show_curtain_text{duration=12000, _t"射手座圣衣被突然出现的一辉夺走",_t"银河擂台赛被迫中止",_t"为夺回圣衣，星矢和冰河冲了出去",_t"而此时，瞬……",""},
	instant_black_screen(), 
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}

on_quest_deliver[127] =             ----------第三卷
{
	chapter(_t"第三卷",_t"激斗！银河下的战士！"),  -------卷名
}

on_quest_deliver[128] =             ----------第三卷第一话
{
	section(_t"第三卷 激斗！银河下的战士！",_t"第 1 话  开幕！银河战争！"),   -------第一话
}

on_quest_deliver[145] =            -----------第三卷第二话
{
	section(_t"第三卷 激斗！银河下的战士！",_t"第 2 话  一辉！地狱归来的战士！"),   -------第二话
}
on_quest_deliver[174] =            -----------第三卷第三话
{
	section(_t"第三卷 激斗！银河下的战士！",_t"第 3 话  守护！愤怒之拳！"),   -------第三话
}
on_quest_deliver[188] =             ----------第四卷
{
	chapter(_t"第四卷",_t"出发！命运的少年！"),  -------卷名
}
on_quest_deliver[189] =            -----------第四卷第一话
{
	section(_t"第四卷 出发！命运的少年！",_t"第 1 话  前进！十风穴的战斗！"),   -------第一话
}
on_quest_deliver[198] =            -----------第四卷第二话
{
	section(_t"第四卷 出发！命运的少年！",_t"第 2 话  暗杀者！圣域的阴影！"),   -------第二话
}
on_quest_deliver[227] =            -----------第四卷第三话
{
	section(_t"第四卷 出发！命运的少年！",_t"第 3 话  狮子！勇猛之牙！"),   -------第三话
}
on_quest_award[419] =             ----------纱织被掳！-黑屏文字+传送
{
	show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1202),  
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
	hide_mask(),
}
on_quest_award[2087] =             ----------十风穴-动画+传送
{
	show_mask(),
	load_animation(1203),  
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	hide_mask(),
}
on_quest_award[6806] =        -----------剧情副本：十风穴的最后决战
{
	instant_black_screen(),
	show_mask(),
	show_curtain_text{duration=10000, _t"紫龙，终于带着新生的天龙座圣衣从嘉米尔回来了",_t"漆黑的十风穴内，伙伴们正在赌上自己的生命作战",_t"飞翔吧，重生的天龙！与伙伴们一起战斗！",""},
	screen_fade_in(),        --黑屏渐出
	section(_t"第四卷 出发！命运的少年！",_t"决战！十风穴的死斗！"),   -------伪装成卷话名
}

on_quest_deliver[241] =             ----------黄金狮子来袭！-动画
{
	show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1201),  
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	screen_fade_in(),        --黑屏渐出
	hide_mask(),
}
on_quest_award[172] =             ----------上代的记忆！-动画
{
	show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1208),  
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	screen_fade_in(),        --黑屏渐出
	hide_mask(),
}
on_quest_award[402] =             ----------星矢爆发穿圣衣！-动画
{
	show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1209),  
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	screen_fade_in(),        --黑屏渐出
	hide_mask(),
}
on_quest_award[7280] =             ----------进入青木原树海-动画
{
	show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1205),  
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	screen_fade_in(),        --黑屏渐出
	hide_mask(),
}
on_quest_award[366] =             ----------走出青木原树海-动画
{
	screen_fade_out(),       --黑屏渐入
	load_animation(1206),  
	screen_fade_in(),        --黑屏渐出
}

on_quest_award[1433] =             ----------传送到红叶断崖！-黑屏文字+传送
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=10000, _t"紧随乌鸦之后",_t"我们追了出去",_t"眼前出现的是一位老朋友",_t"乌鸦座白银圣斗士加米安",""},
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[7699] =             ----------纱织爆发小宇宙-动画
{
	screen_fade_out(),       --黑屏渐入
	load_animation(1207),  
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[1432] =             ----------围绕在雅典娜身边！-黑屏文字+传送
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=5000, _t"“要围绕在雅典娜身边！”",_t"魔铃离去前的叮嘱令我迷惑",_t"雅典娜不应该在圣域吗？"},
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}

on_quest_award[428] =             ----------来自黑暗的光明！黑屏文字+传送
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=3000, _t"回到城户宅邸后"},
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）	
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[1440] =             ----------十风穴坍塌，穆救出众人！-动画+传送
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=5000, _t"十风穴坍塌？！",_t"希望星矢他们平安无事",""},
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[5176] =             ----------美杜莎之盾-黑屏文字
{
	screen_fade_out(),       --黑屏渐入
	load_animation(4005),    --播漫画
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[2366] =             ----------传送到庐山！-黑屏文字
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=5000, _t"怀着巨大的疑惑和艾欧里亚的嘱托",_t"我前往庐山寻求真相",""},
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_deliver[174] =             ----------获得黄金圣衣旁白-黑屏文字
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=10000, _t"从黑暗凤凰手中，我们夺回了射手座黄金圣衣的右腕和左腕",_t"在接下来的战斗中",_t"一定要将射手座黄金圣衣全部夺回！",""},
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[1724] =             ----------支线拉克萨斯死亡遮挡-黑屏文字
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=10000, _t"解除误会之后",_t"失散许久的父子终于再见了……"},
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[1595] =             ----------支线乌鸦喝水-屏幕中央喊话1
{
    use_normal_stage = true,	-- 不使用动画舞台
	central_message(_t"水升起了一点点，继续放小石块进去吧。"),
}	
on_quest_award[1596] =             ----------支线乌鸦喝水-屏幕中央喊话2
{
    use_normal_stage = true,	-- 不使用动画舞台
	central_message(_t"水罐中的水又升起了一点，继续投入小石块。"),
}	
on_quest_award[1597] =             ----------支线乌鸦喝水-屏幕中央喊话3
{
    use_normal_stage = true,	-- 不使用动画舞台
	central_message(_t"水已经接近瓶口了，再投入一颗小石块！"),
}	
on_quest_award[1598] =             ----------支线乌鸦喝水-屏幕中央喊话4
{
    use_normal_stage = true,	-- 不使用动画舞台
	central_message(_t"水流出了罐子！乌鸦可以喝到水了。"),
}	
on_quest_award[378] =             ----------黑暗天龙召唤哥哥-黑屏文字
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=10000, _t"“黑暗中的天龙”？",_t"你突然无法动弹，是谁在暗中？！"},
	screen_fade_in(),        --黑屏渐出
}

on_quest_deliver[5183] =             ----------星之子学园-屏幕喊话
{
	use_normal_stage = true,	-- 不使用动画舞台
	central_message(_t"带天翼回到星之子学园，注意不要让他跟丢了你"),
}

on_quest_deliver[203] =             ----------战斗之路-屏幕喊话
{
	use_normal_stage = true,	-- 不使用动画舞台
	central_message(_t"拉娜示意让你跟上她"),
}

on_quest_award[5329] =             ----------战斗之路-屏幕喊话
{
	use_normal_stage = true,	-- 不使用动画舞台
	central_message(_t"拉娜向你挥手告别"),
}

on_quest_award[380] =             ----------意外的敌人-播动画：仰望十风穴
{
	play(1280),
}

on_quest_award[9549] =             ----------射手座黄金圣衣-播动画：纱织登场
{
	play(1285),
}

on_quest_award[9520] =             ----------东西伯利亚之白鸟-播动画：冰河登场
{
	play(1281),
}

on_quest_award[343] =             ----------再遇天马-播动画：星矢登场
{
	play(1284),
}

on_quest_award[9522] =             ----------星之子学园-播动画：紫龙登场
{
	play(1282),
}

on_quest_award[1305] =             ----------仙女座的瞬-播动画：瞬登场
{
	play(1283),
}

on_quest_deliver[240] =             ----------宇宙的共鸣-播动画：纱织身世之谜
{
	play(1286),
}






--------------------------------------------
-- 庐山
--------------------------------------------
on_change_instance_first_time[3] =             ----------庐山
{
	instant_black_screen(),
	wait(3000),
	play(1013),
}

on_quest_award[6506] =              ----------黑屏文字
{
	instant_black_screen(),
	show_curtain_text{duration=3000, _t"二年前",_t"庐山竹林"},
	screen_fade_in(),        --黑屏渐出
	section(_t"第五卷 追寻！知道真相的男人！",_t"决裂！龙与虎！"),   -------伪装成卷话名
}
on_quest_award[876] =             ----------解救春丽-黑屏文字+传送
{
	show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1301),    --播动画
	instant_black_screen(),
	wait(2000),
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
	screen_fade_in(),        --黑屏渐出
	hide_mask(),
}
on_quest_award[881] =             ----------雷虎离开-黑屏文字+传送
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=4000, _t"我一定会回来的，紫龙",_t"到时候，我会跟你一决胜负！"},
	instant_black_screen(),
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
	wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[974] =             ----------巨蟹座迪斯马斯克-黑屏文字
{
	screen_fade_out(),       --黑屏渐入
	load_animation(4006),
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[4296] =             ----------等候命令之时-黑屏文字
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=6000, _t"庐山的事情已经终了",_t"快返回瀑布见童虎",""},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
	wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[978] =             ----------李云喝药-黑屏文字
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=6000, _t"李云喝下了碧龙潭的水",_t"紫龙恰在这个时候也赶了过来",""},
	screen_fade_in(),        --黑屏渐出
}
on_quest_deliver[1048] =             ----------紫龙与雷虎比试-动画
{
	show_mask(),
	screen_fade_out(),         --黑屏渐入
	load_animation(1303),
	screen_fade_in(),          --黑屏渐出
	hide_mask(),
}

on_quest_deliver[713] =             ----------熊猫传说-黑屏文字
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=6000, _t"护送圆圆去神龙岭",""},
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[931] =             ----------竹子开花-黑屏文字+传送
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=1500, _t"你带着万晓生回到巴斯的身边。"},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[7696] =             ----------水中少年-黑屏
{
	screen_fade_out(),       --黑屏渐入
	award(),
	wait(2000),
	screen_fade_in(),        --黑屏渐出
}
on_quest_deliver[752] =             ----------水中少年（七）-黑屏文字
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=3000, _t"一天之后",""},
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[7697] =             ----------无法说出的爱（四）-黑屏
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=6000, _t"你和苏芳回到雷虎墓前",_t"献上了一束鲜花",""},
	award(),
	wait(2000),
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[1762] =             ----------神龙的青睐-黑屏文字+传送
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=3000, _t"一股神奇的力量将你包围",_t"只是一瞬间你就出现在庐山之巅",""},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_deliver[1655] =             ----------大战完结，震惊的师父-黑屏文字
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=3000, _t"血脉中的力量躁动着",_t"也许不久的将来",_t"你真的可以匹敌黄金圣斗士！",""},
	screen_fade_in(),        --黑屏渐出
}
on_quest_deliver[1652] =             -----------神龙之息，前往死亡之地-黑屏文字
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=3000, _t"神龙的力量再次将你笼罩",""},
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[1052] =             ----------雷虎牺牲-黑屏文字+传送
{
    show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1302),      --播放动画
	instant_black_screen(),
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
	hide_mask(),
}
on_quest_award[983] =             ----------最后的嘱托-黑屏文字+传送
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=5000, _t"李云用自己的生命为庐山换来了生机",_t"你必须赶快将药带回村子……",""},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[1518] =             ----------神秘的黄金圣斗士-黑屏文字+传送
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=3000, _t"一股神奇的力量将你包围",_t"似乎有什么人在呼唤你",""},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[6837] =        -----------剧情副本：欺瞒神的男人
{
	instant_black_screen(),
	show_mask(),
	show_curtain_text{duration=8000, _t"加隆被卷入一座神秘的海底大殿之中",_t"等待他的将会是怎么的命运呢？",""},
	screen_fade_in(),        --黑屏渐出
	section(_t"第八卷 苏醒！君临七海的血脉！",_t"阴谋！欺瞒神的男人！"),   -------伪装成卷话名
}
on_quest_award[6890] =        -----------剧情副本：一辉的回忆
{
	instant_black_screen(),
	show_mask(),
	show_curtain_text{duration=8000, _t"一切仿佛又回到了过去",_t"岩浆与死亡",_t"还有即将重生的凤凰",""},
	screen_fade_in(),        --黑屏渐出
	section(_t"第十卷 爆发！皇后岛的烈焰！",_t"回忆！新生的凤凰！"),   -------伪装成卷话名
}
on_quest_award[6876] =        -----------剧情副本：再回观星楼
{
	instant_black_screen(),
	show_mask(),
	show_curtain_text{duration=4000, _t"重新踏上观星楼，这里却早不是从前的世界",""},
	screen_fade_in(),        --黑屏渐出
	section(_t"第八卷 苏醒！君临七海的血脉！",_t"再战！重返观星楼！"),   -------伪装成卷话名
}
on_quest_award[6937] =        -----------剧情副本：冰河的回忆
{
	instant_black_screen(),
	show_mask(),
	show_curtain_text{duration=12000, _t"时间仿佛又回到了冰河学徒时代",_t"严寒的西伯利亚，共同训练的圣斗士候补生们",_t"当然还有正义勇敢的艾尔扎克",""},
	screen_fade_in(),        --黑屏渐出
	section(_t"第一卷 封印！海皇之力量！",_t"回忆！正义的极光惩罚！"),   -------伪装成卷话名
}
on_quest_award[6828] =        -----------剧情副本：逃离比良坂
{
	instant_black_screen(),
	show_mask(),
	show_curtain_text{duration=8000, _t"冷，冷，冷",_t"这里透出一股股死亡的严寒！",_t"这就是黄泉比良坂吗？",""},
	screen_fade_in(),        --黑屏渐出
	section(_t"第六卷 传承！千年不变的信念！",_t"脱出！黄泉比良坂！"),   -------伪装成卷话名
}
on_quest_award[5816] =             ----------逃离比良坂完成动画+传送
{
	show_mask(),
	load_animation(1304),  
	instant_black_screen(),
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	hide_mask(),
}
on_quest_deliver[859] =             ----------庐山天池展示动画
{
	show_mask(),
	load_animation(1501),  
	hide_mask(),
}
on_quest_award[4324] =             ----------对鹰使用技能-调用镜头
{
	show_mask(),                -------黑边出现
	play_smart_camera(37),
	hide_mask(),                -------黑边取消
}
on_quest_award[9137] =             ----------中秋任务-黑屏文字+传送
{
    instant_black_screen(),
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=3000, _t"第三坛刚刚下肚……",_t"于是你喝醉了",_t"醉得昏天黑地……",""},
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_deliver[782] =             ----------显示卷名
{
	chapter(_t"第五卷",_t"追寻！知道真相的男人！")  -------卷名
}
on_quest_deliver[784] =            -----------显示话名
{
	section(_t"第五卷 追寻！知道真相的男人！",_t"第 1 话  阴云！庐山的危机！","")   -------第一话
}
on_quest_deliver[806] =            -----------显示话名
{
	section(_t"第五卷 追寻！知道真相的男人！",_t"第 2 话  惊怒！背弃正义的巨蟹！","")   -------第二话
}
on_quest_deliver[823] =            -----------显示话名
{
	section(_t"第五卷 追寻！知道真相的男人！",_t"第 3 话  湮灭！最美丽的死亡！","")   -------第三话
}
on_quest_deliver[837] =             ----------显示卷名
{
	chapter(_t"第六卷",_t"传承！千年不变的信念！")  -------卷名
}
on_quest_deliver[842] =            -----------显示话名
{
	section(_t"第六卷 传承！千年不变的信念！",_t"第 1 话  战斗吧！为了庐山的骄傲！","")   -------第一话
}
on_quest_deliver[854] =            -----------显示话名
{
	section(_t"第六卷 传承！千年不变的信念！",_t"第 2 话  天龙魂！庐山之巅的秘密！","")   -------第二话
}
on_quest_deliver[1039] =            -----------显示话名
{
	section(_t"第六卷 传承！千年不变的信念！",_t"第 3 话  燃烧吧！圣斗士真正的力量！","")   -------第三话
}

on_quest_deliver[710] =            -----------龙珠之谜（八）--播动画：龙珠之神龙出现
{
	play(1305),
}




--------------------------------------------
-- 遗忘之路
--------------------------------------------

on_change_instance_first_time[5] =             ----------遗忘之路
{
	instant_black_screen(),
	wait(3000),
	play(1014),
}

on_quest_award[7537] =             ----------命运神殿展示
{
	screen_fade_out(),       --黑屏渐入
	load_animation(1503),    --艾欧罗斯VS修罗漫画
	screen_fade_in(),        --黑屏渐出
}



on_quest_award[6508] =             ----------射手逃亡进副本动画
{
	instant_black_screen(),
	show_curtain_text{duration=6000, _t"十三年前",_t"遗忘之路",_t"夜",},	----------精简字幕
	screen_fade_in(),        --黑屏渐出
	section(_t"第七卷 背叛！射手座黄金圣斗士！",_t"回忆！十三年前的真相！"),   -------伪装成卷话名
}
on_quest_award[2240] =             ----------玩家被传送到十三年前
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=6000, _t"我在哪里？",_t"过去女神：”这是十三年前的遗忘之路，你要找的艾欧罗斯很快就会出现。“",},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
}

on_quest_award[2245] =             ----------摩羯和射手对战动画
{
	screen_fade_out(),       --黑屏渐入
	load_animation(4007),    --艾欧罗斯VS修罗漫画
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}

on_quest_award[2247] =             ----------玩家从记忆中返回
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=3000, _t"现在女神：”醒来吧，少年。“",},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[2410] =             ----------坏结局1
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=5000, _t"你没能赶在修罗杀死艾欧罗斯之前得到真相。",},
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[2411] =             ----------坏结局2
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=5000, _t"修罗在击败你之后杀死了艾欧罗斯，你没能得到真相。",},
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[2234] =             ----------射手逃亡：石柱谷
{
	play_smart_camera(9)
}

on_quest_award[3090] =             ----------放逐者之王登场动画
{
	show_mask(),
	screen_fade_out(),         --黑屏渐入
	load_animation(1403),      --播放动画
	instant_black_screen(),
	show_curtain_text{duration=8000, _t"眼前的这个人拥有强大的小宇宙……",_t"从这些人对他的态度来看，",_t"难道他就是放逐者之王？"},
	screen_fade_in(),          --黑屏渐出
	hide_mask(),
}

on_quest_deliver[3108] =             ----------召唤命运女神动画
{
	show_mask(),
	screen_fade_out(),         --黑屏渐入
	load_animation(1402),      --播放动画
	screen_fade_in(),          --黑屏渐出
	hide_mask(),
}

on_quest_award[6782] =             ----------水牢注水动画
{
	show_mask(),
	screen_fade_out(),         --黑屏渐入
	load_animation(1404),      --播放动画
	instant_black_screen(),
	show_curtain_text{duration=8000, _t"随着一次剧烈的小宇宙释放，",_t"水牢已经完全被波涛淹没，",_t"不知道那个散发着神秘小宇宙的男人如何了……"},
	screen_fade_in(),          --黑屏渐出
	hide_mask(),
}

on_quest_award[6785] =             ----------教皇内战动画
{
	show_mask(),
	screen_fade_out(),         --黑屏渐入
	load_animation(1401),      --播放动画
	instant_black_screen(),
	screen_fade_in(),          --黑屏渐出
	hide_mask(),
}

on_quest_award[4167] =             ----------火种的传承-黑屏文字
{
	screen_fade_out(),         --黑屏渐入
	show_curtain_text{duration=20000, _t"十三年前",_t"双子座撒加谋杀前教皇史昂，成功篡位",_t"他欲杀死仍是婴儿期的雅典娜，却被艾欧罗斯撞见",_t"撒加下令追杀艾欧罗斯，后者携雅典娜星夜逃出圣域",_t"途中遇到修罗追杀，艾欧罗斯伤重",_t"临死之际，他将雅典娜托付给城户光政",_t"                              ——圣域秘史",""},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
	screen_fade_in(),          --黑屏渐出
}

on_quest_award[6794] =             ----------凤凰的踪迹-黑屏文字
{
	screen_fade_out(),         --黑屏渐入
	show_curtain_text{duration=18000, _t"圣域的战争一触即发",_t"星矢、紫龙、冰河与我，都会团结在雅典娜的身边",_t"随时准备给伪教皇致命的一击",_t"但我们仍需要两个人的帮助",_t"一辉和瞬",_t"现在，死亡皇后岛的冒险，正式开始",""},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
	screen_fade_in(),          --黑屏渐出
}

on_quest_deliver[5682] =             ----------显示卷名
{
	chapter(_t"第七卷",_t"背叛！射手座黄金圣斗士！")  -------卷名
}
on_quest_deliver[3035] =            -----------显示话名
{
	section(_t"第七卷 背叛！射手座黄金圣斗士！",_t"第 1 话  放逐！圣域的罪人！","")   -------第一话
}
on_quest_deliver[3046] =            -----------显示话名
{
	section(_t"第七卷 背叛！射手座黄金圣斗士！",_t"第 2 话  神殿！被湮没的正义！","")   -------第二话
}
on_quest_deliver[3062] =            -----------显示话名
{
	section(_t"第七卷 背叛！射手座黄金圣斗士！",_t"第 3 话  背叛者的史诗！","")   -------第三话
}
on_quest_deliver[2826] =             ----------显示卷名
{
	chapter(_t"第八卷",_t"苏醒！君临七海的血脉！")  -------卷名
}
on_quest_deliver[2828] =            -----------显示话名
{
	section(_t"第八卷 苏醒！君临七海的血脉！",_t"第 1 话  海皇！神之转世身！","")   -------第一话
}
on_quest_deliver[2862] =            -----------显示话名
{
	section(_t"第八卷 苏醒！君临七海的血脉！",_t"第 2 话  神之牢狱！十三年前的囚徒！","")   -------第二话
}
on_quest_deliver[2899] =            -----------显示话名
{
	section(_t"第八卷 苏醒！君临七海的血脉！",_t"第 3 话  黄金箭！星空下的战旗！","")   -------第三话
}

--------------------------------------------
-- 十风穴的最后决战
--------------------------------------------
--[[on_quest_deliver[2326] =             ----------接任务传送进入副本
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=7000, "黄金圣衣还有最关键的几个部件在一辉及黑暗四天王手中，","一定要尽快夺回！"。"此时，紫龙已从嘉米尔回来，得知大家进入十风穴的消息","与一辉的决战就在眼前","要尽快和大家汇合！"},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}]]
on_quest_award[2058] =             ----------黑天龙被击败
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=15000, _t"冰河！冰河！冰河……",_t"紫龙大喊着，但是白鸟并没有听见紫龙的呼喊",_t"现在这只极寒的白鸟眼里只有灼热的凤凰",_t"马上",_t"最强之鸟的争斗就要上演了！",""},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(1000),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[2059] =             ----------黑天龙被击败
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=12000, _t"星矢……星矢……星矢……",_t"白鸟燃尽生命喊出了最后一句，继而倒在了烈焰之中",_t"天马！天马！天马！",_t"破灭凤凰的重任只能落在你的肩膀上了！",""},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(1000),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
-- 获得圣衣
--------------------------------------------
on_quest_award[3338] =             ----------完成任务-天马
{
    show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1001),
	screen_fade_in(),        --黑屏渐出
	hide_mask(),    
}
on_quest_award[4472] =             ----------完成任务-白鸟
{
    show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1001),
	screen_fade_in(),        --黑屏渐出
	hide_mask(),    
}
on_quest_award[4473] =             ----------完成任务-天龙
{
    show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1001),
	screen_fade_in(),        --黑屏渐出
	hide_mask(),    
}
on_quest_award[4474] =             ----------完成任务-仙女
{
    show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1001),
	screen_fade_in(),        --黑屏渐出
	hide_mask(),    
}
on_quest_award[4475] =             ----------完成任务-凤凰
{
    show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1001),
	screen_fade_in(),        --黑屏渐出
	hide_mask(),    
}
on_quest_award[12353] =             ----------星座升华-天马
{
    show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1129),
	screen_fade_in(),        --黑屏渐出
	hide_mask(),    
}
on_quest_award[12355] =             ----------星座升华-白鸟
{
    show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1129),
	screen_fade_in(),        --黑屏渐出
	hide_mask(),    
}
on_quest_award[12354] =             ----------星座升华-天龙
{
    show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1129),
	screen_fade_in(),        --黑屏渐出
	hide_mask(),    
}
on_quest_award[12356] =             ----------星座升华-仙女
{
    show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1129),
	screen_fade_in(),        --黑屏渐出
	hide_mask(),    
}
on_quest_award[12357] =             ----------星座升华-凤凰
{
    show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1129),
	screen_fade_in(),        --黑屏渐出
	hide_mask(),    
}
on_quest_award[12358] =             ----------星座升华-海飞龙
{
    show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1129),
	screen_fade_in(),        --黑屏渐出
	hide_mask(),    
}
--------------------------------------------
on_quest_award[3717] =             ----------圣战回忆进副本字幕
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=10000, _t"你被传送到了上次圣战的战场",_t"亲历这场战斗你将更加了解圣斗士的使命",""},
	screen_fade_in(),        --黑屏渐出
}
-- 狮子的遭遇
--------------------------------------------
on_quest_award[3568] =             ----------完成传送出副本
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=10000, _t"艾欧里亚陷入到了无尽的沉眠之中",_t"骄傲的狮子也必须低下高傲的头颅吗？",""},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[3574] =          ----------狮子遭遇（死神出现）
{
	show_mask(),                -------黑边出现
    play_smart_camera(33),
	hide_mask(),                -------黑边取消
}
--------------------------------------------
-- 死亡皇后岛
--------------------------------------------

on_change_instance_first_time[6] =             ----------死亡皇后岛
{
	instant_black_screen(),
	wait(3000),
	play(1015),
}

on_quest_award[4161] =             ----------破灭！黑之幻魔拳！——开场文字
{
	instant_black_screen(),
	show_curtain_text{duration=10000, _t"一辉，到底哪个才是真正的你？",_t"还是这一切都只是幻象？",_t"如果是，那我会将这一切全部粉碎！",""},
	screen_fade_in(),        --黑屏渐出
	section(_t"第九卷 复苏！称霸世界的野心！",_t"破灭！黑之幻魔拳！"),   -------伪装成卷话名
}

on_quest_award[3890] =             ----------凤凰之尾黑屏传送
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=6000, _t"终于",_t"你和一辉来到了最残酷的战场",_t"凤凰之尾"},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[3989] =             ----------中了假一辉的凤凰幻魔拳
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=4000, _t"一辉：哈哈，在幻魔拳中恐惧吧！"},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[4034] =             ----------凤凰幻魔拳！错路1
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=4000, _t"一辉：哈哈哈！你们走错路了！"},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[4035] =             ----------凤凰幻魔拳！错路1
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=4000, _t"一辉：哈哈哈！你们走错路了！"},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[4036] =             ----------凤凰幻魔拳！错路1
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=4000, _t"一辉：哈哈哈！你们走错路了！"},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[6524] =             ----------凤凰幻魔拳！错路1
{
	screen_fade_out(),       --黑屏渐入
	show_mask(),
	load_animation(1312),    --播漫画
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
	hide_mask(),
}
on_quest_award[4177] =             ----------一辉回忆-动画+传送
{
	show_mask(),
	load_animation(4008),  
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	hide_mask(),
}
on_quest_award[1762] =             ----------神龙的青睐-黑屏文字+传送
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=3000, _t"一股神奇的力量将你包围",_t"只是一瞬间你就出现在庐山之巅",""},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_deliver[3721] =             ----------显示卷名
{
	chapter(_t"第九卷",_t"复苏！称霸世界的野心！")  -------卷名
}
on_quest_deliver[3724] =            -----------显示话名
{
	section(_t"第九卷 复苏！称霸世界的野心！",_t"第 1 话  燃烧！皇后岛的战火！","")   -------第一话
}
on_quest_deliver[3749] =            -----------显示话名
{
	section(_t"第九卷 复苏！称霸世界的野心！",_t"第 2 话  真假！再次堕落的一辉？","")   -------第二话
}
on_quest_deliver[3760] =            -----------显示话名
{
	section(_t"第九卷 复苏！称霸世界的野心！",_t"第 3 话  小心！幕后真正的黑手！","")   -------第三话
}
on_quest_deliver[3781] =             ----------显示卷名
{
	chapter(_t"第十卷",_t"爆发！皇后岛的烈焰！")  -------卷名
}
on_quest_deliver[3784] =            -----------显示话名
{
	section(_t"第十卷 爆发！皇后岛的烈焰！",_t"第 1 话  塔瓦娜！炼金师的哀伤！","")   -------第一话
}
on_quest_deliver[3801] =            -----------显示话名
{
	section(_t"第十卷 爆发！皇后岛的烈焰！",_t"第 2 话  封印！基鲁提的面具！！","")   -------第二话
}
on_quest_deliver[3819] =            -----------显示话名
{
	section(_t"第十卷 爆发！皇后岛的烈焰！",_t"第 3 话  绝杀！逼近的死亡陷阱！","")   -------第三话
}

-- 一辉回忆
--------------------------------------------
on_quest_award[3893] =             ----------沉眠火山喷发动画
{
	show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1311),
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
	hide_mask(),
}
on_quest_award[3886] =             ----------一辉大战沙加动画
{
	show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1313),
	screen_fade_in(),        --黑屏渐出
	hide_mask(),
}
on_quest_deliver[3739] =          ----------黑暗天狼出现镜头
{
	show_mask(),                -------黑边出现
    play_smart_camera(51),
	hide_mask(),                -------黑边取消
}
on_quest_deliver[3871] =          ----------死亡矿坑镜头
{
	show_mask(),                -------黑边出现
    play_smart_camera(52),
	hide_mask(),                -------黑边取消
}
on_quest_award[2551] =             ----------欺瞒神的男人完成黑屏文字
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=10000, _t"加隆消失在了遗忘之路……",_t"一个男人居然可以连神明也欺瞒",_t"那么，等他再次出现在这个世界上的时候",_t"会掀起怎样的血雨腥风",""},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(2000),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_deliver[3817] =             ----------枫黛基鲁提面具动画
{
	show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1314),
	screen_fade_in(),        --黑屏渐出
	hide_mask(),
}

--------------------------------------------
-- 东西伯利亚
--------------------------------------------

on_change_instance_first_time[7] =             ----------东西伯利亚
{
	instant_black_screen(),
	wait(3000),
	play(1016),
}

on_quest_deliver[4582] =             ----------第十一卷
{
	chapter(_t"第一卷",_t"封印！海皇之力量！"),  -------卷名
}
on_quest_deliver[4583] =            -----------第十一卷第一话
{
	section(_t"第一卷 封印！海皇之力量！",_t"第 1 话  艾尔扎克！死去的男人！"),   -------第一话
}
on_quest_deliver[4594] =            -----------第十一卷第二话
{
	section(_t"第一卷 封印！海皇之力量！",_t"第 2 话  破裂！永久冰壁！"),   -------第二话
}
on_quest_deliver[4608] =            -----------第十一卷第三话
{
	section(_t"第一卷 封印！海皇之力量！",_t"第 3 话  蔚蓝大陆！时隔百年的同盟！"),   -------第三话
}
on_quest_deliver[4630] =             ----------第十二卷
{
	chapter(_t"第二卷",_t"血与火！极北之地的荣耀！"),  -------卷名
}
on_quest_deliver[4637] =            -----------第十二卷第一话
{
	section(_t"第二卷 血与火！极北之地的荣耀！",_t"第 1 话  北欧！传说的勇士！"),   -------第一话
}
on_quest_deliver[4663] =            -----------第十二卷第二话
{
	section(_t"第二卷 血与火！极北之地的荣耀！",_t"第 2 话  魔鬼鱼！北冰洋海将军！"),   -------第二话
}
on_quest_deliver[4675] =            -----------第十二卷第三话
{
	section(_t"第二卷 血与火！极北之地的荣耀！",_t"第 3 话  海龙？！双子的另一面！"),   -------第三话
}
on_quest_deliver[4583] =             ----------艾尔扎克登场-动画
{
	show_mask(),
	screen_fade_out(),         --黑屏渐入
	load_animation(1212),
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	screen_fade_in(),          --黑屏渐出
	hide_mask(),
}
on_quest_award[4702] =             ----------冰河被俘黑屏文字
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=10000, _t"亚雷库萨：我需要你的力量，冰河，做我们的伙伴！",_t"冰河：你们想南下侵略，还想让我帮凶？妄想！",_t"亚雷库萨：哼，那就不用多费口舌了。",_t"冰河：钻石星尘拳！什……什么？！钻石星尘拳竟然无效！！",_t"亚雷库萨：蔚蓝脉冲！！"},
	screen_fade_in(),        --黑屏渐出
}
on_quest_deliver[4635] =             ----------中加隆幻魔拳黑屏文字
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=10000, _t"一阵巨大的眩晕袭来",_t"在倒地之前，我隐约看到了加隆离开的背影……",_t"发生了什么？"},
	screen_fade_in(),        --黑屏渐出
}
on_quest_deliver[4647] =             ----------瓦尔基里演讲黑屏文字
{
	show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1215),
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	screen_fade_in(),        --黑屏渐出
}
on_quest_deliver[4628] =             ----------冰河vs亚雷库萨动画黑屏文字
{
	show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1210),
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[4688] =             ----------雪崩动画黑屏文字
{
	show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1213),
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	screen_fade_in(),        --黑屏渐出
}
on_quest_deliver[4670] =             ----------亚雷库萨弑父动画
{
	show_mask(),
	screen_fade_out(),       --黑屏渐入
	load_animation(1214),
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	screen_fade_in(),        --黑屏渐出
}
on_quest_deliver[4600] =             ----------冰河母亲沉船漫画黑屏文字
{
	screen_fade_out(),       --黑屏渐入
	load_animation(4014),    --冰河回忆_母亲船沉没漫画
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[4758] =             ----------与加隆战斗-动画
{
	show_mask(),
	screen_fade_out(),         --黑屏渐入
	load_animation(1211),
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	screen_fade_in(),          --黑屏渐出
	hide_mask(),
}
on_quest_award[4722] =             ----------世界之树-场景展示动画
{
	show_mask(),
	screen_fade_out(),         --黑屏渐入
	load_animation(1505),
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	screen_fade_in(),          --黑屏渐出
	hide_mask(),
}
on_quest_deliver[4667] =             ----------蓝冰堡-场景展示动画
{
	show_mask(),
	screen_fade_out(),         --黑屏渐入
	load_animation(1504),
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	screen_fade_in(),          --黑屏渐出
	hide_mask(),
}
--------------------------------------------
-- 亚特兰蒂斯
--------------------------------------------

on_change_instance_first_time[8] =             ----------亚特兰蒂斯
{
	instant_black_screen(),
	wait(3000),
	play(1017),
}


on_quest_award[4553] =             ----------崩坏！七海之柱！——开场文字
{
	instant_black_screen(),
	show_curtain_text{duration=10000, _t"贵鬼已经带着天秤座圣衣去找星矢了",_t"星矢、紫龙、瞬、冰河，你们一定要击毁七海之柱",_t"雅典娜就交给你们了！",""},
	screen_fade_in(),        --黑屏渐出
	section(_t"第四卷 死斗！蔚蓝的海底神殿！",_t"崩坏！七海之柱！"),   -------伪装成卷话名
}

on_quest_award[4554] =             ----------剧本：七大洋之战。分头行动。
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=3000, _t"仙女座的瞬正在前往南太平洋之柱"},
	instant_black_screen(), 
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[4561] =             ----------剧本：七大洋之战。北太平洋之柱被击碎了。
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=3000, _t"凤凰，再次从地狱的尽头回来了"},
	instant_black_screen(), 
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[4568] =             ----------剧本：七大洋之战。南冰洋之柱被击碎了
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=5000, _t"在一辉等人的奋战下，",_t"除了北大西洋之柱，六大洋之柱纷纷被击碎。"},
	instant_black_screen(), 
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[5331] =             ----------剧本：七大洋之战。生命之柱
{
	screen_fade_out(),       --黑屏渐入
	load_animation(4009),    --播动画：众小强PK海皇
	show_curtain_text{duration=3000, _t"在冰河、紫龙、瞬和莎尔娜的帮助下，星矢击倒了海皇，",_t"一行人前往生命之柱"},     --漫画：射向神的箭！
	instant_black_screen(), 
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[4576] =             ----------剧本：七大洋之战。飞翔吧天马
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=3000, _t"星矢化作一道流星击碎生命之柱，救出了雅典娜",_t"海皇再一次被封印在雅典娜之壶中"},     --动画：击碎生命之柱
	instant_black_screen(), 
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[5178] =             ----------冰河回忆结束黑屏字幕
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=8000, _t"这就是冰河记忆中的艾尔扎克",_t"勇敢",_t"坚强",_t"正义",""},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(2000),              --等待传送
}
on_quest_award[5185] =             ----------玩家vs海马将军拜安
{
	show_mask(),
	screen_fade_out(),       --黑屏渐入
    load_animation(1232),
	screen_fade_in(),        --黑屏渐出
	hide_mask(),
}
on_quest_award[4914] =             ----------玩家中了诅咒
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=10000, "",_t"原来这一切都是海妖卡萨的阴谋",_t"魔铃和黄金圣斗士们都是假的",_t"他一直缓缓的诱导着你",_t"让你不知不觉中踏入死亡陷阱"},
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[4922] =             ----------修亚vs加隆
{
    show_mask(),
	screen_fade_out(),       --黑屏渐入
    load_animation(1230),
	screen_fade_in(),        --黑屏渐出
	hide_mask(),
}
on_quest_award[4929] =             ----------波塞多尼亚展示
{
    show_mask(),
	screen_fade_out(),       --黑屏渐入
    load_animation(1506),
	screen_fade_in(),        --黑屏渐出
	hide_mask(),
}

on_quest_award[4952] =             ----------玩家传送回找众小强黑屏文字
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=6000, _t"通往海皇神殿的道路已经开启",_t"快回去找星矢他们！",_t"开始最后的战斗！"},
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[4943] =             ----------和平的使者-调用镜头
{
	play_smart_camera(48),
}
on_quest_award[4951] =             ----------开启海皇神殿-调用镜头
{
	play_smart_camera(49),
}
on_quest_award[5130] =             ----------沙织踪迹-动画
{
	show_mask(),
	screen_fade_out(),       --黑屏渐入
    load_animation(1231),
	screen_fade_in(),        --黑屏渐出
	hide_mask(),
}
on_quest_deliver[4776] =             ----------显示卷名
{
	chapter(_t"第三卷",_t"大海啸！波塞冬的怒火！")  -------卷名
}
on_quest_deliver[4778] =            -----------显示话名
{
	section(_t"第三卷 大海啸！波塞冬的怒火！",_t"第 1 话  危急！雅典娜被抓走了！","")   -------第一话
}
on_quest_deliver[4787] =            -----------显示话名
{
	section(_t"第三卷 大海啸！波塞冬的怒火！",_t"第 2 话  启示！前代海皇涅柔斯！","")   -------第二话
}
on_quest_deliver[4806] =            -----------显示话名
{
	section(_t"第三卷 大海啸！波塞冬的怒火！",_t"第 3 话  海飞龙！海皇复苏的真相！","")   -------第三话
}
on_quest_deliver[4838] =             ----------显示卷名
{
	chapter(_t"第四卷",_t"死斗！蔚蓝的海底神殿！")  -------卷名
}
on_quest_deliver[4839] =            -----------显示话名
{
	section(_t"第四卷 死斗！蔚蓝的海底神殿！",_t"第 1 话  复活！新生的圣衣！","")   -------第一话
}
on_quest_deliver[4854] =            -----------显示话名
{
	section(_t"第四卷 死斗！蔚蓝的海底神殿！",_t"第 2 话  突破！海皇要塞！","")   -------第二话
}
on_quest_deliver[4877] =            -----------显示话名
{
	section(_t"第四卷 死斗！蔚蓝的海底神殿！",_t"第 3 话  崩溃！七大洋支柱！","")   -------第三话
}
---------------------------------------------
--------------仙女岛
---------------------------------------------

on_change_instance_first_time[9] =             ----------仙女岛
{
	instant_black_screen(),
	wait(3000),
	play(1018),
}

on_quest_deliver[5947] =             ----------显示卷名
{
	chapter(_t"第一卷",_t"挽歌！黄金毁灭者！")  -------卷名
}
on_quest_deliver[5948] =            -----------显示话名
{
	section(_t"第一卷 挽歌！黄金毁灭者！",_t"第 1 话  神话！仙女座传说","")   -------第一话
}
on_quest_deliver[5961] =            -----------显示话名
{
	section(_t"第一卷 挽歌！黄金毁灭者！",_t"第 2 话  血路！被屠之岛","")   -------第二话
}
on_quest_deliver[5976] =             ----------显示卷名
{
	chapter(_t"第二卷",_t"地狱之门！大圣战的序幕！")  -------卷名
}
on_quest_deliver[5977] =            -----------显示话名
{
	section(_t"第二卷 地狱之门！大圣战的序幕！",_t"第 1 话  复活！已成历史的战士！","")   -------第一话
}
on_quest_deliver[5990] =            -----------显示话名
{
	section(_t"第二卷 地狱之门！大圣战的序幕！",_t"第 2 话  魔星！地狱之门决死战","")   -------第二话
}

---------------------------------------------
-----哈迪斯城
-------------------------------------------
on_change_instance_first_time[10] =             ----------哈迪斯城
{
	instant_black_screen(),
	wait(3000),
	play(1019),
}

on_quest_award[6418] =             ----------闯入潘多拉小屋黑屏传送
{
	show_mask(),
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=6000, _t"撒加、卡妙、修罗……",_t"他们的小宇宙就快要消失了！",_t"快！赶过去！"},
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
	hide_mask(),
}
on_quest_award[6413] =             ----------大战拉达曼迪斯黑屏暂代
{
	show_mask(),
	screen_fade_out(),       --黑屏渐入
    load_animation(1250),
	screen_fade_in(),        --黑屏渐出
	hide_mask(),
}
on_quest_award[6419] =             ----------哈迪斯城漫画暂代
{
	screen_fade_out(),       --黑屏渐入
	load_animation(4011),
	screen_fade_in(),        --黑屏渐出
}
on_quest_deliver[9222] =             ----------潜修开启
{
	screen_fade_out(),       --黑屏渐入
	load_animation(1329),
	screen_fade_in(),        --黑屏渐出
}

on_quest_award[6368] =             ----------去遗忘的小路-调用镜头
{
	play_smart_camera(55),
}
on_quest_deliver[6287] =             ----------显示卷名
{
	chapter(_t"第三卷",_t"恸哭！背叛的黄金圣斗士！")  -------卷名
}
on_quest_deliver[6289] =            -----------显示话名
{
	section(_t"第三卷 恸哭！背叛的黄金圣斗士！",_t"第 1 话  阿赖耶识！最后的启示！","")   -------第一话
}
on_quest_deliver[6308] =            -----------显示话名
{
	section(_t"第三卷 恸哭！背叛的黄金圣斗士！",_t"第 2 话  赴死！为了圣斗士的职责！","")   -------第二话
}
on_quest_deliver[6322] =             ----------显示卷名
{
	chapter(_t"第四卷",_t"上吧！通往冥界之门！")  -------卷名
}
on_quest_deliver[6324] =            -----------显示话名
{
	section(_t"第四卷 上吧！通往冥界之门！",_t"第 1 话  诅咒！沉睡十三年的世界！","")   -------第一话
}
on_quest_deliver[6338] =            -----------显示话名
{
	section(_t"第四卷 上吧！通往冥界之门！",_t"第 2 话  前进！哈迪斯城的死斗！","")   -------第二话
}


------------------------------------------------
-------冥界地狱
-------------------------------------------------
on_quest_deliver[9698] =             ----------一辉被潘多拉抓走
{
	screen_fade_out(),       --黑屏渐入
    load_animation(1325),
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[9783] =             ----------被传送去噬魂林
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=2000, _t"一股力量将你包围",_t"你的眼前一片黑暗！"},
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[10169] =             ----------被传送去噬魂林
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=2000, _t"噬魂林的结界已经破碎",_t"快返回热砂地狱吧！"},
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}

on_quest_award[9798] =             ----------泰坦神力的灌注
{
	screen_fade_out(),       --黑屏渐入
    load_animation(1322),
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[9810] =             ----------被传送去该隐厅
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=2000, _t"一股力量将你包围",_t"你的眼前一片黑暗！"},
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[9811] =             ----------该隐厅战斗
{
	screen_fade_out(),       --黑屏渐入
	load_animation(1326),
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_deliver[9745] =             ----------泰坦神力的灌注
{
	screen_fade_out(),       --黑屏渐入
    load_animation(1327),
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[9818] =             ----------破碎叹息之墙漫画播放
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=2000, _t"叹息之墙碎了",""},
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[9755] =             ----------潘多拉之死黑屏喊话
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=12000, _t"潘多拉死了",_t"带着她的不甘与悔恨",_t"还有……祈求！",_t"她祈求————",_t"你们可以顺利到达极乐净土",_t"她祈求————",_t"你们可以杀死冥王哈迪斯！！！",""},
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[9800] =             ----------寒冰地狱发现星矢-调用镜头
{
    show_mask(),
	play_smart_camera(61),
	hide_mask(),
}
on_quest_award[9812] =             ----------犹大环发现瞬-调用镜头
{
    show_mask(),
	play_smart_camera(62),
	hide_mask(),
}
on_quest_deliver[9258] =             ----------追击路尼
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=5000, _t"追击着路尼的小宇宙，向着更深的冥界前进！"},
	screen_fade_in(),        --黑屏渐出
}
on_quest_deliver[9908] =             ----------到达花圃
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=5000, _t"在强大的音乐小宇宙之下，青铜圣斗士们失去了知觉……"},
	screen_fade_in(),        --黑屏渐出
}
on_quest_deliver[9280] =             ----------龙与白鸟
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=8000, _t"与紫龙和冰河并肩前进，向着地狱的深处进军，很快来到了暗无天日的泥沼地狱。"},
	screen_fade_in(),        --黑屏渐出
}
on_quest_deliver[9234] =             ----------渡过阿格龙河-动画
{
	show_mask(),
	screen_fade_out(),         --黑屏渐入
	load_animation(1320),
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	screen_fade_in(),          --黑屏渐出
	hide_mask(),
}
on_quest_deliver[9908] =             ----------尤利缇斯-动画
{
	show_mask(),
	screen_fade_out(),         --黑屏渐入
	show_curtain_text{duration=5000, _t"奥路菲居然向你们发动了攻击！这是怎么回事？",_t"当你带着疑问醒来时，眼前却出现了这样一幕……"},
	load_animation(1321),
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	screen_fade_in(),          --黑屏渐出
	hide_mask(),
}
on_quest_deliver[9241] =             ----------沙加出场-动画
{
	show_mask(),
	screen_fade_out(),         --黑屏渐入
	load_animation(1323),
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	screen_fade_in(),          --黑屏渐出
	hide_mask(),
}
on_quest_deliver[9264] =             ----------秒杀六天星-动画
{
	show_mask(),
	screen_fade_out(),         --黑屏渐入
	load_animation(1324),
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	screen_fade_in(),          --黑屏渐出
	hide_mask(),
}
on_quest_deliver[9273] =             ----------音之战-动画
{
	show_mask(),
	screen_fade_out(),         --黑屏渐入
	load_animation(1328),
	instant_black_screen(),  --立刻黑屏（否则动画播完后会看到角色在场景中）
	screen_fade_in(),          --黑屏渐出
	hide_mask(),
}

on_quest_deliver[9681] =             ----------显示卷名
{
	chapter(_t"第二卷",_t"集结！黄金圣斗士！")  -------卷名
}
on_quest_deliver[9682] =            -----------显示话名
{
	section(_t"第二卷 集结！黄金圣斗士！",_t"第 1 话  罪与罚！灵魂的归宿","")   -------第一话
}
on_quest_deliver[9716] =            -----------显示话名
{
	section(_t"第二卷 集结！黄金圣斗士！",_t"第 2 话  指引！潘多拉的企图？！","")   -------第二话
}
on_quest_deliver[9223] =             ----------显示卷名
{
	chapter(_t"第一卷",_t"绝不回头！地狱中的阳光！")  -------卷名
}
on_quest_deliver[9225] =            -----------显示话名
{
	section(_t"第一卷 绝不回头！地狱中的阳光！",_t"第 1 话  裁断！寂静之声！","")   -------第一话
}
on_quest_deliver[9265] =            -----------显示话名
{
	section(_t"第一卷 绝不回头！地狱中的阳光！",_t"第 2 话  永恒的爱！花圃中的弦音！","")   -------第二话
}
--------------------------------------------
-- 职业任务
--------------------------------------------
on_quest_deliver[5381] =           ----------战斗！沉着的格挡！-中间喊话-天马
{
	use_normal_stage = true,	-- 不使用动画舞台
	central_message(_t"按住Q键格挡，可化解檄的“巨熊吊杀”"),
}

on_quest_deliver[5387] =           ----------战斗！沉着的格挡！-中间喊话-白鸟
{
	use_normal_stage = true,	-- 不使用动画舞台
	central_message(_t"按住Q键格挡，可化解市的“水蛇的毒牙”"),
}

on_quest_deliver[5392] =           ----------战斗！沉着的格挡！-中间喊话-天龙
{
	use_normal_stage = true,	-- 不使用动画舞台
	central_message(_t"按住Q键格挡，可化解蛮的“幼狮轰炸”"),
}

on_quest_deliver[5397] =           ----------战斗！沉着的格挡！-中间喊话-仙女
{
	use_normal_stage = true,	-- 不使用动画舞台
	central_message(_t"按住Q键格挡，可化解邪武的“独角飞奔”"),
}

on_quest_deliver[5402] =           ----------战斗！沉着的格挡！-中间喊话-凤凰
{
	use_normal_stage = true,	-- 不使用动画舞台
	central_message(_t"按住Q键格挡，可化解那智的“死亡咆哮”"),
}


--------------------------------------------
-- 黄金十二宫
--------------------------------------------
on_quest_award[6272] =             ----------剧本：十二宫-白羊宫-进入副本
{
	chapter("",_t"危急！女神中箭！"),  ------伪装成卷名
}
on_quest_award[6273] =             ----------剧本：十二宫-白羊宫-纱织中箭
{
	screen_fade_out(),       --黑屏渐入
	show_mask(),             --显示字幕 
	instant_black_screen(),  --立即黑屏
	load_animation(2201),    --播动画“纱织中箭”
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
	hide_mask(),             --去除字幕
}
on_quest_award[6276] =             ----------剧本：十二宫-白羊宫-前往白羊宫
{
	screen_fade_out(),       --黑屏渐入
	show_mask(),             --显示字幕 
	instant_black_screen(),  --立即黑屏
	load_animation(1111),    --播动画“十二宫点燃火时钟”
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
	hide_mask(),             --去除字幕
}
on_quest_award[6279] =             ----------剧本：十二宫-白羊宫-进入白羊宫变身贵鬼
{
	screen_fade_out(),       --黑屏渐入
	show_mask(),             --显示字幕 
	instant_black_screen(),  --立即黑屏
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
	hide_mask(),             --去除字幕
}
on_quest_award[6285] =             ----------剧本：十二宫-白羊宫-穆修圣衣
{
	screen_fade_out(),       --黑屏渐入
	show_mask(),             --显示字幕 
	show_curtain_text{duration=4000, _t"白羊座穆修复了星矢四人的圣衣，",_t"星矢四人开始向第二宫金牛宫进发。"},
	instant_black_screen(),
	wait(),
	load_animation(1113),    --播动画“钟楼火熄灭_白羊
	instant_black_screen(),  --立即黑屏
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
	hide_mask(),             --去除字幕
}
on_quest_award[8513] =             ----------剧本：十二宫-金牛宫-进入副本
{
	chapter("",_t"恶战！黄金野牛之拳！"),  ------伪装成卷名
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
}
on_quest_award[8524] =             ----------剧本：十二宫-金牛宫-通过金牛宫，钟楼火熄灭
{
	screen_fade_out(),       --黑屏渐入
	show_mask(),             --显示字幕 
	instant_black_screen(),  --立即黑屏
	load_animation(1114),    --播动画“钟楼火熄灭_金牛”
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
	hide_mask(),             --去除字幕
}
on_quest_award[8803] =             ----------剧本：十二宫-巨蟹宫-进入副本
{
	chapter("",_t"恐怖！万鬼的巨蟹宫！"),  ------伪装成卷名
}
on_quest_award[8978] =             ----------剧本：十二宫-巨蟹宫-春丽的祝福
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=20000, _t"“不！！！不要伤害春丽！！！”",_t"紫龙大吼着",_t"天龙圣衣甚至不能再承载紫龙的力量",_t""},
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[8977] =             ----------剧本：十二宫-巨蟹宫-春丽的祝福
{
	screen_fade_out(),       --黑屏渐入
	play(1116),              --播放动画
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[9831] =             ----------剧本：十二宫-处女宫-进入副本
{
	chapter("",_t"沙加！接近神的男人！"),  ------伪装成卷名
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
}
on_quest_award[9843] =             ----------剧本：十二宫-处女宫-三小强进入处女宫
{
	screen_fade_out(),       --黑屏渐入
	show_mask(), 
	show_curtain_text{duration=3000, _t"星矢、紫龙和瞬被处女座的沙加打倒在地。"},  --load_animation(沙加出场),
	instant_black_screen(),
	wait(),
	show_curtain_text{duration=3000,_t"此时，来自死亡皇后岛的一辉出现在处女宫前。"},
	instant_black_screen(), 
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
	hide_mask(),             --去除字幕
}
on_quest_award[9854] =             ----------剧本：十二宫-处女宫-一辉与沙加同归于尽
{
	screen_fade_out(),       --黑屏渐入
	show_mask(), 
	show_curtain_text{duration=3000, _t"一辉将小宇宙燃烧到极限，与沙加同归于尽"},  --load_animation(一辉与沙加同归于尽),
	instant_black_screen(),
	wait(),
	show_curtain_text{duration=6000,_t"一辉：瞬，如果真的有来生，下辈子我们再一起做兄弟吧……",_t"瞬：哥哥……"},
	instant_black_screen(), 
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
	hide_mask(),             --去除字幕
}
on_quest_award[9856] =             ----------剧本：十二宫-处女宫-处女宫火焰熄灭
{
	screen_fade_out(),       --黑屏渐入
	show_mask(),             --显示字幕 
	instant_black_screen(),  --立即黑屏
	load_animation(1118),    --播动画“钟楼火熄灭_处女”
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
	hide_mask(),             --去除字幕
}
on_quest_award[9997] =             ----------剧本：十二宫-天秤宫-进入副本
{
	chapter("",_t"极寒！冰封的天秤宫！"),  ------伪装成卷名
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
}
on_quest_award[10008] =             ----------剧本：十二宫-天秤宫-瞬回忆在异次元空间
{
	screen_fade_out(),       --黑屏渐入
	show_mask(), 
	show_curtain_text{duration=3000, _t"不久前，在异次元空间中"},  
	instant_black_screen(), 
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
	hide_mask(),             --去除字幕
}
on_quest_award[10011] =             ----------剧本：十二宫-天秤宫-冰河被拖入异次元深处
{
	screen_fade_out(),       --黑屏渐入
	show_mask(), 
	show_curtain_text{duration=3000, _t"瞬：冰河！！！"},  
	instant_black_screen(), 
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
	hide_mask(),             --去除字幕
}
on_quest_award[10015] =             ----------剧本：十二宫-天秤宫-卡妙冰封了冰河
{
	screen_fade_out(),       --黑屏渐入
	show_mask(), 
	show_curtain_text{duration=5000, _t"卡妙：爱徒冰河，",_t"如果你继续向前，",_t"一定会死在其他黄金圣斗士的手上，",_t"与其这样，","不如让为师帮你解脱吧。"},  
	instant_black_screen(), 
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
	hide_mask(),             --去除字幕
}
on_quest_award[10020] =             ----------剧本：十二宫-天秤宫-击碎冰棺
{
	screen_fade_out(),       --黑屏渐入
	show_mask(), 
	show_curtain_text{duration=3000, _t"紫龙用天秤座的长剑击碎了冰棺，",_t"但冰河仍然没有醒过来。"},  
	instant_black_screen(), 
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
	hide_mask(),             --去除字幕
}
on_quest_award[10023] =             ----------剧本：十二宫-天秤宫-天秤宫火焰熄灭
{
	screen_fade_out(),       --黑屏渐入
	show_mask(), 
	show_curtain_text{duration=5000, _t"瞬：冰河，我会把小宇宙燃烧到最高来温暖你，",_t"但是，会是你先醒来，",_t"还是我的生命先燃烧殆尽呢……"},  
	instant_black_screen(),
	wait(),
	load_animation(1119),    --播动画“钟楼火熄灭_天秤”
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
	hide_mask(),             --去除字幕
}
on_quest_award[10452] =             ----------剧本：十二宫-射手宫-进入副本
{
	chapter("",_t"考验！射手的托付！"),  ------伪装成卷名
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
}
on_quest_award[10468] =             ----------剧本：十二宫-射手宫-来到这里的少年啊！雅典娜托付给你们了
{
	screen_fade_out(),       --黑屏渐入
	show_mask(), 
	show_curtain_text{duration=7000, _t"射手座黄金圣衣向一面墙壁射出了黄金箭，",_t"墙壁表面剥落，露出几行字：",_t"“来到这里的少年啊！雅典娜托付给你们了……",_t"——艾欧罗斯”"},  
	instant_black_screen(), 
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
	hide_mask(),             --去除字幕
}
on_quest_award[10469] =             ----------剧本：十二宫-射手宫-射手宫火焰熄灭
{
	screen_fade_out(),       --黑屏渐入
	show_mask(), 
	load_animation(1121),    --播动画“钟楼火熄灭_射手”
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
	hide_mask(),             --去除字幕
}
on_quest_award[11068] =             ----------剧本：十二宫-摩羯宫-进入副本
{
	chapter("",_t"修罗！拥有圣剑的男人！"),  ------伪装成卷名
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
}
on_quest_award[11079] =             ----------剧本：十二宫-摩羯宫-射手宫火焰熄灭
{
	screen_fade_out(),       --黑屏渐入
	show_mask(), 
	show_curtain_text{duration=3000, _t"紫龙施展出了庐山亢龙霸",_t"与摩羯座修罗同归于尽"},  
	instant_black_screen(),
	wait(),
	show_curtain_text{duration=6000, _t"修罗：紫龙，你应该继续活下去，为了雅典娜奋战到底。",_t"我会让摩羯座的黄金圣衣保护你平安回去，",_t"而我，将变成星辰，在天上守护着雅典娜……"},  
	instant_black_screen(),
	load_animation(1122),    --播动画“钟楼火熄灭_摩羯”
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
	hide_mask(),             --去除字幕
}
on_quest_award[11546] =             ----------剧本：十二宫-双鱼宫-进入副本
{
	chapter("",_t"玫瑰葬礼！决战教皇！"),  ------伪装成卷名
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
}
on_quest_award[11554] =             ----------剧本：十二宫-双鱼宫-击败阿布罗狄
{
	screen_fade_out(),       --黑屏渐入
	show_mask(), 
	show_curtain_text{duration=6000, _t"瞬击败了双鱼座阿布罗狄，", _t"遍地的花瓣，仿佛在进行一场绚烂的玫瑰葬礼。",_t"而瞬也被阿布罗狄的吸血玫瑰击中，濒临死亡"},  
	instant_black_screen(),
	wait(),
	show_curtain_text{duration=2000, _t"与此同时，天鹰座的魔铃赶到了双鱼宫",},  
	instant_black_screen(),
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
	hide_mask(),             --去除字幕
}
on_quest_award[11557] =             ----------剧本：十二宫-双鱼宫-魔铃救星矢
{
	screen_fade_out(),       --黑屏渐入
	show_mask(), 
	show_curtain_text{duration=6000, _t"魔铃将自己的面具给星矢戴上，", _t"自己却昏迷在充满玫瑰毒气的道路上。",_t"星矢慢慢醒了过来……"},  
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
	hide_mask(),             --去除字幕
}
on_quest_award[11562] =             ----------剧本：十二宫-双鱼宫-一辉拖住教皇
{
	screen_fade_out(),       --黑屏渐入
	show_mask(), 
	show_curtain_text{duration=6000, _t"一辉为星矢挡下了致命一击后，众人的小宇宙也纷纷浮现在星矢身后。", _t"星矢挥出天马彗星拳，击倒了双子座撒加",_t"接着，星矢蹒跚着走向雅典娜神殿。"},  
	instant_black_screen(),
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
	hide_mask(),             --去除字幕
}
on_quest_award[11564] =             ----------剧本：十二宫-双鱼宫-雅典娜苏醒
{
		screen_fade_out(),       --黑屏渐入
	show_mask(), 
	load_animation(2202),    --播动画“钟楼火熄灭_射手”show_curtain_text{duration=6000, _t"在圣域火钟即将熄灭的一刻，星矢拿到了雅典娜之盾，", _t"雅典娜之盾的光芒洒向整个圣域，",_t"融化了雅典娜胸口的黄金之箭。"}, show_curtain_text{duration=4000, _t"双子座撒加心中的恶念被圣洁的光芒驱散，",_t"但他无法原谅自己的罪过，向雅典娜自杀谢罪。"}, 
	award(),                 --发奖（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送	
	screen_fade_in(),        --黑屏渐出
	hide_mask(),             --去除字幕
}
on_quest_award[8632] =             ----------Q版纱织-开场动画
{
	play(2043),              --播放动画
}
on_quest_award[9120] =             ----------剧本：十二宫-双子宫-进入副本
{
	chapter("",_t"正邪！双子的困惑！"),  ------伪装成卷名
}
on_quest_award[9564] =             ----------剧本：十二宫-双子宫-结束
{
	screen_fade_out(),       --黑屏渐入
	play(1115),              --播放动画
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[9881] =             ----------剧本：十二宫-狮子宫-进入副本
{
	chapter("",_t"苏醒！噩梦中雄狮！"),  ------伪装成卷名
}
on_quest_award[9888] =             ----------剧本：十二宫-狮子宫-结束
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=12000, _t"“就在城户沙织身中黄金箭之前”",_t"“艾欧里亚闯进教皇宫”",_t"“准备质问永远躲在面具后面的教皇的阴谋”",_t""},
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[9896] =             ----------剧本：十二宫-狮子宫-结束
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=12000, _t"正义的黄金狮子",_t"已经被恶魔一般的魔幻拳",_t"夺走了心底最后一丝的光明",_t""},
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[9943] =             ----------剧本：十二宫-狮子宫-结束
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=15000,_t"狮子终于恢复了神智，然而卡西欧士却付出了自己年轻的生命",_t"更加强大的敌人在前方等待着青铜圣斗士们",_t""},
	play(1117),              --播放动画
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[9941] =             ----------剧本：十二宫-狮子宫-结束
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=20000,_t"射手座黄金圣衣",_t"消失已久的黄金圣衣居然出现在了狮子宫",_t"然后穿在了星矢的身上",_t""},
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[10068] =             ----------剧本：十二宫-天蝎宫-结束
{
	chapter("",_t"禁断！毒针下的天蝎宫！"),  ------伪装成卷名
}
on_quest_award[10074] =             ----------剧本：十二宫-狮子宫-结束
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=20000, _t"蝎子的毒针刺进了天龙和天马的心脏",_t"仙女也燃尽自己",_t"只为保留朋友最后一丝",_t"胜利的曙光",_t""},
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[10480] =             ----------剧本：十二宫-狮子宫-结束
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=10000, _t"冰河终于在瞬温暖的小宇宙中苏醒了过来",_t"但是瞬也精疲力尽倒在了前往天蝎宫的路上",_t""},
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[10085] =             ----------剧本：十二宫-水瓶宫-结束
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=20000, _t"终于可以顺利通过天蝎宫，但是前面的敌人恐怕更加可怕",_t"可是无论如何也不能放弃自己信念",_t"即便第一百次被击倒，也可以一百零一次的爬起来",_t"这就是圣斗士的信念！",_t""},
	play(1120),              --播放动画
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[10540] =             ----------剧本：十二宫-天蝎宫-结束
{
	chapter("",_t"究极冻气！绝对零度！"),  ------伪装成卷名
}
on_quest_award[10689] =             ----------剧本：十二宫-水瓶宫-结束
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=15000, _t"被巨大冰棺封印的冰河",_t"回忆起了曾经在水瓶宫与老师卡妙修行的日子",_t"一块又一块的冰棺出现，一块又一块的冰棺又被冰河击碎",_t""},
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[10688] =             ----------剧本：十二宫-水瓶宫-结束
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=15000, _t"冰河振作起来，冰河振作起来啊",_t"回忆里卡妙师傅一遍又一遍的重复着这句话",_t"冰河振作起来，冰河振作起来啊",_t""},
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
on_quest_award[10564] =             ----------剧本：十二宫-水瓶宫-结束
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=20000, _t"终于冰河在卡妙最后的指导之下完成了绝对零度的修行",_t"体力不支的冰河终于随卡妙之后倒在了水瓶宫中",_t"一朵朵的雪花从天而降，像是一阵阵絮语",_t"在轻轻告别",_t""},
	play(1123),              --播放动画
	award(),                 --发奖传送（勾选了“发放奖励前等待客户端通知”）
    wait(),                  --等待传送
	screen_fade_in(),        --黑屏渐出
}
--------------------------------------------
-- 英雄副本：女神的挽歌（前-后）
--------------------------------------------
on_quest_deliver[10049] =          ----------英雄副本：女神的挽歌前-冥界入侵
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=8000, _t"“冥王哈迪斯复生了已经死去的黄金圣斗士并控制了他们”",_t"“冥斗士在撒加、卡妙和修罗的率领下进攻十二宫！”",_t"“甚至前代教皇白羊座的史昂也与雅典娜为敌，十二宫陷入了前所未有的危机！”",_t""},
	load_animation(2046),
	screen_fade_in(),        --黑屏渐出
}
on_quest_deliver[10032] =          ----------英雄副本：女神的挽歌后-沙织之死
{
	screen_fade_out(),       --黑屏渐入
	show_curtain_text{duration=8000, _t"“复生死去的黄金圣斗士，让黄金圣斗士之间互相残杀”",_t"“这一切都是冥王哈迪斯的阴谋”",_t"“为了避免更多的流血，女神决定牺牲自己，只身前往冥界与哈迪斯对决！”",_t""},
	load_animation(2049),
	screen_fade_in(),        --黑屏渐出
}

--------------------------------------------
-- 任务失败时播放动画
--------------------------------------------

--on_quest_failed[???] = {...}

