/********************************************************************
	created:	2012/7/11
	author:		liudong
	
	purpose:   大量数据存储池,适用于不删除单个元素的情况.
	Copyright (C) All Rights Reserved
*********************************************************************/
#pragma once
#include <assert.h>
#include <string>
#include <map>
#include <vector>

template <class T>
class item_pool
{
public:
	enum
	{
		ARRAY_SIZE=(128*1024-4)/sizeof(T), //128K memory
	};

public:
	item_pool();	
	~item_pool(){ clear(); }
	void clear();
	
	unsigned int size() const;
	T& get(const unsigned int pos);
	const T& get(const unsigned int pos) const;
	
	void push_back(const T& x);
	void merge(const T& x);
	void compact();

	void sort(const unsigned int sort_type);
	void quick_sort( const unsigned int sort_type);
	const unsigned int* get_sorted_index_array() const{ return sorted_index_array; } 

protected:
	struct stackParam
	{
		stackParam()
		{
			left  = 0;
			right = 0;
		}

		int left;
		int right;
	};

	struct block
	{
		block(){ size = 0; }
		void sort(const unsigned int sort_type, unsigned int* sort_slot_array) const
		{
			if (size>ARRAY_SIZE || !sort_slot_array)
			{
				assert(0);
				return;
			}
			unsigned int i;
			for (i=0; i<size; ++i)
			{
				sort_slot_array[i] = i;
			}
			//bubble sort
			for (i=0; i<size; ++i)
			{
				unsigned int index_max = i;
				for (unsigned int j=i+1; j<size; ++j)
				{
					if (array[sort_slot_array[index_max]].less_than(array[sort_slot_array[j]], sort_type))
					{
						index_max = j;
					}
				}
				if (index_max!=i)
				{
					unsigned int temp = sort_slot_array[i];
					sort_slot_array[i] = sort_slot_array[index_max];
					sort_slot_array[index_max] = temp;
				}
			}
		}
		
		T				array[ARRAY_SIZE];
		unsigned int	size;
	}; 

protected:
	void reserve(const unsigned int _size);
	const T& get(const unsigned int block_index, const unsigned int item_index) const;
	const block* get_block(const unsigned int block_index) const;
	void uncompact();
	const T& get_default_value() const;
	int quick_sort_partition( const int left, const int right, const unsigned int sort_type);

protected:
	block**			block_array;
	unsigned int	block_num;
	unsigned int	max_block_num;
	T*				tail_item_array;
	unsigned int    tail_item_num;
	unsigned int*   sorted_index_array;

	std::map<std::string, unsigned int> hash_id_to_index; //used for merge
	
private:
	item_pool(const item_pool& rhs);
	item_pool<T> &operator=(const item_pool<T> & rhs);
};

template <class T>
item_pool<T>::item_pool()
{
	assert(ARRAY_SIZE>0);
	block_num			= 0;
	max_block_num		= 0;
	block_array			= NULL;
	sorted_index_array  = NULL;
	tail_item_array		= NULL;
	tail_item_num		= 0;
}

template <class T>
void item_pool<T>::clear()
{
	if (block_array)
	{
		for (unsigned int i=0; i<block_num; ++i)
		{
			if (block_array[i])
			{
				delete block_array[i];
			}else
			{
				assert(0);
			}
		}
		delete[] block_array;
		block_array = NULL;
	}
	block_num	= 0;
	max_block_num	= 0;

	if (sorted_index_array)
	{
		delete[] sorted_index_array;
		sorted_index_array = NULL;
	}
	if (tail_item_array)
	{
		delete[] tail_item_array;
		tail_item_array = NULL;
	}
	tail_item_num = 0;
	hash_id_to_index.clear();
}

template <class T>
void item_pool<T>::reserve(const unsigned int _size)
{
	unsigned int cur_size = size();
	if (_size<=cur_size)
	{
		return;
	}
	if (tail_item_array)
	{
		uncompact();
		assert(!tail_item_array);
	}
	unsigned int new_block_num = _size/ARRAY_SIZE;
	if (_size%ARRAY_SIZE)
	{
		new_block_num +=1;
	}
	if (new_block_num<=max_block_num)
	{
		return;
	}
	block** new_block_array = new block*[new_block_num];
	unsigned int i;
	for (i=0; i<max_block_num; ++i)
	{
		assert(block_array);
		new_block_array[i] = block_array[i];
	}
	if (block_array)
	{
		delete[] block_array;
		block_array = NULL;
	}

	for (i=max_block_num; i<new_block_num; ++i)
	{
		new_block_array[i] = NULL;
	}
	block_array = new_block_array;
	max_block_num = new_block_num;
}

template <class T>
void item_pool<T>::push_back(const T& x)
{
	assert (block_num<=max_block_num);
	reserve(size()+1);
	
	if (!block_num)
	{
		block_array[block_num] = new block();
		if (!block_array[block_num])
		{
			assert(0);
			return;
		}
		++block_num;
	}
	block* block_pointer = block_array[block_num-1];
	if (!block_pointer)
	{
		assert(0);
		return;
	}
	if (block_pointer->size > ARRAY_SIZE)
	{
		//this should not happen
		assert(0);
		return;
	}
	if (ARRAY_SIZE==block_pointer->size)
	{
		if (block_num>=max_block_num)
		{
			assert(0);
			return;
		}
		block_array[block_num] = new block();
		if (!block_array[block_num])
		{
			assert(0);
			return;
		}
		++block_num;
		block_pointer = block_array[block_num-1];
	}
	block_pointer->array[block_pointer->size] = x;
	++block_pointer->size;
}

template <class T>
void item_pool<T>::merge(const T& x)
{
	if (hash_id_to_index.size()!=size())
	{
		assert(!hash_id_to_index.size());
		hash_id_to_index.clear();
		const unsigned int cur_size = size();
		unsigned int i;
		for (i=0; i<cur_size; ++i)
		{
			hash_id_to_index[get(i).get_id()] = i;
		}
	}
	std::string id_x = x.get_id();
	std::map<std::string, unsigned int>::iterator it = hash_id_to_index.find(id_x);
	if (it!=hash_id_to_index.end())
	{
		get(it->second).merge(x);
	}else
	{
		push_back(x);
		hash_id_to_index[id_x] = size()-1;
	}
}

template <class T>
const typename item_pool<T>::block* item_pool<T>::get_block(const unsigned int block_index) const
{
	if (block_index>=block_num || !block_array)
	{
		assert(0);
		return NULL;
	}
	return block_array[block_index];
}

template <class T>
const T& item_pool<T>::get_default_value() const
{
	static const T default_value;
	return default_value;
}

template <class T>
const T& item_pool<T>::get(const unsigned int block_index, const unsigned int item_index) const
{
	const block* block_pointer = get_block(block_index);
	if (!block_pointer)
	{
		assert(0);
		return get_default_value();
	}
	if (item_index>=block_pointer->size)
	{
		assert(0);
		return get_default_value();
	}
	return block_pointer->array[item_index];
}

template <class T>
T& item_pool<T>::get(const unsigned int pos)
{
	const unsigned int block_index = pos/ARRAY_SIZE;
	const unsigned int index = pos%ARRAY_SIZE;
	if (block_index==block_num)
	{
		if (tail_item_num)
		{
			assert(tail_item_array);
			if (index<tail_item_num)
			{
				return tail_item_array[index];
			}else
			{
				assert(0);
				return *const_cast<T*>(&get_default_value());
			}
		}else
		{
			assert(0);
			return *const_cast<T*>(&get_default_value());
		}
	}
	block* block_pointer = const_cast<block*>(get_block(block_index));
	if (!block_pointer)
	{
		assert(0);
		return *const_cast<T*>(&get_default_value());
	}
	if (index>=block_pointer->size)
	{
		assert(0);
		return *const_cast<T*>(&get_default_value());
	}
	return block_pointer->array[index];
}

template <class T>
const T& item_pool<T>::get(const unsigned int pos) const
{
	const unsigned int block_index = pos/ARRAY_SIZE;
	const unsigned int index = pos%ARRAY_SIZE;
	if (block_index==block_num)
	{
		if (tail_item_num)
		{
			assert(tail_item_array);
			if (index<tail_item_num)
			{
				return tail_item_array[index];
			}else
			{
				assert(0);
				return get_default_value();
			}
		}else
		{
			assert(0);
			return get_default_value();
		}
	}
	const block* block_pointer = get_block(block_index);
	if (!block_pointer)
	{
		assert(0);
		return get_default_value();
	}
	if (index>=block_pointer->size)
	{
		assert(0);
		return get_default_value();
	}
	return block_pointer->array[index];
}

template <class T>
unsigned int item_pool<T>::size() const
{
	if (tail_item_num)
	{
		assert(tail_item_array);
		if (block_num)
		{
			assert(block_num<=max_block_num);
			assert(ARRAY_SIZE==get_block(block_num-1)->size);
		}
		return (block_num*ARRAY_SIZE+tail_item_num);
	}else
	{
		assert(!tail_item_array);
		if (block_num)
		{
			assert(block_num<=max_block_num);
			const block* block_pointer = get_block(block_num-1);
			if (!block_pointer)
			{
				assert(0);
				return 0;
			}
			assert(block_pointer->size<=ARRAY_SIZE);
			return ((block_num-1)*ARRAY_SIZE+block_pointer->size);
		}
		return 0;
	}
}

template <class T>
void item_pool<T>::compact()
{
	assert(block_num<=max_block_num);
	unsigned int i;
	for (i=0; i<block_num; ++i)
	{
		assert(block_array[i]);
		if (i==block_num-1)
		{
			assert(block_array[i]->size<=ARRAY_SIZE);
		}else
		{
			assert(block_array[i]->size==ARRAY_SIZE);
		}

	}
	for (i=block_num; i<max_block_num; ++i)
	{
		assert(!block_array[i]);
	}

	if (tail_item_array)
	{
		return;
	}
	if (!block_num)
	{
		return;
	}
	if (block_num==max_block_num && block_array[block_num-1]->size==ARRAY_SIZE)
	{
		return;
	}
	unsigned int copy_block_num = block_num-1;
	if (block_array[block_num-1]->size==ARRAY_SIZE)
	{
		++copy_block_num;
	}
	assert(block_array);
	block** new_block_array = new block*[copy_block_num];
	for (i=0; i<copy_block_num; ++i)
	{
		new_block_array[i] = block_array[i];
	}
	if (copy_block_num<block_num)
	{
		block* src_block = block_array[block_num-1];
		assert(src_block && src_block->size<ARRAY_SIZE);
		tail_item_array = new T[src_block->size];
		for (unsigned int i=0; i<src_block->size; ++i)
		{
			tail_item_array[i] = src_block->array[i];
		}
		tail_item_num = src_block->size;
		delete src_block;
	}
	delete[] block_array;
	block_array     = new_block_array;
	max_block_num	= copy_block_num;
	block_num		= copy_block_num;
	hash_id_to_index.clear();
}

template <class T>
void item_pool<T>::quick_sort( const unsigned int sort_type)
{
	std::vector<stackParam> stack;
	stackParam sParam;

	int left  = 0;
	int right = size()-1;

	if ( left < right )
	{
		int mid = quick_sort_partition(left, right, sort_type );
		if ( left < mid -1)
		{
			sParam.left = left;
			sParam.right = mid -1;
			stack.push_back( sParam );
		}

		if ( mid+1<right )
		{
			sParam.left = mid+1;
			sParam.right = right;
			stack.push_back( sParam );
		}

		while( !stack.empty() )
		{
			sParam = stack.back();
			stack.pop_back();
			int p = sParam.left;
 			int q = sParam.right;
			mid = quick_sort_partition(p,q,sort_type);
			if ( p<mid-1)
			{
				sParam.left = p;
				sParam.right = mid-1;
		    	stack.push_back( sParam );
			}
			if (mid+1<q)
			{
				sParam.left = mid+1;
				sParam.right = q;
		    	stack.push_back( sParam );
			}	
		}
	}
}

template <class T>
int item_pool<T>::quick_sort_partition( const int src_left, const int src_right, const unsigned int sort_type)
{
	//find pivot
	if (src_right-src_left>1)
	{
		const int mid_index = (src_left+src_right)/2;
		int min_index = src_left;
		if (get(mid_index).less_than(get(min_index), sort_type))
		{
			min_index = mid_index;
		}
		if (get(src_right).less_than(get(min_index), sort_type))
		{
			min_index = src_right;
		}
		int max_index = src_right;
		if (get(max_index).less_than(get(mid_index), sort_type))
		{
			max_index = mid_index;
		}
		if (get(max_index).less_than(get(src_left), sort_type))
		{
			max_index = src_left;
		}
		int pivot_index = src_left;
		const int index_array[3] = {src_left,mid_index,src_right};
		for (unsigned int i=0; i<3; ++i)
		{
			if (index_array[i]==min_index || index_array[i]==max_index)
			{
				continue;
			}
			pivot_index = index_array[i];
			break;
		}
		if (pivot_index!=src_left)
		{
			T temp				= get(src_left);
			get(src_left)		= get(pivot_index);
			get(pivot_index)	= temp;
		}
	}

	int left  = src_left;
	int right = src_right;
	T pivot = get(left);
	while( left < right )
	{
		while( left < right && !get(right).less_than( pivot, sort_type) )
		{
			--right;
		}
		if (left!=right)
		{
			get(left) = get(right);
		}
		while( left < right && !pivot.less_than( get(left), sort_type) )
		{
			++left;
		}
		if (left!=right)
		{
			get(right) = get(left); 
		}
	}
	get(left) = pivot;

	return left;
}

template <class T>
void item_pool<T>::sort(const unsigned int sort_type)
{
	assert(block_num<=max_block_num);
	const unsigned int _size = size();
	if (!_size)
	{
		return;
	}

	if (tail_item_array)
	{
		uncompact();
		assert(!tail_item_array);
	}

	if(sorted_index_array)
	{
		delete[] sorted_index_array;
		sorted_index_array = NULL;
	}
	sorted_index_array = new unsigned int[_size];
	assert(sorted_index_array);
	unsigned int i;
	for (i=0; i<_size; ++i)
	{
		sorted_index_array[i] = UINT_MAX;
	}
	
	//sort inside block
	assert(block_num);
	unsigned int** sorted_slot = new unsigned int*[block_num];
	for (i=0; i<block_num; ++i)
	{
		sorted_slot[i] = new unsigned int[ARRAY_SIZE];
		assert(sorted_slot[i]);
		for (unsigned int j=0; j<ARRAY_SIZE; ++j)
		{
			sorted_slot[i][j] = ARRAY_SIZE;
		}
	}

	for (i=0; i<block_num; ++i)
	{
		block* block_pointer = const_cast<block*>(get_block(i));
		if (!block_pointer)
		{
			assert(0);
			for (unsigned int j=0; j<block_num; ++j)
			{
				delete[] (sorted_slot[j]) ;
			}
			delete[] sorted_slot;
			sorted_slot = NULL;
			return;
		}
		block_pointer->sort(sort_type, sorted_slot[i]);
		for (unsigned int j=0; j<block_pointer->size; ++j)
		{
			assert(sorted_slot[i][j]<block_pointer->size); ;
		}
	}
	
	//sort blocks
	unsigned int* first_slot = new unsigned int[block_num];
	for (i=0; i<block_num; ++i)
	{
		first_slot[i] = 0;
	}
	for (i=0; i<_size; ++i)
	{
		unsigned int max_block_index = UINT_MAX;
		for (unsigned int block_index=0;block_index<block_num;++block_index)
		{
			if (ARRAY_SIZE==first_slot[block_index])
			{
				continue;
			}
			assert(first_slot[block_index]<ARRAY_SIZE);
			if (UINT_MAX==max_block_index)
			{
				max_block_index = block_index;
				continue;
			}
			const T& max_item = get(max_block_index,sorted_slot[max_block_index][first_slot[max_block_index]]);
			const T& cur_item = get(block_index,sorted_slot[block_index][first_slot[block_index]]);
			if (max_item.less_than(cur_item, sort_type))
			{
				max_block_index = block_index;
			}
		}
		if (max_block_index>=block_num)
		{
			//this should not happen
			assert(0);
			break;
		}
		const unsigned int max_slot_temp = first_slot[max_block_index];
		assert(max_slot_temp< get_block(max_block_index)->size);
		const unsigned int max_slot = sorted_slot[max_block_index][max_slot_temp];
		assert(max_slot<get_block(max_block_index)->size);
		sorted_index_array[i] = max_block_index*ARRAY_SIZE + max_slot;

		++first_slot[max_block_index];	
		if (first_slot[max_block_index]==get_block(max_block_index)->size)
		{
			first_slot[max_block_index] = ARRAY_SIZE;
		}
		
	}

	//delete temporary array
	for (i=0; i<block_num; ++i)
	{
		delete[] (sorted_slot[i]) ;
	}
	delete[] sorted_slot;
	sorted_slot = NULL;
	for (i=0;i<block_num;++i)
	{
		assert(ARRAY_SIZE==first_slot[i]);
	}
	delete[] first_slot;
	first_slot = NULL;

	for (i=0; i<_size; ++i)
	{
		assert(sorted_index_array[i]<_size);
	}

	compact();
}

template <class T>
void item_pool<T>::uncompact()
{
	assert(tail_item_array&&tail_item_num || !tail_item_array&&!tail_item_num);
	assert(tail_item_num<ARRAY_SIZE);
	if (!tail_item_array)
	{
		return;
	}
	assert(max_block_num==block_num);
	assert(!block_num || block_array[block_num-1]->size==ARRAY_SIZE);

	block** new_block_array = new block*[block_num+1];
	unsigned int i;
	for (i=0; i<block_num; ++i)
	{
		assert(block_array);
		new_block_array[i] = block_array[i];
	}
	new_block_array[block_num] = NULL;
	if (block_array)
	{
		delete[] block_array;
		block_array = NULL;
	}
	block_array = new_block_array;
	++max_block_num;

	block* block_pointer = new block();
	if (!block_pointer)
	{
		assert(0);
		return;
	}
	for (i=0; i<tail_item_num; ++i)
	{
		block_pointer->array[i] = tail_item_array[i];
	}
	block_pointer->size = tail_item_num;
	new_block_array[block_num] = block_pointer;
	delete[] tail_item_array;
	tail_item_array = NULL;
	tail_item_num = 0;

	++block_num;
}
