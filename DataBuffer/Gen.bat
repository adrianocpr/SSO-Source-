@echo 生成相关数据代码
@for %%i in (*.proto) do protoc.exe  --cpp_out=. %%i
@pause