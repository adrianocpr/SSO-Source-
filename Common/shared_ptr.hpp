/*
 * FILE: SHARED_PTR.HPP
 *
 * DESCRIPTION: simple version of boost's shared_ptr
 *
 * CREATED BY: hanwei, 2011/12/31
 *
 * HISTORY:
 *
 * Copyright (c) 2010 Hummingbird Studio, All Rights Reserved.
 */

#ifndef SHAREDPTR_HPP
#define SHAREDPTR_HPP

#include <algorithm>

class sharedptr_count_base{
public:
	explicit sharedptr_count_base():usecount(1)
	{
	}
	void addref()
	{
		++usecount;
	}
	void release()
	{
		if(--usecount==0){
			dispose();
			delete this;
		}
	}
	long use_count()
	{
		return usecount;
	}
	virtual void dispose()=0;
	virtual ~sharedptr_count_base(){};
private:

	int usecount;  
};


template<typename T>
class sharedptr_count_impl:public sharedptr_count_base{
public:
	explicit sharedptr_count_impl(T* p):px(p)
	{
	}

	virtual void dispose()
	{
		if(px)
			delete px;
	}

private:
	T* px;
};

template<typename T, typename D>
class sharedptr_count_impld:public sharedptr_count_base{
public:
	explicit sharedptr_count_impld(T* p, D d):px(p),del(d)
	{
	}

	virtual void dispose()
	{
		del(px);
	}

private:
	T* px;
	D  del;
};



class sharedptr_count{
private:
	sharedptr_count_base * pi_;
public:

	explicit sharedptr_count():pi_(0)
	{
	}

	template<typename Y>
	explicit sharedptr_count(Y *p)
	{
		pi_ = new sharedptr_count_impl<Y>(p);
	}

	template<typename Y, typename D>
	explicit sharedptr_count(Y *p, D d)
	{
		pi_ = new sharedptr_count_impld<Y, D>(p, d);
	}  

	~sharedptr_count()
	{
		if( pi_ != 0 ) pi_->release();
	}

	sharedptr_count& operator=(sharedptr_count const &other)
	{
		if( pi_!=other.pi_){
			if( pi_)
				pi_->release();
			pi_ = other.pi_;
			if( pi_)
				pi_->addref();
		}
		return *this;
	}

	explicit sharedptr_count(sharedptr_count const &other):pi_(other.pi_)
	{
		if (pi_)
			pi_->addref();
	}

	long use_count() const
	{
		return pi_ != 0? pi_->use_count(): 0;
	}

	void swap(sharedptr_count & other)
	{
		std::swap(pi_,other.pi_);
	}

};

namespace shared_ptr_detail
{
template<typename T> struct shared_ptr_traits
{
	typedef T & reference;
};

template<> struct shared_ptr_traits<void>
{
	typedef void reference;
};

struct static_cast_tag {};
struct const_cast_tag {};
struct dynamic_cast_tag {};
}

template<typename T>
class shared_ptr
{
private:
	typedef shared_ptr<T> this_type;

	/// Trick for bool like test
	/// @see "The Safe Bool Idiom" http://www.artima.com/cppsource/safebool.htm
	typedef void (this_type::*bool_type)() const;
	void __dummy_method_for_bool_like_test() const {}
public:
	typedef T element_type;
	typedef T value_type;
	typedef T * pointer;
	typedef typename shared_ptr_detail::shared_ptr_traits<T>::reference reference;

	explicit shared_ptr(): px(0), pn()
	{
	}

	template<typename Y>
	explicit shared_ptr( Y * p ): px( p ), pn( p )
	{
	}

	explicit shared_ptr( shared_ptr &other )
	{
		px = other.px;
		pn = other.pn;
	}

	T* get() const
	{
		return px;
	}

	reference operator*() const
	{
		assert(px != 0);
		return *px;
	}

	pointer operator->() const
	{
		return px;
	}

	operator bool_type() const
	{
		return px ? &this_type::__dummy_method_for_bool_like_test : 0;
	}

	template<class Y>
	shared_ptr(shared_ptr<Y> const & r): px(r.px), pn(r.pn)
	{
	}

	template<typename Y>
	explicit shared_ptr( shared_ptr<Y> const & r, shared_ptr_detail::static_cast_tag ): px( static_cast<element_type *>(r.px) ), pn( r.pn )
	{
	}

	template<typename Y>
	explicit shared_ptr( shared_ptr<Y> const & r, shared_ptr_detail::const_cast_tag ): px( const_cast<element_type *>(r.px) ), pn( r.pn )
	{
	}

	template<typename Y>
	explicit shared_ptr( shared_ptr<Y> const & r, shared_ptr_detail::dynamic_cast_tag ): px( dynamic_cast<element_type *>(r.px) ), pn( r.pn )
	{
	}

	shared_ptr & operator=(shared_ptr const &other)
	{
		px =other.px;
		pn =other.pn;
		return *this;
	}

	long use_count() const
	{
		return pn.use_count();
	}

	void swap(shared_ptr<T> &other)
	{
		std::swap(px, other.px);
		pn.swap(other.pn);
	}

	void reset()
	{
		this_type().swap(*this);
	}

	template<class Y> void reset(Y * p)
	{
		((p == 0 || p != px) ? (void)0 : _assert("p == 0 || p != px", "shared_ptr.hpp "));
		this_type(p).swap(*this);
	}

private:
	template<class Y> friend class shared_ptr;

	T * px;
	sharedptr_count pn;
};


template<class T, class U> inline bool operator==(shared_ptr<T> const & a, shared_ptr<U> const & b)
{
	return a.get() == b.get();
}

template<class T, class U> inline bool operator!=(shared_ptr<T> const & a, shared_ptr<U> const & b)
{
	return a.get() != b.get();
}

template<class T, class U> inline bool operator<(shared_ptr<T> const & a, shared_ptr<U> const & b)
{
	return a.get() < b.get();
}

template<class T, class U> shared_ptr<T> static_pointer_cast(shared_ptr<U> const & r)
{
	return shared_ptr<T>(r, shared_ptr_detail::static_cast_tag());
}

template<class T, class U> shared_ptr<T> const_pointer_cast(shared_ptr<U> const & r)
{
	return shared_ptr<T>(r, shared_ptr_detail::const_cast_tag());
}

template<class T, class U> shared_ptr<T> dynamic_pointer_cast(shared_ptr<U> const & r)
{
	return shared_ptr<T>(r, shared_ptr_detail::dynamic_cast_tag());
}

#endif