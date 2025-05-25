#include "StdAfx.h"
#include "AudioObjectReverb.h"
#include <FReverb.h>
#include <FReverbDataManager.h>
#include <FEventSystem.h>

AudioObjectReverb::AudioObjectReverb(void)
{
	m_iType = AUDIO_REVERB;
	m_pReverb = 0;
	m_pREVERB = 0;
	m_pPoints = 0;
}

AudioObjectReverb::~AudioObjectReverb(void)
{
	m_iShape = AudioEngine::REVERB_SHAPE_NONE;
	release();
}

void AudioObjectReverb::SetShapeSphere(const VECTOR& vCenter, float fRadius)
{
	m_iShape = AudioEngine::REVERB_SHAPE_SPHERE;
	m_vCenter = vCenter;
}

void AudioObjectReverb::SetShapeCubiod(const VECTOR& vCenter, float fLength, float fWidth, float fHight)
{
	m_iShape = AudioEngine::REVERB_SHAPE_CUBIOD;
	m_vCenter = vCenter;
	m_fLength = fLength;
	m_fWidth = fWidth;
	m_fHeight = fHight;
}

void AudioObjectReverb::SetShapePolygon(VECTOR* pPoints, int iPtNum, float fBottom, float fTop)
{
	m_iShape = AudioEngine::REVERB_SHAPE_POLYGON;
	if(!pPoints || iPtNum < 3)
		return;
	if(m_pPoints)
	{
		delete []m_pPoints;
		m_pPoints = 0;
	}
	m_pPoints = new VECTOR[iPtNum];
	for (int i=0; i<iPtNum; ++i)
	{
		m_pPoints[i] = pPoints[i];
	}
	m_fBottom = fBottom;
	m_fTop = fTop;
	m_iPtNum = iPtNum;
}

void AudioObjectReverb::Set3DAttributes(const VECTOR& pos, float fMinDistance, float fMaxDistance)
{
	m_fMinDistance = fMinDistance;
	m_fMaxDistance = fMaxDistance;
	m_vCenter = pos;
}

void AudioObjectReverb::SetReverb(const char* szName)
{
	if(!m_pEventSystem || !m_pEventSystem->GetReverbDataManager())
		return;
	m_pREVERB = m_pEventSystem->GetReverbDataManager()->GetReverbByName(szName);
}

void AudioObjectReverb::release()
{
	delete []m_pPoints;
	m_pPoints = 0;
	if(!m_pEventSystem)
		return;
	if(!m_pReverb)
		return;
	m_pEventSystem->DestroyReverb(m_pReverb);
	m_pReverb = 0;
}

bool AudioObjectReverb::CreateReverb()
{
	if(!m_pEventSystem)
		return false;
	if(!m_pREVERB)
		return false;
	if(m_pReverb)
		m_pEventSystem->DestroyReverb(m_pReverb);
	m_pReverb = m_pEventSystem->CreateReverb(m_pREVERB->strName.c_str());
	if(!m_pReverb)
		return false;
	if(!m_pReverb->SetActive(true))
		return false;
	switch(m_iShape)
	{
	case AudioEngine::REVERB_SHAPE_CUBIOD:
		if(!m_pReverb->SetShapeCubiod(m_vCenter, m_fLength, m_fWidth, m_fHeight))
			return false;
		break;
	case AudioEngine::REVERB_SHAPE_SPHERE:
		if(!m_pReverb->SetShapeSphere(m_vCenter, m_fRadius))
			return false;
		break;
	case AudioEngine::REVERB_SHAPE_POLYGON:
		if(!m_pReverb->SetShapePolygon(m_pPoints, m_iPtNum, m_fBottom, m_fTop))
			return false;
	}
	if(!m_pReverb->Set3DAttributes(m_vCenter, m_fMinDistance, m_fMaxDistance))
		return false;
	if(!m_pReverb->SetProperty(m_pREVERB->prop))
		return false;	
	return true;
}