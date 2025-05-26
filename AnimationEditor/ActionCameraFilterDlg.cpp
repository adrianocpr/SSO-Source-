// ActionCameraFilterDlg.cpp : implementation file
//

#include "stdafx.h"
#include "AnimationEditor.h"
#include "ActionCameraFilterDlg.h"
#include "Animator/Animator.h"
#include "Animator/AnmObjectManager.h"
#include "Animator/AnmActionManager.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CActionScaleDlg dialog


CActionCameraFilterDlg::CActionCameraFilterDlg(CWnd* pParent, CTrackChannel *pChannel, CTrackNode *pNode)
	: CDialog(CActionCameraFilterDlg::IDD, pParent)
{
    m_pChannel = pChannel;
    m_pNode = pNode;
    m_uiObjectID = pNode->GetObjectID();
    m_uiActionID = pNode->GetActionID();
    m_fStartTime = float(pNode->GetStartTime()) / 1000.0f;
    CAnmAction *pAction = m_pNode->GetAction();
    CAnmCameraFilter *pCameraFilter = dynamic_cast<CAnmCameraFilter*>(pAction);
    m_uiColor = (pCameraFilter->GetColor()) & 0x00FFFFFF;
    m_uiColor = ((m_uiColor & 0xFF) << 16) | (m_uiColor & 0xFF00) | ((m_uiColor & 0xFF0000) >> 16);
    unsigned int eFilterType = pCameraFilter->GetFilterType();
    if (eFilterType == CAnmCameraFilter::FILTER_TYPE_SOLID)
    {
        m_sFilterType = "��ɫ";
    }
    else if (eFilterType == CAnmCameraFilter::FILTER_TYPE_TWEENING_SOLID)
    {
        m_sFilterType = "���䴿ɫ";
    }
    else if (eFilterType == CAnmCameraFilter::FILTER_TYPE_TWEENING_TRANSPARENT)
    {
        m_sFilterType = "����͸��";
    }
    else if (eFilterType == CAnmCameraFilter::FILTER_TYPE_SLOW_BLACK_WHITE)
    {
        m_sFilterType = "�����ڰ�";
    }
    else if (eFilterType == CAnmCameraFilter::FILTER_TYPE_FAST_BLACK_WHITE)
    {
        m_sFilterType = "���ٺڰ�";
    }
    m_fTransparent = pCameraFilter->GetTransparent();
	m_iTotalFrames = pCameraFilter->GetTotalFrames();
    
	//{{AFX_DATA_INIT(CActionCameraFilterDlg)
	//}}AFX_DATA_INIT
}


void CActionCameraFilterDlg::DoDataExchange(CDataExchange* pDX)
{
    CDialog::DoDataExchange(pDX);
    //{{AFX_DATA_MAP(CActionCameraFilterDlg)
    DDX_Text(pDX, IDC_OBJECT_ID, m_uiObjectID);
    DDX_Text(pDX, IDC_ACTION_ID, m_uiActionID);
    DDX_Text(pDX, IDC_START_TIME, m_fStartTime);
    DDX_Text(pDX, IDC_TOTAL_FRAMES, m_iTotalFrames);
	DDX_CBString(pDX, IDC_FILTER_TYPE, m_sFilterType);
	DDX_Text(pDX, IDC_TRANSPARENT, m_fTransparent);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CActionCameraFilterDlg, CDialog)
    //{{AFX_MSG_MAP(CActionCameraFilterDlg)
    ON_BN_CLICKED(IDC_BUTTON_ACTION_REMOVE, OnButtonActionRemove)
    ON_BN_CLICKED(IDC_BUTTON_ACTION_OK, OnButtonActionOk)
    ON_BN_CLICKED(IDC_BUTTON_ACTION_CANCEL, OnButtonActionCancel)
    ON_BN_CLICKED(IDC_BUTTON_CHOOSE_COLOR, OnButtonChooseColor)
	ON_WM_DRAWITEM()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CActionScaleDlg message handlers

void CActionCameraFilterDlg::OnButtonActionRemove() 
{
    // TODO: Add your control notification handler code here
    int nBox = MessageBox(_T("ȷ���Ƿ�Ҫɾ�����¼�?"), _T("�����༭��"), MB_ICONQUESTION | MB_YESNOCANCEL);
    if (IDYES == nBox)
    {
        m_pChannel->DeleteAction(m_pNode->GetAction()->GetActionID());
        EndDialog(-1);
    }
}

void CActionCameraFilterDlg::OnButtonActionOk() 
{
    // TODO: Add your control notification handler code here
    UpdateData(true);
    CAnmAction *pAction = m_pNode->GetAction();
    CAnmCameraFilter *pCameraFilter = dynamic_cast<CAnmCameraFilter*>(pAction);

    pCameraFilter->SetColor(0xFF000000 | ((m_uiColor & 0xFF) << 16) | (m_uiColor & 0xFF00) | ((m_uiColor & 0xFF0000) >> 16));

    if (m_sFilterType == "��ɫ")
    {
        pCameraFilter->SetFilterType(CAnmCameraFilter::FILTER_TYPE_SOLID);
    }
    else if (m_sFilterType == "���䴿ɫ")
    {
        pCameraFilter->SetFilterType(CAnmCameraFilter::FILTER_TYPE_TWEENING_SOLID);
    }
    else if (m_sFilterType == "����͸��")
    {
        pCameraFilter->SetFilterType(CAnmCameraFilter::FILTER_TYPE_TWEENING_TRANSPARENT);
    }
    else if (m_sFilterType == "�����ڰ�")
    {
        pCameraFilter->SetFilterType(CAnmCameraFilter::FILTER_TYPE_SLOW_BLACK_WHITE);
    }
    else if (m_sFilterType == "���ٺڰ�")
    {
        pCameraFilter->SetFilterType(CAnmCameraFilter::FILTER_TYPE_FAST_BLACK_WHITE);
    }

    pCameraFilter->SetTransparent(m_fTransparent);
    pCameraFilter->SetTotalFrames(m_iTotalFrames);
    EndDialog(0);
}

void CActionCameraFilterDlg::OnButtonActionCancel() 
{
    // TODO: Add your control notification handler code here
    EndDialog(0);
}

void CActionCameraFilterDlg::OnButtonChooseColor() 
{
	// TODO: Add your control notification handler code here
    CColorDialog dlg;
    if (dlg.DoModal() == IDOK)
    {
        m_uiColor = dlg.GetColor();
        m_uiColor &= 0x00FFFFFF;
        InvalidateRect(NULL);
    }
}

void CActionCameraFilterDlg::OnDrawItem(int nIDCtl, LPDRAWITEMSTRUCT lpDrawItemStruct) 
{
	// TODO: Add your message handler code here and/or call default
	
    if (nIDCtl == IDC_BUTTON_CHOOSE_COLOR)
    {
        CRect rc;
        ::GetClientRect(lpDrawItemStruct->hwndItem, rc);
        CBrush brush(m_uiColor);
        HGDIOBJ hOldBrush = SelectObject(lpDrawItemStruct->hDC, brush);
        Rectangle(lpDrawItemStruct->hDC, rc.left, rc.top, rc.right, rc.bottom);
        SelectObject( lpDrawItemStruct->hDC, hOldBrush);
    }
    else
    {
	    CDialog::OnDrawItem(nIDCtl, lpDrawItemStruct);
    }
}
