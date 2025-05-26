#ifndef _ANM_PLAYER_H_
#define _ANM_PLAYER_H_

#include "Animator/AnmNPC.h"

class CAnmPlayer : public CAnmNPC
{
    public:
        CAnmPlayer();

        void SetHostPlayerModel(CECModel *pModel);

        virtual bool IsPlayer() const { return true; }

        virtual ~CAnmPlayer();

    private:
        bool m_bUseHostPlayer;
};

#endif
