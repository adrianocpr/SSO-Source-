#include "stdafx.h"
#include "AF.h"
#include "Animator/Animator.h"
#include "Animator/AnmTranslator.h"
#include "Animator/AnmObjectManager.h"
#include "Animator/AnmBezierManager.h"
#include "Animator/AnmActionManager.h"
#include <stdio.h>

CAnmTranslator::CAnmTranslator(CAnimator *pAnimator)
{
    m_pAnimator = pAnimator;
}

bool CAnmTranslator::LoadFile(const wchar_t *szFile, A3DVECTOR3 vHostPos)
{
    FILE *file = NULL;
    if ((file = _wfopen(szFile, L"rb")) == NULL)
    {
        return false;
    }

    // Read file head
    AnmFileHead fileHead;
    fread(&fileHead, sizeof(AnmFileHead), 1, file);
    if (fileHead.m_iMagic != ANM_FILE_MAGIC || fileHead.m_iVersion != ANM_FILE_VERSION)
    {
        fclose(file);
        return false;
    }

    // Set total time
    m_pAnimator->SetTotalTime(fileHead.m_dwTotalTime);

    // Load World
    m_pAnimator->LoadWorld(fileHead.m_iWorldInstance, vHostPos);

    m_pAnimator->SetUseHostPlayer(fileHead.m_bUseHostPlayer);
    m_pAnimator->SetForceNoSaintCloth(fileHead.m_bForceNoSaintCloth);

    m_pAnimator->SetSpecifyTime(fileHead.m_bSpecifyTime);
    m_pAnimator->SetWorldTime(fileHead.m_iHour, fileHead.m_iMinute, fileHead.m_iSecond);

    m_pAnimator->SetSpecifyWeather(fileHead.m_bSpecifyWeather);
    m_pAnimator->SetWeatherRain(fileHead.m_bRain);
    m_pAnimator->SetWeatherSnow(fileHead.m_bSnow);

    // Read Objects from file and create Objects for ObjectManager
    CAnmObjectManager *pObjectManager = m_pAnimator->GetObjectManager();
    fseek(file, fileHead.m_iObjectOffset, SEEK_SET);

    AnmObject object;
    CAnmObject *pObject = 0;
    for (int i=0; i<fileHead.m_iObjectAmount; ++i)
    {
        fread(&object, sizeof(AnmObject), 1, file);
        pObjectManager->CreateObject(object.m_uiObjectID,
            CAnmObject::ObjectType(object.m_uiObjectType));
        pObject = pObjectManager->GetObject(object.m_uiObjectID);
        pObject->Load(object.m_sModelName);
        pObject->SetDisplayName(object.m_sDisplayName);
        pObject->SetOffset(A3DVECTOR3(object.m_fOffsetX, object.m_fOffsetY, object.m_fOffsetZ));
    }

    // Read Beziers from file and create Bezier for BezierManager
    CAnmBezierManager *pBezierManager = m_pAnimator->GetBezierManager();
    fseek(file, fileHead.m_iBezierOffset, SEEK_SET);

    AnmBezier bezier;
    CAnmBezier *pBezier = 0;
    for (int i=0; i<fileHead.m_iBezierAmount; ++i)
    {
        fread(&bezier, sizeof(AnmBezier), 1, file);
        pBezierManager->CreateBezier(bezier.m_uiBezierID);
        pBezier = pBezierManager->GetBezier(bezier.m_uiBezierID);
        pBezier->SetDisplayName(bezier.m_sDisplayName);

        // Read BezierPoints and BezierSegments from file
        AnmBezierPoint bezierPoint;
        CAnmBezierPoint *pBezierPoint = 0;
        AnmBezierSegment bezierSegment;
        CAnmBezierSegment *pBezierSegment = 0;
        for (int j=0; j<bezier.m_iPointAmount; ++j)
        {
            pBezier->AddPoint(A3DVECTOR3(0.0f, 0.0f, 0.0f));
        }
        std::vector<unsigned int> bezierPointList;
        std::vector<unsigned int> bezierSegmentList;
        pBezier->GetPointIDList(bezierPointList);
        pBezier->GetSegmentIDList(bezierSegmentList);

        for (int j=0; j<bezier.m_iPointAmount; ++j)
        {
            if (j > 0)
            {
                fread(&bezierSegment, sizeof(AnmBezierSegment), 1, file);
                pBezierSegment = pBezier->GetSegment(bezierSegmentList[j-1]);
                pBezierSegment->SetAnchorA(A3DVECTOR3(bezierSegment.m_fAnchorAX,
                    bezierSegment.m_fAnchorAY,
                    bezierSegment.m_fAnchorAZ));
                pBezierSegment->SetAnchorB(A3DVECTOR3(bezierSegment.m_fAnchorBX,
                    bezierSegment.m_fAnchorBY,
                    bezierSegment.m_fAnchorBZ));
            }

            fread(&bezierPoint, sizeof(AnmBezierPoint), 1, file);
            pBezierPoint = pBezier->GetPoint(bezierPointList[j]);
            pBezierPoint->SetPos(A3DVECTOR3(bezierPoint.m_fPosX,
                bezierPoint.m_fPosY,
                bezierPoint.m_fPosZ));
            pBezierPoint->SetOrientation(A3DQUATERNION(bezierPoint.m_fOrientationW,
                bezierPoint.m_fOrientationX,
                bezierPoint.m_fOrientationY,
                bezierPoint.m_fOrientationZ));
            pBezierPoint->SetTotalFrames(bezierPoint.m_iTotalFrames);
            pBezierPoint->SetFOV(bezierPoint.m_fFOV);
        }
        pBezier->ReCalculateLength();
    }

    fseek(file, fileHead.m_iActionOffset, SEEK_SET);

    // Read Action Groups from file and create Action Groups for ActionManager
    for (int i=0; i<fileHead.m_iGroupAmount; ++i)
    {
        if (!LoadActionGroupFromFile(file))
        {
            fclose(file);
            return false;
        }
    }

    fclose(file);
    return true;
}

bool CAnmTranslator::SaveFile(const wchar_t *szFile)
{
    AFile file;
    DWORD iWriteLength;
    ACString stringName;
    file.Open(WC2AS(szFile), AFILE_BINARY | AFILE_CREATENEW);
    file.ResetPointer();

    // Write file head
    AnmFileHead fileHead;
    fileHead.m_iMagic = ANM_FILE_MAGIC;
    fileHead.m_iVersion = ANM_FILE_VERSION;
    fileHead.m_dwTotalTime = m_pAnimator->GetTotalTime();
    fileHead.m_iWorldInstance = m_pAnimator->GetWorldInstance();
    fileHead.m_bUseHostPlayer = m_pAnimator->IsUseHostPlayer();
    fileHead.m_bForceNoSaintCloth = m_pAnimator->IsForceNoSaintCloth();
    fileHead.m_bSpecifyTime = m_pAnimator->IsSpecifyTime();
    fileHead.m_iHour = m_pAnimator->GetHour();
    fileHead.m_iMinute = m_pAnimator->GetMinute();
    fileHead.m_iSecond = m_pAnimator->GetSecond();
    fileHead.m_bSpecifyWeather = m_pAnimator->IsSpecifyWeahter();
    fileHead.m_bRain = m_pAnimator->IsRain();
    fileHead.m_bSnow = m_pAnimator->IsSnow();
    file.Write(&fileHead, sizeof(AnmFileHead), &iWriteLength);

    // Write Objects to file
    CAnmObjectManager *pObjectManager = m_pAnimator->GetObjectManager();
    std::vector<unsigned int> objectList;
    pObjectManager->GetObjectIDList(objectList);
    fileHead.m_iObjectAmount = pObjectManager->GetObjectAmount();
    fileHead.m_iObjectOffset = file.GetPos();
    file.Seek(fileHead.m_iObjectOffset, AFILE_SEEK_SET);

    AnmObject object;
    CAnmObject *pObject = 0;
    for (int i=0; i<fileHead.m_iObjectAmount; ++i)
    {
        pObject = pObjectManager->GetObject(objectList[i]);
        object.m_uiObjectID = pObject->GetObjectID();
        object.m_uiObjectType = pObject->GetObjectType();
        object.m_fOffsetX = pObject->GetOffset().x;
        object.m_fOffsetY = pObject->GetOffset().y;
        object.m_fOffsetZ = pObject->GetOffset().z;
        stringName = pObject->GetName();
        wcscpy(object.m_sModelName, &stringName[0]);
        stringName = pObject->GetDisplayName();
        wcscpy(object.m_sDisplayName, &stringName[0]);
        file.Write(&object, sizeof(AnmObject), &iWriteLength);
    }

    // Write Beziers to file
    CAnmBezierManager *pBezierManager = m_pAnimator->GetBezierManager();
    fileHead.m_iBezierAmount = pBezierManager->GetBezierAmount();
    fileHead.m_iBezierOffset = file.GetPos();
    file.Seek(fileHead.m_iBezierOffset, AFILE_SEEK_SET);
    std::vector<unsigned int> bezierList;
    pBezierManager->GetBezierIDList(bezierList);

    AnmBezier bezier;
    CAnmBezier *pBezier = 0;
    for (int i=0; i<fileHead.m_iBezierAmount; ++i)
    {
        pBezier = pBezierManager->GetBezier(bezierList[i]);
        bezier.m_uiBezierID = pBezier->GetID();
        bezier.m_iPointAmount = pBezier->GetPointAmount();
        stringName = pBezier->GetDisplayName();
        wcscpy(bezier.m_sDisplayName, &stringName[0]);
        file.Write(&bezier, sizeof(AnmBezier), &iWriteLength);

        // Write BezierPoints and BezierSegments to file
        std::vector<unsigned int> bezierPointList;
        std::vector<unsigned int> bezierSegmentList;
        pBezier->GetPointIDList(bezierPointList);
        pBezier->GetSegmentIDList(bezierSegmentList);
        AnmBezierPoint bezierPoint;
        CAnmBezierPoint *pBezierPoint = 0;
        AnmBezierSegment bezierSegment;
        CAnmBezierSegment *pBezierSegment = 0;
        for (int j=0; j<bezier.m_iPointAmount; ++j)
        {
            if (j > 0)
            {
                pBezierSegment = pBezier->GetSegment(bezierSegmentList[j-1]);
                bezierSegment.m_fAnchorAX = pBezierSegment->GetAnchorA().x;
                bezierSegment.m_fAnchorAY = pBezierSegment->GetAnchorA().y;
                bezierSegment.m_fAnchorAZ = pBezierSegment->GetAnchorA().z;
                bezierSegment.m_fAnchorBX = pBezierSegment->GetAnchorB().x;
                bezierSegment.m_fAnchorBY = pBezierSegment->GetAnchorB().y;
                bezierSegment.m_fAnchorBZ = pBezierSegment->GetAnchorB().z;
                file.Write(&bezierSegment, sizeof(AnmBezierSegment), &iWriteLength);
            }

            pBezierPoint = pBezier->GetPoint(bezierPointList[j]);
            bezierPoint.m_fPosX = pBezierPoint->GetPos().x;
            bezierPoint.m_fPosY = pBezierPoint->GetPos().y;
            bezierPoint.m_fPosZ = pBezierPoint->GetPos().z;
            bezierPoint.m_fOrientationW = pBezierPoint->GetOrientation().w;
            bezierPoint.m_fOrientationX = pBezierPoint->GetOrientation().x;
            bezierPoint.m_fOrientationY = pBezierPoint->GetOrientation().y;
            bezierPoint.m_fOrientationZ = pBezierPoint->GetOrientation().z;
            bezierPoint.m_iTotalFrames = pBezierPoint->GetTotalFrames();
            bezierPoint.m_fFOV = pBezierPoint->GetFOV();
            file.Write(&bezierPoint, sizeof(AnmBezierPoint), &iWriteLength);
        }
    }

    // Write Action Groups to file
    CAnmActionManager *pActionManager = m_pAnimator->GetActionManager();
    fileHead.m_iGroupAmount = pActionManager->GetGroupAmount();
    fileHead.m_iActionOffset = file.GetPos();
    file.Seek(fileHead.m_iActionOffset, AFILE_SEEK_SET);

    std::vector<unsigned int> groupList;
    pActionManager->GetGroupIDList(groupList);
    for (int i=0; i<fileHead.m_iGroupAmount; ++i)
    {
        SaveActionGroupToFile(file, pActionManager->GetGroup(groupList[i]));
    }
    file.ResetPointer();
    file.Write(&fileHead, sizeof(AnmFileHead), &iWriteLength);

    file.Close();
    return true;
}

bool CAnmTranslator::ImportActionGroup(const wchar_t *szFile)
{
    FILE *file = NULL;
    if ((file = _wfopen(szFile, L"rb")) == NULL)
    {
        return false;
    }
    LoadActionGroupFromFile(file);
    fclose(file);

    return true;
}

bool CAnmTranslator::ExportActionGroup(const wchar_t *szFile, CAnmActionGroup *pActionGroup)
{
    if (pActionGroup)
    {
        AFile file;
        file.Open(WC2AS(szFile), AFILE_BINARY | AFILE_CREATENEW);
        file.ResetPointer();
        SaveActionGroupToFile(file, pActionGroup);
        file.Close();
    }
    return true;
}

bool CAnmTranslator::LoadActionGroupFromFile(FILE *file)
{
    CAnmActionManager *pActionManager = m_pAnimator->GetActionManager();
    AnmActionGroup actionGroup;

    fread(&actionGroup, sizeof(AnmActionGroup), 1, file);
    actionGroup.m_uiGroupID = pActionManager->CreateGroup();
    CAnmActionGroup *pActionGroup = pActionManager->GetGroup(actionGroup.m_uiGroupID);
    if (!pActionGroup)
    {
        return false;
    }
    pActionGroup->SetGroupName(actionGroup.m_sGroupName);

    // Read Action Channels from file and create Action Channels for ActionGroup
    for (int i=0; i<actionGroup.m_iChannelAmount; ++i)
    {
        AnmActionChannel actionChannel;
        fread(&actionChannel, sizeof(AnmActionChannel), 1, file);
        actionChannel.m_uiChannelID = pActionGroup->CreateChannel(CAnmActionGroup::ActionChannelType(actionChannel.m_uiChannelType));
        CAnmActionChannel *pActionChannel = pActionGroup->GetChannel(actionChannel.m_uiChannelID);
        if (!pActionChannel)
        {
            return false;
        }
        pActionChannel->BindObjectID(actionChannel.m_uiObjectID);
        pActionChannel->SetChannelName(actionChannel.m_sChannelName);

        // Read Actions from file and create Actions for ActionChannel
        for (int j=0; j<actionChannel.m_iActionAmount; ++j)
        {
            AnmAction action;
            fread(&action, sizeof(AnmAction), 1, file);
            action.m_uiActionID = pActionChannel->CreateAction(CAnmAction::ActionType(action.m_uiActionType));
            CAnmAction *pAction = pActionChannel->GetAction(action.m_uiActionID);
            if (!pAction)
            {
                return false;
            }
            pAction->SetStartTime(action.m_dwStartTime);
            pAction->BindObjectID(action.m_uiObjectID);

            switch (action.m_uiActionType)
            {
                case CAnmAction::TYPE_MOVE:
                {
                    AnmMove move;
                    CAnmMove *pMove = dynamic_cast<CAnmMove*>(pAction);
                    fread(&move, sizeof(AnmMove), 1, file);
                    pMove->SetStartPos(A3DVECTOR3(move.m_fStartPosX,
                                                  move.m_fStartPosY,
                                                  move.m_fStartPosZ));
                    pMove->SetEndPos(A3DVECTOR3(move.m_fEndPosX,
                                                move.m_fEndPosY,
                                                move.m_fEndPosZ));
                    pMove->SetOrientation(A3DQUATERNION(move.m_fOrientationW,
                                                        move.m_fOrientationX,
                                                        move.m_fOrientationY,
                                                        move.m_fOrientationZ));
                    pMove->SetRotateAxis(move.m_iRotateAxisType);
                    pMove->SetAngle(move.m_fRotateAngle);
                    pMove->SetAccelerationPercent(move.m_fAccelerationPercent);
                    pMove->SetTotalFrames(move.m_iTotalFrames);
                    pMove->SetCloseTerrain(move.m_bCloseTerrain);
                    break;
                }

                case CAnmRotate::TYPE_ROTATE:
                {
                    AnmRotate rotate;
                    CAnmRotate *pRotate = dynamic_cast<CAnmRotate*>(pAction);
                    fread(&rotate, sizeof(AnmRotate), 1, file);
                    pRotate->SetStartRotate(A3DQUATERNION(rotate.m_fStartRotateW,
                                                          rotate.m_fStartRotateX,
                                                          rotate.m_fStartRotateY,
                                                          rotate.m_fStartRotateZ));
                    pRotate->SetA(A3DQUATERNION(rotate.m_fAW, rotate.m_fAX, rotate.m_fAY, rotate.m_fAZ));
                    pRotate->SetB(A3DQUATERNION(rotate.m_fBW, rotate.m_fBX, rotate.m_fBY, rotate.m_fBZ));
                    pRotate->SetEndRotate(A3DQUATERNION(rotate.m_fEndRotateW,
                                                        rotate.m_fEndRotateX,
                                                        rotate.m_fEndRotateY,
                                                        rotate.m_fEndRotateZ));
                    pRotate->SetUseSquad(rotate.m_bUseSquad);
                    pRotate->SetTotalFrames(rotate.m_iTotalFrames);
                    break;
                }

                case CAnmAction::TYPE_SCALE:
                {
                    AnmScale scale;
                    CAnmScale *pScale = dynamic_cast<CAnmScale*>(pAction);
                    fread(&scale, sizeof(AnmScale), 1, file);
                    pScale->SetStartScale(scale.m_fStartScale);
                    pScale->SetEndScale(scale.m_fEndScale);
                    pScale->SetTotalFrames(scale.m_iTotalFrames);
                    break;
                }

                case CAnmAction::TYPE_FOV:
                {
                    AnmFOV FOV;
                    CAnmFOV *pFOV = dynamic_cast<CAnmFOV*>(pAction);
                    fread(&FOV, sizeof(AnmFOV), 1, file);
                    pFOV->SetStartFOV(FOV.m_fStartFOV);
                    pFOV->SetEndFOV(FOV.m_fEndFOV);
                    pFOV->SetTotalFrames(FOV.m_iTotalFrames);
                    break;
                }

                case CAnmAction::TYPE_JUMP:
                {
                    AnmJump jump;
                    CAnmJump *pJump = dynamic_cast<CAnmJump*>(pAction);
                    fread(&jump, sizeof(AnmJump), 1, file);
                    pJump->SetStartPos(A3DVECTOR3(jump.m_fStartPosX,
                                                  jump.m_fStartPosY,
                                                  jump.m_fStartPosZ));
                    pJump->SetEndPos(A3DVECTOR3(jump.m_fEndPosX,
                                                jump.m_fEndPosY,
                                                jump.m_fEndPosZ));
                    pJump->SetTotalFrames(jump.m_iTotalFrames);
                    break;
                }

                case CAnmAction::TYPE_MOTION:
                {
                    AnmMotion motion;
                    CAnmMotion *pMotion = dynamic_cast<CAnmMotion*>(pAction);
                    fread(&motion, sizeof(AnmMotion), 1, file);
                    pMotion->SetMotionType(CAnmMotion::MotionType(motion.m_uiMotionType));
                    pMotion->SetStartMotionFrame(motion.m_iStartMotionFrame);
                    pMotion->SetBlendFrames(motion.m_iBlendFrames);
                    pMotion->SetTotalFrames(motion.m_iTotalFrames);
                    pMotion->SetActionName(motion.m_sActionName);
                    pMotion->SetActionSpeed(motion.m_fActionSpeed);
                    pMotion->SetShowGFX(motion.m_bShowGFX);
                    break;
                }

                case CAnmAction::TYPE_BEZIER_MOVE:
                {
                    AnmBezierMove bezierMove;
                    CAnmBezierMove *pBezierMove = dynamic_cast<CAnmBezierMove*>(pAction);
                    fread(&bezierMove, sizeof(AnmBezierMove), 1, file);
                    pBezierMove->SetBezierID(bezierMove.m_uiBezierID);
                    pBezierMove->SetUseOrientation(bezierMove.m_bUseOrientation);
                    pBezierMove->SetCloseTerrain(bezierMove.m_bCloseTerrain);
                    break;
                }

                case CAnmAction::TYPE_DISPLAY_HIDE:
                {
                    AnmDisplayHide displayHide;
                    CAnmDisplayHide *pDisplayHide = dynamic_cast<CAnmDisplayHide*>(pAction);
                    fread(&displayHide, sizeof(AnmDisplayHide), 1, file);
                    pDisplayHide->SetVisableType(CAnmDisplayHide::VisableType(displayHide.m_uiVisableType));
                    break;
                }

                case CAnmAction::TYPE_DIALOGUE:
                {
                    AnmDialogue dialogue;
                    CAnmDialogue *pDialogue = dynamic_cast<CAnmDialogue*>(pAction);
                    fread(&dialogue, sizeof(AnmDialogue), 1, file);
                    pDialogue->SetTotalFrames(dialogue.m_iTotalFrames);
                    pDialogue->SetDialogue(dialogue.m_sDialogue);
                    break;
                }

                case CAnmAction::TYPE_SOUND:
                {
                    AnmSound sound;
                    CAnmSound *pSound = dynamic_cast<CAnmSound*>(pAction);
                    fread(&sound, sizeof(AnmSound), 1, file);
                    pSound->SetTotalFrames(sound.m_iTotalFrames);
                    pSound->SetStartSeconds(sound.m_iStartSeconds);
                    pSound->SetVolume(sound.m_uiVolume);
                    pSound->SetSoundFileName(sound.m_sSoundFileName);
                    break;
                }

                case CAnmAction::TYPE_HOOK:
                {
                    AnmHook hook;
                    CAnmHook *pHook = dynamic_cast<CAnmHook*>(pAction);
                    fread(&hook, sizeof(AnmHook), 1, file);
                    pHook->SetTotalFrames(hook.m_iTotalFrames);
                    pHook->SetHangerName(hook.m_sHangerName);
                    pHook->SetHookName(hook.m_sHookName);
                    pHook->SetHookObjectID(hook.m_uiHookObjectID);
                    pHook->SetElseHookName(hook.m_sElseHookName);
                    break;
                }

                case CAnmAction::TYPE_SPEED_CONTROL:
                {
                    AnmSpeedControl speed;
                    CAnmSpeedControl *pSpeed = dynamic_cast<CAnmSpeedControl*>(pAction);
                    fread(&speed, sizeof(AnmSpeedControl), 1, file);
                    pSpeed->SetTotalFrames(speed.m_iTotalFrames);
                    pSpeed->SetSpeed(speed.m_fSpeed);
                    break;
                }

                case CAnmAction::TYPE_CAMERA_FILTER:
                {
                    AnmCameraFilter filter;
                    CAnmCameraFilter *pFilter = dynamic_cast<CAnmCameraFilter*>(pAction);
                    fread(&filter, sizeof(AnmCameraFilter), 1, file);
                    pFilter->SetColor(filter.m_uiColor);
                    pFilter->SetFilterType(filter.m_uiFilterType);
                    pFilter->SetTransparent(filter.m_fTransparent);
                    pFilter->SetTotalFrames(filter.m_iTotalFrames);
                    break;
                }

                case CAnmAction::TYPE_CAMERA_OSCILLATORY:
                {
                    AnmCameraOscillatory oscillatory;
                    CAnmCameraOscillatory *pOscillatory = dynamic_cast<CAnmCameraOscillatory*>(pAction);
                    fread(&oscillatory, sizeof(AnmCameraOscillatory), 1, file);
                    pOscillatory->SetOscillatoryType(oscillatory.m_uiOscillatoryType);
                    pOscillatory->SetOscillatoryAxis(oscillatory.m_iOscillatoryAxis);
                    pOscillatory->SetDisplacement(oscillatory.m_fDisplacement);
                    pOscillatory->SetFrequency(oscillatory.m_fFrequency);
                    pOscillatory->SetAttenuation(oscillatory.m_iAttenuation);
                    pOscillatory->SetTotalFrames(oscillatory.m_iTotalFrames);
                    break;
                }

                case CAnmAction::TYPE_TRANSPARENT:
                {
                    AnmTransparent transparent;
                    CAnmTransparent *pTransparent = dynamic_cast<CAnmTransparent*>(pAction);
                    fread(&transparent, sizeof(AnmTransparent), 1, file);
                    pTransparent->SetStartTransparent(transparent.m_fStartTransparent);
                    pTransparent->SetEndTransparent(transparent.m_fEndTransparent);
                    pTransparent->SetTotalFrames(transparent.m_iTotalFrames);
                    break;
                }

                case CAnmAction::TYPE_HIDE_WORLD_ACTION:
                {
                    AnmHideWorldAction hideWorldAction;
                    CAnmHideWorldAction *pHideWorldAction = dynamic_cast<CAnmHideWorldAction*>(pAction);
                    fread(&hideWorldAction, sizeof(AnmHideWorldAction), 1, file);
                    pHideWorldAction->SetHideWorldType(hideWorldAction.m_uiHideWorldType);
                    pHideWorldAction->SetColor(hideWorldAction.m_uiColor);
                    pHideWorldAction->SetTotalFrames(hideWorldAction.m_iTotalFrames);
                    break;
                }

                case CAnmAction::TYPE_BLOOM:
                {
                    AnmBloom bloom;
                    CAnmBloom *pBloom = dynamic_cast<CAnmBloom*>(pAction);
                    fread(&bloom, sizeof(AnmBloom), 1, file);
                    pBloom->SetStartBloom(bloom.m_StartBloom);
                    pBloom->SetEndBloom(bloom.m_EndBloom);
                    pBloom->SetTotalFrames(bloom.m_iTotalFrames);
                    break;
                }

                case CAnmAction::TYPE_DOF:
                {
                    AnmDOF DOF;
                    CAnmDOF *pDOF = dynamic_cast<CAnmDOF*>(pAction);
                    fread(&DOF, sizeof(AnmDOF), 1, file);
                    pDOF->SetStartDOF(DOF.m_StartDOF);
                    pDOF->SetEndDOF(DOF.m_EndDOF);
                    pDOF->SetTotalFrames(DOF.m_iTotalFrames);
                    break;
                }

                case CAnmAction::TYPE_RADIAL_BLUR:
                {
                    AnmRadialBlur radialBlur;
                    CAnmRadialBlur *pRadialBlur = dynamic_cast<CAnmRadialBlur*>(pAction);
                    fread(&radialBlur, sizeof(AnmRadialBlur), 1, file);
                    pRadialBlur->SetStartRadialBlur(radialBlur.m_StartRadialBlur);
                    pRadialBlur->SetEndRadialBlur(radialBlur.m_EndRadialBlur);
                    pRadialBlur->SetTotalFrames(radialBlur.m_iTotalFrames);
                    break;
                }

                case CAnmAction::TYPE_MOTION_BLUR:
                {
                    AnmMotionBlur motionBlur;
                    CAnmMotionBlur *pMotionBlur = dynamic_cast<CAnmMotionBlur*>(pAction);
                    fread(&motionBlur, sizeof(AnmMotionBlur), 1, file);
                    pMotionBlur->SetStartMotionBlur(motionBlur.m_StartMotionBlur);
                    pMotionBlur->SetEndMotionBlur(motionBlur.m_EndMotionBlur);
                    pMotionBlur->SetTotalFrames(motionBlur.m_iTotalFrames);
                    break;
                }

                case CAnmAction::TYPE_WARP:
                {
                    AnmWarp warp;
                    CAnmWarp *pWarp = dynamic_cast<CAnmWarp*>(pAction);
                    fread(&warp, sizeof(AnmWarp), 1, file);
                    pWarp->SetStartScale(warp.m_fStartScale);
                    pWarp->SetEndScale(warp.m_fEndScale);
                    pWarp->SetStartSpeed(warp.m_fStartSpeed);
                    pWarp->SetEndSpeed(warp.m_fEndSpeed);
                    pWarp->SetEnableMask(warp.m_bEnableMask);
                    pWarp->SetMaskPath(warp.m_sMaskFile);
                    pWarp->SetTotalFrames(warp.m_iTotalFrames);
                    break;
                }

                case CAnmAction::TYPE_CC:
                {
                    AnmCC cc;
                    CAnmCC *pCC = dynamic_cast<CAnmCC*>(pAction);
                    fread(&cc, sizeof(AnmCC), 1, file);
                    pCC->SetStartFactor(cc.m_fStartFactor);
                    pCC->SetEndFactor(cc.m_fEndFactor);
                    pCC->SetTex1Path(cc.m_sTex1File);
                    pCC->SetTex2Path(cc.m_sTex2File);
                    pCC->SetTotalFrames(cc.m_iTotalFrames);
                    break;
                }

                case CAnmAction::TYPE_GOD_RAY:
                {
                    AnmGodRay godRay;
                    CAnmGodRay *pGodRay = dynamic_cast<CAnmGodRay*>(pAction);
                    fread(&godRay, sizeof(AnmGodRay), 1, file);
                    pGodRay->SetStartGodRay(godRay.m_StartGodRay);
                    pGodRay->SetEndGodRay(godRay.m_EndGodRay);
                    pGodRay->SetTotalFrames(godRay.m_iTotalFrames);
                    break;
                }

                case CAnmAction::TYPE_ADD_SKIN:
                {
                    AnmAddSkin addSkin;
                    CAnmAddSkin *pAddSkin = dynamic_cast<CAnmAddSkin*>(pAction);
                    fread(&addSkin, sizeof(AnmAddSkin), 1, file);
                    pAddSkin->SetSkinPath(addSkin.m_sSkinFile);
                    pAddSkin->SetTotalFrames(addSkin.m_iTotalFrames);
                    break;
                }

                case CAnmAction::TYPE_QTE:
                {
                    AnmQTE QTE;
                    CAnmQTE *pQTE = dynamic_cast<CAnmQTE*>(pAction);
                    fread(&QTE, sizeof(AnmQTE), 1, file);
                    pQTE->SetTotalFrames(QTE.m_iTotalFrames);
                    pQTE->SetQTEID(QTE.m_uiQTEID);
                    pQTE->SetSpeed(QTE.m_fSpeed);
                    break;
                }

                default:
                    return false;
            }
        }
    }
    return true;
}

bool CAnmTranslator::SaveActionGroupToFile(AFile &file, CAnmActionGroup *pActionGroup)
{
    if (pActionGroup)
    {
        AnmActionGroup actionGroup;
        DWORD iWriteLength;
        ACString stringName;
        actionGroup.m_uiGroupID = pActionGroup->GetGroupID();
        actionGroup.m_iChannelAmount = pActionGroup->GetChannelAmount();
        stringName = pActionGroup->GetGroupName();
        wcscpy(actionGroup.m_sGroupName, &stringName[0]);
        file.Write(&actionGroup, sizeof(AnmActionGroup), &iWriteLength);

        // Write Action Channels to file
        std::vector<unsigned int> channelList;
        pActionGroup->GetChannelIDList(channelList);
        for (int i=0; i<actionGroup.m_iChannelAmount; ++i)
        {
            AnmActionChannel actionChannel;
            CAnmActionChannel *pActionChannel = pActionGroup->GetChannel(channelList[i]);
            actionChannel.m_uiChannelID = pActionChannel->GetChannelID();
            actionChannel.m_uiObjectID = pActionChannel->GetObjectID();
            actionChannel.m_uiChannelType = pActionChannel->GetChannelType();
            actionChannel.m_iActionAmount = pActionChannel->GetActionAmount();
            stringName = pActionChannel->GetChannelName();
            wcscpy(actionChannel.m_sChannelName, &stringName[0]);
            file.Write(&actionChannel, sizeof(AnmActionChannel), &iWriteLength);

            // Write Actions to file
            std::vector<unsigned int> actionList;
            pActionChannel->GetActionIDList(actionList);
            for (int j=0; j<actionChannel.m_iActionAmount; ++j)
            {
                AnmAction action;
                CAnmAction *pAction = pActionChannel->GetAction(actionList[j]);
                action.m_uiActionID = pAction->GetActionID();
                action.m_uiObjectID = pAction->GetObjectID();
                action.m_uiActionType = pAction->GetActionType();
                action.m_dwStartTime = pAction->GetStartTime();
                file.Write(&action, sizeof(AnmAction), &iWriteLength);

                // Write Move action
                switch (action.m_uiActionType)
                {
                    case CAnmAction::TYPE_MOVE:
                    {
                        AnmMove move;
                        CAnmMove *pMove = dynamic_cast<CAnmMove*>(pAction);
                        move.m_fStartPosX = pMove->GetStartPos().x;
                        move.m_fStartPosY = pMove->GetStartPos().y;
                        move.m_fStartPosZ = pMove->GetStartPos().z;
                        move.m_fEndPosX = pMove->GetEndPos().x;
                        move.m_fEndPosY = pMove->GetEndPos().y;
                        move.m_fEndPosZ = pMove->GetEndPos().z;
                        move.m_fOrientationW = pMove->GetOrientation().w;
                        move.m_fOrientationX = pMove->GetOrientation().x;
                        move.m_fOrientationY = pMove->GetOrientation().y;
                        move.m_fOrientationZ = pMove->GetOrientation().z;
                        move.m_iRotateAxisType = pMove->GetRotateAxis();
                        move.m_fRotateAngle = pMove->GetAngle();
                        move.m_fAccelerationPercent = pMove->GetAccelerationPercent();
                        move.m_iTotalFrames = pMove->GetTotalFrames();
                        move.m_bCloseTerrain = pMove->GetCloseTerrain();
                        file.Write(&move, sizeof(AnmMove), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_ROTATE:
                    {
                        AnmRotate rotate;
                        CAnmRotate *pRotate = dynamic_cast<CAnmRotate*>(pAction);
                        rotate.m_fStartRotateW = pRotate->GetStartRotate().w;
                        rotate.m_fStartRotateX = pRotate->GetStartRotate().x;
                        rotate.m_fStartRotateY = pRotate->GetStartRotate().y;
                        rotate.m_fStartRotateZ = pRotate->GetStartRotate().z;
                        rotate.m_fAW = pRotate->GetA().w;
                        rotate.m_fAX = pRotate->GetA().x;
                        rotate.m_fAY = pRotate->GetA().y;
                        rotate.m_fAZ = pRotate->GetA().z;
                        rotate.m_fBW = pRotate->GetB().w;
                        rotate.m_fBX = pRotate->GetB().x;
                        rotate.m_fBY = pRotate->GetB().y;
                        rotate.m_fBZ = pRotate->GetB().z;
                        rotate.m_fEndRotateW = pRotate->GetEndRotate().w;
                        rotate.m_fEndRotateX = pRotate->GetEndRotate().x;
                        rotate.m_fEndRotateY = pRotate->GetEndRotate().y;
                        rotate.m_fEndRotateZ = pRotate->GetEndRotate().z;
                        rotate.m_bUseSquad = pRotate->IsUsingSquad();
                        rotate.m_iTotalFrames = pRotate->GetTotalFrames();
                        file.Write(&rotate, sizeof(AnmRotate), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_SCALE:
                    {
                        AnmScale scale;
                        CAnmScale *pScale = dynamic_cast<CAnmScale*>(pAction);
                        scale.m_fStartScale = pScale->GetStartScale();
                        scale.m_fEndScale = pScale->GetEndScale();
                        scale.m_iTotalFrames = pScale->GetTotalFrames();
                        file.Write(&scale, sizeof(AnmScale), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_FOV:
                    {
                        AnmFOV FOV;
                        CAnmFOV *pFOV = dynamic_cast<CAnmFOV*>(pAction);
                        FOV.m_fStartFOV = pFOV->GetStartFOV();
                        FOV.m_fEndFOV = pFOV->GetEndFOV();
                        FOV.m_iTotalFrames = pFOV->GetTotalFrames();
                        file.Write(&FOV, sizeof(AnmFOV), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_JUMP:
                    {
                        AnmJump jump;
                        CAnmJump *pJump = dynamic_cast<CAnmJump*>(pAction);
                        jump.m_fStartPosX = pJump->GetStartPos().x;
                        jump.m_fStartPosY = pJump->GetStartPos().y;
                        jump.m_fStartPosZ = pJump->GetStartPos().z;
                        jump.m_fEndPosX = pJump->GetEndPos().x;
                        jump.m_fEndPosY = pJump->GetEndPos().y;
                        jump.m_fEndPosZ = pJump->GetEndPos().z;
                        jump.m_iTotalFrames = pJump->GetTotalFrames();
                        file.Write(&jump, sizeof(AnmJump), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_MOTION:
                    {
                        AnmMotion motion;
                        CAnmMotion *pMotion = dynamic_cast<CAnmMotion*>(pAction);
                        motion.m_uiMotionType = pMotion->GetMotionType();
                        motion.m_iStartMotionFrame = pMotion->GetStartMotionFrame();
                        motion.m_iBlendFrames = pMotion->GetBlendFrames();
                        motion.m_fActionSpeed = pMotion->GetActionSpeed();
                        motion.m_iTotalFrames = pMotion->GetTotalFrames();
                        stringName = pMotion->GetActionName();
                        wcscpy(motion.m_sActionName, &stringName[0]);
                        motion.m_bShowGFX = pMotion->IsShowGFX();
                        file.Write(&motion, sizeof(AnmMotion), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_BEZIER_MOVE:
                    {
                        AnmBezierMove bezierMove;
                        CAnmBezierMove *pBezierMove = dynamic_cast<CAnmBezierMove*>(pAction);
                        bezierMove.m_uiBezierID = pBezierMove->GetBezierID();
                        bezierMove.m_bUseOrientation = pBezierMove->IsUsingOrientation();
                        bezierMove.m_bCloseTerrain = pBezierMove->GetCloseTerrain();
                        file.Write(&bezierMove, sizeof(AnmBezierMove), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_DISPLAY_HIDE:
                    {
                        AnmDisplayHide displayHide;
                        CAnmDisplayHide *pDisplayHide = dynamic_cast<CAnmDisplayHide*>(pAction);
                        displayHide.m_uiVisableType = pDisplayHide->GetVisableType();
                        file.Write(&displayHide, sizeof(AnmDisplayHide), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_DIALOGUE:
                    {
                        AnmDialogue dialogue;
                        CAnmDialogue *pDialogue = dynamic_cast<CAnmDialogue*>(pAction);
                        dialogue.m_iTotalFrames = pDialogue->GetTotalFrames();
                        stringName = pDialogue->GetDialogue();
                        wcscpy(dialogue.m_sDialogue, &stringName[0]);
                        file.Write(&dialogue, sizeof(AnmDialogue), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_SOUND:
                    {
                        AnmSound sound;
                        CAnmSound *pSound = dynamic_cast<CAnmSound*>(pAction);
                        sound.m_iTotalFrames = pSound->GetTotalFrames();
                        sound.m_iStartSeconds = pSound->GetStartSeconds();
                        sound.m_uiVolume = pSound->GetVolume();
                        stringName = pSound->GetSoundFileName();
                        wcscpy(sound.m_sSoundFileName, &stringName[0]);
                        file.Write(&sound, sizeof(AnmSound), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_HOOK:
                    {
                        AnmHook hook;
                        CAnmHook *pHook = dynamic_cast<CAnmHook*>(pAction);
                        hook.m_iTotalFrames = pHook->GetTotalFrames();

                        stringName = pHook->GetHangerName();
                        wcscpy(hook.m_sHangerName, &stringName[0]);

                        stringName = pHook->GetHookName();
                        wcscpy(hook.m_sHookName, &stringName[0]);

                        hook.m_uiHookObjectID = pHook->GetHookObjectID();

                        stringName = pHook->GetElseHookName();
                        wcscpy(hook.m_sElseHookName, &stringName[0]);

                        file.Write(&hook, sizeof(AnmHook), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_SPEED_CONTROL:
                    {
                        AnmSpeedControl speed;
                        CAnmSpeedControl *pSpeed = dynamic_cast<CAnmSpeedControl*>(pAction);
                        speed.m_iTotalFrames = pSpeed->GetTotalFrames();
                        speed.m_fSpeed = pSpeed->GetSpeed();
                        file.Write(&speed, sizeof(AnmSpeedControl), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_CAMERA_FILTER:
                    {
                        AnmCameraFilter filter;
                        CAnmCameraFilter *pFilter = dynamic_cast<CAnmCameraFilter*>(pAction);
                        filter.m_uiColor = pFilter->GetColor();
                        filter.m_uiFilterType = pFilter->GetFilterType();
                        filter.m_fTransparent = pFilter->GetTransparent();
                        filter.m_iTotalFrames = pFilter->GetTotalFrames();
                        file.Write(&filter, sizeof(AnmCameraFilter), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_CAMERA_OSCILLATORY:
                    {
                        AnmCameraOscillatory oscillatory;
                        CAnmCameraOscillatory *pOscillatory = dynamic_cast<CAnmCameraOscillatory*>(pAction);
                        oscillatory.m_uiOscillatoryType = pOscillatory->GetOscillatoryType();
                        oscillatory.m_iOscillatoryAxis = pOscillatory->GetOscillatoryAxis();
                        oscillatory.m_iAttenuation = pOscillatory->GetAttenuation();
                        oscillatory.m_fDisplacement = pOscillatory->GetDisplacement();
                        oscillatory.m_fFrequency = pOscillatory->GetFrequency();
                        oscillatory.m_iTotalFrames = pOscillatory->GetTotalFrames();
                        file.Write(&oscillatory, sizeof(AnmCameraOscillatory), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_TRANSPARENT:
                    {
                        AnmTransparent transparent;
                        CAnmTransparent *pTransparent = dynamic_cast<CAnmTransparent*>(pAction);
                        transparent.m_fStartTransparent = pTransparent->GetStartTransparent();
                        transparent.m_fEndTransparent = pTransparent->GetEndTransparent();
                        transparent.m_iTotalFrames = pTransparent->GetTotalFrames();
                        file.Write(&transparent, sizeof(AnmTransparent), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_HIDE_WORLD_ACTION:
                    {
                        AnmHideWorldAction hideWorldAction;
                        CAnmHideWorldAction *pHideWorldAction = dynamic_cast<CAnmHideWorldAction*>(pAction);
                        hideWorldAction.m_uiHideWorldType = pHideWorldAction->GetHideWorldType();
                        hideWorldAction.m_uiColor = pHideWorldAction->GetColor();
                        hideWorldAction.m_iTotalFrames = pHideWorldAction->GetTotalFrames();
                        file.Write(&hideWorldAction, sizeof(AnmHideWorldAction), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_BLOOM:
                    {
                        AnmBloom bloom;
                        CAnmBloom *pBloom = dynamic_cast<CAnmBloom*>(pAction);
                        bloom.m_StartBloom = pBloom->GetStartBloom();
                        bloom.m_EndBloom = pBloom->GetEndBloom();
                        bloom.m_iTotalFrames = pBloom->GetTotalFrames();
                        file.Write(&bloom, sizeof(AnmBloom), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_DOF:
                    {
                        AnmDOF DOF;
                        CAnmDOF *pDOF = dynamic_cast<CAnmDOF*>(pAction);
                        DOF.m_StartDOF = pDOF->GetStartDOF();
                        DOF.m_EndDOF = pDOF->GetEndDOF();
                        DOF.m_iTotalFrames = pDOF->GetTotalFrames();
                        file.Write(&DOF, sizeof(AnmDOF), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_RADIAL_BLUR:
                    {
                        AnmRadialBlur radialBlur;
                        CAnmRadialBlur *pRadialBlur = dynamic_cast<CAnmRadialBlur*>(pAction);
                        radialBlur.m_StartRadialBlur = pRadialBlur->GetStartRadialBlur();
                        radialBlur.m_EndRadialBlur = pRadialBlur->GetEndRadialBlur();
                        radialBlur.m_iTotalFrames = pRadialBlur->GetTotalFrames();
                        file.Write(&radialBlur, sizeof(AnmRadialBlur), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_MOTION_BLUR:
                    {
                        AnmMotionBlur motionBlur;
                        CAnmMotionBlur *pMotionBlur = dynamic_cast<CAnmMotionBlur*>(pAction);
                        motionBlur.m_StartMotionBlur = pMotionBlur->GetStartMotionBlur();
                        motionBlur.m_EndMotionBlur = pMotionBlur->GetEndMotionBlur();
                        motionBlur.m_iTotalFrames = pMotionBlur->GetTotalFrames();
                        file.Write(&motionBlur, sizeof(AnmMotionBlur), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_WARP:
                    {
                        AnmWarp warp;
                        CAnmWarp *pWarp = dynamic_cast<CAnmWarp*>(pAction);
                        warp.m_fStartScale = pWarp->GetStartScale();
                        warp.m_fEndScale = pWarp->GetEndScale();
                        warp.m_fStartSpeed = pWarp->GetStartSpeed();
                        warp.m_fEndSpeed = pWarp->GetEndSpeed();
                        warp.m_bEnableMask = pWarp->GetEnableMask();
                        stringName = pWarp->GetMaskPath();
                        wcscpy(warp.m_sMaskFile, &stringName[0]);
                        warp.m_iTotalFrames = pWarp->GetTotalFrames();
                        file.Write(&warp, sizeof(AnmWarp), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_CC:
                    {
                        AnmCC cc;
                        CAnmCC *pCC = dynamic_cast<CAnmCC*>(pAction);
                        cc.m_fStartFactor = pCC->GetStartFactor();
                        cc.m_fEndFactor = pCC->GetEndFactor();
                        stringName = pCC->GetTex1Path();
                        wcscpy(cc.m_sTex1File, &stringName[0]);
                        stringName = pCC->GetTex2Path();
                        wcscpy(cc.m_sTex2File, &stringName[0]);
                        cc.m_iTotalFrames = pCC->GetTotalFrames();
                        file.Write(&cc, sizeof(AnmCC), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_GOD_RAY:
                    {
                        AnmGodRay godRay;
                        CAnmGodRay *pGodRay = dynamic_cast<CAnmGodRay*>(pAction);
                        godRay.m_StartGodRay = pGodRay->GetStartGodRay();
                        godRay.m_EndGodRay = pGodRay->GetEndGodRay();
                        godRay.m_iTotalFrames = pGodRay->GetTotalFrames();
                        file.Write(&godRay, sizeof(AnmGodRay), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_ADD_SKIN:
                    {
                        AnmAddSkin addSkin;
                        CAnmAddSkin *pAddSkin = dynamic_cast<CAnmAddSkin*>(pAction);
                        stringName = pAddSkin->GetSkinPath();
                        wcscpy(addSkin.m_sSkinFile, &stringName[0]);
                        addSkin.m_iTotalFrames = pAddSkin->GetTotalFrames();
                        file.Write(&addSkin, sizeof(AnmAddSkin), &iWriteLength);
                        break;
                    }

                    case CAnmAction::TYPE_QTE:
                    {
                        AnmQTE QTE;
                        CAnmQTE *pQTE = dynamic_cast<CAnmQTE*>(pAction);
                        QTE.m_iTotalFrames = pQTE->GetTotalFrames();
                        QTE.m_uiQTEID = pQTE->GetQTEID();
                        QTE.m_fSpeed = pQTE->GetSpeed();
                        file.Write(&QTE, sizeof(AnmQTE), &iWriteLength);
                        break;
                    }

                    default:
                        break;
                }
            }
        }
    }
    return true;
}

CAnmTranslator::~CAnmTranslator()
{
}
