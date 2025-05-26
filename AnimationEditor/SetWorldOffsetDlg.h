#if !defined(AFX_SETWORLDOFFSETDLG_H__50A5514D_E806_474D_A505_391A7C9CB9AE__INCLUDED_)
#define AFX_SETWORLDOFFSETDLG_H__50A5514D_E806_474D_A505_391A7C9CB9AE__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// CSetWorldOffsetDlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CSetWorldOffsetDlg dialog

class CSetWorldOffsetDlg : public CDialog
{
    // Construction
public:
    CSetWorldOffsetDlg(CWnd* pParent = NULL);   // standard constructor

    // Dialog Data
    //{{AFX_DATA(CSetWorldOffsetDlg)
    enum { IDD = IDD_DLG_SET_WORLD_OFFSET };
    float	m_fStartPosX;
    float	m_fStartPosY;
    float	m_fStartPosZ;
    //}}AFX_DATA


    // Overrides
    // ClassWizard generated virtual function overrides
    //{{AFX_VIRTUAL(CSetWorldOffsetDlg)
protected:
    virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
    //}}AFX_VIRTUAL

    // Implementation
protected:

    // Generated message map functions
    //{{AFX_MSG(CSetWorldOffsetDlg)
    afx_msg void OnButtonSetOffsetOk();
    afx_msg void OnButtonSetOffsetCancel();
    //}}AFX_MSG
    DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SETWORLDOFFSETDLG_H__50A5514D_E806_474D_A505_391A7C9CB9AE__INCLUDED_)