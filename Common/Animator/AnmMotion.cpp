#include "stdafx.h"
#include "Animator/AnmMotion.h"

CAnmMotion::CAnmMotion(const unsigned int uiID)
    : CAnmAction(uiID)
{
    m_iStartMotionFrame = 0;
    m_iBlendFrames = 4;
    m_iTotalFrames = 1;
    m_eMotionType = MT_ONCE;
    m_sActionName = _AL("");
    m_fSpeed = 1.0f;
    m_bShowGFX = true;
    m_bStartAction = false;
}

void CAnmMotion::SetBlendFrames(const int iFrame)
{
    if (iFrame >= 0)
    {
        m_iBlendFrames = iFrame;
    }
    else
    {
        m_iBlendFrames = 0;
    }
}

int CAnmMotion::GetBlendFrames() const
{
    return m_iBlendFrames;
}

void CAnmMotion::SetStartMotionFrame(const int iFrame)
{
    if (iFrame >= 0)
    {
        m_iStartMotionFrame = iFrame;
    }
    else
    {
        m_iStartMotionFrame = 0;
    }
}

int CAnmMotion::GetStartMotionFrame() const
{
    return m_iStartMotionFrame;
}

void CAnmMotion::SetTotalFrames(const int iFrame)
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

int CAnmMotion::GetTotalFrames() const
{
    return m_iTotalFrames;
}

void CAnmMotion::Reset()
{
    CAnmAction::Reset();
    m_bStartAction = false;
}

void CAnmMotion::SetMotionType(const MotionType &mt)
{
    m_eMotionType = mt;
}

CAnmMotion::MotionType CAnmMotion::GetMotionType() const
{
    return m_eMotionType;
}

void CAnmMotion::SetActionName(const ACString &name)
{
    m_sActionName = name;
}

ACString CAnmMotion::GetActionName() const
{
    return m_sActionName;
}

void CAnmMotion::SetActionSpeed(const float speed)
{
    m_fSpeed = speed;
}

float CAnmMotion::GetActionSpeed() const
{
    return m_fSpeed;
}

void CAnmMotion::SetShowGFX(const bool b)
{
    m_bShowGFX = b;
}

bool CAnmMotion::IsShowGFX() const
{
    return m_bShowGFX;
}

void CAnmMotion::PlayAction(CAnmObject *pObject)
{
    if (pObject->GetObjectType() == CAnmObject::TYPE_NPC)
    {
        CAnmNPC *pNPC = dynamic_cast<CAnmNPC*>(pObject);
        pNPC->SetActionSpeed(m_fSpeed);
        pNPC->PlayAction(m_sActionName, m_iBlendFrames * TIME_PER_FRAME, m_bShowGFX);
    }
    else if (pObject->GetObjectType() == CAnmObject::TYPE_GFX)
    {
        CAnmGFX *pGFX = dynamic_cast<CAnmGFX*>(pObject);
        pGFX->SetActionSpeed(m_fSpeed);
        pGFX->PlayAction(m_sActionName);
    }
    else
    {
        pObject->PlayAction(m_sActionName);
    }
}

CAnmAction::ActionType CAnmMotion::GetActionType() const
{
    return CAnmAction::TYPE_MOTION;
}

void CAnmMotion::CopyDataFrom(CAnmAction *pAction)
{
    CAnmMotion *pDataAction = dynamic_cast<CAnmMotion*>(pAction);
    if (pDataAction)
    {
        SetBlendFrames(pDataAction->GetBlendFrames());
        SetStartMotionFrame(pDataAction->GetStartMotionFrame());
        SetMotionType(pDataAction->GetMotionType());
        SetActionName(pDataAction->GetActionName());
        SetShowGFX(pDataAction->IsShowGFX());
        SetActionSpeed(pDataAction->GetActionSpeed());
        SetTotalFrames(pDataAction->GetTotalFrames());
    }
}

bool CAnmMotion::Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager)
{
    if (IsDead())
    {
        return false;
    }

    DWORD dT = dwNowTime - m_dwStartTime;
    DWORD dwTotalTime = GetTotalTime();
    CAnmObject *pObject = pObjectManager->GetObject(m_uiObjectID);
    if (pObject)
    {
        if (dwNowTime >= m_dwStartTime)
        {
            if (!m_bStartAction)
            {
                pObject->SetVisible(true);
                pObject->StopAction();
                PlayAction(pObject);
                if (dT > dwTotalTime)
                {
                    pObject->Tick(dwTotalTime + m_iStartMotionFrame * TIME_PER_FRAME);
                }
                else
                {
                    pObject->Tick(dT + m_iStartMotionFrame * TIME_PER_FRAME);
                }
                m_bStartAction = true;
            }

            if (dT < dwTotalTime)
            {
                switch (m_eMotionType)
                {
                    case MT_ONCE:
                        break;

                    case MT_LOOP:
                        if (!pObject->IsInAction())
                        {
                            PlayAction(pObject);
                            pObject->Tick(m_iStartMotionFrame * TIME_PER_FRAME);
                        }
                        break;

                    case MT_ONE_FRAME:
                        pObject->StopAction();
                        PlayAction(pObject);
                        pObject->Tick(m_iStartMotionFrame * TIME_PER_FRAME);
                        pObject->StopAction();
                        break;
                        
                    default:
                        break;
                }
            }
            else
            {
                pObject->StopAction();
            }
        }
    }

    if (dT >= dwTotalTime)
    {
        m_bDead = true;
    }
    return IsDead();
}

DWORD CAnmMotion::GetTotalTime() const
{
    return TIME_PER_FRAME * m_iTotalFrames;
}

CAnmMotion::~CAnmMotion()
{
}

