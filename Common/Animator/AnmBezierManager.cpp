#include "stdafx.h"
#include "Animator/AnmBezierManager.h"

CAnmBezierManager::CAnmBezierManager(A3DWireCollector *pA3DWireCollector)
{
    m_pA3DWireCollector = pA3DWireCollector;
    m_pSelectedBezier = 0;
}

void CAnmBezierManager::CreateBezier(const unsigned int uiID)
{
    CAnmBezier *pBezier = new CAnmBezier(m_pA3DWireCollector);
    pBezier->SetID(uiID);
    m_mBezierMap[uiID] = pBezier;
}

unsigned int CAnmBezierManager::CreateBezier()
{
    unsigned int uiID;
    for (unsigned int i=0; i<65535; ++i)
    {
        std::map<unsigned int, CAnmBezier*>::iterator it = m_mBezierMap.find(i);
        if (it == m_mBezierMap.end())
        {
            uiID = i;
            break;
        }
    }
    CreateBezier(uiID);
    return uiID;
}

void CAnmBezierManager::CopyBezier(const unsigned int uiID)
{
    unsigned int newID = CreateBezier();
    CAnmBezier *pBezier = GetBezier(uiID);
    CAnmBezier *pNewBezier = GetBezier(newID);
    if (pBezier && pNewBezier)
    {
        pBezier->CopyTo(pNewBezier);
    }
}

void CAnmBezierManager::RemoveBezier(const unsigned int uiID)
{
    std::map<unsigned int, CAnmBezier*>::iterator it = m_mBezierMap.find(uiID);
    if (it != m_mBezierMap.end())
    {
        if (it->second == m_pSelectedBezier)
        {
            m_pSelectedBezier = 0;
        }
        delete it->second;
        m_mBezierMap.erase(it);
    }
}

CAnmBezier* CAnmBezierManager::GetBezier(const unsigned int uiID)
{
    std::map<unsigned int, CAnmBezier*>::iterator it = m_mBezierMap.find(uiID);
    if (it != m_mBezierMap.end())
    {
        return it->second;
    }
    return 0;
}

CAnmBezier* CAnmBezierManager::GetSelectedBezier() const
{
    return m_pSelectedBezier;
}

void CAnmBezierManager::SelectBezier(const unsigned int uiID)
{
    m_pSelectedBezier = GetBezier(uiID);
}

void CAnmBezierManager::GetBezierIDList(std::vector<unsigned int> &vList)
{
    vList.clear();
    std::map<unsigned int, CAnmBezier*>::iterator it;
    for (it=m_mBezierMap.begin(); it!=m_mBezierMap.end(); ++it)
    {
        vList.push_back(it->first);
    }
}

void CAnmBezierManager::SetAllVisable(const bool b)
{
    std::map<unsigned int, CAnmBezier*>::iterator it;
    for (it=m_mBezierMap.begin(); it!=m_mBezierMap.end(); ++it)
    {
        it->second->SetVisable(b);
    }
}

void CAnmBezierManager::Render()
{
    std::map<unsigned int, CAnmBezier*>::iterator it;
    for (it=m_mBezierMap.begin(); it!=m_mBezierMap.end(); ++it)
    {
        if (it->second->IsVisable())
        {
            it->second->Render();
        }
        else if (m_pSelectedBezier && it->second == m_pSelectedBezier)
        {
            m_pSelectedBezier->Render();
        }
    }
}

void CAnmBezierManager::MoveAllBezier(const A3DVECTOR3 &v)
{
    std::map<unsigned int, CAnmBezier*>::iterator it;
    for (it=m_mBezierMap.begin(); it!=m_mBezierMap.end(); ++it)
    {
        it->second->Move(v);
    }
}

int CAnmBezierManager::GetBezierAmount() const
{
    return m_mBezierMap.size();
}

CAnmBezierManager::~CAnmBezierManager()
{
    std::map<unsigned int, CAnmBezier*>::iterator it;
    for (it=m_mBezierMap.begin(); it!=m_mBezierMap.end(); ++it)
    {
        delete it->second;
    }
    m_pSelectedBezier = 0;
}
