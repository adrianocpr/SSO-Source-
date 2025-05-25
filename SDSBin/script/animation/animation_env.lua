---------------------------------------------------
-- define chain tasks env for animation_config.lua
-- see chain.lua for more information of chain tasks
-- 
-- @author FengBo
local pe = require("config.post_effect")

on_change_instance = {}
on_change_instance_first_time = {}
on_quest_deliver = {}
on_quest_award = {}
on_quest_failed = {}
on_use_item = {}
on_gather_start = {}
on_gather_success = {}

local dialogs_need_clear = 
{
	"Panel_NpcMask1",
	"Panel_NpcMask2",
	"Panel_AnimationMask1",
	"Panel_AnimationMask2",
	"Panel_AniText",
	"Panel_ChapterTips",
	"Panel_Chapter",
	"Panel_Section",
	"Panel_AniText",
}

function prepare()
	DlgApiEx.PushGameUIStage(GameUI.UI_STAGE_ANIMATION)
end

function finally_clean(chain)
	if type(chain.context.effect_index) == "number" then
		GameApi.PopPostEffect()
	end

	for _, dlg in ipairs(dialogs_need_clear) do
		DlgApi.ShowDialog(dlg, false)
	end

	DlgApiEx.PopGameUIStage(GameUI.UI_STAGE_ANIMATION)
	DlgApiEx.SetUIMaskAlpha(0)
end

function wait(time)
	time = time or 1000
	return {
		run = function(self, chain)
			set_timeout(function()
				chain:next()
			end, time)
		end
	}
end

-- 动画显示上下黑边
function show_mask()
	return {
		run = function(self, chain)
			GameUI.ShowAnimationMask(function()
				chain:next()
			end)
		end
	}
end

-- 显示动画黑边的同时屏幕逐渐变黑
function show_mask_with_screen_fade_out()
	return chain:new{
		function() GameUI.ShowAnimationMask() end,
		screen_fade_out(),
	}
end

-- 动画隐藏上下黑边
function hide_mask()
	return {
		run = function(self, chain)
			GameUI.HideAnimationMask(function()
				chain:next()
			end)
		end
	}
end

-- 显示动画黑边的同时屏幕逐渐变黑
function hide_mask_with_screen_fade_in()
	return chain:new{
		function()
			if DlgApiEx.GetUIMaskAlpha() > 0 then
				ani.screen.fade_in()
			end
		end,
		hide_mask(),
	}
end

-- 屏幕立即黑屏(注意：需和其它动作组合，否则黑屏会一直持续)
function instant_black_screen()
	return function() DlgApiEx.SetUIMaskAlpha(255) end
end

-- 持续黑屏一段时间
function black_screen(duration)
	duration = duration or 5000
	return chain:new{
		screen_fade_out(),
		wait(duration),
		screen_fade_in(),
	}
end

-- 屏幕逐渐变黑
function screen_fade_out(duration)
	return {
		run = function(self, chain)
			ani.screen.fade_out{
				duration = duration,
				oncomplete = function()
					chain:next()
				end
			}
		end
	}
end

-- 屏幕逐渐由黑屏恢复正常
function screen_fade_in(duration)
	return {
		run = function(self, chain)
			DlgApiEx.SetUIMaskAlpha(255)
			ani.screen.fade_in{
				duration = duration,
				oncomplete = function()
					chain:next()
				end
			}
		end
	}
end

-- 开始动画
function load_animation(id)
	return {
		run = function(self, chain)
			local _id = id or chain.context.ani_id or 0
			if not animation:get_config(_id) then 
				chain:next()
				return
			end
			
			GameUI:ShowAnimationMask{instantly = true}
			DlgApiEx.LoadAnimation(_id, function()
				GameUI:HideAnimationMask{instantly = true}
				chain:next()
			end)
		end
	}
end

-- 播放swf
function load_swf(path)
	return {
		run = function(self, chain)
			DlgApiEx.LoadSwf(path, function()
				chain:next()
			end)
		end
	}
end

-- 这是一个组合动作，
-- 将顺序执行show_mask, screen_fade_out, load_animation, screen_fade_in, hide_mask
function play(id)
	return chain:new{
		screen_fade_out(),
		load_animation(id),
		screen_fade_in(),
	}
end

-- 显示章
function show_chapter(chapter, title, text, duration)
	duration = duration or 3000
	
	return {
		run = function(self, chain)
			DlgApi.SetItemText("Panel_Chapter", "Label_ChapterNum", chapter or "")
			DlgApi.SetItemText("Panel_Chapter", "Label_ChapterTitle", title or "")		
			DlgApi.SetItemText("Panel_Chapter", "Label_ChapterText", text or "")
			ani.dialog.fade_in("Panel_Chapter", function()
				set_timeout(function()
					ani.dialog.fade_out("Panel_Chapter", function()
						chain:next()
					end)
				end, duration)
			end)
		end
	}
end

-- 显示章，包含了显示黑边的过程
function chapter(chapter, title, text, duration)
	return chain:new{
		show_mask(),
		show_chapter(chapter, title, text, duration),
		hide_mask(),
	}
end

-- 显示节
function show_section(chapter, section, text, duration)
	duration = duration or 3000
	
	return {
		run = function(self, chain)
			DlgApi.SetItemText("Panel_Section", "Label_ChapterTitle", chapter or "")
			DlgApi.SetItemText("Panel_Section", "Label_SectionTitle", section or "")		
			DlgApi.SetItemText("Panel_Section", "Label_SectionText", text or "")		
			ani.dialog.fade_in("Panel_Section", function()
				set_timeout(function()
					ani.dialog.fade_out("Panel_Section", function()
						chain:next()
					end)
				end, duration)
			end)
		end
	}
end

-- 显示节，包含了显示黑边的过程
function section(chapter, section, text, duration)
	return chain:new{
		show_mask(),
		show_section(chapter, section, text, duration),
		hide_mask(),
	}
end

-- 显示多行渐入文字，需要在黑屏的状态下使用
function show_curtain_text(texts)
    return chain:new{
    	function() DlgApiEx.SetUIMaskAlpha(0) end,
    	{
    		run = function(self, chain)
    			local dlg = ui.dialog.get("Panel_AniText")
    			dlg:show_text(texts, function()
    				chain:next()
				end)
			end
    	},
    	function() DlgApiEx.SetUIMaskAlpha(255) end,
    }
end

-- 显示黑屏并显示多行渐入文字，包含了显示黑边的过程
function curtain_text(texts)
    return chain:new{
    	screen_fade_out(),
		show_curtain_text(texts),
		screen_fade_in(),
    }
end

-- 通知服务器发放任务奖励。配合任务编辑器中“发放奖励前等待客户端通知”功能使用
function award()
	return {
		run = function(self, chain) 
			local task_id = chain.context.task_id or 0
			if task_id > 0 then
				GameApi.TaskNotifyServerAward(task_id, 0)
			end
			set_timeout(function() chain:next() end)
		end
	}
end

-- 通知服务器触发任务
function trig(task_id)
	return {
		run = function(self, chain) 
			if task_id > 0 then
				GameApi.MaunallyTrigTask(task_id)
			end
			set_timeout(function() chain:next() end)
		end
	}
end

-- 等待玩家传送结束
function wait_for_teleport()
	return wait(1000)
end

-- 自动寻径至某个位置
function auto_move_to(...)
	local dest = nil
	if type(arg[1]) == "table" then
		dest = { x = arg[1].x, y = arg[1].y, z = arg[1].z, map = arg[1].map }
	else
		dest = { x = arg[1], y = arg[2], z = arg[3], map = arg[4] }
	end
		
	if dest.x and dest.y and dest.z and dest.map then
		return {
			run = function(self, chain)
				GameApi.StartAutoMove(dest.x, dest.y, dest.z, dest.map)
				set_timeout(function() chain:next() end)
			end
		}
	else
		return {}
	end
end

-- 屏幕中央显示提示信息
function central_message(msg)
	return function()
		msg = msg and tostring(msg) or ""
		DebugApi.AddMarqueeMsg(msg)
	end
end

-- 调用smart_camera
function play_smart_camera(camera_id)
	return {
		run = function(self, chain)
			local interval_id = 0
			smart_camera:play(camera_id)
			interval_id = set_interval(function()
				-- 每个tick检查smartcamera是否结束
				if not GameApi.IsPlayingSmartCamera() then
					chain:next()
					clear_interval(interval_id)
				end
			end)
		end
	}
end

function start_post_effect(name, duration)
	return {
		run = function(self, chain)
			local effect = pe.get(name)
			if effect then
				chain.context.effect_name = name
				if type(effect.cc) == "table" and type(effect.cc.factor) == "number" then
					ani:new{
						start_state = 0,
						end_state = effect.cc.factor,
						duration = duration,
						oninit = function(self)
							chain.context.effect_index = GameApi.PushPostEffect(effect)
						end,
						onpopulate = function(self, state)
							effect.cc.factor = state
							GameApi.UpdatePostEffect(chain.context.effect_index, effect)
						end,
						oncomplete = function()
							chain:next()
						end
					}
				else
					GameApi.PushPostEffect(effect)
					set_timeout(function()
						chain:next()
					end, duration)
				end
			else
				chain:next()
			end
		end
	}
end

function end_post_effect(duration)
	return {
		run = function(self, chain)
			local effect = pe.get(chain.context.effect_name)
			if effect then
				if type(effect.cc) == "table" and type(effect.cc.factor) == "number" then
					ani:new{
						start_state = effect.cc.factor,
						end_state = 0,
						duration = duration,
						onpopulate = function(self, state)
							effect.cc.factor = state
							GameApi.UpdatePostEffect(chain.context.effect_index, effect)
						end,
						oncomplete = function()
							chain.context.effect_name = nil
							chain.context.effect_index = nil
							GameApi.PopPostEffect()
							chain:next()
						end
					}
				else
					set_timeout(function()
						chain.context.effect_name = nil
						chain.context.effect_index = nil
						GameApi.PopPostEffect()
						chain:next()
					end, duration)
				end
			end
			chain:next()
		end
	}
end

function post_effect(name, duration)
	duration = duration or 1000
	return chain:new{
    	start_post_effect(name, duration / 2),
		end_post_effect(duration / 2),
    }
end

function play_gfx(file_path)
	return function()
		GameApi.PlayGfx(file_path)
	end
end