#ifndef ECMANSKILLGFX_H_
#define ECMANSKILLGFX_H_

#include <A3DSkillGfxComposer.h>
#include <A3DSkillGfxEvent.h>
#include "A3DGFXInterface.h"
#include "A3DGFXECMInterface.h"
#include <ECManager.h>

namespace _SGC
{

class CECSkillGfxEvent : public A3DSkillGfxEvent
{
public:
	CECSkillGfxEvent(A3DSkillGfxMan* pMan, GfxMoveMode mode) : A3DSkillGfxEvent(pMan, mode)
	{
	}

	virtual ~CECSkillGfxEvent() {}

public:
	virtual A3DGFXEx* LoadHitGfx(A3DDevice* pDev, const char* szPath, DWORD dwModifier);
	virtual void PlayExtraHitGfx(DWORD dwModifier, const A3DVECTOR3& vPos);
};

class CECGFXInterfaceImpl : public A3DGFXInterfaceDefImpl2
{
public:
    CECGFXInterfaceImpl(AudioEngine::EventSystem* pEventSystem) : A3DGFXInterfaceDefImpl2(pEventSystem) {}
    virtual bool PlaySkillGfx(const PARAM_PLAYSKILLGFX* param);
    //	客户端应实现一个通过id获取当前渲染模型的接口
    virtual CECModel* GetECModelById(clientid_t nId);
    //	客户端应实现根据id设置SkinModel是否被正常流程渲染的接口，如果被设置为invisible，则客户端的ECModel中的SkinModel则无需再渲染
    //	调用 bool CECModel::Render(A3DViewport* pViewport, bool bRenderAtOnce/* false */, bool bRenderSkinModel/*=true*/, DWORD dwFlags/*=0*/, A3DSkinModelRenderModifier* pRenderModifier)
    //	的时候，应当使得bRenderSkinModel为false
    virtual bool SetSkinModelVisibleById(clientid_t nId, bool bVisible);
    //	客户端通过id找到对应的CECModel，调用相应接口，设置TickSpeed
    virtual bool SetSkinModelTickSpeed(clientid_t nId, float fTickSpeed);
};

class SkillGfxMan : public A3DSkillGfxMan
{
public:

	SkillGfxMan(CECGameRun* pGameRun);
	virtual ~SkillGfxMan() {}

protected:

	virtual A3DSkillGfxEvent* CreateOneEvent(GfxMoveMode mode)
	{
		return new CECSkillGfxEvent(this, mode);
	}

    static void WINAPI ShowCasterInfo(__int64 idCaster, DWORD dwModifier);
	static void WINAPI ShowDamageInfo(__int64 idCaster, __int64 idTarget, int nDamage, int nDivisions, DWORD dwModifier);
	static void WINAPI SkillGfxTickFunc(__int64 idCaster, int state, DWORD dwTickTime, const A3DVECTOR3* pDir, const A3DVECTOR3* pPos);

public:

	virtual bool GetPositionById(__int64 nId, A3DVECTOR3& vPos, GfxHitPos HitPos, const char* szHook, bool bRelHook, const A3DVECTOR3* pOffset, const char* szHanger, bool bChildHook);
	virtual bool GetDirAndUpById(__int64 nId, A3DVECTOR3& vDir, A3DVECTOR3& vUp);
	virtual float GetTargetScale(__int64 nTargetId);
};

}

class CECSkillGfxMan : public CECManager
{
public:
	CECSkillGfxMan(CECGameRun* pGameRun);
	~CECSkillGfxMan() {}

protected:
	_SGC::SkillGfxMan m_GfxMan;

public:
	_SGC::A3DSkillGfxMan* GetPtr() { return &m_GfxMan; }
	virtual void Release() { m_GfxMan.Release(); }
	virtual bool Tick(DWORD dwDeltaTime) { return m_GfxMan.Tick(dwDeltaTime); }
	virtual bool Render(CECViewport* pViewport) { return m_GfxMan.Render(); }
    //  Render objects after scene rendered
    virtual bool RenderPost(CECViewport* pViewport) { return true; }
    //	RenderForRefract routine
    virtual bool RenderForRefract(CECViewport* pViewport) { return m_GfxMan.Render(); }

	bool AddSkillGfxEvent(
		__int64 nHostID,
		__int64 nTargetID,
		const char* szFlyGfx,
		const char* szHitGfx,
		DWORD dwFlyTimeSpan,
		bool bTraceTarget = true,
		_SGC::GfxMoveMode FlyMode = _SGC::enumLinearMove,
		int nFlyGfxCount = 1,
		DWORD dwInterval = 0,
		const _SGC::GFX_SKILL_PARAM* param = NULL,
		float fFlyGfxScale = 1.0f,
		float fHitGfxScale = 1.0f,
		DWORD dwModifier = 0
		)
	{
		return true;
	}
};

#endif
