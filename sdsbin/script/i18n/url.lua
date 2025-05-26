
module("URL_TABLE")

LoginDailyTaskToday 			= "about:blank"
LoginDailyTaskTomorrow			= "about:blank"
LoginCodePage 					= 936

Register						= "http://www.wanmei.com/" -- 暂无
Payment 						= "http://passport.wanmei.com/sso/accounts/serviceLogin?service=pay&continue=http://pay.wanmei.com/e/SSOServerLogin&location=2f652f47616d655061792e646f&account=%s&ticket=%s"

-- 开通快捷支付
ProxyAddCashActivate			= "http://passport.wanmei.com/sso/accounts/serviceLogin?service=pay&continue=http://pay.wanmei.com/e/SSOServerLogin&location=2f652f696e67616d652f7369676e2e646f3f6f703d6c697374&account=%s&ticket=%s"

-- 商城
ChangePassword					= "http://www.wanmei.com/"-- 暂无

PwdProtect 						= "http://www.wanmei.com/accsafe/"-- 暂无
PwdProtectOpen  				= true -- 暂无
PwdProtectCard 					= "http://www.wanmei.com/card/" -- 暂无
PwdProtectPhone 				= "http://www.wanmei.com/hd/sjmb/" -- 暂无

inner_bbs						= "http://event21.wanmei.com/seiya/201212/seiyabugsuggest/index.jsp" -- 提交bug

BBSPage								= "http://bbs.seiya.wanmei.com" -- 论坛
LeagueBBSPage						= "http://www.17y.com/sdsweb/faction/index" --"http://www.17y.com/sdsweb/faction/index?category=1" -- 军团论坛
OfficePage							= "http://seiya.wanmei.com/main.htm" -- 官网
SNSPage								= "http://www.17y.com/sdsweb/embedded/sdstheme" -- 社区
WeiboPage							= "http://172.16.2.130/" -- 微博（作废）
GameDataPage						= "http://172.16.2.130/" -- 资料（暂无）
ZonghengPage						= "http://172.16.2.130/" -- 纵横（作废）
SNS_DOMAIN							=	".17y.com" -- 暂无
BBS_LEAGUE_DATA						=	""--"http://www.17y.com/sdsweb/faction/embedded/topThread" -- 军团论坛热帖数据请求地址
ThemeStation						=	"http://www.17y.com/sdsweb/embedded/sdstheme"	--	内嵌主题站
PrivateCenter						=	"http://www.17y.com/sdsweb/embedded/pushinfo"	--	个人中心
PublishBoard						=	"http://www.17y.com/sdsweb/pushinfo/notice"	--	头部公告
HotPage								=	"http://www.17y.com/sdsweb/embedded/hotalbum"	--	热门图片
QandA								=	"http://www.17y.com/zhidao"--"http://www.17y.com/sds/forum?mid=19"	--	问答
XunBao								=	"http://www.xunbao178.com/sds"--	寻宝
AgeBoss								=	"http://seiya.wanmei.com/launcher/launcher_inner.htm"--	冥王之怒的服务器进度
AgeBoss_Achieve							=	"http://seiya.wanmei.com/launcher/launcher_inner2.htm"--	冥王之怒 成就
WebStore	 						= "http://passport.wanmei.com/sso/accounts/serviceLogin?service=activity&continue=http://daoju.wanmei.com/sds/SSOServerLogin&location=2f776d70617373706f7274322f6a73702f73736f6c6f67696e2e6a73703f726564697265637455524c3d687474703a2f2f64616f6a752e77616e6d65692e636f6d2f7364732f2673657373696f6e4e616d653d555345522666696c65706174683d2f7364732f&account=%s&ticket=%s"

