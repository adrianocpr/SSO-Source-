---------------------------------------------------------------
--	所有关于音乐的接口
--  @author hanwei
---------------------------------------------------------------

--- 圣斗士客户端提供给脚本的接口,主要为游戏逻辑接口
module("GameApi")



--- 添加音乐到背景音乐表。如果表为空则立即播放 
-- @param strFile 背景音效路径, 目录都从安装根目录算起，应填写为类似 "music/aa.mp3"。 
--			路径的文件夹间隔请用斜线 '/' ，反斜线需要转义字符'\\'
--			下面的音效也类似
-- @param bFadeIn true/false, 是否淡入 
-- @param volume 0~100,播放音量
-- @param fadeInVolume 0~100，淡入起点
-- @param fadeOutVolume 0~100，淡出终点
function AddMusic( strFile, bFadeIn,volume, fadeInVolume, fadeOutVolume )
end


--- 清空播放列表并且停止背景音乐
-- @param bFadeOut true/false, 是否淡出
function ClearMusicList( bFadeOut ) 
end


--- 设置音乐列表循环模式		
-- @param mode 音乐循环模式<pre>
--	enum mode:
--	LOOP_NONE = 0,				仅播放当前曲目，然后停止
--	LOOP_ALL = 1,				循环播放所有曲目 
--	LOOP_EXCEPT_FIRST = 2,			当第一首播放完后，循环播放其他曲目
--	LOOP_ONCE = 3,				仅播放列表一次，然后停止
-- </pre>
function SetMusicLoop( mode )
end


--- 设置两首曲目之间播放间隔
-- @param iSilentTime 播放间隔，秒>=0
function SetMusicSilence( iSilentTime )
end


--- 设置背景音乐音量
-- @param dVolume 背景音乐音量，0~1
function SetMusicVolume( dVolume )
end


--- 循环播放背景音效
-- @param strFile 背景音效路径
-- @param bFadeIn true/false, 是否淡入 
-- @param dVolume 背景音乐音量，0~1
function PlayBackSfx( strFile, bFadeIn, dVolume )	
    

--- 停止背景音效
-- @param bFadeOut true/false, 是否淡出
function StopBackSfx( bFadeOut )
end


--- 播放2D音效
-- @param strFile 2D音效路径
function Play2DSound( strFile ) 
end


--- 播放3D音效
-- @param strFile 3D音效路径
-- @param distMin 音量衰减起始点 
-- @param distMax 音量衰减到0的位置 
-- @param vPos {x,y,z} 数组，音效位置坐标 
function Play3DSound( strFile, distMin, distMax, vPos ) 
end


--- 获取当前播放音效名
-- @return  当前播放音效名,string类型,如果无音效则为"no sfx"
function GetCurSFXFileName( ) 
end
