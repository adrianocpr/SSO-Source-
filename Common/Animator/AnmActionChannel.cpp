#include "stdafx.h"
#include "Animator/AnmActionChannel.h"

CAnmActionChannel::CAnmActionChannel(const unsigned int uiID)
{
    m_uiChannelID = uiID;
    m_uiObjectID = -1;
}

void CAnmActionChannel::SetChannelID(const unsigned int uiID)
{
    m_uiChannelID = uiID;
}

unsigned int CAnmActionChannel::GetChannelID() const
{
    return m_uiChannelID;
}

void CAnmActionChannel::BindObjectID(const unsigned int uiID)
{
    m_uiObjectID = uiID;
    std::map<unsigned int, CAnmAction*>::iterator it;
    for (it=m_mActionMap.begin(); it!=m_mActionMap.end(); ++it)
    {
        it->second->BindObjectID(uiID);
    }
}

unsigned int CAnmActionChannel::GetObjectID() const
{
    return m_uiObjectID;
}

void CAnmActionChannel::SetChannelName(const ACString name)
{
    m_sChannelName = name;
}

ACString CAnmActionChannel::GetChannelName() const
{
    return m_sChannelName;
}

void CAnmActionChannel::CreateAction(const unsigned int uiID, const CAnmAction::ActionType type)
{
    CAnmAction *pAction = 0;
    switch (type)
    {
        case CAnmAction::TYPE_MOVE:
        {
            pAction = new CAnmMove(uiID);
            break;
        }

        case CAnmAction::TYPE_ROTATE:
        {
            pAction = new CAnmRotate(uiID);
            break;
        }

        case CAnmAction::TYPE_SCALE:
        {
            pAction = new CAnmScale(uiID);
            break;
        }

        case CAnmAction::TYPE_FOV:
        {
            pAction = new CAnmFOV(uiID);
            break;
        }

        case CAnmAction::TYPE_JUMP:
        {
            pAction = new CAnmJump(uiID);
            break;
        }

        case CAnmAction::TYPE_BEZIER_MOVE:
        {
            pAction = new CAnmBezierMove(uiID);
            break;
        }

        case CAnmAction::TYPE_MOTION:
        {
            pAction = new CAnmMotion(uiID);
            break;
        }

        case CAnmAction::TYPE_DISPLAY_HIDE:
        {
            pAction = new CAnmDisplayHide(uiID);
            break;
        }

        case CAnmAction::TYPE_DIALOGUE:
        {
            pAction = new CAnmDialogue(uiID);
            break;
        }

        case CAnmAction::TYPE_SOUND:
        {
            pAction = new CAnmSound(uiID);
            break;
        }

        case CAnmAction::TYPE_HOOK:
        {
            pAction = new CAnmHook(uiID);
            break;
        }

        case CAnmAction::TYPE_SPEED_CONTROL:
        {
            pAction = new CAnmSpeedControl(uiID);
            break;
        }

        case CAnmAction::TYPE_CAMERA_FILTER:
        {
            pAction = new CAnmCameraFilter(uiID);
            break;
        }

        case CAnmAction::TYPE_CAMERA_OSCILLATORY:
        {
            pAction = new CAnmCameraOscillatory(uiID);
            break;
        }

        case CAnmAction::TYPE_TRANSPARENT:
        {
            pAction = new CAnmTransparent(uiID);
            break;
        }

        case CAnmAction::TYPE_HIDE_WORLD_ACTION:
        {
            pAction = new CAnmHideWorldAction(uiID);
            break;
        }

        case CAnmAction::TYPE_BLOOM:
        {
            pAction = new CAnmBloom(uiID);
            break;
        }

        case CAnmAction::TYPE_DOF:
        {
            pAction = new CAnmDOF(uiID);
            break;
        }

        case CAnmAction::TYPE_RADIAL_BLUR:
        {
            pAction = new CAnmRadialBlur(uiID);
            break;
        }

        case CAnmAction::TYPE_MOTION_BLUR:
        {
            pAction = new CAnmMotionBlur(uiID);
            break;
        }

        case CAnmAction::TYPE_WARP:
        {
            pAction = new CAnmWarp(uiID);
            break;
        }

        case CAnmAction::TYPE_CC:
        {
            pAction = new CAnmCC(uiID);
            break;
        }

        case CAnmAction::TYPE_GOD_RAY:
        {
            pAction = new CAnmGodRay(uiID);
            break;
        }

        case CAnmAction::TYPE_ADD_SKIN:
        {
            pAction = new CAnmAddSkin(uiID);
            break;
        }

        case CAnmAction::TYPE_QTE:
        {
            pAction = new CAnmQTE(uiID);
            break;
        }

        default:
            break;
    }

    if (pAction)
    {
        m_mActionMap[uiID] = pAction;
    }
}

unsigned int CAnmActionChannel::CreateAction(const CAnmAction::ActionType type)
{
    unsigned int uiID;
    for (unsigned int i=1; i<16777215; ++i)
    {
        std::map<unsigned int, CAnmAction*>::iterator it = m_mActionMap.find(i);
        if (it == m_mActionMap.end())
        {
            uiID = i;
            break;
        }
    }
    CreateAction(uiID, type);
    return uiID;
}

int CAnmActionChannel::GetActionsCount(const DWORD dwStartTime, const DWORD dwEndTime)
{
    int count = 0;
    std::map<unsigned int, CAnmAction*>::iterator it;
    for (it=m_mActionMap.begin(); it!=m_mActionMap.end(); ++it)
    {
        DWORD actionTime = it->second->GetStartTime();
        if (dwStartTime <= actionTime && actionTime <= dwEndTime)
        {
            ++count;
        }
    }
    return count;
}

void CAnmActionChannel::MoveActions(const DWORD dwStartTime, const DWORD dwEndTime, const DWORD dwOffset, const bool left)
{
    if (left && dwStartTime < dwOffset)
    {
        return;
    }
    std::vector<unsigned int> deleteList;
    DWORD deleteStartTime = left ? (dwStartTime - dwOffset) : (dwStartTime + dwOffset);
    DWORD deleteEndTime = left ? (dwEndTime - dwOffset) : (dwEndTime + dwOffset);
    std::map<unsigned int, CAnmAction*>::iterator it;
    for (it=m_mActionMap.begin(); it!=m_mActionMap.end(); ++it)
    {
        DWORD actionTime = it->second->GetStartTime();
        if ((deleteStartTime <= actionTime && actionTime <= deleteEndTime) &&
            (actionTime < dwStartTime || dwEndTime < actionTime))
        {
            deleteList.push_back(it->first);
        }
        if (dwStartTime <= actionTime && actionTime <= dwEndTime)
        {
            if (left)
            {
                it->second->SetStartTime(actionTime - dwOffset);
            }
            else
            {
                it->second->SetStartTime(actionTime + dwOffset);
            }
        }
    }
    for (size_t i=0; i<deleteList.size(); ++i)
    {
        DeleteAction(deleteList[i]);
    }
}

void CAnmActionChannel::MoveWorldOffset(const A3DVECTOR3 &v)
{
    std::map<unsigned int, CAnmAction*>::iterator it;
    for (it=m_mActionMap.begin(); it!=m_mActionMap.end(); ++it)
    {
        it->second->MoveWorldOffset(v);
    }
}

void CAnmActionChannel::DeleteAction(const unsigned int uiID)
{
    std::map<unsigned int, CAnmAction*>::iterator it = m_mActionMap.find(uiID);
    if (it != m_mActionMap.end())
    {
        delete it->second;
        m_mActionMap.erase(it);
    }
}

CAnmAction* CAnmActionChannel::GetAction(const unsigned int uiID)
{
    std::map<unsigned int, CAnmAction*>::iterator it = m_mActionMap.find(uiID);
    if (it != m_mActionMap.end())
    {
        return it->second;
    }
    return 0;
}

void CAnmActionChannel::GetActionIDList(std::vector<unsigned int> &vList)
{
    vList.clear();
    std::map<unsigned int, CAnmAction*>::iterator it;
    for (it=m_mActionMap.begin(); it!=m_mActionMap.end(); ++it)
    {
        vList.push_back(it->first);
    }
}

int CAnmActionChannel::GetActionAmount() const
{
    return m_mActionMap.size();
}

unsigned int CAnmActionChannel::GetChannelType() const
{
    return 2;
}

void CAnmActionChannel::CopyDataFrom(CAnmActionChannel *pChannel)
{
    if (pChannel)
    {
        std::vector<unsigned int> vList;
        pChannel->GetActionIDList(vList);
        for (size_t i=0; i<vList.size(); ++i)
        {
            CAnmAction *pAction = pChannel->GetAction(vList[i]);
            if (pAction)
            {
                unsigned int uiID = CreateAction(pAction->GetActionType());
                CAnmAction *pMyAction = GetAction(uiID);
                if (pMyAction)
                {
                    pMyAction->CopyDataFrom(pAction);
                    pMyAction->SetStartTime(pAction->GetStartTime());
                }
            }
        }
        SetChannelName(pChannel->GetChannelName());
        BindObjectID(pChannel->GetObjectID());
    }
}

void CAnmActionChannel::Reset()
{
    std::map<unsigned int, CAnmAction*>::iterator it;
    for (it=m_mActionMap.begin(); it!=m_mActionMap.end(); ++it)
    {
        it->second->Reset();
    }
}

bool CAnmActionChannel::Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager)
{
    bool flag = false;
    std::map<unsigned int, CAnmAction*>::iterator it;
    for (it=m_mActionMap.begin(); it!=m_mActionMap.end(); ++it)
    {
        if (it->second->Tick(dwNowTime, pObjectManager))
        {
            flag = true;
        }
    }
    return flag;
}

CAnmActionChannel::~CAnmActionChannel()
{
    std::map<unsigned int, CAnmAction*>::iterator it;
    for (it=m_mActionMap.begin(); it!=m_mActionMap.end(); ++it)
    {
        delete it->second;
    }
    m_mActionMap.clear();
}
