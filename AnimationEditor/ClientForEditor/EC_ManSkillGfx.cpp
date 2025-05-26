
#include "StdAfx.h"
#include "EC_Global.h"
#include "EC_ManSkillGfx.h"
#include "EC_GFXCaster.h"
#include "EC_Game.h"
#include "EC_GameRun.h"
#include "EC_World.h"
#include "Animator/Animator.h"
#include "Animator/AnmObjectManager.h"


namespace _SGC
{

A3DSkillGfxMan* AfxGetSkillGfxEventMan()
{
	return g_pGame->GetGameRun()->GetCurWorld()->GetSkillGfxMan()->GetPtr();
}

A3DSkillGfxComposerMan* AfxGetSkillGfxComposerMan()
{
	return g_pGame->GetGameRun()->GetSkillGfxComposerMan();
}

SkillGfxMan::SkillGfxMan(CECGameRun* pGameRun)
{
    SetDamageShowFunc(ShowDamageInfo);
	SetCasterShowFunc(ShowCasterInfo);
	SetSkillGfxTickFunc(SkillGfxTickFunc);
}

void WINAPI SkillGfxMan::ShowDamageInfo(__int64 idCaster, __int64 idTarget, int nDamage, int nDivisions, DWORD dwModifier)
{
}

void WINAPI SkillGfxMan::ShowCasterInfo(__int64 idCaster, DWORD dwModifier)
{
}

void WINAPI SkillGfxMan::SkillGfxTickFunc(__int64 idCaster, int state, DWORD dwTickTime, const A3DVECTOR3* pDir, const A3DVECTOR3* pPos)
{
}

bool SkillGfxMan::GetPositionById(__int64 nID, A3DVECTOR3& vPos, GfxHitPos HitPos, const char* szHook, bool bRelHook, const A3DVECTOR3* pOffset, const char* szHanger, bool bChildHook)
{
	return false;
}

bool SkillGfxMan::GetDirAndUpById(__int64 nId, A3DVECTOR3& vDir, A3DVECTOR3& vUp)
{
	return false;
}

float SkillGfxMan::GetTargetScale(__int64 nID)
{
	float fHeight = 0.0f;
	return fHeight;
}

A3DGFXEx* CECSkillGfxEvent::LoadHitGfx(A3DDevice* pDev, const char* szPath, DWORD dwModifier)
{
	return AfxGetGFXExMan()->LoadGfx(pDev, szPath);
}

void CECSkillGfxEvent::PlayExtraHitGfx(DWORD dwModifier, const A3DVECTOR3& vPos)
{
}

bool CECGFXInterfaceImpl::PlaySkillGfx(const PARAM_PLAYSKILLGFX* param)
{
    // 代替原有的 AfxPlaySkillGfx, 增加 SetUserData
    using namespace _SGC;
    A3DSkillGfxComposerMan* pMan = AfxGetSkillGfxComposerMan();
    A3DSkillGfxMan* pEventMan = AfxGetSkillGfxEventMan();

    pMan->Play(
        param->strAtkFile,
        param->SerialID,
        param->nCasterID,
        param->nCastTargetID,
        &param->vFixedPoint,
        0.0f, enumAttBothFlyHit, 0, 0,
        param->nAttIndex,
        param->nAttackOrientation);

    A3DSkillGfxEvent* pEvent = pEventMan->GetSkillGfxEvent(param->nCasterID, param->SerialID);

    if (!pEvent)
        return true;

    pEvent = pEvent->GetLast();
    pEvent->SetDivisions(param->nDivisions);
    pEvent->SetUserData( param->dwUserData );

    for (size_t i = 0; i < param->pTargets->size(); i++)
        pEvent->AddOneTarget( param->pTargets->at(i) );

    return true;
}

CECModel* CECGFXInterfaceImpl::GetECModelById(clientid_t nId)
{
    CAnmObjectManager *pObjectManager = g_Animator.GetObjectManager();
    if (pObjectManager)
    {
        CAnmObject *pObject = pObjectManager->GetObject((unsigned int)nId);
        if (pObject)
        {
            if (pObject->GetObjectType() == CAnmObject::TYPE_NPC)
            {
                CAnmNPC *pNPC = dynamic_cast<CAnmNPC*>(pObject);
                if (pNPC)
                {
                    return pNPC->GetECModel();
                }
            }
        }
    }
    return 0;
}

bool CECGFXInterfaceImpl::SetSkinModelVisibleById(clientid_t nId, bool bVisible)
{
    CAnmObjectManager *pObjectManager = g_Animator.GetObjectManager();
    if (pObjectManager)
    {
        CAnmObject *pObject = pObjectManager->GetObject((unsigned int)nId);
        if (pObject)
        {
            if (pObject->GetObjectType() == CAnmObject::TYPE_NPC)
            {
                CAnmNPC *pNPC = dynamic_cast<CAnmNPC*>(pObject);
                if (pNPC)
                {
                    pNPC->SetModelVisible(bVisible);
                    return true;
                }
            }
        }
    }
    return false;
}

bool CECGFXInterfaceImpl::SetSkinModelTickSpeed(clientid_t nId, float fTickSpeed)
{
    return false;
}

}

CECSkillGfxMan::CECSkillGfxMan(CECGameRun* pGameRun) :
CECManager(pGameRun),
m_GfxMan(pGameRun)
{
	m_GfxMan.Init(g_pGame->GetA3DDevice());
}
