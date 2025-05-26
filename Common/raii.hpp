
/********************************************************************
created:	2010-04-23
author:		lixianmin

purpose:	Resource Acquisition Is  Initialization (RAII)
Copyright (C) 2010 - All Rights Reserved
*********************************************************************/
#ifndef _LIB_RAII_HPP_INCLUDED_
#define _LIB_RAII_HPP_INCLUDED_

namespace lib
{
	/********************************************************************
								auto_delete
	*********************************************************************/
	template<typename T>
	class auto_delete
	{
	public:
		auto_delete(T* pdata)
		{
			_pdata	= pdata;
		}
	
		~auto_delete(void)
		{
			delete _pdata;
			_pdata	= NULL;
		}
		
		T* operator->(void)
		{
			return _pdata;
		}
		
		operator T* (void)
		{
			T* pdata	= _pdata;
			_pdata		= NULL;
			return pdata;
		}
		
	private:
		auto_delete(const auto_delete&);
		auto_delete& operator=(const auto_delete&);

		void*	operator new(std::size_t)	{ return NULL;}
		void	operator delete(void*)		{ }
		
		T*	_pdata;
	};

	/********************************************************************
								auto_release
	*********************************************************************/
	template<typename T>
	class auto_release
	{
	public:
		auto_release(T* pdata)
		{
			_pdata	= pdata;
		}
		
		~auto_release(void)
		{
			if (NULL!= _pdata)
			{
				_pdata->Release();
				delete _pdata;
				_pdata	= NULL;
			}		
		}
		
		T* operator->(void)
		{
			return _pdata;
		}
		
		operator T* (void)
		{
			T* pdata	= _pdata;
			_pdata		= NULL;
			return pdata;
		}
		
	private:
		auto_release(const auto_release&);
		auto_release& operator=(const auto_release&);

		void*	operator new(std::size_t)	{ return NULL;}
		void	operator delete(void*)		{ }
		
		T*	_pdata;
	};


	/********************************************************************
								auto_Close
	*********************************************************************/
	template<typename T>
	class auto_Close
	{
	public:
		auto_Close(T* pdata)
		{
			_pdata	= pdata;
		}
		
		~auto_Close(void)
		{
			if (NULL!= _pdata)
			{
				_pdata->Close();
				delete _pdata;
				_pdata	= NULL;
			}		
		}
		
		T* operator->(void)
		{
			return _pdata;
		}
		
		operator T* (void)
		{
			T* pdata	= _pdata;
			_pdata		= NULL;
			return pdata;
		}
		
	private:
		auto_Close(const auto_Close&);
		auto_Close& operator=(const auto_Close&);

		void*	operator new(std::size_t)	{ return NULL;}
		void	operator delete(void*)		{ }
		
		T*	_pdata;
	};


	/********************************************************************
								auto_lock
	*********************************************************************/
	template<typename T>
	class auto_lock
	{
	public:
		auto_lock(T* pdata)
		{
			_pdata	= pdata;
			_pdata->Lock();
		}
		
		~auto_lock(void)
		{
			if (NULL!= _pdata)
			{
				_pdata->Unlock();
				_pdata	= NULL;
			}		
		}
		
	private:
		auto_lock(const auto_lock&);
		auto_lock& operator=(const auto_lock&);
		
		T*	_pdata;
	};
}

#endif