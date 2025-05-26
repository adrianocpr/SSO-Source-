#ifndef _SMART_CAMERA_H_
#define _SMART_CAMERA_H_

#include <A3D.h>
#include <ElementRender.h>
#include <set>

class SmartCamera
{
    public:
        class Listener
        {
            public:
                Listener() {}
                virtual ~Listener() {}
                virtual void OnDestAll(SmartCamera *camera) {}

                virtual void OnDestPos(SmartCamera *camera, const A3DVECTOR3 &vPos) {}
                virtual void OnDestOri(SmartCamera *camera, const A3DQUATERNION &qOri) {}
                virtual void OnDestFOV(SmartCamera *camera, const float fov) {}

                virtual void OnDestBloomParam(SmartCamera *camera, const A3DPOST_EFFECT_BLOOM_PARAM &param) {}
                virtual void OnDestCCParam(SmartCamera *camera, const A3DPOST_EFFECT_CC_PARAM &param) {}
                virtual void OnDestDOFParam(SmartCamera *camera, const A3DPOST_EFFECT_DOF_PARAM &param) {}
                virtual void OnDestGodRayParam(SmartCamera *camera, const A3DPOST_EFFECT_GODRAY_PARAM &param) {}
                virtual void OnDestRadialBlurParam(SmartCamera *camera, const A3DPOST_EFFECT_RADIUSBLUR_PARAM &param) {}
                virtual void OnDestMotionBlurParam(SmartCamera *camera, const A3DPOST_EFFECT_MOTIONBLUR_PARAM &param) {}
                virtual void OnDestWarpParam(SmartCamera *camera, const A3DPOST_EFFECT_WARP_PARAM &param) {}
                virtual void OnDestFullGlowParam(SmartCamera *camera, const A3DPOST_EFFECT_FULLGLOW_PARAM &param) {}
        };

        typedef std::set<Listener*> Listeners;
        typedef Listeners::iterator ListenersIterator;
        typedef Listeners::const_iterator ListenersConstIterator;

    public:
        explicit SmartCamera(A3DCamera *pCamera);
        virtual ~SmartCamera();

		void ChangeInnerCamera(A3DCamera *pCamera);
		void UpdateInnerCamera();

        virtual bool AddListener(Listener *listener);
        virtual bool RemoveListener(Listener *listener);
        virtual void ClearListeners();

        virtual void Play();
        virtual void Stop();
        virtual void Pause();

        virtual bool Tick(const unsigned int delta);

        bool IsActive() const;
        bool IsPlaying() const;

        bool IsMoving() const;
        bool IsRotating() const;
        bool IsFOVing() const;
		bool IsEnding() const;

		bool IsAnimatingBloomParam() const;
		bool IsAnimatingDOFParam() const;
		bool IsAnimatingCCParam() const;
		bool IsAnimatingRadialBlurParam() const;		
		bool IsAnimatingMotionBlurParam() const;
		bool IsAnimatingWarpParam() const;

		bool IsHideHostPlayer() { return m_bHideHostPlayer; }
		bool IsHideElsePlayer() { return m_bHideElsePlayer; }

		// 设置最后一个效果点标记
		void SetEnding(bool bEnding);
		bool GetEnding();

        void SetSpeed(const float s);
        float GetSpeed() const;

        void SetInit();

        void SetInitPos(const A3DVECTOR3 &pos);
        A3DVECTOR3 GetInitPos() const;
        A3DVECTOR3 GetPos() const;
        A3DVECTOR3 GetDestPos() const;

        void SetInitOri(const A3DQUATERNION &q);
        void SetInitOri(const A3DVECTOR3 &dir, const A3DVECTOR3 &up);
        A3DQUATERNION GetInitOri() const;
        A3DQUATERNION GetOri() const;
        A3DQUATERNION GetDestOri() const;
        A3DVECTOR3 GetInitDir() const;
        A3DVECTOR3 GetDir() const;
        A3DVECTOR3 GetDestDir() const;
        A3DVECTOR3 GetInitUp() const;
        A3DVECTOR3 GetUp() const;
        A3DVECTOR3 GetDestUp() const;

        void SetInitFOV(const float &fov);
        float GetInitFOV() const;
        float GetFOV() const;
        float GetDestFOV() const;

        // accelerationPercent = [-1.0f, 1.0f]
        void MoveTo(const A3DVECTOR3 &pos, const unsigned int useTime, const float accelerationPercent=0.0f);
        void RotateTo(const A3DQUATERNION &q, const unsigned int useTime);
        void RotateTo(const A3DVECTOR3 &dir, const A3DVECTOR3 &up, const unsigned int useTime);
        void FOVTo(const float &fov, const unsigned int useTime);

        // Post Effect
        void ResetPostEffectParam();
        void SetInitPostEffectParam(const A3DPOST_EFFECT_PARAM &param);
        const A3DPOST_EFFECT_PARAM& GetInitPostEffectParam() const;
        const A3DPOST_EFFECT_PARAM& GetPostEffectParam() const;
        const A3DPOST_EFFECT_PARAM& GetDestPostEffectParam() const;

        void EnablePostEffect(const DWORD mask);
        void DisablePostEffect(const DWORD mask);
		void ResetPostEffect(const DWORD mask);

        void AnimateBloomParam(const A3DPOST_EFFECT_BLOOM_PARAM &param, const unsigned int useTime, bool bEnd = false, const A3DPOST_EFFECT_BLOOM_PARAM &destParam = A3DPOST_EFFECT_BLOOM_PARAM());
        void AnimateCCParam(const A3DPOST_EFFECT_CC_PARAM &param, const unsigned int useTime, bool bEnd = false, const A3DPOST_EFFECT_CC_PARAM &destParam = A3DPOST_EFFECT_CC_PARAM());
        void AnimateDOFParam(const A3DPOST_EFFECT_DOF_PARAM &param, const unsigned int useTime, bool bEnd = false, const A3DPOST_EFFECT_DOF_PARAM &destParam = A3DPOST_EFFECT_DOF_PARAM());
        //void AnimateGodRayParam(const A3DPOST_EFFECT_GODRAY_PARAM &param, const unsigned int useTime);
        void AnimateRadialBlurParam(const A3DPOST_EFFECT_RADIUSBLUR_PARAM &param, const unsigned int useTime, bool bEnd = false, const A3DPOST_EFFECT_RADIUSBLUR_PARAM &destParam = A3DPOST_EFFECT_RADIUSBLUR_PARAM());
        void AnimateMotionBlurParam(const A3DPOST_EFFECT_MOTIONBLUR_PARAM &param, const unsigned int useTime, bool bEnd = false, const A3DPOST_EFFECT_MOTIONBLUR_PARAM &destParam = A3DPOST_EFFECT_MOTIONBLUR_PARAM());
        void AnimateWarpParam(const A3DPOST_EFFECT_WARP_PARAM &param, const unsigned int useTime, const bool bEnd = false, const A3DPOST_EFFECT_WARP_PARAM &destParam = A3DPOST_EFFECT_WARP_PARAM());
        //void AnimateFullGlowParam(const A3DPOST_EFFECT_FULLGLOW_PARAM &param, const unsigned int useTime);

		void HideInSmartCamera(bool bHideHostPlayer = false, bool bHideElsePlayer = false);

    protected:
        virtual bool _TickPos(const float delta);
        virtual bool _TickOri(const float delta);
        virtual bool _TickFOV(const float delta);

        virtual bool _TickBloomParam(const float delta);
        virtual bool _TickCCParam(const float delta);
        virtual bool _TickDOFParam(const float delta);
        //virtual bool _TickGodRayParam(const float delta);
        virtual bool _TickRadialBlurParam(const float delta);
        virtual bool _TickMotionBlurParam(const float delta);
        virtual bool _TickWarpParam(const float delta);
        //virtual bool _TickFullGlowParam(const float delta);

        void _FireOnDestAll();

        void _FireOnDestPos();
        void _FireOnDestOri();
        void _FireOnDestFOV();

        void _FireOnDestBloomParam();
        void _FireOnDestCCParam();
        void _FireOnDestDOFParam();
        void _FireOnDestGodRayParam();
        void _FireOnDestRadialBlurParam();
        void _FireOnDestMotionBlurParam();
        void _FireOnDestWarpParam();
        void _FireOnDestFullGlowParam();

    private:
        SmartCamera();
        SmartCamera(const SmartCamera &);
        SmartCamera& operator = (const SmartCamera &);

    public:
        static float Clamp(const float a);
        static A3DQUATERNION GetOriFromDirAndUp(const A3DVECTOR3 &dir, const A3DVECTOR3 &up);
        static float Lerp(const float start, const float end, const float u);

    protected:
        A3DCamera *m_pA3DCamera;
        Listeners m_Listeners;
        bool m_bActive;
        bool m_bPaused;

        float m_fSpeed;

        A3DVECTOR3 m_vInitPos;
        A3DVECTOR3 m_vLastPos;
        A3DVECTOR3 m_vDestPos;
        float m_fLastVelocity;
        float m_fAcceleration;
        float m_fMovingTimer;
        bool m_bMoving;
		bool m_bEnding;
        A3DQUATERNION m_qInitOri;
        A3DQUATERNION m_qLastOri;
        A3DQUATERNION m_qDestOri;
        float m_fRotatingTimer;
        bool m_bRotating;

        float m_fInitFOV;
        float m_fLastFOV;
        float m_fDestFOV;
        float m_fFOVingTimer;
        bool m_bFOVing;

        float m_fBloomParamTimer;
        float m_fCCParamTimer;
        float m_fDOFParamTimer;
        float m_fGodRayParamTimer;
        float m_fRadialBlurParamTimer;
        float m_fMotionBlurParamTimer;
        float m_fWarpParamTimer;
        float m_fFullGlowParamTimer;

        bool m_bBloomParam;
        bool m_bCCParam;
        bool m_bDOFParam;
        bool m_bGodRayParam;
        bool m_bRadialBlurParam;
        bool m_bMotionBlurParam;
        bool m_bWarpParam;
        bool m_bFullGlowParam;

		bool m_bHideHostPlayer;
		bool m_bHideElsePlayer;

        A3DPOST_EFFECT_PARAM m_InitPostEffectParam;
        A3DPOST_EFFECT_PARAM m_LastPostEffectParam;
        A3DPOST_EFFECT_PARAM m_DestPostEffectParam;

    public:
        static const A3DVECTOR3 UNIT_LEFT;
        static const A3DVECTOR3 UNIT_UP;
        static const A3DVECTOR3 UNIT_DIR;
};

#endif
