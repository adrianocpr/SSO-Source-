/*
 * FILE: DataPersistUtils.cpp
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Feng Bo, 2013-11-5
 *
 * HISTORY: 
 *
 * Copyright (c) 2010 Hummingbird Studio, All Rights Reserved.
 */

#include "DataPersistUtils.h"

namespace DataPersistUtils
{

size_t fread_safe( void *buffer, size_t size, size_t count, FILE *stream )
{
	int ret = fread(buffer, size, count, stream);
	if(size > 0 && count > 0 && ret != count)
		throw "read failed!";

	return ret;
}

size_t fwrite_safe(const void *buffer, size_t size, size_t count, FILE *stream)
{
	int ret = fwrite(buffer, size, count, stream);
	if(size > 0 && count > 0 && ret != count)
		throw "write failed!";

	return ret;
}

///////////////////////////////////////////////////////////////////////////
//	
//	specialize for size_t
//	
///////////////////////////////////////////////////////////////////////////
template<>
void save_data<size_t>( FILE* fpBin, const size_t& t)
{
	unsigned int value = (unsigned int)t;
	fwrite_safe(&value, sizeof(value), 1, fpBin);
}

template<>
void load_data<size_t>( FILE* fpBin, size_t& t)
{
	unsigned int value = 0;
	fread_safe(&value, sizeof(value), 1, fpBin);
	t = value;
}

template<>
void save_data<size_t>( std::ostream& os, const size_t& t)
{
	unsigned int value = (unsigned int)t;
	os.write((char*)&value, sizeof(value));	
}

template<>
void load_data<size_t>( std::istream& is, size_t& t)
{
	unsigned int value = 0;
	is.read((char*)&value, sizeof(value));	
	t = value;
}

///////////////////////////////////////////////////////////////////////////
//	
//	specialize for std::string
//	
///////////////////////////////////////////////////////////////////////////

template<>
void save_data<std::string>( FILE* fpBin, const std::string& t)
{
	size_t sz = t.size();
	save_data(fpBin, sz);

	std::vector<unsigned char> vet(t.begin(), t.end());
	if(sz > 0)
	{
		fwrite_safe(&vet[0], sizeof(unsigned char), sz, fpBin);
	}
}

template<>
void load_data<std::string>( FILE* fpBin, std::string& t)
{
	size_t sz = 0;
	load_data(fpBin, sz);

	if(sz > 0)
	{
		std::vector<unsigned char> buf(sz);
		t.resize(sz);
		fread_safe(&buf[0], sizeof(unsigned char), sz, fpBin);
		std::copy(buf.begin(), buf.end(), t.begin());	
	}
}

template<>
void save_data<std::string>( std::ostream& os, const std::string& t)
{
	size_t sz = t.size();
	save_data(os, sz);

	std::vector<unsigned char> vet(t.begin(), t.end());
	if(sz > 0)
	{
		os.write((char*)&vet[0], sizeof(unsigned char) * sz);
	}
}

template<>
void load_data<std::string>( std::istream& is, std::string& t)
{
	size_t sz = 0;
	load_data(is, sz);

	if(sz > 0)
	{
		std::vector<unsigned char> buf(sz);
		t.resize(sz);
		is.read((char*)&buf[0], sizeof(unsigned char) * sz);
		std::copy(buf.begin(), buf.end(), t.begin());	
	}
}

///////////////////////////////////////////////////////////////////////////
//	
//	specialize for std::wstring
//	
///////////////////////////////////////////////////////////////////////////

template<>
void save_data<std::wstring>( FILE* fpBin, const std::wstring& t)
{
	size_t sz = t.size();
	save_data(fpBin, sz);

	std::vector<unsigned short> vet(t.begin(), t.end());
	if(sz > 0)
	{
		fwrite_safe(&vet[0], sizeof(unsigned short), sz, fpBin);
	}
}

template<>
void load_data<std::wstring>( FILE* fpBin, std::wstring& t)
{
	size_t sz = 0;
	load_data(fpBin, sz);

	if(sz > 0)
	{
		std::vector<unsigned short> buf(sz);
		t.resize(sz);
		fread_safe(&buf[0], sizeof(unsigned short), sz, fpBin);
		std::copy(buf.begin(), buf.end(), t.begin());	
	}
}

template<>
void save_data<std::wstring>( std::ostream& os, const std::wstring& t)
{
	size_t sz = t.size();
	save_data(os, sz);

	std::vector<unsigned short> vet(t.begin(), t.end());
	if(sz > 0)
	{
		os.write((char*)&vet[0], sizeof(unsigned short) * sz);
	}
}

template<>
void load_data<std::wstring>( std::istream& is, std::wstring& t)
{
	size_t sz = 0;
	load_data(is, sz);

	if(sz > 0)
	{
		std::vector<unsigned short> buf(sz);
		t.resize(sz);
		is.read((char*)&buf[0], sizeof(unsigned short) * sz);
		std::copy(buf.begin(), buf.end(), t.begin());	
	}
}

} /* namespace DataPersistUtils */

