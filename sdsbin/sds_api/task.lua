---------------------------------------------------------------
--	所有关于任务的接口
--  @author hanwei
---------------------------------------------------------------

--- 圣斗士客户端提供给脚本的接口,主要为游戏逻辑接口
module("GameApi")



--- 获取任务名称 
-- @param tid 任务模板tid
-- @return 任务名称
function GetTaskName( tid )
end


--- 任务是否已经完成过，且被记录为成功 
-- @param tid 任务模板tid
-- @return true/false, 是否已经完成过
-- @usage 如果任务没有勾选"完成结果记录"，会返回false。
function IsTaskFinishSuccess( tid )
end


--- 获得任务完成次数
-- @param tid 任务模板tid
-- @return 任务完成次数
-- @usage 注意：如果任务没有勾选"完成结果记录"，会返回0。 
--在勾选"完成结果记录"情况下，如果没有勾选"记录完成次数和时间"，完成后总是返回1
--这里的数量不区别成功完成和失败完成。 
function GetTaskFinishedCount( tid )
end


--- 判断指定任务是否已接
-- @param tid 任务模板tid
-- @return true/false, 任务是否已接
function IsTaskActive( tid )
end


--- 获得父任务id
-- @param tid 任务模板tid
-- @return id, 父任务的id，如果是顶级任务那么返回值为0
function GetTaskParentId( tid )
end


--- 获得当前已接任务列表。不管是父任务还是子任务都会列出
-- @return  已接任务列表, idlist = { id1, id2, id3, .... } 
function GetActiveTaskList()
end


--- 获得子任务列表 
-- @param tid 任务模板tid
-- @return 子任务列表, idlist = { id1, id2, id3, .... } 
-- @usage 子任务按链顺序有序排列。如果没有子任务，返回空表 
function GetSubTaskList(tid)
end


--- 判断已接指定任务是否达成任务完成条件
-- @param tid 任务模板tid
-- @return { idlist } 
function IsTaskActiveComplete(tid)
end 


--* 内部数据，建议删除该API
--获得指定任务上次接取的时间。如果没有记录，那么返回nil。如果已经超过自动清空时间，结果为0
-- @param tid 任务模板tid
-- @return time or nil, time是一个整数,和C标准库兼容，表示从1970年开始的秒数
function GetTaskLastDeliverTime(tid)
end


--- 获得所有勾选“可以查找”的“主线”和“支线”任务。仅顶级任务可以勾选，仅搜索顶级任务。 
-- @return {id1, id2...}, id列表
-- @usage 编辑器中只有主任务才能勾选该选项。 
function GetSearchableTaskList()
end


--- 获得任务推荐星级
-- @param tid 任务模板tid
-- @return star, 推荐度，整数
function GetTaskStar(tid)
end


--- 获得任务类型
-- @param tid 任务模板tid
-- @return tasktype, 分类：0 支线 1 主线 2 隐藏 3 库任务, 见Constant中 task types
function GetTaskType(tid)
end


--- 获得任务分类
-- @param tid 任务模板tid
-- @return category, 分类类别字符串。见quest/quest_category.lua，返回的是QuestCategoryAliases表的键 
function GetTaskCategory(tid)
end


--- 获得任务要求最小最大级别,以及推荐级别
-- @param tid 任务模板tid
-- @return min, 任务前提条件：最小级别
-- @return max, 任务前提条件：最大级别
-- @return sutible, 任务前提条件：推荐级别
function GetTaskLevelReq(tid)
end


--- 获得任务发放NPC
-- @param tid 任务模板tid
-- @return id, 任务发放NPC id。如果没有发放NPC，返回0
function GetTaskDeliverNpc(tid)
end


--- 判断任务是否可接
-- @param tid 任务模板tid
-- @return true / false, 任务是否可接
function CanDeliverTask(tid)
end


--- 获得任务奖励NPC
-- @param tid 任务模板tid
-- @return id, 任务奖励NPC id。如果没有奖励NPC，返回0
function GetTaskAwardNpc(tid)
end


--- 获得任务奖励内容。目前仅返回非脚本部分固定填表结果 
-- @param tid 任务模板tid
-- @return { gold, bind_money, exp, sp, items = {{id,num},...} }
function GetTaskAwardInfo(tid)
end


--- 客户端主动触发任务
-- @param tid 任务模板tid
-- @return boolean 返回true表示客户端检查通过并向服务器端发送了通知，否则返回false
-- @usage 客户端会首先检查任务是否勾选了“允许客户端主动触发”，然后检查任务条件是否满足，检查通过后通知服务器发放任务
function MaunallyTrigTask(tid)
end
