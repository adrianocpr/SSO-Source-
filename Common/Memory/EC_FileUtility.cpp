
#include "EC_FileUtility.h"
#include <windows.h>

static const size_t NET_DISK_RW_MAX_SIZE = 1024*1024;	// ��ʼһ������д����
static const DWORD IO_TIMEOUT_ERROR_COUNT = 120000;		// ��д��ʱʱ��

bool CECFileWrite(const void* buffer, const size_t num_byte, FILE* stream)
{
	if (!stream || !buffer)
	{
		printf("Write Param ERROR! pBuffer:%d, fp:%d, FileSize:%d\n\n", (void*)buffer, (void*)stream, num_byte);
		return false;
	}

	const long lBeginOffset = ftell(stream);
	if (lBeginOffset==-1L)
	{
		printf("ftell ERROR, check whether devices support file seeking!!\n\n");			
		return false;
	}

	const LPBYTE pBuf = (LPBYTE)buffer; 
	size_t sizeMaxOnceWrite = NET_DISK_RW_MAX_SIZE;
	DWORD dwStartTimeCnt = GetTickCount();
	DWORD dwOffset = 0;
	while (dwOffset<num_byte)
	{
		DWORD dwWrite = min(num_byte-dwOffset, sizeMaxOnceWrite);
		DWORD dwActuallyWrite = fwrite(pBuf+dwOffset, 1, dwWrite, stream);
	
		if (dwActuallyWrite==dwWrite)
		{
			// д��ɹ�
			dwOffset += dwWrite;
			dwStartTimeCnt = GetTickCount();
		}
		else
		{
			if ((int(GetTickCount()-dwStartTimeCnt))>IO_TIMEOUT_ERROR_COUNT)
			{
				// ����ָ��ʱ��û��д��ɹ�
				printf("Write ERROR: SIZE:%d, OFFSET:%d, TRY_WRITE:%d\n\n", num_byte, dwOffset, dwWrite);
				return false;
			}

			// ����һ�����д������
			if (sizeMaxOnceWrite>=2)
			{
				sizeMaxOnceWrite >>= 1;
			}

			// ���ļ���ʶ��λ
			if (fseek(stream, lBeginOffset+dwOffset, SEEK_SET))
			{
				printf("fseek ERROR, check whether devices support file seeking!!\n\n");			
				return false;
			}			
		}
	}

	return true;
}

bool CECFileRead(void* buffer, const size_t num_byte, FILE* stream)
{
	if (!stream || !buffer)
	{
		printf("Read Param ERROR! pBuffer:%d, fp:%d, FileSize:%d\n\n", (void*)buffer, (void*)stream, num_byte);
		return false;
	}
 
	const long lBeginOffset = ftell(stream);
	if (lBeginOffset==-1L)
	{
		printf("ftell ERROR, check whether devices support file seeking!!\n\n");			
		return false;
	}

	LPBYTE pBuf = (LPBYTE)buffer; 
	size_t sizeMaxOnceRead = NET_DISK_RW_MAX_SIZE;
	DWORD dwStartTimeCnt = GetTickCount();
	DWORD dwOffset = 0;
	while (dwOffset<num_byte)
	{
		DWORD dwRead = min(num_byte-dwOffset, sizeMaxOnceRead);
		DWORD dwActuallyRead = fread(pBuf+dwOffset, 1, dwRead, stream);

		if (dwActuallyRead==dwRead)
		{
			// ��ȡ�ɹ�
			dwOffset += dwRead;
			dwStartTimeCnt = GetTickCount();
		}
		else
		{
			if ((int(GetTickCount()-dwStartTimeCnt))>IO_TIMEOUT_ERROR_COUNT)
			{
				// ����ָ��ʱ��û�ж�ȡ�ɹ�
				printf("Read ERROR: SIZE:%d, OFFSET:%d, TRY_READ:%d\n\n", num_byte, dwOffset, dwRead);
				return false;
			}

			// ����һ������ȡ����
			if (sizeMaxOnceRead>=2)
			{
				sizeMaxOnceRead >>= 1;
			}

			// ���ļ���ʶ��λ
			if (fseek(stream, lBeginOffset+dwOffset, SEEK_SET))
			{
				printf("fseek ERROR, check whether devices support file seeking!!\n\n");			
				return false;
			}			
		}
	}

	return true;
}