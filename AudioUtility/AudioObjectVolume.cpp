#include "StdAfx.h"
#include "AudioObjectVolume.h"

AudioObjectVolume::AudioObjectVolume(void)
{
	m_iType = AUDIO_VOLUME;
	m_fMusicVolume = 1.0f;
	m_fEnvEffectVolume = 1.0f;
}

AudioObjectVolume::~AudioObjectVolume(void)
{
}

void AudioObjectVolume::SetVolume(float fMusicVolume, float fEnvEffectVolume)
{
	m_fMusicVolume = fMusicVolume;
	m_fEnvEffectVolume = fEnvEffectVolume;
}

void AudioObjectVolume::GetVolume(float& fMusicVolume, float& fEnvEffectVolume) const
{
	fMusicVolume = m_fMusicVolume;
	fEnvEffectVolume = m_fEnvEffectVolume;
}

void AudioObjectVolume::SetHeightRange(float fBottom, float fTop)
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

void AudioObjectVolume::SetFadeTime(int iFadeTime)
{
	m_iFadeTime = iFadeTime;
}

int AudioObjectVolume::GetFadeTime() const
{
	return m_iFadeTime;
}

bool AudioObjectVolume::IsPtIn(float x, float y, float z)
{
	if(!AudioObjectBase::IsPtIn(x, z))
		return false;
	if(y < m_fTop && y > m_fBottom)
		return true;
	return false;
}