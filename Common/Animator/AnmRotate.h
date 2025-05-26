#ifndef _ANM_Rotate_H_
#define _ANM_Rotate_H_

#include "Animator/AnmAction.h"

class CAnmRotate : public CAnmAction
{
    public:
        explicit CAnmRotate(const unsigned int uiID);

        void SetStartRotate(const A3DQUATERNION &q);
        
        A3DQUATERNION GetStartRotate() const;

        void SetA(const A3DQUATERNION &q);

        A3DQUATERNION GetA() const;

        void SetB(const A3DQUATERNION &q);

        A3DQUATERNION GetB() const;

        void SetEndRotate(const A3DQUATERNION &q);
        
        A3DQUATERNION GetEndRotate() const;

        void SetUseSquad(const bool b);

        bool IsUsingSquad() const;

        void SetTotalFrames(const int iFrame);

        int GetTotalFrames() const;

        virtual ActionType GetActionType() const;

        virtual void CopyDataFrom(CAnmAction *pAction);

        virtual bool Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager);

        virtual DWORD GetTotalTime() const;

        virtual ~CAnmRotate();

    private:
        CAnmRotate();

    public:
        static A3DQUATERNION Slerp(const A3DQUATERNION &pQ,
                                   const A3DQUATERNION &qQ,
                                   const float u,
                                   const bool shortestPath=false);

        static A3DQUATERNION Squad(const A3DQUATERNION &pQ,
                                   const A3DQUATERNION &aQ,
                                   const A3DQUATERNION &bQ,
                                   const A3DQUATERNION &qQ,
                                   const float u,
                                   const bool shortestPath=false);

    private:
        A3DQUATERNION m_qStartRotate;
        A3DQUATERNION m_qA;
        A3DQUATERNION m_qB;
        A3DQUATERNION m_qEndRotate;
        bool m_bUseSquad;
        int m_iTotalFrames;
};

#endif
