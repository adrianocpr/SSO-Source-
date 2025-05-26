/*
 * FILE: EC_Utility.cpp
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Duyuxin, 2004/9/2
 *
 * HISTORY: 
 *
 * Copyright (c) 2004 Archosaur Studio, All Rights Reserved.
 */

//#define _WIN32_WINDOWS 0x0410 

#include "stdafx.h"

#define CELGRASSLAND       A3DGrassLand
#define CELGRASSTYPE       A3DGrassType
#define CELTERRAINOUTLINE2 A3DTerrainOutline2
#define CECSUNMOON         A3DSunMoon
#define CECManager         ECManager
#define CECViewport        ECViewport

#include "EC_Global.h"
#include "EC_Utility.h"
#include "EC_Game.h"
#include "EC_GameRun.h"
#include "EC_World.h"
#include "EC_Configs.h"
#include "EC_SceneLights.h"
#include "EC_Model.h"
#include "EC_TriangleMan.h"
#include "EC_ManOrnament.h"


#include "AFI.h"
#include "A3DMacros.h"
#include "A3DLight.h"
#include "A3DFuncs.h"
#include "AC.h"
#include "A3DMathUtility.h"
#include "A3DCamera.h"
#include "A3DSkin.h"
#include "A3DShader.h"
#include "A3DShaderMan.h"
#include "A3DTerrain2.h"
#include "A3DGfxExMan.h"
#include "A3DSkillGfxComposer.h"
#include "AIniFile.h"

#include <winbase.h>

///////////////////////////////////////////////////////////////////////////
//	
//	Define and Macro
//	
///////////////////////////////////////////////////////////////////////////

#define	MAX_MOVECLIP_PLANES		10

///////////////////////////////////////////////////////////////////////////
//	
//	Reference to External variables and functions
//	
///////////////////////////////////////////////////////////////////////////

bool g_bExceptionOccured = false;
DWORD g_dwFatalErrorFlag = 0;


///////////////////////////////////////////////////////////////////////////
//	
//	Local Types and Variables and Global variables
//	
///////////////////////////////////////////////////////////////////////////

class APhysXScene;


///////////////////////////////////////////////////////////////////////////
//	
//	Local functions
//	
///////////////////////////////////////////////////////////////////////////

/*	Clip velocity along specified plane.

	vInVel: original velocity.
	vNormal: plane's normal
	vOutVel: result velocity.
	fOverBounce: over bounce.
*/
static void _ClipVelocity(const A3DVECTOR3& vInVel, const A3DVECTOR3& vNormal, A3DVECTOR3& vOutVel, float fOverBounce)
{
	float fBackOff = DotProduct(vInVel, vNormal);
	
	if (fBackOff < 0.0f)
		fBackOff *= fOverBounce;
	else
		fBackOff = 0.0f;// /= fOverBounce;
	
	vOutVel = vInVel - vNormal * fBackOff;

	if (Magnitude(vOutVel) > 1000)
		ASSERT(0);
}

///////////////////////////////////////////////////////////////////////////
//	
//	Implement
//	
///////////////////////////////////////////////////////////////////////////

TextWithColor::TextWithColor()
{
	str			= _T("");
	color		= 0 ;
	bUseColor	= false;
	userData    = 0;
}

TextWithColor::TextWithColor(const TextWithColor& src)
{
	str			= src.str;
	color		= src.color;
	bUseColor	= src.bUseColor;
	userData    = src.userData;
}

//	Create a directory
bool glb_CreateDirectory(const char* szDir)
{
	AString strDir = szDir;
	int iLen = strDir.GetLength();

	if (iLen <= 3)
		return true;

	//	Clear the last '\\'
	if (strDir[iLen-1] == '\\')
		strDir[iLen-1] = '\0';

	//	Save current directory
	char szCurDir[MAX_PATH];
	GetCurrentDirectoryA(MAX_PATH, szCurDir);

	AString strTemp;

	int iPos = strDir.Find('\\', 0);
	while (iPos > 0)
	{
		strTemp = strDir.Mid(0, iPos);
		CreateDirectoryA(strTemp, NULL);
		iPos = strDir.Find('\\', iPos+1);
	}

	CreateDirectoryA(szDir, NULL);

	//	Restore current directory
	SetCurrentDirectoryA(szCurDir);

	return true;
}

/*	Check whether specified file exist.

	Return true specified file exist, otherwise return false.

	szFile: file's full name
*/
bool glb_FileExist(const char* szFile)
{
	if (!szFile || !szFile[0])
		return false;

	FILE* fp = fopen(szFile, _EA("rb"));
	if (!fp)
		return false;

	fclose(fp);
	return true;
}

/*	Change file's extension

	szFile (in, out): file name.
	szNewExt: new extension of file
*/
void glb_ChangeExtension(char* szFile, const char* szNewExt)
{
#ifdef _DEBUG
	
	int iLen = strlen(szFile);
	if (iLen <= 4)
	{
		ASSERT(iLen > 4);
		return;
	}

#endif

	char* pTemp = strrchr(szFile, '.');
	if (!pTemp)
	{
		strcat(szFile, _EA("."));
		strcat(szFile, szNewExt);
	}
	else
	{
		strcpy(pTemp+1, szNewExt);
	}
}

void glb_ClearExtension(char* szFile)
{
	char* pTemp = strrchr(szFile, '.');
	if (pTemp)
		*pTemp = '\0';
}

bool glb_WriteString(FILE* fp, const char* str)
{
	ASSERT(str);

	//	Write length of string
	int iLen = strlen(str);
	fwrite(&iLen, 1, sizeof (int), fp);

	//	Write string data
	if (iLen)
		fwrite(str, 1, iLen, fp);

	return true;
}

bool glb_PercentProbability(int iPercent)
{
	int iRand = a_Random() % 100;
	return iRand < iPercent ? true : false;
}

bool glb_PercentProbability(float fPercent)
{
	return a_Random(0.0f, 100.0f) < fPercent;
}

A3DVECTOR3 glb_RandomVectorH(int* piDegree/* NULL */)
{
	ASSERT(g_pA3DMathUtility);

	int iDegree = a_Random(0, 359);

	if (piDegree)
		*piDegree = iDegree;

	return A3DVECTOR3(g_pA3DMathUtility->COS((float)iDegree), 0.0f, g_pA3DMathUtility->SIN((float)iDegree));
}

A3DVECTOR3 glb_RandomVector()
{
	ASSERT(g_pA3DMathUtility);

	A3DVECTOR3 vVec;
	float fScale;

	int iDegree = a_Random(0, 179);
	vVec.y = g_pA3DMathUtility->SIN((float)iDegree);
	fScale = g_pA3DMathUtility->COS((float)iDegree);

	iDegree = a_Random(0, 359);
	vVec.x = g_pA3DMathUtility->COS((float)iDegree) * fScale;
	vVec.z = g_pA3DMathUtility->SIN((float)iDegree) * fScale;

	return vVec;
}

//	Compress horizontal direction to a byte
BYTE glb_CompressDirH(float x, float z)
{
	static const float fInvInter = 256.0f / 360.0f;

	if (fabs(x) < 0.00001)
	{
		if (z > 0.0f)
			return 64;
		else
			return 192;
	}
	else
	{
		float fDeg = RAD2DEG((float)atan2(z, x));
		return (BYTE)(fDeg * fInvInter);
	}
}

//	Decompress horizontal direction
A3DVECTOR3 glb_DecompressDirH(BYTE byDir)
{
	static const float fInter = 360.0f / 256.0f;

	float fRad = DEG2RAD(byDir * fInter);
	A3DVECTOR3 v;
	v.x = (float)cos(fRad);
	v.z = (float)sin(fRad);
	v.y = 0.0f;

	return v;
}

//	Integer compare function used by qsort
int glb_IntCompare(const void* arg1, const void* arg2)
{
	int i1 = *(int*)arg1;
	int i2 = *(int*)arg2;
	
	if (i1 < i2)
		return -1;
	else if (i1 > i2)
		return 1;
	else
		return 0;
}

int glb_WordCompare(const void* arg1, const void* arg2)
{
	WORD i1 = *(WORD*)arg1;
	WORD i2 = *(WORD*)arg2;
	
	if (i1 < i2)
		return -1;
	else if (i1 > i2)
		return 1;
	else
		return 0;
}
/*
unsigned long glb_HandleException(LPEXCEPTION_POINTERS pExceptionPointers)
{
	if( IsDebuggerPresent() )
		return EXCEPTION_CONTINUE_SEARCH;

	//	Use current time to build file name
	FILETIME CurrentTime;
	GetSystemTimeAsFileTime(&CurrentTime);
	TCHAR szTimeBuffer[100];
	_FormatTime(szTimeBuffer, CurrentTime);
	
	TCHAR szFile[MAX_PATH];

#ifdef UNICODE
	wsprintf(szFile, _EW("%S\\Logs\\ec_%s.dmp"), g_szWorkDir, szTimeBuffer);
#else
	wsprintf(szFile, _EW("%s\\Logs\\ec_%s.dmp"), g_szWorkDir, szTimeBuffer);
#endif

	TCHAR szFile[MAX_PATH];
	extern DWORD GAME_BUILD;
	wsprintf(szFile, _EW("%S\\Logs\\ec_build%d.dmp"), g_szWorkDir, GAME_BUILD);

	if( GetVersion() < 0x80000000 )
	{
		// WinNT or Win2000
		AMiniDump::Create(NULL, pExceptionPointers, szFile, &g_csException);
	}
	else
	{
		// Win95 or Win98 or Win32		
	}

	// if dump success, we should launch bug report program here
	STARTUPINFO si;
	ZeroMemory(&si, sizeof(si));
	si.cb = sizeof(si);
	si.dwFlags = STARTF_USESHOWWINDOW;
	si.wShowWindow = SW_SHOW;
	PROCESS_INFORMATION pi;
	ZeroMemory(&pi, sizeof(pi));
	CreateProcess(_EW("ReportBugs\\ReportBugs.exe"), NULL, NULL, NULL, FALSE, 0, NULL, _EW("ReportBugs"), &si, &pi);

	g_bExceptionOccured = true;

	return EXCEPTION_EXECUTE_HANDLER;
}*/


//	Get format local time
tm* glb_GetFormatLocalTime()
{
	time_t t;
	time(&t);
	return localtime(&t);
}



// ECModel's render for shadow call back function
bool ECModelRenderForShadow(A3DViewport * pViewport, void * pArg)
{
    /*
	A3DSkinModel *pModel = (A3DSkinModel *) pArg;
	g_pGame->GetA3DDevice()->SetZTestEnable(true);
	g_pGame->GetA3DDevice()->SetZWriteEnable(true);
	g_pGame->GetA3DDevice()->SetAlphaTestEnable(true);
	g_pGame->GetA3DDevice()->SetAlphaBlendEnable(false);
	g_pGame->GetA3DDevice()->SetAlphaFunction(A3DCMP_GREATEREQUAL);
	g_pGame->GetA3DDevice()->SetAlphaRef(84);

	pModel->RenderAtOnce(pViewport, A3DSkinModel::RAO_NOTEXTURE | A3DSkinModel::RAO_NOMATERIAL, false);

	g_pGame->GetA3DDevice()->SetAlphaBlendEnable(true);
	g_pGame->GetA3DDevice()->SetAlphaTestEnable(false);
	g_pGame->GetA3DDevice()->SetZTestEnable(true);
	g_pGame->GetA3DDevice()->SetZWriteEnable(true);
    */

	return true;
}

//	Below funcions are used by GFX lib

A3DDevice* AfxGetA3DDevice()
{
	return g_pGame->GetA3DDevice();
}

float AfxGetAverageFrameRate()
{
	return g_pGame->GetAverageFrameRate();
}

A3DGFXExMan* AfxGetGFXExMan()
{
	return g_pGame->GetA3DGFXExMan();
}

CECModelMan* AfxGetECModelMan()
{
	return g_pGame->GetECModelMan();
}

A3DSkinModel* AfxLoadA3DSkinModel(const char* szFile, int iSkinFlag)
{
	return g_pGame->LoadA3DSkinModel(szFile, iSkinFlag);
}

void AfxReleaseA3DSkinModel(A3DSkinModel* pModel)
{
	g_pGame->ReleaseA3DSkinModel(pModel);
}

const A3DLIGHTPARAM& AfxGetLightparam()
{
	return g_pGame->GetDirLight()->GetLightparam();
}

float AfxGetGrndNorm(const A3DVECTOR3& vPos, A3DVECTOR3* pNorm)
{
	CECWorld* pWorld = g_pGame->GetGameRun()->GetCurWorld();
	if (pWorld)
	{
		return pWorld->GetTerrainHeight(vPos, pNorm);
	}else
	{
		if (pNorm)
		{
			*pNorm = g_vAxisY ;
		}
		return 0;
	}
}






A3DVECTOR3 _cam_shake_offset(0);
bool _shaking_cam = false;
static int _shaking_count = 0;

A3DCamera * AfxGetA3DCamera(void)
{
	return g_pGame->GetViewport()->GetA3DCamera();
}

bool AfxGetModelUpdateFlag(void)
{
	return g_pGame->GetConfigs()->GetModelUpdateFlag();
}

void AfxBeginShakeCam()
{
	_shaking_count++;
	_shaking_cam = true;
}

void AfxEndShakeCam()
{
	if (--_shaking_count == 0)
	{
		_shaking_cam = false;
		_cam_shake_offset.Clear();
	}
}

void AfxSetCamOffset(const A3DVECTOR3& vOffset)
{
	_cam_shake_offset += vOffset;
}

AM3DSoundBuffer* AfxLoadNonLoopSound(const char* szFile, int nPriority)
{
	//return g_pGame->GetSoundCache()->LoadSound(szFile, enumSoundLoadNonLoop);
    return 0;
}

AM3DSoundBuffer* AfxLoadLoopSound(const char* szFile)
{
	//return g_pGame->GetSoundCache()->LoadSound(szFile, enumSoundLoadLoop);
    return 0;
}

void AfxReleaseSoundNonLoop(AM3DSoundBuffer*& pSound)
{
	//g_pGame->GetSoundCache()->ReleaseSound(pSound, enumSoundLoadNonLoop);
}

void AfxReleaseSoundLoop(AM3DSoundBuffer*& pSound)
{
	//g_pGame->GetSoundCache()->ReleaseSound(pSound, enumSoundLoadLoop);
}

void AfxECModelAddShadower(const A3DVECTOR3& vecCenter, const A3DAABB& aabb, A3DSkinModel* pA3DSkinModel)
{
}

void AfxSetA3DSkinModelSceneLightInfo(A3DSkinModel* pA3DSkinModel)
{
	CECSceneLights* pSceneLights = g_pGame->GetGameRun()->GetCurWorld()->GetSceneLights();
	A3DSkinModel::LIGHTINFO LightInfo = pA3DSkinModel->GetLightInfo();
	LightInfo.colAmbient	= g_pGame->GetA3DDevice()->GetAmbientValue();
	LightInfo.vLightDir		= g_pGame->GetDirLight()->GetLightparam().Direction;
	if (!g_pGame->GetConfigs()->IsEnableSkinLight())
	{
		LightInfo.colDirDiff	= g_pGame->GetDirLight()->GetLightparam().Diffuse;
		LightInfo.colDirSpec	= g_pGame->GetDirLight()->GetLightparam().Specular;
	}
	else
	{
		LightInfo.colDirDiff	= g_pGame->GetConfigs()->GetSkinLightDiff();
		LightInfo.colDirSpec	= g_pGame->GetConfigs()->GetSkinLightSpec();
	}
	LightInfo.bPtLight		= false;

	// 测试去掉点光源对skinmodel的影响，By Jiangdalong 10.06.12
	if( pSceneLights )
	{
		CECSceneLights::SCENELIGHT theLight;
		if( pSceneLights->GetSceneLight(pA3DSkinModel->GetAbsoluteTM().GetRow(3), theLight) )
		{
			LightInfo.bPtLight = true;
			LightInfo.colPtDiff = theLight.diffuse;
			LightInfo.colPtAmb =  theLight.ambient;
			LightInfo.fPtRange = theLight.vRange;
			LightInfo.vPtAtten = A3DVECTOR3(theLight.vAttenuation0, theLight.vAttenuation1, theLight.vAttenuation2);
			LightInfo.vPtLightPos = theLight.vecPos;
		}
		else
			LightInfo.bPtLight = false;
	}
	pA3DSkinModel->SetLightInfo(LightInfo);

}

bool AfxPlaySkillGfx(const AString& strAtkFile, unsigned char SerialID, __int64 nCasterID, __int64 nCastTargetID, const A3DVECTOR3* pFixedPoint, int nDivisions, TargetDataVec& Targets)
{
	using namespace _SGC;
	A3DSkillGfxComposerMan* pMan = AfxGetSkillGfxComposerMan();
	A3DSkillGfxMan* pEventMan = AfxGetSkillGfxEventMan();

    pMan->Play(
		strAtkFile,
		SerialID,
		nCasterID,
		nCastTargetID,
		pFixedPoint);

	A3DSkillGfxEvent* pEvent = pEventMan->GetSkillGfxEvent(nCasterID, SerialID);

	if (!pEvent)
		return true;

    pEvent = pEvent->GetLast();
    pEvent->SetDivisions(nDivisions);
    
    TARGET_DATA td;
    td.idTarget = 2;
    td.nDamage = 100;
    td.dwModifier = 0;
    pEvent->AddOneTarget(td);
	return true;
}

void AfxSkillGfxShowDamage(__int64 idCaster, __int64 idTarget, int nDamage, int nDivisions, DWORD dwModifier)
{
	using namespace _SGC;
	A3DSkillGfxMan::GetDamageShowFunc()(idCaster, idTarget, nDamage, 1, dwModifier);
}

void AfxSkillGfxShowCaster(__int64 idCaster, DWORD dwModifier)
{
	using namespace _SGC;
	A3DSkillGfxMan::GetCasterShowFunc()(idCaster, dwModifier);
}

bool AfxSkillGfxAddDamageData(__int64 nCaster, __int64 nTarget, unsigned char SerialId, DWORD dwModifier, int nDamage)
{
	using namespace _SGC;
	A3DSkillGfxMan* pMan = AfxGetSkillGfxEventMan();
	A3DSkillGfxEvent* pEvent = pMan->GetSkillGfxEvent(nCaster, SerialId);

	if (pEvent)

	{
		TARGET_DATA td;
		td.dwModifier = dwModifier;
		td.idTarget = nTarget;
		td.nDamage = nDamage;

		if (!pEvent->AddOneTarget(td))
			A3DSkillGfxMan::GetDamageShowFunc()(nCaster, nTarget, nDamage, 1, td.dwModifier);

		return true;
	}

	return false;
}

const char* AfxGetECMHullPath()
{
	static AString str = _EA("Models\\ECModelHull");
	return str;
}

bool gGfxGetSurfaceData(const A3DVECTOR3& vCenter, float fRadus, A3DVECTOR3* pVerts, int& nVertCount, WORD* pIndices, int& nIndexCount)
{
	A3DTerrain2* pTerrain = g_pGame->GetGameRun()->GetCurWorld()->GetTerrain();
	int _nVertCount = 0;
	int _nIndexCount = 0;
	int nTriVertCount = 0;
	int nTriIndexCount = 0;

	if (pTerrain)
	{
		int nx, nz;
		nx = nz = int(fRadus * 2.0f / pTerrain->GetGridSize()) + 3;
		_nVertCount = (nx + 1) * (nz + 1);
		_nIndexCount = nx * nz * 6;

		if (_nVertCount > nVertCount || _nIndexCount > nIndexCount)
			return false;

		RAYTRACERT trace;
		A3DVECTOR3 v = vCenter;
		v.y += 1.0f;

		if (!pTerrain->RayTrace(v, A3DVECTOR3(0, -4.f, 0), 1.0f, &trace)
	     || !pTerrain->GetFacesOfArea(trace.vHitPos, nx, nz, pVerts, pIndices))
		{
			_nVertCount = 0;
			_nIndexCount = 0;
		}
		else
		{
			pVerts += _nVertCount;
			pIndices += _nIndexCount;
		}
	}

	CECTriangleMan* pTriangleMan = g_pGame->GetGameRun()->GetCurWorld()->GetOrnamentMan()->GetTriangleMan();

	if (pTriangleMan)
	{
		TMan_Overlap_Info info;
		info.vStart = vCenter;
		info.vStart.y += 1.0f;
		info.vExtent = A3DVECTOR3(fRadus, 4.0f, fRadus);
		info.vDelta = A3DVECTOR3(0.0f, -4.0f, 0.0f);
		info.pCamera = g_pGame->GetViewport()->GetA3DCameraBase();
		pTriangleMan->TestOverlap(info);

		nTriVertCount = info.pVert.size();
		nTriIndexCount = info.pIndex.size();

		if (nTriVertCount && nTriIndexCount && nTriVertCount + _nVertCount <= nVertCount && nTriIndexCount + _nIndexCount <= nIndexCount)
		{
			for (int i = 0; i < nTriVertCount; i++)
				pVerts[i] = info.pVert[i];

			for (int i = 0; i < nTriIndexCount; i++)
				pIndices[i] = _nVertCount + info.pIndex[i];
		}else
		{
			nTriVertCount = 0;
			nTriIndexCount = 0;
		}
	}

	nVertCount = nTriVertCount + _nVertCount;
	nIndexCount = nTriIndexCount + _nIndexCount;
	return true;
}

APhysXScene* gGetAPhysXScene()
{
	return 0;
}

//判断一个字符串的开头是否是颜色信息，如果是分析颜色信息并返回true，否则返回false。
//pSrc传入原始字符串，color传出颜色，iStrOffset传出字符串的偏移量。
static bool _GetTextColor(int& iStrOffset, DWORD& color, const wchar_t* pSrc)
{
	iStrOffset = 0;
	color  = 0;
	if (!pSrc)
	{
		return false;
	}
	int nLen = wcslen(pSrc);
	if(_AL('^')==pSrc[0] && nLen>=7)//^ffcb4a 
	{
		int nValue = 0;
		int j;
		for(j = 1; j < 7; j++ )

		{
			nValue = pSrc[j];
			if( nValue >= _AL('0') && nValue <= _AL('9') )
				nValue -= _AL('0');
			else if( nValue >= _AL('a') && nValue <= _AL('f') )
				nValue = nValue - _AL('a') + 0xA;
			else if( nValue >= _AL('A') && nValue <= _AL('F') )
				nValue = nValue - _AL('A') + 0xA;
			else
				break;
			color = color * 0x10 + nValue;
		}
		if (7==j)
		{
			color |= 0xFF << 24;
			iStrOffset = 7;
			return true;
		}
	}

	color = 0;
	return false;
}


void g_SplitTextByColor(abase::vector<TextWithColor>& vecStr, const wchar_t* pSrc)
{
	vecStr.clear();
	if (!pSrc)
	{
		return;
	}

	TextWithColor textWithColor;
	bool  bUseColor = false;
	int	iStr		= 0;
	int iStrLast	= iStr;

	while (pSrc[iStr])
	{
		int iStrOffset;
		DWORD color;
		if (_GetTextColor(iStrOffset,color,pSrc+iStr))
		{
			if (iStr-iStrLast>0)
			{
				//add a new string.
				textWithColor.str       = AWString(pSrc+iStrLast,iStr-iStrLast);
				textWithColor.bUseColor = bUseColor;
				vecStr.push_back(textWithColor);
			}

			bUseColor			= true;
			textWithColor.color = color;
			iStr				+= iStrOffset;
			iStrLast			= iStr;
		}else
		{
			++iStr;
		}
	}
	if (iStr-iStrLast>0)
	{
		//add a new string.
		textWithColor.str       = AWString(pSrc+iStrLast,iStr-iStrLast);
		textWithColor.bUseColor = bUseColor;
		vecStr.push_back(textWithColor);
	}
}

int g_RandByRates(const abase::vector<double>& vecRate)

{
	if (vecRate.size()<=0)
	{
		return -1;
	}
	double rateTotal = 0;
	int i;
	bool bRate = false;
	for (i=0; i<(int)vecRate.size(); ++i)
	{
		if (vecRate[i]<0)
		{
			return -1;
		}else if (vecRate[i]>0)
		{
			bRate = true;
		}
		rateTotal+=vecRate[i];
	}
	if (!bRate)
	{
		return -1;
	}
	double* rate = new double[vecRate.size()];
	rate[0] = vecRate[0]/rateTotal;
	for (i=1; i<(int)vecRate.size(); ++i)
	{
		rate[i] = rate[i-1] + vecRate[i]/rateTotal;	
	}
	rate[vecRate.size()-1] = 1.0f;

	double fRand = rand()/(double)(RAND_MAX + 1);
	for (i=0;i<(int)vecRate.size();++i)
	{
		if (fRand<=rate[i])
		{
			break;
		}
	}
	delete[] rate;
	if (i>=(int)vecRate.size())
	{
		i = -1;
	}
	return i;
}


void g_ColorToString(AWString& strColor, const A3DCOLOR color)
{
	DWORD colorNoAlpha = color & 0X00FFFFFF;
	strColor.Format(_EW("^%06X"), colorNoAlpha);
}


void g_Int64ToString(AWString& str, const __int64 value)
{
	wchar_t temp[128];
	swprintf_s(temp,_EW("0X%016I64X"),value);
	str = temp;
}

void g_StringToInt64(__int64& value, const wchar_t* pStr)
{
	value = 0;
	if (pStr)
	{
		swscanf(pStr,_EW("0X%016I64X"),&value);
	}
}


void glb_SetExtState(DWORD* p, int n)
{ 
	p[n >> 5] |= (1 << (n & 31)); 
}

void glb_RemExtState(DWORD* p, int n)
{ 
	p[n >> 5] &= ~(1 << (n & 31));
}

bool glb_GetExtState(const DWORD* p, int n)
{
	return (p[n >> 5] & (1 << (n & 31))) ? true : false;
}

A3DCOLOR g_GetColor(const A3DCOLOR& color1, const A3DCOLOR& color2, const float ratio)
{
	if (ratio<0.0f)
	{
		return color1;
	}
	if (ratio>1.0f)
	{
		return color2;
	}

	BYTE red	= (BYTE)(A3DCOLOR_GETRED(color1)*ratio	+ A3DCOLOR_GETRED(color2)*(1.0f-ratio));
	BYTE green	= (BYTE)(A3DCOLOR_GETGREEN(color1)*ratio+ A3DCOLOR_GETGREEN(color2)*(1.0f-ratio));
	BYTE blue	= (BYTE)(A3DCOLOR_GETBLUE(color1)*ratio+ A3DCOLOR_GETBLUE(color2)*(1.0f-ratio));
	return A3DCOLORRGB(red,green,blue);
}