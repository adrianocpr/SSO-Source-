#ifndef _FFMPEG_VIDEO_DECODER_H_
#define _FFMPEG_VIDEO_DECODER_H_

#include <vector>
#include <list>
#include "VideoDecoder.h"


struct AVFormatContext;
struct AVStream;
struct AVCodecContext;
struct AVCodec;
struct AVFrame;
struct AVPacket;
struct AVRational;
struct SwsContext;

namespace SMediaPlayer
{

typedef std::vector<int>	Index_Array;
class CFFMpegVideoDecoder : public CVideoDecoder
{
public:
	CFFMpegVideoDecoder();
	~CFFMpegVideoDecoder();

//数据
public:
	struct Frame
	{
		Frame()
			: pVideoBuffer(NULL)
			, nTimeStamp(0)
			, fPts_Time(0)
		{

		}

		unsigned char*	pVideoBuffer;	
		__int64			nTimeStamp;		
		double			fPts_Time;		
	};
	typedef std::list<Frame*>		Frame_List;

	class Frame_Queue
	{
	public:
		Frame_Queue(int nWidth,int nHeight,int nPixelFormat,bool bHasAudio,double fFPS);
		~Frame_Queue();

	//数据
	public:
	private:
		int				m_nFrameNum;				

		int				m_nWidth;					
		int				m_nHeight;					
		int				m_nPixelFormat;				
		size_t			m_nNumVideoBytes;
		bool			m_bHasAudio;
		double			m_fFPS;

		Frame_List		m_aAllFrames;				
		Frame_List		m_aUsedFrames;				
		Frame_List		m_aFreeFrames;				

		CRITICAL_SECTION m_csReadWrite;				

		bool			m_bFirstFrame;				
		bool			m_bReadPacketIsEnd;

		double			m_fLastGetTime;
		double			m_fLastFrameTime;			
		double			m_fLastDelayTime;			

		double			m_fFrameTimer;

		static double	ms_fFixedDelay;				

	//操作
	public:
		bool		Init(int nFrameNum = 20);
		void		Release();
		void		Clear();

		bool		AddFrameBack(AVFrame* pFrame,__int64 nTimeStamp,double fTime);
		bool		GetFrameBuf(double fTime,unsigned char* pBuf,size_t nSize,double& fDelay,bool bReadPacketIsEnd,bool& bIsEnd);

		bool		GetSeekFirstFrame(unsigned char* pBuf,size_t nSize,double& fCurTime);
		bool		NeedToDecode();
		bool		FrameIsDone();

	private:
		bool		_initQeue(int nFrameNum);
		Frame*		_newFrame();
	};

	class Sample_Queue
	{
	public:
		Sample_Queue(int nBytesPerSample,int nChannels);
		~Sample_Queue();

	//数据
	public:
	protected:
		int				m_nBytesPerSample;			
		int				m_nChannels;				

		unsigned char*	m_pAudioBuffer;				
		size_t			m_nNumAudioBytes;			

		size_t			m_nDataReadPos;				
		size_t			m_nDataWritePos;			

		size_t			m_nDataReadNum;				
		size_t			m_nDataWriteNum;			

		bool			m_bReadPacketIsEnd;			
		bool			m_bPlayIsEnd;				

		CRITICAL_SECTION m_csReadWrite;				

	//操作
	public:
		bool		Init();
		void		Release();
		void		Clear();

		bool		AddSampleBack(AVFrame* pFrame);
		bool		GetSampleBuf(unsigned char* pBuf,size_t& nSize,bool bReadPacketIsEnd,bool& bEnd);

		bool		NeedToDecode();
		bool		SampleIsDone();	
	};

	typedef std::list<AVPacket*>	 PacketList;

	class Packet_Queue
	{
	public:
		Packet_Queue();
		~Packet_Queue();

	//数据
	public:
	protected:
		PacketList		 m_aPactets;	
		CRITICAL_SECTION m_csReadWrite;	

	//操作
	public:
		void			PushPacket(AVPacket* p);
		void			PushPackets(Packet_Queue& aPQ);
		AVPacket*		PopPacket();
		int				GetSize();

		void			Release();
		bool			IsEmpty();
	};

protected:
	AVFormatContext*	m_pFormatCtx;
	AVCodecContext*		m_pVideoCodecCtx;
	AVCodec*			m_pVideoCodec;		
	AVFrame*			m_pFrameVideo;		
	AVFrame*			m_pFrameVideoRGB24;
	AVRational*			m_pVideoTimeBase;
	size_t				m_nNumVideoBytes;
	unsigned char*		m_pVideoBuffer;
	unsigned char*		m_pVideoBuffer_Show;

	AVCodecContext*		m_pAudioCodecCtx;
	AVCodec*			m_pAudioCodec;
	AVFrame*			m_pFrameAudio;
	AVRational*			m_pAudioTimeBase;
	size_t				m_nNumAudioBytes;
	unsigned char*		m_pAudioBuffer;

	AVRational*			m_pTimeBase;

	SwsContext*			m_pSwsContext;

	Index_Array			m_aVideoStreams;
	Index_Array			m_aAudioStreams;

protected:
	static bool			ms_bIsRegisterCodec;

private:
	Frame_Queue*		m_pFrameQueue;
	Sample_Queue*		m_pSampleQueue;

	Packet_Queue		m_aVideoQueue;
	Packet_Queue		m_aAudioQueue;

	CRITICAL_SECTION	m_csReadBuffer;

	VolatileValue<bool>	m_bIsToExit;
	VolatileValue<bool>	m_bIsReadPacketEnd;				
	VolatileValue<bool>	m_bIsBuffered;					
	VolatileValue<bool>	m_bIsPaused;					
	VolatileValue<bool>	m_bAlreadyPaused;
	VolatileValue<bool>	m_bIsLoop;
	VolatileValue<bool>	m_bIsLoopFinished;

	bool				m_bIsPlayDone;					

	int					m_nMinVideoPacketNum;			
	int					m_nMinAudioPacketNum;			

	int					m_nMinLeftVideoPacketNum;		
	int					m_nMinLeftAudioPacketNum;		

	int					m_nMinDecodeVideoFrameNum;		
	int					m_nMinDecodeAudioFrameNum;		

	HANDLE				m_hThread;

	bool		_needToReadFile();
	bool		_readPacket();
	bool		_needToDecodeVideo();
	bool		_decodeVideo();
	bool		_needToDecodeAudio();
	bool		_decodeAudio();
	bool		_playIsDone();		
	__int64		_getFrameTimeStamp(AVPacket* pPkt);

	static DWORD WINAPI	_thread_readfile(void* pArg);
	DWORD		thread_readfile();

//操作
public:	
	static bool			IsRegisterCodec();
	static bool			RegisterCodec();
	static bool			UnRegisterCodec();

protected:
	bool				SelectVideoStream(int nStream);
	bool				SelectAudioStream(int nStream);

public:
	virtual	bool		Init(const char* szVideoPath,Video_Finish_CallBack pVideoFinishCall,void* pUserData,Media_Loop_CallBack pML,void* pLML_UD);
	virtual void		Release();
	virtual	bool		Reset(bool bSeekTo0 = true);

	virtual float		GetFrameRate();
	virtual bool		GetIsPlayDone()		{ return m_bIsPlayDone; }
	virtual bool		GetIsBuffered()		{ return m_bIsBuffered; }
	virtual bool		GetIsLoop()			{ return m_bIsLoop; }
	virtual void		SetIsLoop(bool b)	{ m_bIsLoop = b; }

	virtual unsigned char*	GetFrameBuf()	{ return m_pVideoBuffer_Show; }
	virtual size_t		GetVideoBufSize() 	{ return m_nNumVideoBytes; }

	virtual double		CaculateTimeByVideoStamp(__int64 nTimeStamp);
	virtual double		CaculateTimeByAudioSamples(__int64 nSampleIndex);
	virtual __int64		CaculateSamplesByAudioTime(double fTime);

	virtual bool		ReadOneFrame(double fTime,bool& bEnd,double& fDelay);
	virtual bool		ReadBatchSamples(unsigned char* pBuf,size_t& nSize,bool& bEnd);

	virtual bool		SeekTo(double fTime);
	virtual bool		MakeSeekToFirstFrame(double& fCurTime);			

private:
	__int64				_caculateVideoStampByTime(double fTime);
	bool				_seekTo(__int64 nTimeStamp);
	bool				_getNextFrameVideo(__int64& nTimeStamp,Packet_Queue& aVideoQueue,Packet_Queue& aAudioQueue);
	bool				_loopproc();

	int					_getSampleBits(int nType);

	void				_setVideoStreamParam(AVStream* pVS);
	void				_setAudioStreamParam(AVStream* pAS);
};

}	//end namespace SMediaPlayer

#endif