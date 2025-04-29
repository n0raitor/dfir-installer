### Installing Vol 2+3
https://seanthegeek.net/1172/how-to-install-volatility-2-and-volatility-3-on-debian-ubuntu-or-kali-linux/

Volatility is a powerful memory forensics tool. This guide will show you how to install Volatility 2 and Volatility 3 on Debian and Debian-based Linux distributions, such as Ubuntu and Kali Linux.

With Volatility, you can read memory/RAM captures and determine all sorts of things about the state of a system when the memory capture was made, including, but not limited to:

- Cached files
- Cached RSA private/public keys
- Clipboard contents
- Command history
- Driver/kernel module details
- Keyboard buffer contents
- Open sockets
- Registry contents
- Running processes
- [Shellbags](https://medium.com/ce-digital-forensics/shellbag-analysis-18c9b2e87ac7)

Unfortunately, most of these features/plugins only apply to memory captures of systems running Windows.

## Volatility 2 vs Volatility 3


### Quick install (local user):
```bash
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
```


### Extended Install (Detailled Instructions but Fix at the end needed for vol.py and vol2.py setup)

Volatility 2 is written for Python 2. Python 2 reached End of Life (EOL) in 2020. Volatility 3 is written for Python 3, and is much faster. However, Volatility 3 currently does not have anywhere near the same number of plugins/features as Volatility 2, so is is best to install both versions side-by-side and use whichever version is best suited for a particular task, which for now is most likely Volatility 2.

## Install system dependencies

```
sudo apt install -y build-essential git libdistorm3-dev yara libraw1394-11 libcapstone-dev capstone-tool tzdata
```

## Install pip for Python 2

```
sudo apt install -y python2 python2.7-dev libpython2-dev
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
sudo python2 get-pip.py
sudo python2 -m pip install -U setuptools wheel
```

## Install Volatility 2 and its Python dependencies

To install system-wide for all users, use the `sudo` command in front of the `python2` commands.

```
python2 -m pip install -U distorm3 yara pycrypto pillow openpyxl ujson pytz ipython capstone
sudo python2 -m pip install yara
sudo ln -s /usr/local/lib/python2.7/dist-packages/usr/lib/libyara.so /usr/lib/libyara.so
python2 -m pip install -U git+https://github.com/volatilityfoundation/volatility.git
```

## install pip for Python 3

```
sudo apt install -y python3 python3-dev libpython3-dev python3-pip python3-setuptools python3-wheel
```

## Install Volatility 3 and its Python dependencies

To install system-wide for all users, use the `sudo` command in front of the `python3` commands.

```
python3 -m pip install -U distorm3 yara pycrypto pillow openpyxl ujson pytz ipython capstone
python3 -m pip install -U git+https://github.com/volatilityfoundation/volatility3.git
```

## Adding your user bin to your PATH

Installing Volatility as a user instead of as `root` allows you to install Volatility and its dependencies without polluting your system’s Python environment. Installed commands are not in your `PATH` by default, so if you try running `vol.py` (Volatility 2) or `vol`/`volshell` (Volatility 3) in your shell, the command will not be found.

To fix this you need to add `/home/username/.local/bin` to your the `PATH`, replacing `username` with your actual username. The process for doing this varies, depending which shell you are using.

### bash (The default shell)

1. Open a terminal or SSH session
2. Make sure you are in a `bash` shell. If not, type `bash` and hit enter
3. Type the following commands and press enter after each line (replace `username` with your actual username)  
```
echo 'export PATH=/home/username/.local/bin:$PATH' >> ~/.bashrc  
```


### fish (My personal favorite shell)

1. Open a terminal or SSH session
2. Make sure you are in a `fish` shell. If not, type `fish` and hit enter
3. Type the following commands and press enter after each line (replace `username` with your actual username)  
    `mkdir -p ~/.config/fish`  
    `echo 'set -x PATH /home/username/.local/bin $PATH' >> ~/.config/fish/config.fish`  
    `. ~/.config/fish/config.fish`

### ksh or sh

1. Open a terminal or SSH session
2. Make sure you are in a `ksh` or `sh` shell. If not, type `ksh` or `sh` and hit enter
3. Type the following commands and press enter after each line (replace `username` with your actual username)  
    `echo 'export PATH=/home/username/.local/bin:$PATH' >> ~/.profile`  
    `. ~/.profile`

### zsh

1. Open a terminal or SSH session
2. Make sure you are in a `zsh` shell. If not, type `zsh` and press enter
3. Type the following commands and press enter after each line (replace `username` with your actual username)  
    `echo 'export PATH=/home/username/.local/bin:$PATH' >> ~/.zshrc`  
    `. ~/.zshrc`


Own Fixes:
```bash
cd ~/.local/bin
mv vol.py vol2.py
cd ~
git clone https://github.com/volatilityfoundation/volatility3.git
cd volatility3/
pip3.10 install -r requirements.txt
alias vol.py="python3 ~/volatility3/vol.py"
```