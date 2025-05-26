#ifndef _ANM_DOF_H_
#define _ANM_DOF_H_

#include <ElementRender.h>
#include "Animator/AnmAction.h"

class CAnmDOF : public CAnmAction
{
    public:
        explicit CAnmDOF(const unsigned int uiID);

        void SetStartDOF(const A3DPOST_EFFECT_DOF_PARAM &DOF);
        
        A3DPOST_EFFECT_DOF_PARAM GetStartDOF() const;

        void SetEndDOF(const A3DPOST_EFFECT_DOF_PARAM &DOF);
        
        A3DPOST_EFFECT_DOF_PARAM GetEndDOF() const;

        void SetTotalFrames(const int iFrame);

        int GetTotalFrames() const;

        virtual ActionType GetActionType() const;

        virtual void CopyDataFrom(CAnmAction *pAction);

        virtual bool Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager);

        virtual DWORD GetTotalTime() const;

        virtual ~CAnmDOF();

    private:
        CAnmDOF();

    private:
        A3DPOST_EFFECT_DOF_PARAM m_StartDOF;
        A3DPOST_EFFECT_DOF_PARAM m_EndDOF;
        int m_iTotalFrames;
};

#endif
