/*
 * FILE: globaldataman.h
 *
 * DESCRIPTION: global data loader and manager
 *
 * CREATED BY: Hedi, 2005/7/18
 *
 * HISTORY: 
 *
 * Copyright (c) 2005 Archosaur Studio, All Rights Reserved.
 */

#ifndef _GLOBALDATAMAN_H_
#define _GLOBALDATAMAN_H_

#include "A3DTypes.h"
#include "vector.h"
#include "AAssist.h"
#include "EC_ID64.h"

using namespace abase;

// data and methods for domain
enum DOMAIN_TYPE
{
	DOMAIN_TYPE_NULL = 0,
	DOMAIN_TYPE_3RD_CLASS,
	DOMAIN_TYPE_2ND_CLASS,
	DOMAIN_TYPE_1ST_CLASS,
};

typedef struct _DOMAIN_INFO
{
	int						id;				// id of the domain
	DOMAIN_TYPE				type;			// type of the domain
	int						reward;			// money rewarded per week
	WORD					name[16];		// name of the domain in Unicode

	vector<A3DPOINT2>		verts;			// verts of the surrounding polygon
	vector<int>				faces;			// faces of the surrounding polygon

	A3DPOINT2				center;			// center of the domain, it is the place we put the icon of the faction
	vector<int>				neighbours;		// neighbours of this domain

	// these members will be set at run time
	_INT_64					id_owner;		
	_INT_64					id_challenger1;
	_INT_64					id_challenger2;
	int						battle_time1;
	int						battle_time2;
	_INT_64					id_tempchallenger1;
	_INT_64					id_tempchallenger2;
	int						deposit;
	int						cutoff_time;
	char					color;

} DOMAIN_INFO;

typedef struct _DOMAIN_INFO_SERV
{
	int						id;				// id of the domain
	DOMAIN_TYPE				type;			// type of the domain
	int						reward;			// money rewarded per week
	vector<int>				neighbours;		// neighbours of this domain

} DOMAIN_INFO_SERV;

vector<DOMAIN_INFO> * globaldata_getdomaininfos();
vector<DOMAIN_INFO_SERV> * globaldata_getdomaininfosserver();

#pragma pack(push, GSHOP_ITEM_PACK, 1)
typedef struct _GSHOP_ITEM
{
	unsigned int			id;				// object id of this item
	unsigned int			num;			// number of objects in this item
	char					icon[128];		// icon file path

	struct {
		unsigned int			price;			// price of this item
		unsigned int			time;			// time of duration, 0 means forever
	} buy[1];
	
	unsigned int			props;			// mask of all props, currently from low bit to high bit: 新品、推荐品、促销品

	int						main_type;		// index into the main type array
	int						sub_type;		// index into the sub type arrray
	int						local_id;		// id of this shop item, used only for localization purpose
	int                     reputation_type;// 声望类型(0-63)
	int                     reputation;     // 声望(0-?)

	WORD					desc[512];		// simple description
	WORD					szName[32];		// name of this item to show
} GSHOP_ITEM;
typedef struct _GSHOP_MAIN_TYPE
{
	WORD					szName[64];		// name of this main type
	int						id;				// id of this main type
	vector<AWString>		sub_types;		// sub type name of this main type
} GSHOP_MAIN_TYPE;
#pragma pack(pop, GSHOP_ITEM_PACK)

struct BattleTime { int nDay, nHour, nMin; };

DWORD globaldata_getgshop_timestamp();
vector<GSHOP_ITEM> * globaldata_getgshopitems();
GSHOP_ITEM* globaldata_getgshopitems_by_id(int id);
vector<GSHOP_MAIN_TYPE> * globaldata_getgshopmaintypes();
GSHOP_MAIN_TYPE* globaldata_getgshopmaintype_by_id(int id);

// common interface 
bool globaldata_load_domain(const char*file_name, vector<DOMAIN_INFO> &infos, abase::vector<BattleTime> &vecTime, int	&nTimeMax);
bool globaldata_load();
bool globaldata_save_to(const char * path);
bool globaldata_release();

bool globaldata_loadserver();
bool globaldata_releaseserver();

#endif//_GLOBALDATAMAN_H_
