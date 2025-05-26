/********************************************************************
  created:	   2013.1.24
  author:      liudong  
  description: 
  Copyright (c) , All Rights Reserved.
*********************************************************************/
#pragma once
#include <assert.h>
#include <Windows.h>

struct ACriticalSectionAutoLock
{
	ACriticalSectionAutoLock(CRITICAL_SECTION* cs)
	{
		m_pCS = cs;
		if (m_pCS) 
		{
			EnterCriticalSection(m_pCS);
		}
	}
	~ACriticalSectionAutoLock()
	{
		Unlock();
	}
	inline void Unlock()
	{
		if (m_pCS) 
		{
			LeaveCriticalSection(m_pCS);
			m_pCS = NULL;
		}
	}
protected:
	CRITICAL_SECTION* m_pCS;
};