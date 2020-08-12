@ECHO OFF
SET RUNSTART=%date% @ %time%

REM ## login as root and upgrade
ubuntu2004 config --default-user root
WSL apt update -y
WSL apt full-upgrade -y

REM ## install XFCE4 and XRDP and config port

WSL sudo apt install -y xfce4 xfce4-goodies
WSL sudo apt install -y xrdp
WSL sudo cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak
WSL sudo sed -i 's/3389/3390/g' /etc/xrdp/xrdp.ini
WSL sudo sed -i 's/max_bpp=32/#max_bpp=32\nmax_bpp=128/g' /etc/xrdp/xrdp.ini
WSL sudo sed -i 's/xserverbpp=24/#xserverbpp=24\nxserverbpp=128/g' /etc/xrdp/xrdp.ini
WSL echo xfce4-session > ~/.xsession