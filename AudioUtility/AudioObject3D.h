#pragma once
#include "AudioObjectBase.h"
#include <FAudioEngine.h>
#include <FCriticalSectionWrapper.h>

namespace AudioEngine
{
	class Event;
}

using AudioEngine::Event;
using AudioEngine::VECTOR;

class _UTILITY_EXPORT_DLL_ AudioObject3D : public AudioObjectBase
{
public:
	AudioObject3D(void);
	virtual ~AudioObject3D(void);
public:
	void				SetMinMaxDistance(bool bUseEditorData, float fMinDistance, float fMaxDistance);
	void				Set3DCone(bool bUseEditorData, float f3DConeInsideAngle, float f3DConeOutsideAngle, float f3DConeOutsideVolume);
	void				SetVolume(float fVolume);
	void				SetEvent(const char* szGuid);
	void				SetPos(const VECTOR& vPos);
	void				SetOrientation(const VECTOR& vOrientation);

	bool				Stop(bool bForce);
	bool				Play();
	void				GetRealMinMaxDistance(float& fMinDistance, float& fMaxDistance) const;
	void				GetReal3DCone(float& f3DConeInsideAngle, float& f3DConeOutsideAngle, float& f3DConeOutsideVolume) const;	
	virtual bool		Reload();
	Event*				GetEvent(){ return m_pAudio3DEvent;}
	virtual void		Tick();
protected:
	virtual bool		OnStop(EventInstance* pEventInstance);
	void				release();	
protected:
	EventInstance*		m_pAudio3D;
	Event*				m_pAudio3DEvent;

	float				m_fMaxDistance;
	float				m_fMinDistance;
	bool				m_bUseEditorMaxMinDis;

	float				m_f3DConeInsideAngle;
	float				m_f3DConeOutsideAngle;
	float				m_f3DConeOutsideVolume;
	bool				m_bUseEditor3DCone;
	bool				m_bHasSetPos;
	bool				m_bHasSetMinMaxDistance;

	VECTOR				m_vPos;
	VECTOR				m_vOrientation;

	float				m_fVolume;
	CriticalSectionWrapper m_csForThreadSafe;
};
