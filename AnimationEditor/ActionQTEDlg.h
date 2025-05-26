#if !defined(AFX_ACTIONQTEDLG_H__249388A6_CAF0_443A_8F9C_481FDB1DA262__INCLUDED_)
#define AFX_ACTIONQTEDLG_H__249388A6_CAF0_443A_8F9C_481FDB1DA262__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// ActionQTEDlg.h : header file
//

#include "TrackNode.h"

/////////////////////////////////////////////////////////////////////////////
// CActionQTEDlg dialog

class CActionQTEDlg : public CDialog
{
    // Construction
public:
    CActionQTEDlg(CWnd* pParent, CTrackChannel *pChannel, CTrackNode *pNode);   // standard constructor

    // Dialog Data
    //{{AFX_DATA(CActionQTEDlg)
    enum { IDD = IDD_DLG_ACTION_QTE };
    UINT	m_uiActionID;
    float	m_fStartTime;
    int		m_iTotalFrames;
    UINT    m_uiQTEID;
    float	m_fSpeed;
    //}}AFX_DATA

private:
    CTrackChannel *m_pChannel;
    CTrackNode *m_pNode;

    // Overrides
    // ClassWizard generated virtual function overrides
    //{{AFX_VIRTUAL(CActionQTEDlg)
protected:
    virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
    //}}AFX_VIRTUAL

    // Implementation
protected:

    // Generated message map functions
    //{{AFX_MSG(CActionQTEDlg)
    afx_msg void OnButtonActionOk();
    afx_msg void OnButtonActionCancel();
    afx_msg void OnButtonActionRemove();
    //}}AFX_MSG
    DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ACTIONQTEDLG_H__249388A6_CAF0_443A_8F9C_481FDB1DA262__INCLUDED_)
