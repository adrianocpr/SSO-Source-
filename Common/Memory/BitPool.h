/********************************************************************
	created:	2012/12/30
	author:		liudong
	purpose:    a pool record item by bit.
	Copyright (C) All Rights Reserved
*********************************************************************/
#pragma once

//#define BIT_POOL_TOTAL_SIZE 4294967296 //4G
#define BIT_POOL_TOTAL_SIZE 2147483648 //2G
#define BIT_POOL_BLOCK_SIZE 8192

class bit_pool
{
public:
	bit_pool()
	{
		m_block = new block[get_block_num()];
		assert(m_block);
		num=0; 
	}
	~bit_pool()
	{ 
		if (m_block)
		{
			delete[] m_block;
			m_block = NULL;
		}
		num=0; 
	}
	
	//Set element's state by index. If input state is different with current state, return true, else return false.
	inline bool set(const unsigned int index, const bool b)
	{
		const unsigned int block_index = index/BIT_POOL_BLOCK_SIZE;
		if(block_index>=get_block_num())
		{
			assert(0);
			return false;
		}
		if (m_block[block_index].set(index%BIT_POOL_BLOCK_SIZE, b))
		{
			if (b)
			{
				++num;
			}else
			{
				if (num>0)
				{
					--num;
				}else
				{
					assert(0);
					num = 0;
				}
			}
			return true;
		}
		return false;
	}

	//Set elements' state by range: [start_index,end_index]
	unsigned int set(const unsigned int start_index, const unsigned int end_index, const bool b)
	{
		if (start_index>end_index)
		{
			assert(0);
			return 0;
		}
		const unsigned int start_block	= start_index/BIT_POOL_BLOCK_SIZE;
		const unsigned int end_block	= end_index/BIT_POOL_BLOCK_SIZE;
		if (start_block>=get_block_num() ||
			end_block>=get_block_num() ||
			start_block>end_block)
		{
			assert(0);
			return 0;
		}

		unsigned int num_offset = 0;
		if (start_block==end_block)
		{
			num_offset = m_block[start_block].set(start_index%BIT_POOL_BLOCK_SIZE, end_index%BIT_POOL_BLOCK_SIZE, b);
		}else
		{
			num_offset = m_block[start_block].set(start_index%BIT_POOL_BLOCK_SIZE, BIT_POOL_BLOCK_SIZE-1, b);
			for (unsigned int i=start_block+1; i<end_block; ++i)
			{
				num_offset += m_block[i].set(0, BIT_POOL_BLOCK_SIZE-1, b);
			}
			num_offset += m_block[end_block].set(0, end_index%BIT_POOL_BLOCK_SIZE, b);
		}
		
		
		if (b)
		{
			num += num_offset;
		}else
		{
			if (num>=num_offset)
			{
				num -= num_offset;
			}else
			{
				assert(0);
				num = 0;
			}
		}
		return num_offset;
	}

	//Get element's state by index
	inline bool get(const unsigned int index) const
	{
		const unsigned int block_index = index/BIT_POOL_BLOCK_SIZE;
		if (block_index>=get_block_num())
		{
			assert(0);
			return false;
		}
		return m_block[block_index].get(index%BIT_POOL_BLOCK_SIZE);
	}

	//Return the number of elements with true state in range: [start_index,end_index]
	unsigned int get_element_num(const unsigned int start_index, const unsigned int end_index) const
	{
		if (start_index>end_index)
		{
			assert(0);
			return 0;
		}
		const unsigned int start_block	= start_index/BIT_POOL_BLOCK_SIZE;
		const unsigned int end_block	= end_index/BIT_POOL_BLOCK_SIZE;
		if (start_block>=get_block_num() ||
			end_block>=get_block_num() ||
			start_block>end_block)
		{
			assert(0);
			return 0;
		}
		unsigned int element_num = 0;
		if (start_block==end_block)
		{
			element_num = m_block[start_block].get_element_num(start_index%BIT_POOL_BLOCK_SIZE, end_index%BIT_POOL_BLOCK_SIZE);
		}else
		{
			element_num = m_block[start_block].get_element_num(start_index%BIT_POOL_BLOCK_SIZE, BIT_POOL_BLOCK_SIZE-1);
			for (unsigned int i=start_block+1; i<end_block; ++i)
			{
				element_num += m_block[i].get_element_num();
			}
			if (end_block!=start_block)
			{
				element_num += m_block[end_block].get_element_num(0, end_index%BIT_POOL_BLOCK_SIZE);
			}
		}
		
		return element_num;
	}

	//Return the number of elements with true state
	inline unsigned int get_element_num() const{ return num; } const

	//clear all elements' state
	void clear()
	{
		const unsigned int block_num = get_block_num();
		for (unsigned int i=0; i<block_num; ++i)
		{
			m_block[i].clear();
		}
		num = 0;
	}

private:
	class block
	{
	public:
		block()
		{
			buffer	= NULL;
			num		= 0;
		}
		~block()
		{
			clear();
		}

		//Set element's state by index. If input state is different with current state, return true, else return false.
		inline bool set(const unsigned int index, const bool b)
		{
			if (index>=BIT_POOL_BLOCK_SIZE)
			{
				assert(0);
				return false;
			}
			if (b)
			{
				if (!buffer)
				{
					if (is_full())
					{
						return false;
					}
					if (num)
					{
						assert(0);
						return false;
					}
					create_buffer(false);
					if (!buffer)
					{
						assert(0);
						return false;
					}
				}
				const unsigned int byte  = index/8;
				const unsigned int offset= index%8;
				if (!(buffer[byte]&(1<<offset)))
				{
					buffer[byte] |= (1<<offset);
					++num;
					if (is_full())
					{
						release_buffer();
					}
					return true;
				}
			}else
			{
				if (!buffer)
				{
					if (!num)
					{
						return false;
					}
					if(!is_full())
					{
						assert(0);
						return false;
					}
					create_buffer(true);
					if (!buffer)
					{
						return false;
					}
				}
				const unsigned int byte  = index/8;
				const unsigned int offset= index%8;
				if (buffer[byte]&(1<<offset))
				{
					buffer[byte] &= ~(1<<offset);
					if (num>0)
					{
						--num;
					}else
					{
						assert(0);
						num = 0;
					}
					if (!num)
					{
						release_buffer();
					}
					return true;
				}
			}
			return false;
		}

		//Set elements' state by range: [start_index,end_index]
		inline unsigned int set(const unsigned int start_index, const unsigned int end_index, const bool b)
		{
			if (start_index>=BIT_POOL_BLOCK_SIZE || 
				end_index>=BIT_POOL_BLOCK_SIZE ||
				start_index>end_index)
			{
				assert(0);
				return 0;
			}
			unsigned int num_offset = 0;
			if (b)
			{
				if (!buffer)
				{
					if (is_full())
					{
						return 0;
					}
					if (num)
					{
						assert(0);
						return 0;
					}
					create_buffer(false);
					if (!buffer)
					{
						assert(0);
						return 0;
					}
				}
				if (start_index==0 && end_index==BIT_POOL_BLOCK_SIZE-1)
				{
					num_offset = BIT_POOL_BLOCK_SIZE-num;
					release_buffer();
					num = BIT_POOL_BLOCK_SIZE;
					return num_offset;
				}
				for (unsigned int i=start_index; i<=end_index; ++i)
				{
					const unsigned int byte  = i/8;
					const unsigned int offset= i%8;
					if (!(buffer[byte]&(1<<offset)))
					{
						buffer[byte] |= (1<<offset);
						++num_offset;
					}
				}
				num += num_offset;
				if (is_full())
				{
					release_buffer();
				}
			}else
			{
				if (!buffer)
				{
					if (!num)
					{
						return 0;
					}
					if (!is_full())
					{
						assert(0);
						return 0;
					}
					create_buffer(true);
					if (!buffer)
					{
						assert(0);
						return 0;
					}
				}
				if (start_index==0 && end_index==BIT_POOL_BLOCK_SIZE-1)
				{
					num_offset = num;
					release_buffer();
					num = 0;
					return num_offset;
				}
				for (unsigned int i=start_index; i<=end_index; ++i)
				{
					const unsigned int byte  = i/8;
					const unsigned int offset= i%8;
					if (buffer[byte]&(1<<offset))
					{
						buffer[byte] &= ~(1<<offset);			
						++num_offset;
					}
				}
				if (num>=num_offset)
				{
					num -= num_offset;
				}else
				{
					assert(0);
					num = 0;
				}
				
				if (!num)
				{
					release_buffer();
				}
			}
			return num_offset;
		}

		//Get element's state by index
		inline bool get(const unsigned int index) const
		{
			if (index>=BIT_POOL_BLOCK_SIZE)
			{
				assert(0);
				return false;
			}
			if (!buffer)
			{
				assert(!num || is_full());
				return is_full();
			}
			const unsigned int byte  = index/8;
			const unsigned int offset= index%8;
			return (buffer[byte]&(1<<offset))?true:false;
		}

		//Return the number of elements with true state in range: [start_index,end_index]
		unsigned int get_element_num(const unsigned int start_index, const unsigned int end_index) const
		{
			if (start_index>=BIT_POOL_BLOCK_SIZE || 
				end_index>=BIT_POOL_BLOCK_SIZE ||
				start_index>end_index)
			{
				assert(0);
				return 0;
			}
			if (!buffer)
			{
				if (is_full())
				{
					return end_index-start_index+1;
				}
				assert(!num);
				return 0;
			}
			unsigned int element_num = 0;
			for (unsigned int i=start_index; i<=end_index; ++i)
			{
				const unsigned int byte  = i/8;
				const unsigned int offset= i%8;
				if (buffer[byte]&(1<<offset))
				{
					++element_num;
				}
			}
			return element_num;
		}

		//Return the number of elements with true state
		inline unsigned int get_element_num() const { return num; }

		//Clear all elements' state
		inline void clear()
		{
			release_buffer();
			num = 0;
		}

		inline bool is_full() const { assert(num<=BIT_POOL_BLOCK_SIZE); return num>=BIT_POOL_BLOCK_SIZE; }
		inline void create_buffer(const bool full_with_item)
		{ 
			if (buffer)
			{
				assert(0);
				return;
			}
			buffer = new unsigned char[get_buffer_size()];
			if (!buffer)
			{
				assert(0);
				return ;
			}
			memset(buffer, full_with_item?0xFF:0, get_buffer_size());
		}
		inline void release_buffer()
		{
			if (buffer)
			{
				delete[] buffer;
				buffer = NULL;
			}
		}
		inline static unsigned int get_buffer_size(){ return BIT_POOL_BLOCK_SIZE/8; }
		
	private:
		unsigned char*	buffer;
		unsigned int	num;
	};

private:
	bit_pool(const bit_pool& rhs);
	bit_pool& operator=(const bit_pool& rhs);

	inline static unsigned int get_block_num(){ return BIT_POOL_TOTAL_SIZE/BIT_POOL_BLOCK_SIZE; }

private:
	block*			m_block;
	unsigned int	num;
};








