@echo off
rem  Initial script created by SONeal 01/14/2015
rem  Last revised and tested for Windows 01/14/2015
echo.                               ***        
echo This script pings the network to look up computers and check if active
echo The script uses a list of computers found in (ComputersForScript.txt)
echo The script creates a folder on the users C: drive to store files
echo.                               ***        
echo.
echo CAUTION! Test scripts and software prior to production use.
pause
echo.
echo.
rem   
rem
SET date=%date:~-4%%date:~4,2%%date:~7,2%
SET Aud_OutPutDir=C:\aud_computerlookup%date%\
IF EXIST C:\aud_computerlookup%date%\ (
	del c:\aud_computerlookup%date%\ComputerList.txt
	goto skipfilecreate
)
md %Aud_OutputDir%
:skipfilecreate
echo Script is running...
for /f %%S in (ComputersForScript.txt) do call :lkup %%S
goto finish
rem
rem
:lkup
	set tab=	
	echo | set /p dummyName=%1%tab% >> %Aud_OutPutDir%ComputerList.txt
	ping -n 1 %1 | find /I "Reply from" >> %Aud_OutPutDir%ComputerList.txt
	goto :EOF
rem
rem
:finish
	echo.
	echo Script is complete
	echo Results can be found in the UserStatusCheck-log file
rem