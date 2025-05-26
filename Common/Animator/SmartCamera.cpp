#include "stdafx.h"
#include <Animator/SmartCamera.h>

const A3DVECTOR3 SmartCamera::UNIT_LEFT(1.0f, 0.0f, 0.0f);
const A3DVECTOR3 SmartCamera::UNIT_UP(0.0f, 1.0f, 0.0f);
const A3DVECTOR3 SmartCamera::UNIT_DIR(0.0f, 0.0f, -1.0f);

SmartCamera::SmartCamera(A3DCamera *pCamera)
    : m_pA3DCamera(pCamera),
      m_bActive(false),
      m_bPaused(false),
      m_fSpeed(1.0f),
      m_vInitPos(0.0f),
      m_vLastPos(0.0f),
      m_vDestPos(0.0f),
      m_fLastVelocity(0.0f),
      m_fAcceleration(0.0f),
      m_fMovingTimer(0.0f),
      m_bMoving(false),
	  m_bEnding(false),
      m_qInitOri(1.0f, 0.0f, 0.0f, 0.0f),
      m_qLastOri(1.0f, 0.0f, 0.0f, 0.0f),
      m_qDestOri(1.0f, 0.0f, 0.0f, 0.0f),
      m_fRotatingTimer(0.0f),
      m_bRotating(false),
      m_fInitFOV(0.0f),
      m_fLastFOV(0.0f),
      m_fDestFOV(0.0f),
      m_fFOVingTimer(0.0f),
      m_bFOVing(false),
      m_fBloomParamTimer(0.0f),
      m_fCCParamTimer(0.0f),
      m_fDOFParamTimer(0.0f),
      //m_fGodRayParamTimer(0.0f),
      m_fRadialBlurParamTimer(0.0f),
      m_fMotionBlurParamTimer(0.0f),
      m_fWarpParamTimer(0.0f),
      //m_fFullGlowParamTimer(0.0f),
      m_bBloomParam(false),
      m_bCCParam(false),
      m_bDOFParam(false),
      //m_bGodRayParam(false),
      m_bRadialBlurParam(false),
      m_bMotionBlurParam(false),
      m_bWarpParam(false),
      //m_bFullGlowParam(false)
	  m_bHideHostPlayer(false),
	  m_bHideElsePlayer(false)
{
    ResetPostEffectParam();
}

SmartCamera::~SmartCamera()
{
}

void SmartCamera::ChangeInnerCamera( A3DCamera *pCamera )
{
	if(m_pA3DCamera != pCamera)
	{
		m_pA3DCamera = pCamera;
	}
}

void SmartCamera::UpdateInnerCamera()
{
	if(m_pA3DCamera)
	{
		m_pA3DCamera->SetPos(GetPos());
		m_pA3DCamera->SetDirAndUp(GetDir(), GetUp());
		m_pA3DCamera->SetFOV(GetFOV());	
	}
}

bool SmartCamera::AddListener(Listener *listener)
{
    return m_Listeners.insert(listener).second;
}

bool SmartCamera::RemoveListener(Listener *listener)
{
    return m_Listeners.erase(listener) > 0;
}

void SmartCamera::ClearListeners()
{
    m_Listeners.clear();
}

void SmartCamera::Play()
{
    m_bActive = true;
    m_bPaused = false;
    m_fSpeed = 1.0f;
}

void SmartCamera::Stop()
{
    m_bActive = false;
    m_bPaused = false;
    m_fSpeed = 1.0f;
    m_bMoving = false;
    m_bRotating = false;
    m_bFOVing = false;
	m_bHideHostPlayer = false;
	m_bHideElsePlayer = false;
}

void SmartCamera::Pause()
{
    m_bPaused = true;
}

bool SmartCamera::Tick(const unsigned int delta)
{
    if (!m_bActive) return false;
    if (m_bPaused) return true;

    float dT = m_fSpeed * delta;

    bool bTickPos = _TickPos(dT);
    bool bTickOri = _TickOri(dT);
    bool bTickFOV = _TickFOV(dT);

    bool bTickBloom = _TickBloomParam(dT);
    bool bTickCC = _TickCCParam(dT);
    bool bTickDOF = _TickDOFParam(dT);
    //bool bTickGodRay = _TickGodRayParam(dT);
    bool bTickRadialBlur = _TickRadialBlurParam(dT);
    bool bTickMotionBlur = _TickMotionBlurParam(dT);
    bool bTickWarp = _TickWarpParam(dT);
    //bool bTickFullGlow = _TickFullGlowParam(dT);

    bool bTickAll = (bTickPos || bTickOri || bTickFOV ||
                     bTickBloom || bTickDOF || bTickRadialBlur ||
                     bTickCC || bTickMotionBlur || bTickWarp);
    if (!bTickAll)
    {
        Stop();
        _FireOnDestAll();
    }

    return bTickAll;
}

bool SmartCamera::IsActive() const
{
    return m_bActive;
}

bool SmartCamera::IsPlaying() const
{
    return (m_bActive && !m_bPaused);
}

bool SmartCamera::IsMoving() const
{
    return (m_bActive && m_bMoving);
}

bool SmartCamera::IsRotating() const
{
    return (m_bActive && m_bRotating);
}

bool SmartCamera::IsFOVing() const
{
    return (m_bActive && m_bFOVing);
}

bool SmartCamera::IsAnimatingBloomParam() const
{
	return (m_bActive && m_bBloomParam);
}

bool SmartCamera::IsAnimatingDOFParam() const
{
	return (m_bActive && m_bDOFParam);
}

bool SmartCamera::IsAnimatingCCParam() const
{
    return (m_bActive && m_bCCParam);
}

bool SmartCamera::IsAnimatingRadialBlurParam() const
{
	return (m_bActive && m_bRadialBlurParam);
}

bool SmartCamera::IsAnimatingMotionBlurParam() const
{
	return (m_bActive && m_bMotionBlurParam);
}

bool SmartCamera::IsAnimatingWarpParam() const
{
	return (m_bActive && m_bWarpParam);
}

void SmartCamera::SetSpeed(const float s)
{
    if (s > 0.0f) m_fSpeed = s;
}

float SmartCamera::GetSpeed() const
{
    return m_fSpeed;
}

void SmartCamera::SetInit()
{
    if (m_pA3DCamera)
    {
        SetInitPos(m_pA3DCamera->GetPos());
        SetInitOri(m_pA3DCamera->GetDir(), m_pA3DCamera->GetUp());
        SetInitFOV(m_pA3DCamera->GetFOV());
    }
}

void SmartCamera::SetEnding(bool bEnding)
{
	m_bEnding = bEnding;
}

bool SmartCamera::GetEnding()
{
	return m_bEnding;
}

void SmartCamera::SetInitPos(const A3DVECTOR3 &pos)
{
    m_vInitPos = pos;
    m_vLastPos = pos;
    m_vDestPos = pos;
}

A3DVECTOR3 SmartCamera::GetInitPos() const
{
    return m_vInitPos;
}

A3DVECTOR3 SmartCamera::GetPos() const
{
    return m_vLastPos;
}

A3DVECTOR3 SmartCamera::GetDestPos() const
{
    return m_vDestPos;
}

void SmartCamera::SetInitOri(const A3DQUATERNION &q)
{
    m_qInitOri = q;
    m_qLastOri = q;
    m_qDestOri = q;
}

void SmartCamera::SetInitOri(const A3DVECTOR3 &dir, const A3DVECTOR3 &up)
{
    SetInitOri(SmartCamera::GetOriFromDirAndUp(dir, up));
}

A3DQUATERNION SmartCamera::GetInitOri() const
{
    return m_qInitOri;
}

A3DQUATERNION SmartCamera::GetOri() const
{
    return m_qLastOri;
}

A3DQUATERNION SmartCamera::GetDestOri() const
{
    return m_qDestOri;
}

A3DVECTOR3 SmartCamera::GetInitDir() const
{
    return m_qInitOri ^ SmartCamera::UNIT_DIR;
}

A3DVECTOR3 SmartCamera::GetDir() const
{
    return m_qLastOri ^ SmartCamera::UNIT_DIR;
}

A3DVECTOR3 SmartCamera::GetDestDir() const
{
    return m_qDestOri ^ SmartCamera::UNIT_DIR;
}

A3DVECTOR3 SmartCamera::GetInitUp() const
{
    return m_qInitOri ^ SmartCamera::UNIT_UP;
}

A3DVECTOR3 SmartCamera::GetUp() const
{
    return m_qLastOri ^ SmartCamera::UNIT_UP;
}

A3DVECTOR3 SmartCamera::GetDestUp() const
{
    return m_qDestOri ^ SmartCamera::UNIT_UP;
}

void SmartCamera::SetInitFOV(const float &fov)
{
    m_fInitFOV = fov;
    m_fLastFOV = fov;
    m_fDestFOV = fov;
}

float SmartCamera::GetInitFOV() const
{
    return m_fInitFOV;
}

float SmartCamera::GetFOV() const
{
    return m_fLastFOV;
}

float SmartCamera::GetDestFOV() const
{
    return m_fDestFOV;
}

// accelerationPercent = [-1.0f, 1.0f]
void SmartCamera::MoveTo(const A3DVECTOR3 &pos, const unsigned int useTime, const float accelerationPercent)
{
    m_vDestPos = pos;
    m_fMovingTimer = float(useTime);

    if (useTime > 0)
    {
        float distance = Magnitude(m_vDestPos - m_vLastPos);
        float velocity = distance / m_fMovingTimer;
        m_fLastVelocity = velocity * (1.0f - accelerationPercent);
        m_fAcceleration = velocity * accelerationPercent * 2.0f / m_fMovingTimer;
    }
    else
    {
        m_fLastVelocity = 0.0f;
        m_fAcceleration = 0.0f;
    }

    m_bMoving = true;
    Play();
}

void SmartCamera::RotateTo(const A3DQUATERNION &q, const unsigned int useTime)
{
    m_qDestOri = q;
    m_fRotatingTimer = float(useTime);
    m_bRotating = true;
    Play();
}

void SmartCamera::RotateTo(const A3DVECTOR3 &dir, const A3DVECTOR3 &up, const unsigned int useTime)
{
    RotateTo(SmartCamera::GetOriFromDirAndUp(dir, up), useTime);
}

void SmartCamera::FOVTo(const float &fov, const unsigned int useTime)
{
    m_fDestFOV = fov;
    m_fFOVingTimer = float(useTime);
    m_bFOVing = true;
    Play();
}

void SmartCamera::ResetPostEffectParam()
{
}

void SmartCamera::SetInitPostEffectParam(const A3DPOST_EFFECT_PARAM &param)
{
    m_InitPostEffectParam = param;
    m_LastPostEffectParam = param;
    m_DestPostEffectParam = param;
}

const A3DPOST_EFFECT_PARAM& SmartCamera::GetInitPostEffectParam() const
{
    return m_InitPostEffectParam;
}

const A3DPOST_EFFECT_PARAM& SmartCamera::GetPostEffectParam() const
{
    return m_LastPostEffectParam;
}

const A3DPOST_EFFECT_PARAM& SmartCamera::GetDestPostEffectParam() const
{
    return m_DestPostEffectParam;
}

void SmartCamera::EnablePostEffect(const DWORD mask)
{
    m_InitPostEffectParam.dwPostEffectMask |= mask;
    m_LastPostEffectParam.dwPostEffectMask |= mask;
    m_DestPostEffectParam.dwPostEffectMask |= mask;
}

void SmartCamera::DisablePostEffect(const DWORD mask)
{
    m_InitPostEffectParam.dwPostEffectMask &= ~mask;
    m_LastPostEffectParam.dwPostEffectMask &= ~mask;
    m_DestPostEffectParam.dwPostEffectMask &= ~mask;

	ResetPostEffect(mask);
}

void SmartCamera::ResetPostEffect(const DWORD mask)
{
	if (mask & A3DPOST_EFFECT_CC)
	{
		m_fCCParamTimer = 0.0f; m_bCCParam = false;
	}
	if (mask & A3DPOST_EFFECT_GodRay)
	{
		m_fGodRayParamTimer = 0.0f; m_bGodRayParam = false;
	}
	if (mask & A3DPOST_EFFECT_Bloom)
	{
		m_fBloomParamTimer = 0.0f; m_bBloomParam = false;
	}
	if (mask & A3DPOST_EFFECT_Dof)
	{
		m_fDOFParamTimer = 0.0f; m_bDOFParam = false;
	}
	if (mask & A3DPOST_EFFECT_RadialBlur)
	{
		m_fRadialBlurParamTimer = 0.0f; m_bRadialBlurParam = false;
	}
	if (mask & A3DPOST_EFFECT_MotionBlur)
	{
		m_fMotionBlurParamTimer = 0.0f; m_bMotionBlurParam = false;
	}
	if (mask & A3DPOST_EFFECT_Warp)
	{
		m_fWarpParamTimer = 0.0f; m_bWarpParam = false;
	}
	if (mask & A3DPOST_EFFECT_FullGlow)
	{
		m_fFullGlowParamTimer = 0.0f; m_bFullGlowParam = false;
	}
}

void SmartCamera::AnimateBloomParam(const A3DPOST_EFFECT_BLOOM_PARAM &param, const unsigned int useTime, bool bEnd, const A3DPOST_EFFECT_BLOOM_PARAM &destParam)
{
	EnablePostEffect(A3DPOST_EFFECT_Bloom);
	if (bEnd)
	{
		m_LastPostEffectParam.bloomParam = param;
		m_DestPostEffectParam.bloomParam = destParam;
	}
	else
		m_DestPostEffectParam.bloomParam = param;
    m_fBloomParamTimer = float(useTime);
    m_bBloomParam = true;
    Play();
}

void SmartCamera::AnimateCCParam(const A3DPOST_EFFECT_CC_PARAM &param, const unsigned int useTime, bool bEnd, const A3DPOST_EFFECT_CC_PARAM &destParam)
{
	EnablePostEffect(A3DPOST_EFFECT_CC);
	if (bEnd)
	{
		m_LastPostEffectParam.ccParam = param;
		m_DestPostEffectParam.ccParam = destParam;
	}
	else
		m_DestPostEffectParam.ccParam = param;

    m_DestPostEffectParam.ccParam.bUseManualParam1 = false;
    m_DestPostEffectParam.ccParam.bUseManualParam2 = false;
    m_DestPostEffectParam.ccParam.bAfterUI = false;
    m_fCCParamTimer = float(useTime);
    m_bCCParam = true;
    Play();
}

void SmartCamera::AnimateDOFParam(const A3DPOST_EFFECT_DOF_PARAM &param, const unsigned int useTime, bool bEnd, const A3DPOST_EFFECT_DOF_PARAM &destParam)
{
	EnablePostEffect(A3DPOST_EFFECT_Dof);
	if (bEnd)
	{
		m_LastPostEffectParam.dofParam = param;
		m_DestPostEffectParam.dofParam = destParam;
	}
	else
		m_DestPostEffectParam.dofParam = param;
    m_fDOFParamTimer = float(useTime);
    m_bDOFParam = true;
    Play();
}

/*
void SmartCamera::AnimateGodRayParam(const A3DPOST_EFFECT_GODRAY_PARAM &param, const unsigned int useTime)
{
    m_DestPostEffectParam.godRayParam = param;
    m_bGodRayParamTimer = float(useTime);
    m_bGodRayParam = true;
    Play();
}
*/

void SmartCamera::AnimateRadialBlurParam(const A3DPOST_EFFECT_RADIUSBLUR_PARAM &param, const unsigned int useTime, bool bEnd, const A3DPOST_EFFECT_RADIUSBLUR_PARAM &destParam)
{
	EnablePostEffect(A3DPOST_EFFECT_RadialBlur);
	if (bEnd)
	{
		m_LastPostEffectParam.radiusBlurParam = param;
		m_DestPostEffectParam.radiusBlurParam = destParam;
	}
	else
		m_DestPostEffectParam.radiusBlurParam = param;
    m_fRadialBlurParamTimer = float(useTime);
    m_bRadialBlurParam = true;
    Play();
}

void SmartCamera::AnimateMotionBlurParam(const A3DPOST_EFFECT_MOTIONBLUR_PARAM &param, const unsigned int useTime, bool bEnd, const A3DPOST_EFFECT_MOTIONBLUR_PARAM &destParam)
{
	EnablePostEffect(A3DPOST_EFFECT_MotionBlur);
	if (bEnd)
	{
		m_LastPostEffectParam.motionBlurParam = param;
		m_DestPostEffectParam.motionBlurParam = destParam;
	}
	else
		m_DestPostEffectParam.motionBlurParam = param;
    m_fMotionBlurParamTimer = float(useTime);
    m_bMotionBlurParam = true;
    Play();
}

void SmartCamera::AnimateWarpParam(const A3DPOST_EFFECT_WARP_PARAM &param, const unsigned int useTime, const bool bEnd, const A3DPOST_EFFECT_WARP_PARAM &destParam)
{
	EnablePostEffect(A3DPOST_EFFECT_Warp);
	if (bEnd)
	{
		m_LastPostEffectParam.warpParam = param;
		m_DestPostEffectParam.warpParam = destParam;
	}
	else
		m_DestPostEffectParam.warpParam = param;
    m_fWarpParamTimer = float(useTime);
    m_bWarpParam = true;
    Play();
}

/*
void SmartCamera::AnimateFullGlowParam(const A3DPOST_EFFECT_FULLGLOW_PARAM &param, const unsigned int useTime)
{
    m_DestPostEffectParam.fullGlowParam = param;
    m_fFullGlowParamTimer = float(useTime);
    m_bFullGlowParam = true;
    Play();
}
*/

bool SmartCamera::_TickPos(const float delta)
{
    if (!m_bMoving) return false;

    if (delta < m_fMovingTimer)
    {
        float dS = (m_fLastVelocity + m_fAcceleration * delta * 0.5f) * delta;

        A3DVECTOR3 moveDir = m_vDestPos - m_vLastPos;
        if (!moveDir.IsZero())
        {
            moveDir.Normalize();
        }
        m_vLastPos += moveDir * dS;

        m_fLastVelocity += m_fAcceleration * delta;
        m_fMovingTimer -= delta;
    }
    else
    {
        m_vLastPos = m_vDestPos;
        m_fMovingTimer = 0.0f;
        m_bMoving = false;
        _FireOnDestPos();
    }

    return m_bMoving;
}

bool SmartCamera::_TickOri(const float delta)
{
    if (!m_bRotating) return false;

    if (delta < m_fRotatingTimer)
    {
        float u = delta / m_fRotatingTimer;
        m_qLastOri = SLERPQuad(m_qLastOri, m_qDestOri, u);
        m_fRotatingTimer -= delta;
    }
    else
    {
        m_qLastOri = m_qDestOri;
        m_fRotatingTimer = 0.0f;
        m_bRotating = false;
        _FireOnDestOri();
    }

    return m_bRotating;
}

bool SmartCamera::_TickFOV(const float delta)
{
    if (!m_bFOVing) return false;

    if (delta < m_fFOVingTimer)
    {
        float u = delta / m_fFOVingTimer;
        m_fLastFOV += u * (m_fDestFOV - m_fLastFOV);
        m_fFOVingTimer -= delta;
    }
    else
    {
        m_fLastFOV = m_fDestFOV;
        m_fFOVingTimer = 0.0f;
        m_bFOVing = false;
        _FireOnDestFOV();
    }

    return m_bFOVing;
}

bool SmartCamera::_TickBloomParam(const float delta)
{
    if (!m_bBloomParam) return false;

    if (delta < m_fBloomParamTimer)
    {
        float u = delta / m_fBloomParamTimer;
        m_LastPostEffectParam.bloomParam.fBlurSize += u * (m_DestPostEffectParam.bloomParam.fBlurSize - m_LastPostEffectParam.bloomParam.fBlurSize);
        m_LastPostEffectParam.bloomParam.fBrightScale += u * (m_DestPostEffectParam.bloomParam.fBrightScale - m_LastPostEffectParam.bloomParam.fBrightScale);
        m_LastPostEffectParam.bloomParam.fBrightThreshold += u * (m_DestPostEffectParam.bloomParam.fBrightThreshold - m_LastPostEffectParam.bloomParam.fBrightThreshold);
        m_fBloomParamTimer -= delta;
    }
    else
    {
		DisablePostEffect(A3DPOST_EFFECT_Bloom);
        m_LastPostEffectParam.bloomParam = m_DestPostEffectParam.bloomParam;
        _FireOnDestBloomParam();
    }

    return m_bBloomParam;
}

bool SmartCamera::_TickCCParam(const float delta)
{
    if (!m_bCCParam) return false;

    if (delta < m_fCCParamTimer)
    {
        float u = delta / m_fCCParamTimer;
        m_LastPostEffectParam.ccParam.fFactor += u * (m_DestPostEffectParam.ccParam.fFactor - m_LastPostEffectParam.ccParam.fFactor);
        m_LastPostEffectParam.ccParam.bUseManualParam1 = m_DestPostEffectParam.ccParam.bUseManualParam1;
        m_LastPostEffectParam.ccParam.bUseManualParam2 = m_DestPostEffectParam.ccParam.bUseManualParam2;
        m_LastPostEffectParam.ccParam.szTex1 = m_DestPostEffectParam.ccParam.szTex1;
        m_LastPostEffectParam.ccParam.szTex2 = m_DestPostEffectParam.ccParam.szTex2;
        m_LastPostEffectParam.ccParam.bAfterUI = m_DestPostEffectParam.ccParam.bAfterUI;
        m_fCCParamTimer -= delta;
    }
    else
    {
        DisablePostEffect(A3DPOST_EFFECT_CC);
        m_LastPostEffectParam.ccParam = m_DestPostEffectParam.ccParam;
        _FireOnDestCCParam();
    }

    return m_bCCParam;
}

bool SmartCamera::_TickDOFParam(const float delta)
{
    if (!m_bDOFParam) return false;

    if (delta < m_fDOFParamTimer)
    {
        float u = delta / m_fDOFParamTimer;
        m_LastPostEffectParam.dofParam.fNearBlur += u * (m_DestPostEffectParam.dofParam.fNearBlur - m_LastPostEffectParam.dofParam.fNearBlur);
        m_LastPostEffectParam.dofParam.fNearFocus += u * (m_DestPostEffectParam.dofParam.fNearFocus - m_LastPostEffectParam.dofParam.fNearFocus);
        m_LastPostEffectParam.dofParam.fFarFocus += u * (m_DestPostEffectParam.dofParam.fFarFocus - m_LastPostEffectParam.dofParam.fFarFocus);
        m_LastPostEffectParam.dofParam.fFarBlur += u * (m_DestPostEffectParam.dofParam.fFarBlur - m_LastPostEffectParam.dofParam.fFarBlur);
        m_LastPostEffectParam.dofParam.fClampBlurFar += u * (m_DestPostEffectParam.dofParam.fClampBlurFar - m_LastPostEffectParam.dofParam.fClampBlurFar);
        m_fDOFParamTimer -= delta;
    }
    else
    {
		DisablePostEffect(A3DPOST_EFFECT_Dof);
        m_LastPostEffectParam.dofParam = m_DestPostEffectParam.dofParam;
        _FireOnDestDOFParam();
    }

    return m_bDOFParam;
}

//bool SmartCamera::_TickGodRayParam(const float delta)
bool SmartCamera::_TickRadialBlurParam(const float delta)
{
    if (!m_bRadialBlurParam) return false;

    if (delta < m_fRadialBlurParamTimer)
    {
        float u = delta / m_fRadialBlurParamTimer;
        m_LastPostEffectParam.radiusBlurParam.fBlurCenterX += u * (m_DestPostEffectParam.radiusBlurParam.fBlurCenterX - m_LastPostEffectParam.radiusBlurParam.fBlurCenterX);
        m_LastPostEffectParam.radiusBlurParam.fBlurCenterY += u * (m_DestPostEffectParam.radiusBlurParam.fBlurCenterY - m_LastPostEffectParam.radiusBlurParam.fBlurCenterY);
        m_LastPostEffectParam.radiusBlurParam.fBlurLength += u * (m_DestPostEffectParam.radiusBlurParam.fBlurLength - m_LastPostEffectParam.radiusBlurParam.fBlurLength);
        m_LastPostEffectParam.radiusBlurParam.fInFocusRadius += u * (m_DestPostEffectParam.radiusBlurParam.fInFocusRadius - m_LastPostEffectParam.radiusBlurParam.fInFocusRadius);
        m_LastPostEffectParam.radiusBlurParam.fOutFocusRadius += u * (m_DestPostEffectParam.radiusBlurParam.fOutFocusRadius - m_LastPostEffectParam.radiusBlurParam.fOutFocusRadius);
        m_fRadialBlurParamTimer -= delta;
    }
    else
    {
		DisablePostEffect(A3DPOST_EFFECT_RadialBlur);
        m_LastPostEffectParam.radiusBlurParam = m_DestPostEffectParam.radiusBlurParam;
        _FireOnDestRadialBlurParam();
    }

    return m_bRadialBlurParam;
}

bool SmartCamera::_TickMotionBlurParam(const float delta)
{
    if (!m_bMotionBlurParam) return false;

    if (delta < m_fMotionBlurParamTimer)
    {
        float u = delta / m_fMotionBlurParamTimer;
        m_LastPostEffectParam.motionBlurParam.fBlurMax += u * (m_DestPostEffectParam.motionBlurParam.fBlurMax - m_LastPostEffectParam.motionBlurParam.fBlurMax);
        m_LastPostEffectParam.motionBlurParam.fBlurScale += u * (m_DestPostEffectParam.motionBlurParam.fBlurScale - m_LastPostEffectParam.motionBlurParam.fBlurScale);
        m_LastPostEffectParam.motionBlurParam.fBlurScalePosition += u * (m_DestPostEffectParam.motionBlurParam.fBlurScalePosition - m_LastPostEffectParam.motionBlurParam.fBlurScalePosition);
        m_LastPostEffectParam.motionBlurParam.fBlurScaleRotation += u * (m_DestPostEffectParam.motionBlurParam.fBlurScaleRotation - m_LastPostEffectParam.motionBlurParam.fBlurScaleRotation);
        m_LastPostEffectParam.motionBlurParam.fInFocusDistance += u * (m_DestPostEffectParam.motionBlurParam.fInFocusDistance - m_LastPostEffectParam.motionBlurParam.fInFocusDistance);
        m_LastPostEffectParam.motionBlurParam.fOutFocusDistance += u * (m_DestPostEffectParam.motionBlurParam.fOutFocusDistance - m_LastPostEffectParam.motionBlurParam.fOutFocusDistance);
        m_fMotionBlurParamTimer -= delta;
    }
    else
    {
		DisablePostEffect(A3DPOST_EFFECT_MotionBlur);
        m_LastPostEffectParam.motionBlurParam = m_DestPostEffectParam.motionBlurParam;
        _FireOnDestMotionBlurParam();
    }

    return m_bMotionBlurParam;
}

bool SmartCamera::_TickWarpParam(const float delta)
{
    if (!m_bWarpParam) return false;

    if (delta < m_fWarpParamTimer)
    {
        float u = delta / m_fWarpParamTimer;
        m_LastPostEffectParam.warpParam.fScale += u * (m_DestPostEffectParam.warpParam.fScale - m_LastPostEffectParam.warpParam.fScale);
        m_LastPostEffectParam.warpParam.fSpeed += u * (m_DestPostEffectParam.warpParam.fSpeed - m_LastPostEffectParam.warpParam.fSpeed);
        m_fWarpParamTimer -= delta;
    }
    else
    {
		DisablePostEffect(A3DPOST_EFFECT_Warp);
        m_LastPostEffectParam.warpParam = m_DestPostEffectParam.warpParam;
        _FireOnDestWarpParam();
    }

    return m_bWarpParam;
}

//bool SmartCamera::_TickFullGlowParam(const float delta)

float SmartCamera::Clamp(const float a)
{
    if (a < -1.0f) return -1.0f;
    if (a > 1.0f) return 1.0f;
    return a;
}

A3DQUATERNION SmartCamera::GetOriFromDirAndUp(const A3DVECTOR3 &dir, const A3DVECTOR3 &up)
{
    A3DVECTOR3 vDir = dir;
    vDir.Normalize();
    A3DVECTOR3 vLeft = CrossProduct(vDir, up);
    vLeft.Normalize();
    A3DVECTOR3 vUp = CrossProduct(vLeft, vDir);
    vUp.Normalize();

    A3DVECTOR3 yawD = vDir;
    yawD.y = 0.0f;
    yawD.Normalize();

    float angleYaw = (float)acos(SmartCamera::Clamp(DotProduct(SmartCamera::UNIT_DIR, yawD)));
    if (yawD.x > 0.0f) angleYaw = -angleYaw;
    A3DQUATERNION q(SmartCamera::UNIT_UP, angleYaw);

    float anglePitch = (float)acos(Clamp(DotProduct(yawD, vDir)));
    if (vDir.y < 0.0f) anglePitch = -anglePitch;
    q = q * A3DQUATERNION(SmartCamera::UNIT_LEFT, anglePitch);

    float angleRoll = (float)acos(Clamp(DotProduct(q ^ SmartCamera::UNIT_UP, vUp)));
    vLeft = q ^ SmartCamera::UNIT_LEFT;
    float dQ = DotProduct(vUp, vLeft);
    if (dQ < 0.0f) angleRoll = -angleRoll;
    q = q * A3DQUATERNION(SmartCamera::UNIT_DIR, angleRoll);

    return q;
}

float SmartCamera::Lerp(const float start, const float end, const float u)
{
    return (1.0f - u) * start + u * end;
}

void SmartCamera::_FireOnDestAll()
{
    ListenersIterator it, iend;
    iend = m_Listeners.end();
    for (it=m_Listeners.begin(); it!=iend; ++it)
    {
        if ((*it)) (*it)->OnDestAll(this);
    }
}

void SmartCamera::_FireOnDestPos()
{
    ListenersIterator it, iend;
    iend = m_Listeners.end();
    for (it=m_Listeners.begin(); it!=iend; ++it)
    {
        if ((*it)) (*it)->OnDestPos(this, m_vDestPos);
    }
}

void SmartCamera::_FireOnDestOri()
{
    ListenersIterator it, iend;
    iend = m_Listeners.end();
    for (it=m_Listeners.begin(); it!=iend; ++it)
    {
        if ((*it)) (*it)->OnDestOri(this, m_qDestOri);
    }
}

void SmartCamera::_FireOnDestFOV()
{
    ListenersIterator it, iend;
    iend = m_Listeners.end();
    for (it=m_Listeners.begin(); it!=iend; ++it)
    {
        if ((*it)) (*it)->OnDestFOV(this, m_fDestFOV);
    }
}

void SmartCamera::_FireOnDestBloomParam()
{
    ListenersIterator it, iend;
    iend = m_Listeners.end();
    for (it=m_Listeners.begin(); it!=iend; ++it)
    {
        if ((*it)) (*it)->OnDestBloomParam(this, m_DestPostEffectParam.bloomParam);
    }
}

void SmartCamera::_FireOnDestCCParam()
{
    ListenersIterator it, iend;
    iend = m_Listeners.end();
    for (it=m_Listeners.begin(); it!=iend; ++it)
    {
        if ((*it)) (*it)->OnDestCCParam(this, m_DestPostEffectParam.ccParam);
    }
}

void SmartCamera::_FireOnDestDOFParam()
{
    ListenersIterator it, iend;
    iend = m_Listeners.end();
    for (it=m_Listeners.begin(); it!=iend; ++it)
    {
        if ((*it)) (*it)->OnDestDOFParam(this, m_DestPostEffectParam.dofParam);
    }
}

void SmartCamera::_FireOnDestGodRayParam()
{
    ListenersIterator it, iend;
    iend = m_Listeners.end();
    for (it=m_Listeners.begin(); it!=iend; ++it)
    {
        if ((*it)) (*it)->OnDestGodRayParam(this, m_DestPostEffectParam.godRayParam);
    }
}

void SmartCamera::_FireOnDestRadialBlurParam()
{
    ListenersIterator it, iend;
    iend = m_Listeners.end();
    for (it=m_Listeners.begin(); it!=iend; ++it)
    {
        if ((*it)) (*it)->OnDestRadialBlurParam(this, m_DestPostEffectParam.radiusBlurParam);
    }
}

void SmartCamera::_FireOnDestMotionBlurParam()
{
    ListenersIterator it, iend;
    iend = m_Listeners.end();
    for (it=m_Listeners.begin(); it!=iend; ++it)
    {
        if ((*it)) (*it)->OnDestMotionBlurParam(this, m_DestPostEffectParam.motionBlurParam);
    }
}

void SmartCamera::_FireOnDestWarpParam()
{
    ListenersIterator it, iend;
    iend = m_Listeners.end();
    for (it=m_Listeners.begin(); it!=iend; ++it)
    {
        if ((*it)) (*it)->OnDestWarpParam(this, m_DestPostEffectParam.warpParam);
    }
}

void SmartCamera::_FireOnDestFullGlowParam()
{
    ListenersIterator it, iend;
    iend = m_Listeners.end();
    for (it=m_Listeners.begin(); it!=iend; ++it)
    {
        if ((*it)) (*it)->OnDestFullGlowParam(this, m_DestPostEffectParam.fullGlowParam);
    }
}

void SmartCamera::HideInSmartCamera(bool bHideHostPlayer/* = false*/, bool bHideElsePlayer/* = false*/)
{
	m_bHideHostPlayer = bHideHostPlayer;
	m_bHideElsePlayer = bHideElsePlayer;
}