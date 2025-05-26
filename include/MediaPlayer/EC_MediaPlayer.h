#ifndef _ECMEDIA_PLAYER_H_
#define _ECMEDIA_PLAYER_H_

#include "MediaDefine.h"

class CECMediaPlayer
{
//²Ù×÷
public:
	_MediaPlayer_Export virtual const char*		GetVideoPath(){ return NULL; }
	_MediaPlayer_Export virtual bool			IsPaused() const{return true;}
	_MediaPlayer_Export virtual bool			IsPlaying() const{return true;}

public:
#ifdef _USEFMOD
	_MediaPlayer_Export virtual bool		Init(const char* szVideoPath, FMOD::System* pDS, SMediaPlayer::Video_CallBack pVideoCallBack, void* pVideoUserData){return true;}
	_MediaPlayer_Export virtual bool		Init(const char* szVideoPath, FMOD::System* pDS){return true;}
#else
	_MediaPlayer_Export virtual bool		Init(const char* szVideoPath,LPDIRECTSOUND8 pDS,Video_CallBack pVideoCallBack,void* pVideoUserData){return true;}
	_MediaPlayer_Export virtual bool		Init(const char* szVideoPath,LPDIRECTSOUND8 pDS){return true;}
#endif
	_MediaPlayer_Export virtual void		Release(){ }

	//call before init
	_MediaPlayer_Export virtual void		SetHasAudioCard(bool b)				{}

	_MediaPlayer_Export virtual void		SetVideoCallBack(SMediaPlayer::Video_CallBack pCallBack,void* pVideoUserData){}
	
	_MediaPlayer_Export virtual int			GetVideoWidth()	const				{ return 0; }	
	_MediaPlayer_Export virtual int			GetVideoHeight() const				{ return 0; }

	_MediaPlayer_Export virtual bool		Play(){return true;}
	_MediaPlayer_Export virtual bool		Pause(bool bPause){return true;}
	_MediaPlayer_Export virtual bool		Stop(){return true;}
	_MediaPlayer_Export virtual bool		Seek(double fTime){return true;}
	
	_MediaPlayer_Export virtual float		GetPlaySpeed(){return 0;}
	_MediaPlayer_Export virtual bool		SetPlaySpeed(float speed){return true;}

	_MediaPlayer_Export virtual DWORD		GetVolume(){return 0;}
	_MediaPlayer_Export virtual void 		SetVolume(DWORD dwVolume){ }

	_MediaPlayer_Export virtual bool		IsLoop(){return true;}
	_MediaPlayer_Export virtual void		SetIsLoop(bool b){ }


	_MediaPlayer_Export virtual bool		Update(){return true;}

protected:
	
};


#endif