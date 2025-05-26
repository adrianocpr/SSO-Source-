// CActionGodRayDlg.cpp : implementation file
//

#include "stdafx.h"
#include "AnimationEditor.h"
#include "ActionGodRayDlg.h"
#include "Animator/Animator.h"
#include "Animator/AnmObjectManager.h"
#include "Animator/AnmActionManager.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CActionGodRayDlg dialog


CActionGodRayDlg::CActionGodRayDlg(CWnd* pParent, CTrackChannel *pChannel, CTrackNode *pNode)
	: CDialog(CActionGodRayDlg::IDD, pParent)
{
    m_pChannel = pChannel;
    m_pNode = pNode;
    m_uiObjectID = pNode->GetObjectID();
    m_uiActionID = pNode->GetActionID();
    m_fStartTime = float(pNode->GetStartTime()) / 1000.0f;
    CAnmAction *pAction = m_pNode->GetAction();

    CAnmGodRay *pGodRay = dynamic_cast<CAnmGodRay*>(pAction);
    m_fStartDepthRange = pGodRay->GetStartGodRay().fOcclusionDepthRange;
    m_fStartBloomScale = pGodRay->GetStartGodRay().fBloomScale;
    m_fStartBloomThreshold = pGodRay->GetStartGodRay().fBloomThreshold;
    m_fStartBlendThreshold = pGodRay->GetStartGodRay().fScreenBlendThreshold;
    m_fStartDarkness = pGodRay->GetStartGodRay().fOcclusionDarkness;
    m_fStartVisibleAngle = pGodRay->GetStartGodRay().fVisibleAngle;
    A3DVECTOR3 vColor = pGodRay->GetStartGodRay().vBloomTintColor;
    unsigned char R = (unsigned char)(vColor.x * 255);
    unsigned char G = (unsigned char)(vColor.y * 255);
    unsigned char B = (unsigned char)(vColor.z * 255);
    m_uiStartColor = R | (G << 8) | (B << 16);
    m_fEndDepthRange = pGodRay->GetEndGodRay().fOcclusionDepthRange;
    m_fEndBloomScale = pGodRay->GetEndGodRay().fBloomScale;
    m_fEndBloomThreshold = pGodRay->GetEndGodRay().fBloomThreshold;
    m_fEndBlendThreshold = pGodRay->GetEndGodRay().fScreenBlendThreshold;
    m_fEndDarkness = pGodRay->GetEndGodRay().fOcclusionDarkness;
    m_fEndVisibleAngle = pGodRay->GetEndGodRay().fVisibleAngle;
    vColor = pGodRay->GetEndGodRay().vBloomTintColor;
    R = (unsigned char)(vColor.x * 255);
    G = (unsigned char)(vColor.y * 255);
    B = (unsigned char)(vColor.z * 255);
    m_uiEndColor = R | (G << 8) | (B << 16);
    m_iTotalFrames = pGodRay->GetTotalFrames();
	//{{AFX_DATA_INIT(CActionGodRayDlg)
	//}}AFX_DATA_INIT
}


void CActionGodRayDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CActionGodRayDlg)
    DDX_Text(pDX, IDC_OBJECT_ID, m_uiObjectID);
	DDX_Text(pDX, IDC_ACTION_ID, m_uiActionID);
    DDX_Text(pDX, IDC_START_TIME, m_fStartTime);
	DDX_Text(pDX, IDC_START_DEPTH_RANGE, m_fStartDepthRange);
	DDX_Text(pDX, IDC_START_BLOOM_SCALE, m_fStartBloomScale);
	DDX_Text(pDX, IDC_START_BLOOM_THRESHOLD, m_fStartBloomThreshold);
	DDX_Text(pDX, IDC_START_BLEND_THRESHOLD, m_fStartBlendThreshold);
	DDX_Text(pDX, IDC_START_DARKNESS, m_fStartDarkness);
	DDX_Text(pDX, IDC_START_VISIBLE_ANGLE, m_fStartVisibleAngle);
	DDX_Text(pDX, IDC_END_DEPTH_RANGE, m_fEndDepthRange);
	DDX_Text(pDX, IDC_END_BLOOM_SCALE, m_fEndBloomScale);
	DDX_Text(pDX, IDC_END_BLOOM_THRESHOLD, m_fEndBloomThreshold);
	DDX_Text(pDX, IDC_END_BLEND_THRESHOLD, m_fEndBlendThreshold);
	DDX_Text(pDX, IDC_END_DARKNESS, m_fEndDarkness);
	DDX_Text(pDX, IDC_END_VISIBLE_ANGLE, m_fEndVisibleAngle);
	DDX_Text(pDX, IDC_TOTAL_FRAMES, m_iTotalFrames);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CActionGodRayDlg, CDialog)
	//{{AFX_MSG_MAP(CActionGodRayDlg)
	ON_BN_CLICKED(IDC_BUTTON_ACTION_REMOVE, OnButtonActionRemove)
	ON_BN_CLICKED(IDC_BUTTON_ACTION_OK, OnButtonActionOk)
	ON_BN_CLICKED(IDC_BUTTON_ACTION_CANCEL, OnButtonActionCancel)
    ON_BN_CLICKED(IDC_BUTTON_CHOOSE_START_COLOR, OnBnClickedButtonChooseStartColor)
    ON_BN_CLICKED(IDC_BUTTON_CHOOSE_END_COLOR, OnBnClickedButtonChooseEndColor)
    ON_WM_DRAWITEM()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CActionGodRayDlg message handlers

void CActionGodRayDlg::OnButtonActionRemove() 
{
    // TODO: Add your control notification handler code here
    int nBox = MessageBox(_T("确定是否要删除该事件?"), _T("动画编辑器"), MB_ICONQUESTION | MB_YESNOCANCEL);
    if (IDYES == nBox)
    {
        m_pChannel->DeleteAction(m_pNode->GetAction()->GetActionID());
        EndDialog(-1);
    }
}

void CActionGodRayDlg::OnButtonActionOk() 
{
	// TODO: Add your control notification handler code here
    UpdateData(true);
    CAnmAction *pAction = m_pNode->GetAction();
    CAnmGodRay *pGodRay = dynamic_cast<CAnmGodRay*>(pAction);
    A3DPOST_EFFECT_GODRAY_PARAM godRay;
    godRay.fOcclusionDepthRange = m_fStartDepthRange;
    godRay.fBloomScale = m_fStartBloomScale;
    godRay.fBloomThreshold = m_fStartBloomThreshold;
    godRay.fScreenBlendThreshold = m_fStartBlendThreshold;
    godRay.vBloomTintColor = A3DVECTOR3(float(m_uiStartColor & 0xFF)/255.0f, float((m_uiStartColor & 0xFF00) >> 8)/255.0f, float((m_uiStartColor & 0xFF0000) >> 16)/255.0f);
    godRay.fOcclusionDarkness = m_fStartDarkness;
    godRay.fVisibleAngle = m_fStartVisibleAngle;
    pGodRay->SetStartGodRay(godRay);
    godRay.fOcclusionDepthRange = m_fEndDepthRange;
    godRay.fBloomScale = m_fEndBloomScale;
    godRay.fBloomThreshold = m_fEndBloomThreshold;
    godRay.fScreenBlendThreshold = m_fEndBlendThreshold;
    godRay.vBloomTintColor = A3DVECTOR3(float(m_uiEndColor & 0xFF)/255.0f, float((m_uiEndColor & 0xFF00) >> 8)/255.0f, float((m_uiEndColor & 0xFF0000) >> 16)/255.0f);
    godRay.fOcclusionDarkness = m_fEndDarkness;
    godRay.fVisibleAngle = m_fEndVisibleAngle;
    pGodRay->SetEndGodRay(godRay);
    pGodRay->SetTotalFrames(m_iTotalFrames);
    EndDialog(0);
}

void CActionGodRayDlg::OnButtonActionCancel() 
{
	// TODO: Add your control notification handler code here
	EndDialog(0);
}

void CActionGodRayDlg::OnBnClickedButtonChooseStartColor()
{
    // TODO: Add your control notification handler code here
    CColorDialog dlg;
    if (dlg.DoModal() == IDOK)
    {
        m_uiStartColor = dlg.GetColor();
        m_uiStartColor &= 0x00FFFFFF;
        InvalidateRect(NULL);
    }
}

void CActionGodRayDlg::OnBnClickedButtonChooseEndColor()
{
    // TODO: Add your control notification handler code here
    CColorDialog dlg;
    if (dlg.DoModal() == IDOK)
    {
        m_uiEndColor = dlg.GetColor();
        m_uiEndColor &= 0x00FFFFFF;
        InvalidateRect(NULL);
    }
}

void CActionGodRayDlg::OnDrawItem(int nIDCtl, LPDRAWITEMSTRUCT lpDrawItemStruct) 
{
    // TODO: Add your message handler code here and/or call default

    if (nIDCtl == IDC_BUTTON_CHOOSE_START_COLOR)
    {
        CRect rc;
        ::GetClientRect(lpDrawItemStruct->hwndItem, rc);
        CBrush brush(m_uiStartColor);
        HGDIOBJ hOldBrush = SelectObject(lpDrawItemStruct->hDC, brush);
        Rectangle(lpDrawItemStruct->hDC, rc.left, rc.top, rc.right, rc.bottom);
        SelectObject( lpDrawItemStruct->hDC, hOldBrush);
    }
    if (nIDCtl == IDC_BUTTON_CHOOSE_END_COLOR)
    {
        CRect rc;
        ::GetClientRect(lpDrawItemStruct->hwndItem, rc);
        CBrush brush(m_uiEndColor);
        HGDIOBJ hOldBrush = SelectObject(lpDrawItemStruct->hDC, brush);
        Rectangle(lpDrawItemStruct->hDC, rc.left, rc.top, rc.right, rc.bottom);
        SelectObject( lpDrawItemStruct->hDC, hOldBrush);
    }
    else
    {
        CDialog::OnDrawItem(nIDCtl, lpDrawItemStruct);
    }
}