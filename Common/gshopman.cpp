/*
 * FILE: gshopman.cpp
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Feng Bo, 2013-2-18
 *
 * HISTORY: 
 *
 * Copyright (c) 2010 Hummingbird Studio, All Rights Reserved.
 */

#include "gshopman.h"
#include <time.h>
#include <sstream>
#include <algorithm>
#include <string.h>
#include "DataPersistUtils.h"

using namespace std;
using namespace DataPersistUtils;

template <class TFirst, class TLast>
static void ZeroDataRange(TFirst& first, TLast& last)
{
	char* pBegin = min((char*)&first, (char*)&last);
	char* pEnd   = max(((char*)&first)+sizeof(TFirst),  ((char*)&last)+sizeof(TLast) );

	char*  pData = pBegin;
	size_t size  = pEnd-pBegin;
	memset(pData, 0, size);
}

///////////////////////////////////////////////////////////////////////////
//	
//	Data save and load
//	
///////////////////////////////////////////////////////////////////////////

namespace DataPersistUtils
{
	static void save_data( FILE* fpBin, GSHOP_CATEGORY& t)
	{
		char* pBuf = &(t.__DATA_BEGIN) + 1;
		size_t sz = &(t.__DATA_END) - &(t.__DATA_BEGIN) - 1;
		fwrite_safe(pBuf, sz, 1, fpBin);

		save_data(fpBin, t.name);
	}

	static void load_data( FILE* fpBin, GSHOP_CATEGORY& t)
	{
		char* pBuf = &(t.__DATA_BEGIN) + 1;
		size_t sz = &(t.__DATA_END) - &(t.__DATA_BEGIN) - 1;
		fread_safe(pBuf, sz, 1, fpBin);	

		load_data(fpBin, t.name);
	}

	static void save_data( FILE* fpBin, gshopman::CategoryMap& t)
	{
		size_t sz = t.size();
		save_data(fpBin, sz);

		gshopman::CategoryMap::iterator it;
		for(it = t.begin(); it != t.end(); ++it)
		{
			save_data(fpBin, it->second);
		}
	}

	static void load_data( FILE* fpBin, gshopman::CategoryMap& t)
	{
		size_t sz = 0;
		load_data(fpBin, sz);

		for(size_t i = 0; i < sz; ++i)
		{
			GSHOP_CATEGORY cat;
			load_data(fpBin, cat);
			t[cat.id] = cat;
		}
	}

	static void save_data( FILE* fpBin, GSHOP_ITEM& t)
	{
		char* pBuf = &(t.__DATA_BEGIN) + 1;
		size_t sz = &(t.__DATA_END) - &(t.__DATA_BEGIN) - 1;
		fwrite_safe(pBuf, sz, 1, fpBin);

		save_data(fpBin, t.name);
		save_data(fpBin, t.icon);
		save_data(fpBin, t.description);
	}

	static void load_data( FILE* fpBin, GSHOP_ITEM& t)
	{
		char* pBuf = &(t.__DATA_BEGIN) + 1;
		size_t sz = &(t.__DATA_END) - &(t.__DATA_BEGIN) - 1;
		fread_safe(pBuf, sz, 1, fpBin);	

		load_data(fpBin, t.name);
		load_data(fpBin, t.icon);
		load_data(fpBin, t.description);
	}

	static void save_data( FILE* fpBin, gshopman::ItemMap& t)
	{
		size_t sz = t.size();
		save_data(fpBin, sz);

		gshopman::ItemMap::iterator it;
		for(it = t.begin(); it != t.end(); ++it)
		{
			save_data(fpBin, it->second);
		}
	}

	static void load_data( FILE* fpBin, gshopman::ItemMap& t)
	{
		size_t sz = 0;
		load_data(fpBin, sz);

		for(size_t i = 0; i < sz; ++i)
		{
			GSHOP_ITEM item;
			load_data(fpBin, item);
			t[item.id] = item;
		}
	}
}

///////////////////////////////////////////////////////////////////////////
//	
//	Implementation of gshopman
//	
///////////////////////////////////////////////////////////////////////////
gshopman::gshopman()
:	m_timestamp(0),
	m_l10n_func(NULL)
{
}

gshopman::~gshopman()
{
}

void gshopman::reset()
{
	m_timestamp = 0;
	m_mapCategories.clear();
	m_mapItems.clear();
	m_mapCategory2Item.clear();
}

bool gshopman::load_bin( const char* szPath )
{
	reset();

	FILE *pFile = fopen(szPath, "rb");
	if(!pFile) return false;

	try
	{
		unsigned int version = 0;
		load_data(pFile, version);

		if(version != GSHOP_DATA_VERSION)
			throw "version mismatch";

		load_data(pFile, m_timestamp);
		load_data(pFile, m_mapCategories);
		load_data(pFile, m_mapItems);

		init_categories();
		init_items();
		load_l10n_text();

		fclose(pFile);
		return true;
	}
	catch (...)
	{
		fclose(pFile);
		return false;
	}
}

bool gshopman::save_bin( const char* szPath )
{
	FILE *pFile = fopen(szPath, "wb");
	if(!pFile) return false;

	try
	{
		unsigned int version = GSHOP_DATA_VERSION;
		save_data(pFile, version);
		unsigned int timestamp = (unsigned int)time(NULL);
		save_data(pFile, timestamp);

		save_data(pFile, m_mapCategories);
		save_data(pFile, m_mapItems);
		fclose(pFile);
		return true;
	}
	catch (...)
	{
		fclose(pFile);
		return false;
	}
}

void gshopman::init_categories()
{
	GSHOP_CATEGORY& root = m_mapCategories[0];

	CategoryMap::iterator it;
	for(it = m_mapCategories.begin(); it != m_mapCategories.end(); ++it)
	{
		GSHOP_CATEGORY& cat = it->second;
		if(cat.id == 0) continue;

		cat.pParent = get_category(cat.parent_id);
	}
}

void gshopman::init_items()
{
	ItemMap::iterator it;
	for(it = m_mapItems.begin(); it != m_mapItems.end(); ++it)
	{
		GSHOP_ITEM& item = it->second;
		if(item.category_id != 0)
		{
			item.pCategory = get_category(item.category_id);
			CategoryItemMap::mapped_type& list = m_mapCategory2Item[item.category_id];
			list.push_back(&item);
		}
	}
}

const gshopman::ItemList& gshopman::get_items_of( int category_id )
{
	static ItemList empty;
	CategoryItemMap::iterator it = m_mapCategory2Item.find(category_id);
	if(it == m_mapCategory2Item.end())
	{
		empty.clear();
		return empty;
	}
	return it->second;
}

void gshopman::load_text( GSHOP_CATEGORY& category )
{
#ifdef _ELEMENTCLIENT
#define LOAD(_name) {\
	ss.str(L"");\
	ss << prefix << L#_name;\
	if(m_l10n_func(text, ss.str().c_str()))\
	{\
		category._name = text;\
	}\
}

	if(!m_l10n_func) return;

	std::wstringstream ss;
	ss << L"treasure_category_" << category.id << L".";
	std::wstring text, prefix;
	prefix = ss.str();

	LOAD(name);

#undef LOAD
#endif
}

void gshopman::load_text( GSHOP_ITEM& item )
{
#ifdef _ELEMENTCLIENT
#define LOAD(_name) {\
	ss.str(L"");\
	ss << prefix << L#_name;\
	if(m_l10n_func(text, ss.str().c_str()))\
	{\
		item._name = text;\
	}\
}
	if(!m_l10n_func) return;

	std::wstringstream ss;
	ss << L"treasure_" << item.id << L".";
	std::wstring text, prefix;
	prefix = ss.str();

	LOAD(name);
	LOAD(description);

#undef LOAD
#endif
}

void gshopman::load_l10n_text()
{
	if(!m_l10n_func) return;

	for(ItemMap::iterator it = m_mapItems.begin(); it != m_mapItems.end(); ++it)
	{
		GSHOP_ITEM& item = it->second;

		load_text(item);
	}

	for(CategoryMap::iterator it = m_mapCategories.begin(); it != m_mapCategories.end(); ++it)
	{
		GSHOP_CATEGORY& category = it->second;

		load_text(category);
	}
}

///////////////////////////////////////////////////////////////////////////
//	
//	Implementation of GSHOP_CATEGORY
//	
///////////////////////////////////////////////////////////////////////////
GSHOP_CATEGORY::GSHOP_CATEGORY() : pParent(NULL)
{
	ZeroDataRange(__DATA_BEGIN, __DATA_END);
}
///////////////////////////////////////////////////////////////////////////
//	
//	Implementation of GSHOP_ITEM
//	
///////////////////////////////////////////////////////////////////////////
GSHOP_ITEM::GSHOP_ITEM()
{
	ZeroDataRange(__DATA_BEGIN, __DATA_END);
}

bool GSHOP_ITEM::operator==( GSHOP_ITEM& rhs ) const
{
	if(memcmp(&__DATA_BEGIN, &rhs.__DATA_BEGIN, (&__DATA_END - &__DATA_BEGIN)) != 0)
		return false;

	if(name != rhs.name) return false;
	if(icon != rhs.icon) return false;
	if(description != rhs.description) return false;

	return true;
}
