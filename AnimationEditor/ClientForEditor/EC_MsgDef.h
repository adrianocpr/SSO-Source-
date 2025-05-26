/*
 * FILE: EC_MsgDef.h
 *
 * DESCRIPTION: 
 *
 * CREATED BY: Duyuxin, 2004/8/30
 *
 * HISTORY: 
 *
 * Copyright (c) 2004 Archosaur Studio, All Rights Reserved.
 */

#pragma once
#include "EC_ID64.h"

///////////////////////////////////////////////////////////////////////////
//	
//	Define and Macro
//	
///////////////////////////////////////////////////////////////////////////

//	Messages to gamerun
#define MSG_EXITGAME			100		//	Exit game. p1 - exit code
#define MSG_SERVERTIME			102		//	Server time

//	Messages to host player
#define MSG_GST_MOVE			200		//	Ghost move. p1 - move dir (0 - 7)
#define MSG_GST_PITCH			201		//	Ghost pitch, p1 - degree
#define MSG_GST_YAW				202		//	Ghost yaw, p1 - degree
#define MSG_GST_MOVEABSUP		203		//	Ghost move absolute up, p1 - 1: up, 0: down

#define MSG_HST_CAMERAMODE		220		//	Host camera mode. p1 - camera mode
#define MSG_HST_PUSHMOVE		221		//	Host player is pushed to move, p1 - move dir (0 - 7)
#define MSG_HST_PITCH			222		//	Host camera pitch, p1 - degree; p2 - turn player flag
#define MSG_HST_YAW				223		//	Host camera yaw, p1 - degree; p2 - turn player flag
#define MSG_HST_LBTNCLICK		224		//	Left button click, p1 - x; p2 - y; p3 - SHIFT, ALT, CTRL key states; p4 - double click flag
#define MSG_HST_TURNCAM			225		//	Begin or end turning host's camera, p1 - 1: begin, 0: end. p2 - 1: left button, 0: right button
#define MSG_HST_WHEELCAM		226		//	Move camera using mouse's wheel button
#define MSG_HST_CAMDEFAULT		227		//	Retrieve system default camera state
#define MSG_HST_CAMPRESET		228		//	Retrieve system pre-defined camera state
#define MSG_HST_CAMUSERGET		229		//	Retrieve user defined camera state, p1 - channel
#define MSG_HST_CAMUSERSET		230		//	Store user defined camera state, p1 - channel
#define MSG_HST_FIXCAMERA		245		//	Fix camera
#define MSG_HST_RBTNCLICK		248		//	Left button click, p1 - x; p2 - y; p2 - y; p3 - SHIFT, ALT, CTRL key states
#define MSG_HST_PRESSCANCEL		285		//	User press cancel button
#define MSG_HST_JUMP			289		//	Test code. jump
#define MSG_HST_PLAYTRICK		293		//	Play trick action
#define MSG_HST_AUTOSELECT		325		//	Auto select monster
#define	MSG_HST_MOVE_RECORD		326		//	Host move record
#define	MSG_HST_TRACE_RECORD	327		//	Host trace record
#define MSG_HST_FOLLOW_RECORD	328		//	Host follow record
#define MSG_HST_WALK_RECORED	329		//	Host walk run record
#define MSG_HST_PUSH_RECORD		330		//	Host push record
#define MSG_HST_SELF_ACTION  	336		//	self action
#define MSG_HST_ASSIST          337     //  select other player's target.
#define MSG_HST_NEAREST_NPC		338		//	Auto select nearest server npc

//	Messages to handle input
#define MSG_HST_EXECUTE_SC		701
#define MSG_HST_SEL_TM			702

///////////////////////////////////////////////////////////////////////////
//	
//	Types and Global variables
//	
///////////////////////////////////////////////////////////////////////////
typedef unsigned long		DWORD;		//	32-bit;

//	Message struct
struct ECMSG
{
	ECMSG()
	{
		dwMsg	= 0;		
		iManager= 0;	
		iSubID	= 0;		
		dwParam1= 0;	
		dwParam2= 0;	
		dwParam3= 0;	
		dwParam4= 0;	
		param64	= (__int64)0;
	}

	DWORD	dwMsg;			//	Message code
	int		iManager;		//	Receiver manager's ID
	int		iSubID;			//	Sub ID
	int		dwParam1;		//	Parameter 1
	int		dwParam2;		//	Parameter 2
	int		dwParam3;		//	Parameter 3
	int		dwParam4;		//	Parameter 4
	_INT_64 param64;
};

