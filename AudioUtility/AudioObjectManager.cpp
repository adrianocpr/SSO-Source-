#include "StdAfx.h"
#include "AudioObjectManager.h"
#include "AudioObjectBase.h"
#include "AudioObject3D.h"
#include "AudioObjectEffect.h"
#include "AudioObjectBGM.h"
#include "AudioObjectVolume.h"
#include "AudioObjectReverb.h"
#include <FEventSystem.h>
#include <FEvent.h>

AudioObjectManager::AudioObjectManager(void)
{
	m_pLastAudioBGM = 0;
	m_pLastAudioVolume = 0;
	m_fLastMusicVolume = 1.0f;
	m_fLastEnvEffectVolume = 1.0f;
	m_bEnterVolumeZone = false;
	m_bLeaveVolumeZone = false;
	m_fDNFactor = 0;
	m_dwStartFadeTick = 0;
	m_bFading = false;
	m_pLastMusicEvent = 0;
	m_pLastEnvEffectEvent = 0;
	m_bIntercut = false;
	m_pCurIntercutEventInstance = 0;
}

AudioObjectManager::~AudioObjectManager(void)
{
	release();
}

bool AudioObjectManager::Init(EventSystem* pEventSystem)
{
	if(!pEventSystem)
		return false;
	m_pEventSystem = pEventSystem;
	return true;
}

void AudioObjectManager::release()
{
	if(m_pCurIntercutEventInstance)
	{
		m_pCurIntercutEventInstance->RemoveListener(this);
		m_pCurIntercutEventInstance->Stop(true);
		m_pCurIntercutEventInstance = 0;
	}
	AudioObjectSet::iterator it = m_setAudio3D.begin();
	for (; it!=m_setAudio3D.end(); ++it)
	{
		delete *it;
	}
	m_setAudio3D.clear();

	it = m_setAudioEffect.begin();
	for (; it!=m_setAudioEffect.end(); ++it)
	{
		delete *it;
	}
	m_setAudioEffect.clear();

	it = m_setAudioBGM.begin();
	for (; it!=m_setAudioBGM.end(); ++it)
	{
		delete *it;
	}
	m_setAudioBGM.clear();

	it = m_setAudioVolume.begin();
	for (; it!=m_setAudioVolume.end(); ++it)
	{
		delete *it;
	}
	m_setAudioVolume.clear();

	it = m_setAudioReverb.begin();
	for (; it!=m_setAudioReverb.end(); ++it)
	{
		delete *it;
	}
	m_setAudioReverb.clear();

	m_setAudioObject.clear();
}

AudioObjectBase* AudioObjectManager::CreateObject(int iType)
{
	AudioObjectBase* pAudioObject = 0;
	switch(iType)
	{
	case AUDIO_3D:
		{
			pAudioObject = new AudioObject3D;
			if(!pAudioObject->Init(m_pEventSystem))
			{
				delete pAudioObject;
				return 0;
			}
			m_setAudio3D.insert(pAudioObject);
			m_setAudioObject.insert(pAudioObject);
		}		
		break;
	case AUDIO_EFFECT:
		{
			pAudioObject = new AudioObjectEffect;
			if(!pAudioObject->Init(m_pEventSystem))
			{
				delete pAudioObject;
				return 0;
			}
			m_setAudioEffect.insert(pAudioObject);
			m_setAudioObject.insert(pAudioObject);
		}
		break;
	case AUDIO_BGM:
		{
			pAudioObject = new AudioObjectBGM;
			if(!pAudioObject->Init(m_pEventSystem))
			{
				delete pAudioObject;
				return 0;
			}
			m_setAudioBGM.insert(pAudioObject);
			m_setAudioObject.insert(pAudioObject);
		}
		break;
	case AUDIO_VOLUME:
		{
			pAudioObject = new AudioObjectVolume;
			if(!pAudioObject->Init(m_pEventSystem))
			{
				delete pAudioObject;
				return 0;
			}
			m_setAudioVolume.insert(pAudioObject);
			m_setAudioObject.insert(pAudioObject);
		}
		break;
	case AUDIO_REVERB:
		{
			pAudioObject = new AudioObjectReverb;
			if(!pAudioObject->Init(m_pEventSystem))
			{
				delete pAudioObject;
				return 0;
			}
			m_setAudioReverb.insert(pAudioObject);
			m_setAudioObject.insert(pAudioObject);
		}
		break;
	}
	return pAudioObject;
}

bool AudioObjectManager::DestroyObject(AudioObjectBase* pAudioObject)
{
	switch(pAudioObject->GetType())
	{
	case AUDIO_3D:
		{
			AudioObjectSet::iterator it = m_setAudio3D.find(pAudioObject);
			if(it != m_setAudio3D.end())
			{
				m_setAudio3D.erase(it);
			}
		}	
		break;
	case AUDIO_EFFECT:
		{
			AudioObjectSet::iterator it = m_setAudioEffect.find(pAudioObject);
			if(it != m_setAudioEffect.end())
			{
				m_setAudioEffect.erase(it);
			}			
		}
		break;
	case AUDIO_BGM:
		{
			AudioObjectSet::iterator it = m_setAudioBGM.find(pAudioObject);
			if(it != m_setAudioBGM.end())
			{
				if (m_pLastAudioBGM == pAudioObject)
					m_pLastAudioBGM = 0;
				m_setAudioBGM.erase(it);
			}
		}
		break;
	case AUDIO_VOLUME:
		{
			AudioObjectSet::iterator it = m_setAudioVolume.find(pAudioObject);
			if(it != m_setAudioVolume.end())
			{
				if(m_pLastAudioVolume == pAudioObject)
					m_pLastAudioVolume = 0;
				m_setAudioVolume.erase(it);
			}
		}
		break;
	case AUDIO_REVERB:
		{
			AudioObjectSet::iterator it = m_setAudioReverb.find(pAudioObject);
			if(it != m_setAudioReverb.end())
			{
				m_setAudioReverb.erase(it);
			}
		}
		break;
	}
	AudioObjectSet::iterator it = m_setAudioObject.find(pAudioObject);
	if(it != m_setAudioObject.end())
	{
		m_setAudioObject.erase(it);
	}
	delete pAudioObject;
	return true;
}

void AudioObjectManager::SetListenerPos(const VECTOR& vListenerPos)
{
	m_vListenerPos = vListenerPos;
}

void AudioObjectManager::SetZoneListenerPos(const VECTOR& vZoneListenerPos)
{
	m_vZoneListenerPos = vZoneListenerPos;
}

void AudioObjectManager::Tick()
{
	{
		AudioObjectSet::iterator it = m_setAudioObject.begin();
		for(; it != m_setAudioObject.end(); ++it)
		{
			AudioObjectBase* pAudioObject = *it;
			pAudioObject->SetListenerPos(m_vListenerPos);
			switch(pAudioObject->GetType())
			{
			case AUDIO_BGM:
				{
					AudioObjectBGM* pAudioBGM = castAudioBGM(pAudioObject);
					if(!pAudioBGM)
						continue;
					pAudioBGM->SetDNFactor(m_fDNFactor);
				}
				break;
			case AUDIO_EFFECT:
				{
					AudioObjectEffect* pAudioEffect = castAudioEffect(pAudioObject);
					if(!pAudioEffect)
						continue;
					pAudioEffect->SetDNFactor(m_fDNFactor);
				}
				break;
			}
		}
	}	

	AudioObjectBGM* pCurAudioBGM = getCurAudioBGM();
	bool bMusicChange = false;
	bool bEnvEffectChange = false;
	if(pCurAudioBGM)
	{
		if(m_pLastAudioBGM)
		{
			if(m_pLastMusicEvent != pCurAudioBGM->GetMusicEvent())
			{
				bMusicChange = true;
				m_pLastAudioBGM->StopMusic();
			}

			if(m_pLastEnvEffectEvent != pCurAudioBGM->GetEnvEffectEvent())
			{
				bEnvEffectChange = true;
				m_pLastAudioBGM->StopEnvEffect();
			}
		}
		else
		{
			bMusicChange = true;
			bEnvEffectChange = true;
		}
		if(bMusicChange && !m_bIntercut)
			pCurAudioBGM->PlayMusic();
		if(bEnvEffectChange)
			pCurAudioBGM->PlayEnvEffect();
	}
	else
	{
		if(m_pLastAudioBGM)
		{
			m_pLastAudioBGM->StopMusic();
			m_pLastAudioBGM->StopEnvEffect();
		}
	}

	m_pLastAudioBGM = pCurAudioBGM;
	if(pCurAudioBGM)
	{
		m_pLastMusicEvent = pCurAudioBGM->GetMusicEvent();
		m_pLastEnvEffectEvent = pCurAudioBGM->GetEnvEffectEvent();
	}
	else
	{
		m_pLastMusicEvent = 0;
		m_pLastEnvEffectEvent = 0;
	}

	AudioObjectVolume* pCurAudioVolume = getCurAudioVolume();
	bool bStartFade = false;
	if(pCurAudioVolume)
	{
		if(m_pLastAudioVolume)
		{
			if(m_pLastAudioVolume != pCurAudioVolume)
			{
				bStartFade = true;
			}			
		}
		else
		{
			bStartFade = true;
		}
		if(bStartFade)
		{
			m_dwStartFadeTick = GetTickCount();
			m_bFading = true;
			m_dwFadeTime = pCurAudioVolume->GetFadeTime();
			if(m_pLastAudioVolume)
				m_pLastAudioVolume->GetVolume(m_fLastMusicVolume, m_fLastEnvEffectVolume);
			else
				m_fLastMusicVolume = m_fLastEnvEffectVolume = 1.0f;
		}
	}
	else
	{
		if(m_pLastAudioVolume)
		{
			m_dwStartFadeTick = GetTickCount();
			m_bFading = true;
			m_dwFadeTime = m_pLastAudioVolume->GetFadeTime();
			m_pLastAudioVolume->GetVolume(m_fLastMusicVolume, m_fLastEnvEffectVolume);
		}
	}

	float fMusicVolume = m_fLastMusicVolume;
	float fEnvEffectVolume = m_fLastEnvEffectVolume;
	if(m_bFading)
	{
		float fCurMusicVolume = 1.0f;
		float fCurEnvEffectVolume = 1.0f;
		if(pCurAudioVolume)
			pCurAudioVolume->GetVolume(fCurMusicVolume, fCurEnvEffectVolume);

		DWORD dwEllapse = GetTickCount() - m_dwStartFadeTick;
		if(dwEllapse < m_dwFadeTime)
		{
			fMusicVolume = dwEllapse*(fCurMusicVolume - m_fLastMusicVolume)/m_dwFadeTime + m_fLastMusicVolume;
			fEnvEffectVolume = dwEllapse*(fCurEnvEffectVolume - m_fLastEnvEffectVolume)/m_dwFadeTime + m_fLastEnvEffectVolume;
		}
		else
		{
			m_bFading = false;
			m_fLastMusicVolume = fCurMusicVolume;
			m_fLastEnvEffectVolume = fCurEnvEffectVolume;
			fMusicVolume = m_fLastMusicVolume;
			fEnvEffectVolume = m_fLastEnvEffectVolume;
		}
	}

	m_pLastAudioVolume = pCurAudioVolume;

	if(m_pLastAudioBGM)
		m_pLastAudioBGM->SetVolume(fMusicVolume, fEnvEffectVolume);
	
	{
		AudioObjectSet::iterator it = m_setAudioObject.begin();
		for(; it != m_setAudioObject.end(); ++it)
		{
			AudioObjectBase* pAudioObject = *it;
			pAudioObject->Tick();
		}
	}
}

AudioObjectBGM* AudioObjectManager::getCurAudioBGM()
{
	AudioObjectBGM* pCurAudioBGM = 0;
	AudioObjectSet::iterator it = m_setAudioBGM.begin();
	for(;it != m_setAudioBGM.end(); ++it)
	{
		AudioObjectBGM* pAudioBGM = castAudioBGM(*it);
		if(!pAudioBGM->IsPtIn(m_vZoneListenerPos.x, m_vZoneListenerPos.y, m_vZoneListenerPos.z))
			continue;
		if(!pCurAudioBGM)
			pCurAudioBGM = pAudioBGM;
		else
		{
			if(pAudioBGM->GetPriority() > pCurAudioBGM->GetPriority())
				pCurAudioBGM = pAudioBGM;
		}
	}
	return pCurAudioBGM;
}

AudioObjectVolume* AudioObjectManager::getCurAudioVolume()
{
	AudioObjectSet::iterator it = m_setAudioVolume.begin();
	for(;it != m_setAudioVolume.end(); ++it)
	{
		AudioObjectVolume* pAudioVolume = castAudioVolume(*it);
		if(!pAudioVolume->IsPtIn(m_vZoneListenerPos.x, m_vZoneListenerPos.y, m_vZoneListenerPos.z))
			continue;
		return pAudioVolume;
	}
	return 0;
}

AudioObjectBGM* AudioObjectManager::castAudioBGM(AudioObjectBase* pAudioObject)
{
	return dynamic_cast<AudioObjectBGM*>(pAudioObject);
}

AudioObjectVolume* AudioObjectManager::castAudioVolume(AudioObjectBase* pAudioObject)
{
	return dynamic_cast<AudioObjectVolume*>(pAudioObject);
}

AudioObjectEffect* AudioObjectManager::castAudioEffect(AudioObjectBase* pAudioObject)
{
	return dynamic_cast<AudioObjectEffect*>(pAudioObject);
}

AudioObject3D* AudioObjectManager::castAudio3D(AudioObjectBase* pAudioObject)
{
	return dynamic_cast<AudioObject3D*>(pAudioObject);
}

AudioObjectReverb* AudioObjectManager::castAudioReverb(AudioObjectBase* pAudioObject)
{
	return dynamic_cast<AudioObjectReverb*>(pAudioObject);
}

void AudioObjectManager::SetDNFactor(float fDNFactor)
{
	m_fDNFactor = fDNFactor;
}

bool AudioObjectManager::Reload()
{
	AudioObjectSet::iterator it = m_setAudioObject.begin();
	for(; it != m_setAudioObject.end(); ++it)
	{
		AudioObjectBase* pAudioObject = *it;
		if(!pAudioObject)
			continue;
		if(!pAudioObject->Reload())
			continue;
	}
	return true;
}

bool AudioObjectManager::PlayIntercutBGM(const char* szGUID)
{
	if(!m_pEventSystem)
		return false;	
	Event* pEvent = m_pEventSystem->GetEvent(szGUID);
	if(!pEvent)
		return false;
	m_pCurIntercutEventInstance = pEvent->CreateInstance();
	if(!m_pCurIntercutEventInstance)
		return false;
	AudioObjectBGM* pCurBGM = getCurAudioBGM();
	if(pCurBGM)
		pCurBGM->StopMusic();
	if(!m_pCurIntercutEventInstance->Start())
		return false;
	m_pCurIntercutEventInstance->AddListener(this);
	m_bIntercut = true;
	return true;
}

bool AudioObjectManager::StopIntercutBGM()
{
	if(!m_pEventSystem)
		return false;
	if(!m_pCurIntercutEventInstance)
		return false;
	if(!m_pCurIntercutEventInstance->Stop())
		return false;
	return true;
}

bool AudioObjectManager::OnStop(EventInstance* pEventInstance)
{
	if(!pEventInstance)
		return false;
	pEventInstance->RemoveListener(this);
	if(!m_pEventSystem)
		return false;
	m_pCurIntercutEventInstance = 0;
	AudioObjectBGM* pCurBGM = getCurAudioBGM();
	if(pCurBGM)
		pCurBGM->PlayMusic();
	m_bIntercut = false;
	return true;
}