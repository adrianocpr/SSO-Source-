#pragma once


enum LOGTYPE
{
	LOG_INFO,
	LOG_ERROR,
	LOG_WARNING,
	LOG_SUCCESS
};

struct NmdConfig
{
	char szGamePath[MAX_PATH];
	char szOutputFile[MAX_PATH];
	bool bFromPck;
};

extern NmdConfig g_Config;

typedef void (*LogFunc)(LOGTYPE logType, const char* szLog);

bool ExportNMD(LogFunc pFunc);