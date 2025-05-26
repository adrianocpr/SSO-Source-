/*
 * FILE: DataPersistUtils.h
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Feng Bo, 2013-11-5
 *
 * HISTORY: 
 *
 * Copyright (c) 2010 Hummingbird Studio, All Rights Reserved.
 */

#ifndef DATAPERSISTUTILS_H_
#define DATAPERSISTUTILS_H_

#include <stdio.h>
#include <vector>
#include <string>
#include <iostream>

namespace DataPersistUtils
{
	size_t fread_safe(void *buffer, size_t size, size_t count, FILE *stream);
	size_t fwrite_safe(const void *buffer, size_t size, size_t count, FILE *stream);

	///////////////////////////////////////////////////////////////////////////
	//	
	//	Save & Load
	//	
	///////////////////////////////////////////////////////////////////////////
	template<class T>
	void save_data( FILE* fpBin, const T& t)
	{
		fwrite_safe(&t, sizeof(t), 1, fpBin);
	}

	template<class T>
	void load_data( FILE* fpBin, T& t)
	{
		fread_safe(&t, sizeof(t), 1, fpBin);
	}

	template<class T>
	void save_data( std::ostream& os, const T& t)
	{
		os.write((char*)&t, sizeof(t));	
	}

	template<class T>
	void load_data( std::istream& is, T& t)
	{
		is.read((char*)&t, sizeof(t));	
	}

#define DEFINE_SPECIALIZE(_type) \
	template<>\
	void save_data<_type>( FILE* fpBin, const _type& t);\
	template<>\
	void load_data<_type>( FILE* fpBin, _type& t);\
	template<>\
	void save_data<_type>( std::ostream& os, const _type& t);\
	template<>\
	void load_data<_type>( std::istream& is, _type& t);

	DEFINE_SPECIALIZE(size_t);
	DEFINE_SPECIALIZE(std::string);
	DEFINE_SPECIALIZE(std::wstring);

#undef DEFINE_SPECIALIZE
} /* namespace DataPersistUtils */


#endif /* DATAPERSISTUTILS_H_ */
