#if !defined(AFX_ACTIONFOVDLG_H__77822D6F_668C_4FC5_B4BE_AC49ADB99E69__INCLUDED_)
#define AFX_ACTIONFOVDLG_H__77822D6F_668C_4FC5_B4BE_AC49ADB99E69__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// ActionFOVDlg.h : header file
//

#include "TrackNode.h"

/////////////////////////////////////////////////////////////////////////////
// CActionFOVDlg dialog

class CActionFOVDlg : public CDialog
{
// Construction
public:
	CActionFOVDlg(CWnd* pParent, CTrackChannel *pChannel, CTrackNode *pNode);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CActionFOVDlg)
	enum { IDD = IDD_DLG_ACTION_FOV };
    UINT	m_uiObjectID;
	UINT	m_uiActionID;
    float	m_fStartTime;
	float	m_fStartFOV;
	float	m_fEndFOV;
	int		m_iTotalFrames;
	//}}AFX_DATA

private:
    CTrackChannel *m_pChannel;
    CTrackNode *m_pNode;

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CActionFOVDlg)
protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CActionFOVDlg)
	afx_msg void OnButtonActionRemove();
	afx_msg void OnButtonActionOk();
	afx_msg void OnButtonActionCancel();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ACTIONFOVDLG_H__77822D6F_668C_4FC5_B4BE_AC49ADB99E69__INCLUDED_)
