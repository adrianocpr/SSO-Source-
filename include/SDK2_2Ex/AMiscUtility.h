/********************************************************************
	created:	2013.1.31
	author:		liudong
	
	purpose:   ºê
	Copyright (C) All Rights Reserved
*********************************************************************/
#pragma once

#define DECLARE_SINGLETON(CLASS_NAME) \
private:\
	CLASS_NAME();\
	CLASS_NAME(const CLASS_NAME& rhs);\
	CLASS_NAME& operator=(const CLASS_NAME& rhs);

#define DECLARE_UNCOPYABLE(classname) \
private: \
	classname(const classname&); \
	classname& operator=(const classname&);