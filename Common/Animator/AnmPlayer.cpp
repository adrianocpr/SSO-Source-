#include "stdafx.h"
#include "Animator/AnmPlayer.h"

CAnmPlayer::CAnmPlayer()
    : CAnmNPC(1)
{
    m_bUseHostPlayer = false;
}

void CAnmPlayer::SetHostPlayerModel(CECModel *pModel)
{
    if (pModel)
    {
        if (m_pModel && !m_bUseHostPlayer)
        {
            m_pModel->ReleaseAllSkins();
            m_pModel->Release();
            delete m_pModel;
            m_pSkin = 0;
            m_pModel = 0;
        }
        m_pModel = pModel;
        m_pSkin = pModel->GetA3DSkin(0);
        m_bUseHostPlayer = true;
        if (m_pModel)
        {
            m_pModel->SetId(clientid_t(GetObjectID()));
            m_pModel->SetInheritParentId(false);
        }
        Reset();
    }
}

CAnmPlayer::~CAnmPlayer()
{
    if (m_bUseHostPlayer)
    {
        m_pModel = 0;
        m_pSkin = 0;
    }
    else
    {
        if (m_pModel)
        {
			m_pModel->StopAllActions(true);
            m_pModel->ReleaseAllSkins();
            m_pModel->Release();
            delete m_pModel;
            m_pModel = 0;
            m_pSkin = 0;
        }
    }
}