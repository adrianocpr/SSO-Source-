// CSetWorldOffsetDlg.cpp : implementation file
//

#include "stdafx.h"
#include "animationeditor.h"
#include "SetWorldOffsetDlg.h"
#include "Animator/Animator.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSetWorldOffsetDlg dialog


CSetWorldOffsetDlg::CSetWorldOffsetDlg(CWnd* pParent /*=NULL*/)
: CDialog(CSetWorldOffsetDlg::IDD, pParent)
{
    m_fStartPosX = 0.0f;
    m_fStartPosY = 0.0f;
    m_fStartPosZ = 0.0f;
    //{{AFX_DATA_INIT(CSetWorldOffsetDlg)
    //}}AFX_DATA_INIT
}


void CSetWorldOffsetDlg::DoDataExchange(CDataExchange* pDX)
{
    CDialog::DoDataExchange(pDX);
    //{{AFX_DATA_MAP(CSetWorldOffsetDlg)
    DDX_Text(pDX, IDC_START_POS_X, m_fStartPosX);
    DDX_Text(pDX, IDC_START_POS_Y, m_fStartPosY);
    DDX_Text(pDX, IDC_START_POS_Z, m_fStartPosZ);
    //}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CSetWorldOffsetDlg, CDialog)
    //{{AFX_MSG_MAP(CSetWorldOffsetDlg)
    ON_BN_CLICKED(IDC_BUTTON_SET_OFFSET_OK, OnButtonSetOffsetOk)
    ON_BN_CLICKED(IDC_BUTTON_SET_OFFSET_CANCEL, OnButtonSetOffsetCancel)
    //}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSetWorldOffsetDlg message handlers

void CSetWorldOffsetDlg::OnButtonSetOffsetOk() 
{
    // TODO: Add your control notification handler code here
    UpdateData(TRUE);
    g_Animator.Stop();
    A3DVECTOR3 offset(m_fStartPosX, m_fStartPosY, m_fStartPosZ);
    g_Animator.MoveWorldOffset(offset);
    theApp.OnChanged();
    EndDialog(0);
}

void CSetWorldOffsetDlg::OnButtonSetOffsetCancel() 
{
    // TODO: Add your control notification handler code here
    EndDialog(0);
}