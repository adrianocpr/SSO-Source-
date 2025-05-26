#ifndef _ANM_DISPLAY_HIDE_H_
#define _ANM_DISPLAY_HIDE_H_

#include "Animator/AnmAction.h"

class CAnmDisplayHide : public CAnmAction
{
    public:
        enum VisableType
        {
            VT_HIDE = 0,
            VT_DISPLAY,
        };

    public:
        explicit CAnmDisplayHide(const unsigned int uiID);

        void SetVisableType(const VisableType &vt);

        VisableType GetVisableType() const;

        virtual ActionType GetActionType() const;

        virtual void CopyDataFrom(CAnmAction *pAction);

        virtual bool Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager);

        virtual DWORD GetTotalTime() const;

        virtual ~CAnmDisplayHide();

    private:
        CAnmDisplayHide();

    private:
        VisableType m_eVisableType;
};

#endif
