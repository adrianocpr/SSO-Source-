// stdafx.h : include file for standard system include files,
//  or project specific include files that are used frequently, but
//      are changed infrequently
//

#if !defined(AFX_STDAFX_H__590AEA44_6126_4988_8BD8_B138330F53DC__INCLUDED_)
#define AFX_STDAFX_H__590AEA44_6126_4988_8BD8_B138330F53DC__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define VC_EXTRALEAN        // Exclude rarely-used stuff from Windows headers

#include <afxwin.h>         // MFC core and standard components
#include <afxext.h>         // MFC extensions
#include <afxdtctl.h>       // MFC support for Internet Explorer 4 Common Controls
#ifndef _AFX_NO_AFXCMN_SUPPORT
#include <afxcmn.h>         // MFC support for Windows Common Controls
#endif // _AFX_NO_AFXCMN_SUPPORT

#include <EC_StrHeader.h>

#ifndef _UNICODE
#define _UNICODE        // _UNICODE is used by C-runtime/MFC headers
#endif

#define CELGRASSLAND       A3DGrassLand
#define CELGRASSTYPE       A3DGrassType
#define CELTERRAINOUTLINE2 A3DTerrainOutline2
#define CECSUNMOON         A3DSunMoon
#define CELOUTLINEQUADNODE A3DOutlineQuadNode
#define CECManager         ECManager
#define CECViewport        ECViewport

#include <A3D.h>
#include <A3DGrassLand.h>
#include <A3DGrassType.h>
#include <A3DTerrainOutline2.h>
#include <A3DSunMoon.h>
#include <ECManager.h>
#include <ECViewport.h>
#include <ECRObjBase.h>
#include <ECRShadowRender.h>

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_STDAFX_H__590AEA44_6126_4988_8BD8_B138330F53DC__INCLUDED_)
