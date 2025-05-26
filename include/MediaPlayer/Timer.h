#ifndef _TIMER_H_
#define _TIMER_H_

class CTimer
{
public:
	CTimer();
	~CTimer();

//Êý¾Ý
public:
protected:
	bool			m_bUseLargeTime;				
	
	//m_bUseLargeTime = true
	__int64			m_int64OneSecondTicks;			
	__int64			m_int64TimeTickStartCounts;		

	//m_bUseLargeTime = false
	unsigned long	m_ulTimeStart;					

	size_t			m_iFrameCount;
	float			m_fFPS;
	float			m_fLastSecond;

//²Ù×÷
public:
	inline float	GetFPS()			{ return m_fFPS; }
	void			ResetTimer();
	float			GetElapsedTime();
	float			GetCurTime();		
	void			UpdateFPS();
};

#endif