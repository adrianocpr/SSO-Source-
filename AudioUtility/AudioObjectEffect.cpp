#include "StdAfx.h"
#include "AudioObjectEffect.h"
#include <FEventInstance.h>
#include <FEventSystem.h>
#include <FEvent.h>

AudioObjectEffect::AudioObjectEffect(void)
{
	m_iType = AUDIO_EFFECT;

	m_pEffectDayEvent = 0;
	m_pEffectNightEvent = 0;
	m_pEffectDay = 0;
	m_pEffectNight = 0;

	m_fTop = 0;
	m_fBottom = 0;
	m_fVertFadeDistance = 0;
	m_fHoriFadeDistance = 0;
	m_fDNFactor = 0;

	m_fVolume = 1.0f;
}

AudioObjectEffect::~AudioObjectEffect(void)
{
	release();
}

void AudioObjectEffect::release()
{
	releaseEventInstance(m_pEffectDay, true);
	releaseEventInstance(m_pEffectNight, true);
}

void AudioObjectEffect::SetEffectEvent(const char* szGuid, bool bDay)
{
	if(!m_pEventSystem)
		return;
	if(bDay)
		m_pEffectDayEvent = m_pEventSystem->GetEvent(szGuid);
	else
		m_pEffectNightEvent = m_pEventSystem->GetEvent(szGuid);
}

void AudioObjectEffect::SetDNFactor(float fDNFactor)
{
	m_fDNFactor = fDNFactor;
}

void AudioObjectEffect::SetHeightRange(float fBottom, float fTop)
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

void AudioObjectEffect::GetHeightRange(float& fBottom, float& fTop) const
{
	fBottom = m_fBottom;
	fTop = m_fTop;
}

void AudioObjectEffect::SetFadeDistance(float fVertFadeDistance, float fHoriFadeDistance)
{
	m_fVertFadeDistance = fVertFadeDistance;
	m_fHoriFadeDistance = fHoriFadeDistance;
}

void AudioObjectEffect::GetFadeDistance(float& fVertFadeDistance, float& fHoriFadeDistance) const
{
	fVertFadeDistance = m_fVertFadeDistance;
	fHoriFadeDistance = m_fHoriFadeDistance;
}

bool AudioObjectEffect::Play()
{
	if(m_fDNFactor < 0.5f)
	{
		if(!m_pEffectDayEvent)
			return false;
		if(m_pEffectDay && m_pEffectDay->IsStopping())
		{
			m_pEffectDay->RemoveListener(this);
			m_pEffectDay = 0;
		}
		m_pEffectDay = m_pEffectDayEvent->CreateInstance();
		if(!m_pEffectDay)
			return false;
		if(!m_pEffectDay->Start())
			return false;
		m_pEffectDay->AddListener(this);
	}
	else
	{
		if(!m_pEffectNightEvent)
			return false;
		if(m_pEffectNight && m_pEffectNight->IsStopping())
		{
			m_pEffectNight->RemoveListener(this);
			m_pEffectNight = 0;
		}
		m_pEffectNight = m_pEffectNightEvent->CreateInstance();
		if(!m_pEffectNight)
			return false;
		if(!m_pEffectNight->Start())
			return false;
		m_pEffectNight->AddListener(this);
	}

	return true;
}

bool AudioObjectEffect::Stop()
{
	if(m_pEffectDay)
	{
		if(m_pEffectDay->IsPlaying())
			if(!m_pEffectDay->Stop())
				return false;
	}

	if(m_pEffectNight)
	{
		if(m_pEffectNight->IsPlaying())
			if(!m_pEffectNight->Stop())
				return false;
	}
	return true;
}

void AudioObjectEffect::Tick()
{
	if(!m_pEffectDayEvent || !m_pEffectNightEvent)
		return;
	if(m_vListenerPos.y < m_fBottom - m_fVertFadeDistance || m_vListenerPos.y > m_fTop + m_fVertFadeDistance)
		goto _out;
	float fVertVolume = 1.0f;
	float fHoriVolume = 1.0f;
	if(!IsPtIn(m_vListenerPos.x, m_vListenerPos.z))
	{
		float fHoriDistance = PtDistance(m_vListenerPos.x, m_vListenerPos.z);
		if(fHoriDistance > m_fHoriFadeDistance)
			goto _out;
		if(m_fHoriFadeDistance == 0)
			fHoriVolume = 0;
		else
			fHoriVolume = 1.0f - fHoriDistance/m_fHoriFadeDistance;
	}

	float fVertDistance = 0.0f;
	if(m_vListenerPos.y > m_fTop)
	{
		fVertDistance = m_vListenerPos.y - m_fTop;
	}
	else if(m_vListenerPos.y < m_fBottom)
	{
		fVertDistance = m_fBottom - m_vListenerPos.y;
	}
	if(m_fVertFadeDistance == 0)
		fVertVolume = 0.0f;
	if(fVertDistance > 0 && m_fVertFadeDistance != 0)
		fVertVolume = 1.0f - fVertDistance/m_fVertFadeDistance;


	if(m_fDNFactor < 0.5f)
	{
		if(m_pEffectNight)
		{
			m_pEffectNight->SetVolume(0);
			if(m_pEffectNight->IsPlaying())
				Stop();
		}
		if(!m_pEffectDay)
			Play();
		if(m_pEffectDay)
			m_pEffectDay->SetVolume(m_fVolume*fVertVolume*fHoriVolume);
	}
	else
	{
		if(m_pEffectDay)
		{
			m_pEffectDay->SetVolume(0);
			if(m_pEffectDay->IsPlaying())
				Stop();
		}
		if(!m_pEffectNight)
			Play();
		if(m_pEffectNight)
			m_pEffectNight->SetVolume(m_fVolume*fVertVolume*fHoriVolume);
	}
	return;
_out:
	if(m_pEffectDay)
	{
		m_pEffectDay->SetVolume(0);
		if(m_pEffectDay->IsPlaying())
			Stop();
	}
	if(m_pEffectNight)
	{
		m_pEffectNight->SetVolume(0);
		if(m_pEffectNight->IsPlaying())
			Stop();
	}
}

void AudioObjectEffect::SetVolume(float fVolume)
{
	m_fVolume = fVolume;
}

bool AudioObjectEffect::OnStop(EventInstance* pEventInstance)
{
	pEventInstance->RemoveListener(this);
	if(pEventInstance == m_pEffectDay)
		m_pEffectDay = 0;
	if(pEventInstance == m_pEffectNight)
		m_pEffectNight = 0;
	return true;
}

bool AudioObjectEffect::Reload()
{
	if(!reload(m_pEffectDayEvent, m_pEffectDay))
		return false;
	if(!reload(m_pEffectNightEvent, m_pEffectNight))
		return false;
	return true;
}