/********************************************************************
	created:	2009/12/29  13:11
	author:		LiuDong
	
    purpose:	64位id
    Copyright (C) All Rights Reserved
*********************************************************************/

#pragma once

#define ID64_DEPRECATE_TYPE(TYPE) \
	CECID64(const TYPE& rhs){};\
	const CECID64& operator = (const TYPE& rhs){ return *this; };\
	bool operator == (const TYPE& rhs) const{ return false;	}\
	bool operator != (const TYPE& rhs) const{ return false;	}

class CECID64
{
public:
	//构造函数
	CECID64(){ data = 0; }
	CECID64(const CECID64& rhs){ data = rhs.data; }
	CECID64(const __int64& rhs){ data = rhs; }
	CECID64(const unsigned __int64& rhs){ data = rhs; }

	//赋值
	const CECID64& operator = (const CECID64& rhs)
	{
		if(this==&rhs)
		{
			return *this;
		}
		data = rhs.data;
		return *this;
	}
	const CECID64& operator = (const __int64& rhs)
	{
		data = rhs;
		return *this;
	}
	const CECID64& operator = (const unsigned __int64& rhs)
	{
		data = rhs;
		return *this;
	}

	//==
	bool operator == (const CECID64& rhs) const
	{
		return data == rhs.data;
	}
	bool operator == (const __int64& rhs) const
	{
		return data == rhs;
	}
	bool operator == (const unsigned __int64& rhs) const
	{
		return data == (const __int64)rhs;
	}

	//!=
	bool operator != (const CECID64& rhs) const
	{
		return data != rhs.data;
	}
	bool operator != (const __int64& rhs) const
	{
		return data != rhs;
	}
	bool operator != (const unsigned __int64& rhs) const
	{
		return data != (const __int64)rhs;
	}

	//other
	operator const __int64() const { return data; };

protected:
	ID64_DEPRECATE_TYPE(char)
	ID64_DEPRECATE_TYPE(unsigned char)
	ID64_DEPRECATE_TYPE(short)
	ID64_DEPRECATE_TYPE(unsigned short)
	ID64_DEPRECATE_TYPE(int)
	ID64_DEPRECATE_TYPE(unsigned int)
	ID64_DEPRECATE_TYPE(long)
	ID64_DEPRECATE_TYPE(unsigned long)
	ID64_DEPRECATE_TYPE(float)
	ID64_DEPRECATE_TYPE(double)

protected:
	__int64 data;
};

#undef ID64_DEPRECATE_TYPE

#define _INT_64 CECID64