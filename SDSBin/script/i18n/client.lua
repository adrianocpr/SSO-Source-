local _t = require("i18n").context()

module("CLIENT_TABLE")



-------------
--标题
GAME_NAME				= _t"圣斗士星矢"
GAME_NAME_SERVER_INFO 	= _t"圣斗士星矢-%s"
GAME_NAME_LINE_INFO 	= _t"圣斗士星矢-%s-%s"


-------------
--MsgBox
WARN                 = _t"警告"
ERROR                = _t"错误"
CLIENT_UPDATE_ERROR  = _t"客户端的最近一次更新没有完成，这将导致无法进入游戏等严重问题！\r\n请启动自动更新程序进行检查！"
HARDWARD_ERROR       = _t"对不起，由于您的系统硬件或系统软件的问题，无法运行本游戏!"
NO_CACHE_ERROR       = _t"无法创建cache目录，游戏无法运行！\n请确保硬盘有足够的剩余空间再运行本游戏！"
NO_SCREENSHOT_ERROR  = _t"无法创建screenshots目录，游戏无法运行！\n请确保硬盘有足够的剩余空间再运行本游戏！"
NO_ROLESETTINGS_ERROR= _t"无法创建RoleSettings目录，游戏无法运行！\n请确保硬盘有足够的剩余空间再运行本游戏！"
NO_GAMESAVE_ERROR    = _t"无法创建gamesave目录，游戏无法运行！\n请确保硬盘有足够的剩余空间再运行本游戏！"
NO_LOGS_ERROR        = _t"无法创建logs目录，游戏无法运行！\n请确保硬盘有足够的剩余空间再运行本游戏！"
NetMeeting_WARN      = _t"游戏程序检测到您的机器上有NetMeeting正在运行！\n由于NetMeeting运行时其他程序无法使用显卡的三维加速功能，所以请先关闭NetMeeting 后再进行游戏！"
IMPORTANT_FAIL_ERROR = _t"对不起，由于您机器上安装的游戏资源缺少了一个重要的文件，游戏无法运行！请重新安装游戏客户端！"
LOAD_BUILDING_ERROR  = _t"加载建筑失败，程序即将退出！"
READ_RESOURCE_ERROR  = _t"读取资源数据出错，程序即将退出！"
PACK_LOAD_ERROR      = _t"文件包 [%s] 被损坏，无法打开，请重新安装游戏客户端！"
PACK_OPEN_FAIL       = _t"文件包打开失败"
UNKNOWN_ERROR        = _t"未知错误"
CHECK_DIRECTX        = _t"无法创建Direct3D对象，请检查DirectX版本"
CHECK_VIDEO_DEVICE   = _t"显卡至少要支持两层纹理的多层纹理映射！请检查您的显卡驱动并运行dxdiag命令来检测显卡的Direct3D加速是否正常！"
SHOW_FORMAT_16BIT    = _t"无法获得16位模式的显示格式，请检查您的显卡驱动以及DirectX的版本"
DIRECT_SHOW_ERROR    = _t"无法创建DirectDraw2对象，请检查DirectX版本"
VIDEO_MEMORY_ERROR   = _t"无法获取显存大小，请检查DirectX版本"
VIDEO_MEMORY_LOW     = _t"系统剩余的可用于贴图的显存小于%dMB，用户取消了游戏运行。"
TEXTURE_HIGH         = _t"高"
TEXTURE_NORMAL       = _t"中"
TEXTURE_LOW          = _t"低"
TEXTURE_HIGH_WARN    = _t"贴图精度过高"
VIDEO_MEMORY_TOO_LOW = _t"您的系统剩余的可用于贴图的显存小于%dMB，在游戏的过程中可能会导致花屏、死机等严重的错误！您是否还要进入游戏？"
PRELOAD_SCRIPT_ERROR = _t"加载脚本 %s 失败!"
LOAD_RESOURSE_FAIL   = _t"无法加载游戏数据文件！\n此错误可能是更新不完全所致，请重新进行更新或进行版本验证！"
LOAD_RESOURSE_FAIL_QUERY = _t"无法加载游戏数据文件！此错误可能是更新不完全所致！\n点击\"是\"：进行版本更新和验证。(注：可能需要花费较长时间)\n点击\"否\"：稍后手动更新或版本验证。"
TERMINAL_EXCEPTION   = _t"警告：程序被异常终止!!!!"
MEMORY_LOW_WARN    	 = _t"内存低"
MEMORY_TOO_LOW 		 = _t"您的系统剩余的可用物理内存小于512MB，会影响游戏的流畅性, 建议您关掉一些其它程序后再进行游戏！您是否还要进入游戏？"
MEMORY_LOW     		 = _t"可用物理内存小于%dMB，用户取消了游戏运行。"
SECURITY_DANGER_MODUEL	=	_t"危险模块"


PERFECT_PROTECTOR_OPTION	= "Perfect Protector"
PERFECT_PROTECTOR_ERROR1	= _t"当前使用的操作系统版本（包括WinXP 64位）不支持。\n在Vista、Win7和Win8的64位系统，游戏使用XP兼容运行也会出现类似问题。"
PERFECT_PROTECTOR_ERROR3	= _t"请等待游戏完全启动以后再尝试"
PERFECT_PROTECTOR_ERROR4	= _t"请确认游戏没有被杀毒软件或防火墙禁止，并确认您是在管理员帐号下启动游戏。\n如果仍存在问题，请尝试下面的方法:\n 1、如果Windows系统更新，请尝试重启计算机。\n 2、请尝试使用最新的杀毒软件查杀木马和病毒。"
PERFECT_PROTECTOR_ERROR5	= _t"Windows远程过程调用失败且未运行, 请重启计算机"
PERFECT_PROTECTOR_ERROR7	= _t"请等待游戏完全结束以后再尝试"
PERFECT_PROTECTOR_ERROR11	= _t"请确认游戏没有被杀毒软件或防火墙禁止，并确认您是在管理员帐号下启动游戏。\n如果仍存在问题，请尝试下面的方法:\n 1、如果Windows系统更新，请尝试重启计算机。\n 2、请尝试使用最新的杀毒软件查杀木马和病毒。"
PERFECT_PROTECTOR_ERROR23	= _t"打开时间过长，请关闭所有游戏客户端，重新尝试"
PERFECT_PROTECTOR_ERROR24	= _t"最多允许同时运行3个客户端"
PERFECT_PROTECTOR_ERROR126	= _t"由于操作系统有未完成的操作，如自动更新，请完成这些操作并重启计算机再尝试打开游戏"
PERFECT_PROTECTOR_ERROR1450	= _t"系统内存不足，请注销或重启电脑以后再尝试!"



function GetString(self, key)
    return self[key]
end

