#pragma once
#include "AudioObjectBase.h"

namespace AudioEngine
{
	class Event;
}

using AudioEngine::Event;

class _UTILITY_EXPORT_DLL_ AudioObjectEffect : public AudioObjectBase
{
public:
	AudioObjectEffect(void);
	virtual ~AudioObjectEffect(void);
public:
	void				SetHeightRange(float fBottom, float fTop);	
	void				SetEffectEvent(const char* szGuid, bool bDay);
	void				SetFadeDistance(float fVertFadeDistance, float fHoriFadeDistance);

	void				GetHeightRange(float& fBottom, float& fTop) const;
	void				SetDNFactor(float fDNFactor);	
	void				GetFadeDistance(float& fVertFadeDistance, float& fHoriFadeDistance) const;
	bool				Play();
	bool				Stop();
	virtual void		Tick();
	void				SetVolume(float fVolume);
	virtual bool		Reload();

	Event*			GetEffectDayEvent(){ return m_pEffectDayEvent;}
	Event*			GetEffectNightEvent(){ return m_pEffectNightEvent;}

protected:
	virtual bool		OnStop(EventInstance* pEventInstance);
	void				release();
	


protected:
	Event*				m_pEffectDayEvent;
	Event*				m_pEffectNightEvent;

	EventInstance*		m_pEffectDay;
	EventInstance*		m_pEffectNight;

	float				m_fBottom;
	float				m_fTop;
	float				m_fDNFactor;

	float				m_fVertFadeDistance;
	float				m_fHoriFadeDistance;

	float				m_fVolume;
};
