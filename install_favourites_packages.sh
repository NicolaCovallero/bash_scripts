#!/bin/sh
# Run this script with sudo permissions

# add ppa sites
sudo add-apt-repository ppa:mystic-mirage/pycharm

# add key for opera
sudo sh -c 'echo "deb http://deb.opera.com/opera/ stable non-free" >> /etc/apt/sources.list.d/opera.list'
sudo sh -c 'wget -O - http://deb.opera.com/archive.key | apt-key add -'

# update
sudo apt-get update


# apt-get install
sudo apt-get install git pycharm-community cmake 
sudo apt-get install libeigen3 
sudo apt-get install nautilus-image-converter nautilus-image-manipulator 
sudo apt-get install terminator 
sudo apt-get install doxygen 
sudo apt-get install texlive texmaker 


# install gcc-6 g++-6
sudo apt-get update && \
sudo apt-get install build-essential software-properties-common -y && \
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
sudo apt-get update && \
sudo apt-get install gcc-snapshot -y && \
sudo apt-get update && \
sudo apt-get install gcc-6 g++-6 -y && \
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 60 --slave /usr/bin/g++ g++ /usr/bin/g++-6 && \
sudo apt-get install gcc-4.8 g++-4.8 -y && \
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 60 --slave /usr/bin/g++ g++ /usr/bin/g++-4.8;

################################ debian packages ################################
################################# download ################################
cd ~/Downloads

wget -O vcode.deb "https://go.microsoft.com/fwlink/?LinkID=760868"  			# vscode
# to get the link start he dfownload, then stopi and right click on it and select "Copy download link"
wget "https://download1.operacdn.com/pub/opera/desktop/55.0.2994.56/linux/opera-stable_55.0.2994.56_amd64.deb" # opera
wget https://repo.skype.com/latest/skypeforlinux-64.deb #skype
 

################################# install ################################
sudo dpkg -i vcode.deb			# vscode
sudo dpkg -i opera*.deb			# opera
sudo dpkg -i skypeforlinux-64.deb

################################# Install dependencies ################################
sudo apt-get install -f

################################################################################# 


## extra messages
echo " You must choose which gcc use by default: sudo update-alternatives --config gcc"
