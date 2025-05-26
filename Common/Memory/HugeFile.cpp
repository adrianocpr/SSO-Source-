/********************************************************************
	created:	2013/1/5
	author:		liudong
	purpose:    simulate a huge file by a lot of small files.
	Copyright (C) All Rights Reserved
*********************************************************************/
#pragma warning (disable : 4786)
#include <Windows.h>
#include "HugeFile.h"
#include "EC_FileUtility.h"
#include <assert.h>

static const unsigned int WRITE_SMALL_FILE_MAX_SIZE = 1024*1024*1024;

//////////////////////////////////////////////////////////////////////////
// huge_file::small_file
huge_file::small_file::small_file()
{
	file		= NULL;
	length		= 0;
	read_only	= true;
	initial_pos	= 0;
}

bool huge_file::small_file::init(const char* file_name, const bool is_read_only)
{
	close();
	if (!_init(file_name, is_read_only))
	{
		close();
		return false;
	}
	return true;
}

void huge_file::small_file::close()
{
	if (file)
	{
		fclose(file);
		file = NULL;
	}
	length		= 0;
	read_only	= true;
	initial_pos	= 0;
}

bool huge_file::small_file::_init(const char* file_name, const bool is_read_only)
{
	read_only = is_read_only;
	file = fopen(file_name,read_only?"rb":"w+b");
	if (!file)
	{
		assert(read_only);
		return false;
	}
	int result = fseek(file, 0, SEEK_SET);
	if (result)
	{
		assert(0);
		return false;
	}
	const long start_offset = ftell(file);
	if (start_offset<0)
	{
		assert(0);
		return false;
	}
	result = fseek(file, 0, SEEK_END);
	if (result)
	{
		assert(0);
		return false;
	}
	const long end_offset = ftell(file);
	if (end_offset<0)
	{
		assert(0);
		return false;
	}
	if ((end_offset-start_offset)<0)
	{
		assert(0);
		return false;
	}
	initial_pos	= start_offset;
	length		= end_offset-start_offset;
	return true;
}

bool huge_file::small_file::read(void* buffer, const unsigned int start_pos, const unsigned int num_byte)
{
	if (!num_byte)
	{
		assert(0);
		return true;
	}
	if (!buffer || 
		!file || 
		start_pos>=length || 
		(start_pos+num_byte)>length)
	{
		assert(0);
		return false;
	}
	const int result = fseek(file, initial_pos+start_pos, SEEK_SET);
	if (result)
	{
		assert(0);
		return false;
	}
	return CECFileRead(buffer, num_byte, file);
}

bool huge_file::small_file::read_int64(void* buffer, const unsigned __int64 start_pos, const unsigned int num_byte)
{
	return read(buffer, (const unsigned int)start_pos, num_byte);
}


bool huge_file::small_file::write(const void* buffer, const unsigned int start_pos, const unsigned int num_byte)
{
	if (!num_byte)
	{
		assert(0);
		return true;
	}
	if (!buffer || 
		!file || 
		read_only ||
		start_pos>=WRITE_SMALL_FILE_MAX_SIZE || 
		(start_pos+num_byte)>WRITE_SMALL_FILE_MAX_SIZE)
	{
		assert(0);
		return false;
	}
	const int result = fseek(file, initial_pos+start_pos, SEEK_SET);
	if (result)
	{
		assert(0);
		return false;
	}
	if(CECFileWrite(buffer, num_byte, file))
	{
		const unsigned int temp_length = start_pos+num_byte;
		if (temp_length>length)
		{
			length = temp_length;
		}
	}
	return true;
}

bool huge_file::small_file::write_int64(const void* buffer, const unsigned __int64 start_pos, const unsigned int num_byte)
{
	return write(buffer, (const unsigned int)start_pos, num_byte);
}


//////////////////////////////////////////////////////////////////////////
// huge_file
huge_file::huge_file()
{
	m_cur_pos  = 0;
	m_file_len = 0;
	m_read_only= true;
}

void huge_file::close()
{
	if (!m_read_only)
	{
		delete_obsolete_files();
	}
	for (unsigned int i=0; i<m_all_small_file.size(); ++i)
	{
		m_all_small_file[i].close();
	}
	m_all_small_file.clear();

	m_base_file_name = "";
	m_cur_pos  = 0;
	m_file_len = 0;
	m_read_only= true;
}

bool huge_file::open(const char* base_file_name, const bool read_only)
{
	close();
	if (!_open(base_file_name, read_only))
	{
		assert(0);
		close();
		return false;
	}
	return true;
}

bool  huge_file::_open(const char* base_file_name, const bool read_only)
{
	if (!base_file_name || !base_file_name[0])
	{
		assert(0);
		return false;
	}
	m_base_file_name = base_file_name;
	m_read_only = read_only;
	
	if (m_read_only)
	{
		small_file base_file;
		if (!base_file.init(base_file_name,m_read_only))
		{
			return false;
		}
		m_all_small_file.push_back(base_file);
		std::string ext_file_name = get_file_name(m_all_small_file.size());
		while(ext_file_name.length())
		{
			small_file ext_file;
			if (!ext_file.init(ext_file_name.c_str(), m_read_only))
			{
				break;
			}
			m_all_small_file.push_back(ext_file);
			ext_file_name = get_file_name(m_all_small_file.size());
		}
		//check
		for (unsigned int i=1;i<m_all_small_file.size()-1;++i)
		{
			if (m_all_small_file[i].get_length()!=base_file.get_length())
			{
				assert(0);
				return false;
			}
		}
		if (m_all_small_file.size()>1)
		{
			if (m_all_small_file.back().get_length()>base_file.get_length())
			{
				assert(0);
				return false;
			}
		}
		m_file_len = m_all_small_file.back().get_length();
		if (m_all_small_file.size()>1)
		{
			m_file_len += (m_all_small_file.size()-1)*base_file.get_length();
		}
	}else
	{
		small_file base_file;
		if (!base_file.init(base_file_name, m_read_only))
		{
			assert(0);
			return false;
		}
		m_all_small_file.push_back(base_file);
		m_file_len = 0;
		delete_obsolete_files();
	}
	
	return true;	
}

bool huge_file::is_file_exist(const char* file_name)
{
	if (!file_name || !file_name[0])
	{
		assert(0);
		return false;
	}
	FILE* pFile = fopen(file_name,"rb");
	if (!pFile)
	{
		return false;
	}
	fclose(pFile);
	return true;
	
}

std::string huge_file::get_file_name(const unsigned int file_index)
{
	if (!m_base_file_name.length())
	{
		assert(0);
		return false;
	}
	if (!file_index)
	{
		return m_base_file_name;
	}
	std::string ext_file_name = m_base_file_name;
	char temp[128];
	sprintf(temp, "_ext_%d", file_index);
	ext_file_name += temp;
	return ext_file_name;
}

bool huge_file::delete_file(const char* file_name)
{
	if (!file_name || !file_name[0])
	{
		assert(0);
		return false;
	}
	const unsigned int str_len = strlen(file_name);
	char new_file_name[MAX_PATH*2] = {0};
	memcpy(new_file_name,file_name,str_len);
	new_file_name[str_len] = 0;
	new_file_name[str_len+1] = 0;
	
	SHFILEOPSTRUCTA shStruct;
	shStruct.hwnd                  = NULL;
	shStruct.pTo                   = NULL;
	shStruct.fAnyOperationsAborted = NULL;
	shStruct.hNameMappings         = NULL;
	shStruct.lpszProgressTitle     = NULL;
	shStruct.wFunc                 = FO_DELETE;
	shStruct.pFrom                 = new_file_name;
	shStruct.fFlags                = /*FOF_ALLOWUNDO|*/FOF_NOCONFIRMATION;
	const int result = SHFileOperationA(&shStruct);
	if (result)
	{
		assert(0);
		return false;
	}
	return true;
}

void huge_file::delete_file()
{
	if (m_read_only)
	{
		assert(0);
		return ;
	}
	std::vector<std::string> vec_file_name;
	for (unsigned int i=0; i<m_all_small_file.size(); ++i)
	{
		vec_file_name.push_back(get_file_name(i));
	}
	close();
	for (unsigned int i=0; i<vec_file_name.size(); ++i)
	{
		delete_file(vec_file_name[i].c_str());
	}
}

void huge_file::delete_obsolete_files()
{
	if (!m_base_file_name.length() || !m_all_small_file.size() || m_read_only)
	{
		assert(0);
		return ;
	}
	unsigned int to_delete_postfix = m_all_small_file.size();
	while(true)
	{
		std::string ext_file_name = get_file_name(to_delete_postfix);
		if(!ext_file_name.length())
		{
			assert(0);
			break;
		}
		if (!is_file_exist(ext_file_name.c_str()))
		{
			break;
		}
		if (!delete_file(ext_file_name.c_str()))
		{
			assert(0);
			break;
		}
		++to_delete_postfix;
	}
}

bool huge_file::read(void* buffer, const unsigned int num_byte)
{
	if (!_read(buffer, num_byte))
	{
		return false;
	}
	m_cur_pos += num_byte;
	return true;
}

bool huge_file::_read(void* buffer, const unsigned int num_byte)
{
	if (!m_base_file_name.length() || !m_all_small_file.size())
	{
		assert(0);
		return false;
	}
	if (!num_byte)
	{
		assert(0);
		return true;
	}
	if (m_cur_pos>=m_file_len)
	{
		return false;
	}
	if (m_all_small_file.size()==1)
	{
		return m_all_small_file[0].read(buffer, (const unsigned int)m_cur_pos, num_byte);
	}

	const unsigned int SMALL_FILE_MAX_SIZE = m_all_small_file[0].get_length();
	if (!SMALL_FILE_MAX_SIZE)
	{
		assert(0);
		return false;
	}
	const unsigned __int64 start_file_index = m_cur_pos/SMALL_FILE_MAX_SIZE;
	const unsigned __int64 start_file_offset= m_cur_pos%SMALL_FILE_MAX_SIZE;
	const unsigned __int64 end_file_index	= (m_cur_pos+num_byte-1)/SMALL_FILE_MAX_SIZE;
	const unsigned __int64 end_file_offset	= (m_cur_pos+num_byte-1)/SMALL_FILE_MAX_SIZE;
	if (start_file_index==end_file_index)
	{
		return m_all_small_file[(unsigned int)start_file_index].read_int64(buffer, start_file_offset, num_byte);
	}

	if(!m_all_small_file[(unsigned int)start_file_index].read_int64(buffer, start_file_offset, (unsigned int)(SMALL_FILE_MAX_SIZE-start_file_offset)))
	{
		return false;
	}
	unsigned __int64 buffer_offset = SMALL_FILE_MAX_SIZE-start_file_offset;
	for (unsigned int i=(unsigned int)(start_file_index+1); i<end_file_index; ++i)
	{
		assert(m_all_small_file[i].get_length()==SMALL_FILE_MAX_SIZE);
		if(!m_all_small_file[i].read((char*)buffer+buffer_offset, 0, SMALL_FILE_MAX_SIZE))
		{
			return false;
		}
		buffer_offset += SMALL_FILE_MAX_SIZE;
	}
	if(!m_all_small_file[(unsigned int)end_file_index].read((char*)buffer+buffer_offset, 0, (unsigned int)(end_file_offset+1)))
	{
		return false;
	}
	buffer_offset += end_file_offset+1;
	return true;
}

bool huge_file::write(const void* buffer, const unsigned int num_byte)
{
	if (!_write(buffer, num_byte))
	{
		return false;
	}
	const unsigned __int64 temp_file_len = m_cur_pos+num_byte;
	if (m_file_len<temp_file_len)
	{
		m_file_len = temp_file_len;
	}
	m_cur_pos += num_byte;
	return true;
}

bool huge_file::_write(const void* buffer, const unsigned int num_byte)
{
	if (m_read_only)
	{
		assert(0);
		return false;
	}
	if (!m_base_file_name.length() || !m_all_small_file.size())
	{
		assert(0);
		return false;
	}
	if (!num_byte)
	{
		assert(0);
		return true;
	}
	if (m_cur_pos>m_file_len)
	{
		assert(0);
		return false;
	}
	const unsigned __int64 start_file_index = m_cur_pos/WRITE_SMALL_FILE_MAX_SIZE;
	const unsigned __int64 start_file_offset= m_cur_pos%WRITE_SMALL_FILE_MAX_SIZE;
	const unsigned __int64 end_file_index	= (m_cur_pos+num_byte-1)/WRITE_SMALL_FILE_MAX_SIZE;
	const unsigned __int64 end_file_offset	= (m_cur_pos+num_byte-1)/WRITE_SMALL_FILE_MAX_SIZE;
	for (unsigned int i=m_all_small_file.size(); i<end_file_index+1; ++i)
	{
		small_file base_file;
		if (!base_file.init(get_file_name(i).c_str(), m_read_only))
		{
			assert(0);
			return false;
		}
		m_all_small_file.push_back(base_file);
	}
	
	if (start_file_index==end_file_index)
	{
		return m_all_small_file[(unsigned int)start_file_index].write_int64(buffer, start_file_offset, num_byte);
	}
	if(!m_all_small_file[(unsigned int)start_file_index].write_int64(buffer, start_file_offset, (unsigned int)(WRITE_SMALL_FILE_MAX_SIZE-start_file_offset)))
	{
		return false;
	}
	assert(m_all_small_file[(unsigned int)start_file_index].get_length()==WRITE_SMALL_FILE_MAX_SIZE);
	unsigned __int64 buffer_offset = WRITE_SMALL_FILE_MAX_SIZE-start_file_offset;
	for (unsigned int i=(unsigned int)(start_file_index+1); i<end_file_index; ++i)
	{
		assert(m_all_small_file[i].get_length()<=WRITE_SMALL_FILE_MAX_SIZE);
		if(!m_all_small_file[i].write((const char*)buffer+buffer_offset, 0, WRITE_SMALL_FILE_MAX_SIZE))
		{
			return false;
		}
		assert(m_all_small_file[i].get_length()==WRITE_SMALL_FILE_MAX_SIZE);
		buffer_offset += WRITE_SMALL_FILE_MAX_SIZE;
	}
	if(!m_all_small_file[(unsigned int)end_file_index].write((const char*)buffer+buffer_offset, 0, (unsigned int)(end_file_offset+1)))
	{
		return false;
	}
	assert(m_all_small_file[(unsigned int)end_file_index].get_length()>=end_file_offset+1);
	buffer_offset += end_file_offset+1;
	
	return true;
}

bool huge_file::seek(const unsigned __int64 pos)
{
	if (!m_base_file_name.length() || !m_all_small_file.size())
	{
		assert(0);
		return false;
	}
	assert(m_cur_pos<=m_file_len);
	if (pos>m_file_len)
	{
		assert(0);
		return false;
	}
	m_cur_pos = pos;
	return true;
}
