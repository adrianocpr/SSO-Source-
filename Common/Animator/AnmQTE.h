#ifndef _ANM_QTE_H_
#define _ANM_QTE_H_

#include "Animator/AnmAction.h"

class CAnmQTE : public CAnmAction
{
    public:
        explicit CAnmQTE(const unsigned int uiID);

        void SetTotalFrames(const int iFrame);

        int GetTotalFrames() const;

        void SetQTEID(const unsigned int uiQTEID);

        unsigned int GetQTEID() const;

        void SetSpeed(const float speed);

        float GetSpeed() const;

        virtual ActionType GetActionType() const;

        virtual void CopyDataFrom(CAnmAction *pAction);

        virtual bool Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager);

        virtual DWORD GetTotalTime() const;

        virtual void Reset();

        virtual ~CAnmQTE();

    private:
        CAnmQTE();

    private:
        bool m_bFired;
        unsigned int m_uiQTEID;
        float m_fSpeed;
        int m_iTotalFrames;
};

#endif
