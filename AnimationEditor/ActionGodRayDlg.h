#if !defined(AFX_ACTIONGODRAYDLG_H__77822D6F_668C_4FC5_B4BE_AC49ADB99E69__INCLUDED_)
#define AFX_ACTIONGODRAYDLG_H__77822D6F_668C_4FC5_B4BE_AC49ADB99E69__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// CActionGodRayDlg.h : header file
//

#include "TrackNode.h"

/////////////////////////////////////////////////////////////////////////////
// CActionGodRayDlg dialog

class CActionGodRayDlg : public CDialog
{
// Construction
public:
	CActionGodRayDlg(CWnd* pParent, CTrackChannel *pChannel, CTrackNode *pNode);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CActionGodRayDlg)
	enum { IDD = IDD_DLG_ACTION_GOD_RAY };
    UINT	m_uiObjectID;
	UINT	m_uiActionID;
    float	m_fStartTime;
    float   m_fStartDepthRange;
    float   m_fStartBloomScale;
    float   m_fStartBloomThreshold;
    float   m_fStartBlendThreshold;
    float   m_fStartDarkness;
    float   m_fStartVisibleAngle;
    UINT    m_uiStartColor;
    float   m_fEndDepthRange;
    float   m_fEndBloomScale;
    float   m_fEndBloomThreshold;
    float   m_fEndBlendThreshold;
    float   m_fEndDarkness;
    float   m_fEndVisibleAngle;
    UINT    m_uiEndColor;
	int		m_iTotalFrames;
	//}}AFX_DATA

private:
    CTrackChannel *m_pChannel;
    CTrackNode *m_pNode;

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CActionGodRayDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CActionGodRayDlg)
	afx_msg void OnButtonActionRemove();
	afx_msg void OnButtonActionOk();
	afx_msg void OnButtonActionCancel();
    afx_msg void OnBnClickedButtonChooseStartColor();
    afx_msg void OnBnClickedButtonChooseEndColor();
    afx_msg void OnDrawItem(int nIDCtl, LPDRAWITEMSTRUCT lpDrawItemStruct);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ACTIONGODRAYDLG_H__77822D6F_668C_4FC5_B4BE_AC49ADB99E69__INCLUDED_)
