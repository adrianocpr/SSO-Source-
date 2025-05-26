#include "stdafx.h"
#include "Animator/Animator.h"
#include "Animator/AnmObjectManager.h"

CAnmObjectManager::CAnmObjectManager()
{
    m_pCamera = 0;
    m_pPlayer = 0;
    m_pSelectedObject = 0;
}

void CAnmObjectManager::SetCamera(CAnmCamera *pCamera)
{
    m_pCamera = pCamera;
}

void CAnmObjectManager::SetPlayer(CAnmPlayer *pPlayer)
{
    m_pPlayer = pPlayer;
}

void CAnmObjectManager::CreateObject(const unsigned int uiID, const CAnmObject::ObjectType type)
{
    switch (type)
    {
        case CAnmObject::TYPE_NPC:
        {
            CAnmObject *pObject = new CAnmNPC(uiID);
            m_mObjectMap[uiID] = pObject;
            break;
        }

        case CAnmObject::TYPE_GFX:
        {
            CAnmObject *pObject = new CAnmGFX(uiID);
            m_mObjectMap[uiID] = pObject;
            break;
        }

        default:
            break;
    }
}

unsigned int CAnmObjectManager::CreateObject(const CAnmObject::ObjectType type)
{
    unsigned int uiID;
    for (unsigned int i=2; i<65535; ++i)
    {
        std::map<unsigned int, CAnmObject*>::iterator it = m_mObjectMap.find(i);
        if (it == m_mObjectMap.end())
        {
            uiID = i;
            break;
        }
    }
    CreateObject(uiID, type);
    return uiID;
}

unsigned int CAnmObjectManager::CopyObject(const unsigned int uiID)
{
    if (uiID < 2)
    {
        return 0;
    }
    CAnmObject *pObject = GetObject(uiID);
    if (!pObject)
    {
        return 0;
    }
    unsigned int uiCopyObjectID = CreateObject(pObject->GetObjectType());
    CAnmObject *pCopyObject = GetObject(uiCopyObjectID);
    if (pCopyObject)
    {
        pCopyObject->CopyDataFrom(pObject);
        return uiCopyObjectID;
    }
    return 0;
}

void CAnmObjectManager::RemoveObject(const unsigned int uiID)
{
    std::map<unsigned int, CAnmObject*>::iterator it = m_mObjectMap.find(uiID);
    if (it != m_mObjectMap.end())
    {
        if (it->second == m_pSelectedObject)
        {
            m_pSelectedObject = 0;
        }
        delete it->second;
        m_mObjectMap.erase(it);
    }
}

CAnmObject* CAnmObjectManager::GetObject(const unsigned int uiID)
{
    if (uiID == 0)
    {
        return m_pCamera;
    }

    if (uiID == 1)
    {
        return m_pPlayer;
    }

    std::map<unsigned int, CAnmObject*>::iterator it = m_mObjectMap.find(uiID);
    if (it != m_mObjectMap.end())
    {
        return it->second;
    }
    return 0;
}

CAnmObject* CAnmObjectManager::GetSelectedObject() const
{
    return m_pSelectedObject;
}

void CAnmObjectManager::SelectObject(const unsigned int uiID)
{
    m_pSelectedObject = GetObject(uiID);
}

void CAnmObjectManager::GetObjectIDList(std::vector<unsigned int> &vList)
{
    vList.clear();
    std::map<unsigned int, CAnmObject*>::iterator it;
    for (it=m_mObjectMap.begin(); it!=m_mObjectMap.end(); ++it)
    {
        vList.push_back(it->first);
    }
}

int CAnmObjectManager::GetObjectAmount() const
{
    return m_mObjectMap.size();
}

bool CAnmObjectManager::Tick(const DWORD dwDeltaTime)
{
    bool flag = true;
    if (!m_pCamera->Tick(dwDeltaTime))
    {
        flag = false;
    }
    if (g_Animator.IsUseHostPlayer())
    {
        if (!m_pPlayer->Tick(dwDeltaTime))
        {
            flag = false;
        }
    }
    std::map<unsigned int, CAnmObject*>::iterator it;
    for (it=m_mObjectMap.begin(); it!=m_mObjectMap.end(); ++it)
    {
        if (!it->second->Tick(dwDeltaTime))
        {
            flag = false;
        }
    }
    return flag;
}

bool CAnmObjectManager::Render(A3DViewport *viewport, bool bRenderShadow)
{
    bool flag = true;
    if (!m_pCamera->Render())
    {
        flag = false;
    }
    if (g_Animator.IsUseHostPlayer())
    {
        if (!m_pPlayer->Render(viewport, bRenderShadow))
        {
            flag = false;
        }
    }
    std::map<unsigned int, CAnmObject*>::iterator it;
    for (it=m_mObjectMap.begin(); it!=m_mObjectMap.end(); ++it)
    {
        if (!it->second->Render(viewport, bRenderShadow))
        {
            flag = false;
        }
    }
    return flag;
}

void CAnmObjectManager::Reset()
{
    m_pCamera->Reset();

    std::map<unsigned int, CAnmObject*>::iterator it;
    for (it=m_mObjectMap.begin(); it!=m_mObjectMap.end(); ++it)
    {
        it->second->Reset();
    }
}

CAnmObjectManager::~CAnmObjectManager()
{
    m_pSelectedObject = 0;
    std::map<unsigned int, CAnmObject*>::iterator it;
    for (it=m_mObjectMap.begin(); it!=m_mObjectMap.end(); ++it)
    {
        delete it->second;
    }
    m_mObjectMap.clear();
}
