local Format, type = string.format, type


actions_func = {}

-------------------------------------
--		外部调用接口
-------------------------------------
-- 获取生产技能动作
function actions_func:get_vocation_action(action_type, act_name)
    local act = act_vocation[action_type]
    if act then
        return Format("%s开始_通用", act), Format("%s循环_通用", act)
    end
    return act_name, ""
end


-- 获取动作信息
--	status = {attach_mode, accelerate_run, fight, ride, attack_type, profession}
function actions_func:get_action_info(status, action_id)
    -- 替换动作
    local cfg = actions_player[action_id]
    if not cfg then return end
    if type(cfg) == "table" then
    	action_id = self:get_replace_id_form_cfg(status, action_id, cfg)
    end

    -- 获取动作名
    cfg = actions_player[action_id]
    if not cfg then return end

    local mount_act = ""
    local saint_cloth_child_act = ""
    local saint_wing_act = ""
    local str
    local adsortion_state = ADSORPTION_NONE
    if type(cfg) == "string" then
        str = cfg
    elseif type(cfg) == "table" then
        str = self:get_action_form_cfg(status, action_id, cfg)
        adsortion_state = cfg.adsortion_state or ADSORPTION_NONE
        mount_act = self:get_player_mount_action(status, action_id, cfg)
        saint_cloth_child_act = self:get_player_saint_cloth_child_action(status, action_id, cfg)
        saint_wing_act = self:get_player_saint_wing_action(status, action_id, cfg)
    end

    -- 拼接字符串
    local act_name
    if type(cfg) == "table" and cfg.no_suffix then
        act_name = str
    elseif status.attach_mode == enumAttachHugPlayer then
        act_name = Format("%s_绑定_通用", str)
    elseif status.attach_mode == enumAttachRideOnPet then
        act_name = Format("%s_双骑_通用", str)
    elseif status.ride then
        --local suffix = self:get_action_suffix(status.attack_type, status.profession)
        --act_name = Format("%s_骑乘_%s", str, suffix)
		act_name = Format("%s_骑乘_通用", str)
    elseif cfg.common_act then
        act_name = Format("%s_通用", str)
    else
        local suffix = self:get_action_suffix(status.attack_type, status.profession)
        act_name = Format("%s_%s", str, suffix)
    end
    return action_id, act_name, mount_act, saint_cloth_child_act, saint_wing_act, adsortion_state
end


-- 获取player格挡动作名
--	status = {block, attack_type, profession}
function actions_func:get_wounded_action(status, action_id)
    local cfg = actions_player[action_id]
    local suffix = self:get_action_suffix(status.attack_type, status.profession)
    if status.block then
        local num = math.random(1, 2)
        return Format("格挡%d_%s", num, suffix)
    end
    local action_name = self:get_player_normal_action(action_id)
    if cfg and cfg.common_act then
        return Format("%s_通用", action_name)
    else
        return Format("%s_%s", action_name, suffix)
    end
end


-- 获取Player动作名
function actions_func:get_player_normal_action(action_id)
    local cfg = actions_player[action_id]
    if type(cfg) == "string" then
        return cfg
    elseif type(cfg) == "table" then
        return cfg.normal
    end
end


-- 获取player站立和行走动作
--	status = {attach_mode, move_env, hanger_on, walk_run, fly_mode, move, fight}
function actions_func:get_move_stand_action(status)
    if status.attach_mode ~= enumAttachNone then
        status.fight = false
        if status.hanger_on then
            status.move_env = MOVEENV_GROUND
        end
    end

    if status.move then
        if status.move_env == MOVEENV_GROUND then
            if status.walk_run then
                return PLAYER_ACTION_TYPE.ACT_RUN
            else
                return PLAYER_ACTION_TYPE.ACT_WALK
            end
        elseif status.move_env == MOVEENV_WATER then
            return PLAYER_ACTION_TYPE.ACT_SWIM
        elseif status.move_env == MOVEENV_AIR then
            if fly_action[status.fly_mode] then
                return fly_action[status.fly_mode].move
            end
        end
    else
        if status.move_env == MOVEENV_GROUND then
            return PLAYER_ACTION_TYPE.ACT_STAND
        elseif status.move_env == MOVEENV_WATER then
            return PLAYER_ACTION_TYPE.ACT_HANGINWATER
        elseif status.move_env == MOVEENV_AIR then
            if fly_action[status.fly_mode] then
                return fly_action[status.fly_mode].hang
            end
        end
    end
    return PLAYER_ACTION_TYPE.ACT_STAND
end


-- 获取Player映射NPC动作
--	status = {fight, }
function actions_func:get_player_to_npc_action(status, action_id)
    local cfg = actions_player[action_id]
    local npc_action
	if type(cfg) == "table" then
        if status.fight then
            npc_action = cfg.npc_fight_id or cfg.npc_normal_id
        else
            npc_action = cfg.npc_normal_id
        end
    end
    if not npc_action then
        npc_action = NPC_ACTION_TYPE.ACT_NPC_STAND
    end
    return self:get_npc_normal_action(npc_action)
end


-- 获取NPC动作名
function actions_func:get_npc_normal_action(action_id)
    local cfg = actions_npc[action_id]
    if type(cfg) == "string" then
        return cfg
    elseif type(cfg) == "table" then
        return cfg.normal
    end
    return ""
end


-- 获取NPC动作信息
function actions_func:get_npc_action_info(action_id)
    local cfg = actions_npc[action_id]
    if type(cfg) == "string" then
        return cfg, false, false
    end
    return cfg.normal, cfg.wound_act or false, cfg.stand_act or false
end


-- 获取NPC映射Player动作
function actions_func:get_npc_to_player_action(action_id)
    local cfg = actions_npc[action_id]
    if cfg then
        return cfg.player_act or PLAYER_ACTION_TYPE.ACT_STAND
    end
    return PLAYER_ACTION_TYPE.ACT_STAND
end



-------------------------------------
--		内部调用接口
-------------------------------------

function actions_func:get_action_suffix(attack_type, profession)
    if attack_type == WEAPON_NONE then
        return suffix_profession[profession] or ""
    end
    return suffix_attack[attack_type]
end


function actions_func:get_action_form_cfg(status, action_id, cfg)
    if status.attach_mode ~= enumAttachNone then
        return cfg.normal
    end
    if status.accelerate_run then
        if status.fight then
            return cfg.f_fight or cfg.fight or cfg.normal
        end
        return cfg.f_normal or cfg.normal
    end
    if status.fight then
        return cfg.fight or cfg.normal
    end
    return cfg.normal
end


function actions_func:get_player_mount_action(status, action_id, cfg)
    local mount_id
    if status.fight then
        mount_id = cfg.mount_fight_id or cfg.mount_normal_id
    else
        mount_id = cfg.mount_normal_id
    end
    return mount_id and self:get_npc_normal_action(mount_id) or ""
end


function actions_func:get_player_saint_cloth_child_action(status, action_id, cfg)
    local saint_cloth_child_id
    if status.fight then
        saint_cloth_child_id = cfg.saint_cloth_child_fight_id or cfg.saint_cloth_child_normal_id
    else
        saint_cloth_child_id = cfg.saint_cloth_child_normal_id
    end
    return saint_cloth_child_id and self:get_npc_normal_action(saint_cloth_child_id) or ""
end


function actions_func:get_player_saint_wing_action(status, action_id, cfg)
    local saint_wing_id
    if cfg.replace_wing_action and (not status.show_wing_action) then
        saint_wing_id = cfg.replace_wing_action
    else
        if status.fight then
            saint_wing_id = cfg.saint_wing_fight_id or cfg.saint_wing_normal_id
        else
            saint_wing_id = cfg.saint_wing_normal_id
        end
    end
    
    return saint_wing_id and self:get_npc_normal_action(saint_wing_id) or "翅膀_通用"
end

function actions_func:get_replace_id_form_cfg(status, action_id, cfg)
    if status.attach_mode ~= enumAttachNone then
        return action_id
    end
    if status.accelerate_run then
        if status.fight then
            return cfg.f_fight_id or cfg.fight_id or action_id
        end
        return cfg.f_normal_id or action_id
    end
    if status.fight then
        return cfg.fight_id or action_id
    end
    return action_id
end
