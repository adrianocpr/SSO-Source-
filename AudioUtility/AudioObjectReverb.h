#pragma once
#include "AudioObjectBase.h"

namespace AudioEngine
{
	struct REVERB;
	class Reverb;
}

using AudioEngine::REVERB;
using AudioEngine::Reverb;

class _UTILITY_EXPORT_DLL_ AudioObjectReverb : public AudioObjectBase
{
public:
	AudioObjectReverb(void);
	virtual ~AudioObjectReverb(void);
public:
	void				SetShapeSphere(const VECTOR& vCenter, float fRadius);
	void				SetShapeCubiod(const VECTOR& vCenter, float fLength, float fWidth, float fHight);
	void				SetShapePolygon(VECTOR* pPoints, int iPtNum, float fBottom, float fTop);
	void				SetReverb(const char* szName);
	void				Set3DAttributes(const VECTOR& pos, float fMinDistance, float fMaxDistance);
	bool				CreateReverb();
protected:
	void				release();
protected:
	float				m_fLength;
	float				m_fWidth;
	float				m_fHeight;
	float				m_fRadius;
	int					m_iShape;
	Reverb*				m_pReverb;
	REVERB*				m_pREVERB;
	VECTOR				m_vCenter;
	float				m_fMaxDistance;
	float				m_fMinDistance;
	VECTOR*				m_pPoints;
	float				m_fBottom;
	float				m_fTop;
	int					m_iPtNum;
};
