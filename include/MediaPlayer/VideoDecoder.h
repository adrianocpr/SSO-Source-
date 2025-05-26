#ifndef _VIDEO_DECODER_H_
#define _VIDEO_DECODER_H_

#include <vector>
#include <string>
#include "MediaPlayerExp.h"
#include "MediaDefine.h"

namespace SMediaPlayer
{

class _MediaPlayer_Export CVideoDecoder
{
public:
	CVideoDecoder();
	virtual ~CVideoDecoder();

//Êý¾Ý
public:
	struct VideoStream_Param
	{
		std::string		strCodec;

		int				nCodecType;			
		int				nVideoWidth;		
		int				nVideoHeight;		
		float			fFrameRate;			
		float			fBitsRate;			
	};
	template class _MediaPlayer_Export std::allocator<VideoStream_Param>;
	template class _MediaPlayer_Export std::vector<VideoStream_Param>;
	typedef std::vector<VideoStream_Param>	VideoStream_Param_Array;

	struct AudioStream_Param
	{
		std::string		strCodec;

		int				nCodecType;			
		int				nBitsPerSample;		
		int				nChannelNum;		
		int				nSamplesPerSec;		
	};										
	template class _MediaPlayer_Export std::allocator<AudioStream_Param>;
	template class _MediaPlayer_Export std::vector<AudioStream_Param>;
	typedef std::vector<AudioStream_Param>	AudioStream_Param_Array;

protected:
	char			m_szVideoPath[MAX_PATH];

	VideoStream_Param_Array	m_aVideoStreamParam;
	AudioStream_Param_Array	m_aAudioStreamParam;

	int				m_nVideoWidth;
	int				m_nVideoHeight;

	double			m_fVideoDuration;
	double			m_fAudioDuration;

	__int64			m_nCurFrame;
	__int64			m_nCurSample;

	__int64			m_nStartFrame;
	__int64			m_nStopFrame;

	__int64			m_nStartSample;
	__int64			m_nStopSample;

	int				m_nVideoStreamNum;
	int				m_nAudioStreamNum;

	int				m_nCurVideoStream;
	int				m_nCurAudioStream;

	int				m_nAudioChannelNum;
	int				m_nAudioSamplePerSec;
	int				m_nAudioBitsPerSample;
	int				m_nAudioBytesPerSample;

	Video_Finish_CallBack	m_pVideoFinishCall;
	void*			m_pUserData;
	
	Media_Loop_CallBack		m_pMediaLoopCall;
	void*			m_pML_UserData;

	Media_Log		m_pFuncLog;

	bool			m_bHasAudioCard;

//²Ù×÷
public:	
	VideoStream_Param_Array&	GetVideoStreamParam()	{ return m_aVideoStreamParam; }
	AudioStream_Param_Array&	GetAudioStreamParam()	{ return m_aAudioStreamParam; }

	int				GetVideoWidth()	const				{ return m_nVideoWidth; }	
	int				GetVideoHeight() const				{ return m_nVideoHeight; }
	double			GetVideoDuration() const			{ return m_fVideoDuration; }
	double			GetAudioDuration() const			{ return m_fAudioDuration; }

	__int64			GetCurFrame() const					{ return m_nCurFrame; }
	__int64			GetCurSample() const				{ return m_nCurSample; }

	__int64			GetStartFrame() const				{ return m_nStartFrame; }
	__int64			GetStopFrame() const				{ return m_nStopFrame; }
	__int64			GetTotalFrame() const				{ return m_nStopFrame; }

	__int64			GetStartSample() const				{ return m_nStartSample; }
	__int64			GetStopSample() const				{ return m_nStopSample; }
	__int64			GetTotalSample() const				{ return m_nStopSample; }

	int				GetVideoStreamNum() const			{ return m_nVideoStreamNum; }
	int				GetAudioStreamNum() const			{ return m_nAudioStreamNum; }

	int				GetCurVideoStream() const			{ return m_nCurVideoStream; }
	int				GetCurAudioStream() const			{ return m_nCurAudioStream; }

	int				GetAudioChannelNum() const			{ return m_nAudioChannelNum;     }
	int				GetAudioSamplePerSec() const		{ return m_nAudioSamplePerSec;   }
	int				GetAudioBitsPerSample() const		{ return m_nAudioBitsPerSample;  }
	int				GetAudioBytesPerSample() const		{ return m_nAudioBytesPerSample; }

	bool			HasAudio()							{ return m_nAudioStreamNum != 0; }

	void			SetMediaLogFunc(Media_Log pFunc)	{ m_pFuncLog = pFunc; }
	
	bool			HasAudioCard()						{ return m_bHasAudioCard; }
	void			SetHasAudioCard(bool b)				{ m_bHasAudioCard = b; }

public:
	virtual	bool	Init(const char* szVideoPath,Video_Finish_CallBack pVideoFinishCall,void* pUserData,Media_Loop_CallBack pML,void* pLML_UD);
	virtual void	Release();
	virtual	bool	Reset(bool bSeekTo0 = true) = 0;

	virtual float	GetFrameRate() = 0;
	virtual bool	GetIsPlayDone() = 0;
	virtual bool	GetIsBuffered() = 0;
	virtual bool	GetIsLoop()	= 0;
	virtual void	SetIsLoop(bool b) = 0;

	virtual unsigned char*	GetFrameBuf() = 0;
	virtual size_t	GetVideoBufSize() = 0;

	virtual double	CaculateTimeByVideoStamp(__int64 nTimeStamp) = 0;
	virtual double	CaculateTimeByAudioSamples(__int64 nSampleIndex) = 0;
	virtual __int64 CaculateSamplesByAudioTime(double fTime) = 0;

	virtual bool	ReadOneFrame(double fTime,bool& bEnd,double& fDelay) = 0;
	virtual bool	ReadBatchSamples(unsigned char* pBuf,size_t& nSize,bool& bEnd) = 0;

	virtual bool	SeekTo(double fTime) = 0;
	virtual bool	MakeSeekToFirstFrame(double& fCurTime) = 0;
};

}	//end namespace SMediaPlayer

#endif