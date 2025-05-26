/*
 * FILE: EC_STRHEADER.H
 *
 * DESCRIPTION: 字符串的一些定义
 *
 * CREATED BY: hanwei, 2013/3/7
 *
 * HISTORY:
 *
 * Copyright (c) 2010 Hummingbird Studio, All Rights Reserved.
 */

#pragma	once

#define _EA(a)   LPCSTR(a)	
#define _EW(a)   LPCWSTR(L##a)

#ifdef UNICODE
	#define _ET _EW	
#else
	#define _ET _EA 
#endif


