---------------------------------------------------------------
--  created:   2013.1.21
--  author:    chenfudun
--
--  GM配置
---------------------------------------------------------------	
	
-- GM配置
GMCMD_CONFIG = {}
GMCMD_CONFIG =
{
     {
      	name = _t"公告(系统发言)",
      	cmd  = "gm_broadcast",
      	id   = 79,
     },
     {
      	name = _t"无敌状态/取消无敌",
      	cmd  = "gm_invincible",
      	id   = 305,
     },
     {
      	name = _t"隐身/取消隐身",
      	cmd  = "gm_invisible",
      	id   = 304,
     },
     {
      	name = _t"拉人",
      	cmd  = "gm_callin_player",
      	id   = 302,
     },
     {
      	name = _t"去玩家身边",
      	cmd  = "gm_moveto_player",
      	id   = 301,
     },
     {
      	name = _t"禁止/解除发言",
      	cmd  = "gm_shutup_role",
      	id   = 362,
     },
     {
      	name = _t"禁止/解除禁止角色登陆",
      	cmd  = "gm_forbid_role",
      	id   = 366,
     },
     {
        name = _t"跳地图",
        cmd  = "gm_goto",
        id   = 317,
     },     
}

function GMCMD_CONFIG:Load_GMCMD_Config()
    if GMCMD_CONFIG ~= nil and type(GMCMD_CONFIG) == "table" then
		  return GMCMD_CONFIG
    end
    
    return nil
end
