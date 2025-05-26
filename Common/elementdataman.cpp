#include "elementdataman.h"

#include <stdio.h>
#include <math.h>
#include <time.h>
#include "DataPersistUtils.h"

using namespace abase;
using namespace DataPersistUtils;
namespace Data = DataPersistUtils;

static const unsigned int META_START_MAGIC = 0x3E7A57A7;
static const unsigned int META_END_MAGIC = 0x3E7AED00;

///////////////////////////////////////////////////////////////////////////
//	
//	Data save and load
//	
///////////////////////////////////////////////////////////////////////////
namespace DataPersistUtils
{
	static void save_data( FILE* fpBin, const ElementDataTypeMeta::Entry& t)
	{
		save_data(fpBin, t.name);
		save_data(fpBin, t.offset);
		save_data(fpBin, t.length);
	}

	static void load_data( FILE* fpBin, ElementDataTypeMeta::Entry& t)
	{
		load_data(fpBin, t.name);
		load_data(fpBin, t.offset);
		load_data(fpBin, t.length);
	}

	static void save_data( FILE* fpBin, const ElementDataTypeMeta& t)
	{
		save_data(fpBin, t.id_space);
		save_data(fpBin, t.i18n_bundle);
		save_data(fpBin, t.entries.size());
		for(size_t i = 0; i < t.entries.size(); ++i)
		{
			save_data(fpBin, t.entries[i]);
		}
	}

	static void load_data( FILE* fpBin, ElementDataTypeMeta& t)
	{
		load_data(fpBin, t.id_space);
		load_data(fpBin, t.i18n_bundle);

		size_t sz = 0;
		load_data(fpBin, sz);

		if(sz > 0)
		{
			t.entries.resize(sz);
			for(size_t i = 0; i < t.entries.size(); ++i)
			{
				load_data(fpBin, t.entries[i]);
			}
		}
	}
};

///////////////////////////////////////////////////////////////////////////
//	
// Implementation of elementdataman
//	
///////////////////////////////////////////////////////////////////////////

void eliminate_zero_item(unsigned char * data, size_t stride, size_t count)
{
	unsigned char * d = data;
	unsigned char * p = data;

	for(unsigned int i=0; i<count; i++)
	{
		int flag = *(int *)d;
		if( flag == 0 )
		{
			d += stride;
			continue;
		}

		if( p != d )
			memcpy(p, d, stride);

		d += stride;
		p += stride;
	}

	if( data + stride * count - p )
		memset(p, 0, data + stride * count - p);
}
#define ELIMINATE_ZERO_ITEM(data) eliminate_zero_item((unsigned char*)(data), sizeof((data)[0]), sizeof(data)/sizeof((data)[0]));

void _NormalizeRandom(float* r, int n)
{
	double t=0;
	float * slider = r;
	for(int i=0; i<n; i++)
	{
		t += *slider;
		slider++;
	}
	if(t>0.00001)
	{
		slider = r;
		for(int i=0; i<n; i++)
		{
			*slider = (float)((*slider) / t);
			slider++;
		}
	}
	else
	{
		memset(r, 0, sizeof(float) * n);
		*r = 1.f;
	}
}

void elementdataman::NormalizeRandom( float* r, int n )
{
	_NormalizeRandom(r, n);
}

elementdataman::elementdataman()
{
	l10n_func = NULL;

	for(size_t i = 0; i < DT_MAX; ++i)
	{
		start_ptr_array.push_back(NULL);
		vbase_ptr_array.push_back(NULL);
		type_size_array.push_back(NULL);
	}

	// TODO: DT_TALK_PROC is such a special type. maybe delete it later.
	type_size_array[DT_TALK_PROC] = sizeof(talk_proc*);
	vbase_ptr_array[DT_TALK_PROC] = &talk_proc_array;

#define _INIT_VBASE_PTR_ARRAY(type, lower_case_name)\
	type_size_array[DT_##type] = sizeof(type);\
	vbase_ptr_array[DT_##type] = &lower_case_name##_array;
#define INIT_VBASE_PTR_ARRAY(type, lower_case_name) _INIT_VBASE_PTR_ARRAY(type, lower_case_name)

	_ELEMENT_DATA_BATCH(INIT_VBASE_PTR_ARRAY);
#undef INIT_VBASE_PTR_ARRAY
#undef _INIT_VBASE_PTR_ARRAY

}

elementdataman::~elementdataman()
{
	for(unsigned int i=0; i<talk_proc_array.size(); i++)
	{
		delete talk_proc_array[i];
	}
}

void elementdataman::add_talk(unsigned int id, talk_proc * data)
{
	talk_proc_array.push_back(data);

	unsigned int pos = talk_proc_array.size()-1;
	add_id_index(ID_SPACE_TALK, id, DT_TALK_PROC, pos, &(talk_proc_array[0]));
}

#define DEFINE_ADD_STRUCTURE(type, lower_case_name) \
void elementdataman::add_structure( ID_SPACE space, unsigned int id, type& data ) \
{\
	_add_structure(space, id, data);\
}
_ELEMENT_DATA_BATCH(DEFINE_ADD_STRUCTURE);
#undef DEFINE_ADD_STRUCTURE

void elementdataman::add_id_index(ID_SPACE idspace, unsigned int id, DATA_TYPE type, unsigned int pos, void * start)
{
	if(idspace < 0 || idspace >= ID_SPACE_MAX)
	{
		return;
	}

	IDToLOCATIONMap& map = id_index_map[idspace];

	LOCATION p;
	p.type = type;
	p.pos = pos;
	map[id] = p;
	start_ptr_array[type] = start;
}

unsigned int elementdataman::get_data_id(ID_SPACE idspace, unsigned int index, DATA_TYPE& datatype)
{
	if(idspace < 0 || idspace >= ID_SPACE_MAX)
	{
		datatype = DT_INVALID;
		return 0;
	}

	unsigned int id = 0;
	unsigned int i = 0;
	IDToLOCATIONMap& map = id_index_map[idspace];
	IDToLOCATIONMap::iterator it;
	for(it = map.begin(); it != map.end() && i < index; ++it, ++i) {}
	if(it == map.end())
	{
		datatype = DT_INVALID;
		return 0;
	}
	id = it->first;
	datatype = (it->second).type;

	return id;
}

unsigned int elementdataman::get_first_data_id(ID_SPACE idspace, DATA_TYPE& datatype)
{
	if(idspace < 0 || idspace >= ID_SPACE_MAX)
	{
		datatype = DT_INVALID;
		return 0;
	}

	IDToLOCATIONMap& map = id_index_map[idspace];
	if(map.size() <= 0)
	{
		datatype = DT_INVALID;
		return 0;
	}

	IDToLOCATIONMap::iterator& it = id_index_itr[idspace];
	it = map.begin();
	unsigned int id = it->first;
	datatype = (it->second).type;

	return id;
}

unsigned int elementdataman::get_next_data_id(ID_SPACE idspace, DATA_TYPE& datatype)
{
	if(idspace < 0 || idspace >= ID_SPACE_MAX)
	{
		datatype = DT_INVALID;
		return 0;
	}

	IDToLOCATIONMap& map = id_index_map[idspace];
	IDToLOCATIONMap::iterator& it = id_index_itr[idspace];
	++it;

	if(it == map.end())
	{
		datatype = DT_INVALID;
		return 0;
	}

	datatype = (it->second).type;
	return it->first;
}

unsigned int elementdataman::get_data_num(ID_SPACE idspace)
{
	if(idspace < 0 || idspace >= ID_SPACE_MAX)
	{
		return 0;
	}
	IDToLOCATIONMap& map = id_index_map[idspace];
	return map.size();	
}

DATA_TYPE elementdataman::get_data_type(unsigned int id, ID_SPACE idspace)
{
	if(idspace < 0 || idspace >= ID_SPACE_MAX)
	{
		return DT_INVALID;
	}
	IDToLOCATIONMap& map = id_index_map[idspace];
	IDToLOCATIONMap::iterator it = map.find(id);

	if(it == map.end())
	{
		return DT_INVALID;
	}

	return (it->second).type;
}

const void * elementdataman::get_data_ptr(unsigned int id, ID_SPACE idspace, DATA_TYPE& datatype)
{
	datatype = DT_INVALID;
	if(idspace < 0 || idspace >= ID_SPACE_MAX)
	{
		return NULL;
	}
	IDToLOCATIONMap& map = id_index_map[idspace];
	IDToLOCATIONMap::iterator it = map.find(id);
	if(it == map.end())
	{
		return NULL;
	}

	LOCATION& loc = it->second;
	datatype = loc.type;
	unsigned int pos = loc.pos;

	if(datatype != DT_INVALID)
	{
		char* start = (char*) start_ptr_array[datatype];
		if(datatype == DT_TALK_PROC)
			return (const void*) *(int*)(start + pos * type_size_array[datatype]);
		else
			return start + pos * type_size_array[datatype];
	}

	return NULL;
}

bool elementdataman::setup_hash_map()
{
#define _ADD_HASH_MAP(type, lower_case_name)\
	if(!_setup_hash_map(DT_##type, lower_case_name##_array)) return false;

#define ADD_HASH_MAP(type, lower_case_name) _ADD_HASH_MAP(type, lower_case_name)
	_ELEMENT_DATA_BATCH(ADD_HASH_MAP);

	return true;
#undef ADD_HASH_MAP
#undef _ADD_HASH_MAP
}

int elementdataman::save_data(const char * pathname, bool bForClient/* = false*/)
{
	FILE * file;
	file = fopen(pathname, "wb");
	if(file == NULL) return -1;

	try
	{
		unsigned int version = ELEMENTDATA_VERSION;
		Data::save_data(file, version);
		unsigned int timestamp = (unsigned int)time(NULL);
		Data::save_data(file, timestamp);

		// meta info
		unsigned int meta_magic = META_START_MAGIC;
		Data::save_data(file, meta_magic);

		Data::save_data(file, meta_map.size());
		for(MetaMap::iterator it = meta_map.begin(); it != meta_map.end(); ++it)
		{
			DATA_TYPE key = it->first;
			ElementDataTypeMeta& meta = it->second;

			Data::save_data(file, (unsigned int)key);
			Data::save_data(file, meta);	
		}

		meta_magic = META_END_MAGIC;
		Data::save_data(file, meta_magic);

		// data
		for(size_t i = 1; i < vbase_ptr_array.size(); ++i)
		{
			DATA_TYPE dt = (DATA_TYPE)i;
			if(dt == DT_TALK_PROC) continue;

			vbase* p = vbase_ptr_array[i];
			if(bForClient && export_for_server_set.find(dt) != export_for_server_set.end())
			{
				p->save_empty(this, file);
			}
			else
			{
				p->save(this, file);
			}
		}

		size_t sz = talk_proc_array.size();
		Data::save_data(file, sz);
		for(size_t i=0; i<sz; i++)
			talk_proc_array[i]->save(file);

		fclose(file);
		return 0;
	}
	catch (...)
	{
		fclose(file);
		return -1;
	}
}

int elementdataman::load_data(const char * pathname)
{
	FILE * file;
	file = fopen(pathname, "rb");
	if(file == NULL) return -1;

	try
	{
		unsigned int version = 0;
		Data::load_data(file, version);
		if(version != ELEMENTDATA_VERSION)
			throw "version mismatch";

		unsigned int time = 0;
		Data::load_data(file, time);

		// meta info
		unsigned int meta_magic;
		Data::load_data(file, meta_magic);
		if(meta_magic != META_START_MAGIC)
			throw "informed file.";

		unsigned int sz = 0;
		Data::load_data(file, sz);
		for(size_t i = 0; i < sz; ++i)
		{
			unsigned int key = 0;
			Data::load_data(file, key);

			if(key < 0 || key >= DT_MAX) throw "informed file.";

			ElementDataTypeMeta& meta = meta_map[(DATA_TYPE)key];
			Data::load_data(file, meta);
		}

		meta_magic = 0;
		Data::load_data(file, meta_magic);
		if(meta_magic != META_END_MAGIC)
			throw "informed file.";

		// data
		for(size_t i = 1; i < vbase_ptr_array.size(); ++i)
		{
			DATA_TYPE dt = (DATA_TYPE)i;
			if(dt == DT_TALK_PROC) continue;

			if(vbase_ptr_array[i]->load(this, file) != 0) throw "informed file.";
		}
		
		sz = 0;
		Data::load_data(file, sz);

		for(size_t i = 0; i < sz; ++i)
		{
			talk_proc * tp = new talk_proc;
			tp->load(file);
			add_talk(tp->id_talk, tp);
		}

		if(!setup_hash_map())
		{
			fclose(file);
			return -1;
		}

		fclose(file);
		return 0;
	}
	catch (...)
	{
		fclose(file);
		return -1;
	}
}

bool elementdataman::is_item_type( DATA_TYPE datatype )
{
#define _CASE(type)\
	case DT_##type: return true;
#define CASE(type) _CASE(type)

	switch(datatype)
	{
		_ELEMENT_DATA_BATCH_ITEMS(CASE);

	default:
		break;
	}

	return false;
#undef CASE
#undef _CASE
}

template <class Data>
inline const ITEM_COMMON_PROP* _get_item_common_prop(const Data* data)
{
	return &data->item_common;
}

template <class Data>
inline ITEM_COMMON_PROP* _get_item_common_prop(Data* data)
{
	return &data->item_common;
}

const ITEM_COMMON_PROP* elementdataman::get_item_common_prop( unsigned int id )
{
	DATA_TYPE dt;
	const void* data = get_data_ptr(id, ID_SPACE_ESSENCE, dt);
	if(!data) return NULL;

#define _CASE(type)\
	case DT_##type: return _get_item_common_prop((const type*)data);
#define CASE(type) _CASE(type)

	switch(dt)
	{
		_ELEMENT_DATA_BATCH_ITEMS(CASE);
	default:
		break;
	}

	return NULL;
#undef CASE
#undef _CASE
}

ITEM_COMMON_PROP* elementdataman::get_writable_item_common_prop( DATA_TYPE datatype, void* data )
{
#define _CASE(type)\
	case DT_##type: return _get_item_common_prop((type*)data);
#define CASE(type) _CASE(type)

	switch(datatype)
	{
		_ELEMENT_DATA_BATCH_ITEMS(CASE);
	default:
		break;
	}

	return NULL;
#undef CASE
#undef _CASE
}

DATA_TYPE elementdataman::get_data_type_by_string( const char* type_name )
{
#define _INIT_NAME_MAP(type, lower_case_name)\
	s_type_name_map[#type] = DT_##type;	
#define INIT_NAME_MAP(type, lower_case_name) _INIT_NAME_MAP(type, lower_case_name)

	static TypeNameMap s_type_name_map;
	if(s_type_name_map.size() <= 0)
	{
		_ELEMENT_DATA_BATCH(INIT_NAME_MAP);
	}
#undef INIT_NAME_MAP
#undef _INIT_NAME_MAP

	if(!type_name) return DT_INVALID;

	TypeNameMap::iterator it = s_type_name_map.find(type_name);
	return it == s_type_name_map.end() ? DT_INVALID : it->second;
}

///////////////////////////////////////////////////////////////////////////
//	
//	Prepare data for export
//	
///////////////////////////////////////////////////////////////////////////
template <class Data>
void _prepare_data(Data& data)
{
	return;
}

template <>
void _prepare_data<DROPTABLE_ESSENCE>(DROPTABLE_ESSENCE& data)
{
	int i=0;
	float r[64];
	for(i=0; i<5; i++)	r[i] = data.num_to_drop[i].probability;
	_NormalizeRandom(r, 5);
	for(i=0; i<5; i++)	data.num_to_drop[i].probability = r[i];

	//ELIMINATE_ZERO_ITEM(data.drops);

	for(i=0; i<64; i++)	r[i] = data.drops[i].probability;
	_NormalizeRandom(r, 64);
	for(i=0; i<64; i++)	data.drops[i].probability = r[i];
}

template <>
void _prepare_data<MONSTER_ESSENCE>(MONSTER_ESSENCE& data)
{
	ELIMINATE_ZERO_ITEM(data.reputation);
}

template <>
void _prepare_data<NPC_TASK_IN_SERVICE>(NPC_TASK_IN_SERVICE& data)
{
	ELIMINATE_ZERO_ITEM(data.id_tasks);
}

template <>
void _prepare_data<NPC_TASK_OUT_SERVICE>(NPC_TASK_OUT_SERVICE& data)
{
	ELIMINATE_ZERO_ITEM(data.id_tasks);
}

template <>
void _prepare_data<NPC_TASK_MATTER_SERVICE>(NPC_TASK_MATTER_SERVICE& data)
{
	ELIMINATE_ZERO_ITEM(data.tasks);
}

template <>
void _prepare_data<NPC_TRANSMIT_SERVICE>(NPC_TRANSMIT_SERVICE& data)
{
	ELIMINATE_ZERO_ITEM(data.targets);
}

template <>
void _prepare_data<NPC_LEARN_SKILL_SERVICE>(NPC_LEARN_SKILL_SERVICE& data)
{
	ELIMINATE_ZERO_ITEM(data.id_skill);
}

template <>
void _prepare_data<PARAM_ADJUST_CONFIG>(PARAM_ADJUST_CONFIG& data)
{
	ELIMINATE_ZERO_ITEM(data.level_diff_adjust);
}

template <>
void _prepare_data<MINE_ESSENCE>(MINE_ESSENCE& data)
{
	ELIMINATE_ZERO_ITEM(data.aggros);
}

template <>
void _prepare_data<NPC_WAR_TOWERBUILD_SERVICE>(NPC_WAR_TOWERBUILD_SERVICE& data)
{
	ELIMINATE_ZERO_ITEM(data.build_info);
}

template <>
void _prepare_data<ADDON_PACKAGE_CONFIG>(ADDON_PACKAGE_CONFIG& data)
{
	ELIMINATE_ZERO_ITEM(data.id_addon_prop);
}

template <>
void _prepare_data<INSTANCE_TABLE_CONFIG>(INSTANCE_TABLE_CONFIG& data)
{
	ELIMINATE_ZERO_ITEM(data.instance);
}

template <>
void _prepare_data<NPC_RESETPROP_SERVICE>(NPC_RESETPROP_SERVICE& data)
{
	ELIMINATE_ZERO_ITEM(data.prop_entry);
}

template <>
void _prepare_data<SUITE_ESSENCE>(SUITE_ESSENCE& data)
{
	ELIMINATE_ZERO_ITEM(data.equipments);
}

void elementdataman::prepare_data( DATA_TYPE dt, void* data )
{
	if(!data) return;

#define _CASE(type, lower_case_name)\
	case DT_##type: _prepare_data(*(type*)data); return;
#define CASE(type, lower_case_name) _CASE(type, lower_case_name)

	switch(dt)
	{
		_ELEMENT_DATA_BATCH(CASE);
	default:
		break;
	}
#undef CASE
#undef _CASE
}
