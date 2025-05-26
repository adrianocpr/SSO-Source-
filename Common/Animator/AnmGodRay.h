#ifndef _ANM_GOD_RAY_H_
#define _ANM_GOD_RAY_H_

#include <ElementRender.h>
#include "Animator/AnmAction.h"

class CAnmGodRay : public CAnmAction
{
    public:
        explicit CAnmGodRay(const unsigned int uiID);

        void SetStartGodRay(const A3DPOST_EFFECT_GODRAY_PARAM &godRay);
        
        A3DPOST_EFFECT_GODRAY_PARAM GetStartGodRay() const;

        void SetEndGodRay(const A3DPOST_EFFECT_GODRAY_PARAM &godRay);
        
        A3DPOST_EFFECT_GODRAY_PARAM GetEndGodRay() const;

        void SetTotalFrames(const int iFrame);

        int GetTotalFrames() const;

        virtual ActionType GetActionType() const;

        virtual void CopyDataFrom(CAnmAction *pAction);

        virtual bool Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager);

        virtual DWORD GetTotalTime() const;

        virtual ~CAnmGodRay();

    private:
        CAnmGodRay();

    private:
        A3DPOST_EFFECT_GODRAY_PARAM m_StartGodRay;
        A3DPOST_EFFECT_GODRAY_PARAM m_EndGodRay;
        int m_iTotalFrames;
};

#endif
