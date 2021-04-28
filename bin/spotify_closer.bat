@echo off

:: ### This script is used to close spotify after startup ###
:: # Please set your spotify settings to start up spotify minimized and close to tray #
:: # This script will only kill the opened desktop window and not spotify running in tray #

:: # Delay in seconds to wait before execution. Set this to match you startup precedure to make sure the window is open when this script runs #

set delay="2"


:: ### Do not change anthing down below unless you know what your doing! ##

ping -n %delay% localhost > nul

taskkill /IM spotify.exe

exit