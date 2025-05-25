---------------------------------------------------------------
--  created:   2013.1.30
--  author:    chenfudun
--
--  活动经验补偿配置
---------------------------------------------------------------	

Activity_Bonus =
{
    [0] =  						  -- [0]是参考例子，编号顺序排列，编号[1]及以后的有效
    {
    	activity_id   = 10826,	   -- 任务ID或副本ID
      activity_group= {10324,},  -- 共同计次的其他活动,可以多个其他活动id
      activity_type = 0,		     -- 活动类型：0 表示副本，否则是任务
      mul_powers    = {1,2,3,},  -- t=2,3,大于3...时的奖励倍率
    },
    [1] = 
    {
     	activity_id   = 10324,
      activity_group= {18219,32048,37703}, 
      activity_type = 0,
      mul_powers 	  = {1,2,3,},
    },
    [2] = 
    {
      activity_id   = 14689,
      activity_group= {23436,32471,37702},       
      activity_type = 0,
      mul_powers    = {1,2,3,},
    },
}