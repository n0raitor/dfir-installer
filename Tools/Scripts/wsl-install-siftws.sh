sudo apt update -y && sudo apt upgrade -y
cd ~
wget https://github.com/ekristen/cast/releases/download/v0.15.2/cast-v0.15.2-linux-amd64.deb
sudo dpkg -i cast-v0.15.2-linux-amd64.deb
sudo cast install --mode=server teamdfir/sift-saltstack
sudo apt install plaso -y