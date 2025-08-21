sudo apt update -y && sudo apt upgrade -y
cd ~
git clone https://github.com/volatilityfoundation/volatility3.git
cd volatility3/
sudo apt install -y python3 python3-dev libpython3-dev python3-pip python3-setuptools python3-wheel
pip3.10 install -r requirements.txt
echo "alias vol.py='python3 ~/volatility3/vol.py'" >> ~/.bashrc
echo 'export PATH=~/.local/bin:$PATH' >> ~/.bashrc