#ifndef _TRACK_NODE_H_
#define _TRACK_NODE_H_

#ifndef __AFXEXT_H__
#include <afxext.h>
#endif

#include "Animator/AnmAction.h"

class CTrackNode
{
    public:
        explicit CTrackNode(CAnmAction *pAction);

        void SetAction(CAnmAction *pAction);

        CAnmAction* GetAction() const;

        unsigned int GetActionID() const;

        void SetObjectID(const unsigned int v);
        
        unsigned int GetObjectID() const;

        void SetStartTime(DWORD dwTime);
        
        DWORD GetStartTime() const;

        void SetWidth(int v);

        int GetWidth() const;

        void SetHeight(int v);

        int GetHeight() const;

        void SetPos(int x, int y);

        void SetColor(unsigned int v);

        unsigned int GetColor() const;

        bool IsSelect() const;

        bool IsPointIn(int x, int y) const;

        bool OnLButtonDown(int x, int y);

        void OnDraw(CDC *pDC);

        void DrawActionTime(CDC *pDC);

        ~CTrackNode();

    private:
        CTrackNode() {}

    private:
        CAnmAction *m_pAction;
        DWORD m_dwStartTime;
        unsigned int m_uiColor;
        bool m_bSelected;
        int m_iX;
        int m_iY;
        int m_iWidth;
        int m_iHeight;
};

#endif
