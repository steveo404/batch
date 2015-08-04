@echo off
rem  Initial script created by SONeal 07/28/2014
rem  Last revised and tested for Windows 01/13/2015
rem  	                            ***        
rem	 This script pings the network to look up AD profiles for users
rem	 The script uses a list of users found in (UsersForScript.txt)
rem	 The script creates a folder on the users C: drive to store files
rem	 These files contain the status of the users AD profiles
rem	                              ***        
rem
echo.
echo Active User Script is running...please wait.
rem   
rem
SET Aud_OutPutDir="C:\Active_userlookup"
SET FileNm="UserStatusCheck"
del c:\Active_userlookup\UserStatusCheck-log.txt
rem md %Aud_OutputDir%
for /f %%S in (UsersForActiveScript.txt) do call :lkup %%S
rem
goto finish
rem	
rem	
:lkup
	set tab=	
	echo | set /p dummyName=%1%tab% >> %Aud_OutPutDir%\%FileNm%-log.txt
	net user %1 /domain | find /I "Account Active" >> %Aud_OutPutDir%\%FileNm%-log.txt
	goto :EOF
rem
:finish
	echo.
	echo Script is complete
	echo Results can be found in the UserStatusCheck-log file
rem
rem