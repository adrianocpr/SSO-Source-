#ifndef _ANM_CAMERA_FILTER_H_
#define _ANM_CAMERA_FILTER_H_

#include "Animator/AnmAction.h"

class CAnmCameraFilter : public CAnmAction
{
    public:
        enum AnmFilterType
        {
            FILTER_TYPE_SOLID = 0,
            FILTER_TYPE_TWEENING_SOLID,
            FILTER_TYPE_TWEENING_TRANSPARENT,
            FILTER_TYPE_SLOW_BLACK_WHITE,
            FILTER_TYPE_FAST_BLACK_WHITE,
        };

    public:
        explicit CAnmCameraFilter(const unsigned int uiID);

        void SetColor(const unsigned int color);
        
        unsigned int GetColor() const;

        void SetFilterType(const unsigned int t);
        
        unsigned int GetFilterType() const;

        void SetTransparent(const float f);

        float GetTransparent() const;

        void SetTotalFrames(const int iFrame);

        int GetTotalFrames() const;

        virtual ActionType GetActionType() const;

        virtual void CopyDataFrom(CAnmAction *pAction);

        virtual bool Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager);

        virtual DWORD GetTotalTime() const;

        virtual ~CAnmCameraFilter();

    private:
        CAnmCameraFilter();

    private:
        unsigned int m_uiColor;
        unsigned int m_uiFilterType;
        float m_fTransparent;
        int m_iTotalFrames;
};

#endif
