#pragma once

#include <AString.h>


//	Multi-thread loaded EC model type
enum
{
	MTL_ECM_PLAYER = 0,
	MTL_ECM_NPC,
	MTL_ECM_MATTER,
	MTL_ECM_SCNMODEL,		//	EC model in scene
	MTL_ECM_PLAYER_EQUIP,
	MTL_ECM_NPC_EQUIP,
	MTL_ECM_PET,
	MTL_ECM_CHANGEDMODEL,
	MTL_ECM_AIRCRAFT,
	MTL_ECM_DEMOPLAYER,
	MTL_ECM_DEMOPLAYER_EQUIP,
};

/*
struct  MtlEcmPlayer 
{
	int     iRace;
	int		iProfession;
	int     iFaceId;
	int		iHairId;
	int		iPhysiqueId;
	int     iGender;
	int     aEquips[SIZE_EQUIPIVTR];
};


struct MtlEcmNpc
{
	int     iTid;
};

struct MtlEcmDummy
{

};

struct MtlEcmPlayerEquip 
{
	int iRace;
	int iProfession;
	int iGender;
	int iHairId;
	DWORD dwMask;
	int   aEquips[SIZE_EQUIPIVTR];
};

struct MtlEcmNpcEquip
{
	int    aPathId[2];
};
*/

//	Multi-thread loaded EC model info
struct MTL_ECMODEL
{
	int		iType;		//	MTL_ECM_xxx
	_INT_64	iId;	//	Object ID
	float	fDist;
	AString szPath; 
	DWORD   dwBornStamp;
    /*
	union
	{
		MtlEcmPlayer		player;
		MtlEcmNpc           npc;
		MtlEcmPlayerEquip   playerEquip;
		MtlEcmNpcEquip      npcEquip;
		MtlEcmDummy         dummy;
	};*/
	MTL_ECMODEL()
	{
		dwBornStamp = 0;
	}
	MTL_ECMODEL(const MTL_ECMODEL& val)
		:iType(val.iType), iId(val.iId), fDist(val.fDist), szPath(val.szPath), dwBornStamp(val.dwBornStamp)
	{/*
		int i;
		switch(val.iType)
		{
		case MTL_ECM_PLAYER:
		case MTL_ECM_DEMOPLAYER:
			player.iRace = val.player.iRace;
			player.iProfession = val.player.iProfession;
			player.iFaceId = val.player.iFaceId;
			player.iHairId = val.player.iHairId;
			player.iGender = val.player.iGender;
			player.iPhysiqueId = val.player.iPhysiqueId;
			for (i = 0; i < SIZE_EQUIPIVTR; ++i)
			{
				player.aEquips[i] = val.player.aEquips[i];
			}
		    break;
		case MTL_ECM_NPC:
			npc.iTid = val.npc.iTid;
			break;
		case MTL_ECM_PLAYER_EQUIP:
		case MTL_ECM_DEMOPLAYER_EQUIP:
			playerEquip.dwMask = val.playerEquip.dwMask;
			playerEquip.iGender = val.playerEquip.iGender;
			playerEquip.iHairId = val.playerEquip.iHairId;
			playerEquip.iRace   = val.playerEquip.iRace;
			playerEquip.iProfession = val.playerEquip.iProfession;;
			for (i = 0; i < SIZE_EQUIPIVTR; ++i)
			{
				playerEquip.aEquips[i] = val.playerEquip.aEquips[i];
			}
			break;
		case MTL_ECM_NPC_EQUIP:
			for (i = 0; i < 2; ++i)
			{
				npcEquip.aPathId[i] = val.npcEquip.aPathId[i];
			}
			break;
		}*/
	}
};

class CECSceneThreadObj;
class CECModel;

bool InitLoaderThread();
void StartLoaderThread();
void ExitLoaderThread();

void QueueLoadInThread(CECSceneThreadObj* pObj);
void QueueReleaseInThread(CECSceneThreadObj* pObj);
void QueueTerrainBlock(int r, int c, int iBlock);
void QueueECModelForLoad(const MTL_ECMODEL& model, const A3DVECTOR3& pos);
void QueueECModelForRelease(CECModel* pModel);
//void QueuePlayerUndoLoad(_INT_64 cid, DWORD dwBornStamp, bool bPlayer = false);

void SuspendLoadThread();
void LoadInMainThread(bool bForceLoad);
void ThreadRemoveAllLoaded();

bool IsLoadThreadReady();
