---------------------------------------------------------------
--  created:   2011.07.01
--  author:    hanwei
--  NPC列表图标配置
---------------------------------------------------------------



-------------------------------------------------
--图标文件见:surfaces\iconset\iconlist_npc.txt
--可以根据复杂服务的id, 定义不同的图片
--出售商品
--[DATA_TYPE.DT_NPC_SELL_SERVICE] = 
--{				
--      default = "售卖.tga",
--		[12313] = "售卖.tga",
--},



NPCServiceIconList  = {}

--复杂服务
NPCServiceIconList.Service =
{
	--守护星座选择
	[DATA_TYPE.DT_PROF_SELECT_SERVICE] = 
    {				
        default = "金叹号.tga",
        selfService = "Set.tga",
    },
    
	--出售商品
	[DATA_TYPE.DT_NPC_SELL_SERVICE] = 
    {				
        default = "出售商品.tga",
        selfService = "Trade.tga",
    },
    
    --限量出售
		[DATA_TYPE.DT_NPC_LIMITED_SALE_SERVICE] = 
    {				
        default = "出售商品.tga",
        selfService = "Set.tga",
    },
    
    --物物交易
    [DATA_TYPE.DT_ITEM_TRADE_CONFIG] = 
    {				
        default = "出售商品.tga",
        selfService = "Set.tga",
    },
    
    --生产学习
    [DATA_TYPE.DT_NPC_LEARN_PRODUCE_SERVICE] = 
    {				
        default = "配方合成.tga",
        selfService = "Set.tga",
    },
    
    --学习技能服务
    [DATA_TYPE.DT_NPC_LEARN_SKILL_SERVICE] = 
    {				
        default = "学守护星座技能.tga",
        selfService = "Set.tga",
    },
    
    --NPC生产
	[DATA_TYPE.DT_NPC_RECIPE_ESSENCE] = 
	{			
        default  ="配方合成.tga",
        [7862] = "配方合成.tga",
        selfService = "Set.tga",
    },
    
    --交谈
    [DATA_TYPE.DT_NPC_TALK_SERVICE] = 
    {				
        default = "无.tga",
        selfService = "Set.tga",
    },
    
    --剧本报名表
    [DATA_TYPE.DT_INSTANCE_TABLE_CONFIG] = 
    {				
        default = "剧本.tga",
        selfService = "Set.tga",
    },    

    --副本服务
    [DATA_TYPE.DT_NPC_DUNGEON_SERVICE] = 
    {				
        default = "时空漩涡.tga",
        selfService = "Set.tga",
    },   

    --战场服务
    [DATA_TYPE.DT_NPC_BATTLE_FIELD_SERVICE] = 
    {               
        default = "时空漩涡.tga",
        selfService = "Set.tga",
    },     

    --铭刻服务
    [DATA_TYPE.DT_NPC_IMPRINT_SERVICE] = 
    {               
        default = "时空漩涡.tga",
        selfService = "Set.tga",
    },   
    
    --物品兑换服务
    [DATA_TYPE.DT_NPC_ITEM_EXCHANGE_SERVICE] = 
    {               
        default = "时空漩涡.tga",
        selfService = "Set.tga",
    }, 
    
    --势力选择服务
    [DATA_TYPE.DT_NPC_FORCE_SELECT_SERVICE] = 
    {               
        default = "时空漩涡.tga",
        selfService = "Set.tga",
    },       
}

--简单服务组合
NPCServiceIconList.SimpleService =
{
    -- 邮寄服务
    [0] =
    {
        default = "邮箱.tga", 
        selfService = "Mail.tga",
    },
    
    -- 仓库服务           
    [1] = 
    {
        default = "仓储.tga", 
        selfService = "Store.tga",  
    } ,
    
    -- 军团仓库     
    [2] = 
    {
        default = "仓储.tga",
        selfService = "Store.tga",
    },  
    
    -- 军团服务       
    [3] = 
    {
        default = "军团相关.tga",
        selfService = "Army.tga",
    },
    
    -- 基地服务     
    [4] = 
    {
        default = "军团相关.tga",
        selfService = "Army.tga",
    },
    
    -- 离开基地服务     
    [5] = 
    {
        default = "军团相关.tga",
        selfService = "Army.tga",
    },
    
    -- 军团宣战     
    [6] = 
    {
        default = "军团相关.tga",
        selfService = "Army.tga",
    },
    
    -- 拍卖服务     
    [7] = 
    {
        default = "售卖.tga",
        selfService = "Auction.tga",
    },
    
    -- 守护星座切换         
    [8] = 
    {
        default = "装备.tga",
        selfService = "Enhance.tga",
    },
    
    -- 分解服务         
    [9] = 
    {
        default = "装备.tga",
        selfService = "Enhance.tga",
    },
    
    -- 装备强化         
    [10] = 
    {
        default = "装备.tga",
        selfService = "Enhance.tga",
    },
    
    -- 装备强化转移         
    [11] = 
    {
        default = "装备.tga",
        selfService = "Enhance.tga",
    },
    
    -- 装备加工         
    [12] = 
    {
        default = "装备.tga",
        selfService = "Enhance.tga",
    }, 
    
    -- 装备融合强化        
    [13] = 
    {
        default = "装备.tga",
        selfService = "Enhance.tga",
    },
    
    -- 大地图传送         
    [14] = 
    {
        default = "传送.tga",
        selfService = "Carry.tga",
    }, 
    
    -- 双倍经验时间        
    [15] = 
    {
        default = "装备.tga",
        selfService = "Exp.tga",
    },         
    
    -- 离开副本
    [16] = 
    {
        default ="时空漩涡.tga",
        selfService = "Enter2.tga",        
    },     
    
    -- 军团推荐贡献领取
    [17] = 
    {
        default ="军团相关.tga",
        selfService = "Army.tga",       
    },  
    
    -- 个人挑战副本   
    [18] = 
    {
        default ="时空漩涡.tga",
        selfService = "Enter1.tga",        
    },  
    
    -- 沐浴荣光（挂机）   
    [19] = 
    {
        default ="时空漩涡.tga",
        selfService = "Carry.tga",        
    },  
    
    -- 宠物化生   
    [20] = 
    {
        default ="宠物相关.tga",
        selfService = "Carry.tga",
    },
    -- 礼品卡  
    [21] = 
    {
        default ="宠物相关.tga",
        selfService = "Carry.tga",
    },
    -- 推广人系统  
    [22] = 
    {
        default ="宠物相关.tga",
        selfService = "Carry.tga",
    },   
    -- 认证雅典娜  
    [23] = 
    {
        default ="金叹号.tga",
        selfService = "Set.tga",
    },
    -- 寻宝  
    [24] = 
    {
        default = "售卖.tga",
        selfService = "Auction.tga",
    }, 
    -- 军团联盟  
    [26] = 
    {
        default = "军团相关.tga",
        selfService = "Army.tga",
    }, 
    -- 灵纹转移         
    [27] = 
    {
        default = "装备.tga",
        selfService = "Enhance.tga",
    },
    -- 经验转第二经验         
    [28] = 
    {
        default ="时空漩涡.tga",
        selfService = "Carry.tga", 
    },
    -- 服务器大战         
    [29] = 
    {
        default ="时空漩涡.tga",
        selfService = "Carry.tga", 
    },
    -- 活动战场         
    [30] = 
    {
        default ="时空漩涡.tga",
        selfService = "Carry.tga", 
    },	
}
