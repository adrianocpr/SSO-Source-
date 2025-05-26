#ifndef _MEDIA_DEFINE_H_
#define _MEDIA_DEFINE_H_

#include <windows.h>
#include "MediaPlayerExp.h"

namespace SMediaPlayer
{
typedef void (*Media_Log)(const char* format,...);

typedef bool (*Video_CallBack)(void* pUserData,unsigned char* pBuf,size_t nSize,double fCurTime,bool bSaveImage);
typedef void (*Video_Finish_CallBack)(void* pUserData);
typedef void (*Media_Loop_CallBack)(void* pUserData);

typedef unsigned long (*ExceptionCallBack)(LPEXCEPTION_POINTERS pExceptionPointers);
_MediaPlayer_Export void SetExceptionHandler(ExceptionCallBack exceptionCallBack);
unsigned long glb_HandleException(LPEXCEPTION_POINTERS pExceptionPointers);

#pragma warning (push)
#pragma warning (disable:4311)		//disable warning about pointer truncation
#pragma warning (disable:4312)
template<class T>
struct VolatileValue
{
	volatile long	m_value;
	VolatileValue()
		: m_value(T())
	{

	}

	explicit VolatileValue(T value)
		: m_value(long(value))
	{

	}

	inline operator T () const			{ return T(m_value); }
	void	set(T value)				{ InterlockedExchange(&m_value,long(value)); }
	VolatileValue& operator =(T value)	{ set(value); return *this; } 
};
#pragma warning (pop)

class _MediaPlayer_Export CriticalSection
{
public:
	CriticalSection() { InitializeCriticalSection(&m_cs); }
	~CriticalSection() { DeleteCriticalSection(&m_cs); }
	CRITICAL_SECTION* get() { return &m_cs; }
private:
	CRITICAL_SECTION m_cs;
};

class CSWrapper
{
public:
	CSWrapper(CRITICAL_SECTION* pCS)
		: m_pCS(pCS)
	{
		assert(m_pCS && "CSWrapper::CSWrapper");
		EnterCriticalSection(m_pCS);
	}

	CSWrapper(CriticalSection& cs)
		: m_pCS(cs.get())
	{
		EnterCriticalSection(m_pCS);
	}

	~CSWrapper()
	{
		LeaveCriticalSection(m_pCS);
	}

public:
	CRITICAL_SECTION*	m_pCS;	 
};

struct Audio_Param
{
	WAVEFORMATEX	wfxFormat;		//ÒôÆµ²ÎÊý
	DWORD			dwBufferLen;	//ÒôÆµ»º³å³¤¶È(ºÁÃëÊý)
	DWORD			dwBufferNum;	//ÒôÆµ»º³å¸öÊý
};

#define		MAX_AUDIO_BUFFER_NUM	256

#define		AUDIO_MAXVOLUME		0
#define		AUDIO_MINVOLUME		-3000

#define MAX(a,b)            (((a) > (b)) ? (a) : (b))
#define MIN(a,b)            (((a) < (b)) ? (a) : (b))

template<class T>
inline void Clamp(T& x,const T& min,const T& max)
{
	if(x < min) x = min;
	if(x > max) x = max;
}

template<class T>
inline T	Fabs(T x)
{
	if(x < 0) x = -x;
	return x;
}

}	//end namespace SMediaPlayer

#endif