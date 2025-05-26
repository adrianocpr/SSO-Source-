#ifndef _AUDIO_PLAYER_H_
#define _AUDIO_PLAYER_H_

#include "MediaDefine.h"
#include "Timer.h"
#include "AudioPlayerBase.h"

namespace SMediaPlayer
{

class CMediaPlayer;
class CVideoDecoder;

class CAudioPlayer : public CAudioPlayerBase
{
public:
	CAudioPlayer();
	~CAudioPlayer();

//Êý¾Ý
public:

protected:
	IDirectSoundBuffer*		m_pDSBuffer;
	IDirectSoundNotify*		m_pDSNotify;

	HANDLE					m_hThread;
	HANDLE					m_hEvent;
	CRITICAL_SECTION		m_csBuffer;

	DWORD					m_dwBufferSize;
	DWORD					m_dwOneSampleBytes;

	DWORD					m_dwWritedSize;
	int						m_nLastWriteEndCursor;

	double					m_fAudioDuration;
	CTimer					m_Timer;

//²Ù×÷
public:
	inline const Audio_Param&	GetAudioParam() { return m_AudioParam; }
	inline bool		IsPlaying()		{ return !m_bAlreadyPaused; }
	inline bool		IsPaused()		{ return m_bPaused; }
	inline DWORD	GetVolume()		{ return m_dwVolume; }
	inline float	GetPlaySpeed()	{ return m_fPlaySpeed; }

public:
	bool		Init(CMediaPlayer* pMediaPlayer,LPDIRECTSOUND8 pDS,Audio_Param& ap);
	void		Release();

	bool		Play();
	bool		Stop();
	bool		Pause(bool bPause);
	bool		Seek(double fTime);
	bool		SetPlaySpeed(float fSpeed);
	bool		SetVolume(DWORD dwVolume);

	__int64		GetPlaySampleIndex();

protected:
	bool		_createStreamBuffer(LPDIRECTSOUND8 pDS);
	bool		_fillBuffer();
	bool		_clearBuffer();

protected:
	static DWORD WINAPI	_thread_audio(void* pArg);
	DWORD		thread_audio();
};

}	//end namespace SMediaPlayer

#endif