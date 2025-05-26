#include "StdAfx.h"
#include "EC_Global.h"
#include "EC_SceneLoader.h"
#include "EC_SceneThreadObj.h"
#include <A3DTerrain2LoaderB.h>

#include "EC_Game.h"
#include "EC_GameRun.h"
#include "EC_World.h"
#include "EC_ManOrnament.h"
#include "EC_Model.h"
#include "EC_Utility.h"
#include "Animator/Animator.h"

volatile bool g_bIsLoadersInited = false;
extern HANDLE g_hToSuspendMain;
extern HANDLE g_hMainThread;
static const float _max_speed = 20.0f * 2.0f; // terrain or ornament must be loaded in middle distance

//	Multi-thread loaded terrain block info
struct MTL_TRNBLOCK
{
	int	r;
	int	c;
	int	iBlock;
};

static HANDLE g_hToExit			= NULL;

static DWORD WINAPI LoaderThreadFunc(LPVOID lpParam);
static DWORD WINAPI _LoaderThreadFuncImp(LPVOID lpParam);

class LoaderThreadModul
{
protected:
	LoaderThreadModul(int nPriority)
	{
		m_nPriority		=	nPriority;
		m_hThreadHandle	=	0;
		m_dwThreadID	=	0;
		m_hToRun		=	NULL;
		m_hAlreadySuspend=	NULL;
	}

	virtual ~LoaderThreadModul() {}

protected:
	int		m_nPriority;
	HANDLE	m_hThreadHandle;
	DWORD	m_dwThreadID;
	
	HANDLE  m_hToRun;				//event，有信号代表该线程期望运行，无信号期望阻塞。
	HANDLE  m_hAlreadySuspend;		//event，有信号代表该线程已经被阻塞.

public:
	void Create();
	void Release();
	void Start();
	bool IsSuspended() const 
	{ 
		if (!m_hAlreadySuspend)
		{
			return true;
		}
		if (WaitForSingleObject(m_hAlreadySuspend,0)==WAIT_OBJECT_0)
		{
			return true;
		}
		return false;
	}
	//挂起这个线程，该操作不是即时生效的，需要通过IsSuspended()检测这个线程是否真的挂起了。
	void Suspend()
	{
		if (m_hToRun)
		{
			ResetEvent(m_hToRun);
		}
	}

	virtual void LoaderFunc(bool bInLoaderThread) = 0;
	virtual void RemoveAllData() {}

	friend DWORD WINAPI _LoaderThreadFuncImp(LPVOID lpParam);
};

inline void LoaderThreadModul::Create()
{
	if (m_hThreadHandle)
		return;

	m_hThreadHandle = ::CreateThread(NULL, 0, LoaderThreadFunc, this, CREATE_SUSPENDED, &m_dwThreadID);
	::SetThreadPriority(m_hThreadHandle, m_nPriority);
	::SetThreadPriorityBoost(m_hThreadHandle, FALSE);

	if (!m_hToRun)
	{
		m_hToRun = ::CreateEvent(NULL, TRUE, FALSE, NULL);
	}
	if (!m_hAlreadySuspend)
	{
		m_hAlreadySuspend = ::CreateEvent(NULL, TRUE, FALSE, NULL);
	}
	ResumeThread(m_hThreadHandle);
}

inline void LoaderThreadModul::Release()
{
	if (m_hThreadHandle == 0)
	{
		RemoveAllData();
		return;
	}

	::WaitForSingleObject(m_hThreadHandle, INFINITE);
	m_hThreadHandle = 0;
	m_dwThreadID = 0;
	if (m_hToRun)
	{
		CloseHandle(m_hToRun);
		m_hToRun = NULL;
	}
	if (m_hAlreadySuspend)
	{
		CloseHandle(m_hAlreadySuspend);
		m_hAlreadySuspend = NULL;
	}
}

inline void LoaderThreadModul::Start()
{
	if (m_hToRun)
	{
		SetEvent(m_hToRun);
	}
}

class TerrLoaderModule : public LoaderThreadModul
{
public:
	TerrLoaderModule() :
	LoaderThreadModul(THREAD_PRIORITY_NORMAL),
	m_aBlkLoads(256, 64),
	m_aToLoad(256),
	m_aToRelease(256),
	m_ScnObjLoadList(512),
	m_ScnObjReleaseList(512)
	{
		::InitializeCriticalSection(&m_csTrnBlock);
		::InitializeCriticalSection(&m_csScnObj);
	}

	~TerrLoaderModule()
	{
		::DeleteCriticalSection(&m_csTrnBlock);
		::DeleteCriticalSection(&m_csScnObj);
	}

protected:
	AArray<MTL_TRNBLOCK, MTL_TRNBLOCK&> m_aBlkLoads;
	APtrList<CECSceneThreadObj*> m_aToLoad;
	APtrList<CECSceneThreadObj*> m_aToRelease;
	APtrList<CECSceneThreadObj*> m_ScnObjLoadList;
	APtrList<CECSceneThreadObj*> m_ScnObjReleaseList;

	CRITICAL_SECTION m_csTrnBlock;
	CRITICAL_SECTION m_csScnObj;

public:
	void LoadTerrainData(bool bInLoaderThread);
	void LoadOrnament(bool bInLoaderThread);
	void LoaderFunc(bool bInLoaderThread);
	void RemoveAllData()
	{
		::EnterCriticalSection(&m_csTrnBlock);
		m_aBlkLoads.RemoveAll();
		::LeaveCriticalSection(&m_csTrnBlock);

		::EnterCriticalSection(&m_csScnObj);
		m_ScnObjLoadList.RemoveAll();

		ALISTPOSITION pos = m_ScnObjReleaseList.GetHeadPosition();

		while (pos)
		{
			CECSceneThreadObj* pObj = m_ScnObjReleaseList.GetNext(pos);
			if (pObj->IsLoaded()) pObj->ReleaseInThread();
			delete pObj;
		}

		m_ScnObjReleaseList.RemoveAll();

		m_aToLoad.RemoveAll();
		m_aToRelease.RemoveAll();

		::LeaveCriticalSection(&m_csScnObj);
	}
	void QueueTerrainBlock(MTL_TRNBLOCK blk)
	{
		::EnterCriticalSection(&m_csTrnBlock);
		m_aBlkLoads.Add(blk);
		::LeaveCriticalSection(&m_csTrnBlock);
	}
	void QueueLoadScnObj(CECSceneThreadObj* pObj)
	{
		::EnterCriticalSection(&m_csScnObj);
		m_ScnObjLoadList.AddTail(pObj);
		::LeaveCriticalSection(&m_csScnObj);
	}
	void QueueReleaseScnObj(CECSceneThreadObj* pObj)
	{
		::EnterCriticalSection(&m_csScnObj);
		pObj->SetToRelease();
		m_ScnObjReleaseList.AddTail(pObj);
		::LeaveCriticalSection(&m_csScnObj);
	}
};

inline void TerrLoaderModule::LoadTerrainData(bool bInLoaderThread)
{
	//	Load terrain data
	A3DTerrain2* pTerrain = g_pGame->GetGameRun()->GetCurWorld()->GetTerrain();
	if (!pTerrain->IsMultiThreadLoad() || !pTerrain->GetDataLoadFlag()) return;

	DWORD dwMaxTick = DWORD(pTerrain->GetActRadius() * (1000.f / _max_speed));
	bool bSuspendMain = false;

	while (true)
	{
		A3DTerrain2Loader* pLoader = pTerrain->GetTerrainLoader();
		if (pLoader->GetLoaderID() == A3DTerrain2Loader::LOADER_B)
			((A3DTerrain2LoaderB*)pLoader)->DeactivateIdleSubTerrains();

		//	Release unloaded blocks ---------------------------
		A3DTerrain2Block* pBlock = pTerrain->GetNextBlockToBeUnloaded();
		while (pBlock)
		{
			pTerrain->ThreadUnloadBlock(pBlock);
			pBlock = pTerrain->GetNextBlockToBeUnloaded();
		}

		//	Load candidate blocks ------------------------------
		::EnterCriticalSection(&m_csTrnBlock);

		if (m_aBlkLoads.GetSize() == 0)
		{
			::LeaveCriticalSection(&m_csTrnBlock);

			if (bInLoaderThread)
				::Sleep(100);

			break;
		}

		AArray<MTL_TRNBLOCK, MTL_TRNBLOCK&> aBlkLoads(64, 64);

		//	Transfer candidate terrain blocks
		for (int i = 0; i < m_aBlkLoads.GetSize(); i++)
			aBlkLoads.Add(m_aBlkLoads[i]);

		m_aBlkLoads.RemoveAll(false);

		::LeaveCriticalSection(&m_csTrnBlock);

		/*
		char buf[100];
		sprintf(buf, _EA("load count = %d\n"), aBlkLoads.GetSize());
		OutputDebugStringA(buf);
		*/

		DWORD dwStart = ::GetTickCount();
		DWORD dwOnceStart = dwStart;

		//	Load candidate terrain blocks ...
		for (int i=0; i < aBlkLoads.GetSize(); i++)
		{
			const MTL_TRNBLOCK& Blk = aBlkLoads[i];
			pTerrain->ThreadLoadBlock(Blk.r, Blk.c, Blk.iBlock);

			if (bInLoaderThread && !bSuspendMain)
			{
				DWORD dwCur = ::GetTickCount();
				DWORD dwSpan = dwCur - dwOnceStart;
				DWORD dwTotalSpan = dwCur - dwStart;

				if (dwTotalSpan >= dwMaxTick)
				{
  					bSuspendMain = true;
					::SetEvent(g_hToSuspendMain);
				}
				else if (dwSpan > 100)
				{
					::Sleep(100);
					dwOnceStart = ::GetTickCount();
				}
			}
		}
	}

	if (bSuspendMain && ::WaitForSingleObject(g_hToSuspendMain, 0) != WAIT_OBJECT_0)
		::ResumeThread(g_hMainThread);
}

inline void TerrLoaderModule::LoadOrnament(bool bInLoaderThread)
{
	A3DTerrain2* pTerrain = g_pGame->GetGameRun()->GetCurWorld()->GetTerrain();
	DWORD dwMaxTick = DWORD(pTerrain->GetViewRadius() * (1000.f / _max_speed));
	bool bSuspendMain = false;
	static const float _min_square_dist = 2500.0f;

	while (true)
	{
		::EnterCriticalSection(&m_csScnObj);

		ALISTPOSITION pos = m_ScnObjLoadList.GetHeadPosition();

		if (bInLoaderThread)
		{
			A3DVECTOR3 vHost = g_pGame->GetViewport()->GetA3DCameraBase()->GetPos();

			while (pos)
			{
				CECSceneThreadObj* pObj = m_ScnObjLoadList.GetNext(pos);
				A3DVECTOR3 vLoadPos = pObj->GetLoadPos();
				float xOff = vLoadPos.x - vHost.x;
				float zOff = vLoadPos.z - vHost.z;
				float fDist = xOff * xOff + zOff * zOff;
				pObj->SetDistToHost(fDist);

				if (bInLoaderThread && !bSuspendMain && fDist < _min_square_dist)
				{
                    /* TODO: lixiang 2012.7.17
                       Do not suspend main thread
					bSuspendMain = true;
					::SetEvent(g_hToSuspendMain);
                    */
				}

				ALISTPOSITION posLoad = m_aToLoad.GetHeadPosition();
				while (posLoad)
				{
					ALISTPOSITION posCur = posLoad;
					CECSceneThreadObj* p = m_aToLoad.GetNext(posLoad);

					if (fDist < p->GetDistToHost())
					{
						posLoad = posCur;
						m_aToLoad.InsertBefore(posLoad, pObj);
						break;
					}
				}

				if (posLoad == NULL)
					m_aToLoad.AddTail(pObj);
			}
		}
		else while (pos)
			m_aToLoad.AddTail(m_ScnObjLoadList.GetNext(pos));

		m_ScnObjLoadList.RemoveAll();

		pos = m_ScnObjReleaseList.GetHeadPosition();
		while (pos) m_aToRelease.AddTail(m_ScnObjReleaseList.GetNext(pos));
		m_ScnObjReleaseList.RemoveAll();

		::LeaveCriticalSection(&m_csScnObj);

		if (m_aToLoad.GetCount() == 0 && m_aToRelease.GetCount() == 0)
		{
			if( bInLoaderThread )
				::Sleep(100);
			break;
		}

		// 先加载再释放

		if (m_aToLoad.GetCount())
		{
			/*
            char buf[100];
			sprintf(buf, _EA("orn count = %d\n"), m_aToLoad.GetCount());
			OutputDebugStringA(buf);
            */

			DWORD dwStart = ::GetTickCount();
			DWORD dwOnceStart = dwStart;
			ALISTPOSITION posLoad = m_aToLoad.GetHeadPosition();

			while (posLoad)
			{
				CECSceneThreadObj* pToLoad = m_aToLoad.GetNext(posLoad);

				if (pToLoad->IsToRelease())
					continue;
				else
				{
					pToLoad->LoadInThread(bInLoaderThread);
					pToLoad->SetLoaded();

					if (bInLoaderThread && !bSuspendMain)
					{
						DWORD dwCur = ::GetTickCount();
						DWORD dwSpan = dwCur - dwOnceStart;
						DWORD dwTotalSpan = dwCur - dwStart;

						if (dwTotalSpan >= dwMaxTick)
						{
                            /* TODO: lixiang 2012.7.17
                               Do not suspend main thread
  							bSuspendMain = true;
							::SetEvent(g_hToSuspendMain);
                            */
						}
						else if (dwSpan > 100)
						{
							::Sleep(100);
							dwOnceStart = ::GetTickCount();
						}
					}
				}
			}

			/*
            sprintf(buf, _EA("orn time = %d\n"), ::GetTickCount() - dwStart);
			OutputDebugStringA(buf);
            */

			m_aToLoad.RemoveAll();
		}

		if (m_aToRelease.GetCount())
		{
			ALISTPOSITION posRelease = m_aToRelease.GetHeadPosition();

			while (posRelease)
			{
				CECSceneThreadObj* pToRelease = m_aToRelease.GetNext(posRelease);
				if (pToRelease->IsLoaded()) pToRelease->ReleaseInThread();
				delete pToRelease;
			}

			m_aToRelease.RemoveAll();
		}
	}

	if (bSuspendMain && ::WaitForSingleObject(g_hToSuspendMain, 0) != WAIT_OBJECT_0)
		::ResumeThread(g_hMainThread);
}

void TerrLoaderModule::LoaderFunc(bool bInLoaderThread)
{
	LoadTerrainData(bInLoaderThread);
	LoadOrnament(bInLoaderThread);
}


class ECModelLoaderModule : public LoaderThreadModul
{
public:
	ECModelLoaderModule(int nPriority) :
	LoaderThreadModul(nPriority),
	m_aModelLoads(512),
	m_aDelModels(512, 64),
	m_aTemplDel(64, 64),
	m_aTemplLoad(256, 256)
	{
		::InitializeCriticalSection(&m_csDelECModel);
		::InitializeCriticalSection(&m_csECModel);
	}

	virtual ~ECModelLoaderModule()
	{
		::DeleteCriticalSection(&m_csDelECModel);
		::DeleteCriticalSection(&m_csECModel);
	}

protected:
	APtrList<MTL_ECMODEL*>	m_aModelLoads;
	APtrArray<CECModel*>	m_aDelModels;
	APtrArray<CECModel*>	m_aTemplDel;
	APtrArray<MTL_ECMODEL*> m_aTemplLoad;

	CRITICAL_SECTION		m_csDelECModel;
	CRITICAL_SECTION		m_csECModel;

public:
	void LoadAndReleaseECModels(bool bInLoaderThread);
	void QueueECModelForLoad(const MTL_ECMODEL& model, const A3DVECTOR3& pos);
	void QueuePlayerUndoLoad(_INT_64 cid, DWORD dwBornStamp);
	void QueueECModelForRelease(CECModel* pModel);
	void LoaderFunc(bool bInLoaderThread);
	void RemoveOldData()
	{
		::EnterCriticalSection(&m_csDelECModel);

		for (int i = 0; i < m_aDelModels.GetSize(); i++)
		{
			CECModel* pModel = m_aDelModels[i];
			pModel->Release();
			delete pModel;
		}

		m_aDelModels.RemoveAll(false);
		::LeaveCriticalSection(&m_csDelECModel);
	}
	void RemoveAllData()
	{
		RemoveOldData();

		::EnterCriticalSection(&m_csECModel);
		ALISTPOSITION pos = m_aModelLoads.GetHeadPosition();
		while (pos) delete m_aModelLoads.GetNext(pos);
		m_aModelLoads.RemoveAll();
		::LeaveCriticalSection(&m_csECModel);
	}
};

inline void ECModelLoaderModule::QueueECModelForLoad(const MTL_ECMODEL& model, const A3DVECTOR3& pos)
{
	::EnterCriticalSection(&m_csECModel);

	MTL_ECMODEL* Info = new MTL_ECMODEL(model);
	// For demo player, we set it's position as the same as host player.
	// So it's ensure to be loaded.
	if (MTL_ECM_DEMOPLAYER == model.iType || MTL_ECM_DEMOPLAYER_EQUIP == model.iType)
		Info->fDist = 0;
	else
		Info->fDist	= SquareMagnitude(pos - g_pGame->GetViewport()->GetA3DCameraBase()->GetPos());

	m_aModelLoads.AddTail(Info);
	::LeaveCriticalSection(&m_csECModel);
}

inline void ECModelLoaderModule::QueuePlayerUndoLoad(_INT_64 cid, DWORD dwBornStamp)
{
	::EnterCriticalSection(&m_csECModel);

	// 判断加载队列是否已有此对象

	ALISTPOSITION pos = m_aModelLoads.GetHeadPosition(), posCur;

	while (pos)
	{
		posCur = pos;
		const MTL_ECMODEL* pInfo = m_aModelLoads.GetNext(pos);
		if (pInfo->iId == cid && pInfo->dwBornStamp == dwBornStamp)
		{
			delete pInfo;
			m_aModelLoads.RemoveAt(posCur);
		}
	}

	::LeaveCriticalSection(&m_csECModel);
}


inline void ECModelLoaderModule::QueueECModelForRelease(CECModel* pModel)
{
	::EnterCriticalSection(&m_csDelECModel);
	m_aDelModels.Add(pModel);
	::LeaveCriticalSection(&m_csDelECModel);
}

static const int _load_per_time = 4;

//#include "EC_GameUIMan.h"
//#include "EC_UIManager.h"

inline void ECModelLoaderModule::LoadAndReleaseECModels(bool bInLoaderThread)
{
	CECWorld* pWorld = g_pGame->GetGameRun()->GetCurWorld();
	//CECNPCMan* pNPCMan = pWorld->GetNPCMan();
	CECOrnamentMan* pOnmtMan = pWorld->GetOrnamentMan();
	//CECMatterMan* pMatterMan = pWorld->GetMatterMan();
	//CECPlayerMan* pPlayerMan = pWorld->GetPlayerMan();
	//CECDemoPlayerMan* pDemoPlayerMan = pWorld->GetDemoPlayerMan();

	//	Delete at first -------------------------
	::EnterCriticalSection(&m_csDelECModel);
	m_aTemplDel.RemoveAll(false);

	for (int i = 0; i < m_aDelModels.GetSize(); i++)
		m_aTemplDel.Add(m_aDelModels[i]);

	m_aDelModels.RemoveAll(false);
	::LeaveCriticalSection(&m_csDelECModel);

	for (int i = 0; i < m_aTemplDel.GetSize(); i++)
	{
		CECModel* pModel = m_aTemplDel[i];
		pModel->Release();
		delete pModel;
	}

	//	Load -------------------------------------

	//	Transfer candidate NPC models
	::EnterCriticalSection(&m_csECModel);
	m_aTemplLoad.RemoveAll(false);

	if (m_aModelLoads.GetCount())
	{
		if (bInLoaderThread)
		{
			int nLoadCount = 0;
			ALISTPOSITION pos = m_aModelLoads.GetHeadPosition();
			ALISTPOSITION posCur;

			struct
			{
				MTL_ECMODEL* p;
				ALISTPOSITION pos;
			} _tmp[_load_per_time + 1];

			memset(_tmp, 0, sizeof(_tmp));

			while (pos)
			{
				posCur = pos;
				MTL_ECMODEL* p = m_aModelLoads.GetNext(pos);
				bool bReplace = false;

				for (int i = 0; i < nLoadCount; i++)
				{
					if (p->fDist < _tmp[i].p->fDist)
					{
						memmove(&_tmp[i+1], &_tmp[i], (nLoadCount - i) * sizeof(_tmp[0]));
						_tmp[i].p = p;
						_tmp[i].pos = posCur;
						if (nLoadCount < _load_per_time) nLoadCount++;
						bReplace = true;
						break;
					}
				}

				if (!bReplace && nLoadCount < _load_per_time)
				{
					_tmp[nLoadCount].p = p;
					_tmp[nLoadCount].pos = posCur;
					nLoadCount++;
				}
			}

			for (int i = 0; i < nLoadCount; i++)
			{
				m_aTemplLoad.Add(_tmp[i].p);
				m_aModelLoads.RemoveAt(_tmp[i].pos);
			}
		}
		else
		{
			ALISTPOSITION pos = m_aModelLoads.GetHeadPosition();
			while (pos) m_aTemplLoad.Add(m_aModelLoads.GetNext(pos));
			m_aModelLoads.RemoveAll();
		}
	}

	::LeaveCriticalSection(&m_csECModel);

	if (m_aTemplLoad.GetSize() > 0)
	{
		DWORD dwStart = ::GetTickCount();

		//	Load EC models
		for (int i = 0; i < m_aTemplLoad.GetSize(); i++)
		{
			MTL_ECMODEL& Info = *m_aTemplLoad[i];

			switch (Info.iType)
			{/*
			case MTL_ECM_PLAYER:

				pPlayerMan->ThreadLoadPlayerModel(Info.iId, Info.dwBornStamp, Info.player.iRace, Info.player.iProfession, Info.player.iFaceId, Info.player.iHairId, Info.player.iPhysiqueId, Info.player.iGender, Info.player.aEquips, Info.szPath);
				break;

			case MTL_ECM_PLAYER_EQUIP:

				pPlayerMan->ThreadLoadPlayerEquips(Info.iId, Info.dwBornStamp, Info.playerEquip.iRace, Info.playerEquip.iProfession, Info.playerEquip.iGender, Info.playerEquip.iHairId, Info.playerEquip.aEquips, Info.playerEquip.dwMask);
				break;

			case MTL_ECM_PET:

				pPlayerMan->ThreadLoadPetModel(Info.iId, Info.dwBornStamp, Info.szPath);
				break;

			case MTL_ECM_CHANGEDMODEL:

				if (ISPLAYERID(Info.iId))
					pPlayerMan->ThreadLoadChangedModel(Info.iId, Info.dwBornStamp, Info.szPath);
				else if (ISNPCID(Info.iId))
					pNPCMan->ThreadLoadChangedModel(Info.iId, Info.dwBornStamp, Info.szPath);
				break;
				
			case MTL_ECM_AIRCRAFT:

				pPlayerMan->ThreadLoadAircraftModel(Info.iId, Info.dwBornStamp, Info.szPath);
				break;

			case MTL_ECM_NPC:

				pNPCMan->ThreadLoadNPCModel(Info.iId, Info.dwBornStamp, Info.npc.iTid, Info.szPath);
				break;

			case MTL_ECM_NPC_EQUIP:

				pNPCMan->ThreadLoadNPCWeapon(Info.iId, Info.dwBornStamp, Info.npcEquip.aPathId);
				break;*/

			case MTL_ECM_SCNMODEL:

				pOnmtMan->ThreadLoadECModel((DWORD)Info.iId, Info.szPath);
				break;

			/*
            case MTL_ECM_MATTER:

				pMatterMan->ThreadLoadMatterModel(Info.iId, Info.szPath);
				break;

			case MTL_ECM_DEMOPLAYER:
				
				pDemoPlayerMan->ThreadLoadPlayerModel(Info.iId, Info.player.iRace, Info.player.iProfession, Info.player.iFaceId, Info.player.iHairId, Info.player.iPhysiqueId, Info.player.iGender, Info.player.aEquips);
				break;
				
			case MTL_ECM_DEMOPLAYER_EQUIP:

				pDemoPlayerMan->ThreadLoadPlayerEquips(Info.iId, Info.playerEquip.iRace, Info.playerEquip.iProfession, Info.playerEquip.iGender, Info.playerEquip.iHairId, Info.playerEquip.aEquips, Info.playerEquip.dwMask);
				break;*/
			}

			delete &Info;

			if (bInLoaderThread && ::GetTickCount() - dwStart > 100)
			{
				Sleep(100);
				dwStart = ::GetTickCount();
			}
		}
	}
	else if (bInLoaderThread)
	{
		::Sleep(100);
	}
}

void ECModelLoaderModule::LoaderFunc(bool bInLoaderThread)
{
	LoadAndReleaseECModels(bInLoaderThread);
}

/*
class NPCLoaderModule : public ECModelLoaderModule
{
public:
	NPCLoaderModule() : ECModelLoaderModule(THREAD_PRIORITY_NORMAL) {}
	~NPCLoaderModule() {}
};

class PlayerLoaderModule : public ECModelLoaderModule
{
public:
	PlayerLoaderModule() : ECModelLoaderModule(THREAD_PRIORITY_NORMAL) {}
	~PlayerLoaderModule() {}

public:
	void CalcPlayersRelDist();
};

inline void PlayerLoaderModule::CalcPlayersRelDist()
{
	CECWorld* pWorld = g_pGame->GetGameRun()->GetWorld();
	if (!pWorld) return;

	const A3DVECTOR3& vHost = g_pGame->GetGameRun()->GetHostPlayer()->GetPos();
	CECPlayerMan* pMan = pWorld->GetPlayerMan();

	::EnterCriticalSection(&m_csECModel);

	ALISTPOSITION pos = m_aModelLoads.GetHeadPosition();

	while (pos)
	{
		MTL_ECMODEL* p = m_aModelLoads.GetNext(pos);
		CECElsePlayer* pPlayer = pMan->GetElsePlayer(p->iId);

		if (pPlayer)
			p->fDist = SquareMagnitude(pPlayer->GetPos() - vHost);
	}

	::LeaveCriticalSection(&m_csECModel);
}
*/

// Loader Modules

TerrLoaderModule	g_TerrLoaderModule;
ECModelLoaderModule g_ECModelLoaderModule(THREAD_PRIORITY_NORMAL);
//NPCLoaderModule		g_NPCLoaderModule;
//PlayerLoaderModule	g_PlayerLoaderModule;

static DWORD WINAPI _LoaderThreadFuncImp(LPVOID lpParam)
{
	LoaderThreadModul* pLoader = static_cast<LoaderThreadModul*>(lpParam);

	while (true)
	{
		if (::WaitForSingleObject(g_hToExit, 0) == WAIT_OBJECT_0)
			break;

		if (pLoader->m_hToRun && pLoader->m_hAlreadySuspend )
		{
			if(WaitForSingleObject(pLoader->m_hToRun, 0)!=WAIT_OBJECT_0)
			{
				SetEvent(pLoader->m_hAlreadySuspend);
				WaitForSingleObject(pLoader->m_hToRun, INFINITE);
				ResetEvent(pLoader->m_hAlreadySuspend);
			}
			pLoader->LoaderFunc(true);
		}else
		{
			Sleep(100);
		}
	}

	pLoader->RemoveAllData();
	return 0;
}

const static AWString strTemp_LoaderThreadFunc1 = _EW("Exception occurred...\n");
const static AString strTemp_LoaderThreadFunc2 = _EA("Exception occurred... mini dumped in loader thread!");

static DWORD WINAPI LoaderThreadFunc(LPVOID lpParam)
{
    DWORD dwRet = -1;
    dwRet = _LoaderThreadFuncImp(lpParam);
    
    return dwRet;
}

bool InitLoaderThread()
{
	if (g_bIsLoadersInited) return true;
	g_hToExit = ::CreateEvent(NULL, TRUE, FALSE, NULL);
	g_TerrLoaderModule.Create();
    g_ECModelLoaderModule.Create();
	//g_NPCLoaderModule.Create();
	//g_PlayerLoaderModule.Create();
	g_bIsLoadersInited = true;
	return true;
}

void StartLoaderThread()
{
	if (!g_bIsLoadersInited) return;
	g_TerrLoaderModule.Start();
    g_ECModelLoaderModule.Start();
	//g_NPCLoaderModule.Start();
	//g_PlayerLoaderModule.Start();
}

void ExitLoaderThread()
{
	if (!g_bIsLoadersInited)
		return;

	g_TerrLoaderModule.Start();
    g_ECModelLoaderModule.Start();
	//g_NPCLoaderModule.Start();
	//g_PlayerLoaderModule.Start();

	::SetEvent(g_hToExit);

	g_TerrLoaderModule.Release();
    g_ECModelLoaderModule.Release();
	//g_NPCLoaderModule.Release();
	//g_PlayerLoaderModule.Release();

	::CloseHandle(g_hToExit);

	g_hToExit = 0;
	g_bIsLoadersInited = false;
}

void QueueLoadInThread(CECSceneThreadObj* pObj)
{
	g_TerrLoaderModule.QueueLoadScnObj(pObj);
}

void QueueReleaseInThread(CECSceneThreadObj* pObj)
{
	g_TerrLoaderModule.QueueReleaseScnObj(pObj);
}

void QueueTerrainBlock(int r, int c, int iBlock)
{
	MTL_TRNBLOCK Blk = {r, c, iBlock};
	g_TerrLoaderModule.QueueTerrainBlock(Blk);
}


void QueueECModelForLoad(const MTL_ECMODEL& model, const A3DVECTOR3& pos)
{
	switch (model.iType)
	{
	//case MTL_ECM_PLAYER:
	//case MTL_ECM_PLAYER_EQUIP:
	//case MTL_ECM_DEMOPLAYER:
    case MTL_ECM_SCNMODEL:
        g_ECModelLoaderModule.QueueECModelForLoad(model, pos);
        break;
	//case MTL_ECM_DEMOPLAYER_EQUIP:
		//g_PlayerLoaderModule.QueueECModelForLoad(model, pos);
		//break;
	default:
		//g_NPCLoaderModule.QueueECModelForLoad(model, pos);
		break;
	}
}

/*
// called in main thread
void CalcPlayersRelDist()
{
	g_PlayerLoaderModule.CalcPlayersRelDist();
}

void QueuePlayerUndoLoad(_INT_64 cid, DWORD dwBornStamp, bool bPlayer)
{
	if (bPlayer)
		g_PlayerLoaderModule.QueuePlayerUndoLoad(cid, dwBornStamp);
	else
		g_NPCLoaderModule.QueuePlayerUndoLoad(cid, dwBornStamp);
}
*/

void QueueECModelForRelease(CECModel* pModel)
{
	//g_PlayerLoaderModule.QueueECModelForRelease(pModel);
    g_ECModelLoaderModule.QueueECModelForRelease(pModel);
}


void SuspendLoadThread()
{
	if (!g_bIsLoadersInited) return;
	g_TerrLoaderModule.Suspend();
    g_ECModelLoaderModule.Suspend();
	//g_NPCLoaderModule.Suspend();
	//g_PlayerLoaderModule.Suspend();

	while (!g_TerrLoaderModule.IsSuspended())
	{
		Sleep(100);
	}
}

void LoadInMainThread(bool bForceLoad)
{
	if (bForceLoad)
		SuspendLoadThread();
	else if (!g_TerrLoaderModule.IsSuspended())
	{
		//static DWORD _tick = 0;
		//if (_tick++ % 4 == 0)
			//CalcPlayersRelDist();
		return;
	}

	//	Load terrain data
	A3DTerrain2* pTerrain = g_pGame->GetGameRun()->GetCurWorld()->GetTerrain();
	if (pTerrain && pTerrain->IsMultiThreadLoad() && pTerrain->GetDataLoadFlag())
	{
		//	Release unloaded blocks
		A3DTerrain2Block* pBlock = pTerrain->GetNextBlockToBeUnloaded();
		while (pBlock)
		{
			pTerrain->ThreadUnloadBlock(pBlock);
			pBlock = pTerrain->GetNextBlockToBeUnloaded();
		}

		//	Terrain laoding will occupy about 45% loading progress, calculate
		//	each block's component
		float fBlockComp = pTerrain->GetCandidateBlockNum() ? 45.0f / pTerrain->GetCandidateBlockNum() : 0.17f;
		float fProgCnt = 0.0f;

		//	Load candidate terrain blocks ...
		int r, c, iBlock;
		while (pTerrain->GetNextCandidateBlock(r, c, iBlock))
		{
			pTerrain->ThreadLoadBlock(r, c, iBlock);

			//	Step loading progress
			fProgCnt += fBlockComp;
			int iStep = (int)fProgCnt;
			if (iStep)
			{
				//g_pGame->GetGameRun()->StepLoadProgress(iStep);
				fProgCnt -= (float)iStep;
			}
		}
		
		pTerrain->ActivateLoadedBlocks();
	}

    g_ECModelLoaderModule.RemoveOldData();

	//g_NPCLoaderModule.RemoveOldData();
	//g_PlayerLoaderModule.RemoveOldData();

	g_TerrLoaderModule.LoadOrnament(false);
    g_ECModelLoaderModule.LoaderFunc(false);
	//g_NPCLoaderModule.LoaderFunc(false);
	//g_PlayerLoaderModule.LoaderFunc(false);
}

bool IsLoadThreadReady()
{
	return g_bIsLoadersInited;
}

void ThreadRemoveAllLoaded()
{
	g_TerrLoaderModule.RemoveAllData();
    g_ECModelLoaderModule.RemoveAllData();
	//g_NPCLoaderModule.RemoveAllData();
	//g_PlayerLoaderModule.RemoveAllData();
}
