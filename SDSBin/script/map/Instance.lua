--[[ @i18n map ]]
local _t = require("i18n").context("map")
---------------------------------------------------------------
--  场景、管辖区域配置文件。

--  返回上一级地图(上一级管辖区域地图)标志
local INVALID_PRECINCT	= -1 	-- 二级地图,省级地图
local UP_TO_WORLDMAP	= -2 	-- 一级地图,世界地图
local CURRENT_PRECINCT	= -3 	-- 三级地图,管辖区域地图


Instance = {}

Instance[0] = --id
{
	name			= _t"登录世界",
	idZone 			= 0,
	path			= "character",
	detailTexture 	= "",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
}



Instance[1] = --id
{
	name			= _t"群星之地",
	idZone 			= 0,
	path			= "n1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	iFlyMaxHeight = 450, -- 最大飞行高度
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\n1.dds",
	cubeMap			= "Textures\\Maps\\新手村遗忘之路\\CubeTexture.dds",
	rectMap		    = {-504, 503, 504, -503},
	validRegion		= {0, 0, 1024, 1024},
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n1_cloud.dds",
	domainFile      = "data\\n1.dat",
	MiniMap 	 	= "maps\\worldmaps\\n1_mini.dds",
    loadingImage 	= "",		--进入世界时加载的地图
    marks   	 	=
	{
		[1] = { id=11564,		desc=_t"仓库",   image="maps\\MiniMapMark\\仓储.tga"},
		[2] = { pos={-369,155},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
		[3] = { pos={-190,79},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
		[4] = { id=11320,		desc=_t"锻造师",   image="maps\\MiniMapMark\\装备.tga"},
		[5] = { pos={-4,290},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[6] = { pos={-391,358},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[7] = { pos={-155,118},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[8] = { pos={-426,100},	desc=_t"面包商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
	},
}

Instance[2] = --id
{
	name			= _t"圣域",
	idZone 			= 0,
	path			= "n2",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	iFlyMaxHeight = 450, -- 最大飞行高度
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\n2.dds",
	rectMap		    = {-504, 503, 504, -503},
	validRegion		= {0, 0, 1024, 1024},
	bHasMapCloud    = true,
	fixTime         = 0, -- 设置固定时间
    showSunMoon     = false, -- 设置是否显示太阳月亮
	worldMapCloud   = "maps\\worldmaps\\n2_cloud.dds",
	domainFile      = "data\\n2.dat",
	MiniMap 	 	= "maps\\worldmaps\\n2_mini.dds",
    loadingImage 	= "",		--进入世界时加载的地图
    marks   	 	=
	{
		[1] = { pos={-111,91},		desc=_t"仓库",   image="maps\\MiniMapMark\\仓储.tga"},
		[2] = { pos={-117,69},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
		[3] = { pos={-220,58},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
		[4] = { pos={-231,346},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
		[5] = { pos={-106,115},		desc=_t"装备聚能师",   image="maps\\MiniMapMark\\weaponnpc.tga"},
		[6] = { pos={58,18},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[7] = { pos={-34,339},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[8] = { pos={192,370},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[9] = { pos={318,-237},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[10] = { pos={299,265},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[11] = { pos={-257,22},		desc=_t"仓库",   image="maps\\MiniMapMark\\仓储.tga"},
    	[12] = { pos={-152,280},		desc=_t"仓库",   image="maps\\MiniMapMark\\仓储.tga"},
    	[13] = { pos={-140,281},		desc=_t"装备聚能师",   image="maps\\MiniMapMark\\weaponnpc.tga"},
    	[14] = { pos={-167,289},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
    	[15] = { pos={-249,394},		desc=_t"仓库",   image="maps\\MiniMapMark\\仓储.tga"},

	},

		[201] =
    {
        bPrecinctMap = true,
        upPrecinctId = INVALID_PRECINCT,
        MidMap  	 = "maps\\worldmaps\\n2_city.dds",
    	rectMap  	 = {-512, 437, -12, -63},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\n2_city.dds",
        loadingImage = "",
        selRoleGFX   = "",
		marks        =
    	{
    		[1] = { pos={-117,69},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
    		[2] = { pos={-220,58},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
    		[3] = { pos={-111,91},		desc=_t"仓库",   image="maps\\MiniMapMark\\仓储.tga"},
    		[4] = { pos={-257,22},		desc=_t"仓库",   image="maps\\MiniMapMark\\仓储.tga"},
    		[5] = { pos={-152,280},		desc=_t"仓库",   image="maps\\MiniMapMark\\仓储.tga"},
    		[6] = { pos={-231,346},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
    		[7] = { pos={-106,115},		desc=_t"装备聚能师",   image="maps\\MiniMapMark\\weaponnpc.tga"},
    		[8] = { pos={-103,95},		desc=_t"锻造师",   image="maps\\MiniMapMark\\装备.tga"},
    		[9] = { pos={-249,32},		desc=_t"锻造师",   image="maps\\MiniMapMark\\装备.tga"},
    		[10] = { pos={-239,307},		desc=_t"锻造师",   image="maps\\MiniMapMark\\装备.tga"},
    		[11] = { pos={-114,52},		desc=_t"药剂师",   image="maps\\MiniMapMark\\shopnpc.tga"},
    		[12] = { pos={-91,62},		desc=_t"工艺师",   image="maps\\MiniMapMark\\shopnpc2.tga"},
    		[13] = { pos={-116,74},		desc=_t"拍卖师",   image="maps\\MiniMapMark\\售卖.tga"},
    		[14] = { pos={-94,84},	desc=_t"面包商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
    		[15] = { pos={-246,31},	desc=_t"面包商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
    		[16] = { pos={-163,	328},	desc=_t"面包商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
    		[17] = { pos={-161,325},	desc=_t"工艺师", 	image="maps\\MiniMapMark\\shopnpc2.tga"},
    		[18] = { pos={-160,279},		desc=_t"拍卖师",   image="maps\\MiniMapMark\\售卖.tga"},
    		[19] = { pos={-286,225},		desc=_t"锻造师",   image="maps\\MiniMapMark\\装备.tga"},
    		[20] = { pos={-140,281},		desc=_t"装备聚能师",   image="maps\\MiniMapMark\\weaponnpc.tga"},
    		[21] = { pos={-167,289},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
    		[22] = { pos={-207,168},		desc=_t"药剂师",   image="maps\\MiniMapMark\\shopnpc.tga"},
    		[23] = { pos={-159,323},		desc=_t"药剂师",   image="maps\\MiniMapMark\\shopnpc.tga"},
    		[24] = { pos={-249,394},		desc=_t"仓库",   image="maps\\MiniMapMark\\仓储.tga"},
    		[25] = { pos={-392,333},		desc=_t"锻造师",   image="maps\\MiniMapMark\\装备.tga"},
    		[26] = { pos={-265,217},	desc=_t"面包商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
    		[27] = { pos={-234,408},	desc=_t"工艺师", 	image="maps\\MiniMapMark\\shopnpc2.tga"},
    		[28] = { pos={-164,420},	desc=_t"幻境使者", 	image="maps\\MiniMapMark\\传送.tga"},
    		[29] = { pos={-193,90},	desc=_t"守护星座切换", 	image="maps\\MiniMapMark\\学职业技能.tga"},
    		[30] = { pos={-193,86},	desc=_t"宝物商人", 	image="maps\\MiniMapMark\\功能.tga"},
    		[31] = { pos={-183,336},	desc=_t"战场军官", 	image="maps\\MiniMapMark\\剧本.tga"},
    	},
    },

}

Instance[3] = --id
{
	name			= _t"庐山",
	idZone 			= 0,
	path			= "n3",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	iFlyMaxHeight = 450, -- 最大飞行高度	
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\n3.dds",
	rectMap		    = {-500, 420, 397, -477},
	validRegion		= {0, 0, 1024, 1024},
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n3_cloud.dds",
	domainFile      = "data\\n3.dat",
	MiniMap 	 	= "maps\\worldmaps\\n3_mini.dds",
    loadingImage 	= "",		--进入世界时加载的地图
    marks   	 	=
	{
		[1] = { id=11567,		desc=_t"仓库",   image="maps\\MiniMapMark\\仓储.tga"},
		[2] = { pos={-250,-108},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
		[3] = { pos={18,-46},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
		[4] = { pos={14,331},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
		[5] = { id=11578,		desc=_t"装备聚能师",   image="maps\\MiniMapMark\\weaponnpc.tga"},
		[6] = { pos={-250,-68},		desc=_t"药剂师",   image="maps\\MiniMapMark\\shopnpc.tga"},
		[7] = { id=11581,		desc=_t"工艺师",   image="maps\\MiniMapMark\\shopnpc2.tga"},
		[8] = { pos={-267,-72},		desc=_t"锻造师",   image="maps\\MiniMapMark\\装备.tga"},
		[9] = { pos={-177,276},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[10] = { pos={13,-40},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[11] = { pos={36,139},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[12] = { pos={132,350},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[13] = { pos={-212,-155},	desc=_t"面包商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
	},

}



Instance[4] = --id
{
	name			= _t"银河竞技场",
	idZone 			= 0,
	path			= "n4",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	iFlyMaxHeight = 450, -- 最大飞行高度
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\n4.dds",
	MiniMap 	 	= "maps\\worldmaps\\n4_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n4_cloud.dds",
	domainFile      = "data\\n4.dat",
	loadingImage 	= "",		--进入世界时加载的地图
	    marks   	 	=
	{
		[1] = { pos={180,249},		desc=_t"仓库",   image="maps\\MiniMapMark\\仓储.tga"},
		[2] = { pos={13,-324},		desc=_t"仓库",   image="maps\\MiniMapMark\\仓储.tga"},
		[3] = { pos={218,337},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
		[4] = { pos={57,-338},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
		[5] = { pos={-261,-37},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
		[6] = { pos={195,269},		desc=_t"装备聚能师",   image="maps\\MiniMapMark\\weaponnpc.tga"},
		[7] = { pos={314,2},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[8] = { pos={161,-350},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[9] = { pos={-300,-349},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[10] = { pos={-335,163},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[11] = { pos={111,331},		desc=_t"药剂师",   image="maps\\MiniMapMark\\shopnpc.tga"},
		[12] = { id=11580,		desc=_t"工艺师",   image="maps\\MiniMapMark\\shopnpc2.tga"},
		[13] = { pos={109,340},		desc=_t"锻造师",   image="maps\\MiniMapMark\\装备.tga"},
		[14] = { pos={43,-295},		desc=_t"药剂师",   image="maps\\MiniMapMark\\shopnpc.tga"},
		[15] = { pos={-272,-20},		desc=_t"补给商人",   image="maps\\MiniMapMark\\出售商品.tga"},
		[16] = { pos={45,-301},		desc=_t"锻造师",   image="maps\\MiniMapMark\\装备.tga"},
		[17] = { pos={108,329},	desc=_t"面包商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[18] = { pos={21,-327},	desc=_t"面包商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
	},

}


Instance[5] = --id
{
	name			= _t"遗忘之路",
	idZone 			= 0,
	path			= "n5",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	iFlyMaxHeight = 450, -- 最大飞行高度	
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n5_cloud.dds",
	domainFile      = "data\\n5.dat",
	worldMap        = "maps\\worldmaps\\n5.dds",
	MiniMap 	 	= "maps\\worldmaps\\n5_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
		    marks   	 	=
	{
		[1] = { pos={3,-155},		desc=_t"仓库",   image="maps\\MiniMapMark\\仓储.tga"},
		[2] = { pos={238,32},		desc=_t"仓库",   image="maps\\MiniMapMark\\仓储.tga"},
		[3] = { pos={21,-193},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
		[4] = { pos={209,1},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
		[5] = { pos={227,40},		desc=_t"装备聚能师",   image="maps\\MiniMapMark\\weaponnpc.tga"},
		[6] = { pos={-27,132},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[7] = { pos={-101,-385},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[8] = { pos={2,-158},		desc=_t"药剂师",   image="maps\\MiniMapMark\\shopnpc.tga"},
		[9] = { pos={53,-190},		desc=_t"锻造师",   image="maps\\MiniMapMark\\装备.tga"},
		[10] = { pos={236,27},		desc=_t"药剂师",   image="maps\\MiniMapMark\\shopnpc.tga"},
		[11] = { pos={227,23},		desc=_t"锻造师",   image="maps\\MiniMapMark\\装备.tga"},
		[12] = { pos={2,-153},	desc=_t"面包商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[13] = { pos={236,27},	desc=_t"面包商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
	},
}


Instance[6] = --id
{
	name			= _t"死亡皇后岛",
	idZone 			= 0,
	path			= "n6",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	iFlyMaxHeight = 450, -- 最大飞行高度
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n6_cloud.dds",
	domainFile      = "data\\n6.dat",
	worldMap        = "maps\\worldmaps\\n6.dds",
	MiniMap 	 	= "maps\\worldmaps\\n6_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
			    marks   	 	=
	{
		[1] = { pos={-156,-162},		desc=_t"仓库",   image="maps\\MiniMapMark\\仓储.tga"},
		[2] = { pos={-412,74},		desc=_t"仓库",   image="maps\\MiniMapMark\\仓储.tga"},
		[3] = { pos={-151,-126},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
		[4] = { pos={-393,57},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
		[5] = { pos={-154,-168},		desc=_t"装备聚能师",   image="maps\\MiniMapMark\\weaponnpc.tga"},
		[6] = { pos={190,-356},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[7] = { pos={135,0},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[8] = { pos={-122,-120},		desc=_t"药剂师",   image="maps\\MiniMapMark\\shopnpc.tga"},
		[9] = { pos={-154,-146},		desc=_t"锻造师",   image="maps\\MiniMapMark\\装备.tga"},
		[10] = { pos={-400,71},		desc=_t"锻造师",   image="maps\\MiniMapMark\\装备.tga"},
		[11] = { pos={-126,-119},	desc=_t"面包商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[12] = { pos={-323,-154},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[13] = { pos={62,-355},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[14] = { pos={-410,63},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},

	},
}


Instance[7] = --id
{
	name			= _t"东西伯利亚",
	idZone 			= 0,
	path			= "n7",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
        worldMap        = "maps\\worldmaps\\n7.dds",
	MiniMap 	 	= "maps\\worldmaps\\n7_mini.dds",
	rectMap		    = {-512, 512, 512, -512},
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n7_cloud.dds",
	domainFile      = "data\\n7.dat",
	loadingImage 	= "",		--进入世界时加载的地图
				    marks   	 	=
	{
		[1] = { pos={-271,320},		desc=_t"仓库",   image="maps\\MiniMapMark\\仓储.tga"},
		[2] = { pos={-275,-33},		desc=_t"仓库",   image="maps\\MiniMapMark\\仓储.tga"},
		[3] = { pos={-269,317},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
		[4] = { pos={-241,53},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
		[5] = { pos={-283,-9},		desc=_t"装备聚能师",   image="maps\\MiniMapMark\\weaponnpc.tga"},
		[6] = { pos={-390,-277},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[7] = { pos={368,-390},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[8] = { pos={-281,345},		desc=_t"药剂师",   image="maps\\MiniMapMark\\shopnpc.tga"},
		[9] = { pos={-240,314},		desc=_t"锻造师",   image="maps\\MiniMapMark\\装备.tga"},
		[10] = { pos={-223,24},		desc=_t"锻造师",   image="maps\\MiniMapMark\\装备.tga"},
		[11] = { pos={-255,348},	desc=_t"面包商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[12] = { pos={78,254},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[13] = { pos={-22,23},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[14] = { pos={-410,63},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[15] = { pos={409,-70},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
		[16] = { pos={436,-63},		desc=_t"锻造师",   image="maps\\MiniMapMark\\装备.tga"},
		[17] = { pos={444,-93},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[18] = { pos={-206,-30},	desc=_t"面包商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[19] = { pos={-206,-2},		desc=_t"药剂师",   image="maps\\MiniMapMark\\shopnpc.tga"},
	},
}


Instance[8] = --id
{
	name			= _t"亚特兰蒂斯",
	idZone 			= 0,
	path			= "n8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
    worldMap        = "maps\\worldmaps\\n8.dds",
	MiniMap 	 	= "maps\\worldmaps\\n8_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n8_cloud.dds",
	domainFile      = "data\\n8.dat",
	loadingImage 	= "",		--进入世界时加载的地图
				    marks   	 	=
	{
		[1] = { pos={-294,-94},		desc=_t"仓库",   image="maps\\MiniMapMark\\仓储.tga"},
		[2] = { pos={356,2},		desc=_t"仓库",   image="maps\\MiniMapMark\\仓储.tga"},
		[3] = { pos={-296,-95},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
		[4] = { pos={354,-1},	desc=_t"邮箱", 	image="maps\\MiniMapMark\\邮箱.tga"},
		[5] = { pos={-275,-93},		desc=_t"装备聚能师",   image="maps\\MiniMapMark\\weaponnpc.tga"},
		[6] = { pos={358,4},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[7] = { pos={-39,-155},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[8] = { pos={-224,-71},		desc=_t"药剂师",   image="maps\\MiniMapMark\\shopnpc.tga"},
		[9] = { pos={-222,-58},		desc=_t"锻造师",   image="maps\\MiniMapMark\\装备.tga"},
		[10] = { pos={201,-237},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[11] = { pos={-236,-106},	desc=_t"面包商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[12] = { pos={194,57},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[13] = { pos={365,-374},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[14] = { pos={104,-367},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},

	},
}

Instance[9] = --id
{
	name			= _t"仙女岛",
	idZone 			= 0,
	path			= "n9",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n9_cloud.dds",
	domainFile      = "data\\n9.dat",
	worldMap        = "maps\\worldmaps\\n9.dds",
	MiniMap 	 	= "maps\\worldmaps\\n9.dds",
	rectMap		    = {-512, 512, 512, -512},
	loadingImage 	= "",		--进入世界时加载的地图
}


Instance[10] = --id
{
	name			= _t"哈迪斯城",
	idZone 			= 0,
	path			= "n10",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n10_cloud.dds",
	domainFile      = "data\\n10.dat",
	worldMap        = "maps\\worldmaps\\n10.dds",
	MiniMap 	 	= "maps\\worldmaps\\n10.dds",
	rectMap		    = {-512, 512, 512, -512},
	loadingImage 	= "",		--进入世界时加载的地图

}

Instance[11] = --id
{
	name			= _t"冥界地狱",
	idZone			= 0,
	path			= "n11",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 2,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n11_cloud.dds",
	domainFile      = "data\\n11.dat",
	worldMap        = "maps\\worldmaps\\n11.dds",
	MiniMap 	 	= "maps\\worldmaps\\n11.dds",
	rectMap		    = {-1024, 1024, 1024, -1024},
	loadingImage 	= "",		--进入世界时加载的地图
    				    marks   	 	=
	{

		[1] = { pos={-95,-782},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[2] = { pos={564,-393},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
		[3] = { pos={259,25},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
        [4] = { pos={730,541},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},
        [5] = { pos={-838,603},	desc=_t"补给商人", 	image="maps\\MiniMapMark\\出售商品.tga"},

	},
	
--[[
	[1101] = 
	{
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\n11_1.dds",
    	rectMap  	 = {-1024, 2048, 0, 0},
        MiniMap 	 = "maps\\worldmaps\\n11_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
	[1102] = 
	{
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\n11_2.dds",
    	rectMap  	 = {0, 2048, 1024, 0},
        MiniMap 	 = "maps\\worldmaps\\n11_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
	[1103] = 
	{
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\n11_3.dds",
    	rectMap  	 = {0, 0, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\n11_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
	[1104] = 
	{
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\n11_3.dds",
    	rectMap  	 = {-1024, 0, 0, -2048},
        MiniMap 	 = "maps\\worldmaps\\n11_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },]]--
}

Instance[12] = --id
{
	name			= _t"极乐净土",
	idZone			= 0,
	path			= "n12",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n12_cloud.dds",
	domainFile      = "data\\n12.dat",
	worldMap        = "maps\\worldmaps\\n12.dds",
	MiniMap 	 	= "maps\\worldmaps\\n12.dds",
	rectMap		    = {-512,512,512,-512},
	loadingImage 	= "",		--进入世界时加载的地图
}
	
Instance[14] = --id
{
	name			= _t"测试",
	idZone 			= 0,
	path			= "s14",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\s14.dds",
	rectMap		    = {-504, 503, 504, -503},
	validRegion		= {0, 0, 1024, 1024},
	MiniMap 	 	= "maps\\worldmaps\\s14_mini.dds",
    loadingImage 	= "",		--进入世界时加载的地图

}

Instance[15] = --id
{
	name			= _t"黑夜星空测试",
	idZone 			= 0,
	path			= "s15",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\s15.dds",
	rectMap		    = {-504, 503, 504, -503},
	validRegion		= {0, 0, 1024, 1024},
	MiniMap 	 	= "maps\\worldmaps\\s15_mini.dds",
    loadingImage 	= "",		--进入世界时加载的地图

}

Instance[16] = --id
{
	name			= _t"军团排位赛地图",
	idZone 			= 0,
	path			= "l2",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\l2.dds",
	MiniMap 	 	= "maps\\worldmaps\\l2_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[17] = --id
{
	name			= _t"测试地图",
	idZone 			= 0,
	path			= "e8",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置

	worldMap        = "maps\\worldmaps\\e8.dds",
	MiniMap 	 	= "maps\\worldmaps\\e8_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[18] = --id
{
	name			= _t"大众战场临时",
	idZone 			= 0,
	path			= "b1",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置

	worldMap        = "maps\\worldmaps\\b1.dds",
	MiniMap 	 	= "maps\\worldmaps\\b1_mini.dds",
	rectMap		    = {-382, 395, 471, -458},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[25] = --id
{
	name			= _t"爱琴湾",
	idZone			= 0,
	path			= "n25",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	bHasMapCloud    = true,
	worldMap        = "maps\\worldmaps\\n25.dds",
	MiniMap 	 	= "maps\\worldmaps\\n25.dds",
	rectMap		    = {-413, -82, 17, -512},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[26] = --id
{
	name			= _t"试炼幻境二（55级）",
	idZone 			= 0,
	path			= "b1",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置

	worldMap        = "maps\\worldmaps\\b1.dds",
	MiniMap 	 	= "maps\\worldmaps\\b1_mini.dds",
	rectMap		    = {-382, 395, 471, -458},
	loadingImage 	= "",		--进入世界时加载的地图
	weeding_award	= true,
}

Instance[27] = --id
{
	name			= _t"试炼幻境三（65级）",
	idZone 			= 0,
	path			= "b1",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置

	worldMap        = "maps\\worldmaps\\b1.dds",
	MiniMap 	 	= "maps\\worldmaps\\b1_mini.dds",
	rectMap		    = {-382, 395, 471, -458},
	loadingImage 	= "",		--进入世界时加载的地图
	weeding_award	= true,
}

Instance[28] = --id
{
	name			= _t"试炼幻境四（75级）",
	idZone 			= 0,
	path			= "b1",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置

	worldMap        = "maps\\worldmaps\\b1.dds",
	MiniMap 	 	= "maps\\worldmaps\\b1_mini.dds",
	rectMap		    = {-382, 395, 471, -458},
	loadingImage 	= "",		--进入世界时加载的地图
	weeding_award	= true,
}

Instance[29] = --id
{
	name			= _t"试炼幻境五（85级）",
	idZone 			= 0,
	path			= "b1",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置

	worldMap        = "maps\\worldmaps\\b1.dds",
	MiniMap 	 	= "maps\\worldmaps\\b1_mini.dds",
	rectMap		    = {-382, 395, 471, -458},
	loadingImage 	= "",		--进入世界时加载的地图
	weeding_award	= true,
}

Instance[30] = --id
{
	name			= _t"试炼幻境六（95级）",
	idZone 			= 0,
	path			= "b1",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置

	worldMap        = "maps\\worldmaps\\b1.dds",
	MiniMap 	 	= "maps\\worldmaps\\b1_mini.dds",
	rectMap		    = {-382, 395, 471, -458},
	loadingImage 	= "",		--进入世界时加载的地图
	weeding_award	= true,
}

Instance[31] = --id
{
	name			= _t"试炼幻境一（45级）",
	idZone 			= 0,
	path			= "b1",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置

	worldMap        = "maps\\worldmaps\\b1.dds",
	MiniMap 	 	= "maps\\worldmaps\\b1_mini.dds",
	rectMap		    = {-382, 395, 471, -458},
	loadingImage 	= "",		--进入世界时加载的地图
	weeding_award	= true,
}

Instance[32] = --id
{
	name			= _t"迷幻雪山",
	idZone 			= 0,
	path			= "n32",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	iFlyMaxHeight = 600, -- 最大飞行高度
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\n32.dds",
	MiniMap 	 	= "maps\\worldmaps\\n32_mini.dds",
	rectMap		    = {-5, 436, 465, -34},
	loadingImage 	= "",		--进入世界时加载的地图

}

Instance[33] = --id
{
	name			= _t"跨服军团PK赛场",
	idZone 			= 0,
	path			= "b1",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置

	worldMap        = "maps\\worldmaps\\b1.dds",
	MiniMap 	 	= "maps\\worldmaps\\b1_mini.dds",
	rectMap		    = {-382, 395, 471, -458},
	loadingImage 	= "",		--进入世界时加载的地图

}

Instance[34] = --id
{
	name			= _t"试炼幻境六（潜修Lv5）",
	idZone 			= 0,
	path			= "b1",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置
	
	worldMap        = "maps\\worldmaps\\b1.dds",
	MiniMap 	 	= "maps\\worldmaps\\b1_mini.dds",
	rectMap		    = {-382, 395, 471, -458},
	loadingImage 	= "",		--进入世界时加载的地图
	weeding_award	= true,
}
Instance[35] = --id
{
	name			= _t"幻境",
	idZone 			= 0,
	path			= "n1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\n1.dds",
	rectMap		    = {-504, 503, 504, -503},
	validRegion		= {0, 0, 1024, 1024},
	MiniMap 	 	= "maps\\worldmaps\\n1_mini.dds",
    loadingImage 	= "",		--进入世界时加载的地图

}

Instance[36] = --id
{
	name			= _t"万圣夜！疯狂的南瓜",
	idZone 			= 0,
	path			= "n10",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	iFlyMaxHeight = 450, -- 最大飞行高度	
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	bHasMapCloud    = true,
	fixTime         = 20, -- 设置固定时间
    showSunMoon     = false, -- 设置是否显示太阳月亮
	worldMapCloud   = "maps\\worldmaps\\n10_cloud.dds",
	domainFile      = "data\\n10.dat",
	worldMap        = "maps\\worldmaps\\n10.dds",
	MiniMap 	 	= "maps\\worldmaps\\n10.dds",
	rectMap		    = {-512, 512, 512, -512},
    loadingImage 	= "",		--进入世界时加载的地图
}

Instance[37] = --id
{
	name			= _t"遗忘之路",
	idZone 			= 0,
	path			= "n5",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	iFlyMaxHeight = 450, -- 最大飞行高度	
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置
	bHasMapCloud    = true,
	worldMap        = "maps\\worldmaps\\n5.dds",
	MiniMap 	 	= "maps\\worldmaps\\n5_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
}



Instance[38] = --id
{
	name			= _t"幻境",
	idZone 			= 0,
	path			= "n1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\n1.dds",
	rectMap		    = {-504, 503, 504, -503},
	validRegion		= {0, 0, 1024, 1024},
	MiniMap 	 	= "maps\\worldmaps\\n1_mini.dds",
    loadingImage 	= "",		--进入世界时加载的地图

}

Instance[39] = --id
{
	name			= _t"幻境三",
	idZone 			= 0,
	path			= "n1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\n1.dds",
	rectMap		    = {-504, 503, 504, -503},
	validRegion		= {0, 0, 1024, 1024},
	MiniMap 	 	= "maps\\worldmaps\\n1_mini.dds",
    loadingImage 	= "",		--进入世界时加载的地图
}


Instance[40] = --id
{
	name			= _t"雅典娜神殿",
	idZone 			= 0,
	path			= "n2",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\n2.dds",
	rectMap		    = {-504, 503, 504, -503},
	validRegion		= {0, 0, 1024, 1024},
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\cloud.dds",
	domainFile      = "data\\n2.dat",
	MiniMap 	 	= "maps\\worldmaps\\n2_mini.dds",
    loadingImage 	= "",		--进入世界时加载的地图
}

Instance[41] = --id
{
	name			= _t"修行地",
	idZone 			= 0,
	path			= "n1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\n1.dds",
	rectMap		    = {-504, 503, 504, -503},
	validRegion		= {0, 0, 1024, 1024},
	MiniMap 	 	= "maps\\worldmaps\\n1_mini.dds",
    loadingImage 	= "",		--进入世界时加载的地图
}

Instance[42] = --id
{
	name			= _t"修行地",
	idZone 			= 0,
	path			= "n7",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\n7.dds",
	rectMap		    = {-504, 503, 504, -503},
	validRegion		= {0, 0, 1024, 1024},
	MiniMap 	 	= "maps\\worldmaps\\e11_mini.dds",
    loadingImage 	= "",		--进入世界时加载的地图
}

Instance[43] = --id
{
	name			= _t"修行地",
	idZone 			= 0,
	path			= "n3",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\n3.dds",
	rectMap		    = {-504, 503, 504, -503},
	validRegion		= {0, 0, 1024, 1024},
	MiniMap 	 	= "maps\\worldmaps\\n3_mini.dds",
    loadingImage 	= "",		--进入世界时加载的地图
}

Instance[44] = --id
{
	name			= _t"修行地",
	idZone 			= 0,
	path			= "n9",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\n1.dds",
	rectMap		    = {-504, 503, 504, -503},
	validRegion		= {0, 0, 1024, 1024},
	MiniMap 	 	= "maps\\worldmaps\\n1_mini.dds",
    loadingImage 	= "",		--进入世界时加载的地图
}

Instance[45] = --id
{
	name			= _t"修行地",
	idZone 			= 0,
	path			= "n6",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\n6.dds",
	rectMap		    = {-504, 503, 504, -503},
	validRegion		= {0, 0, 1024, 1024},
	MiniMap 	 	= "maps\\worldmaps\\n6_mini.dds",
    loadingImage 	= "",		--进入世界时加载的地图
}

Instance[47] = --id
{
	name			= _t"幻境一",
	idZone 			= 0,
	path			= "n1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\n1.dds",
	rectMap		    = {-504, 503, 504, -503},
	validRegion		= {0, 0, 1024, 1024},
	MiniMap 	 	= "maps\\worldmaps\\n1_mini.dds",
    loadingImage 	= "",		--进入世界时加载的地图

}

Instance[48] = --id
{
	name			= _t"幻境二",
	idZone 			= 0,
	path			= "n1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\n1.dds",
	rectMap		    = {-504, 503, 504, -503},
	validRegion		= {0, 0, 1024, 1024},
	MiniMap 	 	= "maps\\worldmaps\\n1_mini.dds",
    loadingImage 	= "",		--进入世界时加载的地图

}

Instance[49] = --id
{
	name			= _t"幻境四",
	idZone 			= 0,
	path			= "n1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\n1.dds",
	rectMap		    = {-504, 503, 504, -503},
	validRegion		= {0, 0, 1024, 1024},
	MiniMap 	 	= "maps\\worldmaps\\n1_mini.dds",
    loadingImage 	= "",		--进入世界时加载的地图

}

Instance[50] = --id
{
	name			= _t"女神之殿",
	idZone 			= 0,
	path			= "n50",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置

	worldMap        = "maps\\worldmaps\\n50.dds",
	MiniMap 	 	= "maps\\worldmaps\\n50_mini.dds",
	rectMap		    = {-404, 311, -177, 84},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[51] = --id
{
	name			= _t"第一届跨服竞技赛场1",
	idZone 			= 0,
	path			= "b1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	iFlyMaxHeight = 600, -- 最大飞行高度
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\b1.dds",
	MiniMap 	 	= "maps\\worldmaps\\b1_mini.dds",
	rectMap		    = {-382, 395, 471, -458},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[52] = --id
{
	name			= _t"第一届跨服竞技赛场2",
	idZone 			= 0,
	path			= "b1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	iFlyMaxHeight = 600, -- 最大飞行高度
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\b1.dds",
	MiniMap 	 	= "maps\\worldmaps\\b1_mini.dds",
	rectMap		    = {-382, 395, 471, -458},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[53] = --id
{
	name			= _t"第一届跨服竞技赛场3",
	idZone 			= 0,
	path			= "b1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	iFlyMaxHeight = 600, -- 最大飞行高度
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\b1.dds",
	MiniMap 	 	= "maps\\worldmaps\\b1_mini.dds",
	rectMap		    = {-382, 395, 471, -458},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[54] = --id
{
	name			= _t"第一届跨服竞技赛场4",
	idZone 			= 0,
	path			= "b1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	iFlyMaxHeight = 600, -- 最大飞行高度
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\b1.dds",
	MiniMap 	 	= "maps\\worldmaps\\b1_mini.dds",
	rectMap		    = {-382, 395, 471, -458},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[55] = --id
{
	name			= _t"第一届跨服竞技赛场5",
	idZone 			= 0,
	path			= "b1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	iFlyMaxHeight = 600, -- 最大飞行高度
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\b1.dds",
	MiniMap 	 	= "maps\\worldmaps\\b1_mini.dds",
	rectMap		    = {-382, 395, 471, -458},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[56] = --id
{
	name			= _t"第一届跨服竞技赛场6",
	idZone 			= 0,
	path			= "b1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	iFlyMaxHeight = 600, -- 最大飞行高度
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\b1.dds",
	MiniMap 	 	= "maps\\worldmaps\\b1_mini.dds",
	rectMap		    = {-382, 395, 471, -458},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[57] = --id
{
	name			= _t"第一届跨服竞技赛场7",
	idZone 			= 0,
	path			= "b1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	iFlyMaxHeight = 600, -- 最大飞行高度
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\b1.dds",
	MiniMap 	 	= "maps\\worldmaps\\b1_mini.dds",
	rectMap		    = {-382, 395, 471, -458},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[58] = --id
{
	name			= _t"第一届跨服竞技赛场8",
	idZone 			= 0,
	path			= "b1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	iFlyMaxHeight = 600, -- 最大飞行高度
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\b1.dds",
	MiniMap 	 	= "maps\\worldmaps\\b1_mini.dds",
	rectMap		    = {-382, 395, 471, -458},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[59] = --id
{
	name			= _t"第一届跨服竞技赛场9",
	idZone 			= 0,
	path			= "b1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	iFlyMaxHeight = 600, -- 最大飞行高度
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\b1.dds",
	MiniMap 	 	= "maps\\worldmaps\\b1_mini.dds",
	rectMap		    = {-382, 395, 471, -458},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[60] = --id
{
	name			= _t"跨服主城",
	idZone 			= 0,
	path			= "n2",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	iFlyMaxHeight = 450, -- 最大飞行高度
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\n2.dds",
	rectMap		    = {-504, 503, 504, -503},
	validRegion		= {0, 0, 1024, 1024},
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n2_cloud.dds",
	domainFile      = "data\\n2.dat",
	MiniMap 	 	= "maps\\worldmaps\\n2_mini.dds",
    loadingImage 	= "",		--进入世界时加载的地图
}

Instance[61] = --id
{
	name			= _t"冥界入侵",
	idZone 			= 0,
	path			= "n8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	fixTime         = 12, -- 设置固定时间
    showSunMoon     = false, -- 设置是否显示太阳月亮
    worldMap        = "maps\\worldmaps\\n8.dds",
	MiniMap 	 	= "maps\\worldmaps\\n8_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n8_cloud.dds",
	domainFile      = "data\\n8.dat",
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[62] = --id
{
	name			= _t"终焉之地", --星座升华任务
	idZone 			= 0,
	path			= "n2",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置
    fixTime         = 12, -- 设置固定时间
    showSunMoon     = true, -- 设置是否显示太阳月亮
	worldMap        = "maps\\worldmaps\\n2.dds",
	MiniMap 	 	= "maps\\worldmaps\\n2_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[63] = --id
{
	name			= _t"冥界地狱",
	idZone			= 0,
	path			= "n11",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 2,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	precinct		= "maps\\n11\\63n11\\precinct.clt",
	region			= "maps\\n11\\63n11\\region.clt",
	fixTime         = 0, -- 设置固定时间
    showSunMoon     = false, -- 设置是否显示太阳月亮
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n11_cloud.dds",
	domainFile      = "data\\n11.dat",
	worldMap        = "maps\\worldmaps\\n11.dds",
	MiniMap 	 	= "maps\\worldmaps\\n11.dds",
	rectMap		    = {-1024, 1024, 1024, -1024},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[64] = --id
{
	name			= _t"极乐净土",
	idZone			= 0,
	path			= "n12",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 2,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	precinct		= "maps\\n12\\64n12\\precinct.clt",
	region			= "maps\\n12\\64n12\\region.clt",
	fixTime         = 0, -- 设置固定时间
    showSunMoon     = false, -- 设置是否显示太阳月亮
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n12_cloud.dds",
	domainFile      = "data\\n12.dat",
	worldMap        = "maps\\worldmaps\\n12.dds",
	MiniMap 	 	= "maps\\worldmaps\\n12.dds",
	rectMap		    = {-512,512,512,-512},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[65] = --id
{
	name			= _t"修行地",
	idZone 			= 0,
	path			= "n1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\n1.dds",
	rectMap		    = {-504, 503, 504, -503},
	validRegion		= {0, 0, 1024, 1024},
	MiniMap 	 	= "maps\\worldmaps\\n1_mini.dds",
    loadingImage 	= "",		--进入世界时加载的地图
}

Instance[66] = --id
{
	name			= _t"巨蟹！僵尸来了！",
	idZone 			= 0,
	path			= "n10",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n10_cloud.dds",
	domainFile      = "data\\n10.dat",
	worldMap        = "maps\\worldmaps\\n10.dds",
	MiniMap 	 	= "maps\\worldmaps\\n10.dds",
	rectMap		    = {-512, 512, 512, -512},
	loadingImage 	= "",		--进入世界时加载的地图

}

Instance[101] = --id
{
	name			= _t"军团基地",
	idZone 			= 0,
	path			= "l2",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置
	nLeagueBase		= 5,

	worldMap        = "maps\\worldmaps\\l2.dds",
	MiniMap 	 	= "maps\\worldmaps\\l2_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
		    marks   	 	=
	{
		[1] = { id=8545,		desc=_t"基地商店管理员",   image="maps\\MiniMapMark\\出售商品.tga"},
		[2] = { id=8533,		desc=_t"基地仓库管理员",   image="maps\\MiniMapMark\\仓储.tga"},
		[3] = { id=8579,	desc=_t"基地奇迹", 	image="maps\\MiniMapMark\\时空漩涡.tga"},
		[4] = { id=17857,	desc=_t"军团修炼师", 	image="maps\\MiniMapMark\\学职业技能.tga"},

	},
}

Instance[102] = --id
{
	name			= _t"军团战场",
	idZone 			= 0,
	path			= "l2",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置
	nLeagueBase		= 5,

	worldMap        = "maps\\worldmaps\\l2.dds",
	MiniMap 	 	= "maps\\worldmaps\\l2_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
    --[[
    marks = -- 地图标记，只有显隐，不能变换状态
    {
		[1] = { id = 26162, desc="中立传送点", image = "maps\\MiniMapMark\\奇迹小.png",},
		[2] = { id = 26163, desc="蓝方占领", image = "maps\\MiniMapMark\\奇迹蓝小.png",},
		[3] = { id = 26164, desc="蓝方占领", image = "maps\\MiniMapMark\\奇迹蓝小.png",},
		[4] = { id = 26165, desc="蓝方传送门", image = "maps\\MiniMapMark\\训练场蓝小.png",},
		[5] = { id = 26166, desc="红方占领", image = "maps\\MiniMapMark\\奇迹红小.png",},
		[6] = { id = 26167, desc="红方占领", image = "maps\\MiniMapMark\\奇迹红小.png",},
		[7] = { id = 26168, desc="红方传送门", image = "maps\\MiniMapMark\\训练场红小.png",},
    },
    --]]
	marks_ex   	 	=		-- 地图高级标记，可变换状态
	{
		[1] = { id={15615,21808,21809,21810,21811,21812,21813,21814,21815,},		
                desc=_t"蓝方大厅",   
				images={[1] = "maps\\MiniMapMark\\大厅蓝色.png",
						[2] = "maps\\MiniMapMark\\大厅中立.png",
						[3] = "maps\\MiniMapMark\\建筑废墟.png",},
				image_s={[1] = "maps\\MiniMapMark\\大厅蓝小.png",
						 [2] = "maps\\MiniMapMark\\大厅小.png",
						 [3] = "maps\\MiniMapMark\\废墟小.png",},
				},
		[2] = { id={15616,21817,21818,21819,21820,21821,21822,21823,21824,},		
                desc=_t"蓝方仓库",   
				images={[1] = "maps\\MiniMapMark\\仓库蓝色.png",
						[2] = "maps\\MiniMapMark\\仓库中立.png",
						[3] = "maps\\MiniMapMark\\建筑废墟.png",},
				image_s={[1] = "maps\\MiniMapMark\\仓库蓝小.png",
						 [2] = "maps\\MiniMapMark\\仓库小.png",
						 [3] = "maps\\MiniMapMark\\废墟小.png",},
				},
		[3] = { id={15617,21825,21826,21827,21828,21829,21830,21831,21832,},		
                desc=_t"蓝方商店",   
				images={[1] = "maps\\MiniMapMark\\商店蓝色.png",
						[2] = "maps\\MiniMapMark\\商店中立.png",
						[3] = "maps\\MiniMapMark\\建筑废墟.png",},
				image_s={[1] = "maps\\MiniMapMark\\商店蓝小.png",
						 [2] = "maps\\MiniMapMark\\商店小.png",
						 [3] = "maps\\MiniMapMark\\废墟小.png",},
				},
		[4] = { id={15618,21833,21834,21835,21836,21837,21838,21839,21840,},		
                desc=_t"蓝方训练场",   
				images={[1] = "maps\\MiniMapMark\\训练场蓝色.png",
						[2] = "maps\\MiniMapMark\\训练场中立.png",
						[3] = "maps\\MiniMapMark\\建筑废墟.png",},
				image_s={[1] = "maps\\MiniMapMark\\训练场蓝小.png",
						 [2] = "maps\\MiniMapMark\\训练场小.png",
						 [3] = "maps\\MiniMapMark\\废墟小.png",},
				},
		[5] = { id={15619,21841,21842,21843,21844,21845,21846,21847,21848,},		
                desc=_t"蓝方车间",   
				images={[1] = "maps\\MiniMapMark\\车间蓝色.png",
						[2] = "maps\\MiniMapMark\\车间普通.png",
						[3] = "maps\\MiniMapMark\\建筑废墟.png",},
				image_s={[1] = "maps\\MiniMapMark\\车间蓝小.png",
						 [2] = "maps\\MiniMapMark\\车间小.png",
						 [3] = "maps\\MiniMapMark\\废墟小.png",},
				},
		[6] = { id={15620,21849,21850,21851,21852,21853,21854,21855,21856,},		
                desc=_t"蓝方祭坛",   
				images={[1] = "maps\\MiniMapMark\\祭坛蓝色.png",
						[2] = "maps\\MiniMapMark\\祭坛中立.png",
						[3] = "maps\\MiniMapMark\\建筑废墟.png",},
				image_s={[1] = "maps\\MiniMapMark\\祭坛蓝小.png",
						 [2] = "maps\\MiniMapMark\\祭坛小.png",
						 [3] = "maps\\MiniMapMark\\废墟小.png",},
				},
		[7] = { id={15621,21857,21858,21859,21860,21861,21862,21863,21864,},		
                desc=_t"蓝方奇迹",   
				images={[1] = "maps\\MiniMapMark\\奇迹蓝色.png",
						[2] = "maps\\MiniMapMark\\奇迹普通.png",
						[3] = "maps\\MiniMapMark\\建筑废墟.png",},
				image_s={[1] = "maps\\MiniMapMark\\奇迹蓝小.png",
					 	 [2] = "maps\\MiniMapMark\\奇迹小.png",
						 [3] = "maps\\MiniMapMark\\废墟小.png",},
				},
		[8] = { id={18417,21921,21922,21923,21924,21925,21926,21927,21928,},		
                desc=_t"蓝方右侧门",   
				images={[1] = "maps\\MiniMapMark\\城门蓝色.png",
						[2] = "maps\\MiniMapMark\\城门中立.png",
						[3] = "maps\\MiniMapMark\\建筑废墟.png",},
				image_s={[1] = "maps\\MiniMapMark\\城门蓝小.png",
						 [2] = "maps\\MiniMapMark\\城门小.png",
						 [3] = "maps\\MiniMapMark\\废墟小.png",},
				},
		[9] = { id={18418,21929,21930,21931,21932,21933,21934,21935,21936,},		
                desc=_t"蓝方中门",   
				images={[1] = "maps\\MiniMapMark\\城门蓝色.png",
						[2] = "maps\\MiniMapMark\\城门中立.png",
						[3] = "maps\\MiniMapMark\\建筑废墟.png",},
				image_s={[1] = "maps\\MiniMapMark\\城门蓝小.png",
					 	 [2] = "maps\\MiniMapMark\\城门小.png",
					 	 [3] = "maps\\MiniMapMark\\废墟小.png",},
				},
		[10] = {id={18419,21937,21938,21939,21940,21941,21942,21943,21944,},		
                desc=_t"蓝放左侧门",   
				images={[1] = "maps\\MiniMapMark\\城门蓝色.png",
						[2] = "maps\\MiniMapMark\\城门中立.png",
						[3] = "maps\\MiniMapMark\\建筑废墟.png",},
				image_s={[1] = "maps\\MiniMapMark\\城门蓝小.png",
						 [2] = "maps\\MiniMapMark\\城门小.png",
					 	 [3] = "maps\\MiniMapMark\\废墟小.png",},
				},
		[11] = { id={15622,21865,21866,21867,21868,21869,21870,21871,21872,},
                desc=_t"红方大厅",   
				images={[1] = "maps\\MiniMapMark\\大厅红色.png",
						[2] = "maps\\MiniMapMark\\大厅中立.png",
						[3] = "maps\\MiniMapMark\\建筑废墟.png",},
				image_s={[1] = "maps\\MiniMapMark\\大厅红小.png",
						 [2] = "maps\\MiniMapMark\\大厅小.png",
						 [3] = "maps\\MiniMapMark\\废墟小.png",},
				},
		[12] = { id={15623,21873,21874,21875,21876,21877,21878,21879,21880,},
                desc=_t"红方仓库",   
				images={[1] = "maps\\MiniMapMark\\仓库红色.png",
						[2] = "maps\\MiniMapMark\\仓库中立.png",
						[3] = "maps\\MiniMapMark\\建筑废墟.png",},
				image_s={[1] = "maps\\MiniMapMark\\仓库红小.png",
						 [2] = "maps\\MiniMapMark\\仓库小.png",
						 [3] = "maps\\MiniMapMark\\废墟小.png",},
				},
		[13] = { id={15624,21881,21882,21883,21884,21885,21886,21887,21888,},		
                desc=_t"红方商店",   
				images={[1] = "maps\\MiniMapMark\\商店红色.png",
						[2] = "maps\\MiniMapMark\\商店中立.png",
						[3] = "maps\\MiniMapMark\\建筑废墟.png",},
				image_s={[1] = "maps\\MiniMapMark\\商店红小.png",
						 [2] = "maps\\MiniMapMark\\商店小.png",
						 [3] = "maps\\MiniMapMark\\废墟小.png",},
				},
		[14] = { id={15625,21889,21890,21891,21892,21893,21894,21895,21896,},		
                desc=_t"红方训练场",   
				images={[1] = "maps\\MiniMapMark\\训练场红色.png",
						[2] = "maps\\MiniMapMark\\训练场中立.png",
						[3] = "maps\\MiniMapMark\\建筑废墟.png",},
				image_s={[1] = "maps\\MiniMapMark\\训练场红小.png",
						 [2] = "maps\\MiniMapMark\\训练场小.png",
						 [3] = "maps\\MiniMapMark\\废墟小.png",},
				},
		[15] = { id={15626,21897,21898,21899,21900,21901,21902,21903,21904,},		
                desc=_t"红方车间",   
				images={[1] = "maps\\MiniMapMark\\车间红色.png",
						[2] = "maps\\MiniMapMark\\车间普通.png",
						[3] = "maps\\MiniMapMark\\建筑废墟.png",},
				image_s={[1] = "maps\\MiniMapMark\\车间红小.png",
						 [2] = "maps\\MiniMapMark\\车间小.png",
						 [3] = "maps\\MiniMapMark\\废墟小.png",},
				},
		[16] = { id={15627,21905,21906,21907,21908,21909,21910,21911,21912,},		
                desc=_t"红方祭坛",   
				images={[1] = "maps\\MiniMapMark\\祭坛红色.png",
						[2] = "maps\\MiniMapMark\\祭坛中立.png",
						[3] = "maps\\MiniMapMark\\建筑废墟.png",},
				image_s={[1] = "maps\\MiniMapMark\\祭坛红小.png",
						 [2] = "maps\\MiniMapMark\\祭坛小.png",
						 [3] = "maps\\MiniMapMark\\废墟小.png",},
				},
		[17] = { id={15628,21913,21914,21915,21916,21917,21918,21919,21920,},	
                desc=_t"红方奇迹",   
				images={[1] = "maps\\MiniMapMark\\奇迹红色.png",
						[2] = "maps\\MiniMapMark\\奇迹普通.png",
						[3] = "maps\\MiniMapMark\\建筑废墟.png",},
				image_s={[1] = "maps\\MiniMapMark\\奇迹红小.png",
						 [2] = "maps\\MiniMapMark\\奇迹小.png",
						 [3] = "maps\\MiniMapMark\\废墟小.png",},
				},
		[18] = { id={18420,21945,21946,21947,21948,21949,21950,21951,21952,},		
                desc=_t"红方右侧门",   
				images={[1] = "maps\\MiniMapMark\\城门红色.png",
						[2] = "maps\\MiniMapMark\\城门中立.png",
						[3] = "maps\\MiniMapMark\\建筑废墟.png",},
				image_s={[1] = "maps\\MiniMapMark\\城门红小.png",
						 [2] = "maps\\MiniMapMark\\城门小.png",
						 [3] = "maps\\MiniMapMark\\废墟小.png",},
				},
		[19] = { id={18421,21953,21954,21955,21956,21957,21958,21959,21960,},		
                desc=_t"红方中门",   
				images={[1] = "maps\\MiniMapMark\\城门红色.png",
						[2] = "maps\\MiniMapMark\\城门中立.png",
						[3] = "maps\\MiniMapMark\\建筑废墟.png",},
				image_s={[1] = "maps\\MiniMapMark\\城门红小.png",
						 [2] = "maps\\MiniMapMark\\城门小.png",
						 [3] = "maps\\MiniMapMark\\废墟小.png",},
				},
		[20] = { id={18422,21961,21962,21963,21964,21965,21966,21967,21968,},		
                desc=_t"红方左侧门",   
				images={[1] = "maps\\MiniMapMark\\城门红色.png",
						[2] = "maps\\MiniMapMark\\城门中立.png",
						[3] = "maps\\MiniMapMark\\建筑废墟.png",},
				image_s={[1] = "maps\\MiniMapMark\\城门红小.png",
						 [2] = "maps\\MiniMapMark\\城门小.png",
						 [3] = "maps\\MiniMapMark\\废墟小.png",},
				},
	},
}

Instance[206] = --id
{
	name			= _t"十风穴",
	idZone 			= 0,
	path			= "f6",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\f6.dds",
	MiniMap 	 	= "maps\\worldmaps\\f6_mini.dds",
	rectMap		    = {-422, 418, 378, -382},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}


Instance[207] = --id
{
	name			= _t"射手之心",
	idZone 			= 0,
	path			= "f7",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\f7.dds",
	MiniMap 	 	= "maps\\worldmaps\\f7_mini.dds",
	rectMap		    = {-238, 449, 455, -244},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}


Instance[208] = --id
{
	name			= _t"黄金十二宫",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}

Instance[209] = --id
{
	name			= _t"冰海神殿",
	idZone 			= 0,
	path			= "f9",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\f9.dds",
	MiniMap 	 	= "maps\\worldmaps\\f9.dds",
	rectMap		    = {-458, 440, 78, -96},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[210] = --id
{
	name			= _t"七大洋巨柱",
	idZone 			= 0,
	path			= "f10",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\f10.dds",
	MiniMap 	 	= "maps\\worldmaps\\f10_mini.dds",
	rectMap		    = {-475, 486, 453, -442},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[211] = --id
{
	name			= _t"黄金十二宫",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}

Instance[212] = --id
{
	name			= _t"黄金十二宫",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}

Instance[213] = --id
{
	name			= _t"女神的挽歌",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
    fixTime         = 23, -- 设置固定时间
    showSunMoon     = true, -- 设置是否显示太阳月亮
    worldMap        = "maps\\worldmaps\\f8_11.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_11.dds",
	rectMap		    = {-276, -1024, 748, -2048},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠

	    [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
}

Instance[214] = --id
{
	name			= _t"黄金十二宫",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
    fixTime         = 23, -- 设置固定时间
    showSunMoon     = true, -- 设置是否显示太阳月亮
	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
		[20814] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_12.dds",
    	rectMap  	 = {266, 0, 1014, -748},
        MiniMap 	 = "maps\\worldmaps\\f8_12.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}

Instance[215] = --id
{
	name			= _t"黄金十二宫",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}
Instance[216] = --id
{
	name			= _t"英雄十风穴",
	idZone 			= 0,
	path			= "f6",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\f6.dds",
	MiniMap 	 	= "maps\\worldmaps\\f6_mini.dds",
	rectMap		    = {-422, 418, 378, -382},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[217] = --id
{
	name			= _t"英雄射手之心",
	idZone 			= 0,
	path			= "f7",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\f7.dds",
	MiniMap 	 	= "maps\\worldmaps\\f7_mini.dds",
	rectMap		    = {-238, 449, 455, -244},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}
Instance[218] = --id
{
    name			= _t"英雄蓝冰堡",
	idZone 			= 0,
	path			= "n7",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	region			= "maps\\n7\\218f18\\region.clt",
    worldMap        = "maps\\worldmaps\\f18.dds",
	rectMap		    = {14, 570, 438, 146},
	validRegion		= {0, 0, 1024, 1024},
	MiniMap 	 	= "maps\\worldmaps\\f18.dds",
    loadingImage 	= "",		--进入世界时加载的地图
}
Instance[219] =
{
    name			= _t"英雄哈迪斯城",
	idZone 			= 0,
	path			= "n10",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\n10.dds",
	rectMap		    = {14, 570, 438, 146},
	validRegion		= {0, 0, 1024, 1024},
	MiniMap 	 	= "maps\\worldmaps\\n10.dds",
    loadingImage 	= "",		--进入世界时加载的地图
}

Instance[301] = --id
{
	name			= _t"星辰的史诗",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
	   [20814] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_12.dds",
    	rectMap  	 = {266, 0, 1014, -748},
        MiniMap 	 = "maps\\worldmaps\\f8_12.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}

Instance[302] = --id
{
	name			= _t"黄泉之井的镇魂曲！",
	idZone 			= 0,
	path			= "n2",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置

	worldMap        = "maps\\worldmaps\\n2.dds",
	MiniMap 	 	= "maps\\worldmaps\\n2_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
}


Instance[303] = --id
{
	name			= _t"激斗！黄金十二宫！",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-1024, 0, 0, -1024},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_4.dds",
    	rectMap  	 = {0, 0, 1024, -1024},
        MiniMap 	 = "maps\\worldmaps\\f8_4.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}

Instance[304] = --id
{
	name			= _t"战斗！银河擂台赛！",
	idZone 			= 0,
	path			= "n4",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\n4.dds",
	MiniMap 	 	= "maps\\worldmaps\\n4_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[305] = --id
{
	name			= _t"决战！十风穴的死斗！",
	idZone 			= 0,
	path			= "f6",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置

	worldMap        = "maps\\worldmaps\\f6.dds",
	MiniMap 	 	= "maps\\worldmaps\\f6_mini.dds",
	rectMap		    = {-422, 418, 378, -382},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[306] = --id
{
	name			= _t"决裂！龙与虎！",
	idZone 			= 0,
	path			= "n3",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\n3.dds",
	rectMap		    = {-504, 503, 504, -503},
	validRegion		= {0, 0, 1024, 1024},
	MiniMap 	 	= "maps\\worldmaps\\n3_mini.dds",
    loadingImage 	= "",		--进入世界时加载的地图

}

Instance[307] = --id
{
	name			= _t"脱出！黄泉比良坂！",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置

	worldMap        = "maps\\worldmaps\\f8_1.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_1.dds",
	rectMap		    = {-997, 446, -605, 54},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[308] = --id
{
	name			= _t"回忆！十三年前的真相！",
	idZone 			= 0,
	path			= "f7",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置

	worldMap        = "maps\\worldmaps\\f7.dds",
	MiniMap 	 	= "maps\\worldmaps\\f7_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[309] = --id
{
	name			= _t"阴谋！欺瞒神的男人！",
	idZone 			= 0,
	path			= "n5",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置

	worldMap        = "maps\\worldmaps\\n5.dds",
	MiniMap 	 	= "maps\\worldmaps\\n5_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[310] = --id
{
	name			= _t"再战！重返观星楼！",
	idZone 			= 0,
	path			= "n1",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置

	worldMap        = "maps\\worldmaps\\n1.dds",
	MiniMap 	 	= "maps\\worldmaps\\n1_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[311] = --id
{
	name			= _t"开始！圣衣竞技赛！",
	idZone 			= 0,
	path			= "n1",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置

	worldMap        = "maps\\worldmaps\\n1.dds",
	MiniMap 	 	= "maps\\worldmaps\\n1_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[312] = --id
{
	name			= _t"突破！异次元空间！",
	idZone 			= 0,
	path			= "d2",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\f8_3.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_3.dds",
	rectMap		    = {-84, 206.5, 47.5, 75},
	loadingImage 	= "",		--进入世界时加载的地图

}

Instance[313] = --id
{

	name			= _t"突破！异次元空间！",
	idZone 			= 0,
	path			= "d2",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\f8_3.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_3.dds",
	rectMap		    = {-84, 206.5, 47.5, 75},
	loadingImage 	= "",		--进入世界时加载的地图


}

Instance[314] = --id
{
	name			= _t"突破！异次元空间！",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-1024, 0, 0, -1024},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_4.dds",
    	rectMap  	 = {0, 0, 1024, -1024},
        MiniMap 	 = "maps\\worldmaps\\f8_4.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}

Instance[315] = --id
{
	name			= _t"突破！异次元空间！",
	idZone 			= 0,
	path			= "d2",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\f8_3.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_3.dds",
	rectMap		    = {-84, 206.5, 47.5, 75},
	loadingImage 	= "",		--进入世界时加载的地图

}

Instance[316] = --id
{
	name			= _t"突破！异次元空间！",
	idZone 			= 0,
	path			= "d2",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\f8_3.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_3.dds",
	rectMap		    = {-84, 206.5, 47.5, 75},
	loadingImage 	= "",		--进入世界时加载的地图

}


Instance[317] = --id
{
	name			= _t"危急！狮子的困境!",
	idZone 			= 0,
	path			= "n2",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置

	worldMap        = "maps\\worldmaps\\n2.dds",
	MiniMap 	 	= "maps\\worldmaps\\n2_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[318] = --id
{
	name			= _t"回忆！新生的凤凰！",
	idZone 			= 0,
	path			= "n6",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	iFlyMaxHeight = 600, -- 最大飞行高度
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\n6.dds",
	MiniMap 	 	= "maps\\worldmaps\\n6_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[319] = --id
{
	name			= _t"破灭！黑之幻魔拳！",
	idZone 			= 0,
	path			= "n6",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	iFlyMaxHeight = 600, -- 最大飞行高度
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\n6.dds",
	MiniMap 	 	= "maps\\worldmaps\\n6_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[320] = --id
{
	name			= _t"崩坏！七海之柱！",
	idZone 			= 0,
	path			= "f10",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	iFlyMaxHeight = 600, -- 最大飞行高度
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\f10.dds",
	MiniMap 	 	= "maps\\worldmaps\\f10_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[321] = --id
{
	name			= _t"冰河回忆",
	idZone 			= 0,
	path			= "n7",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 2,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
        worldMap        = "maps\\worldmaps\\n7.dds",
	MiniMap 	 	= "maps\\worldmaps\\n7_mini.dds",
	rectMap		    = {-512, 512, 512, -512},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[322] = --id
{
	name			= _t"危急！女神中箭！",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
    fixTime         = 8, -- 设置固定时间
    showSunMoon     = true, -- 设置是否显示太阳月亮
	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图
	
		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
	   [20814] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_12.dds",
    	rectMap  	 = {266, 0, 1014, -748},
        MiniMap 	 = "maps\\worldmaps\\f8_12.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}

Instance[323] = --id
{
	name			= _t"恶战！黄金野牛之拳！",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
    fixTime         = 9, -- 设置固定时间
    showSunMoon     = true, -- 设置是否显示太阳月亮
	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
	   [20814] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_12.dds",
    	rectMap  	 = {266, 0, 1014, -748},
        MiniMap 	 = "maps\\worldmaps\\f8_12.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}

Instance[324] = --id
{
	name			= _t"正邪！双子的困惑！",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
    fixTime         = 10, -- 设置固定时间
    showSunMoon     = true, -- 设置是否显示太阳月亮
	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
	   [20814] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_12.dds",
    	rectMap  	 = {266, 0, 1014, -748},
        MiniMap 	 = "maps\\worldmaps\\f8_12.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}

Instance[325] = --id
{
	name			= _t"恐怖！万恶的巨蟹宫！",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
    fixTime         = 11, -- 设置固定时间
    showSunMoon     = true, -- 设置是否显示太阳月亮
	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
	   [20814] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_12.dds",
    	rectMap  	 = {266, 0, 1014, -748},
        MiniMap 	 = "maps\\worldmaps\\f8_12.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}


Instance[326] = --id
{
	name			= _t"苏醒！噩梦中的雄狮！",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
    fixTime         = 12, -- 设置固定时间
    showSunMoon     = true, -- 设置是否显示太阳月亮
	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图
		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
	   [20814] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_12.dds",
    	rectMap  	 = {266, 0, 1014, -748},
        MiniMap 	 = "maps\\worldmaps\\f8_12.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}


Instance[327] = --id
{
	name			= _t"沙加！接近神的男人！",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
    fixTime         = 13, -- 设置固定时间
    showSunMoon     = true, -- 设置是否显示太阳月亮
	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
	   [20814] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_12.dds",
    	rectMap  	 = {266, 0, 1014, -748},
        MiniMap 	 = "maps\\worldmaps\\f8_12.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}


Instance[328] = --id
{
	name			= _t"极寒！冰封的天秤宫！",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
    fixTime         = 14, -- 设置固定时间
    showSunMoon     = true, -- 设置是否显示太阳月亮
	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
	   [20814] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_12.dds",
    	rectMap  	 = {266, 0, 1014, -748},
        MiniMap 	 = "maps\\worldmaps\\f8_12.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}

Instance[329] = --id
{
	name			= _t"禁断！死亡的天蝎宫！",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
    fixTime         = 15, -- 设置固定时间
    showSunMoon     = true, -- 设置是否显示太阳月亮
	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
	   [20814] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_12.dds",
    	rectMap  	 = {266, 0, 1014, -748},
        MiniMap 	 = "maps\\worldmaps\\f8_12.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}

Instance[330] = --id
{
	name			= _t"考验！射手的托付！",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
    fixTime         = 16, -- 设置固定时间
    showSunMoon     = true, -- 设置是否显示太阳月亮
	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
	   [20814] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_12.dds",
    	rectMap  	 = {266, 0, 1014, -748},
        MiniMap 	 = "maps\\worldmaps\\f8_12.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}


Instance[331] = --id
{
	name			= _t"修罗！拥有圣剑的男人！",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
    fixTime         = 17, -- 设置固定时间
    showSunMoon     = true, -- 设置是否显示太阳月亮
	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
	   [20814] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_12.dds",
    	rectMap  	 = {266, 0, 1014, -748},
        MiniMap 	 = "maps\\worldmaps\\f8_12.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}


Instance[332] = --id
{
	name			= _t"究极冻气！绝对零度！",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
    fixTime         = 18, -- 设置固定时间
    showSunMoon     = true, -- 设置是否显示太阳月亮
	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图
		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
	   [20814] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_12.dds",
    	rectMap  	 = {266, 0, 1014, -748},
        MiniMap 	 = "maps\\worldmaps\\f8_12.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}


Instance[333] = --id
{
	name			= _t"玫瑰葬礼！决战教皇！",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
    fixTime         = 18, -- 设置固定时间
    showSunMoon     = true, -- 设置是否显示太阳月亮
	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-963, 120, 301, -1144},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
	   [20814] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_12.dds",
    	rectMap  	 = {266, 0, 1014, -748},
        MiniMap 	 = "maps\\worldmaps\\f8_12.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}

Instance[334] = --id
{
	name			= _t"终结！决战教皇厅！",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
    fixTime         = 19, -- 设置固定时间
    showSunMoon     = true, -- 设置是否显示太阳月亮
	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-1024, 0, 0, -1024},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_4.dds",
    	rectMap  	 = {0, 0, 1024, -1024},
        MiniMap 	 = "maps\\worldmaps\\f8_4.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}

Instance[335] = --id
{
	name			= _t"女神！仲夏的神祈！",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-1024, 0, 0, -1024},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_4.dds",
    	rectMap  	 = {0, 0, 1024, -1024},
        MiniMap 	 = "maps\\worldmaps\\f8_4.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}

Instance[336] = --id
{
	name			= _t"守护！仲夏节祈福！（高级）",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-1024, 0, 0, -1024},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_4.dds",
    	rectMap  	 = {0, 0, 1024, -1024},
        MiniMap 	 = "maps\\worldmaps\\f8_4.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}

Instance[337] = --id
{
	name			= _t"极限！天魔降服的考验",
	idZone 			= 0,
	path			= "n3",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	iFlyMaxHeight = 450, -- 最大飞行高度	
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\n3.dds",
	rectMap		    = {-500, 420, 397, -477},
	validRegion		= {0, 0, 1024, 1024},
	worldMapCloud   = "maps\\worldmaps\\n3_cloud.dds",
	MiniMap 	 	= "maps\\worldmaps\\n3_mini.dds",
    loadingImage 	= "",		--进入世界时加载的地图
}

Instance[338] = --id
{
	name			= _t"七夕！紫龙和春丽！",
	idZone 			= 0,
	path			= "n2",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置
    fixTime         = 20, -- 设置固定时间
    showSunMoon     = false, -- 设置是否显示太阳月亮
	worldMap        = "maps\\worldmaps\\n2.dds",
	MiniMap 	 	= "maps\\worldmaps\\n2_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[339] = --id
{
	name			= _t"沙罗双树园",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-1024, 0, 0, -1024},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_4.dds",
    	rectMap  	 = {0, 0, 1024, -1024},
        MiniMap 	 = "maps\\worldmaps\\f8_4.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}

Instance[340] = --id
{
	name			= _t"天秤！童虎的回忆", --月度活动天秤【天秤！童虎的回忆】
	idZone 			= 0,
	path			= "n2",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置
    fixTime         = 21, -- 设置固定时间
    showSunMoon     = true, -- 设置是否显示太阳月亮
	worldMap        = "maps\\worldmaps\\n2.dds",
	MiniMap 	 	= "maps\\worldmaps\\n2_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[341] = --id
{
	name			= _t"突破！天蝎的试炼",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-1024, 0, 0, -1024},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_4.dds",
    	rectMap  	 = {0, 0, 1024, -1024},
        MiniMap 	 = "maps\\worldmaps\\f8_4.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}

Instance[342] = --id
{
	name			= _t"逼近！射手的危机",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
    fixTime         = 18, -- 设置固定时间
    showSunMoon     = true, -- 设置是否显示太阳月亮
	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-1024, 0, 0, -1024},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_4.dds",
    	rectMap  	 = {0, 0, 1024, -1024},
        MiniMap 	 = "maps\\worldmaps\\f8_4.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}

Instance[343] = --id
{
	name			= _t"大雪！保卫圣诞树",
	idZone 			= 0,
	path			= "n32",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	iFlyMaxHeight = 600, -- 最大飞行高度
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\n32.dds",
	MiniMap 	 	= "maps\\worldmaps\\n32_mini.dds",
	rectMap		    = {-5, 436, 465, -34},
	loadingImage 	= "",		--进入世界时加载的地图

}

Instance[344] = --id
{
	name			= _t"摩羯！修罗的剑道", --月度活动摩羯【摩羯！修罗的剑道】
	idZone 			= 0,
	path			= "n2",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置
    fixTime         = 16, -- 设置固定时间
    showSunMoon     = true, -- 设置是否显示太阳月亮
	worldMap        = "maps\\worldmaps\\n2.dds",
	MiniMap 	 	= "maps\\worldmaps\\n2_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[345] = --id
{
	name			= _t"水瓶！最强的绝招",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
    fixTime         = 12, -- 设置固定时间
    showSunMoon     = false, -- 设置是否显示太阳月亮
	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-1024, 0, 0, -1024},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_4.dds",
    	rectMap  	 = {0, 0, 1024, -1024},
        MiniMap 	 = "maps\\worldmaps\\f8_4.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}
Instance[346] = --id
{
	name			= _t"双鱼！玫瑰对魔花",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
    fixTime         = 0, -- 设置固定时间
    showSunMoon     = false, -- 设置是否显示太阳月亮
	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-1024, 0, 0, -1024},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_4.dds",
    	rectMap  	 = {0, 0, 1024, -1024},
        MiniMap 	 = "maps\\worldmaps\\f8_4.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}
Instance[347] = --id
{
	name			= _t"白羊！师徒大作战",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
    fixTime         = 12, -- 设置固定时间
    showSunMoon     = false, -- 设置是否显示太阳月亮
	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-1024, 0, 0, -1024},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_4.dds",
    	rectMap  	 = {0, 0, 1024, -1024},
        MiniMap 	 = "maps\\worldmaps\\f8_4.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}
Instance[348] = --id
{
	name			= _t"双子！善恶对决",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
    fixTime         = 12, -- 设置固定时间
    showSunMoon     = false, -- 设置是否显示太阳月亮
	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-1024, 0, 0, -1024},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_4.dds",
    	rectMap  	 = {0, 0, 1024, -1024},
        MiniMap 	 = "maps\\worldmaps\\f8_4.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}
Instance[349] = --id
{
	name			= _t"缩小世界",
	idZone 			= 0,
	path			= "a2",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	fixTime         = 12, -- 设置固定时间
    showSunMoon     = true, -- 设置是否显示太阳月亮
	precinct		= "maps\\a2\\349a2\\precinct.clt",
	region			= "maps\\a2\\349a2\\region.clt",
	worldMap        = "maps\\worldmaps\\a2.dds",
	MiniMap 	 	= "maps\\worldmaps\\a2.dds",
	rectMap		    = {345, -298, 522, -498},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[350] = --id
{
	name			= _t"突破！异次元空间！",
	idZone 			= 0,
	path			= "d2",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\f8_3.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_3.dds",
	rectMap		    = {-84, 206.5, 47.5, 75},
	loadingImage 	= "",		--进入世界时加载的地图

}

Instance[351] = --id
{
	name			= _t"攻破！冥界之门",
	idZone			= 0,
	path			= "n11",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 2,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	precinct		= "maps\\n11\\63n11\\precinct.clt",
	region			= "maps\\n11\\63n11\\region.clt",
	fixTime         = 0, -- 设置固定时间
    showSunMoon     = false, -- 设置是否显示太阳月亮
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n11_cloud.dds",
	domainFile      = "data\\n11.dat",
	worldMap        = "maps\\worldmaps\\n11.dds",
	MiniMap 	 	= "maps\\worldmaps\\n11.dds",
	rectMap		    = {-1024, 1024, 1024, -1024},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[352] = --id
{
	name			= _t"弦乐之花！镇魂哀歌",
	idZone			= 0,
	path			= "n11",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 2,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	precinct		= "maps\\n11\\63n11\\precinct.clt",
	region			= "maps\\n11\\63n11\\region.clt",
	fixTime         = 0, -- 设置固定时间
    showSunMoon     = false, -- 设置是否显示太阳月亮
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n11_cloud.dds",
	domainFile      = "data\\n11.dat",
	worldMap        = "maps\\worldmaps\\n11.dds",
	MiniMap 	 	= "maps\\worldmaps\\n11.dds",
	rectMap		    = {-1024, 1024, 1024, -1024},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[353] = --id
{
	name			= _t"泥沼、火海、血池、热砂",
	idZone			= 0,
	path			= "n11",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 2,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	precinct		= "maps\\n11\\63n11\\precinct.clt",
	region			= "maps\\n11\\63n11\\region.clt",
	fixTime         = 0, -- 设置固定时间
    showSunMoon     = false, -- 设置是否显示太阳月亮
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n11_cloud.dds",
	domainFile      = "data\\n11.dat",
	worldMap        = "maps\\worldmaps\\n11.dds",
	MiniMap 	 	= "maps\\worldmaps\\n11.dds",
	rectMap		    = {-1024, 1024, 1024, -1024},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[354] = --id
{
	name			= _t"尽头？寒冰地狱",
	idZone			= 0,
	path			= "n11",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 2,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	precinct		= "maps\\n11\\63n11\\precinct.clt",
	region			= "maps\\n11\\63n11\\region.clt",
	fixTime         = 0, -- 设置固定时间
    showSunMoon     = false, -- 设置是否显示太阳月亮
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n11_cloud.dds",
	domainFile      = "data\\n11.dat",
	worldMap        = "maps\\worldmaps\\n11.dds",
	MiniMap 	 	= "maps\\worldmaps\\n11.dds",
	rectMap		    = {-1024, 1024, 1024, -1024},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[355] = --id
{
	name			= _t"狙击！冥界三巨头",
	idZone			= 0,
	path			= "n11",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 2,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	precinct		= "maps\\n11\\63n11\\precinct.clt",
	region			= "maps\\n11\\63n11\\region.clt",
	fixTime         = 0, -- 设置固定时间
    showSunMoon     = false, -- 设置是否显示太阳月亮
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n11_cloud.dds",
	domainFile      = "data\\n11.dat",
	worldMap        = "maps\\worldmaps\\n11.dds",
	MiniMap 	 	= "maps\\worldmaps\\n11.dds",
	rectMap		    = {-1024, 1024, 1024, -1024},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[356] = --id
{
	name			= _t"极乐净土！死神和睡神",
	idZone			= 0,
	path			= "n12",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 2,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	precinct		= "maps\\n12\\64n12\\precinct.clt",
	region			= "maps\\n12\\64n12\\region.clt",
	fixTime         = 0, -- 设置固定时间
    showSunMoon     = false, -- 设置是否显示太阳月亮
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n12_cloud.dds",
	domainFile      = "data\\n12.dat",
	worldMap        = "maps\\worldmaps\\n12.dds",
	MiniMap 	 	= "maps\\worldmaps\\n12.dds",
	rectMap		    = {-512,512,512,-512},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[357] = --id
{
	name			= _t"生与死！决战极乐净土",
	idZone			= 0,
	path			= "n12",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 2,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	precinct		= "maps\\n12\\64n12\\precinct.clt",
	region			= "maps\\n12\\64n12\\region.clt",
	fixTime         = 0, -- 设置固定时间
    showSunMoon     = false, -- 设置是否显示太阳月亮
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n12_cloud.dds",
	domainFile      = "data\\n12.dat",
	worldMap        = "maps\\worldmaps\\n12.dds",
	MiniMap 	 	= "maps\\worldmaps\\n12.dds",
	rectMap		    = {-512,512,512,-512},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[401] = --id
{
	name			= _t"纱织别墅",
	idZone 			= 0,
	path			= "e3",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\e3.dds",
	MiniMap 	 	= "maps\\worldmaps\\e3_mini.dds",
	rectMap		    = {-331, -249, -136, -444},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[402] = --id
{
	name			= _t"前代圣战战场",
	idZone 			= 0,
	path			= "e4",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\e4.dds",
	MiniMap 	 	= "maps\\worldmaps\\e4_mini.dds",
	rectMap		    = {-382, 196, -98, -88},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[403] = --id
{
	name			= _t"传承！黄金试炼",
	idZone 			= 0,
	path			= "e6",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
    worldMap        = "maps\\worldmaps\\e6.dds",
	MiniMap 	 	= "maps\\worldmaps\\e6_mini.dds",
	rectMap		    = {-49, 526, 511, -29},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[404] = --id
{
	name			= _t"传承！黄金试炼",
	idZone 			= 0,
	path			= "e7",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\e7.dds",
	MiniMap 	 	= "maps\\worldmaps\\e7_mini.dds",
	rectMap		    = {-141, 102, 129, -168},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[405] = --id
{
	name			= _t"传承！黄金试炼",
	idZone 			= 0,
	path			= "e9",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\e9.dds",
	MiniMap 	 	= "maps\\worldmaps\\e9_mini.dds",
	rectMap		    = {-512, 463, 253, -302},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[406] = --id
{
	name			= _t"集结！十二宫危机",
	idZone 			= 0,
	path			= "e10",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\e10.dds",
	MiniMap 	 	= "maps\\worldmaps\\e10_mini.dds",
	rectMap		    = {-61, 512, 461, -10},
        loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[407] = --id
{
	name			= _t"风暴！亚特兰蒂斯",
	idZone 			= 0,
	path			= "e11",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 2,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\e11_1.dds",
	MiniMap 	 	= "maps\\worldmaps\\e11_1_mini.dds",
	rectMap		    = {-504, 1006, 504, -1006},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠

        [40701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\e11_1.dds",
    	rectMap  	 = {-406, 879, 301, 172},
	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\e11_1_mini.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [40702] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\e11_2.dds",
    	rectMap  	 = {-117, -279, 187, -583},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\e11_2_mini.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
}

Instance[408] = --id
{
	name			= _t"圣域墓地",
	idZone 			= 0,
	path			= "e12",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\e12.dds",
	MiniMap 	 	= "maps\\worldmaps\\e12_mini.dds",
	rectMap		    = {-457, 443, -55, 41},
        loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[409] = --id
{
	name			= _t"塔尔塔罗斯",
	idZone 			= 0,
	path			= "e13",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\e13.dds",
	MiniMap 	 	= "maps\\worldmaps\\e13_mini.dds",
	rectMap		    = {-486, 480, 380, -386},
        loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[410] = --id
{
	name			= _t"冰火深渊",
	idZone 			= 0,
	path			= "e14",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\e14.dds",
	MiniMap 	 	= "maps\\worldmaps\\e14_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
        loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[411] = --id
{
	name			= _t"北欧小镇",
	idZone 			= 0,
	path			= "e15",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\e15.dds",
	MiniMap 	 	= "maps\\worldmaps\\e15_mini.dds",
	rectMap		    = {-349, 428, 268, -189},
        loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[412] = --id
{
	name			= _t"洛基巢穴",
	idZone 			= 0,
	path			= "e16",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\e16.dds",
	MiniMap 	 	= "maps\\worldmaps\\e16_mini.dds",
	rectMap		    = {-285, -111, -15, -381},
        loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[413] = --id
{
	name			= _t"新三环：天枰",
	idZone 			= 0,
	path			= "e10",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\e10.dds",
	MiniMap 	 	= "maps\\worldmaps\\e10_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
        loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[415] = --id
{
	name			= _t"攻破！复仇者联盟",
	idZone 			= 0,
	path			= "e15",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\e15.dds",
	MiniMap 	 	= "maps\\worldmaps\\e15_mini.dds",
	rectMap		    = {-349, 428, 268, -189},
    loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[416] = --id
{
	name			= _t"孵化！冥蝶巢穴",
	idZone 			= 0,
	path			= "e20",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\e20.dds",
	MiniMap 	 	= "maps\\worldmaps\\e20.dds",
	rectMap		    = {-500, 502, -309, 311},
    loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[417] = --id
{
	name			= _t"哀嚎！地狱奏鸣曲",
	idZone 			= 0,
	path			= "n11",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 2,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	region			= "maps\\n11\\417e21\\region.clt",
	worldMap        = "maps\\worldmaps\\e21.dds",
	MiniMap 	 	= "maps\\worldmaps\\e21.dds",
	rectMap		    = {-664, 70, 360, -954},
    loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[418] = --id
{
	name			= _t"复生！死去的斗士",
	idZone 			= 0,
	path			= "n11",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 2,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	region			= "maps\\n11\\418e22\\region.clt",
	worldMap        = "maps\\worldmaps\\e22.dds",
	MiniMap 	 	= "maps\\worldmaps\\e22.dds",
	rectMap		    = {332, 1024, 1024, 332},
    loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[419] = --id
{
	name			= _t"纱织别墅",
	idZone 			= 0,
	path			= "e3",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\e23.dds",
	MiniMap 	 	= "maps\\worldmaps\\e23.dds",
	rectMap		    = {-273, -93, -160, -206},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[421] = --id
{
	name			= _t"魔盒中的异次元空间",
	idZone 			= 0,
	path			= "f8",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 4,
	column			= 2,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\f8.dds",
	MiniMap 	 	= "maps\\worldmaps\\f8_mini.dds",
	rectMap		    = {-1024, 2048, 1024, -2048},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠

		[20808] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_8.dds",
    	rectMap  	 = {0, -1024, 1024, -2048},
        MiniMap 	 = "maps\\worldmaps\\f8_8.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [20807] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_7.dds",
    	rectMap  	 = {-1024, -1024, 0, -2048},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_7.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20803] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_2.dds",
    	rectMap  	 = {-859, 853, -723, 717},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_2.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
       [20805] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_5.dds",
    	rectMap  	 = {-1024, 0, 0, -1024},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_5.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20809] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_4.dds",
    	rectMap  	 = {0, 0, 1024, -1024},
        MiniMap 	 = "maps\\worldmaps\\f8_4.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
        [20811] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 857, -182, 677},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20812] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 614, -182, 434},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [20813] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_3.dds",
    	rectMap  	 = {-362, 359, -182, 179},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_3.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
        [30701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_1.dds",
    	rectMap  	 = {-997, 446, -605, 54},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\f8_1.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
    	[21201] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\f8_6.dds",
    	rectMap  	 = {-1024, -604, 0, -1624},
        MiniMap 	 = "maps\\worldmaps\\f8_6.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
}

Instance[422] = --id
{
	name			= _t"逆流！黄金试炼", --三环双鱼
	idZone 			= 0,
	path			= "e6",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
    worldMap        = "maps\\worldmaps\\e6.dds",
	MiniMap 	 	= "maps\\worldmaps\\e6_mini.dds",
	rectMap		    = {-49, 526, 511, -29},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[423] = --id
{
	name			= _t"逆流！黄金试炼", --三环狮子
	idZone 			= 0,
	path			= "e7",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\e7.dds",
	MiniMap 	 	= "maps\\worldmaps\\e7_mini.dds",
	rectMap		    = {-141, 102, 129, -168},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[424] = --id
{
	name			= _t"逆流！黄金试炼", --三环天秤
	idZone 			= 0,
	path			= "e9",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\e9.dds",
	MiniMap 	 	= "maps\\worldmaps\\e9_mini.dds",
	rectMap		    = {-512, 463, 253, -302},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[425] = --id
{
	name			= _t"逆流！十二宫危机",
	idZone 			= 0,
	path			= "e10",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\e10.dds",
	MiniMap 	 	= "maps\\worldmaps\\e10_mini.dds",
	rectMap		    = {-61, 512, 461, -10},
        loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[426] = --id
{
	name			= _t"逆流！亚特兰蒂斯",
	idZone 			= 0,
	path			= "e11",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 2,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\e11_1.dds",
	MiniMap 	 	= "maps\\worldmaps\\e11_1_mini.dds",
	rectMap		    = {-504, 1006, 504, -1006},
	loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠

        [40701] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\e11_1.dds",
    	rectMap  	 = {-406, 879, 301, 172},
		validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\e11_1_mini.dds",
        loadingImage = "",
        selRoleGFX   = "",

    },
       [40702] =
    {
        bPrecinctMap = true,
        upPrecinctId = UP_TO_WORLDMAP,
        MidMap  	 = "maps\\worldmaps\\e11_2.dds",
    	rectMap  	 = {-117, -279, 187, -583},
    	validRegion	 = {0, 0, 1024, 1024},
        MiniMap 	 = "maps\\worldmaps\\e11_2_mini.dds",
        loadingImage = "",
        selRoleGFX   = "",
    },
}

Instance[427] = --id
{
	name			= _t"庐山！第一环",
	idZone 			= 0,
	path			= "h1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\h1.dds",
	MiniMap 	 	= "maps\\worldmaps\\h1.dds",
	rectMap		    = {-61, 512, 461, -10},
        loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[428] = --id
{
	name			= _t"庐山！第二环",
	idZone 			= 0,
	path			= "h2",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\h2.dds",
	MiniMap 	 	= "maps\\worldmaps\\h2.dds",
	rectMap		    = {-61, 512, 461, -10},
        loadingImage 	= "",		--进入世界时加载的地图
	hideOtherPet    = true,     --隐藏其它玩家战斗宠物与休闲宠
}

Instance[429] = --id
{
	name			= _t"庐山！第三环",
    idZone 			= 0,
	path			= "n3",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	iFlyMaxHeight = 450, -- 最大飞行高度	
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {3584,0}, -- 本instance的原点在世界坐标系中的位置
	worldMap        = "maps\\worldmaps\\n3.dds",
	rectMap		    = {-500, 420, 397, -477},
	validRegion		= {0, 0, 1024, 1024},
	bHasMapCloud    = true,
	worldMapCloud   = "maps\\worldmaps\\n3_cloud.dds",
	domainFile      = "data\\n3.dat",
	MiniMap 	 	= "maps\\worldmaps\\n3_mini.dds",
    loadingImage 	= "",		--进入世界时加载的地图
}

Instance[490] = --id
{
	name			= _t"连九州测试",
	idZone 			= 0,
	path			= "e6",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
        worldMap        = "maps\\worldmaps\\e6.dds",
	MiniMap 	 	= "maps\\worldmaps\\e6_mini.dds",
	rectMap		    = {-49, 526, 511, -29},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[491] = --id
{
	name			= _t"李英彦测试",
	idZone 			= 0,
	path			= "e8",
	detailTexture 	= "Textures\\Maps\\detail\\L1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {26, 53, 29},
	bUnderWater		= false,-- true:under water scene, false:normal scene
	origin		 	= {0, 3584},--{3072,1536},--本instance的原点在世界坐标系中的位置 -- todo 问下坐标位置

	worldMap        = "maps\\worldmaps\\e8.dds",
	MiniMap 	 	= "maps\\worldmaps\\e8_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[500] = --id
{
	name			= _t"动画特需",
	idZone 			= 0,
	path			= "v1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\e7.dds",
	MiniMap 	 	= "maps\\worldmaps\\e7_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[501] = --id
{
	name			= _t"战神！阿提卡遗迹",
	idZone 			= 0,
	path			= "b1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	challenge		= true,

	worldMap        = "maps\\worldmaps\\b1.dds",
	MiniMap 	 	= "maps\\worldmaps\\b1_mini.dds",
	rectMap		    = {-382, 395, 471, -458},
        loadingImage 	= "",		--进入世界时加载的地图
}

Instance[502] = --id
{
	name			= _t"混沌战场",
	idZone 			= 0,
	path			= "b2",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	challenge		= true,

	worldMap        = "maps\\worldmaps\\b2.dds",
	MiniMap 	 	= "maps\\worldmaps\\b2.dds",
	rectMap		    = {-144, 190, 127, -81},
        loadingImage 	= "",		--进入世界时加载的地图
}


Instance[504] = --id
{
	name			= _t"熔岩战场",
	idZone 			= 0,
	path			= "b3",
	detailTexture 	= "Textures\\Maps\\detail\\b3.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	challenge		= true,
	fog					= false, -- 强制关闭雾效果
	terrain			= true, -- 强制关闭渲染地形
	worldMap        = "maps\\worldmaps\\b3.dds",
	MiniMap 	 	= "maps\\worldmaps\\b3.dds",
	rectMap		    = {-151, -28, 264, -443},
        loadingImage 	= "",		--进入世界时加载的地图
}
Instance[505] = --id
{
	name			= _t"飞行战场",
	idZone 			= 0,
	path			= "b4",
	detailTexture 	= "Textures\\Maps\\detail\\b4.dds",
	row				= 1,
	column			= 1,
    iFlyMaxHeight = 372, -- 最大飞行高度
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	challenge		= true,
	fog					= false, -- 强制关闭雾效果
	terrain			= true, -- 强制关闭渲染地形
	worldMap        = "maps\\worldmaps\\b4.dds",
	MiniMap 	 	= "maps\\worldmaps\\b4.dds",
	rectMap		    = {-259, 289, 241, -211},
        loadingImage 	= "",		--进入世界时加载的地图
}

Instance[506] = --id
{
	name			= _t"血战！北欧大乱斗",
	idZone 			= 0,
	path			= "e15",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	fixTime         = 12, -- 设置固定时间
    showSunMoon     = true, -- 设置是否显示太阳月亮
	precinct		= "maps\\e15\\b5\\precinct.clt",
	region			= "maps\\e15\\b5\\region.clt",
	worldMap        = "maps\\worldmaps\\e15.dds",
	MiniMap 	 	= "maps\\worldmaps\\e15_mini.dds",
	rectMap		    = {-349, 428, 268, -189},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[601] = --id
{
	name			= _t"竞技场",
	idZone 			= 0,
	path			= "n7",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\n7.dds",
	MiniMap 	 	= "maps\\worldmaps\\n7_mini.dds",
	rectMap		    = {-504, 503, 504, -503},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[602] = --id
{
	name			= _t"组队跨服竞技场",
	idZone 			= 0,
	path			= "a2",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置

	worldMap        = "maps\\worldmaps\\a2.dds",
	MiniMap 	 	= "maps\\worldmaps\\a2.dds",
	rectMap		    = {345, -298, 522, -498},
	loadingImage 	= "",		--进入世界时加载的地图
}

Instance[603] = --id
{
	name			= _t"跨服团队pk",
	idZone 			= 0,
	path			= "b1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	challenge		= true,

	worldMap        = "maps\\worldmaps\\b1.dds",
	MiniMap 	 	= "maps\\worldmaps\\b1_mini.dds",
	rectMap		    = {-382, 395, 471, -458},
    loadingImage 	= "",		--进入世界时加载的地图
}

Instance[604] = --id
{
	name			= _t"跨服团队pk",
	idZone 			= 0,
	path			= "b1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	challenge		= true,

	worldMap        = "maps\\worldmaps\\b1.dds",
	MiniMap 	 	= "maps\\worldmaps\\b1_mini.dds",
	rectMap		    = {-382, 395, 471, -458},
    loadingImage 	= "",		--进入世界时加载的地图
}

Instance[701] = --id
{
	name			= _t"银河争霸赛",
	idZone 			= 0,
	path			= "r1",
	detailTexture 	= "Textures\\Maps\\detail\\s1.dds",
	row				= 1,
	column			= 1,
	waterColor		= {61, 103, 137},
	bUnderWater		= false,    -- true:under water scene, false:normal scene
	origin		 	= {0,0},--本instance的原点在世界坐标系中的位置
	challenge		= true,
	fog					= false, -- 强制关闭雾效果
	terrain			= false, -- 强制关闭渲染地形
	worldMap        = "maps\\worldmaps\\r1.dds",
	
	MiniMap 	 	= "maps\\worldmaps\\r1_mini.dds",
	rectMap		    =  {-384, 374, 366, -376},
  loadingImage 	= "",		--进入世界时加载的地图
}


local INST_TYPE_WORLD		= 0		--大世界
local INST_TYPE_BASE		= 1		--军团基地
local INST_TYPE_BATTLE		= 2		--军团战场
local INST_TYPE_DYNAMIC		= 3		--副本(装备/剧情/活动)
local INST_TYPE_SPEC		= 4		--特殊
local INST_TYPE_TERRITORY	= 5		--领土战
local INST_TYPE_WAR			= 6		-- 战场
local INST_TYPE_PVP			= 7		-- 竞技场

local RANGE_LIST =
{
   [INST_TYPE_WORLD]   = {0, 80},    --大世界InstanceID范围[0, 50]
   [INST_TYPE_SPEC]    = {81, 100},  --特殊用途(用作场景空间不批量的东西，领土战等)InstanceID范围[51, 100]
   [INST_TYPE_BASE]    = {101, 101}, --军团基地
   [INST_TYPE_BATTLE]  = {102, 200}, --军团战场InstanceID范围[151, 200]
   [INST_TYPE_DYNAMIC] = {201, 500}, --副本InstanceID范围[201, 500]
   [INST_TYPE_WAR] = {501, 600}, --		战场InstanceID范围[501, 600]
   [INST_TYPE_PVP] = {601, 700}, --		竞技场InstanceID范围[601, 700]
   [INST_TYPE_TERRITORY] = {701, 800}, --领土战InstanceID范围[701, 800]
}
local function InitCommon()
	local pos
	for id, inst in pairs(Instance) do
	    if type(id) == "number" and type(inst) == "table" then
	        -- 场景类型
	        for typ, range in pairs(RANGE_LIST) do
	            if id >= range[1] and id <= range[2] then
	                inst.iInstType = typ
	                break
	            end
	        end

	        -- 图标
	        for _, mark in pairs(inst.marks or {}) do
	            if (not mark.pos) and mark.id then
	                pos = TemplPos:GetPos(mark.id)
	                if pos and id == pos.mapId then
	                    mark.pos = { pos.x, pos.z}
	                end
	            end
	        end

	        --管辖区域图标
	        for _id, precinct in pairs(inst) do
	            if type(_id) == "number" and type(precinct) == "table" then
	                for _, mark in pairs(precinct.marks or {}) do
        	            if (not mark.pos) and mark.id then
        	                pos = TemplPos:GetPos(mark.id)
        	                if pos and id == pos.mapId then
        	                    mark.pos = { pos.x, pos.z}
        	                end
        	            end
        	        end
	            end
	        end
	    end
	end

	--if Instance[TEAM_PK_INSTANT_ID_PRE] and Instance[TEAM_PK_INSTANT_ID_PRE].iInstType then
	--	Instance[TEAM_PK_INSTANT_ID_PRE].iInstType = INST_TYPE_BATTLE
	--end
	
	-- 队伍跨服pk
	--for _,v in pairs(TEAM_PK_INSTANT_ID_TAB or {}) do
	--	if Instance[v] and Instance[v].iInstType then
	--		Instance[v].iInstType = INST_TYPE_BATTLE
	--	end
	--end
end
InitCommon()



















