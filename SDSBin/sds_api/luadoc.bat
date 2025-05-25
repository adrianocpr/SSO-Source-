@echo off
@cd..
@.\sds_api\luadoc\lua.exe ".\sds_api\luadoc\luadoc_start.lua" -d "doc" -f "sds_api\luadoc_list.lua" *
