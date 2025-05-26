#ifndef _MEDIA_PLAYER_EXP_H_
#define _MEDIA_PLAYER_EXP_H_

#if defined(MEDIA_PLAYER_STATIC_LIB)
	#define _MediaPlayer_Export
#else
	#if defined(MEDIA_PLAYER)
		#define _MediaPlayer_Export	__declspec(dllexport)
	#else
		#define _MediaPlayer_Export	__declspec(dllimport)
	#endif
#endif

#endif