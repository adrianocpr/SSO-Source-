// ElementIconToolDlg.cpp : implementation file
//

#include "stdafx.h"
#include "resource.h"
#include "ElementIconToolDlg.h"
#include <A3DEngine.h>
#include <ALog.h>
#include <AFileImage.h>
#include <A3DDevice.h>
#include <A3DMacros.h>
#include <AFI.h>
#include "EC_Global.h"
#include <A3DSurfaceMan.h>
#include <A3DSurface.h>
#include "png.h"
#include "elementdataman.h"
#include "DataPathMan.h"
#include "skillstub.h"
#include "ElementSkill.h"
#include <Strsafe.h>

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#define new A_DEBUG_NEW
#define SKILL_ID_MIN	1		//　技能号的段 下限
#define SKILL_ID_MAX	10000	//	技能号的段 上限


//	Equipment endurance scale
#define ENDURANCE_SCALE		100

// void set_to_classid(DATA_TYPE type, item_data * data, int major_type)
// {
// }
// int addon_generate_arg(DATA_TYPE type, addon_data & data, int arg_num/*初始的参数个数*/)
// {
// 	return arg_num;
// } 
// int addon_update_ess_data(const addon_data & data, void * essence,size_t ess_size, prerequisition * require)
// {
// 	return 0;
// }
// void update_require_data(prerequisition *require)
// {
// 	require->durability *= ENDURANCE_SCALE;
// 	require->max_durability *= ENDURANCE_SCALE;
// }
// void get_item_guid(int id, int& g1, int& g2)
// {
// 	g1 = 0;
// 	g2 = 1;
// }

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CElementIconToolDlg dialog

CElementIconToolDlg::CElementIconToolDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CElementIconToolDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CElementIconToolDlg)
	m_path = _T("");
	m_path2 = _T("");
	m_path3 = _T("");
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);

	m_pA3DDevice = NULL;
	m_pA3DEngine = NULL;
	m_pElementDataMan = NULL;
	m_pDataPathMan = NULL;
	m_dtTemp = DT_INVALID;
	m_idTemp = 0;
	m_idSkill = 0;
}

void CElementIconToolDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CElementIconToolDlg)
	DDX_Text(pDX, IDC_EDIT1, m_path);
	DDX_Text(pDX, IDC_EDIT2, m_path2);
	DDX_Text(pDX, IDC_EDIT3, m_path3);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CElementIconToolDlg, CDialog)
	//{{AFX_MSG_MAP(CElementIconToolDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_WM_DESTROY()
	ON_BN_CLICKED(IDC_BUTTON2, OnButton2)
	ON_BN_CLICKED(IDC_BUTTON1, OnButton1)
	ON_EN_CHANGE(IDC_EDIT1, OnChangeEdit1)
	ON_BN_CLICKED(IDC_BUTTON3, OnButton3)
	ON_BN_CLICKED(IDC_BUTTON4, OnButton4)
	ON_BN_CLICKED(IDC_BUTTON5, OnButton5)
	ON_BN_CLICKED(IDC_BUTTON6, OnButton6)
	//}}AFX_MSG_MAP
	ON_EN_CHANGE(IDC_EDIT3, OnEnChangeEdit3)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CElementIconToolDlg message handlers

BOOL CElementIconToolDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	
	// TODO: Add extra initialization here
	if (!Init())
		return FALSE;
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CElementIconToolDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CElementIconToolDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

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

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CElementIconToolDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

bool CElementIconToolDlg::InitA3DEngine()
{
	//	Init Engine
	if (!(m_pA3DEngine = new A3DEngine()))
	{
		a_LogOutput(1, "InitA3DEngine: Not enough memory!");
		return false;
	}

	HINSTANCE hInst = AfxGetInstanceHandle();
	HWND hWnd = GetSafeHwnd();
	
	RECT Rect;
	::GetClientRect(hWnd, &Rect);
		
	A3DDEVFMT devFmt;
	devFmt.bWindowed	= true;
	devFmt.nWidth		= Rect.right;
	devFmt.nHeight		= Rect.bottom;
	devFmt.fmtTarget	= A3DFMT_UNKNOWN;
	devFmt.fmtDepth		= A3DFMT_UNKNOWN;
	
	DWORD dwDevFlags = A3DDEV_ALLOWMULTITHREAD;// | A3DDEV_FORCESOFTWARETL;	//	Force software T&L
	
	if (!m_pA3DEngine->Init(hInst, hWnd, &devFmt, dwDevFlags))
	{
		A3DRELEASE(m_pA3DEngine);
		a_LogOutput(1, "InitA3DEngine: Failed to initialize A3D engine.");
		return false;
	}
	
	m_pA3DDevice = m_pA3DEngine->GetA3DDevice();
	return true;
}

void CElementIconToolDlg::ReleaseA3DEngine()
{
	A3DRELEASE(m_pA3DEngine);
}

bool CElementIconToolDlg::Init()
{
	af_Initialize();
	glb_InitLogSystem(GetLogFileName());
	char szWorkDir[MAX_PATH];
	GetCurrentDirectoryA(MAX_PATH, szWorkDir);
	af_SetBaseDir(szWorkDir);

	if (!InitA3DEngine())
		return false;
	return true;
}

void CElementIconToolDlg::Release()
{
	ReleaseA3DEngine();
	glb_CloseLogSystem();	
	af_Finalize();
}

void CElementIconToolDlg::OnDestroy() 
{
	Release();
	CDialog::OnDestroy();
}

void CElementIconToolDlg::OnChangeEdit1() 
{
	// TODO: If this is a RICHEDIT control, the control will not
	// send this notification unless you override the CDialog::OnInitDialog()
	// function and call CRichEditCtrl().SetEventMask()
	// with the ENM_CHANGE flag ORed into the mask.
	
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
	
}

int CALLBACK BrowseCallback(HWND hWnd, UINT uMsg, LPARAM lParam, LPARAM lpData)
{
	switch (uMsg)
	{
	case BFFM_INITIALIZED:
		::SendMessage(hWnd, BFFM_SETSELECTION, 1, lpData);
		break;
	}
	return 0;
}

void CElementIconToolDlg::OnButton1() 
{
	// 浏览原图标文件
	CFileDialog dlg(true, _T("*.dds"), (LPCTSTR)m_path, OFN_FILEMUSTEXIST, _T("DDS Files(*.dds)|*.dds|All Files(*.*)|*.*||"));
	if (dlg.DoModal() != IDOK)
		return;
	m_path = dlg.GetPathName();
	UpdateData(FALSE);
}

void CElementIconToolDlg::OnButton2() 
{
	if (m_path.IsEmpty())
	{
		CEdit *pEdit = (CEdit*)GetDlgItem(IDC_EDIT1);
		pEdit->SetFocus();
		pEdit->SetSel(0, -1);
		return;
	}
	if (m_path2.IsEmpty())
	{
		CEdit *pEdit = (CEdit*)GetDlgItem(IDC_EDIT2);
		pEdit->SetFocus();
		pEdit->SetSel(0, -1);
		return;
	}

	ACString strPath(m_path);
	AString strOutputDir;
	if (ConvertItemIcon(strOutputDir))
	{
		AfxMessageBox(_T("转换结束!"), MB_ICONINFORMATION | MB_OK);

		// 打开输出目录用于查看
		ShellExecuteA(NULL, "open", strOutputDir, NULL, NULL, SW_SHOWNORMAL);
	}
	else
	{
		AfxMessageBox(_T("转换失败，请查看日志文件！"), MB_ICONERROR | MB_OK);
	}
	
	// 打开日志文件用于查看
	OpenLogFile();
}


bool CElementIconToolDlg::ConvertItemIcon(AString &strOutputDir)
{
	bool ret(false);

	// 验证输入
	if (!m_pA3DEngine)
		return ret;

	AString strPath = AC2AS(m_path);
	AString strPathDDS = strPath;
	if (!af_IsFileExist(strPath) || !af_CheckFileExt(strPath, ".dds"))
	{
		a_LogOutput(1, "CElementIconToolDlg::ConvertItemIcon, Invalid icon file %s", (const char *)strPath);
		return ret;
	}
	if (!af_ChangeFileExt(strPath, ".txt") || !af_IsFileExist(strPath))
	{
		a_LogOutput(1, "CElementIconToolDlg::ConvertItemIcon, Cannot find icon description file %s", (const char *)strPath);
		return ret;
	}
	AString strPathTXT = strPath;
	
	// 创建输出目录
	AString strDirOut = strPathDDS;
	strDirOut.CutRight(4); // 除去后缀名，形成跟文件相关的目录
	BOOL bCreate = ::CreateDirectoryA(strDirOut, NULL);
	if (bCreate == 0)
	{
		 DWORD dwError = GetLastError();
		 if (dwError != ERROR_ALREADY_EXISTS)
		 {
			 a_LogOutput(1, "CElementIconToolDlg::ConvertItemIcon, Failed to create output directory %s", (const char *)strDirOut);
			 return ret;
		 }
	}

	// 读取图标描述文件 iconlist_ivtrm.txt
	AFileImage fi;
	if (!fi.Open(strPathTXT, AFILE_OPENEXIST | AFILE_TEXT))
	{
		a_LogOutput(1, "CElementIconToolDlg::ConvertItemIcon, Cannot open icon description file %s", (const char *)strPathTXT);
		return ret;
	}
	
	IconMap iconMap;
	int W(0), H(0), nCountX(0), nCountY(0);
	char szLine[AFILE_LINEMAXLEN];
	DWORD dwRead;
	fi.ReadLine(szLine, sizeof(szLine), &dwRead);
	W = atoi(szLine);
	
	fi.ReadLine(szLine, sizeof(szLine), &dwRead);
	H = atoi(szLine);
	
	fi.ReadLine(szLine, sizeof(szLine), &dwRead);
	nCountY = atoi(szLine);
	
	fi.ReadLine(szLine, sizeof(szLine), &dwRead);
	nCountX = atoi(szLine);
	AString strLine;
	for (int i = 0; i < nCountY; i++ )
	{
		for(int j = 0; j < nCountX; j++ )
		{
			int nIndex = i * nCountX + j;
			fi.ReadLine(szLine, sizeof(szLine), &dwRead);
			if (dwRead > 0 && strlen(szLine) > 0)
			{
				strLine = szLine;
				strLine.MakeLower();
				iconMap[strLine] = nIndex;
			}
		}
	}	
	fi.Close();

	// 读取图标文件 iconlist_ivtrm.dds
	A3DSurfaceMan *pSurfaceMan = m_pA3DEngine->GetA3DSurfaceMan();
	A3DSurface *pSurfaceSrc = NULL;
	if (!pSurfaceMan->LoadSurfaceFromFile(strPathDDS, 0, &pSurfaceSrc))
	{
		a_LogOutput(1, "CElementIconToolDlg::ConvertItemIcon, Cannot open icon file %s", (const char *)strPathDDS);
		return ret;
	}
#ifdef _DEBUG
	{
		AString strTemp = strPathDDS;
		strTemp.CutRight(3);
		strTemp += "bmp";
		D3DXSaveSurfaceToFile(AS2AC(strTemp), D3DXIFF_BMP, pSurfaceSrc->GetDXSurface(), NULL, NULL);
	}
#endif

	// 逐个文件转换为 PNG 格式
	A3DSurface *pSurfaceDst = new A3DSurface;
	if (!pSurfaceDst->Create(m_pA3DEngine->GetA3DDevice(), W, H, A3DFMT_X8R8G8B8))
	{
		a_LogOutput(1, "CElementIconToolDlg::ConvertItemIcon, Cannot create temp surface for small icons");
		return ret;
	}	
	
	// 读取 elements.data 文件
	if (!LoadElementData())
	{
		return ret;
	}

	AString strIconIndex, strIconOut;
	if (GetFirstItemIconFilePath(strIconIndex, strIconOut))
	{
		do 
		{
			if (!_BuildIcon(strIconIndex,strDirOut,strIconOut,iconMap,pSurfaceDst,pSurfaceSrc,W,H,nCountX,nCountY))
			{
				break;
			}
		}
		while(GetNextItemIconFilePath(strIconIndex, strIconOut));
	}

	// 圣衣
	abase::vector<AString> strvecIconIndex,strvecIconOut;
	if (GetFirstClothIconFilePath(strvecIconIndex, strvecIconOut))
	{
		do 
		{
			for (size_t i = 0; i < strvecIconIndex.size(); i++)
			{
				if(!_BuildIcon(strvecIconIndex[i],strDirOut,strvecIconOut[i],iconMap,pSurfaceDst,pSurfaceSrc,W,H,nCountX,nCountY))
				{
					break;
				}
			}
			
		}
		while(GetNextClothIconFilePath(strvecIconIndex, strvecIconOut));
	}

	// 灵魂之甲
	if (GetFirstArmorIconFilePath(strIconIndex, strIconOut))
	{
		do 
		{
			if (!_BuildIcon(strIconIndex,strDirOut,strIconOut,iconMap,pSurfaceDst,pSurfaceSrc,W,H,nCountX,nCountY))
			{
				break;
			}
		}
		while(GetNextArmorIconFilePath(strIconIndex, strIconOut));
	}

	ret = true;
	pSurfaceMan->ReleaseSurface(pSurfaceDst);
	pSurfaceMan->ReleaseSurface(pSurfaceSrc);
	ClearElementData();

	if (ret)
		strOutputDir = strDirOut;
	return ret;
}

bool CElementIconToolDlg::_BuildIcon(const AString &strIconIndex, const AString& strDirOut, AString &strIconOut,const IconMap& iconMap,A3DSurface *pSurfaceDst,A3DSurface *pSurfaceSrc,int W, int H, int nCountX, int nCountY)
{
	// 获取下标
	AString strIconIndexTitle;
	af_GetFileTitle(strIconIndex, strIconIndexTitle);
	strIconIndexTitle.MakeLower();
	IconMap::const_iterator it = iconMap.find(strIconIndexTitle);
	int nIndex = 0;
	if (it != iconMap.end())
	{
		nIndex = it.value()->second;
	} 
	else
	{
		return true;
	}

	// 根据下标计算小图片在大图片中的位置
	int i = nIndex/nCountX;
	int j = nIndex%nCountX;
	RECT rect;			
	rect.left = j * W;
	rect.top =  i * H;
	rect.right = j * W + W;
	rect.bottom = i * H + H;

	// 计算
	strIconOut = strDirOut + "\\" + strIconOut;
	POINT pt = {0, 0};
	if (D3D_OK != D3DXLoadSurfaceFromSurface(pSurfaceDst->GetDXSurface(), NULL, NULL, pSurfaceSrc->GetDXSurface(), NULL, &rect, D3DX_DEFAULT, 0))
	{
		a_LogOutput(1, "CElementIconToolDlg::ConvertItemIcon, Failed to make icon image");
		return false;
	}
	if (!SaveSurfaceToFile(strIconOut, pSurfaceDst))
	{
		a_LogOutput(1, "CElementIconToolDlg::ConvertItemIcon, Failed to save icon to file %s", (const char *)strIconOut);
		return false;
	}
	else
	{
		a_LogOutput(1, "CElementIconToolDlg::ConvertItemIcon, 成功生成 %s", (const char *)strIconOut);
	}
	return true;
}

bool CElementIconToolDlg::ConvertSkillIcon(AString &strOutputDir)
{
	bool ret(false);

	// 验证输入
	if (!m_pA3DEngine)
		return ret;

	AFileImage fi;


	// 读取技能配置
	abase::hash_map<AString,abase::vector<int>> iconPath2ID;
	char szFile[MAX_PATH], szLine[AFILE_LINEMAXLEN];
	StringCchPrintfA(szFile, sizeof(szFile), "%s\\skill_myz", 
		af_GetBaseDir());
	if( !fi.Open(szFile, AFILE_OPENEXIST | AFILE_TEXT))
	{
		a_LogOutput(0,"Open File %s Failed!",szFile);
		return false;
	}
	int skill_id;
	DWORD dwRead;
	while(fi.ReadLine(szLine, sizeof(szLine), &dwRead))
	{
		if(sscanf(szLine, "%d", &skill_id))
		{
			if(fi.ReadLine(szLine, sizeof(szLine), &dwRead))
			{
				abase::vector<int>& ids = iconPath2ID[szLine];
				ids.push_back(skill_id);
			}
			else
			{
				break;
			}
		}
	}
	

	fi.Close();

	AString strPath = AC2AS(m_path3);
	AString strPathDDS = strPath;
	if (!af_IsFileExist(strPath) || !af_CheckFileExt(strPath, ".dds"))
	{
		a_LogOutput(1, "CElementIconToolDlg::ConvertSkillIcon, Invalid icon file %s", (const char *)strPath);
		return ret;
	}
	if (!af_ChangeFileExt(strPath, ".txt") || !af_IsFileExist(strPath))
	{
		a_LogOutput(1, "CElementIconToolDlg::ConvertSkillIcon, Cannot find icon description file %s", (const char *)strPath);
		return ret;
	}
	AString strPathTXT = strPath;
	
	// 创建输出目录
	AString strDirOut = strPathDDS;
	strDirOut.CutRight(4); // 除去后缀名，形成跟文件相关的目录
	BOOL bCreate = ::CreateDirectoryA(strDirOut, NULL);
	if (bCreate == 0)
	{
		 DWORD dwError = GetLastError();
		 if (dwError != ERROR_ALREADY_EXISTS)
		 {
			 a_LogOutput(1, "CElementIconToolDlg::ConvertSkillIcon, Failed to create output directory %s", (const char *)strDirOut);
			 return ret;
		 }
	}

	// 读取图标描述文件 iconlist_skill.txt
	if (!fi.Open(strPathTXT, AFILE_OPENEXIST | AFILE_TEXT))
	{
		a_LogOutput(1, "CElementIconToolDlg::ConvertSkillIcon, Cannot open icon description file %s", (const char *)strPathTXT);
		return ret;
	}
	IconList iconList;
	int W(0), H(0), nCountX(0), nCountY(0);
	fi.ReadLine(szLine, sizeof(szLine), &dwRead);
	W = atoi(szLine);
	
	fi.ReadLine(szLine, sizeof(szLine), &dwRead);
	H = atoi(szLine);
	
	fi.ReadLine(szLine, sizeof(szLine), &dwRead);
	nCountY = atoi(szLine);
	
	fi.ReadLine(szLine, sizeof(szLine), &dwRead);
	nCountX = atoi(szLine);
	AString strLine;
	for (int i = 0; i < nCountY; i++ )
	{
		for(int j = 0; j < nCountX; j++ )
		{
			int nIndex = i * nCountX + j;
			fi.ReadLine(szLine, sizeof(szLine), &dwRead);
			if (dwRead > 0 && strlen(szLine) > 0)
			{
				strLine = szLine;
				strLine.MakeLower();
				iconList.push_back(strLine);
			}
			else
			{
				iconList.push_back("");
			}
		}
	}	
	fi.Close();

	// 读取图标文件 iconlist_ivtrm.dds
	A3DSurfaceMan *pSurfaceMan = m_pA3DEngine->GetA3DSurfaceMan();
	A3DSurface *pSurfaceSrc = NULL;
	if (!pSurfaceMan->LoadSurfaceFromFile(strPathDDS, 0, &pSurfaceSrc))
	{
		a_LogOutput(1, "CElementIconToolDlg::ConvertSkillIcon, Cannot open icon file %s", (const char *)strPathDDS);
		return ret;
	}
#ifdef _DEBUG
	{
		AString strTemp = strPathDDS;
		strTemp.CutRight(3);
		strTemp += "bmp";
		D3DXSaveSurfaceToFile(AS2AC(strTemp), D3DXIFF_BMP, pSurfaceSrc->GetDXSurface(), NULL, NULL);
	}
#endif

	// 逐个文件转换为 PNG 格式
	A3DSurface *pSurfaceDst = new A3DSurface;

		if (!pSurfaceDst->Create(m_pA3DEngine->GetA3DDevice(), W, H, A3DFMT_X8R8G8B8))
		{
			a_LogOutput(1, "CElementIconToolDlg::ConvertSkillIcon, Cannot create temp surface for small icons");
			return ret;
		}
		

		AString strIconIndex, strIconIndexTitle, strIconOut;

		for (size_t nIndex = 0; nIndex < iconList.size(); nIndex++)
		{
			strIconOut = iconList[nIndex];
			abase::vector<int>& ids = iconPath2ID[strIconOut];
			for (size_t i = 0; i < ids.size(); i++)
			{
				int id = ids[i];
				int iLength = strIconOut.GetLength();
				if (iLength > 0 && strIconOut.ReverseFind('.') > 0)
				{
					// 根据下标计算小图片在大图片中的位置
					int i = nIndex/nCountX;
					int j = nIndex%nCountX;
					RECT rect;			
					rect.left = j * W;
					rect.top =  i * H;
					rect.right = j * W + W;
					rect.bottom = i * H + H;

					// 计算
					strOutputDir.Format("%s\\%d.png",strDirOut,id );
					POINT pt = {0, 0};
					if (D3D_OK != D3DXLoadSurfaceFromSurface(pSurfaceDst->GetDXSurface(), NULL, NULL, pSurfaceSrc->GetDXSurface(), NULL, &rect, D3DX_DEFAULT, 0))
					{
						a_LogOutput(1, "CElementIconToolDlg::ConvertSkillIcon, Failed to make icon image");
						break;
					}
					if (!SaveSurfaceToFile(strOutputDir, pSurfaceDst))
					{
						a_LogOutput(1, "CElementIconToolDlg::ConvertSkillIcon, Failed to save icon to file %s", (const char *)strIconOut);
						break;
					}

					a_LogOutput(1, "CElementIconToolDlg::ConvertSkillIcon Success, %s : %d", strIconOut, id);
				}
			}
		}
		ret = true;

	pSurfaceMan->ReleaseSurface(pSurfaceDst);
	pSurfaceMan->ReleaseSurface(pSurfaceSrc);

	return ret;
}

bool CElementIconToolDlg::SaveSurfaceToFile(const char *szIconFile, A3DSurface *pSurfaceDst)
{
	bool ret(false);

	png_bytep * row_pointers = NULL;
	while (pSurfaceDst)
	{
		// Lock reloaded bmp files and get image data out
		void *pBits = NULL;
		int iPitch = 0;
		if (!pSurfaceDst->LockRect(NULL, &pBits, &iPitch, D3DLOCK_READONLY))
			break;

		int W = pSurfaceDst->GetWidth();
		int H = pSurfaceDst->GetHeight();

		png_bytep* raw_pointers = new png_bytep[H];
		for (int y = 0; y < H; ++y)
		{
			png_bytep pDst = new png_byte[W*3];
			raw_pointers[y] = pDst;
			char * pSrc = (char *)pBits + y*iPitch;
			for (int x = 0; x < W; ++x)
			{
				pDst[x*3] = pSrc[x*4+2];
				pDst[x*3+1] = pSrc[x*4+1];
				pDst[x*3+2] = pSrc[x*4];
			}
		}
		pSurfaceDst->UnlockRect();

		// Write image data to PNG using libpng
		bool bWrite(false);
		while (true)
		{			
			/* create file */
			FILE *fp = fopen(szIconFile, "wb");
			if (!fp)
			{
				a_LogOutput(1, "CElementIconToolDlg::SaveSurfaceToFile, File %s could not be opened for writing", szIconFile);
				break;
			}			
			
			bool temp(false);
			png_structp png_ptr = NULL;
			png_infop info_ptr = NULL;
			while (true)
			{
				/* initialize stuff */
				png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
				
				if (!png_ptr)
					break;
				
				info_ptr = png_create_info_struct(png_ptr);
				if (!info_ptr)
					break;
				
				if (setjmp(png_jmpbuf(png_ptr)))
					break;
				
				png_init_io(png_ptr, fp);				
				
				/* write header */
				if (setjmp(png_jmpbuf(png_ptr)))
					break;
				
				png_set_IHDR(png_ptr, info_ptr,
					W, H, 8, PNG_COLOR_TYPE_RGB, PNG_INTERLACE_NONE,
					PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
				
				png_write_info(png_ptr, info_ptr);			
				
				/* write bytes */
				if (setjmp(png_jmpbuf(png_ptr)))
					break;
				
				png_write_image(png_ptr, raw_pointers);			
				
				/* end write */
				if (setjmp(png_jmpbuf(png_ptr)))
					break;
				
				png_write_end(png_ptr, NULL);
				temp = true;
				break;
			}
			if (png_ptr)
			{
				png_destroy_write_struct(&png_ptr, &info_ptr);
			}
			fclose(fp);

			if (!temp)
			{
				a_LogOutput(1, "CElementIconToolDlg::SaveSurfaceToFile, File %s writing error", szIconFile);
				break;
			}
			bWrite = true;
			break;
		}
		
		for (int x = 0; x < W; ++ x)
			delete []raw_pointers[x];
		delete []raw_pointers;

		if (!bWrite)
			break;

		ret = true;
		break;
	}

	return ret;
}

void CElementIconToolDlg::OnButton3() 
{
	// 浏览原图标文件
	CFileDialog dlg(true, _T("*.data"), (LPCTSTR)m_path2, OFN_FILEMUSTEXIST, _T("DATA Files(*.data)|*.data|All Files(*.*)|*.*||"));
	if (dlg.DoModal() != IDOK)
		return;
	m_path2 = dlg.GetPathName();
	UpdateData(FALSE);
}

bool CElementIconToolDlg::LoadElementData()
{
	bool bLoad = false;

	// 删除旧的elements.data
	ClearElementData();

	// 尝试加载新的
	CString strElement = m_path2;
	if (!strElement.IsEmpty())
	{
		if (af_IsFileExist(AC2AS(strElement)))
		{
			m_pElementDataMan = new elementdataman;
			if (0 != m_pElementDataMan->load_data(AC2AS((LPCTSTR)strElement)))
			{	
#ifdef _ALPHA_BUILD
				::MessageBox(0,_EW("failed to load elements.data"),0, MB_TOPMOST|MB_TASKMODAL);
#endif
				glb_ErrorOutput(1, "CECGame::Init", __LINE__);
				return false;
			}
			else
				bLoad = true;
		}
		else
		{
			return false;
		}

		m_pDataPathMan = new DataPathMan;
		AString strPath;
		af_GetFilePath(AC2AS(strElement),strPath);
		if (m_pDataPathMan->Load( strPath + "\\path.data") == 0)
		{
			glb_ErrorOutput(1, "CECGame::Init", __LINE__);
#ifdef _ALPHA_BUILD
			::MessageBox(0,_EW("failed to load path.data"),0, MB_TOPMOST|MB_TASKMODAL);
#endif
			return false;
		}

	}
	return bLoad;
}

void CElementIconToolDlg::ClearElementData()
{	
	if( m_pElementDataMan )
	{
		delete m_pElementDataMan;
		m_pElementDataMan = NULL;
	}
	if (m_pDataPathMan)
	{
		m_pDataPathMan->Release();
		delete m_pDataPathMan;
		m_pDataPathMan = NULL;
	}
}

bool CElementIconToolDlg::GetFirstItemIconFilePath(AString &strIconIndex, AString &strIconOut)
{
	m_dtTemp = DT_INVALID;
	m_idTemp = m_pElementDataMan->get_first_data_id(ID_SPACE_ESSENCE, m_dtTemp);
	while (m_idTemp)
	{
		GetItemIconFilePath(strIconIndex, strIconOut);
		if (!strIconOut.IsEmpty())
		{
			// 查找到正确的
			break;
		}
		// 查找的不是有效物品，查找下一个
		m_idTemp = m_pElementDataMan->get_next_data_id(ID_SPACE_ESSENCE, m_dtTemp);
	}
	return m_idTemp != 0 && m_dtTemp != DT_INVALID;
}

bool CElementIconToolDlg::GetFirstClothIconFilePath(abase::vector<AString> &strvecIconIndex, abase::vector<AString> &strvecIconOut)
{
	m_dtTemp = DT_INVALID;
	m_idTemp = m_pElementDataMan->get_first_data_id(ID_SPACE_CONFIG, m_dtTemp);
	while (m_idTemp)
	{
		if (m_dtTemp == DT_CLOTH_CONFIG)
		{
			GetClothIconFilePath(strvecIconIndex, strvecIconOut);
			if (strvecIconIndex.size() > 0)
			{
				// 查找到正确的
				break;
			}
		}
		// 查找的不是有效圣衣，查找下一个
		m_idTemp = m_pElementDataMan->get_next_data_id(ID_SPACE_CONFIG, m_dtTemp);
	}
	return m_idTemp != 0 && m_dtTemp == DT_CLOTH_CONFIG;
}

bool CElementIconToolDlg::GetFirstArmorIconFilePath(AString &strIconIndex, AString &strIconOut)
{
	m_dtTemp = DT_INVALID;
	m_idTemp = m_pElementDataMan->get_first_data_id(ID_SPACE_CONFIG, m_dtTemp);
	while (m_idTemp)
	{
		if (m_dtTemp == DT_SOUL_ARMOR_CONFIG)
		{
			GetArmorIconFilePath(strIconIndex, strIconOut);
			if (!strIconIndex.IsEmpty())
			{
				// 查找到正确的
				break;
			}
		}
		// 查找的不是有效灵魂之甲，查找下一个
		m_idTemp = m_pElementDataMan->get_next_data_id(ID_SPACE_CONFIG, m_dtTemp);
	}
	return m_idTemp != 0 && m_dtTemp == DT_SOUL_ARMOR_CONFIG;
}

bool CElementIconToolDlg::GetNextItemIconFilePath(AString &strIconIndex, AString &strIconOut)
{
	m_idTemp = m_pElementDataMan->get_next_data_id(ID_SPACE_ESSENCE, m_dtTemp);	
	while (m_idTemp)
	{
		GetItemIconFilePath(strIconIndex, strIconOut);
		if (!strIconOut.IsEmpty())
		{
			// 查找到正确的
			break;
		}
		a_LogOutput(1, "CElementIconToolDlg::ConvertItemIcon 查找的不是有效物品: id = %d, dt = %d, icon = %s", m_idTemp, m_dtTemp, strIconOut);
		// 查找的不是有效物品，查找下一个
		m_idTemp = m_pElementDataMan->get_next_data_id(ID_SPACE_ESSENCE, m_dtTemp);
	}
	return m_idTemp != 0 && m_dtTemp != DT_INVALID;
}

bool CElementIconToolDlg::GetNextClothIconFilePath(abase::vector<AString> &strvecIconIndex, abase::vector<AString> &strvecIconOut)
{
	m_idTemp = m_pElementDataMan->get_next_data_id(ID_SPACE_CONFIG, m_dtTemp);
	while (m_idTemp)
	{
		if (m_dtTemp == DT_CLOTH_CONFIG)
		{
			GetClothIconFilePath(strvecIconIndex, strvecIconOut);
			if (strvecIconIndex.size() > 0)
			{
				// 查找到正确的
				break;
			}
			a_LogOutput(1, "CElementIconToolDlg::ConvertItemIcon 查找的不是有效物品: id = %d, dt = %d", m_idTemp, m_dtTemp);
		}
		// 查找的不是有效圣衣，查找下一个
		m_idTemp = m_pElementDataMan->get_next_data_id(ID_SPACE_CONFIG, m_dtTemp);
	}
	return m_idTemp != 0 && m_dtTemp == DT_CLOTH_CONFIG;
}

bool CElementIconToolDlg::GetNextArmorIconFilePath(AString &strIconIndex, AString &strIconOut)
{
	m_idTemp = m_pElementDataMan->get_next_data_id(ID_SPACE_CONFIG, m_dtTemp);
	while (m_idTemp)
	{
		if (m_dtTemp == DT_SOUL_ARMOR_CONFIG)
		{
			GetArmorIconFilePath(strIconIndex, strIconOut);
			if (!strIconOut.IsEmpty())
			{
				// 查找到正确的
				break;
			}
			a_LogOutput(1, "CElementIconToolDlg::ConvertItemIcon 查找的不是有效物品: id = %d, dt = %d", m_idTemp, m_dtTemp);
		}
		// 查找的不是有效圣衣，查找下一个
		m_idTemp = m_pElementDataMan->get_next_data_id(ID_SPACE_CONFIG, m_dtTemp);
	}
	return m_idTemp != 0 && m_dtTemp == DT_SOUL_ARMOR_CONFIG;
}

void CElementIconToolDlg::GetItemIconFilePath(AString &strIconIndex, AString &strIconOut)
{

	strIconIndex.Empty();
	strIconOut.Empty();

#undef GET_ITEM_INFO

#define GET_ITEM_INFO(essence) \
	case DT_##essence: \
	{ \
	const essence * pEssence = (const essence *)m_pElementDataMan->get_data_ptr(m_idTemp, ID_SPACE_ESSENCE, m_dtTemp); \
	if (pEssence && (pEssence->item_common).icon_path > 0) \
	{ \
		strIconIndex = m_pDataPathMan->GetPathByID((pEssence->item_common).icon_path); \
		strIconOut.Format("%d.png", pEssence->id);	\
	} \
}\
	break;

#undef GET_ITEM_INFO2

#define GET_ITEM_INFO2(essence) \
	case DT_##essence: \
	{ \
	const essence * pEssence = (const essence *)m_pElementDataMan->get_data_ptr(m_idTemp, ID_SPACE_ESSENCE, m_dtTemp); \
	if (pEssence && pEssence->file_icon > 0) \
	{ \
	strIconIndex = m_pDataPathMan->GetPathByID(pEssence->file_icon); \
	strIconOut.Format("%d.png", pEssence->id);	\
	} \
	}\
	break;

	if (m_idTemp != 0 && m_dtTemp != DT_INVALID)
	{
		switch(m_dtTemp)
		{
				//GET_ITEM_INFO2(EQUIPMENT_ADDON)
				GET_ITEM_INFO(EQUIPMENT_ESSENCE)
				GET_ITEM_INFO2(REFINE_TICKET_ESSENCE)
				GET_ITEM_INFO(MEDICINE_ESSENCE)
				GET_ITEM_INFO(MATERIAL_ESSENCE)
				GET_ITEM_INFO(SKILLTOME_ESSENCE)	
				GET_ITEM_INFO(TRANSMITROLL_ESSENCE)
				GET_ITEM_INFO2(LUCKYROLL_ESSENCE)
				GET_ITEM_INFO2(TOWNSCROLL_ESSENCE)
				GET_ITEM_INFO2(REVIVESCROLL_ESSENCE)
				GET_ITEM_INFO(TASKMATTER_ESSENCE)
				//GET_ITEM_INFO2(DROPTABLE_ESSENCE)
				GET_ITEM_INFO2(MONSTER_ESSENCE)
				//GET_ITEM_INFO2(NPC_TALK_SERVICE)
				//GET_ITEM_INFO2(NPC_SELL_SERVICE)
				//GET_ITEM_INFO2(NPC_BUY_SERVICE)
				//GET_ITEM_INFO2(NPC_TASK_IN_SERVICE)
				//GET_ITEM_INFO2(NPC_TASK_OUT_SERVICE)
				//GET_ITEM_INFO2(NPC_TASK_MATTER_SERVICE)
				//GET_ITEM_INFO2(NPC_HEAL_SERVICE)
				//GET_ITEM_INFO2(NPC_TRANSMIT_SERVICE)
				//GET_ITEM_INFO2(NPC_PROXY_SERVICE)
				//GET_ITEM_INFO2(NPC_STORAGE_SERVICE)
				//GET_ITEM_INFO2(NPC_TYPE)
				GET_ITEM_INFO2(NPC_ESSENCE)
				//GET_ITEM_INFO(talk_proc)
				//GET_ITEM_INFO2(RECIPE_ESSENCE)
				//GET_ITEM_INFO(ENEMY_FACTION_CONFIG)
				//GET_ITEM_INFO(CHARRACTER_CLASS_CONFIG)
				//GET_ITEM_INFO(PARAM_ADJUST_CONFIG)
				GET_ITEM_INFO(TASKDICE_ESSENCE)
				GET_ITEM_INFO(TASKNORMALMATTER_ESSENCE)
				//GET_ITEM_INFO(PLAYER_LEVELEXP_CONFIG)
				//GET_ITEM_INFO2(MINE_ESSENCE)
				GET_ITEM_INFO(FIREWORKS_ESSENCE)
				//GET_ITEM_INFO(NPC_WAR_TOWERBUILD_SERVICE)
				//GET_ITEM_INFO(PLAYER_SECONDLEVEL_CONFIG)
				//GET_ITEM_INFO(NPC_RESETPROP_SERVICE)
				GET_ITEM_INFO2(ESTONE_ESSENCE)
				GET_ITEM_INFO2(PSTONE_ESSENCE)
				GET_ITEM_INFO2(SSTONE_ESSENCE)
				GET_ITEM_INFO(RECIPEROLL_ESSENCE)
				//GET_ITEM_INFO2(SUITE_ESSENCE)
				GET_ITEM_INFO2(DOUBLE_EXP_ESSENCE)
				//GET_ITEM_INFO(NPC_EQUIPBIND_SERVICE)
				//GET_ITEM_INFO(NPC_EQUIPDESTROY_SERVICE)
				//GET_ITEM_INFO(NPC_EQUIPUNDESTROY_SERVICE)
				GET_ITEM_INFO(SKILLMATTER_ESSENCE)
				GET_ITEM_INFO(VEHICLE_ESSENCE)
				GET_ITEM_INFO2(COUPLE_JUMPTO_ESSENCE)
				GET_ITEM_INFO(LOTTERY_ESSENCE)
				GET_ITEM_INFO2(CAMRECORDER_ESSENCE)
				//GET_ITEM_INFO(TITLE_PROP_CONFIG)
				//GET_ITEM_INFO(SPECIAL_ID_CONFIG)
				GET_ITEM_INFO2(TEXT_FIREWORKS_ESSENCE)
				GET_ITEM_INFO2(TALISMAN_MAINPART_ESSENCE)
				GET_ITEM_INFO2(TALISMAN_EXPFOOD_ESSENCE)
				GET_ITEM_INFO2(TALISMAN_MERGEKATALYST_ESSENCE)
				GET_ITEM_INFO2(TALISMAN_ENERGYFOOD_ESSENCE)
				GET_ITEM_INFO(SPEAKER_ESSENCE)
				//GET_ITEM_INFO2(PLAYER_TALENT_CONFIG)
				GET_ITEM_INFO2(POTENTIAL_TOME_ESSENCE)
				GET_ITEM_INFO2(AIRCRAFT_ESSENCE)
				GET_ITEM_INFO(CHANGE_SHAPE_ESSENCE)
				GET_ITEM_INFO2(SUMMON_MONSTER_ESSENCE)
				GET_ITEM_INFO(PET_BEDGE_ESSENCE)
				GET_ITEM_INFO(PET_FOOD_ESSENCE)
				GET_ITEM_INFO(PET_SKILL_ESSENCE)
				GET_ITEM_INFO2(PET_ARMOR_ESSENCE)
				//GET_ITEM_INFO2(MERGE_RECIPE_ESSENCE)
				//GET_ITEM_INFO2(NPC_HOTEL_SERVICE)
				//GET_ITEM_INFO(STATUS_POINT_PROP_CONFIG)
				//GET_ITEM_INFO(PLAYER_STATUS_POINT_CONFIG)
				//GET_ITEM_INFO(PRODUCE_TYPE_CONFIG)
				//GET_ITEM_INFO(NPC_LEARN_PRODUCE_SERVICE)
				GET_ITEM_INFO2(AI_HELPER_ESSENCE)
				//GET_ITEM_INFO(ITEM_TRADE_CONFIG)
				//GET_ITEM_INFO(LEVELUP_MODIFY_CONFIG)
				//GET_ITEM_INFO(SKILL_LEARN_CONFIG)
				//GET_ITEM_INFO(EQUIPMENT_QUALITY_CONFIG)
				//GET_ITEM_INFO(EQUIPMENT_ENHANCE_TRANSFORM_CONFIG)
				//GET_ITEM_INFO(TRADE_DISTANCE_CONFIG)
				//GET_ITEM_INFO(NPC_LEARN_SKILL_SERVICE)
				//GET_ITEM_INFO(NPC_TRADE_PORT_SERVICE)
				//GET_ITEM_INFO(NPC_SWITCH_PROF_SERVICE)
				GET_ITEM_INFO2(TRADE_ITEM_ESSENCE)
				//GET_ITEM_INFO(ADDON_PACKAGE_CONFIG)
				//GET_ITEM_INFO(ADDON_STORAGE_CONFIG)
				//GET_ITEM_INFO(EQUIPMENT_PROPERTY_RANDOM_CONFIG)
				//GET_ITEM_INFO(INSTANCE_CONFIG)
				GET_ITEM_INFO(BOOK_ESSENCE)
				//GET_ITEM_INFO(TRADE_RANDOM_EVENT_CONFIG)
				GET_ITEM_INFO2(MONEYBAG_ESSENCE)
				//GET_ITEM_INFO(SYSTEM_MAIL_CONFIG)
				//GET_ITEM_INFO(INSTANCE_TABLE_CONFIG)
				GET_ITEM_INFO2(PET_REVIVE_ESSENCE)
				//GET_ITEM_INFO2(FIRE_ESSENCE)
				//GET_ITEM_INFO(KM_PARAM_ADJUST_CONFIG)
				//GET_ITEM_INFO(TIME_GIFT_BAG_CONFIG)
				//GET_ITEM_INFO(EQUIPMENT_ENHANCE_MODEL_CONFIG)
				GET_ITEM_INFO2(IDENTIFY_SCROLL_ESSENCE)
				//GET_ITEM_INFO(CHAR_CAMERA_CONFIG)
				//GET_ITEM_INFO(DYNAMIC_INSTANCE_CONFIG)
				//GET_ITEM_INFO2(DYNAMIC_MONSTER_PACK_ESSENCE)
				//GET_ITEM_INFO(PLAYER_SUB_PROF_LEVEL_EXP_CONFIG)
				GET_ITEM_INFO(PET_EGG_ESSENCE)
				//GET_ITEM_INFO(SPECIAL_STATUS_PACKAGE_CONFIG)
				//GET_ITEM_INFO(STATUS_PACKAGE_EXPRESSIONS_CONFIG)
				//GET_ITEM_INFO(RESURRECT_TIME_CONFIG)
				//GET_ITEM_INFO2(NPC_RECIPE_ESSENCE)
				//GET_ITEM_INFO(GIFT_BAG_CONFIG)
				//GET_ITEM_INFO2(SPECIAL_ITEMS_PACK_ESSENCE)
				//GET_ITEM_INFO2(TRANSMITBOX_ESSENCE)
				//GET_ITEM_INFO(REPUTATION_CONFIG)
				//GET_ITEM_INFO(TASK_FIX_CONFIG)
				//GET_ITEM_INFO(BODY_TRANSFORM_CONFIG)
				//GET_ITEM_INFO(MONSTER_NPC_PACK_CONFIG)
				//GET_ITEM_INFO(TEXT_PACK_CONFIG)
				//GET_ITEM_INFO(STAR_SOUL_CHAIN_CONFIG)
				GET_ITEM_INFO(STAR_SOUL_STONE_ESSENCE)
				//GET_ITEM_INFO(STAR_SOUL_CHAIN_COMBO_CONFIG)
				//GET_ITEM_INFO(COMBO_PACK_CONFIG)
				//GET_ITEM_INFO(MINE_PACK_CONFIG)
				//GET_ITEM_INFO(SUMMON_MONSTER_NPC_PACK_CONFIG)
				//GET_ITEM_INFO(SUMMON_MINE_PACK_CONFIG)
				GET_ITEM_INFO(ENHANCE_ITEM_ESSENCE)
				//GET_ITEM_INFO(ENHANCE_SHOW_CONFIG)
				//GET_ITEM_INFO(WORLD_TELEPORT_POINT_CONFIG)
				//GET_ITEM_INFO(ENHANCE_TRANSFER_CONFIG)
				GET_ITEM_INFO2(STAR_SOUL_STONE_UPGRADE_ITEM_ESSENCE)
				GET_ITEM_INFO(EQUIPMENT_PROCESSING_ITEM_ESSENCE)
				GET_ITEM_INFO2(PET_APTITUDE_STONE_ESSENCE)
				GET_ITEM_INFO2(PET_SKILL_LEVEL_UP_STONE_ESSENCE)
				//GET_ITEM_INFO(COMMON_MONSTER_CONFIG)
				GET_ITEM_INFO2(PET_GROWTH_STONE_ESSENCE)
				GET_ITEM_INFO(PET_CATCHER_ESSENCE)
				//GET_ITEM_INFO(SUMMON_CATEGORY_CONFIG)
				//GET_ITEM_INFO(STORED_EXP_CONFIG)
				//GET_ITEM_INFO(PASSIVE_SKILL_CONFIG)
				//GET_ITEM_INFO(DROP_BY_LEVEL_CONFIG)
				//GET_ITEM_INFO(STORAGE_TASK_MAX_COUNT_CONFIG)
				//GET_ITEM_INFO(LEVEL_ADAPT_WEIGHT_CONFIG)
				//GET_ITEM_INFO(GUARDIAN_STAR_CONFIG)
				GET_ITEM_INFO2(GUARDIAN_STONE_ESSENCE)
				//GET_ITEM_INFO(LEAGUE_WAR_CONFIG)
				GET_ITEM_INFO2(GUARDIAN_SOUL_ESSENCE)
				GET_ITEM_INFO2(GUARDIAN_SOUL_SKILL_ESSENCE)
				GET_ITEM_INFO2(GUARDIAN_SOUL_SKILL_UP_ESSENCE)
				GET_ITEM_INFO2(GUARDIAN_SOUL_APTITUDE_STONE_ESSENCE)
				//GET_ITEM_INFO(REST_EXP_CONFIG)
				//GET_ITEM_INFO(NPC_DUNGEON_SERVICE)
				//GET_ITEM_INFO(ENFORCED_MOVE_CONFIG)
				//GET_ITEM_INFO(PROF_SELECT_SERVICE)
				//GET_ITEM_INFO(STAR_BOARD_CONFIG)
				//GET_ITEM_INFO(STAR_CONFIG)
				//GET_ITEM_INFO(ASTROLOGY_CONFIG)
				GET_ITEM_INFO(STAR_SOUL_ESSENCE)
				GET_ITEM_INFO(ASTROLOGY_ITEM_ESSENCE)
				GET_ITEM_INFO(EXTEND_ENHANCE_LIMIT_ITEM_ESSENCE)
				//GET_ITEM_INFO(SOLO_CHALLENGE_DUNGEON_CONFIG)
				//GET_ITEM_INFO(CLOTH_CONFIG)
				//GET_ITEM_INFO(QTE_CONFIG)
				//GET_ITEM_INFO(ATHENA_BLESSING_CONFIG)
				//GET_ITEM_INFO(SELF_SERVICE_CONFIG)
				GET_ITEM_INFO(CLOTH_UPGRADE_ITEM_ESSENCE)
				//GET_ITEM_INFO(ATHENA_AWARD_CONFIG)
				//GET_ITEM_INFO(DAILY_LIMITATION_CONFIG)
				//GET_ITEM_INFO(HOOK_MODEL_CONFIG)
				//GET_ITEM_INFO(NPC_LIMITED_SALE_SERVICE)
				//GET_ITEM_INFO(CLOTH_UPGRADE_CONFIG)
				//GET_ITEM_INFO(PRODUCE_ENERGY_CONFIG)
				//GET_ITEM_INFO(SUIT_TAG_CONFIG)
				//GET_ITEM_INFO(SUIT_TAG_ACTIVE_CONFIG)
				GET_ITEM_INFO(VALUE_INCREASE_ESSENCE)
				//GET_ITEM_INFO(PET_CONFIG)
				GET_ITEM_INFO(PET_ACCESSORY_ESSENCE)
				//GET_ITEM_INFO(PRAY_EXP_CONFIG)
				//GET_ITEM_INFO(CONSTELLATION_GUARD_CONFIG)
				//GET_ITEM_INFO(LEAGUE_REPU_CONFIG)
				//GET_ITEM_INFO(ALBUM_CONFIG)
				//GET_ITEM_INFO(MODEL_CANDIDATE_CONFIG)
				GET_ITEM_INFO(COMBAT_PET_ESSENCE)
				GET_ITEM_INFO(COMBAT_PET_SKILL_BOOK_ESSENCE)
				GET_ITEM_INFO(COMBAT_PET_EQUIPMENT_ESSENCE)
				GET_ITEM_INFO(STAR_SOUL_BOX_ESSENCE)
				GET_ITEM_INFO(EQUIPMENT_APPEARANCE_ESSENCE)
				GET_ITEM_INFO(PLAYER_APPEARANCE_ESSENCE)
				GET_ITEM_INFO(DRIFT_BOTTLE_ESSENCE)
				//GET_ITEM_INFO(COMBAT_PET_CONFIG)
				//GET_ITEM_INFO(VIP_CONFIG)
				//GET_ITEM_INFO(MONSTER_AFFIX_COMBINATION_CONFIG)
				//GET_ITEM_INFO(MONSTER_AFFIX_RANDOM_PACK_CONFIG)
				//GET_ITEM_INFO(QTE_PLAYER_MONSTER_INTERACTION_CONFIG)
				//GET_ITEM_INFO(BATTLE_FIELD_CONFIG)
				//GET_ITEM_INFO(TEAM_POWER_UP_CONFIG)

				GET_ITEM_INFO(DIVINING_ITEM_ESSENCE)
				//GET_ITEM_INFO(WING_CONFIG)
				//GET_ITEM_INFO(MONSTER_AFFIX_COMBINATION_CONFIG)
				//GET_ITEM_INFO(LUCKY_DRAW_CONFIG)
				//GET_ITEM_INFO(NPC_BATTLE_FIELD_SERVICE)
				//GET_ITEM_INFO(EQUIPMENT_ENHANCE_COMBO_CONFIG)
				//GET_ITEM_INFO(NPC_IMPRINT_SERVICE)

				//SOLO_ARENA_CONFIG,
				//MONSTER_KILL_LIMIT_CONFIG,
				//ITEM_EXCHANGE_CONFIG,
				//NPC_ITEM_EXCHANGE_SERVICE,
				GET_ITEM_INFO(EMOTION_ICON_PACK_ESSENCE)
				//DAILY_BENEFIT_TASK_CONFIG,
				//REVENGE_ITEM_ESSENCE,
				//STAR_FIELD_EXPLORE_CONFIG,
				//ATOM_GENERATION_CONFIG,
				//ATOM_COMBINE_CONFIG,
				//ATOM_CHAIN_CONFIG,
				//ATOM_REQUIREMENT_CONFIG,
				//COSMOS_STAR_FORCE_CONFIG,
				//STAR_FIELD_INCUBATION_CONFIG,
				GET_ITEM_INFO(EQUIPMENT_DYE_ESSENCE)
				GET_ITEM_INFO(RELIC_ESSENCE)
				//CLOAK_CONFIG,
				//RELIC_CONFIG,
				//RELIC_PROP_CONFIG,
				//RELIC_COMBO_CONFIG,
				//SUIT_TAG_MIGRATION_CONFIG,
				GET_ITEM_INFO(MARRIAGE_CERTIFICATE_ESSENCE)
				//NPC_FORCE_SELECT_SERVICE,
				//SAINT_WILLPOWER_CONFIG,
				//SURVEY_CONFIG,
				//SOUL_ARMOR_CONFIG,
				GET_ITEM_INFO(SOUL_ARMOR_GEM_ESSENCE)
				//DT_SOUL_ARMOR_GEM_COMBO_CONFIG,
				//DT_SERVER_BATTLE_CONFIG,
				GET_ITEM_INFO(SKILL_CLEANER_ESSENCE)

				// add new template here
		}
	}
#undef GET_ITEM_INFO
}

void CElementIconToolDlg::GetClothIconFilePath(abase::vector<AString> &strvecIconIndex, abase::vector<AString> &strvecIconOut)
{
	strvecIconIndex.clear();
	strvecIconOut.clear();
	if (m_idTemp != 0 && m_dtTemp == DT_CLOTH_CONFIG)
	{
		const CLOTH_CONFIG* pEssence = (const CLOTH_CONFIG *)m_pElementDataMan->get_data_ptr(m_idTemp, ID_SPACE_CONFIG, m_dtTemp);
		if (pEssence)
		{
			for (int i = 0; i < 5; i++)
			{
				int saint_category = pEssence->form_configs[i].category;
				int icon_path = pEssence->form_configs[i].icon_path;
				if (saint_category>=0 && icon_path > 0)
				{
					strvecIconIndex.push_back(m_pDataPathMan->GetPathByID(icon_path));
					AString strIconOut;strIconOut.Format("cloth%d_%d.png", m_idTemp,i);
					strvecIconOut.push_back(strIconOut);
				}
			}
		}
	}
}

void CElementIconToolDlg::GetArmorIconFilePath(AString &strIconIndex, AString &strIconOut)
{
	if (m_idTemp != 0 && m_dtTemp == DT_SOUL_ARMOR_CONFIG)
	{
		const SOUL_ARMOR_CONFIG* pEssence = (const SOUL_ARMOR_CONFIG *)m_pElementDataMan->get_data_ptr(m_idTemp, ID_SPACE_CONFIG, m_dtTemp);
		if (pEssence)
		{
			int type = pEssence->type;
			int icon_path = pEssence->icon_path;
			if (type>=0 && icon_path > 0)
			{
				strIconIndex = m_pDataPathMan->GetPathByID(icon_path);
				strIconOut.Format("armor%d_%d.png", m_idTemp,type);
			}
		}
	}
}

void CElementIconToolDlg::OnButton4() 
{
	// 浏览原图标文件
	CFileDialog dlg(true, _T("*.dds"), (LPCTSTR)m_path3, OFN_FILEMUSTEXIST, _T("DDS Files(*.dds)|*.dds|All Files(*.*)|*.*||"));
	if (dlg.DoModal() != IDOK)
		return;
	m_path3 = dlg.GetPathName();
	UpdateData(FALSE);
}

void CElementIconToolDlg::OnButton5() 
{
	if (m_path3.IsEmpty())
	{
		CEdit *pEdit = (CEdit*)GetDlgItem(IDC_EDIT3);
		pEdit->SetFocus();
		pEdit->SetSel(0, -1);
		return;
	}

	ACString strPath(m_path3);
	AString strOutputDir;
	if (ConvertSkillIcon(strOutputDir))
	{
		AfxMessageBox(_T("转换结束!"), MB_ICONINFORMATION | MB_OK);

		// 打开输出目录用于查看
		ShellExecuteA(NULL, "open", strOutputDir, NULL, NULL, SW_SHOWNORMAL);
	}
	else
	{
		AfxMessageBox(_T("转换失败，请查看日志文件！"), MB_ICONERROR | MB_OK);
	}
	
	// 打开日志文件用于查看
	OpenLogFile();
}

void CElementIconToolDlg::OpenLogFile()
{
	AString strFile = af_GetBaseDir();
	strFile += "\\";
	strFile += g_Log.GetLogDir();
	strFile += "\\" + GetLogFileName();
	ShellExecuteA(NULL, "open", strFile, NULL, NULL, SW_SHOWNORMAL);	
}


bool CElementIconToolDlg::GetFirstItemIDName(unsigned int &id, AString &strName)
{
	m_dtTemp = DT_INVALID;
	m_idTemp = m_pElementDataMan->get_first_data_id(ID_SPACE_ESSENCE, m_dtTemp);
	while (m_idTemp)
	{
		GetItemIDName(id, strName);
		if (!strName.IsEmpty())
		{
			// 查找到正确的
			break;
		}
		// 查找的不是有效物品，查找下一个
		m_idTemp = m_pElementDataMan->get_next_data_id(ID_SPACE_ESSENCE, m_dtTemp);
	}
	return m_idTemp != 0 && m_dtTemp != DT_INVALID;
}

bool CElementIconToolDlg::GetNextItemIDName(unsigned int &id, AString &strName)
{
	m_idTemp = m_pElementDataMan->get_next_data_id(ID_SPACE_ESSENCE, m_dtTemp);	
	while (m_idTemp)
	{
		GetItemIDName(id, strName);
		if (!strName.IsEmpty())
		{
			// 查找到正确的
			break;
		}
		// 查找的不是有效物品，查找下一个
		m_idTemp = m_pElementDataMan->get_next_data_id(ID_SPACE_ESSENCE, m_dtTemp);
	}
	return m_idTemp != 0 && m_dtTemp != DT_INVALID;
}

void CElementIconToolDlg::GetItemIDName(unsigned int &id, AString &strName)
{
#undef GET_ITEM_INFO

#define GET_ITEM_INFO(essence) \
	case DT_##essence: \
	{ \
	const essence * pEssence = (const essence *)m_pElementDataMan->get_data_ptr(m_idTemp, ID_SPACE_ESSENCE, m_dtTemp); \
	if (pEssence  && (pEssence->item_common).icon_path > 0) \
	{ \
	id = pEssence->id;\
	strName = WC2AS(AWString(pEssence->name));\
} \
}\
	break;

#undef GET_ITEM_INFO2

#define GET_ITEM_INFO2(essence) \
	case DT_##essence: \
	{ \
	const essence * pEssence = (const essence *)m_pElementDataMan->get_data_ptr(m_idTemp, ID_SPACE_ESSENCE, m_dtTemp); \
	if (pEssence && pEssence->file_icon > 0) \
	{ \
	id = pEssence->id;\
	strName = WC2AS(AWString(pEssence->name));\
} \
}\
	break;

	id = 0;
	strName.Empty();
	if (m_idTemp != 0 && m_dtTemp != DT_INVALID)
	{
		switch(m_dtTemp)
		{
			//GET_ITEM_INFO2(EQUIPMENT_ADDON)
			GET_ITEM_INFO(EQUIPMENT_ESSENCE)
			GET_ITEM_INFO2(REFINE_TICKET_ESSENCE)
			GET_ITEM_INFO(MEDICINE_ESSENCE)
			GET_ITEM_INFO(MATERIAL_ESSENCE)
			GET_ITEM_INFO(SKILLTOME_ESSENCE)	
			GET_ITEM_INFO(TRANSMITROLL_ESSENCE)
			GET_ITEM_INFO2(LUCKYROLL_ESSENCE)
			GET_ITEM_INFO2(TOWNSCROLL_ESSENCE)
			GET_ITEM_INFO2(REVIVESCROLL_ESSENCE)
			GET_ITEM_INFO(TASKMATTER_ESSENCE)
			//GET_ITEM_INFO2(DROPTABLE_ESSENCE)
			GET_ITEM_INFO2(MONSTER_ESSENCE)
			//GET_ITEM_INFO2(NPC_TALK_SERVICE)
			//GET_ITEM_INFO2(NPC_SELL_SERVICE)
			//GET_ITEM_INFO2(NPC_BUY_SERVICE)
			//GET_ITEM_INFO2(NPC_TASK_IN_SERVICE)
			//GET_ITEM_INFO2(NPC_TASK_OUT_SERVICE)
			//GET_ITEM_INFO2(NPC_TASK_MATTER_SERVICE)
			//GET_ITEM_INFO2(NPC_HEAL_SERVICE)
			//GET_ITEM_INFO2(NPC_TRANSMIT_SERVICE)
			//GET_ITEM_INFO2(NPC_PROXY_SERVICE)
			//GET_ITEM_INFO2(NPC_STORAGE_SERVICE)
			//GET_ITEM_INFO2(NPC_TYPE)
			GET_ITEM_INFO2(NPC_ESSENCE)
			//GET_ITEM_INFO(talk_proc)
			//GET_ITEM_INFO2(RECIPE_ESSENCE)
			//GET_ITEM_INFO(ENEMY_FACTION_CONFIG)
			//GET_ITEM_INFO(CHARRACTER_CLASS_CONFIG)
			//GET_ITEM_INFO(PARAM_ADJUST_CONFIG)
			GET_ITEM_INFO(TASKDICE_ESSENCE)
			GET_ITEM_INFO(TASKNORMALMATTER_ESSENCE)
			//GET_ITEM_INFO(PLAYER_LEVELEXP_CONFIG)
			//GET_ITEM_INFO2(MINE_ESSENCE)
			GET_ITEM_INFO(FIREWORKS_ESSENCE)
			//GET_ITEM_INFO(NPC_WAR_TOWERBUILD_SERVICE)
			//GET_ITEM_INFO(PLAYER_SECONDLEVEL_CONFIG)
			//GET_ITEM_INFO(NPC_RESETPROP_SERVICE)
			GET_ITEM_INFO2(ESTONE_ESSENCE)
			GET_ITEM_INFO2(PSTONE_ESSENCE)
			GET_ITEM_INFO2(SSTONE_ESSENCE)
			GET_ITEM_INFO(RECIPEROLL_ESSENCE)
			//GET_ITEM_INFO2(SUITE_ESSENCE)
			GET_ITEM_INFO2(DOUBLE_EXP_ESSENCE)
			//GET_ITEM_INFO(NPC_EQUIPBIND_SERVICE)
			//GET_ITEM_INFO(NPC_EQUIPDESTROY_SERVICE)
			//GET_ITEM_INFO(NPC_EQUIPUNDESTROY_SERVICE)
			GET_ITEM_INFO(SKILLMATTER_ESSENCE)
			GET_ITEM_INFO(VEHICLE_ESSENCE)
			GET_ITEM_INFO2(COUPLE_JUMPTO_ESSENCE)
			GET_ITEM_INFO(LOTTERY_ESSENCE)
			GET_ITEM_INFO2(CAMRECORDER_ESSENCE)
			//GET_ITEM_INFO(TITLE_PROP_CONFIG)
			//GET_ITEM_INFO(SPECIAL_ID_CONFIG)
			GET_ITEM_INFO2(TEXT_FIREWORKS_ESSENCE)
			GET_ITEM_INFO2(TALISMAN_MAINPART_ESSENCE)
			GET_ITEM_INFO2(TALISMAN_EXPFOOD_ESSENCE)
			GET_ITEM_INFO2(TALISMAN_MERGEKATALYST_ESSENCE)
			GET_ITEM_INFO2(TALISMAN_ENERGYFOOD_ESSENCE)
			GET_ITEM_INFO(SPEAKER_ESSENCE)
			//GET_ITEM_INFO2(PLAYER_TALENT_CONFIG)
			GET_ITEM_INFO2(POTENTIAL_TOME_ESSENCE)
			GET_ITEM_INFO2(AIRCRAFT_ESSENCE)
			GET_ITEM_INFO(CHANGE_SHAPE_ESSENCE)
			GET_ITEM_INFO2(SUMMON_MONSTER_ESSENCE)
			GET_ITEM_INFO(PET_BEDGE_ESSENCE)
			GET_ITEM_INFO(PET_FOOD_ESSENCE)
			GET_ITEM_INFO(PET_SKILL_ESSENCE)
			GET_ITEM_INFO2(PET_ARMOR_ESSENCE)
			//GET_ITEM_INFO2(MERGE_RECIPE_ESSENCE)
			//GET_ITEM_INFO2(NPC_HOTEL_SERVICE)
			//GET_ITEM_INFO(STATUS_POINT_PROP_CONFIG)
			//GET_ITEM_INFO(PLAYER_STATUS_POINT_CONFIG)
			//GET_ITEM_INFO(PRODUCE_TYPE_CONFIG)
			//GET_ITEM_INFO(NPC_LEARN_PRODUCE_SERVICE)
			GET_ITEM_INFO2(AI_HELPER_ESSENCE)
			//GET_ITEM_INFO(ITEM_TRADE_CONFIG)
			//GET_ITEM_INFO(LEVELUP_MODIFY_CONFIG)
			//GET_ITEM_INFO(SKILL_LEARN_CONFIG)
			//GET_ITEM_INFO(EQUIPMENT_QUALITY_CONFIG)
			//GET_ITEM_INFO(EQUIPMENT_ENHANCE_TRANSFORM_CONFIG)
			//GET_ITEM_INFO(TRADE_DISTANCE_CONFIG)
			//GET_ITEM_INFO(NPC_LEARN_SKILL_SERVICE)
			//GET_ITEM_INFO(NPC_TRADE_PORT_SERVICE)
			//GET_ITEM_INFO(NPC_SWITCH_PROF_SERVICE)
			GET_ITEM_INFO2(TRADE_ITEM_ESSENCE)
			//GET_ITEM_INFO(ADDON_PACKAGE_CONFIG)
			//GET_ITEM_INFO(ADDON_STORAGE_CONFIG)
			//GET_ITEM_INFO(EQUIPMENT_PROPERTY_RANDOM_CONFIG)
			//GET_ITEM_INFO(INSTANCE_CONFIG)
			GET_ITEM_INFO(BOOK_ESSENCE)
			//GET_ITEM_INFO(TRADE_RANDOM_EVENT_CONFIG)
			GET_ITEM_INFO2(MONEYBAG_ESSENCE)
			//GET_ITEM_INFO(SYSTEM_MAIL_CONFIG)
			//GET_ITEM_INFO(INSTANCE_TABLE_CONFIG)
			GET_ITEM_INFO2(PET_REVIVE_ESSENCE)
			//GET_ITEM_INFO2(FIRE_ESSENCE)
			//GET_ITEM_INFO(KM_PARAM_ADJUST_CONFIG)
			//GET_ITEM_INFO(TIME_GIFT_BAG_CONFIG)
			//GET_ITEM_INFO(EQUIPMENT_ENHANCE_MODEL_CONFIG)
			GET_ITEM_INFO2(IDENTIFY_SCROLL_ESSENCE)
			//GET_ITEM_INFO(CHAR_CAMERA_CONFIG)
			//GET_ITEM_INFO(DYNAMIC_INSTANCE_CONFIG)
			//GET_ITEM_INFO2(DYNAMIC_MONSTER_PACK_ESSENCE)
			//GET_ITEM_INFO(PLAYER_SUB_PROF_LEVEL_EXP_CONFIG)
			GET_ITEM_INFO(PET_EGG_ESSENCE)
			//GET_ITEM_INFO(SPECIAL_STATUS_PACKAGE_CONFIG)
			//GET_ITEM_INFO(STATUS_PACKAGE_EXPRESSIONS_CONFIG)
			//GET_ITEM_INFO(RESURRECT_TIME_CONFIG)
			//GET_ITEM_INFO2(NPC_RECIPE_ESSENCE)
			//GET_ITEM_INFO(GIFT_BAG_CONFIG)
			//GET_ITEM_INFO2(SPECIAL_ITEMS_PACK_ESSENCE)
			//GET_ITEM_INFO2(TRANSMITBOX_ESSENCE)
			//GET_ITEM_INFO(REPUTATION_CONFIG)
			//GET_ITEM_INFO(TASK_FIX_CONFIG)
			//GET_ITEM_INFO(BODY_TRANSFORM_CONFIG)
			//GET_ITEM_INFO(MONSTER_NPC_PACK_CONFIG)
			//GET_ITEM_INFO(TEXT_PACK_CONFIG)
			//GET_ITEM_INFO(STAR_SOUL_CHAIN_CONFIG)
			GET_ITEM_INFO(STAR_SOUL_STONE_ESSENCE)
			//GET_ITEM_INFO(STAR_SOUL_CHAIN_COMBO_CONFIG)
			//GET_ITEM_INFO(COMBO_PACK_CONFIG)
			//GET_ITEM_INFO(MINE_PACK_CONFIG)
			//GET_ITEM_INFO(SUMMON_MONSTER_NPC_PACK_CONFIG)
			//GET_ITEM_INFO(SUMMON_MINE_PACK_CONFIG)
			GET_ITEM_INFO(ENHANCE_ITEM_ESSENCE)
			//GET_ITEM_INFO(ENHANCE_SHOW_CONFIG)
			//GET_ITEM_INFO(WORLD_TELEPORT_POINT_CONFIG)
			//GET_ITEM_INFO(ENHANCE_TRANSFER_CONFIG)
			GET_ITEM_INFO(STAR_SOUL_STONE_UPGRADE_ITEM_ESSENCE)
			GET_ITEM_INFO(EQUIPMENT_PROCESSING_ITEM_ESSENCE)
			GET_ITEM_INFO(PET_APTITUDE_STONE_ESSENCE)
			GET_ITEM_INFO(PET_SKILL_LEVEL_UP_STONE_ESSENCE)
			//GET_ITEM_INFO(COMMON_MONSTER_CONFIG)
			GET_ITEM_INFO(PET_GROWTH_STONE_ESSENCE)
			GET_ITEM_INFO(PET_CATCHER_ESSENCE)
			//GET_ITEM_INFO(SUMMON_CATEGORY_CONFIG)
			//GET_ITEM_INFO(STORED_EXP_CONFIG)
			//GET_ITEM_INFO(PASSIVE_SKILL_CONFIG)
			//GET_ITEM_INFO(DROP_BY_LEVEL_CONFIG)
			//GET_ITEM_INFO(STORAGE_TASK_MAX_COUNT_CONFIG)
			//GET_ITEM_INFO(LEVEL_ADAPT_WEIGHT_CONFIG)
			//GET_ITEM_INFO(GUARDIAN_STAR_CONFIG)
			GET_ITEM_INFO(GUARDIAN_STONE_ESSENCE)
			//GET_ITEM_INFO(LEAGUE_WAR_CONFIG)
			GET_ITEM_INFO(GUARDIAN_SOUL_ESSENCE)
			GET_ITEM_INFO(GUARDIAN_SOUL_SKILL_ESSENCE)
			GET_ITEM_INFO(GUARDIAN_SOUL_SKILL_UP_ESSENCE)
			GET_ITEM_INFO(GUARDIAN_SOUL_APTITUDE_STONE_ESSENCE)
			//GET_ITEM_INFO(REST_EXP_CONFIG)
			//GET_ITEM_INFO(NPC_DUNGEON_SERVICE)
			//GET_ITEM_INFO(ENFORCED_MOVE_CONFIG)
			//GET_ITEM_INFO(PROF_SELECT_SERVICE)
			//GET_ITEM_INFO(STAR_BOARD_CONFIG)
			//GET_ITEM_INFO(STAR_CONFIG)
			//GET_ITEM_INFO(ASTROLOGY_CONFIG)
			GET_ITEM_INFO(STAR_SOUL_ESSENCE)
			GET_ITEM_INFO(ASTROLOGY_ITEM_ESSENCE)
			GET_ITEM_INFO(EXTEND_ENHANCE_LIMIT_ITEM_ESSENCE)
			//GET_ITEM_INFO(SOLO_CHALLENGE_DUNGEON_CONFIG)
			//GET_ITEM_INFO(CLOTH_CONFIG)
			//GET_ITEM_INFO(QTE_CONFIG)
			//GET_ITEM_INFO(ATHENA_BLESSING_CONFIG)
			//GET_ITEM_INFO(SELF_SERVICE_CONFIG)
			GET_ITEM_INFO(CLOTH_UPGRADE_ITEM_ESSENCE)
			//GET_ITEM_INFO(ATHENA_AWARD_CONFIG)
			//GET_ITEM_INFO(DAILY_LIMITATION_CONFIG)
			//GET_ITEM_INFO(HOOK_MODEL_CONFIG)
			//GET_ITEM_INFO(NPC_LIMITED_SALE_SERVICE)
			//GET_ITEM_INFO(CLOTH_UPGRADE_CONFIG)
			//GET_ITEM_INFO(PRODUCE_ENERGY_CONFIG)
			//GET_ITEM_INFO(SUIT_TAG_CONFIG)
			//GET_ITEM_INFO(SUIT_TAG_ACTIVE_CONFIG)
			GET_ITEM_INFO(VALUE_INCREASE_ESSENCE)
			//GET_ITEM_INFO(PET_CONFIG)
			GET_ITEM_INFO(PET_ACCESSORY_ESSENCE)
			//GET_ITEM_INFO(PRAY_EXP_CONFIG)
			//GET_ITEM_INFO(CONSTELLATION_GUARD_CONFIG)
			//GET_ITEM_INFO(LEAGUE_REPU_CONFIG)
			//GET_ITEM_INFO(ALBUM_CONFIG)
			//GET_ITEM_INFO(MODEL_CANDIDATE_CONFIG)
			GET_ITEM_INFO(COMBAT_PET_ESSENCE)
			GET_ITEM_INFO(COMBAT_PET_SKILL_BOOK_ESSENCE)
			GET_ITEM_INFO(COMBAT_PET_EQUIPMENT_ESSENCE)
			GET_ITEM_INFO(STAR_SOUL_BOX_ESSENCE)
			GET_ITEM_INFO(EQUIPMENT_APPEARANCE_ESSENCE)
			GET_ITEM_INFO(PLAYER_APPEARANCE_ESSENCE)
			GET_ITEM_INFO(DRIFT_BOTTLE_ESSENCE)
			//GET_ITEM_INFO(COMBAT_PET_CONFIG)
			//GET_ITEM_INFO(VIP_CONFIG)
			//GET_ITEM_INFO(MONSTER_AFFIX_COMBINATION_CONFIG)
			//GET_ITEM_INFO(MONSTER_AFFIX_RANDOM_PACK_CONFIG)
			//GET_ITEM_INFO(QTE_PLAYER_MONSTER_INTERACTION_CONFIG)
			//GET_ITEM_INFO(BATTLE_FIELD_CONFIG)
			//GET_ITEM_INFO(TEAM_POWER_UP_CONFIG)

			GET_ITEM_INFO(DIVINING_ITEM_ESSENCE)
			//GET_ITEM_INFO(WING_CONFIG)
			//GET_ITEM_INFO(MONSTER_AFFIX_COMBINATION_CONFIG)
			//GET_ITEM_INFO(LUCKY_DRAW_CONFIG)
			//GET_ITEM_INFO(NPC_BATTLE_FIELD_SERVICE)
			//GET_ITEM_INFO(EQUIPMENT_ENHANCE_COMBO_CONFIG)
			//GET_ITEM_INFO(NPC_IMPRINT_SERVICE)
			//GET_ITEM_INFO(MONSTER_KILL_LIMIT_CONFIG)
			//GET_ITEM_INFO(ITEM_EXCHANGE_CONFIG)
			//GET_ITEM_INFO(NPC_ITEM_EXCHANGE_SERVICE)
			GET_ITEM_INFO(EMOTION_ICON_PACK_ESSENCE)
			//GET_ITEM_INFO(DAILY_BENEFIT_TASK_CONFIG)
			//REVENGE_ITEM_ESSENCE,
			//STAR_FIELD_EXPLORE_CONFIG,
			//ATOM_GENERATION_CONFIG,
			//ATOM_COMBINE_CONFIG,
			//ATOM_CHAIN_CONFIG,
			//ATOM_REQUIREMENT_CONFIG,
			//COSMOS_STAR_FORCE_CONFIG,
			//STAR_FIELD_INCUBATION_CONFIG,
			GET_ITEM_INFO(EQUIPMENT_DYE_ESSENCE)
			GET_ITEM_INFO(RELIC_ESSENCE)
			//CLOAK_CONFIG,
			//RELIC_CONFIG,
			//RELIC_PROP_CONFIG,
			//RELIC_COMBO_CONFIG,
			//SUIT_TAG_MIGRATION_CONFIG,
			GET_ITEM_INFO(MARRIAGE_CERTIFICATE_ESSENCE)
			//NPC_FORCE_SELECT_SERVICE,
			//SAINT_WILLPOWER_CONFIG,
			//SURVEY_CONFIG,
			//SOUL_ARMOR_CONFIG,
			GET_ITEM_INFO(SOUL_ARMOR_GEM_ESSENCE)
			//DT_SOUL_ARMOR_GEM_COMBO_CONFIG,
			//DT_SERVER_BATTLE_CONFIG,
			GET_ITEM_INFO(SKILL_CLEANER_ESSENCE)
		}
	}
#undef GET_ITEM_INFO
}

AString MakeTempFilePath()
{
	//	获取临时文件名称
	AString strFullPath;

	while (true)
	{
		char szBuffer1[MAX_PATH];
		DWORD dwRetVal = GetTempPathA(MAX_PATH, szBuffer1);
		if (dwRetVal > MAX_PATH || dwRetVal==0)
			break;
		
		char szBuffer2[MAX_PATH];
		UINT bCreate = GetTempFileNameA(szBuffer1, NULL, 0, szBuffer2);
		if (!bCreate || bCreate==ERROR_BUFFER_OVERFLOW)
			break;

		strFullPath = szBuffer2;
		break;
	}

	return strFullPath;
}

void OpenInNotePad(const AString &strPath)
{
	SHELLEXECUTEINFOA si;
	ZeroMemory(&si, sizeof(si));

	si.cbSize = sizeof(si);
	si.fMask = SEE_MASK_NOCLOSEPROCESS;
	si.lpVerb = "open";
	si.lpFile = "notepad";
	si.lpParameters = strPath;
	si.nShow = SW_SHOW;
	ShellExecuteExA(&si);
	
	// 解压完成后才返回
	WaitForSingleObject(si.hProcess, INFINITE);
	CloseHandle(si.hProcess);
}

void CElementIconToolDlg::OnButton6() 
{
	//	导出 ID -> 物品名称对应表
	
	if (m_path2.IsEmpty())
	{
		CEdit *pEdit = (CEdit*)GetDlgItem(IDC_EDIT2);
		pEdit->SetFocus();
		pEdit->SetSel(0, -1);
		return;
	}

	AString strTempPath = MakeTempFilePath();
	if (strTempPath.IsEmpty())
	{
		MessageBoxA(NULL, "生成存放结果的临时文件失败", NULL, MB_OK);
		return;
	}
	
	AFile file;
	if (!file.Open(strTempPath, AFILE_NOHEAD | AFILE_CREATENEW | AFILE_TEXT))
	{
		MessageBoxA(NULL, "打开存放结果的临时文件失败", NULL, MB_OK);
		return;
	}
	
	// 读取 elements.data 文件
	if (!LoadElementData())
	{
		MessageBoxA(NULL, "加载elements.data失败.", NULL, MB_OK);
		file.Close();
		return;
	}
	
	AString strFormat = "%d	%s";
	AString strNewLine;
	
	unsigned int id(0);
	AString strName;
	if (GetFirstItemIDName(id, strName))
	{
		do
		{
			strNewLine.Format(strFormat, id, strName);
			file.WriteLine(strNewLine);			
		} while(GetNextItemIDName(id, strName));
	}
	
	ClearElementData();
	
	file.Flush();
	file.Close();
	
	OpenInNotePad(strTempPath);
}

void CElementIconToolDlg::OnEnChangeEdit3()
{
	// TODO:  If this is a RICHEDIT control, the control will not
	// send this notification unless you override the CDialog::OnInitDialog()
	// function and call CRichEditCtrl().SetEventMask()
	// with the ENM_CHANGE flag ORed into the mask.

	// TODO:  Add your control notification handler code here
	UpdateData(TRUE);
}
