------------------------
-- Buff特效配置表

--[[
GFX数据格式：
{
	gfxlist, 		[特效列表, 可以填充多项; 每一项包含gfx和hook, 其中gfx为特效路径, hook为特效挂点]
	shape_id, 		[CHANGE_SHAPE_ESSENCE, 体型道具id]
	color_index, 	[体型颜色索引, 可以选择的范围0-4, 配置见EC_PlayerConfig.cpp的_buff_skin_color表]
				  	[_buff_skin_color = {0xffeda9a9, 0xffc8e1ec, 0xffafd1af, 0xffbfbfbf, 0xffd0c891}]
	shader_id, 	    [shader索引, 可以选择的范围0-2, 配置见EC_Resource.cpp的l_aShaderFiles表]
					[l_aShaderFiles = {"shaders\\ps\\armor", "shaders\\ps\\stone", "shaders\\ps\\weak"}]
	keep_still, 	[标志模式是否静止]
    end_gfx,        [结束时播放的瞬时特效列表]
}

注意事项:
gfxlist必须填一项，不能为空。
非人物专用特效，不可以使用HH_Spine1到HH_Spine4 这些挂点，只有人物专用光效可以
]]--

--1:加速
--2:都别用
--3:伤害倍率提高
--4:献祭控制_紫龙
--5:无敌
--6:攻击力提高
--7:中毒
--8:霜冻
--9:冰封
--10:诅咒
--11:虚弱
--12:流血
--13:眩晕
--14:石化
--15:沉睡
--16:灼烧
--17:沉默
--18:加速+伤害倍率提高
--19:冰盾
--20:白鸟天赋免疫治疗
--21:网缚定身
--22:生存，光球环绕
--23:小宇宙爆发
--24:双手拳上带光
--25:职业技能流星用光效
--26:冰冻
--27:空气防御壁
--28:职业技能回豆光效
--29:瞬伤害吸收盾
--30:极效治疗全身状态，身上粉红的光
--31:瞬_解控制_免疫，脚下红圈
--32:混乱（预留）
--33:减速
--34:祭坛座圣衣灵魂摄取
--35:通用反射(预留)
--36:瞬治疗状态，左手白光圈缠绕
--37:瞬治疗状态，右手红光圈缠绕
--38:脚下电光
--39:紫龙吸伤盾
--40:冰河冰冻（脚底没有冰块）
--41:紫龙自动伤害
--42:火焰盾
--43:皇后岛世界BOSS点名标记+预警光球+结束后爆炸效果
--44:治疗加成光效
--45:冰河-冰柩
--46:隐形
--47:受击回血光效
--48:金光笼罩
--49:重生状态_瞬
--50:天赋群体沉默_瞬
--51:右手火焰
--52:点名标识
--53:半人马圣衣技能脚底光圈
--54:天琴圣衣技能用状态

--81:天马折光盾

Buff_Gfx =
{
	[1] =
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\加速_00.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

	[2] =  --天马天赋折光盾
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\星矢_折光_HH_spine.gfx", hook = "HH_spine", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
        end_gfx=
            {
                { gfx = "策划联入\\星矢_折光破碎HH_spine.gfx", hook = "HH_spine", },
            },
    },

    [3] =
    {
    	gfxlist =
    		{
    			{gfx = "策划联入\\伤害倍率提高_00.gfx", hook = "HH_000", },
       		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },
    	[4] =  --献祭控制_紫龙
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\献祭控制_紫龙HH_spine.gfx", hook = "HH_spine", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

    [5] =					---通用无敌
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\无敌_spine.gfx", hook = "HH_Spine", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

    [6] =
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\暴击率提高_head.gfx", hook = "HH_Head", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

    [7] =             		---通用中毒
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\中毒效果_spine.gfx", hook = "HH_Spine", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

    [8] =
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\霜冻效果_spine.gfx", hook = "HH_Spine", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

    [9] =
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\冰封效果1_00.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

    [10] =
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\诅咒效果_spine.gfx", hook = "HH_Spine", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

    [11] =						---通用虚弱
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\虚弱效果_spine.gfx", hook = "HH_Spine", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

    [12] =					---通用流血
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\流血效果_shine.gfx", hook = "HH_Spine", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

    [13] =
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\眩晕效果_head.gfx", hook = "HH_Head", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

    [14] =					--通用石化
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\石化效果_00.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = true,
    },

    [15] =               --通用沉睡
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\沉睡_head.gfx", hook = "HH_Head", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

    [16] =            			--通用灼烧
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\灼烧_spine.gfx", hook = "HH_Spine", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

    [17] =        				--通用沉默
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\沉默效果_head.gfx", hook = "HH_Head", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

    [18] =
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\加速_00.gfx", hook = "HH_000", },
    			{ gfx = "策划联入\\伤害倍率提高_00.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

	[19] =
    {

    	gfxlist =
    		{
    			{ gfx = "策划联入\\反控制冰盾_spine.gfx", hook = "HH_Spine", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    	end_gfx=
    		{
    			{ gfx = "策划联入\\反控制冰盾消散_spine.gfx", hook = "HH_Spine", },
    		},
    },
    [20] =
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\寒冰契约.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },
    [21] =
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\网缚效果_00.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

    [22] =
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\生存技能2_spine.gfx", hook = "HH_Spine", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

    [23] =						---通用小宇宙爆发
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_jiao_L",prof=2 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_xiaotui_L", prof=2},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_datui_L", prof=2},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_jiao_R", prof=2},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_xiaotui_R", prof=2},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_datui_R",prof=2 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_Head", prof=2},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_xiaobi_L", prof=2},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_dabi_L",prof=2 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_xiaobi_R", prof=2},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_Spine02",prof=2 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_Spine1", prof=2},

				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_jiao_L",prof=3 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_xiaotui_L", prof=3},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_datui_L", prof=3},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_jiao_R", prof=3},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_xiaotui_R", prof=3},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_datui_R",prof=3 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_Head", prof=3},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_xiaobi_L", prof=3},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_dabi_L",prof=3 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_xiaobi_R", prof=3},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_Spine02",prof=3 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_Spine1", prof=3},

				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_jiao_L",prof=4 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_xiaotui_L", prof=4},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_datui_L", prof=4},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_jiao_R", prof=4},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_xiaotui_R", prof=4},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_datui_R",prof=4 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_Head", prof=4},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_xiaobi_L", prof=4},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_dabi_L",prof=4 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_xiaobi_R", prof=4},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_Spine02",prof=4 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_Spine1", prof=4},

				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_jiao_L",prof=5 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_xiaotui_L", prof=5},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_datui_L", prof=5},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_jiao_R", prof=5},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_xiaotui_R", prof=5},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_datui_R",prof=5 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_Head", prof=5},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_xiaobi_L", prof=5},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_dabi_L",prof=5 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_xiaobi_R", prof=5},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_Spine02",prof=5 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_Spine1", prof=5},

				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_jiao_L",prof=6 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_xiaotui_L", prof=6},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_datui_L", prof=6},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_jiao_R", prof=6},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_xiaotui_R", prof=6},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_datui_R",prof=6 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_Head", prof=6},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_xiaobi_L", prof=6},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_dabi_L",prof=6 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_xiaobi_R", prof=6},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_Spine02",prof=6 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_Spine1", prof=6},

				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_jiao_L",prof=7 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_xiaotui_L", prof=7},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_datui_L", prof=7},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_jiao_R", prof=7},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_xiaotui_R", prof=7},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_datui_R",prof=7 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_Head", prof=7},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_xiaobi_L", prof=7},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_dabi_L",prof=7 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_xiaobi_R", prof=7},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_Spine02",prof=7 },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_Spine1", prof=7},
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

    [24] =
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\群攻手上效果_shou.gfx", hook = "HH_shou_L", },
    			{ gfx = "策划联入\\群攻手上效果_shou.gfx", hook = "HH_shou_R", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

    [25] =						---星矢群星乱坠技能用
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\群星乱坠持续状态_HH_000.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

    [26] =						---通用冰封
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\冰块冰冻.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 1,
    	keep_still = true,
    },

  [27] =							--加隆_善之替身施放

    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\召唤分身状态光效1_hh_000.gfx",hook = "HH_000", },

			},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

    [28] =
    {
    	gfxlist =
			{
    			{ gfx = "策划联入\\节奏buff_HH_00.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false
    },

    [29] =      			--瞬——吸伤盾（通用护盾）
    {
    	gfxlist =
			{
    			{ gfx = "策划联入\\瞬伤害吸收盾_spine.gfx", hook = "HH_spine", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    	end_gfx=
    		{
    			{ gfx = "策划联入\\瞬伤害吸收盾破碎_spine.gfx", hook = "HH_spine", },
    		},

    },

    [30] = 					--瞬——极效治疗状态
    {
    	gfxlist =
			{
    			{ gfx = "策划联入\\极效治疗全身状态.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false
    },

    [31] =  				--瞬——免疫控制（通用免疫控制）
    {
    	gfxlist =
			{
    			{ gfx = "策划联入\\瞬_解控制_免疫_00.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false
    },

	[32] =							--加隆_恶之替身施放

    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\召唤分身状态光效2_hh_000.gfx", hook = "HH_000", },
			--	{ gfx = "策划联入\\召唤分身状态光效2_子01.gfx", hook = "hh_000", },
			--	{ gfx = "策划联入\\召唤分身状态光效2_子02.gfx", hook = "HH_000", },
			--	{ gfx = "策划联入\\召唤分身状态光效2_子03.gfx", hook = "HH_000", },
			},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

	[33] =  				--通用减速
    {
    	gfxlist =
			{
    			{ gfx = "策划联入\\减速_000.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false
    },
	[34] =  				--祭坛座圣衣灵魂摄取
    {
    	gfxlist =
			{
    			{ gfx = "策划联入\\灵魂摄取_HH_spine.gfx", hook = "HH_spine", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false
    },

	[35] =  				--通用反射（预留）
    {
    	gfxlist =
			{
    			{ gfx = "策划联入\\瞬_解控制_免疫_00.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false
    },

	[36] =      			--瞬——治疗状态
    {
    	gfxlist =
			{
    			{ gfx = "策划联入\\治疗状态_xiaobi_L.gfx", hook = "HH_xiaobi_L", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false
    },

	[37] =      			--瞬——输出状态
    {
    	gfxlist =
			{
				{ gfx = "策划联入\\输出状态_xiaobi_R.gfx", hook = "HH_xiaobi_R", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false
    },

	[38] =      			--瞬——移动限制
    {
    	gfxlist =
			{
    			{ gfx = "策划联入\\限制移动_00.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false
    },

	[39] =      			--瞬——移动限制
    {
    	gfxlist =
			{
    			{ gfx = "策划联入\\龙纹之盾_spine.gfx", hook = "HH_Spine", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    	end_gfx=
    		{
    			{ gfx = "策划联入\\龙纹之盾破碎_spine.gfx", hook = "HH_Spine", },
    		},
    },

    [40] =
    {
    	gfxlist =
			{
    			{ gfx = "策划联入\\冰封效果2_00.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 1,
    	keep_still = false,
    },

	[41] =
    {

    	gfxlist =
    		{
    			{ gfx = "策划联入\\自动伤害HH_spine.gfx", hook = "HH_Spine", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

	[42] =
    {

    	gfxlist =
    		{
    			{ gfx = "策划联入\\火焰盾_盾_HH_Spine1.gfx", hook = "HH_Spine1", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

    [43] =
    {
    	gfxlist =
			{
    			 { gfx = "策划联入\\凤凰标记_Head.gfx", hook = "HH_Head", },--皇后岛BOSS
    			 { gfx = "策划联入\\区域友敌提示圆形4_敌.gfx", hook = "HH_000", }

    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 1,
    	keep_still = false,
    	   end_gfx=
    		{
    			{ gfx = "NPC\\技能\\火球落地.gfx", hook = "HH_000", },
    		},
    },
    [44] =						---治疗加成
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\治疗加成光效_HH_spine.gfx", hook = "HH_spine", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },
	[44] =						---闪现
    {
    	gfxlist =
    		{
    			{ gfx = "人物\\技能\\圣衣技能\\乌鸦羽毛.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

	[45] =						---冰河 冰封 无敌
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\冰霜枷锁.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 1,
    	keep_still = true,
    	end_gfx=
    	{
    		{ gfx = "策划联入\\冰霜枷锁破碎_spine.gfx", hook = "HH_Spine", },
    	},
    },

	[46] =						---隐身
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\隐身效果测试.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },
	  [47] =							--加隆_束缚

    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\束缚技能_hh_000.gfx",hook = "HH_000", },

			},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },
   	[48] =						---佛光
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\佛光_000.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

   	[49] =						---重生
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\重生状态_瞬HH_head.gfx", hook = "HH_head", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

   	[50] =						---瞬天赋群体沉默
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\天赋群体沉默_瞬_状态.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

   	[51] =						---火焰盾
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\凤凰攻击加强_xiaobi_R.gfx", hook = "HH_xiaobi_R", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

	[52] =						---大难临头
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\大难临头_spine.gfx", hook = "HH_Spine", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

    [53] =						---大难临头
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\逆袭号角_光环_HH_000.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

    [54] =						---大难临头
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\幻想迷乐_转动音符_000.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },



--[[
GFX数据格式：
{
	gfxlist, 		[特效列表, 可以填充多项; 每一项包含gfx和hook, 其中gfx为特效路径, hook为特效挂点]
	shape_id, 		[CHANGE_SHAPE_ESSENCE, 体型道具id]
	color_index, 	[体型颜色索引, 可以选择的范围0-4, 配置见EC_PlayerConfig.cpp的_buff_skin_color表]
				  	[_buff_skin_color = {0xffeda9a9, 0xffc8e1ec, 0xffafd1af, 0xffbfbfbf, 0xffd0c891}]
	shader_id, 	[shader索引, 可以选择的范围0-2, 配置见EC_Resource.cpp的l_aShaderFiles表]
					[l_aShaderFiles = {"shaders\\ps\\armor", "shaders\\ps\\stone", "shaders\\ps\\weak"}]
	keep_still, 	[标志模式是否静止]
}
55~80为场景特殊状态光效，光效随场景的不同而不同。
--]]
    [55] =
    {
    	gfxlist =
			{
    			{ instanceIds = {407,426}, gfx = "动画\\六圣兽模型外发光.gfx", hook = "HH_000", },   --亚特兰蒂斯——海龙鳞衣采集标致
				{ instanceIds = {407,426}, gfx = "动画\\小宇宙_黑暗骨骼粒子.gfx", hook = "HH_000", },--亚特兰蒂斯——海龙鳞衣采集标致
				{ instanceIds = {207}, gfx = "人物\\技能\\狂暴战\\圆形群_地面暴.gfx", hook = "HH_000", },
				{ instanceIds = {210}, gfx = "策划联入\\女王蜂_000.gfx", hook = "HH_000"},	--七大洋神柱——六妖兽女王蜂
				{ instanceIds = {320}, gfx = "策划联入\\女王蜂_000.gfx", hook = "CC_xiong"},	--剧本：七海之柱——六妖兽女王蜂

				{ instanceIds = {4,322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_jiao_L",},--剧本：十二宫
				{ instanceIds = {4,322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_xiaotui_L",},
				{ instanceIds = {4,322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_datui_L",},
				{ instanceIds = {4,322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_jiao_R",},
				{ instanceIds = {4,322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_xiaotui_R",},
				{ instanceIds = {4,322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_datui_R",},
				{ instanceIds = {4,322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_Head",},
				{ instanceIds = {4,322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_xiaobi_L",},
				{ instanceIds = {4,322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_dabi_L",},
				{ instanceIds = {4,322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_xiaobi_R",},
				{ instanceIds = {4,322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_Spine02",},
				{ instanceIds = {4,322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_Spine1",},

				{ instanceIds = {335}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_jiao_L",},--仲夏节活动本：纱织祈福
				{ instanceIds = {335}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_xiaotui_L",},
				{ instanceIds = {335}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_datui_L",},
				{ instanceIds = {335}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_jiao_R",},
				{ instanceIds = {335}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_xiaotui_R",},
				{ instanceIds = {335}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_datui_R",},
				{ instanceIds = {335}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_Head",},
				{ instanceIds = {335}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_xiaobi_L",},
				{ instanceIds = {335}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_dabi_L",},
				{ instanceIds = {335}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_xiaobi_R",},
				{ instanceIds = {335}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_Spine02",},
				{ instanceIds = {335}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_Spine1",},

				{ instanceIds = {411}, gfx = "策划联入\\冰封效果1_00.gfx", hook = "HH_000", },--北欧小镇
				{ instanceIds = {411}, gfx = "策划联入\\冰霜枷锁.gfx", hook = "HH_000", },
				{ instanceIds = {411}, gfx = "策划联入\\荆棘缠绕_000.gfx", hook = "HH_000", },
                { instanceIds = {215}, gfx = "策划联入\\尼伯龙根诅咒_000.gfx", hook = "HH_000",  },  --十二宫双鱼宫
                { instanceIds = {216}, gfx = "策划联入\\冥斗士天魔星状态1_HH_花朵.gfx", hook = "HH_花朵",  },  --哈迪斯城

                { instanceIds = {342}, gfx = "人物\\技能\\圣域\\晕小技能加强.gfx", hook = "HH_000",  },  --月度日常射手

				{ instanceIds = {416}, gfx = "策划联入\\红火_spine.gfx", hook = "HH_Spine1",},
				{ instanceIds = {2}, gfx = "npc\\技能\\冥斗士天间星_金币散1.gfx", hook = "HH_000",},
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 1,
    	keep_still = false,
    },

    [56] =
    {
    	gfxlist =
			{
    			{ instanceIds = {407}, gfx = "策划联入\\紫水晶封印_000.gfx", hook = "HH_000", },--亚特兰蒂斯——黄金笛沉默控制
				{ instanceIds = {407}, gfx = "策划联入\\沉默效果_head.gfx", hook = "HH_Head", },--亚特兰蒂斯——黄金笛沉默控制
				{ instanceIds = {210}, gfx = "策划联入\\吸血蝙蝠_000.gfx", hook = "HH_000"},	--七大洋神柱——六妖兽吸血蝙蝠
				{ instanceIds = {320}, gfx = "策划联入\\吸血蝙蝠_000.gfx", hook = "CC_xiong"},	--剧本：七海之柱——六妖兽吸血蝙蝠
    			{ instanceIds = {213}, gfx = "策划联入\\大难临头绿_spine.gfx", hook = "HH_Spine", }, --女神的挽歌-次元空间-正义之箭
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_jiao_L",},--剧本：十二宫
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_xiaotui_L", },
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_datui_L", },
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_jiao_R", },
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_xiaotui_R", },
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_datui_R",},
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_Head", },
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_xiaobi_L", },
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_dabi_L",},
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_xiaobi_R", },
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_Spine02",},
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_Spine1", },
                { instanceIds = {215}, gfx = "策划联入\\人物\\通用\\回城身体效果.gfx", hook = "HH_jiao_L",},  --十二宫双鱼宫
                { instanceIds = {215}, gfx = "策划联入\\人物\\通用\\回城身体效果.gfx", hook = "HH_xiaotui_L", },
                { instanceIds = {215}, gfx = "策划联入\\人物\\通用\\回城身体效果.gfx", hook = "HH_datui_L", },
                { instanceIds = {215}, gfx = "策划联入\\人物\\通用\\回城身体效果.gfx", hook = "HH_jiao_R", },
                { instanceIds = {215}, gfx = "策划联入\\人物\\通用\\回城身体效果.gfx", hook = "HH_xiaotui_R", },
                { instanceIds = {215}, gfx = "策划联入\\人物\\通用\\回城身体效果.gfx", hook = "HH_datui_R",},
                { instanceIds = {215}, gfx = "策划联入\\人物\\通用\\回城身体效果.gfx", hook = "HH_Head", },
                { instanceIds = {215}, gfx = "策划联入\\人物\\通用\\回城身体效果.gfx", hook = "HH_xiaobi_L", },
                { instanceIds = {215}, gfx = "策划联入\\人物\\通用\\回城身体效果.gfx", hook = "HH_dabi_L",},
                { instanceIds = {215}, gfx = "策划联入\\人物\\通用\\回城身体效果.gfx", hook = "HH_xiaobi_R", },
                { instanceIds = {215}, gfx = "策划联入\\人物\\通用\\回城身体效果.gfx", hook = "HH_Spine02",},
                { instanceIds = {215}, gfx = "策划联入\\人物\\通用\\回城身体效果.gfx", hook = "HH_Spine1", },
                { instanceIds = {216}, gfx = "策划联入\\冥斗士天魔星状态2_HH_花朵.gfx", hook = "HH_花朵",  },  --哈迪斯城
				{ instanceIds = {416}, gfx = "策划联入\\金火_spine.gfx", hook = "HH_Spine1",},

    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 1,
    	keep_still = false,
    },

    [57] =
    {
    	gfxlist =
			{
    			{ instanceIds = {407}, gfx = "策划联入\\冰封效果1_00.gfx", hook = "HH_000", },--亚特兰蒂斯——海龙冰冻
				{ instanceIds = {407}, gfx = "策划联入\\黑暗冰冻_000.gfx", hook = "HH_000", },--亚特兰蒂斯——海龙冰冻
				{ instanceIds = {210}, gfx = "策划联入\\北极熊_000.gfx", hook = "HH_000"},	--七大洋神柱——六妖兽北极熊
				{ instanceIds = {320}, gfx = "策划联入\\北极熊_000.gfx", hook = "CC_xiong"},	--剧本：七海之柱——六妖兽北极熊
    			{ instanceIds = {213}, gfx = "策划联入\\大难临头_spine.gfx", hook = "HH_Spine", }, --女神的挽歌-次元空间-惩戒之箭
				{ instanceIds = {306,322,323,324,325,326,327,328,329,330,331,332,333,334}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_jiao_L"},--剧本：十二宫
				{ instanceIds = {306,322,323,324,325,326,327,328,329,330,331,332,333,334}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_xiaotui_L"},
				{ instanceIds = {306,322,323,324,325,326,327,328,329,330,331,332,333,334}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_datui_L"},
				{ instanceIds = {306,322,323,324,325,326,327,328,329,330,331,332,333,334}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_jiao_R"},
				{ instanceIds = {306,322,323,324,325,326,327,328,329,330,331,332,333,334}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_xiaotui_R"},
				{ instanceIds = {306,322,323,324,325,326,327,328,329,330,331,332,333,334}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_datui_R"},
				{ instanceIds = {306,322,323,324,325,326,327,328,329,330,331,332,333,334}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_Head"},
				{ instanceIds = {306,322,323,324,325,326,327,328,329,330,331,332,333,334}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_xiaobi_L"},
				{ instanceIds = {306,322,323,324,325,326,327,328,329,330,331,332,333,334}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_dabi_L"},
				{ instanceIds = {306,322,323,324,325,326,327,328,329,330,331,332,333,334}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_xiaobi_R"},
				{ instanceIds = {306,322,323,324,325,326,327,328,329,330,331,332,333,334}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_Spine02"},
				{ instanceIds = {306,322,323,324,325,326,327,328,329,330,331,332,333,334}, gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_Spine1"},
                { instanceIds = {216}, gfx = "策划联入\\冥斗士天魔星状态3_HH_花朵.gfx", hook = "HH_花朵",  },  --哈迪斯城
				{ instanceIds = {416}, gfx = "策划联入\\绿火_spine.gfx", hook = "HH_Spine1",},
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 1,
    	keep_still = false,
    },

    [58] =
    {
    	gfxlist =
        {
            { instanceIds = {213}, gfx = "NPC\\通用\\红边缘.gfx", hook = "HH_000", }, --英雄副本-BOSS狂暴
            { instanceIds = {216}, gfx = "NPC\\通用\\红边缘.gfx", hook = "HH_000", }, --英雄副本-BOSS狂暴
            { instanceIds = {217}, gfx = "NPC\\通用\\红边缘.gfx", hook = "HH_000", }, --英雄副本-BOSS狂暴
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_jiao_L"},--剧本：十二宫
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_xiaotui_L"},
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_datui_L"},
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_jiao_R"},
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_xiaotui_R"},
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_datui_R"},
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_Head"},
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_xiaobi_L"},
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_dabi_L"},
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_xiaobi_R"},
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_Spine02"},
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_Spine1"},
			{ instanceIds = {416}, gfx = "策划联入\\青火_spine.gfx", hook = "HH_Spine1",},
        },
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 1,
    	keep_still = false,
    },

    [59] = --> 本编号下的特效均为停止动作的特效
    {
    	gfxlist =
        {
            { instanceIds = {213}, gfx = "策划联入\\冰封_冰块.gfx", hook = "HH_000", }, --女神的挽歌-无光效静止
            { instanceIds = {214}, gfx = "策划联入\\冰封_冰块.gfx", hook = "HH_000", }, --女神的挽歌后-无光效静止
			{ instanceIds = {218}, gfx = "策划联入\\冰封_冰块.gfx", hook = "HH_000", }, --蓝冰堡-无光效静止
        },
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 1,
    	keep_still = true,
    },

    [60] =
    {
    	gfxlist =
		{
    		{ instanceIds = {6}, gfx = "策划联入\\凤凰标记_Head.gfx", hook = "HH_Head", },  --皇后岛BOSS
    		{ instanceIds = {206}, gfx = "策划联入\\凤凰标记_Head.gfx", hook = "HH_Head", },--十风穴——凤凰座一辉技能效果
    		{ instanceIds = {216}, gfx = "策划联入\\凤凰标记_Head.gfx", hook = "HH_Head", },--英雄十风穴——凤凰座一辉技能效果
    		{ instanceIds = {209}, gfx = "策划联入\\火焰光环_spine.gfx", hook = "HH_Spine", },--冰海神殿——天枢星齐格弗里德火焰之环
			{ instanceIds = {210}, gfx = "策划联入\\魔鹰_000.gfx", hook = "HH_000"},	--七大洋神柱——六妖兽魔鹰
			{ instanceIds = {320}, gfx = "策划联入\\魔鹰_000.gfx", hook = "CC_xiong"},	--剧本：七海之柱——六妖兽魔鹰
    		{ instanceIds = {213}, gfx = "策划联入\\地妖星_返魂灯.gfx", hook = "HH_Spine", }, --女神的挽歌-地妖星-返魂灯
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_jiao_L"},--剧本：十二宫
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_xiaotui_L"},
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_datui_L"},
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_jiao_R"},
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_xiaotui_R"},
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_datui_R"},
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_Head"},
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_xiaobi_L"},
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_dabi_L"},
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_xiaobi_R"},
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_Spine02"},
			{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334},506, gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_Spine1"},
			{ instanceIds = {416}, gfx = "策划联入\\紫火_spine.gfx", hook = "HH_Spine1",},
    	},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 1,
    	keep_still = false,
    },

    [61] =
    {
    	gfxlist =
			{
    			{ instanceIds = {206}, gfx = "策划联入\\黑龙附体_spine.gfx", hook = "HH_Spine", },--十风穴——黑暗天龙技能效果
    			{ instanceIds = {216}, gfx = "策划联入\\黑龙附体_spine.gfx", hook = "HH_Spine", },--英雄十风穴——黑暗天龙技能效果
    			{ instanceIds = {209}, gfx = "策划联入\\寒冰光环_spine.gfx", hook = "HH_Spine", },--冰海神殿——天枢星齐格弗里德冰霜之环
				{ instanceIds = {210}, gfx = "策划联入\\恶狼_000.gfx", hook = "HH_000"},	--七大洋神柱——六妖兽恶狼
				{ instanceIds = {320}, gfx = "策划联入\\恶狼_000.gfx", hook = "CC_xiong"},	--剧本：七海之柱——六妖兽恶狼
    			{ instanceIds = {213}, gfx = "策划联入\\地妖星_无寿蝶.gfx", hook = "HH_000", }, --女神的挽歌-地妖星-无寿蝶
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334}, gfx = "动画\\小宇宙_黄金骨骼粒子.gfx", hook = "HH_000", }, --剧本：十二宫
				{ instanceIds = {506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_jiao_L"},--天降奇兵战场被动触发特效
				{ instanceIds = {506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_xiaotui_L"}, 
				{ instanceIds = {506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_datui_L"},
				{ instanceIds = {506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_jiao_R"},
				{ instanceIds = {506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_xiaotui_R"},
				{ instanceIds = {506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_datui_R"},
				{ instanceIds = {506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_Head"},
				{ instanceIds = {506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_xiaobi_L"},
				{ instanceIds = {506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_dabi_L"},
				{ instanceIds = {506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_xiaobi_R"},
				{ instanceIds = {506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_Spine02"},
				{ instanceIds = {506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_海龙.gfx", hook = "HH_Spine1"},
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 1,
    	keep_still = false,
    },

    [62] =
    {
    	gfxlist =
			{
    			{ instanceIds = {206}, gfx = "策划联入\\黑蛇缠绕_000.gfx", hook = "HH_000", },--十风穴——黑暗仙女技能效果
    			{ instanceIds = {216}, gfx = "策划联入\\黑蛇缠绕_000.gfx", hook = "HH_000", },--英雄十风穴——黑暗仙女技能效果
    			{ instanceIds = {209}, gfx = "策划联入\\琴弦束缚_spine02.gfx", hook = "HH_Spine", },--冰海神殿——摇光星米伊美技能效果
				{ instanceIds = {210}, gfx = "策划联入\\巨蟒_000.gfx", hook = "HH_000"},	--七大洋神柱——六妖兽巨蟒
				{ instanceIds = {320}, gfx = "策划联入\\巨蟒_000.gfx", hook = "CC_xiong"},	--剧本：七海之柱——六妖兽巨蟒
    			{ instanceIds = {213,36}, gfx = "策划联入\\地暗星_骷髅标记.gfx", hook = "HH_Head", }, --女神的挽歌-地暗星尼奥比-骷髅标记
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_jiao_L"},--剧本：十二宫
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_xiaotui_L"},
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_datui_L"},
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_jiao_R"},
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_xiaotui_R"},
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_datui_R"},
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_Head"},
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_xiaobi_L"},
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_dabi_L"},
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_xiaobi_R"},
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_Spine02"},
				{ instanceIds = {322,323,324,325,326,327,328,329,330,331,332,333,334,506}, gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_Spine1"},
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 1,
    	keep_still = false,
    },

    [63] =
    {
    	gfxlist =
			{
    			{ instanceIds = {206}, gfx = "策划联入\\黑暗冰冻_000.gfx", hook = "HH_000", },--十风穴——黑暗白鸟技能效果
    			{ instanceIds = {216}, gfx = "策划联入\\黑暗冰冻_000.gfx", hook = "HH_000", },--英雄十风穴——黑暗白鸟技能效果
    			{ instanceIds = {405}, gfx = "策划联入\\黑暗冰冻_000.gfx", hook = "HH_000", },
    			{ instanceIds = {212}, gfx = "策划联入\\深红毒针_spine.gfx", hook = "HH_Spine", }, --黄金十二宫-天蝎座宫-米罗深红毒针
    			{ instanceIds = {213}, gfx = "策划联入\\地暗星_青色香水.gfx", hook = "HH_000", }, --女神的挽歌-地暗星尼奥比-青色香水
    			{ instanceIds = {214}, gfx = "策划联入\\沙加_阿赖耶识.gfx", hook = "HH_Head", }, --女神的挽歌后——第八感
    			{ instanceIds = {214}, gfx = "策划联入\\佛光_000.gfx", hook = "HH_000", }, --女神的挽歌后——第八感
				
				{ instanceIds = {506}, gfx = "人物\\击中\\曙光女神之宽恕_受击.gfx", hook = "HH_xiong",  },  --天降奇兵战场缩地
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 1,
    	keep_still = false,
        end_gfx =
            {
    			{ instanceIds = {209}, gfx = "策划联入\\尼伯龙根诅咒扩散_000.gfx", hook = "HH_000", }, --冰海神殿——女武神瓦尔基里
            },
    },

    [64] =
    {
    	gfxlist =
			{
    			{ instanceIds = {206}, gfx = "策划联入\\黑死拳_000.gfx", hook = "HH_000", },     --十风穴——黑暗天马技能效果
    			{ instanceIds = {216}, gfx = "策划联入\\黑死拳_000.gfx", hook = "HH_000", },     --英雄十风穴——黑暗天马技能效果
    			{ instanceIds = {410}, gfx = "策划联入\\紫水晶封印_000.gfx", hook = "HH_000", }, --冰火深渊——天权星紫水晶封印
				{ instanceIds = {415}, gfx = "策划联入\\紫水晶封印_000.gfx", hook = "HH_000", }, --大阴谋——天权星紫水晶封印
    			{ instanceIds = {209}, gfx = "策划联入\\尼伯龙根诅咒_000.gfx", hook = "HH_000", }, --冰海神殿——女武神瓦尔基里
    			{ instanceIds = {212}, gfx = "策划联入\\钳制念动波_击中锁住HH_spine.gfx", hook = "HH_Spine", }, --黄金十二宫-天蝎座宫-米罗念力幽禁
    			{ instanceIds = {213}, gfx = "策划联入\\地暗星_红色香水.gfx", hook = "HH_000", }, --女神的挽歌-地暗星尼奥比-红色香水
    			{ instanceIds = {214}, gfx = "策划联入\\尼伯龙根诅咒_000.gfx", hook = "HH_000", }, --女神的挽歌后——地暴星巨人之拳标记
    			{ instanceIds = {214}, gfx = "策划联入\\大难临头_spine.gfx", hook = "HH_Spine", }, --女神的挽歌后——地暴星巨人之拳标记
                { instanceIds = {333}, gfx = "策划联入\\尼伯龙根诅咒_000.gfx", hook = "HH_000",  },  --剧本12宫双鱼宫缠绕光效
				
				{ instanceIds = {506}, gfx = "人物\\击中\\交藤缠绕击中.gfx", hook = "HH_000",  },  --天降奇兵战场突进
				
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 1,
    	keep_still = false,
    },




-------------------80之前场景用

    [81] =  --天马天赋折光盾
    {
        gfxlist =
            {
                { gfx = "策划联入\\星矢_折光_HH_spine.gfx", hook = "HH_spine", },
            },
        shape_id = 0,
        color_index = 0,
        shader_id = 0,
        keep_still = false,
        end_gfx=
            {
                { gfx = "策划联入\\星矢_折光破碎HH_spine.gfx", hook = "HH_spine", },
            },
    },
	[82] =            --地狱犬钢球光效
     {
     	gfxlist =
     		{
     			{ gfx = "策划联入\\地狱钢球锁链击中_HH_000.gfx", hook = "HH_000", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
     [83] =            --白鲸灵魂轰炸光效
     {
     	gfxlist =
     		{
     			{ gfx = "策划联入\\男圣衣技能_灵魂轰炸_HH_000.gfx", hook = "HH_000", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
     [84] =            --天英星反击效果光效
     {
     	gfxlist =
     		{
     			{ gfx = "策划联入\\火焰紧绕_buff火圈_spine.gfx", hook = "HH_spine", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
     [85] =            --海魔女原著技能1效果光效
     {
     	gfxlist =
     		{
     			{ gfx = "策划联入\\死亡之潮_hh_000.gfx", hook = "HH_000", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
     [86] =            --天间座原著技能1效果光效
     {
     	gfxlist =
     		{
     			{ gfx = "NPC\\技能\\冥斗士天间星_技能3_船桨围绕全.gfx", hook = "HH_spine", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
	 [87] =            --奥路菲竖琴祝福状态
     {
     	gfxlist =
     		{
     			{ gfx = "策划联入\\音符环绕_Spine.gfx", hook = "HH_spine", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
	 [88] =            --美杜莎盾反击效果
     {
     	gfxlist =
     		{
     			{ gfx = "策划联入\\美杜莎之盾_Spine.gfx", hook = "HH_spine", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
	 [89] =            --扔蛋糕效果
     {
     	gfxlist =
     		{
     			{ gfx = "策划联入\\蛋糕击中_HH_xiong.gfx", hook = "HH_head", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
	 [90] =            --撒花瓣效果
     {
     	gfxlist =
     		{
     			{ gfx = "策划联入\\花瓣雨特效g.gfx", hook = "HH_000", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
	 [91] =            --烟花效果
     {
     	gfxlist =
     		{
     			{ gfx = "策划联入\\绽放烟花特效d.gfx", hook = "HH_000", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },

	 [92] =            --沙加念珠祝福状态
     {
     	gfxlist =
     		{
     			{ gfx = "策划联入\\佛珠守护状态_HH_spine.gfx", hook = "HH_spine", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },

	 [93] =            --沙加念珠封印状态
     {
     	gfxlist =
     		{
     			{ gfx = "佛珠封印_HH_sipne.gfx", hook = "HH_spine", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = true,
     },
	 [94] =            --电击
     {
     	gfxlist =
     		{
     			{ gfx = "人物\\技能\\仙女\\聚怪与减速.gfx", hook = "HH_spine", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
	 [95] =            --电击
     {
     	gfxlist =
     		{
     			{ gfx = "策划联入\\原著技能星云锁链_身上锁链_spine.gfx", hook = "HH_spine", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
	 [96] =            --阿布罗狄玫瑰持续伤血
     {
     	gfxlist =
     		{
     			{ gfx = "策划联入\\玫瑰中毒效果HH_head.gfx", hook = "HH_head", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
	 [97] =            --阿布罗狄玫瑰庇护效果
     {
     	gfxlist =
     		{
     			{ gfx = "策划联入\\玫瑰花状态HH_spine.gfx", hook = "HH_spine", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
   [98] =            --组队竞技场挂旗特效
     {
     	gfxlist =
     		{
     			{ gfx = "策划联入\\战场背旗_SaintWing.gfx", hook = "HH_SaintWing", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
   [99] =            --组队竞技场挂旗标志特效
     {
     	gfxlist =
     		{
     			{ gfx = "策划联入\\战场队长箭头_000.gfx", hook = "HH_000", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
   [100] =            --组队竞技场挂旗特效
     {
     	gfxlist =
     		{
     			{ gfx = "策划联入\\龙旗击中效果_SaintWing.gfx", hook = "HH_SaintWing", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
    [101] =						---通用小宇宙爆发
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_jiao_L",},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_xiaotui_L",},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_datui_L", },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_jiao_R",},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_xiaotui_R", },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_datui_R", },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_Head", },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_xiaobi_L", },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_dabi_L",},
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_xiaobi_R", },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_Spine02", },
				{ gfx = "策划联入\\小宇宙暴发全身气效果_all_黄金.gfx", hook = "HH_Spine1",} ,

    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },
   [102] =							--加隆_恶之攻击
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\恶之普通攻击hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_R", },
				{ gfx = "策划联入\\恶之普通攻击hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_L", },
				{ gfx = "策划联入\\恶之普通攻击_hh_000.gfx", hook = "HH_000", },
			},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },

   [103] =							--加隆_善之攻击

    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\善之普通攻击hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_R", },
				{ gfx = "策划联入\\善之普通攻击hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_L", },
				{ gfx = "策划联入\\善之普通攻击_hh_000.gfx", hook = "HH_000", },
			},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },
    [104] =						---星矢群星乱坠技能用
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\空气防御壁_000.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },
	[105] =  				--通用混乱（预留）
    {
    	gfxlist =
			{
    			{ gfx = "策划联入\\瞬_解控制_免疫_00.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false
    },

    [107] =						---受击回血
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\群体受攻击治疗_盾_HH_spine.gfx", hook = "HH_spine", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },
	   [108] =						---驱散_回血
    {
    	gfxlist =
    		{
    			{ gfx = "NPC\\技能\\15米aoe地面爆开.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },
	   [109] =						---驱散恶之花
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\魔皇拳状态特效_000.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },
	   [110] =						---驱散_减速
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\自动伤害子效果.gfx", hook = "HH_spine", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },
   [111] =            --组队竞技场挂旗特效蓝
     {
     	gfxlist =
     		{
     			{ gfx = "策划联入\\龙旗击中效果蓝_saintwing.gfx", hook = "HH_SaintWing", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
   [112] =            --组队竞技场挂旗特效红
     {
     	gfxlist =
     		{
     			{ gfx = "策划联入\\龙旗击中效果红_saintwing.gfx", hook = "HH_SaintWing", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
   [113] =            --组队竞技场挂旗特效大蓝
     {
     	gfxlist =
     		{
     			{ gfx = "策划联入\\龙旗蓝放大版_saintwing", hook = "HH_SaintWing", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
   [114] =            --组队竞技场挂旗特效大红
     {
     	gfxlist =
     		{
     			{ gfx = "策划联入\\龙旗红放大版_saintwing", hook = "HH_SaintWing", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },

--    [83] =        				--通用沉默
--    {
--    	gfxlist =
--    		{
--    			{ gfx = "策划联入\\沉默效果_head.gfx", hook = "HH_Head", },
--    		},
--    	shape_id = 0,
--    	color_index = 0,
--    	shader_id = 0,
--    	keep_still = false,
--    },




-----256号之前的光效是广播光效位

		   [300] =            --混乱背景效果
     {
     	gfxlist =
     		{
     			{ gfx = "策划联入\\全景火焰.gfx", hook = "HH_000", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
          [303] =
    {
        gfxlist =
            {
                { gfx = "策划联入\\树妖女_魅惑.gfx", hook = "HH_Spine", },
            },
        shape_id = 0,
        color_index = 0,
        shader_id = 0,
        keep_still = false,
    },

       [305] =                      ---通用小宇宙爆发
    {
        gfxlist =
            {
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_jiao_L",prof=2 },
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_xiaotui_L", prof=2},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_datui_L", prof=2},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_jiao_R", prof=2},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_xiaotui_R", prof=2},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_datui_R",prof=2 },
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_Head", prof=2},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_xiaobi_L", prof=2},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_dabi_L",prof=2 },
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_xiaobi_R", prof=2},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_Spine02",prof=2 },
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天马.gfx", hook = "HH_Spine1", prof=2},

                { gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_jiao_L",prof=3 },
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_xiaotui_L", prof=3},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_datui_L", prof=3},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_jiao_R", prof=3},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_xiaotui_R", prof=3},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_datui_R",prof=3 },
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_Head", prof=3},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_xiaobi_L", prof=3},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_dabi_L",prof=3 },
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_xiaobi_R", prof=3},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_Spine02",prof=3 },
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_白鸟.gfx", hook = "HH_Spine1", prof=3},

                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_jiao_L",prof=4 },
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_xiaotui_L", prof=4},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_datui_L", prof=4},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_jiao_R", prof=4},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_xiaotui_R", prof=4},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_datui_R",prof=4 },
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_Head", prof=4},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_xiaobi_L", prof=4},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_dabi_L",prof=4 },
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_xiaobi_R", prof=4},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_Spine02",prof=4 },
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_天龙.gfx", hook = "HH_Spine1", prof=4},

                { gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_jiao_L",prof=5 },
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_xiaotui_L", prof=5},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_datui_L", prof=5},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_jiao_R", prof=5},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_xiaotui_R", prof=5},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_datui_R",prof=5 },
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_Head", prof=5},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_xiaobi_L", prof=5},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_dabi_L",prof=5 },
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_xiaobi_R", prof=5},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_Spine02",prof=5 },
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_仙女.gfx", hook = "HH_Spine1", prof=5},

                { gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_jiao_L",prof=6 },
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_xiaotui_L", prof=6},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_datui_L", prof=6},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_jiao_R", prof=6},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_xiaotui_R", prof=6},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_datui_R",prof=6 },
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_Head", prof=6},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_xiaobi_L", prof=6},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_dabi_L",prof=6 },
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_xiaobi_R", prof=6},
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_Spine02",prof=6 },
                { gfx = "策划联入\\小宇宙暴发全身气效果_all_凤凰.gfx", hook = "HH_Spine1", prof=6},
            },
        shape_id = 0,
        color_index = 0,
        shader_id = 0,
        keep_still = false,
    },
        [306] =                     ---佛光
    {
        gfxlist =
            {
                { gfx = "策划联入\\佛光替代_000.gfx", hook = "HH_000", },
            },
        shape_id = 0,
        color_index = 0,
        shader_id = 0,
        keep_still = false,
    },

  [307] =							--加隆_二次元空间

    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\空间转移_空间_hh_000.gfx",hook = "HH_000", },

			},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },


    [998] =
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\测试_中毒效果.gfx", hook = "HH_Spine", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },
    [999] =
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\小宇宙_金黄.gfx", hook = "HH_jiao_L", },
    			{ gfx = "策划联入\\小宇宙_金黄.gfx", hook = "HH_jiao_R", },
    			{ gfx = "策划联入\\小宇宙_金黄.gfx", hook = "HH_jian_L", },
    			{ gfx = "策划联入\\小宇宙_金黄.gfx", hook = "HH_jian_R", },
    			{ gfx = "策划联入\\小宇宙_金黄.gfx", hook = "HH_xiaotui_R", },
    			{ gfx = "策划联入\\小宇宙_金黄.gfx", hook = "HH_xiaotui_L", },
    			{ gfx = "策划联入\\小宇宙_金黄.gfx", hook = "HH_xiaobi_L", },
    			{ gfx = "策划联入\\小宇宙_金黄.gfx", hook = "HH_xiaobi_R", },
    			{ gfx = "策划联入\\小宇宙_金黄.gfx", hook = "HH_hair", },
    			{ gfx = "策划联入\\小宇宙_金黄.gfx", hook = "HH_wuqi_L", },
    			{ gfx = "策划联入\\小宇宙_金黄.gfx", hook = "HH_wuqi_R", },
    			--{ gfx = "策划联入\\小宇宙_双手剑.gfx", hook = "HH_righthandweapon", },

    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },


    --1000以后是瞬发技能用的光效
	     [1000] =            --29号技能星矢爆发buff用光效
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\团队输出爆发_00.gfx", hook = "HH_000", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },
--~     	 [1001] =            --88号 紫龙保命技能用光效
--~     {
--~     	gfxlist =
--~     		{
--~     			{ gfx = "人物\\技能\\圣域\\生存技能2_手上效果.gfx", hook = "HH_shou_R", },
--~     			{ gfx = "人物\\技能\\圣域\\生存技能2_手上效果.gfx", hook = "HH_shou_L", },
--~     			{ gfx = "人物\\技能\\圣域\\生存技能2_地面.gfx", hook = "HH_000",},
--~     			{ gfx = "人物\\技能\\圣域\\生存技能2_轨迹旋转.gfx", hook = "HH_000",},
--~     		},
--~     	shape_id = 0,
--~     	color_index = 0,
--~     	shader_id = 0,
--~     	keep_still = false,
--~     },


	    	 [1002] =            --- 暂时无用
    {
    	gfxlist =
    		{
    			{ gfx = "策划联入\\加速_00", hook = "HH_000", },
			},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },
	    	 [1003] =            --61号 星矢群攻buff技能用光效
    {
    	gfxlist =
    		{
    			{ gfx = "人物\\通用\\星矢身体效果.gfx", hook = "HH_jiao_L", },
				{ gfx = "人物\\通用\\星矢身体效果.gfx", hook = "HH_xiaotui_L", },
				{ gfx = "人物\\通用\\星矢身体效果.gfx", hook = "HH_datui_L", },
				{ gfx = "人物\\通用\\星矢身体效果.gfx", hook = "HH_jiao_R", },
				{ gfx = "人物\\通用\\星矢身体效果.gfx", hook = "HH_xiaotui_R", },
				{ gfx = "人物\\通用\\星矢身体效果.gfx", hook = "HH_datui_R", },
				{ gfx = "人物\\通用\\星矢身体效果.gfx", hook = "HH_Head", },
				{ gfx = "人物\\通用\\星矢身体效果.gfx", hook = "HH_xiaobi_L", },
				{ gfx = "人物\\通用\\星矢身体效果.gfx", hook = "HH_dabi_L", },
				{ gfx = "人物\\通用\\星矢身体效果.gfx", hook = "HH_xiaobi_R", },
				{ gfx = "人物\\通用\\星矢身体效果.gfx", hook = "HH_Spine02", },
				{ gfx = "人物\\通用\\星矢身体效果.gfx", hook = "HH_Spine1", },
				{ gfx = "人物\\技能\\圣域\\群攻BUFF脚下.gfx", hook = "HH_000", },
				{ gfx = "人物\\技能\\圣域\\群攻BUFF_星矢.gfx", hook = "HH_000", },
			},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false,
    },
 	    	 [1004] =            --224号 冰河吸伤罩技能用光效
     {
     	gfxlist =
     		{
     			{ gfx = "策划联入\\反控制冰盾自身效果_spine.gfx", hook = "HH_Spine", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
	  	    	 [1005] =            --224号 技能物品群BUFF
     {
     	gfxlist =
     		{
     			{ gfx = "动画\\爆开.gfx", hook = "HH_xiong", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
	  	    	 [1006] =            --224号 技能物品群DEBUFF
     {
     	gfxlist =
     		{
     			{ gfx = "人物\\技能\\凤凰\\不死_爆.gfx", hook = "HH_Spine", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
	 		    [1007] =      			--瞬——移动限制
    {
    	gfxlist =
			{
    			{ gfx = "策划联入\\龙纹之盾_spine.gfx", hook = "HH_Spine", },
    		},
    	shape_id = 0,
    	color_index = 0,
    	shader_id = 0,
    	keep_still = false
    },

	  	    	 [1008] =            --224号 单体技能物品瞬发光效
     {
     	gfxlist =
     		{
     			{ gfx = "人物\\技能\\仙女\\群体持续治疗_地面上升.gfx", hook = "HH_Spine", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
	 			[1009] =            --仙女极效治疗技能用光效
     {
     	gfxlist =
     		{
     			{ gfx = "人物\\技能\\仙女\\极效治疗起.gfx", hook = "HH_000", },
				{ gfx = "人物\\技能\\仙女\\极效治疗翅膀.gfx", hook = "HH_xiong", },
				{ gfx = "人物\\技能\\仙女\\极效治疗聚.gfx", hook = "HH_000", },
				{ gfx = "人物\\技能\\仙女\\极效治疗身体烟.gfx", hook = "HH_Spine1", },
				{ gfx = "人物\\技能\\仙女\\极效治疗身体烟.gfx", hook = "HH_Spine02", },
				{ gfx = "人物\\技能\\仙女\\极效治疗身体烟.gfx", hook = "HH_dabi_L", },
				{ gfx = "人物\\技能\\仙女\\极效治疗身体烟.gfx", hook = "HH_dabi_R", },
				{ gfx = "人物\\技能\\仙女\\极效治疗身体烟.gfx", hook = "HH_xiaobi_L", },
				{ gfx = "人物\\技能\\仙女\\极效治疗身体烟.gfx", hook = "HH_xiaobi_R", },
				{ gfx = "人物\\技能\\仙女\\极效治疗身体烟.gfx", hook = "HH_datui_L", },
				{ gfx = "人物\\技能\\仙女\\极效治疗身体烟.gfx", hook = "HH_datui_R", },
				{ gfx = "人物\\技能\\仙女\\极效治疗身体烟.gfx", hook = "HH_xiaotui_L", },
				{ gfx = "人物\\技能\\仙女\\极效治疗身体烟.gfx", hook = "HH_xiaotui_R", },
				{ gfx = "人物\\技能\\仙女\\极效治疗身体烟.gfx", hook = "HH_jiao_L", },
				{ gfx = "人物\\技能\\仙女\\极效治疗身体烟.gfx", hook = "HH_jiao_R", },
     			{ gfx = "人物\\通用\\起跳尘.gfx", hook = "HH_000", },
     		},
    	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
     	keep_still = false,
     },
	  	    	 [1010] =            --224号 单体技能物品瞬发光效
     {
     	gfxlist =
     		{
     			{ gfx = "人物\\击中\\一辉_火焰盾.gfx", hook = "HH_Spine", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
	  	    	 [1011] =            --凤凰不死光效
     {
     	gfxlist =
     		{
     			{ gfx = "人物\\通用\\model效果_红.gfx", hook = "HH_Spine", },

				{ gfx = "人物\\通用\\小火燃烧身体效果.gfx", hook = "HH_Spine", },
    			{ gfx = "人物\\通用\\小火燃烧身体效果.gfx", hook = "HH_jiao_L", },
				{ gfx = "人物\\通用\\小火燃烧身体效果.gfx", hook = "HH_xiaotui_L", },
				{ gfx = "人物\\通用\\小火燃烧身体效果.gfx", hook = "HH_datui_L", },
				{ gfx = "人物\\通用\\小火燃烧身体效果.gfx", hook = "HH_jiao_R", },
				{ gfx = "人物\\通用\\小火燃烧身体效果.gfx", hook = "HH_xiaotui_R", },
				{ gfx = "人物\\通用\\小火燃烧身体效果.gfx", hook = "HH_datui_R", },
				{ gfx = "人物\\通用\\小火燃烧身体效果.gfx", hook = "HH_Head", },
				{ gfx = "人物\\通用\\小火燃烧身体效果.gfx", hook = "HH_xiaobi_L", },
				{ gfx = "人物\\通用\\小火燃烧身体效果.gfx", hook = "HH_dabi_L", },
				{ gfx = "人物\\通用\\小火燃烧身体效果.gfx", hook = "HH_xiaobi_R", },
				{ gfx = "人物\\通用\\小火燃烧身体效果.gfx", hook = "HH_Spine02", },
				{ gfx = "人物\\通用\\小火燃烧身体效果.gfx", hook = "HH_Spine1", },
				{ gfx = "人物\\技能\\凤凰\\不死_爆.gfx", hook = "HH_Spine", },
				{ gfx = "人物\\技能\\凤凰\\不死_热浪.gfx", hook = "HH_000", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
	  	    	 [1012] =            --224号 技能物品强力群BUFF
     {
     	gfxlist =
     		{
     			{ gfx = "动画\\爆开.gfx", hook = "HH_xiong", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
	  	    	 [1013] =            --凤凰召唤自暴
     {
     	gfxlist =
     		{
     			{ gfx = "人物\\技能\\凤凰\\替身自爆_热浪.gfx", hook = "HH_000", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
 	  	    	 [1014] =            --解控制技能瞬发光效
     {
     	gfxlist =
     		{
     			{ gfx = "人物\\击中\\瞬_解控制_击中.gfx", hook = "HH_000", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
 	  	    	 [1015] =            --伤害吸收盾技能瞬发光效
     {
     	gfxlist =
     		{
     			{ gfx = "人物\\技能\\仙女\\治疗状态_身体.gfx", hook = "HH_000", },

 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
 	  	    	 [1016] =            --瞬间回能量技能瞬发光效
     {
     	gfxlist =
     		{
				{ gfx = "人物\\技能\\仙女\\治疗状态_身体.gfx", hook = "HH_000", },
     			{ gfx = "人物\\技能\\仙女\\回满能量槽_身体环绕.gfx", hook = "HH_000", },
				{ gfx = "人物\\技能\\仙女\\回满能量槽_身体.gfx", hook = "HH_Spine", },
				{ gfx = "人物\\技能\\仙女\\回满能量槽_爆开.gfx", hook = "HH_Spine", },
				{ gfx = "人物\\技能\\仙女\\回满能量槽_地面爆开.gfx", hook = "HH_000", },
 			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
			[1017] =            --一辉死亡皇后之焰瞬发光效
     {
     	gfxlist =
     		{
				{ gfx = "人物\\技能\\凤凰\\召唤技能.gfx", hook = "HH_000", },
     			{ gfx = "人物\\技能\\凤凰\\召唤技能_手部.gfx", hook = "HH_shou_R", },
				{ gfx = "人物\\技能\\凤凰\\召唤技能_手拖尾.gfx", hook = "HH_shou_R", },
			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
			[1018] =            --一辉火焰领域瞬发光效
     {
     	gfxlist =
     		{
				{ gfx = "人物\\原著技能\\一辉_火焰领域_身上火.gfx", hook = "HH_000", },
     			{ gfx = "人物\\技能\\凤凰\\标准攻手上火效果.gfx", hook = "HH_shou_R", },
			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
			[1019] =            --天英座反击火圈光效
     {
     	gfxlist =
     		{
				{ gfx = "策划联入\\火焰紧绕_aoe_spine.gfx", hook = "HH_spine", },
			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
			[1020] =            --水瓶神器反击光效
     {
     	gfxlist =
     		{
				{ gfx = "人物\\击中\\冰河爆发技能击中1.gfx", hook = "HH_xiong", },
			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },


	 			[1021] =            --黄金进阶_射手守护光效
     {
     	gfxlist =
     		{
				{ gfx = "策划联入\\黄金进化_射手守护_hh_00.gfx", hook = "HH_000", },
			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
	 	 			[1022] =            --加隆_空间转移光效
     {
     	gfxlist =
     		{
				{ gfx = "人物\\击中\\空间转移击中.gfx", hook = "HH_xiong", },
			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },

	 ------------------------------------------
	 --灵魂之甲全身光效配置begin
	 [1023] =
	{
		 gfxlist = {
			{ gfx = "程序联入\\全身光效黄1_大臂小臂L_hh_dabi_L_hh_xiaobi_L.gfx", hook = "HH_dabi_L",},
			{ gfx = "程序联入\\全身光效黄1_大臂小臂L_hh_dabi_L_hh_xiaobi_L.gfx", hook = "HH_xiaobi_L",},
			{ gfx = "程序联入\\全身光效黄1_大臂小臂R_hh_dabi_R_hh_xiaobi_R.gfx", hook = "HH_dabi_R",},
			{ gfx = "程序联入\\全身光效黄1_大臂小臂R_hh_dabi_R_hh_xiaobi_R.gfx", hook = "HH_xiaobi_R",},
			{ gfx = "程序联入\\全身光效黄1_大腿_HH_datui_R_HH_datui_L.gfx", hook = "HH_datui_R",},
			{ gfx = "程序联入\\全身光效黄1_大腿_HH_datui_R_HH_datui_L.gfx", hook = "HH_datui_L",},
			{ gfx = "程序联入\\全身光效黄1_脚_hh_jiao_R_hh_jiao_L.gfx", hook = "HH_jiao_R",},
			{ gfx = "程序联入\\全身光效黄1_脚_hh_jiao_R_hh_jiao_L.gfx", hook = "HH_jiao_L",},
			{ gfx = "程序联入\\全身光效黄1_头_HH_Head.gfx", hook = "HH_Head",},
			{ gfx = "程序联入\\全身光效黄1_小腿_HH_xiaotui_R_HH_xiaotui_L.gfx", hook = "HH_xiaotui_R",},
			{ gfx = "程序联入\\全身光效黄1_小腿_HH_xiaotui_R_HH_xiaotui_L.gfx", hook = "HH_xiaotui_L",},
			{ gfx = "程序联入\\全身光效黄1_胸腰_HH_Xiong_HH_ride.gfx", hook = "HH_Xiong",},
			{ gfx = "程序联入\\全身光效黄1_胸腰_HH_Xiong_HH_ride.gfx", hook = "HH_ride",},
		},
		shape_id = 0,
		color_index = 0,
		shader_id = 0,
		keep_still = false,
	},

	[1024] =
	{
		gfxlist = {
			{ gfx = "程序联入\\全身光效黄2_大臂小臂L_hh_dabi_l_hh_xiaobi_l.gfx", hook = "HH_dabi_L",},
			{ gfx = "程序联入\\全身光效黄2_大臂小臂L_hh_dabi_l_hh_xiaobi_l.gfx", hook = "HH_xiaobi_L",},
			{ gfx = "程序联入\\全身光效黄2_大臂小臂R_hh_dabi_r_hh_xiaobi_r.gfx", hook = "HH_dabi_R",},
			{ gfx = "程序联入\\全身光效黄2_大臂小臂R_hh_dabi_r_hh_xiaobi_r.gfx", hook = "HH_xiaobi_R",},
			{ gfx = "程序联入\\全身光效黄2_大腿_hh_datui_r_hh_datui_l.gfx", hook = "HH_datui_R",},
			{ gfx = "程序联入\\全身光效黄2_大腿_hh_datui_r_hh_datui_l.gfx", hook = "HH_datui_L",},
			{ gfx = "程序联入\\全身光效黄2_脚_hh_jiao_r_hh_jiao_l.gfx", hook = "HH_jiao_R",},
			{ gfx = "程序联入\\全身光效黄2_脚_hh_jiao_r_hh_jiao_l.gfx", hook = "HH_jiao_L",},
			{ gfx = "程序联入\\全身光效黄2_手_hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_R",},
			{ gfx = "程序联入\\全身光效黄2_手_hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_L",},
			{ gfx = "程序联入\\全身光效黄2_头_hh_head.gfx", hook = "HH_head",},
			{ gfx = "程序联入\\全身光效黄2_小腿_hh_xiaotui_r_hh_xiaotui_l.gfx", hook = "HH_xiaotui_R",},
			{ gfx = "程序联入\\全身光效黄2_小腿_hh_xiaotui_r_hh_xiaotui_l.gfx", hook = "HH_xiaotui_L",},
			{ gfx = "程序联入\\全身光效黄2_胸腰_hh_xiong_hh_ride.gfx", hook = "HH_xiong",},
			{ gfx = "程序联入\\全身光效黄2_胸腰_hh_xiong_hh_ride.gfx", hook = "HH_ride",},
		},
		shape_id = 0,
		color_index = 0,
		shader_id = 0,
		keep_still = false,
	},

	[1025] =
	{
		gfxlist = {
			{ gfx = "程序联入\\全身光效黄3_大臂小臂L_hh_dabi_L_hh_xiaobi_L.gfx", hook = "HH_dabi_L",},
			{ gfx = "程序联入\\全身光效黄3_大臂小臂L_hh_dabi_L_hh_xiaobi_L.gfx", hook = "HH_xiaobi_L",},
			{ gfx = "程序联入\\全身光效黄3_大臂小臂R_hh_dabi_r_hh_xiaobi_r.gfx", hook = "HH_dabi_R",},
			{ gfx = "程序联入\\全身光效黄3_大臂小臂R_hh_dabi_r_hh_xiaobi_r.gfx", hook = "HH_xiaobi_R",},
			{ gfx = "程序联入\\全身光效黄3_大腿_hh_datui_r_hh_datui_l.gfx", hook = "HH_datui_R",},
			{ gfx = "程序联入\\全身光效黄3_大腿_hh_datui_r_hh_datui_l.gfx", hook = "HH_datui_L",},
			{ gfx = "程序联入\\全身光效黄3_脚_hh_jiao_r_hh_jiao_l.gfx", hook = "HH_jiao_R",},
			{ gfx = "程序联入\\全身光效黄3_脚_hh_jiao_r_hh_jiao_l.gfx", hook = "HH_jiao_L",},
			{ gfx = "程序联入\\全身光效黄3_手_hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_R",},
			{ gfx = "程序联入\\全身光效黄3_手_hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_L",},
			{ gfx = "程序联入\\全身光效黄3_头_hh_head.gfx", hook = "HH_head",},
			{ gfx = "程序联入\\全身光效黄3_小腿_hh_xiaotui_r_hh_xiaotui_l.gfx", hook = "HH_xiaotui_R",},
			{ gfx = "程序联入\\全身光效黄3_小腿_hh_xiaotui_r_hh_xiaotui_l.gfx", hook = "HH_xiaotui_L",},
			{ gfx = "程序联入\\全身光效黄3_胸腰_hh_xiong_hh_ride.gfx", hook = "HH_xiong",},
			{ gfx = "程序联入\\全身光效黄3_胸腰_hh_xiong_hh_ride.gfx", hook = "HH_ride",},
		},
		shape_id = 0,
		color_index = 0,
		shader_id = 0,
		keep_still = false,
	},

	[1026] =
	{
		gfxlist = {
			{ gfx = "程序联入\\全身光效绿1_大臂小臂L_hh_dabi_L_hh_xiaobi_L.gfx", hook = "HH_dabi_L",},
			{ gfx = "程序联入\\全身光效绿1_大臂小臂L_hh_dabi_L_hh_xiaobi_L.gfx", hook = "HH_xiaobi_L",},
			{ gfx = "程序联入\\全身光效绿1_大臂小臂R_hh_dabi_R_hh_xiaobi_R.gfx", hook = "HH_dabi_R",},
			{ gfx = "程序联入\\全身光效绿1_大臂小臂R_hh_dabi_R_hh_xiaobi_R.gfx", hook = "HH_xiaobi_R",},
			{ gfx = "程序联入\\全身光效绿1_大腿_HH_datui_R_HH_datui_L.gfx", hook = "HH_datui_R",},
			{ gfx = "程序联入\\全身光效绿1_大腿_HH_datui_R_HH_datui_L.gfx", hook = "HH_datui_L",},
			{ gfx = "程序联入\\全身光效绿1_脚_hh_jiao_R_hh_jiao_L.gfx", hook = "HH_jiao_R",},
			{ gfx = "程序联入\\全身光效绿1_脚_hh_jiao_R_hh_jiao_L.gfx", hook = "HH_jiao_L",},
			{ gfx = "程序联入\\全身光效绿1_头_HH_Head.gfx", hook = "HH_Head",},
			{ gfx = "程序联入\\全身光效绿1_小腿_HH_xiaotui_R_HH_xiaotui_L.gfx", hook = "HH_xiaotui_R",},
			{ gfx = "程序联入\\全身光效绿1_小腿_HH_xiaotui_R_HH_xiaotui_L.gfx", hook = "HH_xiaotui_L",},
			{ gfx = "程序联入\\全身光效绿1_胸腰_HH_Xiong_HH_ride.gfx", hook = "HH_Xiong",},
			{ gfx = "程序联入\\全身光效绿1_胸腰_HH_Xiong_HH_ride.gfx", hook = "HH_ride",},
		},
		shape_id = 0,
		color_index = 0,
		shader_id = 0,
		keep_still = false,
	},

	[1027] =
	{
		gfxlist = {
			{ gfx = "程序联入\\全身光效绿2_大臂小臂L_hh_dabi_l_hh_xiaobi_l.gfx", hook = "HH_dabi_L",},
			{ gfx = "程序联入\\全身光效绿2_大臂小臂L_hh_dabi_l_hh_xiaobi_l.gfx", hook = "HH_xiaobi_L",},
			{ gfx = "程序联入\\全身光效绿2_大臂小臂R_hh_dabi_r_hh_xiaobi_r.gfx", hook = "HH_dabi_R",},
			{ gfx = "程序联入\\全身光效绿2_大臂小臂R_hh_dabi_r_hh_xiaobi_r.gfx", hook = "HH_xiaobi_R",},
			{ gfx = "程序联入\\全身光效绿2_大腿_hh_datui_r_hh_datui_l.gfx", hook = "HH_datui_R",},
			{ gfx = "程序联入\\全身光效绿2_大腿_hh_datui_r_hh_datui_l.gfx", hook = "HH_datui_L",},
			{ gfx = "程序联入\\全身光效绿2_脚_hh_jiao_r_hh_jiao_l.gfx", hook = "HH_jiao_R",},
			{ gfx = "程序联入\\全身光效绿2_脚_hh_jiao_r_hh_jiao_l.gfx", hook = "HH_jiao_L",},
			{ gfx = "程序联入\\全身光效绿2_手_hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_R",},
			{ gfx = "程序联入\\全身光效绿2_手_hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_L",},
			{ gfx = "程序联入\\全身光效绿2_头_hh_head.gfx", hook = "HH_head",},
			{ gfx = "程序联入\\全身光效绿2_小腿_hh_xiaotui_r_hh_xiaotui_l.gfx", hook = "HH_xiaotui_R",},
			{ gfx = "程序联入\\全身光效绿2_小腿_hh_xiaotui_r_hh_xiaotui_l.gfx", hook = "HH_xiaotui_L",},
			{ gfx = "程序联入\\全身光效绿2_胸腰_hh_xiong_hh_ride.gfx", hook = "HH_xiong",},
			{ gfx = "程序联入\\全身光效绿2_胸腰_hh_xiong_hh_ride.gfx", hook = "HH_ride",},
		},
		shape_id = 0,
		color_index = 0,
		shader_id = 0,
		keep_still = false,
	},

	[1028] =
	{
		gfxlist = {
			{ gfx = "程序联入\\全身光效绿3_大臂小臂L_hh_dabi_L_hh_xiaobi_L.gfx", hook = "HH_dabi_L",},
			{ gfx = "程序联入\\全身光效绿3_大臂小臂L_hh_dabi_L_hh_xiaobi_L.gfx", hook = "HH_xiaobi_L",},
			{ gfx = "程序联入\\全身光效绿3_大臂小臂R_hh_dabi_r_hh_xiaobi_r.gfx", hook = "HH_dabi_R",},
			{ gfx = "程序联入\\全身光效绿3_大臂小臂R_hh_dabi_r_hh_xiaobi_r.gfx", hook = "HH_xiaobi_R",},
			{ gfx = "程序联入\\全身光效绿3_大腿_hh_datui_r_hh_datui_l.gfx", hook = "HH_datui_R",},
			{ gfx = "程序联入\\全身光效绿3_大腿_hh_datui_r_hh_datui_l.gfx", hook = "HH_datui_L",},
			{ gfx = "程序联入\\全身光效绿3_脚_hh_jiao_r_hh_jiao_l.gfx", hook = "HH_jiao_R",},
			{ gfx = "程序联入\\全身光效绿3_脚_hh_jiao_r_hh_jiao_l.gfx", hook = "HH_jiao_L",},
			{ gfx = "程序联入\\全身光效绿3_手_hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_R",},
			{ gfx = "程序联入\\全身光效绿3_手_hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_L",},
			{ gfx = "程序联入\\全身光效绿3_头_hh_head.gfx", hook = "HH_head",},
			{ gfx = "程序联入\\全身光效绿3_小腿_hh_xiaotui_r_hh_xiaotui_l.gfx", hook = "HH_xiaotui_R",},
			{ gfx = "程序联入\\全身光效绿3_小腿_hh_xiaotui_r_hh_xiaotui_l.gfx", hook = "HH_xiaotui_L",},
			{ gfx = "程序联入\\全身光效绿3_胸腰_hh_xiong_hh_ride.gfx", hook = "HH_xiong",},
			{ gfx = "程序联入\\全身光效绿3_胸腰_hh_xiong_hh_ride.gfx", hook = "HH_ride",},
		},
		shape_id = 0,
		color_index = 0,
		shader_id = 0,
		keep_still = false,
	},

	[1029] =
	{
		gfxlist = {
			{ gfx = "程序联入\\全身光效蓝1_大臂小臂L_hh_dabi_L_hh_xiaobi_L.gfx", hook = "HH_dabi_L",},
			{ gfx = "程序联入\\全身光效蓝1_大臂小臂L_hh_dabi_L_hh_xiaobi_L.gfx", hook = "HH_xiaobi_L",},
			{ gfx = "程序联入\\全身光效蓝1_大臂小臂R_hh_dabi_R_hh_xiaobi_R.gfx", hook = "HH_dabi_R",},
			{ gfx = "程序联入\\全身光效蓝1_大臂小臂R_hh_dabi_R_hh_xiaobi_R.gfx", hook = "HH_xiaobi_R",},
			{ gfx = "程序联入\\全身光效蓝1_大腿_HH_datui_R_HH_datui_L.gfx", hook = "HH_datui_R",},
			{ gfx = "程序联入\\全身光效蓝1_大腿_HH_datui_R_HH_datui_L.gfx", hook = "HH_datui_L",},
			{ gfx = "程序联入\\全身光效蓝1_脚_hh_jiao_R_hh_jiao_L.gfx", hook = "HH_jiao_R",},
			{ gfx = "程序联入\\全身光效蓝1_脚_hh_jiao_R_hh_jiao_L.gfx", hook = "HH_jiao_L",},
			{ gfx = "程序联入\\全身光效蓝1_头_HH_Head.gfx", hook = "HH_Head",},
			{ gfx = "程序联入\\全身光效蓝1_小腿_HH_xiaotui_R_HH_xiaotui_L.gfx", hook = "HH_xiaotui_R",},
			{ gfx = "程序联入\\全身光效蓝1_小腿_HH_xiaotui_R_HH_xiaotui_L.gfx", hook = "HH_xiaotui_L",},
			{ gfx = "程序联入\\全身光效蓝1_胸腰_HH_Xiong_HH_ride.gfx", hook = "HH_Xiong",},
			{ gfx = "程序联入\\全身光效蓝1_胸腰_HH_Xiong_HH_ride.gfx", hook = "HH_ride",},
		},
		shape_id = 0,
		color_index = 0,
		shader_id = 0,
		keep_still = false,
	},

	[1030] =
	{
		gfxlist = {
			{ gfx = "程序联入\\全身光效蓝2_大臂小臂L_hh_dabi_l_hh_xiaobi_l.gfx", hook = "HH_dabi_L",},
			{ gfx = "程序联入\\全身光效蓝2_大臂小臂L_hh_dabi_l_hh_xiaobi_l.gfx", hook = "HH_xiaobi_L",},
			{ gfx = "程序联入\\全身光效蓝2_大臂小臂R_hh_dabi_r_hh_xiaobi_r.gfx", hook = "HH_dabi_R",},
			{ gfx = "程序联入\\全身光效蓝2_大臂小臂R_hh_dabi_r_hh_xiaobi_r.gfx", hook = "HH_xiaobi_R",},
			{ gfx = "程序联入\\全身光效蓝2_大腿_hh_datui_r_hh_datui_l.gfx", hook = "HH_datui_R",},
			{ gfx = "程序联入\\全身光效蓝2_大腿_hh_datui_r_hh_datui_l.gfx", hook = "HH_datui_L",},
			{ gfx = "程序联入\\全身光效蓝2_脚_hh_jiao_r_hh_jiao_l.gfx", hook = "HH_jiao_R",},
			{ gfx = "程序联入\\全身光效蓝2_脚_hh_jiao_r_hh_jiao_l.gfx", hook = "HH_jiao_L",},
			{ gfx = "程序联入\\全身光效蓝2_手_hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_R",},
			{ gfx = "程序联入\\全身光效蓝2_手_hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_L",},
			{ gfx = "程序联入\\全身光效蓝2_头_hh_head.gfx", hook = "HH_head",},
			{ gfx = "程序联入\\全身光效蓝2_小腿_hh_xiaotui_r_hh_xiaotui_l.gfx", hook = "HH_xiaotui_R",},
			{ gfx = "程序联入\\全身光效蓝2_小腿_hh_xiaotui_r_hh_xiaotui_l.gfx", hook = "HH_xiaotui_L",},
			{ gfx = "程序联入\\全身光效蓝2_胸腰_hh_xiong_hh_ride.gfx", hook = "HH_xiong",},
			{ gfx = "程序联入\\全身光效蓝2_胸腰_hh_xiong_hh_ride.gfx", hook = "HH_ride",},
		},
		shape_id = 0,
		color_index = 0,
		shader_id = 0,
		keep_still = false,
	},

	[1031] =
	{
		gfxlist = {
			{ gfx = "程序联入\\全身光效蓝3_大臂小臂L_hh_dabi_L_hh_xiaobi_L.gfx", hook = "HH_dabi_L",},
			{ gfx = "程序联入\\全身光效蓝3_大臂小臂L_hh_dabi_L_hh_xiaobi_L.gfx", hook = "HH_xiaobi_L",},
			{ gfx = "程序联入\\全身光效蓝3_大臂小臂R_hh_dabi_r_hh_xiaobi_r.gfx", hook = "HH_dabi_R",},
			{ gfx = "程序联入\\全身光效蓝3_大臂小臂R_hh_dabi_r_hh_xiaobi_r.gfx", hook = "HH_xiaobi_R",},
			{ gfx = "程序联入\\全身光效蓝3_大腿_hh_datui_r_hh_datui_l.gfx", hook = "HH_datui_R",},
			{ gfx = "程序联入\\全身光效蓝3_大腿_hh_datui_r_hh_datui_l.gfx", hook = "HH_datui_L",},
			{ gfx = "程序联入\\全身光效蓝3_脚_hh_jiao_r_hh_jiao_l.gfx", hook = "HH_jiao_R",},
			{ gfx = "程序联入\\全身光效蓝3_脚_hh_jiao_r_hh_jiao_l.gfx", hook = "HH_jiao_L",},
			{ gfx = "程序联入\\全身光效蓝3_手_hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_R",},
			{ gfx = "程序联入\\全身光效蓝3_手_hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_L",},
			{ gfx = "程序联入\\全身光效蓝3_头_hh_head.gfx", hook = "HH_head",},
			{ gfx = "程序联入\\全身光效蓝3_小腿_hh_xiaotui_r_hh_xiaotui_l.gfx", hook = "HH_xiaotui_R",},
			{ gfx = "程序联入\\全身光效蓝3_小腿_hh_xiaotui_r_hh_xiaotui_l.gfx", hook = "HH_xiaotui_L",},
			{ gfx = "程序联入\\全身光效蓝3_胸腰_hh_xiong_hh_ride.gfx", hook = "HH_xiong",},
			{ gfx = "程序联入\\全身光效蓝3_胸腰_hh_xiong_hh_ride.gfx", hook = "HH_ride",},
		},
		shape_id = 0,
		color_index = 0,
		shader_id = 0,
		keep_still = false,
	},

	[1032] =
	{
		gfxlist = {
			{ gfx = "程序联入\\全身光效紫1_大臂小臂L_hh_dabi_L_hh_xiaobi_L.gfx", hook = "HH_dabi_L",},
			{ gfx = "程序联入\\全身光效紫1_大臂小臂L_hh_dabi_L_hh_xiaobi_L.gfx", hook = "HH_xiaobi_L",},
			{ gfx = "程序联入\\全身光效紫1_大臂小臂R_hh_dabi_R_hh_xiaobi_R.gfx", hook = "HH_dabi_R",},
			{ gfx = "程序联入\\全身光效紫1_大臂小臂R_hh_dabi_R_hh_xiaobi_R.gfx", hook = "HH_xiaobi_R",},
			{ gfx = "程序联入\\全身光效紫1_大腿_HH_datui_R_HH_datui_L.gfx", hook = "HH_datui_R",},
			{ gfx = "程序联入\\全身光效紫1_大腿_HH_datui_R_HH_datui_L.gfx", hook = "HH_datui_L",},
			{ gfx = "程序联入\\全身光效紫1_脚_hh_jiao_R_hh_jiao_L.gfx", hook = "HH_jiao_R",},
			{ gfx = "程序联入\\全身光效紫1_脚_hh_jiao_R_hh_jiao_L.gfx", hook = "HH_jiao_L",},
			{ gfx = "程序联入\\全身光效紫1_头_HH_Head.gfx", hook = "HH_Head",},
			{ gfx = "程序联入\\全身光效紫1_小腿_HH_xiaotui_R_HH_xiaotui_L.gfx", hook = "HH_xiaotui_R",},
			{ gfx = "程序联入\\全身光效紫1_小腿_HH_xiaotui_R_HH_xiaotui_L.gfx", hook = "HH_xiaotui_L",},
			{ gfx = "程序联入\\全身光效紫1_胸腰_HH_Xiong_HH_ride.gfx", hook = "HH_Xiong",},
			{ gfx = "程序联入\\全身光效紫1_胸腰_HH_Xiong_HH_ride.gfx", hook = "HH_ride",},
		},
		shape_id = 0,
		color_index = 0,
		shader_id = 0,
		keep_still = false,
	},

	[1033] =
	{
		gfxlist = {
			{ gfx = "程序联入\\全身光效紫2_大臂小臂L_hh_dabi_l_hh_xiaobi_l.gfx", hook = "HH_dabi_L",},
			{ gfx = "程序联入\\全身光效紫2_大臂小臂L_hh_dabi_l_hh_xiaobi_l.gfx", hook = "HH_xiaobi_L",},
			{ gfx = "程序联入\\全身光效紫2_大臂小臂R_hh_dabi_r_hh_xiaobi_r.gfx", hook = "HH_dabi_R",},
			{ gfx = "程序联入\\全身光效紫2_大臂小臂R_hh_dabi_r_hh_xiaobi_r.gfx", hook = "HH_xiaobi_R",},
			{ gfx = "程序联入\\全身光效紫2_大腿_hh_datui_r_hh_datui_l.gfx", hook = "HH_datui_R",},
			{ gfx = "程序联入\\全身光效紫2_大腿_hh_datui_r_hh_datui_l.gfx", hook = "HH_datui_L",},
			{ gfx = "程序联入\\全身光效紫2_脚_hh_jiao_r_hh_jiao_l.gfx", hook = "HH_jiao_R",},
			{ gfx = "程序联入\\全身光效紫2_脚_hh_jiao_r_hh_jiao_l.gfx", hook = "HH_jiao_L",},
			{ gfx = "程序联入\\全身光效紫2_手_hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_R",},
			{ gfx = "程序联入\\全身光效紫2_手_hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_L",},
			{ gfx = "程序联入\\全身光效紫2_头_hh_head.gfx", hook = "HH_head",},
			{ gfx = "程序联入\\全身光效紫2_小腿_hh_xiaotui_r_hh_xiaotui_l.gfx", hook = "HH_xiaotui_R",},
			{ gfx = "程序联入\\全身光效紫2_小腿_hh_xiaotui_r_hh_xiaotui_l.gfx", hook = "HH_xiaotui_L",},
			{ gfx = "程序联入\\全身光效紫2_胸腰_hh_xiong_hh_ride.gfx", hook = "HH_xiong",},
			{ gfx = "程序联入\\全身光效紫2_胸腰_hh_xiong_hh_ride.gfx", hook = "HH_ride",},
		},
		shape_id = 0,
		color_index = 0,
		shader_id = 0,
		keep_still = false,
	},

	[1034] =
	{
		gfxlist = {
			{ gfx = "程序联入\\全身光效紫3_大臂小臂L_hh_dabi_L_hh_xiaobi_L.gfx", hook = "HH_dabi_L",},
			{ gfx = "程序联入\\全身光效紫3_大臂小臂L_hh_dabi_L_hh_xiaobi_L.gfx", hook = "HH_xiaobi_L",},
			{ gfx = "程序联入\\全身光效紫3_大臂小臂R_hh_dabi_r_hh_xiaobi_r.gfx", hook = "HH_dabi_R",},
			{ gfx = "程序联入\\全身光效紫3_大臂小臂R_hh_dabi_r_hh_xiaobi_r.gfx", hook = "HH_xiaobi_R",},
			{ gfx = "程序联入\\全身光效紫3_大腿_hh_datui_r_hh_datui_l.gfx", hook = "HH_datui_R",},
			{ gfx = "程序联入\\全身光效紫3_大腿_hh_datui_r_hh_datui_l.gfx", hook = "HH_datui_L",},
			{ gfx = "程序联入\\全身光效紫3_脚_hh_jiao_r_hh_jiao_l.gfx", hook = "HH_jiao_R",},
			{ gfx = "程序联入\\全身光效紫3_脚_hh_jiao_r_hh_jiao_l.gfx", hook = "HH_jiao_L",},
			{ gfx = "程序联入\\全身光效紫3_手_hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_R",},
			{ gfx = "程序联入\\全身光效紫3_手_hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_L",},
			{ gfx = "程序联入\\全身光效紫3_头_hh_head.gfx", hook = "HH_head",},
			{ gfx = "程序联入\\全身光效紫3_小腿_hh_xiaotui_r_hh_xiaotui_l.gfx", hook = "HH_xiaotui_R",},
			{ gfx = "程序联入\\全身光效紫3_小腿_hh_xiaotui_r_hh_xiaotui_l.gfx", hook = "HH_xiaotui_L",},
			{ gfx = "程序联入\\全身光效紫3_胸腰_hh_xiong_hh_ride.gfx", hook = "HH_xiong",},
			{ gfx = "程序联入\\全身光效紫3_胸腰_hh_xiong_hh_ride.gfx", hook = "HH_ride",},
		},
		shape_id = 0,
		color_index = 0,
		shader_id = 0,
		keep_still = false,
	},

	[1035] =
	{
		gfxlist = {
			{ gfx = "程序联入\\全身光效橙1_大臂小臂L_hh_dabi_L_hh_xiaobi_L.gfx", hook = "HH_dabi_L",},
			{ gfx = "程序联入\\全身光效橙1_大臂小臂L_hh_dabi_L_hh_xiaobi_L.gfx", hook = "HH_xiaobi_L",},
			{ gfx = "程序联入\\全身光效橙1_大臂小臂R_hh_dabi_R_hh_xiaobi_R.gfx", hook = "HH_dabi_R",},
			{ gfx = "程序联入\\全身光效橙1_大臂小臂R_hh_dabi_R_hh_xiaobi_R.gfx", hook = "HH_xiaobi_R",},
			{ gfx = "程序联入\\全身光效橙1_大腿_HH_datui_R_HH_datui_L.gfx", hook = "HH_datui_R",},
			{ gfx = "程序联入\\全身光效橙1_大腿_HH_datui_R_HH_datui_L.gfx", hook = "HH_datui_L",},
			{ gfx = "程序联入\\全身光效橙1_脚_hh_jiao_R_hh_jiao_L.gfx", hook = "HH_jiao_R",},
			{ gfx = "程序联入\\全身光效橙1_脚_hh_jiao_R_hh_jiao_L.gfx", hook = "HH_jiao_L",},
			{ gfx = "程序联入\\全身光效橙1_头_HH_Head.gfx", hook = "HH_Head",},
			{ gfx = "程序联入\\全身光效橙1_小腿_HH_xiaotui_R_HH_xiaotui_L.gfx", hook = "HH_xiaotui_R",},
			{ gfx = "程序联入\\全身光效橙1_小腿_HH_xiaotui_R_HH_xiaotui_L.gfx", hook = "HH_xiaotui_L",},
			{ gfx = "程序联入\\全身光效橙1_胸腰_HH_Xiong_HH_ride.gfx", hook = "HH_Xiong",},
			{ gfx = "程序联入\\全身光效橙1_胸腰_HH_Xiong_HH_ride.gfx", hook = "HH_ride",},
		},
	shape_id = 0,
	color_index = 0,
	shader_id = 0,
	keep_still = false,
	},

	[1036] =
	{
		gfxlist = {
			{ gfx = "程序联入\\全身光效橙2_大臂小臂L_hh_dabi_L_hh_xiaobi_L.gfx", hook = "HH_dabi_L",},
			{ gfx = "程序联入\\全身光效橙2_大臂小臂L_hh_dabi_L_hh_xiaobi_L.gfx", hook = "HH_xiaobi_L",},
			{ gfx = "程序联入\\全身光效橙2_大臂小臂R_hh_dabi_R_hh_xiaobi_R.gfx", hook = "HH_dabi_R",},
			{ gfx = "程序联入\\全身光效橙2_大臂小臂R_hh_dabi_R_hh_xiaobi_R.gfx", hook = "HH_xiaobi_R",},
			{ gfx = "程序联入\\全身光效橙2_大腿_hh_datui_r_hh_datui_l.gfx", hook = "HH_datui_R",},
			{ gfx = "程序联入\\全身光效橙2_大腿_hh_datui_r_hh_datui_l.gfx", hook = "HH_datui_L",},
			{ gfx = "程序联入\\全身光效橙2_脚_hh_jiao_r_hh_jiao_l.gfx", hook = "HH_jiao_R",},
			{ gfx = "程序联入\\全身光效橙2_脚_hh_jiao_r_hh_jiao_l.gfx", hook = "HH_jiao_L",},
			{ gfx = "程序联入\\全身光效橙2_手_hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_R",},
			{ gfx = "程序联入\\全身光效橙2_手_hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_L",},
			{ gfx = "程序联入\\全身光效橙2_头_hh_head.gfx", hook = "HH_head",},
			{ gfx = "程序联入\\全身光效橙2_小腿_hh_xiaotui_r_hh_xiaotui_l.gfx", hook = "HH_xiaotui_R",},
			{ gfx = "程序联入\\全身光效橙2_小腿_hh_xiaotui_r_hh_xiaotui_l.gfx", hook = "HH_xiaotui_L",},
			{ gfx = "程序联入\\全身光效橙2_胸腰_hh_xiong_hh_ride.gfx", hook = "HH_xiong",},
			{ gfx = "程序联入\\全身光效橙2_胸腰_hh_xiong_hh_ride.gfx", hook = "HH_ride",},
		},
		shape_id = 0,
		color_index = 0,
		shader_id = 0,
		keep_still = false,
	},

	[1037] =
	{
		gfxlist = {
			{ gfx = "程序联入\\全身光效橙3_大臂小臂L_hh_dabi_L_hh_xiaobi_L.gfx", hook = "HH_dabi_L",},
			{ gfx = "程序联入\\全身光效橙3_大臂小臂L_hh_dabi_L_hh_xiaobi_L.gfx", hook = "HH_xiaobi_L",},
			{ gfx = "程序联入\\全身光效橙3_大臂小臂R_hh_dabi_R_hh_xiaobi_R.gfx", hook = "HH_dabi_R",},
			{ gfx = "程序联入\\全身光效橙3_大臂小臂R_hh_dabi_R_hh_xiaobi_R.gfx", hook = "HH_xiaobi_R",},
			{ gfx = "程序联入\\全身光效橙3_大腿_hh_datui_r_hh_datui_l.gfx", hook = "HH_datui_R",},
			{ gfx = "程序联入\\全身光效橙3_大腿_hh_datui_r_hh_datui_l.gfx", hook = "HH_datui_L",},
			{ gfx = "程序联入\\全身光效橙3_脚_hh_jiao_r_hh_jiao_l.gfx", hook = "HH_jiao_R",},
			{ gfx = "程序联入\\全身光效橙3_脚_hh_jiao_r_hh_jiao_l.gfx", hook = "HH_jiao_L",},
			{ gfx = "程序联入\\全身光效橙3_手_hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_R",},
			{ gfx = "程序联入\\全身光效橙3_手_hh_shou_r_hh_shou_l.gfx", hook = "HH_shou_L",},
			{ gfx = "程序联入\\全身光效橙3_头_hh_head.gfx", hook = "HH_head",},
			{ gfx = "程序联入\\全身光效橙3_小腿_hh_xiaotui_r_hh_xiaotui_l.gfx", hook = "HH_xiaotui_R",},
			{ gfx = "程序联入\\全身光效橙3_小腿_hh_xiaotui_r_hh_xiaotui_l.gfx", hook = "HH_xiaotui_L",},
			{ gfx = "程序联入\\全身光效橙3_胸腰_hh_xiong_hh_ride.gfx", hook = "HH_xiong",},
			{ gfx = "程序联入\\全身光效橙3_胸腰_hh_xiong_hh_ride.gfx", hook = "HH_ride",},
		},
		shape_id = 0,
		color_index = 0,
		shader_id = 0,
		keep_still = false,
	},
	 --灵魂之甲全身光效配置end
	 ------------------------------------------

	[1038] =
	{
		gfxlist = {
			--{ gfx = "人物\\技能\\凤凰\\群体攻击模型.gfx", hook = "HH_000",},
			{ gfx = "人物\\技能\\凤凰\\群体攻击身.gfx", hook = "HH_Spine1",},
			{ gfx = "人物\\技能\\凤凰\\群体攻击身.gfx", hook = "HH_xiaotui_R",},
			{ gfx = "人物\\技能\\凤凰\\群体攻击身.gfx", hook = "HH_xiaotui_L",},
			{ gfx = "人物\\技能\\凤凰\\群体攻击身.gfx", hook = "HH_datui_R",},
			{ gfx = "人物\\技能\\凤凰\\群体攻击身.gfx", hook = "HH_datui_L",},
			{ gfx = "人物\\技能\\凤凰\\群体攻击身.gfx", hook = "HH_xiaobi_L",},
			{ gfx = "人物\\技能\\凤凰\\群体攻击身.gfx", hook = "HH_xiaobi_R",},
			{ gfx = "人物\\技能\\凤凰\\群体攻击身.gfx", hook = "HH_shou_R",},
			{ gfx = "人物\\技能\\凤凰\\群体攻击身.gfx", hook = "HH_shou_L",},
			{ gfx = "人物\\技能\\凤凰\\群体攻击身.gfx", hook = "HH_dabi_L",},
			{ gfx = "人物\\技能\\凤凰\\群体攻击身.gfx", hook = "HH_dabi_R",},
			--{ gfx = "人物\\击中\\一辉群体攻击击中.gfx", hook = "HH_000",},
			{ gfx = "人物\\技能\\凤凰\\群体攻击凤凰.gfx", hook = "HH_000",},
			{ gfx = "人物\\技能\\凤凰\\群体攻击爆.gfx", hook = "HH_000",},
		},
		shape_id = 0,
		color_index = 0,
		shader_id = 0,
		keep_still = false,
	},
	[1039] =            --海龙吞噬小弟
     {
     	gfxlist =
     		{
				{ gfx = "策划联入\\灵魂摄取.gfx", hook = "HH_xiong", },
			},
     	shape_id = 0,
     	color_index = 0,
     	shader_id = 0,
    	keep_still = false,
     },
}




