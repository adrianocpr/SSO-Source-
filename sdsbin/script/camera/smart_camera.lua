---------------------------------------------------------------
--  created:   2012.3.15
--  author:    hanwei
--
--  自动镜头实现
---------------------------------------------------------------

local GameApi = GameApi

-- 技能镜头效果与掩码对应表
-- 程序写死，非策划配置
SmartCameraEffect_Mask_Map = {}
SmartCameraEffect_Mask_Map =
{
	[BLOOM_EFFECT] 	 = 0x04,
	[DEPTH_OF_FIELD] = 0x10,
	[RADIAL_BLUR]    = 0x20,
	[MOTION_BLUR]    = 0x40,
	[WRAP_EFFECT]    = 0x80,
    [COLOR_CORRECTION_EFFECT] = 0x100,
}

module("smart_camera", package.seeall)

-- 关闭镜头
function _M:disable_camera(id, useTime)  
    if GameApi.IsPlayingSmartCamera() then
		local camera = smart_camera_config[id]
    	if not camera then
    	    return
    	end
    	
    	--
    	if camera[SMART_POS] then
        	self.pos_idx = #(camera[SMART_POS])
    	end
    	      
    	--
    	if camera[SMART_ROTATE] then
        	self.rotate_idx = #(camera[SMART_ROTATE])
    	end
    	
    	--
    	if camera[SMART_FOV] then
        	self.fov_idx = #(camera[SMART_FOV])
    	end
    	
    	--
    	if camera[BLOOM_EFFECT] then
        	self.bloom_effect_idx = #(camera[BLOOM_EFFECT])
    	end
    	      
    	--
    	if camera[DEPTH_OF_FIELD] then
        	self.depth_of_field_idx = #(camera[DEPTH_OF_FIELD])
    	end
    	
    	--
    	if camera[RADIAL_BLUR] then
        	self.radial_blur_idx = #(camera[RADIAL_BLUR]) 
    	end
    	
    	--
    	if camera[MOTION_BLUR] then
        	self.motion_blur_idx = #(camera[MOTION_BLUR])
    	end
    	
    	--
    	if camera[WRAP_EFFECT] then
        	self.wrap_effect_idx = #(camera[WRAP_EFFECT]) 
    	end
    	 
        --
        useTime = useTime or 0
        GameApi.EndSmartCamera(useTime)
    end
end

-- 关闭技能指定特效镜头
function _M:disable_camera_effect(EffectId)
    local mask = SmartCameraEffect_Mask_Map[EffectId]
    if mask and GameApi.IsPlayingSmartCamera() then
        GameApi.DisablePostEffect(mask)
    end
end

-- 关闭指定技能全部特效镜头
function _M:disable_skill_camera(SkillId, useTime)  
    if not SkillId and not SkillId_SmartCameraId_Map and not SkillId_SmartCameraId_Map[SkillId] then
    	return
    end

	local id = SkillId_SmartCameraId_Map[SkillId]
	
	self:disable_camera(id, useTime)

--[[	
    local camera = smart_camera_config[id]

    --
    if camera[BLOOM_EFFECT] then
        self:disable_camera_effect(BLOOM_EFFECT)
    end      
    --
    if camera[DEPTH_OF_FIELD] then
        self:disable_camera_effect(DEPTH_OF_FIELD)
    end
    --
    if camera[RADIAL_BLUR] then
        self:disable_camera_effect(RADIAL_BLUR)
    end
    --
    if camera[MOTION_BLUR] then
        self:disable_camera_effect(MOTION_BLUR)
    end
    --
    if camera[WRAP_EFFECT] then
        self:disable_camera_effect(WRAP_EFFECT)
    end
--]]    
end

-- 播放指定技能特效镜头
function _M:play_skill_camera(SkillId)
    if SkillId_SmartCameraId_Map and SkillId_SmartCameraId_Map[SkillId] then
        local id = SkillId_SmartCameraId_Map[SkillId]
        self:play(id)
    end
end

-- 镜头播完调用回调函数
function _M:OnDestAll()
    if self.on_complete_func then      
        self.on_complete_func(unpack(self.on_complete_varlist))
    end
end

-- 播放指定特效镜头
-- id: 镜头ID
-- on_complete:镜头播完后调用的回调函数
-- on_complete:镜头播完后调用的回调函数的参数
function _M:play(id, on_complete, ...)  
    if GameApi.IsPlayingSmartCamera() then
        return false
    end
    local camera = smart_camera_config[id]
    if not camera then 
        return false
    end

    self.on_complete_func = on_complete
    self.on_complete_varlist = {...}
    GameApi.StartSmartCamera()

    -- 设置效果关键帧时间表
    if camera[KEY_FRAMES_LIST] then
        self.keyframe = camera[KEY_FRAMES_LIST]
    end

    -- 测试并启动各种镜头效果
	self.relative = nil

	-- 移动(以相对移动优先)
	self.smart_pos = camera[SMART_POS_RELATIVE]
	if self.smart_pos then
	    if not GameApi.IsPlayingSmartCameraPos() or self.relative then
	        self.pos_relative = true    	    
    	    self.pos_idx = 0
    	    self:OnDestPosRelative() 
	    end
	else
	    self.smart_pos = camera[SMART_POS]
	    if self.smart_pos then 
    		if not GameApi.IsPlayingSmartCameraPos() then 
    		    self.pos_relative = false   	    
    	    	self.pos_idx = 0
    	    	self:OnDestPos() 
	    	end
	    end	    
	end

    -- 旋转(以相对转动优先)
    self.smart_rotate = camera[SMART_ROTATE_RELATIVE]
    if self.smart_rotate then
       if not GameApi.IsPlayingSmartCameraRotate() or self.relative then
           self.rotate_relative = true
           self.rotate_idx = 0
           self:OnDestOriRelative()
       end
    else
     	self.smart_rotate = camera[SMART_ROTATE]
     	if self.smart_rotate then
     	   if not GameApi.IsPlayingSmartCameraRotate() then
     	        self.rotate_relative = false
           		self.rotate_idx = 0
           		self:OnDestOri()
       		end
     	end        
     end
     
	-- 视角
     self.smart_fov = camera[SMART_FOV]
     if self.smart_fov then
        if not GameApi.IsPlayingSmartCameraFov() then
            self.fov_idx = 0
            self:OnDestFOV()
        end
     end
     
     --全屏泛光
     self.bloom_effect = camera[BLOOM_EFFECT]
     if self.bloom_effect then
        if not GameApi.IsAnimatingBloomParam() then
            self.bloom_effect_idx = 0
            self:OnDestBloomParam()
        end
     end     
   
     --景深
     self.depth_of_field = camera[DEPTH_OF_FIELD]
     if self.depth_of_field then
        if not GameApi.IsAnimatingDOFParam() then
            self.depth_of_field_idx = 0
            self:OnDestDOFParam()
        end
     end     
    
     --径向模糊
     self.radial_blur = camera[RADIAL_BLUR]
     if self.radial_blur then
        if not GameApi.IsAnimatingRadialBlurParam() then
            self.radial_blur_idx = 0
            self:OnDestRadialBlurParam()
        end
     end     
     
     --运动模糊
     self.motion_blur = camera[MOTION_BLUR]
     if self.motion_blur then
        if not GameApi.IsAnimatingMotionBlurParam() then
            self.motion_blur_idx = 0
            self:OnDestMotionBlurParam()
        end
     end
     
     --水下扭曲
     self.wrap_effect = camera[WRAP_EFFECT]
     if self.wrap_effect then
        if not GameApi.IsAnimatingWarpParam() then
            self.wrap_effect_idx = 0
            self:OnDestWarpParam()
        end
     end

     --颜色校正
     self.color_correction_effect = camera[COLOR_CORRECTION_EFFECT]
     if self.color_correction_effect then
        if not GameApi.IsAnimatingCCParam() then
            self.color_correction_effect_idx = 0
            self:OnDestCCParam()
        end
     end
     
     --字幕
     self.anim_mask = camera[ANIM_MASK]
     if self.anim_mask and type(self.anim_mask.useTime) == "number" and self.anim_mask.useTime > 0 then
        GameUI.ShowAnimationMask()
        set_timeout(function()
               GameUI.HideAnimationMask()
           end, self.anim_mask.useTime)

        if self.anim_mask.dialogue and type(self.anim_mask.dialogue) == "table" and #self.anim_mask.dialogue > 0 then
            self.dialogue_idx = 0
            self:OnDestAnimationMask()
        end
     end
     
     --屏蔽
     self.hide_mask = camera[HIDE_MASK]
     if self.hide_mask then
        local bHideHostPlayer = self.hide_mask.hide_host or false
        local bHideElsePlayer = self.hide_mask.hide_else_player or false      
        GameApi.HideInSmartCamera(bHideHostPlayer, bHideElsePlayer)
     end

     return true    
end

-- 相对移动
function _M:OnDestPosRelative()
    if self.pos_idx == nil then 
        return 
    end

    self.pos_idx = self.pos_idx + 1
    local accelPercent = 0.0
    -- 取参考点绝对位置，以便计算相对位置 
    if self.pos_idx == 1 then
        self.fixPos = self.smart_pos[self.pos_idx]
        self.pos_idx = self.pos_idx + 1
        -- 判断是否回到参考原点
        local pos_relative = self.smart_pos[self.pos_idx]
        if pos_relative and pos_relative.accelPercent then
            accelPercent = pos_relative.accelPercent
        end       
        if not self.relative and pos_relative and self.fixPos.x == pos_relative.x and self.fixPos.y == pos_relative.y and self.fixPos.z == pos_relative.z then
            self.relative = true
            GameApi.PlaySmartCameraPosRelative(0, 0, 0, pos_relative.useTime, accelPercent, true)
        elseif not self.relative and pos_relative then
            GameApi.PlaySmartCameraPosRelative(self.fixPos.x - pos_relative.x, pos_relative.y - self.fixPos.y, self.fixPos.z - pos_relative.z, pos_relative.useTime, accelPercent, false)
        end
    else
    	local pos_relative = self.smart_pos[self.pos_idx]
    	if pos_relative and pos_relative.accelPercent then
            accelPercent = pos_relative.accelPercent
        end
        if self.fixPos then
            if pos_relative and pos_relative ~= END then
                GameApi.PlaySmartCameraPosRelative(self.fixPos.x - pos_relative.x, pos_relative.y - self.fixPos.y, self.fixPos.z - pos_relative.z, pos_relative.useTime, accelPercent, false)
            elseif pos_relative then
                GameApi.PlaySmartCameraPosRelative(0, 0, 0, self.keyframe[self.pos_idx], accelPercent, false, true)
            end
        end        
--[[        
		if self.fixPos and pos_relative then
	    	GameApi.PlaySmartCameraPosRelative(self.fixPos.x - pos_relative.x, pos_relative.y - self.fixPos.y, self.fixPos.z - pos_relative.z, pos_relative.useTime, accelPercent, false)
   		end
--]]        
    end
end

-- 移动
function _M:OnDestPos()
    if self.pos_idx == nil then 
        return 
    end

    if self.pos_relative then
        self:OnDestPosRelative()
    else
    	self.pos_idx = self.pos_idx + 1
    	local pos = self.smart_pos[self.pos_idx]
		if pos and pos ~= END then
        	GameApi.PlaySmartCameraPos(pos.x, pos.y, pos.z, pos.useTime, pos.accelPercent)
   		elseif pos and self.smart_pos[1] then
            local first_pos = self.smart_pos[1]
            GameApi.PlaySmartCameraPos(first_pos.x, first_pos.y, first_pos.z, self.keyframe[self.pos_idx], first_pos.accelPercent, true)
        end
    end
end

-- 相对旋转
function _M:OnDestOriRelative()
    if self.rotate_idx == nil then 
        return 
    end

    self.rotate_idx = self.rotate_idx + 1
    -- 取参考点绝对方位 
    if self.rotate_idx == 1 then
         self.fixRotate = self.smart_rotate[self.rotate_idx]
         self.rotate_idx = self.rotate_idx + 1
         -- 判断是否回到参考原点
         local rotate_relative = self.smart_rotate[self.rotate_idx]
         if not self.relative and rotate_relative and self.fixRotate.x == rotate_relative.x and self.fixRotate.y == rotate_relative.y and self.fixRotate.z == rotate_relative.z and self.fixRotate.w == rotate_relative.w then
            self.relative = true
            GameApi.PlaySmartCameraRotateRelative(0, 0, 0, 0, rotate_relative.useTime, true)
         elseif not self.relative and rotate_relative then
                GameApi.PlaySmartCameraRotateRelative(rotate_relative.x, rotate_relative.y, rotate_relative.z, rotate_relative.w, rotate_relative.useTime)
         end
    else
        local rotate_relative = self.smart_rotate[self.rotate_idx]
        if self.fixRotate then
            if rotate_relative and rotate_relative ~= END then
                GameApi.PlaySmartCameraRotateRelative(rotate_relative.x, rotate_relative.y, rotate_relative.z, rotate_relative.w, rotate_relative.useTime)
            elseif rotate_relative then
                GameApi.PlaySmartCameraRotateRelative(0, 0, 0, 1, self.keyframe[self.rotate_idx], false, true)
            end
        end
--[[		if self.fixRotate and rotate_relative then
		    GameApi.PlaySmartCameraRotateRelative(rotate_relative.x, rotate_relative.y, rotate_relative.z, rotate_relative.w, rotate_relative.useTime)		    
   		end--]]
    end
end

-- 旋转
function _M:OnDestOri()
    if self.rotate_idx == nil then 
        return 
    end

    if self.rotate_relative then
        self:OnDestOriRelative()
    else    
    	self.rotate_idx = self.rotate_idx + 1
    	local rotate = self.smart_rotate[self.rotate_idx]
		if rotate and rotate ~= END then
        	GameApi.PlaySmartCameraRotate(rotate.x, rotate.y, rotate.z, rotate.w, rotate.useTime)
   			--GameApi.PlaySmartCameraRotate(rotate.dirx, rotate.diry, rotate.dirz, rotate.upx, rotate.upy, rotate.upz, rotate.useTime)
   		elseif rotate and self.smart_rotate[1] then
            local first_rotate = self.smart_rotate[1]
            GameApi.PlaySmartCameraRotate(first_rotate.x, first_rotate.y, first_rotate.z, first_rotate.w, self.keyframe[self.rotate_idx], true)          
        end
    end
end

-- 视角
function _M:OnDestFOV()
    if self.fov_idx == nil then 
        return 
    end

    self.fov_idx = self.fov_idx + 1
    local fov = self.smart_fov[self.fov_idx]

    if fov == nil then
        return
    end

	if fov ~= EMPTY then
        GameApi.PlaySmartCameraFov(fov.fov, fov.useTime)
    elseif self.keyframe and self.fov_idx < #self.keyframe then
        set_timeout(function() 
            self:OnDestFOV() 
        end, self.keyframe[self.fov_idx])
    end
end

--全屏泛光
function _M:OnDestBloomParam()
    if self.bloom_effect_idx == nil then 
        return 
    end

    self.bloom_effect_idx = self.bloom_effect_idx + 1
    local bloom_effect = self.bloom_effect[self.bloom_effect_idx]

    if bloom_effect == nil then
        return
    end

	if bloom_effect ~= EMPTY then
        if bloom_effect == END and self.keyframe and self.bloom_effect_idx == #self.keyframe then
            bloom_effect = self.bloom_effect[self.bloom_effect_idx-1]
            GameApi.AnimateBloomParam(bloom_effect.blurSize, bloom_effect.brightThreshold, bloom_effect.brightScale, self.keyframe[self.bloom_effect_idx], true, bloom_effect.blurSize, bloom_effect.brightThreshold, END_BLOOM_EFFECT.brightScale)
        else
            GameApi.AnimateBloomParam(bloom_effect.blurSize, bloom_effect.brightThreshold, bloom_effect.brightScale, bloom_effect.useTime)
   	    end
    elseif self.keyframe and self.bloom_effect_idx < #self.keyframe then
        set_timeout(function() 
            self:OnDestBloomParam() 
        end, self.keyframe[self.bloom_effect_idx])
    end
end

--景深
function _M:OnDestDOFParam()
    if self.depth_of_field_idx == nil then 
        return 
    end

    self.depth_of_field_idx = self.depth_of_field_idx + 1
    local depth_of_field = self.depth_of_field[self.depth_of_field_idx]

    if depth_of_field == nil then
        return
    end

	if depth_of_field ~= EMPTY then
        if depth_of_field == END and self.keyframe and self.depth_of_field_idx == #self.keyframe then
            depth_of_field = self.depth_of_field[self.depth_of_field_idx-1]
            GameApi.AnimateDOFParam(depth_of_field.nearBlur, depth_of_field.nearFocus, depth_of_field.farFocus, depth_of_field.farBlur, depth_of_field.clampBlurFar, self.keyframe[self.depth_of_field_idx], true, depth_of_field.nearBlur, depth_of_field.nearFocus, depth_of_field.farFocus, depth_of_field.farBlur, END_DEPTH_OF_FIELD.clampBlurFar)
        else
            GameApi.AnimateDOFParam(depth_of_field.nearBlur, depth_of_field.nearFocus, depth_of_field.farFocus, depth_of_field.farBlur, depth_of_field.clampBlurFar, depth_of_field.useTime)
   	    end
    elseif self.keyframe and self.depth_of_field_idx < #self.keyframe then
        set_timeout(function() 
            self:OnDestDOFParam() 
        end, self.keyframe[self.depth_of_field_idx])
    end
end

--径向模糊
function _M:OnDestRadialBlurParam()
    if self.radial_blur_idx == nil then 
        return 
    end

    self.radial_blur_idx = self.radial_blur_idx + 1
    local radial_blur = self.radial_blur[self.radial_blur_idx]

    if radial_blur == nil then
        return
    end

	if radial_blur ~= EMPTY then
        if radial_blur == END and self.keyframe and self.radial_blur_idx == #self.keyframe then
            radial_blur = self.radial_blur[self.radial_blur_idx-1]
            GameApi.AnimateRadialBlurParam(radial_blur.blurCenterX, radial_blur.blurCenterY, radial_blur.blurLength, radial_blur.inFocusRadius, radial_blur.outFocusRadius, self.keyframe[self.radial_blur_idx], true, radial_blur.blurCenterX, radial_blur.blurCenterY, END_RADIAL_BLUR.blurLength, radial_blur.inFocusRadius, radial_blur.outFocusRadius)
        else        
            GameApi.AnimateRadialBlurParam(radial_blur.blurCenterX, radial_blur.blurCenterY, radial_blur.blurLength, radial_blur.inFocusRadius, radial_blur.outFocusRadius, radial_blur.useTime)
        end
    elseif self.keyframe and self.radial_blur_idx < #self.keyframe then
        set_timeout(function() 
            self:OnDestRadialBlurParam() 
        end, self.keyframe[self.radial_blur_idx])
    end
end

--运动模糊
function _M:OnDestMotionBlurParam()
    if self.motion_blur_idx == nil then 
        return 
    end

    self.motion_blur_idx = self.motion_blur_idx + 1
    local motion_blur = self.motion_blur[self.motion_blur_idx]

    if motion_blur == nil then
        return
    end

	if motion_blur ~= EMPTY then
        if motion_blur == End and self.keyframe and self.motion_blur_idx == #self.keyframe then
            motion_blur = self.motion_blur[self.motion_blur_idx-1]
            GameApi.AnimateMotionBlurParam(motion_blur.blurMax, motion_blur.blurScale, motion_blur.blurScalePosition, motion_blur.blurScaleRotation, motion_blur.inFocusDistance, motion_blur.outFocusDistance, self.keyframe[self.motion_blur_idx], true, END_MOTION_BLUR.blurMax, END_MOTION_BLUR.blurScale, END_MOTION_BLUR.blurScalePosition, END_MOTION_BLUR.blurScaleRotation, END_MOTION_BLUR.inFocusDistance, END_MOTION_BLUR.outFocusDistance)
        else
            GameApi.AnimateMotionBlurParam(motion_blur.blurMax, motion_blur.blurScale, motion_blur.blurScalePosition, motion_blur.blurScaleRotation, motion_blur.inFocusDistance, motion_blur.outFocusDistance, motion_blur.useTime)
        end
    elseif self.keyframe and self.motion_blur_idx < #self.keyframe then
        set_timeout(function() 
            self:OnDestMotionBlurParam() 
        end, self.keyframe[self.motion_blur_idx])
    end
end

--水下扭曲
function _M:OnDestWarpParam()
    if self.wrap_effect_idx == nil then 
        return 
    end

    self.wrap_effect_idx = self.wrap_effect_idx + 1
    local wrap_effect = self.wrap_effect[self.wrap_effect_idx]

    if wrap_effect == nil then
        return
    end

	if wrap_effect ~= EMPTY then
        if wrap_effect == END and self.keyframe and self.wrap_effect_idx == #self.keyframe then
            wrap_effect = self.wrap_effect[self.wrap_effect_idx-1]
            GameApi.AnimateWarpParam(wrap_effect.scale, wrap_effect.speed, self.keyframe[self.wrap_effect_idx], true, END_WRAP_EFFECT.scale, wrap_effect.speed)
        else
            GameApi.AnimateWarpParam(wrap_effect.scale, wrap_effect.speed, wrap_effect.useTime)
        end            
    elseif self.keyframe and self.wrap_effect_idx < #self.keyframe then
        set_timeout(function() 
            self:OnDestWarpParam() 
        end, self.keyframe[self.wrap_effect_idx])
    end
end

--颜色校正
function _M:OnDestCCParam()
    if self.color_correction_effect_idx == nil then 
        return 
    end

    self.color_correction_effect_idx = self.color_correction_effect_idx + 1
    local color_correction_effect = self.color_correction_effect[self.color_correction_effect_idx]

    if color_correction_effect == nil then
        return
    end

    if color_correction_effect ~= EMPTY then
        if color_correction_effect == END and self.keyframe and self.color_correction_effect_idx == #self.keyframe then
            color_correction_effect = self.color_correction_effect[self.color_correction_effect_idx-1]
            GameApi.AnimateCCParam(color_correction_effect.factor, color_correction_effect.startTexture, color_correction_effect.endTexture, self.keyframe[self.color_correction_effect_idx], true, End_COLOR_CORRECTION_EFFECT.factor, color_correction_effect.startTexture, color_correction_effect.endTexture)
        else
            GameApi.AnimateCCParam(color_correction_effect.factor, color_correction_effect.startTexture, color_correction_effect.endTexture, color_correction_effect.useTime)
        end
    elseif self.keyframe and self.color_correction_effect_idx < #self.keyframe then
        set_timeout(function() 
            self:OnDestCCParam() 
        end, self.keyframe[self.color_correction_effect_idx])        
    end
end

--字幕
function _M:OnDestAnimationMask()
    if self.dialogue_idx == nil then 
        return 
    end

    self.dialogue_idx = self.dialogue_idx + 1
    local dialog = self.anim_mask.dialogue[self.dialogue_idx]

    if dialog == nil then
        return
    end

    Panel_AnimationMask2 = ui.dialog.get("Panel_AnimationMask2")
    if Panel_AnimationMask2 then
        DlgApi.SetItemText("Panel_AnimationMask2", "Label_Content", dialog.text)
    end

    set_timeout(function()
               self:OnDestAnimationMask()
           end, dialog.useTime)
end