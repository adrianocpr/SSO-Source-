----------------------------------------------
-- 客户端功能配置
-- Created By fengbo
----------------------------------------------
--[[
feature id 命名，建议根据功能模块的父子关系用"."分割。
]]

features =
{
	--"login.play_cg_button",			-- 登陆界面的播放动画按钮
	"login.3rd_login",					-- 第三方登录
    "login.invite_code",		        -- 推广人
	"login.character_query",			-- 角色所在服查询
	"browser.request_token",			-- 内置浏览器访问网页时请求token
	--"gt.start",						-- 启动gt
	--"bugreport.disconnect",			-- 断线时,提交bug报告
	"bugreport.crash",					-- 程序崩溃时, 提交bug报告
	"bugreport.perfect_protect",		-- pp启动失败时, 提交bug报告
	--"bugreport.revive",				-- 复活之后无法移动情况, 提交bug报告
	--"bugreport.skill_error",			-- 卡技能问题
	"gshop.wanmei_card",				-- 通过完美一卡通充值
	"gshop.proxy_add_cash",				-- 通过第三方支付平台的快捷支付
	"xunbao.sell.role",				-- 寻宝网角色交易
	"service.prof.geminorum",			-- 选择职业, 海龙
}
