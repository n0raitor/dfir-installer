sudo apt update -y && sudo apt upgrade -y
cd ~
read -p "Use \"No Config\" on Postfix Config! Press Enter to Continue."
asudo pt-get update -y
sudo apt-get install -y --no-install-recommends g++ cmake make libpcap-dev
echo 'deb http://download.opensuse.org/repositories/security:/zeek/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/security:zeek.list
curl -fsSL https://download.opensuse.org/repositories/security:zeek/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/security_zeek.gpg > /dev/null
sudo apt update -y
sudo apt install zeek-6.0 -y
