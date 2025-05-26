// ActionCCDlg.cpp : implementation file
//

#include "stdafx.h"
#include "AnimationEditor.h"
#include "ActionAddSkinDlg.h"
#include "Animator/Animator.h"
#include "Animator/AnmObjectManager.h"
#include "Animator/AnmActionManager.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CActionAddSkinDlg dialog


CActionAddSkinDlg::CActionAddSkinDlg(CWnd* pParent, CTrackChannel *pChannel, CTrackNode *pNode)
: CDialog(CActionAddSkinDlg::IDD, pParent)
{
    m_pChannel = pChannel;
    m_pNode = pNode;
    m_uiObjectID = pNode->GetObjectID();
    m_uiActionID = pNode->GetActionID();
    m_fStartTime = float(pNode->GetStartTime()) / 1000.0f;
    CAnmAction *pAction = m_pNode->GetAction();
    CAnmAddSkin *pAddSkin = dynamic_cast<CAnmAddSkin*>(pAction);
    m_sSkinFileName = pAddSkin->GetSkinPath();
    m_iTotalFrames = pAddSkin->GetTotalFrames();
    //{{AFX_DATA_INIT(CActionAddSkinDlg)
    //}}AFX_DATA_INIT
}


void CActionAddSkinDlg::DoDataExchange(CDataExchange* pDX)
{
    CDialog::DoDataExchange(pDX);
    //{{AFX_DATA_MAP(CActionAddSkinDlg)
    DDX_Text(pDX, IDC_OBJECT_ID, m_uiObjectID);
    DDX_Text(pDX, IDC_ACTION_ID, m_uiActionID);
    DDX_Text(pDX, IDC_START_TIME, m_fStartTime);
    DDX_Text(pDX, IDC_SKIN_FILE_NAME, m_sSkinFileName);
    DDX_Text(pDX, IDC_TOTAL_FRAMES, m_iTotalFrames);
    //}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CActionAddSkinDlg, CDialog)
    //{{AFX_MSG_MAP(CActionAddSkinDlg)
    ON_BN_CLICKED(IDC_BUTTON_SKIN_IMPORT, OnButtonSkinImport)
    ON_BN_CLICKED(IDC_BUTTON_ACTION_REMOVE, OnButtonActionRemove)
    ON_BN_CLICKED(IDC_BUTTON_ACTION_OK, OnButtonActionOk)
    ON_BN_CLICKED(IDC_BUTTON_ACTION_CANCEL, OnButtonActionCancel)
    //}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CActionAddSkinDlg message handlers

void CActionAddSkinDlg::OnButtonSkinImport() 
{
    // TODO: Add your control notification handler code here
    UpdateData(true);
    CFileDialog dlg(TRUE, NULL, NULL,
        OFN_OVERWRITEPROMPT | OFN_NOCHANGEDIR,
        _T("skin file(*.ski)|*.ski||"), NULL);
    CString strDirPath;
    strDirPath.Format(_T("%s"), _T("models\\players"));
    dlg.m_ofn.lpstrInitialDir = strDirPath;
    if (dlg.DoModal() != IDOK)
        return;
    m_sSkinFileName = g_aGetRelativePath(dlg.GetPathName());
    UpdateData(0);
}

void CActionAddSkinDlg::OnButtonActionRemove() 
{
    // TODO: Add your control notification handler code here
    int nBox = MessageBox(_T("确定是否要删除该事件?"), _T("动画编辑器"), MB_ICONQUESTION | MB_YESNOCANCEL);
    if (IDYES == nBox)
    {
        m_pChannel->DeleteAction(m_pNode->GetAction()->GetActionID());
        EndDialog(-1);
    }
}

void CActionAddSkinDlg::OnButtonActionOk() 
{
    // TODO: Add your control notification handler code here
    UpdateData(true);
    CAnmAction *pAction = m_pNode->GetAction();
    CAnmAddSkin *pAddSkin = dynamic_cast<CAnmAddSkin*>(pAction);
    pAddSkin->SetSkinPath(ACString(m_sSkinFileName));
    pAddSkin->SetTotalFrames(m_iTotalFrames);
    EndDialog(0);
}

void CActionAddSkinDlg::OnButtonActionCancel() 
{
    // TODO: Add your control notification handler code here
    EndDialog(0);
}
