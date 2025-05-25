#include "StdAfx.h"
#include "AudioObjectBGM.h"
#include <FEventInstance.h>
#include <FEventSystem.h>
#include <FEvent.h>

AudioObjectBGM::AudioObjectBGM(void)
{
	m_iType = AUDIO_BGM;
	m_pMusicDay = 0;
	m_pMusicNight = 0;
	m_pEnvEffectDay = 0;
	m_pEnvEffectNight = 0;

	m_pMusicDayEvent = 0;
	m_pMusicNightEvent = 0;
	m_pEnvEffectDayEvent = 0;
	m_pEnvEffectNightEvent = 0;

	m_fTop = 0;
	m_fBottom = 0;

	m_fDNFactor = 0;

	m_iPriority = 0;
}

AudioObjectBGM::~AudioObjectBGM(void)
{
	release();
}

void AudioObjectBGM::release()
{
	releaseEventInstance(m_pMusicDay, true);
	releaseEventInstance(m_pMusicNight, true);
	releaseEventInstance(m_pEnvEffectDay, true);
	releaseEventInstance(m_pEnvEffectNight, true);
}

void AudioObjectBGM::SetHeightRange(float fBottom, float fTop)
{
	if(fBottom < fTop)
	{
		m_fBottom = fBottom;
		m_fTop = fTop;
	}
	else
	{
		m_fBottom = fTop;
		m_fTop = fBottom;
	}
}

void AudioObjectBGM::GetHeightRange(float& fBottom, float& fTop)const
{
	fBottom = m_fBottom;
	fTop = m_fTop;
}

void AudioObjectBGM::SetMusicEvent(const char* szGuid, bool bDay)
{
	if(!m_pEventSystem)
		return;
	if(bDay)
		m_pMusicDayEvent = m_pEventSystem->GetEvent(szGuid);
	else
		m_pMusicNightEvent = m_pEventSystem->GetEvent(szGuid);
}

void AudioObjectBGM::SetEnvEffectEvent(const char* szGuid, bool bDay)
{
	if(!m_pEventSystem)
		return;
	if(bDay)
		m_pEnvEffectDayEvent = m_pEventSystem->GetEvent(szGuid);
	else
		m_pEnvEffectNightEvent = m_pEventSystem->GetEvent(szGuid);
}

void AudioObjectBGM::SetDNFactor(float fDNFactor)
{
	m_fDNFactor = fDNFactor;
}

void AudioObjectBGM::SetPriority(int iPriority)
{
	m_iPriority = iPriority;
}

int AudioObjectBGM::GetPriority() const
{
	return m_iPriority;
}

bool AudioObjectBGM::PlayMusic()
{
	if(m_fDNFactor < 0.5f)
	{
		if(!m_pMusicDayEvent)
			return false;
		if(m_pMusicDay && m_pMusicDay->IsStopping())
		{
			m_pMusicDay->RemoveListener(this);
			m_pMusicDay = 0;
		}
		m_pMusicDay = m_pMusicDayEvent->CreateInstance();
		if(!m_pMusicDay)
			return false;
		if(!m_pMusicDay->Start())
			return false;
		m_pMusicDay->AddListener(this);
	}
	else
	{
		if(!m_pMusicNightEvent)
			return false;
		if(m_pMusicNight && m_pMusicNight->IsStopping())
		{
			m_pMusicNight->RemoveListener(this);
			m_pMusicNight = 0;
		}
		m_pMusicNight = m_pMusicNightEvent->CreateInstance();
		if(!m_pMusicNight)
			return false;
		if(!m_pMusicNight->Start())
			return false;
		m_pMusicNight->AddListener(this);
	}

	return true;
}

bool AudioObjectBGM::PlayEnvEffect()
{
	if(m_fDNFactor < 0.5f)
	{
		if(!m_pEnvEffectDayEvent)
			return false;
		if(m_pEnvEffectDay && m_pEnvEffectDay->IsStopping())
		{
			m_pEnvEffectDay->RemoveListener(this);
			m_pEnvEffectDay = 0;
		}
		m_pEnvEffectDay = m_pEnvEffectDayEvent->CreateInstance();
		if(!m_pEnvEffectDay)
			return false;
		if(!m_pEnvEffectDay->Start())
			return false;
		m_pEnvEffectDay->AddListener(this);
	}
	else
	{
		if(!m_pEnvEffectNightEvent)
			return false;
		if(m_pEnvEffectNight && m_pEnvEffectNight->IsStopping())
		{
			m_pEnvEffectNight->RemoveListener(this);
			m_pEnvEffectNight = 0;
		}
		m_pEnvEffectNight = m_pEnvEffectNightEvent->CreateInstance();
		if(!m_pEnvEffectNight)
			return false;
		if(!m_pEnvEffectNight->Start())
			return false;
		m_pEnvEffectNight->AddListener(this);
	}

	return true;
}

bool AudioObjectBGM::StopMusic()
{
	if(m_pMusicDay)
	{
		if(m_pMusicDay->IsPlaying())
			if(!m_pMusicDay->Stop())
				return false;
	}

	if(m_pMusicNight)
	{
		if(m_pMusicNight->IsPlaying())
			if(!m_pMusicNight->Stop())
				return false;
	}
	return true;
}

bool AudioObjectBGM::StopEnvEffect()
{
	if(m_pEnvEffectDay)
	{
		if(m_pEnvEffectDay->IsPlaying())
			if(!m_pEnvEffectDay->Stop())
				return false;
	}

	if(m_pEnvEffectNight)
	{
		if(m_pEnvEffectNight->IsPlaying())
			if(!m_pEnvEffectNight->Stop())
				return false;
	}
	return true;
}

EventInstance* AudioObjectBGM::GetMusic() const
{
	if(m_fDNFactor < 0.5f)
		return m_pMusicDay;
	else
		return m_pMusicNight;
}

EventInstance* AudioObjectBGM::GetEnvEffect() const
{
	if(m_fDNFactor < 0.5f)
		return m_pEnvEffectDay;
	else
		return m_pEnvEffectNight;
}

Event* AudioObjectBGM::GetMusicEvent() const
{
	if(m_fDNFactor < 0.5f)
		return m_pMusicDayEvent;
	else
		return m_pMusicNightEvent;
}

Event* AudioObjectBGM::GetEnvEffectEvent() const
{
	if(m_fDNFactor < 0.5f)
		return m_pEnvEffectDayEvent;
	else
		return m_pEnvEffectNightEvent;
}

void AudioObjectBGM::SetVolume(float fMusicVolume, float fEnvEffectVolume)
{
	if(m_pMusicDay)
		m_pMusicDay->SetVolume(fMusicVolume);

	if(m_pMusicNight)
		m_pMusicNight->SetVolume(fMusicVolume);

	if(m_pEnvEffectDay)
		m_pEnvEffectDay->SetVolume(fEnvEffectVolume);

	if(m_pEnvEffectNight)
		m_pEnvEffectNight->SetVolume(fEnvEffectVolume);
}

bool AudioObjectBGM::OnStop(EventInstance* pEventInstance)
{
	pEventInstance->RemoveListener(this);
	if(pEventInstance == m_pMusicDay)
		m_pMusicDay = 0;
	if(pEventInstance == m_pMusicNight)
		m_pMusicNight = 0;
	if(pEventInstance == m_pEnvEffectDay)
		m_pEnvEffectDay = 0;
	if(pEventInstance == m_pEnvEffectNight)
		m_pEnvEffectNight = 0;
	return true;
}

bool AudioObjectBGM::IsPtIn(float x, float y, float z)
{
	if(!AudioObjectBase::IsPtIn(x, z))
		return false;
	if(y < m_fTop && y > m_fBottom)
		return true;
	return false;
}

bool AudioObjectBGM::Reload()
{
	if(!reload(m_pMusicDayEvent, m_pMusicDay))
		return false;
	if(!reload(m_pMusicNightEvent, m_pMusicNight))
		return false;
	if(!reload(m_pEnvEffectDayEvent, m_pEnvEffectDay))
		return false;
	if(!reload(m_pEnvEffectNightEvent, m_pEnvEffectNight))
		return false;
	return true;
}