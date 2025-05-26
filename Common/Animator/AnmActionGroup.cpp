#include "stdafx.h"
#include "Animator/AnmActionGroup.h"

CAnmActionGroup::CAnmActionGroup(const unsigned int uiID)
{
    m_uiGroupID = uiID;
}

unsigned int CAnmActionGroup::GetGroupID() const
{
    return m_uiGroupID;
}

void CAnmActionGroup::SetGroupName(const ACString name)
{
    m_sGroupName = name;
}

ACString CAnmActionGroup::GetGroupName() const
{
    return m_sGroupName;
}

void CAnmActionGroup::CreateChannel(const unsigned int uiID, const ActionChannelType type)
{
    switch (type)
    {
        case TYPE_CAMERA:
        {
            break;
        }

        case TYPE_PLAYER:
        {
            break;
        }

        case TYPE_NPC:
        {
            CAnmActionChannel *pChannel = new CAnmActionChannel(uiID);
            m_mChannelMap[uiID] = pChannel;
        }

        default:
            break;
    }
}

unsigned int CAnmActionGroup::CreateChannel(const ActionChannelType type)
{
    unsigned int uiID;
    for (unsigned int i=2; i<65535; ++i)
    {
        std::map<unsigned int, CAnmActionChannel*>::iterator it = m_mChannelMap.find(i);
        if (it == m_mChannelMap.end())
        {
            uiID = i;
            break;
        }
    }
    CreateChannel(uiID, type);
    return uiID;
}

void CAnmActionGroup::AddChannel(CAnmActionChannel *pChannel)
{
    unsigned int uiID;
    for (unsigned int i=2; i<65535; ++i)
    {
        std::map<unsigned int, CAnmActionChannel*>::iterator it = m_mChannelMap.find(i);
        if (it == m_mChannelMap.end())
        {
            uiID = i;
            pChannel->SetChannelID(uiID);
            m_mChannelMap[uiID] = pChannel;
            break;
        }
    }
}

CAnmActionChannel* CAnmActionGroup::RemoveChannel(const unsigned int uiID)
{
    std::map<unsigned int, CAnmActionChannel*>::iterator it = m_mChannelMap.find(uiID);
    if (it != m_mChannelMap.end())
    {
        CAnmActionChannel *pChannel = it->second;
        m_mChannelMap.erase(it);
        return pChannel;
    }
    return 0;
}

int CAnmActionGroup::GetActionsCount(const DWORD dwStartTime, const DWORD dwEndTime)
{
    int count = 0;
    std::map<unsigned int, CAnmActionChannel*>::iterator it;
    for (it=m_mChannelMap.begin(); it!=m_mChannelMap.end(); ++it)
    {
        count += it->second->GetActionsCount(dwStartTime, dwEndTime);
    }
    return count;
}

void CAnmActionGroup::MoveActions(const DWORD dwStartTime, const DWORD dwEndTime, const DWORD dwOffset, const bool left)
{
    if (left && dwStartTime < dwOffset)
    {
        return;
    }
    std::map<unsigned int, CAnmActionChannel*>::iterator it;
    for (it=m_mChannelMap.begin(); it!=m_mChannelMap.end(); ++it)
    {
        it->second->MoveActions(dwStartTime, dwEndTime, dwOffset, left);
    }
}

void CAnmActionGroup::MoveWorldOffset(const A3DVECTOR3 &v)
{
    std::map<unsigned int, CAnmActionChannel*>::iterator it;
    for (it=m_mChannelMap.begin(); it!=m_mChannelMap.end(); ++it)
    {
        it->second->MoveWorldOffset(v);
    }
}

void CAnmActionGroup::DeleteChannel(const unsigned int uiID)
{
    std::map<unsigned int, CAnmActionChannel*>::iterator it = m_mChannelMap.find(uiID);
    if (it != m_mChannelMap.end())
    {
        delete it->second;
        m_mChannelMap.erase(it);
    }
}

CAnmActionChannel* CAnmActionGroup::GetChannel(const unsigned int uiID)
{
    std::map<unsigned int, CAnmActionChannel*>::iterator it = m_mChannelMap.find(uiID);
    if (it != m_mChannelMap.end())
    {
        return it->second;
    }
    return 0;
}

void CAnmActionGroup::GetChannelIDList(std::vector<unsigned int> &vList)
{
    vList.clear();
    std::map<unsigned int, CAnmActionChannel*>::iterator it;
    for (it=m_mChannelMap.begin(); it!=m_mChannelMap.end(); ++it)
    {
        vList.push_back(it->first);
    }
}

int CAnmActionGroup::GetChannelAmount() const
{
    return m_mChannelMap.size();
}

void CAnmActionGroup::SwapChannels(const unsigned int uiID1, const unsigned int uiID2)
{
    if (uiID1 != uiID2)
    {
        CAnmActionChannel *pChannel1 = GetChannel(uiID1);
        CAnmActionChannel *pChannel2 = GetChannel(uiID2);
        if (pChannel1 && pChannel2)
        {
            pChannel1->SetChannelID(uiID2);
            pChannel2->SetChannelID(uiID1);
            m_mChannelMap[uiID1] = pChannel2;
            m_mChannelMap[uiID2] = pChannel1;
        }
    }
}

void CAnmActionGroup::Reset()
{
    std::map<unsigned int, CAnmActionChannel*>::iterator it;
    for (it=m_mChannelMap.begin(); it!=m_mChannelMap.end(); ++it)
    {
        it->second->Reset();
    }
}

bool CAnmActionGroup::Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager)
{
    bool flag = false;
    std::map<unsigned int, CAnmActionChannel*>::iterator it;
    for (it=m_mChannelMap.begin(); it!=m_mChannelMap.end(); ++it)
    {
        if (it->second->Tick(dwNowTime, pObjectManager))
        {
            flag = true;
        }
    }
    return flag;
}

CAnmActionGroup::~CAnmActionGroup()
{
    std::map<unsigned int, CAnmActionChannel*>::iterator it;
    for (it=m_mChannelMap.begin(); it!=m_mChannelMap.end(); ++it)
    {
        delete it->second;
    }
    m_mChannelMap.clear();
}
