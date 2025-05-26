--[[
-- operation ： ui_dynamic_dir里的 operation
-- active_task ：复合条件——任务id，填了表示需要有这个已接任务
-- active_achieve ：复合条件——成就id，填了表示需要这个成就是正在进行中的（前提成就完成并且自己未完成）
-- finish_achieve ：复合条件——成就id，填了表示需要这个成就是已完成的
-- level_req = {65，65 }：复合条件——等级要求，填了表示需要在这个等级区间
-- prof_req ：复合条件——职业要求，填了表示需要是这个职业
]]--

-- 界面动态指导触发条件: 任务完成
HelpUIDynDirFinishTask = {}
-- 界面动态指导触发条件: 任务接受
HelpUIDynDirAcceptTask = {}
-- 界面动态指导触发条件: 达到等级
HelpUIDynDirReachLevel = {}
-- 界面动态指导触发条件: 进入场景，场景若要标记首次进入，需在InstAnimationConfig里配置序号
HelpUIDynDirChangeInstance = {}


-- 界面动态指导触发条件: 打开界面
HelpUIDynDirOpenDlg = {}

-- 界面动态指导触发条件: 首次打开界面,界面若要标记首次打开，需在SecretarySpecialIDMap.ShowDlgName2Index里配置序号
HelpUIDynDirFirstOpenDlg = {}

-- 界面动态指导触发条件:首次学会技能
HelpUIDynDirFirstLearnSkill = {}

-- 界面动态指导触发条件: 不需要参数的事件
HelpUIDynDirEvent = {}

-- 界面动态指导事件处理函数
HelpUIDynDir_Func = {}




--[[ --------------------------------------------
     界面动态指导触发条件
--]] --------------------------------------------

HelpUIDynDirEvent[LEVT_PACKAGE_FULL] =
{
	operation = ui_dynamic_dir.BAG_FULL
}

HelpUIDynDirEvent[LEVT_REVIVE] =
{
	level_req = {35,200},
	operation = ui_dynamic_dir.FORCE_GUIDE
}

HelpUIDynDirEvent[LEVT_AUTO_ROUTE_TELEPORT] =
{
	level_req = {0,30},
	operation = ui_dynamic_dir.AUTO_ROUTE_TELEPORT
}

HelpUIDynDirEvent[LEVT_CHOOSE_STYLE_FINISHED] =
{
	operation = ui_dynamic_dir.CHOOSE_STYLE_FINISHED
}

HelpUIDynDirEvent[LEVT_DRAG_LOCKING_SC] =
{
	operation = ui_dynamic_dir.UNLOCK_SC
}

--HelpUIDynDirFinishTask[3182] =
--{
	--operation = ui_dynamic_dir.CLOTH_STAR
--}

--HelpUIDynDirFinishTask[5266] =
--{
	--operation = ui_dynamic_dir.MAGIC_BOX_BREAK
--}

--HelpUIDynDirFinishTask[167] =
--{
	--operation = ui_dynamic_dir.MAGIC_BOX_COMBINE
--}

--HelpUIDynDirAcceptTask[5902] =
--{
	--operation = ui_dynamic_dir.GSHOP
--}

--HelpUIDynDirFinishTask[5725] =
--{
	--operation = ui_dynamic_dir.ASTROLOGY
--}

--HelpUIDynDirFinishTask[4371] =
--{
	--operation = ui_dynamic_dir.DOUBLE_EXP
--}

--HelpUIDynDirAcceptTask[3001] = --3406
--{
	--operation = ui_dynamic_dir.USE_CLOTH
--}

--HelpUIDynDirFinishTask[4522] = --4522
--{
	--operation = ui_dynamic_dir.FRIEND_ADD
--}

--HelpUIDynDirFinishTask[4372] =
--{
	--operation = ui_dynamic_dir.PRODUCE
--}

--HelpUIDynDirAcceptTask[4578] =
--{
	--operation = ui_dynamic_dir.PRODUCE_1
--}

--HelpUIDynDirAcceptTask[4579] =
--{
	--operation = ui_dynamic_dir.PRODUCE_2
--}

--HelpUIDynDirAcceptTask[4580] =
--{
	--operation = ui_dynamic_dir.PRODUCE_3
--}

--HelpUIDynDirAcceptTask[4581] =
--{
	--operation = ui_dynamic_dir.PRODUCE
--}

--HelpUIDynDirReachLevel[17] =
--{
	--operation = ui_dynamic_dir.GUI_ANSWER
--}

HelpUIDynDirReachLevel[37] =
{
	operation = ui_dynamic_dir.CHECK_POWER
}

HelpUIDynDirReachLevel[20] =
{
	operation = ui_dynamic_dir.SKILL_SEQ
}

--HelpUIDynDirReachLevel[42] =
--{
	--operation = ui_dynamic_dir.FREE_PVP
--}

--HelpUIDynDirFirstOpenDlg["Panel_WorldMapNpcList"] =
--{
	--active_task = 4369,
	--operation = ui_dynamic_dir.MAP_GUIDE
--}

--HelpUIDynDirReachLevel[26] =
--{
	--operation = ui_dynamic_dir.GOLDEN_PALACE_GUIDE
--}

--HelpUIDynDirReachLevel[25] =
--{
	--operation = ui_dynamic_dir.BATTLE_SOUL
--}

--HelpUIDynDirFinishTask[4403] =
--{
	--prof_req	= 5,
	--operation = ui_dynamic_dir.XIAN_NV_CHANGE_AREA_M
--}

HelpUIDynDirFinishTask[4379] =
{
	prof_req	= 5,
	operation = ui_dynamic_dir.XIAN_NV_CHANGE_AREA_M
}

HelpUIDynDirAcceptTask[4379] =
{
	prof_req	= 5,
	operation = ui_dynamic_dir.XIAN_NV_CHANGE_AREA
}

HelpUIDynDirChangeInstance[4] =
{
	prof_req	= 5,
	operation = ui_dynamic_dir.XIAN_NV_CHANGE_AREA_M
}

HelpUIDynDirChangeInstance[406] =
{
	prof_req	= 5,
	operation = ui_dynamic_dir.XIAN_NV_CHANGE_AREA
}

HelpUIDynDirChangeInstance[401] =
{
	operation = ui_dynamic_dir.AUTO_ADJUST_ACITVITY
}

HelpUIDynDirChangeInstance[402] =
{
	operation = ui_dynamic_dir.ASTRO_WATCH
}

HelpUIDynDirOpenDlg["Panel_Enhance"] =
{
	--active_task = 4377,
	active_achieve = 5030,
	operation = ui_dynamic_dir.EQUIP_ENHANCE
}

HelpUIDynDirOpenDlg["Panel_ProduceLearn"] =
{
	active_achieve = 5032,
	operation = ui_dynamic_dir.PRODUCE_LEARN
}

--HelpUIDynDirFirstOpenDlg["Panel_GuideStage"] =
--{
	--operation = ui_dynamic_dir.GUIDE_OPEN
--}

HelpUIDynDirOpenDlg["Panel_EquipProcess"] =
{
	active_achieve = 5034,
	operation = ui_dynamic_dir.EQUIP_PROCESS
}

--HelpUIDynDirFirstOpenDlg["Panel_Raffle"] =
--{
	--operation = ui_dynamic_dir.QUEST_LOTTERY
--}

--HelpUIDynDirFirstOpenDlg["Panel_Push"] =
--{
	--operation = ui_dynamic_dir.FRIEND_GUIDE
--}

--HelpUIDynDirFirstOpenDlg["Panel_Revive"] =
--{
	--operation = ui_dynamic_dir.DIE_REVIVE
--}

HelpUIDynDirEvent[LEVT_FIRST_MANUALLY_LEVEL_UP] =
{
	operation = ui_dynamic_dir.MANUALLY_LEVEL_UP
}

--HelpUIDynDirEvent[LEVT_FIRST_GET_TITLE] =
--{
	--operation = ui_dynamic_dir.VIEW_TITLE
--}

--HelpUIDynDirEvent[LEVT_FIRST_GET_PHOTOBOOK] =
--{
	--operation = ui_dynamic_dir.VIEW_PHOTOBOOK
--}

--HelpUIDynDirEvent[LEVT_FIRST_GET_ACHIEVEMENT] =
--{
	--operation = ui_dynamic_dir.VIEW_ACHIEVEMENT
--}

HelpUIDynDirEvent[LEVT_FIRST_IN_TEAM] =
{
	operation = ui_dynamic_dir.TEAM_BUFF
}

--HelpUIDynDirEvent[LEVT_PRAY] =
--{
	--operation = ui_dynamic_dir.QUIT_PRAY
--}

HelpUIDynDirEvent[LEVT_FIRST_SHORTCUT_FULL] =
{
	operation = ui_dynamic_dir.SHORTCUT_EXPAND
}

HelpUIDynDirAcceptTask[5612] =
{
	operation = ui_dynamic_dir.MOVE_GUIDE
}

HelpUIDynDirAcceptTask[938] =
{
	operation = ui_dynamic_dir.YADIANNA_TRACE
}

HelpUIDynDirFinishTask[939] =
{
	operation = ui_dynamic_dir.POINT_TRACE
}

HelpUIDynDirFinishTask[5690] =
{
	operation = ui_dynamic_dir.TASK_TRACE
}

HelpUIDynDirFinishTask[5691] =
{
	operation = ui_dynamic_dir.TASK_TRACE
}

HelpUIDynDirFinishTask[5692] =
{
	operation = ui_dynamic_dir.TASK_TRACE
}

HelpUIDynDirFinishTask[5693] =
{
	operation = ui_dynamic_dir.TASK_TRACE
}

HelpUIDynDirFinishTask[5694] =
{
	operation = ui_dynamic_dir.TASK_TRACE
}

HelpUIDynDirFinishTask[4398] =
{
	operation = ui_dynamic_dir.ILLUSION_TRACE
}

HelpUIDynDirFinishTask[4396] =
{
	operation = ui_dynamic_dir.ILLUSION_TRACE
}

HelpUIDynDirFinishTask[4399] =
{
	operation = ui_dynamic_dir.ILLUSION_TRACE
}

HelpUIDynDirFinishTask[4400] =
{
	operation = ui_dynamic_dir.ILLUSION_TRACE
}

HelpUIDynDirFinishTask[4397] =
{
	operation = ui_dynamic_dir.ILLUSION_TRACE
}

HelpUIDynDirFinishTask[2923] =
{
	operation = ui_dynamic_dir.TIANMA_TRACE
}

HelpUIDynDirFinishTask[2934] =
{
	operation = ui_dynamic_dir.BAINIAO_TRACE
}

HelpUIDynDirFinishTask[2945] =
{
	operation = ui_dynamic_dir.TIANLONG_TRACE
}

HelpUIDynDirFinishTask[2956] =
{
	operation = ui_dynamic_dir.XIANNV_TRACE
}

HelpUIDynDirFinishTask[2967] =
{
	operation = ui_dynamic_dir.FENGHUANG_TRACE
}

HelpUIDynDirFinishTask[3529] =
{
	operation = ui_dynamic_dir.TIANQIN_TRACE
}

--HelpUIDynDirAcceptTask[5612] =
--{
	--operation = ui_dynamic_dir.VIEW_GUIDE
--}

HelpUIDynDirAcceptTask[2978] =
{
	operation = ui_dynamic_dir.FAST_MOVE
}

HelpUIDynDirAcceptTask[2983] =
{
	operation = ui_dynamic_dir.PICK_UP
}

HelpUIDynDirAcceptTask[2977] =
{
	operation = ui_dynamic_dir.ATTACK_GUIDE
}

HelpUIDynDirAcceptTask[2979] =
{
	operation = ui_dynamic_dir.FAST_BUFF
}


HelpUIDynDirAcceptTask[3005] =
{
	operation = ui_dynamic_dir.FAST_MOVE_CONSUME
}

HelpUIDynDirFirstLearnSkill[526] =
{
	operation = ui_dynamic_dir.XIANNV_SKILL
}

HelpUIDynDirFirstLearnSkill[515] =
{
	operation = ui_dynamic_dir.XIANNV_SKILL_CHANGE
}

HelpUIDynDirFirstLearnSkill[62] =
{
	operation = ui_dynamic_dir.TIANMA_SKILL
}

HelpUIDynDirFirstLearnSkill[71] =
{
	operation = ui_dynamic_dir.BAINIAO_SKILL
}

HelpUIDynDirFirstLearnSkill[1522] =
{
	operation = ui_dynamic_dir.FENGHUANG_SKILL
}
--天龙斗魂
HelpUIDynDirFirstLearnSkill[937] =
{
	prof_req	= 4,
	operation = ui_dynamic_dir.BATTLE_SOUL_1
}

HelpUIDynDirFirstLearnSkill[936] =
{
	prof_req	= 4,
	operation = ui_dynamic_dir.BATTLE_SOUL_1
}

HelpUIDynDirFirstLearnSkill[938] =
{
	prof_req	= 4,
	operation = ui_dynamic_dir.BATTLE_SOUL_1
}

HelpUIDynDirFirstLearnSkill[940] =
{
	prof_req	= 4,
	operation = ui_dynamic_dir.BATTLE_SOUL_2
}

HelpUIDynDirFirstLearnSkill[939] =
{
	prof_req	= 4,
	operation = ui_dynamic_dir.BATTLE_SOUL_2
}

HelpUIDynDirFirstLearnSkill[941] =
{
	prof_req	= 4,
	operation = ui_dynamic_dir.BATTLE_SOUL_2
}

HelpUIDynDirFirstLearnSkill[943] =
{
	prof_req	= 4,
	operation = ui_dynamic_dir.BATTLE_SOUL_3
}

HelpUIDynDirFirstLearnSkill[942] =
{
	prof_req	= 4,
	operation = ui_dynamic_dir.BATTLE_SOUL_3
}

HelpUIDynDirFirstLearnSkill[944] =
{
	prof_req	= 4,
	operation = ui_dynamic_dir.BATTLE_SOUL_3
}

HelpUIDynDirFirstLearnSkill[946] =
{
	prof_req	= 4,
	operation = ui_dynamic_dir.BATTLE_SOUL_4
}

HelpUIDynDirFirstLearnSkill[945] =
{
	prof_req	= 4,
	operation = ui_dynamic_dir.BATTLE_SOUL_4
}

HelpUIDynDirFirstLearnSkill[947] =
{
	prof_req	= 4,
	operation = ui_dynamic_dir.BATTLE_SOUL_4
}

HelpUIDynDirFirstLearnSkill[949] =
{
	prof_req	= 4,
	operation = ui_dynamic_dir.BATTLE_SOUL_5
}

HelpUIDynDirFirstLearnSkill[948] =
{
	prof_req	= 4,
	operation = ui_dynamic_dir.BATTLE_SOUL_5
}

HelpUIDynDirFirstLearnSkill[950] =
{
	prof_req	= 4,
	operation = ui_dynamic_dir.BATTLE_SOUL_5
}
--天马斗魂
HelpUIDynDirFirstLearnSkill[922] =
{
	prof_req	= 2,
	operation = ui_dynamic_dir.BATTLE_SOUL_1
}

HelpUIDynDirFirstLearnSkill[921] =
{
	prof_req	= 2,
	operation = ui_dynamic_dir.BATTLE_SOUL_1
}

HelpUIDynDirFirstLearnSkill[923] =
{
	prof_req	= 2,
	operation = ui_dynamic_dir.BATTLE_SOUL_1
}

HelpUIDynDirFirstLearnSkill[925] =
{
	prof_req	= 2,
	operation = ui_dynamic_dir.BATTLE_SOUL_2
}

HelpUIDynDirFirstLearnSkill[924] =
{
	prof_req	= 2,
	operation = ui_dynamic_dir.BATTLE_SOUL_2
}

HelpUIDynDirFirstLearnSkill[926] =
{
	prof_req	= 2,
	operation = ui_dynamic_dir.BATTLE_SOUL_2
}

HelpUIDynDirFirstLearnSkill[928] =
{
	prof_req	= 2,
	operation = ui_dynamic_dir.BATTLE_SOUL_3
}

HelpUIDynDirFirstLearnSkill[927] =
{
	prof_req	= 2,
	operation = ui_dynamic_dir.BATTLE_SOUL_3
}

HelpUIDynDirFirstLearnSkill[929] =
{
	prof_req	= 2,
	operation = ui_dynamic_dir.BATTLE_SOUL_3
}

HelpUIDynDirFirstLearnSkill[931] =
{
	prof_req	= 2,
	operation = ui_dynamic_dir.BATTLE_SOUL_4
}

HelpUIDynDirFirstLearnSkill[930] =
{
	prof_req	= 2,
	operation = ui_dynamic_dir.BATTLE_SOUL_4
}

HelpUIDynDirFirstLearnSkill[932] =
{
	prof_req	= 2,
	operation = ui_dynamic_dir.BATTLE_SOUL_4
}

HelpUIDynDirFirstLearnSkill[934] =
{
	prof_req	= 2,
	operation = ui_dynamic_dir.BATTLE_SOUL_5
}

HelpUIDynDirFirstLearnSkill[933] =
{
	prof_req	= 2,
	operation = ui_dynamic_dir.BATTLE_SOUL_5
}

HelpUIDynDirFirstLearnSkill[935] =
{
	prof_req	= 2,
	operation = ui_dynamic_dir.BATTLE_SOUL_5
}
--白鸟座
HelpUIDynDirFirstLearnSkill[1830] =
{
	prof_req	= 3,
	operation = ui_dynamic_dir.BATTLE_SOUL_1
}

HelpUIDynDirFirstLearnSkill[1831] =
{
	prof_req	= 3,
	operation = ui_dynamic_dir.BATTLE_SOUL_1
}

HelpUIDynDirFirstLearnSkill[1832] =
{
	prof_req	= 3,
	operation = ui_dynamic_dir.BATTLE_SOUL_1
}

HelpUIDynDirFirstLearnSkill[1833] =
{
	prof_req	= 3,
	operation = ui_dynamic_dir.BATTLE_SOUL_2
}

HelpUIDynDirFirstLearnSkill[1834] =
{
	prof_req	= 3,
	operation = ui_dynamic_dir.BATTLE_SOUL_2
}

HelpUIDynDirFirstLearnSkill[1835] =
{
	prof_req	= 3,
	operation = ui_dynamic_dir.BATTLE_SOUL_2
}

HelpUIDynDirFirstLearnSkill[1836] =
{
	prof_req	= 3,
	operation = ui_dynamic_dir.BATTLE_SOUL_3
}

HelpUIDynDirFirstLearnSkill[1837] =
{
	prof_req	= 3,
	operation = ui_dynamic_dir.BATTLE_SOUL_3
}

HelpUIDynDirFirstLearnSkill[1838] =
{
	prof_req	= 3,
	operation = ui_dynamic_dir.BATTLE_SOUL_3
}

HelpUIDynDirFirstLearnSkill[1839] =
{
	prof_req	= 3,
	operation = ui_dynamic_dir.BATTLE_SOUL_4
}

HelpUIDynDirFirstLearnSkill[1840] =
{
	prof_req	= 3,
	operation = ui_dynamic_dir.BATTLE_SOUL_4
}

HelpUIDynDirFirstLearnSkill[1841] =
{
	prof_req	= 3,
	operation = ui_dynamic_dir.BATTLE_SOUL_4
}

HelpUIDynDirFirstLearnSkill[1842] =
{
	prof_req	= 3,
	operation = ui_dynamic_dir.BATTLE_SOUL_5
}

HelpUIDynDirFirstLearnSkill[1843] =
{
	prof_req	= 3,
	operation = ui_dynamic_dir.BATTLE_SOUL_5
}

HelpUIDynDirFirstLearnSkill[1844] =
{
	prof_req	= 3,
	operation = ui_dynamic_dir.BATTLE_SOUL_5
}
--仙女
HelpUIDynDirFirstLearnSkill[1917] =
{
	prof_req	= 5,
	operation = ui_dynamic_dir.BATTLE_SOUL_1
}

HelpUIDynDirFirstLearnSkill[1922] =
{
	prof_req	= 5,
	operation = ui_dynamic_dir.BATTLE_SOUL_1
}

HelpUIDynDirFirstLearnSkill[1927] =
{
	prof_req	= 5,
	operation = ui_dynamic_dir.BATTLE_SOUL_1
}

HelpUIDynDirFirstLearnSkill[1918] =
{
	prof_req	= 5,
	operation = ui_dynamic_dir.BATTLE_SOUL_2
}

HelpUIDynDirFirstLearnSkill[1923] =
{
	prof_req	= 5,
	operation = ui_dynamic_dir.BATTLE_SOUL_2
}

HelpUIDynDirFirstLearnSkill[1928] =
{
	prof_req	= 5,
	operation = ui_dynamic_dir.BATTLE_SOUL_2
}

HelpUIDynDirFirstLearnSkill[1919] =
{
	prof_req	= 5,
	operation = ui_dynamic_dir.BATTLE_SOUL_3
}

HelpUIDynDirFirstLearnSkill[1924] =
{
	prof_req	= 5,
	operation = ui_dynamic_dir.BATTLE_SOUL_3
}

HelpUIDynDirFirstLearnSkill[1929] =
{
	prof_req	= 5,
	operation = ui_dynamic_dir.BATTLE_SOUL_3
}

HelpUIDynDirFirstLearnSkill[1920] =
{
	prof_req	= 5,
	operation = ui_dynamic_dir.BATTLE_SOUL_4
}

HelpUIDynDirFirstLearnSkill[1925] =
{
	prof_req	= 5,
	operation = ui_dynamic_dir.BATTLE_SOUL_4
}

HelpUIDynDirFirstLearnSkill[1930] =
{
	prof_req	= 5,
	operation = ui_dynamic_dir.BATTLE_SOUL_4
}

HelpUIDynDirFirstLearnSkill[1921] =
{
	prof_req	= 5,
	operation = ui_dynamic_dir.BATTLE_SOUL_5
}

HelpUIDynDirFirstLearnSkill[1926] =
{
	prof_req	= 5,
	operation = ui_dynamic_dir.BATTLE_SOUL_5
}

HelpUIDynDirFirstLearnSkill[1931] =
{
	prof_req	= 5,
	operation = ui_dynamic_dir.BATTLE_SOUL_5
}
--凤凰
HelpUIDynDirFirstLearnSkill[1932] =
{
	prof_req	= 6,
	operation = ui_dynamic_dir.BATTLE_SOUL_1
}

HelpUIDynDirFirstLearnSkill[1937] =
{
	prof_req	= 6,
	operation = ui_dynamic_dir.BATTLE_SOUL_1
}

HelpUIDynDirFirstLearnSkill[1942] =
{
	prof_req	= 6,
	operation = ui_dynamic_dir.BATTLE_SOUL_1
}

HelpUIDynDirFirstLearnSkill[1933] =
{
	prof_req	= 6,
	operation = ui_dynamic_dir.BATTLE_SOUL_2
}

HelpUIDynDirFirstLearnSkill[1938] =
{
	prof_req	= 6,
	operation = ui_dynamic_dir.BATTLE_SOUL_2
}

HelpUIDynDirFirstLearnSkill[1943] =
{
	prof_req	= 6,
	operation = ui_dynamic_dir.BATTLE_SOUL_2
}

HelpUIDynDirFirstLearnSkill[1934] =
{
	prof_req	= 6,
	operation = ui_dynamic_dir.BATTLE_SOUL_3
}

HelpUIDynDirFirstLearnSkill[1939] =
{
	prof_req	= 6,
	operation = ui_dynamic_dir.BATTLE_SOUL_3
}

HelpUIDynDirFirstLearnSkill[1944] =
{
	prof_req	= 6,
	operation = ui_dynamic_dir.BATTLE_SOUL_3
}

HelpUIDynDirFirstLearnSkill[1935] =
{
	prof_req	= 6,
	operation = ui_dynamic_dir.BATTLE_SOUL_4
}

HelpUIDynDirFirstLearnSkill[1940] =
{
	prof_req	= 6,
	operation = ui_dynamic_dir.BATTLE_SOUL_4
}

HelpUIDynDirFirstLearnSkill[1945] =
{
	prof_req	= 6,
	operation = ui_dynamic_dir.BATTLE_SOUL_4
}

HelpUIDynDirFirstLearnSkill[1936] =
{
	prof_req	= 6,
	operation = ui_dynamic_dir.BATTLE_SOUL_5
}

HelpUIDynDirFirstLearnSkill[1941] =
{
	prof_req	= 6,
	operation = ui_dynamic_dir.BATTLE_SOUL_5
}

HelpUIDynDirFirstLearnSkill[1946] =
{
	prof_req	= 6,
	operation = ui_dynamic_dir.BATTLE_SOUL_5
}

HelpUIDynDirFinishTask[9514] =
{
	operation = ui_dynamic_dir.STARSKY_SYSTEMBAR
}

--HelpUIDynDirOpenDlg["Panel_SubExplore2"] =
HelpUIDynDirFinishTask[9556] =
{
	operation = ui_dynamic_dir.STARSKYBORN
}


HelpUIDynDirFirstOpenDlg["Panel_SubExplore1"] =
{
	operation = ui_dynamic_dir.STARSKY
}

HelpUIDynDirFirstOpenDlg["Panel_SubExplore2"] =
{
	operation = ui_dynamic_dir.STARSKYCOMB
}

HelpUIDynDirFinishTask[10164] =
{
	operation = ui_dynamic_dir.ARTIFACT_TRACE
}

HelpUIDynDirReachLevel[100] =
{
	operation = ui_dynamic_dir.COSMOS_LEVELUP
}

HelpUIDynDirFinishTask[12790] =
{
	operation = ui_dynamic_dir.SOUL_ARMOR
}

--[[ --------------------------------------------
     界面动态指导触发条件  end
--]] --------------------------------------------

function HelpUIDynDir_Func:OnFinishTask(task_id)
    local cfg = HelpUIDynDirFinishTask[task_id]
    if cfg ~= nil then
        if cfg.active_task ~= nil and GameApi.IsTaskActive(cfg.active_task) == false then
		    return
		end
		local propEx = GameApi.GetHostPropEx()
		if  type(cfg.level_req) == "table" and (cfg.level_req[2] < propEx.level or cfg.level_req[1] > propEx.level) then
		    return
		end
		if  cfg.prof_req ~= nil and cfg.prof_req ~= propEx.profession then
		    return
		end
		if cfg.active_achieve ~= nil and GameApi.IsAchiActive(cfg.active_achieve) == false  then
			return
		end
		if cfg.finish_achieve ~= nil and GameApi.IsAchiFinish(cfg.finish_achieve) == false  then
			return
		end
		help_man:OnUIDynamicDirection(LEVT_UI_DYNAMIC_DIRECTION,cfg.operation)
    end
end

function HelpUIDynDir_Func:OnAcceptTask(task_id)
    local cfg =  HelpUIDynDirAcceptTask[task_id]
    if cfg ~= nil then
        if cfg.active_task ~= nil and GameApi.IsTaskActive(cfg.active_task) == false then
		    return
		end
		local propEx = GameApi.GetHostPropEx()
		if  type(cfg.level_req) == "table" and (cfg.level_req[2] < propEx.level or cfg.level_req[1] > propEx.level) then
		    return
		end
		if  cfg.prof_req ~= nil and cfg.prof_req ~= propEx.profession then
		    return
		end
		if cfg.active_achieve ~= nil and GameApi.IsAchiActive(cfg.active_achieve) == false  then
			return
		end
		if cfg.finish_achieve ~= nil and GameApi.IsAchiFinish(cfg.finish_achieve) == false  then
			return
		end
			help_man:OnUIDynamicDirection(LEVT_UI_DYNAMIC_DIRECTION,cfg.operation)
    end
end

function HelpUIDynDir_Func:OnReachLevel(level)
    local cfg =  HelpUIDynDirReachLevel[level]
    if cfg ~= nil then
        if cfg.active_task ~= nil and GameApi.IsTaskActive(cfg.active_task) == false then
		    return
		end
		local propEx = GameApi.GetHostPropEx()
		if  type(cfg.level_req) == "table" and (cfg.level_req[2] < propEx.level or cfg.level_req[1] > propEx.level) then
		    return
		end
		if  cfg.prof_req ~= nil and cfg.prof_req ~= propEx.profession then
		    return
		end
		if cfg.active_achieve ~= nil and GameApi.IsAchiActive(cfg.active_achieve) == false  then
			return
		end
		if cfg.finish_achieve ~= nil and GameApi.IsAchiFinish(cfg.finish_achieve) == false  then
			return
		end
			help_man:OnUIDynamicDirection(LEVT_UI_DYNAMIC_DIRECTION,cfg.operation)
    end
end

function HelpUIDynDir_Func:OnChangeInstance(instance_id)
    local cfg = HelpUIDynDirChangeInstance[instance_id]
    if cfg ~= nil then
        if cfg.active_task ~= nil and GameApi.IsTaskActive(cfg.active_task) == false then
		    return
		end
		local propEx = GameApi.GetHostPropEx()
		if  type(cfg.level_req) == "table" and (cfg.level_req[2] < propEx.level or cfg.level_req[1] > propEx.level) then
		    return
		end
		if  cfg.prof_req ~= nil and cfg.prof_req ~= propEx.profession then
		    return
		end
		if cfg.active_achieve ~= nil and GameApi.IsAchiActive(cfg.active_achieve) == false  then
			return
		end
		if cfg.finish_achieve ~= nil and GameApi.IsAchiFinish(cfg.finish_achieve) == false  then
			return
		end
		help_man:OnUIDynamicDirection(LEVT_UI_DYNAMIC_DIRECTION,cfg.operation)
    end
end

function HelpUIDynDir_Func:OnOpenDlg(dlg_name)
    local cfg = HelpUIDynDirOpenDlg[dlg_name]
    if cfg ~= nil then
		if cfg.active_task ~= nil and GameApi.IsTaskActive(cfg.active_task) == false then
		    return
		end
		local propEx = GameApi.GetHostPropEx()
		if  type(cfg.level_req) == "table" and (cfg.level_req[2] < propEx.level or cfg.level_req[1] > propEx.level) then
		    return
		end
		if  cfg.prof_req ~= nil and cfg.prof_req ~= propEx.profession then
		    return
		end
		if cfg.active_achieve ~= nil and GameApi.IsAchiActive(cfg.active_achieve) == false  then
			return
		end
		if cfg.finish_achieve ~= nil and GameApi.IsAchiFinish(cfg.finish_achieve) == false  then
			return
		end
		help_man:OnUIDynamicDirection(LEVT_UI_DYNAMIC_DIRECTION,cfg.operation)
    end
end

function HelpUIDynDir_Func:OnFirstOpenDlg(dlg_name)
    local cfg = HelpUIDynDirFirstOpenDlg[dlg_name]
    if cfg ~= nil then
        if cfg.active_task ~= nil and GameApi.IsTaskActive(cfg.active_task) == false then
		    return
		end
		local propEx = GameApi.GetHostPropEx()
		if  type(cfg.level_req) == "table" and (cfg.level_req[2] < propEx.level or cfg.level_req[1] > propEx.level) then
		    return
		end
		if  cfg.prof_req ~= nil and cfg.prof_req ~= propEx.profession then
		    return
		end
		if cfg.active_achieve ~= nil and GameApi.IsAchiActive(cfg.active_achieve) == false  then
			return
		end
		if cfg.finish_achieve ~= nil and GameApi.IsAchiFinish(cfg.finish_achieve) == false  then
			return
		end
		help_man:OnUIDynamicDirection(LEVT_UI_DYNAMIC_DIRECTION,cfg.operation)
    end
end

function HelpUIDynDir_Func:OnLearnNewSkill(skillid)
    local cfg = HelpUIDynDirFirstLearnSkill[skillid]
    if cfg ~= nil then
        if cfg.active_task ~= nil and GameApi.IsTaskActive(cfg.active_task) == false then
		    return
		end
		local propEx = GameApi.GetHostPropEx()
		if  type(cfg.level_req) == "table" and (cfg.level_req[2] < propEx.level or cfg.level_req[1] > propEx.level) then
		    return
		end
		if  cfg.prof_req ~= nil and cfg.prof_req ~= propEx.profession then
		    return
		end
		if cfg.active_achieve ~= nil and GameApi.IsAchiActive(cfg.active_achieve) == false  then
			return
		end
		if cfg.finish_achieve ~= nil and GameApi.IsAchiFinish(cfg.finish_achieve) == false  then
			return
		end
		help_man:OnUIDynamicDirection(LEVT_UI_DYNAMIC_DIRECTION,cfg.operation)
    end
end

function HelpUIDynDir_Func:OnLevtEvent(levt_event)
    local cfg = HelpUIDynDirEvent[levt_event]
    if cfg ~= nil then
        if cfg.active_task ~= nil and GameApi.IsTaskActive(cfg.active_task) == false then
		    return
		end
		local propEx = GameApi.GetHostPropEx()
		if  type(cfg.level_req) == "table" and (cfg.level_req[2] < propEx.level or cfg.level_req[1] > propEx.level) then
		    return
		end
		if  cfg.prof_req ~= nil and cfg.prof_req ~= propEx.profession then
		    return
		end
		if cfg.active_achieve ~= nil and GameApi.IsAchiActive(cfg.active_achieve) == false  then
			return
		end
		if cfg.finish_achieve ~= nil and GameApi.IsAchiFinish(cfg.finish_achieve) == false  then
			return
		end
		help_man:OnUIDynamicDirection(LEVT_UI_DYNAMIC_DIRECTION,cfg.operation)
    end
end

