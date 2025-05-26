#ifndef _ANM_RADIAL_BLUR_H_
#define _ANM_RADIAL_BLUR_H_

#include <ElementRender.h>
#include "Animator/AnmAction.h"

class CAnmRadialBlur : public CAnmAction
{
    public:
        explicit CAnmRadialBlur(const unsigned int uiID);

        void SetStartRadialBlur(const A3DPOST_EFFECT_RADIUSBLUR_PARAM &RadialBlur);
        
        A3DPOST_EFFECT_RADIUSBLUR_PARAM GetStartRadialBlur() const;

        void SetEndRadialBlur(const A3DPOST_EFFECT_RADIUSBLUR_PARAM &RadialBlur);
        
        A3DPOST_EFFECT_RADIUSBLUR_PARAM GetEndRadialBlur() const;

        void SetTotalFrames(const int iFrame);

        int GetTotalFrames() const;

        virtual ActionType GetActionType() const;

        virtual void CopyDataFrom(CAnmAction *pAction);

        virtual bool Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager);

        virtual DWORD GetTotalTime() const;

        virtual ~CAnmRadialBlur();

    private:
        CAnmRadialBlur();

    private:
        A3DPOST_EFFECT_RADIUSBLUR_PARAM m_StartRadialBlur;
        A3DPOST_EFFECT_RADIUSBLUR_PARAM m_EndRadialBlur;
        int m_iTotalFrames;
};

#endif
