#pragma once

#include "ExportDecl.h"
#include <FAudioEngine.h>
#include <FEventInstance.h>

namespace AudioEngine
{
	class EventSystem;
}

using AudioEngine::EventSystem;
using AudioEngine::EventInstance;
using AudioEngine::Event;
using AudioEngine::VECTOR;

class Zone;
struct PG_POINT;

enum
{
	AUDIO_NONE,
	AUDIO_3D,
	AUDIO_EFFECT,
	AUDIO_BGM,
	AUDIO_VOLUME,
	AUDIO_REVERB
};

class _UTILITY_EXPORT_DLL_ AudioObjectBase : public EventInstance::EventInstanceListener
{
public:
	AudioObjectBase(void);
	virtual ~AudioObjectBase(void);
public:
	bool				Init(EventSystem* pEventSystem);
	bool				CreateZone(PG_POINT* pPoints, int iPointNum);
	bool				IsPtIn(const PG_POINT& pt);
	bool				IsPtIn(float x, float z);
	float				PtDistance(const PG_POINT& pt);
	float				PtDistance(float x, float z);
	void				SetListenerPos(const VECTOR& vListenerPos);
	virtual void		Tick();
	int					GetType() const;	
	virtual bool		Reload();
protected:
	virtual bool		OnStop(EventInstance* pEventInstance);
	void				release();
	void				releaseEventInstance(EventInstance*& pEventInstance, bool bAutoDestroy);
	bool				reload(Event* pEvent, EventInstance* pEventInstance);
protected:
	EventSystem*		m_pEventSystem;
	Zone*				m_pZone;
	int					m_iType;
	VECTOR				m_vListenerPos;
	bool				m_bHasSetListenerPos;
};
