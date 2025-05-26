// SDSElementDataExporter.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "BaseDataTemplate.h"
#include "BaseDataExp.h"
#include "TaskDataExport.h"
#include <string>
#include <shlwapi.h>
#include "EnumTypes.h"
#include "elementdataman.h"
#include "Treasure.h"
#include "LuaSys.h"
#include "I18N.h"
#include "BaseDataOrg.h"
#include "MemCacheClient.h"
#include <winsock2.h>

#ifndef PATH_MAX
#  define PATH_MAX 512
#endif
using namespace std;


ExportOptions _opts;
static const char* opt_string = "s:l:m:k:epgtcnvh?";

static const option long_opts[] =
{
	{"src", required_argument, NULL, 's'},
	{"lang", required_argument, NULL, 'l'},
	{"memcached", required_argument, NULL, 'm'},
	{"key-prefix", required_argument, NULL, 'k'},
	{"element-data", no_argument, NULL, 'e'},
	{"policy", no_argument, NULL, 'p'},
	{"gshop", no_argument, NULL, 'g'},
	{"task", no_argument, NULL, 't'},
	{"clean", no_argument, NULL, 'c'},
	{"no-cache", no_argument, NULL, 'n'},
	{"verbose", no_argument, NULL, 'v'},
	{"help", no_argument, NULL, 'h'},
	{NULL, no_argument, NULL, 0},
};

void ShowUsage()
{
	const char* usage = "Usage: data-export [Options] <Dest directory>\r\n\r\n"
		"Options:\r\n"
		"-s, --src \t\tSet source path. Default is '.'\r\n"
		"-l, --lang \t\tSet export language. default is 'zh-CN'\r\n"
		"-e, --element-data \t\tExport element data only.\r\n"
		"-p, --policy \t\tExport policy data only.\r\n"
		"-g, --gshop \t\tExport gshop data only.\r\n"
		"-t, --task \t\tExport task data only.\r\n"
		"-m, --memcached \t\tUsing memcached server to boost up export speed. using 127.0.0.1:11211 as default server.\r\n"
		"-k, --key-prefix \t\tSet the prefix of the key which commiting to memcached server. It's useful to solve key conflict problem.\r\n"
		"-c, --clean \t\tClean cached data on memcached server before export.\r\n"
		"-n, -no-cache \t\tNot using memcached server.\r\n"
		"-v, --verbose \t\tShow more information during execution.\r\n"
		"-h, -?, --help \t\tShow usage.\r\n";

	puts(usage);
}

bool InitConfig()
{
	//DEFINE_SCRIPT_CALL_CONTEXT(context, args, results);
	abase::vector<CScriptValue> args, results;
	luaf::AddString(args, "bin/data-export.cfg");
	if(!luaf::CallFunc(args, results, "editor", "load_data_export_config"))
	{
		return false;
	}

	if(results.size() <= 0 || results[0].m_Type != CScriptValue::SVT_ARRAY)
	{
		return false;
	}

	const CScriptValue& cfg = results[0];

	AString server, prefix;
	luaf::GetValue(server, cfg, L"memcached_server", _opts.strMemcachedServer.c_str());
	luaf::GetValue(prefix, cfg, L"memcached_key_prefix", _opts.strKeyPrefix.c_str());

	_opts.strMemcachedServer = server;
	_opts.strKeyPrefix = prefix;
	return true;
}

bool InitMemCached()
{
	WSADATA wsaData;
	int rc = WSAStartup(MAKEWORD(2,0), &wsaData);
	if (rc != 0) {
		printf("Failed to start winsock\n");
		return false;
	}

	if(_opts.bNoCache) return true;

	MemCacheClient* pClient = GetMemCacheClient();
	if(!pClient) return false;

	printf("Using memcached server: %s\n", _opts.strMemcachedServer.c_str());
	if(!pClient->AddServer(_opts.strMemcachedServer.c_str()))
	{
		printf("Using memcached server failed.\n");
	}
	
	if(_opts.bClean)
	{
		printf("Cleaning cached data...\n");
		pClient->FlushAll();
	}
	return true;
}

bool InitI18N()
{
	if(_opts.strLanguage.empty()) 
		return true;

	if(!I18N::Get().Load(_opts.strLanguage.c_str())) return false;
	I18N::Get().SetCurrentLang(_opts.strLanguage.c_str());

	return true;
}

bool InitEnumTypes()
{
	return g_EnumTypes.ReadTypes("BaseData\\EnumTypes.type");
}

bool InitOrgs()
{
	return BaseDataOrgMan::Get().Init(_org_config_path);
}

bool InitIDMan()
{
	return 
		g_BaseIDMan.Load("BaseData\\TemplID.dat") == 0 &&
		g_PathIDMan.Load("BaseData\\PathData.dat") == 0 &&
		g_TextIDMan.Load("BaseData\\TextData.dat") == 0 &&
		g_ExtBaseIDMan.Load("BaseData\\ExtDataID.dat") == 0 &&
		g_TalkIDMan.Load("BaseData\\TalkID.dat") == 0 &&
		g_RecipeIDMan.Load("BaseData\\RecipeID.dat") == 0 &&
		g_ConfigIDMan.Load("BaseData\\ConfigID.dat") == 0;
}

bool Init()
{
	return 
		LuaSysInit() &&
		InitConfig() &&
		InitMemCached() &&
		InitI18N () &&
		InitEnumTypes() &&
		InitOrgs() && 
		InitIDMan();
}

bool Export()
{
	string path = _opts.strDestPath;
	if(_opts.bExportElementData)
	{
		elementdataman dataman;
		if(!LoadAllBaseData(&dataman))
		{
			printf("ElementData template load failed.\n");
			return false;
		}

		string file = path + "\\elements-server.data";
		printf("saving %s...\r\n", file.c_str());
		if(dataman.save_data(file.c_str(), false) != 0)
		{
			printf("saving %s failed...\r\n", file.c_str());
			return false;
		}

		file = path + "\\elements.data";
		printf("saving %s...\r\n", file.c_str());
		if(dataman.save_data(file.c_str(), true) != 0)
		{
			printf("saving %s failed...\r\n", file.c_str());
			return false;
		}

		file = path + "\\path.data";
		printf("saving %s...\r\n", file.c_str());
		if(!g_PathIDMan.Export(file.c_str()))
		{
			printf("saving %s failed...\r\n", file.c_str());
			return false;
		}

		file = path + "\\text.data";
		printf("saving %s...\r\n", file.c_str());
		if(!g_TextIDMan.Export(file.c_str()))
		{
			printf("saving %s failed...\r\n", file.c_str());
			return false;
		}
	}
	if(_opts.bExportPolicy)
	{
		if(!ExportPolicyData((path + "\\aipolicy.data").c_str()))
		{
			printf("Policy data export failed.\n");
			return false;
		}
	}
	if(_opts.bExportGShop)
	{
		string file = path + "\\gshop.data";
		printf("Exporting %s... ", file.c_str());
		CTreasureMan& man = CTreasureMan::Get();
		man.Load();
		if(!man.GetGShopMan().save_bin(file.c_str()))
		{
			printf("FAILED\n");
			return false;
		}
		printf("SUCCESS\n");
	}
	if(_opts.bExportTask)
	{
		if(!ExportTaskData(path.c_str()))
		{
			printf("Task data export failed.\n");
			return false;
		}
	}

	return true;
}

int _tmain(int argc, _TCHAR* argv[])
{
	int ret = 0;

	while (1)
	{
		int this_option_optind = optind ? optind : 1;

		int long_index = -1;
		int c = getopt_long(argc, argv, opt_string, NULL, &long_index);
		if (c == -1)
			break;

		switch (c)
		{
		case 's':	
			if(!PathIsDirectory(optarg))
			{
				printf("Source path %s is not a directory.\r\n", optarg);
				ShowUsage();
				ret = 1;
				goto end;
			}
			_opts.strSrcPath = optarg;
			break;
		case 'l':	
			_opts.strLanguage = optarg;	
			break;
		case 'm':
			_opts.strMemcachedServer = optarg;
			break;
		case 'k':
			_opts.strKeyPrefix = optarg;
			break;
		case 'e':	_opts.bExportElementData = true;	break;
		case 'p':	_opts.bExportPolicy = true;			break;
		case 'g':	_opts.bExportGShop = true;			break;
		case 't':	_opts.bExportTask = true;			break;
		case 'v':	_opts.verbosity++;					break;
		case 'c':	_opts.bClean = true;				break;
		case 'n':	_opts.bNoCache = true;				break;
		case 'h':	// fall through.
		case '?':	ShowUsage(); ret = 1; goto end;		break;
		default:	break;
		}
	}

	if(!_opts.bExportElementData && !_opts.bExportPolicy && !_opts.bExportTask && !_opts.bExportGShop)
	{
		// if nothing to export, then export all by default.
		_opts.bExportElementData = true;
		_opts.bExportPolicy = true;
		_opts.bExportTask = true;
		_opts.bExportGShop = true;
	}

	if(optind < argc)
	{
		const char* dest = argv[optind];
		if(!PathIsDirectory(dest))
		{
			printf("Dest path %s is not a directory.\r\n", dest);
			ShowUsage();
			ret = 1;
			goto end;
		}
		_opts.strDestPath = dest;
	}
	else
	{
		ShowUsage();
		ret = 1;
		goto end;
	}

	if(!_opts.strSrcPath.empty())
	{
		if(!SetCurrentDirectory(_opts.strSrcPath.c_str()))
		{
			printf("Source path %s not exist.", _opts.strSrcPath);
			ret = 1;
			goto end;
		}
	}

	time_t start_time = time(0);

	if(!Init())
	{
		ret = 1;
		goto end;
	}
	bool bSuccess = Export();

	time_t time_used = time(0) - start_time;
	if(bSuccess)
		printf("\nExport successfully in %d seconds.\n", time_used);
	else
		printf("\nExport failed in %d seconds.\n", time_used);

end:
	WSACleanup();
#ifdef _DEBUG
	char c;
	scanf("%c", &c);
#endif
	return ret;
}

