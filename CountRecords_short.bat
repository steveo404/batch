@echo off
rem  Initial script created by SONeal 07/28/2014
rem  Last revised and tested for Windows 01/13/2015
echo.                               ***        
echo This script pings the network to look up AD profiles of users
echo The script uses a list of users found in (UsersForScript.txt)
echo The script creates a folder on the users C: drive to store files
echo These files contain the AD profiles     
echo.
echo CAUTION! Test scripts and software prior to production use.
pause
echo.
rem   
rem
for /f %%C in ('Find /V /C "" ^< c:\Scripts\UsersForScript.txt') do set Count=%%C
echo The file has %Count% lines.
pause
rem