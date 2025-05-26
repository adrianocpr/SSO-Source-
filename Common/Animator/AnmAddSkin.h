#ifndef _ANM_ADD_SKIN_H_
#define _ANM_ADD_SKIN_H_

#include "Animator/AnmAction.h"

class CAnmAddSkin : public CAnmAction
{
    public:
        explicit CAnmAddSkin(const unsigned int uiID);

        void SetSkinPath(const ACString &path);

        ACString GetSkinPath() const;

        void SetTotalFrames(const int iFrame);

        int GetTotalFrames() const;

        virtual ActionType GetActionType() const;

        virtual void CopyDataFrom(CAnmAction *pAction);

        virtual bool Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager);

        virtual DWORD GetTotalTime() const;

        virtual void Reset();

        virtual ~CAnmAddSkin();

    private:
        CAnmAddSkin();

    private:
        ACString m_sSkinPath;
        int m_iSkinIndex;
        int m_iTotalFrames;
};

#endif
