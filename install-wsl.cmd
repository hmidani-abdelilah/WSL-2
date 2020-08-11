@ECHO OFF
SET RUNSTART=%date% @ %time%
REM ## Enable WSL-2

POWERSHELL.EXE -command dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
POWERSHELL.EXE -command dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

ECHO plase reboot the machine and run the script again or  
PAUSE

REM ## set-default-version 2 WSL

POWERSHELL.EXE -command wsl --set-default-version 2

REM ## download kernel linux and install 

ECHO Downloading Kernel for WSL (or using local copy if available)
IF NOT EXIST C:\Windows\system32\wsl.msi POWERSHELL.EXE -command Invoke-WebRequest -Uri https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi  -OutFile wsl.msi
ECHO install kernel ....
REM ## install the kernel

msiexec.exe /i wsl.msi  /quiet /norestart  /L c:\install-log.txt 
ECHO the log file in: c:\install-log.txt

REM ## delete the package
DEL wsl.msi

REM ## Get install names and port numbers
ECHO WSL for Ubuntu 20.04  
SET DISTRO=ubuntu2004& SET /p DISTRO=Enter a unique name for the distro or hit Enter to use default [WSL-2]: 
SET RDPPRT=3390& SET /p RDPPRT=Enter port number for xRDP traffic or hit Enter to use default [3390]:
