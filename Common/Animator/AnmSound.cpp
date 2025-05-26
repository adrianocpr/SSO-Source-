#include "stdafx.h"
#include "EC_Game.h"
#include "Animator/AnmSound.h"
#include "Animator/Animator.h"

CAnmSound::CAnmSound(const unsigned int uiID)
    : CAnmAction(uiID)
{
    m_iTotalFrames = 1;
    m_iStartSeconds = 0;
    m_sSoundFileName;
    m_dwVolume = 100;
    m_pEvent = 0;
    m_pEventInstance = 0;
    //m_pSoundStream = new AMSoundStream;
    //m_pSoundStream->Init(g_Animator.GetA3DEngine()->GetAMEngine()->GetAMSoundEngine(), NULL);
    m_bStartAction = false;
}

void CAnmSound::SetTotalFrames(const int iFrame)
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

int CAnmSound::GetTotalFrames() const
{
    return m_iTotalFrames;
}

void CAnmSound::SetStartSeconds(const int iSeconds)
{
    m_iStartSeconds = iSeconds;
}

int CAnmSound::GetStartSeconds() const
{
    return m_iStartSeconds;
}

void CAnmSound::SetSoundFileName(const ACString &name)
{
    m_sSoundFileName = name;
}

ACString CAnmSound::GetSoundFileName() const
{
    return m_sSoundFileName;
}

ACString CAnmSound::GetSoundEventName() const
{
    if (m_sSoundFileName != _AL(""))
    {
        CECAudioSystem *pAuaioSystem = g_pGame->GetAudioSystem();
        if (pAuaioSystem)
        {
            AudioEngine::EventSystem* pEventSystem = pAuaioSystem->GetEventSystem();
            if (pEventSystem)
            {
                AudioEngine::Event *pEvent = pEventSystem->GetEvent(WC2AS(m_sSoundFileName));
                if (pEvent)
                {
                    return AS2WC(pEvent->GetName());
                }
            }
        }
    }
    return _AL("");
}

void CAnmSound::SetVolume(const DWORD volume)
{
    m_dwVolume = volume;
}

DWORD CAnmSound::GetVolume() const
{
    return m_dwVolume;
}

CAnmAction::ActionType CAnmSound::GetActionType() const
{
    return CAnmAction::TYPE_SOUND;
}

void CAnmSound::CopyDataFrom(CAnmAction *pAction)
{
    CAnmSound *pDataAction = dynamic_cast<CAnmSound*>(pAction);
    if (pDataAction)
    {
        SetSoundFileName(pDataAction->GetSoundFileName());
        SetStartSeconds(pDataAction->GetStartSeconds());
        SetVolume(pDataAction->GetVolume());
        SetTotalFrames(pDataAction->GetTotalFrames());
    }
}

bool CAnmSound::Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager)
{
    if (IsDead())
    {
        return false;
    }

    DWORD dT = dwNowTime - m_dwStartTime;
    DWORD dwTotalTime = GetTotalTime();
    if (dwNowTime >= m_dwStartTime)
    {
        if (dT < dwTotalTime)
        {
            if (!m_bStartAction && m_sSoundFileName != _AL(""))
            {
                CECAudioSystem *pAuaioSystem = g_pGame->GetAudioSystem();
                if (pAuaioSystem)
                {
                    AudioEngine::EventSystem* pEventSystem = pAuaioSystem->GetEventSystem();
                    if (pEventSystem)
                    {
                        m_pEvent = pEventSystem->GetEvent(WC2AS(m_sSoundFileName));
                        if (m_pEvent)
                        {
                            m_pEventInstance = m_pEvent->CreateInstance(false);
                            if (m_pEventInstance)
                            {
                                float fVolume = 0.01f * m_dwVolume;
                                m_pEventInstance->Enable3DCone(false);
                                m_pEventInstance->SetVolume(fVolume);
                                m_pEventInstance->Start();
                                m_pEventInstance->SetCurrentChannelPosition(m_iStartSeconds * dT);
                            }
                        }
                    }
                }
                m_bStartAction = true;
            }

            if (m_bStartAction && m_iStartSeconds > 0)
            {
                if (m_pEventInstance)
                {
                    unsigned int iMillisecond = 0;
                    if (m_pEventInstance->GetCurrentChannelPosition(iMillisecond))
                    {
                        if (iMillisecond > m_iStartSeconds + dT + 200)
                        {
                            m_pEventInstance->SetCurrentChannelPosition(m_iStartSeconds + dT);
                        }
                    }
                }
            }
            /*
            if (!m_bStartAction && m_sSoundFileName != _AL(""))
            {
                if (m_pSoundStream)
                {
                    m_pSoundStream->Stop();
                }
                m_pSoundStream->SetLoopFlag(false);
				AString strFile = WC2AS(m_sSoundFileName);
				char* chFile = strFile.GetBuffer(256);
                m_pSoundStream->Play(chFile);
				strFile.ReleaseBuffer();
                DWORD samplesPerSec = m_pSoundStream->GetStreamDesc().wfxFormat.nSamplesPerSec;
                int nSample = (m_iStartSeconds + int(dT)) * samplesPerSec / 1000;
                if (DWORD(nSample) < m_pSoundStream->GetDataSize())
                {
                    m_pSoundStream->Seek(nSample);
                }
                m_bStartAction = true;
            }
            */
        }
        else
        {
            if (m_pEvent && m_pEventInstance)
            {
                m_pEventInstance->Stop(true);
                m_pEvent->DestroyInstance(m_pEventInstance);
                m_pEvent = 0;
                m_pEventInstance = 0;
            }
            /*
            if (m_pSoundStream)
            {
                m_pSoundStream->Stop();
            }
            */
        }

        /*
        if (m_pSoundStream)
        {
            DWORD dwVolume = g_Animator.GetVolume();
            dwVolume = DWORD(0.01f * float(m_dwVolume * dwVolume));
            m_pSoundStream->SetVolume(dwVolume);
        }
        */
    }

    if (dT >= dwTotalTime)
    {
        m_bDead = true;
    }
    return IsDead();
}

DWORD CAnmSound::GetTotalTime() const
{
    return TIME_PER_FRAME * m_iTotalFrames;
}

void CAnmSound::Reset()
{
    CAnmAction::Reset();
    m_bStartAction = false;
    if (m_pEvent)
    {
        if (m_pEventInstance)
        {
            m_pEventInstance->Stop(true);
            m_pEvent->DestroyInstance(m_pEventInstance);
            m_pEvent = 0;
            m_pEventInstance = 0;
        }
    }
    /*
    if (m_pSoundStream)
    {
        m_pSoundStream->Stop();
    }
    */
}

CAnmSound::~CAnmSound()
{
    Reset();
    /*
    if (m_pSoundStream)
    {
        m_pSoundStream->Release();
        delete m_pSoundStream;
        m_pSoundStream = 0;
    }
    */
}
