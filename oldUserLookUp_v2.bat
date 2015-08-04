echo off
cls
rem  Initial script created by SONeal 07/28/2014
rem  Last revised and tested for Windows 08/27/2014
echo                               ***        
echo This script pings the network to look up AD profiles for users
echo The script uses a list of users found in (UsersForScript.txt)
echo                               ***        
echo
rem pause
cls
echo CAUTION! Test scripts and software prior to production use.
echo
echo
rem   
rem
SET Aud_OutPutDir=C:\AD_userlookup\
Set Trigger_Dir=C:\Trigger\
md %Aud_OutputDir%
md %Trigger_Dir%
for /f %%S in (UsersForScript.txt) do call :lkup %%S
rem
goto :End
rem
:lkup
net user %1 /domain > %Aud_OutPutDir%User_list_%1.txt
rem
goto :EOF
rem
:End
rem ***** END SCRIPT *****
echo hello world > c:\Trigger\helloworld.txt
echo.
rem pause
exit
rem
rem
:EOF