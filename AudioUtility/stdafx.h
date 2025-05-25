// stdafx.h : include file for standard system include files,
// or project specific include files that are used frequently, but
// are changed infrequently
//

#pragma once

#ifndef _WIN32_WINNT		// Allow use of features specific to Windows XP or later.                   
#define _WIN32_WINNT 0x0501	// Change this to the appropriate value to target other versions of Windows.
#endif						

#define WIN32_LEAN_AND_MEAN		// Exclude rarely-used stuff from Windows headers




// TODO: reference additional headers your program requires here
//  VC的STL库使用, 会保证STL不会越界修改容器
//  _SECURE_SCL为1, 标志Checked Iterators开启
// _SECURE_SCL_THROWS为1, 标志如果出现这样的错误, 就抛出一个异常
#define _SECURE_SCL  1
#define _SECURE_SCL_THROWS  1