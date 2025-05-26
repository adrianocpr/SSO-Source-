#include "stdafx.h"
#include "EC_Game.h"
#include "EC_GameRun.h"
#include "EC_World.h"
#include "Animator/Animator.h"
#include "Animator/AnmCamera.h"
#include "Animator/AnmPlayer.h"
#include "Animator/AnmObjectManager.h"
#include "Animator/AnmBezierManager.h"
#include "Animator/AnmActionManager.h"
#include "Animator/AnmTranslator.h"
#include "Animator/AnimatorListener.h"
#include "Animator/AnmRayTrace.h"
#include "Animator/AnmAxes.h"

#include "Animator/SmartCamera.h"

CAnimator g_Animator;
CManagerWrapperForAnimator g_ManagerWrapperForAnimator(&g_Animator);

CAnimator::CAnimator()
{
    m_pFont = 0;
    m_pCamera = 0;
    m_pPlayer = 0;
    m_pObjectManager = 0;
    m_pBezierManager = 0;
    m_pActionManager = 0;
    m_pTranslator = new CAnmTranslator(this);
    m_pRayTrace = new CAnmRayTrace(this);
    m_pAxes = 0;
    m_pSmartCamera = 0;
    m_eAnimationType = TYPE_NORMAL_ANIMATION;
    m_iWorldInstance = 1;
    m_bUseHostPlayer = false;
    m_bForceNoSaintCloth = false;
    m_HostPlayerSkinColor = 0xffffffff;
    m_bSpecifyTime = false;
    m_iHour = 0;
    m_iMinute = 0;
    m_iSecond = 0;
    m_bSpecifyWeather = false;
    m_bRain = false;
    m_bSnow = false;
    m_dwVolume = 100;
    m_uiMaskColor = 0x00000000;
    m_uiMonoColor = 0xFFFFFFFF;
    m_uiBackgroundColor = 0xFF000000;
    m_eBlackWhiteType = BWT_NONE;
    m_uiHideWorldType = 0;
    m_dwTotalTime = 8000;
    m_dwStartTime = 0;
    m_dwEndTime = 8000;
    m_dwNowTime = 0;
    m_uiQTEID = 0;
    m_fQTESpeed = 1.0f;
    m_fSpeed = 1.0f;
    m_bAnimatorReady = false;
    m_bDisableCamera = false;
    m_bBindCamera = false;
    m_vBindCameraOffset = A3DVECTOR3(0.0f);
    m_eState = STATE_WAITING;
    m_bMoveCamera = false;
    m_fMoveCameraSpeed = 1.0f;
    m_iMoveLastTime = 0;

    float f = -0.03f;
    m_aFrustum[0] = A3DVECTOR3(-f, -f, f);
    m_aFrustum[1] = A3DVECTOR3(f, -f, f);
    m_aFrustum[2] = A3DVECTOR3(f, f, f);
    m_aFrustum[3] = A3DVECTOR3(-f, f, f);
    f = -0.05f;
    m_aFrustum[4] = A3DVECTOR3(-f, -f, 2*f);
    m_aFrustum[5] = A3DVECTOR3(f, -f, 2*f);
    m_aFrustum[6] = A3DVECTOR3(f, f, 2*f);
    m_aFrustum[7] = A3DVECTOR3(-f, f, 2*f);
}

CAnimator::AnimationType CAnimator::GetAnimationType() const
{
    return m_eAnimationType;
}

bool CAnimator::AddListener(CAnimatorListener *listener)
{
    return m_Listeners.insert(listener).second;
}

bool CAnimator::RemoveListener(CAnimatorListener *listener)
{
    return m_Listeners.erase(listener) > 0;
}

void CAnimator::ClearListeners()
{
    m_Listeners.clear();
}

bool CAnimator::Init()
{
    // Create Font
    A3DFontMan *pFontMan = g_pGame->GetA3DEngine()->GetA3DFontMan();
    wchar_t chSample('W');
    HA3DFONT font = pFontMan->RegisterFontType(L"Á¥Êé", 24, 0, chSample);
    m_pFont = pFontMan->CreateA3DFont(font, 512, 128, 128);

    // Create Camera
    m_pCamera = new CAnmCamera();
    if (!m_pCamera->Init())
    {
        a_LogOutput(1, "CAnimator::InitA3DEngine: Failed to create camera object!");
        return false;
    }

    m_eAnimationType = TYPE_NORMAL_ANIMATION;

    // Create Player
    m_pPlayer = new CAnmPlayer();

    // Create Objects Manager
    m_pObjectManager = new CAnmObjectManager();
    m_pObjectManager->SetCamera(m_pCamera);
    m_pObjectManager->SetPlayer(m_pPlayer);

    // Create Bezier Manager
    m_pBezierManager = new CAnmBezierManager(g_pGame->GetA3DEngine()->GetA3DWireCollector());

    // Create Axes
    m_pAxes = new CAnmAxes(g_pGame->GetA3DEngine()->GetA3DWireCollector());

    // Create Action Manager
    m_pActionManager = new CAnmActionManager();

    m_dwTotalTime = 8000;
    m_dwStartTime = 0;
    m_dwEndTime = 8000;
    m_dwNowTime = 0;
    m_uiQTEID = 0;
    m_fQTESpeed = 1.0f;
    m_fSpeed = 1.0f;
    m_bAnimatorReady = true;

    m_pSmartCamera = new SmartCamera(GetA3DCamera());

    ResetPostEffectParam();

    return true;
}

void CAnimator::Release()
{
    m_eAnimationType = TYPE_NORMAL_ANIMATION;
    m_iWorldInstance = 1;
    m_bUseHostPlayer = false;
    m_bForceNoSaintCloth = false;
    m_HostPlayerSkinColor = 0xffffffff;
    m_bSpecifyTime = false;
    m_bSpecifyWeather = false;
    m_uiMaskColor = 0x00000000;
    m_uiMonoColor = 0xFFFFFFFF;
    m_uiBackgroundColor = 0xFF000000;
    m_eBlackWhiteType = BWT_NONE;
    m_uiHideWorldType = 0;
    m_dwTotalTime = 8000;
    m_dwNowTime = 0;
    m_uiQTEID = 0;
    m_fQTESpeed = 1.0f;
    m_fSpeed = 1.0f;
    m_bAnimatorReady = false;
    m_bDisableCamera = false;
    m_eState = STATE_WAITING;

    if (m_pFont)
    {
        A3DFontMan *pFontMan = g_pGame->GetA3DEngine()->GetA3DFontMan();
        pFontMan->ReleaseA3DFont(m_pFont);
        m_pFont = 0;
    }

    if (m_pAxes)
    {
        delete m_pAxes;
        m_pAxes = 0;
    }
    
    if (m_pActionManager)
    {
        delete m_pActionManager;
        m_pActionManager = 0;
    }

    if (m_pBezierManager)
    {
        delete m_pBezierManager;
        m_pBezierManager = 0;
    }

    if (m_pObjectManager)
    {
        delete m_pObjectManager;
        m_pObjectManager = 0;
    }

    if (m_pPlayer)
    {
        delete m_pPlayer;
        m_pPlayer = 0;
    }

    if (m_pCamera)
    {
        delete m_pCamera;
        m_pCamera = 0;
    }

    if (m_pSmartCamera)
    {
        delete m_pSmartCamera;
        m_pSmartCamera = 0;
    }
}

bool CAnimator::Tick(DWORD dwDeltaTime)
{
    bool flag = true;

    if (!IsReady()) return false;

    if (m_fMoveCameraSpeed > 1.0f && m_fMoveCameraSpeed < 40.0f)
    {
        m_fMoveCameraSpeed += 0.1f * float(dwDeltaTime);
    }

    if (m_eState == STATE_PLAYING)
    {
        SetDialogue(L"");
        SetMaskColor(0x00000000);
        SetMonoColor(0xFFFFFFFF);
        SetMonoColor(0xFF000000);
        SetBlackWhiteType(BWT_NONE);
        SetHideWorldType(0);

        m_fTickTime += m_fQTESpeed * m_fSpeed * dwDeltaTime;
        dwDeltaTime = DWORD(m_fTickTime);
        m_fTickTime -= dwDeltaTime;

        m_dwNowTime += dwDeltaTime;
        m_fPlayTime += dwDeltaTime;
        if (m_dwNowTime > m_dwEndTime)
        {
            dwDeltaTime -= m_dwNowTime - m_dwEndTime;
            m_dwNowTime = m_dwEndTime;
        }
        if (!m_pActionManager->Tick(m_dwNowTime, m_pObjectManager))
        {
            flag = false;
        }
        if (!m_pObjectManager->Tick(dwDeltaTime))
        {
            flag = false;
        }
        if (m_dwNowTime >= m_dwEndTime)
        {
            Stop(true);
        }
    }
    else
    {
        if (!m_pObjectManager->Tick(0))
        {
            flag = false;
        }
    }

#ifdef ANIMATION_EDITOR
    TickSmartCamera(dwDeltaTime);
#endif
    FormatCameraPos();

    return flag;
}

bool CAnimator::Render(A3DViewport *pViewport, bool bRenderShadow)
{
    if (!m_pObjectManager)
        return true;
    return m_pObjectManager->Render(pViewport, bRenderShadow);
}

bool CAnimator::Render(const ECRENDERPARAM* pRenderParam)
{
	return Render(pRenderParam->pViewport->GetA3DViewport());
}

void CAnimator::RenderMask(A3DViewport *pViewport)
{
    // Render Mask
    if (m_uiMaskColor & 0xFF000000)
    {
        A3DDEVFMT devFmt = GetA3DDevice()->GetDevFormat();
        g_pGame->GetA3DEngine()->GetA3DFlatCollector()->AddRect_2D(0, 0, devFmt.nWidth, devFmt.nHeight, m_uiMaskColor);
        g_pGame->GetA3DEngine()->GetA3DFlatCollector()->Flush();
    }
}

void CAnimator::RenderText(A3DViewport *pViewport)
{
    A3DVIEWPORTPARAM *pMainView = pViewport->GetParam();

    if (m_uiQTEID)
    {
        ACString strQTE(_AL("Press [SPACE]"));
        m_pFont->TextOut(pMainView->X + pMainView->Width / 2 - strQTE.GetLength() * 12,
            pMainView->Y + pMainView->Height / 2, strQTE, 0xFFFF0000);
    }

    if (g_pA3DConfig->RT_GetShowFPSFlag())
    {
        ACString strTickTime;
        strTickTime.Format(_AL("Played Time: %.3fs"), m_fPlayTime * 0.001f);
        m_pFont->TextOut(pMainView->X + 20, pMainView->Y + 20, strTickTime, 0xFF00FF00);
        strTickTime.Format(_AL("Frame: %d"), 1 + int(m_dwNowTime * 0.02f));
        m_pFont->TextOut(pMainView->X + 20, pMainView->Y + 40, strTickTime, 0xFFFF0000);
    }

    // Render Text
    m_pFont->TextOut(pMainView->X + pMainView->Width / 2 - m_sDialogue.GetLength() * 12,
                     pMainView->Y + pMainView->Height - 50, m_sDialogue, 0xFFFFFFFF);
    m_pFont->Flush();
}

void CAnimator::RenderWire(A3DViewport *pViewport)
{
    CAnmObject *pObject = m_pObjectManager->GetSelectedObject();
    if (pObject)
    {
        const A3DAABB objectAABB = pObject->GetAABB();
        g_pGame->GetA3DEngine()->GetA3DWireCollector()->AddAABB(objectAABB, 0xFF00FF00);
        g_pGame->GetA3DEngine()->GetA3DWireCollector()->Flush();
        A3DVECTOR3 vPos = pObject->GetPos() + A3DVECTOR3(0.0f, 2.0f, 0.0f);
        A3DVECTOR3 vPosIn = pObject->GetPos()+A3DVECTOR3(0.0f, objectAABB.Maxs.y-objectAABB.Mins.y + 0.5f, 0.0f);
        A3DVECTOR3 vPosOut;
        GetA3DViewport()->Transform(vPosIn, vPosOut);
        g_pGame->GetA3DEngine()->GetA3DFlatCollector()->AddRect_2D(
            int(vPosOut.x-20), int(vPosOut.y-5),
            int(vPosOut.x+20), int(vPosOut.y+6),
            0x7F3F007F, vPosOut.z);
        g_pGame->GetA3DEngine()->GetA3DFlatCollector()->Flush();

        ACString number;
        number.Format(L"%u", pObject->GetObjectID());
        g_pGame->GetA3DEngine()->GetSystemFont()->TextOut3D(number, g_Animator.GetA3DViewport(), vPosIn, 0, A3DCOLORRGB(255, 255, 255));
        g_pGame->GetA3DEngine()->GetSystemFont()->Flush();

        if (pObject->GetObjectID())
        {
            pObject->UpdateOrientation();
            A3DQUATERNION qOrientation = pObject->GetOrientation();
            A3DVECTOR3 aFrustum[8];
            for (unsigned int i=0; i<8; ++i)
            {
                aFrustum[i] = qOrientation ^ m_aFrustum[i];
                aFrustum[i] += vPos;
            }
            g_pGame->GetA3DEngine()->GetA3DWireCollector()->Add3DLine(aFrustum[0], aFrustum[1], A3DCOLORRGB(255, 0, 255));
            g_pGame->GetA3DEngine()->GetA3DWireCollector()->Add3DLine(aFrustum[1], aFrustum[2], A3DCOLORRGB(255, 0, 255));
            g_pGame->GetA3DEngine()->GetA3DWireCollector()->Add3DLine(aFrustum[2], aFrustum[3], A3DCOLORRGB(255, 0, 255));
            g_pGame->GetA3DEngine()->GetA3DWireCollector()->Add3DLine(aFrustum[3], aFrustum[0], A3DCOLORRGB(255, 0, 255));
        
            g_pGame->GetA3DEngine()->GetA3DWireCollector()->Add3DLine(aFrustum[0], aFrustum[4], A3DCOLORRGB(255, 0, 255));
            g_pGame->GetA3DEngine()->GetA3DWireCollector()->Add3DLine(aFrustum[1], aFrustum[5], A3DCOLORRGB(255, 0, 255));
            g_pGame->GetA3DEngine()->GetA3DWireCollector()->Add3DLine(aFrustum[2], aFrustum[6], A3DCOLORRGB(255, 0, 255));
            g_pGame->GetA3DEngine()->GetA3DWireCollector()->Add3DLine(aFrustum[3], aFrustum[7], A3DCOLORRGB(255, 0, 255));
        
            g_pGame->GetA3DEngine()->GetA3DWireCollector()->Add3DLine(aFrustum[4], aFrustum[5], A3DCOLORRGB(0, 255, 0));
            g_pGame->GetA3DEngine()->GetA3DWireCollector()->Add3DLine(aFrustum[5], aFrustum[6], A3DCOLORRGB(255, 0, 255));
            g_pGame->GetA3DEngine()->GetA3DWireCollector()->Add3DLine(aFrustum[6], aFrustum[7], A3DCOLORRGB(0, 0, 255));
            g_pGame->GetA3DEngine()->GetA3DWireCollector()->Add3DLine(aFrustum[7], aFrustum[4], A3DCOLORRGB(255, 0, 255));

            A3DVECTOR3 vCenter = pObject->GetPos();
            g_pGame->GetA3DEngine()->GetA3DWireCollector()->Add3DLine(vCenter - A3DVECTOR3(objectAABB.Extents.x, 0.0f, 0.0f),
                                                                      vCenter + A3DVECTOR3(objectAABB.Extents.x, 0.0f, 0.0f),
                                                                      A3DCOLORRGB(255, 0, 0));
            g_pGame->GetA3DEngine()->GetA3DWireCollector()->Add3DLine(vCenter - A3DVECTOR3(0.0f, objectAABB.Extents.y, 0.0f),
                                                                      vCenter + A3DVECTOR3(0.0f, objectAABB.Extents.y, 0.0f),
                                                                      A3DCOLORRGB(0, 255, 0));
            g_pGame->GetA3DEngine()->GetA3DWireCollector()->Add3DLine(vCenter - A3DVECTOR3(0.0f, 0.0f, objectAABB.Extents.z),
                                                                      vCenter + A3DVECTOR3(0.0f, 0.0f, objectAABB.Extents.z),
                                                                      A3DCOLORRGB(0, 0, 255));
        }
    }
    
    if (m_eState != STATE_PLAYING)
    {
        m_pBezierManager->Render();
        g_pGame->GetA3DEngine()->GetA3DWireCollector()->Flush();
        m_pAxes->Render();
        g_pGame->GetA3DEngine()->GetA3DWireCollector()->Flush();
    }

    /*
    // Render Black border
    A3DVIEWPORTPARAM *pMainView = pViewport->GetParam();
    RECT rect;
    rect.left = pMainView->X;
    rect.right = pMainView->Width;
    rect.top = pMainView->Y;
    rect.bottom = pMainView->Height;
    if (pMainView->Height * 16 > pMainView->Width * 9)
    {
        rect.bottom = pMainView->Width * 9 / 16;
        rect.top = (pMainView->Height - rect.bottom) >> 1;
        g_pGame->GetA3DEngine()->GetA3DFlatCollector()->AddRect_2D(0, 0, rect.right, rect.top, 0xFF000000);
        g_pGame->GetA3DEngine()->GetA3DFlatCollector()->AddRect_2D(0, pMainView->Height - rect.top, rect.right, pMainView->Height, 0xFF000000);
        g_pGame->GetA3DEngine()->GetA3DFlatCollector()->Flush();
    }
    else if (pMainView->Height * 16 < pMainView->Width * 9)
    {
        rect.right = pMainView->Height * 16 / 9;
        rect.left = (pMainView->Width - rect.right) >> 1;
        g_pGame->GetA3DEngine()->GetA3DFlatCollector()->AddRect_2D(0, 0, rect.left, rect.bottom, 0xFF000000);
        g_pGame->GetA3DEngine()->GetA3DFlatCollector()->AddRect_2D(pMainView->Width - rect.left, 0, pMainView->Width, rect.bottom, 0xFF000000);
        g_pGame->GetA3DEngine()->GetA3DFlatCollector()->Flush();
    }
    */
}

bool CAnimator::IsReady() const
{
    return m_bAnimatorReady;
}

void CAnimator::MoveFront(const float d)
{
    if (m_eState != STATE_PLAYING || m_bDisableCamera)
    {
        m_pCamera->SetPos(m_pCamera->GetPos() + (d * m_pCamera->GetDir()));
    }
}

void CAnimator::MoveBack(const float d)
{
    if (m_eState != STATE_PLAYING || m_bDisableCamera)
    {
        m_pCamera->SetPos(m_pCamera->GetPos() + (-d * m_pCamera->GetDir()));
    }
}

void CAnimator::MoveLeft(const float d)
{
    if (m_eState != STATE_PLAYING || m_bDisableCamera)
    {
        m_pCamera->SetPos(m_pCamera->GetPos() + (d * m_pCamera->GetLeft()));
    }
}

void CAnimator::MoveRight(const float d)
{
    if (m_eState != STATE_PLAYING || m_bDisableCamera)
    {
        m_pCamera->SetPos(m_pCamera->GetPos() + (-d * m_pCamera->GetLeft()));
    }
}

void CAnimator::MoveUp(const float d)
{
    if (m_eState != STATE_PLAYING || m_bDisableCamera)
    {
        m_pCamera->SetPos(m_pCamera->GetPos() + A3DVECTOR3(0.0f, d, 0.0f));
    }
}

void CAnimator::MoveDown(const float d)
{
    if (m_eState != STATE_PLAYING || m_bDisableCamera)
    {
        m_pCamera->SetPos(m_pCamera->GetPos() + A3DVECTOR3(0.0f, -d, 0.0f));
    }
}

void CAnimator::DegDelta(const float d)
{
    if (m_eState != STATE_PLAYING || m_bDisableCamera)
    {
        GetA3DCamera()->DegDelta(d);
        m_pCamera->UpdateOrientation();
    }
}

void CAnimator::PitchDelta(const float d)
{
    if (m_eState != STATE_PLAYING || m_bDisableCamera)
    {
        GetA3DCamera()->PitchDelta(d);
        m_pCamera->UpdateOrientation();
    }
}

void CAnimator::RollDelta(const float d)
{
    if (m_eState != STATE_PLAYING || m_bDisableCamera)
    {
        A3DVECTOR3 vDir = m_pCamera->GetDir();
        A3DVECTOR3 vUp = m_pCamera->GetUp();
        A3DQUATERNION qOri;
        qOri.ConvertFromAxisAngle(vDir, d);
        vDir = qOri ^ vDir;
        vUp = qOri ^ vUp;
        m_pCamera->SetDirAndUp(vDir, vUp);
    }
}

void CAnimator::AddBezierPoint(const A3DVECTOR3 &v)
{
    CAnmBezier *pBezier = m_pBezierManager->GetSelectedBezier();
    if (pBezier)
    {
        pBezier->AddPoint(v);
    }
}

void CAnimator::Play(bool bFire)
{
    if (m_eAnimationType == TYPE_NORMAL_ANIMATION)
    {
        if (m_bSpecifyTime)
        {
            float nTimeInDay = (float)g_Animator.GetHour() +
                               (float)g_Animator.GetMinute() / 60.0f +
                               (float)g_Animator.GetSecond() / 3600.0f;
            if (GetWorld())
            {
                GetWorld()->SetTimeOfDay(nTimeInDay / 24.0f);
            }
        }

        if (m_bSpecifyWeather)
        {
            A3DRain *pRain = GetWorld()->m_pRain;
            if (pRain)
            {
                if (m_bRain)
                {
                    pRain->StartRain();
                }
                else
                {
                    pRain->Stop();
                }
            }

            A3DSnow *pSnow = GetWorld()->m_pSnow;
            if (pSnow)
            {
                if (m_bSnow)
                {
                    pSnow->StartSnow();
                }
                else
                {
                    pSnow->Stop();
                }
            }
        }
    }

    if (m_eState != STATE_PAUSING)
    {
        m_pActionManager->Prepare();
        SetNowTime(m_dwStartTime);
        m_uiQTEID = 0;
        m_fQTESpeed = 1.0f;
        m_fSpeed = 1.0f;
        m_fTickTime = 0.0f;
        m_fPlayTime = 0.0f;
        ResetPostEffectParam();
    }
    m_eState = STATE_PLAYING;

    if (bFire)
    {
        _FireOnPlay();
    }
}

void CAnimator::JumpTo(const DWORD dwNowTime)
{
    if (dwNowTime >= 0 && GetNowTime() != dwNowTime)
    {
        if (GetNowTime() > dwNowTime)
        {
            Stop();
            Play();
            SetNowTime(dwNowTime);
            Tick(0);
            Pause();
        }
        else
        {
            Play();
            DWORD dwDeltaTime = dwNowTime - GetNowTime();
            SetDialogue(L"");
            SetMaskColor(0x00000000);
            SetMonoColor(0xFFFFFFFF);
            SetMonoColor(0xFF000000);
            SetBlackWhiteType(BWT_NONE);
            SetHideWorldType(0);
            SetNowTime(dwNowTime);
            m_pActionManager->Tick(GetNowTime(), m_pObjectManager);
            m_pObjectManager->Tick(dwDeltaTime);
            Pause();
        }
   }
}

void CAnimator::Pause()
{
    //a_LogOutput(1, "Pause");
    m_eState = STATE_PAUSING;
    m_fTickTime = 0.0f;
}

void CAnimator::Stop(bool bFire)
{
    m_eState = STATE_WAITING;
    m_pActionManager->Reset();
    m_pObjectManager->Reset();
    SetDialogue(L"");
    ResetPostEffectParam();
    m_fTickTime = 0.0f;

    if (bFire)
    {
        _FireOnStop();
    }
}

void CAnimator::StartQTE(const unsigned int uiQTEID, const float speed)
{
    if (uiQTEID)
    {
        m_uiQTEID = uiQTEID;
        m_fQTESpeed = speed;
        _FireOnStartQTE(uiQTEID);
    }
}

void CAnimator::EndQTE(const unsigned int uiQTEID)
{
    if (uiQTEID && m_uiQTEID == uiQTEID)
    {
        m_uiQTEID = 0;
        m_fQTESpeed = 1.0f;
        _FireOnEndQTE(uiQTEID);
    }
}

void CAnimator::SuccessQTE(const unsigned int uiQTEID)
{
    if (uiQTEID && m_uiQTEID == uiQTEID)
    {
        m_uiQTEID = 0;
        m_fQTESpeed = 1.0f;
    }
}

unsigned int CAnimator::GetQTEID() const
{
    return m_uiQTEID;
}

float CAnimator::GetQTESpeed() const
{
    return m_fQTESpeed;
}

A3DEngine* CAnimator::GetA3DEngine() const
{
    return g_pGame->GetA3DEngine();
}

A3DDevice* CAnimator::GetA3DDevice() const
{
    return g_pGame->GetA3DEngine()->GetA3DDevice();
}

A3DCamera* CAnimator::GetA3DCamera() const
{
    return g_pGame->GetViewport()->GetA3DCamera();
}

A3DViewport* CAnimator::GetA3DViewport() const
{
    return g_pGame->GetViewport()->GetA3DViewport();
}

CECWorld* CAnimator::GetWorld() const
{
    if (m_eAnimationType == TYPE_CAMERA_ANIMATION)
    {
        return g_pGame->GetGameRun()->GetWorld();
    }
    return g_pGame->GetGameRun()->GetAnmWorld();
}

CAnmObjectManager* CAnimator::GetObjectManager() const
{
    return m_pObjectManager;
}

CAnmBezierManager* CAnimator::GetBezierManager() const
{
    return m_pBezierManager;
}

CAnmActionManager* CAnimator::GetActionManager() const
{
    return m_pActionManager;
}

CAnmRayTrace* CAnimator::GetRayTrace() const
{
    return m_pRayTrace;
}

CAnmAxes* CAnimator::GetAxes() const
{
    return m_pAxes;
}

SmartCamera* CAnimator::GetSmartCamera() const
{
    return m_pSmartCamera;
}

void CAnimator::SetUseHostPlayer(const bool b)
{
    m_bUseHostPlayer = b;
}

bool CAnimator::IsUseHostPlayer() const
{
    return m_bUseHostPlayer;
}

void CAnimator::SetForceNoSaintCloth(const bool b)
{
    m_bForceNoSaintCloth = b;
}

bool CAnimator::IsForceNoSaintCloth() const
{
    return m_bForceNoSaintCloth;
}

void CAnimator::SetHostPlayerSkinColor(const A3DCOLOR c)
{
    m_HostPlayerSkinColor = c;
}

A3DCOLOR CAnimator::GetHostPlayerSkinColor() const
{
    return m_HostPlayerSkinColor;
}

void CAnimator::SetSpecifyTime(const bool b)
{
    m_bSpecifyTime = b;
}

bool CAnimator::IsSpecifyTime() const
{
    return m_bSpecifyTime;
}

void CAnimator::SetWorldTime(const int hour, const int minute, const int second)
{
    m_iHour = hour % 24;
    m_iMinute = minute % 60;
    m_iSecond = second % 60;
}

int CAnimator::GetHour() const
{
    return m_iHour;
}

int CAnimator::GetMinute() const
{
    return m_iMinute;
}

int CAnimator::GetSecond() const
{
    return m_iSecond;
}

void CAnimator::SetSpecifyWeather(const bool b)
{
    m_bSpecifyWeather = b;
}

bool CAnimator::IsSpecifyWeahter() const
{
    return m_bSpecifyWeather;
}

void CAnimator::SetWeatherRain(const bool b)
{
    m_bRain = b;
}

bool CAnimator::IsRain() const
{
    return m_bRain;
}

void CAnimator::SetWeatherSnow(const bool b)
{
    m_bSnow = b;
}

bool CAnimator::IsSnow() const
{
    return m_bSnow;
}

void CAnimator::SetVolume(DWORD dwVolume)
{
    m_dwVolume = dwVolume;
}

DWORD CAnimator::GetVolume() const
{
    return m_dwVolume;
}

void CAnimator::SetDialogue(const ACString &st)
{
    m_sDialogue = st;
}

ACString CAnimator::GetDialogue() const
{
    return m_sDialogue;
}

void CAnimator::SetMaskColor(const unsigned int color)
{
    m_uiMaskColor = color;
}

unsigned int CAnimator::GetMaskColor() const
{
    return m_uiMaskColor;
}

void CAnimator::SetMonoColor(const unsigned int color)
{
    m_uiMonoColor = color;
}

unsigned int CAnimator::GetMonoColor() const
{
    return m_uiMonoColor;
}

void CAnimator::SetBackgroundColor(const unsigned int color)
{
    m_uiBackgroundColor = color;
}

unsigned int CAnimator::GetBackgroundColor() const
{
    return m_uiBackgroundColor;
}

void CAnimator::SetBlackWhiteType(const BlackWhiteType &bt)
{
    m_eBlackWhiteType = bt;
}

CAnimator::BlackWhiteType CAnimator::GetBlackWhiteType() const
{
    return m_eBlackWhiteType;
}

void CAnimator::SetHideWorldType(const unsigned int t)
{
    m_uiHideWorldType = t;
}

unsigned int CAnimator::GetHideWorldType() const
{
    return m_uiHideWorldType;
}

void CAnimator::EnablePostEffect(const DWORD mask)
{
    m_PostEffectParam.dwPostEffectMask |= mask;
}

void CAnimator::DisablePostEffect(const DWORD mask)
{
    m_PostEffectParam.dwPostEffectMask &= ~mask;
}

const A3DPOST_EFFECT_PARAM& CAnimator::GetPostEffectParam() const
{
    return m_PostEffectParam;
}

void CAnimator::SetPostEffectBloomParam(const A3DPOST_EFFECT_BLOOM_PARAM &param)
{
    m_PostEffectParam.bloomParam = param;
}

void CAnimator::SetPostEffectCCParam(const A3DPOST_EFFECT_CC_PARAM &param)
{
    m_PostEffectParam.ccParam = param;
}

void CAnimator::SetPostEffectDOFParam(const A3DPOST_EFFECT_DOF_PARAM &param)
{
    m_PostEffectParam.dofParam = param;
}

void CAnimator::SetPostEffectGodRayParam(const A3DPOST_EFFECT_GODRAY_PARAM &param)
{
    m_PostEffectParam.godRayParam = param;
}

void CAnimator::SetPostEffectRadialBlurParam(const A3DPOST_EFFECT_RADIUSBLUR_PARAM &param)
{
    m_PostEffectParam.radiusBlurParam = param;
}

void CAnimator::SetPostEffectMotionBlurParam(const A3DPOST_EFFECT_MOTIONBLUR_PARAM &param)
{
    m_PostEffectParam.motionBlurParam = param;
}

void CAnimator::SetPostEffectWarpParam(const A3DPOST_EFFECT_WARP_PARAM &param)
{
    m_PostEffectParam.warpParam = param;
}

void CAnimator::SetPostEffectFullGlowParam(const A3DPOST_EFFECT_FULLGLOW_PARAM &param)
{
    m_PostEffectParam.fullGlowParam = param;
}

void CAnimator::ResetPostEffectParam()
{
    //m_PostEffectParam.dwPostEffectMask = A3DPOST_EFFECT_AA | A3DPOST_EFFECT_FullGlow | A3DPOST_EFFECT_SunMoon | A3DPOST_EFFECT_Flare | A3DPOST_EFFECT_Silhouette;
    m_PostEffectParam.dwPostEffectMask = A3DPOST_EFFECT_Silhouette | A3DPOST_EFFECT_SunMoon | A3DPOST_EFFECT_Flare;

    m_PostEffectParam.bloomParam.fBlurSize = 0.05f;
    m_PostEffectParam.bloomParam.fBrightThreshold = 0.8f;
    m_PostEffectParam.bloomParam.fBrightScale = 0.5f;

    m_PostEffectParam.ccParam.fFactor = 0;
    m_PostEffectParam.ccParam.bUseManualParam1 = false;
    m_PostEffectParam.ccParam.bUseManualParam2 = false;
    m_PostEffectParam.ccParam.szTex1 = "Shaders\\Textures\\ccdefault.dds";
    m_PostEffectParam.ccParam.szTex2 = "Shaders\\Textures\\ccdefault.dds";

    m_PostEffectParam.dofParam.fNearBlur = 0.1f;
    m_PostEffectParam.dofParam.fNearFocus = 1.f;
    m_PostEffectParam.dofParam.fFarFocus = 10.f;
    m_PostEffectParam.dofParam.fFarBlur = 30.f;
    m_PostEffectParam.dofParam.fClampBlurFar = 1.f;

	m_PostEffectParam.godRayParam.fOcclusionDepthRange = 500.f;
	m_PostEffectParam.godRayParam.fBloomScale = 1.2f;
	m_PostEffectParam.godRayParam.fBloomThreshold = 0.37f;
	m_PostEffectParam.godRayParam.fScreenBlendThreshold = 1.0;
	m_PostEffectParam.godRayParam.vBloomTintColor = A3DVECTOR3(1,1,1);
	m_PostEffectParam.godRayParam.fOcclusionDarkness = 0.62f;
	m_PostEffectParam.godRayParam.fVisibleAngle = 1.75f;

    m_PostEffectParam.radiusBlurParam.fBlurCenterX = 0.5f;
    m_PostEffectParam.radiusBlurParam.fBlurCenterY = 0.5f;
    m_PostEffectParam.radiusBlurParam.fBlurLength = 0.2f;
    m_PostEffectParam.radiusBlurParam.fInFocusRadius = 0.2f;
    m_PostEffectParam.radiusBlurParam.fOutFocusRadius = 0.7f;

    m_PostEffectParam.motionBlurParam.fBlurMax = 0.03f;
    m_PostEffectParam.motionBlurParam.fBlurScale = 0.05f;
    m_PostEffectParam.motionBlurParam.fBlurScalePosition = 10.0f;
    m_PostEffectParam.motionBlurParam.fBlurScaleRotation = 5.0f;
    m_PostEffectParam.motionBlurParam.fInFocusDistance = 15.f;
    m_PostEffectParam.motionBlurParam.fOutFocusDistance = 80.f;

    m_PostEffectParam.warpParam.fScale = 0.01f;
    m_PostEffectParam.warpParam.fSpeed = 0.5f;

    m_PostEffectParam.fullGlowParam.fBlurSize = 0.05f;
    m_PostEffectParam.fullGlowParam.fGlowLevel = 0.25f;
    m_PostEffectParam.fullGlowParam.fGlowPower = 0.2f;
    m_PostEffectParam.fullGlowParam.vGlowColor = A3DVECTOR4(0.5f, 0.5f, 0.5f, 0.25f);

    m_PostEffectParam.silhouetteParam.fHardness = 0.06f;
    m_PostEffectParam.silhouetteParam.fBlurDist = 0.35f;
    m_PostEffectParam.silhouetteParam.vLineColor = A3DVECTOR3(0.0f, 0.0f, 0.0f);
}

void CAnimator::SetTotalTime(const DWORD dwTotalTime)
{
    m_dwTotalTime = dwTotalTime;
    m_dwStartTime = 0;
    m_dwNowTime = 0;
    m_dwEndTime = dwTotalTime;
    m_uiQTEID = 0;
    m_fQTESpeed = 1.0f;
    m_fSpeed = 1.0f;
}

DWORD CAnimator::GetTotalTime() const
{
    return m_dwTotalTime;
}

void CAnimator::SetNowTime(const DWORD dwNowTime)
{
    m_dwNowTime = dwNowTime;
}

DWORD CAnimator::GetNowTime() const
{
    return m_dwNowTime;
}

void CAnimator::SetStartTime(const DWORD dwStartTime)
{
    m_dwStartTime = dwStartTime;
}

DWORD CAnimator::GetStartTime() const
{
    return m_dwStartTime;
}

void CAnimator::SetEndTime(const DWORD dwEndTime)
{
    m_dwEndTime = dwEndTime;
}

DWORD CAnimator::GetEndTime() const
{
    return m_dwEndTime;
}

void CAnimator::SetSpeed(const float speed)
{
    m_fSpeed = speed;
}

float CAnimator::GetSpeed() const
{
    return m_fSpeed;
}

CAnimator::AnimatorState CAnimator::GetState() const
{
    return m_eState;
}

float CAnimator::GetPosHeight(const A3DVECTOR3 &vPos) const
{
    A3DVECTOR3 vDir = A3DVECTOR3(0.0f, -1000.0f, 0.0f);
    if (m_pRayTrace->RayTrace(vPos, vDir, CAnmRayTrace::FILTER_TERRAIN))
    {
        return m_pRayTrace->GetHitPos().y;
    }
    return 0.0f;
}

void CAnimator::MoveCamera(const char key, const bool bSlow)
{
    if (!m_bMoveCamera)
    {
        m_bMoveCamera = true;
        m_fMoveCameraSpeed = 2.0f;
    }
    if (bSlow)
    {
        m_fMoveCameraSpeed = 0.1f;
    }

    int nowTime = clock();
    if (m_iMoveLastTime == 0)
    {
        m_iMoveLastTime = nowTime - 1;
    }
    float delta = 0.001f * (nowTime - m_iMoveLastTime);
    m_iMoveLastTime = nowTime;
    float d = m_fMoveCameraSpeed * delta;

    switch (key)
    {
        case 'W':
        case 'w':
        {
            MoveFront(d);
            break;
        }
        case 'S':
        case 's':
        {
            MoveBack(d);
            break;
        }
        case 'A':
        case 'a':
        {
            MoveLeft(d);
            break;
        }
        case 'D':
        case 'd':
        {
            MoveRight(d);
            break;
        }
        case 'Q':
        case 'q':
        {
            MoveDown(d);
            break;
        }
        case 'E':
        case 'e':
        {
            MoveUp(d);
            break;
        }
        case 'Z':
        case 'z':
        {
            RollDelta(0.1f * d);
            break;
        }
        case 'X':
        case 'x':
        {
            RollDelta(-0.1f * d);
            break;
        }
        default:
            break;
    }
}

void CAnimator::StopCamera()
{
    m_bMoveCamera = false;
    m_fMoveCameraSpeed = 1.0f;
    m_iMoveLastTime = 0;
}

void CAnimator::DisableCamera(const bool b)
{
    m_bDisableCamera = b;
}

bool CAnimator::IsDisabledCamera() const
{
    return m_bDisableCamera;
}

void CAnimator::BindCamera(const bool b)
{
    m_bBindCamera = b;
}

bool CAnimator::IsBindCamera() const
{
    if (m_bBindCamera && m_pObjectManager)
    {
        CAnmObject *pObject = m_pObjectManager->GetSelectedObject();
        if (pObject && pObject->GetObjectID())
        {
            return true;
        }
    }
    return false;
}

void CAnimator::SetBindCameraOffset(const A3DVECTOR3 &v)
{
    m_vBindCameraOffset = v;
}

A3DVECTOR3 CAnimator::GetBindCameraOffset() const
{
    return m_vBindCameraOffset;
}

void CAnimator::MoveWorldOffset(const A3DVECTOR3 &v)
{
    if (m_pBezierManager)
    {
        m_pBezierManager->MoveAllBezier(v);
    }
    if (m_pActionManager)
    {
        m_pActionManager->MoveWorldOffset(v);
    }
}

bool CAnimator::LoadWorld(int idInst, A3DVECTOR3 vHostPos)
{
    m_eState = STATE_WAITING;
    m_iWorldInstance = idInst;
    m_pCamera->SetPos(vHostPos);
    g_pGame->GetGameRun()->StartAnimation(idInst, vHostPos);
    return true;
}

bool CAnimator::LoadFile(const wchar_t *szFile, A3DVECTOR3 vHostPos)
{
    m_eAnimationType = TYPE_NORMAL_ANIMATION;
    bool res = m_pTranslator->LoadFile(szFile, vHostPos);
    if (res)
    {
        Play();
        Tick(1);
        Stop();
    }
    else
    {
        a_LogOutput(1, "CAnimator::LoadFile: Failed to animation file!");
    }
    return res;
}

bool CAnimator::LoadCameraAnimationFile(const wchar_t *szFile, A3DVECTOR3 vHostPos)
{
    m_eAnimationType = TYPE_CAMERA_ANIMATION;
    bool res = m_pTranslator->LoadFile(szFile, vHostPos);
    if (res)
    {
        Play();
        Tick(1);
        Stop();
    }
    else
    {
        a_LogOutput(1, "CAnimator::LoadCameraAnimationFile: Failed to camera animation file!");
    }
    return res;
}

int CAnimator::GetWorldInstance() const
{
    return m_iWorldInstance;
}

void CAnimator::SetHostPlayerModel(CECModel *pModel)
{
    if (m_bUseHostPlayer && m_pPlayer && pModel)
    {
        m_pPlayer->SetHostPlayerModel(pModel);
    }
}

bool CAnimator::SaveFile(const wchar_t *szFile)
{
    return m_pTranslator->SaveFile(szFile);
}

bool CAnimator::ImportActionGroup(const wchar_t *szFile)
{
    return m_pTranslator->ImportActionGroup(szFile);
}

bool CAnimator::ExportActionGroup(const wchar_t *szFile, CAnmActionGroup *pActionGroup)
{
    return m_pTranslator->ExportActionGroup(szFile, pActionGroup);
}

CAnimator::~CAnimator()
{
    Release();
    ClearListeners();
    delete m_pTranslator;
    delete m_pRayTrace;
}

bool CAnimator::TickSmartCamera(DWORD dwDeltaTime)
{
    if (m_pSmartCamera && m_pSmartCamera->IsPlaying())
    {
        m_pSmartCamera->Tick(dwDeltaTime);
        if (m_pCamera)
        {
            m_pCamera->SetPos(m_pSmartCamera->GetPos());
            m_pCamera->SetDirAndUp(m_pSmartCamera->GetDir(), m_pSmartCamera->GetUp());
            m_pCamera->SetFOV(m_pSmartCamera->GetFOV());
        }
        return true;
    }
    return false;
}

void CAnimator::FormatCameraPos()
{
    CECWorld *pWorld = GetWorld();
    if (pWorld)
    {
        A3DVECTOR3 pos = m_pCamera->GetPos();
        A3DTerrain2 *pTerrain = pWorld->GetTerrain();
        if (pTerrain)
        {
            float h = pTerrain->GetPosHeight(pos);
            if (pos.y < h + 0.0f)
            {
                pos.y = h + 0.0f;
                m_pCamera->SetPos(pos);
            }
        }
    }
}

void CAnimator::_FireOnPlay()
{
    ListenersIterator it, iend;
    iend = m_Listeners.end();
    for (it=m_Listeners.begin(); it!=iend; ++it)
    {
        if ((*it)) (*it)->OnPlayAnimation(this);
    }
}

void CAnimator::_FireOnStop()
{
    ListenersIterator it, iend;
    iend = m_Listeners.end();
    for (it=m_Listeners.begin(); it!=iend; ++it)
    {
        if ((*it)) (*it)->OnStopAnimation(this);
    }
}

void CAnimator::_FireOnStartQTE(const unsigned int uiQTEID)
{
    ListenersIterator it, iend;
    iend = m_Listeners.end();
    for (it=m_Listeners.begin(); it!=iend; ++it)
    {
        if ((*it)) (*it)->OnStartAnimationQTE(this, uiQTEID);
    }
}

void CAnimator::_FireOnEndQTE(const unsigned int uiQTEID)
{
    ListenersIterator it, iend;
    iend = m_Listeners.end();
    for (it=m_Listeners.begin(); it!=iend; ++it)
    {
        if ((*it)) (*it)->OnEndAnimationQTE(this, uiQTEID);
    }
}
