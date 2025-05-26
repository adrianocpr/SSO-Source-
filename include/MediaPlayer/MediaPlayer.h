#ifndef _MEDIA_PLAYER_H_
#define _MEDIA_PLAYER_H_

#include "MediaPlayerExp.h"
#include "MediaDefine.h"
#include "AudioPlayerBase.h"
#include "EC_MediaPlayer.h"

namespace SMediaPlayer
{

class CVideoPlayer;
class CAudioPlayerBase;
class CVideoDecoder;


class _MediaPlayer_Export CMediaPlayer:public CECMediaPlayer
{
public:
	CMediaPlayer();
	~CMediaPlayer();

//Êý¾Ý
public:
protected:
	char			m_szVideoPath[MAX_PATH];

	CVideoDecoder*	m_pVideoDecoder;
	CVideoPlayer*	m_pVideoPlayer;
	CAudioPlayerBase*	m_pAudioPlayerBase;

	bool			m_bIsInit;

	bool			m_bHasAudioCard;
	bool			m_bHasAudio;	
	bool			m_bIsUseExternalTimer;
	bool			m_bIsPaused;
	bool			m_bIsPlaying;
	CriticalSection m_cs;

private:
	Media_Log		m_pFuncLog;

//²Ù×÷
public:
	const char*		GetVideoPath()		{ return m_szVideoPath; }

	CVideoDecoder*	GetVideoDecoder()	{ return m_pVideoDecoder; }
	bool			IsPaused() const	{ return m_bIsPaused; }
	bool			IsPlaying() const	{ return m_bIsPlaying; }

public:
#ifdef _USEFMOD
	bool		Init(const char* szVideoPath, FMOD::System* pDS, Video_CallBack pVideoCallBack, void* pVideoUserData);
	bool		Init(const char* szVideoPath, FMOD::System* pDS);
#else
	bool		Init(const char* szVideoPath,LPDIRECTSOUND8 pDS,Video_CallBack pVideoCallBack,void* pVideoUserData);
	bool		Init(const char* szVideoPath,LPDIRECTSOUND8 pDS);
#endif
	void		Release();
	
	//call before init
	void		SetHasAudioCard(bool b)				{ m_bHasAudioCard = b; }
	void		SetMediaLogFunc(Media_Log pFunc)	{ m_pFuncLog = pFunc; }

	void		SetVideoCallBack(Video_CallBack pCallBack,void* pVideoUserData);

	bool		Play();
	bool		Pause(bool bPause);
	bool		Stop();
	bool		Seek(double fTime);
	
	float		GetPlaySpeed();
	bool		SetPlaySpeed(float speed);

	DWORD		GetVolume();
	void 		SetVolume(DWORD dwVolume);

	bool		IsLoop();
	void		SetIsLoop(bool b);

	double		GetCurTime();

	bool		SaveImage(unsigned char* pBuf,int width,int height,bool bRGBA,int iFrame);

	bool		Update();

protected:
	static void	Loop_CallBack(void* pUserData);
	void		_loop_callback();
	static void	Finish_CallBack(void* pUserData);
	void		_finish_CallBack();
};

}	//end namespace SMediaPlayer

#endif