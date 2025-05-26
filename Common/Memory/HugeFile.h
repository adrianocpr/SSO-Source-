/********************************************************************
	created:	2013/1/5
	author:		liudong
	purpose:    simulate a huge file by a lot of small files.
	Copyright (C) All Rights Reserved
*********************************************************************/
#pragma once
#include <string>
#include <vector>

class huge_file
{
public:
	huge_file();
	~huge_file(){ close(); }
	
	//Opens huge file.
	//If read_only is true, the write function is disabled.
	//If read_only is false, it opens an empty file for both reading and writing. If the given file exists, its contents are destroyed.
	bool open(const char* base_file_name, const bool read_only);
	void close();
	bool read(void* buffer, const unsigned int num_byte);
	bool write(const void* buffer, const unsigned int num_byte);
	bool seek(const unsigned __int64 pos);
	inline unsigned __int64 get_pos(){ return m_cur_pos; }
	inline unsigned __int64 get_length(){ return m_file_len; }

	void delete_file();
private:
	struct small_file
	{
		small_file();
		bool init(const char* file_name, const bool is_read_only);
		void close();//Don't call this function in destructor. If you do so there will be some problems with copy functions.
		bool read(void* buffer, const unsigned int start_pos, const unsigned int num_byte);
		bool read_int64(void* buffer, const unsigned __int64 start_pos, const unsigned int num_byte);
		bool write(const void* buffer, const unsigned int start_pos, const unsigned int num_byte);
		bool write_int64(const void* buffer, const unsigned __int64 start_pos, const unsigned int num_byte);
		inline unsigned int get_length() const { return length; }

	private:
		bool _init(const char* file_name, const bool is_read_only);

		FILE*			file;
		unsigned int	length;
		bool			read_only;
		//initial_pos is to avoid BOM problem, according to MSDN:
		//When the CRT opens a file that begins with a Byte Order Mark (BOM), 
		//the file pointer is positioned after the BOM (that is, at the start of the file's actual content). 
		//If you have to fseek to the beginning of the file, 
		//use ftell to get the initial position and fseek to it rather than to position 0.
		unsigned int	initial_pos;
	};

private:
	huge_file(const huge_file& rhs);
	huge_file& operator=(const huge_file& rhs);
	bool _open(const char* base_file_name, const bool read_only);
	bool _read(void* buffer, const unsigned int num_byte);
	bool _write(const void* buffer, const unsigned int num_byte);
	void delete_obsolete_files();

	std::string get_file_name(const unsigned int file_index);
	bool is_file_exist(const char* file_name);
	bool delete_file(const char* file_name);

private:
	std::string				m_base_file_name;
	std::vector<small_file>	m_all_small_file;

	unsigned __int64		m_cur_pos;
	unsigned __int64		m_file_len;
	bool					m_read_only;
};
