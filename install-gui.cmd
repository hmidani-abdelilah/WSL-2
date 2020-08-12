@ECHO OFF
SET RUNSTART=%date% @ %time%

REM ## login as root and upgrade
ubuntu2004 config --default-user root
WSL apt update -y
WSL apt full-upgrade -y