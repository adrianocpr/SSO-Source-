#pragma once
#include "AudioObjectBase.h"

class _UTILITY_EXPORT_DLL_ AudioObjectVolume : public AudioObjectBase
{
public:
	AudioObjectVolume(void);
	virtual ~AudioObjectVolume(void);
public:
	void				SetVolume(float fMusicVolume, float fEnvEffectVolume);	
	void				SetHeightRange(float fBottom, float fTop);
	void				SetFadeTime(int iFadeTime);

	void				GetVolume(float& fMusicVolume, float& fEnvEffectVolume) const;
	int					GetFadeTime() const;
	bool				IsPtIn(float x, float y, float z);
protected:
	float				m_fMusicVolume;
	float				m_fEnvEffectVolume;
	float				m_fBottom;
	float				m_fTop;
	int					m_iFadeTime;
};
