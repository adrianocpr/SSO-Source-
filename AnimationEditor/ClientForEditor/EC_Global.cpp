 /*
 * FILE: EC_Global.cpp
 *
 * DESCRIPTION: Element client, Global definition and declaration
 *
 * CREATED BY: duyuxin, 2003/12/11
 *
 * HISTORY:
 *
 * Copyright (c) 2003 Archosaur Studio, All Rights Reserved.
 */

//#define _WIN32_WINDOWS 0x0410 

#include "StdAfx.h"
#include "EC_Global.h"
#include "EC_Game.h"
#include "EC_GameRun.h"
//#include "EC_HostPlayer.h"
//#include "EC_Sect.h"
//#include "EC_UIManager.h"
//#include "EC_GameUIMan.h"
//#include "EC_LoginUIMan.h"
//#include "EC_CameraPath.h"
//#include "EC_HostPackSet.h"
//#include "EC_ManDemoPlayer.h"

//#include "Network/IOLib/gnoctets.h"
//#include "Network/IOLib/gnsecure.h"

///////////////////////////////////////////////////////////////////////////
//	
//	Define and Macro
//	
///////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////
//	
//	Reference to External variables and functions
//	
///////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////
//	
//	Local Types and Variables and Global variables
//	
///////////////////////////////////////////////////////////////////////////

ALog	g_Log;
char	g_szWorkDir[MAX_PATH];

A3DVECTOR3	g_vOrigin(0.0f);
A3DVECTOR3	g_vAxisX(1.0f, 0.0f, 0.0f);
A3DVECTOR3	g_vAxisY(0.0f, 1.0f, 0.0f);
A3DVECTOR3	g_vAxisZ(0.0f, 0.0f, 1.0f);

CRITICAL_SECTION	g_csException;
//CRITICAL_SECTION	g_csSession;
CRITICAL_SECTION	g_csRTDebug;

bool				g_bTrojanDumpLastTime = false;

//	Error messages
static AString l_aErrorMsgs[] = 
{
	_EA("Unknown error."),			//	ECERR_UNKNOWN
	_EA("Invalid parameter."),		//	ECERR_INVALIDPARAMETER	
	_EA("Not enough memory."),		//	ECERR_NOTENOUGHMEMORY
	_EA("File operation error."),	//	ECERR_FILEOPERATION	
	_EA("Failed to call function."),	//	ECERR_FAILEDTOCALL	
	_EA("Wrong version."),			//	ECERR_WRONGVERSION
};

///////////////////////////////////////////////////////////////////////////
//	
//	Local functions
//	
///////////////////////////////////////////////////////////////////////////

static void _LogOutput(const char* szMsg)
{
	g_Log.Log(szMsg);
}

//	Initialize log system
bool glb_InitLogSystem(const char* szFile)
{
	if (!g_Log.Init(szFile, _EA("Element client log file")))
		return false;
	a_RedirectDefLogOutput(_LogOutput);
	return true;
}

//	Close log system
void glb_CloseLogSystem()
{
	g_Log.Release();
	a_RedirectDefLogOutput(NULL);
}

//	Output predefined error
void glb_ErrorOutput(int iErrCode, const char* szFunc, int iLine)
{
	char szMsg[1024];
	sprintf(szMsg, _EA("%s: %s (line: %d)"), szFunc, l_aErrorMsgs[iErrCode], iLine);
	a_LogOutput(1, szMsg);
}
