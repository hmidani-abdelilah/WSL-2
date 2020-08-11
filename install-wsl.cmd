@ECHO OFF
SET RUNSTART=%date% @ %time%
REM ## Enable WSL-2
POWERSHELL.EXE -command dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart