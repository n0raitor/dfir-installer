sudo apt update -y && sudo apt upgrade -y
cd ~
sudo apt install -y build-essential git libdistorm3-dev yara libraw1394-11 libcapstone-dev capstone-tool tzdata
sudo apt install -y python2 python2.7-dev libpython2-dev
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
sudo python2 get-pip.py
sudo python2 -m pip install -U setuptools wheel
python2 -m pip install -U distorm3 yara pycrypto pillow openpyxl ujson pytz ipython capstone
sudo python2 -m pip install yara
sudo ln -s /usr/local/lib/python2.7/dist-packages/usr/lib/libyara.so /usr/lib/libyara.so
python2 -m pip install -U git+https://github.com/volatilityfoundation/volatility.git
sudo apt install -y python3 python3-dev libpython3-dev python3-pip python3-setuptools python3-wheel
cd ~/.local/bin
mv vol.py vol2.py
cd ~
git clone https://github.com/volatilityfoundation/volatility3.git
cd volatility3/
pip3.10 install -r requirements.txt
echo "alias vol.py='python3 ~/volatility3/vol.py'" >> ~/.bashrc
echo 'export PATH=~/.local/bin:$PATH' >> ~/.bashrc