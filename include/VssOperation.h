// VssOperation.h: interface for the CVssOperation class.
//
//////////////////////////////////////////////////////////////////////

#ifndef _VSS_OPERATION_
#define _VSS_OPERATION_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include <map>

typedef void CALLBACK CMDLOGFUNC(const TCHAR*szLog);

class CVssOperation  
{
	enum
	{
		CHECKED_IN,
		CHECKED_OUT
	};


public:

	enum
	{
		GUARD_R,
		GUARD_W,
		GUARD_BACKUP,
		GUARD_SAME,
		GUARD_NUM
	};

	struct TokenPair
	{
		const TCHAR* beg;
		const TCHAR* end;
	};
	CVssOperation();
	virtual ~CVssOperation();
	CString GetVssPath();
	
	void SetServerPath(const CString& szServerPath);
	void SetUserName(const CString& szUser){ m_szUserName = szUser; };
	void SetPassword(const CString& szPassWord) { m_szPassword = szPassWord; };
	void SetWorkFolder(const CString& szWorkingFolder);
	void InitVss( CMDLOGFUNC* pLogFunc,bool bClose = false);
	
	bool GetFile(const CString& szPath);
	void AddFile(const CString& szFileName);
	void AddAllFile(const CString& szPath);
	void CreateProject(const CString& szPath);
	void SetProjectPath(const CString& szPath);
	void GetAllFiles(const CString& szPath);
	void CheckInFile(const CString& szName);
	void CheckInAllFile(const CString& szPath);
	void CheckOutFile(const CString& szPathName);
	void CheckOutAllFile(const CString& szPath);
	void DeleteFile(const CString& szFileName);
	void UndoCheckOut(const CString& szName);
	int IsCheckOutStatus(const CString& szFileName);
	void Property(const CString& szFileName);
	void UndoCheckOutFiles();
	void Rename(const CString szOldName, const CString szNewName);
	CString& GetFileTypes(const CString& szPathName);
	bool TestVssConnected(const CString& strMsg);
	
	inline CString& GetLastCommandResult(){ return m_szResult; }
	inline bool IsInited(){ return m_bInit; }
	void SetProperyToBinary(const CString& strFileName);
	bool IsFileExist(const CString& szFileName);	
	std::map<CString, int> GetFilesStatus(const CString& csPath);

	// default is enabled
	void EnableBackupOnServer(bool bEnabled = true);
	void EnableRWCheck(bool bEnabled = true);

protected:
	typedef bool GuardFunctor(const TCHAR* szBackupDir, const TCHAR *szVssDir, const TCHAR* szLocDir, const TCHAR* szFileName, CMDLOGFUNC* pLogFunc);

	static DWORD WINAPI ReadAndHandleOutput(LPVOID param);
	static bool ReadBufferFromPipe(HANDLE hPipe, CString& str);
	void ProcessCommand(const CString& command);

	bool GuardFunc(const TCHAR* szLocalDir, const TokenPair* token, int nToken, const int pFunctorIndex[], int nFunctor);
	// file assist operation
	static bool IsFileReadOnly(const TCHAR* szBackupDir, const TCHAR *szVssDir, const TCHAR* szLocDir, const TCHAR* szFileName, CMDLOGFUNC* pLogFunc);
	static bool IsFileWritable(const TCHAR* szBackupDir, const TCHAR *szVssDir, const TCHAR* szLocDir, const TCHAR* szFileName, CMDLOGFUNC* pLogFunc);	
	static bool MakeFileSame(const TCHAR* szBackupDir, const TCHAR *szVssDir, const TCHAR* szLocDir, const TCHAR* szFileName, CMDLOGFUNC* pLogFunc);
	static bool AddBackupFile(const TCHAR* szBackupDir, const TCHAR* szVssDir, const TCHAR* szLocalDir, const TCHAR* szFile, CMDLOGFUNC* pLogFunc);
	
	bool DelBackupFile(const TCHAR* szPath);
	bool RenameBackupFile(const TCHAR* szPath, const TCHAR* szNewPath);

	bool GetAffectFilesFromCmd(const TokenPair* token, int nToken, CStringArray& aFiles, CString& szProjPath);

protected:
	CString m_szResultErr;
	CString m_szResultSuc;
	CString m_szResult;
	CString m_szUserName;
	CString m_szPassword;
	CString m_szServerPath;
	CString m_szBackupDir;
	CString m_szWorkingFolder;
	CString m_szVssPath;
	CMDLOGFUNC *m_pLogFunc;
	bool m_bInit;
	std::map<CString, int> m_mapPath2Status;

	GuardFunctor* m_Guards[GUARD_NUM];
};

#endif //_VSS_OPERATION_
