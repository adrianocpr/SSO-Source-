#include "Stdafx.h"
#include "SVNAdapter.h"
#include <ShLwApi.h>

CString CSVNAdapter::GetSVNPath() 
{
	return m_SVN.GetSVNPath();
}

void CSVNAdapter::SetServerPath(const CString& szServerPath)
{
	m_SVN.SetServerPath(szServerPath);
}

void CSVNAdapter::SetUserName(const CString& szUser)
{ 
	m_SVN.SetUserName(szUser);
}

void CSVNAdapter::SetPassword(const CString& szPassWord) 
{ 
	m_SVN.SetPassword(szPassWord); 
}
void CSVNAdapter::SetWorkFolder(const CString& szWorkingFolder)
{ 
	m_SVN.SetWorkFolder(szWorkingFolder);
}

void CSVNAdapter::InitConsole()
{
	m_SVN.InitConsole();
}

void CSVNAdapter::InitVss( CMDLOGFUNC* pLogFunc,bool bClose) 
{
	m_SVN.InitSVN(pLogFunc, bClose);
}

bool CSVNAdapter::GetFile(const CString& szPath)
{
	return m_SVN.Up(szPath);	
}

void CSVNAdapter::AddFile(const CString& szFileName)
{
	m_SVN.Add(szFileName); 
	m_SVN.PropSet_NeedsLock(szFileName); 
	m_SVN.Commit(szFileName);
}
void CSVNAdapter::AddAllFile(const CString& szPath)
{
	AddFile(szPath);
}

bool CSVNAdapter::CreateProject(const CString& szPath)
{
	CString csPath(m_csProjectPath);
	if (m_csProjectPath == _T(""))
	{
		csPath = szPath;
	}
	else
	{
		csPath = csPath + _T("\\") + szPath;
	}
	if(PathIsDirectory(csPath))
	{
		AddFile(csPath);
		return true;
	}
	else
	{
		if (m_SVN.SetProjectPath(m_csProjectPath))
		{
			if (m_SVN.CreateProject(szPath))
			{
				m_SVN.SetProjectPath(_T(""));
				return true;
			}
			else
			{
				m_SVN.SetProjectPath(_T(""));
				return false;
			}		
		}
		else
		{
			return false;
		}
	}	
}

bool CSVNAdapter::SetProjectPath(const CString& szPath)
{
	m_csProjectPath = szPath;
	return true;
	return m_SVN.SetProjectPath(szPath);
}

void CSVNAdapter::GetAllFiles(const CString& szPath) 
{
	GetFile(szPath);
}

bool CSVNAdapter::FirstGetFile()
{
	if(m_SVN.Checkout(m_SVN.GetServerPath(), _T("")))
	{
		if (m_SVN.GetLastCommandResult().Find(_T("is already a working copy")) != -1)
		{
			return m_SVN.Update(_T(""));
		}
		else
		{
			return true;
		}
	}
	else
	{
		return false;
	}
}

static bool _IsFileReadOnly(const CString& path)
{
	DWORD attrs = GetFileAttributes(path);
	if(attrs == INVALID_FILE_ATTRIBUTES)
	{
		int err = GetLastError();
		return true;
	}

	return attrs & FILE_ATTRIBUTE_READONLY ? true : false;
}

void CSVNAdapter::CheckInFile(const CString& szName) 
{
	m_SVN.SetProjectPath(m_csProjectPath);
	m_SVN.Commit(szName);
	CString path = m_csProjectPath + "\\" + szName;
	if(!_IsFileReadOnly(path))
	{
		m_SVN.Unlock(szName);
	}
	m_SVN.SetProjectPath("");
}

void CSVNAdapter::CheckInAllFile(const CString& szPath) 
{
	m_SVN.Commit(szPath);
}

void CSVNAdapter::CheckOutFile(const CString& szPathName) 
{
	m_SVN.Update(szPathName); 
	m_SVN.Lock(szPathName);
}

void CSVNAdapter::CheckOutAllFile(const CString& szPath)
{
	if (PathIsDirectory(szPath))
	{
		CFileFind ff;		
		BOOL bFind = ff.FindFile(szPath + _T("\\*.*"));
		while (bFind)
		{
			bFind = ff.FindNextFile();
			if (ff.IsDots())
			{
				continue;
			}
			if (ff.IsDirectory())
			{
				if (ff.GetFileName() == _T(".svn")) continue;
				CheckOutAllFile(ff.GetFilePath());
				continue;
			}
			CheckOutFile(ff.GetFilePath());
		}
	}
}

bool CSVNAdapter::DeleteFile(const CString& szFileName)
{
	if(!m_SVN.Lock(szFileName))
		return false;	
	if(!m_SVN.Delete(szFileName))
		return false;
	return m_SVN.Commit(szFileName);

}

void CSVNAdapter::UndoCheckOut(const CString& szName)
{
	m_SVN.Revert(szName);
	m_SVN.Unlock(szName);
}

void CSVNAdapter::UnlockFiles(const CString& csPath)
{
	if (PathIsDirectory(csPath))
	{
		CFileFind ff;		
		BOOL bFind = ff.FindFile(csPath + _T("\\*.*"));
		while (bFind)
		{
			bFind = ff.FindNextFile();
			if (ff.IsDots())
			{
				continue;
			}
			if (ff.IsDirectory())
			{
				if (ff.GetFileName() == _T(".svn")) continue;
				UnlockFiles(ff.GetFilePath());
				continue;
			}
			m_SVN.Unlock(ff.GetFilePath());
		}
	}
}

void CSVNAdapter::UndoCheckOutFiles()
{
	m_SVN.Revert(m_csProjectPath);
	UnlockFiles(m_csProjectPath);
}

bool CSVNAdapter::IsCheckOutStatus(const CString& szFileName)
{
	return m_SVN.IsCheckOutStatus(szFileName);
}

bool CSVNAdapter::Rename(const CString szOldName, const CString szNewName)
{
	if(m_SVN.Lock(szOldName))
	{
		if(m_SVN.Move(szOldName, szNewName))
		{
			m_SVN.Commit(szOldName);
			m_SVN.Commit(szNewName);
			return true;
		}
		else
		{
			return false;
		}
	}
	else
	{
		return false;
	}
}

bool CSVNAdapter::IsFileExist(const CString& szFileName)
{
	return m_SVN.IsFileExist(szFileName);
}

std::map<CString, int> CSVNAdapter::GetFilesStatus(const CString& csPath) 
{
	return m_SVN.GetFilesStatus(csPath);
}

CString CSVNAdapter::GetFileTypes(const CString& szPathName)
{
	bool bChekout = m_SVN.Up(szPathName);
	return m_SVN.GetLastCommandResult();
}

bool CSVNAdapter::TestVssConnected(const CString& strMsg)
{
	return m_SVN.TestSVNConnected();
}

void CSVNAdapter::Property(const CString& szFileName)
{
	m_SVN.Info(szFileName);
}