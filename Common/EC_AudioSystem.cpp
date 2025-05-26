#include <StdAfx.h>
#ifndef ANIMATION_EDITOR
#include "EC_LuaFunc.h"
#endif
#include <EC_AudioSystem.h>

CECAudioSystem::CECAudioSystem()
    : m_pEventSystem(0),
      m_pAudioObjectManager(0),
	  m_bEnableAudio(false)
{
}

CECAudioSystem::~CECAudioSystem()
{
    Release();
}

AudioObject3D* CECAudioSystem::CreateAudioObject3D()
{
    if (m_pAudioObjectManager)
    {
        return dynamic_cast<AudioObject3D*>(m_pAudioObjectManager->CreateObject(AUDIO_3D));
    }
    return NULL;
}

AudioObjectBGM* CECAudioSystem::CreateAudioObjectBGM()
{
    if (m_pAudioObjectManager)
    {
        return dynamic_cast<AudioObjectBGM*>(m_pAudioObjectManager->CreateObject(AUDIO_BGM));
    }
    return NULL;
}

AudioObjectEffect* CECAudioSystem::CreateAudioObjectEffect()
{
	if (m_pAudioObjectManager)
	{
		return dynamic_cast<AudioObjectEffect*>(m_pAudioObjectManager->CreateObject(AUDIO_EFFECT));
	}
	return NULL;
}

AudioObjectReverb* CECAudioSystem::CreateAudioObjectReverb()
{
	if (m_pAudioObjectManager)
	{
		return dynamic_cast<AudioObjectReverb*>(m_pAudioObjectManager->CreateObject(AUDIO_REVERB));
	}
	return NULL;
}

bool CECAudioSystem::DestroyAudioObject(AudioObjectBase *pObject)
{
    if (m_pAudioObjectManager && pObject)
    {
        m_pAudioObjectManager->DestroyObject(pObject);
        return true;
    }
    return false;
}

AudioEngine::EventSystem* CECAudioSystem::GetEventSystem() const
{
    return m_pEventSystem;
}

AudioObjectManager* CECAudioSystem::GetAudioObjectManager() const
{
    return m_pAudioObjectManager;
}

void CECAudioSystem::SetListenerPos(const A3DVECTOR3 &vPos)
{
    m_vListenerPos = vPos;
}

A3DVECTOR3 CECAudioSystem::GetListenerPos() const
{
    return m_vListenerPos;
}

void CECAudioSystem::SetListenerDirAndUp(const A3DVECTOR3 &vDir, const A3DVECTOR3 &vUp)
{
    m_vListenerDir = vDir;
    m_vListenerUp = vUp;
}

A3DVECTOR3 CECAudioSystem::GetListenerDir() const
{
    return m_vListenerDir;
}

A3DVECTOR3 CECAudioSystem::GetListenerUp() const
{
    return m_vListenerUp;
}

void CECAudioSystem::SetListenerVel(const A3DVECTOR3 &vVel)
{
    m_vListenerVel = vVel;
}

A3DVECTOR3 CECAudioSystem::GetListenerVel() const
{
    return m_vListenerVel;
}

void CECAudioSystem::SetZoneListenerPos(const A3DVECTOR3 &vPos)
{
    m_vZoneListenerPos = vPos;
}

A3DVECTOR3 CECAudioSystem::GetZoneListenerPos() const
{
    return m_vZoneListenerPos;
}

bool CECAudioSystem::UpdateListener()
{
    if (!m_pEventSystem || !m_pAudioObjectManager) return false;

    A3DVECTOR3 vLeft = CrossProduct(m_vListenerDir, m_vListenerUp);
    m_vListenerUp = CrossProduct(vLeft, m_vListenerDir);
    m_vListenerDir.Normalize();
    m_vListenerUp.Normalize();

    AudioEngine::VECTOR pos, dir, up, vel;

    pos.x = m_vListenerPos.x;
    pos.y = m_vListenerPos.y;
    pos.z = m_vListenerPos.z;

    dir.x = m_vListenerDir.x;
    dir.y = m_vListenerDir.y;
    dir.z = m_vListenerDir.z;

    up.x = m_vListenerUp.x;
    up.y = m_vListenerUp.y;
    up.z = m_vListenerUp.z;

    vel.x = m_vListenerVel.x;
    vel.y = m_vListenerVel.y;
    vel.z = m_vListenerVel.z;

    m_pAudioObjectManager->SetListenerPos(pos);
    m_pEventSystem->Set3DListenerAttributes(pos, vel, dir, up);

    pos.x = m_vZoneListenerPos.x;
    pos.y = m_vZoneListenerPos.y;
    pos.z = m_vZoneListenerPos.z;
    m_pAudioObjectManager->SetZoneListenerPos(pos);

    return true;
}

void CECAudioSystem::SetDNFactor(float fFactor)
{
    m_fDNFactor = fFactor;
}

float CECAudioSystem::GetDNFactor() const
{
    return m_fDNFactor;
}

bool CECAudioSystem::SetClassVolume(int iClass, float fVolume)
{
    if (m_pEventSystem)
    {
        return m_pEventSystem->SetClassVolume(iClass, fVolume);
    }
    return false;
}

bool CECAudioSystem::SetClassMute(int iClass, bool bMute)
{
	if (m_pEventSystem)
	{
		return m_pEventSystem->SetClassMute(iClass, bMute);
	}
	return false;
}

bool CECAudioSystem::Init(const char *szPath, bool bEnableAudio)
{
	// 禁音频的命令行参数
	bool no_auido = strstr(GetCommandLineA(), _EA("no_audio")) ? true: false;
	if (no_auido) bEnableAudio = false;
	
	m_bEnableAudio = bEnableAudio;
    m_pEventSystem = new AudioEngine::EventSystem;
    if (!m_pEventSystem->Init(1000, INIT_NORMAL, 0))
    {
		m_bEnableAudio = false;
#ifndef ANIMATION_EDITOR
		glb_ErrorOutput(ECERR_FAILEDTOCALL, _EA("CECAudioSystem::Init Init EventSystem failed"), __LINE__);
#endif
    }

    m_pEventSystem->SetRootFolder(szPath);
	if(m_bEnableAudio)
#ifndef ANIMATION_EDITOR
        m_pEventSystem->LoadBinaryProjects();
#else
        m_pEventSystem->LoadProjects();
#endif

    m_pAudioObjectManager = new AudioObjectManager;
    if (!m_pAudioObjectManager->Init(m_pEventSystem))
    {
#ifndef ANIMATION_EDITOR
		glb_ErrorOutput(ECERR_FAILEDTOCALL, _EA("CECAudioSystem::Init Init AudioObjectManager failed"), __LINE__);
#endif
    }

	char szReverbPath[MAX_PATH];
	sprintf_s(szReverbPath, sizeof(szReverbPath) / sizeof(char), "%s\\Reverbs\\Reverbs.xml", szPath);
#ifndef ANIMATION_EDITOR
	if (0 != _access(szReverbPath, 0))
	{
		assert(0 && _EA("CECAudioSystem::Init(), can't access ReverbPath!"));
	}
#endif
	if(m_bEnableAudio && !m_pEventSystem->InitReverbDataManager(szReverbPath))
	{
#ifndef ANIMATION_EDITOR
		glb_ErrorOutput(ECERR_FAILEDTOCALL, _EA("CECAudioSystem::Init InitReverbDataManager failed"), __LINE__);
#endif
		return true;
	}

    return true;
}

bool CECAudioSystem::Reload()
{
    if (m_pAudioObjectManager)
    {
        return m_pAudioObjectManager->Reload();
    }
    return false;
}

bool CECAudioSystem::Tick(unsigned int uiTickDelta)
{
    if (!m_pEventSystem || !m_pAudioObjectManager || !m_bEnableAudio) return false;

    if (!UpdateListener()) return false;
    
    m_pAudioObjectManager->SetDNFactor(m_fDNFactor);
    m_pAudioObjectManager->Tick();
    return m_pEventSystem->Update();
}

//	Play 2D auto sound
bool CECAudioSystem::Play2DAutoSoundByKey(const AWString &key, const float fVolume)
{
#ifndef ANIMATION_EDITOR
    if (key.GetLength() <= 0) return false;
    
    AString guid;
    if (!CECLuaFunc::GetAuto2DSound(key, guid)) return false;
    if (guid.GetLength() <= 0) return false;

    return Play2DAutoSound(guid, fVolume);
#else
    return true;
#endif
}

bool CECAudioSystem::Play2DAutoSound(const char *szGuid, const float fVolume)
{
    if (!m_pEventSystem) return false;
    
    AudioEngine::Event *pEvent = m_pEventSystem->GetEvent(szGuid);
    if (!pEvent) return false;

    AudioEngine::EventInstance *pEventInstance = pEvent->CreateInstance(true);
    if (!pEventInstance) return false;

    pEventInstance->SetVolume(fVolume);

    return pEventInstance->Start();
}

AudioEngine::EventInstance* CECAudioSystem::Create2DSound(const AWString &key, const float fVolume/* =1.0f */)
{
#ifndef ANIMATION_EDITOR
	if (!m_pEventSystem) return NULL;
	AString guid;
	if (!CECLuaFunc::GetAuto2DSound(key, guid)) return NULL;
	if (guid.GetLength() <= 0) return NULL;
	AudioEngine::Event *pEvent = m_pEventSystem->GetEvent(guid);
	if (!pEvent) return NULL;

	AudioEngine::EventInstance *pEventInstance = pEvent->CreateInstance(false);
	return pEventInstance;
#else
    return NULL;
#endif
}

void CECAudioSystem::Destroy2DSound(const AWString &key,AudioEngine::EventInstance* pSoundEventInstance)
{
#ifndef ANIMATION_EDITOR
	if (!m_pEventSystem) return;
	AString guid;
	if (!CECLuaFunc::GetAuto2DSound(key, guid)) return;
	if (guid.GetLength() <= 0) return;
	AudioEngine::Event *pEvent = m_pEventSystem->GetEvent(guid);
	if (!pEvent) return;
	pEvent->DestroyInstance(pSoundEventInstance);
#else
    return;
#endif
}

//	Play 3D auto sound
bool CECAudioSystem::Play3DAutoSoundByKey(const AWString &key, const A3DVECTOR3& vPos, float fMinDist, float fMaxDist)
{
    /*
    if (key.GetLength() <= 0) return false;

    AString guid;
    if (!CECLuaFunc::GetAuto3DSound(key, guid)) return false;
    if (guid.GetLength() <= 0) return false;

    return Play3DAutoSound(guid, vPos, fMinDist, fMaxDist);
    */
    return true;
}

bool CECAudioSystem::Play3DAutoSound(const char* szGuid, const A3DVECTOR3& vPos, float fMinDist, float fMaxDist, const char*szParameter, float fValue)
{
    if (!m_pEventSystem) return false;

    AudioEngine::Event *pEvent = m_pEventSystem->GetEvent(szGuid);
    if (!pEvent) return false;

    AudioEngine::EventInstance *pEventInstance = pEvent->CreateInstance(true);
    if (!pEventInstance) return false;

    AudioEngine::EVENT_PROPERTY prop;
    pEventInstance->GetProperty(prop);
    prop.fMinDistance = fMinDist;
    prop.fMaxDistance = fMaxDist;
    pEventInstance->SetProperty(prop);

    pEventInstance->Set3DAttributes(AudioEngine::VECTOR(vPos.x, vPos.y, vPos.z), AudioEngine::VECTOR(0.0f));
    pEventInstance->Set3DConeOrientation(AudioEngine::VECTOR(0.0f, 1.0f, 0.0f));

    if (szParameter)
    {
        AudioEngine::EventInstanceParameter* pParameter = pEventInstance->GetInstanceParameterByName(szParameter);
        if (pParameter)
        {
            pParameter->SetValue(fValue);
        }
    }

    return pEventInstance->Start();
}

void CECAudioSystem::Release()
{
	delete m_pAudioObjectManager;
	m_pAudioObjectManager = 0;
    delete m_pEventSystem;
    m_pEventSystem = 0;
}

unsigned int CECAudioSystem::GetUsedMemoryBits() const
{
	if(!m_pEventSystem)
		return 0;
	return m_pEventSystem->GetUsedMemoryBits();
}

bool CECAudioSystem::GetCPUUsage(float* pfDsp, float* pfStream, float* pfGeometry, float* pfUpdate, float* pfTotal) const
{
	if(!m_pEventSystem)
		return false;
	if(!m_pEventSystem->GetCPUUsage(pfDsp, pfStream, pfGeometry, pfUpdate, pfTotal))
		return false;
	return true;
}

bool CECAudioSystem::PlayIntercutBGM(const char* szGUID)
{
	if(!m_pAudioObjectManager) return false;
	const EventInstance* pEventInst = m_pAudioObjectManager->GetIntercutBGM();
	if (NULL != pEventInst && NULL != pEventInst->GetEvent())
	{
		const char* cur_guid = pEventInst->GetEvent()->GetGuid().GetString();
		if ( 0 == strcmp(cur_guid, szGUID))
		{
			return true;
		}	
	}

	StopIntercutBGM();
	return m_pAudioObjectManager->PlayIntercutBGM(szGUID);
}


bool CECAudioSystem::StopIntercutBGM()
{
	if(!m_pAudioObjectManager) return false;
	return m_pAudioObjectManager->StopIntercutBGM();
}


bool CECAudioSystem::IsIntercutBGMPlaying(const char* szGUID)
{
	if(!m_pAudioObjectManager) return false;
	
	if (NULL != szGUID && strlen(szGUID) > 0)
	{
		const EventInstance* pEventInst = m_pAudioObjectManager->GetIntercutBGM();
		if (NULL != pEventInst && NULL != pEventInst->GetEvent())
		{
			const char* cur_guid = pEventInst->GetEvent()->GetGuid().GetString();
			if ( 0 == strcmp(cur_guid, szGUID))
			{
				return true;
			}	
		}
	}	
	
	const EventInstance* pEventInst = m_pAudioObjectManager->GetIntercutBGM();
	if (NULL == pEventInst) return false;
	return pEventInst->IsPlaying();
}