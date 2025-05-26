#ifndef _VIDEO_PLAYER_H_
#define _VIDEO_PLAYER_H_

#include "MediaDefine.h"
#include "Timer.h"

namespace SMediaPlayer
{

class CMediaPlayer;
class CVideoDecoder;

class CVideoPlayer
{
public:
	CVideoPlayer();
	~CVideoPlayer();

//Êý¾Ý
public:
protected:
	CMediaPlayer*	m_pMediaPlayer;	
	CVideoDecoder*	m_pVideoDecoder;
	Video_CallBack	m_pVideoCallBack;
	void*			m_pVideoUserData;
	CriticalSection m_VideoCallBackCs;
		
	Media_Log		m_pFuncLog;

private:
	bool			m_bIsInit;
	HANDLE			m_hThread;
	VolatileValue<bool>	 m_bIsToExit;
	CTimer			m_Timer;
	VolatileValue<bool>	m_bPaused;	
	double			m_fCurTimerElapsed;		
	double			m_fTotalTimerElapsed;	

	VolatileValue<bool>	m_bAlreadyPaused;
	bool			m_bIsEnd;

	double			m_fVideoDuration;
	double			m_fLastDiff;

//²Ù×÷
public:
	bool		IsPaused()	{ return m_bPaused; }

public:
	bool		Init(CMediaPlayer* pMediaPlayer,Video_CallBack pCallBack,void* pVideoUserData);
	void		Release();

	void		SetVideoCallBack(Video_CallBack pCallBack,void* pVideoUserData);
	
	void		SetMediaLogFunc(Media_Log pFunc)	{ m_pFuncLog = pFunc; }

	bool		Play();
	bool		Stop();
	bool		Pause(bool bPause);

	bool		Seek();

	CTimer*		GetTimer()	{ return &m_Timer; }
	double		GetCurTime();

protected:
	void		MySleep(int interval);

protected:
	static DWORD WINAPI	_thread_video(void* pArg);
	DWORD		thread_video();
	bool		InvokeVideoCallBack(double fCurTime);
};

}	//end namespace SMediaPlayer

#endif