// ActionWarpDlg.cpp : implementation file
//

#include "stdafx.h"
#include "AnimationEditor.h"
#include "ActionWarpDlg.h"
#include "Animator/Animator.h"
#include "Animator/AnmObjectManager.h"
#include "Animator/AnmActionManager.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CActionWarpDlg dialog


CActionWarpDlg::CActionWarpDlg(CWnd* pParent, CTrackChannel *pChannel, CTrackNode *pNode)
	: CDialog(CActionWarpDlg::IDD, pParent)
{
    m_pChannel = pChannel;
    m_pNode = pNode;
    m_uiObjectID = pNode->GetObjectID();
    m_uiActionID = pNode->GetActionID();
    m_fStartTime = float(pNode->GetStartTime()) / 1000.0f;
    CAnmAction *pAction = m_pNode->GetAction();
    CAnmWarp *pWarp = dynamic_cast<CAnmWarp*>(pAction);
    m_fStartScale = pWarp->GetStartScale();
    m_fEndScale = pWarp->GetEndScale();
    m_fStartSpeed = pWarp->GetStartSpeed();
    m_fEndSpeed = pWarp->GetEndSpeed();
    m_bEnableMask = pWarp->GetEnableMask();
    m_sMaskFileName = pWarp->GetMaskPath();
	m_iTotalFrames = pWarp->GetTotalFrames();
	//{{AFX_DATA_INIT(CActionWarpDlg)
	//}}AFX_DATA_INIT
}


void CActionWarpDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CActionWarpDlg)
    DDX_Text(pDX, IDC_OBJECT_ID, m_uiObjectID);
	DDX_Text(pDX, IDC_ACTION_ID, m_uiActionID);
    DDX_Text(pDX, IDC_START_TIME, m_fStartTime);
	DDX_Text(pDX, IDC_START_SCALE, m_fStartScale);
	DDX_Text(pDX, IDC_END_SCALE, m_fEndScale);
	DDX_Text(pDX, IDC_START_SPEED, m_fStartSpeed);
	DDX_Text(pDX, IDC_END_SPEED, m_fEndSpeed);
    DDX_Check(pDX, IDC_ENABLE_MASK, m_bEnableMask);
    DDX_Text(pDX, IDC_MASK_FILE_NAME, m_sMaskFileName);
	DDX_Text(pDX, IDC_TOTAL_FRAMES, m_iTotalFrames);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CActionWarpDlg, CDialog)
	//{{AFX_MSG_MAP(CActionWarpDlg)
    ON_BN_CLICKED(IDC_BUTTON_MASK_IMPORT, OnButtonMaskImport)
	ON_BN_CLICKED(IDC_BUTTON_ACTION_REMOVE, OnButtonActionRemove)
	ON_BN_CLICKED(IDC_BUTTON_ACTION_OK, OnButtonActionOk)
	ON_BN_CLICKED(IDC_BUTTON_ACTION_CANCEL, OnButtonActionCancel)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CActionWarpDlg message handlers

void CActionWarpDlg::OnButtonMaskImport()
{
    // TODO: Add your control notification handler code here
    UpdateData(true);
    if (m_bEnableMask)
    {
        CFileDialog dlg(TRUE, NULL, NULL,
            OFN_OVERWRITEPROMPT | OFN_NOCHANGEDIR,
            _T("8bit file(*.*)|*.*||"), NULL);
        CString strDirPath;
        strDirPath.Format(_T("%s"), _T("shaders\\textures"));
        dlg.m_ofn.lpstrInitialDir = strDirPath;
        if (dlg.DoModal() != IDOK)
            return;
        m_sMaskFileName = g_aGetRelativePath(dlg.GetPathName());
    }
    UpdateData(0);
}

void CActionWarpDlg::OnButtonActionRemove() 
{
    // TODO: Add your control notification handler code here
    int nBox = MessageBox(_T("确定是否要删除该事件?"), _T("动画编辑器"), MB_ICONQUESTION | MB_YESNOCANCEL);
    if (IDYES == nBox)
    {
        m_pChannel->DeleteAction(m_pNode->GetAction()->GetActionID());
        EndDialog(-1);
    }
}

void CActionWarpDlg::OnButtonActionOk() 
{
	// TODO: Add your control notification handler code here
    UpdateData(true);
    CAnmAction *pAction = m_pNode->GetAction();
    CAnmWarp *pWarp = dynamic_cast<CAnmWarp*>(pAction);
    pWarp->SetStartScale(m_fStartScale);
    pWarp->SetEndScale(m_fEndScale);
    pWarp->SetStartSpeed(m_fStartSpeed);
    pWarp->SetEndSpeed(m_fEndSpeed);
    pWarp->SetEnableMask(m_bEnableMask ? true : false);
    pWarp->SetMaskPath(ACString(m_sMaskFileName));
    pWarp->SetTotalFrames(m_iTotalFrames);
    EndDialog(0);
}

void CActionWarpDlg::OnButtonActionCancel() 
{
	// TODO: Add your control notification handler code here
	EndDialog(0);
}
