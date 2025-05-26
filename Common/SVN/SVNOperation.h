// SVNOperation.h: interface for the CSVNOperation class.
//
//////////////////////////////////////////////////////////////////////

#ifndef _SVN_OPERATION_
#define _SVN_OPERATION_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include <map>

typedef void CALLBACK CMDLOGFUNC(const TCHAR*csLog);

class CSVNOperation  
{
	enum
	{
		CHECKED_IN,
		CHECKED_OUT
	};

public:
	CSVNOperation();
	virtual ~CSVNOperation();
	CString GetSVNPath();

	CString GetServerPath() {return m_csServerPath;}
	CString GetWorkFolder() {return m_csWorkFolder;}
	CString GetRootWorkFolder() {return m_csRootWorkFolder;}
	
	void SetServerPath(const CString& csServerPath){ m_csServerPath = csServerPath; m_csRootServerPath = csServerPath;};
	void SetUserName(const CString& csUser){ m_csUserName = csUser; };
	void SetPassword(const CString& csPassWord) { m_csPassword = csPassWord; };
	void SetWorkFolder(const CString& csWorkFolder){ m_csWorkFolder = csWorkFolder; m_csRootWorkFolder = csWorkFolder;};
	void InitSVN( CMDLOGFUNC* pLogFunc,bool bClose = false);
	void InitConsole();

	bool CheckSVNVersion(const CString& version);
	bool CreateProject(const CString& csPath);
	bool SetProjectPath(const CString& csPath);

	bool Update(const CString& csPath = _T(""));
	bool Status(const CString& csPath = _T(""));
	bool Lock(const CString& csFileName);
	bool Commit(const CString& csPath = _T(""),const CString& csMessage = _T(""));
	bool Add(const CString& csPath);
	bool PropSet_NeedsLock(const CString& csPath);
	bool Delete(const CString& csPath);
	bool Revert(const CString& csPath = _T(""));
	bool Unlock(const CString& csFileName);
	bool Checkout(const CString& csURL, const CString& csPath = _T(""));
	bool Up(const CString& csPath);
	bool Move(const CString& csOldPath, const CString& csNewPath);
	bool Info(const CString& csPath = _T(""));
	bool Cleanup(const CString& csPath = _T(""));
		
	bool IsCheckOutStatus(const CString& csFileName);
	
	inline CString& GetLastCommandResult(){ return m_csResult; }
	inline bool IsInited(){ return m_bInit; }

	bool IsFileExist(const CString& csFileName);	
	std::map<CString, int> GetFilesStatus(const CString& csPath = _T(""));

	bool TestSVNConnected();


protected:

	static DWORD WINAPI ReadAndHandleOutput(LPVOID param);
	void ProcessCommand(const CString& command);
	CString m_csResult;
	CString m_csUserName;
	CString m_csPassword;
	CString m_csServerPath;
	CString m_csWorkFolder;
	CString m_csRootWorkFolder;
	CString m_csRootServerPath;
	CString m_csSVNPath;
	CMDLOGFUNC *m_pLogFunc;
	bool m_bInit;
	bool m_bConsoleEnabled;
	std::map<CString, int> m_mapPath2Status;

};

#endif //_SVN_OPERATION_
