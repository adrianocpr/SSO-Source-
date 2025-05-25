---------------------------------------------------------------
--  created:   2010.8.24
--  author:    hanwei
--
--  管辖区域按钮配置, 参考discovermap_def.lua
--  坐标
---------------------------------------------------------------
local WORLD_MAP_ID 		= -1
local INVALID_PRECINCT	= -1
local INVALID_AREA		= -1



PrecinctButton = {}

PrecinctButton[1] = 
{
	InstId 		= WORLD_MAP_ID, --场景id
	PrecinctId	= INVALID_PRECINCT,
	ButtonList  =
	{
        [1] =      --庐山
        {
        	InstId 		= 3,
            PrecinctId 	= INVALID_PRECINCT,
            x   = 655,
            y   = 559,
            wid = 162,
            hei = 159,
            onImg   = "maps\\Precinct\\lushan_H.png",
            upImg   = "maps\\Precinct\\lushan_U.png",
            downImg = "maps\\Precinct\\lushan_D.png",
            disImg  = "",
        },
        [2] =     --圣域
        {
            InstId 		= 2,
            PrecinctId 	= INVALID_PRECINCT,
            x   = 248,
            y   = 525,
            wid = 63,
            hei = 76,
            onImg   = "maps\\Precinct\\saint_H.png",
            upImg   = "maps\\Precinct\\saint_U.png",
            downImg = "maps\\Precinct\\saint_D.png",
            disImg  = "",
        },
        [3] =      --银河竞技场
        {
            InstId 		= 4,
            PrecinctId 	= INVALID_PRECINCT,
            x   = 929,
            y   = 442,
            wid = 113,
            hei = 146,
            onImg   = "maps\\Precinct\\river_H.png",
            upImg   = "maps\\Precinct\\river_U.png",
            downImg = "maps\\Precinct\\river_D.png",
            disImg  = "",
        },
        [4] =         --群星之地
        {
            InstId 		= 1,
            PrecinctId 	= INVALID_PRECINCT,
            x   = 267,
            y   = 392,
            wid = 108,
            hei = 63,
            onImg   = "maps\\Precinct\\star_H.png",
            upImg   = "maps\\Precinct\\star_U.png",
            downImg = "maps\\Precinct\\star_D.png",
            disImg  = "",
        },
        [5] =         --遗忘之路
        {
            InstId 		= 5,
            PrecinctId 	= INVALID_PRECINCT,
            x   = 248,
            y   = 454,
            wid = 100,
            hei = 60,
            onImg   = "maps\\Precinct\\road_H.png",
            upImg   = "maps\\Precinct\\road_U.png",
            downImg = "maps\\Precinct\\road_D.png",
            disImg  = "",
        },
        [6] =         --死亡皇后岛
        {
            InstId 		= 6,
            PrecinctId 	= INVALID_PRECINCT,
            x   = 913,
            y   = 664,
            wid = 119,
            hei = 96,
            onImg   = "maps\\Precinct\\death_H.png",
            upImg   = "maps\\Precinct\\death_U.png",
            downImg = "maps\\Precinct\\death_D.png",
            disImg  = "",
        },
		[7] =         --东西伯利亚
        {
            InstId 		= 7,
            PrecinctId 	= INVALID_PRECINCT,
            x   = 726,
            y   = 383,
            wid = 222,
            hei = 168,
            onImg   = "maps\\Precinct\\west_H.png",
            upImg   = "maps\\Precinct\\west_U.png",
            downImg = "maps\\Precinct\\west_D.png",
            disImg  = "",
        },
		[8] =         --亚特兰蒂斯
        {
            InstId 		= 8,
            PrecinctId 	= INVALID_PRECINCT,
            x   = 121,
            y   = 659,
            wid = 180,
            hei = 176,
            onImg   = "maps\\Precinct\\ya_H.png",
            upImg   = "maps\\Precinct\\ya_U.png",
            downImg = "maps\\Precinct\\ya_D.png",
            disImg  = "",
        },
		[9] =         --仙女岛
        {
            InstId 		= 9,
            PrecinctId 	= INVALID_PRECINCT,
            x   = 355,
            y   = 671,
            wid = 101,
            hei = 69,
            onImg   = "maps\\Precinct\\fairy_H.png",
            upImg   = "maps\\Precinct\\fairy_U.png",
            downImg = "maps\\Precinct\\fairy_D.png",
            disImg  = "",
        },
		[10] =         --哈迪斯城
        {
            InstId 		= 10,
            PrecinctId 	= INVALID_PRECINCT,
            x   = 114,
            y   = 380,
            wid = 168,
            hei = 157,
            onImg   = "maps\\Precinct\\hadisi_H.png",
            upImg   = "maps\\Precinct\\hadisi_U.png",
            downImg = "maps\\Precinct\\hadisi_D.png",
            disImg  = "",
        },
        [11] =         --冥界地狱
        {
            InstId 		= 11,
            PrecinctId 	= INVALID_PRECINCT,
            x   = 537,
            y   = 280,
            wid = 128,
            hei = 53,
            onImg   = "maps\\Precinct\\hell_H.png",
            upImg   = "maps\\Precinct\\hell_U.png",
            downImg = "maps\\Precinct\\hell_D.png",
            disImg  = "",
        },
    }
}

