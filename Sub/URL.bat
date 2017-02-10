@echo off
setlocal EnableDelayedExpansion
set end="
set scan=0
cd.>Set\url.txt
findstr "objURL" Set\read.html >Set\read.txt
(for /l %%a in (0,0,1) do (
  set /a scan+=1
  set /p input=
  for %%b in (!input!) do (
    set read=%%b
    if not "!first!"=="" (
      for /f %%c in ("!read!") do (
        set second=%%c
        if not "!first!!second:~0,-2!"=="" echo !first!!second:~0,-2! >>Set\url.txt
        set scan=0
      )
      set first=
    )
    if "!read:~1,6!"=="objURL" (
      if "!read:~-1!"=="!end!" (
        if not "!read:~10,-1!"=="" echo !read:~10,-1! >>Set\url.txt
        set scan=0
      ) else (
        set first=!read:~10!
      )
    )
  )
  if "!scan!"=="10" exit
))<Set\read.txt