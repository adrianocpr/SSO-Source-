#pragma once
#include "AudioObjectBase.h"

namespace AudioEngine
{
	class Event;
}

using AudioEngine::Event;

class _UTILITY_EXPORT_DLL_ AudioObjectBGM : public AudioObjectBase
{
public:
	AudioObjectBGM(void);
	virtual ~AudioObjectBGM(void);
public:
	void					SetHeightRange(float fBottom, float fTop);	
	void					SetMusicEvent(const char* szGuid, bool bDay);
	void					SetEnvEffectEvent(const char* szGuid, bool bDay);	
	void					SetPriority(int iPriority);
	void					SetVolume(float fMusicVolume, float fEnvEffectVolume);

	void					SetDNFactor(float fDNFactor);
	void					GetHeightRange(float& fBottom, float& fTop) const;
	int						GetPriority() const;
	bool					PlayMusic();
	bool					PlayEnvEffect();
	bool					StopMusic();
	bool					StopEnvEffect();
	EventInstance*			GetMusic() const;
	EventInstance*			GetEnvEffect() const;
	Event*					GetMusicEvent() const;
	Event*					GetEnvEffectEvent() const;		
	bool					IsPtIn(float x, float y, float z);
	virtual bool			Reload();

	Event*			GetMusicDayEvent(){ return m_pMusicDayEvent;}
	Event*			GetMusicNightEvent(){ return m_pMusicNightEvent;}

	Event*			GetEnvEffectDayEvent(){ return m_pEnvEffectDayEvent;}
	Event*			GetEnvEffectNightEvent(){ return m_pEnvEffectNightEvent;}


protected:
	virtual bool			OnStop(EventInstance* pEventInstance);
	void					release();
protected:
	EventInstance*			m_pMusicDay;
	EventInstance*			m_pMusicNight;
	EventInstance*			m_pEnvEffectDay;
	EventInstance*			m_pEnvEffectNight;

	Event*					m_pMusicDayEvent;
	Event*					m_pMusicNightEvent;
	Event*					m_pEnvEffectDayEvent;
	Event*					m_pEnvEffectNightEvent;

	float					m_fBottom;
	float					m_fTop;
	float					m_fDNFactor;

	int						m_iPriority;
};
