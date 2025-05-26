--[[维护：liuyuan
   
 map_sound填表：
  每个音乐区域对应
   map_sound[ 地图instanceID ] [ 区域名称 ]
   
  区域表里面项的含义：
   music：   背景音乐。可以为nil
   night_music： 夜晚时背景音乐。如果为nil那么使用 music
  
  背景音乐切换时机包括下列两种情况：
   1 切换区域时
   2 日夜交替时
  切换时如果两个区域有相同背景音乐，不会切换。
  如果切换到背景音乐为nil，那么将停止当前背景音乐。
  
 注意，要保证一致行为，控制背景音乐时请用 ]]--


local FADE 				= true
local NO_FADE 			= false


map_sound = {}


------------------------------------------------------------------------------------------------
-- 单位模型调用了GlobalApi.PlayMoveSound( id, utf8Option) ，若踩到Terrain上，或者无法判断踩到什么东西上，会调用该函数

-- i64Unit   脚步声的单位xid
-- iTemplId     脚本声的单位模板Id(若为NPC则为NPC模板id)
-- instId    地图InstanceID
-- vPos      单位坐标      
-- iMatType  该点地图的材质编号（与地图相关）.如果踩到的既不是地板也不是建筑，那么iMatType = 0
-- iProfession  职业id 
-- iSaintClothId  圣衣id 
-- bFashionMode  是否是时装模式
-- bUnderWater  是否在水下
-- bCameraUnderWater  摄像机是否在水下
-- utf8Option   PlayMoveSound时的参数

local sound_matter =
{
	[0]="大石",
    [1]="沙滩",
    [2]="雪地",
    [3]="冰面",
    [4]="草地",
    [5]="碎石",
    [6]="泥土",
    [7]="浅水",
    [8]="木质",
    [9]="金属",
}
function map_sound:PlayLandFootSound(i64Unit, iTemplId, InstId, vPos, iMatType, iProfession, iSaintClothId, bFashionMode, bUnderWater, bCameraUnderWater, Utf8Option)
	
	local matter_type = mapFootStepConf[InstId] and mapFootStepConf[InstId][iMatType]
	if matter_type then
		if bUnderWater then matter_type = 7 end    		
		if glb_sound_info then
			DlgApiEx.AddChatMsg("地编导出id="..iMatType ..",对应音频素材为："..sound_matter[matter_type])   
	   	end
	   	
	    if Utf8Option=="run" then   --跑   
	    	GameApi.Play3DSound("{f5bd9d58-6983-4858-a560-1a42a037f92b}", 5, 20, vPos, "matr",matter_type)
	    
	    elseif Utf8Option =="walk" then--走
	        if matter_type == 7 then matter_type = 10 end  --涉水声变
	        GameApi.Play3DSound("{f5bd9d58-6983-4858-a560-1a42a037f92b}", 5, 20, vPos, "matr",matter_type)
	        
	    elseif Utf8Option =="jump" then--起跳	        
			GameApi.Play3DSound("{60ce335b-727f-404b-a66a-8b9a9f8bdbe9}", 5, 20, vPos, "matr", matter_type)
		
		elseif Utf8Option =="land" then--落地
		 	GameApi.Play3DSound("{7f1a93ee-041c-4c61-b22c-5fc76aa07e98}", 5, 20, vPos, "matr", matter_type)		
		 
		elseif Utf8Option =="stop" then--跑步停止
			GameApi.Play3DSound("{59f940e1-8c4a-4f71-81d0-840e9017789d}", 5, 20, vPos, "matr", matter_type)		 
		end
	end
		
	if Utf8Option == "swim" then--游泳前进
		local camera = bCameraUnderWater and 1.5 or 0.5
		GameApi.Play3DSound("{a6cb73b7-aa9a-4ee6-b3df-3e7e4d9f4b4d}", 5, 20, vPos, "camera", camera)	
	elseif Utf8Option == "swim_loop" then--游泳水下循环
		local camera = bCameraUnderWater and 0.5 or 1.5
		GameApi.Play3DSound("{c48f1a50-4320-47d1-92e0-ba23a13b006c}", 5, 20, vPos, "camera", camera)	
	elseif Utf8Option == "swim_stand" then--游泳站立
		local camera = bCameraUnderWater and 1.5 or 0.5
		GameApi.Play3DSound("{8e98fd1a-4605-476c-af35-51c293193f27}", 5, 20, vPos, "camera", camera)	
	end

	self:play_assist_sound(bFashionMode, iProfession, iSaintClothId, vPos)
end



------------------------------------------------------------------------------------------------
-- 若踩到建筑上，会调用该函数
-- i64Unit   脚步声的单位xid
-- iTemplId     脚本声的单位模板Id(若为NPC则为NPC模板id)
-- instId    地图InstanceID
-- vPos      单位坐标      
-- iMatType  建筑材质类型（固定：见地图编辑器中建筑/脚步声选项)
-- iProfession  职业id 
-- iSaintClothId  圣衣id 
-- bFashionMode  是否是时装模式
-- bUnderWater  是否在水下
-- bCameraUnderWater  摄像机是否在水下

-- utf8Option   PlayMoveSound时的参数
function map_sound:PlayBuildingFootSound(i64Unit, iTemplId, instId, vPos, iMatType, iProfession, iSaintClothId, bFashionMode, bUnderWater, bCameraUnderWater, utf8Option)
    if glb_sound_info then
        if iMatType ~= 0 then
			DlgApiEx.AddChatMsg( "建筑材质id="..iMatType)
			if bUnderWater then DlgApiEx.AddChatMsg("在水下") end
		end
    end	

    if utf8Option=="run" then   --跑   
    	GameApi.Play3DSound("{f5bd9d58-6983-4858-a560-1a42a037f92b}", 5, 20, vPos, "matr", iMatType)
    
    elseif utf8Option =="walk" then--走
        if iMatType == 7 then iMatType = 10 end  --涉水声变
        GameApi.Play3DSound("{f5bd9d58-6983-4858-a560-1a42a037f92b}", 5, 20, vPos, "matr", iMatType)
        
    elseif utf8Option =="jump" then--起跳        
		GameApi.Play3DSound("{60ce335b-727f-404b-a66a-8b9a9f8bdbe9}", 5, 20, vPos, "matr", iMatType)
	
	elseif utf8Option =="land" then--落地
	 	GameApi.Play3DSound("{7f1a93ee-041c-4c61-b22c-5fc76aa07e98}", 5, 20, vPos, "matr", iMatType)		
	 
	elseif utf8Option =="stop" then--跑步停止
		GameApi.Play3DSound("{59f940e1-8c4a-4f71-81d0-840e9017789d}", 5, 20, vPos, "matr", iMatType)		 
	end
    		
	self:play_assist_sound(bFashionMode, iProfession, iSaintClothId, vPos)
end
	




-------------------------------------
--		function called by self
-------------------------------------
function map_sound:play_assist_sound(bFashionMode, iProfession, iSaintClothId, vPos)
    if bFashionMode then return end
    if iProfession ~= 1 and iSaintClothId == 0 then return end
    
	if Utf8Option =="metal_runfly" then --奔跑盔甲
		GameApi.Play3DSound("{feedc701-9dbf-43da-9c32-0d91a7ce4a38}", 5, 20, vPos, "default", 0.5)

	elseif Utf8Option =="metal_stopfly" then --盔甲奔跑停止
		GameApi.Play3DSound("{b73e3be2-c6c5-4c80-aabd-10fab8a230da}", 5, 20, vPos, "default", 0.5)
		
	elseif Utf8Option =="metal_specialstopfly" then --盔甲特殊奔跑停止
		GameApi.Play3DSound("{05510efd-3cf0-41ff-a046-3b07d3248268}", 5, 20, vPos, "default", 0.5)
		
	elseif Utf8Option =="metal_jumpfly" then --盔甲起跳
		GameApi.Play3DSound("{df8aa4b9-77a2-4041-8cda-417245204737}", 5, 20, vPos, "default", 0.5)
		
	elseif Utf8Option =="metal_jumpendfly" then --盔甲跳跃结束
		GameApi.Play3DSound("{cb6cbdbb-0885-4424-a5a1-17c204df1480}", 5, 20, vPos, "default", 0.5)
		
	elseif Utf8Option =="metal_doublejumpfly" then --盔甲二段跳
		GameApi.Play3DSound("{e00e7e37-1ac0-43c9-ba2a-f80b1e6c6c2c}", 5, 20, vPos, "default", 0.5)
		
	elseif Utf8Option =="metal_specialdoublejumpfly" then --盔甲特殊二段跳
		GameApi.Play3DSound("{fd0a9ed6-092c-4af9-95a4-c8ffb6cb5f72}", 5, 20, vPos, "default", 0.5)

	elseif Utf8Option =="metal_runquickfly" then --盔甲快速
		GameApi.Play3DSound("{4908be6d-7fab-4c16-9318-5afc67e3d148}", 5, 20, vPos, "default", 0.5)
	end
end


