
// ElementIconToolDlg.h : header file
//

#if !defined(AFX_ELEMENTICONTOOLDLG_H__5A63417E_0C47_4AA5_9CDC_B57E6A5B67E8__INCLUDED_)
#define AFX_ELEMENTICONTOOLDLG_H__5A63417E_0C47_4AA5_9CDC_B57E6A5B67E8__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CElementIconToolDlg dialog

#include <AString.h>
#include <vector.h>
#include <hashmap.h>
#include "..\Common\ExpTypes.h"

class A3DDevice;
class A3DEngine;
class A3DSurface;
class elementdataman;
class DataPathMan;

typedef abase::hash_map<AString, int> IconMap;
typedef abase::vector<AString> IconList;

class CElementIconToolDlg : public CDialog
{
// Construction
public:
	CElementIconToolDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CElementIconToolDlg)
	enum { IDD = IDD_ELEMENTICONTOOL_DIALOG };
	CString	m_path;
	CString	m_path2;
	CString	m_path3;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CElementIconToolDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CElementIconToolDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnDestroy();
	afx_msg void OnButton2();
	afx_msg void OnButton1();
	afx_msg void OnChangeEdit1();
	afx_msg void OnButton3();
	afx_msg void OnButton4();
	afx_msg void OnButton5();
	afx_msg void OnButton6();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
	void Release();
	bool Init();
	void ReleaseA3DEngine();	
	bool LoadElementData();
	void ClearElementData();
	bool InitA3DEngine();
	bool ConvertItemIcon(AString &strOutputDir);
	bool ConvertSkillIcon(AString &strOutputDir);
	bool SaveSurfaceToFile(const char * szIconFile, A3DSurface *pSurfaceDst);
	AString GetLogFileName()const{ return "Icon.log";}
	void OpenLogFile();
	A3DDevice * m_pA3DDevice;
	A3DEngine * m_pA3DEngine;

	elementdataman * m_pElementDataMan;
	DataPathMan* m_pDataPathMan;

	bool GetFirstItemIconFilePath(AString &strIconIndex, AString &strIconOut);
	bool GetNextItemIconFilePath(AString &strIconIndex, AString &strIconOut);
	void GetItemIconFilePath(AString &strIconIndex, AString &strIconOut);

	bool GetFirstClothIconFilePath(abase::vector<AString> &strvecIconIndex, abase::vector<AString> &strvecIconOut);
	bool GetNextClothIconFilePath(abase::vector<AString> &strvecIconIndex, abase::vector<AString> &strvecIconOut);
	void GetClothIconFilePath(abase::vector<AString> &strvecIconIndex, abase::vector<AString> &strvecIconOut);

	bool GetFirstArmorIconFilePath(AString &strIconIndex, AString &strIconOut);
	bool GetNextArmorIconFilePath(AString &strIconIndex, AString &strIconOut);
	void GetArmorIconFilePath(AString &strIconIndex, AString &strIconOut);

	bool GetFirstItemIDName(unsigned int &id, AString &strName);
	bool GetNextItemIDName(unsigned int &id, AString &strName);
	void GetItemIDName(unsigned int &id, AString &strName);
	bool _BuildIcon(const AString &strIconIndex, const AString& strDirOut, AString &strIconOut,const IconMap& iconMap,A3DSurface *pSurfaceDst,A3DSurface *pSurfaceSrc,int W, int H, int nCountX, int nCountY);

	DATA_TYPE m_dtTemp;
	unsigned int m_idTemp;

	int					m_idSkill;
public:
	afx_msg void OnEnChangeEdit3();
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ELEMENTICONTOOLDLG_H__5A63417E_0C47_4AA5_9CDC_B57E6A5B67E8__INCLUDED_)
