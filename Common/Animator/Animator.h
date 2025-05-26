#ifndef _ANIMATOR_H_
#define _ANIMATOR_H_

#include <A3D.h>
#include <ElementRender.h>
#include <set>
#include "ECManager.h"

class CECWorld;
class CECViewport;
class CECModel;
class CAnmCamera;
class CAnmPlayer;
class CAnmObjectManager;
class CAnmBezierManager;
class CAnmActionManager;
class CAnmActionGroup;
class CAnmTranslator;
class CAnimatorListener;
class CAnmRayTrace;
class CAnmAxes;
class SmartCamera;

class CAnimator : public ECRObjBase
{
    public:
        enum AnimationType
        {
            TYPE_CAMERA_ANIMATION = 0,
            TYPE_NORMAL_ANIMATION = 1,
        };

        enum AnimatorState
        {
            STATE_WAITING = 0,
            STATE_PLAYING = 1,
            STATE_PAUSING = 2,
        };

        enum BlackWhiteType
        {
            BWT_NONE = 0,
            BWT_SLOW = 1,
            BWT_FAST = 2,
        };

    public:
        typedef std::set<CAnimatorListener*> Listeners;
        typedef Listeners::iterator ListenersIterator;
        typedef Listeners::const_iterator ListenersConstIterator;

    public:
        CAnimator();

        AnimationType GetAnimationType() const;

        bool AddListener(CAnimatorListener *listener);
        bool RemoveListener(CAnimatorListener *listener);
        void ClearListeners();

        bool Init();

        void Release();

        bool Tick(DWORD dwDeltaTime);

        bool Render(A3DViewport *pViewport, bool bRenderShadow=true);

		virtual bool Render(const ECRENDERPARAM* pRenderParam);

        void RenderMask(A3DViewport *pViewport);

        void RenderText(A3DViewport *pViewport);

        void RenderWire(A3DViewport *pViewport);

        bool IsReady() const;

        void MoveFront(const float d);

        void MoveBack(const float d);

        void MoveLeft(const float d);

        void MoveRight(const float d);

        void MoveUp(const float d);
        
        void MoveDown(const float d);

        void DegDelta(const float d);

        void PitchDelta(const float d);

        void RollDelta(const float d);

        void AddBezierPoint(const A3DVECTOR3 &v);

        void Play(bool bFire=false);

        void JumpTo(const DWORD dwNowTime);

        void Pause();

        void Stop(bool bFire=false);

        void StartQTE(const unsigned int uiQTEID, const float speed);

        void EndQTE(const unsigned int uiQTEID);

        void SuccessQTE(const unsigned int uiQTEID);

        unsigned int GetQTEID() const;

        float GetQTESpeed() const;

        A3DEngine* GetA3DEngine() const;

        A3DDevice* GetA3DDevice() const;

        A3DCamera* GetA3DCamera() const;

        A3DViewport* GetA3DViewport() const;

        CECWorld* GetWorld() const;

        CAnmObjectManager* GetObjectManager() const;

        CAnmBezierManager* GetBezierManager() const;

        CAnmActionManager* GetActionManager() const;

        CAnmRayTrace* GetRayTrace() const;

        CAnmAxes* GetAxes() const;

        SmartCamera* GetSmartCamera() const;

        void SetUseHostPlayer(const bool b);

        bool IsUseHostPlayer() const;

        void SetForceNoSaintCloth(const bool b);

        bool IsForceNoSaintCloth() const;

        void SetHostPlayerSkinColor(const A3DCOLOR c);

        A3DCOLOR GetHostPlayerSkinColor() const;

        void SetSpecifyTime(const bool b);

        void SetWorldTime(const int hour, const int minute, const int second);

        bool IsSpecifyTime() const;

        int GetHour() const;

        int GetMinute() const;

        int GetSecond() const;

        void SetSpecifyWeather(const bool b);
        
        bool IsSpecifyWeahter() const;

        void SetWeatherRain(const bool b);

        bool IsRain() const;

        void SetWeatherSnow(const bool b);

        bool IsSnow() const;

        void SetVolume(DWORD dwVolume);

        DWORD GetVolume() const;

        void SetDialogue(const ACString &st);

        ACString GetDialogue() const;

        void SetMaskColor(const unsigned int color);

        unsigned int GetMaskColor() const;

        void SetMonoColor(const unsigned int color);
        
        unsigned int GetMonoColor() const;

        void SetBackgroundColor(const unsigned int color);
        
        unsigned int GetBackgroundColor() const;

        void SetBlackWhiteType(const BlackWhiteType &bt);
        
        BlackWhiteType GetBlackWhiteType() const;

        void SetHideWorldType(const unsigned int t);
        
        unsigned int GetHideWorldType() const;

        void EnablePostEffect(const DWORD mask);
        void DisablePostEffect(const DWORD mask);

        void SetPostEffectBloomParam(const A3DPOST_EFFECT_BLOOM_PARAM &param);
        void SetPostEffectCCParam(const A3DPOST_EFFECT_CC_PARAM &param);
        void SetPostEffectDOFParam(const A3DPOST_EFFECT_DOF_PARAM &param);
        void SetPostEffectGodRayParam(const A3DPOST_EFFECT_GODRAY_PARAM &param);
        void SetPostEffectRadialBlurParam(const A3DPOST_EFFECT_RADIUSBLUR_PARAM &param);
        void SetPostEffectMotionBlurParam(const A3DPOST_EFFECT_MOTIONBLUR_PARAM &param);
        void SetPostEffectWarpParam(const A3DPOST_EFFECT_WARP_PARAM &param);
        void SetPostEffectFullGlowParam(const A3DPOST_EFFECT_FULLGLOW_PARAM &param);

        const A3DPOST_EFFECT_PARAM& GetPostEffectParam() const;

        void ResetPostEffectParam();

        void SetTotalTime(const DWORD dwTotalTime);

        DWORD GetTotalTime() const;

        void SetNowTime(const DWORD dwNowTime);

        DWORD GetNowTime() const;

        void SetStartTime(const DWORD dwStartTime);

        DWORD GetStartTime() const;

        void SetEndTime(const DWORD dwEndTime);

        DWORD GetEndTime() const;

        void SetSpeed(const float speed);

        float GetSpeed() const;

        AnimatorState GetState() const;

        float GetPosHeight(const A3DVECTOR3 &vPos) const;

        void MoveCamera(const char key, const bool bSlow=false);

        void StopCamera();

        void DisableCamera(const bool b);

        bool IsDisabledCamera() const;

        void BindCamera(const bool b);
        
        bool IsBindCamera() const;

        void SetBindCameraOffset(const A3DVECTOR3 &v);

        A3DVECTOR3 GetBindCameraOffset() const;

        void MoveWorldOffset(const A3DVECTOR3 &v);

        bool LoadWorld(int idInst, A3DVECTOR3 vHostPos);

        int GetWorldInstance() const;

        void SetHostPlayerModel(CECModel *pModel);

        bool LoadFile(const wchar_t *szFile, A3DVECTOR3 vHostPos);

        bool LoadCameraAnimationFile(const wchar_t *szFile, A3DVECTOR3 vHostPos);

        bool SaveFile(const wchar_t *szFile);

        bool ImportActionGroup(const wchar_t *szFile);

        bool ExportActionGroup(const wchar_t *szFile, CAnmActionGroup *pActionGroup);

        ~CAnimator();

    private:
        bool TickSmartCamera(DWORD dwDeltaTime);
        void FormatCameraPos();

        void _FireOnPlay();
        void _FireOnStop();
        void _FireOnStartQTE(const unsigned int uiQTEID);
        void _FireOnEndQTE(const unsigned int uiQTEID);

    private:
        A3DFont *m_pFont;
        CAnmCamera *m_pCamera;
        CAnmPlayer *m_pPlayer;
        CAnmObjectManager *m_pObjectManager;
        CAnmBezierManager* m_pBezierManager;
        CAnmActionManager *m_pActionManager;
        CAnmTranslator *m_pTranslator;
        CAnmRayTrace *m_pRayTrace;
        CAnmAxes *m_pAxes;
        SmartCamera *m_pSmartCamera;
        Listeners m_Listeners;

        AnimationType m_eAnimationType;
        int m_iWorldInstance;
        bool m_bUseHostPlayer;
        bool m_bForceNoSaintCloth;
        A3DCOLOR m_HostPlayerSkinColor;
        bool m_bSpecifyTime;
        int m_iHour;
        int m_iMinute;
        int m_iSecond;
        bool m_bSpecifyWeather;
        bool m_bRain;
        bool m_bSnow;
        DWORD m_dwVolume;

        ACString m_sDialogue;
        unsigned int m_uiMaskColor;
        unsigned int m_uiMonoColor;
        unsigned int m_uiBackgroundColor;
        BlackWhiteType m_eBlackWhiteType;
        unsigned int m_uiHideWorldType;

        A3DPOST_EFFECT_PARAM m_PostEffectParam;

        DWORD m_dwTotalTime;
        DWORD m_dwNowTime;
        DWORD m_dwStartTime;
        DWORD m_dwEndTime;
        float m_fTickTime;
        float m_fPlayTime;
        unsigned int m_uiQTEID;
        float m_fQTESpeed;
        float m_fSpeed;
        bool m_bAnimatorReady;
        bool m_bDisableCamera;
        bool m_bBindCamera;
        A3DVECTOR3 m_vBindCameraOffset;
        AnimatorState m_eState;
        bool m_bMoveCamera;
        float m_fMoveCameraSpeed;
        int m_iMoveLastTime;

        A3DVECTOR3 m_aFrustum[8];
};

class CManagerWrapperForAnimator : public ECManager
{
public:
    CManagerWrapperForAnimator(CAnimator* pAnimatior): ECManager(NULL), m_pAnimator(pAnimatior) {}
    //	Render routine
    virtual bool Render(CECViewport* pViewport) { return m_pAnimator->Render(pViewport->GetA3DViewport()); }
    virtual bool RenderPost(CECViewport* pViewport)
    {
#ifdef ANIMATION_EDITOR
        m_pAnimator->RenderWire(pViewport->GetA3DViewport());
        m_pAnimator->RenderText(pViewport->GetA3DViewport());
#endif
        return true;
    }
    //	RenderForReflected routine
    virtual bool RenderForReflect(CECViewport* pViewport) { return m_pAnimator->Render(pViewport->GetA3DViewport()); }
    //	RenderForRefract routine
    virtual bool RenderForRefract(CECViewport* pViewport) { return m_pAnimator->Render(pViewport->GetA3DViewport()); }
	//  RenderForShadow routine
	virtual bool RenderForShadow(CECViewport* pViewport) { return m_pAnimator->Render(pViewport->GetA3DViewport()); }
	//  RenderForSilhouette routine
    virtual bool RenderForSilhouette(CECViewport * pViewport)
    {
        return m_pAnimator->Render(pViewport->GetA3DViewport());
    }
private:
    CAnimator* m_pAnimator;
};

extern CAnimator g_Animator;
extern CManagerWrapperForAnimator g_ManagerWrapperForAnimator;

#endif
