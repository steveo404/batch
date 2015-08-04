@echo off
rem  Initial script created by SONeal 07/28/2014
rem  Last revised and tested for Windows 03/31/2015
rem  Lates changes made to remove date and creation of dated file
rem  This version is used by the IDEAscript
echo.                               ***        
echo This script pings the network to look up AD profiles of users
echo The script uses a list of users found in (UsersForScript.txt)
echo The script creates a folder on the users C: drive to store files
echo These files contain the AD profiles     
echo.
echo CAUTION! Test scripts and software prior to production use.
rem pause
echo.
rem
rem	Count the number of records in the file
for /f %%C in ('Find /V /C "" ^< c:\VisualBasic\UsersForScript.txt') do set Count=%%C
echo The file has %Count% lines.
rem pause
rem   
rem
SET Aud_OutPutDir=C:\AD_userlookup\
Set Trigger_Dir=C:\Trigger\
md %Aud_OutputDir%
md %Trigger_Dir%
echo Script is running...
for /f %%S in (UsersForScript.txt) do call :lkup %%S
goto finish
rem
rem
:lkup
	net user %1 /domain > %Aud_OutPutDir%User_list_%1.txt
	SET /a Count = Count - 1
	cls
	echo %Count%
	goto :EOF
rem
rem
:finish
	echo.
	echo hello world > c:\Trigger\helloworld.txt
	echo.
	echo Script is complete
	echo Results can be found in the UserStatusCheck-log file
rem
:EOF