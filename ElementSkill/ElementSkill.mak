# Microsoft Developer Studio Generated NMAKE File, Based on ElementSkill.dsp
!IF "$(CFG)" == ""
CFG=ElementSkill - Win32 Release
!MESSAGE No configuration specified. Defaulting to ElementSkill - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "ElementSkill - Win32 Release" && "$(CFG)" != "ElementSkill - Win32 Debug" && "$(CFG)" != "ElementSkill - Win32 DbgRelease"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "ElementSkill.mak" CFG="ElementSkill - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "ElementSkill - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ElementSkill - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ElementSkill - Win32 DbgRelease" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "ElementSkill - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

ALL : "$(OUTDIR)\ElementSkill.dll"


CLEAN :
	-@erase "$(INTDIR)\ElementSkill.obj"
	-@erase "$(INTDIR)\gnstring.obj"
	-@erase "$(INTDIR)\skill.obj"
	-@erase "$(INTDIR)\skillwrapper.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\stubs1.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\ElementSkill.dll"
	-@erase "$(OUTDIR)\ElementSkill.exp"
	-@erase "$(OUTDIR)\ElementSkill.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O1 /I "./" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "ELEMENTSKILL_EXPORTS" /D "_SKILL_CLIENT" /Fp"$(INTDIR)\ElementSkill.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ElementSkill.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /incremental:no /pdb:"$(OUTDIR)\ElementSkill.pdb" /machine:I386 /include:"_MessageBoxA@16" /def:".\shell\elementskill.def" /out:"$(OUTDIR)\ElementSkill.dll" /implib:"$(OUTDIR)\ElementSkill.lib" 
DEF_FILE= \
	".\shell\elementskill.def"
LINK32_OBJS= \
	".\shell\cpu.obj" \
	".\shell\depack.obj" \
	".\shell\disasm.obj" \
	".\shell\disasm_x86.obj" \
	".\shell\mhook.obj" \
	".\shell\misc.obj" \
	".\shell\Stub.obj" \
	".\shell\tea.obj" \
	".\shell\PeUtils.obj" \
	"$(INTDIR)\ElementSkill.obj" \
	"$(INTDIR)\gnstring.obj" \
	"$(INTDIR)\skill.obj" \
	"$(INTDIR)\skillwrapper.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\stubs1.obj"

"$(OUTDIR)\ElementSkill.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\ElementSkill.dll"
   copy Release\ElementSkill.lib ..\lib
	copy Release\ElementSkill.dll ..\sdsbin\update
	copy ElementSkill.h ..\include
	copy skillstr.txt ..\sdsbin\configs
	copy buff_icon.txt ..\sdsbin\configs
	copy buff_str.txt ..\sdsbin\configs
	copy buff_type.txt ..\sdsbin\configs
	xcopy skillstub.h ..\include /R /Y /Q
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "ElementSkill - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

ALL : "$(OUTDIR)\ElementSkill_d.dll" "$(OUTDIR)\ElementSkill.bsc"


CLEAN :
	-@erase "$(INTDIR)\ElementSkill.obj"
	-@erase "$(INTDIR)\ElementSkill.sbr"
	-@erase "$(INTDIR)\gnstring.obj"
	-@erase "$(INTDIR)\gnstring.sbr"
	-@erase "$(INTDIR)\skill.obj"
	-@erase "$(INTDIR)\skill.sbr"
	-@erase "$(INTDIR)\skillwrapper.obj"
	-@erase "$(INTDIR)\skillwrapper.sbr"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\StdAfx.sbr"
	-@erase "$(INTDIR)\stubs1.obj"
	-@erase "$(INTDIR)\stubs1.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\ElementSkill.bsc"
	-@erase "$(OUTDIR)\ElementSkill_d.dll"
	-@erase "$(OUTDIR)\ElementSkill_d.exp"
	-@erase "$(OUTDIR)\ElementSkill_d.ilk"
	-@erase "$(OUTDIR)\ElementSkill_d.lib"
	-@erase "$(OUTDIR)\ElementSkill_d.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "ELEMENTSKILL_EXPORTS" /D "_SKILL_CLIENT" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ElementSkill.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\ElementSkill.sbr" \
	"$(INTDIR)\gnstring.sbr" \
	"$(INTDIR)\skill.sbr" \
	"$(INTDIR)\skillwrapper.sbr" \
	"$(INTDIR)\StdAfx.sbr" \
	"$(INTDIR)\stubs1.sbr"

"$(OUTDIR)\ElementSkill.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /incremental:yes /pdb:"$(OUTDIR)\ElementSkill_d.pdb" /debug /machine:I386 /include:"_MessageBoxA@16" /def:".\shell\elementskill.def" /out:"$(OUTDIR)\ElementSkill_d.dll" /implib:"$(OUTDIR)\ElementSkill_d.lib" /pdbtype:sept 
DEF_FILE= \
	".\shell\elementskill.def"
LINK32_OBJS= \
	".\shell\cpu.obj" \
	".\shell\depack.obj" \
	".\shell\disasm.obj" \
	".\shell\disasm_x86.obj" \
	".\shell\mhook.obj" \
	".\shell\misc.obj" \
	".\shell\Stub.obj" \
	".\shell\tea.obj" \
	".\shell\PeUtils.obj" \
	"$(INTDIR)\ElementSkill.obj" \
	"$(INTDIR)\gnstring.obj" \
	"$(INTDIR)\skill.obj" \
	"$(INTDIR)\skillwrapper.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\stubs1.obj"

"$(OUTDIR)\ElementSkill_d.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\ElementSkill_d.dll" "$(OUTDIR)\ElementSkill.bsc"
   xcopy debug\elementskill_d.lib ..\lib /R /Y /Q
	xcopy debug\elementskill_d.dll ..\sdsbin\update /R /Y /Q
	xcopy ElementSkill.h ..\include /R /Y /Q
	xcopy skillstr.txt ..\sdsbin\configs  /R /Y /Q
	xcopy buff_icon.txt ..\sdsbin\configs  /R /Y /Q
	xcopy buff_str.txt ..\sdsbin\configs  /R /Y /Q
	xcopy buff_type.txt ..\sdsbin\configs  /R /Y /Q
	xcopy skillstub.h ..\include /R /Y /Q
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "ElementSkill - Win32 DbgRelease"

OUTDIR=.\DbgRelease
INTDIR=.\DbgRelease
# Begin Custom Macros
OutDir=.\DbgRelease
# End Custom Macros

ALL : "$(OUTDIR)\ElementSkill.dll"


CLEAN :
	-@erase "$(INTDIR)\ElementSkill.obj"
	-@erase "$(INTDIR)\gnstring.obj"
	-@erase "$(INTDIR)\skill.obj"
	-@erase "$(INTDIR)\skillwrapper.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\stubs1.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\ElementSkill.dll"
	-@erase "$(OUTDIR)\ElementSkill.exp"
	-@erase "$(OUTDIR)\ElementSkill.lib"
	-@erase "$(OUTDIR)\ElementSkill.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "../include/iolib" /I "../include/stlport" /I "./" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "ELEMENTSKILL_EXPORTS" /D "_SKILL_CLIENT" /Fp"$(INTDIR)\ElementSkill.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ElementSkill.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /incremental:no /pdb:"$(OUTDIR)\ElementSkill.pdb" /debug /machine:I386 /include:"_MessageBoxA@16" /def:".\shell\elementskill.def" /out:"$(OUTDIR)\ElementSkill.dll" /implib:"$(OUTDIR)\ElementSkill.lib" /libpath:"../lib/stlport" 
DEF_FILE= \
	".\shell\elementskill.def"
LINK32_OBJS= \
	".\shell\cpu.obj" \
	".\shell\depack.obj" \
	".\shell\disasm.obj" \
	".\shell\disasm_x86.obj" \
	".\shell\mhook.obj" \
	".\shell\misc.obj" \
	".\shell\Stub.obj" \
	".\shell\tea.obj" \
	".\shell\PeUtils.obj" \
	"$(INTDIR)\ElementSkill.obj" \
	"$(INTDIR)\gnstring.obj" \
	"$(INTDIR)\skill.obj" \
	"$(INTDIR)\skillwrapper.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\stubs1.obj"

"$(OUTDIR)\ElementSkill.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\DbgRelease
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\ElementSkill.dll"
   copy DbgRelease\ElementSkill.lib ..\lib
	copy DbgRelease\ElementSkill.dll ..\sdsbin\update
	copy ElementSkill.h ..\include
	copy skillstr.txt ..\sdsbin\configs
	copy buff_icon.txt ..\sdsbin\configs
	copy buff_str.txt ..\sdsbin\configs
	copy buff_type.txt ..\sdsbin\configs
	xcopy skillstub.h ..\include /R /Y /Q
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("ElementSkill.dep")
!INCLUDE "ElementSkill.dep"
!ELSE 
!MESSAGE Warning: cannot find "ElementSkill.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "ElementSkill - Win32 Release" || "$(CFG)" == "ElementSkill - Win32 Debug" || "$(CFG)" == "ElementSkill - Win32 DbgRelease"
SOURCE=.\ElementSkill.cpp

!IF  "$(CFG)" == "ElementSkill - Win32 Release"


"$(INTDIR)\ElementSkill.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "ElementSkill - Win32 Debug"


"$(INTDIR)\ElementSkill.obj"	"$(INTDIR)\ElementSkill.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "ElementSkill - Win32 DbgRelease"


"$(INTDIR)\ElementSkill.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\gnstring.cpp

!IF  "$(CFG)" == "ElementSkill - Win32 Release"


"$(INTDIR)\gnstring.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "ElementSkill - Win32 Debug"


"$(INTDIR)\gnstring.obj"	"$(INTDIR)\gnstring.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "ElementSkill - Win32 DbgRelease"


"$(INTDIR)\gnstring.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\skill.cpp

!IF  "$(CFG)" == "ElementSkill - Win32 Release"


"$(INTDIR)\skill.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "ElementSkill - Win32 Debug"


"$(INTDIR)\skill.obj"	"$(INTDIR)\skill.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "ElementSkill - Win32 DbgRelease"


"$(INTDIR)\skill.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\skillwrapper.cpp

!IF  "$(CFG)" == "ElementSkill - Win32 Release"


"$(INTDIR)\skillwrapper.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "ElementSkill - Win32 Debug"


"$(INTDIR)\skillwrapper.obj"	"$(INTDIR)\skillwrapper.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "ElementSkill - Win32 DbgRelease"


"$(INTDIR)\skillwrapper.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\StdAfx.cpp

!IF  "$(CFG)" == "ElementSkill - Win32 Release"


"$(INTDIR)\StdAfx.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "ElementSkill - Win32 Debug"


"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\StdAfx.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "ElementSkill - Win32 DbgRelease"


"$(INTDIR)\StdAfx.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\stubs1.cpp

!IF  "$(CFG)" == "ElementSkill - Win32 Release"


"$(INTDIR)\stubs1.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "ElementSkill - Win32 Debug"


"$(INTDIR)\stubs1.obj"	"$(INTDIR)\stubs1.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "ElementSkill - Win32 DbgRelease"


"$(INTDIR)\stubs1.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 


!ENDIF 

