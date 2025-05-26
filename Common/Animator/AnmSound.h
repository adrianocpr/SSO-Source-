#ifndef _ANM_SOUND_H_
#define _ANM_SOUND_H_

#include <EC_AudioSystem.h>
#include "Animator/AnmAction.h"

class CAnmSound : public CAnmAction
{
    public:
        explicit CAnmSound(const unsigned int uiID);

        void SetTotalFrames(const int iFrame);

        int GetTotalFrames() const;

        void SetStartSeconds(const int iSconds);

        int GetStartSeconds() const;

        void SetSoundFileName(const ACString &name);

        ACString GetSoundFileName() const;

        ACString GetSoundEventName() const;

        void SetVolume(const DWORD volume);

        DWORD GetVolume() const;

        virtual ActionType GetActionType() const;

        virtual void CopyDataFrom(CAnmAction *pAction);

        virtual bool Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager);

        virtual DWORD GetTotalTime() const;

        virtual void Reset();

        virtual ~CAnmSound();

    private:
        CAnmSound();

    private:
        int m_iTotalFrames;
        int m_iStartSeconds;
        ACString m_sSoundFileName;
        DWORD m_dwVolume;
        //AMSoundStream *m_pSoundStream;
        AudioEngine::Event* m_pEvent;
        AudioEngine::EventInstance* m_pEventInstance;
        bool m_bStartAction;
};

#endif
