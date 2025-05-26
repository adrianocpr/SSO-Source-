#include "stdafx.h"
#include "Animator/Animator.h"
#include "Animator/AnmActionManager.h"

CAnmActionManager::CAnmActionManager()
{
    /*
    CreateGroup(0);
    */
    m_ActiveActionTreeRoot.mpAction = 0;
    m_ActiveActionTreeRoot.mEndTime = 0;
    m_ActiveActionTreeRoot.mpLeftNode = 0;
    m_ActiveActionTreeRoot.mpRightNode = 0;
}

void CAnmActionManager::CreateGroup(const unsigned int uiID)
{
    CAnmActionGroup *pGroup = new CAnmActionGroup(uiID);
    m_mGroupMap[uiID] = pGroup;
}

unsigned int CAnmActionManager::CreateGroup()
{
    unsigned int uiID;
    for (unsigned int i=1; i<65535; ++i)
    {
        std::map<unsigned int, CAnmActionGroup*>::iterator it = m_mGroupMap.find(i);
        if (it == m_mGroupMap.end())
        {
            uiID = i;
            break;
        }
    }
    CreateGroup(uiID);
    return uiID;
}

void CAnmActionManager::DeleteGroup(const unsigned int uiID)
{
    std::map<unsigned int, CAnmActionGroup*>::iterator it = m_mGroupMap.find(uiID);
    if (it != m_mGroupMap.end())
    {
        delete it->second;
        m_mGroupMap.erase(it);
    }
}

CAnmActionGroup* CAnmActionManager::GetGroup(const unsigned int uiID)
{
    std::map<unsigned int, CAnmActionGroup*>::iterator it = m_mGroupMap.find(uiID);
    if (it != m_mGroupMap.end())
    {
        return it->second;
    }
    return 0;
}

void CAnmActionManager::GetGroupIDList(std::vector<unsigned int> &vList)
{
    vList.clear();
    std::map<unsigned int, CAnmActionGroup*>::iterator it;
    for (it=m_mGroupMap.begin(); it!=m_mGroupMap.end(); ++it)
    {
        vList.push_back(it->first);
    }
}

int CAnmActionManager::GetGroupAmount() const
{
    return m_mGroupMap.size();
}

int CAnmActionManager::GetActionsCount(const DWORD dwStartTime, const DWORD dwEndTime)
{
    int count = 0;
    std::map<unsigned int, CAnmActionGroup*>::iterator it;
    for (it=m_mGroupMap.begin(); it!=m_mGroupMap.end(); ++it)
    {
        count += it->second->GetActionsCount(dwStartTime, dwEndTime);
    }
    return count;
}

void CAnmActionManager::MoveActions(const DWORD dwStartTime, const DWORD dwEndTime, const DWORD dwOffset, const bool left)
{
    if (left && dwStartTime < dwOffset)
    {
        return;
    }
    std::map<unsigned int, CAnmActionGroup*>::iterator it;
    for (it=m_mGroupMap.begin(); it!=m_mGroupMap.end(); ++it)
    {
        it->second->MoveActions(dwStartTime, dwEndTime, dwOffset, left);
    }
}

void CAnmActionManager::MoveWorldOffset(const A3DVECTOR3 &v)
{
    std::map<unsigned int, CAnmActionGroup*>::iterator it;
    for (it=m_mGroupMap.begin(); it!=m_mGroupMap.end(); ++it)
    {
        it->second->MoveWorldOffset(v);
    }
}

void CAnmActionManager::Prepare(const unsigned int uiID)
{
    //a_LogOutput(1, "Before Prepare");
    Reset();

    ActionVector activeActionList;
    // Push back all the action into active action list
    if (uiID == 0xFFFFFFFF)
    {
        std::map<unsigned int, CAnmActionGroup*>::iterator it;
        for (it=m_mGroupMap.begin(); it!=m_mGroupMap.end(); ++it)
        {
            std::vector<unsigned int> vChannelIDList;
            it->second->GetChannelIDList(vChannelIDList);
            for (size_t iC=0; iC<vChannelIDList.size(); ++iC)
            {
                CAnmActionChannel *pChannel = it->second->GetChannel(vChannelIDList[iC]);
                std::vector<unsigned int> vActionIDList;
                pChannel->GetActionIDList(vActionIDList);
                for (size_t iA=0; iA<vActionIDList.size(); ++iA)
                {
                    CAnmAction *pAction = pChannel->GetAction(vActionIDList[iA]);
                    if (pAction)
                    {
                        activeActionList.push_back(pAction);
                    }
                }
            }
        }
    }
    else
    {
        std::map<unsigned int, CAnmActionGroup*>::iterator it;
        it = m_mGroupMap.find(uiID);
        if (it != m_mGroupMap.end())
        {
            std::vector<unsigned int> vChannelIDList;
            it->second->GetChannelIDList(vChannelIDList);
            for (size_t iC=0; iC<vChannelIDList.size(); ++iC)
            {
                CAnmActionChannel *pChannel = it->second->GetChannel(vChannelIDList[iC]);
                std::vector<unsigned int> vActionIDList;
                pChannel->GetActionIDList(vActionIDList);
                for (size_t iA=0; iA<vActionIDList.size(); ++iA)
                {
                    CAnmAction *pAction = pChannel->GetAction(vActionIDList[iA]);
                    if (pAction)
                    {
                        activeActionList.push_back(pAction);
                    }
                }
            }
        }
    }

    // sort the active action list
    std::sort(activeActionList.begin(), activeActionList.end(), CAnmActionManager::ActionCompareStartTime);

    // Move actions from Active action list into Prepare
    for (m_pActiveIterator=activeActionList.begin(); m_pActiveIterator!=activeActionList.end(); ++m_pActiveIterator)
    {
        m_lPrepareActionList.push_back(*m_pActiveIterator);
    }
    //a_LogOutput(1, "Ater Prepare");
    activeActionList.clear();
}

void CAnmActionManager::Reset()
{
    std::map<unsigned int, CAnmActionGroup*>::iterator it;
    for (it=m_mGroupMap.begin(); it!=m_mGroupMap.end(); ++it)
    {
        it->second->Reset();
    }
    m_lPrepareActionList.clear();
    _ClearActiveActionTree();
    m_ActiveActionTreeRoot.mpAction = 0;
    m_ActiveActionTreeRoot.mEndTime = g_Animator.GetTotalTime() / 2;
    m_ActiveActionTreeRoot.mpLeftNode = 0;
    m_ActiveActionTreeRoot.mpRightNode = 0;
}

float CAnmActionManager::CalculateTotalTime()
{
    float fTotalTime = float(g_Animator.GetTotalTime());
    std::map<unsigned int, CAnmActionGroup*>::iterator it;
    for (it=m_mGroupMap.begin(); it!=m_mGroupMap.end(); ++it)
    {
        std::vector<unsigned int> vChannelIDList;
        it->second->GetChannelIDList(vChannelIDList);
        for (size_t iC=0; iC<vChannelIDList.size(); ++iC)
        {
            CAnmActionChannel *pChannel = it->second->GetChannel(vChannelIDList[iC]);
            std::vector<unsigned int> vActionIDList;
            pChannel->GetActionIDList(vActionIDList);
            for (size_t iA=0; iA<vActionIDList.size(); ++iA)
            {
                CAnmAction *pAction = pChannel->GetAction(vActionIDList[iA]);
                if (pAction && pAction->GetActionType() == CAnmAction::TYPE_SPEED_CONTROL)
                {
                    CAnmSpeedControl *pSpeedControl = dynamic_cast<CAnmSpeedControl*>(pAction);
                    float speed = pSpeedControl->GetSpeed();
                    fTotalTime += float(pSpeedControl->GetTotalTime()) * ((1.0f - speed) / speed);
                }
            }
        }
    }
    return fTotalTime / 1000.0f;
}

bool CAnmActionManager::Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager)
{
    // Add Actions into Active Action Tree
    //a_LogOutput(1, "Tick Node");
    while (!m_lPrepareActionList.empty())
    {
        if ((*m_lPrepareActionList.begin())->GetStartTime() <= dwNowTime)
        {
            _InsertActiveAction((*m_lPrepareActionList.begin()));
            m_lPrepareActionList.pop_front();
        }
        else
        {
            break;
        }
    }

    // Tick Active Action Tree and Remove the dead Actions
    return _TickActiveActionTree(dwNowTime, pObjectManager);
}

CAnmActionManager::~CAnmActionManager()
{
    m_lPrepareActionList.clear();
    _ClearActiveActionTree();
    m_ActiveActionTreeRoot.mpAction = 0;
    m_ActiveActionTreeRoot.mEndTime = 0;
    m_ActiveActionTreeRoot.mpLeftNode = 0;
    m_ActiveActionTreeRoot.mpRightNode = 0;
    std::map<unsigned int, CAnmActionGroup*>::iterator it;
    for (it=m_mGroupMap.begin(); it!=m_mGroupMap.end(); ++it)
    {
        delete it->second;
    }
    m_mGroupMap.clear();
}

void CAnmActionManager::_ClearActiveActionTree()
{
    if (m_ActiveActionTreeRoot.mpLeftNode)
    {
        _RemoveActiveActionNode(m_ActiveActionTreeRoot.mpLeftNode);
    }
    if (m_ActiveActionTreeRoot.mpRightNode)
    {
        _RemoveActiveActionNode(m_ActiveActionTreeRoot.mpRightNode);
    }
}

void CAnmActionManager::_RemoveActiveActionNode(ActionNode *&pActionNode)
{
    if (pActionNode)
    {
        if (pActionNode->mpLeftNode)
        {
            _RemoveActiveActionNode(pActionNode->mpLeftNode);
        }
        if (pActionNode->mpRightNode)
        {
            _RemoveActiveActionNode(pActionNode->mpRightNode);
        }
        //a_LogOutput(1, "Remove Node");
        delete pActionNode;
        pActionNode = 0;
    }
}

void CAnmActionManager::_InsertActiveAction(CAnmAction *pAction)
{
    if (pAction)
    {
        DWORD endTime = pAction->GetStartTime() + pAction->GetTotalTime();
        ActionNode **ppActionNode = 0;
        if (endTime < m_ActiveActionTreeRoot.mEndTime)
        {
            ppActionNode = &(m_ActiveActionTreeRoot.mpLeftNode);
        }
        else
        {
            ppActionNode = &(m_ActiveActionTreeRoot.mpRightNode);
        }

        while (*ppActionNode)
        {
            if (endTime < (*ppActionNode)->mEndTime)
            {
                ppActionNode = &((*ppActionNode)->mpLeftNode);
            }
            else
            {
                ppActionNode = &((*ppActionNode)->mpRightNode);
            }
        }

        if (*ppActionNode == 0)
        {
            *ppActionNode = new ActionNode();
            (*ppActionNode)->mpAction = pAction;
            (*ppActionNode)->mEndTime = endTime;
            (*ppActionNode)->mpLeftNode = 0;
            (*ppActionNode)->mpRightNode = 0;
        }
    }
}

bool CAnmActionManager::_TickActiveActionTree(const DWORD dwNowTime, CAnmObjectManager *pObjectManager)
{
    bool flag = false;
    if (m_ActiveActionTreeRoot.mpLeftNode)
    {
        if (_TickActiveActionNode(m_ActiveActionTreeRoot.mpLeftNode, dwNowTime, pObjectManager))
        {
            flag = true;
        }
    }
    if (m_ActiveActionTreeRoot.mpRightNode)
    {
        if (_TickActiveActionNode(m_ActiveActionTreeRoot.mpRightNode, dwNowTime, pObjectManager))
        {
            flag = true;
        }
    }
    return flag;
}

bool CAnmActionManager::_TickActiveActionNode(ActionNode *&pActionNode, const DWORD dwNowTime, CAnmObjectManager *pObjectManager)
{
    bool flag = false;
    bool removeActionNode = false;
    if (pActionNode)
    {
        if (pActionNode->mpLeftNode)
        {
            if (_TickActiveActionNode(pActionNode->mpLeftNode, dwNowTime, pObjectManager))
            {
                flag = true;
            }
        }
        if (pActionNode->mpAction)
        {
            if (!g_Animator.IsDisabledCamera() || pActionNode->mpAction->GetObjectID() != 0)
            {
                pActionNode->mpAction->Tick(dwNowTime, pObjectManager);
            }
            else
            {
                if (dwNowTime > pActionNode->mEndTime)
                {
                    pActionNode->mpAction->SetDead(true);
                }
            }
            removeActionNode = pActionNode->mpAction->IsDead();
            if (!removeActionNode)
            {
                flag = true;
            }
        }
        if (pActionNode->mpRightNode)
        {
            if (_TickActiveActionNode(pActionNode->mpRightNode, dwNowTime, pObjectManager))
            {
                flag = true;
            }
        }

        if (removeActionNode)
        {
            _RemoveActiveActionNode(pActionNode->mpLeftNode);
            ActionNode *pRightActionNode = pActionNode->mpRightNode;
            delete pActionNode;
            pActionNode = pRightActionNode;
        }
    }
    return flag;
}