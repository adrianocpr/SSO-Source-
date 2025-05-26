// DataPathMan.cpp: implementation of the DataPathMan class.
//
//////////////////////////////////////////////////////////////////////

#include "StdAfx.h"
#include "DataPathMan.h"
#include "AFileImage.h"
#include <vector>
#include <sstream>
#include "AFI.h"

#define	PATHMAP_IDENTIFY		(('P'<<24) | ('M'<<16) | ('I'<<8) | 'D')
#define	TEXTMAP_IDENTIFY		(('T'<<24) | ('M'<<16) | ('I'<<8) | 'D')

///////////////////////////////////////////////////////////////////////////
//	
//	Implementation of DataPathMan
//	
///////////////////////////////////////////////////////////////////////////
bool DataPathMan::Load(const char *szPath)
{
	Release();
	
	AFileImage file;
	if( !file.Open(szPath, AFILE_OPENEXIST | AFILE_BINARY) )
	{
		return false;
	}
	
	DWORD dwReadLen;
	unsigned long Identify;
	if( !file.Read(&Identify, sizeof(unsigned long), &dwReadLen) )
	{
		file.Close();
		return false;
	}
	if(Identify != PATHMAP_IDENTIFY) return 0;

	unsigned long id, usize;
	std::vector<char> buf;
	buf.resize(256);
	if( !file.Read(&usize, sizeof(unsigned long), &dwReadLen) )
	{
		file.Close();
		return false;
	}

	for( unsigned long i = 0; i < usize; ++i)
	{
		unsigned int len = 0;
		if( !file.Read(&id, sizeof(unsigned long), &dwReadLen) )
		{
			file.Close();
			return false;
		}
		if( !file.Read(&len, sizeof(unsigned int), &dwReadLen) )
		{
			file.Close();
			return false;
		}
		if(len + 1 > buf.size())
		{
			buf.resize(len + 1);
		}

		memset(&buf[0], 0, buf.size() * sizeof(buf[0]));
		if( !file.Read(&buf[0], sizeof(char)*len, &dwReadLen) )
		{
			file.Close();
			return false;
		}

		AString strPath = &buf[0];		

		AString strFileName;
		af_GetFileTitle(strPath, strFileName);
		strFileName.MakeLower();

		if (m_dataMap.find(id) != m_dataMap.end() ||
			m_fileNameMap.find(id) != m_fileNameMap.end())
		{
			file.Close();
			return false;
		}
		m_dataMap[id] = strPath;
		m_fileNameMap[id] = strFileName;
	}

	ASSERT(m_dataMap.size() == m_fileNameMap.size());
	
	file.Close();
	return true;
}

///////////////////////////////////////////////////////////////////////////
//	
//	Implementation of DataTextMan
//	
///////////////////////////////////////////////////////////////////////////

bool DataTextMan::Load(const char *szPath)
{
	Release();
	
	FILE* pFile = fopen(szPath, "rb");
	if(pFile == NULL) return false;
	
	unsigned long Identify;
	fread(&Identify, sizeof(unsigned long), 1, pFile);
	if(Identify != TEXTMAP_IDENTIFY) 
	{
		fclose(pFile);
		return false;
	}
	
	unsigned long id, usize;
	std::vector<wchar_t> buf;
	buf.resize(512);
	fread(&usize, sizeof(unsigned long), 1, pFile);
	for( unsigned long i = 0; i < usize; ++i)
	{
		unsigned int len = 0;
		fread(&id, sizeof(unsigned long), 1, pFile);
		fread(&len, sizeof(unsigned int), 1, pFile);

		if(len + 1 > buf.size())
		{
			buf.resize(len + 1);
		}
		memset(&buf[0], 0, buf.size() * sizeof(buf[0]));
		fread(&buf[0], sizeof(wchar_t)*len, 1, pFile);
		
		if (m_dataMap.find(id) != m_dataMap.end())
		{
			fclose(pFile);
			return false;
		}

		AWString text;
		if(LoadL10nText(text, id))
		{
			m_dataMap[id] = text;
		}
		else
		{
			m_dataMap[id] = &buf[0];
		}
	}
	fclose(pFile);
	return true;
}

bool DataTextMan::LoadL10nText( AWString& strOut, unsigned int id )
{
	if(!l10n_func) return false;

	std::wstringstream ss;
	ss << "text_" << id;

	std::wstring text;
	if(!l10n_func(text, ss.str().c_str())) return false;

	strOut = text.c_str();
	return true;
}
