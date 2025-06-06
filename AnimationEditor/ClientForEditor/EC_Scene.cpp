/*
 * FILE: EC_Scene.cpp
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Duyuxin, 2004/10/15
 *
 * HISTORY: 
 *
 * Copyright (c) 2004 Archosaur Studio, All Rights Reserved.
 */

#pragma warning (disable: 4284)

#include "StdAfx.h"
#include "EC_Global.h"
#include "EC_Configs.h"
#include "EC_Scene.h"
#include "EC_World.h"
#include "EC_SceneObject.h"
#include "EC_SceneBlock.h"
#include "EC_ScnBoxArea.h"
#include "EC_GrassArea.h"
#include "EC_Ornament.h"
#include "EC_Game.h"
#include "EC_GameRun.h"
#include "EC_ManOrnament.h"
#include "EC_Bezier.h"
#include "EL_CloudManager.h"
#include "EC_Instance.h"
#include "EC_BrushMan.h"
#include "EC_TriangleMan.h"

#include "Animator/Animator.h"
#include <A3DWaterArea2.h>
#include <A3DEnvironment.h>

///////////////////////////////////////////////////////////////////////////
//    
//    Define and Macro
//    
///////////////////////////////////////////////////////////////////////////

//    Inverse of environment change time
#define INV_ENVCHANGETIME    0.1f
//    Waiting time before delete a idle tree type or grass type
#define PLANT_IDLE_TIME        30000

///////////////////////////////////////////////////////////////////////////
//    
//    Reference to External variables and functions
//    
///////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////
//    
//    Local Types and Variables and Global variables
//    
///////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////
//    
//    Local functions
//    
///////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////
//    
//    Implement CECScene
//    
///////////////////////////////////////////////////////////////////////////

CECScene::CECScene(CECWorld* pWorld) :
m_WaterTab(32),
m_MirrorTab(32),
m_BoxAreaTab(32),
m_GrassTab(64),
m_CritterTab(32),
m_OnmtTab(256),
m_BezierTab(16),
m_CameraPathTab(16)
{
    m_pWorld            = pWorld;
    m_iBlkLoadSpeed     = 1;
    m_fActRadius        = 500.0f;
    m_fBlockSize        = 0.0f;
    m_fWorldWid         = 0.0f;
    m_fWorldLen         = 0.0f;
    m_iNumBlock         = 0;
    m_iNumBlockRow      = 0;
    m_iNumBlockCol      = 0;
    m_fWorldCenterX     = 0.0f;
    m_fWorldCenterZ     = 0.0f;
    m_fLightMapMaxLight = 2.0f;
    m_fLightMapMaxLightNight = 2.0f;
    m_iSceneVersion        = ECWDFILE_VERSION;
    m_iBSDVersion        = ECBSDFILE_VERSION;
    m_dwIdleTime        = 0;
    m_dwScnFileFlags    = ECWFFLAG_EDITOREXP;

    m_vLoadCenter.Clear();
    m_ResLoadCnt.SetPeriod(500);
    m_BrushManCnt.SetPeriod(1000);

    m_ActBlocks1.rcArea.Clear();
    m_ActBlocks2.rcArea.Clear();
    m_pCurActBlocks    = &m_ActBlocks1;
    m_pOldActBlocks    = &m_ActBlocks2;

    m_Env.bUnderWater = false;
}

CECScene::~CECScene()
{
}

//    Release scene
void CECScene::Release()
{
    //    Release all loaded blocks
    ReleaseAllBlocks();

    int i;

    //    Release tree types
    for (i=0; i < m_aTreeTypes.GetSize(); i++)
        delete m_aTreeTypes[i];

    //    Release grass types
    for (i=0; i < m_aGrassTypes.GetSize(); i++)
        delete m_aGrassTypes[i];

    m_aTreeTypes.RemoveAll();
    m_aGrassTypes.RemoveAll();

    //    Release all sub-terrain data file name
    for (i=0; i < m_aSubTrnData.GetSize(); i++)
    {
        SUBTRNDATA* pData = m_aSubTrnData[i];
        if (pData->pDataFile)
        {
            pData->pDataFile->Close();
            delete pData->pDataFile;
            delete [] pData->aOffsets;
        }

        delete pData;
    }

    m_aSubTrnData.RemoveAll();

    m_SceneFile.Close();
    m_BSDFile.Close();

    m_aBlockOffs.RemoveAll();

    m_WaterTab.clear();
    m_MirrorTab.clear();
    m_BoxAreaTab.clear();
    m_GrassTab.clear();
    m_CritterTab.clear();
    m_OnmtTab.clear();
    m_BezierTab.clear();
    m_CameraPathTab.clear();
}

//    Load scene data from file
bool CECScene::Load(const char* szFile, float cx, float cz)
{
    m_fWorldCenterX    = cx;
    m_fWorldCenterZ = cz;

    ECWDFILEHEADER ScnHeader;

    if (!OpenSceneFile(szFile, &ScnHeader))
    {
        m_SceneFile.Close();
        a_LogOutput(1, _EA("CECScene::Load, Failed to open scene file."));
        return false;
    }

    char* pTemp = (char*)strrchr(szFile, '.');
    AString strBSDFile(szFile, pTemp-szFile);
    strBSDFile += _EA(".ecbsd");

    if (!OpenBSDFile(strBSDFile))
    {
        m_SceneFile.Close();
        m_BSDFile.Close();
        a_LogOutput(1, _EA("CECScene::Load, Failed to open water file."));
        return false;
    }

    //    Load block offsets
    if (!LoadBlockOffsetsData(m_iNumBlock))
    {
        a_LogOutput(1, _EA("CECScene::Load, Failed to load block offsets."));
        return false;
    }

    //    Load tree type data
    if (!LoadTreeTypeData(ScnHeader.iNumTreeType, ScnHeader.dwTreeOff) ||
        !LoadGrassTypeData(ScnHeader.iNumGrassType, ScnHeader.dwGrassOff))
    {
        a_LogOutput(1, _EA("CECScene::Load, Failed to load tree and grass type data."));
        return false;
    }

    //    Load Env file
    AString strEnvFile(szFile, pTemp-szFile);
    strEnvFile += _EA(".env");
    if (!LoadEnvFile(strEnvFile))
    {
        a_LogOutput(1, _EA("CECScene::Load, Failed to load env file."));
    }

    //    Calculate world area
    m_rcWorld.left        = cx - m_fWorldWid * 0.5f;
    m_rcWorld.top        = cz + m_fWorldLen * 0.5f;
    m_rcWorld.right        = m_rcWorld.left + m_fWorldWid;
    m_rcWorld.bottom    = m_rcWorld.top - m_fWorldLen;

    return true;
}

//    Open scene data file
bool CECScene::OpenSceneFile(const char* szFile, ECWDFILEHEADER* pHeader)
{
    if (!m_SceneFile.Open(_EA(""), szFile, AFILE_OPENEXIST | AFILE_BINARY))
    {
        a_LogOutput(1, _EA("CECScene::OpenSceneFile, Failed to open file %s"), szFile);
        return false;
    }

    DWORD dwRead;

    //    Read file header
    if (!m_SceneFile.Read(pHeader, sizeof (ECWDFILEHEADER), &dwRead))
    {
        a_LogOutput(1, _EA("CECScene::OpenSceneFile, Failed to read file header"));
        return false;
    }

    if (pHeader->dwIdentify != ECWDFILE_IDENTIFY)
    {
        a_LogOutput(1, _EA("CECScene::OpenSceneFile, Wrong file format"));
        return false;
    }

    if (pHeader->dwVersion > ECWDFILE_VERSION)
    {
        a_LogOutput(1, _EA("CECScene::OpenSceneFile, Wrong version. %d is wanted but %d is given."), ECWDFILE_VERSION, pHeader->dwVersion);
        return false;
    }

    m_iSceneVersion        = (int)pHeader->dwVersion;
    m_iNumBlockRow        = pHeader->iWorldBlkRow;
    m_iNumBlockCol        = pHeader->iWorldBlkCol;
    m_fWorldWid            = pHeader->fWorldWid;
    m_fWorldLen            = pHeader->fWorldLen;
    m_fBlockSize        = pHeader->fBlockSize;
    m_iNumBlock            = pHeader->iNumBlock;
    m_dwScnFileFlags    = pHeader->dwFlags;

    ASSERT(m_iNumBlock == m_iNumBlockRow * m_iNumBlockCol);

    if (m_iSceneVersion >= 19)// + fft water param
    {
        DWORD fftVersion;
        if (!m_SceneFile.Read(&fftVersion, sizeof (DWORD), &dwRead))
        {
            a_LogOutput(1, _EA("CECScene::OpenSceneFile, Failed to read fft version"));
            return false;
        }

        if (fftVersion)
        {
            ECWDFILEFFTWATER waterFftParam;
            if (!m_SceneFile.Read(&waterFftParam, sizeof (ECWDFILEFFTWATER), &dwRead))
            {
                a_LogOutput(1, _EA("CECScene::OpenSceneFile, Failed to read fft water param"));
                return false;
            }

            m_FFTWaterParam.m_fWaterLevel			= waterFftParam.m_fWaterLevel;
            m_FFTWaterParam.m_fWindDirection		= waterFftParam.m_fWindDirection;
            m_FFTWaterParam.m_fGravity				= waterFftParam.m_fGravity;
            m_FFTWaterParam.m_fWindSpeed			= waterFftParam.m_fWindSpeed;
            m_FFTWaterParam.m_fWavesSpeed			= waterFftParam.m_fWavesSpeed;
            m_FFTWaterParam.m_fWavesAmount			= waterFftParam.m_fWavesAmount;
            m_FFTWaterParam.m_fWavesSize			= waterFftParam.m_fWavesSize;
            m_FFTWaterParam.m_fSoftIntersectionFactor = waterFftParam.m_fSoftIntersectionFactor;
            m_FFTWaterParam.m_fReflectionAmount		= waterFftParam.m_fReflectionAmount;
            m_FFTWaterParam.m_fWhiteCapsAmount		= waterFftParam.m_fWhiteCapsAmount;
            m_FFTWaterParam.m_fSunMultiplier		= waterFftParam.m_fSunMultiplier;
            m_FFTWaterParam.m_fFresnelScale			= waterFftParam.m_fFresnelScale;
            m_FFTWaterParam.m_fFogDensity			= waterFftParam.m_fFogDensity;
            m_FFTWaterParam.m_fWaterFogScaleExp		= waterFftParam.m_fWaterFogScaleExp;	
            m_FFTWaterParam.m_bUseFFT				= waterFftParam.m_bUseFFT;
            m_FFTWaterParam.m_bEdgeFoam				= waterFftParam.m_bEdgeFoam;
            m_FFTWaterParam.m_bWaveFoam				= waterFftParam.m_bWaveFoam;
            m_FFTWaterParam.m_bWaveGloss			= waterFftParam.m_bWaveGloss;
            m_FFTWaterParam.m_bUseCustomColor		= waterFftParam.m_bUseCustomColor;
            m_FFTWaterParam.m_vWaterFogColor		= waterFftParam.m_vWaterFogColor;
            m_FFTWaterParam.m_bEnableAreaConstrain	= waterFftParam.m_bEnableAreaConstrain;
            m_FFTWaterParam.m_vAreaConstrain		= waterFftParam.m_vAreaConstrain;
            m_FFTWaterParam.m_bEnableAreaConstrain	= waterFftParam.m_bCubeReflect;

            SetFFTWaterLevel(2);
        }
    }

    return true;
}

//    Open scene block shared data file
bool CECScene::OpenBSDFile(const char* szFile)
{
    if (!m_BSDFile.Open(szFile, AFILE_OPENEXIST))
    {
        a_LogOutput(1, _EA("CECScene::OpenBSDFile, Failed to open file %s"), szFile);
        return false;
    }

    DWORD dwRead;

    //    Read file header
    ECBSDFILEHEADER Header;

    if (!m_BSDFile.Read(&Header, sizeof (Header), &dwRead))
    {
        a_LogOutput(1, _EA("CECScene::OpenBSDFile, Failed to read file header"));
        return false;
    }

    if (Header.dwIdentify != ECBSDFILE_IDENTIFY)
    {
        a_LogOutput(1, _EA("CECScene::OpenBSDFile, Wrong file format"));
        return false;
    }

    if (Header.dwVersion > ECBSDFILE_VERSION)
    {
        a_LogOutput(1, _EA("CECScene::OpenBSDFile, Wrong version. %d is wanted but %d is given."), ECBSDFILE_VERSION, Header.dwVersion);
        return false;
    }

    m_iBSDVersion = (int)Header.dwVersion;

    if (m_iBSDVersion >= 7)
    {
        m_aSubTrnData.SetSize(Header.iNumSubTrn, 10);

        //    Create sub-terrain data and read data file name
        for (int i=0; i < Header.iNumSubTrn; i++)
        {
            SUBTRNDATA* pData = new SUBTRNDATA;

            pData->iDataRefCnt    = 0;
            pData->pDataFile    = NULL;
            pData->aOffsets        = NULL;
            pData->iNumOffset    = 0;
            pData->dwIdleTime    = 0;

            m_BSDFile.ReadString(pData->strFile);

            m_aSubTrnData[i] = pData;
        }
    }

    return true;
}

//    Read block offsets data in terrain file
bool CECScene::LoadBlockOffsetsData(int iNumBlock)
{
    m_aBlockOffs.SetSize(iNumBlock, 100);

    DWORD dwRead;
    if (!m_SceneFile.Read(m_aBlockOffs.GetData(), iNumBlock * sizeof (DWORD), &dwRead))
        return false;

    return true;
}

//    Load tree type data in scene data file
bool CECScene::LoadTreeTypeData(int iNumType, DWORD dwOffset)
{
    m_SceneFile.Seek(dwOffset, AFILE_SEEK_SET);

    for (int i=0; i < iNumType; i++)
    {
        TREETYPE* pTreeType = new TREETYPE;
        if (!pTreeType)
            return false;

        pTreeType->pTree        = NULL;    
        pTreeType->dwIdleTime    = 0;

        m_SceneFile.ReadString(pTreeType->strSPDTreeFile);
        m_SceneFile.ReadString(pTreeType->strCompMapFile);

        m_aTreeTypes.Add(pTreeType);
    }

    return true;
}

//    Load grass type data in scene data file
bool CECScene::LoadGrassTypeData(int iNumType, DWORD dwOffset)
{
    m_SceneFile.Seek(dwOffset, AFILE_SEEK_SET);

    DWORD dwRead;

    for (int i=0; i < iNumType; i++)
    {
        GRASSTYPE* pGrassType = new GRASSTYPE;
        if (!pGrassType)
            return false;

        pGrassType->pGrass        = NULL;    
        pGrassType->dwIdleTime    = 0;

        m_SceneFile.Read(&pGrassType->Data, sizeof (pGrassType->Data), &dwRead);
        m_SceneFile.ReadString(pGrassType->strGrassFile);
        
        m_aGrassTypes.Add(pGrassType);
    }

    return true;
}

//  Load Env file
bool CECScene::LoadEnvFile(const char* szFile)
{
    AFileImage EnvFile;
    if (!EnvFile.Open(szFile, AFILE_OPENEXIST))
    {
        m_fLightMapMaxLight = 2.0f;
        m_fLightMapMaxLightNight = 2.0f;
        a_LogOutput(1, _EA("CECScene::LoadEnvFile, Failed to open file %s"), szFile);
        return false;
    }

    DWORD dwRead;

    DWORD dwVersion = 1;
    EnvFile.Read(&dwVersion, sizeof(dwVersion), &dwRead);
    EnvFile.Read(&m_fLightMapMaxLight, sizeof(m_fLightMapMaxLight), &dwRead);
    EnvFile.Read(&m_fLightMapMaxLightNight, sizeof(m_fLightMapMaxLightNight), &dwRead);
    EnvFile.Close();

    return true;
}

//    Set center position used to load scene blocks, this function will update
//    all active blocks immediately
bool CECScene::SetLoadCenter(const A3DVECTOR3& vCenter)
{
    //    Unload current active blocks
    UnloadActiveBlocks(*m_pCurActBlocks);

    ARectI rcNew;
    CalcAreaInBlocks(vCenter, m_fActRadius, rcNew);
    m_vLoadCenter = vCenter;

    m_pCurActBlocks->rcArea = rcNew;
    return LoadActiveBlocks(*m_pCurActBlocks);
}

//    Calculate area represented in blocks
void CECScene::CalcAreaInBlocks(const A3DVECTOR3& vCenter, float fRadius, ARectI& rcArea)
{
    float fInvBlockSize = 1.0f / m_fBlockSize;
    int iRadiusInBlock = (int)(ceil(fRadius * fInvBlockSize) + 0.5f);
    int l, t, r, b;

    int imaxr = m_iNumBlockCol;
    int imaxb = m_iNumBlockRow;

    int cx = (int)((vCenter.x - m_rcWorld.left) * fInvBlockSize);
    int cz = (int)(-(vCenter.z - m_rcWorld.top) * fInvBlockSize);

    int d  = iRadiusInBlock * 2 + 1;

    l = cx - iRadiusInBlock;
    t = cz - iRadiusInBlock;
    r = l + d;
    b = t + d;

    if (l < 0)
    {
        l = 0;
        r = imaxr > d ? d : imaxr;
    }

    if (t < 0)
    {
        t = 0;
        b = imaxb > d ? d : imaxb;
    }

    if (r > imaxr) 
    {
        r = imaxr;
        l = imaxr > d ? imaxr - d : 0;
    }

    if (b > imaxb)
    {
        b = imaxb;
        t = imaxb > d ? imaxb - d : 0;
    }

    a_ClampFloor(l, 0);
    a_ClampFloor(t, 0);
    a_ClampRoof(r, imaxr);
    a_ClampRoof(b, imaxb);

    if (l > m_iNumBlockCol || t > m_iNumBlockRow ||
        r < 0 || b < 0 || l > r || t > b)
    {
        ASSERT(0);
        return;
    }

    rcArea.SetRect(l, t, r, b);
}

//    Synchronously update active blocks
bool CECScene::UpdateActiveBlocks(const A3DVECTOR3& vCenter)
{
    ARectI rcNew;
    CalcAreaInBlocks(vCenter, m_fActRadius, rcNew);
    m_vLoadCenter = vCenter;

    if (!m_pCurActBlocks->aBlocks.GetSize())
    {
        //    Create active block buffer
        m_pCurActBlocks->rcArea = rcNew;
        return LoadActiveBlocks(*m_pCurActBlocks);
    }

    if (rcNew == m_pCurActBlocks->rcArea)
    {
        //    Active block don't change
        return true;
    }

    //    Exchange currently active block buffer
    a_Swap(m_pCurActBlocks, m_pOldActBlocks);

    ASSERT(!m_pCurActBlocks->aBlocks.GetSize());
    m_pCurActBlocks->rcArea = rcNew;
    
    ARectI rcInter = rcNew & m_pOldActBlocks->rcArea;
    if (rcInter.IsEmpty())
    {
        //    The two rectangles havn't intersection
        UnloadActiveBlocks(*m_pOldActBlocks);
        return LoadActiveBlocks(*m_pCurActBlocks);
    }
    else
    {
        int iBaseIdx = rcNew.top * m_iNumBlockCol + rcNew.left;

        for (int r=rcNew.top; r < rcNew.bottom; r++)
        {
            int iIndex = iBaseIdx;

            for (int c=rcNew.left; c < rcNew.right; c++, iIndex++)
            {
                if (m_pOldActBlocks->rcArea.PtInRect(c, r))
                    m_pCurActBlocks->aBlocks.Add(m_pOldActBlocks->GetBlock(r, c, true));
                else
                {
                    //    Add block to candidate list
                    m_CandidateBlkList.AddTail(iIndex);
                    m_pCurActBlocks->aBlocks.Add(NULL);
                }
            }

            iBaseIdx += m_iNumBlockCol;
        }

        UnloadActiveBlocks(*m_pOldActBlocks);

        return true;
    }

    return true;
}

//    Load all active blocks immediately
bool CECScene::LoadActiveBlocks(ACTBLOCKS& ActBlocks)
{
    //    Scene laoding will occupy about 45% loading progress, calculate
    //    each block's component
    float fBlockComp = 45.0f / (ActBlocks.rcArea.Width() * ActBlocks.rcArea.Height());
    float fProgCnt = 0.0f;

    int r, c, iBaseIdx;
    iBaseIdx = ActBlocks.rcArea.top * m_iNumBlockCol + ActBlocks.rcArea.left;

    for (r=ActBlocks.rcArea.top; r < ActBlocks.rcArea.bottom; r++)
    {
        int iIndex = iBaseIdx;

        for (c=ActBlocks.rcArea.left; c < ActBlocks.rcArea.right; c++, iIndex++)
        {
            CECSceneBlock* pBlock = LoadBlock(r, c, iIndex);
            ActBlocks.aBlocks.Add(pBlock);

            //    Step loading progress
            fProgCnt += fBlockComp;
            int iStep = (int)fProgCnt;
            if (iStep)
            {
                //g_pGame->GetGameRun()->StepLoadProgress(iStep);
                fProgCnt -= (float)iStep;
            }
        }

        iBaseIdx += m_iNumBlockCol;
    }

    return true;
}

//    Unload active blocks
void CECScene::UnloadActiveBlocks(ACTBLOCKS& ActBlocks)
{
    BlockArray& aBlocks = ActBlocks.aBlocks;

    for (int i=0; i < aBlocks.GetSize(); i++)
    {
        CECSceneBlock* pBlock = aBlocks[i];
        if (pBlock)
            UnloadBlock(pBlock);
    }

    if (aBlocks.GetSize())
    {
        A3DVECTOR3 vCenter = g_pGame->GetViewport()->GetA3DCamera()->GetPos();

#ifdef USING_BRUSH_MAN
        m_pWorld->GetOrnamentMan()->GetBrushMan()->Build(vCenter);
#endif

#ifdef USING_TRIANGLE_MAN
        m_pWorld->GetOrnamentMan()->GetTriangleMan()->Build(vCenter);
#endif
    }

    ActBlocks.aBlocks.RemoveAll(false);
    ActBlocks.rcArea.Clear();
}

//    Load blocks from candidate list
bool CECScene::LoadCandidateBlocks()
{
    //    Number of block which will be loaded
    int iNumBlock = m_CandidateBlkList.GetCount();
    if (iNumBlock > m_iBlkLoadSpeed)
        iNumBlock = m_iBlkLoadSpeed;

    if (!iNumBlock)
        return true;

    for (int i=0; i < iNumBlock; i++)
    {
        int iIndex = m_CandidateBlkList.RemoveHead();

        //    Row and column in whole terrain
        int r = iIndex / m_iNumBlockCol;
        int c = iIndex - r * m_iNumBlockCol;

        //    Check whether candidate block is still in active area. We have
        //    to do this check because the Active area may change every frame.
        if (!m_pCurActBlocks->rcArea.PtInRect(c, r))
            continue;

        //    If camera move very fast and change it's direction frequently, 
        //    there is possible one candidate appears twice. 
        if (m_pCurActBlocks->GetBlock(r, c, false))
            continue;

        m_pCurActBlocks->SetBlock(r, c, LoadBlock(r, c, iIndex));
    }

    return true;
}

//    Load a block
CECSceneBlock* CECScene::LoadBlock(int r, int c, int iBlock)
{
    if (iBlock < 0)
        iBlock = r * m_iNumBlockCol + c;

    ASSERT(iBlock >= 0 && iBlock < m_iNumBlock);

    //    Create a A3DTerrain2Block object
    CECSceneBlock* pBlock = NULL;

    if (!(pBlock = new CECSceneBlock(this)))
        return NULL;

    if (!pBlock->Init())
        return NULL;

    //    Move file pointer
    m_SceneFile.Seek(m_aBlockOffs[iBlock], AFILE_SEEK_SET);

    float sx = m_rcWorld.left + c * m_fBlockSize;
    float sz = m_rcWorld.top - r * m_fBlockSize;

    A3DVECTOR3 vBlock(sx+m_fBlockSize*0.5f, 0.0f, sz-m_fBlockSize*0.5f);
    float fDist = a3d_MagnitudeH(vBlock - m_vLoadCenter) - m_fBlockSize * 0.5f;
    if (!pBlock->Load(&m_SceneFile, &m_BSDFile, sx, sz, fDist))
    {
        pBlock->Release();
        delete pBlock;
        return NULL;
    }

    return pBlock;
}

//    Unload a block
void CECScene::UnloadBlock(CECSceneBlock* pBlock)
{
    ASSERT(pBlock);

    //    Cache has been fill, release this block
    pBlock->Release();
    delete pBlock;
}

//    Release all loaded blocks
void CECScene::ReleaseAllBlocks()
{
    //    Release all active blocks
    BlockArray& aBlocks = m_pCurActBlocks->aBlocks;

    for (int i=0; i < aBlocks.GetSize(); i++)
    {
        CECSceneBlock* pBlock = aBlocks[i];
        if (pBlock)
        {
            pBlock->Release();
            delete pBlock;
        }
    }

    A3DVECTOR3 vCenter = g_pGame->GetViewport()->GetA3DCamera()->GetPos();

#ifdef USING_BRUSH_MAN
    m_pWorld->GetOrnamentMan()->GetBrushMan()->Build(vCenter);
#endif

#ifdef USING_TRIANGLE_MAN
    m_pWorld->GetOrnamentMan()->GetTriangleMan()->Build(vCenter);
#endif

    m_ActBlocks1.aBlocks.RemoveAll();
    m_ActBlocks2.aBlocks.RemoveAll();
}

//    Update routine
bool CECScene::Update(DWORD dwDeltaTime, A3DCameraBase* pCamera, const A3DVECTOR3& vLoadCenter)
{
    //    Update active blocks
    if (!UpdateActiveBlocks(vLoadCenter))
        return false;

    //    Load blocks from candidate list
    if (!LoadCandidateBlocks())
        return false;

    A3DVECTOR3 vCenter = g_pGame->GetViewport()->GetA3DCamera()->GetPos();
    UpdatePostEffect(dwDeltaTime, vCenter);

    if (m_BrushManCnt.IncCounter(dwDeltaTime))
    {
        m_BrushManCnt.Reset();

#ifdef USING_BRUSH_MAN
        m_pWorld->GetOrnamentMan()->GetBrushMan()->Build(vCenter);
#endif

#ifdef USING_TRIANGLE_MAN
        m_pWorld->GetOrnamentMan()->GetTriangleMan()->Build(vCenter);
#endif
    }

    if (m_pCurActBlocks->rcArea.IsEmpty())
        return true;

    //    Update block resources
    if (m_ResLoadCnt.IncCounter(dwDeltaTime))
    {
        m_ResLoadCnt.Reset();
        UpdateBlockRes();
    }

    //    Update plant types
    UpdatePlantTypes(dwDeltaTime);

    //    Check idle sub-terrain datas
    if (m_iBSDVersion >= 7 && (m_dwIdleTime += dwDeltaTime) >= 5000)
    {
        m_dwIdleTime = 0;
        UnloadIdleSubTerrainData();
    }

    return true;
}

//    Render routine
bool CECScene::Render(const ECRENDERPARAM* pRenderParam)
{
    return true;
}

//    Get shared scene object through it's export ID
CECSceneObject* CECScene::GetSceneObject(DWORD dwExportID)
{
    ObjectTable::pair_type Pair = m_WaterTab.get((int)dwExportID);
    if (Pair.second)
        return *Pair.first;

    Pair = m_OnmtTab.get((int)dwExportID);
    if (Pair.second)
        return *Pair.first;

    Pair = m_BoxAreaTab.get((int)dwExportID);
    if (Pair.second)
        return *Pair.first;

    Pair = m_GrassTab.get((int)dwExportID);
    if (Pair.second)
        return *Pair.first;

    Pair = m_CritterTab.get((int)dwExportID);
    if (Pair.second)
        return *Pair.first;

    Pair = m_BezierTab.get((int)dwExportID);
    if (Pair.second)
        return *Pair.first;

    Pair = m_MirrorTab.get((int)dwExportID);
    if (Pair.second)
        return *Pair.first;

    return NULL;
}

CECSceneObject* CECScene::GetWaterObject(DWORD dwExportID)
{
    ObjectTable::pair_type Pair = m_WaterTab.get((int)dwExportID);
    return Pair.second ? *Pair.first : NULL;
}

CECSceneObject* CECScene::GetOnmtObject(DWORD dwExportID)
{
    ObjectTable::pair_type Pair = m_OnmtTab.get((int)dwExportID);
    return Pair.second ? *Pair.first : NULL;
}

CECSceneObject* CECScene::GetBoxAreaObject(DWORD dwExportID)
{
    ObjectTable::pair_type Pair = m_BoxAreaTab.get((int)dwExportID);
    return Pair.second ? *Pair.first : NULL;
}

CECSceneObject* CECScene::GetGrassObject(DWORD dwExportID)
{
    ObjectTable::pair_type Pair = m_GrassTab.get((int)dwExportID);
    return Pair.second ? *Pair.first : NULL;
}

CECSceneObject* CECScene::GetCritterObject(DWORD dwExportID)
{
    ObjectTable::pair_type Pair = m_CritterTab.get((int)dwExportID);
    return Pair.second ? *Pair.first : NULL;
}

CECSceneObject* CECScene::GetBezierObject(DWORD dwExportID)
{
    ObjectTable::pair_type Pair = m_BezierTab.get((int)dwExportID);
    return Pair.second ? *Pair.first : NULL;
}

CECSceneObject* CECScene::GetCameraPathObject(DWORD dwGlobalID)
{
    ObjectTable::pair_type Pair = m_CameraPathTab.get((int)dwGlobalID);
    return Pair.second ? *Pair.first : NULL;
}

CECSceneObject* CECScene::GetMirrorPlaneObject(DWORD dwExportID)
{
    ObjectTable::pair_type Pair = m_MirrorTab.get((int)dwExportID);
    return Pair.second ? *Pair.first : NULL;
}

//    Release scene object
void CECScene::ReleaseSceneObject(DWORD dwExportID)
{
    CECSceneObject* pSceneObject = GetSceneObject(dwExportID);
    if (!pSceneObject)
        return;

    if (pSceneObject->GetReference() > 1)
    {
        pSceneObject->DecreaseReference();
        return;
    }

    switch (pSceneObject->GetType())
    {
    case CECSceneObject::TYPE_WATER:
    {
        CECWaterArea* pWaterArea = (CECWaterArea*)pSceneObject;
        ReleaseSubTerrainData(pWaterArea->GetSubTerrain());

        m_pWorld->GetTerrainWater()->DeleteWaterAreaByID(dwExportID);

        //    Remove from water object table
        m_WaterTab.erase((int)dwExportID);
        break;
    }
    case CECSceneObject::TYPE_BOXAREA:
    {
        //    Remove from box area table
        m_BoxAreaTab.erase((int)dwExportID);
        break;
    }
    case CECSceneObject::TYPE_GRASS:
    {    
        CECGrassArea* pGrassArea = (CECGrassArea*)pSceneObject;
        ReleaseSubTerrainData(pGrassArea->GetSubTerrain());

        CELGRASSLAND* pGrassland = m_pWorld->GetGrassLand();
        CELGRASSTYPE* pGrassType = pGrassland->GetGrassTypeByID(pGrassArea->GetGrassType());
        if (pGrassType)
            pGrassType->DeleteGrassBitsMap(pGrassArea->GetGrassID());
        else
        {
            ASSERT(pGrassType);
        }

        //    Remove from grass table
        m_GrassTab.erase((int)dwExportID);
        break;
    }
    case CECSceneObject::TYPE_CRITTER:
    {
        //    Remove from critter group table
        m_CritterTab.erase((int)dwExportID);
        break;
    }
    case CECSceneObject::TYPE_ORNAMENT:
    {
        //    Delete ornament object
        m_pWorld->GetOrnamentMan()->ReleaseOrnament(dwExportID);
        //    Remove from ornament table
        m_OnmtTab.erase((int)dwExportID);
        return;        //    Return directly
    }
    case CECSceneObject::TYPE_BEZIER:
    {
        CECBezier* pBezier = (CECBezier*)pSceneObject;
        if( pBezier->GetBezierType() == 1 )
            m_CameraPathTab.erase((int)pBezier->GetGlobalID());
        pBezier->Release();
        m_BezierTab.erase((int)dwExportID);
        break;
    }
    case CECSceneObject::TYPE_MIRROR:
    {
        //	Remove from mirror table
        m_MirrorTab.erase((int)dwExportID);
        break;
    }
    }

    delete pSceneObject;
}

//	Load water area
bool CECScene::LoadWaterArea(DWORD dwExportID, DWORD dwOffset)
{
    //	Check whether this water area has been loaded or not
    CECSceneObject* pSceneObject = GetWaterObject(dwExportID);
    if (pSceneObject)
    {
        ASSERT(pSceneObject->GetType() == CECSceneObject::TYPE_WATER);
        pSceneObject->AddReference();
        return true;	//	This water area has been loaded
    }

    m_BSDFile.Seek(dwOffset, AFILE_SEEK_SET);

    //	Create a A3D water area object
    A3DWaterArea2* pWaterArea = 0;
    CECWaterArea* pECWaterArea = 0;
    A3DVECTOR3 vCenter;
    pWaterArea = new A3DWaterArea2;
    int iSubTerrain = -1;

    //	Load water area data from file
    if (m_iBSDVersion < 7)
    {
        if (!pWaterArea->Load(m_pWorld->GetTerrainWater(), &m_BSDFile))
        {
            a_LogOutput(1, _EA("CECScene::LoadWaterArea, failed to load water area"));
            goto fail;
        }
    }
    else	//	m_iBSDVersion >= 7
    {
        DWORD dwRead;
        ECBSDFILEWATER DataInfo;
        m_BSDFile.Read(&DataInfo, sizeof (DataInfo), &dwRead);

        iSubTerrain = DataInfo.iSubTerrain;

        SUBTRNDATA* pDataInfo = PrepareSubTerrainData(DataInfo.iSubTerrain, DataInfo.iDataIndex);
        if (!pDataInfo)
        {
            a_LogOutput(1, _EA("CECScene::LoadWaterArea, failed to call PrepareSubTerrainData()"));
            goto fail;
        }

        //	Read water area data file name
        if (!pWaterArea->Load(m_pWorld->GetTerrainWater(), pDataInfo->pDataFile))
        {
            a_LogOutput(1, _EA("CECScene::LoadWaterArea, failed to load water area from file %s"), pDataInfo->pDataFile->GetRelativeName());
            goto fail;
        }
    }

    pWaterArea->SetID(dwExportID);

    //	Offset water area
    vCenter = pWaterArea->GetCenter();
    vCenter.x += m_fWorldCenterX;
    vCenter.z += m_fWorldCenterZ;
    pWaterArea->ShiftCenterTo(vCenter);
    pWaterArea->UpdateAll();

    m_pWorld->GetTerrainWater()->AddWaterAreaForRender(pWaterArea);
    pWaterArea = 0;

    //	Create a water area object
    pECWaterArea = new CECWaterArea;
    pECWaterArea->SetSubTerrain(iSubTerrain);
    m_WaterTab.put((int)dwExportID, pECWaterArea);
    pECWaterArea = 0;

    return true;

fail:
    delete pWaterArea;
    delete pECWaterArea;
    return false;
}

//    Load box area
bool CECScene::LoadBoxArea(DWORD dwExportID, DWORD dwOffset)
{
    //    Check whether this box area has been loaded or not
    CECSceneObject* pSceneObject = GetBoxAreaObject(dwExportID);
    if (pSceneObject)
    {
        ASSERT(pSceneObject->GetType() == CECSceneObject::TYPE_BOXAREA);
        pSceneObject->AddReference();
        return true;    //    This box area has been loaded
    }

    m_BSDFile.Seek(dwOffset, AFILE_SEEK_SET);

    //    Create a A3D water area object
    CECScnBoxArea* pArea = new CECScnBoxArea;
    if (!pArea)
        return false;

    if (!pArea->Load(this, &m_BSDFile, m_fWorldCenterX, m_fWorldCenterZ))
    {
        delete pArea;
        a_LogOutput(1, _EA("CECScene::LoadBoxArea, failed to load box area"));
        return false;
    }

    pArea->SetAreaID(dwExportID);

    m_BoxAreaTab.put((int)dwExportID, pArea);

    return true;
}

//    Load grass area
bool CECScene::LoadGrassArea(DWORD dwExportID, DWORD dwOffset)
{
    //    Check whether this grass area has been loaded or not
    CECSceneObject* pSceneObject = GetGrassObject(dwExportID);
    if (pSceneObject)
    {
        ASSERT(pSceneObject->GetType() == CECSceneObject::TYPE_GRASS);
        pSceneObject->AddReference();
        return true;    //    This grass area has been loaded
    }

    //    Create a grass area object
    CECGrassArea* pGrassArea = new CECGrassArea;
    if (!pGrassArea)
        return false;

    m_BSDFile.Seek(dwOffset, AFILE_SEEK_SET);

    //    Read grass area data from file
    DWORD dwRead;
    ECBSDFILEGRASS7 Data;

    if (m_iBSDVersion < 7)
    {
        ECBSDFILEGRASS TempData;
        if (!m_BSDFile.Read(&TempData, sizeof (TempData), &dwRead))
            return false;

        memcpy(&Data, &TempData, sizeof (ECBSDFILEGRASS));

        Data.iSubTerrain = -1;
        Data.iDataIndex     = -1;
    }
    else
    {
        if (!m_BSDFile.Read(&Data, sizeof (Data), &dwRead))
            return false;
    }

    //    Get grass type
    CELGRASSTYPE* pGrassType = GetGlassType(Data.dwTypeID);
    if (!pGrassType)
    {
        ASSERT(0);
        return false;
    }

    //    Read grass bits map
    DWORD dwByteLen = (Data.iGridCol * Data.iGridRow) >> 3;
    BYTE* pBitsMap = new BYTE [dwByteLen];
    if (!pBitsMap)
    {
        glb_ErrorOutput(ECERR_NOTENOUGHMEMORY, _EA("CECScene::LoadGrassArea"), __LINE__);
        return false;
    }

    pGrassArea->SetSubTerrain(Data.iSubTerrain);

    if (m_iBSDVersion < 7)
    {
        if (!m_BSDFile.Read(pBitsMap, dwByteLen, &dwRead))
        {
            delete [] pBitsMap;
            return false;
        }
    }
    else    //    m_iBSDVersion >= 7
    {
        SUBTRNDATA* pDataInfo = PrepareSubTerrainData(Data.iSubTerrain, Data.iDataIndex);
        if (!pDataInfo)
        {
            a_LogOutput(1, _EA("CECScene::LoadGrassArea, failed to call PrepareSubTerrainData()"));
            return false;
        }

        bool bSuccess = true;

        if (pDataInfo->dwVersion < 2)
        {
            if (!pDataInfo->pDataFile->Read(pBitsMap, dwByteLen, &dwRead))
                bSuccess = false;
        }
        else    //    pDataInfo->dwVersion >= 2
        {
            //    Read chunk info.
            ECWDDTFILECHUNK Chunk;
            pDataInfo->pDataFile->Read(&Chunk, sizeof (Chunk), &dwRead);

            if (Chunk.dwOriginSize != dwByteLen)
            {
                ASSERT(Chunk.dwOriginSize == dwByteLen);
                delete [] pBitsMap;
                return false;
            }

            if (pDataInfo->bCompress)
            {
                BYTE* pTempBuf = new BYTE [Chunk.dwCompSize];
                if (pTempBuf)
                {
                    if (pDataInfo->pDataFile->Read(pTempBuf, Chunk.dwCompSize, &dwRead))
                    {
                        DWORD dwOriSize = dwByteLen;
                        AFilePackage::Uncompress(pTempBuf, Chunk.dwCompSize, pBitsMap, &dwOriSize);
                        ASSERT(dwOriSize == Chunk.dwOriginSize);
                    }
                    else
                    {
                        bSuccess = false;
                    }

                    delete [] pTempBuf;
                }
                else
                    bSuccess = false;
            }
            else
            {
                if (!pDataInfo->pDataFile->Read(pBitsMap, dwByteLen, &dwRead))
                    bSuccess = false;
            }
        }

        if (!bSuccess)
        {
            delete [] pBitsMap;
            a_LogOutput(1, _EA("CECScene::LoadGrassArea, failed to load grass bit map from file %s"), pDataInfo->pDataFile->GetRelativeName());
            return false;
        }
    }

    //    Offset grass area
    A3DVECTOR3 vCenter(Data.vPos[0]+m_fWorldCenterX, Data.vPos[1], Data.vPos[2]+m_fWorldCenterZ);

    DWORD dwGrassID;
    if (!pGrassType->AddGrassBitsMap(pBitsMap, vCenter, Data.fGridSize, Data.iGridCol, Data.iGridRow, dwGrassID))
    {
        delete [] pBitsMap;
        a_LogOutput(1, _EA("CECScene::LoadGrassArea, Failed to add grass bits map"));
        return false;
    }

    delete [] pBitsMap;

    pGrassArea->SetGrassID(dwGrassID);
    pGrassArea->SetGrassType(Data.dwTypeID);
    m_GrassTab.put((int)dwExportID, pGrassArea);

    return true;
}

//    Load critter group
bool CECScene::LoadCritterGroup(DWORD dwExportID, DWORD dwOffset)
{
    //    Check whether this critter group has been loaded or not
    CECSceneObject* pSceneObject = GetCritterObject(dwExportID);
    if (pSceneObject)
    {
        ASSERT(pSceneObject->GetType() == CECSceneObject::TYPE_CRITTER);
        pSceneObject->AddReference();
        return true;    //    This critter group has been loaded
    }

    m_BSDFile.Seek(dwOffset, AFILE_SEEK_SET);

    return true;
}

//    Load ornament
bool CECScene::LoadOrnament(DWORD dwExportID, DWORD dwOffset, DWORD* pdwOnmtID)
{
    if (GetSceneFileVersion() >= 4)
    {
        //    Check whether this critter group has been loaded or not
        CECSceneObject* pSceneObject = GetOnmtObject(dwExportID);
        if (pSceneObject)
        {
            ASSERT(pSceneObject->GetType() == CECSceneObject::TYPE_ORNAMENT);
            pSceneObject->AddReference();
            return true;    //    This ornament has been loaded
        }

        m_BSDFile.Seek(dwOffset, AFILE_SEEK_SET);
    }

    //    Build ornament file path
    char szPath[MAX_PATH];
//     if (g_pGame->GetGameRun()->GetGameState() == CECGameRun::GS_LOGIN)
//     {
//         sprintf(szPath, _EA("LitModels\\Login"));
//     }
//     else
//     {
        const CECInstance::sInstanceInfo* pInst = CECInstance::GetInstance().GetInstanceInfo(m_pWorld->GetInstanceID());
        if (!pInst)
        {
            ASSERT(pInst);
            return false;
        }

        sprintf(szPath, _EA("LitModels\\%s"), pInst->strPath);
//    }

    CECOrnamentMan* pOnmtMan = m_pWorld->GetOrnamentMan();
    ASSERT(pOnmtMan);
    CECOrnament* pOrnament = pOnmtMan->LoadOrnament(dwExportID, this, szPath, m_fWorldCenterX, m_fWorldCenterZ);
    if (!pOrnament)
        return false;

    m_OnmtTab.put((int)pOrnament->GetOrnamentID(), pOrnament);

    if (pdwOnmtID)
        *pdwOnmtID = pOrnament->GetOrnamentID();

    return true;
}

//    Load bezier curve
bool CECScene::LoadBezier(DWORD dwExportID, DWORD dwOffset)
{
    //    Check whether this bezier curve has been loaded or not
    CECSceneObject* pSceneObject = GetBezierObject(dwExportID);
    if (pSceneObject)
    {
        ASSERT(pSceneObject->GetType() == CECSceneObject::TYPE_BEZIER);
        pSceneObject->AddReference();
        return true;    //    This bezier curve has been loaded
    }

    m_BSDFile.Seek(dwOffset, AFILE_SEEK_SET);

    //    Create a bezier curve object
    CECBezier* pBezier = new CECBezier;
    if (!pBezier)
        return false;

    if (!pBezier->Load(&m_BSDFile))
    {
        delete pBezier;
        a_LogOutput(1, _EA("CECScene::LoadBezier, failed to load bezier curve"));
        return false;
    }

    //    Offset bezier
    pBezier->SetOffset(A3DVECTOR3(m_fWorldCenterX, 0.0f, m_fWorldCenterZ));

    m_BezierTab.put((int)dwExportID, pBezier);
    if( pBezier->GetBezierType() == 1 )
        m_CameraPathTab.put((int)pBezier->GetGlobalID(), pBezier);

    return true;
}

bool CECScene::LoadMirror(DWORD dwExportID, DWORD dwOffset)
{
    //	Check whether this mirror has been loaded or not
    CECSceneObject* pSceneObject = GetMirrorPlaneObject(dwExportID);
    if (pSceneObject)
    {
        ASSERT(pSceneObject->GetType() == CECSceneObject::TYPE_MIRROR);
        pSceneObject->AddReference();
        return true;	//	This critter group has been loaded
    }

    m_BSDFile.Seek(dwOffset, AFILE_SEEK_SET);

    return true;
}

//    Prepare to load data from sub-terrain data file
CECScene::SUBTRNDATA* CECScene::PrepareSubTerrainData(int iSubTrn, int iIndex)
{
    SUBTRNDATA* pData = m_aSubTrnData[iSubTrn];
    if (pData->pDataFile)
    {
        ASSERT(pData->aOffsets && iIndex >= 0 && iIndex < pData->iNumOffset);

        pData->iDataRefCnt++;
        pData->pDataFile->Seek(pData->aOffsets[iIndex], AFILE_SEEK_SET);
        return pData;
    }

    AFileImage* pDataFile = new AFileImage;
    if (!pDataFile)
        return NULL;

    AString strFile = m_pWorld->GetMapPath();
    strFile += _EA("\\") + pData->strFile;
    if (!pDataFile->Open(strFile, AFILE_OPENEXIST | AFILE_BINARY))
    {
        a_LogOutput(1, _EA("CECScene::PrepareSubTerrainData, failed to open file %s"), pData->strFile);
        return NULL;
    }

    //    Read file version
    DWORD dwNumOff, dwRead, dwVersion;
    pDataFile->Read(&dwVersion, sizeof (DWORD), &dwRead);

    if (dwVersion > ECWDDTFILE_VERSION)
    {
        a_LogOutput(1, _EA("CECScene::PrepareSubTerrainData, Wrong file version %d"), dwVersion);
        return NULL;
    }
    else if (dwVersion < 2)
    {
        pData->bCompress = false;
    }
    else    //    dwVersion >= 2
    {
        //    Read file header. 
        //    Note: Data file is created by AFile class which adds 4 bytes at the
        //        begining of file, skip it !!
        ECWDDTFILEHEADER Header;
        pDataFile->Seek(4, AFILE_SEEK_SET);
        pDataFile->Read(&Header, sizeof (Header), &dwRead);

        pData->bCompress = Header.bCompress;
    }

    pData->pDataFile    = pDataFile;
    pData->dwVersion    = dwVersion;

    //    Read number data offsets
    pDataFile->Seek(-(int)(sizeof (DWORD)), AFILE_SEEK_END);
    pDataFile->Read(&dwNumOff, sizeof (DWORD), &dwRead);
    ASSERT(dwNumOff);

    if (!(pData->aOffsets = new DWORD [dwNumOff]))
        return NULL;

    pDataFile->Seek(-(int)((dwNumOff+1) * sizeof (DWORD)), AFILE_SEEK_END);
    pDataFile->Read(pData->aOffsets, dwNumOff * sizeof (DWORD), &dwRead);

    pData->iDataRefCnt    = 1;
    pData->iNumOffset    = (int)dwNumOff;
    pDataFile->Seek(pData->aOffsets[iIndex], AFILE_SEEK_SET);

    return pData;
}

//    Release sub-terrain data
void CECScene::ReleaseSubTerrainData(int iSubTrn)
{
    if (m_iBSDVersion < 7)
        return;

    SUBTRNDATA* pData = m_aSubTrnData[iSubTrn];
    if (pData->pDataFile)
    {
        ASSERT(pData->iDataRefCnt > 0);
        if (!(--pData->iDataRefCnt))
            pData->dwIdleTime = a_GetTime();
    }
    else
    {
        ASSERT(pData->pDataFile);
    }
}

//    Unload idle sub-terrain data
void CECScene::UnloadIdleSubTerrainData()
{
    DWORD dwCurTime = a_GetTime();

    for (int i=0; i < m_aSubTrnData.GetSize(); i++)
    {
        SUBTRNDATA* pData = m_aSubTrnData[i];
        if (pData->pDataFile && !pData->iDataRefCnt &&
            dwCurTime - pData->dwIdleTime >= 20000)
        {
            pData->pDataFile->Close();
            delete pData->pDataFile;
            delete [] pData->aOffsets;

            pData->pDataFile = NULL;
            pData->aOffsets     = NULL;
        }
    }
}

//    Adjust environment
bool CECScene::AdjustEnvironment(DWORD dwDeltaTime, A3DCameraBase* pCamera, bool bInit)
{
    A3DDevice* pA3DDevice = g_pGame->GetA3DDevice();
    A3DVECTOR3 vEyePos = pCamera->GetPos();

    A3DVECTOR3 vHostPos = g_pGame->GetViewport()->GetA3DCameraBase()->GetPos();

    //    We are under water ?
    bool bUnderWater = m_pWorld->m_pA3DTerrainWater ? m_pWorld->m_pA3DTerrainWater->IsUnderWater(vEyePos) : false;

    //    Get current area the camera is in
    CECScnBoxArea* pDefArea = NULL;
    CECScnBoxArea* pCurArea = NULL;

    ObjectTable::iterator it = m_BoxAreaTab.begin();
    for (; it != m_BoxAreaTab.end(); ++it)
    {
        CECScnBoxArea* pArea = (CECScnBoxArea*)(*it.value());
        if (pArea->GetBox().IsPointIn(vHostPos) && pArea->IsInActiveTime())
        {
            if (pArea->IsDefaultArea())
                pDefArea = pArea;
            else if (!pCurArea || pCurArea->GetPriority() < pArea->GetPriority())
                pCurArea = pArea;
        }
    }

    if (!pCurArea)
        pCurArea = pDefArea;

    if (!pCurArea)
        return false;

    if (!pDefArea)
        pDefArea = pCurArea;

    int nSkyTransTime = 0;
    float nf = m_pWorld->m_pSunMoon->GetDNFactor();
    float df = 1.0f - nf;
    if (bInit)
    {
        m_Env.dwAreaID    = pCurArea->GetAreaID();

        m_Env.FogCol.Reset(pCurArea->GetFogColor());
        m_Env.FogStart.Reset(pCurArea->GetFogStart());
        m_Env.FogEnd.Reset(pCurArea->GetFogEnd());
        m_Env.FogDensity.Reset(pCurArea->GetFogDensity());

        m_Env.FogCol_n.Reset(pCurArea->GetFogColor_n());
        m_Env.FogStart_n.Reset(pCurArea->GetFogStart_n());
        m_Env.FogEnd_n.Reset(pCurArea->GetFogEnd_n());
        m_Env.FogDensity_n.Reset(pCurArea->GetFogDensity_n());

        m_Env.UWFogCol.Reset(pCurArea->GetUWFogColor());
        m_Env.UWFogStart.Reset(pCurArea->GetUWFogStart());
        m_Env.UWFogEnd.Reset(pCurArea->GetUWFogEnd());
        m_Env.UWFogDensity.Reset(pCurArea->GetUWFogDensity());
        m_Env.UWFogCol_n.Reset(pCurArea->GetUWFogColor_n());
        m_Env.UWFogStart_n.Reset(pCurArea->GetUWFogStart_n());
        m_Env.UWFogEnd_n.Reset(pCurArea->GetUWFogEnd_n());
        m_Env.UWFogDensity_n.Reset(pCurArea->GetUWFogDensity_n());

        m_Env.FogHeightStart.Reset(pCurArea->GetGlbFogHeightStart());
        m_Env.FogHeightEnd.Reset(pCurArea->GetGlbFogHeightEnd());
        m_Env.FogDensityStart.Reset(pCurArea->GetGlbFogDensityStart());
        m_Env.FogDensityEnd.Reset(pCurArea->GetGlbFogDensityEnd());
        m_Env.FogHeightStartNight.Reset(pCurArea->GetGlbFogHeightStart_n());
        m_Env.FogHeightEndNight.Reset(pCurArea->GetGlbFogHeightEnd_n());
        m_Env.FogDensityStartNight.Reset(pCurArea->GetGlbFogDensityStart_n());
        m_Env.FogDensityEndNight.Reset(pCurArea->GetGlbFogDensityEnd_n());

        m_Env.FogColor2.Reset(pCurArea->GetFogColor2());
        m_Env.FogColorDensityStart.Reset(pCurArea->GetFogColorDensityStart());
        m_Env.FogColorDensityEnd.Reset(pCurArea->GetFogColorDensityEnd());
        m_Env.FogHorzeDensity.Reset(pCurArea->GetFogHorzeDensity());
        m_Env.FogHorzePower.Reset(pCurArea->GetFogHorzePower());
        m_Env.FogColor2Night.Reset(pCurArea->GetFogColor2Night());
        m_Env.FogColorDensityStartNight.Reset(pCurArea->GetFogColorDensityStartNight());
        m_Env.FogColorDensityEndNight.Reset(pCurArea->GetFogColorDensityEndNight());
        m_Env.FogHorzeDensityNight.Reset(pCurArea->GetFogHorzeDensityNight());
        m_Env.FogHorzePowerNight.Reset(pCurArea->GetFogHorzePowerNight());

        m_Env.SkySpeedU.Reset(pCurArea->GetSkySpeedU());
        m_Env.SkySpeedV.Reset(pCurArea->GetSkySpeedV());

        m_Env.Ambient.Reset(pCurArea->GetAmbient());
        m_Env.Ambient2.Reset(pCurArea->GetAmbient2());
        m_Env.DirLtColor.Reset(A3DCOLORVALUE(pCurArea->GetDirLightColor()) * pCurArea->GetSunPower());
        m_Env.Ambient_n.Reset(pCurArea->GetAmbient_n());
        m_Env.Ambient2_n.Reset(pCurArea->GetAmbient2_n());
        m_Env.DirLtColor_n.Reset(A3DCOLORVALUE(pCurArea->GetDirLightColor_n()) * pCurArea->GetSunPower_n());
        m_Env.CloudAmb.Reset(pCurArea->GetCloudAmb());
        m_Env.CloudDirCol.Reset(A3DCOLORVALUE(pCurArea->GetCloudDirCol()) * pCurArea->GetSunPower());
        m_Env.CloudAmb_n.Reset(pCurArea->GetCloudAmb_n());
        m_Env.CloudDirCol_n.Reset(A3DCOLORVALUE(pCurArea->GetCloudDirCol_n()) * pCurArea->GetSunPower_n());

        nSkyTransTime = 0;

        //    Adjust light direction
        A3DLIGHTPARAM lightParam = g_pGame->GetDirLight()->GetLightparam();
        lightParam.Direction = pDefArea->GetLightDir();
        g_pGame->GetDirLight()->SetLightParam(lightParam);
        
        if (m_pWorld->m_pSunMoon)
        {
            m_pWorld->m_pSunMoon->SetSunVisible(pDefArea->HasSun());
            m_pWorld->m_pSunMoon->SetMoonVisible(pDefArea->HasMoon());
            m_pWorld->m_pSunMoon->SetLightDir(lightParam.Direction);
        }

#ifdef LM_BUMP_ENABLE
        // test only
        A3DLIGHTPARAM paramDay = lightParam;
        A3DLIGHTPARAM paramNight = lightParam;
        paramDay.Diffuse = A3DCOLORVALUE(pCurArea->GetDirLightColor()) * pCurArea->GetSunPower();
        paramNight.Diffuse = A3DCOLORVALUE(pCurArea->GetDirLightColor_n()) * pCurArea->GetSunPower_n();
        m_pWorld->GetOrnamentMan()->UpdateOrnamentsLight(paramDay, paramNight);
#endif
        //    Set weather parameters
        ApplyAreaWeather(pCurArea);
    }
    else if (m_Env.dwAreaID != pCurArea->GetAreaID())
    {
        m_Env.dwAreaID = pCurArea->GetAreaID();

        float fInvTime = 0.0f;
        if (pCurArea->GetTransformTime())
            fInvTime = 1000.0f / pCurArea->GetTransformTime();

        //    Reset target values
        m_Env.FogCol.SetTarget(pCurArea->GetFogColor(), fInvTime);
        m_Env.FogStart.SetTarget(pCurArea->GetFogStart(), fInvTime);
        m_Env.FogEnd.SetTarget(pCurArea->GetFogEnd(), fInvTime);
        m_Env.FogDensity.SetTarget(pCurArea->GetFogDensity(), fInvTime);

        m_Env.FogCol_n.SetTarget(pCurArea->GetFogColor_n(), fInvTime);
        m_Env.FogStart_n.SetTarget(pCurArea->GetFogStart_n(), fInvTime);
        m_Env.FogEnd_n.SetTarget(pCurArea->GetFogEnd_n(), fInvTime);
        m_Env.FogDensity_n.SetTarget(pCurArea->GetFogDensity_n(), fInvTime);

        m_Env.UWFogCol.SetTarget(pCurArea->GetUWFogColor(), fInvTime);
        m_Env.UWFogStart.SetTarget(pCurArea->GetUWFogStart(), fInvTime);
        m_Env.UWFogEnd.SetTarget(pCurArea->GetUWFogEnd(), fInvTime);
        m_Env.UWFogDensity.SetTarget(pCurArea->GetUWFogDensity(), fInvTime);
        m_Env.UWFogCol_n.SetTarget(pCurArea->GetUWFogColor_n(), fInvTime);
        m_Env.UWFogStart_n.SetTarget(pCurArea->GetUWFogStart_n(), fInvTime);
        m_Env.UWFogEnd_n.SetTarget(pCurArea->GetUWFogEnd_n(), fInvTime);
        m_Env.UWFogDensity_n.SetTarget(pCurArea->GetUWFogDensity_n(), fInvTime);

        m_Env.FogHeightStart.SetTarget(pCurArea->GetGlbFogHeightStart(), fInvTime);
        m_Env.FogHeightEnd.SetTarget(pCurArea->GetGlbFogHeightEnd(), fInvTime);
        m_Env.FogDensityStart.SetTarget(pCurArea->GetGlbFogDensityStart(), fInvTime);
        m_Env.FogDensityEnd.SetTarget(pCurArea->GetGlbFogDensityEnd(), fInvTime);
        m_Env.FogHeightStartNight.SetTarget(pCurArea->GetGlbFogHeightStart_n(), fInvTime);
        m_Env.FogHeightEndNight.SetTarget(pCurArea->GetGlbFogHeightEnd_n(), fInvTime);
        m_Env.FogDensityStartNight.SetTarget(pCurArea->GetGlbFogDensityStart_n(), fInvTime);
        m_Env.FogDensityEndNight.SetTarget(pCurArea->GetGlbFogDensityEnd_n(), fInvTime);

        m_Env.FogColor2.SetTarget(pCurArea->GetFogColor2(), fInvTime);
        m_Env.FogColorDensityStart.SetTarget(pCurArea->GetFogColorDensityStart(), fInvTime);
        m_Env.FogColorDensityEnd.SetTarget(pCurArea->GetFogColorDensityEnd(), fInvTime);
        m_Env.FogHorzeDensity.SetTarget(pCurArea->GetFogHorzeDensity(), fInvTime);
        m_Env.FogHorzePower.SetTarget(pCurArea->GetFogHorzePower(), fInvTime);
        m_Env.FogColor2Night.SetTarget(pCurArea->GetFogColor2Night(), fInvTime);
        m_Env.FogColorDensityStartNight.SetTarget(pCurArea->GetFogColorDensityStartNight(), fInvTime);
        m_Env.FogColorDensityEndNight.SetTarget(pCurArea->GetFogColorDensityEndNight(), fInvTime);
        m_Env.FogHorzeDensityNight.SetTarget(pCurArea->GetFogHorzeDensityNight(), fInvTime);
        m_Env.FogHorzePowerNight.SetTarget(pCurArea->GetFogHorzePowerNight(), fInvTime);

        m_Env.SkySpeedU.SetTarget(pCurArea->GetSkySpeedU(), fInvTime);
        m_Env.SkySpeedV.SetTarget(pCurArea->GetSkySpeedV(), fInvTime);

        m_Env.Ambient.SetTarget(pCurArea->GetAmbient(), fInvTime);
        m_Env.Ambient2.SetTarget(pCurArea->GetAmbient2(), fInvTime);
        m_Env.DirLtColor.SetTarget(A3DCOLORVALUE(pCurArea->GetDirLightColor()) * pCurArea->GetSunPower(), fInvTime);
        m_Env.Ambient_n.SetTarget(pCurArea->GetAmbient_n(), fInvTime);
        m_Env.Ambient2_n.SetTarget(pCurArea->GetAmbient2_n(), fInvTime);
        m_Env.DirLtColor_n.SetTarget(A3DCOLORVALUE(pCurArea->GetDirLightColor_n()) * pCurArea->GetSunPower_n(), fInvTime);

        m_Env.CloudAmb.SetTarget(pCurArea->GetCloudAmb(), fInvTime);
        m_Env.CloudDirCol.SetTarget(A3DCOLORVALUE(pCurArea->GetCloudDirCol()) * pCurArea->GetSunPower(), fInvTime);
        m_Env.CloudAmb_n.SetTarget(pCurArea->GetCloudAmb_n(), fInvTime);
        m_Env.CloudDirCol_n.SetTarget(A3DCOLORVALUE(pCurArea->GetCloudDirCol_n()) * pCurArea->GetSunPower_n(), fInvTime);

        nSkyTransTime = pCurArea->GetTransformTime();

        //    Adjust light direction
        A3DLIGHTPARAM lightParam = g_pGame->GetDirLight()->GetLightparam();
        lightParam.Direction = pDefArea->GetLightDir();
        g_pGame->GetDirLight()->SetLightParam(lightParam);

#ifdef LM_BUMP_ENABLE
        // test only
        A3DLIGHTPARAM paramDay = lightParam;
        A3DLIGHTPARAM paramNight = lightParam;
        paramDay.Diffuse = A3DCOLORVALUE(pCurArea->GetDirLightColor()) * pCurArea->GetSunPower();
        paramNight.Diffuse = A3DCOLORVALUE(pCurArea->GetDirLightColor_n()) * pCurArea->GetSunPower_n();
        m_pWorld->GetOrnamentMan()->UpdateOrnamentsLight(paramDay, paramNight);
#endif
        //    Set weather parameters
        ApplyAreaWeather(pCurArea);
    }
    else
    {
        float fTime = dwDeltaTime * 0.001f;
        
        m_Env.FogCol.Shade(fTime);
        m_Env.FogStart.Shade(fTime);
        m_Env.FogEnd.Shade(fTime);
        m_Env.FogDensity.Shade(fTime);

        m_Env.FogCol_n.Shade(fTime);
        m_Env.FogStart_n.Shade(fTime);
        m_Env.FogEnd_n.Shade(fTime);
        m_Env.FogDensity_n.Shade(fTime);

        m_Env.UWFogCol.Shade(fTime);
        m_Env.UWFogStart.Shade(fTime);
        m_Env.UWFogEnd.Shade(fTime);
        m_Env.UWFogDensity.Shade(fTime);
        m_Env.UWFogCol_n.Shade(fTime);
        m_Env.UWFogStart_n.Shade(fTime);
        m_Env.UWFogEnd_n.Shade(fTime);
        m_Env.UWFogDensity_n.Shade(fTime);

        m_Env.FogHeightStart.Shade(fTime);
        m_Env.FogHeightEnd.Shade(fTime);
        m_Env.FogDensityStart.Shade(fTime);
        m_Env.FogDensityEnd.Shade(fTime);
        m_Env.FogHeightStartNight.Shade(fTime);
        m_Env.FogHeightEndNight.Shade(fTime);
        m_Env.FogDensityStartNight.Shade(fTime);
        m_Env.FogDensityEndNight.Shade(fTime);

        m_Env.FogColor2.Shade(fTime);
        m_Env.FogColorDensityStart.Shade(fTime);
        m_Env.FogColorDensityEnd.Shade(fTime);
        m_Env.FogHorzeDensity.Shade(fTime);
        m_Env.FogHorzePower.Shade(fTime);
        m_Env.FogColor2Night.Shade(fTime);
        m_Env.FogColorDensityStartNight.Shade(fTime);
        m_Env.FogColorDensityEndNight.Shade(fTime);
        m_Env.FogHorzeDensityNight.Shade(fTime);
        m_Env.FogHorzePowerNight.Shade(fTime);

        m_Env.SkySpeedU.Shade(fTime);
        m_Env.SkySpeedV.Shade(fTime);

        m_Env.Ambient.Shade(fTime);
        m_Env.Ambient2.Shade(fTime);
        m_Env.DirLtColor.Shade(fTime);
        m_Env.Ambient_n.Shade(fTime);
        m_Env.Ambient2_n.Shade(fTime);
        m_Env.DirLtColor_n.Shade(fTime);
        m_Env.CloudAmb.Shade(fTime);
        m_Env.CloudDirCol.Shade(fTime);
        m_Env.CloudAmb_n.Shade(fTime);
        m_Env.CloudDirCol_n.Shade(fTime);

        nSkyTransTime = pCurArea->GetTransformTime();
    }

    // see if we need do a trans for the sky
    if( !m_pWorld->m_pA3DSky->IsTransing() )
    {
        float fDNFactor = m_pWorld->m_pSunMoon->GetDNFactor();
        float fDNFactorDest = m_pWorld->m_pSunMoon->GetDNFactorDest();

        if( fDNFactor == 0.0f )
        {
            // day light now
            if( m_pWorld->m_pA3DSky->NeedTrans(pCurArea->GetSkyFile0(), pCurArea->GetSkyFile1(), pCurArea->GetSkyFile2()) )
                m_pWorld->m_pA3DSky->TransSky(pCurArea->GetSkyFile0(), pCurArea->GetSkyFile1(), pCurArea->GetSkyFile2(), nSkyTransTime);
        }
        else if( fDNFactor == 1.0f )
        {
            // at night now
            if( m_pWorld->m_pA3DSky->NeedTrans(pCurArea->GetSkyFile0_n(), pCurArea->GetSkyFile1_n(), pCurArea->GetSkyFile2_n()) )
                m_pWorld->m_pA3DSky->TransSky(pCurArea->GetSkyFile0_n(), pCurArea->GetSkyFile1_n(), pCurArea->GetSkyFile2_n(), nSkyTransTime);
        }
        else
        {
            if( bInit )
            {
                // day night transition now
                if( fDNFactorDest == 0.0f )
                {
                    // first setup night sky
                    if( m_pWorld->m_pA3DSky->NeedTrans(pCurArea->GetSkyFile0_n(), pCurArea->GetSkyFile1_n(), pCurArea->GetSkyFile2_n()) )
                        m_pWorld->m_pA3DSky->TransSky(pCurArea->GetSkyFile0_n(), pCurArea->GetSkyFile1_n(), pCurArea->GetSkyFile2_n(), 0);

                    if( fDNFactor < 0.8f )
                    {
                        int nLeftTransTime = int(m_pWorld->m_pSunMoon->GetDNTransTime() / 2 * fDNFactor / 0.8f);

                        // day is comming, do transition in left time
                        if( m_pWorld->m_pA3DSky->NeedTrans(pCurArea->GetSkyFile0(), pCurArea->GetSkyFile1(), pCurArea->GetSkyFile2()) )
                            m_pWorld->m_pA3DSky->TransSky(pCurArea->GetSkyFile0(), pCurArea->GetSkyFile1(), pCurArea->GetSkyFile2(), nLeftTransTime);

                        // wait until dest texture has been loaded
                        while( m_pWorld->m_pA3DSky->IsTextureLoading() )
                            Sleep(10);

                        m_pWorld->m_pA3DSky->SetTimePassed(m_pWorld->m_pSunMoon->GetDNTransTime() / 2 - nLeftTransTime);
                    }
                }
                else
                {
                    // first setup day sky
                    if( m_pWorld->m_pA3DSky->NeedTrans(pCurArea->GetSkyFile0(), pCurArea->GetSkyFile1(), pCurArea->GetSkyFile2()) )
                        m_pWorld->m_pA3DSky->TransSky(pCurArea->GetSkyFile0(), pCurArea->GetSkyFile1(), pCurArea->GetSkyFile2(), 0);

                    if( fDNFactor > 0.5f )
                    {
                        int nLeftTransTime = int(m_pWorld->m_pSunMoon->GetDNTransTime() / 2 * (1.0f - fDNFactor) / 0.5f);

                        // night is comming
                        if( m_pWorld->m_pA3DSky->NeedTrans(pCurArea->GetSkyFile0_n(), pCurArea->GetSkyFile1_n(), pCurArea->GetSkyFile2_n()) )
                            m_pWorld->m_pA3DSky->TransSky(pCurArea->GetSkyFile0_n(), pCurArea->GetSkyFile1_n(), pCurArea->GetSkyFile2_n(), nLeftTransTime);

                        // wait until dest texture has been loaded
                        while( m_pWorld->m_pA3DSky->IsTextureLoading() )
                            Sleep(10);

                        m_pWorld->m_pA3DSky->SetTimePassed(m_pWorld->m_pSunMoon->GetDNTransTime() / 2 - nLeftTransTime);
                    }
                }
            }
            else
            {
                // day night transition now
                if( fDNFactorDest == 0.0f )
                {
                    if( fDNFactor < 0.8f )
                    {
                        // day is comming
                        if( m_pWorld->m_pA3DSky->NeedTrans(pCurArea->GetSkyFile0(), pCurArea->GetSkyFile1(), pCurArea->GetSkyFile2()) )
                            m_pWorld->m_pA3DSky->TransSky(pCurArea->GetSkyFile0(), pCurArea->GetSkyFile1(), pCurArea->GetSkyFile2(), m_pWorld->m_pSunMoon->GetDNTransTime() / 2);
                    }
                }
                else
                {
                    if( fDNFactor > 0.5f )
                    {
                        // night is comming
                        if( m_pWorld->m_pA3DSky->NeedTrans(pCurArea->GetSkyFile0_n(), pCurArea->GetSkyFile1_n(), pCurArea->GetSkyFile2_n()) )
                            m_pWorld->m_pA3DSky->TransSky(pCurArea->GetSkyFile0_n(), pCurArea->GetSkyFile1_n(), pCurArea->GetSkyFile2_n(), m_pWorld->m_pSunMoon->GetDNTransTime() / 2);
                    }
                }
            }
        }
    }

    // for some reason, the fly speed is invalid now, so just ignore it for sometime, until it is correct again
    //m_pWorld->m_pA3DSky->SetFlySpeedU(m_Env.SkySpeedU.cur);
    //m_pWorld->m_pA3DSky->SetFlySpeedV(m_Env.SkySpeedV.cur);

    A3DCOLORVALUE clLight = m_Env.DirLtColor.cur * df + m_Env.DirLtColor_n.cur * nf;
    clLight.a = 1.0f;
    float sd = 1.0f;    // specular dim value
    // 防止过亮
    float fMaxPower = 1.4f;
    if (clLight.r > fMaxPower) clLight.r = fMaxPower;
    if (clLight.g > fMaxPower) clLight.g = fMaxPower;
    if (clLight.b > fMaxPower) clLight.b = fMaxPower;

    if (m_pWorld->m_pSunMoon)
    {
        m_pWorld->m_pSunMoon->SetSunColor((m_Env.DirLtColor.cur * df + A3DCOLORVALUE(1.0f, 0.5f, 0.0f, 1.0f) * nf).ToRGBAColor() | 0xff000000);
        m_pWorld->m_pSunMoon->SetMoonColor(m_Env.DirLtColor_n.cur.ToRGBAColor() | 0xff000000);
        m_pWorld->m_pSunMoon->SetSunVisible(pDefArea->HasSun());
        m_pWorld->m_pSunMoon->SetMoonVisible(pDefArea->HasMoon());

        /* now determine a sky light according to the time
        if( m_pWorld->m_pSunMoon->IsSunTime() )
        {
            if( m_pWorld->m_pSunMoon->GetDNFactorDest() == 1.0f )
            {
                float  dm = (DAY_SUN_SET_MAX - DAY_NIGHT_START) / (DAY_NIGHT_END - DAY_NIGHT_START);
                if( nf < dm )
                    clLight = m_pWorld->m_pSunMoon->GetSunColor();
                else
                {
                    // we have to fade out sun color now.
                    float d = 1.0f - dm;
                    clLight = A3DCOLORVALUE(m_pWorld->m_pSunMoon->GetSunColor()) * ((1.0f - nf) / d) + 
                        A3DCOLORVALUE(m_pWorld->m_pSunMoon->GetMoonColor()) * ((nf - dm) / d);
                    sd = (1.0f - nf) / d;
                }
            }
            else
            {
                float  sm = (NIGHT_SUN_RISE_MIN - NIGHT_DAY_START) / (NIGHT_DAY_END - NIGHT_DAY_START);
                if( nf < sm )
                    clLight = m_pWorld->m_pSunMoon->GetSunColor();
                else
                {
                    // we have to fade in sun color now.
                    float d = 1.0f - sm;
                    clLight = A3DCOLORVALUE(m_pWorld->m_pSunMoon->GetSunColor()) * ((1.0f - nf) / d) + 
                        A3DCOLORVALUE(m_pWorld->m_pSunMoon->GetMoonColor()) * (nf - sm / d);
                    sd = (1.0f - nf) / d;
                }
            }
        }
        else
        {
            clLight = m_pWorld->m_pSunMoon->GetMoonColor();
            sd = m_pWorld->m_pSunMoon->GetMoonPitch() / DEG2RAD(30.0f);
            a_Clamp(sd, 0.0f, 0.8f);
        }
        */
        clLight.a = 1.0f;
    }

    //    Adjust light info
    A3DLIGHTPARAM lightParam = g_pGame->GetDirLight()->GetLightparam();
    lightParam.Diffuse = clLight;
    lightParam.Specular = clLight * sd;
    lightParam.Specular.a = 1.0f;
    g_pGame->GetDirLight()->SetLightParam(lightParam);
    g_pGame->GetA3DDevice()->SetAmbient(0xff000000 | (m_Env.Ambient.cur * df + m_Env.Ambient_n.cur * nf).ToRGBAColor());

    A3DEnvironment::DIRLIGHT LitmapParam;
    LitmapParam.Diffuse = clLight;
    LitmapParam.DirPower = 0.8f;//sd
    LitmapParam.Ambient0 = m_Env.Ambient.cur * df + m_Env.Ambient_n.cur * nf;
    LitmapParam.Ambient1 = m_Env.Ambient2.cur * df + m_Env.Ambient2_n.cur * nf;
    LitmapParam.Direction = lightParam.Direction;
    g_pGame->GetA3DEngine()->GetA3DEnvironment()->SetDirLightParam(&LitmapParam);

    A3DEnvironment::LITMAP lightMapParam = *g_pGame->GetA3DEngine()->GetA3DEnvironment()->GetLightMapParam();
    lightMapParam.MaxLight = m_fLightMapMaxLight;
    lightMapParam.MaxLightNight = m_fLightMapMaxLightNight;
    g_pGame->GetA3DEngine()->GetA3DEnvironment()->SetLightMapParam(&lightMapParam);

    if( m_pWorld->GetCloudManager() )
    {
        m_pWorld->GetCloudManager()->SetSpriteColor(m_Env.CloudAmb.cur * df + m_Env.CloudAmb_n.cur * nf, m_Env.CloudDirCol.cur * df + m_Env.CloudDirCol_n.cur * nf);
    }

    //Water changed!!
    //m_pWorld->m_pA3DTerrainWater->SetFogAir((m_Env.FogCol.cur * df + m_Env.FogCol_n.cur * nf).ToRGBAColor(), 
    //	(m_Env.FogStart.cur * df + m_Env.FogStart_n.cur * nf) * (CECSceneBlock::GetFogTimes() > 1.0f ? 1.0f : CECSceneBlock::GetFogTimes()), 
    //	(m_Env.FogEnd.cur * df + m_Env.FogEnd_n.cur * nf) * CECSceneBlock::GetFogTimes());
    //m_pWorld->m_pA3DTerrainWater->SetFogWater((m_Env.UWFogCol.cur * df + m_Env.UWFogCol_n.cur * nf).ToRGBAColor(), 
    //	m_Env.UWFogStart.cur * df + m_Env.UWFogStart_n.cur * nf, m_Env.UWFogEnd.cur * df + m_Env.UWFogEnd_n.cur * nf);

    float fFogStart, fFogEnd;
    float fFogDensity;
    A3DCOLOR fogColor;
    float fFogHeightStart, fFogHeightEnd;
    float fFogDensityFactorStart, fFogDensityFactorEnd;

    float   fFogColorDensityStart;
    float   fFogColorDensityEnd;
    float   fFogHorzeDensity;
    float   fFogHorzePower;
    A3DCOLOR fogColor2;

    A3DEnvironment::FOG fogParams = *g_pGame->GetA3DEngine()->GetA3DEnvironment()->GetFogParam();

    //	Check enviroment type setup correct fog

    // above water fog
    fFogStart = (m_Env.FogStart.cur * df + m_Env.FogStart_n.cur * nf) * (CECSceneBlock::GetFogTimes() > 1.0f ? 1.0f : CECSceneBlock::GetFogTimes());
    fFogEnd = (m_Env.FogEnd.cur * df + m_Env.FogEnd_n.cur * nf) * CECSceneBlock::GetFogTimes();

    fFogDensity = m_Env.FogDensity.cur * df + m_Env.FogDensity_n.cur * nf;
    fogColor = (m_Env.FogCol.cur * df + m_Env.FogCol_n.cur * nf).ToRGBAColor();

    fFogHeightStart = (m_Env.FogHeightStart.cur * df + m_Env.FogHeightStartNight.cur * nf);
    fFogHeightEnd = (m_Env.FogHeightEnd .cur* df + m_Env.FogHeightEndNight.cur * nf);
    fFogDensityFactorStart = (m_Env.FogDensityStart.cur * df + m_Env.FogDensityStartNight.cur * nf);
    fFogDensityFactorEnd = (m_Env.FogDensityEnd.cur * df + m_Env.FogDensityEndNight.cur * nf);
    fogColor2 = (m_Env.FogColor2.cur * df + m_Env.FogColor2Night.cur * nf).ToRGBAColor();
    fFogColorDensityStart = (m_Env.FogColorDensityStart.cur * df + m_Env.FogColorDensityStartNight.cur * nf);
    fFogColorDensityEnd = (m_Env.FogColorDensityEnd.cur * df + m_Env.FogColorDensityEndNight.cur * nf);
    fFogHorzeDensity = (m_Env.FogHorzeDensity.cur * df + m_Env.FogHorzeDensityNight.cur * nf);
    fFogHorzePower = (m_Env.FogHorzePower.cur * df + m_Env.FogHorzePowerNight.cur * nf);

    fogParams.bGlobalFogEnable = true;
    fogParams.crFog1 = fogColor;
    fogParams.crFog2 = fogColor2;
    fogParams.fFogStart = fFogStart;
    fogParams.fFogEnd = fFogEnd;
    fogParams.fHeightDensity = fFogDensity;
    fogParams.fHeightStart = fFogHeightStart;
    fogParams.fHeightEnd = fFogHeightEnd;
    fogParams.fDensity1 = fFogDensityFactorStart;
    fogParams.fDensity2 = fFogDensityFactorEnd;
    fogParams.fColorIntensity1 = fFogColorDensityStart;
    fogParams.fColorIntensity2 = fFogColorDensityEnd;
    fogParams.fHorzDensity = fFogHorzeDensity;
    fogParams.fHorzPower = fFogHorzePower;

    g_pGame->GetA3DEngine()->GetA3DEnvironment()->SetFogParamAboveWater(&fogParams);

    // under water fog
    fFogStart = m_Env.UWFogStart.cur * df + m_Env.UWFogStart_n.cur * nf;
    fFogEnd = m_Env.UWFogEnd.cur * df + m_Env.UWFogEnd_n.cur * nf;

    fFogDensity = m_Env.UWFogDensity.cur * df + m_Env.UWFogDensity_n.cur * nf;
    fogColor = (m_Env.UWFogCol.cur * df + m_Env.UWFogCol_n.cur * nf).ToRGBAColor();
    fogColor2 = fogColor;
    fFogHeightStart = 0;
    fFogHeightEnd = 1000;
    fFogDensityFactorStart = 1;
    fFogDensityFactorEnd = 1;
    fFogColorDensityStart = 1;
    fFogColorDensityEnd = 1;
    fFogHorzeDensity = fFogDensity;
    fFogHorzePower = 1;

    fogParams.bGlobalFogEnable = true;
    fogParams.crFog1 = fogColor;
    fogParams.crFog2 = fogColor2;
    fogParams.fFogStart = fFogStart;
    fogParams.fFogEnd = fFogEnd;
    fogParams.fHeightDensity = fFogDensity;
    fogParams.fHeightStart = fFogHeightStart;
    fogParams.fHeightEnd = fFogHeightEnd;
    fogParams.fDensity1 = fFogDensityFactorStart;
    fogParams.fDensity2 = fFogDensityFactorEnd;
    fogParams.fColorIntensity1 = fFogColorDensityStart;
    fogParams.fColorIntensity2 = fFogColorDensityEnd;
    fogParams.fHorzDensity = fFogHorzeDensity;
    fogParams.fHorzPower = fFogHorzePower;
    g_pGame->GetA3DEngine()->GetA3DEnvironment()->SetFogParamUnderWater(&fogParams);
    g_pGame->GetA3DEngine()->GetA3DEnvironment()->SetIsUnderWater(bUnderWater);

    pA3DDevice->SetFogEnable(false);

    g_pGame->GetViewport()->GetA3DViewport()->SetClearColor(fogColor2);

    m_Env.bUnderWater = bUnderWater;

    return true;
}

//    Apply weather of box area
void CECScene::ApplyAreaWeather(CECScnBoxArea* pArea)
{
    if (g_Animator.IsSpecifyWeahter())
    {
        return;
    }

    ASSERT(pArea);

    A3DRain* pRain = m_pWorld->m_pRain;
    A3DSnow* pSnow = m_pWorld->m_pSnow;

    if (pRain)
    {
        if (pArea->HasRain())
        {
            //pRain->SetUseRateMode(pArea->GetRainSpeed(), true);
            //pRain->SetSize(pArea->GetRainSize());
            //pRain->SetColor(0, pArea->GetRainColor());
            pRain->StartRain();
        }
        else
            pRain->Stop();
    }

    if (pSnow)
    {
        if (pArea->HasSnow())
        {
            //pSnow->SetUseRateMode(pArea->GetSnowSpeed(), true);
            //pSnow->SetSize(pArea->GetSnowSize());
            //pSnow->SetColor(0, pArea->GetSnowColor());
            pSnow->StartSnow();
        }
        else
            pSnow->Stop();
    }
}


//    Get specified grass type, if it doesn't exist, create it
CELGRASSTYPE* CECScene::GetGlassType(DWORD dwType)
{
    CELGRASSLAND* pGrassland = m_pWorld->GetGrassLand();
    CELGRASSTYPE* pGrassType = pGrassland->GetGrassTypeByID(dwType);
    if (pGrassType)
        return pGrassType;

    //    Create a new grass type
    GRASSTYPE* pTypeInfo = m_aGrassTypes[dwType];

    CELGRASSTYPE::GRASSDEFINE_DATA DefData;
    memset(&DefData, 0, sizeof (DefData));

    DefData.nAlphaRefValue        = pTypeInfo->Data.iAlphaRef;
    DefData.bAlphaBlendEnable    = pTypeInfo->Data.bAlphaBlend;
    DefData.vSightRange            = pTypeInfo->Data.fSightRange;
    DefData.vSize                = pTypeInfo->Data.fSize;
    DefData.vSizeVar            = pTypeInfo->Data.fSizeVar;
    DefData.vSoftness            = pTypeInfo->Data.fSoftness;

    if (!pGrassland->AddGrassType(dwType, DefData, 10000, pTypeInfo->strGrassFile, &pGrassType))
    {
        a_LogOutput(1, _EA("CECScene::GetGlassType, Failed to create new grass type %d"), dwType);
        return NULL;
    }

    pTypeInfo->pGrass = pGrassType;

    return pGrassType;
}

//    Update tree and grass types
void CECScene::UpdatePlantTypes(DWORD dwDeltaTime)
{
    CELGRASSLAND* pGrassland = m_pWorld->GetGrassLand();

    int i;

    //    Update grass types
    for (i=0; i < m_aGrassTypes.GetSize(); i++)
    {
        GRASSTYPE* pType = m_aGrassTypes[i];
        if (!pType->pGrass)
            continue;

        if (!pType->pGrass->GetGrassBitsMapCount())
        {
            if ((pType->dwIdleTime += dwDeltaTime) >= PLANT_IDLE_TIME)
            {
                //    Remove this grass type
                pGrassland->DeleteGrassType(pType->pGrass);
                pType->pGrass = NULL;
            }
        }
        else
            pType->dwIdleTime = 0;
    }
}

//    Update block resources
void CECScene::UpdateBlockRes()
{
    if (!m_pCurActBlocks)
        return;

    int i, iNumBlock = m_pCurActBlocks->aBlocks.GetSize();
    for (i=0; i < iNumBlock; i++)
    {
        CECSceneBlock* pBlock = m_pCurActBlocks->aBlocks[i];
        if (pBlock)
        {
            const ARectF& rc = pBlock->GetBlockArea();

            A3DVECTOR3 vBlock;
            vBlock.x = (rc.left + rc.right) * 0.5f;
            vBlock.y = 0.0f;
            vBlock.z = (rc.top + rc.bottom) * 0.5f;
            
            float fDist = a3d_MagnitudeH(vBlock - m_vLoadCenter) - m_fBlockSize * 0.5f;
            pBlock->UpdateRes(fDist);
        }
    }
}

//  Update post effect
void CECScene::UpdatePostEffect(DWORD dwDeltaTime, const A3DVECTOR3& vCenter)
{
    if (!m_pCurActBlocks) return;

    CECSceneBlock *pCurBlock = 0;
    int iNumBlocks = m_pCurActBlocks->aBlocks.GetSize();
    for (int i=0; i<iNumBlocks; ++i)
    {
        CECSceneBlock *pBlock = m_pCurActBlocks->aBlocks[i];
        if (pBlock)
        {
            const ARectF& rc = pBlock->GetBlockArea();
            if (rc.left <= vCenter.x && vCenter.x <= rc.right &&
                rc.bottom <= vCenter.z && vCenter.z <= rc.top)
            {
                pCurBlock = pBlock;
                break;
            }
        }
    }

    if (pCurBlock)
    {
        m_EffectDOFParam = pCurBlock->GetPostEffectDOFParam();
        m_EffectBloomParamDay = pCurBlock->GetPostEffectBloomParamDay();
        m_EffectBloomParamNight = pCurBlock->GetPostEffectBloomParamNight();
        m_EffectFullGlowParamDay = pCurBlock->GetPostEffectFullGlowParamDay();
        m_EffectFullGlowParamNight = pCurBlock->GetPostEffectFullGlowParamNight();
    }
}

//分了高中低三档， 分别是0， 1， 2
void CECScene::SetFFTWaterLevel(BYTE nLevel)
{
    if (m_iSceneVersion < 19)// + fft water param
        return;

    m_FFTWaterParam.m_bUseFFT = (nLevel != 0);
    m_FFTWaterParam.m_bEdgeFoam = (nLevel != 0);
    m_FFTWaterParam.m_bWaveFoam = (nLevel != 0);
    m_FFTWaterParam.m_bWaveGloss = true;
    m_FFTWaterParam.m_bCaustic = (nLevel == 2);
    m_FFTWaterParam.m_bHighRefr = false;
    m_FFTWaterParam.m_bUnderGodRay = (nLevel == 2);
    m_FFTWaterParam.m_bEnableWave = (nLevel != 0);
    //m_FFTWaterParam.m_bCubeReflection = (nLevel == 0);//这个要打开需要编辑器导出一个反射贴图才行， 暂时注释掉这一行
    m_FFTWaterParam.m_bOnlyReflectSky = (nLevel != 2);
    m_FFTWaterParam.m_bFullReflection = (nLevel == 2);

    if (m_pWorld->GetTerrainWaterFFT())
        m_pWorld->GetTerrainWaterFFT()->SetParam(m_FFTWaterParam);
}
