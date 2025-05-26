#ifndef _ANM_CC_H_
#define _ANM_CC_H_

#include "Animator/AnmAction.h"

class CAnmCC : public CAnmAction
{
    public:
        explicit CAnmCC(const unsigned int uiID);

        void SetStartFactor(const float f);
        
        float GetStartFactor() const;

        void SetEndFactor(const float f);
        
        float GetEndFactor() const;

        void SetTex1Path(const ACString &path);

        ACString GetTex1Path() const;

        void SetTex2Path(const ACString &path);

        ACString GetTex2Path() const;

        void SetTotalFrames(const int iFrame);

        int GetTotalFrames() const;

        virtual ActionType GetActionType() const;

        virtual void CopyDataFrom(CAnmAction *pAction);

        virtual bool Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager);

        virtual DWORD GetTotalTime() const;

        virtual ~CAnmCC();

    private:
        CAnmCC();

    private:
        float m_fStartFactor;
        float m_fEndFactor;
        ACString m_sTex1;
        ACString m_sTex2;
        int m_iTotalFrames;
};

#endif
