--
--[[ @i18n countbirds ]]
local _t = require("i18n").context("countbirds")
-------------------
--
--    数小鸟题目库
--
-------------------

SPRITE_TYPE_BIRD     = 0
SPRITE_TYPE_EGG      = 1
SPRITE_TYPE_HALFEGG  = 2
SPRITE_TYPE_ANGEL    = 3
SPRITE_TYPE_ARROW    = 4
SPRITE_TYPE_BIRDKILL = 5
SPRITE_TYPE_Other    = 6


ACTION_TYPE_DELAY_TIME    = 0 --延迟时间
ACTION_TYPE_SEQUENCE      = 1 --组合动作
ACTION_TYPE_MOVEBY        = 2 --直线移动
ACTION_TYPE_KILLME        = 3 --自我销毁


ACTION_TYPE_CREATE_SPRITE = 4 --创建精灵
ACTION_TYPE_ROTATO_SPRITE = 5 --旋转精灵
ACTION_TYPE_FADEINOUT     = 6 --闪烁精灵
ACTION_TYPE_ROTATOBY_SPRITE = 7 --旋转精灵
ACTION_TYPE_MOVEARC         = 8 --弧形移动
ACTION_TYPE_SHOWHIDE        = 9 --显示隐藏
ACTION_TYPE_ALPHA           = 10 --透明度

CountBirdsSpriteInfo = {}

-- 一箭一雕 一箭双雕
CountBirdsSpriteInfo[1] = 
    {
        stype = SPRITE_TYPE_BIRDKILL,     
        width = 160,
        height = 177,                      
        imageFile = "res/countbirds/Arrow_L1.png",                      
        selfSoundRepeatInterval = 0,                     
    }
CountBirdsSpriteInfo[2] = 
    {
        stype = SPRITE_TYPE_BIRDKILL,     
        width = 160,
        height = 190,                      
        imageFile = "res/countbirds/Arrow_L2.png",                       
        selfSoundRepeatInterval = 0,                          
    }

--7只小鸟  红鸟
CountBirdsSpriteInfo[3] = 
    {
        stype = SPRITE_TYPE_BIRD,                               --精灵类型：小鸟，蛋，弓箭
        width = 79,
        height = 131,
        imageFile = "res/countbirds/Bird1_D.png",                       --精灵图片
        imageFileList = {                                           -- 精灵序列帧（有序列帧动画的使用这个列表配置）
                    [1] = 300,--毫秒数，序列帧切换间隔
                    [2] = "res/countbirds/Bird1_D.png",
                    [3] = "res/countbirds/Bird1_U.png",
                },              
        selfSoundRepeatInterval = 500,                          --精灵自带声音重复间隔：0 只播放一次；其他数值则根据指定的毫秒数循环播放
        selfSound = "SFX/小鸟游戏/小鸟飞过01.ogg",--精灵自带声音，不填则没有音效
        hitSound  = "SFX/小鸟游戏/小鸟中箭.ogg",--被击中时播放的声音
    }
--  大嘴鸟
CountBirdsSpriteInfo[4] = 
    {
        stype = SPRITE_TYPE_BIRD,  
        width = 74,
        height = 116,                             
        imageFile = "res/countbirds/Bird2_D.png",      
        imageFileList = {                                          
                    [1] = 300,
                    [2] = "res/countbirds/Bird2_D.png",
                    [3] = "res/countbirds/Bird2_U.png",
                },                  
        selfSoundRepeatInterval = 500,                          
        selfSound = "SFX/小鸟游戏/小鸟飞过02.ogg",
        hitSound  = "SFX/小鸟游戏/小鸟中箭.ogg",
    }

--小鸟3  母鸡
CountBirdsSpriteInfo[5] = 
    {
        stype = SPRITE_TYPE_BIRD, 
        width = 74,
        height = 107,                           
        imageFile = "res/countbirds/Bird3_D.png", 
        imageFileList = {                                          
                    [1] = 300,
                    [2] = "res/countbirds/Bird3_D.png",
                    [3] = "res/countbirds/Bird3_U.png",
                },                             
        selfSoundRepeatInterval = 500,                          
        selfSound = "SFX/小鸟游戏/小鸟飞过03.ogg",
        hitSound  = "SFX/小鸟游戏/小鸟中箭.ogg",
    }

--小天使
CountBirdsSpriteInfo[6] = 
    {
        stype = SPRITE_TYPE_ANGEL,  
        width = 79,
        height = 139,                            
        imageFile = "res/countbirds/Ghost1.png",   
        imageFileList = {                                          
                    [1] = 300,
                    [2] = "res/countbirds/Ghost1.png",
                },                  
        selfSoundRepeatInterval = 0,                          
        selfSound = "SFX/小鸟游戏/灵魂上升.ogg", 
        hitSound  = "",--被击中时播放的声音
    }

--弓箭 鸡蛋
CountBirdsSpriteInfo[7] = 
    {
        stype = SPRITE_TYPE_EGG,      
        width = 90,
        height = 107,                        
        imageFile = "res/countbirds/Egg.png",   
        imageFileList = {                                          
                    [1] = 300,
                    [2] = "res/countbirds/Egg.png",
                    [3] = "res/countbirds/Egg.png",
                    [4] = "res/countbirds/Egg.png",
                    [5] = "res/countbirds/Egg.png",
                    [6] = "res/countbirds/Egg.png",
                    [7] = "res/countbirds/Egg1.png",
                    [8] = "res/countbirds/Egg2.png",
                    [9] = "res/countbirds/Egg2.png",
                    [10] = "res/countbirds/Egg2.png",
                },                    
        selfSoundRepeatInterval = 0,                          
        selfSound = "SFX/小鸟游戏/鸟蛋下落.ogg",--精灵自带声音，不填则没有音效
        hitSound  = "",--被击中时播放的声音
    }

CountBirdsSpriteInfo[8] = 
    {
        stype = SPRITE_TYPE_ARROW,         
        width = 162,
        height = 22,                  
        imageFile = "res/countbirds/Arrow.png",                       
        selfSoundRepeatInterval = 0,                          
    }
    --小鸟4   黄鹦鹉
CountBirdsSpriteInfo[9] = 
    {
        stype = SPRITE_TYPE_BIRD, 
        width = 74,
        height = 127,                           
        imageFile = "res/countbirds/Bird4_D.png", 
        imageFileList = {                                          
                    [1] = 300,
                    [2] = "res/countbirds/Bird4_D.png",
                    [3] = "res/countbirds/Bird4_U.png",
                },                             
        selfSoundRepeatInterval = 500,                          
        selfSound = "SFX/小鸟游戏/小鸟飞过03.ogg",
        hitSound  = "SFX/小鸟游戏/小鸟中箭.ogg",
    }
--小鸟5   恐龙
CountBirdsSpriteInfo[10] = 
    {
        stype = SPRITE_TYPE_BIRD, 
        width = 135,
        height = 137,                           
        imageFile = "res/countbirds/Bird5_D.png", 
        imageFileList = {                                          
                    [1] = 300,
                    [2] = "res/countbirds/Bird5_D.png",
                    [3] = "res/countbirds/Bird5_U.png",
                },                             
        selfSoundRepeatInterval = 500,                          
        selfSound = "SFX/小鸟游戏/小鸟飞过02.ogg",
        hitSound  = "SFX/小鸟游戏/小鸟中箭.ogg",
    }
    --小鸟6   蓝鹦鹉
CountBirdsSpriteInfo[11] = 
    {
        stype = SPRITE_TYPE_BIRD, 
        width = 101,
        height = 114,                           
        imageFile = "res/countbirds/Bird6_D.png", 
        imageFileList = {                                          
                    [1] = 300,
                    [2] = "res/countbirds/Bird6_D.png",
                    [3] = "res/countbirds/Bird6_U.png",
                },                             
        selfSoundRepeatInterval = 500,                          
        selfSound = "SFX/小鸟游戏/小鸟飞过01.ogg",
        hitSound  = "SFX/小鸟游戏/小鸟中箭.ogg",
    }
CountBirdsSpriteInfo[12] = --  不生鸡 空蛋壳
    {
        stype = SPRITE_TYPE_EGG,      
        width = 90,
        height = 107,                        
        imageFile = "res/countbirds/Egg.png",   
        imageFileList = {                                          
                    [1] = 300,
                    [2] = "res/countbirds/Egg.png",
                    [3] = "res/countbirds/Egg.png",
                    [4] = "res/countbirds/Egg.png",
                    [5] = "res/countbirds/Egg1.png",
                    [6] = "res/countbirds/Egg2.png",
                    [7] = "res/countbirds/Egg3.png",
                    [8] = "res/countbirds/Egg3.png",
                    [9] = "res/countbirds/Egg3.png",
                    [10] = "res/countbirds/Egg3.png",
                    [11] = "res/countbirds/Egg3.png",
                    [12] = "res/countbirds/Egg3.png",
                    [13] = "res/countbirds/Egg3.png",
                    [14] = "res/countbirds/Egg3.png",
                },                    
        selfSoundRepeatInterval = 0,                          
        selfSound = "SFX/小鸟游戏/鸟蛋下落.ogg",--精灵自带声音，不填则没有音效
        hitSound  = "",--被击中时播放的声音
    }
CountBirdsSpriteInfo[13] = 
    {
        stype = SPRITE_TYPE_BIRD, 
        width = 74,
        height = 107,                           
        imageFile = "res/countbirds/Bird3_D.png", 
        imageFileList = {                                          
                    [1] = 300,
                    [2] = "res/countbirds/Bird3_D.png",
                    [3] = "res/countbirds/Bird3_U.png",
                },                             
        selfSoundRepeatInterval = 500,                          
        selfSound = "SFX/小鸟游戏/小鸟出生.ogg",
        hitSound  = "SFX/小鸟游戏/小鸟中箭.ogg",
    }

CountBirdsSpriteInfo[14] =    --  蓝鹦鹉  向左
    {
        stype = SPRITE_TYPE_BIRD,  
        width = 99,
        height = 114,                             
        imageFile = "res/countbirds/Bird6_RD.png",      
        imageFileList = {                                          
                    [1] = 300,
                    [2] = "res/countbirds/Bird6_RD.png",
                    [3] = "res/countbirds/Bird6_RU.png",
                },                  
        selfSoundRepeatInterval = 500,                          
        selfSound = "SFX/小鸟游戏/小鸟飞过02.ogg",
        hitSound  = "SFX/小鸟游戏/小鸟中箭.ogg",
    }

















CountBirdsActions = {}
CountBirdsActions[1] =
    {
        [1] = {aType = ACTION_TYPE_DELAY_TIME, duration = 1000,}, --等待一秒
        [2] = {aType = ACTION_TYPE_MOVEBY, duration = 10000, x = 0, y = -500}, --从下往上移动
    }

CountBirdsActions[2] =  --弓箭  右下角出发
    {
        [1] = {aType = ACTION_TYPE_ROTATO_SPRITE, otherValue = 30,}, --旋转30度
        [2] = {aType = ACTION_TYPE_DELAY_TIME, duration = 1000,}, --等待一秒
        [3] = {aType = ACTION_TYPE_MOVEBY, duration = 3000, x = -1000, y = -1000}, 
    }
CountBirdsActions[3] =   --左往右移动
    {
        [1] = {aType = ACTION_TYPE_DELAY_TIME, duration = 50,},
        [2] = {aType = ACTION_TYPE_MOVEBY, duration = 6000, x = 1500, y = 0},
    }
CountBirdsActions[4] = --生蛋动作
    {
        [1] = {aType = ACTION_TYPE_DELAY_TIME, duration = 3000,}, --等待2秒
        [2] = {aType = ACTION_TYPE_CREATE_SPRITE, spriteID = 5,}, --生蛋
    }
CountBirdsActions[5] = --蛋精灵专用【生蛋版本】
    {
        [1] = {aType = ACTION_TYPE_MOVEBY, duration = 1500, x = 0, y = 150}, --1秒内从上往下移动
        [2] = {aType = ACTION_TYPE_DELAY_TIME, duration = 400,},
        [3] = {aType = ACTION_TYPE_CREATE_SPRITE, spriteID = 3,}, --浮出小鸟
        [4] = {aType = ACTION_TYPE_KILLME,}, --销毁
    }
CountBirdsActions[6] = --孵出的小鸟专用
    {
        [1] = {aType = ACTION_TYPE_DELAY_TIME, duration = 3000,}, --等待3秒
        [2] = {aType = ACTION_TYPE_MOVEBY, duration = 3000, x = 500, y = 0}, 
    }
CountBirdsActions[7] = --死亡的精灵专用
    {
        [1] = {aType = ACTION_TYPE_DELAY_TIME, duration = 2000,}, --等待2秒
        [2] = {aType = ACTION_TYPE_CREATE_SPRITE, spriteID = 1,}, --产生小天使
        [3] = {aType = ACTION_TYPE_KILLME,}, --销毁
    }
CountBirdsActions[8] = --一箭穿雕专用
    {
        [1] = {aType = ACTION_TYPE_FADEINOUT, otherValue = 1000,},
        [2] = {aType = ACTION_TYPE_DELAY_TIME, duration = 2000,}, --等待2秒
    }
CountBirdsActions[9] = --小天使专用
    {
        [1] = {aType = ACTION_TYPE_MOVEBY, duration = 4000, x = 0, y = -270},
        [2] = {aType = ACTION_TYPE_KILLME,}, --销毁
    }
CountBirdsActions[10] = --蛋精灵专用【不生蛋版本】
    {
        [1] = {aType = ACTION_TYPE_MOVEBY, duration = 1000, x = 0, y = 150}, --1秒内从上往下移动
        [2] = {aType = ACTION_TYPE_DELAY_TIME, duration = 2000,},
        [3] = {aType = ACTION_TYPE_KILLME,}, --销毁
    }
CountBirdsActions[11] = --波浪轨迹
    {
        [1] = {aType = ACTION_TYPE_DELAY_TIME, duration = 50,}, 
        [2] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 270, y = 90,otherValue = -100,},
        [3] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 270, y = 90,otherValue = 100,},
        [4] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 90, y = 270,otherValue = -100,},
        [5] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 270, y = 90,otherValue = 100,},
        [6] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 90, y = 270,otherValue = -100,},
        [7] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 270, y = 90,otherValue = 100,},
        [8] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 90, y = 270,otherValue = -100,},
    }
CountBirdsActions[12] = --死亡的精灵专用【产生两个小天使】
    {
        [1] = {aType = ACTION_TYPE_DELAY_TIME, duration = 2000,}, --等待2秒
        [2] = {aType = ACTION_TYPE_CREATE_SPRITE, spriteID = 1,}, --产生小天使
        [3] = {aType = ACTION_TYPE_DELAY_TIME, duration = 1000,}, --等待1秒
        [4] = {aType = ACTION_TYPE_CREATE_SPRITE, spriteID = 1,}, --产生小天使
        [5] = {aType = ACTION_TYPE_KILLME,}, --销毁
    }
CountBirdsActions[13] =
    {
        [1] = {aType = ACTION_TYPE_ROTATO_SPRITE, otherValue = -30,}, --旋转-30度
        [2] = {aType = ACTION_TYPE_DELAY_TIME, duration = 1000,}, --等待一秒
        [3] = {aType = ACTION_TYPE_MOVEBY, duration = 3000, x = -1000, y = 1000}, 
    }
CountBirdsActions[14] =   --左往右移动  1500
    {
        [1] = {aType = ACTION_TYPE_DELAY_TIME, duration = 50,},
        [2] = {aType = ACTION_TYPE_MOVEBY, duration = 9000, x = 1300, y = 0},
    }
CountBirdsActions[15] = --生蛋动作
    {
        [1] = {aType = ACTION_TYPE_DELAY_TIME, duration = 5000,}, --等待5秒
        [2] = {aType = ACTION_TYPE_CREATE_SPRITE, spriteID = 5,}, --生蛋
    }
CountBirdsActions[16] = --灵魂消失
    {
        [1] = {aType = ACTION_TYPE_ALPHA, duration = 4000,x = 255,y = 0,}, --
    }
CountBirdsActions[17] = --   反   波浪轨迹
    {
        [1] = {aType = ACTION_TYPE_DELAY_TIME, duration = 50,}, 
        [2] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 90, y = 270,otherValue = 100,},
        [3] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 90, y = 270,otherValue = -100,},
        [4] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 270, y = 90,otherValue = 100,},
        [5] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 90, y = 270,otherValue = -100,},
        [6] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 270, y = 90,otherValue = 100,},
        [7] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 90, y = 270,otherValue = -100,},
        [8] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 270, y = 90,otherValue = 100,},
    }
CountBirdsActions[18] = --   不规则波浪
    {
        [1] = {aType = ACTION_TYPE_DELAY_TIME, duration = 50,}, 
        [2] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 90, y = 270,otherValue = 100,},
        [3] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 90, y = 270,otherValue = -100,},
        [4] = {aType = ACTION_TYPE_MOVEARC, duration = 1000, x = 270, y = 90,otherValue = 150,},
        [5] = {aType = ACTION_TYPE_MOVEARC, duration = 1000, x = 90, y = 270,otherValue = -150,},
        [6] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 270, y = 90,otherValue = 100,},
        [7] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 90, y = 270,otherValue = -100,},
        [8] = {aType = ACTION_TYPE_MOVEARC, duration = 1000, x = 270, y = 90,otherValue = 150,},
    }
CountBirdsActions[19] =   --右往左移动
    {
        [1] = {aType = ACTION_TYPE_DELAY_TIME, duration = 50,},
        [2] = {aType = ACTION_TYPE_MOVEBY, duration = 6000, x = -1300, y = 0},
    }
CountBirdsActions[20] = --   右往左   反   波浪轨迹
    {
        [1] = {aType = ACTION_TYPE_DELAY_TIME, duration = 50,}, 
        [2] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 90, y = 270,otherValue = -100,},
        [3] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 90, y = 270,otherValue = 100,},
        [4] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 270, y = 90,otherValue = -100,},
        [5] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 90, y = 270,otherValue = 100,},
        [6] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 270, y = 90,otherValue = -100,},
        [7] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 90, y = 270,otherValue = 100,},
        [8] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 270, y = 90,otherValue = -100,},
    }
CountBirdsActions[21] = --   跳跃
    {
        [1] = {aType = ACTION_TYPE_DELAY_TIME, duration = 50,}, 
        [2] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 90, y = 270,otherValue = 100,},
        [3] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 90, y = 270,otherValue = -80,},
        [4] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 90, y = 270,otherValue = -100,},
        [5] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 90, y = 270,otherValue = -100,},
        [6] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 90, y = 270,otherValue = -80,},
        [7] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 90, y = 270,otherValue = -100,},
        [8] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 90, y = 270,otherValue = -100,},
        [9] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 90, y = 270,otherValue = -100,},
        [10] = {aType = ACTION_TYPE_MOVEARC, duration = 1500, x = 90, y = 270,otherValue = -100,},
    }



CountBirdsSprites = {}
CountBirdsSprites[1]= --小天使
    {
        sTypeIndex  = 6,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 9,
                [2] = 16,
                },
    }

CountBirdsSprites[2]= --小鸟1
    {
        sTypeIndex  = 3,
        sTypeIndexRandom  = {--有随机列表的，则该精灵创建时从列表中随机挑一个创建
                [1] = 3,
                [2] = 4,
                [3] = 5,
                [4] = 9,
                [5] = 10,
                [6] = 11,
                },
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 14, --CountBirdsActions中的Action列表是顺序执行的
                --[2] = 10,--需要并列执行的Action则可以参照本例！
                },
    }

CountBirdsSprites[3]= --从蛋里孵出来的小鸟
    {
        sTypeIndex  = 13,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 6,
                },
    }

CountBirdsSprites[4]= --弓箭[箭头向上]
    {
        sTypeIndex  = 8,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 2,
                },
    }
CountBirdsSprites[5]= --蛋
    {
        sTypeIndex  = 7,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 5,
                },
    }
CountBirdsSprites[6]= --小鸟会生蛋  圆弧轨迹
    {
        sTypeIndex  = 4,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 11,
                [2] = 4,
                },
    }
CountBirdsSprites[7]= --一箭一雕（序号不能动，只能是7）
    {
        sTypeIndex  = 1,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 7,
                [2] = 8,
                },
    }
CountBirdsSprites[8]= --一箭双雕（序号不能动，只能是8）
    {
        sTypeIndex  = 2,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 12,
                [2] = 8,
                },
    }
CountBirdsSprites[9]= --弓箭[箭头向下]
    {
        sTypeIndex  = 8,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 13,
                },
    }

CountBirdsSprites[10]= --小鸟会生蛋
    {
        sTypeIndex  = 5,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 3,
                [2] = 4,
                },
    }
CountBirdsSprites[11]= --小鸟1  红鸟
    {
        sTypeIndex  = 3,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 14, --CountBirdsActions中的Action列表是顺序执行的
                --[2] = 10,--需要并列执行的Action则可以参照本例！
                },
    }
CountBirdsSprites[12]= --小鸟2  大嘴
    {
        sTypeIndex  = 4,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 14, --CountBirdsActions中的Action列表是顺序执行的
                --[2] = 10,--需要并列执行的Action则可以参照本例！
                },
    }
CountBirdsSprites[13]= --小鸟3  母鸡
    {
        sTypeIndex  = 5,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 14, --CountBirdsActions中的Action列表是顺序执行的
                --[2] = 10,--需要并列执行的Action则可以参照本例！
                },
    }
CountBirdsSprites[14]= --小鸟4  黄鹦鹉
    {
        sTypeIndex  = 9,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 14, --CountBirdsActions中的Action列表是顺序执行的
                --[2] = 10,--需要并列执行的Action则可以参照本例！
                },
    }
CountBirdsSprites[15]= --小鸟5  恐龙
    {
        sTypeIndex  = 10,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 14, --CountBirdsActions中的Action列表是顺序执行的
                --[2] = 10,--需要并列执行的Action则可以参照本例！
                },
    }
CountBirdsSprites[16]= --小鸟6  蓝鹦鹉
    {
        sTypeIndex  = 11,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 14, --CountBirdsActions中的Action列表是顺序执行的
                --[2] = 10,--需要并列执行的Action则可以参照本例！
                },
    }
CountBirdsSprites[17]= --  蓝鹦鹉  向左飞
    {
        sTypeIndex  = 14,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 19, --CountBirdsActions中的Action列表是顺序执行的
                --[2] = 10,--需要并列执行的Action则可以参照本例！
                },
    }
CountBirdsSprites[18]= --小鸟
    {
        sTypeIndex  = 11,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 14, --CountBirdsActions中的Action列表是顺序执行的
                --[2] = 10,--需要并列执行的Action则可以参照本例！
                },
    }
CountBirdsSprites[19]= --小鸟
    {
        sTypeIndex  = 11,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 14, --CountBirdsActions中的Action列表是顺序执行的
                --[2] = 10,--需要并列执行的Action则可以参照本例！
                },
    }
CountBirdsSprites[20]= --小鸟
    {
        sTypeIndex  = 11,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 14, --CountBirdsActions中的Action列表是顺序执行的
                --[2] = 10,--需要并列执行的Action则可以参照本例！
                },
    }
CountBirdsSprites[21]= --小鸟  波浪轨迹  
    {
        sTypeIndex  = 5,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 11,
                },
    }
CountBirdsSprites[22]= --小鸟  波浪轨迹  生蛋
    {
        sTypeIndex  = 5,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 11,
                [2] = 15,
                },
    }
CountBirdsSprites[23]= --小鸟生蛋   （空蛋壳）
    {
        sTypeIndex  = 5,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 3,
                [2] = 15,
                },
    }
CountBirdsSprites[24]= --蛋
    {
        sTypeIndex  = 12,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 10,
                },
    }
CountBirdsSprites[25]= --小鸟     反 波浪轨迹  
    {
        sTypeIndex  = 4,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 17,
                },
    }
CountBirdsSprites[26]= --小鸟     不规律 波浪轨迹  
    {
        sTypeIndex  = 5,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 18,
                },
    }
CountBirdsSprites[27]= --小鸟    跳跃  左到右
    {
        sTypeIndex  = 4,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 21,
                },
    }
CountBirdsSprites[28]= --小鸟    右到左  反波浪
    {
        sTypeIndex  = 14,
        actionGroup = {--actionGroup是外面定义的action组合
                [1] = 20,
                },
    }












CountBirdsTileMaps = {}
CountBirdsTileMaps[1]=
    {
        mapImages = {
                [1] = "countbirds/GrassLand.png",
                [2] = "countbirds/GrassLand.png",
                [3] = "countbirds/GrassLand.png",
            },
        tileSizeX = 93,
        tileSizeY = 104,
        mapDefault = 1,
        mapTile = {
                [1] = {x= 2,y=2,image=2,},
                [2] = {x= 2,y=3,image=3,},
                [2] = {x= 7,y=4,image=3,},
                [2] = {x= 6,y=3,image=3,},
            },
    }


CountBirdsWorld = {}
CountBirdsWorld[1]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG1.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波
                [1] = {x = -245,y = 85,spriteID = 11,scale=70,},
                [2] = {x = -298,y = 40,spriteID = 11,scale=70,},
                [3] = {x = -372,y = 86,spriteID = 11,scale=70,},
                [4] = {x = -366,y = 162,spriteID = 11,scale=70,},
                [5] = {x = -307,y = 229,spriteID = 11,scale=70,},
                -- 第二波
                [6] = {x = -135,y = 132,spriteID = 13,delay = 2000,speed=50,scale=50,},
                [7] = {x = -35,y = 182,spriteID = 13,delay = 2000,speed=50,scale=50,},
                [8] = {x = -133,y = 248,spriteID = 13,delay = 2000,speed=50,scale=50,},
                [9] = {x = -137,y = 192,spriteID = 13,delay = 2000,speed=50,scale=50,},
                [10] = {x = 1000,y = 700,spriteID = 4,canKillCount=1,delay = 2000,scale=50,},
                },

         award   = {
                 [1] = 11776, -- 奖励1 id
                 [2] = 1, -- 奖励1 num
                 [3] = 8379, -- 奖励2 id
                 [4] = 1, -- 奖励2 num
                 [5] = 8380, 
                 [6] = 1, 
                 [7] = 13066, 
                 [8] = 1, 
                 [9] = 13522, 
                 [10] = 1, 
                 [11] = 44266, 
                 [12] = 1,
                 [13] = 28428, 
                 [14] = 1,
                 [15] = 28429, 
                 [16] = 1,
                 },
         question_answer = {
                 [1] = _t"8",
                 [2] = _t"9",
                 [3] = _t"10",
                 [4] = _t"11",},
    }

CountBirdsWorld[2]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波   
                [1] = {x = -160,y = 75,spriteID = 11,scale=50,speed=50,},
                [2] = {x = -160,y = 175,spriteID = 11,scale=50,speed=50,},
                [3] = {x = -240,y = 25,spriteID = 11,scale=50,speed=50,},
                [4] = {x = -240,y = 225,spriteID = 11,scale=50,speed=50,},
                [5] = {x = -80,y = 125,spriteID = 11,scale=50,speed=50,},
                [6] = {x = -160,y = 375,spriteID = 10,delay = 4000,scale=50,},
                --  第二波    右到左  
                [7] = {x = 929,y = 283,spriteID = 17,speed=70,scale=40,delay = 6600,},
                [8] = {x = 986,y = 253,spriteID = 17,speed=70,scale=50,delay = 6600,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"7",
                 [2] = _t"8",
                 [3] = _t"9",
                 [4] = _t"10",},
    }
CountBirdsWorld[3]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG1.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波
                [1] = {x = -245,y = 185,spriteID = 11,scale=70,},
                [2] = {x = -298,y = 140,spriteID = 11,scale=70,},
                [3] = {x = -372,y = 186,spriteID = 11,scale=70,},
                -- 第二波
                [4] = {x = -135,y = 132,spriteID = 14,delay = 4000,speed=50,scale=50,},
                [5] = {x = -35,y = 182,spriteID = 14,delay = 4000,speed=50,scale=50,},
                [6] = {x = -133,y = 248,spriteID = 14,delay = 4000,speed=50,scale=50,},
                -- 第三波
                [7] = {x = -160,y = 275,spriteID = 10,delay = 3000,scale=50,},
                --  第四波    右到左  浪尖
                [8] = {x = 929,y = 383,spriteID = 17,speed=70,scale=40,delay = 5600,},
                [9] = {x = 986,y = 353,spriteID = 17,speed=70,scale=50,delay = 5600,},
                [10] = {x = 1062,y = 329,spriteID = 17,speed=70,scale=60,delay = 5600,},

                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"9",
                 [2] = _t"10",
                 [3] = _t"11",
                 [4] = _t"12",},
    }
CountBirdsWorld[4]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG1.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波  人字形
                [1] = {x = -316,y = 114,spriteID = 12,scale=70,speed=80,},
                [2] = {x = -339,y = 318,spriteID = 12,scale=70,speed=80,},
                [3] = {x = -361,y = 57,spriteID = 12,scale=70,speed=80,},
                [4] = {x = -393,y = 374,spriteID = 12,scale=70,speed=80,},
                -- 第三波      波浪翻滚
                [5] = {x = -70,y = 265,spriteID = 22,delay = 2000,speed=80,scale=80,},
                [6] = {x = -80,y = 275,spriteID = 21,delay = 2400,speed=80,scale=50,},
                [7] = {x = -80,y = 275,spriteID = 21,delay = 2800,speed=80,scale=50,},
                [8] = {x = -80,y = 275,spriteID = 21,delay = 3200,speed=80,scale=50,},
                [9] = {x = -80,y = 275,spriteID = 21,delay = 3600,speed=80,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"8",
                 [2] = _t"9",
                 [3] = _t"10",
                 [4] = _t"11",},
    }

CountBirdsWorld[5]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波  心形
                [1] = {x = -155,y = 259,spriteID = 12,speed=50,scale=70,},
                [2] = {x = -214,y = 213,spriteID = 12,speed=50,scale=70,},
                [3] = {x = -258,y = 233,spriteID = 12,speed=50,scale=70,},
                [4] = {x = -275,y = 292,spriteID = 12,speed=50,scale=70,},
                [5] = {x = -254,y = 344,spriteID = 12,speed=50,scale=70,},
                [6] = {x = -206,y = 383,spriteID = 12,speed=50,scale=70,},
                [7] = {x = -166,y = 431,spriteID = 12,speed=50,scale=70,},
                [8] = {x = -129,y = 387,spriteID = 12,speed=50,scale=70,},
                [9] = {x = -81,y = 349,spriteID = 12,speed=50,scale=70,},
                [10] = {x = -53,y = 287,spriteID = 12,speed=50,scale=70,},
                -- 第二波   一直飞鸟  下蛋
                [11] = {x = -400,y = 287,spriteID = 10,delay = 3500,speed=100,scale=60,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"11",
                 [2] = _t"12",
                 [3] = _t"13",
                 [4] = _t"14",},
    }

CountBirdsWorld[6]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG1.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波  斜杠
                [1] = {x = -293,y = 167,spriteID = 13,speed=90,scale=70,},
                [2] = {x = -245,y = 218,spriteID = 13,speed=90,scale=70,},
                [3] = {x = -198,y = 272,spriteID = 13,speed=90,scale=70,},
                [4] = {x = -146,y = 330,spriteID = 13,speed=90,scale=70,},
                [5] = {x = -93,y = 388,spriteID = 13,speed=90,scale=70,},
                -- 第二波   斜杠
                [6] = {x = -53,y = 132,spriteID = 11,delay = 4000,speed=100,scale=70,},
                [7] = {x = -104,y = 200,spriteID = 11,delay = 4000,speed=100,scale=70,},
                [8] = {x = -151,y = 264,spriteID = 11,delay = 4000,speed=100,scale=70,},
                [9] = {x = -202,y = 333,spriteID = 11,delay = 4000,speed=100,scale=70,},
                [10] = {x = -254,y = 402,spriteID = 11,delay = 4000,speed=100,scale=70,},
                [11] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 5000,scale=50,}, --一支箭射中一只
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"9",
                 [2] = _t"10",
                 [3] = _t"11",
                 [4] = _t"12",},
    }
CountBirdsWorld[7]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波  燕形队
                [1] = {x = -294,y = 129,spriteID = 15,speed=80,scale=40,},
                [2] = {x = -170,y = 334,spriteID = 15,speed=80,scale=60,},
                [3] = {x = -241,y = 368,spriteID = 15,speed=80,scale=50,},
                [4] = {x = -317,y = 406,spriteID = 15,speed=80,scale=40,},
                [5] = {x = -290,y = 284,spriteID = 15,speed=80,scale=40,},
                -- 第二波   彩带曲线
                [6] = {x = -369,y = 176,spriteID = 11,delay = 5000,speed=90,scale=70,},
                [7] = {x = -285,y = 206,spriteID = 11,delay = 5000,speed=90,scale=70,},
                [8] = {x = -179,y = 232,spriteID = 11,delay = 5000,speed=90,scale=70,},
                [9] = {x = -98,y = 264,spriteID = 11,delay = 5000,speed=90,scale=70,},
                [10] = {x = -56,y = 318,spriteID = 11,delay = 5000,speed=90,scale=70,},
                [11] = {x = -93,y = 385,spriteID = 11,delay = 5000,speed=90,scale=70,},
                [12] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 7500,scale=50,}, 
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"10",
                 [2] = _t"11",
                 [3] = _t"12",
                 [4] = _t"13",},
    }
CountBirdsWorld[8]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波  三角形
                [1] = {x = -81,y = 292,spriteID = 16,speed=80,scale=80,},
                [2] = {x = -157,y = 227,spriteID = 16,speed=80,scale=80,},
                [3] = {x = -229,y = 166,spriteID = 16,speed=80,scale=80,},
                [4] = {x = -231,y = 242,spriteID = 16,speed=80,scale=80,},
                [5] = {x = -231,y = 317,spriteID = 16,speed=80,scale=80,},
                -- 第二波   V 字形
                [6] = {x = -108,y = 232,spriteID = 11,delay = 5000,speed=90,scale=70,},
                [7] = {x = -127,y = 278,spriteID = 11,delay = 5000,speed=90,scale=70,},
                [8] = {x = -153,y = 337,spriteID = 11,delay = 5000,speed=90,scale=70,},
                [9] = {x = -177,y = 297,spriteID = 11,delay = 5000,speed=90,scale=70,},
                [10] = {x = -197,y = 228,spriteID = 11,delay = 5000,speed=90,scale=70,},
                [11] = {x = -89,y = 402,spriteID = 10,delay = 5000,speed=100,scale=65,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"11",
                 [2] = _t"12",
                 [3] = _t"13",
                 [4] = _t"14",},
    }
CountBirdsWorld[9]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG4.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波  反弓形 动态
                [1] = {x = -186,y = 375,spriteID = 11,delay = 4000,speed=90,scale=60,},
                [2] = {x = -142,y = 329,spriteID = 11,delay = 4000,speed=85,scale=60,},
                [3] = {x = -160,y = 417,spriteID = 11,delay = 4000,speed=80,scale=60,},
                -- 第二波   波浪翻滚
                [4] = {x = -70,y = 265,spriteID = 25,delay = 100,speed=80,scale=50,},
                [5] = {x = -80,y = 275,spriteID = 25,delay = 400,speed=80,scale=50,},
                [6] = {x = -80,y = 275,spriteID = 25,delay = 800,speed=80,scale=50,},
                --第三波   右到左   反  波浪翻滚
                [7] = {x = 960,y = 265,spriteID = 28,delay = 100,speed=80,scale=50,},
                [8] = {x = 960,y = 275,spriteID = 28,delay = 400,speed=80,scale=50,},
                [9] = {x = 960,y = 275,spriteID = 28,delay = 800,speed=80,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"8",
                 [2] = _t"9",
                 [3] = _t"10",
                 [4] = _t"11",},
    }
CountBirdsWorld[10]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG5.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波  三只一排
                [1] = {x = -52,y = 224,spriteID = 11,speed=100,scale=70,},
                [2] = {x = -110,y = 270,spriteID = 11,speed=100,scale=80,},
                [3] = {x = -168,y = 316,spriteID = 11,speed=100,scale=80,},
                -- 第二波   四只一排
                [4] = {x = -72,y = 296,spriteID = 16,delay = 3000,speed=90,scale=80,},
                [5] = {x = -135,y = 294,spriteID = 16,delay = 3000,speed=90,scale=80,},
                [6] = {x = -194,y = 293,spriteID = 16,delay = 3000,speed=90,scale=80,},
                [7] = {x = -255,y = 293,spriteID = 16,delay = 3000,speed=90,scale=65,},
                --第三波   下蛋一只
                [8] = {x = -89,y = 402,spriteID = 10,delay = 6000,speed=90,scale=65,},
                [9] = {x = -89,y = 402,spriteID = 27,delay = 6000,speed=90,scale=65,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"7",
                 [2] = _t"8",
                 [3] = _t"9",
                 [4] = _t"10",},
    }
CountBirdsWorld[11]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG4.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波  三只一排
                [1] = {x = -52,y = 224,spriteID = 16,speed=90,scale=70,},
                [2] = {x = -110,y = 270,spriteID = 16,speed=90,scale=80,},
                [3] = {x = -168,y = 316,spriteID = 16,speed=90,scale=80,},
                -- 第二波   四只一排  
                [4] = {x = -72,y = 296,spriteID = 11,delay = 3000,speed=90,scale=80,},
                [5] = {x = -135,y = 294,spriteID = 11,delay = 3000,speed=90,scale=80,},
                [6] = {x = -194,y = 293,spriteID = 11,delay = 3000,speed=90,scale=80,},
                [7] = {x = -255,y = 293,spriteID = 11,delay = 3000,speed=90,scale=65,},
                --第三波   斜杠四只
                [8] = {x = -293,y = 167,spriteID = 12,delay = 6000,speed=90,scale=70,},
                [9] = {x = -245,y = 218,spriteID = 12,delay = 6000,speed=90,scale=70,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"9",
                 [2] = _t"10",
                 [3] = _t"11",
                 [4] = _t"12",},
    }
CountBirdsWorld[12]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG4.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波  三角形
                [1] = {x = -81,y = 292,spriteID = 16,speed=80,scale=80,},
                [2] = {x = -157,y = 227,spriteID = 16,speed=80,scale=80,},
                [3] = {x = -229,y = 166,spriteID = 16,speed=80,scale=80,},
                [4] = {x = -231,y = 242,spriteID = 16,speed=80,scale=80,},
                [5] = {x = -231,y = 317,spriteID = 16,speed=80,scale=80,},
                [6] = {x = -231,y = 386,spriteID = 16,speed=80,scale=80,},
                -- 第二波   波浪翻滚
                [7] = {x = -70,y = 265,spriteID = 21,delay = 2000,speed=80,scale=50,},
                [8] = {x = -80,y = 275,spriteID = 21,delay = 2400,speed=80,scale=50,},
                [9] = {x = -80,y = 275,spriteID = 21,delay = 2800,speed=80,scale=50,},
                [10] = {x = -80,y = 275,spriteID = 21,delay = 3200,speed=80,scale=50,},
                [11] = {x = -80,y = 275,spriteID = 22,delay = 3600,speed=80,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"11",
                 [2] = _t"12",
                 [3] = _t"13",
                 [4] = _t"14",},
    }
CountBirdsWorld[13]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG4.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波  三叉形
                [1] = {x = -96,y = 298,spriteID = 16,speed=90,scale=80,},
                [2] = {x = -153,y = 252,spriteID = 16,speed=90,scale=80,},
                [3] = {x = -153,y = 183,spriteID = 16,speed=90,scale=80,},
                [4] = {x = -153,y = 117,spriteID = 16,speed=90,scale=80,},
                [5] = {x = -214,y = 295,spriteID = 16,speed=90,scale=80,},
                -- 第二波   波浪翻滚
                [6] = {x = -70,y = 265,spriteID = 21,delay = 2000,speed=80,scale=50,},
                [7] = {x = -80,y = 275,spriteID = 21,delay = 2400,speed=80,scale=50,},
                [8] = {x = -80,y = 275,spriteID = 21,delay = 2800,speed=80,scale=50,},
                --第三波   反  波浪翻滚
                [9] = {x = -60,y = 265,spriteID = 25,delay = 2000,speed=80,scale=50,},
                [10] = {x = -60,y = 275,spriteID = 25,delay = 2400,speed=80,scale=50,},
                [11] = {x = -60,y = 275,spriteID = 25,delay = 2800,speed=80,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"10",
                 [2] = _t"11",
                 [3] = _t"12",
                 [4] = _t"13",},
    }
CountBirdsWorld[14]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG5.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波   柺形
                [1] = {x = -90,y = 143,spriteID = 16,speed=90,scale=80,},
                [2] = {x = -90,y = 199,spriteID = 16,speed=90,scale=80,},
                [3] = {x = -90,y = 259,spriteID = 16,speed=90,scale=80,},
                [4] = {x = -164,y = 259,spriteID = 11,speed=90,scale=80,},
                [5] = {x = -239,y = 259,spriteID = 11,speed=90,scale=80,},
                -- 第二波   弧形阵
                [6] = {x = -218,y = 182,spriteID = 14,delay = 3000,speed=80,scale=80,},
                [7] = {x = -135,y = 214,spriteID = 14,delay = 3000,speed=80,scale=70,},
                [8] = {x = -83,y = 251,spriteID = 14,delay = 3000,speed=80,scale=70,},
                [9] = {x = -63,y = 290,spriteID = 14,delay = 3000,speed=80,scale=60,},
                [10] = {x = -86,y = 327,spriteID = 14,delay = 3000,speed=80,scale=70,},
                [11] = {x = -133,y = 383,spriteID = 14,delay = 3000,speed=80,scale=70,},
                [12] = {x = -203,y = 447,spriteID = 14,delay = 3000,speed=80,scale=80,},
                [13] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 4000,scale=50,}, 
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"11",
                 [2] = _t"12",
                 [3] = _t"13",
                 [4] = _t"14",},
    }
CountBirdsWorld[15]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG5.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波   笑脸
                [1] = {x = -76,y = 217,spriteID = 14,speed=90,scale=60,},
                [2] = {x = -230,y = 212,spriteID = 14,speed=90,scale=60,},
                [3] = {x = -26,y = 356,spriteID = 14,speed=90,scale=60,},
                [4] = {x = -186,y = 436,spriteID = 14,speed=90,scale=60,},
                [5] = {x = -241,y = 411,spriteID = 14,speed=90,scale=60,},
                [6] = {x = -263,y = 371,spriteID = 14,speed=90,scale=60,},
                --第三波      呵呵 表情
                [7] = {x = -60,y = 265,spriteID = 26,delay = 4000,speed=80,scale=50,},
                [8] = {x = -60,y = 275,spriteID = 26,delay = 4400,speed=80,scale=50,},
                [9] = {x = -60,y = 275,spriteID = 26,delay = 4800,speed=80,scale=50,},
                [10] = {x = -60,y = 275,spriteID = 26,delay = 5200,speed=80,scale=50,},
                [11] = {x = -60,y = 275,spriteID = 26,delay = 5600,speed=80,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"9",
                 [2] = _t"10",
                 [3] = _t"11",
                 [4] = _t"12",},
    }
CountBirdsWorld[16]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG5.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波   人字形
                [1] = {x = -168,y = 328,spriteID = 14,speed=90,scale=60,},
                [2] = {x = -206,y = 369,spriteID = 14,speed=90,scale=60,},
                [3] = {x = -260,y = 440,spriteID = 14,speed=90,scale=60,},
                [4] = {x = -249,y = 282,spriteID = 14,speed=90,scale=60,},
                [5] = {x = -328,y = 213,spriteID = 14,speed=90,scale=60,},
                -- 第三波     郁闷  表情
                [6] = {x = -149,y = 200,spriteID = 12,delay = 3000,speed=60,scale=50,},
                [7] = {x = -275,y = 200,spriteID = 12,delay = 3000,speed=60,scale=50,},
                [8] = {x = -160,y = 352,spriteID = 12,delay = 3000,speed=60,scale=50,},
                [9] = {x = -203,y = 324,spriteID = 12,delay = 3000,speed=60,scale=50,},
                [10] = {x = -243,y = 322,spriteID = 12,delay = 3000,speed=60,scale=50,},
                [11] = {x = -275,y = 345,spriteID = 12,delay = 3000,speed=60,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"11",
                 [2] = _t"12",
                 [3] = _t"13",
                 [4] = _t"14",},
    }
CountBirdsWorld[17]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG5.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波   圆弧反弹动态
                [1] = {x = -186,y = 375,spriteID = 11,speed=110,scale=60,},
                [2] = {x = -142,y = 329,spriteID = 11,speed=98,scale=60,},
                [3] = {x = -160,y = 417,spriteID = 11,speed=98,scale=60,},
                [4] = {x = -75,y = 286,spriteID = 11,speed=88,scale=60,},
                [5] = {x = -13,y = 240,spriteID = 11,speed=75,scale=60,},
                -- 第二波   椭圆  反弹
                [6] = {x = -25,y = 278,spriteID = 12,delay = 4500,speed=55,scale=50,},
                [7] = {x = -63,y = 214,spriteID = 12,delay = 4500,speed=60,scale=50,},
                [8] = {x = -61,y = 338,spriteID = 12,delay = 4500,speed=60,scale=50,},
                [9] = {x = -136,y = 198,spriteID = 12,delay = 4500,speed=70,scale=50,},
                [10] = {x = -136,y = 353,spriteID = 12,delay = 4500,speed=70,scale=50,},
                [11] = {x = -221,y = 217,spriteID = 12,delay = 4500,speed=80,scale=50,},
                [12] = {x = -249,y = 277,spriteID = 27,delay = 4500,speed=90,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"11",
                 [2] = _t"12",
                 [3] = _t"13",
                 [4] = _t"14",},
    }
CountBirdsWorld[18]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG1.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波   
                [1] = {x = -90,y = 259,spriteID = 16,speed=70,scale=60,},
                [2] = {x = -164,y = 259,spriteID = 16,speed=90,scale=60,},
                [3] = {x = -239,y = 259,spriteID = 16,speed=90,scale=60,},
                [4] = {x = -239,y = 325,spriteID = 16,speed=100,scale=60,},
                [5] = {x = -239,y = 387,spriteID = 16,speed=100,scale=60,},
                -- 第二波   
                [6] = {x = -83,y = 251,spriteID = 14,delay = 4000,speed=80,scale=70,},
                [7] = {x = -63,y = 290,spriteID = 14,delay = 4000,speed=80,scale=60,},
                [8] = {x = -86,y = 327,spriteID = 14,delay = 4000,speed=80,scale=70,},
                [9] = {x = -133,y = 383,spriteID = 14,delay = 4000,speed=80,scale=70,},
                [10] = {x = -203,y = 447,spriteID = 14,delay = 4000,speed=80,scale=80,},
                [11] = {x = -15,y = 534,spriteID = 27,delay = 4000,speed=90,scale=60,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"11",
                 [2] = _t"12",
                 [3] = _t"13",
                 [4] = _t"14",},
    }
CountBirdsWorld[19]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波    月牙
                [1] = {x = -51,y = 146,spriteID = 16,speed=70,scale=50,},
                [2] = {x = -101,y = 358,spriteID = 16,speed=70,scale=50,},
                [3] = {x = -21,y = 381,spriteID = 16,speed=70,scale=50,},
                [4] = {x = -70,y = 340,spriteID = 16,speed=70,scale=50,},
                [5] = {x = -92,y = 270,spriteID = 16,speed=70,scale=50,},
                [6] = {x = -82,y = 204,spriteID = 16,speed=70,scale=50,},
                -- 第二波     星星
                [7] = {x = -114,y = 212,spriteID = 14,delay = 4000,speed=80,scale=60,},
                [8] = {x = -95,y = 285,spriteID = 14,delay = 4000,speed=80,scale=60,},
                [9] = {x = -35,y = 310,spriteID = 14,delay = 4000,speed=80,scale=60,},
                [10] = {x = -96,y = 332,spriteID = 10,delay = 2000,speed=80,scale=60,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"9",
                 [2] = _t"10",
                 [3] = _t"11",
                 [4] = _t"12",},
    }
CountBirdsWorld[20]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波    两列
                [1] = {x = -23,y = 179,spriteID = 16,speed=70,scale=50,},
                [2] = {x = -55,y = 249,spriteID = 16,speed=70,scale=50,},
                [3] = {x = -85,y = 315,spriteID = 16,speed=70,scale=50,},
                -- 第二波     交叉
                [4] = {x = -54,y = 165,spriteID = 16,delay = 6000,speed=70,scale=60,},
                [5] = {x = -136,y = 206,spriteID = 16,delay = 6000,speed=70,scale=60,},
                [6] = {x = -190,y = 265,spriteID = 16,delay = 6000,speed=70,scale=60,},
                [7] = {x = -238,y = 339,spriteID = 14,delay = 6000,speed=70,scale=60,},
                [8] = {x = -272,y = 424,spriteID = 14,delay = 6000,speed=70,scale=60,},
                [9] = {x = -32,y = 294,spriteID = 14,delay = 6000,speed=80,scale=60,},
                [10] = {x = -82,y = 237,spriteID = 14,delay = 6000,speed=80,scale=60,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"9",
                 [2] = _t"10",
                 [3] = _t"11",
                 [4] = _t"12",},
    }
CountBirdsWorld[21]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波  反弓形 动态
                [1] = {x = -186,y = 375,spriteID = 11,speed=90,scale=60,},
                [2] = {x = -142,y = 329,spriteID = 11,speed=85,scale=60,},
                [3] = {x = -160,y = 417,spriteID = 11,speed=80,scale=60,},
                -- 第二波   波浪翻滚
                [4] = {x = -80,y = 275,spriteID = 21,delay = 2800,speed=80,scale=50,},
                [5] = {x = -80,y = 275,spriteID = 21,delay = 3200,speed=80,scale=50,},
                [6] = {x = -80,y = 275,spriteID = 22,delay = 3600,speed=80,scale=50,},
                --第三波   反  波浪翻滚
                [7] = {x = -60,y = 275,spriteID = 25,delay = 2800,speed=80,scale=50,},
                [8] = {x = -60,y = 275,spriteID = 25,delay = 3200,speed=80,scale=50,},
                [9] = {x = -60,y = 275,spriteID = 25,delay = 3600,speed=80,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"7",
                 [2] = _t"8",
                 [3] = _t"9",
                 [4] = _t"10",},
    }
CountBirdsWorld[22]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG3.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波  
                [1] = {x = -96,y = 266,spriteID = 11,speed=100,scale=50,},
                [2] = {x = -133,y = 215,spriteID = 11,speed=100,scale=50,},
                [3] = {x = -165,y = 266,spriteID = 11,speed=100,scale=50,},
                [4] = {x = -207,y = 325,spriteID = 11,speed=100,scale=50,},
                [5] = {x = -231,y = 266,spriteID = 11,speed=100,scale=50,},
                [6] = {x = -275,y = 206,spriteID = 11,speed=100,scale=50,},
                [7] = {x = -315,y = 263,spriteID = 11,speed=100,scale=50,},
                [8] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 1600,scale=50,}, 
                -- 第二波   
                [9] = {x = -293,y = 167,spriteID = 13,delay = 3000,speed=90,scale=70,},
                [10] = {x = -245,y = 218,spriteID = 13,delay = 3000,speed=90,scale=70,},
                [11] = {x = -198,y = 272,spriteID = 13,delay = 3000,speed=90,scale=70,},
                --第三波   人字形
                [12] = {x = -339,y = 318,spriteID = 12,delay = 6000,speed=90,scale=70,},
                [13] = {x = -361,y = 57,spriteID = 12,delay = 6000,speed=90,scale=70,},
                [14] = {x = -393,y = 374,spriteID = 12,delay = 6000,speed=90,scale=70,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"11",
                 [2] = _t"12",
                 [3] = _t"13",
                 [4] = _t"14",},
    }
CountBirdsWorld[23]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG3.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第二波    燕
                [1] = {x = -162,y = 232,spriteID = 14,speed=90,scale=60,},
                [2] = {x = -230,y = 180,spriteID = 14,speed=90,scale=50,},
                [3] = {x = -294,y = 129,spriteID = 14,speed=90,scale=40,},
                [4] = {x = -170,y = 334,spriteID = 14,speed=90,scale=60,},
                [5] = {x = -241,y = 368,spriteID = 14,speed=90,scale=50,},
                [6] = {x = -317,y = 406,spriteID = 14,speed=90,scale=40,},
                [7] = {x = -290,y = 284,spriteID = 14,speed=90,scale=40,},
                --第三波   燕形
                [8] = {x = -263,y = 177,spriteID = 11,delay = 3000,speed=85,scale=70,},
                [9] = {x = -282,y = 268,spriteID = 11,delay = 3000,speed=85,scale=70,},
                [10] = {x = -316,y = 114,spriteID = 11,delay = 3000,speed=85,scale=70,},
                [11] = {x = -339,y = 318,spriteID = 11,delay = 3000,speed=85,scale=70,},
                [12] = {x = -361,y = 57,spriteID = 11,delay = 3000,speed=85,scale=70,},
                [13] = {x = -393,y = 374,spriteID = 11,delay = 3000,speed=85,scale=70,},
                [14] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 7000,scale=50,}, 
                [15] = {x = -93,y = 374,spriteID = 27,delay = 4000,speed=90,scale=70,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"10",
                 [2] = _t"11",
                 [3] = _t"12",
                 [4] = _t"13",},
    }
CountBirdsWorld[24]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG4.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波    十字帆
                [1] = {x = -177,y = 230,spriteID = 11,speed=70,scale=60,},
                [2] = {x = -177,y = 309,spriteID = 11,speed=70,scale=60,},
                [3] = {x = -177,y = 386,spriteID = 11,speed=70,scale=60,},
                [4] = {x = -104,y = 309,spriteID = 11,speed=70,scale=60,},
                [5] = {x = -255,y = 309,spriteID = 11,speed=70,scale=60,},
                [6] = {x = -223,y = 261,spriteID = 16,speed=70,scale=60,},
                [7] = {x = -225,y = 354,spriteID = 16,speed=70,scale=60,},
                --第二波    四只一排
                [8] = {x = -72,y = 296,spriteID = 16,delay = 5000,speed=60,scale=80,},
                [9] = {x = -135,y = 294,spriteID = 16,delay = 5000,speed=70,scale=80,},
                [10] = {x = -194,y = 293,spriteID = 16,delay = 5000,speed=80,scale=80,},
                [11] = {x = -255,y = 293,spriteID = 16,delay = 5000,speed=90,scale=65,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num 
                 },
         question_answer = {
                 [1] = _t"10",
                 [2] = _t"11",
                 [3] = _t"12",
                 [4] = _t"13",},        
    }
CountBirdsWorld[25]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG5.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波    燕形队
                [1] = {x = -162,y = 232,spriteID = 11,speed=80,scale=60,},
                [2] = {x = -230,y = 180,spriteID = 11,speed=80,scale=50,},
                [3] = {x = -294,y = 129,spriteID = 11,speed=80,scale=40,},
                [4] = {x = -170,y = 334,spriteID = 11,speed=80,scale=60,},
                -- 第二波     彩带曲线
                [5] = {x = -125,y = 118,spriteID = 11,delay = 4000,speed=80,scale=70,},
                [6] = {x = -245,y = 139,spriteID = 11,delay = 4000,speed=80,scale=70,},
                [7] = {x = -369,y = 176,spriteID = 11,delay = 4000,speed=80,scale=70,},
                [8] = {x = -285,y = 206,spriteID = 11,delay = 4000,speed=80,scale=70,},
                [9] = {x = -179,y = 232,spriteID = 11,delay = 4000,speed=80,scale=70,},
                [10] = {x = -98,y = 264,spriteID = 11,delay = 4000,speed=80,scale=70,},
                [11] = {x = -56,y = 318,spriteID = 11,delay = 4000,speed=80,scale=70,},
                [12] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 7000,scale=50,}, 
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"10",
                 [2] = _t"11",
                 [3] = _t"12",
                 [4] = _t"13",},
    }
CountBirdsWorld[26]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG1.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第二波   椭圆
                [1] = {x = -54,y = 264,spriteID = 16,delay = 2000,speed=50,scale=50,},
                [2] = {x = -114,y = 172,spriteID = 16,delay = 2000,speed=50,scale=70,},
                [3] = {x = -213,y = 153,spriteID = 16,delay = 2000,speed=50,scale=70,},
                [4] = {x = -297,y = 184,spriteID = 16,delay = 2000,speed=50,scale=70,},
                -- 第三波      波浪翻滚
                [5] = {x = -70,y = 265,spriteID = 22,delay = 4000,speed=110,scale=70,},
                [6] = {x = -80,y = 275,spriteID = 21,delay = 4400,speed=110,scale=50,},
                [7] = {x = -80,y = 275,spriteID = 21,delay = 4800,speed=110,scale=50,},
                [8] = {x = -80,y = 275,spriteID = 21,delay = 5200,speed=110,scale=50,},
                [9] = {x = -80,y = 275,spriteID = 21,delay = 5600,speed=110,scale=50,}, 
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"10",
                 [2] = _t"11",
                 [3] = _t"12",
                 [4] = _t"13",},
    }
CountBirdsWorld[27]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG1.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波   圆弧反弹动态
                [1] = {x = -75,y = 286,spriteID = 11,speed=88,scale=60,},
                [2] = {x = -95,y = 449,spriteID = 11,speed=88,scale=60,},
                [3] = {x = -13,y = 240,spriteID = 11,speed=75,scale=60,},
                 -- 第二波   弧形阵
                [4] = {x = -133,y = 215,spriteID = 15,delay = 3000,speed=80,scale=50,},
                [5] = {x = -165,y = 266,spriteID = 15,delay = 3000,speed=80,scale=50,},
                [6] = {x = -207,y = 325,spriteID = 15,delay = 3000,speed=80,scale=50,},
                [7] = {x = -231,y = 266,spriteID = 15,delay = 3000,speed=80,scale=50,},
                -- 第三波      波浪翻滚
                [8] = {x = -70,y = 265,spriteID = 21,delay = 5000,speed=90,scale=80,},
                [9] = {x = -80,y = 275,spriteID = 21,delay = 5400,speed=90,scale=50,},
                [10] = {x = -80,y = 275,spriteID = 21,delay = 5800,speed=90,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"7",
                 [2] = _t"8",
                 [3] = _t"9",
                 [4] = _t"10",},
    }
CountBirdsWorld[28]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波    两列
                [1] = {x = -23,y = 179,spriteID = 13,speed=100,scale=50,},
                [2] = {x = -55,y = 249,spriteID = 13,speed=90,scale=50,},
                [3] = {x = -85,y = 315,spriteID = 13,speed=80,scale=50,},
                [4] = {x = -76,y = 193,spriteID = 13,speed=70,scale=50,},
                [5] = {x = -107,y = 259,spriteID = 13,speed=80,scale=50,},
                -- 第三波     笑脸
                [6] = {x = -76,y = 217,spriteID = 11,delay = 4000,speed=90,scale=60,},
                [7] = {x = -230,y = 212,spriteID = 11,delay = 4000,speed=90,scale=60,},
                [8] = {x = -26,y = 356,spriteID = 11,delay = 4000,speed=90,scale=60,},
                [9] = {x = -96,y = 423,spriteID = 11,delay = 4000,speed=90,scale=60,},
                [10] = {x = -186,y = 436,spriteID = 11,delay = 4000,speed=90,scale=60,},
                [11] = {x = -241,y = 411,spriteID = 11,delay = 4000,speed=90,scale=60,},
                [12] = {x = -263,y = 371,spriteID = 11,delay = 4000,speed=90,scale=60,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"12",
                 [2] = _t"13",
                 [3] = _t"14",
                 [4] = _t"15",},
    }
CountBirdsWorld[29]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波  三角形
                [1] = {x = -81,y = 292,spriteID = 11,speed=90,scale=80,},
                [2] = {x = -157,y = 227,spriteID = 11,speed=80,scale=80,},
                -- 第二波   波浪翻滚
                [3] = {x = -70,y = 265,spriteID = 21,delay = 3000,speed=110,scale=50,},
                [4] = {x = -80,y = 275,spriteID = 21,delay = 3400,speed=100,scale=50,},
                [5] = {x = -80,y = 275,spriteID = 21,delay = 3800,speed=90,scale=50,},
                [6] = {x = -80,y = 275,spriteID = 21,delay = 4200,speed=80,scale=50,},
                [7] = {x = -80,y = 275,spriteID = 21,delay = 4600,speed=70,scale=50,},
                 -- 第三波    不规则波浪
                [8] = {x = -30,y = 275,spriteID = 26,scale=50,delay = 6000},
                [9] = {x = -30,y = 275,spriteID = 26,scale=50,delay = 6400},
                [10] = {x = -30,y = 275,spriteID = 26,scale=50,delay = 6800},
                [11] = {x = -30,y = 275,spriteID = 26,scale=50,delay = 7200},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"11",
                 [2] = _t"12",
                 [3] = _t"13",
                 [4] = _t"14",},
    }
CountBirdsWorld[30]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG3.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波  S 形
                [1] = {x = -32,y = 267,spriteID = 12,speed=80,scale=50,},
                [2] = {x = -65,y = 238,spriteID = 12,speed=80,scale=50,},
                [3] = {x = -92,y = 273,spriteID = 12,speed=80,scale=50,},
                [4] = {x = -64,y = 301,spriteID = 12,speed=80,scale=50,},
                [5] = {x = -35,y = 339,spriteID = 12,speed=80,scale=50,},
                [6] = {x = -61,y = 364,spriteID = 12,speed=80,scale=50,},
                [7] = {x = -94,y = 343,spriteID = 12,speed=80,scale=50,},
                -- 第二波   E  形
                [8] = {x = -29,y = 325,spriteID = 11,delay = 2400,speed=80,scale=50,},
                [9] = {x = -77,y = 282,spriteID = 11,delay = 2400,speed=80,scale=50,},
                [10] = {x = -124,y = 324,spriteID = 11,delay = 2400,speed=80,scale=50,},
                [11] = {x = -77,y = 324,spriteID = 11,delay = 2400,speed=80,scale=50,},
                [12] = {x = -83,y = 379,spriteID = 11,delay = 2400,speed=80,scale=50,},
                [13] = {x = -44,y = 380,spriteID = 11,delay = 2400,speed=80,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"10",
                 [2] = _t"11",
                 [3] = _t"12",
                 [4] = _t"13",},
    }
CountBirdsWorld[31]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波   燕形
                [1] = {x = -160,y = 175,spriteID = 13,scale=50,},
                [2] = {x = -160,y = 275,spriteID = 13,scale=50,},
                [3] = {x = -240,y = 125,spriteID = 13,scale=50,},
                [4] = {x = -240,y = 325,spriteID = 13,scale=50,},
                [5] = {x = -80,y = 225,spriteID = 13,scale=50,},
                -- 第二波   燕形
                [6] = {x = -160,y = 175,spriteID = 11,scale=50,delay = 3000},
                [7] = {x = -160,y = 275,spriteID = 11,scale=50,delay = 3000},
                [8] = {x = -240,y = 125,spriteID = 11,scale=50,delay = 3000},
                [9] = {x = -240,y = 325,spriteID = 11,scale=50,delay = 3000},
                [10] = {x = -80,y = 225,spriteID = 11,scale=50,delay = 3000},
                [11] = {x = 900,y = 700,spriteID = 4,canKillCount=1,scale=50,delay = 4000,},--速度和缩放大小都是以100为基准的，即100表示正常
                -- 第三波    不规则波浪
                [12] = {x = -30,y = 275,spriteID = 26,scale=50,delay = 5000},
                [13] = {x = -30,y = 275,spriteID = 26,scale=50,delay = 5400},
                [14] = {x = -30,y = 275,spriteID = 26,scale=50,delay = 5800},
                [15] = {x = -30,y = 275,spriteID = 26,scale=50,delay = 6200},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"12",
                 [2] = _t"13",
                 [3] = _t"14",
                 [4] = _t"15",},
    }
CountBirdsWorld[32]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG3.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波   心形
                [1] = {x = -30,y = 275,spriteID = 26,scale=50,},
                [2] = {x = -30,y = 275,spriteID = 26,scale=50,},
                [3] = {x = -30,y = 275,spriteID = 26,scale=50,},
                [4] = {x = -30,y = 275,spriteID = 26,scale=50,},
                -- 第二波  箭形
                [5] = {x = -135,y = 232,spriteID = 12,delay = 3000,speed=100,scale=50,},
                [6] = {x = -35,y = 282,spriteID = 12,delay = 3000,speed=100,scale=50,},
                [7] = {x = -133,y = 348,spriteID = 12,delay = 3000,speed=100,scale=50,},
                [8] = {x = -137,y = 292,spriteID = 12,delay = 3000,speed=100,scale=50,},
                [9] = {x = -244,y = 289,spriteID = 12,delay = 3000,speed=100,scale=50,},
                [10] = {x = -339,y = 285,spriteID = 12,delay = 3000,speed=100,scale=50,},
                [11] = {x = -440,y = 283,spriteID = 12,delay = 3000,speed=100,scale=50,},--速度和缩放大小都是以100为基准的，即100表示正常
                [12] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 2000,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"10",
                 [2] = _t"11",
                 [3] = _t"12",
                 [4] = _t"13",},
    }
CountBirdsWorld[33]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG3.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波  人字形
                [1] = {x = -53,y = 237,spriteID = 10,scale=70,speed=60,},
                [2] = {x = -167,y = 238,spriteID = 12,scale=70,},
                [3] = {x = -263,y = 177,spriteID = 12,scale=70,},
                [4] = {x = -282,y = 268,spriteID = 12,scale=70,},
                [5] = {x = -316,y = 114,spriteID = 12,scale=70,},
                -- 第二波   椭圆
                [6] = {x = -213,y = 153,spriteID = 16,delay = 4000,speed=90,scale=70,},
                [7] = {x = -297,y = 184,spriteID = 16,delay = 4000,speed=90,scale=70,},
                [8] = {x = -291,y = 346,spriteID = 16,delay = 4000,speed=90,scale=60,},
                [9] = {x = -171,y = 371,spriteID = 16,delay = 4000,speed=90,scale=50,},
                -- 第三波      波浪翻滚
                [10] = {x = -70,y = 265,spriteID = 21,delay = 7000,speed=70,scale=80,},
                [11] = {x = -80,y = 275,spriteID = 21,delay = 7400,speed=70,scale=50,},
                [12] = {x = -80,y = 275,spriteID = 21,delay = 7800,speed=70,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"10",
                 [2] = _t"11",
                 [3] = _t"12",
                 [4] = _t"13",},
    }
CountBirdsWorld[34]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG4.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波  心形
                [1] = {x = -53,y = 287,spriteID = 12,speed=70,scale=70,},
                [2] = {x = -70,y = 230,spriteID = 12,speed=70,scale=70,},
                [3] = {x = -130,y = 218,spriteID = 12,speed=70,scale=70,},
                -- 第二波   一直飞鸟  下蛋
                [4] = {x = -400,y = 287,spriteID = 10,delay = 3500,speed=90,scale=60,},
                --  第三波   三只一排
                [5] = {x = -212,y = 189,spriteID = 11,delay = 5000,speed=80,scale=70,},
                [6] = {x = -151,y = 279,spriteID = 11,delay = 5000,speed=80,scale=70,},
                [7] = {x = -88,y = 374,spriteID = 11,delay = 5000,speed=80,scale=70,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"7",
                 [2] = _t"8",
                 [3] = _t"9",
                 [4] = _t"10",},
    }
CountBirdsWorld[35]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG5.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波  燕形队
                [1] = {x = -86,y = 291,spriteID = 15,speed=80,scale=80,},
                [2] = {x = -162,y = 232,spriteID = 15,speed=80,scale=60,},
                [3] = {x = -170,y = 334,spriteID = 15,speed=80,scale=60,},
                -- 第二波   彩带曲线
                [4] = {x = -125,y = 118,spriteID = 11,delay = 4000,speed=70,scale=70,},
                [5] = {x = -245,y = 139,spriteID = 11,delay = 4000,speed=70,scale=70,},
                [6] = {x = -369,y = 176,spriteID = 11,delay = 4000,speed=70,scale=70,},
                [7] = {x = -285,y = 206,spriteID = 11,delay = 4000,speed=70,scale=70,},
                [8] = {x = -179,y = 232,spriteID = 11,delay = 4000,speed=70,scale=70,},
                [9] = {x = -98,y = 264,spriteID = 11,delay = 4000,speed=70,scale=70,},
                -- 第三波     星星
                [10] = {x = -95,y = 285,spriteID = 14,delay = 6000,speed=70,scale=60,},
                [11] = {x = -35,y = 310,spriteID = 14,delay = 6000,speed=70,scale=60,},
                [12] = {x = -96,y = 332,spriteID = 14,delay = 6000,speed=70,scale=60,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"10",
                 [2] = _t"11",
                 [3] = _t"12",
                 [4] = _t"13",},
    }
CountBirdsWorld[36]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG1.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波  T 字母
                [1] = {x = -156,y = 180,spriteID = 16,speed=40,scale=70,},
                [2] = {x = -85,y = 232,spriteID = 16,speed=40,scale=80,},
                [3] = {x = -156,y = 232,spriteID = 16,speed=40,scale=80,},
                [4] = {x = -227,y = 232,spriteID = 16,speed=40,scale=80,},
                [5] = {x = -156,y = 289,spriteID = 16,speed=40,scale=80,},
                [6] = {x = -156,y = 356,spriteID = 16,speed=40,scale=80,},
                [7] = {x = -90,y = 356,spriteID = 16,speed=40,scale=65,},
                --第三波   C 字母
                [8] = {x = -64,y = 210,spriteID = 16,delay = 4000,speed=40,scale=70,},
                [9] = {x = -134,y = 190,spriteID = 16,delay = 4000,speed=40,scale=80,},
                [10] = {x = -194,y = 217,spriteID = 16,delay = 4000,speed=40,scale=80,},
                [11] = {x = -212,y = 282,spriteID = 16,delay = 4000,speed=40,scale=80,},
                [12] = {x = -194,y = 341,spriteID = 16,delay = 4000,speed=40,scale=80,},
                [13] = {x = -136,y = 369,spriteID = 16,delay = 4000,speed=40,scale=80,},
                [14] = {x = -74,y = 349,spriteID = 16,delay = 4000,speed=40,scale=70,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"11",
                 [2] = _t"12",
                 [3] = _t"13",
                 [4] = _t"14",},
    }
CountBirdsWorld[37]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波  X 字母
                [1] = {x = -18,y = 167,spriteID = 16,speed=70,scale=50,},
                [2] = {x = -63,y = 240,spriteID = 16,speed=70,scale=50,},
                [3] = {x = -107,y = 314,spriteID = 16,speed=70,scale=50,},
                [4] = {x = -26,y = 311,spriteID = 16,speed=70,scale=50,},
                [5] = {x = -93,y = 176,spriteID = 16,speed=70,scale=50,},
                -- 第二波   Y 字形
                [6] = {x = -32,y = 144,spriteID = 16,delay = 4000,speed=70,scale=60,},
                [7] = {x = -69,y = 208,spriteID = 16,delay = 4000,speed=70,scale=60,},
                [8] = {x = -106,y = 144,spriteID = 16,delay = 4000,speed=70,scale=60,},
                [9] = {x = -108,y = 277,spriteID = 16,delay = 4000,speed=70,scale=60,},
                --第三波   Z  字母
                [10] = {x = -46,y = 215,spriteID = 11,delay = 7000,speed=70,scale=50,},
                [11] = {x = -109,y = 216,spriteID = 11,delay = 7000,speed=70,scale=50,},
                [12] = {x = -176,y = 214,spriteID = 11,delay = 7000,speed=70,scale=50,},
                [13] = {x = -115,y = 278,spriteID = 11,delay = 7000,speed=70,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"11",
                 [2] = _t"12",
                 [3] = _t"13",
                 [4] = _t"14",},
    }
CountBirdsWorld[38]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG3.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波  彩带 动态
                [1] = {x = -98,y = 264,spriteID = 11,speed=80,scale=60,},
                [2] = {x = -56,y = 318,spriteID = 11,speed=80,scale=60,},
                [3] = {x = -93,y = 385,spriteID = 11,speed=90,scale=60,},
                --第三波   Z  字母
                [4] = {x = -46,y = 215,spriteID = 11,delay = 3000,speed=80,scale=50,},
                [5] = {x = -109,y = 216,spriteID = 11,delay = 3000,speed=80,scale=50,},
                [6] = {x = -176,y = 214,spriteID = 11,delay = 3000,speed=80,scale=50,},
                [7] = {x = -115,y = 278,spriteID = 11,delay = 3000,speed=90,scale=50,},
                --  第四波   A  字母
                [8] = {x = -89,y = 141,spriteID = 16,delay = 6000,speed=85,scale=50,},
                [9] = {x = -65,y = 221,spriteID = 16,delay = 6000,speed=89,scale=50,},
                [10] = {x = -121,y = 217,spriteID = 16,delay = 6000,speed=80,scale=50,},
                [11] = {x = -50,y = 273,spriteID = 16,delay = 6000,speed=82,scale=50,},
                [12] = {x = -145,y = 272,spriteID = 16,delay = 6000,speed=80,scale=50,},
                [13] = {x = -95,y = 221,spriteID = 16,delay = 6000,speed=80,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"11",
                 [2] = _t"12",
                 [3] = _t"13",
                 [4] = _t"14",},
    }
CountBirdsWorld[39]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG4.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波  曲线  动态
                [1] = {x = -29,y = 149,spriteID = 11,speed=60,scale=60,},
                [2] = {x = -109,y = 183,spriteID = 11,speed=65,scale=60,},
                [3] = {x = -162,y = 248,spriteID = 11,speed=75,scale=60,},
                [4] = {x = -183,y = 323,spriteID = 11,speed=85,scale=60,},
                [5] = {x = -173,y = 365,spriteID = 11,speed=75,scale=60,},
                [6] = {x = -121,y = 403,spriteID = 11,speed=68,scale=60,},
                --第三波   柺
                [7] = {x = -164,y = 259,spriteID = 16,delay = 4000,speed=90,scale=80,},
                [8] = {x = -239,y = 259,spriteID = 16,delay = 4000,speed=90,scale=80,},
                [9] = {x = -239,y = 325,spriteID = 16,delay = 4000,speed=90,scale=80,},
                [10] = {x = -239,y = 387,spriteID = 16,delay = 4000,speed=90,scale=80,},
                -- 第二波   右往左  波浪
                [11] = {x = 960,y = 265,spriteID = 28,delay = 1000,speed=80,scale=50,},
                [12] = {x = 960,y = 275,spriteID = 28,delay = 1400,speed=80,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"9",
                 [2] = _t"10",
                 [3] = _t"11",
                 [4] = _t"12",},
    }
CountBirdsWorld[40]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG5.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波  曲线  动态
                [1] = {x = -207,y = 215,spriteID = 16,speed=70,scale=60,},
                [2] = {x = -189,y = 278,spriteID = 16,speed=70,scale=60,},
                [3] = {x = -136,y = 299,spriteID = 16,speed=70,scale=60,},
                [4] = {x = -189,y = 320,spriteID = 16,speed=70,scale=60,},
                [5] = {x = -208,y = 384,spriteID = 16,speed=70,scale=60,},
                -- 第二波   弧形阵
                [6] = {x = -218,y = 182,spriteID = 14,delay = 8000,speed=80,scale=80,},
                [7] = {x = -135,y = 214,spriteID = 14,delay = 8000,speed=80,scale=70,},
                [8] = {x = -83,y = 251,spriteID = 14,delay = 8000,speed=80,scale=70,},
                [9] = {x = -63,y = 290,spriteID = 14,delay = 8000,speed=80,scale=60,},
                [10] = {x = -86,y = 327,spriteID = 14,delay = 8000,speed=80,scale=70,},
                -- 第三波      波浪翻滚
                [11] = {x = -70,y = 265,spriteID = 22,delay = 9000,speed=70,scale=80,},
                [12] = {x = -80,y = 275,spriteID = 21,delay = 9400,speed=70,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"10",
                 [2] = _t"11",
                 [3] = _t"12",
                 [4] = _t"13",},
    }
CountBirdsWorld[41]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG1.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                  -- 第一波    心形
                [1] = {x = -207,y = 215,spriteID = 16,speed=70,scale=60,},
                [2] = {x = -189,y = 278,spriteID = 16,speed=70,scale=60,},
                [3] = {x = -136,y = 299,spriteID = 16,speed=70,scale=60,},
                [4] = {x = -189,y = 320,spriteID = 16,speed=70,scale=60,},
                [5] = {x = -208,y = 384,spriteID = 16,speed=70,scale=60,},
                --第三波   郁闷表情
                [6] = {x = -149,y = 200,spriteID = 11,delay = 4000,speed=80,scale=70,},
                [7] = {x = -275,y = 200,spriteID = 11,delay = 4000,speed=80,scale=70,},
                [8] = {x = -160,y = 352,spriteID = 11,delay = 4000,speed=80,scale=70,},
                [9] = {x = -203,y = 324,spriteID = 11,delay = 4000,speed=80,scale=70,},
                [10] = {x = -243,y = 322,spriteID = 11,delay = 4000,speed=80,scale=70,},
                [11] = {x = -275,y = 345,spriteID = 11,delay = 4000,speed=80,scale=70,},
                [12] = {x = -60,y = 400,spriteID = 10,delay = 500,speed=100,scale=70,},
                [13] = {x = -25,y = 345,spriteID = 27,delay = 4000,speed=80,scale=70,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"11",
                 [2] = _t"12",
                 [3] = _t"13", 
                 [4] = _t"14",},
                 
    }
CountBirdsWorld[42]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波   三角旋
                [1] = {x = -100,y = 327,spriteID = 11,speed=70,scale=50,},
                [2] = {x = -94,y = 256,spriteID = 11,speed=70,scale=50,},
                [3] = {x = -141,y = 187,spriteID = 11,speed=70,scale=50,},
                [4] = {x = -202,y = 422,spriteID = 11,speed=70,scale=50,},
                [5] = {x = -142,y = 462,spriteID = 11,speed=70,scale=50,},
                [6] = {x = -243,y = 282,spriteID = 11,speed=70,scale=50,},
                [7] = {x = -296,y = 318,spriteID = 11,speed=70,scale=50,},
                [8] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 3500,scale=50,}, 
                -- 第二波   波浪翻滚
                [9] = {x = -80,y = 275,spriteID = 21,delay = 2800,speed=80,scale=50,},
                [10] = {x = -80,y = 275,spriteID = 21,delay = 3200,speed=80,scale=50,},
                [11] = {x = -80,y = 275,spriteID = 21,delay = 3600,speed=80,scale=50,},
                --第三波   反  波浪翻滚
                [12] = {x = -60,y = 275,spriteID = 25,delay = 2800,speed=80,scale=50,},
                [13] = {x = -60,y = 275,spriteID = 25,delay = 3200,speed=80,scale=50,},
                [14] = {x = -60,y = 275,spriteID = 25,delay = 3600,speed=80,scale=50,},
                [15] = {x = -53,y = 479,spriteID = 27,speed=110,scale=50,delay = 4600,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"11",
                 [2] = _t"12",
                 [3] = _t"13",
                 [4] = _t"14",},
    }
CountBirdsWorld[43]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG3.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波   浪尖
                [1] = {x = -37,y = 281,spriteID = 11,speed=70,scale=40,},
                [2] = {x = -94,y = 251,spriteID = 11,speed=70,scale=50,},
                [3] = {x = -171,y = 228,spriteID = 11,speed=70,scale=60,},
                  --  第二    右到左   反浪尖
                [4] = {x = 929,y = 283,spriteID = 17,speed=70,scale=40,},
                [5] = {x = 986,y = 253,spriteID = 17,speed=70,scale=50,},
                [6] = {x = 1062,y = 229,spriteID = 17,speed=70,scale=60,},
                [7] = {x = 1186,y = 225,spriteID = 17,speed=70,scale=70,},
                --第三波   燕形动态
                [8] = {x = -186,y = 375,spriteID = 16,delay = 4000,speed=110,scale=60,},
                [9] = {x = -142,y = 329,spriteID = 16,delay = 4000,speed=98,scale=60,},
                [10] = {x = -160,y = 417,spriteID = 16,delay = 4000,speed=98,scale=60,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"10",
                 [2] = _t"11",
                 [3] = _t"12",
                 [4] = _t"13",},
    }
CountBirdsWorld[44]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG4.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                  -- 第二波    右到左 斜排3只
                [1] = {x = 1000,y = 137,spriteID = 17,speed=70,scale=50,},
                [2] = {x = 968,y = 205,spriteID = 17,speed=70,scale=50,},
                [3] = {x = 933,y = 274,spriteID = 17,speed=70,scale=50,},
                  --  第三    半圆
                [4] = {x = -85,y = 182,spriteID = 11,delay = 4000,speed=70,scale=50,},
                [5] = {x = -134,y = 217,spriteID = 11,delay = 4000,speed=70,scale=50,},
                [6] = {x = -148,y = 276,spriteID = 11,delay = 4000,speed=70,scale=50,},
                [7] = {x = -135,y = 341,spriteID = 11,delay = 4000,speed=70,scale=50,},
                [8] = {x = -85,y = 379,spriteID = 11,delay = 4000,speed=70,scale=50,},
                  -- 第五波   波浪
                [9] = {x = -70,y = 265,spriteID = 22,delay = 6000,speed=100,scale=80,},
                [10] = {x = -80,y = 275,spriteID = 21,delay = 6400,speed=100,scale=50,},
                [11] = {x = -80,y = 275,spriteID = 21,delay = 6800,speed=100,scale=50,},
                [12] = {x = -80,y = 275,spriteID = 21,delay = 6200,speed=100,scale=50,},
                [13] = {x = -80,y = 275,spriteID = 21,delay = 7600,speed=100,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"11",
                 [2] = _t"12",
                 [3] = _t"13",
                 [4] = _t"14",},
    }
CountBirdsWorld[45]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG5.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                  -- 第一波    右到左 斜排3只
                [1] = {x = 1000,y = 137,spriteID = 17,speed=60,scale=50,},
                [2] = {x = 968,y = 205,spriteID = 17,speed=70,scale=50,},
                [3] = {x = 933,y = 274,spriteID = 17,speed=80,scale=50,},
                  --  第二    半圆
                [4] = {x = -23,y = 179,spriteID = 14,speed=100,scale=50,},
                [5] = {x = -55,y = 249,spriteID = 13,speed=90,scale=50,},
                [6] = {x = -85,y = 315,spriteID = 12,speed=80,scale=50,},
                [7] = {x = -76,y = 193,spriteID = 13,speed=70,scale=50,},
                [8] = {x = -107,y = 259,spriteID = 13,speed=80,scale=50,},
                [9] = {x = -139,y = 323,spriteID = 12,speed=90,scale=50,},
                -- 第三波     交叉  动态
                [10] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 2000,scale=50,},
                --  第四波    右到左  浪尖
                [11] = {x = 929,y = 283,spriteID = 17,speed=105,scale=60,delay = 4000,},
                [12] = {x = 986,y = 253,spriteID = 17,speed=95,scale=60,delay = 4000,},
                [13] = {x = 1062,y = 229,spriteID = 17,speed=90,scale=60,delay = 4000,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"9",
                 [2] = _t"10",
                 [3] = _t"11",
                 [4] = _t"12",},
    }
CountBirdsWorld[46]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG1.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                  -- 第一波    竖5只
                [1] = {x = -25,y = 111,spriteID = 11,speed=60,scale=50,},
                [2] = {x = -25,y = 206,spriteID = 11,speed=60,scale=50,},
                [3] = {x = -25,y = 291,spriteID = 11,speed=60,scale=50,},
                [4] = {x = -25,y = 392,spriteID = 11,speed=60,scale=50,},
                [5] = {x = -25,y = 483,spriteID = 11,speed=60,scale=50,},
                 --  第二波     燕形阵
                [6] = {x = -160,y = 125,spriteID = 12,scale=50,delay = 4000,},
                [7] = {x = -160,y = 225,spriteID = 12,scale=50,delay = 4000,},
                [8] = {x = -240,y = 75,spriteID = 12,scale=50,delay = 4000,},
                [9] = {x = -240,y = 275,spriteID = 12,scale=50,delay = 4000,},
                [10] = {x = -80,y = 175,spriteID = 12,scale=50,delay = 4000,},
                -- 第三波     波浪
                [11] = {x = -70,y = 265,spriteID = 21,delay = 6000,speed=100,scale=60,},
                [12] = {x = -80,y = 275,spriteID = 21,delay = 6400,speed=100,scale=50,},
                [13] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 2000,scale=50,}, 
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"10",
                 [2] = _t"11",
                 [3] = _t"12",
                 [4] = _t"13",},
    }
CountBirdsWorld[47]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                  -- 第一波    竖5只
                [1] = {x = -95,y = 80,spriteID = 11,speed=70,scale=50,},
                [2] = {x = -95,y = 130,spriteID = 11,speed=66,scale=50,},
                [3] = {x = -95,y = 180,spriteID = 11,speed=64,scale=50,},
                [4] = {x = -95,y = 230,spriteID = 11,speed=62,scale=50,},
                [5] = {x = -95,y = 280,spriteID = 11,speed=60,scale=50,},
                [6] = {x = -95,y = 330,spriteID = 11,scale=50,speed=62,},
                [7] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 1800,scale=50,}, 
                  -- 第三波    弧形
                [8] = {x = -133,y = 383,spriteID = 11,delay = 4000,speed=70,scale=70,},
                [9] = {x = -203,y = 447,spriteID = 11,delay = 4000,speed=70,scale=80,},
                [10] = {x = -315,y = 534,spriteID = 11,delay = 4000,speed=70,scale=90,},
                [11] = {x = -315,y = 234,spriteID = 10,delay = 5000,speed=90,scale=60,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"10",
                 [2] = _t"11",
                 [3] = _t"12",
                 [4] = _t"13",},
    }
CountBirdsWorld[48]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG3.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波     两列
                [1] = {x = -23,y = 179,spriteID = 16,speed=50,scale=50,},
                [2] = {x = -55,y = 249,spriteID = 16,speed=50,scale=50,},
                [3] = {x = -85,y = 315,spriteID = 16,speed=50,scale=50,},
                [4] = {x = -76,y = 193,spriteID = 16,speed=70,scale=50,},
                 -- 第二波      人形
                [5] = {x = -53,y = 237,spriteID = 2,delay = 3000,speed=90,scale=70,},
                [6] = {x = -167,y = 238,spriteID = 2,delay = 3000,speed=90,scale=70,},
                [7] = {x = -263,y = 177,spriteID = 10,delay = 3000,speed=90,scale=70,},
                -- 第二波      V型
                [8] = {x = -108,y = 232,spriteID = 15,delay = 6000,speed=70,scale=60,},
                [9] = {x = -127,y = 278,spriteID = 15,delay = 6000,speed=90,scale=60,},
                [10] = {x = -153,y = 337,spriteID = 15,delay = 6000,speed=100,scale=60,},
                [11] = {x = -177,y = 297,spriteID = 15,delay = 6000,speed=90,scale=60,},
                [12] = {x = -197,y = 228,spriteID = 15,delay = 6000,speed=70,scale=60,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"10",
                 [2] = _t"11",
                 [3] = _t"12",
                 [4] = _t"13",},
    }
CountBirdsWorld[49]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG3.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第二波   波浪翻滚
                [1] = {x = -70,y = 265,spriteID = 21,delay = 2000,speed=80,scale=50,},
                [2] = {x = -80,y = 275,spriteID = 21,delay = 2400,speed=80,scale=50,},
                [3] = {x = -80,y = 275,spriteID = 21,delay = 2800,speed=80,scale=50,},
                [4] = {x = -80,y = 275,spriteID = 21,delay = 3200,speed=80,scale=50,},
                [5] = {x = -80,y = 275,spriteID = 22,delay = 3600,speed=80,scale=50,},
                --第三波   反  波浪翻滚
                [6] = {x = -60,y = 265,spriteID = 25,delay = 2000,speed=80,scale=50,},
                [7] = {x = -60,y = 275,spriteID = 25,delay = 2400,speed=80,scale=50,},
                [8] = {x = -60,y = 275,spriteID = 25,delay = 2800,speed=80,scale=50,},
                [9] = {x = -60,y = 275,spriteID = 25,delay = 3200,speed=80,scale=50,},
                [10] = {x = -60,y = 275,spriteID = 25,delay = 3600,speed=80,scale=50,},
                --  第四波    右到左  浪尖
                [11] = {x = 929,y = 283,spriteID = 17,speed=70,scale=40,delay = 5600,},
                [12] = {x = 986,y = 253,spriteID = 17,speed=70,scale=50,delay = 5600,},
                [13] = {x = 1062,y = 229,spriteID = 17,speed=70,scale=60,delay = 5600,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"13",
                 [2] = _t"14",
                 [3] = _t"15",
                 [4] = _t"16",},
    }
CountBirdsWorld[50]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG4.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波     斜排
                [1] = {x = -86,y = 291,spriteID = 14,speed=90,scale=80,},
                [2] = {x = -162,y = 232,spriteID = 14,speed=100,scale=60,},
                [3] = {x = -230,y = 180,spriteID = 14,speed=100,scale=50,},
                [4] = {x = -294,y = 129,spriteID = 14,speed=90,scale=40,},
                -- 第二波    燕形
                [5] = {x = -170,y = 334,spriteID = 14,delay = 3500,speed=100,scale=60,},
                [6] = {x = -241,y = 368,spriteID = 14,delay = 3500,speed=90,scale=50,},
                [7] = {x = -317,y = 406,spriteID = 14,delay = 3500,speed=80,scale=50,},
                [8] = {x = -290,y = 284,spriteID = 14,delay = 3500,speed=70,scale=50,},
                --第三波   反  波浪翻滚
                [9] = {x = -60,y = 565,spriteID = 27,delay = 4000,speed=80,scale=50,},
                [10] = {x = -60,y = 575,spriteID = 27,delay = 4400,speed=80,scale=50,},
                [11] = {x = -60,y = 575,spriteID = 27,delay = 4800,speed=80,scale=50,},
                [12] = {x = -60,y = 575,spriteID = 27,delay = 5200,speed=80,scale=50,},
                [13] = {x = -60,y = 575,spriteID = 27,delay = 5600,speed=80,scale=50,},
                },
         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"13",
                 [2] = _t"14",
                 [3] = _t"15",
                 [4] = _t"16",},
    }
CountBirdsWorld[51]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG5.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波  曲线  动态
                [1] = {x = -207,y = 215,spriteID = 16,speed=70,scale=60,},
                [2] = {x = -189,y = 278,spriteID = 16,speed=70,scale=60,},
                [3] = {x = -136,y = 299,spriteID = 16,speed=70,scale=60,},
                [4] = {x = -189,y = 320,spriteID = 16,speed=70,scale=60,},
                [5] = {x = -208,y = 384,spriteID = 16,speed=70,scale=60,},
                -- 第二波   弧形阵
                [6] = {x = -63,y = 290,spriteID = 14,delay = 3000,speed=80,scale=60,},
                [7] = {x = -86,y = 327,spriteID = 14,delay = 3000,speed=80,scale=70,},
                [8] = {x = -133,y = 383,spriteID = 14,delay = 3000,speed=80,scale=70,},
                [9] = {x = -203,y = 447,spriteID = 14,delay = 3000,speed=80,scale=80,},
                [10] = {x = -315,y = 534,spriteID = 14,delay = 3000,speed=80,scale=90,},
                -- 第三波      波浪翻滚
                [11] = {x = -70,y = 265,spriteID = 21,delay = 6000,speed=70,scale=80,},
                [12] = {x = -80,y = 275,spriteID = 21,delay = 6400,speed=70,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"12",
                 [2] = _t"13",
                 [3] = _t"14",
                 [4] = _t"15",},
    }
CountBirdsWorld[52]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第二波      V形
                [1] = {x = -108,y = 232,spriteID = 12,speed=90,scale=60,},
                [2] = {x = -127,y = 278,spriteID = 12,speed=90,scale=60,},
                [3] = {x = -153,y = 337,spriteID = 12,speed=90,scale=70,},
                [4] = {x = -177,y = 297,spriteID = 12,speed=90,scale=60,},
                [5] = {x = -197,y = 228,spriteID = 12,speed=90,scale=60,},
                --第三波   郁闷表情
                [6] = {x = -149,y = 200,spriteID = 11,delay = 3000,speed=80,scale=70,},
                [7] = {x = -275,y = 200,spriteID = 11,delay = 3000,speed=80,scale=70,},
                [8] = {x = -160,y = 352,spriteID = 11,delay = 3000,speed=80,scale=70,},
                [9] = {x = -203,y = 324,spriteID = 11,delay = 3000,speed=80,scale=70,},
                [10] = {x = -243,y = 322,spriteID = 11,delay = 3000,speed=80,scale=70,},
                [11] = {x = -275,y = 345,spriteID = 11,delay = 3000,speed=80,scale=70,},
                [12] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 3500,scale=50,}, 
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"9",
                 [2] = _t"10",
                 [3] = _t"11",
                 [4] = _t"12",},
                 
    }
CountBirdsWorld[53]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG3.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波   三角旋
                [1] = {x = -100,y = 327,spriteID = 11,speed=70,scale=50,},
                [2] = {x = -94,y = 256,spriteID = 11,speed=70,scale=50,},
                [3] = {x = -141,y = 187,spriteID = 11,speed=70,scale=50,},
                [4] = {x = -202,y = 422,spriteID = 11,speed=70,scale=50,},
                -- 第二波   波浪翻滚
                [5] = {x = -80,y = 275,spriteID = 21,delay = 2800,speed=80,scale=50,},
                [6] = {x = -80,y = 275,spriteID = 21,delay = 3200,speed=80,scale=50,},
                [7] = {x = -80,y = 275,spriteID = 21,delay = 3600,speed=80,scale=50,},
                --第三波   反  波浪翻滚
                [8] = {x = -60,y = 265,spriteID = 25,delay = 2000,speed=80,scale=50,},
                [9] = {x = -60,y = 275,spriteID = 25,delay = 2400,speed=80,scale=50,},
                [10] = {x = -60,y = 275,spriteID = 25,delay = 2800,speed=80,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"8",
                 [2] = _t"9",
                 [3] = _t"10",
                 [4] = _t"11",},
    }
CountBirdsWorld[54]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG5.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波   浪尖
                [1] = {x = -37,y = 281,spriteID = 11,speed=70,scale=40,},
                [2] = {x = -94,y = 251,spriteID = 11,speed=70,scale=50,},
                [3] = {x = -171,y = 228,spriteID = 11,speed=70,scale=60,},
                [4] = {x = -293,y = 223,spriteID = 11,speed=70,scale=70,},
                [5] = {x = -124,y = 291,spriteID = 11,speed=70,scale=50,},
                  --  第二    右到左   反浪尖
                [6] = {x = 929,y = 283,spriteID = 17,speed=70,scale=40,},
                [7] = {x = 986,y = 253,spriteID = 17,speed=70,scale=50,},
                [8] = {x = 1062,y = 229,spriteID = 17,speed=70,scale=60,},
                [9] = {x = 1186,y = 225,spriteID = 17,speed=70,scale=70,},
                [10] = {x = 1016,y = 293,spriteID = 17,speed=70,scale=50,},
                [11] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 3000,scale=50,}, 
                --第三波   燕形动态
                [12] = {x = -186,y = 375,spriteID = 16,delay = 5000,speed=110,scale=60,},
                [13] = {x = -142,y = 329,spriteID = 16,delay = 5000,speed=98,scale=60,},
                [14] = {x = -160,y = 417,spriteID = 16,delay = 5000,speed=98,scale=60,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"10",
                 [2] = _t"11",
                 [3] = _t"12",
                 [4] = _t"13",},
    }
CountBirdsWorld[55]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG1.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波   斜排3只
                [1] = {x = -102,y = 164,spriteID = 12,speed=70,scale=50,},
                [2] = {x = -68,y = 227,spriteID = 12,speed=70,scale=50,},
                [3] = {x = -30,y = 292,spriteID = 12,speed=70,scale=50,},
                  -- 第二波    右到左 斜排3只
                [4] = {x = 1000,y = 137,spriteID = 17,speed=70,scale=50,},
                [5] = {x = 968,y = 205,spriteID = 17,speed=70,scale=50,},
                [6] = {x = 933,y = 274,spriteID = 17,speed=70,scale=50,},
                  --  第三    半圆
                [7] = {x = -85,y = 182,spriteID = 11,delay = 4000,speed=70,scale=50,},
                [8] = {x = -134,y = 217,spriteID = 11,delay = 4000,speed=70,scale=50,},
                [9] = {x = -148,y = 276,spriteID = 11,delay = 4000,speed=70,scale=50,},
                [10] = {x = -135,y = 341,spriteID = 11,delay = 4000,speed=70,scale=50,},
                [11] = {x = -85,y = 379,spriteID = 11,delay = 4000,speed=70,scale=50,},
                   --  第四波    三角阵
                [12] = {x = -80,y = 275,spriteID = 21,delay = 5200,speed=100,scale=50,},
                [13] = {x = -80,y = 275,spriteID = 22,delay = 5600,speed=100,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"13",
                 [2] = _t"14",
                 [3] = _t"15",
                 [4] = _t"16",},
    }
CountBirdsWorld[56]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG5.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                  -- 第一波    右到左 斜排3只
                [1] = {x = 1000,y = 137,spriteID = 17,speed=70,scale=50,},
                [2] = {x = 968,y = 205,spriteID = 17,speed=70,scale=50,},
                [3] = {x = 933,y = 274,spriteID = 17,speed=70,scale=50,},
                  --  第二    半圆
                [4] = {x = -23,y = 179,spriteID = 13,speed=100,scale=50,},
                [5] = {x = -55,y = 249,spriteID = 13,speed=90,scale=50,},
                [6] = {x = -85,y = 315,spriteID = 13,speed=80,scale=50,},
                [7] = {x = -76,y = 193,spriteID = 13,speed=70,scale=50,},
                [8] = {x = -107,y = 259,spriteID = 13,speed=80,scale=50,},
                [9] = {x = -139,y = 333,spriteID = 13,speed=90,scale=50,},
                -- 第三波     交叉  动态
                [10] = {x = -54,y = 165,spriteID = 11,delay = 3000,speed=70,scale=60,},
                [11] = {x = -136,y = 206,spriteID = 11,delay = 3000,speed=70,scale=60,},
                [12] = {x = -190,y = 265,spriteID = 11,delay = 3000,speed=70,scale=60,},
                [13] = {x = -238,y = 339,spriteID = 11,delay = 3000,speed=70,scale=60,},
                [14] = {x = -272,y = 424,spriteID = 11,delay = 3000,speed=70,scale=60,},
                [15] = {x = 900,y = 700,spriteID = 4,canKillCount=2,delay = 7000,scale=50,}, 
                --  第四波    右到左  浪尖
                [16] = {x = 929,y = 283,spriteID = 17,speed=105,scale=60,delay = 10000,},
                [17] = {x = 986,y = 253,spriteID = 17,speed=95,scale=60,delay = 10000,},
                [18] = {x = 1062,y = 229,spriteID = 17,speed=90,scale=60,delay = 10000,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"15",
                 [2] = _t"16",
                 [3] = _t"17",
                 [4] = _t"18",},
    }
CountBirdsWorld[57]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG1.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                  -- 第一波    竖5只
                [1] = {x = -25,y = 111,spriteID = 11,speed=60,scale=50,},
                [2] = {x = -25,y = 206,spriteID = 11,speed=60,scale=50,},
                [3] = {x = -25,y = 291,spriteID = 11,speed=60,scale=50,},
                [4] = {x = -25,y = 392,spriteID = 11,speed=60,scale=50,},
                [5] = {x = -25,y = 483,spriteID = 11,speed=60,scale=50,},
                 --  第二波     燕形阵
                [6] = {x = -160,y = 125,spriteID = 12,scale=50,delay = 4000,},
                [7] = {x = -160,y = 225,spriteID = 12,scale=50,delay = 4000,},
                [8] = {x = -240,y = 75,spriteID = 12,scale=50,delay = 4000,},
                [9] = {x = -240,y = 275,spriteID = 12,scale=50,delay = 4000,},
                [10] = {x = -80,y = 175,spriteID = 12,scale=50,delay = 4000,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"8",
                 [2] = _t"9",
                 [3] = _t"10",
                 [4] = _t"11",},
    }
CountBirdsWorld[58]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG5.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                  -- 第一波    竖5只
                [1] = {x = -95,y = 80,spriteID = 11,speed=70,scale=50,},
                [2] = {x = -95,y = 130,spriteID = 11,speed=66,scale=50,},
                [3] = {x = -95,y = 180,spriteID = 11,speed=64,scale=50,},
                [4] = {x = -95,y = 230,spriteID = 11,speed=62,scale=50,},
                [5] = {x = -95,y = 280,spriteID = 11,speed=60,scale=50,},
                [6] = {x = -95,y = 330,spriteID = 11,scale=50,speed=62,},
                [7] = {x = -95,y = 380,spriteID = 11,scale=50,speed=64,},
                [8] = {x = -95,y = 430,spriteID = 11,scale=50,speed=66,},
                [9] = {x = -95,y = 480,spriteID = 11,scale=50,speed=70,},
                [10] = {x = 900,y = 0,spriteID = 9,canKillCount=1,delay = 4000,scale=50,}, 
                [11] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 1800,scale=50,}, 
                 -- 第二波    V型
                [12] = {x = -108,y = 232,spriteID = 12,delay = 4000,speed=70,scale=60,},
                [13] = {x = -127,y = 278,spriteID = 12,delay = 4000,speed=70,scale=60,},
                [14] = {x = -153,y = 337,spriteID = 12,delay = 4000,speed=70,scale=60,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"10",
                 [2] = _t"11",
                 [3] = _t"12",
                 [4] = _t"13",},
    }
CountBirdsWorld[59]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG3.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波     两列
                [1] = {x = -23,y = 179,spriteID = 16,speed=50,scale=50,},
                [2] = {x = -55,y = 249,spriteID = 16,speed=50,scale=50,},
                [3] = {x = -85,y = 315,spriteID = 16,speed=50,scale=50,},
                -- 第二波      V型
                [4] = {x = -108,y = 232,spriteID = 15,delay = 3000,speed=70,scale=60,},
                [5] = {x = -127,y = 278,spriteID = 15,delay = 3000,speed=90,scale=60,},
                [6] = {x = -153,y = 337,spriteID = 15,delay = 3000,speed=100,scale=60,},
                [7] = {x = -177,y = 297,spriteID = 15,delay = 3000,speed=90,scale=60,},
                [8] = {x = -197,y = 228,spriteID = 15,delay = 3000,speed=70,scale=60,},
                -- 第三波      人形
                [9] = {x = -282,y = 268,spriteID = 11,delay = 6000,speed=90,scale=70,},
                [10] = {x = -316,y = 114,spriteID = 11,delay = 6000,speed=90,scale=70,},
                [11] = {x = -339,y = 318,spriteID = 11,delay = 6000,speed=90,scale=70,},
                [12] = {x = -361,y = 57,spriteID = 11,delay = 6000,speed=90,scale=70,},
                [13] = {x = -393,y = 374,spriteID = 10,delay = 6000,speed=90,scale=70,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"14",
                 [2] = _t"15",
                 [3] = _t"16",
                 [4] = _t"17",},
    }
CountBirdsWorld[60]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第二波   波浪翻滚
                [1] = {x = -70,y = 265,spriteID = 21,delay = 100,speed=80,scale=50,},
                [2] = {x = -80,y = 275,spriteID = 21,delay = 400,speed=80,scale=50,},
                [3] = {x = -80,y = 275,spriteID = 21,delay = 800,speed=80,scale=50,},
                [4] = {x = -80,y = 275,spriteID = 21,delay = 1200,speed=80,scale=50,},
                [5] = {x = -80,y = 275,spriteID = 21,delay = 1600,speed=80,scale=50,},
                --第三波   反  波浪翻滚
                [6] = {x = -60,y = 265,spriteID = 25,delay = 100,speed=80,scale=50,},
                [7] = {x = -60,y = 275,spriteID = 25,delay = 400,speed=80,scale=50,},
                [8] = {x = -60,y = 275,spriteID = 25,delay = 800,speed=80,scale=50,},
                [9] = {x = -60,y = 275,spriteID = 25,delay = 1200,speed=80,scale=50,},
                --  第四波    右到左  浪尖
                [10] = {x = 929,y = 283,spriteID = 17,speed=70,scale=40,delay = 5600,},
                [11] = {x = 986,y = 253,spriteID = 17,speed=70,scale=50,delay = 5600,},
                [12] = {x = 1062,y = 229,spriteID = 17,speed=70,scale=60,delay = 5600,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"11",
                 [2] = _t"12",
                 [3] = _t"13",
                 [4] = _t"14",},
    }
CountBirdsWorld[61]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG4.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波     斜排
                [1] = {x = -10,y = 320,spriteID = 11,speed=70,scale=60,},
                [2] = {x = -60,y = 320,spriteID = 11,speed=70,scale=60,},
                [3] = {x = -110,y = 320,spriteID = 11,speed=70,scale=60,},
                [4] = {x = -170,y = 320,spriteID = 11,speed=70,scale=60,},
                [5] = {x = -220,y = 320,spriteID = 11,speed=70,scale=60,},
                [6] = {x = -270,y = 320,spriteID = 11,speed=70,scale=60,},
                [7] = {x = -320,y = 320,spriteID = 11,speed=70,scale=60,},
                [8] = {x = -370,y = 320,spriteID = 11,speed=70,scale=60,},


                [9] = {x = -10,y = 360,spriteID = 11,speed=70,scale=60,},
                [10] = {x = -50,y = 360,spriteID = 11,speed=70,scale=60,},
                [11] = {x = -90,y = 360,spriteID = 11,speed=70,scale=60,},
                [12] = {x = -130,y = 360,spriteID = 11,speed=70,scale=60,},
                [13] = {x = -170,y = 360,spriteID = 11,speed=70,scale=60,},
                [14] = {x = -210,y = 360,spriteID = 11,speed=70,scale=60,},
                [15] = {x = -250,y = 360,spriteID = 11,speed=70,scale=60,},
                [16] = {x = -290,y = 360,spriteID = 11,speed=70,scale=60,},


                [17] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 3000,scale=70,},
                [18] = {x = 900,y = 0,spriteID = 9,canKillCount=1,delay = 3000,scale=70,}, 
                [19] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 3800,scale=70,}, 
                [20] = {x = 900,y = 0,spriteID = 9,canKillCount=1,delay = 3000,scale=70,}, 
                [21] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 4800,scale=70,},
                [22] = {x = 900,y = 0,spriteID = 9,canKillCount=1,delay = 4000,scale=70,}, 
                [23] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 5200,scale=70,}, 
                [24] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 4800,scale=70,},
                [25] = {x = 900,y = 0,spriteID = 9,canKillCount=1,delay = 4000,scale=70,}, 
                [26] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 5200,scale=70,}, 
                [27] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 5800,scale=70,},
                [28] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 5800,scale=70,},
                [29] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 5800,scale=70,speed=70,},
                [30] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 5800,scale=70,speed=70,},
                -- 第二波   波浪翻滚
                [31] = {x = -70,y = 265,spriteID = 22,delay = 6000,speed=80,scale=50,},
                [32] = {x = -70,y = 275,spriteID = 21,delay = 6500,speed=80,scale=50,},
                [33] = {x = -70,y = 275,spriteID = 22,delay = 7000,speed=80,scale=50,},
                [34] = {x = -70,y = 275,spriteID = 21,delay = 7500,speed=80,scale=50,},
                [35] = {x = -70,y = 275,spriteID = 21,delay = 8000,speed=80,scale=50,},
                [36] = {x = -70,y = 275,spriteID = 21,delay = 8500,speed=80,scale=50,},
                [37] = {x = -70,y = 275,spriteID = 21,delay = 9000,speed=80,scale=50,},
                -- 第三波   反  波浪翻滚
                [38] = {x = -70,y = 265,spriteID = 25,delay = 6000,speed=80,scale=50,},
                [39] = {x = -70,y = 275,spriteID = 25,delay = 6500,speed=80,scale=50,},
                [40] = {x = -70,y = 275,spriteID = 25,delay = 7000,speed=80,scale=50,},
                [41] = {x = -70,y = 275,spriteID = 25,delay = 7500,speed=80,scale=50,},
                [42] = {x = -70,y = 275,spriteID = 25,delay = 8000,speed=80,scale=50,},
                [43] = {x = -70,y = 275,spriteID = 25,delay = 8500,speed=80,scale=50,},
                [44] = {x = -70,y = 275,spriteID = 25,delay = 9000,speed=80,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"15",
                 [2] = _t"16",
                 [3] = _t"17",
                 [4] = _t"18",},
    }
CountBirdsWorld[62]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG1.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波  反弓形 动态
                [1] = {x = -186,y = 375,spriteID = 11,delay = 5000,speed=110,scale=60,},
                [2] = {x = -142,y = 329,spriteID = 11,delay = 5000,speed=98,scale=60,},
                [3] = {x = -160,y = 417,spriteID = 11,delay = 5000,speed=98,scale=60,},
                [4] = {x = -75,y = 286,spriteID = 11,delay = 5000,speed=88,scale=60,},
                [5] = {x = -95,y = 449,spriteID = 11,delay = 5000,speed=88,scale=60,},
                [6] = {x = -13,y = 240,spriteID = 11,delay = 5000,speed=80,scale=60,},
                [7] = {x = -13,y = 480,spriteID = 11,delay = 5000,speed=80,scale=60,},
                -- 第二波   波浪翻滚
                [8] = {x = -70,y = 265,spriteID = 25,delay = 1000,speed=80,scale=50,},
                [9] = {x = -80,y = 275,spriteID = 25,delay = 1400,speed=80,scale=50,},
                [10] = {x = -80,y = 275,spriteID = 25,delay = 1800,speed=80,scale=50,},
                [11] = {x = -80,y = 275,spriteID = 25,delay = 2200,speed=80,scale=50,},
                [12] = {x = -80,y = 275,spriteID = 25,delay = 2600,speed=80,scale=50,},
                --第三波   右到左   反  波浪翻滚
                [13] = {x = 960,y = 265,spriteID = 28,delay = 1000,speed=80,scale=50,},
                [14] = {x = 960,y = 275,spriteID = 28,delay = 1400,speed=80,scale=50,},
                [15] = {x = 960,y = 275,spriteID = 28,delay = 1800,speed=80,scale=50,},
                [16] = {x = 960,y = 275,spriteID = 28,delay = 2200,speed=80,scale=50,},
                [17] = {x = 960,y = 275,spriteID = 28,delay = 2600,speed=80,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"17",
                 [2] = _t"18",
                 [3] = _t"19",
                 [4] = _t"20",},
    }
CountBirdsWorld[63]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG4.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波  
                [1] = {x = -96,y = 266,spriteID = 11,speed=100,scale=50,delay = 3000,},
                [2] = {x = -133,y = 215,spriteID = 11,speed=100,scale=50,delay = 3000,},
                [3] = {x = -165,y = 266,spriteID = 11,speed=100,scale=50,delay = 3000,},
                [4] = {x = -207,y = 325,spriteID = 11,speed=100,scale=50,delay = 3000,},
                [5] = {x = -231,y = 266,spriteID = 11,speed=100,scale=50,delay = 3000,},
                [6] = {x = -275,y = 206,spriteID = 11,speed=100,scale=50,delay = 3000,},
                [7] = {x = -315,y = 263,spriteID = 11,speed=100,scale=50,delay = 3000,},
                [8] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 5800,scale=50,},
                -- 第二波   斜排
                [9] = {x = -293,y = 167,spriteID = 13,speed=90,scale=70,},
                [10] = {x = -245,y = 218,spriteID = 13,speed=90,scale=70,},
                [11] = {x = -198,y = 272,spriteID = 13,speed=90,scale=70,},
                [12] = {x = -146,y = 330,spriteID = 13,speed=90,scale=70,},
                [13] = {x = -93,y = 388,spriteID = 13,speed=90,scale=70,},
                --第三波   人字形
                [14] = {x = 953,y = 237,spriteID = 17,delay = 6000,speed=90,scale=70,},
                [15] = {x = 1067,y = 238,spriteID = 17,delay = 6000,speed=90,scale=70,},
                [16] = {x = 1163,y = 177,spriteID = 17,delay = 6000,speed=90,scale=70,},
                [17] = {x = 1182,y = 268,spriteID = 17,delay = 6000,speed=90,scale=70,},
                [18] = {x = 1216,y = 114,spriteID = 17,delay = 6000,speed=90,scale=70,},
                [19] = {x = 1239,y = 318,spriteID = 17,delay = 6000,speed=90,scale=70,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"17",
                 [2] = _t"18",
                 [3] = _t"19",
                 [4] = _t"20",},
    }
CountBirdsWorld[64]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG5.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波  X 字母
                [1] = {x = -18,y = 167,spriteID = 16,speed=70,scale=50,},
                [2] = {x = -63,y = 240,spriteID = 16,speed=70,scale=50,},
                [3] = {x = -107,y = 314,spriteID = 16,speed=70,scale=50,},
                [4] = {x = -26,y = 311,spriteID = 16,speed=70,scale=50,},
                [5] = {x = -93,y = 176,spriteID = 16,speed=70,scale=50,},
                -- 第二波   Y 字形
                [6] = {x = -32,y = 144,spriteID = 16,delay = 4000,speed=60,scale=60,},
                [7] = {x = -69,y = 208,spriteID = 16,delay = 4000,speed=60,scale=60,},
                [8] = {x = -106,y = 144,spriteID = 16,delay = 4000,speed=60,scale=60,},
                [9] = {x = -108,y = 277,spriteID = 16,delay = 4000,speed=60,scale=60,},
                --  第四波   A  字母
                [10] = {x = -89,y = 141,spriteID = 27,delay = 8000,speed=90,scale=50,},
                [11] = {x = -65,y = 221,spriteID = 27,delay = 8000,speed=90,scale=50,},
                [12] = {x = -121,y = 217,spriteID = 27,delay = 8000,speed=90,scale=50,},
                [13] = {x = -50,y = 273,spriteID = 27,delay = 8000,speed=90,scale=50,},
                [14] = {x = -145,y = 272,spriteID = 27,delay = 8000,speed=90,scale=50,},
                [15] = {x = -95,y = 221,spriteID = 27,delay = 8000,speed=90,scale=50,},
                [16] = {x = -9,y = 150,spriteID = 27,delay = 5000,speed=90,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"13",
                 [2] = _t"14",
                 [3] = _t"15",
                 [4] = _t"16",},
    }
CountBirdsWorld[65]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG5.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波    十字帆
                [1] = {x = -177,y = 146,spriteID = 11,speed=70,scale=60,},
                [2] = {x = -177,y = 230,spriteID = 11,speed=70,scale=60,},
                [3] = {x = -177,y = 309,spriteID = 11,speed=70,scale=60,},
                [4] = {x = -177,y = 386,spriteID = 11,speed=70,scale=60,},
                [5] = {x = -177,y = 463,spriteID = 11,speed=70,scale=60,},
                [6] = {x = -26,y = 309,spriteID = 11,speed=70,scale=60,},
                [7] = {x = -104,y = 309,spriteID = 11,speed=70,scale=60,},
                [8] = {x = -255,y = 309,spriteID = 11,speed=70,scale=60,},
                [9] = {x = -329,y = 309,spriteID = 11,speed=70,scale=60,},
                [10] = {x = -133,y = 263,spriteID = 13,speed=70,scale=60,},
                [11] = {x = -223,y = 261,spriteID = 13,speed=70,scale=60,},
                [12] = {x = -225,y = 354,spriteID = 13,speed=70,scale=60,},
                [13] = {x = -132,y = 356,spriteID = 13,speed=70,scale=60,},
                --第二波    四只一排
                [14] = {x = -72,y = 296,spriteID = 16,delay = 5000,speed=60,scale=80,},
                [15] = {x = -135,y = 294,spriteID = 16,delay = 5000,speed=70,scale=80,},
                [16] = {x = -194,y = 293,spriteID = 16,delay = 5000,speed=80,scale=80,},
                [17] = {x = -255,y = 293,spriteID = 16,delay = 5000,speed=90,scale=65,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num 
                 },
         question_answer = {
                 [1] = _t"15",
                 [2] = _t"16",
                 [3] = _t"17",
                 [4] = _t"18",},          
    }
CountBirdsWorld[66]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG5.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                   -- 第一波  S 形
                [1] = {x = -32,y = 267,spriteID = 16,speed=80,scale=50,},
                [2] = {x = -65,y = 238,spriteID = 16,speed=80,scale=50,},
                [3] = {x = -92,y = 273,spriteID = 16,speed=80,scale=50,},
                [4] = {x = -64,y = 301,spriteID = 16,speed=80,scale=50,},
                [5] = {x = -35,y = 339,spriteID = 16,speed=80,scale=50,},
                [6] = {x = -61,y = 364,spriteID = 16,speed=80,scale=50,},
                [7] = {x = -94,y = 343,spriteID = 16,speed=80,scale=50,},
                -- 第二波   E  形
                [8] = {x = -29,y = 325,spriteID = 11,delay = 2400,speed=80,scale=50,},
                [9] = {x = -77,y = 282,spriteID = 11,delay = 2400,speed=80,scale=50,},
                [10] = {x = -124,y = 324,spriteID = 11,delay = 2400,speed=80,scale=50,},
                [11] = {x = -77,y = 324,spriteID = 11,delay = 2400,speed=80,scale=50,},
                [12] = {x = -83,y = 379,spriteID = 11,delay = 2400,speed=80,scale=50,},
                [13] = {x = -44,y = 380,spriteID = 11,delay = 2400,speed=80,scale=50,},
                --第三波   Y 形
                [14] = {x = -38,y = 264,spriteID = 11,delay = 4000,speed=80,scale=50,},
                [15] = {x = -85,y = 345,spriteID = 11,delay = 4000,speed=80,scale=50,},
                [16] = {x = -128,y = 261,spriteID = 11,delay = 4000,speed=80,scale=50,},
                [17] = {x = -127,y = 423,spriteID = 11,delay = 4000,speed=80,scale=50,},
                [18] = {x = 900,y = 700,spriteID = 4,canKillCount=2,delay = 7000,scale=50,}, 
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"12",
                 [2] = _t"13",
                 [3] = _t"14",
                 [4] = _t"15",},
    }
CountBirdsWorld[67]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                   -- 第一波   燕形
                [1] = {x = -160,y = 175,spriteID = 13,scale=50,},
                [2] = {x = -160,y = 275,spriteID = 13,scale=50,},
                [3] = {x = -240,y = 125,spriteID = 13,scale=50,},
                [4] = {x = -240,y = 325,spriteID = 13,scale=50,},
                [5] = {x = -80,y = 225,spriteID = 13,scale=50,},
                -- 第二波   燕形
                [6] = {x = -160,y = 175,spriteID = 11,scale=50,delay = 6000},
                [7] = {x = -160,y = 275,spriteID = 11,scale=50,delay = 6000},
                [8] = {x = -240,y = 125,spriteID = 11,scale=50,delay = 6000},
                [9] = {x = -240,y = 325,spriteID = 11,scale=50,delay = 6000},
                [10] = {x = -80,y = 225,spriteID = 11,scale=50,delay = 6000},
                [11] = {x = 900,y = 700,spriteID = 4,canKillCount=1,scale=50,delay = 7000,},--速度和缩放大小都是以100为基准的，即100表示正常
                -- 第三波    不规则波浪
                [12] = {x = -30,y = 275,spriteID = 27,scale=80,delay = 6000},
                [13] = {x = -30,y = 275,spriteID = 27,scale=70,delay = 6400},
                [14] = {x = -30,y = 275,spriteID = 27,scale=60,delay = 6800},
                [15] = {x = -30,y = 275,spriteID = 27,scale=50,delay = 7200},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"11",
                 [2] = _t"12",
                 [3] = _t"13",
                 [4] = _t"14",},
    }
CountBirdsWorld[68]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG3.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波   圆弧反弹动态
                [1] = {x = -186,y = 375,spriteID = 11,delay = 500,speed=110,scale=60,},
                [2] = {x = -142,y = 329,spriteID = 11,delay = 500,speed=98,scale=60,},
                [3] = {x = -160,y = 417,spriteID = 11,delay = 500,speed=98,scale=60,},
                [4] = {x = -75,y = 286,spriteID = 11,delay = 500,speed=88,scale=60,},
                [5] = {x = -95,y = 449,spriteID = 11,delay = 500,speed=88,scale=60,},
                [6] = {x = -13,y = 240,spriteID = 11,delay = 500,speed=75,scale=60,},
                [7] = {x = -13,y = 480,spriteID = 11,delay = 500,speed=75,scale=60,},
                 -- 第二波   弧形阵
                [8] = {x = -96,y = 266,spriteID = 15,delay = 3000,speed=60,scale=50,},
                [9] = {x = -133,y = 215,spriteID = 15,delay = 3000,speed=60,scale=50,},
                [10] = {x = -165,y = 266,spriteID = 15,delay = 3000,speed=60,scale=50,},
                [11] = {x = -207,y = 325,spriteID = 15,delay = 3000,speed=60,scale=50,},
                [12] = {x = -231,y = 266,spriteID = 15,delay = 3000,speed=60,scale=50,},
                [13] = {x = -275,y = 206,spriteID = 15,delay = 3000,speed=60,scale=50,},
                [14] = {x = -315,y = 263,spriteID = 15,delay = 3000,speed=60,scale=50,},
                -- 第三波      波浪翻滚
                [15] = {x = -70,y = 465,spriteID = 27,delay = 5000,speed=110,scale=80,},
                [16] = {x = -80,y = 475,spriteID = 27,delay = 5400,speed=110,scale=50,},
                [17] = {x = -80,y = 475,spriteID = 27,delay = 5800,speed=110,scale=50,},
                [18] = {x = -80,y = 475,spriteID = 27,delay = 6200,speed=110,scale=50,},
                [19] = {x = -80,y = 475,spriteID = 27,delay = 6600,speed=110,scale=50,},
                [20] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 3500,scale=50,}, 
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"18",
                 [2] = _t"19",
                 [3] = _t"20",
                 [4] = _t"21",},
    }
CountBirdsWorld[69]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG3.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波    两列
                [1] = {x = -23,y = 479,spriteID = 27,speed=110,scale=50,},
                [2] = {x = -55,y = 549,spriteID = 27,speed=100,scale=50,},
                [3] = {x = -85,y = 515,spriteID = 27,speed=90,scale=50,},
                [4] = {x = -76,y = 493,spriteID = 27,speed=80,scale=50,},
                [5] = {x = -107,y = 559,spriteID = 27,speed=70,scale=50,},
                [6] = {x = -139,y = 323,spriteID = 10,speed=70,scale=50,},
                -- 第二波     交叉
                [7] = {x = -238,y = 339,spriteID = 14,delay = 3000,speed=70,scale=60,},
                [8] = {x = -272,y = 424,spriteID = 14,delay = 3000,speed=70,scale=60,},
                [9] = {x = -32,y = 294,spriteID = 14,delay = 3000,speed=80,scale=60,},
                [10] = {x = -82,y = 237,spriteID = 14,delay = 3000,speed=80,scale=60,},
                [11] = {x = -309,y = 183,spriteID = 14,delay = 3000,speed=80,scale=60,},
                -- 第三波     笑脸
                [12] = {x = -76,y = 217,spriteID = 11,delay = 8000,speed=90,scale=60,},
                [13] = {x = -230,y = 212,spriteID = 11,delay = 8000,speed=90,scale=60,},
                [14] = {x = -26,y = 356,spriteID = 11,delay = 8000,speed=90,scale=60,},
                [15] = {x = -96,y = 423,spriteID = 11,delay = 8000,speed=90,scale=60,},
                [16] = {x = -186,y = 436,spriteID = 11,delay = 8000,speed=90,scale=60,},
                [17] = {x = -241,y = 411,spriteID = 11,delay = 8000,speed=90,scale=60,},
                [18] = {x = -263,y = 371,spriteID = 11,delay = 8000,speed=90,scale=60,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"16",
                 [2] = _t"17",
                 [3] = _t"18",
                 [4] = _t"19",},
    }
CountBirdsWorld[70]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG5.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波  三角形
                [1] = {x = -81,y = 292,spriteID = 11,speed=90,scale=80,},
                [2] = {x = -157,y = 227,spriteID = 11,speed=80,scale=80,},
                [3] = {x = -229,y = 166,spriteID = 11,speed=70,scale=80,},
                [4] = {x = -231,y = 242,spriteID = 11,speed=80,scale=80,},
                [5] = {x = -231,y = 317,spriteID = 11,speed=90,scale=80,},
                [6] = {x = -231,y = 386,spriteID = 11,speed=100,scale=80,},
                [7] = {x = -157,y = 340,spriteID = 11,speed=110,scale=80,},
                -- 第二波   波浪翻滚
                [8] = {x = -70,y = 265,spriteID = 25,delay = 3000,speed=100,scale=50,},
                [9] = {x = -80,y = 275,spriteID = 25,delay = 3400,speed=95,scale=50,},
                [10] = {x = -80,y = 275,spriteID = 25,delay = 3800,speed=90,scale=50,},
                [11] = {x = -80,y = 275,spriteID = 25,delay = 4200,speed=85,scale=50,},
                [12] = {x = -80,y = 275,spriteID = 25,delay = 4600,speed=80,scale=50,},
                 -- 第三波  右往左  波浪
                [13] = {x = 970,y = 265,spriteID = 28,delay = 3000,speed=100,scale=50,},
                [14] = {x = 980,y = 275,spriteID = 28,delay = 3400,speed=95,scale=50,},
                [15] = {x = 980,y = 275,spriteID = 28,delay = 3800,speed=90,scale=50,},
                [16] = {x = 980,y = 275,spriteID = 28,delay = 4200,speed=85,scale=50,},
                [17] = {x = 980,y = 275,spriteID = 28,delay = 4600,speed=80,scale=50,},
                [18] = {x = -23,y = 479,spriteID = 27,speed=110,scale=50,},
                [19] = {x = -55,y = 549,spriteID = 27,speed=100,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"18",
                 [2] = _t"19",
                 [3] = _t"20",
                 [4] = _t"21",},
    }
CountBirdsWorld[71]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG4.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波    燕形队
                [1] = {x = -86,y = 291,spriteID = 11,speed=80,scale=80,},
                [2] = {x = -162,y = 232,spriteID = 11,speed=80,scale=60,},
                [3] = {x = -230,y = 180,spriteID = 11,speed=80,scale=50,},
                [4] = {x = -294,y = 129,spriteID = 11,speed=80,scale=40,},
                [5] = {x = -170,y = 334,spriteID = 11,speed=80,scale=60,},
                [6] = {x = -241,y = 368,spriteID = 11,speed=80,scale=50,},
                [7] = {x = -317,y = 406,spriteID = 11,speed=80,scale=40,},
                [8] = {x = -290,y = 284,spriteID = 11,speed=80,scale=40,},
                -- 第二波     彩带曲线
                [9] = {x = -125,y = 118,spriteID = 11,delay = 7000,speed=80,scale=70,},
                [10] = {x = -245,y = 139,spriteID = 11,delay = 7000,speed=80,scale=70,},
                [11] = {x = -369,y = 176,spriteID = 11,delay = 7000,speed=80,scale=70,},
                [12] = {x = -285,y = 206,spriteID = 11,delay = 7000,speed=80,scale=70,},
                [13] = {x = -179,y = 232,spriteID = 11,delay = 7000,speed=80,scale=70,},
                [14] = {x = -98,y = 264,spriteID = 11,delay = 7000,speed=80,scale=70,},
                [15] = {x = -56,y = 318,spriteID = 11,delay = 7000,speed=80,scale=70,},
                [16] = {x = -93,y = 385,spriteID = 11,delay = 7000,speed=80,scale=70,},
                [17] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 10000,scale=50,}, 
                --第三波      四只一排
                [18] = {x = -72,y = 296,spriteID = 16,delay = 5000,speed=90,scale=80,},
                [19] = {x = -135,y = 294,spriteID = 16,delay = 5000,speed=90,scale=80,},
                [20] = {x = -194,y = 293,spriteID = 16,delay = 5000,speed=90,scale=80,},
                [21] = {x = -255,y = 293,spriteID = 10,delay = 5000,speed=90,scale=65,},
                [22] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 3000,scale=50,}, 
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"19",
                 [2] = _t"20",
                 [3] = _t"21",
                 [4] = _t"22",},
    }
CountBirdsWorld[72]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波  人字形
                [1] = {x = -53,y = 237,spriteID = 11,scale=70,},
                [2] = {x = -167,y = 238,spriteID = 11,scale=70,},
                [3] = {x = -263,y = 177,spriteID = 12,scale=70,},
                [4] = {x = -282,y = 268,spriteID = 12,scale=70,},
                [5] = {x = -316,y = 114,spriteID = 12,scale=70,},
                [6] = {x = -339,y = 318,spriteID = 12,scale=70,},
                [7] = {x = -361,y = 57,spriteID = 12,scale=70,},
                [8] = {x = -393,y = 374,spriteID = 12,scale=70,},
                -- 第二波   椭圆
                [9] = {x = -54,y = 264,spriteID = 13,delay = 2000,speed=50,scale=50,},
                [10] = {x = -114,y = 172,spriteID = 13,delay = 2000,speed=50,scale=70,},
                [11] = {x = -213,y = 153,spriteID = 13,delay = 2000,speed=50,scale=70,},
                [12] = {x = -297,y = 184,spriteID = 13,delay = 2000,speed=50,scale=70,},
                [13] = {x = -339,y = 257,spriteID = 13,delay = 2000,speed=50,scale=70,},
                [14] = {x = -291,y = 346,spriteID = 13,delay = 2000,speed=50,scale=70,},
                [15] = {x = -171,y = 371,spriteID = 13,delay = 2000,speed=50,scale=70,},
                -- 第三波      波浪翻滚
                [16] = {x = -70,y = 265,spriteID = 21,delay = 5000,speed=110,scale=70,},
                [17] = {x = -80,y = 275,spriteID = 21,delay = 5400,speed=110,scale=50,},
                [18] = {x = -80,y = 275,spriteID = 21,delay = 5800,speed=110,scale=50,},
                [19] = {x = -80,y = 275,spriteID = 21,delay = 6200,speed=110,scale=50,},
                [20] = {x = -80,y = 275,spriteID = 21,delay = 6600,speed=110,scale=50,},
                [21] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 2000,scale=50,}, 
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"16",
                 [2] = _t"17",
                 [3] = _t"18",
                 [4] = _t"19",},
    }
CountBirdsWorld[73]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG3.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波   心形
                [1] = {x = -245,y = 185,spriteID = 11,scale=70,},
                [2] = {x = -298,y = 140,spriteID = 11,scale=70,},
                [3] = {x = -372,y = 186,spriteID = 11,scale=70,},
                [4] = {x = -366,y = 262,spriteID = 11,scale=70,},
                [5] = {x = -307,y = 329,spriteID = 11,scale=70,},
                [6] = {x = -276,y = 449,spriteID = 11,scale=70,},
                [7] = {x = -179,y = 364,spriteID = 11,scale=70,},
                [8] = {x = -79,y = 241,spriteID = 11,scale=70,},
                [9] = {x = -130,y = 146,spriteID = 11,scale=70,},
                -- 第二波  箭形
                [10] = {x = -135,y = 232,spriteID = 2,delay = 3000,speed=100,scale=50,},
                [11] = {x = -35,y = 282,spriteID = 2,delay = 3000,speed=100,scale=50,},
                [12] = {x = -133,y = 348,spriteID = 2,delay = 3000,speed=100,scale=50,},
                [13] = {x = -137,y = 292,spriteID = 2,delay = 3000,speed=100,scale=50,},
                [14] = {x = -244,y = 289,spriteID = 2,delay = 3000,speed=100,scale=50,},
                [15] = {x = -339,y = 285,spriteID = 2,delay = 3000,speed=100,scale=50,},
                [16] = {x = -440,y = 283,spriteID = 2,delay = 3000,speed=100,scale=50,},--速度和缩放大小都是以100为基准的，即100表示正常
                 -- 第三波  右往左  波浪
                [17] = {x = 970,y = 265,spriteID = 28,delay = 3000,speed=100,scale=50,},
                [18] = {x = 980,y = 275,spriteID = 28,delay = 3400,speed=95,scale=50,},
                [19] = {x = 980,y = 275,spriteID = 28,delay = 3800,speed=90,scale=50,},
                [20] = {x = 980,y = 275,spriteID = 28,delay = 4200,speed=85,scale=50,},
                [21] = {x = 980,y = 275,spriteID = 28,delay = 4600,speed=80,scale=50,},
                [22] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 2000,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"20",
                 [2] = _t"21",
                 [3] = _t"22",
                 [4] = _t"23",},
    }
CountBirdsWorld[74]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波  人字形
                [1] = {x = -53,y = 237,spriteID = 14,scale=70,speed=60,},
                [2] = {x = -167,y = 238,spriteID = 14,scale=70,speed=60,},
                [3] = {x = -263,y = 177,spriteID = 12,scale=70,},
                [4] = {x = -282,y = 268,spriteID = 12,scale=70,},
                [5] = {x = -316,y = 114,spriteID = 12,scale=70,},
                [6] = {x = -339,y = 318,spriteID = 12,scale=70,},
                [7] = {x = -361,y = 57,spriteID = 12,scale=70,},
                [8] = {x = -393,y = 374,spriteID = 12,scale=70,},
                -- 第二波   椭圆
                [9] = {x = -54,y = 264,spriteID = 16,delay = 4000,speed=90,scale=50,},
                [10] = {x = -114,y = 172,spriteID = 16,delay = 4000,speed=90,scale=60,},
                [11] = {x = -213,y = 153,spriteID = 16,delay = 4000,speed=90,scale=70,},
                [12] = {x = -297,y = 184,spriteID = 16,delay = 4000,speed=90,scale=70,},
                [13] = {x = -339,y = 257,spriteID = 16,delay = 4000,speed=90,scale=70,},
                [14] = {x = -291,y = 346,spriteID = 16,delay = 4000,speed=90,scale=60,},
                [15] = {x = -171,y = 371,spriteID = 16,delay = 4000,speed=90,scale=50,},
                -- 第三波      波浪翻滚
                [16] = {x = -70,y = 265,spriteID = 27,delay = 8000,speed=100,scale=80,},
                [17] = {x = -80,y = 275,spriteID = 27,delay = 8400,speed=100,scale=50,},
                [18] = {x = -80,y = 275,spriteID = 27,delay = 8800,speed=100,scale=50,},
                [19] = {x = -80,y = 275,spriteID = 27,delay = 9200,speed=100,scale=50,},
                [20] = {x = -80,y = 275,spriteID = 27,delay = 9600,speed=100,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"20",
                 [2] = _t"21",
                 [3] = _t"22",
                 [4] = _t"23",},
    }
CountBirdsWorld[75]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG1.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波  心形
                [1] = {x = -155,y = 259,spriteID = 27,speed=80,scale=70,},
                [2] = {x = -214,y = 213,spriteID = 27,speed=80,scale=70,},
                [3] = {x = -258,y = 233,spriteID = 27,speed=80,scale=70,},
                [4] = {x = -275,y = 292,spriteID = 27,speed=80,scale=70,},
                [5] = {x = -254,y = 344,spriteID = 27,speed=80,scale=70,},
                [6] = {x = -206,y = 383,spriteID = 27,speed=80,scale=70,},
                [7] = {x = -166,y = 431,spriteID = 27,speed=80,scale=70,},
                [8] = {x = -129,y = 387,spriteID = 27,speed=80,scale=70,},
                [9] = {x = -81,y = 349,spriteID = 27,speed=80,scale=70,},
                [10] = {x = -53,y = 287,spriteID = 27,speed=80,scale=70,},
                [11] = {x = -70,y = 230,spriteID = 27,speed=80,scale=70,},
                [12] = {x = -130,y = 218,spriteID = 27,speed=80,scale=70,},
                -- 第二波   一直飞鸟  下蛋
                [13] = {x = -400,y = 287,spriteID = 10,delay = 3500,speed=100,scale=60,},
                --  第三波   三只一排
                [14] = {x = -212,y = 189,spriteID = 11,delay = 9000,speed=80,scale=70,},
                [15] = {x = -151,y = 279,spriteID = 11,delay = 9000,speed=80,scale=70,},
                [16] = {x = -88,y = 374,spriteID = 11,delay = 9000,speed=80,scale=70,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"15",
                 [2] = _t"16",
                 [3] = _t"17",
                 [4] = _t"18",},
    }
CountBirdsWorld[76]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG1.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波  燕形队
                [1] = {x = -86,y = 291,spriteID = 15,speed=80,scale=80,},
                [2] = {x = -162,y = 232,spriteID = 15,speed=80,scale=60,},
                [3] = {x = -230,y = 180,spriteID = 15,speed=80,scale=50,},
                [4] = {x = -294,y = 129,spriteID = 15,speed=80,scale=40,},
                [5] = {x = -170,y = 334,spriteID = 15,speed=80,scale=60,},
                [6] = {x = -241,y = 368,spriteID = 15,speed=80,scale=50,},
                [7] = {x = -317,y = 406,spriteID = 15,speed=80,scale=40,},
                [8] = {x = -290,y = 284,spriteID = 15,speed=80,scale=40,},
                -- 第二波   彩带曲线
                [9] = {x = -125,y = 118,spriteID = 11,delay = 5000,speed=70,scale=70,},
                [10] = {x = -245,y = 139,spriteID = 11,delay = 5000,speed=70,scale=70,},
                [11] = {x = -369,y = 176,spriteID = 11,delay = 5000,speed=70,scale=70,},
                [12] = {x = -285,y = 206,spriteID = 11,delay = 5000,speed=70,scale=70,},
                [13] = {x = -179,y = 232,spriteID = 11,delay = 5000,speed=70,scale=70,},
                [14] = {x = -98,y = 264,spriteID = 11,delay = 5000,speed=70,scale=70,},
                [15] = {x = -56,y = 318,spriteID = 11,delay = 5000,speed=70,scale=70,},
                [16] = {x = -93,y = 385,spriteID = 11,delay = 5000,speed=70,scale=70,},
                [17] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 8500,scale=80,}, 
                -- 第三波     星星
                [18] = {x = -114,y = 212,spriteID = 14,delay = 11000,speed=70,scale=60,},
                [19] = {x = -95,y = 285,spriteID = 14,delay = 11000,speed=70,scale=60,},
                [20] = {x = -35,y = 310,spriteID = 14,delay = 11000,speed=70,scale=60,},
                [21] = {x = -96,y = 332,spriteID = 14,delay = 11000,speed=70,scale=60,},
                [22] = {x = -114,y = 402,spriteID = 14,delay = 11000,speed=70,scale=60,},
                [23] = {x = -133,y = 333,spriteID = 14,delay = 11000,speed=70,scale=60,},
                [24] = {x = -192,y = 309,spriteID = 14,delay = 11000,speed=70,scale=60,},
                [25] = {x = -135,y = 286,spriteID = 14,delay = 11000,speed=70,scale=60,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"22",
                 [2] = _t"23",
                 [3] = _t"24",
                 [4] = _t"25",},
    }
CountBirdsWorld[77]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG5.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波  T 字母
                [1] = {x = -156,y = 180,spriteID = 16,speed=40,scale=70,},
                [2] = {x = -85,y = 232,spriteID = 16,speed=40,scale=80,},
                [3] = {x = -156,y = 232,spriteID = 16,speed=40,scale=80,},
                [4] = {x = -227,y = 232,spriteID = 16,speed=40,scale=80,},
                [5] = {x = -156,y = 289,spriteID = 16,speed=40,scale=80,},
                [6] = {x = -156,y = 356,spriteID = 16,speed=40,scale=80,},
                [7] = {x = -90,y = 356,spriteID = 16,speed=40,scale=65,},
                -- 第二波   a 字形
                [8] = {x = -67,y = 346,spriteID = 27,delay = 4000,speed=70,scale=65,},
                [9] = {x = -113,y = 340,spriteID = 27,delay = 4000,speed=70,scale=60,},
                [10] = {x = -133,y = 288,spriteID = 27,delay = 4000,speed=70,scale=70,},
                [11] = {x = -123,y = 225,spriteID = 27,delay = 4000,speed=70,scale=70,},
                [12] = {x = -163,y = 206,spriteID = 27,delay = 4000,speed=70,scale=75,},
                [13] = {x = -210,y = 233,spriteID = 27,delay = 4000,speed=70,scale=80,},
                [14] = {x = -239,y = 312,spriteID = 27,delay = 4000,speed=70,scale=75,},
                [15] = {x = -217,y = 352,spriteID = 27,delay = 4000,speed=70,scale=80,},
                [16] = {x = -160,y = 346,spriteID = 27,delay = 4000,speed=70,scale=70,},
                --第三波   C 字母
                [17] = {x = -64,y = 210,spriteID = 16,delay = 9000,speed=40,scale=70,},
                [18] = {x = -134,y = 190,spriteID = 16,delay = 9000,speed=40,scale=80,},
                [19] = {x = -194,y = 217,spriteID = 16,delay = 9000,speed=40,scale=80,},
                [20] = {x = -212,y = 282,spriteID = 16,delay = 9000,speed=40,scale=80,},
                [21] = {x = -194,y = 341,spriteID = 16,delay = 9000,speed=40,scale=80,},
                [22] = {x = -136,y = 369,spriteID = 16,delay = 9000,speed=40,scale=80,},
                [23] = {x = -74,y = 349,spriteID = 16,delay = 9000,speed=40,scale=70,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"21",
                 [2] = _t"22",
                 [3] = _t"23",
                 [4] = _t"24",},
    }
CountBirdsWorld[78]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波  三角形
                [1] = {x = -81,y = 292,spriteID = 11,speed=90,scale=80,},
                [2] = {x = -157,y = 227,spriteID = 11,speed=90,scale=80,},
                [3] = {x = -229,y = 166,spriteID = 11,speed=90,scale=80,},
                [4] = {x = -231,y = 242,spriteID = 11,speed=90,scale=80,},
                [5] = {x = -231,y = 317,spriteID = 11,speed=90,scale=80,},
                [6] = {x = -231,y = 386,spriteID = 11,speed=90,scale=80,},
                [7] = {x = -157,y = 340,spriteID = 11,speed=90,scale=80,},
                -- 第二波    燕形
                [8] = {x = -86,y = 291,spriteID = 14,delay = 3500,speed=90,scale=80,},
                [9] = {x = -162,y = 232,spriteID = 14,delay = 3500,speed=90,scale=60,},
                [10] = {x = -230,y = 180,spriteID = 14,delay = 3500,speed=90,scale=50,},
                [11] = {x = -294,y = 129,spriteID = 14,delay = 3500,speed=90,scale=40,},
                [12] = {x = -170,y = 334,spriteID = 14,delay = 3500,speed=90,scale=60,},
                [13] = {x = -241,y = 368,spriteID = 14,delay = 3500,speed=90,scale=50,},
                [14] = {x = -317,y = 406,spriteID = 14,delay = 3500,speed=90,scale=40,},
                [15] = {x = -290,y = 284,spriteID = 14,delay = 3500,speed=90,scale=40,},
                -- 第二波   波浪翻滚
                [16] = {x = -70,y = 265,spriteID = 25,delay = 1000,speed=80,scale=50,},
                [17] = {x = -80,y = 275,spriteID = 25,delay = 1400,speed=80,scale=50,},
                [18] = {x = -80,y = 275,spriteID = 25,delay = 1800,speed=80,scale=50,},
                [19] = {x = -80,y = 275,spriteID = 25,delay = 2200,speed=80,scale=50,},
                [20] = {x = -80,y = 275,spriteID = 25,delay = 2600,speed=80,scale=50,},
                [21] = {x = -80,y = 275,spriteID = 25,delay = 3000,speed=80,scale=50,},
                [22] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 3000,scale=50,}, 
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"20",
                 [2] = _t"21",
                 [3] = _t"22",
                 [4] = _t"23",},
    }
CountBirdsWorld[79]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG4.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波  彩带 动态
                [1] = {x = -125,y = 118,spriteID = 11,speed=80,scale=60,},
                [2] = {x = -245,y = 139,spriteID = 11,speed=75,scale=60,},
                [3] = {x = -369,y = 176,spriteID = 11,speed=70,scale=60,},
                [4] = {x = -285,y = 206,spriteID = 11,speed=65,scale=60,},
                [5] = {x = -179,y = 232,spriteID = 11,speed=60,scale=60,},
                [6] = {x = -98,y = 264,spriteID = 11,speed=50,scale=60,},
                [7] = {x = -56,y = 318,spriteID = 11,speed=70,scale=60,},
                [8] = {x = -93,y = 385,spriteID = 11,speed=80,scale=60,},
                --第三波   Z  字母
                [9] = {x = -46,y = 215,spriteID = 11,delay = 8000,speed=60,scale=50,},
                [10] = {x = -109,y = 216,spriteID = 11,delay = 8000,speed=60,scale=50,},
                [11] = {x = -176,y = 214,spriteID = 11,delay = 8000,speed=60,scale=50,},
                [12] = {x = -115,y = 278,spriteID = 11,delay = 8000,speed=70,scale=50,},
                [13] = {x = -51,y = 338,spriteID = 11,delay = 8000,speed=80,scale=50,},
                [14] = {x = -117,y = 341,spriteID = 11,delay = 8000,speed=80,scale=50,},
                [15] = {x = -187,y = 341,spriteID = 11,delay = 8000,speed=80,scale=50,},
                --  第四波   A  字母
                [16] = {x = -89,y = 141,spriteID = 15,delay = 12000,speed=70,scale=50,},
                [17] = {x = -65,y = 221,spriteID = 15,delay = 12000,speed=70,scale=50,},
                [18] = {x = -121,y = 217,spriteID = 15,delay = 12000,speed=70,scale=50,},
                [19] = {x = -50,y = 273,spriteID = 15,delay = 12000,speed=70,scale=50,},
                [20] = {x = -145,y = 272,spriteID = 15,delay = 12000,speed=70,scale=50,},
                [21] = {x = -95,y = 221,spriteID = 15,delay = 12000,speed=70,scale=50,},
                [22] = {x = 900,y = 700,spriteID = 4,canKillCount=2,scale=70,delay = 4000,},
                [23] = {x = 900,y = 700,spriteID = 4,canKillCount=2,scale=50,delay = 11000,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"15",
                 [2] = _t"16",
                 [3] = _t"17",
                 [4] = _t"18",},
    }
CountBirdsWorld[80]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波  曲线  动态
                [1] = {x = -29,y = 149,spriteID = 11,speed=60,scale=60,},
                [2] = {x = -109,y = 183,spriteID = 11,speed=65,scale=60,},
                [3] = {x = -162,y = 248,spriteID = 11,speed=75,scale=60,},
                [4] = {x = -183,y = 323,spriteID = 11,speed=85,scale=60,},
                [5] = {x = -173,y = 365,spriteID = 11,speed=75,scale=60,},
                [6] = {x = -121,y = 403,spriteID = 11,speed=68,scale=60,},
                [7] = {x = -76,y = 461,spriteID = 11,speed=65,scale=60,},
                --第三波   柺
                [8] = {x = -90,y = 143,spriteID = 13,delay = 4000,speed=90,scale=80,},
                [9] = {x = -90,y = 199,spriteID = 13,delay = 4000,speed=90,scale=80,},
                [10] = {x = -90,y = 259,spriteID = 13,delay = 4000,speed=90,scale=80,},
                [11] = {x = -164,y = 259,spriteID = 13,delay = 4000,speed=90,scale=80,},
                [12] = {x = -239,y = 259,spriteID = 13,delay = 4000,speed=90,scale=80,},
                -- 第二波   右往左  波浪
                [13] = {x = 970,y = 265,spriteID = 28,delay = 3000,speed=100,scale=50,},
                [14] = {x = 980,y = 275,spriteID = 28,delay = 3400,speed=95,scale=50,},
                [15] = {x = 980,y = 275,spriteID = 28,delay = 3800,speed=90,scale=50,},
                [16] = {x = 980,y = 275,spriteID = 28,delay = 4200,speed=85,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"16",
                 [2] = _t"17",
                 [3] = _t"18",
                 [4] = _t"19",},
    }
CountBirdsWorld[81]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波  曲线  动态
                [1] = {x = -10,y = 400,spriteID = 15,speed=90,scale=60,delay = 200,},
                [2] = {x = -10,y = 400,spriteID = 15,speed=90,scale=60,delay = 700,},
                [3] = {x = -10,y = 400,spriteID = 15,speed=90,scale=60,delay = 1200,},
                -- 第二波   弧形阵
                [4] = {x = -218,y = 182,spriteID = 14,delay = 11000,speed=80,scale=80,},
                [5] = {x = -135,y = 214,spriteID = 14,delay = 11000,speed=80,scale=70,},
                [6] = {x = -83,y = 251,spriteID = 14,delay = 11000,speed=80,scale=70,},
                [7] = {x = -63,y = 290,spriteID = 14,delay = 11000,speed=80,scale=60,},
                [8] = {x = -86,y = 327,spriteID = 14,delay = 11000,speed=80,scale=70,},
                [9] = {x = -133,y = 383,spriteID = 14,delay = 11000,speed=80,scale=70,},
                [10] = {x = -203,y = 447,spriteID = 14,delay = 11000,speed=80,scale=80,},
                [11] = {x = -315,y = 534,spriteID = 14,delay = 11000,speed=80,scale=90,},
                -- 第三波     右往左 波浪翻滚
                [12] = {x = 980,y = 375,spriteID = 28,delay = 4200,speed=95,scale=50,},
                [13] = {x = 980,y = 375,spriteID = 28,delay = 4600,speed=95,scale=50,},
                [14] = {x = 980,y = 375,spriteID = 28,delay = 5000,speed=95,scale=50,},
                [15] = {x = 980,y = 375,spriteID = 28,delay = 5400,speed=95,scale=50,},
                [16] = {x = 980,y = 375,spriteID = 28,delay = 5800,speed=95,scale=50,},
                -- 第四波   跳跃
                [17] = {x = -60,y = 275,spriteID = 27,delay = 0,speed=80,scale=50,},
                [18] = {x = -60,y = 275,spriteID = 27,delay = 500,speed=80,scale=50,},
                [19] = {x = -60,y = 275,spriteID = 27,delay = 800,speed=80,scale=50,},
                [20] = {x = -60,y = 275,spriteID = 27,delay = 1100,speed=80,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"20",
                 [2] = _t"21",
                 [3] = _t"22",
                 [4] = _t"23",},
    }
CountBirdsWorld[82]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG5.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波  曲线  动态
                [1] = {x = -206,y = 92,spriteID = 11,speed=70,scale=60,},
                [2] = {x = -139,y = 222,spriteID = 11,speed=70,scale=60,},
                [3] = {x = -19,y = 297,spriteID = 11,speed=70,scale=60,},
                [4] = {x = -134,y = 372,spriteID = 11,speed=70,scale=60,},
                [5] = {x = -207,y = 503,spriteID = 11,speed=70,scale=60,},
                [6] = {x = -287,y = 370,spriteID = 11,speed=70,scale=60,},
                [7] = {x = -395,y = 298,spriteID = 11,speed=70,scale=60,},
                [8] = {x = -279,y = 220,spriteID = 11,speed=70,scale=60,},
                [9] = {x = -207,y = 215,spriteID = 27,speed=70,scale=60,delay = 2000,},
                [10] = {x = -189,y = 278,spriteID = 27,speed=70,scale=60,delay = 2000,},
                [11] = {x = -136,y = 299,spriteID = 27,speed=70,scale=60,delay = 2000,},
                -- 第二波   弧形阵
                [12] = {x = -218,y = 182,spriteID = 14,delay = 8000,speed=80,scale=80,},
                [13] = {x = -135,y = 214,spriteID = 14,delay = 8000,speed=80,scale=70,},
                [14] = {x = -83,y = 251,spriteID = 14,delay = 8000,speed=80,scale=70,},
                [15] = {x = -63,y = 290,spriteID = 14,delay = 8000,speed=80,scale=60,},
                [16] = {x = -86,y = 327,spriteID = 14,delay = 8000,speed=80,scale=70,},
                [17] = {x = -133,y = 383,spriteID = 14,delay = 8000,speed=80,scale=70,},
                [18] = {x = -203,y = 447,spriteID = 14,delay = 8000,speed=80,scale=80,},
                [19] = {x = -315,y = 534,spriteID = 14,delay = 8000,speed=80,scale=90,},
                --第三波   反  波浪翻滚
                [20] = {x = -60,y = 265,spriteID = 25,delay = 2000,speed=80,scale=50,},
                [21] = {x = -60,y = 275,spriteID = 25,delay = 2400,speed=80,scale=50,},
                [22] = {x = -60,y = 275,spriteID = 25,delay = 2800,speed=80,scale=50,},
                [23] = {x = -60,y = 275,spriteID = 25,delay = 3200,speed=80,scale=50,},
                [24] = {x = -60,y = 275,spriteID = 25,delay = 3600,speed=80,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"21",
                 [2] = _t"22",
                 [3] = _t"23",
                 [4] = _t"24",},
    }
CountBirdsWorld[83]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第二波      V形
                [1] = {x = -108,y = 232,spriteID = 13,speed=90,scale=60,},
                [2] = {x = -127,y = 278,spriteID = 13,speed=90,scale=60,},
                [3] = {x = -153,y = 337,spriteID = 13,speed=90,scale=70,},
                [4] = {x = -177,y = 297,spriteID = 13,speed=90,scale=60,},
                [5] = {x = -197,y = 228,spriteID = 13,speed=90,scale=60,},
                --第三波   郁闷表情
                [6] = {x = -149,y = 200,spriteID = 11,delay = 10000,speed=80,scale=70,},
                [7] = {x = -275,y = 200,spriteID = 11,delay = 10000,speed=80,scale=70,},
                [8] = {x = -160,y = 352,spriteID = 11,delay = 10000,speed=80,scale=70,},
                [9] = {x = -203,y = 324,spriteID = 11,delay = 10000,speed=80,scale=70,},
                [10] = {x = -243,y = 322,spriteID = 11,delay = 10000,speed=80,scale=70,},
                [11] = {x = -275,y = 345,spriteID = 11,delay = 10000,speed=80,scale=70,},
                [12] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 14500,scale=50,}, 
                --第三波   反  波浪翻滚
                [13] = {x = -60,y = 265,spriteID = 25,delay = 2000,speed=80,scale=50,},
                [14] = {x = -60,y = 275,spriteID = 25,delay = 2400,speed=80,scale=50,},
                [15] = {x = -60,y = 275,spriteID = 25,delay = 2800,speed=80,scale=50,},
                [16] = {x = -60,y = 275,spriteID = 25,delay = 3200,speed=80,scale=50,},
                [17] = {x = -60,y = 275,spriteID = 25,delay = 3600,speed=80,scale=50,},
                -- 第四波   跳跃
                [18] = {x = -60,y = 275,spriteID = 27,delay = 0,speed=80,scale=50,},
                [19] = {x = -60,y = 275,spriteID = 27,delay = 500,speed=80,scale=50,},
                [20] = {x = -60,y = 275,spriteID = 27,delay = 800,speed=80,scale=50,},
                [21] = {x = -60,y = 275,spriteID = 27,delay = 1100,speed=80,scale=50,},
                [22] = {x = -60,y = 275,spriteID = 27,delay = 1400,speed=80,scale=50,},
                [23] = {x = -60,y = 275,spriteID = 27,delay = 1700,speed=80,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"18",
                 [2] = _t"19",
                 [3] = _t"20",
                 [4] = _t"21",},
                 
    }
CountBirdsWorld[84]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG3.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波   三角旋
                [1] = {x = -100,y = 327,spriteID = 11,speed=70,scale=50,},
                [2] = {x = -94,y = 256,spriteID = 11,speed=70,scale=50,},
                [3] = {x = -141,y = 187,spriteID = 11,speed=70,scale=50,},
                [4] = {x = -202,y = 422,spriteID = 11,speed=70,scale=50,},
                [5] = {x = -142,y = 462,spriteID = 11,speed=70,scale=50,},
                [6] = {x = -53,y = 442,spriteID = 11,speed=70,scale=50,},
                [7] = {x = -243,y = 282,spriteID = 11,speed=70,scale=50,},
                [8] = {x = -296,y = 318,spriteID = 11,speed=70,scale=50,},
                [9] = {x = -322,y = 411,spriteID = 11,speed=70,scale=50,},
                [10] = {x = 900,y = 700,spriteID = 4,canKillCount=2,delay = 3500,scale=50,}, 
                -- 第二波   波浪翻滚
                [11] = {x = -70,y = 265,spriteID = 22,delay = 2000,speed=80,scale=50,},
                [12] = {x = -80,y = 275,spriteID = 22,delay = 2400,speed=80,scale=50,},
                [13] = {x = -80,y = 275,spriteID = 21,delay = 2800,speed=80,scale=50,},
                [14] = {x = -80,y = 275,spriteID = 21,delay = 3200,speed=80,scale=50,},
                [15] = {x = -80,y = 275,spriteID = 21,delay = 3600,speed=80,scale=50,},
                --第三波   反  波浪翻滚
                [16] = {x = -60,y = 265,spriteID = 25,delay = 2000,speed=80,scale=50,},
                [17] = {x = -60,y = 275,spriteID = 25,delay = 2400,speed=80,scale=50,},
                [18] = {x = -60,y = 275,spriteID = 25,delay = 2800,speed=80,scale=50,},
                [19] = {x = -60,y = 275,spriteID = 25,delay = 3200,speed=80,scale=50,},
                [20] = {x = -60,y = 275,spriteID = 25,delay = 3600,speed=80,scale=50,},
                [21] = {x = -60,y = 275,spriteID = 13,delay = 8000,speed=100,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"19",
                 [2] = _t"20",
                 [3] = _t"21",
                 [4] = _t"22",},
    }
CountBirdsWorld[85]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG3.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 --   第一波   浪尖
                [1] = {x = -37,y = 281,spriteID = 11,speed=70,scale=40,},
                [2] = {x = -94,y = 251,spriteID = 11,speed=70,scale=50,},
                [3] = {x = -171,y = 228,spriteID = 11,speed=70,scale=60,},
                [4] = {x = -293,y = 223,spriteID = 11,speed=70,scale=70,},
                [5] = {x = -124,y = 291,spriteID = 11,speed=70,scale=50,},
                  --  第二    右到左   反浪尖
                [6] = {x = 929,y = 283,spriteID = 17,speed=70,scale=40,},
                [7] = {x = 986,y = 253,spriteID = 17,speed=70,scale=50,},
                [8] = {x = 1062,y = 229,spriteID = 17,speed=70,scale=60,},
                [9] = {x = 1186,y = 225,spriteID = 17,speed=70,scale=70,},
                [10] = {x = 1016,y = 293,spriteID = 17,speed=70,scale=50,},
                [11] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 4000,scale=50,}, 
                --    第三波   燕形动态
                [12] = {x = -186,y = 375,spriteID = 16,delay = 7000,speed=110,scale=60,},
                [13] = {x = -142,y = 329,spriteID = 16,delay = 7000,speed=98,scale=60,},
                [14] = {x = -160,y = 417,spriteID = 16,delay = 7000,speed=98,scale=60,},
                [15] = {x = -75,y = 286,spriteID = 16,delay = 7000,speed=88,scale=60,},
                [16] = {x = -95,y = 449,spriteID = 16,delay = 7000,speed=88,scale=60,},
                [17] = {x = -13,y = 240,spriteID = 16,delay = 7000,speed=75,scale=60,},
                [18] = {x = -13,y = 480,spriteID = 16,delay = 7000,speed=75,scale=60,},
                --  第五波     跳跃 X
                [19] = {x = -18,y = 167,spriteID = 27,speed=90,scale=50,},
                [20] = {x = -63,y = 240,spriteID = 27,speed=90,scale=50,},
                [21] = {x = -107,y = 314,spriteID = 27,speed=90,scale=50,},
                [22] = {x = -26,y = 311,spriteID = 27,speed=90,scale=50,},
                [23] = {x = -93,y = 176,spriteID = 27,speed=90,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"20",
                 [2] = _t"21",
                 [3] = _t"22",
                 [4] = _t"23",},
    }
CountBirdsWorld[86]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG1.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波   斜排3只
                [1] = {x = -102,y = 164,spriteID = 12,speed=70,scale=50,},
                [2] = {x = -68,y = 227,spriteID = 12,speed=70,scale=50,},
                [3] = {x = -30,y = 292,spriteID = 12,speed=70,scale=50,},
                  -- 第二波    右到左 斜排3只
                [4] = {x = 1000,y = 137,spriteID = 17,speed=70,scale=50,},
                [5] = {x = 968,y = 205,spriteID = 17,speed=70,scale=50,},
                [6] = {x = 933,y = 274,spriteID = 17,speed=70,scale=50,},
                  --  第三    半圆
                [7] = {x = -85,y = 182,spriteID = 11,delay = 4000,speed=70,scale=50,},
                [8] = {x = -134,y = 217,spriteID = 11,delay = 4000,speed=70,scale=50,},
                [9] = {x = -148,y = 276,spriteID = 11,delay = 4000,speed=70,scale=50,},
                [10] = {x = -135,y = 341,spriteID = 11,delay = 4000,speed=70,scale=50,},
                [11] = {x = -85,y = 379,spriteID = 11,delay = 4000,speed=70,scale=50,},
                   --  第四波    波浪
                [12] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 7000,scale=50,}, 
                [13] = {x = -70,y = 265,spriteID = 22,delay = 8000,speed=130,scale=80,},
                [14] = {x = -80,y = 275,spriteID = 21,delay = 8400,speed=130,scale=50,},
                [15] = {x = -80,y = 275,spriteID = 21,delay = 8800,speed=130,scale=50,},
                [16] = {x = -80,y = 275,spriteID = 21,delay = 9200,speed=130,scale=50,},
                [17] = {x = -80,y = 275,spriteID = 21,delay = 9600,speed=130,scale=50,},
                [18] = {x = -80,y = 275,spriteID = 27,delay = 4600,speed=130,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"14",
                 [2] = _t"15",
                 [3] = _t"16",
                 [4] = _t"17",},
    }
CountBirdsWorld[87]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                  -- 第一波    右到左 斜排3只
                [1] = {x = 1000,y = 137,spriteID = 17,speed=70,scale=50,},
                [2] = {x = 968,y = 205,spriteID = 17,speed=70,scale=50,},
                [3] = {x = 933,y = 274,spriteID = 17,speed=70,scale=50,},
                  --  第二    半圆
                [4] = {x = -23,y = 179,spriteID = 13,speed=100,scale=50,},
                [5] = {x = -55,y = 249,spriteID = 13,speed=90,scale=50,},
                [6] = {x = -85,y = 315,spriteID = 13,speed=80,scale=50,},
                [7] = {x = -76,y = 193,spriteID = 13,speed=70,scale=50,},
                [8] = {x = -107,y = 259,spriteID = 13,speed=80,scale=50,},
                [9] = {x = -139,y = 333,spriteID = 13,speed=90,scale=50,},
                -- 第三波     交叉  动态
                [10] = {x = -54,y = 165,spriteID = 11,delay = 3000,speed=70,scale=60,},
                [11] = {x = -136,y = 206,spriteID = 11,delay = 3000,speed=70,scale=60,},
                [12] = {x = -190,y = 265,spriteID = 11,delay = 3000,speed=70,scale=60,},
                [13] = {x = -238,y = 339,spriteID = 11,delay = 3000,speed=70,scale=60,},
                [14] = {x = -272,y = 424,spriteID = 11,delay = 3000,speed=70,scale=60,},
                [15] = {x = 900,y = 700,spriteID = 4,canKillCount=2,delay = 7000,scale=50,}, 
                --  第四波    右到左  浪尖
                [16] = {x = 929,y = 283,spriteID = 17,speed=105,scale=60,delay = 10000,},
                [17] = {x = 986,y = 253,spriteID = 17,speed=95,scale=60,delay = 10000,},
                [18] = {x = 1062,y = 229,spriteID = 17,speed=90,scale=60,delay = 10000,},
                -- 第五波   波浪翻滚
                [19] = {x = -70,y = 265,spriteID = 22,delay = 6000,speed=80,scale=50,},
                [20] = {x = -70,y = 275,spriteID = 21,delay = 6500,speed=80,scale=50,},
                [21] = {x = -70,y = 275,spriteID = 21,delay = 7000,speed=80,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"16",
                 [2] = _t"17",
                 [3] = _t"18",
                 [4] = _t"19",},
    }
CountBirdsWorld[88]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG1.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                  -- 第一波    竖5只
                [1] = {x = -25,y = 111,spriteID = 11,speed=60,scale=50,delay = 7000,},
                [2] = {x = -25,y = 206,spriteID = 11,speed=60,scale=50,delay = 7000,},
                [3] = {x = -25,y = 291,spriteID = 11,speed=60,scale=50,delay = 7000,},
                [4] = {x = -25,y = 392,spriteID = 11,speed=60,scale=50,delay = 7000,},
                [5] = {x = -25,y = 483,spriteID = 11,speed=60,scale=50,delay = 7000,},
                 --  第二波     燕形阵
                [6] = {x = -160,y = 225,spriteID = 27,scale=50,delay = 2000,},
                [7] = {x = -160,y = 325,spriteID = 27,scale=50,delay = 2000,},
                [8] = {x = -240,y = 175,spriteID = 27,scale=50,delay = 2000,},
                [9] = {x = -240,y = 375,spriteID = 27,scale=50,delay = 2000,},
                [10] = {x = -80,y = 275,spriteID = 27,scale=50,delay = 2000,},
                -- 第三波     波浪
                [11] = {x = -70,y = 265,spriteID = 21,delay = 8000,speed=120,scale=80,},
                [12] = {x = -80,y = 275,spriteID = 21,delay = 8400,speed=120,scale=50,},
                [13] = {x = -80,y = 275,spriteID = 21,delay = 8800,speed=120,scale=50,},
                [14] = {x = -80,y = 275,spriteID = 21,delay = 9200,speed=120,scale=50,},
                [15] = {x = -80,y = 275,spriteID = 21,delay = 9600,speed=120,scale=50,},
                [16] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 2000,scale=50,}, 
                 -- 第四波    V型
                [17] = {x = -108,y = 232,spriteID = 11,speed=90,scale=70,},
                [18] = {x = -127,y = 278,spriteID = 11,speed=90,scale=70,},
                [19] = {x = -153,y = 337,spriteID = 11,speed=90,scale=70,},
                [20] = {x = -177,y = 297,spriteID = 11,speed=90,scale=70,},
                [21] = {x = -197,y = 228,spriteID = 11,speed=90,scale=70,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"18",
                 [2] = _t"19",
                 [3] = _t"20",
                 [4] = _t"21",},
    }
CountBirdsWorld[89]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG5.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                  -- 第一波    竖5只
                [1] = {x = -95,y = 80,spriteID = 15,speed=70,scale=50,},
                [2] = {x = -95,y = 130,spriteID = 15,speed=66,scale=50,},
                [3] = {x = -95,y = 180,spriteID = 15,speed=64,scale=50,},
                [4] = {x = -95,y = 230,spriteID = 15,speed=62,scale=50,},
                [5] = {x = -95,y = 280,spriteID = 15,speed=60,scale=50,},
                [6] = {x = -95,y = 330,spriteID = 15,scale=50,speed=62,},
                [7] = {x = -95,y = 380,spriteID = 15,scale=50,speed=64,},
                [8] = {x = -95,y = 430,spriteID = 15,scale=50,speed=66,},
                [9] = {x = -95,y = 480,spriteID = 15,scale=50,speed=70,},
                [10] = {x = 900,y = 0,spriteID = 9,canKillCount=1,delay = 4000,scale=50,}, 
                [11] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 1800,scale=50,}, 
                 -- 第二波    V型
                [12] = {x = -108,y = 332,spriteID = 27,delay = 9000,speed=70,scale=60,},
                [13] = {x = -127,y = 378,spriteID = 27,delay = 9000,speed=70,scale=60,},
                [14] = {x = -153,y = 437,spriteID = 27,delay = 9000,speed=70,scale=60,},
                [15] = {x = -177,y = 397,spriteID = 27,delay = 9000,speed=70,scale=60,},
                [16] = {x = -197,y = 328,spriteID = 27,delay = 9000,speed=70,scale=60,},
                  -- 第三波    弧形
                [17] = {x = -218,y = 182,spriteID = 14,delay = 6000,speed=70,scale=80,},
                [18] = {x = -135,y = 214,spriteID = 14,delay = 6000,speed=70,scale=70,},
                [19] = {x = -83,y = 251,spriteID = 14,delay = 6000,speed=70,scale=70,},
                [20] = {x = -63,y = 290,spriteID = 11,delay = 6000,speed=70,scale=60,},
                [21] = {x = -86,y = 327,spriteID = 11,delay = 6000,speed=70,scale=70,},
                [22] = {x = -133,y = 383,spriteID = 11,delay = 6000,speed=70,scale=70,},
                [23] = {x = -203,y = 447,spriteID = 11,delay = 6000,speed=70,scale=80,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"19",
                 [2] = _t"20",
                 [3] = _t"21",
                 [4] = _t"22",},
    }
CountBirdsWorld[90]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG3.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波     两列
                [1] = {x = -23,y = 179,spriteID = 16,speed=50,scale=50,},
                [2] = {x = -55,y = 249,spriteID = 16,speed=50,scale=50,},
                [3] = {x = -85,y = 315,spriteID = 16,speed=50,scale=50,},
                [4] = {x = -76,y = 193,spriteID = 16,speed=70,scale=50,},
                [5] = {x = -107,y = 259,spriteID = 16,speed=70,scale=50,},
                [6] = {x = -139,y = 323,spriteID = 16,speed=70,scale=50,},
                -- 第二波      V型
                [7] = {x = -108,y = 232,spriteID = 27,delay = 11000,speed=70,scale=60,},
                [8] = {x = -127,y = 278,spriteID = 27,delay = 11000,speed=70,scale=60,},
                [9] = {x = -153,y = 337,spriteID = 27,delay = 11000,speed=70,scale=60,},
                [10] = {x = -177,y = 297,spriteID = 27,delay = 11000,speed=70,scale=60,},
                [11] = {x = -197,y = 228,spriteID = 27,delay = 11000,speed=70,scale=60,},
                -- 第三波      人形
                [12] = {x = -167,y = 238,spriteID = 11,delay = 6000,speed=90,scale=70,},
                [13] = {x = -263,y = 177,spriteID = 11,delay = 6000,speed=90,scale=70,},
                [14] = {x = -282,y = 268,spriteID = 11,delay = 6000,speed=90,scale=70,},
                [15] = {x = -316,y = 114,spriteID = 11,delay = 6000,speed=90,scale=70,},
                [16] = {x = -339,y = 318,spriteID = 11,delay = 6000,speed=90,scale=70,},
                [17] = {x = -361,y = 57,spriteID = 11,delay = 6000,speed=90,scale=70,},
                [18] = {x = 900,y = 0,spriteID = 9,canKillCount=1,delay = 5000,scale=70,}, 
                -- 第二波   波浪翻滚
                [19] = {x = -70,y = 265,spriteID = 22,delay = 6000,speed=80,scale=50,},
                [20] = {x = -70,y = 275,spriteID = 21,delay = 6500,speed=80,scale=50,},
                [21] = {x = -70,y = 275,spriteID = 21,delay = 7000,speed=80,scale=50,},
                [22] = {x = -70,y = 275,spriteID = 21,delay = 7500,speed=80,scale=50,},
                [23] = {x = -70,y = 275,spriteID = 21,delay = 8000,speed=80,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"22",
                 [2] = _t"23",
                 [3] = _t"24",
                 [4] = _t"25",},
    }
CountBirdsWorld[91]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG1.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波     燕形
                [1] = {x = -230,y = 180,spriteID = 2,speed=80,scale=50,},
                [2] = {x = -294,y = 129,spriteID = 2,speed=80,scale=40,},
                [3] = {x = -170,y = 334,spriteID = 2,speed=80,scale=60,},
                [4] = {x = -241,y = 368,spriteID = 2,speed=80,scale=50,},
                [5] = {x = -317,y = 406,spriteID = 2,speed=80,scale=40,},
                [6] = {x = -290,y = 284,spriteID = 2,speed=80,scale=40,},
                -- 第二波   波浪翻滚
                [7] = {x = -70,y = 265,spriteID = 22,delay = 2000,speed=80,scale=50,},
                [8] = {x = -80,y = 275,spriteID = 22,delay = 2400,speed=80,scale=50,},
                [9] = {x = -80,y = 275,spriteID = 21,delay = 2800,speed=80,scale=50,},
                [10] = {x = -80,y = 275,spriteID = 21,delay = 3200,speed=80,scale=50,},
                [11] = {x = -80,y = 275,spriteID = 21,delay = 3600,speed=80,scale=50,},
                --第三波   反  波浪翻滚
                [12] = {x = -60,y = 265,spriteID = 25,delay = 2000,speed=80,scale=50,},
                [13] = {x = -60,y = 275,spriteID = 25,delay = 2400,speed=80,scale=50,},
                [14] = {x = -60,y = 275,spriteID = 25,delay = 2800,speed=80,scale=50,},
                [15] = {x = -60,y = 275,spriteID = 25,delay = 3200,speed=80,scale=50,},
                [16] = {x = -60,y = 275,spriteID = 25,delay = 3600,speed=80,scale=50,},
                --  第四波    右到左  浪尖
                [17] = {x = 929,y = 283,spriteID = 17,speed=70,scale=40,delay = 5600,},
                [18] = {x = 986,y = 253,spriteID = 17,speed=70,scale=50,delay = 5600,},
                [19] = {x = 1062,y = 229,spriteID = 17,speed=70,scale=60,delay = 5600,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"20",
                 [2] = _t"21",
                 [3] = _t"22",
                 [4] = _t"23",},
    }
CountBirdsWorld[92]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波     斜排
                [1] = {x = -10,y = 320,spriteID = 11,speed=70,scale=60,},
                [2] = {x = -60,y = 320,spriteID = 11,speed=70,scale=60,},
                [3] = {x = -110,y = 320,spriteID = 11,speed=70,scale=60,},
                [4] = {x = -170,y = 320,spriteID = 11,speed=70,scale=60,},
                [5] = {x = -220,y = 320,spriteID = 11,speed=70,scale=60,},
                [6] = {x = -270,y = 320,spriteID = 11,speed=70,scale=60,},
                [7] = {x = -320,y = 320,spriteID = 11,speed=70,scale=60,},
                [8] = {x = -370,y = 320,spriteID = 11,speed=70,scale=60,},

                [9] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 5800,scale=70,},
                [10] = {x = 900,y = 0,spriteID = 9,canKillCount=1,delay = 5200,scale=70,}, 
                [11] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 12400,scale=70,}, 
                [12] = {x = 900,y = 0,spriteID = 9,canKillCount=1,delay = 13000,scale=70,}, 
                -- 第二波   波浪翻滚
                [13] = {x = -70,y = 265,spriteID = 22,delay = 6000,speed=80,scale=50,},
                [14] = {x = -70,y = 275,spriteID = 21,delay = 6500,speed=80,scale=50,},
                [15] = {x = -70,y = 275,spriteID = 22,delay = 7000,speed=80,scale=50,},
                [16] = {x = -70,y = 275,spriteID = 21,delay = 7500,speed=80,scale=50,},
                [17] = {x = -70,y = 275,spriteID = 21,delay = 8000,speed=80,scale=50,},
                [18] = {x = -70,y = 275,spriteID = 21,delay = 8500,speed=80,scale=50,},
                [19] = {x = -70,y = 275,spriteID = 21,delay = 9000,speed=80,scale=50,},
                -- 第三波   反  波浪翻滚
                [20] = {x = -70,y = 265,spriteID = 25,delay = 6000,speed=80,scale=50,},
                [21] = {x = -70,y = 275,spriteID = 25,delay = 6500,speed=80,scale=50,},
                [22] = {x = -70,y = 275,spriteID = 25,delay = 7000,speed=80,scale=50,},
                [23] = {x = -70,y = 275,spriteID = 25,delay = 7500,speed=80,scale=50,},
                [24] = {x = -70,y = 275,spriteID = 25,delay = 8000,speed=80,scale=50,},
                [25] = {x = -70,y = 275,spriteID = 25,delay = 8500,speed=80,scale=50,},
                [26] = {x = -70,y = 275,spriteID = 25,delay = 9000,speed=80,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"17",
                 [2] = _t"18",
                 [3] = _t"19",
                 [4] = _t"20",},
    }
CountBirdsWorld[93]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG3.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波  反弓形 动态
                [1] = {x = -186,y = 375,spriteID = 11,delay = 5000,speed=110,scale=60,},
                [2] = {x = -142,y = 329,spriteID = 11,delay = 5000,speed=98,scale=60,},
                [3] = {x = -160,y = 417,spriteID = 11,delay = 5000,speed=98,scale=60,},
                [4] = {x = -75,y = 286,spriteID = 11,delay = 5000,speed=88,scale=60,},
                [5] = {x = -95,y = 449,spriteID = 11,delay = 5000,speed=88,scale=60,},
                [6] = {x = -13,y = 240,spriteID = 11,delay = 5000,speed=80,scale=60,},
                [7] = {x = -13,y = 480,spriteID = 11,delay = 5000,speed=80,scale=60,},
                -- 第二波   波浪翻滚
                [8] = {x = -70,y = 265,spriteID = 22,delay = 1000,speed=80,scale=50,},
                [9] = {x = -80,y = 275,spriteID = 22,delay = 1400,speed=80,scale=50,},
                [10] = {x = -80,y = 275,spriteID = 25,delay = 1800,speed=80,scale=50,},
                [11] = {x = -80,y = 275,spriteID = 25,delay = 2200,speed=80,scale=50,},
                [12] = {x = -80,y = 275,spriteID = 25,delay = 2600,speed=80,scale=50,},
                --第三波   右到左   反  波浪翻滚
                [13] = {x = 960,y = 265,spriteID = 28,delay = 1000,speed=80,scale=50,},
                [14] = {x = 960,y = 275,spriteID = 28,delay = 1400,speed=80,scale=50,},
                [15] = {x = 960,y = 275,spriteID = 28,delay = 1800,speed=80,scale=50,},
                [16] = {x = 960,y = 275,spriteID = 28,delay = 2200,speed=80,scale=50,},
                [17] = {x = 960,y = 275,spriteID = 28,delay = 2600,speed=80,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"17",
                 [2] = _t"18",
                 [3] = _t"19",
                 [4] = _t"20",},
    }
CountBirdsWorld[94]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG3.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波  右往左  波浪
                [1] = {x = 960,y = 265,spriteID = 28,delay = 1000,speed=80,scale=50,},
                [2] = {x = 960,y = 275,spriteID = 28,delay = 1400,speed=80,scale=50,},
                [3] = {x = 960,y = 275,spriteID = 28,delay = 1800,speed=80,scale=50,},
                [4] = {x = 960,y = 275,spriteID = 28,delay = 2200,speed=80,scale=50,},
                [5] = {x = 960,y = 275,spriteID = 28,delay = 2600,speed=80,scale=50,},
                [6] = {x = 960,y = 275,spriteID = 28,delay = 3000,speed=80,scale=50,},
                [7] = {x = 960,y = 275,spriteID = 28,delay = 3400,speed=80,scale=50,},
                [8] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 5800,scale=50,},
                -- 第二波   斜排
                [9] = {x = -293,y = 167,spriteID = 13,speed=90,scale=70,},
                [10] = {x = -245,y = 218,spriteID = 13,speed=90,scale=70,},
                [11] = {x = -198,y = 272,spriteID = 13,speed=90,scale=70,},
                [12] = {x = -146,y = 330,spriteID = 13,speed=90,scale=70,},
                [13] = {x = -93,y = 388,spriteID = 13,speed=90,scale=70,},
                --第三波   人字形
                [14] = {x = 953,y = 237,spriteID = 17,delay = 7000,speed=90,scale=70,},
                [15] = {x = 1067,y = 238,spriteID = 17,delay = 7000,speed=90,scale=70,},
                [16] = {x = 1163,y = 177,spriteID = 17,delay = 7000,speed=90,scale=70,},
                [17] = {x = 1182,y = 268,spriteID = 17,delay = 7000,speed=90,scale=70,},
                [18] = {x = 1216,y = 114,spriteID = 17,delay = 7000,speed=90,scale=70,},
                [19] = {x = 1239,y = 318,spriteID = 17,delay = 7000,speed=90,scale=70,},
                [20] = {x = 1261,y = 57,spriteID = 17,delay = 7000,speed=90,scale=70,},
                [21] = {x = 1293,y = 374,spriteID = 17,delay = 7000,speed=90,scale=70,},
                [22] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 3000,scale=50,}, 
                [23] = {x = -132,y = 356,spriteID = 27,speed=70,scale=60,delay = 3000,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"17",
                 [2] = _t"18",
                 [3] = _t"19",
                 [4] = _t"20",},
    }
CountBirdsWorld[95]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG1.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                 -- 第一波  三角形
                [1] = {x = -81,y = 292,spriteID = 15,speed=90,scale=80,},
                [2] = {x = -157,y = 227,spriteID = 15,speed=90,scale=80,},
                [3] = {x = -229,y = 166,spriteID = 15,speed=90,scale=80,},
                [4] = {x = -231,y = 242,spriteID = 15,speed=90,scale=80,},
                [5] = {x = -231,y = 317,spriteID = 15,speed=90,scale=80,},
                [6] = {x = -231,y = 386,spriteID = 15,speed=90,scale=80,},
                [7] = {x = -157,y = 340,spriteID = 15,speed=90,scale=80,},
                -- 第二波    燕形
                [8] = {x = -86,y = 291,spriteID = 14,delay = 3500,speed=90,scale=80,},
                [9] = {x = -162,y = 232,spriteID = 14,delay = 3500,speed=90,scale=60,},
                [10] = {x = -230,y = 180,spriteID = 14,delay = 3500,speed=90,scale=50,},
                [11] = {x = -294,y = 129,spriteID = 14,delay = 3500,speed=90,scale=40,},
                [12] = {x = -170,y = 334,spriteID = 14,delay = 3500,speed=90,scale=60,},
                [13] = {x = -241,y = 368,spriteID = 14,delay = 3500,speed=90,scale=50,},
                [14] = {x = -317,y = 406,spriteID = 14,delay = 3500,speed=90,scale=40,},
                [15] = {x = -290,y = 284,spriteID = 14,delay = 3500,speed=90,scale=40,},
                -- 第二波   波浪翻滚
                [16] = {x = -70,y = 265,spriteID = 25,delay = 1000,speed=80,scale=50,},
                [17] = {x = -80,y = 275,spriteID = 25,delay = 1400,speed=80,scale=50,},
                [18] = {x = -80,y = 275,spriteID = 25,delay = 1800,speed=80,scale=50,},
                [19] = {x = -80,y = 275,spriteID = 25,delay = 2200,speed=80,scale=50,},
                [20] = {x = -80,y = 275,spriteID = 25,delay = 2600,speed=80,scale=50,},
                [21] = {x = -80,y = 275,spriteID = 25,delay = 3000,speed=80,scale=50,},
                [22] = {x = 900,y = 700,spriteID = 4,canKillCount=2,delay = 3000,scale=50,}, 
                [23] = {x = -132,y = 356,spriteID = 27,speed=70,scale=60,delay = 3000,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"17",
                 [2] = _t"18",
                 [3] = _t"19",
                 [4] = _t"20",},
    }
CountBirdsWorld[96]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG3.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波    十字帆
                [1] = {x = -177,y = 146,spriteID = 11,speed=70,scale=60,},
                [2] = {x = -177,y = 230,spriteID = 11,speed=70,scale=60,},
                [3] = {x = -177,y = 309,spriteID = 11,speed=70,scale=60,},
                [4] = {x = -177,y = 386,spriteID = 11,speed=70,scale=60,},
                [5] = {x = -177,y = 463,spriteID = 11,speed=70,scale=60,},
                [6] = {x = -26,y = 309,spriteID = 11,speed=70,scale=60,},
                [7] = {x = -104,y = 309,spriteID = 11,speed=70,scale=60,},
                [8] = {x = -255,y = 309,spriteID = 11,speed=70,scale=60,},
                [9] = {x = -329,y = 309,spriteID = 11,speed=70,scale=60,},
                [10] = {x = -133,y = 263,spriteID = 27,speed=70,scale=60,delay = 5000,},
                [11] = {x = -223,y = 261,spriteID = 27,speed=70,scale=60,delay = 5000,},
                [12] = {x = -225,y = 354,spriteID = 27,speed=70,scale=60,delay = 5000,},
                [13] = {x = -132,y = 356,spriteID = 27,speed=70,scale=60,delay = 5000,},
                --第三波   人字形
                [14] = {x = 953,y = 237,spriteID = 17,delay = 7000,speed=90,scale=70,},
                [15] = {x = 1067,y = 238,spriteID = 17,delay = 7000,speed=90,scale=70,},
                [16] = {x = 1163,y = 177,spriteID = 17,delay = 7000,speed=90,scale=70,},
                [17] = {x = 1182,y = 268,spriteID = 17,delay = 7000,speed=90,scale=70,},
                -- 第四波    右往左  波浪翻滚
                [18] = {x = 970,y = 265,spriteID = 28,delay = 5000,speed=110,scale=70,},
                [19] = {x = 980,y = 275,spriteID = 28,delay = 5400,speed=110,scale=50,},
                [20] = {x = 980,y = 275,spriteID = 28,delay = 5800,speed=110,scale=50,},
                [21] = {x = 980,y = 275,spriteID = 28,delay = 6200,speed=110,scale=50,},
                [22] = {x = 980,y = 275,spriteID = 28,delay = 6600,speed=110,scale=50,},
                [23] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 4000,scale=50,}, 
                [24] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 5000,scale=50,}, 
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num 
                 },
         question_answer = {
                 [1] = _t"19",
                 [2] = _t"20",
                 [3] = _t"21",
                 [4] = _t"22",},          
    }
CountBirdsWorld[97]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG4.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波    燕形队
                [1] = {x = -86,y = 491,spriteID = 27,speed=80,scale=80,delay = 100},
                [2] = {x = -86,y = 432,spriteID = 27,speed=80,scale=60,delay = 200},
                [3] = {x = -86,y = 380,spriteID = 27,speed=80,scale=50,delay = 300},
                [4] = {x = -294,y = 129,spriteID = 14,speed=80,scale=40,},
                [5] = {x = -170,y = 334,spriteID = 14,speed=80,scale=60,},
                [6] = {x = -241,y = 368,spriteID = 14,speed=80,scale=50,},
                [7] = {x = -317,y = 406,spriteID = 14,speed=80,scale=40,},
                [8] = {x = -290,y = 284,spriteID = 14,speed=80,scale=40,},
                -- 第二波     彩带曲线
                [9] = {x = -125,y = 118,spriteID = 11,delay = 7000,speed=80,scale=70,},
                [10] = {x = -245,y = 139,spriteID = 11,delay = 7000,speed=80,scale=70,},
                [11] = {x = -369,y = 176,spriteID = 11,delay = 7000,speed=80,scale=70,},
                [12] = {x = -285,y = 206,spriteID = 11,delay = 7000,speed=80,scale=70,},
                [13] = {x = -179,y = 232,spriteID = 11,delay = 7000,speed=80,scale=70,},
                [14] = {x = -98,y = 264,spriteID = 11,delay = 7000,speed=80,scale=70,},
                [15] = {x = -56,y = 318,spriteID = 11,delay = 7000,speed=80,scale=70,},
                [16] = {x = -93,y = 385,spriteID = 11,delay = 7000,speed=80,scale=70,},
                [17] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 10000,scale=50,}, 
                --第三波      四只一排
                [18] = {x = -72,y = 296,spriteID = 16,delay = 11000,speed=90,scale=80,},
                [19] = {x = -135,y = 294,spriteID = 16,delay = 11000,speed=90,scale=80,},
                [20] = {x = -194,y = 293,spriteID = 16,delay = 11000,speed=90,scale=80,},
                [21] = {x = -255,y = 293,spriteID = 10,delay = 11000,speed=90,scale=65,},
                [22] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 3000,scale=50,}, 
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"17",
                 [2] = _t"18",
                 [3] = _t"19",
                 [4] = _t"20",},
    }
CountBirdsWorld[98]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG2.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波  人字形
                [1] = {x = -53,y = 237,spriteID = 11,scale=70,},
                [2] = {x = -167,y = 238,spriteID = 11,scale=70,},
                [3] = {x = -263,y = 177,spriteID = 12,scale=70,},
                [4] = {x = -282,y = 268,spriteID = 12,scale=70,},
                [5] = {x = -316,y = 114,spriteID = 12,scale=70,},
                [6] = {x = -339,y = 318,spriteID = 12,scale=70,},
                [7] = {x = -361,y = 57,spriteID = 12,scale=70,},
                [8] = {x = -393,y = 374,spriteID = 12,scale=70,},
                -- 第二波   椭圆
                [9] = {x = -54,y = 264,spriteID = 13,delay = 2000,speed=50,scale=50,},
                [10] = {x = -114,y = 172,spriteID = 13,delay = 2000,speed=50,scale=70,},
                [11] = {x = -213,y = 153,spriteID = 13,delay = 2000,speed=50,scale=70,},
                [12] = {x = -297,y = 184,spriteID = 13,delay = 2000,speed=50,scale=70,},
                [13] = {x = -339,y = 257,spriteID = 13,delay = 2000,speed=50,scale=70,},
                [14] = {x = -291,y = 346,spriteID = 13,delay = 2000,speed=50,scale=70,},
                [15] = {x = -171,y = 371,spriteID = 13,delay = 2000,speed=50,scale=70,},
                -- 第三波      波浪翻滚
                [16] = {x = -70,y = 265,spriteID = 21,delay = 5000,speed=110,scale=70,},
                [17] = {x = -80,y = 275,spriteID = 21,delay = 5400,speed=110,scale=50,},
                [18] = {x = -80,y = 275,spriteID = 21,delay = 5800,speed=110,scale=50,},
                [19] = {x = -80,y = 275,spriteID = 21,delay = 6200,speed=110,scale=50,},
                [20] = {x = -80,y = 275,spriteID = 21,delay = 6600,speed=110,scale=50,},
                [21] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 2000,scale=50,}, 
                -- 第四波    右往左  波浪翻滚
                [22] = {x = 970,y = 265,spriteID = 28,delay = 5000,speed=110,scale=70,},
                [23] = {x = 980,y = 275,spriteID = 28,delay = 5400,speed=110,scale=50,},
                [24] = {x = 980,y = 275,spriteID = 28,delay = 5800,speed=110,scale=50,},
                [25] = {x = 980,y = 275,spriteID = 28,delay = 6200,speed=110,scale=50,},
                [26] = {x = 980,y = 275,spriteID = 28,delay = 6600,speed=110,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"24",
                 [2] = _t"25",
                 [3] = _t"26",
                 [4] = _t"27",},
    }
CountBirdsWorld[99]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG3.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波   圆弧反弹动态
                [1] = {x = -186,y = 375,spriteID = 12,delay = 5000,speed=110,scale=60,},
                [2] = {x = -142,y = 329,spriteID = 12,delay = 5000,speed=98,scale=60,},
                [3] = {x = -160,y = 417,spriteID = 12,delay = 5000,speed=98,scale=60,},
                [4] = {x = -75,y = 286,spriteID = 12,delay = 5000,speed=88,scale=60,},
                [5] = {x = -95,y = 449,spriteID = 12,delay = 5000,speed=88,scale=60,},
                [6] = {x = -13,y = 240,spriteID = 12,delay = 5000,speed=75,scale=60,},
                [7] = {x = -13,y = 480,spriteID = 12,delay = 5000,speed=75,scale=60,},
                 -- 第二波   人字形
                [8] = {x = -167,y = 238,spriteID = 11,scale=70,},
                [9] = {x = -263,y = 177,spriteID = 12,scale=70,},
                [10] = {x = -282,y = 268,spriteID = 12,scale=70,},
                [11] = {x = -316,y = 114,spriteID = 12,scale=70,},
                [12] = {x = -339,y = 318,spriteID = 12,scale=70,},
                [13] = {x = -361,y = 57,spriteID = 12,scale=70,},
                [14] = {x = -393,y = 374,spriteID = 12,scale=70,},
                -- 第三波      波浪翻滚
                [15] = {x = -70,y = 465,spriteID = 27,delay = 5000,speed=110,scale=80,},
                [16] = {x = -80,y = 475,spriteID = 27,delay = 5400,speed=110,scale=50,},
                [17] = {x = -80,y = 475,spriteID = 27,delay = 5800,speed=110,scale=50,},
                [18] = {x = -80,y = 475,spriteID = 27,delay = 6200,speed=110,scale=50,},
                [19] = {x = -80,y = 475,spriteID = 27,delay = 6600,speed=110,scale=50,},
                [20] = {x = 900,y = 700,spriteID = 4,canKillCount=2,delay = 8500,scale=50,}, 
                -- 第四波     右往左  一排
                [21] = {x = 925,y = 200,spriteID = 17,delay = 10000,speed=80,scale=70,},
                [22] = {x = 1000,y = 230,spriteID = 17,delay = 10000,speed=80,scale=70,},
                [23] = {x = 1075,y = 260,spriteID = 17,delay = 10000,speed=80,scale=70,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"18",
                 [2] = _t"19",
                 [3] = _t"20",
                 [4] = _t"21",},
    }
CountBirdsWorld[100]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG3.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波    跳跃
                [1] = {x = -53,y = 479,spriteID = 27,speed=110,scale=50,},
                [2] = {x = -55,y = 549,spriteID = 27,speed=100,scale=50,},
                [3] = {x = -55,y = 515,spriteID = 27,speed=90,scale=50,},
                -- 第二波     波浪
                [4] = {x = 938,y = 434,spriteID = 28,delay = 3000,speed=90,scale=60,},
                [5] = {x = 938,y = 424,spriteID = 28,delay = 3000,speed=70,scale=60,},
                -- 第三波     笑脸
                [6] = {x = -76,y = 217,spriteID = 11,delay = 8000,speed=90,scale=60,},
                [7] = {x = -230,y = 212,spriteID = 11,delay = 8000,speed=90,scale=60,},
                [8] = {x = -26,y = 356,spriteID = 11,delay = 8000,speed=90,scale=60,},
                [9] = {x = -96,y = 423,spriteID = 11,delay = 8000,speed=90,scale=60,},
                [10] = {x = -186,y = 436,spriteID = 11,delay = 8000,speed=90,scale=60,},
                [11] = {x = -241,y = 411,spriteID = 11,delay = 8000,speed=90,scale=60,},
                [12] = {x = -263,y = 371,spriteID = 11,delay = 8000,speed=90,scale=60,},
                -- 第四波     右往左  一排
                [13] = {x = 925,y = 200,spriteID = 17,delay = 7000,speed=80,scale=70,},
                [14] = {x = 1000,y = 230,spriteID = 17,delay = 7000,speed=80,scale=70,},
                [15] = {x = 1075,y = 260,spriteID = 17,delay = 7000,speed=80,scale=70,},
                [16] = {x = 1150,y = 290,spriteID = 17,delay = 7000,speed=80,scale=70,},
                [17] = {x = 1225,y = 320,spriteID = 17,delay = 7000,speed=80,scale=70,},
                [18] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 11000,scale=50,},
                [19] = {x = 900,y = 700,spriteID = 4,canKillCount=1,delay = 7000,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"13",
                 [2] = _t"14",
                 [3] = _t"15",
                 [4] = _t"16",},
    }
CountBirdsWorld[101]=
    {
         worldWidth  = 900,
         worldHeight = 700,
         gridSizeX   = 80,
         gridSizeY   = 85,
         backgroundImage = "res/countbirds/BG4.png",
         backTileMap = 0, --地图层,0 则不使用
         sprite = {
                -- 第一波  三角形
                [1] = {x = -81,y = 292,spriteID = 11,speed=90,scale=80,},
                [2] = {x = -157,y = 227,spriteID = 11,speed=80,scale=80,},
                [3] = {x = -229,y = 166,spriteID = 11,speed=70,scale=80,},
                [4] = {x = -231,y = 242,spriteID = 11,speed=80,scale=80,},
                [5] = {x = -231,y = 317,spriteID = 11,speed=90,scale=80,},
                [6] = {x = -231,y = 386,spriteID = 11,speed=100,scale=80,},
                [7] = {x = -157,y = 340,spriteID = 11,speed=110,scale=80,},
                -- 第二波   波浪翻滚
                [8] = {x = -70,y = 265,spriteID = 25,delay = 3000,speed=100,scale=50,},
                [9] = {x = -80,y = 275,spriteID = 25,delay = 3400,speed=95,scale=50,},
                [10] = {x = -80,y = 275,spriteID = 25,delay = 3800,speed=90,scale=50,},
                [11] = {x = -80,y = 275,spriteID = 25,delay = 4200,speed=85,scale=50,},
                [12] = {x = -80,y = 275,spriteID = 25,delay = 4600,speed=80,scale=50,},
                 -- 第三波  右往左  波浪
                [13] = {x = 970,y = 265,spriteID = 28,delay = 3000,speed=100,scale=50,},
                [14] = {x = 980,y = 275,spriteID = 28,delay = 3400,speed=95,scale=50,},
                [15] = {x = 980,y = 275,spriteID = 28,delay = 3800,speed=90,scale=50,},
                [16] = {x = 980,y = 275,spriteID = 28,delay = 4200,speed=85,scale=50,},
                [17] = {x = 980,y = 275,spriteID = 28,delay = 4600,speed=80,scale=50,},
                [18] = {x = -23,y = 479,spriteID = 27,speed=110,scale=50,},
                [19] = {x = -55,y = 549,spriteID = 27,speed=100,scale=50,},
                },

         award   = {
                 [1] = 13523, -- 奖励1 id
                 [2] = 999, -- 奖励1 num
                 [3] = 13737, -- 奖励2 id
                 [4] = 999, -- 奖励2 num
                 },
         question_answer = {
                 [1] = _t"18",
                 [2] = _t"19",
                 [3] = _t"20",
                 [4] = _t"21",},
    }











CountBirdsDB = {}
CountBirdsDB[1]=
    {
         [1] = {min=1,max=30,successTaskID=12888,failedTaskID=12889},
         [2] = {min=31,max=60,successTaskID=12890,failedTaskID=12891},
         [3] = {min=61,max=100,successTaskID=12892,failedTaskID=12893},
    }


