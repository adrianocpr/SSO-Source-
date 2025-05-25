#pragma once

#ifdef _AUDIO_UTILITY_DLL_
#define _UTILITY_EXPORT_DLL_ __declspec(dllexport)
#else
#define _UTILITY_EXPORT_DLL_
#endif

#pragma warning (disable: 4251)
#pragma warning (disable: 4275)
