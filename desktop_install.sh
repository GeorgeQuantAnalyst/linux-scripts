#!/bin/bash -e

#title           :desktop_install.sh
#description     :Bash script to download and install user defined tools from Ubuntu repositories (apt-get and snap)
#author	         :Lucy
#date            :20220217
#version         :1.0.0
#usage           :bash desktop_install.sh
#bash_version    :5.0.17(1)-release
#====================================================================================================================

echo "Desktop install version 1.0.0"

echo "---------------------------------------------------------"
echo " Start install applications from package managers"
echo "---------------------------------------------------------"

# Console tools
sudo apt-get install -y mc
sudo apt-get install -y vim
sudo apt-get install -y git
sudo snap install htop
sudo apt-get install -y sox
sudo apt-get install -y ffmpeg
sudo snap install youtube-dl
sudo snap install curl
sudo apt-get install -y pandoc
sudo apt-get install -y texlive
sudo apt-get install -y texlive-latex-extra
sudo apt-get install -y lm-sensors
sudo apt-get install -y translate-shell
sudo apt-get install -y tree
sudo apt-get install -y jq

# Data analyse tools
sudo snap install tradingview
sudo snap install dbeaver-ce
sudo apt-get install -y python3-notebook jupyter jupyter-core
sudo apt install python3-pip
sudo pip3 install jupyterlab

# Other tools
sudo snap install vlc
sudo snap install spotify
sudo snap install p7zip-desktop
sudo snap install skype
sudo snap install discord
sudo apt-get install -y virtualbox
sudo apt-get install -y simplescreenrecorder
sudo snap install todoist

# Programming languages
# sudo snap install openjdk

# Programming tools
sudo snap install code --classic
sudo snap install pycharm-community --classic
sudo snap install postman

echo "---------------------------------------------------------"
echo " Finish install applications from package managers"
echo "---------------------------------------------------------"

echo "---------------------------------------------------------"
echo " Urls for apps out of package managers"
echo "---------------------------------------------------------"
echo "https://www.vmware.com/products/workstation-player/workstation-player-evaluation.html - vmware player"
echo "https://www.osboxes.org/lubuntu/ - lubuntu virtual for internet"
echo "https://www.binance.com/en/desktop-download"
