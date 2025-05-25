[ReplaceVistaIcon.exe]
替换客户端图标小工具,由于VS2005不支持Vista Icons, link时会报错
"error RC2176: old dib in res\XXXXX.ico; pass it through SDKPAINT"
所以在Post-Build Event调用这个小工具替换图标,在Vista和Win7下实现跟好的图标效果
IDE升级到VS2008就可以不使用该工具
http://www.codeguru.com/cpp/g-m/bitmap/icons/article.php/c11961/Using-Windows-Vista-Icons.htm

[PckEditor.exe]
解包工具, 查看XXX.PCK文件内容

[AnalyzeClientMemory.exe]
分析客户端内存分配调用的小工具, 在客户端命令行执行memory_dump, 会输出两个文件
默认在客户端目录下导出memory_dump.txt和memory_dump.txt.addi
导出时间较长,请耐心等待,只有debug版可用
用该工具打开memory_dump.txt就可以查看内存分配情况

