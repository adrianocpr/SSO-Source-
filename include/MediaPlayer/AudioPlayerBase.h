#pragma once

#include "MediaDefine.h"


namespace FMOD
{
	class System;
	class Sound;
	class Channel;
}

namespace SMediaPlayer
{

	class CMediaPlayer;
	class CVideoDecoder;

	class CAudioPlayerBase
	{
	public:
		CAudioPlayerBase(void);
		virtual ~CAudioPlayerBase(void);

	//²Ù×÷
	public:
		inline const Audio_Param&	GetAudioParam() { return m_AudioParam; }
		inline bool		IsPlaying()		{ return !m_bAlreadyPaused; }
		inline bool		IsPaused()		{ return m_bPaused; }
		inline DWORD	GetVolume()		{ return m_dwVolume; }
		inline float	GetPlaySpeed()	{ return m_fPlaySpeed; }
		
		void			SetMediaLogFunc(Media_Log pFunc)	{ m_pFuncLog = pFunc; }

	public:
		virtual bool		Init(CMediaPlayer* pMediaPlayer, LPDIRECTSOUND8 pDS, Audio_Param& ap) { return true; }
		virtual bool		Init(CMediaPlayer* pMediaPlayer, FMOD::System* pDS, Audio_Param& ap) { return true; }
		virtual void		Release() { }
		
		virtual bool		Play() { return true; }
		virtual bool		Stop() { return true; }
		virtual bool		Pause(bool bPause) { return true; }
		virtual bool		Seek(double fTime) { return true; }
		virtual bool		SetPlaySpeed(float fSpeed) { return true; }
		virtual bool		SetVolume(DWORD dwVolume) { return true; }
		virtual __int64		GetPlaySampleIndex() { return 0; }
		virtual bool		Update() { return true; }
	protected:
		Audio_Param				m_AudioParam;
		bool					m_bIsInit;
		bool					m_bIsEnd;
		VolatileValue<bool>		m_bIsToExit;					
		VolatileValue<bool>		m_bPaused;	
		VolatileValue<bool>		m_bAlreadyPaused;
		float					m_fPlaySpeed;
		DWORD					m_dwVolume;
	protected:
		CMediaPlayer*			m_pMediaPlayer;	
		CVideoDecoder*			m_pVideoDecoder;

		Media_Log				m_pFuncLog;
	};

}