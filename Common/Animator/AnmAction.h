#ifndef _ANM_ACTION_H_
#define _ANM_ACTION_H_

#include "Animator/AnmObjectManager.h"

class CAnmAction
{
    public:
        enum ActionType
        {
            TYPE_MOVE = 0,
            TYPE_JUMP,
            TYPE_BEZIER_MOVE,
            TYPE_MOTION,
            TYPE_DISPLAY_HIDE,
            TYPE_DIALOGUE,
            TYPE_SOUND,
            TYPE_HOOK,
            TYPE_SPEED_CONTROL,
            TYPE_SCALE,
            TYPE_CAMERA_FILTER,
            TYPE_CAMERA_OSCILLATORY,
            TYPE_TRANSPARENT,
            TYPE_HIDE_WORLD_ACTION,
            TYPE_ROTATE,
            TYPE_FOV,
            TYPE_BLOOM,
            TYPE_DOF,
            TYPE_RADIAL_BLUR,
            TYPE_MOTION_BLUR,
            TYPE_WARP,
            TYPE_CC,
            TYPE_ADD_SKIN,
            TYPE_GOD_RAY,
            TYPE_QTE,
        };

        static const int TIME_PER_FRAME;

    public:
        explicit CAnmAction(const unsigned int uiID);

        unsigned int GetActionID() const;

        bool IsDead() const;

        void SetDead(const bool b);

        void BindObjectID(const unsigned int uiID);

        unsigned int GetObjectID() const;

        void SetStartTime(const DWORD dwTime);

        DWORD GetStartTime() const;

        virtual void MoveWorldOffset(const A3DVECTOR3 &v) {}

        virtual ActionType GetActionType() const = 0;

        virtual void CopyDataFrom(CAnmAction *pAction) = 0;

        virtual bool Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager) = 0;

        virtual DWORD GetTotalTime() const = 0;

        virtual void Reset();

        virtual ~CAnmAction();

    private:
        CAnmAction();

    public:
        static float Lerp(const float start, const float end, const float u);

    protected:
        unsigned int m_uiActionID;
        unsigned int m_uiObjectID;
        DWORD m_dwStartTime;
        bool m_bDead;
};

#endif
