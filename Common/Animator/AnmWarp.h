#ifndef _ANM_WARP_H_
#define _ANM_WARP_H_

#include <ElementRender.h>
#include "Animator/AnmAction.h"

class CAnmWarp : public CAnmAction
{
    public:
        explicit CAnmWarp(const unsigned int uiID);

        void SetStartScale(const float f);

        float GetStartScale() const;

        void SetEndScale(const float f);

        float GetEndScale() const;

        void SetStartSpeed(const float f);

        float GetStartSpeed() const;

        void SetEndSpeed(const float f);

        float GetEndSpeed() const;

        void SetEnableMask(const bool b);

        bool GetEnableMask() const;

        void SetMaskPath(const ACString &path);

        ACString GetMaskPath() const;

        void SetTotalFrames(const int iFrame);

        int GetTotalFrames() const;

        virtual ActionType GetActionType() const;

        virtual void CopyDataFrom(CAnmAction *pAction);

        virtual bool Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager);

        virtual DWORD GetTotalTime() const;

        virtual ~CAnmWarp();

    private:
        CAnmWarp();

    private:
        A3DPOST_EFFECT_WARP_PARAM m_StartWarp;
        A3DPOST_EFFECT_WARP_PARAM m_EndWarp;
        float m_fStartScale;
        float m_fEndScale;
        float m_fStartSpeed;
        float m_fEndSpeed;
        bool m_bEnableMask;
        ACString m_sMask;
        int m_iTotalFrames;
};

#endif
