#include "stdafx.h"
#include "Animator/Animator.h"
#include "Animator/AnmWarp.h"

CAnmWarp::CAnmWarp(const unsigned int uiID)
    : CAnmAction(uiID)
{
    m_fStartScale = 0.01f;
    m_fEndScale = 0.01f;
    m_fStartSpeed = 0.5f;
    m_fEndSpeed = 0.5f;
    m_bEnableMask = false;
    m_sMask = _AL("");
    m_iTotalFrames = 1;
}

void CAnmWarp::SetStartScale(const float f)
{
    m_fStartScale = f;
}

float CAnmWarp::GetStartScale() const
{
    return m_fStartScale;
}

void CAnmWarp::SetEndScale(const float f)
{
    m_fEndScale = f;
}

float CAnmWarp::GetEndScale() const
{
    return m_fEndScale;
}

void CAnmWarp::SetStartSpeed(const float f)
{
    m_fStartSpeed = f;
}

float CAnmWarp::GetStartSpeed() const
{
    return m_fStartSpeed;
}

void CAnmWarp::SetEndSpeed(const float f)
{
    m_fEndSpeed = f;
}

float CAnmWarp::GetEndSpeed() const
{
    return m_fEndSpeed;
}

void CAnmWarp::SetEnableMask(const bool b)
{
    m_bEnableMask = b;
}

bool CAnmWarp::GetEnableMask() const
{
    return m_bEnableMask;
}

void CAnmWarp::SetMaskPath(const ACString &path)
{
    m_sMask = path;
}

ACString CAnmWarp::GetMaskPath() const
{
    return m_sMask;
}

void CAnmWarp::SetTotalFrames(const int iFrame)
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

int CAnmWarp::GetTotalFrames() const
{
    return m_iTotalFrames;
}

CAnmAction::ActionType CAnmWarp::GetActionType() const
{
    return CAnmAction::TYPE_WARP;
}

void CAnmWarp::CopyDataFrom(CAnmAction *pAction)
{
    CAnmWarp *pDataAction = dynamic_cast<CAnmWarp*>(pAction);
    if (pDataAction)
    {
        SetStartScale(pDataAction->GetStartScale());
        SetEndScale(pDataAction->GetEndScale());
        SetStartSpeed(pDataAction->GetStartSpeed());
        SetEndSpeed(pDataAction->GetEndSpeed());
        SetEnableMask(pDataAction->GetEnableMask());
        SetMaskPath(pDataAction->GetMaskPath());
        SetTotalFrames(pDataAction->GetTotalFrames());
    }
}

bool CAnmWarp::Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager)
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
                // Set Warp
                if (dT < dwTotalTime)
                {
                    float u = float(dT) / dwTotalTime;
                    A3DPOST_EFFECT_WARP_PARAM warp;
                    warp.fScale = Lerp(m_fStartScale, m_fEndScale, u);
                    warp.fSpeed = Lerp(m_fStartSpeed, m_fEndSpeed, u);
                    warp.bEnableMask = m_bEnableMask;
                    warp.strMaskTextureName = WC2AS(m_sMask);
                    g_Animator.EnablePostEffect(A3DPOST_EFFECT_Warp);
                    g_Animator.SetPostEffectWarpParam(warp);
                }
                else
                {
                    g_Animator.EnablePostEffect(A3DPOST_EFFECT_Warp);
                    g_Animator.SetPostEffectWarpParam(m_EndWarp);
                }
            }
        }
    }

    if (dT >= dwTotalTime)
    {
        g_Animator.DisablePostEffect(A3DPOST_EFFECT_Warp);
        m_bDead = true;
    }
    return IsDead();
}

DWORD CAnmWarp::GetTotalTime() const
{
    return TIME_PER_FRAME * m_iTotalFrames;
}

CAnmWarp::~CAnmWarp()
{
}
