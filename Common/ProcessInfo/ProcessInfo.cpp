#include "Stdafx.h"
#include "ProcessInfo.h"

#include <TlHelp32.h>
#include <process.h>
#include "EC_CrashHandler.h"

#include "Log\log.h"
//////////////////////////////////////////////////////////////////////////
//macro
#define STATUS_SUCCESS ((NTSTATUS)0x00000000L) 
#define STATUS_INFO_LENGTH_MISMATCH  ((NTSTATUS)0xC0000004L) 
#define SYSTEM_PROCESS_AND_THREAD_INFORMATION 5
#define MAX_INFO_BUF_LEN 0x500000

//////////////////////////////////////////////////////////////////////////
//namespace func
namespace
{
	std::wstring GetTimeDes(LONGLONG _time)
	{
		wchar_t buf[255];
		LONGLONG lltime = _time/10000;
		int hour = int(lltime/(3600000));
		lltime = lltime%(3600000);
		int min = int(lltime/(60000));
		lltime = lltime%60000;
		int sec = int(lltime/1000);
		int msec = int(lltime%1000);
		wsprintf(buf,L"%d:%.2d:%.2d:%.3d",hour,min,sec,msec);
		return buf;
	}
}

//////////////////////////////////////////////////////////////////////////
ProcessInfo ProcessInfo::m_Instance;


//////////////////////////////////////////////////////////////////////////
//con and decons
ProcessInfo::ProcessInfo():m_hNtdDll(NULL),m_pNtQuerySystemInformation(NULL)
{
	this->Init();
}
ProcessInfo::~ProcessInfo()
{
	this->Release();
}
//////////////////////////////////////////////////////////////////////////
//impl.
void ProcessInfo::Init()
{
	m_hNtdDll = LoadLibrary(L"ntdll.dll");
	if(NULL!=m_hNtdDll)
		m_pNtQuerySystemInformation = (NtQuerySystemInformation)GetProcAddress(m_hNtdDll,
		"NtQuerySystemInformation");
}

void ProcessInfo::Release()
{
	m_Info.Release();
	if(m_hNtdDll!=NULL)
	{
		FreeLibrary(m_hNtdDll);
		m_hNtdDll = NULL;
	}
	m_pNtQuerySystemInformation = NULL;
}

bool ProcessInfo::GetProcessAndThreadState(DWORD dwPId)
{
	if(m_pNtQuerySystemInformation == NULL)
		return false;
	
	ULONG status;
	LPVOID lpSystemInfo = NULL;
	DWORD dwNumberBytes = sizeof(SYSTEM_PROCESSES)*0x100;//这个值最多能放下256个进程
	//分配空间获取系统进程信息，如果该空间不够每次*2
	do
	{
		if(lpSystemInfo!=NULL)
			free(lpSystemInfo);
		lpSystemInfo = (LPVOID)malloc(dwNumberBytes);
		status = m_pNtQuerySystemInformation(SYSTEM_PROCESS_AND_THREAD_INFORMATION,lpSystemInfo,
			dwNumberBytes,NULL);
		if(status == STATUS_SUCCESS)
			break;
		dwNumberBytes *= 2;
	}while(dwNumberBytes<=MAX_INFO_BUF_LEN&&status==STATUS_INFO_LENGTH_MISMATCH);

	if(status == STATUS_SUCCESS&&lpSystemInfo!=NULL)
	{
		PSYSTEM_PROCESSES pSystemProc = (PSYSTEM_PROCESSES)lpSystemInfo;
		bool bFinished = false;
		while(!bFinished)
		{
			if(pSystemProc->ProcessId == dwPId)
			{
				if(m_Info.processId == 0)
				{
					m_Info.processId = dwPId;
					m_Info.processName = pSystemProc->ProcessName.Buffer;
				}
				m_Info.KernelTime = pSystemProc->KernelTime;
				m_Info.UserTime = pSystemProc->UserTime;
				//LOG_THREAD(L"%s run cpu time : %s\n",
				//	pSystemProc->ProcessName.Buffer,GetTimeDes(pSystemProc->KernelTime.QuadPart
				//	+pSystemProc->UserTime.QuadPart).c_str());
				for(ULONG ulIndex = 0;ulIndex<pSystemProc->ThreadCount;++ulIndex)
				{
					PSYSTEM_THREADS pThread = &pSystemProc->Threads[ulIndex];
					DWORD tid = pThread->ClientId.UniqueThreadId;
					/*
					if(m_Info.threads.find(tid)!=m_Info.threads.end())
					{
						PSYSTEM_THREADS pOld = &m_Info.threads[tid];
						if(pOld->IsSuspended()!=pThread->IsSuspended())
						{
							LOG_THREAD(L"TId[%d] cpu time: %s , %s\n",tid,
								GetTimeDes(pThread->KernelTime.QuadPart+pThread->UserTime.QuadPart).c_str(),
								pThread->IsSuspended()?L"suspended":L"run");	
						}
					}
					else
					{
						LOG_THREAD(L"TId[%d] : %s\n",tid,
							pThread->IsSuspended()?L"suspended":L"run");
					}
					*/
					m_Info.threads[tid] = *pThread;
				}
				break;
			}
			bFinished = pSystemProc->NextEntryDelta == 0;
			if(!bFinished)
				pSystemProc = (PSYSTEM_PROCESSES)((PCHAR)pSystemProc+pSystemProc->NextEntryDelta);
		}
	}

	if(lpSystemInfo!=NULL)
		free(lpSystemInfo);
	return true;
}



bool while_true_flag = false;
namespace
{
	DWORD message_cool_down			= 0;
	int	  un_handle_num				= 0;
}
void ProcessInfo::CheckAllThreadState()
{
#ifndef _DEBUG
	DWORD tick_count = GetTickCount();
	if (0 == message_cool_down)
	{		
		while_true_flag = false;
		BOOL bRet = PostMessage(glb_GetMainHWnd(), WM_WHILE_TRUE, 0, 0);
		if (bRet)
		{
			message_cool_down = tick_count;			
		}
	}
	else
	{
		if (tick_count - message_cool_down > 5000)
		{
			if (while_true_flag)
			{
				un_handle_num = 0;
			}
			else
			{
				un_handle_num++; 
			}
			message_cool_down = 0;
		}
	}
	if (un_handle_num > 20 && !glb_IsConsoleEnable())
	{
		a_LogOutput(1,"Exception occurred... mini dumped for endless loop");
		EXCEPTION_POINTERS* pExceptionPtrs = NULL;
		CECCrashHandler::GetExceptionPointers(0, &pExceptionPtrs);
		glb_HandleException(pExceptionPtrs);
		TerminateProcess(GetCurrentProcess(), 1);
	}
#endif
	
	DWORD currentProcessId = GetCurrentProcessId();
	DWORD currentThreadId = GetCurrentThreadId();
	if(this->GetProcessAndThreadState(currentProcessId))
	{
		bool isAllOtherThreadSuspend = true;
		std::map<DWORD,SYSTEM_THREADS>::iterator it = m_Info.threads.begin(),ite = m_Info.threads.end();
		for(;it!=ite;++it)
		{
			if(it->first != currentThreadId)
			{
				PSYSTEM_THREADS pThread = &it->second;
				if(!pThread->IsSuspended())
				{
					isAllOtherThreadSuspend = false;
					break;
				}
			}
		}
		if(isAllOtherThreadSuspend)
		{
			RaiseException(EXCEPTION_THREAD_ALL_SUSPENDED,EXCEPTION_NONCONTINUABLE,0,NULL);
		}
	}
}