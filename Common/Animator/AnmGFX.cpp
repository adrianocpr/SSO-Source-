#include "stdafx.h"
#include "EC_Game.h"
#include "EC_GFXCaster.h"
#include "Animator/AnmGFX.h"
#include "Animator/Animator.h"

CAnmGFX::CAnmGFX(unsigned int uiID)
    : CAnmObject(uiID)
{
    m_pGFX = 0;
    m_sGFXName = _AL("");
    m_AABB.Extents = A3DVECTOR3(0.5f);
    m_fSpeed = 1.0f;
    m_fScale = 1.0f;
    m_fTransparent = 1.0f;
    m_fTickTime = 0.0f;
}

CAnmObject::ObjectType CAnmGFX::GetObjectType() const
{
    return CAnmObject::TYPE_GFX;
}

bool CAnmGFX::Load(const wchar_t *szFile)
{
    if (m_pGFX)
    {
        m_pGFX->Release();
        delete m_pGFX;
        m_pGFX = 0;
    }

    /* TODO: Remove '(' and ')'
    size_t length = wcslen(szFile);
    wchar_t tempFileName[256];
    wmemset(tempFileName, L'\0', 256);

    size_t index = 0;
    for (size_t i=0; i<length; ++i)
    {
        int cNum = szFile[i];

        if (cNum != 40 &&    // (
            cNum != 41 &&    // )
            cNum != 65288 && // £¨
            cNum != 65289)   // £©
        {
            tempFileName[index++] = szFile[i];
        }
    }

    m_sGFXName = tempFileName;
    m_pGFX = g_pGame->GetA3DGFXExMan()->LoadGfx(g_Animator.GetA3DDevice(), WC2AS(tempFileName + 4), false); // TODO: szFile + 4 for cutoff the "gfx\"
    if (!m_pGFX)
    {
        a_LogOutput(1, "CAnmGFX::Load, Failed to load GFX %s", WC2AS(tempFileName));
        return false;
    }
    */

    m_sGFXName = szFile;
    m_pGFX = g_pGame->GetA3DGFXExMan()->LoadGfx(g_Animator.GetA3DDevice(), WC2AS(szFile + 4), false); // TODO: szFile + 4 for cutoff the "gfx\"
    if (!m_pGFX)
    {
        a_LogOutput(1, "CAnmGFX::Load, Failed to load GFX %s", WC2AS(szFile));
        return false;
    }

    SetDirAndUp(A3DVECTOR3(0.0f, 0.0f, -1.0f));
    PlayAction();
    Tick(0);
    StopAction();

    return true;
}

ACString CAnmGFX::GetName() const
{
    return m_sGFXName;
}

AString CAnmGFX::GetGFXPath() const
{
    if (m_sGFXName.GetLength() > 4)
    {
        return WC2AS(m_sGFXName.Right(m_sGFXName.GetLength() - 4));
    }
    return AString("");
}

void CAnmGFX::GetActionList(std::vector<ACString> &vList) const
{
    vList.clear();
}

bool CAnmGFX::Tick(const DWORD dwDeltaTime)
{
    if (m_pGFX)
    {
        m_fTickTime += m_fSpeed * float(dwDeltaTime);
        DWORD tickTime = DWORD(m_fTickTime);
        m_fTickTime -= tickTime;
        m_pGFX->TickAnimation(tickTime);
    }
    return true;
}

bool CAnmGFX::Render(A3DViewport *viewport, bool bRenderShadow) const
{
    if (m_pGFX)
    {
        if (IsVisible() && m_pGFX->GetState() != ST_STOP)
        {
            m_pGFX->SetScale(m_fScale);
            m_pGFX->SetAlpha(m_fTransparent);
            g_pGame->GetA3DGFXExMan()->RegisterGfx(m_pGFX);
        }
    }
    return true;
}

void CAnmGFX::PlayAction(const ACString &actionName)
{
    if (m_pGFX)
    {
        m_pGFX->Stop();
        m_pGFX->Reset();
        m_pGFX->Start(true);
    }
}

void CAnmGFX::StopAction()
{
    m_fSpeed = 1.0f;
    m_fTickTime = 0.0f;
    if (m_pGFX)
    {
        m_pGFX->Stop();
    }
}

bool CAnmGFX::IsInAction() const
{
    if (m_pGFX)
    {
        if (m_pGFX->GetState() == ST_STOP)
        {
            return false;
        }
        return true;
    }
    return false;
}

void CAnmGFX::Reset()
{
    m_fSpeed = 1.0f;
    m_fTickTime = 0.0f;
    if (m_pGFX)
    {
        m_pGFX->Stop();
        m_pGFX->Reset();
    }
    SetVisible(true);
    SetScale(1.0f);
    SetTransparent(1.0f);
}

void CAnmGFX::SetActionSpeed(const float speed)
{
    m_fSpeed = speed;
}

float CAnmGFX::GetActionSpeed() const
{
    return m_fSpeed;
}

void CAnmGFX::SetPos(const A3DVECTOR3 &vPos)
{
    if (m_pGFX)
    {
        m_pGFX->SetPos(vPos - (m_qOrientation ^ m_vOffset));
    }
}

A3DVECTOR3 CAnmGFX::GetPos() const
{
    if (m_pGFX)
    {
        return m_pGFX->GetPos() + (m_qOrientation ^ m_vOffset);
    }
    return A3DVECTOR3(0.0f);
}

void CAnmGFX::SetDirAndUp(const A3DVECTOR3 &vDir, const A3DVECTOR3 &vUp)
{
    if (m_pGFX)
    {
        A3DVECTOR3 v = vDir;
        v.Normalize();
        A3DVECTOR3 u = vUp;
        u.Normalize();

        A3DVECTOR3 pos = GetPos();
        
        m_pGFX->SetDirAndUp(v, u);
        m_qOrientation = m_pGFX->GetDir();
        
        SetPos(pos);
    }
}

A3DVECTOR3 CAnmGFX::GetDir() const
{
    if (m_pGFX)
    {
        return m_pGFX->GetDir() ^ A3DVECTOR3(0.0f, 0.0f, 1.0f);
    }
    return A3DVECTOR3(0.0f, 0.0f, 1.0f);
}

A3DVECTOR3 CAnmGFX::GetUp() const
{
    if (m_pGFX)
    {
        return m_pGFX->GetDir() ^ A3DVECTOR3(0.0f, 1.0f, 0.0f);
    }
    return A3DVECTOR3(0.0f, 1.0f, 0.0f);
}

void CAnmGFX::SetScale(const float s)
{
    m_fScale = s;
}

float CAnmGFX::GetScale() const
{
    return m_fScale;
}

void CAnmGFX::SetTransparent(const float t)
{
    m_fTransparent = t;
}

float CAnmGFX::GetTransparent() const
{
    return m_fTransparent;
}

const A3DAABB& CAnmGFX::GetAABB() const
{
    m_AABB.Center = GetPos();
    m_AABB.Center.y += 0.5f;
    m_AABB.CompleteMinsMaxs();
    return m_AABB;
}

void CAnmGFX::CopyDataFrom(CAnmObject *pObject)
{
    if (pObject)
    {
        CAnmGFX *pGFX = dynamic_cast<CAnmGFX*>(pObject);
        if (pGFX)
        {
            CAnmObject::CopyDataFrom(pObject);
            Load(pGFX->GetName());
            SetPos(pGFX->GetPos());
            SetDirAndUp(pGFX->GetDir(), pGFX->GetUp());
            SetScale(pGFX->GetScale());
        }
    }
}

CAnmGFX::~CAnmGFX()
{
    if (m_pGFX)
    {
		m_pGFX->Stop();
        m_pGFX->Release();
        delete m_pGFX;
        m_pGFX = 0;
    }
}

