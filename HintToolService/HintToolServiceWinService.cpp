// HintToolService.cpp : main Windows Service project file.

#include "stdafx.h"
#include <string.h>
#include "HintToolServiceWinService.h"
#include <winuser.h>
#include <Tlhelp32.h>


static const TCHAR* l_szSDSHintTool = _T("SDSHintTool.exe");
static DWORD WINAPI CheckHintToolThread(LPVOID pArg);

using namespace HintToolService;
using namespace System::Text;
using namespace System::Security::Policy;
using namespace System::Reflection;

//To install/uninstall the service, type: "HintToolService.exe -Install [-u]"
int _tmain(int argc, _TCHAR* argv[])
{
	if (argc >= 2)
	{
		if (argv[1][0] == _T('/'))
		{
			argv[1][0] = _T('-');
		}

		if (_tcsicmp(argv[1], _T("-Install")) == 0)
		{
			array<String^>^ myargs = System::Environment::GetCommandLineArgs();
			array<String^>^ args = gcnew array<String^>(myargs->Length - 1);

			// Set args[0] with the full path to the assembly,
			Assembly^ assem = Assembly::GetExecutingAssembly();
			args[0] = assem->Location;

			Array::Copy(myargs, 2, args, 1, args->Length - 1);
			AppDomain^ dom = AppDomain::CreateDomain(L"execDom");
			Type^ type = System::Object::typeid;
			String^ path = type->Assembly->Location;
			StringBuilder^ sb = gcnew StringBuilder(path->Substring(0, path->LastIndexOf(L"\\")));
			sb->Append(L"\\InstallUtil.exe");
			Evidence^ evidence = gcnew Evidence();
			dom->ExecuteAssembly(sb->ToString(), evidence, args);
		}
	}
	else
	{
		ServiceBase::Run(gcnew HintToolServiceWinService());
	}
}


void HintToolServiceWinService::_StartCheckHintTool()
{
	if (m_CheckHintToolThread)
	{
		TerminateThread(m_CheckHintToolThread, 0);
		CloseHandle(m_CheckHintToolThread);
		m_CheckHintToolThread = NULL;
	}
	DWORD dwThreadID;
	m_CheckHintToolThread = ::CreateThread(NULL, 0, CheckHintToolThread, NULL, 0, &dwThreadID);
}

void HintToolServiceWinService::_EndCheckHintTool()
{
	if (m_CheckHintToolThread)
	{
		TerminateThread(m_CheckHintToolThread, 0);
		CloseHandle(m_CheckHintToolThread);
		m_CheckHintToolThread = NULL;
	}
}

int GetProcessCount(const TCHAR* szExeName);

DWORD WINAPI CheckHintToolThread(LPVOID pArg)
{
	STARTUPINFO si;
	PROCESS_INFORMATION pi;
	ZeroMemory( &si, sizeof(si) );
	si.cb = sizeof(si);
	ZeroMemory( &pi, sizeof(pi) );
	do 
	{
		Sleep(1000);
		if (pi.hProcess == NULL || GetProcessCount(l_szSDSHintTool) <= 0)
		{
			ZeroMemory( &si, sizeof(si) );
			si.cb = sizeof(si);
			ZeroMemory( &pi, sizeof(pi) );
			TCHAR szFilePath[MAX_PATH + 1];
			GetModuleFileName(NULL,szFilePath,MAX_PATH);
			(_tcsrchr(szFilePath,_T('\\')))[0] = 0;
			TCHAR szFileName[MAX_PATH + 1];
			_tcscpy(szFileName,szFilePath);
			_tcscat(szFileName,_T("\\"));
			_tcscat(szFileName,l_szSDSHintTool);
			if (!CreateProcess(szFileName, NULL, NULL, NULL, FALSE, NULL, NULL, szFilePath, &si, &pi))
			{

			}
			else
			{

			}


		}
	} while (true);

	return 0;
}

int GetProcessCount(const TCHAR* szExeName)
{
	TCHAR sztarget[MAX_PATH];
	lstrcpy(sztarget, szExeName);

	int count = 0;
	PROCESSENTRY32 my;
	HANDLE l = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
	if (((int)l) != -1)
	{
		my.dwSize = sizeof(my);
		if (Process32First(l, &my))
		{
			do
			{
				if (lstrcmp(sztarget, my.szExeFile) == 0)
				{
					count++;
				}
			}while (Process32Next(l, &my));
		}
		CloseHandle(l);
	}

	return count;
}

