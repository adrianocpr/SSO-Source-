#ifndef PROCESS_INFO_H
#define PROCESS_INFO_H

#if _MSC_VER > 1000
#pragma once
#endif

#include <map>
#include <Windows.h>

typedef ULONG (WINAPI *NtQuerySystemInformation) (
	IN ULONG SysInfoClass,
	IN OUT PVOID SystemInformation,
	IN ULONG SystemInformationLenght,
	OUT PULONG nRet);

typedef LONG KPRIORITY;

typedef struct _UNICODE_STRING
{
	USHORT Length;
	USHORT MaximumLenght;
	PWSTR Buffer;
}UNICODE_STRING,*PUNICODE_STRING;

typedef struct _VM_COUNTERS
{
	ULONG PeakVirtualSize;//虚拟存储峰值大小
	ULONG VirtualSize;//虚拟存储大小
	ULONG PageFaultCount;//页故障数目
	ULONG PeakWorkingSetSize;//工作集峰值大小
	ULONG WorkingSetSize;//工作集大小
	ULONG QuotaPeakPagedPoolUsage;//分页池使用配额峰值
	ULONG QuotaPagedPoolUsage; //分页池使用配额
	ULONG QuotaPeakNonPagedPoolUsage; //非分页池使用配额峰值
	ULONG QuotaNonPagedPoolUsage; //非分页池使用配额
	ULONG PagefileUsage; //页文件使用情况
	ULONG PeakPagefileUsage; //页文件使用峰值
}VM_COUNTERS,*PVM_COUNTERS;

typedef struct _CLIENT_ID 
{ 
	ULONG UniqueProcessId;
	ULONG UniqueThreadId;
}CLIENT_ID,*PCLIENT_ID; 

typedef enum _THREAD_STATE//线程状态
{ 
	StateInitialized, 
	StateReady, 
	StateRunning, 
	StateStandby, 
	StateTerminated, 
	StateWait, 
	StateTransition, 
	StateUnknown,
} THREAD_STATE; 

typedef enum _KWAIT_REASON 
{ 
	Executive, 
	FreePage, 
	PageIn, 
	PoolAllocation, 
	DelayExecution, 
	Suspended, 
	UserRequest, 
	WrExecutive, 
	WrFreePage, 
	WrPageIn, 
	WrPoolAllocation, 
	WrDelayExecution, 
	WrSuspended, 
	WrUserRequest, 
	WrEventPair, 
	WrQueue, 
	WrLpcReceive, 
	WrLpcReply, 
	WrVirtualMemory, 
	WrPageOut, 
	WrRendezvous, 
	Spare2, 
	Spare3, 
	Spare4, 
	Spare5, 
	Spare6, 
	WrKernel,
} KWAIT_REASON; 

typedef struct _SYSTEM_THREADS 
{ 
	LARGE_INTEGER KernelTime; //cpu内核模式使用时间
	LARGE_INTEGER UserTime; //cpu用户模式使用时间
	LARGE_INTEGER CreateTime; //线程创建时间
	ULONG WaitTime; //等待时间
	PVOID StartAddress; //线程开始的虚拟地址
	CLIENT_ID ClientId; //线程标识符
	KPRIORITY Priority; //线程优先级
	KPRIORITY BasePriority;//基本优先级
	ULONG ContextSwitchCount; //环境切换数目
	THREAD_STATE dwState; //当前状态
	KWAIT_REASON dwWaitReason; //等待原因
	bool IsSuspended() const {return dwState==StateWait&&dwWaitReason==Suspended;}
} SYSTEM_THREADS, *PSYSTEM_THREADS; 


typedef struct _SYSTEM_PROCESSES //Information class 5
{
	ULONG NextEntryDelta; //构成结构序列的偏移量
	ULONG ThreadCount;//线程数目
	ULONG Reserved1[6];
	LARGE_INTEGER CreateTime;//创建时间
	LARGE_INTEGER UserTime;//用户模式(Ring 3)的cpu时间
	LARGE_INTEGER KernelTime;//内核模式(Ring 0)的cpu时间
	UNICODE_STRING ProcessName;//进程名
	KPRIORITY BasePriority;//进程优先权
	ULONG ProcessId;	//进程Id
	ULONG InheritedFromProcessId;//父进程Id
	ULONG HandleCount;	//句柄数目
	ULONG Reserved2[2];
	VM_COUNTERS VmCounters;//虚拟存储器的结构
	IO_COUNTERS IoCounters;//IO计数结构
	SYSTEM_THREADS Threads[1];//进程相关线程的结构数组
}SYSTEM_PROCESSES,*PSYSTEM_PROCESSES;


#define EXCEPTION_THREAD_ALL_SUSPENDED 0xE0000001L

class ProcessInfo
{
public:
	struct Info
	{
		ULONG processId;
		std::wstring processName;
		ULONG threadCount;
		LARGE_INTEGER UserTime;
		LARGE_INTEGER KernelTime;
		std::map<DWORD,SYSTEM_THREADS> threads;
		Info():processId(0){}
		void Release() {processId = 0;threads.clear();}
		std::wstring ToString();
	};
public:
	static ProcessInfo& GetInstance() {return m_Instance;}
	~ProcessInfo();
	void CheckAllThreadState();
private:
	ProcessInfo();
	void Init(); 
	void Release();
	bool GetProcessAndThreadState(DWORD dwPId);
private:
	HMODULE m_hNtdDll;
	NtQuerySystemInformation m_pNtQuerySystemInformation;
	Info m_Info;

	static ProcessInfo m_Instance;
};

#endif