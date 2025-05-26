#ifndef _ELEMENTPCKDIR_H_
#define _ELEMENTPCKDIR_H_


#define  PACK_SCRIPT_INDEX 0
#define  PACK_CONFIG_INDEX 1


// 打包目录
const char * g_szPckDir[][2] = 
{
	"script",        			"package\\script",
	"configs",       			"package\\configs",
	"gfx",           			"package\\gfx",            
	"grasses",       			"package\\grasses",
	"interfaces",    			"package\\interfaces",     	         
	"building",      			"package\\building",       
	"models",        			"package\\models",         
	"sfx",						"package\\sfx",            
	"shaders",					"package\\shaders",        
	"surfaces",					"package\\surfaces",       
	"textures",					"package\\textures",  
	"litmodels",				"package\\litmodels",
	"loddata",					"package\\loddata",
	"maps",						"package\\maps",
	"flash",					"package\\flash",
};


// 不打包目录
const char * g_szNoPckDir[][2] = 
{
	// element files
	"bin", "s",							// s means file must be in the sep files list
	"bin\\microsoft.vc90.crt", "r",		// r means recursive for param 2
	"cursors", "",	
	"data", "",
	"font", "",
	"musics", "r",
	"videos","r",
	"audio","r",	
	"reportbugs", "s",
	"reportbugs\\microsoft.vc90.mfc", "r",
	"gt", "",
	"gt\\bin", "s",
	".", "",
};


// 独立资源
const char * g_szSepFiles[] =
{
	"game.exe",
	"ReportBugs.exe",
	"server.lua",
	"dbghelp.dll",
	"elementskill.dll",
	"ftdriver.dll",
	"ifc22.dll",
	"unicows.dll",
	"zlibwapi.dll",
	"fmodex.dll",
	"D3DCompiler_43.dll",
	"D3DX9_43.dll",
	"gt_updater.exe",
};


#endif
