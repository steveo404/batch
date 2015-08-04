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
SET x = 0
SET date=%date:~-4%%date:~4,2%%date:~7,2%
SET Aud_OutPutDir=C:\CountRecords\
IF EXIST C:\CountRecords\ (
	goto skipfilecreate
)
md %Aud_OutputDir%
:skipfilecreate
echo Script is running...
cls
for /f %%S in (UsersForScript.txt) do call :lkup
goto finish
rem
rem
:lkup
	SET /a x = x + 1
	cls
	echo %x%
	goto :EOF
rem
rem
:finish
	echo.
	echo Script is complete
	echo Results can be found in the UserStatusCheck-log file
	pause
rem