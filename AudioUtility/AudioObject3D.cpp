#include "StdAfx.h"
#include "AudioObject3D.h"
#include <FEventInstance.h>
#include <FEventSystem.h>
#include <FEvent.h>

using AudioEngine::EVENT_PROPERTY;

const static float cs_fPlayDistanceScale = 1.5f;
const static float cs_fStopDistanceScale = 2.0f;

AudioObject3D::AudioObject3D(void)
{
	m_iType = AUDIO_3D;
	m_pAudio3D = 0;
	m_pAudio3DEvent = 0;

	m_fMinDistance = 1.0f;
	m_fMaxDistance = 100.f;
	m_bUseEditorMaxMinDis = true;

	m_f3DConeInsideAngle = 360.0f;
	m_f3DConeOutsideAngle = 360.0f;
	m_f3DConeOutsideVolume = 1.0f;
	m_bUseEditor3DCone = true;

	m_vPos = VECTOR(0, 0, 0);
	m_vOrientation = VECTOR(0, 0, 1);	
	m_bHasSetPos = false;
	m_bHasSetMinMaxDistance = false;
}

AudioObject3D::~AudioObject3D(void)
{
	release();
}

void AudioObject3D::release()
{
	CriticalSectionController csc(&m_csForThreadSafe);
	if(!m_pAudio3DEvent)
		return;
	CriticalSectionController csce(m_pAudio3DEvent->GetCriticalSectionWrapper());	
	if(m_pAudio3D)
	{
		CriticalSectionController cscei(m_pAudio3D->GetCriticalSectionWrapper());
		m_pAudio3D->RemoveListener(this);
		releaseEventInstance(m_pAudio3D, true);
	}	
}

void AudioObject3D::SetMinMaxDistance(bool bUseEditorData, float fMinDistance, float fMaxDistance)
{
	m_bUseEditorMaxMinDis = bUseEditorData;
	m_fMinDistance = fMinDistance;
	m_fMaxDistance = fMaxDistance;
	m_bHasSetMinMaxDistance = true;
}

void AudioObject3D::Set3DCone(bool bUseEditorData, float f3DConeInsideAngle, float f3DConeOutsideAngle, float f3DConeOutsideVolume)
{
	m_bUseEditor3DCone = bUseEditorData;
	m_f3DConeInsideAngle = f3DConeInsideAngle;
	m_f3DConeOutsideAngle = f3DConeOutsideAngle;
	m_f3DConeOutsideVolume = f3DConeOutsideVolume;
}

void AudioObject3D::SetVolume(float fVolume)
{
	m_fVolume = fVolume;
}

void AudioObject3D::SetEvent(const char* szGuid)
{
	if(!m_pEventSystem)
		return;
	m_pAudio3DEvent = m_pEventSystem->GetEvent(szGuid);
}

void AudioObject3D::SetPos(const VECTOR& vPos)
{
	m_vPos = vPos;
	m_bHasSetPos = true;
}

bool AudioObject3D::Play()
{
	CriticalSectionController csc(&m_csForThreadSafe);
	if(!m_pAudio3DEvent)
		return false;
	CriticalSectionController csce(m_pAudio3DEvent->GetCriticalSectionWrapper());	
	if(m_pAudio3D)
	{
		CriticalSectionController cscei(m_pAudio3D->GetCriticalSectionWrapper());
		if(m_pAudio3D->IsPlaying())
			m_pAudio3D->Stop(true);
	}
	m_pAudio3D = m_pAudio3DEvent->CreateInstance();
	if(!m_pAudio3D)
		return false;
	CriticalSectionController cscei(m_pAudio3D->GetCriticalSectionWrapper());
	EVENT_PROPERTY prop;
	m_pAudio3D->GetProperty(prop);
	if(m_bUseEditorMaxMinDis)
	{
		prop.fMaxDistance = m_fMaxDistance;
		prop.fMinDistance = m_fMinDistance;
	}

	if(m_bUseEditor3DCone)
	{
		prop.f3DConeInsideAngle = m_f3DConeInsideAngle;
		prop.f3DConeOutsideAngle = m_f3DConeOutsideAngle;
		prop.f3DConeOutsideVolume = m_f3DConeOutsideVolume;
	}
	m_pAudio3D->SetProperty(prop);
	m_pAudio3D->Set3DAttributes(m_vPos, 0);
	m_pAudio3D->Set3DConeOrientation(m_vOrientation);
	if(!m_pAudio3D->Start())
		return false;
	m_pAudio3D->AddListener(this);
	return true;
}

bool AudioObject3D::Stop(bool bForce)
{
	CriticalSectionController csc(&m_csForThreadSafe);
	if(!m_pAudio3DEvent)
		return false;
	CriticalSectionController csce(m_pAudio3DEvent->GetCriticalSectionWrapper());	
	if(!m_pAudio3D)
		return true;
	CriticalSectionController cscei(m_pAudio3D->GetCriticalSectionWrapper());
	if(m_pAudio3D && m_pAudio3D->IsPlaying())
		m_pAudio3D->Stop(bForce);
	return true;
}

void AudioObject3D::SetOrientation(const VECTOR& vOrientation)
{
	m_vOrientation = vOrientation;
}

void AudioObject3D::GetRealMinMaxDistance(float& fMinDistance, float& fMaxDistance) const
{
	fMinDistance = m_fMinDistance;
	fMaxDistance = m_fMaxDistance;
	if(!m_bUseEditorMaxMinDis && m_pAudio3DEvent)
	{
		EVENT_PROPERTY prop;
		m_pAudio3DEvent->GetProperty(prop);
		fMinDistance = prop.fMinDistance;
		fMaxDistance = prop.fMaxDistance;
	}
}

void AudioObject3D::GetReal3DCone(float& f3DConeInsideAngle, float& f3DConeOutsideAngle, float& f3DConeOutsideVolume) const
{
	f3DConeInsideAngle = m_f3DConeInsideAngle;
	f3DConeOutsideAngle = m_f3DConeOutsideAngle;
	f3DConeOutsideVolume = m_f3DConeOutsideVolume;
	if(!m_bUseEditor3DCone && m_pAudio3D)
	{
		EVENT_PROPERTY prop;
		m_pAudio3D->GetProperty(prop);
		f3DConeInsideAngle = prop.f3DConeInsideAngle;
		f3DConeOutsideAngle = prop.f3DConeOutsideAngle;
		f3DConeOutsideVolume = prop.f3DConeOutsideVolume;
	}
}

bool AudioObject3D::OnStop(EventInstance* pEventInstance)
{
	CriticalSectionController csc(&m_csForThreadSafe);
	if(!pEventInstance || !m_pAudio3DEvent)
		return false;
	CriticalSectionController csce(m_pAudio3DEvent->GetCriticalSectionWrapper());
	CriticalSectionController cscei(pEventInstance->GetCriticalSectionWrapper());
	pEventInstance->RemoveListener(this);
	if(pEventInstance == m_pAudio3D)
		m_pAudio3D = 0;
	
	return true;
}

bool AudioObject3D::Reload()
{
	if(!reload(m_pAudio3DEvent, m_pAudio3D))
		return false;	
	if(!Play())
		return false;
	return true;
}

void AudioObject3D::Tick()
{
	CriticalSectionController csc(&m_csForThreadSafe);
	if(!m_pAudio3DEvent)
		return;
	CriticalSectionController csce(m_pAudio3DEvent->GetCriticalSectionWrapper());
	if(!m_bHasSetPos || !m_bHasSetListenerPos || !m_bHasSetMinMaxDistance)
		return;

	float fMinDistance = 0;
	float fMaxDistance = 0;
	GetRealMinMaxDistance(fMinDistance, fMaxDistance);

	float fPlayDistance = fMaxDistance * cs_fPlayDistanceScale;
	float fStopDistance = fMaxDistance * cs_fStopDistanceScale;
	float fPlayDistance2 = fPlayDistance * fPlayDistance;
	float fStopDistance2 = fStopDistance * fStopDistance;
	float fCurDistance2 = 
		(m_vListenerPos.x - m_vPos.x) * (m_vListenerPos.x - m_vPos.x)
		+ (m_vListenerPos.y - m_vPos.y) * (m_vListenerPos.y - m_vPos.y)
		+ (m_vListenerPos.z - m_vPos.z) * (m_vListenerPos.z - m_vPos.z);
	if(fCurDistance2 < fPlayDistance2)
	{
		if(m_pAudio3D)
		{
			if(m_pAudio3D->IsPlaying())
				return;
		}
		Play();
		return;
	}
	if(fCurDistance2 > fStopDistance2)
		Stop(true);
}