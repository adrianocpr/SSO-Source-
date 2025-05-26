# Microsoft Developer Studio Project File - Name="AnimationEditor" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=AnimationEditor - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "AnimationEditor.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "AnimationEditor.mak" CFG="AnimationEditor - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "AnimationEditor - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "AnimationEditor - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""$/SDSElement/SDSAnimationEditor", PPOBAAAA"
# PROP Scc_LocalPath "."
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "AnimationEditor - Win32 Release"

# PROP BASE Use_MFC 5
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /Yu"stdafx.h" /FD /c
# ADD CPP /nologo /MD /W3 /GR /GX /O2 /I "..\SDSCommon" /I "..\SDSAnimationEditor" /I "..\SDSAnimationEditor\ClientForEditor" /I "..\SDSCHBasedCD" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "UNICODE" /D "_ELEMENT_EDITOR_" /D "ANIMATION_EDITOR" /D "_AFXDLL" /Yu"stdafx.h" /FD /c
# SUBTRACT CPP /Fr
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x804 /d "NDEBUG"
# ADD RSC /l 0x804 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:I386
# ADD LINK32 DdsTrans.lib CHBasedCD.lib Imm32.lib mpg123lib.lib Immwrapper.lib AngelicaCommon_u.lib AngelicaMedia_u.lib AngelicaFile_u.lib Angelica3D_u.lib zliblib.lib dxguid.lib d3d8.lib d3dx8.lib dsound.lib dinput8.lib shlwapi.lib dxerr8.lib SpeedTreeRT.lib lua5.1.mt.lib gfxcommon.lib wintab32.lib luawrapper_u.lib vorbisfile_static.lib vorbis_static.lib ogg_static.lib APhysXEngineStatic.lib PhysXLoader.lib NxCooking.lib NxCharacter.lib /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /pdb:"bin/AnimationEditor.pdb" /machine:I386 /out:"../SDSBin/AnimationEditor.exe" /libpath:"..\lib" /libpath:"..\lib\stlport" /libpath:"..\lib\CD" /libpath:"..\lib\wintab"
# SUBTRACT LINK32 /pdb:none /incremental:yes

!ELSEIF  "$(CFG)" == "AnimationEditor - Win32 Debug"

# PROP BASE Use_MFC 5
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /Yu"stdafx.h" /FD /GZ /c
# ADD CPP /nologo /MDd /W3 /Gm /GR /GX /ZI /Od /I "..\SDSCommon" /I "..\SDSAnimationEditor" /I "..\SDSAnimationEditor\ClientForEditor" /I "..\SDSCHBasedCD" /D "WIN32" /D "_DEBUG" /D "_NOMINIDUMP" /D "_WINDOWS" /D "_MBCS" /D "UNICODE" /D "ANIMATION_EDITOR" /D "_AFXDLL" /FR /Yu"stdafx.h" /FD /GZ /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x804 /d "_DEBUG"
# ADD RSC /l 0x804 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 DdsTrans.lib CHBasedCD_d.lib Imm32.lib mpg123lib_d.lib Immwrapper_d.lib AngelicaCommon_ud.lib AngelicaMedia_ud.lib AngelicaFile_ud.lib Angelica3D_ud.lib zliblib.lib dxguid.lib d3d8.lib d3dx8.lib dsound.lib dinput8.lib shlwapi.lib dxerr8.lib SpeedTreeRT.lib lua5.1.mt.lib gfxcommon_d.lib wintab32.lib luawrapper_du.lib vorbisfile_static_d.lib vorbis_static_d.lib ogg_static_d.lib APhysXEngineStatic.lib PhysXLoader.lib NxCooking.lib NxCharacter.lib /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /debug /machine:I386 /out:"../SDSBin/AnimationEditor_d.exe" /pdbtype:sept /libpath:"..\lib" /libpath:"..\lib\stlport" /libpath:"..\lib\CD" /libpath:"..\lib\wintab"
# SUBTRACT LINK32 /pdb:none

!ENDIF 

# Begin Target

# Name "AnimationEditor - Win32 Release"
# Name "AnimationEditor - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\ActionBezierMoveDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\ActionBezierPointDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\ActionCameraFilterDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\ActionCameraOscillatory.cpp
# End Source File
# Begin Source File

SOURCE=.\ActionDialogueDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\ActionDisplayHideDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\ActionHideWorldDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\ActionHookDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\ActionJumpDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\ActionMotionDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\ActionMoveDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\ActionScaleDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\ActionSoundDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\ActionSpeedControlDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\ActionTransparentDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\AnimationEditor.cpp
# End Source File
# Begin Source File

SOURCE=.\AnimationEditorView.cpp
# End Source File
# Begin Source File

SOURCE=.\base64.cpp
# End Source File
# Begin Source File

SOURCE=.\BezierDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\BezierList.cpp
# End Source File
# Begin Source File

SOURCE=.\BindCameraDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\CWButton.cpp
# End Source File
# Begin Source File

SOURCE=.\CWControlBar.cpp
# End Source File
# Begin Source File

SOURCE=.\CWTabctrlBar.cpp
# End Source File
# Begin Source File

SOURCE=.\MainFrm.cpp
# End Source File
# Begin Source File

SOURCE=.\MoveActionsDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\NewActionDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\NewObjectDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\ObjectList.cpp
# End Source File
# Begin Source File

SOURCE=.\OperationRecorder.cpp
# End Source File
# Begin Source File

SOURCE=.\PlayerDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\SelectedObjectDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\SetTimeDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\StdAfx.cpp
# ADD CPP /Yc"stdafx.h"
# End Source File
# Begin Source File

SOURCE=.\TrackChannel.cpp
# End Source File
# Begin Source File

SOURCE=.\TrackChannelDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\TrackGroup.cpp
# End Source File
# Begin Source File

SOURCE=.\TrackGroupDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\TrackNode.cpp
# End Source File
# Begin Source File

SOURCE=.\TrackPanel.cpp
# End Source File
# Begin Source File

SOURCE=.\TrackRuler.cpp
# End Source File
# Begin Source File

SOURCE=.\WorldDlg.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\ActionBezierMoveDlg.h
# End Source File
# Begin Source File

SOURCE=.\ActionBezierPointDlg.h
# End Source File
# Begin Source File

SOURCE=.\ActionCameraFilterDlg.h
# End Source File
# Begin Source File

SOURCE=.\ActionCameraOscillatory.h
# End Source File
# Begin Source File

SOURCE=.\ActionDialogueDlg.h
# End Source File
# Begin Source File

SOURCE=.\ActionDisplayHideDlg.h
# End Source File
# Begin Source File

SOURCE=.\ActionHideWorldDlg.h
# End Source File
# Begin Source File

SOURCE=.\ActionHookDlg.h
# End Source File
# Begin Source File

SOURCE=.\ActionJumpDlg.h
# End Source File
# Begin Source File

SOURCE=.\ActionMotionDlg.h
# End Source File
# Begin Source File

SOURCE=.\ActionMoveDlg.h
# End Source File
# Begin Source File

SOURCE=.\ActionScaleDlg.h
# End Source File
# Begin Source File

SOURCE=.\ActionSoundDlg.h
# End Source File
# Begin Source File

SOURCE=.\ActionSpeedControlDlg.h
# End Source File
# Begin Source File

SOURCE=.\ActionTransparentDlg.h
# End Source File
# Begin Source File

SOURCE=.\AnimationEditor.h
# End Source File
# Begin Source File

SOURCE=.\AnimationEditorView.h
# End Source File
# Begin Source File

SOURCE=.\base64.h
# End Source File
# Begin Source File

SOURCE=.\BezierDlg.h
# End Source File
# Begin Source File

SOURCE=.\BezierList.h
# End Source File
# Begin Source File

SOURCE=.\BindCameraDlg.h
# End Source File
# Begin Source File

SOURCE=.\CWButton.h
# End Source File
# Begin Source File

SOURCE=.\CWControlBar.h
# End Source File
# Begin Source File

SOURCE=.\CWTabCtrlBar.h
# End Source File
# Begin Source File

SOURCE=.\MainFrm.h
# End Source File
# Begin Source File

SOURCE=.\MoveActionsDlg.h
# End Source File
# Begin Source File

SOURCE=.\NewActionDlg.h
# End Source File
# Begin Source File

SOURCE=.\NewObjectDlg.h
# End Source File
# Begin Source File

SOURCE=.\ObjectList.h
# End Source File
# Begin Source File

SOURCE=.\OperationRecorder.h
# End Source File
# Begin Source File

SOURCE=.\PlayerDlg.h
# End Source File
# Begin Source File

SOURCE=.\Resource.h
# End Source File
# Begin Source File

SOURCE=.\SelectedObjectDlg.h
# End Source File
# Begin Source File

SOURCE=.\SetTimeDlg.h
# End Source File
# Begin Source File

SOURCE=.\StdAfx.h
# End Source File
# Begin Source File

SOURCE=.\TrackChannel.h
# End Source File
# Begin Source File

SOURCE=.\TrackChannelDlg.h
# End Source File
# Begin Source File

SOURCE=.\TrackGroup.h
# End Source File
# Begin Source File

SOURCE=.\TrackGroupDlg.h
# End Source File
# Begin Source File

SOURCE=.\TrackNode.h
# End Source File
# Begin Source File

SOURCE=.\TrackPanel.h
# End Source File
# Begin Source File

SOURCE=.\TrackRuler.h
# End Source File
# Begin Source File

SOURCE=.\WorldDlg.h
# End Source File
# End Group
# Begin Group "SDSCommon"

# PROP Default_Filter ""
# Begin Group "Animator"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\SDSCommon\Animator\Animator.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\Animator.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmAction.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmAction.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmActionChannel.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmActionChannel.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmActionGroup.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmActionGroup.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmActionManager.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmActionManager.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmAxes.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmAxes.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmBezier.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmBezier.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmBezierManager.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmBezierManager.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmBezierMove.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmBezierMove.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmBezierPoint.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmBezierPoint.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmBezierSegment.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmBezierSegment.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmCamera.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmCamera.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmCameraFilter.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmCameraFilter.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmCameraOscillatory.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmCameraOscillatory.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmDialogue.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmDialogue.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmDisplayHide.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmDisplayHide.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmGFX.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmGFX.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmHideWorldAction.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmHideWorldAction.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmHook.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmHook.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmJump.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmJump.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmMotion.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmMotion.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmMove.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmMove.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmNPC.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmNPC.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmObject.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmObject.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmObjectManager.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmObjectManager.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmPlayer.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmPlayer.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmRayTrace.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmRayTrace.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmScale.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmScale.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmSound.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmSound.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmSpeedControl.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmSpeedControl.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmTranslator.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmTranslator.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmTransparent.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmTransparent.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmWorld.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\Animator\AnmWorld.h
# End Source File
# End Group
# Begin Group "Common"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\SDSCommon\EC_Bezier.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EC_Bezier.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EC_BrushMan.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EC_BrushMan.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EC_BrushManUtil.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EC_SceneObject.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EC_SceneThreadObj.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EC_TriangleMan.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EC_TriangleMan.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EC_WorldFile.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_BackMusic.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_BackMusic.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_BrushBuilding.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_BrushBuilding.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_Building.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_Building.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_Cloud.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_Cloud.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_CloudManager.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_CloudManager.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_CloudSprite.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_CloudSprite.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_Forest.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_Forest.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_Grassland.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_Grassland.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_GrassType.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_GrassType.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_Precinct.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_Precinct.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_Region.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_Region.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_Tree.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\EL_Tree.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\ELOutlineQuadTree.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\ELOutlineQuadTree.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\ELOutlineTexture.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\ELOutlineTexture.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\ELTerrainOutline2.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\ELTerrainOutline2.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\globaldataman.cpp
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\globaldataman.h
# End Source File
# Begin Source File

SOURCE=..\SDSCommon\AUTOCA\Utilities.h
# End Source File
# End Group
# Begin Group "ClientForEditor"

# PROP Default_Filter ""
# Begin Group "ShellSDK"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\ClientForEditor\ShellSDK\EncStr.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\ShellSDK\EncStr.h
# End Source File
# End Group
# Begin Source File

SOURCE=.\ClientForEditor\EC_Algorithm.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_Configs.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_Configs.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_Counter.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_FullGlowRender.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_FullGlowRender.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_Game.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_Game.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_GameRun.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_GameRun.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_GFXCaster.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_GFXCaster.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_Global.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_Global.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_GrassArea.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_GrassArea.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_ID64.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_Instance.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_Instance.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_Manager.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_Manager.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_ManOrnament.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_ManOrnament.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_ManSkillGfx.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_ManSkillGfx.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_MsgDef.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_Object.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_Object.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_Ornament.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_Ornament.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_PortraitRender.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_PortraitRender.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_Resource.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_Resource.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_RTDebug.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_RTDebug.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_Scene.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_Scene.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_SceneBlock.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_SceneBlock.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_SceneLights.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_SceneLights.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_SceneLoader.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_SceneLoader.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_ScnBoxArea.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_ScnBoxArea.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_ScreenRender.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_ScreenRender.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_ShadowRender.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_ShadowRender.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_SimpleBloomRender.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_SimpleBloomRender.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_SoundCache.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_SoundCache.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_StringTab.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_StringTab.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_SunMoon.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_SunMoon.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_Utility.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_Utility.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_Viewport.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_Viewport.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_World.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\EC_World.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\LuaBind.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\LuaBind.h
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\LuaFuncCommon.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientForEditor\LuaFuncCommon.h
# End Source File
# End Group
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\res\AnimationEditor.ico
# End Source File
# Begin Source File

SOURCE=.\AnimationEditor.rc
# End Source File
# Begin Source File

SOURCE=.\res\AnimationEditor.rc2
# End Source File
# Begin Source File

SOURCE=.\res\bitmap1.bmp
# End Source File
# Begin Source File

SOURCE=.\res\imagelist.bmp
# End Source File
# Begin Source File

SOURCE=.\res\Toolbar.bmp
# End Source File
# End Group
# End Target
# End Project
