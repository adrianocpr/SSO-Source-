
// SDSNmdToolDlg.h : header file
//

#pragma once
#include "colorlistbox.h"


// CSDSNmdToolDlg dialog
class CSDSNmdToolDlg : public CDialog
{
// Construction
public:
	CSDSNmdToolDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	enum { IDD = IDD_SDSNMDTOOL_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support

protected:
	bool CheckInput();

// Implementation
protected:
	HICON m_hIcon;
	CColorListBox m_lbLog;

	// Generated message map functions
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()

	afx_msg void OnBnClickedOk();
public:
	afx_msg void OnBnClickedButtonInput();
	afx_msg void OnBnClickedButtonOutput();
};
