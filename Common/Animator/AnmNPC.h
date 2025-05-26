#ifndef _ANM_NPC_H_
#define _ANM_NPC_H_

#include "EC_Model.h"
#include "A3DCombinedAction.h"
#include "Animator/AnmObject.h"

class CAnmGFX;
class CAnmCamera;

class CAnmNPC : public CAnmObject
{
    public:
        explicit CAnmNPC(unsigned int uiID);

        virtual ObjectType GetObjectType() const;

        virtual bool Load(const wchar_t *szFile);

        virtual ACString GetName() const;

        virtual bool IsPlayer() const { return false; }

        virtual void GetActionList(std::vector<ACString> &vList) const;

        void GetHookList(std::vector<ACString> &vList) const;

        void AddChildModel(const ACString &hangerName,
                           const ACString &hookName,
                           CAnmObject *pObject,
                           const ACString &elseHookName);

        CECModel* GetECModel();

        void RemoveChildModel(const ACString &hangerName);

        int AddSkin(const ACString &skinName);

        void RemoveSkin(const int index);

        void PlayGFX(const ACString &hookName, CAnmGFX *pGFX);

        void RemoveGFX(const ACString &hookName, CAnmGFX *pGFX);

        void HookCamera(const ACString &hookName, CAnmCamera *pCamera);

        void SetHooked(const bool hooked);

        bool IsHooked() const;

        void SetModelVisible(const bool b);

        bool IsModelVisible() const;

        void SetActionSpeed(const float speed);

        float GetActionSpeed() const;

        virtual bool Tick(const DWORD dwDeltaTime);

        virtual bool Render(A3DViewport *viewport, bool bRenderShadow) const;

        virtual void PlayAction(const ACString &actionName);

        void PlayAction(const ACString &actionName, const int iBlendTime, const bool bShowGFX);

        virtual void StopAction();

        virtual bool IsInAction() const;

        virtual void Reset();

        virtual void SetPos(const A3DVECTOR3 &vPos);

        virtual A3DVECTOR3 GetPos() const;

        virtual void SetDirAndUp(const A3DVECTOR3 &vDir, const A3DVECTOR3 &vUp=A3DVECTOR3(0.0f, 1.0f, 0.0f));

        virtual A3DVECTOR3 GetDir() const;

        virtual A3DVECTOR3 GetUp() const;

        virtual void SetScale(const float s);
        
        virtual float GetScale() const;

        virtual void SetTransparent(const float t);
        
        virtual float GetTransparent() const;

        virtual const A3DAABB& GetAABB() const;

        virtual void CopyDataFrom(CAnmObject *pObject);

        virtual ~CAnmNPC();

    private:
        CAnmNPC();

        void _SetHostPlayerSkinColor(A3DSkinModel* pSkinModel, int index);

        void _SetSkinColor(A3DSkinModel* pSkinModel, int index, A3DCOLOR cl, const char *szSuffix);

    protected:
        CECModel *m_pModel;
        A3DSkin *m_pSkin;
        ACString m_sModelName;
        ACString m_sActionName;
        mutable A3DAABB m_AABB;
        bool m_bHooked;
        bool m_bModelVisible;
        float m_fSpeed;
        float m_fTickTime;
};

#endif
