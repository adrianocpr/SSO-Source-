local UIManTemplate = UIManTemplate
local DlgApi  = DlgApi
local GameAi = GameAi
local Format = string.format
local Gsub	  = string.gsub

GameUI = UIManTemplate:new({this = "GameUI", index = UIMAN_INGAME})
glb_curUIMan = GameUI

-------------------------------------
--		Game UI mode config
-------------------------------------
GameUI.UI_STAGE_NORMAL = 0
GameUI.UI_STAGE_TALKING = 1
GameUI.UI_STAGE_ANIMATION = 2
GameUI.UI_STAGE_MOVIEEFFECK = 3
GameUI.UI_STAGE_PLAYER_APPEARANCE = 4
GameUI.UI_STAGE_CAMERA = 5
GameUI.UI_STAGE_PRINT_SCREEN = 6


GameUI.stage_config = {}

GameUI.stage_config[GameUI.UI_STAGE_NORMAL] =
{
	black_list = 
	{
		--"Panel_AnimationMask.*",
		"Panel_ChapterTips",
		"Panel_Chapter",
		"Panel_Section",
		"Panel_AniText",
	},
}


GameUI.stage_config[GameUI.UI_STAGE_TALKING] =
{
	black_list =
	{
		"Panel_Main.*",
		--"Panel_Chat.*",
		"Panel_Radar.*",
		"Panel_Portrait.*",
		"Panel_QuestTrace",
		"Panel_QuickBar.*",
		"Panel_Buff.*",
		"Panel_Exp",
		"Panel_DoubleExp",
		"Panel_SystemBar",		
		"Panel_ToolBar",		
		"Panel_GuideBar",
		"Panel_GuideMsg",
		"Panel_SkillsEnergy",
		"Panel_SkillsBean",
		"Panel_SkillsIce",
		"Panel_SkillsFire",
		"Panel_HelpSecretary",
		"Panel_HelpDynDirection",
		"Panel_GuidePortable",
	}
}

GameUI.stage_config[GameUI.UI_STAGE_ANIMATION] =
{
	white_list = 
	{
		"Panel_AnimationMask.*",
		"Panel_ChapterTips",
		"Panel_Chapter",
		"Panel_Section",
		"Panel_AniText",
		"Panel_AnimationName",
		"Panel_QTE",
		"Panel_AnimationGfx",
		"Panel_QTEfinish",
		"Panel_QteHint",
		"Panel_QtePic",
	},
}

GameUI.stage_config[GameUI.UI_STAGE_MOVIEEFFECK] =
{
	black_list =
	{
		"Panel_Main.*",
		--"Panel_Chat.*",
		"Panel_Radar.*",
		"Panel_Portrait.*",
		"Panel_QuestTrace",
		"Panel_QuestAvailable",
		"Panel_QuickBar.*",
		"Panel_Buff.*",
		"Panel_Exp",
		"Panel_DoubleExp",
		"Panel_SystemBar",
		"Panel_SkillsEnergy",
		"Panel_ToolBar",
		"Panel_SkillsBean",
		"Panel_GuideBar",
		"Panel_GuideMsg",
		"Panel_SkillsIce",
	}
}

GameUI.stage_config[GameUI.UI_STAGE_PLAYER_APPEARANCE] =
{
	black_list =
	{
		".*",
	}
}

GameUI.stage_config[GameUI.UI_STAGE_CAMERA] =
{
	white_list = 
	{
		"Panel_Shots.*",
		"Panel_ShotsConfig",
		"Panel_HidePanel",
	},
}

GameUI.stage_config[GameUI.UI_STAGE_PRINT_SCREEN] =
{
	black_list =
	{
		".*",
	}
}

function GameUI:CanDialogShow(mode, dlg_name)
	local function find_in_list(dlg_name, list)
		for _,v in ipairs(list) do
			v = string.lower(v)
			if string.match(dlg_name, v) == dlg_name then
				return true
			end
		end
		return false
	end

	dlg_name = string.lower(dlg_name)
	if type(forbid_dialog) == "table" then
		if find_in_list(dlg_name, forbid_dialog) then
			return false
		end
	end

	if not self.stage_config[mode] then return true end
	local conf = self.stage_config[mode]
	
	if type(conf.black_list) == "table" then
		if find_in_list(dlg_name, conf.black_list) then
			return false
		end
		return true
	end

	if type(conf.white_list) == "table" then
		if find_in_list(dlg_name, conf.white_list) then
			return true
		end
		return false
	end
	
	return true
end


-------------------------------------
--		overwrite UIManTemplate
-------------------------------------
function GameUI:Init()
    -- 音乐信息
    trigger_sound:Init() 
    -- 帮助信息
    help_man:Init() 
    -- 活动信息
    daily_man:init()    
    
    -- 其它消息
    self:RegisterEvent(LEVT_SCENE_PARAMETERS, 		self.OnSceneParametersChange)
    self:RegisterEvent(LEVT_CONSTELLATION_DATA,		self.OnConstellationDataChange)
    self:RegisterEvent(LEVT_LEAGUE_REPU_CHANGE,		self.OnLeagueRepuChange)
    self:RegisterEvent(LEVT_SPEC_PLOT_CRY, 			self.OnSpecPlotCry)    
    self:RegisterEvent(LEVT_PROF_SWITCHED, 			self.OnProfSwitched)
    self:RegisterEvent(LEVT_CALL_PET, 				self.OnPetInfoUpdate)
    self:RegisterEvent(LEVT_PET_LEVUP, 				self.OnPetInfoUpdate)
    self:RegisterEvent(LEVT_PET_LEVUP, 				self.OnPetInfoUpdate)
    self:RegisterEvent(LEVT_BEAN_UPDATE,			self.OnBeanUpdate)
    self:RegisterEvent(LEVT_FIRST_REACH_LVL, 		self.OnFirstReachLvl)
    self:RegisterEvent(LEVT_COMBAT_POWER_CHANGE, 	self.OnCombatPowerChange)
    self:RegisterEvent(LEVT_TASK_FINISH, 			self.UpdateDaily)    
    self:RegisterEvent(LEVT_HOST_REPU_CHANGE, 		self.UpdateDaily)
    self:RegisterEvent(LEVT_HOST_INC_REPU_CHANGE, 	self.UpdateDaily)
    self:RegisterEvent(LEVT_USE_ITEM,			 	self.OnUseItem)
    self:RegisterEvent(LEVT_GATHER_START,			self.OnGatherStart)
    self:RegisterEvent(LEVT_GATHER_SUCCESS,			self.OnGatherSuccess)

    -- 调试用代码
    if console.enbale_teleprot_test then
    	console.teleport_run()
    end
end


function GameUI:Tick(deltaTime) 
    -- 帮助
    help_man:Tick(deltaTime)
end


function GameUI:Release()
	_G._interval.ClearAll()
	animation:clear_queue()
	trigger_sound:Release()
	DlgApiEx.SetUIMaskAlpha(0)	
end

-------------------------------------
--		c message
-------------------------------------
function GameUI:OnLButtonDown()
    if Panel_SystemBar then
        Panel_SystemBar:check_close_menu()
    end
end

local panel_guide = "Panel_GuideSub"
function GameUI:OnGuideUpdate()
    if DlgApiEx.IsDialogLoad(panel_guide) and DlgApi.IsDialogShow(panel_guide) then
        Panel_GuideSub:player_lev_up()
        Panel_GuideSub:combat_power_update()
    end
end

function GameUI:OnUseItem(item_id)
	-- 播放动画
	local play_chain = animation:get_play_chain_on_use_item(item_id) 
	if #play_chain > 0 then
		animation:commit_play_chain(play_chain)
	end
end

function GameUI:OnGatherStart(mine_id)
	-- 播放动画
	local play_chain = animation:get_play_chain_on_gather_start(mine_id) 
	if #play_chain > 0 then
		animation:commit_play_chain(play_chain)
	end
end

function GameUI:OnGatherSuccess(mine_id)
	-- 播放动画
	local play_chain = animation:get_play_chain_on_gather_success(mine_id) 
	if #play_chain > 0 then
		animation:commit_play_chain(play_chain)
	end
end

function GameUI:OnFirstReachLvl()
    -- 活动更新
    self:UpdateDaily()    
    -- 指引更新
    self:OnGuideUpdate()
    -- 阶段指引
    if Panel_Radar then Panel_Radar:RefreshGuideStage() end
end

function GameUI:OnCombatPowerChange()
    -- 指引更新
    self:OnGuideUpdate()
end

local panel_dialy = "Panel_Daily"
function GameUI:UpdateDaily()
    if not DlgApiEx.IsDialogLoad(panel_dialy) then
        return
    end
    if DlgApi.IsDialogShow(panel_dialy) then
        Panel_Daily:OnFinishTask()
    end
    return
end

-- 动画结束
function GameUI:EndAnimation()    
end

--场景参数变化
function GameUI:OnSceneParametersChange(event, instid, changes) 
	--print("OnSceneParametersChange: " .. instid)
	--print(changes)	
end

--星座运势变化
function GameUI:OnConstellationDataChange(event, instid, data) 
	--print("OnConstellationDataChange: " .. instid)
	--print(data)
end

--军团声望变化
function GameUI:OnLeagueRepuChange(event, changes) 
	--print("OnLeagueRepuChange")
	--print(changes)
end

--玩家职业切换
function GameUI:OnProfSwitched(event, new_prof)
	skill_man:check_ui_visibility()
end

-- 新技能学习
function GameUI:OnSkillLearn(new_skill)
	skill_man:check_ui_visibility()
end

-- 新技能学习
function GameUI:OnSoloChallengeLevelStart(level)
	local c = chain:new{
		animation:new_task("black_screen", 1000)
	}
	animation:commit_play_chain(c)
end

--特殊策略喊话
GameUI.SpecPlotCry = 
{
	animation 	= function(id)     -- 播放动画
					-- 强制移动时禁用动画播放
					if GameApi.GetHostCurrentWork() == HOST_WORK.WORK_NAVIGATE then return end
					if id then animation:play(tonumber(id)) end 
				end,
	questportrait = function(id) -- 弹出头像喊话
					if id and DlgApiEx.LoadGameDialog("Panel_PortraitDialog") then
			            Panel_PortraitDialog:PopupTaskEvent(LEVT_STRATEGY, tonumber(id))
        			end
    			end,
	npc 		= function(id) --弹出npc面板
					if id and DlgApiEx.LoadGameDialog("Panel_NPCContentTips") then
			        	Panel_NPCContentTips:PopupText(LEVT_TASK_ACCEPT,tonumber(id))
        			end
    	  		end,
    sound 		= function(id) --触发音乐
    				if id and trigger_sound then
    			    	trigger_sound:PlotCry(id)
    				end
				end,
	closeportrait = function()
					if DlgApiEx.LoadGameDialog('Panel_PortraitDialog') then
				   		DlgApi.ShowDialog('Panel_PortraitDialog',false)
					end
				end,
}
function GameUI:OnSpecPlotCry(event, text) 
    --DlgApiEx.AddChatMsg("OnSpecPlotCry:"..tostring(text))
    -- 去除字符串开始的空格
    local str = Gsub(tostring(text), "^%s*", "")
    --根据传值不同弹出不同的界面
    local _, _, classify, classify_id = str:find("(%a+)_(%d+)")
    if classify and self.SpecPlotCry[classify] then
    	self.SpecPlotCry[classify](classify_id)
    end
end

function GameUI:OnPetInfoUpdate(event)
end

function GameUI:OnBeanUpdate(event, num, count)
    local dlg = "Panel_SkillsBean"
    if not DlgApiEx.IsDialogLoad(dlg) then
        DlgApiEx.LoadGameDialog(dlg)
    end
	try_method(ui.dialog.get(dlg), "PopupBeans", num, count)
end



----------------------------------
--预加载特效
do
    preload_gfx = preload_gfx
    gfx_idx = 1
    prof_idx = PROF_RESERVE
    preload_prof_tab = 
    {
    	[PROF_RESERVE]		= true,
    	[PROF_PEGASI]		= true,
    	[PROF_CYGNI]		= true,
    	[PROF_DRACONIS]		= true,
    	[PROF_ANDROMEDAE]	= true,
    	[PROF_PHOENIX]		= true,
    }
    
    local function next_prof_table()
    	repeat
    	    prof_idx = prof_idx + 1
        	if prof_idx >= PROF_NUM then
        	    prof_idx = PROF_RESERVE
        	end 
        	gfx_idx = 1
    	until preload_prof_tab[prof_idx]
	end
	
	local function preload_gfx_list(list)
        if not list then
            return false
        end
        if not list[gfx_idx] then
            return false
        end
        if list[gfx_idx] then
            GameApi.PreloadGfx(list[gfx_idx])
        end
        gfx_idx = gfx_idx + 1
        return true   
    end
    
    
    function GameUI:tick_preload_gfx()
        if preload_prof_tab[prof_idx] then
            if preload_gfx_list(preload_gfx[prof_idx]) then
                return
            end
            next_prof_table()
        else
            next_prof_table()
        end       
    end
end



----------------------------------
--界面

function GameUI:ResizeWindows()    
    --任务黑幕写字使用
    if DlgApiEx.IsDialogLoad("Panel_AniText") then
		try_method(ui.dialog.get("Panel_AniText"), "resize")
    end
	
	-- 指引界面
	if Panel_GuideBar then Panel_GuideBar:resize() end
	
	self.talk_mask:resize()
	self.animation_mask:resize()
end


-- 通知界面可以执行
function GameUI:EnableUINotify()
	ui.dialog.clear_all()    
    -- 初始化与玩家职业、技能等相关的界面
    skill_man:check_ui_visibility()    
    -- 系统开启动画
    help_man:init_systembar()  
    -- 指引系统
    help_man:init_player_guide_info() 
    
    DlgApiEx.LoadGameDialog("Panel_Radar")
    Panel_Radar:RefreshGuideStage() 
    Panel_Radar:ToggleSign()
    help_man:ShowWelcomeDlg()
end


function GameUI:SecretaryEventNotify(event, ...)
    help_man:OnEventMapEx(event, unpack(arg))
    trigger_sound:OnEventMap(event, event, unpack(arg))
    return true     
end


function GameUI:BuildURLForAccountInfoComplete(params)
	local base = STRING_TABLE.ACCOUNT_INFO_COMPLETE_URL
	local param_pairs = {}
	for k, v in pairs(params) do
		table.insert(param_pairs, ("%s=%s"):format(tostring(k), tostring(v)))
	end
	local param_str = table.concat(param_pairs, "&")
	return base .. "&" .. param_str
end

GameUI.mask_base = {}
GameUI.mask_base._prototype = 
{
	load_dialog = function(self)
	end,
	before_populate = function(self)
	end,
	before_complete = function(self)
	end,
	calc_pos = function(self)
		local dlg_height = self.top:get_prop().height
		local dist_to_edge = self.in_screen_rate * dlg_height
		
		self.top:show(self.in_screen_rate > 0, false, false)
		self.bottom:show(self.in_screen_rate > 0, false, false)
		
		self.top:set_pos(0, dist_to_edge, "", AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_CENTER, AUIDIALOG_ALIGN_OUTSIDE, AUIDIALOG_ALIGN_TOP)
		self.bottom:set_pos(0, -dist_to_edge, "", AUIDIALOG_ALIGN_INSIDE, AUIDIALOG_ALIGN_CENTER, AUIDIALOG_ALIGN_OUTSIDE, AUIDIALOG_ALIGN_BOTTOM)
	end,
	resize = function(self)			
		if not self.top or not self.bottom then
			return
		end
		if not self.top:is_exist() or not self.bottom:is_exist() then
		    return
		end		
		    
		local left, top, right, bottom = DlgApi.GetWindowRect()
		local window_width = right - left
		local dlg_height = self.top:get_prop().height
		
		self.top:set_size(window_width, dlg_height)
		self.bottom:set_size(window_width, dlg_height)

		self:calc_pos()
	end,
	show = function(self, is_show, opt)
		self:load_dialog()
		self:resize()

		opt = opt or {}
		if type(opt) == "function" then
			opt = {oncomplete = opt}
		end

		local current = self.current_ani
		if current then
			current:stop()
			current = nil
			self.current_ani = nil
		end

		local end_state = is_show and 1 or 0
		if opt.instantly then
			self.in_screen_rate = end_state
			self:calc_pos()
			if type(opt.oncomplete) == "function" then
				opt.oncomplete()
			end
			return
		end
		
		local _mask = self
		self.current_ani = ani:new{
			start_state = self.in_screen_rate,
			end_state = end_state,
			duration = 300,
			oninit = function(self)
				_mask:resize()
			end,
			onpopulate = function(self, state)
				_mask:before_populate()
				_mask.in_screen_rate = state
				_mask:calc_pos()
			end,
			oncomplete = function()
				_mask:before_complete()
				_mask.current_ani = nil
				if type(opt.oncomplete) == "function" then
					opt.oncomplete()
				end
			end
		}

		return self.current_ani
	end,
}

function GameUI.mask_base.new(t)
	t = t or {}
	setmetatable(t, {__index = GameUI.mask_base._prototype})

	t.in_screen_rate = t.in_screen_rate or 0
	return t
end

-----------------------
--对话时的黑边
GameUI.talk_mask = GameUI.mask_base.new(
{
	in_screen_rate = 0,
	load_dialog = function(self)
		self.top = ui.dialog.get("Panel_NpcMask1")
		self.bottom = ui.dialog.get("Panel_NpcMask2")
	end,
})

-----------------------
--显示对话时的黑边
function GameUI:ShowTalkMask(callback)
	GameUI.talk_mask:show(true, {oncomplete = callback})
end
auto_method(GameUI, "ShowTalkMask")

-----------------------
--隐藏对话时的黑边
function GameUI:HideTalkMask(callback)
	GameUI.talk_mask:show(false, {oncomplete = callback})
end
auto_method(GameUI, "HideTalkMask")

-----------------------
--播放动画时的黑边
GameUI.animation_mask = GameUI.mask_base.new(
{
	in_screen_rate = 0,
	load_dialog = function(self)
		DlgApiEx.LoadGameDialog("Panel_AnimationMask1")
		DlgApiEx.LoadGameDialog("Panel_AnimationMask2")
		self.top = ui.dialog.get("Panel_AnimationMask1")
		self.bottom = ui.dialog.get("Panel_AnimationMask2")
	end,
	before_populate = function(self)
		Panel_AnimationMask2:hide_animation_name()
	end,
	before_complete = function(self)
		Panel_AnimationMask2:hide_animation_name()
	end,
})

-----------------------
--显示播放动画时的黑边
function GameUI:ShowAnimationMask(opt)	
	GameUI.animation_mask:show(true, opt)
end
auto_method(GameUI, "ShowAnimationMask")

-----------------------
--隐藏播放动画时的黑边
function GameUI:HideAnimationMask(opt)
	GameUI.animation_mask:show(false, opt)
end
auto_method(GameUI, "HideAnimationMask")


--- 直接打开百科的某一词条
function GameUI:OnOpenHelp(id)
	if not HELPINFO[id] then
	    return
	end
	DlgApi.ShowDialog("Panel_Help", true)
	Panel_Help:SetPage(HELPINFO[id].kind)
	Panel_HelpResult:OnLinkClick(HELPINFO[id].kind,id,-1)
end


--- 跳转界面
--跳转是否生效
function GameUI:IsJumpValidated(id)
	local info = JumpConfig[id]
    if not info then 
        return false
    end
    --不生效
    if type(info.validated) == "boolean" then
    	if not info.validated then
    		return false
    	end
    elseif type(info.validated) == "function" then
    	if not info.validated() then
    		return false
    	end
    end
    --未到生效等级
    if info.validated_level_min then
    	local prop = GameApi.GetHostProp()
        if not prop or prop.level < info.validated_level_min then
        	return false
        end
    end
    return true
end


--根据id跳转
function GameUI:OnJumpInterface(id)
	if not self:IsJumpValidated(id) then
		return
	end
    local info = JumpConfig[id]
    if type(info.jump) == "string" then
        local is_show = DlgApi.IsDialogShow(info.jump)
        DlgApi.ShowDialog(info.jump, not is_show)
    elseif type(info.jump) == "function" then
        info.jump()
    end
end


--根据key跳转
function GameUI:OnJumpInterfaceByLogicKeyDown(key)
	for id,info in pairs(JumpConfig) do
		if info.key == key then
			self:OnJumpInterface(id)
		end
	end
end



-----------------------
--显示类似动画黑边的效果
function GameUI:ShowMovieEffectMask(...)
	return self:ShowAnimationMask(...)
end

-----------------------
--隐藏动画黑边效果
function GameUI:HideMovieEffectMask(...)
	return self:HideAnimationMask(...)
end
