// CWControlBar.cpp : implementation file
//  

#include "stdafx.h"
#include "CWControlBar.h"
#include <afxpriv.h>    // for CDockContext

/////////////////////////////////////////////////////////////////////////////
// CCWControlBar

#define IDC_BUTTON_HIDE 1000
#define IDC_BUTTON_MINI 1001

CCWControlBar::CCWControlBar()
{
    m_sizeMin		= CSize(32, 32);
    m_sizeHorz		= CSize(200, 200);
    m_sizeVert		= CSize(200, 200);
    m_sizeFloat		= CSize(200, 200);
    m_bTracking		= FALSE;
    m_bInRecalcNC	= FALSE;
    m_cxEdge		= 5;
	m_menuID		= 0;
	m_bGripper		= TRUE;
	m_bButtons		= TRUE;
}

CCWControlBar::~CCWControlBar()
{
}

IMPLEMENT_DYNAMIC(CCWControlBar, CControlBar)

BEGIN_MESSAGE_MAP(CCWControlBar, CControlBar)
	//{{AFX_MSG_MAP(CCWControlBar)
	ON_WM_LBUTTONUP()
	ON_WM_MOUSEMOVE()
	ON_WM_SETCURSOR()
	ON_WM_WINDOWPOSCHANGED()
	ON_WM_NCPAINT()
	ON_WM_NCLBUTTONDOWN()
	ON_WM_NCHITTEST()
	ON_WM_NCCALCSIZE()
	ON_WM_LBUTTONDOWN()
	ON_WM_CAPTURECHANGED()
	ON_WM_LBUTTONDBLCLK()
	ON_WM_PAINT()
	ON_WM_CREATE()
	ON_COMMAND(IDC_BUTTON_HIDE, OnButtonClose)
	ON_UPDATE_COMMAND_UI(IDC_BUTTON_HIDE, OnUpdateButtonClose)
	ON_WM_CONTEXTMENU()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CCWControlBar message handlers

void CCWControlBar::OnUpdateCmdUI(CFrameWnd * pTarget, BOOL bDisableIfNoHndler)
{
    UpdateDialogControls(pTarget, bDisableIfNoHndler);
}

BOOL CCWControlBar::Create(CWnd * pParentWnd, UINT nID, LPCTSTR lpszWindowName, CSize sizeDefault, DWORD dwStyle)
{
    ASSERT_VALID(pParentWnd);   // must have a parent
    ASSERT (((dwStyle & CBRS_SIZE_FIXED)   != CBRS_SIZE_FIXED) && 
	    	((dwStyle & CBRS_SIZE_DYNAMIC) != CBRS_SIZE_DYNAMIC));

    // save the style
    SetBarStyle(dwStyle & CBRS_ALL);

    CString wndclass = ::AfxRegisterWndClass(CS_DBLCLKS,
        ::LoadCursor(NULL, IDC_ARROW),
        ::GetSysColorBrush(COLOR_BTNFACE), 0);

    m_sizeHorz = m_sizeVert = m_sizeFloat = sizeDefault;

    dwStyle &= ~CBRS_ALL;
    dwStyle &= WS_VISIBLE | WS_CHILD;
    
	return CWnd::Create(wndclass, lpszWindowName, dwStyle,
		CRect(0,0,0,0), pParentWnd, nID);
}

CSize CCWControlBar::CalcFixedLayout(BOOL bStretch, BOOL bHorz)
{
    CRect rc;

    m_pDockSite->GetControlBar(AFX_IDW_DOCKBAR_TOP)->GetWindowRect(rc);
    int nHorzDockBarWidth = bStretch ? 32767 : rc.Width() + 4;
    m_pDockSite->GetControlBar(AFX_IDW_DOCKBAR_LEFT)->GetWindowRect(rc);
    int nVertDockBarHeight = bStretch ? 32767 : rc.Height() + 4;

    if (bHorz)
        return CSize(nHorzDockBarWidth, m_sizeHorz.cy);
    else
        return CSize(m_sizeVert.cx, nVertDockBarHeight);
}

CSize CCWControlBar::CalcDynamicLayout(int nLength, DWORD dwMode)
{
    if (dwMode & (LM_HORZDOCK | LM_VERTDOCK))
    {
        if (nLength == -1)
            GetDockingFrame()->DelayRecalcLayout();
        return CControlBar::CalcDynamicLayout(nLength,dwMode);
    }

    if (dwMode & LM_MRUWIDTH)
        return m_sizeFloat;

    if (dwMode & LM_COMMIT)
    {
        m_sizeFloat.cx = nLength;
        return m_sizeFloat;
    }

    if (dwMode & LM_LENGTHY)
        return CSize(m_sizeFloat.cx,
            m_sizeFloat.cy = max(m_sizeMin.cy, nLength));
    else
        return CSize(max(m_sizeMin.cx, nLength), m_sizeFloat.cy);
}

void CCWControlBar::OnWindowPosChanged(WINDOWPOS FAR* lpwndpos) 
{
	CControlBar::OnWindowPosChanged(lpwndpos);
	
    // Find on which side are we docked
	m_nDockBarID = GetParent()->GetDlgCtrlID();

    if (m_bInRecalcNC == FALSE)
	{
        m_bInRecalcNC = TRUE;

        // Force recalc the non-client area
        SetWindowPos(NULL, 0, 0, 0, 0,
            SWP_NOMOVE | SWP_NOSIZE |
            SWP_NOACTIVATE | SWP_NOZORDER |
            SWP_FRAMECHANGED);

        m_bInRecalcNC = FALSE;
    }

	if (m_bButtons)
	{
		ASSERT(m_ImageList);

		if (IsFloating()) {
			m_btnClose.ShowWindow(SW_HIDE);
			return;
		}
		else {
			m_btnClose.ShowWindow(SW_SHOW);
		}

		CRect rcClose(GetButtonRect());

		m_btnClose.MoveWindow(rcClose);
	}

	Invalidate();
}

BOOL CCWControlBar::OnSetCursor(CWnd* pWnd, UINT nHitTest, UINT message) 
{
    if ((nHitTest != HTSIZE) || m_bTracking)
        return CControlBar::OnSetCursor(pWnd, nHitTest, message);

#if defined(MFCXLIB_STATIC) 
	HINSTANCE hInst = AfxFindResourceHandle(
			MAKEINTRESOURCE(AFX_IDC_VSPLITBAR), RT_GROUP_CURSOR);

    if (IsHorzDocked())
        ::SetCursor(::LoadCursor(hInst, MAKEINTRESOURCE(AFX_IDC_VSPLITBAR)));
    else
        ::SetCursor(::LoadCursor(hInst, MAKEINTRESOURCE(AFX_IDC_HSPLITBAR)));
#else
    if (IsHorzDocked())
        ::SetCursor(::LoadCursor(NULL, IDC_SIZENS));
    else
        ::SetCursor(::LoadCursor(NULL, IDC_SIZEWE));
#endif
    return TRUE;
}

BOOL CCWControlBar::IsHorzDocked() const
{
    return (m_nDockBarID == AFX_IDW_DOCKBAR_TOP ||
        m_nDockBarID == AFX_IDW_DOCKBAR_BOTTOM);
}

BOOL CCWControlBar::IsVertDocked() const
{
    return (m_nDockBarID == AFX_IDW_DOCKBAR_LEFT ||
        m_nDockBarID == AFX_IDW_DOCKBAR_RIGHT);
}

void CCWControlBar::OnNcCalcSize(BOOL bCalcValidRects, NCCALCSIZE_PARAMS FAR* lpncsp) 
{
    // Compute the rectangle of the mobile edge
    GetWindowRect(m_rectBorder);
    m_rectBorder.OffsetRect(-m_rectBorder.left, -m_rectBorder.top);
    m_rectBorder.DeflateRect(1,1);
    
    CRect rcWnd = lpncsp->rgrc[0];
    DWORD dwBorderStyle = m_dwStyle | CBRS_BORDER_ANY;

    switch (m_nDockBarID)
    {
    case AFX_IDW_DOCKBAR_TOP:
		{
			dwBorderStyle &= ~CBRS_BORDER_BOTTOM;
			rcWnd.DeflateRect(2, 2, 2, m_cxEdge + 2);
			m_rectBorder.top = m_rectBorder.bottom - m_cxEdge;
			break;
		}
    case AFX_IDW_DOCKBAR_BOTTOM:
		{
			dwBorderStyle &= ~CBRS_BORDER_TOP;
			rcWnd.DeflateRect(2, m_cxEdge + 2, 2, 2);
			m_rectBorder.bottom = m_rectBorder.top + m_cxEdge;
			lpncsp->rgrc[0].left += 10;
			break;
		}
    case AFX_IDW_DOCKBAR_LEFT:
		{
			dwBorderStyle &= ~CBRS_BORDER_RIGHT;
			rcWnd.DeflateRect(2, 2, m_cxEdge + 2, 6);
			m_rectBorder.left = m_rectBorder.right - m_cxEdge;
			break;
		}
    case AFX_IDW_DOCKBAR_RIGHT:
		{
			dwBorderStyle &= ~CBRS_BORDER_LEFT;
			rcWnd.DeflateRect(m_cxEdge + 2, 2, 2, 6);
			m_rectBorder.right = m_rectBorder.left + m_cxEdge;
			break;
		}
    default:
		{
			m_rectBorder.SetRectEmpty();
			break;
		}
    }

    lpncsp->rgrc[0] = rcWnd;

    SetBarStyle(dwBorderStyle);
}

void CCWControlBar::OnPaint() 
{
	CPaintDC dc(this); // device context for painting
	DrawGripper(&dc);
}

void CCWControlBar::OnNcPaint() 
{
    // get window DC that is clipped to the non-client area
    CWindowDC dc(this);

	CRect rectWindow;
	GetWindowRect(rectWindow);
	ScreenToClient(rectWindow);

	CRect rectClient;
	GetClientRect(rectClient);
	rectClient.OffsetRect(-rectWindow.left, -rectWindow.top);
	dc.ExcludeClipRect(rectClient);
	
    // draw borders in non-client area
	rectWindow.OffsetRect(-rectWindow.left, -rectWindow.top);
	DrawBorders(&dc, rectWindow);
	
    // erase parts not drawn
	dc.IntersectClipRect(rectWindow);
	
    // erase NC background the hard way
	dc.FillRect(rectWindow, &CBrush(::GetSysColor(COLOR_BTNFACE)));
	
    // paint the mobile edge
    dc.Draw3dRect(m_rectBorder, ::GetSysColor(COLOR_BTNHIGHLIGHT),
        ::GetSysColor(COLOR_BTNSHADOW));
	
    ReleaseDC(&dc);
}

LRESULT CCWControlBar::OnNcHitTest(CPoint point) 
{
    if (IsFloating())
        return CControlBar::OnNcHitTest(point);

    CRect rc;
    GetWindowRect(rc);
    point.Offset(-rc.left, -rc.top);

    if (m_rectBorder.PtInRect(point))
        return HTSIZE;
    else
        return HTCLIENT;
}

BOOL CCWControlBar::IsFloating()
{
	return (!IsHorzDocked() && !IsVertDocked());
}

void CCWControlBar::StartTracking()
{
    SetCapture();

    // make sure no updates are pending
    RedrawWindow(NULL, NULL, RDW_ALLCHILDREN | RDW_UPDATENOW);
    m_pDockSite->LockWindowUpdate();

    m_ptOld = m_rectBorder.CenterPoint();
    m_bTracking = TRUE;
    
    m_rectTracker = m_rectBorder;
    if (!IsHorzDocked()) m_rectTracker.bottom -= 4;

    OnInvertTracker(m_rectTracker);
}

void CCWControlBar::StopTracking(BOOL bAccept)
{
    OnInvertTracker(m_rectTracker);
    m_pDockSite->UnlockWindowUpdate();
    m_bTracking = FALSE;
    ReleaseCapture();
    
    if (!bAccept)
		return;

    int maxsize, minsize, newsize;
    CRect rcc;
    m_pDockSite->GetClientRect(rcc);

    newsize = IsHorzDocked() ? m_sizeHorz.cy : m_sizeVert.cx;
    maxsize = newsize + (IsHorzDocked() ? rcc.Height() : rcc.Width());
    minsize = IsHorzDocked() ? m_sizeMin.cy : m_sizeMin.cx;

    CPoint point = m_rectTracker.CenterPoint();
    switch (m_nDockBarID)
    {
    case AFX_IDW_DOCKBAR_TOP:
		{
			newsize += point.y - m_ptOld.y;
			break;
		}
    case AFX_IDW_DOCKBAR_BOTTOM:
		{
			newsize += -point.y + m_ptOld.y;
			break;
		}
    case AFX_IDW_DOCKBAR_LEFT:
		{
			newsize += point.x - m_ptOld.x;
			break;
		}
    case AFX_IDW_DOCKBAR_RIGHT:
		{
			newsize += -point.x + m_ptOld.x;
			break;
		}
    }

    newsize = max(minsize, min(maxsize, newsize));

    if (IsHorzDocked())
        m_sizeHorz.cy = newsize;
    else
        m_sizeVert.cx = newsize;

    m_pDockSite->DelayRecalcLayout();
}

void CCWControlBar::OnInvertTracker(const CRect &rect)
{
    ASSERT_VALID(this);
    ASSERT(!rect.IsRectEmpty());
    ASSERT(m_bTracking);

    CRect rct = rect, rcc, rcf;
    GetWindowRect(rcc);
    m_pDockSite->GetWindowRect(rcf);

    rct.OffsetRect(rcc.left - rcf.left, rcc.top - rcf.top);
    rct.DeflateRect(1, 1);

    CDC *pDC = m_pDockSite->GetDCEx(NULL,
        DCX_WINDOW|DCX_CACHE|DCX_LOCKWINDOWUPDATE);

    CBrush* pBrush = CDC::GetHalftoneBrush();
    HBRUSH hOldBrush = NULL;
    if (pBrush != NULL)
        hOldBrush = (HBRUSH)SelectObject(pDC->m_hDC, pBrush->m_hObject);

    pDC->PatBlt(rct.left, rct.top, rct.Width(), rct.Height(), PATINVERT);

    if (hOldBrush != NULL)
        SelectObject(pDC->m_hDC, hOldBrush);

    m_pDockSite->ReleaseDC(pDC);
}

void CCWControlBar::OnCaptureChanged(CWnd *pWnd) 
{
    if (m_bTracking && pWnd != this)
        StopTracking(FALSE); // cancel tracking
	
	CControlBar::OnCaptureChanged(pWnd);
}

void CCWControlBar::OnNcLButtonDown(UINT nHitTest, CPoint point) 
{
    if (m_bTracking)
		return;
    
    if ((nHitTest == HTSIZE) && !IsFloating())
        StartTracking();
    else    
		CControlBar::OnNcLButtonDown(nHitTest, point);
}

void CCWControlBar::OnMouseMove(UINT nFlags, CPoint point) 
{
    if (IsFloating() || !m_bTracking) {
        CControlBar::OnMouseMove(nFlags, point);
        return;
    }

    CPoint cpt = m_rectTracker.CenterPoint();
    ClientToWnd(point);

    if (IsHorzDocked()) {
        if (cpt.y != point.y) {
            OnInvertTracker(m_rectTracker);
            m_rectTracker.OffsetRect(0, point.y - cpt.y);
            OnInvertTracker(m_rectTracker);
        }
    }

    else {
        if (cpt.x != point.x) {
            OnInvertTracker(m_rectTracker);
            m_rectTracker.OffsetRect(point.x - cpt.x, 0);
            OnInvertTracker(m_rectTracker);
        }
    }
}

void CCWControlBar::OnLButtonDown(UINT nFlags, CPoint point) 
{
    if (m_pDockBar != NULL)
    {
        // start the drag
        ASSERT(m_pDockContext != NULL);
        //ClientToScreen(&point);
        //m_pDockContext->StartDrag(point);
    }
    else
		CControlBar::OnLButtonDown(nFlags, point);
}

void CCWControlBar::OnLButtonUp(UINT nFlags, CPoint point) 
{
    if (!m_bTracking)
        CControlBar::OnLButtonUp(nFlags, point);
    else
    {
        ClientToWnd(point);
        StopTracking(TRUE);
    }
}

void CCWControlBar::OnLButtonDblClk(UINT nFlags, CPoint point) 
{
    if (m_pDockBar != NULL)
    {
        // toggle docking
        ASSERT(m_pDockContext != NULL);
        GetDockingFrame()->ShowControlBar(this, FALSE, FALSE);
        //m_pDockContext->ToggleDocking();
    }
    else
		CControlBar::OnLButtonDblClk(nFlags, point);
}

CPoint& CCWControlBar::ClientToWnd(CPoint &point)
{
    point.Offset(2, 2);

    if (m_nDockBarID == AFX_IDW_DOCKBAR_BOTTOM)
        point.y += m_cxEdge;
    else if (m_nDockBarID == AFX_IDW_DOCKBAR_RIGHT)
        point.x += m_cxEdge;

    return point;
}

CRect CCWControlBar::GetButtonRect()
{
	CRect pRect;
	GetClientRect(pRect);
	pRect.OffsetRect(-pRect.left,-pRect.top);

	if(IsHorzDocked()) {
		pRect.top	 += 3;
		pRect.bottom = pRect.top+12;
		pRect.left   += 2;
		pRect.right  = pRect.left+12;
	}
	else
	{
		pRect.right -= 3;
		pRect.left   = pRect.right-12;
		pRect.top   += 3;
		pRect.bottom = pRect.top+12;
	}
	return pRect;
}

CRect CCWControlBar::GetGripperRect()
{
	CRect pRect;
	GetClientRect(pRect);
	pRect.OffsetRect(-pRect.left,-pRect.top);

	if(IsHorzDocked()) {
		pRect.DeflateRect(3,3);
		pRect.left		+= 1;
		pRect.right		 = pRect.left+3;
		pRect.bottom	-= 1;
		pRect.top		+= 15;
	}
	else {
		pRect.DeflateRect(4,4);
        pRect.left      += 3;
		pRect.top		+= 2;
		pRect.bottom	 = pRect.top+3;
		pRect.right		-= 15;
	}

	return pRect;
}

void CCWControlBar::DrawGripper(CDC* pDC)
{
	if (IsFloating())
		return;

	if (m_bGripper)
	{
		// draw the gripper.
		CRect pRect(GetGripperRect());
		pDC->Draw3dRect( pRect, ::GetSysColor(COLOR_BTNHIGHLIGHT),
			::GetSysColor(COLOR_BTNSHADOW) );
		
		if(IsHorzDocked())
			pRect.OffsetRect(4,0);
		else
			pRect.OffsetRect(0,4);
		
		pDC->Draw3dRect( pRect, ::GetSysColor(COLOR_BTNHIGHLIGHT),
			::GetSysColor(COLOR_BTNSHADOW) );
	}
    
	m_pDockSite->RecalcLayout();
}

int CCWControlBar::OnCreate(LPCREATESTRUCT lpCreateStruct) 
{
	if (CControlBar::OnCreate(lpCreateStruct) == -1)
		return -1;
	
	if (m_bButtons)
	{
		ASSERT(m_ImageList);

		if(!m_btnClose.Create(NULL, WS_CHILD | WS_VISIBLE | WS_TABSTOP |
			BS_NOTIFY | BS_OWNERDRAW | BS_ICON,
			CRect(0,0,0,0), this, IDC_BUTTON_HIDE ))
		{
			TRACE0("Unable to create CCWControlBar close button\n");
			return -1;
		}

		m_btnClose.DisableFlatLook();

		m_btnClose.SetIcon(m_ImageList->ExtractIcon(0),CSize(13,13));

		// Create the ToolTip control.
		m_ToolTip.Create(this);
		m_ToolTip.Activate(TRUE);
		
		m_ToolTip.AddTool (&m_btnClose, _T("Hide Docked Window"));
	}
	
	return 0;
}

CImageList* CCWControlBar::SetBtnImageList(CImageList *pImageList)
{
	CImageList* pPrevList = m_ImageList;
	m_ImageList = pImageList;
	return pPrevList;
}

void CCWControlBar::OnButtonClose()
{
	GetDockingFrame()->ShowControlBar(this, FALSE, FALSE);
}

void CCWControlBar::OnUpdateButtonClose(CCmdUI* pCmdUI)
{
	pCmdUI->Enable(true);
}

BOOL CCWControlBar::PreTranslateMessage(MSG* pMsg) 
{
	if (m_bButtons)
		m_ToolTip.RelayEvent(pMsg);
	return CControlBar::PreTranslateMessage(pMsg);
}

void CCWControlBar::SetMenuID(UINT nID)
{
	m_menuID = nID;
}

UINT CCWControlBar::GetMenuID()
{
	return m_menuID;
}

void CCWControlBar::OnContextMenu(CWnd* /*pWnd*/, CPoint point) 
{
	// if no menu, just return.
	if (m_menuID == 0 ) {
		TRACE0("No control bar menu defined.\n");
		return;
	}

	if (point.x == -1 && point.y == -1)
	{
		//keystroke invocation
		CRect rect;
		GetClientRect(rect);
		ClientToScreen(rect);
		
		point = rect.TopLeft();
		point.Offset(5, 5);
	}
	
	CMenu menu;
	VERIFY(menu.LoadMenu(m_menuID));
	
	CMenu* pPopup = menu.GetSubMenu(0);
	ASSERT(pPopup != NULL);
	CWnd* pWndPopupOwner = this;
	
	while (pWndPopupOwner->GetStyle() & WS_CHILD)
		pWndPopupOwner = pWndPopupOwner->GetParent();
	
	pPopup->TrackPopupMenu(TPM_LEFTALIGN | TPM_RIGHTBUTTON, point.x, point.y,
		pWndPopupOwner);
}
