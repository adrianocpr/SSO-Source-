--login player info

LoginPlayerInfo = {}

--- 摄像机远近控制的最大范围
LoginPlayerInfo.CameraMoveRange = {0, 1}

-- 玩家肤色配置
LoginPlayerInfo.SkinColors =
{
	0xffffff,
	0xfef5f0,
	0xffebe0,
	0xffe7db,
	0xffe6d7,
	0xffdec2,
	0xfed7ac,
	0xf7cb9e,
	0xf0be8d,
	0xe8b588,
	0xdeaa83,
	0xd79a6b,
	0xc68663,
	0xad7552,
	0x9c694a,
	0x7a553a,
}

-- 玩家预置发色配置
LoginPlayerInfo.HairColors =
{
	0x6d5525,
	0x0b3848,
	0xa08e69,
	0x0f2c58,
	0xe8a524,
	0x1a5d05,
	0x65462a,
	0xa12a28,
	0xf9d26b,
	0xb5ae9c,
	0xc641cb,
	0x33ccff,
	0xd3a507,
	0xd36207,
}

-- 玩家预置眼睛颜色配置
LoginPlayerInfo.EyeColors =
{
	0xd62222,
	0xaa0f3b,
	0xaa0f8f,
	0x7f0da1,
	0x5812b9,
	0x1f30eb,
	0x1358bd,
	0x1290b7,
	0x11b2b0,
	0x11b36d,
	0x10930b,
	0x8bb912,
	0xd0db00,
	0xd87310,
}

-- 圣衣试穿配置
-- 请保证smart_camera播放时间和动作播放时间保持一致
LoginPlayerInfo.SaintClothes =
{
	{id = 10725, action = "选人展示_白羊", smart_camera = 70},
	{id = 10726, action = "选人展示_金牛", smart_camera = 71},
	{id = 10727, action = "选人展示_双子", smart_camera = 70},
	{id = 10728, action = "选人展示_巨蟹", smart_camera = 68},
	{id = 10729, action = "选人展示_狮子", smart_camera = 68},
	{id = 10730, action = "选人展示_处女", smart_camera = 72},
	{id = 10731, action = "选人展示_天平", smart_camera = 73},
	{id = 10732, action = "选人展示_天蝎", smart_camera = 68},
	{id = 10733, action = "选人展示_射手", smart_camera = 74},
	{id = 10734, action = "选人展示_摩羯", smart_camera = 68}, --ok
	{id = 10735, action = "选人展示_水瓶", smart_camera = 68},
	{id = 10736, action = "选人展示_双鱼", smart_camera = 68},
	{id = 0, action = "", smart_camera = 0},
}

-- 创建人物时身体各部位个性化可选的最大数量
LoginPlayerInfo.CustomizeMaxCounts =
{
	body = 3,
	hair = 10,
	face = 10,
	face_decoration = 0,
	eye = 10,
}

-- 创建人物时各部位的默认选择(序号从0开始)
LoginPlayerInfo.CustomizeDefaults =
{
	body = 1,
	face = 0,
	face_decoration = 0,
	skin = 2,
	hair = 0,
	hair_color = 0x58394a,
	eye = 0,
	eye_color = 0x553e59,
}

-- 创建人物时摄像机配置，按体型分别配置
--[[ 配置格式如下：
LoginPlayerInfo.CameraInfo =
{
	[0] =		-- 体型编号
	{
		[GENDER_MALE] =		-- 男性角色
		{
			normal = {distance = 6, height = 1, rotation = 0, fov = 25},	-- 全身镜头
			face = {distance = 2, height = 1.3, rotation = 20, fov = 25},	-- 脸部镜头
		},
		[GENDER_FEMALE] =	-- 女性角色
		{
			normal = {distance = 6, height = 1, rotation = 0, fov = 25},	-- 全身镜头
			face = {distance = 2, height = 1.3, rotation = 20, fov = 25},	-- 脸部镜头
		},
	},
}

其中：
distance	为摄像机与角色的距离
height		为摄像机相对角色脚底的垂直高度
rotation	为摄像机以角色为轴旋转的角度
fov			为摄像机的fov
]]
LoginPlayerInfo.CameraInfo =
{
	[0] =
	{
		[GENDER_MALE] =
		{
			normal = {distance = 6, height = 1.0, rotation = 0, fov = 25},
			face = {distance = 2, height = 1.4, rotation = 0, fov = 25},
		},
		[GENDER_FEMALE] =
		{
			normal = {distance = 6, height = 1.0, rotation = 0, fov = 25},
			face = {distance = 2, height = 1.3, rotation = 0, fov = 25},
		},
	},

	[1] =
	{
		[GENDER_MALE] =
		{
			normal = {distance = 6, height = 1.0, rotation = 0, fov = 25},
			face = {distance = 2, height = 1.5, rotation = 0, fov = 25},
		},
		[GENDER_FEMALE] =
		{
			normal = {distance = 6, height = 1.0, rotation = 0, fov = 25},
			face = {distance = 2, height = 1.4, rotation = 0, fov = 25},
		},
	},

	[2] =
	{
		[GENDER_MALE] =
		{
			normal = {distance = 6, height = 1.0, rotation = 0, fov = 25},
			face = {distance = 2, height = 1.6, rotation = 0, fov = 25},
		},
		[GENDER_FEMALE] =
		{
			normal = {distance = 6, height = 1.0, rotation = 0, fov = 25},
			face = {distance = 2, height = 1.4, rotation = 0, fov = 25},
		},
	},
}

-- 创建人物时摄像机参数（旧版已废弃）
LoginPlayerInfo.Coordinate =
{
	--默认
	[PROF_DEFAULT] =
	{
        camPos 	= {437.946, 182.479, 432.061},
    	camDir 	= {0, 0, 10000},
    	camFov 	= 45,
		rolePos = {437.946, 181.679, 435.461},
		gfxPos  = {395.453, 81.757, -382.048},
		gfxDir  = {0, 0, -1},
		camPosFace 	= {437.946, 182.679, 433.08},
		camDirFace	= {0, 0, 10000},
        cameFaceChangeTime = 1500,
	},

	--圣斗士·战
	[PROF_PEGASI] =
	{
--[[    camPos 	= {-481.09, 154.24, 458.28},
    	camDir 	= {0, 0, 10000},
    	camFov 	= 10,
		rolePos = {-481.09, 153.44, 473.68},
]]--备份
        camPos 	= {437.946, 182.479, 432.061},
    	camDir 	= {0, 0, 10000},
    	camFov 	= 45,
		rolePos = {437.946, 181.679, 435.461},
		gfxPos  = {395.453, 81.757, -382.048},
		gfxDir  = {0, 0, -1},
		camPosFace 	= {437.946, 182.679, 433.08},
		camDirFace	= {0, 0, 10000},
        cameFaceChangeTime = 1500,
	},
	--圣斗士·光
	[PROF_CYGNI] =
	{
        camPos 	= {437.946, 182.479, 432.061},
    	camDir 	= {0, 0, 10000},
    	camFov 	= 45,
		rolePos = {437.946, 181.679, 435.461},
		gfxPos  = {395.453, 81.757, -382.048},
		gfxDir  = {0, 0, -1},
		camPosFace 	= {437.946, 182.679, 433.08},
		camDirFace	= {0, 0, 10000},
        cameFaceChangeTime = 1500,
	},
	--圣斗士·火
	[PROF_DRACONIS] =
	{
        camPos 	= {437.946, 182.479, 432.061},
    	camDir 	= {0, 0, 10000},
    	camFov 	= 45,
		rolePos = {437.946, 181.679, 435.461},
		gfxPos  = {395.453, 81.757, -382.048},
		gfxDir  = {0, 0, -1},
		camPosFace 	= {437.946, 182.679, 433.08},
		camDirFace	= {0, 0, 10000},
        cameFaceChangeTime = 1500,
	},
	--圣斗士·守
	[PROF_ANDROMEDAE] =
	{
        camPos 	= {437.946, 182.479, 432.061},
    	camDir 	= {0, 0, 10000},
    	camFov 	= 45,
		rolePos = {437.946, 181.679, 435.461},
		gfxPos  = {395.453, 81.757, -382.048},
		gfxDir  = {0, 0, -1},
		camPosFace 	= {437.946, 182.679, 433.08},
		camDirFace	= {0, 0, 10000},
        cameFaceChangeTime = 1500,
	},
	--圣斗士·冰
	[PROF_PHOENIX] =
	{
        camPos 	= {437.946, 182.479, 432.061},
    	camDir 	= {0, 0, 10000},
    	camFov 	= 45,
		rolePos = {437.946, 181.679, 435.461},
		gfxPos  = {395.453, 81.757, -382.048},
		gfxDir  = {0, 0, -1},
		camPosFace 	= {437.946, 182.679, 433.08},
		camDirFace	= {0, 0, 10000},
        cameFaceChangeTime = 1500,
	},
	--圣斗士·影
	[PROF_GEMINORUM] =
	{
        camPos 	= {437.946, 182.479, 432.061},
    	camDir 	= {0, 0, 10000},
    	camFov 	= 45,
		rolePos = {437.946, 181.679, 435.461},
		gfxPos  = {395.453, 81.757, -382.048},
		gfxDir  = {0, 0, -1},
		camPosFace 	= {437.946, 182.679, 433.08},
		camDirFace	= {0, 0, 10000},
        cameFaceChangeTime = 1500,
	},
	--圣斗士·裁
	[PROF_JUDGE] =
	{
        camPos 	= {437.946, 182.479, 432.061},
    	camDir 	= {0, 0, 10000},
    	camFov 	= 45,
		rolePos = {437.946, 181.679, 435.461},
		gfxPos  = {395.453, 81.757, -382.048},
		gfxDir  = {0, 0, -1},
		camPosFace 	= {437.946, 182.679, 433.08},
		camDirFace	= {0, 0, 10000},
        cameFaceChangeTime = 1500,
	},
	--圣斗士·武
	[PROF_MILITARY] =
	{
        camPos 	= {437.946, 182.479, 432.061},
    	camDir 	= {0, 0, 10000},
    	camFov 	= 45,
		rolePos = {437.946, 181.679, 435.461},
		gfxPos  = {395.453, 81.757, -382.048},
		gfxDir  = {0, 0, -1},
		camPosFace 	= {437.946, 182.679, 433.08},
		camDirFace	= {0, 0, 10000},
        cameFaceChangeTime = 1500,
	},
}

-- 创建新角色时的装备展示，按星座和性别分别配置（旧版已废弃）
LoginPlayerInfo.Equipments =
{
	-- 按星座分别配置，1为白羊座
	[1] = {
--顺序为武器，副手，头，胸，腿，手，项链，圣像，神物，戒指，戒指2，面具，时装头，上，下，鞋，手，翅膀
--无则填0
		[GENDER_MALE] = {0, 0, 7327, 7328, 7329, 7330},
		[GENDER_FEMALE] = {2078, 5950, 3278, 3878, 4478, 5078},
	},
	[2] = { --金牛
		[GENDER_MALE] = {0, 0, 7299, 7300, 7301, 7302},
		[GENDER_FEMALE] = {2078, 5950, 3278, 3878, 4478, 5078},
	},
	[3] = { --双子
		[GENDER_MALE] = {0, 0, 7319, 7320, 7321, 7322},
		[GENDER_FEMALE] = {2078, 5950, 3278, 3878, 4478, 5078},
	},
	[4] = { --巨蟹
		[GENDER_MALE] = {0, 0, 7287, 7288, 7289, 7290},
		[GENDER_FEMALE] = {2078, 5950, 3278, 3878, 4478, 5078},
	},
	[5] = { --狮子
		[GENDER_MALE] = {0, 0, 7315, 7316, 7317, 7318},
		[GENDER_FEMALE] = {2078, 5950, 3278, 3878, 4478, 5078},
	},
	[6] = { --处女
		[GENDER_MALE] = {0, 0, 7307, 7308, 7309, 7310},
		[GENDER_FEMALE] = {2078, 5950, 3278, 3878, 4478, 5078},
	},
	[7] = { --天秤
		[GENDER_MALE] = {0, 0, 7295, 7296, 7297, 7298},
		[GENDER_FEMALE] = {2078, 5950, 3278, 3878, 4478, 5078},
	},
	[8] = { --天蝎
		[GENDER_MALE] = {0, 0, 7311, 7312, 7313, 7314},
		[GENDER_FEMALE] = {2078, 5950, 3278, 3878, 4478, 5078},
	},
	[9] = { --射手
		[GENDER_MALE] = {0, 0, 7331, 7332, 7333, 7334},
		[GENDER_FEMALE] = {2078, 5950, 3278, 3878, 4478, 5078},
	},
	[10] = { --摩羯
		[GENDER_MALE] = {0, 0, 7291, 7292, 7293, 7294},
		[GENDER_FEMALE] = {2078, 5950, 3278, 3878, 4478, 5078},
	},
	[11] = { --水瓶
		[GENDER_MALE] = {0, 0, 7303, 7304, 7305, 7306},
		[GENDER_FEMALE] = {2078, 5950, 3278, 3878, 4478, 5078},
	},
	[12] = { --双鱼
		[GENDER_MALE] = {0, 0, 7323, 7324, 7325, 7326},
		[GENDER_FEMALE] = {2078, 5950, 3278, 3878, 4478, 5078},
	},
}
