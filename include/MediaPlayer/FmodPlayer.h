#pragma once

#ifdef _USEFMOD
#include "AudioPlayerBase.h"


namespace SMediaPlayer
{
	class CFmodSystem;

	class CFmodPlayer : public CAudioPlayerBase
	{
	public:
		CFmodPlayer(void);
		~CFmodPlayer(void);
	public:

		virtual bool		Init(CMediaPlayer* pMediaPlayer,FMOD::System* pSystem,Audio_Param& ap);
		virtual void		Release();

		virtual bool		Play();
		virtual bool		Stop();
		virtual bool		Pause(bool bPause);
		virtual bool		Seek(double fTime);
		virtual bool		SetPlaySpeed(float fSpeed);
		virtual bool		SetVolume(DWORD dwVolume);
		virtual __int64		GetPlaySampleIndex();
		virtual bool		Update();
	protected:
		FMOD::System*		m_pSystem;
		FMOD::Sound*		m_pSound;
		FMOD::Channel*		m_pChannel;
	};
}
#endif