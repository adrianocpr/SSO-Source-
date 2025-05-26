--[[ @i18n item ]]
local _t = require("i18n").context("item")
-------------------------
--拍卖配置
local ALL_SUB = 0
--拍卖数据
auction_data = {}
auction_data[1] = {name =_t"装备", main =1, sub =0, leaf =0, image ="special\\Auction\\Image\\Eqiup.tga", }
auction_data[101] = {name =_t"发带", main =1, sub =1, leaf =0, }
auction_data[102] = {name =_t"衬衣", main =1, sub =2, leaf =0, }
auction_data[103] = {name =_t"下衣", main =1, sub =3, leaf =0, }
auction_data[104] = {name =_t"护符", main =1, sub =4, leaf =0, }
auction_data[105] = {name =_t"项链", main =1, sub =5, leaf =0, }
auction_data[106] = {name =_t"戒指", main =1, sub =6, leaf =0, }
auction_data[107] = {name =_t"灵石", main =1, sub =7, leaf =0, }
auction_data[108] = {name =_t"徽章", main =1, sub =8, leaf =0, }
auction_data[109] = {name =_t"手环", main =1, sub =9, leaf =0, }
auction_data[110] = {name =_t"珠链", main =1, sub =10, leaf =0, }
auction_data[2] = {name =_t"药品", main =2, sub =0, leaf =0, image ="special\\Auction\\Image\\Drug.tga", }
auction_data[201] = {name =_t"面包", main =2, sub =1, leaf =0, }
auction_data[202] = {name =_t"绷带", main =2, sub =2, leaf =0, }
auction_data[203] = {name =_t"药水", main =2, sub =3, leaf =0, }
auction_data[204] = {name =_t"药剂", main =2, sub =4, leaf =0, }
auction_data[3] = {name =_t"配方", main =3, sub =0, leaf =0, image ="special\\Auction\\Image\\Formula.tga", }
auction_data[301] = {name =_t"药剂", main =3, sub =1, leaf =0, }
auction_data[30101] = {name =_t"药水", main =3, sub =1, leaf =1, }
auction_data[30102] = {name =_t"魔药", main =3, sub =1, leaf =2, }
auction_data[30103] = {name =_t"合剂", main =3, sub =1, leaf =3, }
auction_data[302] = {name =_t"炼金", main =3, sub =2, leaf =0, }
auction_data[30201] = {name =_t"提炼", main =3, sub =2, leaf =1, }
auction_data[30202] = {name =_t"灵宝", main =3, sub =2, leaf =2, }
auction_data[30203] = {name =_t"星铸", main =3, sub =2, leaf =3, }
auction_data[303] = {name =_t"通灵", main =3, sub =3, leaf =0, }
auction_data[30301] = {name =_t"福咒", main =3, sub =3, leaf =1, }
auction_data[30302] = {name =_t"镇魂", main =3, sub =3, leaf =2, }
auction_data[30303] = {name =_t"印纹", main =3, sub =3, leaf =3, }
auction_data[4] = {name =_t"装备增强", main =4, sub =0, leaf =0, image ="special\\Auction\\Image\\Enhance.tga", }
auction_data[401] = {name =_t"聚能", main =4, sub =1, leaf =0, }
auction_data[402] = {name =_t"升阶", main =4, sub =2, leaf =0, }
auction_data[403] = {name =_t"符文", main =4, sub =3, leaf =0, }
auction_data[5] = {name =_t"圣衣", main =5, sub =0, leaf =0, image ="special\\Auction\\Image\\Cloth.tga", }
auction_data[501] = {name =_t"星铸材料", main =5, sub =1, leaf =0, }
auction_data[502] = {name =_t"圣衣兑换", main =5, sub =2, leaf =0, }
auction_data[6] = {name =_t"收藏品", main =6, sub =0, leaf =0, image ="special\\Auction\\Image\\Favorite.tga", }
auction_data[7] = {name =_t"生产材料", main =7, sub =0, leaf =0, image ="special\\Auction\\Image\\Produce.tga", }
auction_data[8] = {name =_t"灵魂之甲", main =8, sub =0, leaf =0, image ="special\\Auction\\Image\\Eqiup.tga", }
auction_data[9] = {name =_t"小宇宙", main =9, sub =0, leaf =0,  image ="special\\Auction\\Image\\Cosmos.tga", }
auction_data[901] = {name =_t"星魂", main =9, sub =1, leaf =0, }
auction_data[902] = {name =_t"潜能", main =9, sub =2, leaf =0, }
auction_data[10] = {name =_t"守护星", main =10, sub =0, leaf =0,  image ="special\\Auction\\Image\\Follower.tga", }
auction_data[1001] = {name =_t"守护星", main =10, sub =1, leaf =0, }
auction_data[1002] = {name =_t"技能书", main =10, sub =2, leaf =0, }
auction_data[1003] = {name =_t"装备", main =10, sub =3, leaf =0, }
auction_data[1004] = {name =_t"其他", main =10, sub =4, leaf =0, }
auction_data[11] = {name =_t"小伙伴", main =11, sub =0, leaf =0, image ="special\\Auction\\Image\\Ride.tga", }
auction_data[12] = {name =_t"坐骑", main =12, sub =0, leaf =0, image ="special\\Auction\\Image\\Ride.tga", }
auction_data[13] = {name =_t"商城道具", main =13, sub =0, leaf =0, image ="special\\Auction\\Image\\RMB.tga",}
auction_data[14] = {name =_t"时装", main =14, sub =0, leaf =0, image ="special\\Auction\\Image\\Cloth.tga", }
auction_data[1401] = {name =_t"男装", main =14, sub =1, leaf =0, }
auction_data[140101] = {name =_t"头饰", main =14, sub =1, leaf =1, }
auction_data[140102] = {name =_t"发型", main =14, sub =1, leaf =2, }
auction_data[140103] = {name =_t"脸部", main =14, sub =1, leaf =3, }
auction_data[140104] = {name =_t"上衣", main =14, sub =1, leaf =4, }
auction_data[140105] = {name =_t"套装", main =14, sub =1, leaf =5, }
auction_data[140106] = {name =_t"下衣", main =14, sub =1, leaf =6, }
auction_data[140107] = {name =_t"手套", main =14, sub =1, leaf =7, }
auction_data[140108] = {name =_t"鞋子", main =14, sub =1, leaf =8, }
auction_data[1402] = {name =_t"女装", main =14, sub =2, leaf =0, }
auction_data[140201] = {name =_t"头饰", main =14, sub =2, leaf =1, }
auction_data[140202] = {name =_t"发型", main =14, sub =2, leaf =2, }
auction_data[140203] = {name =_t"脸部", main =14, sub =2, leaf =3, }
auction_data[140204] = {name =_t"上衣", main =14, sub =2, leaf =4, }
auction_data[140205] = {name =_t"套装", main =14, sub =2, leaf =5, }
auction_data[140206] = {name =_t"下衣", main =14, sub =2, leaf =6, }
auction_data[140207] = {name =_t"手套", main =14, sub =2, leaf =7, }
auction_data[140208] = {name =_t"鞋子", main =14, sub =2, leaf =8, }
auction_data[1403] = {name =_t"通用装", main =14, sub =3, leaf =0, }
auction_data[15] = {name =_t"星域探索", main =15, sub =0, leaf =0, image ="special\\Auction\\Image\\Cosmos.tga",}
auction_data[16] = {name =_t"神器", main =16, sub =0, leaf =0, image ="special\\Auction\\Image\\Eqiup.tga",}
auction_data[1601] = {name =_t"神器", main =16, sub =1, leaf =0, }
auction_data[1602] = {name =_t"灵气", main =16, sub =2, leaf =0, }
auction_data[20] = {name =_t"其他", main =20, sub =0, leaf =0, image ="special\\Auction\\Image\\Other.tga", }
auction_data[2001] = {name =_t"杂物", main =20, sub =1, leaf =0, }
auction_data[2002] = {name =_t"其他", main =20, sub =2, leaf =0, }
auction_data[97] = {name =_t"指定给我", main =97, sub =0, leaf =0, image ="special\\Auction\\Image\\Other.tga", }
auction_data[98] = {name =_t"金币", main =98, sub =0, leaf =0, image ="special\\Auction\\Image\\Other.tga", }
auction_data[99] = {name =_t"角色", main =99, sub =0, leaf =0, image ="special\\Auction\\Image\\Other.tga", }


--
-- 拍卖树状结构配置
auction_dir =
{
    --装备
    {id = 1, list ={
                        --发带
                        {
                            id = 101,
                          },
                        --衬衣
                        {
                            id = 102,
                          },
                        --下衣
                        {
                            id = 103,
                          },
                        --护符
                        {
                            id = 104,
                          },
                        --项链
                        {
                            id = 105,
                          },
                        --戒指
                        {
                            id = 106,
                          },
                        --灵石
                        {
                            id = 107,
                          },
                        --徽章
                        {
                            id = 108,
                          },
                        --手环
                        {
                            id = 109,
                          },
                        --珠链
                        {
                            id = 110,
                          },
                 }
    },
    --药品
    {id = 2, list ={
                        --面包
                        {
                            id = 201,
                          },
                        --绷带
                        {
                            id = 202,
                          },
                        --药水
                        {
                            id = 203,
                          },
                        --药剂
                        {
                            id = 204,
                          },
                 }
    },
    --配方
    {id = 3, list ={
                        --药剂
                        {
                            id = 301, list ={
                                             --药水,魔药,合剂,
                                                {id = 30101,},{id = 30102,},{id = 30103,},
                                             }
                          },
                        --炼金
                        {
                            id = 302, list ={
                                             --提炼,灵宝,星铸,
                                                {id = 30201,},{id = 30202,},{id = 30203,},
                                             }
                          },
                        --通灵
                        {
                            id = 303, list ={
                                             --福咒,镇魂,印纹,
                                                {id = 30301,},{id = 30302,},{id = 30303,},
                                             }
                          },
                 }
    },
    --装备增强
    {id = 4, list ={
                        --聚能
                        {
                            id = 401,
                          },
                        --升阶
                        {
                            id = 402,
                          },
                        --符文
                        {
                            id = 403,
                          },
                    }
    },
    --圣衣
    {id = 5, list ={
                        --星铸材料
                        {
                            id = 501,
                          },
                        --圣衣兑换
                        {
                            id = 502,
                          },
                 }
    },
    --收藏品
    {id = 6,
    },
    --生产材料
    {id = 7,
    },
    --小宇宙
    {id = 9, list ={
                        --星魂
                        {
                            id = 901,
                          },
                        --潜能
                        {
                            id = 902,
                          },
                 }
    },
    --守护星
    {id = 10, list ={
                        --守护星
                        {
                            id = 1001,
                          },
                        --技能书
                        {
                            id = 1002,
                          },
                        --时装
                        {
                            id = 1003,
                          },
                        --其他
                        {
                            id = 1004,
                          },
                 }
    },
    --星域探索
    {id = 15,
    },
    --神器
    {id = 16, list ={
                        --神器
                        {
                            id = 1601,
                          },
                        --灵气
                        {
                            id = 1602,
                          },
                 }
    },
    --灵魂之甲
    {id = 8,
    },
    --小伙伴
    {id = 11,
    },
    --坐骑
    {id = 12,
    },
    --商城道具
    {id = 13,
    },
    --时装
    {id = 14, list ={
                        --男装
                        {
                            id = 1401,
                          },
                        --女装
                        {
                            id = 1402,
                          },
                        --通用装
                        {
                            id = 1403,
                          },
                     }
    },
    --其他
    {id = 20, list ={
                        --杂物
                        {
                            id = 2001,
                          },
                        --其他
                        {
                            id = 2002,
                          },
                 }
    },
}
--

-- 寻宝树状结构配置
xunbao_dir =
{
	--指定给我
    {id = 97,
    },
    --金币
    {id = 98,
    },
    --
    {id = 99,
    },
    --装备
    {id = 1, list ={
                        --发带
                        {
                            id = 101,
                          },
                        --衬衣
                        {
                            id = 102,
                          },
                        --下衣
                        {
                            id = 103,
                          },
                        --护符
                        {
                            id = 104,
                          },
                        --项链
                        {
                            id = 105,
                          },
                        --戒指
                        {
                            id = 106,
                          },
                        --灵石
                        {
                            id = 107,
                          },
                        --徽章
                        {
                            id = 108,
                          },
                        --手环
                        {
                            id = 109,
                          },
                        --珠链
                        {
                            id = 110,
                          },
                 }
    },
    --药品
    {id = 2, list ={
                        --面包
                        {
                            id = 201,
                          },
                        --绷带
                        {
                            id = 202,
                          },
                        --药水
                        {
                            id = 203,
                          },
                        --药剂
                        {
                            id = 204,
                          },
                 }
    },
    --配方
    {id = 3, list ={
                        --药剂
                        {
                            id = 301, list ={
                                             --药水,魔药,合剂,
                                                {id = 30101,},{id = 30102,},{id = 30103,},
                                             }
                          },
                        --炼金
                        {
                            id = 302, list ={
                                             --提炼,灵宝,星铸,
                                                {id = 30201,},{id = 30202,},{id = 30203,},
                                             }
                          },
                        --通灵
                        {
                            id = 303, list ={
                                             --福咒,镇魂,印纹,
                                                {id = 30301,},{id = 30302,},{id = 30303,},
                                             }
                          },
                 }
    },
    --装备增强
    {id = 4, list ={
                        --聚能
                        {
                            id = 401,
                          },
                        --升阶
                        {
                            id = 402,
                          },
                        --符文
                        {
                            id = 403,
                          },
                    }
    },
    --圣衣
    {id = 5, list ={
                        --星铸材料
                        {
                            id = 501,
                          },
                        --圣衣兑换
                        {
                            id = 502,
                          },
                 }
    },
    --收藏品
    {id = 6,
    },
    --生产材料
    {id = 7,
    },
    --小宇宙
    {id = 9, list ={
                        --星魂
                        {
                            id = 901,
                          },
                        --潜能
                        {
                            id = 902,
                          },
                 }
    },
    --守护星
    {id = 10, list ={
                        --守护星
                        {
                            id = 1001,
                          },
                        --技能书
                        {
                            id = 1002,
                          },
                        --时装
                        {
                            id = 1003,
                          },
                        --其他
                        {
                            id = 1004,
                          },
                 }
    },
    --星域探索
    {id = 15,
    },
    --神器
    {id = 16, list ={
                        --神器
                        {
                            id = 1601,
                          },
                        --灵气
                        {
                            id = 1602,
                          },
                 }
    },
    --灵魂之甲
    {id = 8,
    },
    --小伙伴
    {id = 11,
    },
    --坐骑
    {id = 12,
    },
    --商城道具
    {id = 13,
    },
    --时装
    {id = 14, list ={
                        --男装
                        {
                            id = 1401,
                          },
                        --女装
                        {
                            id = 1402,
                          },
                        --通用装
                        {
                            id = 1403,
                          },
                     }
    },
    --其他
    {id = 20, list ={
                        --杂物
                        {
                            id = 2001,
                          },
                        --其他
                        {
                            id = 2002,
                          },
                 }
    },
}
--

---------------------------------------------------------------------------------
-- 星币交易配置
---------------------------------------------------------------------------------
star_auction_dir = 
{
  --金币
  {100000, 1000000, 10000000,},

  --星币
  {10,     100,     1000,},
}