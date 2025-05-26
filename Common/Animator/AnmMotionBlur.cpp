#include "stdafx.h"
#include "Animator/Animator.h"
#include "Animator/AnmMotionBlur.h"

CAnmMotionBlur::CAnmMotionBlur(const unsigned int uiID)
    : CAnmAction(uiID)
{
    m_iTotalFrames = 1;
}

void CAnmMotionBlur::SetStartMotionBlur(const A3DPOST_EFFECT_MOTIONBLUR_PARAM &motionBlur)
{
    m_StartMotionBlur = motionBlur;
}

A3DPOST_EFFECT_MOTIONBLUR_PARAM CAnmMotionBlur::GetStartMotionBlur() const
{
    return m_StartMotionBlur;
}

void CAnmMotionBlur::SetEndMotionBlur(const A3DPOST_EFFECT_MOTIONBLUR_PARAM &motionBlur)
{
    m_EndMotionBlur = motionBlur;
}

A3DPOST_EFFECT_MOTIONBLUR_PARAM CAnmMotionBlur::GetEndMotionBlur() const
{
    return m_EndMotionBlur;
}

void CAnmMotionBlur::SetTotalFrames(const int iFrame)
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

int CAnmMotionBlur::GetTotalFrames() const
{
    return m_iTotalFrames;
}

CAnmAction::ActionType CAnmMotionBlur::GetActionType() const
{
    return CAnmAction::TYPE_MOTION_BLUR;
}

void CAnmMotionBlur::CopyDataFrom(CAnmAction *pAction)
{
    CAnmMotionBlur *pDataAction = dynamic_cast<CAnmMotionBlur*>(pAction);
    if (pDataAction)
    {
        SetStartMotionBlur(pDataAction->GetStartMotionBlur());
        SetEndMotionBlur(pDataAction->GetEndMotionBlur());
        SetTotalFrames(pDataAction->GetTotalFrames());
    }
}

bool CAnmMotionBlur::Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager)
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
                // Set MotionBlur
                if (dT < dwTotalTime)
                {
                    float u = float(dT) / dwTotalTime;
                    A3DPOST_EFFECT_MOTIONBLUR_PARAM motionBlur;
                    motionBlur.fBlurMax = Lerp(m_StartMotionBlur.fBlurMax, m_EndMotionBlur.fBlurMax, u);
                    motionBlur.fBlurScale = Lerp(m_StartMotionBlur.fBlurScale, m_EndMotionBlur.fBlurScale, u);
                    motionBlur.fBlurScalePosition = Lerp(m_StartMotionBlur.fBlurScalePosition, m_EndMotionBlur.fBlurScalePosition, u);
                    motionBlur.fBlurScaleRotation = Lerp(m_StartMotionBlur.fBlurScaleRotation, m_EndMotionBlur.fBlurScaleRotation, u);
                    motionBlur.fInFocusDistance = Lerp(m_StartMotionBlur.fInFocusDistance, m_EndMotionBlur.fInFocusDistance, u);
                    motionBlur.fOutFocusDistance = Lerp(m_StartMotionBlur.fOutFocusDistance, m_EndMotionBlur.fOutFocusDistance, u);
                    g_Animator.EnablePostEffect(A3DPOST_EFFECT_MotionBlur);
                    g_Animator.SetPostEffectMotionBlurParam(motionBlur);
                }
                else
                {
                    g_Animator.EnablePostEffect(A3DPOST_EFFECT_MotionBlur);
                    g_Animator.SetPostEffectMotionBlurParam(m_EndMotionBlur);
                }
            }
        }
    }

    if (dT >= dwTotalTime)
    {
        g_Animator.DisablePostEffect(A3DPOST_EFFECT_MotionBlur);
        m_bDead = true;
    }
    return IsDead();
}

DWORD CAnmMotionBlur::GetTotalTime() const
{
    return TIME_PER_FRAME * m_iTotalFrames;
}

CAnmMotionBlur::~CAnmMotionBlur()
{
}
