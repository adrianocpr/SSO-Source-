// ActionQTEDlg.cpp : implementation file
//

#include "stdafx.h"
#include "AnimationEditor.h"
#include "ActionQTEDlg.h"
#include "Animator/Animator.h"
#include "Animator/AnmObjectManager.h"
#include "Animator/AnmActionManager.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CActionQTEDlg dialog


CActionQTEDlg::CActionQTEDlg(CWnd* pParent, CTrackChannel *pChannel, CTrackNode *pNode)
: CDialog(CActionQTEDlg::IDD, pParent)
{
    m_pChannel = pChannel;
    m_pNode = pNode;
    m_uiActionID = pNode->GetActionID();
    m_fStartTime = float(pNode->GetStartTime()) / 1000.0f;
    CAnmAction *pAction = m_pNode->GetAction();
    CAnmQTE *pQTE = dynamic_cast<CAnmQTE*>(pAction);
    m_uiQTEID = pQTE->GetQTEID();
    m_fSpeed = pQTE->GetSpeed();
    m_iTotalFrames = pQTE->GetTotalFrames();
    //{{AFX_DATA_INIT(CActionQTEDlg)
    //}}AFX_DATA_INIT
}


void CActionQTEDlg::DoDataExchange(CDataExchange* pDX)
{
    CDialog::DoDataExchange(pDX);
    //{{AFX_DATA_MAP(CActionQTEDlg)
    DDX_Text(pDX, IDC_ACTION_ID, m_uiActionID);
    DDX_Text(pDX, IDC_START_TIME, m_fStartTime);
    DDX_Text(pDX, IDC_TOTAL_FRAMES, m_iTotalFrames);
    DDX_Text(pDX, IDC_QTE_ID, m_uiQTEID);
    DDX_Text(pDX, IDC_QTE_SPEED, m_fSpeed);
    //}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CActionQTEDlg, CDialog)
    //{{AFX_MSG_MAP(CActionQTEDlg)
    ON_BN_CLICKED(IDC_BUTTON_ACTION_OK, OnButtonActionOk)
    ON_BN_CLICKED(IDC_BUTTON_ACTION_CANCEL, OnButtonActionCancel)
    ON_BN_CLICKED(IDC_BUTTON_ACTION_REMOVE, OnButtonActionRemove)
    //}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CActionQTEDlg message handlers

void CActionQTEDlg::OnButtonActionOk() 
{
    // TODO: Add your control notification handler code here
    UpdateData(true);
    CAnmAction *pAction = m_pNode->GetAction();
    CAnmQTE *pQTE = dynamic_cast<CAnmQTE*>(pAction);
    pQTE->SetQTEID(m_uiQTEID);
    pQTE->SetSpeed(m_fSpeed);
    pQTE->SetTotalFrames(m_iTotalFrames);
    EndDialog(0);
}

void CActionQTEDlg::OnButtonActionCancel() 
{
    // TODO: Add your control notification handler code here
    EndDialog(0);
}

void CActionQTEDlg::OnButtonActionRemove() 
{
    // TODO: Add your control notification handler code here
    int nBox = MessageBox(_T("确定是否要删除该事件?"), _T("动画编辑器"), MB_ICONQUESTION | MB_YESNOCANCEL);
    if (IDYES == nBox)
    {
        m_pChannel->DeleteAction(m_pNode->GetAction()->GetActionID());
        EndDialog(-1);
    }
}
