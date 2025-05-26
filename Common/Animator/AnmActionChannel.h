#ifndef _ANM_ACTION_CHANNEL_H_
#define _ANM_ACTION_CHANNEL_H_

#include "Animator/AnmMove.h"
#include "Animator/AnmRotate.h"
#include "Animator/AnmScale.h"
#include "Animator/AnmFOV.h"
#include "Animator/AnmTransparent.h"
#include "Animator/AnmMotion.h"
#include "Animator/AnmJump.h"
#include "Animator/AnmBezierMove.h"
#include "Animator/AnmDisplayHide.h"
#include "Animator/AnmDialogue.h"
#include "Animator/AnmSound.h"
#include "Animator/AnmHook.h"
#include "Animator/AnmSpeedControl.h"
#include "Animator/AnmCameraFilter.h"
#include "Animator/AnmCameraOscillatory.h"
#include "Animator/AnmHideWorldAction.h"
#include "Animator/AnmBloom.h"
#include "Animator/AnmDOF.h"
#include "Animator/AnmRadialBlur.h"
#include "Animator/AnmMotionBlur.h"
#include "Animator/AnmWarp.h"
#include "Animator/AnmCC.h"
#include "Animator/AnmAddSkin.h"
#include "Animator/AnmGodRay.h"
#include "Animator/AnmQTE.h"
#include <map>
#include <vector>

class CAnmActionChannel
{
    public:
        explicit CAnmActionChannel(const unsigned int uiID);

        void SetChannelID(const unsigned int uiID);

        unsigned int GetChannelID() const;

        void BindObjectID(const unsigned int uiID);

        unsigned int GetObjectID() const;

        void SetChannelName(const ACString name);

        ACString GetChannelName() const;

        void CreateAction(const unsigned int uiID, const CAnmAction::ActionType type);

        unsigned int CreateAction(const CAnmAction::ActionType type);

        int GetActionsCount(const DWORD dwStartTime, const DWORD dwEndTime);

        void MoveActions(const DWORD dwStartTime, const DWORD dwEndTime, const DWORD dwOffset, const bool left=false);

        void MoveWorldOffset(const A3DVECTOR3 &v);

        void DeleteAction(const unsigned int uiID);

        CAnmAction* GetAction(const unsigned int uiID);

        void GetActionIDList(std::vector<unsigned int> &vList);

        int GetActionAmount() const;

        unsigned int GetChannelType() const;

        void CopyDataFrom(CAnmActionChannel *pChannel);

        void Reset();

        bool Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager);

        ~CAnmActionChannel();

    private:
        CAnmActionChannel() {}

    private:
        unsigned int m_uiChannelID;
        unsigned int m_uiObjectID;
        ACString m_sChannelName;
        std::map<unsigned int, CAnmAction*> m_mActionMap;
};

#endif
