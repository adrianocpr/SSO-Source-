#include "stdafx.h"
#include "Animator/Animator.h"
#include "Animator/AnmRadialBlur.h"

CAnmRadialBlur::CAnmRadialBlur(const unsigned int uiID)
    : CAnmAction(uiID)
{
    m_iTotalFrames = 1;
}

void CAnmRadialBlur::SetStartRadialBlur(const A3DPOST_EFFECT_RADIUSBLUR_PARAM &RadialBlur)
{
    m_StartRadialBlur = RadialBlur;
}

A3DPOST_EFFECT_RADIUSBLUR_PARAM CAnmRadialBlur::GetStartRadialBlur() const
{
    return m_StartRadialBlur;
}

void CAnmRadialBlur::SetEndRadialBlur(const A3DPOST_EFFECT_RADIUSBLUR_PARAM &RadialBlur)
{
    m_EndRadialBlur = RadialBlur;
}

A3DPOST_EFFECT_RADIUSBLUR_PARAM CAnmRadialBlur::GetEndRadialBlur() const
{
    return m_EndRadialBlur;
}

void CAnmRadialBlur::SetTotalFrames(const int iFrame)
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

int CAnmRadialBlur::GetTotalFrames() const
{
    return m_iTotalFrames;
}

CAnmAction::ActionType CAnmRadialBlur::GetActionType() const
{
    return CAnmAction::TYPE_RADIAL_BLUR;
}

void CAnmRadialBlur::CopyDataFrom(CAnmAction *pAction)
{
    CAnmRadialBlur *pDataAction = dynamic_cast<CAnmRadialBlur*>(pAction);
    if (pDataAction)
    {
        SetStartRadialBlur(pDataAction->GetStartRadialBlur());
        SetEndRadialBlur(pDataAction->GetEndRadialBlur());
        SetTotalFrames(pDataAction->GetTotalFrames());
    }
}

bool CAnmRadialBlur::Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager)
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
                // Set RadialBlur
                if (dT < dwTotalTime)
                {
                    float u = float(dT) / dwTotalTime;
                    A3DPOST_EFFECT_RADIUSBLUR_PARAM radialBlur;
                    radialBlur.fBlurCenterX = Lerp(m_StartRadialBlur.fBlurCenterX, m_EndRadialBlur.fBlurCenterX, u);
                    radialBlur.fBlurCenterY = Lerp(m_StartRadialBlur.fBlurCenterY, m_EndRadialBlur.fBlurCenterY, u);
                    radialBlur.fBlurLength = Lerp(m_StartRadialBlur.fBlurLength, m_EndRadialBlur.fBlurLength, u);
                    radialBlur.fInFocusRadius = Lerp(m_StartRadialBlur.fInFocusRadius, m_EndRadialBlur.fInFocusRadius, u);
                    radialBlur.fOutFocusRadius = Lerp(m_StartRadialBlur.fOutFocusRadius, m_EndRadialBlur.fOutFocusRadius, u);
                    g_Animator.EnablePostEffect(A3DPOST_EFFECT_RadialBlur);
                    g_Animator.SetPostEffectRadialBlurParam(radialBlur);
                }
                else
                {
                    g_Animator.EnablePostEffect(A3DPOST_EFFECT_RadialBlur);
                    g_Animator.SetPostEffectRadialBlurParam(m_EndRadialBlur);
                }
            }
        }
    }

    if (dT >= dwTotalTime)
    {
        g_Animator.DisablePostEffect(A3DPOST_EFFECT_RadialBlur);
        m_bDead = true;
    }
    return IsDead();
}

DWORD CAnmRadialBlur::GetTotalTime() const
{
    return TIME_PER_FRAME * m_iTotalFrames;
}

CAnmRadialBlur::~CAnmRadialBlur()
{
}
