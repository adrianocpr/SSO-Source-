// ActionCCDlg.cpp : implementation file
//

#include "stdafx.h"
#include "AnimationEditor.h"
#include "ActionCCDlg.h"
#include "Animator/Animator.h"
#include "Animator/AnmObjectManager.h"
#include "Animator/AnmActionManager.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CActionCCDlg dialog


CActionCCDlg::CActionCCDlg(CWnd* pParent, CTrackChannel *pChannel, CTrackNode *pNode)
	: CDialog(CActionCCDlg::IDD, pParent)
{
    m_pChannel = pChannel;
    m_pNode = pNode;
    m_uiObjectID = pNode->GetObjectID();
    m_uiActionID = pNode->GetActionID();
    m_fStartTime = float(pNode->GetStartTime()) / 1000.0f;
    CAnmAction *pAction = m_pNode->GetAction();
    CAnmCC *pCC = dynamic_cast<CAnmCC*>(pAction);
    m_fStartFactor = pCC->GetStartFactor();
    m_fEndFactor = pCC->GetEndFactor();
    m_sTex1FileName = pCC->GetTex1Path();
    m_sTex2FileName = pCC->GetTex2Path();
	m_iTotalFrames = pCC->GetTotalFrames();
	//{{AFX_DATA_INIT(CActionCCDlg)
	//}}AFX_DATA_INIT
}


void CActionCCDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CActionCCDlg)
    DDX_Text(pDX, IDC_OBJECT_ID, m_uiObjectID);
	DDX_Text(pDX, IDC_ACTION_ID, m_uiActionID);
    DDX_Text(pDX, IDC_START_TIME, m_fStartTime);
	DDX_Text(pDX, IDC_START_FACTOR, m_fStartFactor);
	DDX_Text(pDX, IDC_END_FACTOR, m_fEndFactor);
    DDX_Text(pDX, IDC_TEX1_FILE_NAME, m_sTex1FileName);
    DDX_Text(pDX, IDC_TEX2_FILE_NAME, m_sTex2FileName);
	DDX_Text(pDX, IDC_TOTAL_FRAMES, m_iTotalFrames);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CActionCCDlg, CDialog)
	//{{AFX_MSG_MAP(CActionCCDlg)
    ON_BN_CLICKED(IDC_BUTTON_TEX1_IMPORT, OnButtonTex1Import)
    ON_BN_CLICKED(IDC_BUTTON_TEX2_IMPORT, OnButtonTex2Import)
	ON_BN_CLICKED(IDC_BUTTON_ACTION_REMOVE, OnButtonActionRemove)
	ON_BN_CLICKED(IDC_BUTTON_ACTION_OK, OnButtonActionOk)
	ON_BN_CLICKED(IDC_BUTTON_ACTION_CANCEL, OnButtonActionCancel)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CActionCCDlg message handlers

void CActionCCDlg::OnButtonTex1Import() 
{
    // TODO: Add your control notification handler code here
    UpdateData(true);
    CFileDialog dlg(TRUE, NULL, NULL,
        OFN_OVERWRITEPROMPT | OFN_NOCHANGEDIR,
        _T("dds VT file(*.dds)|*.dds||"), NULL);
    CString strDirPath;
    strDirPath.Format(_T("%s"), _T("shaders\\textures"));
    dlg.m_ofn.lpstrInitialDir = strDirPath;
    if (dlg.DoModal() != IDOK)
        return;
    m_sTex1FileName = g_aGetRelativePath(dlg.GetPathName());
    UpdateData(0);
}

void CActionCCDlg::OnButtonTex2Import() 
{
    // TODO: Add your control notification handler code here
    UpdateData(true);
    CFileDialog dlg(TRUE, NULL, NULL,
        OFN_OVERWRITEPROMPT | OFN_NOCHANGEDIR,
        _T("dds VT file(*.dds)|*.dds||"), NULL);
    CString strDirPath;
    strDirPath.Format(_T("%s"), _T("shaders\\textures"));
    dlg.m_ofn.lpstrInitialDir = strDirPath;
    if (dlg.DoModal() != IDOK)
        return;
    m_sTex2FileName = g_aGetRelativePath(dlg.GetPathName());
    UpdateData(0);
}

void CActionCCDlg::OnButtonActionRemove() 
{
    // TODO: Add your control notification handler code here
    int nBox = MessageBox(_T("确定是否要删除该事件?"), _T("动画编辑器"), MB_ICONQUESTION | MB_YESNOCANCEL);
    if (IDYES == nBox)
    {
        m_pChannel->DeleteAction(m_pNode->GetAction()->GetActionID());
        EndDialog(-1);
    }
}

void CActionCCDlg::OnButtonActionOk() 
{
	// TODO: Add your control notification handler code here
    UpdateData(true);
    CAnmAction *pAction = m_pNode->GetAction();
    CAnmCC *pCC = dynamic_cast<CAnmCC*>(pAction);
    pCC->SetStartFactor(m_fStartFactor);
    pCC->SetEndFactor(m_fEndFactor);
    pCC->SetTex1Path(ACString(m_sTex1FileName));
    pCC->SetTex2Path(ACString(m_sTex2FileName));
    pCC->SetTotalFrames(m_iTotalFrames);
    EndDialog(0);
}

void CActionCCDlg::OnButtonActionCancel() 
{
	// TODO: Add your control notification handler code here
	EndDialog(0);
}
