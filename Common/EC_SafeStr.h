/*
 * FILE: EC_SaftStr.h
 *
 * DESCRIPTION: 安全字符串操作
 *
 * CREATED BY: hanwei, 2010/6/3
 *
 * HISTORY: 
 *
 * Copyright (c) 2005 Archosaur Studio, All Rights Reserved.
 */

#pragma	once
#include "strsafe.h"



// 代替: a_strcat
#define a_StringCchCat       StringCchCat
#define a_StringCchCatEx     StringCchCatEx
#define a_StringCbCat        StringCbCat
#define a_StringCbCatEx      StringCbCatEx


// 代替: a_strcpy
#define a_StringCchCopy      StringCchCopy
#define a_StringCchCopyEx    StringCchCopyEx
#define a_StringCbCopy       StringCbCopy
#define a_StringCbCopyEx     StringCbCopyEx


// 代替: a_strlen
#define a_StringCchLength    StringCchLength
#define a_StringCbLength     StringCchLength


// 代替: a_vsprintf
#define a_StringCchPrintf    StringCchPrintf
#define a_StringCchPrintfEx  StringCchPrintfEx
#define a_StringCbPrintf     StringCbPrintf
#define a_StringCbPrintfEx   StringCbPrintfEx


// 代替: a_vsprintf
#define a_StringCchVPrintf    StringCchVPrintf
#define a_StringCchVPrintfEx  StringCchVPrintfEx
#define a_StringCbVPrintf     StringCbVPrintf
#define a_StringCbVPrintfEx   StringCbVPrintfEx


