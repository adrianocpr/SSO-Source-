
// SDSNmdToolDlg.cpp : implementation file
//

#include "stdafx.h"
#include  <io.h>
#include "SDSNmdTool.h"
#include "SDSNmdToolDlg.h"
#include "sdsNMD.h"
#include "ColorListBox.h"
#include "..\\Common\\ExpTypes.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CSDSNmdToolDlg dialog
#define NMD_TOOL_VERSION _T("1.0")

#define COLOR_WARNING RGB(200,150,0)


CColorListBox* s_pLB = NULL;
void Log(LOGTYPE logType, const char* szBuffer)
{
	if (!s_pLB)
		return;

	COLORREF color = 0;
	switch (logType)
	{
	case LOG_INFO: 
		color = 0;
		break;

	case LOG_WARNING:
		color = COLOR_WARNING;
		break;

	case LOG_ERROR:
		color = RGB(200,0,0);
		break;

	case LOG_SUCCESS:
		color = RGB(50,200,0);
		break;
	}

#ifdef _UNICODE
	TCHAR szBufferMax[MAX_PATH] = {0};

	MultiByteToWideChar(CP_ACP, 0, szBuffer, strlen(szBuffer)+1, szBufferMax, MAX_PATH);
	s_pLB->SetCurSel(s_pLB->AddString(szBufferMax, color));
#else
	s_pLB->SetCurSel(s_pLB->AddString(szBuffer, color));
#endif
}


CSDSNmdToolDlg::CSDSNmdToolDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CSDSNmdToolDlg::IDD, pParent)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CSDSNmdToolDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_LIST_LOG, m_lbLog);
}

BEGIN_MESSAGE_MAP(CSDSNmdToolDlg, CDialog)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	//}}AFX_MSG_MAP
	ON_BN_CLICKED(IDOK, &CSDSNmdToolDlg::OnBnClickedOk)
	ON_BN_CLICKED(IDC_BUTTON_INPUT, &CSDSNmdToolDlg::OnBnClickedButtonInput)
	ON_BN_CLICKED(IDC_BUTTON_OUTPUT, &CSDSNmdToolDlg::OnBnClickedButtonOutput)
END_MESSAGE_MAP()


// CSDSNmdToolDlg message handlers

BOOL CSDSNmdToolDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon

	// TODO: Add extra initialization here
	TCHAR szPath[MAX_PATH] = {0};
#ifdef _UNICODE
	MultiByteToWideChar(CP_ACP, 0, g_Config.szGamePath, strlen(g_Config.szGamePath)+1, szPath, MAX_PATH);
	SetDlgItemText(IDC_EDIT_PATH_INPUT, szPath);

	MultiByteToWideChar(CP_ACP, 0, g_Config.szOutputFile, strlen(g_Config.szOutputFile)+1, szPath, MAX_PATH);
	SetDlgItemText(IDC_EDIT_PATH_OUTPUT, szPath);
#else
	SetDlgItemText(IDC_EDIT_PATH_INPUT, g_Config.szGamePath);
	SetDlgItemText(IDC_EDIT_PATH_OUTPUT, g_Config.szOutputFile);
#endif

	((CButton*)(GetDlgItem(IDC_CHECK_PCK)))->SetCheck(g_Config.bFromPck);

	TCHAR szVerInfo[MAX_PATH] = {0};
	_stprintf_s(szVerInfo, MAX_PATH, _T("version: %s    elements.data: 0x%08x"), 
		NMD_TOOL_VERSION, ELEMENTDATA_VERSION);
	SetDlgItemText(IDC_STATIC_VERSIONINFO, szVerInfo);

	SetDlgItemText(IDC_STATIC_LOG, _T(""));

	s_pLB = &m_lbLog;
	//m_lbLog.ModifyStyleEx(0, LBS_OWNERDRAWFIXED, 0);
	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CSDSNmdToolDlg::OnPaint()
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this function to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CSDSNmdToolDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}

bool CSDSNmdToolDlg::CheckInput()
{
	TCHAR szPath[MAX_PATH] = {0};
	GetDlgItemText(IDC_EDIT_PATH_INPUT, szPath, MAX_PATH);
	if (!PathFileExists(szPath))
	{
		MessageBox(_T("客户端目录不存在"));
		GetDlgItem(IDC_EDIT_PATH_INPUT)->SetFocus();
		((CEdit*)GetDlgItem(IDC_EDIT_PATH_INPUT))->SetSel(0, -1);
		return false;
	}

#ifdef _UNICODE
	WideCharToMultiByte(CP_ACP, 0, szPath, _tcslen(szPath)+1, g_Config.szGamePath, MAX_PATH, NULL, NULL);
	GetDlgItemText(IDC_EDIT_PATH_OUTPUT, szPath, MAX_PATH);
	WideCharToMultiByte(CP_ACP, 0, szPath, _tcslen(szPath)+1, g_Config.szOutputFile, MAX_PATH, NULL, NULL);
#else
	strcpy(g_Config.szGamePath, szPath);
	GetDlgItemText(IDC_EDIT_PATH_OUTPUT, szPath, MAX_PATH);
	strcpy(g_Config.szOutputFile, szPath);
#endif
	
	g_Config.bFromPck = ((CButton*)GetDlgItem(IDC_CHECK_PCK))->GetCheck();

	return true;
}

void CSDSNmdToolDlg::OnBnClickedOk()
{
	// TODO: Add your control notification handler code here
	m_lbLog.ResetContent();
	if (!CheckInput())
		return;

	if (!ExportNMD(Log))
	{
		MessageBox(_T("导出失败，检查工具是否需要更新"));
	}
	else
	{
		MessageBox(_T("导出完毕"));
	}

	int nTotalLine = m_lbLog.GetCount();
	int nWarning = 0;
	for (int i=0; i<nTotalLine; i++)
	{
		if (COLOR_WARNING == m_lbLog.GetItemData(i))
			nWarning++;
	}

	TCHAR szWarning[MAX_PATH] = {0};
	if (nWarning > 0)		
		_stprintf_s(szWarning, MAX_PATH, _T("%d warning"), nWarning);
	SetDlgItemText(IDC_STATIC_LOG, szWarning);
}

void CSDSNmdToolDlg::OnBnClickedButtonInput()
{
	// TODO: Add your control notification handler code here
	BROWSEINFO brif;	
	ZeroMemory(&brif, sizeof(BROWSEINFO));
	brif.ulFlags = BIF_VALIDATE | BIF_EDITBOX;
	brif.lpszTitle = _T("选择圣斗士客户端安装目录");

	LPITEMIDLIST pItemList = SHBrowseForFolder(&brif);
	if (!pItemList)
		return;

	TCHAR szPath[MAX_PATH] = {0};
	SHGetPathFromIDList(pItemList, szPath);
	LPMALLOC pMalloc;
	if (SUCCEEDED(SHGetMalloc(&pMalloc)))
	{
		pMalloc->Free(pItemList);
		pMalloc->Release();
	}

	SetDlgItemText(IDC_EDIT_PATH_INPUT, szPath);
}

void CSDSNmdToolDlg::OnBnClickedButtonOutput()
{
	// TODO: Add your control notification handler code here
	CFileDialog dlg(FALSE, NULL, NULL, OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT | OFN_NOCHANGEDIR);
	if (dlg.DoModal() != IDOK)
		return;

	SetDlgItemText(IDC_EDIT_PATH_OUTPUT, dlg.GetPathName());
}
