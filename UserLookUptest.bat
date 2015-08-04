@echo off
rem  Initial script created by SONeal 07/28/2014
rem  Last revised and tested for Windows 07/31/2014
echo.                               ***        
echo This script pings the network to look up AD profiles of users
echo The script uses a list of users found in (UsersForScript.txt)
echo The script creates a folder on the users C: drive to store files
echo These files contain the AD profiles
echo.                               ***        
echo.
echo CAUTION! Test scripts and software prior to production use.
pause
echo.
echo.
rem   
rem
SET date=%date:~-4%%date:~4,2%%date:~7,2%
SET Aud_OutPutDir=C:\aud_userlookup%date%\
IF EXIST C:\aud_userlookup%date%\ (
	goto skipfilecreate
)
md %Aud_OutputDir%
:skipfilecreate
echo Script is running...
for /f %%S in (UsersForScript.txt) do call :lkup %%S
goto finish
rem
rem
:lkup
	net user %1 /domain > %Aud_OutPutDir%User_list_%1.txt
	goto :EOF
rem
rem
:finish
	echo.
	echo Script is complete
	echo Results can be found in the UserStatusCheck-log file
rem