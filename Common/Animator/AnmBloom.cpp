#include "stdafx.h"
#include "Animator/Animator.h"
#include "Animator/AnmBloom.h"

CAnmBloom::CAnmBloom(const unsigned int uiID)
    : CAnmAction(uiID)
{
    m_iTotalFrames = 1;
}

void CAnmBloom::SetStartBloom(const A3DPOST_EFFECT_BLOOM_PARAM &bloom)
{
    m_StartBloom = bloom;
}

A3DPOST_EFFECT_BLOOM_PARAM CAnmBloom::GetStartBloom() const
{
    return m_StartBloom;
}

void CAnmBloom::SetEndBloom(const A3DPOST_EFFECT_BLOOM_PARAM &bloom)
{
    m_EndBloom = bloom;
}

A3DPOST_EFFECT_BLOOM_PARAM CAnmBloom::GetEndBloom() const
{
    return m_EndBloom;
}

void CAnmBloom::SetTotalFrames(const int iFrame)
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

int CAnmBloom::GetTotalFrames() const
{
    return m_iTotalFrames;
}

CAnmAction::ActionType CAnmBloom::GetActionType() const
{
    return CAnmAction::TYPE_BLOOM;
}

void CAnmBloom::CopyDataFrom(CAnmAction *pAction)
{
    CAnmBloom *pDataAction = dynamic_cast<CAnmBloom*>(pAction);
    if (pDataAction)
    {
        SetStartBloom(pDataAction->GetStartBloom());
        SetEndBloom(pDataAction->GetEndBloom());
        SetTotalFrames(pDataAction->GetTotalFrames());
    }
}

bool CAnmBloom::Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager)
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
                // Set Bloom
                if (dT < dwTotalTime)
                {
                    float u = float(dT) / dwTotalTime;
                    A3DPOST_EFFECT_BLOOM_PARAM bloom;
                    bloom.fBlurSize = Lerp(m_StartBloom.fBlurSize, m_EndBloom.fBlurSize, u);
                    bloom.fBrightThreshold = Lerp(m_StartBloom.fBrightThreshold, m_EndBloom.fBrightThreshold, u);
                    bloom.fBrightScale = Lerp(m_StartBloom.fBrightScale, m_EndBloom.fBrightScale, u);
                    g_Animator.EnablePostEffect(A3DPOST_EFFECT_Bloom);
                    g_Animator.SetPostEffectBloomParam(bloom);
                }
                else
                {
                    g_Animator.EnablePostEffect(A3DPOST_EFFECT_Bloom);
                    g_Animator.SetPostEffectBloomParam(m_EndBloom);
                }
            }
        }
    }

    if (dT >= dwTotalTime)
    {
        g_Animator.DisablePostEffect(A3DPOST_EFFECT_Bloom);
        m_bDead = true;
    }
    return IsDead();
}

DWORD CAnmBloom::GetTotalTime() const
{
    return TIME_PER_FRAME * m_iTotalFrames;
}

CAnmBloom::~CAnmBloom()
{
}
