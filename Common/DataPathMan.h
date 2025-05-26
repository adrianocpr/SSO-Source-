// DataPathMan.h: interface for the DataPathMan class.
//
//////////////////////////////////////////////////////////////////////

#ifndef _DATA_PATH_MAN_H_
#define _DATA_PATH_MAN_H_

#include "hashmap.h"
#include "AString.h"
#include "AWString.h"
#include <map>

template <class _Key, class _Value>
class KeyValueDataSet
{
public:
	typedef std::map<_Key, _Value> DataMap;

public:
	KeyValueDataSet() {}
	virtual ~KeyValueDataSet() { Release(); }
	virtual bool Load(const char* path) = 0;
	virtual void Release() { m_dataMap.clear(); }

	size_t GetSize() const { return m_dataMap.size(); }
	DataMap& GetDataMap() { return m_dataMap; }

protected:
	DataMap m_dataMap;
};

class DataPathMan : public KeyValueDataSet<unsigned int, AString>
{
public:
	const char* GetPathByID(unsigned int id) const { DataMap::const_iterator it = m_dataMap.find(id); return it == m_dataMap.end() ? "" : it->second; }
	const char* GetFileNameByID(unsigned int id) const { DataMap::const_iterator it = m_fileNameMap.find(id); return it == m_fileNameMap.end() ? "" : it->second; }

	virtual bool Load(const char* path);

protected:
	DataMap m_fileNameMap;
};

class DataTextMan : public KeyValueDataSet<unsigned int, AWString>
{
public:
	typedef bool (*L10NTextFunc)(std::wstring& result, const wchar_t* id);
public:
	DataTextMan() : l10n_func(NULL) {}

	const wchar_t* GetTextByID(unsigned int id) const { DataMap::const_iterator it = m_dataMap.find(id); return it == m_dataMap.end() ? L"" : it->second; } 
	
	/// @deprecated
	/// use GetTextByID instead. this method is kept for compatibility, and may be deleted later.
	__declspec(deprecated) const wchar_t* GetPathByID(unsigned long ulID) const { return GetTextByID(ulID); }
	
	virtual bool Load(const char* path);

	L10NTextFunc get_l10n_text_func() { return l10n_func; }
	void set_l10n_text_func(L10NTextFunc func) { l10n_func = func; }
private:
	bool LoadL10nText(AWString& strOut, unsigned int id);

	L10NTextFunc l10n_func;
};

#endif
