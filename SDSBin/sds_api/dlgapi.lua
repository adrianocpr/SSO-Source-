---------------------------------------------------------------
--	所有关于界面操作的接口
--  @author chenfudun
---------------------------------------------------------------

--- AUI库提供给脚本的接口,主要为游戏逻辑相关接口
module("DlgApi")

-------------------------------------------------------------------------------
-- 对话框位置排列类型
-- @class table
-- @name align_type
-- @field AUIDIALOG_ALIGN_NONE 		0, 无效/未设置
-- @field AUIDIALOG_ALIGN_INSIDE	1, 内部
-- @field AUIDIALOG_ALIGN_OUTSIDE	2，外部
-- @field AUIDIALOG_ALIGN_LEFT		3，左边
-- @field AUIDIALOG_ALIGN_RIGHT		4，右边
-- @field AUIDIALOG_ALIGN_TOP		5，上边
-- @field AUIDIALOG_ALIGN_BOTTOM	6，下边
-- @field AUIDIALOG_ALIGN_CENTER	7，中间
local align_type = 
{
	AUIDIALOG_ALIGN_NONE,
	AUIDIALOG_ALIGN_INSIDE,
	AUIDIALOG_ALIGN_OUTSIDE,
	AUIDIALOG_ALIGN_LEFT,
	AUIDIALOG_ALIGN_RIGHT,
	AUIDIALOG_ALIGN_TOP,
	AUIDIALOG_ALIGN_BOTTOM,
	AUIDIALOG_ALIGN_CENTER
}
-------------------------------------------------------------------------------
-- 界面属性类型
-- @class table
-- @name property_type
-- @field	AUIOBJECT_PROPERTY_ALIGN           		0  
-- @field	AUIOBJECT_PROPERTY_ALIGNY          		1  
-- @field	AUIOBJECT_PROPERTY_FRAMEMODE       		2  
-- @field	AUIOBJECT_PROPERTY_UNDERLINEMODE   		3  
-- @field	AUIOBJECT_PROPERTY_ENUMMAX         		4  
-- @field	AUIOBJECT_PROPERTY_INT             		5  
-- @field	AUIOBJECT_PROPERTY_BOOL            		6  
-- @field	AUIOBJECT_PROPERTY_FLOAT           		7  
-- @field	AUIOBJECT_PROPERTY_COLOR           		8  
-- @field	AUIOBJECT_PROPERTY_FONT            		9  
-- @field	AUIOBJECT_PROPERTY_CHAR            		10  
-- @field	AUIOBJECT_PROPERTY_STRING          		11  
-- @field	AUIOBJECT_PROPERTY_COMMAND         		12 
-- @field	AUIOBJECT_PROPERTY_FILENAME        		13  
-- @field	AUIOBJECT_PROPERTY_INTERFACE_FILENAME	14
-- @field	AUIOBJECT_PROPERTY_SURFACE_FILENAME  	15
-- @field	AUIOBJECT_PROPERTY_GFX_FILENAME      	16
-- @field	AUIOBJECT_PROPERTY_SFX_FILENAME      	17
-- @field	AUIOBJECT_PROPERTY_AUDIOEVENT			18
local property_type =
{
	AUIOBJECT_PROPERTY_ALIGN,
	AUIOBJECT_PROPERTY_ALIGNY,
	AUIOBJECT_PROPERTY_FRAMEMODE,
	AUIOBJECT_PROPERTY_UNDERLINEMODE,
	AUIOBJECT_PROPERTY_ENUMMAX,
	AUIOBJECT_PROPERTY_INT,
	AUIOBJECT_PROPERTY_BOOL,
	AUIOBJECT_PROPERTY_FLOAT,
	AUIOBJECT_PROPERTY_COLOR,
	AUIOBJECT_PROPERTY_FONT,
	AUIOBJECT_PROPERTY_CHAR,
	AUIOBJECT_PROPERTY_STRING,
	AUIOBJECT_PROPERTY_COMMAND,
	AUIOBJECT_PROPERTY_FILENAME,
	AUIOBJECT_PROPERTY_INTERFACE_FILENAME,
	AUIOBJECT_PROPERTY_SURFACE_FILENAME,
	AUIOBJECT_PROPERTY_GFX_FILENAME,
	AUIOBJECT_PROPERTY_SFX_FILENAME,
	AUIOBJECT_PROPERTY_AUDIOEVENT,
}

-------------------------------------------------------------------------------
-- 界面属性名称
-- @class table
-- @name property_name
-- @field 	Name	          			"Name"          							
-- @field 	X	                   		"X"                   				
-- @field 	Y	          				"Y"          									
-- @field 	Width	          			"Width"          							
-- @field 	Height	          			"Height"          						
-- @field 	Hint	          			"Hint"          							
-- @field 	Template	          		"Template"          					
-- @field 	Anomaly	          			"Anomaly"          						
-- @field 	SoundEffect	         		"Sound Effect"         				
-- @field 	HoverSoundEffect	        "Hover Sound Effect"          
-- @field 	VerticalText	          	"Vertical Text"          			
-- @field 	Align	          			"Align"          							
-- @field	TextColor	          		"Text Color"          				
-- @field	CheckColor	          		"Check Color"          				
-- @field	TextCheckColor	         	"Text Check Color"          	
-- @field	NormalImageFile	         	"Normal Image File"          	
-- @field	CheckedImageFile	        "Checked Image File"          
-- @field	OnHoverImageFile	        "OnHover Image File"          
-- @field	CheckedOnHoverImageFile	 	"CheckedOnHover Image File"   
-- @field	TextOffsetX	          	 	"Text Offset X"          			
-- @field	TextOffsetY	          	 	"Text Offset Y"          			
-- @field	FramePushedImage	        "Frame Pushed Image"          
-- @field	HilightImage	          	"Hilight Image"          			
-- @field	ListBoxName	          	 	"List Box Name"          			
-- @field	ObjectType	          		"Object Type"          				
-- @field	IsPassword	          		"Is Password"          				
-- @field	IsReadOnly	          		"Is ReadOnly"          				
-- @field	IsNumberOnly	          	"Is Number Only"          		
-- @field	IsMultipleLine	         	"Is Multiple Line"          	
-- @field	IsAutoReturn	          	"Is Auto Return"          		
-- @field	UpButtonImage	            "Up Button Image"             
-- @field	DownButtonImage	         	"Down Button Image"           
-- @field	MaxTextLength	            "Max Text Length"             
-- @field	EnableSelection	         	"Enable Selection"            
-- @field	SelectionBackgroundColor	"Selection Background Color"  
-- @field	TextAlign	          		"Text Align"          				
-- @field	ImageFile	             	"Image File"             			
-- @field	ImageDegree	             	"Image Degree"            		
-- @field	GfxFile	             	 	"Gfx File"             				
-- @field	ClockFile	             	"Clock File"             			
-- @field	FramesNumber	            "Frames Number"             	
-- @field	FrameInterval	            "Frame Interval"             	
-- @field	RenderTop	             	"Render Top"             			
-- @field	ForceDynamicRender	     	"Force Dynamic Render"        
-- @field	AutoWrap	             	"Auto Wrap"             			
-- @field	HorizontalScroll	        "Horizontal Scroll"           
-- @field	TextAlign	             	"Text Align"             			
-- @field	HoverHilight	            "Hover Hilight"             	
-- @field	HilightImage	            "Hilight Image"             	
-- @field	ItemImage	             	"Item Image"             			
-- @field	MultipleSelection	        "Multiple Selection"          
-- @field	ModelFile	             	"Model File"             			
-- @field	BackgroundColor	         	"Background Color"            
-- @field	FillImageFile	            "Fill Image File"             
-- @field	PosImageFile	            "Pos Image File"             	
-- @field	PosBgImageFile	         	"Pos Bg Image File"           
-- @field	IncImageFile	            "Inc Image File"             	
-- @field	DecImageFile	            "Dec Image File"             	
-- @field	VerticalProgress	        "Vertical Progress"           
-- @field	ReverseDirection	        "Reverse Direction"           
-- @field	FillMarginLeft	         	"Fill Margin Left"            
-- @field	FillMarginTop	            "Fill Margin Top"             
-- @field	FillMarginRight	         	"Fill Margin Right"           
-- @field	FillMarginBottom	        "Fill Margin Bottom"          
-- @field	GroupID	             	 	"Group ID"             				
-- @field	ButtonID	             	"Button ID"             			
-- @field	BarImageFile	            "Bar Image File"             	
-- @field	TotalLevels	             	"Total Levels"             		
-- @field	VerticalSlider	            "Vertical Slider"             
-- @field	HoverColor	             	"Hover Color"             		
-- @field	TextHoverColor	         	"Text Hover Color"            
-- @field	DisabledFrameFile	        "Disabled Frame File"         
-- @field	DownGfxFile	             	"Down Gfx File"             	
-- @field	OnHoverGfxFile	         	"OnHover Gfx File"            
-- @field	DialogFile	             	"Dialog File"             		
-- @field	EnableDialogFrame	        "Enable Dialog Frame"         
-- @field	VScrollAreaImage	        "VScroll Area Image"          
-- @field	VScrollBarImage	         	"VScroll Bar Image"           
-- @field	HScrollAreaImage	        "HScroll Area Image"          
-- @field	HScrollBarImage	         	"HScroll Bar Image"           
-- @field	LeftScrollBar	            "Left Scroll Bar"             
-- @field	TextTransparent	         	"Text Transparent"            
-- @field	TransScrollWheel	        "Trans Scroll Wheel"          
-- @field	LinkUnderlineMode	        "Link Underline Mode"         
-- @field	LinkUnderlineColor	     	"Link Underline Color"        
-- @field	LongHilightBar	         	"Long Hilight Bar"            
-- @field	PlusSymbolImage	         	"Plus Symbol Image"           
-- @field	MinusSymbolImage	        "Minus Symbol Image"          
-- @field	LeafSymbolImage	         	"Leaf Symbol Image"           
-- @field	LeafCheckSymbolImage	    "Leaf Check Symbol Image"     
-- @field	TextIndent	             	"Text Indent"             		
-- @field	TextContent	             	"Text Content"             		
-- @field	TextColor	             	"Text Color"             			
-- @field	Font	             		"Font"             						
-- @field	Shadow	             		"Shadow"             					
-- @field	FreeType	             	"FreeType"             				
-- @field	Outline	             		"Outline"             				
-- @field	OutlineColor	            "Outline Color"             	
-- @field	InnerTextColor	         	"Inner Text Color"            
-- @field	FadeColor	             	"Fade Color"             			
-- @field	TextUpperColor	         	"Text Upper Color"            
-- @field	TextLowerColor	         	"Text Lower Color"            
-- @field	FrameMode	             	"Frame Mode"             			
-- @field	FrameImage	             	"Frame Image"             		
-- @field	LeftButtonImage	         	"Left Button Image"           
-- @field	RightButtonImage	        "Right Button Image"          
-- @field	ScrollAreaImage	         	"Scroll Area Image"           
-- @field	ScrollBarImage	         	"Scroll Bar Image"            
-- @field	LeftToRight	             	"Left To Right"             	
-- @field	UpScrollBar	             	"Up Scroll Bar"             	
-- @field	LineSpace	             	"Line Space"             			
-- @field	DrawExternal	            "Draw External"
local property_name = 
{
	Name,	          					
	X,	                   			
	Y,	          							
	Width,	          					
	Height,	          				
	Hint,	          					
	Template,	          			
	Anomaly,	          				
	SoundEffect,
	HoverSoundEffect,	      
	VerticalText,	          	
	Align,	          					
	TextColor,	          		
	CheckColor,	          		
	TextCheckColor,	        
	NormalImageFile,	        
	CheckedImageFile,	      
	OnHoverImageFile,	      
	CheckedOnHoverImageFile,	
	TextOffsetX,	          	
	TextOffsetY,	          	
	FramePushedImage,	      
	HilightImage,	          	
	ListBoxName,	          	
	ObjectType,	          		
	IsPassword,	          		
	IsReadOnly,	          		
	IsNumberOnly,	          
	IsMultipleLine,	        
	IsAutoReturn,	          
	UpButtonImage,	          
	DownButtonImage,	        
	MaxTextLength,	          
	EnableSelection,	        
	SelectionBackgroundColor,
	TextAlign,	          		
	ImageFile,	             	
	ImageDegree,	            
	GfxFile,	             		
	ClockFile,	             	
	FramesNumber,	            
	FrameInterval,	          
	RenderTop,	             	
	ForceDynamicRender,	    
	AutoWrap,	             		
	HorizontalScroll,	        
	TextAlign,	             	
	HoverHilight,	            
	HilightImage,	            
	ItemImage,	             	
	MultipleSelection,	      
	ModelFile,	             	
	BackgroundColor,	        
	FillImageFile,	          
	PosImageFile,	          
	PosBgImageFile,	        
	IncImageFile,	          
	DecImageFile,	          
	VerticalProgress,	        
	ReverseDirection,	        
	FillMarginLeft,	        
	FillMarginTop,	          
	FillMarginRight,	        
	FillMarginBottom,	      
	GroupID,	             		
	ButtonID,	             		
	BarImageFile,	          
	TotalLevels,	            
	VerticalSlider,	          
	HoverColor,	             	
	TextHoverColor,	        
	DisabledFrameFile,	      
	DownGfxFile,	            
	OnHoverGfxFile,	        
	DialogFile,	             	
	EnableDialogFrame,      
	VScrollAreaImage,	      
	VScrollBarImage,	        
	HScrollAreaImage,	      
	HScrollBarImage,	        
	LeftScrollBar,	          
	TextTransparent,	        
	TransScrollWheel,	      
	LinkUnderlineMode,	      
	LinkUnderlineColor,	    
	LongHilightBar,	        
	PlusSymbolImage,	        
	MinusSymbolImage,	      
	LeafSymbolImage,	        
	LeafCheckSymbolImage,	  
	TextIndent,	             	
	TextContent,	            
	TextColor,	             	
	Font,	             				
	Shadow,	             			
	FreeType,	             		
	Outline,	             			
	OutlineColor,	            
	InnerTextColor,	        
	FadeColor,	             	
	TextUpperColor,	        
	TextLowerColor,	        
	FrameMode,	             	
	FrameImage,	             	
	LeftButtonImage,	        
	RightButtonImage,	      
	ScrollAreaImage,	        
	ScrollBarImage,	        
	LeftToRight,	            
	UpScrollBar,	            
	LineSpace,	             	
	DrawExternal,	         		
}

-------------------------------------------------------------------------------
--- 字体类型
-- @class table
-- @name font_type
-- @field font_name 字体名称
-- @field nHeight	字体高度
-- @field bBold		是否粗体
-- @field bItalic 	是否斜体
local font_type = 
{
	font_name="string",
	nHeight	 ="int",
	bBold	 ="bool", 
	bItalic  = "bool"
}

-------------------------------------------------------------------------------
-- 编辑框控件类型
-- @class table
-- @name editbox_item_type
-- @field enumEIEmotion		表情
-- @field enumEIIvtrlItem	物品
-- @field enumEICoord		坐标
-- @field enumEIImage		图片
-- @field enumEIScriptItem	脚本
-- @field enumEIBox			Box
-- @field enumEITask		任务
-- @field enumEICustom		自定义
-- @field enumEINum			枚举数量
local editbox_item_type = 
{
	enumEIEmotion,
	enumEIIvtrlItem,
	enumEICoord,
	enumEIImage,
	enumEIScriptItem,
	enumEIBox,
	enumEITask,
	enumEICustom,
	enumEINum
}

-------------------------------------------------------------------------------
-- 消息对话框类型
-- @class table
-- @name msgbox_type
-- @field MB_NULL		0
-- @field MB_OK			1
-- @field MB_OKCANCEL	2
-- @field MB_YESNO		3
local msgbox_type = 
{
MB_NULL,
MB_OK,
MB_OKCANCEL,
MB_YESNO
}

-------------------------------------------------------------------------------
--- 控件类型
-- @class table
-- @name auiObject_type
-- @field AUIOBJECT_TYPE_NULL			0, 无效/未设置/初始值
-- @field AUIOBJECT_TYPE_MIN 			1
-- @field AUIOBJECT_TYPE_CHECKBOX 		2，选择框
-- @field AUIOBJECT_TYPE_COMBOBOX 		3，组合框
-- @field AUIOBJECT_TYPE_CONSOLE 		4，控制台
-- @field AUIOBJECT_TYPE_CUSTOMIZE 		5
-- @field AUIOBJECT_TYPE_EDITBOX		6，编辑框
-- @field AUIOBJECT_TYPE_IMAGEPICTURE 	7，图片
-- @field AUIOBJECT_TYPE_LABEL 			8，标签
-- @field AUIOBJECT_TYPE_LISTBOX		9，下拉列表框
-- @field AUIOBJECT_TYPE_MODELPICTURE	10
-- @field AUIOBJECT_TYPE_PROGRESS		11，进度条
-- @field AUIOBJECT_TYPE_RADIOBUTTON	12，单选按钮
-- @field AUIOBJECT_TYPE_SCROLL			13，滚动条
-- @field AUIOBJECT_TYPE_SLIDER			14，滑动条
-- @field AUIOBJECT_TYPE_STILLIMAGEBUTTON	15，普通按钮
-- @field AUIOBJECT_TYPE_SUBDIALOG			16，子对话框
-- @field AUIOBJECT_TYPE_TEXTAREA 			17，文本区域
-- @field AUIOBJECT_TYPE_TREEVIEW			18，树形列表		
-- @field AUIOBJECT_TYPE_VERTICALTEXT		19
-- @field AUIOBJECT_TYPE_WINDOWPICTURE		20
-- @field AUIOBJECT_TYPE_MAX				21
local auiObject_type = 
{
	AUIOBJECT_TYPE_NULL,
	AUIOBJECT_TYPE_MIN,
	AUIOBJECT_TYPE_CHECKBOX,
	AUIOBJECT_TYPE_COMBOBOX,
	AUIOBJECT_TYPE_CONSOLE,
	AUIOBJECT_TYPE_CUSTOMIZE,
	AUIOBJECT_TYPE_EDITBOX,
	AUIOBJECT_TYPE_IMAGEPICTURE,
	AUIOBJECT_TYPE_LABEL,
	AUIOBJECT_TYPE_LISTBOX,
	AUIOBJECT_TYPE_MODELPICTURE,
	AUIOBJECT_TYPE_PROGRESS,
	AUIOBJECT_TYPE_RADIOBUTTON,
	AUIOBJECT_TYPE_SCROLL,
	AUIOBJECT_TYPE_SLIDER,
	AUIOBJECT_TYPE_STILLIMAGEBUTTON,
	AUIOBJECT_TYPE_SUBDIALOG,
	AUIOBJECT_TYPE_TEXTAREA,
	AUIOBJECT_TYPE_TREEVIEW,
	AUIOBJECT_TYPE_VERTICALTEXT,
	AUIOBJECT_TYPE_WINDOWPICTURE,
	AUIOBJECT_TYPE_MAX
}

-------------------------------------------------------------------------------
---	界面属性值对应的类型
-- @class table
-- @name property_value_type
-- @field AUIOBJECT_PROPERTY_ALIGN				"int"
-- @field AUIOBJECT_PROPERTY_ALIGNY			 	"int"
-- @field AUIOBJECT_PROPERTY_FRAMEMODE		 	"int"
-- @field AUIOBJECT_PROPERTY_UNDERLINEMODE	 	"int"
-- @field AUIOBJECT_PROPERTY_INT			 	"int"
-- @field AUIOBJECT_PROPERTY_COLOR			 	"int"
-- @field AUIOBJECT_PROPERTY_BOOL			 	"bool"
-- @field AUIOBJECT_PROPERTY_FLOAT			 	"double"
-- @field AUIOBJECT_PROPERTY_FONT			 	"font_type"
-- @field AUIOBJECT_PROPERTY_STRING			 	"string"
-- @field AUIOBJECT_PROPERTY_CHAR			 	"string"
-- @field AUIOBJECT_PROPERTY_COMMAND		 	"string"
-- @field AUIOBJECT_PROPERTY_FILENAME		 	"string"
-- @field AUIOBJECT_PROPERTY_GFX_FILENAME	 	"string"
-- @field AUIOBJECT_PROPERTY_SFX_FILENAME	  	"string"
-- @field AUIOBJECT_PROPERTY_SURFACE_FILENAME  	"string"	
-- @field AUIOBJECT_PROPERTY_INTERFACE_FILENAME	"string"
local property_value_type = {
	AUIOBJECT_PROPERTY_ALIGN			= "int",
	AUIOBJECT_PROPERTY_ALIGNY			= "int",
	AUIOBJECT_PROPERTY_FRAMEMODE		= "int",
	AUIOBJECT_PROPERTY_UNDERLINEMODE	= "int",
	AUIOBJECT_PROPERTY_INT				= "int",
	AUIOBJECT_PROPERTY_COLOR			= "int",
	AUIOBJECT_PROPERTY_BOOL				= "bool",
	AUIOBJECT_PROPERTY_FLOAT			= "double",
	AUIOBJECT_PROPERTY_FONT				= "font_type",
	AUIOBJECT_PROPERTY_STRING			= "string",
	AUIOBJECT_PROPERTY_CHAR				= "string",
	AUIOBJECT_PROPERTY_COMMAND			= "string",
	AUIOBJECT_PROPERTY_FILENAME			= "string",
	AUIOBJECT_PROPERTY_GFX_FILENAME		= "string",
	AUIOBJECT_PROPERTY_SFX_FILENAME		= "string",
	AUIOBJECT_PROPERTY_SURFACE_FILENAME	= "string",	
	AUIOBJECT_PROPERTY_INTERFACE_FILENAME	= "string",
}

--- 弹出消息对话框
-- @param msgBox_type 消息对话框类型，见 msgbox_type
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param msg	  	  消息内容
-- @param color 	  字符颜色, 是一个32位的数值
-- @return            无
-- @usage  <pre><b> 第四个参数 color 是可选的，如果没有指定这个参数，那么默认值为白色，不透明度值为160</pre></b>
-- @see msgbox_type
function PopupMessageBox(msgBox_type, panel_name, msg, color)
end

--- 设置再生成消息标志
-- @param  无
-- @return 无 
-- @usage  <pre><b> 设置再生成消息标志之后，客户端会在原有消息处理流程之后再调用界面在脚本中的 OnEventMap 方法
--        来处理消息</pre></b>
function RespawnMessage()
end

--- 转换聊天消息字符串
-- @param text     聊天消息内容
-- @return string  转换之后的聊天消息内容
function ConvertChatString(text)
end

--- 获取游戏窗口缩放比例
-- @param         无
-- @return float,  窗口缩放比例
-- @usage         <pre><b> 如果游戏窗口的X方向和Y方向的缩放比例不一样，那么游戏窗口的缩放比例将取两个方向的缩放比例中
--		          的较小者。缩放比例的范围为[0.0，1.0]</pre></b> 
function GetWindowScale()
end

--- 获取游戏窗口区域
-- @param         无
-- @return table, 格式为：{ 左坐标, 上坐标, 右坐标, 下坐标 }
function GetWindowRect()
end

--- 获取当前输入法名称
-- @param          无
-- @return string, 当前输入法名称
function GetCurrentIMEName()
end

--- 设置对话框的状态
-- @param panel_name 对话框名称,对应界面xml文件中的 Name 字段
-- @param bShow    	 是否显示
-- @param bModal	 是否模态
-- @param bActive	 是否活跃
-- @return           无
-- @usage         <pre><b> 第三个参数 bModal 和第四个参数 bActive 都是可选的，二者的默认值分别是 false 和 true。如果
-- 未指定则设置时使用默认值。</pre></b> 
function ShowDialog(panel_name, bShow, bModal, bActive)
end

--- 判断对话框的显示状态
-- @param panel_name   对话框名称,对应界面xml文件中的 Name 字段
-- @return true/false, 是否显示
function IsDialogShow(panel_name)
end

--- 判断对话框的活跃状态
-- @param panel_name   对话框名称,对应界面xml文件中的 Name 字段
-- @@return true/false,是否活跃
function IsDialogActive(panel_name)
end

--- 设置对话框的 Enable 状态
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param bEnable     是否使能
-- @return 无
function EnableDialog(panel_name, bEnable)
end

--- 设置对话框相对于参考对话框的位置
-- @param p_n  对话框名称,对应界面xml文件中的 Name 字段
-- @param X  	  X方向的相对于参考对话框的偏移量
-- @param Y  	  Y方向的相对于参考对话框的偏移量
-- @param p_n_a   参考对话框名称,对应界面xml文件中的 Name 字段
-- @param nIX	  X方向的相对于参考对话框的内外排列类型：<small><b>AUIDIALOG_ALIGN_INSIDE/AUIDIALOG_ALIGN_OUTSIDE</small></b>
-- @param nAX	  X方向的相对于参考对话框的左右排列类型：<small><b>AUIDIALOG_ALIGN_LEFT/AUIDIALOG_ALIGN_RIGHT</small></b>
-- @param nIY	  Y方向的相对于参考对话框的内外排列类型：<small><b>AUIDIALOG_ALIGN_INSIDE/AUIDIALOG_ALIGN_OUTSIDE</small></b>
-- @param nAY	  Y方向的相对于参考对话框的内外排列类型：<small><b>AUIDIALOG_ALIGN_INSIDE/AUIDIALOG_ALIGN_OUTSIDE</small></b>
-- @return        无
-- @usage <pre><b> 第一、二、三个参数是必须的，其他参数都是可选的。如果可选参数中有任何一个参数为空，那么实际所
--用的参考对话框为游戏窗口，nIX，nAX，nIY，nAY 分别为：
--<center>AUIDIALOG_ALIGN_INSIDE，AUIDIALOG_ALIGN_LEFT，
--AUIDIALOG_ALIGN_INSIDE，AUIDIALOG_ALIGN_TOP</center></pre></b> 
-- @see	  align_type
function SetDialogPosition(p_n, X, Y, p_n_a, nIX, nAX, nIY, nAY)
end

--- 设置对话框大小
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param width		  宽度
-- @param height 	  高度
-- @return           无
function SetDialogSize(panel_name, width, height)
end

--- 设置对话框缩放比
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param scale	      缩放比例值, 范围[0.0, 1.0]
-- @return            无
-- @usage	<pre><b> 缩放比例值默认为 1.0。对话框显示时的实际缩放比例由 scale 和游戏窗口的缩放比例的乘积共同决定</pre></b> 
-- @see     GetWindowScale
function SetDialogScale(panel_name, scale)
end

--- 设置对话框的不透明度
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param alpha		  不透明度值, 范围[0, 255]
-- @return 无
-- @usage	<pre><b>不透明度值默认为 255。对话框绘制时的不透明度的计算方法为：
--			<center>绘制不透明度值 = 不透明度值 x 总体不透明度值 / 255 </center>
--总体不透明度值为当前对话框的父对话框的不透明度值, 具体见 SetDialogWholeAlpha</pre></b> 
-- @see SetDialogWholeAlpha
function SetDialogAlpha(panel_name, alpha)
end

--- 设置对话框的总体不透明度
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param wholeAlpha  总体不透明度值, 范围[0, 255]
-- @return 无
-- @usage	<pre><b> 总体不透明度值默认为 255。对话框的总体不透明度会影响其上的所有控件的绘制不透明度</pre></b>
function SetDialogWholeAlpha(panel_name, wholeAlpha)
end

--- 设置对话框的 Frame Image
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param frame_name  对话框的 Frame Image 名称
-- @return 无	
function SetDialogFrame(panel_name, frame_name)
end

--- 设置对话框的定时器的启动状态
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param bTimer   	  是否启动定时器
-- @return 无
-- @usage <pre><b> 如果开启定时器，那么该对话框界面在脚本中的 OnTimer 方法将会被调用</pre></b> 
function SetDialogTimer(panel_name, bTimer)
end

--- 设置对话框属性
-- @param panel_name      对话框名称,对应界面xml文件中的 Name 字段
-- @param property_table  对话框属性，格式为:{ "canmove" = 是否可以移动标志，"canoutofwindow" = 是否可以移出
--						  父窗口之外标志 }
-- @return 无
-- @usage <pre><b> 对话框属性中前后两项的顺序可以颠倒，也可以只包含其中的一项；如果两项都没有，那么设置失败</pre></b> 
function SetDialogProp(panel_name, property_table)
end

--- 获取对话框属性
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @return table：格式为:{ X坐标，Y坐标，宽，高，是否可以移动标志，是否可以移出父窗口之外标志 }
function GetDialogProp(panel_name)
end

--- 获取鼠标击中的界面名称
-- @param x	X坐标
-- @param y Y坐标
-- @return table：格式为{ 对话框名，控件名 }
-- @usage <pre><b> 返回值中如果对话框名不存在，那么控件名也不存在。x, y 两个参数是可选的。如果不指定两个参数, 
--那么将返回鼠标当前位置所在处的对话框名和控件名；否则返回参数对应处的对话框名和控件名</pre></b> 
function GetHitItem()
end

--- 获取文本区控件上指定位置的链接名称
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_TEXTAREA </small></b>, 见<small><b> auiObject_type </small></b>
-- @param x			  X坐标
-- @param y			  Y坐标
-- @return string,    链接名称
-- @see auiObject_type
function GetNameLink(panel_name, item_name, x, y)
end

--- 获取文本区控件的行信息
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_TEXTAREA </small></b>, 见<small><b> auiObject_type </small></b>
-- @return table,     格式为:{ 总行数，每页行数，首行字符数 }
-- @see auiObject_type
function GetTextAreaLineInfo(panel_name, item_name)
end

--- 设置指定控件获得焦点
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段
-- @return 无
function ChangeFocus(panel_name, item_name)
end

--- 设置控件的显示状态
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段
-- @param bShow       是否显示
-- @return 无
function ShowItem(panel_name, item_name, bShow)
end

--- 判断指定控件是否显示
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段
-- @return true/false, 是否显示	
function IsItemShow(panel_name, item_name)
end

--- 设置控件的位置
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段
-- @param x 		  X坐标
-- @param y 		  Y坐标
-- @return 无	
function SetItemPos(panel_name, item_name, x, y)
end

--- 设置控件的大小
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段
-- @param width 	  宽
-- @param height 	  高
-- @return 无	
function SetItemSize(panel_name, item_name, width, height)
end

--- 获取控件的区域
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段
-- @return table, 格式为: { 左坐标，上坐标，控件宽，控件高 }
function GetItemRect(panel_name, item_name)
end

--- 设置控件的 Enable 状态
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段
-- @param bEnable, 是否 Enable
-- @return 无
function EnableItem(panel_name, item_name, bEnable)
end

--- 判断控件是否 Enable
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段
-- @return true/false,是否 Enable
function IsItemEnabled(panel_name, item_name)
end

--- 设置控件的内容
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段
-- @param item_text   控件内容
-- @return 无
function SetItemText(panel_name, item_name, item_text)
end

--- 获取控件内容
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段
-- @return string,	  控件内容
function GetItemText(panel_name, item_name)
end

--- 添加新内容到控件中
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段
-- @param item_text   内容
-- @return 无
function AppendItemText(panel_name, item_name, item_text)
end

--- 添加表情到编辑框控件中
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_TEXTAREA, AUIOBJECT_TYPE_LABEL </small></b>, 见<small><b> auiObject_type </small></b>
-- @param nSet 		  玩家装备的表情包ID
-- @param nIndex 	  表情在表情包中的ID
-- @param nMax 		  编辑框控件可以包含的最大表情数
-- @return 无
-- @see auiObject_type
function AppendEmotion(panel_name, item_name, nSet, nIndex, nMax)
end

--- 序列化编辑框控件的链接坐标内容
-- @param item_text 链接显示文本
-- @param red 		红色分量值, 范围[0, 255]
-- @param green 	绿色分量值, 范围[0, 255]
-- @param blue		蓝色分量值, 范围[0, 255]
-- @param alpha		不透明度值, 范围[0, 255]
-- @param item_info 链接对应的格式化后的坐标文本，格式为：{ x坐标，y坐标，z坐标，地图号 }
-- @return string, 序列化之后的链接坐标内容
function SerializeItemText(item_text, red, green, blue, alpha, item_info)
end

--- 过滤字符串中的表情为指定表情包中的对应位置的表情
-- @param org_text  原始字符串
-- @param nSet 		指定表情包ID
-- @return string,  过滤之后的字符串
function FilterEmotionSet(org_text, nSet)
end

--- 设置控件掩码
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_TEXTAREA, AUIOBJECT_TYPE_LABEL </small></b>, 见<small><b> auiObject_type</small></b>
-- @param iMask		  控件掩码，见<small><b> editbox_item_type </small></b>
-- @return 		      无
-- @usage <pre><b> 设置了掩码的文本区域和标签控件将只显示掩码对应的内容</b></pre>
-- @see auiObject_type
-- @see editbox_item_type
function SetItemMask(panel_name, item_name, iMask)
end

--- 设置文本区控件是否只显示文本
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_TEXTAREA </small></b>, 见<small><b> auiObject_type </small></b>
-- @param bShow		  是否显示
-- @return            无
-- @see auiObject_type
function SetOnlyShowText(panel_name, item_name, bShow)
end

--- 滚动文本区滚动条控件到文本区首行
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_TEXTAREA </small></b>, 见<small><b> auiObject_type </small></b>
-- @return 			  无
-- @see auiObject_type
function ScrollToTop(panel_name, item_name)
end

--- 滚动文本区滚动条控件到文本区末行
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_TEXTAREA </small></b>, 见<small><b> auiObject_type </small></b>
-- @return 			  无
-- @see auiObject_type
function ScrollToBottom(panel_name, item_name)
end

--- 设置编辑框控件的只读状态
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_EDITBOX </small></b>, 见<small><b> auiObject_type </small></b>
-- @param bReadOnly	  是否只读
-- @return 			  无
-- @see auiObject_type
function SetReadOnly(panel_name, item_name, bReadOnly)
end

--- 设置控件颜色
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段
-- @param red 	红色分量值, 范围[0, 255]
-- @param green 绿色分量值, 范围[0, 255]
-- @param blue	蓝色分量值, 范围[0, 255]
-- @param alpha	不透明度值, 范围[0, 255]
-- @return 		无
-- @usage	<pre><b> 控件的颜色默认为白色，不透明度值默认为 255</pre></b> 
function SetItemColor(panel_name, item_name, red, green, blue, alpha)
end

--- 设置控件的不透明度
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段
-- @param alpha		  不透明度值，范围[0, 255]
-- @return 			  无
-- @usage	<pre><b> 控件的不透明度值默认为 255。控件绘制时的不透明度值会受到其所在对话框的总体不透明度的
--影响，具体计算方法为：
--          <center>绘制不透明度值 = 不透明度值 x 父对话框的总体不透明度值 / 255  </center></pre></b> 
-- @see SetDialogWholeAlpha
function SetItemAlpha(panel_name, item_name, alpha)
end

--- 设置控件悬浮提示
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段
-- @param item_hint	  悬浮提示内容
-- @return 			  无
function SetItemHint(panel_name, item_name, item_hint)
end

--- 设置控件闪烁状态
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段
-- @param bFlash	  是否闪烁
-- @return 			  无
function FlashItem(panel_name, item_name, bFlash)
end
    
--- 设置控件对应的表情包ID
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_LABEL, AUIOBJECT_TYPE_EDITBOX</small></b>, 见<small><b> auiObject_type</small></b>
-- @param nSet		  表情包ID
-- @return 			  无
-- @see auiObject_type
function SetEmotionSet(panel_name, item_name, nSet)
end

--- 设置标签控件滚动信息
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_LABEL </small></b>, 见<small><b> auiObject_type </small></b>
-- @param bMarq	  	  标签控件是否滚动
-- @param nTim	  	  滚动次数
-- @param nSpd	  	  滚动速度
-- @return 			  无
-- @see auiObject_type
function SetMarquee(panel_name, item_name, bMarq, nTim, nSpd)
end

--- 判断标签控件是否滚动
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_LABEL </small></b>, 见<small><b> auiObject_type </small></b>
-- @return true/false, 标签是否滚动 
-- @see auiObject_type
function IsMarquee(panel_name, item_name)
end

--- 设置进度条控件的进度值
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_PROGRESS </small></b>, 见<small><b> auiObject_type </small></b>
-- @param pos 		  进度值，范围[0, 1]
-- @return 			  无 
function SetProgress(panel_name, item_name, pos)
end

--- 设置自动进度条控件
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_PROGRESS </small></b>, 见<small><b> auiObject_type </small></b>
-- @param msecs 	  进度条持续时间
-- @param stV	 	  进度条开始值，范围[0, 1]
-- @param edV 		  进度条结束值，范围[0, 1]
-- @return            无 
-- @see auiObject_type
function SetAutoProgress(panel_name, item_name, msecs, stV, edV)
end

--- 设置动作进度条控件
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_PROGRESS </small></b>, 见<small><b> auiObject_type </small></b>
-- @param msecs 	  进度条持续时间
-- @param pos	 	  进度条开始值，范围[0, 1]
-- @return 			  无
-- @see auiObject_type
function SetActionProgress(panel_name, item_name, msecs, pos)
end

--- 获取玩家装备的表情包信息
-- @param 无
-- @return table, 格式为:{ 表情包套数，{ 表情包1的表情数，表情包2的表情数，...，表情包n的表情数 } }, 
--		   其中，n 为玩家装备的表情包套数
function GetEmotionsInfo()
end

--- 设置 Image Picture 控件的表情图片
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_IMAGEPICTURE</small></b>, 见<small><b> auiObject_type</small></b>
-- @param nSet		  表情包ID
-- @param nEmt		  表情包中的表情ID
-- @param bPly		  是否播放表情
-- @return 无
-- @usage	<pre><b> 如果表情有多帧且 bPly 为 true 时，将会播放表情动画；如果 nSet 和 nEmt 越界，那么设置失败</pre></b>
-- @see auiObject_type
function SetImageEmotion(panel_name, item_name, nSet, nEmt, bPly)
end

--- 设置 Image Picture 控件在对话框界面中是否绘制在顶层标志
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_IMAGEPICTURE</small></b>, 见<small><b> auiObject_type</small></b>
-- @param bRenderTop  是否绘制在顶层
-- @return 			  无
-- @usage  <pre><b> 对于对话框界面上有多个 Image Picture 控件位置重合或者交叉的情形，调用该方法并将 bRenderTop
--控件在用户交互设置为 true 可以保证顶层 Image Picture 控件被绘制在最上层，从而不会由于非顶 
--层的 Image Picture(如鼠标)获得焦点后将上层的 Image Picture 控件遮住</pre></b> 
-- @see auiObject_type
function SetImageRenderTop(panel_name, item_name, bRenderTop)
end

--- 设置控件的图像
-- @param panel_name    对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	    控件名称,对应界面xml文件中的 Name 字段,  类型必须是:
--					    <small><b> AUIOBJECT_TYPE_IMAGEPICTURE,AUIOBJECT_TYPE_STILLIMAGEBUTTON，
--					    AUIOBJECT_TYPE_CHECKBOX，AUIOBJECT_TYPE_RADIOBUTTON </small></b>, 见<small><b> auiObject_type </small></b>
-- @param img_name 		图像文件名称
-- @param frames 		图像在原始图像文件中的序号
-- @return true/false, 是否设置成功
-- @see auiObject_type
function SetImageFile(panel_name, item_name, img_name, frames)
end

--- 选择指定 Image Picture 控件中的图像
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_CHECKBOX</small></b>, 见<small><b> auiObject_type</small></b>
-- @param frames 	  图像在原始图像文件中的序号
-- @return 无
-- @usage  <pre><b> 对于图像文件中包含多幅子图像的情形，frames 为当前使用的图像序号，初始为 0；对于图像文件中
--只包含一副图像的情形，frames 为 0</pre></b> 
-- @see auiObject_type
function SelectImageFrame(panel_name, item_name, frames)
end

--- 设置复选框控件选中状态
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_CHECKBOX </small></b>, 见<small><b> auiObject_type </small></b>
-- @param bCheck 	  是否选中
-- @return 			  无
-- @see auiObject_type
function CheckItem(panel_name, item_name)
end

--- 判断复选框控件选中状态
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_CHECKBOX </small></b>, 见<small><b> auiObject_type </small></b>
-- @return true/false,控件是否选中
-- @usage <pre><b> 如果对话框控件中有复选框控件，那么返回其选中状态；否则返回 false</pre></b> 
-- @see auiObject_type
function IsItemChecked(panel_name, item_name)
end

--- 设置单选按钮控件选中状态
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param groupid	  单选按钮 Group ID，类型必须是<small><b> AUIOBJECT_TYPE_RADIOBUTTON</small></b>, 见<small><b> auiObject_type </small></b>
-- @param buttonid	  单选按钮 Button ID
-- @return 			  无
-- @see auiObject_type
function CheckRadioButton(panel_name, groupid, buttonid)
end

--- 获取指定 GroupID 的选中单选按钮控件的 Button ID
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param groupid	  单选按钮 Group ID，类型必须是<small><b> AUIOBJECT_TYPE_RADIOBUTTON </small></b>, 见<small><b> auiObject_type </small></b>
-- @return int,       单选按钮 Button ID
-- @usage <pre><b> 如果对话框控件中有单选按钮且单选按钮的 GroupID 与参数一致且该单选按钮处于选中状态，那么返回
--该按钮的 Button ID；否则返回 -1 </pre></b>
-- @see auiObject_type
function GetCheckedRadioButton(panel_name, groupid)
end

--- 判断按钮控件选中状态
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_STILLIMAGEBUTTON </small></b>, 见<small><b> auiObject_type </small></b>
-- @return bool,      按钮是否选中
-- @see auiObject_type
function IsButtonClicked(panel_name, item_name)
end

--- 删除下拉列表框或者组合框控件所有条目
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_LISTBOX, AUIOBJECT_TYPE_COMBOBOX </small></b>, 见<small><b> auiObject_type </small></b>
-- @return            无
-- @see auiObject_type
function DeleteListAllItems(panel_name, item_name)
end

--- 设置下拉列表框或者组合框控件所有条目文本
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_LISTBOX, AUIOBJECT_TYPE_COMBOBOX </small></b>, 见<small><b> auiObject_type </small></b>
-- @param text_array  文本条目序列
-- @return 			  无
-- @see auiObject_type
function SetListText(panel_name, item_name, text_array)
end

--- 获取下拉列表框或者组合框控件所有条目文本
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_LISTBOX, AUIOBJECT_TYPE_COMBOBOX </small></b>, 见<small><b> auiObject_type </small></b>	
-- @return table,     控件文本数组, 格式为:{第1行文本，第2行文本，...，第n行文本}，其中，n为控件所含条目总数
-- @see auiObject_type
function GetListText(panel_name, item_name)
end

--- 插入下拉列表框或者组合框控件指定条目文本
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_LISTBOX, AUIOBJECT_TYPE_COMBOBOX </small></b>, 见<small><b> auiObject_type </small></b>
-- @param nIndex  	  指定条目的行号
-- @param text  	  插入的文本
-- @return            无
-- @usage <pre><b> 如果 nIndex 越界，则插入失败 </pre></b> 
-- @see auiObject_type
function InsertListItem(panel_name, item_name, nIndex, text)
end

--- 删除下拉列表框或者组合框控件指定条目
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_LISTBOX, AUIOBJECT_TYPE_COMBOBOX </small></b>, 见<small><b> auiObject_type </small></b>
-- @param nIndex  	  指定条目的行号
-- @return            无
-- @usage <pre><b> 如果 nIndex 越界，则删除失败 </pre></b> 
-- @see auiObject_type
function DeleteListItem(panel_name, item_name, nIndex)
end

--- 设置下拉列表框或者组合框控件指定条目的文本
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_LISTBOX, AUIOBJECT_TYPE_COMBOBOX </small></b>, 见<small><b> auiObject_type </small></b>
-- @param nIndex  	  指定条目的行号
-- @param text  	  插入的内容
-- @return            无
-- @usage <pre><b> 如果 nIndex 越界(-1除外)，则设置失败；如果 nIndex 为 -1，则设置下拉列表框或者组合框控件的
--默认文本，否则设置指定条目文本 </pre></b>
-- @see auiObject_type
function SetListItemText(panel_name, item_name, nIndex, text)
end

--- 获取下拉列表框或者组合框控件指定条目的文本
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_LISTBOX, AUIOBJECT_TYPE_COMBOBOX </small></b>, 见<small><b> auiObject_type </small></b>
-- @param nIndex  	  指定条目的行号
-- @return string,    指定条目的文本
-- @usage <pre><b> 如果 nIndex 越界(-1除外)，则返回空字符串；如果 nIndex 为 -1，则返回下拉列表框或者组合框控
--件的默认文本，否则返回指定条目文本 </b></pre>
-- @see auiObject_type
function GetListItemText(panel_name, item_name, nIndex)
end

--- 设置下拉列表框或者组合框控件指定条目的悬浮提示
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_LISTBOX, AUIOBJECT_TYPE_COMBOBOX</small></b>, 见<small><b> auiObject_type</small></b>
-- @param nIndex  	  指定条目的行号
-- @param text  	  悬浮提示的内容
-- @return            无
-- @usage <pre><b>如果 nIndex 越界(-1除外)，则设置失败</b></pre>
-- @see auiObject_type
function SetListItemHint(panel_name, item_name, nIndex, text)
end

--- 获取下拉列表框或者组合框控件选中条目的行号
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_LISTBOX, AUIOBJECT_TYPE_COMBOBOX </small></b>, 见<small><b> auiObject_type </small></b>
-- @return double,    选中条目的行号
-- @see auiObject_type
function GetListCurLine(panel_name, item_name)
end

--- 设置下拉列表框或者组合框控件选中条目的行号
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_LISTBOX, AUIOBJECT_TYPE_COMBOBOX </small></b>, 见<small><b> auiObject_type </small></b>
-- @param nSel        选中条目的行号
-- @return            无
-- @see auiObject_type
function SetListCurLine(panel_name, item_name, nSel)
end

--- 设置组合框控件默认显示的文本
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_COMBOBOX </small></b>, 见<small><b> auiObject_type </small></b>
-- @param text        显示的文本
-- @return 			  无
-- @see auiObject_type
function SetComboDefaultText(panel_name, item_name, text)
end

--- 设置滑动条的范围
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_SLIDER </small></b>, 见<small><b> auiObject_type </small></b>
-- @param minlevel    最小值, 默认值为0
-- @param maxlevel    最大值, 默认值为100
-- @return            无
-- @usage	<pre><b> 最大值必须大于最小值且最小值要大于等于0。该操作将导致滑动条的当前位置被截取到本范围之间</b></pre>
-- @see auiObject_type
function SetSliderRange(panel_name, item_name, minlevel, maxlevel)
end

--- 设置滑动条的当前位置
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_SLIDER </small></b>, 见<small><b> auiObject_type </small></b>
-- @param pos  		  滑动条的位置
-- @return            无
-- @usage	<pre><b> 滑动条的位置会被截取到最小值和最大值之间 </pre></b>
-- @see auiObject_type
function SetSliderPos(panel_name, item_name, pos)
end

--- 获取滑动条的当前位置
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_SLIDER </small></b>, 见<small><b> auiObject_type </small></b>
-- @return double,    滑动条的当前位置
-- @see auiObject_type
function GetSliderPos(panel_name, item_name)
end

--- 设置滚动条的属性
-- @param panel_name         对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	         控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_SCROLL </small></b>, 见<small><b> auiObject_type </small></b>
-- @param property_map_array 属性名值数组
-- @return                   无
-- @usage	<pre><b> 属性名值数组，格式为:{ {属性名1，属性值1}，{属性名2，属性值2},..., {属性名n，属性值n} }, 
--其中，n <= 4,属性名只能是以下四种：
--<center>"max"(滚动条的最大值)，"pagelevel"(滚动条的长度), 
--"steplevel"(滚动条的步长), "zoomscroll"(滚动条的缩放标志)}</center></b></pre>
-- @see auiObject_type
function SetScrollProp(panel_name, item_name, property_map_array)
end

--- 设置滚动条的当前位置
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是:
--					  <small><b>AUIOBJECT_TYPE_SCROLL, AUIOBJECT_TYPE_SUBDIALOG，AUIOBJECT_TYPE_LISTBOX，AUIOBJECT_TYPE_TREEVIEW </small></b>, 见<small><b> auiObject_type </small></b>
-- @param pos  		  滚动条的位置, 对于<br/>
--<small><b>AUIOBJECT_TYPE_SCROLL</b></small>, 表示滚动条的位置<br/>
--		     <small><b>AUIOBJECT_TYPE_SUBDIALOG</b></small>, 表示垂直滚动条的位置<br/>
--		     <small><b>AUIOBJECT_TYPE_LISTBOX</b></small>, 设置首行的位置, 如果位置大于下拉列表框中的条目总数，那么将滚动条的值设为所有行数的值,也就是滚动到最后一行处<br/>
--		     <small><b>AUIOBJECT_TYPE_TREEVIEW</b></small>, 滚动到指定位置
-- @return 无
-- @see auiObject_type
function SetScrollPos(panel_name, item_name, pos)
end

--- 获取滚动条的当前位置
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是:
--					  <small><b>AUIOBJECT_TYPE_SCROLL, AUIOBJECT_TYPE_SUBDIALOG，AUIOBJECT_TYPE_LISTBOX，AUIOBJECT_TYPE_TREEVIEW</small></b>, 见<small><b> auiObject_type</small></b>
-- @return double,    滚动条的位置
-- @usage	<pre><b> 如果控件的类型不符, 那么将返回 -1.00；否则，对于
--AUIOBJECT_TYPE_SCROLL,    表示滚动条的位置
--AUIOBJECT_TYPE_SUBDIALOG, 表示垂直滚动条的位置
--AUIOBJECT_TYPE_LISTBOX,   设置首行的位置, 如果位置大于下拉列表框中的条目总数，那么将滚动
--                          条的值设为所有行数的值,也就是滚动到最后一行处
--AUIOBJECT_TYPE_TREEVIEW,  滚动到指定位置</pre></b> 
-- @see auiObject_type
function GetScrollPos(panel_name, item_name)
end

--- 删除树形列表控件的所有条目
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_TREEVIEW</small></b>, 见<small><b> auiObject_type</small></b>
-- @return            无
-- @see auiObject_type
function DeleteTreeAllItems(panel_name, item_name)
end

--- 设置树形列表控件的文本
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_TREEVIEW</small></b>, 见<small><b> auiObject_type</small></b>
-- @param param_array 参数数组
-- @return 无
-- @usage  <pre><b> 该方法将会删除树形列表控件的所有条目，然后以参数数组的大小为深度创建新条目，数组的最后一个
--值将作为生成的条目的文本。如果参数数组为空，则不创建新条目。同时，参数数组的最后一项必须是
--字符串类型，而之前的每一项的类型必须是 table 类型，当参数数组只有一项时，该项的类型必须为
--字符串类型</b></pre>	   
-- @see auiObject_type
function SetTreeText(panel_name, item_name, param_array)
end

--- 插入树形列表控件的指定条目
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_TREEVIEW</small></b>, 见<small><b> auiObject_type</small></b>
-- @param index_array 索引数组
-- @param item_val    条目文本
-- @return 无
-- @usage  <pre><b> 索引数组为树形列表控件的根条目到指定条目的路径列表, 如果该列表为空, 那么不进行插入操作，即
--该方法不能插入根条目;否则该路径列表的格式为{ 0, 第一级子条目的索引,..., 第 n 级子条目的索
--引,指定条目的索引 }, n为该路径上除根条目与指定条目之外的条目的数目</b></pre>  
-- @see auiObject_type
function InsertTreeItem(panel_name, item_name, index_array, item_val)
end

--- 删除树形列表控件的指定条目
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_TREEVIEW</small></b>, 见<small><b> auiObject_type</small></b>
-- @param index_array 索引数组
-- @return            无
-- @usage  <pre><b> 索引数组为树形列表控件的根条目到指定条目的路径列表, 如果该列表为空, 那么不进行删除操作，即
--该方法不能删除根条目;否则该路径列表的格式为{ 0, 第1级子条目的索引, ..., 第 n 级子条目的索
--引, 指定条目的索引 }, n为该路径上除根条目与指定条目之外的条目的数目</pre></b> 	   
-- @see auiObject_type
function DeleteTreeItem(panel_name, item_name, index_array)
end

--- 设置树形列表控件的指定条目的文本
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_TREEVIEW </small></b>, 见<small><b> auiObject_type </small></b>
-- @param idx_array   索引数组
-- @param item_val    条目内容
-- @return 无
-- @usage  <pre><b> 索引数组为树形列表控件的根条目到指定条目的路径列表, 如果该列表为空, 那么不进行设置操作，即
--根条目没有文本；否则该路径列表的格式为{ 0, 第一级子条目的索引, ..., 第 n 级子条目的索引, 
--指定条目的索引 }, n为该路径上除根条目与指定条目之外的条目的数目</pre></b> 
-- @see auiObject_type
function SetTreeItemText(panel_name, item_name, idx_array, item_val)
end

--- 设置树形列表控件的指定条目的文本
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_TREEVIEW</small></b>, 见<small><b> auiObject_type </small></b>
-- @param index_array 索引数组
-- @return string,    条目文本
-- @usage  <pre><b> 索引数组为树形列表控件的根条目到指定条目的路径列表, 如果该列表为空, 那么返回空值，即根条目
--没有文本;否则该路径列表的格式为{ 0, 第 1 级子条目的索引, ..., 第 n 级子条目的索引, 指定条 
--目的索引 },n为该路径上除根条目与指定条目之外的条目的数目</pre></b> 	   
-- @see auiObject_type
function GetTreeItemText(panel_name, item_name, index_array)
end

--- 设置树形列表控件的指定条目的悬浮提示
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	  控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_TREEVIEW</small></b>, 见<small><b> auiObject_type</small></b>
-- @param index_array 索引数组
-- @param hint 悬浮提示内容
-- @return 无
-- @usage  <pre><b> 索引数组为树形列表控件的根条目到指定条目的路径列表, 如果该列表为空, 那么不进行设置操作，即
--根条目没有悬浮提示；否则该路径列表的格式为{ 0, 第一级子条目的索引, ..., 第 n 级子条目的索
--引,指定条目的索引 }, n为该路径上除根条目与指定条目之外的条目的数目	</b></pre>   
-- @see auiObject_type
function SetTreeItemHint(panel_name, item_name, index_array, hint)
end

--- 获取树形列表控件的选中条目的值的列表
-- @param panel_name 对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	 控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_TREEVIEW</small></b>, 见<small><b> auiObject_type</small></b>
-- @return table,    所有超链接信息列表, {选中条目文本, 树形列表控件的根条目到选中条目的路径列表}
-- @usage  <pre><b> 如果选中条目就是树形列表控件的根条目, 那么只返回选中条目的文本信息; 否则，返回值中的第二项
--(树形列表控件的根条目到选中条目的路径列表)不为空,该路径列表的格式为{ 0, 第一级子条目的索引,
--..., 第 n 级子条目的索引, 选中条目的索引 }, n为该路径上除根条目与选中条目之外的条目的数目</b></pre>
-- @see auiObject_type
function GetTreeSelectItem(panel_name, item_name)
end

--- 获取文本区域控件中的超链接信息
-- @param panel_name 对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	 控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_TEXTAREA</small></b>, 见<small><b> auiObject_type</small></b>
-- @param x			 当前鼠标X坐标
-- @param y 		 当前鼠标Y坐标
-- @return table,    所有超链接信息列表, {链接信息1, 链接信息2, ......}
-- @see auiObject_type
function GetItemLink(panel_name, item_name, x, y)
end

--- 判断键盘按键是否被按下
-- @param vk_key        按键对应的虚拟键码
-- @return true/false,	是否按下
function IsKeyPress(vk_key)
end

--- 将指定颜色的字符串添加到命令行界面中
-- @param panel_name 对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	 控件名称,对应界面xml文件中的 Name 字段, 类型必须是<small><b> AUIOBJECT_TYPE_CONSOLE</small></b>, 见<small><b> auiObject_type</small></b>
-- @param line		 添加的字符串
-- @param color 	 字符颜色, 是一个32位的数值
-- @return	         无
-- @usage  <pre><b> 命令行界面中最多可以添加 100 条字符串, 新添加的字符串如果是第 100 条之后的，程序会从头按顺<br>
-- 				   序替换老字符串</b></pre>
-- @see auiObject_type
function AddConsoleLine(panel_name, item_name, line, color)
end

--- 用指定控件创建新控件
-- @param panel_name 对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	 旧控件名称,对应界面xml文件中的 Name 字段
-- @param new_name	 新控件名称
-- @return           无
function CreateControl(panel_name, item_name, new_name)
end

--- 删除指定控件
-- @param panel_name 对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	 控件名称,对应界面xml文件中的 Name 字段
-- @return true,     删除成功
function DeleteControl(panel_name, item_name)
end

--- 获取指定 Image Picture 控件中的图像在原始图像文件中的序号
-- @param panel_name 对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	 控件名称,对应界面xml文件中的 Name 字段, 控件类型
--					 必须是<small><b> AUIOBJECT_TYPE_IMAGEPICTURE </small></b>, 见 <small><b> auiObject_type </small></b>
-- @return int,      图像在原始图像文件中的序号
-- @usage  <pre><b> 对于图像文件中包含多幅子图像的情形，该函数返回控件中当前使用的图像序号，初始为 0；对于图像
--		   文件中只包含一副图像的情形，该函数返回 0</b></pre>
-- @see auiObject_type
function GetFixFrame(panel_name, item_name)
end

--- 设置UI管理器每次 Tick 更新时是否调用指定界面对应脚本中的 Tick 函数
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param bTickCB	  是否调用脚本中的 Tick 函数
-- @return	          无
function SetTickCB(panel_name, bTickCB)
end

--- 获取指定控件的属性
-- @param panel_name  		对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name	   		控件名称,对应界面xml文件中的 Name 字段
-- @param property_name		属性名称,见 property_name, 属性名对应的对象类型见 property_name_type
-- @return	int/bool/double/font_type/string, 具体什么类型的值需要参考 property_name 对应的 property_name_type, 
--							以及 property_name_type 对应的 property_value_type, 返回的 string 长度不超过 2048
-- @see	property_name, property_type, property_name_type, property_value_type
function GetObjProperty(panel_name, item_name, property_name)
end

--- 设置指定控件的属性
-- @param panel_name  对话框名称,对应界面xml文件中的 Name 字段
-- @param item_name   控件名称,对应界面xml文件中的 Name 字段
-- @param prop_nam	  属性名称,见 property_name, 属性名对应的对象类型见 property_name_type
-- @param prop_val	  属性值,对应的值对应的类型见 property_value_type
-- @return	true,     设置成功
-- @usage <pre><b> 属性值对应类型如果是 string 的话，长度不能超过 2048 个字符，如果超过该值，则会被截断</pre></b> 
-- @see	property_name, property_type, property_name_type, property_value_type
function SetObjProperty(panel_name, item_name, prop_nam, prop_val)
end