// SVNOperation.cpp: implementation of the CSVNOperation class.
//
//////////////////////////////////////////////////////////////////////
#include "Stdafx.h"
#include <afx.h>
#include <Afxwin.h>
#include <Shlwapi.h>
#include "SVNOperation.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CString GetLine(const CString& cStr, int& nPos)
{
	CString csReturn;
	int nNext = cStr.Find(_T('\n'), nPos + 1);
	if (nNext == -1)
	{
		csReturn = cStr.Right(cStr.GetLength() - nPos-1);
	}
	else
	{
		csReturn = cStr.Mid(nPos+1, nNext - nPos -1);
	}	
	nPos = nNext;
	return csReturn;
}

CSVNOperation::CSVNOperation()
{
	m_bInit = false;
	m_bConsoleEnabled = false;
	m_pLogFunc = NULL;
}

CSVNOperation::~CSVNOperation()
{
	if(m_bConsoleEnabled)
	{
		FreeConsole();
	}
}

CString CSVNOperation::GetSVNPath()
{
	static TCHAR strNull[2] = _T("");
	static TCHAR strPath[MAX_PATH];
	DWORD dwType;
	DWORD dwSize = MAX_PATH;
	HKEY  hKey;

	const TCHAR * SVN_path[] = 
	{
		_T("Software\\CollabNet\\Subversion\\1.7.2\\Client\\"),
		_T("Software\\CollabNet\\Subversion\\1.7.2\\Server\\"),
		_T("SOFTWARE\\TortoiseSVN\\"),
		NULL
	};

	int i = 0;
	LONG lResult;
	while (SVN_path[i])
	{
		lResult = RegOpenKeyEx( HKEY_LOCAL_MACHINE, SVN_path[i],0, KEY_READ, &hKey );
		if (lResult == ERROR_SUCCESS)
		{
			break;
		}
		++i;
	}

	if (lResult != ERROR_SUCCESS)
	{
		return strNull;
	}

	CString path;

	lResult = RegQueryValueEx( hKey, _T("Install Location"), NULL,
		&dwType, (BYTE*)strPath, &dwSize );
	if( ERROR_SUCCESS == lResult )
	{
		path = strPath;
	}
	else
	{
		lResult = RegQueryValueEx( hKey, _T("Directory"), NULL,
			&dwType, (BYTE*)strPath, &dwSize );

		if( ERROR_SUCCESS == lResult )
		{
			path = strPath;
			path += _T("bin\\");
		}
	}

	RegCloseKey( hKey );

	if( ERROR_SUCCESS != lResult )
		return strNull;

	return path;
}

void CSVNOperation::InitConsole()
{
	if(!m_bConsoleEnabled)
	{
		AllocConsole();
		m_bConsoleEnabled = true;
	}
}

inline bool _FileExists(LPCTSTR szPath)
{
	DWORD attr = GetFileAttributes(szPath);

	return attr != INVALID_FILE_ATTRIBUTES && !(attr & FILE_ATTRIBUTE_DIRECTORY);
}

void CSVNOperation::InitSVN(CMDLOGFUNC* pLogFunc,bool bClose)
{
	if(bClose)
	{
		m_bInit = false;
		return;
	}

	CString path = GetSVNPath();
	if(path.IsEmpty())
	{
		AfxMessageBox(_T("没有安装 svn 命令行工具！"));
		m_bInit = false;
		exit(0);
	}
	m_csSVNPath = path + _T("\\svn");

	CString svnExePath = m_csSVNPath + _T(".exe");
	if(!_FileExists(svnExePath))
	{
		AfxMessageBox(_T("没有安装 svn 命令行工具！"));
		m_bInit = false;
		exit(0);
	}
	
	m_bInit = true;
	m_pLogFunc = pLogFunc;

	if(!CheckSVNVersion(_T("1.7.2")))
	{
		AfxMessageBox(_T("svn 命令行工具的版本过低，需要1.7.2以上"));
		m_bInit = false;
		exit(0);
	}
	
	HKEY hKey;
	RegCreateKey(HKEY_CURRENT_USER, _T("Software\\Tigris.org\\Subversion\\Config\\miscellany"), &hKey);
	CString strValue = _T("yes");
	RegSetValueEx(hKey, _T("enable-auto-props"), 0, REG_SZ ,(const unsigned char *)strValue.GetBuffer(0), (DWORD)_tcslen(_T("yes")));
	RegCreateKey(HKEY_CURRENT_USER, _T("Software\\Tigris.org\\Subversion\\Config\\auto-props"), &hKey);
	strValue = _T("svn:needs-lock = *");
	RegSetValueEx(hKey, _T("*.*"), 0, REG_SZ ,(const unsigned char *)strValue.GetBuffer(0), (DWORD)_tcslen(_T("svn:needs-lock = *")));
}

bool CSVNOperation::CheckSVNVersion( const CString& version)
{
	if(!m_bInit) return false;

	CString CommandLine;
	CommandLine = _T(" --version");
	ProcessCommand(CommandLine);
	int index = m_csResult.Find(_T("version "));
	if(index == -1)
	{
		return false;
	}

	int c1 = 0, c2 = 0, c3 = 0;
	int v1 = 0, v2 = 0, v3 = 0;
	sscanf_s(version, "%d.%d.%d", &c1, &c2, &c3);
	sscanf_s(m_csResult.GetBuffer() + index, "version %d.%d.%d", &v1, &v2, &v3);
	
	int check = (c1 << 16) | (c2 << 8) | c3;
	int ver = (v1 << 16) | (v2 << 8) | v3;

	return ver >= check;
}

bool CSVNOperation::CreateProject(const CString& csPath)
{
	if(!m_bInit) return false;

	CString CommandLine;
	CommandLine.Format(_T(" mkdir \"%s\" "),csPath);
	CString csAuthen;
	csAuthen.Format(_T(" --non-interactive --username %s --password %s"), m_csUserName, m_csPassword);
	CommandLine += csAuthen;
	ProcessCommand(CommandLine);
	if (m_csResult.Find(_T("Can't create directory")) != -1)
	{
		return false;
	}
	Commit(csPath);
	return true;
}

bool CSVNOperation::SetProjectPath(const CString& csPath)
{
	CString csWorkFolder(m_csRootWorkFolder);
	if (csWorkFolder.Right(1) == _T("\\"))
	{
		csWorkFolder += csPath;
	}
	else
	{
		csWorkFolder = csWorkFolder + _T("\\") + csPath;
	}
	if (!PathIsDirectory(csWorkFolder))
	{
		return false;
	}
	CString csURL(m_csRootServerPath);
	if (csURL.Right(1) == _T("/"))
	{
		csURL += csPath;
	}
	else
	{
		csURL = csURL + _T("/") + csPath;
	}
	csURL.Replace(_T("\\"), _T("/"));
	m_csWorkFolder = csWorkFolder;
	m_csServerPath = csURL;
	return true;
}

bool CSVNOperation::Update(const CString& csPath)
{
	if(!m_bInit) return false;

	CString CommandLine;
	if (csPath.GetLength() == 0)
	{
		CommandLine.Format(_T(" update -q"));
	}
	else
	{
		CommandLine.Format(_T(" update \"%s\" -q"),csPath);
	}
	CString csAuthen;
	csAuthen.Format(_T(" --non-interactive --username %s --password %s"), m_csUserName, m_csPassword);
	CommandLine += csAuthen;
	ProcessCommand(CommandLine);
	if (m_csResult.Find(_T("Error")) != -1)
	{
		return false;
	}
	return true;
}

bool CSVNOperation::Status(const CString& csPath)
{
	if(!m_bInit) return false;

	CString CommandLine;
	if (csPath.GetLength() == 0)
	{
		CommandLine.Format(_T(" status -u"));
	}
	else
	{
		CommandLine.Format(_T(" status \"%s\" -u"),csPath);
	}
	CString csAuthen;
	csAuthen.Format(_T(" --non-interactive --username %s --password %s"), m_csUserName, m_csPassword);
	CommandLine += csAuthen;
	ProcessCommand(CommandLine);
	return true;
}

bool CSVNOperation::Lock(const CString& csFileName)
{
	if(!m_bInit) return false;

	CString CommandLine;
	CommandLine.Format(_T(" lock \"%s\" "),csFileName);
	CString csAuthen;
	csAuthen.Format(_T(" --non-interactive --username %s --password %s"), m_csUserName, m_csPassword);
	CommandLine += csAuthen;
	ProcessCommand(CommandLine);
	if (m_csResult.Find(_T("is already locked by")) != -1)
	{
		int nPos = 0;
		nPos = m_csResult.Find(_T('\''), nPos+1);
		nPos = m_csResult.Find(_T('\''), nPos+1);		
		int nStart = m_csResult.Find(_T('\''), nPos+1);
		int nEnd = m_csResult.Find(_T('\''), nStart+1);
		CString csName = m_csResult.Mid(nStart+1, nEnd - nStart-1);
		if (csName == m_csUserName)
		{
			return true;
		}
		else
		{
			MessageBox(0, m_csResult, _T("Warning"), MB_ICONWARNING);
			return false;
		}
	}
	return true;
}

bool CSVNOperation::Commit(const CString& csPath, const CString& csMessage)
{
	if(!m_bInit) return false;

	CString CommandLine;
	if (csPath.GetLength() == 0)
	{
		CommandLine.Format(_T(" commit -m \"%s\" -q"), csMessage);
	}
	else
	{
		CommandLine.Format(_T(" commit \"%s\" -m \"%s\" -q"),csPath, csMessage);
	}
	CString csAuthen;
	csAuthen.Format(_T(" --non-interactive --username %s --password %s"), m_csUserName, m_csPassword);
	CommandLine += csAuthen;
	ProcessCommand(CommandLine);
	if (m_csResult.Find(_T("Commit failed")) != -1)
	{
		return false;
	}
	return true;
}

bool CSVNOperation::Add(const CString& csPath)
{
	if(!m_bInit) return false;

	CString CommandLine;
	if (csPath == _T(""))
	{
		CommandLine.Format(_T(" add * \"\" -q"),csPath);
	}
	else
	{
		CommandLine.Format(_T(" add \"%s\" -q"),csPath);
	}	
	CString csAuthen;
	csAuthen.Format(_T(" --non-interactive --username %s --password %s"), m_csUserName, m_csPassword);
	CommandLine += csAuthen;
	ProcessCommand(CommandLine);
	return true;
}

bool CSVNOperation::PropSet_NeedsLock(const CString& csPath)
{
	if(!m_bInit) return false;

	CString CommandLine;
	if (csPath == _T(""))
	{
		CommandLine.Format(_T(" propset svn:needs-lock \"\" \"\" -R -q"),csPath);
	}
	else
	{
		CommandLine.Format(_T(" propset svn:needs-lock \"\" \"%s\" -R -q"),csPath);
	}	
	CString csAuthen;
	csAuthen.Format(_T(" --non-interactive --username %s --password %s"), m_csUserName, m_csPassword);
	CommandLine += csAuthen;
	ProcessCommand(CommandLine);
	return true;
}

bool CSVNOperation::Delete(const CString& csPath)
{
	if(!m_bInit) return false;

	CString CommandLine;
	CommandLine.Format(_T(" delete \"%s\"  -q"),csPath);
	CString csAuthen;
	csAuthen.Format(_T(" --non-interactive --username %s --password %s"), m_csUserName, m_csPassword);
	CommandLine += csAuthen;
	ProcessCommand(CommandLine);
	return true;
}

bool CSVNOperation::Revert(const CString& csPath)
{
	if(!m_bInit) return false;

	CString CommandLine;
	if (csPath == _T(""))
	{
		CommandLine.Format(_T(" revert \"\" -R -q"));
	}
	else
	{
		CommandLine.Format(_T(" revert \"%s\" -R -q"),csPath);
	}	
	CString csAuthen;
	csAuthen.Format(_T(" --non-interactive --username %s --password %s"), m_csUserName, m_csPassword);
	CommandLine += csAuthen;
	ProcessCommand(CommandLine);
	return true;
}

bool CSVNOperation::Unlock(const CString& csFileName)
{
	if(!m_bInit) return false;

	CString CommandLine;
	CommandLine.Format(_T(" unlock \"%s\" "),csFileName);
	CString csAuthen;
	csAuthen.Format(_T(" --non-interactive --username %s --password %s"), m_csUserName, m_csPassword);
	CommandLine += csAuthen;
	ProcessCommand(CommandLine);
	return true;
}

bool CSVNOperation::Checkout(const CString& csURL, const CString& csPath)
{
	if(!m_bInit) return false;

	CString CommandLine;
	if (csPath.GetLength() == 0)
	{
		CommandLine.Format(_T(" checkout \"%s\" \"\" --force  -q"),csURL);
	}
	else
	{
		CommandLine.Format(_T(" checkout \"%s\" \"%s\" --force  -q"),csURL, csPath);
	}	
	CString csAuthen;
	csAuthen.Format(_T(" --non-interactive --username %s --password %s"), m_csUserName, m_csPassword);
	CommandLine += csAuthen;
	ProcessCommand(CommandLine);
	return true;
}

bool CSVNOperation::Up(const CString& csPath)
{
	if(!m_bInit) return false;

	CString CommandLine;
	if (csPath.GetLength() == 0)
	{
		CommandLine.Format(_T(" up \"\" -q"));
	}
	else
	{
		CommandLine.Format(_T(" up \"%s\" -q"), csPath);
	}
	CString csAuthen;
	csAuthen.Format(_T(" --non-interactive --username %s --password %s"), m_csUserName, m_csPassword);
	CommandLine += csAuthen;
	ProcessCommand(CommandLine);
	m_csResult.MakeLower();
	if (m_csResult.Find(_T("cleanup")) != -1)
	{
		MessageBox(0,_T("需要同步日志，这个过程比较漫长，请点击确定并耐心等待"),0,0);
		int nStart = m_csResult.Find(_T("\'"), m_csResult.Find(_T("copy")));
		int nEnd = m_csResult.Find(_T("\'"), nStart + 1);
		CString csCleanupPath = m_csResult.Mid(nStart+1, nEnd - nStart -1);
		if (csCleanupPath == _T("."))
		{
			if (Cleanup())
			{
				Up(csPath);
			}
		}
		else
		{
			if(Cleanup(csCleanupPath))
			{
				Up(csPath);
			}
		}				
	}
	return true;
}

bool CSVNOperation::Move(const CString& csOldPath, const CString& csNewPath)
{
	if(!m_bInit) return false;

	CString CommandLine;
	CommandLine.Format(_T(" move \"%s\" \"%s\""),csOldPath, csNewPath);
	CString csAuthen;
	csAuthen.Format(_T(" --non-interactive --username %s --password %s"), m_csUserName, m_csPassword);
	CommandLine += csAuthen;
	ProcessCommand(CommandLine);
	if (m_csResult.Find(_T("is not a directory")) != -1)
	{
		return false;
	}
	return true;
}

bool CSVNOperation::IsCheckOutStatus(const CString& csFileName)
{
	if(Update(csFileName))
	{
		CString CommandLine;
		CommandLine.Format(_T(" lock \"%s\" "),csFileName);
		CString csAuthen;
		csAuthen.Format(_T(" --non-interactive --username %s --password %s"), m_csUserName, m_csPassword);
		CommandLine += csAuthen;
		ProcessCommand(CommandLine);
		if (m_csResult.Find(_T("is already locked by")) != -1)
		{
			int nPos = 0;
			nPos = m_csResult.Find(_T('\''), nPos+1);
			nPos = m_csResult.Find(_T('\''), nPos+1);		
			int nStart = m_csResult.Find(_T('\''), nPos+1);
			int nEnd = m_csResult.Find(_T('\''), nStart+1);
			CString csName = m_csResult.Mid(nStart+1, nEnd - nStart-1);
			if (csName == m_csUserName)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			Unlock(csFileName);
			return false;
		}
	}
	else
	{
		return false;
	}
}


bool CSVNOperation::IsFileExist(const CString& csFileName)
{
	if(!m_bInit) return false;

	CString CommandLine;
	CommandLine.Format(_T(" lock \"%s\" "),csFileName);
	CString csAuthen;
	csAuthen.Format(_T(" --non-interactive --username %s --password %s"), m_csUserName, m_csPassword);
	CommandLine += csAuthen;
	ProcessCommand(CommandLine);	
	if(m_csResult.Find(_T("is not under version control")) != -1)
		return false;
	return true;
}

struct DOUBLEHANDEL
{
	HANDLE hPipe;
	HANDLE hProcess;
	HANDLE hConsoleWrite;
	CString strResult;
};

DWORD WINAPI CSVNOperation::ReadAndHandleOutput(LPVOID param)
{
	DWORD nBytesRead;
	TCHAR* csBuffer;
	HANDLE hRead = ((DOUBLEHANDEL*)param)->hPipe;
	HANDLE hProcess = ((DOUBLEHANDEL*)param)->hProcess;
	HANDLE hConsole = ((DOUBLEHANDEL*)param)->hConsoleWrite;
	while(TRUE)
	{
		//use PeekNamedPipe to avoid dead lock.
		DWORD dwTotalBytes=0;
		DWORD dwTotalLeft=0;
		BOOL returnValue= PeekNamedPipe(hRead, NULL, 0,\
			&nBytesRead, &dwTotalBytes, &dwTotalLeft);
		csBuffer = new TCHAR[dwTotalBytes+1];
		ZeroMemory(csBuffer, dwTotalBytes+1);
		returnValue= PeekNamedPipe(hRead, csBuffer, dwTotalBytes+1,\
			&nBytesRead, &dwTotalBytes, &dwTotalLeft);
		if (returnValue) 
		{
			if (dwTotalBytes!=0) 
			{
				if (ReadFile(hRead, csBuffer, (DWORD)_tcslen(csBuffer), &nBytesRead, NULL) \
					&& nBytesRead)
				{
					WriteFile(hConsole, csBuffer, nBytesRead, NULL, NULL);
					((DOUBLEHANDEL*)param)->strResult += csBuffer;
					CString msg = csBuffer;					
					if(msg.Find(_T("Authentication realm")) != -1 ||
						msg.Find(_T("Authentication error")) != -1)
					{
						TerminateProcess(hProcess,1);
						if (csBuffer)
						{
							delete []csBuffer;
							csBuffer = 0;
						}
						return 1;
					}
				}
			}
		}

		DWORD dwExitCode;
		if(GetExitCodeProcess(hProcess,&dwExitCode))
		{
			if(dwExitCode==STILL_ACTIVE)
			{
				Sleep(100);
			}
			else
			{
				if (csBuffer)
				{
					delete []csBuffer;
					csBuffer = 0;
				}
				return 1;
			}
		}
		if (csBuffer)
		{
			delete []csBuffer;
			csBuffer = 0;
		}
	}
	return 1;
}


void CSVNOperation::ProcessCommand(const CString& command)
{
	HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
	m_csResult = "";

	//create pipe
	SECURITY_ATTRIBUTES saAttr;
	saAttr.nLength = sizeof(SECURITY_ATTRIBUTES); 
	saAttr.bInheritHandle = TRUE; 
	saAttr.lpSecurityDescriptor = NULL; 

	HANDLE hRead1,hWrite1,hRead2,hWrite2;
	if (!CreatePipe(&hRead1, &hWrite1, &saAttr, 1024*1024) || !CreatePipe(&hRead2, &hWrite2, &saAttr, 1024*1024))
		return;


	//create process
	STARTUPINFO si;
	memset(&si, 0, sizeof(si));
	si.cb = sizeof(si);
	si.dwFlags = STARTF_USESTDHANDLES ;
	si.hStdOutput = hWrite1; 
	si.hStdInput  = hRead2;
	si.hStdError = hWrite1; 

	PROCESS_INFORMATION pi;
	TCHAR* buf = new TCHAR[command.GetLength()+1];
	_tcscpy(buf, command);

	CString strCmd = "SVN> svn" + command + "\r\n";
	WriteConsole(hConsole, strCmd, strCmd.GetLength(), NULL, NULL);
	DWORD dwCreateWindow = m_bConsoleEnabled ? 0 : CREATE_NO_WINDOW;
	VERIFY(CreateProcess(
		m_csSVNPath + ".exe",
		buf,
		NULL,
		NULL,
		TRUE,
		dwCreateWindow,
		NULL,
		m_csWorkFolder.IsEmpty() ? NULL : m_csWorkFolder.GetBuffer(),
		&si,
		&pi));

	DWORD ThreadId;
	DOUBLEHANDEL dHandle;
	dHandle.hPipe = hRead1;
	dHandle.hConsoleWrite = hConsole;
	dHandle.hProcess = pi.hProcess;
	HANDLE hThread = CreateThread(NULL, 0, ReadAndHandleOutput, (LPVOID)&dHandle, 0, &ThreadId);
	if (hThread == NULL) 
	{
		TerminateProcess(pi.hProcess,1);
		CloseHandle(hRead1);
		CloseHandle(hWrite1);
		CloseHandle(hRead2);
		CloseHandle(hWrite2);
		if (buf)
		{
			delete []buf;
			buf = 0;
		}
		return;
	}

	WaitForSingleObject(hThread,INFINITE);

	m_csResult = dHandle.strResult;
	if(m_pLogFunc) 
	{
		CString strTemp;
		strTemp.Format( _T("SVN command: \"%s\""), buf);
		m_pLogFunc(strTemp);
		if(m_csResult.GetLength() < 1024) m_pLogFunc(m_csResult);
		else m_pLogFunc(_T("......OK"));
	}

	CloseHandle(hRead1);
	CloseHandle(hWrite1);
	CloseHandle(hRead2);
	CloseHandle(hWrite2);
	if (buf)
	{
		delete []buf;
		buf = 0;
	}
}

std::map<CString, int> CSVNOperation::GetFilesStatus(const CString& csPath)
{
	m_mapPath2Status.clear();
	CString csFolderPath = csPath;
	if(csPath.Right(1) == _T("\\"))
	{
		csFolderPath = csPath.Left(csPath.GetLength()-1);
	}
	CString CommandLine;
	CommandLine.Format(_T(" list \"%s\" -R"),csFolderPath);
	ProcessCommand(CommandLine);
	CString csResult(m_csResult);
	int nPos = -1;
	do 
	{
		CString csLine(GetLine(csResult, nPos));
		CString csFullPath(csFolderPath);
		if (csPath == _T(""))
		{
			csFullPath = csLine;
		}
		else
		{
			csFullPath = csFullPath + _T("\\") + csLine;
		}
		m_mapPath2Status[csFullPath] = CHECKED_IN;
	} while(nPos != -1);
	Status(csPath);
	csResult = m_csResult;
	if (csResult.Find(_T("Status against revision")) == 0)
	{
		return m_mapPath2Status;
	}
	nPos = -1;
	do 
	{
		CString csLine(GetLine(csResult, nPos));
		if(csLine.Find(_T("Status against revision")) != -1)
		{
			break;
		}
		if ( csLine.GetAt(5) != _T('B'))
		{
			continue;
		}
		int nBlank = csLine.ReverseFind(_T(' '));
		if(nBlank != -1)
		{
			CString csFileName = csLine.Right(csLine.GetLength() - nBlank - 1);
			CString csFullPath;
			if (csPath == _T(""))
			{
				csFullPath = csFileName;
			}
			else
			{
				csFullPath = csFullPath + _T("\\") + csFileName;
			}
			m_mapPath2Status[csFullPath] = CHECKED_OUT;
		}
	} while(nPos != -1);
	return m_mapPath2Status;
}

bool CSVNOperation::TestSVNConnected()
{
	if(m_csUserName.GetLength() == 0 || m_csPassword.GetLength() == 0)
	{
		return false;
	}
	CString CommandLine = _T(" up dummy");
	CString csAuthen;
	csAuthen.Format(_T(" --non-interactive --username %s --password %s"), m_csUserName, m_csPassword);
	CommandLine += csAuthen;
	ProcessCommand(CommandLine);
	if (m_csResult.Find(_T("No repository found")) != -1 || 
		m_csResult.Find(_T("Authentication realm")) != -1 || 
		m_csResult.Find(_T("Authentication error")) != -1 || 
		m_csResult.Find(_T("Can't connect to host")) != -1)
	{
		return false;
	}	
	return true;
}

bool CSVNOperation::Info(const CString& csPath)
{
	CString CommandLine;
	if (csPath == _T(""))
	{
		CommandLine.Format(_T(" info "));
	}
	else
	{
		CommandLine.Format(_T(" info \"%s\" "),csPath);
	}
	
	CString csAuthen;
	csAuthen.Format(_T(" --non-interactive --username %s --password %s"), m_csUserName, m_csPassword);
	CommandLine += csAuthen;
	ProcessCommand(CommandLine);
	return true;
}

bool CSVNOperation::Cleanup(const CString& csPath)
{
	if (csPath != _T(""))
	{
		if(!PathIsDirectory(csPath))
		{
			return false;
		}
	}	
	CString CommandLine;
	if (csPath == _T(""))
	{
		CommandLine.Format(_T(" cleanup "));
	}
	else
	{
		CommandLine.Format(_T(" cleanup \"%s\" "),csPath);
	}
	
	CString csAuthen;
	csAuthen.Format(_T(" --non-interactive --username %s --password %s"), m_csUserName, m_csPassword);
	CommandLine += csAuthen;
	ProcessCommand(CommandLine);
	return true;
}