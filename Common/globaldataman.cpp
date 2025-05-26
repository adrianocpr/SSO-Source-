/*
 * FILE: globaldataman.cpp
 *
 * DESCRIPTION: global data loader and manager
 *
 * CREATED BY: Hedi, 2005/7/18
 *
 * HISTORY: 
 *
 * Copyright (c) 2005 Archosaur Studio, All Rights Reserved.
 */

#include "StdAfx.h"
#include <A3DTypes.h>
#include <vector.h>
#include <globaldataman.h>
#include <AWScriptFile.h>
#include <AChar.h>
#include <ALog.h>
#include <AFileImage.h>

static vector<DOMAIN_INFO>			global_domain_infos;
static vector<DOMAIN_INFO_SERV>		global_domain_infos_server;
static vector<GSHOP_ITEM>			global_gshop_items;
static vector<GSHOP_MAIN_TYPE>		global_gshop_maintypes;
static DWORD						global_gshop_timestamp;

typedef hashtab<int, int, _hash_function> MAINTYPE_IDMAP;
static MAINTYPE_IDMAP global_gshop_maintype_id_to_index(128);


vector<DOMAIN_INFO> * globaldata_getdomaininfos()
{
	return &global_domain_infos;
}

vector<DOMAIN_INFO_SERV> * globaldata_getdomaininfosserver()
{
	return &global_domain_infos_server;
}

vector<GSHOP_MAIN_TYPE> * globaldata_getgshopmaintypes()
{
	return &global_gshop_maintypes;
}

GSHOP_MAIN_TYPE * globaldata_getgshopmaintype_by_id(int id)
{
	MAINTYPE_IDMAP::iterator it = global_gshop_maintype_id_to_index.find(id);
	if( it != global_gshop_maintype_id_to_index.end() )
		return &global_gshop_maintypes[*it.value()];

	return NULL;
}

vector<GSHOP_ITEM> * globaldata_getgshopitems()
{
	return &global_gshop_items;
}

GSHOP_ITEM* globaldata_getgshopitems_by_id(int id)
{
	if (id < 0 || id > (int)global_gshop_items.size())
		return NULL;
	return &(global_gshop_items[id]);
}


DWORD globaldata_getgshop_timestamp()
{
	return global_gshop_timestamp;
}
bool globaldata_load_domain(const char*file_name, vector<DOMAIN_INFO> &infos, abase::vector<BattleTime> &vecTime, int	&nTimeMax)
{
	// now load domain info file
	AFileImage domainFile;
	if( !domainFile.Open(file_name, AFILE_OPENEXIST | AFILE_BINARY) )
	{
		a_LogOutput(1, _EA("GlobalData_Load(), Failed to open domain data file"));
		return false;
	}
	
	DWORD dwReadLen;
	int nNumDomains;
	if( !domainFile.Read(&nNumDomains, sizeof(int), &dwReadLen) )
	{
		a_LogOutput(1, _EA("GlobalData_Load(), corrupted domain data file!"));
		return false;
	}

	int i, j;
	for(i=0; i<nNumDomains; i++)
	{
		DOMAIN_INFO		theDomain;
		int				num;

		memset(&theDomain, 0, sizeof(DOMAIN_INFO));
		if( !domainFile.Read(&theDomain.name, 16 * sizeof(WORD), &dwReadLen) )
		{
			a_LogOutput(1, _EA("GlobalData_Load(), corrupted domain data file!"));
			return false;
		}

		if( !domainFile.Read(&theDomain.id, sizeof(int), &dwReadLen) )
		{
			a_LogOutput(1, _EA("GlobalData_Load(), corrupted domain data file!"));
			return false;
		}
		if( !domainFile.Read(&theDomain.type, sizeof(int), &dwReadLen) )
		{
			a_LogOutput(1, _EA("GlobalData_Load(), corrupted domain data file!"));
			return false;
		}
		if( !domainFile.Read(&theDomain.reward, sizeof(int), &dwReadLen) )
		{
			a_LogOutput(1, _EA("GlobalData_Load(), corrupted domain data file!"));
			return false;
		}

		if( !domainFile.Read(&theDomain.center, sizeof(A3DPOINT2), &dwReadLen) )
		{
			a_LogOutput(1, _EA("GlobalData_Load(), corrupted domain data file!"));
			return false;
		}

		if( !domainFile.Read(&num, sizeof(int), &dwReadLen) )
		{
			a_LogOutput(1, _EA("GlobalData_Load(), corrupted domain data file!"));
			return false;
		}
		for(j=0; j<num; j++)
		{
			A3DPOINT2 vert;
			if( !domainFile.Read(&vert, sizeof(A3DPOINT2), &dwReadLen) )
			{
				a_LogOutput(1, _EA("GlobalData_Load(), corrupted domain data file!"));
				return false;
			}
			theDomain.verts.push_back(vert);
		}

		if( !domainFile.Read(&num, sizeof(int), &dwReadLen) )
		{
			a_LogOutput(1, _EA("GlobalData_Load(), corrupted domain data file!"));
			return false;
		}
		for(j=0; j<num * 3; j++)
		{
			int		index;
			if( !domainFile.Read(&index, sizeof(int), &dwReadLen) )
			{
				a_LogOutput(1, _EA("GlobalData_Load(), corrupted domain data file!"));
				return false;
			}
			theDomain.faces.push_back(index);
		}

		if( !domainFile.Read(&num, sizeof(int), &dwReadLen) )
		{
			a_LogOutput(1, _EA("GlobalData_Load(), corrupted domain data file!"));
			return false;
		}
		for(j=0; j<num; j++)
		{
			int		id;
			if( !domainFile.Read(&id, sizeof(int), &dwReadLen) )
			{
				a_LogOutput(1, _EA("GlobalData_Load(), corrupted domain data file!"));
				return false;
			}
			theDomain.neighbours.push_back(id);
		}
		infos.push_back(theDomain);
	}
	// load time list
	int num;
	if( !domainFile.Read(&num, sizeof(int), &dwReadLen) )
	{
		a_LogOutput(1, _EA("GlobalData_Load(), corrupted domain data file!"));
		return false;
	}
	for(i=0; i<num; i++)
	{
		BattleTime theTime;
		if( !domainFile.Read(&theTime, sizeof(BattleTime), &dwReadLen) )
		{
			a_LogOutput(1, _EA("GlobalData_Load(), corrupted domain data file!"));
			return false;
		}
		vecTime.push_back(theTime);
	}
	if( !domainFile.Read(&nTimeMax, sizeof(int), &dwReadLen) )
	{
		a_LogOutput(1, _EA("GlobalData_Load(), corrupted domain data file!"));
		return false;
	}
	domainFile.Close();
	return true;
}
bool globaldata_load()
{
	DWORD dwReadLen;
	int i, j;

	abase::vector<BattleTime> vecTime;
	int	nTimeMax = 0;

	globaldata_load_domain(_EA("Data\\domain.data"), global_domain_infos, vecTime, nTimeMax);

	//// now load gshop items.
	//AFileImage gshopFile;
	//if( !gshopFile.Open(_EA("Data\\gshop.data"), AFILE_OPENEXIST | AFILE_BINARY) )
	//{
	//	a_LogOutput(1, _EA("GlobalData_Load(), Failed to open gshop data file"));
	//	return false;
	//}
	//if( !gshopFile.Read(&global_gshop_timestamp, sizeof(DWORD), &dwReadLen) )
	//{
	//	a_LogOutput(1, _EA("GlobalData_Load(), corrupted gshop file!"));
	//	return false;
	//}
	//int size;
	//if( !gshopFile.Read(&size, sizeof(int), &dwReadLen) )
	//{
	//	a_LogOutput(1, _EA("GlobalData_Load(), corrupted gshop file!"));
	//	return false;
	//}
	//for(i=0; i<size; i++)
	//{
	//	GSHOP_ITEM item;
	//	if( !gshopFile.Read(&item, sizeof(item), &dwReadLen) )
	//	{
	//		a_LogOutput(1, _EA("GlobalData_Load(), corrupted gshop file!"));
	//		return false;
	//	}
	//	global_gshop_items.push_back(item);
	//}
	//int num_main;
	//if( !gshopFile.Read(&num_main, sizeof(int), &dwReadLen) || num_main < 7 )
	//{
	//	a_LogOutput(1, _EA("GlobalData_Load(), corrupted gshop file!"));
	//	return false;
	//}
	//for(i=0; i<num_main; i++)
	//{
	//	GSHOP_MAIN_TYPE main_type;
	//	if( !gshopFile.Read(&main_type.id, sizeof(int), &dwReadLen) )
	//	{
	//		a_LogOutput(1, _EA("GlobalData_Load(), corrupted gshop file!"));
	//		return false;
	//	}
	//	if( !gshopFile.Read(&main_type.szName, sizeof(WORD) * 64, &dwReadLen) )
	//	{
	//		a_LogOutput(1, _EA("GlobalData_Load(), corrupted gshop file!"));
	//		return false;
	//	}
	//	int num_sub;
	//	if( !gshopFile.Read(&num_sub, sizeof(int), &dwReadLen) )
	//	{
	//		a_LogOutput(1, _EA("GlobalData_Load(), corrupted gshop file!"));
	//		return false;
	//	}
	//	for(j=0; j<num_sub; j++)
	//	{
	//		wchar_t szSubName[64];
	//		if( !gshopFile.Read(&szSubName, sizeof(wchar_t) * 64, &dwReadLen) )
	//		{
	//			a_LogOutput(1, _EA("GlobalData_Load(), corrupted gshop file!"));
	//			return false;
	//		}
	//		main_type.sub_types.push_back(szSubName);
	//	}
	//	global_gshop_maintype_id_to_index.put(main_type.id, i);
	//	global_gshop_maintypes.push_back(main_type);
	//}
	//gshopFile.Close();

	if( strstr(GetCommandLineA(), _EA("globalsave")) )
	{
		int	nCount;
		int i;

		FILE * fpServer = NULL;
		fpServer = fopen(_EA("domain.sev"), _EA("wb"));
		if( NULL == fpServer ) return false;
		nCount = global_domain_infos.size();
		fwrite(&nCount, 1, sizeof(int), fpServer);
		// now output server side domain info
		for(i=0; i<nCount; i++)
		{
			DOMAIN_INFO domain_info = global_domain_infos[i];
			fwrite(&domain_info.id, 1, sizeof(int), fpServer);
			fwrite(&domain_info.type, 1, sizeof(int), fpServer);
			fwrite(&domain_info.reward, 1, sizeof(int), fpServer);
			int nNumNeighbours = domain_info.neighbours.size();
			fwrite(&nNumNeighbours, 1, sizeof(int), fpServer);
			for(int j=0; j<nNumNeighbours; j++)
				fwrite(&domain_info.neighbours[j], 1, sizeof(int), fpServer);
		}

		// output time list
		nCount = vecTime.size();
		fwrite(&nCount, sizeof(int), 1, fpServer);
		for(i=0; i<nCount; i++)
			fwrite(&vecTime[i], sizeof(BattleTime), 1, fpServer);
		fwrite(&nTimeMax, sizeof(int), 1, fpServer);

		fclose(fpServer);

		if( !globaldata_loadserver() )
			return false;
		globaldata_releaseserver();
	}

	return true;
}

bool globaldata_save_to(const char * szPath)
{
	FILE * file;
	size_t i, j;
	char szFullPath[MAX_PATH];
	
	// now save gshop items.
	sprintf(szFullPath, _EA("%s%s"), szPath, _EA("data\\gshop.data"));
	DWORD flag = GetFileAttributesA(szFullPath);
	if (flag & FILE_ATTRIBUTE_READONLY) 
	{
		flag ^= FILE_ATTRIBUTE_READONLY;
		SetFileAttributesA(szFullPath,flag);
	}
	file = fopen(szFullPath, _EA("wb"));
	if( NULL == file )
		return false;

	fwrite(&global_gshop_timestamp, 1, sizeof(DWORD), file);
	size_t size = global_gshop_items.size();
	fwrite(&size, 1, sizeof(DWORD), file);
	for(i=0; i<size; i++)
	{
		GSHOP_ITEM item = global_gshop_items[i];
		fwrite(&item, 1, sizeof(item), file);
	}

	int nummain = global_gshop_maintypes.size();
	fwrite(&nummain, 1, sizeof(int), file);

	for(i=0; i<(size_t)nummain; i++)
	{
		const GSHOP_MAIN_TYPE& main_type = global_gshop_maintypes[i];
		fwrite(&main_type.id, sizeof(int), 1, file);
		fwrite(main_type.szName, sizeof(WORD) * 64, 1, file);
		size_t num_sub = main_type.sub_types.size();
		fwrite(&num_sub, sizeof(int), 1, file);
		for(j=0; j<num_sub; j++)
		{
			wchar_t szSubName[64];
			wcscpy(szSubName,main_type.sub_types[j]);
			fwrite(szSubName, sizeof(wchar_t) * 64, 1, file);
		}
	}
	fclose(file);

	return true;
}

bool globaldata_release()
{
	global_domain_infos.clear();
	global_gshop_items.clear();
	global_gshop_maintypes.clear();        

	return true;
}

bool globaldata_loadserver()
{
	FILE * fpServer = NULL;
	int nCount, i;
	
	fpServer = fopen(_EA("domain.sev"), _EA("rb"));
	if( !fpServer )	return false;
	fread(&nCount, 1, sizeof(int), fpServer);
	for(i=0; i<nCount; i++)
	{
		DOMAIN_INFO_SERV domain_info;
		fread(&domain_info.id, 1, sizeof(int), fpServer);
		fread(&domain_info.type, 1, sizeof(int), fpServer);
		fread(&domain_info.reward, 1, sizeof(int), fpServer);
		int nNumNeighbours;
		fread(&nNumNeighbours, 1, sizeof(int), fpServer);
		for(int j=0; j<nNumNeighbours; j++)
		{
			int idNeighbour;
			fread(&idNeighbour, 1, sizeof(int), fpServer);
			domain_info.neighbours.push_back(idNeighbour);
		}
		global_domain_infos_server.push_back(domain_info);
	}
	fclose(fpServer);
	return true;
}

bool globaldata_releaseserver()
{
	global_domain_infos_server.clear();
	return true;
}