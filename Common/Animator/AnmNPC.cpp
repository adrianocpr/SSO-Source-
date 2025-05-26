#include "stdafx.h"
#include "EC_Game.h"
#include "EC_Resource.h"
#include "EC_Utility.h"
#include "Animator/Animator.h"
#include "Animator/AnmNPC.h"
#include "Animator/AnmGFX.h"
#include "Animator/AnmCamera.h"
#include <A3DHLSL.h>
#include <A3DEffect.h>
#include <A3DEnvironment.h>

CAnmNPC::CAnmNPC(unsigned int uiID)
    : CAnmObject(uiID)
{
    m_pModel = 0;
    m_pSkin = 0;
    m_sModelName = _AL("");
    m_sActionName = _AL("");
    m_AABB.Extents = A3DVECTOR3(0.5f);
    m_bHooked = false;
    m_bModelVisible = true;
    m_fSpeed = 1.0f;
    m_fTickTime = 0.0f;
}

CAnmObject::ObjectType CAnmNPC::GetObjectType() const
{
    return CAnmObject::TYPE_NPC;
}

bool CAnmNPC::Load(const wchar_t *szFile)
{
    if (m_pModel)
    {
        m_pModel->ReleaseAllSkins();
        m_pModel->Release();
        delete m_pModel;
        m_pModel = 0;
        m_pSkin = 0;
    }

    m_pModel = new CECModel();
    if (!m_pModel)
    {
        a_LogOutput(1, "CAnmNPC::LoadModel, Failed to create CECModel");
        return false;
    }

    m_sModelName = szFile;
    if (!m_pModel->Load(WC2AS(m_sModelName), true, A3DSkinModel::LSF_NOSKIN, true))
    {
        delete m_pModel;
        m_pModel = 0;
        m_pSkin = 0;
        a_LogOutput(1, "CAnmNPC::LoadModel, Failed to load model %s", szFile);
        return false;
    }

    char szSkin[MAX_PATH];
    strncpy(szSkin, WC2AS(m_sModelName), MAX_PATH);
    glb_ChangeExtension(szSkin, "ski");

    m_pSkin = g_pGame->LoadA3DSkin(szSkin, true);
    
    if (!m_pSkin)
    {
        a_LogOutput(1, "CAnmNPC::LoadModel(), Failed to load skin %s", szSkin);
        m_pSkin = g_pGame->LoadA3DSkin("Models\\error\\error.ski", true);
    }

    if (m_pModel && m_pModel->GetA3DSkinModel() && m_pSkin)
    {
        m_pModel->SetAABBType(CECModel::AABB_AUTOSEL);
        m_pModel->SetEventUsePlaySpeed(false);
        m_pModel->SetId(clientid_t(GetObjectID()));
        m_pModel->SetInheritParentId(false);
        m_pModel->GetA3DSkinModel()->AddSkin(m_pSkin, true);
	}

    SetDirAndUp(A3DVECTOR3(0.0f, 0.0f, -1.0f));
    PlayAction(_AL("ÐÝÏÐ"));
    Tick(0);

    return true;
}

ACString CAnmNPC::GetName() const
{
    return m_sModelName;
}

void CAnmNPC::GetActionList(std::vector<ACString> &vList) const
{
    vList.clear();
    if (m_pModel)
    {
        int n = m_pModel->GetComActCount();
        for (int i=0; i<n; ++i)
        {
            vList.push_back(AS2WC((m_pModel->GetComActByIndex(i))->GetName()));
        }
    }
}

void CAnmNPC::GetHookList(std::vector<ACString> &vList) const
{
    vList.clear();
    if (m_pModel)
    {
        A3DSkeleton *pSkeleton = m_pModel->GetA3DSkinModel()->GetSkeleton();
        if (pSkeleton)
        {
            int n = pSkeleton->GetHookNum();
            for (int i=0; i<n; ++i)
            {
                vList.push_back(AS2WC((pSkeleton->GetHook(i))->GetName()));
            }
        }
    }
}

void CAnmNPC::AddChildModel(const ACString &hangerName,
                            const ACString &hookName,
                            CAnmObject *pObject,
                            const ACString &elseHookName)
{
    if (m_pModel && pObject)
    {
        if (GetObjectID() != pObject->GetObjectID() &&
            pObject->GetObjectType() == CAnmObject::TYPE_NPC)
        {
            CAnmNPC *pNPC = dynamic_cast<CAnmNPC*>(pObject);
            if (pNPC->m_pModel && !pNPC->IsHooked())
            {
                m_pModel->AddChildModel(WC2AS(hangerName), false, WC2AS(hookName), pNPC->m_pModel, WC2AS(elseHookName));
            }
        }
    }
}

CECModel* CAnmNPC::GetECModel()
{
    return m_pModel;
}

void CAnmNPC::RemoveChildModel(const ACString &hangerName)
{
    if (m_pModel)
    {
        CECModel *pModel = m_pModel->GetChildModel(WC2AS(hangerName));
        if (pModel)
        {
            m_pModel->RemoveChildModel(WC2AS(hangerName), false);
        }
    }
}

int CAnmNPC::AddSkin(const ACString &skinName)
{
    if (m_pModel)
    {
        A3DSkinModel *pSkinModel = m_pModel->GetA3DSkinModel();
        if (pSkinModel)
        {
            int index = pSkinModel->AddSkin(NULL, true);
            pSkinModel->ReplaceSkinFile(index, WC2AS(skinName), true);
            if (IsPlayer())
            {
                _SetHostPlayerSkinColor(pSkinModel, index);
            }
            return index;
        }
    }
    return -1;
}

void CAnmNPC::RemoveSkin(const int index)
{
    if (m_pModel)
    {
        A3DSkinModel *pSkinModel = m_pModel->GetA3DSkinModel();
        if (pSkinModel)
        {
            pSkinModel->ReplaceSkin(index, NULL, true);
        }
    }
}

void CAnmNPC::PlayGFX(const ACString &hookName, CAnmGFX *pGFX)
{
    if (m_pModel && pGFX)
    {
        m_pModel->PlayGfx(pGFX->GetGFXPath(),
                          WC2AS(hookName), pGFX->GetScale());
    }
}

void CAnmNPC::RemoveGFX(const ACString &hookName, CAnmGFX *pGFX)
{
    if (m_pModel && pGFX)
    {
        m_pModel->RemoveGfx(pGFX->GetGFXPath(), WC2AS(hookName));
    }
}

void CAnmNPC::HookCamera(const ACString &hookName, CAnmCamera *pCamera)
{
    if (m_pModel && pCamera)
    {
        A3DSkeleton *pSkeleton = m_pModel->GetA3DSkinModel()->GetSkeleton();
        if (pSkeleton)
        {
            A3DSkeletonHook *pHook = pSkeleton->GetHook(WC2AS(hookName), 0);
            if (pHook)
            {
                const A3DMATRIX4 &mat = pHook->GetAbsoluteTM();
                A3DVECTOR3 vPos = mat.GetRow(3);
                A3DVECTOR3 vDir = mat.GetRow(2);
                A3DVECTOR3 vUp = mat.GetRow(1);
                pCamera->SetPos(vPos);
                pCamera->SetDirAndUp(vDir, vUp);
            }
        }
    }
}

void CAnmNPC::SetHooked(const bool hooked)
{
    m_bHooked = hooked;
}

bool CAnmNPC::IsHooked() const
{
    return m_bHooked;
}

void CAnmNPC::SetModelVisible(const bool b)
{
    m_bModelVisible = b;
    if (m_pModel)
    {
        if (b)
        {
            m_pModel->GetSkinModelTRCtrl().RequestShow();
        }
        else
        {
            m_pModel->GetSkinModelTRCtrl().RequestHide();
        }
    }
}

bool CAnmNPC::IsModelVisible() const
{
    return m_bModelVisible;
}

void CAnmNPC::SetActionSpeed(const float speed)
{
    m_fSpeed = speed;
}

float CAnmNPC::GetActionSpeed() const
{
    return m_fSpeed;
}

bool CAnmNPC::Tick(const DWORD dwDeltaTime)
{
    if (m_pModel)
    {
        if (!m_bHooked)
        {
            m_fTickTime += m_fSpeed * float(dwDeltaTime);
            DWORD tickTime = DWORD(m_fTickTime);
            m_fTickTime -= tickTime;
            m_pModel->Tick(tickTime);
        }
    }
    return true;
}

bool CAnmNPC::Render(A3DViewport *viewport, bool bRenderShadow) const
{
    if (m_pModel)
    {
        if (!m_bHooked && IsVisible())
        {
            m_pModel->Render(viewport, false, IsModelVisible());
        }
    }
    return true;
}

void CAnmNPC::PlayAction(const ACString &actionName)
{
    if (m_pModel && actionName != _AL(""))
    {
        if (m_pModel->IsPlayingComAct())
        {
            if (m_sActionName != actionName)
            {
                StopAction();
                m_sActionName = actionName;
                if (!m_pModel->PlayActionByName(WC2AS(actionName), 1.0f,
                        true, 0, false, 0, true))
                {
                    a_LogOutput(1, "CAnmNPC[%s]::PlayAction[%s] error", WC2AS(m_sModelName), WC2AS(actionName));
                    return;
                }
            }
            m_pModel->SetComActFlag(NULL, COMACT_FLAG_MODE_ONCE_MULTIIGNOREGFX);
        }
        else
        {
            A3DSkeleton *pModel = m_pModel->GetA3DSkinModel()->GetSkeleton();
            m_sActionName = actionName;
            if (!m_pModel->PlayActionByName(WC2AS(actionName), 1.0f,
                    true, 200, true, 0, true))
            {
                a_LogOutput(1, "CAnmNPC[%s]::PlayAction[%s] error", WC2AS(m_sModelName), WC2AS(actionName));
                return;
            }
            m_pModel->SetComActFlag(NULL, COMACT_FLAG_MODE_ONCE_MULTIIGNOREGFX);
        }
    }
}

void CAnmNPC::PlayAction(const ACString &actionName, const int iBlendTime, const bool bShowGFX)
{
    if (m_pModel && actionName != _AL(""))
    {
        //a_LogOutput(1, "Play action");
        m_sActionName = actionName;
        if (!m_pModel->PlayActionByName(WC2AS(actionName), 1.0f,
            true, iBlendTime, true, 0, !bShowGFX))
        {
            a_LogOutput(1, "CAnmNPC[%s]::PlayAction[%s] error", WC2AS(m_sModelName), WC2AS(actionName));
            return;
        }
        m_pModel->SetComActFlag(NULL, COMACT_FLAG_MODE_ONCE_MULTIIGNOREGFX);
    }
}

void CAnmNPC::StopAction()
{
    m_fSpeed = 1.0f;
    m_fTickTime = 0.0f;
    if (m_pModel)
    {
        //a_LogOutput(1, "Stop action");
        m_pModel->StopAllActions(true);
    }
}

bool CAnmNPC::IsInAction() const
{
    if (m_pModel)
    {
        if (m_pModel->IsPlayingComAct())
        {
            return true;
        }
    }
    return false;
}

void CAnmNPC::Reset()
{
    StopAction();
    SetVisible(true);
    SetScale(1.0f);
    SetTransparent(1.0f);
}

void CAnmNPC::SetPos(const A3DVECTOR3 &vPos)
{
    if (m_pModel)
    {
        m_pModel->SetPos(vPos - (m_qOrientation ^ m_vOffset));
    }
}

A3DVECTOR3 CAnmNPC::GetPos() const
{
    if (m_pModel)
    {
        return m_pModel->GetPos() + (m_qOrientation ^ m_vOffset);
    }
    return A3DVECTOR3(0.0f);
}

void CAnmNPC::SetDirAndUp(const A3DVECTOR3 &vDir, const A3DVECTOR3 &vUp)
{
    if (m_pModel)
    {
        A3DVECTOR3 v = vDir;
        if (vUp == A3DVECTOR3(0.0f, 1.0f, 0.0f))
        {
            v.y = 0.0f;
        }
        v.Normalize();
        A3DVECTOR3 u = vUp;
        u.Normalize();
        m_pModel->SetDirAndUp(v, vUp);

        A3DVECTOR3 pos = GetPos();

        UpdateOrientation();
            
        SetPos(pos);
    }
}

A3DVECTOR3 CAnmNPC::GetDir() const
{
    if (m_pModel)
    {
        return m_pModel->GetDir();
    }
    return A3DVECTOR3(0.0f, 0.0f, -1.0f);
}

A3DVECTOR3 CAnmNPC::GetUp() const
{
    if (m_pModel)
    {
        return m_pModel->GetUp();
    }
    return A3DVECTOR3(0.0f, 1.0f, 0.0f);
}

void CAnmNPC::SetScale(const float s)
{
    if (m_pModel)
    {
        m_pModel->ScaleAllRootBonesAndGfx(s);
    }
}

float CAnmNPC::GetScale() const
{
    if (m_pModel)
    {
        return m_pModel->GetGfxScale();
    }
    return 1.0f;
}

void CAnmNPC::SetTransparent(const float t)
{
    if (m_pModel)
    {
        m_pModel->SetTransparent(1.0f - t);
    }
}

float CAnmNPC::GetTransparent() const
{
    if (m_pModel)
    {
        return 1.0f - m_pModel->GetTransparent();
    }
    return 1.0f;
}

const A3DAABB& CAnmNPC::GetAABB() const
{
    if (m_pModel)
    {
        return m_pModel->GetA3DSkinModel()->GetModelAABB();
    }
    m_AABB.Center = GetPos();
    m_AABB.CompleteMinsMaxs();
    return m_AABB;
}

void CAnmNPC::CopyDataFrom(CAnmObject *pObject)
{
    if (pObject)
    {
        CAnmNPC *pNPC = dynamic_cast<CAnmNPC*>(pObject);
        if (pNPC)
        {
            CAnmObject::CopyDataFrom(pObject);
            Load(pNPC->GetName());
            SetPos(pNPC->GetPos());
            SetDirAndUp(pNPC->GetDir(), pNPC->GetUp());
            SetScale(pNPC->GetScale());
        }
    }
}

CAnmNPC::~CAnmNPC()
{
    if (m_pModel)
    {
        m_pModel->ReleaseAllSkins();
        m_pModel->Release();
        delete m_pModel;
        m_pModel = 0;
        m_pSkin = 0;
    }
}

void CAnmNPC::_SetHostPlayerSkinColor(A3DSkinModel* pSkinModel, int index)
{
    _SetSkinColor(pSkinModel, index, g_Animator.GetHostPlayerSkinColor(), "_S");
}

void CAnmNPC::_SetSkinColor(A3DSkinModel* pSkinModel, int index, A3DCOLOR cl, const char *szSuffix)
{
    if (pSkinModel && szSuffix)
    {
        A3DSkin* pSkin = pSkinModel->GetA3DSkin(index);
        if (pSkin)
        {
            int iTexNum = pSkin->GetTextureNum();
            for (int i=0; i<iTexNum; ++i)
            {
                A3DEffect* pEffect = dynamic_cast<A3DEffect*>(pSkin->GetTexture(i));
                if (pEffect)
                {
                    // suffix check
                    AString strMTL = pEffect->GetMtlFilename();
                    strMTL.CutRight(4);
                    if (strMTL.Right(strlen(szSuffix)).CompareNoCase(szSuffix) == 0)
                    {
                        if (((cl ^ pEffect->GetDiffuse()) & 0xffffff) != 0)
                        {
                            pEffect->SetDiffuse((pEffect->GetDiffuse() & 0xff000000) | (cl & 0xffffff));
                        }
                    }
                }
            }
        }
    }
}