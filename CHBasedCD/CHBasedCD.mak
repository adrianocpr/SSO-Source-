# Microsoft Developer Studio Generated NMAKE File, Based on CHBasedCD.dsp
!IF "$(CFG)" == ""
CFG=CHBasedCD - Win32 Release
!MESSAGE No configuration specified. Defaulting to CHBasedCD - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "CHBasedCD - Win32 Release" && "$(CFG)" != "CHBasedCD - Win32 Debug" && "$(CFG)" != "CHBasedCD - Win32 DbgRelease"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "CHBasedCD.mak" CFG="CHBasedCD - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "CHBasedCD - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "CHBasedCD - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE "CHBasedCD - Win32 DbgRelease" (based on "Win32 (x86) Static Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "CHBasedCD - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

ALL : "$(OUTDIR)\CHBasedCD.lib"


CLEAN :
	-@erase "$(INTDIR)\2DGiftWrap.obj"
	-@erase "$(INTDIR)\2DObstruct.obj"
	-@erase "$(INTDIR)\aabbcd.obj"
	-@erase "$(INTDIR)\CDWithCH.obj"
	-@erase "$(INTDIR)\CombGenerator.obj"
	-@erase "$(INTDIR)\ConvexHullAlgorithm.obj"
	-@erase "$(INTDIR)\ConvexHullData.obj"
	-@erase "$(INTDIR)\ConvexPolytope.obj"
	-@erase "$(INTDIR)\EdgeStack.obj"
	-@erase "$(INTDIR)\Face.obj"
	-@erase "$(INTDIR)\GiftWrap.obj"
	-@erase "$(INTDIR)\HalfSpace.obj"
	-@erase "$(INTDIR)\LEquations.obj"
	-@erase "$(INTDIR)\Matrix.obj"
	-@erase "$(INTDIR)\Patch.obj"
	-@erase "$(INTDIR)\RightPrism.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\CHBasedCD.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_MBCS" /D "_LIB" /Fp"$(INTDIR)\CHBasedCD.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CHBasedCD.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\CHBasedCD.lib" 
LIB32_OBJS= \
	"$(INTDIR)\2DGiftWrap.obj" \
	"$(INTDIR)\2DObstruct.obj" \
	"$(INTDIR)\aabbcd.obj" \
	"$(INTDIR)\CDWithCH.obj" \
	"$(INTDIR)\CombGenerator.obj" \
	"$(INTDIR)\ConvexHullAlgorithm.obj" \
	"$(INTDIR)\ConvexHullData.obj" \
	"$(INTDIR)\ConvexPolytope.obj" \
	"$(INTDIR)\EdgeStack.obj" \
	"$(INTDIR)\Face.obj" \
	"$(INTDIR)\GiftWrap.obj" \
	"$(INTDIR)\HalfSpace.obj" \
	"$(INTDIR)\LEquations.obj" \
	"$(INTDIR)\Matrix.obj" \
	"$(INTDIR)\Patch.obj" \
	"$(INTDIR)\RightPrism.obj"

"$(OUTDIR)\CHBasedCD.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\CHBasedCD.lib"
   xcopy release\*.lib ..\lib\cd\ /R /Y /Q
	xcopy *.h ..\include\cd\ /R /Y /Q
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "CHBasedCD - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

ALL : "$(OUTDIR)\CHBasedCD_d.lib"


CLEAN :
	-@erase "$(INTDIR)\2DGiftWrap.obj"
	-@erase "$(INTDIR)\2DObstruct.obj"
	-@erase "$(INTDIR)\aabbcd.obj"
	-@erase "$(INTDIR)\CDWithCH.obj"
	-@erase "$(INTDIR)\CombGenerator.obj"
	-@erase "$(INTDIR)\ConvexHullAlgorithm.obj"
	-@erase "$(INTDIR)\ConvexHullData.obj"
	-@erase "$(INTDIR)\ConvexPolytope.obj"
	-@erase "$(INTDIR)\EdgeStack.obj"
	-@erase "$(INTDIR)\Face.obj"
	-@erase "$(INTDIR)\GiftWrap.obj"
	-@erase "$(INTDIR)\HalfSpace.obj"
	-@erase "$(INTDIR)\LEquations.obj"
	-@erase "$(INTDIR)\Matrix.obj"
	-@erase "$(INTDIR)\Patch.obj"
	-@erase "$(INTDIR)\RightPrism.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\CHBasedCD_d.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_MBCS" /D "_LIB" /Fp"$(INTDIR)\CHBasedCD.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CHBasedCD.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\CHBasedCD_d.lib" 
LIB32_OBJS= \
	"$(INTDIR)\2DGiftWrap.obj" \
	"$(INTDIR)\2DObstruct.obj" \
	"$(INTDIR)\aabbcd.obj" \
	"$(INTDIR)\CDWithCH.obj" \
	"$(INTDIR)\CombGenerator.obj" \
	"$(INTDIR)\ConvexHullAlgorithm.obj" \
	"$(INTDIR)\ConvexHullData.obj" \
	"$(INTDIR)\ConvexPolytope.obj" \
	"$(INTDIR)\EdgeStack.obj" \
	"$(INTDIR)\Face.obj" \
	"$(INTDIR)\GiftWrap.obj" \
	"$(INTDIR)\HalfSpace.obj" \
	"$(INTDIR)\LEquations.obj" \
	"$(INTDIR)\Matrix.obj" \
	"$(INTDIR)\Patch.obj" \
	"$(INTDIR)\RightPrism.obj"

"$(OUTDIR)\CHBasedCD_d.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

SOURCE="$(InputPath)"
PostBuild_Desc=copy files to the lib
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\CHBasedCD_d.lib"
   xcopy debug\*.lib ..\lib\cd\ /R /Y /Q
	xcopy *.h ..\include\cd\ /R /Y /Q
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "CHBasedCD - Win32 DbgRelease"

OUTDIR=.\DbgRelease
INTDIR=.\DbgRelease
# Begin Custom Macros
OutDir=.\DbgRelease
# End Custom Macros

ALL : "$(OUTDIR)\CHBasedCD_su.lib"


CLEAN :
	-@erase "$(INTDIR)\2DGiftWrap.obj"
	-@erase "$(INTDIR)\2DObstruct.obj"
	-@erase "$(INTDIR)\aabbcd.obj"
	-@erase "$(INTDIR)\CDWithCH.obj"
	-@erase "$(INTDIR)\CombGenerator.obj"
	-@erase "$(INTDIR)\ConvexHullAlgorithm.obj"
	-@erase "$(INTDIR)\ConvexHullData.obj"
	-@erase "$(INTDIR)\ConvexPolytope.obj"
	-@erase "$(INTDIR)\EdgeStack.obj"
	-@erase "$(INTDIR)\Face.obj"
	-@erase "$(INTDIR)\GiftWrap.obj"
	-@erase "$(INTDIR)\HalfSpace.obj"
	-@erase "$(INTDIR)\LEquations.obj"
	-@erase "$(INTDIR)\Matrix.obj"
	-@erase "$(INTDIR)\Patch.obj"
	-@erase "$(INTDIR)\RightPrism.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\CHBasedCD_su.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Zi /O2 /D "WIN32" /D "NDEBUG" /D "_MBCS" /D "_LIB" /Fp"$(INTDIR)\CHBasedCD.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CHBasedCD.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\CHBasedCD_su.lib" 
LIB32_OBJS= \
	"$(INTDIR)\2DGiftWrap.obj" \
	"$(INTDIR)\2DObstruct.obj" \
	"$(INTDIR)\aabbcd.obj" \
	"$(INTDIR)\CDWithCH.obj" \
	"$(INTDIR)\CombGenerator.obj" \
	"$(INTDIR)\ConvexHullAlgorithm.obj" \
	"$(INTDIR)\ConvexHullData.obj" \
	"$(INTDIR)\ConvexPolytope.obj" \
	"$(INTDIR)\EdgeStack.obj" \
	"$(INTDIR)\Face.obj" \
	"$(INTDIR)\GiftWrap.obj" \
	"$(INTDIR)\HalfSpace.obj" \
	"$(INTDIR)\LEquations.obj" \
	"$(INTDIR)\Matrix.obj" \
	"$(INTDIR)\Patch.obj" \
	"$(INTDIR)\RightPrism.obj"

"$(OUTDIR)\CHBasedCD_su.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\DbgRelease
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\CHBasedCD_su.lib"
   xcopy dbgrelease\*.lib ..\lib\cd\ /R /Y /Q
	xcopy *.h ..\include\cd\ /R /Y /Q
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("CHBasedCD.dep")
!INCLUDE "CHBasedCD.dep"
!ELSE 
!MESSAGE Warning: cannot find "CHBasedCD.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "CHBasedCD - Win32 Release" || "$(CFG)" == "CHBasedCD - Win32 Debug" || "$(CFG)" == "CHBasedCD - Win32 DbgRelease"
SOURCE=.\2DGiftWrap.cpp

"$(INTDIR)\2DGiftWrap.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\2DObstruct.cpp

"$(INTDIR)\2DObstruct.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\aabbcd.cpp

"$(INTDIR)\aabbcd.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\CDWithCH.cpp

"$(INTDIR)\CDWithCH.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\CombGenerator.cpp

"$(INTDIR)\CombGenerator.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ConvexHullAlgorithm.cpp

"$(INTDIR)\ConvexHullAlgorithm.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ConvexHullData.cpp

"$(INTDIR)\ConvexHullData.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ConvexPolytope.cpp

"$(INTDIR)\ConvexPolytope.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\EdgeStack.cpp

"$(INTDIR)\EdgeStack.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Face.cpp

"$(INTDIR)\Face.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\GiftWrap.cpp

"$(INTDIR)\GiftWrap.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\HalfSpace.cpp

"$(INTDIR)\HalfSpace.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\LEquations.cpp

"$(INTDIR)\LEquations.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Matrix.cpp

"$(INTDIR)\Matrix.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Patch.cpp

"$(INTDIR)\Patch.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\RightPrism.cpp

"$(INTDIR)\RightPrism.obj" : $(SOURCE) "$(INTDIR)"



!ENDIF 

