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
	ULONG PeakVirtualSize;//����洢��ֵ��С
	ULONG VirtualSize;//����洢��С
	ULONG PageFaultCount;//ҳ������Ŀ
	ULONG PeakWorkingSetSize;//��������ֵ��С
	ULONG WorkingSetSize;//��������С
	ULONG QuotaPeakPagedPoolUsage;//��ҳ��ʹ������ֵ
	ULONG QuotaPagedPoolUsage; //��ҳ��ʹ�����
	ULONG QuotaPeakNonPagedPoolUsage; //�Ƿ�ҳ��ʹ������ֵ
	ULONG QuotaNonPagedPoolUsage; //�Ƿ�ҳ��ʹ�����
	ULONG PagefileUsage; //ҳ�ļ�ʹ�����
	ULONG PeakPagefileUsage; //ҳ�ļ�ʹ�÷�ֵ
}VM_COUNTERS,*PVM_COUNTERS;

typedef struct _CLIENT_ID 
{ 
	ULONG UniqueProcessId;
	ULONG UniqueThreadId;
}CLIENT_ID,*PCLIENT_ID; 

typedef enum _THREAD_STATE//�߳�״̬
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
	LARGE_INTEGER KernelTime; //cpu�ں�ģʽʹ��ʱ��
	LARGE_INTEGER UserTime; //cpu�û�ģʽʹ��ʱ��
	LARGE_INTEGER CreateTime; //�̴߳���ʱ��
	ULONG WaitTime; //�ȴ�ʱ��
	PVOID StartAddress; //�߳̿�ʼ�������ַ
	CLIENT_ID ClientId; //�̱߳�ʶ��
	KPRIORITY Priority; //�߳����ȼ�
	KPRIORITY BasePriority;//�������ȼ�
	ULONG ContextSwitchCount; //�����л���Ŀ
	THREAD_STATE dwState; //��ǰ״̬
	KWAIT_REASON dwWaitReason; //�ȴ�ԭ��
	bool IsSuspended() const {return dwState==StateWait&&dwWaitReason==Suspended;}
} SYSTEM_THREADS, *PSYSTEM_THREADS; 


typedef struct _SYSTEM_PROCESSES //Information class 5
{
	ULONG NextEntryDelta; //���ɽṹ���е�ƫ����
	ULONG ThreadCount;//�߳���Ŀ
	ULONG Reserved1[6];
	LARGE_INTEGER CreateTime;//����ʱ��
	LARGE_INTEGER UserTime;//�û�ģʽ(Ring 3)��cpuʱ��
	LARGE_INTEGER KernelTime;//�ں�ģʽ(Ring 0)��cpuʱ��
	UNICODE_STRING ProcessName;//������
	KPRIORITY BasePriority;//��������Ȩ
	ULONG ProcessId;	//����Id
	ULONG InheritedFromProcessId;//������Id
	ULONG HandleCount;	//�����Ŀ
	ULONG Reserved2[2];
	VM_COUNTERS VmCounters;//����洢���Ľṹ
	IO_COUNTERS IoCounters;//IO�����ṹ
	SYSTEM_THREADS Threads[1];//��������̵߳Ľṹ����
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