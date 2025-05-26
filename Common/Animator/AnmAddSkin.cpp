#include "stdafx.h"
#include "Animator/Animator.h"
#include "Animator/AnmAddSkin.h"

CAnmAddSkin::CAnmAddSkin(const unsigned int uiID)
    : CAnmAction(uiID)
{
    m_sSkinPath = _AL("");
    m_iSkinIndex = -1;
    m_iTotalFrames = 1;
}

void CAnmAddSkin::SetSkinPath(const ACString &path)
{
    m_sSkinPath = path;
}

ACString CAnmAddSkin::GetSkinPath() const
{
    return m_sSkinPath;
}

void CAnmAddSkin::SetTotalFrames(const int iFrame)
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

int CAnmAddSkin::GetTotalFrames() const
{
    return m_iTotalFrames;
}

CAnmAction::ActionType CAnmAddSkin::GetActionType() const
{
    return CAnmAction::TYPE_ADD_SKIN;
}

void CAnmAddSkin::CopyDataFrom(CAnmAction *pAction)
{
    CAnmAddSkin *pDataAction = dynamic_cast<CAnmAddSkin*>(pAction);
    if (pDataAction)
    {
        SetSkinPath(pDataAction->GetSkinPath());
        SetTotalFrames(pDataAction->GetTotalFrames());
        m_iSkinIndex = -1;
    }
}

bool CAnmAddSkin::Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager)
{
    if (IsDead())
    {
        return false;
    }
    DWORD dT = dwNowTime - m_dwStartTime;
    DWORD dwTotalTime = GetTotalTime();
    CAnmObject *pObject = g_Animator.GetObjectManager()->GetObject(m_uiObjectID);
    if (pObject &&
        pObject->GetObjectType() != CAnmObject::TYPE_CAMERA &&
        pObject->GetObjectType() != CAnmObject::TYPE_GFX)
    {
        CAnmNPC *pNPC = dynamic_cast<CAnmNPC*>(pObject);
        if (pNPC)
        {
            if (dwNowTime >= m_dwStartTime)
            {
                // Set FOV
                if (dT < dwTotalTime)
                {
                    if (m_iSkinIndex == -1)
                    {
                        m_iSkinIndex = pNPC->AddSkin(m_sSkinPath);
                    }
                }
                else
                {
                    if (m_iSkinIndex != -1)
                    {
                        pNPC->RemoveSkin(m_iSkinIndex);
                        m_iSkinIndex = -1;
                    }
                }
            }
        }
    }

    if (dT >= dwTotalTime)
    {
        m_bDead = true;
    }
    return IsDead();
}

DWORD CAnmAddSkin::GetTotalTime() const
{
    return TIME_PER_FRAME * m_iTotalFrames;
}

void CAnmAddSkin::Reset()
{
    CAnmAction::Reset();
    CAnmObject *pObject = g_Animator.GetObjectManager()->GetObject(m_uiObjectID);
    if (pObject &&
        pObject->GetObjectType() != CAnmObject::TYPE_CAMERA &&
        pObject->GetObjectType() != CAnmObject::TYPE_GFX)
    {
        CAnmNPC *pNPC = dynamic_cast<CAnmNPC*>(pObject);
        if (pNPC)
        {
            if (m_iSkinIndex != -1)
            {
                pNPC->RemoveSkin(m_iSkinIndex);
                m_iSkinIndex = -1;
            }
        }
    }
}

CAnmAddSkin::~CAnmAddSkin()
{
    Reset();
}
