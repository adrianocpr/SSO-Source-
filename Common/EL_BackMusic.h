/*
 * FILE: EL_BackMusic.h
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Hedi, 2005/4/30
 *
 * HISTORY: 
 *
 * Copyright (c) 2005 Archosaur Studio, All Rights Reserved.
 */

#ifndef _EL_BACKMUSIC_H_
#define _EL_BACKMUSIC_H_

#include <AMSoundEngine.h>
#include <AMSoundStream.h>
#include <vector.h>

class CELBackMusic
{
public:
	
	enum FADESTATE
	{
		FADE_NONE = 0,
		FADE_IN,
		FADE_OUT,
        FADE_OUT_PAUSE,
	};

	enum LOOPTYPE
	{
		LOOP_NONE = 0,
		LOOP_ALL = 1,
		LOOP_EXCEPT_FIRST = 2,
		LOOP_ONCE = 3,
	};

	struct BGMTAG
	{
		int		fadeIn;				// indicates whether this bgm need fading in when played, 1 to be tree
        int     musicVolume;
        int     fadeInVolume;
        int     fadeOutVolume;
		char	bgmFile[MAX_PATH];	// bgm file name
	};

private:

	struct sSingleSoundCtrl
	{
		AMSoundStream * pSoundStream;
		FADESTATE		iFadeState;				// fading state
		float			fAttenuation;			// sound attenuation
		float			fVolumeDelta;			// volume delta
		int				nVolume;				// current volume
		int				nMaxVolume;				// max volume
		bool            bLoop;					// loop or not
		char 			szNextFile[MAX_PATH];	// next file
		float			fNextAttenuation;		// next sound attenuation

		sSingleSoundCtrl();
		~sSingleSoundCtrl();
		void Release();
	};

	enum SINGLE_SOUND_TYPE
	{
		SST_BACK_SFX = 0,	// back sfx
		SST_COMMENTATOR,	// commentator voice
		SST_OTHER,			// other sound
		SST_NUM,
	};

	AMSoundEngine *			m_pSoundEngine;		// sound engine object
	AMSoundStream *			m_pSoundStream;		// sound stream to play
	
	// back music section
	FADESTATE				m_fadeState;		// fading state
	float					m_fVolumeDelta;		// volume delta
	int						m_nVolume;			// current volume
	int						m_nMusicVolume;			// current music volume
	int						m_nFadeInVolume;	// fade in volume
	int						m_nFadeOutVolume;	// fade out volume
	int						m_nStreamVolume;	// stream max volume [0~100]
	int						m_idBGMPlaying;		// index of current playing bgm
	abase::vector<BGMTAG>	m_bgmPlayList;		// bgm play list
	bool					m_bFirstBGM;		// flag indicates this is the first bgm
	int						m_nSilenceTime;		// time of silence between two bgm
	int						m_ticksSilenced;	// time that doing silence
	LOOPTYPE				m_typeLoop;			// loop type;
	bool					m_bPaused;			// pause flag
	int						m_ticksWait;		// time wait before we can play music again

    bool                    m_bNeedCallOnEndMusic;

	sSingleSoundCtrl		m_SingleSoundCtrl[SST_NUM];
public:
	CELBackMusic();
	~CELBackMusic();

	bool Init(AMSoundEngine * pSoundEngine);
	bool Release();

	// back music section
	bool PlayMusic(const char * szBGMFile, bool bFadeIn=true, bool bClearPlayList=true,
                   int volume=100, int fadeInVolume=0, int fadeOutVolume=0);
	bool StopMusic(bool bFadeOut=true, bool bClearPlayList=true);
	bool PauseMusic(bool bPause);
	bool RestartMusic();
	bool Update(int nDeltaTime);
	bool SetVolume(int nVolume);
	int  GetVolume() const { return m_nStreamVolume; }
	void SetLoopType(LOOPTYPE typeLoop)			{ m_typeLoop = typeLoop; }
	void SetSilenceTime(int nMilliseconds)		{ m_nSilenceTime = nMilliseconds; }

	// back sfx section
	bool UpdateSFX(int nDeltaTime);
	bool SetSFXVolume(int nVolume);
	int  GetSFXVolume() const { return m_SingleSoundCtrl[SST_BACK_SFX].nMaxVolume; }
	bool PlayBackSFX(const char * szSFXFile);
	bool PlayBackSFX(const char * szSFXFile, float attenuation, bool bFadeIn);
	bool StopBackSFX(bool bFadeOut=true);

	// commentator section
	bool UpdateCommentator(int nDeltaTime);
	int  GetCommentatorVolume() const { return m_SingleSoundCtrl[SST_COMMENTATOR].nMaxVolume; }
	bool SetCommentatorVolume(int nVolume);
	bool PlayCommentator(const char * szCommentatorFile);
	bool StopCommentator(bool bFadeOut=true);

	bool PlayOtherSound(const char * szFile, bool bLoop);
	bool StopOtherSound(bool bFadeOut=true);

    bool IsSilenceMusic() const { return m_ticksSilenced > 0 ? true : false; }
    bool IsPlayingMusic() const;
    int GetMusicListSize() const;
    int GetCurMusicIndex() const;
    const char* GetMusicFileName(int index);
    const char* GetCurMusicFileName();
    const char* GetCurSFXFileName();
    bool IsNeedCallOnEndMusic() const { return m_bNeedCallOnEndMusic; }
    void FinishCallOnEndMusic() { m_bNeedCallOnEndMusic = false; }

protected:
	bool _PlayNextBGM(); 

	// single sound 
	bool _UpdateSingleSound(const unsigned int index ,const int nDeltaTime);
	bool _SetSingleSoundVolume(const unsigned int index , const int nVolume);
	bool _PlaySingleSound(const unsigned int index ,const char * szFile, bool bFadeIn=true);
	bool _StopSingleSound(const unsigned int index , const bool bFadeOut=true);	
};

#endif//_EL_BACKMUSIC_H_
