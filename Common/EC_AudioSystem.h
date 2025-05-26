#ifndef _EC_AUDIO_SYSTEM_H_
#define _EC_AUDIO_SYSTEM_H_

#include <FEvent.h>
#include <FEventSystem.h>
#include <AudioObjectManager.h>
#include <AudioObject3D.h>
#include <AudioObjectBGM.h>
#include <AudioObjectEffect.h>
#include <AudioObjectReverb.h>
#include <PolygonFuncs.h>

class CECAudioSystem
{
	public: 
		enum
		{
			GROUP_NONE			= -1,
			GROUP_MUSIC			= 0,
			GROUP_SOUND			= 1,
			GROUP_ENVIRONMENT	= 2,
			GROUP_ANIMATION	    = 3,
		};

    public:
        CECAudioSystem();

        ~CECAudioSystem();

        AudioObject3D* CreateAudioObject3D();

        AudioObjectBGM* CreateAudioObjectBGM();

		AudioObjectEffect* CreateAudioObjectEffect();

		AudioObjectReverb* CreateAudioObjectReverb();

        bool DestroyAudioObject(AudioObjectBase *pObject);

        AudioEngine::EventSystem* GetEventSystem() const;
        
        AudioObjectManager* GetAudioObjectManager() const;

        // Audio Listener
        void SetListenerPos(const A3DVECTOR3 &vPos);
        A3DVECTOR3 GetListenerPos() const;

        void SetListenerDirAndUp(const A3DVECTOR3 &vDir, const A3DVECTOR3 &vUp);
        A3DVECTOR3 GetListenerDir() const;
        A3DVECTOR3 GetListenerUp() const;

        void SetListenerVel(const A3DVECTOR3 &vVel);
        A3DVECTOR3 GetListenerVel() const;

        // Zone Listener
        void SetZoneListenerPos(const A3DVECTOR3 &vPos);
        A3DVECTOR3 GetZoneListenerPos() const;

        bool UpdateListener();

        void SetDNFactor(float fFactor);
        float GetDNFactor() const;

        bool SetClassVolume(int iClass, float fVolume);
		bool SetClassMute(int iClass, bool bMute);

        bool Init(const char *szPath, bool bEnableAudio);

        bool Reload();

        bool Tick(unsigned int uiTickDelta);

        //	Play 2D auto sound
        bool Play2DAutoSoundByKey(const AWString &key, const float fVolume=1.0f);
        bool Play2DAutoSound(const char *szGuid, const float fVolume=1.0f);

		//创建非自动销毁的2d声音  [4/28/2013 wangliang]
		AudioEngine::EventInstance* Create2DSound(const AWString &key, const float fVolume=1.0f);
		void Destroy2DSound(const AWString &key,AudioEngine::EventInstance* pSoundEventInstance);

        //	Play 3D auto sound
        bool Play3DAutoSoundByKey(const AWString &key, const A3DVECTOR3& vPos, float fMinDist, float fMaxDist);
        bool Play3DAutoSound(const char* szGuid, const A3DVECTOR3& vPos, float fMinDist, float fMaxDist, const char*szParameter=NULL, float fValue=0.0f);

        void Release();

		unsigned int GetUsedMemoryBits() const;
		bool GetCPUUsage(float* pfDsp, float* pfStream, float* pfGeometry, float* pfUpdate, float* pfTotal) const;

		bool PlayIntercutBGM(const char* szGUID);
		bool StopIntercutBGM();
		bool IsIntercutBGMPlaying(const char* szGUID);
		bool IsEnableAudio() const { return m_bEnableAudio; }

    protected:
        AudioEngine::EventSystem *m_pEventSystem;
        AudioObjectManager *m_pAudioObjectManager;

        A3DVECTOR3 m_vListenerPos;
        A3DVECTOR3 m_vListenerDir;
        A3DVECTOR3 m_vListenerUp;
        A3DVECTOR3 m_vListenerVel;

        A3DVECTOR3 m_vZoneListenerPos;

        float m_fDNFactor;
		bool m_bEnableAudio;
};

#endif
