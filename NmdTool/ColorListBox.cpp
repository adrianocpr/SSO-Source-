// ColorListBox.cpp : implementation file
//

#include "stdafx.h"
#include "SDSNmdTool.h"
#include "ColorListBox.h"


// CColorListBox

IMPLEMENT_DYNAMIC(CColorListBox, CListBox)

CColorListBox::CColorListBox()
{

}

CColorListBox::~CColorListBox()
{
}


BEGIN_MESSAGE_MAP(CColorListBox, CListBox)
END_MESSAGE_MAP()



// CColorListBox message handlers

void CColorListBox::DrawItem(LPDRAWITEMSTRUCT lpdis) 
{
	if (lpdis->itemID < 0 || lpdis->itemID >= GetCount())
		return; 

	COLORREF cvText;
	COLORREF cvBack;
	CString itemString;

	if ((lpdis->itemState & ODS_SELECTED) &&    // if item has been selected
		(lpdis->itemAction & (ODA_SELECT | ODA_DRAWENTIRE)))
		DrawFocusRect(lpdis->hDC, &lpdis->rcItem); 


	if (!(lpdis->itemState & ODS_SELECTED) &&    // if item has been deselected
		(lpdis->itemAction & ODA_SELECT))
		DrawFocusRect(lpdis->hDC, &lpdis->rcItem); 


	if(lpdis->itemData)        // if color information is present
		cvText = SetTextColor(lpdis->hDC, lpdis->itemData);
	else     // if no color information, use default system colors
		cvText = SetTextColor(lpdis->hDC, GetSysColor((lpdis->itemState & ODS_SELECTED) ? COLOR_HIGHLIGHTTEXT : COLOR_WINDOWTEXT)); 

	// always use system colors for background
	cvBack = SetBkColor(lpdis->hDC, GetSysColor((lpdis->itemState & ODS_SELECTED) ? COLOR_HIGHLIGHT : COLOR_WINDOW)); 

	// get and display item text
	GetText(lpdis->itemID, itemString );
	DrawText(lpdis->hDC, itemString, -1, &lpdis->rcItem, DT_LEFT | DT_SINGLELINE);

	// restore DC colors
	SetTextColor(lpdis->hDC, cvText); 
	SetBkColor(lpdis->hDC, cvBack); 
}

int CColorListBox::AddString( LPCTSTR lpszItem,COLORREF rgb )
{
	int item = CListBox::AddString(lpszItem);
	CString itemString;
	int xx = GetTextLen(item);
	GetText(item, itemString );
    if(item >=0)
        SetItemData(item,rgb);
    return item;
}

int CColorListBox::InsertString( int nIndex, LPCTSTR lpszItem, COLORREF rgb)
{
    int item = ((CListBox*)this)->InsertString(nIndex,lpszItem);
    if(item >=0)
        SetItemData(item,rgb);
    return item;

}