@echo off
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::Powered by Byaidu:::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::@ bat吧:::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::请勿修改版权信息:::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::Powered by Byaidu:::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::@ bat吧:::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::请勿修改版权信息:::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::.
chcp 936 >nul
setlocal EnableDelayedExpansion
if exist Set\word.txt (
  set /p word=<Set\word.txt
  set piccount=0
  for /f %%a in ('dir /b Pic\') do set /a piccount+=1
  set /p choice=是否继续上次的下载^(!word! !piccount!张^)？[Y/N]
  if /i "!choice!"=="Y" (
    set /p page=<Set\page.txt
    cls
    type Set\log.txt
    goto loop
  )
  set /p choice=是否删除已下载的图片^(!word! !piccount!张^)？[Y/N]
  if /i "!choice!"=="Y" del /s /q Pic\*.* >nul 2>nul
)
set /p word=请输入下载内容：
(echo !word!)>Set\word.txt
set page=0
cls

:loop
Sub\curl -o Set\read.html -G -d tn=baiduimage -d ie=gb2312 --data-urlencode word=!word! -d pn=!page! "http://image.baidu.com/search/flip" >nul 2>nul&for /f "usebackq skip=10 delims=:" %%a in (%0) do if "%%a"=="." start /b /wait Sub\URL.bat&goto jump
:jump
set piccount=0
for /f %%a in ('dir /b Pic\') do set /a piccount+=1
title Download    !word! !piccount!张
for /f "delims=" %%a in (Set\url.txt) do (
  cd Pic\
  ..\Sub\curl -O "%%a" >nul 2>nul
  cd ..
  echo [ OK ][!time!] %%a
  (echo [ OK ][!time!] %%a)>>Set\log.txt
  set /a piccount+=1
  title Download    !word! !piccount!张
)
del /s /q Set\url.txt >nul 2>nul
set /a page+=20
(echo !page!)>Set\page.txt
goto loop
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::Powered by Byaidu:::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::@bat吧::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::请勿修改版权信息:::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::Powered by Byaidu:::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::@bat吧::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::请勿修改版权信息:::::::::::::::::::::::::::::::::::::::::::::