#ifndef _ANM_ACTION_MANAGER_H_
#define _ANM_ACTION_MANAGER_H_

#include "Animator/AnmActionGroup.h"
#include <list>
#include <map>
#include <algorithm>

class CAnmActionManager
{
    public:
        typedef std::list<CAnmAction*> ActionList;
        typedef std::vector<CAnmAction*> ActionVector;
        typedef std::vector<CAnmAction*>::iterator ActionVectorIterator;

    private:
        struct ActionNode
        {
            CAnmAction *mpAction;
            DWORD mEndTime;
            ActionNode *mpLeftNode;
            ActionNode *mpRightNode;
        };

    public:
        CAnmActionManager();

        void CreateGroup(const unsigned int uiID);

        unsigned int CreateGroup();

        void DeleteGroup(const unsigned int uiID);

        CAnmActionGroup* GetGroup(const unsigned int uiID);

        void GetGroupIDList(std::vector<unsigned int> &vList);

        int GetGroupAmount() const;

        int GetActionsCount(const DWORD dwStartTime, const DWORD dwEndTime);

        void MoveActions(const DWORD dwStartTime, const DWORD dwEndTime, const DWORD dwOffset, const bool left=false);

        void MoveWorldOffset(const A3DVECTOR3 &v);

        // TODO: uiID == 0xFFFFFFFF for all groups
        void Prepare(const unsigned int uiID=0xFFFFFFFF);

        void Reset();

        float CalculateTotalTime();

        bool Tick(const DWORD dwNowTime, CAnmObjectManager *pObjectManager);

        ~CAnmActionManager();

    private:
        void _ClearActiveActionTree();

        void _RemoveActiveActionNode(ActionNode *&pActionNode);

        void _InsertActiveAction(CAnmAction *pAction);

        bool _TickActiveActionTree(const DWORD dwNowTime, CAnmObjectManager *pObjectManager);

        bool _TickActiveActionNode(ActionNode *&pActionNode, const DWORD dwNowTime, CAnmObjectManager *pObjectManager);
        
    public:
        static bool ActionCompareStartTime(const CAnmAction * const &a, const CAnmAction * const &b)
        {
            return a->GetStartTime() < b->GetStartTime();
        }
        
    private:
        std::map<unsigned int, CAnmActionGroup*> m_mGroupMap;
        ActionNode m_ActiveActionTreeRoot;
        ActionList m_lPrepareActionList;
        ActionVectorIterator m_pActiveIterator;
};

#endif