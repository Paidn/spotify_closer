@echo off
title Spotify Closer - Installer
:: ### This installer will install a script to close the opened spotify windows after startup ###
:: # Please tweak the duration waited before the script as this may depend on your personal startup procedure #
:: # This can be done in the script at %appdata%\Microsoft\Windows\Start Menu\Programs\Paidn\spotify_closer.bat #

echo #######################################################################################
echo ## This installer will install a script to automatically close spotify after startup ##
echo #######################################################################################
echo.
:METHOD
set /p build=Use y for install, u for uninstall and c for cancel [y/u/c]: 
echo.

if "%build%" == "y" goto INSTALL
  if "%build%" == "u" goto UNINSTALL
    if "%build%" == "c" goto CANCEL
	  GOTO METHOD

:INSTALL
echo.
echo Creating new Program Folder...
mkdir "%appdata%\Microsoft\Windows\Start Menu\Programs\Paidn"

echo.
echo Copying script to AppData...
copy /Y bin\spotify_closer.bat "%appdata%\Microsoft\Windows\Start Menu\Programs\Paidn\spotify_closer.bat" >nul 2>&1
copy /Y bin\spotify_closer.ico "%appdata%\Microsoft\Windows\Start Menu\Programs\Paidn\spotify_closer.ico" >nul 2>&1
copy /Y bin\spotify_closer.lnk "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\spotify_closer.lnk" >nul 2>&1

echo.
echo Installation successfull!
pause
exit

:UNINSTALL
echo.
echo Removing files...

del "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\spotify_closer.lnk" >nul 2>&1
rmdir /s /q "%appdata%\Microsoft\Windows\Start Menu\Programs\Paidn\"

echo.
echo Uninstall successfull!
pause
exit

:CANCEL
exit