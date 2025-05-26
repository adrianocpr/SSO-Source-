#ifndef _ANM_FOV_H_
#define _ANM_FOV_H_

#include "Animator/AnmAction.h"

class CAnmFOV : public CAnmAction
{
    public:
        explicit CAnmFOV(const unsigned int uiID);

        void SetStartFOV(const float fov);
        
        float GetStartFOV() const;

        void SetEndFOV(const float fov);
        
        float GetEndFOV() const;

        void SetTotalFrames(const int iFrame);

        int GetTotalFrames() const;

        virtual ActionType GetActionType() const;

        virtual void CopyDataFrom(CAnmAction *pAction);

        virtual bool Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager);

        virtual DWORD GetTotalTime() const;

        virtual ~CAnmFOV();

    private:
        CAnmFOV();

    private:
        float m_fStartFOV;
        float m_fEndFOV;
        int m_iTotalFrames;
};

#endif
