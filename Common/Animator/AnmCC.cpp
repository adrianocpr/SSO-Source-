#include "stdafx.h"
#include "Animator/Animator.h"
#include "Animator/AnmCC.h"

CAnmCC::CAnmCC(const unsigned int uiID)
    : CAnmAction(uiID)
{
    m_fStartFactor = 0.0f;
    m_fEndFactor = 1.0f;
    m_sTex1 = _AL("Shaders\\Textures\\ccdefault.dds");
    m_sTex2 = _AL("Shaders\\Textures\\ccdefault.dds");
    m_iTotalFrames = 1;
}

void CAnmCC::SetStartFactor(const float f)
{
    m_fStartFactor = f;
}

float CAnmCC::GetStartFactor() const
{
    return m_fStartFactor;
}

void CAnmCC::SetEndFactor(const float f)
{
    m_fEndFactor = f;
}

float CAnmCC::GetEndFactor() const
{
    return m_fEndFactor;
}

void CAnmCC::SetTex1Path(const ACString &path)
{
    m_sTex1 = path;
}

ACString CAnmCC::GetTex1Path() const
{
    return m_sTex1;
}

void CAnmCC::SetTex2Path(const ACString &path)
{
    m_sTex2 = path;
}

ACString CAnmCC::GetTex2Path() const
{
    return m_sTex2;
}

void CAnmCC::SetTotalFrames(const int iFrame)
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

int CAnmCC::GetTotalFrames() const
{
    return m_iTotalFrames;
}

CAnmAction::ActionType CAnmCC::GetActionType() const
{
    return CAnmAction::TYPE_CC;
}

void CAnmCC::CopyDataFrom(CAnmAction *pAction)
{
    CAnmCC *pDataAction = dynamic_cast<CAnmCC*>(pAction);
    if (pDataAction)
    {
        SetStartFactor(pDataAction->GetStartFactor());
        SetEndFactor(pDataAction->GetEndFactor());
        SetTex1Path(pDataAction->GetTex1Path());
        SetTex2Path(pDataAction->GetTex2Path());
        SetTotalFrames(pDataAction->GetTotalFrames());
    }
}

bool CAnmCC::Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager)
{
    if (IsDead())
    {
        return false;
    }
    DWORD dT = dwNowTime - m_dwStartTime;
    DWORD dwTotalTime = GetTotalTime();
    CAnmObject *pObject = pObjectManager->GetObject(m_uiObjectID);
    if (pObject && pObject->GetObjectType() == CAnmObject::TYPE_CAMERA)
    {
        CAnmCamera *pCamera = dynamic_cast<CAnmCamera*>(pObject);
        {
            if (dwNowTime >= m_dwStartTime)
            {
                // Set Factor
                if (dT < dwTotalTime)
                {
                    float u = float(dT) / dwTotalTime;
                    A3DPOST_EFFECT_CC_PARAM cc;
                    cc.fFactor = Lerp(m_fStartFactor, m_fEndFactor, u);
                    cc.bUseManualParam1 = false;
                    cc.bUseManualParam2 = false;
                    cc.szTex1 = WC2AS(m_sTex1);
                    cc.szTex2 = WC2AS(m_sTex2);
                    cc.bAfterUI = false;
                    g_Animator.EnablePostEffect(A3DPOST_EFFECT_CC);
                    g_Animator.SetPostEffectCCParam(cc);
                }
                else
                {
                    A3DPOST_EFFECT_CC_PARAM cc;
                    cc.fFactor = m_fEndFactor;
                    cc.bUseManualParam1 = false;
                    cc.bUseManualParam2 = false;
                    cc.szTex1 = WC2AS(m_sTex1);
                    cc.szTex2 = WC2AS(m_sTex2);
                    cc.bAfterUI = false;
                    g_Animator.EnablePostEffect(A3DPOST_EFFECT_CC);
                    g_Animator.SetPostEffectCCParam(cc);
                }
            }
        }
    }

    if (dT >= dwTotalTime)
    {
        g_Animator.DisablePostEffect(A3DPOST_EFFECT_CC);
        m_bDead = true;
    }
    return IsDead();
}

DWORD CAnmCC::GetTotalTime() const
{
    return TIME_PER_FRAME * m_iTotalFrames;
}

CAnmCC::~CAnmCC()
{
}
