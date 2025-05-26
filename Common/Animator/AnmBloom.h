#ifndef _ANM_BLOOM_H_
#define _ANM_BLOOM_H_

#include <ElementRender.h>
#include "Animator/AnmAction.h"

class CAnmBloom : public CAnmAction
{
    public:
        explicit CAnmBloom(const unsigned int uiID);

        void SetStartBloom(const A3DPOST_EFFECT_BLOOM_PARAM &bloom);
        
        A3DPOST_EFFECT_BLOOM_PARAM GetStartBloom() const;

        void SetEndBloom(const A3DPOST_EFFECT_BLOOM_PARAM &bloom);
        
        A3DPOST_EFFECT_BLOOM_PARAM GetEndBloom() const;

        void SetTotalFrames(const int iFrame);

        int GetTotalFrames() const;

        virtual ActionType GetActionType() const;

        virtual void CopyDataFrom(CAnmAction *pAction);

        virtual bool Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager);

        virtual DWORD GetTotalTime() const;

        virtual ~CAnmBloom();

    private:
        CAnmBloom();

    private:
        A3DPOST_EFFECT_BLOOM_PARAM m_StartBloom;
        A3DPOST_EFFECT_BLOOM_PARAM m_EndBloom;
        int m_iTotalFrames;
};

#endif
