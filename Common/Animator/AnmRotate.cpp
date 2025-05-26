#include "stdafx.h"
#include "Animator/Animator.h"
#include "Animator/AnmRotate.h"

CAnmRotate::CAnmRotate(const unsigned int uiID)
    : CAnmAction(uiID)
{
    m_qStartRotate = A3DQUATERNION(1.0f, 0.0f, 0.0f, 0.0f);
    m_qA = A3DQUATERNION(1.0f, 0.0f, 0.0f, 0.0f);
    m_qB = A3DQUATERNION(1.0f, 0.0f, 0.0f, 0.0f);
    m_qEndRotate = A3DQUATERNION(1.0f, 0.0f, 0.0f, 0.0f);
    m_bUseSquad = false;
    m_iTotalFrames = 1;
}

void CAnmRotate::SetStartRotate(const A3DQUATERNION &q)
{
    m_qStartRotate = q;
}

A3DQUATERNION CAnmRotate::GetStartRotate() const
{
    return m_qStartRotate;
}

void CAnmRotate::SetA(const A3DQUATERNION &q)
{
    m_qA = q;
}

A3DQUATERNION CAnmRotate::GetA() const
{
    return m_qA;
}

void CAnmRotate::SetB(const A3DQUATERNION &q)
{
    m_qB = q;
}

A3DQUATERNION CAnmRotate::GetB() const
{
    return m_qB;
}

void CAnmRotate::SetEndRotate(const A3DQUATERNION &q)
{
    m_qEndRotate = q;
}

A3DQUATERNION CAnmRotate::GetEndRotate() const
{
    return m_qEndRotate;
}

void CAnmRotate::SetUseSquad(const bool b)
{
    m_bUseSquad = b;
}

bool CAnmRotate::IsUsingSquad() const
{
    return m_bUseSquad;
}

void CAnmRotate::SetTotalFrames(const int iFrame)
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

int CAnmRotate::GetTotalFrames() const
{
    return m_iTotalFrames;
}

CAnmAction::ActionType CAnmRotate::GetActionType() const
{
    return CAnmAction::TYPE_ROTATE;
}

void CAnmRotate::CopyDataFrom(CAnmAction *pAction)
{
    CAnmRotate *pDataAction = dynamic_cast<CAnmRotate*>(pAction);
    if (pDataAction)
    {
        SetStartRotate(pDataAction->GetStartRotate());
        SetA(pDataAction->GetA());
        SetB(pDataAction->GetB());
        SetEndRotate(pDataAction->GetEndRotate());
        SetTotalFrames(pDataAction->GetTotalFrames());
    }
}

bool CAnmRotate::Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager)
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
            // Set Rotate
            A3DVECTOR3 vDir(0.0f, 0.0f, -1.0f);
            A3DVECTOR3 vUp(0.0f, 1.0f, 0.0f);
            A3DQUATERNION qOri = m_qEndRotate;
            if (dT < dwTotalTime)
            {
                if (m_bUseSquad)
                {
                    qOri = CAnmRotate::Squad(m_qStartRotate, m_qA, m_qB, m_qEndRotate, float(dT) / dwTotalTime, true);
                }
                else
                {
                    qOri = CAnmRotate::Slerp(m_qStartRotate, m_qEndRotate, float(dT) / dwTotalTime, true);
                }
            }
            else
            {
                qOri = m_qEndRotate;
            }
            vDir = qOri ^ vDir;
            vUp = qOri ^ vUp;
            pObject->SetDirAndUp(vDir, vUp);
        }
    }

    if (dT >= dwTotalTime)
    {
        m_bDead = true;
    }
    return IsDead();
}

DWORD CAnmRotate::GetTotalTime() const
{
    return TIME_PER_FRAME * m_iTotalFrames;
}

CAnmRotate::~CAnmRotate()
{
}

A3DQUATERNION CAnmRotate::Slerp(const A3DQUATERNION &pQ,
                                const A3DQUATERNION &qQ,
                                const float u,
                                const bool shortestPath)
{
    float fCos = DotProduct(pQ, qQ);
    A3DQUATERNION tempQ;
    if (shortestPath && fCos < 0.0f)
    {
        fCos = -fCos;
        tempQ = A3DQUATERNION(-qQ.w, -qQ.x, -qQ.y, -qQ.z);
    }
    else
    {
        tempQ = qQ;
    }

    if (abs(fCos) < 1.0f)
    {
        float fSin = sqrt(1.0f - fCos * fCos);
        float fAngle = atan2(fSin, fCos);
        float fInvSin = 1.0f / fSin;
        float fCoeff0 = sin((1.0f - u) * fAngle) * fInvSin;
        float fCoeff1 = sin(u * fAngle) * fInvSin;
        return pQ * fCoeff0 + tempQ * fCoeff1;
    }
    else
    {
        A3DQUATERNION resQ = pQ + (tempQ - pQ) * u;
        resQ.Normalize();
        return resQ;
    }
}

A3DQUATERNION CAnmRotate::Squad(const A3DQUATERNION &pQ,
                                const A3DQUATERNION &aQ,
                                const A3DQUATERNION &bQ,
                                const A3DQUATERNION &qQ,
                                const float u,
                                const bool shortestPath)
{
    float fSlerpU = 2.0f * u * (1.0f - u);
    A3DQUATERNION kSlerpP = Slerp(pQ , qQ, u, shortestPath);
    A3DQUATERNION kSlerpQ = Slerp(aQ , bQ, u);
    return Slerp(kSlerpP , kSlerpQ, fSlerpU);
}