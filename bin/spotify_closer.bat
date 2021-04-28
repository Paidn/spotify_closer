@echo off
title Spotify Closer
:: ### This script is used to close spotify after startup ###
:: # Please set your spotify settings to start up spotify minimized and close to tray #
:: # This script will only kill the opened desktop window and not spotify running in tray #

set timer=0 
tasklist > nul

:WAIT
ping -n 1 -w 200 localhost > nul
set /a  timer = %timer% + 1
if %timer% GTR 50 (
  exit
) else (
  tasklist /FI "Spotify.exe" 2>NUL | find /I /N "Spotify.exe">NUL | if "%ERRORLEVEL%"=="0" (
    goto SPOKILL
  ) else (
    goto WAIT
  )
)

:SPOKILL
ping -n 1 -w 200 localhost
taskkill /IM Spotify.exe
exit