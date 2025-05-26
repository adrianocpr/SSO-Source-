#ifndef _ANM_TRANSLATOR_H_
#define _ANM_TRANSLATOR_H_

class CAnimator;
class CAnmActionGroup;

const int ANM_FILE_MAGIC = 0xABCD;
const int ANM_FILE_VERSION = 0x1;

struct AnmFileHead
{
    int m_iMagic;
    int m_iVersion;
    DWORD m_dwTotalTime;
    int m_iObjectAmount;
    int m_iBezierAmount;
    int m_iGroupAmount;
    int m_iObjectOffset;
    int m_iBezierOffset;
    int m_iActionOffset;
    int m_iWorldInstance;
    bool m_bUseHostPlayer;
    bool m_bForceNoSaintCloth;
    bool m_bSpecifyTime;
    int m_iHour;
    int m_iMinute;
    int m_iSecond;
    bool m_bSpecifyWeather;
    bool m_bRain;
    bool m_bSnow;
};

struct AnmObject
{
    unsigned int m_uiObjectID;
    unsigned int m_uiObjectType;
    float m_fOffsetX;
    float m_fOffsetY;
    float m_fOffsetZ;
    wchar_t m_sModelName[256];
    wchar_t m_sDisplayName[256];
};

struct AnmBezier
{
    unsigned int m_uiBezierID;
    int m_iPointAmount;
    wchar_t m_sDisplayName[256];
};

struct AnmBezierPoint
{
    float m_fPosX;
    float m_fPosY;
    float m_fPosZ;
    float m_fOrientationW;
    float m_fOrientationX;
    float m_fOrientationY;
    float m_fOrientationZ;
    float m_fFOV;
    int m_iTotalFrames;
};

struct AnmBezierSegment
{
    float m_fAnchorAX;
    float m_fAnchorAY;
    float m_fAnchorAZ;
    float m_fAnchorBX;
    float m_fAnchorBY;
    float m_fAnchorBZ;
};

struct AnmAction
{
    unsigned int m_uiActionID;
    unsigned int m_uiObjectID;
    unsigned int m_uiActionType;
    DWORD m_dwStartTime;
};

struct AnmMove
{
    float m_fStartPosX;
    float m_fStartPosY;
    float m_fStartPosZ;
    float m_fEndPosX;
    float m_fEndPosY;
    float m_fEndPosZ;
    float m_fOrientationW;
    float m_fOrientationX;
    float m_fOrientationY;
    float m_fOrientationZ;
    int m_iRotateAxisType;
    float m_fRotateAngle;
    float m_fAccelerationPercent;
    int m_iTotalFrames;
    bool m_bCloseTerrain;
};

struct AnmRotate
{
    float m_fStartRotateW;
    float m_fStartRotateX;
    float m_fStartRotateY;
    float m_fStartRotateZ;
    float m_fAW;
    float m_fAX;
    float m_fAY;
    float m_fAZ;
    float m_fBW;
    float m_fBX;
    float m_fBY;
    float m_fBZ;
    float m_fEndRotateW;
    float m_fEndRotateX;
    float m_fEndRotateY;
    float m_fEndRotateZ;
    bool m_bUseSquad;
    int m_iTotalFrames;
};

struct AnmScale
{
    float m_fStartScale;
    float m_fEndScale;
    int m_iTotalFrames;
};

struct AnmFOV
{
    float m_fStartFOV;
    float m_fEndFOV;
    int m_iTotalFrames;
};

struct AnmJump
{
    float m_fStartPosX;
    float m_fStartPosY;
    float m_fStartPosZ;
    float m_fEndPosX;
    float m_fEndPosY;
    float m_fEndPosZ;
    int m_iTotalFrames;
};

struct AnmMotion
{
    int m_iStartMotionFrame;
    int m_iBlendFrames;
    int m_iTotalFrames;
    unsigned int m_uiMotionType;
    wchar_t m_sActionName[128];
    float m_fActionSpeed;
    bool m_bShowGFX;
};

struct AnmDisplayHide
{
    unsigned int m_uiVisableType;
};

struct AnmDialogue
{
    int m_iTotalFrames;
    wchar_t m_sDialogue[512];
};

struct AnmSound
{
    int m_iTotalFrames;
    int m_iStartSeconds;
    unsigned int m_uiVolume;
    wchar_t m_sSoundFileName[128];
};

struct AnmBezierMove
{
    unsigned int m_uiBezierID;
    bool m_bUseOrientation;
    bool m_bCloseTerrain;
};

struct AnmHook
{
    int m_iTotalFrames;
    wchar_t m_sHangerName[128];
    wchar_t m_sHookName[128];
    unsigned int m_uiHookObjectID;
    wchar_t m_sElseHookName[128];
};

struct AnmSpeedControl
{
    int m_iTotalFrames;
    float m_fSpeed;
};

struct AnmCameraFilter
{
    unsigned int m_uiColor;
    unsigned int m_uiFilterType;
    float m_fTransparent;
    int m_iTotalFrames;
};

struct AnmCameraOscillatory
{
    unsigned int m_uiOscillatoryType;
    int m_iOscillatoryAxis;
    int m_iAttenuation;
    float m_fDisplacement;
    float m_fFrequency;
    int m_iTotalFrames;
};

struct AnmTransparent
{
    float m_fStartTransparent;
    float m_fEndTransparent;
    int m_iTotalFrames;
};

struct AnmHideWorldAction
{
    unsigned int m_uiHideWorldType;
    unsigned int m_uiColor;
    int m_iTotalFrames;
};

struct AnmBloom
{
    A3DPOST_EFFECT_BLOOM_PARAM m_StartBloom;
    A3DPOST_EFFECT_BLOOM_PARAM m_EndBloom;
    int m_iTotalFrames;
};

struct AnmDOF
{
    A3DPOST_EFFECT_DOF_PARAM m_StartDOF;
    A3DPOST_EFFECT_DOF_PARAM m_EndDOF;
    int m_iTotalFrames;
};

struct AnmRadialBlur
{
    A3DPOST_EFFECT_RADIUSBLUR_PARAM m_StartRadialBlur;
    A3DPOST_EFFECT_RADIUSBLUR_PARAM m_EndRadialBlur;
    int m_iTotalFrames;
};

struct AnmMotionBlur
{
    A3DPOST_EFFECT_MOTIONBLUR_PARAM m_StartMotionBlur;
    A3DPOST_EFFECT_MOTIONBLUR_PARAM m_EndMotionBlur;
    int m_iTotalFrames;
};

struct AnmWarp
{
    float m_fStartScale;
    float m_fEndScale;
    float m_fStartSpeed;
    float m_fEndSpeed;
    bool m_bEnableMask;
    wchar_t m_sMaskFile[128];
    int m_iTotalFrames;
};

struct AnmCC
{
    float m_fStartFactor;
    float m_fEndFactor;
    wchar_t m_sTex1File[128];
    wchar_t m_sTex2File[128];
    int m_iTotalFrames;
};

struct AnmGodRay
{
    A3DPOST_EFFECT_GODRAY_PARAM m_StartGodRay;
    A3DPOST_EFFECT_GODRAY_PARAM m_EndGodRay;
    int m_iTotalFrames;
};

struct AnmAddSkin
{
    wchar_t m_sSkinFile[128];
    int m_iTotalFrames;
};

struct AnmQTE
{
    int m_iTotalFrames;
    unsigned int m_uiQTEID;
    float m_fSpeed;
};

struct AnmActionChannel
{
    unsigned int m_uiChannelID;
    unsigned int m_uiObjectID;
    unsigned int m_uiChannelType;
    int m_iActionAmount;
    wchar_t m_sChannelName[32];
};

struct AnmActionGroup
{
    unsigned int m_uiGroupID;
    int m_iChannelAmount;
    wchar_t m_sGroupName[32];
};


class CAnmTranslator
{
    public:
        CAnmTranslator(CAnimator *pAnimator);

        bool LoadFile(const wchar_t *szFile, A3DVECTOR3 vHostPos);

        bool SaveFile(const wchar_t *szFile);

        bool ImportActionGroup(const wchar_t *szFile);

        bool ExportActionGroup(const wchar_t *szFile, CAnmActionGroup *pActionGroup);

        bool LoadActionGroupFromFile(FILE *file);

        bool SaveActionGroupToFile(AFile &file, CAnmActionGroup *pActionGroup);

        ~CAnmTranslator();

    private:
        CAnmTranslator() {}

    private:
        CAnimator *m_pAnimator;
};

#endif
