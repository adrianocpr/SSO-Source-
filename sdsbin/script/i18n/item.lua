--[[ @i18n item ]]
local _t = require("i18n").context("item")

local Format = string.format
local Len = string.len
module("STRING_TABLE")

----------------
--物品相关


--物品品质颜色, 若想修改颜色修改相关定义
ITEMQUALITY_COL_0		= Format("^%06x", QUALITY_COLOR_0) 	--  残破
ITEMQUALITY_COL_1		= Format("^%06x", QUALITY_COLOR_1) 	--  普通
ITEMQUALITY_COL_2		= Format("^%06x", QUALITY_COLOR_2) 	--  优秀
ITEMQUALITY_COL_3		= Format("^%06x", QUALITY_COLOR_3) 	--  精良
ITEMQUALITY_COL_4		= Format("^%06x", QUALITY_COLOR_4) 	--  史诗
ITEMQUALITY_COL_5		= Format("^%06x", QUALITY_COLOR_5) 	--  传说
ITEMQUALITY_COL_6		= Format("^%06x", QUALITY_COLOR_6) 	--  预留
ITEMQUALITY_COL_7		= Format("^%06x", QUALITY_COLOR_7) 	--  预留
ITEMQUALITY_COL_8		= Format("^%06x", QUALITY_COLOR_8) 	--  套装
ITEMQUALITY_COL_9		= Format("^%06x", QUALITY_COLOR_9) 	--  高级套装


--物品自定义颜色, 若想修改颜色修改相关定义
ITEMDESC_COL_WHITE		= Format("^%06x", COLOR_WHITE) 		--  白
ITEMDESC_COL_0			= ITEMDESC_COL_WHITE
ITEMDESC_COL_PURPLE		= Format("^%06x", COLOR_PURPLE) 	--  粉
ITEMDESC_COL_1			= ITEMDESC_COL_PURPLE
ITEMDESC_COL_BLUE		= Format("^%06x", COLOR_BLUE) 		--  天蓝
ITEMDESC_COL_2			= ITEMDESC_COL_BLUE
ITEMDESC_COL_ORANGE		= Format("^%06x", COLOR_ORANGE) 	--  橙
ITEMDESC_COL_3			= ITEMDESC_COL_ORANGE
ITEMDESC_COL_GREEN		= Format("^%06x", COLOR_GREEN) 		--  绿
ITEMDESC_COL_4			= ITEMDESC_COL_GREEN
ITEMDESC_COL_RED		= Format("^%06x", COLOR_RED)		--  红
ITEMDESC_COL_5			= ITEMDESC_COL_RED
ITEMDESC_COL_DARKGOLD	= Format("^%06x", COLOR_DARKGOLD)	--  暗金
ITEMDESC_COL_6			= ITEMDESC_COL_DARKGOLD
ITEMDESC_COL_GRAY		= Format("^%06x", COLOR_GRAY) 		--  灰
ITEMDESC_COL_7			= ITEMDESC_COL_GRAY
ITEMDESC_COL_YELLOW		= Format("^%06x", COLOR_YELLOW) 	--  亮黄
ITEMDESC_COL_8			= ITEMDESC_COL_YELLOW
ITEMDESC_COL_CYANINE	= Format("^%06x", COLOR_CYANINE) 	--  青
ITEMDESC_COL_9			= ITEMDESC_COL_CYANINE


-- 装备位置
EQUIP_FASHION	=	_t"时装"
EQUIP_00                = _t"武器"
EQUIP_01                = _t"副手"
EQUIP_02                = _t"发带"
EQUIP_03                = _t"衬衣"
EQUIP_04                = _t"下衣"
EQUIP_05                = _t"护符"
EQUIP_06                = _t"项链"
EQUIP_07                = _t"徽章"
EQUIP_08                = _t"灵石"
EQUIP_09                = _t"戒指"
EQUIP_10                = _t"戒指右"
EQUIP_11                = _t"面具"
EQUIP_12                = _t"时装头发"
EQUIP_13                = _t"时装上衣"
EQUIP_14                = _t"时装下衣"
EQUIP_15                = _t"时装鞋"
EQUIP_16                = _t"时装手套"
EQUIP_17                = _t"飞行器"
EQUIP_18                = _t"喇叭"
EQUIP_19                = _t"手环"
EQUIP_20                = _t"坐骑"
EQUIP_21                = _t"珠链"
EQUIP_22				= _t"脸"
EQUIP_RING			  	= _t"戒指"
EQUIP_23				= _t"眼睛"
EQUIP_24				= _t"面纹"
EQUIP_25				= _t"绶带"
EQUIP_26				= _t"披风"
EQUIP_27				= _t"腰带"

----------------------
--物品使用错误信息
ITEM_USE_ERR_UNKNOWN = _t"使用物品时发生未知错误"
ITEM_USE_ERR_COMMON	= _t"不能这样使用"
ITEM_USE_ERR_ITEM_COOLING = _t"物品还没有恢复"
ITEM_USE_ERR_WRONG_TIME = _t"现在不能使用"
ITEM_USE_ERR_REQUIRE_STAND = _t"移动中不能进行此操作"
ITEM_USE_ERR_EQUIP_REQUIRE_LEV = _t"等级不足，无法装备"
ITEM_USE_ERR_TALKING = _t"请结束与NPC的对话后再使用物品" 
ITEM_USE_ERR_DIET_FORBID = _t"禁食状态下不能使用该物品" 
ITEM_USE_ERR_STUN_FORBID = _t"眩晕状态下不能使用该物品" 

----------------------
--通用
ITEM_ICON_NAME				=	"%s^%06x%s"
GAINITEM					=	_t"获得%d个 %s"
STRING_EQUIP_COMAPRE_INTER	=	_t"^ffff00当前装备"
STRING_EQUIP_COMBINE_HINT	=   _t"^ff0000如果升阶成功,将获得："
PACKISNOOPT					=	_t"不能操作包裹" 

----------------------
--背包
PACKFULL1						=	_t"操作失败，你的背包空间不足"
PACKFULL2						=	_t"操作失败，对方的背包空间不足"
BANKFULL						=	_t"仓库已满，无法放入物品"
PACK_MONEY_FULL					=	_t"背包金币会超过上限,无法提取"
PACK_FULL						=	_t"包裹已满, 无法取出物品"
PACK_GET_EQUIP_FROM_COMPET_FAIL = 	_t"守护星已锁定，无法取下装备"
BANK_MONEY_FULL					= 	_t"仓库金币会超过上限,无法存入"
PACK_AUCTION_FILTER_NULL 		= 	_t"无"
PACK_TEMP_CANNOT_USE 			= 	_t"抱歉，临时包裹中的物品不能使用，请减少普通包裹中的物品待该物品自动进入普通包裹后再使用"
DO_NOT_NEED_ARRANGE				= 	_t"现在不需要整理" 
ARRANGE_PACK_SERVER_ERROR		= 	_t"现在无法整理背包，请稍候重试" 
ARRANGE_PACK_COOLDOWN			= 	_t"请勿频繁整理，请稍候" 
BAG_EXPAND_TIPS					= 	_t"将在%d级开启此行"
BAG_VIP_BANK_LACK_VIP 			= 	_t"充值1元获得VIP1级即可拥有随身仓库"
MAGIC_BOX_FORBID				=	_t"魔盒界面状态下, 不能这么操作"
MONEY							=	_t"金币"
BIND_MONEY						=	_t"金券"
GOODS							=	_t"物品"
STORE							=	_t"仓库"

----------------------
--圣衣
SAINT_CLOTH					=	_t"圣衣"
SAINT_CLOTH_MATERIAL_0				=	_t"青铜"
SAINT_CLOTH_MATERIAL_1				=	_t"白银"
SAINT_CLOTH_MATERIAL_2				=	_t"黄金"
SAINT_CLOTH_MATERIAL_3				=	_t"神圣"
SAINT_CLOTH_MATERIAL_4				=	_t"冥衣"
SAINT_CLOTH_MATERIAL_5				=	_t"鳞衣"
SAINT_CLOTH_NOT_OBTAIN		= 	_t"没有获得该圣衣"
SATIN_CLOTH_DURA_ZERO_ERR	=   _t"圣衣[%s]耐久为0，请修理后再装备"
SAINT_CLOTH_INFO_ERR		= 	_t"圣衣信息错误"
SAINT_CLOTH_UPDATE_INFO_ERR	= 	_t"星铸信息错误" 
SAINT_CLOTH_PROF_ERR		= 	_t"守护星座不符,无法装备"
SAINT_CLOTH_GENDER_ERR		= 	_t"性别不符,无法装备"
SAINT_CLOTH_LEV_ERR			=	_t"等级太低,无法装备"
SAINT_CLOTH_COSMOS_ERR		=	_t"小宇宙等级太低,无法装备"
SAINT_CLOTH_ENHANCE_MAX		=	_t"达到星铸等级上限"
SAINT_CLOTH_MONEY_LESS		=	_t"金钱不足"
SAINT_CLOTH_BIND_MONEY_LESS =	_t"金券不足"
BIND_MONEY_LESS_CONFIRM	=	_t"金券不足，以金币补足？"
SAINT_CLOTH_ITEM_LESS		= 	_t"%s不足"
SAINT_CLOTH_OBTAIN_ATTRI	=	_t"^ffffff★星座加持:\r"
ENHANCE_SAINTCLOTHES_SUCC	= 	_t"%s星铸成功, 星铸等级提升为%d"
SAINT_CLOTH_UPGRADE			= 	_t"升格"
SAINT_CLOTH_MAX_LEV_HINT	=	_t"无"
SAINT_CLOTH_ENHANCE_ASSIST_ITEM_NON = _t"(无)"
SAINT_CLOTH_OBTAIN 			=   _t"获得圣衣%s"
SAINT_CLOTH_SKILL_ENHANCE	=	_t"星铸%d级激活"
SAINT_COLOH_ENHANCE_LEVEL_HINT	=	_t"当前星铸等级%d\r祝福值满时圣衣星铸等级获得提升\r祝福值超过%d时星铸有概率触发神恩效果直接升级"
SAINT_CLOTH_BUTTON_IN_ROLE_PANEL_GOT = _t"%s圣衣"
SAINT_CLOTH_BUTTON_IN_ROLE_PANEL_NOT_GOT = _t"选择圣衣"

SAINT_CLOTH_ENHANCE_USE_ITEM_MSG = _t"你有可以使用的%s\r该物品能大大增加星铸的稳定性，需要使用吗？\r也可以在星铸消耗的辅助道具中点击物品图标使用。"
SAINT_CLOTH_ENHANCE_USE_ITEM_MSG_YES = _t"使用"
SAINT_CLOTH_ENHANCE_USE_ITEM_MSG_NO = _t"不使用"

SAINT_CLOTH_ENHANCE_REPLACE_ITEM_MSG = _t"你的%s已用完。\r需要自动换为%s并继续星铸吗？"
SAINT_CLOTH_ENHANCE_REPLACE_ITEM_MSG_YES = _t"更换"
SAINT_CLOTH_ENHANCE_REPLACE_ITEM_MSG_CANCEL = _t"不更换，并继续"
SAINT_CLOTH_ENHANCE_REPLACE_ITEM_MSG_NO = _t"停止星铸"

SAINT_CLOTH_ENHANCE_NO_ITEM_MSG = _t"你的%s已用完。\r是否继续星铸？"
SAINT_CLOTH_ENHANCE_NO_ITEM_MSG_YES = _t"继续"
SAINT_CLOTH_ENHANCE_NO_ITEM_MSG_NO = _t"停止"

ENHANCE_SAINTCLOTHES_ERR2		= 	_t"请求参数错误"
ENHANCE_SAINTCLOTHES_ERR3		= 	_t"已达到星铸等级上限"
ENHANCE_SAINTCLOTHES_ERR4		= 	_t"圣衣不存在"
ENHANCE_SAINTCLOTHES_ERR5		= 	_t"星铸道具错误"
ENHANCE_SAINTCLOTHES_ERR6		= 	_t"辅助道具错误"
ENHANCE_SAINTCLOTHES_ERR7		= 	_t"金钱不足"

ENHANCE_SAINTCLOTHES_CRIT		=	_t"暴击!!!"
ENHANCE_SAINTCLOTHES_PROB		=	_t"神恩!!!"
ENHANCE_SAINTCLOTHES_VAL		=	_t"祝福值+%d"

SATIN_CLOTH_DURA_ZERO_HINT		=   _t"您装备的圣衣[%s]耐久为0，请及时修理"

SAINT_CLOTH_SURPLICE			=	_t"您已冥化圣衣[%s]"
SAINT_CLOTH_UN_SURPLICE			=	_t"您已解除圣衣[%s]的冥化状态"
SAINT_CLOTH_SURPLICE_LEVEL_LESS =	_t"圣衣星铸等级低于%d，无法冥化"
SAINT_CLOTH_SURPLICE_FAIL		=	_t"冥化圣衣失败"
SAINT_CLOTH_UN_SURPLICE_FAIL	=	_t"解除圣衣冥化失败"

local SAINTCLOTH_ENHANCE_SUCCESS = 0
local SAINTCLOTH_ENHANCE_FAIL = 1

function STRING_TABLE:GetSaintClothesEnhanceDes(result,deltaLucky,isCrit,isProb)
	local des = ""
	if result <= SAINTCLOTH_ENHANCE_FAIL then
		if isCrit then des = des .. ENHANCE_SAINTCLOTHES_CRIT end
		if isProb then des = des .. ENHANCE_SAINTCLOTHES_PROB end
		if deltaLucky > 0 then
			des = des .. Format(ENHANCE_SAINTCLOTHES_VAL,deltaLucky)
		end
	else
		des = STRING_TABLE["ENHANCE_SAINTCLOTHES_ERR"..result]
	end
	if des and Len(des) > 0 then
		return des
	end
end


----------------------
--购买物品
BUY_NOT_ENOUGH_MONEY		= _t"购买失败，你没有足够的钱币来支付所选的商品。"
BUY_ITEM_CONFIRM			= _t"确定购买 %s ?"
BUY_ITEM_REPUTATION_LESS1	= _t"购买该物品需要%s声望达到%s"
BUY_ITEM_REPUTATION_LESS2	= _t"购买该物品需要消耗%s声望%s"
BUY_ITEM_LACK				= _t"购买该物品需要 %s×%d"
SELL_NPC_ITEM_CONFIRM		= _t"你确定要出售 %s ^N吗?"
BUY_ITEM_MSG				= _t"购买%d个 %s"
NO_INFERIOR_ITEM_MSG		= _t"没有符合快速出售条件的物品"
SELL_ALL_CONFIRM			= _t"确定出售列表中所有物品?"
BUY_ITEM_CONFIRM_EX			= _t"您确定要购买%s？\r     将消耗： %s\r                   %s"
BUY_ITEM_CONFIRM_BIND		= _t"您确定要购买%s？\r     将消耗： %s\r                   %s\r ^ff0000金券不足, 将使用金币补足"


----------------------
--商城
GSHOP_COUNT					= _t"%d个"
GSHOP_PERMANENT				= _t"永久"
GSHOP_VERSION_ERROR 		= _t"您的客户端版本太低，请更新客户端以取得最新的物品信息。"
GSHOP_BUY_CONFIRM1			= _t"确定购买 %s ?"
GSHOP_BUY_CONFIRM2			= _t"确定购买一组 %s ?"
GSHOP_LACK_MONEY			= _t"星币不足"
GSHOP_LACK_CASH				= _t"星币不足，无法购买，请充值"
GSHOP_LACK_BIND_CASH		= _t"星券不足，无法购买，请充值"
GSHOP_SAFE_LOCK_HINT		= _t"时间锁状态下不能购买物品。"
GSHOP_CARD_RECHARGE_SUCCESS = _t"完美一卡通充值成功，祝您游戏愉快！"
GSHOP_CARD_NUM_LACK			= _t"完美一卡通卡号不能为空，请重新输入！"
GSHOP_CARD_PWD_LACK			= _t"完美一卡通密码不能为空，请重新输入！"
GSHOP_CARD_NUM_ERROR		= _t"完美一卡通卡号不存在，请重新输入！"
GSHOP_CARD_PWD_ERROR		= _t"完美一卡通密码错误，请重新输入！"
GSHOP_CARD_EXPIRED			= _t"该卡已过期，请重新输入！"
GSHOP_EXCHANGE_SRC_TO_DST 	= _t"星币 = %d 星券"
GSHOP_EXCHANGE_SRC_LACK 	= _t"您没有足够的星币进行兑换！"
GSHOP_EXCHANGE_SRC_ZERO 	= _t"兑换星币数目不能为0，请重新输入！"
GSHOP_VIP_REQUEST			= _t"Vip%d级"
--GSHOP_VIP_INFO				= "月度VIP%d级(VIP%d级)"
GSHOP_VIP_INFO				= _t"VIP%d级"
GSHOP_MVIP_LEV				= _t"月度VIP%d级"
GSHOP_VIP_LOW_LEV			= _t"无法购买,需VIP等级达到%d级才可购买此商品"
GSHOP_CRROS_SERV			= _t"当前状态不可用"

-------------------
-- 快捷支付
ADDCASH_SUCCESS                          = _t"订单已经提交，短信校验码已免费发送到手机，请按照短信提示进行操作" 

ADDCASH_ERROR_SUBMIT                     = _t"订单提交失败"  
ADDCASH_ERROR_ACCOUNT                    = _t"账号不存在"   
ADDCASH_ERROR_SERVICE                    = _t"您的账号尚未开通快捷支付功能"  
ADDCASH_ERROR_COMMNICATE                 = _t"网络通信错误，请稍后再次尝试"  
ADDCASH_ERROR_YUANBAO                    = _t"支付元宝数不符合要求"   
ADDCASH_ERROR_ZONE                       = _t"计费区不存在"  
ADDCASH_ERROR_DISCOUNT                   = _t"折扣信息错误"  
ADDCASH_ERROR_OTHER                      = _t"快捷支付发生未知错误，请稍后再次尝试"  

ADDCASH_ERROR_FREQUENT                   = _t"您充值过于频繁，请稍后再次尝试"   
ADDCASH_ERROR_BUSY                       = _t"服务器繁忙，请稍后再次尝试"   
ADDCASH_ERROR_DONOT_SUPPORT              = _t"您的帐号没有绑定相应的代理支付机构"  

GSHOP_CASH_SUPPLIER_LOADING              = _t"正在载入……"
GSHOP_ADD_CASH_CONFIRM_BUTTON            = _t"确认支付"
GSHOP_ADD_CASH_RESEND_COUNTDOWN          = _t"重新发送(%d秒)"
GSHOP_ADD_CASH_RESEND_BUTTON             = _t"重新发送"
GSHOP_ADD_CASH_TO_PASSPORT_BUTTON        = _t"前往官网"
GSHOP_ADD_CASH_ERROR_CASH_NUMBER_INVALID = _t"星币数量只能在%d~%d之间，\r且为10的倍数"
GSHOP_ADD_CASH_ERROR_SUPPLIER_INACTIVE   = _t"您的帐号尚未绑定该代理支付机构，\r请先前往完美世界官网进行绑定"

GSHOP_ADD_CASH_ACTIVATE_CONFIRM          = _t"您的帐号尚未开通快捷支付功能，或者尚未绑定相应的代理支付机构。是否立即前往完美世界官网进行开通？"

----------------------
--快速购买
GSHOP_QUICKBUY_CUR_0 = _t"星币"
GSHOP_QUICKBUY_CUR_1 = _t"星券"
GSHOP_QUICKBUY_CUR_2 = _t"点券"
GSHOP_QUICKBUY_CUR_3 = _t"积分"
GSHOP_QUICKBUY_BUY_NON = _t"您未选择任何商品，请选择相关商品后再进行结算"

----------------------
--交易
TRADE_REQUEST_MSG			= _t"你已向对方发出交易请求，请等待对方回应…"
TRADE_REQUEST_AGREE_MSG 	= _t"%s 请求与你交易，同意交易吗？"
TRADE_REQUEST_FAIL			= _t"%s 谢绝了你的交易请求。"
TRADE_ESTABLISH_FAIL	 	= _t"建立交易失败，请稍后重试。"
TRADE_INVALD_MSG			= _t"当前状态不可交易"
TRADE_PARTNER_END			= _t"对方中止了交易。"
TRADE_COMPLETE 				= _t"交易完成。"
TRADE_COMPLETE_UNNORMAL		= _t"交易非正常结束。"
TRADE_ALERT_MSG 			= _t"对方修改了钱币和交易物品，请在重新锁定后仔细核对。"
TRADE_PACK_FULL	 			= _t"某一方的包裹剩余空间不足，或者携带金钱将超出上限，不能完成交易。请在清理包裹后再尝试交易。"
TRADE_WAIT_CONFIRM			= _t"等待对方点击“交易”按钮确认本次交易…"
TRADE_WAIT_LOCK 			= _t"等待对方点击“锁定”按钮锁定交易物品…"
TRADE_INPUT_OVERFLOW		= _t"输入金钱大于自身携带金钱，是否将携带金钱都作为交易金钱？"
TRADE_ITEM_BIND				= _t"物品已经绑定，无法进行交易"
TRADE_ITEM_LOCKED			= _t"物品已经锁定，无法进行交易"
TRADE_ITEM_NOTALLOW			= _t"物品不可交易"
TRADE_PLAYER_OFFLINE		= _t"对方已离线或者距离太远, 无法建立交易"
TRADE_PLAYER_FAR			= _t"对方距离太远, 无法建立交易"
TRADE_INPUT_MONEY			= _t"输入交易金钱数量"
TRADE_HAS_LOCKED			= _t"已经锁定，不可更改物品"
TRADE_CANCEL_BY_PLAYER		= _t"交易一方取消了交易操作"
TRADE_CANCEL_CANNOT_START	= _t"不能开始交易,交易取消"
TRADE_CANCEL_LONG_TIME		= _t"长时间没有操作，交易取消"
TRADE_CANCEL_ITEM_LOST		= _t"交易的时限物品消失，交易取消"
TRADE_CANCEL_LOG_OUT		= _t"交易一方下线，交易取消"


----------------------
--摆摊
CANT_DESTROY_IN_BOOTH 		= _t"摆摊兜售时不能销毁物品"
BOOTHSELL					= _t"^FFEABD%d:%02d %s购买了%d个%s%s，你获得%s，其中扣除税金%s"
BOOTHBUY					= _t"^FFEABD%d:%02d %s卖给你%d个%s%s，总价%s"
BOOTH_PLAYER_MSG			= _t"%s在^FFEABD%d:%02d分留言：%s"
BOOTH_EQUIP_WARN			= _t"您不能直接出售装备在身上的装备和饰品,请先移动到包裹栏中再进行出售操作。"
BOOTH_HOST_HEADER	 		= _t"^ffcb4a%s^ffffff 的摊位"
BOOTH_HOST_BUY_MONEY_LESS	= _t"收购物品金钱>玩家携带金钱"
BOOTH_BUY_MONEY_LESS		= _t"购买失败，你没有足够的钱币来支付所选的商品。"
BOOTH_SELL_CONFIRM			= _t"物品出售后将无法购回。确认出售吗？"
BOOTH_SELL_MONEY_OVERFLOW	= _t"总售价超出可携带钱币上限"
BOOTH_HOST_MONEY_LESS_ERROR	= _t"钱币不足以收购，无法开业"
BOOTH_CANCEL_CONFIRM		= _t"确定退出营业?"
BOOTH_ITEM_BIND				= _t"物品已经绑定，无法进行交易"
BOOTH_ITEM_LOCKED			= _t"物品已经锁定，无法进行交易"
BOOTH_ITEM_NOTALLOW			= _t"物品不可交易"
BOOTH_ITEM_EXPIRE_BUY_ERROR	= _t"不能收购时效性物品"
BOOTH_ITEM_EXPIRE_SELL_ERROR= _t"不能出售时效性物品"
BOOTH_ITEM_WRONG_QUALITY	= _t"物品的品质不符"
BOOTH_PRECINCT_FORBID		= _t"此区域禁止摆摊"
BOOTH_IN_UNSAFE_AREA 		= _t"只有在安全区才能设置摊位"
BOOTH_WHEN_FIGHTING			= _t"战斗状态下无法设置摊位"
BOOTH_WHEN_MOVING			= _t"移动中无法设置摊位"
BOOTH_WHEN_CROSS_SERVER		= _t"跨服中无法设置摊位"
BOOTH_WHEN_PVP				= _t"决斗中无法设置摊位"
BOOTH_START_DUTY_CONFIRM	= _t"您没有在交易区中，所有交易将要收取税率%0.1f%%的交易税。确认要开启摊位吗？\r提示：一线主城的贸易区为摆摊免税区域！"
BOOTH_SELL_DUTY_CONFIRM		= _t"您将获得%s的收入，同时此次交易将会从中收取%s的交易税，确认要出售吗？"
BOOTH_ITEM_NOT_EXIST		= _t"此物品不存在，无法收购"
BOOTH_MONEY_OVERFLOW_AFTER_SELL	= _t"交易后，自己或对方金钱将会超出可携带上限,请重新输入"
BOOTH_TAX					= _t"税率：%.01f%%"
BOOTH_ITEM_NO_MORE_BUY		= _t"收购栏已达到上限，不能再添加更多的物品"
BOOTH_ITEM_NO_MORE_SELL		= _t"出售栏已达到上限，不能再添加更多的物品"
BOOTH_DEFAULT_NAME			= _t"%s的店"
BOOTH_START					= _t"成功开启了摆摊"
BOOTH_MONEY_INPUT_MAX		= _t"金钱超过了系统允许的最大值"
BOOTH_MINI_BAR_TITLE		= _t"摊位最小化"
BOOTH_LINK_TO_BOOTH_AREA	= _t"${npc(1000001,\"寻径至摆摊区\")}"
BOOTH_BIN_CONFIRM			= _t"出售 %s × %d \r 将获得 %s(交易税 %s)"



----------------------
--拍卖相关
STRING_AUCTION_OPEN			= _t"物品 %s 已经开始拍卖"
STRING_AUCTION_CLOSE		= _t"物品 %s 已经取消拍卖"
STRING_AUCTION_BIT			= _t"物品 %s 已经成功竞价"
STRING_AUCTION_BUY			= _t"物品 %s 已经成功购买"
STRING_AUCTION_EXITBIT		= _t"物品 %s 已经取消竞价"
STRING_AUCTION_ERROR101		= _t"无法找到拍卖物品"
STRING_AUCTION_ERROR102		= _t"拍卖物品无效"
STRING_AUCTION_ERROR103		= _t"拍卖物品已经过期"
STRING_AUCTION_ERROR104		= _t"无法发起拍卖,担保费不够"
STRING_AUCTION_ERROR105		= _t"拍卖物品无法拆分拍卖,请拆分之后拍卖"
STRING_AUCTION_ERROR106		= _t"此拍卖已经结束"
STRING_AUCTION_ERROR107		= _t"不能竞拍自己出售的物品"
STRING_AUCTION_ERROR108		= _t"竞拍价格无效"
STRING_AUCTION_ERROR109		= _t"拍卖功能没有开启"
STRING_AUCTION_ERROR110		= _t"无法退出竞拍"
STRING_AUCTION_ERROR111		= _t"只有拍卖者才可以关闭拍卖"
STRING_AUCTION_ERROR112		= _t"无法竞拍,拍卖费用不够"
STRING_AUCTION_ERROR113		= _t"当前参与拍卖数量已达上限，请清空接收仓或等待物品售出"
STRING_AUCTION_NO_LEV		= "-"
STRING_AUCTION_TIME1		= _t"8小时"
STRING_AUCTION_TIME2		= _t"24小时"
STRING_AUCTION_TIME3		= _t"48小时"
AUCTION_BID_MONEY_LOW		= _t"出价不能低于拍卖价格"
AUCTION_BID_MONEY_HIGH		= _t"高于物品一口价，建议以一口价购买"
AUCTION_MAIL_SYSTEM		 	= _t"圣斗士拍卖"
AUCTION_BID_SUCC			= _t"拍卖成功"
AUCTION_BID_CANCEL			= _t"拍卖取消"
AUCTION_BID_OVERTIME		= _t"拍卖超时"
AUCTION_BIT_SUCC			= _t"竞拍成功"
AUCTION_BIT_FAIL			= _t"竞拍失败"
AUCTION_BID_SUCC_TEXT	 	= _t"拍卖编号%d\r　　“%s%s”拍卖成功。\r　　系统已经收取成交金币价格的10％或成交星币价格的5％为交易税。所获金钱见附件。"
AUCTION_BID_CANCEL_TEXT1 	= _t"拍卖编号%d\r　　“%s%s”拍卖取消。\r　　退回物品见附件。"
AUCTION_BID_CANCEL_TEXT2 	= _t"拍卖编号%d\r　　“%s%s”拍卖取消。\r　　退回金钱见附件。"
AUCTION_BID_OVERTIME_TEXT	= _t"拍卖编号%d\r　　“%s%s”拍卖超时。\r　　退回物品见附件。"
AUCTION_BIT_SUCC_TEXT	 	= _t"拍卖编号%d\r　　“%s%s”竞拍成功。\r　　所获物品见附件。"
AUCTION_BIT_FAIL_TEXT 		= _t"拍卖编号%d\r　　“%s%s”竞拍失败。\r　　退回金钱见附件。"
AUCTION_BID_SUCC_INFO	 	= _t"编号%d的%s拍卖出售成功。\r　　收取税金%s^N,获得金钱 %s"
AUCTION_BID_CANCEL_INFO1 	= _t"编号%d的拍卖取消。\r　　退还物品 %s%s"
AUCTION_BID_CANCEL_INFO2 	= _t"编号%d的拍卖取消。\r　　退还金钱 %s"
AUCTION_BID_OVERTIME_INFO	= _t"编号%d的拍卖超时。\r　　退还物品 %s%s"
AUCTION_BIT_SUCC_INFO	 	= _t"编号%d的拍卖竞拍成功。\r　　获得物品 %s%s"
AUCTION_BIT_FAIL_INFO 		= _t"编号%d的拍卖竞拍失败。\r　　退还金钱 %s"
AUCTION_QULITITY0			= _t"全部品质"
AUCTION_QULITITY1			= ITEMQUALITY_COL_1.._t"普通品质"
AUCTION_QULITITY2			= ITEMQUALITY_COL_2.._t"优秀品质"
AUCTION_QULITITY3			= ITEMQUALITY_COL_2.._t"优秀及以上品质"
AUCTION_QULITITY4			= ITEMQUALITY_COL_3.._t"精良品质"
AUCTION_QULITITY5			= ITEMQUALITY_COL_3.._t"精良及以上品质"
AUCTION_QULITITY6			= ITEMQUALITY_COL_4.._t"史诗品质"
AUCTION_QULITITY7			= ITEMQUALITY_COL_4.._t"史诗及以上品质"
AUCTION_QULITITY8			= ITEMQUALITY_COL_5.._t"传说及以上品质"
AUCTION_QULITITY9			= ITEMQUALITY_COL_6.._t"天命及以上品质"
AUCTION_BIN_NOTIFY0			= _t"您竞拍的 %s × %d 已经被一口价买走"
AUCTION_BIN_NOTIFY1			= _t"您参与竞拍的 %s × %d 竞价已经被超过"
AUCTION_OPEN_BIDPRICE_ERR	= _t"起拍价太低"
AUCTION_OPEN_BINPRICE_LOW	= _t"一口价不能低于起拍价"
AUCTION_SEARCH_LIST_EMPTY	= _t"没有符合条件的物品"
AUCTION_ITEM_BIND			= _t"物品已经绑定，无法进行拍卖"
AUCTION_ITEM_LOCKED			= _t"物品已经锁定，无法进行拍卖"
AUCTION_ITEM_NOTALLOW		= _t"物品不允许拍卖"
AUCTION_ITEM_EXPIRE			= _t"物品剩余时间过短，只有超过72小时才可以拍卖"
AUCTION_BIDPRICE_OVERFLOW	= _t"起拍价总价超出玩家携带金钱上限"
AUCTION_BINPRICE_OVERFLOW	= _t"一口价总价超出玩家携带金钱上限"
AUCTION_BINCASH_OVERFLOW	= _t"星币价总价超出玩家携带星币上限"
AUCTION_BID_MONEY_LACK		= _t"竞拍价格大于玩家当前携带金钱"
AUCTION_BID_SELF_ERROR		= _t"不能对自己拍卖的物品出价"
AUCTION_BID_ALREADY			= _t"你已竞拍此物品"
AUCTION_BIN_MONEY_LACK		= _t"一口价价格大于玩家当前携带金钱"
AUCTION_BIN_CASH_LACK		= _t"星币价价格大于玩家当前携带星币数"
AUCTION_BID_HINT			= _t"你已竞拍"
AUCTION_CANNOT_BID			= _t"该物品无法一口价购买"
AUCTION_CANNOT_BID_IN_CASH	= _t"该物品无法用星币购买"
AUCTION_BID_OVER			= _t"竞价被超过"
AUCTION_BID_EXIT_ERROR		= _t"当前为最高竞价者,无法退出拍卖"
AUCTION_BIN_CONFIRM_TITLE	= _t"确认信息："
AUCTION_BIN_CONFIRM			= _t"购买 %s × %d \r 将花费 %s"
AUCTION_BIN_TIME_CONFIRM	= _t"购买 %s × %d \r 将花费 %s\r此物品不是永久物品, 剩余时效:%s"
AUCTION_CHARGE_MONEY_LESS	= _t"托管费不够"
AUCTION_SERCH_MAX_HINT		= _t"搜索超出指定范围,请重新搜索"
AUCTION_SERCH_FILTER_ERROR	= _t"搜索参数有误"

--元宝交易相关
STAR_AUCTION_FORBID				= _t"跨服中, 星币商城无法使用"
STAR_AUCTION_GOLD				= _t"%I64d金币"
STAR_AUCTION_STAR				= _t"%I64d星币"
STAR_AUCTION_GAIN_MONEY_TAX		= _t"收取税金%s^N, 获得 %s"
STAR_AUCTION_GAIN_MONEY	 		= _t"获得 %s"
STAR_AUCTION_SOLD_SUC	 		= _t"出售成功。\r%s"
STAR_AUCTION_EXPIRE_INFO		= _t"星币交易过期。\r退还 %s"
STAR_AUCTION_BUY_CONFIRM_TAX	= _t"购买 ^f00000%s^N \r将花费 ^f0f000%s^N, \r%s"
STAR_AUCTION_BUY_CONFIRM    	= _t"购买 ^f00000%s^N \r将花费 ^f0f000%s^N"
STAR_AUCTION_SELL_CONFIRM		= _t"确定出售：^f00000%s^N\r售价：^f0f000%s^N, 期限：%s"
STAR_AUCTION_SELL_SUCC  		= _t"上架成功"
STAR_AUCTION_LACK_GOLD			= _t"拥有金币不足，无法出售"
STAR_AUCTION_LACK_STAR			= _t"拥有星币不足，无法出售"
STAR_AUCTION_LACK_FEE			= _t"托管费不足，无法出售"
STAR_AUCTION_LACK_CURR			= _t"请选择出售金钱"
STAR_AUCTION_LACK_PRICE			= _t"请输入价格"
STAR_AUCTION_MAIL_FROM  		= _t"星币交易"
STAR_AUCTION_MAIL_SOLD  		= _t"星币交易成功"
STAR_AUCTION_MAIL_EXPIRE		= _t"星币交易过期"
STAR_AUCTION_MAX_CASH			= _t"出售金币的价格最大为2亿星币"
STAR_AUCTION_MAX_MONEY			= _t"出售星币的价格最大为20亿金币"
STAR_AUCTION_TRUSTEE_FEE		= _t"1000"	--托管费
STAR_AUCTION_TRUSTEE_TYP		= _t"1"		--托管货币单位
STAR_AUCTION_ERR_1101			= _t"价格错误，出售金币的价格范围为1-2亿，出售星币的价格范围为1-20亿"
STAR_AUCTION_ERR_1102			= _t"元宝交易未开放"
STAR_AUCTION_ERR_1103			= _t"角色当前状态不可交易"
STAR_AUCTION_ERR_1104			= _t"未找到出售单"
STAR_AUCTION_ERR_1105			= _t"金币不够"
STAR_AUCTION_ERR_1106			= _t"星币不够"
STAR_AUCTION_ERR_1107			= _t"金币超出"
STAR_AUCTION_ERR_1108			= _t"星币超出"
STAR_AUCTION_BROADCAST  		= _t"^ffdf00有玩家出售%s，已经在星币交易商城上架"
STAR_AUCTION_CANCEL				= _t"拍卖取消成功"


------------------------
-- 寻宝网
XUNBAO_MONEY_OVERFLOW = _t"寄售的金钱超过了系统允许的上限"
XUNBAO_PRICE_OVERFLOW = _t"制定的价格超过了系统允许的上限"

XUNBAO_MAIL_SYSTEM	=	_t"圣斗士寻宝天行"
XUNBAO_CANCEL_POST	=	_t"寄售取消"
XUNBAO_POST_EXPIRE	=	_t"寄售过期"
XUNBAO_SOLD			=	_t"寄售成功"
XUNBAO_BUY			=	_t"购买成功"
XUNBAO_POST_FAILED	=	_t"寄售失败"

XUNBAO_CANCEL_POST_TEXT	=	_t"交易编号%I64d\r　　“%s%s”寄售取消。\r  寄售物品/金钱通过附件退还。"
XUNBAO_POST_EXPIRE_TEXT	=	_t"交易编号%I64d\r　　“%s%s”寄售过期。\r  寄售物品/金钱通过附件退还。"
XUNBAO_SOLD_TEXT		=	_t"交易编号%I64d\r　　“%s%s”成功售出。\r  请登录寻宝天行网站查看。"
XUNBAO_BUY_TEXT			=	_t"交易编号%I64d\r　　“%s%s”购买成功。\r  购买到的物品通过附件发放。"
XUNBAO_POST_FAILED_TEXT1	=	_t"交易编号%I64d\r　　“%s%s”寄售失败。\r  退回物品见附件"
XUNBAO_POST_FAILED_TEXT2	=	_t"交易编号%I64d\r　　“%s%s”寄售失败。\r  退回金钱见附件"
XUNBAO_POST_FAILED_TEXT3	=	_t"交易编号%I64d\r　　“%s%s”寄售失败。\r  退回角色"
XUNBAO_BID_SELF_ERROR		= _t"不能购买自己寄售的物品"
XUNBAO_CHARGE_MONEY_LESS	= _t"手续费不够"
XUNBAO_OPEN_BIDPRICE_ERR1	= _t"出售价格应该在10元-100万元之间"
XUNBAO_OPEN_BIDPRICE_ERR2	= _t"出售价格应该在60元-100万元之间"
XUNBAO_BIDPRICE_OVERFLOW	= _t"出售总价超出玩家携带金钱上限"
XUNBAO_POST_MONEY_OVERFLOW	=	_t"寄售的金币加上手续费超过了自己携带的金币数"
XUNBAO_POST_MONEY_SHORT		=	_t"寄售的金币数目出错"
XUNBAO_ITEM_BIND			= _t"物品已经绑定，无法进行寻宝天行交易"
XUNBAO_ITEM_LOCKED			= _t"物品已经锁定，无法进行寻宝天行交易"
XUNBAO_ITEM_NOTALLOW		= _t"物品不允许寻宝天行交易"
XUNBAO_ITEM_EXPIRE			= _t"物品剩余时间过短，只有超过15天才可以寄售寻宝天行"
XUNBAO_SEARCH_LIST_EMPTY	= _t"没有符合条件的物品"
XUNBAO_POST_TO_SB_AGAIN	=   _t"正在获取玩家ID， 请稍后再次尝试"
XUNBAO_COPY_COMMID_ID_SUCCESSFUL	=	_t"成功将商品号复制到剪切板上，你可以在寻宝天行网站上使用"
XUNBAO_COPY_URL_SUCCESSFUL	=	_t"成功将物品链接复制到剪切板上，你可以在寻宝天行网站上使用"

XUNBAO_TIME1				=	_t"1天"
XUNBAO_TIME2				=	_t"2天"
XUNBAO_TIME3				=	_t"3天"
XUNBAO_TIME4				=	_t"4天"
XUNBAO_TIME5				=	_t"5天"
XUNBAO_TIME6				=	_t"6天"
XUNBAO_TIME7				=	_t"7天"
XUNBAO_POSTTYPE1			=	_t"金币"
XUNBAO_POSTTYPE2			=	_t"物品"
XUNBAO_POSTTYPE3			=	_t"宠物"
XUNBAO_POSTTYPE4			=	_t"角色"
XUNBAO_POSTWAY1				=	_t"寄售"
XUNBAO_POSTWAY2				=	_t"寄售并上架"
XUNBAO_STATE_SHOW			=	_t"(公示)"
XUNBAO_STATE_SELL			=	_t"(上架)"
XUNBAO_STATE_POST			=	_t"(寄售)"
XUNBAO_OUT_OF_TIME			=	_t"已到期"
XUNBAO_SELL_ROLE			=	_t"出售角色"
XUNBAO_SELL_ROLE_CONFIRM			=	_t"确定要将当前角色以%d元出售吗？\r^ff0000注:通行证未绑手机则无法上架"
XUNBAO_SELL_ROLE_LEVEL_LOW	=	_t"只有%d级以上的角色才能寄售"
XUNBAO_SELL_ROLE_LEAGUE_CASTE	=	_t"当前是军团长或代理团长，无法寄售角色"
XUNBAO_SELL_ROLE_PK_VALUE	=	_t"当前PK值不为0，无法寄售角色"
XUNBAO_SELL_ROLE_SAFE_LOCK	=	_t"当前安全锁或有物品被锁定且尚未解除，无法寄售角色"
XUNBAO_SELL_ROLE_CROSS_SERVER	=	_t"正在跨服服务器中，无法寄售角色"

STRING_XUNBAO_OPEN			= _t"物品 %s 已经寄售"
STRING_XUNBAO_CLOSE			= _t"物品 %s 已经取消寄售"


STRING_XUNBAO_ERROR1000		= _t"服务器尚未开启寻宝网服务"
STRING_XUNBAO_ERROR1001		= _t"交易序列号耗尽"
STRING_XUNBAO_ERROR1002		= _t"寄售不成功"
STRING_XUNBAO_ERROR1003		= _t"当前不能取消寄售"
STRING_XUNBAO_ERROR1004		= _t"手续费不足"
STRING_XUNBAO_ERROR1005		= _t"公示期时间不对"
STRING_XUNBAO_ERROR1006		= _t"没有找到该寄售项"
STRING_XUNBAO_ERROR1007		= _t"当前服务器繁忙"
STRING_XUNBAO_ERROR1008		= _t"交易序列号不匹配"
STRING_XUNBAO_ERROR1009		= _t"时间戳不对"
STRING_XUNBAO_ERROR1010		= _t"该寄售项已被卖出"
STRING_XUNBAO_ERROR1011		= _t"金钱或者物品交易购买者已经找不到"
STRING_XUNBAO_ERROR1012		= _t"用户id不匹配"
STRING_XUNBAO_ERROR1013		= _t"出售价格应该在10元-100万元之间"
STRING_XUNBAO_ERROR1014		= _t"当前寄售数量以达上限，无法寄售"
STRING_XUNBAO_ERROR1015		= _t"邮箱满"
STRING_XUNBAO_ERROR1016		= _t"买家状态不对"
STRING_XUNBAO_ERROR1017		= _t"角色交易时买家不存在"
STRING_XUNBAO_ERROR1018		= _t"卖家找不到"
STRING_XUNBAO_ERROR1019		= _t"买家条件不合适"
STRING_XUNBAO_ERROR1020		= _t"该角色有正在被寄售的物品"
STRING_XUNBAO_ERROR1021		= _t"有其他角色正在被寄售"
STRING_XUNBAO_ERROR1022		= _t"寄售金币过少，不能低于100万"
STRING_XUNBAO_ERROR1023		= _t"该物品不能寄售"
STRING_XUNBAO_ERROR1024		= _t"角色被封禁"
STRING_XUNBAO_ERROR1025		= _t"角色等级不够"
STRING_XUNBAO_ERROR1026		= _t"角色是军团长或代理团长"
STRING_XUNBAO_ERROR1027		= _t"角色的密码锁或时间锁尚未解除，请全部取消后再寄售"
STRING_XUNBAO_ERROR1028		= _t"角色上仍有物品在锁定状态，请全部解锁后再寄售"
STRING_XUNBAO_ERROR1029		= _t"角色PK值不为0"
STRING_XUNBAO_ERROR1030		= _t"出售价格应该在60元-100万元之间"

----------------------
--掉落物品
ITEMEXPIRED							=	_t" %d个 %s过期消失了"
DESTROY_ITEM						=	_t"销毁了%d个 %s"
MERGE_ITEM							=	_t"合成使用了%d个 %s"
AUTODEL_ITEM						=	_t"%d个 %s由于离开使用区域而消失"
INVENTORY_ITEM_BIND_ON_LOOT_CONFIRM =	_t"物品 %s 在拾取后即被绑定，无法交易给其他人，确定拾取吗？"
ITEM_PICK_UP_ERROR_IS_ROLLING 		=	_t"物品正在等待ROLL点决定归属，无法拾取"
PK_DROP_ITEM						=	_t"由于红名死亡损失%d个 %s"
PACKISFULL							=	_t"你的包裹空间已满" 
MAX_HOLD_LIMITE						=	_t"拾取物品超过携带上限"


----------------------
--Roll点
ROLL_ITEM_PACK_FULL = _t"背包已满，不能进行投点"
ROLL_ITEM_POINT = _t"%d点：%s （&%s&）"
ROLL_ITEM_QUIT = _t"放弃：%s （&%s&）"
ROLL_ITEM_RESULT1 = _t"&%s& 赢得了物品 %s %d点（您：%d点）"
ROLL_ITEM_RESULT2 = _t"&%s& 赢得了物品 %s %d点（您：放弃）"
ROLL_ITEM_ALL_QUIT = _t"所有人都放弃了 %s"



------------------------
-- 通用物品列表
ITEMLIST_UNLOAD_0			= _t"卸下装备"
ITEMLIST_UNLOAD_1			= _t"析出星魂"
ITEMLIST_UNLOAD_2			= _t"析出星魂"
ITEMLIST_UNLOAD_3			= _t"析出宝石"
ITEMLIST_HINT_0				= _t"无满足条件装备"
ITEMLIST_HINT_1				= _t"请通过占星获得星魂"
ITEMLIST_HINT_2				= _t"请通过占星获得星魂"
ITEMLIST_HINT_3				= _t"无满足条件宝石"
ITEMLIST_UPGRADE_3			= _t"宝石升级"




----------------------
--物品操作
HOST_PACK_FULL 				= _t"背包已经装满物品。"
PACK_ITEM_NOTALLOW			= _t"该物品不能存放到仓库中"
STRING_INPUT_NUM_ZERO	  	= _t"输入数量为零,请重新输入"
STRING_INPUT_NUM_ERROR  	= _t"输入数量超出物品数量范围,请重新输入"
STRING_INPUT_MONEY_ZERO  	= _t"输入物品单价为零,请重新输入"
STRING_INPUT_MONEY_ERROR  	= _t"输入物品总价超出可携带金钱上限,请重新输入"
PACK_LOCK_TITLE				= _t"输入仓库锁密码"
PACK_LOCK_PASSWORD			= _t"请输入仓库密码"
WITHDRAW_MONEY				= _t"请输入提取金钱数量"
DEPOSITE_MONEY				= _t"请输入存入金钱数量"
PUTIN_NOTALLOW				= _t"不能放入该物品"

STRING_BAG_NORMAL_TAB		=  _t"普通物品"
STRING_BAG_NORMAL1_TAB		=  _t"普通物品1"
STRING_BAG_NORMAL2_TAB		=  _t"普通物品2"
STRING_BAG_TASK_TAB			=  _t"任务物品"
INVENTORY_BUYBACK_NAME		=  _t"回购"
INVENTORY_HUNGERSELL_NAME	=  _t"限量销售"
INVENTORY_SELL_TAB			=  _t"商品"
INVENTORY_SELL_ITEMREQ  	=  _t"^%06x%s ×%d"
INVENTORY_SELL_REPUREQ1 	=  "^fd7fff%s:^00FF00%s"
INVENTORY_SELL_REPUREQ2 	=  "^fd7fff%s:^FF0000%s"
INVENTORY_SELL_EQUIPDISABLE =  _t"您不能直接出售装备在身上的装备。\r请先移动到包裹栏中再进行出售操作。"

STRING_EQUIP_BIND_CONFIRM   		=  _t"此物品装备后会与使用角色绑定，确定装备吗？"
STRING_ITEM_BIND_CONFIRM			=  _t"此物品使用一次后即成为主人的永久专属绑定品，任何其他人无法获得使用权，确定使用吗？"
STRING_ITEM_DESTORY_MSG				=  _t"你确定要销毁 %s ^N吗?"
STRING_IMPORTANT_ITEM_DESTORY_MSG	=  _t"你确定要销毁 %s ^N吗?\r请输入^ff0000 %s ^N后点击确定。"
STRING_IMPORTANT_CONFIRM_TEXT		=  _t"saintseiya"
STRING_DESTORY_FAIL_MSG				=  _t"输入错误，无法销毁"
STRING_ITEM_DESTORY_FAIL			=  _t"这件物品无法销毁"
STRING_QUICKBAR_HINT				=  _t"可拖动图标至快捷栏，以方便使用"
STRING_SAFE_LOCK_HINT				=  _t"时间锁状态下不能销毁物品。"
STRING_EQUIP_IDENTITY_FAIL			=  _t"这件装备不能鉴定。"
STRING_ITEM_IDENTITY_FAIL   		=  _t"这件物品不能鉴定。"
STRING_ITEM_SELL_FAIL				=  _t"商店谢绝了这件物品，出售失败。"
STRING_ITEM_CANNOT_SELL				=  _t"该物品不允许交易。"
STRING_EQUIPOPER_SUCC_RATE			=  _t"成功率: %d%%"
STRING_ITEM_DESTORY_FAIL_REFINE 	= _t"处于聚能保护的物品不能摧毁"
STRING_ITEM_SELL_FAIL_REFINE 		= _t"处于聚能保护的物品不能卖店"



STF_SELL_LOG				= _t"%s购买了%d个%s。"
STF_SELL_SELLOUT1			= _t"此商品已售完"
STF_SELL_SELLOUT2			= _t"此商品不足"

-- 商店装备修理
STRING_REPAIR_COST_BIND_SURFFICIENT		 = _t"修理需要消耗 %d 金券，是否修理？"
STRING_REPAIR_COST_BIND_GOLD_SURFFICIENT = _t"修理需要消耗 %d 金券，你的金券不足\r可以用金币补足，是否修理？"
STRING_REPAIR_COST_BIND_GOLD_LACK        = _t"修理需要消耗 %d 金券或金币，当前金券或金币不足，无法修理"
STRING_REPAIR_NO_EQUIPS_SAINT            = _t"当前没有需要修理的圣衣或装备"
STRING_REPAIR_NO_SAINT             		 = _t"当前没有需要修理的圣衣"
STRING_REPAIR_NO_EQUIP             		 = _t"当前没有需要修理的装备"
STRING_REPAIR_LABEL_DESC				 = _t"^ff0000%d^ffffff件装备和^ff0000%d^ffffff件圣衣需要修理，出售物品的NPC均可修理"

STRING_EQUIP_MERGE_NOTICE1	=  _t"说明：\r1、只能在同部件之间进行融合\r2、白色装备无法进行融合\r3、牺牲装备等级要小于等于提升装备\r4、牺牲装备如果绑定，融合后的装备也会绑定\r5、已融合的装备再次融合，之前的融合属性会被覆盖"
STRING_EQUIP_MERGE_NOTICE2	=  _t"1，同部件装备才可进行增强融合\r2，融合装备等阶不大于目标装备等阶\r3，融合装备聚能或星能等级大于1级\r4，操作成功融合装备聚能或星能降为0\r"
STRING_EQUIP_MERGE_RESULT1	=  _t"%s 与 %s 融合成功"
STRING_EQUIP_MERGE_ERROR1	=  _t"失败"
STRING_EQUIP_MERGE_ERROR2	=  _t"不是同类型装备"
STRING_EQUIP_MERGE_ERROR3	=  _t"绑定类型不同 (主装备已绑定 副装备未绑定)"
STRING_EQUIP_MERGE_ERROR4	=  _t"^ff0000副装备等级大于主装备等级"
STRING_EQUIP_MERGE_ERROR5	=  _t"副装备不能融合"
STRING_EQUIP_MERGE_ERROR5	=  _t"副装备不能融合"
STRING_EQUIP_MERGE_ERROR5	=  _t"副装备不能融合"
STRING_EQUIP_MERGE_ERROR11	=  STRING_EQUIP_MERGE_ERROR1
STRING_EQUIP_MERGE_ERROR12	=  STRING_EQUIP_MERGE_ERROR2
STRING_EQUIP_MERGE_ERROR13	=  STRING_EQUIP_MERGE_ERROR4
STRING_EQUIP_MERGE_LEVLOW	=  _t"^ff0000装备等阶低于牺牲装备等阶"
STRING_EQUIP_MERGE_POS		=  _t"^ff0000无法进行不同部位之间的装备融合"
STRING_EQUIP_MERGE_FORBID	=  _t"^ff0000该牺牲装备无法进行融合"
STRING_EQUIP_MERGE_CONFIRM	=  _t"%s已经融合过, 再次融合时会覆盖之前的融合属性，是否继续？"
STRING_EQUIP_MERGE_DISAPEAR =  _t"牺牲装备%s会消失，确认融合?"
STRING_EQUIP_MERGE_BIND1	=  _t"牺牲装备%s已绑定，提升装备%s会在融合后绑定，确认融合?"
STRING_EQUIP_MERGE_ENHANCE	=  _t"牺牲装备并未被聚能"
STRING_EQUIP_MERGE_ENHANCE_LEVLOW12	 =  _t"^ff0000装备和牺牲装备聚能等级需要到达12级才可以进行强化融合"
STRING_EQUIP_MERGE_ENHANCE_PERFECT1150 =  _t"^ff0000装备和牺牲装备完美度需要到达1150%才可以进行聚能融合"
STRING_EQUIP_MERGE_BIND2	=  _t"牺牲装备绑定, 所以提升装备%s会在融合后绑定，确认融合?"
STRING_EQUIP_MERGE_RESULT2	=  _t"%s 与 %s 聚能融合成功"

----魔盒(物品分解、升阶)
STRING_MAGIC_BOX_ENABLE 							=	_t"潘多拉魔盒在玩家 %d 级时开启"
STRING_MAGIC_CUBE_ENERGY_PROGRESS 					=	"%d/%d"
STRING_MAGIC_CUBE_ENERGY_NO_ITEM_HINT  				=	_t"当前共有能量 %d 点，充能上限为 %d\r每日上线的前两个小时自动回复能量"
STRING_MAGIC_CUBE_ENERGY_SUIFFICIENT_ITEM_LABEL   	=	"^ffffff%d/^ffffff%d"
STRING_MAGIC_CUBE_ENERGY_INSUIFFICIENT_ITEM_LABEL 	=	"^ff0000%d/^ff0000%d"
STRING_MAGIC_CUBE_ENERGY_COMPOSE_ITEM_HINT  		=	_t"分解需要消耗能量 %d ，当前共有能量 %d 点\r每日上线的前两个小时自动回复能量"
STRING_MAGIC_CUBE_ENERGY_COMBINE_ITEM_HINT  		=	_t"升阶需要消耗能量 %d ，当前共有能量 %d 点"
STRING_MAGIC_CUBE_HINT 								=	"^ff0000%s"
STRING_EQUIP_COMPOSE_FAIL							=	_t"物品分解失败"
STRING_ITEM_COMPOSE_NOUSE							=  	_t"此物品不能拆分"
STRING_EQUIP_COMPOSE_LOCKED 						= 	_t"锁定物品不能拆分"
STRING_ITEM_COMPOSE_NOCOMPOSES  					= 	_t"包裹内没有可以分解的装备"
STRING_ITEM_COMPOSE_HASCOMPOSES 					= 	_t"从包裹中点选一件合适的装备"
STRING_ITEM_MAGICBOX_PACK_NOTEMPTY 					= 	_t"包裹已满,请先清理包裹"
STRING_EQUIP_COMPOSE_SUCC							=  	_t"%s 分解成功"
STRING_EQUIP_COMPOSE_ENABLE							=	_t"材料均有概率获得，可同时获得"
STRING_EQUIP_COMPOSE_LACKENERGY						= 	_t"魔盒能量值不足，无法进行分解"
STRING_EQUIP_COMPOSE_LEVEL_LOW 						=	_t"您的等级不能拆分此物品"
STRING_EQUIP_COMPOSE_HIGH_QUALITY_NOTICE 			=	_t"您将要拆分一个高品质物品，是否继续？"
STRING_EQUIP_COMBINE_ASSIST_NUM_SUFFICIENT   		=	"^ffffff%d/^ffffff%d"
STRING_EQUIP_COMBINE_ASSIST_NUM_INSUFFICIENT 		=	"^ffffff%d/^ff0000%d"
STRING_EQUIP_COMBINE_SUCC_RATE 						=	_t"成功率：%s"
STRING_EQUIP_COMBINE_SUCC	   						=	_t"%s 升阶成功"
STRING_EQUIP_COMBINE_FAILED	   						=	_t"升阶失败"
STRING_EQUIP_COMBINE_NOUSE	   						=	_t"此物品不能升阶" 
STRING_EQUIP_COMBINE_NOCOMBINES						=	_t"包裹内没有可以升阶的装备，灵石、手环、徽章和珠链可以升阶"
STRING_EQUIP_COMBINE_NOCOMBINE 						=	_t"此物品不能升阶"
STRING_EQUIP_COMBINE_LACKENERGY						=	_t"魔盒能量值不足，无法进行升阶"
STRING_EQUIP_COMBINE_LEVEL_LOW 						=	_t"您的等级不能升阶此物品"
STRING_EQUIP_COMBINE_LACKMONEY 						=	_t"金券不足，无法进行升阶"
STRING_EQUIP_COMBINE_LACK_BINDMONEY 				=	_t"^ff0000金券不足，不足部分将消耗金币"
STRING_EQUIP_COMBINE_LACKASSIST						=	_t"辅助物品不足，无法进行升阶"
STRING_EQUIP_COMBINE_SRC_NO_MATCH    				=	_t"待升阶物品不是装备"
STRING_EQUIP_COMBINE_DST_NO_MATCH     				=	_t"新物品不是装备"
STRING_EQUIP_COMBINE_ASSIST_NO_MATCH  				= 	_t"辅助物品不匹配"
STRING_EQUIP_COMBINE_ASSIST_NO_ENOUGH 				=	_t"辅助物品数量不够"
STRING_EQUIP_IMPROVE_NO_IMPROVE  					= 	_t"包裹内没有可以改造的装备"
STRING_EQUIP_IMPROVE_HAS_IMPROVE 					= 	_t"从包裹中点选一件合适的装备"
STRING_EQUIP_IMPROVE_NOUSE							=  	_t"此物品不能改造"
STRING_EQUIP_IMPROVE_MATERIAL_LACK					=  	_t"缺少材料:%s"
STRING_EQUIP_IMPROVE_LOCKITEM_LACK					=  	_t"缺少选择道具:%s"
STRING_EQUIP_IMPROVE_MONEY_LACK						=  	_t"金币不足"
STRING_EQUIP_IMPROVE_ENABLE							=	_t"改造装备，对装备灵纹进行完全重随机"
STRING_EQUIP_IMPROVE_UNBIND_MONEY_NOTICE 			=	_t"您的金券不足，是否以金币补足？"
STRING_EQUIP_IMPROVE_SUCC							=	_t"%s改造成功"
STRING_EQUIP_IMPROVE_FAIL							=	_t"改造失败"
STRING_EQUIP_IMPROVE_ACCEPT_FAIL					=	_t"接受新的灵纹失败"
STRING_EQUIP_IMPROVE_ATTRIBUTE						=	_t"灵纹:%s"
STRING_EQUIP_IMPROVE_ATTRIBUTE_ACCEPT				=	_t"灵纹:%s ---> 灵纹:%s"
STRING_EQUIP_IMPROVE_ACCEPT_CONFIRM					=	_t"使用了^%06x%s^N, 可以选择是否接受新的灵纹?\r灵纹:^%06x%s^N ---> 灵纹:^%06x%s^N"
STRING_EQUIP_IMPROVE_ACCEPT_LOW_CONFIRM				=	_t"灵纹品质下降，真的确认接受吗？"
STRING_EQUIP_IMPROVE_ATTRIBUTE_EMPTY				=	_t"灵纹：（空）"
STRING_EQUIP_IMPROVE_AUTO_LOWER_HINT				=	_t"自动改造目标设定失误, 请重新设定, 该目标会导致灵纹星等掉落或者变化"
STRING_EQUIP_IMPROVE_AUTO_LOWER_MSG					=	_t"设定的目标较低，很有可能会洗掉高星灵纹，是否确认？"
STRING_EQUIP_IMPROVE_AUTO_MAX_HINT					=	_t"当前等级最高了，无法更高了"
STRING_EQUIP_IMPROVE_AUTO_ACCEPT_ITEM_MSG			=	_t"是否使用恢复精华，保证不接受低星的灵纹?"
STRING_ITEM_BIND_NOUSE								= 	_t"此物品不能绑定"
STRING_ITEM_BIND_NO_BIND  							= 	_t"包裹内没有可以绑定的物品"
STRING_ITEM_BIND_HAS_BIND 							= 	_t"从包裹中拖入一件未绑定的物品"
STRING_ITEM_BIND_LACKENERGY							= 	_t"魔盒能量值不足，无法进行绑定"
STRING_ITEM_BIND_ENABLE								=	_t"把未绑定物品变为绑定"
STRING_ITEM_BIND_MAGIC_CONFIRM						= 	_t"确定绑定物品:%s?"
STRING_ITEM_BIND_SUCCESS							= 	_t"%s绑定成功"


----装备聚能(强化)
STRING_EQUIP_ENHANCE_FAIL		=  _t"装备聚能失败"
STRING_EQUIP_ENHANCE_RESULT		=  _t"聚能 %s 成功"
STRING_EQUIP_ENHANCE_POS		=  _t"聚能结晶不能用于该部位"
STRING_EQUIP_ENHANCE_EQUIPLEV	=  _t"聚能结晶不能作用于该等级的装备"
STRING_EQUIP_ENHANCE_ENHANCELEV	=  _t"聚能结晶不能作用于该聚能等级的装备"
STRING_EQUIP_ENHANCE_MONEY		=  _t"金币不足"
STRING_EQUIP_ENHANCE_MAXSLOT	=  _t"聚能结晶最多占8个物品格,可以将物品堆叠在一起,然后再进行装备聚能"
STRING_EQUIP_ENHANCE_BINDERROR	=  _t"已绑定聚能材料不能作用于未绑定装备"
STRING_EQUIP_ENHANCE_MATERIAL_COUNT	=  _t"聚能道具数量不足"
STRING_EQUIP_ENHANCE_EQUIPLEV_SEL	=  _t"聚能第 %d 级"
STRING_EQUIP_REENHANCE_EQUIPLEV_SEL	=  _t"重聚能第 %d 级"
STRING_EQUIP_ENCHANCH_BASIC			=  _t"进入进阶聚能"
STRING_EQUIP_ENCHANCH_SENIOR		=  _t"返回基础聚能"
----强化物品显示颜色
STRING_EQUIP_ENHANCE_DEFAULT_NUM_COLOR	=  "^ffffff%d/^ffffff%d"
STRING_EQUIP_ENHANCE_LACK_NUM_COLOR		=  "^ffffff%d/^ff0000%d"
----强化完美度等
STRING_EQUIP_ENHANCE_PERFECT_MAXEQUIPLEV_DEFAULT_VALUE  = _t"当前完美度：无\r最高聚能等级：无"
STRING_EQUIP_ENHANCE_PERFECT_MAXEQUIPLEV_VALUE 			= _t"当前完美度：+%d ( +%d%% )\r最高聚能等级：+%d"
----激活属性等
STRING_EQUIP_ENHANCE_DEFAULT_VALUE	=  ""
STRING_EQUIP_ENHANCE_INACTIVE_VALUE	=  "+%d(%g%%) %s\r"
STRING_EQUIP_ENHANCE_ACTIVE_VALUE	=  _t"已激活 +%d(%g%%) %s\r"
STRING_EQUIP_ENH_SUIT_CUR_NONE			=  _t"当前：无"
STRING_EQUIP_ENH_SUIT_CUR_DESC			=  _t"当前：%d"
STRING_EQUIP_ENH_SUIT_NXT_DESC			=  _t"下一级：%d"

----强化类型等
STRING_EQUIP_ENHANCE_TYPE_STRING	=  _t"聚能"
STRING_EQUIP_REENHANCE_TYPE_STRING	=  _t"重聚能"
STRING_EQUIP_ENHANCE_EQUIPLEV_ENHANCETYPE_WHOLE = _t"聚能等级%d的\r%s\r%s"
STRING_EQUIP_ENHANCE_EQUIPLEV_ENHANCETYPE_DEFAULT_VALUE = _t"聚能类型：无\r数值：无"
STRING_EQUIP_ENHANCE_EQUIPLEV_ENHANCETYPE_VALUE 		= _t"%s：%d/%d"
STRING_EQUIP_ENHANCE_BOUND_MATERIAL 	= _t"绑定道具不足，以非绑定道具补足，是否继续？"
STRING_EQUIP_ENHANCE_BOUND_EQUIP 		= _t"操作后装备将被绑定,是否继续？"
STRING_EQUIP_ENHANCE_BOUND_AND_SAME_POS_EQUIP = _t"注意：您已拥有一件同部位已聚能装备，可使用“聚能转移”将其属性转移到此装备。\r注意：操作后装备将被绑定，是否继续？\r^ffdf00注意：聚能完美度超过400后无法摧毁和卖出，将始终占据一格背包"
STRING_EQUIP_ENHANCE_SAME_POS_EQUIP = _t"注意：您已拥有一件同部位已聚能装备，可使用“聚能转移”将其属性转移到此装备。是否继续？"

----强化下限石等
STRING_EQUIP_ENHANCE_EXTLIMIT_STONE_PERFECT = _t"本次聚能最低完美度%d" 
STRING_EQUIP_ENHANCE_EXTLIMIT_STONE_MASK_NOFIT = _t"神魔之血部位不符合件装备部位" 
STRING_EQUIP_ENHANCE_EXTLIMIT_STONE_EQUIPLEV_NOFIT = _t"神魔之血等级不符合该装备等级" 
STRING_EQUIP_ENHANCE_EXTLIMIT_STONE_ENHACLVE_NOFIT = _t"神魔之血不符合该装备聚能等级" 
----总属性等
STRING_EQUIP_ENHANCE_TOTAL_PROPERTY_VALUE 	= _t"总属性：%s %d/%d(总完美度%d%%)"
STRING_EQUIP_ENHANCE_CURRENT_PROPERTY_VALUE = _t"本级属性：%s %d/%d(完美度%d%%)"
----重强化提示
STRING_EQUIP_REENHANCE_PROPERTY_VALUE_UP	= _t"^00ff00重聚能：+%d(%s+%d↑) √接受"
STRING_EQUIP_REENHANCE_PROPERTY_VALUE_DOWN	= _t"重聚能：+%d(%s+%d↓) ×放弃"
STRING_EQUIP_REENHANCE_PROPERTY_VALUE_DOWN_CONFIRM	= _t"属性降低就不要接受了吧"

STRING_EQUIP_REENHANCE_PERFECT_MAX			= _t"恭喜你，完美度已达到100，无需再聚能了"
STRING_EQUIP_ENHANCE_TOTAL_PERFECT_POINT 	= _t"完美度: %d/%d"
STRING_EQUIP_ENHANCE_TOTAL_PROPERTY      	= _t"总属性：%s %d"
STRING_EQUIP_ENHANCE_TOTAL_PERFECT_POINT_EX = _t"进阶完美度: %d/%d"
STRING_EQUIP_ENHANCE_TOTAL_PROPERTY_EX      = _t"进阶总属性：%s %d%%"
STRING_EQUIP_ENHANCE_PROPERTY_AND_PERFECT	= _t"^00ff00%s: %d(完美度: %d)"
STRING_EQUIP_ENHANCE_PROPERTY_AND_PERFECT_EX= _t"^00ff00%s: %d%%(完美度: %d)"
STRING_EQUIP_ENHANCE_NO_ENHANCABLE_EQUIPS 	= _t"您当前没有可以聚能的装备！"
STRING_EQUIP_ENHANCE_PERFECT_HINT 			= _t"9件聚能激活完美度"
STRING_EQUIP_ENHANCE_PERFECT_HINT_EX 		= _t"9件进阶聚能激活完美度"

----强化转移相关
STRING_EQUIP_ENHANCE_TRANSFER_BOUND     = _t"%s 装备将会绑定，是否继续？"
STRING_EQUIP_ENHANCE_TRANSFER_COVER     = _t"目标装备 %s 聚能属性将被覆盖，是否继续？"
STRING_EQUIP_SUIT_TRANSFER_COVER     	= _t"目标装备 %s 的 \r^%06x灵纹:%s^N^ff0000 将消失^N\r被覆盖为^%06x灵纹:%s^N，是否继续？"

STRING_EQUIP_ENHANCE_FAIL_JEWELRY		=  _t"饰品升星失败"
STRING_EQUIP_ENHANCE_RESULT_JEWELRY		=  _t"升星 %s 成功"
STRING_EQUIP_ENHANCE_POS_JEWELRY		=  _t"星能结晶不能用于该饰品"
STRING_EQUIP_ENHANCE_EQUIPLEV_JEWELRY	=  _t"星能结晶不能作用于该等级的饰品"
STRING_EQUIP_ENHANCE_ENHANCELEV_JEWELRY	=  _t"星能结晶不能作用于该星能等级的饰品"
STRING_EQUIP_ENHANCE_MONEY_JEWELRY		=  _t"金币不足"
STRING_EQUIP_ENHANCE_MAXSLOT_JEWELRY	=  _t"星能结晶最多占8个物品格,可以将物品堆叠在一起,然后再进行饰品升星"
STRING_EQUIP_ENHANCE_BINDERROR_JEWELRY	=  _t"已绑定升星材料不能作用于未绑定饰品"

STRING_EQUIP_TRANSFER_NUM								=  	"%d/%d"
STRING_EQUIP_TRANSFER_EQUIP_SRC_LACK 					=  	_t"^ff0000请选择合适的待转移装备"
STRING_EQUIP_TRANSFER_EQUIP_DST_LACK 					=  	_t"^ff0000请选择合适的目标装备"
STRING_EQUIP_TRANSFER_EQUIP_MAXENHANCELEV_SRC_ABOVE_DST =  	_t"^ff0000只能往聚能等级上限相同或者更高的装备上转移"
STRING_EQUIP_TRANSFER_ENHLEV_SRC_BELOW1					=  	_t"^ff0000待转移装备没有聚能，无法转移"
STRING_EQUIP_TRANSFER_ENHLEV_DST_NOT0					=  	_t"^ff0000目标装备聚能等级不为0，无法转移"
STRING_EQUIP_TRANSFER_SUIT_SRC_BELOW1					=  	_t"^ff0000待转移装备没有灵纹"
STRING_EQUIP_TRANSFER_SUIT_DST_NOT0						=  	_t"^ff0000目标装备已经有灵纹，无法转移"
STRING_EQUIP_TRANSFER_SUIT_SRC_UNMIGRATABLE				=  	_t"^ff0000待转移装备不能转移灵纹"
STRING_EQUIP_TRANSFER_SUIT_DST_UNMIGRATABLE				=  	_t"^ff0000目标装备不能转移灵纹"
STRING_EQUIP_TRANSFER_BOUND_BOTH						=  	_t"^00ff00将无损转移所有的聚能属性和符文属性\r         待转移装备将恢复原状态\r               目标装备将绑定"    
STRING_EQUIP_TRANSFER_BOUND_ENHANCE						=  	_t"^00ff00将无损转移所有的聚能属性和符文属性\r         待转移装备将恢复原状态\r               目标装备将绑定"    
STRING_EQUIP_TRANSFER_BOUND_SUIT						=  	_t"^00ff00转移灵纹后，目标装备将绑定"    
STRING_EQUIP_TRANSFER_POS								=	_t"^ff0000非同部位，不允许转移"
STRING_EQUIP_TRANSFER_MONEY								=	_t"^ff0000金钱不足，无法转移"
STRING_EQUIP_TRANSFER_FAIL								=	_t"装备聚能转移失败"
STRING_EQUIP_TRANSFER_SUITTAG_FAIL						=	_t"装备灵纹转移失败"
STRING_EQUIP_TRANSFER_RESULT							=	_t"成功将装备 %s 的聚能等级转移到装备 %s"
STRING_EQUIP_TRANSFER_SUITTAG_RESULT					=	_t"成功将装备 %s 的灵纹转移到装备 %s"
STRING_EQUIP_TRANSFER_NEED								=	_t"转移需要 %s × %d"
STRING_EQUIP_TRANSFER_USE_CONFIRM 						=	_t"是否将装备 ^ff0000%s(已装备) ^ffffff的聚能属性转移到装备 ^ff0000%s？"
STRING_EQUIP_TRANSFER_ITEM_LACK							=  	_t"缺少转移道具:%s"

STRING_EQUIP_TRANSFER_LOW1_JEWELRY		=  _t"^ff0000待转移饰品星能等级过低，无法转移"
STRING_EQUIP_TRANSFER_LOW2_JEWELRY		=  _t"^ff0000只能往同档饰品或者高一档饰品上转移"
STRING_EQUIP_TRANSFER_LOW3_JEWELRY		=  _t"^ff0000待转移饰品没有升星，无法转移"
STRING_EQUIP_TRANSFER_LOW4_JEWELRY		=  _t"^ff0000待转移饰品星能等级过低，无法转移"
STRING_EQUIP_TRANSFER_BIND_JEWELRY		=  _t"^ff0000绑定装备不能往非绑定\r的装备上转移星能等级"
STRING_EQUIP_TRANSFER_POS_JEWELRY		=  _t"^ff0000非同部位，不允许转移"
STRING_EQUIP_TRANSFER_MONEY_JEWELRY		=  _t"^ff0000金钱不足，无法转移"
STRING_EQUIP_TRANSFER_FAIL_JEWELRY		=  _t"饰品星能转移失败"
STRING_EQUIP_TRANSFER_RESULT_JEWELRY	=  _t"成功将饰品 %s 的星能等级转移到饰品 %s"
STRING_EQUIP_TRANSFER_NEED_JEWELRY		=  _t"转移需要 %s × %d"

----强化加工相关
STRING_EQUIP_PROCESS_SUCC			=  _t"%s 镶嵌 %s 成功"
STRING_EQUIP_PROCESS_FAIL			=  _t"装备镶嵌失败"
STRING_EQUIP_PROCESS_EQUIPLEV		=  _t"装备等级太低,无法镶嵌符文"
STRING_EQUIP_PROCESS_EQUIPPOS		=  _t"装备位置不符,无法镶嵌符文"
STRING_EQUIP_PROCESS_CONFIRM		=  _t"装备已经镶嵌符文,再次镶嵌将丢失当前符文属性,确定镶嵌?"
STRING_EQUIP_PROCESS_BIND_CONFIRM	=  _t"%s 镶嵌之后会绑定, 是否继续?"
STRING_EQUIP_PROCESS_LACK_EQUIP 	=  _t"请选择镶嵌装备"
STRING_EQUIP_PROCESS_LACK_ASSIST	=  _t"请先选择可用的符文，选择后可用装备将筛选出来"
STRING_EQUIP_PROCESS_ERR_ASSIST 	=  _t"符文物品无效,不能进行镶嵌操作"

STAR_SOUL_LEVUP_BRIGHT_LIMIT 	=  _t"目前星魂石的光泽度已经无法再使用这个升级石进行提升了"
STAR_SOUL_LEVUP_LOW				=  _t"升级石品级过低，无法升级！"
STAR_SOUL_LEVUP_FAIL			=  _t"星魂石升级失败"
STAR_SOUL_LEVUP_RESULT			=  _t"%s 光泽度提升为 %d 点\r"
STAR_SOUL_LEVUP_UPGRADE			=  _t"%s 升为 %d 品\r"
STAR_SOUL_HELP_HINT				=  _t"放入星魂及升级道具，以提升星魂等级\r"

STRING_EQUIP_CHANGE_ITEM		=  _t"缺少消耗物品,无法兑换"
STRING_EQUIP_CHANGE_FORBID		=  _t"该装备无法兑换"
STRING_EQUIP_CHANGE_ERROR		=  _t"装备兑换信息错误, 无法兑换"
STRING_EQUIP_CHANGE_SUCC1		=  _t"装备兑换成功"
STRING_EQUIP_CHANGE_SUCC2		=  _t"装备兑换成功, %s 成功兑换为 %s"
STRING_EQUIP_CHANGE_FAIL		=  _t"装备兑换失败"
STRING_EQUIP_CHANGE_SRC			=  _t"待兑换物品不是装备, 无法兑换"
STRING_EQUIP_CHANGE_DST			=  _t"新物品不是装备，无法兑换"

STRING_EQUIP_ERROR1				=  _t"装备信息错误, 无法装备"
STRING_EQUIP_ERROR2				=  _t"玩家等级低, 无法装备"
STRING_EQUIP_ERROR3				=  _t"玩家小宇宙等级低, 无法装备"
STRING_EQUIP_ERROR4				=  _t"玩家性别不符, 无法装备"
STRING_EQUIP_ERROR5				=  _t"玩家守护星座不符, 无法装备"
STRING_EQUIP_ERROR6				=  _t"玩家圣斗士意志等级低, 无法装备"

----套装激活属性包描述
STRING_EQUIP_SUIT_DESC 	= _t"%s %d阶"
STRING_EQUIP_SUIT_ACTIVE_PACKAGE_DESC 	= "^ffffff%s(%d)\r"
STRING_EQUIP_SUIT_INACTIVE_PACKAGE_DESC = "^a1a3a4%s(%d)\r"


----杂项数值提升道具
STRING_VALUE_INCREASE_REPUTATION_EXCEED_LIMIT	 =  _t"您的声望值已达到上限，不能再使用该物品进行提升"
STRING_VALUE_INCREASE_EXP_EXCEED_LIMIT			 =  _t"您的经验值已达到上限，不能再使用该物品进行提升"
STRING_VALUE_INCREASE_EXP_MAX_LEVEL				 =  _t"您的 %s 已经满级，不能再使用该物品进行提升"
STRING_VALUE_INCREASE_PRODUCE_ENERGY_EXCEED_LIMIT=  _t"您的生产精力值已达到上限，不能再使用该物品进行提升"
STRING_VALUE_INCREASE_CUBE_ENERGY_EXCEED_LIMIT	 =  _t"您的能量值已达到上限，不能再使用该物品进行提升"
STRING_VALUE_INCREASE_LEVEL_NOT_FIT				 =  _t"您的等级与该物品所要求等级不符合，不能使用该物品进行提升"
STRING_VALUE_INCREASE_PRODUCE_EXP_SUCCEED_POSITIVE =  _t"您的 %s 的熟练度提升 %d 点"
STRING_VALUE_INCREASE_PRODUCE_EXP_SUCCEED_NEGATIVE =  _t"您的 %s 的熟练度消耗了 %d 点"
STRING_VALUE_INCREASE_CUBE_ENERGY_SUCCEED_POSITIVE =  _t"魔盒的能量增加了 %d 点"
STRING_VALUE_INCREASE_CUBE_ENERGY_SUCCEED_NEGATIVE =  _t"魔盒的能量减少了 %d 点"
STRING_VALUE_INCREASE_PRODUCE_ENERGY_SUCCEED_POSITIVE =  _t"您的精力值提升了 %d 点"
STRING_VALUE_INCREASE_PRODUCE_ENERGY_SUCCEED_NEGATIVE =  _t"您的精力值降低了 %d 点"
STRING_VALUE_INCREASE_NO_COSMOS =  _t"您还没有开启小宇宙修炼，无法使用此物品"
STRING_VALUE_INCREASE_EXP_NO_LIVING_SKILL =  _t"您还没有学会对应的生产技能，不能使用此物品"
STRING_VALUE_INCREASE_PRODUCE_ENERGY_NO_LIVING_SKILLS =  _t"您还没有学会任何生产技能，不能使用此物品"

PET_CATCHER_TARGET_INVALID = _t"需要选择宠物怪作为目标"
PET_CATCHER_TARGET_TOO_FAR = _t"目标距离过远"
PET_CATCHER_TARGET_LEVEL_TOO_HIGH = _t"目标过于强大，无法捕捉"
PET_CATCHER_TARGET_HP_TOO_HIGH = _t"目标的生命值过高，暂时无法捕捉"

LOTTERY_IS_OPENING = _t"另一个彩票正在开启中"
LOTTERY_PACK_FULL = _t"包裹已满，请清出空位再抽奖"
LOTTERY_OPEN_ERROR_PLAYER_IS_DEAD = _t"死亡状态无法抽取"
LOTTERY_ONE_BUTTON_NAME = _t"抽取"
LOTTERY_ONE_BUTTON_AGAIN_NAME = _t"再抽取"
LOTTERY_TEN_BUTTON_NAME = _t"10连抽"
LOTTERY_TEN_BUTTON_AGAIN_NAME = _t"再10连抽"

LOTTERY_BONUS_LEVEL_1 = _t"恭喜您，获得了%s"
LOTTERY_BONUS_LEVEL_2 = _t"恭喜您，获得了%s"
LOTTERY_BONUS_LEVEL_3 = _t"恭喜您，获得了%s"
LOTTERY_BONUS_LEVEL_4 = _t"您幸运非常，获得了%s"
LOTTERY_BONUS_LEVEL_5 = _t"您的运气爆表了，获得了传说中的%s"
LOTTERY_BONUS_LEVEL_BROADCAST 		= _t"^00ff00%s^ff0000运气爆表，在^00ff00%s^ff0000中获得了传说中的%s"
LOTTERY_BONUS_LEVEL_BROADCAST_NUM 	= _t"^00ff00%s^ff0000运气爆表，在^00ff00%s^ff0000中获得了传说中的%s%d个"
LOTTERY_BONUS_ADD_ITEM_COUT_LEFT = _t"再开启%d次后获得"


--------------------------
--传送物品
TRANSMIT_ITEM_USE_ERR_IN_USE = _t"传送物品正在使用中"
TRANSMIT_ITEM_USE_ERR_HOST_IN_BATTLE = _t"副本中不可使用"
TRANSMIT_ITEM_USE_ERR_NOT_IN_TEAM = _t"玩家不在队伍中"
TRANSMIT_ITEM_USE_ERR_NO_MEMBER_CAN_BE_CALL = _t"当前没有可召唤的队员，请检查队友的在线状态和等级"
TRANSMIT_ITEM_CALL_MEMBER_TIP_TITLE = _t"召唤队友"
TRANSMIT_ITEM_CALL_MEMBER_TIP_0 = _t"%s:^00ff00可召唤"
TRANSMIT_ITEM_CALL_MEMBER_TIP_1 = _t"%s:^a1a3a4离线"
TRANSMIT_ITEM_CALL_MEMBER_TIP_2 = _t"%s:^ff0000等级不足"
TRANSMIT_ITEM_CALL_MEMBER_SERVER_TIP_0 = _t"未知错误"
TRANSMIT_ITEM_CALL_MEMBER_SERVER_TIP_1 = _t"只能在普通场景才能使用"
TRANSMIT_ITEM_CALL_MEMBER_SERVER_TIP_2 = _t"不在队伍中"
TRANSMIT_ITEM_CALL_MEMBER_SERVER_TIP_3 = _t"没有合适的可召唤队友"
TRANSMIT_ITEM_CALL_MEMBER_SERVER_TIP_4 = _t"被队友召唤 传送"
TRANSMIT_ITEM_CALL_MEMBER_SERVER_TIP_5 = _t"使用传送物品成功"
TRANSMIT_ITEM_CALL_MEMBER_RECV_TEXT = _t"队友%s召唤你到\r  【%s (%.0f,%.0f)】"

-----------------------------
--占卜个人运势物品
DIVINING_ITEM_USE_ERR_NO_ITEM = _t"占卜道具不存在"
DIVINING_ITEM_USE_ERR_NO_FRIEND = _t"好友[%s]不存在"
DIVINING_ITEM_USE_ERR_FRIEND_OFFLINE = _t"好友[%s]不在线"

-----------------------------
--占星
COSMOS_SOUL_STAR_GAMBLE_ERR_4 = _t"小宇宙未激活"
COSMOS_SOUL_STAR_GAMBLE_ERR_6 = _t"小宇宙潜力值不够"
COSMOS_SOUL_STAR_GAMBLE_ERR_7 = _t"小宇宙包裹已满，请融合或者镶嵌星魂，以留出空位"
COSMOS_SOUL_STAR_GAMBLE_ERR_8 = _t"使用占星道具出错"
COSMOS						=	_t"小宇宙"
COSMOS_RING_0				=	_t"第五感"
COSMOS_RING_1				=	_t"第六感"
COSMOS_RING_2				=	_t"第七感"
COSMOS_RING_3				=	_t"第八感"
COSMOS_RING_4				=	_t"第九感"
COSMOS_LEVEL				=	_t"小宇宙等级"
COSMOS_PT				=	_t"小宇宙潜能"
SOUL_STAR				=	_t"星魂"

-------------------------
-- 美容道具
CHANGE_PLAYER_APPEARANCE_TITLE = _t"修改外貌"
CHANGE_PLAYER_APPEARANCE_CANCEL = _t"取消"
CHANGE_PLAYER_APPEARANCE_CONFIRM = _t"确认修改"

CHANGE_PLAYER_APPEARANCE_ERROR_FASHION_MODE = _t"请取消时装模式并隐藏头盔后再使用该物品"
CHANGE_PLAYER_APPEARANCE_ERROR_FASHION_EQUIPS = _t"请取下装备中的时装头发和脸，再使用该物品"
CHANGE_PLAYER_APPEARANCE_ERROR_NOT_IN_SANCTUARY = _t"为了您的安全着想，请在安全区中使用该物品"


-- 洗技能道具
ERROR_HOST_LEVEL_LOW	=	_t"角色等级低"
SKILL_CLEANER_CONFIRM	=	_t"您确定要重置当前职业的技能等级吗？\r学习技能花费的经验将100%返还"