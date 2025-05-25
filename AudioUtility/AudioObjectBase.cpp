#include "stdafx.h"
#include "AudioObjectBase.h"
#include "Zone.h"
#include <FEventInstance.h>
#include <FEvent.h>

AudioObjectBase::AudioObjectBase(void)
{
	m_iType = AUDIO_NONE;
	m_pZone = 0;
	m_bHasSetListenerPos = false;
}

AudioObjectBase::~AudioObjectBase(void)
{
	release();
}

bool AudioObjectBase::Init(EventSystem* pEventSystem)
{
	if(!pEventSystem)
		return false;
	m_pEventSystem = pEventSystem;
	return true;
}

void AudioObjectBase::release()
{
	if(!m_pZone)
		return;
	delete m_pZone;
	m_pZone = 0;
}

void AudioObjectBase::releaseEventInstance(EventInstance*& pEventInstance, bool bAutoDestroy)
{
	if(pEventInstance)
	{
		if(pEventInstance->IsPlaying())
		{
			pEventInstance->Stop(true);
			if(!bAutoDestroy && pEventInstance)
				pEventInstance->GetEvent()->DestroyInstance(pEventInstance);
		}
		pEventInstance = 0;
	}
}

bool AudioObjectBase::CreateZone(PG_POINT* pPoints, int iPointNum)
{
	if(!pPoints || iPointNum < 3)
		return false;
	if(m_pZone)
		delete m_pZone;
	m_pZone = new Zone;
	if(!m_pZone->Init(pPoints, iPointNum))
		return false;
	return true;
}

bool AudioObjectBase::IsPtIn(const PG_POINT& pt)
{
	if(!m_pZone)
		return false;
	if(!m_pZone->IsPtIn(pt))
		return false;
	return true;
}

bool AudioObjectBase::IsPtIn(float x, float z)
{
	if(!m_pZone)
		return false;
	if(!m_pZone->IsPtIn(x, z))
		return false;
	return true;
}

float AudioObjectBase::PtDistance(const PG_POINT& pt)
{
	if(!m_pZone)
		return 1e20f;
	float f = m_pZone->PtDistance(pt);
	return f;
}

float AudioObjectBase::PtDistance(float x, float z)
{
	if(!m_pZone)
		return 1e20f;
	float f = m_pZone->PtDistance(x, z);
	return f;
}

void AudioObjectBase::SetListenerPos(const VECTOR& vListenerPos)
{
	m_vListenerPos = vListenerPos;
	m_bHasSetListenerPos = true;
}

void AudioObjectBase::Tick()
{

}

int AudioObjectBase::GetType() const
{
	return m_iType;
}

bool AudioObjectBase::OnStop(EventInstance* pEventInstance)
{
	return true;
}

bool AudioObjectBase::Reload()
{
	return true;
}

bool AudioObjectBase::reload(Event* pEvent, EventInstance* pEventInstance)
{
	if(!pEvent)
		return true;
	if(pEventInstance && pEventInstance->IsPlaying())
		pEventInstance->Stop(true);
	if(!pEvent->Reload())
		return false;
	return true;
}