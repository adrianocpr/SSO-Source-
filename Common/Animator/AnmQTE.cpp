#include "stdafx.h"
#include "Animator/Animator.h"
#include "Animator/AnmQTE.h"

CAnmQTE::CAnmQTE(const unsigned int uiID)
    : CAnmAction(uiID)
{
    m_bFired = false;
    m_uiQTEID = 0;
    m_fSpeed = 1.0f;
    m_iTotalFrames = 1;
}

void CAnmQTE::SetTotalFrames(const int iFrame)
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

int CAnmQTE::GetTotalFrames() const
{
    return m_iTotalFrames;
}

void CAnmQTE::SetQTEID(const unsigned int uiQTEID)
{
    m_uiQTEID = uiQTEID;
}

unsigned int CAnmQTE::GetQTEID() const
{
    return m_uiQTEID;
}

void CAnmQTE::SetSpeed(const float speed)
{
    m_fSpeed = speed;
}

float CAnmQTE::GetSpeed() const
{
    return m_fSpeed;
}

CAnmAction::ActionType CAnmQTE::GetActionType() const
{
    return CAnmAction::TYPE_QTE;
}

void CAnmQTE::CopyDataFrom(CAnmAction *pAction)
{
    CAnmQTE *pDataAction = dynamic_cast<CAnmQTE*>(pAction);
    if (pDataAction)
    {
        SetSpeed(pDataAction->GetSpeed());
        SetTotalFrames(pDataAction->GetTotalFrames());
    }
}

bool CAnmQTE::Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager)
{
    if (IsDead())
    {
        return false;
    }

    DWORD dT = dwNowTime - m_dwStartTime;
    DWORD dwTotalTime = GetTotalTime();

    if (dwNowTime >= m_dwStartTime)
    {
        if (dT < dwTotalTime)
        {
            if (!m_bFired)
            {
                m_bFired = true;
                g_Animator.StartQTE(m_uiQTEID, m_fSpeed);
            }
        }
        else
        {
            if (m_bFired)
            {
                g_Animator.EndQTE(m_uiQTEID);
            }
        }
    }

    if (dT >= dwTotalTime)
    {
        m_bDead = true;
    }
    return IsDead();
}

DWORD CAnmQTE::GetTotalTime() const
{
    return TIME_PER_FRAME * m_iTotalFrames;
}

void CAnmQTE::Reset()
{
    CAnmAction::Reset();
    m_bFired = false;
}

CAnmQTE::~CAnmQTE()
{
}
