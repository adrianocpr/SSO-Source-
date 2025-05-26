#include "stdafx.h"
#include "Animator/Animator.h"
#include "Animator/AnmDOF.h"

CAnmDOF::CAnmDOF(const unsigned int uiID)
    : CAnmAction(uiID)
{
    m_iTotalFrames = 1;
}

void CAnmDOF::SetStartDOF(const A3DPOST_EFFECT_DOF_PARAM &DOF)
{
    m_StartDOF = DOF;
}

A3DPOST_EFFECT_DOF_PARAM CAnmDOF::GetStartDOF() const
{
    return m_StartDOF;
}

void CAnmDOF::SetEndDOF(const A3DPOST_EFFECT_DOF_PARAM &DOF)
{
    m_EndDOF = DOF;
}

A3DPOST_EFFECT_DOF_PARAM CAnmDOF::GetEndDOF() const
{
    return m_EndDOF;
}

void CAnmDOF::SetTotalFrames(const int iFrame)
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

int CAnmDOF::GetTotalFrames() const
{
    return m_iTotalFrames;
}

CAnmAction::ActionType CAnmDOF::GetActionType() const
{
    return CAnmAction::TYPE_DOF;
}

void CAnmDOF::CopyDataFrom(CAnmAction *pAction)
{
    CAnmDOF *pDataAction = dynamic_cast<CAnmDOF*>(pAction);
    if (pDataAction)
    {
        SetStartDOF(pDataAction->GetStartDOF());
        SetEndDOF(pDataAction->GetEndDOF());
        SetTotalFrames(pDataAction->GetTotalFrames());
    }
}

bool CAnmDOF::Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager)
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
                // Set DOF
                if (dT < dwTotalTime)
                {
                    float u = float(dT) / dwTotalTime;
                    A3DPOST_EFFECT_DOF_PARAM DOF;
                    DOF.fNearBlur = Lerp(m_StartDOF.fNearBlur, m_EndDOF.fNearBlur, u);
                    DOF.fNearFocus = Lerp(m_StartDOF.fNearFocus, m_EndDOF.fNearFocus, u);
                    DOF.fFarFocus = Lerp(m_StartDOF.fFarFocus, m_EndDOF.fFarFocus, u);
                    DOF.fFarBlur = Lerp(m_StartDOF.fFarBlur, m_EndDOF.fFarBlur, u);
                    DOF.fClampBlurFar = Lerp(m_StartDOF.fClampBlurFar, m_EndDOF.fClampBlurFar, u);
                    g_Animator.EnablePostEffect(A3DPOST_EFFECT_Dof);
                    g_Animator.SetPostEffectDOFParam(DOF);
                }
                else
                {
                    g_Animator.EnablePostEffect(A3DPOST_EFFECT_Dof);
                    g_Animator.SetPostEffectDOFParam(m_EndDOF);
                }
            }
        }
    }

    if (dT >= dwTotalTime)
    {
        g_Animator.DisablePostEffect(A3DPOST_EFFECT_Dof);
        m_bDead = true;
    }
    return IsDead();
}

DWORD CAnmDOF::GetTotalTime() const
{
    return TIME_PER_FRAME * m_iTotalFrames;
}

CAnmDOF::~CAnmDOF()
{
}
