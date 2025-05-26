#pragma once

#include <afx.h>
#include <Afxwin.h>
#include "SVNOperation.h"

class CSVNAdapter
{
public:
	CSVNAdapter(void){}
	~CSVNAdapter(void){}	
public:
	CString GetSVNPath();
	CString GetServerPath() {return m_SVN.GetServerPath();}
	CString GetWorkFolder() {return m_SVN.GetWorkFolder();}

	void SetServerPath(const CString& szServerPath);
	void SetUserName(const CString& szUser);
	void SetPassword(const CString& szPassWord);
	void SetWorkFolder(const CString& szWorkingFolder);
	void InitVss( CMDLOGFUNC* pLogFunc,bool bClose = false);
	bool GetFile(const CString& szPath);
	void AddFile(const CString& szFileName);
	void AddAllFile(const CString& szPath);
	bool CreateProject(const CString& szPath);
	bool SetProjectPath(const CString& szPath);
	void GetAllFiles(const CString& szPath);
	bool FirstGetFile();
	void CheckInFile(const CString& szName);
	void CheckInAllFile(const CString& szPath);
	void CheckOutFile(const CString& szPathName);
	void CheckOutAllFile(const CString& szPath);
	bool DeleteFile(const CString& szFileName);
	void UndoCheckOut(const CString& szName);
	void UndoCheckOutFiles();
	bool IsCheckOutStatus(const CString& szFileName);
	void Property(const CString& szFileName);

	bool Rename(const CString szOldName, const CString szNewName);

	CString GetFileTypes(const CString& szPathName);
	bool TestVssConnected(const CString& strMsg);

	inline CString& GetLastCommandResult(){ return m_SVN.GetLastCommandResult(); }
	inline bool IsInited(){ return m_SVN.IsInited(); }
	//void SetProperyToBinary(const CString& strFileName);
	bool IsFileExist(const CString& szFileName);
	std::map<CString, int> GetFilesStatus(const CString& csPath);

protected:
	CSVNOperation m_SVN;
	CString m_csProjectPath;
	void UnlockFiles(const CString& csPath);
};
