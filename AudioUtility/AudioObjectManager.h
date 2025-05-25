#pragma once

#include "ExportDecl.h"
#include "FAudioEngine.h"
#include <set>
#include <FEventInstance.h>


namespace AudioEngine
{
	class EventSystem;
	class Event;
}

using AudioEngine::EventSystem;
using AudioEngine::VECTOR;
using AudioEngine::Event;
using AudioEngine::EventInstance;

class AudioObjectBase;
class AudioObjectBGM;
class AudioObjectVolume;
class AudioObjectEffect;
class AudioObject3D;
class AudioObjectReverb;

typedef std::set<AudioObjectBase*> AudioObjectSet;

class _UTILITY_EXPORT_DLL_ AudioObjectManager : public EventInstance::EventInstanceListener
{
public:
	AudioObjectManager(void);
	~AudioObjectManager(void);
public:
	bool				Init(EventSystem* pEventSystem);
	AudioObjectBase*	CreateObject(int iType);
	bool				DestroyObject(AudioObjectBase* pAudioObject);
	void				Tick();
	void				SetListenerPos(const VECTOR& vListenerPos);
	void				SetZoneListenerPos(const VECTOR& vZoneListenerPos);
	void				SetDNFactor(float fDNFactor);
	bool				Reload(); // 仅用于编辑器。在音频文件改动，需重新加载时调用。	

	AudioObjectBGM*			getCurAudioBGM();
	bool					PlayIntercutBGM(const char* szGUID);
	bool					StopIntercutBGM();
	const EventInstance*	GetIntercutBGM() { return m_pCurIntercutEventInstance; };

protected:
	AudioObjectVolume*	getCurAudioVolume();
	AudioObjectBGM*		castAudioBGM(AudioObjectBase* pAudioObject);
	AudioObjectVolume*	castAudioVolume(AudioObjectBase* pAudioObject);
	AudioObjectEffect*	castAudioEffect(AudioObjectBase* pAudioObject);
	AudioObject3D*		castAudio3D(AudioObjectBase* pAudioObject);
	AudioObjectReverb*	castAudioReverb(AudioObjectBase* pAudioObject);
	void				release();
	virtual bool		OnStop(EventInstance* pEventInstance);
protected:
	EventSystem*		m_pEventSystem;
	AudioObjectSet		m_setAudio3D;
	AudioObjectSet		m_setAudioEffect;
	AudioObjectSet		m_setAudioBGM;
	AudioObjectSet		m_setAudioVolume;
	AudioObjectSet		m_setAudioReverb;
	AudioObjectSet		m_setAudioObject;
	VECTOR				m_vListenerPos;
	VECTOR				m_vZoneListenerPos;

	AudioObjectBGM*		m_pLastAudioBGM;
	Event*				m_pLastMusicEvent;
	Event*				m_pLastEnvEffectEvent;
	AudioObjectVolume*	m_pLastAudioVolume;
	float				m_fLastMusicVolume;
	float				m_fLastEnvEffectVolume;
	bool				m_bEnterVolumeZone;
	bool				m_bLeaveVolumeZone;

	float				m_fDNFactor;
	DWORD				m_dwStartFadeTick;
	DWORD				m_dwFadeTime;
	bool				m_bFading;
	bool				m_bIntercut;
	EventInstance*		m_pCurIntercutEventInstance;
};
