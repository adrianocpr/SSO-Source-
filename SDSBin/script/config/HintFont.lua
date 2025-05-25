local Font_Type = 
{
	FZXH1 = 0,--方正细黑一简体
	FZL2 = 1,--方正隶二简体
	FZLB = 2,--方正隶变简体
}
local Font_Style = 
{
	NORMAL = 0,--普通
	BOLD = 1,--粗体
	ITALIC = 2,--斜体
	BOLD_ITALIC = 3,--粗斜体
}
--[[ 配置明细
Hint_Fonts[n]	=  n为编号
{
	fontType=Font_Type.FZXH1, --字体
	fontSize=5, --字体大小
	fontShadow=0, --阴影 0-255
	fontStyle=Font_Style.NORMAL, --字体样式
	isFreeType = true, --是否是freeType，默认为true，可以不配
	outLineWidth = 0, --字体轮廓宽度，默认为0，可以不配
	outLineColor = 0,--字体轮廓颜色，默认为透明，可以不配
	innerTextColor = 0xFFFFFFFF,--字体内部颜色，默认为白色，目前大部分描述都把字体颜色单独摘出来，可以不配
	isFade = false,--是否颜色渐变，默认为false，可以不配
	upperColor = 0,--字体上部颜色，默认为透明，可以不配
	lowerColor = 0,--字体底部颜色，默认为透明，可以不配
}
--]]
Hint_Fonts = 
{
	[1]		={fontType=Font_Type.FZXH1,		fontSize=10,		fontShadow=0,		fontStyle=Font_Style.NORMAL,},
	[2]		={fontType=Font_Type.FZXH1,		fontSize=10,		fontShadow=0,		fontStyle=Font_Style.BOLD,},
	[3]		={fontType=Font_Type.FZXH1,		fontSize=10,		fontShadow=0,		fontStyle=Font_Style.ITALIC,},
	[4]		={fontType=Font_Type.FZXH1,		fontSize=10,		fontShadow=0,		fontStyle=Font_Style.BOLD_ITALIC,},
	[5]		={fontType=Font_Type.FZXH1,		fontSize=10,		fontShadow=100,		fontStyle=Font_Style.NORMAL,},
	[6]		={fontType=Font_Type.FZXH1,		fontSize=10,		fontShadow=100,		fontStyle=Font_Style.BOLD,},
	[7]		={fontType=Font_Type.FZXH1,		fontSize=10,		fontShadow=100,		fontStyle=Font_Style.ITALIC,},
	[8]		={fontType=Font_Type.FZXH1,		fontSize=10,		fontShadow=100,		fontStyle=Font_Style.BOLD_ITALIC,},
	[9]		={fontType=Font_Type.FZXH1,		fontSize=10,		fontShadow=255,		fontStyle=Font_Style.NORMAL,},
	[10]	={fontType=Font_Type.FZXH1,		fontSize=10,		fontShadow=255,		fontStyle=Font_Style.BOLD,},
	[11]	={fontType=Font_Type.FZXH1,		fontSize=10,		fontShadow=255,		fontStyle=Font_Style.ITALIC,},
	[12]	={fontType=Font_Type.FZXH1,		fontSize=10,		fontShadow=255,		fontStyle=Font_Style.BOLD_ITALIC,},
	[13]	={fontType=Font_Type.FZXH1,		fontSize=12,		fontShadow=0,		fontStyle=Font_Style.NORMAL,},
	[14]	={fontType=Font_Type.FZXH1,		fontSize=12,		fontShadow=0,		fontStyle=Font_Style.BOLD,},
	[15]	={fontType=Font_Type.FZXH1,		fontSize=12,		fontShadow=0,		fontStyle=Font_Style.ITALIC,},
	[16]	={fontType=Font_Type.FZXH1,		fontSize=12,		fontShadow=0,		fontStyle=Font_Style.BOLD_ITALIC,},
	[17]	={fontType=Font_Type.FZXH1,		fontSize=12,		fontShadow=100,		fontStyle=Font_Style.NORMAL,},
	[18]	={fontType=Font_Type.FZXH1,		fontSize=12,		fontShadow=100,		fontStyle=Font_Style.BOLD,},
	[19]	={fontType=Font_Type.FZXH1,		fontSize=12,		fontShadow=100,		fontStyle=Font_Style.ITALIC,},
	[20]	={fontType=Font_Type.FZXH1,		fontSize=12,		fontShadow=100,		fontStyle=Font_Style.BOLD_ITALIC,},
	[21]	={fontType=Font_Type.FZXH1,		fontSize=12,		fontShadow=255,		fontStyle=Font_Style.NORMAL,},
	[22]	={fontType=Font_Type.FZXH1,		fontSize=12,		fontShadow=255,		fontStyle=Font_Style.BOLD,},
	[23]	={fontType=Font_Type.FZXH1,		fontSize=12,		fontShadow=255,		fontStyle=Font_Style.ITALIC,},
	[24]	={fontType=Font_Type.FZXH1,		fontSize=12,		fontShadow=255,		fontStyle=Font_Style.BOLD_ITALIC,},
	[25]	={fontType=Font_Type.FZXH1,		fontSize=14,		fontShadow=0,		fontStyle=Font_Style.NORMAL,},
	[26]	={fontType=Font_Type.FZXH1,		fontSize=14,		fontShadow=0,		fontStyle=Font_Style.BOLD,},
	[27]	={fontType=Font_Type.FZXH1,		fontSize=14,		fontShadow=0,		fontStyle=Font_Style.ITALIC,},
	[28]	={fontType=Font_Type.FZXH1,		fontSize=14,		fontShadow=0,		fontStyle=Font_Style.BOLD_ITALIC,},
	[29]	={fontType=Font_Type.FZXH1,		fontSize=14,		fontShadow=100,		fontStyle=Font_Style.NORMAL,},
	[30]	={fontType=Font_Type.FZXH1,		fontSize=14,		fontShadow=100,		fontStyle=Font_Style.BOLD,},
	[31]	={fontType=Font_Type.FZXH1,		fontSize=14,		fontShadow=100,		fontStyle=Font_Style.ITALIC,},
	[32]	={fontType=Font_Type.FZXH1,		fontSize=14,		fontShadow=100,		fontStyle=Font_Style.BOLD_ITALIC,},
	[33]	={fontType=Font_Type.FZXH1,		fontSize=14,		fontShadow=255,		fontStyle=Font_Style.NORMAL,},
	[34]	={fontType=Font_Type.FZXH1,		fontSize=14,		fontShadow=255,		fontStyle=Font_Style.BOLD,},
	[35]	={fontType=Font_Type.FZXH1,		fontSize=14,		fontShadow=255,		fontStyle=Font_Style.ITALIC,},
	[36]	={fontType=Font_Type.FZXH1,		fontSize=14,		fontShadow=255,		fontStyle=Font_Style.BOLD_ITALIC,},
	[37]	={fontType=Font_Type.FZL2,		fontSize=10,		fontShadow=0,		fontStyle=Font_Style.NORMAL,},
	[38]	={fontType=Font_Type.FZL2,		fontSize=10,		fontShadow=0,		fontStyle=Font_Style.BOLD,},
	[39]	={fontType=Font_Type.FZL2,		fontSize=10,		fontShadow=0,		fontStyle=Font_Style.ITALIC,},
	[40]	={fontType=Font_Type.FZL2,		fontSize=10,		fontShadow=0,		fontStyle=Font_Style.BOLD_ITALIC,},
	[41]	={fontType=Font_Type.FZL2,		fontSize=10,		fontShadow=100,		fontStyle=Font_Style.NORMAL,},
	[42]	={fontType=Font_Type.FZL2,		fontSize=10,		fontShadow=100,		fontStyle=Font_Style.BOLD,},
	[43]	={fontType=Font_Type.FZL2,		fontSize=10,		fontShadow=100,		fontStyle=Font_Style.ITALIC,},
	[44]	={fontType=Font_Type.FZL2,		fontSize=10,		fontShadow=100,		fontStyle=Font_Style.BOLD_ITALIC,},
	[45]	={fontType=Font_Type.FZL2,		fontSize=10,		fontShadow=255,		fontStyle=Font_Style.NORMAL,},
	[46]	={fontType=Font_Type.FZL2,		fontSize=10,		fontShadow=255,		fontStyle=Font_Style.BOLD,},
	[47]	={fontType=Font_Type.FZL2,		fontSize=10,		fontShadow=255,		fontStyle=Font_Style.ITALIC,},
	[48]	={fontType=Font_Type.FZL2,		fontSize=10,		fontShadow=255,		fontStyle=Font_Style.BOLD_ITALIC,},
	[49]	={fontType=Font_Type.FZL2,		fontSize=12,		fontShadow=0,		fontStyle=Font_Style.NORMAL,},
	[50]	={fontType=Font_Type.FZL2,		fontSize=12,		fontShadow=0,		fontStyle=Font_Style.BOLD,},
	[51]	={fontType=Font_Type.FZL2,		fontSize=12,		fontShadow=0,		fontStyle=Font_Style.ITALIC,},
	[52]	={fontType=Font_Type.FZL2,		fontSize=12,		fontShadow=0,		fontStyle=Font_Style.BOLD_ITALIC,},
	[53]	={fontType=Font_Type.FZL2,		fontSize=12,		fontShadow=100,		fontStyle=Font_Style.NORMAL,},
	[54]	={fontType=Font_Type.FZL2,		fontSize=12,		fontShadow=100,		fontStyle=Font_Style.BOLD,},
	[55]	={fontType=Font_Type.FZL2,		fontSize=12,		fontShadow=100,		fontStyle=Font_Style.ITALIC,},
	[56]	={fontType=Font_Type.FZL2,		fontSize=12,		fontShadow=100,		fontStyle=Font_Style.BOLD_ITALIC,},
	[57]	={fontType=Font_Type.FZL2,		fontSize=12,		fontShadow=255,		fontStyle=Font_Style.NORMAL,},
	[58]	={fontType=Font_Type.FZL2,		fontSize=12,		fontShadow=255,		fontStyle=Font_Style.BOLD,},
	[59]	={fontType=Font_Type.FZL2,		fontSize=12,		fontShadow=255,		fontStyle=Font_Style.ITALIC,},
	[60]	={fontType=Font_Type.FZL2,		fontSize=12,		fontShadow=255,		fontStyle=Font_Style.BOLD_ITALIC,},
	[61]	={fontType=Font_Type.FZL2,		fontSize=14,		fontShadow=0,		fontStyle=Font_Style.NORMAL,},
	[62]	={fontType=Font_Type.FZL2,		fontSize=14,		fontShadow=0,		fontStyle=Font_Style.BOLD,},
	[63]	={fontType=Font_Type.FZL2,		fontSize=14,		fontShadow=0,		fontStyle=Font_Style.ITALIC,},
	[64]	={fontType=Font_Type.FZL2,		fontSize=14,		fontShadow=0,		fontStyle=Font_Style.BOLD_ITALIC,},
	[65]	={fontType=Font_Type.FZL2,		fontSize=14,		fontShadow=100,		fontStyle=Font_Style.NORMAL,},
	[66]	={fontType=Font_Type.FZL2,		fontSize=14,		fontShadow=100,		fontStyle=Font_Style.BOLD,},
	[67]	={fontType=Font_Type.FZL2,		fontSize=14,		fontShadow=100,		fontStyle=Font_Style.ITALIC,},
	[68]	={fontType=Font_Type.FZL2,		fontSize=14,		fontShadow=100,		fontStyle=Font_Style.BOLD_ITALIC,},
	[69]	={fontType=Font_Type.FZL2,		fontSize=14,		fontShadow=255,		fontStyle=Font_Style.NORMAL,},
	[70]	={fontType=Font_Type.FZL2,		fontSize=14,		fontShadow=255,		fontStyle=Font_Style.BOLD,},
	[71]	={fontType=Font_Type.FZL2,		fontSize=14,		fontShadow=255,		fontStyle=Font_Style.ITALIC,},
	[72]	={fontType=Font_Type.FZL2,		fontSize=14,		fontShadow=255,		fontStyle=Font_Style.BOLD_ITALIC,},
	[73]	={fontType=Font_Type.FZLB,		fontSize=10,		fontShadow=0,		fontStyle=Font_Style.NORMAL,},
	[74]	={fontType=Font_Type.FZLB,		fontSize=10,		fontShadow=0,		fontStyle=Font_Style.BOLD,},
	[75]	={fontType=Font_Type.FZLB,		fontSize=10,		fontShadow=0,		fontStyle=Font_Style.ITALIC,},
	[76]	={fontType=Font_Type.FZLB,		fontSize=10,		fontShadow=0,		fontStyle=Font_Style.BOLD_ITALIC,},
	[77]	={fontType=Font_Type.FZLB,		fontSize=10,		fontShadow=100,		fontStyle=Font_Style.NORMAL,},
	[78]	={fontType=Font_Type.FZLB,		fontSize=10,		fontShadow=100,		fontStyle=Font_Style.BOLD,},
	[79]	={fontType=Font_Type.FZLB,		fontSize=10,		fontShadow=100,		fontStyle=Font_Style.ITALIC,},
	[80]	={fontType=Font_Type.FZLB,		fontSize=10,		fontShadow=100,		fontStyle=Font_Style.BOLD_ITALIC,},
	[81]	={fontType=Font_Type.FZLB,		fontSize=10,		fontShadow=255,		fontStyle=Font_Style.NORMAL,},
	[82]	={fontType=Font_Type.FZLB,		fontSize=10,		fontShadow=255,		fontStyle=Font_Style.BOLD,},
	[83]	={fontType=Font_Type.FZLB,		fontSize=10,		fontShadow=255,		fontStyle=Font_Style.ITALIC,},
	[84]	={fontType=Font_Type.FZLB,		fontSize=10,		fontShadow=255,		fontStyle=Font_Style.BOLD_ITALIC,},
	[85]	={fontType=Font_Type.FZLB,		fontSize=12,		fontShadow=0,		fontStyle=Font_Style.NORMAL,},
	[86]	={fontType=Font_Type.FZLB,		fontSize=12,		fontShadow=0,		fontStyle=Font_Style.BOLD,},
	[87]	={fontType=Font_Type.FZLB,		fontSize=12,		fontShadow=0,		fontStyle=Font_Style.ITALIC,},
	[88]	={fontType=Font_Type.FZLB,		fontSize=12,		fontShadow=0,		fontStyle=Font_Style.BOLD_ITALIC,},
	[89]	={fontType=Font_Type.FZLB,		fontSize=12,		fontShadow=100,		fontStyle=Font_Style.NORMAL,},
	[90]	={fontType=Font_Type.FZLB,		fontSize=12,		fontShadow=100,		fontStyle=Font_Style.BOLD,},
	[91]	={fontType=Font_Type.FZLB,		fontSize=12,		fontShadow=100,		fontStyle=Font_Style.ITALIC,},
	[92]	={fontType=Font_Type.FZLB,		fontSize=12,		fontShadow=100,		fontStyle=Font_Style.BOLD_ITALIC,},
	[93]	={fontType=Font_Type.FZLB,		fontSize=12,		fontShadow=255,		fontStyle=Font_Style.NORMAL,},
	[94]	={fontType=Font_Type.FZLB,		fontSize=12,		fontShadow=255,		fontStyle=Font_Style.BOLD,},
	[95]	={fontType=Font_Type.FZLB,		fontSize=12,		fontShadow=255,		fontStyle=Font_Style.ITALIC,},
	[96]	={fontType=Font_Type.FZLB,		fontSize=12,		fontShadow=255,		fontStyle=Font_Style.BOLD_ITALIC,},
	[97]	={fontType=Font_Type.FZLB,		fontSize=14,		fontShadow=0,		fontStyle=Font_Style.NORMAL,},
	[98]	={fontType=Font_Type.FZLB,		fontSize=14,		fontShadow=0,		fontStyle=Font_Style.BOLD,},
	[99]	={fontType=Font_Type.FZLB,		fontSize=14,		fontShadow=0,		fontStyle=Font_Style.ITALIC,},
	[100]	={fontType=Font_Type.FZLB,		fontSize=14,		fontShadow=0,		fontStyle=Font_Style.BOLD_ITALIC,},
	[101]	={fontType=Font_Type.FZLB,		fontSize=14,		fontShadow=100,		fontStyle=Font_Style.NORMAL,},
	[102]	={fontType=Font_Type.FZLB,		fontSize=14,		fontShadow=100,		fontStyle=Font_Style.BOLD,},
	[103]	={fontType=Font_Type.FZLB,		fontSize=14,		fontShadow=100,		fontStyle=Font_Style.ITALIC,},
	[104]	={fontType=Font_Type.FZLB,		fontSize=14,		fontShadow=100,		fontStyle=Font_Style.BOLD_ITALIC,},
	[105]	={fontType=Font_Type.FZLB,		fontSize=14,		fontShadow=255,		fontStyle=Font_Style.NORMAL,},
	[106]	={fontType=Font_Type.FZLB,		fontSize=14,		fontShadow=255,		fontStyle=Font_Style.BOLD,},
	[107]	={fontType=Font_Type.FZLB,		fontSize=14,		fontShadow=255,		fontStyle=Font_Style.ITALIC,},
	[108]	={fontType=Font_Type.FZLB,		fontSize=14,		fontShadow=255,		fontStyle=Font_Style.BOLD_ITALIC,},
	[109]	={fontType=Font_Type.FZXH1,		fontSize=9,			fontShadow=0,		fontStyle=Font_Style.NORMAL,},
	[110]	={fontType=Font_Type.FZXH1,		fontSize=8,			fontShadow=0,		fontStyle=Font_Style.NORMAL,},
	[111]	={fontType=Font_Type.FZXH1,		fontSize=7,			fontShadow=0,		fontStyle=Font_Style.NORMAL,},
	[112]	={fontType=Font_Type.FZXH1,		fontSize=6,			fontShadow=0,		fontStyle=Font_Style.NORMAL,},
	[113]	={fontType=Font_Type.FZXH1,		fontSize=5,			fontShadow=0,		fontStyle=Font_Style.NORMAL,},
	[114]	={fontType=Font_Type.FZXH1,		fontSize=11,		fontShadow=0,		fontStyle=Font_Style.NORMAL,},
	
}