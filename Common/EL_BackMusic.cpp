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

#include "StdAfx.h"
#include "EL_BackMusic.h"
#include "IO.h"
#include "AFI.h"
#include "AFileUnicode.h"

#define BACK_MUSIC_FADE_SPEED 0.05f

CELBackMusic::sSingleSoundCtrl::sSingleSoundCtrl()
{
	pSoundStream = NULL;
	Release();
}

CELBackMusic::sSingleSoundCtrl::~sSingleSoundCtrl()
{
	Release();
}

void CELBackMusic::sSingleSoundCtrl::Release()
{
	if (pSoundStream)
	{
		pSoundStream->Stop();
		pSoundStream->Release();
		delete pSoundStream;
		pSoundStream = NULL;
	}
	iFadeState			= FADE_NONE;
	fVolumeDelta		= 0.0f;	
	fAttenuation		= 1.0f;
	fNextAttenuation	= 1.0f;
	nVolume				= 0;		
	nMaxVolume			= 100;	
	bLoop				= false;
	szNextFile[0]		= '\0';
}

CELBackMusic::CELBackMusic()
: m_bgmPlayList()
{
	m_pSoundEngine		= NULL;
	m_pSoundStream		= NULL;

	m_fadeState			= FADE_NONE;
	m_fVolumeDelta		= 0.0f;
	m_nVolume			= 0;
    m_nMusicVolume      = 0;
    m_nFadeInVolume     = 0;
    m_nFadeOutVolume    = 0;
	m_nStreamVolume		= 100;

	m_bFirstBGM			= true;
	m_nSilenceTime		= 1000;
	m_ticksSilenced		= 0;
	m_ticksWait			= 0;
	
	m_idBGMPlaying		= -1;

	m_typeLoop			= LOOP_ALL;
	m_bPaused			= false;
    m_bNeedCallOnEndMusic = false;
}

CELBackMusic::~CELBackMusic()
{
	Release();
}

bool CELBackMusic::Init(AMSoundEngine * pSoundEngine)
{
	m_pSoundEngine = pSoundEngine;
	m_nSilenceTime = 0;

	m_pSoundStream = new AMSoundStream();
	if( !m_pSoundStream->Init(m_pSoundEngine, NULL) )
	{
		Release();
		return false;
	}
	m_pSoundStream->SetLoopFlag(false);
	m_pSoundStream->SetVolume(0);
	m_nVolume = 0;
	m_nStreamVolume = 100;

	//single sound controls
	for (int i=0; i<SST_NUM; ++i)
	{
		sSingleSoundCtrl& ctrl = m_SingleSoundCtrl[i];
		ctrl.Release();
		ctrl.pSoundStream = new AMSoundStream();
		if( !ctrl.pSoundStream->Init(m_pSoundEngine, NULL) )
		{
			Release();
			return false;
		}
		ctrl.bLoop = (SST_BACK_SFX==i);
		ctrl.pSoundStream->SetLoopFlag(ctrl.bLoop);
		ctrl.pSoundStream->SetVolume(0);
	}
	return true;
}

bool CELBackMusic::Release()
{
	if( m_pSoundStream )
	{
		m_pSoundStream->Stop();

		m_pSoundStream->Release();
		delete m_pSoundStream;
		m_pSoundStream = NULL;
	}

	for (int i=0; i<SST_NUM; ++i)
	{
		m_SingleSoundCtrl[i].Release();
	}

	m_idBGMPlaying = -1;
	m_bPaused = false;
	return true;
}

bool CELBackMusic::Update(int nDeltaTime)
{
	if (m_bPaused) return true;

	if (m_ticksWait > 0)
	{
		m_ticksWait -= nDeltaTime;
		if( m_ticksWait <= 0 )
			m_ticksWait = 0;

		return true;
	}


	if (m_ticksSilenced > 0)
	{
		m_ticksSilenced -= nDeltaTime;
		if (m_ticksSilenced <= 0)
		{
			m_ticksSilenced = 0;
			if (m_bgmPlayList.size() > 0 && m_fadeState != FADE_OUT_PAUSE)
				_PlayNextBGM();
		}
		return true;
	}

	if( m_pSoundStream )
	{
		m_pSoundStream->Tick();

        if (m_pSoundStream->IsPaused())
        {
            m_pSoundStream->Pause(false);
        }

		if (m_pSoundStream->IsStopped())
		{
            if (m_bgmPlayList.size() > 0 && m_fadeState != FADE_OUT_PAUSE)
            {
			    if (m_bFirstBGM)
			    {
                    // first bgm, so just play it
				    _PlayNextBGM();
			    }
			    else
			    {
				    // do a long silence after finish playing this bgm
				    m_ticksSilenced = max(100, m_nSilenceTime);
			    }
            }
		}
	}

	if( m_fadeState == FADE_NONE)
		return true;

	m_fVolumeDelta += BACK_MUSIC_FADE_SPEED * nDeltaTime;
	int nVolumeDelta = (int)m_fVolumeDelta;
	m_fVolumeDelta -= nVolumeDelta;
	if( nVolumeDelta )
	{
		if( m_fadeState == FADE_IN )
		{
			m_nVolume += nVolumeDelta;
			if( m_nVolume >= m_nMusicVolume )
			{
				m_fadeState = FADE_NONE;
				m_nVolume = m_nMusicVolume;
			}
		}
        else if( m_fadeState == FADE_OUT_PAUSE)
        {
            m_nVolume -= nVolumeDelta;
            if( m_nVolume <= 0 )
            {
                m_fadeState = FADE_NONE;
                m_nVolume = 0;
                PauseMusic(true);
            }
        }
		else if( m_fadeState == FADE_OUT )
		{
			m_nVolume -= nVolumeDelta;
			if( m_nVolume <= m_nFadeOutVolume )
			{
				m_fadeState = FADE_NONE;
				m_nVolume = 0;
				_PlayNextBGM();
			}
        }
        if( m_pSoundStream )
			m_pSoundStream->SetVolume(m_nVolume * m_nStreamVolume / 100);
	}

	return true;
}

bool CELBackMusic::PlayMusic(const char * szBGMFile, bool bFadeIn, bool bClearPlayList, int volume, int fadeInVolume, int fadeOutVolume)
{
	if( bClearPlayList )
	{
		StopMusic(true, true);
	}

	BGMTAG bgm;
	strncpy(bgm.bgmFile, szBGMFile, MAX_PATH);
	bgm.fadeIn = bFadeIn ? 1 : 0;
    bgm.musicVolume = volume;
    bgm.fadeInVolume = fadeInVolume;
    bgm.fadeOutVolume = fadeOutVolume;
	m_bgmPlayList.push_back(bgm);

	// clear silence time
	m_ticksSilenced = 0;
	m_bPaused = false;
	return true;
}

bool CELBackMusic::StopMusic(bool bFadeOut, bool bClearPlayList)
{
	if( bClearPlayList )
	{
		m_bgmPlayList.clear();
		m_idBGMPlaying = -1;
        m_bFirstBGM	= true;
        // clear silence time
	    m_ticksSilenced = 0;
	}

    if (bFadeOut)
    {
        if (!bClearPlayList)
        {
            m_fadeState = FADE_OUT_PAUSE;
        }
        else
        {
            m_fadeState = FADE_OUT;
        }
    }

	if( !m_pSoundStream)
		return true;

	if( !bFadeOut )
	{
		m_nVolume = 0;

		if( m_pSoundStream )
		{
			m_pSoundStream->Stop();
			m_pSoundStream->SetVolume(0);
		}
	}

	return true;
}

bool CELBackMusic::_PlayNextBGM()
{
	m_bFirstBGM = false;

	if( m_bgmPlayList.size() == 0 )
		return true;

	if( m_idBGMPlaying == -1 ) // first time first bgm
	{
		m_idBGMPlaying = 0;
	}
	else
	{
		int nNumBGMInList = m_bgmPlayList.size();
		if( m_typeLoop == LOOP_NONE ||
			m_typeLoop == LOOP_ALL && nNumBGMInList < 1 ||
			m_typeLoop == LOOP_EXCEPT_FIRST && nNumBGMInList < 2 ||
			m_typeLoop == LOOP_ONCE && nNumBGMInList == m_idBGMPlaying+1 )
		{
			StopMusic(false, true);
            m_bNeedCallOnEndMusic = true;
			return true;
		}

		// see if loop or not
		switch(m_typeLoop)
		{
		case LOOP_NONE:
			break;

		case LOOP_ONCE:
		case LOOP_ALL:
			m_idBGMPlaying = (m_idBGMPlaying + 1) % nNumBGMInList;
			break;

		case LOOP_EXCEPT_FIRST:
			m_idBGMPlaying = (m_idBGMPlaying + 1) % nNumBGMInList;
			if( m_idBGMPlaying == 0 ) // no first bgm in loop
				m_idBGMPlaying = (m_idBGMPlaying + 1) % nNumBGMInList;
			break;
		}
	}


	BGMTAG& tag = m_bgmPlayList[m_idBGMPlaying];
    m_nMusicVolume = tag.musicVolume;
    m_nFadeInVolume = tag.fadeInVolume;
    m_nFadeOutVolume = tag.fadeOutVolume;

	if( m_pSoundStream )
	{
		if( !m_pSoundStream->Play(tag.bgmFile) )
		{
			// can't open this bgm file, so remove it from the list
			m_bgmPlayList.erase(&tag);
			return true;
		}
	}

	if( tag.fadeIn )
    {
		m_fadeState = FADE_IN;
        m_nVolume = tag.fadeInVolume;
    }
	else
	{
		m_fadeState = FADE_NONE;
		m_nVolume = tag.musicVolume;
	}

    if( m_pSoundStream )
        m_pSoundStream->SetVolume(m_nVolume * m_nStreamVolume / 100);
	
	return true;
}

bool CELBackMusic::SetVolume(int nVolume)
{
	if( nVolume >= 0 )
		m_nStreamVolume = nVolume;

	if( m_pSoundStream )
		m_pSoundStream->SetVolume(m_nVolume * m_nStreamVolume / 100);
	return true;
}

bool CELBackMusic::RestartMusic()
{
	// now we can play music again, but before that insert some silence before we can play it
    m_ticksWait = 1000;
    m_fadeState = FADE_IN;
    PauseMusic(false);
	return true;
}

bool CELBackMusic::PauseMusic(bool bPause)
{
	m_bPaused = bPause;
    if (m_pSoundStream)
    {
        if (m_pSoundStream->IsPaused() && !bPause)
        {
            m_pSoundStream->Pause(false);
        }
        else if (m_pSoundStream->IsPlaying() && bPause)
        {
            m_pSoundStream->Pause(true);
        }
    }

	return true;
}

bool CELBackMusic::_UpdateSingleSound(const unsigned int index ,const int nDeltaTime)
{
	if (index>=SST_NUM)
	{
		ASSERT(0);
		return false;
	}
	sSingleSoundCtrl& ctrl = m_SingleSoundCtrl[index];

	if( m_ticksWait )
	{
		return true;
	}

	if( ctrl.pSoundStream )
	{
		ctrl.pSoundStream->Tick();
		if( ctrl.pSoundStream->IsStopped() && ctrl.szNextFile[0] )
		{
			ctrl.pSoundStream->Play(ctrl.szNextFile);
			ctrl.iFadeState			= FADE_IN;
			ctrl.fAttenuation		= ctrl.fNextAttenuation;
			ctrl.fNextAttenuation	= 1.0f;
			ctrl.szNextFile[0]		= '\0';
		}
	}

	if( ctrl.iFadeState == FADE_NONE)
		return true;

	ctrl.fVolumeDelta += BACK_MUSIC_FADE_SPEED * nDeltaTime;
	int nVolumeDelta = (int)ctrl.fVolumeDelta;
	ctrl.fVolumeDelta -= nVolumeDelta;
	if( nVolumeDelta )
	{
		if( ctrl.iFadeState == FADE_IN )
		{
			ctrl.nVolume += nVolumeDelta;
			if( ctrl.nVolume >= 100 )
			{
				ctrl.iFadeState = FADE_NONE;
				ctrl.nVolume = 100;
			}
		}
		else
		{
			ctrl.nVolume -= nVolumeDelta;
			if( ctrl.nVolume <= 0 )
			{
				ctrl.iFadeState = FADE_NONE;
				ctrl.nVolume = 0;
				
				if( ctrl.pSoundStream )
				{
					if( ctrl.szNextFile[0] )
					{
						ctrl.pSoundStream->Play(ctrl.szNextFile);
						ctrl.iFadeState			= FADE_IN;
						ctrl.fAttenuation		= ctrl.fNextAttenuation;
						ctrl.fNextAttenuation	= 1.0f;
						ctrl.szNextFile[0]		= '\0';
					}
					else
					{
						ctrl.pSoundStream->Stop();
					}
				}
			}
		}
		if( ctrl.pSoundStream )
		{
			DWORD volume = (DWORD)(ctrl.fAttenuation * ctrl.nVolume * ctrl.nMaxVolume / 100);
			ctrl.pSoundStream->SetVolume(volume);
		}
	}

	return true;
}

bool CELBackMusic::_SetSingleSoundVolume(const unsigned int index , const int nVolume)
{
	if (index>=SST_NUM)
	{
		ASSERT(0);
		return false;
	}

	sSingleSoundCtrl& ctrl = m_SingleSoundCtrl[index];
	if( nVolume >= 0 )
	{
		ctrl.nMaxVolume = nVolume;
	}
	if( ctrl.pSoundStream )
	{
		DWORD volume = (DWORD)(ctrl.fAttenuation * ctrl.nVolume * ctrl.nMaxVolume / 100);
		ctrl.pSoundStream->SetVolume(volume);
	}
	return true;
}

bool CELBackMusic::_PlaySingleSound(const unsigned int index ,const char * szFile, bool bFadeIn)
{
	if (index>=SST_NUM)
	{
		ASSERT(0);
		return false;
	}

	sSingleSoundCtrl& ctrl  = m_SingleSoundCtrl[index];
	strncpy(ctrl.szNextFile, szFile, MAX_PATH);	
	if( ctrl.pSoundStream && ctrl.pSoundStream->IsPlaying() )
	{
		if( bFadeIn )
		{
			ctrl.iFadeState = FADE_OUT;
		}
		else 
		{
			ctrl.pSoundStream->Stop();
			ctrl.iFadeState = FADE_NONE;
		}
	}
	ctrl.fNextAttenuation	= 1.0f;
	
	return true;
}

bool CELBackMusic::_StopSingleSound(const unsigned int index , const bool bFadeOut)
{
	if (index>=SST_NUM)
	{
		ASSERT(0);
		return false;
	}
	sSingleSoundCtrl& ctrl = m_SingleSoundCtrl[index];
	if( !ctrl.pSoundStream || ctrl.pSoundStream->IsStopped() )
	{
		return true;
	}

	if(bFadeOut && ctrl.pSoundStream->IsPlaying() )
	{
		ctrl.iFadeState = FADE_OUT;
	}
	else
	{
		ctrl.pSoundStream->Stop();
		ctrl.iFadeState = FADE_NONE;
	}
	ctrl.szNextFile[0]		= '\0';
	ctrl.fNextAttenuation	= 1.0f;
	return true;
}

bool CELBackMusic::UpdateSFX(int nDeltaTime)
{
	return _UpdateSingleSound(SST_BACK_SFX, nDeltaTime);
}

bool CELBackMusic::SetSFXVolume(int nVolume)
{
	return _SetSingleSoundVolume(SST_BACK_SFX, nVolume);
}

bool CELBackMusic::PlayBackSFX(const char * szSFXFile)
{
	return _PlaySingleSound(SST_BACK_SFX, szSFXFile);
}

bool CELBackMusic::PlayBackSFX(const char * szSFXFile, float attenuation, bool bFadeIn)
{
	bool bRet = _PlaySingleSound(SST_BACK_SFX, szSFXFile, bFadeIn);
	a_Clamp(attenuation, 0.0f, 1.0f);
	sSingleSoundCtrl& ctrl = m_SingleSoundCtrl[SST_BACK_SFX];
	ctrl.fNextAttenuation = attenuation;
	return bRet;
}

bool CELBackMusic::StopBackSFX(bool bFadeOut)
{
	return _StopSingleSound(SST_BACK_SFX, bFadeOut);
}

bool CELBackMusic::UpdateCommentator(int nDeltaTime)
{
	bool bResult1 = _UpdateSingleSound(SST_COMMENTATOR, nDeltaTime);
	bool bResult2 = _UpdateSingleSound(SST_OTHER, nDeltaTime);
	return (bResult1 || bResult2);
}

bool CELBackMusic::SetCommentatorVolume(int nVolume)
{
	bool bResult1 = _SetSingleSoundVolume(SST_COMMENTATOR, nVolume);
	bool bResult2 = _SetSingleSoundVolume(SST_OTHER, nVolume);
	return (bResult1 || bResult2);
}

bool CELBackMusic::PlayCommentator(const char * szCommentatorFile)
{
	return _PlaySingleSound(SST_COMMENTATOR, szCommentatorFile);
}

bool CELBackMusic::StopCommentator(bool bFadeOut)
{
	return _StopSingleSound(SST_COMMENTATOR, bFadeOut);
}

bool CELBackMusic::PlayOtherSound(const char * szFile, bool bLoop)
{
	sSingleSoundCtrl& ctrl = m_SingleSoundCtrl[SST_OTHER];
	ctrl.bLoop = bLoop;
	if (ctrl.pSoundStream)
	{
		ctrl.pSoundStream->SetLoopFlag(ctrl.bLoop);
	}
	return _PlaySingleSound(SST_OTHER, szFile);
}

bool CELBackMusic::StopOtherSound(bool bFadeOut)
{
	return _StopSingleSound(SST_OTHER, bFadeOut);
}

bool CELBackMusic::IsPlayingMusic() const
{
    return (!m_bPaused && m_pSoundStream && m_pSoundStream->IsPlaying());
}

int CELBackMusic::GetMusicListSize() const
{
    return m_bgmPlayList.size();
}

int CELBackMusic::GetCurMusicIndex() const
{
    return m_idBGMPlaying;
}

const char* CELBackMusic::GetMusicFileName(int index)
{
    if (size_t(index) < m_bgmPlayList.size())
    {
        return m_bgmPlayList[index].bgmFile;
    }
    return "no music";
}

const char* CELBackMusic::GetCurMusicFileName()
{
    if (m_pSoundStream && m_pSoundStream->IsPlaying())
    {
        return m_pSoundStream->GetStreamFileName();
    }
    return "no music";
}

const char* CELBackMusic::GetCurSFXFileName()
{
    sSingleSoundCtrl& ctrl = m_SingleSoundCtrl[SST_BACK_SFX];
	if (ctrl.pSoundStream && ctrl.pSoundStream->IsPlaying())
    {
        return ctrl.pSoundStream->GetStreamFileName();
    }
    return "no sfx";
}

