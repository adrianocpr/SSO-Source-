#include "stdafx.h"
#include "Animator/Animator.h"
#include "Animator/AnmGodRay.h"

CAnmGodRay::CAnmGodRay(const unsigned int uiID)
    : CAnmAction(uiID)
{
    m_iTotalFrames = 1;
}

void CAnmGodRay::SetStartGodRay(const A3DPOST_EFFECT_GODRAY_PARAM &godRay)
{
    m_StartGodRay = godRay;
}

A3DPOST_EFFECT_GODRAY_PARAM CAnmGodRay::GetStartGodRay() const
{
    return m_StartGodRay;
}

void CAnmGodRay::SetEndGodRay(const A3DPOST_EFFECT_GODRAY_PARAM &godRay)
{
    m_EndGodRay = godRay;
}

A3DPOST_EFFECT_GODRAY_PARAM CAnmGodRay::GetEndGodRay() const
{
    return m_EndGodRay;
}

void CAnmGodRay::SetTotalFrames(const int iFrame)
{
    if (iFrame > 0)
    {
        m_iTotalFrames = iFrame;
    }
    else
    {
        m_iTotalFrames = 1;
    }
}

int CAnmGodRay::GetTotalFrames() const
{
    return m_iTotalFrames;
}

CAnmAction::ActionType CAnmGodRay::GetActionType() const
{
    return CAnmAction::TYPE_GOD_RAY;
}

void CAnmGodRay::CopyDataFrom(CAnmAction *pAction)
{
    CAnmGodRay *pDataAction = dynamic_cast<CAnmGodRay*>(pAction);
    if (pDataAction)
    {
        SetStartGodRay(pDataAction->GetStartGodRay());
        SetEndGodRay(pDataAction->GetEndGodRay());
        SetTotalFrames(pDataAction->GetTotalFrames());
    }
}

bool CAnmGodRay::Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager)
{
    if (IsDead())
    {
        return false;
    }
    DWORD dT = dwNowTime - m_dwStartTime;
    DWORD dwTotalTime = GetTotalTime();
    CAnmObject *pObject = pObjectManager->GetObject(m_uiObjectID);
    if (pObject && pObject->GetObjectType() == CAnmObject::TYPE_CAMERA)
    {
        CAnmCamera *pCamera = dynamic_cast<CAnmCamera*>(pObject);
        {
            if (dwNowTime >= m_dwStartTime)
            {
                // Set GodRay
                if (dT < dwTotalTime)
                {
                    float u = float(dT) / dwTotalTime;
                    A3DPOST_EFFECT_GODRAY_PARAM godRay;
                    godRay.fOcclusionDepthRange = Lerp(m_StartGodRay.fOcclusionDepthRange, m_EndGodRay.fOcclusionDepthRange, u);
                    godRay.fBloomScale = Lerp(m_StartGodRay.fBloomScale, m_EndGodRay.fBloomScale, u);
                    godRay.fBloomThreshold = Lerp(m_StartGodRay.fBloomThreshold, m_EndGodRay.fBloomThreshold, u);
                    godRay.fScreenBlendThreshold = Lerp(m_StartGodRay.fScreenBlendThreshold, m_EndGodRay.fScreenBlendThreshold, u);
                    A3DVECTOR3 vColor = A3DVECTOR3(1.0f);
                    vColor.x = Lerp(m_StartGodRay.vBloomTintColor.x, m_EndGodRay.vBloomTintColor.x, u);
                    vColor.y = Lerp(m_StartGodRay.vBloomTintColor.y, m_EndGodRay.vBloomTintColor.y, u);
                    vColor.z = Lerp(m_StartGodRay.vBloomTintColor.z, m_EndGodRay.vBloomTintColor.z, u);
                    godRay.vBloomTintColor = vColor;
                    godRay.fOcclusionDarkness = Lerp(m_StartGodRay.fOcclusionDarkness, m_EndGodRay.fOcclusionDarkness, u);
                    godRay.fVisibleAngle = Lerp(m_StartGodRay.fVisibleAngle, m_EndGodRay.fVisibleAngle, u);
                    g_Animator.EnablePostEffect(A3DPOST_EFFECT_GodRay);
                    g_Animator.SetPostEffectGodRayParam(godRay);
                }
                else
                {
                    g_Animator.EnablePostEffect(A3DPOST_EFFECT_GodRay);
                    g_Animator.SetPostEffectGodRayParam(m_EndGodRay);
                }
            }
        }
    }

    if (dT >= dwTotalTime)
    {
        g_Animator.DisablePostEffect(A3DPOST_EFFECT_GodRay);
        m_bDead = true;
    }
    return IsDead();
}

DWORD CAnmGodRay::GetTotalTime() const
{
    return TIME_PER_FRAME * m_iTotalFrames;
}

CAnmGodRay::~CAnmGodRay()
{
}
