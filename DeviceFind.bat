echo off
cls
rem  Initial script created by SONeal 07/22/2014
rem  Last revised and tested for Windows 07/22/2014
echo                               ***        
echo This script pings the network to determine if computers exist
echo The script uses a list of devices found in (CmptrList.txt)
echo                               ***        
echo
pause
cls
echo CAUTION! Test scripts and software prior to production use.
echo
echo
rem   
rem
SET date=%date:~-4%%date:~4,2%%date:~7,2%
SET Aud_OutPutDir=C:\aud_nslookup%date%\
md %Aud_OutputDir%
for /f %%S in (ComputerList.txt) do call :lkup %%S
rem
rem
:lkup
nslookup %1 > %Aud_OutPutDir%Aud_NS_list_%1.txt
rem
rem
rem