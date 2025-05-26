#if !defined(AFX_TRACKPANEL_H__FD4FF3C2_B54D_45BD_97D7_F3150395218E__INCLUDED_)
#define AFX_TRACKPANEL_H__FD4FF3C2_B54D_45BD_97D7_F3150395218E__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// TrackPanel.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CTrackPanel form view

#ifndef __AFXEXT_H__
#include <afxext.h>
#endif

#include "TrackRuler.h"
#include "TrackGroup.h"
#include "tinyxml.h"

class CTrackPanel : public CFormView
{
protected:
	CTrackPanel();           // protected constructor used by dynamic creation
	DECLARE_DYNCREATE(CTrackPanel)

// Form Data
public:
	//{{AFX_DATA(CTrackPanel)
	enum { IDD = IDD_TRACK_PANEL };
	//}}AFX_DATA

// Attributes
private:
    CDC m_dcWnd;
    CBitmap			m_bmpWnd;
	CBitmap*		m_pbmpOld;

    DWORD m_dwFrame;
    int m_iSeconds;
    std::vector<CTrackGroup*> m_vGroupList;
    CTrackGroup *m_pSelectGroup;
    CTrackChannel *m_pSelectChannel;
    CTrackNode *m_pSelectNode;
    CScrollBar	m_VScrollBar;
	CScrollBar	m_HScrollBar;
    CTrackRuler m_TrackRuler;
    int m_iRow;
    bool m_bButtonDown;
    CAnmActionChannel *m_pTempChannel;

public:

// Operations
public:
    void SetSeconds(int v);

    int GetSeconds() const;

    void SetRow(int v);

    void CreateGroup();

    void CreateChannel();

    void DeleteGroup(const unsigned int uiID);

    void UpdatePanel();

    bool GoFrame(const unsigned int iFrame);

    void Draw(CDC* pDC);

    CTrackNode* GetSelectedNode();

    void CopyAction(CAnmAction *pAction);
    
    void PasteAction();

    void DeleteAction();

    TiXmlDocument ConvertActionToXML(CAnmAction *pAction);

    CAnmAction* ConvertXMLToAction(TiXmlDocument *pXml);

    void CopyChannel(CAnmActionChannel *pChannel);
    
    void PasteChannel();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTrackPanel)
	public:
	virtual BOOL Create(LPCTSTR lpszClassName, LPCTSTR lpszWindowName, DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID, CCreateContext* pContext = NULL);
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	virtual ~CTrackPanel();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

	// Generated message map functions
	//{{AFX_MSG(CTrackPanel)
	afx_msg void OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar);
	afx_msg void OnVScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar);
    afx_msg void OnMouseMove(UINT nFlags, CPoint point);
    afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
    afx_msg void OnLButtonUp(UINT nFlags, CPoint point);
	afx_msg void OnLButtonDblClk(UINT nFlags, CPoint point);
	afx_msg void OnRButtonDown(UINT nFlags, CPoint point);
	afx_msg void OnRButtonUp(UINT nFlags, CPoint point);
	afx_msg void OnClose();
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	afx_msg void OnButtonNewGroup();
	afx_msg void OnImportGroup();
	afx_msg void OnExportGroup();
    afx_msg void OnButtonNewChannel();
	afx_msg void OnButtonSetFrames();
	afx_msg void OnButtonSetWorldOffset();
	afx_msg void OnUpdateSetWorldOffset(CCmdUI* pCmdUI);
	afx_msg void OnPaint();
	afx_msg void OnDestroy();
	afx_msg BOOL OnEraseBkgnd(CDC* pDC);
	afx_msg void OnAnimationStartTime();
	afx_msg void OnUpdateAnimationStartTime(CCmdUI* pCmdUI);
	afx_msg void OnAnimationEndTime();
	afx_msg void OnUpdateAnimationEndTime(CCmdUI* pCmdUI);
	afx_msg void OnAnimationResetTime();
	afx_msg void OnUpdateAnimationResetTime(CCmdUI* pCmdUI);
	afx_msg void OnSize(UINT nType, int cx, int cy);
	afx_msg BOOL OnMouseWheel(UINT nFlags, short zDelta, CPoint pt);
	afx_msg void OnActionCopy();
	afx_msg void OnUpdateActionCopy(CCmdUI* pCmdUI);
	afx_msg void OnActionDelete();
	afx_msg void OnUpdateActionDelete(CCmdUI* pCmdUI);
	afx_msg void OnActionPaste();
	afx_msg void OnUpdateActionPaste(CCmdUI* pCmdUI);
	afx_msg void OnEditCopy();
	afx_msg void OnEditPaste();
	afx_msg void OnUpdateEditCopy(CCmdUI* pCmdUI);
	afx_msg void OnUpdateEditPaste(CCmdUI* pCmdUI);
	afx_msg void OnMoveActions();
	afx_msg void OnUpdateMoveActions(CCmdUI* pCmdUI);
	afx_msg void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
	afx_msg void OnChannelCopy();
	afx_msg void OnUpdateChannelCopy(CCmdUI* pCmdUI);
	afx_msg void OnChannelPaste();
	afx_msg void OnUpdateChannelPaste(CCmdUI* pCmdUI);
    afx_msg void OnBnClickedButtonGoFrame();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
public:
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TRACKPANEL_H__FD4FF3C2_B54D_45BD_97D7_F3150395218E__INCLUDED_)
