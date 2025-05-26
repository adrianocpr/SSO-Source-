#ifndef _ANM_MotionBlur_H_
#define _ANM_MotionBlur_H_

#include <ElementRender.h>
#include "Animator/AnmAction.h"

class CAnmMotionBlur : public CAnmAction
{
    public:
        explicit CAnmMotionBlur(const unsigned int uiID);

        void SetStartMotionBlur(const A3DPOST_EFFECT_MOTIONBLUR_PARAM &motionBlur);
        
        A3DPOST_EFFECT_MOTIONBLUR_PARAM GetStartMotionBlur() const;

        void SetEndMotionBlur(const A3DPOST_EFFECT_MOTIONBLUR_PARAM &motionBlur);
        
        A3DPOST_EFFECT_MOTIONBLUR_PARAM GetEndMotionBlur() const;

        void SetTotalFrames(const int iFrame);

        int GetTotalFrames() const;

        virtual ActionType GetActionType() const;

        virtual void CopyDataFrom(CAnmAction *pAction);

        virtual bool Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager);

        virtual DWORD GetTotalTime() const;

        virtual ~CAnmMotionBlur();

    private:
        CAnmMotionBlur();

    private:
        A3DPOST_EFFECT_MOTIONBLUR_PARAM m_StartMotionBlur;
        A3DPOST_EFFECT_MOTIONBLUR_PARAM m_EndMotionBlur;
        int m_iTotalFrames;
};

#endif
