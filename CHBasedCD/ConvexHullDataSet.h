//////////////////////////////////////////////////////////////////////
//	Created by Niuyadong
//  2010-01-26
//  
//  
//////////////////////////////////////////////////////////////////////

#ifndef	_CONVEXHULLDATASET_H_
#define _CONVEXHULLDATASET_H_

#include <A3DVector.h>
#include <A3DGeometry.h>
#include <AArray.h>
#include "Face.h"
#include <vector.h>
#include <AFile.h>
#include <A3DFlatCollector.h>
#include "ConvexBrush.h"


#define CHF_FILE_MAGIC (unsigned int) (('c'<<24) | ('h' << 16) | ('f' << 8) | ('p'))
//-----------------------------------------------------------------------------------
//v1 ������������͹������								#define CHF_FILE_VERSION (unsigned int) (0x00000001)
//v2 ����model���Ƶ���͹�����ݣ���Ҫ���UMDs			#define CHF_FILE_VERSION (unsigned int) (0x00000002)
//v3     .chb��current version��                        #define CHF_FILE_VERSION (unsigned int) (0x00000003)                   
//-----------------------------------------------------------------------------------

//////////////////////////////////////////////////////////////////////////
// Version: 0x00000001
// ��ʼ��������
// �������ݸ�ʽ�������Ƹ�ʽ
//-------------------Head info-----------------------------
// 1 int �ļ�����
// 2 int �汾
// 3 int ģ������m
// ------------------ģ��1������---------------------------
// ͹������n
// ͹��1������
// ͹��2������
//	...		...
// ͹��n������
// ------------------ģ��2������---------------------------
// ͹������n
// ͹��1������
// ͹��2������
//	...		...
// ͹��n������
// ------------------...	...----------------------------
// ------------------...	...----------------------------
// ------------------ģ��m������---------------------------
// ͹������n
// ͹��1������
// ͹��2������
//	...		...
// ͹��n������
//////////////////////////////////////////////////////////////////////////
#define CHF_FILE_VERSION (unsigned int) (0x00000003)


namespace CHBasedCD
{

	struct CHF_HEADER
	{
		unsigned int nMagic;
		unsigned int nVersion;
		unsigned int nNumModel;
	};

	struct CHFSAVERESULT 
	{
		int nFaceNum ;
		int nVertNum ;
		int nCPNum ;

		CHFSAVERESULT()
		{
			nFaceNum = 0;
			nVertNum = 0;
			nCPNum = 0;
		}
	};

typedef abase::vector<CConvexHullData> ConvexHullDataVector;
typedef abase::vector<CConvexBrush*>    ConvexBrushVector;


struct  CHFMODEL
{
	char m_sName[128];
	ConvexHullDataVector m_aCHDatas;
};

struct CHBMODEL
{
	char m_sName[128];
	ConvexBrushVector m_pCHBrushes;//element is pointer here
};

typedef abase::vector<CHFMODEL> CHFModelVector;
typedef abase::vector<CHBMODEL> CHBModelVector;

class CConvexHullDataSet  
{
public:
	
	CConvexHullDataSet();
	virtual ~CConvexHullDataSet();

	void Render(A3DFlatCollector* pFC, float fScale = 1, const A3DMATRIX4* pTransMatrix=NULL, bool bRenderV=false, int SpecialFaceId = -1, DWORD dwVColor=0xffff0000, DWORD dwFColor=0xa0ffff00, const A3DVECTOR3& vRayDir=A3DVECTOR3(1.0f,1.0f,1.0f));
	
	//void Transform(const A3DMATRIX4& mtxTrans);

	bool Save(const char* szFileName,CHFSAVERESULT& res);
	//set bPrePareForRender true when need to Render it
	bool Load(const char* szFileName, bool bPrePareForRender, CHFSAVERESULT& res);

	bool AddModel(const CHBMODEL& model);
	bool AddModel(const CHFMODEL& model);
	int GetCHFVersion(){ return m_Header.nVersion;}
	int GetModelNum() const { return m_Header.nNumModel; }
	const A3DAABB& GetAABB() const{ return m_CHAABB;}

	//ע�⣺�����ִ洢��������ֻ�����UMDS��ģ�ͣ���������ģ���ǰ��մ����ϵ��ļ����ƴ洢�Ķ���A3DObject����m_strName ����ΪUMD�������������̲�������ecm3��������ָ�����û�й�������
	bool SaveModelConvexHullToFile(const char* szPath, const char* szModelName);
	CHFMODEL* GetCHFModelByName(const char* szModelName);
	CHFMODEL* GetCHFModelByIndex(int index);

	CHBMODEL* GetCHBModelByName(const char* szModelName);
	CHBMODEL* GetCHBModelByIndex(int index);

	void Release();

	CConvexHullDataSet(const CConvexHullDataSet& CHDataSet);
	CConvexHullDataSet& operator=(const CConvexHullDataSet& CHDataSet);

protected:
	void Assign(const CConvexHullDataSet& CHDataSet);

	CHFModelVector	m_aModels;//version 1 and version 2
	A3DAABB			m_CHAABB;
	CHF_HEADER		m_Header;

	CHBModelVector  m_CHBModels;//version 3
	
protected:

	bool LoadVersion1(AFile& file);
	bool LoadVersion2(AFile& file);
	bool LoadVersion3(AFile& file, bool bPrepareForRender);

};

}	// end namespace

#endif // _CONVEXHULLDATASET_H_
