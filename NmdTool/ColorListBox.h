#pragma once


// CColorListBox

class CColorListBox : public CListBox
{
	DECLARE_DYNAMIC(CColorListBox)

public:
	CColorListBox();
	virtual ~CColorListBox();

	int AddString( LPCTSTR lpszItem, COLORREF rgb);
	int InsertString( int nIndex, LPCTSTR lpszItem, COLORREF rgb);

	virtual void DrawItem(LPDRAWITEMSTRUCT lpDrawItemStruct);

protected:
	DECLARE_MESSAGE_MAP()
};


