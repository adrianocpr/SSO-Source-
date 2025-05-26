---------------------------------------------------------------
--	所有关于界面操作的接口
--  @author hanwei
---------------------------------------------------------------

--- AUI库提供给脚本的扩展接口,主要为游戏逻辑相关接口
module("DlgApiEx")



-------------------------------------------------------------------------------
-- 图标类型
-- @class table
-- @name icon_type
-- @field ICONS_ACTION 0,动作
-- @field ICONS_SKILL 1,技能
-- @field ICONS_STATE 2,状态
-- @field ICONS_SKILLGRP 3,连招
-- @field ICONS_GUILD 4,军团
-- @field ICONS_PET 5,宠物
-- @field ICONS_LOTTERY 6,彩票
-- @field ICONS_NPC 7,NPC头像
-- @field ICONS_COVER 8,图片遮罩
-- @field ICONS_HINT 9,悬浮提示
-- @field ICONS_MARK 10,地图
-- @field ICONS_MAX 11,无效
-- @field ICONS_INVENTORY 12,物品
-- @field ICONS_ALL_MAX 13,无效
local icon_type = 
{
	ICONS_ACTION,
	ICONS_SKILL,
    ICONS_STATE,
    ICONS_SKILLGRP,
    ICONS_GUILD,
    ICONS_PET,
    ICONS_LOTTERY,
    ICONS_NPC,
    ICONS_COVER,
    ICONS_HINT,
    ICONS_MARK,
    ICONS_MAX,
    ICONS_INVENTORY,
    ICONS_ALL_MAX
}

--- 获取图片在界面显示的特殊字符, 悬浮提示使用
-- @param img_name 图片名,见surfaces\iconsets目录下边图片资源对应的配置文件
-- @param icon_type 图片类型, icon_type
-- @return string, 该图片指定的字符串
-- @see icon_type
function GetImageString(img_name, icon_type)
end


--- 获取寻径链接字符串
-- 有两种调用方式，方括号内为可选参数：<pre>
-- GetRouteLinkText(id, [name])
-- GetRouteLinkText(id, [line_id], [name])
-- </pre>
-- @param id 寻径id
-- @param line_id 目的地所在线号，0或不填为不换线
-- @param name 链接文字
function GetRouteLinkText(id, ...)
end


--- 即时加载界面文件
-- @param panel_name 界面标示名,在界面xml文件中有配置
-- @return true/false,加载界面是否失败
function LoadGameDialog(panel_name)
end


--- 切换界面主题, 主题在AUIEdiotor中配置
-- @param theme_name 主题标示名,在主题配置中可以找到,原理同界面标示名
function ChangeUIThemes(theme_name)
end


--- 判断是否存在标示名为panel_name的界面
-- @param panel_name 界面标示名,在界面xml文件中有配置
-- @return true/false,是否存在名为panel_name的界面
function IsDialogExists(panel_name)
end


--- 判断标示名为panel_name界面是否存在名字为item_name的控件
-- @param panel_name 界面标示名,在界面xml文件中有配置
-- @param item_name 控件标示名,在界面xml文件中有配置
-- @return true/false,控件是否存在
function IsItemExists(panel_name, item_name)
end


-------------------------------------------------------------------------------
-- 图标类型
-- @class table
-- @name obj_type
-- @field invalid         "invalid"
-- @field checkbox        "checkbox"     
-- @field combobox        "combobox"     
-- @field console         "console"      
-- @field customize       "customize"    
-- @field editbox         "editbox"      
-- @field image           "image"        
-- @field label           "label"        
-- @field listbox         "listbox"      
-- @field modelpicture    "modelpicture" 
-- @field progress        "progress"     
-- @field radio           "radio"        
-- @field scroll          "scroll"       
-- @field slider          "slider"       
-- @field button          "button"       
-- @field subdialog       "subdialog"    
-- @field textarea        "textarea"     
-- @field tree            "tree"         
-- @field vtext           "vtext"        
-- @field windowpicture   "windowpicture"
local obj_type = {}

--- 获取指定界面中指定控件的控件类型
-- @param panel_name 界面标示名,在界面xml文件中有配置
-- @param item_name 控件标示名,在界面xml文件中有配置
-- @return string, 控件类型字符串, 可取值范围见obj_type
-- @see obj_type
function GetItemType(panel_name, item_name)
end


--- 判断标示名为panel_name界面是否加载(由于界面是在使用加载的,大部分界面都不会直接加载)
-- @param panel_name 界面标示名,在界面xml文件中有配置
-- @return true/false,界面是否加载
function IsDialogLoad(panel_name)
end


--- 获得subdialog控件中的dialog名
-- @param panel_name 界面标示名,在界面xml文件中有配置
-- @param item_name 控件标示名,在界面xml文件中有配置
-- @return true/false,控件是否存在
function GetDialogInSubDialogItem(panel_name, item_name)
end


--- 改变subdialog控件中的dialog
-- @param panel_name 界面标示名,在界面xml文件中有配置
-- @param item_name 控件标示名,在界面xml文件中有配置
-- @param sub_dlg_name 子界面名
function SetDialogInSubDialogItem(panel_name, item_name, sub_dlg_name)
end



-------------------------------------------------------------------------------
-- UIMan类型
-- @class table
-- @name uiman_type
-- @field UIMAN_NONE     默认无世界类型
-- @field UIMAN_LOGIN    登录世界
-- @field MAN_INGAME     游戏世界
-- @field UIMAN_LOADING  Loading世界
local uiman_type = {}


--- 向客户端指定类型的世界发送消息
-- @param uiman_id uiman的标示id,可取值范围见uiman_type
-- @param event_id 消息id,需要在客户端实现响应函数
-- @see uiman_type
function SendUIManEvent(uiman_id, event_id)
end


--- 向客户端指定界面发送控件执行消息,可以实现控件被点击或者执行的效果
-- @param uiman_id uiman的标示id,可取值范围见uiman_type
-- @param panel_name 界面标示名,在界面xml文件中有配置
-- @param item_name 控件标示名,在界面xml文件中有配置, 这里也可以是客户端映射指定的自定义command
-- @see uiman_type
function SendDlgCommand(uiman_id, panel_name, item_name)
end


--- 临时快捷栏显示物品
-- @param itemId 物品id, 该物品必须在背包中 
function ShowItemTempShortcut(itemId)
end


--- 临时快捷栏显示技能
-- @param skillId 技能id, 该技能必须玩家能够使用
--[params] 技能id
--[return] 无 
function ShowSkillTempShortcut(skillId)
end


--- 返回物品在快捷栏中的所有的控件
-- @param itemId 物品id
-- @return table, 指定物品在快捷栏对应的所有控件列表, 格式为,<pre>
-- 	{
--		{dialog = panel_name, control = obj_name},
--		{dialog = panel_name, control = obj_name},
--		 .....
--	} 
-- </pre>
function GetItemQuickImages(itemId)
end


--- 返回技能在快捷栏中的所有的控件
-- @param skillId 技能id
-- @return table, 指定技能在快捷栏对应的所有控件列表, 格式为,<pre>
-- 	{
--		{dialog = panel_name, control = obj_name},
--		{dialog = panel_name, control = obj_name},
--		 .....
--	} 
-- </pre>
function GetSkillQuickImages(skillId)
end


--- 显示任务对话栏主角头像
-- @param bShow 是否显示任务对话栏主角头像
function ShowQuestPortrait(bShow)
end


--- 在聊天框输出文字
-- @param str 需要显示文字
function AddChatMsg(str)
end


--- 设置文字控件能够显示surfaces\iconsets目录下的图标
-- @param panel_name 界面标示名,在界面xml文件中有配置
-- @param item_name 控件标示名,在界面xml文件中有配置
function SetItemImageList(panel_name, item_name)
end


--- 设置指定Image控件数据为指定的数据
-- @param panel_name 界面标示名,在界面xml文件中有配置
-- @param item_name 控件标示名,在界面xml文件中有配置
-- @param itemInfo 要设置的数据
-- @usage itemInfo类型为数字, 标示物品id, 设置显示该物品图标; 类型为字符串,标示为图标路径,设置控件显示该图
function ItemShowIvtrIcon(panel_name, item_name, itemInfo)
end


--- 清除指定Image控件的所有数据和属性
-- @param panel_name 界面标示名,在界面xml文件中有配置
-- @param item_name 控件标示名,在界面xml文件中有配置
function ItemClearIcon(panel_name, item_name)
end


--- 用于在对话框事件处理中，将事件交给另一控件处理, 慎用
-- @param panel_name 界面标示名,在界面xml文件中有配置
-- @param item_name 控件标示名,在界面xml文件中有配置
-- @param msg 消息类型
-- @param ... 消息数据
function ItemDealMessage(panel_name, item_name, msg, ...)
end


--- 获取命令行控件中,玩家输入的字符
-- @param panel_name 界面标示名,在界面xml文件中有配置
-- @param item_name 控件标示名,在界面xml文件中有配置
-- @return string,控件中输入的调试命令
function GetConsoleLine(panel_name, item_name)
end


--- 使用动画世界的界面UI
-- @param bUse 是否使用
function UseAnimationUI(bUse)
end


--- 获取当前游戏画面遮罩的透明度
-- @return 透明度[0, 255]
function GetUIMaskAlpha()
end


--- 设置当前游戏画面遮罩的透明度
-- @param alpha 透明度[0, 255]
function SetUIMaskAlpha(alpha)
end


--- 获取指定窗口Frame的透明度
-- @param panel_name 界面标示名,在界面xml文件中有配置
function GetDialogAlpha(panel_name)
end


--- 获取指定窗口整体的透明度
-- @param panel_name 界面标示名,在界面xml文件中有配置
function GetDialogWholeAlpha(panel_name)
end


--- 播放指定id的动画
-- @param id 动画id
-- @param func 动画播放完成之后的回调函数
function LoadAnimation(id, func)
end

