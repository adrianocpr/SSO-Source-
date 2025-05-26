
// SDSNmdTool.cpp : Defines the class behaviors for the application.
//

#include "stdafx.h"
#include "SDSNmdTool.h"
#include "SDSNmdToolDlg.h"
#include "sdsNMD.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CSDSNmdToolApp

BEGIN_MESSAGE_MAP(CSDSNmdToolApp, CWinAppEx)
	ON_COMMAND(ID_HELP, &CWinApp::OnHelp)
END_MESSAGE_MAP()


// CSDSNmdToolApp construction

CSDSNmdToolApp::CSDSNmdToolApp()
{
	// TODO: add construction code here,
	// Place all significant initialization in InitInstance
}


// The one and only CSDSNmdToolApp object

CSDSNmdToolApp theApp;
static const char* s_szConfigFile = "nmd.cfg";


void RetrieveConfigInfo(const char * szFilePath)
{
	memset(&g_Config, 0, sizeof(NmdConfig));
	FILE * fp = NULL;
	fopen_s(&fp, szFilePath, "r");
	if (!fp)
		return;

	char line[1000];
	char * token;
	char seps[]   = " =\t\n";

	TCHAR szBuffer[MAX_PATH] = {0};

	while (fgets(line, 1000, fp))
	{
		char* nextToken = NULL;
		token = strtok_s(line, seps, &nextToken);

		if (!token || token[0] == '#')
		{
			continue;
		}

		if (strcmp(token, "work_dir") == 0)
		{
			token = strtok_s(NULL, seps, &nextToken);
			if (token)
			{
				strcpy(g_Config.szGamePath, token);
			}
		}
		else if (strcmp(token, "out_file") == 0)
		{
			token = strtok_s(NULL, seps, &nextToken);
			if (token)
			{
				strcpy(g_Config.szOutputFile, token);
			}
		}
		else if (strcmp(token, "from_pck") == 0)
		{
			token = strtok_s(NULL, seps, &nextToken);
			if (token)
				g_Config.bFromPck = (atoi(token) == 1);
		}
	}

	fclose(fp);
}

void SaveConfigInfo(const char * szFilePath)
{
	FILE* fp = fopen(szFilePath, "w");
	if (!fp)
		return;

	const char* pszDesc = "# config file for SDS nmd Tool\n";
	fwrite(pszDesc, strlen(pszDesc), 1, fp);

	fprintf(fp, "work_dir\t%s\n", g_Config.szGamePath);
	fprintf(fp, "out_file\t%s\n", g_Config.szOutputFile);
	fprintf(fp, "from_pck\t%d\n", g_Config.bFromPck);

	fclose(fp);
}

// CSDSNmdToolApp initialization

BOOL CSDSNmdToolApp::InitInstance()
{
	// InitCommonControlsEx() is required on Windows XP if an application
	// manifest specifies use of ComCtl32.dll version 6 or later to enable
	// visual styles.  Otherwise, any window creation will fail.
	INITCOMMONCONTROLSEX InitCtrls;
	InitCtrls.dwSize = sizeof(InitCtrls);
	// Set this to include all the common control classes you want to use
	// in your application.
	InitCtrls.dwICC = ICC_WIN95_CLASSES;
	InitCommonControlsEx(&InitCtrls);

	CWinAppEx::InitInstance();

	AfxEnableControlContainer();

	// Standard initialization
	// If you are not using these features and wish to reduce the size
	// of your final executable, you should remove from the following
	// the specific initialization routines you do not need
	// Change the registry key under which our settings are stored
	// TODO: You should modify this string to be something appropriate
	// such as the name of your company or organization
	SetRegistryKey(_T("Local AppWizard-Generated Applications"));

	RetrieveConfigInfo(s_szConfigFile);

	CSDSNmdToolDlg dlg;
	m_pMainWnd = &dlg;
	INT_PTR nResponse = dlg.DoModal();
	if (nResponse == IDOK)
	{
		// TODO: Place code here to handle when the dialog is
		//  dismissed with OK
	}
	else if (nResponse == IDCANCEL)
	{
		// TODO: Place code here to handle when the dialog is
		//  dismissed with Cancel
	}

	SaveConfigInfo(s_szConfigFile);


	// Since the dialog has been closed, return FALSE so that we exit the
	//  application, rather than start the application's message pump.
	return FALSE;
}
